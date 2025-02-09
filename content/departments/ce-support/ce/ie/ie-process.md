# Implementation Overview

This document is an overview of the processes followed by the implementation team when involved in a customer implementation project. It is specific to the process for _Jointly Managed Implementations_. Ad-hoc requests for support from the implementation team do not follow this process, but the implementation team may require pieces of this process to be completed in those cases.

To review the long-term work and goals of the implementation team, please review the [Jointly Managed Deployment Roadmap](https://docs.google.com/spreadsheets/d/1cXquABcSYxAKG38ol1yQFSWWslueck9vayAcOxPLga8/edit#gid=0).

For information on recommended deployment types and strategies, visit [Implementation Strategies](./impl-strategies.md).

For general information on the roles and responsibilities throughout a customer's lifecycle, visit the [Customer Lifecycle RACI](https://docs.google.com/spreadsheets/d/1q6dnHpgZcbgpTAEN3_zgyrrk6pByLIf7xNWsNrO0QVk/edit#gid=227625307).

# Cross-Functional Collaboration

The Implementation Team will have a variety of integration and collaboration points with various Sourcegraph teams throughtout the implementation project and customer lifecycle as a whole. This cross-functional collaboration includes:

#### CE / Sales

Visit [CE-AE-Implementation Collaboration Overview](ce-implementation-handoff.md) to better understand this relationship.

#### TA

Visit [TA-Implementation Collaboration Overview](implementation-ta-handoff.md) to better understand this relationship.

#### CS

For the majority of implementations, the default process will be for CS to only be engaged once the customer is fully live. From there, the CS will follow standard support practices. The documentation created by the implementation team during the hand-off to the TA should be sufficient for future CS to better support the customers' needs.

#### Engineering

Similarly to CE, implementation will identify product issues, submit corresponding GitHub issues, submit Product Gaps identified by customers, and collaborate with engineering teams to properly priorities resolutions and feature request.

# Implementation Team Use Cases

#### Complex Production Deployments

This is will be the primary use case for the implementation team. Following a simple trial, the CE should identify that the customer will require a complex self-hosted deployment and follows the processes to engage the implementation team. If the customer is selected for implementation services, the implementation team should be engaged leading up to contract closure, at which point the implementation team takes full ownership of the implementation and the customer from a technical perspective.

#### Production Instance Migrations

Occassionaly, customers will go live with a simpler deployment method that can't support the full extent of their expansion. In order to continue expanding, they need to transition to a kubernetes deployments. The implementation team should be notified via a formal implementation request if the customer could benefit from their involvement in the migration.

#### Production Ready Trial Deployments

This is generally not recommended. A majority of trials should consist of quick, simple deployments. If the CE determines that the customer will require a complex, production ready deployment for their trial and the CE feels the customer would benefit from implementation services, the implementation team should be notified via a formal implementation request. In current state, in order for a trial to be selected for implementation services:

- The CE and customer must be able to prove that the customer cannot move forward with a simpler trial environment
- The opp must impact FY23 revenue
- The opp must be reviewed by CE and Sales leadership and selected from the implementation request backlog

<em>Note - for more information about the implementation request and backlog review process, review</em> [CE-AE-Implementation Collaboration Overview](ce-implementation-handoff.md).

# Implementation Team Tasks and Responsibilities

The steps below detail, on a high level, the steps that the Sourcegraph implementation teams will work on both internally and directly with the customers:

[Implementation Engineers](./index.md)

- Confirmation of the production technical deployment design as captured by the CE
- Build internal replica environment based on expected requirements for production deployment
- Deploy customer non-production environment(s) for confirmation of deployment design and use as a dedicated testing environment
- Configure code hosts on non-production environment(s) to confirm no issues cloning and indexing repos at scale
- Onboard testing users into non-production environment(s) and confirm Sourcegraph performance is optimal
- Build and configure production environment and code hosts
- Execute load testing in replica environment
- Onboard full scope of users

[Implementation Project Managers](../tpm/index.md)

- Set milestones for deployment and develop project plan (starts prior to contract finalization)
- Ensure leadership engagement and buy in for the implementation
- Confirm appropriate project staffing
- Track progress towards key milestones and implementation Exit Criteria
- Track Open Issues and Risks
- Provide project reports to key internal and external stakeholders
- Engage cross-functional teams for additional assistance where needed
- Remove blockers for IEs and customer teams to accomplish project tasks

# Internal steps taken to support implementation efforts

- Customer facing project plan developed
  - The Implementation Project Manager will begin development of the project plan before the customer has officially signed, but will have it fully developed at the time of the initial implementation kickoff call.
- Replica environment built
  - Building a replica environment is especially important for new deployments with unique considerations (exceptional number of repos, exceptionally large monorepos, exceptionally high seat count). This will help validate the resourcing estimations for the customer’s deployment.
- Validate resourcing estimations for customer environments
  - Using the replica environment, run k6 load testing to ensure the instance can handle user traffic at scale and maintain high levels of performance.
- Internal status reporting and blockers removal
  - The Implementation Project Manager will report on the status of the project to internal stakeholders while assisting the Implementation Engineer to remove any implementation blockers they may be running into.

# High Level Implementation Project Plan

![Implementation Overview](https://storage.googleapis.com/sourcegraph-assets/Implementation%20Overview.png)

# Implementation Stakeholders

## Internal Stakeholders

While others may be directly or indirectly involved with specific implementations and customers, the below list accounts for the primary internal stakeholders. It is important that these stakeholders have direct and clear access to any and all information pertaining to the deployment. This is primarily achieved through regular maintenance of the project plan documents.

- Implementation Engineer
- Implementation Project Manager
- Customer Success Manager (Technical Account Manager)
- Customer Engineer
- Account Executive
- Leadership (particularly for Strategic Accounts)

## External Stakeholders

This stakeholders will vary by customer depending on their organizational structure, needs, and processes. Still, external stakeholders can largely be broken down into the below categories.

- Project Champion - usually an internal leader invested in distributing Sourcegraph to developers
- Project Team - developers, admins, DevX team members, etc. dedicated to standing up Sourcegraph
- Project Manager - someone responsible for tracking progress, delegating tasks, and communication related to the implementation
- Engineering Leadership - managers, directors, etc. directly overseeing developers that will be impacted by Sourcegraph
- Engineers - end users providing feedback throughout UAT and user group roll-outs
- External Vendors - representatives of tools and products used by the customer may need to be engaged ins certain scenarios

# Implementation Documentation

For ongoing support and account management, the implementation team is responsible for creating an internal document that details the following:

- Final Production Design (with specific emphasis on any deviations from standard, recommended deployment)
- Resourcing for the customer environment
  - Total CPU
  - Total Memory
  - Number of Nodes (Kubernetes)
    - Instance type for each node
  - Requests and limits per service
- Code statistics
  - Number of code hosts
    - Which code hosts
  - Lines of Code
  - Repos synced
- Overall customer environment information
  - How many environments are they deployed in?
    - Dev
    - Staging
    - Prod
  - Upgrade procedure and change management
    - Image scanning timeline
    - Pushing updates from development environment => production environment
  - Cloud platform
  - CI/CD stack
  - Externalized services
  - Other unique aspects of deployment
  - Current usage information and any expansion requirements

In addition, the implementation team is responsible for ensuring that the timeline information, deadlines, issues, risks, and statuses of any tasks are accurate and up to date in the project plan.

# Exit Criteria for the Implementation to be Considered Complete

Implementation is considered complete when the Sourcegraph instance is deployed and operational according to the originally scoped work. This includes completion of the necessary infrastructure for all customer environments, Sourcegraph deployment and resourcing, and Sourcegraph instance configuration (code host connections, syncing, and indexing along with general site configuration). While the long-term support resource will likely be executing a subset of tasks in parallel with the implementation (such as UAT and onboarding planning), the end of the implementation indicates the point at which the account will fully transition technical ownership to the Customer Engineers (or TAM if one exists). Once transitioned, the Customer Engineer will continue with long-term customer success activities such as user onboarding, training, expansion, account health management, and general support.

The list of tasks to be accomplished before considering an implementation complete include, but are not limited to:

- Full production infrastructure live and stable
- Sourcegraph admin accounts provisioned and admins trained
- All scoped code hosts synced and indexed
- All scoped features are functioning as expected
- The production instance achieves a sufficiently high level of performance
- Standard workflow and performance tests completed
- The production infrastructure is staged for long-term success with continued user and feature expansion
- The production environment is right-sized (or a plan is in place to right-size the environemnt)
- The production environment is on a current version

# Implementation Project Management Tools

Below are a number of standardized tools used for managing larger implementation projects.

- [Standard Implementation Project Plan Template](https://docs.google.com/spreadsheets/d/1bS5IBfkrYMKR2sCkDKpxorbcv2bLNUNb01_Jv8AgF3Y/edit#gid=0)
- [Trial Implementation Project Plan Template](https://docs.google.com/spreadsheets/d/11NNbKykn79Zw7iBGREepqaEWhB-iN57Y_Tc0YwzmMhE/edit#gid=0)
- [Monthly Progress Report Template](https://docs.google.com/document/d/1p6zuk-SR4WN5M_5pN9qstPcZhW2GS60dVeT3AJGMbiI/edit)
