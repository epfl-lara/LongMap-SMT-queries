; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63526 () Bool)

(assert start!63526)

(declare-fun b!715849 () Bool)

(declare-fun res!478823 () Bool)

(declare-fun e!401908 () Bool)

(assert (=> b!715849 (=> (not res!478823) (not e!401908))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40540 0))(
  ( (array!40541 (arr!19407 (Array (_ BitVec 32) (_ BitVec 64))) (size!19823 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40540)

(assert (=> b!715849 (= res!478823 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19823 a!3591)))))

(declare-fun b!715850 () Bool)

(declare-fun res!478832 () Bool)

(assert (=> b!715850 (=> (not res!478832) (not e!401908))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715850 (= res!478832 (validKeyInArray!0 k!2824))))

(declare-datatypes ((List!13448 0))(
  ( (Nil!13445) (Cons!13444 (h!14489 (_ BitVec 64)) (t!19763 List!13448)) )
))
(declare-fun newAcc!49 () List!13448)

(declare-fun b!715851 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40540 (_ BitVec 32) List!13448) Bool)

(assert (=> b!715851 (= e!401908 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!715851 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24636 0))(
  ( (Unit!24637) )
))
(declare-fun lt!318854 () Unit!24636)

(declare-fun acc!652 () List!13448)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40540 (_ BitVec 64) (_ BitVec 32) List!13448 List!13448) Unit!24636)

