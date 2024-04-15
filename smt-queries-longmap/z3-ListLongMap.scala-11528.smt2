; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134202 () Bool)

(assert start!134202)

(declare-fun b!1567788 () Bool)

(declare-fun res!1071661 () Bool)

(declare-fun e!873972 () Bool)

(assert (=> b!1567788 (=> (not res!1071661) (not e!873972))))

(declare-datatypes ((List!36724 0))(
  ( (Nil!36721) (Cons!36720 (h!38168 (_ BitVec 64)) (t!51624 List!36724)) )
))
(declare-fun acc!619 () List!36724)

(declare-fun noDuplicate!2681 (List!36724) Bool)

(assert (=> b!1567788 (= res!1071661 (noDuplicate!2681 acc!619))))

(declare-fun b!1567789 () Bool)

(declare-fun res!1071663 () Bool)

(assert (=> b!1567789 (=> (not res!1071663) (not e!873972))))

(declare-fun contains!10340 (List!36724 (_ BitVec 64)) Bool)

(assert (=> b!1567789 (= res!1071663 (not (contains!10340 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567790 () Bool)

(declare-fun res!1071658 () Bool)

(assert (=> b!1567790 (=> (not res!1071658) (not e!873972))))

(assert (=> b!1567790 (= res!1071658 (not (contains!10340 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567791 () Bool)

(declare-fun res!1071662 () Bool)

(assert (=> b!1567791 (=> (not res!1071662) (not e!873972))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104670 0))(
  ( (array!104671 (arr!50516 (Array (_ BitVec 32) (_ BitVec 64))) (size!51068 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104670)

(assert (=> b!1567791 (= res!1071662 (bvslt from!2856 (size!51068 a!3481)))))

(declare-fun b!1567792 () Bool)

(assert (=> b!1567792 (= e!873972 false)))

(declare-fun lt!672828 () Bool)

(declare-fun e!873973 () Bool)

(assert (=> b!1567792 (= lt!672828 e!873973)))

(declare-fun res!1071660 () Bool)

(assert (=> b!1567792 (=> res!1071660 e!873973)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567792 (= res!1071660 (not (validKeyInArray!0 (select (arr!50516 a!3481) from!2856))))))

(declare-fun res!1071659 () Bool)

(assert (=> start!134202 (=> (not res!1071659) (not e!873972))))

(assert (=> start!134202 (= res!1071659 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51068 a!3481)) (bvslt (size!51068 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134202 e!873972))

(assert (=> start!134202 true))

(declare-fun array_inv!39452 (array!104670) Bool)

(assert (=> start!134202 (array_inv!39452 a!3481)))

(declare-fun b!1567793 () Bool)

(assert (=> b!1567793 (= e!873973 (not (contains!10340 acc!619 (select (arr!50516 a!3481) from!2856))))))

(assert (= (and start!134202 res!1071659) b!1567788))

(assert (= (and b!1567788 res!1071661) b!1567790))

(assert (= (and b!1567790 res!1071658) b!1567789))

(assert (= (and b!1567789 res!1071663) b!1567791))

(assert (= (and b!1567791 res!1071662) b!1567792))

(assert (= (and b!1567792 (not res!1071660)) b!1567793))

(declare-fun m!1441941 () Bool)

(assert (=> b!1567789 m!1441941))

(declare-fun m!1441943 () Bool)

(assert (=> b!1567793 m!1441943))

(assert (=> b!1567793 m!1441943))

(declare-fun m!1441945 () Bool)

(assert (=> b!1567793 m!1441945))

(assert (=> b!1567792 m!1441943))

(assert (=> b!1567792 m!1441943))

(declare-fun m!1441947 () Bool)

(assert (=> b!1567792 m!1441947))

(declare-fun m!1441949 () Bool)

(assert (=> b!1567788 m!1441949))

(declare-fun m!1441951 () Bool)

(assert (=> b!1567790 m!1441951))

(declare-fun m!1441953 () Bool)

(assert (=> start!134202 m!1441953))

(check-sat (not b!1567793) (not b!1567792) (not b!1567790) (not start!134202) (not b!1567788) (not b!1567789))
(check-sat)
