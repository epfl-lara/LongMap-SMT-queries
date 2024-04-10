; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7196 () Bool)

(assert start!7196)

(declare-fun res!26960 () Bool)

(declare-fun e!29359 () Bool)

(assert (=> start!7196 (=> (not res!26960) (not e!29359))))

(declare-datatypes ((B!870 0))(
  ( (B!871 (val!1022 Int)) )
))
(declare-datatypes ((tuple2!1692 0))(
  ( (tuple2!1693 (_1!857 (_ BitVec 64)) (_2!857 B!870)) )
))
(declare-datatypes ((List!1240 0))(
  ( (Nil!1237) (Cons!1236 (h!1816 tuple2!1692) (t!4265 List!1240)) )
))
(declare-fun l!812 () List!1240)

(declare-fun isStrictlySorted!231 (List!1240) Bool)

(assert (=> start!7196 (= res!26960 (isStrictlySorted!231 l!812))))

(assert (=> start!7196 e!29359))

(declare-fun e!29360 () Bool)

(assert (=> start!7196 e!29360))

(assert (=> start!7196 true))

(declare-fun b!46099 () Bool)

(declare-fun res!26961 () Bool)

(assert (=> b!46099 (=> (not res!26961) (not e!29359))))

(assert (=> b!46099 (= res!26961 (not (is-Cons!1236 l!812)))))

(declare-fun b!46100 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!41 (List!1240 (_ BitVec 64)) List!1240)

(assert (=> b!46100 (= e!29359 (not (isStrictlySorted!231 (removeStrictlySorted!41 l!812 key2!27))))))

(declare-fun b!46101 () Bool)

(declare-fun tp_is_empty!1967 () Bool)

(declare-fun tp!6071 () Bool)

(assert (=> b!46101 (= e!29360 (and tp_is_empty!1967 tp!6071))))

(assert (= (and start!7196 res!26960) b!46099))

(assert (= (and b!46099 res!26961) b!46100))

(assert (= (and start!7196 (is-Cons!1236 l!812)) b!46101))

(declare-fun m!40593 () Bool)

(assert (=> start!7196 m!40593))

(declare-fun m!40595 () Bool)

(assert (=> b!46100 m!40595))

(assert (=> b!46100 m!40595))

(declare-fun m!40597 () Bool)

(assert (=> b!46100 m!40597))

(push 1)

(assert (not start!7196))

(assert (not b!46100))

(assert (not b!46101))

(assert tp_is_empty!1967)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9015 () Bool)

(declare-fun res!26971 () Bool)

(declare-fun e!29370 () Bool)

(assert (=> d!9015 (=> res!26971 e!29370)))

(assert (=> d!9015 (= res!26971 (or (is-Nil!1237 l!812) (is-Nil!1237 (t!4265 l!812))))))

(assert (=> d!9015 (= (isStrictlySorted!231 l!812) e!29370)))

(declare-fun b!46111 () Bool)

(declare-fun e!29372 () Bool)

(assert (=> b!46111 (= e!29370 e!29372)))

(declare-fun res!26973 () Bool)

(assert (=> b!46111 (=> (not res!26973) (not e!29372))))

(assert (=> b!46111 (= res!26973 (bvslt (_1!857 (h!1816 l!812)) (_1!857 (h!1816 (t!4265 l!812)))))))

(declare-fun b!46113 () Bool)

(assert (=> b!46113 (= e!29372 (isStrictlySorted!231 (t!4265 l!812)))))

(assert (= (and d!9015 (not res!26971)) b!46111))

(assert (= (and b!46111 res!26973) b!46113))

(declare-fun m!40601 () Bool)

(assert (=> b!46113 m!40601))

(assert (=> start!7196 d!9015))

(declare-fun d!9021 () Bool)

(declare-fun res!26975 () Bool)

(declare-fun e!29374 () Bool)

(assert (=> d!9021 (=> res!26975 e!29374)))

(assert (=> d!9021 (= res!26975 (or (is-Nil!1237 (removeStrictlySorted!41 l!812 key2!27)) (is-Nil!1237 (t!4265 (removeStrictlySorted!41 l!812 key2!27)))))))

(assert (=> d!9021 (= (isStrictlySorted!231 (removeStrictlySorted!41 l!812 key2!27)) e!29374)))

