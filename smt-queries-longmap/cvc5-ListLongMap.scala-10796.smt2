; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126364 () Bool)

(assert start!126364)

(declare-fun b!1481108 () Bool)

(declare-fun res!1006480 () Bool)

(declare-fun e!830742 () Bool)

(assert (=> b!1481108 (=> (not res!1006480) (not e!830742))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99383 0))(
  ( (array!99384 (arr!47969 (Array (_ BitVec 32) (_ BitVec 64))) (size!48519 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99383)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481108 (= res!1006480 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48519 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48519 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48519 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481109 () Bool)

(declare-fun res!1006473 () Bool)

(declare-fun e!830740 () Bool)

(assert (=> b!1481109 (=> (not res!1006473) (not e!830740))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12209 0))(
  ( (MissingZero!12209 (index!51228 (_ BitVec 32))) (Found!12209 (index!51229 (_ BitVec 32))) (Intermediate!12209 (undefined!13021 Bool) (index!51230 (_ BitVec 32)) (x!132820 (_ BitVec 32))) (Undefined!12209) (MissingVacant!12209 (index!51231 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99383 (_ BitVec 32)) SeekEntryResult!12209)

(assert (=> b!1481109 (= res!1006473 (= (seekEntryOrOpen!0 (select (arr!47969 a!2862) j!93) a!2862 mask!2687) (Found!12209 j!93)))))

(declare-fun b!1481110 () Bool)

(declare-fun e!830739 () Bool)

(assert (=> b!1481110 (= e!830739 (not true))))

(assert (=> b!1481110 e!830740))

(declare-fun res!1006482 () Bool)

(assert (=> b!1481110 (=> (not res!1006482) (not e!830740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99383 (_ BitVec 32)) Bool)

(assert (=> b!1481110 (= res!1006482 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49758 0))(
  ( (Unit!49759) )
))
(declare-fun lt!646680 () Unit!49758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49758)

(assert (=> b!1481110 (= lt!646680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481111 () Bool)

(declare-fun res!1006479 () Bool)

(assert (=> b!1481111 (=> (not res!1006479) (not e!830739))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481111 (= res!1006479 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481112 () Bool)

(declare-fun e!830738 () Bool)

(declare-fun e!830741 () Bool)

(assert (=> b!1481112 (= e!830738 e!830741)))

(declare-fun res!1006483 () Bool)

(assert (=> b!1481112 (=> (not res!1006483) (not e!830741))))

(declare-fun lt!646679 () SeekEntryResult!12209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99383 (_ BitVec 32)) SeekEntryResult!12209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481112 (= res!1006483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47969 a!2862) j!93) mask!2687) (select (arr!47969 a!2862) j!93) a!2862 mask!2687) lt!646679))))

(assert (=> b!1481112 (= lt!646679 (Intermediate!12209 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1006484 () Bool)

(assert (=> start!126364 (=> (not res!1006484) (not e!830742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126364 (= res!1006484 (validMask!0 mask!2687))))

(assert (=> start!126364 e!830742))

(assert (=> start!126364 true))

(declare-fun array_inv!36997 (array!99383) Bool)

(assert (=> start!126364 (array_inv!36997 a!2862)))

(declare-fun lt!646682 () (_ BitVec 64))

(declare-fun lt!646683 () SeekEntryResult!12209)

(declare-fun b!1481113 () Bool)

(declare-fun e!830743 () Bool)

(declare-fun lt!646681 () array!99383)

(assert (=> b!1481113 (= e!830743 (= lt!646683 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646682 lt!646681 mask!2687)))))

(declare-fun b!1481114 () Bool)

(declare-fun res!1006472 () Bool)

(assert (=> b!1481114 (=> (not res!1006472) (not e!830739))))

(assert (=> b!1481114 (= res!1006472 e!830743)))

(declare-fun c!136839 () Bool)

(assert (=> b!1481114 (= c!136839 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481115 () Bool)

(declare-fun res!1006486 () Bool)

(assert (=> b!1481115 (=> (not res!1006486) (not e!830742))))

(assert (=> b!1481115 (= res!1006486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481116 () Bool)

(declare-fun res!1006481 () Bool)

(assert (=> b!1481116 (=> (not res!1006481) (not e!830742))))

(declare-datatypes ((List!34470 0))(
  ( (Nil!34467) (Cons!34466 (h!35837 (_ BitVec 64)) (t!49164 List!34470)) )
))
(declare-fun arrayNoDuplicates!0 (array!99383 (_ BitVec 32) List!34470) Bool)

(assert (=> b!1481116 (= res!1006481 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34467))))

(declare-fun b!1481117 () Bool)

(assert (=> b!1481117 (= e!830742 e!830738)))

(declare-fun res!1006476 () Bool)

(assert (=> b!1481117 (=> (not res!1006476) (not e!830738))))

(assert (=> b!1481117 (= res!1006476 (= (select (store (arr!47969 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481117 (= lt!646681 (array!99384 (store (arr!47969 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48519 a!2862)))))

(declare-fun b!1481118 () Bool)

(assert (=> b!1481118 (= e!830740 (and (or (= (select (arr!47969 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47969 a!2862) intermediateBeforeIndex!19) (select (arr!47969 a!2862) j!93))) (or (and (= (select (arr!47969 a!2862) index!646) (select (store (arr!47969 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47969 a!2862) index!646) (select (arr!47969 a!2862) j!93))) (= (select (arr!47969 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481119 () Bool)

(declare-fun res!1006477 () Bool)

(assert (=> b!1481119 (=> (not res!1006477) (not e!830742))))

(assert (=> b!1481119 (= res!1006477 (and (= (size!48519 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48519 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48519 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481120 () Bool)

(declare-fun res!1006475 () Bool)

(assert (=> b!1481120 (=> (not res!1006475) (not e!830741))))

(assert (=> b!1481120 (= res!1006475 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47969 a!2862) j!93) a!2862 mask!2687) lt!646679))))

(declare-fun b!1481121 () Bool)

(declare-fun res!1006474 () Bool)

(assert (=> b!1481121 (=> (not res!1006474) (not e!830742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481121 (= res!1006474 (validKeyInArray!0 (select (arr!47969 a!2862) j!93)))))

(declare-fun b!1481122 () Bool)

(assert (=> b!1481122 (= e!830741 e!830739)))

(declare-fun res!1006485 () Bool)

(assert (=> b!1481122 (=> (not res!1006485) (not e!830739))))

(assert (=> b!1481122 (= res!1006485 (= lt!646683 (Intermediate!12209 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481122 (= lt!646683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646682 mask!2687) lt!646682 lt!646681 mask!2687))))

(assert (=> b!1481122 (= lt!646682 (select (store (arr!47969 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481123 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99383 (_ BitVec 32)) SeekEntryResult!12209)

(assert (=> b!1481123 (= e!830743 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646682 lt!646681 mask!2687) (seekEntryOrOpen!0 lt!646682 lt!646681 mask!2687)))))

(declare-fun b!1481124 () Bool)

(declare-fun res!1006478 () Bool)

(assert (=> b!1481124 (=> (not res!1006478) (not e!830742))))

(assert (=> b!1481124 (= res!1006478 (validKeyInArray!0 (select (arr!47969 a!2862) i!1006)))))

(assert (= (and start!126364 res!1006484) b!1481119))

(assert (= (and b!1481119 res!1006477) b!1481124))

(assert (= (and b!1481124 res!1006478) b!1481121))

(assert (= (and b!1481121 res!1006474) b!1481115))

(assert (= (and b!1481115 res!1006486) b!1481116))

(assert (= (and b!1481116 res!1006481) b!1481108))

(assert (= (and b!1481108 res!1006480) b!1481117))

(assert (= (and b!1481117 res!1006476) b!1481112))

(assert (= (and b!1481112 res!1006483) b!1481120))

(assert (= (and b!1481120 res!1006475) b!1481122))

(assert (= (and b!1481122 res!1006485) b!1481114))

(assert (= (and b!1481114 c!136839) b!1481113))

(assert (= (and b!1481114 (not c!136839)) b!1481123))

(assert (= (and b!1481114 res!1006472) b!1481111))

(assert (= (and b!1481111 res!1006479) b!1481110))

(assert (= (and b!1481110 res!1006482) b!1481109))

(assert (= (and b!1481109 res!1006473) b!1481118))

(declare-fun m!1366855 () Bool)

(assert (=> b!1481117 m!1366855))

(declare-fun m!1366857 () Bool)

(assert (=> b!1481117 m!1366857))

(assert (=> b!1481118 m!1366855))

(declare-fun m!1366859 () Bool)

(assert (=> b!1481118 m!1366859))

(declare-fun m!1366861 () Bool)

(assert (=> b!1481118 m!1366861))

(declare-fun m!1366863 () Bool)

(assert (=> b!1481118 m!1366863))

(declare-fun m!1366865 () Bool)

(assert (=> b!1481118 m!1366865))

(declare-fun m!1366867 () Bool)

(assert (=> start!126364 m!1366867))

(declare-fun m!1366869 () Bool)

(assert (=> start!126364 m!1366869))

(declare-fun m!1366871 () Bool)

(assert (=> b!1481115 m!1366871))

(assert (=> b!1481120 m!1366865))

(assert (=> b!1481120 m!1366865))

(declare-fun m!1366873 () Bool)

(assert (=> b!1481120 m!1366873))

(assert (=> b!1481109 m!1366865))

(assert (=> b!1481109 m!1366865))

(declare-fun m!1366875 () Bool)

(assert (=> b!1481109 m!1366875))

(assert (=> b!1481112 m!1366865))

(assert (=> b!1481112 m!1366865))

(declare-fun m!1366877 () Bool)

(assert (=> b!1481112 m!1366877))

(assert (=> b!1481112 m!1366877))

(assert (=> b!1481112 m!1366865))

(declare-fun m!1366879 () Bool)

(assert (=> b!1481112 m!1366879))

(declare-fun m!1366881 () Bool)

(assert (=> b!1481123 m!1366881))

(declare-fun m!1366883 () Bool)

(assert (=> b!1481123 m!1366883))

(declare-fun m!1366885 () Bool)

(assert (=> b!1481124 m!1366885))

(assert (=> b!1481124 m!1366885))

(declare-fun m!1366887 () Bool)

(assert (=> b!1481124 m!1366887))

(declare-fun m!1366889 () Bool)

(assert (=> b!1481116 m!1366889))

(declare-fun m!1366891 () Bool)

(assert (=> b!1481110 m!1366891))

(declare-fun m!1366893 () Bool)

(assert (=> b!1481110 m!1366893))

(declare-fun m!1366895 () Bool)

(assert (=> b!1481113 m!1366895))

(assert (=> b!1481121 m!1366865))

(assert (=> b!1481121 m!1366865))

(declare-fun m!1366897 () Bool)

(assert (=> b!1481121 m!1366897))

(declare-fun m!1366899 () Bool)

(assert (=> b!1481122 m!1366899))

(assert (=> b!1481122 m!1366899))

(declare-fun m!1366901 () Bool)

(assert (=> b!1481122 m!1366901))

(assert (=> b!1481122 m!1366855))

(declare-fun m!1366903 () Bool)

(assert (=> b!1481122 m!1366903))

(push 1)

