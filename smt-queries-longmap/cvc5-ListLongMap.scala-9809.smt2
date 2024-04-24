; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116732 () Bool)

(assert start!116732)

(declare-fun b!1375563 () Bool)

(declare-fun e!779374 () Bool)

(declare-fun e!779372 () Bool)

(assert (=> b!1375563 (= e!779374 (not e!779372))))

(declare-fun res!917966 () Bool)

(assert (=> b!1375563 (=> res!917966 e!779372)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375563 (= res!917966 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-datatypes ((array!93323 0))(
  ( (array!93324 (arr!45063 (Array (_ BitVec 32) (_ BitVec 64))) (size!45614 (_ BitVec 32))) )
))
(declare-fun lt!603851 () array!93323)

(declare-fun a!4142 () array!93323)

(declare-fun arrayCountValidKeys!0 (array!93323 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375563 (= (arrayCountValidKeys!0 lt!603851 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375563 (= lt!603851 (array!93324 (store (arr!45063 a!4142) i!1457 k!2959) (size!45614 a!4142)))))

(declare-datatypes ((Unit!45360 0))(
  ( (Unit!45361) )
))
(declare-fun lt!603852 () Unit!45360)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45360)

(assert (=> b!1375563 (= lt!603852 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375564 () Bool)

(declare-fun res!917969 () Bool)

(assert (=> b!1375564 (=> (not res!917969) (not e!779374))))

(assert (=> b!1375564 (= res!917969 (bvslt (size!45614 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917968 () Bool)

(assert (=> start!116732 (=> (not res!917968) (not e!779374))))

(assert (=> start!116732 (= res!917968 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45614 a!4142))))))

(assert (=> start!116732 e!779374))

(assert (=> start!116732 true))

(declare-fun array_inv!34344 (array!93323) Bool)

(assert (=> start!116732 (array_inv!34344 a!4142)))

(declare-fun b!1375565 () Bool)

(assert (=> b!1375565 (= e!779372 true)))

(declare-fun lt!603849 () (_ BitVec 32))

(assert (=> b!1375565 (= lt!603849 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603850 () (_ BitVec 32))

(assert (=> b!1375565 (= lt!603850 (arrayCountValidKeys!0 lt!603851 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375566 () Bool)

(declare-fun res!917967 () Bool)

(assert (=> b!1375566 (=> (not res!917967) (not e!779374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375566 (= res!917967 (validKeyInArray!0 (select (arr!45063 a!4142) i!1457)))))

(declare-fun b!1375567 () Bool)

(declare-fun res!917970 () Bool)

(assert (=> b!1375567 (=> (not res!917970) (not e!779374))))

(assert (=> b!1375567 (= res!917970 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116732 res!917968) b!1375566))

(assert (= (and b!1375566 res!917967) b!1375567))

(assert (= (and b!1375567 res!917970) b!1375564))

(assert (= (and b!1375564 res!917969) b!1375563))

(assert (= (and b!1375563 (not res!917966)) b!1375565))

(declare-fun m!1259129 () Bool)

(assert (=> b!1375566 m!1259129))

(assert (=> b!1375566 m!1259129))

(declare-fun m!1259131 () Bool)

(assert (=> b!1375566 m!1259131))

(declare-fun m!1259133 () Bool)

(assert (=> b!1375565 m!1259133))

(declare-fun m!1259135 () Bool)

(assert (=> b!1375565 m!1259135))

(declare-fun m!1259137 () Bool)

(assert (=> b!1375563 m!1259137))

(declare-fun m!1259139 () Bool)

(assert (=> b!1375563 m!1259139))

(declare-fun m!1259141 () Bool)

(assert (=> b!1375563 m!1259141))

(declare-fun m!1259143 () Bool)

(assert (=> b!1375563 m!1259143))

(declare-fun m!1259145 () Bool)

(assert (=> start!116732 m!1259145))

(declare-fun m!1259147 () Bool)

(assert (=> b!1375567 m!1259147))

(push 1)

(assert (not b!1375566))

(assert (not b!1375567))

(assert (not start!116732))

(assert (not b!1375563))

(assert (not b!1375565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

