; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122370 () Bool)

(assert start!122370)

(declare-fun b!1418268 () Bool)

(declare-fun res!953960 () Bool)

(declare-fun e!802630 () Bool)

(assert (=> b!1418268 (=> (not res!953960) (not e!802630))))

(declare-datatypes ((array!96799 0))(
  ( (array!96800 (arr!46722 (Array (_ BitVec 32) (_ BitVec 64))) (size!47274 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96799)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418268 (= res!953960 (validKeyInArray!0 (select (arr!46722 a!2831) j!81)))))

(declare-fun b!1418269 () Bool)

(declare-fun res!953962 () Bool)

(assert (=> b!1418269 (=> (not res!953962) (not e!802630))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418269 (= res!953962 (validKeyInArray!0 (select (arr!46722 a!2831) i!982)))))

(declare-fun b!1418270 () Bool)

(declare-fun res!953963 () Bool)

(assert (=> b!1418270 (=> (not res!953963) (not e!802630))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418270 (= res!953963 (and (= (size!47274 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47274 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47274 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!953959 () Bool)

(assert (=> start!122370 (=> (not res!953959) (not e!802630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122370 (= res!953959 (validMask!0 mask!2608))))

(assert (=> start!122370 e!802630))

(assert (=> start!122370 true))

(declare-fun array_inv!35955 (array!96799) Bool)

(assert (=> start!122370 (array_inv!35955 a!2831)))

(declare-fun b!1418271 () Bool)

(declare-fun res!953965 () Bool)

(assert (=> b!1418271 (=> (not res!953965) (not e!802630))))

(declare-datatypes ((List!33310 0))(
  ( (Nil!33307) (Cons!33306 (h!34599 (_ BitVec 64)) (t!47996 List!33310)) )
))
(declare-fun arrayNoDuplicates!0 (array!96799 (_ BitVec 32) List!33310) Bool)

(assert (=> b!1418271 (= res!953965 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33307))))

(declare-fun b!1418272 () Bool)

(assert (=> b!1418272 (= e!802630 false)))

(declare-fun lt!625379 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418272 (= lt!625379 (toIndex!0 (select (arr!46722 a!2831) j!81) mask!2608))))

(declare-fun b!1418273 () Bool)

(declare-fun res!953961 () Bool)

(assert (=> b!1418273 (=> (not res!953961) (not e!802630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96799 (_ BitVec 32)) Bool)

(assert (=> b!1418273 (= res!953961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418274 () Bool)

(declare-fun res!953964 () Bool)

(assert (=> b!1418274 (=> (not res!953964) (not e!802630))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1418274 (= res!953964 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47274 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47274 a!2831))))))

(assert (= (and start!122370 res!953959) b!1418270))

(assert (= (and b!1418270 res!953963) b!1418269))

(assert (= (and b!1418269 res!953962) b!1418268))

(assert (= (and b!1418268 res!953960) b!1418273))

(assert (= (and b!1418273 res!953961) b!1418271))

(assert (= (and b!1418271 res!953965) b!1418274))

(assert (= (and b!1418274 res!953964) b!1418272))

(declare-fun m!1308503 () Bool)

(assert (=> b!1418268 m!1308503))

(assert (=> b!1418268 m!1308503))

(declare-fun m!1308505 () Bool)

(assert (=> b!1418268 m!1308505))

(declare-fun m!1308507 () Bool)

(assert (=> start!122370 m!1308507))

(declare-fun m!1308509 () Bool)

(assert (=> start!122370 m!1308509))

(declare-fun m!1308511 () Bool)

(assert (=> b!1418273 m!1308511))

(declare-fun m!1308513 () Bool)

(assert (=> b!1418271 m!1308513))

(assert (=> b!1418272 m!1308503))

(assert (=> b!1418272 m!1308503))

(declare-fun m!1308515 () Bool)

(assert (=> b!1418272 m!1308515))

(declare-fun m!1308517 () Bool)

(assert (=> b!1418269 m!1308517))

(assert (=> b!1418269 m!1308517))

(declare-fun m!1308519 () Bool)

(assert (=> b!1418269 m!1308519))

(push 1)

(assert (not b!1418269))

(assert (not b!1418271))

(assert (not b!1418273))

(assert (not b!1418268))

(assert (not b!1418272))

(assert (not start!122370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

