; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134272 () Bool)

(assert start!134272)

(declare-fun res!1071953 () Bool)

(declare-fun e!874255 () Bool)

(assert (=> start!134272 (=> (not res!1071953) (not e!874255))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104762 0))(
  ( (array!104763 (arr!50561 (Array (_ BitVec 32) (_ BitVec 64))) (size!51111 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104762)

(assert (=> start!134272 (= res!1071953 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51111 a!3481)) (bvslt (size!51111 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134272 e!874255))

(assert (=> start!134272 true))

(declare-fun array_inv!39288 (array!104762) Bool)

(assert (=> start!134272 (array_inv!39288 a!3481)))

(declare-fun b!1568266 () Bool)

(declare-fun res!1071954 () Bool)

(assert (=> b!1568266 (=> (not res!1071954) (not e!874255))))

(declare-datatypes ((List!36693 0))(
  ( (Nil!36690) (Cons!36689 (h!38136 (_ BitVec 64)) (t!51601 List!36693)) )
))
(declare-fun acc!619 () List!36693)

(declare-fun noDuplicate!2667 (List!36693) Bool)

(assert (=> b!1568266 (= res!1071954 (noDuplicate!2667 acc!619))))

(declare-fun b!1568267 () Bool)

(declare-fun res!1071952 () Bool)

(assert (=> b!1568267 (=> (not res!1071952) (not e!874255))))

(declare-fun contains!10395 (List!36693 (_ BitVec 64)) Bool)

(assert (=> b!1568267 (= res!1071952 (not (contains!10395 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568268 () Bool)

(assert (=> b!1568268 (= e!874255 false)))

(declare-fun lt!673144 () Bool)

(assert (=> b!1568268 (= lt!673144 (contains!10395 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134272 res!1071953) b!1568266))

(assert (= (and b!1568266 res!1071954) b!1568267))

(assert (= (and b!1568267 res!1071952) b!1568268))

(declare-fun m!1442967 () Bool)

(assert (=> start!134272 m!1442967))

(declare-fun m!1442969 () Bool)

(assert (=> b!1568266 m!1442969))

(declare-fun m!1442971 () Bool)

(assert (=> b!1568267 m!1442971))

(declare-fun m!1442973 () Bool)

(assert (=> b!1568268 m!1442973))

(check-sat (not b!1568267) (not b!1568266) (not b!1568268) (not start!134272))
(check-sat)
