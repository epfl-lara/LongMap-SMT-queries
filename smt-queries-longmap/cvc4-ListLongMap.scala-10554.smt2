; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124466 () Bool)

(assert start!124466)

(declare-fun b!1440121 () Bool)

(declare-fun e!812087 () Bool)

(assert (=> b!1440121 (= e!812087 false)))

(declare-datatypes ((SeekEntryResult!11497 0))(
  ( (MissingZero!11497 (index!48380 (_ BitVec 32))) (Found!11497 (index!48381 (_ BitVec 32))) (Intermediate!11497 (undefined!12309 Bool) (index!48382 (_ BitVec 32)) (x!130106 (_ BitVec 32))) (Undefined!11497) (MissingVacant!11497 (index!48383 (_ BitVec 32))) )
))
(declare-fun lt!632921 () SeekEntryResult!11497)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97914 0))(
  ( (array!97915 (arr!47245 (Array (_ BitVec 32) (_ BitVec 64))) (size!47795 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97914 (_ BitVec 32)) SeekEntryResult!11497)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440121 (= lt!632921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97915 (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47795 a!2862)) mask!2687))))

(declare-fun b!1440122 () Bool)

(declare-fun res!972553 () Bool)

(declare-fun e!812085 () Bool)

(assert (=> b!1440122 (=> (not res!972553) (not e!812085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440122 (= res!972553 (validKeyInArray!0 (select (arr!47245 a!2862) i!1006)))))

(declare-fun res!972548 () Bool)

(assert (=> start!124466 (=> (not res!972548) (not e!812085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124466 (= res!972548 (validMask!0 mask!2687))))

(assert (=> start!124466 e!812085))

(assert (=> start!124466 true))

(declare-fun array_inv!36273 (array!97914) Bool)

(assert (=> start!124466 (array_inv!36273 a!2862)))

(declare-fun b!1440123 () Bool)

(assert (=> b!1440123 (= e!812085 e!812087)))

(declare-fun res!972554 () Bool)

(assert (=> b!1440123 (=> (not res!972554) (not e!812087))))

(declare-fun lt!632922 () SeekEntryResult!11497)

(assert (=> b!1440123 (= res!972554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47245 a!2862) j!93) mask!2687) (select (arr!47245 a!2862) j!93) a!2862 mask!2687) lt!632922))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440123 (= lt!632922 (Intermediate!11497 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440124 () Bool)

(declare-fun res!972552 () Bool)

(assert (=> b!1440124 (=> (not res!972552) (not e!812085))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440124 (= res!972552 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47795 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47795 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47795 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440125 () Bool)

(declare-fun res!972556 () Bool)

(assert (=> b!1440125 (=> (not res!972556) (not e!812087))))

(assert (=> b!1440125 (= res!972556 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47245 a!2862) j!93) a!2862 mask!2687) lt!632922))))

(declare-fun b!1440126 () Bool)

(declare-fun res!972550 () Bool)

(assert (=> b!1440126 (=> (not res!972550) (not e!812085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97914 (_ BitVec 32)) Bool)

(assert (=> b!1440126 (= res!972550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440127 () Bool)

(declare-fun res!972551 () Bool)

(assert (=> b!1440127 (=> (not res!972551) (not e!812085))))

(assert (=> b!1440127 (= res!972551 (validKeyInArray!0 (select (arr!47245 a!2862) j!93)))))

(declare-fun b!1440128 () Bool)

(declare-fun res!972549 () Bool)

(assert (=> b!1440128 (=> (not res!972549) (not e!812085))))

(declare-datatypes ((List!33746 0))(
  ( (Nil!33743) (Cons!33742 (h!35092 (_ BitVec 64)) (t!48440 List!33746)) )
))
(declare-fun arrayNoDuplicates!0 (array!97914 (_ BitVec 32) List!33746) Bool)

(assert (=> b!1440128 (= res!972549 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33743))))

(declare-fun b!1440129 () Bool)

(declare-fun res!972555 () Bool)

(assert (=> b!1440129 (=> (not res!972555) (not e!812085))))

(assert (=> b!1440129 (= res!972555 (and (= (size!47795 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47795 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47795 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124466 res!972548) b!1440129))

(assert (= (and b!1440129 res!972555) b!1440122))

(assert (= (and b!1440122 res!972553) b!1440127))

(assert (= (and b!1440127 res!972551) b!1440126))

(assert (= (and b!1440126 res!972550) b!1440128))

(assert (= (and b!1440128 res!972549) b!1440124))

(assert (= (and b!1440124 res!972552) b!1440123))

(assert (= (and b!1440123 res!972554) b!1440125))

(assert (= (and b!1440125 res!972556) b!1440121))

(declare-fun m!1329275 () Bool)

(assert (=> b!1440121 m!1329275))

(declare-fun m!1329277 () Bool)

(assert (=> b!1440121 m!1329277))

(assert (=> b!1440121 m!1329277))

(declare-fun m!1329279 () Bool)

(assert (=> b!1440121 m!1329279))

(assert (=> b!1440121 m!1329279))

(assert (=> b!1440121 m!1329277))

(declare-fun m!1329281 () Bool)

(assert (=> b!1440121 m!1329281))

(declare-fun m!1329283 () Bool)

(assert (=> start!124466 m!1329283))

(declare-fun m!1329285 () Bool)

(assert (=> start!124466 m!1329285))

(declare-fun m!1329287 () Bool)

(assert (=> b!1440126 m!1329287))

(declare-fun m!1329289 () Bool)

(assert (=> b!1440122 m!1329289))

(assert (=> b!1440122 m!1329289))

(declare-fun m!1329291 () Bool)

(assert (=> b!1440122 m!1329291))

(declare-fun m!1329293 () Bool)

(assert (=> b!1440128 m!1329293))

(assert (=> b!1440124 m!1329275))

(declare-fun m!1329295 () Bool)

(assert (=> b!1440124 m!1329295))

(declare-fun m!1329297 () Bool)

(assert (=> b!1440125 m!1329297))

(assert (=> b!1440125 m!1329297))

(declare-fun m!1329299 () Bool)

(assert (=> b!1440125 m!1329299))

(assert (=> b!1440127 m!1329297))

(assert (=> b!1440127 m!1329297))

(declare-fun m!1329301 () Bool)

(assert (=> b!1440127 m!1329301))

(assert (=> b!1440123 m!1329297))

(assert (=> b!1440123 m!1329297))

(declare-fun m!1329303 () Bool)

(assert (=> b!1440123 m!1329303))

(assert (=> b!1440123 m!1329303))

(assert (=> b!1440123 m!1329297))

(declare-fun m!1329305 () Bool)

(assert (=> b!1440123 m!1329305))

(push 1)

(assert (not start!124466))

(assert (not b!1440128))

(assert (not b!1440123))

(assert (not b!1440126))

(assert (not b!1440122))

(assert (not b!1440125))

(assert (not b!1440127))

(assert (not b!1440121))

