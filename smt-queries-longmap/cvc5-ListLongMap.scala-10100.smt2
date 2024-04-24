; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119286 () Bool)

(assert start!119286)

(declare-fun res!930107 () Bool)

(declare-fun e!787795 () Bool)

(assert (=> start!119286 (=> (not res!930107) (not e!787795))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119286 (= res!930107 (validMask!0 mask!2840))))

(assert (=> start!119286 e!787795))

(assert (=> start!119286 true))

(declare-datatypes ((array!95145 0))(
  ( (array!95146 (arr!45936 (Array (_ BitVec 32) (_ BitVec 64))) (size!46487 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95145)

(declare-fun array_inv!35217 (array!95145) Bool)

(assert (=> start!119286 (array_inv!35217 a!2901)))

(declare-fun b!1390627 () Bool)

(declare-fun res!930109 () Bool)

(assert (=> b!1390627 (=> (not res!930109) (not e!787795))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390627 (= res!930109 (and (= (size!46487 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46487 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46487 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390628 () Bool)

(declare-fun res!930104 () Bool)

(assert (=> b!1390628 (=> (not res!930104) (not e!787795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390628 (= res!930104 (validKeyInArray!0 (select (arr!45936 a!2901) j!112)))))

(declare-fun b!1390629 () Bool)

(declare-fun res!930108 () Bool)

(assert (=> b!1390629 (=> (not res!930108) (not e!787795))))

(declare-datatypes ((List!32442 0))(
  ( (Nil!32439) (Cons!32438 (h!33664 (_ BitVec 64)) (t!47128 List!32442)) )
))
(declare-fun arrayNoDuplicates!0 (array!95145 (_ BitVec 32) List!32442) Bool)

(assert (=> b!1390629 (= res!930108 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32439))))

(declare-fun b!1390630 () Bool)

(declare-fun res!930106 () Bool)

(assert (=> b!1390630 (=> (not res!930106) (not e!787795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95145 (_ BitVec 32)) Bool)

(assert (=> b!1390630 (= res!930106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390631 () Bool)

(declare-fun res!930105 () Bool)

(assert (=> b!1390631 (=> (not res!930105) (not e!787795))))

(assert (=> b!1390631 (= res!930105 (validKeyInArray!0 (select (arr!45936 a!2901) i!1037)))))

(declare-fun b!1390632 () Bool)

(assert (=> b!1390632 (= e!787795 false)))

(declare-fun lt!610973 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390632 (= lt!610973 (toIndex!0 (select (arr!45936 a!2901) j!112) mask!2840))))

(assert (= (and start!119286 res!930107) b!1390627))

(assert (= (and b!1390627 res!930109) b!1390631))

(assert (= (and b!1390631 res!930105) b!1390628))

(assert (= (and b!1390628 res!930104) b!1390630))

(assert (= (and b!1390630 res!930106) b!1390629))

(assert (= (and b!1390629 res!930108) b!1390632))

(declare-fun m!1276501 () Bool)

(assert (=> b!1390631 m!1276501))

(assert (=> b!1390631 m!1276501))

(declare-fun m!1276503 () Bool)

(assert (=> b!1390631 m!1276503))

(declare-fun m!1276505 () Bool)

(assert (=> start!119286 m!1276505))

(declare-fun m!1276507 () Bool)

(assert (=> start!119286 m!1276507))

(declare-fun m!1276509 () Bool)

(assert (=> b!1390630 m!1276509))

(declare-fun m!1276511 () Bool)

(assert (=> b!1390632 m!1276511))

(assert (=> b!1390632 m!1276511))

(declare-fun m!1276513 () Bool)

(assert (=> b!1390632 m!1276513))

(assert (=> b!1390628 m!1276511))

(assert (=> b!1390628 m!1276511))

(declare-fun m!1276515 () Bool)

(assert (=> b!1390628 m!1276515))

(declare-fun m!1276517 () Bool)

(assert (=> b!1390629 m!1276517))

(push 1)

(assert (not b!1390630))

(assert (not b!1390628))

(assert (not b!1390632))

(assert (not start!119286))

(assert (not b!1390631))

(assert (not b!1390629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

