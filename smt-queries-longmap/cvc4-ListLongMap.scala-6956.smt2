; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87996 () Bool)

(assert start!87996)

(declare-fun b!1016074 () Bool)

(assert (=> b!1016074 true))

(assert (=> b!1016074 true))

(declare-fun b!1016072 () Bool)

(declare-fun res!681378 () Bool)

(declare-fun e!571692 () Bool)

(assert (=> b!1016072 (=> (not res!681378) (not e!571692))))

(declare-datatypes ((B!1444 0))(
  ( (B!1445 (val!11806 Int)) )
))
(declare-datatypes ((tuple2!15162 0))(
  ( (tuple2!15163 (_1!7592 (_ BitVec 64)) (_2!7592 B!1444)) )
))
(declare-datatypes ((List!21433 0))(
  ( (Nil!21430) (Cons!21429 (h!22636 tuple2!15162) (t!30426 List!21433)) )
))
(declare-fun l!412 () List!21433)

(declare-fun value!115 () B!1444)

(assert (=> b!1016072 (= res!681378 (and (not (= (_2!7592 (h!22636 l!412)) value!115)) (is-Cons!21429 l!412)))))

(declare-fun b!1016073 () Bool)

(declare-fun e!571689 () Bool)

(declare-fun head!937 (List!21433) tuple2!15162)

(assert (=> b!1016073 (= e!571689 (bvsge (_1!7592 (h!22636 l!412)) (_1!7592 (head!937 (t!30426 l!412)))))))

(declare-fun res!681377 () Bool)

(assert (=> b!1016074 (=> res!681377 e!571689)))

(declare-datatypes ((List!21434 0))(
  ( (Nil!21431) (Cons!21430 (h!22637 (_ BitVec 64)) (t!30427 List!21434)) )
))
(declare-fun lt!449252 () List!21434)

(declare-fun lambda!743 () Int)

(declare-fun forall!247 (List!21434 Int) Bool)

(assert (=> b!1016074 (= res!681377 (not (forall!247 lt!449252 lambda!743)))))

(declare-fun b!1016076 () Bool)

(declare-fun e!571690 () Bool)

(assert (=> b!1016076 (= e!571690 e!571689)))

(declare-fun res!681376 () Bool)

(assert (=> b!1016076 (=> res!681376 e!571689)))

(declare-fun isStrictlySorted!568 (List!21433) Bool)

(assert (=> b!1016076 (= res!681376 (not (isStrictlySorted!568 (t!30426 l!412))))))

(declare-fun b!1016077 () Bool)

(assert (=> b!1016077 (= e!571692 e!571690)))

(declare-fun res!681379 () Bool)

(assert (=> b!1016077 (=> (not res!681379) (not e!571690))))

(declare-fun isEmpty!844 (List!21434) Bool)

(assert (=> b!1016077 (= res!681379 (not (isEmpty!844 lt!449252)))))

(declare-fun getKeysOf!53 (List!21433 B!1444) List!21434)

(assert (=> b!1016077 (= lt!449252 (getKeysOf!53 (t!30426 l!412) value!115))))

(declare-fun b!1016078 () Bool)

(declare-fun e!571691 () Bool)

(declare-fun tp_is_empty!23511 () Bool)

(declare-fun tp!70560 () Bool)

(assert (=> b!1016078 (= e!571691 (and tp_is_empty!23511 tp!70560))))

(declare-fun res!681380 () Bool)

(assert (=> start!87996 (=> (not res!681380) (not e!571692))))

(assert (=> start!87996 (= res!681380 (isStrictlySorted!568 l!412))))

(assert (=> start!87996 e!571692))

(assert (=> start!87996 e!571691))

(assert (=> start!87996 tp_is_empty!23511))

(declare-fun b!1016075 () Bool)

(declare-fun res!681375 () Bool)

(assert (=> b!1016075 (=> res!681375 e!571689)))

(declare-fun isEmpty!845 (List!21433) Bool)

(assert (=> b!1016075 (= res!681375 (isEmpty!845 (t!30426 l!412)))))

