; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85510 () Bool)

(assert start!85510)

(declare-fun b!993718 () Bool)

(declare-fun res!664282 () Bool)

(declare-fun e!560739 () Bool)

(assert (=> b!993718 (=> (not res!664282) (not e!560739))))

(declare-datatypes ((List!20957 0))(
  ( (Nil!20954) (Cons!20953 (h!22115 (_ BitVec 64)) (t!29958 List!20957)) )
))
(declare-fun acc!919 () List!20957)

(declare-fun contains!5818 (List!20957 (_ BitVec 64)) Bool)

(assert (=> b!993718 (= res!664282 (not (contains!5818 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993719 () Bool)

(declare-fun res!664281 () Bool)

(assert (=> b!993719 (=> (not res!664281) (not e!560739))))

(assert (=> b!993719 (= res!664281 (not (contains!5818 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62791 0))(
  ( (array!62792 (arr!30239 (Array (_ BitVec 32) (_ BitVec 64))) (size!30736 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62791)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!993721 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993721 (= e!560739 (and (bvsge from!3778 size!36) (bvsge (size!30736 a!4424) #b01111111111111111111111111111111)))))

(declare-fun res!664284 () Bool)

(assert (=> start!85510 (=> (not res!664284) (not e!560739))))

(assert (=> start!85510 (= res!664284 (and (= (size!30736 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62792 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30736 a!4424))))))

(assert (=> start!85510 e!560739))

(declare-fun array_inv!23363 (array!62791) Bool)

(assert (=> start!85510 (array_inv!23363 a!4424)))

(assert (=> start!85510 true))

(declare-fun b!993720 () Bool)

(declare-fun res!664283 () Bool)

(assert (=> b!993720 (=> (not res!664283) (not e!560739))))

(declare-fun noDuplicate!1416 (List!20957) Bool)

(assert (=> b!993720 (= res!664283 (noDuplicate!1416 acc!919))))

(assert (= (and start!85510 res!664284) b!993718))

(assert (= (and b!993718 res!664282) b!993719))

(assert (= (and b!993719 res!664281) b!993720))

(assert (= (and b!993720 res!664283) b!993721))

(declare-fun m!921387 () Bool)

(assert (=> b!993718 m!921387))

(declare-fun m!921389 () Bool)

(assert (=> b!993719 m!921389))

(declare-fun m!921391 () Bool)

(assert (=> start!85510 m!921391))

(declare-fun m!921393 () Bool)

(assert (=> b!993720 m!921393))

(check-sat (not b!993720) (not b!993719) (not start!85510) (not b!993718))
(check-sat)
