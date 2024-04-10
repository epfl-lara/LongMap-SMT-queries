; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87840 () Bool)

(assert start!87840)

(declare-fun b!1015160 () Bool)

(assert (=> b!1015160 true))

(assert (=> b!1015160 true))

(declare-fun bs!29364 () Bool)

(declare-fun b!1015159 () Bool)

(assert (= bs!29364 (and b!1015159 b!1015160)))

(declare-fun lambda!833 () Int)

(declare-fun lambda!832 () Int)

(assert (=> bs!29364 (= lambda!833 lambda!832)))

(assert (=> b!1015159 true))

(assert (=> b!1015159 true))

(declare-fun b!1015156 () Bool)

(declare-fun e!571072 () Bool)

(declare-fun tp_is_empty!23521 () Bool)

(declare-fun tp!70592 () Bool)

(assert (=> b!1015156 (= e!571072 (and tp_is_empty!23521 tp!70592))))

(declare-fun b!1015157 () Bool)

(declare-datatypes ((Unit!33212 0))(
  ( (Unit!33213) )
))
(declare-fun e!571071 () Unit!33212)

(declare-fun Unit!33214 () Unit!33212)

(assert (=> b!1015157 (= e!571071 Unit!33214)))

(declare-fun b!1015158 () Bool)

(declare-fun res!681008 () Bool)

(declare-fun e!571070 () Bool)

(assert (=> b!1015158 (=> (not res!681008) (not e!571070))))

(declare-datatypes ((B!1454 0))(
  ( (B!1455 (val!11811 Int)) )
))
(declare-datatypes ((tuple2!15168 0))(
  ( (tuple2!15169 (_1!7595 (_ BitVec 64)) (_2!7595 B!1454)) )
))
(declare-datatypes ((List!21454 0))(
  ( (Nil!21451) (Cons!21450 (h!22648 tuple2!15168) (t!30455 List!21454)) )
))
(declare-fun l!412 () List!21454)

(declare-fun value!115 () B!1454)

(assert (=> b!1015158 (= res!681008 (and (not (= (_2!7595 (h!22648 l!412)) value!115)) (is-Cons!21450 l!412)))))

(declare-fun res!681009 () Bool)

(assert (=> start!87840 (=> (not res!681009) (not e!571070))))

(declare-fun isStrictlySorted!585 (List!21454) Bool)

(assert (=> start!87840 (= res!681009 (isStrictlySorted!585 l!412))))

(assert (=> start!87840 e!571070))

(assert (=> start!87840 e!571072))

(assert (=> start!87840 tp_is_empty!23521))

(declare-datatypes ((List!21455 0))(
  ( (Nil!21452) (Cons!21451 (h!22649 (_ BitVec 64)) (t!30456 List!21455)) )
))
(declare-fun lt!449012 () List!21455)

(declare-fun forall!250 (List!21455 Int) Bool)

(assert (=> b!1015159 (= e!571070 (not (forall!250 lt!449012 lambda!833)))))

(declare-fun lt!449011 () Unit!33212)

(assert (=> b!1015159 (= lt!449011 e!571071)))

(declare-fun c!102849 () Bool)

(declare-fun isEmpty!850 (List!21455) Bool)

(assert (=> b!1015159 (= c!102849 (not (isEmpty!850 lt!449012)))))

(declare-fun getKeysOf!58 (List!21454 B!1454) List!21455)

(assert (=> b!1015159 (= lt!449012 (getKeysOf!58 (t!30455 l!412) value!115))))

(declare-fun lt!449013 () Unit!33212)