(assert (= (and start!87996 res!681380) b!1016072))

(assert (= (and b!1016072 res!681378) b!1016077))

(assert (= (and b!1016077 res!681379) b!1016076))

(assert (= (and b!1016076 (not res!681376)) b!1016075))

(assert (= (and b!1016075 (not res!681375)) b!1016074))

(assert (= (and b!1016074 (not res!681377)) b!1016073))

(assert (= (and start!87996 (is-Cons!21429 l!412)) b!1016078))

(declare-fun m!938839 () Bool)

(assert (=> b!1016077 m!938839))

(declare-fun m!938841 () Bool)

(assert (=> b!1016077 m!938841))

(declare-fun m!938843 () Bool)

(assert (=> start!87996 m!938843))

(declare-fun m!938845 () Bool)

(assert (=> b!1016074 m!938845))

(declare-fun m!938847 () Bool)

(assert (=> b!1016075 m!938847))

(declare-fun m!938849 () Bool)

(assert (=> b!1016073 m!938849))

(declare-fun m!938851 () Bool)

(assert (=> b!1016076 m!938851))

(push 1)

(assert (not start!87996))

(assert (not b!1016078))

(assert (not b!1016076))

(assert tp_is_empty!23511)

(assert (not b!1016073))

(assert (not b!1016074))

(assert (not b!1016077))

(assert (not b!1016075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121287 () Bool)

(assert (=> d!121287 (= (isEmpty!845 (t!30426 l!412)) (is-Nil!21430 (t!30426 l!412)))))

(assert (=> b!1016075 d!121287))

(declare-fun d!121289 () Bool)

(declare-fun res!681415 () Bool)

(declare-fun e!571721 () Bool)

(assert (=> d!121289 (=> res!681415 e!571721)))

(assert (=> d!121289 (= res!681415 (is-Nil!21431 lt!449252))))

(assert (=> d!121289 (= (forall!247 lt!449252 lambda!743) e!571721)))

(declare-fun b!1016124 () Bool)

(declare-fun e!571722 () Bool)

(assert (=> b!1016124 (= e!571721 e!571722)))

(declare-fun res!681416 () Bool)

(assert (=> b!1016124 (=> (not res!681416) (not e!571722))))

(declare-fun dynLambda!1916 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016124 (= res!681416 (dynLambda!1916 lambda!743 (h!22637 lt!449252)))))

(declare-fun b!1016125 () Bool)

(assert (=> b!1016125 (= e!571722 (forall!247 (t!30427 lt!449252) lambda!743))))

(assert (= (and d!121289 (not res!681415)) b!1016124))

(assert (= (and b!1016124 res!681416) b!1016125))

(declare-fun b_lambda!15383 () Bool)

(assert (=> (not b_lambda!15383) (not b!1016124)))

(declare-fun m!938873 () Bool)

(assert (=> b!1016124 m!938873))

(declare-fun m!938875 () Bool)

(assert (=> b!1016125 m!938875))

(assert (=> b!1016074 d!121289))

(declare-fun d!121299 () Bool)

(assert (=> d!121299 (= (head!937 (t!30426 l!412)) (h!22636 (t!30426 l!412)))))

(assert (=> b!1016073 d!121299))

(declare-fun d!121303 () Bool)

(declare-fun res!681427 () Bool)

(declare-fun e!571733 () Bool)

(assert (=> d!121303 (=> res!681427 e!571733)))

(assert (=> d!121303 (= res!681427 (or (is-Nil!21430 l!412) (is-Nil!21430 (t!30426 l!412))))))

(assert (=> d!121303 (= (isStrictlySorted!568 l!412) e!571733)))

(declare-fun b!1016136 () Bool)

(declare-fun e!571734 () Bool)

(assert (=> b!1016136 (= e!571733 e!571734)))

(declare-fun res!681428 () Bool)

(assert (=> b!1016136 (=> (not res!681428) (not e!571734))))

(assert (=> b!1016136 (= res!681428 (bvslt (_1!7592 (h!22636 l!412)) (_1!7592 (h!22636 (t!30426 l!412)))))))

