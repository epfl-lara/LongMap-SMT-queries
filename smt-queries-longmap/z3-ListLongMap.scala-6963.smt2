; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87914 () Bool)

(assert start!87914)

(declare-fun b!1015546 () Bool)

(assert (=> b!1015546 true))

(assert (=> b!1015546 true))

(declare-fun res!681188 () Bool)

(declare-fun e!571305 () Bool)

(assert (=> b!1015546 (=> (not res!681188) (not e!571305))))

(declare-datatypes ((List!21480 0))(
  ( (Nil!21477) (Cons!21476 (h!22674 (_ BitVec 64)) (t!30481 List!21480)) )
))
(declare-fun keys!40 () List!21480)

(declare-fun lambda!914 () Int)

(declare-fun forall!260 (List!21480 Int) Bool)

(assert (=> b!1015546 (= res!681188 (forall!260 keys!40 lambda!914))))

(declare-fun b!1015545 () Bool)

(declare-fun res!681189 () Bool)

(assert (=> b!1015545 (=> (not res!681189) (not e!571305))))

(declare-datatypes ((B!1486 0))(
  ( (B!1487 (val!11827 Int)) )
))
(declare-datatypes ((tuple2!15200 0))(
  ( (tuple2!15201 (_1!7611 (_ BitVec 64)) (_2!7611 B!1486)) )
))
(declare-datatypes ((List!21481 0))(
  ( (Nil!21478) (Cons!21477 (h!22675 tuple2!15200) (t!30482 List!21481)) )
))
(declare-fun l!1114 () List!21481)

(declare-fun isEmpty!857 (List!21481) Bool)

(assert (=> b!1015545 (= res!681189 (not (isEmpty!857 l!1114)))))

(declare-fun b!1015548 () Bool)

(declare-fun e!571306 () Bool)

(declare-fun tp_is_empty!23553 () Bool)

(declare-fun tp!70658 () Bool)

(assert (=> b!1015548 (= e!571306 (and tp_is_empty!23553 tp!70658))))

(declare-fun b!1015547 () Bool)

(assert (=> b!1015547 (= e!571305 (= l!1114 Nil!21478))))

(declare-fun res!681187 () Bool)

(assert (=> start!87914 (=> (not res!681187) (not e!571305))))

(declare-fun isStrictlySorted!598 (List!21481) Bool)

(assert (=> start!87914 (= res!681187 (isStrictlySorted!598 l!1114))))

(assert (=> start!87914 e!571305))

(assert (=> start!87914 e!571306))

(assert (=> start!87914 true))

(assert (=> start!87914 tp_is_empty!23553))

(assert (= (and start!87914 res!681187) b!1015545))

(assert (= (and b!1015545 res!681189) b!1015546))

(assert (= (and b!1015546 res!681188) b!1015547))

(get-info :version)

(assert (= (and start!87914 ((_ is Cons!21477) l!1114)) b!1015548))

(declare-fun m!937565 () Bool)

(assert (=> b!1015546 m!937565))

(declare-fun m!937567 () Bool)

(assert (=> b!1015545 m!937567))

(declare-fun m!937569 () Bool)

(assert (=> start!87914 m!937569))

(check-sat (not start!87914) (not b!1015546) (not b!1015548) tp_is_empty!23553 (not b!1015545))
(check-sat)
(get-model)

(declare-fun d!120985 () Bool)

(declare-fun res!681215 () Bool)

(declare-fun e!571329 () Bool)

(assert (=> d!120985 (=> res!681215 e!571329)))

(assert (=> d!120985 (= res!681215 (or ((_ is Nil!21478) l!1114) ((_ is Nil!21478) (t!30482 l!1114))))))

(assert (=> d!120985 (= (isStrictlySorted!598 l!1114) e!571329)))

(declare-fun b!1015585 () Bool)

(declare-fun e!571330 () Bool)

