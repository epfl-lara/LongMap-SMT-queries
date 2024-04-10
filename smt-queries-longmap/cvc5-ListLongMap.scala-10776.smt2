; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126154 () Bool)

(assert start!126154)

(declare-fun b!1477138 () Bool)

(declare-fun e!828693 () Bool)

(declare-fun e!828698 () Bool)

(assert (=> b!1477138 (= e!828693 e!828698)))

(declare-fun res!1003309 () Bool)

(assert (=> b!1477138 (=> (not res!1003309) (not e!828698))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12149 0))(
  ( (MissingZero!12149 (index!50988 (_ BitVec 32))) (Found!12149 (index!50989 (_ BitVec 32))) (Intermediate!12149 (undefined!12961 Bool) (index!50990 (_ BitVec 32)) (x!132588 (_ BitVec 32))) (Undefined!12149) (MissingVacant!12149 (index!50991 (_ BitVec 32))) )
))
(declare-fun lt!645251 () SeekEntryResult!12149)

(declare-datatypes ((array!99260 0))(
  ( (array!99261 (arr!47909 (Array (_ BitVec 32) (_ BitVec 64))) (size!48459 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99260 (_ BitVec 32)) SeekEntryResult!12149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477138 (= res!1003309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47909 a!2862) j!93) mask!2687) (select (arr!47909 a!2862) j!93) a!2862 mask!2687) lt!645251))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477138 (= lt!645251 (Intermediate!12149 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477139 () Bool)

(declare-fun e!828700 () Bool)

(declare-fun e!828696 () Bool)

(assert (=> b!1477139 (= e!828700 e!828696)))

(declare-fun res!1003312 () Bool)

(assert (=> b!1477139 (=> (not res!1003312) (not e!828696))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!645247 () SeekEntryResult!12149)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99260 (_ BitVec 32)) SeekEntryResult!12149)

