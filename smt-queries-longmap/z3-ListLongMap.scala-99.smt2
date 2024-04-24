; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1614 () Bool)

(assert start!1614)

(declare-fun b_free!457 () Bool)

(declare-fun b_next!457 () Bool)

(assert (=> start!1614 (= b_free!457 (not b_next!457))))

(declare-fun tp!1937 () Bool)

(declare-fun b_and!837 () Bool)

(assert (=> start!1614 (= tp!1937 b_and!837)))

(declare-fun b!11683 () Bool)

(declare-fun res!9687 () Bool)

(declare-fun e!6934 () Bool)

(assert (=> b!11683 (=> (not res!9687) (not e!6934))))

(declare-datatypes ((B!398 0))(
  ( (B!399 (val!294 Int)) )
))
(declare-datatypes ((tuple2!384 0))(
  ( (tuple2!385 (_1!192 (_ BitVec 64)) (_2!192 B!398)) )
))
(declare-datatypes ((List!342 0))(
  ( (Nil!339) (Cons!338 (h!904 tuple2!384) (t!2711 List!342)) )
))
(declare-fun kvs!4 () List!342)

(declare-fun p!216 () Int)

(declare-fun forall!65 (List!342 Int) Bool)

(assert (=> b!11683 (= res!9687 (forall!65 kvs!4 p!216))))

(declare-fun b!11684 () Bool)

(declare-fun res!9686 () Bool)

(assert (=> b!11684 (=> (not res!9686) (not e!6934))))

(declare-fun isEmpty!72 (List!342) Bool)

(assert (=> b!11684 (= res!9686 (isEmpty!72 kvs!4))))

(declare-fun b!11685 () Bool)

(declare-fun e!6933 () Bool)

(declare-fun tp!1935 () Bool)

(assert (=> b!11685 (= e!6933 tp!1935)))

(declare-datatypes ((ListLongMap!365 0))(
  ( (ListLongMap!366 (toList!198 List!342)) )
))
(declare-fun lm!227 () ListLongMap!365)

(declare-fun b!11686 () Bool)

(declare-fun ++!7 (ListLongMap!365 List!342) ListLongMap!365)

(assert (=> b!11686 (= e!6934 (not (forall!65 (toList!198 (++!7 lm!227 kvs!4)) p!216)))))

(declare-fun res!9688 () Bool)

(assert (=> start!1614 (=> (not res!9688) (not e!6934))))

(assert (=> start!1614 (= res!9688 (forall!65 (toList!198 lm!227) p!216))))

(assert (=> start!1614 e!6934))

(declare-fun inv!574 (ListLongMap!365) Bool)

(assert (=> start!1614 (and (inv!574 lm!227) e!6933)))

(assert (=> start!1614 tp!1937))

(declare-fun e!6935 () Bool)

(assert (=> start!1614 e!6935))

(declare-fun b!11687 () Bool)

(declare-fun tp_is_empty!571 () Bool)

(declare-fun tp!1936 () Bool)

(assert (=> b!11687 (= e!6935 (and tp_is_empty!571 tp!1936))))

(assert (= (and start!1614 res!9688) b!11683))

(assert (= (and b!11683 res!9687) b!11684))

(assert (= (and b!11684 res!9686) b!11686))

(assert (= start!1614 b!11685))

(get-info :version)

(assert (= (and start!1614 ((_ is Cons!338) kvs!4)) b!11687))

(declare-fun m!8131 () Bool)

(assert (=> b!11683 m!8131))

(declare-fun m!8133 () Bool)

(assert (=> b!11684 m!8133))

(declare-fun m!8135 () Bool)

(assert (=> b!11686 m!8135))

(declare-fun m!8137 () Bool)

(assert (=> b!11686 m!8137))

(declare-fun m!8139 () Bool)

(assert (=> start!1614 m!8139))

(declare-fun m!8141 () Bool)

(assert (=> start!1614 m!8141))

(check-sat (not start!1614) tp_is_empty!571 (not b!11684) (not b!11686) (not b!11683) (not b_next!457) b_and!837 (not b!11685) (not b!11687))
(check-sat b_and!837 (not b_next!457))
(get-model)

(declare-fun d!1597 () Bool)

(assert (=> d!1597 (= (isEmpty!72 kvs!4) ((_ is Nil!339) kvs!4))))

(assert (=> b!11684 d!1597))

