; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102696 () Bool)

(assert start!102696)

(declare-fun b!1233732 () Bool)

(declare-fun res!821319 () Bool)

(declare-fun e!699850 () Bool)

(assert (=> b!1233732 (=> (not res!821319) (not e!699850))))

(declare-datatypes ((array!79523 0))(
  ( (array!79524 (arr!38369 (Array (_ BitVec 32) (_ BitVec 64))) (size!38906 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79523)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233732 (= res!821319 (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)))))

(declare-fun b!1233733 () Bool)

(declare-fun e!699851 () Bool)

(declare-datatypes ((List!27155 0))(
  ( (Nil!27152) (Cons!27151 (h!28369 (_ BitVec 64)) (t!40610 List!27155)) )
))
(declare-fun arrayNoDuplicates!0 (array!79523 (_ BitVec 32) List!27155) Bool)

(assert (=> b!1233733 (= e!699851 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))

(declare-fun b!1233734 () Bool)

(declare-fun res!821327 () Bool)

(assert (=> b!1233734 (=> (not res!821327) (not e!699850))))

(assert (=> b!1233734 (= res!821327 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38906 a!3806)) (bvslt from!3184 (size!38906 a!3806))))))

(declare-fun b!1233735 () Bool)

(declare-fun e!699849 () Bool)

(assert (=> b!1233735 (= e!699850 (not e!699849))))

(declare-fun res!821320 () Bool)

(assert (=> b!1233735 (=> res!821320 e!699849)))

(assert (=> b!1233735 (= res!821320 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1233735 e!699851))

(declare-fun res!821317 () Bool)

(assert (=> b!1233735 (=> (not res!821317) (not e!699851))))

(assert (=> b!1233735 (= res!821317 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27152))))

(declare-datatypes ((Unit!40793 0))(
  ( (Unit!40794) )
))
(declare-fun lt!560001 () Unit!40793)

(declare-fun acc!823 () List!27155)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79523 List!27155 List!27155 (_ BitVec 32)) Unit!40793)

(assert (=> b!1233735 (= lt!560001 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27152 from!3184))))

(assert (=> b!1233735 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823))))

(declare-fun res!821323 () Bool)

(assert (=> start!102696 (=> (not res!821323) (not e!699850))))

