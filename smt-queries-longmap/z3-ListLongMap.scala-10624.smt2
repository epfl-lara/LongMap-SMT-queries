; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124884 () Bool)

(assert start!124884)

(declare-fun b!1450463 () Bool)

(declare-fun res!981812 () Bool)

(declare-fun e!816763 () Bool)

(assert (=> b!1450463 (=> (not res!981812) (not e!816763))))

(declare-datatypes ((array!98332 0))(
  ( (array!98333 (arr!47454 (Array (_ BitVec 32) (_ BitVec 64))) (size!48004 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98332)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98332 (_ BitVec 32)) Bool)

(assert (=> b!1450463 (= res!981812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450464 () Bool)

(declare-fun e!816755 () Bool)

(declare-fun e!816758 () Bool)

(assert (=> b!1450464 (= e!816755 (not e!816758))))

(declare-fun res!981807 () Bool)

(assert (=> b!1450464 (=> res!981807 e!816758)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450464 (= res!981807 (or (and (= (select (arr!47454 a!2862) index!646) (select (store (arr!47454 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47454 a!2862) index!646) (select (arr!47454 a!2862) j!93))) (not (= (select (arr!47454 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47454 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816759 () Bool)

(assert (=> b!1450464 e!816759))

(declare-fun res!981801 () Bool)

(assert (=> b!1450464 (=> (not res!981801) (not e!816759))))

(declare-datatypes ((SeekEntryResult!11706 0))(
  ( (MissingZero!11706 (index!49216 (_ BitVec 32))) (Found!11706 (index!49217 (_ BitVec 32))) (Intermediate!11706 (undefined!12518 Bool) (index!49218 (_ BitVec 32)) (x!130875 (_ BitVec 32))) (Undefined!11706) (MissingVacant!11706 (index!49219 (_ BitVec 32))) )
))
(declare-fun lt!636304 () SeekEntryResult!11706)

(declare-fun lt!636302 () SeekEntryResult!11706)

(assert (=> b!1450464 (= res!981801 (and (= lt!636302 lt!636304) (or (= (select (arr!47454 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47454 a!2862) intermediateBeforeIndex!19) (select (arr!47454 a!2862) j!93)))))))

(assert (=> b!1450464 (= lt!636304 (Found!11706 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98332 (_ BitVec 32)) SeekEntryResult!11706)

(assert (=> b!1450464 (= lt!636302 (seekEntryOrOpen!0 (select (arr!47454 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450464 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48908 0))(
  ( (Unit!48909) )
))
(declare-fun lt!636309 () Unit!48908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48908)

(assert (=> b!1450464 (= lt!636309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450465 () Bool)

(declare-fun res!981817 () Bool)

(assert (=> b!1450465 (=> (not res!981817) (not e!816755))))

(declare-fun e!816757 () Bool)

(assert (=> b!1450465 (= res!981817 e!816757)))

(declare-fun c!133842 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450465 (= c!133842 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450466 () Bool)

(declare-fun res!981813 () Bool)

(assert (=> b!1450466 (=> (not res!981813) (not e!816763))))

(assert (=> b!1450466 (= res!981813 (and (= (size!48004 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48004 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48004 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450467 () Bool)

(declare-fun res!981803 () Bool)

(assert (=> b!1450467 (=> (not res!981803) (not e!816763))))

(declare-datatypes ((List!33955 0))(
  ( (Nil!33952) (Cons!33951 (h!35301 (_ BitVec 64)) (t!48649 List!33955)) )
))
(declare-fun arrayNoDuplicates!0 (array!98332 (_ BitVec 32) List!33955) Bool)

(assert (=> b!1450467 (= res!981803 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33952))))

(declare-fun b!1450468 () Bool)

(assert (=> b!1450468 (= e!816758 true)))

(declare-fun lt!636307 () array!98332)

(declare-fun lt!636306 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98332 (_ BitVec 32)) SeekEntryResult!11706)

(assert (=> b!1450468 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636306 lt!636307 mask!2687) lt!636304)))

(declare-fun lt!636308 () Unit!48908)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48908)

(assert (=> b!1450468 (= lt!636308 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450469 () Bool)

(declare-fun e!816764 () Bool)

(assert (=> b!1450469 (= e!816759 e!816764)))

(declare-fun res!981804 () Bool)

(assert (=> b!1450469 (=> res!981804 e!816764)))

(assert (=> b!1450469 (= res!981804 (or (and (= (select (arr!47454 a!2862) index!646) (select (store (arr!47454 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47454 a!2862) index!646) (select (arr!47454 a!2862) j!93))) (not (= (select (arr!47454 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450470 () Bool)

(declare-fun res!981806 () Bool)

(assert (=> b!1450470 (=> (not res!981806) (not e!816763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450470 (= res!981806 (validKeyInArray!0 (select (arr!47454 a!2862) i!1006)))))

(declare-fun b!1450471 () Bool)

(declare-fun res!981800 () Bool)

(declare-fun e!816756 () Bool)

(assert (=> b!1450471 (=> (not res!981800) (not e!816756))))

(declare-fun lt!636303 () SeekEntryResult!11706)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98332 (_ BitVec 32)) SeekEntryResult!11706)

(assert (=> b!1450471 (= res!981800 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47454 a!2862) j!93) a!2862 mask!2687) lt!636303))))

(declare-fun b!1450472 () Bool)

(declare-fun res!981810 () Bool)

(assert (=> b!1450472 (=> res!981810 e!816758)))

(assert (=> b!1450472 (= res!981810 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47454 a!2862) j!93) a!2862 mask!2687) lt!636304)))))

(declare-fun b!1450473 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!816760 () Bool)

(assert (=> b!1450473 (= e!816760 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!981802 () Bool)

(assert (=> start!124884 (=> (not res!981802) (not e!816763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124884 (= res!981802 (validMask!0 mask!2687))))

(assert (=> start!124884 e!816763))

(assert (=> start!124884 true))

(declare-fun array_inv!36482 (array!98332) Bool)

(assert (=> start!124884 (array_inv!36482 a!2862)))

(declare-fun b!1450474 () Bool)

(declare-fun res!981808 () Bool)

(assert (=> b!1450474 (=> (not res!981808) (not e!816763))))

(assert (=> b!1450474 (= res!981808 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48004 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48004 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48004 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450475 () Bool)

(assert (=> b!1450475 (= e!816757 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636306 lt!636307 mask!2687) (seekEntryOrOpen!0 lt!636306 lt!636307 mask!2687)))))

(declare-fun b!1450476 () Bool)

(assert (=> b!1450476 (= e!816756 e!816755)))

(declare-fun res!981815 () Bool)

(assert (=> b!1450476 (=> (not res!981815) (not e!816755))))

(declare-fun lt!636305 () SeekEntryResult!11706)

(assert (=> b!1450476 (= res!981815 (= lt!636305 (Intermediate!11706 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450476 (= lt!636305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636306 mask!2687) lt!636306 lt!636307 mask!2687))))

(assert (=> b!1450476 (= lt!636306 (select (store (arr!47454 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450477 () Bool)

(assert (=> b!1450477 (= e!816757 (= lt!636305 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636306 lt!636307 mask!2687)))))

(declare-fun b!1450478 () Bool)

(declare-fun res!981814 () Bool)

(assert (=> b!1450478 (=> (not res!981814) (not e!816755))))

(assert (=> b!1450478 (= res!981814 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450479 () Bool)

(declare-fun e!816762 () Bool)

(assert (=> b!1450479 (= e!816762 e!816756)))

(declare-fun res!981809 () Bool)

(assert (=> b!1450479 (=> (not res!981809) (not e!816756))))

(assert (=> b!1450479 (= res!981809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47454 a!2862) j!93) mask!2687) (select (arr!47454 a!2862) j!93) a!2862 mask!2687) lt!636303))))

(assert (=> b!1450479 (= lt!636303 (Intermediate!11706 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450480 () Bool)

(declare-fun res!981816 () Bool)

(assert (=> b!1450480 (=> (not res!981816) (not e!816763))))

(assert (=> b!1450480 (= res!981816 (validKeyInArray!0 (select (arr!47454 a!2862) j!93)))))

(declare-fun b!1450481 () Bool)

(assert (=> b!1450481 (= e!816763 e!816762)))

(declare-fun res!981811 () Bool)

(assert (=> b!1450481 (=> (not res!981811) (not e!816762))))

(assert (=> b!1450481 (= res!981811 (= (select (store (arr!47454 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450481 (= lt!636307 (array!98333 (store (arr!47454 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48004 a!2862)))))

(declare-fun b!1450482 () Bool)

(assert (=> b!1450482 (= e!816764 e!816760)))

(declare-fun res!981805 () Bool)

(assert (=> b!1450482 (=> (not res!981805) (not e!816760))))

(assert (=> b!1450482 (= res!981805 (= lt!636302 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47454 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!124884 res!981802) b!1450466))

(assert (= (and b!1450466 res!981813) b!1450470))

(assert (= (and b!1450470 res!981806) b!1450480))

(assert (= (and b!1450480 res!981816) b!1450463))

(assert (= (and b!1450463 res!981812) b!1450467))

(assert (= (and b!1450467 res!981803) b!1450474))

(assert (= (and b!1450474 res!981808) b!1450481))

(assert (= (and b!1450481 res!981811) b!1450479))

(assert (= (and b!1450479 res!981809) b!1450471))

(assert (= (and b!1450471 res!981800) b!1450476))

(assert (= (and b!1450476 res!981815) b!1450465))

(assert (= (and b!1450465 c!133842) b!1450477))

(assert (= (and b!1450465 (not c!133842)) b!1450475))

(assert (= (and b!1450465 res!981817) b!1450478))

(assert (= (and b!1450478 res!981814) b!1450464))

(assert (= (and b!1450464 res!981801) b!1450469))

(assert (= (and b!1450469 (not res!981804)) b!1450482))

(assert (= (and b!1450482 res!981805) b!1450473))

(assert (= (and b!1450464 (not res!981807)) b!1450472))

(assert (= (and b!1450472 (not res!981810)) b!1450468))

(declare-fun m!1339107 () Bool)

(assert (=> b!1450479 m!1339107))

(assert (=> b!1450479 m!1339107))

(declare-fun m!1339109 () Bool)

(assert (=> b!1450479 m!1339109))

(assert (=> b!1450479 m!1339109))

(assert (=> b!1450479 m!1339107))

(declare-fun m!1339111 () Bool)

(assert (=> b!1450479 m!1339111))

(assert (=> b!1450472 m!1339107))

(assert (=> b!1450472 m!1339107))

(declare-fun m!1339113 () Bool)

(assert (=> b!1450472 m!1339113))

(declare-fun m!1339115 () Bool)

(assert (=> b!1450463 m!1339115))

(assert (=> b!1450471 m!1339107))

(assert (=> b!1450471 m!1339107))

(declare-fun m!1339117 () Bool)

(assert (=> b!1450471 m!1339117))

(declare-fun m!1339119 () Bool)

(assert (=> b!1450469 m!1339119))

(declare-fun m!1339121 () Bool)

(assert (=> b!1450469 m!1339121))

(declare-fun m!1339123 () Bool)

(assert (=> b!1450469 m!1339123))

(assert (=> b!1450469 m!1339107))

(declare-fun m!1339125 () Bool)

(assert (=> b!1450475 m!1339125))

(declare-fun m!1339127 () Bool)

(assert (=> b!1450475 m!1339127))

(declare-fun m!1339129 () Bool)

(assert (=> b!1450477 m!1339129))

(assert (=> b!1450468 m!1339125))

(declare-fun m!1339131 () Bool)

(assert (=> b!1450468 m!1339131))

(declare-fun m!1339133 () Bool)

(assert (=> b!1450464 m!1339133))

(assert (=> b!1450464 m!1339121))

(declare-fun m!1339135 () Bool)

(assert (=> b!1450464 m!1339135))

(assert (=> b!1450464 m!1339123))

(assert (=> b!1450464 m!1339119))

(assert (=> b!1450464 m!1339107))

(declare-fun m!1339137 () Bool)

(assert (=> b!1450464 m!1339137))

(declare-fun m!1339139 () Bool)

(assert (=> b!1450464 m!1339139))

(assert (=> b!1450464 m!1339107))

(declare-fun m!1339141 () Bool)

(assert (=> start!124884 m!1339141))

(declare-fun m!1339143 () Bool)

(assert (=> start!124884 m!1339143))

(declare-fun m!1339145 () Bool)

(assert (=> b!1450470 m!1339145))

(assert (=> b!1450470 m!1339145))

(declare-fun m!1339147 () Bool)

(assert (=> b!1450470 m!1339147))

(assert (=> b!1450482 m!1339107))

(assert (=> b!1450482 m!1339107))

(declare-fun m!1339149 () Bool)

(assert (=> b!1450482 m!1339149))

(assert (=> b!1450480 m!1339107))

(assert (=> b!1450480 m!1339107))

(declare-fun m!1339151 () Bool)

(assert (=> b!1450480 m!1339151))

(declare-fun m!1339153 () Bool)

(assert (=> b!1450467 m!1339153))

(assert (=> b!1450481 m!1339121))

(declare-fun m!1339155 () Bool)

(assert (=> b!1450481 m!1339155))

(declare-fun m!1339157 () Bool)

(assert (=> b!1450476 m!1339157))

(assert (=> b!1450476 m!1339157))

(declare-fun m!1339159 () Bool)

(assert (=> b!1450476 m!1339159))

(assert (=> b!1450476 m!1339121))

(declare-fun m!1339161 () Bool)

(assert (=> b!1450476 m!1339161))

(check-sat (not b!1450471) (not b!1450468) (not b!1450463) (not b!1450472) (not b!1450470) (not b!1450480) (not start!124884) (not b!1450475) (not b!1450464) (not b!1450477) (not b!1450467) (not b!1450482) (not b!1450476) (not b!1450479))
(check-sat)
