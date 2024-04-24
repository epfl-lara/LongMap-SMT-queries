; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134718 () Bool)

(assert start!134718)

(declare-fun b!1570953 () Bool)

(declare-fun res!1073066 () Bool)

(declare-fun e!875907 () Bool)

(assert (=> b!1570953 (=> (not res!1073066) (not e!875907))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104918 0))(
  ( (array!104919 (arr!50632 (Array (_ BitVec 32) (_ BitVec 64))) (size!51183 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104918)

(assert (=> b!1570953 (= res!1073066 (bvslt from!2856 (size!51183 a!3481)))))

(declare-fun res!1073067 () Bool)

(assert (=> start!134718 (=> (not res!1073067) (not e!875907))))

(assert (=> start!134718 (= res!1073067 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51183 a!3481)) (bvslt (size!51183 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134718 e!875907))

(assert (=> start!134718 true))

(declare-fun array_inv!39587 (array!104918) Bool)

(assert (=> start!134718 (array_inv!39587 a!3481)))

(declare-fun b!1570954 () Bool)

(declare-fun e!875906 () Bool)

(assert (=> b!1570954 (= e!875907 e!875906)))

(declare-fun res!1073063 () Bool)

(assert (=> b!1570954 (=> (not res!1073063) (not e!875906))))

(declare-fun e!875908 () Bool)

(assert (=> b!1570954 (= res!1073063 e!875908)))

(declare-fun res!1073069 () Bool)

(assert (=> b!1570954 (=> res!1073069 e!875908)))

(declare-fun lt!674103 () Bool)

(assert (=> b!1570954 (= res!1073069 (not lt!674103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570954 (= lt!674103 (validKeyInArray!0 (select (arr!50632 a!3481) from!2856)))))

(declare-fun b!1570955 () Bool)

(assert (=> b!1570955 (= e!875906 (and (not lt!674103) (bvsge (bvsub (size!51183 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51183 a!3481) from!2856))))))

(declare-fun b!1570956 () Bool)

(declare-fun res!1073068 () Bool)

(assert (=> b!1570956 (=> (not res!1073068) (not e!875907))))

(declare-datatypes ((List!36742 0))(
  ( (Nil!36739) (Cons!36738 (h!38203 (_ BitVec 64)) (t!51642 List!36742)) )
))
(declare-fun acc!619 () List!36742)

(declare-fun contains!10457 (List!36742 (_ BitVec 64)) Bool)

(assert (=> b!1570956 (= res!1073068 (not (contains!10457 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570957 () Bool)

(declare-fun res!1073064 () Bool)

(assert (=> b!1570957 (=> (not res!1073064) (not e!875907))))

(assert (=> b!1570957 (= res!1073064 (not (contains!10457 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570958 () Bool)

(assert (=> b!1570958 (= e!875908 (not (contains!10457 acc!619 (select (arr!50632 a!3481) from!2856))))))

(declare-fun b!1570959 () Bool)

(declare-fun res!1073065 () Bool)

(assert (=> b!1570959 (=> (not res!1073065) (not e!875907))))

(declare-fun noDuplicate!2705 (List!36742) Bool)

(assert (=> b!1570959 (= res!1073065 (noDuplicate!2705 acc!619))))

(assert (= (and start!134718 res!1073067) b!1570959))

(assert (= (and b!1570959 res!1073065) b!1570957))

(assert (= (and b!1570957 res!1073064) b!1570956))

(assert (= (and b!1570956 res!1073068) b!1570953))

(assert (= (and b!1570953 res!1073066) b!1570954))

(assert (= (and b!1570954 (not res!1073069)) b!1570958))

(assert (= (and b!1570954 res!1073063) b!1570955))

(declare-fun m!1445415 () Bool)

(assert (=> b!1570957 m!1445415))

(declare-fun m!1445417 () Bool)

(assert (=> b!1570959 m!1445417))

(declare-fun m!1445419 () Bool)

(assert (=> start!134718 m!1445419))

(declare-fun m!1445421 () Bool)

(assert (=> b!1570956 m!1445421))

(declare-fun m!1445423 () Bool)

(assert (=> b!1570954 m!1445423))

(assert (=> b!1570954 m!1445423))

(declare-fun m!1445425 () Bool)

(assert (=> b!1570954 m!1445425))

(assert (=> b!1570958 m!1445423))

(assert (=> b!1570958 m!1445423))

(declare-fun m!1445427 () Bool)

(assert (=> b!1570958 m!1445427))

(check-sat (not b!1570958) (not start!134718) (not b!1570956) (not b!1570959) (not b!1570954) (not b!1570957))
(check-sat)
