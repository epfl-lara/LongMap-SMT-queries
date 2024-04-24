; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85734 () Bool)

(assert start!85734)

(declare-fun b!994842 () Bool)

(declare-fun res!664845 () Bool)

(declare-fun e!561461 () Bool)

(assert (=> b!994842 (=> (not res!664845) (not e!561461))))

(declare-datatypes ((List!20968 0))(
  ( (Nil!20965) (Cons!20964 (h!22132 (_ BitVec 64)) (t!29961 List!20968)) )
))
(declare-fun acc!919 () List!20968)

(declare-fun noDuplicate!1447 (List!20968) Bool)

(assert (=> b!994842 (= res!664845 (noDuplicate!1447 acc!919))))

(declare-fun b!994840 () Bool)

(declare-fun res!664846 () Bool)

(assert (=> b!994840 (=> (not res!664846) (not e!561461))))

(declare-fun contains!5862 (List!20968 (_ BitVec 64)) Bool)

(assert (=> b!994840 (= res!664846 (not (contains!5862 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62889 0))(
  ( (array!62890 (arr!30282 (Array (_ BitVec 32) (_ BitVec 64))) (size!30779 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62889)

(declare-fun b!994843 () Bool)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994843 (= e!561461 (and (bvslt from!3778 size!36) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3778) (size!30779 a!4424)))))))

(declare-fun res!664844 () Bool)

(assert (=> start!85734 (=> (not res!664844) (not e!561461))))

(assert (=> start!85734 (= res!664844 (and (= (size!30779 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62890 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30779 a!4424))))))

(assert (=> start!85734 e!561461))

(declare-fun array_inv!23418 (array!62889) Bool)

(assert (=> start!85734 (array_inv!23418 a!4424)))

(assert (=> start!85734 true))

(declare-fun b!994841 () Bool)

(declare-fun res!664847 () Bool)

(assert (=> b!994841 (=> (not res!664847) (not e!561461))))

(assert (=> b!994841 (= res!664847 (not (contains!5862 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85734 res!664844) b!994840))

(assert (= (and b!994840 res!664846) b!994841))

(assert (= (and b!994841 res!664847) b!994842))

(assert (= (and b!994842 res!664845) b!994843))

(declare-fun m!922863 () Bool)

(assert (=> b!994842 m!922863))

(declare-fun m!922865 () Bool)

(assert (=> b!994840 m!922865))

(declare-fun m!922867 () Bool)

(assert (=> start!85734 m!922867))

(declare-fun m!922869 () Bool)

(assert (=> b!994841 m!922869))

(push 1)

(assert (not b!994841))

(assert (not start!85734))

(assert (not b!994840))

(assert (not b!994842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

