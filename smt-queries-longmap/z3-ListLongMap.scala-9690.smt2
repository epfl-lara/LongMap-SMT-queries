; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114476 () Bool)

(assert start!114476)

(declare-fun b!1358483 () Bool)

(declare-datatypes ((Unit!44535 0))(
  ( (Unit!44536) )
))
(declare-fun e!771019 () Unit!44535)

(declare-fun Unit!44537 () Unit!44535)

(assert (=> b!1358483 (= e!771019 Unit!44537)))

(declare-fun b!1358484 () Bool)

(declare-fun res!903163 () Bool)

(declare-fun e!771017 () Bool)

(assert (=> b!1358484 (=> (not res!903163) (not e!771017))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358484 (= res!903163 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358485 () Bool)

(declare-fun res!903158 () Bool)

(assert (=> b!1358485 (=> (not res!903158) (not e!771017))))

(declare-datatypes ((List!31772 0))(
  ( (Nil!31769) (Cons!31768 (h!32977 (_ BitVec 64)) (t!46434 List!31772)) )
))
(declare-fun acc!759 () List!31772)

(declare-datatypes ((array!92421 0))(
  ( (array!92422 (arr!44653 (Array (_ BitVec 32) (_ BitVec 64))) (size!45205 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92421)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92421 (_ BitVec 32) List!31772) Bool)

(assert (=> b!1358485 (= res!903158 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358486 () Bool)

(declare-fun res!903156 () Bool)

(assert (=> b!1358486 (=> (not res!903156) (not e!771017))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358486 (= res!903156 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45205 a!3742))))))

(declare-fun b!1358487 () Bool)

(declare-fun res!903157 () Bool)

(assert (=> b!1358487 (=> (not res!903157) (not e!771017))))

(declare-fun noDuplicate!2307 (List!31772) Bool)

(assert (=> b!1358487 (= res!903157 (noDuplicate!2307 acc!759))))

(declare-fun b!1358488 () Bool)

(declare-fun lt!599183 () Unit!44535)

(assert (=> b!1358488 (= e!771019 lt!599183)))

(declare-fun lt!599184 () Unit!44535)

(declare-fun lemmaListSubSeqRefl!0 (List!31772) Unit!44535)

(assert (=> b!1358488 (= lt!599184 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!830 (List!31772 List!31772) Bool)

(assert (=> b!1358488 (subseq!830 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92421 List!31772 List!31772 (_ BitVec 32)) Unit!44535)

(declare-fun $colon$colon!835 (List!31772 (_ BitVec 64)) List!31772)

(assert (=> b!1358488 (= lt!599183 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!835 acc!759 (select (arr!44653 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358488 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!903160 () Bool)

(assert (=> start!114476 (=> (not res!903160) (not e!771017))))

(assert (=> start!114476 (= res!903160 (and (bvslt (size!45205 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45205 a!3742))))))

(assert (=> start!114476 e!771017))

(assert (=> start!114476 true))

(declare-fun array_inv!33886 (array!92421) Bool)

(assert (=> start!114476 (array_inv!33886 a!3742)))

(declare-fun b!1358489 () Bool)

(assert (=> b!1358489 (= e!771017 (and (= from!3120 i!1404) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599185 () Unit!44535)

(assert (=> b!1358489 (= lt!599185 e!771019)))

(declare-fun c!127106 () Bool)

(assert (=> b!1358489 (= c!127106 (validKeyInArray!0 (select (arr!44653 a!3742) from!3120)))))

(declare-fun b!1358490 () Bool)

(declare-fun res!903161 () Bool)

(assert (=> b!1358490 (=> (not res!903161) (not e!771017))))

(declare-fun contains!9392 (List!31772 (_ BitVec 64)) Bool)

(assert (=> b!1358490 (= res!903161 (not (contains!9392 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358491 () Bool)

(declare-fun res!903162 () Bool)

(assert (=> b!1358491 (=> (not res!903162) (not e!771017))))

(assert (=> b!1358491 (= res!903162 (not (contains!9392 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358492 () Bool)

(declare-fun res!903164 () Bool)

(assert (=> b!1358492 (=> (not res!903164) (not e!771017))))

(assert (=> b!1358492 (= res!903164 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31769))))

(declare-fun b!1358493 () Bool)

(declare-fun res!903159 () Bool)

(assert (=> b!1358493 (=> (not res!903159) (not e!771017))))

(assert (=> b!1358493 (= res!903159 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45205 a!3742)))))

(assert (= (and start!114476 res!903160) b!1358487))

(assert (= (and b!1358487 res!903157) b!1358491))

(assert (= (and b!1358491 res!903162) b!1358490))

(assert (= (and b!1358490 res!903161) b!1358492))

(assert (= (and b!1358492 res!903164) b!1358485))

(assert (= (and b!1358485 res!903158) b!1358486))

(assert (= (and b!1358486 res!903156) b!1358484))

(assert (= (and b!1358484 res!903163) b!1358493))

(assert (= (and b!1358493 res!903159) b!1358489))

(assert (= (and b!1358489 c!127106) b!1358488))

(assert (= (and b!1358489 (not c!127106)) b!1358483))

(declare-fun m!1243603 () Bool)

(assert (=> b!1358489 m!1243603))

(assert (=> b!1358489 m!1243603))

(declare-fun m!1243605 () Bool)

(assert (=> b!1358489 m!1243605))

(declare-fun m!1243607 () Bool)

(assert (=> b!1358487 m!1243607))

(declare-fun m!1243609 () Bool)

(assert (=> b!1358484 m!1243609))

(declare-fun m!1243611 () Bool)

(assert (=> b!1358488 m!1243611))

(assert (=> b!1358488 m!1243603))

(declare-fun m!1243613 () Bool)

(assert (=> b!1358488 m!1243613))

(declare-fun m!1243615 () Bool)

(assert (=> b!1358488 m!1243615))

(declare-fun m!1243617 () Bool)

(assert (=> b!1358488 m!1243617))

(assert (=> b!1358488 m!1243603))

(assert (=> b!1358488 m!1243613))

(declare-fun m!1243619 () Bool)

(assert (=> b!1358488 m!1243619))

(declare-fun m!1243621 () Bool)

(assert (=> start!114476 m!1243621))

(declare-fun m!1243623 () Bool)

(assert (=> b!1358485 m!1243623))

(declare-fun m!1243625 () Bool)

(assert (=> b!1358491 m!1243625))

(declare-fun m!1243627 () Bool)

(assert (=> b!1358492 m!1243627))

(declare-fun m!1243629 () Bool)

(assert (=> b!1358490 m!1243629))

(check-sat (not b!1358488) (not b!1358492) (not b!1358491) (not b!1358485) (not b!1358487) (not start!114476) (not b!1358489) (not b!1358484) (not b!1358490))
(check-sat)
