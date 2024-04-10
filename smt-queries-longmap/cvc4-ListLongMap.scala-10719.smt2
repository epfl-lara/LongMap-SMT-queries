; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125456 () Bool)

(assert start!125456)

(declare-fun b!1467689 () Bool)

(declare-fun res!996232 () Bool)

(declare-fun e!824344 () Bool)

(assert (=> b!1467689 (=> (not res!996232) (not e!824344))))

(declare-datatypes ((array!98904 0))(
  ( (array!98905 (arr!47740 (Array (_ BitVec 32) (_ BitVec 64))) (size!48290 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98904)

(declare-datatypes ((List!34241 0))(
  ( (Nil!34238) (Cons!34237 (h!35587 (_ BitVec 64)) (t!48935 List!34241)) )
))
(declare-fun arrayNoDuplicates!0 (array!98904 (_ BitVec 32) List!34241) Bool)

(assert (=> b!1467689 (= res!996232 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34238))))

(declare-fun b!1467690 () Bool)

(declare-fun res!996228 () Bool)

(assert (=> b!1467690 (=> (not res!996228) (not e!824344))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467690 (= res!996228 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48290 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48290 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48290 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47740 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467691 () Bool)

(declare-fun res!996235 () Bool)

(assert (=> b!1467691 (=> (not res!996235) (not e!824344))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11980 0))(
  ( (MissingZero!11980 (index!50312 (_ BitVec 32))) (Found!11980 (index!50313 (_ BitVec 32))) (Intermediate!11980 (undefined!12792 Bool) (index!50314 (_ BitVec 32)) (x!131909 (_ BitVec 32))) (Undefined!11980) (MissingVacant!11980 (index!50315 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98904 (_ BitVec 32)) SeekEntryResult!11980)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467691 (= res!996235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47740 a!2862) j!93) mask!2687) (select (arr!47740 a!2862) j!93) a!2862 mask!2687) (Intermediate!11980 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467692 () Bool)

(assert (=> b!1467692 (= e!824344 false)))

(declare-fun lt!642138 () SeekEntryResult!11980)

(assert (=> b!1467692 (= lt!642138 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47740 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467693 () Bool)

(declare-fun res!996229 () Bool)

(assert (=> b!1467693 (=> (not res!996229) (not e!824344))))

(assert (=> b!1467693 (= res!996229 (and (= (size!48290 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48290 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48290 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467694 () Bool)

(declare-fun res!996234 () Bool)

(assert (=> b!1467694 (=> (not res!996234) (not e!824344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467694 (= res!996234 (validKeyInArray!0 (select (arr!47740 a!2862) j!93)))))

(declare-fun res!996231 () Bool)

(assert (=> start!125456 (=> (not res!996231) (not e!824344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125456 (= res!996231 (validMask!0 mask!2687))))

(assert (=> start!125456 e!824344))

(assert (=> start!125456 true))

(declare-fun array_inv!36768 (array!98904) Bool)

(assert (=> start!125456 (array_inv!36768 a!2862)))

(declare-fun b!1467695 () Bool)

(declare-fun res!996230 () Bool)

(assert (=> b!1467695 (=> (not res!996230) (not e!824344))))

(assert (=> b!1467695 (= res!996230 (validKeyInArray!0 (select (arr!47740 a!2862) i!1006)))))

(declare-fun b!1467696 () Bool)

(declare-fun res!996233 () Bool)

(assert (=> b!1467696 (=> (not res!996233) (not e!824344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98904 (_ BitVec 32)) Bool)

(assert (=> b!1467696 (= res!996233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125456 res!996231) b!1467693))

(assert (= (and b!1467693 res!996229) b!1467695))

(assert (= (and b!1467695 res!996230) b!1467694))

(assert (= (and b!1467694 res!996234) b!1467696))

(assert (= (and b!1467696 res!996233) b!1467689))

(assert (= (and b!1467689 res!996232) b!1467690))

(assert (= (and b!1467690 res!996228) b!1467691))

(assert (= (and b!1467691 res!996235) b!1467692))

(declare-fun m!1354643 () Bool)

(assert (=> b!1467692 m!1354643))

(assert (=> b!1467692 m!1354643))

(declare-fun m!1354645 () Bool)

(assert (=> b!1467692 m!1354645))

(assert (=> b!1467691 m!1354643))

(assert (=> b!1467691 m!1354643))

(declare-fun m!1354647 () Bool)

(assert (=> b!1467691 m!1354647))

(assert (=> b!1467691 m!1354647))

(assert (=> b!1467691 m!1354643))

(declare-fun m!1354649 () Bool)

(assert (=> b!1467691 m!1354649))

(declare-fun m!1354651 () Bool)

(assert (=> b!1467690 m!1354651))

(declare-fun m!1354653 () Bool)

(assert (=> b!1467690 m!1354653))

(declare-fun m!1354655 () Bool)

(assert (=> b!1467689 m!1354655))

(declare-fun m!1354657 () Bool)

(assert (=> start!125456 m!1354657))

(declare-fun m!1354659 () Bool)

(assert (=> start!125456 m!1354659))

(assert (=> b!1467694 m!1354643))

(assert (=> b!1467694 m!1354643))

(declare-fun m!1354661 () Bool)

(assert (=> b!1467694 m!1354661))

(declare-fun m!1354663 () Bool)

(assert (=> b!1467695 m!1354663))

(assert (=> b!1467695 m!1354663))

(declare-fun m!1354665 () Bool)

(assert (=> b!1467695 m!1354665))

(declare-fun m!1354667 () Bool)

(assert (=> b!1467696 m!1354667))

(push 1)

(assert (not start!125456))

(assert (not b!1467691))

(assert (not b!1467692))

(assert (not b!1467695))

(assert (not b!1467689))

(assert (not b!1467694))

(assert (not b!1467696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

