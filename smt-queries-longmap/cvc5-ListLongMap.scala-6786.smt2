; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85454 () Bool)

(assert start!85454)

(declare-fun res!663952 () Bool)

(declare-fun e!560571 () Bool)

(assert (=> start!85454 (=> (not res!663952) (not e!560571))))

(declare-datatypes ((array!62735 0))(
  ( (array!62736 (arr!30211 (Array (_ BitVec 32) (_ BitVec 64))) (size!30708 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62735)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85454 (= res!663952 (and (= (size!30708 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62736 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30708 a!4424))))))

(assert (=> start!85454 e!560571))

(declare-fun array_inv!23335 (array!62735) Bool)

(assert (=> start!85454 (array_inv!23335 a!4424)))

(assert (=> start!85454 true))

(declare-fun b!993389 () Bool)

(declare-fun res!663954 () Bool)

(assert (=> b!993389 (=> (not res!663954) (not e!560571))))

(declare-datatypes ((List!20929 0))(
  ( (Nil!20926) (Cons!20925 (h!22087 (_ BitVec 64)) (t!29930 List!20929)) )
))
(declare-fun acc!919 () List!20929)

(declare-fun contains!5790 (List!20929 (_ BitVec 64)) Bool)

(assert (=> b!993389 (= res!663954 (not (contains!5790 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993390 () Bool)

(declare-fun res!663953 () Bool)

(assert (=> b!993390 (=> (not res!663953) (not e!560571))))

(assert (=> b!993390 (= res!663953 (not (contains!5790 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993391 () Bool)

(assert (=> b!993391 (= e!560571 false)))

(declare-fun lt!440521 () Bool)

(declare-fun noDuplicate!1388 (List!20929) Bool)

(assert (=> b!993391 (= lt!440521 (noDuplicate!1388 acc!919))))

(assert (= (and start!85454 res!663952) b!993389))

(assert (= (and b!993389 res!663954) b!993390))

(assert (= (and b!993390 res!663953) b!993391))

(declare-fun m!921115 () Bool)

(assert (=> start!85454 m!921115))

(declare-fun m!921117 () Bool)

(assert (=> b!993389 m!921117))

(declare-fun m!921119 () Bool)

(assert (=> b!993390 m!921119))

(declare-fun m!921121 () Bool)

(assert (=> b!993391 m!921121))

(push 1)

(assert (not start!85454))

(assert (not b!993391))

(assert (not b!993389))

(assert (not b!993390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

