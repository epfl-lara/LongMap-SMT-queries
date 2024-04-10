; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125558 () Bool)

(assert start!125558)

(declare-fun b!1469047 () Bool)

(declare-fun res!997593 () Bool)

(declare-fun e!824785 () Bool)

(assert (=> b!1469047 (=> (not res!997593) (not e!824785))))

(declare-datatypes ((array!99006 0))(
  ( (array!99007 (arr!47791 (Array (_ BitVec 32) (_ BitVec 64))) (size!48341 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99006)

(declare-datatypes ((List!34292 0))(
  ( (Nil!34289) (Cons!34288 (h!35638 (_ BitVec 64)) (t!48986 List!34292)) )
))
(declare-fun arrayNoDuplicates!0 (array!99006 (_ BitVec 32) List!34292) Bool)

(assert (=> b!1469047 (= res!997593 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34289))))

(declare-fun b!1469048 () Bool)

(declare-fun res!997591 () Bool)

(declare-fun e!824786 () Bool)

(assert (=> b!1469048 (=> (not res!997591) (not e!824786))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12031 0))(
  ( (MissingZero!12031 (index!50516 (_ BitVec 32))) (Found!12031 (index!50517 (_ BitVec 32))) (Intermediate!12031 (undefined!12843 Bool) (index!50518 (_ BitVec 32)) (x!132096 (_ BitVec 32))) (Undefined!12031) (MissingVacant!12031 (index!50519 (_ BitVec 32))) )
))
(declare-fun lt!642426 () SeekEntryResult!12031)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99006 (_ BitVec 32)) SeekEntryResult!12031)

(assert (=> b!1469048 (= res!997591 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642426))))

(declare-fun b!1469049 () Bool)

(declare-fun res!997586 () Bool)

(assert (=> b!1469049 (=> (not res!997586) (not e!824785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469049 (= res!997586 (validKeyInArray!0 (select (arr!47791 a!2862) j!93)))))

(declare-fun res!997588 () Bool)

(assert (=> start!125558 (=> (not res!997588) (not e!824785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125558 (= res!997588 (validMask!0 mask!2687))))

(assert (=> start!125558 e!824785))

(assert (=> start!125558 true))

(declare-fun array_inv!36819 (array!99006) Bool)

(assert (=> start!125558 (array_inv!36819 a!2862)))

(declare-fun b!1469050 () Bool)

(declare-fun res!997589 () Bool)

(assert (=> b!1469050 (=> (not res!997589) (not e!824785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99006 (_ BitVec 32)) Bool)

(assert (=> b!1469050 (= res!997589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469051 () Bool)

(declare-fun res!997590 () Bool)

(assert (=> b!1469051 (=> (not res!997590) (not e!824785))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469051 (= res!997590 (and (= (size!48341 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48341 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48341 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469052 () Bool)

(declare-fun res!997587 () Bool)

(assert (=> b!1469052 (=> (not res!997587) (not e!824785))))

(assert (=> b!1469052 (= res!997587 (validKeyInArray!0 (select (arr!47791 a!2862) i!1006)))))

(declare-fun b!1469053 () Bool)

(declare-fun res!997594 () Bool)

(assert (=> b!1469053 (=> (not res!997594) (not e!824785))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469053 (= res!997594 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48341 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48341 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48341 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469054 () Bool)

(assert (=> b!1469054 (= e!824785 e!824786)))

(declare-fun res!997592 () Bool)

(assert (=> b!1469054 (=> (not res!997592) (not e!824786))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469054 (= res!997592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47791 a!2862) j!93) mask!2687) (select (arr!47791 a!2862) j!93) a!2862 mask!2687) lt!642426))))

(assert (=> b!1469054 (= lt!642426 (Intermediate!12031 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469055 () Bool)

(assert (=> b!1469055 (= e!824786 false)))

(declare-fun lt!642425 () SeekEntryResult!12031)

(assert (=> b!1469055 (= lt!642425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99007 (store (arr!47791 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48341 a!2862)) mask!2687))))

(assert (= (and start!125558 res!997588) b!1469051))

(assert (= (and b!1469051 res!997590) b!1469052))

(assert (= (and b!1469052 res!997587) b!1469049))

(assert (= (and b!1469049 res!997586) b!1469050))

(assert (= (and b!1469050 res!997589) b!1469047))

(assert (= (and b!1469047 res!997593) b!1469053))

(assert (= (and b!1469053 res!997594) b!1469054))

(assert (= (and b!1469054 res!997592) b!1469048))

(assert (= (and b!1469048 res!997591) b!1469055))

(declare-fun m!1356221 () Bool)

(assert (=> b!1469052 m!1356221))

(assert (=> b!1469052 m!1356221))

(declare-fun m!1356223 () Bool)

(assert (=> b!1469052 m!1356223))

(declare-fun m!1356225 () Bool)

(assert (=> start!125558 m!1356225))

(declare-fun m!1356227 () Bool)

(assert (=> start!125558 m!1356227))

(declare-fun m!1356229 () Bool)

(assert (=> b!1469055 m!1356229))

(declare-fun m!1356231 () Bool)

(assert (=> b!1469055 m!1356231))

(assert (=> b!1469055 m!1356231))

(declare-fun m!1356233 () Bool)

(assert (=> b!1469055 m!1356233))

(assert (=> b!1469055 m!1356233))

(assert (=> b!1469055 m!1356231))

(declare-fun m!1356235 () Bool)

(assert (=> b!1469055 m!1356235))

(declare-fun m!1356237 () Bool)

(assert (=> b!1469050 m!1356237))

(assert (=> b!1469053 m!1356229))

(declare-fun m!1356239 () Bool)

(assert (=> b!1469053 m!1356239))

(declare-fun m!1356241 () Bool)

(assert (=> b!1469049 m!1356241))

(assert (=> b!1469049 m!1356241))

(declare-fun m!1356243 () Bool)

(assert (=> b!1469049 m!1356243))

(assert (=> b!1469054 m!1356241))

(assert (=> b!1469054 m!1356241))

(declare-fun m!1356245 () Bool)

(assert (=> b!1469054 m!1356245))

(assert (=> b!1469054 m!1356245))

(assert (=> b!1469054 m!1356241))

(declare-fun m!1356247 () Bool)

(assert (=> b!1469054 m!1356247))

(assert (=> b!1469048 m!1356241))

(assert (=> b!1469048 m!1356241))

(declare-fun m!1356249 () Bool)

(assert (=> b!1469048 m!1356249))

(declare-fun m!1356251 () Bool)

(assert (=> b!1469047 m!1356251))

(push 1)

(assert (not b!1469049))

(assert (not b!1469054))

(assert (not b!1469052))

(assert (not b!1469050))

(assert (not b!1469047))

(assert (not b!1469055))

(assert (not b!1469048))

(assert (not start!125558))

