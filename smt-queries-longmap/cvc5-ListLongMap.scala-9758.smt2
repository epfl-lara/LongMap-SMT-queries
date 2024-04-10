; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115628 () Bool)

(assert start!115628)

(declare-fun res!910958 () Bool)

(declare-fun e!774953 () Bool)

(assert (=> start!115628 (=> (not res!910958) (not e!774953))))

(declare-datatypes ((array!92859 0))(
  ( (array!92860 (arr!44855 (Array (_ BitVec 32) (_ BitVec 64))) (size!45405 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92859)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115628 (= res!910958 (and (bvslt (size!45405 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45405 a!3861))))))

(assert (=> start!115628 e!774953))

(declare-fun array_inv!33883 (array!92859) Bool)

(assert (=> start!115628 (array_inv!33883 a!3861)))

(assert (=> start!115628 true))

(declare-fun b!1367430 () Bool)

(declare-fun res!910959 () Bool)

(assert (=> b!1367430 (=> (not res!910959) (not e!774953))))

(declare-datatypes ((List!31923 0))(
  ( (Nil!31920) (Cons!31919 (h!33128 (_ BitVec 64)) (t!46617 List!31923)) )
))
(declare-fun acc!866 () List!31923)

(declare-fun contains!9605 (List!31923 (_ BitVec 64)) Bool)

(assert (=> b!1367430 (= res!910959 (not (contains!9605 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367431 () Bool)

(declare-fun res!910957 () Bool)

(declare-fun e!774954 () Bool)

(assert (=> b!1367431 (=> (not res!910957) (not e!774954))))

(assert (=> b!1367431 (= res!910957 (bvslt from!3239 (size!45405 a!3861)))))

(declare-fun b!1367432 () Bool)

(declare-fun res!910956 () Bool)

(assert (=> b!1367432 (=> (not res!910956) (not e!774954))))

(assert (=> b!1367432 (= res!910956 (contains!9605 acc!866 (select (arr!44855 a!3861) from!3239)))))

(declare-fun b!1367433 () Bool)

(declare-fun res!910966 () Bool)

(assert (=> b!1367433 (=> (not res!910966) (not e!774953))))

(declare-fun newAcc!98 () List!31923)

(declare-fun subseq!1007 (List!31923 List!31923) Bool)

(assert (=> b!1367433 (= res!910966 (subseq!1007 newAcc!98 acc!866))))

(declare-fun b!1367434 () Bool)

(declare-fun res!910962 () Bool)

(assert (=> b!1367434 (=> (not res!910962) (not e!774953))))

(assert (=> b!1367434 (= res!910962 (not (contains!9605 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367435 () Bool)

(declare-fun res!910965 () Bool)

(assert (=> b!1367435 (=> (not res!910965) (not e!774953))))

(declare-fun noDuplicate!2462 (List!31923) Bool)

(assert (=> b!1367435 (= res!910965 (noDuplicate!2462 acc!866))))

(declare-fun b!1367436 () Bool)

(assert (=> b!1367436 (= e!774953 e!774954)))

(declare-fun res!910961 () Bool)

(assert (=> b!1367436 (=> (not res!910961) (not e!774954))))

(declare-fun arrayNoDuplicates!0 (array!92859 (_ BitVec 32) List!31923) Bool)

(assert (=> b!1367436 (= res!910961 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45147 0))(
  ( (Unit!45148) )
))
(declare-fun lt!601888 () Unit!45147)

(declare-fun noDuplicateSubseq!194 (List!31923 List!31923) Unit!45147)

(assert (=> b!1367436 (= lt!601888 (noDuplicateSubseq!194 newAcc!98 acc!866))))

(declare-fun b!1367437 () Bool)

(declare-fun res!910960 () Bool)

(assert (=> b!1367437 (=> (not res!910960) (not e!774953))))

(assert (=> b!1367437 (= res!910960 (not (contains!9605 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367438 () Bool)

(declare-fun res!910964 () Bool)

(assert (=> b!1367438 (=> (not res!910964) (not e!774954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367438 (= res!910964 (validKeyInArray!0 (select (arr!44855 a!3861) from!3239)))))

(declare-fun b!1367439 () Bool)

(declare-fun res!910963 () Bool)

(assert (=> b!1367439 (=> (not res!910963) (not e!774953))))

(assert (=> b!1367439 (= res!910963 (not (contains!9605 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367440 () Bool)

(assert (=> b!1367440 (= e!774954 (not (noDuplicate!2462 newAcc!98)))))

(assert (= (and start!115628 res!910958) b!1367435))

(assert (= (and b!1367435 res!910965) b!1367430))

(assert (= (and b!1367430 res!910959) b!1367434))

(assert (= (and b!1367434 res!910962) b!1367437))

(assert (= (and b!1367437 res!910960) b!1367439))

(assert (= (and b!1367439 res!910963) b!1367433))

(assert (= (and b!1367433 res!910966) b!1367436))

(assert (= (and b!1367436 res!910961) b!1367431))

(assert (= (and b!1367431 res!910957) b!1367438))

(assert (= (and b!1367438 res!910964) b!1367432))

(assert (= (and b!1367432 res!910956) b!1367440))

(declare-fun m!1251655 () Bool)

(assert (=> b!1367435 m!1251655))

(declare-fun m!1251657 () Bool)

(assert (=> b!1367440 m!1251657))

(declare-fun m!1251659 () Bool)

(assert (=> b!1367436 m!1251659))

(declare-fun m!1251661 () Bool)

(assert (=> b!1367436 m!1251661))

(declare-fun m!1251663 () Bool)

(assert (=> b!1367433 m!1251663))

(declare-fun m!1251665 () Bool)

(assert (=> b!1367430 m!1251665))

(declare-fun m!1251667 () Bool)

(assert (=> b!1367434 m!1251667))

(declare-fun m!1251669 () Bool)

(assert (=> b!1367438 m!1251669))

(assert (=> b!1367438 m!1251669))

(declare-fun m!1251671 () Bool)

(assert (=> b!1367438 m!1251671))

(declare-fun m!1251673 () Bool)

(assert (=> start!115628 m!1251673))

(declare-fun m!1251675 () Bool)

(assert (=> b!1367437 m!1251675))

(declare-fun m!1251677 () Bool)

(assert (=> b!1367439 m!1251677))

(assert (=> b!1367432 m!1251669))

(assert (=> b!1367432 m!1251669))

(declare-fun m!1251679 () Bool)

(assert (=> b!1367432 m!1251679))

(push 1)

(assert (not b!1367434))

(assert (not b!1367440))

(assert (not b!1367437))

(assert (not b!1367436))

(assert (not b!1367430))

(assert (not b!1367438))

(assert (not b!1367435))

(assert (not b!1367432))

(assert (not b!1367433))

(assert (not b!1367439))

(assert (not start!115628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146829 () Bool)

(assert (=> d!146829 (= (validKeyInArray!0 (select (arr!44855 a!3861) from!3239)) (and (not (= (select (arr!44855 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44855 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1367438 d!146829))

(declare-fun d!146831 () Bool)

(declare-fun res!911067 () Bool)

(declare-fun e!775016 () Bool)

(assert (=> d!146831 (=> res!911067 e!775016)))

(assert (=> d!146831 (= res!911067 (is-Nil!31920 newAcc!98))))

(assert (=> d!146831 (= (subseq!1007 newAcc!98 acc!866) e!775016)))

(declare-fun b!1367553 () Bool)

(declare-fun e!775017 () Bool)

(assert (=> b!1367553 (= e!775016 e!775017)))

(declare-fun res!911070 () Bool)

(assert (=> b!1367553 (=> (not res!911070) (not e!775017))))

(assert (=> b!1367553 (= res!911070 (is-Cons!31919 acc!866))))

(declare-fun b!1367556 () Bool)

(declare-fun e!775015 () Bool)

(assert (=> b!1367556 (= e!775015 (subseq!1007 newAcc!98 (t!46617 acc!866)))))

(declare-fun b!1367555 () Bool)

(declare-fun e!775014 () Bool)

(assert (=> b!1367555 (= e!775014 (subseq!1007 (t!46617 newAcc!98) (t!46617 acc!866)))))

(declare-fun b!1367554 () Bool)

(assert (=> b!1367554 (= e!775017 e!775015)))

(declare-fun res!911069 () Bool)

(assert (=> b!1367554 (=> res!911069 e!775015)))

(assert (=> b!1367554 (= res!911069 e!775014)))

(declare-fun res!911068 () Bool)

(assert (=> b!1367554 (=> (not res!911068) (not e!775014))))

(assert (=> b!1367554 (= res!911068 (= (h!33128 newAcc!98) (h!33128 acc!866)))))

(assert (= (and d!146831 (not res!911067)) b!1367553))

(assert (= (and b!1367553 res!911070) b!1367554))

(assert (= (and b!1367554 res!911068) b!1367555))

(assert (= (and b!1367554 (not res!911069)) b!1367556))

(declare-fun m!1251747 () Bool)

(assert (=> b!1367556 m!1251747))

(declare-fun m!1251749 () Bool)

(assert (=> b!1367555 m!1251749))

(assert (=> b!1367433 d!146831))

(declare-fun d!146835 () Bool)

(declare-fun lt!601910 () Bool)

(declare-fun content!719 (List!31923) (Set (_ BitVec 64)))

(assert (=> d!146835 (= lt!601910 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!719 newAcc!98)))))

(declare-fun e!775036 () Bool)

(assert (=> d!146835 (= lt!601910 e!775036)))

(declare-fun res!911088 () Bool)

(assert (=> d!146835 (=> (not res!911088) (not e!775036))))

(assert (=> d!146835 (= res!911088 (is-Cons!31919 newAcc!98))))

(assert (=> d!146835 (= (contains!9605 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601910)))

(declare-fun b!1367574 () Bool)

(declare-fun e!775035 () Bool)

(assert (=> b!1367574 (= e!775036 e!775035)))

(declare-fun res!911089 () Bool)

(assert (=> b!1367574 (=> res!911089 e!775035)))

(assert (=> b!1367574 (= res!911089 (= (h!33128 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367575 () Bool)

(assert (=> b!1367575 (= e!775035 (contains!9605 (t!46617 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146835 res!911088) b!1367574))

(assert (= (and b!1367574 (not res!911089)) b!1367575))

(declare-fun m!1251768 () Bool)

(assert (=> d!146835 m!1251768))

(declare-fun m!1251771 () Bool)

(assert (=> d!146835 m!1251771))

(declare-fun m!1251773 () Bool)

(assert (=> b!1367575 m!1251773))

(assert (=> b!1367439 d!146835))

(declare-fun d!146847 () Bool)

(assert (=> d!146847 (= (array_inv!33883 a!3861) (bvsge (size!45405 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115628 d!146847))

(declare-fun d!146853 () Bool)

(declare-fun lt!601914 () Bool)

(assert (=> d!146853 (= lt!601914 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!719 newAcc!98)))))

(declare-fun e!775043 () Bool)

(assert (=> d!146853 (= lt!601914 e!775043)))

(declare-fun res!911095 () Bool)

(assert (=> d!146853 (=> (not res!911095) (not e!775043))))

(assert (=> d!146853 (= res!911095 (is-Cons!31919 newAcc!98))))

(assert (=> d!146853 (= (contains!9605 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601914)))

(declare-fun b!1367581 () Bool)

(declare-fun e!775042 () Bool)

(assert (=> b!1367581 (= e!775043 e!775042)))

(declare-fun res!911096 () Bool)

(assert (=> b!1367581 (=> res!911096 e!775042)))

(assert (=> b!1367581 (= res!911096 (= (h!33128 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367582 () Bool)

(assert (=> b!1367582 (= e!775042 (contains!9605 (t!46617 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146853 res!911095) b!1367581))

(assert (= (and b!1367581 (not res!911096)) b!1367582))

(assert (=> d!146853 m!1251768))

(declare-fun m!1251783 () Bool)

(assert (=> d!146853 m!1251783))

(declare-fun m!1251785 () Bool)

(assert (=> b!1367582 m!1251785))

(assert (=> b!1367437 d!146853))

(declare-fun d!146857 () Bool)

(declare-fun lt!601915 () Bool)

(assert (=> d!146857 (= lt!601915 (set.member (select (arr!44855 a!3861) from!3239) (content!719 acc!866)))))

(declare-fun e!775047 () Bool)

(assert (=> d!146857 (= lt!601915 e!775047)))

(declare-fun res!911097 () Bool)

(assert (=> d!146857 (=> (not res!911097) (not e!775047))))

(assert (=> d!146857 (= res!911097 (is-Cons!31919 acc!866))))

(assert (=> d!146857 (= (contains!9605 acc!866 (select (arr!44855 a!3861) from!3239)) lt!601915)))

(declare-fun b!1367583 () Bool)

(declare-fun e!775044 () Bool)

(assert (=> b!1367583 (= e!775047 e!775044)))

(declare-fun res!911098 () Bool)

(assert (=> b!1367583 (=> res!911098 e!775044)))

(assert (=> b!1367583 (= res!911098 (= (h!33128 acc!866) (select (arr!44855 a!3861) from!3239)))))

(declare-fun b!1367584 () Bool)

(assert (=> b!1367584 (= e!775044 (contains!9605 (t!46617 acc!866) (select (arr!44855 a!3861) from!3239)))))

(assert (= (and d!146857 res!911097) b!1367583))

(assert (= (and b!1367583 (not res!911098)) b!1367584))

(declare-fun m!1251787 () Bool)

(assert (=> d!146857 m!1251787))

(assert (=> d!146857 m!1251669))

(declare-fun m!1251789 () Bool)

(assert (=> d!146857 m!1251789))

(assert (=> b!1367584 m!1251669))

(declare-fun m!1251791 () Bool)

(assert (=> b!1367584 m!1251791))

(assert (=> b!1367432 d!146857))

(declare-fun d!146861 () Bool)

(declare-fun lt!601916 () Bool)

(assert (=> d!146861 (= lt!601916 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!719 acc!866)))))

(declare-fun e!775051 () Bool)

(assert (=> d!146861 (= lt!601916 e!775051)))

(declare-fun res!911103 () Bool)

(assert (=> d!146861 (=> (not res!911103) (not e!775051))))

(assert (=> d!146861 (= res!911103 (is-Cons!31919 acc!866))))

(assert (=> d!146861 (= (contains!9605 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601916)))

(declare-fun b!1367589 () Bool)

(declare-fun e!775050 () Bool)

(assert (=> b!1367589 (= e!775051 e!775050)))

(declare-fun res!911104 () Bool)

(assert (=> b!1367589 (=> res!911104 e!775050)))

(assert (=> b!1367589 (= res!911104 (= (h!33128 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367590 () Bool)

(assert (=> b!1367590 (= e!775050 (contains!9605 (t!46617 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146861 res!911103) b!1367589))

(assert (= (and b!1367589 (not res!911104)) b!1367590))

(assert (=> d!146861 m!1251787))

(declare-fun m!1251793 () Bool)

(assert (=> d!146861 m!1251793))

(declare-fun m!1251795 () Bool)

(assert (=> b!1367590 m!1251795))

(assert (=> b!1367430 d!146861))

(declare-fun b!1367641 () Bool)

(declare-fun e!775101 () Bool)

(declare-fun call!65492 () Bool)

(assert (=> b!1367641 (= e!775101 call!65492)))

(declare-fun d!146863 () Bool)

(declare-fun res!911152 () Bool)

(declare-fun e!775102 () Bool)

(assert (=> d!146863 (=> res!911152 e!775102)))

(assert (=> d!146863 (= res!911152 (bvsge from!3239 (size!45405 a!3861)))))

(assert (=> d!146863 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775102)))

(declare-fun b!1367642 () Bool)

(declare-fun e!775100 () Bool)

(assert (=> b!1367642 (= e!775102 e!775100)))

(declare-fun res!911151 () Bool)

(assert (=> b!1367642 (=> (not res!911151) (not e!775100))))

(declare-fun e!775103 () Bool)

(assert (=> b!1367642 (= res!911151 (not e!775103))))

(declare-fun res!911153 () Bool)

(assert (=> b!1367642 (=> (not res!911153) (not e!775103))))

(assert (=> b!1367642 (= res!911153 (validKeyInArray!0 (select (arr!44855 a!3861) from!3239)))))

(declare-fun c!127685 () Bool)

(declare-fun bm!65489 () Bool)

(assert (=> bm!65489 (= call!65492 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127685 (Cons!31919 (select (arr!44855 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1367643 () Bool)

(assert (=> b!1367643 (= e!775103 (contains!9605 acc!866 (select (arr!44855 a!3861) from!3239)))))

(declare-fun b!1367644 () Bool)

(assert (=> b!1367644 (= e!775100 e!775101)))

(assert (=> b!1367644 (= c!127685 (validKeyInArray!0 (select (arr!44855 a!3861) from!3239)))))

(declare-fun b!1367645 () Bool)

(assert (=> b!1367645 (= e!775101 call!65492)))

(assert (= (and d!146863 (not res!911152)) b!1367642))

(assert (= (and b!1367642 res!911153) b!1367643))

(assert (= (and b!1367642 res!911151) b!1367644))

(assert (= (and b!1367644 c!127685) b!1367641))

(assert (= (and b!1367644 (not c!127685)) b!1367645))

(assert (= (or b!1367641 b!1367645) bm!65489))

(assert (=> b!1367642 m!1251669))

(assert (=> b!1367642 m!1251669))

(assert (=> b!1367642 m!1251671))

(assert (=> bm!65489 m!1251669))

(declare-fun m!1251833 () Bool)

(assert (=> bm!65489 m!1251833))

