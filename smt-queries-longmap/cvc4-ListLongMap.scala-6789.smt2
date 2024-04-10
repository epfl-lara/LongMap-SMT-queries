; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85476 () Bool)

(assert start!85476)

(declare-fun res!664051 () Bool)

(declare-fun e!560637 () Bool)

(assert (=> start!85476 (=> (not res!664051) (not e!560637))))

(declare-datatypes ((array!62757 0))(
  ( (array!62758 (arr!30222 (Array (_ BitVec 32) (_ BitVec 64))) (size!30719 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62757)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85476 (= res!664051 (and (= (size!30719 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62758 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30719 a!4424))))))

(assert (=> start!85476 e!560637))

(declare-fun array_inv!23346 (array!62757) Bool)

(assert (=> start!85476 (array_inv!23346 a!4424)))

(assert (=> start!85476 true))

(declare-fun b!993488 () Bool)

(declare-fun res!664052 () Bool)

(assert (=> b!993488 (=> (not res!664052) (not e!560637))))

(declare-datatypes ((List!20940 0))(
  ( (Nil!20937) (Cons!20936 (h!22098 (_ BitVec 64)) (t!29941 List!20940)) )
))
(declare-fun acc!919 () List!20940)

(declare-fun contains!5801 (List!20940 (_ BitVec 64)) Bool)

(assert (=> b!993488 (= res!664052 (not (contains!5801 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993489 () Bool)

(declare-fun res!664053 () Bool)

(assert (=> b!993489 (=> (not res!664053) (not e!560637))))

(assert (=> b!993489 (= res!664053 (not (contains!5801 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993490 () Bool)

(assert (=> b!993490 (= e!560637 false)))

(declare-fun lt!440554 () Bool)

(declare-fun noDuplicate!1399 (List!20940) Bool)

(assert (=> b!993490 (= lt!440554 (noDuplicate!1399 acc!919))))

(assert (= (and start!85476 res!664051) b!993488))

(assert (= (and b!993488 res!664052) b!993489))

(assert (= (and b!993489 res!664053) b!993490))

(declare-fun m!921203 () Bool)

(assert (=> start!85476 m!921203))

(declare-fun m!921205 () Bool)

(assert (=> b!993488 m!921205))

(declare-fun m!921207 () Bool)

(assert (=> b!993489 m!921207))

(declare-fun m!921209 () Bool)

(assert (=> b!993490 m!921209))

(push 1)

(assert (not start!85476))

(assert (not b!993490))

(assert (not b!993488))

(assert (not b!993489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

