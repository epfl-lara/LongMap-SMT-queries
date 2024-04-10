; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87320 () Bool)

(assert start!87320)

(declare-fun b!1012118 () Bool)

(assert (=> b!1012118 true))

(assert (=> b!1012118 true))

(declare-datatypes ((Unit!33047 0))(
  ( (Unit!33048) )
))
(declare-fun e!569351 () Unit!33047)

(declare-fun lt!447314 () Unit!33047)

(assert (=> b!1012118 (= e!569351 lt!447314)))

(declare-datatypes ((List!21348 0))(
  ( (Nil!21345) (Cons!21344 (h!22542 (_ BitVec 64)) (t!30349 List!21348)) )
))
(declare-fun lt!447313 () List!21348)

(declare-datatypes ((B!1330 0))(
  ( (B!1331 (val!11749 Int)) )
))
(declare-fun value!115 () B!1330)

(declare-datatypes ((tuple2!15044 0))(
  ( (tuple2!15045 (_1!7533 (_ BitVec 64)) (_2!7533 B!1330)) )
))
(declare-datatypes ((List!21349 0))(
  ( (Nil!21346) (Cons!21345 (h!22543 tuple2!15044) (t!30350 List!21349)) )
))
(declare-fun l!412 () List!21349)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!6 (List!21349 List!21348 B!1330 tuple2!15044) Unit!33047)

(assert (=> b!1012118 (= lt!447314 (lemmaForallGetValueByKeySameWithASmallerHead!6 (t!30350 l!412) lt!447313 value!115 (h!22543 l!412)))))

(declare-fun lambda!290 () Int)

(declare-fun forall!208 (List!21348 Int) Bool)

(assert (=> b!1012118 (forall!208 lt!447313 lambda!290)))

(declare-fun b!1012119 () Bool)

(declare-fun Unit!33049 () Unit!33047)

(assert (=> b!1012119 (= e!569351 Unit!33049)))

(declare-fun b!1012120 () Bool)

(declare-fun res!679890 () Bool)

(declare-fun e!569352 () Bool)

(assert (=> b!1012120 (=> (not res!679890) (not e!569352))))

(get-info :version)

(assert (=> b!1012120 (= res!679890 (and ((_ is Cons!21345) l!412) (= (_2!7533 (h!22543 l!412)) value!115)))))

(declare-fun b!1012121 () Bool)

(declare-fun isStrictlySorted!529 (List!21349) Bool)

(assert (=> b!1012121 (= e!569352 (not (isStrictlySorted!529 (t!30350 l!412))))))

(declare-fun lt!447315 () Unit!33047)

(assert (=> b!1012121 (= lt!447315 e!569351)))

(declare-fun c!102228 () Bool)

(declare-fun isEmpty!784 (List!21348) Bool)

(assert (=> b!1012121 (= c!102228 (not (isEmpty!784 lt!447313)))))

(declare-fun getKeysOf!14 (List!21349 B!1330) List!21348)

(assert (=> b!1012121 (= lt!447313 (getKeysOf!14 (t!30350 l!412) value!115))))

(declare-fun b!1012122 () Bool)

(declare-fun e!569353 () Bool)

(declare-fun tp_is_empty!23397 () Bool)

(declare-fun tp!70259 () Bool)

(assert (=> b!1012122 (= e!569353 (and tp_is_empty!23397 tp!70259))))

(declare-fun res!679889 () Bool)

(assert (=> start!87320 (=> (not res!679889) (not e!569352))))

(assert (=> start!87320 (= res!679889 (isStrictlySorted!529 l!412))))

(assert (=> start!87320 e!569352))

(assert (=> start!87320 e!569353))

(assert (=> start!87320 tp_is_empty!23397))

(assert (= (and start!87320 res!679889) b!1012120))

(assert (= (and b!1012120 res!679890) b!1012121))

(assert (= (and b!1012121 c!102228) b!1012118))

(assert (= (and b!1012121 (not c!102228)) b!1012119))

(assert (= (and start!87320 ((_ is Cons!21345) l!412)) b!1012122))