(declare-fun b!1016137 () Bool)

(assert (=> b!1016137 (= e!571734 (isStrictlySorted!568 (t!30426 l!412)))))

(assert (= (and d!121303 (not res!681427)) b!1016136))

(assert (= (and b!1016136 res!681428) b!1016137))

(assert (=> b!1016137 m!938851))

(assert (=> start!87996 d!121303))

(declare-fun d!121311 () Bool)

(assert (=> d!121311 (= (isEmpty!844 lt!449252) (is-Nil!21431 lt!449252))))

(assert (=> b!1016077 d!121311))

(declare-fun bs!29316 () Bool)

(declare-fun b!1016208 () Bool)

(assert (= bs!29316 (and b!1016208 b!1016074)))

(declare-fun lt!449357 () List!21433)

(declare-fun lambda!769 () Int)

(declare-fun lt!449360 () tuple2!15162)

(assert (=> bs!29316 (= (= (Cons!21429 lt!449360 lt!449357) (t!30426 l!412)) (= lambda!769 lambda!743))))

(assert (=> b!1016208 true))

(assert (=> b!1016208 true))

(assert (=> b!1016208 true))

(declare-fun bs!29319 () Bool)

(declare-fun b!1016206 () Bool)

(assert (= bs!29319 (and b!1016206 b!1016074)))

(declare-fun lt!449353 () List!21433)

(declare-fun lambda!771 () Int)

(declare-fun lt!449352 () tuple2!15162)

(assert (=> bs!29319 (= (= (Cons!21429 lt!449352 lt!449353) (t!30426 l!412)) (= lambda!771 lambda!743))))

(declare-fun bs!29320 () Bool)

(assert (= bs!29320 (and b!1016206 b!1016208)))

(assert (=> bs!29320 (= (= (Cons!21429 lt!449352 lt!449353) (Cons!21429 lt!449360 lt!449357)) (= lambda!771 lambda!769))))

(assert (=> b!1016206 true))

(assert (=> b!1016206 true))

(assert (=> b!1016206 true))

(declare-fun bs!29324 () Bool)

(declare-fun d!121313 () Bool)

(assert (= bs!29324 (and d!121313 b!1016074)))

(declare-fun lambda!773 () Int)

(assert (=> bs!29324 (= lambda!773 lambda!743)))

(declare-fun bs!29325 () Bool)

(assert (= bs!29325 (and d!121313 b!1016208)))

(assert (=> bs!29325 (= (= (t!30426 l!412) (Cons!21429 lt!449360 lt!449357)) (= lambda!773 lambda!769))))

(declare-fun bs!29326 () Bool)

(assert (= bs!29326 (and d!121313 b!1016206)))

(assert (=> bs!29326 (= (= (t!30426 l!412) (Cons!21429 lt!449352 lt!449353)) (= lambda!773 lambda!771))))

(assert (=> d!121313 true))

(assert (=> d!121313 true))

(declare-fun b!1016204 () Bool)

(declare-fun e!571767 () List!21434)

(declare-fun call!42950 () List!21434)

(assert (=> b!1016204 (= e!571767 (Cons!21430 (_1!7592 (h!22636 (t!30426 l!412))) call!42950))))

(declare-fun c!103203 () Bool)

(declare-fun call!42949 () Bool)

(assert (=> b!1016204 (= c!103203 (not call!42949))))

(declare-datatypes ((Unit!33194 0))(
  ( (Unit!33195) )
))
(declare-fun lt!449354 () Unit!33194)

(declare-fun e!571768 () Unit!33194)

(assert (=> b!1016204 (= lt!449354 e!571768)))

(declare-fun bm!42946 () Bool)

(assert (=> bm!42946 (= call!42949 (isEmpty!844 call!42950))))

(declare-fun b!1016205 () Bool)

(declare-fun e!571769 () List!21434)

(assert (=> b!1016205 (= e!571767 e!571769)))

(declare-fun c!103204 () Bool)

