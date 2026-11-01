CREATE TABLE "PromptVersion" (
    "id" TEXT NOT NULL,
    "promptTemplateId" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "prompt" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "PromptVersion_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "PromptVersion_promptTemplateId_version_key"
ON "PromptVersion"("promptTemplateId", "version");

CREATE INDEX "PromptVersion_promptTemplateId_createdAt_idx"
ON "PromptVersion"("promptTemplateId", "createdAt");

ALTER TABLE "PromptVersion"
ADD CONSTRAINT "PromptVersion_promptTemplateId_fkey"
FOREIGN KEY ("promptTemplateId") REFERENCES "PromptTemplate"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO "PromptVersion" ("id", "promptTemplateId", "version", "title", "prompt", "category", "createdAt")
SELECT md5(random()::text || clock_timestamp()::text), "id", 1, "title", "prompt", "category", "createdAt"
FROM "PromptTemplate";
