; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125104 () Bool)

(assert start!125104)

(declare-fun b!1457076 () Bool)

(declare-fun e!819728 () Bool)

(declare-fun e!819731 () Bool)

(assert (=> b!1457076 (= e!819728 e!819731)))

(declare-fun res!987451 () Bool)

(assert (=> b!1457076 (=> (not res!987451) (not e!819731))))

(declare-datatypes ((SeekEntryResult!11816 0))(
  ( (MissingZero!11816 (index!49656 (_ BitVec 32))) (Found!11816 (index!49657 (_ BitVec 32))) (Intermediate!11816 (undefined!12628 Bool) (index!49658 (_ BitVec 32)) (x!131281 (_ BitVec 32))) (Undefined!11816) (MissingVacant!11816 (index!49659 (_ BitVec 32))) )
))
(declare-fun lt!638550 () SeekEntryResult!11816)

(declare-datatypes ((array!98552 0))(
  ( (array!98553 (arr!47564 (Array (_ BitVec 32) (_ BitVec 64))) (size!48114 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98552)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98552 (_ BitVec 32)) SeekEntryResult!11816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457076 (= res!987451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47564 a!2862) j!93) mask!2687) (select (arr!47564 a!2862) j!93) a!2862 mask!2687) lt!638550))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457076 (= lt!638550 (Intermediate!11816 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!987447 () Bool)

(declare-fun e!819730 () Bool)

(assert (=> start!125104 (=> (not res!987447) (not e!819730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125104 (= res!987447 (validMask!0 mask!2687))))

(assert (=> start!125104 e!819730))

(assert (=> start!125104 true))

(declare-fun array_inv!36592 (array!98552) Bool)

(assert (=> start!125104 (array_inv!36592 a!2862)))

(declare-fun b!1457077 () Bool)

(assert (=> b!1457077 (= e!819730 e!819728)))

(declare-fun res!987450 () Bool)

(assert (=> b!1457077 (=> (not res!987450) (not e!819728))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457077 (= res!987450 (= (select (store (arr!47564 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638549 () array!98552)

(assert (=> b!1457077 (= lt!638549 (array!98553 (store (arr!47564 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48114 a!2862)))))

(declare-fun b!1457078 () Bool)

(declare-fun res!987457 () Bool)

(assert (=> b!1457078 (=> (not res!987457) (not e!819730))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457078 (= res!987457 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48114 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48114 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48114 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457079 () Bool)

(declare-fun e!819726 () Bool)

(declare-fun e!819724 () Bool)

(assert (=> b!1457079 (= e!819726 e!819724)))

(declare-fun res!987454 () Bool)

(assert (=> b!1457079 (=> res!987454 e!819724)))

(declare-fun lt!638546 () (_ BitVec 32))

(assert (=> b!1457079 (= res!987454 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638546 #b00000000000000000000000000000000) (bvsge lt!638546 (size!48114 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457079 (= lt!638546 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638551 () SeekEntryResult!11816)

(declare-fun lt!638547 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98552 (_ BitVec 32)) SeekEntryResult!11816)

(assert (=> b!1457079 (= lt!638551 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638547 lt!638549 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98552 (_ BitVec 32)) SeekEntryResult!11816)

(assert (=> b!1457079 (= lt!638551 (seekEntryOrOpen!0 lt!638547 lt!638549 mask!2687))))

(declare-fun b!1457080 () Bool)

(declare-fun e!819723 () Bool)

(assert (=> b!1457080 (= e!819723 (not e!819726))))

(declare-fun res!987446 () Bool)

(assert (=> b!1457080 (=> res!987446 e!819726)))

(assert (=> b!1457080 (= res!987446 (or (and (= (select (arr!47564 a!2862) index!646) (select (store (arr!47564 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47564 a!2862) index!646) (select (arr!47564 a!2862) j!93))) (= (select (arr!47564 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819722 () Bool)

(assert (=> b!1457080 e!819722))

(declare-fun res!987459 () Bool)

(assert (=> b!1457080 (=> (not res!987459) (not e!819722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98552 (_ BitVec 32)) Bool)

(assert (=> b!1457080 (= res!987459 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49128 0))(
  ( (Unit!49129) )
))
(declare-fun lt!638552 () Unit!49128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49128)

(assert (=> b!1457080 (= lt!638552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!638553 () SeekEntryResult!11816)

(declare-fun b!1457081 () Bool)

(declare-fun e!819725 () Bool)

(assert (=> b!1457081 (= e!819725 (not (= lt!638553 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638546 lt!638547 lt!638549 mask!2687))))))

(declare-fun b!1457082 () Bool)

(declare-fun e!819727 () Bool)

(assert (=> b!1457082 (= e!819727 (= lt!638553 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638547 lt!638549 mask!2687)))))

(declare-fun b!1457083 () Bool)

(assert (=> b!1457083 (= e!819724 true)))

(declare-fun lt!638548 () Bool)

(assert (=> b!1457083 (= lt!638548 e!819725)))

(declare-fun c!134328 () Bool)

(assert (=> b!1457083 (= c!134328 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457084 () Bool)

(declare-fun res!987443 () Bool)

(assert (=> b!1457084 (=> (not res!987443) (not e!819723))))

(assert (=> b!1457084 (= res!987443 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457085 () Bool)

(declare-fun res!987455 () Bool)

(assert (=> b!1457085 (=> (not res!987455) (not e!819731))))

(assert (=> b!1457085 (= res!987455 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47564 a!2862) j!93) a!2862 mask!2687) lt!638550))))

(declare-fun b!1457086 () Bool)

(declare-fun res!987456 () Bool)

(assert (=> b!1457086 (=> (not res!987456) (not e!819730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457086 (= res!987456 (validKeyInArray!0 (select (arr!47564 a!2862) i!1006)))))

(declare-fun b!1457087 () Bool)

(declare-fun res!987445 () Bool)

(assert (=> b!1457087 (=> (not res!987445) (not e!819722))))

(assert (=> b!1457087 (= res!987445 (= (seekEntryOrOpen!0 (select (arr!47564 a!2862) j!93) a!2862 mask!2687) (Found!11816 j!93)))))

(declare-fun b!1457088 () Bool)

(declare-fun res!987452 () Bool)

(assert (=> b!1457088 (=> (not res!987452) (not e!819723))))

(assert (=> b!1457088 (= res!987452 e!819727)))

(declare-fun c!134327 () Bool)

(assert (=> b!1457088 (= c!134327 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457089 () Bool)

(assert (=> b!1457089 (= e!819722 (and (or (= (select (arr!47564 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47564 a!2862) intermediateBeforeIndex!19) (select (arr!47564 a!2862) j!93))) (let ((bdg!53305 (select (store (arr!47564 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47564 a!2862) index!646) bdg!53305) (= (select (arr!47564 a!2862) index!646) (select (arr!47564 a!2862) j!93))) (= (select (arr!47564 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53305 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457090 () Bool)

(declare-fun res!987453 () Bool)

(assert (=> b!1457090 (=> (not res!987453) (not e!819730))))

(declare-datatypes ((List!34065 0))(
  ( (Nil!34062) (Cons!34061 (h!35411 (_ BitVec 64)) (t!48759 List!34065)) )
))
(declare-fun arrayNoDuplicates!0 (array!98552 (_ BitVec 32) List!34065) Bool)

(assert (=> b!1457090 (= res!987453 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34062))))

(declare-fun b!1457091 () Bool)

(declare-fun res!987448 () Bool)

(assert (=> b!1457091 (=> res!987448 e!819724)))

(assert (=> b!1457091 (= res!987448 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638546 (select (arr!47564 a!2862) j!93) a!2862 mask!2687) lt!638550)))))

(declare-fun b!1457092 () Bool)

(declare-fun res!987449 () Bool)

(assert (=> b!1457092 (=> (not res!987449) (not e!819730))))

(assert (=> b!1457092 (= res!987449 (and (= (size!48114 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48114 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48114 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457093 () Bool)

(declare-fun res!987458 () Bool)

(assert (=> b!1457093 (=> (not res!987458) (not e!819730))))

(assert (=> b!1457093 (= res!987458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457094 () Bool)

(assert (=> b!1457094 (= e!819727 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638547 lt!638549 mask!2687) (seekEntryOrOpen!0 lt!638547 lt!638549 mask!2687)))))

(declare-fun b!1457095 () Bool)

(assert (=> b!1457095 (= e!819725 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638546 intermediateAfterIndex!19 lt!638547 lt!638549 mask!2687) lt!638551)))))

(declare-fun b!1457096 () Bool)

(assert (=> b!1457096 (= e!819731 e!819723)))

(declare-fun res!987460 () Bool)

(assert (=> b!1457096 (=> (not res!987460) (not e!819723))))

(assert (=> b!1457096 (= res!987460 (= lt!638553 (Intermediate!11816 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457096 (= lt!638553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638547 mask!2687) lt!638547 lt!638549 mask!2687))))

(assert (=> b!1457096 (= lt!638547 (select (store (arr!47564 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457097 () Bool)

(declare-fun res!987444 () Bool)

(assert (=> b!1457097 (=> (not res!987444) (not e!819730))))

(assert (=> b!1457097 (= res!987444 (validKeyInArray!0 (select (arr!47564 a!2862) j!93)))))

(assert (= (and start!125104 res!987447) b!1457092))

(assert (= (and b!1457092 res!987449) b!1457086))

(assert (= (and b!1457086 res!987456) b!1457097))

(assert (= (and b!1457097 res!987444) b!1457093))

(assert (= (and b!1457093 res!987458) b!1457090))

(assert (= (and b!1457090 res!987453) b!1457078))

(assert (= (and b!1457078 res!987457) b!1457077))

(assert (= (and b!1457077 res!987450) b!1457076))

(assert (= (and b!1457076 res!987451) b!1457085))

(assert (= (and b!1457085 res!987455) b!1457096))

(assert (= (and b!1457096 res!987460) b!1457088))

(assert (= (and b!1457088 c!134327) b!1457082))

(assert (= (and b!1457088 (not c!134327)) b!1457094))

(assert (= (and b!1457088 res!987452) b!1457084))

(assert (= (and b!1457084 res!987443) b!1457080))

(assert (= (and b!1457080 res!987459) b!1457087))

(assert (= (and b!1457087 res!987445) b!1457089))

(assert (= (and b!1457080 (not res!987446)) b!1457079))

(assert (= (and b!1457079 (not res!987454)) b!1457091))

(assert (= (and b!1457091 (not res!987448)) b!1457083))

(assert (= (and b!1457083 c!134328) b!1457081))

(assert (= (and b!1457083 (not c!134328)) b!1457095))

(declare-fun m!1345099 () Bool)

(assert (=> b!1457086 m!1345099))

(assert (=> b!1457086 m!1345099))

(declare-fun m!1345101 () Bool)

(assert (=> b!1457086 m!1345101))

(declare-fun m!1345103 () Bool)

(assert (=> b!1457077 m!1345103))

(declare-fun m!1345105 () Bool)

(assert (=> b!1457077 m!1345105))

(declare-fun m!1345107 () Bool)

(assert (=> b!1457093 m!1345107))

(declare-fun m!1345109 () Bool)

(assert (=> b!1457081 m!1345109))

(declare-fun m!1345111 () Bool)

(assert (=> b!1457095 m!1345111))

(declare-fun m!1345113 () Bool)

(assert (=> b!1457094 m!1345113))

(declare-fun m!1345115 () Bool)

(assert (=> b!1457094 m!1345115))

(assert (=> b!1457089 m!1345103))

(declare-fun m!1345117 () Bool)

(assert (=> b!1457089 m!1345117))

(declare-fun m!1345119 () Bool)

(assert (=> b!1457089 m!1345119))

(declare-fun m!1345121 () Bool)

(assert (=> b!1457089 m!1345121))

(declare-fun m!1345123 () Bool)

(assert (=> b!1457089 m!1345123))

(declare-fun m!1345125 () Bool)

(assert (=> b!1457080 m!1345125))

(assert (=> b!1457080 m!1345103))

(assert (=> b!1457080 m!1345119))

(assert (=> b!1457080 m!1345121))

(declare-fun m!1345127 () Bool)

(assert (=> b!1457080 m!1345127))

(assert (=> b!1457080 m!1345123))

(declare-fun m!1345129 () Bool)

(assert (=> b!1457096 m!1345129))

(assert (=> b!1457096 m!1345129))

(declare-fun m!1345131 () Bool)

(assert (=> b!1457096 m!1345131))

(assert (=> b!1457096 m!1345103))

(declare-fun m!1345133 () Bool)

(assert (=> b!1457096 m!1345133))

(declare-fun m!1345135 () Bool)

(assert (=> b!1457082 m!1345135))

(assert (=> b!1457097 m!1345123))

(assert (=> b!1457097 m!1345123))

(declare-fun m!1345137 () Bool)

(assert (=> b!1457097 m!1345137))

(declare-fun m!1345139 () Bool)

(assert (=> b!1457090 m!1345139))

(assert (=> b!1457091 m!1345123))

(assert (=> b!1457091 m!1345123))

(declare-fun m!1345141 () Bool)

(assert (=> b!1457091 m!1345141))

(assert (=> b!1457085 m!1345123))

(assert (=> b!1457085 m!1345123))

(declare-fun m!1345143 () Bool)

(assert (=> b!1457085 m!1345143))

(declare-fun m!1345145 () Bool)

(assert (=> start!125104 m!1345145))

(declare-fun m!1345147 () Bool)

(assert (=> start!125104 m!1345147))

(assert (=> b!1457076 m!1345123))

(assert (=> b!1457076 m!1345123))

(declare-fun m!1345149 () Bool)

(assert (=> b!1457076 m!1345149))

(assert (=> b!1457076 m!1345149))

(assert (=> b!1457076 m!1345123))

(declare-fun m!1345151 () Bool)

(assert (=> b!1457076 m!1345151))

(declare-fun m!1345153 () Bool)

(assert (=> b!1457079 m!1345153))

(assert (=> b!1457079 m!1345113))

(assert (=> b!1457079 m!1345115))

(assert (=> b!1457087 m!1345123))

(assert (=> b!1457087 m!1345123))

(declare-fun m!1345155 () Bool)

(assert (=> b!1457087 m!1345155))

(push 1)

