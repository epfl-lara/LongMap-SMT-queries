; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6956 () Bool)

(assert start!6956)

(declare-fun res!26536 () Bool)

(declare-fun e!28651 () Bool)

(assert (=> start!6956 (=> (not res!26536) (not e!28651))))

(declare-datatypes ((array!2947 0))(
  ( (array!2948 (arr!1417 (Array (_ BitVec 32) (_ BitVec 64))) (size!1635 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2947)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6956 (= res!26536 (and (bvslt (size!1635 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1635 a!4412)) (= (size!1635 a!4412) size!30) (= a!4412 (array!2948 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1417 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1635 a!4412))))))

(assert (=> start!6956 e!28651))

(declare-fun array_inv!840 (array!2947) Bool)

(assert (=> start!6956 (array_inv!840 a!4412)))

(assert (=> start!6956 true))

(declare-fun b!45191 () Bool)

(assert (=> b!45191 (= e!28651 (not true))))

(declare-fun arrayCountValidKeys!0 (array!2947 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45191 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1270 0))(
  ( (Unit!1271) )
))
(declare-fun lt!20066 () Unit!1270)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2947 (_ BitVec 32) (_ BitVec 32)) Unit!1270)

(assert (=> b!45191 (= lt!20066 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6956 res!26536) b!45191))

(declare-fun m!39633 () Bool)

(assert (=> start!6956 m!39633))

(declare-fun m!39635 () Bool)

(assert (=> start!6956 m!39635))

(declare-fun m!39637 () Bool)

(assert (=> b!45191 m!39637))

(declare-fun m!39639 () Bool)

(assert (=> b!45191 m!39639))

(push 1)

(assert (not b!45191))

(assert (not start!6956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

