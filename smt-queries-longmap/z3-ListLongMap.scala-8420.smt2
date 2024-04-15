; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102454 () Bool)

(assert start!102454)

(declare-fun b!1232336 () Bool)

(declare-fun e!698949 () Bool)

(declare-datatypes ((array!79408 0))(
  ( (array!79409 (arr!38318 (Array (_ BitVec 32) (_ BitVec 64))) (size!38856 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79408)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27192 0))(
  ( (Nil!27189) (Cons!27188 (h!28397 (_ BitVec 64)) (t!40646 List!27192)) )
))
(declare-fun noDuplicate!1807 (List!27192) Bool)

(assert (=> b!1232336 (= e!698949 (noDuplicate!1807 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))

(declare-fun b!1232337 () Bool)

(declare-fun e!698948 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79408 (_ BitVec 32) List!27192) Bool)

(assert (=> b!1232337 (= e!698948 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))

(declare-fun b!1232338 () Bool)

(declare-fun res!820759 () Bool)

(declare-fun e!698951 () Bool)

(assert (=> b!1232338 (=> (not res!820759) (not e!698951))))

(declare-fun acc!823 () List!27192)

(assert (=> b!1232338 (= res!820759 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232340 () Bool)

(assert (=> b!1232340 (= e!698951 (not e!698949))))

(declare-fun res!820754 () Bool)

(assert (=> b!1232340 (=> res!820754 e!698949)))

(assert (=> b!1232340 (= res!820754 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1232340 e!698948))

(declare-fun res!820756 () Bool)

(assert (=> b!1232340 (=> (not res!820756) (not e!698948))))

(assert (=> b!1232340 (= res!820756 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27189))))

(declare-datatypes ((Unit!40667 0))(
  ( (Unit!40668) )
))
(declare-fun lt!559340 () Unit!40667)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79408 List!27192 List!27192 (_ BitVec 32)) Unit!40667)

(assert (=> b!1232340 (= lt!559340 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27189 from!3184))))

(assert (=> b!1232340 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823))))

(declare-fun b!1232341 () Bool)

(declare-fun res!820760 () Bool)

(assert (=> b!1232341 (=> (not res!820760) (not e!698951))))

(assert (=> b!1232341 (= res!820760 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38856 a!3806)) (bvslt from!3184 (size!38856 a!3806))))))

(declare-fun b!1232342 () Bool)

(declare-fun res!820755 () Bool)

(assert (=> b!1232342 (=> (not res!820755) (not e!698951))))

(declare-fun contains!7164 (List!27192 (_ BitVec 64)) Bool)

