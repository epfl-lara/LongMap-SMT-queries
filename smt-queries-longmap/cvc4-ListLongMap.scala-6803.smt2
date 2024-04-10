; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85564 () Bool)

(assert start!85564)

(declare-fun b!993939 () Bool)

(declare-fun res!664503 () Bool)

(declare-fun e!560879 () Bool)

(assert (=> b!993939 (=> (not res!664503) (not e!560879))))

(declare-datatypes ((List!20979 0))(
  ( (Nil!20976) (Cons!20975 (h!22137 (_ BitVec 64)) (t!29980 List!20979)) )
))
(declare-fun acc!919 () List!20979)

(declare-fun noDuplicate!1438 (List!20979) Bool)

(assert (=> b!993939 (= res!664503 (noDuplicate!1438 acc!919))))

(declare-fun res!664501 () Bool)

(assert (=> start!85564 (=> (not res!664501) (not e!560879))))

(declare-datatypes ((array!62843 0))(
  ( (array!62844 (arr!30264 (Array (_ BitVec 32) (_ BitVec 64))) (size!30761 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62843)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85564 (= res!664501 (and (= (size!30761 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62844 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30761 a!4424))))))

(assert (=> start!85564 e!560879))

(declare-fun array_inv!23388 (array!62843) Bool)

(assert (=> start!85564 (array_inv!23388 a!4424)))

(assert (=> start!85564 true))

(declare-fun b!993937 () Bool)

(declare-fun res!664502 () Bool)

(assert (=> b!993937 (=> (not res!664502) (not e!560879))))

(declare-fun contains!5840 (List!20979 (_ BitVec 64)) Bool)

(assert (=> b!993937 (= res!664502 (not (contains!5840 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993940 () Bool)

(assert (=> b!993940 (= e!560879 (and (bvslt from!3778 size!36) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3778) (size!30761 a!4424)))))))

(declare-fun b!993938 () Bool)

(declare-fun res!664500 () Bool)

(assert (=> b!993938 (=> (not res!664500) (not e!560879))))

(assert (=> b!993938 (= res!664500 (not (contains!5840 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85564 res!664501) b!993937))

(assert (= (and b!993937 res!664502) b!993938))

(assert (= (and b!993938 res!664500) b!993939))

(assert (= (and b!993939 res!664503) b!993940))

(declare-fun m!921569 () Bool)

(assert (=> b!993939 m!921569))

(declare-fun m!921571 () Bool)

(assert (=> start!85564 m!921571))

(declare-fun m!921573 () Bool)

(assert (=> b!993937 m!921573))

(declare-fun m!921575 () Bool)

(assert (=> b!993938 m!921575))

(push 1)

(assert (not b!993937))

(assert (not b!993938))

(assert (not b!993939))

(assert (not start!85564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

