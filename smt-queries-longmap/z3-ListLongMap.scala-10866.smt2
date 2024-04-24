; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127644 () Bool)

(assert start!127644)

(declare-fun lt!653027 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!839567 () Bool)

(declare-datatypes ((SeekEntryResult!12369 0))(
  ( (MissingZero!12369 (index!51868 (_ BitVec 32))) (Found!12369 (index!51869 (_ BitVec 32))) (Intermediate!12369 (undefined!13181 Bool) (index!51870 (_ BitVec 32)) (x!133677 (_ BitVec 32))) (Undefined!12369) (MissingVacant!12369 (index!51871 (_ BitVec 32))) )
))
(declare-fun lt!653025 () SeekEntryResult!12369)

(declare-fun lt!653031 () (_ BitVec 64))

(declare-datatypes ((array!99945 0))(
  ( (array!99946 (arr!48232 (Array (_ BitVec 32) (_ BitVec 64))) (size!48783 (_ BitVec 32))) )
))
(declare-fun lt!653026 () array!99945)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1498987 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99945 (_ BitVec 32)) SeekEntryResult!12369)

(assert (=> b!1498987 (= e!839567 (not (= lt!653025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!653027 lt!653031 lt!653026 mask!2687))))))

(declare-fun b!1498989 () Bool)

(declare-fun res!1019089 () Bool)

(declare-fun e!839571 () Bool)

(assert (=> b!1498989 (=> (not res!1019089) (not e!839571))))

(declare-fun lt!653024 () SeekEntryResult!12369)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun a!2862 () array!99945)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1498989 (= res!1019089 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48232 a!2862) j!93) a!2862 mask!2687) lt!653024))))

(declare-fun b!1498990 () Bool)

(declare-fun res!1019090 () Bool)

(declare-fun e!839565 () Bool)

(assert (=> b!1498990 (=> (not res!1019090) (not e!839565))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1498990 (= res!1019090 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1498991 () Bool)

(declare-fun e!839570 () Bool)

(assert (=> b!1498991 (= e!839570 e!839571)))

(declare-fun res!1019076 () Bool)

(assert (=> b!1498991 (=> (not res!1019076) (not e!839571))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498991 (= res!1019076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48232 a!2862) j!93) mask!2687) (select (arr!48232 a!2862) j!93) a!2862 mask!2687) lt!653024))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1498991 (= lt!653024 (Intermediate!12369 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1498992 () Bool)

(declare-fun e!839568 () Bool)

(assert (=> b!1498992 (= e!839568 true)))

(declare-fun lt!653028 () SeekEntryResult!12369)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99945 (_ BitVec 32)) SeekEntryResult!12369)

(assert (=> b!1498992 (= lt!653028 (seekEntryOrOpen!0 lt!653031 lt!653026 mask!2687))))

(declare-datatypes ((Unit!50111 0))(
  ( (Unit!50112) )
))
(declare-fun lt!653030 () Unit!50111)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50111)

