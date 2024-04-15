; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126320 () Bool)

(assert start!126320)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99337 0))(
  ( (array!99338 (arr!47947 (Array (_ BitVec 32) (_ BitVec 64))) (size!48499 (_ BitVec 32))) )
))
(declare-fun lt!646423 () array!99337)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!646422 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1480892 () Bool)

(declare-fun e!830575 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12212 0))(
  ( (MissingZero!12212 (index!51240 (_ BitVec 32))) (Found!12212 (index!51241 (_ BitVec 32))) (Intermediate!12212 (undefined!13024 Bool) (index!51242 (_ BitVec 32)) (x!132824 (_ BitVec 32))) (Undefined!12212) (MissingVacant!12212 (index!51243 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99337 (_ BitVec 32)) SeekEntryResult!12212)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99337 (_ BitVec 32)) SeekEntryResult!12212)

(assert (=> b!1480892 (= e!830575 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646422 lt!646423 mask!2687) (seekEntryOrOpen!0 lt!646422 lt!646423 mask!2687)))))

(declare-fun b!1480893 () Bool)

(declare-fun res!1006477 () Bool)

(declare-fun e!830576 () Bool)

(assert (=> b!1480893 (=> (not res!1006477) (not e!830576))))

(assert (=> b!1480893 (= res!1006477 e!830575)))

(declare-fun c!136738 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480893 (= c!136738 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480894 () Bool)

(assert (=> b!1480894 (= e!830576 (not true))))

(declare-fun e!830577 () Bool)

(assert (=> b!1480894 e!830577))

(declare-fun res!1006467 () Bool)

(assert (=> b!1480894 (=> (not res!1006467) (not e!830577))))

(declare-fun a!2862 () array!99337)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99337 (_ BitVec 32)) Bool)

(assert (=> b!1480894 (= res!1006467 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49605 0))(
  ( (Unit!49606) )
))
(declare-fun lt!646420 () Unit!49605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49605)

