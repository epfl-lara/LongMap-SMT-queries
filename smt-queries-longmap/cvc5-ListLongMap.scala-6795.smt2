; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85508 () Bool)

(assert start!85508)

(declare-fun res!664271 () Bool)

(declare-fun e!560733 () Bool)

(assert (=> start!85508 (=> (not res!664271) (not e!560733))))

(declare-datatypes ((array!62789 0))(
  ( (array!62790 (arr!30238 (Array (_ BitVec 32) (_ BitVec 64))) (size!30735 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62789)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85508 (= res!664271 (and (= (size!30735 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62790 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30735 a!4424))))))

(assert (=> start!85508 e!560733))

(declare-fun array_inv!23362 (array!62789) Bool)

(assert (=> start!85508 (array_inv!23362 a!4424)))

(assert (=> start!85508 true))

(declare-fun b!993706 () Bool)

(declare-fun res!664269 () Bool)

(assert (=> b!993706 (=> (not res!664269) (not e!560733))))

(declare-datatypes ((List!20956 0))(
  ( (Nil!20953) (Cons!20952 (h!22114 (_ BitVec 64)) (t!29957 List!20956)) )
))
(declare-fun acc!919 () List!20956)

(declare-fun contains!5817 (List!20956 (_ BitVec 64)) Bool)

(assert (=> b!993706 (= res!664269 (not (contains!5817 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993708 () Bool)

(declare-fun res!664272 () Bool)

(assert (=> b!993708 (=> (not res!664272) (not e!560733))))

(declare-fun noDuplicate!1415 (List!20956) Bool)

(assert (=> b!993708 (= res!664272 (noDuplicate!1415 acc!919))))

(declare-fun b!993707 () Bool)

(declare-fun res!664270 () Bool)

(assert (=> b!993707 (=> (not res!664270) (not e!560733))))

(assert (=> b!993707 (= res!664270 (not (contains!5817 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993709 () Bool)

(assert (=> b!993709 (= e!560733 (and (bvsge from!3778 size!36) (bvsge (size!30735 a!4424) #b01111111111111111111111111111111)))))

(assert (= (and start!85508 res!664271) b!993706))

(assert (= (and b!993706 res!664269) b!993707))

(assert (= (and b!993707 res!664270) b!993708))

(assert (= (and b!993708 res!664272) b!993709))

(declare-fun m!921379 () Bool)

(assert (=> start!85508 m!921379))

(declare-fun m!921381 () Bool)

(assert (=> b!993706 m!921381))

(declare-fun m!921383 () Bool)

(assert (=> b!993708 m!921383))

(declare-fun m!921385 () Bool)

(assert (=> b!993707 m!921385))

(push 1)

(assert (not start!85508))

(assert (not b!993706))

(assert (not b!993708))

(assert (not b!993707))

(check-sat)

