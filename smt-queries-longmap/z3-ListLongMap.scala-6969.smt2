; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88050 () Bool)

(assert start!88050)

(declare-fun b!1016022 () Bool)

(assert (=> b!1016022 true))

(assert (=> b!1016022 true))

(declare-fun res!681540 () Bool)

(declare-fun e!571562 () Bool)

(assert (=> b!1016022 (=> (not res!681540) (not e!571562))))

(declare-datatypes ((List!21546 0))(
  ( (Nil!21543) (Cons!21542 (h!22740 (_ BitVec 64)) (t!30538 List!21546)) )
))
(declare-fun keys!40 () List!21546)

(declare-fun lambda!1001 () Int)

(declare-fun forall!278 (List!21546 Int) Bool)

(assert (=> b!1016022 (= res!681540 (forall!278 keys!40 lambda!1001))))

(declare-fun b!1016023 () Bool)

(declare-fun e!571561 () Bool)

(declare-fun tp_is_empty!23587 () Bool)

(declare-fun tp!70737 () Bool)

(assert (=> b!1016023 (= e!571561 (and tp_is_empty!23587 tp!70737))))

(declare-fun res!681542 () Bool)

(assert (=> start!88050 (=> (not res!681542) (not e!571562))))

(declare-datatypes ((B!1520 0))(
  ( (B!1521 (val!11844 Int)) )
))
(declare-datatypes ((tuple2!15314 0))(
  ( (tuple2!15315 (_1!7668 (_ BitVec 64)) (_2!7668 B!1520)) )
))
(declare-datatypes ((List!21547 0))(
  ( (Nil!21544) (Cons!21543 (h!22741 tuple2!15314) (t!30539 List!21547)) )
))
(declare-fun l!1114 () List!21547)

(declare-fun isStrictlySorted!608 (List!21547) Bool)

(assert (=> start!88050 (= res!681542 (isStrictlySorted!608 l!1114))))

(assert (=> start!88050 e!571562))

(assert (=> start!88050 e!571561))

(assert (=> start!88050 true))

(assert (=> start!88050 tp_is_empty!23587))

(declare-fun b!1016024 () Bool)

(declare-fun res!681539 () Bool)

(assert (=> b!1016024 (=> (not res!681539) (not e!571562))))

(declare-fun isEmpty!879 (List!21547) Bool)

(assert (=> b!1016024 (= res!681539 (not (isEmpty!879 l!1114)))))

(declare-fun b!1016025 () Bool)

(declare-fun res!681541 () Bool)

(assert (=> b!1016025 (=> (not res!681541) (not e!571562))))

(declare-fun newHead!31 () tuple2!15314)

(declare-fun head!960 (List!21547) tuple2!15314)

(assert (=> b!1016025 (= res!681541 (bvslt (_1!7668 newHead!31) (_1!7668 (head!960 l!1114))))))

(declare-fun b!1016026 () Bool)

(declare-fun ListPrimitiveSize!121 (List!21546) Int)

(assert (=> b!1016026 (= e!571562 (< (ListPrimitiveSize!121 keys!40) 0))))

(assert (= (and start!88050 res!681542) b!1016024))

(assert (= (and b!1016024 res!681539) b!1016022))

(assert (= (and b!1016022 res!681540) b!1016025))

(assert (= (and b!1016025 res!681541) b!1016026))

(get-info :version)

(assert (= (and start!88050 ((_ is Cons!21543) l!1114)) b!1016023))

(declare-fun m!937351 () Bool)

(assert (=> b!1016025 m!937351))

(declare-fun m!937353 () Bool)

(assert (=> b!1016024 m!937353))

(declare-fun m!937355 () Bool)

(assert (=> b!1016022 m!937355))

(declare-fun m!937357 () Bool)

(assert (=> b!1016026 m!937357))

(declare-fun m!937359 () Bool)

(assert (=> start!88050 m!937359))

(check-sat (not b!1016024) (not b!1016023) (not b!1016022) (not start!88050) (not b!1016025) (not b!1016026) tp_is_empty!23587)
(check-sat)
(get-model)

(declare-fun d!121013 () Bool)

(assert (=> d!121013 (= (head!960 l!1114) (h!22741 l!1114))))

(assert (=> b!1016025 d!121013))

(declare-fun d!121015 () Bool)

(assert (=> d!121015 (= (isEmpty!879 l!1114) ((_ is Nil!21544) l!1114))))

(assert (=> b!1016024 d!121015))

(declare-fun d!121017 () Bool)

(declare-fun res!681571 () Bool)

(declare-fun e!571579 () Bool)

(assert (=> d!121017 (=> res!681571 e!571579)))

(assert (=> d!121017 (= res!681571 ((_ is Nil!21543) keys!40))))

(assert (=> d!121017 (= (forall!278 keys!40 lambda!1001) e!571579)))

(declare-fun b!1016073 () Bool)

