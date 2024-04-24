; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125708 () Bool)

(assert start!125708)

(declare-fun res!996587 () Bool)

(declare-fun e!825330 () Bool)

(assert (=> start!125708 (=> (not res!996587) (not e!825330))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125708 (= res!996587 (validMask!0 mask!2687))))

(assert (=> start!125708 e!825330))

(assert (=> start!125708 true))

(declare-datatypes ((array!98994 0))(
  ( (array!98995 (arr!47780 (Array (_ BitVec 32) (_ BitVec 64))) (size!48331 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98994)

(declare-fun array_inv!37061 (array!98994) Bool)

(assert (=> start!125708 (array_inv!37061 a!2862)))

(declare-fun b!1469142 () Bool)

(declare-fun res!996584 () Bool)

(assert (=> b!1469142 (=> (not res!996584) (not e!825330))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469142 (= res!996584 (and (= (size!48331 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48331 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48331 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469143 () Bool)

(declare-fun res!996586 () Bool)

(assert (=> b!1469143 (=> (not res!996586) (not e!825330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469143 (= res!996586 (validKeyInArray!0 (select (arr!47780 a!2862) j!93)))))

(declare-fun b!1469144 () Bool)

(declare-fun res!996583 () Bool)

(assert (=> b!1469144 (=> (not res!996583) (not e!825330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98994 (_ BitVec 32)) Bool)

(assert (=> b!1469144 (= res!996583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469145 () Bool)

(declare-fun res!996585 () Bool)

(assert (=> b!1469145 (=> (not res!996585) (not e!825330))))

(assert (=> b!1469145 (= res!996585 (validKeyInArray!0 (select (arr!47780 a!2862) i!1006)))))

(declare-fun b!1469146 () Bool)

(assert (=> b!1469146 (= e!825330 false)))

(declare-fun lt!642736 () Bool)

(declare-datatypes ((List!34268 0))(
  ( (Nil!34265) (Cons!34264 (h!35628 (_ BitVec 64)) (t!48954 List!34268)) )
))
(declare-fun arrayNoDuplicates!0 (array!98994 (_ BitVec 32) List!34268) Bool)

(assert (=> b!1469146 (= lt!642736 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34265))))

(assert (= (and start!125708 res!996587) b!1469142))

(assert (= (and b!1469142 res!996584) b!1469145))

(assert (= (and b!1469145 res!996585) b!1469143))

(assert (= (and b!1469143 res!996586) b!1469144))

(assert (= (and b!1469144 res!996583) b!1469146))

(declare-fun m!1356059 () Bool)

(assert (=> b!1469146 m!1356059))

(declare-fun m!1356061 () Bool)

(assert (=> b!1469143 m!1356061))

(assert (=> b!1469143 m!1356061))

(declare-fun m!1356063 () Bool)

(assert (=> b!1469143 m!1356063))

(declare-fun m!1356065 () Bool)

(assert (=> b!1469145 m!1356065))

(assert (=> b!1469145 m!1356065))

(declare-fun m!1356067 () Bool)

(assert (=> b!1469145 m!1356067))

(declare-fun m!1356069 () Bool)

(assert (=> start!125708 m!1356069))

(declare-fun m!1356071 () Bool)

(assert (=> start!125708 m!1356071))

(declare-fun m!1356073 () Bool)

(assert (=> b!1469144 m!1356073))

(push 1)

(assert (not b!1469146))

(assert (not b!1469143))

(assert (not b!1469144))

(assert (not b!1469145))

(assert (not start!125708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

