; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126060 () Bool)

(assert start!126060)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!827278 () Bool)

(declare-fun b!1473819 () Bool)

(declare-datatypes ((array!99232 0))(
  ( (array!99233 (arr!47896 (Array (_ BitVec 32) (_ BitVec 64))) (size!48447 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99232)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1473819 (= e!827278 (or (= (select (arr!47896 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47896 a!2862) intermediateBeforeIndex!19) (select (arr!47896 a!2862) j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644115 () (_ BitVec 64))

(declare-fun e!827279 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1473820 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!644112 () array!99232)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12033 0))(
  ( (MissingZero!12033 (index!50524 (_ BitVec 32))) (Found!12033 (index!50525 (_ BitVec 32))) (Intermediate!12033 (undefined!12845 Bool) (index!50526 (_ BitVec 32)) (x!132293 (_ BitVec 32))) (Undefined!12033) (MissingVacant!12033 (index!50527 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12033)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12033)

(assert (=> b!1473820 (= e!827279 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644115 lt!644112 mask!2687) (seekEntryOrOpen!0 lt!644115 lt!644112 mask!2687)))))

(declare-fun b!1473821 () Bool)

(declare-fun res!1000425 () Bool)

(declare-fun e!827282 () Bool)

(assert (=> b!1473821 (=> (not res!1000425) (not e!827282))))

(declare-datatypes ((List!34384 0))(
  ( (Nil!34381) (Cons!34380 (h!35750 (_ BitVec 64)) (t!49070 List!34384)) )
))
(declare-fun arrayNoDuplicates!0 (array!99232 (_ BitVec 32) List!34384) Bool)

(assert (=> b!1473821 (= res!1000425 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34381))))

(declare-fun b!1473822 () Bool)

(declare-fun e!827280 () Bool)

(declare-fun e!827281 () Bool)

(assert (=> b!1473822 (= e!827280 e!827281)))

(declare-fun res!1000435 () Bool)

(assert (=> b!1473822 (=> (not res!1000435) (not e!827281))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!644116 () SeekEntryResult!12033)

(assert (=> b!1473822 (= res!1000435 (= lt!644116 (Intermediate!12033 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99232 (_ BitVec 32)) SeekEntryResult!12033)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473822 (= lt!644116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644115 mask!2687) lt!644115 lt!644112 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473822 (= lt!644115 (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473823 () Bool)

(declare-fun res!1000422 () Bool)

(assert (=> b!1473823 (=> (not res!1000422) (not e!827278))))

(assert (=> b!1473823 (= res!1000422 (= (seekEntryOrOpen!0 (select (arr!47896 a!2862) j!93) a!2862 mask!2687) (Found!12033 j!93)))))

(declare-fun b!1473824 () Bool)

(declare-fun res!1000430 () Bool)

(assert (=> b!1473824 (=> (not res!1000430) (not e!827282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473824 (= res!1000430 (validKeyInArray!0 (select (arr!47896 a!2862) i!1006)))))

(declare-fun b!1473825 () Bool)

(declare-fun e!827277 () Bool)

(assert (=> b!1473825 (= e!827282 e!827277)))

(declare-fun res!1000423 () Bool)

(assert (=> b!1473825 (=> (not res!1000423) (not e!827277))))

(assert (=> b!1473825 (= res!1000423 (= (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473825 (= lt!644112 (array!99233 (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48447 a!2862)))))

(declare-fun b!1473827 () Bool)

(declare-fun res!1000426 () Bool)

(assert (=> b!1473827 (=> (not res!1000426) (not e!827282))))

(assert (=> b!1473827 (= res!1000426 (validKeyInArray!0 (select (arr!47896 a!2862) j!93)))))

(declare-fun b!1473828 () Bool)

(declare-fun res!1000436 () Bool)

(assert (=> b!1473828 (=> (not res!1000436) (not e!827282))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473828 (= res!1000436 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48447 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48447 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48447 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473829 () Bool)

(declare-fun res!1000434 () Bool)

(assert (=> b!1473829 (=> (not res!1000434) (not e!827281))))

(assert (=> b!1473829 (= res!1000434 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473830 () Bool)

(assert (=> b!1473830 (= e!827277 e!827280)))

(declare-fun res!1000424 () Bool)

(assert (=> b!1473830 (=> (not res!1000424) (not e!827280))))

(declare-fun lt!644113 () SeekEntryResult!12033)

(assert (=> b!1473830 (= res!1000424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47896 a!2862) j!93) mask!2687) (select (arr!47896 a!2862) j!93) a!2862 mask!2687) lt!644113))))

(assert (=> b!1473830 (= lt!644113 (Intermediate!12033 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473831 () Bool)

(assert (=> b!1473831 (= e!827279 (= lt!644116 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644115 lt!644112 mask!2687)))))

(declare-fun b!1473832 () Bool)

(declare-fun res!1000429 () Bool)

(assert (=> b!1473832 (=> (not res!1000429) (not e!827282))))

(assert (=> b!1473832 (= res!1000429 (and (= (size!48447 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48447 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48447 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473833 () Bool)

(declare-fun res!1000431 () Bool)

(assert (=> b!1473833 (=> (not res!1000431) (not e!827280))))

(assert (=> b!1473833 (= res!1000431 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47896 a!2862) j!93) a!2862 mask!2687) lt!644113))))

(declare-fun b!1473834 () Bool)

(assert (=> b!1473834 (= e!827281 (not true))))

(assert (=> b!1473834 e!827278))

(declare-fun res!1000433 () Bool)

(assert (=> b!1473834 (=> (not res!1000433) (not e!827278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99232 (_ BitVec 32)) Bool)

(assert (=> b!1473834 (= res!1000433 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49439 0))(
  ( (Unit!49440) )
))
(declare-fun lt!644114 () Unit!49439)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49439)

(assert (=> b!1473834 (= lt!644114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473835 () Bool)

(declare-fun res!1000427 () Bool)

(assert (=> b!1473835 (=> (not res!1000427) (not e!827282))))

(assert (=> b!1473835 (= res!1000427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473826 () Bool)

(declare-fun res!1000428 () Bool)

(assert (=> b!1473826 (=> (not res!1000428) (not e!827281))))

(assert (=> b!1473826 (= res!1000428 e!827279)))

(declare-fun c!136222 () Bool)

(assert (=> b!1473826 (= c!136222 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1000432 () Bool)

(assert (=> start!126060 (=> (not res!1000432) (not e!827282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126060 (= res!1000432 (validMask!0 mask!2687))))

(assert (=> start!126060 e!827282))

(assert (=> start!126060 true))

(declare-fun array_inv!37177 (array!99232) Bool)

(assert (=> start!126060 (array_inv!37177 a!2862)))

(assert (= (and start!126060 res!1000432) b!1473832))

(assert (= (and b!1473832 res!1000429) b!1473824))

(assert (= (and b!1473824 res!1000430) b!1473827))

(assert (= (and b!1473827 res!1000426) b!1473835))

(assert (= (and b!1473835 res!1000427) b!1473821))

(assert (= (and b!1473821 res!1000425) b!1473828))

(assert (= (and b!1473828 res!1000436) b!1473825))

(assert (= (and b!1473825 res!1000423) b!1473830))

(assert (= (and b!1473830 res!1000424) b!1473833))

(assert (= (and b!1473833 res!1000431) b!1473822))

(assert (= (and b!1473822 res!1000435) b!1473826))

(assert (= (and b!1473826 c!136222) b!1473831))

(assert (= (and b!1473826 (not c!136222)) b!1473820))

(assert (= (and b!1473826 res!1000428) b!1473829))

(assert (= (and b!1473829 res!1000434) b!1473834))

(assert (= (and b!1473834 res!1000433) b!1473823))

(assert (= (and b!1473823 res!1000422) b!1473819))

(declare-fun m!1360543 () Bool)

(assert (=> b!1473834 m!1360543))

(declare-fun m!1360545 () Bool)

(assert (=> b!1473834 m!1360545))

(declare-fun m!1360547 () Bool)

(assert (=> b!1473821 m!1360547))

(declare-fun m!1360549 () Bool)

(assert (=> b!1473831 m!1360549))

(declare-fun m!1360551 () Bool)

(assert (=> b!1473822 m!1360551))

(assert (=> b!1473822 m!1360551))

(declare-fun m!1360553 () Bool)

(assert (=> b!1473822 m!1360553))

(declare-fun m!1360555 () Bool)

(assert (=> b!1473822 m!1360555))

(declare-fun m!1360557 () Bool)

(assert (=> b!1473822 m!1360557))

(declare-fun m!1360559 () Bool)

(assert (=> b!1473827 m!1360559))

(assert (=> b!1473827 m!1360559))

(declare-fun m!1360561 () Bool)

(assert (=> b!1473827 m!1360561))

(assert (=> b!1473830 m!1360559))

(assert (=> b!1473830 m!1360559))

(declare-fun m!1360563 () Bool)

(assert (=> b!1473830 m!1360563))

(assert (=> b!1473830 m!1360563))

(assert (=> b!1473830 m!1360559))

(declare-fun m!1360565 () Bool)

(assert (=> b!1473830 m!1360565))

(declare-fun m!1360567 () Bool)

(assert (=> start!126060 m!1360567))

(declare-fun m!1360569 () Bool)

(assert (=> start!126060 m!1360569))

(assert (=> b!1473833 m!1360559))

(assert (=> b!1473833 m!1360559))

(declare-fun m!1360571 () Bool)

(assert (=> b!1473833 m!1360571))

(declare-fun m!1360573 () Bool)

(assert (=> b!1473819 m!1360573))

(assert (=> b!1473819 m!1360559))

(declare-fun m!1360575 () Bool)

(assert (=> b!1473820 m!1360575))

(declare-fun m!1360577 () Bool)

(assert (=> b!1473820 m!1360577))

(assert (=> b!1473825 m!1360555))

(declare-fun m!1360579 () Bool)

(assert (=> b!1473825 m!1360579))

(declare-fun m!1360581 () Bool)

(assert (=> b!1473824 m!1360581))

(assert (=> b!1473824 m!1360581))

(declare-fun m!1360583 () Bool)

(assert (=> b!1473824 m!1360583))

(assert (=> b!1473823 m!1360559))

(assert (=> b!1473823 m!1360559))

(declare-fun m!1360585 () Bool)

(assert (=> b!1473823 m!1360585))

(declare-fun m!1360587 () Bool)

(assert (=> b!1473835 m!1360587))

(check-sat (not b!1473833) (not b!1473830) (not start!126060) (not b!1473822) (not b!1473834) (not b!1473831) (not b!1473820) (not b!1473835) (not b!1473821) (not b!1473823) (not b!1473824) (not b!1473827))
(check-sat)
