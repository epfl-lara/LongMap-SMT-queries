; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85446 () Bool)

(assert start!85446)

(declare-fun res!663917 () Bool)

(declare-fun e!560547 () Bool)

(assert (=> start!85446 (=> (not res!663917) (not e!560547))))

(declare-datatypes ((array!62727 0))(
  ( (array!62728 (arr!30207 (Array (_ BitVec 32) (_ BitVec 64))) (size!30704 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62727)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85446 (= res!663917 (and (= (size!30704 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62728 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30704 a!4424))))))

(assert (=> start!85446 e!560547))

(declare-fun array_inv!23331 (array!62727) Bool)

(assert (=> start!85446 (array_inv!23331 a!4424)))

(assert (=> start!85446 true))

(declare-fun b!993353 () Bool)

(declare-fun res!663918 () Bool)

(assert (=> b!993353 (=> (not res!663918) (not e!560547))))

(declare-datatypes ((List!20925 0))(
  ( (Nil!20922) (Cons!20921 (h!22083 (_ BitVec 64)) (t!29926 List!20925)) )
))
(declare-fun acc!919 () List!20925)

(declare-fun contains!5786 (List!20925 (_ BitVec 64)) Bool)

(assert (=> b!993353 (= res!663918 (not (contains!5786 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993354 () Bool)

(declare-fun res!663916 () Bool)

(assert (=> b!993354 (=> (not res!663916) (not e!560547))))

(assert (=> b!993354 (= res!663916 (not (contains!5786 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993355 () Bool)

(assert (=> b!993355 (= e!560547 false)))

(declare-fun lt!440509 () Bool)

(declare-fun noDuplicate!1384 (List!20925) Bool)

(assert (=> b!993355 (= lt!440509 (noDuplicate!1384 acc!919))))

(assert (= (and start!85446 res!663917) b!993353))

(assert (= (and b!993353 res!663918) b!993354))

(assert (= (and b!993354 res!663916) b!993355))

(declare-fun m!921083 () Bool)

(assert (=> start!85446 m!921083))

(declare-fun m!921085 () Bool)

(assert (=> b!993353 m!921085))

(declare-fun m!921087 () Bool)

(assert (=> b!993354 m!921087))

(declare-fun m!921089 () Bool)

(assert (=> b!993355 m!921089))

(push 1)

(assert (not b!993355))

(assert (not b!993354))

(assert (not start!85446))

(assert (not b!993353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

