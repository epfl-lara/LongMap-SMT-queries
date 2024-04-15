; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134214 () Bool)

(assert start!134214)

(declare-fun b!1567896 () Bool)

(declare-fun e!874028 () Bool)

(assert (=> b!1567896 (= e!874028 false)))

(declare-fun lt!672846 () Bool)

(declare-fun e!874027 () Bool)

(assert (=> b!1567896 (= lt!672846 e!874027)))

(declare-fun res!1071767 () Bool)

(assert (=> b!1567896 (=> res!1071767 e!874027)))

(declare-datatypes ((array!104682 0))(
  ( (array!104683 (arr!50522 (Array (_ BitVec 32) (_ BitVec 64))) (size!51074 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104682)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567896 (= res!1071767 (not (validKeyInArray!0 (select (arr!50522 a!3481) from!2856))))))

(declare-fun b!1567897 () Bool)

(declare-fun res!1071768 () Bool)

(assert (=> b!1567897 (=> (not res!1071768) (not e!874028))))

(assert (=> b!1567897 (= res!1071768 (bvslt from!2856 (size!51074 a!3481)))))

(declare-datatypes ((List!36730 0))(
  ( (Nil!36727) (Cons!36726 (h!38174 (_ BitVec 64)) (t!51630 List!36730)) )
))
(declare-fun acc!619 () List!36730)

(declare-fun b!1567898 () Bool)

(declare-fun contains!10346 (List!36730 (_ BitVec 64)) Bool)

(assert (=> b!1567898 (= e!874027 (not (contains!10346 acc!619 (select (arr!50522 a!3481) from!2856))))))

(declare-fun b!1567899 () Bool)

(declare-fun res!1071769 () Bool)

(assert (=> b!1567899 (=> (not res!1071769) (not e!874028))))

(declare-fun noDuplicate!2687 (List!36730) Bool)

(assert (=> b!1567899 (= res!1071769 (noDuplicate!2687 acc!619))))

(declare-fun res!1071766 () Bool)

(assert (=> start!134214 (=> (not res!1071766) (not e!874028))))

(assert (=> start!134214 (= res!1071766 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51074 a!3481)) (bvslt (size!51074 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134214 e!874028))

(assert (=> start!134214 true))

(declare-fun array_inv!39458 (array!104682) Bool)

(assert (=> start!134214 (array_inv!39458 a!3481)))

(declare-fun b!1567900 () Bool)

(declare-fun res!1071770 () Bool)

(assert (=> b!1567900 (=> (not res!1071770) (not e!874028))))

(assert (=> b!1567900 (= res!1071770 (not (contains!10346 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567901 () Bool)

(declare-fun res!1071771 () Bool)

(assert (=> b!1567901 (=> (not res!1071771) (not e!874028))))

(assert (=> b!1567901 (= res!1071771 (not (contains!10346 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134214 res!1071766) b!1567899))

(assert (= (and b!1567899 res!1071769) b!1567901))

(assert (= (and b!1567901 res!1071771) b!1567900))

(assert (= (and b!1567900 res!1071770) b!1567897))

(assert (= (and b!1567897 res!1071768) b!1567896))

(assert (= (and b!1567896 (not res!1071767)) b!1567898))

(declare-fun m!1442025 () Bool)

(assert (=> b!1567899 m!1442025))

(declare-fun m!1442027 () Bool)

(assert (=> b!1567896 m!1442027))

(assert (=> b!1567896 m!1442027))

(declare-fun m!1442029 () Bool)

(assert (=> b!1567896 m!1442029))

(assert (=> b!1567898 m!1442027))

(assert (=> b!1567898 m!1442027))

(declare-fun m!1442031 () Bool)

(assert (=> b!1567898 m!1442031))

(declare-fun m!1442033 () Bool)

(assert (=> start!134214 m!1442033))

(declare-fun m!1442035 () Bool)

(assert (=> b!1567901 m!1442035))

(declare-fun m!1442037 () Bool)

(assert (=> b!1567900 m!1442037))

(check-sat (not b!1567899) (not b!1567898) (not b!1567896) (not b!1567900) (not start!134214) (not b!1567901))
(check-sat)
