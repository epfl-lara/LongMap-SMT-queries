; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115492 () Bool)

(assert start!115492)

(declare-fun b!1366427 () Bool)

(declare-fun e!774436 () Bool)

(declare-datatypes ((List!31903 0))(
  ( (Nil!31900) (Cons!31899 (h!33108 (_ BitVec 64)) (t!46597 List!31903)) )
))
(declare-fun lt!601566 () List!31903)

(declare-fun noDuplicate!2442 (List!31903) Bool)

(assert (=> b!1366427 (= e!774436 (noDuplicate!2442 lt!601566))))

(declare-fun b!1366428 () Bool)

(declare-fun res!910001 () Bool)

(declare-fun e!774439 () Bool)

(assert (=> b!1366428 (=> (not res!910001) (not e!774439))))

(declare-fun newAcc!98 () List!31903)

(declare-fun contains!9585 (List!31903 (_ BitVec 64)) Bool)

(assert (=> b!1366428 (= res!910001 (not (contains!9585 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366429 () Bool)

(declare-fun res!910009 () Bool)

(assert (=> b!1366429 (=> (not res!910009) (not e!774439))))

(declare-fun acc!866 () List!31903)

(assert (=> b!1366429 (= res!910009 (noDuplicate!2442 acc!866))))

(declare-fun b!1366430 () Bool)

(declare-fun res!910008 () Bool)

(assert (=> b!1366430 (=> (not res!910008) (not e!774439))))

(assert (=> b!1366430 (= res!910008 (not (contains!9585 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910011 () Bool)

(assert (=> start!115492 (=> (not res!910011) (not e!774439))))

(declare-datatypes ((array!92813 0))(
  ( (array!92814 (arr!44835 (Array (_ BitVec 32) (_ BitVec 64))) (size!45385 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92813)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115492 (= res!910011 (and (bvslt (size!45385 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45385 a!3861))))))

(assert (=> start!115492 e!774439))

(declare-fun array_inv!33863 (array!92813) Bool)

(assert (=> start!115492 (array_inv!33863 a!3861)))

(assert (=> start!115492 true))

(declare-fun b!1366431 () Bool)

(declare-fun res!910006 () Bool)

(declare-fun e!774437 () Bool)

(assert (=> b!1366431 (=> (not res!910006) (not e!774437))))

(assert (=> b!1366431 (= res!910006 (bvslt from!3239 (size!45385 a!3861)))))

(declare-fun b!1366432 () Bool)

(assert (=> b!1366432 (= e!774437 (not e!774436))))

(declare-fun res!910004 () Bool)

(assert (=> b!1366432 (=> (not res!910004) (not e!774436))))

(declare-fun lt!601564 () List!31903)

(declare-fun subseq!987 (List!31903 List!31903) Bool)

(assert (=> b!1366432 (= res!910004 (subseq!987 lt!601564 lt!601566))))

(declare-fun arrayNoDuplicates!0 (array!92813 (_ BitVec 32) List!31903) Bool)

(assert (=> b!1366432 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601564)))

(declare-datatypes ((Unit!45107 0))(
  ( (Unit!45108) )
))
(declare-fun lt!601565 () Unit!45107)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92813 List!31903 List!31903 (_ BitVec 32)) Unit!45107)

(assert (=> b!1366432 (= lt!601565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601566 lt!601564 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366432 (= lt!601564 (Cons!31899 (select (arr!44835 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366432 (= lt!601566 (Cons!31899 (select (arr!44835 a!3861) from!3239) acc!866))))

(declare-fun b!1366433 () Bool)

(declare-fun res!910012 () Bool)

(assert (=> b!1366433 (=> (not res!910012) (not e!774439))))

(assert (=> b!1366433 (= res!910012 (not (contains!9585 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366434 () Bool)

(assert (=> b!1366434 (= e!774439 e!774437)))

(declare-fun res!910002 () Bool)

(assert (=> b!1366434 (=> (not res!910002) (not e!774437))))

(assert (=> b!1366434 (= res!910002 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601567 () Unit!45107)

(declare-fun noDuplicateSubseq!174 (List!31903 List!31903) Unit!45107)

(assert (=> b!1366434 (= lt!601567 (noDuplicateSubseq!174 newAcc!98 acc!866))))

(declare-fun b!1366435 () Bool)

(declare-fun res!910005 () Bool)

(assert (=> b!1366435 (=> (not res!910005) (not e!774439))))

(assert (=> b!1366435 (= res!910005 (subseq!987 newAcc!98 acc!866))))

(declare-fun b!1366436 () Bool)

(declare-fun res!910003 () Bool)

(assert (=> b!1366436 (=> (not res!910003) (not e!774437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366436 (= res!910003 (validKeyInArray!0 (select (arr!44835 a!3861) from!3239)))))

(declare-fun b!1366437 () Bool)

(declare-fun res!910010 () Bool)

(assert (=> b!1366437 (=> (not res!910010) (not e!774437))))

(assert (=> b!1366437 (= res!910010 (not (contains!9585 acc!866 (select (arr!44835 a!3861) from!3239))))))

(declare-fun b!1366438 () Bool)

(declare-fun res!910007 () Bool)

(assert (=> b!1366438 (=> (not res!910007) (not e!774439))))

(assert (=> b!1366438 (= res!910007 (not (contains!9585 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115492 res!910011) b!1366429))

(assert (= (and b!1366429 res!910009) b!1366438))

(assert (= (and b!1366438 res!910007) b!1366433))

(assert (= (and b!1366433 res!910012) b!1366428))

(assert (= (and b!1366428 res!910001) b!1366430))

(assert (= (and b!1366430 res!910008) b!1366435))

(assert (= (and b!1366435 res!910005) b!1366434))

(assert (= (and b!1366434 res!910002) b!1366431))

(assert (= (and b!1366431 res!910006) b!1366436))

(assert (= (and b!1366436 res!910003) b!1366437))

(assert (= (and b!1366437 res!910010) b!1366432))

(assert (= (and b!1366432 res!910004) b!1366427))

(declare-fun m!1250733 () Bool)

(assert (=> b!1366429 m!1250733))

(declare-fun m!1250735 () Bool)

(assert (=> b!1366428 m!1250735))

(declare-fun m!1250737 () Bool)

(assert (=> b!1366432 m!1250737))

(declare-fun m!1250739 () Bool)

(assert (=> b!1366432 m!1250739))

(declare-fun m!1250741 () Bool)

(assert (=> b!1366432 m!1250741))

(declare-fun m!1250743 () Bool)

(assert (=> b!1366432 m!1250743))

(declare-fun m!1250745 () Bool)

(assert (=> b!1366438 m!1250745))

(assert (=> b!1366437 m!1250743))

(assert (=> b!1366437 m!1250743))

(declare-fun m!1250747 () Bool)

(assert (=> b!1366437 m!1250747))

(declare-fun m!1250749 () Bool)

(assert (=> b!1366435 m!1250749))

(declare-fun m!1250751 () Bool)

(assert (=> b!1366434 m!1250751))

(declare-fun m!1250753 () Bool)

(assert (=> b!1366434 m!1250753))

(declare-fun m!1250755 () Bool)

(assert (=> start!115492 m!1250755))

(declare-fun m!1250757 () Bool)

(assert (=> b!1366433 m!1250757))

(assert (=> b!1366436 m!1250743))

(assert (=> b!1366436 m!1250743))

(declare-fun m!1250759 () Bool)

(assert (=> b!1366436 m!1250759))

(declare-fun m!1250761 () Bool)

(assert (=> b!1366430 m!1250761))

(declare-fun m!1250763 () Bool)

(assert (=> b!1366427 m!1250763))

(check-sat (not b!1366429) (not b!1366433) (not b!1366436) (not b!1366427) (not b!1366435) (not b!1366430) (not b!1366437) (not b!1366434) (not b!1366432) (not b!1366438) (not start!115492) (not b!1366428))
(check-sat)
(get-model)

(declare-fun d!146625 () Bool)

(assert (=> d!146625 (= (validKeyInArray!0 (select (arr!44835 a!3861) from!3239)) (and (not (= (select (arr!44835 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44835 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1366436 d!146625))

(declare-fun d!146627 () Bool)

(declare-fun lt!601582 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!711 (List!31903) (InoxSet (_ BitVec 64)))

(assert (=> d!146627 (= lt!601582 (select (content!711 acc!866) (select (arr!44835 a!3861) from!3239)))))

(declare-fun e!774457 () Bool)

(assert (=> d!146627 (= lt!601582 e!774457)))

(declare-fun res!910054 () Bool)

(assert (=> d!146627 (=> (not res!910054) (not e!774457))))

(get-info :version)

(assert (=> d!146627 (= res!910054 ((_ is Cons!31899) acc!866))))

(assert (=> d!146627 (= (contains!9585 acc!866 (select (arr!44835 a!3861) from!3239)) lt!601582)))

(declare-fun b!1366479 () Bool)

(declare-fun e!774456 () Bool)

(assert (=> b!1366479 (= e!774457 e!774456)))

(declare-fun res!910053 () Bool)

(assert (=> b!1366479 (=> res!910053 e!774456)))

(assert (=> b!1366479 (= res!910053 (= (h!33108 acc!866) (select (arr!44835 a!3861) from!3239)))))

(declare-fun b!1366480 () Bool)

(assert (=> b!1366480 (= e!774456 (contains!9585 (t!46597 acc!866) (select (arr!44835 a!3861) from!3239)))))

(assert (= (and d!146627 res!910054) b!1366479))

(assert (= (and b!1366479 (not res!910053)) b!1366480))

(declare-fun m!1250797 () Bool)

(assert (=> d!146627 m!1250797))

(assert (=> d!146627 m!1250743))

(declare-fun m!1250799 () Bool)

(assert (=> d!146627 m!1250799))

(assert (=> b!1366480 m!1250743))

(declare-fun m!1250801 () Bool)

(assert (=> b!1366480 m!1250801))

(assert (=> b!1366437 d!146627))

(declare-fun d!146629 () Bool)

(assert (=> d!146629 (= (array_inv!33863 a!3861) (bvsge (size!45385 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115492 d!146629))

(declare-fun d!146631 () Bool)

(declare-fun lt!601583 () Bool)

(assert (=> d!146631 (= lt!601583 (select (content!711 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774459 () Bool)

(assert (=> d!146631 (= lt!601583 e!774459)))

(declare-fun res!910056 () Bool)

(assert (=> d!146631 (=> (not res!910056) (not e!774459))))

(assert (=> d!146631 (= res!910056 ((_ is Cons!31899) acc!866))))

(assert (=> d!146631 (= (contains!9585 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601583)))

(declare-fun b!1366481 () Bool)

(declare-fun e!774458 () Bool)

(assert (=> b!1366481 (= e!774459 e!774458)))

(declare-fun res!910055 () Bool)

(assert (=> b!1366481 (=> res!910055 e!774458)))

(assert (=> b!1366481 (= res!910055 (= (h!33108 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366482 () Bool)

(assert (=> b!1366482 (= e!774458 (contains!9585 (t!46597 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146631 res!910056) b!1366481))

(assert (= (and b!1366481 (not res!910055)) b!1366482))

(assert (=> d!146631 m!1250797))

(declare-fun m!1250803 () Bool)

(assert (=> d!146631 m!1250803))

(declare-fun m!1250805 () Bool)

(assert (=> b!1366482 m!1250805))

(assert (=> b!1366438 d!146631))

(declare-fun d!146633 () Bool)

(declare-fun res!910061 () Bool)

(declare-fun e!774464 () Bool)

(assert (=> d!146633 (=> res!910061 e!774464)))

(assert (=> d!146633 (= res!910061 ((_ is Nil!31900) lt!601566))))

(assert (=> d!146633 (= (noDuplicate!2442 lt!601566) e!774464)))

(declare-fun b!1366487 () Bool)

(declare-fun e!774465 () Bool)

(assert (=> b!1366487 (= e!774464 e!774465)))

(declare-fun res!910062 () Bool)

(assert (=> b!1366487 (=> (not res!910062) (not e!774465))))

(assert (=> b!1366487 (= res!910062 (not (contains!9585 (t!46597 lt!601566) (h!33108 lt!601566))))))

(declare-fun b!1366488 () Bool)

(assert (=> b!1366488 (= e!774465 (noDuplicate!2442 (t!46597 lt!601566)))))

(assert (= (and d!146633 (not res!910061)) b!1366487))

(assert (= (and b!1366487 res!910062) b!1366488))

(declare-fun m!1250807 () Bool)

(assert (=> b!1366487 m!1250807))

(declare-fun m!1250809 () Bool)

(assert (=> b!1366488 m!1250809))

(assert (=> b!1366427 d!146633))

(declare-fun d!146639 () Bool)

(declare-fun lt!601584 () Bool)

(assert (=> d!146639 (= lt!601584 (select (content!711 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774467 () Bool)

(assert (=> d!146639 (= lt!601584 e!774467)))

(declare-fun res!910064 () Bool)

(assert (=> d!146639 (=> (not res!910064) (not e!774467))))

(assert (=> d!146639 (= res!910064 ((_ is Cons!31899) acc!866))))

(assert (=> d!146639 (= (contains!9585 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601584)))

(declare-fun b!1366489 () Bool)

(declare-fun e!774466 () Bool)

(assert (=> b!1366489 (= e!774467 e!774466)))

(declare-fun res!910063 () Bool)

(assert (=> b!1366489 (=> res!910063 e!774466)))

(assert (=> b!1366489 (= res!910063 (= (h!33108 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366490 () Bool)

(assert (=> b!1366490 (= e!774466 (contains!9585 (t!46597 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146639 res!910064) b!1366489))

(assert (= (and b!1366489 (not res!910063)) b!1366490))

(assert (=> d!146639 m!1250797))

(declare-fun m!1250811 () Bool)

(assert (=> d!146639 m!1250811))

(declare-fun m!1250813 () Bool)

(assert (=> b!1366490 m!1250813))

(assert (=> b!1366433 d!146639))

(declare-fun b!1366533 () Bool)

(declare-fun e!774511 () Bool)

(declare-fun call!65462 () Bool)

(assert (=> b!1366533 (= e!774511 call!65462)))

(declare-fun c!127655 () Bool)

(declare-fun bm!65459 () Bool)

(assert (=> bm!65459 (= call!65462 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127655 (Cons!31899 (select (arr!44835 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1366534 () Bool)

(declare-fun e!774509 () Bool)

(assert (=> b!1366534 (= e!774509 e!774511)))

(assert (=> b!1366534 (= c!127655 (validKeyInArray!0 (select (arr!44835 a!3861) from!3239)))))

(declare-fun e!774508 () Bool)

(declare-fun b!1366535 () Bool)

(assert (=> b!1366535 (= e!774508 (contains!9585 acc!866 (select (arr!44835 a!3861) from!3239)))))

(declare-fun d!146641 () Bool)

(declare-fun res!910103 () Bool)

(declare-fun e!774510 () Bool)

(assert (=> d!146641 (=> res!910103 e!774510)))

(assert (=> d!146641 (= res!910103 (bvsge from!3239 (size!45385 a!3861)))))

(assert (=> d!146641 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774510)))

(declare-fun b!1366536 () Bool)

(assert (=> b!1366536 (= e!774510 e!774509)))

(declare-fun res!910104 () Bool)

(assert (=> b!1366536 (=> (not res!910104) (not e!774509))))

(assert (=> b!1366536 (= res!910104 (not e!774508))))

(declare-fun res!910105 () Bool)

(assert (=> b!1366536 (=> (not res!910105) (not e!774508))))

(assert (=> b!1366536 (= res!910105 (validKeyInArray!0 (select (arr!44835 a!3861) from!3239)))))

(declare-fun b!1366537 () Bool)

(assert (=> b!1366537 (= e!774511 call!65462)))

(assert (= (and d!146641 (not res!910103)) b!1366536))

(assert (= (and b!1366536 res!910105) b!1366535))

(assert (= (and b!1366536 res!910104) b!1366534))

(assert (= (and b!1366534 c!127655) b!1366533))

(assert (= (and b!1366534 (not c!127655)) b!1366537))

(assert (= (or b!1366533 b!1366537) bm!65459))

(assert (=> bm!65459 m!1250743))

(declare-fun m!1250839 () Bool)

(assert (=> bm!65459 m!1250839))

(assert (=> b!1366534 m!1250743))

(assert (=> b!1366534 m!1250743))

(assert (=> b!1366534 m!1250759))

(assert (=> b!1366535 m!1250743))

(assert (=> b!1366535 m!1250743))

(assert (=> b!1366535 m!1250747))

(assert (=> b!1366536 m!1250743))

(assert (=> b!1366536 m!1250743))

(assert (=> b!1366536 m!1250759))

(assert (=> b!1366434 d!146641))

(declare-fun d!146655 () Bool)

(assert (=> d!146655 (noDuplicate!2442 newAcc!98)))

(declare-fun lt!601593 () Unit!45107)

(declare-fun choose!1991 (List!31903 List!31903) Unit!45107)

(assert (=> d!146655 (= lt!601593 (choose!1991 newAcc!98 acc!866))))

(declare-fun e!774534 () Bool)

(assert (=> d!146655 e!774534))

(declare-fun res!910126 () Bool)

(assert (=> d!146655 (=> (not res!910126) (not e!774534))))

(assert (=> d!146655 (= res!910126 (subseq!987 newAcc!98 acc!866))))

(assert (=> d!146655 (= (noDuplicateSubseq!174 newAcc!98 acc!866) lt!601593)))

(declare-fun b!1366562 () Bool)

(assert (=> b!1366562 (= e!774534 (noDuplicate!2442 acc!866))))

(assert (= (and d!146655 res!910126) b!1366562))

(declare-fun m!1250845 () Bool)

(assert (=> d!146655 m!1250845))

(declare-fun m!1250847 () Bool)

(assert (=> d!146655 m!1250847))

(assert (=> d!146655 m!1250749))

(assert (=> b!1366562 m!1250733))

(assert (=> b!1366434 d!146655))

(declare-fun b!1366588 () Bool)

(declare-fun e!774555 () Bool)

(assert (=> b!1366588 (= e!774555 (subseq!987 (t!46597 newAcc!98) (t!46597 acc!866)))))

(declare-fun b!1366587 () Bool)

(declare-fun e!774558 () Bool)

(declare-fun e!774556 () Bool)

(assert (=> b!1366587 (= e!774558 e!774556)))

(declare-fun res!910145 () Bool)

(assert (=> b!1366587 (=> res!910145 e!774556)))

(assert (=> b!1366587 (= res!910145 e!774555)))

(declare-fun res!910147 () Bool)

(assert (=> b!1366587 (=> (not res!910147) (not e!774555))))

(assert (=> b!1366587 (= res!910147 (= (h!33108 newAcc!98) (h!33108 acc!866)))))

(declare-fun b!1366586 () Bool)

(declare-fun e!774557 () Bool)

(assert (=> b!1366586 (= e!774557 e!774558)))

(declare-fun res!910144 () Bool)

(assert (=> b!1366586 (=> (not res!910144) (not e!774558))))

(assert (=> b!1366586 (= res!910144 ((_ is Cons!31899) acc!866))))

(declare-fun d!146659 () Bool)

(declare-fun res!910146 () Bool)

(assert (=> d!146659 (=> res!910146 e!774557)))

(assert (=> d!146659 (= res!910146 ((_ is Nil!31900) newAcc!98))))

(assert (=> d!146659 (= (subseq!987 newAcc!98 acc!866) e!774557)))

(declare-fun b!1366589 () Bool)

(assert (=> b!1366589 (= e!774556 (subseq!987 newAcc!98 (t!46597 acc!866)))))

(assert (= (and d!146659 (not res!910146)) b!1366586))

(assert (= (and b!1366586 res!910144) b!1366587))

(assert (= (and b!1366587 res!910147) b!1366588))

(assert (= (and b!1366587 (not res!910145)) b!1366589))

(declare-fun m!1250857 () Bool)

(assert (=> b!1366588 m!1250857))

(declare-fun m!1250859 () Bool)

(assert (=> b!1366589 m!1250859))

(assert (=> b!1366435 d!146659))

(declare-fun b!1366592 () Bool)

(declare-fun e!774559 () Bool)

(assert (=> b!1366592 (= e!774559 (subseq!987 (t!46597 lt!601564) (t!46597 lt!601566)))))

(declare-fun b!1366591 () Bool)

(declare-fun e!774562 () Bool)

(declare-fun e!774560 () Bool)

(assert (=> b!1366591 (= e!774562 e!774560)))

(declare-fun res!910149 () Bool)

(assert (=> b!1366591 (=> res!910149 e!774560)))

(assert (=> b!1366591 (= res!910149 e!774559)))

(declare-fun res!910151 () Bool)

(assert (=> b!1366591 (=> (not res!910151) (not e!774559))))

(assert (=> b!1366591 (= res!910151 (= (h!33108 lt!601564) (h!33108 lt!601566)))))

(declare-fun b!1366590 () Bool)

(declare-fun e!774561 () Bool)

(assert (=> b!1366590 (= e!774561 e!774562)))

(declare-fun res!910148 () Bool)

(assert (=> b!1366590 (=> (not res!910148) (not e!774562))))

(assert (=> b!1366590 (= res!910148 ((_ is Cons!31899) lt!601566))))

(declare-fun d!146663 () Bool)

(declare-fun res!910150 () Bool)

(assert (=> d!146663 (=> res!910150 e!774561)))

(assert (=> d!146663 (= res!910150 ((_ is Nil!31900) lt!601564))))

(assert (=> d!146663 (= (subseq!987 lt!601564 lt!601566) e!774561)))

(declare-fun b!1366593 () Bool)

(assert (=> b!1366593 (= e!774560 (subseq!987 lt!601564 (t!46597 lt!601566)))))

(assert (= (and d!146663 (not res!910150)) b!1366590))

(assert (= (and b!1366590 res!910148) b!1366591))

(assert (= (and b!1366591 res!910151) b!1366592))

(assert (= (and b!1366591 (not res!910149)) b!1366593))

(declare-fun m!1250861 () Bool)

(assert (=> b!1366592 m!1250861))

(declare-fun m!1250863 () Bool)

(assert (=> b!1366593 m!1250863))

(assert (=> b!1366432 d!146663))

(declare-fun b!1366594 () Bool)

(declare-fun e!774566 () Bool)

(declare-fun call!65468 () Bool)

(assert (=> b!1366594 (= e!774566 call!65468)))

(declare-fun bm!65465 () Bool)

(declare-fun c!127661 () Bool)

(assert (=> bm!65465 (= call!65468 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127661 (Cons!31899 (select (arr!44835 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601564) lt!601564)))))

(declare-fun b!1366595 () Bool)

(declare-fun e!774564 () Bool)

(assert (=> b!1366595 (= e!774564 e!774566)))

(assert (=> b!1366595 (= c!127661 (validKeyInArray!0 (select (arr!44835 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun e!774563 () Bool)

(declare-fun b!1366596 () Bool)

(assert (=> b!1366596 (= e!774563 (contains!9585 lt!601564 (select (arr!44835 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!146665 () Bool)

(declare-fun res!910152 () Bool)

(declare-fun e!774565 () Bool)

(assert (=> d!146665 (=> res!910152 e!774565)))

(assert (=> d!146665 (= res!910152 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45385 a!3861)))))

(assert (=> d!146665 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601564) e!774565)))

(declare-fun b!1366597 () Bool)

(assert (=> b!1366597 (= e!774565 e!774564)))

(declare-fun res!910153 () Bool)

(assert (=> b!1366597 (=> (not res!910153) (not e!774564))))

(assert (=> b!1366597 (= res!910153 (not e!774563))))

(declare-fun res!910154 () Bool)

(assert (=> b!1366597 (=> (not res!910154) (not e!774563))))

(assert (=> b!1366597 (= res!910154 (validKeyInArray!0 (select (arr!44835 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1366598 () Bool)

(assert (=> b!1366598 (= e!774566 call!65468)))

(assert (= (and d!146665 (not res!910152)) b!1366597))

(assert (= (and b!1366597 res!910154) b!1366596))

(assert (= (and b!1366597 res!910153) b!1366595))

(assert (= (and b!1366595 c!127661) b!1366594))

(assert (= (and b!1366595 (not c!127661)) b!1366598))

(assert (= (or b!1366594 b!1366598) bm!65465))

(declare-fun m!1250865 () Bool)

(assert (=> bm!65465 m!1250865))

(declare-fun m!1250867 () Bool)

(assert (=> bm!65465 m!1250867))

(assert (=> b!1366595 m!1250865))

(assert (=> b!1366595 m!1250865))

(declare-fun m!1250869 () Bool)

(assert (=> b!1366595 m!1250869))

(assert (=> b!1366596 m!1250865))

(assert (=> b!1366596 m!1250865))

(declare-fun m!1250873 () Bool)

(assert (=> b!1366596 m!1250873))

(assert (=> b!1366597 m!1250865))

(assert (=> b!1366597 m!1250865))

(assert (=> b!1366597 m!1250869))

(assert (=> b!1366432 d!146665))

(declare-fun d!146669 () Bool)

(assert (=> d!146669 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601564)))

(declare-fun lt!601599 () Unit!45107)

(declare-fun choose!80 (array!92813 List!31903 List!31903 (_ BitVec 32)) Unit!45107)

(assert (=> d!146669 (= lt!601599 (choose!80 a!3861 lt!601566 lt!601564 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146669 (bvslt (size!45385 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146669 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601566 lt!601564 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601599)))

(declare-fun bs!39205 () Bool)

(assert (= bs!39205 d!146669))

(assert (=> bs!39205 m!1250739))

(declare-fun m!1250881 () Bool)

(assert (=> bs!39205 m!1250881))

(assert (=> b!1366432 d!146669))

(declare-fun d!146675 () Bool)

(declare-fun lt!601601 () Bool)

(assert (=> d!146675 (= lt!601601 (select (content!711 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774580 () Bool)

(assert (=> d!146675 (= lt!601601 e!774580)))

(declare-fun res!910167 () Bool)

(assert (=> d!146675 (=> (not res!910167) (not e!774580))))

(assert (=> d!146675 (= res!910167 ((_ is Cons!31899) newAcc!98))))

(assert (=> d!146675 (= (contains!9585 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601601)))

(declare-fun b!1366612 () Bool)

(declare-fun e!774579 () Bool)

(assert (=> b!1366612 (= e!774580 e!774579)))

(declare-fun res!910166 () Bool)

(assert (=> b!1366612 (=> res!910166 e!774579)))

(assert (=> b!1366612 (= res!910166 (= (h!33108 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366613 () Bool)

(assert (=> b!1366613 (= e!774579 (contains!9585 (t!46597 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146675 res!910167) b!1366612))

(assert (= (and b!1366612 (not res!910166)) b!1366613))

(declare-fun m!1250887 () Bool)

(assert (=> d!146675 m!1250887))

(declare-fun m!1250889 () Bool)

(assert (=> d!146675 m!1250889))

(declare-fun m!1250891 () Bool)

(assert (=> b!1366613 m!1250891))

(assert (=> b!1366428 d!146675))

(declare-fun d!146679 () Bool)

(declare-fun res!910170 () Bool)

(declare-fun e!774583 () Bool)

(assert (=> d!146679 (=> res!910170 e!774583)))

(assert (=> d!146679 (= res!910170 ((_ is Nil!31900) acc!866))))

(assert (=> d!146679 (= (noDuplicate!2442 acc!866) e!774583)))

(declare-fun b!1366616 () Bool)

(declare-fun e!774584 () Bool)

(assert (=> b!1366616 (= e!774583 e!774584)))

(declare-fun res!910171 () Bool)

(assert (=> b!1366616 (=> (not res!910171) (not e!774584))))

(assert (=> b!1366616 (= res!910171 (not (contains!9585 (t!46597 acc!866) (h!33108 acc!866))))))

(declare-fun b!1366617 () Bool)

(assert (=> b!1366617 (= e!774584 (noDuplicate!2442 (t!46597 acc!866)))))

(assert (= (and d!146679 (not res!910170)) b!1366616))

(assert (= (and b!1366616 res!910171) b!1366617))

(declare-fun m!1250893 () Bool)

(assert (=> b!1366616 m!1250893))

(declare-fun m!1250895 () Bool)

(assert (=> b!1366617 m!1250895))

(assert (=> b!1366429 d!146679))

(declare-fun d!146683 () Bool)

(declare-fun lt!601604 () Bool)

(assert (=> d!146683 (= lt!601604 (select (content!711 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774590 () Bool)

(assert (=> d!146683 (= lt!601604 e!774590)))

(declare-fun res!910176 () Bool)

(assert (=> d!146683 (=> (not res!910176) (not e!774590))))

(assert (=> d!146683 (= res!910176 ((_ is Cons!31899) newAcc!98))))

(assert (=> d!146683 (= (contains!9585 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601604)))

(declare-fun b!1366623 () Bool)

(declare-fun e!774589 () Bool)

(assert (=> b!1366623 (= e!774590 e!774589)))

(declare-fun res!910175 () Bool)

(assert (=> b!1366623 (=> res!910175 e!774589)))

(assert (=> b!1366623 (= res!910175 (= (h!33108 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366624 () Bool)

(assert (=> b!1366624 (= e!774589 (contains!9585 (t!46597 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146683 res!910176) b!1366623))

(assert (= (and b!1366623 (not res!910175)) b!1366624))

(assert (=> d!146683 m!1250887))

(declare-fun m!1250897 () Bool)

(assert (=> d!146683 m!1250897))

(declare-fun m!1250899 () Bool)

(assert (=> b!1366624 m!1250899))

(assert (=> b!1366430 d!146683))

(check-sat (not bm!65465) (not b!1366593) (not bm!65459) (not b!1366480) (not b!1366488) (not b!1366482) (not b!1366597) (not d!146639) (not b!1366616) (not b!1366536) (not b!1366562) (not d!146675) (not b!1366596) (not b!1366589) (not b!1366613) (not b!1366588) (not d!146631) (not b!1366534) (not d!146655) (not d!146669) (not d!146683) (not b!1366592) (not b!1366490) (not b!1366595) (not b!1366487) (not b!1366617) (not b!1366624) (not b!1366535) (not d!146627))
(check-sat)
