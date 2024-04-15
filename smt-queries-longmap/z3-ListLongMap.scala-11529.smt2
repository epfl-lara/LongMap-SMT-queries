; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134208 () Bool)

(assert start!134208)

(declare-fun res!1071713 () Bool)

(declare-fun e!873999 () Bool)

(assert (=> start!134208 (=> (not res!1071713) (not e!873999))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104676 0))(
  ( (array!104677 (arr!50519 (Array (_ BitVec 32) (_ BitVec 64))) (size!51071 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104676)

(assert (=> start!134208 (= res!1071713 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51071 a!3481)) (bvslt (size!51071 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134208 e!873999))

(assert (=> start!134208 true))

(declare-fun array_inv!39455 (array!104676) Bool)

(assert (=> start!134208 (array_inv!39455 a!3481)))

(declare-fun b!1567842 () Bool)

(declare-fun res!1071714 () Bool)

(assert (=> b!1567842 (=> (not res!1071714) (not e!873999))))

(declare-datatypes ((List!36727 0))(
  ( (Nil!36724) (Cons!36723 (h!38171 (_ BitVec 64)) (t!51627 List!36727)) )
))
(declare-fun acc!619 () List!36727)

(declare-fun contains!10343 (List!36727 (_ BitVec 64)) Bool)

(assert (=> b!1567842 (= res!1071714 (not (contains!10343 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567843 () Bool)

(declare-fun res!1071715 () Bool)

(assert (=> b!1567843 (=> (not res!1071715) (not e!873999))))

(assert (=> b!1567843 (= res!1071715 (not (contains!10343 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567844 () Bool)

(declare-fun res!1071712 () Bool)

(assert (=> b!1567844 (=> (not res!1071712) (not e!873999))))

(assert (=> b!1567844 (= res!1071712 (bvslt from!2856 (size!51071 a!3481)))))

(declare-fun b!1567845 () Bool)

(assert (=> b!1567845 (= e!873999 false)))

(declare-fun lt!672837 () Bool)

(declare-fun e!874000 () Bool)

(assert (=> b!1567845 (= lt!672837 e!874000)))

(declare-fun res!1071717 () Bool)

(assert (=> b!1567845 (=> res!1071717 e!874000)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567845 (= res!1071717 (not (validKeyInArray!0 (select (arr!50519 a!3481) from!2856))))))

(declare-fun b!1567846 () Bool)

(assert (=> b!1567846 (= e!874000 (not (contains!10343 acc!619 (select (arr!50519 a!3481) from!2856))))))

(declare-fun b!1567847 () Bool)

(declare-fun res!1071716 () Bool)

(assert (=> b!1567847 (=> (not res!1071716) (not e!873999))))

(declare-fun noDuplicate!2684 (List!36727) Bool)

(assert (=> b!1567847 (= res!1071716 (noDuplicate!2684 acc!619))))

(assert (= (and start!134208 res!1071713) b!1567847))

(assert (= (and b!1567847 res!1071716) b!1567842))

(assert (= (and b!1567842 res!1071714) b!1567843))

(assert (= (and b!1567843 res!1071715) b!1567844))

(assert (= (and b!1567844 res!1071712) b!1567845))

(assert (= (and b!1567845 (not res!1071717)) b!1567846))

(declare-fun m!1441983 () Bool)

(assert (=> b!1567845 m!1441983))

(assert (=> b!1567845 m!1441983))

(declare-fun m!1441985 () Bool)

(assert (=> b!1567845 m!1441985))

(declare-fun m!1441987 () Bool)

(assert (=> b!1567842 m!1441987))

(declare-fun m!1441989 () Bool)

(assert (=> b!1567843 m!1441989))

(assert (=> b!1567846 m!1441983))

(assert (=> b!1567846 m!1441983))

(declare-fun m!1441991 () Bool)

(assert (=> b!1567846 m!1441991))

(declare-fun m!1441993 () Bool)

(assert (=> start!134208 m!1441993))

(declare-fun m!1441995 () Bool)

(assert (=> b!1567847 m!1441995))

(check-sat (not b!1567845) (not b!1567842) (not b!1567847) (not start!134208) (not b!1567846) (not b!1567843))
(check-sat)
