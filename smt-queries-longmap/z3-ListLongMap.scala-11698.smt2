; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136810 () Bool)

(assert start!136810)

(declare-fun b!1578783 () Bool)

(declare-fun res!1078722 () Bool)

(declare-fun e!880618 () Bool)

(assert (=> b!1578783 (=> (not res!1078722) (not e!880618))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105799 0))(
  ( (array!105800 (arr!51008 (Array (_ BitVec 32) (_ BitVec 64))) (size!51558 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105799)

(declare-fun arrayContainsKey!0 (array!105799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578783 (= res!1078722 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578784 () Bool)

(declare-fun res!1078724 () Bool)

(assert (=> b!1578784 (=> (not res!1078724) (not e!880618))))

(assert (=> b!1578784 (= res!1078724 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51558 a!3559))))))

(declare-fun b!1578786 () Bool)

(assert (=> b!1578786 (= e!880618 (not true))))

(assert (=> b!1578786 (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52194 0))(
  ( (Unit!52195) )
))
(declare-fun lt!676327 () Unit!52194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105799 (_ BitVec 64) (_ BitVec 32)) Unit!52194)

(assert (=> b!1578786 (= lt!676327 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078723 () Bool)

(assert (=> start!136810 (=> (not res!1078723) (not e!880618))))

(assert (=> start!136810 (= res!1078723 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51558 a!3559)) (bvslt (size!51558 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136810 e!880618))

(assert (=> start!136810 true))

(declare-fun array_inv!39735 (array!105799) Bool)

(assert (=> start!136810 (array_inv!39735 a!3559)))

(declare-fun b!1578785 () Bool)

(declare-fun res!1078725 () Bool)

(assert (=> b!1578785 (=> (not res!1078725) (not e!880618))))

(assert (=> b!1578785 (= res!1078725 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136810 res!1078723) b!1578783))

(assert (= (and b!1578783 res!1078722) b!1578784))

(assert (= (and b!1578784 res!1078724) b!1578785))

(assert (= (and b!1578785 res!1078725) b!1578786))

(declare-fun m!1450805 () Bool)

(assert (=> b!1578783 m!1450805))

(declare-fun m!1450807 () Bool)

(assert (=> b!1578786 m!1450807))

(declare-fun m!1450809 () Bool)

(assert (=> b!1578786 m!1450809))

(declare-fun m!1450811 () Bool)

(assert (=> start!136810 m!1450811))

(declare-fun m!1450813 () Bool)

(assert (=> b!1578785 m!1450813))

(check-sat (not b!1578783) (not b!1578785) (not start!136810) (not b!1578786))
