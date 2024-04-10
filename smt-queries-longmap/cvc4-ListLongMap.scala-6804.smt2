; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85570 () Bool)

(assert start!85570)

(declare-fun res!664528 () Bool)

(declare-fun e!560898 () Bool)

(assert (=> start!85570 (=> (not res!664528) (not e!560898))))

(declare-datatypes ((array!62849 0))(
  ( (array!62850 (arr!30267 (Array (_ BitVec 32) (_ BitVec 64))) (size!30764 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62849)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85570 (= res!664528 (and (= (size!30764 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62850 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30764 a!4424))))))

(assert (=> start!85570 e!560898))

(declare-fun array_inv!23391 (array!62849) Bool)

(assert (=> start!85570 (array_inv!23391 a!4424)))

(assert (=> start!85570 true))

(declare-fun b!993965 () Bool)

(declare-fun res!664530 () Bool)

(assert (=> b!993965 (=> (not res!664530) (not e!560898))))

(declare-datatypes ((List!20982 0))(
  ( (Nil!20979) (Cons!20978 (h!22140 (_ BitVec 64)) (t!29983 List!20982)) )
))
(declare-fun acc!919 () List!20982)

(declare-fun contains!5843 (List!20982 (_ BitVec 64)) Bool)

(assert (=> b!993965 (= res!664530 (not (contains!5843 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993966 () Bool)

(declare-fun res!664529 () Bool)

(assert (=> b!993966 (=> (not res!664529) (not e!560898))))

(assert (=> b!993966 (= res!664529 (not (contains!5843 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993967 () Bool)

(assert (=> b!993967 (= e!560898 false)))

(declare-fun lt!440653 () Bool)

(declare-fun noDuplicate!1441 (List!20982) Bool)

(assert (=> b!993967 (= lt!440653 (noDuplicate!1441 acc!919))))

(assert (= (and start!85570 res!664528) b!993965))

(assert (= (and b!993965 res!664530) b!993966))

(assert (= (and b!993966 res!664529) b!993967))

(declare-fun m!921593 () Bool)

(assert (=> start!85570 m!921593))

(declare-fun m!921595 () Bool)

(assert (=> b!993965 m!921595))

(declare-fun m!921597 () Bool)

(assert (=> b!993966 m!921597))

(declare-fun m!921599 () Bool)

(assert (=> b!993967 m!921599))

(push 1)

(assert (not b!993965))

(assert (not b!993967))

(assert (not start!85570))

(assert (not b!993966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

