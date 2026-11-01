-- Persist Ollama frequency and presence penalties for each run.
ALTER TABLE "ExperimentRun"
ADD COLUMN "frequencyPenalty" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN "presencePenalty" DOUBLE PRECISION NOT NULL DEFAULT 0;
