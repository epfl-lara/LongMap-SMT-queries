; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125452 () Bool)

(assert start!125452)

(declare-fun b!1467641 () Bool)

(declare-fun res!996185 () Bool)

(declare-fun e!824333 () Bool)

(assert (=> b!1467641 (=> (not res!996185) (not e!824333))))

(declare-datatypes ((array!98900 0))(
  ( (array!98901 (arr!47738 (Array (_ BitVec 32) (_ BitVec 64))) (size!48288 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98900)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467641 (= res!996185 (validKeyInArray!0 (select (arr!47738 a!2862) j!93)))))

(declare-fun b!1467642 () Bool)

(declare-fun res!996180 () Bool)

(assert (=> b!1467642 (=> (not res!996180) (not e!824333))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11978 0))(
  ( (MissingZero!11978 (index!50304 (_ BitVec 32))) (Found!11978 (index!50305 (_ BitVec 32))) (Intermediate!11978 (undefined!12790 Bool) (index!50306 (_ BitVec 32)) (x!131907 (_ BitVec 32))) (Undefined!11978) (MissingVacant!11978 (index!50307 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98900 (_ BitVec 32)) SeekEntryResult!11978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467642 (= res!996180 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47738 a!2862) j!93) mask!2687) (select (arr!47738 a!2862) j!93) a!2862 mask!2687) (Intermediate!11978 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun res!996186 () Bool)

(assert (=> start!125452 (=> (not res!996186) (not e!824333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125452 (= res!996186 (validMask!0 mask!2687))))

(assert (=> start!125452 e!824333))

(assert (=> start!125452 true))

(declare-fun array_inv!36766 (array!98900) Bool)

(assert (=> start!125452 (array_inv!36766 a!2862)))

(declare-fun b!1467643 () Bool)

(declare-fun res!996183 () Bool)

(assert (=> b!1467643 (=> (not res!996183) (not e!824333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98900 (_ BitVec 32)) Bool)

(assert (=> b!1467643 (= res!996183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467644 () Bool)

(declare-fun res!996187 () Bool)

(assert (=> b!1467644 (=> (not res!996187) (not e!824333))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467644 (= res!996187 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48288 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48288 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48288 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47738 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467645 () Bool)

(declare-fun res!996182 () Bool)

(assert (=> b!1467645 (=> (not res!996182) (not e!824333))))

(declare-datatypes ((List!34239 0))(
  ( (Nil!34236) (Cons!34235 (h!35585 (_ BitVec 64)) (t!48933 List!34239)) )
))
(declare-fun arrayNoDuplicates!0 (array!98900 (_ BitVec 32) List!34239) Bool)

(assert (=> b!1467645 (= res!996182 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34236))))

(declare-fun b!1467646 () Bool)

(assert (=> b!1467646 (= e!824333 false)))

(declare-fun lt!642132 () SeekEntryResult!11978)

(assert (=> b!1467646 (= lt!642132 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47738 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467647 () Bool)

(declare-fun res!996181 () Bool)

(assert (=> b!1467647 (=> (not res!996181) (not e!824333))))

(assert (=> b!1467647 (= res!996181 (and (= (size!48288 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48288 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48288 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467648 () Bool)

(declare-fun res!996184 () Bool)

(assert (=> b!1467648 (=> (not res!996184) (not e!824333))))

(assert (=> b!1467648 (= res!996184 (validKeyInArray!0 (select (arr!47738 a!2862) i!1006)))))

(assert (= (and start!125452 res!996186) b!1467647))

(assert (= (and b!1467647 res!996181) b!1467648))

(assert (= (and b!1467648 res!996184) b!1467641))

(assert (= (and b!1467641 res!996185) b!1467643))

(assert (= (and b!1467643 res!996183) b!1467645))

(assert (= (and b!1467645 res!996182) b!1467644))

(assert (= (and b!1467644 res!996187) b!1467642))

(assert (= (and b!1467642 res!996180) b!1467646))

(declare-fun m!1354591 () Bool)

(assert (=> b!1467646 m!1354591))

(assert (=> b!1467646 m!1354591))

(declare-fun m!1354593 () Bool)

(assert (=> b!1467646 m!1354593))

(declare-fun m!1354595 () Bool)

(assert (=> start!125452 m!1354595))

(declare-fun m!1354597 () Bool)

(assert (=> start!125452 m!1354597))

(declare-fun m!1354599 () Bool)

(assert (=> b!1467645 m!1354599))

(declare-fun m!1354601 () Bool)

(assert (=> b!1467648 m!1354601))

(assert (=> b!1467648 m!1354601))

(declare-fun m!1354603 () Bool)

(assert (=> b!1467648 m!1354603))

(assert (=> b!1467642 m!1354591))

(assert (=> b!1467642 m!1354591))

(declare-fun m!1354605 () Bool)

(assert (=> b!1467642 m!1354605))

(assert (=> b!1467642 m!1354605))

(assert (=> b!1467642 m!1354591))

(declare-fun m!1354607 () Bool)

(assert (=> b!1467642 m!1354607))

(assert (=> b!1467641 m!1354591))

(assert (=> b!1467641 m!1354591))

(declare-fun m!1354609 () Bool)

(assert (=> b!1467641 m!1354609))

(declare-fun m!1354611 () Bool)

(assert (=> b!1467643 m!1354611))

(declare-fun m!1354613 () Bool)

(assert (=> b!1467644 m!1354613))

(declare-fun m!1354615 () Bool)

(assert (=> b!1467644 m!1354615))

(push 1)

(assert (not b!1467648))

(assert (not start!125452))

(assert (not b!1467646))

(assert (not b!1467645))

(assert (not b!1467643))

(assert (not b!1467642))

(assert (not b!1467641))

(check-sat)

