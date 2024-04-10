; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116214 () Bool)

(assert start!116214)

(declare-fun b!1372326 () Bool)

(declare-fun res!915618 () Bool)

(declare-fun e!777454 () Bool)

(assert (=> b!1372326 (=> (not res!915618) (not e!777454))))

(declare-datatypes ((array!93070 0))(
  ( (array!93071 (arr!44947 (Array (_ BitVec 32) (_ BitVec 64))) (size!45497 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93070)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372326 (= res!915618 (validKeyInArray!0 (select (arr!44947 a!3861) from!3239)))))

(declare-fun b!1372327 () Bool)

(declare-fun res!915622 () Bool)

(declare-fun e!777453 () Bool)

(assert (=> b!1372327 (=> (not res!915622) (not e!777453))))

(declare-datatypes ((List!32015 0))(
  ( (Nil!32012) (Cons!32011 (h!33220 (_ BitVec 64)) (t!46709 List!32015)) )
))
(declare-fun acc!866 () List!32015)

(declare-fun contains!9697 (List!32015 (_ BitVec 64)) Bool)

(assert (=> b!1372327 (= res!915622 (not (contains!9697 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372328 () Bool)

(declare-fun res!915627 () Bool)

(assert (=> b!1372328 (=> (not res!915627) (not e!777454))))

(assert (=> b!1372328 (= res!915627 (contains!9697 acc!866 (select (arr!44947 a!3861) from!3239)))))

(declare-fun b!1372329 () Bool)

(declare-fun res!915620 () Bool)

(assert (=> b!1372329 (=> (not res!915620) (not e!777453))))

(declare-fun newAcc!98 () List!32015)

(declare-fun subseq!1099 (List!32015 List!32015) Bool)

(assert (=> b!1372329 (= res!915620 (subseq!1099 newAcc!98 acc!866))))

(declare-fun res!915624 () Bool)

(assert (=> start!116214 (=> (not res!915624) (not e!777453))))

(assert (=> start!116214 (= res!915624 (and (bvslt (size!45497 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45497 a!3861))))))

(assert (=> start!116214 e!777453))

(declare-fun array_inv!33975 (array!93070) Bool)

(assert (=> start!116214 (array_inv!33975 a!3861)))

(assert (=> start!116214 true))

(declare-fun b!1372330 () Bool)

(declare-fun res!915625 () Bool)

(assert (=> b!1372330 (=> (not res!915625) (not e!777454))))

(assert (=> b!1372330 (= res!915625 (bvslt from!3239 (size!45497 a!3861)))))

(declare-fun b!1372331 () Bool)

(declare-fun res!915623 () Bool)

(assert (=> b!1372331 (=> (not res!915623) (not e!777453))))

(assert (=> b!1372331 (= res!915623 (not (contains!9697 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372332 () Bool)

(assert (=> b!1372332 (= e!777453 e!777454)))

(declare-fun res!915619 () Bool)

(assert (=> b!1372332 (=> (not res!915619) (not e!777454))))

(declare-fun arrayNoDuplicates!0 (array!93070 (_ BitVec 32) List!32015) Bool)

(assert (=> b!1372332 (= res!915619 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45331 0))(
  ( (Unit!45332) )
))
(declare-fun lt!602842 () Unit!45331)

(declare-fun noDuplicateSubseq!286 (List!32015 List!32015) Unit!45331)

(assert (=> b!1372332 (= lt!602842 (noDuplicateSubseq!286 newAcc!98 acc!866))))

(declare-fun b!1372333 () Bool)

(declare-fun res!915626 () Bool)

(assert (=> b!1372333 (=> (not res!915626) (not e!777453))))

(assert (=> b!1372333 (= res!915626 (not (contains!9697 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372334 () Bool)

(assert (=> b!1372334 (= e!777454 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1372335 () Bool)

(declare-fun res!915628 () Bool)

(assert (=> b!1372335 (=> (not res!915628) (not e!777453))))

(assert (=> b!1372335 (= res!915628 (not (contains!9697 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372336 () Bool)

(declare-fun res!915621 () Bool)

(assert (=> b!1372336 (=> (not res!915621) (not e!777453))))

(declare-fun noDuplicate!2554 (List!32015) Bool)

(assert (=> b!1372336 (= res!915621 (noDuplicate!2554 acc!866))))

(assert (= (and start!116214 res!915624) b!1372336))

(assert (= (and b!1372336 res!915621) b!1372327))

(assert (= (and b!1372327 res!915622) b!1372335))

(assert (= (and b!1372335 res!915628) b!1372331))

(assert (= (and b!1372331 res!915623) b!1372333))

(assert (= (and b!1372333 res!915626) b!1372329))

(assert (= (and b!1372329 res!915620) b!1372332))

(assert (= (and b!1372332 res!915619) b!1372330))

(assert (= (and b!1372330 res!915625) b!1372326))

(assert (= (and b!1372326 res!915618) b!1372328))

(assert (= (and b!1372328 res!915627) b!1372334))

(declare-fun m!1255799 () Bool)

(assert (=> b!1372326 m!1255799))

(assert (=> b!1372326 m!1255799))

(declare-fun m!1255801 () Bool)

(assert (=> b!1372326 m!1255801))

(declare-fun m!1255803 () Bool)

(assert (=> b!1372329 m!1255803))

(declare-fun m!1255805 () Bool)

(assert (=> start!116214 m!1255805))

(declare-fun m!1255807 () Bool)

(assert (=> b!1372331 m!1255807))

(declare-fun m!1255809 () Bool)

(assert (=> b!1372334 m!1255809))

(declare-fun m!1255811 () Bool)

(assert (=> b!1372335 m!1255811))

(declare-fun m!1255813 () Bool)

(assert (=> b!1372327 m!1255813))

(declare-fun m!1255815 () Bool)

(assert (=> b!1372336 m!1255815))

(declare-fun m!1255817 () Bool)

(assert (=> b!1372333 m!1255817))

(declare-fun m!1255819 () Bool)

(assert (=> b!1372332 m!1255819))

(declare-fun m!1255821 () Bool)

(assert (=> b!1372332 m!1255821))

(assert (=> b!1372328 m!1255799))

(assert (=> b!1372328 m!1255799))

(declare-fun m!1255823 () Bool)

(assert (=> b!1372328 m!1255823))

(push 1)

(assert (not b!1372328))

(assert (not b!1372334))

(assert (not b!1372331))

(assert (not b!1372329))

(assert (not b!1372332))

(assert (not b!1372333))

(assert (not start!116214))

(assert (not b!1372336))

(assert (not b!1372335))

(assert (not b!1372326))

(assert (not b!1372327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147813 () Bool)

(declare-fun lt!602854 () Bool)

(declare-fun content!746 (List!32015) (Set (_ BitVec 64)))

(assert (=> d!147813 (= lt!602854 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!746 newAcc!98)))))

(declare-fun e!777494 () Bool)

(assert (=> d!147813 (= lt!602854 e!777494)))

(declare-fun res!915666 () Bool)

(assert (=> d!147813 (=> (not res!915666) (not e!777494))))

(assert (=> d!147813 (= res!915666 (is-Cons!32011 newAcc!98))))

(assert (=> d!147813 (= (contains!9697 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602854)))

(declare-fun b!1372377 () Bool)

(declare-fun e!777493 () Bool)

(assert (=> b!1372377 (= e!777494 e!777493)))

(declare-fun res!915665 () Bool)

(assert (=> b!1372377 (=> res!915665 e!777493)))

(assert (=> b!1372377 (= res!915665 (= (h!33220 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372378 () Bool)

(assert (=> b!1372378 (= e!777493 (contains!9697 (t!46709 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147813 res!915666) b!1372377))

(assert (= (and b!1372377 (not res!915665)) b!1372378))

(declare-fun m!1255853 () Bool)

(assert (=> d!147813 m!1255853))

(declare-fun m!1255855 () Bool)

(assert (=> d!147813 m!1255855))

(declare-fun m!1255857 () Bool)

(assert (=> b!1372378 m!1255857))

(assert (=> b!1372331 d!147813))

(declare-fun d!147815 () Bool)

(declare-fun res!915680 () Bool)

(declare-fun e!777509 () Bool)

(assert (=> d!147815 (=> res!915680 e!777509)))

(assert (=> d!147815 (= res!915680 (is-Nil!32012 acc!866))))

(assert (=> d!147815 (= (noDuplicate!2554 acc!866) e!777509)))

(declare-fun b!1372394 () Bool)

(declare-fun e!777510 () Bool)

(assert (=> b!1372394 (= e!777509 e!777510)))

(declare-fun res!915681 () Bool)

(assert (=> b!1372394 (=> (not res!915681) (not e!777510))))

(assert (=> b!1372394 (= res!915681 (not (contains!9697 (t!46709 acc!866) (h!33220 acc!866))))))

(declare-fun b!1372395 () Bool)

(assert (=> b!1372395 (= e!777510 (noDuplicate!2554 (t!46709 acc!866)))))

(assert (= (and d!147815 (not res!915680)) b!1372394))

(assert (= (and b!1372394 res!915681) b!1372395))

(declare-fun m!1255869 () Bool)

(assert (=> b!1372394 m!1255869))

(declare-fun m!1255871 () Bool)

(assert (=> b!1372395 m!1255871))

(assert (=> b!1372336 d!147815))

(declare-fun b!1372419 () Bool)

(declare-fun e!777533 () Bool)

(declare-fun e!777532 () Bool)

(assert (=> b!1372419 (= e!777533 e!777532)))

(declare-fun res!915701 () Bool)

(assert (=> b!1372419 (=> (not res!915701) (not e!777532))))

(assert (=> b!1372419 (= res!915701 (is-Cons!32011 acc!866))))

(declare-fun d!147823 () Bool)

(declare-fun res!915702 () Bool)

(assert (=> d!147823 (=> res!915702 e!777533)))

(assert (=> d!147823 (= res!915702 (is-Nil!32012 newAcc!98))))

(assert (=> d!147823 (= (subseq!1099 newAcc!98 acc!866) e!777533)))

(declare-fun b!1372422 () Bool)

(declare-fun e!777534 () Bool)

(assert (=> b!1372422 (= e!777534 (subseq!1099 newAcc!98 (t!46709 acc!866)))))

(declare-fun b!1372420 () Bool)

(assert (=> b!1372420 (= e!777532 e!777534)))

(declare-fun res!915703 () Bool)

(assert (=> b!1372420 (=> res!915703 e!777534)))

(declare-fun e!777535 () Bool)

(assert (=> b!1372420 (= res!915703 e!777535)))

(declare-fun res!915704 () Bool)

(assert (=> b!1372420 (=> (not res!915704) (not e!777535))))

(assert (=> b!1372420 (= res!915704 (= (h!33220 newAcc!98) (h!33220 acc!866)))))

(declare-fun b!1372421 () Bool)

(assert (=> b!1372421 (= e!777535 (subseq!1099 (t!46709 newAcc!98) (t!46709 acc!866)))))

(assert (= (and d!147823 (not res!915702)) b!1372419))

(assert (= (and b!1372419 res!915701) b!1372420))

(assert (= (and b!1372420 res!915704) b!1372421))

(assert (= (and b!1372420 (not res!915703)) b!1372422))

(declare-fun m!1255881 () Bool)

(assert (=> b!1372422 m!1255881))

(declare-fun m!1255883 () Bool)

(assert (=> b!1372421 m!1255883))

(assert (=> b!1372329 d!147823))

(declare-fun d!147831 () Bool)

(declare-fun res!915741 () Bool)

(declare-fun e!777575 () Bool)

(assert (=> d!147831 (=> res!915741 e!777575)))

(assert (=> d!147831 (= res!915741 (bvsge from!3239 (size!45497 a!3861)))))

(assert (=> d!147831 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777575)))

(declare-fun b!1372467 () Bool)

(declare-fun e!777576 () Bool)

(assert (=> b!1372467 (= e!777575 e!777576)))

(declare-fun res!915739 () Bool)

(assert (=> b!1372467 (=> (not res!915739) (not e!777576))))

(declare-fun e!777577 () Bool)

(assert (=> b!1372467 (= res!915739 (not e!777577))))

(declare-fun res!915740 () Bool)

(assert (=> b!1372467 (=> (not res!915740) (not e!777577))))

(assert (=> b!1372467 (= res!915740 (validKeyInArray!0 (select (arr!44947 a!3861) from!3239)))))

(declare-fun b!1372468 () Bool)

(assert (=> b!1372468 (= e!777577 (contains!9697 newAcc!98 (select (arr!44947 a!3861) from!3239)))))

(declare-fun bm!65596 () Bool)

(declare-fun call!65599 () Bool)

(declare-fun c!127804 () Bool)

(assert (=> bm!65596 (= call!65599 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127804 (Cons!32011 (select (arr!44947 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1372469 () Bool)

(declare-fun e!777578 () Bool)

(assert (=> b!1372469 (= e!777578 call!65599)))

(declare-fun b!1372470 () Bool)

(assert (=> b!1372470 (= e!777578 call!65599)))

(declare-fun b!1372471 () Bool)

(assert (=> b!1372471 (= e!777576 e!777578)))

(assert (=> b!1372471 (= c!127804 (validKeyInArray!0 (select (arr!44947 a!3861) from!3239)))))

(assert (= (and d!147831 (not res!915741)) b!1372467))

(assert (= (and b!1372467 res!915740) b!1372468))

(assert (= (and b!1372467 res!915739) b!1372471))

(assert (= (and b!1372471 c!127804) b!1372470))

(assert (= (and b!1372471 (not c!127804)) b!1372469))

(assert (= (or b!1372470 b!1372469) bm!65596))

(assert (=> b!1372467 m!1255799))

(assert (=> b!1372467 m!1255799))

(assert (=> b!1372467 m!1255801))

(assert (=> b!1372468 m!1255799))

(assert (=> b!1372468 m!1255799))

(declare-fun m!1255907 () Bool)

(assert (=> b!1372468 m!1255907))

(assert (=> bm!65596 m!1255799))

(declare-fun m!1255909 () Bool)

(assert (=> bm!65596 m!1255909))

(assert (=> b!1372471 m!1255799))

(assert (=> b!1372471 m!1255799))

(assert (=> b!1372471 m!1255801))

(assert (=> b!1372334 d!147831))

(declare-fun d!147849 () Bool)

(declare-fun lt!602864 () Bool)

(assert (=> d!147849 (= lt!602864 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!746 acc!866)))))

(declare-fun e!777581 () Bool)

(assert (=> d!147849 (= lt!602864 e!777581)))

(declare-fun res!915746 () Bool)

(assert (=> d!147849 (=> (not res!915746) (not e!777581))))

(assert (=> d!147849 (= res!915746 (is-Cons!32011 acc!866))))

(assert (=> d!147849 (= (contains!9697 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602864)))

(declare-fun b!1372472 () Bool)

(declare-fun e!777579 () Bool)

(assert (=> b!1372472 (= e!777581 e!777579)))

(declare-fun res!915743 () Bool)

(assert (=> b!1372472 (=> res!915743 e!777579)))

(assert (=> b!1372472 (= res!915743 (= (h!33220 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372473 () Bool)

(assert (=> b!1372473 (= e!777579 (contains!9697 (t!46709 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147849 res!915746) b!1372472))

(assert (= (and b!1372472 (not res!915743)) b!1372473))

(declare-fun m!1255911 () Bool)

(assert (=> d!147849 m!1255911))

(declare-fun m!1255913 () Bool)

(assert (=> d!147849 m!1255913))

(declare-fun m!1255915 () Bool)

(assert (=> b!1372473 m!1255915))

(assert (=> b!1372335 d!147849))

(declare-fun d!147851 () Bool)

(declare-fun lt!602865 () Bool)

(assert (=> d!147851 (= lt!602865 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!746 newAcc!98)))))

(declare-fun e!777590 () Bool)

(assert (=> d!147851 (= lt!602865 e!777590)))

(declare-fun res!915753 () Bool)

(assert (=> d!147851 (=> (not res!915753) (not e!777590))))

(assert (=> d!147851 (= res!915753 (is-Cons!32011 newAcc!98))))

(assert (=> d!147851 (= (contains!9697 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602865)))

(declare-fun b!1372482 () Bool)

(declare-fun e!777589 () Bool)

(assert (=> b!1372482 (= e!777590 e!777589)))

(declare-fun res!915752 () Bool)

(assert (=> b!1372482 (=> res!915752 e!777589)))

(assert (=> b!1372482 (= res!915752 (= (h!33220 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372483 () Bool)

(assert (=> b!1372483 (= e!777589 (contains!9697 (t!46709 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147851 res!915753) b!1372482))

(assert (= (and b!1372482 (not res!915752)) b!1372483))

(assert (=> d!147851 m!1255853))

(declare-fun m!1255921 () Bool)

(assert (=> d!147851 m!1255921))

(declare-fun m!1255923 () Bool)

(assert (=> b!1372483 m!1255923))

(assert (=> b!1372333 d!147851))

(declare-fun d!147855 () Bool)

(assert (=> d!147855 (= (array_inv!33975 a!3861) (bvsge (size!45497 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116214 d!147855))

(declare-fun lt!602868 () Bool)

(declare-fun d!147859 () Bool)

(assert (=> d!147859 (= lt!602868 (member (select (arr!44947 a!3861) from!3239) (content!746 acc!866)))))

(declare-fun e!777598 () Bool)

(assert (=> d!147859 (= lt!602868 e!777598)))

(declare-fun res!915761 () Bool)

(assert (=> d!147859 (=> (not res!915761) (not e!777598))))

(assert (=> d!147859 (= res!915761 (is-Cons!32011 acc!866))))

(assert (=> d!147859 (= (contains!9697 acc!866 (select (arr!44947 a!3861) from!3239)) lt!602868)))

(declare-fun b!1372490 () Bool)

(declare-fun e!777597 () Bool)

(assert (=> b!1372490 (= e!777598 e!777597)))

(declare-fun res!915760 () Bool)

(assert (=> b!1372490 (=> res!915760 e!777597)))

(assert (=> b!1372490 (= res!915760 (= (h!33220 acc!866) (select (arr!44947 a!3861) from!3239)))))

(declare-fun b!1372491 () Bool)

(assert (=> b!1372491 (= e!777597 (contains!9697 (t!46709 acc!866) (select (arr!44947 a!3861) from!3239)))))

(assert (= (and d!147859 res!915761) b!1372490))

(assert (= (and b!1372490 (not res!915760)) b!1372491))

(assert (=> d!147859 m!1255911))

(assert (=> d!147859 m!1255799))

(declare-fun m!1255937 () Bool)

(assert (=> d!147859 m!1255937))

(assert (=> b!1372491 m!1255799))

(declare-fun m!1255939 () Bool)

(assert (=> b!1372491 m!1255939))

(assert (=> b!1372328 d!147859))

(declare-fun d!147861 () Bool)

(assert (=> d!147861 (= (validKeyInArray!0 (select (arr!44947 a!3861) from!3239)) (and (not (= (select (arr!44947 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44947 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372326 d!147861))

(declare-fun d!147863 () Bool)

(declare-fun lt!602869 () Bool)

(assert (=> d!147863 (= lt!602869 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!746 acc!866)))))

