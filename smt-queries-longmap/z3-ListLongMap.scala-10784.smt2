; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126480 () Bool)

(assert start!126480)

(declare-fun b!1480142 () Bool)

(declare-fun e!830412 () Bool)

(declare-fun e!830411 () Bool)

(assert (=> b!1480142 (= e!830412 e!830411)))

(declare-fun res!1005071 () Bool)

(assert (=> b!1480142 (=> (not res!1005071) (not e!830411))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12123 0))(
  ( (MissingZero!12123 (index!50884 (_ BitVec 32))) (Found!12123 (index!50885 (_ BitVec 32))) (Intermediate!12123 (undefined!12935 Bool) (index!50886 (_ BitVec 32)) (x!132659 (_ BitVec 32))) (Undefined!12123) (MissingVacant!12123 (index!50887 (_ BitVec 32))) )
))
(declare-fun lt!646317 () SeekEntryResult!12123)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480142 (= res!1005071 (= lt!646317 (Intermediate!12123 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99424 0))(
  ( (array!99425 (arr!47986 (Array (_ BitVec 32) (_ BitVec 64))) (size!48537 (_ BitVec 32))) )
))
(declare-fun lt!646321 () array!99424)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!646316 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99424 (_ BitVec 32)) SeekEntryResult!12123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480142 (= lt!646317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646316 mask!2687) lt!646316 lt!646321 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99424)

