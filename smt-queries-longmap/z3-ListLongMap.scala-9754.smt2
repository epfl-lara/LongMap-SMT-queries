; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115546 () Bool)

(assert start!115546)

(declare-fun b!1366806 () Bool)

(declare-fun res!910406 () Bool)

(declare-fun e!774649 () Bool)

(assert (=> b!1366806 (=> (not res!910406) (not e!774649))))

(declare-datatypes ((List!31964 0))(
  ( (Nil!31961) (Cons!31960 (h!33169 (_ BitVec 64)) (t!46650 List!31964)) )
))
(declare-fun acc!866 () List!31964)

(declare-fun contains!9557 (List!31964 (_ BitVec 64)) Bool)

(assert (=> b!1366806 (= res!910406 (not (contains!9557 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366807 () Bool)

(declare-fun res!910403 () Bool)

(declare-fun e!774651 () Bool)

(assert (=> b!1366807 (=> (not res!910403) (not e!774651))))

(declare-datatypes ((array!92781 0))(
  ( (array!92782 (arr!44818 (Array (_ BitVec 32) (_ BitVec 64))) (size!45370 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92781)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366807 (= res!910403 (validKeyInArray!0 (select (arr!44818 a!3861) from!3239)))))

(declare-fun b!1366808 () Bool)

(declare-fun res!910402 () Bool)

(assert (=> b!1366808 (=> (not res!910402) (not e!774649))))

(declare-fun newAcc!98 () List!31964)

(declare-fun subseq!995 (List!31964 List!31964) Bool)

(assert (=> b!1366808 (= res!910402 (subseq!995 newAcc!98 acc!866))))

(declare-fun b!1366809 () Bool)

(declare-fun noDuplicate!2472 (List!31964) Bool)

(assert (=> b!1366809 (= e!774651 (not (noDuplicate!2472 newAcc!98)))))

(declare-datatypes ((Unit!44964 0))(
  ( (Unit!44965) )
))
(declare-fun lt!601534 () Unit!44964)

(declare-fun lt!601535 () List!31964)

(declare-fun lt!601532 () List!31964)

(declare-fun noDuplicateSubseq!182 (List!31964 List!31964) Unit!44964)

(assert (=> b!1366809 (= lt!601534 (noDuplicateSubseq!182 lt!601535 lt!601532))))

(declare-fun arrayNoDuplicates!0 (array!92781 (_ BitVec 32) List!31964) Bool)

(assert (=> b!1366809 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601535)))

(declare-fun lt!601536 () Unit!44964)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92781 List!31964 List!31964 (_ BitVec 32)) Unit!44964)

(assert (=> b!1366809 (= lt!601536 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601532 lt!601535 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366809 (= lt!601535 (Cons!31960 (select (arr!44818 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366809 (= lt!601532 (Cons!31960 (select (arr!44818 a!3861) from!3239) acc!866))))

(declare-fun b!1366810 () Bool)

(assert (=> b!1366810 (= e!774649 e!774651)))

(declare-fun res!910399 () Bool)

(assert (=> b!1366810 (=> (not res!910399) (not e!774651))))

(assert (=> b!1366810 (= res!910399 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601533 () Unit!44964)

(assert (=> b!1366810 (= lt!601533 (noDuplicateSubseq!182 newAcc!98 acc!866))))

(declare-fun b!1366811 () Bool)

(declare-fun res!910409 () Bool)

(assert (=> b!1366811 (=> (not res!910409) (not e!774649))))

(assert (=> b!1366811 (= res!910409 (not (contains!9557 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366812 () Bool)

(declare-fun res!910400 () Bool)

(assert (=> b!1366812 (=> (not res!910400) (not e!774651))))

(assert (=> b!1366812 (= res!910400 (not (contains!9557 acc!866 (select (arr!44818 a!3861) from!3239))))))

(declare-fun b!1366813 () Bool)

(declare-fun res!910404 () Bool)

(assert (=> b!1366813 (=> (not res!910404) (not e!774649))))

(assert (=> b!1366813 (= res!910404 (not (contains!9557 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366814 () Bool)

(declare-fun res!910405 () Bool)

(assert (=> b!1366814 (=> (not res!910405) (not e!774649))))

(assert (=> b!1366814 (= res!910405 (noDuplicate!2472 acc!866))))

(declare-fun b!1366815 () Bool)

(declare-fun res!910401 () Bool)

(assert (=> b!1366815 (=> (not res!910401) (not e!774651))))

(assert (=> b!1366815 (= res!910401 (bvslt from!3239 (size!45370 a!3861)))))

(declare-fun res!910407 () Bool)

(assert (=> start!115546 (=> (not res!910407) (not e!774649))))

(assert (=> start!115546 (= res!910407 (and (bvslt (size!45370 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45370 a!3861))))))

(assert (=> start!115546 e!774649))

(declare-fun array_inv!34051 (array!92781) Bool)

(assert (=> start!115546 (array_inv!34051 a!3861)))

(assert (=> start!115546 true))

(declare-fun b!1366816 () Bool)

(declare-fun res!910408 () Bool)

(assert (=> b!1366816 (=> (not res!910408) (not e!774649))))

(assert (=> b!1366816 (= res!910408 (not (contains!9557 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115546 res!910407) b!1366814))

(assert (= (and b!1366814 res!910405) b!1366806))

(assert (= (and b!1366806 res!910406) b!1366811))

(assert (= (and b!1366811 res!910409) b!1366813))

(assert (= (and b!1366813 res!910404) b!1366816))

(assert (= (and b!1366816 res!910408) b!1366808))

(assert (= (and b!1366808 res!910402) b!1366810))

(assert (= (and b!1366810 res!910399) b!1366815))

(assert (= (and b!1366815 res!910401) b!1366807))

(assert (= (and b!1366807 res!910403) b!1366812))

(assert (= (and b!1366812 res!910400) b!1366809))

(declare-fun m!1250619 () Bool)

(assert (=> b!1366807 m!1250619))

(assert (=> b!1366807 m!1250619))

(declare-fun m!1250621 () Bool)

(assert (=> b!1366807 m!1250621))

(declare-fun m!1250623 () Bool)

(assert (=> b!1366810 m!1250623))

(declare-fun m!1250625 () Bool)

(assert (=> b!1366810 m!1250625))

(assert (=> b!1366812 m!1250619))

(assert (=> b!1366812 m!1250619))

(declare-fun m!1250627 () Bool)

(assert (=> b!1366812 m!1250627))

(declare-fun m!1250629 () Bool)

(assert (=> b!1366811 m!1250629))

(declare-fun m!1250631 () Bool)

(assert (=> b!1366816 m!1250631))

(declare-fun m!1250633 () Bool)

(assert (=> start!115546 m!1250633))

(declare-fun m!1250635 () Bool)

(assert (=> b!1366813 m!1250635))

(declare-fun m!1250637 () Bool)

(assert (=> b!1366814 m!1250637))

(declare-fun m!1250639 () Bool)

(assert (=> b!1366808 m!1250639))

(declare-fun m!1250641 () Bool)

(assert (=> b!1366809 m!1250641))

(declare-fun m!1250643 () Bool)

(assert (=> b!1366809 m!1250643))

(declare-fun m!1250645 () Bool)

(assert (=> b!1366809 m!1250645))

(assert (=> b!1366809 m!1250619))

(declare-fun m!1250647 () Bool)

(assert (=> b!1366809 m!1250647))

(declare-fun m!1250649 () Bool)

(assert (=> b!1366806 m!1250649))

(check-sat (not b!1366808) (not b!1366812) (not b!1366806) (not b!1366814) (not start!115546) (not b!1366811) (not b!1366807) (not b!1366813) (not b!1366809) (not b!1366816) (not b!1366810))
(check-sat)
(get-model)

(declare-fun b!1366903 () Bool)

(declare-fun e!774689 () Bool)

(declare-fun call!65455 () Bool)

(assert (=> b!1366903 (= e!774689 call!65455)))

(declare-fun d!146593 () Bool)

(declare-fun res!910493 () Bool)

(declare-fun e!774688 () Bool)

(assert (=> d!146593 (=> res!910493 e!774688)))

(assert (=> d!146593 (= res!910493 (bvsge from!3239 (size!45370 a!3861)))))

(assert (=> d!146593 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774688)))

(declare-fun b!1366904 () Bool)

(assert (=> b!1366904 (= e!774689 call!65455)))

(declare-fun e!774690 () Bool)

(declare-fun b!1366905 () Bool)

(assert (=> b!1366905 (= e!774690 (contains!9557 acc!866 (select (arr!44818 a!3861) from!3239)))))

(declare-fun b!1366906 () Bool)

(declare-fun e!774691 () Bool)

(assert (=> b!1366906 (= e!774691 e!774689)))

(declare-fun c!127648 () Bool)

(assert (=> b!1366906 (= c!127648 (validKeyInArray!0 (select (arr!44818 a!3861) from!3239)))))

(declare-fun b!1366907 () Bool)

(assert (=> b!1366907 (= e!774688 e!774691)))

(declare-fun res!910494 () Bool)

(assert (=> b!1366907 (=> (not res!910494) (not e!774691))))

(assert (=> b!1366907 (= res!910494 (not e!774690))))

(declare-fun res!910492 () Bool)

(assert (=> b!1366907 (=> (not res!910492) (not e!774690))))

(assert (=> b!1366907 (= res!910492 (validKeyInArray!0 (select (arr!44818 a!3861) from!3239)))))

(declare-fun bm!65452 () Bool)

(assert (=> bm!65452 (= call!65455 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127648 (Cons!31960 (select (arr!44818 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!146593 (not res!910493)) b!1366907))

(assert (= (and b!1366907 res!910492) b!1366905))

(assert (= (and b!1366907 res!910494) b!1366906))

(assert (= (and b!1366906 c!127648) b!1366904))

(assert (= (and b!1366906 (not c!127648)) b!1366903))

(assert (= (or b!1366904 b!1366903) bm!65452))

(assert (=> b!1366905 m!1250619))

(assert (=> b!1366905 m!1250619))

(assert (=> b!1366905 m!1250627))

(assert (=> b!1366906 m!1250619))

(assert (=> b!1366906 m!1250619))

(assert (=> b!1366906 m!1250621))

(assert (=> b!1366907 m!1250619))

(assert (=> b!1366907 m!1250619))

(assert (=> b!1366907 m!1250621))

(assert (=> bm!65452 m!1250619))

(declare-fun m!1250725 () Bool)

(assert (=> bm!65452 m!1250725))

(assert (=> b!1366810 d!146593))

(declare-fun d!146603 () Bool)

(assert (=> d!146603 (noDuplicate!2472 newAcc!98)))

(declare-fun lt!601579 () Unit!44964)

(declare-fun choose!2002 (List!31964 List!31964) Unit!44964)

(assert (=> d!146603 (= lt!601579 (choose!2002 newAcc!98 acc!866))))

(declare-fun e!774716 () Bool)

(assert (=> d!146603 e!774716))

(declare-fun res!910519 () Bool)

(assert (=> d!146603 (=> (not res!910519) (not e!774716))))

(assert (=> d!146603 (= res!910519 (subseq!995 newAcc!98 acc!866))))

(assert (=> d!146603 (= (noDuplicateSubseq!182 newAcc!98 acc!866) lt!601579)))

(declare-fun b!1366932 () Bool)

(assert (=> b!1366932 (= e!774716 (noDuplicate!2472 acc!866))))

(assert (= (and d!146603 res!910519) b!1366932))

(assert (=> d!146603 m!1250645))

(declare-fun m!1250755 () Bool)

(assert (=> d!146603 m!1250755))

(assert (=> d!146603 m!1250639))

(assert (=> b!1366932 m!1250637))

(assert (=> b!1366810 d!146603))

(declare-fun d!146617 () Bool)

(declare-fun lt!601582 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!712 (List!31964) (InoxSet (_ BitVec 64)))

(assert (=> d!146617 (= lt!601582 (select (content!712 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774737 () Bool)

(assert (=> d!146617 (= lt!601582 e!774737)))

(declare-fun res!910539 () Bool)

(assert (=> d!146617 (=> (not res!910539) (not e!774737))))

(get-info :version)

(assert (=> d!146617 (= res!910539 ((_ is Cons!31960) newAcc!98))))

(assert (=> d!146617 (= (contains!9557 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601582)))

(declare-fun b!1366955 () Bool)

(declare-fun e!774738 () Bool)

(assert (=> b!1366955 (= e!774737 e!774738)))

(declare-fun res!910538 () Bool)

(assert (=> b!1366955 (=> res!910538 e!774738)))

(assert (=> b!1366955 (= res!910538 (= (h!33169 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366956 () Bool)

(assert (=> b!1366956 (= e!774738 (contains!9557 (t!46650 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146617 res!910539) b!1366955))

(assert (= (and b!1366955 (not res!910538)) b!1366956))

(declare-fun m!1250757 () Bool)

(assert (=> d!146617 m!1250757))

(declare-fun m!1250759 () Bool)

(assert (=> d!146617 m!1250759))

(declare-fun m!1250761 () Bool)

(assert (=> b!1366956 m!1250761))

(assert (=> b!1366816 d!146617))

(declare-fun d!146621 () Bool)

(declare-fun lt!601583 () Bool)

(assert (=> d!146621 (= lt!601583 (select (content!712 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774739 () Bool)

(assert (=> d!146621 (= lt!601583 e!774739)))

(declare-fun res!910541 () Bool)

(assert (=> d!146621 (=> (not res!910541) (not e!774739))))

(assert (=> d!146621 (= res!910541 ((_ is Cons!31960) acc!866))))

(assert (=> d!146621 (= (contains!9557 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601583)))

(declare-fun b!1366957 () Bool)

(declare-fun e!774740 () Bool)

(assert (=> b!1366957 (= e!774739 e!774740)))

(declare-fun res!910540 () Bool)

(assert (=> b!1366957 (=> res!910540 e!774740)))

(assert (=> b!1366957 (= res!910540 (= (h!33169 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366958 () Bool)

(assert (=> b!1366958 (= e!774740 (contains!9557 (t!46650 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146621 res!910541) b!1366957))

(assert (= (and b!1366957 (not res!910540)) b!1366958))

(declare-fun m!1250763 () Bool)

(assert (=> d!146621 m!1250763))

(declare-fun m!1250765 () Bool)

(assert (=> d!146621 m!1250765))

(declare-fun m!1250767 () Bool)

(assert (=> b!1366958 m!1250767))

(assert (=> b!1366811 d!146621))

(declare-fun d!146623 () Bool)

(assert (=> d!146623 (= (array_inv!34051 a!3861) (bvsge (size!45370 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115546 d!146623))

(declare-fun d!146625 () Bool)

(declare-fun lt!601584 () Bool)

(assert (=> d!146625 (= lt!601584 (select (content!712 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774745 () Bool)

(assert (=> d!146625 (= lt!601584 e!774745)))

(declare-fun res!910547 () Bool)

(assert (=> d!146625 (=> (not res!910547) (not e!774745))))

(assert (=> d!146625 (= res!910547 ((_ is Cons!31960) acc!866))))

(assert (=> d!146625 (= (contains!9557 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601584)))

(declare-fun b!1366963 () Bool)

(declare-fun e!774746 () Bool)

(assert (=> b!1366963 (= e!774745 e!774746)))

(declare-fun res!910546 () Bool)

(assert (=> b!1366963 (=> res!910546 e!774746)))

(assert (=> b!1366963 (= res!910546 (= (h!33169 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366964 () Bool)

(assert (=> b!1366964 (= e!774746 (contains!9557 (t!46650 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146625 res!910547) b!1366963))

(assert (= (and b!1366963 (not res!910546)) b!1366964))

(assert (=> d!146625 m!1250763))

(declare-fun m!1250773 () Bool)

(assert (=> d!146625 m!1250773))

(declare-fun m!1250775 () Bool)

(assert (=> b!1366964 m!1250775))

(assert (=> b!1366806 d!146625))

(declare-fun d!146629 () Bool)

(declare-fun lt!601585 () Bool)

(assert (=> d!146629 (= lt!601585 (select (content!712 acc!866) (select (arr!44818 a!3861) from!3239)))))

(declare-fun e!774747 () Bool)

(assert (=> d!146629 (= lt!601585 e!774747)))

(declare-fun res!910549 () Bool)

(assert (=> d!146629 (=> (not res!910549) (not e!774747))))

(assert (=> d!146629 (= res!910549 ((_ is Cons!31960) acc!866))))

(assert (=> d!146629 (= (contains!9557 acc!866 (select (arr!44818 a!3861) from!3239)) lt!601585)))

(declare-fun b!1366965 () Bool)

(declare-fun e!774748 () Bool)

(assert (=> b!1366965 (= e!774747 e!774748)))

(declare-fun res!910548 () Bool)

(assert (=> b!1366965 (=> res!910548 e!774748)))

(assert (=> b!1366965 (= res!910548 (= (h!33169 acc!866) (select (arr!44818 a!3861) from!3239)))))

(declare-fun b!1366966 () Bool)

(assert (=> b!1366966 (= e!774748 (contains!9557 (t!46650 acc!866) (select (arr!44818 a!3861) from!3239)))))

(assert (= (and d!146629 res!910549) b!1366965))

(assert (= (and b!1366965 (not res!910548)) b!1366966))

(assert (=> d!146629 m!1250763))

(assert (=> d!146629 m!1250619))

(declare-fun m!1250777 () Bool)

(assert (=> d!146629 m!1250777))

(assert (=> b!1366966 m!1250619))

(declare-fun m!1250779 () Bool)

(assert (=> b!1366966 m!1250779))

(assert (=> b!1366812 d!146629))

(declare-fun d!146631 () Bool)

(assert (=> d!146631 (= (validKeyInArray!0 (select (arr!44818 a!3861) from!3239)) (and (not (= (select (arr!44818 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44818 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1366807 d!146631))

(declare-fun d!146633 () Bool)

(declare-fun lt!601586 () Bool)

(assert (=> d!146633 (= lt!601586 (select (content!712 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774753 () Bool)

(assert (=> d!146633 (= lt!601586 e!774753)))

(declare-fun res!910554 () Bool)

(assert (=> d!146633 (=> (not res!910554) (not e!774753))))

(assert (=> d!146633 (= res!910554 ((_ is Cons!31960) newAcc!98))))

(assert (=> d!146633 (= (contains!9557 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601586)))

(declare-fun b!1366972 () Bool)

(declare-fun e!774754 () Bool)

(assert (=> b!1366972 (= e!774753 e!774754)))

(declare-fun res!910553 () Bool)

(assert (=> b!1366972 (=> res!910553 e!774754)))

(assert (=> b!1366972 (= res!910553 (= (h!33169 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366973 () Bool)

(assert (=> b!1366973 (= e!774754 (contains!9557 (t!46650 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146633 res!910554) b!1366972))

(assert (= (and b!1366972 (not res!910553)) b!1366973))

(assert (=> d!146633 m!1250757))

(declare-fun m!1250783 () Bool)

(assert (=> d!146633 m!1250783))

(declare-fun m!1250785 () Bool)

(assert (=> b!1366973 m!1250785))

(assert (=> b!1366813 d!146633))

(declare-fun b!1366998 () Bool)

(declare-fun e!774776 () Bool)

(assert (=> b!1366998 (= e!774776 (subseq!995 newAcc!98 (t!46650 acc!866)))))

(declare-fun b!1366997 () Bool)

(declare-fun e!774774 () Bool)

(assert (=> b!1366997 (= e!774774 (subseq!995 (t!46650 newAcc!98) (t!46650 acc!866)))))

(declare-fun b!1366995 () Bool)

(declare-fun e!774775 () Bool)

(declare-fun e!774777 () Bool)

(assert (=> b!1366995 (= e!774775 e!774777)))

(declare-fun res!910575 () Bool)

(assert (=> b!1366995 (=> (not res!910575) (not e!774777))))

(assert (=> b!1366995 (= res!910575 ((_ is Cons!31960) acc!866))))

(declare-fun b!1366996 () Bool)

(assert (=> b!1366996 (= e!774777 e!774776)))

(declare-fun res!910573 () Bool)

(assert (=> b!1366996 (=> res!910573 e!774776)))

(assert (=> b!1366996 (= res!910573 e!774774)))

(declare-fun res!910572 () Bool)

(assert (=> b!1366996 (=> (not res!910572) (not e!774774))))

(assert (=> b!1366996 (= res!910572 (= (h!33169 newAcc!98) (h!33169 acc!866)))))

(declare-fun d!146637 () Bool)

(declare-fun res!910574 () Bool)

(assert (=> d!146637 (=> res!910574 e!774775)))

(assert (=> d!146637 (= res!910574 ((_ is Nil!31961) newAcc!98))))

(assert (=> d!146637 (= (subseq!995 newAcc!98 acc!866) e!774775)))

(assert (= (and d!146637 (not res!910574)) b!1366995))

(assert (= (and b!1366995 res!910575) b!1366996))

(assert (= (and b!1366996 res!910572) b!1366997))

(assert (= (and b!1366996 (not res!910573)) b!1366998))

(declare-fun m!1250789 () Bool)

(assert (=> b!1366998 m!1250789))

(declare-fun m!1250791 () Bool)

(assert (=> b!1366997 m!1250791))

(assert (=> b!1366808 d!146637))

(declare-fun d!146641 () Bool)

(declare-fun res!910591 () Bool)

(declare-fun e!774794 () Bool)

(assert (=> d!146641 (=> res!910591 e!774794)))

(assert (=> d!146641 (= res!910591 ((_ is Nil!31961) acc!866))))

(assert (=> d!146641 (= (noDuplicate!2472 acc!866) e!774794)))

(declare-fun b!1367016 () Bool)

(declare-fun e!774795 () Bool)

(assert (=> b!1367016 (= e!774794 e!774795)))

(declare-fun res!910592 () Bool)

(assert (=> b!1367016 (=> (not res!910592) (not e!774795))))

(assert (=> b!1367016 (= res!910592 (not (contains!9557 (t!46650 acc!866) (h!33169 acc!866))))))

(declare-fun b!1367017 () Bool)

(assert (=> b!1367017 (= e!774795 (noDuplicate!2472 (t!46650 acc!866)))))

(assert (= (and d!146641 (not res!910591)) b!1367016))

(assert (= (and b!1367016 res!910592) b!1367017))

(declare-fun m!1250795 () Bool)

(assert (=> b!1367016 m!1250795))

(declare-fun m!1250797 () Bool)

(assert (=> b!1367017 m!1250797))

(assert (=> b!1366814 d!146641))

(declare-fun d!146645 () Bool)

(declare-fun res!910593 () Bool)

(declare-fun e!774796 () Bool)

(assert (=> d!146645 (=> res!910593 e!774796)))

(assert (=> d!146645 (= res!910593 ((_ is Nil!31961) newAcc!98))))

(assert (=> d!146645 (= (noDuplicate!2472 newAcc!98) e!774796)))

(declare-fun b!1367018 () Bool)

(declare-fun e!774797 () Bool)

(assert (=> b!1367018 (= e!774796 e!774797)))

(declare-fun res!910594 () Bool)

(assert (=> b!1367018 (=> (not res!910594) (not e!774797))))

(assert (=> b!1367018 (= res!910594 (not (contains!9557 (t!46650 newAcc!98) (h!33169 newAcc!98))))))

(declare-fun b!1367019 () Bool)

(assert (=> b!1367019 (= e!774797 (noDuplicate!2472 (t!46650 newAcc!98)))))

(assert (= (and d!146645 (not res!910593)) b!1367018))

(assert (= (and b!1367018 res!910594) b!1367019))

(declare-fun m!1250799 () Bool)

(assert (=> b!1367018 m!1250799))

(declare-fun m!1250801 () Bool)

(assert (=> b!1367019 m!1250801))

(assert (=> b!1366809 d!146645))

(declare-fun d!146647 () Bool)

(assert (=> d!146647 (noDuplicate!2472 lt!601535)))

(declare-fun lt!601590 () Unit!44964)

(assert (=> d!146647 (= lt!601590 (choose!2002 lt!601535 lt!601532))))

(declare-fun e!774800 () Bool)

(assert (=> d!146647 e!774800))

(declare-fun res!910597 () Bool)

(assert (=> d!146647 (=> (not res!910597) (not e!774800))))

(assert (=> d!146647 (= res!910597 (subseq!995 lt!601535 lt!601532))))

(assert (=> d!146647 (= (noDuplicateSubseq!182 lt!601535 lt!601532) lt!601590)))

(declare-fun b!1367022 () Bool)

(assert (=> b!1367022 (= e!774800 (noDuplicate!2472 lt!601532))))

(assert (= (and d!146647 res!910597) b!1367022))

(declare-fun m!1250803 () Bool)

(assert (=> d!146647 m!1250803))

(declare-fun m!1250805 () Bool)

(assert (=> d!146647 m!1250805))

(declare-fun m!1250807 () Bool)

(assert (=> d!146647 m!1250807))

(declare-fun m!1250809 () Bool)

(assert (=> b!1367022 m!1250809))

(assert (=> b!1366809 d!146647))

(declare-fun b!1367027 () Bool)

(declare-fun e!774806 () Bool)

(declare-fun call!65462 () Bool)

(assert (=> b!1367027 (= e!774806 call!65462)))

(declare-fun d!146649 () Bool)

(declare-fun res!910603 () Bool)

(declare-fun e!774805 () Bool)

(assert (=> d!146649 (=> res!910603 e!774805)))

(assert (=> d!146649 (= res!910603 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45370 a!3861)))))

(assert (=> d!146649 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601535) e!774805)))

(declare-fun b!1367028 () Bool)

(assert (=> b!1367028 (= e!774806 call!65462)))

(declare-fun e!774807 () Bool)

(declare-fun b!1367029 () Bool)

(assert (=> b!1367029 (= e!774807 (contains!9557 lt!601535 (select (arr!44818 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367030 () Bool)

(declare-fun e!774808 () Bool)

(assert (=> b!1367030 (= e!774808 e!774806)))

(declare-fun c!127655 () Bool)

(assert (=> b!1367030 (= c!127655 (validKeyInArray!0 (select (arr!44818 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367031 () Bool)

(assert (=> b!1367031 (= e!774805 e!774808)))

(declare-fun res!910604 () Bool)

(assert (=> b!1367031 (=> (not res!910604) (not e!774808))))

(assert (=> b!1367031 (= res!910604 (not e!774807))))

(declare-fun res!910602 () Bool)

(assert (=> b!1367031 (=> (not res!910602) (not e!774807))))

(assert (=> b!1367031 (= res!910602 (validKeyInArray!0 (select (arr!44818 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65459 () Bool)

(assert (=> bm!65459 (= call!65462 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127655 (Cons!31960 (select (arr!44818 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601535) lt!601535)))))

(assert (= (and d!146649 (not res!910603)) b!1367031))

(assert (= (and b!1367031 res!910602) b!1367029))

(assert (= (and b!1367031 res!910604) b!1367030))

(assert (= (and b!1367030 c!127655) b!1367028))

(assert (= (and b!1367030 (not c!127655)) b!1367027))

(assert (= (or b!1367028 b!1367027) bm!65459))

(declare-fun m!1250819 () Bool)

(assert (=> b!1367029 m!1250819))

(assert (=> b!1367029 m!1250819))

(declare-fun m!1250821 () Bool)

(assert (=> b!1367029 m!1250821))

(assert (=> b!1367030 m!1250819))

(assert (=> b!1367030 m!1250819))

(declare-fun m!1250823 () Bool)

(assert (=> b!1367030 m!1250823))

(assert (=> b!1367031 m!1250819))

(assert (=> b!1367031 m!1250819))

(assert (=> b!1367031 m!1250823))

(assert (=> bm!65459 m!1250819))

(declare-fun m!1250827 () Bool)

(assert (=> bm!65459 m!1250827))

(assert (=> b!1366809 d!146649))

(declare-fun d!146657 () Bool)

(assert (=> d!146657 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601535)))

(declare-fun lt!601601 () Unit!44964)

(declare-fun choose!80 (array!92781 List!31964 List!31964 (_ BitVec 32)) Unit!44964)

(assert (=> d!146657 (= lt!601601 (choose!80 a!3861 lt!601532 lt!601535 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146657 (bvslt (size!45370 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146657 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601532 lt!601535 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601601)))

(declare-fun bs!39188 () Bool)

(assert (= bs!39188 d!146657))

(assert (=> bs!39188 m!1250643))

(declare-fun m!1250879 () Bool)

(assert (=> bs!39188 m!1250879))

(assert (=> b!1366809 d!146657))

(check-sat (not b!1366906) (not d!146621) (not b!1367019) (not b!1367018) (not bm!65452) (not d!146629) (not b!1366998) (not b!1366964) (not b!1367029) (not b!1367017) (not d!146617) (not b!1366932) (not b!1366966) (not b!1366905) (not b!1367022) (not d!146603) (not b!1366907) (not b!1366956) (not d!146647) (not d!146657) (not b!1367031) (not b!1366997) (not b!1366958) (not d!146633) (not d!146625) (not b!1367016) (not b!1367030) (not bm!65459) (not b!1366973))
(check-sat)
