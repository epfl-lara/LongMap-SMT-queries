; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85442 () Bool)

(assert start!85442)

(declare-fun res!663899 () Bool)

(declare-fun e!560534 () Bool)

(assert (=> start!85442 (=> (not res!663899) (not e!560534))))

(declare-datatypes ((array!62723 0))(
  ( (array!62724 (arr!30205 (Array (_ BitVec 32) (_ BitVec 64))) (size!30702 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62723)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85442 (= res!663899 (and (= (size!30702 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62724 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30702 a!4424))))))

(assert (=> start!85442 e!560534))

(declare-fun array_inv!23329 (array!62723) Bool)

(assert (=> start!85442 (array_inv!23329 a!4424)))

(assert (=> start!85442 true))

(declare-fun b!993335 () Bool)

(declare-fun res!663900 () Bool)

(assert (=> b!993335 (=> (not res!663900) (not e!560534))))

(declare-datatypes ((List!20923 0))(
  ( (Nil!20920) (Cons!20919 (h!22081 (_ BitVec 64)) (t!29924 List!20923)) )
))
(declare-fun acc!919 () List!20923)

(declare-fun contains!5784 (List!20923 (_ BitVec 64)) Bool)

(assert (=> b!993335 (= res!663900 (not (contains!5784 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993336 () Bool)

(declare-fun res!663898 () Bool)

(assert (=> b!993336 (=> (not res!663898) (not e!560534))))

(assert (=> b!993336 (= res!663898 (not (contains!5784 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993337 () Bool)

(assert (=> b!993337 (= e!560534 false)))

(declare-fun lt!440503 () Bool)

(declare-fun noDuplicate!1382 (List!20923) Bool)

(assert (=> b!993337 (= lt!440503 (noDuplicate!1382 acc!919))))

(assert (= (and start!85442 res!663899) b!993335))

(assert (= (and b!993335 res!663900) b!993336))

(assert (= (and b!993336 res!663898) b!993337))

(declare-fun m!921067 () Bool)

(assert (=> start!85442 m!921067))

(declare-fun m!921069 () Bool)

(assert (=> b!993335 m!921069))

(declare-fun m!921071 () Bool)

(assert (=> b!993336 m!921071))

(declare-fun m!921073 () Bool)

(assert (=> b!993337 m!921073))

(push 1)

(assert (not start!85442))

(assert (not b!993337))

(assert (not b!993335))

(assert (not b!993336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

