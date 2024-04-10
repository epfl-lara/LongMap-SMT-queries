; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103130 () Bool)

(assert start!103130)

(declare-fun b!1238337 () Bool)

(declare-fun res!826066 () Bool)

(declare-fun e!701803 () Bool)

(assert (=> b!1238337 (=> (not res!826066) (not e!701803))))

(declare-datatypes ((array!79816 0))(
  ( (array!79817 (arr!38511 (Array (_ BitVec 32) (_ BitVec 64))) (size!39047 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79816)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238337 (= res!826066 (validKeyInArray!0 (select (arr!38511 a!3835) from!3213)))))

(declare-fun b!1238338 () Bool)

(declare-fun res!826070 () Bool)

(assert (=> b!1238338 (=> (not res!826070) (not e!701803))))

(assert (=> b!1238338 (= res!826070 (not (= from!3213 (bvsub (size!39047 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238339 () Bool)

(declare-fun res!826069 () Bool)

(declare-fun e!701805 () Bool)

(assert (=> b!1238339 (=> res!826069 e!701805)))

(declare-datatypes ((List!27284 0))(
  ( (Nil!27281) (Cons!27280 (h!28489 (_ BitVec 64)) (t!40747 List!27284)) )
))
(declare-fun lt!561279 () List!27284)

(declare-fun contains!7346 (List!27284 (_ BitVec 64)) Bool)

(assert (=> b!1238339 (= res!826069 (contains!7346 lt!561279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238340 () Bool)

(declare-fun res!826068 () Bool)

(assert (=> b!1238340 (=> res!826068 e!701805)))

(assert (=> b!1238340 (= res!826068 (contains!7346 lt!561279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238341 () Bool)

(declare-fun res!826071 () Bool)

(assert (=> b!1238341 (=> (not res!826071) (not e!701803))))

(declare-fun acc!846 () List!27284)

(assert (=> b!1238341 (= res!826071 (not (contains!7346 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238342 () Bool)

(declare-fun res!826067 () Bool)

(assert (=> b!1238342 (=> (not res!826067) (not e!701803))))

(assert (=> b!1238342 (= res!826067 (not (contains!7346 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238343 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79816 (_ BitVec 32) List!27284) Bool)

(assert (=> b!1238343 (= e!701805 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561279))))

(declare-datatypes ((Unit!41108 0))(
  ( (Unit!41109) )
))
(declare-fun lt!561281 () Unit!41108)

(declare-fun noDuplicateSubseq!81 (List!27284 List!27284) Unit!41108)

(assert (=> b!1238343 (= lt!561281 (noDuplicateSubseq!81 acc!846 lt!561279))))

(declare-fun b!1238344 () Bool)

(assert (=> b!1238344 (= e!701803 (not e!701805))))

(declare-fun res!826063 () Bool)

(assert (=> b!1238344 (=> res!826063 e!701805)))

(assert (=> b!1238344 (= res!826063 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!600 (List!27284 List!27284) Bool)

(assert (=> b!1238344 (subseq!600 acc!846 lt!561279)))

(declare-fun lt!561280 () Unit!41108)

(declare-fun subseqTail!87 (List!27284 List!27284) Unit!41108)

(assert (=> b!1238344 (= lt!561280 (subseqTail!87 lt!561279 lt!561279))))

(assert (=> b!1238344 (subseq!600 lt!561279 lt!561279)))

(declare-fun lt!561278 () Unit!41108)

(declare-fun lemmaListSubSeqRefl!0 (List!27284) Unit!41108)

(assert (=> b!1238344 (= lt!561278 (lemmaListSubSeqRefl!0 lt!561279))))

(assert (=> b!1238344 (= lt!561279 (Cons!27280 (select (arr!38511 a!3835) from!3213) acc!846))))

(declare-fun res!826062 () Bool)

(assert (=> start!103130 (=> (not res!826062) (not e!701803))))

(assert (=> start!103130 (= res!826062 (and (bvslt (size!39047 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39047 a!3835))))))

(assert (=> start!103130 e!701803))

(declare-fun array_inv!29359 (array!79816) Bool)

(assert (=> start!103130 (array_inv!29359 a!3835)))

(assert (=> start!103130 true))

(declare-fun b!1238345 () Bool)

(declare-fun res!826072 () Bool)

(assert (=> b!1238345 (=> res!826072 e!701805)))

(declare-fun noDuplicate!1943 (List!27284) Bool)

(assert (=> b!1238345 (= res!826072 (not (noDuplicate!1943 lt!561279)))))

(declare-fun b!1238346 () Bool)

(declare-fun res!826061 () Bool)

(assert (=> b!1238346 (=> (not res!826061) (not e!701803))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238346 (= res!826061 (contains!7346 acc!846 k0!2925))))

(declare-fun b!1238347 () Bool)

(declare-fun res!826064 () Bool)

(assert (=> b!1238347 (=> (not res!826064) (not e!701803))))

(assert (=> b!1238347 (= res!826064 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238348 () Bool)

(declare-fun res!826065 () Bool)

(assert (=> b!1238348 (=> (not res!826065) (not e!701803))))

(assert (=> b!1238348 (= res!826065 (noDuplicate!1943 acc!846))))

(assert (= (and start!103130 res!826062) b!1238348))

(assert (= (and b!1238348 res!826065) b!1238342))

(assert (= (and b!1238342 res!826067) b!1238341))

(assert (= (and b!1238341 res!826071) b!1238347))

(assert (= (and b!1238347 res!826064) b!1238346))

(assert (= (and b!1238346 res!826061) b!1238338))

(assert (= (and b!1238338 res!826070) b!1238337))

(assert (= (and b!1238337 res!826066) b!1238344))

(assert (= (and b!1238344 (not res!826063)) b!1238345))

(assert (= (and b!1238345 (not res!826072)) b!1238339))

(assert (= (and b!1238339 (not res!826069)) b!1238340))

(assert (= (and b!1238340 (not res!826068)) b!1238343))

(declare-fun m!1141889 () Bool)

(assert (=> b!1238347 m!1141889))

(declare-fun m!1141891 () Bool)

(assert (=> b!1238348 m!1141891))

(declare-fun m!1141893 () Bool)

(assert (=> b!1238339 m!1141893))

(declare-fun m!1141895 () Bool)

(assert (=> b!1238345 m!1141895))

(declare-fun m!1141897 () Bool)

(assert (=> b!1238342 m!1141897))

(declare-fun m!1141899 () Bool)

(assert (=> b!1238346 m!1141899))

(declare-fun m!1141901 () Bool)

(assert (=> b!1238337 m!1141901))

(assert (=> b!1238337 m!1141901))

(declare-fun m!1141903 () Bool)

(assert (=> b!1238337 m!1141903))

(declare-fun m!1141905 () Bool)

(assert (=> b!1238340 m!1141905))

(declare-fun m!1141907 () Bool)

(assert (=> b!1238344 m!1141907))

(declare-fun m!1141909 () Bool)

(assert (=> b!1238344 m!1141909))

(declare-fun m!1141911 () Bool)

(assert (=> b!1238344 m!1141911))

(declare-fun m!1141913 () Bool)

(assert (=> b!1238344 m!1141913))

(assert (=> b!1238344 m!1141901))

(declare-fun m!1141915 () Bool)

(assert (=> start!103130 m!1141915))

(declare-fun m!1141917 () Bool)

(assert (=> b!1238343 m!1141917))

(declare-fun m!1141919 () Bool)

(assert (=> b!1238343 m!1141919))

(declare-fun m!1141921 () Bool)

(assert (=> b!1238341 m!1141921))

(check-sat (not b!1238347) (not b!1238337) (not b!1238339) (not b!1238340) (not b!1238341) (not b!1238346) (not start!103130) (not b!1238345) (not b!1238348) (not b!1238342) (not b!1238343) (not b!1238344))
(check-sat)
(get-model)

(declare-fun d!135851 () Bool)

(declare-fun lt!561296 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!590 (List!27284) (InoxSet (_ BitVec 64)))

(assert (=> d!135851 (= lt!561296 (select (content!590 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701819 () Bool)

(assert (=> d!135851 (= lt!561296 e!701819)))

(declare-fun res!826114 () Bool)

(assert (=> d!135851 (=> (not res!826114) (not e!701819))))

(get-info :version)

(assert (=> d!135851 (= res!826114 ((_ is Cons!27280) acc!846))))

(assert (=> d!135851 (= (contains!7346 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561296)))

(declare-fun b!1238389 () Bool)

(declare-fun e!701820 () Bool)

(assert (=> b!1238389 (= e!701819 e!701820)))

(declare-fun res!826113 () Bool)

(assert (=> b!1238389 (=> res!826113 e!701820)))

(assert (=> b!1238389 (= res!826113 (= (h!28489 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238390 () Bool)

(assert (=> b!1238390 (= e!701820 (contains!7346 (t!40747 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135851 res!826114) b!1238389))

(assert (= (and b!1238389 (not res!826113)) b!1238390))

(declare-fun m!1141957 () Bool)

(assert (=> d!135851 m!1141957))

(declare-fun m!1141959 () Bool)

(assert (=> d!135851 m!1141959))

(declare-fun m!1141961 () Bool)

(assert (=> b!1238390 m!1141961))

(assert (=> b!1238341 d!135851))

(declare-fun d!135853 () Bool)

(assert (=> d!135853 (= (array_inv!29359 a!3835) (bvsge (size!39047 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103130 d!135853))

(declare-fun d!135855 () Bool)

(declare-fun lt!561297 () Bool)

(assert (=> d!135855 (= lt!561297 (select (content!590 lt!561279) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701821 () Bool)

(assert (=> d!135855 (= lt!561297 e!701821)))

(declare-fun res!826116 () Bool)

(assert (=> d!135855 (=> (not res!826116) (not e!701821))))

(assert (=> d!135855 (= res!826116 ((_ is Cons!27280) lt!561279))))

(assert (=> d!135855 (= (contains!7346 lt!561279 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561297)))

(declare-fun b!1238391 () Bool)

(declare-fun e!701822 () Bool)

(assert (=> b!1238391 (= e!701821 e!701822)))

(declare-fun res!826115 () Bool)

(assert (=> b!1238391 (=> res!826115 e!701822)))

(assert (=> b!1238391 (= res!826115 (= (h!28489 lt!561279) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238392 () Bool)

(assert (=> b!1238392 (= e!701822 (contains!7346 (t!40747 lt!561279) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135855 res!826116) b!1238391))

(assert (= (and b!1238391 (not res!826115)) b!1238392))

(declare-fun m!1141963 () Bool)

(assert (=> d!135855 m!1141963))

(declare-fun m!1141965 () Bool)

(assert (=> d!135855 m!1141965))

(declare-fun m!1141967 () Bool)

(assert (=> b!1238392 m!1141967))

(assert (=> b!1238340 d!135855))

(declare-fun d!135857 () Bool)

(declare-fun res!826131 () Bool)

(declare-fun e!701836 () Bool)

(assert (=> d!135857 (=> res!826131 e!701836)))

(assert (=> d!135857 (= res!826131 ((_ is Nil!27281) acc!846))))

(assert (=> d!135857 (= (subseq!600 acc!846 lt!561279) e!701836)))

(declare-fun b!1238408 () Bool)

(declare-fun e!701835 () Bool)

(assert (=> b!1238408 (= e!701835 (subseq!600 acc!846 (t!40747 lt!561279)))))

(declare-fun b!1238405 () Bool)

(declare-fun e!701837 () Bool)

(assert (=> b!1238405 (= e!701836 e!701837)))

(declare-fun res!826130 () Bool)

(assert (=> b!1238405 (=> (not res!826130) (not e!701837))))

(assert (=> b!1238405 (= res!826130 ((_ is Cons!27280) lt!561279))))

(declare-fun b!1238407 () Bool)

(declare-fun e!701838 () Bool)

(assert (=> b!1238407 (= e!701838 (subseq!600 (t!40747 acc!846) (t!40747 lt!561279)))))

(declare-fun b!1238406 () Bool)

(assert (=> b!1238406 (= e!701837 e!701835)))

(declare-fun res!826132 () Bool)

(assert (=> b!1238406 (=> res!826132 e!701835)))

(assert (=> b!1238406 (= res!826132 e!701838)))

(declare-fun res!826129 () Bool)

(assert (=> b!1238406 (=> (not res!826129) (not e!701838))))

(assert (=> b!1238406 (= res!826129 (= (h!28489 acc!846) (h!28489 lt!561279)))))

(assert (= (and d!135857 (not res!826131)) b!1238405))

(assert (= (and b!1238405 res!826130) b!1238406))

(assert (= (and b!1238406 res!826129) b!1238407))

(assert (= (and b!1238406 (not res!826132)) b!1238408))

(declare-fun m!1141969 () Bool)

(assert (=> b!1238408 m!1141969))

(declare-fun m!1141971 () Bool)

(assert (=> b!1238407 m!1141971))

(assert (=> b!1238344 d!135857))

(declare-fun b!1238458 () Bool)

(declare-fun c!121008 () Bool)

(declare-fun isEmpty!1014 (List!27284) Bool)

(assert (=> b!1238458 (= c!121008 (not (isEmpty!1014 (t!40747 lt!561279))))))

(declare-fun e!701879 () Unit!41108)

(declare-fun e!701880 () Unit!41108)

(assert (=> b!1238458 (= e!701879 e!701880)))

(declare-fun b!1238459 () Bool)

(declare-fun e!701878 () Unit!41108)

(assert (=> b!1238459 (= e!701878 e!701879)))

(declare-fun c!121009 () Bool)

(assert (=> b!1238459 (= c!121009 (subseq!600 lt!561279 (t!40747 lt!561279)))))

(declare-fun b!1238460 () Bool)

(declare-fun call!61061 () Unit!41108)

(assert (=> b!1238460 (= e!701879 call!61061)))

(declare-fun b!1238461 () Bool)

(declare-fun Unit!41112 () Unit!41108)

(assert (=> b!1238461 (= e!701878 Unit!41112)))

(declare-fun b!1238462 () Bool)

(declare-fun Unit!41113 () Unit!41108)

(assert (=> b!1238462 (= e!701880 Unit!41113)))

(declare-fun d!135863 () Bool)

(declare-fun tail!166 (List!27284) List!27284)

(assert (=> d!135863 (subseq!600 (tail!166 lt!561279) lt!561279)))

(declare-fun lt!561308 () Unit!41108)

(assert (=> d!135863 (= lt!561308 e!701878)))

(declare-fun c!121010 () Bool)

(assert (=> d!135863 (= c!121010 (and ((_ is Cons!27280) lt!561279) ((_ is Cons!27280) lt!561279)))))

(declare-fun e!701881 () Bool)

(assert (=> d!135863 e!701881))

(declare-fun res!826162 () Bool)

(assert (=> d!135863 (=> (not res!826162) (not e!701881))))

(assert (=> d!135863 (= res!826162 (not (isEmpty!1014 lt!561279)))))

(assert (=> d!135863 (= (subseqTail!87 lt!561279 lt!561279) lt!561308)))

(declare-fun b!1238463 () Bool)

(assert (=> b!1238463 (= e!701881 (subseq!600 lt!561279 lt!561279))))

(declare-fun b!1238464 () Bool)

(assert (=> b!1238464 (= e!701880 call!61061)))

(declare-fun bm!61058 () Bool)

(assert (=> bm!61058 (= call!61061 (subseqTail!87 (ite c!121009 lt!561279 (t!40747 lt!561279)) (t!40747 lt!561279)))))

(assert (= (and d!135863 res!826162) b!1238463))

(assert (= (and d!135863 c!121010) b!1238459))

(assert (= (and d!135863 (not c!121010)) b!1238461))

(assert (= (and b!1238459 c!121009) b!1238460))

(assert (= (and b!1238459 (not c!121009)) b!1238458))

(assert (= (and b!1238458 c!121008) b!1238464))

(assert (= (and b!1238458 (not c!121008)) b!1238462))

(assert (= (or b!1238460 b!1238464) bm!61058))

(declare-fun m!1142005 () Bool)

(assert (=> b!1238458 m!1142005))

(assert (=> b!1238463 m!1141913))

(declare-fun m!1142007 () Bool)

(assert (=> b!1238459 m!1142007))

(declare-fun m!1142011 () Bool)

(assert (=> d!135863 m!1142011))

(assert (=> d!135863 m!1142011))

(declare-fun m!1142013 () Bool)

(assert (=> d!135863 m!1142013))

(declare-fun m!1142015 () Bool)

(assert (=> d!135863 m!1142015))

(declare-fun m!1142017 () Bool)

(assert (=> bm!61058 m!1142017))

(assert (=> b!1238344 d!135863))

(declare-fun d!135881 () Bool)

(declare-fun res!826171 () Bool)

(declare-fun e!701891 () Bool)

(assert (=> d!135881 (=> res!826171 e!701891)))

(assert (=> d!135881 (= res!826171 ((_ is Nil!27281) lt!561279))))

(assert (=> d!135881 (= (subseq!600 lt!561279 lt!561279) e!701891)))

(declare-fun b!1238478 () Bool)

(declare-fun e!701890 () Bool)

(assert (=> b!1238478 (= e!701890 (subseq!600 lt!561279 (t!40747 lt!561279)))))

(declare-fun b!1238475 () Bool)

(declare-fun e!701892 () Bool)

(assert (=> b!1238475 (= e!701891 e!701892)))

(declare-fun res!826170 () Bool)

(assert (=> b!1238475 (=> (not res!826170) (not e!701892))))

(assert (=> b!1238475 (= res!826170 ((_ is Cons!27280) lt!561279))))

(declare-fun b!1238477 () Bool)

(declare-fun e!701893 () Bool)

(assert (=> b!1238477 (= e!701893 (subseq!600 (t!40747 lt!561279) (t!40747 lt!561279)))))

(declare-fun b!1238476 () Bool)

(assert (=> b!1238476 (= e!701892 e!701890)))

(declare-fun res!826172 () Bool)

(assert (=> b!1238476 (=> res!826172 e!701890)))

(assert (=> b!1238476 (= res!826172 e!701893)))

(declare-fun res!826169 () Bool)

(assert (=> b!1238476 (=> (not res!826169) (not e!701893))))

(assert (=> b!1238476 (= res!826169 (= (h!28489 lt!561279) (h!28489 lt!561279)))))

(assert (= (and d!135881 (not res!826171)) b!1238475))

(assert (= (and b!1238475 res!826170) b!1238476))

(assert (= (and b!1238476 res!826169) b!1238477))

(assert (= (and b!1238476 (not res!826172)) b!1238478))

(assert (=> b!1238478 m!1142007))

(declare-fun m!1142019 () Bool)

(assert (=> b!1238477 m!1142019))

(assert (=> b!1238344 d!135881))

(declare-fun d!135883 () Bool)

(assert (=> d!135883 (subseq!600 lt!561279 lt!561279)))

(declare-fun lt!561311 () Unit!41108)

(declare-fun choose!36 (List!27284) Unit!41108)

(assert (=> d!135883 (= lt!561311 (choose!36 lt!561279))))

(assert (=> d!135883 (= (lemmaListSubSeqRefl!0 lt!561279) lt!561311)))

(declare-fun bs!34820 () Bool)

(assert (= bs!34820 d!135883))

(assert (=> bs!34820 m!1141913))

(declare-fun m!1142021 () Bool)

(assert (=> bs!34820 m!1142021))

(assert (=> b!1238344 d!135883))

(declare-fun d!135885 () Bool)

(declare-fun lt!561312 () Bool)

(assert (=> d!135885 (= lt!561312 (select (content!590 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701894 () Bool)

(assert (=> d!135885 (= lt!561312 e!701894)))

(declare-fun res!826174 () Bool)

(assert (=> d!135885 (=> (not res!826174) (not e!701894))))

(assert (=> d!135885 (= res!826174 ((_ is Cons!27280) acc!846))))

(assert (=> d!135885 (= (contains!7346 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561312)))

(declare-fun b!1238479 () Bool)

(declare-fun e!701895 () Bool)

(assert (=> b!1238479 (= e!701894 e!701895)))

(declare-fun res!826173 () Bool)

(assert (=> b!1238479 (=> res!826173 e!701895)))

(assert (=> b!1238479 (= res!826173 (= (h!28489 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238480 () Bool)

(assert (=> b!1238480 (= e!701895 (contains!7346 (t!40747 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135885 res!826174) b!1238479))

(assert (= (and b!1238479 (not res!826173)) b!1238480))

(assert (=> d!135885 m!1141957))

(declare-fun m!1142023 () Bool)

(assert (=> d!135885 m!1142023))

(declare-fun m!1142025 () Bool)

(assert (=> b!1238480 m!1142025))

(assert (=> b!1238342 d!135885))

(declare-fun b!1238526 () Bool)

(declare-fun e!701939 () Bool)

(declare-fun call!61067 () Bool)

(assert (=> b!1238526 (= e!701939 call!61067)))

(declare-fun b!1238527 () Bool)

(assert (=> b!1238527 (= e!701939 call!61067)))

(declare-fun d!135887 () Bool)

(declare-fun res!826215 () Bool)

(declare-fun e!701941 () Bool)

(assert (=> d!135887 (=> res!826215 e!701941)))

(assert (=> d!135887 (= res!826215 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39047 a!3835)))))

(assert (=> d!135887 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561279) e!701941)))

(declare-fun e!701938 () Bool)

(declare-fun b!1238528 () Bool)

(assert (=> b!1238528 (= e!701938 (contains!7346 lt!561279 (select (arr!38511 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1238529 () Bool)

(declare-fun e!701940 () Bool)

(assert (=> b!1238529 (= e!701940 e!701939)))

(declare-fun c!121016 () Bool)

(assert (=> b!1238529 (= c!121016 (validKeyInArray!0 (select (arr!38511 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun bm!61064 () Bool)

(assert (=> bm!61064 (= call!61067 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121016 (Cons!27280 (select (arr!38511 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) lt!561279) lt!561279)))))

(declare-fun b!1238530 () Bool)

(assert (=> b!1238530 (= e!701941 e!701940)))

(declare-fun res!826216 () Bool)

(assert (=> b!1238530 (=> (not res!826216) (not e!701940))))

(assert (=> b!1238530 (= res!826216 (not e!701938))))

(declare-fun res!826214 () Bool)

(assert (=> b!1238530 (=> (not res!826214) (not e!701938))))

(assert (=> b!1238530 (= res!826214 (validKeyInArray!0 (select (arr!38511 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(assert (= (and d!135887 (not res!826215)) b!1238530))

(assert (= (and b!1238530 res!826214) b!1238528))

(assert (= (and b!1238530 res!826216) b!1238529))

(assert (= (and b!1238529 c!121016) b!1238527))

(assert (= (and b!1238529 (not c!121016)) b!1238526))

(assert (= (or b!1238527 b!1238526) bm!61064))

(declare-fun m!1142045 () Bool)

(assert (=> b!1238528 m!1142045))

(assert (=> b!1238528 m!1142045))

(declare-fun m!1142047 () Bool)

(assert (=> b!1238528 m!1142047))

(assert (=> b!1238529 m!1142045))

(assert (=> b!1238529 m!1142045))

(declare-fun m!1142049 () Bool)

(assert (=> b!1238529 m!1142049))

(assert (=> bm!61064 m!1142045))

(declare-fun m!1142051 () Bool)

(assert (=> bm!61064 m!1142051))

(assert (=> b!1238530 m!1142045))

(assert (=> b!1238530 m!1142045))

(assert (=> b!1238530 m!1142049))

(assert (=> b!1238343 d!135887))

(declare-fun d!135897 () Bool)

(assert (=> d!135897 (noDuplicate!1943 acc!846)))

(declare-fun lt!561318 () Unit!41108)

(declare-fun choose!1831 (List!27284 List!27284) Unit!41108)

(assert (=> d!135897 (= lt!561318 (choose!1831 acc!846 lt!561279))))

(declare-fun e!701944 () Bool)

(assert (=> d!135897 e!701944))

(declare-fun res!826219 () Bool)

(assert (=> d!135897 (=> (not res!826219) (not e!701944))))

(assert (=> d!135897 (= res!826219 (subseq!600 acc!846 lt!561279))))

(assert (=> d!135897 (= (noDuplicateSubseq!81 acc!846 lt!561279) lt!561318)))

(declare-fun b!1238533 () Bool)

(assert (=> b!1238533 (= e!701944 (noDuplicate!1943 lt!561279))))

(assert (= (and d!135897 res!826219) b!1238533))

(assert (=> d!135897 m!1141891))

(declare-fun m!1142053 () Bool)

(assert (=> d!135897 m!1142053))

(assert (=> d!135897 m!1141911))

(assert (=> b!1238533 m!1141895))

(assert (=> b!1238343 d!135897))

(declare-fun d!135899 () Bool)

(declare-fun lt!561319 () Bool)

(assert (=> d!135899 (= lt!561319 (select (content!590 acc!846) k0!2925))))

(declare-fun e!701947 () Bool)

(assert (=> d!135899 (= lt!561319 e!701947)))

(declare-fun res!826223 () Bool)

(assert (=> d!135899 (=> (not res!826223) (not e!701947))))

(assert (=> d!135899 (= res!826223 ((_ is Cons!27280) acc!846))))

(assert (=> d!135899 (= (contains!7346 acc!846 k0!2925) lt!561319)))

(declare-fun b!1238536 () Bool)

(declare-fun e!701948 () Bool)

(assert (=> b!1238536 (= e!701947 e!701948)))

(declare-fun res!826222 () Bool)

(assert (=> b!1238536 (=> res!826222 e!701948)))

(assert (=> b!1238536 (= res!826222 (= (h!28489 acc!846) k0!2925))))

(declare-fun b!1238537 () Bool)

(assert (=> b!1238537 (= e!701948 (contains!7346 (t!40747 acc!846) k0!2925))))

(assert (= (and d!135899 res!826223) b!1238536))

(assert (= (and b!1238536 (not res!826222)) b!1238537))

(assert (=> d!135899 m!1141957))

(declare-fun m!1142055 () Bool)

(assert (=> d!135899 m!1142055))

(declare-fun m!1142057 () Bool)

(assert (=> b!1238537 m!1142057))

(assert (=> b!1238346 d!135899))

(declare-fun b!1238550 () Bool)

(declare-fun e!701956 () Bool)

(declare-fun call!61068 () Bool)

(assert (=> b!1238550 (= e!701956 call!61068)))

(declare-fun b!1238551 () Bool)

(assert (=> b!1238551 (= e!701956 call!61068)))

(declare-fun d!135901 () Bool)

(declare-fun res!826225 () Bool)

(declare-fun e!701958 () Bool)

(assert (=> d!135901 (=> res!826225 e!701958)))

(assert (=> d!135901 (= res!826225 (bvsge from!3213 (size!39047 a!3835)))))

(assert (=> d!135901 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701958)))

(declare-fun e!701955 () Bool)

(declare-fun b!1238552 () Bool)

(assert (=> b!1238552 (= e!701955 (contains!7346 acc!846 (select (arr!38511 a!3835) from!3213)))))

(declare-fun b!1238553 () Bool)

(declare-fun e!701957 () Bool)

(assert (=> b!1238553 (= e!701957 e!701956)))

(declare-fun c!121023 () Bool)

(assert (=> b!1238553 (= c!121023 (validKeyInArray!0 (select (arr!38511 a!3835) from!3213)))))

(declare-fun bm!61065 () Bool)

(assert (=> bm!61065 (= call!61068 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121023 (Cons!27280 (select (arr!38511 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238554 () Bool)

(assert (=> b!1238554 (= e!701958 e!701957)))

(declare-fun res!826226 () Bool)

(assert (=> b!1238554 (=> (not res!826226) (not e!701957))))

(assert (=> b!1238554 (= res!826226 (not e!701955))))

(declare-fun res!826224 () Bool)

(assert (=> b!1238554 (=> (not res!826224) (not e!701955))))

(assert (=> b!1238554 (= res!826224 (validKeyInArray!0 (select (arr!38511 a!3835) from!3213)))))

(assert (= (and d!135901 (not res!826225)) b!1238554))

(assert (= (and b!1238554 res!826224) b!1238552))

(assert (= (and b!1238554 res!826226) b!1238553))

(assert (= (and b!1238553 c!121023) b!1238551))

(assert (= (and b!1238553 (not c!121023)) b!1238550))

(assert (= (or b!1238551 b!1238550) bm!61065))

(assert (=> b!1238552 m!1141901))

(assert (=> b!1238552 m!1141901))

(declare-fun m!1142059 () Bool)

(assert (=> b!1238552 m!1142059))

(assert (=> b!1238553 m!1141901))

(assert (=> b!1238553 m!1141901))

(assert (=> b!1238553 m!1141903))

(assert (=> bm!61065 m!1141901))

(declare-fun m!1142061 () Bool)

(assert (=> bm!61065 m!1142061))

(assert (=> b!1238554 m!1141901))

(assert (=> b!1238554 m!1141901))

(assert (=> b!1238554 m!1141903))

(assert (=> b!1238347 d!135901))

(declare-fun d!135903 () Bool)

(declare-fun res!826233 () Bool)

(declare-fun e!701971 () Bool)

(assert (=> d!135903 (=> res!826233 e!701971)))

(assert (=> d!135903 (= res!826233 ((_ is Nil!27281) lt!561279))))

(assert (=> d!135903 (= (noDuplicate!1943 lt!561279) e!701971)))

(declare-fun b!1238573 () Bool)

(declare-fun e!701972 () Bool)

(assert (=> b!1238573 (= e!701971 e!701972)))

(declare-fun res!826234 () Bool)

(assert (=> b!1238573 (=> (not res!826234) (not e!701972))))

(assert (=> b!1238573 (= res!826234 (not (contains!7346 (t!40747 lt!561279) (h!28489 lt!561279))))))

(declare-fun b!1238574 () Bool)

(assert (=> b!1238574 (= e!701972 (noDuplicate!1943 (t!40747 lt!561279)))))

(assert (= (and d!135903 (not res!826233)) b!1238573))

(assert (= (and b!1238573 res!826234) b!1238574))

(declare-fun m!1142063 () Bool)

(assert (=> b!1238573 m!1142063))

(declare-fun m!1142065 () Bool)

(assert (=> b!1238574 m!1142065))

(assert (=> b!1238345 d!135903))

(declare-fun d!135905 () Bool)

(declare-fun lt!561325 () Bool)

(assert (=> d!135905 (= lt!561325 (select (content!590 lt!561279) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701977 () Bool)

(assert (=> d!135905 (= lt!561325 e!701977)))

(declare-fun res!826237 () Bool)

(assert (=> d!135905 (=> (not res!826237) (not e!701977))))

(assert (=> d!135905 (= res!826237 ((_ is Cons!27280) lt!561279))))

(assert (=> d!135905 (= (contains!7346 lt!561279 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561325)))

(declare-fun b!1238582 () Bool)

(declare-fun e!701978 () Bool)

(assert (=> b!1238582 (= e!701977 e!701978)))

(declare-fun res!826236 () Bool)

(assert (=> b!1238582 (=> res!826236 e!701978)))

(assert (=> b!1238582 (= res!826236 (= (h!28489 lt!561279) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238583 () Bool)

(assert (=> b!1238583 (= e!701978 (contains!7346 (t!40747 lt!561279) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135905 res!826237) b!1238582))

(assert (= (and b!1238582 (not res!826236)) b!1238583))

(assert (=> d!135905 m!1141963))

(declare-fun m!1142067 () Bool)

(assert (=> d!135905 m!1142067))

(declare-fun m!1142069 () Bool)

(assert (=> b!1238583 m!1142069))

(assert (=> b!1238339 d!135905))

(declare-fun d!135907 () Bool)

(assert (=> d!135907 (= (validKeyInArray!0 (select (arr!38511 a!3835) from!3213)) (and (not (= (select (arr!38511 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38511 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1238337 d!135907))

(declare-fun d!135913 () Bool)

(declare-fun res!826242 () Bool)

(declare-fun e!701983 () Bool)

(assert (=> d!135913 (=> res!826242 e!701983)))

(assert (=> d!135913 (= res!826242 ((_ is Nil!27281) acc!846))))

(assert (=> d!135913 (= (noDuplicate!1943 acc!846) e!701983)))

(declare-fun b!1238588 () Bool)

(declare-fun e!701984 () Bool)

(assert (=> b!1238588 (= e!701983 e!701984)))

(declare-fun res!826243 () Bool)

(assert (=> b!1238588 (=> (not res!826243) (not e!701984))))

(assert (=> b!1238588 (= res!826243 (not (contains!7346 (t!40747 acc!846) (h!28489 acc!846))))))

(declare-fun b!1238589 () Bool)

(assert (=> b!1238589 (= e!701984 (noDuplicate!1943 (t!40747 acc!846)))))

(assert (= (and d!135913 (not res!826242)) b!1238588))

(assert (= (and b!1238588 res!826243) b!1238589))

(declare-fun m!1142085 () Bool)

(assert (=> b!1238588 m!1142085))

(declare-fun m!1142087 () Bool)

(assert (=> b!1238589 m!1142087))

(assert (=> b!1238348 d!135913))

(check-sat (not b!1238552) (not b!1238528) (not d!135905) (not bm!61064) (not b!1238530) (not b!1238408) (not b!1238407) (not b!1238537) (not d!135863) (not b!1238589) (not d!135885) (not d!135897) (not b!1238480) (not b!1238458) (not b!1238390) (not bm!61065) (not b!1238392) (not d!135851) (not b!1238533) (not b!1238463) (not b!1238554) (not d!135899) (not d!135883) (not b!1238478) (not bm!61058) (not b!1238553) (not b!1238588) (not b!1238477) (not b!1238529) (not b!1238583) (not b!1238459) (not b!1238573) (not b!1238574) (not d!135855))
(check-sat)
