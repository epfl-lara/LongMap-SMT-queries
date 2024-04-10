; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134252 () Bool)

(assert start!134252)

(declare-fun b!1568101 () Bool)

(declare-fun res!1071787 () Bool)

(declare-fun e!874172 () Bool)

(assert (=> b!1568101 (=> (not res!1071787) (not e!874172))))

(declare-datatypes ((List!36683 0))(
  ( (Nil!36680) (Cons!36679 (h!38126 (_ BitVec 64)) (t!51591 List!36683)) )
))
(declare-fun acc!619 () List!36683)

(declare-fun contains!10385 (List!36683 (_ BitVec 64)) Bool)

(assert (=> b!1568101 (= res!1071787 (not (contains!10385 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568102 () Bool)

(assert (=> b!1568102 (= e!874172 false)))

(declare-fun lt!673114 () Bool)

(declare-fun e!874170 () Bool)

(assert (=> b!1568102 (= lt!673114 e!874170)))

(declare-fun res!1071792 () Bool)

(assert (=> b!1568102 (=> res!1071792 e!874170)))

(declare-datatypes ((array!104742 0))(
  ( (array!104743 (arr!50551 (Array (_ BitVec 32) (_ BitVec 64))) (size!51101 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104742)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568102 (= res!1071792 (not (validKeyInArray!0 (select (arr!50551 a!3481) from!2856))))))

(declare-fun res!1071790 () Bool)

(assert (=> start!134252 (=> (not res!1071790) (not e!874172))))

(assert (=> start!134252 (= res!1071790 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51101 a!3481)) (bvslt (size!51101 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134252 e!874172))

(assert (=> start!134252 true))

(declare-fun array_inv!39278 (array!104742) Bool)

(assert (=> start!134252 (array_inv!39278 a!3481)))

(declare-fun b!1568103 () Bool)

(assert (=> b!1568103 (= e!874170 (not (contains!10385 acc!619 (select (arr!50551 a!3481) from!2856))))))

(declare-fun b!1568104 () Bool)

(declare-fun res!1071788 () Bool)

(assert (=> b!1568104 (=> (not res!1071788) (not e!874172))))

(assert (=> b!1568104 (= res!1071788 (not (contains!10385 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568105 () Bool)

(declare-fun res!1071789 () Bool)

(assert (=> b!1568105 (=> (not res!1071789) (not e!874172))))

(declare-fun noDuplicate!2657 (List!36683) Bool)

(assert (=> b!1568105 (= res!1071789 (noDuplicate!2657 acc!619))))

(declare-fun b!1568106 () Bool)

(declare-fun res!1071791 () Bool)

(assert (=> b!1568106 (=> (not res!1071791) (not e!874172))))

(assert (=> b!1568106 (= res!1071791 (bvslt from!2856 (size!51101 a!3481)))))

(assert (= (and start!134252 res!1071790) b!1568105))

(assert (= (and b!1568105 res!1071789) b!1568101))

(assert (= (and b!1568101 res!1071787) b!1568104))

(assert (= (and b!1568104 res!1071788) b!1568106))

(assert (= (and b!1568106 res!1071791) b!1568102))

(assert (= (and b!1568102 (not res!1071792)) b!1568103))

(declare-fun m!1442833 () Bool)

(assert (=> b!1568105 m!1442833))

(declare-fun m!1442835 () Bool)

(assert (=> start!134252 m!1442835))

(declare-fun m!1442837 () Bool)

(assert (=> b!1568101 m!1442837))

(declare-fun m!1442839 () Bool)

(assert (=> b!1568103 m!1442839))

(assert (=> b!1568103 m!1442839))

(declare-fun m!1442841 () Bool)

(assert (=> b!1568103 m!1442841))

(assert (=> b!1568102 m!1442839))

(assert (=> b!1568102 m!1442839))

(declare-fun m!1442843 () Bool)

(assert (=> b!1568102 m!1442843))

(declare-fun m!1442845 () Bool)

(assert (=> b!1568104 m!1442845))

(push 1)

(assert (not b!1568105))

(assert (not b!1568102))

(assert (not b!1568101))

(assert (not b!1568104))

(assert (not b!1568103))

(assert (not start!134252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

