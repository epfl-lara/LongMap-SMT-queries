; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85464 () Bool)

(assert start!85464)

(declare-fun res!663999 () Bool)

(declare-fun e!560600 () Bool)

(assert (=> start!85464 (=> (not res!663999) (not e!560600))))

(declare-datatypes ((array!62745 0))(
  ( (array!62746 (arr!30216 (Array (_ BitVec 32) (_ BitVec 64))) (size!30713 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62745)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85464 (= res!663999 (and (= (size!30713 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62746 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30713 a!4424))))))

(assert (=> start!85464 e!560600))

(declare-fun array_inv!23340 (array!62745) Bool)

(assert (=> start!85464 (array_inv!23340 a!4424)))

(assert (=> start!85464 true))

(declare-fun b!993434 () Bool)

(declare-fun res!663998 () Bool)

(assert (=> b!993434 (=> (not res!663998) (not e!560600))))

(declare-datatypes ((List!20934 0))(
  ( (Nil!20931) (Cons!20930 (h!22092 (_ BitVec 64)) (t!29935 List!20934)) )
))
(declare-fun acc!919 () List!20934)

(declare-fun contains!5795 (List!20934 (_ BitVec 64)) Bool)

(assert (=> b!993434 (= res!663998 (not (contains!5795 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993435 () Bool)

(declare-fun res!663997 () Bool)

(assert (=> b!993435 (=> (not res!663997) (not e!560600))))

(assert (=> b!993435 (= res!663997 (not (contains!5795 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993436 () Bool)

(assert (=> b!993436 (= e!560600 false)))

(declare-fun lt!440536 () Bool)

(declare-fun noDuplicate!1393 (List!20934) Bool)

(assert (=> b!993436 (= lt!440536 (noDuplicate!1393 acc!919))))

(assert (= (and start!85464 res!663999) b!993434))

(assert (= (and b!993434 res!663998) b!993435))

(assert (= (and b!993435 res!663997) b!993436))

(declare-fun m!921155 () Bool)

(assert (=> start!85464 m!921155))

(declare-fun m!921157 () Bool)

(assert (=> b!993434 m!921157))

(declare-fun m!921159 () Bool)

(assert (=> b!993435 m!921159))

(declare-fun m!921161 () Bool)

(assert (=> b!993436 m!921161))

(push 1)

(assert (not start!85464))

(assert (not b!993436))

(assert (not b!993434))

(assert (not b!993435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

