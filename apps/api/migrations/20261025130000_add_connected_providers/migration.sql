CREATE TABLE "ConnectedProvider" (
    "id" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "displayName" TEXT NOT NULL,
    "encryptedApiKey" TEXT,
    "baseUrl" TEXT,
    "defaultModel" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "ConnectedProvider_pkey" PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX "ConnectedProvider_userId_provider_displayName_key" ON "ConnectedProvider"("userId", "provider", "displayName");
CREATE INDEX "ConnectedProvider_userId_idx" ON "ConnectedProvider"("userId");
ALTER TABLE "ConnectedProvider" ADD CONSTRAINT "ConnectedProvider_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;