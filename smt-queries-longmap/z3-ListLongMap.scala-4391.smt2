; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60432 () Bool)

(assert start!60432)

(declare-fun b!678753 () Bool)

(declare-fun res!445053 () Bool)

(declare-fun e!386786 () Bool)

(assert (=> b!678753 (=> (not res!445053) (not e!386786))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678753 (= res!445053 (validKeyInArray!0 k0!2843))))

(declare-fun b!678754 () Bool)

(declare-fun res!445055 () Bool)

(assert (=> b!678754 (=> (not res!445055) (not e!386786))))

(declare-datatypes ((List!12846 0))(
  ( (Nil!12843) (Cons!12842 (h!13890 (_ BitVec 64)) (t!19066 List!12846)) )
))
(declare-fun acc!681 () List!12846)

(declare-fun contains!3498 (List!12846 (_ BitVec 64)) Bool)

(assert (=> b!678754 (= res!445055 (not (contains!3498 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678755 () Bool)

(declare-fun res!445063 () Bool)

(assert (=> b!678755 (=> (not res!445063) (not e!386786))))

(declare-fun e!386790 () Bool)

(assert (=> b!678755 (= res!445063 e!386790)))

(declare-fun res!445057 () Bool)

(assert (=> b!678755 (=> res!445057 e!386790)))

(declare-fun e!386788 () Bool)

(assert (=> b!678755 (= res!445057 e!386788)))

(declare-fun res!445051 () Bool)

(assert (=> b!678755 (=> (not res!445051) (not e!386788))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678755 (= res!445051 (bvsgt from!3004 i!1382))))

(declare-fun b!678756 () Bool)

(declare-fun e!386787 () Bool)

(assert (=> b!678756 (= e!386787 (not (contains!3498 acc!681 k0!2843)))))

(declare-fun b!678757 () Bool)

(assert (=> b!678757 (= e!386788 (contains!3498 acc!681 k0!2843))))

(declare-fun b!678758 () Bool)

(declare-fun res!445060 () Bool)

(assert (=> b!678758 (=> (not res!445060) (not e!386786))))

(declare-fun noDuplicate!772 (List!12846) Bool)

(assert (=> b!678758 (= res!445060 (noDuplicate!772 acc!681))))

(declare-fun b!678760 () Bool)

(declare-fun res!445050 () Bool)

(assert (=> b!678760 (=> (not res!445050) (not e!386786))))

(declare-datatypes ((array!39417 0))(
  ( (array!39418 (arr!18898 (Array (_ BitVec 32) (_ BitVec 64))) (size!19262 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39417)

(assert (=> b!678760 (= res!445050 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19262 a!3626))))))

(declare-fun b!678761 () Bool)

(declare-fun res!445056 () Bool)

(assert (=> b!678761 (=> (not res!445056) (not e!386786))))

(declare-fun arrayNoDuplicates!0 (array!39417 (_ BitVec 32) List!12846) Bool)

(assert (=> b!678761 (= res!445056 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12843))))

(declare-fun b!678762 () Bool)

(declare-fun res!445058 () Bool)

(assert (=> b!678762 (=> (not res!445058) (not e!386786))))

(assert (=> b!678762 (= res!445058 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678759 () Bool)

(declare-fun arrayContainsKey!0 (array!39417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678759 (= e!386786 (not (arrayContainsKey!0 (array!39418 (store (arr!18898 a!3626) i!1382 k0!2843) (size!19262 a!3626)) k0!2843 from!3004)))))

(declare-fun res!445061 () Bool)

(assert (=> start!60432 (=> (not res!445061) (not e!386786))))

(assert (=> start!60432 (= res!445061 (and (bvslt (size!19262 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19262 a!3626))))))

(assert (=> start!60432 e!386786))

(assert (=> start!60432 true))

(declare-fun array_inv!14757 (array!39417) Bool)

(assert (=> start!60432 (array_inv!14757 a!3626)))

(declare-fun b!678763 () Bool)

(declare-fun res!445062 () Bool)

(assert (=> b!678763 (=> (not res!445062) (not e!386786))))

(assert (=> b!678763 (= res!445062 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678764 () Bool)

(declare-fun res!445054 () Bool)

(assert (=> b!678764 (=> (not res!445054) (not e!386786))))

(assert (=> b!678764 (= res!445054 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19262 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678765 () Bool)

(declare-fun res!445059 () Bool)

(assert (=> b!678765 (=> (not res!445059) (not e!386786))))

(assert (=> b!678765 (= res!445059 (not (contains!3498 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678766 () Bool)

(assert (=> b!678766 (= e!386790 e!386787)))

(declare-fun res!445052 () Bool)

(assert (=> b!678766 (=> (not res!445052) (not e!386787))))

(assert (=> b!678766 (= res!445052 (bvsle from!3004 i!1382))))

(assert (= (and start!60432 res!445061) b!678758))

(assert (= (and b!678758 res!445060) b!678765))

(assert (= (and b!678765 res!445059) b!678754))

(assert (= (and b!678754 res!445055) b!678755))

(assert (= (and b!678755 res!445051) b!678757))

(assert (= (and b!678755 (not res!445057)) b!678766))

(assert (= (and b!678766 res!445052) b!678756))

(assert (= (and b!678755 res!445063) b!678761))

(assert (= (and b!678761 res!445056) b!678762))

(assert (= (and b!678762 res!445058) b!678760))

(assert (= (and b!678760 res!445050) b!678753))

(assert (= (and b!678753 res!445053) b!678763))

(assert (= (and b!678763 res!445062) b!678764))

(assert (= (and b!678764 res!445054) b!678759))

(declare-fun m!644959 () Bool)

(assert (=> b!678754 m!644959))

(declare-fun m!644961 () Bool)

(assert (=> b!678757 m!644961))

(declare-fun m!644963 () Bool)

(assert (=> b!678753 m!644963))

(declare-fun m!644965 () Bool)

(assert (=> b!678762 m!644965))

(declare-fun m!644967 () Bool)

(assert (=> b!678765 m!644967))

(declare-fun m!644969 () Bool)

(assert (=> start!60432 m!644969))

(declare-fun m!644971 () Bool)

(assert (=> b!678761 m!644971))

(assert (=> b!678756 m!644961))

(declare-fun m!644973 () Bool)

(assert (=> b!678763 m!644973))

(declare-fun m!644975 () Bool)

(assert (=> b!678758 m!644975))

(declare-fun m!644977 () Bool)

(assert (=> b!678759 m!644977))

(declare-fun m!644979 () Bool)

(assert (=> b!678759 m!644979))

(check-sat (not b!678756) (not b!678759) (not b!678754) (not b!678765) (not b!678762) (not start!60432) (not b!678763) (not b!678757) (not b!678753) (not b!678761) (not b!678758))
(check-sat)
(get-model)

(declare-fun d!93541 () Bool)

(declare-fun lt!313000 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!261 (List!12846) (InoxSet (_ BitVec 64)))

(assert (=> d!93541 (= lt!313000 (select (content!261 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386825 () Bool)

(assert (=> d!93541 (= lt!313000 e!386825)))

(declare-fun res!445152 () Bool)

(assert (=> d!93541 (=> (not res!445152) (not e!386825))))

(get-info :version)

(assert (=> d!93541 (= res!445152 ((_ is Cons!12842) acc!681))))

(assert (=> d!93541 (= (contains!3498 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313000)))

(declare-fun b!678855 () Bool)

(declare-fun e!386826 () Bool)

(assert (=> b!678855 (= e!386825 e!386826)))

(declare-fun res!445153 () Bool)

(assert (=> b!678855 (=> res!445153 e!386826)))

(assert (=> b!678855 (= res!445153 (= (h!13890 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678856 () Bool)

(assert (=> b!678856 (= e!386826 (contains!3498 (t!19066 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93541 res!445152) b!678855))

(assert (= (and b!678855 (not res!445153)) b!678856))

(declare-fun m!645025 () Bool)

(assert (=> d!93541 m!645025))

(declare-fun m!645027 () Bool)

(assert (=> d!93541 m!645027))

(declare-fun m!645029 () Bool)

(assert (=> b!678856 m!645029))

(assert (=> b!678765 d!93541))

(declare-fun d!93545 () Bool)

(declare-fun res!445162 () Bool)

(declare-fun e!386835 () Bool)

(assert (=> d!93545 (=> res!445162 e!386835)))

(assert (=> d!93545 (= res!445162 (= (select (arr!18898 (array!39418 (store (arr!18898 a!3626) i!1382 k0!2843) (size!19262 a!3626))) from!3004) k0!2843))))

(assert (=> d!93545 (= (arrayContainsKey!0 (array!39418 (store (arr!18898 a!3626) i!1382 k0!2843) (size!19262 a!3626)) k0!2843 from!3004) e!386835)))

(declare-fun b!678865 () Bool)

(declare-fun e!386836 () Bool)

(assert (=> b!678865 (= e!386835 e!386836)))

(declare-fun res!445163 () Bool)

(assert (=> b!678865 (=> (not res!445163) (not e!386836))))

(assert (=> b!678865 (= res!445163 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19262 (array!39418 (store (arr!18898 a!3626) i!1382 k0!2843) (size!19262 a!3626)))))))

(declare-fun b!678866 () Bool)

(assert (=> b!678866 (= e!386836 (arrayContainsKey!0 (array!39418 (store (arr!18898 a!3626) i!1382 k0!2843) (size!19262 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93545 (not res!445162)) b!678865))

(assert (= (and b!678865 res!445163) b!678866))

(declare-fun m!645031 () Bool)

(assert (=> d!93545 m!645031))

(declare-fun m!645033 () Bool)

(assert (=> b!678866 m!645033))

(assert (=> b!678759 d!93545))

(declare-fun d!93547 () Bool)

(declare-fun lt!313004 () Bool)

(assert (=> d!93547 (= lt!313004 (select (content!261 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386839 () Bool)

(assert (=> d!93547 (= lt!313004 e!386839)))

(declare-fun res!445166 () Bool)

(assert (=> d!93547 (=> (not res!445166) (not e!386839))))

(assert (=> d!93547 (= res!445166 ((_ is Cons!12842) acc!681))))

(assert (=> d!93547 (= (contains!3498 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313004)))

(declare-fun b!678869 () Bool)

(declare-fun e!386840 () Bool)

(assert (=> b!678869 (= e!386839 e!386840)))

(declare-fun res!445167 () Bool)

(assert (=> b!678869 (=> res!445167 e!386840)))

(assert (=> b!678869 (= res!445167 (= (h!13890 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678870 () Bool)

(assert (=> b!678870 (= e!386840 (contains!3498 (t!19066 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93547 res!445166) b!678869))

(assert (= (and b!678869 (not res!445167)) b!678870))

(assert (=> d!93547 m!645025))

(declare-fun m!645041 () Bool)

(assert (=> d!93547 m!645041))

(declare-fun m!645043 () Bool)

(assert (=> b!678870 m!645043))

(assert (=> b!678754 d!93547))

(declare-fun d!93551 () Bool)

(assert (=> d!93551 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!678753 d!93551))

(declare-fun d!93557 () Bool)

(declare-fun res!445170 () Bool)

(declare-fun e!386843 () Bool)

(assert (=> d!93557 (=> res!445170 e!386843)))

(assert (=> d!93557 (= res!445170 (= (select (arr!18898 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93557 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!386843)))

(declare-fun b!678873 () Bool)

(declare-fun e!386844 () Bool)

(assert (=> b!678873 (= e!386843 e!386844)))

(declare-fun res!445171 () Bool)

(assert (=> b!678873 (=> (not res!445171) (not e!386844))))

(assert (=> b!678873 (= res!445171 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19262 a!3626)))))

(declare-fun b!678874 () Bool)

(assert (=> b!678874 (= e!386844 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93557 (not res!445170)) b!678873))

(assert (= (and b!678873 res!445171) b!678874))

(declare-fun m!645049 () Bool)

(assert (=> d!93557 m!645049))

(declare-fun m!645051 () Bool)

(assert (=> b!678874 m!645051))

(assert (=> b!678763 d!93557))

(declare-fun d!93559 () Bool)

(assert (=> d!93559 (= (array_inv!14757 a!3626) (bvsge (size!19262 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60432 d!93559))

(declare-fun d!93561 () Bool)

(declare-fun res!445188 () Bool)

(declare-fun e!386865 () Bool)

(assert (=> d!93561 (=> res!445188 e!386865)))

(assert (=> d!93561 (= res!445188 ((_ is Nil!12843) acc!681))))

(assert (=> d!93561 (= (noDuplicate!772 acc!681) e!386865)))

(declare-fun b!678899 () Bool)

(declare-fun e!386866 () Bool)

(assert (=> b!678899 (= e!386865 e!386866)))

(declare-fun res!445189 () Bool)

(assert (=> b!678899 (=> (not res!445189) (not e!386866))))

(assert (=> b!678899 (= res!445189 (not (contains!3498 (t!19066 acc!681) (h!13890 acc!681))))))

(declare-fun b!678900 () Bool)

(assert (=> b!678900 (= e!386866 (noDuplicate!772 (t!19066 acc!681)))))

(assert (= (and d!93561 (not res!445188)) b!678899))

(assert (= (and b!678899 res!445189) b!678900))

(declare-fun m!645053 () Bool)

(assert (=> b!678899 m!645053))

(declare-fun m!645055 () Bool)

(assert (=> b!678900 m!645055))

(assert (=> b!678758 d!93561))

(declare-fun d!93563 () Bool)

(declare-fun lt!313006 () Bool)

(assert (=> d!93563 (= lt!313006 (select (content!261 acc!681) k0!2843))))

(declare-fun e!386867 () Bool)

(assert (=> d!93563 (= lt!313006 e!386867)))

(declare-fun res!445190 () Bool)

(assert (=> d!93563 (=> (not res!445190) (not e!386867))))

(assert (=> d!93563 (= res!445190 ((_ is Cons!12842) acc!681))))

(assert (=> d!93563 (= (contains!3498 acc!681 k0!2843) lt!313006)))

(declare-fun b!678901 () Bool)

(declare-fun e!386868 () Bool)

(assert (=> b!678901 (= e!386867 e!386868)))

(declare-fun res!445191 () Bool)

(assert (=> b!678901 (=> res!445191 e!386868)))

(assert (=> b!678901 (= res!445191 (= (h!13890 acc!681) k0!2843))))

(declare-fun b!678902 () Bool)

(assert (=> b!678902 (= e!386868 (contains!3498 (t!19066 acc!681) k0!2843))))

(assert (= (and d!93563 res!445190) b!678901))

(assert (= (and b!678901 (not res!445191)) b!678902))

(assert (=> d!93563 m!645025))

(declare-fun m!645057 () Bool)

(assert (=> d!93563 m!645057))

(declare-fun m!645059 () Bool)

(assert (=> b!678902 m!645059))

(assert (=> b!678757 d!93563))

(declare-fun e!386900 () Bool)

(declare-fun b!678939 () Bool)

(assert (=> b!678939 (= e!386900 (contains!3498 acc!681 (select (arr!18898 a!3626) from!3004)))))

(declare-fun b!678940 () Bool)

(declare-fun e!386899 () Bool)

(declare-fun e!386902 () Bool)

(assert (=> b!678940 (= e!386899 e!386902)))

(declare-fun c!77230 () Bool)

(assert (=> b!678940 (= c!77230 (validKeyInArray!0 (select (arr!18898 a!3626) from!3004)))))

(declare-fun bm!33929 () Bool)

(declare-fun call!33932 () Bool)

(assert (=> bm!33929 (= call!33932 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77230 (Cons!12842 (select (arr!18898 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!93565 () Bool)

(declare-fun res!445218 () Bool)

(declare-fun e!386901 () Bool)

(assert (=> d!93565 (=> res!445218 e!386901)))

(assert (=> d!93565 (= res!445218 (bvsge from!3004 (size!19262 a!3626)))))

(assert (=> d!93565 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!386901)))

(declare-fun b!678941 () Bool)

(assert (=> b!678941 (= e!386901 e!386899)))

(declare-fun res!445216 () Bool)

(assert (=> b!678941 (=> (not res!445216) (not e!386899))))

(assert (=> b!678941 (= res!445216 (not e!386900))))

(declare-fun res!445217 () Bool)

(assert (=> b!678941 (=> (not res!445217) (not e!386900))))

(assert (=> b!678941 (= res!445217 (validKeyInArray!0 (select (arr!18898 a!3626) from!3004)))))

(declare-fun b!678942 () Bool)

(assert (=> b!678942 (= e!386902 call!33932)))

(declare-fun b!678943 () Bool)

(assert (=> b!678943 (= e!386902 call!33932)))

(assert (= (and d!93565 (not res!445218)) b!678941))

(assert (= (and b!678941 res!445217) b!678939))

(assert (= (and b!678941 res!445216) b!678940))

(assert (= (and b!678940 c!77230) b!678942))

(assert (= (and b!678940 (not c!77230)) b!678943))

(assert (= (or b!678942 b!678943) bm!33929))

(declare-fun m!645097 () Bool)

(assert (=> b!678939 m!645097))

(assert (=> b!678939 m!645097))

(declare-fun m!645099 () Bool)

(assert (=> b!678939 m!645099))

(assert (=> b!678940 m!645097))

(assert (=> b!678940 m!645097))

(declare-fun m!645101 () Bool)

(assert (=> b!678940 m!645101))

(assert (=> bm!33929 m!645097))

(declare-fun m!645103 () Bool)

(assert (=> bm!33929 m!645103))

(assert (=> b!678941 m!645097))

(assert (=> b!678941 m!645097))

(assert (=> b!678941 m!645101))

(assert (=> b!678762 d!93565))

(declare-fun b!678944 () Bool)

(declare-fun e!386904 () Bool)

(assert (=> b!678944 (= e!386904 (contains!3498 Nil!12843 (select (arr!18898 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678945 () Bool)

(declare-fun e!386903 () Bool)

(declare-fun e!386906 () Bool)

(assert (=> b!678945 (= e!386903 e!386906)))

(declare-fun c!77231 () Bool)

(assert (=> b!678945 (= c!77231 (validKeyInArray!0 (select (arr!18898 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33930 () Bool)

(declare-fun call!33933 () Bool)

(assert (=> bm!33930 (= call!33933 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77231 (Cons!12842 (select (arr!18898 a!3626) #b00000000000000000000000000000000) Nil!12843) Nil!12843)))))

(declare-fun d!93581 () Bool)

(declare-fun res!445221 () Bool)

(declare-fun e!386905 () Bool)

(assert (=> d!93581 (=> res!445221 e!386905)))

(assert (=> d!93581 (= res!445221 (bvsge #b00000000000000000000000000000000 (size!19262 a!3626)))))

(assert (=> d!93581 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12843) e!386905)))

(declare-fun b!678946 () Bool)

(assert (=> b!678946 (= e!386905 e!386903)))

(declare-fun res!445219 () Bool)

(assert (=> b!678946 (=> (not res!445219) (not e!386903))))

(assert (=> b!678946 (= res!445219 (not e!386904))))

(declare-fun res!445220 () Bool)

(assert (=> b!678946 (=> (not res!445220) (not e!386904))))

(assert (=> b!678946 (= res!445220 (validKeyInArray!0 (select (arr!18898 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!678947 () Bool)

(assert (=> b!678947 (= e!386906 call!33933)))

(declare-fun b!678948 () Bool)

(assert (=> b!678948 (= e!386906 call!33933)))

(assert (= (and d!93581 (not res!445221)) b!678946))

(assert (= (and b!678946 res!445220) b!678944))

(assert (= (and b!678946 res!445219) b!678945))

(assert (= (and b!678945 c!77231) b!678947))

(assert (= (and b!678945 (not c!77231)) b!678948))

(assert (= (or b!678947 b!678948) bm!33930))

(assert (=> b!678944 m!645049))

(assert (=> b!678944 m!645049))

(declare-fun m!645105 () Bool)

(assert (=> b!678944 m!645105))

(assert (=> b!678945 m!645049))

(assert (=> b!678945 m!645049))

(declare-fun m!645107 () Bool)

(assert (=> b!678945 m!645107))

(assert (=> bm!33930 m!645049))

(declare-fun m!645109 () Bool)

(assert (=> bm!33930 m!645109))

(assert (=> b!678946 m!645049))

(assert (=> b!678946 m!645049))

(assert (=> b!678946 m!645107))

(assert (=> b!678761 d!93581))

(assert (=> b!678756 d!93563))

(check-sat (not b!678870) (not b!678941) (not b!678866) (not b!678902) (not bm!33930) (not b!678939) (not b!678946) (not b!678945) (not b!678874) (not b!678944) (not d!93547) (not bm!33929) (not d!93563) (not b!678856) (not b!678940) (not d!93541) (not b!678899) (not b!678900))
(check-sat)
