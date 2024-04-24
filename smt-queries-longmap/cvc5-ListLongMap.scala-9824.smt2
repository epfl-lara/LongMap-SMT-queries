; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116840 () Bool)

(assert start!116840)

(declare-fun res!918554 () Bool)

(declare-fun e!779728 () Bool)

(assert (=> start!116840 (=> (not res!918554) (not e!779728))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93416 0))(
  ( (array!93417 (arr!45108 (Array (_ BitVec 32) (_ BitVec 64))) (size!45659 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93416)

(assert (=> start!116840 (= res!918554 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45659 a!4142))))))

(assert (=> start!116840 e!779728))

(assert (=> start!116840 true))

(declare-fun array_inv!34389 (array!93416) Bool)

(assert (=> start!116840 (array_inv!34389 a!4142)))

(declare-fun b!1376209 () Bool)

(declare-fun res!918552 () Bool)

(assert (=> b!1376209 (=> (not res!918552) (not e!779728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376209 (= res!918552 (validKeyInArray!0 (select (arr!45108 a!4142) i!1457)))))

(declare-fun b!1376210 () Bool)

(declare-fun res!918555 () Bool)

(assert (=> b!1376210 (=> (not res!918555) (not e!779728))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1376210 (= res!918555 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1376211 () Bool)

(declare-fun res!918553 () Bool)

(assert (=> b!1376211 (=> (not res!918553) (not e!779728))))

(assert (=> b!1376211 (= res!918553 (bvslt (size!45659 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1376212 () Bool)

(assert (=> b!1376212 (= e!779728 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1457) i!1457))))))

(declare-fun arrayCountValidKeys!0 (array!93416 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376212 (= (arrayCountValidKeys!0 (array!93417 (store (arr!45108 a!4142) i!1457 k!2959) (size!45659 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45438 0))(
  ( (Unit!45439) )
))
(declare-fun lt!604398 () Unit!45438)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93416 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45438)

(assert (=> b!1376212 (= lt!604398 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116840 res!918554) b!1376209))

(assert (= (and b!1376209 res!918552) b!1376210))

(assert (= (and b!1376210 res!918555) b!1376211))

(assert (= (and b!1376211 res!918553) b!1376212))

(declare-fun m!1260103 () Bool)

(assert (=> start!116840 m!1260103))

(declare-fun m!1260105 () Bool)

(assert (=> b!1376209 m!1260105))

(assert (=> b!1376209 m!1260105))

(declare-fun m!1260107 () Bool)

(assert (=> b!1376209 m!1260107))

(declare-fun m!1260109 () Bool)

(assert (=> b!1376210 m!1260109))

(declare-fun m!1260111 () Bool)

(assert (=> b!1376212 m!1260111))

(declare-fun m!1260113 () Bool)

(assert (=> b!1376212 m!1260113))

(declare-fun m!1260115 () Bool)

(assert (=> b!1376212 m!1260115))

(declare-fun m!1260117 () Bool)

(assert (=> b!1376212 m!1260117))

(push 1)

(assert (not b!1376209))

(assert (not b!1376212))

(assert (not start!116840))

(assert (not b!1376210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

