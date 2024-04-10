; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125320 () Bool)

(assert start!125320)

(declare-fun b!1464033 () Bool)

(declare-fun res!993187 () Bool)

(declare-fun e!822794 () Bool)

(assert (=> b!1464033 (=> (not res!993187) (not e!822794))))

(declare-datatypes ((array!98768 0))(
  ( (array!98769 (arr!47672 (Array (_ BitVec 32) (_ BitVec 64))) (size!48222 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98768)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464033 (= res!993187 (validKeyInArray!0 (select (arr!47672 a!2862) i!1006)))))

(declare-fun b!1464034 () Bool)

(declare-fun e!822793 () Bool)

(assert (=> b!1464034 (= e!822793 true)))

(declare-fun lt!640958 () Bool)

(declare-fun e!822797 () Bool)

(assert (=> b!1464034 (= lt!640958 e!822797)))

(declare-fun c!134940 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464034 (= c!134940 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464035 () Bool)

(declare-fun e!822798 () Bool)

(declare-fun lt!640959 () array!98768)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640960 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11924 0))(
  ( (MissingZero!11924 (index!50088 (_ BitVec 32))) (Found!11924 (index!50089 (_ BitVec 32))) (Intermediate!11924 (undefined!12736 Bool) (index!50090 (_ BitVec 32)) (x!131677 (_ BitVec 32))) (Undefined!11924) (MissingVacant!11924 (index!50091 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98768 (_ BitVec 32)) SeekEntryResult!11924)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98768 (_ BitVec 32)) SeekEntryResult!11924)

(assert (=> b!1464035 (= e!822798 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640960 lt!640959 mask!2687) (seekEntryOrOpen!0 lt!640960 lt!640959 mask!2687)))))

(declare-fun b!1464036 () Bool)

(declare-fun e!822796 () Bool)

(declare-fun e!822792 () Bool)

(assert (=> b!1464036 (= e!822796 e!822792)))

(declare-fun res!993190 () Bool)

(assert (=> b!1464036 (=> (not res!993190) (not e!822792))))

(declare-fun lt!640961 () SeekEntryResult!11924)

