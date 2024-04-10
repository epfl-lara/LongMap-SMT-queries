; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115942 () Bool)

(assert start!115942)

(declare-fun b!1370343 () Bool)

(declare-fun res!913793 () Bool)

(declare-fun e!776188 () Bool)

(assert (=> b!1370343 (=> (not res!913793) (not e!776188))))

(declare-datatypes ((List!31996 0))(
  ( (Nil!31993) (Cons!31992 (h!33201 (_ BitVec 64)) (t!46690 List!31996)) )
))
(declare-fun acc!866 () List!31996)

(declare-fun contains!9678 (List!31996 (_ BitVec 64)) Bool)

(assert (=> b!1370343 (= res!913793 (not (contains!9678 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370344 () Bool)

(declare-fun res!913785 () Bool)

(declare-fun e!776184 () Bool)

(assert (=> b!1370344 (=> (not res!913785) (not e!776184))))

(declare-datatypes ((array!93017 0))(
  ( (array!93018 (arr!44928 (Array (_ BitVec 32) (_ BitVec 64))) (size!45478 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93017)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1370344 (= res!913785 (not (contains!9678 acc!866 (select (arr!44928 a!3861) from!3239))))))

(declare-fun b!1370345 () Bool)

(assert (=> b!1370345 (= e!776188 e!776184)))

(declare-fun res!913789 () Bool)

(assert (=> b!1370345 (=> (not res!913789) (not e!776184))))

(declare-fun arrayNoDuplicates!0 (array!93017 (_ BitVec 32) List!31996) Bool)

(assert (=> b!1370345 (= res!913789 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45293 0))(
  ( (Unit!45294) )
))
(declare-fun lt!602424 () Unit!45293)

(declare-fun newAcc!98 () List!31996)

(declare-fun noDuplicateSubseq!267 (List!31996 List!31996) Unit!45293)

(assert (=> b!1370345 (= lt!602424 (noDuplicateSubseq!267 newAcc!98 acc!866))))

(declare-fun b!1370346 () Bool)

(declare-fun res!913786 () Bool)

(assert (=> b!1370346 (=> (not res!913786) (not e!776188))))

(assert (=> b!1370346 (= res!913786 (not (contains!9678 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370348 () Bool)

(declare-fun e!776187 () Bool)

(declare-fun lt!602425 () List!31996)

(assert (=> b!1370348 (= e!776187 (contains!9678 lt!602425 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370349 () Bool)

(declare-fun res!913795 () Bool)

(assert (=> b!1370349 (=> (not res!913795) (not e!776188))))

(assert (=> b!1370349 (= res!913795 (not (contains!9678 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370350 () Bool)

(declare-fun res!913787 () Bool)

(assert (=> b!1370350 (=> (not res!913787) (not e!776184))))

(assert (=> b!1370350 (= res!913787 (bvslt from!3239 (size!45478 a!3861)))))

(declare-fun b!1370351 () Bool)

(declare-fun res!913796 () Bool)

(assert (=> b!1370351 (=> (not res!913796) (not e!776188))))

(declare-fun noDuplicate!2535 (List!31996) Bool)

(assert (=> b!1370351 (= res!913796 (noDuplicate!2535 acc!866))))

(declare-fun b!1370352 () Bool)

(declare-fun res!913788 () Bool)

(declare-fun e!776185 () Bool)

(assert (=> b!1370352 (=> (not res!913788) (not e!776185))))

(assert (=> b!1370352 (= res!913788 (noDuplicate!2535 lt!602425))))

(declare-fun b!1370353 () Bool)

(declare-fun res!913792 () Bool)

(assert (=> b!1370353 (=> (not res!913792) (not e!776184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370353 (= res!913792 (validKeyInArray!0 (select (arr!44928 a!3861) from!3239)))))

(declare-fun b!1370354 () Bool)

(assert (=> b!1370354 (= e!776185 e!776187)))

(declare-fun res!913790 () Bool)

(assert (=> b!1370354 (=> res!913790 e!776187)))

(assert (=> b!1370354 (= res!913790 (contains!9678 lt!602425 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370347 () Bool)

(declare-fun res!913798 () Bool)

(assert (=> b!1370347 (=> (not res!913798) (not e!776188))))

(declare-fun subseq!1080 (List!31996 List!31996) Bool)

(assert (=> b!1370347 (= res!913798 (subseq!1080 newAcc!98 acc!866))))

(declare-fun res!913797 () Bool)

(assert (=> start!115942 (=> (not res!913797) (not e!776188))))

(assert (=> start!115942 (= res!913797 (and (bvslt (size!45478 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45478 a!3861))))))

(assert (=> start!115942 e!776188))

(declare-fun array_inv!33956 (array!93017) Bool)

(assert (=> start!115942 (array_inv!33956 a!3861)))

(assert (=> start!115942 true))

(declare-fun b!1370355 () Bool)

(declare-fun res!913794 () Bool)

(assert (=> b!1370355 (=> (not res!913794) (not e!776188))))

(assert (=> b!1370355 (= res!913794 (not (contains!9678 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370356 () Bool)

(assert (=> b!1370356 (= e!776184 e!776185)))

(declare-fun res!913791 () Bool)

(assert (=> b!1370356 (=> (not res!913791) (not e!776185))))

(assert (=> b!1370356 (= res!913791 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1370356 (= lt!602425 (Cons!31992 (select (arr!44928 a!3861) from!3239) acc!866))))

(assert (= (and start!115942 res!913797) b!1370351))

(assert (= (and b!1370351 res!913796) b!1370349))

(assert (= (and b!1370349 res!913795) b!1370343))

(assert (= (and b!1370343 res!913793) b!1370355))

(assert (= (and b!1370355 res!913794) b!1370346))

(assert (= (and b!1370346 res!913786) b!1370347))

(assert (= (and b!1370347 res!913798) b!1370345))

(assert (= (and b!1370345 res!913789) b!1370350))

(assert (= (and b!1370350 res!913787) b!1370353))

(assert (= (and b!1370353 res!913792) b!1370344))

(assert (= (and b!1370344 res!913785) b!1370356))

(assert (= (and b!1370356 res!913791) b!1370352))

(assert (= (and b!1370352 res!913788) b!1370354))

(assert (= (and b!1370354 (not res!913790)) b!1370348))

(declare-fun m!1253923 () Bool)

(assert (=> b!1370348 m!1253923))

(declare-fun m!1253925 () Bool)

(assert (=> b!1370344 m!1253925))

(assert (=> b!1370344 m!1253925))

(declare-fun m!1253927 () Bool)

(assert (=> b!1370344 m!1253927))

(declare-fun m!1253929 () Bool)

(assert (=> b!1370343 m!1253929))

(declare-fun m!1253931 () Bool)

(assert (=> start!115942 m!1253931))

(declare-fun m!1253933 () Bool)

(assert (=> b!1370345 m!1253933))

(declare-fun m!1253935 () Bool)

(assert (=> b!1370345 m!1253935))

(assert (=> b!1370353 m!1253925))

(assert (=> b!1370353 m!1253925))

(declare-fun m!1253937 () Bool)

(assert (=> b!1370353 m!1253937))

(declare-fun m!1253939 () Bool)

(assert (=> b!1370347 m!1253939))

(declare-fun m!1253941 () Bool)

(assert (=> b!1370352 m!1253941))

(declare-fun m!1253943 () Bool)

(assert (=> b!1370346 m!1253943))

(declare-fun m!1253945 () Bool)

(assert (=> b!1370351 m!1253945))

(declare-fun m!1253947 () Bool)

(assert (=> b!1370355 m!1253947))

(declare-fun m!1253949 () Bool)

(assert (=> b!1370349 m!1253949))

(declare-fun m!1253951 () Bool)

(assert (=> b!1370354 m!1253951))

(assert (=> b!1370356 m!1253925))

(check-sat (not b!1370354) (not b!1370351) (not b!1370344) (not b!1370347) (not b!1370349) (not b!1370343) (not b!1370355) (not b!1370352) (not b!1370353) (not start!115942) (not b!1370346) (not b!1370348) (not b!1370345))
(check-sat)
(get-model)

(declare-fun d!147155 () Bool)

(assert (=> d!147155 (= (array_inv!33956 a!3861) (bvsge (size!45478 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115942 d!147155))

(declare-fun b!1370409 () Bool)

(declare-fun e!776212 () Bool)

(assert (=> b!1370409 (= e!776212 (subseq!1080 (t!46690 newAcc!98) (t!46690 acc!866)))))

(declare-fun d!147157 () Bool)

(declare-fun res!913850 () Bool)

(declare-fun e!776215 () Bool)

(assert (=> d!147157 (=> res!913850 e!776215)))

(get-info :version)

(assert (=> d!147157 (= res!913850 ((_ is Nil!31993) newAcc!98))))

(assert (=> d!147157 (= (subseq!1080 newAcc!98 acc!866) e!776215)))

(declare-fun b!1370408 () Bool)

(declare-fun e!776214 () Bool)

(declare-fun e!776213 () Bool)

(assert (=> b!1370408 (= e!776214 e!776213)))

(declare-fun res!913849 () Bool)

(assert (=> b!1370408 (=> res!913849 e!776213)))

(assert (=> b!1370408 (= res!913849 e!776212)))

(declare-fun res!913851 () Bool)

(assert (=> b!1370408 (=> (not res!913851) (not e!776212))))

(assert (=> b!1370408 (= res!913851 (= (h!33201 newAcc!98) (h!33201 acc!866)))))

(declare-fun b!1370410 () Bool)

(assert (=> b!1370410 (= e!776213 (subseq!1080 newAcc!98 (t!46690 acc!866)))))

(declare-fun b!1370407 () Bool)

(assert (=> b!1370407 (= e!776215 e!776214)))

(declare-fun res!913852 () Bool)

(assert (=> b!1370407 (=> (not res!913852) (not e!776214))))

(assert (=> b!1370407 (= res!913852 ((_ is Cons!31992) acc!866))))

(assert (= (and d!147157 (not res!913850)) b!1370407))

(assert (= (and b!1370407 res!913852) b!1370408))

(assert (= (and b!1370408 res!913851) b!1370409))

(assert (= (and b!1370408 (not res!913849)) b!1370410))

(declare-fun m!1253983 () Bool)

(assert (=> b!1370409 m!1253983))

(declare-fun m!1253985 () Bool)

(assert (=> b!1370410 m!1253985))

(assert (=> b!1370347 d!147157))

(declare-fun d!147159 () Bool)

(declare-fun lt!602434 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!729 (List!31996) (InoxSet (_ BitVec 64)))

(assert (=> d!147159 (= lt!602434 (select (content!729 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776220 () Bool)

(assert (=> d!147159 (= lt!602434 e!776220)))

(declare-fun res!913858 () Bool)

(assert (=> d!147159 (=> (not res!913858) (not e!776220))))

(assert (=> d!147159 (= res!913858 ((_ is Cons!31992) newAcc!98))))

(assert (=> d!147159 (= (contains!9678 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602434)))

(declare-fun b!1370415 () Bool)

(declare-fun e!776221 () Bool)

(assert (=> b!1370415 (= e!776220 e!776221)))

(declare-fun res!913857 () Bool)

(assert (=> b!1370415 (=> res!913857 e!776221)))

(assert (=> b!1370415 (= res!913857 (= (h!33201 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370416 () Bool)

(assert (=> b!1370416 (= e!776221 (contains!9678 (t!46690 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147159 res!913858) b!1370415))

(assert (= (and b!1370415 (not res!913857)) b!1370416))

(declare-fun m!1253987 () Bool)

(assert (=> d!147159 m!1253987))

(declare-fun m!1253989 () Bool)

(assert (=> d!147159 m!1253989))

(declare-fun m!1253991 () Bool)

(assert (=> b!1370416 m!1253991))

(assert (=> b!1370346 d!147159))

(declare-fun d!147161 () Bool)

(declare-fun lt!602435 () Bool)

(assert (=> d!147161 (= lt!602435 (select (content!729 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776222 () Bool)

(assert (=> d!147161 (= lt!602435 e!776222)))

(declare-fun res!913860 () Bool)

(assert (=> d!147161 (=> (not res!913860) (not e!776222))))

(assert (=> d!147161 (= res!913860 ((_ is Cons!31992) acc!866))))

(assert (=> d!147161 (= (contains!9678 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602435)))

(declare-fun b!1370417 () Bool)

(declare-fun e!776223 () Bool)

(assert (=> b!1370417 (= e!776222 e!776223)))

(declare-fun res!913859 () Bool)

(assert (=> b!1370417 (=> res!913859 e!776223)))

(assert (=> b!1370417 (= res!913859 (= (h!33201 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370418 () Bool)

(assert (=> b!1370418 (= e!776223 (contains!9678 (t!46690 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147161 res!913860) b!1370417))

(assert (= (and b!1370417 (not res!913859)) b!1370418))

(declare-fun m!1253993 () Bool)

(assert (=> d!147161 m!1253993))

(declare-fun m!1253995 () Bool)

(assert (=> d!147161 m!1253995))

(declare-fun m!1253997 () Bool)

(assert (=> b!1370418 m!1253997))

(assert (=> b!1370349 d!147161))

(declare-fun d!147165 () Bool)

(declare-fun lt!602436 () Bool)

(assert (=> d!147165 (= lt!602436 (select (content!729 lt!602425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776224 () Bool)

(assert (=> d!147165 (= lt!602436 e!776224)))

(declare-fun res!913862 () Bool)

(assert (=> d!147165 (=> (not res!913862) (not e!776224))))

(assert (=> d!147165 (= res!913862 ((_ is Cons!31992) lt!602425))))

(assert (=> d!147165 (= (contains!9678 lt!602425 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602436)))

(declare-fun b!1370419 () Bool)

(declare-fun e!776225 () Bool)

(assert (=> b!1370419 (= e!776224 e!776225)))

(declare-fun res!913861 () Bool)

(assert (=> b!1370419 (=> res!913861 e!776225)))

(assert (=> b!1370419 (= res!913861 (= (h!33201 lt!602425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370420 () Bool)

(assert (=> b!1370420 (= e!776225 (contains!9678 (t!46690 lt!602425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147165 res!913862) b!1370419))

(assert (= (and b!1370419 (not res!913861)) b!1370420))

(declare-fun m!1253999 () Bool)

(assert (=> d!147165 m!1253999))

(declare-fun m!1254001 () Bool)

(assert (=> d!147165 m!1254001))

(declare-fun m!1254003 () Bool)

(assert (=> b!1370420 m!1254003))

(assert (=> b!1370348 d!147165))

(declare-fun d!147169 () Bool)

(assert (=> d!147169 (= (validKeyInArray!0 (select (arr!44928 a!3861) from!3239)) (and (not (= (select (arr!44928 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44928 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1370353 d!147169))

(declare-fun d!147171 () Bool)

(declare-fun res!913879 () Bool)

(declare-fun e!776244 () Bool)

(assert (=> d!147171 (=> res!913879 e!776244)))

(assert (=> d!147171 (= res!913879 ((_ is Nil!31993) lt!602425))))

(assert (=> d!147171 (= (noDuplicate!2535 lt!602425) e!776244)))

(declare-fun b!1370441 () Bool)

(declare-fun e!776245 () Bool)

(assert (=> b!1370441 (= e!776244 e!776245)))

(declare-fun res!913880 () Bool)

(assert (=> b!1370441 (=> (not res!913880) (not e!776245))))

(assert (=> b!1370441 (= res!913880 (not (contains!9678 (t!46690 lt!602425) (h!33201 lt!602425))))))

(declare-fun b!1370442 () Bool)

(assert (=> b!1370442 (= e!776245 (noDuplicate!2535 (t!46690 lt!602425)))))

(assert (= (and d!147171 (not res!913879)) b!1370441))

(assert (= (and b!1370441 res!913880) b!1370442))

(declare-fun m!1254009 () Bool)

(assert (=> b!1370441 m!1254009))

(declare-fun m!1254011 () Bool)

(assert (=> b!1370442 m!1254011))

(assert (=> b!1370352 d!147171))

(declare-fun d!147175 () Bool)

(declare-fun res!913881 () Bool)

(declare-fun e!776246 () Bool)

(assert (=> d!147175 (=> res!913881 e!776246)))

(assert (=> d!147175 (= res!913881 ((_ is Nil!31993) acc!866))))

(assert (=> d!147175 (= (noDuplicate!2535 acc!866) e!776246)))

(declare-fun b!1370443 () Bool)

(declare-fun e!776247 () Bool)

(assert (=> b!1370443 (= e!776246 e!776247)))

(declare-fun res!913882 () Bool)

(assert (=> b!1370443 (=> (not res!913882) (not e!776247))))

(assert (=> b!1370443 (= res!913882 (not (contains!9678 (t!46690 acc!866) (h!33201 acc!866))))))

(declare-fun b!1370444 () Bool)

(assert (=> b!1370444 (= e!776247 (noDuplicate!2535 (t!46690 acc!866)))))

(assert (= (and d!147175 (not res!913881)) b!1370443))

(assert (= (and b!1370443 res!913882) b!1370444))

(declare-fun m!1254013 () Bool)

(assert (=> b!1370443 m!1254013))

(declare-fun m!1254015 () Bool)

(assert (=> b!1370444 m!1254015))

(assert (=> b!1370351 d!147175))

(declare-fun call!65533 () Bool)

(declare-fun c!127726 () Bool)

(declare-fun bm!65530 () Bool)

(assert (=> bm!65530 (= call!65533 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127726 (Cons!31992 (select (arr!44928 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370479 () Bool)

(declare-fun e!776277 () Bool)

(assert (=> b!1370479 (= e!776277 call!65533)))

(declare-fun b!1370480 () Bool)

(declare-fun e!776278 () Bool)

(assert (=> b!1370480 (= e!776278 (contains!9678 acc!866 (select (arr!44928 a!3861) from!3239)))))

(declare-fun b!1370481 () Bool)

(declare-fun e!776279 () Bool)

(declare-fun e!776280 () Bool)

(assert (=> b!1370481 (= e!776279 e!776280)))

(declare-fun res!913909 () Bool)

(assert (=> b!1370481 (=> (not res!913909) (not e!776280))))

(assert (=> b!1370481 (= res!913909 (not e!776278))))

(declare-fun res!913907 () Bool)

(assert (=> b!1370481 (=> (not res!913907) (not e!776278))))

(assert (=> b!1370481 (= res!913907 (validKeyInArray!0 (select (arr!44928 a!3861) from!3239)))))

(declare-fun b!1370482 () Bool)

(assert (=> b!1370482 (= e!776280 e!776277)))

(assert (=> b!1370482 (= c!127726 (validKeyInArray!0 (select (arr!44928 a!3861) from!3239)))))

(declare-fun d!147177 () Bool)

(declare-fun res!913908 () Bool)

(assert (=> d!147177 (=> res!913908 e!776279)))

(assert (=> d!147177 (= res!913908 (bvsge from!3239 (size!45478 a!3861)))))

(assert (=> d!147177 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776279)))

(declare-fun b!1370483 () Bool)

(assert (=> b!1370483 (= e!776277 call!65533)))

(assert (= (and d!147177 (not res!913908)) b!1370481))

(assert (= (and b!1370481 res!913907) b!1370480))

(assert (= (and b!1370481 res!913909) b!1370482))

(assert (= (and b!1370482 c!127726) b!1370483))

(assert (= (and b!1370482 (not c!127726)) b!1370479))

(assert (= (or b!1370483 b!1370479) bm!65530))

(assert (=> bm!65530 m!1253925))

(declare-fun m!1254029 () Bool)

(assert (=> bm!65530 m!1254029))

(assert (=> b!1370480 m!1253925))

(assert (=> b!1370480 m!1253925))

(assert (=> b!1370480 m!1253927))

(assert (=> b!1370481 m!1253925))

(assert (=> b!1370481 m!1253925))

(assert (=> b!1370481 m!1253937))

(assert (=> b!1370482 m!1253925))

(assert (=> b!1370482 m!1253925))

(assert (=> b!1370482 m!1253937))

(assert (=> b!1370345 d!147177))

(declare-fun d!147185 () Bool)

(assert (=> d!147185 (noDuplicate!2535 newAcc!98)))

(declare-fun lt!602445 () Unit!45293)

(declare-fun choose!2008 (List!31996 List!31996) Unit!45293)

(assert (=> d!147185 (= lt!602445 (choose!2008 newAcc!98 acc!866))))

(declare-fun e!776293 () Bool)

(assert (=> d!147185 e!776293))

(declare-fun res!913921 () Bool)

(assert (=> d!147185 (=> (not res!913921) (not e!776293))))

(assert (=> d!147185 (= res!913921 (subseq!1080 newAcc!98 acc!866))))

(assert (=> d!147185 (= (noDuplicateSubseq!267 newAcc!98 acc!866) lt!602445)))

(declare-fun b!1370497 () Bool)

(assert (=> b!1370497 (= e!776293 (noDuplicate!2535 acc!866))))

(assert (= (and d!147185 res!913921) b!1370497))

(declare-fun m!1254037 () Bool)

(assert (=> d!147185 m!1254037))

(declare-fun m!1254039 () Bool)

(assert (=> d!147185 m!1254039))

(assert (=> d!147185 m!1253939))

(assert (=> b!1370497 m!1253945))

(assert (=> b!1370345 d!147185))

(declare-fun lt!602446 () Bool)

(declare-fun d!147191 () Bool)

(assert (=> d!147191 (= lt!602446 (select (content!729 acc!866) (select (arr!44928 a!3861) from!3239)))))

(declare-fun e!776294 () Bool)

(assert (=> d!147191 (= lt!602446 e!776294)))

(declare-fun res!913923 () Bool)

(assert (=> d!147191 (=> (not res!913923) (not e!776294))))

(assert (=> d!147191 (= res!913923 ((_ is Cons!31992) acc!866))))

(assert (=> d!147191 (= (contains!9678 acc!866 (select (arr!44928 a!3861) from!3239)) lt!602446)))

(declare-fun b!1370498 () Bool)

(declare-fun e!776295 () Bool)

(assert (=> b!1370498 (= e!776294 e!776295)))

(declare-fun res!913922 () Bool)

(assert (=> b!1370498 (=> res!913922 e!776295)))

(assert (=> b!1370498 (= res!913922 (= (h!33201 acc!866) (select (arr!44928 a!3861) from!3239)))))

(declare-fun b!1370499 () Bool)

(assert (=> b!1370499 (= e!776295 (contains!9678 (t!46690 acc!866) (select (arr!44928 a!3861) from!3239)))))

(assert (= (and d!147191 res!913923) b!1370498))

(assert (= (and b!1370498 (not res!913922)) b!1370499))

(assert (=> d!147191 m!1253993))

(assert (=> d!147191 m!1253925))

(declare-fun m!1254041 () Bool)

(assert (=> d!147191 m!1254041))

(assert (=> b!1370499 m!1253925))

(declare-fun m!1254043 () Bool)

(assert (=> b!1370499 m!1254043))

(assert (=> b!1370344 d!147191))

(declare-fun d!147193 () Bool)

(declare-fun lt!602449 () Bool)

(assert (=> d!147193 (= lt!602449 (select (content!729 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776298 () Bool)

(assert (=> d!147193 (= lt!602449 e!776298)))

(declare-fun res!913927 () Bool)

(assert (=> d!147193 (=> (not res!913927) (not e!776298))))

(assert (=> d!147193 (= res!913927 ((_ is Cons!31992) newAcc!98))))

(assert (=> d!147193 (= (contains!9678 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602449)))

(declare-fun b!1370502 () Bool)

(declare-fun e!776299 () Bool)

(assert (=> b!1370502 (= e!776298 e!776299)))

(declare-fun res!913926 () Bool)

(assert (=> b!1370502 (=> res!913926 e!776299)))

(assert (=> b!1370502 (= res!913926 (= (h!33201 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370503 () Bool)

(assert (=> b!1370503 (= e!776299 (contains!9678 (t!46690 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147193 res!913927) b!1370502))

(assert (= (and b!1370502 (not res!913926)) b!1370503))

(assert (=> d!147193 m!1253987))

(declare-fun m!1254045 () Bool)

(assert (=> d!147193 m!1254045))

(declare-fun m!1254047 () Bool)

(assert (=> b!1370503 m!1254047))

(assert (=> b!1370355 d!147193))

(declare-fun d!147195 () Bool)

(declare-fun lt!602450 () Bool)

(assert (=> d!147195 (= lt!602450 (select (content!729 lt!602425) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776302 () Bool)

(assert (=> d!147195 (= lt!602450 e!776302)))

(declare-fun res!913931 () Bool)

(assert (=> d!147195 (=> (not res!913931) (not e!776302))))

(assert (=> d!147195 (= res!913931 ((_ is Cons!31992) lt!602425))))

(assert (=> d!147195 (= (contains!9678 lt!602425 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602450)))

(declare-fun b!1370506 () Bool)

(declare-fun e!776303 () Bool)

(assert (=> b!1370506 (= e!776302 e!776303)))

(declare-fun res!913930 () Bool)

(assert (=> b!1370506 (=> res!913930 e!776303)))

(assert (=> b!1370506 (= res!913930 (= (h!33201 lt!602425) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370507 () Bool)

(assert (=> b!1370507 (= e!776303 (contains!9678 (t!46690 lt!602425) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147195 res!913931) b!1370506))

(assert (= (and b!1370506 (not res!913930)) b!1370507))

(assert (=> d!147195 m!1253999))

(declare-fun m!1254049 () Bool)

(assert (=> d!147195 m!1254049))

(declare-fun m!1254051 () Bool)

(assert (=> b!1370507 m!1254051))

(assert (=> b!1370354 d!147195))

(declare-fun d!147197 () Bool)

(declare-fun lt!602453 () Bool)

(assert (=> d!147197 (= lt!602453 (select (content!729 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776306 () Bool)

(assert (=> d!147197 (= lt!602453 e!776306)))

(declare-fun res!913935 () Bool)

(assert (=> d!147197 (=> (not res!913935) (not e!776306))))

(assert (=> d!147197 (= res!913935 ((_ is Cons!31992) acc!866))))

(assert (=> d!147197 (= (contains!9678 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602453)))

(declare-fun b!1370510 () Bool)

(declare-fun e!776307 () Bool)

(assert (=> b!1370510 (= e!776306 e!776307)))

(declare-fun res!913934 () Bool)

(assert (=> b!1370510 (=> res!913934 e!776307)))

(assert (=> b!1370510 (= res!913934 (= (h!33201 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370511 () Bool)

(assert (=> b!1370511 (= e!776307 (contains!9678 (t!46690 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147197 res!913935) b!1370510))

(assert (= (and b!1370510 (not res!913934)) b!1370511))

(assert (=> d!147197 m!1253993))

(declare-fun m!1254053 () Bool)

(assert (=> d!147197 m!1254053))

(declare-fun m!1254055 () Bool)

(assert (=> b!1370511 m!1254055))

(assert (=> b!1370343 d!147197))

(check-sat (not b!1370482) (not d!147159) (not d!147191) (not bm!65530) (not d!147193) (not b!1370420) (not b!1370507) (not b!1370418) (not b!1370443) (not d!147165) (not d!147161) (not b!1370441) (not b!1370416) (not b!1370503) (not b!1370499) (not b!1370442) (not b!1370511) (not d!147185) (not b!1370497) (not b!1370480) (not b!1370481) (not d!147197) (not b!1370409) (not b!1370410) (not d!147195) (not b!1370444))
(check-sat)
