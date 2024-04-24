; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87528 () Bool)

(assert start!87528)

(declare-fun b!1013196 () Bool)

(declare-fun e!570090 () Bool)

(declare-datatypes ((B!1318 0))(
  ( (B!1319 (val!11743 Int)) )
))
(declare-datatypes ((tuple2!15036 0))(
  ( (tuple2!15037 (_1!7529 (_ BitVec 64)) (_2!7529 B!1318)) )
))
(declare-datatypes ((List!21325 0))(
  ( (Nil!21322) (Cons!21321 (h!22528 tuple2!15036) (t!30318 List!21325)) )
))
(declare-fun l!412 () List!21325)

(declare-fun isStrictlySorted!511 (List!21325) Bool)

(assert (=> b!1013196 (= e!570090 (not (isStrictlySorted!511 (t!30318 l!412))))))

(declare-fun b!1013197 () Bool)

(declare-fun e!570089 () Bool)

(declare-fun tp_is_empty!23385 () Bool)

(declare-fun tp!70233 () Bool)

(assert (=> b!1013197 (= e!570089 (and tp_is_empty!23385 tp!70233))))

(declare-fun res!680300 () Bool)

(assert (=> start!87528 (=> (not res!680300) (not e!570090))))

(assert (=> start!87528 (= res!680300 (isStrictlySorted!511 l!412))))

(assert (=> start!87528 e!570090))

(assert (=> start!87528 e!570089))

(assert (=> start!87528 tp_is_empty!23385))

(declare-fun b!1013194 () Bool)

(declare-fun res!680298 () Bool)

(assert (=> b!1013194 (=> (not res!680298) (not e!570090))))

(declare-fun value!115 () B!1318)

(assert (=> b!1013194 (= res!680298 (and (is-Cons!21321 l!412) (= (_2!7529 (h!22528 l!412)) value!115)))))

(declare-fun b!1013195 () Bool)

(declare-fun res!680299 () Bool)

(assert (=> b!1013195 (=> (not res!680299) (not e!570090))))

(declare-datatypes ((List!21326 0))(
  ( (Nil!21323) (Cons!21322 (h!22529 (_ BitVec 64)) (t!30319 List!21326)) )
))
(declare-fun isEmpty!781 (List!21326) Bool)

(declare-fun getKeysOf!8 (List!21325 B!1318) List!21326)

(assert (=> b!1013195 (= res!680299 (not (isEmpty!781 (getKeysOf!8 (t!30318 l!412) value!115))))))

(assert (= (and start!87528 res!680300) b!1013194))

(assert (= (and b!1013194 res!680298) b!1013195))

(assert (= (and b!1013195 res!680299) b!1013196))

(assert (= (and start!87528 (is-Cons!21321 l!412)) b!1013197))

(declare-fun m!937411 () Bool)

(assert (=> b!1013196 m!937411))

(declare-fun m!937413 () Bool)

(assert (=> start!87528 m!937413))

(declare-fun m!937415 () Bool)

(assert (=> b!1013195 m!937415))

(assert (=> b!1013195 m!937415))

(declare-fun m!937417 () Bool)

(assert (=> b!1013195 m!937417))

(push 1)

(assert (not b!1013197))

(assert tp_is_empty!23385)

(assert (not start!87528))

(assert (not b!1013196))

