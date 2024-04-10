; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115490 () Bool)

(assert start!115490)

(declare-fun b!1366391 () Bool)

(declare-fun res!909968 () Bool)

(declare-fun e!774427 () Bool)

(assert (=> b!1366391 (=> (not res!909968) (not e!774427))))

(declare-datatypes ((List!31902 0))(
  ( (Nil!31899) (Cons!31898 (h!33107 (_ BitVec 64)) (t!46596 List!31902)) )
))
(declare-fun acc!866 () List!31902)

(declare-fun contains!9584 (List!31902 (_ BitVec 64)) Bool)

(assert (=> b!1366391 (= res!909968 (not (contains!9584 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366392 () Bool)

(declare-fun res!909966 () Bool)

(assert (=> b!1366392 (=> (not res!909966) (not e!774427))))

(assert (=> b!1366392 (= res!909966 (not (contains!9584 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366393 () Bool)

(declare-fun res!909972 () Bool)

(declare-fun e!774425 () Bool)

(assert (=> b!1366393 (=> (not res!909972) (not e!774425))))

(declare-datatypes ((array!92811 0))(
  ( (array!92812 (arr!44834 (Array (_ BitVec 32) (_ BitVec 64))) (size!45384 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92811)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1366393 (= res!909972 (not (contains!9584 acc!866 (select (arr!44834 a!3861) from!3239))))))

(declare-fun b!1366394 () Bool)

(declare-fun res!909965 () Bool)

(assert (=> b!1366394 (=> (not res!909965) (not e!774427))))

(declare-fun noDuplicate!2441 (List!31902) Bool)

(assert (=> b!1366394 (= res!909965 (noDuplicate!2441 acc!866))))

(declare-fun b!1366395 () Bool)

(declare-fun res!909974 () Bool)

(assert (=> b!1366395 (=> (not res!909974) (not e!774427))))

(declare-fun newAcc!98 () List!31902)

(assert (=> b!1366395 (= res!909974 (not (contains!9584 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366396 () Bool)

(declare-fun res!909967 () Bool)

(assert (=> b!1366396 (=> (not res!909967) (not e!774425))))

(assert (=> b!1366396 (= res!909967 (bvslt from!3239 (size!45384 a!3861)))))

(declare-fun b!1366397 () Bool)

(declare-fun res!909976 () Bool)

(assert (=> b!1366397 (=> (not res!909976) (not e!774427))))

(assert (=> b!1366397 (= res!909976 (not (contains!9584 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366399 () Bool)

(declare-fun res!909970 () Bool)

(assert (=> b!1366399 (=> (not res!909970) (not e!774427))))

(declare-fun subseq!986 (List!31902 List!31902) Bool)

(assert (=> b!1366399 (= res!909970 (subseq!986 newAcc!98 acc!866))))

(declare-fun b!1366400 () Bool)

(declare-fun res!909975 () Bool)

(assert (=> b!1366400 (=> (not res!909975) (not e!774425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366400 (= res!909975 (validKeyInArray!0 (select (arr!44834 a!3861) from!3239)))))

(declare-fun b!1366401 () Bool)

(declare-fun e!774426 () Bool)

(declare-fun lt!601554 () List!31902)

(assert (=> b!1366401 (= e!774426 (noDuplicate!2441 lt!601554))))

(declare-fun b!1366402 () Bool)

(assert (=> b!1366402 (= e!774427 e!774425)))

(declare-fun res!909971 () Bool)

(assert (=> b!1366402 (=> (not res!909971) (not e!774425))))

(declare-fun arrayNoDuplicates!0 (array!92811 (_ BitVec 32) List!31902) Bool)

(assert (=> b!1366402 (= res!909971 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45105 0))(
  ( (Unit!45106) )
))
(declare-fun lt!601552 () Unit!45105)

(declare-fun noDuplicateSubseq!173 (List!31902 List!31902) Unit!45105)

(assert (=> b!1366402 (= lt!601552 (noDuplicateSubseq!173 newAcc!98 acc!866))))

(declare-fun b!1366398 () Bool)

(assert (=> b!1366398 (= e!774425 (not e!774426))))

(declare-fun res!909973 () Bool)

(assert (=> b!1366398 (=> (not res!909973) (not e!774426))))

(declare-fun lt!601553 () List!31902)

(assert (=> b!1366398 (= res!909973 (subseq!986 lt!601553 lt!601554))))

(assert (=> b!1366398 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601553)))

(declare-fun lt!601555 () Unit!45105)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92811 List!31902 List!31902 (_ BitVec 32)) Unit!45105)

(assert (=> b!1366398 (= lt!601555 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601554 lt!601553 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366398 (= lt!601553 (Cons!31898 (select (arr!44834 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366398 (= lt!601554 (Cons!31898 (select (arr!44834 a!3861) from!3239) acc!866))))

(declare-fun res!909969 () Bool)

(assert (=> start!115490 (=> (not res!909969) (not e!774427))))

(assert (=> start!115490 (= res!909969 (and (bvslt (size!45384 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45384 a!3861))))))

(assert (=> start!115490 e!774427))

(declare-fun array_inv!33862 (array!92811) Bool)

(assert (=> start!115490 (array_inv!33862 a!3861)))

(assert (=> start!115490 true))

(assert (= (and start!115490 res!909969) b!1366394))

(assert (= (and b!1366394 res!909965) b!1366392))

(assert (= (and b!1366392 res!909966) b!1366391))

(assert (= (and b!1366391 res!909968) b!1366397))

(assert (= (and b!1366397 res!909976) b!1366395))

(assert (= (and b!1366395 res!909974) b!1366399))

(assert (= (and b!1366399 res!909970) b!1366402))

(assert (= (and b!1366402 res!909971) b!1366396))

(assert (= (and b!1366396 res!909967) b!1366400))

(assert (= (and b!1366400 res!909975) b!1366393))

(assert (= (and b!1366393 res!909972) b!1366398))

(assert (= (and b!1366398 res!909973) b!1366401))

(declare-fun m!1250701 () Bool)

(assert (=> b!1366393 m!1250701))

(assert (=> b!1366393 m!1250701))

(declare-fun m!1250703 () Bool)

(assert (=> b!1366393 m!1250703))

(declare-fun m!1250705 () Bool)

(assert (=> b!1366394 m!1250705))

(declare-fun m!1250707 () Bool)

(assert (=> b!1366395 m!1250707))

(declare-fun m!1250709 () Bool)

(assert (=> b!1366398 m!1250709))

(declare-fun m!1250711 () Bool)

(assert (=> b!1366398 m!1250711))

(declare-fun m!1250713 () Bool)

(assert (=> b!1366398 m!1250713))

(assert (=> b!1366398 m!1250701))

(declare-fun m!1250715 () Bool)

(assert (=> b!1366391 m!1250715))

(declare-fun m!1250717 () Bool)

(assert (=> b!1366392 m!1250717))

(assert (=> b!1366400 m!1250701))

(assert (=> b!1366400 m!1250701))

(declare-fun m!1250719 () Bool)

(assert (=> b!1366400 m!1250719))

(declare-fun m!1250721 () Bool)

(assert (=> b!1366399 m!1250721))

(declare-fun m!1250723 () Bool)

(assert (=> b!1366401 m!1250723))

(declare-fun m!1250725 () Bool)

(assert (=> b!1366397 m!1250725))

(declare-fun m!1250727 () Bool)

(assert (=> b!1366402 m!1250727))

(declare-fun m!1250729 () Bool)

(assert (=> b!1366402 m!1250729))

(declare-fun m!1250731 () Bool)

(assert (=> start!115490 m!1250731))

(push 1)

(assert (not b!1366398))

(assert (not start!115490))

(assert (not b!1366400))

(assert (not b!1366393))

(assert (not b!1366394))

(assert (not b!1366399))

(assert (not b!1366391))

(assert (not b!1366397))

(assert (not b!1366402))

(assert (not b!1366401))

(assert (not b!1366392))

(assert (not b!1366395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146635 () Bool)

(declare-fun lt!601589 () Bool)

(declare-fun content!712 (List!31902) (Set (_ BitVec 64)))

(assert (=> d!146635 (= lt!601589 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!712 newAcc!98)))))

(declare-fun e!774477 () Bool)

(assert (=> d!146635 (= lt!601589 e!774477)))

(declare-fun res!910074 () Bool)

(assert (=> d!146635 (=> (not res!910074) (not e!774477))))

(assert (=> d!146635 (= res!910074 (is-Cons!31898 newAcc!98))))

(assert (=> d!146635 (= (contains!9584 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601589)))

(declare-fun b!1366499 () Bool)

(declare-fun e!774476 () Bool)

(assert (=> b!1366499 (= e!774477 e!774476)))

(declare-fun res!910073 () Bool)

(assert (=> b!1366499 (=> res!910073 e!774476)))

(assert (=> b!1366499 (= res!910073 (= (h!33107 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366500 () Bool)

(assert (=> b!1366500 (= e!774476 (contains!9584 (t!46596 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146635 res!910074) b!1366499))

(assert (= (and b!1366499 (not res!910073)) b!1366500))

(declare-fun m!1250815 () Bool)

(assert (=> d!146635 m!1250815))

(declare-fun m!1250817 () Bool)

(assert (=> d!146635 m!1250817))

(declare-fun m!1250819 () Bool)

(assert (=> b!1366500 m!1250819))

(assert (=> b!1366397 d!146635))

(declare-fun b!1366532 () Bool)

(declare-fun e!774507 () Bool)

(assert (=> b!1366532 (= e!774507 (subseq!986 lt!601553 (t!46596 lt!601554)))))

(declare-fun b!1366529 () Bool)

(declare-fun e!774504 () Bool)

(declare-fun e!774506 () Bool)

(assert (=> b!1366529 (= e!774504 e!774506)))

(declare-fun res!910102 () Bool)

(assert (=> b!1366529 (=> (not res!910102) (not e!774506))))

(assert (=> b!1366529 (= res!910102 (is-Cons!31898 lt!601554))))

(declare-fun b!1366530 () Bool)

(assert (=> b!1366530 (= e!774506 e!774507)))

(declare-fun res!910099 () Bool)

(assert (=> b!1366530 (=> res!910099 e!774507)))

(declare-fun e!774505 () Bool)

(assert (=> b!1366530 (= res!910099 e!774505)))

(declare-fun res!910101 () Bool)

(assert (=> b!1366530 (=> (not res!910101) (not e!774505))))

(assert (=> b!1366530 (= res!910101 (= (h!33107 lt!601553) (h!33107 lt!601554)))))

(declare-fun d!146643 () Bool)

(declare-fun res!910100 () Bool)

(assert (=> d!146643 (=> res!910100 e!774504)))

(assert (=> d!146643 (= res!910100 (is-Nil!31899 lt!601553))))

(assert (=> d!146643 (= (subseq!986 lt!601553 lt!601554) e!774504)))

(declare-fun b!1366531 () Bool)

(assert (=> b!1366531 (= e!774505 (subseq!986 (t!46596 lt!601553) (t!46596 lt!601554)))))

(assert (= (and d!146643 (not res!910100)) b!1366529))

(assert (= (and b!1366529 res!910102) b!1366530))

(assert (= (and b!1366530 res!910101) b!1366531))

(assert (= (and b!1366530 (not res!910099)) b!1366532))

(declare-fun m!1250835 () Bool)

(assert (=> b!1366532 m!1250835))

(declare-fun m!1250837 () Bool)

(assert (=> b!1366531 m!1250837))

(assert (=> b!1366398 d!146643))

(declare-fun b!1366563 () Bool)

(declare-fun e!774535 () Bool)

(declare-fun call!65465 () Bool)

(assert (=> b!1366563 (= e!774535 call!65465)))

(declare-fun c!127658 () Bool)

(declare-fun bm!65462 () Bool)

(assert (=> bm!65462 (= call!65465 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127658 (Cons!31898 (select (arr!44834 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601553) lt!601553)))))

(declare-fun d!146653 () Bool)

(declare-fun res!910128 () Bool)

(declare-fun e!774538 () Bool)

(assert (=> d!146653 (=> res!910128 e!774538)))

(assert (=> d!146653 (= res!910128 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45384 a!3861)))))

(assert (=> d!146653 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601553) e!774538)))

(declare-fun b!1366564 () Bool)

(declare-fun e!774537 () Bool)

(assert (=> b!1366564 (= e!774538 e!774537)))

(declare-fun res!910127 () Bool)

(assert (=> b!1366564 (=> (not res!910127) (not e!774537))))

(declare-fun e!774536 () Bool)

(assert (=> b!1366564 (= res!910127 (not e!774536))))

(declare-fun res!910129 () Bool)

(assert (=> b!1366564 (=> (not res!910129) (not e!774536))))

(assert (=> b!1366564 (= res!910129 (validKeyInArray!0 (select (arr!44834 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1366565 () Bool)

(assert (=> b!1366565 (= e!774537 e!774535)))

(assert (=> b!1366565 (= c!127658 (validKeyInArray!0 (select (arr!44834 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1366566 () Bool)

(assert (=> b!1366566 (= e!774536 (contains!9584 lt!601553 (select (arr!44834 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1366567 () Bool)

(assert (=> b!1366567 (= e!774535 call!65465)))

(assert (= (and d!146653 (not res!910128)) b!1366564))

(assert (= (and b!1366564 res!910129) b!1366566))

(assert (= (and b!1366564 res!910127) b!1366565))

(assert (= (and b!1366565 c!127658) b!1366563))

(assert (= (and b!1366565 (not c!127658)) b!1366567))

(assert (= (or b!1366563 b!1366567) bm!65462))

(declare-fun m!1250849 () Bool)

(assert (=> bm!65462 m!1250849))

(declare-fun m!1250851 () Bool)

(assert (=> bm!65462 m!1250851))

(assert (=> b!1366564 m!1250849))

(assert (=> b!1366564 m!1250849))

(declare-fun m!1250853 () Bool)

(assert (=> b!1366564 m!1250853))

(assert (=> b!1366565 m!1250849))

(assert (=> b!1366565 m!1250849))

(assert (=> b!1366565 m!1250853))

(assert (=> b!1366566 m!1250849))

(assert (=> b!1366566 m!1250849))

(declare-fun m!1250855 () Bool)

(assert (=> b!1366566 m!1250855))

(assert (=> b!1366398 d!146653))

(declare-fun d!146661 () Bool)

(assert (=> d!146661 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601553)))

(declare-fun lt!601596 () Unit!45105)

(declare-fun choose!80 (array!92811 List!31902 List!31902 (_ BitVec 32)) Unit!45105)

(assert (=> d!146661 (= lt!601596 (choose!80 a!3861 lt!601554 lt!601553 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146661 (bvslt (size!45384 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146661 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601554 lt!601553 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601596)))

(declare-fun bs!39204 () Bool)

(assert (= bs!39204 d!146661))

(assert (=> bs!39204 m!1250711))

(declare-fun m!1250871 () Bool)

(assert (=> bs!39204 m!1250871))

(assert (=> b!1366398 d!146661))

(declare-fun d!146667 () Bool)

(declare-fun res!910162 () Bool)

(declare-fun e!774575 () Bool)

(assert (=> d!146667 (=> res!910162 e!774575)))

(assert (=> d!146667 (= res!910162 (is-Nil!31899 acc!866))))

(assert (=> d!146667 (= (noDuplicate!2441 acc!866) e!774575)))

(declare-fun b!1366608 () Bool)

(declare-fun e!774576 () Bool)

(assert (=> b!1366608 (= e!774575 e!774576)))

(declare-fun res!910163 () Bool)

(assert (=> b!1366608 (=> (not res!910163) (not e!774576))))

(assert (=> b!1366608 (= res!910163 (not (contains!9584 (t!46596 acc!866) (h!33107 acc!866))))))

(declare-fun b!1366609 () Bool)

(assert (=> b!1366609 (= e!774576 (noDuplicate!2441 (t!46596 acc!866)))))

(assert (= (and d!146667 (not res!910162)) b!1366608))

(assert (= (and b!1366608 res!910163) b!1366609))

(declare-fun m!1250877 () Bool)

(assert (=> b!1366608 m!1250877))

(declare-fun m!1250879 () Bool)

(assert (=> b!1366609 m!1250879))

(assert (=> b!1366394 d!146667))

(declare-fun d!146673 () Bool)

(declare-fun lt!601600 () Bool)

(assert (=> d!146673 (= lt!601600 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!712 newAcc!98)))))

(declare-fun e!774578 () Bool)

(assert (=> d!146673 (= lt!601600 e!774578)))

(declare-fun res!910165 () Bool)

(assert (=> d!146673 (=> (not res!910165) (not e!774578))))

(assert (=> d!146673 (= res!910165 (is-Cons!31898 newAcc!98))))

(assert (=> d!146673 (= (contains!9584 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601600)))

(declare-fun b!1366610 () Bool)

(declare-fun e!774577 () Bool)

(assert (=> b!1366610 (= e!774578 e!774577)))

(declare-fun res!910164 () Bool)

(assert (=> b!1366610 (=> res!910164 e!774577)))

(assert (=> b!1366610 (= res!910164 (= (h!33107 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366611 () Bool)

(assert (=> b!1366611 (= e!774577 (contains!9584 (t!46596 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146673 res!910165) b!1366610))

(assert (= (and b!1366610 (not res!910164)) b!1366611))

(assert (=> d!146673 m!1250815))

(declare-fun m!1250883 () Bool)

(assert (=> d!146673 m!1250883))

(declare-fun m!1250885 () Bool)

(assert (=> b!1366611 m!1250885))

(assert (=> b!1366395 d!146673))

(declare-fun d!146677 () Bool)

(assert (=> d!146677 (= (array_inv!33862 a!3861) (bvsge (size!45384 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115490 d!146677))

(declare-fun b!1366618 () Bool)

(declare-fun e!774585 () Bool)

(declare-fun call!65470 () Bool)

(assert (=> b!1366618 (= e!774585 call!65470)))

(declare-fun bm!65467 () Bool)

(declare-fun c!127663 () Bool)

(assert (=> bm!65467 (= call!65470 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127663 (Cons!31898 (select (arr!44834 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!146681 () Bool)

(declare-fun res!910173 () Bool)

(declare-fun e!774588 () Bool)

(assert (=> d!146681 (=> res!910173 e!774588)))

(assert (=> d!146681 (= res!910173 (bvsge from!3239 (size!45384 a!3861)))))

(assert (=> d!146681 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774588)))

(declare-fun b!1366619 () Bool)

(declare-fun e!774587 () Bool)

(assert (=> b!1366619 (= e!774588 e!774587)))

(declare-fun res!910172 () Bool)

(assert (=> b!1366619 (=> (not res!910172) (not e!774587))))

(declare-fun e!774586 () Bool)

(assert (=> b!1366619 (= res!910172 (not e!774586))))

(declare-fun res!910174 () Bool)

(assert (=> b!1366619 (=> (not res!910174) (not e!774586))))

(assert (=> b!1366619 (= res!910174 (validKeyInArray!0 (select (arr!44834 a!3861) from!3239)))))

(declare-fun b!1366620 () Bool)

(assert (=> b!1366620 (= e!774587 e!774585)))

(assert (=> b!1366620 (= c!127663 (validKeyInArray!0 (select (arr!44834 a!3861) from!3239)))))

(declare-fun b!1366621 () Bool)

(assert (=> b!1366621 (= e!774586 (contains!9584 acc!866 (select (arr!44834 a!3861) from!3239)))))

(declare-fun b!1366622 () Bool)

(assert (=> b!1366622 (= e!774585 call!65470)))

(assert (= (and d!146681 (not res!910173)) b!1366619))

(assert (= (and b!1366619 res!910174) b!1366621))

(assert (= (and b!1366619 res!910172) b!1366620))

(assert (= (and b!1366620 c!127663) b!1366618))

(assert (= (and b!1366620 (not c!127663)) b!1366622))

(assert (= (or b!1366618 b!1366622) bm!65467))

(assert (=> bm!65467 m!1250701))

(declare-fun m!1250905 () Bool)

(assert (=> bm!65467 m!1250905))

(assert (=> b!1366619 m!1250701))

(assert (=> b!1366619 m!1250701))

(assert (=> b!1366619 m!1250719))

(assert (=> b!1366620 m!1250701))

(assert (=> b!1366620 m!1250701))

(assert (=> b!1366620 m!1250719))

(assert (=> b!1366621 m!1250701))

(assert (=> b!1366621 m!1250701))

(assert (=> b!1366621 m!1250703))

(assert (=> b!1366402 d!146681))

(declare-fun d!146687 () Bool)

(assert (=> d!146687 (noDuplicate!2441 newAcc!98)))

(declare-fun lt!601610 () Unit!45105)

(declare-fun choose!1992 (List!31902 List!31902) Unit!45105)

(assert (=> d!146687 (= lt!601610 (choose!1992 newAcc!98 acc!866))))

(declare-fun e!774606 () Bool)

(assert (=> d!146687 e!774606))

(declare-fun res!910191 () Bool)

(assert (=> d!146687 (=> (not res!910191) (not e!774606))))

(assert (=> d!146687 (= res!910191 (subseq!986 newAcc!98 acc!866))))

(assert (=> d!146687 (= (noDuplicateSubseq!173 newAcc!98 acc!866) lt!601610)))

(declare-fun b!1366641 () Bool)

(assert (=> b!1366641 (= e!774606 (noDuplicate!2441 acc!866))))

(assert (= (and d!146687 res!910191) b!1366641))

(declare-fun m!1250929 () Bool)

(assert (=> d!146687 m!1250929))

(declare-fun m!1250931 () Bool)

(assert (=> d!146687 m!1250931))

(assert (=> d!146687 m!1250721))

(assert (=> b!1366641 m!1250705))

(assert (=> b!1366402 d!146687))

(declare-fun d!146697 () Bool)

(declare-fun lt!601611 () Bool)

(assert (=> d!146697 (= lt!601611 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!712 acc!866)))))

(declare-fun e!774608 () Bool)

(assert (=> d!146697 (= lt!601611 e!774608)))

(declare-fun res!910193 () Bool)

(assert (=> d!146697 (=> (not res!910193) (not e!774608))))

(assert (=> d!146697 (= res!910193 (is-Cons!31898 acc!866))))

(assert (=> d!146697 (= (contains!9584 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601611)))

(declare-fun b!1366642 () Bool)

(declare-fun e!774607 () Bool)

(assert (=> b!1366642 (= e!774608 e!774607)))

(declare-fun res!910192 () Bool)

(assert (=> b!1366642 (=> res!910192 e!774607)))

(assert (=> b!1366642 (= res!910192 (= (h!33107 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366643 () Bool)

(assert (=> b!1366643 (= e!774607 (contains!9584 (t!46596 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146697 res!910193) b!1366642))

(assert (= (and b!1366642 (not res!910192)) b!1366643))

(declare-fun m!1250933 () Bool)

(assert (=> d!146697 m!1250933))

(declare-fun m!1250935 () Bool)

(assert (=> d!146697 m!1250935))

(declare-fun m!1250937 () Bool)

(assert (=> b!1366643 m!1250937))

(assert (=> b!1366391 d!146697))

(declare-fun d!146699 () Bool)

(declare-fun lt!601612 () Bool)

(assert (=> d!146699 (= lt!601612 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!712 acc!866)))))

(declare-fun e!774610 () Bool)

(assert (=> d!146699 (= lt!601612 e!774610)))

(declare-fun res!910195 () Bool)

(assert (=> d!146699 (=> (not res!910195) (not e!774610))))

(assert (=> d!146699 (= res!910195 (is-Cons!31898 acc!866))))

(assert (=> d!146699 (= (contains!9584 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601612)))

(declare-fun b!1366644 () Bool)

(declare-fun e!774609 () Bool)

(assert (=> b!1366644 (= e!774610 e!774609)))

(declare-fun res!910194 () Bool)

(assert (=> b!1366644 (=> res!910194 e!774609)))

(assert (=> b!1366644 (= res!910194 (= (h!33107 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366645 () Bool)

(assert (=> b!1366645 (= e!774609 (contains!9584 (t!46596 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146699 res!910195) b!1366644))

(assert (= (and b!1366644 (not res!910194)) b!1366645))

(assert (=> d!146699 m!1250933))

(declare-fun m!1250939 () Bool)

(assert (=> d!146699 m!1250939))

(declare-fun m!1250941 () Bool)

(assert (=> b!1366645 m!1250941))

(assert (=> b!1366392 d!146699))

(declare-fun lt!601613 () Bool)

(declare-fun d!146701 () Bool)

(assert (=> d!146701 (= lt!601613 (set.member (select (arr!44834 a!3861) from!3239) (content!712 acc!866)))))

(declare-fun e!774612 () Bool)

(assert (=> d!146701 (= lt!601613 e!774612)))

(declare-fun res!910197 () Bool)

(assert (=> d!146701 (=> (not res!910197) (not e!774612))))

(assert (=> d!146701 (= res!910197 (is-Cons!31898 acc!866))))

(assert (=> d!146701 (= (contains!9584 acc!866 (select (arr!44834 a!3861) from!3239)) lt!601613)))

(declare-fun b!1366646 () Bool)

(declare-fun e!774611 () Bool)

(assert (=> b!1366646 (= e!774612 e!774611)))

(declare-fun res!910196 () Bool)

(assert (=> b!1366646 (=> res!910196 e!774611)))

(assert (=> b!1366646 (= res!910196 (= (h!33107 acc!866) (select (arr!44834 a!3861) from!3239)))))

(declare-fun b!1366647 () Bool)

(assert (=> b!1366647 (= e!774611 (contains!9584 (t!46596 acc!866) (select (arr!44834 a!3861) from!3239)))))

(assert (= (and d!146701 res!910197) b!1366646))

(assert (= (and b!1366646 (not res!910196)) b!1366647))

(assert (=> d!146701 m!1250933))

(assert (=> d!146701 m!1250701))

(declare-fun m!1250943 () Bool)

(assert (=> d!146701 m!1250943))

(assert (=> b!1366647 m!1250701))

(declare-fun m!1250945 () Bool)

(assert (=> b!1366647 m!1250945))

(assert (=> b!1366393 d!146701))

(declare-fun b!1366651 () Bool)

(declare-fun e!774616 () Bool)

(assert (=> b!1366651 (= e!774616 (subseq!986 newAcc!98 (t!46596 acc!866)))))

(declare-fun b!1366648 () Bool)

(declare-fun e!774613 () Bool)

(declare-fun e!774615 () Bool)

(assert (=> b!1366648 (= e!774613 e!774615)))

(declare-fun res!910201 () Bool)

(assert (=> b!1366648 (=> (not res!910201) (not e!774615))))

(assert (=> b!1366648 (= res!910201 (is-Cons!31898 acc!866))))

(declare-fun b!1366649 () Bool)

(assert (=> b!1366649 (= e!774615 e!774616)))

(declare-fun res!910198 () Bool)

(assert (=> b!1366649 (=> res!910198 e!774616)))

(declare-fun e!774614 () Bool)

(assert (=> b!1366649 (= res!910198 e!774614)))

(declare-fun res!910200 () Bool)

(assert (=> b!1366649 (=> (not res!910200) (not e!774614))))

(assert (=> b!1366649 (= res!910200 (= (h!33107 newAcc!98) (h!33107 acc!866)))))

(declare-fun d!146703 () Bool)

(declare-fun res!910199 () Bool)

(assert (=> d!146703 (=> res!910199 e!774613)))

(assert (=> d!146703 (= res!910199 (is-Nil!31899 newAcc!98))))

(assert (=> d!146703 (= (subseq!986 newAcc!98 acc!866) e!774613)))

(declare-fun b!1366650 () Bool)

(assert (=> b!1366650 (= e!774614 (subseq!986 (t!46596 newAcc!98) (t!46596 acc!866)))))

(assert (= (and d!146703 (not res!910199)) b!1366648))

(assert (= (and b!1366648 res!910201) b!1366649))

(assert (= (and b!1366649 res!910200) b!1366650))

(assert (= (and b!1366649 (not res!910198)) b!1366651))

(declare-fun m!1250947 () Bool)

(assert (=> b!1366651 m!1250947))

(declare-fun m!1250949 () Bool)

(assert (=> b!1366650 m!1250949))

(assert (=> b!1366399 d!146703))

(declare-fun d!146705 () Bool)

(assert (=> d!146705 (= (validKeyInArray!0 (select (arr!44834 a!3861) from!3239)) (and (not (= (select (arr!44834 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44834 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1366400 d!146705))

(declare-fun d!146709 () Bool)

(declare-fun res!910204 () Bool)

(declare-fun e!774619 () Bool)

(assert (=> d!146709 (=> res!910204 e!774619)))

(assert (=> d!146709 (= res!910204 (is-Nil!31899 lt!601554))))

(assert (=> d!146709 (= (noDuplicate!2441 lt!601554) e!774619)))

(declare-fun b!1366654 () Bool)

(declare-fun e!774620 () Bool)

(assert (=> b!1366654 (= e!774619 e!774620)))

(declare-fun res!910205 () Bool)

(assert (=> b!1366654 (=> (not res!910205) (not e!774620))))

(assert (=> b!1366654 (= res!910205 (not (contains!9584 (t!46596 lt!601554) (h!33107 lt!601554))))))

(declare-fun b!1366655 () Bool)

(assert (=> b!1366655 (= e!774620 (noDuplicate!2441 (t!46596 lt!601554)))))

(assert (= (and d!146709 (not res!910204)) b!1366654))

(assert (= (and b!1366654 res!910205) b!1366655))

(declare-fun m!1250957 () Bool)

(assert (=> b!1366654 m!1250957))

(declare-fun m!1250959 () Bool)

(assert (=> b!1366655 m!1250959))

(assert (=> b!1366401 d!146709))

(push 1)

