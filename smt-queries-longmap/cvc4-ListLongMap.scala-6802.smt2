; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85558 () Bool)

(assert start!85558)

(declare-fun res!664465 () Bool)

(declare-fun e!560862 () Bool)

(assert (=> start!85558 (=> (not res!664465) (not e!560862))))

(declare-datatypes ((array!62837 0))(
  ( (array!62838 (arr!30261 (Array (_ BitVec 32) (_ BitVec 64))) (size!30758 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62837)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85558 (= res!664465 (and (= (size!30758 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62838 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30758 a!4424))))))

(assert (=> start!85558 e!560862))

(declare-fun array_inv!23385 (array!62837) Bool)

(assert (=> start!85558 (array_inv!23385 a!4424)))

(assert (=> start!85558 true))

(declare-fun b!993902 () Bool)

(declare-fun res!664467 () Bool)

(assert (=> b!993902 (=> (not res!664467) (not e!560862))))

(declare-datatypes ((List!20976 0))(
  ( (Nil!20973) (Cons!20972 (h!22134 (_ BitVec 64)) (t!29977 List!20976)) )
))
(declare-fun acc!919 () List!20976)

(declare-fun contains!5837 (List!20976 (_ BitVec 64)) Bool)

(assert (=> b!993902 (= res!664467 (not (contains!5837 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993903 () Bool)

(declare-fun res!664466 () Bool)

(assert (=> b!993903 (=> (not res!664466) (not e!560862))))

(assert (=> b!993903 (= res!664466 (not (contains!5837 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993904 () Bool)

(assert (=> b!993904 (= e!560862 false)))

(declare-fun lt!440644 () Bool)

(declare-fun noDuplicate!1435 (List!20976) Bool)

(assert (=> b!993904 (= lt!440644 (noDuplicate!1435 acc!919))))

(assert (= (and start!85558 res!664465) b!993902))

(assert (= (and b!993902 res!664467) b!993903))

(assert (= (and b!993903 res!664466) b!993904))

(declare-fun m!921545 () Bool)

(assert (=> start!85558 m!921545))

(declare-fun m!921547 () Bool)

(assert (=> b!993902 m!921547))

(declare-fun m!921549 () Bool)

(assert (=> b!993903 m!921549))

(declare-fun m!921551 () Bool)

(assert (=> b!993904 m!921551))

(push 1)

(assert (not b!993902))

(assert (not b!993903))

(assert (not start!85558))

(assert (not b!993904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

