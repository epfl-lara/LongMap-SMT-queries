; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137060 () Bool)

(assert start!137060)

(declare-fun res!1079250 () Bool)

(declare-fun e!881357 () Bool)

(assert (=> start!137060 (=> (not res!1079250) (not e!881357))))

(declare-datatypes ((B!2612 0))(
  ( (B!2613 (val!19668 Int)) )
))
(declare-datatypes ((tuple2!25438 0))(
  ( (tuple2!25439 (_1!12730 (_ BitVec 64)) (_2!12730 B!2612)) )
))
(declare-datatypes ((List!36788 0))(
  ( (Nil!36785) (Cons!36784 (h!38327 tuple2!25438) (t!51702 List!36788)) )
))
(declare-fun l!1390 () List!36788)

(declare-fun isStrictlySorted!1046 (List!36788) Bool)

(assert (=> start!137060 (= res!1079250 (isStrictlySorted!1046 l!1390))))

(assert (=> start!137060 e!881357))

(declare-fun e!881356 () Bool)

(assert (=> start!137060 e!881356))

(assert (=> start!137060 true))

(declare-fun tp_is_empty!39157 () Bool)

(assert (=> start!137060 tp_is_empty!39157))

(declare-fun b!1579904 () Bool)

(declare-fun e!881355 () Bool)

(declare-datatypes ((tuple2!25440 0))(
  ( (tuple2!25441 (_1!12731 tuple2!25438) (_2!12731 List!36788)) )
))
(declare-datatypes ((Option!887 0))(
  ( (Some!886 (v!22381 tuple2!25440)) (None!885) )
))
(declare-fun lt!676642 () Option!887)

(declare-fun isDefined!597 (Option!887) Bool)

(assert (=> b!1579904 (= e!881355 (not (isDefined!597 lt!676642)))))

(declare-fun b!1579905 () Bool)

(declare-fun res!1079252 () Bool)

(assert (=> b!1579905 (=> (not res!1079252) (not e!881357))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2612)

(declare-fun contains!10460 (List!36788 tuple2!25438) Bool)

(assert (=> b!1579905 (= res!1079252 (contains!10460 l!1390 (tuple2!25439 key!405 value!194)))))

(declare-fun b!1579906 () Bool)

(declare-fun res!1079251 () Bool)

(assert (=> b!1579906 (=> (not res!1079251) (not e!881357))))

(declare-fun containsKey!892 (List!36788 (_ BitVec 64)) Bool)

(assert (=> b!1579906 (= res!1079251 (containsKey!892 l!1390 key!405))))

(declare-fun b!1579907 () Bool)

(assert (=> b!1579907 (= e!881357 e!881355)))

(declare-fun res!1079253 () Bool)

(assert (=> b!1579907 (=> (not res!1079253) (not e!881355))))

(declare-fun isEmpty!1154 (Option!887) Bool)

(assert (=> b!1579907 (= res!1079253 (not (isEmpty!1154 lt!676642)))))

(declare-fun unapply!70 (List!36788) Option!887)

(assert (=> b!1579907 (= lt!676642 (unapply!70 l!1390))))

(declare-fun b!1579908 () Bool)

(declare-fun tp!114387 () Bool)

(assert (=> b!1579908 (= e!881356 (and tp_is_empty!39157 tp!114387))))

(assert (= (and start!137060 res!1079250) b!1579906))

(assert (= (and b!1579906 res!1079251) b!1579905))

(assert (= (and b!1579905 res!1079252) b!1579907))

(assert (= (and b!1579907 res!1079253) b!1579904))

(assert (= (and start!137060 (is-Cons!36784 l!1390)) b!1579908))

(declare-fun m!1451515 () Bool)

(assert (=> b!1579904 m!1451515))

(declare-fun m!1451517 () Bool)

(assert (=> b!1579906 m!1451517))

(declare-fun m!1451519 () Bool)

(assert (=> b!1579907 m!1451519))

(declare-fun m!1451521 () Bool)

(assert (=> b!1579907 m!1451521))

(declare-fun m!1451523 () Bool)

(assert (=> start!137060 m!1451523))

(declare-fun m!1451525 () Bool)

(assert (=> b!1579905 m!1451525))

(push 1)

(assert (not start!137060))

(assert (not b!1579907))

(assert (not b!1579904))

(assert (not b!1579908))

(assert (not b!1579905))

(assert (not b!1579906))

(assert tp_is_empty!39157)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166359 () Bool)

(declare-fun res!1079288 () Bool)

(declare-fun e!881386 () Bool)

(assert (=> d!166359 (=> res!1079288 e!881386)))

(assert (=> d!166359 (= res!1079288 (or (is-Nil!36785 l!1390) (is-Nil!36785 (t!51702 l!1390))))))

(assert (=> d!166359 (= (isStrictlySorted!1046 l!1390) e!881386)))

(declare-fun b!1579949 () Bool)

(declare-fun e!881387 () Bool)

(assert (=> b!1579949 (= e!881386 e!881387)))

(declare-fun res!1079289 () Bool)

(assert (=> b!1579949 (=> (not res!1079289) (not e!881387))))

