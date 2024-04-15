; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114686 () Bool)

(assert start!114686)

(declare-fun b!1360495 () Bool)

(declare-fun res!904815 () Bool)

(declare-fun e!771815 () Bool)

(assert (=> b!1360495 (=> (not res!904815) (not e!771815))))

(declare-datatypes ((List!31820 0))(
  ( (Nil!31817) (Cons!31816 (h!33025 (_ BitVec 64)) (t!46488 List!31820)) )
))
(declare-fun acc!759 () List!31820)

(declare-fun contains!9440 (List!31820 (_ BitVec 64)) Bool)

(assert (=> b!1360495 (= res!904815 (not (contains!9440 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360496 () Bool)

(declare-fun res!904810 () Bool)

(assert (=> b!1360496 (=> (not res!904810) (not e!771815))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92523 0))(
  ( (array!92524 (arr!44701 (Array (_ BitVec 32) (_ BitVec 64))) (size!45253 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92523)

(assert (=> b!1360496 (= res!904810 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45253 a!3742)))))

(declare-fun res!904812 () Bool)

(assert (=> start!114686 (=> (not res!904812) (not e!771815))))

(assert (=> start!114686 (= res!904812 (and (bvslt (size!45253 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45253 a!3742))))))

(assert (=> start!114686 e!771815))

(assert (=> start!114686 true))

(declare-fun array_inv!33934 (array!92523) Bool)

(assert (=> start!114686 (array_inv!33934 a!3742)))

(declare-fun b!1360497 () Bool)

(declare-fun e!771817 () Bool)

(assert (=> b!1360497 (= e!771815 e!771817)))

(declare-fun res!904809 () Bool)

(assert (=> b!1360497 (=> (not res!904809) (not e!771817))))

(declare-fun lt!599743 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360497 (= res!904809 (and (not (= from!3120 i!1404)) lt!599743 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44679 0))(
  ( (Unit!44680) )
))
(declare-fun lt!599740 () Unit!44679)

(declare-fun e!771814 () Unit!44679)

(assert (=> b!1360497 (= lt!599740 e!771814)))

(declare-fun c!127286 () Bool)

(assert (=> b!1360497 (= c!127286 lt!599743)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360497 (= lt!599743 (validKeyInArray!0 (select (arr!44701 a!3742) from!3120)))))

(declare-fun b!1360498 () Bool)

(declare-fun Unit!44681 () Unit!44679)

(assert (=> b!1360498 (= e!771814 Unit!44681)))

(declare-fun b!1360499 () Bool)

(declare-fun res!904817 () Bool)

(assert (=> b!1360499 (=> (not res!904817) (not e!771815))))

(declare-fun noDuplicate!2355 (List!31820) Bool)

(assert (=> b!1360499 (= res!904817 (noDuplicate!2355 acc!759))))

(declare-fun b!1360500 () Bool)

(declare-fun $colon$colon!883 (List!31820 (_ BitVec 64)) List!31820)

(assert (=> b!1360500 (= e!771817 (not (noDuplicate!2355 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120)))))))

(declare-fun b!1360501 () Bool)

(declare-fun res!904808 () Bool)

(assert (=> b!1360501 (=> (not res!904808) (not e!771815))))

(assert (=> b!1360501 (= res!904808 (not (contains!9440 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360502 () Bool)

(declare-fun res!904816 () Bool)

(assert (=> b!1360502 (=> (not res!904816) (not e!771815))))

(declare-fun arrayNoDuplicates!0 (array!92523 (_ BitVec 32) List!31820) Bool)

(assert (=> b!1360502 (= res!904816 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360503 () Bool)

(declare-fun lt!599741 () Unit!44679)

(assert (=> b!1360503 (= e!771814 lt!599741)))

(declare-fun lt!599742 () Unit!44679)

(declare-fun lemmaListSubSeqRefl!0 (List!31820) Unit!44679)

(assert (=> b!1360503 (= lt!599742 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!878 (List!31820 List!31820) Bool)

(assert (=> b!1360503 (subseq!878 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92523 List!31820 List!31820 (_ BitVec 32)) Unit!44679)

(assert (=> b!1360503 (= lt!599741 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360503 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360504 () Bool)

(declare-fun res!904811 () Bool)

(assert (=> b!1360504 (=> (not res!904811) (not e!771815))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360504 (= res!904811 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360505 () Bool)

(declare-fun res!904813 () Bool)

(assert (=> b!1360505 (=> (not res!904813) (not e!771815))))

(assert (=> b!1360505 (= res!904813 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31817))))

(declare-fun b!1360506 () Bool)

(declare-fun res!904814 () Bool)

(assert (=> b!1360506 (=> (not res!904814) (not e!771815))))

(assert (=> b!1360506 (= res!904814 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45253 a!3742))))))

(assert (= (and start!114686 res!904812) b!1360499))

(assert (= (and b!1360499 res!904817) b!1360495))

(assert (= (and b!1360495 res!904815) b!1360501))

(assert (= (and b!1360501 res!904808) b!1360505))

(assert (= (and b!1360505 res!904813) b!1360502))

(assert (= (and b!1360502 res!904816) b!1360506))

(assert (= (and b!1360506 res!904814) b!1360504))

(assert (= (and b!1360504 res!904811) b!1360496))

(assert (= (and b!1360496 res!904810) b!1360497))

(assert (= (and b!1360497 c!127286) b!1360503))

(assert (= (and b!1360497 (not c!127286)) b!1360498))

(assert (= (and b!1360497 res!904809) b!1360500))

(declare-fun m!1245301 () Bool)

(assert (=> b!1360499 m!1245301))

(declare-fun m!1245303 () Bool)

(assert (=> b!1360503 m!1245303))

(declare-fun m!1245305 () Bool)

(assert (=> b!1360503 m!1245305))

(declare-fun m!1245307 () Bool)

(assert (=> b!1360503 m!1245307))

(declare-fun m!1245309 () Bool)

(assert (=> b!1360503 m!1245309))

(declare-fun m!1245311 () Bool)

(assert (=> b!1360503 m!1245311))

(assert (=> b!1360503 m!1245305))

(assert (=> b!1360503 m!1245307))

(declare-fun m!1245313 () Bool)

(assert (=> b!1360503 m!1245313))

(declare-fun m!1245315 () Bool)

(assert (=> b!1360501 m!1245315))

(declare-fun m!1245317 () Bool)

(assert (=> b!1360502 m!1245317))

(declare-fun m!1245319 () Bool)

(assert (=> b!1360495 m!1245319))

(assert (=> b!1360500 m!1245305))

(assert (=> b!1360500 m!1245305))

(assert (=> b!1360500 m!1245307))

(assert (=> b!1360500 m!1245307))

(declare-fun m!1245321 () Bool)

(assert (=> b!1360500 m!1245321))

(declare-fun m!1245323 () Bool)

(assert (=> start!114686 m!1245323))

(declare-fun m!1245325 () Bool)

(assert (=> b!1360504 m!1245325))

(declare-fun m!1245327 () Bool)

(assert (=> b!1360505 m!1245327))

(assert (=> b!1360497 m!1245305))

(assert (=> b!1360497 m!1245305))

(declare-fun m!1245329 () Bool)

(assert (=> b!1360497 m!1245329))

(check-sat (not b!1360503) (not b!1360500) (not start!114686) (not b!1360504) (not b!1360505) (not b!1360502) (not b!1360497) (not b!1360495) (not b!1360501) (not b!1360499))
(check-sat)
(get-model)

(declare-fun d!145537 () Bool)

(assert (=> d!145537 (= (validKeyInArray!0 (select (arr!44701 a!3742) from!3120)) (and (not (= (select (arr!44701 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44701 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360497 d!145537))

(declare-fun b!1360589 () Bool)

(declare-fun e!771850 () Bool)

(declare-fun call!65311 () Bool)

(assert (=> b!1360589 (= e!771850 call!65311)))

(declare-fun b!1360590 () Bool)

(assert (=> b!1360590 (= e!771850 call!65311)))

(declare-fun bm!65308 () Bool)

(declare-fun c!127295 () Bool)

(assert (=> bm!65308 (= call!65311 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127295 (Cons!31816 (select (arr!44701 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1360591 () Bool)

(declare-fun e!771852 () Bool)

(declare-fun e!771853 () Bool)

(assert (=> b!1360591 (= e!771852 e!771853)))

(declare-fun res!904885 () Bool)

(assert (=> b!1360591 (=> (not res!904885) (not e!771853))))

(declare-fun e!771851 () Bool)

(assert (=> b!1360591 (= res!904885 (not e!771851))))

(declare-fun res!904886 () Bool)

(assert (=> b!1360591 (=> (not res!904886) (not e!771851))))

(assert (=> b!1360591 (= res!904886 (validKeyInArray!0 (select (arr!44701 a!3742) from!3120)))))

(declare-fun b!1360592 () Bool)

(assert (=> b!1360592 (= e!771851 (contains!9440 acc!759 (select (arr!44701 a!3742) from!3120)))))

(declare-fun b!1360593 () Bool)

(assert (=> b!1360593 (= e!771853 e!771850)))

(assert (=> b!1360593 (= c!127295 (validKeyInArray!0 (select (arr!44701 a!3742) from!3120)))))

(declare-fun d!145539 () Bool)

(declare-fun res!904884 () Bool)

(assert (=> d!145539 (=> res!904884 e!771852)))

(assert (=> d!145539 (= res!904884 (bvsge from!3120 (size!45253 a!3742)))))

(assert (=> d!145539 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771852)))

(assert (= (and d!145539 (not res!904884)) b!1360591))

(assert (= (and b!1360591 res!904886) b!1360592))

(assert (= (and b!1360591 res!904885) b!1360593))

(assert (= (and b!1360593 c!127295) b!1360589))

(assert (= (and b!1360593 (not c!127295)) b!1360590))

(assert (= (or b!1360589 b!1360590) bm!65308))

(assert (=> bm!65308 m!1245305))

(declare-fun m!1245391 () Bool)

(assert (=> bm!65308 m!1245391))

(assert (=> b!1360591 m!1245305))

(assert (=> b!1360591 m!1245305))

(assert (=> b!1360591 m!1245329))

(assert (=> b!1360592 m!1245305))

(assert (=> b!1360592 m!1245305))

(declare-fun m!1245393 () Bool)

(assert (=> b!1360592 m!1245393))

(assert (=> b!1360593 m!1245305))

(assert (=> b!1360593 m!1245305))

(assert (=> b!1360593 m!1245329))

(assert (=> b!1360502 d!145539))

(declare-fun d!145541 () Bool)

(declare-fun lt!599770 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!688 (List!31820) (InoxSet (_ BitVec 64)))

(assert (=> d!145541 (= lt!599770 (select (content!688 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771858 () Bool)

(assert (=> d!145541 (= lt!599770 e!771858)))

(declare-fun res!904892 () Bool)

(assert (=> d!145541 (=> (not res!904892) (not e!771858))))

(get-info :version)

(assert (=> d!145541 (= res!904892 ((_ is Cons!31816) acc!759))))

(assert (=> d!145541 (= (contains!9440 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599770)))

(declare-fun b!1360598 () Bool)

(declare-fun e!771859 () Bool)

(assert (=> b!1360598 (= e!771858 e!771859)))

(declare-fun res!904891 () Bool)

(assert (=> b!1360598 (=> res!904891 e!771859)))

(assert (=> b!1360598 (= res!904891 (= (h!33025 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360599 () Bool)

(assert (=> b!1360599 (= e!771859 (contains!9440 (t!46488 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145541 res!904892) b!1360598))

(assert (= (and b!1360598 (not res!904891)) b!1360599))

(declare-fun m!1245395 () Bool)

(assert (=> d!145541 m!1245395))

(declare-fun m!1245397 () Bool)

(assert (=> d!145541 m!1245397))

(declare-fun m!1245399 () Bool)

(assert (=> b!1360599 m!1245399))

(assert (=> b!1360501 d!145541))

(declare-fun d!145543 () Bool)

(declare-fun lt!599771 () Bool)

(assert (=> d!145543 (= lt!599771 (select (content!688 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771860 () Bool)

(assert (=> d!145543 (= lt!599771 e!771860)))

(declare-fun res!904894 () Bool)

(assert (=> d!145543 (=> (not res!904894) (not e!771860))))

(assert (=> d!145543 (= res!904894 ((_ is Cons!31816) acc!759))))

(assert (=> d!145543 (= (contains!9440 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599771)))

(declare-fun b!1360600 () Bool)

(declare-fun e!771861 () Bool)

(assert (=> b!1360600 (= e!771860 e!771861)))

(declare-fun res!904893 () Bool)

(assert (=> b!1360600 (=> res!904893 e!771861)))

(assert (=> b!1360600 (= res!904893 (= (h!33025 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360601 () Bool)

(assert (=> b!1360601 (= e!771861 (contains!9440 (t!46488 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145543 res!904894) b!1360600))

(assert (= (and b!1360600 (not res!904893)) b!1360601))

(assert (=> d!145543 m!1245395))

(declare-fun m!1245401 () Bool)

(assert (=> d!145543 m!1245401))

(declare-fun m!1245403 () Bool)

(assert (=> b!1360601 m!1245403))

(assert (=> b!1360495 d!145543))

(declare-fun d!145545 () Bool)

(declare-fun res!904899 () Bool)

(declare-fun e!771866 () Bool)

(assert (=> d!145545 (=> res!904899 e!771866)))

(assert (=> d!145545 (= res!904899 ((_ is Nil!31817) ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120))))))

(assert (=> d!145545 (= (noDuplicate!2355 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120))) e!771866)))

(declare-fun b!1360606 () Bool)

(declare-fun e!771867 () Bool)

(assert (=> b!1360606 (= e!771866 e!771867)))

(declare-fun res!904900 () Bool)

(assert (=> b!1360606 (=> (not res!904900) (not e!771867))))

(assert (=> b!1360606 (= res!904900 (not (contains!9440 (t!46488 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120))) (h!33025 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120))))))))

(declare-fun b!1360607 () Bool)

(assert (=> b!1360607 (= e!771867 (noDuplicate!2355 (t!46488 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120)))))))

(assert (= (and d!145545 (not res!904899)) b!1360606))

(assert (= (and b!1360606 res!904900) b!1360607))

(declare-fun m!1245405 () Bool)

(assert (=> b!1360606 m!1245405))

(declare-fun m!1245407 () Bool)

(assert (=> b!1360607 m!1245407))

(assert (=> b!1360500 d!145545))

(declare-fun d!145549 () Bool)

(assert (=> d!145549 (= ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120)) (Cons!31816 (select (arr!44701 a!3742) from!3120) acc!759))))

(assert (=> b!1360500 d!145549))

(declare-fun b!1360612 () Bool)

(declare-fun e!771872 () Bool)

(declare-fun call!65312 () Bool)

(assert (=> b!1360612 (= e!771872 call!65312)))

(declare-fun b!1360613 () Bool)

(assert (=> b!1360613 (= e!771872 call!65312)))

(declare-fun bm!65309 () Bool)

(declare-fun c!127296 () Bool)

(assert (=> bm!65309 (= call!65312 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127296 (Cons!31816 (select (arr!44701 a!3742) #b00000000000000000000000000000000) Nil!31817) Nil!31817)))))

(declare-fun b!1360614 () Bool)

(declare-fun e!771874 () Bool)

(declare-fun e!771875 () Bool)

(assert (=> b!1360614 (= e!771874 e!771875)))

(declare-fun res!904906 () Bool)

(assert (=> b!1360614 (=> (not res!904906) (not e!771875))))

(declare-fun e!771873 () Bool)

(assert (=> b!1360614 (= res!904906 (not e!771873))))

(declare-fun res!904907 () Bool)

(assert (=> b!1360614 (=> (not res!904907) (not e!771873))))

(assert (=> b!1360614 (= res!904907 (validKeyInArray!0 (select (arr!44701 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360615 () Bool)

(assert (=> b!1360615 (= e!771873 (contains!9440 Nil!31817 (select (arr!44701 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360616 () Bool)

(assert (=> b!1360616 (= e!771875 e!771872)))

(assert (=> b!1360616 (= c!127296 (validKeyInArray!0 (select (arr!44701 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145551 () Bool)

(declare-fun res!904905 () Bool)

(assert (=> d!145551 (=> res!904905 e!771874)))

(assert (=> d!145551 (= res!904905 (bvsge #b00000000000000000000000000000000 (size!45253 a!3742)))))

(assert (=> d!145551 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31817) e!771874)))

(assert (= (and d!145551 (not res!904905)) b!1360614))

(assert (= (and b!1360614 res!904907) b!1360615))

(assert (= (and b!1360614 res!904906) b!1360616))

(assert (= (and b!1360616 c!127296) b!1360612))

(assert (= (and b!1360616 (not c!127296)) b!1360613))

(assert (= (or b!1360612 b!1360613) bm!65309))

(declare-fun m!1245409 () Bool)

(assert (=> bm!65309 m!1245409))

(declare-fun m!1245411 () Bool)

(assert (=> bm!65309 m!1245411))

(assert (=> b!1360614 m!1245409))

(assert (=> b!1360614 m!1245409))

(declare-fun m!1245413 () Bool)

(assert (=> b!1360614 m!1245413))

(assert (=> b!1360615 m!1245409))

(assert (=> b!1360615 m!1245409))

(declare-fun m!1245415 () Bool)

(assert (=> b!1360615 m!1245415))

(assert (=> b!1360616 m!1245409))

(assert (=> b!1360616 m!1245409))

(assert (=> b!1360616 m!1245413))

(assert (=> b!1360505 d!145551))

(declare-fun d!145553 () Bool)

(declare-fun res!904908 () Bool)

(declare-fun e!771876 () Bool)

(assert (=> d!145553 (=> res!904908 e!771876)))

(assert (=> d!145553 (= res!904908 ((_ is Nil!31817) acc!759))))

(assert (=> d!145553 (= (noDuplicate!2355 acc!759) e!771876)))

(declare-fun b!1360617 () Bool)

(declare-fun e!771877 () Bool)

(assert (=> b!1360617 (= e!771876 e!771877)))

(declare-fun res!904909 () Bool)

(assert (=> b!1360617 (=> (not res!904909) (not e!771877))))

(assert (=> b!1360617 (= res!904909 (not (contains!9440 (t!46488 acc!759) (h!33025 acc!759))))))

(declare-fun b!1360618 () Bool)

(assert (=> b!1360618 (= e!771877 (noDuplicate!2355 (t!46488 acc!759)))))

(assert (= (and d!145553 (not res!904908)) b!1360617))

(assert (= (and b!1360617 res!904909) b!1360618))

(declare-fun m!1245417 () Bool)

(assert (=> b!1360617 m!1245417))

(declare-fun m!1245419 () Bool)

(assert (=> b!1360618 m!1245419))

(assert (=> b!1360499 d!145553))

(declare-fun d!145555 () Bool)

(assert (=> d!145555 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360504 d!145555))

(declare-fun d!145557 () Bool)

(assert (=> d!145557 (= (array_inv!33934 a!3742) (bvsge (size!45253 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114686 d!145557))

(declare-fun d!145561 () Bool)

(assert (=> d!145561 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599777 () Unit!44679)

(declare-fun choose!80 (array!92523 List!31820 List!31820 (_ BitVec 32)) Unit!44679)

(assert (=> d!145561 (= lt!599777 (choose!80 a!3742 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145561 (bvslt (size!45253 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145561 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!883 acc!759 (select (arr!44701 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599777)))

(declare-fun bs!38991 () Bool)

(assert (= bs!38991 d!145561))

(assert (=> bs!38991 m!1245311))

(assert (=> bs!38991 m!1245307))

(declare-fun m!1245427 () Bool)

(assert (=> bs!38991 m!1245427))

(assert (=> b!1360503 d!145561))

(declare-fun b!1360635 () Bool)

(declare-fun e!771897 () Bool)

(declare-fun e!771895 () Bool)

(assert (=> b!1360635 (= e!771897 e!771895)))

(declare-fun res!904927 () Bool)

(assert (=> b!1360635 (=> (not res!904927) (not e!771895))))

(assert (=> b!1360635 (= res!904927 ((_ is Cons!31816) acc!759))))

(declare-fun b!1360638 () Bool)

(declare-fun e!771896 () Bool)

(assert (=> b!1360638 (= e!771896 (subseq!878 acc!759 (t!46488 acc!759)))))

(declare-fun b!1360636 () Bool)

(assert (=> b!1360636 (= e!771895 e!771896)))

(declare-fun res!904929 () Bool)

(assert (=> b!1360636 (=> res!904929 e!771896)))

(declare-fun e!771894 () Bool)

(assert (=> b!1360636 (= res!904929 e!771894)))

(declare-fun res!904926 () Bool)

(assert (=> b!1360636 (=> (not res!904926) (not e!771894))))

(assert (=> b!1360636 (= res!904926 (= (h!33025 acc!759) (h!33025 acc!759)))))

(declare-fun b!1360637 () Bool)

(assert (=> b!1360637 (= e!771894 (subseq!878 (t!46488 acc!759) (t!46488 acc!759)))))

(declare-fun d!145569 () Bool)

(declare-fun res!904928 () Bool)

(assert (=> d!145569 (=> res!904928 e!771897)))

(assert (=> d!145569 (= res!904928 ((_ is Nil!31817) acc!759))))

(assert (=> d!145569 (= (subseq!878 acc!759 acc!759) e!771897)))

(assert (= (and d!145569 (not res!904928)) b!1360635))

(assert (= (and b!1360635 res!904927) b!1360636))

(assert (= (and b!1360636 res!904926) b!1360637))

(assert (= (and b!1360636 (not res!904929)) b!1360638))

(declare-fun m!1245433 () Bool)

(assert (=> b!1360638 m!1245433))

(declare-fun m!1245435 () Bool)

(assert (=> b!1360637 m!1245435))

(assert (=> b!1360503 d!145569))

(declare-fun b!1360641 () Bool)

(declare-fun e!771900 () Bool)

(declare-fun call!65313 () Bool)

(assert (=> b!1360641 (= e!771900 call!65313)))

(declare-fun b!1360642 () Bool)

(assert (=> b!1360642 (= e!771900 call!65313)))

(declare-fun c!127297 () Bool)

(declare-fun bm!65310 () Bool)

(assert (=> bm!65310 (= call!65313 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127297 (Cons!31816 (select (arr!44701 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1360643 () Bool)

(declare-fun e!771902 () Bool)

(declare-fun e!771903 () Bool)

(assert (=> b!1360643 (= e!771902 e!771903)))

(declare-fun res!904933 () Bool)

(assert (=> b!1360643 (=> (not res!904933) (not e!771903))))

(declare-fun e!771901 () Bool)

(assert (=> b!1360643 (= res!904933 (not e!771901))))

(declare-fun res!904934 () Bool)

(assert (=> b!1360643 (=> (not res!904934) (not e!771901))))

(assert (=> b!1360643 (= res!904934 (validKeyInArray!0 (select (arr!44701 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360644 () Bool)

(assert (=> b!1360644 (= e!771901 (contains!9440 acc!759 (select (arr!44701 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360645 () Bool)

(assert (=> b!1360645 (= e!771903 e!771900)))

(assert (=> b!1360645 (= c!127297 (validKeyInArray!0 (select (arr!44701 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145575 () Bool)

(declare-fun res!904932 () Bool)

(assert (=> d!145575 (=> res!904932 e!771902)))

(assert (=> d!145575 (= res!904932 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45253 a!3742)))))

(assert (=> d!145575 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771902)))

(assert (= (and d!145575 (not res!904932)) b!1360643))

(assert (= (and b!1360643 res!904934) b!1360644))

(assert (= (and b!1360643 res!904933) b!1360645))

(assert (= (and b!1360645 c!127297) b!1360641))

(assert (= (and b!1360645 (not c!127297)) b!1360642))

(assert (= (or b!1360641 b!1360642) bm!65310))

(declare-fun m!1245437 () Bool)

(assert (=> bm!65310 m!1245437))

(declare-fun m!1245439 () Bool)

(assert (=> bm!65310 m!1245439))

(assert (=> b!1360643 m!1245437))

(assert (=> b!1360643 m!1245437))

(declare-fun m!1245441 () Bool)

(assert (=> b!1360643 m!1245441))

(assert (=> b!1360644 m!1245437))

(assert (=> b!1360644 m!1245437))

(declare-fun m!1245443 () Bool)

(assert (=> b!1360644 m!1245443))

(assert (=> b!1360645 m!1245437))

(assert (=> b!1360645 m!1245437))

(assert (=> b!1360645 m!1245441))

(assert (=> b!1360503 d!145575))

(assert (=> b!1360503 d!145549))

(declare-fun d!145577 () Bool)

(assert (=> d!145577 (subseq!878 acc!759 acc!759)))

(declare-fun lt!599780 () Unit!44679)

(declare-fun choose!36 (List!31820) Unit!44679)

(assert (=> d!145577 (= lt!599780 (choose!36 acc!759))))

(assert (=> d!145577 (= (lemmaListSubSeqRefl!0 acc!759) lt!599780)))

(declare-fun bs!38992 () Bool)

(assert (= bs!38992 d!145577))

(assert (=> bs!38992 m!1245313))

(declare-fun m!1245445 () Bool)

(assert (=> bs!38992 m!1245445))

(assert (=> b!1360503 d!145577))

(check-sat (not d!145543) (not b!1360617) (not b!1360616) (not b!1360644) (not d!145577) (not b!1360615) (not bm!65309) (not b!1360643) (not b!1360593) (not b!1360637) (not b!1360599) (not b!1360618) (not b!1360601) (not d!145541) (not b!1360591) (not b!1360645) (not bm!65310) (not b!1360606) (not b!1360607) (not d!145561) (not bm!65308) (not b!1360638) (not b!1360614) (not b!1360592))
(check-sat)
