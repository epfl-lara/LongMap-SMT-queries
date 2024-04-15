; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114872 () Bool)

(assert start!114872)

(declare-fun b!1361541 () Bool)

(declare-fun res!905690 () Bool)

(declare-fun e!772467 () Bool)

(assert (=> b!1361541 (=> (not res!905690) (not e!772467))))

(declare-datatypes ((List!31832 0))(
  ( (Nil!31829) (Cons!31828 (h!33037 (_ BitVec 64)) (t!46509 List!31832)) )
))
(declare-fun acc!759 () List!31832)

(declare-fun noDuplicate!2367 (List!31832) Bool)

(assert (=> b!1361541 (= res!905690 (noDuplicate!2367 acc!759))))

(declare-fun b!1361542 () Bool)

(declare-fun e!772464 () Bool)

(assert (=> b!1361542 (= e!772467 e!772464)))

(declare-fun res!905694 () Bool)

(assert (=> b!1361542 (=> (not res!905694) (not e!772464))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600028 () Bool)

(assert (=> b!1361542 (= res!905694 (and (not (= from!3120 i!1404)) lt!600028))))

(declare-datatypes ((Unit!44715 0))(
  ( (Unit!44716) )
))
(declare-fun lt!600027 () Unit!44715)

(declare-fun e!772466 () Unit!44715)

(assert (=> b!1361542 (= lt!600027 e!772466)))

(declare-fun c!127370 () Bool)

(assert (=> b!1361542 (= c!127370 lt!600028)))

(declare-datatypes ((array!92556 0))(
  ( (array!92557 (arr!44713 (Array (_ BitVec 32) (_ BitVec 64))) (size!45265 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92556)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361542 (= lt!600028 (validKeyInArray!0 (select (arr!44713 a!3742) from!3120)))))

(declare-fun res!905689 () Bool)

(assert (=> start!114872 (=> (not res!905689) (not e!772467))))

(assert (=> start!114872 (= res!905689 (and (bvslt (size!45265 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45265 a!3742))))))

(assert (=> start!114872 e!772467))

(assert (=> start!114872 true))

(declare-fun array_inv!33946 (array!92556) Bool)

(assert (=> start!114872 (array_inv!33946 a!3742)))

(declare-fun b!1361543 () Bool)

(declare-fun e!772468 () Bool)

(assert (=> b!1361543 (= e!772468 false)))

(declare-fun lt!600030 () Bool)

(declare-fun lt!600031 () List!31832)

(declare-fun arrayNoDuplicates!0 (array!92556 (_ BitVec 32) List!31832) Bool)

(assert (=> b!1361543 (= lt!600030 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600031))))

(declare-fun b!1361544 () Bool)

(declare-fun res!905686 () Bool)

(assert (=> b!1361544 (=> (not res!905686) (not e!772467))))

(assert (=> b!1361544 (= res!905686 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45265 a!3742)))))

(declare-fun b!1361545 () Bool)

(declare-fun res!905698 () Bool)

(assert (=> b!1361545 (=> (not res!905698) (not e!772467))))

(declare-fun contains!9452 (List!31832 (_ BitVec 64)) Bool)