(declare-fun d!1599 () Bool)

(declare-fun res!9711 () Bool)

(declare-fun e!6958 () Bool)

(assert (=> d!1599 (=> res!9711 e!6958)))

(assert (=> d!1599 (= res!9711 ((_ is Nil!339) kvs!4))))

(assert (=> d!1599 (= (forall!65 kvs!4 p!216) e!6958)))

(declare-fun b!11722 () Bool)

(declare-fun e!6959 () Bool)

(assert (=> b!11722 (= e!6958 e!6959)))

(declare-fun res!9712 () Bool)

(assert (=> b!11722 (=> (not res!9712) (not e!6959))))

(declare-fun dynLambda!76 (Int tuple2!384) Bool)

(assert (=> b!11722 (= res!9712 (dynLambda!76 p!216 (h!904 kvs!4)))))

(declare-fun b!11723 () Bool)

(assert (=> b!11723 (= e!6959 (forall!65 (t!2711 kvs!4) p!216))))

(assert (= (and d!1599 (not res!9711)) b!11722))

(assert (= (and b!11722 res!9712) b!11723))

(declare-fun b_lambda!803 () Bool)

(assert (=> (not b_lambda!803) (not b!11722)))

(declare-fun t!2715 () Bool)

(declare-fun tb!369 () Bool)

(assert (=> (and start!1614 (= p!216 p!216) t!2715) tb!369))

(declare-fun result!549 () Bool)

(assert (=> tb!369 (= result!549 true)))

(assert (=> b!11722 t!2715))

(declare-fun b_and!843 () Bool)

(assert (= b_and!837 (and (=> t!2715 result!549) b_and!843)))

(declare-fun m!8167 () Bool)

(assert (=> b!11722 m!8167))

(declare-fun m!8169 () Bool)

(assert (=> b!11723 m!8169))

(assert (=> b!11683 d!1599))

(declare-fun d!1601 () Bool)

(declare-fun res!9713 () Bool)

(declare-fun e!6960 () Bool)

(assert (=> d!1601 (=> res!9713 e!6960)))

(assert (=> d!1601 (= res!9713 ((_ is Nil!339) (toList!198 (++!7 lm!227 kvs!4))))))

(assert (=> d!1601 (= (forall!65 (toList!198 (++!7 lm!227 kvs!4)) p!216) e!6960)))

(declare-fun b!11724 () Bool)

(declare-fun e!6961 () Bool)

(assert (=> b!11724 (= e!6960 e!6961)))

(declare-fun res!9714 () Bool)

(assert (=> b!11724 (=> (not res!9714) (not e!6961))))

(assert (=> b!11724 (= res!9714 (dynLambda!76 p!216 (h!904 (toList!198 (++!7 lm!227 kvs!4)))))))

(declare-fun b!11725 () Bool)

(assert (=> b!11725 (= e!6961 (forall!65 (t!2711 (toList!198 (++!7 lm!227 kvs!4))) p!216))))

(assert (= (and d!1601 (not res!9713)) b!11724))

(assert (= (and b!11724 res!9714) b!11725))

(declare-fun b_lambda!805 () Bool)

(assert (=> (not b_lambda!805) (not b!11724)))

(declare-fun t!2717 () Bool)

(declare-fun tb!371 () Bool)

(assert (=> (and start!1614 (= p!216 p!216) t!2717) tb!371))

(declare-fun result!551 () Bool)

(assert (=> tb!371 (= result!551 true)))

(assert (=> b!11724 t!2717))

(declare-fun b_and!845 () Bool)

(assert (= b_and!843 (and (=> t!2717 result!551) b_and!845)))

(declare-fun m!8171 () Bool)

(assert (=> b!11724 m!8171))

(declare-fun m!8173 () Bool)

(assert (=> b!11725 m!8173))

(assert (=> b!11686 d!1601))

(declare-fun d!1607 () Bool)

(declare-fun c!980 () Bool)

(assert (=> d!1607 (= c!980 ((_ is Nil!339) kvs!4))))

(declare-fun e!6972 () ListLongMap!365)

(assert (=> d!1607 (= (++!7 lm!227 kvs!4) e!6972)))

(declare-fun b!11738 () Bool)

(assert (=> b!11738 (= e!6972 lm!227)))

(declare-fun b!11739 () Bool)

(declare-fun +!32 (ListLongMap!365 tuple2!384) ListLongMap!365)