(assert (=> b!1498992 (= lt!653030 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!653027 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1498993 () Bool)

(assert (=> b!1498993 (= e!839571 e!839565)))

(declare-fun res!1019079 () Bool)

(assert (=> b!1498993 (=> (not res!1019079) (not e!839565))))

(assert (=> b!1498993 (= res!1019079 (= lt!653025 (Intermediate!12369 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1498993 (= lt!653025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!653031 mask!2687) lt!653031 lt!653026 mask!2687))))

(assert (=> b!1498993 (= lt!653031 (select (store (arr!48232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1498994 () Bool)

(declare-fun res!1019087 () Bool)

(assert (=> b!1498994 (=> res!1019087 e!839568)))

(assert (=> b!1498994 (= res!1019087 e!839567)))

(declare-fun c!139501 () Bool)

(assert (=> b!1498994 (= c!139501 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1498995 () Bool)

(declare-fun res!1019078 () Bool)

(declare-fun e!839564 () Bool)

(assert (=> b!1498995 (=> (not res!1019078) (not e!839564))))

(assert (=> b!1498995 (= res!1019078 (and (= (size!48783 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48783 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48783 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!839566 () Bool)

(declare-fun b!1498996 () Bool)

(assert (=> b!1498996 (= e!839566 (= lt!653025 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!653031 lt!653026 mask!2687)))))

(declare-fun b!1498997 () Bool)

(declare-fun res!1019080 () Bool)

(assert (=> b!1498997 (=> res!1019080 e!839568)))

(assert (=> b!1498997 (= res!1019080 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!653027 (select (arr!48232 a!2862) j!93) a!2862 mask!2687) lt!653024)))))

(declare-fun b!1498998 () Bool)

(declare-fun e!839569 () Bool)

(assert (=> b!1498998 (= e!839565 (not e!839569))))

(declare-fun res!1019077 () Bool)

(assert (=> b!1498998 (=> res!1019077 e!839569)))

(assert (=> b!1498998 (= res!1019077 (or (and (= (select (arr!48232 a!2862) index!646) (select (store (arr!48232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48232 a!2862) index!646) (select (arr!48232 a!2862) j!93))) (= (select (arr!48232 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1498998 (and (= lt!653028 (Found!12369 j!93)) (or (= (select (arr!48232 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48232 a!2862) intermediateBeforeIndex!19) (select (arr!48232 a!2862) j!93))))))

(assert (=> b!1498998 (= lt!653028 (seekEntryOrOpen!0 (select (arr!48232 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99945 (_ BitVec 32)) Bool)

(assert (=> b!1498998 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!653029 () Unit!50111)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50111)

(assert (=> b!1498998 (= lt!653029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1498999 () Bool)

(declare-fun res!1019092 () Bool)

(assert (=> b!1498999 (=> (not res!1019092) (not e!839565))))

(assert (=> b!1498999 (= res!1019092 e!839566)))

(declare-fun c!139500 () Bool)

(assert (=> b!1498999 (= c!139500 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1499000 () Bool)

(assert (=> b!1499000 (= e!839569 e!839568)))

(declare-fun res!1019088 () Bool)

(assert (=> b!1499000 (=> res!1019088 e!839568)))

(assert (=> b!1499000 (= res!1019088 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!653027 #b00000000000000000000000000000000) (bvsge lt!653027 (size!48783 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499000 (= lt!653027 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1499001 () Bool)

(declare-fun res!1019082 () Bool)

(assert (=> b!1499001 (=> (not res!1019082) (not e!839564))))

(assert (=> b!1499001 (= res!1019082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1498988 () Bool)

(declare-fun res!1019084 () Bool)

(assert (=> b!1498988 (=> (not res!1019084) (not e!839564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498988 (= res!1019084 (validKeyInArray!0 (select (arr!48232 a!2862) i!1006)))))

(declare-fun res!1019086 () Bool)

(assert (=> start!127644 (=> (not res!1019086) (not e!839564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127644 (= res!1019086 (validMask!0 mask!2687))))

(assert (=> start!127644 e!839564))

(assert (=> start!127644 true))

(declare-fun array_inv!37513 (array!99945) Bool)

(assert (=> start!127644 (array_inv!37513 a!2862)))

(declare-fun b!1499002 () Bool)

(declare-fun res!1019083 () Bool)

(assert (=> b!1499002 (=> (not res!1019083) (not e!839564))))

(assert (=> b!1499002 (= res!1019083 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48783 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48783 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48783 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1499003 () Bool)

(assert (=> b!1499003 (= e!839564 e!839570)))

(declare-fun res!1019081 () Bool)

(assert (=> b!1499003 (=> (not res!1019081) (not e!839570))))

(assert (=> b!1499003 (= res!1019081 (= (select (store (arr!48232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1499003 (= lt!653026 (array!99946 (store (arr!48232 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48783 a!2862)))))

(declare-fun b!1499004 () Bool)

(declare-fun res!1019093 () Bool)

(assert (=> b!1499004 (=> (not res!1019093) (not e!839564))))

(assert (=> b!1499004 (= res!1019093 (validKeyInArray!0 (select (arr!48232 a!2862) j!93)))))

(declare-fun b!1499005 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99945 (_ BitVec 32)) SeekEntryResult!12369)

(assert (=> b!1499005 (= e!839566 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!653031 lt!653026 mask!2687) (seekEntryOrOpen!0 lt!653031 lt!653026 mask!2687)))))

(declare-fun b!1499006 () Bool)

(declare-fun res!1019091 () Bool)

(assert (=> b!1499006 (=> res!1019091 e!839568)))

(assert (=> b!1499006 (= res!1019091 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1499007 () Bool)

(declare-fun res!1019085 () Bool)

(assert (=> b!1499007 (=> (not res!1019085) (not e!839564))))

(declare-datatypes ((List!34720 0))(
  ( (Nil!34717) (Cons!34716 (h!36128 (_ BitVec 64)) (t!49406 List!34720)) )
))
(declare-fun arrayNoDuplicates!0 (array!99945 (_ BitVec 32) List!34720) Bool)

(assert (=> b!1499007 (= res!1019085 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34717))))

(declare-fun b!1499008 () Bool)

(assert (=> b!1499008 (= e!839567 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!653027 intermediateAfterIndex!19 lt!653031 lt!653026 mask!2687) (seekEntryOrOpen!0 lt!653031 lt!653026 mask!2687))))))

(assert (= (and start!127644 res!1019086) b!1498995))

(assert (= (and b!1498995 res!1019078) b!1498988))

(assert (= (and b!1498988 res!1019084) b!1499004))

(assert (= (and b!1499004 res!1019093) b!1499001))

(assert (= (and b!1499001 res!1019082) b!1499007))

(assert (= (and b!1499007 res!1019085) b!1499002))

(assert (= (and b!1499002 res!1019083) b!1499003))

(assert (= (and b!1499003 res!1019081) b!1498991))

(assert (= (and b!1498991 res!1019076) b!1498989))

(assert (= (and b!1498989 res!1019089) b!1498993))

(assert (= (and b!1498993 res!1019079) b!1498999))

(assert (= (and b!1498999 c!139500) b!1498996))

(assert (= (and b!1498999 (not c!139500)) b!1499005))

(assert (= (and b!1498999 res!1019092) b!1498990))

(assert (= (and b!1498990 res!1019090) b!1498998))

(assert (= (and b!1498998 (not res!1019077)) b!1499000))

(assert (= (and b!1499000 (not res!1019088)) b!1498997))

(assert (= (and b!1498997 (not res!1019080)) b!1498994))

(assert (= (and b!1498994 c!139501) b!1498987))

(assert (= (and b!1498994 (not c!139501)) b!1499008))

(assert (= (and b!1498994 (not res!1019087)) b!1499006))

(assert (= (and b!1499006 (not res!1019091)) b!1498992))

(declare-fun m!1382097 () Bool)

(assert (=> b!1498993 m!1382097))

(assert (=> b!1498993 m!1382097))

(declare-fun m!1382099 () Bool)

(assert (=> b!1498993 m!1382099))

(declare-fun m!1382101 () Bool)

(assert (=> b!1498993 m!1382101))

(declare-fun m!1382103 () Bool)

(assert (=> b!1498993 m!1382103))

(declare-fun m!1382105 () Bool)

(assert (=> b!1499005 m!1382105))

(declare-fun m!1382107 () Bool)

(assert (=> b!1499005 m!1382107))

(declare-fun m!1382109 () Bool)

(assert (=> b!1498998 m!1382109))

(assert (=> b!1498998 m!1382101))

(declare-fun m!1382111 () Bool)

(assert (=> b!1498998 m!1382111))

(declare-fun m!1382113 () Bool)

(assert (=> b!1498998 m!1382113))

(declare-fun m!1382115 () Bool)

(assert (=> b!1498998 m!1382115))

(declare-fun m!1382117 () Bool)

(assert (=> b!1498998 m!1382117))

(declare-fun m!1382119 () Bool)

(assert (=> b!1498998 m!1382119))

(declare-fun m!1382121 () Bool)

(assert (=> b!1498998 m!1382121))

(assert (=> b!1498998 m!1382117))

(assert (=> b!1498997 m!1382117))

(assert (=> b!1498997 m!1382117))

(declare-fun m!1382123 () Bool)

(assert (=> b!1498997 m!1382123))

(declare-fun m!1382125 () Bool)

(assert (=> b!1499008 m!1382125))

(assert (=> b!1499008 m!1382107))

(declare-fun m!1382127 () Bool)

(assert (=> b!1499000 m!1382127))

(assert (=> b!1499004 m!1382117))

(assert (=> b!1499004 m!1382117))

(declare-fun m!1382129 () Bool)

(assert (=> b!1499004 m!1382129))

(declare-fun m!1382131 () Bool)

(assert (=> b!1498996 m!1382131))

(declare-fun m!1382133 () Bool)

(assert (=> b!1498988 m!1382133))

(assert (=> b!1498988 m!1382133))

(declare-fun m!1382135 () Bool)

(assert (=> b!1498988 m!1382135))

(assert (=> b!1499003 m!1382101))

(declare-fun m!1382137 () Bool)

(assert (=> b!1499003 m!1382137))

(declare-fun m!1382139 () Bool)

(assert (=> start!127644 m!1382139))

(declare-fun m!1382141 () Bool)

(assert (=> start!127644 m!1382141))

(declare-fun m!1382143 () Bool)

(assert (=> b!1499001 m!1382143))

(assert (=> b!1498991 m!1382117))

(assert (=> b!1498991 m!1382117))

(declare-fun m!1382145 () Bool)

(assert (=> b!1498991 m!1382145))

(assert (=> b!1498991 m!1382145))

(assert (=> b!1498991 m!1382117))

(declare-fun m!1382147 () Bool)

(assert (=> b!1498991 m!1382147))

(declare-fun m!1382149 () Bool)

(assert (=> b!1499007 m!1382149))

(assert (=> b!1498992 m!1382107))

(declare-fun m!1382151 () Bool)

(assert (=> b!1498992 m!1382151))

(assert (=> b!1498989 m!1382117))

(assert (=> b!1498989 m!1382117))

(declare-fun m!1382153 () Bool)

(assert (=> b!1498989 m!1382153))

(declare-fun m!1382155 () Bool)

(assert (=> b!1498987 m!1382155))

(check-sat (not start!127644) (not b!1499004) (not b!1499001) (not b!1499000) (not b!1498993) (not b!1498998) (not b!1498992) (not b!1499007) (not b!1498987) (not b!1499008) (not b!1498996) (not b!1498988) (not b!1499005) (not b!1498997) (not b!1498989) (not b!1498991))
(check-sat)
