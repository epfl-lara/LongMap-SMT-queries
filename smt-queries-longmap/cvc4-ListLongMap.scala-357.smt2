; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6956 () Bool)

(assert start!6956)

(declare-fun res!26553 () Bool)

(declare-fun e!28686 () Bool)

(assert (=> start!6956 (=> (not res!26553) (not e!28686))))

(declare-datatypes ((array!2967 0))(
  ( (array!2968 (arr!1427 (Array (_ BitVec 32) (_ BitVec 64))) (size!1645 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2967)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6956 (= res!26553 (and (bvslt (size!1645 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1645 a!4412)) (= (size!1645 a!4412) size!30) (= a!4412 (array!2968 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1427 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1645 a!4412))))))

(assert (=> start!6956 e!28686))

(declare-fun array_inv!839 (array!2967) Bool)

(assert (=> start!6956 (array_inv!839 a!4412)))

(assert (=> start!6956 true))

(declare-fun b!45262 () Bool)

(assert (=> b!45262 (= e!28686 (not (and (bvsle i!1489 size!30) (bvsle size!30 (size!1645 a!4412)))))))

(declare-fun arrayCountValidKeys!0 (array!2967 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45262 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1259 0))(
  ( (Unit!1260) )
))
(declare-fun lt!20075 () Unit!1259)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2967 (_ BitVec 32) (_ BitVec 32)) Unit!1259)

(assert (=> b!45262 (= lt!20075 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6956 res!26553) b!45262))

(declare-fun m!39705 () Bool)

(assert (=> start!6956 m!39705))

(declare-fun m!39707 () Bool)

(assert (=> start!6956 m!39707))

(declare-fun m!39709 () Bool)

(assert (=> b!45262 m!39709))

(declare-fun m!39711 () Bool)

(assert (=> b!45262 m!39711))

(push 1)

(assert (not b!45262))

(assert (not start!6956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

