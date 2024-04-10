; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134256 () Bool)

(assert start!134256)

(declare-datatypes ((array!104746 0))(
  ( (array!104747 (arr!50553 (Array (_ BitVec 32) (_ BitVec 64))) (size!51103 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104746)

(declare-datatypes ((List!36685 0))(
  ( (Nil!36682) (Cons!36681 (h!38128 (_ BitVec 64)) (t!51593 List!36685)) )
))
(declare-fun acc!619 () List!36685)

(declare-fun e!874189 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun b!1568137 () Bool)

(declare-fun contains!10387 (List!36685 (_ BitVec 64)) Bool)

(assert (=> b!1568137 (= e!874189 (not (contains!10387 acc!619 (select (arr!50553 a!3481) from!2856))))))

(declare-fun b!1568138 () Bool)

(declare-fun e!874188 () Bool)

(assert (=> b!1568138 (= e!874188 false)))

(declare-fun lt!673120 () Bool)

(assert (=> b!1568138 (= lt!673120 e!874189)))

(declare-fun res!1071827 () Bool)

(assert (=> b!1568138 (=> res!1071827 e!874189)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568138 (= res!1071827 (not (validKeyInArray!0 (select (arr!50553 a!3481) from!2856))))))

(declare-fun b!1568139 () Bool)

(declare-fun res!1071825 () Bool)

(assert (=> b!1568139 (=> (not res!1071825) (not e!874188))))

(assert (=> b!1568139 (= res!1071825 (not (contains!10387 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1071824 () Bool)

(assert (=> start!134256 (=> (not res!1071824) (not e!874188))))

(assert (=> start!134256 (= res!1071824 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51103 a!3481)) (bvslt (size!51103 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134256 e!874188))

(assert (=> start!134256 true))

(declare-fun array_inv!39280 (array!104746) Bool)

(assert (=> start!134256 (array_inv!39280 a!3481)))

(declare-fun b!1568140 () Bool)

(declare-fun res!1071823 () Bool)

(assert (=> b!1568140 (=> (not res!1071823) (not e!874188))))

(declare-fun noDuplicate!2659 (List!36685) Bool)

(assert (=> b!1568140 (= res!1071823 (noDuplicate!2659 acc!619))))

(declare-fun b!1568141 () Bool)

(declare-fun res!1071826 () Bool)

(assert (=> b!1568141 (=> (not res!1071826) (not e!874188))))

(assert (=> b!1568141 (= res!1071826 (bvslt from!2856 (size!51103 a!3481)))))

(declare-fun b!1568142 () Bool)

(declare-fun res!1071828 () Bool)

(assert (=> b!1568142 (=> (not res!1071828) (not e!874188))))

(assert (=> b!1568142 (= res!1071828 (not (contains!10387 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134256 res!1071824) b!1568140))

(assert (= (and b!1568140 res!1071823) b!1568142))

(assert (= (and b!1568142 res!1071828) b!1568139))

(assert (= (and b!1568139 res!1071825) b!1568141))

(assert (= (and b!1568141 res!1071826) b!1568138))

(assert (= (and b!1568138 (not res!1071827)) b!1568137))

(declare-fun m!1442861 () Bool)

(assert (=> start!134256 m!1442861))

(declare-fun m!1442863 () Bool)

(assert (=> b!1568139 m!1442863))

(declare-fun m!1442865 () Bool)

(assert (=> b!1568140 m!1442865))

(declare-fun m!1442867 () Bool)

(assert (=> b!1568138 m!1442867))

(assert (=> b!1568138 m!1442867))

(declare-fun m!1442869 () Bool)

(assert (=> b!1568138 m!1442869))

(assert (=> b!1568137 m!1442867))

(assert (=> b!1568137 m!1442867))

(declare-fun m!1442871 () Bool)

(assert (=> b!1568137 m!1442871))

(declare-fun m!1442873 () Bool)

(assert (=> b!1568142 m!1442873))

(push 1)

(assert (not start!134256))

(assert (not b!1568140))

(assert (not b!1568138))

(assert (not b!1568137))

(assert (not b!1568142))

(assert (not b!1568139))

(check-sat)

