; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85746 () Bool)

(assert start!85746)

(declare-fun res!664900 () Bool)

(declare-fun e!561498 () Bool)

(assert (=> start!85746 (=> (not res!664900) (not e!561498))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(declare-datatypes ((array!62901 0))(
  ( (array!62902 (arr!30288 (Array (_ BitVec 32) (_ BitVec 64))) (size!30785 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62901)

(assert (=> start!85746 (= res!664900 (and (= (size!30785 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62902 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30785 a!4424))))))

(assert (=> start!85746 e!561498))

(declare-fun array_inv!23424 (array!62901) Bool)

(assert (=> start!85746 (array_inv!23424 a!4424)))

(assert (=> start!85746 true))

(declare-fun b!994895 () Bool)

(declare-fun res!664901 () Bool)

(assert (=> b!994895 (=> (not res!664901) (not e!561498))))

(declare-datatypes ((List!20974 0))(
  ( (Nil!20971) (Cons!20970 (h!22138 (_ BitVec 64)) (t!29967 List!20974)) )
))
(declare-fun acc!919 () List!20974)

(declare-fun contains!5868 (List!20974 (_ BitVec 64)) Bool)

(assert (=> b!994895 (= res!664901 (not (contains!5868 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994896 () Bool)

(declare-fun res!664899 () Bool)

(assert (=> b!994896 (=> (not res!664899) (not e!561498))))

(assert (=> b!994896 (= res!664899 (not (contains!5868 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994897 () Bool)

(assert (=> b!994897 (= e!561498 false)))

(declare-fun lt!441023 () Bool)

(declare-fun noDuplicate!1453 (List!20974) Bool)

(assert (=> b!994897 (= lt!441023 (noDuplicate!1453 acc!919))))

(assert (= (and start!85746 res!664900) b!994895))

(assert (= (and b!994895 res!664901) b!994896))

(assert (= (and b!994896 res!664899) b!994897))

(declare-fun m!922911 () Bool)

(assert (=> start!85746 m!922911))

(declare-fun m!922913 () Bool)

(assert (=> b!994895 m!922913))

(declare-fun m!922915 () Bool)

(assert (=> b!994896 m!922915))

(declare-fun m!922917 () Bool)

(assert (=> b!994897 m!922917))

(push 1)

(assert (not b!994895))

(assert (not b!994897))

(assert (not start!85746))

(assert (not b!994896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

