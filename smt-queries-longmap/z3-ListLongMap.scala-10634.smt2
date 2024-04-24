; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125160 () Bool)

(assert start!125160)

(declare-fun b!1453380 () Bool)

(declare-fun res!983730 () Bool)

(declare-fun e!818317 () Bool)

(assert (=> b!1453380 (=> (not res!983730) (not e!818317))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98503 0))(
  ( (array!98504 (arr!47536 (Array (_ BitVec 32) (_ BitVec 64))) (size!48087 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98503)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453380 (= res!983730 (and (= (size!48087 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48087 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48087 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453381 () Bool)

(declare-fun res!983723 () Bool)

(declare-fun e!818315 () Bool)

(assert (=> b!1453381 (=> (not res!983723) (not e!818315))))

(declare-datatypes ((SeekEntryResult!11685 0))(
  ( (MissingZero!11685 (index!49132 (_ BitVec 32))) (Found!11685 (index!49133 (_ BitVec 32))) (Intermediate!11685 (undefined!12497 Bool) (index!49134 (_ BitVec 32)) (x!130958 (_ BitVec 32))) (Undefined!11685) (MissingVacant!11685 (index!49135 (_ BitVec 32))) )
))
(declare-fun lt!637312 () SeekEntryResult!11685)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98503 (_ BitVec 32)) SeekEntryResult!11685)

(assert (=> b!1453381 (= res!983723 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!637312))))

(declare-fun b!1453382 () Bool)

(declare-fun e!818316 () Bool)

(assert (=> b!1453382 (= e!818316 e!818315)))

(declare-fun res!983732 () Bool)

(assert (=> b!1453382 (=> (not res!983732) (not e!818315))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453382 (= res!983732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47536 a!2862) j!93) mask!2687) (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!637312))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453382 (= lt!637312 (Intermediate!11685 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453383 () Bool)

(declare-fun res!983722 () Bool)

(assert (=> b!1453383 (=> (not res!983722) (not e!818317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453383 (= res!983722 (validKeyInArray!0 (select (arr!47536 a!2862) j!93)))))

(declare-fun e!818319 () Bool)

(declare-fun b!1453384 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453384 (= e!818319 (and (or (= (select (arr!47536 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47536 a!2862) intermediateBeforeIndex!19) (select (arr!47536 a!2862) j!93))) (or (and (= (select (arr!47536 a!2862) index!646) (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47536 a!2862) index!646) (select (arr!47536 a!2862) j!93))) (= (select (arr!47536 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1453385 () Bool)

(assert (=> b!1453385 (= e!818317 e!818316)))

(declare-fun res!983725 () Bool)

(assert (=> b!1453385 (=> (not res!983725) (not e!818316))))

(assert (=> b!1453385 (= res!983725 (= (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637311 () array!98503)

(assert (=> b!1453385 (= lt!637311 (array!98504 (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48087 a!2862)))))

(declare-fun res!983731 () Bool)

(assert (=> start!125160 (=> (not res!983731) (not e!818317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125160 (= res!983731 (validMask!0 mask!2687))))

(assert (=> start!125160 e!818317))

(assert (=> start!125160 true))

(declare-fun array_inv!36817 (array!98503) Bool)

(assert (=> start!125160 (array_inv!36817 a!2862)))

(declare-fun lt!637309 () (_ BitVec 64))

(declare-fun b!1453386 () Bool)

(declare-fun e!818314 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98503 (_ BitVec 32)) SeekEntryResult!11685)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98503 (_ BitVec 32)) SeekEntryResult!11685)

(assert (=> b!1453386 (= e!818314 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637309 lt!637311 mask!2687) (seekEntryOrOpen!0 lt!637309 lt!637311 mask!2687)))))

(declare-fun b!1453387 () Bool)

(declare-fun res!983721 () Bool)

(declare-fun e!818318 () Bool)

(assert (=> b!1453387 (=> (not res!983721) (not e!818318))))

(assert (=> b!1453387 (= res!983721 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453388 () Bool)

(declare-fun res!983728 () Bool)

(assert (=> b!1453388 (=> (not res!983728) (not e!818319))))

(assert (=> b!1453388 (= res!983728 (= (seekEntryOrOpen!0 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) (Found!11685 j!93)))))

(declare-fun b!1453389 () Bool)

(declare-fun res!983724 () Bool)

(assert (=> b!1453389 (=> (not res!983724) (not e!818317))))

(assert (=> b!1453389 (= res!983724 (validKeyInArray!0 (select (arr!47536 a!2862) i!1006)))))

(declare-fun lt!637308 () SeekEntryResult!11685)

(declare-fun b!1453390 () Bool)

(assert (=> b!1453390 (= e!818314 (= lt!637308 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637309 lt!637311 mask!2687)))))

(declare-fun b!1453391 () Bool)

(assert (=> b!1453391 (= e!818315 e!818318)))

(declare-fun res!983720 () Bool)

(assert (=> b!1453391 (=> (not res!983720) (not e!818318))))

(assert (=> b!1453391 (= res!983720 (= lt!637308 (Intermediate!11685 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453391 (= lt!637308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637309 mask!2687) lt!637309 lt!637311 mask!2687))))

(assert (=> b!1453391 (= lt!637309 (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453392 () Bool)

(declare-fun res!983719 () Bool)

(assert (=> b!1453392 (=> (not res!983719) (not e!818317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98503 (_ BitVec 32)) Bool)

(assert (=> b!1453392 (= res!983719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453393 () Bool)

(declare-fun res!983729 () Bool)

(assert (=> b!1453393 (=> (not res!983729) (not e!818317))))

(declare-datatypes ((List!34024 0))(
  ( (Nil!34021) (Cons!34020 (h!35381 (_ BitVec 64)) (t!48710 List!34024)) )
))
(declare-fun arrayNoDuplicates!0 (array!98503 (_ BitVec 32) List!34024) Bool)

(assert (=> b!1453393 (= res!983729 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34021))))

(declare-fun b!1453394 () Bool)

(assert (=> b!1453394 (= e!818318 (not true))))

(assert (=> b!1453394 e!818319))

(declare-fun res!983718 () Bool)

(assert (=> b!1453394 (=> (not res!983718) (not e!818319))))

(assert (=> b!1453394 (= res!983718 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48899 0))(
  ( (Unit!48900) )
))
(declare-fun lt!637310 () Unit!48899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48899)

(assert (=> b!1453394 (= lt!637310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453395 () Bool)

(declare-fun res!983726 () Bool)

(assert (=> b!1453395 (=> (not res!983726) (not e!818317))))

(assert (=> b!1453395 (= res!983726 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48087 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48087 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48087 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453396 () Bool)

(declare-fun res!983727 () Bool)

(assert (=> b!1453396 (=> (not res!983727) (not e!818318))))

(assert (=> b!1453396 (= res!983727 e!818314)))

(declare-fun c!134350 () Bool)

(assert (=> b!1453396 (= c!134350 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125160 res!983731) b!1453380))

(assert (= (and b!1453380 res!983730) b!1453389))

(assert (= (and b!1453389 res!983724) b!1453383))

(assert (= (and b!1453383 res!983722) b!1453392))

(assert (= (and b!1453392 res!983719) b!1453393))

(assert (= (and b!1453393 res!983729) b!1453395))

(assert (= (and b!1453395 res!983726) b!1453385))

(assert (= (and b!1453385 res!983725) b!1453382))

(assert (= (and b!1453382 res!983732) b!1453381))

(assert (= (and b!1453381 res!983723) b!1453391))

(assert (= (and b!1453391 res!983720) b!1453396))

(assert (= (and b!1453396 c!134350) b!1453390))

(assert (= (and b!1453396 (not c!134350)) b!1453386))

(assert (= (and b!1453396 res!983727) b!1453387))

(assert (= (and b!1453387 res!983721) b!1453394))

(assert (= (and b!1453394 res!983718) b!1453388))

(assert (= (and b!1453388 res!983728) b!1453384))

(declare-fun m!1342075 () Bool)

(assert (=> b!1453392 m!1342075))

(declare-fun m!1342077 () Bool)

(assert (=> b!1453384 m!1342077))

(declare-fun m!1342079 () Bool)

(assert (=> b!1453384 m!1342079))

(declare-fun m!1342081 () Bool)

(assert (=> b!1453384 m!1342081))

(declare-fun m!1342083 () Bool)

(assert (=> b!1453384 m!1342083))

(declare-fun m!1342085 () Bool)

(assert (=> b!1453384 m!1342085))

(assert (=> b!1453388 m!1342085))

(assert (=> b!1453388 m!1342085))

(declare-fun m!1342087 () Bool)

(assert (=> b!1453388 m!1342087))

(declare-fun m!1342089 () Bool)

(assert (=> b!1453386 m!1342089))

(declare-fun m!1342091 () Bool)

(assert (=> b!1453386 m!1342091))

(assert (=> b!1453381 m!1342085))

(assert (=> b!1453381 m!1342085))

(declare-fun m!1342093 () Bool)

(assert (=> b!1453381 m!1342093))

(assert (=> b!1453382 m!1342085))

(assert (=> b!1453382 m!1342085))

(declare-fun m!1342095 () Bool)

(assert (=> b!1453382 m!1342095))

(assert (=> b!1453382 m!1342095))

(assert (=> b!1453382 m!1342085))

(declare-fun m!1342097 () Bool)

(assert (=> b!1453382 m!1342097))

(declare-fun m!1342099 () Bool)

(assert (=> b!1453393 m!1342099))

(declare-fun m!1342101 () Bool)

(assert (=> start!125160 m!1342101))

(declare-fun m!1342103 () Bool)

(assert (=> start!125160 m!1342103))

(declare-fun m!1342105 () Bool)

(assert (=> b!1453391 m!1342105))

(assert (=> b!1453391 m!1342105))

(declare-fun m!1342107 () Bool)

(assert (=> b!1453391 m!1342107))

(assert (=> b!1453391 m!1342077))

(declare-fun m!1342109 () Bool)

(assert (=> b!1453391 m!1342109))

(declare-fun m!1342111 () Bool)

(assert (=> b!1453389 m!1342111))

(assert (=> b!1453389 m!1342111))

(declare-fun m!1342113 () Bool)

(assert (=> b!1453389 m!1342113))

(declare-fun m!1342115 () Bool)

(assert (=> b!1453394 m!1342115))

(declare-fun m!1342117 () Bool)

(assert (=> b!1453394 m!1342117))

(assert (=> b!1453385 m!1342077))

(declare-fun m!1342119 () Bool)

(assert (=> b!1453385 m!1342119))

(declare-fun m!1342121 () Bool)

(assert (=> b!1453390 m!1342121))

(assert (=> b!1453383 m!1342085))

(assert (=> b!1453383 m!1342085))

(declare-fun m!1342123 () Bool)

(assert (=> b!1453383 m!1342123))

(check-sat (not b!1453393) (not b!1453388) (not b!1453394) (not b!1453390) (not b!1453386) (not b!1453392) (not b!1453391) (not b!1453382) (not b!1453383) (not start!125160) (not b!1453389) (not b!1453381))
(check-sat)