(assert (=> b!1232342 (= res!820755 (not (contains!7164 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820753 () Bool)

(assert (=> start!102454 (=> (not res!820753) (not e!698951))))

(assert (=> start!102454 (= res!820753 (bvslt (size!38856 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102454 e!698951))

(declare-fun array_inv!29301 (array!79408) Bool)

(assert (=> start!102454 (array_inv!29301 a!3806)))

(assert (=> start!102454 true))

(declare-fun b!1232339 () Bool)

(declare-fun res!820758 () Bool)

(assert (=> b!1232339 (=> (not res!820758) (not e!698951))))

(assert (=> b!1232339 (= res!820758 (not (contains!7164 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232343 () Bool)

(declare-fun res!820751 () Bool)

(assert (=> b!1232343 (=> (not res!820751) (not e!698951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232343 (= res!820751 (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232344 () Bool)

(declare-fun res!820752 () Bool)

(assert (=> b!1232344 (=> (not res!820752) (not e!698951))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1232344 (= res!820752 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232345 () Bool)

(declare-fun res!820750 () Bool)

(assert (=> b!1232345 (=> (not res!820750) (not e!698951))))

(assert (=> b!1232345 (= res!820750 (noDuplicate!1807 acc!823))))

(declare-fun b!1232346 () Bool)

(declare-fun res!820757 () Bool)

(assert (=> b!1232346 (=> (not res!820757) (not e!698951))))

(declare-fun arrayContainsKey!0 (array!79408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232346 (= res!820757 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102454 res!820753) b!1232344))

(assert (= (and b!1232344 res!820752) b!1232341))

(assert (= (and b!1232341 res!820760) b!1232345))

(assert (= (and b!1232345 res!820750) b!1232339))

(assert (= (and b!1232339 res!820758) b!1232342))

(assert (= (and b!1232342 res!820755) b!1232346))

(assert (= (and b!1232346 res!820757) b!1232338))

(assert (= (and b!1232338 res!820759) b!1232343))

(assert (= (and b!1232343 res!820751) b!1232340))

(assert (= (and b!1232340 res!820756) b!1232337))

(assert (= (and b!1232340 (not res!820754)) b!1232336))

(declare-fun m!1135899 () Bool)

(assert (=> b!1232336 m!1135899))

(declare-fun m!1135901 () Bool)

(assert (=> b!1232336 m!1135901))

(declare-fun m!1135903 () Bool)

(assert (=> b!1232345 m!1135903))

(declare-fun m!1135905 () Bool)

(assert (=> b!1232340 m!1135905))

(declare-fun m!1135907 () Bool)

(assert (=> b!1232340 m!1135907))

(assert (=> b!1232340 m!1135899))

(declare-fun m!1135909 () Bool)

(assert (=> b!1232340 m!1135909))

(declare-fun m!1135911 () Bool)

(assert (=> b!1232339 m!1135911))

(declare-fun m!1135913 () Bool)

(assert (=> b!1232338 m!1135913))

(declare-fun m!1135915 () Bool)

(assert (=> b!1232346 m!1135915))

(declare-fun m!1135917 () Bool)

(assert (=> b!1232342 m!1135917))

(declare-fun m!1135919 () Bool)

(assert (=> b!1232344 m!1135919))

(declare-fun m!1135921 () Bool)

(assert (=> start!102454 m!1135921))

(assert (=> b!1232343 m!1135899))

(assert (=> b!1232343 m!1135899))

(declare-fun m!1135923 () Bool)

(assert (=> b!1232343 m!1135923))

(assert (=> b!1232337 m!1135899))

(declare-fun m!1135925 () Bool)

(assert (=> b!1232337 m!1135925))

(check-sat (not b!1232338) (not b!1232345) (not b!1232339) (not b!1232344) (not b!1232340) (not start!102454) (not b!1232343) (not b!1232342) (not b!1232336) (not b!1232346) (not b!1232337))
(check-sat)
(get-model)

(declare-fun d!134745 () Bool)

(declare-fun lt!559349 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!569 (List!27192) (InoxSet (_ BitVec 64)))

(assert (=> d!134745 (= lt!559349 (select (content!569 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698980 () Bool)

(assert (=> d!134745 (= lt!559349 e!698980)))

(declare-fun res!820831 () Bool)

(assert (=> d!134745 (=> (not res!820831) (not e!698980))))

(get-info :version)

(assert (=> d!134745 (= res!820831 ((_ is Cons!27188) acc!823))))

(assert (=> d!134745 (= (contains!7164 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559349)))

(declare-fun b!1232417 () Bool)

(declare-fun e!698981 () Bool)

(assert (=> b!1232417 (= e!698980 e!698981)))

(declare-fun res!820832 () Bool)

(assert (=> b!1232417 (=> res!820832 e!698981)))

(assert (=> b!1232417 (= res!820832 (= (h!28397 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232418 () Bool)

(assert (=> b!1232418 (= e!698981 (contains!7164 (t!40646 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134745 res!820831) b!1232417))

(assert (= (and b!1232417 (not res!820832)) b!1232418))

(declare-fun m!1135983 () Bool)

(assert (=> d!134745 m!1135983))

(declare-fun m!1135985 () Bool)

(assert (=> d!134745 m!1135985))

(declare-fun m!1135987 () Bool)

(assert (=> b!1232418 m!1135987))

(assert (=> b!1232342 d!134745))

(declare-fun b!1232429 () Bool)

(declare-fun e!698991 () Bool)

(declare-fun call!60891 () Bool)

(assert (=> b!1232429 (= e!698991 call!60891)))

(declare-fun b!1232430 () Bool)

(assert (=> b!1232430 (= e!698991 call!60891)))

(declare-fun d!134747 () Bool)

(declare-fun res!820839 () Bool)

(declare-fun e!698990 () Bool)

(assert (=> d!134747 (=> res!820839 e!698990)))

(assert (=> d!134747 (= res!820839 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38856 a!3806)))))

(assert (=> d!134747 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) e!698990)))

(declare-fun bm!60888 () Bool)

(declare-fun c!120658 () Bool)

(assert (=> bm!60888 (= call!60891 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120658 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(declare-fun b!1232431 () Bool)

(declare-fun e!698993 () Bool)

(assert (=> b!1232431 (= e!698990 e!698993)))

(declare-fun res!820841 () Bool)

(assert (=> b!1232431 (=> (not res!820841) (not e!698993))))

(declare-fun e!698992 () Bool)

(assert (=> b!1232431 (= res!820841 (not e!698992))))

(declare-fun res!820840 () Bool)

(assert (=> b!1232431 (=> (not res!820840) (not e!698992))))

(assert (=> b!1232431 (= res!820840 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232432 () Bool)

(assert (=> b!1232432 (= e!698993 e!698991)))

(assert (=> b!1232432 (= c!120658 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232433 () Bool)

(assert (=> b!1232433 (= e!698992 (contains!7164 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134747 (not res!820839)) b!1232431))

(assert (= (and b!1232431 res!820840) b!1232433))

(assert (= (and b!1232431 res!820841) b!1232432))

(assert (= (and b!1232432 c!120658) b!1232429))

(assert (= (and b!1232432 (not c!120658)) b!1232430))

(assert (= (or b!1232429 b!1232430) bm!60888))

(declare-fun m!1135989 () Bool)

(assert (=> bm!60888 m!1135989))

(declare-fun m!1135991 () Bool)

(assert (=> bm!60888 m!1135991))

(assert (=> b!1232431 m!1135989))

(assert (=> b!1232431 m!1135989))

(declare-fun m!1135993 () Bool)

(assert (=> b!1232431 m!1135993))

(assert (=> b!1232432 m!1135989))

(assert (=> b!1232432 m!1135989))

(assert (=> b!1232432 m!1135993))

(assert (=> b!1232433 m!1135989))

(assert (=> b!1232433 m!1135989))

(declare-fun m!1135995 () Bool)

(assert (=> b!1232433 m!1135995))

(assert (=> b!1232337 d!134747))

(declare-fun d!134755 () Bool)

(declare-fun res!820858 () Bool)

(declare-fun e!699014 () Bool)

(assert (=> d!134755 (=> res!820858 e!699014)))

(assert (=> d!134755 (= res!820858 (= (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134755 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699014)))

(declare-fun b!1232458 () Bool)

(declare-fun e!699015 () Bool)

(assert (=> b!1232458 (= e!699014 e!699015)))

(declare-fun res!820859 () Bool)

(assert (=> b!1232458 (=> (not res!820859) (not e!699015))))

(assert (=> b!1232458 (= res!820859 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38856 a!3806)))))

(declare-fun b!1232459 () Bool)

(assert (=> b!1232459 (= e!699015 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134755 (not res!820858)) b!1232458))

(assert (= (and b!1232458 res!820859) b!1232459))

(assert (=> d!134755 m!1135989))

(declare-fun m!1135997 () Bool)

(assert (=> b!1232459 m!1135997))

(assert (=> b!1232346 d!134755))

(declare-fun d!134757 () Bool)

(declare-fun res!820870 () Bool)

(declare-fun e!699028 () Bool)

(assert (=> d!134757 (=> res!820870 e!699028)))

(assert (=> d!134757 (= res!820870 ((_ is Nil!27189) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))

(assert (=> d!134757 (= (noDuplicate!1807 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) e!699028)))

(declare-fun b!1232474 () Bool)

(declare-fun e!699029 () Bool)

(assert (=> b!1232474 (= e!699028 e!699029)))

(declare-fun res!820871 () Bool)

(assert (=> b!1232474 (=> (not res!820871) (not e!699029))))

(assert (=> b!1232474 (= res!820871 (not (contains!7164 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))))

(declare-fun b!1232475 () Bool)

(assert (=> b!1232475 (= e!699029 (noDuplicate!1807 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(assert (= (and d!134757 (not res!820870)) b!1232474))

(assert (= (and b!1232474 res!820871) b!1232475))

(declare-fun m!1136003 () Bool)

(assert (=> b!1232474 m!1136003))

(declare-fun m!1136007 () Bool)

(assert (=> b!1232475 m!1136007))

(assert (=> b!1232336 d!134757))

(declare-fun d!134763 () Bool)

(declare-fun lt!559350 () Bool)

(assert (=> d!134763 (= lt!559350 (select (content!569 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699030 () Bool)

(assert (=> d!134763 (= lt!559350 e!699030)))

(declare-fun res!820872 () Bool)

(assert (=> d!134763 (=> (not res!820872) (not e!699030))))

(assert (=> d!134763 (= res!820872 ((_ is Cons!27188) acc!823))))

(assert (=> d!134763 (= (contains!7164 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559350)))

(declare-fun b!1232476 () Bool)

(declare-fun e!699031 () Bool)

(assert (=> b!1232476 (= e!699030 e!699031)))

(declare-fun res!820873 () Bool)

(assert (=> b!1232476 (=> res!820873 e!699031)))

(assert (=> b!1232476 (= res!820873 (= (h!28397 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232477 () Bool)

(assert (=> b!1232477 (= e!699031 (contains!7164 (t!40646 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134763 res!820872) b!1232476))

(assert (= (and b!1232476 (not res!820873)) b!1232477))

(assert (=> d!134763 m!1135983))

(declare-fun m!1136011 () Bool)

(assert (=> d!134763 m!1136011))

(declare-fun m!1136013 () Bool)

(assert (=> b!1232477 m!1136013))

(assert (=> b!1232339 d!134763))

(declare-fun b!1232478 () Bool)

(declare-fun e!699033 () Bool)

(declare-fun call!60898 () Bool)

(assert (=> b!1232478 (= e!699033 call!60898)))

(declare-fun b!1232479 () Bool)

(assert (=> b!1232479 (= e!699033 call!60898)))

(declare-fun d!134767 () Bool)

(declare-fun res!820874 () Bool)

(declare-fun e!699032 () Bool)

(assert (=> d!134767 (=> res!820874 e!699032)))

(assert (=> d!134767 (= res!820874 (bvsge from!3184 (size!38856 a!3806)))))

(assert (=> d!134767 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27189) e!699032)))

(declare-fun c!120665 () Bool)

(declare-fun bm!60895 () Bool)

(assert (=> bm!60895 (= call!60898 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120665 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) Nil!27189)))))

(declare-fun b!1232480 () Bool)

(declare-fun e!699035 () Bool)

(assert (=> b!1232480 (= e!699032 e!699035)))

(declare-fun res!820876 () Bool)

(assert (=> b!1232480 (=> (not res!820876) (not e!699035))))

(declare-fun e!699034 () Bool)

(assert (=> b!1232480 (= res!820876 (not e!699034))))

(declare-fun res!820875 () Bool)

(assert (=> b!1232480 (=> (not res!820875) (not e!699034))))

(assert (=> b!1232480 (= res!820875 (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232481 () Bool)

(assert (=> b!1232481 (= e!699035 e!699033)))

(assert (=> b!1232481 (= c!120665 (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232482 () Bool)

(assert (=> b!1232482 (= e!699034 (contains!7164 Nil!27189 (select (arr!38318 a!3806) from!3184)))))

(assert (= (and d!134767 (not res!820874)) b!1232480))

(assert (= (and b!1232480 res!820875) b!1232482))

(assert (= (and b!1232480 res!820876) b!1232481))

(assert (= (and b!1232481 c!120665) b!1232478))

(assert (= (and b!1232481 (not c!120665)) b!1232479))

(assert (= (or b!1232478 b!1232479) bm!60895))

(assert (=> bm!60895 m!1135899))

(declare-fun m!1136015 () Bool)

(assert (=> bm!60895 m!1136015))

(assert (=> b!1232480 m!1135899))

(assert (=> b!1232480 m!1135899))

(assert (=> b!1232480 m!1135923))

(assert (=> b!1232481 m!1135899))

(assert (=> b!1232481 m!1135899))

(assert (=> b!1232481 m!1135923))

(assert (=> b!1232482 m!1135899))

(assert (=> b!1232482 m!1135899))

(declare-fun m!1136017 () Bool)

(assert (=> b!1232482 m!1136017))

(assert (=> b!1232340 d!134767))

(declare-fun d!134771 () Bool)

(assert (=> d!134771 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27189)))

(declare-fun lt!559356 () Unit!40667)

(declare-fun choose!80 (array!79408 List!27192 List!27192 (_ BitVec 32)) Unit!40667)

(assert (=> d!134771 (= lt!559356 (choose!80 a!3806 acc!823 Nil!27189 from!3184))))

(assert (=> d!134771 (bvslt (size!38856 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134771 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27189 from!3184) lt!559356)))

(declare-fun bs!34609 () Bool)

(assert (= bs!34609 d!134771))

(assert (=> bs!34609 m!1135905))

(declare-fun m!1136029 () Bool)

(assert (=> bs!34609 m!1136029))

(assert (=> b!1232340 d!134771))

(declare-fun b!1232499 () Bool)

(declare-fun e!699053 () Bool)

(declare-fun call!60899 () Bool)

(assert (=> b!1232499 (= e!699053 call!60899)))

(declare-fun b!1232500 () Bool)

(assert (=> b!1232500 (= e!699053 call!60899)))

(declare-fun d!134777 () Bool)

(declare-fun res!820893 () Bool)

(declare-fun e!699052 () Bool)

(assert (=> d!134777 (=> res!820893 e!699052)))

(assert (=> d!134777 (= res!820893 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38856 a!3806)))))

(assert (=> d!134777 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) e!699052)))

(declare-fun c!120666 () Bool)

(declare-fun bm!60896 () Bool)

(assert (=> bm!60896 (= call!60899 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120666 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823))))))

(declare-fun b!1232501 () Bool)

(declare-fun e!699055 () Bool)

(assert (=> b!1232501 (= e!699052 e!699055)))

(declare-fun res!820895 () Bool)

(assert (=> b!1232501 (=> (not res!820895) (not e!699055))))

(declare-fun e!699054 () Bool)

(assert (=> b!1232501 (= res!820895 (not e!699054))))

(declare-fun res!820894 () Bool)

(assert (=> b!1232501 (=> (not res!820894) (not e!699054))))

(assert (=> b!1232501 (= res!820894 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232502 () Bool)

(assert (=> b!1232502 (= e!699055 e!699053)))

(assert (=> b!1232502 (= c!120666 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232503 () Bool)

(assert (=> b!1232503 (= e!699054 (contains!7164 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134777 (not res!820893)) b!1232501))

(assert (= (and b!1232501 res!820894) b!1232503))

(assert (= (and b!1232501 res!820895) b!1232502))

(assert (= (and b!1232502 c!120666) b!1232499))

(assert (= (and b!1232502 (not c!120666)) b!1232500))

(assert (= (or b!1232499 b!1232500) bm!60896))

(assert (=> bm!60896 m!1135989))

(declare-fun m!1136031 () Bool)

(assert (=> bm!60896 m!1136031))

(assert (=> b!1232501 m!1135989))

(assert (=> b!1232501 m!1135989))

(assert (=> b!1232501 m!1135993))

(assert (=> b!1232502 m!1135989))

(assert (=> b!1232502 m!1135989))

(assert (=> b!1232502 m!1135993))

(assert (=> b!1232503 m!1135989))

(assert (=> b!1232503 m!1135989))

(declare-fun m!1136037 () Bool)

(assert (=> b!1232503 m!1136037))

(assert (=> b!1232340 d!134777))

(declare-fun d!134781 () Bool)

(declare-fun res!820898 () Bool)

(declare-fun e!699058 () Bool)

(assert (=> d!134781 (=> res!820898 e!699058)))

(assert (=> d!134781 (= res!820898 ((_ is Nil!27189) acc!823))))

(assert (=> d!134781 (= (noDuplicate!1807 acc!823) e!699058)))

(declare-fun b!1232506 () Bool)

(declare-fun e!699059 () Bool)

(assert (=> b!1232506 (= e!699058 e!699059)))

(declare-fun res!820899 () Bool)

(assert (=> b!1232506 (=> (not res!820899) (not e!699059))))

(assert (=> b!1232506 (= res!820899 (not (contains!7164 (t!40646 acc!823) (h!28397 acc!823))))))

(declare-fun b!1232507 () Bool)

(assert (=> b!1232507 (= e!699059 (noDuplicate!1807 (t!40646 acc!823)))))

(assert (= (and d!134781 (not res!820898)) b!1232506))

(assert (= (and b!1232506 res!820899) b!1232507))

(declare-fun m!1136039 () Bool)

(assert (=> b!1232506 m!1136039))

(declare-fun m!1136041 () Bool)

(assert (=> b!1232507 m!1136041))

(assert (=> b!1232345 d!134781))

(declare-fun b!1232508 () Bool)

(declare-fun e!699063 () Bool)

(declare-fun call!60900 () Bool)

(assert (=> b!1232508 (= e!699063 call!60900)))

(declare-fun b!1232509 () Bool)

(assert (=> b!1232509 (= e!699063 call!60900)))

(declare-fun d!134783 () Bool)

(declare-fun res!820900 () Bool)

(declare-fun e!699060 () Bool)

(assert (=> d!134783 (=> res!820900 e!699060)))

(assert (=> d!134783 (= res!820900 (bvsge from!3184 (size!38856 a!3806)))))

(assert (=> d!134783 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699060)))

(declare-fun bm!60897 () Bool)

(declare-fun c!120667 () Bool)

(assert (=> bm!60897 (= call!60900 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120667 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1232510 () Bool)

(declare-fun e!699065 () Bool)

(assert (=> b!1232510 (= e!699060 e!699065)))

(declare-fun res!820904 () Bool)

(assert (=> b!1232510 (=> (not res!820904) (not e!699065))))

(declare-fun e!699064 () Bool)

(assert (=> b!1232510 (= res!820904 (not e!699064))))

(declare-fun res!820903 () Bool)

(assert (=> b!1232510 (=> (not res!820903) (not e!699064))))

(assert (=> b!1232510 (= res!820903 (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232513 () Bool)

(assert (=> b!1232513 (= e!699065 e!699063)))

(assert (=> b!1232513 (= c!120667 (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232514 () Bool)

(assert (=> b!1232514 (= e!699064 (contains!7164 acc!823 (select (arr!38318 a!3806) from!3184)))))

(assert (= (and d!134783 (not res!820900)) b!1232510))

(assert (= (and b!1232510 res!820903) b!1232514))

(assert (= (and b!1232510 res!820904) b!1232513))

(assert (= (and b!1232513 c!120667) b!1232508))

(assert (= (and b!1232513 (not c!120667)) b!1232509))

(assert (= (or b!1232508 b!1232509) bm!60897))

(assert (=> bm!60897 m!1135899))

(declare-fun m!1136043 () Bool)

(assert (=> bm!60897 m!1136043))

(assert (=> b!1232510 m!1135899))

(assert (=> b!1232510 m!1135899))

(assert (=> b!1232510 m!1135923))

(assert (=> b!1232513 m!1135899))

(assert (=> b!1232513 m!1135899))

(assert (=> b!1232513 m!1135923))

(assert (=> b!1232514 m!1135899))

(assert (=> b!1232514 m!1135899))

(declare-fun m!1136045 () Bool)

(assert (=> b!1232514 m!1136045))

(assert (=> b!1232338 d!134783))

(declare-fun d!134785 () Bool)

(assert (=> d!134785 (= (validKeyInArray!0 (select (arr!38318 a!3806) from!3184)) (and (not (= (select (arr!38318 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38318 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232343 d!134785))

(declare-fun d!134789 () Bool)

(assert (=> d!134789 (= (array_inv!29301 a!3806) (bvsge (size!38856 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102454 d!134789))

(declare-fun d!134793 () Bool)

(assert (=> d!134793 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232344 d!134793))

(check-sat (not d!134771) (not d!134745) (not b!1232507) (not b!1232501) (not b!1232513) (not bm!60895) (not b!1232503) (not b!1232481) (not b!1232510) (not bm!60888) (not b!1232432) (not b!1232459) (not b!1232431) (not b!1232474) (not b!1232506) (not bm!60897) (not b!1232433) (not b!1232502) (not d!134763) (not b!1232475) (not b!1232418) (not b!1232480) (not bm!60896) (not b!1232482) (not b!1232514) (not b!1232477))
(check-sat)
(get-model)

(declare-fun d!134823 () Bool)

(declare-fun c!120676 () Bool)

(assert (=> d!134823 (= c!120676 ((_ is Nil!27189) acc!823))))

(declare-fun e!699116 () (InoxSet (_ BitVec 64)))

(assert (=> d!134823 (= (content!569 acc!823) e!699116)))

(declare-fun b!1232573 () Bool)

(assert (=> b!1232573 (= e!699116 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1232574 () Bool)

(assert (=> b!1232574 (= e!699116 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28397 acc!823) true) (content!569 (t!40646 acc!823))))))

(assert (= (and d!134823 c!120676) b!1232573))

(assert (= (and d!134823 (not c!120676)) b!1232574))

(declare-fun m!1136109 () Bool)

(assert (=> b!1232574 m!1136109))

(declare-fun m!1136111 () Bool)

(assert (=> b!1232574 m!1136111))

(assert (=> d!134763 d!134823))

(declare-fun d!134825 () Bool)

(declare-fun res!820947 () Bool)

(declare-fun e!699117 () Bool)

(assert (=> d!134825 (=> res!820947 e!699117)))

(assert (=> d!134825 (= res!820947 ((_ is Nil!27189) (t!40646 acc!823)))))

(assert (=> d!134825 (= (noDuplicate!1807 (t!40646 acc!823)) e!699117)))

(declare-fun b!1232575 () Bool)

(declare-fun e!699118 () Bool)

(assert (=> b!1232575 (= e!699117 e!699118)))

(declare-fun res!820948 () Bool)

(assert (=> b!1232575 (=> (not res!820948) (not e!699118))))

(assert (=> b!1232575 (= res!820948 (not (contains!7164 (t!40646 (t!40646 acc!823)) (h!28397 (t!40646 acc!823)))))))

(declare-fun b!1232576 () Bool)

(assert (=> b!1232576 (= e!699118 (noDuplicate!1807 (t!40646 (t!40646 acc!823))))))

(assert (= (and d!134825 (not res!820947)) b!1232575))

(assert (= (and b!1232575 res!820948) b!1232576))

(declare-fun m!1136113 () Bool)

(assert (=> b!1232575 m!1136113))

(declare-fun m!1136115 () Bool)

(assert (=> b!1232576 m!1136115))

(assert (=> b!1232507 d!134825))

(declare-fun d!134827 () Bool)

(assert (=> d!134827 (= (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232502 d!134827))

(assert (=> d!134771 d!134767))

(declare-fun d!134829 () Bool)

(assert (=> d!134829 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27189)))

(assert (=> d!134829 true))

(declare-fun _$70!92 () Unit!40667)

(assert (=> d!134829 (= (choose!80 a!3806 acc!823 Nil!27189 from!3184) _$70!92)))

(declare-fun bs!34612 () Bool)

(assert (= bs!34612 d!134829))

(assert (=> bs!34612 m!1135905))

(assert (=> d!134771 d!134829))

(declare-fun b!1232577 () Bool)

(declare-fun e!699120 () Bool)

(declare-fun call!60907 () Bool)

(assert (=> b!1232577 (= e!699120 call!60907)))

(declare-fun b!1232578 () Bool)

(assert (=> b!1232578 (= e!699120 call!60907)))

(declare-fun d!134831 () Bool)

(declare-fun res!820949 () Bool)

(declare-fun e!699119 () Bool)

(assert (=> d!134831 (=> res!820949 e!699119)))

(assert (=> d!134831 (= res!820949 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38856 a!3806)))))

(assert (=> d!134831 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120666 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823))) e!699119)))

(declare-fun c!120677 () Bool)

(declare-fun bm!60904 () Bool)

(assert (=> bm!60904 (= call!60907 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120677 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120666 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823))) (ite c!120666 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)))))))

(declare-fun b!1232579 () Bool)

(declare-fun e!699122 () Bool)

(assert (=> b!1232579 (= e!699119 e!699122)))

(declare-fun res!820951 () Bool)

(assert (=> b!1232579 (=> (not res!820951) (not e!699122))))

(declare-fun e!699121 () Bool)

(assert (=> b!1232579 (= res!820951 (not e!699121))))

(declare-fun res!820950 () Bool)

(assert (=> b!1232579 (=> (not res!820950) (not e!699121))))

(assert (=> b!1232579 (= res!820950 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232580 () Bool)

(assert (=> b!1232580 (= e!699122 e!699120)))

(assert (=> b!1232580 (= c!120677 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232581 () Bool)

(assert (=> b!1232581 (= e!699121 (contains!7164 (ite c!120666 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134831 (not res!820949)) b!1232579))

(assert (= (and b!1232579 res!820950) b!1232581))

(assert (= (and b!1232579 res!820951) b!1232580))

(assert (= (and b!1232580 c!120677) b!1232577))

(assert (= (and b!1232580 (not c!120677)) b!1232578))

(assert (= (or b!1232577 b!1232578) bm!60904))

(declare-fun m!1136117 () Bool)

(assert (=> bm!60904 m!1136117))

(declare-fun m!1136119 () Bool)

(assert (=> bm!60904 m!1136119))

(assert (=> b!1232579 m!1136117))

(assert (=> b!1232579 m!1136117))

(declare-fun m!1136121 () Bool)

(assert (=> b!1232579 m!1136121))

(assert (=> b!1232580 m!1136117))

(assert (=> b!1232580 m!1136117))

(assert (=> b!1232580 m!1136121))

(assert (=> b!1232581 m!1136117))

(assert (=> b!1232581 m!1136117))

(declare-fun m!1136123 () Bool)

(assert (=> b!1232581 m!1136123))

(assert (=> bm!60896 d!134831))

(assert (=> b!1232501 d!134827))

(declare-fun d!134833 () Bool)

(declare-fun lt!559368 () Bool)

(assert (=> d!134833 (= lt!559368 (select (content!569 (t!40646 acc!823)) (h!28397 acc!823)))))

(declare-fun e!699123 () Bool)

(assert (=> d!134833 (= lt!559368 e!699123)))

(declare-fun res!820952 () Bool)

(assert (=> d!134833 (=> (not res!820952) (not e!699123))))

(assert (=> d!134833 (= res!820952 ((_ is Cons!27188) (t!40646 acc!823)))))

(assert (=> d!134833 (= (contains!7164 (t!40646 acc!823) (h!28397 acc!823)) lt!559368)))

(declare-fun b!1232582 () Bool)

(declare-fun e!699124 () Bool)

(assert (=> b!1232582 (= e!699123 e!699124)))

(declare-fun res!820953 () Bool)

(assert (=> b!1232582 (=> res!820953 e!699124)))

(assert (=> b!1232582 (= res!820953 (= (h!28397 (t!40646 acc!823)) (h!28397 acc!823)))))

(declare-fun b!1232583 () Bool)

(assert (=> b!1232583 (= e!699124 (contains!7164 (t!40646 (t!40646 acc!823)) (h!28397 acc!823)))))

(assert (= (and d!134833 res!820952) b!1232582))

(assert (= (and b!1232582 (not res!820953)) b!1232583))

(assert (=> d!134833 m!1136111))

(declare-fun m!1136125 () Bool)

(assert (=> d!134833 m!1136125))

(declare-fun m!1136127 () Bool)

(assert (=> b!1232583 m!1136127))

(assert (=> b!1232506 d!134833))

(declare-fun d!134835 () Bool)

(declare-fun lt!559369 () Bool)

(assert (=> d!134835 (= lt!559369 (select (content!569 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!699125 () Bool)

(assert (=> d!134835 (= lt!559369 e!699125)))

(declare-fun res!820954 () Bool)

(assert (=> d!134835 (=> (not res!820954) (not e!699125))))

(assert (=> d!134835 (= res!820954 ((_ is Cons!27188) (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)))))

(assert (=> d!134835 (= (contains!7164 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559369)))

(declare-fun b!1232584 () Bool)

(declare-fun e!699126 () Bool)

(assert (=> b!1232584 (= e!699125 e!699126)))

(declare-fun res!820955 () Bool)

(assert (=> b!1232584 (=> res!820955 e!699126)))

(assert (=> b!1232584 (= res!820955 (= (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232585 () Bool)

(assert (=> b!1232585 (= e!699126 (contains!7164 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134835 res!820954) b!1232584))

(assert (= (and b!1232584 (not res!820955)) b!1232585))

(declare-fun m!1136129 () Bool)

(assert (=> d!134835 m!1136129))

(assert (=> d!134835 m!1135989))

(declare-fun m!1136131 () Bool)

(assert (=> d!134835 m!1136131))

(assert (=> b!1232585 m!1135989))

(declare-fun m!1136133 () Bool)

(assert (=> b!1232585 m!1136133))

(assert (=> b!1232503 d!134835))

(declare-fun d!134837 () Bool)

(declare-fun lt!559370 () Bool)

(assert (=> d!134837 (= lt!559370 (select (content!569 acc!823) (select (arr!38318 a!3806) from!3184)))))

(declare-fun e!699127 () Bool)

(assert (=> d!134837 (= lt!559370 e!699127)))

(declare-fun res!820956 () Bool)

(assert (=> d!134837 (=> (not res!820956) (not e!699127))))

(assert (=> d!134837 (= res!820956 ((_ is Cons!27188) acc!823))))

(assert (=> d!134837 (= (contains!7164 acc!823 (select (arr!38318 a!3806) from!3184)) lt!559370)))

(declare-fun b!1232586 () Bool)

(declare-fun e!699128 () Bool)

(assert (=> b!1232586 (= e!699127 e!699128)))

(declare-fun res!820957 () Bool)

(assert (=> b!1232586 (=> res!820957 e!699128)))

(assert (=> b!1232586 (= res!820957 (= (h!28397 acc!823) (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232587 () Bool)

(assert (=> b!1232587 (= e!699128 (contains!7164 (t!40646 acc!823) (select (arr!38318 a!3806) from!3184)))))

(assert (= (and d!134837 res!820956) b!1232586))

(assert (= (and b!1232586 (not res!820957)) b!1232587))

(assert (=> d!134837 m!1135983))

(assert (=> d!134837 m!1135899))

(declare-fun m!1136135 () Bool)

(assert (=> d!134837 m!1136135))

(assert (=> b!1232587 m!1135899))

(declare-fun m!1136137 () Bool)

(assert (=> b!1232587 m!1136137))

(assert (=> b!1232514 d!134837))

(declare-fun d!134839 () Bool)

(declare-fun lt!559371 () Bool)

(assert (=> d!134839 (= lt!559371 (select (content!569 (t!40646 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699129 () Bool)

(assert (=> d!134839 (= lt!559371 e!699129)))

(declare-fun res!820958 () Bool)

(assert (=> d!134839 (=> (not res!820958) (not e!699129))))

(assert (=> d!134839 (= res!820958 ((_ is Cons!27188) (t!40646 acc!823)))))

(assert (=> d!134839 (= (contains!7164 (t!40646 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559371)))

(declare-fun b!1232588 () Bool)

(declare-fun e!699130 () Bool)

(assert (=> b!1232588 (= e!699129 e!699130)))

(declare-fun res!820959 () Bool)

(assert (=> b!1232588 (=> res!820959 e!699130)))

(assert (=> b!1232588 (= res!820959 (= (h!28397 (t!40646 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232589 () Bool)

(assert (=> b!1232589 (= e!699130 (contains!7164 (t!40646 (t!40646 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134839 res!820958) b!1232588))

(assert (= (and b!1232588 (not res!820959)) b!1232589))

(assert (=> d!134839 m!1136111))

(declare-fun m!1136139 () Bool)

(assert (=> d!134839 m!1136139))

(declare-fun m!1136141 () Bool)

(assert (=> b!1232589 m!1136141))

(assert (=> b!1232418 d!134839))

(declare-fun b!1232590 () Bool)

(declare-fun e!699132 () Bool)

(declare-fun call!60908 () Bool)

(assert (=> b!1232590 (= e!699132 call!60908)))

(declare-fun b!1232591 () Bool)

(assert (=> b!1232591 (= e!699132 call!60908)))

(declare-fun d!134841 () Bool)

(declare-fun res!820960 () Bool)

(declare-fun e!699131 () Bool)

(assert (=> d!134841 (=> res!820960 e!699131)))

(assert (=> d!134841 (= res!820960 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38856 a!3806)))))

(assert (=> d!134841 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120658 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) e!699131)))

(declare-fun c!120678 () Bool)

(declare-fun bm!60905 () Bool)

(assert (=> bm!60905 (= call!60908 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120678 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120658 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) (ite c!120658 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))))

(declare-fun b!1232592 () Bool)

(declare-fun e!699134 () Bool)

(assert (=> b!1232592 (= e!699131 e!699134)))

(declare-fun res!820962 () Bool)

(assert (=> b!1232592 (=> (not res!820962) (not e!699134))))

(declare-fun e!699133 () Bool)

(assert (=> b!1232592 (= res!820962 (not e!699133))))

(declare-fun res!820961 () Bool)

(assert (=> b!1232592 (=> (not res!820961) (not e!699133))))

(assert (=> b!1232592 (= res!820961 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232593 () Bool)

(assert (=> b!1232593 (= e!699134 e!699132)))

(assert (=> b!1232593 (= c!120678 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232594 () Bool)

(assert (=> b!1232594 (= e!699133 (contains!7164 (ite c!120658 (Cons!27188 (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134841 (not res!820960)) b!1232592))

(assert (= (and b!1232592 res!820961) b!1232594))

(assert (= (and b!1232592 res!820962) b!1232593))

(assert (= (and b!1232593 c!120678) b!1232590))

(assert (= (and b!1232593 (not c!120678)) b!1232591))

(assert (= (or b!1232590 b!1232591) bm!60905))

(assert (=> bm!60905 m!1136117))

(declare-fun m!1136143 () Bool)

(assert (=> bm!60905 m!1136143))

(assert (=> b!1232592 m!1136117))

(assert (=> b!1232592 m!1136117))

(assert (=> b!1232592 m!1136121))

(assert (=> b!1232593 m!1136117))

(assert (=> b!1232593 m!1136117))

(assert (=> b!1232593 m!1136121))

(assert (=> b!1232594 m!1136117))

(assert (=> b!1232594 m!1136117))

(declare-fun m!1136145 () Bool)

(assert (=> b!1232594 m!1136145))

(assert (=> bm!60888 d!134841))

(declare-fun d!134843 () Bool)

(declare-fun lt!559372 () Bool)

(assert (=> d!134843 (= lt!559372 (select (content!569 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(declare-fun e!699135 () Bool)

(assert (=> d!134843 (= lt!559372 e!699135)))

(declare-fun res!820963 () Bool)

(assert (=> d!134843 (=> (not res!820963) (not e!699135))))

(assert (=> d!134843 (= res!820963 ((_ is Cons!27188) (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(assert (=> d!134843 (= (contains!7164 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) lt!559372)))

(declare-fun b!1232595 () Bool)

(declare-fun e!699136 () Bool)

(assert (=> b!1232595 (= e!699135 e!699136)))

(declare-fun res!820964 () Bool)

(assert (=> b!1232595 (=> res!820964 e!699136)))

(assert (=> b!1232595 (= res!820964 (= (h!28397 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(declare-fun b!1232596 () Bool)

(assert (=> b!1232596 (= e!699136 (contains!7164 (t!40646 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(assert (= (and d!134843 res!820963) b!1232595))

(assert (= (and b!1232595 (not res!820964)) b!1232596))

(declare-fun m!1136147 () Bool)

(assert (=> d!134843 m!1136147))

(declare-fun m!1136149 () Bool)

(assert (=> d!134843 m!1136149))

(declare-fun m!1136151 () Bool)

(assert (=> b!1232596 m!1136151))

(assert (=> b!1232474 d!134843))

(assert (=> b!1232431 d!134827))

(declare-fun d!134845 () Bool)

(declare-fun lt!559373 () Bool)

(assert (=> d!134845 (= lt!559373 (select (content!569 Nil!27189) (select (arr!38318 a!3806) from!3184)))))

(declare-fun e!699137 () Bool)

(assert (=> d!134845 (= lt!559373 e!699137)))

(declare-fun res!820965 () Bool)

(assert (=> d!134845 (=> (not res!820965) (not e!699137))))

(assert (=> d!134845 (= res!820965 ((_ is Cons!27188) Nil!27189))))

(assert (=> d!134845 (= (contains!7164 Nil!27189 (select (arr!38318 a!3806) from!3184)) lt!559373)))

(declare-fun b!1232597 () Bool)

(declare-fun e!699138 () Bool)

(assert (=> b!1232597 (= e!699137 e!699138)))

(declare-fun res!820966 () Bool)

(assert (=> b!1232597 (=> res!820966 e!699138)))

(assert (=> b!1232597 (= res!820966 (= (h!28397 Nil!27189) (select (arr!38318 a!3806) from!3184)))))

(declare-fun b!1232598 () Bool)

(assert (=> b!1232598 (= e!699138 (contains!7164 (t!40646 Nil!27189) (select (arr!38318 a!3806) from!3184)))))

(assert (= (and d!134845 res!820965) b!1232597))

(assert (= (and b!1232597 (not res!820966)) b!1232598))

(declare-fun m!1136153 () Bool)

(assert (=> d!134845 m!1136153))

(assert (=> d!134845 m!1135899))

(declare-fun m!1136155 () Bool)

(assert (=> d!134845 m!1136155))

(assert (=> b!1232598 m!1135899))

(declare-fun m!1136157 () Bool)

(assert (=> b!1232598 m!1136157))

(assert (=> b!1232482 d!134845))

(assert (=> b!1232513 d!134785))

(declare-fun d!134847 () Bool)

(declare-fun res!820967 () Bool)

(declare-fun e!699139 () Bool)

(assert (=> d!134847 (=> res!820967 e!699139)))

(assert (=> d!134847 (= res!820967 (= (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!134847 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!699139)))

(declare-fun b!1232599 () Bool)

(declare-fun e!699140 () Bool)

(assert (=> b!1232599 (= e!699139 e!699140)))

(declare-fun res!820968 () Bool)

(assert (=> b!1232599 (=> (not res!820968) (not e!699140))))

(assert (=> b!1232599 (= res!820968 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38856 a!3806)))))

(declare-fun b!1232600 () Bool)

(assert (=> b!1232600 (= e!699140 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134847 (not res!820967)) b!1232599))

(assert (= (and b!1232599 res!820968) b!1232600))

(assert (=> d!134847 m!1136117))

(declare-fun m!1136159 () Bool)

(assert (=> b!1232600 m!1136159))

(assert (=> b!1232459 d!134847))

(declare-fun d!134849 () Bool)

(declare-fun lt!559374 () Bool)

(assert (=> d!134849 (= lt!559374 (select (content!569 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!699141 () Bool)

(assert (=> d!134849 (= lt!559374 e!699141)))

(declare-fun res!820969 () Bool)

(assert (=> d!134849 (=> (not res!820969) (not e!699141))))

(assert (=> d!134849 (= res!820969 ((_ is Cons!27188) (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))

(assert (=> d!134849 (= (contains!7164 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559374)))

(declare-fun b!1232601 () Bool)

(declare-fun e!699142 () Bool)

(assert (=> b!1232601 (= e!699141 e!699142)))

(declare-fun res!820970 () Bool)

(assert (=> b!1232601 (=> res!820970 e!699142)))

(assert (=> b!1232601 (= res!820970 (= (h!28397 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232602 () Bool)

(assert (=> b!1232602 (= e!699142 (contains!7164 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)) (select (arr!38318 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134849 res!820969) b!1232601))

(assert (= (and b!1232601 (not res!820970)) b!1232602))

(declare-fun m!1136161 () Bool)

(assert (=> d!134849 m!1136161))

(assert (=> d!134849 m!1135989))

(declare-fun m!1136163 () Bool)

(assert (=> d!134849 m!1136163))

(assert (=> b!1232602 m!1135989))

(declare-fun m!1136165 () Bool)

(assert (=> b!1232602 m!1136165))

(assert (=> b!1232433 d!134849))

(declare-fun d!134851 () Bool)

(declare-fun res!820971 () Bool)

(declare-fun e!699143 () Bool)

(assert (=> d!134851 (=> res!820971 e!699143)))

(assert (=> d!134851 (= res!820971 ((_ is Nil!27189) (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))

(assert (=> d!134851 (= (noDuplicate!1807 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) e!699143)))

(declare-fun b!1232603 () Bool)

(declare-fun e!699144 () Bool)

(assert (=> b!1232603 (= e!699143 e!699144)))

(declare-fun res!820972 () Bool)

(assert (=> b!1232603 (=> (not res!820972) (not e!699144))))

(assert (=> b!1232603 (= res!820972 (not (contains!7164 (t!40646 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))) (h!28397 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189))))))))

(declare-fun b!1232604 () Bool)

(assert (=> b!1232604 (= e!699144 (noDuplicate!1807 (t!40646 (t!40646 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189)))))))

(assert (= (and d!134851 (not res!820971)) b!1232603))

(assert (= (and b!1232603 res!820972) b!1232604))

(declare-fun m!1136167 () Bool)

(assert (=> b!1232603 m!1136167))

(declare-fun m!1136169 () Bool)

(assert (=> b!1232604 m!1136169))

(assert (=> b!1232475 d!134851))

(assert (=> b!1232432 d!134827))

(declare-fun b!1232605 () Bool)

(declare-fun e!699146 () Bool)

(declare-fun call!60909 () Bool)

(assert (=> b!1232605 (= e!699146 call!60909)))

(declare-fun b!1232606 () Bool)

(assert (=> b!1232606 (= e!699146 call!60909)))

(declare-fun d!134853 () Bool)

(declare-fun res!820973 () Bool)

(declare-fun e!699145 () Bool)

(assert (=> d!134853 (=> res!820973 e!699145)))

(assert (=> d!134853 (= res!820973 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38856 a!3806)))))

(assert (=> d!134853 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120667 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) acc!823)) e!699145)))

(declare-fun bm!60906 () Bool)

(declare-fun c!120679 () Bool)

(assert (=> bm!60906 (= call!60909 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120679 (Cons!27188 (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120667 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) acc!823)) (ite c!120667 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1232607 () Bool)

(declare-fun e!699148 () Bool)

(assert (=> b!1232607 (= e!699145 e!699148)))

(declare-fun res!820975 () Bool)

(assert (=> b!1232607 (=> (not res!820975) (not e!699148))))

(declare-fun e!699147 () Bool)

(assert (=> b!1232607 (= res!820975 (not e!699147))))

(declare-fun res!820974 () Bool)

(assert (=> b!1232607 (=> (not res!820974) (not e!699147))))

(assert (=> b!1232607 (= res!820974 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232608 () Bool)

(assert (=> b!1232608 (= e!699148 e!699146)))

(assert (=> b!1232608 (= c!120679 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232609 () Bool)

(assert (=> b!1232609 (= e!699147 (contains!7164 (ite c!120667 (Cons!27188 (select (arr!38318 a!3806) from!3184) acc!823) acc!823) (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134853 (not res!820973)) b!1232607))

(assert (= (and b!1232607 res!820974) b!1232609))

(assert (= (and b!1232607 res!820975) b!1232608))

(assert (= (and b!1232608 c!120679) b!1232605))

(assert (= (and b!1232608 (not c!120679)) b!1232606))

(assert (= (or b!1232605 b!1232606) bm!60906))

(declare-fun m!1136171 () Bool)

(assert (=> bm!60906 m!1136171))

(declare-fun m!1136173 () Bool)

(assert (=> bm!60906 m!1136173))

(assert (=> b!1232607 m!1136171))

(assert (=> b!1232607 m!1136171))

(declare-fun m!1136175 () Bool)

(assert (=> b!1232607 m!1136175))

(assert (=> b!1232608 m!1136171))

(assert (=> b!1232608 m!1136171))

(assert (=> b!1232608 m!1136175))

(assert (=> b!1232609 m!1136171))

(assert (=> b!1232609 m!1136171))

(declare-fun m!1136177 () Bool)

(assert (=> b!1232609 m!1136177))

(assert (=> bm!60897 d!134853))

(declare-fun b!1232610 () Bool)

(declare-fun e!699150 () Bool)

(declare-fun call!60910 () Bool)

(assert (=> b!1232610 (= e!699150 call!60910)))

(declare-fun b!1232611 () Bool)

(assert (=> b!1232611 (= e!699150 call!60910)))

(declare-fun d!134855 () Bool)

(declare-fun res!820976 () Bool)

(declare-fun e!699149 () Bool)

(assert (=> d!134855 (=> res!820976 e!699149)))

(assert (=> d!134855 (= res!820976 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38856 a!3806)))))

(assert (=> d!134855 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120665 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) Nil!27189)) e!699149)))

(declare-fun c!120680 () Bool)

(declare-fun bm!60907 () Bool)

(assert (=> bm!60907 (= call!60910 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120680 (Cons!27188 (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120665 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) Nil!27189)) (ite c!120665 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) Nil!27189))))))

(declare-fun b!1232612 () Bool)

(declare-fun e!699152 () Bool)

(assert (=> b!1232612 (= e!699149 e!699152)))

(declare-fun res!820978 () Bool)

(assert (=> b!1232612 (=> (not res!820978) (not e!699152))))

(declare-fun e!699151 () Bool)

(assert (=> b!1232612 (= res!820978 (not e!699151))))

(declare-fun res!820977 () Bool)

(assert (=> b!1232612 (=> (not res!820977) (not e!699151))))

(assert (=> b!1232612 (= res!820977 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232613 () Bool)

(assert (=> b!1232613 (= e!699152 e!699150)))

(assert (=> b!1232613 (= c!120680 (validKeyInArray!0 (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232614 () Bool)

(assert (=> b!1232614 (= e!699151 (contains!7164 (ite c!120665 (Cons!27188 (select (arr!38318 a!3806) from!3184) Nil!27189) Nil!27189) (select (arr!38318 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134855 (not res!820976)) b!1232612))

(assert (= (and b!1232612 res!820977) b!1232614))

(assert (= (and b!1232612 res!820978) b!1232613))

(assert (= (and b!1232613 c!120680) b!1232610))

(assert (= (and b!1232613 (not c!120680)) b!1232611))

(assert (= (or b!1232610 b!1232611) bm!60907))

(assert (=> bm!60907 m!1136171))

(declare-fun m!1136179 () Bool)

(assert (=> bm!60907 m!1136179))

(assert (=> b!1232612 m!1136171))

(assert (=> b!1232612 m!1136171))

(assert (=> b!1232612 m!1136175))

(assert (=> b!1232613 m!1136171))

(assert (=> b!1232613 m!1136171))

(assert (=> b!1232613 m!1136175))

(assert (=> b!1232614 m!1136171))

(assert (=> b!1232614 m!1136171))

(declare-fun m!1136181 () Bool)

(assert (=> b!1232614 m!1136181))

(assert (=> bm!60895 d!134855))

(assert (=> b!1232481 d!134785))

(assert (=> d!134745 d!134823))

(assert (=> b!1232510 d!134785))

(assert (=> b!1232480 d!134785))

(declare-fun d!134857 () Bool)

(declare-fun lt!559375 () Bool)

(assert (=> d!134857 (= lt!559375 (select (content!569 (t!40646 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699153 () Bool)

(assert (=> d!134857 (= lt!559375 e!699153)))

(declare-fun res!820979 () Bool)

(assert (=> d!134857 (=> (not res!820979) (not e!699153))))

(assert (=> d!134857 (= res!820979 ((_ is Cons!27188) (t!40646 acc!823)))))

(assert (=> d!134857 (= (contains!7164 (t!40646 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559375)))

(declare-fun b!1232615 () Bool)

(declare-fun e!699154 () Bool)

(assert (=> b!1232615 (= e!699153 e!699154)))

(declare-fun res!820980 () Bool)

(assert (=> b!1232615 (=> res!820980 e!699154)))

(assert (=> b!1232615 (= res!820980 (= (h!28397 (t!40646 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232616 () Bool)

(assert (=> b!1232616 (= e!699154 (contains!7164 (t!40646 (t!40646 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134857 res!820979) b!1232615))

(assert (= (and b!1232615 (not res!820980)) b!1232616))

(assert (=> d!134857 m!1136111))

(declare-fun m!1136183 () Bool)

(assert (=> d!134857 m!1136183))

(declare-fun m!1136185 () Bool)

(assert (=> b!1232616 m!1136185))

(assert (=> b!1232477 d!134857))

(check-sat (not b!1232574) (not b!1232609) (not b!1232608) (not b!1232585) (not bm!60904) (not d!134833) (not b!1232593) (not b!1232575) (not d!134857) (not b!1232592) (not d!134839) (not b!1232589) (not b!1232613) (not b!1232580) (not d!134845) (not b!1232587) (not b!1232598) (not b!1232581) (not d!134843) (not b!1232612) (not b!1232602) (not d!134837) (not b!1232596) (not b!1232616) (not b!1232576) (not b!1232594) (not b!1232600) (not d!134829) (not b!1232614) (not bm!60907) (not d!134835) (not bm!60906) (not b!1232579) (not b!1232603) (not bm!60905) (not b!1232604) (not d!134849) (not b!1232583) (not b!1232607))
(check-sat)
