; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124734 () Bool)

(assert start!124734)

(declare-fun b!1442172 () Bool)

(declare-fun res!973783 () Bool)

(declare-fun e!813148 () Bool)

(assert (=> b!1442172 (=> (not res!973783) (not e!813148))))

(declare-datatypes ((array!98077 0))(
  ( (array!98078 (arr!47323 (Array (_ BitVec 32) (_ BitVec 64))) (size!47874 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98077)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98077 (_ BitVec 32)) Bool)

(assert (=> b!1442172 (= res!973783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442173 () Bool)

(declare-fun res!973778 () Bool)

(declare-fun e!813149 () Bool)

(assert (=> b!1442173 (=> (not res!973778) (not e!813149))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442173 (= res!973778 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1442174 () Bool)

(declare-fun res!973777 () Bool)

(assert (=> b!1442174 (=> (not res!973777) (not e!813148))))

(declare-datatypes ((List!33811 0))(
  ( (Nil!33808) (Cons!33807 (h!35168 (_ BitVec 64)) (t!48497 List!33811)) )
))
(declare-fun arrayNoDuplicates!0 (array!98077 (_ BitVec 32) List!33811) Bool)

(assert (=> b!1442174 (= res!973777 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33808))))

(declare-fun b!1442175 () Bool)

(declare-fun res!973774 () Bool)

(assert (=> b!1442175 (=> (not res!973774) (not e!813149))))

(declare-datatypes ((SeekEntryResult!11472 0))(
  ( (MissingZero!11472 (index!48280 (_ BitVec 32))) (Found!11472 (index!48281 (_ BitVec 32))) (Intermediate!11472 (undefined!12284 Bool) (index!48282 (_ BitVec 32)) (x!130177 (_ BitVec 32))) (Undefined!11472) (MissingVacant!11472 (index!48283 (_ BitVec 32))) )
))
(declare-fun lt!633511 () SeekEntryResult!11472)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98077 (_ BitVec 32)) SeekEntryResult!11472)

(assert (=> b!1442175 (= res!973774 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47323 a!2862) j!93) a!2862 mask!2687) lt!633511))))

(declare-fun b!1442176 () Bool)

(declare-fun res!973781 () Bool)

(assert (=> b!1442176 (=> (not res!973781) (not e!813148))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442176 (= res!973781 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47874 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47874 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47874 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1442177 () Bool)

(declare-fun res!973775 () Bool)

(assert (=> b!1442177 (=> (not res!973775) (not e!813148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442177 (= res!973775 (validKeyInArray!0 (select (arr!47323 a!2862) j!93)))))

(declare-fun b!1442178 () Bool)

(assert (=> b!1442178 (= e!813148 e!813149)))

(declare-fun res!973779 () Bool)

(assert (=> b!1442178 (=> (not res!973779) (not e!813149))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442178 (= res!973779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47323 a!2862) j!93) mask!2687) (select (arr!47323 a!2862) j!93) a!2862 mask!2687) lt!633511))))

(assert (=> b!1442178 (= lt!633511 (Intermediate!11472 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442179 () Bool)

(declare-fun res!973784 () Bool)

(assert (=> b!1442179 (=> (not res!973784) (not e!813148))))

(assert (=> b!1442179 (= res!973784 (validKeyInArray!0 (select (arr!47323 a!2862) i!1006)))))

(declare-fun b!1442180 () Bool)

(assert (=> b!1442180 (= e!813149 (not (validKeyInArray!0 (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1442181 () Bool)

(declare-fun res!973782 () Bool)

(assert (=> b!1442181 (=> (not res!973782) (not e!813148))))

(assert (=> b!1442181 (= res!973782 (and (= (size!47874 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47874 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47874 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!973776 () Bool)

(assert (=> start!124734 (=> (not res!973776) (not e!813148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124734 (= res!973776 (validMask!0 mask!2687))))

(assert (=> start!124734 e!813148))

(assert (=> start!124734 true))

(declare-fun array_inv!36604 (array!98077) Bool)

(assert (=> start!124734 (array_inv!36604 a!2862)))

(declare-fun b!1442182 () Bool)

(declare-fun res!973780 () Bool)

(assert (=> b!1442182 (=> (not res!973780) (not e!813149))))

(assert (=> b!1442182 (= res!973780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98078 (store (arr!47323 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47874 a!2862)) mask!2687) (Intermediate!11472 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (= (and start!124734 res!973776) b!1442181))

(assert (= (and b!1442181 res!973782) b!1442179))

(assert (= (and b!1442179 res!973784) b!1442177))

(assert (= (and b!1442177 res!973775) b!1442172))

(assert (= (and b!1442172 res!973783) b!1442174))

(assert (= (and b!1442174 res!973777) b!1442176))

(assert (= (and b!1442176 res!973781) b!1442178))

(assert (= (and b!1442178 res!973779) b!1442175))

(assert (= (and b!1442175 res!973774) b!1442182))

(assert (= (and b!1442182 res!973780) b!1442173))

(assert (= (and b!1442173 res!973778) b!1442180))

(declare-fun m!1331521 () Bool)

(assert (=> b!1442177 m!1331521))

(assert (=> b!1442177 m!1331521))

(declare-fun m!1331523 () Bool)

(assert (=> b!1442177 m!1331523))

(declare-fun m!1331525 () Bool)

(assert (=> b!1442174 m!1331525))

(declare-fun m!1331527 () Bool)

(assert (=> b!1442176 m!1331527))

(declare-fun m!1331529 () Bool)

(assert (=> b!1442176 m!1331529))

(declare-fun m!1331531 () Bool)

(assert (=> start!124734 m!1331531))

(declare-fun m!1331533 () Bool)

(assert (=> start!124734 m!1331533))

(assert (=> b!1442175 m!1331521))

(assert (=> b!1442175 m!1331521))

(declare-fun m!1331535 () Bool)

(assert (=> b!1442175 m!1331535))

(declare-fun m!1331537 () Bool)

(assert (=> b!1442172 m!1331537))

(declare-fun m!1331539 () Bool)

(assert (=> b!1442179 m!1331539))

(assert (=> b!1442179 m!1331539))

(declare-fun m!1331541 () Bool)

(assert (=> b!1442179 m!1331541))

(assert (=> b!1442182 m!1331527))

(declare-fun m!1331543 () Bool)

(assert (=> b!1442182 m!1331543))

(assert (=> b!1442182 m!1331543))

(declare-fun m!1331545 () Bool)

(assert (=> b!1442182 m!1331545))

(assert (=> b!1442182 m!1331545))

(assert (=> b!1442182 m!1331543))

(declare-fun m!1331547 () Bool)

(assert (=> b!1442182 m!1331547))

(assert (=> b!1442180 m!1331527))

(assert (=> b!1442180 m!1331543))

(assert (=> b!1442180 m!1331543))

(declare-fun m!1331549 () Bool)

(assert (=> b!1442180 m!1331549))

(assert (=> b!1442178 m!1331521))

(assert (=> b!1442178 m!1331521))

(declare-fun m!1331551 () Bool)

(assert (=> b!1442178 m!1331551))

(assert (=> b!1442178 m!1331551))

(assert (=> b!1442178 m!1331521))

(declare-fun m!1331553 () Bool)

(assert (=> b!1442178 m!1331553))

(check-sat (not b!1442180) (not b!1442179) (not b!1442178) (not b!1442182) (not b!1442172) (not start!124734) (not b!1442174) (not b!1442177) (not b!1442175))
(check-sat)
