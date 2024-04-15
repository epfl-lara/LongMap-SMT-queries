; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85548 () Bool)

(assert start!85548)

(declare-fun res!664391 () Bool)

(declare-fun e!560732 () Bool)

(assert (=> start!85548 (=> (not res!664391) (not e!560732))))

(declare-datatypes ((array!62781 0))(
  ( (array!62782 (arr!30233 (Array (_ BitVec 32) (_ BitVec 64))) (size!30731 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62781)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85548 (= res!664391 (and (= (size!30731 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62782 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30731 a!4424))))))

(assert (=> start!85548 e!560732))

(declare-fun array_inv!23376 (array!62781) Bool)

(assert (=> start!85548 (array_inv!23376 a!4424)))

(assert (=> start!85548 true))

(declare-fun b!993700 () Bool)

(declare-fun res!664390 () Bool)

(assert (=> b!993700 (=> (not res!664390) (not e!560732))))

(declare-datatypes ((List!21014 0))(
  ( (Nil!21011) (Cons!21010 (h!22172 (_ BitVec 64)) (t!30006 List!21014)) )
))
(declare-fun acc!919 () List!21014)

(declare-fun noDuplicate!1446 (List!21014) Bool)

(assert (=> b!993700 (= res!664390 (noDuplicate!1446 acc!919))))

(declare-fun b!993701 () Bool)

(assert (=> b!993701 (= e!560732 (and (bvslt from!3778 size!36) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3778) (size!30731 a!4424)))))))

(declare-fun b!993698 () Bool)

(declare-fun res!664392 () Bool)

(assert (=> b!993698 (=> (not res!664392) (not e!560732))))

(declare-fun contains!5813 (List!21014 (_ BitVec 64)) Bool)

(assert (=> b!993698 (= res!664392 (not (contains!5813 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993699 () Bool)

(declare-fun res!664393 () Bool)

(assert (=> b!993699 (=> (not res!664393) (not e!560732))))

(assert (=> b!993699 (= res!664393 (not (contains!5813 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85548 res!664391) b!993698))

(assert (= (and b!993698 res!664392) b!993699))

(assert (= (and b!993699 res!664393) b!993700))

(assert (= (and b!993700 res!664390) b!993701))

(declare-fun m!920811 () Bool)

(assert (=> start!85548 m!920811))

(declare-fun m!920813 () Bool)

(assert (=> b!993700 m!920813))

(declare-fun m!920815 () Bool)

(assert (=> b!993698 m!920815))

(declare-fun m!920817 () Bool)

(assert (=> b!993699 m!920817))

(push 1)

(assert (not start!85548))

(assert (not b!993698))

(assert (not b!993699))

(assert (not b!993700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

