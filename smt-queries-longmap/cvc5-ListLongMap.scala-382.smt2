; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7210 () Bool)

(assert start!7210)

(declare-fun res!26997 () Bool)

(declare-fun e!29425 () Bool)

(assert (=> start!7210 (=> (not res!26997) (not e!29425))))

(declare-datatypes ((B!872 0))(
  ( (B!873 (val!1023 Int)) )
))
(declare-datatypes ((tuple2!1694 0))(
  ( (tuple2!1695 (_1!858 (_ BitVec 64)) (_2!858 B!872)) )
))
(declare-datatypes ((List!1241 0))(
  ( (Nil!1238) (Cons!1237 (h!1817 tuple2!1694) (t!4266 List!1241)) )
))
(declare-fun l!812 () List!1241)

(declare-fun isStrictlySorted!232 (List!1241) Bool)

(assert (=> start!7210 (= res!26997 (isStrictlySorted!232 l!812))))

(assert (=> start!7210 e!29425))

(declare-fun e!29426 () Bool)

(assert (=> start!7210 e!29426))

(declare-fun b!46190 () Bool)

(declare-fun ListPrimitiveSize!43 (List!1241) Int)

(assert (=> b!46190 (= e!29425 (< (ListPrimitiveSize!43 l!812) 0))))

(declare-fun b!46191 () Bool)

(declare-fun tp_is_empty!1969 () Bool)

(declare-fun tp!6083 () Bool)

(assert (=> b!46191 (= e!29426 (and tp_is_empty!1969 tp!6083))))

(assert (= (and start!7210 res!26997) b!46190))

(assert (= (and start!7210 (is-Cons!1237 l!812)) b!46191))

(declare-fun m!40635 () Bool)

(assert (=> start!7210 m!40635))

(declare-fun m!40637 () Bool)

(assert (=> b!46190 m!40637))

(push 1)

(assert (not start!7210))

(assert (not b!46190))

(assert (not b!46191))

(assert tp_is_empty!1969)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9035 () Bool)

(declare-fun res!27008 () Bool)

(declare-fun e!29445 () Bool)

(assert (=> d!9035 (=> res!27008 e!29445)))

(assert (=> d!9035 (= res!27008 (or (is-Nil!1238 l!812) (is-Nil!1238 (t!4266 l!812))))))

(assert (=> d!9035 (= (isStrictlySorted!232 l!812) e!29445)))

(declare-fun b!46212 () Bool)

(declare-fun e!29446 () Bool)

(assert (=> b!46212 (= e!29445 e!29446)))

(declare-fun res!27009 () Bool)

(assert (=> b!46212 (=> (not res!27009) (not e!29446))))

(assert (=> b!46212 (= res!27009 (bvslt (_1!858 (h!1817 l!812)) (_1!858 (h!1817 (t!4266 l!812)))))))

(declare-fun b!46213 () Bool)

(assert (=> b!46213 (= e!29446 (isStrictlySorted!232 (t!4266 l!812)))))

(assert (= (and d!9035 (not res!27008)) b!46212))

(assert (= (and b!46212 res!27009) b!46213))

(declare-fun m!40647 () Bool)

(assert (=> b!46213 m!40647))

(assert (=> start!7210 d!9035))

(declare-fun d!9041 () Bool)

(declare-fun lt!20281 () Int)

(assert (=> d!9041 (>= lt!20281 0)))

(declare-fun e!29460 () Int)

(assert (=> d!9041 (= lt!20281 e!29460)))

(declare-fun c!6249 () Bool)

(assert (=> d!9041 (= c!6249 (is-Nil!1238 l!812))))

(assert (=> d!9041 (= (ListPrimitiveSize!43 l!812) lt!20281)))

(declare-fun b!46230 () Bool)

(assert (=> b!46230 (= e!29460 0)))

(declare-fun b!46231 () Bool)

(assert (=> b!46231 (= e!29460 (+ 1 (ListPrimitiveSize!43 (t!4266 l!812))))))

(assert (= (and d!9041 c!6249) b!46230))

(assert (= (and d!9041 (not c!6249)) b!46231))

(declare-fun m!40653 () Bool)

(assert (=> b!46231 m!40653))

(assert (=> b!46190 d!9041))

(declare-fun b!46246 () Bool)

(declare-fun e!29469 () Bool)

(declare-fun tp!6092 () Bool)

(assert (=> b!46246 (= e!29469 (and tp_is_empty!1969 tp!6092))))

(assert (=> b!46191 (= tp!6083 e!29469)))

(assert (= (and b!46191 (is-Cons!1237 (t!4266 l!812))) b!46246))

(push 1)

