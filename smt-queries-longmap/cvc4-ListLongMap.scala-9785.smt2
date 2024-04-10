; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116088 () Bool)

(assert start!116088)

(declare-fun b!1371380 () Bool)

(declare-fun res!914780 () Bool)

(declare-fun e!776832 () Bool)

(assert (=> b!1371380 (=> (not res!914780) (not e!776832))))

(declare-datatypes ((List!32006 0))(
  ( (Nil!32003) (Cons!32002 (h!33211 (_ BitVec 64)) (t!46700 List!32006)) )
))
(declare-fun lt!602639 () List!32006)

(declare-fun contains!9688 (List!32006 (_ BitVec 64)) Bool)

(assert (=> b!1371380 (= res!914780 (not (contains!9688 lt!602639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371381 () Bool)

(declare-fun res!914772 () Bool)

(declare-fun e!776830 () Bool)

(assert (=> b!1371381 (=> (not res!914772) (not e!776830))))

(declare-datatypes ((array!93046 0))(
  ( (array!93047 (arr!44938 (Array (_ BitVec 32) (_ BitVec 64))) (size!45488 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93046)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371381 (= res!914772 (validKeyInArray!0 (select (arr!44938 a!3861) from!3239)))))

(declare-fun b!1371382 () Bool)

(declare-fun res!914782 () Bool)

(assert (=> b!1371382 (=> (not res!914782) (not e!776832))))

(assert (=> b!1371382 (= res!914782 (not (contains!9688 lt!602639 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371383 () Bool)

(declare-fun res!914778 () Bool)

(declare-fun e!776831 () Bool)

(assert (=> b!1371383 (=> (not res!914778) (not e!776831))))

(declare-fun acc!866 () List!32006)

(assert (=> b!1371383 (= res!914778 (not (contains!9688 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!914768 () Bool)

(assert (=> start!116088 (=> (not res!914768) (not e!776831))))

(assert (=> start!116088 (= res!914768 (and (bvslt (size!45488 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45488 a!3861))))))

(assert (=> start!116088 e!776831))

(declare-fun array_inv!33966 (array!93046) Bool)

(assert (=> start!116088 (array_inv!33966 a!3861)))

(assert (=> start!116088 true))

(declare-fun b!1371384 () Bool)

(assert (=> b!1371384 (= e!776831 e!776830)))

(declare-fun res!914776 () Bool)

(assert (=> b!1371384 (=> (not res!914776) (not e!776830))))

(declare-fun arrayNoDuplicates!0 (array!93046 (_ BitVec 32) List!32006) Bool)

(assert (=> b!1371384 (= res!914776 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45313 0))(
  ( (Unit!45314) )
))
(declare-fun lt!602640 () Unit!45313)

(declare-fun newAcc!98 () List!32006)

(declare-fun noDuplicateSubseq!277 (List!32006 List!32006) Unit!45313)

(assert (=> b!1371384 (= lt!602640 (noDuplicateSubseq!277 newAcc!98 acc!866))))

(declare-fun b!1371385 () Bool)

(declare-fun res!914785 () Bool)

(assert (=> b!1371385 (=> (not res!914785) (not e!776830))))

(assert (=> b!1371385 (= res!914785 (not (contains!9688 acc!866 (select (arr!44938 a!3861) from!3239))))))

(declare-fun b!1371386 () Bool)

(declare-fun res!914783 () Bool)

(assert (=> b!1371386 (=> (not res!914783) (not e!776831))))

(assert (=> b!1371386 (= res!914783 (not (contains!9688 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371387 () Bool)

(declare-fun res!914771 () Bool)

(assert (=> b!1371387 (=> (not res!914771) (not e!776831))))

(assert (=> b!1371387 (= res!914771 (not (contains!9688 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371388 () Bool)

(declare-fun res!914784 () Bool)

(assert (=> b!1371388 (=> (not res!914784) (not e!776832))))

(declare-fun lt!602641 () List!32006)

(assert (=> b!1371388 (= res!914784 (not (contains!9688 lt!602641 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371389 () Bool)

(declare-fun res!914775 () Bool)

(assert (=> b!1371389 (=> (not res!914775) (not e!776832))))

(declare-fun noDuplicate!2545 (List!32006) Bool)

(assert (=> b!1371389 (= res!914775 (noDuplicate!2545 lt!602639))))

(declare-fun b!1371390 () Bool)

(declare-fun res!914781 () Bool)

(assert (=> b!1371390 (=> (not res!914781) (not e!776832))))

(assert (=> b!1371390 (= res!914781 (not (contains!9688 lt!602641 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371391 () Bool)

(declare-fun res!914773 () Bool)

(assert (=> b!1371391 (=> (not res!914773) (not e!776832))))

(declare-fun subseq!1090 (List!32006 List!32006) Bool)

(assert (=> b!1371391 (= res!914773 (subseq!1090 lt!602641 lt!602639))))

(declare-fun b!1371392 () Bool)

(declare-fun res!914777 () Bool)

(assert (=> b!1371392 (=> (not res!914777) (not e!776830))))

(assert (=> b!1371392 (= res!914777 (bvslt from!3239 (size!45488 a!3861)))))

(declare-fun b!1371393 () Bool)

(assert (=> b!1371393 (= e!776830 e!776832)))

(declare-fun res!914769 () Bool)

(assert (=> b!1371393 (=> (not res!914769) (not e!776832))))

(assert (=> b!1371393 (= res!914769 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1371393 (= lt!602641 (Cons!32002 (select (arr!44938 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371393 (= lt!602639 (Cons!32002 (select (arr!44938 a!3861) from!3239) acc!866))))

(declare-fun b!1371394 () Bool)

(declare-fun res!914770 () Bool)

(assert (=> b!1371394 (=> (not res!914770) (not e!776831))))

(assert (=> b!1371394 (= res!914770 (subseq!1090 newAcc!98 acc!866))))

(declare-fun b!1371395 () Bool)

(assert (=> b!1371395 (= e!776832 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602639)))))

(declare-fun lt!602638 () Unit!45313)

(assert (=> b!1371395 (= lt!602638 (noDuplicateSubseq!277 lt!602641 lt!602639))))

(declare-fun b!1371396 () Bool)

(declare-fun res!914779 () Bool)

(assert (=> b!1371396 (=> (not res!914779) (not e!776831))))

(assert (=> b!1371396 (= res!914779 (noDuplicate!2545 acc!866))))

(declare-fun b!1371397 () Bool)

(declare-fun res!914774 () Bool)

(assert (=> b!1371397 (=> (not res!914774) (not e!776831))))

(assert (=> b!1371397 (= res!914774 (not (contains!9688 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116088 res!914768) b!1371396))

(assert (= (and b!1371396 res!914779) b!1371386))

(assert (= (and b!1371386 res!914783) b!1371383))

(assert (= (and b!1371383 res!914778) b!1371387))

(assert (= (and b!1371387 res!914771) b!1371397))

(assert (= (and b!1371397 res!914774) b!1371394))

(assert (= (and b!1371394 res!914770) b!1371384))

(assert (= (and b!1371384 res!914776) b!1371392))

(assert (= (and b!1371392 res!914777) b!1371381))

(assert (= (and b!1371381 res!914772) b!1371385))

(assert (= (and b!1371385 res!914785) b!1371393))

(assert (= (and b!1371393 res!914769) b!1371389))

(assert (= (and b!1371389 res!914775) b!1371380))

(assert (= (and b!1371380 res!914780) b!1371382))

(assert (= (and b!1371382 res!914782) b!1371388))

(assert (= (and b!1371388 res!914784) b!1371390))

(assert (= (and b!1371390 res!914781) b!1371391))

(assert (= (and b!1371391 res!914773) b!1371395))

(declare-fun m!1254813 () Bool)

(assert (=> b!1371397 m!1254813))

(declare-fun m!1254815 () Bool)

(assert (=> b!1371395 m!1254815))

(declare-fun m!1254817 () Bool)

(assert (=> b!1371395 m!1254817))

(declare-fun m!1254819 () Bool)

(assert (=> b!1371383 m!1254819))

(declare-fun m!1254821 () Bool)

(assert (=> b!1371396 m!1254821))

(declare-fun m!1254823 () Bool)

(assert (=> start!116088 m!1254823))

(declare-fun m!1254825 () Bool)

(assert (=> b!1371386 m!1254825))

(declare-fun m!1254827 () Bool)

(assert (=> b!1371390 m!1254827))

(declare-fun m!1254829 () Bool)

(assert (=> b!1371382 m!1254829))

(declare-fun m!1254831 () Bool)

(assert (=> b!1371384 m!1254831))

(declare-fun m!1254833 () Bool)

(assert (=> b!1371384 m!1254833))

(declare-fun m!1254835 () Bool)

(assert (=> b!1371380 m!1254835))

(declare-fun m!1254837 () Bool)

(assert (=> b!1371394 m!1254837))

(declare-fun m!1254839 () Bool)

(assert (=> b!1371385 m!1254839))

(assert (=> b!1371385 m!1254839))

(declare-fun m!1254841 () Bool)

(assert (=> b!1371385 m!1254841))

(declare-fun m!1254843 () Bool)

(assert (=> b!1371389 m!1254843))

(assert (=> b!1371381 m!1254839))

(assert (=> b!1371381 m!1254839))

(declare-fun m!1254845 () Bool)

(assert (=> b!1371381 m!1254845))

(declare-fun m!1254847 () Bool)

(assert (=> b!1371387 m!1254847))

(declare-fun m!1254849 () Bool)

(assert (=> b!1371388 m!1254849))

(assert (=> b!1371393 m!1254839))

(declare-fun m!1254851 () Bool)

(assert (=> b!1371391 m!1254851))

(push 1)

(assert (not b!1371397))

(assert (not b!1371385))

(assert (not b!1371386))

(assert (not start!116088))

(assert (not b!1371384))

(assert (not b!1371390))

(assert (not b!1371380))

(assert (not b!1371383))

(assert (not b!1371389))

(assert (not b!1371381))

(assert (not b!1371382))

(assert (not b!1371387))

(assert (not b!1371396))

(assert (not b!1371395))

(assert (not b!1371391))

(assert (not b!1371394))

(assert (not b!1371388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147455 () Bool)

(assert (=> d!147455 (= (array_inv!33966 a!3861) (bvsge (size!45488 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116088 d!147455))

(declare-fun b!1371444 () Bool)

(declare-fun e!776879 () Bool)

(declare-fun e!776881 () Bool)

(assert (=> b!1371444 (= e!776879 e!776881)))

(declare-fun res!914831 () Bool)

(assert (=> b!1371444 (=> (not res!914831) (not e!776881))))

(assert (=> b!1371444 (= res!914831 (is-Cons!32002 acc!866))))

(declare-fun b!1371446 () Bool)

(declare-fun e!776878 () Bool)

(assert (=> b!1371446 (= e!776878 (subseq!1090 (t!46700 newAcc!98) (t!46700 acc!866)))))

(declare-fun b!1371447 () Bool)

(declare-fun e!776880 () Bool)

(assert (=> b!1371447 (= e!776880 (subseq!1090 newAcc!98 (t!46700 acc!866)))))

(declare-fun b!1371445 () Bool)

(assert (=> b!1371445 (= e!776881 e!776880)))

(declare-fun res!914830 () Bool)

(assert (=> b!1371445 (=> res!914830 e!776880)))

(assert (=> b!1371445 (= res!914830 e!776878)))

(declare-fun res!914828 () Bool)

(assert (=> b!1371445 (=> (not res!914828) (not e!776878))))

(assert (=> b!1371445 (= res!914828 (= (h!33211 newAcc!98) (h!33211 acc!866)))))

(declare-fun d!147457 () Bool)

(declare-fun res!914829 () Bool)

(assert (=> d!147457 (=> res!914829 e!776879)))

(assert (=> d!147457 (= res!914829 (is-Nil!32003 newAcc!98))))

(assert (=> d!147457 (= (subseq!1090 newAcc!98 acc!866) e!776879)))

(assert (= (and d!147457 (not res!914829)) b!1371444))

(assert (= (and b!1371444 res!914831) b!1371445))

(assert (= (and b!1371445 res!914828) b!1371446))

(assert (= (and b!1371445 (not res!914830)) b!1371447))

(declare-fun m!1254881 () Bool)

(assert (=> b!1371446 m!1254881))

(declare-fun m!1254883 () Bool)

(assert (=> b!1371447 m!1254883))

(assert (=> b!1371394 d!147457))

(declare-fun d!147465 () Bool)

(declare-fun lt!602652 () Bool)

(declare-fun content!740 (List!32006) (Set (_ BitVec 64)))

(assert (=> d!147465 (= lt!602652 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!740 acc!866)))))

(declare-fun e!776899 () Bool)

(assert (=> d!147465 (= lt!602652 e!776899)))

(declare-fun res!914847 () Bool)

(assert (=> d!147465 (=> (not res!914847) (not e!776899))))

(assert (=> d!147465 (= res!914847 (is-Cons!32002 acc!866))))

(assert (=> d!147465 (= (contains!9688 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602652)))

(declare-fun b!1371465 () Bool)

(declare-fun e!776898 () Bool)

(assert (=> b!1371465 (= e!776899 e!776898)))

(declare-fun res!914848 () Bool)

(assert (=> b!1371465 (=> res!914848 e!776898)))

(assert (=> b!1371465 (= res!914848 (= (h!33211 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371466 () Bool)

(assert (=> b!1371466 (= e!776898 (contains!9688 (t!46700 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147465 res!914847) b!1371465))

(assert (= (and b!1371465 (not res!914848)) b!1371466))

(declare-fun m!1254887 () Bool)

(assert (=> d!147465 m!1254887))

(declare-fun m!1254889 () Bool)

(assert (=> d!147465 m!1254889))

(declare-fun m!1254891 () Bool)

(assert (=> b!1371466 m!1254891))

(assert (=> b!1371383 d!147465))

(declare-fun e!776942 () Bool)

(declare-fun b!1371510 () Bool)

(assert (=> b!1371510 (= e!776942 (contains!9688 acc!866 (select (arr!44938 a!3861) from!3239)))))

(declare-fun b!1371511 () Bool)

(declare-fun e!776941 () Bool)

(declare-fun e!776943 () Bool)

(assert (=> b!1371511 (= e!776941 e!776943)))

(declare-fun res!914887 () Bool)

(assert (=> b!1371511 (=> (not res!914887) (not e!776943))))

(assert (=> b!1371511 (= res!914887 (not e!776942))))

(declare-fun res!914888 () Bool)

(assert (=> b!1371511 (=> (not res!914888) (not e!776942))))

(assert (=> b!1371511 (= res!914888 (validKeyInArray!0 (select (arr!44938 a!3861) from!3239)))))

(declare-fun c!127752 () Bool)

(declare-fun call!65559 () Bool)

(declare-fun bm!65556 () Bool)

(assert (=> bm!65556 (= call!65559 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127752 (Cons!32002 (select (arr!44938 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!147469 () Bool)

(declare-fun res!914886 () Bool)

(assert (=> d!147469 (=> res!914886 e!776941)))

(assert (=> d!147469 (= res!914886 (bvsge from!3239 (size!45488 a!3861)))))

(assert (=> d!147469 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776941)))

(declare-fun b!1371512 () Bool)

(declare-fun e!776940 () Bool)

(assert (=> b!1371512 (= e!776940 call!65559)))

(declare-fun b!1371513 () Bool)

(assert (=> b!1371513 (= e!776943 e!776940)))

(assert (=> b!1371513 (= c!127752 (validKeyInArray!0 (select (arr!44938 a!3861) from!3239)))))

(declare-fun b!1371514 () Bool)

(assert (=> b!1371514 (= e!776940 call!65559)))

(assert (= (and d!147469 (not res!914886)) b!1371511))

(assert (= (and b!1371511 res!914888) b!1371510))

(assert (= (and b!1371511 res!914887) b!1371513))

(assert (= (and b!1371513 c!127752) b!1371512))

(assert (= (and b!1371513 (not c!127752)) b!1371514))

(assert (= (or b!1371512 b!1371514) bm!65556))

(assert (=> b!1371510 m!1254839))

(assert (=> b!1371510 m!1254839))

(assert (=> b!1371510 m!1254841))

(assert (=> b!1371511 m!1254839))

(assert (=> b!1371511 m!1254839))

(assert (=> b!1371511 m!1254845))

(assert (=> bm!65556 m!1254839))

(declare-fun m!1254955 () Bool)

(assert (=> bm!65556 m!1254955))

(assert (=> b!1371513 m!1254839))

(assert (=> b!1371513 m!1254839))

(assert (=> b!1371513 m!1254845))

(assert (=> b!1371384 d!147469))

(declare-fun d!147501 () Bool)

(assert (=> d!147501 (noDuplicate!2545 newAcc!98)))

(declare-fun lt!602670 () Unit!45313)

(declare-fun choose!2015 (List!32006 List!32006) Unit!45313)

(assert (=> d!147501 (= lt!602670 (choose!2015 newAcc!98 acc!866))))

(declare-fun e!776972 () Bool)

(assert (=> d!147501 e!776972))

(declare-fun res!914917 () Bool)

(assert (=> d!147501 (=> (not res!914917) (not e!776972))))

(assert (=> d!147501 (= res!914917 (subseq!1090 newAcc!98 acc!866))))

(assert (=> d!147501 (= (noDuplicateSubseq!277 newAcc!98 acc!866) lt!602670)))

(declare-fun b!1371543 () Bool)

(assert (=> b!1371543 (= e!776972 (noDuplicate!2545 acc!866))))

(assert (= (and d!147501 res!914917) b!1371543))

(declare-fun m!1254983 () Bool)

(assert (=> d!147501 m!1254983))

(declare-fun m!1254985 () Bool)

(assert (=> d!147501 m!1254985))

(assert (=> d!147501 m!1254837))

(assert (=> b!1371543 m!1254821))

(assert (=> b!1371384 d!147501))

(declare-fun e!776977 () Bool)

(declare-fun b!1371548 () Bool)

(assert (=> b!1371548 (= e!776977 (contains!9688 lt!602639 (select (arr!44938 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371549 () Bool)

(declare-fun e!776976 () Bool)

(declare-fun e!776978 () Bool)

(assert (=> b!1371549 (= e!776976 e!776978)))

(declare-fun res!914919 () Bool)

(assert (=> b!1371549 (=> (not res!914919) (not e!776978))))

(assert (=> b!1371549 (= res!914919 (not e!776977))))

(declare-fun res!914920 () Bool)

(assert (=> b!1371549 (=> (not res!914920) (not e!776977))))

(assert (=> b!1371549 (= res!914920 (validKeyInArray!0 (select (arr!44938 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65559 () Bool)

(declare-fun c!127755 () Bool)

(declare-fun call!65562 () Bool)

(assert (=> bm!65559 (= call!65562 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127755 (Cons!32002 (select (arr!44938 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602639) lt!602639)))))

(declare-fun d!147513 () Bool)

(declare-fun res!914918 () Bool)

(assert (=> d!147513 (=> res!914918 e!776976)))

(assert (=> d!147513 (= res!914918 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45488 a!3861)))))

(assert (=> d!147513 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602639) e!776976)))

(declare-fun b!1371550 () Bool)

(declare-fun e!776975 () Bool)

(assert (=> b!1371550 (= e!776975 call!65562)))

(declare-fun b!1371551 () Bool)

(assert (=> b!1371551 (= e!776978 e!776975)))

(assert (=> b!1371551 (= c!127755 (validKeyInArray!0 (select (arr!44938 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371552 () Bool)

(assert (=> b!1371552 (= e!776975 call!65562)))

(assert (= (and d!147513 (not res!914918)) b!1371549))

(assert (= (and b!1371549 res!914920) b!1371548))

(assert (= (and b!1371549 res!914919) b!1371551))

(assert (= (and b!1371551 c!127755) b!1371550))

(assert (= (and b!1371551 (not c!127755)) b!1371552))

(assert (= (or b!1371550 b!1371552) bm!65559))

(declare-fun m!1254987 () Bool)

(assert (=> b!1371548 m!1254987))

(assert (=> b!1371548 m!1254987))

(declare-fun m!1254989 () Bool)

(assert (=> b!1371548 m!1254989))

(assert (=> b!1371549 m!1254987))

(assert (=> b!1371549 m!1254987))

(declare-fun m!1254991 () Bool)

(assert (=> b!1371549 m!1254991))

(assert (=> bm!65559 m!1254987))

(declare-fun m!1254993 () Bool)

(assert (=> bm!65559 m!1254993))

(assert (=> b!1371551 m!1254987))

(assert (=> b!1371551 m!1254987))

(assert (=> b!1371551 m!1254991))

(assert (=> b!1371395 d!147513))

(declare-fun d!147515 () Bool)

(assert (=> d!147515 (noDuplicate!2545 lt!602641)))

(declare-fun lt!602671 () Unit!45313)

(assert (=> d!147515 (= lt!602671 (choose!2015 lt!602641 lt!602639))))

(declare-fun e!776979 () Bool)

(assert (=> d!147515 e!776979))

(declare-fun res!914921 () Bool)

(assert (=> d!147515 (=> (not res!914921) (not e!776979))))

(assert (=> d!147515 (= res!914921 (subseq!1090 lt!602641 lt!602639))))

(assert (=> d!147515 (= (noDuplicateSubseq!277 lt!602641 lt!602639) lt!602671)))

(declare-fun b!1371553 () Bool)

(assert (=> b!1371553 (= e!776979 (noDuplicate!2545 lt!602639))))

(assert (= (and d!147515 res!914921) b!1371553))

(declare-fun m!1254995 () Bool)

(assert (=> d!147515 m!1254995))

(declare-fun m!1254997 () Bool)

(assert (=> d!147515 m!1254997))

(assert (=> d!147515 m!1254851))

(assert (=> b!1371553 m!1254843))

(assert (=> b!1371395 d!147515))

(declare-fun d!147517 () Bool)

(declare-fun res!914929 () Bool)

(declare-fun e!776988 () Bool)

(assert (=> d!147517 (=> res!914929 e!776988)))

(assert (=> d!147517 (= res!914929 (is-Nil!32003 acc!866))))

(assert (=> d!147517 (= (noDuplicate!2545 acc!866) e!776988)))

(declare-fun b!1371563 () Bool)

(declare-fun e!776989 () Bool)

(assert (=> b!1371563 (= e!776988 e!776989)))

(declare-fun res!914930 () Bool)

(assert (=> b!1371563 (=> (not res!914930) (not e!776989))))

(assert (=> b!1371563 (= res!914930 (not (contains!9688 (t!46700 acc!866) (h!33211 acc!866))))))

(declare-fun b!1371564 () Bool)

(assert (=> b!1371564 (= e!776989 (noDuplicate!2545 (t!46700 acc!866)))))

(assert (= (and d!147517 (not res!914929)) b!1371563))

(assert (= (and b!1371563 res!914930) b!1371564))

(declare-fun m!1255007 () Bool)

(assert (=> b!1371563 m!1255007))

(declare-fun m!1255009 () Bool)

(assert (=> b!1371564 m!1255009))

(assert (=> b!1371396 d!147517))

(declare-fun lt!602672 () Bool)

(declare-fun d!147521 () Bool)

(assert (=> d!147521 (= lt!602672 (member (select (arr!44938 a!3861) from!3239) (content!740 acc!866)))))

(declare-fun e!776991 () Bool)

(assert (=> d!147521 (= lt!602672 e!776991)))

(declare-fun res!914931 () Bool)

(assert (=> d!147521 (=> (not res!914931) (not e!776991))))

(assert (=> d!147521 (= res!914931 (is-Cons!32002 acc!866))))

(assert (=> d!147521 (= (contains!9688 acc!866 (select (arr!44938 a!3861) from!3239)) lt!602672)))

(declare-fun b!1371565 () Bool)

(declare-fun e!776990 () Bool)

(assert (=> b!1371565 (= e!776991 e!776990)))

(declare-fun res!914932 () Bool)

(assert (=> b!1371565 (=> res!914932 e!776990)))

(assert (=> b!1371565 (= res!914932 (= (h!33211 acc!866) (select (arr!44938 a!3861) from!3239)))))

(declare-fun b!1371566 () Bool)

(assert (=> b!1371566 (= e!776990 (contains!9688 (t!46700 acc!866) (select (arr!44938 a!3861) from!3239)))))

(assert (= (and d!147521 res!914931) b!1371565))

(assert (= (and b!1371565 (not res!914932)) b!1371566))

(assert (=> d!147521 m!1254887))

(assert (=> d!147521 m!1254839))

(declare-fun m!1255011 () Bool)

(assert (=> d!147521 m!1255011))

(assert (=> b!1371566 m!1254839))

(declare-fun m!1255013 () Bool)

(assert (=> b!1371566 m!1255013))

(assert (=> b!1371385 d!147521))

(declare-fun d!147523 () Bool)

(declare-fun lt!602673 () Bool)

(assert (=> d!147523 (= lt!602673 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!740 acc!866)))))

(declare-fun e!776993 () Bool)

(assert (=> d!147523 (= lt!602673 e!776993)))

(declare-fun res!914933 () Bool)

(assert (=> d!147523 (=> (not res!914933) (not e!776993))))

(assert (=> d!147523 (= res!914933 (is-Cons!32002 acc!866))))

(assert (=> d!147523 (= (contains!9688 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602673)))

(declare-fun b!1371567 () Bool)

(declare-fun e!776992 () Bool)

(assert (=> b!1371567 (= e!776993 e!776992)))

(declare-fun res!914934 () Bool)

(assert (=> b!1371567 (=> res!914934 e!776992)))

(assert (=> b!1371567 (= res!914934 (= (h!33211 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371568 () Bool)

(assert (=> b!1371568 (= e!776992 (contains!9688 (t!46700 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147523 res!914933) b!1371567))

(assert (= (and b!1371567 (not res!914934)) b!1371568))

(assert (=> d!147523 m!1254887))

(declare-fun m!1255015 () Bool)

(assert (=> d!147523 m!1255015))

(declare-fun m!1255017 () Bool)

(assert (=> b!1371568 m!1255017))

(assert (=> b!1371386 d!147523))

(declare-fun d!147525 () Bool)

(declare-fun lt!602676 () Bool)

(assert (=> d!147525 (= lt!602676 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!740 newAcc!98)))))

(declare-fun e!776997 () Bool)

(assert (=> d!147525 (= lt!602676 e!776997)))

(declare-fun res!914937 () Bool)

(assert (=> d!147525 (=> (not res!914937) (not e!776997))))

(assert (=> d!147525 (= res!914937 (is-Cons!32002 newAcc!98))))

(assert (=> d!147525 (= (contains!9688 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602676)))

