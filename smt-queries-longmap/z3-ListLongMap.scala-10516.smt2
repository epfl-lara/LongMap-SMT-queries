; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123986 () Bool)

(assert start!123986)

(declare-fun res!969047 () Bool)

(declare-fun e!810396 () Bool)

(assert (=> start!123986 (=> (not res!969047) (not e!810396))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123986 (= res!969047 (validMask!0 mask!2687))))

(assert (=> start!123986 e!810396))

(assert (=> start!123986 true))

(declare-datatypes ((array!97614 0))(
  ( (array!97615 (arr!47104 (Array (_ BitVec 32) (_ BitVec 64))) (size!47656 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97614)

(declare-fun array_inv!36337 (array!97614) Bool)

(assert (=> start!123986 (array_inv!36337 a!2862)))

(declare-fun b!1435987 () Bool)

(declare-fun res!969046 () Bool)

(assert (=> b!1435987 (=> (not res!969046) (not e!810396))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435987 (= res!969046 (validKeyInArray!0 (select (arr!47104 a!2862) i!1006)))))

(declare-fun b!1435988 () Bool)

(declare-fun res!969044 () Bool)

(assert (=> b!1435988 (=> (not res!969044) (not e!810396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97614 (_ BitVec 32)) Bool)

(assert (=> b!1435988 (= res!969044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435989 () Bool)

(declare-fun res!969048 () Bool)

(assert (=> b!1435989 (=> (not res!969048) (not e!810396))))

(declare-datatypes ((List!33683 0))(
  ( (Nil!33680) (Cons!33679 (h!35014 (_ BitVec 64)) (t!48369 List!33683)) )
))
(declare-fun arrayNoDuplicates!0 (array!97614 (_ BitVec 32) List!33683) Bool)

(assert (=> b!1435989 (= res!969048 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33680))))

(declare-fun b!1435990 () Bool)

(declare-fun res!969049 () Bool)

(assert (=> b!1435990 (=> (not res!969049) (not e!810396))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1435990 (= res!969049 (and (= (size!47656 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47656 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47656 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1435991 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1435991 (= e!810396 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47656 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47656 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47656 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47104 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1435992 () Bool)

(declare-fun res!969045 () Bool)

(assert (=> b!1435992 (=> (not res!969045) (not e!810396))))

(assert (=> b!1435992 (= res!969045 (validKeyInArray!0 (select (arr!47104 a!2862) j!93)))))

(assert (= (and start!123986 res!969047) b!1435990))

(assert (= (and b!1435990 res!969049) b!1435987))

(assert (= (and b!1435987 res!969046) b!1435992))

(assert (= (and b!1435992 res!969045) b!1435988))

(assert (= (and b!1435988 res!969044) b!1435989))

(assert (= (and b!1435989 res!969048) b!1435991))

(declare-fun m!1324841 () Bool)

(assert (=> b!1435991 m!1324841))

(declare-fun m!1324843 () Bool)

(assert (=> b!1435991 m!1324843))

(declare-fun m!1324845 () Bool)

(assert (=> b!1435989 m!1324845))

(declare-fun m!1324847 () Bool)

(assert (=> b!1435992 m!1324847))

(assert (=> b!1435992 m!1324847))

(declare-fun m!1324849 () Bool)

(assert (=> b!1435992 m!1324849))

(declare-fun m!1324851 () Bool)

(assert (=> b!1435988 m!1324851))

(declare-fun m!1324853 () Bool)

(assert (=> b!1435987 m!1324853))

(assert (=> b!1435987 m!1324853))

(declare-fun m!1324855 () Bool)

(assert (=> b!1435987 m!1324855))

(declare-fun m!1324857 () Bool)

(assert (=> start!123986 m!1324857))

(declare-fun m!1324859 () Bool)

(assert (=> start!123986 m!1324859))

(check-sat (not start!123986) (not b!1435987) (not b!1435992) (not b!1435989) (not b!1435988))
(check-sat)
