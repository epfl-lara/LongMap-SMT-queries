; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85554 () Bool)

(assert start!85554)

(declare-fun res!664419 () Bool)

(declare-fun e!560750 () Bool)

(assert (=> start!85554 (=> (not res!664419) (not e!560750))))

(declare-datatypes ((array!62787 0))(
  ( (array!62788 (arr!30236 (Array (_ BitVec 32) (_ BitVec 64))) (size!30734 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62787)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85554 (= res!664419 (and (= (size!30734 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62788 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30734 a!4424))))))

(assert (=> start!85554 e!560750))

(declare-fun array_inv!23379 (array!62787) Bool)

(assert (=> start!85554 (array_inv!23379 a!4424)))

(assert (=> start!85554 true))

(declare-fun b!993726 () Bool)

(declare-fun res!664418 () Bool)

(assert (=> b!993726 (=> (not res!664418) (not e!560750))))

(declare-datatypes ((List!21017 0))(
  ( (Nil!21014) (Cons!21013 (h!22175 (_ BitVec 64)) (t!30009 List!21017)) )
))
(declare-fun acc!919 () List!21017)

(declare-fun contains!5816 (List!21017 (_ BitVec 64)) Bool)

(assert (=> b!993726 (= res!664418 (not (contains!5816 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993727 () Bool)

(declare-fun res!664420 () Bool)

(assert (=> b!993727 (=> (not res!664420) (not e!560750))))

(assert (=> b!993727 (= res!664420 (not (contains!5816 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993728 () Bool)

(assert (=> b!993728 (= e!560750 false)))

(declare-fun lt!440417 () Bool)

(declare-fun noDuplicate!1449 (List!21017) Bool)

(assert (=> b!993728 (= lt!440417 (noDuplicate!1449 acc!919))))

(assert (= (and start!85554 res!664419) b!993726))

(assert (= (and b!993726 res!664418) b!993727))

(assert (= (and b!993727 res!664420) b!993728))

(declare-fun m!920835 () Bool)

(assert (=> start!85554 m!920835))

(declare-fun m!920837 () Bool)

(assert (=> b!993726 m!920837))

(declare-fun m!920839 () Bool)

(assert (=> b!993727 m!920839))

(declare-fun m!920841 () Bool)

(assert (=> b!993728 m!920841))

(push 1)

(assert (not b!993727))

(assert (not b!993728))

(assert (not start!85554))

(assert (not b!993726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

