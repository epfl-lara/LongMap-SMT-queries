; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115696 () Bool)

(assert start!115696)

(declare-fun b!1368109 () Bool)

(declare-fun e!775228 () Bool)

(assert (=> b!1368109 (= e!775228 false)))

(declare-datatypes ((array!92847 0))(
  ( (array!92848 (arr!44848 (Array (_ BitVec 32) (_ BitVec 64))) (size!45400 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92847)

(declare-fun lt!601832 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31994 0))(
  ( (Nil!31991) (Cons!31990 (h!33199 (_ BitVec 64)) (t!46680 List!31994)) )
))
(declare-fun acc!866 () List!31994)

(declare-fun arrayNoDuplicates!0 (array!92847 (_ BitVec 32) List!31994) Bool)

(assert (=> b!1368109 (= lt!601832 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368110 () Bool)

(declare-fun res!911667 () Bool)

(declare-fun e!775230 () Bool)

(assert (=> b!1368110 (=> (not res!911667) (not e!775230))))

(declare-fun noDuplicate!2502 (List!31994) Bool)

(assert (=> b!1368110 (= res!911667 (noDuplicate!2502 acc!866))))

(declare-fun b!1368111 () Bool)

(declare-fun res!911662 () Bool)

(assert (=> b!1368111 (=> (not res!911662) (not e!775228))))

(assert (=> b!1368111 (= res!911662 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368112 () Bool)

(declare-fun res!911661 () Bool)

(assert (=> b!1368112 (=> (not res!911661) (not e!775228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368112 (= res!911661 (not (validKeyInArray!0 (select (arr!44848 a!3861) from!3239))))))

(declare-fun b!1368113 () Bool)

(declare-fun res!911665 () Bool)

(assert (=> b!1368113 (=> (not res!911665) (not e!775228))))

(assert (=> b!1368113 (= res!911665 (bvslt from!3239 (size!45400 a!3861)))))

(declare-fun b!1368114 () Bool)

(declare-fun res!911660 () Bool)

(assert (=> b!1368114 (=> (not res!911660) (not e!775230))))

(declare-fun newAcc!98 () List!31994)

(declare-fun contains!9587 (List!31994 (_ BitVec 64)) Bool)

(assert (=> b!1368114 (= res!911660 (not (contains!9587 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368108 () Bool)

(declare-fun res!911669 () Bool)

(assert (=> b!1368108 (=> (not res!911669) (not e!775230))))

(assert (=> b!1368108 (= res!911669 (not (contains!9587 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911659 () Bool)

(assert (=> start!115696 (=> (not res!911659) (not e!775230))))

(assert (=> start!115696 (= res!911659 (and (bvslt (size!45400 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45400 a!3861))))))

(assert (=> start!115696 e!775230))

(declare-fun array_inv!34081 (array!92847) Bool)

(assert (=> start!115696 (array_inv!34081 a!3861)))

(assert (=> start!115696 true))

(declare-fun b!1368115 () Bool)

(declare-fun res!911663 () Bool)

(assert (=> b!1368115 (=> (not res!911663) (not e!775230))))

(assert (=> b!1368115 (= res!911663 (not (contains!9587 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368116 () Bool)

(declare-fun res!911668 () Bool)

(assert (=> b!1368116 (=> (not res!911668) (not e!775230))))

(assert (=> b!1368116 (= res!911668 (not (contains!9587 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368117 () Bool)

(assert (=> b!1368117 (= e!775230 e!775228)))

(declare-fun res!911664 () Bool)

(assert (=> b!1368117 (=> (not res!911664) (not e!775228))))

(assert (=> b!1368117 (= res!911664 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45024 0))(
  ( (Unit!45025) )
))
(declare-fun lt!601833 () Unit!45024)

(declare-fun noDuplicateSubseq!212 (List!31994 List!31994) Unit!45024)

(assert (=> b!1368117 (= lt!601833 (noDuplicateSubseq!212 newAcc!98 acc!866))))

(declare-fun b!1368118 () Bool)

(declare-fun res!911666 () Bool)

(assert (=> b!1368118 (=> (not res!911666) (not e!775230))))

(declare-fun subseq!1025 (List!31994 List!31994) Bool)

(assert (=> b!1368118 (= res!911666 (subseq!1025 newAcc!98 acc!866))))

(assert (= (and start!115696 res!911659) b!1368110))

(assert (= (and b!1368110 res!911667) b!1368116))

(assert (= (and b!1368116 res!911668) b!1368108))

(assert (= (and b!1368108 res!911669) b!1368115))

(assert (= (and b!1368115 res!911663) b!1368114))

(assert (= (and b!1368114 res!911660) b!1368118))

(assert (= (and b!1368118 res!911666) b!1368117))

(assert (= (and b!1368117 res!911664) b!1368113))

(assert (= (and b!1368113 res!911665) b!1368112))

(assert (= (and b!1368112 res!911661) b!1368111))

(assert (= (and b!1368111 res!911662) b!1368109))

(declare-fun m!1251693 () Bool)

(assert (=> b!1368118 m!1251693))

(declare-fun m!1251695 () Bool)

(assert (=> b!1368109 m!1251695))

(declare-fun m!1251697 () Bool)

(assert (=> b!1368117 m!1251697))

(declare-fun m!1251699 () Bool)

(assert (=> b!1368117 m!1251699))

(declare-fun m!1251701 () Bool)

(assert (=> b!1368114 m!1251701))

(declare-fun m!1251703 () Bool)

(assert (=> start!115696 m!1251703))

(declare-fun m!1251705 () Bool)

(assert (=> b!1368115 m!1251705))

(declare-fun m!1251707 () Bool)

(assert (=> b!1368112 m!1251707))

(assert (=> b!1368112 m!1251707))

(declare-fun m!1251709 () Bool)

(assert (=> b!1368112 m!1251709))

(declare-fun m!1251711 () Bool)

(assert (=> b!1368110 m!1251711))

(declare-fun m!1251713 () Bool)

(assert (=> b!1368108 m!1251713))

(declare-fun m!1251715 () Bool)

(assert (=> b!1368116 m!1251715))

(check-sat (not start!115696) (not b!1368112) (not b!1368110) (not b!1368118) (not b!1368109) (not b!1368116) (not b!1368114) (not b!1368108) (not b!1368115) (not b!1368117))
(check-sat)
