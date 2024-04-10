; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125776 () Bool)

(assert start!125776)

(declare-fun b!1471958 () Bool)

(declare-fun res!999685 () Bool)

(declare-fun e!826156 () Bool)

(assert (=> b!1471958 (=> (not res!999685) (not e!826156))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12080 0))(
  ( (MissingZero!12080 (index!50712 (_ BitVec 32))) (Found!12080 (index!50713 (_ BitVec 32))) (Intermediate!12080 (undefined!12892 Bool) (index!50714 (_ BitVec 32)) (x!132299 (_ BitVec 32))) (Undefined!12080) (MissingVacant!12080 (index!50715 (_ BitVec 32))) )
))
(declare-fun lt!643433 () SeekEntryResult!12080)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99110 0))(
  ( (array!99111 (arr!47840 (Array (_ BitVec 32) (_ BitVec 64))) (size!48390 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99110)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99110 (_ BitVec 32)) SeekEntryResult!12080)

(assert (=> b!1471958 (= res!999685 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47840 a!2862) j!93) a!2862 mask!2687) lt!643433))))

(declare-fun b!1471959 () Bool)

(declare-fun res!999680 () Bool)

(declare-fun e!826151 () Bool)

(assert (=> b!1471959 (=> (not res!999680) (not e!826151))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471959 (= res!999680 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48390 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48390 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48390 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471960 () Bool)

(declare-fun res!999687 () Bool)

(assert (=> b!1471960 (=> (not res!999687) (not e!826151))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471960 (= res!999687 (validKeyInArray!0 (select (arr!47840 a!2862) i!1006)))))

(declare-fun b!1471962 () Bool)

(declare-fun res!999688 () Bool)

(assert (=> b!1471962 (=> (not res!999688) (not e!826151))))

(assert (=> b!1471962 (= res!999688 (validKeyInArray!0 (select (arr!47840 a!2862) j!93)))))

(declare-fun b!1471963 () Bool)

(declare-fun res!999678 () Bool)

(declare-fun e!826154 () Bool)

(assert (=> b!1471963 (=> (not res!999678) (not e!826154))))

(assert (=> b!1471963 (= res!999678 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471964 () Bool)

(assert (=> b!1471964 (= e!826156 e!826154)))

(declare-fun res!999679 () Bool)

(assert (=> b!1471964 (=> (not res!999679) (not e!826154))))

(declare-fun lt!643430 () SeekEntryResult!12080)

(assert (=> b!1471964 (= res!999679 (= lt!643430 (Intermediate!12080 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643432 () array!99110)

(declare-fun lt!643431 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471964 (= lt!643430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643431 mask!2687) lt!643431 lt!643432 mask!2687))))

(assert (=> b!1471964 (= lt!643431 (select (store (arr!47840 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!826157 () Bool)

(declare-fun b!1471965 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99110 (_ BitVec 32)) SeekEntryResult!12080)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99110 (_ BitVec 32)) SeekEntryResult!12080)

(assert (=> b!1471965 (= e!826157 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643431 lt!643432 mask!2687) (seekEntryOrOpen!0 lt!643431 lt!643432 mask!2687)))))

(declare-fun b!1471966 () Bool)

(declare-fun res!999690 () Bool)

(declare-fun e!826152 () Bool)

(assert (=> b!1471966 (=> (not res!999690) (not e!826152))))

(assert (=> b!1471966 (= res!999690 (= (seekEntryOrOpen!0 (select (arr!47840 a!2862) j!93) a!2862 mask!2687) (Found!12080 j!93)))))

(declare-fun b!1471967 () Bool)

(declare-fun e!826155 () Bool)

(assert (=> b!1471967 (= e!826151 e!826155)))

(declare-fun res!999683 () Bool)

(assert (=> b!1471967 (=> (not res!999683) (not e!826155))))

(assert (=> b!1471967 (= res!999683 (= (select (store (arr!47840 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471967 (= lt!643432 (array!99111 (store (arr!47840 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48390 a!2862)))))

(declare-fun b!1471968 () Bool)

(assert (=> b!1471968 (= e!826154 (not true))))

(assert (=> b!1471968 e!826152))

(declare-fun res!999681 () Bool)

(assert (=> b!1471968 (=> (not res!999681) (not e!826152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99110 (_ BitVec 32)) Bool)

(assert (=> b!1471968 (= res!999681 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49500 0))(
  ( (Unit!49501) )
))
(declare-fun lt!643434 () Unit!49500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49500)

(assert (=> b!1471968 (= lt!643434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471969 () Bool)

(assert (=> b!1471969 (= e!826152 (or (= (select (arr!47840 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47840 a!2862) intermediateBeforeIndex!19) (select (arr!47840 a!2862) j!93))))))

(declare-fun b!1471970 () Bool)

(declare-fun res!999684 () Bool)

(assert (=> b!1471970 (=> (not res!999684) (not e!826151))))

(assert (=> b!1471970 (= res!999684 (and (= (size!48390 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48390 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48390 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!999686 () Bool)

(assert (=> start!125776 (=> (not res!999686) (not e!826151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125776 (= res!999686 (validMask!0 mask!2687))))

(assert (=> start!125776 e!826151))

(assert (=> start!125776 true))

(declare-fun array_inv!36868 (array!99110) Bool)

(assert (=> start!125776 (array_inv!36868 a!2862)))

(declare-fun b!1471961 () Bool)

(assert (=> b!1471961 (= e!826155 e!826156)))

(declare-fun res!999689 () Bool)

(assert (=> b!1471961 (=> (not res!999689) (not e!826156))))

(assert (=> b!1471961 (= res!999689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47840 a!2862) j!93) mask!2687) (select (arr!47840 a!2862) j!93) a!2862 mask!2687) lt!643433))))

(assert (=> b!1471961 (= lt!643433 (Intermediate!12080 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471971 () Bool)

(assert (=> b!1471971 (= e!826157 (= lt!643430 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643431 lt!643432 mask!2687)))))

(declare-fun b!1471972 () Bool)

(declare-fun res!999682 () Bool)

(assert (=> b!1471972 (=> (not res!999682) (not e!826151))))

(assert (=> b!1471972 (= res!999682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471973 () Bool)

(declare-fun res!999691 () Bool)

(assert (=> b!1471973 (=> (not res!999691) (not e!826151))))

(declare-datatypes ((List!34341 0))(
  ( (Nil!34338) (Cons!34337 (h!35693 (_ BitVec 64)) (t!49035 List!34341)) )
))
(declare-fun arrayNoDuplicates!0 (array!99110 (_ BitVec 32) List!34341) Bool)

(assert (=> b!1471973 (= res!999691 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34338))))

(declare-fun b!1471974 () Bool)

(declare-fun res!999677 () Bool)

(assert (=> b!1471974 (=> (not res!999677) (not e!826154))))

(assert (=> b!1471974 (= res!999677 e!826157)))

(declare-fun c!135654 () Bool)

(assert (=> b!1471974 (= c!135654 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125776 res!999686) b!1471970))

(assert (= (and b!1471970 res!999684) b!1471960))

(assert (= (and b!1471960 res!999687) b!1471962))

(assert (= (and b!1471962 res!999688) b!1471972))

(assert (= (and b!1471972 res!999682) b!1471973))

(assert (= (and b!1471973 res!999691) b!1471959))

(assert (= (and b!1471959 res!999680) b!1471967))

(assert (= (and b!1471967 res!999683) b!1471961))

(assert (= (and b!1471961 res!999689) b!1471958))

(assert (= (and b!1471958 res!999685) b!1471964))

(assert (= (and b!1471964 res!999679) b!1471974))

(assert (= (and b!1471974 c!135654) b!1471971))

(assert (= (and b!1471974 (not c!135654)) b!1471965))

(assert (= (and b!1471974 res!999677) b!1471963))

(assert (= (and b!1471963 res!999678) b!1471968))

(assert (= (and b!1471968 res!999681) b!1471966))

(assert (= (and b!1471966 res!999690) b!1471969))

(declare-fun m!1358719 () Bool)

(assert (=> b!1471965 m!1358719))

(declare-fun m!1358721 () Bool)

(assert (=> b!1471965 m!1358721))

(declare-fun m!1358723 () Bool)

(assert (=> b!1471973 m!1358723))

(declare-fun m!1358725 () Bool)

(assert (=> b!1471962 m!1358725))

(assert (=> b!1471962 m!1358725))

(declare-fun m!1358727 () Bool)

(assert (=> b!1471962 m!1358727))

(declare-fun m!1358729 () Bool)

(assert (=> b!1471967 m!1358729))

(declare-fun m!1358731 () Bool)

(assert (=> b!1471967 m!1358731))

(declare-fun m!1358733 () Bool)

(assert (=> b!1471968 m!1358733))

(declare-fun m!1358735 () Bool)

(assert (=> b!1471968 m!1358735))

(declare-fun m!1358737 () Bool)

(assert (=> b!1471964 m!1358737))

(assert (=> b!1471964 m!1358737))

(declare-fun m!1358739 () Bool)

(assert (=> b!1471964 m!1358739))

(assert (=> b!1471964 m!1358729))

(declare-fun m!1358741 () Bool)

(assert (=> b!1471964 m!1358741))

(assert (=> b!1471966 m!1358725))

(assert (=> b!1471966 m!1358725))

(declare-fun m!1358743 () Bool)

(assert (=> b!1471966 m!1358743))

(assert (=> b!1471961 m!1358725))

(assert (=> b!1471961 m!1358725))

(declare-fun m!1358745 () Bool)

(assert (=> b!1471961 m!1358745))

(assert (=> b!1471961 m!1358745))

(assert (=> b!1471961 m!1358725))

(declare-fun m!1358747 () Bool)

(assert (=> b!1471961 m!1358747))

(declare-fun m!1358749 () Bool)

(assert (=> start!125776 m!1358749))

(declare-fun m!1358751 () Bool)

(assert (=> start!125776 m!1358751))

(declare-fun m!1358753 () Bool)

(assert (=> b!1471969 m!1358753))

(assert (=> b!1471969 m!1358725))

(declare-fun m!1358755 () Bool)

(assert (=> b!1471960 m!1358755))

(assert (=> b!1471960 m!1358755))

(declare-fun m!1358757 () Bool)

(assert (=> b!1471960 m!1358757))

(declare-fun m!1358759 () Bool)

(assert (=> b!1471971 m!1358759))

(assert (=> b!1471958 m!1358725))

(assert (=> b!1471958 m!1358725))

(declare-fun m!1358761 () Bool)

(assert (=> b!1471958 m!1358761))

(declare-fun m!1358763 () Bool)

(assert (=> b!1471972 m!1358763))

(push 1)

