; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124686 () Bool)

(assert start!124686)

(declare-fun res!973084 () Bool)

(declare-fun e!812933 () Bool)

(assert (=> start!124686 (=> (not res!973084) (not e!812933))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124686 (= res!973084 (validMask!0 mask!2687))))

(assert (=> start!124686 e!812933))

(assert (=> start!124686 true))

(declare-datatypes ((array!98029 0))(
  ( (array!98030 (arr!47299 (Array (_ BitVec 32) (_ BitVec 64))) (size!47850 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98029)

(declare-fun array_inv!36580 (array!98029) Bool)

(assert (=> start!124686 (array_inv!36580 a!2862)))

(declare-fun b!1441477 () Bool)

(declare-fun res!973086 () Bool)

(assert (=> b!1441477 (=> (not res!973086) (not e!812933))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441477 (= res!973086 (validKeyInArray!0 (select (arr!47299 a!2862) j!93)))))

(declare-fun b!1441478 () Bool)

(declare-fun res!973085 () Bool)

(declare-fun e!812934 () Bool)

(assert (=> b!1441478 (=> (not res!973085) (not e!812934))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11448 0))(
  ( (MissingZero!11448 (index!48184 (_ BitVec 32))) (Found!11448 (index!48185 (_ BitVec 32))) (Intermediate!11448 (undefined!12260 Bool) (index!48186 (_ BitVec 32)) (x!130089 (_ BitVec 32))) (Undefined!11448) (MissingVacant!11448 (index!48187 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98029 (_ BitVec 32)) SeekEntryResult!11448)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441478 (= res!973085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98030 (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47850 a!2862)) mask!2687) (Intermediate!11448 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1441479 () Bool)

(declare-fun res!973079 () Bool)

(assert (=> b!1441479 (=> (not res!973079) (not e!812933))))

(declare-datatypes ((List!33787 0))(
  ( (Nil!33784) (Cons!33783 (h!35144 (_ BitVec 64)) (t!48473 List!33787)) )
))
(declare-fun arrayNoDuplicates!0 (array!98029 (_ BitVec 32) List!33787) Bool)

(assert (=> b!1441479 (= res!973079 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33784))))

(declare-fun b!1441480 () Bool)

(declare-fun res!973082 () Bool)

(assert (=> b!1441480 (=> (not res!973082) (not e!812933))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441480 (= res!973082 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47850 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47850 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47850 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441481 () Bool)

(declare-fun res!973081 () Bool)

(assert (=> b!1441481 (=> (not res!973081) (not e!812933))))

(assert (=> b!1441481 (= res!973081 (validKeyInArray!0 (select (arr!47299 a!2862) i!1006)))))

(declare-fun b!1441482 () Bool)

(assert (=> b!1441482 (= e!812934 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1441483 () Bool)

(declare-fun res!973088 () Bool)

(assert (=> b!1441483 (=> (not res!973088) (not e!812934))))

(declare-fun lt!633403 () SeekEntryResult!11448)

(assert (=> b!1441483 (= res!973088 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47299 a!2862) j!93) a!2862 mask!2687) lt!633403))))

(declare-fun b!1441484 () Bool)

(assert (=> b!1441484 (= e!812933 e!812934)))

(declare-fun res!973087 () Bool)

(assert (=> b!1441484 (=> (not res!973087) (not e!812934))))

(assert (=> b!1441484 (= res!973087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47299 a!2862) j!93) mask!2687) (select (arr!47299 a!2862) j!93) a!2862 mask!2687) lt!633403))))

(assert (=> b!1441484 (= lt!633403 (Intermediate!11448 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441485 () Bool)

(declare-fun res!973080 () Bool)

(assert (=> b!1441485 (=> (not res!973080) (not e!812933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98029 (_ BitVec 32)) Bool)

(assert (=> b!1441485 (= res!973080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441486 () Bool)

(declare-fun res!973083 () Bool)

(assert (=> b!1441486 (=> (not res!973083) (not e!812933))))

(assert (=> b!1441486 (= res!973083 (and (= (size!47850 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47850 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47850 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124686 res!973084) b!1441486))

(assert (= (and b!1441486 res!973083) b!1441481))

(assert (= (and b!1441481 res!973081) b!1441477))

(assert (= (and b!1441477 res!973086) b!1441485))

(assert (= (and b!1441485 res!973080) b!1441479))

(assert (= (and b!1441479 res!973079) b!1441480))

(assert (= (and b!1441480 res!973082) b!1441484))

(assert (= (and b!1441484 res!973087) b!1441483))

(assert (= (and b!1441483 res!973088) b!1441478))

(assert (= (and b!1441478 res!973085) b!1441482))

(declare-fun m!1330747 () Bool)

(assert (=> b!1441477 m!1330747))

(assert (=> b!1441477 m!1330747))

(declare-fun m!1330749 () Bool)

(assert (=> b!1441477 m!1330749))

(assert (=> b!1441483 m!1330747))

(assert (=> b!1441483 m!1330747))

(declare-fun m!1330751 () Bool)

(assert (=> b!1441483 m!1330751))

(declare-fun m!1330753 () Bool)

(assert (=> start!124686 m!1330753))

(declare-fun m!1330755 () Bool)

(assert (=> start!124686 m!1330755))

(declare-fun m!1330757 () Bool)

(assert (=> b!1441485 m!1330757))

(declare-fun m!1330759 () Bool)

(assert (=> b!1441481 m!1330759))

(assert (=> b!1441481 m!1330759))

(declare-fun m!1330761 () Bool)

(assert (=> b!1441481 m!1330761))

(declare-fun m!1330763 () Bool)

(assert (=> b!1441479 m!1330763))

(declare-fun m!1330765 () Bool)

(assert (=> b!1441480 m!1330765))

(declare-fun m!1330767 () Bool)

(assert (=> b!1441480 m!1330767))

(assert (=> b!1441484 m!1330747))

(assert (=> b!1441484 m!1330747))

(declare-fun m!1330769 () Bool)

(assert (=> b!1441484 m!1330769))

(assert (=> b!1441484 m!1330769))

(assert (=> b!1441484 m!1330747))

(declare-fun m!1330771 () Bool)

(assert (=> b!1441484 m!1330771))

(assert (=> b!1441478 m!1330765))

(declare-fun m!1330773 () Bool)

(assert (=> b!1441478 m!1330773))

(assert (=> b!1441478 m!1330773))

(declare-fun m!1330775 () Bool)

(assert (=> b!1441478 m!1330775))

(assert (=> b!1441478 m!1330775))

(assert (=> b!1441478 m!1330773))

(declare-fun m!1330777 () Bool)

(assert (=> b!1441478 m!1330777))

(check-sat (not b!1441481) (not b!1441485) (not b!1441479) (not b!1441478) (not b!1441484) (not b!1441483) (not start!124686) (not b!1441477))
(check-sat)
