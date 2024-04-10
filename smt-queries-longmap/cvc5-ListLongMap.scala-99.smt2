; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1614 () Bool)

(assert start!1614)

(declare-fun b_free!457 () Bool)

(declare-fun b_next!457 () Bool)

(assert (=> start!1614 (= b_free!457 (not b_next!457))))

(declare-fun tp!1937 () Bool)

(declare-fun b_and!837 () Bool)

(assert (=> start!1614 (= tp!1937 b_and!837)))

(declare-fun b!11683 () Bool)

(declare-fun e!6933 () Bool)

(declare-fun tp_is_empty!571 () Bool)

(declare-fun tp!1935 () Bool)

(assert (=> b!11683 (= e!6933 (and tp_is_empty!571 tp!1935))))

(declare-datatypes ((B!398 0))(
  ( (B!399 (val!294 Int)) )
))
(declare-datatypes ((tuple2!388 0))(
  ( (tuple2!389 (_1!194 (_ BitVec 64)) (_2!194 B!398)) )
))
(declare-datatypes ((List!346 0))(
  ( (Nil!343) (Cons!342 (h!908 tuple2!388) (t!2715 List!346)) )
))
(declare-fun kvs!4 () List!346)

(declare-datatypes ((ListLongMap!369 0))(
  ( (ListLongMap!370 (toList!200 List!346)) )
))
(declare-fun lm!227 () ListLongMap!369)

(declare-fun e!6934 () Bool)

(declare-fun p!216 () Int)

(declare-fun b!11684 () Bool)

(declare-fun forall!65 (List!346 Int) Bool)

(declare-fun ++!7 (ListLongMap!369 List!346) ListLongMap!369)

(assert (=> b!11684 (= e!6934 (not (forall!65 (toList!200 (++!7 lm!227 kvs!4)) p!216)))))

(declare-fun b!11685 () Bool)

(declare-fun res!9687 () Bool)

(assert (=> b!11685 (=> (not res!9687) (not e!6934))))

(assert (=> b!11685 (= res!9687 (forall!65 kvs!4 p!216))))

(declare-fun b!11686 () Bool)

(declare-fun res!9686 () Bool)

(assert (=> b!11686 (=> (not res!9686) (not e!6934))))

(declare-fun isEmpty!72 (List!346) Bool)

(assert (=> b!11686 (= res!9686 (isEmpty!72 kvs!4))))

(declare-fun b!11687 () Bool)

(declare-fun e!6935 () Bool)

(declare-fun tp!1936 () Bool)

(assert (=> b!11687 (= e!6935 tp!1936)))

(declare-fun res!9688 () Bool)

(assert (=> start!1614 (=> (not res!9688) (not e!6934))))

(assert (=> start!1614 (= res!9688 (forall!65 (toList!200 lm!227) p!216))))

(assert (=> start!1614 e!6934))

(declare-fun inv!574 (ListLongMap!369) Bool)

(assert (=> start!1614 (and (inv!574 lm!227) e!6935)))

(assert (=> start!1614 tp!1937))

(assert (=> start!1614 e!6933))

(assert (= (and start!1614 res!9688) b!11685))

(assert (= (and b!11685 res!9687) b!11686))

(assert (= (and b!11686 res!9686) b!11684))

(assert (= start!1614 b!11687))

(assert (= (and start!1614 (is-Cons!342 kvs!4)) b!11683))

(declare-fun m!8135 () Bool)

(assert (=> b!11684 m!8135))

(declare-fun m!8137 () Bool)

(assert (=> b!11684 m!8137))

(declare-fun m!8139 () Bool)

(assert (=> b!11685 m!8139))

(declare-fun m!8141 () Bool)

(assert (=> b!11686 m!8141))

(declare-fun m!8143 () Bool)

(assert (=> start!1614 m!8143))

(declare-fun m!8145 () Bool)

(assert (=> start!1614 m!8145))

(push 1)

(assert (not b!11686))

(assert (not b!11687))

(assert (not b!11684))

(assert (not start!1614))

(assert (not b!11683))

(assert (not b!11685))

(assert b_and!837)

(assert (not b_next!457))

(assert tp_is_empty!571)

(check-sat)

(pop 1)

(push 1)

(assert b_and!837)

(assert (not b_next!457))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1599 () Bool)