(assert (=> b!1361545 (= res!905698 (not (contains!9452 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361546 () Bool)

(declare-fun lt!600026 () Unit!44715)

(assert (=> b!1361546 (= e!772466 lt!600026)))

(declare-fun lt!600029 () Unit!44715)

(declare-fun lemmaListSubSeqRefl!0 (List!31832) Unit!44715)

(assert (=> b!1361546 (= lt!600029 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!890 (List!31832 List!31832) Bool)

(assert (=> b!1361546 (subseq!890 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92556 List!31832 List!31832 (_ BitVec 32)) Unit!44715)

(declare-fun $colon$colon!895 (List!31832 (_ BitVec 64)) List!31832)

(assert (=> b!1361546 (= lt!600026 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!895 acc!759 (select (arr!44713 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361546 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361547 () Bool)

(declare-fun res!905687 () Bool)

(assert (=> b!1361547 (=> (not res!905687) (not e!772468))))

(assert (=> b!1361547 (= res!905687 (not (contains!9452 lt!600031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361548 () Bool)

(declare-fun res!905699 () Bool)

(assert (=> b!1361548 (=> (not res!905699) (not e!772467))))

(assert (=> b!1361548 (= res!905699 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45265 a!3742))))))

(declare-fun b!1361549 () Bool)

(declare-fun res!905691 () Bool)

(assert (=> b!1361549 (=> (not res!905691) (not e!772467))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361549 (= res!905691 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361550 () Bool)

(declare-fun res!905697 () Bool)

(assert (=> b!1361550 (=> (not res!905697) (not e!772467))))

(assert (=> b!1361550 (= res!905697 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31829))))

(declare-fun b!1361551 () Bool)

(declare-fun res!905692 () Bool)

(assert (=> b!1361551 (=> (not res!905692) (not e!772468))))

(assert (=> b!1361551 (= res!905692 (noDuplicate!2367 lt!600031))))

(declare-fun b!1361552 () Bool)

(declare-fun Unit!44717 () Unit!44715)

(assert (=> b!1361552 (= e!772466 Unit!44717)))

(declare-fun b!1361553 () Bool)

(assert (=> b!1361553 (= e!772464 e!772468)))

(declare-fun res!905693 () Bool)

(assert (=> b!1361553 (=> (not res!905693) (not e!772468))))

(assert (=> b!1361553 (= res!905693 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1361553 (= lt!600031 ($colon$colon!895 acc!759 (select (arr!44713 a!3742) from!3120)))))

(declare-fun b!1361554 () Bool)

(declare-fun res!905696 () Bool)

(assert (=> b!1361554 (=> (not res!905696) (not e!772467))))

(assert (=> b!1361554 (= res!905696 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361555 () Bool)

(declare-fun res!905688 () Bool)

(assert (=> b!1361555 (=> (not res!905688) (not e!772468))))

(assert (=> b!1361555 (= res!905688 (not (contains!9452 lt!600031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361556 () Bool)

(declare-fun res!905695 () Bool)

(assert (=> b!1361556 (=> (not res!905695) (not e!772467))))

(assert (=> b!1361556 (= res!905695 (not (contains!9452 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114872 res!905689) b!1361541))

(assert (= (and b!1361541 res!905690) b!1361556))

(assert (= (and b!1361556 res!905695) b!1361545))

(assert (= (and b!1361545 res!905698) b!1361550))

(assert (= (and b!1361550 res!905697) b!1361554))

(assert (= (and b!1361554 res!905696) b!1361548))

(assert (= (and b!1361548 res!905699) b!1361549))

(assert (= (and b!1361549 res!905691) b!1361544))

(assert (= (and b!1361544 res!905686) b!1361542))

(assert (= (and b!1361542 c!127370) b!1361546))

(assert (= (and b!1361542 (not c!127370)) b!1361552))

(assert (= (and b!1361542 res!905694) b!1361553))

(assert (= (and b!1361553 res!905693) b!1361551))

(assert (= (and b!1361551 res!905692) b!1361555))

(assert (= (and b!1361555 res!905688) b!1361547))

(assert (= (and b!1361547 res!905687) b!1361543))

(declare-fun m!1246189 () Bool)

(assert (=> b!1361547 m!1246189))

(declare-fun m!1246191 () Bool)

(assert (=> b!1361542 m!1246191))

(assert (=> b!1361542 m!1246191))

(declare-fun m!1246193 () Bool)

(assert (=> b!1361542 m!1246193))

(declare-fun m!1246195 () Bool)

(assert (=> b!1361555 m!1246195))

(declare-fun m!1246197 () Bool)

(assert (=> b!1361550 m!1246197))

(declare-fun m!1246199 () Bool)

(assert (=> b!1361545 m!1246199))

(declare-fun m!1246201 () Bool)

(assert (=> b!1361551 m!1246201))

(declare-fun m!1246203 () Bool)

(assert (=> b!1361554 m!1246203))

(assert (=> b!1361553 m!1246191))

(assert (=> b!1361553 m!1246191))

(declare-fun m!1246205 () Bool)

(assert (=> b!1361553 m!1246205))

(declare-fun m!1246207 () Bool)

(assert (=> b!1361543 m!1246207))

(declare-fun m!1246209 () Bool)

(assert (=> start!114872 m!1246209))

(declare-fun m!1246211 () Bool)

(assert (=> b!1361549 m!1246211))

(declare-fun m!1246213 () Bool)

(assert (=> b!1361556 m!1246213))

(declare-fun m!1246215 () Bool)

(assert (=> b!1361546 m!1246215))

(assert (=> b!1361546 m!1246191))

(assert (=> b!1361546 m!1246205))

(declare-fun m!1246217 () Bool)

(assert (=> b!1361546 m!1246217))

(declare-fun m!1246219 () Bool)

(assert (=> b!1361546 m!1246219))

(assert (=> b!1361546 m!1246191))

(assert (=> b!1361546 m!1246205))

(declare-fun m!1246221 () Bool)

(assert (=> b!1361546 m!1246221))

(declare-fun m!1246223 () Bool)

(assert (=> b!1361541 m!1246223))

(check-sat (not b!1361543) (not b!1361550) (not b!1361556) (not start!114872) (not b!1361545) (not b!1361551) (not b!1361547) (not b!1361546) (not b!1361553) (not b!1361542) (not b!1361554) (not b!1361541) (not b!1361555) (not b!1361549))
(check-sat)