(declare-fun e!571580 () Bool)

(assert (=> b!1016073 (= e!571579 e!571580)))

(declare-fun res!681572 () Bool)

(assert (=> b!1016073 (=> (not res!681572) (not e!571580))))

(declare-fun dynLambda!1903 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016073 (= res!681572 (dynLambda!1903 lambda!1001 (h!22740 keys!40)))))

(declare-fun b!1016074 () Bool)

(assert (=> b!1016074 (= e!571580 (forall!278 (t!30538 keys!40) lambda!1001))))

(assert (= (and d!121017 (not res!681571)) b!1016073))

(assert (= (and b!1016073 res!681572) b!1016074))

(declare-fun b_lambda!15469 () Bool)

(assert (=> (not b_lambda!15469) (not b!1016073)))

(declare-fun m!937381 () Bool)

(assert (=> b!1016073 m!937381))

(declare-fun m!937383 () Bool)

(assert (=> b!1016074 m!937383))

(assert (=> b!1016022 d!121017))

(declare-fun d!121019 () Bool)

(declare-fun lt!449050 () Int)

(assert (=> d!121019 (>= lt!449050 0)))

(declare-fun e!571583 () Int)

(assert (=> d!121019 (= lt!449050 e!571583)))

(declare-fun c!102880 () Bool)

(assert (=> d!121019 (= c!102880 ((_ is Nil!21543) keys!40))))

(assert (=> d!121019 (= (ListPrimitiveSize!121 keys!40) lt!449050)))

(declare-fun b!1016079 () Bool)

(assert (=> b!1016079 (= e!571583 0)))

(declare-fun b!1016080 () Bool)

(assert (=> b!1016080 (= e!571583 (+ 1 (ListPrimitiveSize!121 (t!30538 keys!40))))))

(assert (= (and d!121019 c!102880) b!1016079))

(assert (= (and d!121019 (not c!102880)) b!1016080))

(declare-fun m!937385 () Bool)

(assert (=> b!1016080 m!937385))

(assert (=> b!1016026 d!121019))

(declare-fun d!121025 () Bool)

(declare-fun res!681581 () Bool)

(declare-fun e!571594 () Bool)

(assert (=> d!121025 (=> res!681581 e!571594)))

(assert (=> d!121025 (= res!681581 (or ((_ is Nil!21544) l!1114) ((_ is Nil!21544) (t!30539 l!1114))))))

(assert (=> d!121025 (= (isStrictlySorted!608 l!1114) e!571594)))

(declare-fun b!1016093 () Bool)

(declare-fun e!571595 () Bool)

(assert (=> b!1016093 (= e!571594 e!571595)))

(declare-fun res!681582 () Bool)

(assert (=> b!1016093 (=> (not res!681582) (not e!571595))))

(assert (=> b!1016093 (= res!681582 (bvslt (_1!7668 (h!22741 l!1114)) (_1!7668 (h!22741 (t!30539 l!1114)))))))

(declare-fun b!1016094 () Bool)

(assert (=> b!1016094 (= e!571595 (isStrictlySorted!608 (t!30539 l!1114)))))

(assert (= (and d!121025 (not res!681581)) b!1016093))

(assert (= (and b!1016093 res!681582) b!1016094))

(declare-fun m!937387 () Bool)

(assert (=> b!1016094 m!937387))

(assert (=> start!88050 d!121025))

(declare-fun b!1016099 () Bool)

(declare-fun e!571598 () Bool)

(declare-fun tp!70746 () Bool)

(assert (=> b!1016099 (= e!571598 (and tp_is_empty!23587 tp!70746))))

(assert (=> b!1016023 (= tp!70737 e!571598)))

(assert (= (and b!1016023 ((_ is Cons!21543) (t!30539 l!1114))) b!1016099))

(declare-fun b_lambda!15471 () Bool)

(assert (= b_lambda!15469 (or b!1016022 b_lambda!15471)))

(declare-fun bs!29476 () Bool)

(declare-fun d!121031 () Bool)

(assert (= bs!29476 (and d!121031 b!1016022)))

(declare-fun value!178 () B!1520)

(declare-datatypes ((Option!602 0))(
  ( (Some!601 (v!14449 B!1520)) (None!600) )
))
(declare-fun getValueByKey!551 (List!21547 (_ BitVec 64)) Option!602)

(assert (=> bs!29476 (= (dynLambda!1903 lambda!1001 (h!22740 keys!40)) (= (getValueByKey!551 l!1114 (h!22740 keys!40)) (Some!601 value!178)))))

(declare-fun m!937389 () Bool)

(assert (=> bs!29476 m!937389))

(assert (=> b!1016073 d!121031))

(check-sat (not b!1016080) (not b!1016099) (not b!1016074) (not b!1016094) (not b_lambda!15471) (not bs!29476) tp_is_empty!23587)
(check-sat)
