; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124738 () Bool)

(assert start!124738)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98186 0))(
  ( (array!98187 (arr!47381 (Array (_ BitVec 32) (_ BitVec 64))) (size!47931 (_ BitVec 32))) )
))
(declare-fun lt!634742 () array!98186)

(declare-datatypes ((SeekEntryResult!11633 0))(
  ( (MissingZero!11633 (index!48924 (_ BitVec 32))) (Found!11633 (index!48925 (_ BitVec 32))) (Intermediate!11633 (undefined!12445 Bool) (index!48926 (_ BitVec 32)) (x!130610 (_ BitVec 32))) (Undefined!11633) (MissingVacant!11633 (index!48927 (_ BitVec 32))) )
))
(declare-fun lt!634746 () SeekEntryResult!11633)

(declare-fun e!814586 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634745 () (_ BitVec 64))

(declare-fun b!1446276 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98186 (_ BitVec 32)) SeekEntryResult!11633)

(assert (=> b!1446276 (= e!814586 (= lt!634746 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634745 lt!634742 mask!2687)))))

(declare-fun b!1446277 () Bool)

(declare-fun res!978059 () Bool)

(declare-fun e!814592 () Bool)

(assert (=> b!1446277 (=> (not res!978059) (not e!814592))))

(assert (=> b!1446277 (= res!978059 e!814586)))

(declare-fun c!133623 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446277 (= c!133623 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446278 () Bool)

(declare-fun res!978062 () Bool)

(declare-fun e!814588 () Bool)

(assert (=> b!1446278 (=> (not res!978062) (not e!814588))))

(declare-fun a!2862 () array!98186)

(declare-datatypes ((List!33882 0))(
  ( (Nil!33879) (Cons!33878 (h!35228 (_ BitVec 64)) (t!48576 List!33882)) )
))
(declare-fun arrayNoDuplicates!0 (array!98186 (_ BitVec 32) List!33882) Bool)

(assert (=> b!1446278 (= res!978062 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33879))))

(declare-fun b!1446279 () Bool)

(declare-fun res!978057 () Bool)

(assert (=> b!1446279 (=> (not res!978057) (not e!814588))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446279 (= res!978057 (validKeyInArray!0 (select (arr!47381 a!2862) j!93)))))

(declare-fun b!1446280 () Bool)

(declare-fun res!978058 () Bool)

(assert (=> b!1446280 (=> (not res!978058) (not e!814592))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446280 (= res!978058 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446281 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98186 (_ BitVec 32)) SeekEntryResult!11633)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98186 (_ BitVec 32)) SeekEntryResult!11633)

(assert (=> b!1446281 (= e!814586 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634745 lt!634742 mask!2687) (seekEntryOrOpen!0 lt!634745 lt!634742 mask!2687)))))

(declare-fun b!1446282 () Bool)

(declare-fun res!978055 () Bool)

(assert (=> b!1446282 (=> (not res!978055) (not e!814588))))

(assert (=> b!1446282 (= res!978055 (validKeyInArray!0 (select (arr!47381 a!2862) i!1006)))))

(declare-fun b!1446283 () Bool)

(declare-fun res!978052 () Bool)

(assert (=> b!1446283 (=> (not res!978052) (not e!814588))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446283 (= res!978052 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47931 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47931 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47931 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446275 () Bool)

(declare-fun res!978056 () Bool)

(declare-fun e!814591 () Bool)

(assert (=> b!1446275 (=> (not res!978056) (not e!814591))))

(declare-fun lt!634743 () SeekEntryResult!11633)

(assert (=> b!1446275 (= res!978056 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47381 a!2862) j!93) a!2862 mask!2687) lt!634743))))

(declare-fun res!978063 () Bool)

