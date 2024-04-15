; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124480 () Bool)

(assert start!124480)

(declare-fun b!1440565 () Bool)

(declare-fun e!812167 () Bool)

(declare-fun e!812168 () Bool)

(assert (=> b!1440565 (= e!812167 e!812168)))

(declare-fun res!973115 () Bool)

(assert (=> b!1440565 (=> (not res!973115) (not e!812168))))

(declare-datatypes ((SeekEntryResult!11519 0))(
  ( (MissingZero!11519 (index!48468 (_ BitVec 32))) (Found!11519 (index!48469 (_ BitVec 32))) (Intermediate!11519 (undefined!12331 Bool) (index!48470 (_ BitVec 32)) (x!130187 (_ BitVec 32))) (Undefined!11519) (MissingVacant!11519 (index!48471 (_ BitVec 32))) )
))
(declare-fun lt!632783 () SeekEntryResult!11519)

(declare-datatypes ((array!97906 0))(
  ( (array!97907 (arr!47242 (Array (_ BitVec 32) (_ BitVec 64))) (size!47794 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97906)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97906 (_ BitVec 32)) SeekEntryResult!11519)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440565 (= res!973115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47242 a!2862) j!93) mask!2687) (select (arr!47242 a!2862) j!93) a!2862 mask!2687) lt!632783))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440565 (= lt!632783 (Intermediate!11519 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440566 () Bool)

(declare-fun res!973117 () Bool)

(assert (=> b!1440566 (=> (not res!973117) (not e!812167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440566 (= res!973117 (validKeyInArray!0 (select (arr!47242 a!2862) j!93)))))

(declare-fun b!1440567 () Bool)

(declare-fun res!973116 () Bool)

(assert (=> b!1440567 (=> (not res!973116) (not e!812168))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440567 (= res!973116 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47242 a!2862) j!93) a!2862 mask!2687) lt!632783))))

(declare-fun b!1440568 () Bool)

(declare-fun res!973110 () Bool)

(assert (=> b!1440568 (=> (not res!973110) (not e!812167))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440568 (= res!973110 (validKeyInArray!0 (select (arr!47242 a!2862) i!1006)))))

(declare-fun b!1440569 () Bool)

(declare-fun res!973111 () Bool)

(assert (=> b!1440569 (=> (not res!973111) (not e!812167))))

(declare-datatypes ((List!33821 0))(
  ( (Nil!33818) (Cons!33817 (h!35167 (_ BitVec 64)) (t!48507 List!33821)) )
))
(declare-fun arrayNoDuplicates!0 (array!97906 (_ BitVec 32) List!33821) Bool)

(assert (=> b!1440569 (= res!973111 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33818))))

(declare-fun b!1440570 () Bool)

(declare-fun res!973113 () Bool)

(assert (=> b!1440570 (=> (not res!973113) (not e!812167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97906 (_ BitVec 32)) Bool)

(assert (=> b!1440570 (= res!973113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!973109 () Bool)

(assert (=> start!124480 (=> (not res!973109) (not e!812167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124480 (= res!973109 (validMask!0 mask!2687))))

(assert (=> start!124480 e!812167))

(assert (=> start!124480 true))

(declare-fun array_inv!36475 (array!97906) Bool)

(assert (=> start!124480 (array_inv!36475 a!2862)))

(declare-fun b!1440571 () Bool)

(assert (=> b!1440571 (= e!812168 false)))

(declare-fun lt!632784 () SeekEntryResult!11519)

(assert (=> b!1440571 (= lt!632784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97907 (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47794 a!2862)) mask!2687))))

(declare-fun b!1440572 () Bool)

(declare-fun res!973114 () Bool)

(assert (=> b!1440572 (=> (not res!973114) (not e!812167))))

(assert (=> b!1440572 (= res!973114 (and (= (size!47794 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47794 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47794 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440573 () Bool)

(declare-fun res!973112 () Bool)

(assert (=> b!1440573 (=> (not res!973112) (not e!812167))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440573 (= res!973112 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47794 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47794 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47794 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124480 res!973109) b!1440572))

(assert (= (and b!1440572 res!973114) b!1440568))

(assert (= (and b!1440568 res!973110) b!1440566))

(assert (= (and b!1440566 res!973117) b!1440570))

(assert (= (and b!1440570 res!973113) b!1440569))

(assert (= (and b!1440569 res!973111) b!1440573))

(assert (= (and b!1440573 res!973112) b!1440565))

(assert (= (and b!1440565 res!973115) b!1440567))

(assert (= (and b!1440567 res!973116) b!1440571))

(declare-fun m!1329309 () Bool)

(assert (=> start!124480 m!1329309))

(declare-fun m!1329311 () Bool)

(assert (=> start!124480 m!1329311))

(declare-fun m!1329313 () Bool)

(assert (=> b!1440567 m!1329313))

(assert (=> b!1440567 m!1329313))

(declare-fun m!1329315 () Bool)

(assert (=> b!1440567 m!1329315))

(assert (=> b!1440565 m!1329313))

(assert (=> b!1440565 m!1329313))

(declare-fun m!1329317 () Bool)

(assert (=> b!1440565 m!1329317))

(assert (=> b!1440565 m!1329317))

(assert (=> b!1440565 m!1329313))

(declare-fun m!1329319 () Bool)

(assert (=> b!1440565 m!1329319))

(assert (=> b!1440566 m!1329313))

(assert (=> b!1440566 m!1329313))

(declare-fun m!1329321 () Bool)

(assert (=> b!1440566 m!1329321))

(declare-fun m!1329323 () Bool)

(assert (=> b!1440571 m!1329323))

(declare-fun m!1329325 () Bool)

(assert (=> b!1440571 m!1329325))

(assert (=> b!1440571 m!1329325))

(declare-fun m!1329327 () Bool)

(assert (=> b!1440571 m!1329327))

(assert (=> b!1440571 m!1329327))

(assert (=> b!1440571 m!1329325))

(declare-fun m!1329329 () Bool)

(assert (=> b!1440571 m!1329329))

(declare-fun m!1329331 () Bool)

(assert (=> b!1440570 m!1329331))

(declare-fun m!1329333 () Bool)

(assert (=> b!1440569 m!1329333))

(assert (=> b!1440573 m!1329323))

(declare-fun m!1329335 () Bool)

(assert (=> b!1440573 m!1329335))

(declare-fun m!1329337 () Bool)

(assert (=> b!1440568 m!1329337))

(assert (=> b!1440568 m!1329337))

(declare-fun m!1329339 () Bool)

(assert (=> b!1440568 m!1329339))

(check-sat (not b!1440571) (not b!1440570) (not b!1440569) (not b!1440566) (not b!1440568) (not b!1440565) (not b!1440567) (not start!124480))
(check-sat)
