; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85740 () Bool)

(assert start!85740)

(declare-fun res!664874 () Bool)

(declare-fun e!561479 () Bool)

(assert (=> start!85740 (=> (not res!664874) (not e!561479))))

(declare-datatypes ((array!62895 0))(
  ( (array!62896 (arr!30285 (Array (_ BitVec 32) (_ BitVec 64))) (size!30782 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62895)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85740 (= res!664874 (and (= (size!30782 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62896 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30782 a!4424))))))

(assert (=> start!85740 e!561479))

(declare-fun array_inv!23421 (array!62895) Bool)

(assert (=> start!85740 (array_inv!23421 a!4424)))

(assert (=> start!85740 true))

(declare-fun b!994868 () Bool)

(declare-fun res!664872 () Bool)

(assert (=> b!994868 (=> (not res!664872) (not e!561479))))

(declare-datatypes ((List!20971 0))(
  ( (Nil!20968) (Cons!20967 (h!22135 (_ BitVec 64)) (t!29964 List!20971)) )
))
(declare-fun acc!919 () List!20971)

(declare-fun contains!5865 (List!20971 (_ BitVec 64)) Bool)

(assert (=> b!994868 (= res!664872 (not (contains!5865 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994869 () Bool)

(declare-fun res!664873 () Bool)

(assert (=> b!994869 (=> (not res!664873) (not e!561479))))

(assert (=> b!994869 (= res!664873 (not (contains!5865 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994870 () Bool)

(assert (=> b!994870 (= e!561479 false)))

(declare-fun lt!441014 () Bool)

(declare-fun noDuplicate!1450 (List!20971) Bool)

(assert (=> b!994870 (= lt!441014 (noDuplicate!1450 acc!919))))

(assert (= (and start!85740 res!664874) b!994868))

(assert (= (and b!994868 res!664872) b!994869))

(assert (= (and b!994869 res!664873) b!994870))

(declare-fun m!922887 () Bool)

(assert (=> start!85740 m!922887))

(declare-fun m!922889 () Bool)

(assert (=> b!994868 m!922889))

(declare-fun m!922891 () Bool)

(assert (=> b!994869 m!922891))

(declare-fun m!922893 () Bool)

(assert (=> b!994870 m!922893))

(push 1)

(assert (not b!994869))

(assert (not b!994870))

(assert (not start!85740))

(assert (not b!994868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