(assert (=> b!715851 (= lt!318854 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!715852 () Bool)

(declare-fun res!478820 () Bool)

(assert (=> b!715852 (=> (not res!478820) (not e!401908))))

(assert (=> b!715852 (= res!478820 (not (validKeyInArray!0 (select (arr!19407 a!3591) from!2969))))))

(declare-fun b!715853 () Bool)

(declare-fun res!478833 () Bool)

(assert (=> b!715853 (=> (not res!478833) (not e!401908))))

(declare-fun contains!4025 (List!13448 (_ BitVec 64)) Bool)

(assert (=> b!715853 (= res!478833 (not (contains!4025 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715854 () Bool)

(declare-fun res!478836 () Bool)

(assert (=> b!715854 (=> (not res!478836) (not e!401908))))

(assert (=> b!715854 (= res!478836 (not (contains!4025 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715856 () Bool)

(declare-fun res!478826 () Bool)

(assert (=> b!715856 (=> (not res!478826) (not e!401908))))

(declare-fun noDuplicate!1272 (List!13448) Bool)

(assert (=> b!715856 (= res!478826 (noDuplicate!1272 acc!652))))

(declare-fun b!715857 () Bool)

(declare-fun res!478828 () Bool)

(assert (=> b!715857 (=> (not res!478828) (not e!401908))))

(declare-fun subseq!470 (List!13448 List!13448) Bool)

(assert (=> b!715857 (= res!478828 (subseq!470 acc!652 newAcc!49))))

(declare-fun b!715858 () Bool)

(declare-fun res!478825 () Bool)

(assert (=> b!715858 (=> (not res!478825) (not e!401908))))

(assert (=> b!715858 (= res!478825 (not (contains!4025 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715859 () Bool)

(declare-fun res!478831 () Bool)

(assert (=> b!715859 (=> (not res!478831) (not e!401908))))

(declare-fun arrayContainsKey!0 (array!40540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715859 (= res!478831 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715860 () Bool)

(declare-fun res!478829 () Bool)

(assert (=> b!715860 (=> (not res!478829) (not e!401908))))

(assert (=> b!715860 (= res!478829 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715861 () Bool)

(declare-fun res!478824 () Bool)

(assert (=> b!715861 (=> (not res!478824) (not e!401908))))

(assert (=> b!715861 (= res!478824 (noDuplicate!1272 newAcc!49))))

(declare-fun b!715862 () Bool)

(declare-fun res!478827 () Bool)

(assert (=> b!715862 (=> (not res!478827) (not e!401908))))

(assert (=> b!715862 (= res!478827 (not (contains!4025 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715863 () Bool)

(declare-fun res!478830 () Bool)

(assert (=> b!715863 (=> (not res!478830) (not e!401908))))

(assert (=> b!715863 (= res!478830 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715864 () Bool)

(declare-fun res!478837 () Bool)

(assert (=> b!715864 (=> (not res!478837) (not e!401908))))

(declare-fun -!435 (List!13448 (_ BitVec 64)) List!13448)

(assert (=> b!715864 (= res!478837 (= (-!435 newAcc!49 k!2824) acc!652))))

(declare-fun b!715865 () Bool)

(declare-fun res!478819 () Bool)

(assert (=> b!715865 (=> (not res!478819) (not e!401908))))

(assert (=> b!715865 (= res!478819 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715855 () Bool)

(declare-fun res!478822 () Bool)

(assert (=> b!715855 (=> (not res!478822) (not e!401908))))

(assert (=> b!715855 (= res!478822 (contains!4025 newAcc!49 k!2824))))

(declare-fun res!478821 () Bool)

(assert (=> start!63526 (=> (not res!478821) (not e!401908))))

(assert (=> start!63526 (= res!478821 (and (bvslt (size!19823 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19823 a!3591))))))

(assert (=> start!63526 e!401908))

(assert (=> start!63526 true))

(declare-fun array_inv!15203 (array!40540) Bool)

(assert (=> start!63526 (array_inv!15203 a!3591)))

(declare-fun b!715866 () Bool)

(declare-fun res!478835 () Bool)

(assert (=> b!715866 (=> (not res!478835) (not e!401908))))

(assert (=> b!715866 (= res!478835 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715867 () Bool)

(declare-fun res!478834 () Bool)

(assert (=> b!715867 (=> (not res!478834) (not e!401908))))

(assert (=> b!715867 (= res!478834 (not (contains!4025 acc!652 k!2824)))))

(assert (= (and start!63526 res!478821) b!715856))

(assert (= (and b!715856 res!478826) b!715861))

(assert (= (and b!715861 res!478824) b!715862))

(assert (= (and b!715862 res!478827) b!715858))

(assert (= (and b!715858 res!478825) b!715859))

(assert (= (and b!715859 res!478831) b!715867))

(assert (= (and b!715867 res!478834) b!715850))

(assert (= (and b!715850 res!478832) b!715860))

(assert (= (and b!715860 res!478829) b!715857))

(assert (= (and b!715857 res!478828) b!715855))

(assert (= (and b!715855 res!478822) b!715864))

(assert (= (and b!715864 res!478837) b!715854))

(assert (= (and b!715854 res!478836) b!715853))

(assert (= (and b!715853 res!478833) b!715849))

(assert (= (and b!715849 res!478823) b!715852))

(assert (= (and b!715852 res!478820) b!715866))

(assert (= (and b!715866 res!478835) b!715863))

(assert (= (and b!715863 res!478830) b!715865))

(assert (= (and b!715865 res!478819) b!715851))

(declare-fun m!671947 () Bool)

(assert (=> b!715855 m!671947))

(declare-fun m!671949 () Bool)

(assert (=> b!715862 m!671949))

(declare-fun m!671951 () Bool)

(assert (=> b!715864 m!671951))

(declare-fun m!671953 () Bool)

(assert (=> b!715865 m!671953))

(declare-fun m!671955 () Bool)

(assert (=> b!715863 m!671955))

(declare-fun m!671957 () Bool)

(assert (=> b!715860 m!671957))

(declare-fun m!671959 () Bool)

(assert (=> b!715853 m!671959))

(declare-fun m!671961 () Bool)

(assert (=> b!715852 m!671961))

(assert (=> b!715852 m!671961))

(declare-fun m!671963 () Bool)

(assert (=> b!715852 m!671963))

(declare-fun m!671965 () Bool)

(assert (=> b!715854 m!671965))

(declare-fun m!671967 () Bool)

(assert (=> start!63526 m!671967))

(declare-fun m!671969 () Bool)

(assert (=> b!715859 m!671969))

(declare-fun m!671971 () Bool)

(assert (=> b!715851 m!671971))

(declare-fun m!671973 () Bool)

(assert (=> b!715851 m!671973))

(declare-fun m!671975 () Bool)

(assert (=> b!715851 m!671975))

(declare-fun m!671977 () Bool)

(assert (=> b!715856 m!671977))

(declare-fun m!671979 () Bool)

(assert (=> b!715858 m!671979))

(declare-fun m!671981 () Bool)

(assert (=> b!715850 m!671981))

(declare-fun m!671983 () Bool)

(assert (=> b!715867 m!671983))

(declare-fun m!671985 () Bool)

(assert (=> b!715857 m!671985))

(declare-fun m!671987 () Bool)

(assert (=> b!715861 m!671987))

(push 1)

(assert (not b!715867))

(assert (not b!715860))

(assert (not b!715856))

(assert (not b!715862))

(assert (not b!715857))

(assert (not b!715861))

(assert (not b!715863))

(assert (not b!715851))

(assert (not b!715852))

(assert (not b!715853))

(assert (not b!715859))

(assert (not b!715858))

(assert (not b!715855))

(assert (not start!63526))

(assert (not b!715864))

(assert (not b!715850))

(assert (not b!715854))

(assert (not b!715865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98459 () Bool)

(assert (=> d!98459 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715850 d!98459))

(declare-fun d!98463 () Bool)

(declare-fun res!478995 () Bool)

(declare-fun e!401968 () Bool)

(assert (=> d!98463 (=> res!478995 e!401968)))

(assert (=> d!98463 (= res!478995 (is-Nil!13445 newAcc!49))))

(assert (=> d!98463 (= (noDuplicate!1272 newAcc!49) e!401968)))

(declare-fun b!716031 () Bool)

(declare-fun e!401969 () Bool)

(assert (=> b!716031 (= e!401968 e!401969)))

(declare-fun res!478996 () Bool)

(assert (=> b!716031 (=> (not res!478996) (not e!401969))))

(assert (=> b!716031 (= res!478996 (not (contains!4025 (t!19763 newAcc!49) (h!14489 newAcc!49))))))

(declare-fun b!716032 () Bool)

(assert (=> b!716032 (= e!401969 (noDuplicate!1272 (t!19763 newAcc!49)))))

(assert (= (and d!98463 (not res!478995)) b!716031))

(assert (= (and b!716031 res!478996) b!716032))

(declare-fun m!672107 () Bool)

(assert (=> b!716031 m!672107))

(declare-fun m!672109 () Bool)

(assert (=> b!716032 m!672109))

(assert (=> b!715861 d!98463))

(declare-fun d!98473 () Bool)

(assert (=> d!98473 (= (array_inv!15203 a!3591) (bvsge (size!19823 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63526 d!98473))

(declare-fun b!716066 () Bool)

(declare-fun e!401999 () Bool)

(declare-fun e!402001 () Bool)

(assert (=> b!716066 (= e!401999 e!402001)))

(declare-fun c!78890 () Bool)

(assert (=> b!716066 (= c!78890 (validKeyInArray!0 (select (arr!19407 a!3591) from!2969)))))

(declare-fun e!402000 () Bool)

(declare-fun b!716067 () Bool)

(assert (=> b!716067 (= e!402000 (contains!4025 newAcc!49 (select (arr!19407 a!3591) from!2969)))))

(declare-fun b!716068 () Bool)

(declare-fun e!401998 () Bool)

(assert (=> b!716068 (= e!401998 e!401999)))

(declare-fun res!479021 () Bool)

(assert (=> b!716068 (=> (not res!479021) (not e!401999))))

(assert (=> b!716068 (= res!479021 (not e!402000))))

(declare-fun res!479022 () Bool)

(assert (=> b!716068 (=> (not res!479022) (not e!402000))))

(assert (=> b!716068 (= res!479022 (validKeyInArray!0 (select (arr!19407 a!3591) from!2969)))))

(declare-fun b!716069 () Bool)

(declare-fun call!34641 () Bool)

(assert (=> b!716069 (= e!402001 call!34641)))

(declare-fun bm!34638 () Bool)

(assert (=> bm!34638 (= call!34641 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78890 (Cons!13444 (select (arr!19407 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!716070 () Bool)

(assert (=> b!716070 (= e!402001 call!34641)))

(declare-fun d!98479 () Bool)

(declare-fun res!479020 () Bool)

(assert (=> d!98479 (=> res!479020 e!401998)))

(assert (=> d!98479 (= res!479020 (bvsge from!2969 (size!19823 a!3591)))))

(assert (=> d!98479 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401998)))

(assert (= (and d!98479 (not res!479020)) b!716068))

(assert (= (and b!716068 res!479022) b!716067))

(assert (= (and b!716068 res!479021) b!716066))

(assert (= (and b!716066 c!78890) b!716070))

(assert (= (and b!716066 (not c!78890)) b!716069))

(assert (= (or b!716070 b!716069) bm!34638))

(assert (=> b!716066 m!671961))

(assert (=> b!716066 m!671961))

(assert (=> b!716066 m!671963))

(assert (=> b!716067 m!671961))

(assert (=> b!716067 m!671961))

(declare-fun m!672137 () Bool)

(assert (=> b!716067 m!672137))

(assert (=> b!716068 m!671961))

(assert (=> b!716068 m!671961))

(assert (=> b!716068 m!671963))

(assert (=> bm!34638 m!671961))

(declare-fun m!672139 () Bool)

(assert (=> bm!34638 m!672139))

(assert (=> b!715851 d!98479))

(declare-fun b!716081 () Bool)

(declare-fun e!402011 () Bool)

(declare-fun e!402013 () Bool)

(assert (=> b!716081 (= e!402011 e!402013)))

(declare-fun c!78893 () Bool)

(assert (=> b!716081 (= c!78893 (validKeyInArray!0 (select (arr!19407 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun e!402012 () Bool)

(declare-fun b!716082 () Bool)

(assert (=> b!716082 (= e!402012 (contains!4025 newAcc!49 (select (arr!19407 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716083 () Bool)

(declare-fun e!402010 () Bool)

(assert (=> b!716083 (= e!402010 e!402011)))

(declare-fun res!479030 () Bool)

(assert (=> b!716083 (=> (not res!479030) (not e!402011))))

(assert (=> b!716083 (= res!479030 (not e!402012))))

(declare-fun res!479031 () Bool)

(assert (=> b!716083 (=> (not res!479031) (not e!402012))))

(assert (=> b!716083 (= res!479031 (validKeyInArray!0 (select (arr!19407 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716084 () Bool)

(declare-fun call!34642 () Bool)

(assert (=> b!716084 (= e!402013 call!34642)))

(declare-fun bm!34639 () Bool)

(assert (=> bm!34639 (= call!34642 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78893 (Cons!13444 (select (arr!19407 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) newAcc!49) newAcc!49)))))

(declare-fun b!716085 () Bool)

(assert (=> b!716085 (= e!402013 call!34642)))

(declare-fun d!98491 () Bool)

(declare-fun res!479029 () Bool)

(assert (=> d!98491 (=> res!479029 e!402010)))

(assert (=> d!98491 (= res!479029 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19823 a!3591)))))

(assert (=> d!98491 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49) e!402010)))

(assert (= (and d!98491 (not res!479029)) b!716083))

(assert (= (and b!716083 res!479031) b!716082))

(assert (= (and b!716083 res!479030) b!716081))

(assert (= (and b!716081 c!78893) b!716085))

(assert (= (and b!716081 (not c!78893)) b!716084))

(assert (= (or b!716085 b!716084) bm!34639))

(declare-fun m!672141 () Bool)

(assert (=> b!716081 m!672141))

(assert (=> b!716081 m!672141))

(declare-fun m!672143 () Bool)

(assert (=> b!716081 m!672143))

(assert (=> b!716082 m!672141))

(assert (=> b!716082 m!672141))

(declare-fun m!672145 () Bool)

(assert (=> b!716082 m!672145))

(assert (=> b!716083 m!672141))

(assert (=> b!716083 m!672141))

(assert (=> b!716083 m!672143))

(assert (=> bm!34639 m!672141))

(declare-fun m!672147 () Bool)

(assert (=> bm!34639 m!672147))

(assert (=> b!715851 d!98491))

(declare-fun d!98493 () Bool)

(assert (=> d!98493 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun lt!318877 () Unit!24636)

(declare-fun choose!66 (array!40540 (_ BitVec 64) (_ BitVec 32) List!13448 List!13448) Unit!24636)

(assert (=> d!98493 (= lt!318877 (choose!66 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(assert (=> d!98493 (bvslt (size!19823 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98493 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49) lt!318877)))

(declare-fun bs!20609 () Bool)

(assert (= bs!20609 d!98493))

(assert (=> bs!20609 m!671973))

(declare-fun m!672153 () Bool)

(assert (=> bs!20609 m!672153))

(assert (=> b!715851 d!98493))

(declare-fun b!716106 () Bool)

(declare-fun e!402030 () Bool)

(declare-fun e!402032 () Bool)

(assert (=> b!716106 (= e!402030 e!402032)))

(declare-fun c!78900 () Bool)

(assert (=> b!716106 (= c!78900 (validKeyInArray!0 (select (arr!19407 a!3591) from!2969)))))

(declare-fun e!402031 () Bool)

(declare-fun b!716107 () Bool)

(assert (=> b!716107 (= e!402031 (contains!4025 acc!652 (select (arr!19407 a!3591) from!2969)))))

(declare-fun b!716108 () Bool)

(declare-fun e!402029 () Bool)

(assert (=> b!716108 (= e!402029 e!402030)))

(declare-fun res!479041 () Bool)

(assert (=> b!716108 (=> (not res!479041) (not e!402030))))

(assert (=> b!716108 (= res!479041 (not e!402031))))

(declare-fun res!479042 () Bool)

(assert (=> b!716108 (=> (not res!479042) (not e!402031))))

(assert (=> b!716108 (= res!479042 (validKeyInArray!0 (select (arr!19407 a!3591) from!2969)))))

(declare-fun b!716109 () Bool)

(declare-fun call!34649 () Bool)

(assert (=> b!716109 (= e!402032 call!34649)))

(declare-fun bm!34646 () Bool)

(assert (=> bm!34646 (= call!34649 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78900 (Cons!13444 (select (arr!19407 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!716110 () Bool)

(assert (=> b!716110 (= e!402032 call!34649)))

(declare-fun d!98497 () Bool)

(declare-fun res!479040 () Bool)

(assert (=> d!98497 (=> res!479040 e!402029)))

(assert (=> d!98497 (= res!479040 (bvsge from!2969 (size!19823 a!3591)))))

(assert (=> d!98497 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!402029)))

(assert (= (and d!98497 (not res!479040)) b!716108))

(assert (= (and b!716108 res!479042) b!716107))

(assert (= (and b!716108 res!479041) b!716106))

(assert (= (and b!716106 c!78900) b!716110))

(assert (= (and b!716106 (not c!78900)) b!716109))

(assert (= (or b!716110 b!716109) bm!34646))

(assert (=> b!716106 m!671961))

(assert (=> b!716106 m!671961))

(assert (=> b!716106 m!671963))

(assert (=> b!716107 m!671961))

(assert (=> b!716107 m!671961))

(declare-fun m!672161 () Bool)

(assert (=> b!716107 m!672161))

(assert (=> b!716108 m!671961))

(assert (=> b!716108 m!671961))

(assert (=> b!716108 m!671963))

(assert (=> bm!34646 m!671961))

(declare-fun m!672163 () Bool)

(assert (=> bm!34646 m!672163))

(assert (=> b!715860 d!98497))

(declare-fun d!98501 () Bool)

(declare-fun lt!318886 () Bool)

(declare-fun content!372 (List!13448) (Set (_ BitVec 64)))

(assert (=> d!98501 (= lt!318886 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!372 newAcc!49)))))

(declare-fun e!402053 () Bool)

(assert (=> d!98501 (= lt!318886 e!402053)))

(declare-fun res!479060 () Bool)

(assert (=> d!98501 (=> (not res!479060) (not e!402053))))

(assert (=> d!98501 (= res!479060 (is-Cons!13444 newAcc!49))))

(assert (=> d!98501 (= (contains!4025 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318886)))

(declare-fun b!716132 () Bool)

(declare-fun e!402052 () Bool)

(assert (=> b!716132 (= e!402053 e!402052)))

(declare-fun res!479061 () Bool)

(assert (=> b!716132 (=> res!479061 e!402052)))

(assert (=> b!716132 (= res!479061 (= (h!14489 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716133 () Bool)

(assert (=> b!716133 (= e!402052 (contains!4025 (t!19763 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98501 res!479060) b!716132))

(assert (= (and b!716132 (not res!479061)) b!716133))

(declare-fun m!672187 () Bool)

(assert (=> d!98501 m!672187))

(declare-fun m!672189 () Bool)

(assert (=> d!98501 m!672189))

(declare-fun m!672191 () Bool)

(assert (=> b!716133 m!672191))

(assert (=> b!715853 d!98501))

(declare-fun b!716170 () Bool)

(declare-fun e!402088 () List!13448)

(declare-fun call!34653 () List!13448)

(assert (=> b!716170 (= e!402088 (Cons!13444 (h!14489 newAcc!49) call!34653))))

(declare-fun b!716171 () Bool)

(declare-fun e!402089 () List!13448)

(assert (=> b!716171 (= e!402089 e!402088)))

(declare-fun c!78907 () Bool)

(assert (=> b!716171 (= c!78907 (= k!2824 (h!14489 newAcc!49)))))

(declare-fun bm!34650 () Bool)

(assert (=> bm!34650 (= call!34653 (-!435 (t!19763 newAcc!49) k!2824))))

(declare-fun lt!318891 () List!13448)

(declare-fun b!716172 () Bool)

(declare-fun e!402087 () Bool)

(assert (=> b!716172 (= e!402087 (= (content!372 lt!318891) (set.minus (content!372 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!716173 () Bool)

(assert (=> b!716173 (= e!402089 Nil!13445)))

(declare-fun d!98511 () Bool)

(assert (=> d!98511 e!402087))

(declare-fun res!479090 () Bool)

(assert (=> d!98511 (=> (not res!479090) (not e!402087))))

(declare-fun size!19827 (List!13448) Int)

(assert (=> d!98511 (= res!479090 (<= (size!19827 lt!318891) (size!19827 newAcc!49)))))

(assert (=> d!98511 (= lt!318891 e!402089)))

(declare-fun c!78908 () Bool)

(assert (=> d!98511 (= c!78908 (is-Cons!13444 newAcc!49))))

(assert (=> d!98511 (= (-!435 newAcc!49 k!2824) lt!318891)))

(declare-fun b!716174 () Bool)

(assert (=> b!716174 (= e!402088 call!34653)))

(assert (= (and d!98511 c!78908) b!716171))

(assert (= (and d!98511 (not c!78908)) b!716173))

(assert (= (and b!716171 c!78907) b!716174))

(assert (= (and b!716171 (not c!78907)) b!716170))

(assert (= (or b!716174 b!716170) bm!34650))

(assert (= (and d!98511 res!479090) b!716172))

(declare-fun m!672215 () Bool)

(assert (=> bm!34650 m!672215))

(declare-fun m!672217 () Bool)

(assert (=> b!716172 m!672217))

(assert (=> b!716172 m!672187))

(declare-fun m!672219 () Bool)

(assert (=> b!716172 m!672219))

(declare-fun m!672221 () Bool)

(assert (=> d!98511 m!672221))

(declare-fun m!672223 () Bool)

(assert (=> d!98511 m!672223))

(assert (=> b!715864 d!98511))

(declare-fun d!98525 () Bool)

(declare-fun lt!318892 () Bool)

(assert (=> d!98525 (= lt!318892 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!372 acc!652)))))

(declare-fun e!402091 () Bool)

(assert (=> d!98525 (= lt!318892 e!402091)))

(declare-fun res!479091 () Bool)

(assert (=> d!98525 (=> (not res!479091) (not e!402091))))

(assert (=> d!98525 (= res!479091 (is-Cons!13444 acc!652))))

(assert (=> d!98525 (= (contains!4025 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318892)))

(declare-fun b!716175 () Bool)

(declare-fun e!402090 () Bool)

(assert (=> b!716175 (= e!402091 e!402090)))

(declare-fun res!479092 () Bool)

(assert (=> b!716175 (=> res!479092 e!402090)))

(assert (=> b!716175 (= res!479092 (= (h!14489 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716176 () Bool)

(assert (=> b!716176 (= e!402090 (contains!4025 (t!19763 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98525 res!479091) b!716175))

(assert (= (and b!716175 (not res!479092)) b!716176))

(declare-fun m!672225 () Bool)

(assert (=> d!98525 m!672225))

(declare-fun m!672227 () Bool)

(assert (=> d!98525 m!672227))

(declare-fun m!672229 () Bool)

(assert (=> b!716176 m!672229))

(assert (=> b!715862 d!98525))

(declare-fun d!98527 () Bool)

(assert (=> d!98527 (= (validKeyInArray!0 (select (arr!19407 a!3591) from!2969)) (and (not (= (select (arr!19407 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19407 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715852 d!98527))

(declare-fun d!98529 () Bool)

(declare-fun res!479110 () Bool)

(declare-fun e!402110 () Bool)

(assert (=> d!98529 (=> res!479110 e!402110)))

(assert (=> d!98529 (= res!479110 (= (select (arr!19407 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98529 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!402110)))

(declare-fun b!716196 () Bool)

(declare-fun e!402111 () Bool)

(assert (=> b!716196 (= e!402110 e!402111)))

(declare-fun res!479111 () Bool)

(assert (=> b!716196 (=> (not res!479111) (not e!402111))))

(assert (=> b!716196 (= res!479111 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19823 a!3591)))))

(declare-fun b!716197 () Bool)

(assert (=> b!716197 (= e!402111 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98529 (not res!479110)) b!716196))

(assert (= (and b!716196 res!479111) b!716197))

(assert (=> d!98529 m!672141))

(declare-fun m!672251 () Bool)

(assert (=> b!716197 m!672251))

(assert (=> b!715863 d!98529))

(declare-fun d!98543 () Bool)

(declare-fun res!479114 () Bool)

(declare-fun e!402114 () Bool)

(assert (=> d!98543 (=> res!479114 e!402114)))

(assert (=> d!98543 (= res!479114 (is-Nil!13445 acc!652))))

(assert (=> d!98543 (= (noDuplicate!1272 acc!652) e!402114)))

(declare-fun b!716200 () Bool)

(declare-fun e!402115 () Bool)

(assert (=> b!716200 (= e!402114 e!402115)))

(declare-fun res!479115 () Bool)

(assert (=> b!716200 (=> (not res!479115) (not e!402115))))

(assert (=> b!716200 (= res!479115 (not (contains!4025 (t!19763 acc!652) (h!14489 acc!652))))))

(declare-fun b!716201 () Bool)

(assert (=> b!716201 (= e!402115 (noDuplicate!1272 (t!19763 acc!652)))))

(assert (= (and d!98543 (not res!479114)) b!716200))

(assert (= (and b!716200 res!479115) b!716201))

(declare-fun m!672257 () Bool)

(assert (=> b!716200 m!672257))

(declare-fun m!672259 () Bool)

(assert (=> b!716201 m!672259))

