; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85452 () Bool)

(assert start!85452)

(declare-fun res!663944 () Bool)

(declare-fun e!560565 () Bool)

(assert (=> start!85452 (=> (not res!663944) (not e!560565))))

(declare-datatypes ((array!62733 0))(
  ( (array!62734 (arr!30210 (Array (_ BitVec 32) (_ BitVec 64))) (size!30707 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62733)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85452 (= res!663944 (and (= (size!30707 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62734 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30707 a!4424))))))

(assert (=> start!85452 e!560565))

(declare-fun array_inv!23334 (array!62733) Bool)

(assert (=> start!85452 (array_inv!23334 a!4424)))

(assert (=> start!85452 true))

(declare-fun b!993380 () Bool)

(declare-fun res!663945 () Bool)

(assert (=> b!993380 (=> (not res!663945) (not e!560565))))

(declare-datatypes ((List!20928 0))(
  ( (Nil!20925) (Cons!20924 (h!22086 (_ BitVec 64)) (t!29929 List!20928)) )
))
(declare-fun acc!919 () List!20928)

(declare-fun contains!5789 (List!20928 (_ BitVec 64)) Bool)

(assert (=> b!993380 (= res!663945 (not (contains!5789 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993381 () Bool)

(declare-fun res!663943 () Bool)

(assert (=> b!993381 (=> (not res!663943) (not e!560565))))

(assert (=> b!993381 (= res!663943 (not (contains!5789 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993382 () Bool)

(assert (=> b!993382 (= e!560565 false)))

(declare-fun lt!440518 () Bool)

(declare-fun noDuplicate!1387 (List!20928) Bool)

(assert (=> b!993382 (= lt!440518 (noDuplicate!1387 acc!919))))

(assert (= (and start!85452 res!663944) b!993380))

(assert (= (and b!993380 res!663945) b!993381))

(assert (= (and b!993381 res!663943) b!993382))

(declare-fun m!921107 () Bool)

(assert (=> start!85452 m!921107))

(declare-fun m!921109 () Bool)

(assert (=> b!993380 m!921109))

(declare-fun m!921111 () Bool)

(assert (=> b!993381 m!921111))

(declare-fun m!921113 () Bool)

(assert (=> b!993382 m!921113))

(push 1)

(assert (not start!85452))

(assert (not b!993382))

(assert (not b!993380))

(assert (not b!993381))

(check-sat)

