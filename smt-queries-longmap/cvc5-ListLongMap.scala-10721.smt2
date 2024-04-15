; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125438 () Bool)

(assert start!125438)

(declare-fun b!1467638 () Bool)

(declare-fun res!996299 () Bool)

(declare-fun e!824265 () Bool)

(assert (=> b!1467638 (=> (not res!996299) (not e!824265))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98864 0))(
  ( (array!98865 (arr!47721 (Array (_ BitVec 32) (_ BitVec 64))) (size!48273 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98864)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467638 (= res!996299 (and (= (size!48273 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48273 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48273 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!996294 () Bool)

(assert (=> start!125438 (=> (not res!996294) (not e!824265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125438 (= res!996294 (validMask!0 mask!2687))))

(assert (=> start!125438 e!824265))

(assert (=> start!125438 true))

(declare-fun array_inv!36954 (array!98864) Bool)

(assert (=> start!125438 (array_inv!36954 a!2862)))

(declare-fun b!1467639 () Bool)

(declare-fun res!996295 () Bool)

(assert (=> b!1467639 (=> (not res!996295) (not e!824265))))

(declare-datatypes ((List!34300 0))(
  ( (Nil!34297) (Cons!34296 (h!35646 (_ BitVec 64)) (t!48986 List!34300)) )
))
(declare-fun arrayNoDuplicates!0 (array!98864 (_ BitVec 32) List!34300) Bool)

(assert (=> b!1467639 (= res!996295 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34297))))

(declare-fun b!1467640 () Bool)

(declare-fun res!996298 () Bool)

(assert (=> b!1467640 (=> (not res!996298) (not e!824265))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11986 0))(
  ( (MissingZero!11986 (index!50336 (_ BitVec 32))) (Found!11986 (index!50337 (_ BitVec 32))) (Intermediate!11986 (undefined!12798 Bool) (index!50338 (_ BitVec 32)) (x!131926 (_ BitVec 32))) (Undefined!11986) (MissingVacant!11986 (index!50339 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98864 (_ BitVec 32)) SeekEntryResult!11986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467640 (= res!996298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47721 a!2862) j!93) mask!2687) (select (arr!47721 a!2862) j!93) a!2862 mask!2687) (Intermediate!11986 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467641 () Bool)

(declare-fun res!996301 () Bool)

(assert (=> b!1467641 (=> (not res!996301) (not e!824265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467641 (= res!996301 (validKeyInArray!0 (select (arr!47721 a!2862) i!1006)))))

(declare-fun b!1467642 () Bool)

(assert (=> b!1467642 (= e!824265 false)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!641922 () SeekEntryResult!11986)

(assert (=> b!1467642 (= lt!641922 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47721 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467643 () Bool)

(declare-fun res!996300 () Bool)

(assert (=> b!1467643 (=> (not res!996300) (not e!824265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98864 (_ BitVec 32)) Bool)

(assert (=> b!1467643 (= res!996300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467644 () Bool)

(declare-fun res!996296 () Bool)

(assert (=> b!1467644 (=> (not res!996296) (not e!824265))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467644 (= res!996296 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48273 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48273 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48273 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47721 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467645 () Bool)

(declare-fun res!996297 () Bool)

(assert (=> b!1467645 (=> (not res!996297) (not e!824265))))

(assert (=> b!1467645 (= res!996297 (validKeyInArray!0 (select (arr!47721 a!2862) j!93)))))

(assert (= (and start!125438 res!996294) b!1467638))

(assert (= (and b!1467638 res!996299) b!1467641))

(assert (= (and b!1467641 res!996301) b!1467645))

(assert (= (and b!1467645 res!996297) b!1467643))

(assert (= (and b!1467643 res!996300) b!1467639))

(assert (= (and b!1467639 res!996295) b!1467644))

(assert (= (and b!1467644 res!996296) b!1467640))

(assert (= (and b!1467640 res!996298) b!1467642))

(declare-fun m!1354123 () Bool)

(assert (=> b!1467641 m!1354123))

(assert (=> b!1467641 m!1354123))

(declare-fun m!1354125 () Bool)

(assert (=> b!1467641 m!1354125))

(declare-fun m!1354127 () Bool)

(assert (=> b!1467643 m!1354127))

(declare-fun m!1354129 () Bool)

(assert (=> b!1467639 m!1354129))

(declare-fun m!1354131 () Bool)

(assert (=> b!1467644 m!1354131))

(declare-fun m!1354133 () Bool)

(assert (=> b!1467644 m!1354133))

(declare-fun m!1354135 () Bool)

(assert (=> b!1467640 m!1354135))

(assert (=> b!1467640 m!1354135))

(declare-fun m!1354137 () Bool)

(assert (=> b!1467640 m!1354137))

(assert (=> b!1467640 m!1354137))

(assert (=> b!1467640 m!1354135))

(declare-fun m!1354139 () Bool)

(assert (=> b!1467640 m!1354139))

(assert (=> b!1467642 m!1354135))

(assert (=> b!1467642 m!1354135))

(declare-fun m!1354141 () Bool)

(assert (=> b!1467642 m!1354141))

(declare-fun m!1354143 () Bool)

(assert (=> start!125438 m!1354143))

(declare-fun m!1354145 () Bool)

(assert (=> start!125438 m!1354145))

(assert (=> b!1467645 m!1354135))

(assert (=> b!1467645 m!1354135))

(declare-fun m!1354147 () Bool)

(assert (=> b!1467645 m!1354147))

(push 1)

(assert (not start!125438))

(assert (not b!1467645))

(assert (not b!1467643))

(assert (not b!1467641))

(assert (not b!1467642))

(assert (not b!1467639))

(assert (not b!1467640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

