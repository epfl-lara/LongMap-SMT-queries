; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124900 () Bool)

(assert start!124900)

(declare-fun b!1451552 () Bool)

(declare-fun res!982873 () Bool)

(declare-fun e!817237 () Bool)

(assert (=> b!1451552 (=> (not res!982873) (not e!817237))))

(declare-datatypes ((array!98326 0))(
  ( (array!98327 (arr!47452 (Array (_ BitVec 32) (_ BitVec 64))) (size!48004 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98326)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451552 (= res!982873 (validKeyInArray!0 (select (arr!47452 a!2862) j!93)))))

(declare-fun b!1451553 () Bool)

(declare-fun res!982868 () Bool)

(declare-fun e!817238 () Bool)

(assert (=> b!1451553 (=> (not res!982868) (not e!817238))))

(declare-fun e!817233 () Bool)

(assert (=> b!1451553 (= res!982868 e!817233)))

(declare-fun c!133855 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451553 (= c!133855 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!636507 () array!98326)

(declare-fun b!1451554 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!636506 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11729 0))(
  ( (MissingZero!11729 (index!49308 (_ BitVec 32))) (Found!11729 (index!49309 (_ BitVec 32))) (Intermediate!11729 (undefined!12541 Bool) (index!49310 (_ BitVec 32)) (x!130957 (_ BitVec 32))) (Undefined!11729) (MissingVacant!11729 (index!49311 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98326 (_ BitVec 32)) SeekEntryResult!11729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98326 (_ BitVec 32)) SeekEntryResult!11729)

(assert (=> b!1451554 (= e!817233 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636506 lt!636507 mask!2687) (seekEntryOrOpen!0 lt!636506 lt!636507 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1451555 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun e!817236 () Bool)

(assert (=> b!1451555 (= e!817236 (and (or (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) (select (arr!47452 a!2862) j!93))) (or (and (= (select (arr!47452 a!2862) index!646) (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47452 a!2862) index!646) (select (arr!47452 a!2862) j!93))) (= (select (arr!47452 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451556 () Bool)

(declare-fun res!982870 () Bool)

(assert (=> b!1451556 (=> (not res!982870) (not e!817238))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451556 (= res!982870 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451557 () Bool)

(declare-fun res!982879 () Bool)

(assert (=> b!1451557 (=> (not res!982879) (not e!817237))))

(declare-datatypes ((List!34031 0))(
  ( (Nil!34028) (Cons!34027 (h!35377 (_ BitVec 64)) (t!48717 List!34031)) )
))
(declare-fun arrayNoDuplicates!0 (array!98326 (_ BitVec 32) List!34031) Bool)

(assert (=> b!1451557 (= res!982879 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34028))))

(declare-fun b!1451558 () Bool)

(assert (=> b!1451558 (= e!817238 (not true))))

(assert (=> b!1451558 e!817236))

(declare-fun res!982875 () Bool)

(assert (=> b!1451558 (=> (not res!982875) (not e!817236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98326 (_ BitVec 32)) Bool)

(assert (=> b!1451558 (= res!982875 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48795 0))(
  ( (Unit!48796) )
))
(declare-fun lt!636509 () Unit!48795)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48795)

(assert (=> b!1451558 (= lt!636509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!982872 () Bool)

(assert (=> start!124900 (=> (not res!982872) (not e!817237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124900 (= res!982872 (validMask!0 mask!2687))))

(assert (=> start!124900 e!817237))

(assert (=> start!124900 true))

(declare-fun array_inv!36685 (array!98326) Bool)

(assert (=> start!124900 (array_inv!36685 a!2862)))

(declare-fun b!1451559 () Bool)

(declare-fun e!817239 () Bool)

(declare-fun e!817234 () Bool)

(assert (=> b!1451559 (= e!817239 e!817234)))

(declare-fun res!982880 () Bool)

(assert (=> b!1451559 (=> (not res!982880) (not e!817234))))

(declare-fun lt!636510 () SeekEntryResult!11729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98326 (_ BitVec 32)) SeekEntryResult!11729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451559 (= res!982880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47452 a!2862) j!93) mask!2687) (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!636510))))

(assert (=> b!1451559 (= lt!636510 (Intermediate!11729 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451560 () Bool)

(declare-fun res!982869 () Bool)

(assert (=> b!1451560 (=> (not res!982869) (not e!817237))))

(assert (=> b!1451560 (= res!982869 (and (= (size!48004 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48004 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48004 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451561 () Bool)

(declare-fun res!982882 () Bool)

(assert (=> b!1451561 (=> (not res!982882) (not e!817236))))

(assert (=> b!1451561 (= res!982882 (= (seekEntryOrOpen!0 (select (arr!47452 a!2862) j!93) a!2862 mask!2687) (Found!11729 j!93)))))

(declare-fun b!1451562 () Bool)

(declare-fun res!982876 () Bool)

(assert (=> b!1451562 (=> (not res!982876) (not e!817237))))

(assert (=> b!1451562 (= res!982876 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48004 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48004 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48004 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451563 () Bool)

(declare-fun res!982878 () Bool)

(assert (=> b!1451563 (=> (not res!982878) (not e!817237))))

(assert (=> b!1451563 (= res!982878 (validKeyInArray!0 (select (arr!47452 a!2862) i!1006)))))

(declare-fun b!1451564 () Bool)

(declare-fun res!982871 () Bool)

(assert (=> b!1451564 (=> (not res!982871) (not e!817234))))

(assert (=> b!1451564 (= res!982871 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!636510))))

(declare-fun b!1451565 () Bool)

(assert (=> b!1451565 (= e!817237 e!817239)))

(declare-fun res!982877 () Bool)

(assert (=> b!1451565 (=> (not res!982877) (not e!817239))))

(assert (=> b!1451565 (= res!982877 (= (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451565 (= lt!636507 (array!98327 (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48004 a!2862)))))

(declare-fun b!1451566 () Bool)

(declare-fun res!982881 () Bool)

(assert (=> b!1451566 (=> (not res!982881) (not e!817237))))

(assert (=> b!1451566 (= res!982881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!636508 () SeekEntryResult!11729)

(declare-fun b!1451567 () Bool)

(assert (=> b!1451567 (= e!817233 (= lt!636508 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636506 lt!636507 mask!2687)))))

(declare-fun b!1451568 () Bool)

(assert (=> b!1451568 (= e!817234 e!817238)))

(declare-fun res!982874 () Bool)

(assert (=> b!1451568 (=> (not res!982874) (not e!817238))))

(assert (=> b!1451568 (= res!982874 (= lt!636508 (Intermediate!11729 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451568 (= lt!636508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636506 mask!2687) lt!636506 lt!636507 mask!2687))))

(assert (=> b!1451568 (= lt!636506 (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124900 res!982872) b!1451560))

(assert (= (and b!1451560 res!982869) b!1451563))

(assert (= (and b!1451563 res!982878) b!1451552))

(assert (= (and b!1451552 res!982873) b!1451566))

(assert (= (and b!1451566 res!982881) b!1451557))

(assert (= (and b!1451557 res!982879) b!1451562))

(assert (= (and b!1451562 res!982876) b!1451565))

(assert (= (and b!1451565 res!982877) b!1451559))

(assert (= (and b!1451559 res!982880) b!1451564))

(assert (= (and b!1451564 res!982871) b!1451568))

(assert (= (and b!1451568 res!982874) b!1451553))

(assert (= (and b!1451553 c!133855) b!1451567))

(assert (= (and b!1451553 (not c!133855)) b!1451554))

(assert (= (and b!1451553 res!982868) b!1451556))

(assert (= (and b!1451556 res!982870) b!1451558))

(assert (= (and b!1451558 res!982875) b!1451561))

(assert (= (and b!1451561 res!982882) b!1451555))

(declare-fun m!1339659 () Bool)

(assert (=> b!1451565 m!1339659))

(declare-fun m!1339661 () Bool)

(assert (=> b!1451565 m!1339661))

(declare-fun m!1339663 () Bool)

(assert (=> b!1451567 m!1339663))

(declare-fun m!1339665 () Bool)

(assert (=> b!1451566 m!1339665))

(declare-fun m!1339667 () Bool)

(assert (=> b!1451554 m!1339667))

(declare-fun m!1339669 () Bool)

(assert (=> b!1451554 m!1339669))

(declare-fun m!1339671 () Bool)

(assert (=> b!1451563 m!1339671))

(assert (=> b!1451563 m!1339671))

(declare-fun m!1339673 () Bool)

(assert (=> b!1451563 m!1339673))

(declare-fun m!1339675 () Bool)

(assert (=> start!124900 m!1339675))

(declare-fun m!1339677 () Bool)

(assert (=> start!124900 m!1339677))

(declare-fun m!1339679 () Bool)

(assert (=> b!1451564 m!1339679))

(assert (=> b!1451564 m!1339679))

(declare-fun m!1339681 () Bool)

(assert (=> b!1451564 m!1339681))

(assert (=> b!1451555 m!1339659))

(declare-fun m!1339683 () Bool)

(assert (=> b!1451555 m!1339683))

(declare-fun m!1339685 () Bool)

(assert (=> b!1451555 m!1339685))

(declare-fun m!1339687 () Bool)

(assert (=> b!1451555 m!1339687))

(assert (=> b!1451555 m!1339679))

(declare-fun m!1339689 () Bool)

(assert (=> b!1451568 m!1339689))

(assert (=> b!1451568 m!1339689))

(declare-fun m!1339691 () Bool)

(assert (=> b!1451568 m!1339691))

(assert (=> b!1451568 m!1339659))

(declare-fun m!1339693 () Bool)

(assert (=> b!1451568 m!1339693))

(declare-fun m!1339695 () Bool)

(assert (=> b!1451558 m!1339695))

(declare-fun m!1339697 () Bool)

(assert (=> b!1451558 m!1339697))

(declare-fun m!1339699 () Bool)

(assert (=> b!1451557 m!1339699))

(assert (=> b!1451552 m!1339679))

(assert (=> b!1451552 m!1339679))

(declare-fun m!1339701 () Bool)

(assert (=> b!1451552 m!1339701))

(assert (=> b!1451561 m!1339679))

(assert (=> b!1451561 m!1339679))

(declare-fun m!1339703 () Bool)

(assert (=> b!1451561 m!1339703))

(assert (=> b!1451559 m!1339679))

(assert (=> b!1451559 m!1339679))

(declare-fun m!1339705 () Bool)

(assert (=> b!1451559 m!1339705))

(assert (=> b!1451559 m!1339705))

(assert (=> b!1451559 m!1339679))

(declare-fun m!1339707 () Bool)

(assert (=> b!1451559 m!1339707))

(check-sat (not b!1451559) (not b!1451563) (not b!1451552) (not b!1451567) (not b!1451564) (not start!124900) (not b!1451558) (not b!1451557) (not b!1451566) (not b!1451561) (not b!1451568) (not b!1451554))
(check-sat)
