; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125272 () Bool)

(assert start!125272)

(declare-fun b!1463244 () Bool)

(declare-fun e!822405 () Bool)

(declare-fun e!822406 () Bool)

(assert (=> b!1463244 (= e!822405 e!822406)))

(declare-fun res!992628 () Bool)

(assert (=> b!1463244 (=> res!992628 e!822406)))

(declare-fun lt!640533 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98698 0))(
  ( (array!98699 (arr!47638 (Array (_ BitVec 32) (_ BitVec 64))) (size!48190 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98698)

(assert (=> b!1463244 (= res!992628 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640533 #b00000000000000000000000000000000) (bvsge lt!640533 (size!48190 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463244 (= lt!640533 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!822409 () Bool)

(declare-fun lt!640534 () array!98698)

(declare-fun lt!640535 () (_ BitVec 64))

(declare-fun b!1463245 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11915 0))(
  ( (MissingZero!11915 (index!50052 (_ BitVec 32))) (Found!11915 (index!50053 (_ BitVec 32))) (Intermediate!11915 (undefined!12727 Bool) (index!50054 (_ BitVec 32)) (x!131639 (_ BitVec 32))) (Undefined!11915) (MissingVacant!11915 (index!50055 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98698 (_ BitVec 32)) SeekEntryResult!11915)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98698 (_ BitVec 32)) SeekEntryResult!11915)

(assert (=> b!1463245 (= e!822409 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640533 intermediateAfterIndex!19 lt!640535 lt!640534 mask!2687) (seekEntryOrOpen!0 lt!640535 lt!640534 mask!2687))))))

(declare-fun b!1463247 () Bool)

(declare-fun e!822408 () Bool)

(declare-fun e!822412 () Bool)

(assert (=> b!1463247 (= e!822408 e!822412)))

(declare-fun res!992618 () Bool)

(assert (=> b!1463247 (=> (not res!992618) (not e!822412))))

(declare-fun lt!640539 () SeekEntryResult!11915)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98698 (_ BitVec 32)) SeekEntryResult!11915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463247 (= res!992618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47638 a!2862) j!93) mask!2687) (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!640539))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463247 (= lt!640539 (Intermediate!11915 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463248 () Bool)

(declare-fun res!992625 () Bool)

(declare-fun e!822407 () Bool)

(assert (=> b!1463248 (=> (not res!992625) (not e!822407))))

(declare-datatypes ((List!34217 0))(
  ( (Nil!34214) (Cons!34213 (h!35563 (_ BitVec 64)) (t!48903 List!34217)) )
))
(declare-fun arrayNoDuplicates!0 (array!98698 (_ BitVec 32) List!34217) Bool)

(assert (=> b!1463248 (= res!992625 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34214))))

(declare-fun b!1463249 () Bool)

(assert (=> b!1463249 (= e!822406 true)))

(declare-fun lt!640536 () Bool)

(assert (=> b!1463249 (= lt!640536 e!822409)))

