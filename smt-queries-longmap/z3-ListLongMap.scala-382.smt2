; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7216 () Bool)

(assert start!7216)

(declare-fun res!26972 () Bool)

(declare-fun e!29388 () Bool)

(assert (=> start!7216 (=> (not res!26972) (not e!29388))))

(declare-datatypes ((B!872 0))(
  ( (B!873 (val!1023 Int)) )
))
(declare-datatypes ((tuple2!1676 0))(
  ( (tuple2!1677 (_1!849 (_ BitVec 64)) (_2!849 B!872)) )
))
(declare-datatypes ((List!1227 0))(
  ( (Nil!1224) (Cons!1223 (h!1803 tuple2!1676) (t!4252 List!1227)) )
))
(declare-fun l!812 () List!1227)

(declare-fun isStrictlySorted!220 (List!1227) Bool)

(assert (=> start!7216 (= res!26972 (isStrictlySorted!220 l!812))))

(assert (=> start!7216 e!29388))

(declare-fun e!29389 () Bool)

(assert (=> start!7216 e!29389))

(declare-fun b!46133 () Bool)

(declare-fun ListPrimitiveSize!43 (List!1227) Int)

(assert (=> b!46133 (= e!29388 (< (ListPrimitiveSize!43 l!812) 0))))

(declare-fun b!46134 () Bool)

(declare-fun tp_is_empty!1969 () Bool)

(declare-fun tp!6083 () Bool)

(assert (=> b!46134 (= e!29389 (and tp_is_empty!1969 tp!6083))))

(assert (= (and start!7216 res!26972) b!46133))

(get-info :version)

(assert (= (and start!7216 ((_ is Cons!1223) l!812)) b!46134))

(declare-fun m!40511 () Bool)

(assert (=> start!7216 m!40511))

(declare-fun m!40513 () Bool)

(assert (=> b!46133 m!40513))

(check-sat (not start!7216) (not b!46133) (not b!46134) tp_is_empty!1969)
(check-sat)
(get-model)

(declare-fun d!9023 () Bool)

(declare-fun res!26987 () Bool)

(declare-fun e!29410 () Bool)

(assert (=> d!9023 (=> res!26987 e!29410)))

(assert (=> d!9023 (= res!26987 (or ((_ is Nil!1224) l!812) ((_ is Nil!1224) (t!4252 l!812))))))

(assert (=> d!9023 (= (isStrictlySorted!220 l!812) e!29410)))

(declare-fun b!46155 () Bool)

(declare-fun e!29411 () Bool)

(assert (=> b!46155 (= e!29410 e!29411)))

(declare-fun res!26988 () Bool)

(assert (=> b!46155 (=> (not res!26988) (not e!29411))))

(assert (=> b!46155 (= res!26988 (bvslt (_1!849 (h!1803 l!812)) (_1!849 (h!1803 (t!4252 l!812)))))))

(declare-fun b!46156 () Bool)

(assert (=> b!46156 (= e!29411 (isStrictlySorted!220 (t!4252 l!812)))))

(assert (= (and d!9023 (not res!26987)) b!46155))

(assert (= (and b!46155 res!26988) b!46156))

(declare-fun m!40523 () Bool)

(assert (=> b!46156 m!40523))

(assert (=> start!7216 d!9023))

(declare-fun d!9027 () Bool)

(declare-fun lt!20237 () Int)

(assert (=> d!9027 (>= lt!20237 0)))

(declare-fun e!29418 () Int)

(assert (=> d!9027 (= lt!20237 e!29418)))

(declare-fun c!6232 () Bool)

(assert (=> d!9027 (= c!6232 ((_ is Nil!1224) l!812))))

(assert (=> d!9027 (= (ListPrimitiveSize!43 l!812) lt!20237)))

(declare-fun b!46167 () Bool)

(assert (=> b!46167 (= e!29418 0)))

(declare-fun b!46168 () Bool)

(assert (=> b!46168 (= e!29418 (+ 1 (ListPrimitiveSize!43 (t!4252 l!812))))))

(assert (= (and d!9027 c!6232) b!46167))

(assert (= (and d!9027 (not c!6232)) b!46168))

(declare-fun m!40527 () Bool)

(assert (=> b!46168 m!40527))

(assert (=> b!46133 d!9027))

(declare-fun b!46177 () Bool)

(declare-fun e!29424 () Bool)

(declare-fun tp!6092 () Bool)

(assert (=> b!46177 (= e!29424 (and tp_is_empty!1969 tp!6092))))

(assert (=> b!46134 (= tp!6083 e!29424)))

(assert (= (and b!46134 ((_ is Cons!1223) (t!4252 l!812))) b!46177))

(check-sat (not b!46168) (not b!46156) (not b!46177) tp_is_empty!1969)
(check-sat)
