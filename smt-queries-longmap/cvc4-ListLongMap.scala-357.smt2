; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6958 () Bool)

(assert start!6958)

(declare-fun res!26525 () Bool)

(declare-fun e!28643 () Bool)

(assert (=> start!6958 (=> (not res!26525) (not e!28643))))

(declare-datatypes ((array!2951 0))(
  ( (array!2952 (arr!1419 (Array (_ BitVec 32) (_ BitVec 64))) (size!1637 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2951)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6958 (= res!26525 (and (bvslt (size!1637 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1637 a!4412)) (= (size!1637 a!4412) size!30) (= a!4412 (array!2952 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1419 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1637 a!4412))))))

(assert (=> start!6958 e!28643))

(declare-fun array_inv!822 (array!2951) Bool)

(assert (=> start!6958 (array_inv!822 a!4412)))

(assert (=> start!6958 true))

(declare-fun b!45202 () Bool)

(assert (=> b!45202 (= e!28643 (not (and (bvsle i!1489 size!30) (bvsle size!30 (size!1637 a!4412)))))))

(declare-fun arrayCountValidKeys!0 (array!2951 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45202 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1268 0))(
  ( (Unit!1269) )
))
(declare-fun lt!20029 () Unit!1268)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2951 (_ BitVec 32) (_ BitVec 32)) Unit!1268)

(assert (=> b!45202 (= lt!20029 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6958 res!26525) b!45202))

(declare-fun m!39573 () Bool)

(assert (=> start!6958 m!39573))

(declare-fun m!39575 () Bool)

(assert (=> start!6958 m!39575))

(declare-fun m!39577 () Bool)

(assert (=> b!45202 m!39577))

(declare-fun m!39579 () Bool)

(assert (=> b!45202 m!39579))

(push 1)

(assert (not start!6958))

(assert (not b!45202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

