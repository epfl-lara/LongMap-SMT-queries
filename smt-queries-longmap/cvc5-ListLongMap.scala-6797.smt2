; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85506 () Bool)

(assert start!85506)

(declare-fun res!664239 () Bool)

(declare-fun e!560633 () Bool)

(assert (=> start!85506 (=> (not res!664239) (not e!560633))))

(declare-datatypes ((array!62742 0))(
  ( (array!62743 (arr!30215 (Array (_ BitVec 32) (_ BitVec 64))) (size!30713 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62742)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85506 (= res!664239 (and (= (size!30713 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62743 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30713 a!4424))))))

(assert (=> start!85506 e!560633))

(declare-fun array_inv!23358 (array!62742) Bool)

(assert (=> start!85506 (array_inv!23358 a!4424)))

(assert (=> start!85506 true))

(declare-fun b!993546 () Bool)

(declare-fun res!664240 () Bool)

(assert (=> b!993546 (=> (not res!664240) (not e!560633))))

(declare-datatypes ((List!20999 0))(
  ( (Nil!20996) (Cons!20995 (h!22157 (_ BitVec 64)) (t!29991 List!20999)) )
))
(declare-fun acc!919 () List!20999)

(declare-fun contains!5798 (List!20999 (_ BitVec 64)) Bool)

(assert (=> b!993546 (= res!664240 (not (contains!5798 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993547 () Bool)

(declare-fun res!664238 () Bool)

(assert (=> b!993547 (=> (not res!664238) (not e!560633))))

(assert (=> b!993547 (= res!664238 (not (contains!5798 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993548 () Bool)

(assert (=> b!993548 (= e!560633 false)))

(declare-fun lt!440381 () Bool)

(declare-fun noDuplicate!1431 (List!20999) Bool)

(assert (=> b!993548 (= lt!440381 (noDuplicate!1431 acc!919))))

(assert (= (and start!85506 res!664239) b!993546))

(assert (= (and b!993546 res!664240) b!993547))

(assert (= (and b!993547 res!664238) b!993548))

(declare-fun m!920685 () Bool)

(assert (=> start!85506 m!920685))

(declare-fun m!920687 () Bool)

(assert (=> b!993546 m!920687))

(declare-fun m!920689 () Bool)

(assert (=> b!993547 m!920689))

(declare-fun m!920691 () Bool)

(assert (=> b!993548 m!920691))

(push 1)

(assert (not b!993546))

(assert (not b!993547))

(assert (not b!993548))

(assert (not start!85506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

