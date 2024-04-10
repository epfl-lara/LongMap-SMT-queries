; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116210 () Bool)

(assert start!116210)

(declare-fun b!1372260 () Bool)

(declare-fun res!915562 () Bool)

(declare-fun e!777435 () Bool)

(assert (=> b!1372260 (=> (not res!915562) (not e!777435))))

(declare-datatypes ((array!93066 0))(
  ( (array!93067 (arr!44945 (Array (_ BitVec 32) (_ BitVec 64))) (size!45495 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93066)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372260 (= res!915562 (validKeyInArray!0 (select (arr!44945 a!3861) from!3239)))))

(declare-datatypes ((List!32013 0))(
  ( (Nil!32010) (Cons!32009 (h!33218 (_ BitVec 64)) (t!46707 List!32013)) )
))
(declare-fun newAcc!98 () List!32013)

(declare-fun b!1372261 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93066 (_ BitVec 32) List!32013) Bool)

(assert (=> b!1372261 (= e!777435 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1372262 () Bool)

(declare-fun res!915559 () Bool)

(declare-fun e!777436 () Bool)

(assert (=> b!1372262 (=> (not res!915559) (not e!777436))))

(declare-fun acc!866 () List!32013)

(declare-fun noDuplicate!2552 (List!32013) Bool)

(assert (=> b!1372262 (= res!915559 (noDuplicate!2552 acc!866))))

(declare-fun b!1372263 () Bool)

(declare-fun res!915561 () Bool)

(assert (=> b!1372263 (=> (not res!915561) (not e!777436))))

(declare-fun contains!9695 (List!32013 (_ BitVec 64)) Bool)

(assert (=> b!1372263 (= res!915561 (not (contains!9695 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372264 () Bool)

(declare-fun res!915555 () Bool)

(assert (=> b!1372264 (=> (not res!915555) (not e!777435))))

(assert (=> b!1372264 (= res!915555 (contains!9695 acc!866 (select (arr!44945 a!3861) from!3239)))))

(declare-fun b!1372265 () Bool)

(declare-fun res!915552 () Bool)

(assert (=> b!1372265 (=> (not res!915552) (not e!777436))))

(assert (=> b!1372265 (= res!915552 (not (contains!9695 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915553 () Bool)

(assert (=> start!116210 (=> (not res!915553) (not e!777436))))

(assert (=> start!116210 (= res!915553 (and (bvslt (size!45495 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45495 a!3861))))))

(assert (=> start!116210 e!777436))

(declare-fun array_inv!33973 (array!93066) Bool)

(assert (=> start!116210 (array_inv!33973 a!3861)))

(assert (=> start!116210 true))

(declare-fun b!1372266 () Bool)

(declare-fun res!915558 () Bool)

(assert (=> b!1372266 (=> (not res!915558) (not e!777436))))

(declare-fun subseq!1097 (List!32013 List!32013) Bool)

(assert (=> b!1372266 (= res!915558 (subseq!1097 newAcc!98 acc!866))))

(declare-fun b!1372267 () Bool)

(declare-fun res!915554 () Bool)

(assert (=> b!1372267 (=> (not res!915554) (not e!777436))))

(assert (=> b!1372267 (= res!915554 (not (contains!9695 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372268 () Bool)

(declare-fun res!915560 () Bool)

(assert (=> b!1372268 (=> (not res!915560) (not e!777436))))

(assert (=> b!1372268 (= res!915560 (not (contains!9695 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372269 () Bool)

(assert (=> b!1372269 (= e!777436 e!777435)))

(declare-fun res!915556 () Bool)

(assert (=> b!1372269 (=> (not res!915556) (not e!777435))))

(assert (=> b!1372269 (= res!915556 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45327 0))(
  ( (Unit!45328) )
))
(declare-fun lt!602836 () Unit!45327)

(declare-fun noDuplicateSubseq!284 (List!32013 List!32013) Unit!45327)

(assert (=> b!1372269 (= lt!602836 (noDuplicateSubseq!284 newAcc!98 acc!866))))

(declare-fun b!1372270 () Bool)

(declare-fun res!915557 () Bool)

(assert (=> b!1372270 (=> (not res!915557) (not e!777435))))

(assert (=> b!1372270 (= res!915557 (bvslt from!3239 (size!45495 a!3861)))))

(assert (= (and start!116210 res!915553) b!1372262))

(assert (= (and b!1372262 res!915559) b!1372265))

(assert (= (and b!1372265 res!915552) b!1372263))

(assert (= (and b!1372263 res!915561) b!1372267))

(assert (= (and b!1372267 res!915554) b!1372268))

(assert (= (and b!1372268 res!915560) b!1372266))

(assert (= (and b!1372266 res!915558) b!1372269))

(assert (= (and b!1372269 res!915556) b!1372270))

(assert (= (and b!1372270 res!915557) b!1372260))

(assert (= (and b!1372260 res!915562) b!1372264))

(assert (= (and b!1372264 res!915555) b!1372261))

(declare-fun m!1255747 () Bool)

(assert (=> b!1372269 m!1255747))

(declare-fun m!1255749 () Bool)

(assert (=> b!1372269 m!1255749))

(declare-fun m!1255751 () Bool)

(assert (=> b!1372263 m!1255751))

(declare-fun m!1255753 () Bool)

(assert (=> b!1372260 m!1255753))

(assert (=> b!1372260 m!1255753))

(declare-fun m!1255755 () Bool)

(assert (=> b!1372260 m!1255755))

(declare-fun m!1255757 () Bool)

(assert (=> b!1372265 m!1255757))

(declare-fun m!1255759 () Bool)

(assert (=> b!1372261 m!1255759))

(declare-fun m!1255761 () Bool)

(assert (=> b!1372268 m!1255761))

(declare-fun m!1255763 () Bool)

(assert (=> b!1372267 m!1255763))

(declare-fun m!1255765 () Bool)

(assert (=> b!1372262 m!1255765))

(assert (=> b!1372264 m!1255753))

(assert (=> b!1372264 m!1255753))

(declare-fun m!1255767 () Bool)

(assert (=> b!1372264 m!1255767))

(declare-fun m!1255769 () Bool)

(assert (=> b!1372266 m!1255769))

(declare-fun m!1255771 () Bool)

(assert (=> start!116210 m!1255771))

(push 1)

(assert (not b!1372268))

(assert (not b!1372262))

(assert (not b!1372261))

(assert (not b!1372260))

(assert (not b!1372267))

(assert (not b!1372269))

(assert (not b!1372263))

(assert (not b!1372264))

(assert (not start!116210))

(assert (not b!1372266))

(assert (not b!1372265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147799 () Bool)

(declare-fun lt!602848 () Bool)

(declare-fun content!744 (List!32013) (Set (_ BitVec 64)))

(assert (=> d!147799 (= lt!602848 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!744 acc!866)))))

(declare-fun e!777466 () Bool)

(assert (=> d!147799 (= lt!602848 e!777466)))

(declare-fun res!915640 () Bool)

(assert (=> d!147799 (=> (not res!915640) (not e!777466))))

(assert (=> d!147799 (= res!915640 (is-Cons!32009 acc!866))))

(assert (=> d!147799 (= (contains!9695 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602848)))

(declare-fun b!1372347 () Bool)

(declare-fun e!777465 () Bool)

(assert (=> b!1372347 (= e!777466 e!777465)))

(declare-fun res!915639 () Bool)

(assert (=> b!1372347 (=> res!915639 e!777465)))

(assert (=> b!1372347 (= res!915639 (= (h!33218 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372348 () Bool)

(assert (=> b!1372348 (= e!777465 (contains!9695 (t!46707 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147799 res!915640) b!1372347))

(assert (= (and b!1372347 (not res!915639)) b!1372348))

(declare-fun m!1255831 () Bool)

(assert (=> d!147799 m!1255831))

(declare-fun m!1255833 () Bool)

(assert (=> d!147799 m!1255833))

(declare-fun m!1255835 () Bool)

(assert (=> b!1372348 m!1255835))

(assert (=> b!1372263 d!147799))

(declare-fun d!147803 () Bool)

(declare-fun lt!602849 () Bool)

(assert (=> d!147803 (= lt!602849 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!744 newAcc!98)))))

(declare-fun e!777468 () Bool)

(assert (=> d!147803 (= lt!602849 e!777468)))

(declare-fun res!915642 () Bool)

(assert (=> d!147803 (=> (not res!915642) (not e!777468))))

(assert (=> d!147803 (= res!915642 (is-Cons!32009 newAcc!98))))

(assert (=> d!147803 (= (contains!9695 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602849)))

(declare-fun b!1372349 () Bool)

(declare-fun e!777467 () Bool)

(assert (=> b!1372349 (= e!777468 e!777467)))

(declare-fun res!915641 () Bool)

(assert (=> b!1372349 (=> res!915641 e!777467)))

(assert (=> b!1372349 (= res!915641 (= (h!33218 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372350 () Bool)

(assert (=> b!1372350 (= e!777467 (contains!9695 (t!46707 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147803 res!915642) b!1372349))

(assert (= (and b!1372349 (not res!915641)) b!1372350))

(declare-fun m!1255837 () Bool)

(assert (=> d!147803 m!1255837))

(declare-fun m!1255839 () Bool)

(assert (=> d!147803 m!1255839))

(declare-fun m!1255841 () Bool)

(assert (=> b!1372350 m!1255841))

(assert (=> b!1372268 d!147803))

(declare-fun d!147805 () Bool)

(declare-fun res!915673 () Bool)

(declare-fun e!777501 () Bool)

(assert (=> d!147805 (=> res!915673 e!777501)))

(assert (=> d!147805 (= res!915673 (bvsge from!3239 (size!45495 a!3861)))))

(assert (=> d!147805 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777501)))

(declare-fun e!777502 () Bool)

(declare-fun b!1372385 () Bool)

(assert (=> b!1372385 (= e!777502 (contains!9695 acc!866 (select (arr!44945 a!3861) from!3239)))))

(declare-fun b!1372386 () Bool)

(declare-fun e!777504 () Bool)

(declare-fun call!65591 () Bool)

(assert (=> b!1372386 (= e!777504 call!65591)))

(declare-fun b!1372387 () Bool)

(declare-fun e!777503 () Bool)

(assert (=> b!1372387 (= e!777503 e!777504)))

(declare-fun c!127796 () Bool)

(assert (=> b!1372387 (= c!127796 (validKeyInArray!0 (select (arr!44945 a!3861) from!3239)))))

(declare-fun b!1372388 () Bool)

(assert (=> b!1372388 (= e!777504 call!65591)))

(declare-fun bm!65588 () Bool)

(assert (=> bm!65588 (= call!65591 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127796 (Cons!32009 (select (arr!44945 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1372389 () Bool)

(assert (=> b!1372389 (= e!777501 e!777503)))

(declare-fun res!915674 () Bool)

(assert (=> b!1372389 (=> (not res!915674) (not e!777503))))

(assert (=> b!1372389 (= res!915674 (not e!777502))))

(declare-fun res!915675 () Bool)

(assert (=> b!1372389 (=> (not res!915675) (not e!777502))))

(assert (=> b!1372389 (= res!915675 (validKeyInArray!0 (select (arr!44945 a!3861) from!3239)))))

(assert (= (and d!147805 (not res!915673)) b!1372389))

(assert (= (and b!1372389 res!915675) b!1372385))

(assert (= (and b!1372389 res!915674) b!1372387))

(assert (= (and b!1372387 c!127796) b!1372386))

(assert (= (and b!1372387 (not c!127796)) b!1372388))

(assert (= (or b!1372386 b!1372388) bm!65588))

(assert (=> b!1372385 m!1255753))

(assert (=> b!1372385 m!1255753))

(assert (=> b!1372385 m!1255767))

(assert (=> b!1372387 m!1255753))

(assert (=> b!1372387 m!1255753))

(assert (=> b!1372387 m!1255755))

(assert (=> bm!65588 m!1255753))

(declare-fun m!1255867 () Bool)

(assert (=> bm!65588 m!1255867))

(assert (=> b!1372389 m!1255753))

(assert (=> b!1372389 m!1255753))

(assert (=> b!1372389 m!1255755))

(assert (=> b!1372269 d!147805))

(declare-fun d!147821 () Bool)

(assert (=> d!147821 (noDuplicate!2552 newAcc!98)))

(declare-fun lt!602858 () Unit!45327)

(declare-fun choose!2020 (List!32013 List!32013) Unit!45327)

(assert (=> d!147821 (= lt!602858 (choose!2020 newAcc!98 acc!866))))

(declare-fun e!777521 () Bool)

(assert (=> d!147821 e!777521))

(declare-fun res!915690 () Bool)

(assert (=> d!147821 (=> (not res!915690) (not e!777521))))

(assert (=> d!147821 (= res!915690 (subseq!1097 newAcc!98 acc!866))))

(assert (=> d!147821 (= (noDuplicateSubseq!284 newAcc!98 acc!866) lt!602858)))

(declare-fun b!1372408 () Bool)

(assert (=> b!1372408 (= e!777521 (noDuplicate!2552 acc!866))))

(assert (= (and d!147821 res!915690) b!1372408))

(declare-fun m!1255873 () Bool)

(assert (=> d!147821 m!1255873))

(declare-fun m!1255875 () Bool)

(assert (=> d!147821 m!1255875))

(assert (=> d!147821 m!1255769))

(assert (=> b!1372408 m!1255765))

(assert (=> b!1372269 d!147821))

(declare-fun d!147825 () Bool)

(declare-fun lt!602859 () Bool)

(assert (=> d!147825 (= lt!602859 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!744 newAcc!98)))))

(declare-fun e!777527 () Bool)

(assert (=> d!147825 (= lt!602859 e!777527)))

(declare-fun res!915696 () Bool)

(assert (=> d!147825 (=> (not res!915696) (not e!777527))))

(assert (=> d!147825 (= res!915696 (is-Cons!32009 newAcc!98))))

(assert (=> d!147825 (= (contains!9695 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602859)))

(declare-fun b!1372413 () Bool)

(declare-fun e!777526 () Bool)

(assert (=> b!1372413 (= e!777527 e!777526)))

(declare-fun res!915695 () Bool)

(assert (=> b!1372413 (=> res!915695 e!777526)))

(assert (=> b!1372413 (= res!915695 (= (h!33218 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372414 () Bool)

(assert (=> b!1372414 (= e!777526 (contains!9695 (t!46707 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147825 res!915696) b!1372413))

(assert (= (and b!1372413 (not res!915695)) b!1372414))

(assert (=> d!147825 m!1255837))

(declare-fun m!1255877 () Bool)

(assert (=> d!147825 m!1255877))

(declare-fun m!1255879 () Bool)

(assert (=> b!1372414 m!1255879))

(assert (=> b!1372267 d!147825))

(declare-fun d!147827 () Bool)

(assert (=> d!147827 (= (array_inv!33973 a!3861) (bvsge (size!45495 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116210 d!147827))

(declare-fun d!147829 () Bool)

(declare-fun res!915712 () Bool)

(declare-fun e!777544 () Bool)

(assert (=> d!147829 (=> res!915712 e!777544)))

(assert (=> d!147829 (= res!915712 (is-Nil!32010 acc!866))))

(assert (=> d!147829 (= (noDuplicate!2552 acc!866) e!777544)))

(declare-fun b!1372432 () Bool)

(declare-fun e!777545 () Bool)

(assert (=> b!1372432 (= e!777544 e!777545)))

(declare-fun res!915713 () Bool)

(assert (=> b!1372432 (=> (not res!915713) (not e!777545))))

(assert (=> b!1372432 (= res!915713 (not (contains!9695 (t!46707 acc!866) (h!33218 acc!866))))))

(declare-fun b!1372433 () Bool)

(assert (=> b!1372433 (= e!777545 (noDuplicate!2552 (t!46707 acc!866)))))

(assert (= (and d!147829 (not res!915712)) b!1372432))

(assert (= (and b!1372432 res!915713) b!1372433))

(declare-fun m!1255889 () Bool)

(assert (=> b!1372432 m!1255889))

(declare-fun m!1255891 () Bool)

(assert (=> b!1372433 m!1255891))

(assert (=> b!1372262 d!147829))

(declare-fun d!147835 () Bool)

(assert (=> d!147835 (= (validKeyInArray!0 (select (arr!44945 a!3861) from!3239)) (and (not (= (select (arr!44945 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44945 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372260 d!147835))

(declare-fun d!147841 () Bool)

(declare-fun res!915719 () Bool)

(declare-fun e!777552 () Bool)

(assert (=> d!147841 (=> res!915719 e!777552)))

(assert (=> d!147841 (= res!915719 (bvsge from!3239 (size!45495 a!3861)))))

(assert (=> d!147841 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777552)))

(declare-fun e!777553 () Bool)

(declare-fun b!1372441 () Bool)

(assert (=> b!1372441 (= e!777553 (contains!9695 newAcc!98 (select (arr!44945 a!3861) from!3239)))))

(declare-fun b!1372442 () Bool)

(declare-fun e!777555 () Bool)

(declare-fun call!65596 () Bool)

(assert (=> b!1372442 (= e!777555 call!65596)))

(declare-fun b!1372443 () Bool)

(declare-fun e!777554 () Bool)

(assert (=> b!1372443 (= e!777554 e!777555)))

(declare-fun c!127801 () Bool)

(assert (=> b!1372443 (= c!127801 (validKeyInArray!0 (select (arr!44945 a!3861) from!3239)))))

(declare-fun b!1372444 () Bool)

(assert (=> b!1372444 (= e!777555 call!65596)))

(declare-fun bm!65593 () Bool)

(assert (=> bm!65593 (= call!65596 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127801 (Cons!32009 (select (arr!44945 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1372445 () Bool)

(assert (=> b!1372445 (= e!777552 e!777554)))

(declare-fun res!915720 () Bool)

(assert (=> b!1372445 (=> (not res!915720) (not e!777554))))

(assert (=> b!1372445 (= res!915720 (not e!777553))))

(declare-fun res!915721 () Bool)

(assert (=> b!1372445 (=> (not res!915721) (not e!777553))))

(assert (=> b!1372445 (= res!915721 (validKeyInArray!0 (select (arr!44945 a!3861) from!3239)))))

(assert (= (and d!147841 (not res!915719)) b!1372445))

(assert (= (and b!1372445 res!915721) b!1372441))

(assert (= (and b!1372445 res!915720) b!1372443))

(assert (= (and b!1372443 c!127801) b!1372442))

(assert (= (and b!1372443 (not c!127801)) b!1372444))

(assert (= (or b!1372442 b!1372444) bm!65593))

(assert (=> b!1372441 m!1255753))

(assert (=> b!1372441 m!1255753))

(declare-fun m!1255899 () Bool)

(assert (=> b!1372441 m!1255899))

(assert (=> b!1372443 m!1255753))

(assert (=> b!1372443 m!1255753))

(assert (=> b!1372443 m!1255755))

(assert (=> bm!65593 m!1255753))

(declare-fun m!1255901 () Bool)

(assert (=> bm!65593 m!1255901))

(assert (=> b!1372445 m!1255753))

(assert (=> b!1372445 m!1255753))

(assert (=> b!1372445 m!1255755))

(assert (=> b!1372261 d!147841))

(declare-fun b!1372475 () Bool)

(declare-fun e!777584 () Bool)

(declare-fun e!777582 () Bool)

(assert (=> b!1372475 (= e!777584 e!777582)))

(declare-fun res!915742 () Bool)

(assert (=> b!1372475 (=> res!915742 e!777582)))

(declare-fun e!777580 () Bool)

(assert (=> b!1372475 (= res!915742 e!777580)))

(declare-fun res!915745 () Bool)

(assert (=> b!1372475 (=> (not res!915745) (not e!777580))))

(assert (=> b!1372475 (= res!915745 (= (h!33218 newAcc!98) (h!33218 acc!866)))))

(declare-fun d!147845 () Bool)

(declare-fun res!915744 () Bool)

(declare-fun e!777583 () Bool)

(assert (=> d!147845 (=> res!915744 e!777583)))

(assert (=> d!147845 (= res!915744 (is-Nil!32010 newAcc!98))))

(assert (=> d!147845 (= (subseq!1097 newAcc!98 acc!866) e!777583)))

(declare-fun b!1372476 () Bool)

(assert (=> b!1372476 (= e!777580 (subseq!1097 (t!46707 newAcc!98) (t!46707 acc!866)))))

(declare-fun b!1372477 () Bool)

(assert (=> b!1372477 (= e!777582 (subseq!1097 newAcc!98 (t!46707 acc!866)))))

(declare-fun b!1372474 () Bool)

(assert (=> b!1372474 (= e!777583 e!777584)))

(declare-fun res!915747 () Bool)

(assert (=> b!1372474 (=> (not res!915747) (not e!777584))))

(assert (=> b!1372474 (= res!915747 (is-Cons!32009 acc!866))))

(assert (= (and d!147845 (not res!915744)) b!1372474))

(assert (= (and b!1372474 res!915747) b!1372475))

(assert (= (and b!1372475 res!915745) b!1372476))

(assert (= (and b!1372475 (not res!915742)) b!1372477))

(declare-fun m!1255917 () Bool)

(assert (=> b!1372476 m!1255917))

(declare-fun m!1255919 () Bool)

(assert (=> b!1372477 m!1255919))

(assert (=> b!1372266 d!147845))

(declare-fun lt!602866 () Bool)

(declare-fun d!147853 () Bool)

(assert (=> d!147853 (= lt!602866 (set.member (select (arr!44945 a!3861) from!3239) (content!744 acc!866)))))

(declare-fun e!777592 () Bool)

(assert (=> d!147853 (= lt!602866 e!777592)))

(declare-fun res!915755 () Bool)

(assert (=> d!147853 (=> (not res!915755) (not e!777592))))

(assert (=> d!147853 (= res!915755 (is-Cons!32009 acc!866))))

(assert (=> d!147853 (= (contains!9695 acc!866 (select (arr!44945 a!3861) from!3239)) lt!602866)))

(declare-fun b!1372484 () Bool)

(declare-fun e!777591 () Bool)

(assert (=> b!1372484 (= e!777592 e!777591)))

(declare-fun res!915754 () Bool)

(assert (=> b!1372484 (=> res!915754 e!777591)))

(assert (=> b!1372484 (= res!915754 (= (h!33218 acc!866) (select (arr!44945 a!3861) from!3239)))))

(declare-fun b!1372485 () Bool)

(assert (=> b!1372485 (= e!777591 (contains!9695 (t!46707 acc!866) (select (arr!44945 a!3861) from!3239)))))

(assert (= (and d!147853 res!915755) b!1372484))

(assert (= (and b!1372484 (not res!915754)) b!1372485))

(assert (=> d!147853 m!1255831))

(assert (=> d!147853 m!1255753))

(declare-fun m!1255925 () Bool)

(assert (=> d!147853 m!1255925))

(assert (=> b!1372485 m!1255753))

(declare-fun m!1255927 () Bool)

(assert (=> b!1372485 m!1255927))

(assert (=> b!1372264 d!147853))

(declare-fun d!147857 () Bool)

(declare-fun lt!602867 () Bool)

(assert (=> d!147857 (= lt!602867 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!744 acc!866)))))

(declare-fun e!777594 () Bool)

(assert (=> d!147857 (= lt!602867 e!777594)))

(declare-fun res!915757 () Bool)

(assert (=> d!147857 (=> (not res!915757) (not e!777594))))

(assert (=> d!147857 (= res!915757 (is-Cons!32009 acc!866))))

(assert (=> d!147857 (= (contains!9695 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602867)))

(declare-fun b!1372486 () Bool)

(declare-fun e!777593 () Bool)

(assert (=> b!1372486 (= e!777594 e!777593)))

(declare-fun res!915756 () Bool)

(assert (=> b!1372486 (=> res!915756 e!777593)))

(assert (=> b!1372486 (= res!915756 (= (h!33218 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372487 () Bool)

(assert (=> b!1372487 (= e!777593 (contains!9695 (t!46707 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147857 res!915757) b!1372486))

(assert (= (and b!1372486 (not res!915756)) b!1372487))

(assert (=> d!147857 m!1255831))

(declare-fun m!1255929 () Bool)

(assert (=> d!147857 m!1255929))

(declare-fun m!1255931 () Bool)

(assert (=> b!1372487 m!1255931))

(assert (=> b!1372265 d!147857))

(push 1)

