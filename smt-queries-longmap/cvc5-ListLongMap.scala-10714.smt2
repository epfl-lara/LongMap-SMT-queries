; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125704 () Bool)

(assert start!125704)

(declare-fun b!1469112 () Bool)

(declare-fun res!996557 () Bool)

(declare-fun e!825317 () Bool)

(assert (=> b!1469112 (=> (not res!996557) (not e!825317))))

(declare-datatypes ((array!98990 0))(
  ( (array!98991 (arr!47778 (Array (_ BitVec 32) (_ BitVec 64))) (size!48329 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98990)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98990 (_ BitVec 32)) Bool)

(assert (=> b!1469112 (= res!996557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469113 () Bool)

(declare-fun res!996553 () Bool)

(assert (=> b!1469113 (=> (not res!996553) (not e!825317))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469113 (= res!996553 (validKeyInArray!0 (select (arr!47778 a!2862) i!1006)))))

(declare-fun b!1469114 () Bool)

(declare-fun res!996556 () Bool)

(assert (=> b!1469114 (=> (not res!996556) (not e!825317))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469114 (= res!996556 (validKeyInArray!0 (select (arr!47778 a!2862) j!93)))))

(declare-fun b!1469115 () Bool)

(assert (=> b!1469115 (= e!825317 false)))

(declare-fun lt!642730 () Bool)

(declare-datatypes ((List!34266 0))(
  ( (Nil!34263) (Cons!34262 (h!35626 (_ BitVec 64)) (t!48952 List!34266)) )
))
(declare-fun arrayNoDuplicates!0 (array!98990 (_ BitVec 32) List!34266) Bool)

(assert (=> b!1469115 (= lt!642730 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34263))))

(declare-fun res!996555 () Bool)

(assert (=> start!125704 (=> (not res!996555) (not e!825317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125704 (= res!996555 (validMask!0 mask!2687))))

(assert (=> start!125704 e!825317))

(assert (=> start!125704 true))

(declare-fun array_inv!37059 (array!98990) Bool)

(assert (=> start!125704 (array_inv!37059 a!2862)))

(declare-fun b!1469116 () Bool)

(declare-fun res!996554 () Bool)

(assert (=> b!1469116 (=> (not res!996554) (not e!825317))))

(assert (=> b!1469116 (= res!996554 (and (= (size!48329 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48329 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48329 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125704 res!996555) b!1469116))

(assert (= (and b!1469116 res!996554) b!1469113))

(assert (= (and b!1469113 res!996553) b!1469114))

(assert (= (and b!1469114 res!996556) b!1469112))

(assert (= (and b!1469112 res!996557) b!1469115))

(declare-fun m!1356027 () Bool)

(assert (=> b!1469113 m!1356027))

(assert (=> b!1469113 m!1356027))

(declare-fun m!1356029 () Bool)

(assert (=> b!1469113 m!1356029))

(declare-fun m!1356031 () Bool)

(assert (=> b!1469115 m!1356031))

(declare-fun m!1356033 () Bool)

(assert (=> b!1469114 m!1356033))

(assert (=> b!1469114 m!1356033))

(declare-fun m!1356035 () Bool)

(assert (=> b!1469114 m!1356035))

(declare-fun m!1356037 () Bool)

(assert (=> b!1469112 m!1356037))

(declare-fun m!1356039 () Bool)

(assert (=> start!125704 m!1356039))

(declare-fun m!1356041 () Bool)

(assert (=> start!125704 m!1356041))

(push 1)

(assert (not b!1469115))

(assert (not b!1469112))

(assert (not b!1469114))

(assert (not b!1469113))

(assert (not start!125704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

