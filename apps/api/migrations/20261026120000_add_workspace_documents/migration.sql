CREATE TABLE "WorkspaceDocument" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "WorkspaceDocument_pkey" PRIMARY KEY ("id")
);

CREATE INDEX "WorkspaceDocument_userId_updatedAt_idx" ON "WorkspaceDocument"("userId", "updatedAt");

ALTER TABLE "WorkspaceDocument" ADD CONSTRAINT "WorkspaceDocument_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
