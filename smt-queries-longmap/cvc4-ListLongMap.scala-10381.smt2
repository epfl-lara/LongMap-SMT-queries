; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122212 () Bool)

(assert start!122212)

(declare-fun b!1417716 () Bool)

(declare-fun res!953448 () Bool)

(declare-fun e!802331 () Bool)

(assert (=> b!1417716 (=> (not res!953448) (not e!802331))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96796 0))(
  ( (array!96797 (arr!46726 (Array (_ BitVec 32) (_ BitVec 64))) (size!47276 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96796)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1417716 (= res!953448 (and (= (size!47276 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47276 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47276 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417719 () Bool)

(assert (=> b!1417719 (= e!802331 (bvsgt #b00000000000000000000000000000000 (size!47276 a!2831)))))

(declare-fun res!953447 () Bool)

(assert (=> start!122212 (=> (not res!953447) (not e!802331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122212 (= res!953447 (validMask!0 mask!2608))))

(assert (=> start!122212 e!802331))

(assert (=> start!122212 true))

(declare-fun array_inv!35754 (array!96796) Bool)

(assert (=> start!122212 (array_inv!35754 a!2831)))

(declare-fun b!1417718 () Bool)

(declare-fun res!953446 () Bool)

(assert (=> b!1417718 (=> (not res!953446) (not e!802331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417718 (= res!953446 (validKeyInArray!0 (select (arr!46726 a!2831) j!81)))))

(declare-fun b!1417717 () Bool)

(declare-fun res!953449 () Bool)

(assert (=> b!1417717 (=> (not res!953449) (not e!802331))))

(assert (=> b!1417717 (= res!953449 (validKeyInArray!0 (select (arr!46726 a!2831) i!982)))))

(assert (= (and start!122212 res!953447) b!1417716))

(assert (= (and b!1417716 res!953448) b!1417717))

(assert (= (and b!1417717 res!953449) b!1417718))

(assert (= (and b!1417718 res!953446) b!1417719))

(declare-fun m!1308501 () Bool)

(assert (=> start!122212 m!1308501))

(declare-fun m!1308503 () Bool)

(assert (=> start!122212 m!1308503))

(declare-fun m!1308505 () Bool)

(assert (=> b!1417718 m!1308505))

(assert (=> b!1417718 m!1308505))

(declare-fun m!1308507 () Bool)

(assert (=> b!1417718 m!1308507))

(declare-fun m!1308509 () Bool)

(assert (=> b!1417717 m!1308509))

(assert (=> b!1417717 m!1308509))

(declare-fun m!1308511 () Bool)

(assert (=> b!1417717 m!1308511))

(push 1)

(assert (not b!1417717))

(assert (not start!122212))

(assert (not b!1417718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