(assert (=> b!11739 (= e!6972 (++!7 (+!32 lm!227 (h!904 kvs!4)) (t!2711 kvs!4)))))

(assert (= (and d!1607 c!980) b!11738))

(assert (= (and d!1607 (not c!980)) b!11739))

(declare-fun m!8175 () Bool)

(assert (=> b!11739 m!8175))

(assert (=> b!11739 m!8175))

(declare-fun m!8177 () Bool)

(assert (=> b!11739 m!8177))

(assert (=> b!11686 d!1607))

(declare-fun d!1609 () Bool)

(declare-fun res!9727 () Bool)

(declare-fun e!6977 () Bool)

(assert (=> d!1609 (=> res!9727 e!6977)))

(assert (=> d!1609 (= res!9727 ((_ is Nil!339) (toList!198 lm!227)))))

(assert (=> d!1609 (= (forall!65 (toList!198 lm!227) p!216) e!6977)))

(declare-fun b!11744 () Bool)

(declare-fun e!6978 () Bool)

(assert (=> b!11744 (= e!6977 e!6978)))

(declare-fun res!9728 () Bool)

(assert (=> b!11744 (=> (not res!9728) (not e!6978))))

(assert (=> b!11744 (= res!9728 (dynLambda!76 p!216 (h!904 (toList!198 lm!227))))))

(declare-fun b!11745 () Bool)

(assert (=> b!11745 (= e!6978 (forall!65 (t!2711 (toList!198 lm!227)) p!216))))

(assert (= (and d!1609 (not res!9727)) b!11744))

(assert (= (and b!11744 res!9728) b!11745))

(declare-fun b_lambda!811 () Bool)

(assert (=> (not b_lambda!811) (not b!11744)))

(declare-fun t!2723 () Bool)

(declare-fun tb!377 () Bool)

(assert (=> (and start!1614 (= p!216 p!216) t!2723) tb!377))

(declare-fun result!557 () Bool)

(assert (=> tb!377 (= result!557 true)))

(assert (=> b!11744 t!2723))

(declare-fun b_and!851 () Bool)

(assert (= b_and!845 (and (=> t!2723 result!557) b_and!851)))

(declare-fun m!8183 () Bool)

(assert (=> b!11744 m!8183))

(declare-fun m!8189 () Bool)

(assert (=> b!11745 m!8189))

(assert (=> start!1614 d!1609))

(declare-fun d!1615 () Bool)

(declare-fun isStrictlySorted!42 (List!342) Bool)

(assert (=> d!1615 (= (inv!574 lm!227) (isStrictlySorted!42 (toList!198 lm!227)))))

(declare-fun bs!444 () Bool)

(assert (= bs!444 d!1615))

(declare-fun m!8191 () Bool)

(assert (=> bs!444 m!8191))

(assert (=> start!1614 d!1615))

(declare-fun b!11750 () Bool)

(declare-fun e!6981 () Bool)

(declare-fun tp!1958 () Bool)

(assert (=> b!11750 (= e!6981 (and tp_is_empty!571 tp!1958))))

(assert (=> b!11687 (= tp!1936 e!6981)))

(assert (= (and b!11687 ((_ is Cons!338) (t!2711 kvs!4))) b!11750))

(declare-fun b!11751 () Bool)

(declare-fun e!6982 () Bool)

(declare-fun tp!1959 () Bool)

(assert (=> b!11751 (= e!6982 (and tp_is_empty!571 tp!1959))))

(assert (=> b!11685 (= tp!1935 e!6982)))

(assert (= (and b!11685 ((_ is Cons!338) (toList!198 lm!227))) b!11751))

(declare-fun b_lambda!813 () Bool)

(assert (= b_lambda!805 (or (and start!1614 b_free!457) b_lambda!813)))

(declare-fun b_lambda!815 () Bool)

(assert (= b_lambda!811 (or (and start!1614 b_free!457) b_lambda!815)))

(declare-fun b_lambda!817 () Bool)

(assert (= b_lambda!803 (or (and start!1614 b_free!457) b_lambda!817)))

(check-sat (not b!11723) (not b!11751) tp_is_empty!571 (not b_next!457) (not b_lambda!813) (not b!11725) (not b_lambda!817) b_and!851 (not b!11739) (not b!11750) (not b_lambda!815) (not d!1615) (not b!11745))
(check-sat b_and!851 (not b_next!457))
