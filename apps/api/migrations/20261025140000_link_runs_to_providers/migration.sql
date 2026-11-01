ALTER TABLE "ExperimentRun" ADD COLUMN "providerConnectionId" TEXT;
CREATE INDEX "ExperimentRun_providerConnectionId_idx" ON "ExperimentRun"("providerConnectionId");
ALTER TABLE "ExperimentRun" ADD CONSTRAINT "ExperimentRun_providerConnectionId_fkey" FOREIGN KEY ("providerConnectionId") REFERENCES "ConnectedProvider"("id") ON DELETE SET NULL ON UPDATE CASCADE;