; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93486 () Bool)

(assert start!93486)

(declare-fun b!1058635 () Bool)

(declare-fun res!706535 () Bool)

(declare-fun e!602128 () Bool)

(assert (=> b!1058635 (=> (not res!706535) (not e!602128))))

(declare-datatypes ((array!66739 0))(
  ( (array!66740 (arr!32086 (Array (_ BitVec 32) (_ BitVec 64))) (size!32623 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66739)

(declare-datatypes ((List!22368 0))(
  ( (Nil!22365) (Cons!22364 (h!23582 (_ BitVec 64)) (t!31667 List!22368)) )
))
(declare-fun arrayNoDuplicates!0 (array!66739 (_ BitVec 32) List!22368) Bool)

(assert (=> b!1058635 (= res!706535 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22365))))

(declare-fun res!706534 () Bool)

(assert (=> start!93486 (=> (not res!706534) (not e!602128))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!93486 (= res!706534 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32623 a!3488)) (bvslt (size!32623 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93486 e!602128))

(assert (=> start!93486 true))

(declare-fun array_inv!24868 (array!66739) Bool)

(assert (=> start!93486 (array_inv!24868 a!3488)))

(declare-fun b!1058636 () Bool)

(declare-fun e!602126 () Bool)

(declare-fun e!602125 () Bool)

(assert (=> b!1058636 (= e!602126 e!602125)))

(declare-fun res!706537 () Bool)

(assert (=> b!1058636 (=> res!706537 e!602125)))

(declare-fun lt!466927 () (_ BitVec 32))

(assert (=> b!1058636 (= res!706537 (or (bvsgt lt!466927 i!1381) (bvsle i!1381 lt!466927)))))

(declare-fun b!1058637 () Bool)

(declare-fun e!602122 () Bool)

(assert (=> b!1058637 (= e!602128 e!602122)))

(declare-fun res!706532 () Bool)

(assert (=> b!1058637 (=> (not res!706532) (not e!602122))))

(declare-fun lt!466925 () array!66739)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058637 (= res!706532 (arrayContainsKey!0 lt!466925 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058637 (= lt!466925 (array!66740 (store (arr!32086 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32623 a!3488)))))

(declare-fun b!1058638 () Bool)

(declare-fun res!706538 () Bool)

(assert (=> b!1058638 (=> (not res!706538) (not e!602128))))

(assert (=> b!1058638 (= res!706538 (= (select (arr!32086 a!3488) i!1381) k0!2747))))

(declare-fun b!1058639 () Bool)

(assert (=> b!1058639 (= e!602125 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058640 () Bool)

(declare-fun e!602127 () Bool)

(declare-fun e!602124 () Bool)

(assert (=> b!1058640 (= e!602127 (not e!602124))))

(declare-fun res!706536 () Bool)

(assert (=> b!1058640 (=> res!706536 e!602124)))

(assert (=> b!1058640 (= res!706536 (or (bvsgt lt!466927 i!1381) (bvsle i!1381 lt!466927)))))

(assert (=> b!1058640 e!602126))

(declare-fun res!706531 () Bool)

(assert (=> b!1058640 (=> (not res!706531) (not e!602126))))

(assert (=> b!1058640 (= res!706531 (= (select (store (arr!32086 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466927) k0!2747))))

(declare-fun b!1058641 () Bool)

(declare-fun res!706533 () Bool)

(assert (=> b!1058641 (=> (not res!706533) (not e!602128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058641 (= res!706533 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058642 () Bool)

(assert (=> b!1058642 (= e!602124 (bvsge lt!466927 #b00000000000000000000000000000000))))

(declare-fun lt!466928 () (_ BitVec 32))

(assert (=> b!1058642 (arrayContainsKey!0 a!3488 k0!2747 lt!466928)))

(declare-datatypes ((Unit!34663 0))(
  ( (Unit!34664) )
))
(declare-fun lt!466926 () Unit!34663)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34663)

(assert (=> b!1058642 (= lt!466926 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466928))))

(assert (=> b!1058642 (= lt!466928 (bvadd #b00000000000000000000000000000001 lt!466927))))

(assert (=> b!1058642 (arrayNoDuplicates!0 a!3488 lt!466927 Nil!22365)))

(declare-fun lt!466924 () Unit!34663)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66739 (_ BitVec 32) (_ BitVec 32)) Unit!34663)

(assert (=> b!1058642 (= lt!466924 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466927))))

(declare-fun b!1058643 () Bool)

(assert (=> b!1058643 (= e!602122 e!602127)))

(declare-fun res!706530 () Bool)

(assert (=> b!1058643 (=> (not res!706530) (not e!602127))))

(assert (=> b!1058643 (= res!706530 (not (= lt!466927 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66739 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058643 (= lt!466927 (arrayScanForKey!0 lt!466925 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93486 res!706534) b!1058635))

(assert (= (and b!1058635 res!706535) b!1058641))

(assert (= (and b!1058641 res!706533) b!1058638))

(assert (= (and b!1058638 res!706538) b!1058637))

(assert (= (and b!1058637 res!706532) b!1058643))

(assert (= (and b!1058643 res!706530) b!1058640))

(assert (= (and b!1058640 res!706531) b!1058636))

(assert (= (and b!1058636 (not res!706537)) b!1058639))

(assert (= (and b!1058640 (not res!706536)) b!1058642))

(declare-fun m!978689 () Bool)

(assert (=> b!1058638 m!978689))

(declare-fun m!978691 () Bool)

(assert (=> start!93486 m!978691))

(declare-fun m!978693 () Bool)

(assert (=> b!1058639 m!978693))

(declare-fun m!978695 () Bool)

(assert (=> b!1058642 m!978695))

(declare-fun m!978697 () Bool)

(assert (=> b!1058642 m!978697))

(declare-fun m!978699 () Bool)

(assert (=> b!1058642 m!978699))

(declare-fun m!978701 () Bool)

(assert (=> b!1058642 m!978701))

(declare-fun m!978703 () Bool)

(assert (=> b!1058643 m!978703))

(declare-fun m!978705 () Bool)

(assert (=> b!1058640 m!978705))

(declare-fun m!978707 () Bool)

(assert (=> b!1058640 m!978707))

(declare-fun m!978709 () Bool)

(assert (=> b!1058635 m!978709))

(declare-fun m!978711 () Bool)

(assert (=> b!1058641 m!978711))

(declare-fun m!978713 () Bool)

(assert (=> b!1058637 m!978713))

(assert (=> b!1058637 m!978705))

(check-sat (not b!1058642) (not b!1058641) (not b!1058635) (not b!1058637) (not b!1058643) (not b!1058639) (not start!93486))
(check-sat)
(get-model)

(declare-fun d!128849 () Bool)

(declare-fun res!706601 () Bool)

(declare-fun e!602182 () Bool)

(assert (=> d!128849 (=> res!706601 e!602182)))

(assert (=> d!128849 (= res!706601 (bvsge #b00000000000000000000000000000000 (size!32623 a!3488)))))

(assert (=> d!128849 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22365) e!602182)))

(declare-fun b!1058708 () Bool)

(declare-fun e!602181 () Bool)

(declare-fun contains!6221 (List!22368 (_ BitVec 64)) Bool)

(assert (=> b!1058708 (= e!602181 (contains!6221 Nil!22365 (select (arr!32086 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1058709 () Bool)

(declare-fun e!602180 () Bool)

(declare-fun call!44906 () Bool)

(assert (=> b!1058709 (= e!602180 call!44906)))

(declare-fun b!1058710 () Bool)

(declare-fun e!602179 () Bool)

(assert (=> b!1058710 (= e!602182 e!602179)))

(declare-fun res!706599 () Bool)

(assert (=> b!1058710 (=> (not res!706599) (not e!602179))))

(assert (=> b!1058710 (= res!706599 (not e!602181))))

(declare-fun res!706600 () Bool)

(assert (=> b!1058710 (=> (not res!706600) (not e!602181))))

(assert (=> b!1058710 (= res!706600 (validKeyInArray!0 (select (arr!32086 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1058711 () Bool)

(assert (=> b!1058711 (= e!602180 call!44906)))

(declare-fun bm!44903 () Bool)

(declare-fun c!107522 () Bool)

(assert (=> bm!44903 (= call!44906 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107522 (Cons!22364 (select (arr!32086 a!3488) #b00000000000000000000000000000000) Nil!22365) Nil!22365)))))

(declare-fun b!1058712 () Bool)

(assert (=> b!1058712 (= e!602179 e!602180)))

(assert (=> b!1058712 (= c!107522 (validKeyInArray!0 (select (arr!32086 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128849 (not res!706601)) b!1058710))

(assert (= (and b!1058710 res!706600) b!1058708))

(assert (= (and b!1058710 res!706599) b!1058712))

(assert (= (and b!1058712 c!107522) b!1058711))

(assert (= (and b!1058712 (not c!107522)) b!1058709))

(assert (= (or b!1058711 b!1058709) bm!44903))

(declare-fun m!978767 () Bool)

(assert (=> b!1058708 m!978767))

(assert (=> b!1058708 m!978767))

(declare-fun m!978769 () Bool)

(assert (=> b!1058708 m!978769))

(assert (=> b!1058710 m!978767))

(assert (=> b!1058710 m!978767))

(declare-fun m!978771 () Bool)

(assert (=> b!1058710 m!978771))

(assert (=> bm!44903 m!978767))

(declare-fun m!978773 () Bool)

(assert (=> bm!44903 m!978773))

(assert (=> b!1058712 m!978767))

(assert (=> b!1058712 m!978767))

(assert (=> b!1058712 m!978771))

(assert (=> b!1058635 d!128849))

(declare-fun d!128851 () Bool)

(assert (=> d!128851 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1058641 d!128851))

(declare-fun d!128853 () Bool)

(declare-fun res!706606 () Bool)

(declare-fun e!602187 () Bool)

(assert (=> d!128853 (=> res!706606 e!602187)))

(assert (=> d!128853 (= res!706606 (= (select (arr!32086 a!3488) lt!466928) k0!2747))))

(assert (=> d!128853 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466928) e!602187)))

(declare-fun b!1058717 () Bool)

(declare-fun e!602188 () Bool)

(assert (=> b!1058717 (= e!602187 e!602188)))

(declare-fun res!706607 () Bool)

(assert (=> b!1058717 (=> (not res!706607) (not e!602188))))

(assert (=> b!1058717 (= res!706607 (bvslt (bvadd lt!466928 #b00000000000000000000000000000001) (size!32623 a!3488)))))

(declare-fun b!1058718 () Bool)

(assert (=> b!1058718 (= e!602188 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466928 #b00000000000000000000000000000001)))))

(assert (= (and d!128853 (not res!706606)) b!1058717))

(assert (= (and b!1058717 res!706607) b!1058718))

(declare-fun m!978775 () Bool)

(assert (=> d!128853 m!978775))

(declare-fun m!978777 () Bool)

(assert (=> b!1058718 m!978777))

(assert (=> b!1058642 d!128853))

(declare-fun d!128855 () Bool)

(assert (=> d!128855 (arrayContainsKey!0 a!3488 k0!2747 lt!466928)))

(declare-fun lt!466961 () Unit!34663)

(declare-fun choose!114 (array!66739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34663)

(assert (=> d!128855 (= lt!466961 (choose!114 a!3488 k0!2747 i!1381 lt!466928))))

(assert (=> d!128855 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128855 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466928) lt!466961)))

(declare-fun bs!31023 () Bool)

(assert (= bs!31023 d!128855))

(assert (=> bs!31023 m!978695))

(declare-fun m!978779 () Bool)

(assert (=> bs!31023 m!978779))

(assert (=> b!1058642 d!128855))

(declare-fun d!128861 () Bool)

(declare-fun res!706610 () Bool)

(declare-fun e!602192 () Bool)

(assert (=> d!128861 (=> res!706610 e!602192)))

(assert (=> d!128861 (= res!706610 (bvsge lt!466927 (size!32623 a!3488)))))

(assert (=> d!128861 (= (arrayNoDuplicates!0 a!3488 lt!466927 Nil!22365) e!602192)))

(declare-fun b!1058719 () Bool)

(declare-fun e!602191 () Bool)

(assert (=> b!1058719 (= e!602191 (contains!6221 Nil!22365 (select (arr!32086 a!3488) lt!466927)))))

(declare-fun b!1058720 () Bool)

(declare-fun e!602190 () Bool)

(declare-fun call!44907 () Bool)

(assert (=> b!1058720 (= e!602190 call!44907)))

(declare-fun b!1058721 () Bool)

(declare-fun e!602189 () Bool)

(assert (=> b!1058721 (= e!602192 e!602189)))

(declare-fun res!706608 () Bool)

(assert (=> b!1058721 (=> (not res!706608) (not e!602189))))

(assert (=> b!1058721 (= res!706608 (not e!602191))))

(declare-fun res!706609 () Bool)

(assert (=> b!1058721 (=> (not res!706609) (not e!602191))))

(assert (=> b!1058721 (= res!706609 (validKeyInArray!0 (select (arr!32086 a!3488) lt!466927)))))

(declare-fun b!1058722 () Bool)

(assert (=> b!1058722 (= e!602190 call!44907)))

(declare-fun bm!44904 () Bool)

(declare-fun c!107523 () Bool)

(assert (=> bm!44904 (= call!44907 (arrayNoDuplicates!0 a!3488 (bvadd lt!466927 #b00000000000000000000000000000001) (ite c!107523 (Cons!22364 (select (arr!32086 a!3488) lt!466927) Nil!22365) Nil!22365)))))

(declare-fun b!1058723 () Bool)

(assert (=> b!1058723 (= e!602189 e!602190)))

(assert (=> b!1058723 (= c!107523 (validKeyInArray!0 (select (arr!32086 a!3488) lt!466927)))))

(assert (= (and d!128861 (not res!706610)) b!1058721))

(assert (= (and b!1058721 res!706609) b!1058719))

(assert (= (and b!1058721 res!706608) b!1058723))

(assert (= (and b!1058723 c!107523) b!1058722))

(assert (= (and b!1058723 (not c!107523)) b!1058720))

(assert (= (or b!1058722 b!1058720) bm!44904))

(declare-fun m!978781 () Bool)

(assert (=> b!1058719 m!978781))

(assert (=> b!1058719 m!978781))

(declare-fun m!978783 () Bool)

(assert (=> b!1058719 m!978783))

(assert (=> b!1058721 m!978781))

(assert (=> b!1058721 m!978781))

(declare-fun m!978785 () Bool)

(assert (=> b!1058721 m!978785))

(assert (=> bm!44904 m!978781))

(declare-fun m!978787 () Bool)

(assert (=> bm!44904 m!978787))

(assert (=> b!1058723 m!978781))

(assert (=> b!1058723 m!978781))

(assert (=> b!1058723 m!978785))

(assert (=> b!1058642 d!128861))

(declare-fun d!128863 () Bool)

(assert (=> d!128863 (arrayNoDuplicates!0 a!3488 lt!466927 Nil!22365)))

(declare-fun lt!466964 () Unit!34663)

(declare-fun choose!39 (array!66739 (_ BitVec 32) (_ BitVec 32)) Unit!34663)

(assert (=> d!128863 (= lt!466964 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466927))))

(assert (=> d!128863 (bvslt (size!32623 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128863 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466927) lt!466964)))

(declare-fun bs!31024 () Bool)

(assert (= bs!31024 d!128863))

(assert (=> bs!31024 m!978699))

(declare-fun m!978789 () Bool)

(assert (=> bs!31024 m!978789))

(assert (=> b!1058642 d!128863))

(declare-fun d!128867 () Bool)

(declare-fun res!706617 () Bool)

(declare-fun e!602201 () Bool)

(assert (=> d!128867 (=> res!706617 e!602201)))

(assert (=> d!128867 (= res!706617 (= (select (arr!32086 lt!466925) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128867 (= (arrayContainsKey!0 lt!466925 k0!2747 #b00000000000000000000000000000000) e!602201)))

(declare-fun b!1058734 () Bool)

(declare-fun e!602202 () Bool)

(assert (=> b!1058734 (= e!602201 e!602202)))

(declare-fun res!706618 () Bool)

(assert (=> b!1058734 (=> (not res!706618) (not e!602202))))

(assert (=> b!1058734 (= res!706618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32623 lt!466925)))))

(declare-fun b!1058735 () Bool)

(assert (=> b!1058735 (= e!602202 (arrayContainsKey!0 lt!466925 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128867 (not res!706617)) b!1058734))

(assert (= (and b!1058734 res!706618) b!1058735))

(declare-fun m!978791 () Bool)

(assert (=> d!128867 m!978791))

(declare-fun m!978793 () Bool)

(assert (=> b!1058735 m!978793))

(assert (=> b!1058637 d!128867))

(declare-fun d!128869 () Bool)

(declare-fun lt!466970 () (_ BitVec 32))

(assert (=> d!128869 (and (or (bvslt lt!466970 #b00000000000000000000000000000000) (bvsge lt!466970 (size!32623 lt!466925)) (and (bvsge lt!466970 #b00000000000000000000000000000000) (bvslt lt!466970 (size!32623 lt!466925)))) (bvsge lt!466970 #b00000000000000000000000000000000) (bvslt lt!466970 (size!32623 lt!466925)) (= (select (arr!32086 lt!466925) lt!466970) k0!2747))))

(declare-fun e!602225 () (_ BitVec 32))

(assert (=> d!128869 (= lt!466970 e!602225)))

(declare-fun c!107529 () Bool)

(assert (=> d!128869 (= c!107529 (= (select (arr!32086 lt!466925) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32623 lt!466925)) (bvslt (size!32623 lt!466925) #b01111111111111111111111111111111))))

(assert (=> d!128869 (= (arrayScanForKey!0 lt!466925 k0!2747 #b00000000000000000000000000000000) lt!466970)))

(declare-fun b!1058761 () Bool)

(assert (=> b!1058761 (= e!602225 #b00000000000000000000000000000000)))

(declare-fun b!1058762 () Bool)

(assert (=> b!1058762 (= e!602225 (arrayScanForKey!0 lt!466925 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128869 c!107529) b!1058761))

(assert (= (and d!128869 (not c!107529)) b!1058762))

(declare-fun m!978819 () Bool)

(assert (=> d!128869 m!978819))

(assert (=> d!128869 m!978791))

(declare-fun m!978821 () Bool)

(assert (=> b!1058762 m!978821))

(assert (=> b!1058643 d!128869))

(declare-fun d!128887 () Bool)

(assert (=> d!128887 (= (array_inv!24868 a!3488) (bvsge (size!32623 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93486 d!128887))

(declare-fun d!128889 () Bool)

(declare-fun res!706638 () Bool)

(declare-fun e!602226 () Bool)

(assert (=> d!128889 (=> res!706638 e!602226)))

(assert (=> d!128889 (= res!706638 (= (select (arr!32086 a!3488) i!1381) k0!2747))))

(assert (=> d!128889 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!602226)))

(declare-fun b!1058763 () Bool)

(declare-fun e!602227 () Bool)

(assert (=> b!1058763 (= e!602226 e!602227)))

(declare-fun res!706639 () Bool)

(assert (=> b!1058763 (=> (not res!706639) (not e!602227))))

(assert (=> b!1058763 (= res!706639 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32623 a!3488)))))

(declare-fun b!1058764 () Bool)

(assert (=> b!1058764 (= e!602227 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128889 (not res!706638)) b!1058763))

(assert (= (and b!1058763 res!706639) b!1058764))

(assert (=> d!128889 m!978689))

(declare-fun m!978823 () Bool)

(assert (=> b!1058764 m!978823))

(assert (=> b!1058639 d!128889))

(check-sat (not b!1058735) (not b!1058718) (not b!1058764) (not d!128863) (not b!1058710) (not b!1058708) (not b!1058723) (not b!1058719) (not b!1058762) (not b!1058712) (not b!1058721) (not bm!44904) (not d!128855) (not bm!44903))
(check-sat)
