; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125286 () Bool)

(assert start!125286)

(declare-fun b!1457215 () Bool)

(declare-fun e!820026 () Bool)

(declare-fun e!820023 () Bool)

(assert (=> b!1457215 (= e!820026 e!820023)))

(declare-fun res!986989 () Bool)

(assert (=> b!1457215 (=> res!986989 e!820023)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638593 () (_ BitVec 32))

(declare-datatypes ((array!98629 0))(
  ( (array!98630 (arr!47599 (Array (_ BitVec 32) (_ BitVec 64))) (size!48150 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98629)

(assert (=> b!1457215 (= res!986989 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638593 #b00000000000000000000000000000000) (bvsge lt!638593 (size!48150 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457215 (= lt!638593 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!638598 () array!98629)

(declare-fun lt!638592 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11748 0))(
  ( (MissingZero!11748 (index!49384 (_ BitVec 32))) (Found!11748 (index!49385 (_ BitVec 32))) (Intermediate!11748 (undefined!12560 Bool) (index!49386 (_ BitVec 32)) (x!131189 (_ BitVec 32))) (Undefined!11748) (MissingVacant!11748 (index!49387 (_ BitVec 32))) )
))
(declare-fun lt!638595 () SeekEntryResult!11748)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98629 (_ BitVec 32)) SeekEntryResult!11748)

(assert (=> b!1457215 (= lt!638595 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638592 lt!638598 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98629 (_ BitVec 32)) SeekEntryResult!11748)

(assert (=> b!1457215 (= lt!638595 (seekEntryOrOpen!0 lt!638592 lt!638598 mask!2687))))

(declare-fun b!1457216 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!820021 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457216 (= e!820021 (and (or (= (select (arr!47599 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47599 a!2862) intermediateBeforeIndex!19) (select (arr!47599 a!2862) j!93))) (let ((bdg!53198 (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47599 a!2862) index!646) bdg!53198) (= (select (arr!47599 a!2862) index!646) (select (arr!47599 a!2862) j!93))) (= (select (arr!47599 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53198 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457217 () Bool)

(declare-fun res!986988 () Bool)

(declare-fun e!820020 () Bool)

(assert (=> b!1457217 (=> (not res!986988) (not e!820020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457217 (= res!986988 (validKeyInArray!0 (select (arr!47599 a!2862) i!1006)))))

(declare-fun b!1457218 () Bool)

(declare-fun res!986980 () Bool)

(assert (=> b!1457218 (=> (not res!986980) (not e!820020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98629 (_ BitVec 32)) Bool)

(assert (=> b!1457218 (= res!986980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457219 () Bool)

(declare-fun res!986982 () Bool)

(assert (=> b!1457219 (=> (not res!986982) (not e!820020))))

(declare-datatypes ((List!34087 0))(
  ( (Nil!34084) (Cons!34083 (h!35444 (_ BitVec 64)) (t!48773 List!34087)) )
))
(declare-fun arrayNoDuplicates!0 (array!98629 (_ BitVec 32) List!34087) Bool)

(assert (=> b!1457219 (= res!986982 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34084))))

(declare-fun b!1457220 () Bool)

(declare-fun res!986987 () Bool)

(assert (=> b!1457220 (=> (not res!986987) (not e!820021))))

(assert (=> b!1457220 (= res!986987 (= (seekEntryOrOpen!0 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) (Found!11748 j!93)))))

(declare-fun b!1457221 () Bool)

(declare-fun e!820022 () Bool)

(declare-fun e!820024 () Bool)

(assert (=> b!1457221 (= e!820022 e!820024)))

(declare-fun res!986986 () Bool)

(assert (=> b!1457221 (=> (not res!986986) (not e!820024))))

(declare-fun lt!638599 () SeekEntryResult!11748)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98629 (_ BitVec 32)) SeekEntryResult!11748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457221 (= res!986986 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47599 a!2862) j!93) mask!2687) (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!638599))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457221 (= lt!638599 (Intermediate!11748 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457222 () Bool)

(declare-fun res!986983 () Bool)

(declare-fun e!820025 () Bool)

(assert (=> b!1457222 (=> (not res!986983) (not e!820025))))

(assert (=> b!1457222 (= res!986983 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457223 () Bool)

(declare-fun res!986985 () Bool)

(assert (=> b!1457223 (=> (not res!986985) (not e!820024))))

(assert (=> b!1457223 (= res!986985 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!638599))))

(declare-fun e!820028 () Bool)

(declare-fun b!1457224 () Bool)

(assert (=> b!1457224 (= e!820028 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638592 lt!638598 mask!2687) (seekEntryOrOpen!0 lt!638592 lt!638598 mask!2687)))))

(declare-fun b!1457225 () Bool)

(declare-fun res!986974 () Bool)

(assert (=> b!1457225 (=> (not res!986974) (not e!820025))))

(assert (=> b!1457225 (= res!986974 e!820028)))

(declare-fun c!134640 () Bool)

(assert (=> b!1457225 (= c!134640 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!638594 () SeekEntryResult!11748)

(declare-fun e!820029 () Bool)

(declare-fun b!1457226 () Bool)

(assert (=> b!1457226 (= e!820029 (not (= lt!638594 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638593 lt!638592 lt!638598 mask!2687))))))

(declare-fun b!1457227 () Bool)

(declare-fun res!986981 () Bool)

(assert (=> b!1457227 (=> (not res!986981) (not e!820020))))

(assert (=> b!1457227 (= res!986981 (and (= (size!48150 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48150 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48150 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457228 () Bool)

(assert (=> b!1457228 (= e!820020 e!820022)))

(declare-fun res!986973 () Bool)

(assert (=> b!1457228 (=> (not res!986973) (not e!820022))))

(assert (=> b!1457228 (= res!986973 (= (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457228 (= lt!638598 (array!98630 (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48150 a!2862)))))

(declare-fun b!1457229 () Bool)

(declare-fun res!986978 () Bool)

(assert (=> b!1457229 (=> (not res!986978) (not e!820020))))

(assert (=> b!1457229 (= res!986978 (validKeyInArray!0 (select (arr!47599 a!2862) j!93)))))

(declare-fun b!1457230 () Bool)

(declare-fun res!986977 () Bool)

(assert (=> b!1457230 (=> res!986977 e!820023)))

(assert (=> b!1457230 (= res!986977 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638593 (select (arr!47599 a!2862) j!93) a!2862 mask!2687) lt!638599)))))

(declare-fun b!1457231 () Bool)

(assert (=> b!1457231 (= e!820025 (not e!820026))))

(declare-fun res!986975 () Bool)

(assert (=> b!1457231 (=> res!986975 e!820026)))

(assert (=> b!1457231 (= res!986975 (or (and (= (select (arr!47599 a!2862) index!646) (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47599 a!2862) index!646) (select (arr!47599 a!2862) j!93))) (= (select (arr!47599 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457231 e!820021))

(declare-fun res!986976 () Bool)

(assert (=> b!1457231 (=> (not res!986976) (not e!820021))))

(assert (=> b!1457231 (= res!986976 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49025 0))(
  ( (Unit!49026) )
))
(declare-fun lt!638597 () Unit!49025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49025)

(assert (=> b!1457231 (= lt!638597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457232 () Bool)

(assert (=> b!1457232 (= e!820029 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638593 intermediateAfterIndex!19 lt!638592 lt!638598 mask!2687) lt!638595)))))

(declare-fun b!1457233 () Bool)

(declare-fun res!986984 () Bool)

(assert (=> b!1457233 (=> (not res!986984) (not e!820020))))

(assert (=> b!1457233 (= res!986984 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48150 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48150 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48150 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457234 () Bool)

(assert (=> b!1457234 (= e!820024 e!820025)))

(declare-fun res!986979 () Bool)

(assert (=> b!1457234 (=> (not res!986979) (not e!820025))))

(assert (=> b!1457234 (= res!986979 (= lt!638594 (Intermediate!11748 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457234 (= lt!638594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638592 mask!2687) lt!638592 lt!638598 mask!2687))))

(assert (=> b!1457234 (= lt!638592 (select (store (arr!47599 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457235 () Bool)

(assert (=> b!1457235 (= e!820023 true)))

(declare-fun lt!638596 () Bool)

(assert (=> b!1457235 (= lt!638596 e!820029)))

(declare-fun c!134641 () Bool)

(assert (=> b!1457235 (= c!134641 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457236 () Bool)

(assert (=> b!1457236 (= e!820028 (= lt!638594 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638592 lt!638598 mask!2687)))))

(declare-fun res!986990 () Bool)

(assert (=> start!125286 (=> (not res!986990) (not e!820020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125286 (= res!986990 (validMask!0 mask!2687))))

(assert (=> start!125286 e!820020))

(assert (=> start!125286 true))

(declare-fun array_inv!36880 (array!98629) Bool)

(assert (=> start!125286 (array_inv!36880 a!2862)))

(assert (= (and start!125286 res!986990) b!1457227))

(assert (= (and b!1457227 res!986981) b!1457217))

(assert (= (and b!1457217 res!986988) b!1457229))

(assert (= (and b!1457229 res!986978) b!1457218))

(assert (= (and b!1457218 res!986980) b!1457219))

(assert (= (and b!1457219 res!986982) b!1457233))

(assert (= (and b!1457233 res!986984) b!1457228))

(assert (= (and b!1457228 res!986973) b!1457221))

(assert (= (and b!1457221 res!986986) b!1457223))

(assert (= (and b!1457223 res!986985) b!1457234))

(assert (= (and b!1457234 res!986979) b!1457225))

(assert (= (and b!1457225 c!134640) b!1457236))

(assert (= (and b!1457225 (not c!134640)) b!1457224))

(assert (= (and b!1457225 res!986974) b!1457222))

(assert (= (and b!1457222 res!986983) b!1457231))

(assert (= (and b!1457231 res!986976) b!1457220))

(assert (= (and b!1457220 res!986987) b!1457216))

(assert (= (and b!1457231 (not res!986975)) b!1457215))

(assert (= (and b!1457215 (not res!986989)) b!1457230))

(assert (= (and b!1457230 (not res!986977)) b!1457235))

(assert (= (and b!1457235 c!134641) b!1457226))

(assert (= (and b!1457235 (not c!134641)) b!1457232))

(declare-fun m!1345495 () Bool)

(assert (=> b!1457236 m!1345495))

(declare-fun m!1345497 () Bool)

(assert (=> b!1457218 m!1345497))

(declare-fun m!1345499 () Bool)

(assert (=> b!1457221 m!1345499))

(assert (=> b!1457221 m!1345499))

(declare-fun m!1345501 () Bool)

(assert (=> b!1457221 m!1345501))

(assert (=> b!1457221 m!1345501))

(assert (=> b!1457221 m!1345499))

(declare-fun m!1345503 () Bool)

(assert (=> b!1457221 m!1345503))

(declare-fun m!1345505 () Bool)

(assert (=> start!125286 m!1345505))

(declare-fun m!1345507 () Bool)

(assert (=> start!125286 m!1345507))

(declare-fun m!1345509 () Bool)

(assert (=> b!1457231 m!1345509))

(declare-fun m!1345511 () Bool)

(assert (=> b!1457231 m!1345511))

(declare-fun m!1345513 () Bool)

(assert (=> b!1457231 m!1345513))

(declare-fun m!1345515 () Bool)

(assert (=> b!1457231 m!1345515))

(declare-fun m!1345517 () Bool)

(assert (=> b!1457231 m!1345517))

(assert (=> b!1457231 m!1345499))

(declare-fun m!1345519 () Bool)

(assert (=> b!1457215 m!1345519))

(declare-fun m!1345521 () Bool)

(assert (=> b!1457215 m!1345521))

(declare-fun m!1345523 () Bool)

(assert (=> b!1457215 m!1345523))

(assert (=> b!1457216 m!1345511))

(declare-fun m!1345525 () Bool)

(assert (=> b!1457216 m!1345525))

(assert (=> b!1457216 m!1345513))

(assert (=> b!1457216 m!1345515))

(assert (=> b!1457216 m!1345499))

(assert (=> b!1457223 m!1345499))

(assert (=> b!1457223 m!1345499))

(declare-fun m!1345527 () Bool)

(assert (=> b!1457223 m!1345527))

(assert (=> b!1457224 m!1345521))

(assert (=> b!1457224 m!1345523))

(declare-fun m!1345529 () Bool)

(assert (=> b!1457232 m!1345529))

(declare-fun m!1345531 () Bool)

(assert (=> b!1457217 m!1345531))

(assert (=> b!1457217 m!1345531))

(declare-fun m!1345533 () Bool)

(assert (=> b!1457217 m!1345533))

(declare-fun m!1345535 () Bool)

(assert (=> b!1457234 m!1345535))

(assert (=> b!1457234 m!1345535))

(declare-fun m!1345537 () Bool)

(assert (=> b!1457234 m!1345537))

(assert (=> b!1457234 m!1345511))

(declare-fun m!1345539 () Bool)

(assert (=> b!1457234 m!1345539))

(assert (=> b!1457230 m!1345499))

(assert (=> b!1457230 m!1345499))

(declare-fun m!1345541 () Bool)

(assert (=> b!1457230 m!1345541))

(assert (=> b!1457228 m!1345511))

(declare-fun m!1345543 () Bool)

(assert (=> b!1457228 m!1345543))

(assert (=> b!1457220 m!1345499))

(assert (=> b!1457220 m!1345499))

(declare-fun m!1345545 () Bool)

(assert (=> b!1457220 m!1345545))

(declare-fun m!1345547 () Bool)

(assert (=> b!1457226 m!1345547))

(declare-fun m!1345549 () Bool)

(assert (=> b!1457219 m!1345549))

(assert (=> b!1457229 m!1345499))

(assert (=> b!1457229 m!1345499))

(declare-fun m!1345551 () Bool)

(assert (=> b!1457229 m!1345551))

(check-sat (not b!1457236) (not b!1457221) (not b!1457215) (not b!1457230) (not b!1457218) (not b!1457219) (not b!1457229) (not b!1457217) (not b!1457234) (not b!1457224) (not b!1457226) (not b!1457231) (not b!1457232) (not b!1457223) (not start!125286) (not b!1457220))
(check-sat)
