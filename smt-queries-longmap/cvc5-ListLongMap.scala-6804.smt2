; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85566 () Bool)

(assert start!85566)

(declare-fun res!664510 () Bool)

(declare-fun e!560886 () Bool)

(assert (=> start!85566 (=> (not res!664510) (not e!560886))))

(declare-datatypes ((array!62845 0))(
  ( (array!62846 (arr!30265 (Array (_ BitVec 32) (_ BitVec 64))) (size!30762 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62845)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85566 (= res!664510 (and (= (size!30762 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62846 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30762 a!4424))))))

(assert (=> start!85566 e!560886))

(declare-fun array_inv!23389 (array!62845) Bool)

(assert (=> start!85566 (array_inv!23389 a!4424)))

(assert (=> start!85566 true))

(declare-fun b!993947 () Bool)

(declare-fun res!664511 () Bool)

(assert (=> b!993947 (=> (not res!664511) (not e!560886))))

(declare-datatypes ((List!20980 0))(
  ( (Nil!20977) (Cons!20976 (h!22138 (_ BitVec 64)) (t!29981 List!20980)) )
))
(declare-fun acc!919 () List!20980)

(declare-fun contains!5841 (List!20980 (_ BitVec 64)) Bool)

(assert (=> b!993947 (= res!664511 (not (contains!5841 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993948 () Bool)

(declare-fun res!664512 () Bool)

(assert (=> b!993948 (=> (not res!664512) (not e!560886))))

(assert (=> b!993948 (= res!664512 (not (contains!5841 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993949 () Bool)

(assert (=> b!993949 (= e!560886 false)))

(declare-fun lt!440647 () Bool)

(declare-fun noDuplicate!1439 (List!20980) Bool)

(assert (=> b!993949 (= lt!440647 (noDuplicate!1439 acc!919))))

(assert (= (and start!85566 res!664510) b!993947))

(assert (= (and b!993947 res!664511) b!993948))

(assert (= (and b!993948 res!664512) b!993949))

(declare-fun m!921577 () Bool)

(assert (=> start!85566 m!921577))

(declare-fun m!921579 () Bool)

(assert (=> b!993947 m!921579))

(declare-fun m!921581 () Bool)

(assert (=> b!993948 m!921581))

(declare-fun m!921583 () Bool)

(assert (=> b!993949 m!921583))

(push 1)

(assert (not b!993947))

(assert (not b!993948))

(assert (not start!85566))

(assert (not b!993949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

