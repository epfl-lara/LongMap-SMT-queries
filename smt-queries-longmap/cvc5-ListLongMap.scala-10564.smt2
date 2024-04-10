; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124522 () Bool)

(assert start!124522)

(declare-fun b!1440948 () Bool)

(declare-fun e!812347 () Bool)

(declare-fun e!812346 () Bool)

(assert (=> b!1440948 (= e!812347 e!812346)))

(declare-fun res!973379 () Bool)

(assert (=> b!1440948 (=> (not res!973379) (not e!812346))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11525 0))(
  ( (MissingZero!11525 (index!48492 (_ BitVec 32))) (Found!11525 (index!48493 (_ BitVec 32))) (Intermediate!11525 (undefined!12337 Bool) (index!48494 (_ BitVec 32)) (x!130214 (_ BitVec 32))) (Undefined!11525) (MissingVacant!11525 (index!48495 (_ BitVec 32))) )
))
(declare-fun lt!633053 () SeekEntryResult!11525)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440948 (= res!973379 (= lt!633053 (Intermediate!11525 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633054 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!97970 0))(
  ( (array!97971 (arr!47273 (Array (_ BitVec 32) (_ BitVec 64))) (size!47823 (_ BitVec 32))) )
))
(declare-fun lt!633051 () array!97970)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97970 (_ BitVec 32)) SeekEntryResult!11525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440948 (= lt!633053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633054 mask!2687) lt!633054 lt!633051 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!97970)

