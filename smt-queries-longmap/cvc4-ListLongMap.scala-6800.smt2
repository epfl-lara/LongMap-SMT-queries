; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85528 () Bool)

(assert start!85528)

(declare-fun res!664292 () Bool)

(declare-fun e!560672 () Bool)

(assert (=> start!85528 (=> (not res!664292) (not e!560672))))

(declare-datatypes ((array!62761 0))(
  ( (array!62762 (arr!30223 (Array (_ BitVec 32) (_ BitVec 64))) (size!30721 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62761)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85528 (= res!664292 (and (= (size!30721 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62762 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30721 a!4424))))))

(assert (=> start!85528 e!560672))

(declare-fun array_inv!23366 (array!62761) Bool)

(assert (=> start!85528 (array_inv!23366 a!4424)))

(assert (=> start!85528 true))

(declare-fun b!993600 () Bool)

(declare-fun res!664294 () Bool)

(assert (=> b!993600 (=> (not res!664294) (not e!560672))))

(declare-datatypes ((List!21004 0))(
  ( (Nil!21001) (Cons!21000 (h!22162 (_ BitVec 64)) (t!29996 List!21004)) )
))
(declare-fun acc!919 () List!21004)

(declare-fun contains!5803 (List!21004 (_ BitVec 64)) Bool)

(assert (=> b!993600 (= res!664294 (not (contains!5803 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993601 () Bool)

(declare-fun res!664293 () Bool)

(assert (=> b!993601 (=> (not res!664293) (not e!560672))))

(assert (=> b!993601 (= res!664293 (not (contains!5803 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993602 () Bool)

(assert (=> b!993602 (= e!560672 false)))

(declare-fun lt!440387 () Bool)

(declare-fun noDuplicate!1436 (List!21004) Bool)

(assert (=> b!993602 (= lt!440387 (noDuplicate!1436 acc!919))))

(assert (= (and start!85528 res!664292) b!993600))

(assert (= (and b!993600 res!664294) b!993601))

(assert (= (and b!993601 res!664293) b!993602))

(declare-fun m!920731 () Bool)

(assert (=> start!85528 m!920731))

(declare-fun m!920733 () Bool)

(assert (=> b!993600 m!920733))

(declare-fun m!920735 () Bool)

(assert (=> b!993601 m!920735))

(declare-fun m!920737 () Bool)

(assert (=> b!993602 m!920737))

(push 1)

(assert (not b!993602))

(assert (not start!85528))

(assert (not b!993601))

(assert (not b!993600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

