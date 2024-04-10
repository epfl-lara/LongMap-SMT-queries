; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122214 () Bool)

(assert start!122214)

(declare-fun b!1417730 () Bool)

(declare-fun res!953462 () Bool)

(declare-fun e!802336 () Bool)

(assert (=> b!1417730 (=> (not res!953462) (not e!802336))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96798 0))(
  ( (array!96799 (arr!46727 (Array (_ BitVec 32) (_ BitVec 64))) (size!47277 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96798)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417730 (= res!953462 (and (= (size!47277 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47277 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47277 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417731 () Bool)

(declare-fun res!953460 () Bool)

(assert (=> b!1417731 (=> (not res!953460) (not e!802336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96798 (_ BitVec 32)) Bool)

(assert (=> b!1417731 (= res!953460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417732 () Bool)

(assert (=> b!1417732 (= e!802336 (bvsgt #b00000000000000000000000000000000 (size!47277 a!2831)))))

(declare-fun b!1417733 () Bool)

(declare-fun res!953464 () Bool)

(assert (=> b!1417733 (=> (not res!953464) (not e!802336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417733 (= res!953464 (validKeyInArray!0 (select (arr!46727 a!2831) i!982)))))

(declare-fun res!953463 () Bool)

(assert (=> start!122214 (=> (not res!953463) (not e!802336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122214 (= res!953463 (validMask!0 mask!2608))))

(assert (=> start!122214 e!802336))

(assert (=> start!122214 true))

(declare-fun array_inv!35755 (array!96798) Bool)

(assert (=> start!122214 (array_inv!35755 a!2831)))

(declare-fun b!1417734 () Bool)

(declare-fun res!953461 () Bool)

(assert (=> b!1417734 (=> (not res!953461) (not e!802336))))

(assert (=> b!1417734 (= res!953461 (validKeyInArray!0 (select (arr!46727 a!2831) j!81)))))

(assert (= (and start!122214 res!953463) b!1417730))

(assert (= (and b!1417730 res!953462) b!1417733))

(assert (= (and b!1417733 res!953464) b!1417734))

(assert (= (and b!1417734 res!953461) b!1417731))

(assert (= (and b!1417731 res!953460) b!1417732))

(declare-fun m!1308513 () Bool)

(assert (=> b!1417731 m!1308513))

(declare-fun m!1308515 () Bool)

(assert (=> b!1417733 m!1308515))

(assert (=> b!1417733 m!1308515))

(declare-fun m!1308517 () Bool)

(assert (=> b!1417733 m!1308517))

(declare-fun m!1308519 () Bool)

(assert (=> start!122214 m!1308519))

(declare-fun m!1308521 () Bool)

(assert (=> start!122214 m!1308521))

(declare-fun m!1308523 () Bool)

(assert (=> b!1417734 m!1308523))

(assert (=> b!1417734 m!1308523))

(declare-fun m!1308525 () Bool)

(assert (=> b!1417734 m!1308525))

(push 1)

(assert (not b!1417731))

(assert (not start!122214))

(assert (not b!1417734))

(assert (not b!1417733))

(check-sat)

