ALTER TABLE "ConnectedProvider"
  ADD COLUMN "inputPricePerMillion" DOUBLE PRECISION,
  ADD COLUMN "outputPricePerMillion" DOUBLE PRECISION;

ALTER TABLE "ExperimentRun"
  ADD COLUMN "estimatedCostUsd" DOUBLE PRECISION;
