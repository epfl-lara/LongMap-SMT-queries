; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85520 () Bool)

(assert start!85520)

(declare-fun res!664331 () Bool)

(declare-fun e!560768 () Bool)

(assert (=> start!85520 (=> (not res!664331) (not e!560768))))

(declare-datatypes ((array!62801 0))(
  ( (array!62802 (arr!30244 (Array (_ BitVec 32) (_ BitVec 64))) (size!30741 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62801)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85520 (= res!664331 (and (= (size!30741 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62802 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30741 a!4424))))))

(assert (=> start!85520 e!560768))

(declare-fun array_inv!23368 (array!62801) Bool)

(assert (=> start!85520 (array_inv!23368 a!4424)))

(assert (=> start!85520 true))

(declare-fun b!993767 () Bool)

(declare-fun res!664330 () Bool)

(assert (=> b!993767 (=> (not res!664330) (not e!560768))))

(declare-datatypes ((List!20962 0))(
  ( (Nil!20959) (Cons!20958 (h!22120 (_ BitVec 64)) (t!29963 List!20962)) )
))
(declare-fun acc!919 () List!20962)

(declare-fun contains!5823 (List!20962 (_ BitVec 64)) Bool)

(assert (=> b!993767 (= res!664330 (not (contains!5823 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993768 () Bool)

(declare-fun res!664332 () Bool)

(assert (=> b!993768 (=> (not res!664332) (not e!560768))))

(assert (=> b!993768 (= res!664332 (not (contains!5823 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993769 () Bool)

(assert (=> b!993769 (= e!560768 false)))

(declare-fun lt!440611 () Bool)

(declare-fun noDuplicate!1421 (List!20962) Bool)

(assert (=> b!993769 (= lt!440611 (noDuplicate!1421 acc!919))))

(assert (= (and start!85520 res!664331) b!993767))

(assert (= (and b!993767 res!664330) b!993768))

(assert (= (and b!993768 res!664332) b!993769))

(declare-fun m!921427 () Bool)

(assert (=> start!85520 m!921427))

(declare-fun m!921429 () Bool)

(assert (=> b!993767 m!921429))

(declare-fun m!921431 () Bool)

(assert (=> b!993768 m!921431))

(declare-fun m!921433 () Bool)

(assert (=> b!993769 m!921433))

(push 1)

(assert (not b!993769))

(assert (not b!993767))

(assert (not b!993768))

(assert (not start!85520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

