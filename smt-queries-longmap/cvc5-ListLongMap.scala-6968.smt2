; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88024 () Bool)

(assert start!88024)

(declare-fun b!1015947 () Bool)

(assert (=> b!1015947 true))

(assert (=> b!1015947 true))

(declare-fun b!1015945 () Bool)

(declare-fun res!681485 () Bool)

(declare-fun e!571504 () Bool)

(assert (=> b!1015945 (=> (not res!681485) (not e!571504))))

(declare-datatypes ((B!1518 0))(
  ( (B!1519 (val!11843 Int)) )
))
(declare-datatypes ((tuple2!15312 0))(
  ( (tuple2!15313 (_1!7667 (_ BitVec 64)) (_2!7667 B!1518)) )
))
(declare-fun newHead!31 () tuple2!15312)

(declare-datatypes ((List!21544 0))(
  ( (Nil!21541) (Cons!21540 (h!22738 tuple2!15312) (t!30536 List!21544)) )
))
(declare-fun l!1114 () List!21544)

(declare-fun head!959 (List!21544) tuple2!15312)

(assert (=> b!1015945 (= res!681485 (bvslt (_1!7667 newHead!31) (_1!7667 (head!959 l!1114))))))

(declare-fun b!1015946 () Bool)

(declare-fun res!681484 () Bool)

(assert (=> b!1015946 (=> (not res!681484) (not e!571504))))

(declare-datatypes ((List!21545 0))(
  ( (Nil!21542) (Cons!21541 (h!22739 (_ BitVec 64)) (t!30537 List!21545)) )
))
(declare-fun keys!40 () List!21545)

(assert (=> b!1015946 (= res!681484 (not (is-Cons!21541 keys!40)))))

(declare-fun res!681486 () Bool)

(assert (=> start!88024 (=> (not res!681486) (not e!571504))))

(declare-fun isStrictlySorted!607 (List!21544) Bool)

(assert (=> start!88024 (= res!681486 (isStrictlySorted!607 l!1114))))

(assert (=> start!88024 e!571504))

(declare-fun e!571505 () Bool)

(assert (=> start!88024 e!571505))

(assert (=> start!88024 true))

(declare-fun tp_is_empty!23585 () Bool)

(assert (=> start!88024 tp_is_empty!23585))

(declare-fun res!681487 () Bool)

(assert (=> b!1015947 (=> (not res!681487) (not e!571504))))

(declare-fun lambda!998 () Int)

(declare-fun forall!277 (List!21545 Int) Bool)

(assert (=> b!1015947 (= res!681487 (forall!277 keys!40 lambda!998))))

(declare-fun b!1015948 () Bool)

(declare-fun res!681488 () Bool)

(assert (=> b!1015948 (=> (not res!681488) (not e!571504))))

(declare-fun isEmpty!878 (List!21544) Bool)

(assert (=> b!1015948 (= res!681488 (not (isEmpty!878 l!1114)))))

(declare-fun b!1015949 () Bool)

(assert (=> b!1015949 (= e!571504 (not (isStrictlySorted!607 (Cons!21540 newHead!31 l!1114))))))

(declare-fun b!1015950 () Bool)

(declare-fun tp!70725 () Bool)

(assert (=> b!1015950 (= e!571505 (and tp_is_empty!23585 tp!70725))))

(assert (= (and start!88024 res!681486) b!1015948))

(assert (= (and b!1015948 res!681488) b!1015947))

(assert (= (and b!1015947 res!681487) b!1015945))

(assert (= (and b!1015945 res!681485) b!1015946))

(assert (= (and b!1015946 res!681484) b!1015949))

(assert (= (and start!88024 (is-Cons!21540 l!1114)) b!1015950))

(declare-fun m!937311 () Bool)

(assert (=> b!1015947 m!937311))

(declare-fun m!937313 () Bool)

(assert (=> start!88024 m!937313))

(declare-fun m!937315 () Bool)

(assert (=> b!1015949 m!937315))

(declare-fun m!937317 () Bool)

(assert (=> b!1015945 m!937317))

(declare-fun m!937319 () Bool)

(assert (=> b!1015948 m!937319))

(push 1)

(assert (not b!1015945))

(assert tp_is_empty!23585)

(assert (not b!1015947))

(assert (not b!1015950))

(assert (not b!1015949))

(assert (not b!1015948))

