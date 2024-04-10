; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92982 () Bool)

(assert start!92982)

(declare-fun b!1055262 () Bool)

(declare-fun res!704122 () Bool)

(declare-fun e!599709 () Bool)

(assert (=> b!1055262 (=> (not res!704122) (not e!599709))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055262 (= res!704122 (validKeyInArray!0 k!2747))))

(declare-fun b!1055263 () Bool)

(declare-fun e!599706 () Bool)

(declare-fun e!599704 () Bool)

(assert (=> b!1055263 (= e!599706 e!599704)))

(declare-fun res!704129 () Bool)

(assert (=> b!1055263 (=> res!704129 e!599704)))

(declare-fun lt!465711 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055263 (= res!704129 (bvsle lt!465711 i!1381))))

(declare-fun b!1055264 () Bool)

(declare-fun e!599703 () Bool)

(declare-fun e!599702 () Bool)

(assert (=> b!1055264 (= e!599703 e!599702)))

(declare-fun res!704128 () Bool)

(assert (=> b!1055264 (=> res!704128 e!599702)))

(declare-datatypes ((array!66558 0))(
  ( (array!66559 (arr!32008 (Array (_ BitVec 32) (_ BitVec 64))) (size!32544 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66558)

(assert (=> b!1055264 (= res!704128 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32544 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055264 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34574 0))(
  ( (Unit!34575) )
))
(declare-fun lt!465713 () Unit!34574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66558 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34574)

(assert (=> b!1055264 (= lt!465713 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465711 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22320 0))(
  ( (Nil!22317) (Cons!22316 (h!23525 (_ BitVec 64)) (t!31627 List!22320)) )
))
(declare-fun arrayNoDuplicates!0 (array!66558 (_ BitVec 32) List!22320) Bool)

(assert (=> b!1055264 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22317)))

(declare-fun lt!465712 () Unit!34574)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66558 (_ BitVec 32) (_ BitVec 32)) Unit!34574)

(assert (=> b!1055264 (= lt!465712 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!704120 () Bool)

(assert (=> start!92982 (=> (not res!704120) (not e!599709))))

(assert (=> start!92982 (= res!704120 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32544 a!3488)) (bvslt (size!32544 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92982 e!599709))

(assert (=> start!92982 true))

(declare-fun array_inv!24788 (array!66558) Bool)

(assert (=> start!92982 (array_inv!24788 a!3488)))

(declare-fun b!1055265 () Bool)

(declare-fun e!599705 () Bool)

(assert (=> b!1055265 (= e!599709 e!599705)))

(declare-fun res!704127 () Bool)

(assert (=> b!1055265 (=> (not res!704127) (not e!599705))))

(declare-fun lt!465714 () array!66558)

(assert (=> b!1055265 (= res!704127 (arrayContainsKey!0 lt!465714 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055265 (= lt!465714 (array!66559 (store (arr!32008 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32544 a!3488)))))

(declare-fun b!1055266 () Bool)

(declare-fun e!599710 () Bool)

(assert (=> b!1055266 (= e!599705 e!599710)))

(declare-fun res!704118 () Bool)

(assert (=> b!1055266 (=> (not res!704118) (not e!599710))))

(assert (=> b!1055266 (= res!704118 (not (= lt!465711 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66558 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055266 (= lt!465711 (arrayScanForKey!0 lt!465714 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055267 () Bool)

(declare-fun res!704119 () Bool)

(assert (=> b!1055267 (=> res!704119 e!599702)))

(declare-fun noDuplicate!1548 (List!22320) Bool)

(assert (=> b!1055267 (= res!704119 (not (noDuplicate!1548 Nil!22317)))))

(declare-fun b!1055268 () Bool)

(assert (=> b!1055268 (= e!599704 (arrayContainsKey!0 a!3488 k!2747 lt!465711))))

(declare-fun b!1055269 () Bool)

(assert (=> b!1055269 (= e!599710 (not e!599703))))

(declare-fun res!704123 () Bool)

(assert (=> b!1055269 (=> res!704123 e!599703)))

(assert (=> b!1055269 (= res!704123 (bvsle lt!465711 i!1381))))

(assert (=> b!1055269 e!599706))

(declare-fun res!704121 () Bool)

(assert (=> b!1055269 (=> (not res!704121) (not e!599706))))

(assert (=> b!1055269 (= res!704121 (= (select (store (arr!32008 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465711) k!2747))))

(declare-fun b!1055270 () Bool)

(declare-fun e!599707 () Bool)

(declare-fun contains!6180 (List!22320 (_ BitVec 64)) Bool)

(assert (=> b!1055270 (= e!599707 (not (contains!6180 Nil!22317 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055271 () Bool)

(assert (=> b!1055271 (= e!599702 e!599707)))

(declare-fun res!704124 () Bool)

(assert (=> b!1055271 (=> (not res!704124) (not e!599707))))

(assert (=> b!1055271 (= res!704124 (not (contains!6180 Nil!22317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055272 () Bool)

(declare-fun res!704126 () Bool)

(assert (=> b!1055272 (=> (not res!704126) (not e!599709))))

(assert (=> b!1055272 (= res!704126 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22317))))

(declare-fun b!1055273 () Bool)

(declare-fun res!704125 () Bool)

(assert (=> b!1055273 (=> (not res!704125) (not e!599709))))

(assert (=> b!1055273 (= res!704125 (= (select (arr!32008 a!3488) i!1381) k!2747))))

(assert (= (and start!92982 res!704120) b!1055272))

(assert (= (and b!1055272 res!704126) b!1055262))

(assert (= (and b!1055262 res!704122) b!1055273))

(assert (= (and b!1055273 res!704125) b!1055265))

(assert (= (and b!1055265 res!704127) b!1055266))

(assert (= (and b!1055266 res!704118) b!1055269))

(assert (= (and b!1055269 res!704121) b!1055263))

(assert (= (and b!1055263 (not res!704129)) b!1055268))

(assert (= (and b!1055269 (not res!704123)) b!1055264))

(assert (= (and b!1055264 (not res!704128)) b!1055267))

(assert (= (and b!1055267 (not res!704119)) b!1055271))

(assert (= (and b!1055271 res!704124) b!1055270))

(declare-fun m!975269 () Bool)

(assert (=> b!1055267 m!975269))

(declare-fun m!975271 () Bool)

(assert (=> b!1055273 m!975271))

(declare-fun m!975273 () Bool)

(assert (=> b!1055271 m!975273))

(declare-fun m!975275 () Bool)

(assert (=> b!1055272 m!975275))

(declare-fun m!975277 () Bool)

(assert (=> b!1055269 m!975277))

(declare-fun m!975279 () Bool)

(assert (=> b!1055269 m!975279))

(declare-fun m!975281 () Bool)

(assert (=> start!92982 m!975281))

(declare-fun m!975283 () Bool)

(assert (=> b!1055264 m!975283))

(declare-fun m!975285 () Bool)

(assert (=> b!1055264 m!975285))

(declare-fun m!975287 () Bool)

(assert (=> b!1055264 m!975287))

(declare-fun m!975289 () Bool)

(assert (=> b!1055264 m!975289))

(declare-fun m!975291 () Bool)

(assert (=> b!1055265 m!975291))

(assert (=> b!1055265 m!975277))

(declare-fun m!975293 () Bool)

(assert (=> b!1055266 m!975293))

(declare-fun m!975295 () Bool)

(assert (=> b!1055270 m!975295))

(declare-fun m!975297 () Bool)

(assert (=> b!1055268 m!975297))

(declare-fun m!975299 () Bool)

(assert (=> b!1055262 m!975299))

(push 1)

(assert (not b!1055272))

(assert (not b!1055268))

(assert (not b!1055271))

(assert (not b!1055267))

(assert (not b!1055264))

(assert (not b!1055262))

(assert (not b!1055265))

(assert (not b!1055270))

(assert (not start!92982))

(assert (not b!1055266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128153 () Bool)

(assert (=> d!128153 (= (array_inv!24788 a!3488) (bvsge (size!32544 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92982 d!128153))

(declare-fun d!128155 () Bool)

(declare-fun res!704221 () Bool)

(declare-fun e!599787 () Bool)

(assert (=> d!128155 (=> res!704221 e!599787)))

(assert (=> d!128155 (= res!704221 (= (select (arr!32008 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k!2747))))

(assert (=> d!128155 (= (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599787)))

(declare-fun b!1055371 () Bool)

(declare-fun e!599788 () Bool)

(assert (=> b!1055371 (= e!599787 e!599788)))

(declare-fun res!704222 () Bool)

(assert (=> b!1055371 (=> (not res!704222) (not e!599788))))

(assert (=> b!1055371 (= res!704222 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32544 a!3488)))))

(declare-fun b!1055372 () Bool)

(assert (=> b!1055372 (= e!599788 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128155 (not res!704221)) b!1055371))

(assert (= (and b!1055371 res!704222) b!1055372))

(declare-fun m!975377 () Bool)

(assert (=> d!128155 m!975377))

(declare-fun m!975379 () Bool)

(assert (=> b!1055372 m!975379))

(assert (=> b!1055264 d!128155))

(declare-fun d!128159 () Bool)

(assert (=> d!128159 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465741 () Unit!34574)

(declare-fun choose!114 (array!66558 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34574)

(assert (=> d!128159 (= lt!465741 (choose!114 a!3488 k!2747 lt!465711 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128159 (bvsge lt!465711 #b00000000000000000000000000000000)))

(assert (=> d!128159 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465711 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465741)))

(declare-fun bs!30934 () Bool)

(assert (= bs!30934 d!128159))

(assert (=> bs!30934 m!975283))

(declare-fun m!975381 () Bool)

(assert (=> bs!30934 m!975381))

(assert (=> b!1055264 d!128159))

(declare-fun b!1055388 () Bool)

(declare-fun e!599803 () Bool)

(declare-fun e!599802 () Bool)

(assert (=> b!1055388 (= e!599803 e!599802)))

(declare-fun res!704233 () Bool)

(assert (=> b!1055388 (=> (not res!704233) (not e!599802))))

(declare-fun e!599801 () Bool)

(assert (=> b!1055388 (= res!704233 (not e!599801))))

(declare-fun res!704234 () Bool)

(assert (=> b!1055388 (=> (not res!704234) (not e!599801))))

(assert (=> b!1055388 (= res!704234 (validKeyInArray!0 (select (arr!32008 a!3488) i!1381)))))

(declare-fun b!1055389 () Bool)

(declare-fun e!599804 () Bool)

(assert (=> b!1055389 (= e!599802 e!599804)))

(declare-fun c!107038 () Bool)

(assert (=> b!1055389 (= c!107038 (validKeyInArray!0 (select (arr!32008 a!3488) i!1381)))))

(declare-fun b!1055390 () Bool)

(declare-fun call!44801 () Bool)

(assert (=> b!1055390 (= e!599804 call!44801)))

(declare-fun b!1055391 () Bool)

(assert (=> b!1055391 (= e!599804 call!44801)))

(declare-fun bm!44798 () Bool)

(assert (=> bm!44798 (= call!44801 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107038 (Cons!22316 (select (arr!32008 a!3488) i!1381) Nil!22317) Nil!22317)))))

(declare-fun b!1055392 () Bool)

(assert (=> b!1055392 (= e!599801 (contains!6180 Nil!22317 (select (arr!32008 a!3488) i!1381)))))

(declare-fun d!128161 () Bool)

(declare-fun res!704232 () Bool)

(assert (=> d!128161 (=> res!704232 e!599803)))

(assert (=> d!128161 (= res!704232 (bvsge i!1381 (size!32544 a!3488)))))

(assert (=> d!128161 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22317) e!599803)))

(assert (= (and d!128161 (not res!704232)) b!1055388))

(assert (= (and b!1055388 res!704234) b!1055392))

(assert (= (and b!1055388 res!704233) b!1055389))

(assert (= (and b!1055389 c!107038) b!1055391))

(assert (= (and b!1055389 (not c!107038)) b!1055390))

(assert (= (or b!1055391 b!1055390) bm!44798))

(assert (=> b!1055388 m!975271))

(assert (=> b!1055388 m!975271))

(declare-fun m!975391 () Bool)

(assert (=> b!1055388 m!975391))

(assert (=> b!1055389 m!975271))

(assert (=> b!1055389 m!975271))

(assert (=> b!1055389 m!975391))

(assert (=> bm!44798 m!975271))

(declare-fun m!975393 () Bool)

(assert (=> bm!44798 m!975393))

(assert (=> b!1055392 m!975271))

(assert (=> b!1055392 m!975271))

(declare-fun m!975395 () Bool)

(assert (=> b!1055392 m!975395))

(assert (=> b!1055264 d!128161))

(declare-fun d!128167 () Bool)

(assert (=> d!128167 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22317)))

(declare-fun lt!465750 () Unit!34574)

(declare-fun choose!39 (array!66558 (_ BitVec 32) (_ BitVec 32)) Unit!34574)

(assert (=> d!128167 (= lt!465750 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128167 (bvslt (size!32544 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128167 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465750)))

(declare-fun bs!30937 () Bool)

(assert (= bs!30937 d!128167))

(assert (=> bs!30937 m!975287))

(declare-fun m!975399 () Bool)

(assert (=> bs!30937 m!975399))

(assert (=> b!1055264 d!128167))

(declare-fun d!128171 () Bool)

(declare-fun lt!465753 () Bool)

(declare-fun content!529 (List!22320) (Set (_ BitVec 64)))

(assert (=> d!128171 (= lt!465753 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!529 Nil!22317)))))

(declare-fun e!599810 () Bool)

(assert (=> d!128171 (= lt!465753 e!599810)))

(declare-fun res!704239 () Bool)

(assert (=> d!128171 (=> (not res!704239) (not e!599810))))

(assert (=> d!128171 (= res!704239 (is-Cons!22316 Nil!22317))))

(assert (=> d!128171 (= (contains!6180 Nil!22317 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465753)))

(declare-fun b!1055397 () Bool)

(declare-fun e!599809 () Bool)

(assert (=> b!1055397 (= e!599810 e!599809)))

(declare-fun res!704240 () Bool)

(assert (=> b!1055397 (=> res!704240 e!599809)))

(assert (=> b!1055397 (= res!704240 (= (h!23525 Nil!22317) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055398 () Bool)

(assert (=> b!1055398 (= e!599809 (contains!6180 (t!31627 Nil!22317) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128171 res!704239) b!1055397))

(assert (= (and b!1055397 (not res!704240)) b!1055398))

(declare-fun m!975401 () Bool)

(assert (=> d!128171 m!975401))

(declare-fun m!975403 () Bool)

(assert (=> d!128171 m!975403))

(declare-fun m!975405 () Bool)

(assert (=> b!1055398 m!975405))

(assert (=> b!1055270 d!128171))

(declare-fun d!128175 () Bool)

(declare-fun res!704241 () Bool)

(declare-fun e!599811 () Bool)

(assert (=> d!128175 (=> res!704241 e!599811)))

(assert (=> d!128175 (= res!704241 (= (select (arr!32008 lt!465714) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128175 (= (arrayContainsKey!0 lt!465714 k!2747 #b00000000000000000000000000000000) e!599811)))

(declare-fun b!1055399 () Bool)

(declare-fun e!599812 () Bool)

(assert (=> b!1055399 (= e!599811 e!599812)))

(declare-fun res!704242 () Bool)

(assert (=> b!1055399 (=> (not res!704242) (not e!599812))))

(assert (=> b!1055399 (= res!704242 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32544 lt!465714)))))

(declare-fun b!1055400 () Bool)

(assert (=> b!1055400 (= e!599812 (arrayContainsKey!0 lt!465714 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128175 (not res!704241)) b!1055399))

(assert (= (and b!1055399 res!704242) b!1055400))

(declare-fun m!975407 () Bool)

(assert (=> d!128175 m!975407))

(declare-fun m!975409 () Bool)

(assert (=> b!1055400 m!975409))

(assert (=> b!1055265 d!128175))

(declare-fun d!128177 () Bool)

(declare-fun lt!465762 () (_ BitVec 32))

(assert (=> d!128177 (and (or (bvslt lt!465762 #b00000000000000000000000000000000) (bvsge lt!465762 (size!32544 lt!465714)) (and (bvsge lt!465762 #b00000000000000000000000000000000) (bvslt lt!465762 (size!32544 lt!465714)))) (bvsge lt!465762 #b00000000000000000000000000000000) (bvslt lt!465762 (size!32544 lt!465714)) (= (select (arr!32008 lt!465714) lt!465762) k!2747))))

(declare-fun e!599840 () (_ BitVec 32))

(assert (=> d!128177 (= lt!465762 e!599840)))

(declare-fun c!107047 () Bool)

(assert (=> d!128177 (= c!107047 (= (select (arr!32008 lt!465714) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32544 lt!465714)) (bvslt (size!32544 lt!465714) #b01111111111111111111111111111111))))

(assert (=> d!128177 (= (arrayScanForKey!0 lt!465714 k!2747 #b00000000000000000000000000000000) lt!465762)))

(declare-fun b!1055436 () Bool)

(assert (=> b!1055436 (= e!599840 #b00000000000000000000000000000000)))

(declare-fun b!1055437 () Bool)

(assert (=> b!1055437 (= e!599840 (arrayScanForKey!0 lt!465714 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128177 c!107047) b!1055436))

(assert (= (and d!128177 (not c!107047)) b!1055437))

(declare-fun m!975437 () Bool)

(assert (=> d!128177 m!975437))

(assert (=> d!128177 m!975407))

(declare-fun m!975439 () Bool)

(assert (=> b!1055437 m!975439))

(assert (=> b!1055266 d!128177))

(declare-fun d!128189 () Bool)

(declare-fun lt!465764 () Bool)

(assert (=> d!128189 (= lt!465764 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!529 Nil!22317)))))

(declare-fun e!599844 () Bool)

(assert (=> d!128189 (= lt!465764 e!599844)))

(declare-fun res!704264 () Bool)

(assert (=> d!128189 (=> (not res!704264) (not e!599844))))

(assert (=> d!128189 (= res!704264 (is-Cons!22316 Nil!22317))))

(assert (=> d!128189 (= (contains!6180 Nil!22317 #b0000000000000000000000000000000000000000000000000000000000000000) lt!465764)))

(declare-fun b!1055440 () Bool)

(declare-fun e!599843 () Bool)

(assert (=> b!1055440 (= e!599844 e!599843)))

(declare-fun res!704265 () Bool)

(assert (=> b!1055440 (=> res!704265 e!599843)))

(assert (=> b!1055440 (= res!704265 (= (h!23525 Nil!22317) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055441 () Bool)

(assert (=> b!1055441 (= e!599843 (contains!6180 (t!31627 Nil!22317) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128189 res!704264) b!1055440))

(assert (= (and b!1055440 (not res!704265)) b!1055441))

(assert (=> d!128189 m!975401))

(declare-fun m!975445 () Bool)

(assert (=> d!128189 m!975445))

(declare-fun m!975447 () Bool)

(assert (=> b!1055441 m!975447))

(assert (=> b!1055271 d!128189))

(declare-fun b!1055446 () Bool)

(declare-fun e!599851 () Bool)

(declare-fun e!599850 () Bool)

(assert (=> b!1055446 (= e!599851 e!599850)))

(declare-fun res!704271 () Bool)

(assert (=> b!1055446 (=> (not res!704271) (not e!599850))))

(declare-fun e!599849 () Bool)

(assert (=> b!1055446 (= res!704271 (not e!599849))))

(declare-fun res!704272 () Bool)

(assert (=> b!1055446 (=> (not res!704272) (not e!599849))))

(assert (=> b!1055446 (= res!704272 (validKeyInArray!0 (select (arr!32008 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055447 () Bool)

(declare-fun e!599852 () Bool)

(assert (=> b!1055447 (= e!599850 e!599852)))

(declare-fun c!107048 () Bool)

(assert (=> b!1055447 (= c!107048 (validKeyInArray!0 (select (arr!32008 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055448 () Bool)

(declare-fun call!44805 () Bool)

(assert (=> b!1055448 (= e!599852 call!44805)))

(declare-fun b!1055449 () Bool)

(assert (=> b!1055449 (= e!599852 call!44805)))

(declare-fun bm!44802 () Bool)

(assert (=> bm!44802 (= call!44805 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107048 (Cons!22316 (select (arr!32008 a!3488) #b00000000000000000000000000000000) Nil!22317) Nil!22317)))))

(declare-fun b!1055450 () Bool)

(assert (=> b!1055450 (= e!599849 (contains!6180 Nil!22317 (select (arr!32008 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128193 () Bool)

(declare-fun res!704270 () Bool)

(assert (=> d!128193 (=> res!704270 e!599851)))

(assert (=> d!128193 (= res!704270 (bvsge #b00000000000000000000000000000000 (size!32544 a!3488)))))

(assert (=> d!128193 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22317) e!599851)))

(assert (= (and d!128193 (not res!704270)) b!1055446))

(assert (= (and b!1055446 res!704272) b!1055450))

(assert (= (and b!1055446 res!704271) b!1055447))

(assert (= (and b!1055447 c!107048) b!1055449))

(assert (= (and b!1055447 (not c!107048)) b!1055448))

(assert (= (or b!1055449 b!1055448) bm!44802))

(declare-fun m!975449 () Bool)

(assert (=> b!1055446 m!975449))

(assert (=> b!1055446 m!975449))

(declare-fun m!975451 () Bool)

(assert (=> b!1055446 m!975451))

(assert (=> b!1055447 m!975449))

(assert (=> b!1055447 m!975449))

(assert (=> b!1055447 m!975451))

(assert (=> bm!44802 m!975449))

(declare-fun m!975453 () Bool)

(assert (=> bm!44802 m!975453))

(assert (=> b!1055450 m!975449))

(assert (=> b!1055450 m!975449))

(declare-fun m!975455 () Bool)

(assert (=> b!1055450 m!975455))

(assert (=> b!1055272 d!128193))

(declare-fun d!128195 () Bool)

(assert (=> d!128195 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055262 d!128195))

(declare-fun d!128201 () Bool)

(declare-fun res!704287 () Bool)

(declare-fun e!599867 () Bool)

(assert (=> d!128201 (=> res!704287 e!599867)))

(assert (=> d!128201 (= res!704287 (is-Nil!22317 Nil!22317))))

(assert (=> d!128201 (= (noDuplicate!1548 Nil!22317) e!599867)))

(declare-fun b!1055465 () Bool)

(declare-fun e!599868 () Bool)

(assert (=> b!1055465 (= e!599867 e!599868)))

(declare-fun res!704288 () Bool)

(assert (=> b!1055465 (=> (not res!704288) (not e!599868))))

(assert (=> b!1055465 (= res!704288 (not (contains!6180 (t!31627 Nil!22317) (h!23525 Nil!22317))))))

(declare-fun b!1055466 () Bool)

(assert (=> b!1055466 (= e!599868 (noDuplicate!1548 (t!31627 Nil!22317)))))

(assert (= (and d!128201 (not res!704287)) b!1055465))

(assert (= (and b!1055465 res!704288) b!1055466))

(declare-fun m!975469 () Bool)

(assert (=> b!1055465 m!975469))

(declare-fun m!975471 () Bool)

(assert (=> b!1055466 m!975471))

(assert (=> b!1055267 d!128201))

(declare-fun d!128207 () Bool)

(declare-fun res!704289 () Bool)

(declare-fun e!599869 () Bool)

(assert (=> d!128207 (=> res!704289 e!599869)))

(assert (=> d!128207 (= res!704289 (= (select (arr!32008 a!3488) lt!465711) k!2747))))

(assert (=> d!128207 (= (arrayContainsKey!0 a!3488 k!2747 lt!465711) e!599869)))

(declare-fun b!1055467 () Bool)

(declare-fun e!599870 () Bool)

(assert (=> b!1055467 (= e!599869 e!599870)))

(declare-fun res!704290 () Bool)

(assert (=> b!1055467 (=> (not res!704290) (not e!599870))))

(assert (=> b!1055467 (= res!704290 (bvslt (bvadd lt!465711 #b00000000000000000000000000000001) (size!32544 a!3488)))))

(declare-fun b!1055468 () Bool)

(assert (=> b!1055468 (= e!599870 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465711 #b00000000000000000000000000000001)))))

(assert (= (and d!128207 (not res!704289)) b!1055467))

(assert (= (and b!1055467 res!704290) b!1055468))

(declare-fun m!975473 () Bool)

(assert (=> d!128207 m!975473))

(declare-fun m!975475 () Bool)

(assert (=> b!1055468 m!975475))

(assert (=> b!1055268 d!128207))

(push 1)

