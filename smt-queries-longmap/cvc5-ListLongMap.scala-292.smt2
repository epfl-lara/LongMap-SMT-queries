; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4938 () Bool)

(assert start!4938)

(declare-fun b_free!1339 () Bool)

(declare-fun b_next!1339 () Bool)

(assert (=> start!4938 (= b_free!1339 (not b_next!1339))))

(declare-fun tp!5512 () Bool)

(declare-fun b_and!2245 () Bool)

(assert (=> start!4938 (= tp!5512 b_and!2245)))

(declare-fun b!37285 () Bool)

(declare-fun res!22547 () Bool)

(declare-fun e!23592 () Bool)

(assert (=> b!37285 (=> (not res!22547) (not e!23592))))

(declare-datatypes ((B!746 0))(
  ( (B!747 (val!873 Int)) )
))
(declare-datatypes ((tuple2!1406 0))(
  ( (tuple2!1407 (_1!714 (_ BitVec 64)) (_2!714 B!746)) )
))
(declare-datatypes ((List!977 0))(
  ( (Nil!974) (Cons!973 (h!1541 tuple2!1406) (t!3766 List!977)) )
))
(declare-datatypes ((ListLongMap!983 0))(
  ( (ListLongMap!984 (toList!507 List!977)) )
))
(declare-fun lm!252 () ListLongMap!983)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!458 (ListLongMap!983 (_ BitVec 64)) Bool)

(assert (=> b!37285 (= res!22547 (contains!458 lm!252 k!388))))

(declare-fun b!37286 () Bool)

(declare-fun res!22546 () Bool)

(declare-fun e!23593 () Bool)

(assert (=> b!37286 (=> (not res!22546) (not e!23593))))

(declare-fun lt!13752 () ListLongMap!983)

(assert (=> b!37286 (= res!22546 (contains!458 lt!13752 k!388))))

(declare-fun b!37287 () Bool)

(assert (=> b!37287 (= e!23592 e!23593)))

(declare-fun res!22543 () Bool)

(assert (=> b!37287 (=> (not res!22543) (not e!23593))))

(declare-fun p!304 () Int)

(declare-fun forall!173 (List!977 Int) Bool)

(assert (=> b!37287 (= res!22543 (forall!173 (toList!507 lt!13752) p!304))))

(declare-fun tail!104 (ListLongMap!983) ListLongMap!983)

(assert (=> b!37287 (= lt!13752 (tail!104 lm!252))))

(declare-fun b!37288 () Bool)

(declare-fun e!23591 () Bool)

(declare-fun tp!5513 () Bool)

(assert (=> b!37288 (= e!23591 tp!5513)))

(declare-fun b!37289 () Bool)

(declare-fun res!22544 () Bool)

(assert (=> b!37289 (=> (not res!22544) (not e!23592))))

(declare-fun head!845 (List!977) tuple2!1406)

(assert (=> b!37289 (= res!22544 (not (= (_1!714 (head!845 (toList!507 lm!252))) k!388)))))

(declare-fun b!37290 () Bool)

(declare-fun dynLambda!175 (Int tuple2!1406) Bool)

(declare-fun apply!46 (ListLongMap!983 (_ BitVec 64)) B!746)

(assert (=> b!37290 (= e!23593 (not (dynLambda!175 p!304 (tuple2!1407 k!388 (apply!46 lm!252 k!388)))))))

(assert (=> b!37290 (dynLambda!175 p!304 (tuple2!1407 k!388 (apply!46 lt!13752 k!388)))))

(declare-datatypes ((Unit!848 0))(
  ( (Unit!849) )
))
(declare-fun lt!13751 () Unit!848)

(declare-fun applyForall!5 (ListLongMap!983 Int (_ BitVec 64)) Unit!848)

(assert (=> b!37290 (= lt!13751 (applyForall!5 lt!13752 p!304 k!388))))

(declare-fun b!37291 () Bool)

(declare-fun res!22548 () Bool)