(declare-fun c!134830 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463249 (= c!134830 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463250 () Bool)

(declare-fun res!992624 () Bool)

(assert (=> b!1463250 (=> (not res!992624) (not e!822407))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463250 (= res!992624 (and (= (size!48190 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48190 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48190 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463251 () Bool)

(declare-fun e!822410 () Bool)

(assert (=> b!1463251 (= e!822410 (or (= (select (arr!47638 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47638 a!2862) intermediateBeforeIndex!19) (select (arr!47638 a!2862) j!93))))))

(declare-fun b!1463252 () Bool)

(declare-fun res!992619 () Bool)

(assert (=> b!1463252 (=> res!992619 e!822406)))

(assert (=> b!1463252 (= res!992619 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640533 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!640539)))))

(declare-fun b!1463253 () Bool)

(declare-fun e!822414 () Bool)

(assert (=> b!1463253 (= e!822414 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640535 lt!640534 mask!2687) (seekEntryOrOpen!0 lt!640535 lt!640534 mask!2687)))))

(declare-fun b!1463254 () Bool)

(assert (=> b!1463254 (= e!822407 e!822408)))

(declare-fun res!992616 () Bool)

(assert (=> b!1463254 (=> (not res!992616) (not e!822408))))

(assert (=> b!1463254 (= res!992616 (= (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463254 (= lt!640534 (array!98699 (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48190 a!2862)))))

(declare-fun b!1463255 () Bool)

(declare-fun res!992617 () Bool)

(assert (=> b!1463255 (=> (not res!992617) (not e!822407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463255 (= res!992617 (validKeyInArray!0 (select (arr!47638 a!2862) j!93)))))

(declare-fun b!1463256 () Bool)

(declare-fun res!992612 () Bool)

(assert (=> b!1463256 (=> (not res!992612) (not e!822410))))

(assert (=> b!1463256 (= res!992612 (= (seekEntryOrOpen!0 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) (Found!11915 j!93)))))

(declare-fun b!1463257 () Bool)

(declare-fun e!822411 () Bool)

(assert (=> b!1463257 (= e!822412 e!822411)))

(declare-fun res!992620 () Bool)

(assert (=> b!1463257 (=> (not res!992620) (not e!822411))))

(declare-fun lt!640538 () SeekEntryResult!11915)

(assert (=> b!1463257 (= res!992620 (= lt!640538 (Intermediate!11915 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463257 (= lt!640538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640535 mask!2687) lt!640535 lt!640534 mask!2687))))

(assert (=> b!1463257 (= lt!640535 (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463258 () Bool)

(declare-fun res!992613 () Bool)

(assert (=> b!1463258 (=> (not res!992613) (not e!822411))))

(assert (=> b!1463258 (= res!992613 e!822414)))

(declare-fun c!134829 () Bool)

(assert (=> b!1463258 (= c!134829 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!992621 () Bool)

(assert (=> start!125272 (=> (not res!992621) (not e!822407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125272 (= res!992621 (validMask!0 mask!2687))))

(assert (=> start!125272 e!822407))

(assert (=> start!125272 true))

(declare-fun array_inv!36871 (array!98698) Bool)

(assert (=> start!125272 (array_inv!36871 a!2862)))

(declare-fun b!1463246 () Bool)

(declare-fun res!992622 () Bool)

(assert (=> b!1463246 (=> (not res!992622) (not e!822412))))

(assert (=> b!1463246 (= res!992622 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!640539))))

(declare-fun b!1463259 () Bool)

(declare-fun res!992623 () Bool)

(assert (=> b!1463259 (=> (not res!992623) (not e!822407))))

(assert (=> b!1463259 (= res!992623 (validKeyInArray!0 (select (arr!47638 a!2862) i!1006)))))

(declare-fun b!1463260 () Bool)

(assert (=> b!1463260 (= e!822414 (= lt!640538 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640535 lt!640534 mask!2687)))))

(declare-fun b!1463261 () Bool)

(assert (=> b!1463261 (= e!822411 (not e!822405))))

(declare-fun res!992615 () Bool)

(assert (=> b!1463261 (=> res!992615 e!822405)))

(assert (=> b!1463261 (= res!992615 (or (and (= (select (arr!47638 a!2862) index!646) (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47638 a!2862) index!646) (select (arr!47638 a!2862) j!93))) (= (select (arr!47638 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463261 e!822410))

(declare-fun res!992614 () Bool)

(assert (=> b!1463261 (=> (not res!992614) (not e!822410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98698 (_ BitVec 32)) Bool)

(assert (=> b!1463261 (= res!992614 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49167 0))(
  ( (Unit!49168) )
))
(declare-fun lt!640537 () Unit!49167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49167)

(assert (=> b!1463261 (= lt!640537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463262 () Bool)

(declare-fun res!992629 () Bool)

(assert (=> b!1463262 (=> (not res!992629) (not e!822407))))

(assert (=> b!1463262 (= res!992629 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48190 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48190 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48190 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463263 () Bool)

(declare-fun res!992626 () Bool)

(assert (=> b!1463263 (=> (not res!992626) (not e!822407))))

(assert (=> b!1463263 (= res!992626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463264 () Bool)

(assert (=> b!1463264 (= e!822409 (not (= lt!640538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640533 lt!640535 lt!640534 mask!2687))))))

(declare-fun b!1463265 () Bool)

(declare-fun res!992627 () Bool)

(assert (=> b!1463265 (=> (not res!992627) (not e!822411))))

(assert (=> b!1463265 (= res!992627 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125272 res!992621) b!1463250))

(assert (= (and b!1463250 res!992624) b!1463259))

(assert (= (and b!1463259 res!992623) b!1463255))

(assert (= (and b!1463255 res!992617) b!1463263))

(assert (= (and b!1463263 res!992626) b!1463248))

(assert (= (and b!1463248 res!992625) b!1463262))

(assert (= (and b!1463262 res!992629) b!1463254))

(assert (= (and b!1463254 res!992616) b!1463247))

(assert (= (and b!1463247 res!992618) b!1463246))

(assert (= (and b!1463246 res!992622) b!1463257))

(assert (= (and b!1463257 res!992620) b!1463258))

(assert (= (and b!1463258 c!134829) b!1463260))

(assert (= (and b!1463258 (not c!134829)) b!1463253))

(assert (= (and b!1463258 res!992613) b!1463265))

(assert (= (and b!1463265 res!992627) b!1463261))

(assert (= (and b!1463261 res!992614) b!1463256))

(assert (= (and b!1463256 res!992612) b!1463251))

(assert (= (and b!1463261 (not res!992615)) b!1463244))

(assert (= (and b!1463244 (not res!992628)) b!1463252))

(assert (= (and b!1463252 (not res!992619)) b!1463249))

(assert (= (and b!1463249 c!134830) b!1463264))

(assert (= (and b!1463249 (not c!134830)) b!1463245))

(declare-fun m!1350099 () Bool)

(assert (=> b!1463255 m!1350099))

(assert (=> b!1463255 m!1350099))

(declare-fun m!1350101 () Bool)

(assert (=> b!1463255 m!1350101))

(assert (=> b!1463247 m!1350099))

(assert (=> b!1463247 m!1350099))

(declare-fun m!1350103 () Bool)

(assert (=> b!1463247 m!1350103))

(assert (=> b!1463247 m!1350103))

(assert (=> b!1463247 m!1350099))

(declare-fun m!1350105 () Bool)

(assert (=> b!1463247 m!1350105))

(declare-fun m!1350107 () Bool)

(assert (=> b!1463257 m!1350107))

(assert (=> b!1463257 m!1350107))

(declare-fun m!1350109 () Bool)

(assert (=> b!1463257 m!1350109))

(declare-fun m!1350111 () Bool)

(assert (=> b!1463257 m!1350111))

(declare-fun m!1350113 () Bool)

(assert (=> b!1463257 m!1350113))

(declare-fun m!1350115 () Bool)

(assert (=> b!1463261 m!1350115))

(assert (=> b!1463261 m!1350111))

(declare-fun m!1350117 () Bool)

(assert (=> b!1463261 m!1350117))

(declare-fun m!1350119 () Bool)

(assert (=> b!1463261 m!1350119))

(declare-fun m!1350121 () Bool)

(assert (=> b!1463261 m!1350121))

(assert (=> b!1463261 m!1350099))

(declare-fun m!1350123 () Bool)

(assert (=> b!1463260 m!1350123))

(declare-fun m!1350125 () Bool)

(assert (=> start!125272 m!1350125))

(declare-fun m!1350127 () Bool)

(assert (=> start!125272 m!1350127))

(declare-fun m!1350129 () Bool)

(assert (=> b!1463245 m!1350129))

(declare-fun m!1350131 () Bool)

(assert (=> b!1463245 m!1350131))

(assert (=> b!1463256 m!1350099))

(assert (=> b!1463256 m!1350099))

(declare-fun m!1350133 () Bool)

(assert (=> b!1463256 m!1350133))

(declare-fun m!1350135 () Bool)

(assert (=> b!1463259 m!1350135))

(assert (=> b!1463259 m!1350135))

(declare-fun m!1350137 () Bool)

(assert (=> b!1463259 m!1350137))

(declare-fun m!1350139 () Bool)

(assert (=> b!1463251 m!1350139))

(assert (=> b!1463251 m!1350099))

(declare-fun m!1350141 () Bool)

(assert (=> b!1463244 m!1350141))

(declare-fun m!1350143 () Bool)

(assert (=> b!1463263 m!1350143))

(declare-fun m!1350145 () Bool)

(assert (=> b!1463253 m!1350145))

(assert (=> b!1463253 m!1350131))

(declare-fun m!1350147 () Bool)

(assert (=> b!1463264 m!1350147))

(assert (=> b!1463254 m!1350111))

(declare-fun m!1350149 () Bool)

(assert (=> b!1463254 m!1350149))

(assert (=> b!1463252 m!1350099))

(assert (=> b!1463252 m!1350099))

(declare-fun m!1350151 () Bool)

(assert (=> b!1463252 m!1350151))

(assert (=> b!1463246 m!1350099))

(assert (=> b!1463246 m!1350099))

(declare-fun m!1350153 () Bool)

(assert (=> b!1463246 m!1350153))

(declare-fun m!1350155 () Bool)

(assert (=> b!1463248 m!1350155))

(check-sat (not b!1463245) (not b!1463259) (not b!1463248) (not b!1463264) (not b!1463257) (not b!1463252) (not b!1463263) (not b!1463253) (not b!1463255) (not b!1463256) (not b!1463261) (not start!125272) (not b!1463247) (not b!1463260) (not b!1463244) (not b!1463246))
(check-sat)
