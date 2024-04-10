; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85524 () Bool)

(assert start!85524)

(declare-fun res!664349 () Bool)

(declare-fun e!560780 () Bool)

(assert (=> start!85524 (=> (not res!664349) (not e!560780))))

(declare-datatypes ((array!62805 0))(
  ( (array!62806 (arr!30246 (Array (_ BitVec 32) (_ BitVec 64))) (size!30743 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62805)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85524 (= res!664349 (and (= (size!30743 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62806 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30743 a!4424))))))

(assert (=> start!85524 e!560780))

(declare-fun array_inv!23370 (array!62805) Bool)

(assert (=> start!85524 (array_inv!23370 a!4424)))

(assert (=> start!85524 true))

(declare-fun b!993785 () Bool)

(declare-fun res!664350 () Bool)

(assert (=> b!993785 (=> (not res!664350) (not e!560780))))

(declare-datatypes ((List!20964 0))(
  ( (Nil!20961) (Cons!20960 (h!22122 (_ BitVec 64)) (t!29965 List!20964)) )
))
(declare-fun acc!919 () List!20964)

(declare-fun contains!5825 (List!20964 (_ BitVec 64)) Bool)

(assert (=> b!993785 (= res!664350 (not (contains!5825 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993786 () Bool)

(declare-fun res!664348 () Bool)

(assert (=> b!993786 (=> (not res!664348) (not e!560780))))

(assert (=> b!993786 (= res!664348 (not (contains!5825 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993787 () Bool)

(assert (=> b!993787 (= e!560780 false)))

(declare-fun lt!440617 () Bool)

(declare-fun noDuplicate!1423 (List!20964) Bool)

(assert (=> b!993787 (= lt!440617 (noDuplicate!1423 acc!919))))

(assert (= (and start!85524 res!664349) b!993785))

(assert (= (and b!993785 res!664350) b!993786))

(assert (= (and b!993786 res!664348) b!993787))

(declare-fun m!921443 () Bool)

(assert (=> start!85524 m!921443))

(declare-fun m!921445 () Bool)

(assert (=> b!993785 m!921445))

(declare-fun m!921447 () Bool)

(assert (=> b!993786 m!921447))

(declare-fun m!921449 () Bool)

(assert (=> b!993787 m!921449))

(push 1)

(assert (not b!993785))

(assert (not b!993786))

(assert (not start!85524))

(assert (not b!993787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

