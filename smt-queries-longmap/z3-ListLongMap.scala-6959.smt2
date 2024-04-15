; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87876 () Bool)

(assert start!87876)

(declare-fun b!1015242 () Bool)

(assert (=> b!1015242 true))

(assert (=> b!1015242 true))

(declare-fun res!681035 () Bool)

(declare-fun e!571114 () Bool)

(assert (=> start!87876 (=> (not res!681035) (not e!571114))))

(declare-datatypes ((B!1460 0))(
  ( (B!1461 (val!11814 Int)) )
))
(declare-datatypes ((tuple2!15254 0))(
  ( (tuple2!15255 (_1!7638 (_ BitVec 64)) (_2!7638 B!1460)) )
))
(declare-datatypes ((List!21495 0))(
  ( (Nil!21492) (Cons!21491 (h!22689 tuple2!15254) (t!30487 List!21495)) )
))
(declare-fun l!412 () List!21495)

(declare-fun isStrictlySorted!584 (List!21495) Bool)

(assert (=> start!87876 (= res!681035 (isStrictlySorted!584 l!412))))

(assert (=> start!87876 e!571114))

(declare-fun e!571115 () Bool)

(assert (=> start!87876 e!571115))

(declare-fun tp_is_empty!23527 () Bool)

(assert (=> start!87876 tp_is_empty!23527))

(declare-fun b!1015241 () Bool)

(declare-fun res!681034 () Bool)

(assert (=> b!1015241 (=> (not res!681034) (not e!571114))))

(declare-fun value!115 () B!1460)

(get-info :version)

(assert (=> b!1015241 (= res!681034 (and (or (not ((_ is Cons!21491) l!412)) (not (= (_2!7638 (h!22689 l!412)) value!115))) (or (not ((_ is Cons!21491) l!412)) (= (_2!7638 (h!22689 l!412)) value!115)) ((_ is Nil!21492) l!412)))))

(declare-fun lambda!893 () Int)

(declare-datatypes ((List!21496 0))(
  ( (Nil!21493) (Cons!21492 (h!22690 (_ BitVec 64)) (t!30488 List!21496)) )
))
(declare-fun forall!257 (List!21496 Int) Bool)

(assert (=> b!1015242 (= e!571114 (not (forall!257 Nil!21493 lambda!893)))))

(declare-fun b!1015243 () Bool)

(declare-fun tp!70611 () Bool)

(assert (=> b!1015243 (= e!571115 (and tp_is_empty!23527 tp!70611))))

(assert (= (and start!87876 res!681035) b!1015241))

(assert (= (and b!1015241 res!681034) b!1015242))

(assert (= (and start!87876 ((_ is Cons!21491) l!412)) b!1015243))

(declare-fun m!936901 () Bool)

(assert (=> start!87876 m!936901))

(declare-fun m!936903 () Bool)

(assert (=> b!1015242 m!936903))

(check-sat (not start!87876) (not b!1015242) (not b!1015243) tp_is_empty!23527)
(check-sat)
(get-model)

(declare-fun d!120819 () Bool)

(declare-fun res!681058 () Bool)

(declare-fun e!571138 () Bool)

(assert (=> d!120819 (=> res!681058 e!571138)))

(assert (=> d!120819 (= res!681058 (or ((_ is Nil!21492) l!412) ((_ is Nil!21492) (t!30487 l!412))))))

(assert (=> d!120819 (= (isStrictlySorted!584 l!412) e!571138)))

(declare-fun b!1015284 () Bool)

(declare-fun e!571139 () Bool)

(assert (=> b!1015284 (= e!571138 e!571139)))

(declare-fun res!681059 () Bool)

(assert (=> b!1015284 (=> (not res!681059) (not e!571139))))

(assert (=> b!1015284 (= res!681059 (bvslt (_1!7638 (h!22689 l!412)) (_1!7638 (h!22689 (t!30487 l!412)))))))

(declare-fun b!1015285 () Bool)

(assert (=> b!1015285 (= e!571139 (isStrictlySorted!584 (t!30487 l!412)))))

(assert (= (and d!120819 (not res!681058)) b!1015284))

(assert (= (and b!1015284 res!681059) b!1015285))

(declare-fun m!936917 () Bool)

(assert (=> b!1015285 m!936917))

(assert (=> start!87876 d!120819))

(declare-fun d!120827 () Bool)

(declare-fun res!681074 () Bool)

(declare-fun e!571154 () Bool)

(assert (=> d!120827 (=> res!681074 e!571154)))

(assert (=> d!120827 (= res!681074 ((_ is Nil!21493) Nil!21493))))

(assert (=> d!120827 (= (forall!257 Nil!21493 lambda!893) e!571154)))

(declare-fun b!1015300 () Bool)

(declare-fun e!571155 () Bool)

(assert (=> b!1015300 (= e!571154 e!571155)))

(declare-fun res!681075 () Bool)

(assert (=> b!1015300 (=> (not res!681075) (not e!571155))))

(declare-fun dynLambda!1892 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015300 (= res!681075 (dynLambda!1892 lambda!893 (h!22690 Nil!21493)))))

(declare-fun b!1015301 () Bool)

(assert (=> b!1015301 (= e!571155 (forall!257 (t!30488 Nil!21493) lambda!893))))

(assert (= (and d!120827 (not res!681074)) b!1015300))

(assert (= (and b!1015300 res!681075) b!1015301))

(declare-fun b_lambda!15399 () Bool)

(assert (=> (not b_lambda!15399) (not b!1015300)))

(declare-fun m!936921 () Bool)

(assert (=> b!1015300 m!936921))

(declare-fun m!936923 () Bool)

(assert (=> b!1015301 m!936923))

(assert (=> b!1015242 d!120827))

(declare-fun b!1015316 () Bool)

(declare-fun e!571166 () Bool)

(declare-fun tp!70622 () Bool)

(assert (=> b!1015316 (= e!571166 (and tp_is_empty!23527 tp!70622))))

(assert (=> b!1015243 (= tp!70611 e!571166)))

(assert (= (and b!1015243 ((_ is Cons!21491) (t!30487 l!412))) b!1015316))

(declare-fun b_lambda!15401 () Bool)

(assert (= b_lambda!15399 (or b!1015242 b_lambda!15401)))

(declare-fun bs!29408 () Bool)

(declare-fun d!120831 () Bool)

(assert (= bs!29408 (and d!120831 b!1015242)))

(declare-datatypes ((Option!588 0))(
  ( (Some!587 (v!14435 B!1460)) (None!586) )
))
(declare-fun getValueByKey!537 (List!21495 (_ BitVec 64)) Option!588)

(assert (=> bs!29408 (= (dynLambda!1892 lambda!893 (h!22690 Nil!21493)) (= (getValueByKey!537 l!412 (h!22690 Nil!21493)) (Some!587 value!115)))))

(declare-fun m!936929 () Bool)

(assert (=> bs!29408 m!936929))

(assert (=> b!1015300 d!120831))

(check-sat (not b_lambda!15401) tp_is_empty!23527 (not b!1015316) (not bs!29408) (not b!1015285) (not b!1015301))
(check-sat)