(assert (=> b!1480894 (= lt!646420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480895 () Bool)

(declare-fun e!830573 () Bool)

(declare-fun e!830578 () Bool)

(assert (=> b!1480895 (= e!830573 e!830578)))

(declare-fun res!1006469 () Bool)

(assert (=> b!1480895 (=> (not res!1006469) (not e!830578))))

(declare-fun lt!646424 () SeekEntryResult!12212)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99337 (_ BitVec 32)) SeekEntryResult!12212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480895 (= res!1006469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47947 a!2862) j!93) mask!2687) (select (arr!47947 a!2862) j!93) a!2862 mask!2687) lt!646424))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480895 (= lt!646424 (Intermediate!12212 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480896 () Bool)

(declare-fun res!1006466 () Bool)

(declare-fun e!830574 () Bool)

(assert (=> b!1480896 (=> (not res!1006466) (not e!830574))))

(assert (=> b!1480896 (= res!1006466 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48499 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48499 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48499 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480897 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1480897 (= e!830577 (and (or (= (select (arr!47947 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47947 a!2862) intermediateBeforeIndex!19) (select (arr!47947 a!2862) j!93))) (or (and (= (select (arr!47947 a!2862) index!646) (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47947 a!2862) index!646) (select (arr!47947 a!2862) j!93))) (= (select (arr!47947 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun lt!646421 () SeekEntryResult!12212)

(declare-fun b!1480898 () Bool)

(assert (=> b!1480898 (= e!830575 (= lt!646421 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646422 lt!646423 mask!2687)))))

(declare-fun b!1480899 () Bool)

(declare-fun res!1006463 () Bool)

(assert (=> b!1480899 (=> (not res!1006463) (not e!830574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480899 (= res!1006463 (validKeyInArray!0 (select (arr!47947 a!2862) i!1006)))))

(declare-fun b!1480900 () Bool)

(assert (=> b!1480900 (= e!830578 e!830576)))

(declare-fun res!1006475 () Bool)

(assert (=> b!1480900 (=> (not res!1006475) (not e!830576))))

(assert (=> b!1480900 (= res!1006475 (= lt!646421 (Intermediate!12212 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480900 (= lt!646421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646422 mask!2687) lt!646422 lt!646423 mask!2687))))

(assert (=> b!1480900 (= lt!646422 (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480901 () Bool)

(assert (=> b!1480901 (= e!830574 e!830573)))

(declare-fun res!1006470 () Bool)

(assert (=> b!1480901 (=> (not res!1006470) (not e!830573))))

(assert (=> b!1480901 (= res!1006470 (= (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480901 (= lt!646423 (array!99338 (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48499 a!2862)))))

(declare-fun b!1480902 () Bool)

(declare-fun res!1006471 () Bool)

(assert (=> b!1480902 (=> (not res!1006471) (not e!830576))))

(assert (=> b!1480902 (= res!1006471 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480904 () Bool)

(declare-fun res!1006465 () Bool)

(assert (=> b!1480904 (=> (not res!1006465) (not e!830574))))

(assert (=> b!1480904 (= res!1006465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480905 () Bool)

(declare-fun res!1006473 () Bool)

(assert (=> b!1480905 (=> (not res!1006473) (not e!830574))))

(assert (=> b!1480905 (= res!1006473 (validKeyInArray!0 (select (arr!47947 a!2862) j!93)))))

(declare-fun b!1480906 () Bool)

(declare-fun res!1006476 () Bool)

(assert (=> b!1480906 (=> (not res!1006476) (not e!830577))))

(assert (=> b!1480906 (= res!1006476 (= (seekEntryOrOpen!0 (select (arr!47947 a!2862) j!93) a!2862 mask!2687) (Found!12212 j!93)))))

(declare-fun b!1480903 () Bool)

(declare-fun res!1006472 () Bool)

(assert (=> b!1480903 (=> (not res!1006472) (not e!830578))))

(assert (=> b!1480903 (= res!1006472 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47947 a!2862) j!93) a!2862 mask!2687) lt!646424))))

(declare-fun res!1006474 () Bool)

(assert (=> start!126320 (=> (not res!1006474) (not e!830574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126320 (= res!1006474 (validMask!0 mask!2687))))

(assert (=> start!126320 e!830574))

(assert (=> start!126320 true))

(declare-fun array_inv!37180 (array!99337) Bool)

(assert (=> start!126320 (array_inv!37180 a!2862)))

(declare-fun b!1480907 () Bool)

(declare-fun res!1006468 () Bool)

(assert (=> b!1480907 (=> (not res!1006468) (not e!830574))))

(assert (=> b!1480907 (= res!1006468 (and (= (size!48499 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48499 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48499 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480908 () Bool)

(declare-fun res!1006464 () Bool)

(assert (=> b!1480908 (=> (not res!1006464) (not e!830574))))

(declare-datatypes ((List!34526 0))(
  ( (Nil!34523) (Cons!34522 (h!35893 (_ BitVec 64)) (t!49212 List!34526)) )
))
(declare-fun arrayNoDuplicates!0 (array!99337 (_ BitVec 32) List!34526) Bool)

(assert (=> b!1480908 (= res!1006464 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34523))))

(assert (= (and start!126320 res!1006474) b!1480907))

(assert (= (and b!1480907 res!1006468) b!1480899))

(assert (= (and b!1480899 res!1006463) b!1480905))

(assert (= (and b!1480905 res!1006473) b!1480904))

(assert (= (and b!1480904 res!1006465) b!1480908))

(assert (= (and b!1480908 res!1006464) b!1480896))

(assert (= (and b!1480896 res!1006466) b!1480901))

(assert (= (and b!1480901 res!1006470) b!1480895))

(assert (= (and b!1480895 res!1006469) b!1480903))

(assert (= (and b!1480903 res!1006472) b!1480900))

(assert (= (and b!1480900 res!1006475) b!1480893))

(assert (= (and b!1480893 c!136738) b!1480898))

(assert (= (and b!1480893 (not c!136738)) b!1480892))

(assert (= (and b!1480893 res!1006477) b!1480902))

(assert (= (and b!1480902 res!1006471) b!1480894))

(assert (= (and b!1480894 res!1006467) b!1480906))

(assert (= (and b!1480906 res!1006476) b!1480897))

(declare-fun m!1366101 () Bool)

(assert (=> b!1480900 m!1366101))

(assert (=> b!1480900 m!1366101))

(declare-fun m!1366103 () Bool)

(assert (=> b!1480900 m!1366103))

(declare-fun m!1366105 () Bool)

(assert (=> b!1480900 m!1366105))

(declare-fun m!1366107 () Bool)

(assert (=> b!1480900 m!1366107))

(declare-fun m!1366109 () Bool)

(assert (=> b!1480905 m!1366109))

(assert (=> b!1480905 m!1366109))

(declare-fun m!1366111 () Bool)

(assert (=> b!1480905 m!1366111))

(assert (=> b!1480903 m!1366109))

(assert (=> b!1480903 m!1366109))

(declare-fun m!1366113 () Bool)

(assert (=> b!1480903 m!1366113))

(assert (=> b!1480897 m!1366105))

(declare-fun m!1366115 () Bool)

(assert (=> b!1480897 m!1366115))

(declare-fun m!1366117 () Bool)

(assert (=> b!1480897 m!1366117))

(declare-fun m!1366119 () Bool)

(assert (=> b!1480897 m!1366119))

(assert (=> b!1480897 m!1366109))

(declare-fun m!1366121 () Bool)

(assert (=> b!1480894 m!1366121))

(declare-fun m!1366123 () Bool)

(assert (=> b!1480894 m!1366123))

(declare-fun m!1366125 () Bool)

(assert (=> b!1480908 m!1366125))

(assert (=> b!1480895 m!1366109))

(assert (=> b!1480895 m!1366109))

(declare-fun m!1366127 () Bool)

(assert (=> b!1480895 m!1366127))

(assert (=> b!1480895 m!1366127))

(assert (=> b!1480895 m!1366109))

(declare-fun m!1366129 () Bool)

(assert (=> b!1480895 m!1366129))

(assert (=> b!1480906 m!1366109))

(assert (=> b!1480906 m!1366109))

(declare-fun m!1366131 () Bool)

(assert (=> b!1480906 m!1366131))

(assert (=> b!1480901 m!1366105))

(declare-fun m!1366133 () Bool)

(assert (=> b!1480901 m!1366133))

(declare-fun m!1366135 () Bool)

(assert (=> b!1480899 m!1366135))

(assert (=> b!1480899 m!1366135))

(declare-fun m!1366137 () Bool)

(assert (=> b!1480899 m!1366137))

(declare-fun m!1366139 () Bool)

(assert (=> b!1480892 m!1366139))

(declare-fun m!1366141 () Bool)

(assert (=> b!1480892 m!1366141))

(declare-fun m!1366143 () Bool)

(assert (=> start!126320 m!1366143))

(declare-fun m!1366145 () Bool)

(assert (=> start!126320 m!1366145))

(declare-fun m!1366147 () Bool)

(assert (=> b!1480904 m!1366147))

(declare-fun m!1366149 () Bool)

(assert (=> b!1480898 m!1366149))

(check-sat (not b!1480894) (not b!1480899) (not b!1480904) (not b!1480898) (not b!1480906) (not b!1480900) (not b!1480908) (not b!1480892) (not b!1480903) (not b!1480895) (not start!126320) (not b!1480905))
(check-sat)
