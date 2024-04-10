; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124534 () Bool)

(assert start!124534)

(declare-fun b!1441182 () Bool)

(declare-fun e!812451 () Bool)

(declare-fun e!812452 () Bool)

(assert (=> b!1441182 (= e!812451 e!812452)))

(declare-fun res!973572 () Bool)

(assert (=> b!1441182 (=> (not res!973572) (not e!812452))))

(declare-datatypes ((SeekEntryResult!11531 0))(
  ( (MissingZero!11531 (index!48516 (_ BitVec 32))) (Found!11531 (index!48517 (_ BitVec 32))) (Intermediate!11531 (undefined!12343 Bool) (index!48518 (_ BitVec 32)) (x!130236 (_ BitVec 32))) (Undefined!11531) (MissingVacant!11531 (index!48519 (_ BitVec 32))) )
))
(declare-fun lt!633142 () SeekEntryResult!11531)

(declare-datatypes ((array!97982 0))(
  ( (array!97983 (arr!47279 (Array (_ BitVec 32) (_ BitVec 64))) (size!47829 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97982)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97982 (_ BitVec 32)) SeekEntryResult!11531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441182 (= res!973572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47279 a!2862) j!93) mask!2687) (select (arr!47279 a!2862) j!93) a!2862 mask!2687) lt!633142))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441182 (= lt!633142 (Intermediate!11531 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441183 () Bool)

(declare-fun e!812454 () Bool)

(assert (=> b!1441183 (= e!812452 e!812454)))

(declare-fun res!973570 () Bool)

(assert (=> b!1441183 (=> (not res!973570) (not e!812454))))

(declare-fun lt!633143 () SeekEntryResult!11531)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441183 (= res!973570 (= lt!633143 (Intermediate!11531 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633141 () (_ BitVec 64))

(declare-fun lt!633140 () array!97982)

(assert (=> b!1441183 (= lt!633143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633141 mask!2687) lt!633141 lt!633140 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441183 (= lt!633141 (select (store (arr!47279 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441184 () Bool)

(assert (=> b!1441184 (= e!812454 false)))

(declare-fun lt!633144 () Bool)

(declare-fun e!812455 () Bool)

(assert (=> b!1441184 (= lt!633144 e!812455)))

(declare-fun c!133317 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1441184 (= c!133317 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441185 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441185 (= e!812455 (not (= lt!633143 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633141 lt!633140 mask!2687))))))

(declare-fun b!1441187 () Bool)

(declare-fun res!973575 () Bool)

(declare-fun e!812456 () Bool)

(assert (=> b!1441187 (=> (not res!973575) (not e!812456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441187 (= res!973575 (validKeyInArray!0 (select (arr!47279 a!2862) j!93)))))

(declare-fun b!1441188 () Bool)

(declare-fun res!973579 () Bool)

(assert (=> b!1441188 (=> (not res!973579) (not e!812452))))

(assert (=> b!1441188 (= res!973579 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47279 a!2862) j!93) a!2862 mask!2687) lt!633142))))

(declare-fun b!1441189 () Bool)

(declare-fun res!973571 () Bool)

(assert (=> b!1441189 (=> (not res!973571) (not e!812456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97982 (_ BitVec 32)) Bool)

(assert (=> b!1441189 (= res!973571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441190 () Bool)

(assert (=> b!1441190 (= e!812456 e!812451)))

(declare-fun res!973573 () Bool)

(assert (=> b!1441190 (=> (not res!973573) (not e!812451))))

(assert (=> b!1441190 (= res!973573 (= (select (store (arr!47279 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441190 (= lt!633140 (array!97983 (store (arr!47279 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47829 a!2862)))))

(declare-fun b!1441191 () Bool)

(declare-fun res!973576 () Bool)

(assert (=> b!1441191 (=> (not res!973576) (not e!812456))))

(assert (=> b!1441191 (= res!973576 (and (= (size!47829 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47829 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47829 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441192 () Bool)

(declare-fun res!973569 () Bool)

(assert (=> b!1441192 (=> (not res!973569) (not e!812456))))

(declare-datatypes ((List!33780 0))(
  ( (Nil!33777) (Cons!33776 (h!35126 (_ BitVec 64)) (t!48474 List!33780)) )
))
(declare-fun arrayNoDuplicates!0 (array!97982 (_ BitVec 32) List!33780) Bool)

(assert (=> b!1441192 (= res!973569 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33777))))

(declare-fun b!1441186 () Bool)

(declare-fun res!973574 () Bool)

(assert (=> b!1441186 (=> (not res!973574) (not e!812456))))

(assert (=> b!1441186 (= res!973574 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47829 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47829 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47829 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!973578 () Bool)

(assert (=> start!124534 (=> (not res!973578) (not e!812456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124534 (= res!973578 (validMask!0 mask!2687))))

(assert (=> start!124534 e!812456))

(assert (=> start!124534 true))

(declare-fun array_inv!36307 (array!97982) Bool)

(assert (=> start!124534 (array_inv!36307 a!2862)))

(declare-fun b!1441193 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97982 (_ BitVec 32)) SeekEntryResult!11531)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97982 (_ BitVec 32)) SeekEntryResult!11531)

(assert (=> b!1441193 (= e!812455 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633141 lt!633140 mask!2687) (seekEntryOrOpen!0 lt!633141 lt!633140 mask!2687))))))

(declare-fun b!1441194 () Bool)

(declare-fun res!973577 () Bool)

(assert (=> b!1441194 (=> (not res!973577) (not e!812456))))

(assert (=> b!1441194 (= res!973577 (validKeyInArray!0 (select (arr!47279 a!2862) i!1006)))))

(assert (= (and start!124534 res!973578) b!1441191))

(assert (= (and b!1441191 res!973576) b!1441194))

(assert (= (and b!1441194 res!973577) b!1441187))

(assert (= (and b!1441187 res!973575) b!1441189))

(assert (= (and b!1441189 res!973571) b!1441192))

(assert (= (and b!1441192 res!973569) b!1441186))

(assert (= (and b!1441186 res!973574) b!1441190))

(assert (= (and b!1441190 res!973573) b!1441182))

(assert (= (and b!1441182 res!973572) b!1441188))

(assert (= (and b!1441188 res!973579) b!1441183))

(assert (= (and b!1441183 res!973570) b!1441184))

(assert (= (and b!1441184 c!133317) b!1441185))

(assert (= (and b!1441184 (not c!133317)) b!1441193))

(declare-fun m!1330411 () Bool)

(assert (=> b!1441187 m!1330411))

(assert (=> b!1441187 m!1330411))

(declare-fun m!1330413 () Bool)

(assert (=> b!1441187 m!1330413))

(declare-fun m!1330415 () Bool)

(assert (=> b!1441189 m!1330415))

(declare-fun m!1330417 () Bool)

(assert (=> start!124534 m!1330417))

(declare-fun m!1330419 () Bool)

(assert (=> start!124534 m!1330419))

(assert (=> b!1441182 m!1330411))

(assert (=> b!1441182 m!1330411))

(declare-fun m!1330421 () Bool)

(assert (=> b!1441182 m!1330421))

(assert (=> b!1441182 m!1330421))

(assert (=> b!1441182 m!1330411))

(declare-fun m!1330423 () Bool)

(assert (=> b!1441182 m!1330423))

(declare-fun m!1330425 () Bool)

(assert (=> b!1441183 m!1330425))

(assert (=> b!1441183 m!1330425))

(declare-fun m!1330427 () Bool)

(assert (=> b!1441183 m!1330427))

(declare-fun m!1330429 () Bool)

(assert (=> b!1441183 m!1330429))

(declare-fun m!1330431 () Bool)

(assert (=> b!1441183 m!1330431))

(declare-fun m!1330433 () Bool)

(assert (=> b!1441185 m!1330433))

(declare-fun m!1330435 () Bool)

(assert (=> b!1441193 m!1330435))

(declare-fun m!1330437 () Bool)

(assert (=> b!1441193 m!1330437))

(declare-fun m!1330439 () Bool)

(assert (=> b!1441194 m!1330439))

(assert (=> b!1441194 m!1330439))

(declare-fun m!1330441 () Bool)

(assert (=> b!1441194 m!1330441))

(assert (=> b!1441190 m!1330429))

(declare-fun m!1330443 () Bool)

(assert (=> b!1441190 m!1330443))

(declare-fun m!1330445 () Bool)

(assert (=> b!1441192 m!1330445))

(assert (=> b!1441188 m!1330411))

(assert (=> b!1441188 m!1330411))

(declare-fun m!1330447 () Bool)

(assert (=> b!1441188 m!1330447))

(push 1)

