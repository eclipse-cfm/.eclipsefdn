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
    orgs.newRepo('clearglass') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "ClearGlass is a small authentication plugin for Traefik that allows to authenticate based on token validity and scopes",
      has_discussions: true,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
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
    orgs.newRepo('jwtlet') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A JWTlet is a small application performing token exchanged and other related operations",
      has_discussions: true,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
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
