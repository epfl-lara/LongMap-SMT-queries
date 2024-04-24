; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125732 () Bool)

(assert start!125732)

(declare-fun res!996820 () Bool)

(declare-fun e!825402 () Bool)

(assert (=> start!125732 (=> (not res!996820) (not e!825402))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125732 (= res!996820 (validMask!0 mask!2687))))

(assert (=> start!125732 e!825402))

(assert (=> start!125732 true))

(declare-datatypes ((array!99018 0))(
  ( (array!99019 (arr!47792 (Array (_ BitVec 32) (_ BitVec 64))) (size!48343 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99018)

(declare-fun array_inv!37073 (array!99018) Bool)

(assert (=> start!125732 (array_inv!37073 a!2862)))

(declare-fun b!1469373 () Bool)

(declare-fun res!996814 () Bool)

(assert (=> b!1469373 (=> (not res!996814) (not e!825402))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469373 (= res!996814 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48343 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48343 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48343 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47792 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469374 () Bool)

(declare-fun res!996816 () Bool)

(assert (=> b!1469374 (=> (not res!996816) (not e!825402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469374 (= res!996816 (validKeyInArray!0 (select (arr!47792 a!2862) i!1006)))))

(declare-fun b!1469375 () Bool)

(declare-fun res!996818 () Bool)

(assert (=> b!1469375 (=> (not res!996818) (not e!825402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99018 (_ BitVec 32)) Bool)

(assert (=> b!1469375 (= res!996818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469376 () Bool)

(assert (=> b!1469376 (= e!825402 false)))

(declare-datatypes ((SeekEntryResult!11929 0))(
  ( (MissingZero!11929 (index!50108 (_ BitVec 32))) (Found!11929 (index!50109 (_ BitVec 32))) (Intermediate!11929 (undefined!12741 Bool) (index!50110 (_ BitVec 32)) (x!131891 (_ BitVec 32))) (Undefined!11929) (MissingVacant!11929 (index!50111 (_ BitVec 32))) )
))
(declare-fun lt!642772 () SeekEntryResult!11929)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99018 (_ BitVec 32)) SeekEntryResult!11929)

(assert (=> b!1469376 (= lt!642772 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47792 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1469377 () Bool)

(declare-fun res!996817 () Bool)

(assert (=> b!1469377 (=> (not res!996817) (not e!825402))))

(declare-datatypes ((List!34280 0))(
  ( (Nil!34277) (Cons!34276 (h!35640 (_ BitVec 64)) (t!48966 List!34280)) )
))
(declare-fun arrayNoDuplicates!0 (array!99018 (_ BitVec 32) List!34280) Bool)

(assert (=> b!1469377 (= res!996817 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34277))))

(declare-fun b!1469378 () Bool)

(declare-fun res!996819 () Bool)

(assert (=> b!1469378 (=> (not res!996819) (not e!825402))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469378 (= res!996819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47792 a!2862) j!93) mask!2687) (select (arr!47792 a!2862) j!93) a!2862 mask!2687) (Intermediate!11929 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1469379 () Bool)

(declare-fun res!996821 () Bool)

(assert (=> b!1469379 (=> (not res!996821) (not e!825402))))

(assert (=> b!1469379 (= res!996821 (validKeyInArray!0 (select (arr!47792 a!2862) j!93)))))

(declare-fun b!1469380 () Bool)

(declare-fun res!996815 () Bool)

(assert (=> b!1469380 (=> (not res!996815) (not e!825402))))

(assert (=> b!1469380 (= res!996815 (and (= (size!48343 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48343 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48343 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125732 res!996820) b!1469380))

(assert (= (and b!1469380 res!996815) b!1469374))

(assert (= (and b!1469374 res!996816) b!1469379))

(assert (= (and b!1469379 res!996821) b!1469375))

(assert (= (and b!1469375 res!996818) b!1469377))

(assert (= (and b!1469377 res!996817) b!1469373))

(assert (= (and b!1469373 res!996814) b!1469378))

(assert (= (and b!1469378 res!996819) b!1469376))

(declare-fun m!1356303 () Bool)

(assert (=> b!1469375 m!1356303))

(declare-fun m!1356305 () Bool)

(assert (=> b!1469376 m!1356305))

(assert (=> b!1469376 m!1356305))

(declare-fun m!1356307 () Bool)

(assert (=> b!1469376 m!1356307))

(declare-fun m!1356309 () Bool)

(assert (=> b!1469374 m!1356309))

(assert (=> b!1469374 m!1356309))

(declare-fun m!1356311 () Bool)

(assert (=> b!1469374 m!1356311))

(assert (=> b!1469378 m!1356305))

(assert (=> b!1469378 m!1356305))

(declare-fun m!1356313 () Bool)

(assert (=> b!1469378 m!1356313))

(assert (=> b!1469378 m!1356313))

(assert (=> b!1469378 m!1356305))

(declare-fun m!1356315 () Bool)

(assert (=> b!1469378 m!1356315))

(declare-fun m!1356317 () Bool)

(assert (=> start!125732 m!1356317))

(declare-fun m!1356319 () Bool)

(assert (=> start!125732 m!1356319))

(assert (=> b!1469379 m!1356305))

(assert (=> b!1469379 m!1356305))

(declare-fun m!1356321 () Bool)

(assert (=> b!1469379 m!1356321))

(declare-fun m!1356323 () Bool)

(assert (=> b!1469377 m!1356323))

(declare-fun m!1356325 () Bool)

(assert (=> b!1469373 m!1356325))

(declare-fun m!1356327 () Bool)

(assert (=> b!1469373 m!1356327))

(push 1)

(assert (not b!1469374))

(assert (not b!1469376))

(assert (not b!1469379))

(assert (not b!1469375))

(assert (not b!1469377))

(assert (not b!1469378))

(assert (not start!125732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

