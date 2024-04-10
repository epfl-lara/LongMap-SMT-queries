; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124736 () Bool)

(assert start!124736)

(declare-fun b!1446224 () Bool)

(declare-fun res!978006 () Bool)

(declare-fun e!814568 () Bool)

(assert (=> b!1446224 (=> (not res!978006) (not e!814568))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446224 (= res!978006 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446225 () Bool)

(declare-fun res!978012 () Bool)

(declare-fun e!814569 () Bool)

(assert (=> b!1446225 (=> (not res!978012) (not e!814569))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98184 0))(
  ( (array!98185 (arr!47380 (Array (_ BitVec 32) (_ BitVec 64))) (size!47930 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98184)

(assert (=> b!1446225 (= res!978012 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47930 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47930 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47930 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446226 () Bool)

(assert (=> b!1446226 (= e!814568 (not true))))

(declare-fun e!814566 () Bool)

(assert (=> b!1446226 e!814566))

(declare-fun res!978013 () Bool)

(assert (=> b!1446226 (=> (not res!978013) (not e!814566))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98184 (_ BitVec 32)) Bool)

(assert (=> b!1446226 (= res!978013 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48760 0))(
  ( (Unit!48761) )
))
(declare-fun lt!634729 () Unit!48760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48760)

(assert (=> b!1446226 (= lt!634729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446227 () Bool)

(declare-fun e!814571 () Bool)

(assert (=> b!1446227 (= e!814569 e!814571)))

(declare-fun res!978011 () Bool)

(assert (=> b!1446227 (=> (not res!978011) (not e!814571))))

(assert (=> b!1446227 (= res!978011 (= (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634727 () array!98184)

(assert (=> b!1446227 (= lt!634727 (array!98185 (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47930 a!2862)))))

(declare-fun b!1446228 () Bool)

(declare-fun res!978014 () Bool)

(assert (=> b!1446228 (=> (not res!978014) (not e!814569))))

(declare-datatypes ((List!33881 0))(
  ( (Nil!33878) (Cons!33877 (h!35227 (_ BitVec 64)) (t!48575 List!33881)) )
))
(declare-fun arrayNoDuplicates!0 (array!98184 (_ BitVec 32) List!33881) Bool)

(assert (=> b!1446228 (= res!978014 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33878))))

(declare-fun b!1446229 () Bool)

(declare-fun res!978019 () Bool)

(assert (=> b!1446229 (=> (not res!978019) (not e!814568))))

(declare-fun e!814570 () Bool)

(assert (=> b!1446229 (= res!978019 e!814570)))

(declare-fun c!133620 () Bool)

(assert (=> b!1446229 (= c!133620 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!978007 () Bool)

(assert (=> start!124736 (=> (not res!978007) (not e!814569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124736 (= res!978007 (validMask!0 mask!2687))))

(assert (=> start!124736 e!814569))

(assert (=> start!124736 true))

(declare-fun array_inv!36408 (array!98184) Bool)

(assert (=> start!124736 (array_inv!36408 a!2862)))

(declare-fun b!1446230 () Bool)

(declare-fun res!978015 () Bool)

(declare-fun e!814565 () Bool)

(assert (=> b!1446230 (=> (not res!978015) (not e!814565))))

(declare-datatypes ((SeekEntryResult!11632 0))(
  ( (MissingZero!11632 (index!48920 (_ BitVec 32))) (Found!11632 (index!48921 (_ BitVec 32))) (Intermediate!11632 (undefined!12444 Bool) (index!48922 (_ BitVec 32)) (x!130601 (_ BitVec 32))) (Undefined!11632) (MissingVacant!11632 (index!48923 (_ BitVec 32))) )
))
(declare-fun lt!634728 () SeekEntryResult!11632)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98184 (_ BitVec 32)) SeekEntryResult!11632)

(assert (=> b!1446230 (= res!978015 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47380 a!2862) j!93) a!2862 mask!2687) lt!634728))))

(declare-fun lt!634731 () SeekEntryResult!11632)

(declare-fun lt!634730 () (_ BitVec 64))

(declare-fun b!1446231 () Bool)

(assert (=> b!1446231 (= e!814570 (= lt!634731 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634730 lt!634727 mask!2687)))))

(declare-fun b!1446232 () Bool)

(declare-fun res!978009 () Bool)

(assert (=> b!1446232 (=> (not res!978009) (not e!814569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446232 (= res!978009 (validKeyInArray!0 (select (arr!47380 a!2862) j!93)))))

(declare-fun b!1446233 () Bool)

(declare-fun res!978017 () Bool)

(assert (=> b!1446233 (=> (not res!978017) (not e!814569))))

(assert (=> b!1446233 (= res!978017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446234 () Bool)

(declare-fun res!978008 () Bool)

(assert (=> b!1446234 (=> (not res!978008) (not e!814569))))

(assert (=> b!1446234 (= res!978008 (validKeyInArray!0 (select (arr!47380 a!2862) i!1006)))))

(declare-fun b!1446235 () Bool)

(assert (=> b!1446235 (= e!814571 e!814565)))

(declare-fun res!978005 () Bool)

(assert (=> b!1446235 (=> (not res!978005) (not e!814565))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446235 (= res!978005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47380 a!2862) j!93) mask!2687) (select (arr!47380 a!2862) j!93) a!2862 mask!2687) lt!634728))))

(assert (=> b!1446235 (= lt!634728 (Intermediate!11632 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446236 () Bool)

(declare-fun res!978018 () Bool)

(assert (=> b!1446236 (=> (not res!978018) (not e!814566))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98184 (_ BitVec 32)) SeekEntryResult!11632)

(assert (=> b!1446236 (= res!978018 (= (seekEntryOrOpen!0 (select (arr!47380 a!2862) j!93) a!2862 mask!2687) (Found!11632 j!93)))))

(declare-fun b!1446237 () Bool)

(assert (=> b!1446237 (= e!814566 (or (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) (select (arr!47380 a!2862) j!93))))))

(declare-fun b!1446238 () Bool)

(assert (=> b!1446238 (= e!814565 e!814568)))

(declare-fun res!978010 () Bool)

(assert (=> b!1446238 (=> (not res!978010) (not e!814568))))

(assert (=> b!1446238 (= res!978010 (= lt!634731 (Intermediate!11632 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446238 (= lt!634731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634730 mask!2687) lt!634730 lt!634727 mask!2687))))

(assert (=> b!1446238 (= lt!634730 (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446239 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98184 (_ BitVec 32)) SeekEntryResult!11632)

(assert (=> b!1446239 (= e!814570 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634730 lt!634727 mask!2687) (seekEntryOrOpen!0 lt!634730 lt!634727 mask!2687)))))

(declare-fun b!1446240 () Bool)

(declare-fun res!978016 () Bool)

(assert (=> b!1446240 (=> (not res!978016) (not e!814569))))

(assert (=> b!1446240 (= res!978016 (and (= (size!47930 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47930 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47930 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124736 res!978007) b!1446240))

(assert (= (and b!1446240 res!978016) b!1446234))

(assert (= (and b!1446234 res!978008) b!1446232))

(assert (= (and b!1446232 res!978009) b!1446233))

(assert (= (and b!1446233 res!978017) b!1446228))

(assert (= (and b!1446228 res!978014) b!1446225))

(assert (= (and b!1446225 res!978012) b!1446227))

(assert (= (and b!1446227 res!978011) b!1446235))

(assert (= (and b!1446235 res!978005) b!1446230))

(assert (= (and b!1446230 res!978015) b!1446238))

(assert (= (and b!1446238 res!978010) b!1446229))

(assert (= (and b!1446229 c!133620) b!1446231))

(assert (= (and b!1446229 (not c!133620)) b!1446239))

(assert (= (and b!1446229 res!978019) b!1446224))

(assert (= (and b!1446224 res!978006) b!1446226))

(assert (= (and b!1446226 res!978013) b!1446236))

(assert (= (and b!1446236 res!978018) b!1446237))

(declare-fun m!1335117 () Bool)

(assert (=> b!1446235 m!1335117))

(assert (=> b!1446235 m!1335117))

(declare-fun m!1335119 () Bool)

(assert (=> b!1446235 m!1335119))

(assert (=> b!1446235 m!1335119))

(assert (=> b!1446235 m!1335117))

(declare-fun m!1335121 () Bool)

(assert (=> b!1446235 m!1335121))

(declare-fun m!1335123 () Bool)

(assert (=> b!1446231 m!1335123))

(declare-fun m!1335125 () Bool)

(assert (=> b!1446238 m!1335125))

(assert (=> b!1446238 m!1335125))

(declare-fun m!1335127 () Bool)

(assert (=> b!1446238 m!1335127))

(declare-fun m!1335129 () Bool)

(assert (=> b!1446238 m!1335129))

(declare-fun m!1335131 () Bool)

(assert (=> b!1446238 m!1335131))

(declare-fun m!1335133 () Bool)

(assert (=> b!1446234 m!1335133))

(assert (=> b!1446234 m!1335133))

(declare-fun m!1335135 () Bool)

(assert (=> b!1446234 m!1335135))

(declare-fun m!1335137 () Bool)

(assert (=> b!1446237 m!1335137))

(assert (=> b!1446237 m!1335117))

(declare-fun m!1335139 () Bool)

(assert (=> b!1446233 m!1335139))

(declare-fun m!1335141 () Bool)

(assert (=> b!1446226 m!1335141))

(declare-fun m!1335143 () Bool)

(assert (=> b!1446226 m!1335143))

(assert (=> b!1446227 m!1335129))

(declare-fun m!1335145 () Bool)

(assert (=> b!1446227 m!1335145))

(assert (=> b!1446236 m!1335117))

(assert (=> b!1446236 m!1335117))

(declare-fun m!1335147 () Bool)

(assert (=> b!1446236 m!1335147))

(assert (=> b!1446230 m!1335117))

(assert (=> b!1446230 m!1335117))

(declare-fun m!1335149 () Bool)

(assert (=> b!1446230 m!1335149))

(declare-fun m!1335151 () Bool)

(assert (=> start!124736 m!1335151))

(declare-fun m!1335153 () Bool)

(assert (=> start!124736 m!1335153))

(declare-fun m!1335155 () Bool)

(assert (=> b!1446239 m!1335155))

(declare-fun m!1335157 () Bool)

(assert (=> b!1446239 m!1335157))

(assert (=> b!1446232 m!1335117))

(assert (=> b!1446232 m!1335117))

(declare-fun m!1335159 () Bool)

(assert (=> b!1446232 m!1335159))

(declare-fun m!1335161 () Bool)

(assert (=> b!1446228 m!1335161))

(push 1)

