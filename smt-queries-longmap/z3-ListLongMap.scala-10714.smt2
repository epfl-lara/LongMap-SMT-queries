; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125424 () Bool)

(assert start!125424)

(declare-fun b!1467389 () Bool)

(declare-fun e!824249 () Bool)

(assert (=> b!1467389 (= e!824249 false)))

(declare-fun lt!642090 () Bool)

(declare-datatypes ((array!98872 0))(
  ( (array!98873 (arr!47724 (Array (_ BitVec 32) (_ BitVec 64))) (size!48274 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98872)

(declare-datatypes ((List!34225 0))(
  ( (Nil!34222) (Cons!34221 (h!35571 (_ BitVec 64)) (t!48919 List!34225)) )
))
(declare-fun arrayNoDuplicates!0 (array!98872 (_ BitVec 32) List!34225) Bool)

(assert (=> b!1467389 (= lt!642090 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34222))))

(declare-fun b!1467390 () Bool)

(declare-fun res!995931 () Bool)

(assert (=> b!1467390 (=> (not res!995931) (not e!824249))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467390 (= res!995931 (validKeyInArray!0 (select (arr!47724 a!2862) i!1006)))))

(declare-fun b!1467391 () Bool)

(declare-fun res!995929 () Bool)

(assert (=> b!1467391 (=> (not res!995929) (not e!824249))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98872 (_ BitVec 32)) Bool)

(assert (=> b!1467391 (= res!995929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467392 () Bool)

(declare-fun res!995932 () Bool)

(assert (=> b!1467392 (=> (not res!995932) (not e!824249))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467392 (= res!995932 (validKeyInArray!0 (select (arr!47724 a!2862) j!93)))))

(declare-fun b!1467393 () Bool)

(declare-fun res!995928 () Bool)

(assert (=> b!1467393 (=> (not res!995928) (not e!824249))))

(assert (=> b!1467393 (= res!995928 (and (= (size!48274 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48274 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48274 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!995930 () Bool)

(assert (=> start!125424 (=> (not res!995930) (not e!824249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125424 (= res!995930 (validMask!0 mask!2687))))

(assert (=> start!125424 e!824249))

(assert (=> start!125424 true))

(declare-fun array_inv!36752 (array!98872) Bool)

(assert (=> start!125424 (array_inv!36752 a!2862)))

(assert (= (and start!125424 res!995930) b!1467393))

(assert (= (and b!1467393 res!995928) b!1467390))

(assert (= (and b!1467390 res!995931) b!1467392))

(assert (= (and b!1467392 res!995932) b!1467391))

(assert (= (and b!1467391 res!995929) b!1467389))

(declare-fun m!1354325 () Bool)

(assert (=> b!1467389 m!1354325))

(declare-fun m!1354327 () Bool)

(assert (=> b!1467392 m!1354327))

(assert (=> b!1467392 m!1354327))

(declare-fun m!1354329 () Bool)

(assert (=> b!1467392 m!1354329))

(declare-fun m!1354331 () Bool)

(assert (=> b!1467390 m!1354331))

(assert (=> b!1467390 m!1354331))

(declare-fun m!1354333 () Bool)

(assert (=> b!1467390 m!1354333))

(declare-fun m!1354335 () Bool)

(assert (=> b!1467391 m!1354335))

(declare-fun m!1354337 () Bool)

(assert (=> start!125424 m!1354337))

(declare-fun m!1354339 () Bool)

(assert (=> start!125424 m!1354339))

(check-sat (not b!1467390) (not b!1467392) (not b!1467389) (not start!125424) (not b!1467391))
