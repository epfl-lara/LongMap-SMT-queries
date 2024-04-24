; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85616 () Bool)

(assert start!85616)

(declare-fun res!664270 () Bool)

(declare-fun e!561135 () Bool)

(assert (=> start!85616 (=> (not res!664270) (not e!561135))))

(declare-datatypes ((array!62774 0))(
  ( (array!62775 (arr!30226 (Array (_ BitVec 32) (_ BitVec 64))) (size!30723 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62774)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85616 (= res!664270 (and (= (size!30723 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62775 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30723 a!4424))))))

(assert (=> start!85616 e!561135))

(declare-fun array_inv!23362 (array!62774) Bool)

(assert (=> start!85616 (array_inv!23362 a!4424)))

(assert (=> start!85616 true))

(declare-fun b!994265 () Bool)

(declare-fun res!664271 () Bool)

(assert (=> b!994265 (=> (not res!664271) (not e!561135))))

(declare-datatypes ((List!20915 0))(
  ( (Nil!20912) (Cons!20911 (h!22079 (_ BitVec 64)) (t!29908 List!20915)) )
))
(declare-fun acc!919 () List!20915)

(declare-fun contains!5809 (List!20915 (_ BitVec 64)) Bool)

(assert (=> b!994265 (= res!664271 (not (contains!5809 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994266 () Bool)

(declare-fun res!664269 () Bool)

(assert (=> b!994266 (=> (not res!664269) (not e!561135))))

(assert (=> b!994266 (= res!664269 (not (contains!5809 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994267 () Bool)

(assert (=> b!994267 (= e!561135 false)))

(declare-fun lt!440873 () Bool)

(declare-fun noDuplicate!1394 (List!20915) Bool)

(assert (=> b!994267 (= lt!440873 (noDuplicate!1394 acc!919))))

(assert (= (and start!85616 res!664270) b!994265))

(assert (= (and b!994265 res!664271) b!994266))

(assert (= (and b!994266 res!664269) b!994267))

(declare-fun m!922385 () Bool)

(assert (=> start!85616 m!922385))

(declare-fun m!922387 () Bool)

(assert (=> b!994265 m!922387))

(declare-fun m!922389 () Bool)

(assert (=> b!994266 m!922389))

(declare-fun m!922391 () Bool)

(assert (=> b!994267 m!922391))

(check-sat (not b!994266) (not b!994267) (not start!85616) (not b!994265))
(check-sat)