(assert (=> b!37291 (=> (not res!22548) (not e!23592))))

(declare-fun isEmpty!208 (ListLongMap!983) Bool)

(assert (=> b!37291 (= res!22548 (not (isEmpty!208 lm!252)))))

(declare-fun res!22545 () Bool)

(assert (=> start!4938 (=> (not res!22545) (not e!23592))))

(assert (=> start!4938 (= res!22545 (forall!173 (toList!507 lm!252) p!304))))

(assert (=> start!4938 e!23592))

(declare-fun inv!1638 (ListLongMap!983) Bool)

(assert (=> start!4938 (and (inv!1638 lm!252) e!23591)))

(assert (=> start!4938 tp!5512))

(assert (=> start!4938 true))

(assert (= (and start!4938 res!22545) b!37285))

(assert (= (and b!37285 res!22547) b!37291))

(assert (= (and b!37291 res!22548) b!37289))

(assert (= (and b!37289 res!22544) b!37287))

(assert (= (and b!37287 res!22543) b!37286))

(assert (= (and b!37286 res!22546) b!37290))

(assert (= start!4938 b!37288))

(declare-fun b_lambda!1881 () Bool)

(assert (=> (not b_lambda!1881) (not b!37290)))

(declare-fun t!3763 () Bool)

(declare-fun tb!773 () Bool)

(assert (=> (and start!4938 (= p!304 p!304) t!3763) tb!773))

(declare-fun result!1309 () Bool)

(assert (=> tb!773 (= result!1309 true)))

(assert (=> b!37290 t!3763))

(declare-fun b_and!2247 () Bool)

(assert (= b_and!2245 (and (=> t!3763 result!1309) b_and!2247)))

(declare-fun b_lambda!1883 () Bool)

(assert (=> (not b_lambda!1883) (not b!37290)))

(declare-fun t!3765 () Bool)

(declare-fun tb!775 () Bool)

(assert (=> (and start!4938 (= p!304 p!304) t!3765) tb!775))

(declare-fun result!1311 () Bool)

(assert (=> tb!775 (= result!1311 true)))

(assert (=> b!37290 t!3765))

(declare-fun b_and!2249 () Bool)

(assert (= b_and!2247 (and (=> t!3765 result!1311) b_and!2249)))

(declare-fun m!30081 () Bool)

(assert (=> b!37287 m!30081))

(declare-fun m!30083 () Bool)

(assert (=> b!37287 m!30083))

(declare-fun m!30085 () Bool)

(assert (=> b!37291 m!30085))

(declare-fun m!30087 () Bool)

(assert (=> b!37290 m!30087))

(declare-fun m!30089 () Bool)

(assert (=> b!37290 m!30089))

(declare-fun m!30091 () Bool)

(assert (=> b!37290 m!30091))

(declare-fun m!30093 () Bool)

(assert (=> b!37290 m!30093))

(declare-fun m!30095 () Bool)

(assert (=> b!37290 m!30095))

(declare-fun m!30097 () Bool)

(assert (=> b!37285 m!30097))

(declare-fun m!30099 () Bool)

(assert (=> b!37289 m!30099))

(declare-fun m!30101 () Bool)

(assert (=> b!37286 m!30101))

(declare-fun m!30103 () Bool)

(assert (=> start!4938 m!30103))

(declare-fun m!30105 () Bool)

(assert (=> start!4938 m!30105))

(push 1)

(assert b_and!2249)

(assert (not b_next!1339))

(assert (not b!37288))

(assert (not b!37289))

(assert (not b!37291))

(assert (not b!37287))

(assert (not b!37290))

(assert (not start!4938))

(assert (not b!37285))

(assert (not b!37286))

(assert (not b_lambda!1883))

(assert (not b_lambda!1881))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2249)

(assert (not b_next!1339))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!1901 () Bool)

(assert (= b_lambda!1883 (or (and start!4938 b_free!1339) b_lambda!1901)))

