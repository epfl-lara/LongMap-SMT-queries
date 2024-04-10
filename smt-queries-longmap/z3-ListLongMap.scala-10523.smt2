; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124110 () Bool)

(assert start!124110)

(declare-fun res!969651 () Bool)

(declare-fun e!810749 () Bool)

(assert (=> start!124110 (=> (not res!969651) (not e!810749))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124110 (= res!969651 (validMask!0 mask!2687))))

(assert (=> start!124110 e!810749))

(assert (=> start!124110 true))

(declare-datatypes ((array!97714 0))(
  ( (array!97715 (arr!47151 (Array (_ BitVec 32) (_ BitVec 64))) (size!47701 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97714)

(declare-fun array_inv!36179 (array!97714) Bool)

(assert (=> start!124110 (array_inv!36179 a!2862)))

(declare-fun b!1436763 () Bool)

(declare-fun res!969646 () Bool)

(assert (=> b!1436763 (=> (not res!969646) (not e!810749))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436763 (= res!969646 (validKeyInArray!0 (select (arr!47151 a!2862) j!93)))))

(declare-fun b!1436764 () Bool)

(declare-fun res!969650 () Bool)

(assert (=> b!1436764 (=> (not res!969650) (not e!810749))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436764 (= res!969650 (validKeyInArray!0 (select (arr!47151 a!2862) i!1006)))))

(declare-fun b!1436765 () Bool)

(declare-fun res!969652 () Bool)

(assert (=> b!1436765 (=> (not res!969652) (not e!810749))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436765 (= res!969652 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47701 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47701 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47701 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436766 () Bool)

(declare-fun res!969647 () Bool)

(assert (=> b!1436766 (=> (not res!969647) (not e!810749))))

(assert (=> b!1436766 (= res!969647 (and (= (size!47701 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47701 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47701 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436767 () Bool)

(declare-fun res!969649 () Bool)

(assert (=> b!1436767 (=> (not res!969649) (not e!810749))))

(declare-datatypes ((List!33652 0))(
  ( (Nil!33649) (Cons!33648 (h!34986 (_ BitVec 64)) (t!48346 List!33652)) )
))
(declare-fun arrayNoDuplicates!0 (array!97714 (_ BitVec 32) List!33652) Bool)

(assert (=> b!1436767 (= res!969649 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33649))))

(declare-fun b!1436768 () Bool)

(assert (=> b!1436768 (= e!810749 false)))

(declare-fun lt!632208 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436768 (= lt!632208 (toIndex!0 (select (arr!47151 a!2862) j!93) mask!2687))))

(declare-fun b!1436769 () Bool)

(declare-fun res!969648 () Bool)

(assert (=> b!1436769 (=> (not res!969648) (not e!810749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97714 (_ BitVec 32)) Bool)

(assert (=> b!1436769 (= res!969648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124110 res!969651) b!1436766))

(assert (= (and b!1436766 res!969647) b!1436764))

(assert (= (and b!1436764 res!969650) b!1436763))

(assert (= (and b!1436763 res!969646) b!1436769))

(assert (= (and b!1436769 res!969648) b!1436767))

(assert (= (and b!1436767 res!969649) b!1436765))

(assert (= (and b!1436765 res!969652) b!1436768))

(declare-fun m!1326053 () Bool)

(assert (=> b!1436768 m!1326053))

(assert (=> b!1436768 m!1326053))

(declare-fun m!1326055 () Bool)

(assert (=> b!1436768 m!1326055))

(declare-fun m!1326057 () Bool)

(assert (=> b!1436765 m!1326057))

(declare-fun m!1326059 () Bool)

(assert (=> b!1436765 m!1326059))

(declare-fun m!1326061 () Bool)

(assert (=> start!124110 m!1326061))

(declare-fun m!1326063 () Bool)

(assert (=> start!124110 m!1326063))

(declare-fun m!1326065 () Bool)

(assert (=> b!1436764 m!1326065))

(assert (=> b!1436764 m!1326065))

(declare-fun m!1326067 () Bool)

(assert (=> b!1436764 m!1326067))

(assert (=> b!1436763 m!1326053))

(assert (=> b!1436763 m!1326053))

(declare-fun m!1326069 () Bool)

(assert (=> b!1436763 m!1326069))

(declare-fun m!1326071 () Bool)

(assert (=> b!1436767 m!1326071))

(declare-fun m!1326073 () Bool)

(assert (=> b!1436769 m!1326073))

(check-sat (not b!1436763) (not b!1436769) (not start!124110) (not b!1436768) (not b!1436767) (not b!1436764))
