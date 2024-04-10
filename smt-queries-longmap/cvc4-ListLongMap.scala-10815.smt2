; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126542 () Bool)

(assert start!126542)

(declare-fun b!1484863 () Bool)

(declare-fun res!1009618 () Bool)

(declare-fun e!832480 () Bool)

(assert (=> b!1484863 (=> (not res!1009618) (not e!832480))))

(declare-fun e!832484 () Bool)

(assert (=> b!1484863 (= res!1009618 e!832484)))

(declare-fun c!137154 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484863 (= c!137154 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!647906 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99504 0))(
  ( (array!99505 (arr!48028 (Array (_ BitVec 32) (_ BitVec 64))) (size!48578 (_ BitVec 32))) )
))
(declare-fun lt!647905 () array!99504)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1484864 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12268 0))(
  ( (MissingZero!12268 (index!51464 (_ BitVec 32))) (Found!12268 (index!51465 (_ BitVec 32))) (Intermediate!12268 (undefined!13080 Bool) (index!51466 (_ BitVec 32)) (x!133040 (_ BitVec 32))) (Undefined!12268) (MissingVacant!12268 (index!51467 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99504 (_ BitVec 32)) SeekEntryResult!12268)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99504 (_ BitVec 32)) SeekEntryResult!12268)

(assert (=> b!1484864 (= e!832484 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647906 lt!647905 mask!2687) (seekEntryOrOpen!0 lt!647906 lt!647905 mask!2687)))))

(declare-fun lt!647901 () SeekEntryResult!12268)

(declare-fun b!1484865 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99504 (_ BitVec 32)) SeekEntryResult!12268)

(assert (=> b!1484865 (= e!832484 (= lt!647901 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647906 lt!647905 mask!2687)))))

(declare-fun b!1484866 () Bool)

(declare-fun e!832487 () Bool)

(declare-fun e!832478 () Bool)

(assert (=> b!1484866 (= e!832487 e!832478)))

(declare-fun res!1009616 () Bool)

(assert (=> b!1484866 (=> (not res!1009616) (not e!832478))))

(declare-fun lt!647904 () SeekEntryResult!12268)