(declare-fun m!935851 () Bool)

(assert (=> b!1012118 m!935851))

(declare-fun m!935853 () Bool)

(assert (=> b!1012118 m!935853))

(declare-fun m!935855 () Bool)

(assert (=> b!1012121 m!935855))

(declare-fun m!935857 () Bool)

(assert (=> b!1012121 m!935857))

(declare-fun m!935859 () Bool)

(assert (=> b!1012121 m!935859))

(declare-fun m!935861 () Bool)

(assert (=> start!87320 m!935861))

(check-sat (not b!1012121) tp_is_empty!23397 (not b!1012122) (not start!87320) (not b!1012118))
(check-sat)
(get-model)

(declare-fun d!120235 () Bool)

(declare-fun res!679901 () Bool)

(declare-fun e!569367 () Bool)

(assert (=> d!120235 (=> res!679901 e!569367)))

(assert (=> d!120235 (= res!679901 (or ((_ is Nil!21346) (t!30350 l!412)) ((_ is Nil!21346) (t!30350 (t!30350 l!412)))))))

(assert (=> d!120235 (= (isStrictlySorted!529 (t!30350 l!412)) e!569367)))

(declare-fun b!1012150 () Bool)

(declare-fun e!569368 () Bool)

(assert (=> b!1012150 (= e!569367 e!569368)))

(declare-fun res!679902 () Bool)

(assert (=> b!1012150 (=> (not res!679902) (not e!569368))))

(assert (=> b!1012150 (= res!679902 (bvslt (_1!7533 (h!22543 (t!30350 l!412))) (_1!7533 (h!22543 (t!30350 (t!30350 l!412))))))))

(declare-fun b!1012151 () Bool)

(assert (=> b!1012151 (= e!569368 (isStrictlySorted!529 (t!30350 (t!30350 l!412))))))

(assert (= (and d!120235 (not res!679901)) b!1012150))

(assert (= (and b!1012150 res!679902) b!1012151))

(declare-fun m!935875 () Bool)

(assert (=> b!1012151 m!935875))

(assert (=> b!1012121 d!120235))

(declare-fun d!120241 () Bool)

(assert (=> d!120241 (= (isEmpty!784 lt!447313) ((_ is Nil!21345) lt!447313))))

(assert (=> b!1012121 d!120241))

(declare-fun bs!28767 () Bool)

(declare-fun b!1012221 () Bool)

(assert (= bs!28767 (and b!1012221 b!1012118)))

(declare-fun lambda!312 () Int)

(declare-fun lt!447381 () List!21349)

(declare-fun lt!447376 () tuple2!15044)

(assert (=> bs!28767 (= (= (Cons!21345 lt!447376 lt!447381) l!412) (= lambda!312 lambda!290))))

(assert (=> b!1012221 true))

(assert (=> b!1012221 true))

(assert (=> b!1012221 true))

(declare-fun bs!28768 () Bool)

(declare-fun b!1012216 () Bool)

(assert (= bs!28768 (and b!1012216 b!1012118)))

(declare-fun lt!447378 () tuple2!15044)

(declare-fun lt!447379 () List!21349)

(declare-fun lambda!314 () Int)

(assert (=> bs!28768 (= (= (Cons!21345 lt!447378 lt!447379) l!412) (= lambda!314 lambda!290))))

(declare-fun bs!28769 () Bool)

(assert (= bs!28769 (and b!1012216 b!1012221)))

(assert (=> bs!28769 (= (= (Cons!21345 lt!447378 lt!447379) (Cons!21345 lt!447376 lt!447381)) (= lambda!314 lambda!312))))

(assert (=> b!1012216 true))

(assert (=> b!1012216 true))

(assert (=> b!1012216 true))

(declare-fun bs!28771 () Bool)

(declare-fun d!120243 () Bool)

(assert (= bs!28771 (and d!120243 b!1012118)))

(declare-fun lambda!315 () Int)

(assert (=> bs!28771 (= (= (t!30350 l!412) l!412) (= lambda!315 lambda!290))))

(declare-fun bs!28772 () Bool)

