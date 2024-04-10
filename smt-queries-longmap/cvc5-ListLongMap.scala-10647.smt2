; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125020 () Bool)

(assert start!125020)

(declare-fun b!1454304 () Bool)

(declare-fun res!985190 () Bool)

(declare-fun e!818462 () Bool)

(assert (=> b!1454304 (=> (not res!985190) (not e!818462))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98468 0))(
  ( (array!98469 (arr!47522 (Array (_ BitVec 32) (_ BitVec 64))) (size!48072 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98468)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454304 (= res!985190 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48072 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48072 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48072 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454305 () Bool)

(declare-fun e!818463 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454305 (= e!818463 (and (or (= (select (arr!47522 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47522 a!2862) intermediateBeforeIndex!19) (select (arr!47522 a!2862) j!93))) (let ((bdg!53053 (select (store (arr!47522 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47522 a!2862) index!646) bdg!53053) (= (select (arr!47522 a!2862) index!646) (select (arr!47522 a!2862) j!93))) (= (select (arr!47522 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53053 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454306 () Bool)

(declare-fun res!985178 () Bool)

(assert (=> b!1454306 (=> (not res!985178) (not e!818462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454306 (= res!985178 (validKeyInArray!0 (select (arr!47522 a!2862) j!93)))))

(declare-fun lt!637544 () (_ BitVec 64))

(declare-fun lt!637545 () (_ BitVec 32))

(declare-fun lt!637543 () array!98468)

(declare-datatypes ((SeekEntryResult!11774 0))(
  ( (MissingZero!11774 (index!49488 (_ BitVec 32))) (Found!11774 (index!49489 (_ BitVec 32))) (Intermediate!11774 (undefined!12586 Bool) (index!49490 (_ BitVec 32)) (x!131127 (_ BitVec 32))) (Undefined!11774) (MissingVacant!11774 (index!49491 (_ BitVec 32))) )
))
(declare-fun lt!637541 () SeekEntryResult!11774)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1454307 () Bool)

(declare-fun e!818468 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98468 (_ BitVec 32)) SeekEntryResult!11774)

(assert (=> b!1454307 (= e!818468 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637545 intermediateAfterIndex!19 lt!637544 lt!637543 mask!2687) lt!637541)))))

(declare-fun b!1454308 () Bool)

(declare-fun e!818465 () Bool)

(assert (=> b!1454308 (= e!818465 true)))

(declare-fun lt!637540 () Bool)

(assert (=> b!1454308 (= lt!637540 e!818468)))

(declare-fun c!134075 () Bool)

(assert (=> b!1454308 (= c!134075 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454310 () Bool)

(declare-fun lt!637538 () SeekEntryResult!11774)

(declare-fun e!818470 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98468 (_ BitVec 32)) SeekEntryResult!11774)

(assert (=> b!1454310 (= e!818470 (= lt!637538 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637544 lt!637543 mask!2687)))))

(declare-fun b!1454311 () Bool)

(declare-fun res!985184 () Bool)

(assert (=> b!1454311 (=> (not res!985184) (not e!818462))))

(declare-datatypes ((List!34023 0))(
  ( (Nil!34020) (Cons!34019 (h!35369 (_ BitVec 64)) (t!48717 List!34023)) )
))
(declare-fun arrayNoDuplicates!0 (array!98468 (_ BitVec 32) List!34023) Bool)

(assert (=> b!1454311 (= res!985184 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34020))))

(declare-fun b!1454312 () Bool)

(assert (=> b!1454312 (= e!818468 (not (= lt!637538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637545 lt!637544 lt!637543 mask!2687))))))

(declare-fun b!1454313 () Bool)

(declare-fun e!818464 () Bool)

(assert (=> b!1454313 (= e!818464 e!818465)))

(declare-fun res!985179 () Bool)

(assert (=> b!1454313 (=> res!985179 e!818465)))

(assert (=> b!1454313 (= res!985179 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637545 #b00000000000000000000000000000000) (bvsge lt!637545 (size!48072 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454313 (= lt!637545 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454313 (= lt!637541 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637544 lt!637543 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98468 (_ BitVec 32)) SeekEntryResult!11774)

(assert (=> b!1454313 (= lt!637541 (seekEntryOrOpen!0 lt!637544 lt!637543 mask!2687))))

(declare-fun b!1454314 () Bool)

(declare-fun res!985182 () Bool)

(assert (=> b!1454314 (=> (not res!985182) (not e!818463))))

(assert (=> b!1454314 (= res!985182 (= (seekEntryOrOpen!0 (select (arr!47522 a!2862) j!93) a!2862 mask!2687) (Found!11774 j!93)))))

(declare-fun b!1454315 () Bool)

(declare-fun res!985181 () Bool)

(declare-fun e!818469 () Bool)

(assert (=> b!1454315 (=> (not res!985181) (not e!818469))))

(assert (=> b!1454315 (= res!985181 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454316 () Bool)

(declare-fun res!985192 () Bool)

(declare-fun e!818466 () Bool)

(assert (=> b!1454316 (=> (not res!985192) (not e!818466))))

(declare-fun lt!637542 () SeekEntryResult!11774)

(assert (=> b!1454316 (= res!985192 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47522 a!2862) j!93) a!2862 mask!2687) lt!637542))))

(declare-fun b!1454317 () Bool)

(declare-fun res!985188 () Bool)

(assert (=> b!1454317 (=> (not res!985188) (not e!818462))))

(assert (=> b!1454317 (= res!985188 (and (= (size!48072 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48072 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48072 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454318 () Bool)

(assert (=> b!1454318 (= e!818470 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637544 lt!637543 mask!2687) (seekEntryOrOpen!0 lt!637544 lt!637543 mask!2687)))))

(declare-fun b!1454319 () Bool)

(declare-fun e!818471 () Bool)

(assert (=> b!1454319 (= e!818471 e!818466)))

(declare-fun res!985186 () Bool)

(assert (=> b!1454319 (=> (not res!985186) (not e!818466))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454319 (= res!985186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47522 a!2862) j!93) mask!2687) (select (arr!47522 a!2862) j!93) a!2862 mask!2687) lt!637542))))

(assert (=> b!1454319 (= lt!637542 (Intermediate!11774 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454320 () Bool)

(assert (=> b!1454320 (= e!818462 e!818471)))

(declare-fun res!985189 () Bool)

(assert (=> b!1454320 (=> (not res!985189) (not e!818471))))

(assert (=> b!1454320 (= res!985189 (= (select (store (arr!47522 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454320 (= lt!637543 (array!98469 (store (arr!47522 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48072 a!2862)))))

(declare-fun b!1454321 () Bool)

(declare-fun res!985176 () Bool)

(assert (=> b!1454321 (=> res!985176 e!818465)))

(assert (=> b!1454321 (= res!985176 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637545 (select (arr!47522 a!2862) j!93) a!2862 mask!2687) lt!637542)))))

(declare-fun b!1454322 () Bool)

(declare-fun res!985180 () Bool)

(assert (=> b!1454322 (=> (not res!985180) (not e!818469))))

(assert (=> b!1454322 (= res!985180 e!818470)))

(declare-fun c!134076 () Bool)

(assert (=> b!1454322 (= c!134076 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454323 () Bool)

(declare-fun res!985187 () Bool)

(assert (=> b!1454323 (=> (not res!985187) (not e!818462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98468 (_ BitVec 32)) Bool)

(assert (=> b!1454323 (= res!985187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454309 () Bool)

(assert (=> b!1454309 (= e!818466 e!818469)))

(declare-fun res!985185 () Bool)

(assert (=> b!1454309 (=> (not res!985185) (not e!818469))))

(assert (=> b!1454309 (= res!985185 (= lt!637538 (Intermediate!11774 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454309 (= lt!637538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637544 mask!2687) lt!637544 lt!637543 mask!2687))))

(assert (=> b!1454309 (= lt!637544 (select (store (arr!47522 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!985183 () Bool)

(assert (=> start!125020 (=> (not res!985183) (not e!818462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125020 (= res!985183 (validMask!0 mask!2687))))

(assert (=> start!125020 e!818462))

(assert (=> start!125020 true))

(declare-fun array_inv!36550 (array!98468) Bool)

(assert (=> start!125020 (array_inv!36550 a!2862)))

(declare-fun b!1454324 () Bool)

(assert (=> b!1454324 (= e!818469 (not e!818464))))

(declare-fun res!985191 () Bool)

(assert (=> b!1454324 (=> res!985191 e!818464)))

(assert (=> b!1454324 (= res!985191 (or (and (= (select (arr!47522 a!2862) index!646) (select (store (arr!47522 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47522 a!2862) index!646) (select (arr!47522 a!2862) j!93))) (= (select (arr!47522 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454324 e!818463))

(declare-fun res!985177 () Bool)

(assert (=> b!1454324 (=> (not res!985177) (not e!818463))))

(assert (=> b!1454324 (= res!985177 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49044 0))(
  ( (Unit!49045) )
))
(declare-fun lt!637539 () Unit!49044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49044)

(assert (=> b!1454324 (= lt!637539 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454325 () Bool)

(declare-fun res!985175 () Bool)

(assert (=> b!1454325 (=> (not res!985175) (not e!818462))))

(assert (=> b!1454325 (= res!985175 (validKeyInArray!0 (select (arr!47522 a!2862) i!1006)))))

(assert (= (and start!125020 res!985183) b!1454317))

(assert (= (and b!1454317 res!985188) b!1454325))

(assert (= (and b!1454325 res!985175) b!1454306))

(assert (= (and b!1454306 res!985178) b!1454323))

(assert (= (and b!1454323 res!985187) b!1454311))

(assert (= (and b!1454311 res!985184) b!1454304))

(assert (= (and b!1454304 res!985190) b!1454320))

(assert (= (and b!1454320 res!985189) b!1454319))

(assert (= (and b!1454319 res!985186) b!1454316))

(assert (= (and b!1454316 res!985192) b!1454309))

(assert (= (and b!1454309 res!985185) b!1454322))

(assert (= (and b!1454322 c!134076) b!1454310))

(assert (= (and b!1454322 (not c!134076)) b!1454318))

(assert (= (and b!1454322 res!985180) b!1454315))

(assert (= (and b!1454315 res!985181) b!1454324))

(assert (= (and b!1454324 res!985177) b!1454314))

(assert (= (and b!1454314 res!985182) b!1454305))

(assert (= (and b!1454324 (not res!985191)) b!1454313))

(assert (= (and b!1454313 (not res!985179)) b!1454321))

(assert (= (and b!1454321 (not res!985176)) b!1454308))

(assert (= (and b!1454308 c!134075) b!1454312))

(assert (= (and b!1454308 (not c!134075)) b!1454307))

(declare-fun m!1342663 () Bool)

(assert (=> b!1454312 m!1342663))

(declare-fun m!1342665 () Bool)

(assert (=> b!1454324 m!1342665))

(declare-fun m!1342667 () Bool)

(assert (=> b!1454324 m!1342667))

(declare-fun m!1342669 () Bool)

(assert (=> b!1454324 m!1342669))

(declare-fun m!1342671 () Bool)

(assert (=> b!1454324 m!1342671))

(declare-fun m!1342673 () Bool)

(assert (=> b!1454324 m!1342673))

(declare-fun m!1342675 () Bool)

(assert (=> b!1454324 m!1342675))

(assert (=> b!1454305 m!1342667))

(declare-fun m!1342677 () Bool)

(assert (=> b!1454305 m!1342677))

(assert (=> b!1454305 m!1342669))

(assert (=> b!1454305 m!1342671))

(assert (=> b!1454305 m!1342675))

(declare-fun m!1342679 () Bool)

(assert (=> b!1454323 m!1342679))

(declare-fun m!1342681 () Bool)

(assert (=> b!1454307 m!1342681))

(declare-fun m!1342683 () Bool)

(assert (=> b!1454325 m!1342683))

(assert (=> b!1454325 m!1342683))

(declare-fun m!1342685 () Bool)

(assert (=> b!1454325 m!1342685))

(declare-fun m!1342687 () Bool)

(assert (=> b!1454311 m!1342687))

(assert (=> b!1454321 m!1342675))

(assert (=> b!1454321 m!1342675))

(declare-fun m!1342689 () Bool)

(assert (=> b!1454321 m!1342689))

(declare-fun m!1342691 () Bool)

(assert (=> b!1454318 m!1342691))

(declare-fun m!1342693 () Bool)

(assert (=> b!1454318 m!1342693))

(declare-fun m!1342695 () Bool)

(assert (=> b!1454309 m!1342695))

(assert (=> b!1454309 m!1342695))

(declare-fun m!1342697 () Bool)

(assert (=> b!1454309 m!1342697))

(assert (=> b!1454309 m!1342667))

(declare-fun m!1342699 () Bool)

(assert (=> b!1454309 m!1342699))

(assert (=> b!1454316 m!1342675))

(assert (=> b!1454316 m!1342675))

(declare-fun m!1342701 () Bool)

(assert (=> b!1454316 m!1342701))

(declare-fun m!1342703 () Bool)

(assert (=> b!1454310 m!1342703))

(declare-fun m!1342705 () Bool)

(assert (=> start!125020 m!1342705))

(declare-fun m!1342707 () Bool)

(assert (=> start!125020 m!1342707))

(assert (=> b!1454306 m!1342675))

(assert (=> b!1454306 m!1342675))

(declare-fun m!1342709 () Bool)

(assert (=> b!1454306 m!1342709))

(assert (=> b!1454319 m!1342675))

(assert (=> b!1454319 m!1342675))

(declare-fun m!1342711 () Bool)

(assert (=> b!1454319 m!1342711))

(assert (=> b!1454319 m!1342711))

(assert (=> b!1454319 m!1342675))

(declare-fun m!1342713 () Bool)

(assert (=> b!1454319 m!1342713))

(assert (=> b!1454320 m!1342667))

(declare-fun m!1342715 () Bool)

(assert (=> b!1454320 m!1342715))

(assert (=> b!1454314 m!1342675))

(assert (=> b!1454314 m!1342675))

(declare-fun m!1342717 () Bool)

(assert (=> b!1454314 m!1342717))

(declare-fun m!1342719 () Bool)

(assert (=> b!1454313 m!1342719))

(assert (=> b!1454313 m!1342691))

(assert (=> b!1454313 m!1342693))

(push 1)