(assert (=> b!1015585 (= e!571329 e!571330)))

(declare-fun res!681216 () Bool)

(assert (=> b!1015585 (=> (not res!681216) (not e!571330))))

(assert (=> b!1015585 (= res!681216 (bvslt (_1!7611 (h!22675 l!1114)) (_1!7611 (h!22675 (t!30482 l!1114)))))))

(declare-fun b!1015586 () Bool)

(assert (=> b!1015586 (= e!571330 (isStrictlySorted!598 (t!30482 l!1114)))))

(assert (= (and d!120985 (not res!681215)) b!1015585))

(assert (= (and b!1015585 res!681216) b!1015586))

(declare-fun m!937585 () Bool)

(assert (=> b!1015586 m!937585))

(assert (=> start!87914 d!120985))

(declare-fun d!120991 () Bool)

(declare-fun res!681229 () Bool)

(declare-fun e!571343 () Bool)

(assert (=> d!120991 (=> res!681229 e!571343)))

(assert (=> d!120991 (= res!681229 ((_ is Nil!21477) keys!40))))

(assert (=> d!120991 (= (forall!260 keys!40 lambda!914) e!571343)))

(declare-fun b!1015599 () Bool)

(declare-fun e!571344 () Bool)

(assert (=> b!1015599 (= e!571343 e!571344)))

(declare-fun res!681230 () Bool)

(assert (=> b!1015599 (=> (not res!681230) (not e!571344))))

(declare-fun dynLambda!1903 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015599 (= res!681230 (dynLambda!1903 lambda!914 (h!22674 keys!40)))))

(declare-fun b!1015600 () Bool)

(assert (=> b!1015600 (= e!571344 (forall!260 (t!30481 keys!40) lambda!914))))

(assert (= (and d!120991 (not res!681229)) b!1015599))

(assert (= (and b!1015599 res!681230) b!1015600))

(declare-fun b_lambda!15431 () Bool)

(assert (=> (not b_lambda!15431) (not b!1015599)))

(declare-fun m!937587 () Bool)

(assert (=> b!1015599 m!937587))

(declare-fun m!937589 () Bool)

(assert (=> b!1015600 m!937589))

(assert (=> b!1015546 d!120991))

(declare-fun d!120997 () Bool)

(assert (=> d!120997 (= (isEmpty!857 l!1114) ((_ is Nil!21478) l!1114))))

(assert (=> b!1015545 d!120997))

(declare-fun b!1015617 () Bool)

(declare-fun e!571355 () Bool)

(declare-fun tp!70668 () Bool)

(assert (=> b!1015617 (= e!571355 (and tp_is_empty!23553 tp!70668))))

(assert (=> b!1015548 (= tp!70658 e!571355)))

(assert (= (and b!1015548 ((_ is Cons!21477) (t!30482 l!1114))) b!1015617))

(declare-fun b_lambda!15433 () Bool)

(assert (= b_lambda!15431 (or b!1015546 b_lambda!15433)))

(declare-fun bs!29450 () Bool)

(declare-fun d!120999 () Bool)

(assert (= bs!29450 (and d!120999 b!1015546)))

(declare-fun value!178 () B!1486)

(declare-datatypes ((Option!587 0))(
  ( (Some!586 (v!14437 B!1486)) (None!585) )
))
(declare-fun getValueByKey!536 (List!21481 (_ BitVec 64)) Option!587)

(assert (=> bs!29450 (= (dynLambda!1903 lambda!914 (h!22674 keys!40)) (= (getValueByKey!536 l!1114 (h!22674 keys!40)) (Some!586 value!178)))))

(declare-fun m!937595 () Bool)

(assert (=> bs!29450 m!937595))

(assert (=> b!1015599 d!120999))

(check-sat (not b!1015617) (not b!1015600) (not b!1015586) tp_is_empty!23553 (not bs!29450) (not b_lambda!15433))
(check-sat)