(assert (=> b!1480142 (= lt!646316 (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480144 () Bool)

(declare-fun res!1005065 () Bool)

(assert (=> b!1480144 (=> (not res!1005065) (not e!830411))))

(declare-fun e!830408 () Bool)

(assert (=> b!1480144 (= res!1005065 e!830408)))

(declare-fun c!137071 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1480144 (= c!137071 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1480145 () Bool)

(declare-fun e!830407 () Bool)

(assert (=> b!1480145 (= e!830407 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480146 () Bool)

(declare-fun e!830404 () Bool)

(declare-fun e!830410 () Bool)

(assert (=> b!1480146 (= e!830404 e!830410)))

(declare-fun res!1005061 () Bool)

(assert (=> b!1480146 (=> (not res!1005061) (not e!830410))))

(assert (=> b!1480146 (= res!1005061 (= (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480146 (= lt!646321 (array!99425 (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48537 a!2862)))))

(declare-fun b!1480147 () Bool)

(assert (=> b!1480147 (= e!830408 (= lt!646317 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646316 lt!646321 mask!2687)))))

(declare-fun b!1480148 () Bool)

(declare-fun e!830406 () Bool)

(declare-fun e!830405 () Bool)

(assert (=> b!1480148 (= e!830406 e!830405)))

(declare-fun res!1005072 () Bool)

(assert (=> b!1480148 (=> res!1005072 e!830405)))

(assert (=> b!1480148 (= res!1005072 (or (and (= (select (arr!47986 a!2862) index!646) (select (store (arr!47986 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47986 a!2862) index!646) (select (arr!47986 a!2862) j!93))) (not (= (select (arr!47986 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480149 () Bool)

(assert (=> b!1480149 (= e!830405 e!830407)))

(declare-fun res!1005069 () Bool)

(assert (=> b!1480149 (=> (not res!1005069) (not e!830407))))

(declare-fun lt!646318 () SeekEntryResult!12123)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99424 (_ BitVec 32)) SeekEntryResult!12123)

(assert (=> b!1480149 (= res!1005069 (= lt!646318 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47986 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480150 () Bool)

(declare-fun res!1005068 () Bool)

(assert (=> b!1480150 (=> (not res!1005068) (not e!830404))))

(assert (=> b!1480150 (= res!1005068 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48537 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48537 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48537 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480151 () Bool)

(declare-fun res!1005062 () Bool)

(assert (=> b!1480151 (=> (not res!1005062) (not e!830404))))

(assert (=> b!1480151 (= res!1005062 (and (= (size!48537 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48537 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48537 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480152 () Bool)

(declare-fun res!1005060 () Bool)

(assert (=> b!1480152 (=> (not res!1005060) (not e!830404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480152 (= res!1005060 (validKeyInArray!0 (select (arr!47986 a!2862) i!1006)))))

(declare-fun b!1480153 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99424 (_ BitVec 32)) SeekEntryResult!12123)

(assert (=> b!1480153 (= e!830408 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646316 lt!646321 mask!2687) (seekEntryOrOpen!0 lt!646316 lt!646321 mask!2687)))))

(declare-fun res!1005064 () Bool)

(assert (=> start!126480 (=> (not res!1005064) (not e!830404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126480 (= res!1005064 (validMask!0 mask!2687))))

(assert (=> start!126480 e!830404))

(assert (=> start!126480 true))

(declare-fun array_inv!37267 (array!99424) Bool)

(assert (=> start!126480 (array_inv!37267 a!2862)))

(declare-fun b!1480143 () Bool)

(assert (=> b!1480143 (= e!830410 e!830412)))

(declare-fun res!1005059 () Bool)

(assert (=> b!1480143 (=> (not res!1005059) (not e!830412))))

(declare-fun lt!646319 () SeekEntryResult!12123)

(assert (=> b!1480143 (= res!1005059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47986 a!2862) j!93) mask!2687) (select (arr!47986 a!2862) j!93) a!2862 mask!2687) lt!646319))))

(assert (=> b!1480143 (= lt!646319 (Intermediate!12123 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480154 () Bool)

(declare-fun res!1005067 () Bool)

(assert (=> b!1480154 (=> (not res!1005067) (not e!830404))))

(declare-datatypes ((List!34474 0))(
  ( (Nil!34471) (Cons!34470 (h!35852 (_ BitVec 64)) (t!49160 List!34474)) )
))
(declare-fun arrayNoDuplicates!0 (array!99424 (_ BitVec 32) List!34474) Bool)

(assert (=> b!1480154 (= res!1005067 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34471))))

(declare-fun b!1480155 () Bool)

(assert (=> b!1480155 (= e!830411 (not true))))

(assert (=> b!1480155 e!830406))

(declare-fun res!1005070 () Bool)

(assert (=> b!1480155 (=> (not res!1005070) (not e!830406))))

(assert (=> b!1480155 (= res!1005070 (and (= lt!646318 (Found!12123 j!93)) (or (= (select (arr!47986 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47986 a!2862) intermediateBeforeIndex!19) (select (arr!47986 a!2862) j!93)))))))

(assert (=> b!1480155 (= lt!646318 (seekEntryOrOpen!0 (select (arr!47986 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99424 (_ BitVec 32)) Bool)

(assert (=> b!1480155 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49619 0))(
  ( (Unit!49620) )
))
(declare-fun lt!646320 () Unit!49619)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49619)

(assert (=> b!1480155 (= lt!646320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480156 () Bool)

(declare-fun res!1005066 () Bool)

(assert (=> b!1480156 (=> (not res!1005066) (not e!830404))))

(assert (=> b!1480156 (= res!1005066 (validKeyInArray!0 (select (arr!47986 a!2862) j!93)))))

(declare-fun b!1480157 () Bool)

(declare-fun res!1005074 () Bool)

(assert (=> b!1480157 (=> (not res!1005074) (not e!830404))))

(assert (=> b!1480157 (= res!1005074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480158 () Bool)

(declare-fun res!1005073 () Bool)

(assert (=> b!1480158 (=> (not res!1005073) (not e!830412))))

(assert (=> b!1480158 (= res!1005073 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47986 a!2862) j!93) a!2862 mask!2687) lt!646319))))

(declare-fun b!1480159 () Bool)

(declare-fun res!1005063 () Bool)

(assert (=> b!1480159 (=> (not res!1005063) (not e!830411))))

(assert (=> b!1480159 (= res!1005063 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126480 res!1005064) b!1480151))

(assert (= (and b!1480151 res!1005062) b!1480152))

(assert (= (and b!1480152 res!1005060) b!1480156))

(assert (= (and b!1480156 res!1005066) b!1480157))

(assert (= (and b!1480157 res!1005074) b!1480154))

(assert (= (and b!1480154 res!1005067) b!1480150))

(assert (= (and b!1480150 res!1005068) b!1480146))

(assert (= (and b!1480146 res!1005061) b!1480143))

(assert (= (and b!1480143 res!1005059) b!1480158))

(assert (= (and b!1480158 res!1005073) b!1480142))

(assert (= (and b!1480142 res!1005071) b!1480144))

(assert (= (and b!1480144 c!137071) b!1480147))

(assert (= (and b!1480144 (not c!137071)) b!1480153))

(assert (= (and b!1480144 res!1005065) b!1480159))

(assert (= (and b!1480159 res!1005063) b!1480155))

(assert (= (and b!1480155 res!1005070) b!1480148))

(assert (= (and b!1480148 (not res!1005072)) b!1480149))

(assert (= (and b!1480149 res!1005069) b!1480145))

(declare-fun m!1366033 () Bool)

(assert (=> b!1480146 m!1366033))

(declare-fun m!1366035 () Bool)

(assert (=> b!1480146 m!1366035))

(declare-fun m!1366037 () Bool)

(assert (=> b!1480157 m!1366037))

(declare-fun m!1366039 () Bool)

(assert (=> start!126480 m!1366039))

(declare-fun m!1366041 () Bool)

(assert (=> start!126480 m!1366041))

(declare-fun m!1366043 () Bool)

(assert (=> b!1480152 m!1366043))

(assert (=> b!1480152 m!1366043))

(declare-fun m!1366045 () Bool)

(assert (=> b!1480152 m!1366045))

(declare-fun m!1366047 () Bool)

(assert (=> b!1480149 m!1366047))

(assert (=> b!1480149 m!1366047))

(declare-fun m!1366049 () Bool)

(assert (=> b!1480149 m!1366049))

(declare-fun m!1366051 () Bool)

(assert (=> b!1480142 m!1366051))

(assert (=> b!1480142 m!1366051))

(declare-fun m!1366053 () Bool)

(assert (=> b!1480142 m!1366053))

(assert (=> b!1480142 m!1366033))

(declare-fun m!1366055 () Bool)

(assert (=> b!1480142 m!1366055))

(assert (=> b!1480158 m!1366047))

(assert (=> b!1480158 m!1366047))

(declare-fun m!1366057 () Bool)

(assert (=> b!1480158 m!1366057))

(assert (=> b!1480143 m!1366047))

(assert (=> b!1480143 m!1366047))

(declare-fun m!1366059 () Bool)

(assert (=> b!1480143 m!1366059))

(assert (=> b!1480143 m!1366059))

(assert (=> b!1480143 m!1366047))

(declare-fun m!1366061 () Bool)

(assert (=> b!1480143 m!1366061))

(declare-fun m!1366063 () Bool)

(assert (=> b!1480153 m!1366063))

(declare-fun m!1366065 () Bool)

(assert (=> b!1480153 m!1366065))

(declare-fun m!1366067 () Bool)

(assert (=> b!1480147 m!1366067))

(declare-fun m!1366069 () Bool)

(assert (=> b!1480148 m!1366069))

(assert (=> b!1480148 m!1366033))

(declare-fun m!1366071 () Bool)

(assert (=> b!1480148 m!1366071))

(assert (=> b!1480148 m!1366047))

(declare-fun m!1366073 () Bool)

(assert (=> b!1480155 m!1366073))

(declare-fun m!1366075 () Bool)

(assert (=> b!1480155 m!1366075))

(assert (=> b!1480155 m!1366047))

(declare-fun m!1366077 () Bool)

(assert (=> b!1480155 m!1366077))

(declare-fun m!1366079 () Bool)

(assert (=> b!1480155 m!1366079))

(assert (=> b!1480155 m!1366047))

(declare-fun m!1366081 () Bool)

(assert (=> b!1480154 m!1366081))

(assert (=> b!1480156 m!1366047))

(assert (=> b!1480156 m!1366047))

(declare-fun m!1366083 () Bool)

(assert (=> b!1480156 m!1366083))

(check-sat (not b!1480154) (not b!1480152) (not b!1480143) (not b!1480157) (not start!126480) (not b!1480149) (not b!1480156) (not b!1480158) (not b!1480153) (not b!1480142) (not b!1480147) (not b!1480155))
(check-sat)