(assert (=> b!1464036 (= res!993190 (= lt!640961 (Intermediate!11924 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98768 (_ BitVec 32)) SeekEntryResult!11924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464036 (= lt!640961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640960 mask!2687) lt!640960 lt!640959 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464036 (= lt!640960 (select (store (arr!47672 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!640957 () (_ BitVec 32))

(declare-fun b!1464037 () Bool)

(assert (=> b!1464037 (= e!822797 (not (= lt!640961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640957 lt!640960 lt!640959 mask!2687))))))

(declare-fun b!1464038 () Bool)

(declare-fun res!993183 () Bool)

(assert (=> b!1464038 (=> (not res!993183) (not e!822794))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464038 (= res!993183 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48222 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48222 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48222 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464039 () Bool)

(declare-fun e!822791 () Bool)

(assert (=> b!1464039 (= e!822794 e!822791)))

(declare-fun res!993193 () Bool)

(assert (=> b!1464039 (=> (not res!993193) (not e!822791))))

(assert (=> b!1464039 (= res!993193 (= (select (store (arr!47672 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464039 (= lt!640959 (array!98769 (store (arr!47672 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48222 a!2862)))))

(declare-fun b!1464040 () Bool)

(declare-fun res!993189 () Bool)

(declare-fun e!822795 () Bool)

(assert (=> b!1464040 (=> (not res!993189) (not e!822795))))

(assert (=> b!1464040 (= res!993189 (= (seekEntryOrOpen!0 (select (arr!47672 a!2862) j!93) a!2862 mask!2687) (Found!11924 j!93)))))

(declare-fun b!1464041 () Bool)

(assert (=> b!1464041 (= e!822791 e!822796)))

(declare-fun res!993186 () Bool)

(assert (=> b!1464041 (=> (not res!993186) (not e!822796))))

(declare-fun lt!640956 () SeekEntryResult!11924)

(assert (=> b!1464041 (= res!993186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47672 a!2862) j!93) mask!2687) (select (arr!47672 a!2862) j!93) a!2862 mask!2687) lt!640956))))

(assert (=> b!1464041 (= lt!640956 (Intermediate!11924 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464042 () Bool)

(declare-fun res!993192 () Bool)

(assert (=> b!1464042 (=> (not res!993192) (not e!822794))))

(declare-datatypes ((List!34173 0))(
  ( (Nil!34170) (Cons!34169 (h!35519 (_ BitVec 64)) (t!48867 List!34173)) )
))
(declare-fun arrayNoDuplicates!0 (array!98768 (_ BitVec 32) List!34173) Bool)

(assert (=> b!1464042 (= res!993192 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34170))))

(declare-fun res!993178 () Bool)

(assert (=> start!125320 (=> (not res!993178) (not e!822794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125320 (= res!993178 (validMask!0 mask!2687))))

(assert (=> start!125320 e!822794))

(assert (=> start!125320 true))

(declare-fun array_inv!36700 (array!98768) Bool)

(assert (=> start!125320 (array_inv!36700 a!2862)))

(declare-fun b!1464043 () Bool)

(declare-fun res!993180 () Bool)

(assert (=> b!1464043 (=> res!993180 e!822793)))

(assert (=> b!1464043 (= res!993180 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640957 (select (arr!47672 a!2862) j!93) a!2862 mask!2687) lt!640956)))))

(declare-fun b!1464044 () Bool)

(assert (=> b!1464044 (= e!822795 (or (= (select (arr!47672 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47672 a!2862) intermediateBeforeIndex!19) (select (arr!47672 a!2862) j!93))))))

(declare-fun b!1464045 () Bool)

(declare-fun res!993182 () Bool)

(assert (=> b!1464045 (=> (not res!993182) (not e!822792))))

(assert (=> b!1464045 (= res!993182 e!822798)))

(declare-fun c!134939 () Bool)

(assert (=> b!1464045 (= c!134939 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464046 () Bool)

(declare-fun e!822800 () Bool)

(assert (=> b!1464046 (= e!822792 (not e!822800))))

(declare-fun res!993177 () Bool)

(assert (=> b!1464046 (=> res!993177 e!822800)))

(assert (=> b!1464046 (= res!993177 (or (and (= (select (arr!47672 a!2862) index!646) (select (store (arr!47672 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47672 a!2862) index!646) (select (arr!47672 a!2862) j!93))) (= (select (arr!47672 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464046 e!822795))

(declare-fun res!993184 () Bool)

(assert (=> b!1464046 (=> (not res!993184) (not e!822795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98768 (_ BitVec 32)) Bool)

(assert (=> b!1464046 (= res!993184 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49344 0))(
  ( (Unit!49345) )
))
(declare-fun lt!640962 () Unit!49344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49344)

(assert (=> b!1464046 (= lt!640962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464047 () Bool)

(declare-fun res!993191 () Bool)

(assert (=> b!1464047 (=> (not res!993191) (not e!822794))))

(assert (=> b!1464047 (= res!993191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464048 () Bool)

(declare-fun res!993181 () Bool)

(assert (=> b!1464048 (=> (not res!993181) (not e!822794))))

(assert (=> b!1464048 (= res!993181 (and (= (size!48222 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48222 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48222 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464049 () Bool)

(assert (=> b!1464049 (= e!822800 e!822793)))

(declare-fun res!993185 () Bool)

(assert (=> b!1464049 (=> res!993185 e!822793)))

(assert (=> b!1464049 (= res!993185 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640957 #b00000000000000000000000000000000) (bvsge lt!640957 (size!48222 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464049 (= lt!640957 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464050 () Bool)

(assert (=> b!1464050 (= e!822798 (= lt!640961 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640960 lt!640959 mask!2687)))))

(declare-fun b!1464051 () Bool)

(declare-fun res!993179 () Bool)

(assert (=> b!1464051 (=> (not res!993179) (not e!822792))))

(assert (=> b!1464051 (= res!993179 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464052 () Bool)

(assert (=> b!1464052 (= e!822797 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640957 intermediateAfterIndex!19 lt!640960 lt!640959 mask!2687) (seekEntryOrOpen!0 lt!640960 lt!640959 mask!2687))))))

(declare-fun b!1464053 () Bool)

(declare-fun res!993188 () Bool)

(assert (=> b!1464053 (=> (not res!993188) (not e!822796))))

(assert (=> b!1464053 (= res!993188 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47672 a!2862) j!93) a!2862 mask!2687) lt!640956))))

(declare-fun b!1464054 () Bool)

(declare-fun res!993176 () Bool)

(assert (=> b!1464054 (=> (not res!993176) (not e!822794))))

(assert (=> b!1464054 (= res!993176 (validKeyInArray!0 (select (arr!47672 a!2862) j!93)))))

(assert (= (and start!125320 res!993178) b!1464048))

(assert (= (and b!1464048 res!993181) b!1464033))

(assert (= (and b!1464033 res!993187) b!1464054))

(assert (= (and b!1464054 res!993176) b!1464047))

(assert (= (and b!1464047 res!993191) b!1464042))

(assert (= (and b!1464042 res!993192) b!1464038))

(assert (= (and b!1464038 res!993183) b!1464039))

(assert (= (and b!1464039 res!993193) b!1464041))

(assert (= (and b!1464041 res!993186) b!1464053))

(assert (= (and b!1464053 res!993188) b!1464036))

(assert (= (and b!1464036 res!993190) b!1464045))

(assert (= (and b!1464045 c!134939) b!1464050))

(assert (= (and b!1464045 (not c!134939)) b!1464035))

(assert (= (and b!1464045 res!993182) b!1464051))

(assert (= (and b!1464051 res!993179) b!1464046))

(assert (= (and b!1464046 res!993184) b!1464040))

(assert (= (and b!1464040 res!993189) b!1464044))

(assert (= (and b!1464046 (not res!993177)) b!1464049))

(assert (= (and b!1464049 (not res!993185)) b!1464043))

(assert (= (and b!1464043 (not res!993180)) b!1464034))

(assert (= (and b!1464034 c!134940) b!1464037))

(assert (= (and b!1464034 (not c!134940)) b!1464052))

(declare-fun m!1351297 () Bool)

(assert (=> b!1464041 m!1351297))

(assert (=> b!1464041 m!1351297))

(declare-fun m!1351299 () Bool)

(assert (=> b!1464041 m!1351299))

(assert (=> b!1464041 m!1351299))

(assert (=> b!1464041 m!1351297))

(declare-fun m!1351301 () Bool)

(assert (=> b!1464041 m!1351301))

(declare-fun m!1351303 () Bool)

(assert (=> b!1464036 m!1351303))

(assert (=> b!1464036 m!1351303))

(declare-fun m!1351305 () Bool)

(assert (=> b!1464036 m!1351305))

(declare-fun m!1351307 () Bool)

(assert (=> b!1464036 m!1351307))

(declare-fun m!1351309 () Bool)

(assert (=> b!1464036 m!1351309))

(assert (=> b!1464054 m!1351297))

(assert (=> b!1464054 m!1351297))

(declare-fun m!1351311 () Bool)

(assert (=> b!1464054 m!1351311))

(declare-fun m!1351313 () Bool)

(assert (=> b!1464050 m!1351313))

(assert (=> b!1464040 m!1351297))

(assert (=> b!1464040 m!1351297))

(declare-fun m!1351315 () Bool)

(assert (=> b!1464040 m!1351315))

(declare-fun m!1351317 () Bool)

(assert (=> b!1464033 m!1351317))

(assert (=> b!1464033 m!1351317))

(declare-fun m!1351319 () Bool)

(assert (=> b!1464033 m!1351319))

(assert (=> b!1464053 m!1351297))

(assert (=> b!1464053 m!1351297))

(declare-fun m!1351321 () Bool)

(assert (=> b!1464053 m!1351321))

(declare-fun m!1351323 () Bool)

(assert (=> b!1464047 m!1351323))

(declare-fun m!1351325 () Bool)

(assert (=> b!1464044 m!1351325))

(assert (=> b!1464044 m!1351297))

(declare-fun m!1351327 () Bool)

(assert (=> start!125320 m!1351327))

(declare-fun m!1351329 () Bool)

(assert (=> start!125320 m!1351329))

(declare-fun m!1351331 () Bool)

(assert (=> b!1464037 m!1351331))

(declare-fun m!1351333 () Bool)

(assert (=> b!1464035 m!1351333))

(declare-fun m!1351335 () Bool)

(assert (=> b!1464035 m!1351335))

(declare-fun m!1351337 () Bool)

(assert (=> b!1464049 m!1351337))

(assert (=> b!1464039 m!1351307))

(declare-fun m!1351339 () Bool)

(assert (=> b!1464039 m!1351339))

(declare-fun m!1351341 () Bool)

(assert (=> b!1464052 m!1351341))

(assert (=> b!1464052 m!1351335))

(declare-fun m!1351343 () Bool)

(assert (=> b!1464042 m!1351343))

(declare-fun m!1351345 () Bool)

(assert (=> b!1464046 m!1351345))

(assert (=> b!1464046 m!1351307))

(declare-fun m!1351347 () Bool)

(assert (=> b!1464046 m!1351347))

(declare-fun m!1351349 () Bool)

(assert (=> b!1464046 m!1351349))

(declare-fun m!1351351 () Bool)

(assert (=> b!1464046 m!1351351))

(assert (=> b!1464046 m!1351297))

(assert (=> b!1464043 m!1351297))

(assert (=> b!1464043 m!1351297))

(declare-fun m!1351353 () Bool)

(assert (=> b!1464043 m!1351353))

(push 1)

