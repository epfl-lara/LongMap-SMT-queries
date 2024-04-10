; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125444 () Bool)

(assert start!125444)

(declare-fun b!1467555 () Bool)

(declare-fun res!996097 () Bool)

(declare-fun e!824308 () Bool)

(assert (=> b!1467555 (=> (not res!996097) (not e!824308))))

(declare-datatypes ((array!98892 0))(
  ( (array!98893 (arr!47734 (Array (_ BitVec 32) (_ BitVec 64))) (size!48284 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98892)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467555 (= res!996097 (validKeyInArray!0 (select (arr!47734 a!2862) j!93)))))

(declare-fun b!1467556 () Bool)

(declare-fun res!996094 () Bool)

(assert (=> b!1467556 (=> (not res!996094) (not e!824308))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467556 (= res!996094 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48284 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48284 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48284 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467557 () Bool)

(declare-fun res!996099 () Bool)

(assert (=> b!1467557 (=> (not res!996099) (not e!824308))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1467557 (= res!996099 (and (= (size!48284 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48284 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48284 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467559 () Bool)

(assert (=> b!1467559 (= e!824308 false)))

(declare-fun lt!642120 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467559 (= lt!642120 (toIndex!0 (select (arr!47734 a!2862) j!93) mask!2687))))

(declare-fun b!1467560 () Bool)

(declare-fun res!996096 () Bool)

(assert (=> b!1467560 (=> (not res!996096) (not e!824308))))

(assert (=> b!1467560 (= res!996096 (validKeyInArray!0 (select (arr!47734 a!2862) i!1006)))))

(declare-fun b!1467561 () Bool)

(declare-fun res!996100 () Bool)

(assert (=> b!1467561 (=> (not res!996100) (not e!824308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98892 (_ BitVec 32)) Bool)

(assert (=> b!1467561 (= res!996100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996095 () Bool)

(assert (=> start!125444 (=> (not res!996095) (not e!824308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125444 (= res!996095 (validMask!0 mask!2687))))

(assert (=> start!125444 e!824308))

(assert (=> start!125444 true))

(declare-fun array_inv!36762 (array!98892) Bool)

(assert (=> start!125444 (array_inv!36762 a!2862)))

(declare-fun b!1467558 () Bool)

(declare-fun res!996098 () Bool)

(assert (=> b!1467558 (=> (not res!996098) (not e!824308))))

(declare-datatypes ((List!34235 0))(
  ( (Nil!34232) (Cons!34231 (h!35581 (_ BitVec 64)) (t!48929 List!34235)) )
))
(declare-fun arrayNoDuplicates!0 (array!98892 (_ BitVec 32) List!34235) Bool)

(assert (=> b!1467558 (= res!996098 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34232))))

(assert (= (and start!125444 res!996095) b!1467557))

(assert (= (and b!1467557 res!996099) b!1467560))

(assert (= (and b!1467560 res!996096) b!1467555))

(assert (= (and b!1467555 res!996097) b!1467561))

(assert (= (and b!1467561 res!996100) b!1467558))

(assert (= (and b!1467558 res!996098) b!1467556))

(assert (= (and b!1467556 res!996094) b!1467559))

(declare-fun m!1354497 () Bool)

(assert (=> b!1467558 m!1354497))

(declare-fun m!1354499 () Bool)

(assert (=> b!1467559 m!1354499))

(assert (=> b!1467559 m!1354499))

(declare-fun m!1354501 () Bool)

(assert (=> b!1467559 m!1354501))

(declare-fun m!1354503 () Bool)

(assert (=> b!1467556 m!1354503))

(declare-fun m!1354505 () Bool)

(assert (=> b!1467556 m!1354505))

(assert (=> b!1467555 m!1354499))

(assert (=> b!1467555 m!1354499))

(declare-fun m!1354507 () Bool)

(assert (=> b!1467555 m!1354507))

(declare-fun m!1354509 () Bool)

(assert (=> start!125444 m!1354509))

(declare-fun m!1354511 () Bool)

(assert (=> start!125444 m!1354511))

(declare-fun m!1354513 () Bool)

(assert (=> b!1467561 m!1354513))

(declare-fun m!1354515 () Bool)

(assert (=> b!1467560 m!1354515))

(assert (=> b!1467560 m!1354515))

(declare-fun m!1354517 () Bool)

(assert (=> b!1467560 m!1354517))

(push 1)

(assert (not b!1467555))

(assert (not b!1467561))

(assert (not b!1467559))

(assert (not b!1467558))

(assert (not b!1467560))

(assert (not start!125444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

