CREATE TABLE "Workspace" (
  "id" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "systemPrompt" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "userId" TEXT NOT NULL,
  CONSTRAINT "Workspace_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "Workspace_userId_name_key" ON "Workspace"("userId", "name");
CREATE INDEX "Workspace_userId_updatedAt_idx" ON "Workspace"("userId", "updatedAt");
ALTER TABLE "Workspace" ADD CONSTRAINT "Workspace_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO "Workspace" ("id", "name", "userId")
SELECT 'ws_' || md5("id"), 'Personal', "id" FROM "User";

ALTER TABLE "Chat" ADD COLUMN "workspaceId" TEXT;
UPDATE "Chat" c SET "workspaceId" = 'ws_' || md5(c."userId") WHERE c."userId" IS NOT NULL;
CREATE INDEX "Chat_workspaceId_updatedAt_idx" ON "Chat"("workspaceId", "updatedAt");
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_workspaceId_fkey" FOREIGN KEY ("workspaceId") REFERENCES "Workspace"("id") ON DELETE SET NULL ON UPDATE CASCADE;