(assert (=> b!1016205 (= c!103204 (and (is-Cons!21429 (t!30426 l!412)) (not (= (_2!7592 (h!22636 (t!30426 l!412))) value!115))))))

(declare-fun e!571770 () Unit!33194)

(declare-fun lt!449355 () Unit!33194)

(assert (=> b!1016206 (= e!571770 lt!449355)))

(assert (=> b!1016206 (= lt!449353 (t!30426 (t!30426 l!412)))))

(declare-fun lt!449362 () List!21434)

(assert (=> b!1016206 (= lt!449362 call!42950)))

(assert (=> b!1016206 (= lt!449352 (h!22636 (t!30426 l!412)))))

(declare-fun call!42952 () Unit!33194)

(assert (=> b!1016206 (= lt!449355 call!42952)))

(declare-fun call!42951 () Bool)

(assert (=> b!1016206 call!42951))

(declare-fun b!1016207 () Bool)

(declare-fun Unit!33196 () Unit!33194)

(assert (=> b!1016207 (= e!571768 Unit!33196)))

(declare-fun bm!42947 () Bool)

(assert (=> bm!42947 (= call!42950 (getKeysOf!53 (t!30426 (t!30426 l!412)) value!115))))

(assert (=> b!1016208 call!42951))

(declare-fun lt!449361 () Unit!33194)

(assert (=> b!1016208 (= lt!449361 call!42952)))

(assert (=> b!1016208 (= lt!449360 (h!22636 (t!30426 l!412)))))

(declare-fun lt!449363 () List!21434)

(assert (=> b!1016208 (= lt!449363 call!42950)))

(assert (=> b!1016208 (= lt!449357 (t!30426 (t!30426 l!412)))))

(assert (=> b!1016208 (= e!571768 lt!449361)))

(declare-fun b!1016209 () Bool)

(declare-fun Unit!33198 () Unit!33194)

(assert (=> b!1016209 (= e!571770 Unit!33198)))

(declare-fun b!1016210 () Bool)

(declare-fun lt!449359 () Unit!33194)

(assert (=> b!1016210 (= lt!449359 e!571770)))

(declare-fun c!103202 () Bool)

(assert (=> b!1016210 (= c!103202 (not call!42949))))

(declare-fun lt!449356 () List!21434)

(assert (=> b!1016210 (= lt!449356 call!42950)))

(assert (=> b!1016210 (= e!571769 call!42950)))

(declare-fun lt!449358 () List!21434)

(assert (=> d!121313 (forall!247 lt!449358 lambda!773)))

(assert (=> d!121313 (= lt!449358 e!571767)))

(declare-fun c!103201 () Bool)

(assert (=> d!121313 (= c!103201 (and (is-Cons!21429 (t!30426 l!412)) (= (_2!7592 (h!22636 (t!30426 l!412))) value!115)))))

(assert (=> d!121313 (isStrictlySorted!568 (t!30426 l!412))))

(assert (=> d!121313 (= (getKeysOf!53 (t!30426 l!412) value!115) lt!449358)))

(declare-fun bm!42948 () Bool)

(assert (=> bm!42948 (= call!42951 (forall!247 (ite c!103201 lt!449363 lt!449362) (ite c!103201 lambda!769 lambda!771)))))

(declare-fun bm!42949 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!43 (List!21433 List!21434 B!1444 tuple2!15162) Unit!33194)

(assert (=> bm!42949 (= call!42952 (lemmaForallGetValueByKeySameWithASmallerHead!43 (ite c!103201 lt!449357 lt!449353) (ite c!103201 lt!449363 lt!449362) value!115 (ite c!103201 lt!449360 lt!449352)))))

(declare-fun b!1016211 () Bool)

(assert (=> b!1016211 (= e!571769 Nil!21431)))

(assert (= (and d!121313 c!103201) b!1016204))

(assert (= (and d!121313 (not c!103201)) b!1016205))

(assert (= (and b!1016204 c!103203) b!1016208))

(assert (= (and b!1016204 (not c!103203)) b!1016207))

(assert (= (and b!1016205 c!103204) b!1016210))

