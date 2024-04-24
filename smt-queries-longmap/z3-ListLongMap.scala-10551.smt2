; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124662 () Bool)

(assert start!124662)

(declare-fun b!1441128 () Bool)

(declare-fun e!812826 () Bool)

(declare-fun e!812824 () Bool)

(assert (=> b!1441128 (= e!812826 e!812824)))

(declare-fun res!972731 () Bool)

(assert (=> b!1441128 (=> (not res!972731) (not e!812824))))

(declare-datatypes ((SeekEntryResult!11436 0))(
  ( (MissingZero!11436 (index!48136 (_ BitVec 32))) (Found!11436 (index!48137 (_ BitVec 32))) (Intermediate!11436 (undefined!12248 Bool) (index!48138 (_ BitVec 32)) (x!130045 (_ BitVec 32))) (Undefined!11436) (MissingVacant!11436 (index!48139 (_ BitVec 32))) )
))
(declare-fun lt!633349 () SeekEntryResult!11436)

(declare-datatypes ((array!98005 0))(
  ( (array!98006 (arr!47287 (Array (_ BitVec 32) (_ BitVec 64))) (size!47838 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98005)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98005 (_ BitVec 32)) SeekEntryResult!11436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441128 (= res!972731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47287 a!2862) j!93) mask!2687) (select (arr!47287 a!2862) j!93) a!2862 mask!2687) lt!633349))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441128 (= lt!633349 (Intermediate!11436 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441129 () Bool)

(declare-fun res!972738 () Bool)

(assert (=> b!1441129 (=> (not res!972738) (not e!812826))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441129 (= res!972738 (validKeyInArray!0 (select (arr!47287 a!2862) i!1006)))))

(declare-fun b!1441130 () Bool)

(declare-fun res!972737 () Bool)

(assert (=> b!1441130 (=> (not res!972737) (not e!812826))))

(declare-datatypes ((List!33775 0))(
  ( (Nil!33772) (Cons!33771 (h!35132 (_ BitVec 64)) (t!48461 List!33775)) )
))
(declare-fun arrayNoDuplicates!0 (array!98005 (_ BitVec 32) List!33775) Bool)

(assert (=> b!1441130 (= res!972737 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33772))))

(declare-fun res!972732 () Bool)

(assert (=> start!124662 (=> (not res!972732) (not e!812826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124662 (= res!972732 (validMask!0 mask!2687))))

(assert (=> start!124662 e!812826))

(assert (=> start!124662 true))

(declare-fun array_inv!36568 (array!98005) Bool)

(assert (=> start!124662 (array_inv!36568 a!2862)))

(declare-fun b!1441131 () Bool)

(assert (=> b!1441131 (= e!812824 (not (validKeyInArray!0 (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1441132 () Bool)

(declare-fun res!972734 () Bool)

(assert (=> b!1441132 (=> (not res!972734) (not e!812826))))

(assert (=> b!1441132 (= res!972734 (and (= (size!47838 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47838 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47838 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441133 () Bool)

(declare-fun res!972730 () Bool)

(assert (=> b!1441133 (=> (not res!972730) (not e!812826))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441133 (= res!972730 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47838 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47838 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47838 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441134 () Bool)

(declare-fun res!972736 () Bool)

(assert (=> b!1441134 (=> (not res!972736) (not e!812824))))

(assert (=> b!1441134 (= res!972736 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47287 a!2862) j!93) a!2862 mask!2687) lt!633349))))

(declare-fun b!1441135 () Bool)

(declare-fun res!972739 () Bool)

(assert (=> b!1441135 (=> (not res!972739) (not e!812824))))

(assert (=> b!1441135 (= res!972739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98006 (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47838 a!2862)) mask!2687) (Intermediate!11436 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1441136 () Bool)

(declare-fun res!972735 () Bool)

(assert (=> b!1441136 (=> (not res!972735) (not e!812824))))

(assert (=> b!1441136 (= res!972735 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1441137 () Bool)

(declare-fun res!972733 () Bool)

(assert (=> b!1441137 (=> (not res!972733) (not e!812826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98005 (_ BitVec 32)) Bool)

(assert (=> b!1441137 (= res!972733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441138 () Bool)

(declare-fun res!972740 () Bool)

(assert (=> b!1441138 (=> (not res!972740) (not e!812826))))

(assert (=> b!1441138 (= res!972740 (validKeyInArray!0 (select (arr!47287 a!2862) j!93)))))

(assert (= (and start!124662 res!972732) b!1441132))

(assert (= (and b!1441132 res!972734) b!1441129))

(assert (= (and b!1441129 res!972738) b!1441138))

(assert (= (and b!1441138 res!972740) b!1441137))

(assert (= (and b!1441137 res!972733) b!1441130))

(assert (= (and b!1441130 res!972737) b!1441133))

(assert (= (and b!1441133 res!972730) b!1441128))

(assert (= (and b!1441128 res!972731) b!1441134))

(assert (= (and b!1441134 res!972736) b!1441135))

(assert (= (and b!1441135 res!972739) b!1441136))

(assert (= (and b!1441136 res!972735) b!1441131))

(declare-fun m!1330357 () Bool)

(assert (=> b!1441133 m!1330357))

(declare-fun m!1330359 () Bool)

(assert (=> b!1441133 m!1330359))

(declare-fun m!1330361 () Bool)

(assert (=> b!1441134 m!1330361))

(assert (=> b!1441134 m!1330361))

(declare-fun m!1330363 () Bool)

(assert (=> b!1441134 m!1330363))

(declare-fun m!1330365 () Bool)

(assert (=> b!1441130 m!1330365))

(assert (=> b!1441138 m!1330361))

(assert (=> b!1441138 m!1330361))

(declare-fun m!1330367 () Bool)

(assert (=> b!1441138 m!1330367))

(assert (=> b!1441128 m!1330361))

(assert (=> b!1441128 m!1330361))

(declare-fun m!1330369 () Bool)

(assert (=> b!1441128 m!1330369))

(assert (=> b!1441128 m!1330369))

(assert (=> b!1441128 m!1330361))

(declare-fun m!1330371 () Bool)

(assert (=> b!1441128 m!1330371))

(assert (=> b!1441131 m!1330357))

(declare-fun m!1330373 () Bool)

(assert (=> b!1441131 m!1330373))

(assert (=> b!1441131 m!1330373))

(declare-fun m!1330375 () Bool)

(assert (=> b!1441131 m!1330375))

(declare-fun m!1330377 () Bool)

(assert (=> start!124662 m!1330377))

(declare-fun m!1330379 () Bool)

(assert (=> start!124662 m!1330379))

(declare-fun m!1330381 () Bool)

(assert (=> b!1441137 m!1330381))

(declare-fun m!1330383 () Bool)

(assert (=> b!1441129 m!1330383))

(assert (=> b!1441129 m!1330383))

(declare-fun m!1330385 () Bool)

(assert (=> b!1441129 m!1330385))

(assert (=> b!1441135 m!1330357))

(assert (=> b!1441135 m!1330373))

(assert (=> b!1441135 m!1330373))

(declare-fun m!1330387 () Bool)

(assert (=> b!1441135 m!1330387))

(assert (=> b!1441135 m!1330387))

(assert (=> b!1441135 m!1330373))

(declare-fun m!1330389 () Bool)

(assert (=> b!1441135 m!1330389))

(check-sat (not b!1441130) (not b!1441131) (not b!1441135) (not b!1441137) (not b!1441134) (not start!124662) (not b!1441138) (not b!1441129) (not b!1441128))
(check-sat)