(declare-fun a!2862 () array!99504)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484866 (= res!1009616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48028 a!2862) j!93) mask!2687) (select (arr!48028 a!2862) j!93) a!2862 mask!2687) lt!647904))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484866 (= lt!647904 (Intermediate!12268 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484867 () Bool)

(declare-fun res!1009613 () Bool)

(declare-fun e!832485 () Bool)

(assert (=> b!1484867 (=> (not res!1009613) (not e!832485))))

(assert (=> b!1484867 (= res!1009613 (= (seekEntryOrOpen!0 (select (arr!48028 a!2862) j!93) a!2862 mask!2687) (Found!12268 j!93)))))

(declare-fun b!1484868 () Bool)

(declare-fun res!1009612 () Bool)

(declare-fun e!832483 () Bool)

(assert (=> b!1484868 (=> (not res!1009612) (not e!832483))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484868 (= res!1009612 (and (= (size!48578 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48578 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48578 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484869 () Bool)

(declare-fun e!832486 () Bool)

(assert (=> b!1484869 (= e!832486 true)))

(declare-fun lt!647903 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484869 (= lt!647903 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1009617 () Bool)

(assert (=> start!126542 (=> (not res!1009617) (not e!832483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126542 (= res!1009617 (validMask!0 mask!2687))))

(assert (=> start!126542 e!832483))

(assert (=> start!126542 true))

(declare-fun array_inv!37056 (array!99504) Bool)

(assert (=> start!126542 (array_inv!37056 a!2862)))

(declare-fun b!1484870 () Bool)

(declare-fun res!1009604 () Bool)

(assert (=> b!1484870 (=> (not res!1009604) (not e!832483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99504 (_ BitVec 32)) Bool)

(assert (=> b!1484870 (= res!1009604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484871 () Bool)

(declare-fun res!1009608 () Bool)

(assert (=> b!1484871 (=> (not res!1009608) (not e!832483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484871 (= res!1009608 (validKeyInArray!0 (select (arr!48028 a!2862) j!93)))))

(declare-fun b!1484872 () Bool)

(declare-fun res!1009614 () Bool)

(assert (=> b!1484872 (=> (not res!1009614) (not e!832483))))

(declare-datatypes ((List!34529 0))(
  ( (Nil!34526) (Cons!34525 (h!35899 (_ BitVec 64)) (t!49223 List!34529)) )
))
(declare-fun arrayNoDuplicates!0 (array!99504 (_ BitVec 32) List!34529) Bool)

(assert (=> b!1484872 (= res!1009614 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34526))))

(declare-fun b!1484873 () Bool)

(declare-fun res!1009601 () Bool)

(assert (=> b!1484873 (=> (not res!1009601) (not e!832485))))

(assert (=> b!1484873 (= res!1009601 (or (= (select (arr!48028 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48028 a!2862) intermediateBeforeIndex!19) (select (arr!48028 a!2862) j!93))))))

(declare-fun b!1484874 () Bool)

(assert (=> b!1484874 (= e!832478 e!832480)))

(declare-fun res!1009605 () Bool)

(assert (=> b!1484874 (=> (not res!1009605) (not e!832480))))

(assert (=> b!1484874 (= res!1009605 (= lt!647901 (Intermediate!12268 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484874 (= lt!647901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647906 mask!2687) lt!647906 lt!647905 mask!2687))))

(assert (=> b!1484874 (= lt!647906 (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484875 () Bool)

(assert (=> b!1484875 (= e!832480 (not e!832486))))

(declare-fun res!1009607 () Bool)

(assert (=> b!1484875 (=> res!1009607 e!832486)))

(assert (=> b!1484875 (= res!1009607 (or (and (= (select (arr!48028 a!2862) index!646) (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48028 a!2862) index!646) (select (arr!48028 a!2862) j!93))) (= (select (arr!48028 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484875 e!832485))

(declare-fun res!1009609 () Bool)

(assert (=> b!1484875 (=> (not res!1009609) (not e!832485))))

(assert (=> b!1484875 (= res!1009609 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49876 0))(
  ( (Unit!49877) )
))
(declare-fun lt!647902 () Unit!49876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49876)

(assert (=> b!1484875 (= lt!647902 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484876 () Bool)

(declare-fun res!1009602 () Bool)

(assert (=> b!1484876 (=> (not res!1009602) (not e!832483))))

(assert (=> b!1484876 (= res!1009602 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48578 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48578 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48578 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484877 () Bool)

(assert (=> b!1484877 (= e!832483 e!832487)))

(declare-fun res!1009615 () Bool)

(assert (=> b!1484877 (=> (not res!1009615) (not e!832487))))

(assert (=> b!1484877 (= res!1009615 (= (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484877 (= lt!647905 (array!99505 (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48578 a!2862)))))

(declare-fun e!832481 () Bool)

(declare-fun b!1484878 () Bool)

(assert (=> b!1484878 (= e!832481 (= (seekEntryOrOpen!0 lt!647906 lt!647905 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647906 lt!647905 mask!2687)))))

(declare-fun b!1484879 () Bool)

(declare-fun e!832479 () Bool)

(assert (=> b!1484879 (= e!832485 e!832479)))

(declare-fun res!1009606 () Bool)

(assert (=> b!1484879 (=> res!1009606 e!832479)))

(declare-fun lt!647907 () (_ BitVec 64))

(assert (=> b!1484879 (= res!1009606 (or (and (= (select (arr!48028 a!2862) index!646) lt!647907) (= (select (arr!48028 a!2862) index!646) (select (arr!48028 a!2862) j!93))) (= (select (arr!48028 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484879 (= lt!647907 (select (store (arr!48028 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484880 () Bool)

(assert (=> b!1484880 (= e!832479 e!832481)))

(declare-fun res!1009610 () Bool)

(assert (=> b!1484880 (=> (not res!1009610) (not e!832481))))

(assert (=> b!1484880 (= res!1009610 (and (= index!646 intermediateAfterIndex!19) (= lt!647907 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484881 () Bool)

(declare-fun res!1009603 () Bool)

(assert (=> b!1484881 (=> (not res!1009603) (not e!832480))))

(assert (=> b!1484881 (= res!1009603 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484882 () Bool)

(declare-fun res!1009611 () Bool)

(assert (=> b!1484882 (=> (not res!1009611) (not e!832478))))

(assert (=> b!1484882 (= res!1009611 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48028 a!2862) j!93) a!2862 mask!2687) lt!647904))))

(declare-fun b!1484883 () Bool)

(declare-fun res!1009600 () Bool)

(assert (=> b!1484883 (=> (not res!1009600) (not e!832483))))

(assert (=> b!1484883 (= res!1009600 (validKeyInArray!0 (select (arr!48028 a!2862) i!1006)))))

(assert (= (and start!126542 res!1009617) b!1484868))

(assert (= (and b!1484868 res!1009612) b!1484883))

(assert (= (and b!1484883 res!1009600) b!1484871))

(assert (= (and b!1484871 res!1009608) b!1484870))

(assert (= (and b!1484870 res!1009604) b!1484872))

(assert (= (and b!1484872 res!1009614) b!1484876))

(assert (= (and b!1484876 res!1009602) b!1484877))

(assert (= (and b!1484877 res!1009615) b!1484866))

(assert (= (and b!1484866 res!1009616) b!1484882))

(assert (= (and b!1484882 res!1009611) b!1484874))

(assert (= (and b!1484874 res!1009605) b!1484863))

(assert (= (and b!1484863 c!137154) b!1484865))

(assert (= (and b!1484863 (not c!137154)) b!1484864))

(assert (= (and b!1484863 res!1009618) b!1484881))

(assert (= (and b!1484881 res!1009603) b!1484875))

(assert (= (and b!1484875 res!1009609) b!1484867))

(assert (= (and b!1484867 res!1009613) b!1484873))

(assert (= (and b!1484873 res!1009601) b!1484879))

(assert (= (and b!1484879 (not res!1009606)) b!1484880))

(assert (= (and b!1484880 res!1009610) b!1484878))

(assert (= (and b!1484875 (not res!1009607)) b!1484869))

(declare-fun m!1370097 () Bool)

(assert (=> b!1484869 m!1370097))

(declare-fun m!1370099 () Bool)

(assert (=> b!1484873 m!1370099))

(declare-fun m!1370101 () Bool)

(assert (=> b!1484873 m!1370101))

(declare-fun m!1370103 () Bool)

(assert (=> b!1484874 m!1370103))

(assert (=> b!1484874 m!1370103))

(declare-fun m!1370105 () Bool)

(assert (=> b!1484874 m!1370105))

(declare-fun m!1370107 () Bool)

(assert (=> b!1484874 m!1370107))

(declare-fun m!1370109 () Bool)

(assert (=> b!1484874 m!1370109))

(assert (=> b!1484866 m!1370101))

(assert (=> b!1484866 m!1370101))

(declare-fun m!1370111 () Bool)

(assert (=> b!1484866 m!1370111))

(assert (=> b!1484866 m!1370111))

(assert (=> b!1484866 m!1370101))

(declare-fun m!1370113 () Bool)

(assert (=> b!1484866 m!1370113))

(declare-fun m!1370115 () Bool)

(assert (=> b!1484865 m!1370115))

(declare-fun m!1370117 () Bool)

(assert (=> b!1484883 m!1370117))

(assert (=> b!1484883 m!1370117))

(declare-fun m!1370119 () Bool)

(assert (=> b!1484883 m!1370119))

(declare-fun m!1370121 () Bool)

(assert (=> b!1484879 m!1370121))

(assert (=> b!1484879 m!1370101))

(assert (=> b!1484879 m!1370107))

(declare-fun m!1370123 () Bool)

(assert (=> b!1484879 m!1370123))

(assert (=> b!1484877 m!1370107))

(declare-fun m!1370125 () Bool)

(assert (=> b!1484877 m!1370125))

(assert (=> b!1484871 m!1370101))

(assert (=> b!1484871 m!1370101))

(declare-fun m!1370127 () Bool)

(assert (=> b!1484871 m!1370127))

(declare-fun m!1370129 () Bool)

(assert (=> b!1484872 m!1370129))

(declare-fun m!1370131 () Bool)

(assert (=> b!1484864 m!1370131))

(declare-fun m!1370133 () Bool)

(assert (=> b!1484864 m!1370133))

(assert (=> b!1484867 m!1370101))

(assert (=> b!1484867 m!1370101))

(declare-fun m!1370135 () Bool)

(assert (=> b!1484867 m!1370135))

(declare-fun m!1370137 () Bool)

(assert (=> b!1484875 m!1370137))

(assert (=> b!1484875 m!1370107))

(assert (=> b!1484875 m!1370123))

(assert (=> b!1484875 m!1370121))

(declare-fun m!1370139 () Bool)

(assert (=> b!1484875 m!1370139))

(assert (=> b!1484875 m!1370101))

(assert (=> b!1484882 m!1370101))

(assert (=> b!1484882 m!1370101))

(declare-fun m!1370141 () Bool)

(assert (=> b!1484882 m!1370141))

(declare-fun m!1370143 () Bool)

(assert (=> start!126542 m!1370143))

(declare-fun m!1370145 () Bool)

(assert (=> start!126542 m!1370145))

(declare-fun m!1370147 () Bool)

(assert (=> b!1484870 m!1370147))

(assert (=> b!1484878 m!1370133))

(assert (=> b!1484878 m!1370131))

(push 1)