(assert (= (and b!1016205 (not c!103204)) b!1016211))

(assert (= (and b!1016210 c!103202) b!1016206))

(assert (= (and b!1016210 (not c!103202)) b!1016209))

(assert (= (or b!1016208 b!1016206) bm!42949))

(assert (= (or b!1016208 b!1016206) bm!42948))

(assert (= (or b!1016204 b!1016208 b!1016206 b!1016210) bm!42947))

(assert (= (or b!1016204 b!1016210) bm!42946))

(declare-fun m!938903 () Bool)

(assert (=> bm!42947 m!938903))

(declare-fun m!938905 () Bool)

(assert (=> d!121313 m!938905))

(assert (=> d!121313 m!938851))

(declare-fun m!938907 () Bool)

(assert (=> bm!42949 m!938907))

(declare-fun m!938909 () Bool)

(assert (=> bm!42948 m!938909))

(declare-fun m!938911 () Bool)

(assert (=> bm!42946 m!938911))

(assert (=> b!1016077 d!121313))

(declare-fun d!121323 () Bool)

(declare-fun res!681431 () Bool)

(declare-fun e!571776 () Bool)

(assert (=> d!121323 (=> res!681431 e!571776)))

(assert (=> d!121323 (= res!681431 (or (is-Nil!21430 (t!30426 l!412)) (is-Nil!21430 (t!30426 (t!30426 l!412)))))))

(assert (=> d!121323 (= (isStrictlySorted!568 (t!30426 l!412)) e!571776)))

(declare-fun b!1016223 () Bool)

(declare-fun e!571777 () Bool)

(assert (=> b!1016223 (= e!571776 e!571777)))

(declare-fun res!681432 () Bool)

(assert (=> b!1016223 (=> (not res!681432) (not e!571777))))

(assert (=> b!1016223 (= res!681432 (bvslt (_1!7592 (h!22636 (t!30426 l!412))) (_1!7592 (h!22636 (t!30426 (t!30426 l!412))))))))

(declare-fun b!1016224 () Bool)

(assert (=> b!1016224 (= e!571777 (isStrictlySorted!568 (t!30426 (t!30426 l!412))))))

(assert (= (and d!121323 (not res!681431)) b!1016223))

(assert (= (and b!1016223 res!681432) b!1016224))

(declare-fun m!938913 () Bool)

(assert (=> b!1016224 m!938913))

(assert (=> b!1016076 d!121323))

(declare-fun b!1016231 () Bool)

(declare-fun e!571782 () Bool)

(declare-fun tp!70569 () Bool)

(assert (=> b!1016231 (= e!571782 (and tp_is_empty!23511 tp!70569))))

(assert (=> b!1016078 (= tp!70560 e!571782)))

(assert (= (and b!1016078 (is-Cons!21429 (t!30426 l!412))) b!1016231))

(declare-fun b_lambda!15389 () Bool)

(assert (= b_lambda!15383 (or b!1016074 b_lambda!15389)))

(declare-fun bs!29328 () Bool)

(declare-fun d!121325 () Bool)

(assert (= bs!29328 (and d!121325 b!1016074)))

(declare-datatypes ((Option!577 0))(
  ( (Some!576 (v!14427 B!1444)) (None!575) )
))
(declare-fun getValueByKey!526 (List!21433 (_ BitVec 64)) Option!577)

(assert (=> bs!29328 (= (dynLambda!1916 lambda!743 (h!22637 lt!449252)) (= (getValueByKey!526 (t!30426 l!412) (h!22637 lt!449252)) (Some!576 value!115)))))

(declare-fun m!938915 () Bool)

(assert (=> bs!29328 m!938915))

(assert (=> b!1016124 d!121325))

(push 1)

(assert (not bm!42946))

(assert (not bm!42947))

(assert (not b!1016231))

(assert tp_is_empty!23511)

(assert (not b!1016125))

(assert (not bm!42948))

(assert (not b!1016224))

(assert (not b!1016137))

(assert (not bs!29328))

(assert (not b_lambda!15389))

(assert (not d!121313))

(assert (not bm!42949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

