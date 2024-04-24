; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103144 () Bool)

(assert start!103144)

(declare-fun b!1238093 () Bool)

(declare-fun res!825289 () Bool)

(declare-fun e!701791 () Bool)

(assert (=> b!1238093 (=> (not res!825289) (not e!701791))))

(declare-datatypes ((List!27281 0))(
  ( (Nil!27278) (Cons!27277 (h!28495 (_ BitVec 64)) (t!40736 List!27281)) )
))
(declare-fun acc!846 () List!27281)

(declare-fun contains!7352 (List!27281 (_ BitVec 64)) Bool)

(assert (=> b!1238093 (= res!825289 (not (contains!7352 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238094 () Bool)

(declare-fun lt!561366 () List!27281)

(declare-fun subseq!572 (List!27281 List!27281) Bool)

(assert (=> b!1238094 (= e!701791 (not (subseq!572 acc!846 lt!561366)))))

(declare-datatypes ((Unit!41003 0))(
  ( (Unit!41004) )
))
(declare-fun lt!561368 () Unit!41003)

(declare-fun subseqTail!59 (List!27281 List!27281) Unit!41003)

(assert (=> b!1238094 (= lt!561368 (subseqTail!59 lt!561366 lt!561366))))

(assert (=> b!1238094 (subseq!572 lt!561366 lt!561366)))

(declare-fun lt!561367 () Unit!41003)

(declare-fun lemmaListSubSeqRefl!0 (List!27281) Unit!41003)

(assert (=> b!1238094 (= lt!561367 (lemmaListSubSeqRefl!0 lt!561366))))

(declare-datatypes ((array!79787 0))(
  ( (array!79788 (arr!38495 (Array (_ BitVec 32) (_ BitVec 64))) (size!39032 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79787)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238094 (= lt!561366 (Cons!27277 (select (arr!38495 a!3835) from!3213) acc!846))))

(declare-fun b!1238095 () Bool)

(declare-fun res!825285 () Bool)

(assert (=> b!1238095 (=> (not res!825285) (not e!701791))))

(assert (=> b!1238095 (= res!825285 (not (contains!7352 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238096 () Bool)

(declare-fun res!825288 () Bool)

(assert (=> b!1238096 (=> (not res!825288) (not e!701791))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238096 (= res!825288 (contains!7352 acc!846 k0!2925))))

(declare-fun b!1238097 () Bool)

(declare-fun res!825284 () Bool)

(assert (=> b!1238097 (=> (not res!825284) (not e!701791))))

(assert (=> b!1238097 (= res!825284 (not (= from!3213 (bvsub (size!39032 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!825290 () Bool)

(assert (=> start!103144 (=> (not res!825290) (not e!701791))))

(assert (=> start!103144 (= res!825290 (and (bvslt (size!39032 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39032 a!3835))))))

(assert (=> start!103144 e!701791))

(declare-fun array_inv!29433 (array!79787) Bool)

(assert (=> start!103144 (array_inv!29433 a!3835)))

(assert (=> start!103144 true))

(declare-fun b!1238098 () Bool)

(declare-fun res!825287 () Bool)

(assert (=> b!1238098 (=> (not res!825287) (not e!701791))))

(declare-fun arrayNoDuplicates!0 (array!79787 (_ BitVec 32) List!27281) Bool)

(assert (=> b!1238098 (= res!825287 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238099 () Bool)

(declare-fun res!825291 () Bool)

(assert (=> b!1238099 (=> (not res!825291) (not e!701791))))

(declare-fun noDuplicate!1933 (List!27281) Bool)

(assert (=> b!1238099 (= res!825291 (noDuplicate!1933 acc!846))))

(declare-fun b!1238100 () Bool)

(declare-fun res!825286 () Bool)

(assert (=> b!1238100 (=> (not res!825286) (not e!701791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238100 (= res!825286 (validKeyInArray!0 (select (arr!38495 a!3835) from!3213)))))

(assert (= (and start!103144 res!825290) b!1238099))

(assert (= (and b!1238099 res!825291) b!1238095))

(assert (= (and b!1238095 res!825285) b!1238093))

(assert (= (and b!1238093 res!825289) b!1238098))

(assert (= (and b!1238098 res!825287) b!1238096))

(assert (= (and b!1238096 res!825288) b!1238097))

(assert (= (and b!1238097 res!825284) b!1238100))

(assert (= (and b!1238100 res!825286) b!1238094))

(declare-fun m!1142165 () Bool)

(assert (=> b!1238098 m!1142165))

(declare-fun m!1142167 () Bool)

(assert (=> b!1238095 m!1142167))

(declare-fun m!1142169 () Bool)

(assert (=> b!1238099 m!1142169))

(declare-fun m!1142171 () Bool)

(assert (=> b!1238093 m!1142171))

(declare-fun m!1142173 () Bool)

(assert (=> b!1238100 m!1142173))

(assert (=> b!1238100 m!1142173))

(declare-fun m!1142175 () Bool)

(assert (=> b!1238100 m!1142175))

(declare-fun m!1142177 () Bool)

(assert (=> b!1238096 m!1142177))

(declare-fun m!1142179 () Bool)

(assert (=> b!1238094 m!1142179))

(declare-fun m!1142181 () Bool)

(assert (=> b!1238094 m!1142181))

(declare-fun m!1142183 () Bool)

(assert (=> b!1238094 m!1142183))

(declare-fun m!1142185 () Bool)

(assert (=> b!1238094 m!1142185))

(assert (=> b!1238094 m!1142173))

(declare-fun m!1142187 () Bool)

(assert (=> start!103144 m!1142187))

(check-sat (not b!1238098) (not b!1238093) (not b!1238095) (not start!103144) (not b!1238094) (not b!1238100) (not b!1238096) (not b!1238099))
(check-sat)
(get-model)

(declare-fun d!135969 () Bool)

(declare-fun lt!561389 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!582 (List!27281) (InoxSet (_ BitVec 64)))

(assert (=> d!135969 (= lt!561389 (select (content!582 acc!846) k0!2925))))

(declare-fun e!701809 () Bool)

(assert (=> d!135969 (= lt!561389 e!701809)))

(declare-fun res!825345 () Bool)

(assert (=> d!135969 (=> (not res!825345) (not e!701809))))

(get-info :version)

(assert (=> d!135969 (= res!825345 ((_ is Cons!27277) acc!846))))

(assert (=> d!135969 (= (contains!7352 acc!846 k0!2925) lt!561389)))

(declare-fun b!1238153 () Bool)

(declare-fun e!701810 () Bool)

(assert (=> b!1238153 (= e!701809 e!701810)))

(declare-fun res!825344 () Bool)

(assert (=> b!1238153 (=> res!825344 e!701810)))

(assert (=> b!1238153 (= res!825344 (= (h!28495 acc!846) k0!2925))))

(declare-fun b!1238154 () Bool)

(assert (=> b!1238154 (= e!701810 (contains!7352 (t!40736 acc!846) k0!2925))))

(assert (= (and d!135969 res!825345) b!1238153))

(assert (= (and b!1238153 (not res!825344)) b!1238154))

(declare-fun m!1142237 () Bool)

(assert (=> d!135969 m!1142237))

(declare-fun m!1142239 () Bool)

(assert (=> d!135969 m!1142239))

(declare-fun m!1142241 () Bool)

(assert (=> b!1238154 m!1142241))

(assert (=> b!1238096 d!135969))

(declare-fun d!135971 () Bool)

(assert (=> d!135971 (= (array_inv!29433 a!3835) (bvsge (size!39032 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103144 d!135971))

(declare-fun d!135973 () Bool)

(declare-fun lt!561390 () Bool)

(assert (=> d!135973 (= lt!561390 (select (content!582 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701811 () Bool)

(assert (=> d!135973 (= lt!561390 e!701811)))

(declare-fun res!825347 () Bool)

(assert (=> d!135973 (=> (not res!825347) (not e!701811))))

(assert (=> d!135973 (= res!825347 ((_ is Cons!27277) acc!846))))

(assert (=> d!135973 (= (contains!7352 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561390)))

(declare-fun b!1238155 () Bool)

(declare-fun e!701812 () Bool)

(assert (=> b!1238155 (= e!701811 e!701812)))

(declare-fun res!825346 () Bool)

(assert (=> b!1238155 (=> res!825346 e!701812)))

(assert (=> b!1238155 (= res!825346 (= (h!28495 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238156 () Bool)

(assert (=> b!1238156 (= e!701812 (contains!7352 (t!40736 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135973 res!825347) b!1238155))

(assert (= (and b!1238155 (not res!825346)) b!1238156))

(assert (=> d!135973 m!1142237))

(declare-fun m!1142243 () Bool)

(assert (=> d!135973 m!1142243))

(declare-fun m!1142245 () Bool)

(assert (=> b!1238156 m!1142245))

(assert (=> b!1238095 d!135973))

(declare-fun d!135975 () Bool)

(assert (=> d!135975 (= (validKeyInArray!0 (select (arr!38495 a!3835) from!3213)) (and (not (= (select (arr!38495 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38495 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1238100 d!135975))

(declare-fun b!1238167 () Bool)

(declare-fun e!701823 () Bool)

(assert (=> b!1238167 (= e!701823 (subseq!572 (t!40736 acc!846) (t!40736 lt!561366)))))

(declare-fun b!1238166 () Bool)

(declare-fun e!701822 () Bool)

(declare-fun e!701824 () Bool)

(assert (=> b!1238166 (= e!701822 e!701824)))

(declare-fun res!825359 () Bool)

(assert (=> b!1238166 (=> res!825359 e!701824)))

(assert (=> b!1238166 (= res!825359 e!701823)))

(declare-fun res!825356 () Bool)

(assert (=> b!1238166 (=> (not res!825356) (not e!701823))))

(assert (=> b!1238166 (= res!825356 (= (h!28495 acc!846) (h!28495 lt!561366)))))

(declare-fun b!1238165 () Bool)

(declare-fun e!701821 () Bool)

(assert (=> b!1238165 (= e!701821 e!701822)))

(declare-fun res!825358 () Bool)

(assert (=> b!1238165 (=> (not res!825358) (not e!701822))))

(assert (=> b!1238165 (= res!825358 ((_ is Cons!27277) lt!561366))))

(declare-fun b!1238168 () Bool)

(assert (=> b!1238168 (= e!701824 (subseq!572 acc!846 (t!40736 lt!561366)))))

(declare-fun d!135977 () Bool)

(declare-fun res!825357 () Bool)

(assert (=> d!135977 (=> res!825357 e!701821)))

(assert (=> d!135977 (= res!825357 ((_ is Nil!27278) acc!846))))

(assert (=> d!135977 (= (subseq!572 acc!846 lt!561366) e!701821)))

(assert (= (and d!135977 (not res!825357)) b!1238165))

(assert (= (and b!1238165 res!825358) b!1238166))

(assert (= (and b!1238166 res!825356) b!1238167))

(assert (= (and b!1238166 (not res!825359)) b!1238168))

(declare-fun m!1142247 () Bool)

(assert (=> b!1238167 m!1142247))

(declare-fun m!1142249 () Bool)

(assert (=> b!1238168 m!1142249))

(assert (=> b!1238094 d!135977))

(declare-fun bm!61064 () Bool)

(declare-fun call!61067 () Unit!41003)

(declare-fun c!121282 () Bool)

(assert (=> bm!61064 (= call!61067 (subseqTail!59 (ite c!121282 lt!561366 (t!40736 lt!561366)) (t!40736 lt!561366)))))

(declare-fun b!1238205 () Bool)

(declare-fun e!701854 () Unit!41003)

(assert (=> b!1238205 (= e!701854 call!61067)))

(declare-fun b!1238206 () Bool)

(declare-fun e!701856 () Unit!41003)

(declare-fun Unit!41009 () Unit!41003)

(assert (=> b!1238206 (= e!701856 Unit!41009)))

(declare-fun b!1238207 () Bool)

(declare-fun c!121281 () Bool)

(declare-fun isEmpty!1010 (List!27281) Bool)

(assert (=> b!1238207 (= c!121281 (not (isEmpty!1010 (t!40736 lt!561366))))))

(declare-fun e!701853 () Unit!41003)

(assert (=> b!1238207 (= e!701854 e!701853)))

(declare-fun b!1238208 () Bool)

(assert (=> b!1238208 (= e!701856 e!701854)))

(assert (=> b!1238208 (= c!121282 (subseq!572 lt!561366 (t!40736 lt!561366)))))

(declare-fun d!135981 () Bool)

(declare-fun tail!158 (List!27281) List!27281)

(assert (=> d!135981 (subseq!572 (tail!158 lt!561366) lt!561366)))

(declare-fun lt!561393 () Unit!41003)

(assert (=> d!135981 (= lt!561393 e!701856)))

(declare-fun c!121280 () Bool)

(assert (=> d!135981 (= c!121280 (and ((_ is Cons!27277) lt!561366) ((_ is Cons!27277) lt!561366)))))

(declare-fun e!701855 () Bool)

(assert (=> d!135981 e!701855))

(declare-fun res!825380 () Bool)

(assert (=> d!135981 (=> (not res!825380) (not e!701855))))

(assert (=> d!135981 (= res!825380 (not (isEmpty!1010 lt!561366)))))

(assert (=> d!135981 (= (subseqTail!59 lt!561366 lt!561366) lt!561393)))

(declare-fun b!1238209 () Bool)

(assert (=> b!1238209 (= e!701855 (subseq!572 lt!561366 lt!561366))))

(declare-fun b!1238210 () Bool)

(assert (=> b!1238210 (= e!701853 call!61067)))

(declare-fun b!1238211 () Bool)

(declare-fun Unit!41010 () Unit!41003)

(assert (=> b!1238211 (= e!701853 Unit!41010)))

(assert (= (and d!135981 res!825380) b!1238209))

(assert (= (and d!135981 c!121280) b!1238208))

(assert (= (and d!135981 (not c!121280)) b!1238206))

(assert (= (and b!1238208 c!121282) b!1238205))

(assert (= (and b!1238208 (not c!121282)) b!1238207))

(assert (= (and b!1238207 c!121281) b!1238210))

(assert (= (and b!1238207 (not c!121281)) b!1238211))

(assert (= (or b!1238205 b!1238210) bm!61064))

(declare-fun m!1142255 () Bool)

(assert (=> bm!61064 m!1142255))

(assert (=> b!1238209 m!1142185))

(declare-fun m!1142257 () Bool)

(assert (=> d!135981 m!1142257))

(assert (=> d!135981 m!1142257))

(declare-fun m!1142259 () Bool)

(assert (=> d!135981 m!1142259))

(declare-fun m!1142261 () Bool)

(assert (=> d!135981 m!1142261))

(declare-fun m!1142263 () Bool)

(assert (=> b!1238207 m!1142263))

(declare-fun m!1142265 () Bool)

(assert (=> b!1238208 m!1142265))

(assert (=> b!1238094 d!135981))

(declare-fun b!1238214 () Bool)

(declare-fun e!701859 () Bool)

(assert (=> b!1238214 (= e!701859 (subseq!572 (t!40736 lt!561366) (t!40736 lt!561366)))))

(declare-fun b!1238213 () Bool)

(declare-fun e!701858 () Bool)

(declare-fun e!701860 () Bool)

(assert (=> b!1238213 (= e!701858 e!701860)))

(declare-fun res!825384 () Bool)

(assert (=> b!1238213 (=> res!825384 e!701860)))

(assert (=> b!1238213 (= res!825384 e!701859)))

(declare-fun res!825381 () Bool)

(assert (=> b!1238213 (=> (not res!825381) (not e!701859))))

(assert (=> b!1238213 (= res!825381 (= (h!28495 lt!561366) (h!28495 lt!561366)))))

(declare-fun b!1238212 () Bool)

(declare-fun e!701857 () Bool)

(assert (=> b!1238212 (= e!701857 e!701858)))

(declare-fun res!825383 () Bool)

(assert (=> b!1238212 (=> (not res!825383) (not e!701858))))

(assert (=> b!1238212 (= res!825383 ((_ is Cons!27277) lt!561366))))

(declare-fun b!1238215 () Bool)

(assert (=> b!1238215 (= e!701860 (subseq!572 lt!561366 (t!40736 lt!561366)))))

(declare-fun d!135989 () Bool)

(declare-fun res!825382 () Bool)

(assert (=> d!135989 (=> res!825382 e!701857)))

(assert (=> d!135989 (= res!825382 ((_ is Nil!27278) lt!561366))))

(assert (=> d!135989 (= (subseq!572 lt!561366 lt!561366) e!701857)))

(assert (= (and d!135989 (not res!825382)) b!1238212))

(assert (= (and b!1238212 res!825383) b!1238213))

(assert (= (and b!1238213 res!825381) b!1238214))

(assert (= (and b!1238213 (not res!825384)) b!1238215))

(declare-fun m!1142267 () Bool)

(assert (=> b!1238214 m!1142267))

(assert (=> b!1238215 m!1142265))

(assert (=> b!1238094 d!135989))

(declare-fun d!135991 () Bool)

(assert (=> d!135991 (subseq!572 lt!561366 lt!561366)))

(declare-fun lt!561396 () Unit!41003)

(declare-fun choose!36 (List!27281) Unit!41003)

(assert (=> d!135991 (= lt!561396 (choose!36 lt!561366))))

(assert (=> d!135991 (= (lemmaListSubSeqRefl!0 lt!561366) lt!561396)))

(declare-fun bs!34799 () Bool)

(assert (= bs!34799 d!135991))

(assert (=> bs!34799 m!1142185))

(declare-fun m!1142273 () Bool)

(assert (=> bs!34799 m!1142273))

(assert (=> b!1238094 d!135991))

(declare-fun d!135995 () Bool)

(declare-fun res!825398 () Bool)

(declare-fun e!701881 () Bool)

(assert (=> d!135995 (=> res!825398 e!701881)))

(assert (=> d!135995 (= res!825398 ((_ is Nil!27278) acc!846))))

(assert (=> d!135995 (= (noDuplicate!1933 acc!846) e!701881)))

(declare-fun b!1238243 () Bool)

(declare-fun e!701882 () Bool)

(assert (=> b!1238243 (= e!701881 e!701882)))

(declare-fun res!825399 () Bool)

(assert (=> b!1238243 (=> (not res!825399) (not e!701882))))

(assert (=> b!1238243 (= res!825399 (not (contains!7352 (t!40736 acc!846) (h!28495 acc!846))))))

(declare-fun b!1238244 () Bool)

(assert (=> b!1238244 (= e!701882 (noDuplicate!1933 (t!40736 acc!846)))))

(assert (= (and d!135995 (not res!825398)) b!1238243))

(assert (= (and b!1238243 res!825399) b!1238244))

(declare-fun m!1142275 () Bool)

(assert (=> b!1238243 m!1142275))

(declare-fun m!1142277 () Bool)

(assert (=> b!1238244 m!1142277))

(assert (=> b!1238099 d!135995))

(declare-fun d!135997 () Bool)

(declare-fun lt!561399 () Bool)

(assert (=> d!135997 (= lt!561399 (select (content!582 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701883 () Bool)

(assert (=> d!135997 (= lt!561399 e!701883)))

(declare-fun res!825401 () Bool)

(assert (=> d!135997 (=> (not res!825401) (not e!701883))))

(assert (=> d!135997 (= res!825401 ((_ is Cons!27277) acc!846))))

(assert (=> d!135997 (= (contains!7352 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561399)))

(declare-fun b!1238245 () Bool)

(declare-fun e!701884 () Bool)

(assert (=> b!1238245 (= e!701883 e!701884)))

(declare-fun res!825400 () Bool)

(assert (=> b!1238245 (=> res!825400 e!701884)))

(assert (=> b!1238245 (= res!825400 (= (h!28495 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238246 () Bool)

(assert (=> b!1238246 (= e!701884 (contains!7352 (t!40736 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135997 res!825401) b!1238245))

(assert (= (and b!1238245 (not res!825400)) b!1238246))

(assert (=> d!135997 m!1142237))

(declare-fun m!1142279 () Bool)

(assert (=> d!135997 m!1142279))

(declare-fun m!1142281 () Bool)

(assert (=> b!1238246 m!1142281))

(assert (=> b!1238093 d!135997))

(declare-fun b!1238278 () Bool)

(declare-fun e!701913 () Bool)

(declare-fun e!701914 () Bool)

(assert (=> b!1238278 (= e!701913 e!701914)))

(declare-fun c!121295 () Bool)

(assert (=> b!1238278 (= c!121295 (validKeyInArray!0 (select (arr!38495 a!3835) from!3213)))))

(declare-fun b!1238279 () Bool)

(declare-fun e!701911 () Bool)

(assert (=> b!1238279 (= e!701911 e!701913)))

(declare-fun res!825424 () Bool)

(assert (=> b!1238279 (=> (not res!825424) (not e!701913))))

(declare-fun e!701912 () Bool)

(assert (=> b!1238279 (= res!825424 (not e!701912))))

(declare-fun res!825425 () Bool)

(assert (=> b!1238279 (=> (not res!825425) (not e!701912))))

(assert (=> b!1238279 (= res!825425 (validKeyInArray!0 (select (arr!38495 a!3835) from!3213)))))

(declare-fun b!1238280 () Bool)

(declare-fun call!61074 () Bool)

(assert (=> b!1238280 (= e!701914 call!61074)))

(declare-fun b!1238282 () Bool)

(assert (=> b!1238282 (= e!701914 call!61074)))

(declare-fun bm!61071 () Bool)

(assert (=> bm!61071 (= call!61074 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121295 (Cons!27277 (select (arr!38495 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun d!135999 () Bool)

(declare-fun res!825423 () Bool)

(assert (=> d!135999 (=> res!825423 e!701911)))

(assert (=> d!135999 (= res!825423 (bvsge from!3213 (size!39032 a!3835)))))

(assert (=> d!135999 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701911)))

(declare-fun b!1238281 () Bool)

(assert (=> b!1238281 (= e!701912 (contains!7352 acc!846 (select (arr!38495 a!3835) from!3213)))))

(assert (= (and d!135999 (not res!825423)) b!1238279))

(assert (= (and b!1238279 res!825425) b!1238281))

(assert (= (and b!1238279 res!825424) b!1238278))

(assert (= (and b!1238278 c!121295) b!1238282))

(assert (= (and b!1238278 (not c!121295)) b!1238280))

(assert (= (or b!1238282 b!1238280) bm!61071))

(assert (=> b!1238278 m!1142173))

(assert (=> b!1238278 m!1142173))

(assert (=> b!1238278 m!1142175))

(assert (=> b!1238279 m!1142173))

(assert (=> b!1238279 m!1142173))

(assert (=> b!1238279 m!1142175))

(assert (=> bm!61071 m!1142173))

(declare-fun m!1142313 () Bool)

(assert (=> bm!61071 m!1142313))

(assert (=> b!1238281 m!1142173))

(assert (=> b!1238281 m!1142173))

(declare-fun m!1142315 () Bool)

(assert (=> b!1238281 m!1142315))

(assert (=> b!1238098 d!135999))

(check-sat (not b!1238243) (not b!1238246) (not d!135997) (not b!1238168) (not b!1238281) (not b!1238279) (not b!1238208) (not d!135969) (not b!1238278) (not b!1238156) (not bm!61071) (not b!1238244) (not bm!61064) (not b!1238207) (not b!1238154) (not d!135973) (not d!135981) (not b!1238215) (not d!135991) (not b!1238209) (not b!1238167) (not b!1238214))
(check-sat)
(get-model)

(declare-fun d!136035 () Bool)

(declare-fun lt!561420 () Bool)

(assert (=> d!136035 (= lt!561420 (select (content!582 (t!40736 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701973 () Bool)

(assert (=> d!136035 (= lt!561420 e!701973)))

(declare-fun res!825473 () Bool)

(assert (=> d!136035 (=> (not res!825473) (not e!701973))))

(assert (=> d!136035 (= res!825473 ((_ is Cons!27277) (t!40736 acc!846)))))

(assert (=> d!136035 (= (contains!7352 (t!40736 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000) lt!561420)))

(declare-fun b!1238353 () Bool)

(declare-fun e!701974 () Bool)

(assert (=> b!1238353 (= e!701973 e!701974)))

(declare-fun res!825472 () Bool)

(assert (=> b!1238353 (=> res!825472 e!701974)))

(assert (=> b!1238353 (= res!825472 (= (h!28495 (t!40736 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238354 () Bool)

(assert (=> b!1238354 (= e!701974 (contains!7352 (t!40736 (t!40736 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136035 res!825473) b!1238353))

(assert (= (and b!1238353 (not res!825472)) b!1238354))

(declare-fun m!1142363 () Bool)

(assert (=> d!136035 m!1142363))

(declare-fun m!1142365 () Bool)

(assert (=> d!136035 m!1142365))

(declare-fun m!1142367 () Bool)

(assert (=> b!1238354 m!1142367))

(assert (=> b!1238246 d!136035))

(declare-fun d!136037 () Bool)

(declare-fun c!121310 () Bool)

(assert (=> d!136037 (= c!121310 ((_ is Nil!27278) acc!846))))

(declare-fun e!701977 () (InoxSet (_ BitVec 64)))

(assert (=> d!136037 (= (content!582 acc!846) e!701977)))

(declare-fun b!1238359 () Bool)

(assert (=> b!1238359 (= e!701977 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1238360 () Bool)

(assert (=> b!1238360 (= e!701977 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28495 acc!846) true) (content!582 (t!40736 acc!846))))))

(assert (= (and d!136037 c!121310) b!1238359))

(assert (= (and d!136037 (not c!121310)) b!1238360))

(declare-fun m!1142369 () Bool)

(assert (=> b!1238360 m!1142369))

(assert (=> b!1238360 m!1142363))

(assert (=> d!135973 d!136037))

(declare-fun b!1238363 () Bool)

(declare-fun e!701980 () Bool)

(assert (=> b!1238363 (= e!701980 (subseq!572 (t!40736 lt!561366) (t!40736 (t!40736 lt!561366))))))

(declare-fun b!1238362 () Bool)

(declare-fun e!701979 () Bool)

(declare-fun e!701981 () Bool)

(assert (=> b!1238362 (= e!701979 e!701981)))

(declare-fun res!825477 () Bool)

(assert (=> b!1238362 (=> res!825477 e!701981)))

(assert (=> b!1238362 (= res!825477 e!701980)))

(declare-fun res!825474 () Bool)

(assert (=> b!1238362 (=> (not res!825474) (not e!701980))))

(assert (=> b!1238362 (= res!825474 (= (h!28495 lt!561366) (h!28495 (t!40736 lt!561366))))))

(declare-fun b!1238361 () Bool)

(declare-fun e!701978 () Bool)

(assert (=> b!1238361 (= e!701978 e!701979)))

(declare-fun res!825476 () Bool)

(assert (=> b!1238361 (=> (not res!825476) (not e!701979))))

(assert (=> b!1238361 (= res!825476 ((_ is Cons!27277) (t!40736 lt!561366)))))

(declare-fun b!1238364 () Bool)

(assert (=> b!1238364 (= e!701981 (subseq!572 lt!561366 (t!40736 (t!40736 lt!561366))))))

(declare-fun d!136039 () Bool)

(declare-fun res!825475 () Bool)

(assert (=> d!136039 (=> res!825475 e!701978)))

(assert (=> d!136039 (= res!825475 ((_ is Nil!27278) lt!561366))))

(assert (=> d!136039 (= (subseq!572 lt!561366 (t!40736 lt!561366)) e!701978)))

(assert (= (and d!136039 (not res!825475)) b!1238361))

(assert (= (and b!1238361 res!825476) b!1238362))

(assert (= (and b!1238362 res!825474) b!1238363))

(assert (= (and b!1238362 (not res!825477)) b!1238364))

(declare-fun m!1142371 () Bool)

(assert (=> b!1238363 m!1142371))

(declare-fun m!1142373 () Bool)

(assert (=> b!1238364 m!1142373))

(assert (=> b!1238215 d!136039))

(declare-fun c!121313 () Bool)

(declare-fun bm!61078 () Bool)

(declare-fun call!61081 () Unit!41003)

(assert (=> bm!61078 (= call!61081 (subseqTail!59 (ite c!121313 (ite c!121282 lt!561366 (t!40736 lt!561366)) (t!40736 (ite c!121282 lt!561366 (t!40736 lt!561366)))) (t!40736 (t!40736 lt!561366))))))

(declare-fun b!1238365 () Bool)

(declare-fun e!701983 () Unit!41003)

(assert (=> b!1238365 (= e!701983 call!61081)))

(declare-fun b!1238366 () Bool)

(declare-fun e!701985 () Unit!41003)

(declare-fun Unit!41015 () Unit!41003)

(assert (=> b!1238366 (= e!701985 Unit!41015)))

(declare-fun b!1238367 () Bool)

(declare-fun c!121312 () Bool)

(assert (=> b!1238367 (= c!121312 (not (isEmpty!1010 (t!40736 (ite c!121282 lt!561366 (t!40736 lt!561366))))))))

(declare-fun e!701982 () Unit!41003)

(assert (=> b!1238367 (= e!701983 e!701982)))

(declare-fun b!1238368 () Bool)

(assert (=> b!1238368 (= e!701985 e!701983)))

(assert (=> b!1238368 (= c!121313 (subseq!572 (ite c!121282 lt!561366 (t!40736 lt!561366)) (t!40736 (t!40736 lt!561366))))))

(declare-fun d!136041 () Bool)

(assert (=> d!136041 (subseq!572 (tail!158 (ite c!121282 lt!561366 (t!40736 lt!561366))) (t!40736 lt!561366))))

(declare-fun lt!561421 () Unit!41003)

(assert (=> d!136041 (= lt!561421 e!701985)))

(declare-fun c!121311 () Bool)

(assert (=> d!136041 (= c!121311 (and ((_ is Cons!27277) (ite c!121282 lt!561366 (t!40736 lt!561366))) ((_ is Cons!27277) (t!40736 lt!561366))))))

(declare-fun e!701984 () Bool)

(assert (=> d!136041 e!701984))

(declare-fun res!825478 () Bool)

(assert (=> d!136041 (=> (not res!825478) (not e!701984))))

(assert (=> d!136041 (= res!825478 (not (isEmpty!1010 (ite c!121282 lt!561366 (t!40736 lt!561366)))))))

(assert (=> d!136041 (= (subseqTail!59 (ite c!121282 lt!561366 (t!40736 lt!561366)) (t!40736 lt!561366)) lt!561421)))

(declare-fun b!1238369 () Bool)

(assert (=> b!1238369 (= e!701984 (subseq!572 (ite c!121282 lt!561366 (t!40736 lt!561366)) (t!40736 lt!561366)))))

(declare-fun b!1238370 () Bool)

(assert (=> b!1238370 (= e!701982 call!61081)))

(declare-fun b!1238371 () Bool)

(declare-fun Unit!41016 () Unit!41003)

(assert (=> b!1238371 (= e!701982 Unit!41016)))

(assert (= (and d!136041 res!825478) b!1238369))

(assert (= (and d!136041 c!121311) b!1238368))

(assert (= (and d!136041 (not c!121311)) b!1238366))

(assert (= (and b!1238368 c!121313) b!1238365))

(assert (= (and b!1238368 (not c!121313)) b!1238367))

(assert (= (and b!1238367 c!121312) b!1238370))

(assert (= (and b!1238367 (not c!121312)) b!1238371))

(assert (= (or b!1238365 b!1238370) bm!61078))

(declare-fun m!1142375 () Bool)

(assert (=> bm!61078 m!1142375))

(declare-fun m!1142377 () Bool)

(assert (=> b!1238369 m!1142377))

(declare-fun m!1142379 () Bool)

(assert (=> d!136041 m!1142379))

(assert (=> d!136041 m!1142379))

(declare-fun m!1142381 () Bool)

(assert (=> d!136041 m!1142381))

(declare-fun m!1142383 () Bool)

(assert (=> d!136041 m!1142383))

(declare-fun m!1142385 () Bool)

(assert (=> b!1238367 m!1142385))

(declare-fun m!1142387 () Bool)

(assert (=> b!1238368 m!1142387))

(assert (=> bm!61064 d!136041))

(declare-fun b!1238374 () Bool)

(declare-fun e!701988 () Bool)

(assert (=> b!1238374 (= e!701988 (subseq!572 (t!40736 (t!40736 lt!561366)) (t!40736 (t!40736 lt!561366))))))

(declare-fun b!1238373 () Bool)

(declare-fun e!701987 () Bool)

(declare-fun e!701989 () Bool)

(assert (=> b!1238373 (= e!701987 e!701989)))

(declare-fun res!825482 () Bool)

(assert (=> b!1238373 (=> res!825482 e!701989)))

(assert (=> b!1238373 (= res!825482 e!701988)))

(declare-fun res!825479 () Bool)

(assert (=> b!1238373 (=> (not res!825479) (not e!701988))))

(assert (=> b!1238373 (= res!825479 (= (h!28495 (t!40736 lt!561366)) (h!28495 (t!40736 lt!561366))))))

(declare-fun b!1238372 () Bool)

(declare-fun e!701986 () Bool)

(assert (=> b!1238372 (= e!701986 e!701987)))

(declare-fun res!825481 () Bool)

(assert (=> b!1238372 (=> (not res!825481) (not e!701987))))

(assert (=> b!1238372 (= res!825481 ((_ is Cons!27277) (t!40736 lt!561366)))))

(declare-fun b!1238375 () Bool)

(assert (=> b!1238375 (= e!701989 (subseq!572 (t!40736 lt!561366) (t!40736 (t!40736 lt!561366))))))

(declare-fun d!136043 () Bool)

(declare-fun res!825480 () Bool)

(assert (=> d!136043 (=> res!825480 e!701986)))

(assert (=> d!136043 (= res!825480 ((_ is Nil!27278) (t!40736 lt!561366)))))

(assert (=> d!136043 (= (subseq!572 (t!40736 lt!561366) (t!40736 lt!561366)) e!701986)))

(assert (= (and d!136043 (not res!825480)) b!1238372))

(assert (= (and b!1238372 res!825481) b!1238373))

(assert (= (and b!1238373 res!825479) b!1238374))

(assert (= (and b!1238373 (not res!825482)) b!1238375))

(declare-fun m!1142389 () Bool)

(assert (=> b!1238374 m!1142389))

(assert (=> b!1238375 m!1142371))

(assert (=> b!1238214 d!136043))

(assert (=> b!1238278 d!135975))

(declare-fun b!1238378 () Bool)

(declare-fun e!701992 () Bool)

(assert (=> b!1238378 (= e!701992 (subseq!572 (t!40736 (tail!158 lt!561366)) (t!40736 lt!561366)))))

(declare-fun b!1238377 () Bool)

(declare-fun e!701991 () Bool)

(declare-fun e!701993 () Bool)

(assert (=> b!1238377 (= e!701991 e!701993)))

(declare-fun res!825486 () Bool)

(assert (=> b!1238377 (=> res!825486 e!701993)))

(assert (=> b!1238377 (= res!825486 e!701992)))

(declare-fun res!825483 () Bool)

(assert (=> b!1238377 (=> (not res!825483) (not e!701992))))

(assert (=> b!1238377 (= res!825483 (= (h!28495 (tail!158 lt!561366)) (h!28495 lt!561366)))))

(declare-fun b!1238376 () Bool)

(declare-fun e!701990 () Bool)

(assert (=> b!1238376 (= e!701990 e!701991)))

(declare-fun res!825485 () Bool)

(assert (=> b!1238376 (=> (not res!825485) (not e!701991))))

(assert (=> b!1238376 (= res!825485 ((_ is Cons!27277) lt!561366))))

(declare-fun b!1238379 () Bool)

(assert (=> b!1238379 (= e!701993 (subseq!572 (tail!158 lt!561366) (t!40736 lt!561366)))))

(declare-fun d!136045 () Bool)

(declare-fun res!825484 () Bool)

(assert (=> d!136045 (=> res!825484 e!701990)))

(assert (=> d!136045 (= res!825484 ((_ is Nil!27278) (tail!158 lt!561366)))))

(assert (=> d!136045 (= (subseq!572 (tail!158 lt!561366) lt!561366) e!701990)))

(assert (= (and d!136045 (not res!825484)) b!1238376))

(assert (= (and b!1238376 res!825485) b!1238377))

(assert (= (and b!1238377 res!825483) b!1238378))

(assert (= (and b!1238377 (not res!825486)) b!1238379))

(declare-fun m!1142391 () Bool)

(assert (=> b!1238378 m!1142391))

(assert (=> b!1238379 m!1142257))

(declare-fun m!1142393 () Bool)

(assert (=> b!1238379 m!1142393))

(assert (=> d!135981 d!136045))

(declare-fun d!136047 () Bool)

(assert (=> d!136047 (= (tail!158 lt!561366) (t!40736 lt!561366))))

(assert (=> d!135981 d!136047))

(declare-fun d!136049 () Bool)

(assert (=> d!136049 (= (isEmpty!1010 lt!561366) ((_ is Nil!27278) lt!561366))))

(assert (=> d!135981 d!136049))

(declare-fun d!136051 () Bool)

(declare-fun lt!561422 () Bool)

(assert (=> d!136051 (= lt!561422 (select (content!582 acc!846) (select (arr!38495 a!3835) from!3213)))))

(declare-fun e!701994 () Bool)

(assert (=> d!136051 (= lt!561422 e!701994)))

(declare-fun res!825488 () Bool)

(assert (=> d!136051 (=> (not res!825488) (not e!701994))))

(assert (=> d!136051 (= res!825488 ((_ is Cons!27277) acc!846))))

(assert (=> d!136051 (= (contains!7352 acc!846 (select (arr!38495 a!3835) from!3213)) lt!561422)))

(declare-fun b!1238380 () Bool)

(declare-fun e!701995 () Bool)

(assert (=> b!1238380 (= e!701994 e!701995)))

(declare-fun res!825487 () Bool)

(assert (=> b!1238380 (=> res!825487 e!701995)))

(assert (=> b!1238380 (= res!825487 (= (h!28495 acc!846) (select (arr!38495 a!3835) from!3213)))))

(declare-fun b!1238381 () Bool)

(assert (=> b!1238381 (= e!701995 (contains!7352 (t!40736 acc!846) (select (arr!38495 a!3835) from!3213)))))

(assert (= (and d!136051 res!825488) b!1238380))

(assert (= (and b!1238380 (not res!825487)) b!1238381))

(assert (=> d!136051 m!1142237))

(assert (=> d!136051 m!1142173))

(declare-fun m!1142395 () Bool)

(assert (=> d!136051 m!1142395))

(assert (=> b!1238381 m!1142173))

(declare-fun m!1142397 () Bool)

(assert (=> b!1238381 m!1142397))

(assert (=> b!1238281 d!136051))

(declare-fun d!136053 () Bool)

(assert (=> d!136053 (= (isEmpty!1010 (t!40736 lt!561366)) ((_ is Nil!27278) (t!40736 lt!561366)))))

(assert (=> b!1238207 d!136053))

(assert (=> d!135969 d!136037))

(declare-fun b!1238384 () Bool)

(declare-fun e!701998 () Bool)

(assert (=> b!1238384 (= e!701998 (subseq!572 (t!40736 acc!846) (t!40736 (t!40736 lt!561366))))))

(declare-fun b!1238383 () Bool)

(declare-fun e!701997 () Bool)

(declare-fun e!701999 () Bool)

(assert (=> b!1238383 (= e!701997 e!701999)))

(declare-fun res!825492 () Bool)

(assert (=> b!1238383 (=> res!825492 e!701999)))

(assert (=> b!1238383 (= res!825492 e!701998)))

(declare-fun res!825489 () Bool)

(assert (=> b!1238383 (=> (not res!825489) (not e!701998))))

(assert (=> b!1238383 (= res!825489 (= (h!28495 acc!846) (h!28495 (t!40736 lt!561366))))))

(declare-fun b!1238382 () Bool)

(declare-fun e!701996 () Bool)

(assert (=> b!1238382 (= e!701996 e!701997)))

(declare-fun res!825491 () Bool)

(assert (=> b!1238382 (=> (not res!825491) (not e!701997))))

(assert (=> b!1238382 (= res!825491 ((_ is Cons!27277) (t!40736 lt!561366)))))

(declare-fun b!1238385 () Bool)

(assert (=> b!1238385 (= e!701999 (subseq!572 acc!846 (t!40736 (t!40736 lt!561366))))))

(declare-fun d!136055 () Bool)

(declare-fun res!825490 () Bool)

(assert (=> d!136055 (=> res!825490 e!701996)))

(assert (=> d!136055 (= res!825490 ((_ is Nil!27278) acc!846))))

(assert (=> d!136055 (= (subseq!572 acc!846 (t!40736 lt!561366)) e!701996)))

(assert (= (and d!136055 (not res!825490)) b!1238382))

(assert (= (and b!1238382 res!825491) b!1238383))

(assert (= (and b!1238383 res!825489) b!1238384))

(assert (= (and b!1238383 (not res!825492)) b!1238385))

(declare-fun m!1142399 () Bool)

(assert (=> b!1238384 m!1142399))

(declare-fun m!1142401 () Bool)

(assert (=> b!1238385 m!1142401))

(assert (=> b!1238168 d!136055))

(declare-fun b!1238388 () Bool)

(declare-fun e!702002 () Bool)

(assert (=> b!1238388 (= e!702002 (subseq!572 (t!40736 (t!40736 acc!846)) (t!40736 (t!40736 lt!561366))))))

(declare-fun b!1238387 () Bool)

(declare-fun e!702001 () Bool)

(declare-fun e!702003 () Bool)

(assert (=> b!1238387 (= e!702001 e!702003)))

(declare-fun res!825496 () Bool)

(assert (=> b!1238387 (=> res!825496 e!702003)))

(assert (=> b!1238387 (= res!825496 e!702002)))

(declare-fun res!825493 () Bool)

(assert (=> b!1238387 (=> (not res!825493) (not e!702002))))

(assert (=> b!1238387 (= res!825493 (= (h!28495 (t!40736 acc!846)) (h!28495 (t!40736 lt!561366))))))

(declare-fun b!1238386 () Bool)

(declare-fun e!702000 () Bool)

(assert (=> b!1238386 (= e!702000 e!702001)))

(declare-fun res!825495 () Bool)

(assert (=> b!1238386 (=> (not res!825495) (not e!702001))))

(assert (=> b!1238386 (= res!825495 ((_ is Cons!27277) (t!40736 lt!561366)))))

(declare-fun b!1238389 () Bool)

(assert (=> b!1238389 (= e!702003 (subseq!572 (t!40736 acc!846) (t!40736 (t!40736 lt!561366))))))

(declare-fun d!136057 () Bool)

(declare-fun res!825494 () Bool)

(assert (=> d!136057 (=> res!825494 e!702000)))

(assert (=> d!136057 (= res!825494 ((_ is Nil!27278) (t!40736 acc!846)))))

(assert (=> d!136057 (= (subseq!572 (t!40736 acc!846) (t!40736 lt!561366)) e!702000)))

(assert (= (and d!136057 (not res!825494)) b!1238386))

(assert (= (and b!1238386 res!825495) b!1238387))

(assert (= (and b!1238387 res!825493) b!1238388))

(assert (= (and b!1238387 (not res!825496)) b!1238389))

(declare-fun m!1142403 () Bool)

(assert (=> b!1238388 m!1142403))

(assert (=> b!1238389 m!1142399))

(assert (=> b!1238167 d!136057))

(assert (=> b!1238279 d!135975))

(assert (=> d!135997 d!136037))

(declare-fun d!136059 () Bool)

(declare-fun lt!561423 () Bool)

(assert (=> d!136059 (= lt!561423 (select (content!582 (t!40736 acc!846)) k0!2925))))

(declare-fun e!702004 () Bool)

(assert (=> d!136059 (= lt!561423 e!702004)))

(declare-fun res!825498 () Bool)

(assert (=> d!136059 (=> (not res!825498) (not e!702004))))

(assert (=> d!136059 (= res!825498 ((_ is Cons!27277) (t!40736 acc!846)))))

(assert (=> d!136059 (= (contains!7352 (t!40736 acc!846) k0!2925) lt!561423)))

(declare-fun b!1238390 () Bool)

(declare-fun e!702005 () Bool)

(assert (=> b!1238390 (= e!702004 e!702005)))

(declare-fun res!825497 () Bool)

(assert (=> b!1238390 (=> res!825497 e!702005)))

(assert (=> b!1238390 (= res!825497 (= (h!28495 (t!40736 acc!846)) k0!2925))))

(declare-fun b!1238391 () Bool)

(assert (=> b!1238391 (= e!702005 (contains!7352 (t!40736 (t!40736 acc!846)) k0!2925))))

(assert (= (and d!136059 res!825498) b!1238390))

(assert (= (and b!1238390 (not res!825497)) b!1238391))

(assert (=> d!136059 m!1142363))

(declare-fun m!1142405 () Bool)

(assert (=> d!136059 m!1142405))

(declare-fun m!1142407 () Bool)

(assert (=> b!1238391 m!1142407))

(assert (=> b!1238154 d!136059))

(declare-fun d!136061 () Bool)

(declare-fun res!825499 () Bool)

(declare-fun e!702006 () Bool)

(assert (=> d!136061 (=> res!825499 e!702006)))

(assert (=> d!136061 (= res!825499 ((_ is Nil!27278) (t!40736 acc!846)))))

(assert (=> d!136061 (= (noDuplicate!1933 (t!40736 acc!846)) e!702006)))

(declare-fun b!1238392 () Bool)

(declare-fun e!702007 () Bool)

(assert (=> b!1238392 (= e!702006 e!702007)))

(declare-fun res!825500 () Bool)

(assert (=> b!1238392 (=> (not res!825500) (not e!702007))))

(assert (=> b!1238392 (= res!825500 (not (contains!7352 (t!40736 (t!40736 acc!846)) (h!28495 (t!40736 acc!846)))))))

(declare-fun b!1238393 () Bool)

(assert (=> b!1238393 (= e!702007 (noDuplicate!1933 (t!40736 (t!40736 acc!846))))))

(assert (= (and d!136061 (not res!825499)) b!1238392))

(assert (= (and b!1238392 res!825500) b!1238393))

(declare-fun m!1142409 () Bool)

(assert (=> b!1238392 m!1142409))

(declare-fun m!1142411 () Bool)

(assert (=> b!1238393 m!1142411))

(assert (=> b!1238244 d!136061))

(declare-fun d!136063 () Bool)

(declare-fun lt!561424 () Bool)

(assert (=> d!136063 (= lt!561424 (select (content!582 (t!40736 acc!846)) (h!28495 acc!846)))))

(declare-fun e!702008 () Bool)

(assert (=> d!136063 (= lt!561424 e!702008)))

(declare-fun res!825502 () Bool)

(assert (=> d!136063 (=> (not res!825502) (not e!702008))))

(assert (=> d!136063 (= res!825502 ((_ is Cons!27277) (t!40736 acc!846)))))

(assert (=> d!136063 (= (contains!7352 (t!40736 acc!846) (h!28495 acc!846)) lt!561424)))

(declare-fun b!1238394 () Bool)

(declare-fun e!702009 () Bool)

(assert (=> b!1238394 (= e!702008 e!702009)))

(declare-fun res!825501 () Bool)

(assert (=> b!1238394 (=> res!825501 e!702009)))

(assert (=> b!1238394 (= res!825501 (= (h!28495 (t!40736 acc!846)) (h!28495 acc!846)))))

(declare-fun b!1238395 () Bool)

(assert (=> b!1238395 (= e!702009 (contains!7352 (t!40736 (t!40736 acc!846)) (h!28495 acc!846)))))

(assert (= (and d!136063 res!825502) b!1238394))

(assert (= (and b!1238394 (not res!825501)) b!1238395))

(assert (=> d!136063 m!1142363))

(declare-fun m!1142413 () Bool)

(assert (=> d!136063 m!1142413))

(declare-fun m!1142415 () Bool)

(assert (=> b!1238395 m!1142415))

(assert (=> b!1238243 d!136063))

(declare-fun b!1238396 () Bool)

(declare-fun e!702012 () Bool)

(declare-fun e!702013 () Bool)

(assert (=> b!1238396 (= e!702012 e!702013)))

(declare-fun c!121314 () Bool)

(assert (=> b!1238396 (= c!121314 (validKeyInArray!0 (select (arr!38495 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1238397 () Bool)

(declare-fun e!702010 () Bool)

(assert (=> b!1238397 (= e!702010 e!702012)))

(declare-fun res!825504 () Bool)

(assert (=> b!1238397 (=> (not res!825504) (not e!702012))))

(declare-fun e!702011 () Bool)

(assert (=> b!1238397 (= res!825504 (not e!702011))))

(declare-fun res!825505 () Bool)

(assert (=> b!1238397 (=> (not res!825505) (not e!702011))))

(assert (=> b!1238397 (= res!825505 (validKeyInArray!0 (select (arr!38495 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1238398 () Bool)

(declare-fun call!61082 () Bool)

(assert (=> b!1238398 (= e!702013 call!61082)))

(declare-fun b!1238400 () Bool)

(assert (=> b!1238400 (= e!702013 call!61082)))

(declare-fun bm!61079 () Bool)

(assert (=> bm!61079 (= call!61082 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121314 (Cons!27277 (select (arr!38495 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) (ite c!121295 (Cons!27277 (select (arr!38495 a!3835) from!3213) acc!846) acc!846)) (ite c!121295 (Cons!27277 (select (arr!38495 a!3835) from!3213) acc!846) acc!846))))))

(declare-fun d!136065 () Bool)

(declare-fun res!825503 () Bool)

(assert (=> d!136065 (=> res!825503 e!702010)))

(assert (=> d!136065 (= res!825503 (bvsge (bvadd from!3213 #b00000000000000000000000000000001) (size!39032 a!3835)))))

(assert (=> d!136065 (= (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121295 (Cons!27277 (select (arr!38495 a!3835) from!3213) acc!846) acc!846)) e!702010)))

(declare-fun b!1238399 () Bool)

(assert (=> b!1238399 (= e!702011 (contains!7352 (ite c!121295 (Cons!27277 (select (arr!38495 a!3835) from!3213) acc!846) acc!846) (select (arr!38495 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(assert (= (and d!136065 (not res!825503)) b!1238397))

(assert (= (and b!1238397 res!825505) b!1238399))

(assert (= (and b!1238397 res!825504) b!1238396))

(assert (= (and b!1238396 c!121314) b!1238400))

(assert (= (and b!1238396 (not c!121314)) b!1238398))

(assert (= (or b!1238400 b!1238398) bm!61079))

(declare-fun m!1142417 () Bool)

(assert (=> b!1238396 m!1142417))

(assert (=> b!1238396 m!1142417))

(declare-fun m!1142419 () Bool)

(assert (=> b!1238396 m!1142419))

(assert (=> b!1238397 m!1142417))

(assert (=> b!1238397 m!1142417))

(assert (=> b!1238397 m!1142419))

(assert (=> bm!61079 m!1142417))

(declare-fun m!1142421 () Bool)

(assert (=> bm!61079 m!1142421))

(assert (=> b!1238399 m!1142417))

(assert (=> b!1238399 m!1142417))

(declare-fun m!1142423 () Bool)

(assert (=> b!1238399 m!1142423))

(assert (=> bm!61071 d!136065))

(declare-fun d!136067 () Bool)

(declare-fun lt!561425 () Bool)

(assert (=> d!136067 (= lt!561425 (select (content!582 (t!40736 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702014 () Bool)

(assert (=> d!136067 (= lt!561425 e!702014)))

(declare-fun res!825507 () Bool)

(assert (=> d!136067 (=> (not res!825507) (not e!702014))))

(assert (=> d!136067 (= res!825507 ((_ is Cons!27277) (t!40736 acc!846)))))

(assert (=> d!136067 (= (contains!7352 (t!40736 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000) lt!561425)))

(declare-fun b!1238401 () Bool)

(declare-fun e!702015 () Bool)

(assert (=> b!1238401 (= e!702014 e!702015)))

(declare-fun res!825506 () Bool)

(assert (=> b!1238401 (=> res!825506 e!702015)))

(assert (=> b!1238401 (= res!825506 (= (h!28495 (t!40736 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238402 () Bool)

(assert (=> b!1238402 (= e!702015 (contains!7352 (t!40736 (t!40736 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136067 res!825507) b!1238401))

(assert (= (and b!1238401 (not res!825506)) b!1238402))

(assert (=> d!136067 m!1142363))

(declare-fun m!1142425 () Bool)

(assert (=> d!136067 m!1142425))

(declare-fun m!1142427 () Bool)

(assert (=> b!1238402 m!1142427))

(assert (=> b!1238156 d!136067))

(assert (=> b!1238209 d!135989))

(assert (=> d!135991 d!135989))

(declare-fun d!136069 () Bool)

(assert (=> d!136069 (subseq!572 lt!561366 lt!561366)))

(assert (=> d!136069 true))

(declare-fun _$69!47 () Unit!41003)

(assert (=> d!136069 (= (choose!36 lt!561366) _$69!47)))

(declare-fun bs!34802 () Bool)

(assert (= bs!34802 d!136069))

(assert (=> bs!34802 m!1142185))

(assert (=> d!135991 d!136069))

(assert (=> b!1238208 d!136039))

(check-sat (not b!1238369) (not d!136069) (not bm!61079) (not b!1238389) (not b!1238363) (not b!1238391) (not b!1238392) (not d!136067) (not b!1238367) (not b!1238397) (not b!1238384) (not b!1238374) (not d!136063) (not d!136041) (not b!1238360) (not b!1238393) (not d!136059) (not b!1238399) (not b!1238364) (not b!1238395) (not b!1238378) (not d!136051) (not bm!61078) (not b!1238375) (not b!1238379) (not b!1238385) (not b!1238354) (not b!1238388) (not b!1238396) (not b!1238402) (not d!136035) (not b!1238368) (not b!1238381))
(check-sat)