(assert (= bs!28772 (and d!120243 b!1012221)))

(assert (=> bs!28772 (= (= (t!30350 l!412) (Cons!21345 lt!447376 lt!447381)) (= lambda!315 lambda!312))))

(declare-fun bs!28774 () Bool)

(assert (= bs!28774 (and d!120243 b!1012216)))

(assert (=> bs!28774 (= (= (t!30350 l!412) (Cons!21345 lt!447378 lt!447379)) (= lambda!315 lambda!314))))

(assert (=> d!120243 true))

(assert (=> d!120243 true))

(declare-fun b!1012215 () Bool)

(declare-fun e!569408 () Unit!33047)

(declare-fun Unit!33053 () Unit!33047)

(assert (=> b!1012215 (= e!569408 Unit!33053)))

(declare-fun lt!447383 () Unit!33047)

(assert (=> b!1012216 (= e!569408 lt!447383)))

(assert (=> b!1012216 (= lt!447379 (t!30350 (t!30350 l!412)))))

(declare-fun lt!447377 () List!21348)

(declare-fun call!42496 () List!21348)

(assert (=> b!1012216 (= lt!447377 call!42496)))

(assert (=> b!1012216 (= lt!447378 (h!22543 (t!30350 l!412)))))

(declare-fun call!42497 () Unit!33047)

(assert (=> b!1012216 (= lt!447383 call!42497)))

(declare-fun call!42495 () Bool)

(assert (=> b!1012216 call!42495))

(declare-fun lt!447386 () List!21348)

(declare-fun bm!42491 () Bool)

(declare-fun c!102251 () Bool)

(assert (=> bm!42491 (= call!42495 (forall!208 (ite c!102251 lt!447386 lt!447377) (ite c!102251 lambda!312 lambda!314)))))

(declare-fun b!1012217 () Bool)

(declare-fun e!569409 () List!21348)

(declare-fun e!569411 () List!21348)

(assert (=> b!1012217 (= e!569409 e!569411)))

(declare-fun c!102250 () Bool)

(assert (=> b!1012217 (= c!102250 (and ((_ is Cons!21345) (t!30350 l!412)) (not (= (_2!7533 (h!22543 (t!30350 l!412))) value!115))))))

(declare-fun bm!42492 () Bool)

(assert (=> bm!42492 (= call!42497 (lemmaForallGetValueByKeySameWithASmallerHead!6 (ite c!102251 lt!447381 lt!447379) (ite c!102251 lt!447386 lt!447377) value!115 (ite c!102251 lt!447376 lt!447378)))))

(declare-fun b!1012218 () Bool)

(assert (=> b!1012218 (= e!569409 (Cons!21344 (_1!7533 (h!22543 (t!30350 l!412))) call!42496))))

(declare-fun c!102249 () Bool)

(declare-fun call!42494 () Bool)

(assert (=> b!1012218 (= c!102249 (not call!42494))))

(declare-fun lt!447385 () Unit!33047)

(declare-fun e!569410 () Unit!33047)

(assert (=> b!1012218 (= lt!447385 e!569410)))

(declare-fun bm!42493 () Bool)

(assert (=> bm!42493 (= call!42494 (isEmpty!784 call!42496))))

(declare-fun b!1012219 () Bool)

(declare-fun lt!447384 () Unit!33047)

(assert (=> b!1012219 (= lt!447384 e!569408)))

(declare-fun c!102248 () Bool)

(assert (=> b!1012219 (= c!102248 (not call!42494))))

(declare-fun lt!447380 () List!21348)

(assert (=> b!1012219 (= lt!447380 call!42496)))

(assert (=> b!1012219 (= e!569411 call!42496)))

(declare-fun b!1012220 () Bool)

(declare-fun Unit!33054 () Unit!33047)

(assert (=> b!1012220 (= e!569410 Unit!33054)))

(declare-fun lt!447382 () List!21348)

(assert (=> d!120243 (forall!208 lt!447382 lambda!315)))

(assert (=> d!120243 (= lt!447382 e!569409)))

