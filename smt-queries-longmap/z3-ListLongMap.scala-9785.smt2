; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116086 () Bool)

(assert start!116086)

(declare-fun b!1371326 () Bool)

(declare-fun res!914726 () Bool)

(declare-fun e!776821 () Bool)

(assert (=> b!1371326 (=> (not res!914726) (not e!776821))))

(declare-datatypes ((List!32005 0))(
  ( (Nil!32002) (Cons!32001 (h!33210 (_ BitVec 64)) (t!46699 List!32005)) )
))
(declare-fun lt!602627 () List!32005)

(declare-fun contains!9687 (List!32005 (_ BitVec 64)) Bool)

(assert (=> b!1371326 (= res!914726 (not (contains!9687 lt!602627 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371327 () Bool)

(declare-fun res!914729 () Bool)

(declare-fun e!776819 () Bool)

(assert (=> b!1371327 (=> (not res!914729) (not e!776819))))

(declare-fun acc!866 () List!32005)

(assert (=> b!1371327 (= res!914729 (not (contains!9687 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371328 () Bool)

(declare-fun res!914718 () Bool)

(declare-fun e!776820 () Bool)

(assert (=> b!1371328 (=> (not res!914718) (not e!776820))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93044 0))(
  ( (array!93045 (arr!44937 (Array (_ BitVec 32) (_ BitVec 64))) (size!45487 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93044)

(assert (=> b!1371328 (= res!914718 (bvslt from!3239 (size!45487 a!3861)))))

(declare-fun b!1371329 () Bool)

(assert (=> b!1371329 (= e!776819 e!776820)))

(declare-fun res!914717 () Bool)

(assert (=> b!1371329 (=> (not res!914717) (not e!776820))))

(declare-fun arrayNoDuplicates!0 (array!93044 (_ BitVec 32) List!32005) Bool)

(assert (=> b!1371329 (= res!914717 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45311 0))(
  ( (Unit!45312) )
))
(declare-fun lt!602626 () Unit!45311)

(declare-fun newAcc!98 () List!32005)

(declare-fun noDuplicateSubseq!276 (List!32005 List!32005) Unit!45311)

(assert (=> b!1371329 (= lt!602626 (noDuplicateSubseq!276 newAcc!98 acc!866))))

(declare-fun b!1371330 () Bool)

(declare-fun res!914722 () Bool)

(assert (=> b!1371330 (=> (not res!914722) (not e!776819))))

(assert (=> b!1371330 (= res!914722 (not (contains!9687 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371331 () Bool)

(declare-fun res!914716 () Bool)

(assert (=> b!1371331 (=> (not res!914716) (not e!776819))))

(assert (=> b!1371331 (= res!914716 (not (contains!9687 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371332 () Bool)

(declare-fun res!914724 () Bool)

(assert (=> b!1371332 (=> (not res!914724) (not e!776821))))

(declare-fun lt!602629 () List!32005)

(declare-fun noDuplicate!2544 (List!32005) Bool)

(assert (=> b!1371332 (= res!914724 (noDuplicate!2544 lt!602629))))

(declare-fun res!914728 () Bool)

(assert (=> start!116086 (=> (not res!914728) (not e!776819))))

(assert (=> start!116086 (= res!914728 (and (bvslt (size!45487 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45487 a!3861))))))

(assert (=> start!116086 e!776819))

(declare-fun array_inv!33965 (array!93044) Bool)

(assert (=> start!116086 (array_inv!33965 a!3861)))

(assert (=> start!116086 true))

(declare-fun b!1371333 () Bool)

(declare-fun res!914715 () Bool)

(assert (=> b!1371333 (=> (not res!914715) (not e!776821))))

(declare-fun subseq!1089 (List!32005 List!32005) Bool)

(assert (=> b!1371333 (= res!914715 (subseq!1089 lt!602627 lt!602629))))

(declare-fun b!1371334 () Bool)

(declare-fun res!914723 () Bool)

(assert (=> b!1371334 (=> (not res!914723) (not e!776819))))

(assert (=> b!1371334 (= res!914723 (noDuplicate!2544 acc!866))))

(declare-fun b!1371335 () Bool)

(declare-fun res!914719 () Bool)

(assert (=> b!1371335 (=> (not res!914719) (not e!776821))))

(assert (=> b!1371335 (= res!914719 (not (contains!9687 lt!602627 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371336 () Bool)

(assert (=> b!1371336 (= e!776820 e!776821)))

(declare-fun res!914720 () Bool)

(assert (=> b!1371336 (=> (not res!914720) (not e!776821))))

(assert (=> b!1371336 (= res!914720 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1371336 (= lt!602627 (Cons!32001 (select (arr!44937 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371336 (= lt!602629 (Cons!32001 (select (arr!44937 a!3861) from!3239) acc!866))))

(declare-fun b!1371337 () Bool)

(declare-fun res!914727 () Bool)

(assert (=> b!1371337 (=> (not res!914727) (not e!776819))))

(assert (=> b!1371337 (= res!914727 (not (contains!9687 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371338 () Bool)

(declare-fun res!914730 () Bool)

(assert (=> b!1371338 (=> (not res!914730) (not e!776821))))

(assert (=> b!1371338 (= res!914730 (not (contains!9687 lt!602629 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371339 () Bool)

(declare-fun res!914731 () Bool)

(assert (=> b!1371339 (=> (not res!914731) (not e!776820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371339 (= res!914731 (validKeyInArray!0 (select (arr!44937 a!3861) from!3239)))))

(declare-fun b!1371340 () Bool)

(declare-fun res!914721 () Bool)

(assert (=> b!1371340 (=> (not res!914721) (not e!776819))))

(assert (=> b!1371340 (= res!914721 (subseq!1089 newAcc!98 acc!866))))

(declare-fun b!1371341 () Bool)

(assert (=> b!1371341 (= e!776821 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602629)))))

(declare-fun lt!602628 () Unit!45311)

(assert (=> b!1371341 (= lt!602628 (noDuplicateSubseq!276 lt!602627 lt!602629))))

(declare-fun b!1371342 () Bool)

(declare-fun res!914725 () Bool)

(assert (=> b!1371342 (=> (not res!914725) (not e!776821))))

(assert (=> b!1371342 (= res!914725 (not (contains!9687 lt!602629 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371343 () Bool)

(declare-fun res!914714 () Bool)

(assert (=> b!1371343 (=> (not res!914714) (not e!776820))))

(assert (=> b!1371343 (= res!914714 (not (contains!9687 acc!866 (select (arr!44937 a!3861) from!3239))))))

(assert (= (and start!116086 res!914728) b!1371334))

(assert (= (and b!1371334 res!914723) b!1371327))

(assert (= (and b!1371327 res!914729) b!1371330))

(assert (= (and b!1371330 res!914722) b!1371337))

(assert (= (and b!1371337 res!914727) b!1371331))

(assert (= (and b!1371331 res!914716) b!1371340))

(assert (= (and b!1371340 res!914721) b!1371329))

(assert (= (and b!1371329 res!914717) b!1371328))

(assert (= (and b!1371328 res!914718) b!1371339))

(assert (= (and b!1371339 res!914731) b!1371343))

(assert (= (and b!1371343 res!914714) b!1371336))

(assert (= (and b!1371336 res!914720) b!1371332))

(assert (= (and b!1371332 res!914724) b!1371338))

(assert (= (and b!1371338 res!914730) b!1371342))

(assert (= (and b!1371342 res!914725) b!1371326))

(assert (= (and b!1371326 res!914726) b!1371335))

(assert (= (and b!1371335 res!914719) b!1371333))

(assert (= (and b!1371333 res!914715) b!1371341))

(declare-fun m!1254773 () Bool)

(assert (=> b!1371330 m!1254773))

(declare-fun m!1254775 () Bool)

(assert (=> b!1371337 m!1254775))

(declare-fun m!1254777 () Bool)

(assert (=> b!1371342 m!1254777))

(declare-fun m!1254779 () Bool)

(assert (=> b!1371341 m!1254779))

(declare-fun m!1254781 () Bool)

(assert (=> b!1371341 m!1254781))

(declare-fun m!1254783 () Bool)

(assert (=> b!1371334 m!1254783))

(declare-fun m!1254785 () Bool)

(assert (=> b!1371338 m!1254785))

(declare-fun m!1254787 () Bool)

(assert (=> b!1371326 m!1254787))

(declare-fun m!1254789 () Bool)

(assert (=> b!1371340 m!1254789))

(declare-fun m!1254791 () Bool)

(assert (=> b!1371329 m!1254791))

(declare-fun m!1254793 () Bool)

(assert (=> b!1371329 m!1254793))

(declare-fun m!1254795 () Bool)

(assert (=> b!1371331 m!1254795))

(declare-fun m!1254797 () Bool)

(assert (=> b!1371336 m!1254797))

(declare-fun m!1254799 () Bool)

(assert (=> b!1371333 m!1254799))

(assert (=> b!1371343 m!1254797))

(assert (=> b!1371343 m!1254797))

(declare-fun m!1254801 () Bool)

(assert (=> b!1371343 m!1254801))

(assert (=> b!1371339 m!1254797))

(assert (=> b!1371339 m!1254797))

(declare-fun m!1254803 () Bool)

(assert (=> b!1371339 m!1254803))

(declare-fun m!1254805 () Bool)

(assert (=> b!1371332 m!1254805))

(declare-fun m!1254807 () Bool)

(assert (=> b!1371335 m!1254807))

(declare-fun m!1254809 () Bool)

(assert (=> b!1371327 m!1254809))

(declare-fun m!1254811 () Bool)

(assert (=> start!116086 m!1254811))

(check-sat (not b!1371337) (not b!1371339) (not b!1371341) (not b!1371330) (not b!1371333) (not b!1371331) (not b!1371335) (not start!116086) (not b!1371332) (not b!1371340) (not b!1371326) (not b!1371343) (not b!1371329) (not b!1371334) (not b!1371342) (not b!1371327) (not b!1371338))
(check-sat)
(get-model)

(declare-fun d!147443 () Bool)

(declare-fun lt!602644 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!738 (List!32005) (InoxSet (_ BitVec 64)))

(assert (=> d!147443 (= lt!602644 (select (content!738 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776839 () Bool)

(assert (=> d!147443 (= lt!602644 e!776839)))

(declare-fun res!914790 () Bool)

(assert (=> d!147443 (=> (not res!914790) (not e!776839))))

(get-info :version)

(assert (=> d!147443 (= res!914790 ((_ is Cons!32001) newAcc!98))))

(assert (=> d!147443 (= (contains!9687 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602644)))

(declare-fun b!1371402 () Bool)

(declare-fun e!776838 () Bool)

(assert (=> b!1371402 (= e!776839 e!776838)))

(declare-fun res!914791 () Bool)

(assert (=> b!1371402 (=> res!914791 e!776838)))

(assert (=> b!1371402 (= res!914791 (= (h!33210 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371403 () Bool)

(assert (=> b!1371403 (= e!776838 (contains!9687 (t!46699 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147443 res!914790) b!1371402))

(assert (= (and b!1371402 (not res!914791)) b!1371403))

(declare-fun m!1254853 () Bool)

(assert (=> d!147443 m!1254853))

(declare-fun m!1254855 () Bool)

(assert (=> d!147443 m!1254855))

(declare-fun m!1254857 () Bool)

(assert (=> b!1371403 m!1254857))

(assert (=> b!1371337 d!147443))

(declare-fun d!147445 () Bool)

(declare-fun lt!602645 () Bool)

(assert (=> d!147445 (= lt!602645 (select (content!738 lt!602629) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776841 () Bool)

(assert (=> d!147445 (= lt!602645 e!776841)))

(declare-fun res!914792 () Bool)

(assert (=> d!147445 (=> (not res!914792) (not e!776841))))

(assert (=> d!147445 (= res!914792 ((_ is Cons!32001) lt!602629))))

(assert (=> d!147445 (= (contains!9687 lt!602629 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602645)))

(declare-fun b!1371404 () Bool)

(declare-fun e!776840 () Bool)

(assert (=> b!1371404 (= e!776841 e!776840)))

(declare-fun res!914793 () Bool)

(assert (=> b!1371404 (=> res!914793 e!776840)))

(assert (=> b!1371404 (= res!914793 (= (h!33210 lt!602629) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371405 () Bool)

(assert (=> b!1371405 (= e!776840 (contains!9687 (t!46699 lt!602629) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147445 res!914792) b!1371404))

(assert (= (and b!1371404 (not res!914793)) b!1371405))

(declare-fun m!1254859 () Bool)

(assert (=> d!147445 m!1254859))

(declare-fun m!1254861 () Bool)

(assert (=> d!147445 m!1254861))

(declare-fun m!1254863 () Bool)

(assert (=> b!1371405 m!1254863))

(assert (=> b!1371338 d!147445))

(declare-fun d!147447 () Bool)

(declare-fun lt!602646 () Bool)

(assert (=> d!147447 (= lt!602646 (select (content!738 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776843 () Bool)

(assert (=> d!147447 (= lt!602646 e!776843)))

(declare-fun res!914794 () Bool)

(assert (=> d!147447 (=> (not res!914794) (not e!776843))))

(assert (=> d!147447 (= res!914794 ((_ is Cons!32001) acc!866))))

(assert (=> d!147447 (= (contains!9687 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602646)))

(declare-fun b!1371406 () Bool)

(declare-fun e!776842 () Bool)

(assert (=> b!1371406 (= e!776843 e!776842)))

(declare-fun res!914795 () Bool)

(assert (=> b!1371406 (=> res!914795 e!776842)))

(assert (=> b!1371406 (= res!914795 (= (h!33210 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371407 () Bool)

(assert (=> b!1371407 (= e!776842 (contains!9687 (t!46699 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147447 res!914794) b!1371406))

(assert (= (and b!1371406 (not res!914795)) b!1371407))

(declare-fun m!1254865 () Bool)

(assert (=> d!147447 m!1254865))

(declare-fun m!1254867 () Bool)

(assert (=> d!147447 m!1254867))

(declare-fun m!1254869 () Bool)

(assert (=> b!1371407 m!1254869))

(assert (=> b!1371327 d!147447))

(declare-fun d!147449 () Bool)

(assert (=> d!147449 (= (array_inv!33965 a!3861) (bvsge (size!45487 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116086 d!147449))

(declare-fun d!147451 () Bool)

(assert (=> d!147451 (= (validKeyInArray!0 (select (arr!44937 a!3861) from!3239)) (and (not (= (select (arr!44937 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44937 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371339 d!147451))

(declare-fun b!1371419 () Bool)

(declare-fun e!776852 () Bool)

(assert (=> b!1371419 (= e!776852 (subseq!1089 newAcc!98 (t!46699 acc!866)))))

(declare-fun d!147453 () Bool)

(declare-fun res!914805 () Bool)

(declare-fun e!776855 () Bool)

(assert (=> d!147453 (=> res!914805 e!776855)))

(assert (=> d!147453 (= res!914805 ((_ is Nil!32002) newAcc!98))))

(assert (=> d!147453 (= (subseq!1089 newAcc!98 acc!866) e!776855)))

(declare-fun b!1371416 () Bool)

(declare-fun e!776854 () Bool)

(assert (=> b!1371416 (= e!776855 e!776854)))

(declare-fun res!914804 () Bool)

(assert (=> b!1371416 (=> (not res!914804) (not e!776854))))

(assert (=> b!1371416 (= res!914804 ((_ is Cons!32001) acc!866))))

(declare-fun b!1371417 () Bool)

(assert (=> b!1371417 (= e!776854 e!776852)))

(declare-fun res!914806 () Bool)

(assert (=> b!1371417 (=> res!914806 e!776852)))

(declare-fun e!776853 () Bool)

(assert (=> b!1371417 (= res!914806 e!776853)))

(declare-fun res!914807 () Bool)

(assert (=> b!1371417 (=> (not res!914807) (not e!776853))))

(assert (=> b!1371417 (= res!914807 (= (h!33210 newAcc!98) (h!33210 acc!866)))))

(declare-fun b!1371418 () Bool)

(assert (=> b!1371418 (= e!776853 (subseq!1089 (t!46699 newAcc!98) (t!46699 acc!866)))))

(assert (= (and d!147453 (not res!914805)) b!1371416))

(assert (= (and b!1371416 res!914804) b!1371417))

(assert (= (and b!1371417 res!914807) b!1371418))

(assert (= (and b!1371417 (not res!914806)) b!1371419))

(declare-fun m!1254871 () Bool)

(assert (=> b!1371419 m!1254871))

(declare-fun m!1254873 () Bool)

(assert (=> b!1371418 m!1254873))

(assert (=> b!1371340 d!147453))

(declare-fun b!1371460 () Bool)

(declare-fun e!776897 () Bool)

(declare-fun call!65555 () Bool)

(assert (=> b!1371460 (= e!776897 call!65555)))

(declare-fun b!1371461 () Bool)

(assert (=> b!1371461 (= e!776897 call!65555)))

(declare-fun d!147461 () Bool)

(declare-fun res!914845 () Bool)

(declare-fun e!776894 () Bool)

(assert (=> d!147461 (=> res!914845 e!776894)))

(assert (=> d!147461 (= res!914845 (bvsge from!3239 (size!45487 a!3861)))))

(assert (=> d!147461 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776894)))

(declare-fun b!1371462 () Bool)

(declare-fun e!776895 () Bool)

(assert (=> b!1371462 (= e!776894 e!776895)))

(declare-fun res!914846 () Bool)

(assert (=> b!1371462 (=> (not res!914846) (not e!776895))))

(declare-fun e!776896 () Bool)

(assert (=> b!1371462 (= res!914846 (not e!776896))))

(declare-fun res!914844 () Bool)

(assert (=> b!1371462 (=> (not res!914844) (not e!776896))))

(assert (=> b!1371462 (= res!914844 (validKeyInArray!0 (select (arr!44937 a!3861) from!3239)))))

(declare-fun b!1371463 () Bool)

(assert (=> b!1371463 (= e!776896 (contains!9687 acc!866 (select (arr!44937 a!3861) from!3239)))))

(declare-fun b!1371464 () Bool)

(assert (=> b!1371464 (= e!776895 e!776897)))

(declare-fun c!127748 () Bool)

(assert (=> b!1371464 (= c!127748 (validKeyInArray!0 (select (arr!44937 a!3861) from!3239)))))

(declare-fun bm!65552 () Bool)

(assert (=> bm!65552 (= call!65555 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127748 (Cons!32001 (select (arr!44937 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!147461 (not res!914845)) b!1371462))

(assert (= (and b!1371462 res!914844) b!1371463))

(assert (= (and b!1371462 res!914846) b!1371464))

(assert (= (and b!1371464 c!127748) b!1371460))

(assert (= (and b!1371464 (not c!127748)) b!1371461))

(assert (= (or b!1371460 b!1371461) bm!65552))

(assert (=> b!1371462 m!1254797))

(assert (=> b!1371462 m!1254797))

(assert (=> b!1371462 m!1254803))

(assert (=> b!1371463 m!1254797))

(assert (=> b!1371463 m!1254797))

(assert (=> b!1371463 m!1254801))

(assert (=> b!1371464 m!1254797))

(assert (=> b!1371464 m!1254797))

(assert (=> b!1371464 m!1254803))

(assert (=> bm!65552 m!1254797))

(declare-fun m!1254885 () Bool)

(assert (=> bm!65552 m!1254885))

(assert (=> b!1371329 d!147461))

(declare-fun d!147467 () Bool)

(assert (=> d!147467 (noDuplicate!2544 newAcc!98)))

(declare-fun lt!602657 () Unit!45311)

(declare-fun choose!2014 (List!32005 List!32005) Unit!45311)

(assert (=> d!147467 (= lt!602657 (choose!2014 newAcc!98 acc!866))))

(declare-fun e!776910 () Bool)

(assert (=> d!147467 e!776910))

(declare-fun res!914859 () Bool)

(assert (=> d!147467 (=> (not res!914859) (not e!776910))))

(assert (=> d!147467 (= res!914859 (subseq!1089 newAcc!98 acc!866))))

(assert (=> d!147467 (= (noDuplicateSubseq!276 newAcc!98 acc!866) lt!602657)))

(declare-fun b!1371477 () Bool)

(assert (=> b!1371477 (= e!776910 (noDuplicate!2544 acc!866))))

(assert (= (and d!147467 res!914859) b!1371477))

(declare-fun m!1254909 () Bool)

(assert (=> d!147467 m!1254909))

(declare-fun m!1254911 () Bool)

(assert (=> d!147467 m!1254911))

(assert (=> d!147467 m!1254789))

(assert (=> b!1371477 m!1254783))

(assert (=> b!1371329 d!147467))

(declare-fun d!147479 () Bool)

(declare-fun lt!602658 () Bool)

(assert (=> d!147479 (= lt!602658 (select (content!738 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776912 () Bool)

(assert (=> d!147479 (= lt!602658 e!776912)))

(declare-fun res!914860 () Bool)

(assert (=> d!147479 (=> (not res!914860) (not e!776912))))

(assert (=> d!147479 (= res!914860 ((_ is Cons!32001) acc!866))))

(assert (=> d!147479 (= (contains!9687 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602658)))

(declare-fun b!1371478 () Bool)

(declare-fun e!776911 () Bool)

(assert (=> b!1371478 (= e!776912 e!776911)))

(declare-fun res!914861 () Bool)

(assert (=> b!1371478 (=> res!914861 e!776911)))

(assert (=> b!1371478 (= res!914861 (= (h!33210 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371479 () Bool)

(assert (=> b!1371479 (= e!776911 (contains!9687 (t!46699 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147479 res!914860) b!1371478))

(assert (= (and b!1371478 (not res!914861)) b!1371479))

(assert (=> d!147479 m!1254865))

(declare-fun m!1254913 () Bool)

(assert (=> d!147479 m!1254913))

(declare-fun m!1254915 () Bool)

(assert (=> b!1371479 m!1254915))

(assert (=> b!1371330 d!147479))

(declare-fun b!1371490 () Bool)

(declare-fun e!776924 () Bool)

(declare-fun call!65556 () Bool)

(assert (=> b!1371490 (= e!776924 call!65556)))

(declare-fun b!1371491 () Bool)

(assert (=> b!1371491 (= e!776924 call!65556)))

(declare-fun d!147481 () Bool)

(declare-fun res!914869 () Bool)

(declare-fun e!776921 () Bool)

(assert (=> d!147481 (=> res!914869 e!776921)))

(assert (=> d!147481 (= res!914869 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45487 a!3861)))))

(assert (=> d!147481 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602629) e!776921)))

(declare-fun b!1371492 () Bool)

(declare-fun e!776922 () Bool)

(assert (=> b!1371492 (= e!776921 e!776922)))

(declare-fun res!914870 () Bool)

(assert (=> b!1371492 (=> (not res!914870) (not e!776922))))

(declare-fun e!776923 () Bool)

(assert (=> b!1371492 (= res!914870 (not e!776923))))

(declare-fun res!914868 () Bool)

(assert (=> b!1371492 (=> (not res!914868) (not e!776923))))

(assert (=> b!1371492 (= res!914868 (validKeyInArray!0 (select (arr!44937 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371493 () Bool)

(assert (=> b!1371493 (= e!776923 (contains!9687 lt!602629 (select (arr!44937 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371494 () Bool)

(assert (=> b!1371494 (= e!776922 e!776924)))

(declare-fun c!127751 () Bool)

(assert (=> b!1371494 (= c!127751 (validKeyInArray!0 (select (arr!44937 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65553 () Bool)

(assert (=> bm!65553 (= call!65556 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127751 (Cons!32001 (select (arr!44937 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602629) lt!602629)))))

(assert (= (and d!147481 (not res!914869)) b!1371492))

(assert (= (and b!1371492 res!914868) b!1371493))

(assert (= (and b!1371492 res!914870) b!1371494))

(assert (= (and b!1371494 c!127751) b!1371490))

(assert (= (and b!1371494 (not c!127751)) b!1371491))

(assert (= (or b!1371490 b!1371491) bm!65553))

(declare-fun m!1254917 () Bool)

(assert (=> b!1371492 m!1254917))

(assert (=> b!1371492 m!1254917))

(declare-fun m!1254919 () Bool)

(assert (=> b!1371492 m!1254919))

(assert (=> b!1371493 m!1254917))

(assert (=> b!1371493 m!1254917))

(declare-fun m!1254921 () Bool)

(assert (=> b!1371493 m!1254921))

(assert (=> b!1371494 m!1254917))

(assert (=> b!1371494 m!1254917))

(assert (=> b!1371494 m!1254919))

(assert (=> bm!65553 m!1254917))

(declare-fun m!1254923 () Bool)

(assert (=> bm!65553 m!1254923))

(assert (=> b!1371341 d!147481))

(declare-fun d!147483 () Bool)

(assert (=> d!147483 (noDuplicate!2544 lt!602627)))

(declare-fun lt!602659 () Unit!45311)

(assert (=> d!147483 (= lt!602659 (choose!2014 lt!602627 lt!602629))))

(declare-fun e!776929 () Bool)

(assert (=> d!147483 e!776929))

(declare-fun res!914875 () Bool)

(assert (=> d!147483 (=> (not res!914875) (not e!776929))))

(assert (=> d!147483 (= res!914875 (subseq!1089 lt!602627 lt!602629))))

(assert (=> d!147483 (= (noDuplicateSubseq!276 lt!602627 lt!602629) lt!602659)))

(declare-fun b!1371499 () Bool)

(assert (=> b!1371499 (= e!776929 (noDuplicate!2544 lt!602629))))

(assert (= (and d!147483 res!914875) b!1371499))

(declare-fun m!1254925 () Bool)

(assert (=> d!147483 m!1254925))

(declare-fun m!1254927 () Bool)

(assert (=> d!147483 m!1254927))

(assert (=> d!147483 m!1254799))

(assert (=> b!1371499 m!1254805))

(assert (=> b!1371341 d!147483))

(declare-fun d!147485 () Bool)

(declare-fun lt!602660 () Bool)

(assert (=> d!147485 (= lt!602660 (select (content!738 lt!602629) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776933 () Bool)

(assert (=> d!147485 (= lt!602660 e!776933)))

(declare-fun res!914878 () Bool)

(assert (=> d!147485 (=> (not res!914878) (not e!776933))))

(assert (=> d!147485 (= res!914878 ((_ is Cons!32001) lt!602629))))

(assert (=> d!147485 (= (contains!9687 lt!602629 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602660)))

(declare-fun b!1371502 () Bool)

(declare-fun e!776932 () Bool)

(assert (=> b!1371502 (= e!776933 e!776932)))

(declare-fun res!914879 () Bool)

(assert (=> b!1371502 (=> res!914879 e!776932)))

(assert (=> b!1371502 (= res!914879 (= (h!33210 lt!602629) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371503 () Bool)

(assert (=> b!1371503 (= e!776932 (contains!9687 (t!46699 lt!602629) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147485 res!914878) b!1371502))

(assert (= (and b!1371502 (not res!914879)) b!1371503))

(assert (=> d!147485 m!1254859))

(declare-fun m!1254933 () Bool)

(assert (=> d!147485 m!1254933))

(declare-fun m!1254935 () Bool)

(assert (=> b!1371503 m!1254935))

(assert (=> b!1371342 d!147485))

(declare-fun d!147489 () Bool)

(declare-fun lt!602662 () Bool)

(assert (=> d!147489 (= lt!602662 (select (content!738 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776937 () Bool)

(assert (=> d!147489 (= lt!602662 e!776937)))

(declare-fun res!914882 () Bool)

(assert (=> d!147489 (=> (not res!914882) (not e!776937))))

(assert (=> d!147489 (= res!914882 ((_ is Cons!32001) newAcc!98))))

(assert (=> d!147489 (= (contains!9687 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602662)))

(declare-fun b!1371506 () Bool)

(declare-fun e!776936 () Bool)

(assert (=> b!1371506 (= e!776937 e!776936)))

(declare-fun res!914883 () Bool)

(assert (=> b!1371506 (=> res!914883 e!776936)))

(assert (=> b!1371506 (= res!914883 (= (h!33210 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371507 () Bool)

(assert (=> b!1371507 (= e!776936 (contains!9687 (t!46699 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147489 res!914882) b!1371506))

(assert (= (and b!1371506 (not res!914883)) b!1371507))

(assert (=> d!147489 m!1254853))

(declare-fun m!1254943 () Bool)

(assert (=> d!147489 m!1254943))

(declare-fun m!1254945 () Bool)

(assert (=> b!1371507 m!1254945))

(assert (=> b!1371331 d!147489))

(declare-fun d!147493 () Bool)

(declare-fun res!914895 () Bool)

(declare-fun e!776950 () Bool)

(assert (=> d!147493 (=> res!914895 e!776950)))

(assert (=> d!147493 (= res!914895 ((_ is Nil!32002) lt!602629))))

(assert (=> d!147493 (= (noDuplicate!2544 lt!602629) e!776950)))

(declare-fun b!1371521 () Bool)

(declare-fun e!776951 () Bool)

(assert (=> b!1371521 (= e!776950 e!776951)))

(declare-fun res!914896 () Bool)

(assert (=> b!1371521 (=> (not res!914896) (not e!776951))))

(assert (=> b!1371521 (= res!914896 (not (contains!9687 (t!46699 lt!602629) (h!33210 lt!602629))))))

(declare-fun b!1371522 () Bool)

(assert (=> b!1371522 (= e!776951 (noDuplicate!2544 (t!46699 lt!602629)))))

(assert (= (and d!147493 (not res!914895)) b!1371521))

(assert (= (and b!1371521 res!914896) b!1371522))

(declare-fun m!1254957 () Bool)

(assert (=> b!1371521 m!1254957))

(declare-fun m!1254959 () Bool)

(assert (=> b!1371522 m!1254959))

(assert (=> b!1371332 d!147493))

(declare-fun lt!602665 () Bool)

(declare-fun d!147503 () Bool)

(assert (=> d!147503 (= lt!602665 (select (content!738 acc!866) (select (arr!44937 a!3861) from!3239)))))

(declare-fun e!776953 () Bool)

(assert (=> d!147503 (= lt!602665 e!776953)))

(declare-fun res!914897 () Bool)

(assert (=> d!147503 (=> (not res!914897) (not e!776953))))

(assert (=> d!147503 (= res!914897 ((_ is Cons!32001) acc!866))))

(assert (=> d!147503 (= (contains!9687 acc!866 (select (arr!44937 a!3861) from!3239)) lt!602665)))

(declare-fun b!1371523 () Bool)

(declare-fun e!776952 () Bool)

(assert (=> b!1371523 (= e!776953 e!776952)))

(declare-fun res!914898 () Bool)

(assert (=> b!1371523 (=> res!914898 e!776952)))

(assert (=> b!1371523 (= res!914898 (= (h!33210 acc!866) (select (arr!44937 a!3861) from!3239)))))

(declare-fun b!1371524 () Bool)

(assert (=> b!1371524 (= e!776952 (contains!9687 (t!46699 acc!866) (select (arr!44937 a!3861) from!3239)))))

(assert (= (and d!147503 res!914897) b!1371523))

(assert (= (and b!1371523 (not res!914898)) b!1371524))

(assert (=> d!147503 m!1254865))

(assert (=> d!147503 m!1254797))

(declare-fun m!1254961 () Bool)

(assert (=> d!147503 m!1254961))

(assert (=> b!1371524 m!1254797))

(declare-fun m!1254963 () Bool)

(assert (=> b!1371524 m!1254963))

(assert (=> b!1371343 d!147503))

(declare-fun b!1371528 () Bool)

(declare-fun e!776954 () Bool)

(assert (=> b!1371528 (= e!776954 (subseq!1089 lt!602627 (t!46699 lt!602629)))))

(declare-fun d!147505 () Bool)

(declare-fun res!914900 () Bool)

(declare-fun e!776957 () Bool)

(assert (=> d!147505 (=> res!914900 e!776957)))

(assert (=> d!147505 (= res!914900 ((_ is Nil!32002) lt!602627))))

(assert (=> d!147505 (= (subseq!1089 lt!602627 lt!602629) e!776957)))

(declare-fun b!1371525 () Bool)

(declare-fun e!776956 () Bool)

(assert (=> b!1371525 (= e!776957 e!776956)))

(declare-fun res!914899 () Bool)

(assert (=> b!1371525 (=> (not res!914899) (not e!776956))))

(assert (=> b!1371525 (= res!914899 ((_ is Cons!32001) lt!602629))))

(declare-fun b!1371526 () Bool)

(assert (=> b!1371526 (= e!776956 e!776954)))

(declare-fun res!914901 () Bool)

(assert (=> b!1371526 (=> res!914901 e!776954)))

(declare-fun e!776955 () Bool)

(assert (=> b!1371526 (= res!914901 e!776955)))

(declare-fun res!914902 () Bool)

(assert (=> b!1371526 (=> (not res!914902) (not e!776955))))

(assert (=> b!1371526 (= res!914902 (= (h!33210 lt!602627) (h!33210 lt!602629)))))

(declare-fun b!1371527 () Bool)

(assert (=> b!1371527 (= e!776955 (subseq!1089 (t!46699 lt!602627) (t!46699 lt!602629)))))

(assert (= (and d!147505 (not res!914900)) b!1371525))

(assert (= (and b!1371525 res!914899) b!1371526))

(assert (= (and b!1371526 res!914902) b!1371527))

(assert (= (and b!1371526 (not res!914901)) b!1371528))

(declare-fun m!1254965 () Bool)

(assert (=> b!1371528 m!1254965))

(declare-fun m!1254967 () Bool)

(assert (=> b!1371527 m!1254967))

(assert (=> b!1371333 d!147505))

(declare-fun d!147507 () Bool)

(declare-fun res!914903 () Bool)

(declare-fun e!776958 () Bool)

(assert (=> d!147507 (=> res!914903 e!776958)))

(assert (=> d!147507 (= res!914903 ((_ is Nil!32002) acc!866))))

(assert (=> d!147507 (= (noDuplicate!2544 acc!866) e!776958)))

(declare-fun b!1371529 () Bool)

(declare-fun e!776959 () Bool)

(assert (=> b!1371529 (= e!776958 e!776959)))

(declare-fun res!914904 () Bool)

(assert (=> b!1371529 (=> (not res!914904) (not e!776959))))

(assert (=> b!1371529 (= res!914904 (not (contains!9687 (t!46699 acc!866) (h!33210 acc!866))))))

(declare-fun b!1371530 () Bool)

(assert (=> b!1371530 (= e!776959 (noDuplicate!2544 (t!46699 acc!866)))))

(assert (= (and d!147507 (not res!914903)) b!1371529))

(assert (= (and b!1371529 res!914904) b!1371530))

(declare-fun m!1254969 () Bool)

(assert (=> b!1371529 m!1254969))

(declare-fun m!1254971 () Bool)

(assert (=> b!1371530 m!1254971))

(assert (=> b!1371334 d!147507))

(declare-fun d!147509 () Bool)

(declare-fun lt!602668 () Bool)

(assert (=> d!147509 (= lt!602668 (select (content!738 lt!602627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776963 () Bool)

(assert (=> d!147509 (= lt!602668 e!776963)))

(declare-fun res!914907 () Bool)

(assert (=> d!147509 (=> (not res!914907) (not e!776963))))

(assert (=> d!147509 (= res!914907 ((_ is Cons!32001) lt!602627))))

(assert (=> d!147509 (= (contains!9687 lt!602627 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602668)))

(declare-fun b!1371533 () Bool)

(declare-fun e!776962 () Bool)

(assert (=> b!1371533 (= e!776963 e!776962)))

(declare-fun res!914908 () Bool)

(assert (=> b!1371533 (=> res!914908 e!776962)))

(assert (=> b!1371533 (= res!914908 (= (h!33210 lt!602627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371534 () Bool)

(assert (=> b!1371534 (= e!776962 (contains!9687 (t!46699 lt!602627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147509 res!914907) b!1371533))

(assert (= (and b!1371533 (not res!914908)) b!1371534))

(declare-fun m!1254973 () Bool)

(assert (=> d!147509 m!1254973))

(declare-fun m!1254975 () Bool)

(assert (=> d!147509 m!1254975))

(declare-fun m!1254977 () Bool)

(assert (=> b!1371534 m!1254977))

(assert (=> b!1371335 d!147509))

(declare-fun d!147511 () Bool)

(declare-fun lt!602669 () Bool)

(assert (=> d!147511 (= lt!602669 (select (content!738 lt!602627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776965 () Bool)

(assert (=> d!147511 (= lt!602669 e!776965)))

(declare-fun res!914909 () Bool)

(assert (=> d!147511 (=> (not res!914909) (not e!776965))))

(assert (=> d!147511 (= res!914909 ((_ is Cons!32001) lt!602627))))

(assert (=> d!147511 (= (contains!9687 lt!602627 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602669)))

(declare-fun b!1371535 () Bool)

(declare-fun e!776964 () Bool)

(assert (=> b!1371535 (= e!776965 e!776964)))

(declare-fun res!914910 () Bool)

(assert (=> b!1371535 (=> res!914910 e!776964)))

(assert (=> b!1371535 (= res!914910 (= (h!33210 lt!602627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371536 () Bool)

(assert (=> b!1371536 (= e!776964 (contains!9687 (t!46699 lt!602627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147511 res!914909) b!1371535))

(assert (= (and b!1371535 (not res!914910)) b!1371536))

(assert (=> d!147511 m!1254973))

(declare-fun m!1254979 () Bool)

(assert (=> d!147511 m!1254979))

(declare-fun m!1254981 () Bool)

(assert (=> b!1371536 m!1254981))

(assert (=> b!1371326 d!147511))

(check-sat (not b!1371524) (not b!1371493) (not b!1371418) (not b!1371463) (not b!1371494) (not d!147483) (not b!1371528) (not b!1371403) (not d!147511) (not b!1371503) (not d!147489) (not b!1371527) (not b!1371529) (not b!1371507) (not b!1371534) (not b!1371499) (not b!1371492) (not b!1371462) (not d!147479) (not bm!65552) (not d!147503) (not b!1371477) (not d!147467) (not b!1371521) (not d!147445) (not b!1371479) (not bm!65553) (not b!1371522) (not d!147447) (not b!1371536) (not b!1371405) (not d!147443) (not b!1371530) (not d!147509) (not d!147485) (not b!1371419) (not b!1371464) (not b!1371407))
(check-sat)