(assert (=> start!102696 (= res!821323 (bvslt (size!38906 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102696 e!699850))

(declare-fun array_inv!29307 (array!79523) Bool)

(assert (=> start!102696 (array_inv!29307 a!3806)))

(assert (=> start!102696 true))

(declare-fun b!1233736 () Bool)

(declare-fun res!821326 () Bool)

(assert (=> b!1233736 (=> (not res!821326) (not e!699850))))

(declare-fun contains!7226 (List!27155 (_ BitVec 64)) Bool)

(assert (=> b!1233736 (= res!821326 (not (contains!7226 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233737 () Bool)

(declare-fun res!821318 () Bool)

(assert (=> b!1233737 (=> (not res!821318) (not e!699850))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1233737 (= res!821318 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233738 () Bool)

(declare-fun res!821322 () Bool)

(assert (=> b!1233738 (=> (not res!821322) (not e!699850))))

(declare-fun noDuplicate!1807 (List!27155) Bool)

(assert (=> b!1233738 (= res!821322 (noDuplicate!1807 acc!823))))

(declare-fun b!1233739 () Bool)

(declare-fun res!821321 () Bool)

(assert (=> b!1233739 (=> (not res!821321) (not e!699850))))

(assert (=> b!1233739 (= res!821321 (not (contains!7226 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233740 () Bool)

(assert (=> b!1233740 (= e!699849 (noDuplicate!1807 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))

(declare-fun b!1233741 () Bool)

(declare-fun res!821325 () Bool)

(assert (=> b!1233741 (=> (not res!821325) (not e!699850))))

(declare-fun arrayContainsKey!0 (array!79523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233741 (= res!821325 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233742 () Bool)

(declare-fun res!821324 () Bool)

(assert (=> b!1233742 (=> (not res!821324) (not e!699850))))

(assert (=> b!1233742 (= res!821324 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102696 res!821323) b!1233737))

(assert (= (and b!1233737 res!821318) b!1233734))

(assert (= (and b!1233734 res!821327) b!1233738))

(assert (= (and b!1233738 res!821322) b!1233739))

(assert (= (and b!1233739 res!821321) b!1233736))

(assert (= (and b!1233736 res!821326) b!1233741))

(assert (= (and b!1233741 res!821325) b!1233742))

(assert (= (and b!1233742 res!821324) b!1233732))

(assert (= (and b!1233732 res!821319) b!1233735))

(assert (= (and b!1233735 res!821317) b!1233733))

(assert (= (and b!1233735 (not res!821320)) b!1233740))

(declare-fun m!1138053 () Bool)

(assert (=> b!1233741 m!1138053))

(declare-fun m!1138055 () Bool)

(assert (=> b!1233742 m!1138055))

(declare-fun m!1138057 () Bool)

(assert (=> b!1233735 m!1138057))

(declare-fun m!1138059 () Bool)

(assert (=> b!1233735 m!1138059))

(declare-fun m!1138061 () Bool)

(assert (=> b!1233735 m!1138061))

(declare-fun m!1138063 () Bool)

(assert (=> b!1233735 m!1138063))

(assert (=> b!1233732 m!1138061))

(assert (=> b!1233732 m!1138061))

(declare-fun m!1138065 () Bool)

(assert (=> b!1233732 m!1138065))

(declare-fun m!1138067 () Bool)

(assert (=> b!1233736 m!1138067))

(declare-fun m!1138069 () Bool)

(assert (=> b!1233737 m!1138069))

(declare-fun m!1138071 () Bool)

(assert (=> b!1233739 m!1138071))

(assert (=> b!1233740 m!1138061))

(declare-fun m!1138073 () Bool)

(assert (=> b!1233740 m!1138073))

(declare-fun m!1138075 () Bool)

(assert (=> b!1233738 m!1138075))

(assert (=> b!1233733 m!1138061))

(declare-fun m!1138077 () Bool)

(assert (=> b!1233733 m!1138077))

(declare-fun m!1138079 () Bool)

(assert (=> start!102696 m!1138079))

(check-sat (not b!1233741) (not b!1233742) (not b!1233733) (not start!102696) (not b!1233735) (not b!1233736) (not b!1233737) (not b!1233740) (not b!1233738) (not b!1233739) (not b!1233732))
(check-sat)
(get-model)

(declare-fun d!135333 () Bool)

(assert (=> d!135333 (= (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)) (and (not (= (select (arr!38369 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38369 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233732 d!135333))

(declare-fun b!1233819 () Bool)

(declare-fun e!699884 () Bool)

(declare-fun e!699887 () Bool)

(assert (=> b!1233819 (= e!699884 e!699887)))

(declare-fun c!121077 () Bool)

(assert (=> b!1233819 (= c!121077 (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)))))

(declare-fun e!699885 () Bool)

(declare-fun b!1233820 () Bool)

(assert (=> b!1233820 (= e!699885 (contains!7226 acc!823 (select (arr!38369 a!3806) from!3184)))))

(declare-fun b!1233821 () Bool)

(declare-fun call!60978 () Bool)

(assert (=> b!1233821 (= e!699887 call!60978)))

(declare-fun bm!60975 () Bool)

(assert (=> bm!60975 (= call!60978 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121077 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1233822 () Bool)

(assert (=> b!1233822 (= e!699887 call!60978)))

(declare-fun d!135335 () Bool)

(declare-fun res!821400 () Bool)

(declare-fun e!699886 () Bool)

(assert (=> d!135335 (=> res!821400 e!699886)))

(assert (=> d!135335 (= res!821400 (bvsge from!3184 (size!38906 a!3806)))))

(assert (=> d!135335 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699886)))

(declare-fun b!1233823 () Bool)

(assert (=> b!1233823 (= e!699886 e!699884)))

(declare-fun res!821402 () Bool)

(assert (=> b!1233823 (=> (not res!821402) (not e!699884))))

(assert (=> b!1233823 (= res!821402 (not e!699885))))

(declare-fun res!821401 () Bool)

(assert (=> b!1233823 (=> (not res!821401) (not e!699885))))

(assert (=> b!1233823 (= res!821401 (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)))))

(assert (= (and d!135335 (not res!821400)) b!1233823))

(assert (= (and b!1233823 res!821401) b!1233820))

(assert (= (and b!1233823 res!821402) b!1233819))

(assert (= (and b!1233819 c!121077) b!1233822))

(assert (= (and b!1233819 (not c!121077)) b!1233821))

(assert (= (or b!1233822 b!1233821) bm!60975))

(assert (=> b!1233819 m!1138061))

(assert (=> b!1233819 m!1138061))

(assert (=> b!1233819 m!1138065))

(assert (=> b!1233820 m!1138061))

(assert (=> b!1233820 m!1138061))

(declare-fun m!1138137 () Bool)

(assert (=> b!1233820 m!1138137))

(assert (=> bm!60975 m!1138061))

(declare-fun m!1138139 () Bool)

(assert (=> bm!60975 m!1138139))

(assert (=> b!1233823 m!1138061))

(assert (=> b!1233823 m!1138061))

(assert (=> b!1233823 m!1138065))

(assert (=> b!1233742 d!135335))

(declare-fun d!135339 () Bool)

(assert (=> d!135339 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233737 d!135339))

(declare-fun d!135341 () Bool)

(declare-fun lt!560010 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!570 (List!27155) (InoxSet (_ BitVec 64)))

(assert (=> d!135341 (= lt!560010 (select (content!570 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699898 () Bool)

(assert (=> d!135341 (= lt!560010 e!699898)))

(declare-fun res!821413 () Bool)

(assert (=> d!135341 (=> (not res!821413) (not e!699898))))

(get-info :version)

(assert (=> d!135341 (= res!821413 ((_ is Cons!27151) acc!823))))

(assert (=> d!135341 (= (contains!7226 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560010)))

(declare-fun b!1233834 () Bool)

(declare-fun e!699899 () Bool)

(assert (=> b!1233834 (= e!699898 e!699899)))

(declare-fun res!821414 () Bool)

(assert (=> b!1233834 (=> res!821414 e!699899)))

(assert (=> b!1233834 (= res!821414 (= (h!28369 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233835 () Bool)

(assert (=> b!1233835 (= e!699899 (contains!7226 (t!40610 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135341 res!821413) b!1233834))

(assert (= (and b!1233834 (not res!821414)) b!1233835))

(declare-fun m!1138145 () Bool)

(assert (=> d!135341 m!1138145))

(declare-fun m!1138147 () Bool)

(assert (=> d!135341 m!1138147))

(declare-fun m!1138149 () Bool)

(assert (=> b!1233835 m!1138149))

(assert (=> b!1233736 d!135341))

(declare-fun d!135345 () Bool)

(declare-fun res!821425 () Bool)

(declare-fun e!699912 () Bool)

(assert (=> d!135345 (=> res!821425 e!699912)))

(assert (=> d!135345 (= res!821425 (= (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135345 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699912)))

(declare-fun b!1233850 () Bool)

(declare-fun e!699913 () Bool)

(assert (=> b!1233850 (= e!699912 e!699913)))

(declare-fun res!821426 () Bool)

(assert (=> b!1233850 (=> (not res!821426) (not e!699913))))

(assert (=> b!1233850 (= res!821426 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38906 a!3806)))))

(declare-fun b!1233851 () Bool)

(assert (=> b!1233851 (= e!699913 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135345 (not res!821425)) b!1233850))

(assert (= (and b!1233850 res!821426) b!1233851))

(declare-fun m!1138151 () Bool)

(assert (=> d!135345 m!1138151))

(declare-fun m!1138153 () Bool)

(assert (=> b!1233851 m!1138153))

(assert (=> b!1233741 d!135345))

(declare-fun d!135347 () Bool)

(assert (=> d!135347 (= (array_inv!29307 a!3806) (bvsge (size!38906 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102696 d!135347))

(declare-fun d!135349 () Bool)

(declare-fun res!821434 () Bool)

(declare-fun e!699922 () Bool)

(assert (=> d!135349 (=> res!821434 e!699922)))

(assert (=> d!135349 (= res!821434 ((_ is Nil!27152) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))

(assert (=> d!135349 (= (noDuplicate!1807 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) e!699922)))

(declare-fun b!1233861 () Bool)

(declare-fun e!699923 () Bool)

(assert (=> b!1233861 (= e!699922 e!699923)))

(declare-fun res!821435 () Bool)

(assert (=> b!1233861 (=> (not res!821435) (not e!699923))))

(assert (=> b!1233861 (= res!821435 (not (contains!7226 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))))

(declare-fun b!1233862 () Bool)

(assert (=> b!1233862 (= e!699923 (noDuplicate!1807 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(assert (= (and d!135349 (not res!821434)) b!1233861))

(assert (= (and b!1233861 res!821435) b!1233862))

(declare-fun m!1138159 () Bool)

(assert (=> b!1233861 m!1138159))

(declare-fun m!1138163 () Bool)

(assert (=> b!1233862 m!1138163))

(assert (=> b!1233740 d!135349))

(declare-fun b!1233863 () Bool)

(declare-fun e!699924 () Bool)

(declare-fun e!699927 () Bool)

(assert (=> b!1233863 (= e!699924 e!699927)))

(declare-fun c!121081 () Bool)

(assert (=> b!1233863 (= c!121081 (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)))))

(declare-fun b!1233864 () Bool)

(declare-fun e!699925 () Bool)

(assert (=> b!1233864 (= e!699925 (contains!7226 Nil!27152 (select (arr!38369 a!3806) from!3184)))))

(declare-fun b!1233865 () Bool)

(declare-fun call!60982 () Bool)

(assert (=> b!1233865 (= e!699927 call!60982)))

(declare-fun bm!60979 () Bool)

(assert (=> bm!60979 (= call!60982 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121081 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) Nil!27152)))))

(declare-fun b!1233866 () Bool)

(assert (=> b!1233866 (= e!699927 call!60982)))

(declare-fun d!135351 () Bool)

(declare-fun res!821436 () Bool)

(declare-fun e!699926 () Bool)

(assert (=> d!135351 (=> res!821436 e!699926)))

(assert (=> d!135351 (= res!821436 (bvsge from!3184 (size!38906 a!3806)))))

(assert (=> d!135351 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27152) e!699926)))

(declare-fun b!1233867 () Bool)

(assert (=> b!1233867 (= e!699926 e!699924)))

(declare-fun res!821438 () Bool)

(assert (=> b!1233867 (=> (not res!821438) (not e!699924))))

(assert (=> b!1233867 (= res!821438 (not e!699925))))

(declare-fun res!821437 () Bool)

(assert (=> b!1233867 (=> (not res!821437) (not e!699925))))

(assert (=> b!1233867 (= res!821437 (validKeyInArray!0 (select (arr!38369 a!3806) from!3184)))))

(assert (= (and d!135351 (not res!821436)) b!1233867))

(assert (= (and b!1233867 res!821437) b!1233864))

(assert (= (and b!1233867 res!821438) b!1233863))

(assert (= (and b!1233863 c!121081) b!1233866))

(assert (= (and b!1233863 (not c!121081)) b!1233865))

(assert (= (or b!1233866 b!1233865) bm!60979))

(assert (=> b!1233863 m!1138061))

(assert (=> b!1233863 m!1138061))

(assert (=> b!1233863 m!1138065))

(assert (=> b!1233864 m!1138061))

(assert (=> b!1233864 m!1138061))

(declare-fun m!1138165 () Bool)

(assert (=> b!1233864 m!1138165))

(assert (=> bm!60979 m!1138061))

(declare-fun m!1138167 () Bool)

(assert (=> bm!60979 m!1138167))

(assert (=> b!1233867 m!1138061))

(assert (=> b!1233867 m!1138061))

(assert (=> b!1233867 m!1138065))

(assert (=> b!1233735 d!135351))

(declare-fun d!135357 () Bool)

(assert (=> d!135357 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27152)))

(declare-fun lt!560013 () Unit!40793)

(declare-fun choose!80 (array!79523 List!27155 List!27155 (_ BitVec 32)) Unit!40793)

(assert (=> d!135357 (= lt!560013 (choose!80 a!3806 acc!823 Nil!27152 from!3184))))

(assert (=> d!135357 (bvslt (size!38906 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135357 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27152 from!3184) lt!560013)))

(declare-fun bs!34656 () Bool)

(assert (= bs!34656 d!135357))

(assert (=> bs!34656 m!1138057))

(declare-fun m!1138173 () Bool)

(assert (=> bs!34656 m!1138173))

(assert (=> b!1233735 d!135357))

(declare-fun b!1233874 () Bool)

(declare-fun e!699934 () Bool)

(declare-fun e!699937 () Bool)

(assert (=> b!1233874 (= e!699934 e!699937)))

(declare-fun c!121082 () Bool)

(assert (=> b!1233874 (= c!121082 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233875 () Bool)

(declare-fun e!699935 () Bool)

(assert (=> b!1233875 (= e!699935 (contains!7226 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233876 () Bool)

(declare-fun call!60983 () Bool)

(assert (=> b!1233876 (= e!699937 call!60983)))

(declare-fun bm!60980 () Bool)

(assert (=> bm!60980 (= call!60983 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121082 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823))))))

(declare-fun b!1233877 () Bool)

(assert (=> b!1233877 (= e!699937 call!60983)))

(declare-fun d!135363 () Bool)

(declare-fun res!821445 () Bool)

(declare-fun e!699936 () Bool)

(assert (=> d!135363 (=> res!821445 e!699936)))

(assert (=> d!135363 (= res!821445 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38906 a!3806)))))

(assert (=> d!135363 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) e!699936)))

(declare-fun b!1233878 () Bool)

(assert (=> b!1233878 (= e!699936 e!699934)))

(declare-fun res!821447 () Bool)

(assert (=> b!1233878 (=> (not res!821447) (not e!699934))))

(assert (=> b!1233878 (= res!821447 (not e!699935))))

(declare-fun res!821446 () Bool)

(assert (=> b!1233878 (=> (not res!821446) (not e!699935))))

(assert (=> b!1233878 (= res!821446 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135363 (not res!821445)) b!1233878))

(assert (= (and b!1233878 res!821446) b!1233875))

(assert (= (and b!1233878 res!821447) b!1233874))

(assert (= (and b!1233874 c!121082) b!1233877))

(assert (= (and b!1233874 (not c!121082)) b!1233876))

(assert (= (or b!1233877 b!1233876) bm!60980))

(assert (=> b!1233874 m!1138151))

(assert (=> b!1233874 m!1138151))

(declare-fun m!1138175 () Bool)

(assert (=> b!1233874 m!1138175))

(assert (=> b!1233875 m!1138151))

(assert (=> b!1233875 m!1138151))

(declare-fun m!1138177 () Bool)

(assert (=> b!1233875 m!1138177))

(assert (=> bm!60980 m!1138151))

(declare-fun m!1138179 () Bool)

(assert (=> bm!60980 m!1138179))

(assert (=> b!1233878 m!1138151))

(assert (=> b!1233878 m!1138151))

(assert (=> b!1233878 m!1138175))

(assert (=> b!1233735 d!135363))

(declare-fun d!135365 () Bool)

(declare-fun lt!560014 () Bool)

(assert (=> d!135365 (= lt!560014 (select (content!570 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699938 () Bool)

(assert (=> d!135365 (= lt!560014 e!699938)))

(declare-fun res!821448 () Bool)

(assert (=> d!135365 (=> (not res!821448) (not e!699938))))

(assert (=> d!135365 (= res!821448 ((_ is Cons!27151) acc!823))))

(assert (=> d!135365 (= (contains!7226 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560014)))

(declare-fun b!1233879 () Bool)

(declare-fun e!699939 () Bool)

(assert (=> b!1233879 (= e!699938 e!699939)))

(declare-fun res!821449 () Bool)

(assert (=> b!1233879 (=> res!821449 e!699939)))

(assert (=> b!1233879 (= res!821449 (= (h!28369 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233880 () Bool)

(assert (=> b!1233880 (= e!699939 (contains!7226 (t!40610 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135365 res!821448) b!1233879))

(assert (= (and b!1233879 (not res!821449)) b!1233880))

(assert (=> d!135365 m!1138145))

(declare-fun m!1138181 () Bool)

(assert (=> d!135365 m!1138181))

(declare-fun m!1138183 () Bool)

(assert (=> b!1233880 m!1138183))

(assert (=> b!1233739 d!135365))

(declare-fun d!135367 () Bool)

(declare-fun res!821452 () Bool)

(declare-fun e!699942 () Bool)

(assert (=> d!135367 (=> res!821452 e!699942)))

(assert (=> d!135367 (= res!821452 ((_ is Nil!27152) acc!823))))

(assert (=> d!135367 (= (noDuplicate!1807 acc!823) e!699942)))

(declare-fun b!1233881 () Bool)

(declare-fun e!699943 () Bool)

(assert (=> b!1233881 (= e!699942 e!699943)))

(declare-fun res!821453 () Bool)

(assert (=> b!1233881 (=> (not res!821453) (not e!699943))))

(assert (=> b!1233881 (= res!821453 (not (contains!7226 (t!40610 acc!823) (h!28369 acc!823))))))

(declare-fun b!1233882 () Bool)

(assert (=> b!1233882 (= e!699943 (noDuplicate!1807 (t!40610 acc!823)))))

(assert (= (and d!135367 (not res!821452)) b!1233881))

(assert (= (and b!1233881 res!821453) b!1233882))

(declare-fun m!1138185 () Bool)

(assert (=> b!1233881 m!1138185))

(declare-fun m!1138187 () Bool)

(assert (=> b!1233882 m!1138187))

(assert (=> b!1233738 d!135367))

(declare-fun b!1233891 () Bool)

(declare-fun e!699952 () Bool)

(declare-fun e!699955 () Bool)

(assert (=> b!1233891 (= e!699952 e!699955)))

(declare-fun c!121083 () Bool)

(assert (=> b!1233891 (= c!121083 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233892 () Bool)

(declare-fun e!699953 () Bool)

(assert (=> b!1233892 (= e!699953 (contains!7226 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233893 () Bool)

(declare-fun call!60984 () Bool)

(assert (=> b!1233893 (= e!699955 call!60984)))

(declare-fun bm!60981 () Bool)

(assert (=> bm!60981 (= call!60984 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121083 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(declare-fun b!1233894 () Bool)

(assert (=> b!1233894 (= e!699955 call!60984)))

(declare-fun d!135369 () Bool)

(declare-fun res!821462 () Bool)

(declare-fun e!699954 () Bool)

(assert (=> d!135369 (=> res!821462 e!699954)))

(assert (=> d!135369 (= res!821462 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38906 a!3806)))))

(assert (=> d!135369 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) e!699954)))

(declare-fun b!1233895 () Bool)

(assert (=> b!1233895 (= e!699954 e!699952)))

(declare-fun res!821464 () Bool)

(assert (=> b!1233895 (=> (not res!821464) (not e!699952))))

(assert (=> b!1233895 (= res!821464 (not e!699953))))

(declare-fun res!821463 () Bool)

(assert (=> b!1233895 (=> (not res!821463) (not e!699953))))

(assert (=> b!1233895 (= res!821463 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135369 (not res!821462)) b!1233895))

(assert (= (and b!1233895 res!821463) b!1233892))

(assert (= (and b!1233895 res!821464) b!1233891))

(assert (= (and b!1233891 c!121083) b!1233894))

(assert (= (and b!1233891 (not c!121083)) b!1233893))

(assert (= (or b!1233894 b!1233893) bm!60981))

(assert (=> b!1233891 m!1138151))

(assert (=> b!1233891 m!1138151))

(assert (=> b!1233891 m!1138175))

(assert (=> b!1233892 m!1138151))

(assert (=> b!1233892 m!1138151))

(declare-fun m!1138189 () Bool)

(assert (=> b!1233892 m!1138189))

(assert (=> bm!60981 m!1138151))

(declare-fun m!1138191 () Bool)

(assert (=> bm!60981 m!1138191))

(assert (=> b!1233895 m!1138151))

(assert (=> b!1233895 m!1138151))

(assert (=> b!1233895 m!1138175))

(assert (=> b!1233733 d!135369))

(check-sat (not bm!60975) (not bm!60981) (not bm!60980) (not b!1233864) (not b!1233875) (not bm!60979) (not b!1233823) (not b!1233863) (not b!1233867) (not b!1233851) (not b!1233880) (not b!1233878) (not b!1233895) (not b!1233882) (not b!1233862) (not b!1233819) (not d!135341) (not b!1233892) (not b!1233835) (not d!135357) (not b!1233874) (not b!1233820) (not b!1233861) (not d!135365) (not b!1233891) (not b!1233881))
(check-sat)
(get-model)

(assert (=> d!135357 d!135351))

(declare-fun d!135411 () Bool)

(assert (=> d!135411 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27152)))

(assert (=> d!135411 true))

(declare-fun _$70!92 () Unit!40793)

(assert (=> d!135411 (= (choose!80 a!3806 acc!823 Nil!27152 from!3184) _$70!92)))

(declare-fun bs!34659 () Bool)

(assert (= bs!34659 d!135411))

(assert (=> bs!34659 m!1138057))

(assert (=> d!135357 d!135411))

(assert (=> b!1233823 d!135333))

(declare-fun d!135413 () Bool)

(declare-fun lt!560029 () Bool)

(assert (=> d!135413 (= lt!560029 (select (content!570 (t!40610 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700014 () Bool)

(assert (=> d!135413 (= lt!560029 e!700014)))

(declare-fun res!821514 () Bool)

(assert (=> d!135413 (=> (not res!821514) (not e!700014))))

(assert (=> d!135413 (= res!821514 ((_ is Cons!27151) (t!40610 acc!823)))))

(assert (=> d!135413 (= (contains!7226 (t!40610 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!560029)))

(declare-fun b!1233965 () Bool)

(declare-fun e!700015 () Bool)

(assert (=> b!1233965 (= e!700014 e!700015)))

(declare-fun res!821515 () Bool)

(assert (=> b!1233965 (=> res!821515 e!700015)))

(assert (=> b!1233965 (= res!821515 (= (h!28369 (t!40610 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233966 () Bool)

(assert (=> b!1233966 (= e!700015 (contains!7226 (t!40610 (t!40610 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135413 res!821514) b!1233965))

(assert (= (and b!1233965 (not res!821515)) b!1233966))

(declare-fun m!1138263 () Bool)

(assert (=> d!135413 m!1138263))

(declare-fun m!1138265 () Bool)

(assert (=> d!135413 m!1138265))

(declare-fun m!1138267 () Bool)

(assert (=> b!1233966 m!1138267))

(assert (=> b!1233835 d!135413))

(declare-fun d!135415 () Bool)

(declare-fun res!821516 () Bool)

(declare-fun e!700016 () Bool)

(assert (=> d!135415 (=> res!821516 e!700016)))

(assert (=> d!135415 (= res!821516 (= (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!135415 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!700016)))

(declare-fun b!1233967 () Bool)

(declare-fun e!700017 () Bool)

(assert (=> b!1233967 (= e!700016 e!700017)))

(declare-fun res!821517 () Bool)

(assert (=> b!1233967 (=> (not res!821517) (not e!700017))))

(assert (=> b!1233967 (= res!821517 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38906 a!3806)))))

(declare-fun b!1233968 () Bool)

(assert (=> b!1233968 (= e!700017 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!135415 (not res!821516)) b!1233967))

(assert (= (and b!1233967 res!821517) b!1233968))

(declare-fun m!1138269 () Bool)

(assert (=> d!135415 m!1138269))

(declare-fun m!1138271 () Bool)

(assert (=> b!1233968 m!1138271))

(assert (=> b!1233851 d!135415))

(declare-fun d!135417 () Bool)

(assert (=> d!135417 (= (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233895 d!135417))

(assert (=> b!1233878 d!135417))

(declare-fun b!1233969 () Bool)

(declare-fun e!700018 () Bool)

(declare-fun e!700021 () Bool)

(assert (=> b!1233969 (= e!700018 e!700021)))

(declare-fun c!121093 () Bool)

(assert (=> b!1233969 (= c!121093 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun e!700019 () Bool)

(declare-fun b!1233970 () Bool)

(assert (=> b!1233970 (= e!700019 (contains!7226 (ite c!121083 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233971 () Bool)

(declare-fun call!60994 () Bool)

(assert (=> b!1233971 (= e!700021 call!60994)))

(declare-fun bm!60991 () Bool)

(assert (=> bm!60991 (= call!60994 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121093 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!121083 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) (ite c!121083 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))))

(declare-fun b!1233972 () Bool)

(assert (=> b!1233972 (= e!700021 call!60994)))

(declare-fun d!135419 () Bool)

(declare-fun res!821518 () Bool)

(declare-fun e!700020 () Bool)

(assert (=> d!135419 (=> res!821518 e!700020)))

(assert (=> d!135419 (= res!821518 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38906 a!3806)))))

(assert (=> d!135419 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121083 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) e!700020)))

(declare-fun b!1233973 () Bool)

(assert (=> b!1233973 (= e!700020 e!700018)))

(declare-fun res!821520 () Bool)

(assert (=> b!1233973 (=> (not res!821520) (not e!700018))))

(assert (=> b!1233973 (= res!821520 (not e!700019))))

(declare-fun res!821519 () Bool)

(assert (=> b!1233973 (=> (not res!821519) (not e!700019))))

(assert (=> b!1233973 (= res!821519 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135419 (not res!821518)) b!1233973))

(assert (= (and b!1233973 res!821519) b!1233970))

(assert (= (and b!1233973 res!821520) b!1233969))

(assert (= (and b!1233969 c!121093) b!1233972))

(assert (= (and b!1233969 (not c!121093)) b!1233971))

(assert (= (or b!1233972 b!1233971) bm!60991))

(assert (=> b!1233969 m!1138269))

(assert (=> b!1233969 m!1138269))

(declare-fun m!1138273 () Bool)

(assert (=> b!1233969 m!1138273))

(assert (=> b!1233970 m!1138269))

(assert (=> b!1233970 m!1138269))

(declare-fun m!1138275 () Bool)

(assert (=> b!1233970 m!1138275))

(assert (=> bm!60991 m!1138269))

(declare-fun m!1138277 () Bool)

(assert (=> bm!60991 m!1138277))

(assert (=> b!1233973 m!1138269))

(assert (=> b!1233973 m!1138269))

(assert (=> b!1233973 m!1138273))

(assert (=> bm!60981 d!135419))

(declare-fun b!1233974 () Bool)

(declare-fun e!700022 () Bool)

(declare-fun e!700025 () Bool)

(assert (=> b!1233974 (= e!700022 e!700025)))

(declare-fun c!121094 () Bool)

(assert (=> b!1233974 (= c!121094 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun e!700023 () Bool)

(declare-fun b!1233975 () Bool)

(assert (=> b!1233975 (= e!700023 (contains!7226 (ite c!121077 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) acc!823) (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233976 () Bool)

(declare-fun call!60995 () Bool)

(assert (=> b!1233976 (= e!700025 call!60995)))

(declare-fun bm!60992 () Bool)

(assert (=> bm!60992 (= call!60995 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121094 (Cons!27151 (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!121077 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) acc!823)) (ite c!121077 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1233977 () Bool)

(assert (=> b!1233977 (= e!700025 call!60995)))

(declare-fun d!135421 () Bool)

(declare-fun res!821521 () Bool)

(declare-fun e!700024 () Bool)

(assert (=> d!135421 (=> res!821521 e!700024)))

(assert (=> d!135421 (= res!821521 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38906 a!3806)))))

(assert (=> d!135421 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121077 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) acc!823)) e!700024)))

(declare-fun b!1233978 () Bool)

(assert (=> b!1233978 (= e!700024 e!700022)))

(declare-fun res!821523 () Bool)

(assert (=> b!1233978 (=> (not res!821523) (not e!700022))))

(assert (=> b!1233978 (= res!821523 (not e!700023))))

(declare-fun res!821522 () Bool)

(assert (=> b!1233978 (=> (not res!821522) (not e!700023))))

(assert (=> b!1233978 (= res!821522 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135421 (not res!821521)) b!1233978))

(assert (= (and b!1233978 res!821522) b!1233975))

(assert (= (and b!1233978 res!821523) b!1233974))

(assert (= (and b!1233974 c!121094) b!1233977))

(assert (= (and b!1233974 (not c!121094)) b!1233976))

(assert (= (or b!1233977 b!1233976) bm!60992))

(declare-fun m!1138279 () Bool)

(assert (=> b!1233974 m!1138279))

(assert (=> b!1233974 m!1138279))

(declare-fun m!1138281 () Bool)

(assert (=> b!1233974 m!1138281))

(assert (=> b!1233975 m!1138279))

(assert (=> b!1233975 m!1138279))

(declare-fun m!1138283 () Bool)

(assert (=> b!1233975 m!1138283))

(assert (=> bm!60992 m!1138279))

(declare-fun m!1138285 () Bool)

(assert (=> bm!60992 m!1138285))

(assert (=> b!1233978 m!1138279))

(assert (=> b!1233978 m!1138279))

(assert (=> b!1233978 m!1138281))

(assert (=> bm!60975 d!135421))

(declare-fun d!135423 () Bool)

(declare-fun res!821524 () Bool)

(declare-fun e!700026 () Bool)

(assert (=> d!135423 (=> res!821524 e!700026)))

(assert (=> d!135423 (= res!821524 ((_ is Nil!27152) (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(assert (=> d!135423 (= (noDuplicate!1807 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) e!700026)))

(declare-fun b!1233979 () Bool)

(declare-fun e!700027 () Bool)

(assert (=> b!1233979 (= e!700026 e!700027)))

(declare-fun res!821525 () Bool)

(assert (=> b!1233979 (=> (not res!821525) (not e!700027))))

(assert (=> b!1233979 (= res!821525 (not (contains!7226 (t!40610 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) (h!28369 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))))

(declare-fun b!1233980 () Bool)

(assert (=> b!1233980 (= e!700027 (noDuplicate!1807 (t!40610 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))))

(assert (= (and d!135423 (not res!821524)) b!1233979))

(assert (= (and b!1233979 res!821525) b!1233980))

(declare-fun m!1138287 () Bool)

(assert (=> b!1233979 m!1138287))

(declare-fun m!1138289 () Bool)

(assert (=> b!1233980 m!1138289))

(assert (=> b!1233862 d!135423))

(declare-fun d!135425 () Bool)

(declare-fun c!121097 () Bool)

(assert (=> d!135425 (= c!121097 ((_ is Nil!27152) acc!823))))

(declare-fun e!700030 () (InoxSet (_ BitVec 64)))

(assert (=> d!135425 (= (content!570 acc!823) e!700030)))

(declare-fun b!1233985 () Bool)

(assert (=> b!1233985 (= e!700030 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1233986 () Bool)

(assert (=> b!1233986 (= e!700030 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28369 acc!823) true) (content!570 (t!40610 acc!823))))))

(assert (= (and d!135425 c!121097) b!1233985))

(assert (= (and d!135425 (not c!121097)) b!1233986))

(declare-fun m!1138291 () Bool)

(assert (=> b!1233986 m!1138291))

(assert (=> b!1233986 m!1138263))

(assert (=> d!135365 d!135425))

(declare-fun d!135427 () Bool)

(declare-fun lt!560030 () Bool)

(assert (=> d!135427 (= lt!560030 (select (content!570 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(declare-fun e!700031 () Bool)

(assert (=> d!135427 (= lt!560030 e!700031)))

(declare-fun res!821526 () Bool)

(assert (=> d!135427 (=> (not res!821526) (not e!700031))))

(assert (=> d!135427 (= res!821526 ((_ is Cons!27151) (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(assert (=> d!135427 (= (contains!7226 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) lt!560030)))

(declare-fun b!1233987 () Bool)

(declare-fun e!700032 () Bool)

(assert (=> b!1233987 (= e!700031 e!700032)))

(declare-fun res!821527 () Bool)

(assert (=> b!1233987 (=> res!821527 e!700032)))

(assert (=> b!1233987 (= res!821527 (= (h!28369 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(declare-fun b!1233988 () Bool)

(assert (=> b!1233988 (= e!700032 (contains!7226 (t!40610 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))) (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152))))))

(assert (= (and d!135427 res!821526) b!1233987))

(assert (= (and b!1233987 (not res!821527)) b!1233988))

(declare-fun m!1138293 () Bool)

(assert (=> d!135427 m!1138293))

(declare-fun m!1138295 () Bool)

(assert (=> d!135427 m!1138295))

(declare-fun m!1138297 () Bool)

(assert (=> b!1233988 m!1138297))

(assert (=> b!1233861 d!135427))

(declare-fun d!135429 () Bool)

(declare-fun res!821528 () Bool)

(declare-fun e!700033 () Bool)

(assert (=> d!135429 (=> res!821528 e!700033)))

(assert (=> d!135429 (= res!821528 ((_ is Nil!27152) (t!40610 acc!823)))))

(assert (=> d!135429 (= (noDuplicate!1807 (t!40610 acc!823)) e!700033)))

(declare-fun b!1233989 () Bool)

(declare-fun e!700034 () Bool)

(assert (=> b!1233989 (= e!700033 e!700034)))

(declare-fun res!821529 () Bool)

(assert (=> b!1233989 (=> (not res!821529) (not e!700034))))

(assert (=> b!1233989 (= res!821529 (not (contains!7226 (t!40610 (t!40610 acc!823)) (h!28369 (t!40610 acc!823)))))))

(declare-fun b!1233990 () Bool)

(assert (=> b!1233990 (= e!700034 (noDuplicate!1807 (t!40610 (t!40610 acc!823))))))

(assert (= (and d!135429 (not res!821528)) b!1233989))

(assert (= (and b!1233989 res!821529) b!1233990))

(declare-fun m!1138299 () Bool)

(assert (=> b!1233989 m!1138299))

(declare-fun m!1138301 () Bool)

(assert (=> b!1233990 m!1138301))

(assert (=> b!1233882 d!135429))

(declare-fun d!135431 () Bool)

(declare-fun lt!560031 () Bool)

(assert (=> d!135431 (= lt!560031 (select (content!570 (t!40610 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700035 () Bool)

(assert (=> d!135431 (= lt!560031 e!700035)))

(declare-fun res!821530 () Bool)

(assert (=> d!135431 (=> (not res!821530) (not e!700035))))

(assert (=> d!135431 (= res!821530 ((_ is Cons!27151) (t!40610 acc!823)))))

(assert (=> d!135431 (= (contains!7226 (t!40610 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!560031)))

(declare-fun b!1233991 () Bool)

(declare-fun e!700036 () Bool)

(assert (=> b!1233991 (= e!700035 e!700036)))

(declare-fun res!821531 () Bool)

(assert (=> b!1233991 (=> res!821531 e!700036)))

(assert (=> b!1233991 (= res!821531 (= (h!28369 (t!40610 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233992 () Bool)

(assert (=> b!1233992 (= e!700036 (contains!7226 (t!40610 (t!40610 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135431 res!821530) b!1233991))

(assert (= (and b!1233991 (not res!821531)) b!1233992))

(assert (=> d!135431 m!1138263))

(declare-fun m!1138303 () Bool)

(assert (=> d!135431 m!1138303))

(declare-fun m!1138305 () Bool)

(assert (=> b!1233992 m!1138305))

(assert (=> b!1233880 d!135431))

(declare-fun b!1233993 () Bool)

(declare-fun e!700037 () Bool)

(declare-fun e!700040 () Bool)

(assert (=> b!1233993 (= e!700037 e!700040)))

(declare-fun c!121098 () Bool)

(assert (=> b!1233993 (= c!121098 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233994 () Bool)

(declare-fun e!700038 () Bool)

(assert (=> b!1233994 (= e!700038 (contains!7226 (ite c!121081 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) Nil!27152) (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1233995 () Bool)

(declare-fun call!60996 () Bool)

(assert (=> b!1233995 (= e!700040 call!60996)))

(declare-fun bm!60993 () Bool)

(assert (=> bm!60993 (= call!60996 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121098 (Cons!27151 (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!121081 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) Nil!27152)) (ite c!121081 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) Nil!27152))))))

(declare-fun b!1233996 () Bool)

(assert (=> b!1233996 (= e!700040 call!60996)))

(declare-fun d!135433 () Bool)

(declare-fun res!821532 () Bool)

(declare-fun e!700039 () Bool)

(assert (=> d!135433 (=> res!821532 e!700039)))

(assert (=> d!135433 (= res!821532 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38906 a!3806)))))

(assert (=> d!135433 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121081 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) Nil!27152)) e!700039)))

(declare-fun b!1233997 () Bool)

(assert (=> b!1233997 (= e!700039 e!700037)))

(declare-fun res!821534 () Bool)

(assert (=> b!1233997 (=> (not res!821534) (not e!700037))))

(assert (=> b!1233997 (= res!821534 (not e!700038))))

(declare-fun res!821533 () Bool)

(assert (=> b!1233997 (=> (not res!821533) (not e!700038))))

(assert (=> b!1233997 (= res!821533 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135433 (not res!821532)) b!1233997))

(assert (= (and b!1233997 res!821533) b!1233994))

(assert (= (and b!1233997 res!821534) b!1233993))

(assert (= (and b!1233993 c!121098) b!1233996))

(assert (= (and b!1233993 (not c!121098)) b!1233995))

(assert (= (or b!1233996 b!1233995) bm!60993))

(assert (=> b!1233993 m!1138279))

(assert (=> b!1233993 m!1138279))

(assert (=> b!1233993 m!1138281))

(assert (=> b!1233994 m!1138279))

(assert (=> b!1233994 m!1138279))

(declare-fun m!1138307 () Bool)

(assert (=> b!1233994 m!1138307))

(assert (=> bm!60993 m!1138279))

(declare-fun m!1138309 () Bool)

(assert (=> bm!60993 m!1138309))

(assert (=> b!1233997 m!1138279))

(assert (=> b!1233997 m!1138279))

(assert (=> b!1233997 m!1138281))

(assert (=> bm!60979 d!135433))

(declare-fun d!135435 () Bool)

(declare-fun lt!560032 () Bool)

(assert (=> d!135435 (= lt!560032 (select (content!570 (t!40610 acc!823)) (h!28369 acc!823)))))

(declare-fun e!700041 () Bool)

(assert (=> d!135435 (= lt!560032 e!700041)))

(declare-fun res!821535 () Bool)

(assert (=> d!135435 (=> (not res!821535) (not e!700041))))

(assert (=> d!135435 (= res!821535 ((_ is Cons!27151) (t!40610 acc!823)))))

(assert (=> d!135435 (= (contains!7226 (t!40610 acc!823) (h!28369 acc!823)) lt!560032)))

(declare-fun b!1233998 () Bool)

(declare-fun e!700042 () Bool)

(assert (=> b!1233998 (= e!700041 e!700042)))

(declare-fun res!821536 () Bool)

(assert (=> b!1233998 (=> res!821536 e!700042)))

(assert (=> b!1233998 (= res!821536 (= (h!28369 (t!40610 acc!823)) (h!28369 acc!823)))))

(declare-fun b!1233999 () Bool)

(assert (=> b!1233999 (= e!700042 (contains!7226 (t!40610 (t!40610 acc!823)) (h!28369 acc!823)))))

(assert (= (and d!135435 res!821535) b!1233998))

(assert (= (and b!1233998 (not res!821536)) b!1233999))

(assert (=> d!135435 m!1138263))

(declare-fun m!1138311 () Bool)

(assert (=> d!135435 m!1138311))

(declare-fun m!1138313 () Bool)

(assert (=> b!1233999 m!1138313))

(assert (=> b!1233881 d!135435))

(assert (=> d!135341 d!135425))

(declare-fun d!135437 () Bool)

(declare-fun lt!560033 () Bool)

(assert (=> d!135437 (= lt!560033 (select (content!570 Nil!27152) (select (arr!38369 a!3806) from!3184)))))

(declare-fun e!700043 () Bool)

(assert (=> d!135437 (= lt!560033 e!700043)))

(declare-fun res!821537 () Bool)

(assert (=> d!135437 (=> (not res!821537) (not e!700043))))

(assert (=> d!135437 (= res!821537 ((_ is Cons!27151) Nil!27152))))

(assert (=> d!135437 (= (contains!7226 Nil!27152 (select (arr!38369 a!3806) from!3184)) lt!560033)))

(declare-fun b!1234000 () Bool)

(declare-fun e!700044 () Bool)

(assert (=> b!1234000 (= e!700043 e!700044)))

(declare-fun res!821538 () Bool)

(assert (=> b!1234000 (=> res!821538 e!700044)))

(assert (=> b!1234000 (= res!821538 (= (h!28369 Nil!27152) (select (arr!38369 a!3806) from!3184)))))

(declare-fun b!1234001 () Bool)

(assert (=> b!1234001 (= e!700044 (contains!7226 (t!40610 Nil!27152) (select (arr!38369 a!3806) from!3184)))))

(assert (= (and d!135437 res!821537) b!1234000))

(assert (= (and b!1234000 (not res!821538)) b!1234001))

(declare-fun m!1138315 () Bool)

(assert (=> d!135437 m!1138315))

(assert (=> d!135437 m!1138061))

(declare-fun m!1138317 () Bool)

(assert (=> d!135437 m!1138317))

(assert (=> b!1234001 m!1138061))

(declare-fun m!1138319 () Bool)

(assert (=> b!1234001 m!1138319))

(assert (=> b!1233864 d!135437))

(assert (=> b!1233863 d!135333))

(declare-fun b!1234002 () Bool)

(declare-fun e!700045 () Bool)

(declare-fun e!700048 () Bool)

(assert (=> b!1234002 (= e!700045 e!700048)))

(declare-fun c!121099 () Bool)

(assert (=> b!1234002 (= c!121099 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun e!700046 () Bool)

(declare-fun b!1234003 () Bool)

(assert (=> b!1234003 (= e!700046 (contains!7226 (ite c!121082 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1234004 () Bool)

(declare-fun call!60997 () Bool)

(assert (=> b!1234004 (= e!700048 call!60997)))

(declare-fun bm!60994 () Bool)

(assert (=> bm!60994 (= call!60997 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121099 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!121082 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823))) (ite c!121082 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)))))))

(declare-fun b!1234005 () Bool)

(assert (=> b!1234005 (= e!700048 call!60997)))

(declare-fun d!135439 () Bool)

(declare-fun res!821539 () Bool)

(declare-fun e!700047 () Bool)

(assert (=> d!135439 (=> res!821539 e!700047)))

(assert (=> d!135439 (= res!821539 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38906 a!3806)))))

(assert (=> d!135439 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121082 (Cons!27151 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823))) e!700047)))

(declare-fun b!1234006 () Bool)

(assert (=> b!1234006 (= e!700047 e!700045)))

(declare-fun res!821541 () Bool)

(assert (=> b!1234006 (=> (not res!821541) (not e!700045))))

(assert (=> b!1234006 (= res!821541 (not e!700046))))

(declare-fun res!821540 () Bool)

(assert (=> b!1234006 (=> (not res!821540) (not e!700046))))

(assert (=> b!1234006 (= res!821540 (validKeyInArray!0 (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!135439 (not res!821539)) b!1234006))

(assert (= (and b!1234006 res!821540) b!1234003))

(assert (= (and b!1234006 res!821541) b!1234002))

(assert (= (and b!1234002 c!121099) b!1234005))

(assert (= (and b!1234002 (not c!121099)) b!1234004))

(assert (= (or b!1234005 b!1234004) bm!60994))

(assert (=> b!1234002 m!1138269))

(assert (=> b!1234002 m!1138269))

(assert (=> b!1234002 m!1138273))

(assert (=> b!1234003 m!1138269))

(assert (=> b!1234003 m!1138269))

(declare-fun m!1138321 () Bool)

(assert (=> b!1234003 m!1138321))

(assert (=> bm!60994 m!1138269))

(declare-fun m!1138323 () Bool)

(assert (=> bm!60994 m!1138323))

(assert (=> b!1234006 m!1138269))

(assert (=> b!1234006 m!1138269))

(assert (=> b!1234006 m!1138273))

(assert (=> bm!60980 d!135439))

(declare-fun d!135441 () Bool)

(declare-fun lt!560034 () Bool)

(assert (=> d!135441 (= lt!560034 (select (content!570 acc!823) (select (arr!38369 a!3806) from!3184)))))

(declare-fun e!700049 () Bool)

(assert (=> d!135441 (= lt!560034 e!700049)))

(declare-fun res!821542 () Bool)

(assert (=> d!135441 (=> (not res!821542) (not e!700049))))

(assert (=> d!135441 (= res!821542 ((_ is Cons!27151) acc!823))))

(assert (=> d!135441 (= (contains!7226 acc!823 (select (arr!38369 a!3806) from!3184)) lt!560034)))

(declare-fun b!1234007 () Bool)

(declare-fun e!700050 () Bool)

(assert (=> b!1234007 (= e!700049 e!700050)))

(declare-fun res!821543 () Bool)

(assert (=> b!1234007 (=> res!821543 e!700050)))

(assert (=> b!1234007 (= res!821543 (= (h!28369 acc!823) (select (arr!38369 a!3806) from!3184)))))

(declare-fun b!1234008 () Bool)

(assert (=> b!1234008 (= e!700050 (contains!7226 (t!40610 acc!823) (select (arr!38369 a!3806) from!3184)))))

(assert (= (and d!135441 res!821542) b!1234007))

(assert (= (and b!1234007 (not res!821543)) b!1234008))

(assert (=> d!135441 m!1138145))

(assert (=> d!135441 m!1138061))

(declare-fun m!1138325 () Bool)

(assert (=> d!135441 m!1138325))

(assert (=> b!1234008 m!1138061))

(declare-fun m!1138327 () Bool)

(assert (=> b!1234008 m!1138327))

(assert (=> b!1233820 d!135441))

(assert (=> b!1233819 d!135333))

(assert (=> b!1233891 d!135417))

(declare-fun d!135443 () Bool)

(declare-fun lt!560035 () Bool)

(assert (=> d!135443 (= lt!560035 (select (content!570 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!700051 () Bool)

(assert (=> d!135443 (= lt!560035 e!700051)))

(declare-fun res!821544 () Bool)

(assert (=> d!135443 (=> (not res!821544) (not e!700051))))

(assert (=> d!135443 (= res!821544 ((_ is Cons!27151) (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)))))

(assert (=> d!135443 (= (contains!7226 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!560035)))

(declare-fun b!1234009 () Bool)

(declare-fun e!700052 () Bool)

(assert (=> b!1234009 (= e!700051 e!700052)))

(declare-fun res!821545 () Bool)

(assert (=> b!1234009 (=> res!821545 e!700052)))

(assert (=> b!1234009 (= res!821545 (= (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234010 () Bool)

(assert (=> b!1234010 (= e!700052 (contains!7226 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) Nil!27152)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135443 res!821544) b!1234009))

(assert (= (and b!1234009 (not res!821545)) b!1234010))

(declare-fun m!1138329 () Bool)

(assert (=> d!135443 m!1138329))

(assert (=> d!135443 m!1138151))

(declare-fun m!1138331 () Bool)

(assert (=> d!135443 m!1138331))

(assert (=> b!1234010 m!1138151))

(declare-fun m!1138333 () Bool)

(assert (=> b!1234010 m!1138333))

(assert (=> b!1233892 d!135443))

(declare-fun lt!560036 () Bool)

(declare-fun d!135445 () Bool)

(assert (=> d!135445 (= lt!560036 (select (content!570 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!700053 () Bool)

(assert (=> d!135445 (= lt!560036 e!700053)))

(declare-fun res!821546 () Bool)

(assert (=> d!135445 (=> (not res!821546) (not e!700053))))

(assert (=> d!135445 (= res!821546 ((_ is Cons!27151) (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)))))

(assert (=> d!135445 (= (contains!7226 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!560036)))

(declare-fun b!1234011 () Bool)

(declare-fun e!700054 () Bool)

(assert (=> b!1234011 (= e!700053 e!700054)))

(declare-fun res!821547 () Bool)

(assert (=> b!1234011 (=> res!821547 e!700054)))

(assert (=> b!1234011 (= res!821547 (= (h!28369 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234012 () Bool)

(assert (=> b!1234012 (= e!700054 (contains!7226 (t!40610 (Cons!27151 (select (arr!38369 a!3806) from!3184) acc!823)) (select (arr!38369 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135445 res!821546) b!1234011))

(assert (= (and b!1234011 (not res!821547)) b!1234012))

(declare-fun m!1138335 () Bool)

(assert (=> d!135445 m!1138335))

(assert (=> d!135445 m!1138151))

(declare-fun m!1138337 () Bool)

(assert (=> d!135445 m!1138337))

(assert (=> b!1234012 m!1138151))

(declare-fun m!1138339 () Bool)

(assert (=> b!1234012 m!1138339))

(assert (=> b!1233875 d!135445))

(assert (=> b!1233867 d!135333))

(assert (=> b!1233874 d!135417))

(check-sat (not d!135441) (not d!135443) (not b!1234012) (not d!135427) (not b!1233974) (not d!135435) (not b!1233970) (not bm!60993) (not b!1234001) (not b!1233979) (not b!1233992) (not b!1233980) (not b!1233986) (not b!1233997) (not b!1234010) (not b!1234003) (not b!1234002) (not d!135411) (not b!1233988) (not b!1233994) (not bm!60991) (not b!1233966) (not bm!60994) (not b!1233993) (not b!1233989) (not b!1233968) (not bm!60992) (not b!1233978) (not d!135413) (not b!1233969) (not b!1234008) (not b!1234006) (not b!1233999) (not d!135445) (not b!1233975) (not b!1233973) (not d!135437) (not b!1233990) (not d!135431))
(check-sat)