(assert (=> d!120243 (= c!102251 (and ((_ is Cons!21345) (t!30350 l!412)) (= (_2!7533 (h!22543 (t!30350 l!412))) value!115)))))

(assert (=> d!120243 (isStrictlySorted!529 (t!30350 l!412))))

(assert (=> d!120243 (= (getKeysOf!14 (t!30350 l!412) value!115) lt!447382)))

(assert (=> b!1012221 call!42495))

(declare-fun lt!447387 () Unit!33047)

(assert (=> b!1012221 (= lt!447387 call!42497)))

(assert (=> b!1012221 (= lt!447376 (h!22543 (t!30350 l!412)))))

(assert (=> b!1012221 (= lt!447386 call!42496)))

(assert (=> b!1012221 (= lt!447381 (t!30350 (t!30350 l!412)))))

(assert (=> b!1012221 (= e!569410 lt!447387)))

(declare-fun b!1012222 () Bool)

(assert (=> b!1012222 (= e!569411 Nil!21345)))

(declare-fun bm!42494 () Bool)

(assert (=> bm!42494 (= call!42496 (getKeysOf!14 (t!30350 (t!30350 l!412)) value!115))))

(assert (= (and d!120243 c!102251) b!1012218))

(assert (= (and d!120243 (not c!102251)) b!1012217))

(assert (= (and b!1012218 c!102249) b!1012221))

(assert (= (and b!1012218 (not c!102249)) b!1012220))

(assert (= (and b!1012217 c!102250) b!1012219))

(assert (= (and b!1012217 (not c!102250)) b!1012222))

(assert (= (and b!1012219 c!102248) b!1012216))

(assert (= (and b!1012219 (not c!102248)) b!1012215))

(assert (= (or b!1012221 b!1012216) bm!42492))

(assert (= (or b!1012221 b!1012216) bm!42491))

(assert (= (or b!1012218 b!1012221 b!1012216 b!1012219) bm!42494))

(assert (= (or b!1012218 b!1012219) bm!42493))

(declare-fun m!935895 () Bool)

(assert (=> bm!42494 m!935895))

(declare-fun m!935897 () Bool)

(assert (=> bm!42493 m!935897))

(declare-fun m!935899 () Bool)

(assert (=> bm!42491 m!935899))

(declare-fun m!935901 () Bool)

(assert (=> d!120243 m!935901))

(assert (=> d!120243 m!935855))

(declare-fun m!935903 () Bool)

(assert (=> bm!42492 m!935903))

(assert (=> b!1012121 d!120243))

(declare-fun d!120259 () Bool)

(declare-fun res!679932 () Bool)

(declare-fun e!569416 () Bool)

(assert (=> d!120259 (=> res!679932 e!569416)))

(assert (=> d!120259 (= res!679932 (or ((_ is Nil!21346) l!412) ((_ is Nil!21346) (t!30350 l!412))))))

(assert (=> d!120259 (= (isStrictlySorted!529 l!412) e!569416)))

(declare-fun b!1012237 () Bool)

(declare-fun e!569417 () Bool)

(assert (=> b!1012237 (= e!569416 e!569417)))

(declare-fun res!679933 () Bool)

(assert (=> b!1012237 (=> (not res!679933) (not e!569417))))

(assert (=> b!1012237 (= res!679933 (bvslt (_1!7533 (h!22543 l!412)) (_1!7533 (h!22543 (t!30350 l!412)))))))

(declare-fun b!1012238 () Bool)

(assert (=> b!1012238 (= e!569417 (isStrictlySorted!529 (t!30350 l!412)))))

(assert (= (and d!120259 (not res!679932)) b!1012237))

(assert (= (and b!1012237 res!679933) b!1012238))

(assert (=> b!1012238 m!935855))

(assert (=> start!87320 d!120259))

(declare-fun bs!28779 () Bool)

(declare-fun b!1012266 () Bool)

(assert (= bs!28779 (and b!1012266 b!1012118)))

(declare-fun lambda!332 () Int)

(assert (=> bs!28779 (= (= (t!30350 l!412) l!412) (= lambda!332 lambda!290))))

