; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85478 () Bool)

(assert start!85478)

(declare-fun b!993501 () Bool)

(declare-fun res!664066 () Bool)

(declare-fun e!560643 () Bool)

(assert (=> b!993501 (=> (not res!664066) (not e!560643))))

(declare-datatypes ((List!20941 0))(
  ( (Nil!20938) (Cons!20937 (h!22099 (_ BitVec 64)) (t!29942 List!20941)) )
))
(declare-fun acc!919 () List!20941)

(declare-fun contains!5802 (List!20941 (_ BitVec 64)) Bool)

(assert (=> b!993501 (= res!664066 (not (contains!5802 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993502 () Bool)

(assert (=> b!993502 (= e!560643 (not true))))

(declare-datatypes ((array!62759 0))(
  ( (array!62760 (arr!30223 (Array (_ BitVec 32) (_ BitVec 64))) (size!30720 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62759)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!62759 (_ BitVec 32) List!20941) Bool)

(assert (=> b!993502 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-fun size!36 () (_ BitVec 32))

(declare-datatypes ((Unit!32916 0))(
  ( (Unit!32917) )
))
(declare-fun lt!440557 () Unit!32916)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62759 (_ BitVec 32) (_ BitVec 32) List!20941) Unit!32916)

(assert (=> b!993502 (= lt!440557 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun res!664065 () Bool)

(assert (=> start!85478 (=> (not res!664065) (not e!560643))))

(assert (=> start!85478 (= res!664065 (and (= (size!30720 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62760 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30720 a!4424))))))

(assert (=> start!85478 e!560643))

(declare-fun array_inv!23347 (array!62759) Bool)

(assert (=> start!85478 (array_inv!23347 a!4424)))

(assert (=> start!85478 true))

(declare-fun b!993503 () Bool)

(declare-fun res!664068 () Bool)

(assert (=> b!993503 (=> (not res!664068) (not e!560643))))

(assert (=> b!993503 (= res!664068 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30720 a!4424))))))

(declare-fun b!993504 () Bool)

(declare-fun res!664067 () Bool)

(assert (=> b!993504 (=> (not res!664067) (not e!560643))))

(declare-fun noDuplicate!1400 (List!20941) Bool)

(assert (=> b!993504 (= res!664067 (noDuplicate!1400 acc!919))))

(declare-fun b!993505 () Bool)

(declare-fun res!664064 () Bool)

(assert (=> b!993505 (=> (not res!664064) (not e!560643))))

(assert (=> b!993505 (= res!664064 (not (contains!5802 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85478 res!664065) b!993501))

(assert (= (and b!993501 res!664066) b!993505))

(assert (= (and b!993505 res!664064) b!993504))

(assert (= (and b!993504 res!664067) b!993503))

(assert (= (and b!993503 res!664068) b!993502))

(declare-fun m!921211 () Bool)

(assert (=> b!993505 m!921211))

(declare-fun m!921213 () Bool)

(assert (=> start!85478 m!921213))

(declare-fun m!921215 () Bool)

(assert (=> b!993502 m!921215))

(declare-fun m!921217 () Bool)

(assert (=> b!993502 m!921217))

(declare-fun m!921219 () Bool)

(assert (=> b!993504 m!921219))

(declare-fun m!921221 () Bool)

(assert (=> b!993501 m!921221))

(push 1)

(assert (not b!993502))

(assert (not b!993501))

(assert (not start!85478))

(assert (not b!993505))

(assert (not b!993504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

