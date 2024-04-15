; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85542 () Bool)

(assert start!85542)

(declare-fun res!664357 () Bool)

(declare-fun e!560713 () Bool)

(assert (=> start!85542 (=> (not res!664357) (not e!560713))))

(declare-datatypes ((array!62775 0))(
  ( (array!62776 (arr!30230 (Array (_ BitVec 32) (_ BitVec 64))) (size!30728 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62775)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85542 (= res!664357 (and (= (size!30728 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62776 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30728 a!4424))))))

(assert (=> start!85542 e!560713))

(declare-fun array_inv!23373 (array!62775) Bool)

(assert (=> start!85542 (array_inv!23373 a!4424)))

(assert (=> start!85542 true))

(declare-fun b!993663 () Bool)

(declare-fun res!664356 () Bool)

(assert (=> b!993663 (=> (not res!664356) (not e!560713))))

(declare-datatypes ((List!21011 0))(
  ( (Nil!21008) (Cons!21007 (h!22169 (_ BitVec 64)) (t!30003 List!21011)) )
))
(declare-fun acc!919 () List!21011)

(declare-fun contains!5810 (List!21011 (_ BitVec 64)) Bool)

(assert (=> b!993663 (= res!664356 (not (contains!5810 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993664 () Bool)

(declare-fun res!664355 () Bool)

(assert (=> b!993664 (=> (not res!664355) (not e!560713))))

(assert (=> b!993664 (= res!664355 (not (contains!5810 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993665 () Bool)

(assert (=> b!993665 (= e!560713 false)))

(declare-fun lt!440408 () Bool)

(declare-fun noDuplicate!1443 (List!21011) Bool)

(assert (=> b!993665 (= lt!440408 (noDuplicate!1443 acc!919))))

(assert (= (and start!85542 res!664357) b!993663))

(assert (= (and b!993663 res!664356) b!993664))

(assert (= (and b!993664 res!664355) b!993665))

(declare-fun m!920787 () Bool)

(assert (=> start!85542 m!920787))

(declare-fun m!920789 () Bool)

(assert (=> b!993663 m!920789))

(declare-fun m!920791 () Bool)

(assert (=> b!993664 m!920791))

(declare-fun m!920793 () Bool)

(assert (=> b!993665 m!920793))

(push 1)

(assert (not b!993663))

(assert (not b!993664))

(assert (not start!85542))

(assert (not b!993665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

