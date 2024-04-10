; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85470 () Bool)

(assert start!85470)

(declare-fun res!664024 () Bool)

(declare-fun e!560618 () Bool)

(assert (=> start!85470 (=> (not res!664024) (not e!560618))))

(declare-datatypes ((array!62751 0))(
  ( (array!62752 (arr!30219 (Array (_ BitVec 32) (_ BitVec 64))) (size!30716 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62751)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85470 (= res!664024 (and (= (size!30716 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62752 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30716 a!4424))))))

(assert (=> start!85470 e!560618))

(declare-fun array_inv!23343 (array!62751) Bool)

(assert (=> start!85470 (array_inv!23343 a!4424)))

(assert (=> start!85470 true))

(declare-fun b!993461 () Bool)

(declare-fun res!664026 () Bool)

(assert (=> b!993461 (=> (not res!664026) (not e!560618))))

(declare-datatypes ((List!20937 0))(
  ( (Nil!20934) (Cons!20933 (h!22095 (_ BitVec 64)) (t!29938 List!20937)) )
))
(declare-fun acc!919 () List!20937)

(declare-fun contains!5798 (List!20937 (_ BitVec 64)) Bool)

(assert (=> b!993461 (= res!664026 (not (contains!5798 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993462 () Bool)

(declare-fun res!664025 () Bool)

(assert (=> b!993462 (=> (not res!664025) (not e!560618))))

(assert (=> b!993462 (= res!664025 (not (contains!5798 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993463 () Bool)

(assert (=> b!993463 (= e!560618 false)))

(declare-fun lt!440545 () Bool)

(declare-fun noDuplicate!1396 (List!20937) Bool)

(assert (=> b!993463 (= lt!440545 (noDuplicate!1396 acc!919))))

(assert (= (and start!85470 res!664024) b!993461))

(assert (= (and b!993461 res!664026) b!993462))

(assert (= (and b!993462 res!664025) b!993463))

(declare-fun m!921179 () Bool)

(assert (=> start!85470 m!921179))

(declare-fun m!921181 () Bool)

(assert (=> b!993461 m!921181))

(declare-fun m!921183 () Bool)

(assert (=> b!993462 m!921183))

(declare-fun m!921185 () Bool)

(assert (=> b!993463 m!921185))

(push 1)

(assert (not b!993461))

(assert (not b!993463))

(assert (not b!993462))

(assert (not start!85470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

