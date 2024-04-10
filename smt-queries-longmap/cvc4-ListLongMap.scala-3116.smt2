; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43792 () Bool)

(assert start!43792)

(declare-fun res!288373 () Bool)

(declare-fun e!284876 () Bool)

(assert (=> start!43792 (=> (not res!288373) (not e!284876))))

(declare-datatypes ((B!1122 0))(
  ( (B!1123 (val!7013 Int)) )
))
(declare-datatypes ((tuple2!9228 0))(
  ( (tuple2!9229 (_1!4625 (_ BitVec 64)) (_2!4625 B!1122)) )
))
(declare-datatypes ((List!9277 0))(
  ( (Nil!9274) (Cons!9273 (h!10129 tuple2!9228) (t!15499 List!9277)) )
))
(declare-fun l!956 () List!9277)

(declare-fun isStrictlySorted!416 (List!9277) Bool)

(assert (=> start!43792 (= res!288373 (isStrictlySorted!416 l!956))))

(assert (=> start!43792 e!284876))

(declare-fun e!284877 () Bool)

(assert (=> start!43792 e!284877))

(assert (=> start!43792 true))

(declare-fun b!483990 () Bool)

(declare-fun res!288374 () Bool)

(assert (=> b!483990 (=> (not res!288374) (not e!284876))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!379 (List!9277 (_ BitVec 64)) Bool)

(assert (=> b!483990 (= res!288374 (not (containsKey!379 l!956 key!251)))))

(declare-fun b!483991 () Bool)

(declare-fun ListPrimitiveSize!63 (List!9277) Int)

(assert (=> b!483991 (= e!284876 (< (ListPrimitiveSize!63 l!956) 0))))

(declare-fun b!483992 () Bool)

(declare-fun tp_is_empty!13931 () Bool)

(declare-fun tp!43486 () Bool)

(assert (=> b!483992 (= e!284877 (and tp_is_empty!13931 tp!43486))))

(assert (= (and start!43792 res!288373) b!483990))

(assert (= (and b!483990 res!288374) b!483991))

(assert (= (and start!43792 (is-Cons!9273 l!956)) b!483992))

(declare-fun m!464853 () Bool)

(assert (=> start!43792 m!464853))

(declare-fun m!464855 () Bool)

(assert (=> b!483990 m!464855))

(declare-fun m!464857 () Bool)

(assert (=> b!483991 m!464857))

(push 1)

(assert (not start!43792))

(assert tp_is_empty!13931)

(assert (not b!483992))

(assert (not b!483990))

(assert (not b!483991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77029 () Bool)

(declare-fun res!288389 () Bool)

(declare-fun e!284892 () Bool)

(assert (=> d!77029 (=> res!288389 e!284892)))

(assert (=> d!77029 (= res!288389 (or (is-Nil!9274 l!956) (is-Nil!9274 (t!15499 l!956))))))

(assert (=> d!77029 (= (isStrictlySorted!416 l!956) e!284892)))

(declare-fun b!484007 () Bool)

(declare-fun e!284893 () Bool)

(assert (=> b!484007 (= e!284892 e!284893)))

(declare-fun res!288390 () Bool)

(assert (=> b!484007 (=> (not res!288390) (not e!284893))))

(assert (=> b!484007 (= res!288390 (bvslt (_1!4625 (h!10129 l!956)) (_1!4625 (h!10129 (t!15499 l!956)))))))

(declare-fun b!484008 () Bool)

(assert (=> b!484008 (= e!284893 (isStrictlySorted!416 (t!15499 l!956)))))

(assert (= (and d!77029 (not res!288389)) b!484007))

(assert (= (and b!484007 res!288390) b!484008))

(declare-fun m!464861 () Bool)

(assert (=> b!484008 m!464861))

(assert (=> start!43792 d!77029))

(declare-fun d!77033 () Bool)

(declare-fun res!288403 () Bool)

(declare-fun e!284909 () Bool)

(assert (=> d!77033 (=> res!288403 e!284909)))

(assert (=> d!77033 (= res!288403 (and (is-Cons!9273 l!956) (= (_1!4625 (h!10129 l!956)) key!251)))))

(assert (=> d!77033 (= (containsKey!379 l!956 key!251) e!284909)))

(declare-fun b!484027 () Bool)

(declare-fun e!284910 () Bool)

(assert (=> b!484027 (= e!284909 e!284910)))

(declare-fun res!288404 () Bool)

(assert (=> b!484027 (=> (not res!288404) (not e!284910))))

(assert (=> b!484027 (= res!288404 (and (or (not (is-Cons!9273 l!956)) (bvsle (_1!4625 (h!10129 l!956)) key!251)) (is-Cons!9273 l!956) (bvslt (_1!4625 (h!10129 l!956)) key!251)))))

(declare-fun b!484028 () Bool)

(assert (=> b!484028 (= e!284910 (containsKey!379 (t!15499 l!956) key!251))))

(assert (= (and d!77033 (not res!288403)) b!484027))

(assert (= (and b!484027 res!288404) b!484028))

(declare-fun m!464869 () Bool)

(assert (=> b!484028 m!464869))

(assert (=> b!483990 d!77033))

(declare-fun d!77041 () Bool)

(declare-fun lt!219340 () Int)

(assert (=> d!77041 (>= lt!219340 0)))

(declare-fun e!284922 () Int)

(assert (=> d!77041 (= lt!219340 e!284922)))

(declare-fun c!58172 () Bool)

(assert (=> d!77041 (= c!58172 (is-Nil!9274 l!956))))

(assert (=> d!77041 (= (ListPrimitiveSize!63 l!956) lt!219340)))

(declare-fun b!484046 () Bool)

(assert (=> b!484046 (= e!284922 0)))

(declare-fun b!484048 () Bool)

(assert (=> b!484048 (= e!284922 (+ 1 (ListPrimitiveSize!63 (t!15499 l!956))))))

(assert (= (and d!77041 c!58172) b!484046))

(assert (= (and d!77041 (not c!58172)) b!484048))

(declare-fun m!464875 () Bool)

(assert (=> b!484048 m!464875))

(assert (=> b!483991 d!77041))

(declare-fun b!484061 () Bool)

(declare-fun e!284931 () Bool)

(declare-fun tp!43495 () Bool)

(assert (=> b!484061 (= e!284931 (and tp_is_empty!13931 tp!43495))))