(declare-fun bs!28780 () Bool)

(assert (= bs!28780 (and b!1012266 b!1012221)))

(assert (=> bs!28780 (= (= (t!30350 l!412) (Cons!21345 lt!447376 lt!447381)) (= lambda!332 lambda!312))))

(declare-fun bs!28781 () Bool)

(assert (= bs!28781 (and b!1012266 b!1012216)))

(assert (=> bs!28781 (= (= (t!30350 l!412) (Cons!21345 lt!447378 lt!447379)) (= lambda!332 lambda!314))))

(declare-fun bs!28782 () Bool)

(assert (= bs!28782 (and b!1012266 d!120243)))

(assert (=> bs!28782 (= lambda!332 lambda!315)))

(assert (=> b!1012266 true))

(assert (=> b!1012266 true))

(declare-fun bs!28786 () Bool)

(declare-fun d!120261 () Bool)

(assert (= bs!28786 (and d!120261 b!1012118)))

(declare-fun lambda!334 () Int)

(assert (=> bs!28786 (= (= (Cons!21345 (h!22543 l!412) (t!30350 l!412)) l!412) (= lambda!334 lambda!290))))

(declare-fun bs!28788 () Bool)

(assert (= bs!28788 (and d!120261 b!1012221)))

(assert (=> bs!28788 (= (= (Cons!21345 (h!22543 l!412) (t!30350 l!412)) (Cons!21345 lt!447376 lt!447381)) (= lambda!334 lambda!312))))

(declare-fun bs!28789 () Bool)

(assert (= bs!28789 (and d!120261 b!1012266)))

(assert (=> bs!28789 (= (= (Cons!21345 (h!22543 l!412) (t!30350 l!412)) (t!30350 l!412)) (= lambda!334 lambda!332))))

(declare-fun bs!28790 () Bool)

(assert (= bs!28790 (and d!120261 b!1012216)))

(assert (=> bs!28790 (= (= (Cons!21345 (h!22543 l!412) (t!30350 l!412)) (Cons!21345 lt!447378 lt!447379)) (= lambda!334 lambda!314))))

(declare-fun bs!28791 () Bool)

(assert (= bs!28791 (and d!120261 d!120243)))

(assert (=> bs!28791 (= (= (Cons!21345 (h!22543 l!412) (t!30350 l!412)) (t!30350 l!412)) (= lambda!334 lambda!315))))

(assert (=> d!120261 true))

(assert (=> d!120261 true))

(assert (=> d!120261 true))

(assert (=> d!120261 (forall!208 lt!447313 lambda!334)))

(declare-fun lt!447428 () Unit!33047)

(declare-fun choose!1625 (List!21349 List!21348 B!1330 tuple2!15044) Unit!33047)

(assert (=> d!120261 (= lt!447428 (choose!1625 (t!30350 l!412) lt!447313 value!115 (h!22543 l!412)))))

(declare-fun e!569430 () Bool)

(assert (=> d!120261 e!569430))

(declare-fun res!679946 () Bool)

(assert (=> d!120261 (=> (not res!679946) (not e!569430))))

(assert (=> d!120261 (= res!679946 (isStrictlySorted!529 (t!30350 l!412)))))

(assert (=> d!120261 (= (lemmaForallGetValueByKeySameWithASmallerHead!6 (t!30350 l!412) lt!447313 value!115 (h!22543 l!412)) lt!447428)))

(declare-fun b!1012265 () Bool)

(declare-fun res!679947 () Bool)

(assert (=> b!1012265 (=> (not res!679947) (not e!569430))))

(declare-fun isEmpty!788 (List!21349) Bool)

(assert (=> b!1012265 (= res!679947 (not (isEmpty!788 (t!30350 l!412))))))

(declare-fun res!679948 () Bool)

(assert (=> b!1012266 (=> (not res!679948) (not e!569430))))

(assert (=> b!1012266 (= res!679948 (forall!208 lt!447313 lambda!332))))

(declare-fun b!1012267 () Bool)

