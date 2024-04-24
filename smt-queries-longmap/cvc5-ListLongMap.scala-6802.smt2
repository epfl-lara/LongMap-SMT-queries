; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85728 () Bool)

(assert start!85728)

(declare-fun res!664810 () Bool)

(declare-fun e!561444 () Bool)

(assert (=> start!85728 (=> (not res!664810) (not e!561444))))

(declare-datatypes ((array!62883 0))(
  ( (array!62884 (arr!30279 (Array (_ BitVec 32) (_ BitVec 64))) (size!30776 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62883)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85728 (= res!664810 (and (= (size!30776 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62884 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30776 a!4424))))))

(assert (=> start!85728 e!561444))

(declare-fun array_inv!23415 (array!62883) Bool)

(assert (=> start!85728 (array_inv!23415 a!4424)))

(assert (=> start!85728 true))

(declare-fun b!994805 () Bool)

(declare-fun res!664811 () Bool)

(assert (=> b!994805 (=> (not res!664811) (not e!561444))))

(declare-datatypes ((List!20965 0))(
  ( (Nil!20962) (Cons!20961 (h!22129 (_ BitVec 64)) (t!29958 List!20965)) )
))
(declare-fun acc!919 () List!20965)

(declare-fun contains!5859 (List!20965 (_ BitVec 64)) Bool)

(assert (=> b!994805 (= res!664811 (not (contains!5859 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994806 () Bool)

(declare-fun res!664809 () Bool)

(assert (=> b!994806 (=> (not res!664809) (not e!561444))))

(assert (=> b!994806 (= res!664809 (not (contains!5859 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994807 () Bool)

(assert (=> b!994807 (= e!561444 false)))

(declare-fun lt!441005 () Bool)

(declare-fun noDuplicate!1444 (List!20965) Bool)

(assert (=> b!994807 (= lt!441005 (noDuplicate!1444 acc!919))))

(assert (= (and start!85728 res!664810) b!994805))

(assert (= (and b!994805 res!664811) b!994806))

(assert (= (and b!994806 res!664809) b!994807))

(declare-fun m!922839 () Bool)

(assert (=> start!85728 m!922839))

(declare-fun m!922841 () Bool)

(assert (=> b!994805 m!922841))

(declare-fun m!922843 () Bool)

(assert (=> b!994806 m!922843))

(declare-fun m!922845 () Bool)

(assert (=> b!994807 m!922845))

(push 1)

(assert (not b!994806))

(assert (not b!994805))

(assert (not start!85728))

(assert (not b!994807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

