; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124460 () Bool)

(assert start!124460)

(declare-fun b!1440039 () Bool)

(declare-fun res!972469 () Bool)

(declare-fun e!812059 () Bool)

(assert (=> b!1440039 (=> (not res!972469) (not e!812059))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97908 0))(
  ( (array!97909 (arr!47242 (Array (_ BitVec 32) (_ BitVec 64))) (size!47792 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97908)

(assert (=> b!1440039 (= res!972469 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47792 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47792 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47792 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440040 () Bool)

(declare-fun res!972467 () Bool)

(assert (=> b!1440040 (=> (not res!972467) (not e!812059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440040 (= res!972467 (validKeyInArray!0 (select (arr!47242 a!2862) i!1006)))))

(declare-fun b!1440041 () Bool)

(declare-fun res!972472 () Bool)

(declare-fun e!812058 () Bool)

(assert (=> b!1440041 (=> (not res!972472) (not e!812058))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11494 0))(
  ( (MissingZero!11494 (index!48368 (_ BitVec 32))) (Found!11494 (index!48369 (_ BitVec 32))) (Intermediate!11494 (undefined!12306 Bool) (index!48370 (_ BitVec 32)) (x!130095 (_ BitVec 32))) (Undefined!11494) (MissingVacant!11494 (index!48371 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97908 (_ BitVec 32)) SeekEntryResult!11494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440041 (= res!972472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97909 (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47792 a!2862)) mask!2687) (Intermediate!11494 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440042 () Bool)

(assert (=> b!1440042 (= e!812059 e!812058)))

(declare-fun res!972473 () Bool)

(assert (=> b!1440042 (=> (not res!972473) (not e!812058))))

(declare-fun lt!632904 () SeekEntryResult!11494)

(assert (=> b!1440042 (= res!972473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47242 a!2862) j!93) mask!2687) (select (arr!47242 a!2862) j!93) a!2862 mask!2687) lt!632904))))

(assert (=> b!1440042 (= lt!632904 (Intermediate!11494 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440043 () Bool)

(declare-fun res!972466 () Bool)

(assert (=> b!1440043 (=> (not res!972466) (not e!812059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97908 (_ BitVec 32)) Bool)

(assert (=> b!1440043 (= res!972466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972471 () Bool)

(assert (=> start!124460 (=> (not res!972471) (not e!812059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124460 (= res!972471 (validMask!0 mask!2687))))

(assert (=> start!124460 e!812059))

(assert (=> start!124460 true))

(declare-fun array_inv!36270 (array!97908) Bool)

(assert (=> start!124460 (array_inv!36270 a!2862)))

(declare-fun b!1440044 () Bool)

(assert (=> b!1440044 (= e!812058 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440045 () Bool)

(declare-fun res!972468 () Bool)

(assert (=> b!1440045 (=> (not res!972468) (not e!812059))))

(assert (=> b!1440045 (= res!972468 (validKeyInArray!0 (select (arr!47242 a!2862) j!93)))))

(declare-fun b!1440046 () Bool)

(declare-fun res!972470 () Bool)

(assert (=> b!1440046 (=> (not res!972470) (not e!812059))))

(assert (=> b!1440046 (= res!972470 (and (= (size!47792 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47792 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47792 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440047 () Bool)

(declare-fun res!972475 () Bool)

(assert (=> b!1440047 (=> (not res!972475) (not e!812058))))

(assert (=> b!1440047 (= res!972475 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47242 a!2862) j!93) a!2862 mask!2687) lt!632904))))

(declare-fun b!1440048 () Bool)

(declare-fun res!972474 () Bool)

(assert (=> b!1440048 (=> (not res!972474) (not e!812059))))

(declare-datatypes ((List!33743 0))(
  ( (Nil!33740) (Cons!33739 (h!35089 (_ BitVec 64)) (t!48437 List!33743)) )
))
(declare-fun arrayNoDuplicates!0 (array!97908 (_ BitVec 32) List!33743) Bool)

(assert (=> b!1440048 (= res!972474 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33740))))

(assert (= (and start!124460 res!972471) b!1440046))

(assert (= (and b!1440046 res!972470) b!1440040))

(assert (= (and b!1440040 res!972467) b!1440045))

(assert (= (and b!1440045 res!972468) b!1440043))

(assert (= (and b!1440043 res!972466) b!1440048))

(assert (= (and b!1440048 res!972474) b!1440039))

(assert (= (and b!1440039 res!972469) b!1440042))

(assert (= (and b!1440042 res!972473) b!1440047))

(assert (= (and b!1440047 res!972475) b!1440041))

(assert (= (and b!1440041 res!972472) b!1440044))

(declare-fun m!1329179 () Bool)

(assert (=> b!1440042 m!1329179))

(assert (=> b!1440042 m!1329179))

(declare-fun m!1329181 () Bool)

(assert (=> b!1440042 m!1329181))

(assert (=> b!1440042 m!1329181))

(assert (=> b!1440042 m!1329179))

(declare-fun m!1329183 () Bool)

(assert (=> b!1440042 m!1329183))

(declare-fun m!1329185 () Bool)

(assert (=> b!1440041 m!1329185))

(declare-fun m!1329187 () Bool)

(assert (=> b!1440041 m!1329187))

(assert (=> b!1440041 m!1329187))

(declare-fun m!1329189 () Bool)

(assert (=> b!1440041 m!1329189))

(assert (=> b!1440041 m!1329189))

(assert (=> b!1440041 m!1329187))

(declare-fun m!1329191 () Bool)

(assert (=> b!1440041 m!1329191))

(declare-fun m!1329193 () Bool)

(assert (=> b!1440043 m!1329193))

(declare-fun m!1329195 () Bool)

(assert (=> b!1440048 m!1329195))

(assert (=> b!1440039 m!1329185))

(declare-fun m!1329197 () Bool)

(assert (=> b!1440039 m!1329197))

(assert (=> b!1440047 m!1329179))

(assert (=> b!1440047 m!1329179))

(declare-fun m!1329199 () Bool)

(assert (=> b!1440047 m!1329199))

(assert (=> b!1440045 m!1329179))

(assert (=> b!1440045 m!1329179))

(declare-fun m!1329201 () Bool)

(assert (=> b!1440045 m!1329201))

(declare-fun m!1329203 () Bool)

(assert (=> b!1440040 m!1329203))

(assert (=> b!1440040 m!1329203))

(declare-fun m!1329205 () Bool)

(assert (=> b!1440040 m!1329205))

(declare-fun m!1329207 () Bool)

(assert (=> start!124460 m!1329207))

(declare-fun m!1329209 () Bool)

(assert (=> start!124460 m!1329209))

(push 1)

(assert (not b!1440047))

(assert (not b!1440043))

(assert (not b!1440041))

(assert (not b!1440042))

(assert (not b!1440048))

(assert (not b!1440040))

(assert (not b!1440045))

(assert (not start!124460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