(assert (=> start!124738 (=> (not res!978063) (not e!814588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124738 (= res!978063 (validMask!0 mask!2687))))

(assert (=> start!124738 e!814588))

(assert (=> start!124738 true))

(declare-fun array_inv!36409 (array!98186) Bool)

(assert (=> start!124738 (array_inv!36409 a!2862)))

(declare-fun b!1446284 () Bool)

(declare-fun res!978061 () Bool)

(assert (=> b!1446284 (=> (not res!978061) (not e!814588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98186 (_ BitVec 32)) Bool)

(assert (=> b!1446284 (= res!978061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446285 () Bool)

(assert (=> b!1446285 (= e!814591 e!814592)))

(declare-fun res!978054 () Bool)

(assert (=> b!1446285 (=> (not res!978054) (not e!814592))))

(assert (=> b!1446285 (= res!978054 (= lt!634746 (Intermediate!11633 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446285 (= lt!634746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634745 mask!2687) lt!634745 lt!634742 mask!2687))))

(assert (=> b!1446285 (= lt!634745 (select (store (arr!47381 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446286 () Bool)

(declare-fun e!814589 () Bool)

(assert (=> b!1446286 (= e!814589 e!814591)))

(declare-fun res!978060 () Bool)

(assert (=> b!1446286 (=> (not res!978060) (not e!814591))))

(assert (=> b!1446286 (= res!978060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47381 a!2862) j!93) mask!2687) (select (arr!47381 a!2862) j!93) a!2862 mask!2687) lt!634743))))

(assert (=> b!1446286 (= lt!634743 (Intermediate!11633 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446287 () Bool)

(declare-fun res!978050 () Bool)

(assert (=> b!1446287 (=> (not res!978050) (not e!814588))))

(assert (=> b!1446287 (= res!978050 (and (= (size!47931 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47931 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47931 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446288 () Bool)

(declare-fun res!978051 () Bool)

(declare-fun e!814590 () Bool)

(assert (=> b!1446288 (=> (not res!978051) (not e!814590))))

(assert (=> b!1446288 (= res!978051 (= (seekEntryOrOpen!0 (select (arr!47381 a!2862) j!93) a!2862 mask!2687) (Found!11633 j!93)))))

(declare-fun b!1446289 () Bool)

(assert (=> b!1446289 (= e!814592 (not true))))

(assert (=> b!1446289 e!814590))

(declare-fun res!978064 () Bool)

(assert (=> b!1446289 (=> (not res!978064) (not e!814590))))

(assert (=> b!1446289 (= res!978064 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48762 0))(
  ( (Unit!48763) )
))
(declare-fun lt!634744 () Unit!48762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48762)

(assert (=> b!1446289 (= lt!634744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446290 () Bool)

(assert (=> b!1446290 (= e!814590 (or (= (select (arr!47381 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47381 a!2862) intermediateBeforeIndex!19) (select (arr!47381 a!2862) j!93))))))

(declare-fun b!1446291 () Bool)

(assert (=> b!1446291 (= e!814588 e!814589)))

(declare-fun res!978053 () Bool)

(assert (=> b!1446291 (=> (not res!978053) (not e!814589))))

(assert (=> b!1446291 (= res!978053 (= (select (store (arr!47381 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446291 (= lt!634742 (array!98187 (store (arr!47381 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47931 a!2862)))))

(assert (= (and start!124738 res!978063) b!1446287))

(assert (= (and b!1446287 res!978050) b!1446282))

(assert (= (and b!1446282 res!978055) b!1446279))

(assert (= (and b!1446279 res!978057) b!1446284))

(assert (= (and b!1446284 res!978061) b!1446278))

(assert (= (and b!1446278 res!978062) b!1446283))

(assert (= (and b!1446283 res!978052) b!1446291))

(assert (= (and b!1446291 res!978053) b!1446286))

(assert (= (and b!1446286 res!978060) b!1446275))

(assert (= (and b!1446275 res!978056) b!1446285))

(assert (= (and b!1446285 res!978054) b!1446277))

(assert (= (and b!1446277 c!133623) b!1446276))

(assert (= (and b!1446277 (not c!133623)) b!1446281))

(assert (= (and b!1446277 res!978059) b!1446280))

(assert (= (and b!1446280 res!978058) b!1446289))

(assert (= (and b!1446289 res!978064) b!1446288))

(assert (= (and b!1446288 res!978051) b!1446290))

(declare-fun m!1335163 () Bool)

(assert (=> b!1446284 m!1335163))

(declare-fun m!1335165 () Bool)

(assert (=> b!1446286 m!1335165))

(assert (=> b!1446286 m!1335165))

(declare-fun m!1335167 () Bool)

(assert (=> b!1446286 m!1335167))

(assert (=> b!1446286 m!1335167))

(assert (=> b!1446286 m!1335165))

(declare-fun m!1335169 () Bool)

(assert (=> b!1446286 m!1335169))

(assert (=> b!1446275 m!1335165))

(assert (=> b!1446275 m!1335165))

(declare-fun m!1335171 () Bool)

(assert (=> b!1446275 m!1335171))

(declare-fun m!1335173 () Bool)

(assert (=> b!1446289 m!1335173))

(declare-fun m!1335175 () Bool)

(assert (=> b!1446289 m!1335175))

(assert (=> b!1446279 m!1335165))

(assert (=> b!1446279 m!1335165))

(declare-fun m!1335177 () Bool)

(assert (=> b!1446279 m!1335177))

(declare-fun m!1335179 () Bool)

(assert (=> start!124738 m!1335179))

(declare-fun m!1335181 () Bool)

(assert (=> start!124738 m!1335181))

(declare-fun m!1335183 () Bool)

(assert (=> b!1446278 m!1335183))

(declare-fun m!1335185 () Bool)

(assert (=> b!1446291 m!1335185))

(declare-fun m!1335187 () Bool)

(assert (=> b!1446291 m!1335187))

(declare-fun m!1335189 () Bool)

(assert (=> b!1446290 m!1335189))

(assert (=> b!1446290 m!1335165))

(declare-fun m!1335191 () Bool)

(assert (=> b!1446276 m!1335191))

(declare-fun m!1335193 () Bool)

(assert (=> b!1446285 m!1335193))

(assert (=> b!1446285 m!1335193))

(declare-fun m!1335195 () Bool)

(assert (=> b!1446285 m!1335195))

(assert (=> b!1446285 m!1335185))

(declare-fun m!1335197 () Bool)

(assert (=> b!1446285 m!1335197))

(declare-fun m!1335199 () Bool)

(assert (=> b!1446282 m!1335199))

(assert (=> b!1446282 m!1335199))

(declare-fun m!1335201 () Bool)

(assert (=> b!1446282 m!1335201))

(declare-fun m!1335203 () Bool)

(assert (=> b!1446281 m!1335203))

(declare-fun m!1335205 () Bool)

(assert (=> b!1446281 m!1335205))

(assert (=> b!1446288 m!1335165))

(assert (=> b!1446288 m!1335165))

(declare-fun m!1335207 () Bool)

(assert (=> b!1446288 m!1335207))

(push 1)

