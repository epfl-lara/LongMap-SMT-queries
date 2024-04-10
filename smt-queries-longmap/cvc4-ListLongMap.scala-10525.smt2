; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124124 () Bool)

(assert start!124124)

(declare-fun b!1436918 () Bool)

(declare-fun res!969803 () Bool)

(declare-fun e!810790 () Bool)

(assert (=> b!1436918 (=> (not res!969803) (not e!810790))))

(declare-datatypes ((array!97728 0))(
  ( (array!97729 (arr!47158 (Array (_ BitVec 32) (_ BitVec 64))) (size!47708 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97728)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436918 (= res!969803 (validKeyInArray!0 (select (arr!47158 a!2862) i!1006)))))

(declare-fun res!969807 () Bool)

(assert (=> start!124124 (=> (not res!969807) (not e!810790))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124124 (= res!969807 (validMask!0 mask!2687))))

(assert (=> start!124124 e!810790))

(assert (=> start!124124 true))

(declare-fun array_inv!36186 (array!97728) Bool)

(assert (=> start!124124 (array_inv!36186 a!2862)))

(declare-fun b!1436919 () Bool)

(declare-fun res!969801 () Bool)

(assert (=> b!1436919 (=> (not res!969801) (not e!810790))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436919 (= res!969801 (and (= (size!47708 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47708 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47708 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436920 () Bool)

(declare-fun res!969804 () Bool)

(assert (=> b!1436920 (=> (not res!969804) (not e!810790))))

(declare-datatypes ((List!33659 0))(
  ( (Nil!33656) (Cons!33655 (h!34993 (_ BitVec 64)) (t!48353 List!33659)) )
))
(declare-fun arrayNoDuplicates!0 (array!97728 (_ BitVec 32) List!33659) Bool)

(assert (=> b!1436920 (= res!969804 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33656))))

(declare-fun b!1436921 () Bool)

(declare-fun res!969805 () Bool)

(assert (=> b!1436921 (=> (not res!969805) (not e!810790))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436921 (= res!969805 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47708 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47708 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47708 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436922 () Bool)

(declare-fun res!969808 () Bool)

(assert (=> b!1436922 (=> (not res!969808) (not e!810790))))

(declare-datatypes ((SeekEntryResult!11410 0))(
  ( (MissingZero!11410 (index!48032 (_ BitVec 32))) (Found!11410 (index!48033 (_ BitVec 32))) (Intermediate!11410 (undefined!12222 Bool) (index!48034 (_ BitVec 32)) (x!129763 (_ BitVec 32))) (Undefined!11410) (MissingVacant!11410 (index!48035 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97728 (_ BitVec 32)) SeekEntryResult!11410)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436922 (= res!969808 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47158 a!2862) j!93) mask!2687) (select (arr!47158 a!2862) j!93) a!2862 mask!2687) (Intermediate!11410 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1436923 () Bool)

(declare-fun res!969802 () Bool)

(assert (=> b!1436923 (=> (not res!969802) (not e!810790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97728 (_ BitVec 32)) Bool)

(assert (=> b!1436923 (= res!969802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436924 () Bool)

(declare-fun res!969806 () Bool)

(assert (=> b!1436924 (=> (not res!969806) (not e!810790))))

(assert (=> b!1436924 (= res!969806 (validKeyInArray!0 (select (arr!47158 a!2862) j!93)))))

(declare-fun b!1436925 () Bool)

(assert (=> b!1436925 (= e!810790 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (= (and start!124124 res!969807) b!1436919))

(assert (= (and b!1436919 res!969801) b!1436918))

(assert (= (and b!1436918 res!969803) b!1436924))

(assert (= (and b!1436924 res!969806) b!1436923))

(assert (= (and b!1436923 res!969802) b!1436920))

(assert (= (and b!1436920 res!969804) b!1436921))

(assert (= (and b!1436921 res!969805) b!1436922))

(assert (= (and b!1436922 res!969808) b!1436925))

(declare-fun m!1326217 () Bool)

(assert (=> b!1436920 m!1326217))

(declare-fun m!1326219 () Bool)

(assert (=> start!124124 m!1326219))

(declare-fun m!1326221 () Bool)

(assert (=> start!124124 m!1326221))

(declare-fun m!1326223 () Bool)

(assert (=> b!1436923 m!1326223))

(declare-fun m!1326225 () Bool)

(assert (=> b!1436924 m!1326225))

(assert (=> b!1436924 m!1326225))

(declare-fun m!1326227 () Bool)

(assert (=> b!1436924 m!1326227))

(declare-fun m!1326229 () Bool)

(assert (=> b!1436918 m!1326229))

(assert (=> b!1436918 m!1326229))

(declare-fun m!1326231 () Bool)

(assert (=> b!1436918 m!1326231))

(declare-fun m!1326233 () Bool)

(assert (=> b!1436921 m!1326233))

(declare-fun m!1326235 () Bool)

(assert (=> b!1436921 m!1326235))

(assert (=> b!1436922 m!1326225))

(assert (=> b!1436922 m!1326225))

(declare-fun m!1326237 () Bool)

(assert (=> b!1436922 m!1326237))

(assert (=> b!1436922 m!1326237))

(assert (=> b!1436922 m!1326225))

(declare-fun m!1326239 () Bool)

(assert (=> b!1436922 m!1326239))

(push 1)

(assert (not b!1436918))

(assert (not b!1436922))

(assert (not b!1436920))

(assert (not b!1436924))

(assert (not b!1436923))

(assert (not start!124124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

