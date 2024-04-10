; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85536 () Bool)

(assert start!85536)

(declare-fun b!993798 () Bool)

(declare-fun res!664361 () Bool)

(declare-fun e!560796 () Bool)

(assert (=> b!993798 (=> (not res!664361) (not e!560796))))

(declare-datatypes ((List!20965 0))(
  ( (Nil!20962) (Cons!20961 (h!22123 (_ BitVec 64)) (t!29966 List!20965)) )
))
(declare-fun acc!919 () List!20965)

(declare-fun noDuplicate!1424 (List!20965) Bool)

(assert (=> b!993798 (= res!664361 (noDuplicate!1424 acc!919))))

(declare-fun b!993797 () Bool)

(declare-fun res!664362 () Bool)

(assert (=> b!993797 (=> (not res!664362) (not e!560796))))

(declare-fun contains!5826 (List!20965 (_ BitVec 64)) Bool)

(assert (=> b!993797 (= res!664362 (not (contains!5826 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664359 () Bool)

(assert (=> start!85536 (=> (not res!664359) (not e!560796))))

(declare-datatypes ((array!62815 0))(
  ( (array!62816 (arr!30250 (Array (_ BitVec 32) (_ BitVec 64))) (size!30747 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62815)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85536 (= res!664359 (and (= (size!30747 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62816 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30747 a!4424))))))

(assert (=> start!85536 e!560796))

(declare-fun array_inv!23374 (array!62815) Bool)

(assert (=> start!85536 (array_inv!23374 a!4424)))

(assert (=> start!85536 true))

(declare-fun b!993799 () Bool)

(assert (=> b!993799 (= e!560796 (bvslt (bvsub size!36 from!3778) #b00000000000000000000000000000000))))

(declare-fun b!993796 () Bool)

(declare-fun res!664360 () Bool)

(assert (=> b!993796 (=> (not res!664360) (not e!560796))))

(assert (=> b!993796 (= res!664360 (not (contains!5826 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85536 res!664359) b!993796))

(assert (= (and b!993796 res!664360) b!993797))

(assert (= (and b!993797 res!664362) b!993798))

(assert (= (and b!993798 res!664361) b!993799))

(declare-fun m!921457 () Bool)

(assert (=> b!993798 m!921457))

(declare-fun m!921459 () Bool)

(assert (=> b!993797 m!921459))

(declare-fun m!921461 () Bool)

(assert (=> start!85536 m!921461))

(declare-fun m!921463 () Bool)

(assert (=> b!993796 m!921463))

(push 1)

(assert (not start!85536))

(assert (not b!993796))

(assert (not b!993797))

(assert (not b!993798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

