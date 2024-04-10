; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124616 () Bool)

(assert start!124616)

(declare-fun b!1443101 () Bool)

(declare-fun res!975245 () Bool)

(declare-fun e!813257 () Bool)

(assert (=> b!1443101 (=> (not res!975245) (not e!813257))))

(declare-datatypes ((array!98064 0))(
  ( (array!98065 (arr!47320 (Array (_ BitVec 32) (_ BitVec 64))) (size!47870 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98064)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443101 (= res!975245 (validKeyInArray!0 (select (arr!47320 a!2862) i!1006)))))

(declare-fun b!1443102 () Bool)

(declare-fun res!975244 () Bool)

(assert (=> b!1443102 (=> (not res!975244) (not e!813257))))

(declare-datatypes ((List!33821 0))(
  ( (Nil!33818) (Cons!33817 (h!35167 (_ BitVec 64)) (t!48515 List!33821)) )
))
(declare-fun arrayNoDuplicates!0 (array!98064 (_ BitVec 32) List!33821) Bool)

(assert (=> b!1443102 (= res!975244 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33818))))

(declare-fun b!1443103 () Bool)

(declare-fun res!975255 () Bool)

(declare-fun e!813255 () Bool)

(assert (=> b!1443103 (=> (not res!975255) (not e!813255))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443103 (= res!975255 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!975248 () Bool)

(assert (=> start!124616 (=> (not res!975248) (not e!813257))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124616 (= res!975248 (validMask!0 mask!2687))))

(assert (=> start!124616 e!813257))

(assert (=> start!124616 true))

(declare-fun array_inv!36348 (array!98064) Bool)

(assert (=> start!124616 (array_inv!36348 a!2862)))

(declare-datatypes ((SeekEntryResult!11572 0))(
  ( (MissingZero!11572 (index!48680 (_ BitVec 32))) (Found!11572 (index!48681 (_ BitVec 32))) (Intermediate!11572 (undefined!12384 Bool) (index!48682 (_ BitVec 32)) (x!130381 (_ BitVec 32))) (Undefined!11572) (MissingVacant!11572 (index!48683 (_ BitVec 32))) )
))
(declare-fun lt!633758 () SeekEntryResult!11572)

(declare-fun lt!633755 () array!98064)

(declare-fun e!813252 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!633756 () (_ BitVec 64))

(declare-fun b!1443104 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98064 (_ BitVec 32)) SeekEntryResult!11572)

(assert (=> b!1443104 (= e!813252 (= lt!633758 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633756 lt!633755 mask!2687)))))

(declare-fun b!1443105 () Bool)

(declare-fun e!813256 () Bool)

(assert (=> b!1443105 (= e!813256 e!813255)))

(declare-fun res!975243 () Bool)

(assert (=> b!1443105 (=> (not res!975243) (not e!813255))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443105 (= res!975243 (= lt!633758 (Intermediate!11572 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443105 (= lt!633758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633756 mask!2687) lt!633756 lt!633755 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443105 (= lt!633756 (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443106 () Bool)

(declare-fun e!813251 () Bool)

(assert (=> b!1443106 (= e!813251 e!813256)))

(declare-fun res!975252 () Bool)

(assert (=> b!1443106 (=> (not res!975252) (not e!813256))))

(declare-fun lt!633759 () SeekEntryResult!11572)

(assert (=> b!1443106 (= res!975252 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47320 a!2862) j!93) mask!2687) (select (arr!47320 a!2862) j!93) a!2862 mask!2687) lt!633759))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1443106 (= lt!633759 (Intermediate!11572 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443107 () Bool)

(declare-fun res!975256 () Bool)

(assert (=> b!1443107 (=> (not res!975256) (not e!813257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98064 (_ BitVec 32)) Bool)

(assert (=> b!1443107 (= res!975256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443108 () Bool)

(declare-fun res!975250 () Bool)

(assert (=> b!1443108 (=> (not res!975250) (not e!813256))))

(assert (=> b!1443108 (= res!975250 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47320 a!2862) j!93) a!2862 mask!2687) lt!633759))))

(declare-fun b!1443109 () Bool)

(declare-fun res!975251 () Bool)

(assert (=> b!1443109 (=> (not res!975251) (not e!813257))))

(assert (=> b!1443109 (= res!975251 (validKeyInArray!0 (select (arr!47320 a!2862) j!93)))))

(declare-fun b!1443110 () Bool)

(declare-fun res!975246 () Bool)

(assert (=> b!1443110 (=> (not res!975246) (not e!813257))))

(assert (=> b!1443110 (= res!975246 (and (= (size!47870 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47870 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47870 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443111 () Bool)

(declare-fun res!975247 () Bool)

(assert (=> b!1443111 (=> (not res!975247) (not e!813255))))

(assert (=> b!1443111 (= res!975247 e!813252)))

(declare-fun c!133440 () Bool)

(assert (=> b!1443111 (= c!133440 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443112 () Bool)

(assert (=> b!1443112 (= e!813255 (not true))))

(declare-fun e!813253 () Bool)

(assert (=> b!1443112 e!813253))

(declare-fun res!975253 () Bool)

(assert (=> b!1443112 (=> (not res!975253) (not e!813253))))

(assert (=> b!1443112 (= res!975253 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48640 0))(
  ( (Unit!48641) )
))
(declare-fun lt!633757 () Unit!48640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48640)

(assert (=> b!1443112 (= lt!633757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443113 () Bool)

(assert (=> b!1443113 (= e!813257 e!813251)))

(declare-fun res!975249 () Bool)

(assert (=> b!1443113 (=> (not res!975249) (not e!813251))))

(assert (=> b!1443113 (= res!975249 (= (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443113 (= lt!633755 (array!98065 (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47870 a!2862)))))

(declare-fun b!1443114 () Bool)

(declare-fun res!975242 () Bool)

(assert (=> b!1443114 (=> (not res!975242) (not e!813257))))

(assert (=> b!1443114 (= res!975242 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47870 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47870 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47870 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98064 (_ BitVec 32)) SeekEntryResult!11572)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98064 (_ BitVec 32)) SeekEntryResult!11572)

(assert (=> b!1443115 (= e!813252 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633756 lt!633755 mask!2687) (seekEntryOrOpen!0 lt!633756 lt!633755 mask!2687)))))

(declare-fun b!1443116 () Bool)

(declare-fun res!975254 () Bool)

(assert (=> b!1443116 (=> (not res!975254) (not e!813253))))

(assert (=> b!1443116 (= res!975254 (= (seekEntryOrOpen!0 (select (arr!47320 a!2862) j!93) a!2862 mask!2687) (Found!11572 j!93)))))

(declare-fun b!1443117 () Bool)

(assert (=> b!1443117 (= e!813253 (or (= (select (arr!47320 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47320 a!2862) intermediateBeforeIndex!19) (select (arr!47320 a!2862) j!93))))))

(assert (= (and start!124616 res!975248) b!1443110))

(assert (= (and b!1443110 res!975246) b!1443101))

(assert (= (and b!1443101 res!975245) b!1443109))

(assert (= (and b!1443109 res!975251) b!1443107))

(assert (= (and b!1443107 res!975256) b!1443102))

(assert (= (and b!1443102 res!975244) b!1443114))

(assert (= (and b!1443114 res!975242) b!1443113))

(assert (= (and b!1443113 res!975249) b!1443106))

(assert (= (and b!1443106 res!975252) b!1443108))

(assert (= (and b!1443108 res!975250) b!1443105))

(assert (= (and b!1443105 res!975243) b!1443111))

(assert (= (and b!1443111 c!133440) b!1443104))

(assert (= (and b!1443111 (not c!133440)) b!1443115))

(assert (= (and b!1443111 res!975247) b!1443103))

(assert (= (and b!1443103 res!975255) b!1443112))

(assert (= (and b!1443112 res!975253) b!1443116))

(assert (= (and b!1443116 res!975254) b!1443117))

(declare-fun m!1332201 () Bool)

(assert (=> b!1443115 m!1332201))

(declare-fun m!1332203 () Bool)

(assert (=> b!1443115 m!1332203))

(declare-fun m!1332205 () Bool)

(assert (=> b!1443105 m!1332205))

(assert (=> b!1443105 m!1332205))

(declare-fun m!1332207 () Bool)

(assert (=> b!1443105 m!1332207))

(declare-fun m!1332209 () Bool)

(assert (=> b!1443105 m!1332209))

(declare-fun m!1332211 () Bool)

(assert (=> b!1443105 m!1332211))

(declare-fun m!1332213 () Bool)

(assert (=> b!1443117 m!1332213))

(declare-fun m!1332215 () Bool)

(assert (=> b!1443117 m!1332215))

(declare-fun m!1332217 () Bool)

(assert (=> b!1443102 m!1332217))

(declare-fun m!1332219 () Bool)

(assert (=> start!124616 m!1332219))

(declare-fun m!1332221 () Bool)

(assert (=> start!124616 m!1332221))

(declare-fun m!1332223 () Bool)

(assert (=> b!1443107 m!1332223))

(assert (=> b!1443116 m!1332215))

(assert (=> b!1443116 m!1332215))

(declare-fun m!1332225 () Bool)

(assert (=> b!1443116 m!1332225))

(assert (=> b!1443108 m!1332215))

(assert (=> b!1443108 m!1332215))

(declare-fun m!1332227 () Bool)

(assert (=> b!1443108 m!1332227))

(declare-fun m!1332229 () Bool)

(assert (=> b!1443101 m!1332229))

(assert (=> b!1443101 m!1332229))

(declare-fun m!1332231 () Bool)

(assert (=> b!1443101 m!1332231))

(assert (=> b!1443113 m!1332209))

(declare-fun m!1332233 () Bool)

(assert (=> b!1443113 m!1332233))

(assert (=> b!1443109 m!1332215))

(assert (=> b!1443109 m!1332215))

(declare-fun m!1332235 () Bool)

(assert (=> b!1443109 m!1332235))

(declare-fun m!1332237 () Bool)

(assert (=> b!1443112 m!1332237))

(declare-fun m!1332239 () Bool)

(assert (=> b!1443112 m!1332239))

(declare-fun m!1332241 () Bool)

(assert (=> b!1443104 m!1332241))

(assert (=> b!1443106 m!1332215))

(assert (=> b!1443106 m!1332215))

(declare-fun m!1332243 () Bool)

(assert (=> b!1443106 m!1332243))

(assert (=> b!1443106 m!1332243))

(assert (=> b!1443106 m!1332215))

(declare-fun m!1332245 () Bool)

(assert (=> b!1443106 m!1332245))

(push 1)

