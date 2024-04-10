; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125426 () Bool)

(assert start!125426)

(declare-fun b!1467404 () Bool)

(declare-fun res!995944 () Bool)

(declare-fun e!824254 () Bool)

(assert (=> b!1467404 (=> (not res!995944) (not e!824254))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98874 0))(
  ( (array!98875 (arr!47725 (Array (_ BitVec 32) (_ BitVec 64))) (size!48275 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98874)

(assert (=> b!1467404 (= res!995944 (and (= (size!48275 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48275 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48275 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467406 () Bool)

(declare-fun res!995946 () Bool)

(assert (=> b!1467406 (=> (not res!995946) (not e!824254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467406 (= res!995946 (validKeyInArray!0 (select (arr!47725 a!2862) j!93)))))

(declare-fun b!1467407 () Bool)

(declare-fun res!995943 () Bool)

(assert (=> b!1467407 (=> (not res!995943) (not e!824254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98874 (_ BitVec 32)) Bool)

(assert (=> b!1467407 (= res!995943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467408 () Bool)

(declare-fun res!995945 () Bool)

(assert (=> b!1467408 (=> (not res!995945) (not e!824254))))

(assert (=> b!1467408 (= res!995945 (validKeyInArray!0 (select (arr!47725 a!2862) i!1006)))))

(declare-fun res!995947 () Bool)

(assert (=> start!125426 (=> (not res!995947) (not e!824254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125426 (= res!995947 (validMask!0 mask!2687))))

(assert (=> start!125426 e!824254))

(assert (=> start!125426 true))

(declare-fun array_inv!36753 (array!98874) Bool)

(assert (=> start!125426 (array_inv!36753 a!2862)))

(declare-fun b!1467405 () Bool)

(assert (=> b!1467405 (= e!824254 false)))

(declare-fun lt!642093 () Bool)

(declare-datatypes ((List!34226 0))(
  ( (Nil!34223) (Cons!34222 (h!35572 (_ BitVec 64)) (t!48920 List!34226)) )
))
(declare-fun arrayNoDuplicates!0 (array!98874 (_ BitVec 32) List!34226) Bool)

(assert (=> b!1467405 (= lt!642093 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34223))))

(assert (= (and start!125426 res!995947) b!1467404))

(assert (= (and b!1467404 res!995944) b!1467408))

(assert (= (and b!1467408 res!995945) b!1467406))

(assert (= (and b!1467406 res!995946) b!1467407))

(assert (= (and b!1467407 res!995943) b!1467405))

(declare-fun m!1354341 () Bool)

(assert (=> b!1467408 m!1354341))

(assert (=> b!1467408 m!1354341))

(declare-fun m!1354343 () Bool)

(assert (=> b!1467408 m!1354343))

(declare-fun m!1354345 () Bool)

(assert (=> b!1467406 m!1354345))

(assert (=> b!1467406 m!1354345))

(declare-fun m!1354347 () Bool)

(assert (=> b!1467406 m!1354347))

(declare-fun m!1354349 () Bool)

(assert (=> b!1467405 m!1354349))

(declare-fun m!1354351 () Bool)

(assert (=> b!1467407 m!1354351))

(declare-fun m!1354353 () Bool)

(assert (=> start!125426 m!1354353))

(declare-fun m!1354355 () Bool)

(assert (=> start!125426 m!1354355))

(push 1)

(assert (not b!1467406))

(assert (not b!1467407))

(assert (not start!125426))

(assert (not b!1467408))

(assert (not b!1467405))

(check-sat)

