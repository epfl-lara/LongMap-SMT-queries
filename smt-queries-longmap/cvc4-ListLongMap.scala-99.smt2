; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1618 () Bool)

(assert start!1618)

(declare-fun b_free!461 () Bool)

(declare-fun b_next!461 () Bool)

(assert (=> start!1618 (= b_free!461 (not b_next!461))))

(declare-fun tp!1953 () Bool)

(declare-fun b_and!841 () Bool)

(assert (=> start!1618 (= tp!1953 b_and!841)))

(declare-datatypes ((B!402 0))(
  ( (B!403 (val!296 Int)) )
))
(declare-datatypes ((tuple2!392 0))(
  ( (tuple2!393 (_1!196 (_ BitVec 64)) (_2!196 B!402)) )
))
(declare-datatypes ((List!348 0))(
  ( (Nil!345) (Cons!344 (h!910 tuple2!392) (t!2717 List!348)) )
))
(declare-fun kvs!4 () List!348)

(declare-datatypes ((ListLongMap!373 0))(
  ( (ListLongMap!374 (toList!202 List!348)) )
))
(declare-fun lm!227 () ListLongMap!373)

(declare-fun p!216 () Int)

(declare-fun b!11713 () Bool)

(declare-fun e!6951 () Bool)

(declare-fun forall!67 (List!348 Int) Bool)

(declare-fun ++!9 (ListLongMap!373 List!348) ListLongMap!373)

(assert (=> b!11713 (= e!6951 (not (forall!67 (toList!202 (++!9 lm!227 kvs!4)) p!216)))))

(declare-fun b!11714 () Bool)

(declare-fun res!9704 () Bool)

(assert (=> b!11714 (=> (not res!9704) (not e!6951))))

(assert (=> b!11714 (= res!9704 (forall!67 kvs!4 p!216))))

(declare-fun b!11715 () Bool)

(declare-fun e!6952 () Bool)

(declare-fun tp!1955 () Bool)

(assert (=> b!11715 (= e!6952 tp!1955)))

(declare-fun res!9705 () Bool)

(assert (=> start!1618 (=> (not res!9705) (not e!6951))))

(assert (=> start!1618 (= res!9705 (forall!67 (toList!202 lm!227) p!216))))

(assert (=> start!1618 e!6951))

(declare-fun inv!576 (ListLongMap!373) Bool)

(assert (=> start!1618 (and (inv!576 lm!227) e!6952)))

(assert (=> start!1618 tp!1953))

(declare-fun e!6953 () Bool)

(assert (=> start!1618 e!6953))

(declare-fun b!11716 () Bool)

(declare-fun tp_is_empty!575 () Bool)

(declare-fun tp!1954 () Bool)

(assert (=> b!11716 (= e!6953 (and tp_is_empty!575 tp!1954))))

(declare-fun b!11717 () Bool)

(declare-fun res!9706 () Bool)

(assert (=> b!11717 (=> (not res!9706) (not e!6951))))

(declare-fun isEmpty!74 (List!348) Bool)

(assert (=> b!11717 (= res!9706 (isEmpty!74 kvs!4))))

(assert (= (and start!1618 res!9705) b!11714))

(assert (= (and b!11714 res!9704) b!11717))

(assert (= (and b!11717 res!9706) b!11713))

(assert (= start!1618 b!11715))

(assert (= (and start!1618 (is-Cons!344 kvs!4)) b!11716))

(declare-fun m!8159 () Bool)

(assert (=> b!11713 m!8159))

(declare-fun m!8161 () Bool)

(assert (=> b!11713 m!8161))

(declare-fun m!8163 () Bool)

(assert (=> b!11714 m!8163))

(declare-fun m!8165 () Bool)

(assert (=> start!1618 m!8165))

(declare-fun m!8167 () Bool)

(assert (=> start!1618 m!8167))

(declare-fun m!8169 () Bool)

(assert (=> b!11717 m!8169))

(push 1)

(assert (not b!11716))

(assert (not b!11713))

(assert (not b!11715))

(assert (not b!11714))

(assert b_and!841)

(assert (not b_next!461))

(assert (not start!1618))

(assert tp_is_empty!575)

