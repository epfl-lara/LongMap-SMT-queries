; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134266 () Bool)

(assert start!134266)

(declare-fun b!1568227 () Bool)

(declare-fun res!1071914 () Bool)

(declare-fun e!874234 () Bool)

(assert (=> b!1568227 (=> (not res!1071914) (not e!874234))))

(declare-datatypes ((List!36690 0))(
  ( (Nil!36687) (Cons!36686 (h!38133 (_ BitVec 64)) (t!51598 List!36690)) )
))
(declare-fun acc!619 () List!36690)

(declare-fun contains!10392 (List!36690 (_ BitVec 64)) Bool)

(assert (=> b!1568227 (= res!1071914 (not (contains!10392 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568228 () Bool)

(declare-fun res!1071915 () Bool)

(assert (=> b!1568228 (=> (not res!1071915) (not e!874234))))

(assert (=> b!1568228 (= res!1071915 (not (contains!10392 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568229 () Bool)

(declare-fun res!1071918 () Bool)

(assert (=> b!1568229 (=> (not res!1071918) (not e!874234))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104756 0))(
  ( (array!104757 (arr!50558 (Array (_ BitVec 32) (_ BitVec 64))) (size!51108 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104756)

(assert (=> b!1568229 (= res!1071918 (bvslt from!2856 (size!51108 a!3481)))))

(declare-fun b!1568230 () Bool)

(declare-fun e!874233 () Bool)

(assert (=> b!1568230 (= e!874233 (not (contains!10392 acc!619 (select (arr!50558 a!3481) from!2856))))))

(declare-fun b!1568231 () Bool)

(assert (=> b!1568231 (= e!874234 false)))

(declare-fun lt!673135 () Bool)

(assert (=> b!1568231 (= lt!673135 e!874233)))

(declare-fun res!1071917 () Bool)

(assert (=> b!1568231 (=> res!1071917 e!874233)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568231 (= res!1071917 (not (validKeyInArray!0 (select (arr!50558 a!3481) from!2856))))))

(declare-fun b!1568232 () Bool)

(declare-fun res!1071916 () Bool)

(assert (=> b!1568232 (=> (not res!1071916) (not e!874234))))

(declare-fun noDuplicate!2664 (List!36690) Bool)

(assert (=> b!1568232 (= res!1071916 (noDuplicate!2664 acc!619))))

(declare-fun res!1071913 () Bool)

(assert (=> start!134266 (=> (not res!1071913) (not e!874234))))

(assert (=> start!134266 (= res!1071913 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51108 a!3481)) (bvslt (size!51108 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134266 e!874234))

(assert (=> start!134266 true))

(declare-fun array_inv!39285 (array!104756) Bool)

(assert (=> start!134266 (array_inv!39285 a!3481)))

(assert (= (and start!134266 res!1071913) b!1568232))

(assert (= (and b!1568232 res!1071916) b!1568227))

(assert (= (and b!1568227 res!1071914) b!1568228))

(assert (= (and b!1568228 res!1071915) b!1568229))

(assert (= (and b!1568229 res!1071918) b!1568231))

(assert (= (and b!1568231 (not res!1071917)) b!1568230))

(declare-fun m!1442931 () Bool)

(assert (=> start!134266 m!1442931))

(declare-fun m!1442933 () Bool)

(assert (=> b!1568228 m!1442933))

(declare-fun m!1442935 () Bool)

(assert (=> b!1568232 m!1442935))

(declare-fun m!1442937 () Bool)

(assert (=> b!1568231 m!1442937))

(assert (=> b!1568231 m!1442937))

(declare-fun m!1442939 () Bool)

(assert (=> b!1568231 m!1442939))

(declare-fun m!1442941 () Bool)

(assert (=> b!1568227 m!1442941))

(assert (=> b!1568230 m!1442937))

(assert (=> b!1568230 m!1442937))

(declare-fun m!1442943 () Bool)

(assert (=> b!1568230 m!1442943))

(check-sat (not start!134266) (not b!1568227) (not b!1568230) (not b!1568228) (not b!1568231) (not b!1568232))
