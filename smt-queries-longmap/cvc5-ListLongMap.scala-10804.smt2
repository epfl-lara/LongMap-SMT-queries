; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126412 () Bool)

(assert start!126412)

(declare-fun b!1482332 () Bool)

(declare-fun e!831242 () Bool)

(declare-fun e!831243 () Bool)

(assert (=> b!1482332 (= e!831242 e!831243)))

(declare-fun res!1007558 () Bool)

(assert (=> b!1482332 (=> (not res!1007558) (not e!831243))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99431 0))(
  ( (array!99432 (arr!47993 (Array (_ BitVec 32) (_ BitVec 64))) (size!48543 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99431)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482332 (= res!1007558 (= (select (store (arr!47993 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647039 () array!99431)

(assert (=> b!1482332 (= lt!647039 (array!99432 (store (arr!47993 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48543 a!2862)))))

(declare-fun b!1482333 () Bool)

(declare-fun res!1007557 () Bool)

(assert (=> b!1482333 (=> (not res!1007557) (not e!831242))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482333 (= res!1007557 (validKeyInArray!0 (select (arr!47993 a!2862) j!93)))))

(declare-fun b!1482334 () Bool)

(declare-fun res!1007556 () Bool)

(assert (=> b!1482334 (=> (not res!1007556) (not e!831242))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1482334 (= res!1007556 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48543 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48543 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48543 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!647043 () (_ BitVec 64))

(declare-fun b!1482335 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!831245 () Bool)

(declare-datatypes ((SeekEntryResult!12233 0))(
  ( (MissingZero!12233 (index!51324 (_ BitVec 32))) (Found!12233 (index!51325 (_ BitVec 32))) (Intermediate!12233 (undefined!13045 Bool) (index!51326 (_ BitVec 32)) (x!132908 (_ BitVec 32))) (Undefined!12233) (MissingVacant!12233 (index!51327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99431 (_ BitVec 32)) SeekEntryResult!12233)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99431 (_ BitVec 32)) SeekEntryResult!12233)

(assert (=> b!1482335 (= e!831245 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647043 lt!647039 mask!2687) (seekEntryOrOpen!0 lt!647043 lt!647039 mask!2687)))))

(declare-fun b!1482336 () Bool)

(declare-fun res!1007566 () Bool)

(assert (=> b!1482336 (=> (not res!1007566) (not e!831242))))

(assert (=> b!1482336 (= res!1007566 (validKeyInArray!0 (select (arr!47993 a!2862) i!1006)))))

(declare-fun b!1482337 () Bool)

(declare-fun res!1007552 () Bool)

(declare-fun e!831244 () Bool)

(assert (=> b!1482337 (=> (not res!1007552) (not e!831244))))

(assert (=> b!1482337 (= res!1007552 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482338 () Bool)

(declare-fun res!1007559 () Bool)

(assert (=> b!1482338 (=> (not res!1007559) (not e!831244))))

(assert (=> b!1482338 (= res!1007559 e!831245)))

(declare-fun c!136911 () Bool)

(assert (=> b!1482338 (= c!136911 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482339 () Bool)

(declare-fun lt!647040 () SeekEntryResult!12233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99431 (_ BitVec 32)) SeekEntryResult!12233)

(assert (=> b!1482339 (= e!831245 (= lt!647040 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647043 lt!647039 mask!2687)))))

(declare-fun b!1482340 () Bool)

(declare-fun res!1007553 () Bool)

(assert (=> b!1482340 (=> (not res!1007553) (not e!831242))))

(assert (=> b!1482340 (= res!1007553 (and (= (size!48543 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48543 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48543 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!831247 () Bool)

(declare-fun b!1482342 () Bool)

(assert (=> b!1482342 (= e!831247 (and (or (= (select (arr!47993 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47993 a!2862) intermediateBeforeIndex!19) (select (arr!47993 a!2862) j!93))) (or (and (= (select (arr!47993 a!2862) index!646) (select (store (arr!47993 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47993 a!2862) index!646) (select (arr!47993 a!2862) j!93))) (= (select (arr!47993 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47993 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1482343 () Bool)

(declare-fun res!1007561 () Bool)

(declare-fun e!831246 () Bool)

(assert (=> b!1482343 (=> (not res!1007561) (not e!831246))))

(declare-fun lt!647041 () SeekEntryResult!12233)

(assert (=> b!1482343 (= res!1007561 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47993 a!2862) j!93) a!2862 mask!2687) lt!647041))))

(declare-fun b!1482344 () Bool)

(assert (=> b!1482344 (= e!831244 (not true))))

(assert (=> b!1482344 e!831247))

(declare-fun res!1007555 () Bool)

(assert (=> b!1482344 (=> (not res!1007555) (not e!831247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99431 (_ BitVec 32)) Bool)

(assert (=> b!1482344 (= res!1007555 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49806 0))(
  ( (Unit!49807) )
))
(declare-fun lt!647042 () Unit!49806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49806)

(assert (=> b!1482344 (= lt!647042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482345 () Bool)

(assert (=> b!1482345 (= e!831243 e!831246)))

(declare-fun res!1007565 () Bool)

(assert (=> b!1482345 (=> (not res!1007565) (not e!831246))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482345 (= res!1007565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47993 a!2862) j!93) mask!2687) (select (arr!47993 a!2862) j!93) a!2862 mask!2687) lt!647041))))

(assert (=> b!1482345 (= lt!647041 (Intermediate!12233 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482346 () Bool)

(declare-fun res!1007562 () Bool)

(assert (=> b!1482346 (=> (not res!1007562) (not e!831247))))

(assert (=> b!1482346 (= res!1007562 (= (seekEntryOrOpen!0 (select (arr!47993 a!2862) j!93) a!2862 mask!2687) (Found!12233 j!93)))))

(declare-fun b!1482347 () Bool)

(assert (=> b!1482347 (= e!831246 e!831244)))

(declare-fun res!1007564 () Bool)

(assert (=> b!1482347 (=> (not res!1007564) (not e!831244))))

(assert (=> b!1482347 (= res!1007564 (= lt!647040 (Intermediate!12233 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482347 (= lt!647040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647043 mask!2687) lt!647043 lt!647039 mask!2687))))

(assert (=> b!1482347 (= lt!647043 (select (store (arr!47993 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482348 () Bool)

(declare-fun res!1007560 () Bool)

(assert (=> b!1482348 (=> (not res!1007560) (not e!831242))))

(assert (=> b!1482348 (= res!1007560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482341 () Bool)

(declare-fun res!1007563 () Bool)

(assert (=> b!1482341 (=> (not res!1007563) (not e!831242))))

(declare-datatypes ((List!34494 0))(
  ( (Nil!34491) (Cons!34490 (h!35861 (_ BitVec 64)) (t!49188 List!34494)) )
))
(declare-fun arrayNoDuplicates!0 (array!99431 (_ BitVec 32) List!34494) Bool)

(assert (=> b!1482341 (= res!1007563 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34491))))

(declare-fun res!1007554 () Bool)

(assert (=> start!126412 (=> (not res!1007554) (not e!831242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126412 (= res!1007554 (validMask!0 mask!2687))))

(assert (=> start!126412 e!831242))

(assert (=> start!126412 true))

(declare-fun array_inv!37021 (array!99431) Bool)

(assert (=> start!126412 (array_inv!37021 a!2862)))

(assert (= (and start!126412 res!1007554) b!1482340))

(assert (= (and b!1482340 res!1007553) b!1482336))

(assert (= (and b!1482336 res!1007566) b!1482333))

(assert (= (and b!1482333 res!1007557) b!1482348))

(assert (= (and b!1482348 res!1007560) b!1482341))

(assert (= (and b!1482341 res!1007563) b!1482334))

(assert (= (and b!1482334 res!1007556) b!1482332))

(assert (= (and b!1482332 res!1007558) b!1482345))

(assert (= (and b!1482345 res!1007565) b!1482343))

(assert (= (and b!1482343 res!1007561) b!1482347))

(assert (= (and b!1482347 res!1007564) b!1482338))

(assert (= (and b!1482338 c!136911) b!1482339))

(assert (= (and b!1482338 (not c!136911)) b!1482335))

(assert (= (and b!1482338 res!1007559) b!1482337))

(assert (= (and b!1482337 res!1007552) b!1482344))

(assert (= (and b!1482344 res!1007555) b!1482346))

(assert (= (and b!1482346 res!1007562) b!1482342))

(declare-fun m!1368055 () Bool)

(assert (=> b!1482342 m!1368055))

(declare-fun m!1368057 () Bool)

(assert (=> b!1482342 m!1368057))

(declare-fun m!1368059 () Bool)

(assert (=> b!1482342 m!1368059))

(declare-fun m!1368061 () Bool)

(assert (=> b!1482342 m!1368061))

(declare-fun m!1368063 () Bool)

(assert (=> b!1482342 m!1368063))

(assert (=> b!1482345 m!1368063))

(assert (=> b!1482345 m!1368063))

(declare-fun m!1368065 () Bool)

(assert (=> b!1482345 m!1368065))

(assert (=> b!1482345 m!1368065))

(assert (=> b!1482345 m!1368063))

(declare-fun m!1368067 () Bool)

(assert (=> b!1482345 m!1368067))

(declare-fun m!1368069 () Bool)

(assert (=> start!126412 m!1368069))

(declare-fun m!1368071 () Bool)

(assert (=> start!126412 m!1368071))

(declare-fun m!1368073 () Bool)

(assert (=> b!1482347 m!1368073))

(assert (=> b!1482347 m!1368073))

(declare-fun m!1368075 () Bool)

(assert (=> b!1482347 m!1368075))

(assert (=> b!1482347 m!1368055))

(declare-fun m!1368077 () Bool)

(assert (=> b!1482347 m!1368077))

(assert (=> b!1482332 m!1368055))

(declare-fun m!1368079 () Bool)

(assert (=> b!1482332 m!1368079))

(assert (=> b!1482343 m!1368063))

(assert (=> b!1482343 m!1368063))

(declare-fun m!1368081 () Bool)

(assert (=> b!1482343 m!1368081))

(assert (=> b!1482333 m!1368063))

(assert (=> b!1482333 m!1368063))

(declare-fun m!1368083 () Bool)

(assert (=> b!1482333 m!1368083))

(declare-fun m!1368085 () Bool)

(assert (=> b!1482344 m!1368085))

(declare-fun m!1368087 () Bool)

(assert (=> b!1482344 m!1368087))

(declare-fun m!1368089 () Bool)

(assert (=> b!1482335 m!1368089))

(declare-fun m!1368091 () Bool)

(assert (=> b!1482335 m!1368091))

(declare-fun m!1368093 () Bool)

(assert (=> b!1482339 m!1368093))

(declare-fun m!1368095 () Bool)

(assert (=> b!1482348 m!1368095))

(declare-fun m!1368097 () Bool)

(assert (=> b!1482336 m!1368097))

(assert (=> b!1482336 m!1368097))

(declare-fun m!1368099 () Bool)

(assert (=> b!1482336 m!1368099))

(declare-fun m!1368101 () Bool)

(assert (=> b!1482341 m!1368101))

(assert (=> b!1482346 m!1368063))

(assert (=> b!1482346 m!1368063))

(declare-fun m!1368103 () Bool)

(assert (=> b!1482346 m!1368103))

(push 1)

