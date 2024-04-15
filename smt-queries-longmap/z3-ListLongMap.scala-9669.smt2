; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114152 () Bool)

(assert start!114152)

(declare-fun res!900756 () Bool)

(declare-fun e!769879 () Bool)

(assert (=> start!114152 (=> (not res!900756) (not e!769879))))

(declare-datatypes ((array!92283 0))(
  ( (array!92284 (arr!44590 (Array (_ BitVec 32) (_ BitVec 64))) (size!45142 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92283)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114152 (= res!900756 (and (bvslt (size!45142 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45142 a!3742))))))

(assert (=> start!114152 e!769879))

(assert (=> start!114152 true))

(declare-fun array_inv!33823 (array!92283) Bool)

(assert (=> start!114152 (array_inv!33823 a!3742)))

(declare-fun b!1355872 () Bool)

(declare-fun res!900760 () Bool)

(assert (=> b!1355872 (=> (not res!900760) (not e!769879))))

(assert (=> b!1355872 (= res!900760 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45142 a!3742)))))

(declare-fun b!1355873 () Bool)

(declare-fun res!900755 () Bool)

(assert (=> b!1355873 (=> (not res!900755) (not e!769879))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355873 (= res!900755 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45142 a!3742))))))

(declare-fun b!1355874 () Bool)

(declare-fun res!900762 () Bool)

(assert (=> b!1355874 (=> (not res!900762) (not e!769879))))

(declare-datatypes ((List!31709 0))(
  ( (Nil!31706) (Cons!31705 (h!32914 (_ BitVec 64)) (t!46359 List!31709)) )
))
(declare-fun acc!759 () List!31709)

(declare-fun contains!9329 (List!31709 (_ BitVec 64)) Bool)

(assert (=> b!1355874 (= res!900762 (not (contains!9329 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355875 () Bool)

(declare-fun res!900764 () Bool)

(assert (=> b!1355875 (=> (not res!900764) (not e!769879))))

(declare-fun arrayNoDuplicates!0 (array!92283 (_ BitVec 32) List!31709) Bool)

(assert (=> b!1355875 (= res!900764 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31706))))

(declare-fun b!1355876 () Bool)

(declare-fun res!900761 () Bool)

(assert (=> b!1355876 (=> (not res!900761) (not e!769879))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355876 (= res!900761 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355877 () Bool)

(declare-fun e!769880 () Bool)

(assert (=> b!1355877 (= e!769879 e!769880)))

(declare-fun res!900759 () Bool)

(assert (=> b!1355877 (=> (not res!900759) (not e!769880))))

(declare-fun lt!598657 () Bool)

(assert (=> b!1355877 (= res!900759 (and (not (= from!3120 i!1404)) (not lt!598657) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44427 0))(
  ( (Unit!44428) )
))
(declare-fun lt!598654 () Unit!44427)

(declare-fun e!769881 () Unit!44427)

(assert (=> b!1355877 (= lt!598654 e!769881)))

(declare-fun c!127001 () Bool)

(assert (=> b!1355877 (= c!127001 lt!598657)))

(assert (=> b!1355877 (= lt!598657 (validKeyInArray!0 (select (arr!44590 a!3742) from!3120)))))

(declare-fun b!1355878 () Bool)

(declare-fun res!900758 () Bool)

(assert (=> b!1355878 (=> (not res!900758) (not e!769879))))

(assert (=> b!1355878 (= res!900758 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355879 () Bool)

(declare-fun res!900763 () Bool)

(assert (=> b!1355879 (=> (not res!900763) (not e!769879))))

(declare-fun noDuplicate!2244 (List!31709) Bool)

(assert (=> b!1355879 (= res!900763 (noDuplicate!2244 acc!759))))

(declare-fun b!1355880 () Bool)

(declare-fun Unit!44429 () Unit!44427)

(assert (=> b!1355880 (= e!769881 Unit!44429)))

(declare-fun b!1355881 () Bool)

(declare-fun res!900757 () Bool)

(assert (=> b!1355881 (=> (not res!900757) (not e!769879))))

(assert (=> b!1355881 (= res!900757 (not (contains!9329 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355882 () Bool)

(assert (=> b!1355882 (= e!769880 false)))

(declare-fun lt!598655 () Bool)

(assert (=> b!1355882 (= lt!598655 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355883 () Bool)

(declare-fun lt!598653 () Unit!44427)

(assert (=> b!1355883 (= e!769881 lt!598653)))

(declare-fun lt!598656 () Unit!44427)

(declare-fun lemmaListSubSeqRefl!0 (List!31709) Unit!44427)

(assert (=> b!1355883 (= lt!598656 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!785 (List!31709 List!31709) Bool)

(assert (=> b!1355883 (subseq!785 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92283 List!31709 List!31709 (_ BitVec 32)) Unit!44427)

(declare-fun $colon$colon!802 (List!31709 (_ BitVec 64)) List!31709)

(assert (=> b!1355883 (= lt!598653 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!802 acc!759 (select (arr!44590 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355883 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114152 res!900756) b!1355879))

(assert (= (and b!1355879 res!900763) b!1355881))

(assert (= (and b!1355881 res!900757) b!1355874))

(assert (= (and b!1355874 res!900762) b!1355875))

(assert (= (and b!1355875 res!900764) b!1355878))

(assert (= (and b!1355878 res!900758) b!1355873))

(assert (= (and b!1355873 res!900755) b!1355876))

(assert (= (and b!1355876 res!900761) b!1355872))

(assert (= (and b!1355872 res!900760) b!1355877))

(assert (= (and b!1355877 c!127001) b!1355883))

(assert (= (and b!1355877 (not c!127001)) b!1355880))

(assert (= (and b!1355877 res!900759) b!1355882))

(declare-fun m!1241497 () Bool)

(assert (=> b!1355875 m!1241497))

(declare-fun m!1241499 () Bool)

(assert (=> b!1355882 m!1241499))

(declare-fun m!1241501 () Bool)

(assert (=> start!114152 m!1241501))

(declare-fun m!1241503 () Bool)

(assert (=> b!1355874 m!1241503))

(declare-fun m!1241505 () Bool)

(assert (=> b!1355879 m!1241505))

(declare-fun m!1241507 () Bool)

(assert (=> b!1355876 m!1241507))

(declare-fun m!1241509 () Bool)

(assert (=> b!1355878 m!1241509))

(declare-fun m!1241511 () Bool)

(assert (=> b!1355877 m!1241511))

(assert (=> b!1355877 m!1241511))

(declare-fun m!1241513 () Bool)

(assert (=> b!1355877 m!1241513))

(declare-fun m!1241515 () Bool)

(assert (=> b!1355881 m!1241515))

(declare-fun m!1241517 () Bool)

(assert (=> b!1355883 m!1241517))

(assert (=> b!1355883 m!1241511))

(declare-fun m!1241519 () Bool)

(assert (=> b!1355883 m!1241519))

(declare-fun m!1241521 () Bool)

(assert (=> b!1355883 m!1241521))

(assert (=> b!1355883 m!1241499))

(assert (=> b!1355883 m!1241511))

(assert (=> b!1355883 m!1241519))

(declare-fun m!1241523 () Bool)

(assert (=> b!1355883 m!1241523))

(check-sat (not b!1355878) (not b!1355881) (not b!1355882) (not b!1355876) (not b!1355875) (not b!1355879) (not b!1355874) (not start!114152) (not b!1355883) (not b!1355877))
(check-sat)