(declare-fun b_lambda!1903 () Bool)

(assert (= b_lambda!1881 (or (and start!4938 b_free!1339) b_lambda!1903)))

(push 1)

(assert b_and!2249)

(assert (not b_next!1339))

(assert (not b!37286))

(assert (not b_lambda!1903))

(assert (not b!37289))

(assert (not b!37291))

(assert (not b!37287))

(assert (not b!37290))

(assert (not start!4938))

(assert (not b!37285))

(assert (not b!37288))

(assert (not b_lambda!1901))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2249)

(assert (not b_next!1339))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5847 () Bool)

(declare-fun isEmpty!211 (List!977) Bool)

(assert (=> d!5847 (= (isEmpty!208 lm!252) (isEmpty!211 (toList!507 lm!252)))))

(declare-fun bs!1447 () Bool)

(assert (= bs!1447 d!5847))

(declare-fun m!30171 () Bool)

(assert (=> bs!1447 m!30171))

(assert (=> b!37291 d!5847))

(declare-fun d!5849 () Bool)

(declare-fun e!23645 () Bool)

(assert (=> d!5849 e!23645))

(declare-fun res!22607 () Bool)

(assert (=> d!5849 (=> res!22607 e!23645)))

(declare-fun lt!13806 () Bool)

(assert (=> d!5849 (= res!22607 (not lt!13806))))

(declare-fun lt!13805 () Bool)

(assert (=> d!5849 (= lt!13806 lt!13805)))

(declare-fun lt!13807 () Unit!848)

(declare-fun e!23644 () Unit!848)

(assert (=> d!5849 (= lt!13807 e!23644)))

(declare-fun c!4303 () Bool)

(assert (=> d!5849 (= c!4303 lt!13805)))

(declare-fun containsKey!53 (List!977 (_ BitVec 64)) Bool)

(assert (=> d!5849 (= lt!13805 (containsKey!53 (toList!507 lt!13752) k!388))))

(assert (=> d!5849 (= (contains!458 lt!13752 k!388) lt!13806)))

(declare-fun b!37376 () Bool)

(declare-fun lt!13808 () Unit!848)

