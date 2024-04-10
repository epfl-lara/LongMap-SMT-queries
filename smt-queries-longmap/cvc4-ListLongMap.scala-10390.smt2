; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122386 () Bool)

(assert start!122386)

(declare-fun b!1418475 () Bool)

(declare-fun res!954117 () Bool)

(declare-fun e!802705 () Bool)

(assert (=> b!1418475 (=> (not res!954117) (not e!802705))))

(declare-datatypes ((array!96862 0))(
  ( (array!96863 (arr!46753 (Array (_ BitVec 32) (_ BitVec 64))) (size!47303 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96862)

(declare-datatypes ((List!33263 0))(
  ( (Nil!33260) (Cons!33259 (h!34552 (_ BitVec 64)) (t!47957 List!33263)) )
))
(declare-fun arrayNoDuplicates!0 (array!96862 (_ BitVec 32) List!33263) Bool)

(assert (=> b!1418475 (= res!954117 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33260))))

(declare-fun b!1418476 () Bool)

(declare-fun res!954121 () Bool)

(assert (=> b!1418476 (=> (not res!954121) (not e!802705))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1418476 (= res!954121 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47303 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47303 a!2831))))))

(declare-fun b!1418477 () Bool)

(declare-fun res!954119 () Bool)

(assert (=> b!1418477 (=> (not res!954119) (not e!802705))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418477 (= res!954119 (validKeyInArray!0 (select (arr!46753 a!2831) j!81)))))

(declare-fun res!954115 () Bool)

(assert (=> start!122386 (=> (not res!954115) (not e!802705))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122386 (= res!954115 (validMask!0 mask!2608))))

(assert (=> start!122386 e!802705))

(assert (=> start!122386 true))

(declare-fun array_inv!35781 (array!96862) Bool)

(assert (=> start!122386 (array_inv!35781 a!2831)))

(declare-fun b!1418478 () Bool)

(declare-fun res!954118 () Bool)

(assert (=> b!1418478 (=> (not res!954118) (not e!802705))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418478 (= res!954118 (and (= (size!47303 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47303 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47303 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418479 () Bool)

(assert (=> b!1418479 (= e!802705 false)))

(declare-fun lt!625587 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418479 (= lt!625587 (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608))))

(declare-fun b!1418480 () Bool)

(declare-fun res!954116 () Bool)

(assert (=> b!1418480 (=> (not res!954116) (not e!802705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96862 (_ BitVec 32)) Bool)

(assert (=> b!1418480 (= res!954116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418481 () Bool)

(declare-fun res!954120 () Bool)

(assert (=> b!1418481 (=> (not res!954120) (not e!802705))))

(assert (=> b!1418481 (= res!954120 (validKeyInArray!0 (select (arr!46753 a!2831) i!982)))))

(assert (= (and start!122386 res!954115) b!1418478))

(assert (= (and b!1418478 res!954118) b!1418481))

(assert (= (and b!1418481 res!954120) b!1418477))

(assert (= (and b!1418477 res!954119) b!1418480))

(assert (= (and b!1418480 res!954116) b!1418475))

(assert (= (and b!1418475 res!954117) b!1418476))

(assert (= (and b!1418476 res!954121) b!1418479))

(declare-fun m!1309155 () Bool)

(assert (=> b!1418477 m!1309155))

(assert (=> b!1418477 m!1309155))

(declare-fun m!1309157 () Bool)

(assert (=> b!1418477 m!1309157))

(declare-fun m!1309159 () Bool)

(assert (=> b!1418480 m!1309159))

(declare-fun m!1309161 () Bool)

(assert (=> b!1418475 m!1309161))

(assert (=> b!1418479 m!1309155))

(assert (=> b!1418479 m!1309155))

(declare-fun m!1309163 () Bool)

(assert (=> b!1418479 m!1309163))

(declare-fun m!1309165 () Bool)

(assert (=> start!122386 m!1309165))

(declare-fun m!1309167 () Bool)

(assert (=> start!122386 m!1309167))

(declare-fun m!1309169 () Bool)

(assert (=> b!1418481 m!1309169))

(assert (=> b!1418481 m!1309169))

(declare-fun m!1309171 () Bool)

(assert (=> b!1418481 m!1309171))

(push 1)

(assert (not b!1418475))

(assert (not b!1418477))

(assert (not start!122386))

(assert (not b!1418481))

(assert (not b!1418479))

(assert (not b!1418480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