(declare-fun res!9719 () Bool)

(declare-fun e!6967 () Bool)

(assert (=> d!1599 (=> res!9719 e!6967)))

(assert (=> d!1599 (= res!9719 (is-Nil!343 kvs!4))))

(assert (=> d!1599 (= (forall!65 kvs!4 p!216) e!6967)))

(declare-fun b!11730 () Bool)

(declare-fun e!6969 () Bool)

(assert (=> b!11730 (= e!6967 e!6969)))

(declare-fun res!9722 () Bool)

(assert (=> b!11730 (=> (not res!9722) (not e!6969))))

(declare-fun dynLambda!76 (Int tuple2!388) Bool)

(assert (=> b!11730 (= res!9722 (dynLambda!76 p!216 (h!908 kvs!4)))))

(declare-fun b!11731 () Bool)

(assert (=> b!11731 (= e!6969 (forall!65 (t!2715 kvs!4) p!216))))

(assert (= (and d!1599 (not res!9719)) b!11730))

(assert (= (and b!11730 res!9722) b!11731))

(declare-fun b_lambda!805 () Bool)

(assert (=> (not b_lambda!805) (not b!11730)))

(declare-fun t!2721 () Bool)

(declare-fun tb!371 () Bool)

(assert (=> (and start!1614 (= p!216 p!216) t!2721) tb!371))

(declare-fun result!551 () Bool)

(assert (=> tb!371 (= result!551 true)))

(assert (=> b!11730 t!2721))

(declare-fun b_and!845 () Bool)

(assert (= b_and!837 (and (=> t!2721 result!551) b_and!845)))

(declare-fun m!8173 () Bool)

(assert (=> b!11730 m!8173))

(declare-fun m!8177 () Bool)

(assert (=> b!11731 m!8177))

(assert (=> b!11685 d!1599))

(declare-fun d!1607 () Bool)

(declare-fun res!9723 () Bool)

(declare-fun e!6970 () Bool)

(assert (=> d!1607 (=> res!9723 e!6970)))

(assert (=> d!1607 (= res!9723 (is-Nil!343 (toList!200 lm!227)))))

(assert (=> d!1607 (= (forall!65 (toList!200 lm!227) p!216) e!6970)))

(declare-fun b!11734 () Bool)

(declare-fun e!6971 () Bool)

(assert (=> b!11734 (= e!6970 e!6971)))

(declare-fun res!9724 () Bool)

(assert (=> b!11734 (=> (not res!9724) (not e!6971))))

(assert (=> b!11734 (= res!9724 (dynLambda!76 p!216 (h!908 (toList!200 lm!227))))))

(declare-fun b!11735 () Bool)

(assert (=> b!11735 (= e!6971 (forall!65 (t!2715 (toList!200 lm!227)) p!216))))

(assert (= (and d!1607 (not res!9723)) b!11734))

(assert (= (and b!11734 res!9724) b!11735))

(declare-fun b_lambda!807 () Bool)

(assert (=> (not b_lambda!807) (not b!11734)))

(declare-fun t!2723 () Bool)

(declare-fun tb!373 () Bool)

(assert (=> (and start!1614 (= p!216 p!216) t!2723) tb!373))

(declare-fun result!553 () Bool)

(assert (=> tb!373 (= result!553 true)))

(assert (=> b!11734 t!2723))

(declare-fun b_and!847 () Bool)

(assert (= b_and!845 (and (=> t!2723 result!553) b_and!847)))

(declare-fun m!8179 () Bool)

(assert (=> b!11734 m!8179))

(declare-fun m!8181 () Bool)

(assert (=> b!11735 m!8181))

(assert (=> start!1614 d!1607))

(declare-fun d!1609 () Bool)

(declare-fun isStrictlySorted!50 (List!346) Bool)

(assert (=> d!1609 (= (inv!574 lm!227) (isStrictlySorted!50 (toList!200 lm!227)))))

(declare-fun bs!445 () Bool)

(assert (= bs!445 d!1609))

(declare-fun m!8189 () Bool)

(assert (=> bs!445 m!8189))

(assert (=> start!1614 d!1609))

(declare-fun d!1617 () Bool)

(assert (=> d!1617 (= (isEmpty!72 kvs!4) (is-Nil!343 kvs!4))))

(assert (=> b!11686 d!1617))