(declare-fun head!925 (List!21349) tuple2!15044)

(assert (=> b!1012267 (= e!569430 (bvslt (_1!7533 (h!22543 l!412)) (_1!7533 (head!925 (t!30350 l!412)))))))

(assert (= (and d!120261 res!679946) b!1012265))

(assert (= (and b!1012265 res!679947) b!1012266))

(assert (= (and b!1012266 res!679948) b!1012267))

(declare-fun m!935915 () Bool)

(assert (=> d!120261 m!935915))

(declare-fun m!935917 () Bool)

(assert (=> d!120261 m!935917))

(assert (=> d!120261 m!935855))

(declare-fun m!935919 () Bool)

(assert (=> b!1012265 m!935919))

(declare-fun m!935921 () Bool)

(assert (=> b!1012266 m!935921))

(declare-fun m!935923 () Bool)

(assert (=> b!1012267 m!935923))

(assert (=> b!1012118 d!120261))

(declare-fun d!120265 () Bool)

(declare-fun res!679960 () Bool)

(declare-fun e!569444 () Bool)

(assert (=> d!120265 (=> res!679960 e!569444)))

(assert (=> d!120265 (= res!679960 ((_ is Nil!21345) lt!447313))))

(assert (=> d!120265 (= (forall!208 lt!447313 lambda!290) e!569444)))

(declare-fun b!1012287 () Bool)

(declare-fun e!569445 () Bool)

(assert (=> b!1012287 (= e!569444 e!569445)))

(declare-fun res!679961 () Bool)

(assert (=> b!1012287 (=> (not res!679961) (not e!569445))))

(declare-fun dynLambda!1880 (Int (_ BitVec 64)) Bool)

(assert (=> b!1012287 (= res!679961 (dynLambda!1880 lambda!290 (h!22542 lt!447313)))))

(declare-fun b!1012288 () Bool)

(assert (=> b!1012288 (= e!569445 (forall!208 (t!30349 lt!447313) lambda!290))))

(assert (= (and d!120265 (not res!679960)) b!1012287))

(assert (= (and b!1012287 res!679961) b!1012288))

(declare-fun b_lambda!15231 () Bool)

(assert (=> (not b_lambda!15231) (not b!1012287)))

(declare-fun m!935935 () Bool)

(assert (=> b!1012287 m!935935))

(declare-fun m!935937 () Bool)

(assert (=> b!1012288 m!935937))

(assert (=> b!1012118 d!120265))

(declare-fun b!1012295 () Bool)

(declare-fun e!569450 () Bool)

(declare-fun tp!70265 () Bool)

(assert (=> b!1012295 (= e!569450 (and tp_is_empty!23397 tp!70265))))

(assert (=> b!1012122 (= tp!70259 e!569450)))

(assert (= (and b!1012122 ((_ is Cons!21345) (t!30350 l!412))) b!1012295))

(declare-fun b_lambda!15235 () Bool)

(assert (= b_lambda!15231 (or b!1012118 b_lambda!15235)))

(declare-fun bs!28804 () Bool)

(declare-fun d!120271 () Bool)

(assert (= bs!28804 (and d!120271 b!1012118)))

(declare-datatypes ((Option!568 0))(
  ( (Some!567 (v!14418 B!1330)) (None!566) )
))
(declare-fun getValueByKey!517 (List!21349 (_ BitVec 64)) Option!568)

(assert (=> bs!28804 (= (dynLambda!1880 lambda!290 (h!22542 lt!447313)) (= (getValueByKey!517 l!412 (h!22542 lt!447313)) (Some!567 value!115)))))

(declare-fun m!935943 () Bool)

(assert (=> bs!28804 m!935943))

(assert (=> b!1012287 d!120271))

(check-sat (not b!1012238) tp_is_empty!23397 (not b!1012266) (not bs!28804) (not d!120261) (not bm!42494) (not bm!42492) (not bm!42491) (not b!1012267) (not d!120243) (not b!1012288) (not b_lambda!15235) (not b!1012295) (not b!1012265) (not bm!42493) (not b!1012151))
(check-sat)
