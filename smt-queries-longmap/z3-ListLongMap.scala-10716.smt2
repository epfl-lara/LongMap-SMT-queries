; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125436 () Bool)

(assert start!125436)

(declare-fun b!1467479 () Bool)

(declare-fun res!996018 () Bool)

(declare-fun e!824284 () Bool)

(assert (=> b!1467479 (=> (not res!996018) (not e!824284))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98884 0))(
  ( (array!98885 (arr!47730 (Array (_ BitVec 32) (_ BitVec 64))) (size!48280 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98884)

(assert (=> b!1467479 (= res!996018 (and (= (size!48280 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48280 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48280 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467480 () Bool)

(assert (=> b!1467480 (= e!824284 false)))

(declare-fun lt!642108 () Bool)

(declare-datatypes ((List!34231 0))(
  ( (Nil!34228) (Cons!34227 (h!35577 (_ BitVec 64)) (t!48925 List!34231)) )
))
(declare-fun arrayNoDuplicates!0 (array!98884 (_ BitVec 32) List!34231) Bool)

(assert (=> b!1467480 (= lt!642108 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34228))))

(declare-fun res!996020 () Bool)

(assert (=> start!125436 (=> (not res!996020) (not e!824284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125436 (= res!996020 (validMask!0 mask!2687))))

(assert (=> start!125436 e!824284))

(assert (=> start!125436 true))

(declare-fun array_inv!36758 (array!98884) Bool)

(assert (=> start!125436 (array_inv!36758 a!2862)))

(declare-fun b!1467481 () Bool)

(declare-fun res!996021 () Bool)

(assert (=> b!1467481 (=> (not res!996021) (not e!824284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467481 (= res!996021 (validKeyInArray!0 (select (arr!47730 a!2862) i!1006)))))

(declare-fun b!1467482 () Bool)

(declare-fun res!996022 () Bool)

(assert (=> b!1467482 (=> (not res!996022) (not e!824284))))

(assert (=> b!1467482 (= res!996022 (validKeyInArray!0 (select (arr!47730 a!2862) j!93)))))

(declare-fun b!1467483 () Bool)

(declare-fun res!996019 () Bool)

(assert (=> b!1467483 (=> (not res!996019) (not e!824284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98884 (_ BitVec 32)) Bool)

(assert (=> b!1467483 (= res!996019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125436 res!996020) b!1467479))

(assert (= (and b!1467479 res!996018) b!1467481))

(assert (= (and b!1467481 res!996021) b!1467482))

(assert (= (and b!1467482 res!996022) b!1467483))

(assert (= (and b!1467483 res!996019) b!1467480))

(declare-fun m!1354421 () Bool)

(assert (=> b!1467480 m!1354421))

(declare-fun m!1354423 () Bool)

(assert (=> b!1467481 m!1354423))

(assert (=> b!1467481 m!1354423))

(declare-fun m!1354425 () Bool)

(assert (=> b!1467481 m!1354425))

(declare-fun m!1354427 () Bool)

(assert (=> b!1467482 m!1354427))

(assert (=> b!1467482 m!1354427))

(declare-fun m!1354429 () Bool)

(assert (=> b!1467482 m!1354429))

(declare-fun m!1354431 () Bool)

(assert (=> start!125436 m!1354431))

(declare-fun m!1354433 () Bool)

(assert (=> start!125436 m!1354433))

(declare-fun m!1354435 () Bool)

(assert (=> b!1467483 m!1354435))

(check-sat (not start!125436) (not b!1467483) (not b!1467482) (not b!1467480) (not b!1467481))