(assert (=> b!1440948 (= lt!633054 (select (store (arr!47273 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1440949 () Bool)

(declare-fun res!973381 () Bool)

(declare-fun e!812344 () Bool)

(assert (=> b!1440949 (=> (not res!973381) (not e!812344))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440949 (= res!973381 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47823 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47823 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47823 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1440950 () Bool)

(declare-fun res!973373 () Bool)

(assert (=> b!1440950 (=> (not res!973373) (not e!812347))))

(declare-fun lt!633052 () SeekEntryResult!11525)

(assert (=> b!1440950 (= res!973373 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47273 a!2862) j!93) a!2862 mask!2687) lt!633052))))

(declare-fun b!1440951 () Bool)

(declare-fun res!973372 () Bool)

(assert (=> b!1440951 (=> (not res!973372) (not e!812344))))

(assert (=> b!1440951 (= res!973372 (and (= (size!47823 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47823 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47823 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!973374 () Bool)

(assert (=> start!124522 (=> (not res!973374) (not e!812344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124522 (= res!973374 (validMask!0 mask!2687))))

(assert (=> start!124522 e!812344))

(assert (=> start!124522 true))

(declare-fun array_inv!36301 (array!97970) Bool)

(assert (=> start!124522 (array_inv!36301 a!2862)))

(declare-fun b!1440952 () Bool)

(declare-fun res!973375 () Bool)

(assert (=> b!1440952 (=> (not res!973375) (not e!812344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440952 (= res!973375 (validKeyInArray!0 (select (arr!47273 a!2862) i!1006)))))

(declare-fun b!1440953 () Bool)

(declare-fun res!973377 () Bool)

(assert (=> b!1440953 (=> (not res!973377) (not e!812344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97970 (_ BitVec 32)) Bool)

(assert (=> b!1440953 (= res!973377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440954 () Bool)

(declare-fun res!973376 () Bool)

(assert (=> b!1440954 (=> (not res!973376) (not e!812344))))

(declare-datatypes ((List!33774 0))(
  ( (Nil!33771) (Cons!33770 (h!35120 (_ BitVec 64)) (t!48468 List!33774)) )
))
(declare-fun arrayNoDuplicates!0 (array!97970 (_ BitVec 32) List!33774) Bool)

(assert (=> b!1440954 (= res!973376 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33771))))

(declare-fun b!1440955 () Bool)

(assert (=> b!1440955 (= e!812346 false)))

(declare-fun lt!633050 () Bool)

(declare-fun e!812348 () Bool)

(assert (=> b!1440955 (= lt!633050 e!812348)))

(declare-fun c!133299 () Bool)

(assert (=> b!1440955 (= c!133299 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1440956 () Bool)

(declare-fun e!812343 () Bool)

(assert (=> b!1440956 (= e!812344 e!812343)))

(declare-fun res!973371 () Bool)

(assert (=> b!1440956 (=> (not res!973371) (not e!812343))))

(assert (=> b!1440956 (= res!973371 (= (select (store (arr!47273 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440956 (= lt!633051 (array!97971 (store (arr!47273 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47823 a!2862)))))

(declare-fun b!1440957 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97970 (_ BitVec 32)) SeekEntryResult!11525)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97970 (_ BitVec 32)) SeekEntryResult!11525)

(assert (=> b!1440957 (= e!812348 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633054 lt!633051 mask!2687) (seekEntryOrOpen!0 lt!633054 lt!633051 mask!2687))))))

(declare-fun b!1440958 () Bool)

(assert (=> b!1440958 (= e!812343 e!812347)))

(declare-fun res!973378 () Bool)

(assert (=> b!1440958 (=> (not res!973378) (not e!812347))))

(assert (=> b!1440958 (= res!973378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47273 a!2862) j!93) mask!2687) (select (arr!47273 a!2862) j!93) a!2862 mask!2687) lt!633052))))

(assert (=> b!1440958 (= lt!633052 (Intermediate!11525 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440959 () Bool)

(assert (=> b!1440959 (= e!812348 (not (= lt!633053 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633054 lt!633051 mask!2687))))))

(declare-fun b!1440960 () Bool)

(declare-fun res!973380 () Bool)

(assert (=> b!1440960 (=> (not res!973380) (not e!812344))))

(assert (=> b!1440960 (= res!973380 (validKeyInArray!0 (select (arr!47273 a!2862) j!93)))))

(assert (= (and start!124522 res!973374) b!1440951))

(assert (= (and b!1440951 res!973372) b!1440952))

(assert (= (and b!1440952 res!973375) b!1440960))

(assert (= (and b!1440960 res!973380) b!1440953))

(assert (= (and b!1440953 res!973377) b!1440954))

(assert (= (and b!1440954 res!973376) b!1440949))

(assert (= (and b!1440949 res!973381) b!1440956))

(assert (= (and b!1440956 res!973371) b!1440958))

(assert (= (and b!1440958 res!973378) b!1440950))

(assert (= (and b!1440950 res!973373) b!1440948))

(assert (= (and b!1440948 res!973379) b!1440955))

(assert (= (and b!1440955 c!133299) b!1440959))

(assert (= (and b!1440955 (not c!133299)) b!1440957))

(declare-fun m!1330183 () Bool)

(assert (=> b!1440959 m!1330183))

(declare-fun m!1330185 () Bool)

(assert (=> b!1440952 m!1330185))

(assert (=> b!1440952 m!1330185))

(declare-fun m!1330187 () Bool)

(assert (=> b!1440952 m!1330187))

(declare-fun m!1330189 () Bool)

(assert (=> b!1440958 m!1330189))

(assert (=> b!1440958 m!1330189))

(declare-fun m!1330191 () Bool)

(assert (=> b!1440958 m!1330191))

(assert (=> b!1440958 m!1330191))

(assert (=> b!1440958 m!1330189))

(declare-fun m!1330193 () Bool)

(assert (=> b!1440958 m!1330193))

(declare-fun m!1330195 () Bool)

(assert (=> b!1440957 m!1330195))

(declare-fun m!1330197 () Bool)

(assert (=> b!1440957 m!1330197))

(declare-fun m!1330199 () Bool)

(assert (=> start!124522 m!1330199))

(declare-fun m!1330201 () Bool)

(assert (=> start!124522 m!1330201))

(declare-fun m!1330203 () Bool)

(assert (=> b!1440953 m!1330203))

(declare-fun m!1330205 () Bool)

(assert (=> b!1440954 m!1330205))

(assert (=> b!1440960 m!1330189))

(assert (=> b!1440960 m!1330189))

(declare-fun m!1330207 () Bool)

(assert (=> b!1440960 m!1330207))

(declare-fun m!1330209 () Bool)

(assert (=> b!1440956 m!1330209))

(declare-fun m!1330211 () Bool)

(assert (=> b!1440956 m!1330211))

(assert (=> b!1440950 m!1330189))

(assert (=> b!1440950 m!1330189))

(declare-fun m!1330213 () Bool)

(assert (=> b!1440950 m!1330213))

(declare-fun m!1330215 () Bool)

(assert (=> b!1440948 m!1330215))

(assert (=> b!1440948 m!1330215))

(declare-fun m!1330217 () Bool)

(assert (=> b!1440948 m!1330217))

(assert (=> b!1440948 m!1330209))

(declare-fun m!1330219 () Bool)

(assert (=> b!1440948 m!1330219))

(push 1)

