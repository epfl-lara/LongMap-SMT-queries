; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122380 () Bool)

(assert start!122380)

(declare-fun b!1418412 () Bool)

(declare-fun res!954058 () Bool)

(declare-fun e!802687 () Bool)

(assert (=> b!1418412 (=> (not res!954058) (not e!802687))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96856 0))(
  ( (array!96857 (arr!46750 (Array (_ BitVec 32) (_ BitVec 64))) (size!47300 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96856)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418412 (= res!954058 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47300 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47300 a!2831))))))

(declare-fun b!1418413 () Bool)

(declare-fun res!954056 () Bool)

(assert (=> b!1418413 (=> (not res!954056) (not e!802687))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418413 (= res!954056 (and (= (size!47300 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47300 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47300 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418415 () Bool)

(declare-fun res!954057 () Bool)

(assert (=> b!1418415 (=> (not res!954057) (not e!802687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96856 (_ BitVec 32)) Bool)

(assert (=> b!1418415 (= res!954057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418416 () Bool)

(declare-fun res!954052 () Bool)

(assert (=> b!1418416 (=> (not res!954052) (not e!802687))))

(declare-datatypes ((List!33260 0))(
  ( (Nil!33257) (Cons!33256 (h!34549 (_ BitVec 64)) (t!47954 List!33260)) )
))
(declare-fun arrayNoDuplicates!0 (array!96856 (_ BitVec 32) List!33260) Bool)

(assert (=> b!1418416 (= res!954052 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33257))))

(declare-fun b!1418417 () Bool)

(declare-fun res!954053 () Bool)

(assert (=> b!1418417 (=> (not res!954053) (not e!802687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418417 (= res!954053 (validKeyInArray!0 (select (arr!46750 a!2831) j!81)))))

(declare-fun b!1418418 () Bool)

(assert (=> b!1418418 (= e!802687 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625578 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418418 (= lt!625578 (toIndex!0 (select (arr!46750 a!2831) j!81) mask!2608))))

(declare-fun res!954055 () Bool)

(assert (=> start!122380 (=> (not res!954055) (not e!802687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122380 (= res!954055 (validMask!0 mask!2608))))

(assert (=> start!122380 e!802687))

(assert (=> start!122380 true))

(declare-fun array_inv!35778 (array!96856) Bool)

(assert (=> start!122380 (array_inv!35778 a!2831)))

(declare-fun b!1418414 () Bool)

(declare-fun res!954054 () Bool)

(assert (=> b!1418414 (=> (not res!954054) (not e!802687))))

(assert (=> b!1418414 (= res!954054 (validKeyInArray!0 (select (arr!46750 a!2831) i!982)))))

(assert (= (and start!122380 res!954055) b!1418413))

(assert (= (and b!1418413 res!954056) b!1418414))

(assert (= (and b!1418414 res!954054) b!1418417))

(assert (= (and b!1418417 res!954053) b!1418415))

(assert (= (and b!1418415 res!954057) b!1418416))

(assert (= (and b!1418416 res!954052) b!1418412))

(assert (= (and b!1418412 res!954058) b!1418418))

(declare-fun m!1309101 () Bool)

(assert (=> b!1418416 m!1309101))

(declare-fun m!1309103 () Bool)

(assert (=> b!1418418 m!1309103))

(assert (=> b!1418418 m!1309103))

(declare-fun m!1309105 () Bool)

(assert (=> b!1418418 m!1309105))

(declare-fun m!1309107 () Bool)

(assert (=> b!1418415 m!1309107))

(declare-fun m!1309109 () Bool)

(assert (=> b!1418414 m!1309109))

(assert (=> b!1418414 m!1309109))

(declare-fun m!1309111 () Bool)

(assert (=> b!1418414 m!1309111))

(assert (=> b!1418417 m!1309103))

(assert (=> b!1418417 m!1309103))

(declare-fun m!1309113 () Bool)

(assert (=> b!1418417 m!1309113))

(declare-fun m!1309115 () Bool)

(assert (=> start!122380 m!1309115))

(declare-fun m!1309117 () Bool)

(assert (=> start!122380 m!1309117))

(push 1)

(assert (not start!122380))

(assert (not b!1418414))

(assert (not b!1418418))

(assert (not b!1418416))

(assert (not b!1418417))

(assert (not b!1418415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

