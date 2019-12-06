class BroadcastSubmissionJob < ApplicationJob
  def perform(submission)
    test_run_html = ApplicationController.render(
      partial: "research/experiment_solutions/test_run",
      locals: { test_run: submission.test_run }
    )

    ops_status_html = ApplicationController.render(
      partial: submission.ops_status.to_partial_path,
      locals: { status: submission.ops_status }
    )

    ResearchSolutionChannel.broadcast_to(
      submission.solution,
      {
        opsStatus: submission.ops_status,
        opsStatusHtml: ops_status_html,
        testRunHtml: test_run_html,
      }
    )
  end
end