(assert (not b!11717))

(check-sat)

(pop 1)

(push 1)

(assert b_and!841)

(assert (not b_next!461))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1597 () Bool)

(declare-fun res!9717 () Bool)

(declare-fun e!6964 () Bool)

(assert (=> d!1597 (=> res!9717 e!6964)))

(assert (=> d!1597 (= res!9717 (is-Nil!345 (toList!202 lm!227)))))

(assert (=> d!1597 (= (forall!67 (toList!202 lm!227) p!216) e!6964)))

(declare-fun b!11728 () Bool)

(declare-fun e!6965 () Bool)

(assert (=> b!11728 (= e!6964 e!6965)))

(declare-fun res!9718 () Bool)

(assert (=> b!11728 (=> (not res!9718) (not e!6965))))

(declare-fun dynLambda!77 (Int tuple2!392) Bool)

(assert (=> b!11728 (= res!9718 (dynLambda!77 p!216 (h!910 (toList!202 lm!227))))))

(declare-fun b!11729 () Bool)

(assert (=> b!11729 (= e!6965 (forall!67 (t!2717 (toList!202 lm!227)) p!216))))

(assert (= (and d!1597 (not res!9717)) b!11728))

(assert (= (and b!11728 res!9718) b!11729))

(declare-fun b_lambda!804 () Bool)

(assert (=> (not b_lambda!804) (not b!11728)))

(declare-fun t!2720 () Bool)

(declare-fun tb!369 () Bool)

(assert (=> (and start!1618 (= p!216 p!216) t!2720) tb!369))

(declare-fun result!550 () Bool)

(assert (=> tb!369 (= result!550 true)))

(assert (=> b!11728 t!2720))

(declare-fun b_and!844 () Bool)

(assert (= b_and!841 (and (=> t!2720 result!550) b_and!844)))

(declare-fun m!8171 () Bool)

(assert (=> b!11728 m!8171))

(declare-fun m!8175 () Bool)

(assert (=> b!11729 m!8175))

(assert (=> start!1618 d!1597))

(declare-fun d!1605 () Bool)

(declare-fun isStrictlySorted!49 (List!348) Bool)

(assert (=> d!1605 (= (inv!576 lm!227) (isStrictlySorted!49 (toList!202 lm!227)))))

(declare-fun bs!444 () Bool)

(assert (= bs!444 d!1605))

(declare-fun m!8187 () Bool)

(assert (=> bs!444 m!8187))

(assert (=> start!1618 d!1605))

(declare-fun d!1613 () Bool)

(assert (=> d!1613 (= (isEmpty!74 kvs!4) (is-Nil!345 kvs!4))))

(assert (=> b!11717 d!1613))

(declare-fun d!1615 () Bool)

(declare-fun res!9727 () Bool)

(declare-fun e!6974 () Bool)

(assert (=> d!1615 (=> res!9727 e!6974)))

(assert (=> d!1615 (= res!9727 (is-Nil!345 kvs!4))))

(assert (=> d!1615 (= (forall!67 kvs!4 p!216) e!6974)))

(declare-fun b!11738 () Bool)

(declare-fun e!6975 () Bool)

(assert (=> b!11738 (= e!6974 e!6975)))

(declare-fun res!9728 () Bool)

(assert (=> b!11738 (=> (not res!9728) (not e!6975))))

(assert (=> b!11738 (= res!9728 (dynLambda!77 p!216 (h!910 kvs!4)))))

(declare-fun b!11739 () Bool)

(assert (=> b!11739 (= e!6975 (forall!67 (t!2717 kvs!4) p!216))))

(assert (= (and d!1615 (not res!9727)) b!11738))

(assert (= (and b!11738 res!9728) b!11739))

(declare-fun b_lambda!811 () Bool)

(assert (=> (not b_lambda!811) (not b!11738)))

(declare-fun t!2727 () Bool)

(declare-fun tb!377 () Bool)

(assert (=> (and start!1618 (= p!216 p!216) t!2727) tb!377))

(declare-fun result!557 () Bool)

(assert (=> tb!377 (= result!557 true)))

(assert (=> b!11738 t!2727))

