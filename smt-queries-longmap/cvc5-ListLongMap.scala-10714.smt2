; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125396 () Bool)

(assert start!125396)

(declare-fun b!1467209 () Bool)

(declare-fun res!995867 () Bool)

(declare-fun e!824138 () Bool)

(assert (=> b!1467209 (=> (not res!995867) (not e!824138))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98822 0))(
  ( (array!98823 (arr!47700 (Array (_ BitVec 32) (_ BitVec 64))) (size!48252 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98822)

(assert (=> b!1467209 (= res!995867 (and (= (size!48252 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48252 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48252 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467210 () Bool)

(declare-fun res!995865 () Bool)

(assert (=> b!1467210 (=> (not res!995865) (not e!824138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467210 (= res!995865 (validKeyInArray!0 (select (arr!47700 a!2862) j!93)))))

(declare-fun b!1467212 () Bool)

(assert (=> b!1467212 (= e!824138 false)))

(declare-fun lt!641859 () Bool)

(declare-datatypes ((List!34279 0))(
  ( (Nil!34276) (Cons!34275 (h!35625 (_ BitVec 64)) (t!48965 List!34279)) )
))
(declare-fun arrayNoDuplicates!0 (array!98822 (_ BitVec 32) List!34279) Bool)

(assert (=> b!1467212 (= lt!641859 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34276))))

(declare-fun b!1467213 () Bool)

(declare-fun res!995869 () Bool)

(assert (=> b!1467213 (=> (not res!995869) (not e!824138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98822 (_ BitVec 32)) Bool)

(assert (=> b!1467213 (= res!995869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!995868 () Bool)

(assert (=> start!125396 (=> (not res!995868) (not e!824138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125396 (= res!995868 (validMask!0 mask!2687))))

(assert (=> start!125396 e!824138))

(assert (=> start!125396 true))

(declare-fun array_inv!36933 (array!98822) Bool)

(assert (=> start!125396 (array_inv!36933 a!2862)))

(declare-fun b!1467211 () Bool)

(declare-fun res!995866 () Bool)

(assert (=> b!1467211 (=> (not res!995866) (not e!824138))))

(assert (=> b!1467211 (= res!995866 (validKeyInArray!0 (select (arr!47700 a!2862) i!1006)))))

(assert (= (and start!125396 res!995868) b!1467209))

(assert (= (and b!1467209 res!995867) b!1467211))

(assert (= (and b!1467211 res!995866) b!1467210))

(assert (= (and b!1467210 res!995865) b!1467213))

(assert (= (and b!1467213 res!995869) b!1467212))

(declare-fun m!1353665 () Bool)

(assert (=> b!1467212 m!1353665))

(declare-fun m!1353667 () Bool)

(assert (=> b!1467210 m!1353667))

(assert (=> b!1467210 m!1353667))

(declare-fun m!1353669 () Bool)

(assert (=> b!1467210 m!1353669))

(declare-fun m!1353671 () Bool)

(assert (=> start!125396 m!1353671))

(declare-fun m!1353673 () Bool)

(assert (=> start!125396 m!1353673))

(declare-fun m!1353675 () Bool)

(assert (=> b!1467211 m!1353675))

(assert (=> b!1467211 m!1353675))

(declare-fun m!1353677 () Bool)

(assert (=> b!1467211 m!1353677))

(declare-fun m!1353679 () Bool)

(assert (=> b!1467213 m!1353679))

(push 1)

(assert (not b!1467213))

(assert (not b!1467210))

(assert (not b!1467211))

(assert (not start!125396))

(assert (not b!1467212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

