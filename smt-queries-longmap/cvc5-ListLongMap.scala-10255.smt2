; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120582 () Bool)

(assert start!120582)

(declare-fun b!1404032 () Bool)

(declare-fun e!794903 () Bool)

(assert (=> b!1404032 (= e!794903 false)))

(declare-fun lt!618576 () Bool)

(declare-datatypes ((array!95991 0))(
  ( (array!95992 (arr!46346 (Array (_ BitVec 32) (_ BitVec 64))) (size!46896 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95991)

(declare-datatypes ((List!32865 0))(
  ( (Nil!32862) (Cons!32861 (h!34109 (_ BitVec 64)) (t!47559 List!32865)) )
))
(declare-fun arrayNoDuplicates!0 (array!95991 (_ BitVec 32) List!32865) Bool)

(assert (=> b!1404032 (= lt!618576 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32862))))

(declare-fun b!1404033 () Bool)

(declare-fun res!942545 () Bool)

(assert (=> b!1404033 (=> (not res!942545) (not e!794903))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95991 (_ BitVec 32)) Bool)

(assert (=> b!1404033 (= res!942545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404034 () Bool)

(declare-fun res!942547 () Bool)

(assert (=> b!1404034 (=> (not res!942547) (not e!794903))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404034 (= res!942547 (validKeyInArray!0 (select (arr!46346 a!2901) j!112)))))

(declare-fun b!1404035 () Bool)

(declare-fun res!942544 () Bool)

(assert (=> b!1404035 (=> (not res!942544) (not e!794903))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404035 (= res!942544 (and (= (size!46896 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46896 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46896 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942546 () Bool)

(assert (=> start!120582 (=> (not res!942546) (not e!794903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120582 (= res!942546 (validMask!0 mask!2840))))

(assert (=> start!120582 e!794903))

(assert (=> start!120582 true))

(declare-fun array_inv!35374 (array!95991) Bool)

(assert (=> start!120582 (array_inv!35374 a!2901)))

(declare-fun b!1404036 () Bool)

(declare-fun res!942543 () Bool)

(assert (=> b!1404036 (=> (not res!942543) (not e!794903))))

(assert (=> b!1404036 (= res!942543 (validKeyInArray!0 (select (arr!46346 a!2901) i!1037)))))

(assert (= (and start!120582 res!942546) b!1404035))

(assert (= (and b!1404035 res!942544) b!1404036))

(assert (= (and b!1404036 res!942543) b!1404034))

(assert (= (and b!1404034 res!942547) b!1404033))

(assert (= (and b!1404033 res!942545) b!1404032))

(declare-fun m!1292835 () Bool)

(assert (=> b!1404034 m!1292835))

(assert (=> b!1404034 m!1292835))

(declare-fun m!1292837 () Bool)

(assert (=> b!1404034 m!1292837))

(declare-fun m!1292839 () Bool)

(assert (=> b!1404036 m!1292839))

(assert (=> b!1404036 m!1292839))

(declare-fun m!1292841 () Bool)

(assert (=> b!1404036 m!1292841))

(declare-fun m!1292843 () Bool)

(assert (=> start!120582 m!1292843))

(declare-fun m!1292845 () Bool)

(assert (=> start!120582 m!1292845))

(declare-fun m!1292847 () Bool)

(assert (=> b!1404033 m!1292847))

(declare-fun m!1292849 () Bool)

(assert (=> b!1404032 m!1292849))

(push 1)

(assert (not start!120582))

(assert (not b!1404032))

(assert (not b!1404036))

(assert (not b!1404033))

(assert (not b!1404034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

