; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85540 () Bool)

(assert start!85540)

(declare-fun b!993820 () Bool)

(declare-fun res!664385 () Bool)

(declare-fun e!560807 () Bool)

(assert (=> b!993820 (=> (not res!664385) (not e!560807))))

(declare-datatypes ((List!20967 0))(
  ( (Nil!20964) (Cons!20963 (h!22125 (_ BitVec 64)) (t!29968 List!20967)) )
))
(declare-fun acc!919 () List!20967)

(declare-fun contains!5828 (List!20967 (_ BitVec 64)) Bool)

(assert (=> b!993820 (= res!664385 (not (contains!5828 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993823 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> b!993823 (= e!560807 (bvslt (bvsub size!36 from!3778) #b00000000000000000000000000000000))))

(declare-fun b!993822 () Bool)

(declare-fun res!664386 () Bool)

(assert (=> b!993822 (=> (not res!664386) (not e!560807))))

(declare-fun noDuplicate!1426 (List!20967) Bool)

(assert (=> b!993822 (= res!664386 (noDuplicate!1426 acc!919))))

(declare-fun res!664383 () Bool)

(assert (=> start!85540 (=> (not res!664383) (not e!560807))))

(declare-datatypes ((array!62819 0))(
  ( (array!62820 (arr!30252 (Array (_ BitVec 32) (_ BitVec 64))) (size!30749 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62819)

(assert (=> start!85540 (= res!664383 (and (= (size!30749 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62820 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30749 a!4424))))))

(assert (=> start!85540 e!560807))

(declare-fun array_inv!23376 (array!62819) Bool)

(assert (=> start!85540 (array_inv!23376 a!4424)))

(assert (=> start!85540 true))

(declare-fun b!993821 () Bool)

(declare-fun res!664384 () Bool)

(assert (=> b!993821 (=> (not res!664384) (not e!560807))))

(assert (=> b!993821 (= res!664384 (not (contains!5828 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85540 res!664383) b!993820))

(assert (= (and b!993820 res!664385) b!993821))

(assert (= (and b!993821 res!664384) b!993822))

(assert (= (and b!993822 res!664386) b!993823))

(declare-fun m!921473 () Bool)

(assert (=> b!993820 m!921473))

(declare-fun m!921475 () Bool)

(assert (=> b!993822 m!921475))

(declare-fun m!921477 () Bool)

(assert (=> start!85540 m!921477))

(declare-fun m!921479 () Bool)

(assert (=> b!993821 m!921479))

(push 1)

(assert (not b!993820))

(assert (not b!993821))

(assert (not b!993822))

(assert (not start!85540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