(declare-fun b_and!851 () Bool)

(assert (= b_and!844 (and (=> t!2727 result!557) b_and!851)))

(declare-fun m!8193 () Bool)

(assert (=> b!11738 m!8193))

(declare-fun m!8195 () Bool)

(assert (=> b!11739 m!8195))

(assert (=> b!11714 d!1615))

(declare-fun d!1621 () Bool)

(declare-fun res!9731 () Bool)

(declare-fun e!6978 () Bool)

(assert (=> d!1621 (=> res!9731 e!6978)))

(assert (=> d!1621 (= res!9731 (is-Nil!345 (toList!202 (++!9 lm!227 kvs!4))))))

(assert (=> d!1621 (= (forall!67 (toList!202 (++!9 lm!227 kvs!4)) p!216) e!6978)))

(declare-fun b!11742 () Bool)

(declare-fun e!6979 () Bool)

(assert (=> b!11742 (= e!6978 e!6979)))

(declare-fun res!9732 () Bool)

(assert (=> b!11742 (=> (not res!9732) (not e!6979))))

(assert (=> b!11742 (= res!9732 (dynLambda!77 p!216 (h!910 (toList!202 (++!9 lm!227 kvs!4)))))))

(declare-fun b!11743 () Bool)

(assert (=> b!11743 (= e!6979 (forall!67 (t!2717 (toList!202 (++!9 lm!227 kvs!4))) p!216))))

(assert (= (and d!1621 (not res!9731)) b!11742))

(assert (= (and b!11742 res!9732) b!11743))

(declare-fun b_lambda!815 () Bool)

(assert (=> (not b_lambda!815) (not b!11742)))

(declare-fun t!2731 () Bool)

(declare-fun tb!381 () Bool)

(assert (=> (and start!1618 (= p!216 p!216) t!2731) tb!381))

(declare-fun result!561 () Bool)

(assert (=> tb!381 (= result!561 true)))

(assert (=> b!11742 t!2731))

(declare-fun b_and!855 () Bool)

(assert (= b_and!851 (and (=> t!2731 result!561) b_and!855)))

(declare-fun m!8201 () Bool)

(assert (=> b!11742 m!8201))

(declare-fun m!8203 () Bool)

(assert (=> b!11743 m!8203))

(assert (=> b!11713 d!1621))

(declare-fun d!1627 () Bool)

(declare-fun c!985 () Bool)

(assert (=> d!1627 (= c!985 (is-Nil!345 kvs!4))))

(declare-fun e!6989 () ListLongMap!373)

(assert (=> d!1627 (= (++!9 lm!227 kvs!4) e!6989)))

(declare-fun b!11760 () Bool)

(assert (=> b!11760 (= e!6989 lm!227)))

(declare-fun b!11761 () Bool)

(declare-fun +!34 (ListLongMap!373 tuple2!392) ListLongMap!373)

(assert (=> b!11761 (= e!6989 (++!9 (+!34 lm!227 (h!910 kvs!4)) (t!2717 kvs!4)))))

(assert (= (and d!1627 c!985) b!11760))

(assert (= (and d!1627 (not c!985)) b!11761))

(declare-fun m!8213 () Bool)

(assert (=> b!11761 m!8213))

(assert (=> b!11761 m!8213))

(declare-fun m!8215 () Bool)

(assert (=> b!11761 m!8215))

(assert (=> b!11713 d!1627))

(declare-fun b!11778 () Bool)

(declare-fun e!6999 () Bool)

(declare-fun tp!1960 () Bool)

(assert (=> b!11778 (= e!6999 (and tp_is_empty!575 tp!1960))))

(assert (=> b!11716 (= tp!1954 e!6999)))

(assert (= (and b!11716 (is-Cons!344 (t!2717 kvs!4))) b!11778))

(declare-fun b!11780 () Bool)

(declare-fun e!7001 () Bool)

(declare-fun tp!1964 () Bool)

(assert (=> b!11780 (= e!7001 (and tp_is_empty!575 tp!1964))))

(assert (=> b!11715 (= tp!1955 e!7001)))

(assert (= (and b!11715 (is-Cons!344 (toList!202 lm!227))) b!11780))

