; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6950 () Bool)

(assert start!6950)

(declare-fun res!26527 () Bool)

(declare-fun e!28633 () Bool)

(assert (=> start!6950 (=> (not res!26527) (not e!28633))))

(declare-datatypes ((array!2941 0))(
  ( (array!2942 (arr!1414 (Array (_ BitVec 32) (_ BitVec 64))) (size!1632 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2941)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6950 (= res!26527 (and (bvslt (size!1632 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1632 a!4412)) (= (size!1632 a!4412) size!30) (= a!4412 (array!2942 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1414 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1632 a!4412))))))

(assert (=> start!6950 e!28633))

(declare-fun array_inv!837 (array!2941) Bool)

(assert (=> start!6950 (array_inv!837 a!4412)))

(assert (=> start!6950 true))

(declare-fun b!45182 () Bool)

(assert (=> b!45182 (= e!28633 (not (and (bvsle i!1489 size!30) (bvsle size!30 (size!1632 a!4412)))))))

(declare-fun arrayCountValidKeys!0 (array!2941 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45182 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1264 0))(
  ( (Unit!1265) )
))
(declare-fun lt!20057 () Unit!1264)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2941 (_ BitVec 32) (_ BitVec 32)) Unit!1264)

(assert (=> b!45182 (= lt!20057 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6950 res!26527) b!45182))

(declare-fun m!39609 () Bool)

(assert (=> start!6950 m!39609))

(declare-fun m!39611 () Bool)

(assert (=> start!6950 m!39611))

(declare-fun m!39613 () Bool)

(assert (=> b!45182 m!39613))

(declare-fun m!39615 () Bool)

(assert (=> b!45182 m!39615))

(push 1)

(assert (not b!45182))

(assert (not start!6950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

