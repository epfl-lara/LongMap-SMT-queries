; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134248 () Bool)

(assert start!134248)

(declare-datatypes ((array!104738 0))(
  ( (array!104739 (arr!50549 (Array (_ BitVec 32) (_ BitVec 64))) (size!51099 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104738)

(declare-datatypes ((List!36681 0))(
  ( (Nil!36678) (Cons!36677 (h!38124 (_ BitVec 64)) (t!51589 List!36681)) )
))
(declare-fun acc!619 () List!36681)

(declare-fun e!874150 () Bool)

(declare-fun b!1568061 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun contains!10383 (List!36681 (_ BitVec 64)) Bool)

(assert (=> b!1568061 (= e!874150 (not (contains!10383 acc!619 (select (arr!50549 a!3481) from!2856))))))

(declare-fun res!1071748 () Bool)

(declare-fun e!874148 () Bool)

(assert (=> start!134248 (=> (not res!1071748) (not e!874148))))

(assert (=> start!134248 (= res!1071748 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51099 a!3481)) (bvslt (size!51099 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134248 e!874148))

(assert (=> start!134248 true))

(declare-fun array_inv!39276 (array!104738) Bool)

(assert (=> start!134248 (array_inv!39276 a!3481)))

(declare-fun b!1568062 () Bool)

(declare-fun res!1071753 () Bool)

(assert (=> b!1568062 (=> (not res!1071753) (not e!874148))))

(assert (=> b!1568062 (= res!1071753 (bvslt from!2856 (size!51099 a!3481)))))

(declare-fun b!1568063 () Bool)

(declare-fun res!1071747 () Bool)

(assert (=> b!1568063 (=> (not res!1071747) (not e!874148))))

(declare-fun noDuplicate!2655 (List!36681) Bool)

(assert (=> b!1568063 (= res!1071747 (noDuplicate!2655 acc!619))))

(declare-fun b!1568064 () Bool)

(declare-fun e!874151 () Bool)

(declare-fun lt!673108 () Bool)

(assert (=> b!1568064 (= e!874151 (and (not lt!673108) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1568065 () Bool)

(assert (=> b!1568065 (= e!874148 e!874151)))

(declare-fun res!1071752 () Bool)

(assert (=> b!1568065 (=> (not res!1071752) (not e!874151))))

(assert (=> b!1568065 (= res!1071752 e!874150)))

(declare-fun res!1071749 () Bool)

(assert (=> b!1568065 (=> res!1071749 e!874150)))

(assert (=> b!1568065 (= res!1071749 (not lt!673108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568065 (= lt!673108 (validKeyInArray!0 (select (arr!50549 a!3481) from!2856)))))

(declare-fun b!1568066 () Bool)

(declare-fun res!1071751 () Bool)

(assert (=> b!1568066 (=> (not res!1071751) (not e!874148))))

(assert (=> b!1568066 (= res!1071751 (not (contains!10383 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568067 () Bool)

(declare-fun res!1071750 () Bool)

(assert (=> b!1568067 (=> (not res!1071750) (not e!874148))))

(assert (=> b!1568067 (= res!1071750 (not (contains!10383 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134248 res!1071748) b!1568063))

(assert (= (and b!1568063 res!1071747) b!1568066))

(assert (= (and b!1568066 res!1071751) b!1568067))

(assert (= (and b!1568067 res!1071750) b!1568062))

(assert (= (and b!1568062 res!1071753) b!1568065))

(assert (= (and b!1568065 (not res!1071749)) b!1568061))

(assert (= (and b!1568065 res!1071752) b!1568064))

(declare-fun m!1442805 () Bool)

(assert (=> b!1568065 m!1442805))

(assert (=> b!1568065 m!1442805))

(declare-fun m!1442807 () Bool)

(assert (=> b!1568065 m!1442807))

(declare-fun m!1442809 () Bool)

(assert (=> b!1568067 m!1442809))

(assert (=> b!1568061 m!1442805))

(assert (=> b!1568061 m!1442805))

(declare-fun m!1442811 () Bool)

(assert (=> b!1568061 m!1442811))

(declare-fun m!1442813 () Bool)

(assert (=> b!1568063 m!1442813))

(declare-fun m!1442815 () Bool)

(assert (=> start!134248 m!1442815))

(declare-fun m!1442817 () Bool)

(assert (=> b!1568066 m!1442817))

(check-sat (not b!1568063) (not start!134248) (not b!1568066) (not b!1568061) (not b!1568067) (not b!1568065))
(check-sat)