(declare-fun d!1623 () Bool)

(declare-fun res!9733 () Bool)

(declare-fun e!6980 () Bool)

(assert (=> d!1623 (=> res!9733 e!6980)))

(assert (=> d!1623 (= res!9733 (is-Nil!343 (toList!200 (++!7 lm!227 kvs!4))))))

(assert (=> d!1623 (= (forall!65 (toList!200 (++!7 lm!227 kvs!4)) p!216) e!6980)))

(declare-fun b!11744 () Bool)

(declare-fun e!6981 () Bool)

(assert (=> b!11744 (= e!6980 e!6981)))

(declare-fun res!9734 () Bool)

(assert (=> b!11744 (=> (not res!9734) (not e!6981))))

(assert (=> b!11744 (= res!9734 (dynLambda!76 p!216 (h!908 (toList!200 (++!7 lm!227 kvs!4)))))))

(declare-fun b!11745 () Bool)

(assert (=> b!11745 (= e!6981 (forall!65 (t!2715 (toList!200 (++!7 lm!227 kvs!4))) p!216))))

(assert (= (and d!1623 (not res!9733)) b!11744))

(assert (= (and b!11744 res!9734) b!11745))

(declare-fun b_lambda!817 () Bool)

(assert (=> (not b_lambda!817) (not b!11744)))

(declare-fun t!2733 () Bool)

(declare-fun tb!383 () Bool)

(assert (=> (and start!1614 (= p!216 p!216) t!2733) tb!383))

(declare-fun result!563 () Bool)

(assert (=> tb!383 (= result!563 true)))

(assert (=> b!11744 t!2733))

(declare-fun b_and!857 () Bool)

(assert (= b_and!847 (and (=> t!2733 result!563) b_and!857)))

(declare-fun m!8205 () Bool)

(assert (=> b!11744 m!8205))

(declare-fun m!8207 () Bool)

(assert (=> b!11745 m!8207))

(assert (=> b!11684 d!1623))

(declare-fun d!1629 () Bool)

(declare-fun c!986 () Bool)

(assert (=> d!1629 (= c!986 (is-Nil!343 kvs!4))))

(declare-fun e!6990 () ListLongMap!369)

(assert (=> d!1629 (= (++!7 lm!227 kvs!4) e!6990)))

(declare-fun b!11762 () Bool)

(assert (=> b!11762 (= e!6990 lm!227)))

(declare-fun b!11763 () Bool)

(declare-fun +!33 (ListLongMap!369 tuple2!388) ListLongMap!369)

(assert (=> b!11763 (= e!6990 (++!7 (+!33 lm!227 (h!908 kvs!4)) (t!2715 kvs!4)))))

(assert (= (and d!1629 c!986) b!11762))

(assert (= (and d!1629 (not c!986)) b!11763))

(declare-fun m!8217 () Bool)

(assert (=> b!11763 m!8217))

(assert (=> b!11763 m!8217))

(declare-fun m!8219 () Bool)

(assert (=> b!11763 m!8219))

(assert (=> b!11684 d!1629))

(declare-fun b!11779 () Bool)

(declare-fun e!7000 () Bool)

(declare-fun tp!1963 () Bool)

(assert (=> b!11779 (= e!7000 (and tp_is_empty!571 tp!1963))))

(assert (=> b!11683 (= tp!1935 e!7000)))

(assert (= (and b!11683 (is-Cons!342 (t!2715 kvs!4))) b!11779))

(declare-fun b!11781 () Bool)

(declare-fun e!7002 () Bool)

(declare-fun tp!1965 () Bool)

(assert (=> b!11781 (= e!7002 (and tp_is_empty!571 tp!1965))))

(assert (=> b!11687 (= tp!1936 e!7002)))

(assert (= (and b!11687 (is-Cons!342 (toList!200 lm!227))) b!11781))

(declare-fun b_lambda!827 () Bool)

(assert (= b_lambda!805 (or (and start!1614 b_free!457) b_lambda!827)))

(declare-fun b_lambda!829 () Bool)

(assert (= b_lambda!817 (or (and start!1614 b_free!457) b_lambda!829)))

(declare-fun b_lambda!831 () Bool)

(assert (= b_lambda!807 (or (and start!1614 b_free!457) b_lambda!831)))

(push 1)

