ALTER TABLE "ExperimentRun"
ADD COLUMN "promptVersionId" TEXT;

CREATE INDEX "ExperimentRun_promptVersionId_idx"
ON "ExperimentRun"("promptVersionId");

ALTER TABLE "ExperimentRun"
ADD CONSTRAINT "ExperimentRun_promptVersionId_fkey"
FOREIGN KEY ("promptVersionId") REFERENCES "PromptVersion"("id")
ON DELETE SET NULL ON UPDATE CASCADE;