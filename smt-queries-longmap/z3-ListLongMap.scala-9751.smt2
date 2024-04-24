; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115714 () Bool)

(assert start!115714)

(declare-fun b!1367690 () Bool)

(declare-fun res!910484 () Bool)

(declare-fun e!775269 () Bool)

(assert (=> b!1367690 (=> (not res!910484) (not e!775269))))

(declare-datatypes ((List!31942 0))(
  ( (Nil!31939) (Cons!31938 (h!33156 (_ BitVec 64)) (t!46628 List!31942)) )
))
(declare-fun acc!866 () List!31942)

(declare-fun contains!9627 (List!31942 (_ BitVec 64)) Bool)

(assert (=> b!1367690 (= res!910484 (not (contains!9627 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367691 () Bool)

(declare-fun res!910485 () Bool)

(assert (=> b!1367691 (=> (not res!910485) (not e!775269))))

(declare-fun newAcc!98 () List!31942)

(declare-fun subseq!986 (List!31942 List!31942) Bool)

(assert (=> b!1367691 (= res!910485 (subseq!986 newAcc!98 acc!866))))

(declare-fun b!1367692 () Bool)

(declare-fun res!910486 () Bool)

(assert (=> b!1367692 (=> (not res!910486) (not e!775269))))

(declare-fun noDuplicate!2458 (List!31942) Bool)

(assert (=> b!1367692 (= res!910486 (noDuplicate!2458 acc!866))))

(declare-fun b!1367693 () Bool)

(declare-fun res!910489 () Bool)

(declare-fun e!775270 () Bool)

(assert (=> b!1367693 (=> (not res!910489) (not e!775270))))

(declare-datatypes ((array!92926 0))(
  ( (array!92927 (arr!44887 (Array (_ BitVec 32) (_ BitVec 64))) (size!45438 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92926)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367693 (= res!910489 (validKeyInArray!0 (select (arr!44887 a!3861) from!3239)))))

(declare-fun b!1367694 () Bool)

(assert (=> b!1367694 (= e!775269 e!775270)))

(declare-fun res!910488 () Bool)

(assert (=> b!1367694 (=> (not res!910488) (not e!775270))))

(declare-fun arrayNoDuplicates!0 (array!92926 (_ BitVec 32) List!31942) Bool)

(assert (=> b!1367694 (= res!910488 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45044 0))(
  ( (Unit!45045) )
))
(declare-fun lt!602028 () Unit!45044)

(declare-fun noDuplicateSubseq!173 (List!31942 List!31942) Unit!45044)

(assert (=> b!1367694 (= lt!602028 (noDuplicateSubseq!173 newAcc!98 acc!866))))

(declare-fun b!1367696 () Bool)

(declare-fun res!910492 () Bool)

(assert (=> b!1367696 (=> (not res!910492) (not e!775270))))

(assert (=> b!1367696 (= res!910492 (not (contains!9627 acc!866 (select (arr!44887 a!3861) from!3239))))))

(declare-fun b!1367697 () Bool)

(declare-fun res!910493 () Bool)

(assert (=> b!1367697 (=> (not res!910493) (not e!775269))))

(assert (=> b!1367697 (= res!910493 (not (contains!9627 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367698 () Bool)

(declare-fun e!775267 () Bool)

(assert (=> b!1367698 (= e!775270 (not e!775267))))

(declare-fun res!910490 () Bool)

(assert (=> b!1367698 (=> (not res!910490) (not e!775267))))

(declare-fun lt!602029 () List!31942)

(declare-fun lt!602031 () List!31942)

(assert (=> b!1367698 (= res!910490 (subseq!986 lt!602029 lt!602031))))

(assert (=> b!1367698 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602029)))

(declare-fun lt!602030 () Unit!45044)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92926 List!31942 List!31942 (_ BitVec 32)) Unit!45044)

(assert (=> b!1367698 (= lt!602030 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602031 lt!602029 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1367698 (= lt!602029 (Cons!31938 (select (arr!44887 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367698 (= lt!602031 (Cons!31938 (select (arr!44887 a!3861) from!3239) acc!866))))

(declare-fun b!1367699 () Bool)

(declare-fun res!910491 () Bool)

(assert (=> b!1367699 (=> (not res!910491) (not e!775269))))

(assert (=> b!1367699 (= res!910491 (not (contains!9627 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367695 () Bool)

(assert (=> b!1367695 (= e!775267 (noDuplicate!2458 lt!602031))))

(declare-fun res!910483 () Bool)

(assert (=> start!115714 (=> (not res!910483) (not e!775269))))

(assert (=> start!115714 (= res!910483 (and (bvslt (size!45438 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45438 a!3861))))))

(assert (=> start!115714 e!775269))

(declare-fun array_inv!34168 (array!92926) Bool)

(assert (=> start!115714 (array_inv!34168 a!3861)))

(assert (=> start!115714 true))

(declare-fun b!1367700 () Bool)

(declare-fun res!910494 () Bool)

(assert (=> b!1367700 (=> (not res!910494) (not e!775269))))

(assert (=> b!1367700 (= res!910494 (not (contains!9627 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367701 () Bool)

(declare-fun res!910487 () Bool)

(assert (=> b!1367701 (=> (not res!910487) (not e!775270))))

(assert (=> b!1367701 (= res!910487 (bvslt from!3239 (size!45438 a!3861)))))

(assert (= (and start!115714 res!910483) b!1367692))

(assert (= (and b!1367692 res!910486) b!1367690))

(assert (= (and b!1367690 res!910484) b!1367699))

(assert (= (and b!1367699 res!910491) b!1367697))

(assert (= (and b!1367697 res!910493) b!1367700))

(assert (= (and b!1367700 res!910494) b!1367691))

(assert (= (and b!1367691 res!910485) b!1367694))

(assert (= (and b!1367694 res!910488) b!1367701))

(assert (= (and b!1367701 res!910487) b!1367693))

(assert (= (and b!1367693 res!910489) b!1367696))

(assert (= (and b!1367696 res!910492) b!1367698))

(assert (= (and b!1367698 res!910490) b!1367695))

(declare-fun m!1252297 () Bool)

(assert (=> b!1367696 m!1252297))

(assert (=> b!1367696 m!1252297))

(declare-fun m!1252299 () Bool)

(assert (=> b!1367696 m!1252299))

(declare-fun m!1252301 () Bool)

(assert (=> b!1367698 m!1252301))

(declare-fun m!1252303 () Bool)

(assert (=> b!1367698 m!1252303))

(declare-fun m!1252305 () Bool)

(assert (=> b!1367698 m!1252305))

(assert (=> b!1367698 m!1252297))

(assert (=> b!1367693 m!1252297))

(assert (=> b!1367693 m!1252297))

(declare-fun m!1252307 () Bool)

(assert (=> b!1367693 m!1252307))

(declare-fun m!1252309 () Bool)

(assert (=> b!1367691 m!1252309))

(declare-fun m!1252311 () Bool)

(assert (=> b!1367697 m!1252311))

(declare-fun m!1252313 () Bool)

(assert (=> b!1367690 m!1252313))

(declare-fun m!1252315 () Bool)

(assert (=> b!1367692 m!1252315))

(declare-fun m!1252317 () Bool)

(assert (=> b!1367700 m!1252317))

(declare-fun m!1252319 () Bool)

(assert (=> b!1367694 m!1252319))

(declare-fun m!1252321 () Bool)

(assert (=> b!1367694 m!1252321))

(declare-fun m!1252323 () Bool)

(assert (=> b!1367699 m!1252323))

(declare-fun m!1252325 () Bool)

(assert (=> b!1367695 m!1252325))

(declare-fun m!1252327 () Bool)

(assert (=> start!115714 m!1252327))

(check-sat (not b!1367691) (not b!1367697) (not b!1367694) (not b!1367700) (not b!1367693) (not b!1367696) (not b!1367690) (not start!115714) (not b!1367699) (not b!1367695) (not b!1367698) (not b!1367692))
(check-sat)
(get-model)

(declare-fun lt!602058 () Bool)

(declare-fun d!147069 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!707 (List!31942) (InoxSet (_ BitVec 64)))

(assert (=> d!147069 (= lt!602058 (select (content!707 acc!866) (select (arr!44887 a!3861) from!3239)))))

(declare-fun e!775300 () Bool)

(assert (=> d!147069 (= lt!602058 e!775300)))

(declare-fun res!910571 () Bool)

(assert (=> d!147069 (=> (not res!910571) (not e!775300))))

(get-info :version)

(assert (=> d!147069 (= res!910571 ((_ is Cons!31938) acc!866))))

(assert (=> d!147069 (= (contains!9627 acc!866 (select (arr!44887 a!3861) from!3239)) lt!602058)))

(declare-fun b!1367778 () Bool)

(declare-fun e!775299 () Bool)

(assert (=> b!1367778 (= e!775300 e!775299)))

(declare-fun res!910572 () Bool)

(assert (=> b!1367778 (=> res!910572 e!775299)))

(assert (=> b!1367778 (= res!910572 (= (h!33156 acc!866) (select (arr!44887 a!3861) from!3239)))))

(declare-fun b!1367779 () Bool)

(assert (=> b!1367779 (= e!775299 (contains!9627 (t!46628 acc!866) (select (arr!44887 a!3861) from!3239)))))

(assert (= (and d!147069 res!910571) b!1367778))

(assert (= (and b!1367778 (not res!910572)) b!1367779))

(declare-fun m!1252393 () Bool)

(assert (=> d!147069 m!1252393))

(assert (=> d!147069 m!1252297))

(declare-fun m!1252395 () Bool)

(assert (=> d!147069 m!1252395))

(assert (=> b!1367779 m!1252297))

(declare-fun m!1252397 () Bool)

(assert (=> b!1367779 m!1252397))

(assert (=> b!1367696 d!147069))

(declare-fun d!147075 () Bool)

(declare-fun res!910589 () Bool)

(declare-fun e!775319 () Bool)

(assert (=> d!147075 (=> res!910589 e!775319)))

(assert (=> d!147075 (= res!910589 ((_ is Nil!31939) lt!602031))))

(assert (=> d!147075 (= (noDuplicate!2458 lt!602031) e!775319)))

(declare-fun b!1367800 () Bool)

(declare-fun e!775320 () Bool)

(assert (=> b!1367800 (= e!775319 e!775320)))

(declare-fun res!910590 () Bool)

(assert (=> b!1367800 (=> (not res!910590) (not e!775320))))

(assert (=> b!1367800 (= res!910590 (not (contains!9627 (t!46628 lt!602031) (h!33156 lt!602031))))))

(declare-fun b!1367801 () Bool)

(assert (=> b!1367801 (= e!775320 (noDuplicate!2458 (t!46628 lt!602031)))))

(assert (= (and d!147075 (not res!910589)) b!1367800))

(assert (= (and b!1367800 res!910590) b!1367801))

(declare-fun m!1252405 () Bool)

(assert (=> b!1367800 m!1252405))

(declare-fun m!1252407 () Bool)

(assert (=> b!1367801 m!1252407))

(assert (=> b!1367695 d!147075))

(declare-fun d!147079 () Bool)

(declare-fun lt!602062 () Bool)

(assert (=> d!147079 (= lt!602062 (select (content!707 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775322 () Bool)

(assert (=> d!147079 (= lt!602062 e!775322)))

(declare-fun res!910591 () Bool)

(assert (=> d!147079 (=> (not res!910591) (not e!775322))))

(assert (=> d!147079 (= res!910591 ((_ is Cons!31938) newAcc!98))))

(assert (=> d!147079 (= (contains!9627 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602062)))

(declare-fun b!1367802 () Bool)

(declare-fun e!775321 () Bool)

(assert (=> b!1367802 (= e!775322 e!775321)))

(declare-fun res!910592 () Bool)

(assert (=> b!1367802 (=> res!910592 e!775321)))

(assert (=> b!1367802 (= res!910592 (= (h!33156 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367803 () Bool)

(assert (=> b!1367803 (= e!775321 (contains!9627 (t!46628 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147079 res!910591) b!1367802))

(assert (= (and b!1367802 (not res!910592)) b!1367803))

(declare-fun m!1252409 () Bool)

(assert (=> d!147079 m!1252409))

(declare-fun m!1252411 () Bool)

(assert (=> d!147079 m!1252411))

(declare-fun m!1252413 () Bool)

(assert (=> b!1367803 m!1252413))

(assert (=> b!1367697 d!147079))

(declare-fun b!1367838 () Bool)

(declare-fun e!775356 () Bool)

(assert (=> b!1367838 (= e!775356 (subseq!986 lt!602029 (t!46628 lt!602031)))))

(declare-fun d!147081 () Bool)

(declare-fun res!910625 () Bool)

(declare-fun e!775354 () Bool)

(assert (=> d!147081 (=> res!910625 e!775354)))

(assert (=> d!147081 (= res!910625 ((_ is Nil!31939) lt!602029))))

(assert (=> d!147081 (= (subseq!986 lt!602029 lt!602031) e!775354)))

(declare-fun b!1367833 () Bool)

(declare-fun e!775353 () Bool)

(assert (=> b!1367833 (= e!775354 e!775353)))

(declare-fun res!910624 () Bool)

(assert (=> b!1367833 (=> (not res!910624) (not e!775353))))

(assert (=> b!1367833 (= res!910624 ((_ is Cons!31938) lt!602031))))

(declare-fun b!1367834 () Bool)

(assert (=> b!1367834 (= e!775353 e!775356)))

(declare-fun res!910622 () Bool)

(assert (=> b!1367834 (=> res!910622 e!775356)))

(declare-fun e!775355 () Bool)

(assert (=> b!1367834 (= res!910622 e!775355)))

(declare-fun res!910623 () Bool)

(assert (=> b!1367834 (=> (not res!910623) (not e!775355))))

(assert (=> b!1367834 (= res!910623 (= (h!33156 lt!602029) (h!33156 lt!602031)))))

(declare-fun b!1367837 () Bool)

(assert (=> b!1367837 (= e!775355 (subseq!986 (t!46628 lt!602029) (t!46628 lt!602031)))))

(assert (= (and d!147081 (not res!910625)) b!1367833))

(assert (= (and b!1367833 res!910624) b!1367834))

(assert (= (and b!1367834 res!910623) b!1367837))

(assert (= (and b!1367834 (not res!910622)) b!1367838))

(declare-fun m!1252431 () Bool)

(assert (=> b!1367838 m!1252431))

(declare-fun m!1252433 () Bool)

(assert (=> b!1367837 m!1252433))

(assert (=> b!1367698 d!147081))

(declare-fun b!1367881 () Bool)

(declare-fun e!775394 () Bool)

(declare-fun e!775395 () Bool)

(assert (=> b!1367881 (= e!775394 e!775395)))

(declare-fun c!128059 () Bool)

(assert (=> b!1367881 (= c!128059 (validKeyInArray!0 (select (arr!44887 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147091 () Bool)

(declare-fun res!910658 () Bool)

(declare-fun e!775396 () Bool)

(assert (=> d!147091 (=> res!910658 e!775396)))

(assert (=> d!147091 (= res!910658 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45438 a!3861)))))

(assert (=> d!147091 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602029) e!775396)))

(declare-fun b!1367882 () Bool)

(assert (=> b!1367882 (= e!775396 e!775394)))

(declare-fun res!910660 () Bool)

(assert (=> b!1367882 (=> (not res!910660) (not e!775394))))

(declare-fun e!775397 () Bool)

(assert (=> b!1367882 (= res!910660 (not e!775397))))

(declare-fun res!910659 () Bool)

(assert (=> b!1367882 (=> (not res!910659) (not e!775397))))

(assert (=> b!1367882 (= res!910659 (validKeyInArray!0 (select (arr!44887 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367883 () Bool)

(declare-fun call!65533 () Bool)

(assert (=> b!1367883 (= e!775395 call!65533)))

(declare-fun bm!65530 () Bool)

(assert (=> bm!65530 (= call!65533 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128059 (Cons!31938 (select (arr!44887 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602029) lt!602029)))))

(declare-fun b!1367884 () Bool)

(assert (=> b!1367884 (= e!775395 call!65533)))

(declare-fun b!1367885 () Bool)

(assert (=> b!1367885 (= e!775397 (contains!9627 lt!602029 (select (arr!44887 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147091 (not res!910658)) b!1367882))

(assert (= (and b!1367882 res!910659) b!1367885))

(assert (= (and b!1367882 res!910660) b!1367881))

(assert (= (and b!1367881 c!128059) b!1367883))

(assert (= (and b!1367881 (not c!128059)) b!1367884))

(assert (= (or b!1367883 b!1367884) bm!65530))

(declare-fun m!1252455 () Bool)

(assert (=> b!1367881 m!1252455))

(assert (=> b!1367881 m!1252455))

(declare-fun m!1252457 () Bool)

(assert (=> b!1367881 m!1252457))

(assert (=> b!1367882 m!1252455))

(assert (=> b!1367882 m!1252455))

(assert (=> b!1367882 m!1252457))

(assert (=> bm!65530 m!1252455))

(declare-fun m!1252459 () Bool)

(assert (=> bm!65530 m!1252459))

(assert (=> b!1367885 m!1252455))

(assert (=> b!1367885 m!1252455))

(declare-fun m!1252463 () Bool)

(assert (=> b!1367885 m!1252463))

(assert (=> b!1367698 d!147091))

(declare-fun d!147101 () Bool)

(assert (=> d!147101 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602029)))

(declare-fun lt!602075 () Unit!45044)

(declare-fun choose!80 (array!92926 List!31942 List!31942 (_ BitVec 32)) Unit!45044)

(assert (=> d!147101 (= lt!602075 (choose!80 a!3861 lt!602031 lt!602029 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147101 (bvslt (size!45438 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147101 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602031 lt!602029 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602075)))

(declare-fun bs!39221 () Bool)

(assert (= bs!39221 d!147101))

(assert (=> bs!39221 m!1252303))

(declare-fun m!1252473 () Bool)

(assert (=> bs!39221 m!1252473))

(assert (=> b!1367698 d!147101))

(declare-fun d!147107 () Bool)

(declare-fun lt!602077 () Bool)

(assert (=> d!147107 (= lt!602077 (select (content!707 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775403 () Bool)

(assert (=> d!147107 (= lt!602077 e!775403)))

(declare-fun res!910664 () Bool)

(assert (=> d!147107 (=> (not res!910664) (not e!775403))))

(assert (=> d!147107 (= res!910664 ((_ is Cons!31938) newAcc!98))))

(assert (=> d!147107 (= (contains!9627 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602077)))

(declare-fun b!1367891 () Bool)

(declare-fun e!775402 () Bool)

(assert (=> b!1367891 (= e!775403 e!775402)))

(declare-fun res!910665 () Bool)

(assert (=> b!1367891 (=> res!910665 e!775402)))

(assert (=> b!1367891 (= res!910665 (= (h!33156 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367892 () Bool)

(assert (=> b!1367892 (= e!775402 (contains!9627 (t!46628 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147107 res!910664) b!1367891))

(assert (= (and b!1367891 (not res!910665)) b!1367892))

(assert (=> d!147107 m!1252409))

(declare-fun m!1252477 () Bool)

(assert (=> d!147107 m!1252477))

(declare-fun m!1252479 () Bool)

(assert (=> b!1367892 m!1252479))

(assert (=> b!1367700 d!147107))

(declare-fun d!147111 () Bool)

(declare-fun lt!602078 () Bool)

(assert (=> d!147111 (= lt!602078 (select (content!707 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775405 () Bool)

(assert (=> d!147111 (= lt!602078 e!775405)))

(declare-fun res!910666 () Bool)

(assert (=> d!147111 (=> (not res!910666) (not e!775405))))

(assert (=> d!147111 (= res!910666 ((_ is Cons!31938) acc!866))))

(assert (=> d!147111 (= (contains!9627 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602078)))

(declare-fun b!1367893 () Bool)

(declare-fun e!775404 () Bool)

(assert (=> b!1367893 (= e!775405 e!775404)))

(declare-fun res!910667 () Bool)

(assert (=> b!1367893 (=> res!910667 e!775404)))

(assert (=> b!1367893 (= res!910667 (= (h!33156 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367894 () Bool)

(assert (=> b!1367894 (= e!775404 (contains!9627 (t!46628 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147111 res!910666) b!1367893))

(assert (= (and b!1367893 (not res!910667)) b!1367894))

(assert (=> d!147111 m!1252393))

(declare-fun m!1252481 () Bool)

(assert (=> d!147111 m!1252481))

(declare-fun m!1252483 () Bool)

(assert (=> b!1367894 m!1252483))

(assert (=> b!1367699 d!147111))

(declare-fun d!147113 () Bool)

(assert (=> d!147113 (= (array_inv!34168 a!3861) (bvsge (size!45438 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115714 d!147113))

(declare-fun d!147115 () Bool)

(declare-fun lt!602081 () Bool)

(assert (=> d!147115 (= lt!602081 (select (content!707 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775415 () Bool)

(assert (=> d!147115 (= lt!602081 e!775415)))

(declare-fun res!910676 () Bool)

(assert (=> d!147115 (=> (not res!910676) (not e!775415))))

(assert (=> d!147115 (= res!910676 ((_ is Cons!31938) acc!866))))

(assert (=> d!147115 (= (contains!9627 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602081)))

(declare-fun b!1367901 () Bool)

(declare-fun e!775414 () Bool)

(assert (=> b!1367901 (= e!775415 e!775414)))

(declare-fun res!910677 () Bool)

(assert (=> b!1367901 (=> res!910677 e!775414)))

(assert (=> b!1367901 (= res!910677 (= (h!33156 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367902 () Bool)

(assert (=> b!1367902 (= e!775414 (contains!9627 (t!46628 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147115 res!910676) b!1367901))

(assert (= (and b!1367901 (not res!910677)) b!1367902))

(assert (=> d!147115 m!1252393))

(declare-fun m!1252485 () Bool)

(assert (=> d!147115 m!1252485))

(declare-fun m!1252487 () Bool)

(assert (=> b!1367902 m!1252487))

(assert (=> b!1367690 d!147115))

(declare-fun d!147117 () Bool)

(declare-fun res!910678 () Bool)

(declare-fun e!775416 () Bool)

(assert (=> d!147117 (=> res!910678 e!775416)))

(assert (=> d!147117 (= res!910678 ((_ is Nil!31939) acc!866))))

(assert (=> d!147117 (= (noDuplicate!2458 acc!866) e!775416)))

(declare-fun b!1367905 () Bool)

(declare-fun e!775417 () Bool)

(assert (=> b!1367905 (= e!775416 e!775417)))

(declare-fun res!910679 () Bool)

(assert (=> b!1367905 (=> (not res!910679) (not e!775417))))

(assert (=> b!1367905 (= res!910679 (not (contains!9627 (t!46628 acc!866) (h!33156 acc!866))))))

(declare-fun b!1367906 () Bool)

(assert (=> b!1367906 (= e!775417 (noDuplicate!2458 (t!46628 acc!866)))))

(assert (= (and d!147117 (not res!910678)) b!1367905))

(assert (= (and b!1367905 res!910679) b!1367906))

(declare-fun m!1252489 () Bool)

(assert (=> b!1367905 m!1252489))

(declare-fun m!1252491 () Bool)

(assert (=> b!1367906 m!1252491))

(assert (=> b!1367692 d!147117))

(declare-fun b!1367910 () Bool)

(declare-fun e!775421 () Bool)

(assert (=> b!1367910 (= e!775421 (subseq!986 newAcc!98 (t!46628 acc!866)))))

(declare-fun d!147119 () Bool)

(declare-fun res!910683 () Bool)

(declare-fun e!775419 () Bool)

(assert (=> d!147119 (=> res!910683 e!775419)))

(assert (=> d!147119 (= res!910683 ((_ is Nil!31939) newAcc!98))))

(assert (=> d!147119 (= (subseq!986 newAcc!98 acc!866) e!775419)))

(declare-fun b!1367907 () Bool)

(declare-fun e!775418 () Bool)

(assert (=> b!1367907 (= e!775419 e!775418)))

(declare-fun res!910682 () Bool)

(assert (=> b!1367907 (=> (not res!910682) (not e!775418))))

(assert (=> b!1367907 (= res!910682 ((_ is Cons!31938) acc!866))))

(declare-fun b!1367908 () Bool)

(assert (=> b!1367908 (= e!775418 e!775421)))

(declare-fun res!910680 () Bool)

(assert (=> b!1367908 (=> res!910680 e!775421)))

(declare-fun e!775420 () Bool)

(assert (=> b!1367908 (= res!910680 e!775420)))

(declare-fun res!910681 () Bool)

(assert (=> b!1367908 (=> (not res!910681) (not e!775420))))

(assert (=> b!1367908 (= res!910681 (= (h!33156 newAcc!98) (h!33156 acc!866)))))

(declare-fun b!1367909 () Bool)

(assert (=> b!1367909 (= e!775420 (subseq!986 (t!46628 newAcc!98) (t!46628 acc!866)))))

(assert (= (and d!147119 (not res!910683)) b!1367907))

(assert (= (and b!1367907 res!910682) b!1367908))

(assert (= (and b!1367908 res!910681) b!1367909))

(assert (= (and b!1367908 (not res!910680)) b!1367910))

(declare-fun m!1252493 () Bool)

(assert (=> b!1367910 m!1252493))

(declare-fun m!1252495 () Bool)

(assert (=> b!1367909 m!1252495))

(assert (=> b!1367691 d!147119))

(declare-fun d!147121 () Bool)

(assert (=> d!147121 (= (validKeyInArray!0 (select (arr!44887 a!3861) from!3239)) (and (not (= (select (arr!44887 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44887 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1367693 d!147121))

(declare-fun b!1367917 () Bool)

(declare-fun e!775428 () Bool)

(declare-fun e!775429 () Bool)

(assert (=> b!1367917 (= e!775428 e!775429)))

(declare-fun c!128061 () Bool)

(assert (=> b!1367917 (= c!128061 (validKeyInArray!0 (select (arr!44887 a!3861) from!3239)))))

(declare-fun d!147129 () Bool)

(declare-fun res!910690 () Bool)

(declare-fun e!775430 () Bool)

(assert (=> d!147129 (=> res!910690 e!775430)))

(assert (=> d!147129 (= res!910690 (bvsge from!3239 (size!45438 a!3861)))))

(assert (=> d!147129 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775430)))

(declare-fun b!1367918 () Bool)

(assert (=> b!1367918 (= e!775430 e!775428)))

(declare-fun res!910692 () Bool)

(assert (=> b!1367918 (=> (not res!910692) (not e!775428))))

(declare-fun e!775431 () Bool)

(assert (=> b!1367918 (= res!910692 (not e!775431))))

(declare-fun res!910691 () Bool)

(assert (=> b!1367918 (=> (not res!910691) (not e!775431))))

(assert (=> b!1367918 (= res!910691 (validKeyInArray!0 (select (arr!44887 a!3861) from!3239)))))

(declare-fun b!1367919 () Bool)

(declare-fun call!65535 () Bool)

(assert (=> b!1367919 (= e!775429 call!65535)))

(declare-fun bm!65532 () Bool)

(assert (=> bm!65532 (= call!65535 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128061 (Cons!31938 (select (arr!44887 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1367920 () Bool)

(assert (=> b!1367920 (= e!775429 call!65535)))

(declare-fun b!1367921 () Bool)

(assert (=> b!1367921 (= e!775431 (contains!9627 acc!866 (select (arr!44887 a!3861) from!3239)))))

(assert (= (and d!147129 (not res!910690)) b!1367918))

(assert (= (and b!1367918 res!910691) b!1367921))

(assert (= (and b!1367918 res!910692) b!1367917))

(assert (= (and b!1367917 c!128061) b!1367919))

(assert (= (and b!1367917 (not c!128061)) b!1367920))

(assert (= (or b!1367919 b!1367920) bm!65532))

(assert (=> b!1367917 m!1252297))

(assert (=> b!1367917 m!1252297))

(assert (=> b!1367917 m!1252307))

(assert (=> b!1367918 m!1252297))

(assert (=> b!1367918 m!1252297))

(assert (=> b!1367918 m!1252307))

(assert (=> bm!65532 m!1252297))

(declare-fun m!1252511 () Bool)

(assert (=> bm!65532 m!1252511))

(assert (=> b!1367921 m!1252297))

(assert (=> b!1367921 m!1252297))

(assert (=> b!1367921 m!1252299))

(assert (=> b!1367694 d!147129))

(declare-fun d!147133 () Bool)

(assert (=> d!147133 (noDuplicate!2458 newAcc!98)))

(declare-fun lt!602089 () Unit!45044)

(declare-fun choose!1995 (List!31942 List!31942) Unit!45044)

(assert (=> d!147133 (= lt!602089 (choose!1995 newAcc!98 acc!866))))

(declare-fun e!775452 () Bool)

(assert (=> d!147133 e!775452))

(declare-fun res!910712 () Bool)

(assert (=> d!147133 (=> (not res!910712) (not e!775452))))

(assert (=> d!147133 (= res!910712 (subseq!986 newAcc!98 acc!866))))

(assert (=> d!147133 (= (noDuplicateSubseq!173 newAcc!98 acc!866) lt!602089)))

(declare-fun b!1367943 () Bool)

(assert (=> b!1367943 (= e!775452 (noDuplicate!2458 acc!866))))

(assert (= (and d!147133 res!910712) b!1367943))

(declare-fun m!1252537 () Bool)

(assert (=> d!147133 m!1252537))

(declare-fun m!1252539 () Bool)

(assert (=> d!147133 m!1252539))

(assert (=> d!147133 m!1252309))

(assert (=> b!1367943 m!1252315))

(assert (=> b!1367694 d!147133))

(check-sat (not b!1367801) (not b!1367921) (not b!1367882) (not b!1367838) (not b!1367837) (not d!147133) (not d!147079) (not b!1367917) (not b!1367892) (not b!1367885) (not b!1367906) (not b!1367902) (not bm!65530) (not b!1367910) (not b!1367918) (not d!147107) (not b!1367881) (not b!1367909) (not b!1367943) (not b!1367894) (not b!1367803) (not b!1367905) (not d!147069) (not d!147115) (not b!1367800) (not b!1367779) (not bm!65532) (not d!147111) (not d!147101))
(check-sat)