(assert (=> b!1015160 (= e!571071 lt!449013)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!44 (List!21454 List!21455 B!1454 tuple2!15168) Unit!33212)

(assert (=> b!1015160 (= lt!449013 (lemmaForallGetValueByKeySameWithASmallerHead!44 (t!30455 l!412) lt!449012 value!115 (h!22648 l!412)))))

(assert (=> b!1015160 (forall!250 lt!449012 lambda!832)))

(assert (= (and start!87840 res!681009) b!1015158))

(assert (= (and b!1015158 res!681008) b!1015159))

(assert (= (and b!1015159 c!102849) b!1015160))

(assert (= (and b!1015159 (not c!102849)) b!1015157))

(assert (= (and start!87840 (is-Cons!21450 l!412)) b!1015156))

(declare-fun m!937377 () Bool)

(assert (=> start!87840 m!937377))

(declare-fun m!937379 () Bool)

(assert (=> b!1015159 m!937379))

(declare-fun m!937381 () Bool)

(assert (=> b!1015159 m!937381))

(declare-fun m!937383 () Bool)

(assert (=> b!1015159 m!937383))

(declare-fun m!937385 () Bool)

(assert (=> b!1015160 m!937385))

(declare-fun m!937387 () Bool)

(assert (=> b!1015160 m!937387))

(push 1)

(assert (not b!1015159))

(assert (not b!1015160))

(assert tp_is_empty!23521)

(assert (not start!87840))

(assert (not b!1015156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120909 () Bool)

(declare-fun res!681026 () Bool)

(declare-fun e!571095 () Bool)

(assert (=> d!120909 (=> res!681026 e!571095)))

(assert (=> d!120909 (= res!681026 (is-Nil!21452 lt!449012))))

(assert (=> d!120909 (= (forall!250 lt!449012 lambda!833) e!571095)))

(declare-fun b!1015207 () Bool)

(declare-fun e!571096 () Bool)

(assert (=> b!1015207 (= e!571095 e!571096)))

(declare-fun res!681027 () Bool)

(assert (=> b!1015207 (=> (not res!681027) (not e!571096))))

(declare-fun dynLambda!1896 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015207 (= res!681027 (dynLambda!1896 lambda!833 (h!22649 lt!449012)))))

(declare-fun b!1015208 () Bool)

(assert (=> b!1015208 (= e!571096 (forall!250 (t!30456 lt!449012) lambda!833))))

(assert (= (and d!120909 (not res!681026)) b!1015207))

(assert (= (and b!1015207 res!681027) b!1015208))

(declare-fun b_lambda!15391 () Bool)

(assert (=> (not b_lambda!15391) (not b!1015207)))

(declare-fun m!937413 () Bool)

(assert (=> b!1015207 m!937413))

(declare-fun m!937415 () Bool)

(assert (=> b!1015208 m!937415))

(assert (=> b!1015159 d!120909))

(declare-fun d!120911 () Bool)

(assert (=> d!120911 (= (isEmpty!850 lt!449012) (is-Nil!21452 lt!449012))))

(assert (=> b!1015159 d!120911))

(declare-fun bs!29372 () Bool)

(declare-fun b!1015271 () Bool)

(assert (= bs!29372 (and b!1015271 b!1015160)))

(declare-fun lt!449074 () tuple2!15168)

(declare-fun lt!449072 () List!21454)

(declare-fun lambda!858 () Int)

(assert (=> bs!29372 (= (= (Cons!21450 lt!449074 lt!449072) l!412) (= lambda!858 lambda!832))))

(declare-fun bs!29373 () Bool)

(assert (= bs!29373 (and b!1015271 b!1015159)))

(assert (=> bs!29373 (= (= (Cons!21450 lt!449074 lt!449072) l!412) (= lambda!858 lambda!833))))

(assert (=> b!1015271 true))

(assert (=> b!1015271 true))

(assert (=> b!1015271 true))

(declare-fun bs!29374 () Bool)

(declare-fun b!1015268 () Bool)

(assert (= bs!29374 (and b!1015268 b!1015160)))

(declare-fun lt!449076 () tuple2!15168)

(declare-fun lt!449075 () List!21454)

(declare-fun lambda!861 () Int)

(assert (=> bs!29374 (= (= (Cons!21450 lt!449076 lt!449075) l!412) (= lambda!861 lambda!832))))

(declare-fun bs!29375 () Bool)

(assert (= bs!29375 (and b!1015268 b!1015159)))

(assert (=> bs!29375 (= (= (Cons!21450 lt!449076 lt!449075) l!412) (= lambda!861 lambda!833))))

(declare-fun bs!29376 () Bool)

(assert (= bs!29376 (and b!1015268 b!1015271)))

(assert (=> bs!29376 (= (= (Cons!21450 lt!449076 lt!449075) (Cons!21450 lt!449074 lt!449072)) (= lambda!861 lambda!858))))

(assert (=> b!1015268 true))

(assert (=> b!1015268 true))

(assert (=> b!1015268 true))

(declare-fun bs!29377 () Bool)

(declare-fun d!120913 () Bool)

(assert (= bs!29377 (and d!120913 b!1015160)))

(declare-fun lambda!862 () Int)

(assert (=> bs!29377 (= (= (t!30455 l!412) l!412) (= lambda!862 lambda!832))))

(declare-fun bs!29378 () Bool)

(assert (= bs!29378 (and d!120913 b!1015159)))

(assert (=> bs!29378 (= (= (t!30455 l!412) l!412) (= lambda!862 lambda!833))))

(declare-fun bs!29379 () Bool)

(assert (= bs!29379 (and d!120913 b!1015271)))

(assert (=> bs!29379 (= (= (t!30455 l!412) (Cons!21450 lt!449074 lt!449072)) (= lambda!862 lambda!858))))

(declare-fun bs!29380 () Bool)

(assert (= bs!29380 (and d!120913 b!1015268)))

(assert (=> bs!29380 (= (= (t!30455 l!412) (Cons!21450 lt!449076 lt!449075)) (= lambda!862 lambda!861))))

(assert (=> d!120913 true))

(assert (=> d!120913 true))

(declare-fun b!1015264 () Bool)

(declare-fun e!571133 () List!21455)

(assert (=> b!1015264 (= e!571133 Nil!21452)))

(declare-fun b!1015265 () Bool)

(declare-fun e!571135 () Unit!33212)

(declare-fun Unit!33221 () Unit!33212)

(assert (=> b!1015265 (= e!571135 Unit!33221)))

(declare-fun lt!449067 () List!21455)

(declare-fun bm!42927 () Bool)

(declare-fun call!42931 () Bool)

(declare-fun lt!449079 () List!21455)

(declare-fun c!102870 () Bool)

(assert (=> bm!42927 (= call!42931 (forall!250 (ite c!102870 lt!449067 lt!449079) (ite c!102870 lambda!858 lambda!861)))))

(declare-fun bm!42928 () Bool)

(declare-fun call!42932 () List!21455)

(assert (=> bm!42928 (= call!42932 (getKeysOf!58 (t!30455 (t!30455 l!412)) value!115))))

(declare-fun b!1015266 () Bool)

(declare-fun e!571134 () List!21455)

(assert (=> b!1015266 (= e!571134 (Cons!21451 (_1!7595 (h!22648 (t!30455 l!412))) call!42932))))

(declare-fun c!102869 () Bool)

(declare-fun call!42930 () Bool)

(assert (=> b!1015266 (= c!102869 (not call!42930))))

(declare-fun lt!449071 () Unit!33212)

(assert (=> b!1015266 (= lt!449071 e!571135)))

(declare-fun bm!42929 () Bool)

(assert (=> bm!42929 (= call!42930 (isEmpty!850 call!42932))))

(declare-fun b!1015267 () Bool)

(declare-fun e!571132 () Unit!33212)

(declare-fun Unit!33222 () Unit!33212)

(assert (=> b!1015267 (= e!571132 Unit!33222)))

(declare-fun lt!449080 () Unit!33212)

(assert (=> b!1015268 (= e!571132 lt!449080)))

(assert (=> b!1015268 (= lt!449075 (t!30455 (t!30455 l!412)))))

(assert (=> b!1015268 (= lt!449079 call!42932)))

(assert (=> b!1015268 (= lt!449076 (h!22648 (t!30455 l!412)))))

(declare-fun call!42933 () Unit!33212)

(assert (=> b!1015268 (= lt!449080 call!42933)))

(assert (=> b!1015268 call!42931))

(declare-fun b!1015269 () Bool)

(declare-fun lt!449073 () Unit!33212)

(assert (=> b!1015269 (= lt!449073 e!571132)))

(declare-fun c!102868 () Bool)

(assert (=> b!1015269 (= c!102868 (not call!42930))))

(declare-fun lt!449077 () List!21455)

(assert (=> b!1015269 (= lt!449077 call!42932)))

(assert (=> b!1015269 (= e!571133 call!42932)))

(declare-fun b!1015270 () Bool)

(assert (=> b!1015270 (= e!571134 e!571133)))

(declare-fun c!102871 () Bool)

(assert (=> b!1015270 (= c!102871 (and (is-Cons!21450 (t!30455 l!412)) (not (= (_2!7595 (h!22648 (t!30455 l!412))) value!115))))))

(assert (=> b!1015271 call!42931))

(declare-fun lt!449070 () Unit!33212)

(assert (=> b!1015271 (= lt!449070 call!42933)))

(assert (=> b!1015271 (= lt!449074 (h!22648 (t!30455 l!412)))))

(assert (=> b!1015271 (= lt!449067 call!42932)))

(assert (=> b!1015271 (= lt!449072 (t!30455 (t!30455 l!412)))))

(assert (=> b!1015271 (= e!571135 lt!449070)))

(declare-fun bm!42930 () Bool)

(assert (=> bm!42930 (= call!42933 (lemmaForallGetValueByKeySameWithASmallerHead!44 (ite c!102870 lt!449072 lt!449075) (ite c!102870 lt!449067 lt!449079) value!115 (ite c!102870 lt!449074 lt!449076)))))

(declare-fun lt!449078 () List!21455)

(assert (=> d!120913 (forall!250 lt!449078 lambda!862)))

(assert (=> d!120913 (= lt!449078 e!571134)))

(assert (=> d!120913 (= c!102870 (and (is-Cons!21450 (t!30455 l!412)) (= (_2!7595 (h!22648 (t!30455 l!412))) value!115)))))

(assert (=> d!120913 (isStrictlySorted!585 (t!30455 l!412))))

(assert (=> d!120913 (= (getKeysOf!58 (t!30455 l!412) value!115) lt!449078)))

(assert (= (and d!120913 c!102870) b!1015266))

(assert (= (and d!120913 (not c!102870)) b!1015270))

(assert (= (and b!1015266 c!102869) b!1015271))

(assert (= (and b!1015266 (not c!102869)) b!1015265))

(assert (= (and b!1015270 c!102871) b!1015269))

(assert (= (and b!1015270 (not c!102871)) b!1015264))

(assert (= (and b!1015269 c!102868) b!1015268))

(assert (= (and b!1015269 (not c!102868)) b!1015267))

(assert (= (or b!1015271 b!1015268) bm!42930))

(assert (= (or b!1015271 b!1015268) bm!42927))

(assert (= (or b!1015266 b!1015271 b!1015268 b!1015269) bm!42928))

(assert (= (or b!1015266 b!1015269) bm!42929))

(declare-fun m!937443 () Bool)

(assert (=> d!120913 m!937443))

(declare-fun m!937445 () Bool)

(assert (=> d!120913 m!937445))

(declare-fun m!937447 () Bool)

(assert (=> bm!42930 m!937447))

(declare-fun m!937449 () Bool)

(assert (=> bm!42927 m!937449))

(declare-fun m!937451 () Bool)

(assert (=> bm!42928 m!937451))

(declare-fun m!937453 () Bool)

(assert (=> bm!42929 m!937453))

(assert (=> b!1015159 d!120913))

(declare-fun bs!29385 () Bool)

(declare-fun b!1015313 () Bool)

(assert (= bs!29385 (and b!1015313 b!1015160)))

(declare-fun lambda!874 () Int)

(assert (=> bs!29385 (= (= (t!30455 l!412) l!412) (= lambda!874 lambda!832))))

(declare-fun bs!29387 () Bool)

(assert (= bs!29387 (and b!1015313 b!1015271)))

(assert (=> bs!29387 (= (= (t!30455 l!412) (Cons!21450 lt!449074 lt!449072)) (= lambda!874 lambda!858))))

(declare-fun bs!29389 () Bool)

(assert (= bs!29389 (and b!1015313 b!1015268)))

(assert (=> bs!29389 (= (= (t!30455 l!412) (Cons!21450 lt!449076 lt!449075)) (= lambda!874 lambda!861))))

(declare-fun bs!29391 () Bool)

(assert (= bs!29391 (and b!1015313 d!120913)))

(assert (=> bs!29391 (= lambda!874 lambda!862)))

(declare-fun bs!29393 () Bool)

(assert (= bs!29393 (and b!1015313 b!1015159)))

(assert (=> bs!29393 (= (= (t!30455 l!412) l!412) (= lambda!874 lambda!833))))

(assert (=> b!1015313 true))

(assert (=> b!1015313 true))

(declare-fun bs!29395 () Bool)

(declare-fun d!120931 () Bool)

(assert (= bs!29395 (and d!120931 b!1015160)))

(declare-fun lambda!878 () Int)

(assert (=> bs!29395 (= (= (Cons!21450 (h!22648 l!412) (t!30455 l!412)) l!412) (= lambda!878 lambda!832))))

(declare-fun bs!29397 () Bool)

(assert (= bs!29397 (and d!120931 b!1015271)))

(assert (=> bs!29397 (= (= (Cons!21450 (h!22648 l!412) (t!30455 l!412)) (Cons!21450 lt!449074 lt!449072)) (= lambda!878 lambda!858))))

(declare-fun bs!29399 () Bool)

(assert (= bs!29399 (and d!120931 b!1015268)))

(assert (=> bs!29399 (= (= (Cons!21450 (h!22648 l!412) (t!30455 l!412)) (Cons!21450 lt!449076 lt!449075)) (= lambda!878 lambda!861))))

(declare-fun bs!29401 () Bool)

(assert (= bs!29401 (and d!120931 d!120913)))

(assert (=> bs!29401 (= (= (Cons!21450 (h!22648 l!412) (t!30455 l!412)) (t!30455 l!412)) (= lambda!878 lambda!862))))

(declare-fun bs!29403 () Bool)

(assert (= bs!29403 (and d!120931 b!1015159)))

(assert (=> bs!29403 (= (= (Cons!21450 (h!22648 l!412) (t!30455 l!412)) l!412) (= lambda!878 lambda!833))))

(declare-fun bs!29405 () Bool)

(assert (= bs!29405 (and d!120931 b!1015313)))

(assert (=> bs!29405 (= (= (Cons!21450 (h!22648 l!412) (t!30455 l!412)) (t!30455 l!412)) (= lambda!878 lambda!874))))

(assert (=> d!120931 true))

(assert (=> d!120931 true))

(assert (=> d!120931 true))

(assert (=> d!120931 (forall!250 lt!449012 lambda!878)))

(declare-fun lt!449133 () Unit!33212)

(declare-fun choose!1638 (List!21454 List!21455 B!1454 tuple2!15168) Unit!33212)

(assert (=> d!120931 (= lt!449133 (choose!1638 (t!30455 l!412) lt!449012 value!115 (h!22648 l!412)))))

(declare-fun e!571154 () Bool)

(assert (=> d!120931 e!571154))

(declare-fun res!681064 () Bool)

(assert (=> d!120931 (=> (not res!681064) (not e!571154))))

(assert (=> d!120931 (= res!681064 (isStrictlySorted!585 (t!30455 l!412)))))

(assert (=> d!120931 (= (lemmaForallGetValueByKeySameWithASmallerHead!44 (t!30455 l!412) lt!449012 value!115 (h!22648 l!412)) lt!449133)))

(declare-fun b!1015312 () Bool)

(declare-fun res!681063 () Bool)

(assert (=> b!1015312 (=> (not res!681063) (not e!571154))))

(declare-fun isEmpty!854 (List!21454) Bool)

(assert (=> b!1015312 (= res!681063 (not (isEmpty!854 (t!30455 l!412))))))

(declare-fun res!681065 () Bool)

(assert (=> b!1015313 (=> (not res!681065) (not e!571154))))

(assert (=> b!1015313 (= res!681065 (forall!250 lt!449012 lambda!874))))

(declare-fun b!1015314 () Bool)

(declare-fun head!947 (List!21454) tuple2!15168)

(assert (=> b!1015314 (= e!571154 (bvslt (_1!7595 (h!22648 l!412)) (_1!7595 (head!947 (t!30455 l!412)))))))

(assert (= (and d!120931 res!681064) b!1015312))

(assert (= (and b!1015312 res!681063) b!1015313))

(assert (= (and b!1015313 res!681065) b!1015314))

(declare-fun m!937455 () Bool)

(assert (=> d!120931 m!937455))

(declare-fun m!937457 () Bool)

(assert (=> d!120931 m!937457))

(assert (=> d!120931 m!937445))

(declare-fun m!937459 () Bool)

(assert (=> b!1015312 m!937459))

(declare-fun m!937461 () Bool)

(assert (=> b!1015313 m!937461))

(declare-fun m!937463 () Bool)

(assert (=> b!1015314 m!937463))

(assert (=> b!1015160 d!120931))

(declare-fun d!120933 () Bool)

(declare-fun res!681066 () Bool)

(declare-fun e!571155 () Bool)

(assert (=> d!120933 (=> res!681066 e!571155)))

(assert (=> d!120933 (= res!681066 (is-Nil!21452 lt!449012))))

(assert (=> d!120933 (= (forall!250 lt!449012 lambda!832) e!571155)))

(declare-fun b!1015315 () Bool)

(declare-fun e!571156 () Bool)

(assert (=> b!1015315 (= e!571155 e!571156)))

(declare-fun res!681067 () Bool)

(assert (=> b!1015315 (=> (not res!681067) (not e!571156))))

(assert (=> b!1015315 (= res!681067 (dynLambda!1896 lambda!832 (h!22649 lt!449012)))))

(declare-fun b!1015316 () Bool)

(assert (=> b!1015316 (= e!571156 (forall!250 (t!30456 lt!449012) lambda!832))))

(assert (= (and d!120933 (not res!681066)) b!1015315))

(assert (= (and b!1015315 res!681067) b!1015316))

(declare-fun b_lambda!15399 () Bool)

(assert (=> (not b_lambda!15399) (not b!1015315)))

(declare-fun m!937471 () Bool)

(assert (=> b!1015315 m!937471))

(declare-fun m!937475 () Bool)

(assert (=> b!1015316 m!937475))

(assert (=> b!1015160 d!120933))

(declare-fun d!120935 () Bool)

(declare-fun res!681076 () Bool)

(declare-fun e!571165 () Bool)

(assert (=> d!120935 (=> res!681076 e!571165)))

(assert (=> d!120935 (= res!681076 (or (is-Nil!21451 l!412) (is-Nil!21451 (t!30455 l!412))))))

(assert (=> d!120935 (= (isStrictlySorted!585 l!412) e!571165)))

(declare-fun b!1015325 () Bool)

(declare-fun e!571166 () Bool)

(assert (=> b!1015325 (= e!571165 e!571166)))

(declare-fun res!681077 () Bool)

(assert (=> b!1015325 (=> (not res!681077) (not e!571166))))

(assert (=> b!1015325 (= res!681077 (bvslt (_1!7595 (h!22648 l!412)) (_1!7595 (h!22648 (t!30455 l!412)))))))

(declare-fun b!1015326 () Bool)

(assert (=> b!1015326 (= e!571166 (isStrictlySorted!585 (t!30455 l!412)))))

(assert (= (and d!120935 (not res!681076)) b!1015325))

(assert (= (and b!1015325 res!681077) b!1015326))

(assert (=> b!1015326 m!937445))

(assert (=> start!87840 d!120935))

(declare-fun b!1015337 () Bool)

(declare-fun e!571173 () Bool)

(declare-fun tp!70603 () Bool)

(assert (=> b!1015337 (= e!571173 (and tp_is_empty!23521 tp!70603))))

(assert (=> b!1015156 (= tp!70592 e!571173)))

(assert (= (and b!1015156 (is-Cons!21450 (t!30455 l!412))) b!1015337))

(declare-fun b_lambda!15402 () Bool)

(assert (= b_lambda!15399 (or b!1015160 b_lambda!15402)))

(declare-fun bs!29408 () Bool)

(declare-fun d!120940 () Bool)

(assert (= bs!29408 (and d!120940 b!1015160)))

(declare-datatypes ((Option!581 0))(
  ( (Some!580 (v!14431 B!1454)) (None!579) )
))
(declare-fun getValueByKey!530 (List!21454 (_ BitVec 64)) Option!581)

(assert (=> bs!29408 (= (dynLambda!1896 lambda!832 (h!22649 lt!449012)) (= (getValueByKey!530 l!412 (h!22649 lt!449012)) (Some!580 value!115)))))

(declare-fun m!937481 () Bool)

(assert (=> bs!29408 m!937481))

(assert (=> b!1015315 d!120940))

(declare-fun b_lambda!15407 () Bool)

(assert (= b_lambda!15391 (or b!1015159 b_lambda!15407)))

(declare-fun bs!29409 () Bool)

(declare-fun d!120943 () Bool)

(assert (= bs!29409 (and d!120943 b!1015159)))

(assert (=> bs!29409 (= (dynLambda!1896 lambda!833 (h!22649 lt!449012)) (= (getValueByKey!530 l!412 (h!22649 lt!449012)) (Some!580 value!115)))))

(assert (=> bs!29409 m!937481))

(assert (=> b!1015207 d!120943))

(push 1)

(assert (not b!1015312))

(assert (not b!1015313))

(assert (not bs!29409))

(assert (not b_lambda!15407))

(assert (not bs!29408))

(assert (not d!120913))

(assert (not b!1015316))

(assert (not b!1015208))

(assert (not bm!42928))

(assert (not bm!42930))

(assert (not bm!42929))

(assert (not b_lambda!15402))

(assert (not bm!42927))

(assert (not b!1015337))

(assert (not d!120931))

(assert tp_is_empty!23521)

(assert (not b!1015314))

(assert (not b!1015326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

