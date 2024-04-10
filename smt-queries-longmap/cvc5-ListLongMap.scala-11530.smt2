; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134264 () Bool)

(assert start!134264)

(declare-fun b!1568209 () Bool)

(declare-fun res!1071899 () Bool)

(declare-fun e!874226 () Bool)

(assert (=> b!1568209 (=> (not res!1071899) (not e!874226))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104754 0))(
  ( (array!104755 (arr!50557 (Array (_ BitVec 32) (_ BitVec 64))) (size!51107 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104754)

(assert (=> b!1568209 (= res!1071899 (bvslt from!2856 (size!51107 a!3481)))))

(declare-fun res!1071900 () Bool)

(assert (=> start!134264 (=> (not res!1071900) (not e!874226))))

(assert (=> start!134264 (= res!1071900 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51107 a!3481)) (bvslt (size!51107 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134264 e!874226))

(assert (=> start!134264 true))

(declare-fun array_inv!39284 (array!104754) Bool)

(assert (=> start!134264 (array_inv!39284 a!3481)))

(declare-datatypes ((List!36689 0))(
  ( (Nil!36686) (Cons!36685 (h!38132 (_ BitVec 64)) (t!51597 List!36689)) )
))
(declare-fun acc!619 () List!36689)

(declare-fun b!1568210 () Bool)

(declare-fun e!874225 () Bool)

(declare-fun contains!10391 (List!36689 (_ BitVec 64)) Bool)

(assert (=> b!1568210 (= e!874225 (not (contains!10391 acc!619 (select (arr!50557 a!3481) from!2856))))))

(declare-fun b!1568211 () Bool)

(declare-fun res!1071898 () Bool)

(assert (=> b!1568211 (=> (not res!1071898) (not e!874226))))

(declare-fun noDuplicate!2663 (List!36689) Bool)

(assert (=> b!1568211 (= res!1071898 (noDuplicate!2663 acc!619))))

(declare-fun b!1568212 () Bool)

(declare-fun res!1071897 () Bool)

(assert (=> b!1568212 (=> (not res!1071897) (not e!874226))))

(assert (=> b!1568212 (= res!1071897 (not (contains!10391 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568213 () Bool)

(assert (=> b!1568213 (= e!874226 false)))

(declare-fun lt!673132 () Bool)

(assert (=> b!1568213 (= lt!673132 e!874225)))

(declare-fun res!1071896 () Bool)

(assert (=> b!1568213 (=> res!1071896 e!874225)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568213 (= res!1071896 (not (validKeyInArray!0 (select (arr!50557 a!3481) from!2856))))))

(declare-fun b!1568214 () Bool)

(declare-fun res!1071895 () Bool)

(assert (=> b!1568214 (=> (not res!1071895) (not e!874226))))

(assert (=> b!1568214 (= res!1071895 (not (contains!10391 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134264 res!1071900) b!1568211))

(assert (= (and b!1568211 res!1071898) b!1568212))

(assert (= (and b!1568212 res!1071897) b!1568214))

(assert (= (and b!1568214 res!1071895) b!1568209))

(assert (= (and b!1568209 res!1071899) b!1568213))

(assert (= (and b!1568213 (not res!1071896)) b!1568210))

(declare-fun m!1442917 () Bool)

(assert (=> b!1568210 m!1442917))

(assert (=> b!1568210 m!1442917))

(declare-fun m!1442919 () Bool)

(assert (=> b!1568210 m!1442919))

(declare-fun m!1442921 () Bool)

(assert (=> b!1568211 m!1442921))

(declare-fun m!1442923 () Bool)

(assert (=> b!1568214 m!1442923))

(declare-fun m!1442925 () Bool)

(assert (=> start!134264 m!1442925))

(declare-fun m!1442927 () Bool)

(assert (=> b!1568212 m!1442927))

(assert (=> b!1568213 m!1442917))

(assert (=> b!1568213 m!1442917))

(declare-fun m!1442929 () Bool)

(assert (=> b!1568213 m!1442929))

(push 1)

(assert (not start!134264))

(assert (not b!1568212))

(assert (not b!1568213))

(assert (not b!1568214))

(assert (not b!1568211))

(assert (not b!1568210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

