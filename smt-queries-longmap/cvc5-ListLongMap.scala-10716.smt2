; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125434 () Bool)

(assert start!125434)

(declare-fun b!1467464 () Bool)

(declare-fun res!996005 () Bool)

(declare-fun e!824279 () Bool)

(assert (=> b!1467464 (=> (not res!996005) (not e!824279))))

(declare-datatypes ((array!98882 0))(
  ( (array!98883 (arr!47729 (Array (_ BitVec 32) (_ BitVec 64))) (size!48279 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98882)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467464 (= res!996005 (validKeyInArray!0 (select (arr!47729 a!2862) j!93)))))

(declare-fun b!1467465 () Bool)

(declare-fun res!996006 () Bool)

(assert (=> b!1467465 (=> (not res!996006) (not e!824279))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467465 (= res!996006 (validKeyInArray!0 (select (arr!47729 a!2862) i!1006)))))

(declare-fun res!996004 () Bool)

(assert (=> start!125434 (=> (not res!996004) (not e!824279))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125434 (= res!996004 (validMask!0 mask!2687))))

(assert (=> start!125434 e!824279))

(assert (=> start!125434 true))

(declare-fun array_inv!36757 (array!98882) Bool)

(assert (=> start!125434 (array_inv!36757 a!2862)))

(declare-fun b!1467466 () Bool)

(assert (=> b!1467466 (= e!824279 false)))

(declare-fun lt!642105 () Bool)

(declare-datatypes ((List!34230 0))(
  ( (Nil!34227) (Cons!34226 (h!35576 (_ BitVec 64)) (t!48924 List!34230)) )
))
(declare-fun arrayNoDuplicates!0 (array!98882 (_ BitVec 32) List!34230) Bool)

(assert (=> b!1467466 (= lt!642105 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34227))))

(declare-fun b!1467467 () Bool)

(declare-fun res!996003 () Bool)

(assert (=> b!1467467 (=> (not res!996003) (not e!824279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98882 (_ BitVec 32)) Bool)

(assert (=> b!1467467 (= res!996003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467468 () Bool)

(declare-fun res!996007 () Bool)

(assert (=> b!1467468 (=> (not res!996007) (not e!824279))))

(assert (=> b!1467468 (= res!996007 (and (= (size!48279 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48279 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48279 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125434 res!996004) b!1467468))

(assert (= (and b!1467468 res!996007) b!1467465))

(assert (= (and b!1467465 res!996006) b!1467464))

(assert (= (and b!1467464 res!996005) b!1467467))

(assert (= (and b!1467467 res!996003) b!1467466))

(declare-fun m!1354405 () Bool)

(assert (=> b!1467467 m!1354405))

(declare-fun m!1354407 () Bool)

(assert (=> b!1467465 m!1354407))

(assert (=> b!1467465 m!1354407))

(declare-fun m!1354409 () Bool)

(assert (=> b!1467465 m!1354409))

(declare-fun m!1354411 () Bool)

(assert (=> b!1467464 m!1354411))

(assert (=> b!1467464 m!1354411))

(declare-fun m!1354413 () Bool)

(assert (=> b!1467464 m!1354413))

(declare-fun m!1354415 () Bool)

(assert (=> b!1467466 m!1354415))

(declare-fun m!1354417 () Bool)

(assert (=> start!125434 m!1354417))

(declare-fun m!1354419 () Bool)

(assert (=> start!125434 m!1354419))

(push 1)

(assert (not b!1467466))

(assert (not b!1467465))

(assert (not b!1467467))

(assert (not b!1467464))

(assert (not start!125434))

(check-sat)

