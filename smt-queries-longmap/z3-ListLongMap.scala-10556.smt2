; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124692 () Bool)

(assert start!124692)

(declare-fun b!1441565 () Bool)

(declare-fun res!973168 () Bool)

(declare-fun e!812961 () Bool)

(assert (=> b!1441565 (=> (not res!973168) (not e!812961))))

(declare-datatypes ((array!98035 0))(
  ( (array!98036 (arr!47302 (Array (_ BitVec 32) (_ BitVec 64))) (size!47853 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98035)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98035 (_ BitVec 32)) Bool)

(assert (=> b!1441565 (= res!973168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441566 () Bool)

(declare-fun res!973174 () Bool)

(assert (=> b!1441566 (=> (not res!973174) (not e!812961))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441566 (= res!973174 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47853 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47853 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47853 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441567 () Bool)

(declare-fun res!973172 () Bool)

(assert (=> b!1441567 (=> (not res!973172) (not e!812961))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441567 (= res!973172 (validKeyInArray!0 (select (arr!47302 a!2862) j!93)))))

(declare-fun b!1441568 () Bool)

(declare-fun res!973170 () Bool)

(assert (=> b!1441568 (=> (not res!973170) (not e!812961))))

(assert (=> b!1441568 (= res!973170 (validKeyInArray!0 (select (arr!47302 a!2862) i!1006)))))

(declare-fun b!1441569 () Bool)

(declare-fun e!812960 () Bool)

(assert (=> b!1441569 (= e!812961 e!812960)))

(declare-fun res!973171 () Bool)

(assert (=> b!1441569 (=> (not res!973171) (not e!812960))))

(declare-datatypes ((SeekEntryResult!11451 0))(
  ( (MissingZero!11451 (index!48196 (_ BitVec 32))) (Found!11451 (index!48197 (_ BitVec 32))) (Intermediate!11451 (undefined!12263 Bool) (index!48198 (_ BitVec 32)) (x!130100 (_ BitVec 32))) (Undefined!11451) (MissingVacant!11451 (index!48199 (_ BitVec 32))) )
))
(declare-fun lt!633414 () SeekEntryResult!11451)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98035 (_ BitVec 32)) SeekEntryResult!11451)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441569 (= res!973171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47302 a!2862) j!93) mask!2687) (select (arr!47302 a!2862) j!93) a!2862 mask!2687) lt!633414))))

(assert (=> b!1441569 (= lt!633414 (Intermediate!11451 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441570 () Bool)

(assert (=> b!1441570 (= e!812960 false)))

(declare-fun lt!633415 () SeekEntryResult!11451)

(assert (=> b!1441570 (= lt!633415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98036 (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47853 a!2862)) mask!2687))))

(declare-fun b!1441571 () Bool)

(declare-fun res!973175 () Bool)

(assert (=> b!1441571 (=> (not res!973175) (not e!812960))))

(assert (=> b!1441571 (= res!973175 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47302 a!2862) j!93) a!2862 mask!2687) lt!633414))))

(declare-fun b!1441572 () Bool)

(declare-fun res!973173 () Bool)

(assert (=> b!1441572 (=> (not res!973173) (not e!812961))))

(assert (=> b!1441572 (= res!973173 (and (= (size!47853 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47853 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47853 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441573 () Bool)

(declare-fun res!973169 () Bool)

(assert (=> b!1441573 (=> (not res!973169) (not e!812961))))

(declare-datatypes ((List!33790 0))(
  ( (Nil!33787) (Cons!33786 (h!35147 (_ BitVec 64)) (t!48476 List!33790)) )
))
(declare-fun arrayNoDuplicates!0 (array!98035 (_ BitVec 32) List!33790) Bool)

(assert (=> b!1441573 (= res!973169 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33787))))

(declare-fun res!973167 () Bool)

(assert (=> start!124692 (=> (not res!973167) (not e!812961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124692 (= res!973167 (validMask!0 mask!2687))))

(assert (=> start!124692 e!812961))

(assert (=> start!124692 true))

(declare-fun array_inv!36583 (array!98035) Bool)

(assert (=> start!124692 (array_inv!36583 a!2862)))

(assert (= (and start!124692 res!973167) b!1441572))

(assert (= (and b!1441572 res!973173) b!1441568))

(assert (= (and b!1441568 res!973170) b!1441567))

(assert (= (and b!1441567 res!973172) b!1441565))

(assert (= (and b!1441565 res!973168) b!1441573))

(assert (= (and b!1441573 res!973169) b!1441566))

(assert (= (and b!1441566 res!973174) b!1441569))

(assert (= (and b!1441569 res!973171) b!1441571))

(assert (= (and b!1441571 res!973175) b!1441570))

(declare-fun m!1330843 () Bool)

(assert (=> start!124692 m!1330843))

(declare-fun m!1330845 () Bool)

(assert (=> start!124692 m!1330845))

(declare-fun m!1330847 () Bool)

(assert (=> b!1441568 m!1330847))

(assert (=> b!1441568 m!1330847))

(declare-fun m!1330849 () Bool)

(assert (=> b!1441568 m!1330849))

(declare-fun m!1330851 () Bool)

(assert (=> b!1441570 m!1330851))

(declare-fun m!1330853 () Bool)

(assert (=> b!1441570 m!1330853))

(assert (=> b!1441570 m!1330853))

(declare-fun m!1330855 () Bool)

(assert (=> b!1441570 m!1330855))

(assert (=> b!1441570 m!1330855))

(assert (=> b!1441570 m!1330853))

(declare-fun m!1330857 () Bool)

(assert (=> b!1441570 m!1330857))

(declare-fun m!1330859 () Bool)

(assert (=> b!1441571 m!1330859))

(assert (=> b!1441571 m!1330859))

(declare-fun m!1330861 () Bool)

(assert (=> b!1441571 m!1330861))

(declare-fun m!1330863 () Bool)

(assert (=> b!1441573 m!1330863))

(declare-fun m!1330865 () Bool)

(assert (=> b!1441565 m!1330865))

(assert (=> b!1441569 m!1330859))

(assert (=> b!1441569 m!1330859))

(declare-fun m!1330867 () Bool)

(assert (=> b!1441569 m!1330867))

(assert (=> b!1441569 m!1330867))

(assert (=> b!1441569 m!1330859))

(declare-fun m!1330869 () Bool)

(assert (=> b!1441569 m!1330869))

(assert (=> b!1441567 m!1330859))

(assert (=> b!1441567 m!1330859))

(declare-fun m!1330871 () Bool)

(assert (=> b!1441567 m!1330871))

(assert (=> b!1441566 m!1330851))

(declare-fun m!1330873 () Bool)

(assert (=> b!1441566 m!1330873))

(check-sat (not b!1441569) (not b!1441571) (not b!1441567) (not b!1441570) (not start!124692) (not b!1441568) (not b!1441573) (not b!1441565))
(check-sat)
