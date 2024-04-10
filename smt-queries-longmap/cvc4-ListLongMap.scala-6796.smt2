; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85518 () Bool)

(assert start!85518)

(declare-fun res!664322 () Bool)

(declare-fun e!560762 () Bool)

(assert (=> start!85518 (=> (not res!664322) (not e!560762))))

(declare-datatypes ((array!62799 0))(
  ( (array!62800 (arr!30243 (Array (_ BitVec 32) (_ BitVec 64))) (size!30740 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62799)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85518 (= res!664322 (and (= (size!30740 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62800 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30740 a!4424))))))

(assert (=> start!85518 e!560762))

(declare-fun array_inv!23367 (array!62799) Bool)

(assert (=> start!85518 (array_inv!23367 a!4424)))

(assert (=> start!85518 true))

(declare-fun b!993758 () Bool)

(declare-fun res!664321 () Bool)

(assert (=> b!993758 (=> (not res!664321) (not e!560762))))

(declare-datatypes ((List!20961 0))(
  ( (Nil!20958) (Cons!20957 (h!22119 (_ BitVec 64)) (t!29962 List!20961)) )
))
(declare-fun acc!919 () List!20961)

(declare-fun contains!5822 (List!20961 (_ BitVec 64)) Bool)

(assert (=> b!993758 (= res!664321 (not (contains!5822 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993759 () Bool)

(declare-fun res!664323 () Bool)

(assert (=> b!993759 (=> (not res!664323) (not e!560762))))

(assert (=> b!993759 (= res!664323 (not (contains!5822 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993760 () Bool)

(assert (=> b!993760 (= e!560762 false)))

(declare-fun lt!440608 () Bool)

(declare-fun noDuplicate!1420 (List!20961) Bool)

(assert (=> b!993760 (= lt!440608 (noDuplicate!1420 acc!919))))

(assert (= (and start!85518 res!664322) b!993758))

(assert (= (and b!993758 res!664321) b!993759))

(assert (= (and b!993759 res!664323) b!993760))

(declare-fun m!921419 () Bool)

(assert (=> start!85518 m!921419))

(declare-fun m!921421 () Bool)

(assert (=> b!993758 m!921421))

(declare-fun m!921423 () Bool)

(assert (=> b!993759 m!921423))

(declare-fun m!921425 () Bool)

(assert (=> b!993760 m!921425))

(push 1)

(assert (not b!993758))

(assert (not b!993759))

(assert (not start!85518))

(assert (not b!993760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

