local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.cfm', 'eclipse-cfm') {
  settings+: {
    description: "",
    name: "Eclipse Connector Fabric Manager",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('cfm') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Connector Fabric Manager provides infrastructure for managing virtualized dataspace connectors",
      has_discussions: true,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "sub_issues",
            "team_add"
          ],
          secret: "********",
        },
      ],
      rulesets: [
        orgs.newRepoRuleset('Standard') {
          allows_creations: true,
          include_refs+: [
            "~DEFAULT_BRANCH"
          ],
          required_pull_request: null,
          required_status_checks: null,
        },
      ],
    },
    orgs.newRepo('planning') {
      description: "Connector Fabric Manager project planning",
      has_discussions: true,
    }
  ],
}
