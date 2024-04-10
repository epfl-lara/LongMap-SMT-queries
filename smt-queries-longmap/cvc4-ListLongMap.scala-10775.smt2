; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126152 () Bool)

(assert start!126152)

(declare-fun b!1477084 () Bool)

(declare-fun res!1003257 () Bool)

(declare-fun e!828672 () Bool)

(assert (=> b!1477084 (=> (not res!1003257) (not e!828672))))

(declare-datatypes ((array!99258 0))(
  ( (array!99259 (arr!47908 (Array (_ BitVec 32) (_ BitVec 64))) (size!48458 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99258)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477084 (= res!1003257 (validKeyInArray!0 (select (arr!47908 a!2862) i!1006)))))

(declare-fun b!1477085 () Bool)

(declare-fun e!828674 () Bool)

(declare-fun e!828670 () Bool)

(assert (=> b!1477085 (= e!828674 e!828670)))

(declare-fun res!1003249 () Bool)

(assert (=> b!1477085 (=> (not res!1003249) (not e!828670))))

(declare-datatypes ((SeekEntryResult!12148 0))(
  ( (MissingZero!12148 (index!50984 (_ BitVec 32))) (Found!12148 (index!50985 (_ BitVec 32))) (Intermediate!12148 (undefined!12960 Bool) (index!50986 (_ BitVec 32)) (x!132579 (_ BitVec 32))) (Undefined!12148) (MissingVacant!12148 (index!50987 (_ BitVec 32))) )
))
(declare-fun lt!645231 () SeekEntryResult!12148)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477085 (= res!1003249 (= lt!645231 (Intermediate!12148 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645230 () array!99258)

(declare-fun lt!645232 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99258 (_ BitVec 32)) SeekEntryResult!12148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477085 (= lt!645231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645232 mask!2687) lt!645232 lt!645230 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477085 (= lt!645232 (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477086 () Bool)

(declare-fun res!1003263 () Bool)

(assert (=> b!1477086 (=> (not res!1003263) (not e!828672))))

(assert (=> b!1477086 (= res!1003263 (and (= (size!48458 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48458 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48458 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1477087 () Bool)

(declare-fun e!828666 () Bool)

(assert (=> b!1477087 (= e!828666 (= lt!645231 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645232 lt!645230 mask!2687)))))

(declare-fun b!1477089 () Bool)

(declare-fun res!1003261 () Bool)

(assert (=> b!1477089 (=> (not res!1003261) (not e!828672))))

(declare-datatypes ((List!34409 0))(
  ( (Nil!34406) (Cons!34405 (h!35773 (_ BitVec 64)) (t!49103 List!34409)) )
))
(declare-fun arrayNoDuplicates!0 (array!99258 (_ BitVec 32) List!34409) Bool)

(assert (=> b!1477089 (= res!1003261 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34406))))

(declare-fun b!1477090 () Bool)

(declare-fun e!828669 () Bool)

(declare-fun e!828673 () Bool)

(assert (=> b!1477090 (= e!828669 e!828673)))

(declare-fun res!1003258 () Bool)

(assert (=> b!1477090 (=> res!1003258 e!828673)))

(assert (=> b!1477090 (= res!1003258 (or (and (= (select (arr!47908 a!2862) index!646) (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47908 a!2862) index!646) (select (arr!47908 a!2862) j!93))) (not (= (select (arr!47908 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477091 () Bool)

(declare-fun e!828671 () Bool)

(assert (=> b!1477091 (= e!828673 e!828671)))

(declare-fun res!1003260 () Bool)

(assert (=> b!1477091 (=> (not res!1003260) (not e!828671))))

(declare-fun lt!645233 () SeekEntryResult!12148)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99258 (_ BitVec 32)) SeekEntryResult!12148)

(assert (=> b!1477091 (= res!1003260 (= lt!645233 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47908 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1477092 () Bool)

(assert (=> b!1477092 (= e!828671 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477093 () Bool)

(declare-fun res!1003262 () Bool)

(assert (=> b!1477093 (=> (not res!1003262) (not e!828670))))

(assert (=> b!1477093 (= res!1003262 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477094 () Bool)

(declare-fun res!1003255 () Bool)

(assert (=> b!1477094 (=> (not res!1003255) (not e!828672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99258 (_ BitVec 32)) Bool)

(assert (=> b!1477094 (= res!1003255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477095 () Bool)

(declare-fun res!1003251 () Bool)

(assert (=> b!1477095 (=> (not res!1003251) (not e!828674))))

(declare-fun lt!645229 () SeekEntryResult!12148)

(assert (=> b!1477095 (= res!1003251 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47908 a!2862) j!93) a!2862 mask!2687) lt!645229))))

(declare-fun b!1477096 () Bool)

(declare-fun res!1003253 () Bool)

(assert (=> b!1477096 (=> (not res!1003253) (not e!828672))))

(assert (=> b!1477096 (= res!1003253 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48458 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48458 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48458 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1003264 () Bool)

(assert (=> start!126152 (=> (not res!1003264) (not e!828672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126152 (= res!1003264 (validMask!0 mask!2687))))

(assert (=> start!126152 e!828672))

(assert (=> start!126152 true))

(declare-fun array_inv!36936 (array!99258) Bool)

(assert (=> start!126152 (array_inv!36936 a!2862)))

(declare-fun b!1477088 () Bool)

(assert (=> b!1477088 (= e!828670 (not true))))

(assert (=> b!1477088 e!828669))

(declare-fun res!1003259 () Bool)

(assert (=> b!1477088 (=> (not res!1003259) (not e!828669))))

(assert (=> b!1477088 (= res!1003259 (and (= lt!645233 (Found!12148 j!93)) (or (= (select (arr!47908 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47908 a!2862) intermediateBeforeIndex!19) (select (arr!47908 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99258 (_ BitVec 32)) SeekEntryResult!12148)

(assert (=> b!1477088 (= lt!645233 (seekEntryOrOpen!0 (select (arr!47908 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477088 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49636 0))(
  ( (Unit!49637) )
))
(declare-fun lt!645234 () Unit!49636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49636)

(assert (=> b!1477088 (= lt!645234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477097 () Bool)

(assert (=> b!1477097 (= e!828666 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645232 lt!645230 mask!2687) (seekEntryOrOpen!0 lt!645232 lt!645230 mask!2687)))))

(declare-fun b!1477098 () Bool)

(declare-fun e!828668 () Bool)

(assert (=> b!1477098 (= e!828668 e!828674)))

(declare-fun res!1003252 () Bool)

(assert (=> b!1477098 (=> (not res!1003252) (not e!828674))))

(assert (=> b!1477098 (= res!1003252 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47908 a!2862) j!93) mask!2687) (select (arr!47908 a!2862) j!93) a!2862 mask!2687) lt!645229))))

(assert (=> b!1477098 (= lt!645229 (Intermediate!12148 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477099 () Bool)

(declare-fun res!1003256 () Bool)

(assert (=> b!1477099 (=> (not res!1003256) (not e!828670))))

(assert (=> b!1477099 (= res!1003256 e!828666)))

(declare-fun c!136437 () Bool)

(assert (=> b!1477099 (= c!136437 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477100 () Bool)

(assert (=> b!1477100 (= e!828672 e!828668)))

(declare-fun res!1003254 () Bool)

(assert (=> b!1477100 (=> (not res!1003254) (not e!828668))))

(assert (=> b!1477100 (= res!1003254 (= (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477100 (= lt!645230 (array!99259 (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48458 a!2862)))))

(declare-fun b!1477101 () Bool)

(declare-fun res!1003250 () Bool)

(assert (=> b!1477101 (=> (not res!1003250) (not e!828672))))

(assert (=> b!1477101 (= res!1003250 (validKeyInArray!0 (select (arr!47908 a!2862) j!93)))))

(assert (= (and start!126152 res!1003264) b!1477086))

(assert (= (and b!1477086 res!1003263) b!1477084))

(assert (= (and b!1477084 res!1003257) b!1477101))

(assert (= (and b!1477101 res!1003250) b!1477094))

(assert (= (and b!1477094 res!1003255) b!1477089))

(assert (= (and b!1477089 res!1003261) b!1477096))

(assert (= (and b!1477096 res!1003253) b!1477100))

(assert (= (and b!1477100 res!1003254) b!1477098))

(assert (= (and b!1477098 res!1003252) b!1477095))

(assert (= (and b!1477095 res!1003251) b!1477085))

(assert (= (and b!1477085 res!1003249) b!1477099))

(assert (= (and b!1477099 c!136437) b!1477087))

(assert (= (and b!1477099 (not c!136437)) b!1477097))

(assert (= (and b!1477099 res!1003256) b!1477093))

(assert (= (and b!1477093 res!1003262) b!1477088))

(assert (= (and b!1477088 res!1003259) b!1477090))

(assert (= (and b!1477090 (not res!1003258)) b!1477091))

(assert (= (and b!1477091 res!1003260) b!1477092))

(declare-fun m!1363047 () Bool)

(assert (=> b!1477087 m!1363047))

(declare-fun m!1363049 () Bool)

(assert (=> b!1477090 m!1363049))

(declare-fun m!1363051 () Bool)

(assert (=> b!1477090 m!1363051))

(declare-fun m!1363053 () Bool)

(assert (=> b!1477090 m!1363053))

(declare-fun m!1363055 () Bool)

(assert (=> b!1477090 m!1363055))

(assert (=> b!1477101 m!1363055))

(assert (=> b!1477101 m!1363055))

(declare-fun m!1363057 () Bool)

(assert (=> b!1477101 m!1363057))

(declare-fun m!1363059 () Bool)

(assert (=> b!1477085 m!1363059))

(assert (=> b!1477085 m!1363059))

(declare-fun m!1363061 () Bool)

(assert (=> b!1477085 m!1363061))

(assert (=> b!1477085 m!1363051))

(declare-fun m!1363063 () Bool)

(assert (=> b!1477085 m!1363063))

(declare-fun m!1363065 () Bool)

(assert (=> b!1477088 m!1363065))

(declare-fun m!1363067 () Bool)

(assert (=> b!1477088 m!1363067))

(assert (=> b!1477088 m!1363055))

(declare-fun m!1363069 () Bool)

(assert (=> b!1477088 m!1363069))

(declare-fun m!1363071 () Bool)

(assert (=> b!1477088 m!1363071))

(assert (=> b!1477088 m!1363055))

(assert (=> b!1477091 m!1363055))

(assert (=> b!1477091 m!1363055))

(declare-fun m!1363073 () Bool)

(assert (=> b!1477091 m!1363073))

(declare-fun m!1363075 () Bool)

(assert (=> start!126152 m!1363075))

(declare-fun m!1363077 () Bool)

(assert (=> start!126152 m!1363077))

(declare-fun m!1363079 () Bool)

(assert (=> b!1477089 m!1363079))

(declare-fun m!1363081 () Bool)

(assert (=> b!1477097 m!1363081))

(declare-fun m!1363083 () Bool)

(assert (=> b!1477097 m!1363083))

(assert (=> b!1477100 m!1363051))

(declare-fun m!1363085 () Bool)

(assert (=> b!1477100 m!1363085))

(assert (=> b!1477098 m!1363055))

(assert (=> b!1477098 m!1363055))

(declare-fun m!1363087 () Bool)

(assert (=> b!1477098 m!1363087))

(assert (=> b!1477098 m!1363087))

(assert (=> b!1477098 m!1363055))

(declare-fun m!1363089 () Bool)

(assert (=> b!1477098 m!1363089))

(declare-fun m!1363091 () Bool)

(assert (=> b!1477094 m!1363091))

(declare-fun m!1363093 () Bool)

(assert (=> b!1477084 m!1363093))

(assert (=> b!1477084 m!1363093))

(declare-fun m!1363095 () Bool)

(assert (=> b!1477084 m!1363095))

(assert (=> b!1477095 m!1363055))

(assert (=> b!1477095 m!1363055))

(declare-fun m!1363097 () Bool)

(assert (=> b!1477095 m!1363097))

(push 1)

