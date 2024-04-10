; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114964 () Bool)

(assert start!114964)

(declare-fun b!1362606 () Bool)

(declare-datatypes ((Unit!44922 0))(
  ( (Unit!44923) )
))
(declare-fun e!772929 () Unit!44922)

(declare-fun lt!600530 () Unit!44922)

(assert (=> b!1362606 (= e!772929 lt!600530)))

(declare-fun lt!600531 () Unit!44922)

(declare-datatypes ((List!31795 0))(
  ( (Nil!31792) (Cons!31791 (h!33000 (_ BitVec 64)) (t!46483 List!31795)) )
))
(declare-fun acc!759 () List!31795)

(declare-fun lemmaListSubSeqRefl!0 (List!31795) Unit!44922)

(assert (=> b!1362606 (= lt!600531 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!906 (List!31795 List!31795) Bool)

(assert (=> b!1362606 (subseq!906 acc!759 acc!759)))

(declare-datatypes ((array!92642 0))(
  ( (array!92643 (arr!44754 (Array (_ BitVec 32) (_ BitVec 64))) (size!45304 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92642)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92642 List!31795 List!31795 (_ BitVec 32)) Unit!44922)

(declare-fun $colon$colon!909 (List!31795 (_ BitVec 64)) List!31795)

(assert (=> b!1362606 (= lt!600530 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!909 acc!759 (select (arr!44754 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92642 (_ BitVec 32) List!31795) Bool)

(assert (=> b!1362606 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362607 () Bool)

(declare-fun res!906568 () Bool)

(declare-fun e!772930 () Bool)

(assert (=> b!1362607 (=> (not res!906568) (not e!772930))))

(declare-fun contains!9504 (List!31795 (_ BitVec 64)) Bool)

(assert (=> b!1362607 (= res!906568 (not (contains!9504 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362608 () Bool)

(declare-fun Unit!44924 () Unit!44922)

(assert (=> b!1362608 (= e!772929 Unit!44924)))

(declare-fun res!906570 () Bool)

(assert (=> start!114964 (=> (not res!906570) (not e!772930))))

(assert (=> start!114964 (= res!906570 (and (bvslt (size!45304 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45304 a!3742))))))

(assert (=> start!114964 e!772930))

(assert (=> start!114964 true))

(declare-fun array_inv!33782 (array!92642) Bool)

(assert (=> start!114964 (array_inv!33782 a!3742)))

(declare-fun b!1362609 () Bool)

(declare-fun res!906569 () Bool)

(assert (=> b!1362609 (=> (not res!906569) (not e!772930))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362609 (= res!906569 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45304 a!3742))))))

(declare-fun b!1362610 () Bool)

(declare-fun res!906566 () Bool)

(assert (=> b!1362610 (=> (not res!906566) (not e!772930))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362610 (= res!906566 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362611 () Bool)

(declare-fun res!906571 () Bool)

(assert (=> b!1362611 (=> (not res!906571) (not e!772930))))

(assert (=> b!1362611 (= res!906571 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362612 () Bool)

(assert (=> b!1362612 (= e!772930 false)))

(declare-fun lt!600532 () Unit!44922)

(assert (=> b!1362612 (= lt!600532 e!772929)))

(declare-fun c!127460 () Bool)

(assert (=> b!1362612 (= c!127460 (validKeyInArray!0 (select (arr!44754 a!3742) from!3120)))))

(declare-fun b!1362613 () Bool)

(declare-fun res!906573 () Bool)

(assert (=> b!1362613 (=> (not res!906573) (not e!772930))))

(assert (=> b!1362613 (= res!906573 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31792))))

(declare-fun b!1362614 () Bool)

(declare-fun res!906572 () Bool)

(assert (=> b!1362614 (=> (not res!906572) (not e!772930))))

(assert (=> b!1362614 (= res!906572 (not (contains!9504 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362615 () Bool)

(declare-fun res!906567 () Bool)

(assert (=> b!1362615 (=> (not res!906567) (not e!772930))))

(declare-fun noDuplicate!2361 (List!31795) Bool)

(assert (=> b!1362615 (= res!906567 (noDuplicate!2361 acc!759))))

(declare-fun b!1362616 () Bool)

(declare-fun res!906574 () Bool)

(assert (=> b!1362616 (=> (not res!906574) (not e!772930))))

(assert (=> b!1362616 (= res!906574 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45304 a!3742)))))

(assert (= (and start!114964 res!906570) b!1362615))

(assert (= (and b!1362615 res!906567) b!1362607))

(assert (= (and b!1362607 res!906568) b!1362614))

(assert (= (and b!1362614 res!906572) b!1362613))

(assert (= (and b!1362613 res!906573) b!1362611))

(assert (= (and b!1362611 res!906571) b!1362609))

(assert (= (and b!1362609 res!906569) b!1362610))

(assert (= (and b!1362610 res!906566) b!1362616))

(assert (= (and b!1362616 res!906574) b!1362612))

(assert (= (and b!1362612 c!127460) b!1362606))

(assert (= (and b!1362612 (not c!127460)) b!1362608))

(declare-fun m!1247555 () Bool)

(assert (=> b!1362610 m!1247555))

(declare-fun m!1247557 () Bool)

(assert (=> b!1362612 m!1247557))

(assert (=> b!1362612 m!1247557))

(declare-fun m!1247559 () Bool)

(assert (=> b!1362612 m!1247559))

(declare-fun m!1247561 () Bool)

(assert (=> b!1362607 m!1247561))

(declare-fun m!1247563 () Bool)

(assert (=> b!1362615 m!1247563))

(declare-fun m!1247565 () Bool)

(assert (=> b!1362613 m!1247565))

(declare-fun m!1247567 () Bool)

(assert (=> b!1362606 m!1247567))

(assert (=> b!1362606 m!1247557))

(declare-fun m!1247569 () Bool)

(assert (=> b!1362606 m!1247569))

(declare-fun m!1247571 () Bool)

(assert (=> b!1362606 m!1247571))

(declare-fun m!1247573 () Bool)

(assert (=> b!1362606 m!1247573))

(assert (=> b!1362606 m!1247557))

(assert (=> b!1362606 m!1247569))

(declare-fun m!1247575 () Bool)

(assert (=> b!1362606 m!1247575))

(declare-fun m!1247577 () Bool)

(assert (=> start!114964 m!1247577))

(declare-fun m!1247579 () Bool)

(assert (=> b!1362614 m!1247579))

(declare-fun m!1247581 () Bool)

(assert (=> b!1362611 m!1247581))

(check-sat (not b!1362611) (not b!1362606) (not b!1362615) (not b!1362612) (not b!1362613) (not start!114964) (not b!1362607) (not b!1362610) (not b!1362614))
(check-sat)
