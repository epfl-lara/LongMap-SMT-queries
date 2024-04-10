; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85506 () Bool)

(assert start!85506)

(declare-fun res!664258 () Bool)

(declare-fun e!560726 () Bool)

(assert (=> start!85506 (=> (not res!664258) (not e!560726))))

(declare-datatypes ((array!62787 0))(
  ( (array!62788 (arr!30237 (Array (_ BitVec 32) (_ BitVec 64))) (size!30734 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62787)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85506 (= res!664258 (and (= (size!30734 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62788 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30734 a!4424))))))

(assert (=> start!85506 e!560726))

(declare-fun array_inv!23361 (array!62787) Bool)

(assert (=> start!85506 (array_inv!23361 a!4424)))

(assert (=> start!85506 true))

(declare-fun b!993695 () Bool)

(declare-fun res!664260 () Bool)

(assert (=> b!993695 (=> (not res!664260) (not e!560726))))

(declare-datatypes ((List!20955 0))(
  ( (Nil!20952) (Cons!20951 (h!22113 (_ BitVec 64)) (t!29956 List!20955)) )
))
(declare-fun acc!919 () List!20955)

(declare-fun contains!5816 (List!20955 (_ BitVec 64)) Bool)

(assert (=> b!993695 (= res!664260 (not (contains!5816 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993696 () Bool)

(declare-fun res!664259 () Bool)

(assert (=> b!993696 (=> (not res!664259) (not e!560726))))

(assert (=> b!993696 (= res!664259 (not (contains!5816 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993697 () Bool)

(assert (=> b!993697 (= e!560726 false)))

(declare-fun lt!440599 () Bool)

(declare-fun noDuplicate!1414 (List!20955) Bool)

(assert (=> b!993697 (= lt!440599 (noDuplicate!1414 acc!919))))

(assert (= (and start!85506 res!664258) b!993695))

(assert (= (and b!993695 res!664260) b!993696))

(assert (= (and b!993696 res!664259) b!993697))

(declare-fun m!921371 () Bool)

(assert (=> start!85506 m!921371))

(declare-fun m!921373 () Bool)

(assert (=> b!993695 m!921373))

(declare-fun m!921375 () Bool)

(assert (=> b!993696 m!921375))

(declare-fun m!921377 () Bool)

(assert (=> b!993697 m!921377))

(push 1)

(assert (not b!993697))

(assert (not b!993695))

(assert (not start!85506))

(assert (not b!993696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