(assert (=> b!37376 (= e!23644 lt!13808)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!50 (List!977 (_ BitVec 64)) Unit!848)

(assert (=> b!37376 (= lt!13808 (lemmaContainsKeyImpliesGetValueByKeyDefined!50 (toList!507 lt!13752) k!388))))

(declare-datatypes ((Option!95 0))(
  ( (Some!94 (v!1963 B!746)) (None!93) )
))
(declare-fun isDefined!51 (Option!95) Bool)

(declare-fun getValueByKey!89 (List!977 (_ BitVec 64)) Option!95)

(assert (=> b!37376 (isDefined!51 (getValueByKey!89 (toList!507 lt!13752) k!388))))

(declare-fun b!37377 () Bool)

(declare-fun Unit!856 () Unit!848)

(assert (=> b!37377 (= e!23644 Unit!856)))

(declare-fun b!37378 () Bool)

(assert (=> b!37378 (= e!23645 (isDefined!51 (getValueByKey!89 (toList!507 lt!13752) k!388)))))

(assert (= (and d!5849 c!4303) b!37376))

(assert (= (and d!5849 (not c!4303)) b!37377))

(assert (= (and d!5849 (not res!22607)) b!37378))

(declare-fun m!30209 () Bool)

(assert (=> d!5849 m!30209))

(declare-fun m!30211 () Bool)

(assert (=> b!37376 m!30211))

(declare-fun m!30213 () Bool)

(assert (=> b!37376 m!30213))

(assert (=> b!37376 m!30213))

(declare-fun m!30215 () Bool)

(assert (=> b!37376 m!30215))

(assert (=> b!37378 m!30213))

(assert (=> b!37378 m!30213))

(assert (=> b!37378 m!30215))

(assert (=> b!37286 d!5849))

(declare-fun d!5865 () Bool)

(declare-fun e!23649 () Bool)

(assert (=> d!5865 e!23649))

(declare-fun res!22610 () Bool)

(assert (=> d!5865 (=> res!22610 e!23649)))

(declare-fun lt!13810 () Bool)

(assert (=> d!5865 (= res!22610 (not lt!13810))))

(declare-fun lt!13809 () Bool)

(assert (=> d!5865 (= lt!13810 lt!13809)))

(declare-fun lt!13811 () Unit!848)

(declare-fun e!23648 () Unit!848)

(assert (=> d!5865 (= lt!13811 e!23648)))

(declare-fun c!4304 () Bool)

(assert (=> d!5865 (= c!4304 lt!13809)))

(assert (=> d!5865 (= lt!13809 (containsKey!53 (toList!507 lm!252) k!388))))

(assert (=> d!5865 (= (contains!458 lm!252 k!388) lt!13810)))

(declare-fun b!37381 () Bool)

(declare-fun lt!13812 () Unit!848)

(assert (=> b!37381 (= e!23648 lt!13812)))

(assert (=> b!37381 (= lt!13812 (lemmaContainsKeyImpliesGetValueByKeyDefined!50 (toList!507 lm!252) k!388))))

(assert (=> b!37381 (isDefined!51 (getValueByKey!89 (toList!507 lm!252) k!388))))

(declare-fun b!37382 () Bool)

(declare-fun Unit!858 () Unit!848)

(assert (=> b!37382 (= e!23648 Unit!858)))

(declare-fun b!37383 () Bool)

(assert (=> b!37383 (= e!23649 (isDefined!51 (getValueByKey!89 (toList!507 lm!252) k!388)))))

(assert (= (and d!5865 c!4304) b!37381))

(assert (= (and d!5865 (not c!4304)) b!37382))

(assert (= (and d!5865 (not res!22610)) b!37383))

(declare-fun m!30221 () Bool)

(assert (=> d!5865 m!30221))

(declare-fun m!30223 () Bool)

(assert (=> b!37381 m!30223))

(declare-fun m!30225 () Bool)

(assert (=> b!37381 m!30225))

(assert (=> b!37381 m!30225))

(declare-fun m!30227 () Bool)

(assert (=> b!37381 m!30227))

(assert (=> b!37383 m!30225))

(assert (=> b!37383 m!30225))

(assert (=> b!37383 m!30227))

(assert (=> b!37285 d!5865))

(declare-fun d!5869 () Bool)

(declare-fun res!22617 () Bool)

(declare-fun e!23656 () Bool)

(assert (=> d!5869 (=> res!22617 e!23656)))

(assert (=> d!5869 (= res!22617 (is-Nil!974 (toList!507 lm!252)))))

(assert (=> d!5869 (= (forall!173 (toList!507 lm!252) p!304) e!23656)))

(declare-fun b!37390 () Bool)

(declare-fun e!23657 () Bool)

(assert (=> b!37390 (= e!23656 e!23657)))

(declare-fun res!22618 () Bool)

(assert (=> b!37390 (=> (not res!22618) (not e!23657))))

(assert (=> b!37390 (= res!22618 (dynLambda!175 p!304 (h!1541 (toList!507 lm!252))))))

(declare-fun b!37391 () Bool)

(assert (=> b!37391 (= e!23657 (forall!173 (t!3766 (toList!507 lm!252)) p!304))))

(assert (= (and d!5869 (not res!22617)) b!37390))

(assert (= (and b!37390 res!22618) b!37391))

(declare-fun b_lambda!1913 () Bool)

(assert (=> (not b_lambda!1913) (not b!37390)))

(declare-fun t!3786 () Bool)

(declare-fun tb!793 () Bool)

(assert (=> (and start!4938 (= p!304 p!304) t!3786) tb!793))

(declare-fun result!1329 () Bool)

(assert (=> tb!793 (= result!1329 true)))

(assert (=> b!37390 t!3786))

(declare-fun b_and!2271 () Bool)

(assert (= b_and!2249 (and (=> t!3786 result!1329) b_and!2271)))

(declare-fun m!30241 () Bool)

(assert (=> b!37390 m!30241))

(declare-fun m!30243 () Bool)

(assert (=> b!37391 m!30243))

(assert (=> start!4938 d!5869))

(declare-fun d!5881 () Bool)

(declare-fun isStrictlySorted!186 (List!977) Bool)

(assert (=> d!5881 (= (inv!1638 lm!252) (isStrictlySorted!186 (toList!507 lm!252)))))

(declare-fun bs!1455 () Bool)

(assert (= bs!1455 d!5881))

(declare-fun m!30247 () Bool)

(assert (=> bs!1455 m!30247))

(assert (=> start!4938 d!5881))

(declare-fun d!5885 () Bool)

(declare-fun get!636 (Option!95) B!746)

(assert (=> d!5885 (= (apply!46 lm!252 k!388) (get!636 (getValueByKey!89 (toList!507 lm!252) k!388)))))

(declare-fun bs!1457 () Bool)

(assert (= bs!1457 d!5885))

(assert (=> bs!1457 m!30225))

(assert (=> bs!1457 m!30225))

(declare-fun m!30251 () Bool)

(assert (=> bs!1457 m!30251))

(assert (=> b!37290 d!5885))

(declare-fun d!5889 () Bool)

(assert (=> d!5889 (= (apply!46 lt!13752 k!388) (get!636 (getValueByKey!89 (toList!507 lt!13752) k!388)))))

(declare-fun bs!1458 () Bool)

(assert (= bs!1458 d!5889))

(assert (=> bs!1458 m!30213))

(assert (=> bs!1458 m!30213))

(declare-fun m!30253 () Bool)

(assert (=> bs!1458 m!30253))

(assert (=> b!37290 d!5889))

(declare-fun d!5891 () Bool)

(assert (=> d!5891 (dynLambda!175 p!304 (tuple2!1407 k!388 (apply!46 lt!13752 k!388)))))

(declare-fun lt!13821 () Unit!848)

(declare-fun choose!233 (ListLongMap!983 Int (_ BitVec 64)) Unit!848)

(assert (=> d!5891 (= lt!13821 (choose!233 lt!13752 p!304 k!388))))

(declare-fun e!23671 () Bool)

(assert (=> d!5891 e!23671))

(declare-fun res!22627 () Bool)

(assert (=> d!5891 (=> (not res!22627) (not e!23671))))

(assert (=> d!5891 (= res!22627 (forall!173 (toList!507 lt!13752) p!304))))

(assert (=> d!5891 (= (applyForall!5 lt!13752 p!304 k!388) lt!13821)))

(declare-fun b!37409 () Bool)

(assert (=> b!37409 (= e!23671 (contains!458 lt!13752 k!388))))

(assert (= (and d!5891 res!22627) b!37409))

(declare-fun b_lambda!1925 () Bool)

(assert (=> (not b_lambda!1925) (not d!5891)))

(assert (=> d!5891 t!3765))

(declare-fun b_and!2277 () Bool)

(assert (= b_and!2271 (and (=> t!3765 result!1311) b_and!2277)))

(assert (=> d!5891 m!30095))

(assert (=> d!5891 m!30089))

(declare-fun m!30259 () Bool)

(assert (=> d!5891 m!30259))

(assert (=> d!5891 m!30081))

(assert (=> b!37409 m!30101))

(assert (=> b!37290 d!5891))

(declare-fun d!5895 () Bool)

(assert (=> d!5895 (= (head!845 (toList!507 lm!252)) (h!1541 (toList!507 lm!252)))))

(assert (=> b!37289 d!5895))

(declare-fun d!5897 () Bool)

(declare-fun res!22628 () Bool)

(declare-fun e!23673 () Bool)

(assert (=> d!5897 (=> res!22628 e!23673)))

(assert (=> d!5897 (= res!22628 (is-Nil!974 (toList!507 lt!13752)))))

(assert (=> d!5897 (= (forall!173 (toList!507 lt!13752) p!304) e!23673)))

(declare-fun b!37411 () Bool)

(declare-fun e!23674 () Bool)

(assert (=> b!37411 (= e!23673 e!23674)))

(declare-fun res!22629 () Bool)

(assert (=> b!37411 (=> (not res!22629) (not e!23674))))

(assert (=> b!37411 (= res!22629 (dynLambda!175 p!304 (h!1541 (toList!507 lt!13752))))))

(declare-fun b!37412 () Bool)

(assert (=> b!37412 (= e!23674 (forall!173 (t!3766 (toList!507 lt!13752)) p!304))))

(assert (= (and d!5897 (not res!22628)) b!37411))

(assert (= (and b!37411 res!22629) b!37412))

(declare-fun b_lambda!1933 () Bool)

(assert (=> (not b_lambda!1933) (not b!37411)))

(declare-fun t!3788 () Bool)

(declare-fun tb!795 () Bool)

(assert (=> (and start!4938 (= p!304 p!304) t!3788) tb!795))

(declare-fun result!1335 () Bool)

(assert (=> tb!795 (= result!1335 true)))

(assert (=> b!37411 t!3788))

(declare-fun b_and!2279 () Bool)

(assert (= b_and!2277 (and (=> t!3788 result!1335) b_and!2279)))

(declare-fun m!30261 () Bool)

(assert (=> b!37411 m!30261))

(declare-fun m!30263 () Bool)

(assert (=> b!37412 m!30263))

(assert (=> b!37287 d!5897))

(declare-fun d!5899 () Bool)

(declare-fun tail!109 (List!977) List!977)

(assert (=> d!5899 (= (tail!104 lm!252) (ListLongMap!984 (tail!109 (toList!507 lm!252))))))

(declare-fun bs!1459 () Bool)

(assert (= bs!1459 d!5899))

(declare-fun m!30265 () Bool)

(assert (=> bs!1459 m!30265))

(assert (=> b!37287 d!5899))

(declare-fun b!37417 () Bool)

(declare-fun e!23677 () Bool)

(declare-fun tp_is_empty!1673 () Bool)

(declare-fun tp!5534 () Bool)

(assert (=> b!37417 (= e!23677 (and tp_is_empty!1673 tp!5534))))

(assert (=> b!37288 (= tp!5513 e!23677)))

(assert (= (and b!37288 (is-Cons!973 (toList!507 lm!252))) b!37417))

(declare-fun b_lambda!1935 () Bool)

(assert (= b_lambda!1925 (or (and start!4938 b_free!1339) b_lambda!1935)))

(declare-fun b_lambda!1937 () Bool)

(assert (= b_lambda!1913 (or (and start!4938 b_free!1339) b_lambda!1937)))

(declare-fun b_lambda!1939 () Bool)

(assert (= b_lambda!1933 (or (and start!4938 b_free!1339) b_lambda!1939)))

(push 1)

(assert (not d!5889))

(assert (not b_next!1339))

(assert (not b!37391))

(assert b_and!2279)

(assert (not b_lambda!1935))

(assert (not d!5881))

(assert (not b_lambda!1903))

(assert tp_is_empty!1673)

(assert (not b!37409))

(assert (not d!5885))

(assert (not d!5847))

(assert (not b_lambda!1937))

(assert (not d!5849))

(assert (not d!5891))

(assert (not d!5899))

(assert (not b!37378))

(assert (not d!5865))

(assert (not b!37412))

(assert (not b!37383))

(assert (not b_lambda!1939))

(assert (not b!37417))

(assert (not b!37376))

(assert (not b!37381))

(assert (not b_lambda!1901))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2279)

(assert (not b_next!1339))

(check-sat)

(get-model)

(pop 1)

