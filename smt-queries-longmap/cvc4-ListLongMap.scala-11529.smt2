; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134262 () Bool)

(assert start!134262)

(declare-datatypes ((array!104752 0))(
  ( (array!104753 (arr!50556 (Array (_ BitVec 32) (_ BitVec 64))) (size!51106 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104752)

(declare-datatypes ((List!36688 0))(
  ( (Nil!36685) (Cons!36684 (h!38131 (_ BitVec 64)) (t!51596 List!36688)) )
))
(declare-fun acc!619 () List!36688)

(declare-fun b!1568191 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun e!874217 () Bool)

(declare-fun contains!10390 (List!36688 (_ BitVec 64)) Bool)

(assert (=> b!1568191 (= e!874217 (not (contains!10390 acc!619 (select (arr!50556 a!3481) from!2856))))))

(declare-fun res!1071882 () Bool)

(declare-fun e!874216 () Bool)

(assert (=> start!134262 (=> (not res!1071882) (not e!874216))))

(assert (=> start!134262 (= res!1071882 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51106 a!3481)) (bvslt (size!51106 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134262 e!874216))

(assert (=> start!134262 true))

(declare-fun array_inv!39283 (array!104752) Bool)

(assert (=> start!134262 (array_inv!39283 a!3481)))

(declare-fun b!1568192 () Bool)

(declare-fun res!1071877 () Bool)

(assert (=> b!1568192 (=> (not res!1071877) (not e!874216))))

(declare-fun noDuplicate!2662 (List!36688) Bool)

(assert (=> b!1568192 (= res!1071877 (noDuplicate!2662 acc!619))))

(declare-fun b!1568193 () Bool)

(declare-fun res!1071879 () Bool)

(assert (=> b!1568193 (=> (not res!1071879) (not e!874216))))

(assert (=> b!1568193 (= res!1071879 (not (contains!10390 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568194 () Bool)

(declare-fun res!1071881 () Bool)

(assert (=> b!1568194 (=> (not res!1071881) (not e!874216))))

(assert (=> b!1568194 (= res!1071881 (bvslt from!2856 (size!51106 a!3481)))))

(declare-fun b!1568195 () Bool)

(declare-fun res!1071878 () Bool)

(assert (=> b!1568195 (=> (not res!1071878) (not e!874216))))

(assert (=> b!1568195 (= res!1071878 (not (contains!10390 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568196 () Bool)

(assert (=> b!1568196 (= e!874216 false)))

(declare-fun lt!673129 () Bool)

(assert (=> b!1568196 (= lt!673129 e!874217)))

(declare-fun res!1071880 () Bool)

(assert (=> b!1568196 (=> res!1071880 e!874217)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568196 (= res!1071880 (not (validKeyInArray!0 (select (arr!50556 a!3481) from!2856))))))

(assert (= (and start!134262 res!1071882) b!1568192))

(assert (= (and b!1568192 res!1071877) b!1568193))

(assert (= (and b!1568193 res!1071879) b!1568195))

(assert (= (and b!1568195 res!1071878) b!1568194))

(assert (= (and b!1568194 res!1071881) b!1568196))

(assert (= (and b!1568196 (not res!1071880)) b!1568191))

(declare-fun m!1442903 () Bool)

(assert (=> b!1568193 m!1442903))

(declare-fun m!1442905 () Bool)

(assert (=> start!134262 m!1442905))

(declare-fun m!1442907 () Bool)

(assert (=> b!1568191 m!1442907))

(assert (=> b!1568191 m!1442907))

(declare-fun m!1442909 () Bool)

(assert (=> b!1568191 m!1442909))

(declare-fun m!1442911 () Bool)

(assert (=> b!1568195 m!1442911))

(declare-fun m!1442913 () Bool)

(assert (=> b!1568192 m!1442913))

(assert (=> b!1568196 m!1442907))

(assert (=> b!1568196 m!1442907))

(declare-fun m!1442915 () Bool)

(assert (=> b!1568196 m!1442915))

(push 1)

(assert (not b!1568195))

(assert (not start!134262))

(assert (not b!1568191))

(assert (not b!1568196))

(assert (not b!1568192))

(assert (not b!1568193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

