; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125428 () Bool)

(assert start!125428)

(declare-fun res!995962 () Bool)

(declare-fun e!824260 () Bool)

(assert (=> start!125428 (=> (not res!995962) (not e!824260))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125428 (= res!995962 (validMask!0 mask!2687))))

(assert (=> start!125428 e!824260))

(assert (=> start!125428 true))

(declare-datatypes ((array!98876 0))(
  ( (array!98877 (arr!47726 (Array (_ BitVec 32) (_ BitVec 64))) (size!48276 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98876)

(declare-fun array_inv!36754 (array!98876) Bool)

(assert (=> start!125428 (array_inv!36754 a!2862)))

(declare-fun b!1467419 () Bool)

(declare-fun res!995958 () Bool)

(assert (=> b!1467419 (=> (not res!995958) (not e!824260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98876 (_ BitVec 32)) Bool)

(assert (=> b!1467419 (= res!995958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467420 () Bool)

(assert (=> b!1467420 (= e!824260 false)))

(declare-fun lt!642096 () Bool)

(declare-datatypes ((List!34227 0))(
  ( (Nil!34224) (Cons!34223 (h!35573 (_ BitVec 64)) (t!48921 List!34227)) )
))
(declare-fun arrayNoDuplicates!0 (array!98876 (_ BitVec 32) List!34227) Bool)

(assert (=> b!1467420 (= lt!642096 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34224))))

(declare-fun b!1467421 () Bool)

(declare-fun res!995961 () Bool)

(assert (=> b!1467421 (=> (not res!995961) (not e!824260))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467421 (= res!995961 (validKeyInArray!0 (select (arr!47726 a!2862) i!1006)))))

(declare-fun b!1467422 () Bool)

(declare-fun res!995959 () Bool)

(assert (=> b!1467422 (=> (not res!995959) (not e!824260))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467422 (= res!995959 (validKeyInArray!0 (select (arr!47726 a!2862) j!93)))))

(declare-fun b!1467423 () Bool)

(declare-fun res!995960 () Bool)

(assert (=> b!1467423 (=> (not res!995960) (not e!824260))))

(assert (=> b!1467423 (= res!995960 (and (= (size!48276 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48276 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48276 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125428 res!995962) b!1467423))

(assert (= (and b!1467423 res!995960) b!1467421))

(assert (= (and b!1467421 res!995961) b!1467422))

(assert (= (and b!1467422 res!995959) b!1467419))

(assert (= (and b!1467419 res!995958) b!1467420))

(declare-fun m!1354357 () Bool)

(assert (=> b!1467421 m!1354357))

(assert (=> b!1467421 m!1354357))

(declare-fun m!1354359 () Bool)

(assert (=> b!1467421 m!1354359))

(declare-fun m!1354361 () Bool)

(assert (=> start!125428 m!1354361))

(declare-fun m!1354363 () Bool)

(assert (=> start!125428 m!1354363))

(declare-fun m!1354365 () Bool)

(assert (=> b!1467420 m!1354365))

(declare-fun m!1354367 () Bool)

(assert (=> b!1467419 m!1354367))

(declare-fun m!1354369 () Bool)

(assert (=> b!1467422 m!1354369))

(assert (=> b!1467422 m!1354369))

(declare-fun m!1354371 () Bool)

(assert (=> b!1467422 m!1354371))

(push 1)

(assert (not b!1467420))

(assert (not b!1467421))

(assert (not b!1467422))

(assert (not b!1467419))

(assert (not start!125428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

