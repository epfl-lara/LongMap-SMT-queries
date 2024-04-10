; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85572 () Bool)

(assert start!85572)

(declare-fun res!664538 () Bool)

(declare-fun e!560904 () Bool)

(assert (=> start!85572 (=> (not res!664538) (not e!560904))))

(declare-datatypes ((array!62851 0))(
  ( (array!62852 (arr!30268 (Array (_ BitVec 32) (_ BitVec 64))) (size!30765 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62851)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85572 (= res!664538 (and (= (size!30765 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62852 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30765 a!4424))))))

(assert (=> start!85572 e!560904))

(declare-fun array_inv!23392 (array!62851) Bool)

(assert (=> start!85572 (array_inv!23392 a!4424)))

(assert (=> start!85572 true))

(declare-fun b!993974 () Bool)

(declare-fun res!664537 () Bool)

(assert (=> b!993974 (=> (not res!664537) (not e!560904))))

(declare-datatypes ((List!20983 0))(
  ( (Nil!20980) (Cons!20979 (h!22141 (_ BitVec 64)) (t!29984 List!20983)) )
))
(declare-fun acc!919 () List!20983)

(declare-fun contains!5844 (List!20983 (_ BitVec 64)) Bool)

(assert (=> b!993974 (= res!664537 (not (contains!5844 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993975 () Bool)

(declare-fun res!664539 () Bool)

(assert (=> b!993975 (=> (not res!664539) (not e!560904))))

(assert (=> b!993975 (= res!664539 (not (contains!5844 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993976 () Bool)

(assert (=> b!993976 (= e!560904 false)))

(declare-fun lt!440656 () Bool)

(declare-fun noDuplicate!1442 (List!20983) Bool)

(assert (=> b!993976 (= lt!440656 (noDuplicate!1442 acc!919))))

(assert (= (and start!85572 res!664538) b!993974))

(assert (= (and b!993974 res!664537) b!993975))

(assert (= (and b!993975 res!664539) b!993976))

(declare-fun m!921601 () Bool)

(assert (=> start!85572 m!921601))

(declare-fun m!921603 () Bool)

(assert (=> b!993974 m!921603))

(declare-fun m!921605 () Bool)

(assert (=> b!993975 m!921605))

(declare-fun m!921607 () Bool)

(assert (=> b!993976 m!921607))

(push 1)

(assert (not b!993976))

(assert (not start!85572))

(assert (not b!993975))

(assert (not b!993974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

