; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125408 () Bool)

(assert start!125408)

(declare-fun b!1467299 () Bool)

(declare-fun res!995958 () Bool)

(declare-fun e!824174 () Bool)

(assert (=> b!1467299 (=> (not res!995958) (not e!824174))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98834 0))(
  ( (array!98835 (arr!47706 (Array (_ BitVec 32) (_ BitVec 64))) (size!48258 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98834)

(assert (=> b!1467299 (= res!995958 (and (= (size!48258 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48258 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48258 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!995959 () Bool)

(assert (=> start!125408 (=> (not res!995959) (not e!824174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125408 (= res!995959 (validMask!0 mask!2687))))

(assert (=> start!125408 e!824174))

(assert (=> start!125408 true))

(declare-fun array_inv!36939 (array!98834) Bool)

(assert (=> start!125408 (array_inv!36939 a!2862)))

(declare-fun b!1467300 () Bool)

(declare-fun res!995955 () Bool)

(assert (=> b!1467300 (=> (not res!995955) (not e!824174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467300 (= res!995955 (validKeyInArray!0 (select (arr!47706 a!2862) i!1006)))))

(declare-fun b!1467301 () Bool)

(declare-fun res!995957 () Bool)

(assert (=> b!1467301 (=> (not res!995957) (not e!824174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98834 (_ BitVec 32)) Bool)

(assert (=> b!1467301 (= res!995957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467302 () Bool)

(declare-fun res!995956 () Bool)

(assert (=> b!1467302 (=> (not res!995956) (not e!824174))))

(assert (=> b!1467302 (= res!995956 (validKeyInArray!0 (select (arr!47706 a!2862) j!93)))))

(declare-fun b!1467303 () Bool)

(assert (=> b!1467303 (= e!824174 false)))

(declare-fun lt!641877 () Bool)

(declare-datatypes ((List!34285 0))(
  ( (Nil!34282) (Cons!34281 (h!35631 (_ BitVec 64)) (t!48971 List!34285)) )
))
(declare-fun arrayNoDuplicates!0 (array!98834 (_ BitVec 32) List!34285) Bool)

(assert (=> b!1467303 (= lt!641877 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34282))))

(assert (= (and start!125408 res!995959) b!1467299))

(assert (= (and b!1467299 res!995958) b!1467300))

(assert (= (and b!1467300 res!995955) b!1467302))

(assert (= (and b!1467302 res!995956) b!1467301))

(assert (= (and b!1467301 res!995957) b!1467303))

(declare-fun m!1353761 () Bool)

(assert (=> b!1467301 m!1353761))

(declare-fun m!1353763 () Bool)

(assert (=> b!1467300 m!1353763))

(assert (=> b!1467300 m!1353763))

(declare-fun m!1353765 () Bool)

(assert (=> b!1467300 m!1353765))

(declare-fun m!1353767 () Bool)

(assert (=> start!125408 m!1353767))

(declare-fun m!1353769 () Bool)

(assert (=> start!125408 m!1353769))

(declare-fun m!1353771 () Bool)

(assert (=> b!1467303 m!1353771))

(declare-fun m!1353773 () Bool)

(assert (=> b!1467302 m!1353773))

(assert (=> b!1467302 m!1353773))

(declare-fun m!1353775 () Bool)

(assert (=> b!1467302 m!1353775))

(push 1)

(assert (not b!1467303))

(assert (not b!1467302))

(assert (not b!1467301))

(assert (not start!125408))

(assert (not b!1467300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

