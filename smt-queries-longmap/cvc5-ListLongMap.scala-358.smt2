; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6958 () Bool)

(assert start!6958)

(declare-fun res!26556 () Bool)

(declare-fun e!28692 () Bool)

(assert (=> start!6958 (=> (not res!26556) (not e!28692))))

(declare-datatypes ((array!2969 0))(
  ( (array!2970 (arr!1428 (Array (_ BitVec 32) (_ BitVec 64))) (size!1646 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2969)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6958 (= res!26556 (and (bvslt (size!1646 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1646 a!4412)) (= (size!1646 a!4412) size!30) (= a!4412 (array!2970 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1428 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1646 a!4412))))))

(assert (=> start!6958 e!28692))

(declare-fun array_inv!840 (array!2969) Bool)

(assert (=> start!6958 (array_inv!840 a!4412)))

(assert (=> start!6958 true))

(declare-fun b!45265 () Bool)

(assert (=> b!45265 (= e!28692 (not true))))

(declare-fun arrayCountValidKeys!0 (array!2969 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45265 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1261 0))(
  ( (Unit!1262) )
))
(declare-fun lt!20078 () Unit!1261)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2969 (_ BitVec 32) (_ BitVec 32)) Unit!1261)

(assert (=> b!45265 (= lt!20078 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6958 res!26556) b!45265))

(declare-fun m!39713 () Bool)

(assert (=> start!6958 m!39713))

(declare-fun m!39715 () Bool)

(assert (=> start!6958 m!39715))

(declare-fun m!39717 () Bool)

(assert (=> b!45265 m!39717))

(declare-fun m!39719 () Bool)

(assert (=> b!45265 m!39719))

(push 1)

(assert (not start!6958))

(assert (not b!45265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