(assert (=> b!1477139 (= res!1003312 (= lt!645247 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47909 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477140 () Bool)

(declare-fun e!828694 () Bool)

(assert (=> b!1477140 (= e!828698 e!828694)))

(declare-fun res!1003301 () Bool)

(assert (=> b!1477140 (=> (not res!1003301) (not e!828694))))

(declare-fun lt!645252 () SeekEntryResult!12149)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477140 (= res!1003301 (= lt!645252 (Intermediate!12149 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645249 () array!99260)

(declare-fun lt!645250 () (_ BitVec 64))

(assert (=> b!1477140 (= lt!645252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645250 mask!2687) lt!645250 lt!645249 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477140 (= lt!645250 (select (store (arr!47909 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477141 () Bool)

(declare-fun res!1003307 () Bool)

(assert (=> b!1477141 (=> (not res!1003307) (not e!828694))))

(declare-fun e!828695 () Bool)

(assert (=> b!1477141 (= res!1003307 e!828695)))

(declare-fun c!136440 () Bool)

(assert (=> b!1477141 (= c!136440 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477142 () Bool)

(declare-fun res!1003305 () Bool)

(declare-fun e!828701 () Bool)

(assert (=> b!1477142 (=> (not res!1003305) (not e!828701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477142 (= res!1003305 (validKeyInArray!0 (select (arr!47909 a!2862) j!93)))))

(declare-fun b!1477144 () Bool)

(assert (=> b!1477144 (= e!828694 (not true))))

(declare-fun e!828697 () Bool)

(assert (=> b!1477144 e!828697))

(declare-fun res!1003298 () Bool)

(assert (=> b!1477144 (=> (not res!1003298) (not e!828697))))

(assert (=> b!1477144 (= res!1003298 (and (= lt!645247 (Found!12149 j!93)) (or (= (select (arr!47909 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47909 a!2862) intermediateBeforeIndex!19) (select (arr!47909 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99260 (_ BitVec 32)) SeekEntryResult!12149)

(assert (=> b!1477144 (= lt!645247 (seekEntryOrOpen!0 (select (arr!47909 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99260 (_ BitVec 32)) Bool)

(assert (=> b!1477144 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49638 0))(
  ( (Unit!49639) )
))
(declare-fun lt!645248 () Unit!49638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49638)

(assert (=> b!1477144 (= lt!645248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477145 () Bool)

(declare-fun res!1003303 () Bool)

(assert (=> b!1477145 (=> (not res!1003303) (not e!828698))))

(assert (=> b!1477145 (= res!1003303 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47909 a!2862) j!93) a!2862 mask!2687) lt!645251))))

(declare-fun b!1477146 () Bool)

(assert (=> b!1477146 (= e!828697 e!828700)))

(declare-fun res!1003299 () Bool)

(assert (=> b!1477146 (=> res!1003299 e!828700)))

(assert (=> b!1477146 (= res!1003299 (or (and (= (select (arr!47909 a!2862) index!646) (select (store (arr!47909 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47909 a!2862) index!646) (select (arr!47909 a!2862) j!93))) (not (= (select (arr!47909 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477147 () Bool)

(declare-fun res!1003300 () Bool)

(assert (=> b!1477147 (=> (not res!1003300) (not e!828701))))

(assert (=> b!1477147 (= res!1003300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477148 () Bool)

(declare-fun res!1003306 () Bool)

(assert (=> b!1477148 (=> (not res!1003306) (not e!828701))))

(assert (=> b!1477148 (= res!1003306 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48459 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48459 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48459 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477149 () Bool)

(assert (=> b!1477149 (= e!828695 (= lt!645252 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645250 lt!645249 mask!2687)))))

(declare-fun b!1477150 () Bool)

(declare-fun res!1003297 () Bool)

(assert (=> b!1477150 (=> (not res!1003297) (not e!828701))))

(assert (=> b!1477150 (= res!1003297 (validKeyInArray!0 (select (arr!47909 a!2862) i!1006)))))

(declare-fun b!1477151 () Bool)

(declare-fun res!1003311 () Bool)

(assert (=> b!1477151 (=> (not res!1003311) (not e!828694))))

(assert (=> b!1477151 (= res!1003311 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477152 () Bool)

(declare-fun res!1003308 () Bool)

(assert (=> b!1477152 (=> (not res!1003308) (not e!828701))))

(assert (=> b!1477152 (= res!1003308 (and (= (size!48459 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48459 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48459 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477153 () Bool)

(declare-fun res!1003304 () Bool)

(assert (=> b!1477153 (=> (not res!1003304) (not e!828701))))

(declare-datatypes ((List!34410 0))(
  ( (Nil!34407) (Cons!34406 (h!35774 (_ BitVec 64)) (t!49104 List!34410)) )
))
(declare-fun arrayNoDuplicates!0 (array!99260 (_ BitVec 32) List!34410) Bool)

(assert (=> b!1477153 (= res!1003304 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34407))))

(declare-fun b!1477143 () Bool)

(assert (=> b!1477143 (= e!828701 e!828693)))

(declare-fun res!1003310 () Bool)

(assert (=> b!1477143 (=> (not res!1003310) (not e!828693))))

(assert (=> b!1477143 (= res!1003310 (= (select (store (arr!47909 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477143 (= lt!645249 (array!99261 (store (arr!47909 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48459 a!2862)))))

(declare-fun res!1003302 () Bool)

(assert (=> start!126154 (=> (not res!1003302) (not e!828701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126154 (= res!1003302 (validMask!0 mask!2687))))

(assert (=> start!126154 e!828701))

(assert (=> start!126154 true))

(declare-fun array_inv!36937 (array!99260) Bool)

(assert (=> start!126154 (array_inv!36937 a!2862)))

(declare-fun b!1477154 () Bool)

(assert (=> b!1477154 (= e!828696 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477155 () Bool)

(assert (=> b!1477155 (= e!828695 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645250 lt!645249 mask!2687) (seekEntryOrOpen!0 lt!645250 lt!645249 mask!2687)))))

(assert (= (and start!126154 res!1003302) b!1477152))

(assert (= (and b!1477152 res!1003308) b!1477150))

(assert (= (and b!1477150 res!1003297) b!1477142))

(assert (= (and b!1477142 res!1003305) b!1477147))

(assert (= (and b!1477147 res!1003300) b!1477153))

(assert (= (and b!1477153 res!1003304) b!1477148))

(assert (= (and b!1477148 res!1003306) b!1477143))

(assert (= (and b!1477143 res!1003310) b!1477138))

(assert (= (and b!1477138 res!1003309) b!1477145))

(assert (= (and b!1477145 res!1003303) b!1477140))

(assert (= (and b!1477140 res!1003301) b!1477141))

(assert (= (and b!1477141 c!136440) b!1477149))

(assert (= (and b!1477141 (not c!136440)) b!1477155))

(assert (= (and b!1477141 res!1003307) b!1477151))

(assert (= (and b!1477151 res!1003311) b!1477144))

(assert (= (and b!1477144 res!1003298) b!1477146))

(assert (= (and b!1477146 (not res!1003299)) b!1477139))

(assert (= (and b!1477139 res!1003312) b!1477154))

(declare-fun m!1363099 () Bool)

(assert (=> b!1477140 m!1363099))

(assert (=> b!1477140 m!1363099))

(declare-fun m!1363101 () Bool)

(assert (=> b!1477140 m!1363101))

(declare-fun m!1363103 () Bool)

(assert (=> b!1477140 m!1363103))

(declare-fun m!1363105 () Bool)

(assert (=> b!1477140 m!1363105))

(declare-fun m!1363107 () Bool)

(assert (=> b!1477145 m!1363107))

(assert (=> b!1477145 m!1363107))

(declare-fun m!1363109 () Bool)

(assert (=> b!1477145 m!1363109))

(declare-fun m!1363111 () Bool)

(assert (=> b!1477150 m!1363111))

(assert (=> b!1477150 m!1363111))

(declare-fun m!1363113 () Bool)

(assert (=> b!1477150 m!1363113))

(declare-fun m!1363115 () Bool)

(assert (=> b!1477147 m!1363115))

(assert (=> b!1477143 m!1363103))

(declare-fun m!1363117 () Bool)

(assert (=> b!1477143 m!1363117))

(declare-fun m!1363119 () Bool)

(assert (=> b!1477155 m!1363119))

(declare-fun m!1363121 () Bool)

(assert (=> b!1477155 m!1363121))

(declare-fun m!1363123 () Bool)

(assert (=> start!126154 m!1363123))

(declare-fun m!1363125 () Bool)

(assert (=> start!126154 m!1363125))

(assert (=> b!1477142 m!1363107))

(assert (=> b!1477142 m!1363107))

(declare-fun m!1363127 () Bool)

(assert (=> b!1477142 m!1363127))

(declare-fun m!1363129 () Bool)

(assert (=> b!1477144 m!1363129))

(declare-fun m!1363131 () Bool)

(assert (=> b!1477144 m!1363131))

(assert (=> b!1477144 m!1363107))

(declare-fun m!1363133 () Bool)

(assert (=> b!1477144 m!1363133))

(declare-fun m!1363135 () Bool)

(assert (=> b!1477144 m!1363135))

(assert (=> b!1477144 m!1363107))

(assert (=> b!1477138 m!1363107))

(assert (=> b!1477138 m!1363107))

(declare-fun m!1363137 () Bool)

(assert (=> b!1477138 m!1363137))

(assert (=> b!1477138 m!1363137))

(assert (=> b!1477138 m!1363107))

(declare-fun m!1363139 () Bool)

(assert (=> b!1477138 m!1363139))

(declare-fun m!1363141 () Bool)

(assert (=> b!1477146 m!1363141))

(assert (=> b!1477146 m!1363103))

(declare-fun m!1363143 () Bool)

(assert (=> b!1477146 m!1363143))

(assert (=> b!1477146 m!1363107))

(assert (=> b!1477139 m!1363107))

(assert (=> b!1477139 m!1363107))

(declare-fun m!1363145 () Bool)

(assert (=> b!1477139 m!1363145))

(declare-fun m!1363147 () Bool)

(assert (=> b!1477149 m!1363147))

(declare-fun m!1363149 () Bool)

(assert (=> b!1477153 m!1363149))

(push 1)

