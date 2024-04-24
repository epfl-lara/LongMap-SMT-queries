; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6964 () Bool)

(assert start!6964)

(declare-fun res!26534 () Bool)

(declare-fun e!28661 () Bool)

(assert (=> start!6964 (=> (not res!26534) (not e!28661))))

(declare-datatypes ((array!2957 0))(
  ( (array!2958 (arr!1422 (Array (_ BitVec 32) (_ BitVec 64))) (size!1640 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2957)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6964 (= res!26534 (and (bvslt (size!1640 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1640 a!4412)) (= (size!1640 a!4412) size!30) (= a!4412 (array!2958 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1422 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1640 a!4412))))))

(assert (=> start!6964 e!28661))

(declare-fun array_inv!825 (array!2957) Bool)

(assert (=> start!6964 (array_inv!825 a!4412)))

(assert (=> start!6964 true))

(declare-fun b!45211 () Bool)

(assert (=> b!45211 (= e!28661 (not true))))

(declare-fun arrayCountValidKeys!0 (array!2957 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45211 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1274 0))(
  ( (Unit!1275) )
))
(declare-fun lt!20038 () Unit!1274)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2957 (_ BitVec 32) (_ BitVec 32)) Unit!1274)

(assert (=> b!45211 (= lt!20038 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6964 res!26534) b!45211))

(declare-fun m!39597 () Bool)

(assert (=> start!6964 m!39597))

(declare-fun m!39599 () Bool)

(assert (=> start!6964 m!39599))

(declare-fun m!39601 () Bool)

(assert (=> b!45211 m!39601))

(declare-fun m!39603 () Bool)

(assert (=> b!45211 m!39603))

(push 1)

(assert (not b!45211))

(assert (not start!6964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

