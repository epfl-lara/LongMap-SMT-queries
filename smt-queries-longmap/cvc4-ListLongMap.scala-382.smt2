; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7214 () Bool)

(assert start!7214)

(declare-fun res!27003 () Bool)

(declare-fun e!29437 () Bool)

(assert (=> start!7214 (=> (not res!27003) (not e!29437))))

(declare-datatypes ((B!876 0))(
  ( (B!877 (val!1025 Int)) )
))
(declare-datatypes ((tuple2!1698 0))(
  ( (tuple2!1699 (_1!860 (_ BitVec 64)) (_2!860 B!876)) )
))
(declare-datatypes ((List!1243 0))(
  ( (Nil!1240) (Cons!1239 (h!1819 tuple2!1698) (t!4268 List!1243)) )
))
(declare-fun l!812 () List!1243)

(declare-fun isStrictlySorted!234 (List!1243) Bool)

(assert (=> start!7214 (= res!27003 (isStrictlySorted!234 l!812))))

(assert (=> start!7214 e!29437))

(declare-fun e!29438 () Bool)

(assert (=> start!7214 e!29438))

(declare-fun b!46202 () Bool)

(declare-fun ListPrimitiveSize!45 (List!1243) Int)

(assert (=> b!46202 (= e!29437 (< (ListPrimitiveSize!45 l!812) 0))))

(declare-fun b!46203 () Bool)

(declare-fun tp_is_empty!1973 () Bool)

(declare-fun tp!6089 () Bool)

(assert (=> b!46203 (= e!29438 (and tp_is_empty!1973 tp!6089))))

(assert (= (and start!7214 res!27003) b!46202))

(assert (= (and start!7214 (is-Cons!1239 l!812)) b!46203))

(declare-fun m!40643 () Bool)

(assert (=> start!7214 m!40643))

(declare-fun m!40645 () Bool)

(assert (=> b!46202 m!40645))

(push 1)

(assert (not start!7214))

(assert (not b!46202))

(assert (not b!46203))

(assert tp_is_empty!1973)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9039 () Bool)

(declare-fun res!27014 () Bool)

(declare-fun e!29452 () Bool)

(assert (=> d!9039 (=> res!27014 e!29452)))

(assert (=> d!9039 (= res!27014 (or (is-Nil!1240 l!812) (is-Nil!1240 (t!4268 l!812))))))

(assert (=> d!9039 (= (isStrictlySorted!234 l!812) e!29452)))

(declare-fun b!46220 () Bool)

(declare-fun e!29453 () Bool)

(assert (=> b!46220 (= e!29452 e!29453)))

(declare-fun res!27015 () Bool)

(assert (=> b!46220 (=> (not res!27015) (not e!29453))))

(assert (=> b!46220 (= res!27015 (bvslt (_1!860 (h!1819 l!812)) (_1!860 (h!1819 (t!4268 l!812)))))))

(declare-fun b!46221 () Bool)

(assert (=> b!46221 (= e!29453 (isStrictlySorted!234 (t!4268 l!812)))))

(assert (= (and d!9039 (not res!27014)) b!46220))

(assert (= (and b!46220 res!27015) b!46221))

(declare-fun m!40651 () Bool)

(assert (=> b!46221 m!40651))

(assert (=> start!7214 d!9039))

(declare-fun d!9045 () Bool)

(declare-fun lt!20284 () Int)

(assert (=> d!9045 (>= lt!20284 0)))

(declare-fun e!29470 () Int)

(assert (=> d!9045 (= lt!20284 e!29470)))

(declare-fun c!6252 () Bool)

(assert (=> d!9045 (= c!6252 (is-Nil!1240 l!812))))

(assert (=> d!9045 (= (ListPrimitiveSize!45 l!812) lt!20284)))

(declare-fun b!46247 () Bool)

(assert (=> b!46247 (= e!29470 0)))

(declare-fun b!46248 () Bool)

(assert (=> b!46248 (= e!29470 (+ 1 (ListPrimitiveSize!45 (t!4268 l!812))))))

(assert (= (and d!9045 c!6252) b!46247))

(assert (= (and d!9045 (not c!6252)) b!46248))

(declare-fun m!40657 () Bool)

(assert (=> b!46248 m!40657))

(assert (=> b!46202 d!9045))

(declare-fun b!46254 () Bool)

(declare-fun e!29474 () Bool)

(declare-fun tp!6098 () Bool)

