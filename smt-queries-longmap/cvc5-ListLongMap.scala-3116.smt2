; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43788 () Bool)

(assert start!43788)

(declare-fun res!288362 () Bool)

(declare-fun e!284865 () Bool)

(assert (=> start!43788 (=> (not res!288362) (not e!284865))))

(declare-datatypes ((B!1118 0))(
  ( (B!1119 (val!7011 Int)) )
))
(declare-datatypes ((tuple2!9224 0))(
  ( (tuple2!9225 (_1!4623 (_ BitVec 64)) (_2!4623 B!1118)) )
))
(declare-datatypes ((List!9275 0))(
  ( (Nil!9272) (Cons!9271 (h!10127 tuple2!9224) (t!15497 List!9275)) )
))
(declare-fun l!956 () List!9275)

(declare-fun isStrictlySorted!414 (List!9275) Bool)

(assert (=> start!43788 (= res!288362 (isStrictlySorted!414 l!956))))

(assert (=> start!43788 e!284865))

(declare-fun e!284864 () Bool)

(assert (=> start!43788 e!284864))

(assert (=> start!43788 true))

(declare-fun b!483972 () Bool)

(declare-fun res!288361 () Bool)

(assert (=> b!483972 (=> (not res!288361) (not e!284865))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!377 (List!9275 (_ BitVec 64)) Bool)

(assert (=> b!483972 (= res!288361 (not (containsKey!377 l!956 key!251)))))

(declare-fun b!483973 () Bool)

(declare-fun ListPrimitiveSize!61 (List!9275) Int)

(assert (=> b!483973 (= e!284865 (< (ListPrimitiveSize!61 l!956) 0))))

(declare-fun b!483974 () Bool)

(declare-fun tp_is_empty!13927 () Bool)

(declare-fun tp!43480 () Bool)

(assert (=> b!483974 (= e!284864 (and tp_is_empty!13927 tp!43480))))

(assert (= (and start!43788 res!288362) b!483972))

(assert (= (and b!483972 res!288361) b!483973))

(assert (= (and start!43788 (is-Cons!9271 l!956)) b!483974))

(declare-fun m!464841 () Bool)

(assert (=> start!43788 m!464841))

(declare-fun m!464843 () Bool)

(assert (=> b!483972 m!464843))

(declare-fun m!464845 () Bool)

(assert (=> b!483973 m!464845))

(push 1)

(assert (not b!483972))

(assert (not b!483974))

(assert tp_is_empty!13927)

(assert (not b!483973))

(assert (not start!43788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77027 () Bool)

(declare-fun res!288391 () Bool)

(declare-fun e!284894 () Bool)

(assert (=> d!77027 (=> res!288391 e!284894)))

(assert (=> d!77027 (= res!288391 (and (is-Cons!9271 l!956) (= (_1!4623 (h!10127 l!956)) key!251)))))

(assert (=> d!77027 (= (containsKey!377 l!956 key!251) e!284894)))

(declare-fun b!484009 () Bool)

(declare-fun e!284895 () Bool)

(assert (=> b!484009 (= e!284894 e!284895)))

(declare-fun res!288392 () Bool)

(assert (=> b!484009 (=> (not res!288392) (not e!284895))))

(assert (=> b!484009 (= res!288392 (and (or (not (is-Cons!9271 l!956)) (bvsle (_1!4623 (h!10127 l!956)) key!251)) (is-Cons!9271 l!956) (bvslt (_1!4623 (h!10127 l!956)) key!251)))))

(declare-fun b!484010 () Bool)

(assert (=> b!484010 (= e!284895 (containsKey!377 (t!15497 l!956) key!251))))

(assert (= (and d!77027 (not res!288391)) b!484009))

(assert (= (and b!484009 res!288392) b!484010))

(declare-fun m!464863 () Bool)

(assert (=> b!484010 m!464863))

(assert (=> b!483972 d!77027))

(declare-fun d!77035 () Bool)

(declare-fun res!288401 () Bool)

(declare-fun e!284907 () Bool)

(assert (=> d!77035 (=> res!288401 e!284907)))

(assert (=> d!77035 (= res!288401 (or (is-Nil!9272 l!956) (is-Nil!9272 (t!15497 l!956))))))

(assert (=> d!77035 (= (isStrictlySorted!414 l!956) e!284907)))

(declare-fun b!484025 () Bool)

(declare-fun e!284908 () Bool)

(assert (=> b!484025 (= e!284907 e!284908)))

(declare-fun res!288402 () Bool)

(assert (=> b!484025 (=> (not res!288402) (not e!284908))))

(assert (=> b!484025 (= res!288402 (bvslt (_1!4623 (h!10127 l!956)) (_1!4623 (h!10127 (t!15497 l!956)))))))

(declare-fun b!484026 () Bool)

(assert (=> b!484026 (= e!284908 (isStrictlySorted!414 (t!15497 l!956)))))

(assert (= (and d!77035 (not res!288401)) b!484025))

(assert (= (and b!484025 res!288402) b!484026))

(declare-fun m!464867 () Bool)

(assert (=> b!484026 m!464867))

(assert (=> start!43788 d!77035))

(declare-fun d!77039 () Bool)

(declare-fun lt!219339 () Int)

(assert (=> d!77039 (>= lt!219339 0)))

(declare-fun e!284921 () Int)

(assert (=> d!77039 (= lt!219339 e!284921)))

(declare-fun c!58171 () Bool)

(assert (=> d!77039 (= c!58171 (is-Nil!9272 l!956))))

(assert (=> d!77039 (= (ListPrimitiveSize!61 l!956) lt!219339)))

(declare-fun b!484043 () Bool)

(assert (=> b!484043 (= e!284921 0)))

(declare-fun b!484044 () Bool)

(assert (=> b!484044 (= e!284921 (+ 1 (ListPrimitiveSize!61 (t!15497 l!956))))))

(assert (= (and d!77039 c!58171) b!484043))

(assert (= (and d!77039 (not c!58171)) b!484044))

(declare-fun m!464871 () Bool)

(assert (=> b!484044 m!464871))

(assert (=> b!483973 d!77039))

(declare-fun b!484059 () Bool)

(declare-fun e!284929 () Bool)

(declare-fun tp!43493 () Bool)

(assert (=> b!484059 (= e!284929 (and tp_is_empty!13927 tp!43493))))

(assert (=> b!483974 (= tp!43480 e!284929)))

(assert (= (and b!483974 (is-Cons!9271 (t!15497 l!956))) b!484059))

(push 1)

(assert (not b!484059))

(assert (not b!484026))

(assert tp_is_empty!13927)

(assert (not b!484044))

(assert (not b!484010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

