; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7212 () Bool)

(assert start!7212)

(declare-fun res!26977 () Bool)

(declare-fun e!29382 () Bool)

(assert (=> start!7212 (=> (not res!26977) (not e!29382))))

(declare-datatypes ((B!872 0))(
  ( (B!873 (val!1023 Int)) )
))
(declare-datatypes ((tuple2!1698 0))(
  ( (tuple2!1699 (_1!860 (_ BitVec 64)) (_2!860 B!872)) )
))
(declare-datatypes ((List!1234 0))(
  ( (Nil!1231) (Cons!1230 (h!1810 tuple2!1698) (t!4258 List!1234)) )
))
(declare-fun l!812 () List!1234)

(declare-fun isStrictlySorted!227 (List!1234) Bool)

(assert (=> start!7212 (= res!26977 (isStrictlySorted!227 l!812))))

(assert (=> start!7212 e!29382))

(declare-fun e!29383 () Bool)

(assert (=> start!7212 e!29383))

(declare-fun b!46124 () Bool)

(declare-fun ListPrimitiveSize!43 (List!1234) Int)

(assert (=> b!46124 (= e!29382 (< (ListPrimitiveSize!43 l!812) 0))))

(declare-fun b!46125 () Bool)

(declare-fun tp_is_empty!1969 () Bool)

(declare-fun tp!6083 () Bool)

(assert (=> b!46125 (= e!29383 (and tp_is_empty!1969 tp!6083))))

(assert (= (and start!7212 res!26977) b!46124))

(get-info :version)

(assert (= (and start!7212 ((_ is Cons!1230) l!812)) b!46125))

(declare-fun m!40553 () Bool)

(assert (=> start!7212 m!40553))

(declare-fun m!40555 () Bool)

(assert (=> b!46124 m!40555))

(check-sat (not start!7212) (not b!46124) (not b!46125) tp_is_empty!1969)
(check-sat)
(get-model)

(declare-fun d!9009 () Bool)

(declare-fun res!26988 () Bool)

(declare-fun e!29402 () Bool)

(assert (=> d!9009 (=> res!26988 e!29402)))

(assert (=> d!9009 (= res!26988 (or ((_ is Nil!1231) l!812) ((_ is Nil!1231) (t!4258 l!812))))))

(assert (=> d!9009 (= (isStrictlySorted!227 l!812) e!29402)))

(declare-fun b!46148 () Bool)

(declare-fun e!29404 () Bool)

(assert (=> b!46148 (= e!29402 e!29404)))

(declare-fun res!26989 () Bool)

(assert (=> b!46148 (=> (not res!26989) (not e!29404))))

(assert (=> b!46148 (= res!26989 (bvslt (_1!860 (h!1810 l!812)) (_1!860 (h!1810 (t!4258 l!812)))))))

(declare-fun b!46149 () Bool)

(assert (=> b!46149 (= e!29404 (isStrictlySorted!227 (t!4258 l!812)))))

(assert (= (and d!9009 (not res!26988)) b!46148))

(assert (= (and b!46148 res!26989) b!46149))

(declare-fun m!40567 () Bool)

(assert (=> b!46149 m!40567))

(assert (=> start!7212 d!9009))

(declare-fun d!9017 () Bool)

(declare-fun lt!20265 () Int)

(assert (=> d!9017 (>= lt!20265 0)))

(declare-fun e!29415 () Int)

(assert (=> d!9017 (= lt!20265 e!29415)))

(declare-fun c!6226 () Bool)

(assert (=> d!9017 (= c!6226 ((_ is Nil!1231) l!812))))

(assert (=> d!9017 (= (ListPrimitiveSize!43 l!812) lt!20265)))

(declare-fun b!46162 () Bool)

(assert (=> b!46162 (= e!29415 0)))

(declare-fun b!46163 () Bool)

(assert (=> b!46163 (= e!29415 (+ 1 (ListPrimitiveSize!43 (t!4258 l!812))))))

(assert (= (and d!9017 c!6226) b!46162))

(assert (= (and d!9017 (not c!6226)) b!46163))

(declare-fun m!40569 () Bool)

(assert (=> b!46163 m!40569))

(assert (=> b!46124 d!9017))

(declare-fun b!46174 () Bool)

(declare-fun e!29422 () Bool)

(declare-fun tp!6094 () Bool)

(assert (=> b!46174 (= e!29422 (and tp_is_empty!1969 tp!6094))))

(assert (=> b!46125 (= tp!6083 e!29422)))

(assert (= (and b!46125 ((_ is Cons!1230) (t!4258 l!812))) b!46174))

(check-sat (not b!46163) (not b!46149) (not b!46174) tp_is_empty!1969)
(check-sat)