(declare-fun b!46115 () Bool)

(declare-fun e!29376 () Bool)

(assert (=> b!46115 (= e!29374 e!29376)))

(declare-fun res!26977 () Bool)

(assert (=> b!46115 (=> (not res!26977) (not e!29376))))

(assert (=> b!46115 (= res!26977 (bvslt (_1!857 (h!1816 (removeStrictlySorted!41 l!812 key2!27))) (_1!857 (h!1816 (t!4265 (removeStrictlySorted!41 l!812 key2!27))))))))

(declare-fun b!46117 () Bool)

(assert (=> b!46117 (= e!29376 (isStrictlySorted!231 (t!4265 (removeStrictlySorted!41 l!812 key2!27))))))

(assert (= (and d!9021 (not res!26975)) b!46115))

(assert (= (and b!46115 res!26977) b!46117))

(declare-fun m!40603 () Bool)

(assert (=> b!46117 m!40603))

(assert (=> b!46100 d!9021))

(declare-fun d!9025 () Bool)

(declare-fun e!29399 () Bool)

(assert (=> d!9025 e!29399))

(declare-fun res!26990 () Bool)

(assert (=> d!9025 (=> (not res!26990) (not e!29399))))

(declare-fun lt!20271 () List!1240)

(assert (=> d!9025 (= res!26990 (isStrictlySorted!231 lt!20271))))

(declare-fun e!29397 () List!1240)

(assert (=> d!9025 (= lt!20271 e!29397)))

(declare-fun c!6234 () Bool)

(assert (=> d!9025 (= c!6234 (and (is-Cons!1236 l!812) (= (_1!857 (h!1816 l!812)) key2!27)))))

(assert (=> d!9025 (isStrictlySorted!231 l!812)))

(assert (=> d!9025 (= (removeStrictlySorted!41 l!812 key2!27) lt!20271)))

(declare-fun b!46146 () Bool)

(assert (=> b!46146 (= e!29397 (t!4265 l!812))))

(declare-fun b!46147 () Bool)

(declare-fun e!29398 () List!1240)

(assert (=> b!46147 (= e!29398 Nil!1237)))

(declare-fun b!46148 () Bool)

(assert (=> b!46148 (= e!29397 e!29398)))

(declare-fun c!6235 () Bool)

(assert (=> b!46148 (= c!6235 (and (is-Cons!1236 l!812) (not (= (_1!857 (h!1816 l!812)) key2!27))))))

(declare-fun b!46149 () Bool)

(declare-fun containsKey!88 (List!1240 (_ BitVec 64)) Bool)

(assert (=> b!46149 (= e!29399 (not (containsKey!88 lt!20271 key2!27)))))

(declare-fun b!46150 () Bool)

(declare-fun $colon$colon!43 (List!1240 tuple2!1692) List!1240)

(assert (=> b!46150 (= e!29398 ($colon$colon!43 (removeStrictlySorted!41 (t!4265 l!812) key2!27) (h!1816 l!812)))))

(assert (= (and d!9025 c!6234) b!46146))

(assert (= (and d!9025 (not c!6234)) b!46148))

(assert (= (and b!46148 c!6235) b!46150))

(assert (= (and b!46148 (not c!6235)) b!46147))

(assert (= (and d!9025 res!26990) b!46149))

(declare-fun m!40611 () Bool)

(assert (=> d!9025 m!40611))

(assert (=> d!9025 m!40593))

(declare-fun m!40617 () Bool)

(assert (=> b!46149 m!40617))

(declare-fun m!40619 () Bool)

(assert (=> b!46150 m!40619))

(assert (=> b!46150 m!40619))

(declare-fun m!40623 () Bool)

(assert (=> b!46150 m!40623))

(assert (=> b!46100 d!9025))

(declare-fun b!46164 () Bool)

(declare-fun e!29407 () Bool)

(declare-fun tp!6076 () Bool)

(assert (=> b!46164 (= e!29407 (and tp_is_empty!1967 tp!6076))))

(assert (=> b!46101 (= tp!6071 e!29407)))

(assert (= (and b!46101 (is-Cons!1236 (t!4265 l!812))) b!46164))

(push 1)

