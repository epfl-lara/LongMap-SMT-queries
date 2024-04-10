; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125432 () Bool)

(assert start!125432)

(declare-fun b!1467449 () Bool)

(declare-fun e!824272 () Bool)

(assert (=> b!1467449 (= e!824272 false)))

(declare-fun lt!642102 () Bool)

(declare-datatypes ((array!98880 0))(
  ( (array!98881 (arr!47728 (Array (_ BitVec 32) (_ BitVec 64))) (size!48278 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98880)

(declare-datatypes ((List!34229 0))(
  ( (Nil!34226) (Cons!34225 (h!35575 (_ BitVec 64)) (t!48923 List!34229)) )
))
(declare-fun arrayNoDuplicates!0 (array!98880 (_ BitVec 32) List!34229) Bool)

(assert (=> b!1467449 (= lt!642102 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34226))))

(declare-fun b!1467450 () Bool)

(declare-fun res!995989 () Bool)

(assert (=> b!1467450 (=> (not res!995989) (not e!824272))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98880 (_ BitVec 32)) Bool)

(assert (=> b!1467450 (= res!995989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!995992 () Bool)

(assert (=> start!125432 (=> (not res!995992) (not e!824272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125432 (= res!995992 (validMask!0 mask!2687))))

(assert (=> start!125432 e!824272))

(assert (=> start!125432 true))

(declare-fun array_inv!36756 (array!98880) Bool)

(assert (=> start!125432 (array_inv!36756 a!2862)))

(declare-fun b!1467451 () Bool)

(declare-fun res!995991 () Bool)

(assert (=> b!1467451 (=> (not res!995991) (not e!824272))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467451 (= res!995991 (validKeyInArray!0 (select (arr!47728 a!2862) i!1006)))))

(declare-fun b!1467452 () Bool)

(declare-fun res!995990 () Bool)

(assert (=> b!1467452 (=> (not res!995990) (not e!824272))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467452 (= res!995990 (validKeyInArray!0 (select (arr!47728 a!2862) j!93)))))

(declare-fun b!1467453 () Bool)

(declare-fun res!995988 () Bool)

(assert (=> b!1467453 (=> (not res!995988) (not e!824272))))

(assert (=> b!1467453 (= res!995988 (and (= (size!48278 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48278 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48278 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125432 res!995992) b!1467453))

(assert (= (and b!1467453 res!995988) b!1467451))

(assert (= (and b!1467451 res!995991) b!1467452))

(assert (= (and b!1467452 res!995990) b!1467450))

(assert (= (and b!1467450 res!995989) b!1467449))

(declare-fun m!1354389 () Bool)

(assert (=> b!1467451 m!1354389))

(assert (=> b!1467451 m!1354389))

(declare-fun m!1354391 () Bool)

(assert (=> b!1467451 m!1354391))

(declare-fun m!1354393 () Bool)

(assert (=> b!1467452 m!1354393))

(assert (=> b!1467452 m!1354393))

(declare-fun m!1354395 () Bool)

(assert (=> b!1467452 m!1354395))

(declare-fun m!1354397 () Bool)

(assert (=> start!125432 m!1354397))

(declare-fun m!1354399 () Bool)

(assert (=> start!125432 m!1354399))

(declare-fun m!1354401 () Bool)

(assert (=> b!1467450 m!1354401))

(declare-fun m!1354403 () Bool)

(assert (=> b!1467449 m!1354403))

(push 1)

(assert (not b!1467452))

(assert (not b!1467451))

(assert (not b!1467450))

(assert (not b!1467449))

(assert (not start!125432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

