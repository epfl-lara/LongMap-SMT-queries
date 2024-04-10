; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102380 () Bool)

(assert start!102380)

(declare-fun b!1231746 () Bool)

(declare-fun res!820167 () Bool)

(declare-fun e!698700 () Bool)

(assert (=> b!1231746 (=> (not res!820167) (not e!698700))))

(declare-datatypes ((array!79450 0))(
  ( (array!79451 (arr!38340 (Array (_ BitVec 32) (_ BitVec 64))) (size!38876 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79450)

(declare-datatypes ((List!27113 0))(
  ( (Nil!27110) (Cons!27109 (h!28318 (_ BitVec 64)) (t!40576 List!27113)) )
))
(declare-fun acc!823 () List!27113)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79450 (_ BitVec 32) List!27113) Bool)

(assert (=> b!1231746 (= res!820167 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231747 () Bool)

(declare-fun res!820162 () Bool)

(assert (=> b!1231747 (=> (not res!820162) (not e!698700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231747 (= res!820162 (validKeyInArray!0 (select (arr!38340 a!3806) from!3184)))))

(declare-fun b!1231748 () Bool)

(declare-fun res!820166 () Bool)

(assert (=> b!1231748 (=> (not res!820166) (not e!698700))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1231748 (= res!820166 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231749 () Bool)

(declare-fun res!820168 () Bool)

(assert (=> b!1231749 (=> (not res!820168) (not e!698700))))

(assert (=> b!1231749 (= res!820168 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38876 a!3806)) (bvslt from!3184 (size!38876 a!3806))))))

(declare-fun res!820165 () Bool)

(assert (=> start!102380 (=> (not res!820165) (not e!698700))))

(assert (=> start!102380 (= res!820165 (bvslt (size!38876 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102380 e!698700))

(declare-fun array_inv!29188 (array!79450) Bool)

(assert (=> start!102380 (array_inv!29188 a!3806)))

(assert (=> start!102380 true))

(declare-fun b!1231750 () Bool)

(declare-fun res!820161 () Bool)

(assert (=> b!1231750 (=> (not res!820161) (not e!698700))))

(declare-fun arrayContainsKey!0 (array!79450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231750 (= res!820161 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231751 () Bool)

(declare-fun res!820164 () Bool)

(assert (=> b!1231751 (=> (not res!820164) (not e!698700))))

(declare-fun contains!7175 (List!27113 (_ BitVec 64)) Bool)

(assert (=> b!1231751 (= res!820164 (not (contains!7175 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231752 () Bool)

(declare-fun res!820160 () Bool)

(assert (=> b!1231752 (=> (not res!820160) (not e!698700))))

(declare-fun noDuplicate!1772 (List!27113) Bool)

(assert (=> b!1231752 (= res!820160 (noDuplicate!1772 acc!823))))

(declare-fun b!1231753 () Bool)

(assert (=> b!1231753 (= e!698700 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27109 (select (arr!38340 a!3806) from!3184) Nil!27110))))))

(assert (=> b!1231753 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27110)))

(declare-datatypes ((Unit!40786 0))(
  ( (Unit!40787) )
))
(declare-fun lt!559442 () Unit!40786)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79450 List!27113 List!27113 (_ BitVec 32)) Unit!40786)

(assert (=> b!1231753 (= lt!559442 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27110 from!3184))))

(assert (=> b!1231753 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27109 (select (arr!38340 a!3806) from!3184) acc!823))))

(declare-fun b!1231754 () Bool)

(declare-fun res!820163 () Bool)

(assert (=> b!1231754 (=> (not res!820163) (not e!698700))))

(assert (=> b!1231754 (= res!820163 (not (contains!7175 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102380 res!820165) b!1231748))

(assert (= (and b!1231748 res!820166) b!1231749))

(assert (= (and b!1231749 res!820168) b!1231752))

(assert (= (and b!1231752 res!820160) b!1231754))

(assert (= (and b!1231754 res!820163) b!1231751))

(assert (= (and b!1231751 res!820164) b!1231750))

(assert (= (and b!1231750 res!820161) b!1231746))

(assert (= (and b!1231746 res!820167) b!1231747))

(assert (= (and b!1231747 res!820162) b!1231753))

(declare-fun m!1135839 () Bool)

(assert (=> b!1231753 m!1135839))

(declare-fun m!1135841 () Bool)

(assert (=> b!1231753 m!1135841))

(declare-fun m!1135843 () Bool)

(assert (=> b!1231753 m!1135843))

(declare-fun m!1135845 () Bool)

(assert (=> b!1231753 m!1135845))

(declare-fun m!1135847 () Bool)

(assert (=> b!1231753 m!1135847))

(declare-fun m!1135849 () Bool)

(assert (=> b!1231746 m!1135849))

(declare-fun m!1135851 () Bool)

(assert (=> start!102380 m!1135851))

(declare-fun m!1135853 () Bool)

(assert (=> b!1231752 m!1135853))

(declare-fun m!1135855 () Bool)

(assert (=> b!1231748 m!1135855))

(declare-fun m!1135857 () Bool)

(assert (=> b!1231754 m!1135857))

(assert (=> b!1231747 m!1135843))

(assert (=> b!1231747 m!1135843))

(declare-fun m!1135859 () Bool)

(assert (=> b!1231747 m!1135859))

(declare-fun m!1135861 () Bool)

(assert (=> b!1231751 m!1135861))

(declare-fun m!1135863 () Bool)

(assert (=> b!1231750 m!1135863))

(check-sat (not b!1231754) (not b!1231747) (not b!1231748) (not b!1231753) (not b!1231751) (not b!1231750) (not b!1231746) (not b!1231752) (not start!102380))
(check-sat)
(get-model)

(declare-fun d!134777 () Bool)

(declare-fun res!820200 () Bool)

(declare-fun e!698711 () Bool)

(assert (=> d!134777 (=> res!820200 e!698711)))

(assert (=> d!134777 (= res!820200 (= (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134777 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698711)))

(declare-fun b!1231786 () Bool)

(declare-fun e!698712 () Bool)

(assert (=> b!1231786 (= e!698711 e!698712)))

(declare-fun res!820201 () Bool)

(assert (=> b!1231786 (=> (not res!820201) (not e!698712))))

(assert (=> b!1231786 (= res!820201 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38876 a!3806)))))

(declare-fun b!1231787 () Bool)

(assert (=> b!1231787 (= e!698712 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134777 (not res!820200)) b!1231786))

(assert (= (and b!1231786 res!820201) b!1231787))

(declare-fun m!1135891 () Bool)

(assert (=> d!134777 m!1135891))

(declare-fun m!1135893 () Bool)

(assert (=> b!1231787 m!1135893))

(assert (=> b!1231750 d!134777))

(declare-fun d!134779 () Bool)

(declare-fun lt!559448 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!566 (List!27113) (InoxSet (_ BitVec 64)))

(assert (=> d!134779 (= lt!559448 (select (content!566 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698717 () Bool)

(assert (=> d!134779 (= lt!559448 e!698717)))

(declare-fun res!820206 () Bool)

(assert (=> d!134779 (=> (not res!820206) (not e!698717))))

(get-info :version)

(assert (=> d!134779 (= res!820206 ((_ is Cons!27109) acc!823))))

(assert (=> d!134779 (= (contains!7175 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559448)))

(declare-fun b!1231792 () Bool)

(declare-fun e!698718 () Bool)

(assert (=> b!1231792 (= e!698717 e!698718)))

(declare-fun res!820207 () Bool)

(assert (=> b!1231792 (=> res!820207 e!698718)))

(assert (=> b!1231792 (= res!820207 (= (h!28318 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231793 () Bool)

(assert (=> b!1231793 (= e!698718 (contains!7175 (t!40576 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134779 res!820206) b!1231792))

(assert (= (and b!1231792 (not res!820207)) b!1231793))

(declare-fun m!1135895 () Bool)

(assert (=> d!134779 m!1135895))

(declare-fun m!1135897 () Bool)

(assert (=> d!134779 m!1135897))

(declare-fun m!1135899 () Bool)

(assert (=> b!1231793 m!1135899))

(assert (=> b!1231754 d!134779))

(declare-fun d!134785 () Bool)

(assert (=> d!134785 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231748 d!134785))

(declare-fun b!1231836 () Bool)

(declare-fun e!698758 () Bool)

(assert (=> b!1231836 (= e!698758 (contains!7175 (Cons!27109 (select (arr!38340 a!3806) from!3184) Nil!27110) (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231837 () Bool)

(declare-fun e!698757 () Bool)

(declare-fun e!698756 () Bool)

(assert (=> b!1231837 (= e!698757 e!698756)))

(declare-fun c!120659 () Bool)

(assert (=> b!1231837 (= c!120659 (validKeyInArray!0 (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231838 () Bool)

(declare-fun e!698755 () Bool)

(assert (=> b!1231838 (= e!698755 e!698757)))

(declare-fun res!820238 () Bool)

(assert (=> b!1231838 (=> (not res!820238) (not e!698757))))

(assert (=> b!1231838 (= res!820238 (not e!698758))))

(declare-fun res!820239 () Bool)

(assert (=> b!1231838 (=> (not res!820239) (not e!698758))))

(assert (=> b!1231838 (= res!820239 (validKeyInArray!0 (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134787 () Bool)

(declare-fun res!820240 () Bool)

(assert (=> d!134787 (=> res!820240 e!698755)))

(assert (=> d!134787 (= res!820240 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38876 a!3806)))))

(assert (=> d!134787 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27109 (select (arr!38340 a!3806) from!3184) Nil!27110)) e!698755)))

(declare-fun b!1231839 () Bool)

(declare-fun call!60896 () Bool)

(assert (=> b!1231839 (= e!698756 call!60896)))

(declare-fun b!1231840 () Bool)

(assert (=> b!1231840 (= e!698756 call!60896)))

(declare-fun bm!60893 () Bool)

(assert (=> bm!60893 (= call!60896 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120659 (Cons!27109 (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27109 (select (arr!38340 a!3806) from!3184) Nil!27110)) (Cons!27109 (select (arr!38340 a!3806) from!3184) Nil!27110))))))

(assert (= (and d!134787 (not res!820240)) b!1231838))

(assert (= (and b!1231838 res!820239) b!1231836))

(assert (= (and b!1231838 res!820238) b!1231837))

(assert (= (and b!1231837 c!120659) b!1231840))

(assert (= (and b!1231837 (not c!120659)) b!1231839))

(assert (= (or b!1231840 b!1231839) bm!60893))

(assert (=> b!1231836 m!1135891))

(assert (=> b!1231836 m!1135891))

(declare-fun m!1135923 () Bool)

(assert (=> b!1231836 m!1135923))

(assert (=> b!1231837 m!1135891))

(assert (=> b!1231837 m!1135891))

(declare-fun m!1135925 () Bool)

(assert (=> b!1231837 m!1135925))

(assert (=> b!1231838 m!1135891))

(assert (=> b!1231838 m!1135891))

(assert (=> b!1231838 m!1135925))

(assert (=> bm!60893 m!1135891))

(declare-fun m!1135927 () Bool)

(assert (=> bm!60893 m!1135927))

(assert (=> b!1231753 d!134787))

(declare-fun b!1231846 () Bool)

(declare-fun e!698766 () Bool)

(assert (=> b!1231846 (= e!698766 (contains!7175 Nil!27110 (select (arr!38340 a!3806) from!3184)))))

(declare-fun b!1231847 () Bool)

(declare-fun e!698765 () Bool)

(declare-fun e!698764 () Bool)

(assert (=> b!1231847 (= e!698765 e!698764)))

(declare-fun c!120661 () Bool)

(assert (=> b!1231847 (= c!120661 (validKeyInArray!0 (select (arr!38340 a!3806) from!3184)))))

(declare-fun b!1231848 () Bool)

(declare-fun e!698763 () Bool)

(assert (=> b!1231848 (= e!698763 e!698765)))

(declare-fun res!820244 () Bool)

(assert (=> b!1231848 (=> (not res!820244) (not e!698765))))

(assert (=> b!1231848 (= res!820244 (not e!698766))))

(declare-fun res!820245 () Bool)

(assert (=> b!1231848 (=> (not res!820245) (not e!698766))))

(assert (=> b!1231848 (= res!820245 (validKeyInArray!0 (select (arr!38340 a!3806) from!3184)))))

(declare-fun d!134803 () Bool)

(declare-fun res!820246 () Bool)

(assert (=> d!134803 (=> res!820246 e!698763)))

(assert (=> d!134803 (= res!820246 (bvsge from!3184 (size!38876 a!3806)))))

(assert (=> d!134803 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27110) e!698763)))

(declare-fun b!1231849 () Bool)

(declare-fun call!60898 () Bool)

(assert (=> b!1231849 (= e!698764 call!60898)))

(declare-fun b!1231850 () Bool)

(assert (=> b!1231850 (= e!698764 call!60898)))

(declare-fun bm!60895 () Bool)

(assert (=> bm!60895 (= call!60898 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120661 (Cons!27109 (select (arr!38340 a!3806) from!3184) Nil!27110) Nil!27110)))))

(assert (= (and d!134803 (not res!820246)) b!1231848))

(assert (= (and b!1231848 res!820245) b!1231846))

(assert (= (and b!1231848 res!820244) b!1231847))

(assert (= (and b!1231847 c!120661) b!1231850))

(assert (= (and b!1231847 (not c!120661)) b!1231849))

(assert (= (or b!1231850 b!1231849) bm!60895))

(assert (=> b!1231846 m!1135843))

(assert (=> b!1231846 m!1135843))

(declare-fun m!1135933 () Bool)

(assert (=> b!1231846 m!1135933))

(assert (=> b!1231847 m!1135843))

(assert (=> b!1231847 m!1135843))

(assert (=> b!1231847 m!1135859))

(assert (=> b!1231848 m!1135843))

(assert (=> b!1231848 m!1135843))

(assert (=> b!1231848 m!1135859))

(assert (=> bm!60895 m!1135843))

(declare-fun m!1135935 () Bool)

(assert (=> bm!60895 m!1135935))

(assert (=> b!1231753 d!134803))

(declare-fun d!134807 () Bool)

(assert (=> d!134807 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27110)))

(declare-fun lt!559457 () Unit!40786)

(declare-fun choose!80 (array!79450 List!27113 List!27113 (_ BitVec 32)) Unit!40786)

(assert (=> d!134807 (= lt!559457 (choose!80 a!3806 acc!823 Nil!27110 from!3184))))

(assert (=> d!134807 (bvslt (size!38876 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134807 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27110 from!3184) lt!559457)))

(declare-fun bs!34617 () Bool)

(assert (= bs!34617 d!134807))

(assert (=> bs!34617 m!1135841))

(declare-fun m!1135939 () Bool)

(assert (=> bs!34617 m!1135939))

(assert (=> b!1231753 d!134807))

(declare-fun e!698786 () Bool)

(declare-fun b!1231871 () Bool)

(assert (=> b!1231871 (= e!698786 (contains!7175 (Cons!27109 (select (arr!38340 a!3806) from!3184) acc!823) (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231872 () Bool)

(declare-fun e!698785 () Bool)

(declare-fun e!698784 () Bool)

(assert (=> b!1231872 (= e!698785 e!698784)))

(declare-fun c!120666 () Bool)

(assert (=> b!1231872 (= c!120666 (validKeyInArray!0 (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231873 () Bool)

(declare-fun e!698783 () Bool)

(assert (=> b!1231873 (= e!698783 e!698785)))

(declare-fun res!820259 () Bool)

(assert (=> b!1231873 (=> (not res!820259) (not e!698785))))

(assert (=> b!1231873 (= res!820259 (not e!698786))))

(declare-fun res!820260 () Bool)

(assert (=> b!1231873 (=> (not res!820260) (not e!698786))))

(assert (=> b!1231873 (= res!820260 (validKeyInArray!0 (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134811 () Bool)

(declare-fun res!820261 () Bool)

(assert (=> d!134811 (=> res!820261 e!698783)))

(assert (=> d!134811 (= res!820261 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38876 a!3806)))))

(assert (=> d!134811 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27109 (select (arr!38340 a!3806) from!3184) acc!823)) e!698783)))

(declare-fun b!1231874 () Bool)

(declare-fun call!60903 () Bool)

(assert (=> b!1231874 (= e!698784 call!60903)))

(declare-fun b!1231875 () Bool)

(assert (=> b!1231875 (= e!698784 call!60903)))

(declare-fun bm!60900 () Bool)

(assert (=> bm!60900 (= call!60903 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120666 (Cons!27109 (select (arr!38340 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27109 (select (arr!38340 a!3806) from!3184) acc!823)) (Cons!27109 (select (arr!38340 a!3806) from!3184) acc!823))))))

(assert (= (and d!134811 (not res!820261)) b!1231873))

(assert (= (and b!1231873 res!820260) b!1231871))

(assert (= (and b!1231873 res!820259) b!1231872))

(assert (= (and b!1231872 c!120666) b!1231875))

(assert (= (and b!1231872 (not c!120666)) b!1231874))

(assert (= (or b!1231875 b!1231874) bm!60900))

(assert (=> b!1231871 m!1135891))

(assert (=> b!1231871 m!1135891))

(declare-fun m!1135951 () Bool)

(assert (=> b!1231871 m!1135951))

(assert (=> b!1231872 m!1135891))

(assert (=> b!1231872 m!1135891))

(assert (=> b!1231872 m!1135925))

(assert (=> b!1231873 m!1135891))

(assert (=> b!1231873 m!1135891))

(assert (=> b!1231873 m!1135925))

(assert (=> bm!60900 m!1135891))

(declare-fun m!1135953 () Bool)

(assert (=> bm!60900 m!1135953))

(assert (=> b!1231753 d!134811))

(declare-fun d!134817 () Bool)

(assert (=> d!134817 (= (validKeyInArray!0 (select (arr!38340 a!3806) from!3184)) (and (not (= (select (arr!38340 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38340 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231747 d!134817))

(declare-fun d!134819 () Bool)

(declare-fun res!820275 () Bool)

(declare-fun e!698801 () Bool)

(assert (=> d!134819 (=> res!820275 e!698801)))

(assert (=> d!134819 (= res!820275 ((_ is Nil!27110) acc!823))))

(assert (=> d!134819 (= (noDuplicate!1772 acc!823) e!698801)))

(declare-fun b!1231891 () Bool)

(declare-fun e!698802 () Bool)

(assert (=> b!1231891 (= e!698801 e!698802)))

(declare-fun res!820276 () Bool)

(assert (=> b!1231891 (=> (not res!820276) (not e!698802))))

(assert (=> b!1231891 (= res!820276 (not (contains!7175 (t!40576 acc!823) (h!28318 acc!823))))))

(declare-fun b!1231892 () Bool)

(assert (=> b!1231892 (= e!698802 (noDuplicate!1772 (t!40576 acc!823)))))

(assert (= (and d!134819 (not res!820275)) b!1231891))

(assert (= (and b!1231891 res!820276) b!1231892))

(declare-fun m!1135963 () Bool)

(assert (=> b!1231891 m!1135963))

(declare-fun m!1135965 () Bool)

(assert (=> b!1231892 m!1135965))

(assert (=> b!1231752 d!134819))

(declare-fun d!134825 () Bool)

(assert (=> d!134825 (= (array_inv!29188 a!3806) (bvsge (size!38876 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102380 d!134825))

(declare-fun b!1231893 () Bool)

(declare-fun e!698806 () Bool)

(assert (=> b!1231893 (= e!698806 (contains!7175 acc!823 (select (arr!38340 a!3806) from!3184)))))

(declare-fun b!1231894 () Bool)

(declare-fun e!698805 () Bool)

(declare-fun e!698804 () Bool)

(assert (=> b!1231894 (= e!698805 e!698804)))

(declare-fun c!120668 () Bool)

(assert (=> b!1231894 (= c!120668 (validKeyInArray!0 (select (arr!38340 a!3806) from!3184)))))

(declare-fun b!1231895 () Bool)

(declare-fun e!698803 () Bool)

(assert (=> b!1231895 (= e!698803 e!698805)))

(declare-fun res!820277 () Bool)

(assert (=> b!1231895 (=> (not res!820277) (not e!698805))))

(assert (=> b!1231895 (= res!820277 (not e!698806))))

(declare-fun res!820278 () Bool)

(assert (=> b!1231895 (=> (not res!820278) (not e!698806))))

(assert (=> b!1231895 (= res!820278 (validKeyInArray!0 (select (arr!38340 a!3806) from!3184)))))

(declare-fun d!134827 () Bool)

(declare-fun res!820279 () Bool)

(assert (=> d!134827 (=> res!820279 e!698803)))

(assert (=> d!134827 (= res!820279 (bvsge from!3184 (size!38876 a!3806)))))

(assert (=> d!134827 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698803)))

(declare-fun b!1231896 () Bool)

(declare-fun call!60905 () Bool)

(assert (=> b!1231896 (= e!698804 call!60905)))

(declare-fun b!1231897 () Bool)

(assert (=> b!1231897 (= e!698804 call!60905)))

(declare-fun bm!60902 () Bool)

(assert (=> bm!60902 (= call!60905 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120668 (Cons!27109 (select (arr!38340 a!3806) from!3184) acc!823) acc!823)))))

(assert (= (and d!134827 (not res!820279)) b!1231895))

(assert (= (and b!1231895 res!820278) b!1231893))

(assert (= (and b!1231895 res!820277) b!1231894))

(assert (= (and b!1231894 c!120668) b!1231897))

(assert (= (and b!1231894 (not c!120668)) b!1231896))

(assert (= (or b!1231897 b!1231896) bm!60902))

(assert (=> b!1231893 m!1135843))

(assert (=> b!1231893 m!1135843))

(declare-fun m!1135969 () Bool)

(assert (=> b!1231893 m!1135969))

(assert (=> b!1231894 m!1135843))

(assert (=> b!1231894 m!1135843))

(assert (=> b!1231894 m!1135859))

(assert (=> b!1231895 m!1135843))

(assert (=> b!1231895 m!1135843))

(assert (=> b!1231895 m!1135859))

(assert (=> bm!60902 m!1135843))

(declare-fun m!1135973 () Bool)

(assert (=> bm!60902 m!1135973))

(assert (=> b!1231746 d!134827))

(declare-fun d!134831 () Bool)

(declare-fun lt!559463 () Bool)

(assert (=> d!134831 (= lt!559463 (select (content!566 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698815 () Bool)

(assert (=> d!134831 (= lt!559463 e!698815)))

(declare-fun res!820287 () Bool)

(assert (=> d!134831 (=> (not res!820287) (not e!698815))))

(assert (=> d!134831 (= res!820287 ((_ is Cons!27109) acc!823))))

(assert (=> d!134831 (= (contains!7175 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559463)))

(declare-fun b!1231907 () Bool)

(declare-fun e!698816 () Bool)

(assert (=> b!1231907 (= e!698815 e!698816)))

(declare-fun res!820288 () Bool)

(assert (=> b!1231907 (=> res!820288 e!698816)))

(assert (=> b!1231907 (= res!820288 (= (h!28318 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231908 () Bool)

(assert (=> b!1231908 (= e!698816 (contains!7175 (t!40576 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134831 res!820287) b!1231907))

(assert (= (and b!1231907 (not res!820288)) b!1231908))

(assert (=> d!134831 m!1135895))

(declare-fun m!1135977 () Bool)

(assert (=> d!134831 m!1135977))

(declare-fun m!1135979 () Bool)

(assert (=> b!1231908 m!1135979))

(assert (=> b!1231751 d!134831))

(check-sat (not b!1231787) (not bm!60902) (not bm!60893) (not d!134779) (not b!1231895) (not bm!60895) (not bm!60900) (not b!1231793) (not b!1231838) (not b!1231846) (not b!1231837) (not d!134807) (not b!1231872) (not b!1231891) (not b!1231836) (not d!134831) (not b!1231894) (not b!1231908) (not b!1231873) (not b!1231893) (not b!1231848) (not b!1231847) (not b!1231892) (not b!1231871))
(check-sat)
