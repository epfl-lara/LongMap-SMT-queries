; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85548 () Bool)

(assert start!85548)

(declare-fun res!664422 () Bool)

(declare-fun e!560832 () Bool)

(assert (=> start!85548 (=> (not res!664422) (not e!560832))))

(declare-datatypes ((array!62827 0))(
  ( (array!62828 (arr!30256 (Array (_ BitVec 32) (_ BitVec 64))) (size!30753 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62827)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85548 (= res!664422 (and (= (size!30753 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62828 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30753 a!4424))))))

(assert (=> start!85548 e!560832))

(declare-fun array_inv!23380 (array!62827) Bool)

(assert (=> start!85548 (array_inv!23380 a!4424)))

(assert (=> start!85548 true))

(declare-fun b!993857 () Bool)

(declare-fun res!664421 () Bool)

(assert (=> b!993857 (=> (not res!664421) (not e!560832))))

(declare-datatypes ((List!20971 0))(
  ( (Nil!20968) (Cons!20967 (h!22129 (_ BitVec 64)) (t!29972 List!20971)) )
))
(declare-fun acc!919 () List!20971)

(declare-fun contains!5832 (List!20971 (_ BitVec 64)) Bool)

(assert (=> b!993857 (= res!664421 (not (contains!5832 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993858 () Bool)

(declare-fun res!664420 () Bool)

(assert (=> b!993858 (=> (not res!664420) (not e!560832))))

(assert (=> b!993858 (= res!664420 (not (contains!5832 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993859 () Bool)

(assert (=> b!993859 (= e!560832 false)))

(declare-fun lt!440629 () Bool)

(declare-fun noDuplicate!1430 (List!20971) Bool)

(assert (=> b!993859 (= lt!440629 (noDuplicate!1430 acc!919))))

(assert (= (and start!85548 res!664422) b!993857))

(assert (= (and b!993857 res!664421) b!993858))

(assert (= (and b!993858 res!664420) b!993859))

(declare-fun m!921505 () Bool)

(assert (=> start!85548 m!921505))

(declare-fun m!921507 () Bool)

(assert (=> b!993857 m!921507))

(declare-fun m!921509 () Bool)

(assert (=> b!993858 m!921509))

(declare-fun m!921511 () Bool)

(assert (=> b!993859 m!921511))

(push 1)

(assert (not b!993857))

(assert (not b!993858))

(assert (not start!85548))

(assert (not b!993859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

