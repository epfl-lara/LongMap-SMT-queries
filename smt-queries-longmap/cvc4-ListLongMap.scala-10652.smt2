; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125054 () Bool)

(assert start!125054)

(declare-fun b!1455426 () Bool)

(declare-fun res!986093 () Bool)

(declare-fun e!818976 () Bool)

(assert (=> b!1455426 (=> (not res!986093) (not e!818976))))

(declare-datatypes ((array!98502 0))(
  ( (array!98503 (arr!47539 (Array (_ BitVec 32) (_ BitVec 64))) (size!48089 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98502)

(declare-datatypes ((List!34040 0))(
  ( (Nil!34037) (Cons!34036 (h!35386 (_ BitVec 64)) (t!48734 List!34040)) )
))
(declare-fun arrayNoDuplicates!0 (array!98502 (_ BitVec 32) List!34040) Bool)

(assert (=> b!1455426 (= res!986093 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34037))))

(declare-fun b!1455427 () Bool)

(declare-fun res!986099 () Bool)

(assert (=> b!1455427 (=> (not res!986099) (not e!818976))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98502 (_ BitVec 32)) Bool)

(assert (=> b!1455427 (= res!986099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455428 () Bool)

(declare-fun e!818978 () Bool)

(declare-fun e!818980 () Bool)

(assert (=> b!1455428 (= e!818978 e!818980)))

(declare-fun res!986107 () Bool)

(assert (=> b!1455428 (=> (not res!986107) (not e!818980))))

(declare-datatypes ((SeekEntryResult!11791 0))(
  ( (MissingZero!11791 (index!49556 (_ BitVec 32))) (Found!11791 (index!49557 (_ BitVec 32))) (Intermediate!11791 (undefined!12603 Bool) (index!49558 (_ BitVec 32)) (x!131184 (_ BitVec 32))) (Undefined!11791) (MissingVacant!11791 (index!49559 (_ BitVec 32))) )
))
(declare-fun lt!637950 () SeekEntryResult!11791)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455428 (= res!986107 (= lt!637950 (Intermediate!11791 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637953 () (_ BitVec 64))

(declare-fun lt!637947 () array!98502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98502 (_ BitVec 32)) SeekEntryResult!11791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455428 (= lt!637950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637953 mask!2687) lt!637953 lt!637947 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455428 (= lt!637953 (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455429 () Bool)

(declare-fun e!818975 () Bool)

(assert (=> b!1455429 (= e!818980 (not e!818975))))

(declare-fun res!986106 () Bool)

(assert (=> b!1455429 (=> res!986106 e!818975)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1455429 (= res!986106 (or (and (= (select (arr!47539 a!2862) index!646) (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47539 a!2862) index!646) (select (arr!47539 a!2862) j!93))) (= (select (arr!47539 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818974 () Bool)

(assert (=> b!1455429 e!818974))

(declare-fun res!986105 () Bool)

(assert (=> b!1455429 (=> (not res!986105) (not e!818974))))

(assert (=> b!1455429 (= res!986105 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49078 0))(
  ( (Unit!49079) )
))
(declare-fun lt!637952 () Unit!49078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49078)

(assert (=> b!1455429 (= lt!637952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455430 () Bool)

(declare-fun e!818972 () Bool)

(assert (=> b!1455430 (= e!818972 e!818978)))

(declare-fun res!986108 () Bool)

(assert (=> b!1455430 (=> (not res!986108) (not e!818978))))

(declare-fun lt!637951 () SeekEntryResult!11791)

(assert (=> b!1455430 (= res!986108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47539 a!2862) j!93) mask!2687) (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!637951))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455430 (= lt!637951 (Intermediate!11791 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455431 () Bool)

(declare-fun res!986109 () Bool)

(assert (=> b!1455431 (=> (not res!986109) (not e!818976))))

(assert (=> b!1455431 (= res!986109 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48089 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48089 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48089 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!818981 () Bool)

(declare-fun b!1455432 () Bool)

(assert (=> b!1455432 (= e!818981 (= lt!637950 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637953 lt!637947 mask!2687)))))

(declare-fun res!986094 () Bool)

(assert (=> start!125054 (=> (not res!986094) (not e!818976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125054 (= res!986094 (validMask!0 mask!2687))))

(assert (=> start!125054 e!818976))

(assert (=> start!125054 true))

(declare-fun array_inv!36567 (array!98502) Bool)

(assert (=> start!125054 (array_inv!36567 a!2862)))

(declare-fun b!1455433 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98502 (_ BitVec 32)) SeekEntryResult!11791)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98502 (_ BitVec 32)) SeekEntryResult!11791)

(assert (=> b!1455433 (= e!818981 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637953 lt!637947 mask!2687) (seekEntryOrOpen!0 lt!637953 lt!637947 mask!2687)))))

(declare-fun lt!637948 () SeekEntryResult!11791)

(declare-fun e!818973 () Bool)

(declare-fun lt!637949 () (_ BitVec 32))

(declare-fun b!1455434 () Bool)

(assert (=> b!1455434 (= e!818973 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637949 intermediateAfterIndex!19 lt!637953 lt!637947 mask!2687) lt!637948)))))

(declare-fun b!1455435 () Bool)

(declare-fun e!818979 () Bool)

(assert (=> b!1455435 (= e!818975 e!818979)))

(declare-fun res!986098 () Bool)

(assert (=> b!1455435 (=> res!986098 e!818979)))

(assert (=> b!1455435 (= res!986098 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637949 #b00000000000000000000000000000000) (bvsge lt!637949 (size!48089 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455435 (= lt!637949 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455435 (= lt!637948 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637953 lt!637947 mask!2687))))

(assert (=> b!1455435 (= lt!637948 (seekEntryOrOpen!0 lt!637953 lt!637947 mask!2687))))

(declare-fun b!1455436 () Bool)

(assert (=> b!1455436 (= e!818974 (and (or (= (select (arr!47539 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47539 a!2862) intermediateBeforeIndex!19) (select (arr!47539 a!2862) j!93))) (let ((bdg!53149 (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47539 a!2862) index!646) bdg!53149) (= (select (arr!47539 a!2862) index!646) (select (arr!47539 a!2862) j!93))) (= (select (arr!47539 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53149 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455437 () Bool)

(assert (=> b!1455437 (= e!818973 (not (= lt!637950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637949 lt!637953 lt!637947 mask!2687))))))

(declare-fun b!1455438 () Bool)

(declare-fun res!986103 () Bool)

(assert (=> b!1455438 (=> (not res!986103) (not e!818976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455438 (= res!986103 (validKeyInArray!0 (select (arr!47539 a!2862) i!1006)))))

(declare-fun b!1455439 () Bool)

(declare-fun res!986097 () Bool)

(assert (=> b!1455439 (=> (not res!986097) (not e!818976))))

(assert (=> b!1455439 (= res!986097 (and (= (size!48089 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48089 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48089 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455440 () Bool)

(declare-fun res!986102 () Bool)

(assert (=> b!1455440 (=> (not res!986102) (not e!818980))))

(assert (=> b!1455440 (= res!986102 e!818981)))

(declare-fun c!134178 () Bool)

(assert (=> b!1455440 (= c!134178 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455441 () Bool)

(assert (=> b!1455441 (= e!818979 true)))

(declare-fun lt!637946 () Bool)

(assert (=> b!1455441 (= lt!637946 e!818973)))

(declare-fun c!134177 () Bool)

(assert (=> b!1455441 (= c!134177 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455442 () Bool)

(declare-fun res!986095 () Bool)

(assert (=> b!1455442 (=> (not res!986095) (not e!818978))))

(assert (=> b!1455442 (= res!986095 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!637951))))

(declare-fun b!1455443 () Bool)

(declare-fun res!986110 () Bool)

(assert (=> b!1455443 (=> (not res!986110) (not e!818980))))

(assert (=> b!1455443 (= res!986110 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455444 () Bool)

(assert (=> b!1455444 (= e!818976 e!818972)))

(declare-fun res!986101 () Bool)

(assert (=> b!1455444 (=> (not res!986101) (not e!818972))))

(assert (=> b!1455444 (= res!986101 (= (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455444 (= lt!637947 (array!98503 (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48089 a!2862)))))

(declare-fun b!1455445 () Bool)

(declare-fun res!986096 () Bool)

(assert (=> b!1455445 (=> res!986096 e!818979)))

(assert (=> b!1455445 (= res!986096 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637949 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!637951)))))

(declare-fun b!1455446 () Bool)

(declare-fun res!986104 () Bool)

(assert (=> b!1455446 (=> (not res!986104) (not e!818974))))

(assert (=> b!1455446 (= res!986104 (= (seekEntryOrOpen!0 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) (Found!11791 j!93)))))

(declare-fun b!1455447 () Bool)

(declare-fun res!986100 () Bool)

(assert (=> b!1455447 (=> (not res!986100) (not e!818976))))

(assert (=> b!1455447 (= res!986100 (validKeyInArray!0 (select (arr!47539 a!2862) j!93)))))

(assert (= (and start!125054 res!986094) b!1455439))

(assert (= (and b!1455439 res!986097) b!1455438))

(assert (= (and b!1455438 res!986103) b!1455447))

(assert (= (and b!1455447 res!986100) b!1455427))

(assert (= (and b!1455427 res!986099) b!1455426))

(assert (= (and b!1455426 res!986093) b!1455431))

(assert (= (and b!1455431 res!986109) b!1455444))

(assert (= (and b!1455444 res!986101) b!1455430))

(assert (= (and b!1455430 res!986108) b!1455442))

(assert (= (and b!1455442 res!986095) b!1455428))

(assert (= (and b!1455428 res!986107) b!1455440))

(assert (= (and b!1455440 c!134178) b!1455432))

(assert (= (and b!1455440 (not c!134178)) b!1455433))

(assert (= (and b!1455440 res!986102) b!1455443))

(assert (= (and b!1455443 res!986110) b!1455429))

(assert (= (and b!1455429 res!986105) b!1455446))

(assert (= (and b!1455446 res!986104) b!1455436))

(assert (= (and b!1455429 (not res!986106)) b!1455435))

(assert (= (and b!1455435 (not res!986098)) b!1455445))

(assert (= (and b!1455445 (not res!986096)) b!1455441))

(assert (= (and b!1455441 c!134177) b!1455437))

(assert (= (and b!1455441 (not c!134177)) b!1455434))

(declare-fun m!1343649 () Bool)

(assert (=> b!1455447 m!1343649))

(assert (=> b!1455447 m!1343649))

(declare-fun m!1343651 () Bool)

(assert (=> b!1455447 m!1343651))

(declare-fun m!1343653 () Bool)

(assert (=> b!1455444 m!1343653))

(declare-fun m!1343655 () Bool)

(assert (=> b!1455444 m!1343655))

(declare-fun m!1343657 () Bool)

(assert (=> b!1455428 m!1343657))

(assert (=> b!1455428 m!1343657))

(declare-fun m!1343659 () Bool)

(assert (=> b!1455428 m!1343659))

(assert (=> b!1455428 m!1343653))

(declare-fun m!1343661 () Bool)

(assert (=> b!1455428 m!1343661))

(declare-fun m!1343663 () Bool)

(assert (=> b!1455435 m!1343663))

(declare-fun m!1343665 () Bool)

(assert (=> b!1455435 m!1343665))

(declare-fun m!1343667 () Bool)

(assert (=> b!1455435 m!1343667))

(assert (=> b!1455433 m!1343665))

(assert (=> b!1455433 m!1343667))

(assert (=> b!1455446 m!1343649))

(assert (=> b!1455446 m!1343649))

(declare-fun m!1343669 () Bool)

(assert (=> b!1455446 m!1343669))

(assert (=> b!1455445 m!1343649))

(assert (=> b!1455445 m!1343649))

(declare-fun m!1343671 () Bool)

(assert (=> b!1455445 m!1343671))

(declare-fun m!1343673 () Bool)

(assert (=> b!1455426 m!1343673))

(declare-fun m!1343675 () Bool)

(assert (=> b!1455434 m!1343675))

(declare-fun m!1343677 () Bool)

(assert (=> b!1455432 m!1343677))

(declare-fun m!1343679 () Bool)

(assert (=> b!1455437 m!1343679))

(declare-fun m!1343681 () Bool)

(assert (=> b!1455438 m!1343681))

(assert (=> b!1455438 m!1343681))

(declare-fun m!1343683 () Bool)

(assert (=> b!1455438 m!1343683))

(declare-fun m!1343685 () Bool)

(assert (=> start!125054 m!1343685))

(declare-fun m!1343687 () Bool)

(assert (=> start!125054 m!1343687))

(declare-fun m!1343689 () Bool)

(assert (=> b!1455429 m!1343689))

(assert (=> b!1455429 m!1343653))

(declare-fun m!1343691 () Bool)

(assert (=> b!1455429 m!1343691))

(declare-fun m!1343693 () Bool)

(assert (=> b!1455429 m!1343693))

(declare-fun m!1343695 () Bool)

(assert (=> b!1455429 m!1343695))

(assert (=> b!1455429 m!1343649))

(assert (=> b!1455442 m!1343649))

(assert (=> b!1455442 m!1343649))

(declare-fun m!1343697 () Bool)

(assert (=> b!1455442 m!1343697))

(declare-fun m!1343699 () Bool)

(assert (=> b!1455427 m!1343699))

(assert (=> b!1455430 m!1343649))

(assert (=> b!1455430 m!1343649))

(declare-fun m!1343701 () Bool)

(assert (=> b!1455430 m!1343701))

(assert (=> b!1455430 m!1343701))

(assert (=> b!1455430 m!1343649))

(declare-fun m!1343703 () Bool)

(assert (=> b!1455430 m!1343703))

(assert (=> b!1455436 m!1343653))

(declare-fun m!1343705 () Bool)

(assert (=> b!1455436 m!1343705))

(assert (=> b!1455436 m!1343691))

(assert (=> b!1455436 m!1343693))

(assert (=> b!1455436 m!1343649))

(push 1)

