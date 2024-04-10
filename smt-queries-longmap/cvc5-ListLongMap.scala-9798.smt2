; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116354 () Bool)

(assert start!116354)

(declare-fun b!1373360 () Bool)

(declare-fun res!916612 () Bool)

(declare-fun e!777950 () Bool)

(assert (=> b!1373360 (=> (not res!916612) (not e!777950))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93132 0))(
  ( (array!93133 (arr!44975 (Array (_ BitVec 32) (_ BitVec 64))) (size!45525 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93132)

(assert (=> b!1373360 (= res!916612 (bvslt from!3239 (size!45525 a!3861)))))

(declare-fun b!1373361 () Bool)

(declare-fun res!916605 () Bool)

(assert (=> b!1373361 (=> (not res!916605) (not e!777950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373361 (= res!916605 (not (validKeyInArray!0 (select (arr!44975 a!3861) from!3239))))))

(declare-fun b!1373362 () Bool)

(declare-fun res!916606 () Bool)

(assert (=> b!1373362 (=> (not res!916606) (not e!777950))))

(declare-datatypes ((List!32043 0))(
  ( (Nil!32040) (Cons!32039 (h!33248 (_ BitVec 64)) (t!46737 List!32043)) )
))
(declare-fun acc!866 () List!32043)

(declare-fun arrayNoDuplicates!0 (array!93132 (_ BitVec 32) List!32043) Bool)

(assert (=> b!1373362 (= res!916606 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373363 () Bool)

(declare-fun e!777951 () Bool)

(assert (=> b!1373363 (= e!777951 e!777950)))

(declare-fun res!916604 () Bool)

(assert (=> b!1373363 (=> (not res!916604) (not e!777950))))

(assert (=> b!1373363 (= res!916604 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45387 0))(
  ( (Unit!45388) )
))
(declare-fun lt!603039 () Unit!45387)

(declare-fun newAcc!98 () List!32043)

(declare-fun noDuplicateSubseq!314 (List!32043 List!32043) Unit!45387)

(assert (=> b!1373363 (= lt!603039 (noDuplicateSubseq!314 newAcc!98 acc!866))))

(declare-fun b!1373364 () Bool)

(declare-fun res!916608 () Bool)

(assert (=> b!1373364 (=> (not res!916608) (not e!777950))))

(assert (=> b!1373364 (= res!916608 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373365 () Bool)

(declare-fun res!916614 () Bool)

(assert (=> b!1373365 (=> (not res!916614) (not e!777951))))

(declare-fun subseq!1127 (List!32043 List!32043) Bool)

(assert (=> b!1373365 (= res!916614 (subseq!1127 newAcc!98 acc!866))))

(declare-fun b!1373366 () Bool)

(declare-fun res!916610 () Bool)

(assert (=> b!1373366 (=> (not res!916610) (not e!777951))))

(declare-fun noDuplicate!2582 (List!32043) Bool)

(assert (=> b!1373366 (= res!916610 (noDuplicate!2582 acc!866))))

(declare-fun b!1373367 () Bool)

(declare-fun res!916613 () Bool)

(assert (=> b!1373367 (=> (not res!916613) (not e!777951))))

(declare-fun contains!9725 (List!32043 (_ BitVec 64)) Bool)

(assert (=> b!1373367 (= res!916613 (not (contains!9725 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373368 () Bool)

(declare-fun res!916609 () Bool)

(assert (=> b!1373368 (=> (not res!916609) (not e!777951))))

(assert (=> b!1373368 (= res!916609 (not (contains!9725 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373369 () Bool)

(declare-fun res!916611 () Bool)

(assert (=> b!1373369 (=> (not res!916611) (not e!777951))))

(assert (=> b!1373369 (= res!916611 (not (contains!9725 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373371 () Bool)

(declare-fun res!916607 () Bool)

(assert (=> b!1373371 (=> (not res!916607) (not e!777951))))

(assert (=> b!1373371 (= res!916607 (not (contains!9725 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916615 () Bool)

(assert (=> start!116354 (=> (not res!916615) (not e!777951))))

(assert (=> start!116354 (= res!916615 (and (bvslt (size!45525 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45525 a!3861))))))

(assert (=> start!116354 e!777951))

(declare-fun array_inv!34003 (array!93132) Bool)

(assert (=> start!116354 (array_inv!34003 a!3861)))

(assert (=> start!116354 true))

(declare-fun b!1373370 () Bool)

(assert (=> b!1373370 (= e!777950 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (=> b!1373370 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!603040 () Unit!45387)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93132 List!32043 List!32043 (_ BitVec 32)) Unit!45387)

(assert (=> b!1373370 (= lt!603040 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (= (and start!116354 res!916615) b!1373366))

(assert (= (and b!1373366 res!916610) b!1373369))

(assert (= (and b!1373369 res!916611) b!1373371))

(assert (= (and b!1373371 res!916607) b!1373368))

(assert (= (and b!1373368 res!916609) b!1373367))

(assert (= (and b!1373367 res!916613) b!1373365))

(assert (= (and b!1373365 res!916614) b!1373363))

(assert (= (and b!1373363 res!916604) b!1373360))

(assert (= (and b!1373360 res!916612) b!1373361))

(assert (= (and b!1373361 res!916605) b!1373364))

(assert (= (and b!1373364 res!916608) b!1373362))

(assert (= (and b!1373362 res!916606) b!1373370))

(declare-fun m!1256617 () Bool)

(assert (=> b!1373363 m!1256617))

(declare-fun m!1256619 () Bool)

(assert (=> b!1373363 m!1256619))

(declare-fun m!1256621 () Bool)

(assert (=> b!1373370 m!1256621))

(declare-fun m!1256623 () Bool)

(assert (=> b!1373370 m!1256623))

(declare-fun m!1256625 () Bool)

(assert (=> b!1373370 m!1256625))

(declare-fun m!1256627 () Bool)

(assert (=> b!1373368 m!1256627))

(declare-fun m!1256629 () Bool)

(assert (=> b!1373362 m!1256629))

(declare-fun m!1256631 () Bool)

(assert (=> b!1373371 m!1256631))

(declare-fun m!1256633 () Bool)

(assert (=> start!116354 m!1256633))

(declare-fun m!1256635 () Bool)

(assert (=> b!1373366 m!1256635))

(declare-fun m!1256637 () Bool)

(assert (=> b!1373367 m!1256637))

(declare-fun m!1256639 () Bool)

(assert (=> b!1373361 m!1256639))

(assert (=> b!1373361 m!1256639))

(declare-fun m!1256641 () Bool)

(assert (=> b!1373361 m!1256641))

(declare-fun m!1256643 () Bool)

(assert (=> b!1373369 m!1256643))

(declare-fun m!1256645 () Bool)

(assert (=> b!1373365 m!1256645))

(push 1)

(assert (not b!1373371))

(assert (not b!1373366))

(assert (not start!116354))

(assert (not b!1373370))

(assert (not b!1373369))

(assert (not b!1373363))

(assert (not b!1373362))

(assert (not b!1373367))

(assert (not b!1373365))

(assert (not b!1373361))

(assert (not b!1373368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147965 () Bool)

(declare-fun lt!603062 () Bool)

(declare-fun content!751 (List!32043) (Set (_ BitVec 64)))

(assert (=> d!147965 (= lt!603062 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!751 acc!866)))))

(declare-fun e!778004 () Bool)

(assert (=> d!147965 (= lt!603062 e!778004)))

(declare-fun res!916719 () Bool)

(assert (=> d!147965 (=> (not res!916719) (not e!778004))))

(assert (=> d!147965 (= res!916719 (is-Cons!32039 acc!866))))

(assert (=> d!147965 (= (contains!9725 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603062)))

(declare-fun b!1373480 () Bool)

(declare-fun e!778005 () Bool)

(assert (=> b!1373480 (= e!778004 e!778005)))

(declare-fun res!916718 () Bool)

(assert (=> b!1373480 (=> res!916718 e!778005)))

(assert (=> b!1373480 (= res!916718 (= (h!33248 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373481 () Bool)

(assert (=> b!1373481 (= e!778005 (contains!9725 (t!46737 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147965 res!916719) b!1373480))

(assert (= (and b!1373480 (not res!916718)) b!1373481))

(declare-fun m!1256731 () Bool)

(assert (=> d!147965 m!1256731))

(declare-fun m!1256733 () Bool)

(assert (=> d!147965 m!1256733))

(declare-fun m!1256735 () Bool)

(assert (=> b!1373481 m!1256735))

(assert (=> b!1373369 d!147965))

(declare-fun d!147975 () Bool)

(declare-fun lt!603063 () Bool)

(assert (=> d!147975 (= lt!603063 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!751 newAcc!98)))))

(declare-fun e!778006 () Bool)

(assert (=> d!147975 (= lt!603063 e!778006)))

(declare-fun res!916721 () Bool)

(assert (=> d!147975 (=> (not res!916721) (not e!778006))))

(assert (=> d!147975 (= res!916721 (is-Cons!32039 newAcc!98))))

(assert (=> d!147975 (= (contains!9725 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603063)))

(declare-fun b!1373482 () Bool)

(declare-fun e!778007 () Bool)

(assert (=> b!1373482 (= e!778006 e!778007)))

(declare-fun res!916720 () Bool)

(assert (=> b!1373482 (=> res!916720 e!778007)))

(assert (=> b!1373482 (= res!916720 (= (h!33248 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373483 () Bool)

(assert (=> b!1373483 (= e!778007 (contains!9725 (t!46737 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147975 res!916721) b!1373482))

(assert (= (and b!1373482 (not res!916720)) b!1373483))

(declare-fun m!1256737 () Bool)

(assert (=> d!147975 m!1256737))

(declare-fun m!1256739 () Bool)

(assert (=> d!147975 m!1256739))

(declare-fun m!1256741 () Bool)

(assert (=> b!1373483 m!1256741))

(assert (=> b!1373368 d!147975))

(declare-fun d!147977 () Bool)

(declare-fun lt!603064 () Bool)

(assert (=> d!147977 (= lt!603064 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!751 newAcc!98)))))

(declare-fun e!778008 () Bool)

(assert (=> d!147977 (= lt!603064 e!778008)))

(declare-fun res!916723 () Bool)

(assert (=> d!147977 (=> (not res!916723) (not e!778008))))

(assert (=> d!147977 (= res!916723 (is-Cons!32039 newAcc!98))))

(assert (=> d!147977 (= (contains!9725 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603064)))

(declare-fun b!1373484 () Bool)

(declare-fun e!778009 () Bool)

(assert (=> b!1373484 (= e!778008 e!778009)))

(declare-fun res!916722 () Bool)

(assert (=> b!1373484 (=> res!916722 e!778009)))

(assert (=> b!1373484 (= res!916722 (= (h!33248 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373485 () Bool)

(assert (=> b!1373485 (= e!778009 (contains!9725 (t!46737 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147977 res!916723) b!1373484))

(assert (= (and b!1373484 (not res!916722)) b!1373485))

(assert (=> d!147977 m!1256737))

(declare-fun m!1256743 () Bool)

(assert (=> d!147977 m!1256743))

(declare-fun m!1256745 () Bool)

(assert (=> b!1373485 m!1256745))

(assert (=> b!1373367 d!147977))

(declare-fun d!147979 () Bool)

(assert (=> d!147979 (= (validKeyInArray!0 (select (arr!44975 a!3861) from!3239)) (and (not (= (select (arr!44975 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44975 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373361 d!147979))

(declare-fun d!147981 () Bool)

(declare-fun lt!603067 () Bool)

(assert (=> d!147981 (= lt!603067 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!751 acc!866)))))

(declare-fun e!778014 () Bool)

(assert (=> d!147981 (= lt!603067 e!778014)))

(declare-fun res!916729 () Bool)

(assert (=> d!147981 (=> (not res!916729) (not e!778014))))

(assert (=> d!147981 (= res!916729 (is-Cons!32039 acc!866))))

(assert (=> d!147981 (= (contains!9725 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603067)))

(declare-fun b!1373490 () Bool)

(declare-fun e!778015 () Bool)

(assert (=> b!1373490 (= e!778014 e!778015)))

(declare-fun res!916728 () Bool)

(assert (=> b!1373490 (=> res!916728 e!778015)))

(assert (=> b!1373490 (= res!916728 (= (h!33248 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373491 () Bool)

(assert (=> b!1373491 (= e!778015 (contains!9725 (t!46737 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147981 res!916729) b!1373490))

(assert (= (and b!1373490 (not res!916728)) b!1373491))

(assert (=> d!147981 m!1256731))

(declare-fun m!1256747 () Bool)

(assert (=> d!147981 m!1256747))

(declare-fun m!1256749 () Bool)

(assert (=> b!1373491 m!1256749))

(assert (=> b!1373371 d!147981))

(declare-fun b!1373533 () Bool)

(declare-fun e!778051 () Bool)

(declare-fun call!65623 () Bool)

(assert (=> b!1373533 (= e!778051 call!65623)))

(declare-fun d!147983 () Bool)

(declare-fun res!916758 () Bool)

(declare-fun e!778052 () Bool)

(assert (=> d!147983 (=> res!916758 e!778052)))

(assert (=> d!147983 (= res!916758 (bvsge from!3239 (size!45525 a!3861)))))

(assert (=> d!147983 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778052)))

(declare-fun b!1373534 () Bool)

(declare-fun e!778053 () Bool)

(assert (=> b!1373534 (= e!778053 e!778051)))

(declare-fun c!127828 () Bool)

(assert (=> b!1373534 (= c!127828 (validKeyInArray!0 (select (arr!44975 a!3861) from!3239)))))

(declare-fun bm!65620 () Bool)

(assert (=> bm!65620 (= call!65623 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127828 (Cons!32039 (select (arr!44975 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun e!778050 () Bool)

(declare-fun b!1373535 () Bool)

(assert (=> b!1373535 (= e!778050 (contains!9725 newAcc!98 (select (arr!44975 a!3861) from!3239)))))

(declare-fun b!1373536 () Bool)

(assert (=> b!1373536 (= e!778052 e!778053)))

(declare-fun res!916757 () Bool)

(assert (=> b!1373536 (=> (not res!916757) (not e!778053))))

(assert (=> b!1373536 (= res!916757 (not e!778050))))

(declare-fun res!916759 () Bool)

(assert (=> b!1373536 (=> (not res!916759) (not e!778050))))

(assert (=> b!1373536 (= res!916759 (validKeyInArray!0 (select (arr!44975 a!3861) from!3239)))))

(declare-fun b!1373537 () Bool)

(assert (=> b!1373537 (= e!778051 call!65623)))

(assert (= (and d!147983 (not res!916758)) b!1373536))

(assert (= (and b!1373536 res!916759) b!1373535))

(assert (= (and b!1373536 res!916757) b!1373534))

(assert (= (and b!1373534 c!127828) b!1373537))

(assert (= (and b!1373534 (not c!127828)) b!1373533))

(assert (= (or b!1373537 b!1373533) bm!65620))

(assert (=> b!1373534 m!1256639))

(assert (=> b!1373534 m!1256639))

(assert (=> b!1373534 m!1256641))

(assert (=> bm!65620 m!1256639))

(declare-fun m!1256789 () Bool)

(assert (=> bm!65620 m!1256789))

(assert (=> b!1373535 m!1256639))

(assert (=> b!1373535 m!1256639))

(declare-fun m!1256791 () Bool)

(assert (=> b!1373535 m!1256791))

(assert (=> b!1373536 m!1256639))

(assert (=> b!1373536 m!1256639))

(assert (=> b!1373536 m!1256641))

(assert (=> b!1373370 d!147983))

(declare-fun b!1373546 () Bool)

(declare-fun e!778063 () Bool)

(declare-fun call!65624 () Bool)

(assert (=> b!1373546 (= e!778063 call!65624)))

(declare-fun d!148001 () Bool)

(declare-fun res!916769 () Bool)

(declare-fun e!778064 () Bool)

(assert (=> d!148001 (=> res!916769 e!778064)))

(assert (=> d!148001 (= res!916769 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45525 a!3861)))))

(assert (=> d!148001 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!778064)))

(declare-fun b!1373547 () Bool)

(declare-fun e!778065 () Bool)

(assert (=> b!1373547 (= e!778065 e!778063)))

(declare-fun c!127829 () Bool)

(assert (=> b!1373547 (= c!127829 (validKeyInArray!0 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65621 () Bool)

(assert (=> bm!65621 (= call!65624 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127829 (Cons!32039 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun e!778062 () Bool)

(declare-fun b!1373548 () Bool)

(assert (=> b!1373548 (= e!778062 (contains!9725 newAcc!98 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373549 () Bool)

(assert (=> b!1373549 (= e!778064 e!778065)))

(declare-fun res!916768 () Bool)

(assert (=> b!1373549 (=> (not res!916768) (not e!778065))))

(assert (=> b!1373549 (= res!916768 (not e!778062))))

(declare-fun res!916770 () Bool)

(assert (=> b!1373549 (=> (not res!916770) (not e!778062))))

(assert (=> b!1373549 (= res!916770 (validKeyInArray!0 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373550 () Bool)

(assert (=> b!1373550 (= e!778063 call!65624)))

(assert (= (and d!148001 (not res!916769)) b!1373549))

(assert (= (and b!1373549 res!916770) b!1373548))

(assert (= (and b!1373549 res!916768) b!1373547))

(assert (= (and b!1373547 c!127829) b!1373550))

(assert (= (and b!1373547 (not c!127829)) b!1373546))

(assert (= (or b!1373550 b!1373546) bm!65621))

(declare-fun m!1256797 () Bool)

(assert (=> b!1373547 m!1256797))

(assert (=> b!1373547 m!1256797))

(declare-fun m!1256799 () Bool)

(assert (=> b!1373547 m!1256799))

(assert (=> bm!65621 m!1256797))

(declare-fun m!1256801 () Bool)

(assert (=> bm!65621 m!1256801))

(assert (=> b!1373548 m!1256797))

(assert (=> b!1373548 m!1256797))

(declare-fun m!1256803 () Bool)

(assert (=> b!1373548 m!1256803))

(assert (=> b!1373549 m!1256797))

(assert (=> b!1373549 m!1256797))

(assert (=> b!1373549 m!1256799))

(assert (=> b!1373370 d!148001))

(declare-fun d!148007 () Bool)

(assert (=> d!148007 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!603079 () Unit!45387)

(declare-fun choose!80 (array!93132 List!32043 List!32043 (_ BitVec 32)) Unit!45387)

(assert (=> d!148007 (= lt!603079 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!148007 (bvslt (size!45525 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!148007 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!603079)))

(declare-fun bs!39367 () Bool)

(assert (= bs!39367 d!148007))

(assert (=> bs!39367 m!1256623))

(declare-fun m!1256821 () Bool)

(assert (=> bs!39367 m!1256821))

(assert (=> b!1373370 d!148007))

(declare-fun d!148017 () Bool)

(assert (=> d!148017 (= (array_inv!34003 a!3861) (bvsge (size!45525 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116354 d!148017))

(declare-fun b!1373574 () Bool)

(declare-fun e!778089 () Bool)

(declare-fun call!65626 () Bool)

(assert (=> b!1373574 (= e!778089 call!65626)))

(declare-fun d!148019 () Bool)

(declare-fun res!916793 () Bool)

(declare-fun e!778090 () Bool)

(assert (=> d!148019 (=> res!916793 e!778090)))

(assert (=> d!148019 (= res!916793 (bvsge from!3239 (size!45525 a!3861)))))

(assert (=> d!148019 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778090)))

(declare-fun b!1373575 () Bool)

(declare-fun e!778091 () Bool)

(assert (=> b!1373575 (= e!778091 e!778089)))

(declare-fun c!127831 () Bool)

(assert (=> b!1373575 (= c!127831 (validKeyInArray!0 (select (arr!44975 a!3861) from!3239)))))

(declare-fun bm!65623 () Bool)

(assert (=> bm!65623 (= call!65626 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127831 (Cons!32039 (select (arr!44975 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun e!778088 () Bool)

(declare-fun b!1373576 () Bool)

(assert (=> b!1373576 (= e!778088 (contains!9725 acc!866 (select (arr!44975 a!3861) from!3239)))))

(declare-fun b!1373577 () Bool)

(assert (=> b!1373577 (= e!778090 e!778091)))

(declare-fun res!916792 () Bool)

(assert (=> b!1373577 (=> (not res!916792) (not e!778091))))

(assert (=> b!1373577 (= res!916792 (not e!778088))))

(declare-fun res!916794 () Bool)

(assert (=> b!1373577 (=> (not res!916794) (not e!778088))))

(assert (=> b!1373577 (= res!916794 (validKeyInArray!0 (select (arr!44975 a!3861) from!3239)))))

(declare-fun b!1373578 () Bool)

(assert (=> b!1373578 (= e!778089 call!65626)))

(assert (= (and d!148019 (not res!916793)) b!1373577))

(assert (= (and b!1373577 res!916794) b!1373576))

(assert (= (and b!1373577 res!916792) b!1373575))

(assert (= (and b!1373575 c!127831) b!1373578))

(assert (= (and b!1373575 (not c!127831)) b!1373574))

(assert (= (or b!1373578 b!1373574) bm!65623))

(assert (=> b!1373575 m!1256639))

(assert (=> b!1373575 m!1256639))

(assert (=> b!1373575 m!1256641))

(assert (=> bm!65623 m!1256639))

(declare-fun m!1256827 () Bool)

(assert (=> bm!65623 m!1256827))

(assert (=> b!1373576 m!1256639))

(assert (=> b!1373576 m!1256639))

(declare-fun m!1256829 () Bool)

(assert (=> b!1373576 m!1256829))

(assert (=> b!1373577 m!1256639))

(assert (=> b!1373577 m!1256639))

(assert (=> b!1373577 m!1256641))

(assert (=> b!1373363 d!148019))

(declare-fun d!148023 () Bool)

(assert (=> d!148023 (noDuplicate!2582 newAcc!98)))

(declare-fun lt!603085 () Unit!45387)

(declare-fun choose!2026 (List!32043 List!32043) Unit!45387)

(assert (=> d!148023 (= lt!603085 (choose!2026 newAcc!98 acc!866))))

(declare-fun e!778117 () Bool)

(assert (=> d!148023 e!778117))

(declare-fun res!916817 () Bool)

(assert (=> d!148023 (=> (not res!916817) (not e!778117))))

(assert (=> d!148023 (= res!916817 (subseq!1127 newAcc!98 acc!866))))

(assert (=> d!148023 (= (noDuplicateSubseq!314 newAcc!98 acc!866) lt!603085)))

(declare-fun b!1373607 () Bool)

(assert (=> b!1373607 (= e!778117 (noDuplicate!2582 acc!866))))

(assert (= (and d!148023 res!916817) b!1373607))

(declare-fun m!1256843 () Bool)

(assert (=> d!148023 m!1256843))

(declare-fun m!1256847 () Bool)

(assert (=> d!148023 m!1256847))

(assert (=> d!148023 m!1256645))

(assert (=> b!1373607 m!1256635))

(assert (=> b!1373363 d!148023))

(declare-fun b!1373610 () Bool)

(declare-fun e!778121 () Bool)

(declare-fun call!65630 () Bool)

(assert (=> b!1373610 (= e!778121 call!65630)))

(declare-fun d!148031 () Bool)

(declare-fun res!916821 () Bool)

(declare-fun e!778122 () Bool)

(assert (=> d!148031 (=> res!916821 e!778122)))

(assert (=> d!148031 (= res!916821 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45525 a!3861)))))

(assert (=> d!148031 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!778122)))

(declare-fun b!1373611 () Bool)

(declare-fun e!778123 () Bool)

(assert (=> b!1373611 (= e!778123 e!778121)))

(declare-fun c!127835 () Bool)

(assert (=> b!1373611 (= c!127835 (validKeyInArray!0 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65627 () Bool)

(assert (=> bm!65627 (= call!65630 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127835 (Cons!32039 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun e!778120 () Bool)

(declare-fun b!1373612 () Bool)

(assert (=> b!1373612 (= e!778120 (contains!9725 acc!866 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373613 () Bool)

(assert (=> b!1373613 (= e!778122 e!778123)))

(declare-fun res!916820 () Bool)

(assert (=> b!1373613 (=> (not res!916820) (not e!778123))))

(assert (=> b!1373613 (= res!916820 (not e!778120))))

(declare-fun res!916822 () Bool)

(assert (=> b!1373613 (=> (not res!916822) (not e!778120))))

(assert (=> b!1373613 (= res!916822 (validKeyInArray!0 (select (arr!44975 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373614 () Bool)

(assert (=> b!1373614 (= e!778121 call!65630)))

(assert (= (and d!148031 (not res!916821)) b!1373613))

(assert (= (and b!1373613 res!916822) b!1373612))

(assert (= (and b!1373613 res!916820) b!1373611))

(assert (= (and b!1373611 c!127835) b!1373614))

(assert (= (and b!1373611 (not c!127835)) b!1373610))

(assert (= (or b!1373614 b!1373610) bm!65627))

(assert (=> b!1373611 m!1256797))

(assert (=> b!1373611 m!1256797))

(assert (=> b!1373611 m!1256799))

(assert (=> bm!65627 m!1256797))

(declare-fun m!1256855 () Bool)

(assert (=> bm!65627 m!1256855))

(assert (=> b!1373612 m!1256797))

(assert (=> b!1373612 m!1256797))