(assert (not start!88024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120983 () Bool)

(assert (=> d!120983 (= (head!959 l!1114) (h!22738 l!1114))))

(assert (=> b!1015945 d!120983))

(declare-fun d!120985 () Bool)

(declare-fun res!681511 () Bool)

(declare-fun e!571531 () Bool)

(assert (=> d!120985 (=> res!681511 e!571531)))

(assert (=> d!120985 (= res!681511 (or (is-Nil!21541 l!1114) (is-Nil!21541 (t!30536 l!1114))))))

(assert (=> d!120985 (= (isStrictlySorted!607 l!1114) e!571531)))

(declare-fun b!1015982 () Bool)

(declare-fun e!571532 () Bool)

(assert (=> b!1015982 (= e!571531 e!571532)))

(declare-fun res!681512 () Bool)

(assert (=> b!1015982 (=> (not res!681512) (not e!571532))))

(assert (=> b!1015982 (= res!681512 (bvslt (_1!7667 (h!22738 l!1114)) (_1!7667 (h!22738 (t!30536 l!1114)))))))

(declare-fun b!1015983 () Bool)

(assert (=> b!1015983 (= e!571532 (isStrictlySorted!607 (t!30536 l!1114)))))

(assert (= (and d!120985 (not res!681511)) b!1015982))

(assert (= (and b!1015982 res!681512) b!1015983))

(declare-fun m!937329 () Bool)

(assert (=> b!1015983 m!937329))

(assert (=> start!88024 d!120985))

(declare-fun d!120993 () Bool)

(declare-fun res!681513 () Bool)

(declare-fun e!571533 () Bool)

(assert (=> d!120993 (=> res!681513 e!571533)))

(assert (=> d!120993 (= res!681513 (or (is-Nil!21541 (Cons!21540 newHead!31 l!1114)) (is-Nil!21541 (t!30536 (Cons!21540 newHead!31 l!1114)))))))

(assert (=> d!120993 (= (isStrictlySorted!607 (Cons!21540 newHead!31 l!1114)) e!571533)))

(declare-fun b!1015984 () Bool)

(declare-fun e!571534 () Bool)

(assert (=> b!1015984 (= e!571533 e!571534)))

(declare-fun res!681514 () Bool)

(assert (=> b!1015984 (=> (not res!681514) (not e!571534))))

(assert (=> b!1015984 (= res!681514 (bvslt (_1!7667 (h!22738 (Cons!21540 newHead!31 l!1114))) (_1!7667 (h!22738 (t!30536 (Cons!21540 newHead!31 l!1114))))))))

(declare-fun b!1015985 () Bool)

(assert (=> b!1015985 (= e!571534 (isStrictlySorted!607 (t!30536 (Cons!21540 newHead!31 l!1114))))))

(assert (= (and d!120993 (not res!681513)) b!1015984))

(assert (= (and b!1015984 res!681514) b!1015985))

(declare-fun m!937333 () Bool)

(assert (=> b!1015985 m!937333))

(assert (=> b!1015949 d!120993))

(declare-fun d!120995 () Bool)

(declare-fun res!681521 () Bool)

(declare-fun e!571541 () Bool)

(assert (=> d!120995 (=> res!681521 e!571541)))

(assert (=> d!120995 (= res!681521 (is-Nil!21542 keys!40))))

(assert (=> d!120995 (= (forall!277 keys!40 lambda!998) e!571541)))

(declare-fun b!1015992 () Bool)

(declare-fun e!571542 () Bool)

(assert (=> b!1015992 (= e!571541 e!571542)))

(declare-fun res!681522 () Bool)

(assert (=> b!1015992 (=> (not res!681522) (not e!571542))))

(declare-fun dynLambda!1902 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015992 (= res!681522 (dynLambda!1902 lambda!998 (h!22739 keys!40)))))

(declare-fun b!1015993 () Bool)

(assert (=> b!1015993 (= e!571542 (forall!277 (t!30537 keys!40) lambda!998))))

(assert (= (and d!120995 (not res!681521)) b!1015992))

(assert (= (and b!1015992 res!681522) b!1015993))

(declare-fun b_lambda!15463 () Bool)

(assert (=> (not b_lambda!15463) (not b!1015992)))

(declare-fun m!937339 () Bool)

(assert (=> b!1015992 m!937339))

(declare-fun m!937341 () Bool)

(assert (=> b!1015993 m!937341))

(assert (=> b!1015947 d!120995))

(declare-fun d!121003 () Bool)

(assert (=> d!121003 (= (isEmpty!878 l!1114) (is-Nil!21541 l!1114))))

(assert (=> b!1015948 d!121003))

(declare-fun b!1016002 () Bool)

(declare-fun e!571549 () Bool)

(declare-fun tp!70731 () Bool)

(assert (=> b!1016002 (= e!571549 (and tp_is_empty!23585 tp!70731))))

(assert (=> b!1015950 (= tp!70725 e!571549)))

(assert (= (and b!1015950 (is-Cons!21540 (t!30536 l!1114))) b!1016002))

(declare-fun b_lambda!15465 () Bool)

(assert (= b_lambda!15463 (or b!1015947 b_lambda!15465)))

(declare-fun bs!29471 () Bool)

(declare-fun d!121005 () Bool)

(assert (= bs!29471 (and d!121005 b!1015947)))

(declare-fun value!178 () B!1518)

(declare-datatypes ((Option!600 0))(
  ( (Some!599 (v!14447 B!1518)) (None!598) )
))
(declare-fun getValueByKey!549 (List!21544 (_ BitVec 64)) Option!600)

(assert (=> bs!29471 (= (dynLambda!1902 lambda!998 (h!22739 keys!40)) (= (getValueByKey!549 l!1114 (h!22739 keys!40)) (Some!599 value!178)))))

(declare-fun m!937343 () Bool)

(assert (=> bs!29471 m!937343))

(assert (=> b!1015992 d!121005))

(push 1)

(assert (not b!1016002))

(assert (not bs!29471))

(assert (not b!1015985))

(assert tp_is_empty!23585)

(assert (not b!1015993))

(assert (not b!1015983))

(assert (not b_lambda!15465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

