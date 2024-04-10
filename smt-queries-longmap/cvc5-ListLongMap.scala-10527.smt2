; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124132 () Bool)

(assert start!124132)

(declare-fun b!1437005 () Bool)

(declare-fun res!969890 () Bool)

(declare-fun e!810814 () Bool)

(assert (=> b!1437005 (=> (not res!969890) (not e!810814))))

(declare-datatypes ((array!97736 0))(
  ( (array!97737 (arr!47162 (Array (_ BitVec 32) (_ BitVec 64))) (size!47712 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97736)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437005 (= res!969890 (validKeyInArray!0 (select (arr!47162 a!2862) j!93)))))

(declare-fun b!1437006 () Bool)

(declare-fun res!969893 () Bool)

(assert (=> b!1437006 (=> (not res!969893) (not e!810814))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437006 (= res!969893 (validKeyInArray!0 (select (arr!47162 a!2862) i!1006)))))

(declare-fun b!1437007 () Bool)

(declare-fun res!969895 () Bool)

(assert (=> b!1437007 (=> (not res!969895) (not e!810814))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97736 (_ BitVec 32)) Bool)

(assert (=> b!1437007 (= res!969895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437008 () Bool)

(declare-fun res!969892 () Bool)

(assert (=> b!1437008 (=> (not res!969892) (not e!810814))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11414 0))(
  ( (MissingZero!11414 (index!48048 (_ BitVec 32))) (Found!11414 (index!48049 (_ BitVec 32))) (Intermediate!11414 (undefined!12226 Bool) (index!48050 (_ BitVec 32)) (x!129783 (_ BitVec 32))) (Undefined!11414) (MissingVacant!11414 (index!48051 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97736 (_ BitVec 32)) SeekEntryResult!11414)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437008 (= res!969892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47162 a!2862) j!93) mask!2687) (select (arr!47162 a!2862) j!93) a!2862 mask!2687) (Intermediate!11414 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1437009 () Bool)

(declare-fun res!969894 () Bool)

(assert (=> b!1437009 (=> (not res!969894) (not e!810814))))

(declare-datatypes ((List!33663 0))(
  ( (Nil!33660) (Cons!33659 (h!34997 (_ BitVec 64)) (t!48357 List!33663)) )
))
(declare-fun arrayNoDuplicates!0 (array!97736 (_ BitVec 32) List!33663) Bool)

(assert (=> b!1437009 (= res!969894 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33660))))

(declare-fun b!1437010 () Bool)

(declare-fun res!969888 () Bool)

(assert (=> b!1437010 (=> (not res!969888) (not e!810814))))

(assert (=> b!1437010 (= res!969888 (and (= (size!47712 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47712 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47712 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437012 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437012 (= e!810814 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1437011 () Bool)

(declare-fun res!969889 () Bool)

(assert (=> b!1437011 (=> (not res!969889) (not e!810814))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437011 (= res!969889 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47712 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47712 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47712 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47162 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!969891 () Bool)

(assert (=> start!124132 (=> (not res!969891) (not e!810814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124132 (= res!969891 (validMask!0 mask!2687))))

(assert (=> start!124132 e!810814))

(assert (=> start!124132 true))

(declare-fun array_inv!36190 (array!97736) Bool)

(assert (=> start!124132 (array_inv!36190 a!2862)))

(assert (= (and start!124132 res!969891) b!1437010))

(assert (= (and b!1437010 res!969888) b!1437006))

(assert (= (and b!1437006 res!969893) b!1437005))

(assert (= (and b!1437005 res!969890) b!1437007))

(assert (= (and b!1437007 res!969895) b!1437009))

(assert (= (and b!1437009 res!969894) b!1437011))

(assert (= (and b!1437011 res!969889) b!1437008))

(assert (= (and b!1437008 res!969892) b!1437012))

(declare-fun m!1326313 () Bool)

(assert (=> b!1437007 m!1326313))

(declare-fun m!1326315 () Bool)

(assert (=> b!1437006 m!1326315))

(assert (=> b!1437006 m!1326315))

(declare-fun m!1326317 () Bool)

(assert (=> b!1437006 m!1326317))

(declare-fun m!1326319 () Bool)

(assert (=> b!1437009 m!1326319))

(declare-fun m!1326321 () Bool)

(assert (=> b!1437008 m!1326321))

(assert (=> b!1437008 m!1326321))

(declare-fun m!1326323 () Bool)

(assert (=> b!1437008 m!1326323))

(assert (=> b!1437008 m!1326323))

(assert (=> b!1437008 m!1326321))

(declare-fun m!1326325 () Bool)

(assert (=> b!1437008 m!1326325))

(declare-fun m!1326327 () Bool)

(assert (=> start!124132 m!1326327))

(declare-fun m!1326329 () Bool)

(assert (=> start!124132 m!1326329))

(assert (=> b!1437005 m!1326321))

(assert (=> b!1437005 m!1326321))

(declare-fun m!1326331 () Bool)

(assert (=> b!1437005 m!1326331))

(declare-fun m!1326333 () Bool)

(assert (=> b!1437011 m!1326333))

(declare-fun m!1326335 () Bool)

(assert (=> b!1437011 m!1326335))

(push 1)

(assert (not start!124132))

(assert (not b!1437008))

(assert (not b!1437007))

(assert (not b!1437006))

(assert (not b!1437005))

(assert (not b!1437009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

