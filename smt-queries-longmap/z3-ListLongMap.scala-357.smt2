; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6954 () Bool)

(assert start!6954)

(declare-fun res!26550 () Bool)

(declare-fun e!28680 () Bool)

(assert (=> start!6954 (=> (not res!26550) (not e!28680))))

(declare-datatypes ((array!2965 0))(
  ( (array!2966 (arr!1426 (Array (_ BitVec 32) (_ BitVec 64))) (size!1644 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2965)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6954 (= res!26550 (and (bvslt (size!1644 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1644 a!4412)) (= (size!1644 a!4412) size!30) (= a!4412 (array!2966 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1426 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1644 a!4412))))))

(assert (=> start!6954 e!28680))

(declare-fun array_inv!838 (array!2965) Bool)

(assert (=> start!6954 (array_inv!838 a!4412)))

(assert (=> start!6954 true))

(declare-fun b!45259 () Bool)

(assert (=> b!45259 (= e!28680 (not (and (bvsle i!1489 size!30) (bvsle size!30 (size!1644 a!4412)))))))

(declare-fun arrayCountValidKeys!0 (array!2965 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45259 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1257 0))(
  ( (Unit!1258) )
))
(declare-fun lt!20072 () Unit!1257)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2965 (_ BitVec 32) (_ BitVec 32)) Unit!1257)

(assert (=> b!45259 (= lt!20072 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6954 res!26550) b!45259))

(declare-fun m!39697 () Bool)

(assert (=> start!6954 m!39697))

(declare-fun m!39699 () Bool)

(assert (=> start!6954 m!39699))

(declare-fun m!39701 () Bool)

(assert (=> b!45259 m!39701))

(declare-fun m!39703 () Bool)

(assert (=> b!45259 m!39703))

(check-sat (not b!45259) (not start!6954))
(check-sat)
