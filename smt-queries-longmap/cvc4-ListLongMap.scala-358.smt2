; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6962 () Bool)

(assert start!6962)

(declare-fun res!26562 () Bool)

(declare-fun e!28704 () Bool)

(assert (=> start!6962 (=> (not res!26562) (not e!28704))))

(declare-datatypes ((array!2973 0))(
  ( (array!2974 (arr!1430 (Array (_ BitVec 32) (_ BitVec 64))) (size!1648 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2973)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6962 (= res!26562 (and (bvslt (size!1648 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1648 a!4412)) (= (size!1648 a!4412) size!30) (= a!4412 (array!2974 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1430 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1648 a!4412))))))

(assert (=> start!6962 e!28704))

(declare-fun array_inv!842 (array!2973) Bool)

(assert (=> start!6962 (array_inv!842 a!4412)))

(assert (=> start!6962 true))

(declare-fun b!45271 () Bool)

(assert (=> b!45271 (= e!28704 (not true))))

(declare-fun arrayCountValidKeys!0 (array!2973 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45271 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1265 0))(
  ( (Unit!1266) )
))
(declare-fun lt!20084 () Unit!1265)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2973 (_ BitVec 32) (_ BitVec 32)) Unit!1265)

(assert (=> b!45271 (= lt!20084 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6962 res!26562) b!45271))

(declare-fun m!39729 () Bool)

(assert (=> start!6962 m!39729))

(declare-fun m!39731 () Bool)

(assert (=> start!6962 m!39731))

(declare-fun m!39733 () Bool)

(assert (=> b!45271 m!39733))

(declare-fun m!39735 () Bool)

(assert (=> b!45271 m!39735))

(push 1)

(assert (not start!6962))

(assert (not b!45271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