(assert (=> b!1579949 (= res!1079289 (bvslt (_1!12730 (h!38327 l!1390)) (_1!12730 (h!38327 (t!51702 l!1390)))))))

(declare-fun b!1579950 () Bool)

(assert (=> b!1579950 (= e!881387 (isStrictlySorted!1046 (t!51702 l!1390)))))

(assert (= (and d!166359 (not res!1079288)) b!1579949))

(assert (= (and b!1579949 res!1079289) b!1579950))

(declare-fun m!1451557 () Bool)

(assert (=> b!1579950 m!1451557))

(assert (=> start!137060 d!166359))

(declare-fun d!166365 () Bool)

(declare-fun res!1079306 () Bool)

(declare-fun e!881404 () Bool)

(assert (=> d!166365 (=> res!1079306 e!881404)))

(assert (=> d!166365 (= res!1079306 (and (is-Cons!36784 l!1390) (= (_1!12730 (h!38327 l!1390)) key!405)))))

(assert (=> d!166365 (= (containsKey!892 l!1390 key!405) e!881404)))

(declare-fun b!1579967 () Bool)

(declare-fun e!881405 () Bool)

(assert (=> b!1579967 (= e!881404 e!881405)))

(declare-fun res!1079307 () Bool)

(assert (=> b!1579967 (=> (not res!1079307) (not e!881405))))

(assert (=> b!1579967 (= res!1079307 (and (or (not (is-Cons!36784 l!1390)) (bvsle (_1!12730 (h!38327 l!1390)) key!405)) (is-Cons!36784 l!1390) (bvslt (_1!12730 (h!38327 l!1390)) key!405)))))

(declare-fun b!1579968 () Bool)

(assert (=> b!1579968 (= e!881405 (containsKey!892 (t!51702 l!1390) key!405))))

(assert (= (and d!166365 (not res!1079306)) b!1579967))

(assert (= (and b!1579967 res!1079307) b!1579968))

(declare-fun m!1451567 () Bool)

(assert (=> b!1579968 m!1451567))

(assert (=> b!1579906 d!166365))

(declare-fun d!166371 () Bool)

(assert (=> d!166371 (= (isEmpty!1154 lt!676642) (not (is-Some!886 lt!676642)))))

(assert (=> b!1579907 d!166371))

(declare-fun d!166375 () Bool)

(assert (=> d!166375 (= (unapply!70 l!1390) (ite (is-Nil!36785 l!1390) None!885 (Some!886 (tuple2!25441 (h!38327 l!1390) (t!51702 l!1390)))))))

(assert (=> b!1579907 d!166375))

(declare-fun d!166377 () Bool)

(assert (=> d!166377 (= (isDefined!597 lt!676642) (not (isEmpty!1154 lt!676642)))))

(declare-fun bs!45766 () Bool)

(assert (= bs!45766 d!166377))

(assert (=> bs!45766 m!1451519))

(assert (=> b!1579904 d!166377))

(declare-fun lt!676657 () Bool)

(declare-fun d!166381 () Bool)

(declare-fun content!830 (List!36788) (Set tuple2!25438))

(assert (=> d!166381 (= lt!676657 (set.member (tuple2!25439 key!405 value!194) (content!830 l!1390)))))

(declare-fun e!881431 () Bool)

(assert (=> d!166381 (= lt!676657 e!881431)))

(declare-fun res!1079330 () Bool)

(assert (=> d!166381 (=> (not res!1079330) (not e!881431))))

(assert (=> d!166381 (= res!1079330 (is-Cons!36784 l!1390))))

(assert (=> d!166381 (= (contains!10460 l!1390 (tuple2!25439 key!405 value!194)) lt!676657)))

(declare-fun b!1579996 () Bool)

(declare-fun e!881432 () Bool)

(assert (=> b!1579996 (= e!881431 e!881432)))

(declare-fun res!1079331 () Bool)

(assert (=> b!1579996 (=> res!1079331 e!881432)))

(assert (=> b!1579996 (= res!1079331 (= (h!38327 l!1390) (tuple2!25439 key!405 value!194)))))

(declare-fun b!1579997 () Bool)

(assert (=> b!1579997 (= e!881432 (contains!10460 (t!51702 l!1390) (tuple2!25439 key!405 value!194)))))

(assert (= (and d!166381 res!1079330) b!1579996))

(assert (= (and b!1579996 (not res!1079331)) b!1579997))

(declare-fun m!1451575 () Bool)

(assert (=> d!166381 m!1451575))

(declare-fun m!1451577 () Bool)

(assert (=> d!166381 m!1451577))

(declare-fun m!1451579 () Bool)

(assert (=> b!1579997 m!1451579))

(assert (=> b!1579905 d!166381))

(declare-fun b!1580002 () Bool)

(declare-fun e!881435 () Bool)

(declare-fun tp!114399 () Bool)

(assert (=> b!1580002 (= e!881435 (and tp_is_empty!39157 tp!114399))))

(assert (=> b!1579908 (= tp!114387 e!881435)))

(assert (= (and b!1579908 (is-Cons!36784 (t!51702 l!1390))) b!1580002))

(push 1)

