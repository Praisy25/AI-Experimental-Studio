ALTER TABLE "WorkspaceDocument" ADD COLUMN "workspaceId" TEXT;

UPDATE "WorkspaceDocument" d
SET "workspaceId" = w."id"
FROM "Workspace" w
WHERE w."userId" = d."userId" AND w."name" = 'Personal';

ALTER TABLE "WorkspaceDocument"
ADD CONSTRAINT "WorkspaceDocument_workspaceId_fkey"
FOREIGN KEY ("workspaceId") REFERENCES "Workspace"("id") ON DELETE SET NULL ON UPDATE CASCADE;

CREATE INDEX "WorkspaceDocument_workspaceId_updatedAt_idx"
ON "WorkspaceDocument"("workspaceId", "updatedAt");
