; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113944 () Bool)

(assert start!113944)

(declare-fun b!1351646 () Bool)

(declare-fun res!897104 () Bool)

(declare-fun e!768551 () Bool)

(assert (=> b!1351646 (=> res!897104 e!768551)))

(declare-datatypes ((List!31552 0))(
  ( (Nil!31549) (Cons!31548 (h!32757 (_ BitVec 64)) (t!46210 List!31552)) )
))
(declare-fun acc!759 () List!31552)

(declare-fun lt!597283 () List!31552)

(declare-fun subseq!681 (List!31552 List!31552) Bool)

(assert (=> b!1351646 (= res!897104 (not (subseq!681 acc!759 lt!597283)))))

(declare-fun b!1351647 () Bool)

(declare-fun res!897107 () Bool)

(declare-fun e!768552 () Bool)

(assert (=> b!1351647 (=> (not res!897107) (not e!768552))))

(declare-fun contains!9261 (List!31552 (_ BitVec 64)) Bool)

(assert (=> b!1351647 (= res!897107 (not (contains!9261 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351648 () Bool)

(declare-fun res!897113 () Bool)

(assert (=> b!1351648 (=> (not res!897113) (not e!768552))))

(declare-fun noDuplicate!2118 (List!31552) Bool)

(assert (=> b!1351648 (= res!897113 (noDuplicate!2118 acc!759))))

(declare-fun b!1351649 () Bool)

(declare-fun res!897110 () Bool)

(assert (=> b!1351649 (=> (not res!897110) (not e!768552))))

(declare-datatypes ((array!92126 0))(
  ( (array!92127 (arr!44511 (Array (_ BitVec 32) (_ BitVec 64))) (size!45061 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92126)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92126 (_ BitVec 32) List!31552) Bool)

(assert (=> b!1351649 (= res!897110 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351650 () Bool)

(declare-fun res!897108 () Bool)

(assert (=> b!1351650 (=> res!897108 e!768551)))

(assert (=> b!1351650 (= res!897108 (contains!9261 lt!597283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351651 () Bool)

(declare-fun res!897118 () Bool)

(assert (=> b!1351651 (=> (not res!897118) (not e!768552))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351651 (= res!897118 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45061 a!3742))))))

(declare-fun b!1351652 () Bool)

(declare-fun res!897109 () Bool)

(assert (=> b!1351652 (=> (not res!897109) (not e!768552))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351652 (= res!897109 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351654 () Bool)

(declare-fun res!897114 () Bool)

(assert (=> b!1351654 (=> (not res!897114) (not e!768552))))

(assert (=> b!1351654 (= res!897114 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45061 a!3742)))))

(declare-fun b!1351655 () Bool)

(declare-fun res!897112 () Bool)

(assert (=> b!1351655 (=> (not res!897112) (not e!768552))))

(assert (=> b!1351655 (= res!897112 (validKeyInArray!0 (select (arr!44511 a!3742) from!3120)))))

(declare-fun b!1351656 () Bool)

(declare-fun res!897115 () Bool)

(assert (=> b!1351656 (=> res!897115 e!768551)))

(assert (=> b!1351656 (= res!897115 (not (noDuplicate!2118 lt!597283)))))

(declare-fun b!1351657 () Bool)

(declare-fun res!897117 () Bool)

(assert (=> b!1351657 (=> (not res!897117) (not e!768552))))

(assert (=> b!1351657 (= res!897117 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31549))))

(declare-fun b!1351658 () Bool)

(declare-fun res!897116 () Bool)

(assert (=> b!1351658 (=> res!897116 e!768551)))

(assert (=> b!1351658 (= res!897116 (contains!9261 lt!597283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351659 () Bool)

(assert (=> b!1351659 (= e!768551 true)))

(declare-fun lt!597286 () Bool)

(assert (=> b!1351659 (= lt!597286 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597283))))

(declare-datatypes ((Unit!44276 0))(
  ( (Unit!44277) )
))
(declare-fun lt!597285 () Unit!44276)

(declare-fun noDuplicateSubseq!132 (List!31552 List!31552) Unit!44276)

(assert (=> b!1351659 (= lt!597285 (noDuplicateSubseq!132 acc!759 lt!597283))))

(declare-fun b!1351660 () Bool)

(declare-fun res!897111 () Bool)

(assert (=> b!1351660 (=> (not res!897111) (not e!768552))))

(assert (=> b!1351660 (= res!897111 (not (contains!9261 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!897106 () Bool)

(assert (=> start!113944 (=> (not res!897106) (not e!768552))))

(assert (=> start!113944 (= res!897106 (and (bvslt (size!45061 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45061 a!3742))))))

(assert (=> start!113944 e!768552))

(assert (=> start!113944 true))

(declare-fun array_inv!33539 (array!92126) Bool)

(assert (=> start!113944 (array_inv!33539 a!3742)))

(declare-fun b!1351653 () Bool)

(assert (=> b!1351653 (= e!768552 (not e!768551))))

(declare-fun res!897105 () Bool)

(assert (=> b!1351653 (=> res!897105 e!768551)))

(assert (=> b!1351653 (= res!897105 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!696 (List!31552 (_ BitVec 64)) List!31552)

(assert (=> b!1351653 (= lt!597283 ($colon$colon!696 acc!759 (select (arr!44511 a!3742) from!3120)))))

(assert (=> b!1351653 (subseq!681 acc!759 acc!759)))

(declare-fun lt!597284 () Unit!44276)

(declare-fun lemmaListSubSeqRefl!0 (List!31552) Unit!44276)

(assert (=> b!1351653 (= lt!597284 (lemmaListSubSeqRefl!0 acc!759))))

(assert (= (and start!113944 res!897106) b!1351648))

(assert (= (and b!1351648 res!897113) b!1351647))

(assert (= (and b!1351647 res!897107) b!1351660))

(assert (= (and b!1351660 res!897111) b!1351657))

(assert (= (and b!1351657 res!897117) b!1351649))

(assert (= (and b!1351649 res!897110) b!1351651))

(assert (= (and b!1351651 res!897118) b!1351652))

(assert (= (and b!1351652 res!897109) b!1351654))

(assert (= (and b!1351654 res!897114) b!1351655))

(assert (= (and b!1351655 res!897112) b!1351653))

(assert (= (and b!1351653 (not res!897105)) b!1351656))

(assert (= (and b!1351656 (not res!897115)) b!1351658))

(assert (= (and b!1351658 (not res!897116)) b!1351650))

(assert (= (and b!1351650 (not res!897108)) b!1351646))

(assert (= (and b!1351646 (not res!897104)) b!1351659))

(declare-fun m!1238629 () Bool)

(assert (=> b!1351657 m!1238629))

(declare-fun m!1238631 () Bool)

(assert (=> b!1351652 m!1238631))

(declare-fun m!1238633 () Bool)

(assert (=> b!1351660 m!1238633))

(declare-fun m!1238635 () Bool)

(assert (=> b!1351648 m!1238635))

(declare-fun m!1238637 () Bool)

(assert (=> b!1351655 m!1238637))

(assert (=> b!1351655 m!1238637))

(declare-fun m!1238639 () Bool)

(assert (=> b!1351655 m!1238639))

(declare-fun m!1238641 () Bool)

(assert (=> b!1351649 m!1238641))

(declare-fun m!1238643 () Bool)

(assert (=> b!1351656 m!1238643))

(declare-fun m!1238645 () Bool)

(assert (=> start!113944 m!1238645))

(declare-fun m!1238647 () Bool)

(assert (=> b!1351659 m!1238647))

(declare-fun m!1238649 () Bool)

(assert (=> b!1351659 m!1238649))

(declare-fun m!1238651 () Bool)

(assert (=> b!1351647 m!1238651))

(declare-fun m!1238653 () Bool)

(assert (=> b!1351658 m!1238653))

(declare-fun m!1238655 () Bool)

(assert (=> b!1351650 m!1238655))

(assert (=> b!1351653 m!1238637))

(assert (=> b!1351653 m!1238637))

(declare-fun m!1238657 () Bool)

(assert (=> b!1351653 m!1238657))

(declare-fun m!1238659 () Bool)

(assert (=> b!1351653 m!1238659))

(declare-fun m!1238661 () Bool)

(assert (=> b!1351653 m!1238661))

(declare-fun m!1238663 () Bool)

(assert (=> b!1351646 m!1238663))

(check-sat (not b!1351655) (not b!1351650) (not b!1351647) (not b!1351653) (not b!1351649) (not b!1351659) (not b!1351660) (not b!1351657) (not start!113944) (not b!1351652) (not b!1351656) (not b!1351648) (not b!1351658) (not b!1351646))
