; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124336 () Bool)

(assert start!124336)

(declare-fun b!1438174 () Bool)

(declare-fun res!970238 () Bool)

(declare-fun e!811611 () Bool)

(assert (=> b!1438174 (=> (not res!970238) (not e!811611))))

(declare-datatypes ((array!97835 0))(
  ( (array!97836 (arr!47208 (Array (_ BitVec 32) (_ BitVec 64))) (size!47759 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97835)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438174 (= res!970238 (validKeyInArray!0 (select (arr!47208 a!2862) j!93)))))

(declare-fun b!1438175 () Bool)

(declare-fun res!970232 () Bool)

(assert (=> b!1438175 (=> (not res!970232) (not e!811611))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438175 (= res!970232 (validKeyInArray!0 (select (arr!47208 a!2862) i!1006)))))

(declare-fun res!970235 () Bool)

(assert (=> start!124336 (=> (not res!970235) (not e!811611))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124336 (= res!970235 (validMask!0 mask!2687))))

(assert (=> start!124336 e!811611))

(assert (=> start!124336 true))

(declare-fun array_inv!36489 (array!97835) Bool)

(assert (=> start!124336 (array_inv!36489 a!2862)))

(declare-fun b!1438176 () Bool)

(assert (=> b!1438176 (= e!811611 false)))

(declare-datatypes ((SeekEntryResult!11357 0))(
  ( (MissingZero!11357 (index!47820 (_ BitVec 32))) (Found!11357 (index!47821 (_ BitVec 32))) (Intermediate!11357 (undefined!12169 Bool) (index!47822 (_ BitVec 32)) (x!129726 (_ BitVec 32))) (Undefined!11357) (MissingVacant!11357 (index!47823 (_ BitVec 32))) )
))
(declare-fun lt!632698 () SeekEntryResult!11357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97835 (_ BitVec 32)) SeekEntryResult!11357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438176 (= lt!632698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47208 a!2862) j!93) mask!2687) (select (arr!47208 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438177 () Bool)

(declare-fun res!970234 () Bool)

(assert (=> b!1438177 (=> (not res!970234) (not e!811611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97835 (_ BitVec 32)) Bool)

(assert (=> b!1438177 (= res!970234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438178 () Bool)

(declare-fun res!970233 () Bool)

(assert (=> b!1438178 (=> (not res!970233) (not e!811611))))

(declare-datatypes ((List!33696 0))(
  ( (Nil!33693) (Cons!33692 (h!35041 (_ BitVec 64)) (t!48382 List!33696)) )
))
(declare-fun arrayNoDuplicates!0 (array!97835 (_ BitVec 32) List!33696) Bool)

(assert (=> b!1438178 (= res!970233 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33693))))

(declare-fun b!1438179 () Bool)

(declare-fun res!970237 () Bool)

(assert (=> b!1438179 (=> (not res!970237) (not e!811611))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438179 (= res!970237 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47759 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47759 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47759 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47208 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438180 () Bool)

(declare-fun res!970236 () Bool)

(assert (=> b!1438180 (=> (not res!970236) (not e!811611))))

(assert (=> b!1438180 (= res!970236 (and (= (size!47759 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47759 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47759 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124336 res!970235) b!1438180))

(assert (= (and b!1438180 res!970236) b!1438175))

(assert (= (and b!1438175 res!970232) b!1438174))

(assert (= (and b!1438174 res!970238) b!1438177))

(assert (= (and b!1438177 res!970234) b!1438178))

(assert (= (and b!1438178 res!970233) b!1438179))

(assert (= (and b!1438179 res!970237) b!1438176))

(declare-fun m!1327585 () Bool)

(assert (=> start!124336 m!1327585))

(declare-fun m!1327587 () Bool)

(assert (=> start!124336 m!1327587))

(declare-fun m!1327589 () Bool)

(assert (=> b!1438177 m!1327589))

(declare-fun m!1327591 () Bool)

(assert (=> b!1438174 m!1327591))

(assert (=> b!1438174 m!1327591))

(declare-fun m!1327593 () Bool)

(assert (=> b!1438174 m!1327593))

(declare-fun m!1327595 () Bool)

(assert (=> b!1438179 m!1327595))

(declare-fun m!1327597 () Bool)

(assert (=> b!1438179 m!1327597))

(declare-fun m!1327599 () Bool)

(assert (=> b!1438178 m!1327599))

(assert (=> b!1438176 m!1327591))

(assert (=> b!1438176 m!1327591))

(declare-fun m!1327601 () Bool)

(assert (=> b!1438176 m!1327601))

(assert (=> b!1438176 m!1327601))

(assert (=> b!1438176 m!1327591))

(declare-fun m!1327603 () Bool)

(assert (=> b!1438176 m!1327603))

(declare-fun m!1327605 () Bool)

(assert (=> b!1438175 m!1327605))

(assert (=> b!1438175 m!1327605))

(declare-fun m!1327607 () Bool)

(assert (=> b!1438175 m!1327607))

(push 1)

(assert (not b!1438174))

(assert (not start!124336))

(assert (not b!1438175))

(assert (not b!1438178))

(assert (not b!1438177))

(assert (not b!1438176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