(assert (not b!1013195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120687 () Bool)

(assert (=> d!120687 (= (isEmpty!781 (getKeysOf!8 (t!30318 l!412) value!115)) (is-Nil!21323 (getKeysOf!8 (t!30318 l!412) value!115)))))

(assert (=> b!1013195 d!120687))

(declare-fun b!1013255 () Bool)

(assert (=> b!1013255 true))

(assert (=> b!1013255 true))

(assert (=> b!1013255 true))

(declare-fun bs!28769 () Bool)

(declare-fun b!1013250 () Bool)

(assert (= bs!28769 (and b!1013250 b!1013255)))

(declare-fun lt!447753 () List!21325)

(declare-fun lambda!250 () Int)

(declare-fun lt!447745 () tuple2!15036)

(declare-fun lt!447754 () tuple2!15036)

(declare-fun lt!447746 () List!21325)

(declare-fun lambda!249 () Int)

(assert (=> bs!28769 (= (= (Cons!21321 lt!447754 lt!447753) (Cons!21321 lt!447745 lt!447746)) (= lambda!250 lambda!249))))

(assert (=> b!1013250 true))

(assert (=> b!1013250 true))

(assert (=> b!1013250 true))

(declare-fun bs!28770 () Bool)

(declare-fun d!120691 () Bool)

(assert (= bs!28770 (and d!120691 b!1013255)))

(declare-fun lambda!251 () Int)

(assert (=> bs!28770 (= (= (t!30318 l!412) (Cons!21321 lt!447745 lt!447746)) (= lambda!251 lambda!249))))

(declare-fun bs!28771 () Bool)

(assert (= bs!28771 (and d!120691 b!1013250)))

(assert (=> bs!28771 (= (= (t!30318 l!412) (Cons!21321 lt!447754 lt!447753)) (= lambda!251 lambda!250))))

(assert (=> d!120691 true))

(assert (=> d!120691 true))

(declare-fun b!1013248 () Bool)

(declare-datatypes ((Unit!33031 0))(
  ( (Unit!33032) )
))
(declare-fun e!570120 () Unit!33031)

(declare-fun Unit!33033 () Unit!33031)

(assert (=> b!1013248 (= e!570120 Unit!33033)))

(declare-fun b!1013249 () Bool)

(declare-fun e!570121 () List!21326)

(assert (=> b!1013249 (= e!570121 Nil!21323)))

(declare-fun bm!42514 () Bool)

(declare-fun call!42517 () List!21326)

(assert (=> bm!42514 (= call!42517 (getKeysOf!8 (t!30318 (t!30318 l!412)) value!115))))

(declare-fun lt!447751 () Unit!33031)

(assert (=> b!1013250 (= e!570120 lt!447751)))

(assert (=> b!1013250 (= lt!447753 (t!30318 (t!30318 l!412)))))

(declare-fun lt!447744 () List!21326)

(assert (=> b!1013250 (= lt!447744 call!42517)))

(assert (=> b!1013250 (= lt!447754 (h!22528 (t!30318 l!412)))))

(declare-fun call!42520 () Unit!33031)

(assert (=> b!1013250 (= lt!447751 call!42520)))

(declare-fun call!42518 () Bool)

(assert (=> b!1013250 call!42518))

(declare-fun c!102619 () Bool)

(declare-fun lt!447752 () List!21326)

(declare-fun bm!42515 () Bool)

(declare-fun forall!203 (List!21326 Int) Bool)

(assert (=> bm!42515 (= call!42518 (forall!203 (ite c!102619 lt!447752 lt!447744) (ite c!102619 lambda!249 lambda!250)))))

(declare-fun b!1013251 () Bool)

(declare-fun e!570122 () List!21326)

(assert (=> b!1013251 (= e!570122 (Cons!21322 (_1!7529 (h!22528 (t!30318 l!412))) call!42517))))

(declare-fun c!102621 () Bool)

(declare-fun call!42519 () Bool)

(assert (=> b!1013251 (= c!102621 (not call!42519))))

(declare-fun lt!447749 () Unit!33031)

(declare-fun e!570119 () Unit!33031)

(assert (=> b!1013251 (= lt!447749 e!570119)))

(declare-fun lt!447750 () List!21326)

(assert (=> d!120691 (forall!203 lt!447750 lambda!251)))

(assert (=> d!120691 (= lt!447750 e!570122)))

(assert (=> d!120691 (= c!102619 (and (is-Cons!21321 (t!30318 l!412)) (= (_2!7529 (h!22528 (t!30318 l!412))) value!115)))))

(assert (=> d!120691 (isStrictlySorted!511 (t!30318 l!412))))

(assert (=> d!120691 (= (getKeysOf!8 (t!30318 l!412) value!115) lt!447750)))

(declare-fun b!1013252 () Bool)

(declare-fun Unit!33034 () Unit!33031)

(assert (=> b!1013252 (= e!570119 Unit!33034)))

(declare-fun b!1013253 () Bool)

(declare-fun lt!447747 () Unit!33031)

(assert (=> b!1013253 (= lt!447747 e!570120)))

(declare-fun c!102618 () Bool)

(assert (=> b!1013253 (= c!102618 (not call!42519))))

(declare-fun lt!447755 () List!21326)

(assert (=> b!1013253 (= lt!447755 call!42517)))

(assert (=> b!1013253 (= e!570121 call!42517)))

(declare-fun bm!42516 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!4 (List!21325 List!21326 B!1318 tuple2!15036) Unit!33031)

(assert (=> bm!42516 (= call!42520 (lemmaForallGetValueByKeySameWithASmallerHead!4 (ite c!102619 lt!447746 lt!447753) (ite c!102619 lt!447752 lt!447744) value!115 (ite c!102619 lt!447745 lt!447754)))))

(declare-fun b!1013254 () Bool)

(assert (=> b!1013254 (= e!570122 e!570121)))

(declare-fun c!102620 () Bool)

(assert (=> b!1013254 (= c!102620 (and (is-Cons!21321 (t!30318 l!412)) (not (= (_2!7529 (h!22528 (t!30318 l!412))) value!115))))))

(assert (=> b!1013255 call!42518))

(declare-fun lt!447748 () Unit!33031)

(assert (=> b!1013255 (= lt!447748 call!42520)))

(assert (=> b!1013255 (= lt!447745 (h!22528 (t!30318 l!412)))))

(assert (=> b!1013255 (= lt!447752 call!42517)))

(assert (=> b!1013255 (= lt!447746 (t!30318 (t!30318 l!412)))))

(assert (=> b!1013255 (= e!570119 lt!447748)))

(declare-fun bm!42517 () Bool)

(assert (=> bm!42517 (= call!42519 (isEmpty!781 call!42517))))

(assert (= (and d!120691 c!102619) b!1013251))

(assert (= (and d!120691 (not c!102619)) b!1013254))

(assert (= (and b!1013251 c!102621) b!1013255))

(assert (= (and b!1013251 (not c!102621)) b!1013252))

(assert (= (and b!1013254 c!102620) b!1013253))

(assert (= (and b!1013254 (not c!102620)) b!1013249))

(assert (= (and b!1013253 c!102618) b!1013250))

(assert (= (and b!1013253 (not c!102618)) b!1013248))

(assert (= (or b!1013255 b!1013250) bm!42516))

(assert (= (or b!1013255 b!1013250) bm!42515))

(assert (= (or b!1013251 b!1013255 b!1013250 b!1013253) bm!42514))

(assert (= (or b!1013251 b!1013253) bm!42517))

(declare-fun m!937427 () Bool)

(assert (=> bm!42514 m!937427))

(declare-fun m!937429 () Bool)

(assert (=> d!120691 m!937429))

(assert (=> d!120691 m!937411))

(declare-fun m!937431 () Bool)

(assert (=> bm!42516 m!937431))

(declare-fun m!937433 () Bool)

(assert (=> bm!42517 m!937433))

(declare-fun m!937435 () Bool)

(assert (=> bm!42515 m!937435))

(assert (=> b!1013195 d!120691))

(declare-fun d!120697 () Bool)

(declare-fun res!680320 () Bool)

(declare-fun e!570127 () Bool)

(assert (=> d!120697 (=> res!680320 e!570127)))

(assert (=> d!120697 (= res!680320 (or (is-Nil!21322 (t!30318 l!412)) (is-Nil!21322 (t!30318 (t!30318 l!412)))))))

(assert (=> d!120697 (= (isStrictlySorted!511 (t!30318 l!412)) e!570127)))

(declare-fun b!1013266 () Bool)

(declare-fun e!570128 () Bool)

(assert (=> b!1013266 (= e!570127 e!570128)))

(declare-fun res!680321 () Bool)

(assert (=> b!1013266 (=> (not res!680321) (not e!570128))))

(assert (=> b!1013266 (= res!680321 (bvslt (_1!7529 (h!22528 (t!30318 l!412))) (_1!7529 (h!22528 (t!30318 (t!30318 l!412))))))))

(declare-fun b!1013267 () Bool)

(assert (=> b!1013267 (= e!570128 (isStrictlySorted!511 (t!30318 (t!30318 l!412))))))

(assert (= (and d!120697 (not res!680320)) b!1013266))

(assert (= (and b!1013266 res!680321) b!1013267))

(declare-fun m!937437 () Bool)

(assert (=> b!1013267 m!937437))

(assert (=> b!1013196 d!120697))

(declare-fun d!120699 () Bool)

(declare-fun res!680322 () Bool)

(declare-fun e!570129 () Bool)

(assert (=> d!120699 (=> res!680322 e!570129)))

(assert (=> d!120699 (= res!680322 (or (is-Nil!21322 l!412) (is-Nil!21322 (t!30318 l!412))))))

(assert (=> d!120699 (= (isStrictlySorted!511 l!412) e!570129)))

(declare-fun b!1013268 () Bool)

(declare-fun e!570130 () Bool)

(assert (=> b!1013268 (= e!570129 e!570130)))

(declare-fun res!680323 () Bool)

(assert (=> b!1013268 (=> (not res!680323) (not e!570130))))

(assert (=> b!1013268 (= res!680323 (bvslt (_1!7529 (h!22528 l!412)) (_1!7529 (h!22528 (t!30318 l!412)))))))

(declare-fun b!1013269 () Bool)

(assert (=> b!1013269 (= e!570130 (isStrictlySorted!511 (t!30318 l!412)))))

(assert (= (and d!120699 (not res!680322)) b!1013268))

(assert (= (and b!1013268 res!680323) b!1013269))

(assert (=> b!1013269 m!937411))

(assert (=> start!87528 d!120699))

(declare-fun b!1013274 () Bool)

(declare-fun e!570133 () Bool)

(declare-fun tp!70239 () Bool)

(assert (=> b!1013274 (= e!570133 (and tp_is_empty!23385 tp!70239))))

(assert (=> b!1013197 (= tp!70233 e!570133)))

(assert (= (and b!1013197 (is-Cons!21321 (t!30318 l!412))) b!1013274))

(push 1)

(assert tp_is_empty!23385)

(assert (not bm!42516))

(assert (not d!120691))

(assert (not b!1013274))

(assert (not b!1013267))

(assert (not b!1013269))

(assert (not bm!42517))

(assert (not bm!42515))

(assert (not bm!42514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

