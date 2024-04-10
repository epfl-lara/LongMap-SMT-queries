; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85560 () Bool)

(assert start!85560)

(declare-datatypes ((array!62839 0))(
  ( (array!62840 (arr!30262 (Array (_ BitVec 32) (_ BitVec 64))) (size!30759 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62839)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun e!560868 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun b!993916 () Bool)

(assert (=> b!993916 (= e!560868 (and (bvslt from!3778 size!36) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3778) (size!30759 a!4424)))))))

(declare-fun b!993914 () Bool)

(declare-fun res!664476 () Bool)

(assert (=> b!993914 (=> (not res!664476) (not e!560868))))

(declare-datatypes ((List!20977 0))(
  ( (Nil!20974) (Cons!20973 (h!22135 (_ BitVec 64)) (t!29978 List!20977)) )
))
(declare-fun acc!919 () List!20977)

(declare-fun contains!5838 (List!20977 (_ BitVec 64)) Bool)

(assert (=> b!993914 (= res!664476 (not (contains!5838 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993915 () Bool)

(declare-fun res!664477 () Bool)

(assert (=> b!993915 (=> (not res!664477) (not e!560868))))

(declare-fun noDuplicate!1436 (List!20977) Bool)

(assert (=> b!993915 (= res!664477 (noDuplicate!1436 acc!919))))

(declare-fun b!993913 () Bool)

(declare-fun res!664478 () Bool)

(assert (=> b!993913 (=> (not res!664478) (not e!560868))))

(assert (=> b!993913 (= res!664478 (not (contains!5838 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664479 () Bool)

(assert (=> start!85560 (=> (not res!664479) (not e!560868))))

(assert (=> start!85560 (= res!664479 (and (= (size!30759 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62840 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30759 a!4424))))))

(assert (=> start!85560 e!560868))

(declare-fun array_inv!23386 (array!62839) Bool)

(assert (=> start!85560 (array_inv!23386 a!4424)))

(assert (=> start!85560 true))

(assert (= (and start!85560 res!664479) b!993913))

(assert (= (and b!993913 res!664478) b!993914))

(assert (= (and b!993914 res!664476) b!993915))

(assert (= (and b!993915 res!664477) b!993916))

(declare-fun m!921553 () Bool)

(assert (=> b!993914 m!921553))

(declare-fun m!921555 () Bool)

(assert (=> b!993915 m!921555))

(declare-fun m!921557 () Bool)

(assert (=> b!993913 m!921557))

(declare-fun m!921559 () Bool)

(assert (=> start!85560 m!921559))

(push 1)

(assert (not start!85560))

(assert (not b!993913))

(assert (not b!993914))

(assert (not b!993915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

