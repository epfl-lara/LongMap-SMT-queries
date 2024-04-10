; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6952 () Bool)

(assert start!6952)

(declare-fun res!26547 () Bool)

(declare-fun e!28674 () Bool)

(assert (=> start!6952 (=> (not res!26547) (not e!28674))))

(declare-datatypes ((array!2963 0))(
  ( (array!2964 (arr!1425 (Array (_ BitVec 32) (_ BitVec 64))) (size!1643 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2963)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6952 (= res!26547 (and (bvslt (size!1643 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1643 a!4412)) (= (size!1643 a!4412) size!30) (= a!4412 (array!2964 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1425 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1643 a!4412))))))

(assert (=> start!6952 e!28674))

(declare-fun array_inv!837 (array!2963) Bool)

(assert (=> start!6952 (array_inv!837 a!4412)))

(assert (=> start!6952 true))

(declare-fun b!45256 () Bool)

(assert (=> b!45256 (= e!28674 (not (and (bvsle i!1489 size!30) (bvsle size!30 (size!1643 a!4412)))))))

(declare-fun arrayCountValidKeys!0 (array!2963 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45256 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1255 0))(
  ( (Unit!1256) )
))
(declare-fun lt!20069 () Unit!1255)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2963 (_ BitVec 32) (_ BitVec 32)) Unit!1255)

(assert (=> b!45256 (= lt!20069 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6952 res!26547) b!45256))

(declare-fun m!39689 () Bool)

(assert (=> start!6952 m!39689))

(declare-fun m!39691 () Bool)

(assert (=> start!6952 m!39691))

(declare-fun m!39693 () Bool)

(assert (=> b!45256 m!39693))

(declare-fun m!39695 () Bool)

(assert (=> b!45256 m!39695))

(push 1)

(assert (not b!45256))

(assert (not start!6952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

