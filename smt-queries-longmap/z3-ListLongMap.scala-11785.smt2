; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138404 () Bool)

(assert start!138404)

(declare-fun res!1083231 () Bool)

(declare-fun e!885701 () Bool)

(assert (=> start!138404 (=> (not res!1083231) (not e!885701))))

(declare-datatypes ((B!3050 0))(
  ( (B!3051 (val!19887 Int)) )
))
(declare-datatypes ((tuple2!26010 0))(
  ( (tuple2!26011 (_1!13016 (_ BitVec 64)) (_2!13016 B!3050)) )
))
(declare-datatypes ((List!37048 0))(
  ( (Nil!37045) (Cons!37044 (h!38588 tuple2!26010) (t!51970 List!37048)) )
))
(declare-fun l!628 () List!37048)

(get-info :version)

(assert (=> start!138404 (= res!1083231 (and (not ((_ is Nil!37045) l!628)) (not ((_ is Nil!37045) (t!51970 l!628))) (bvslt (_1!13016 (h!38588 l!628)) (_1!13016 (h!38588 (t!51970 l!628))))))))

(assert (=> start!138404 e!885701))

(declare-fun e!885702 () Bool)

(assert (=> start!138404 e!885702))

(declare-fun b!1586088 () Bool)

(declare-fun ListPrimitiveSize!238 (List!37048) Int)

(assert (=> b!1586088 (= e!885701 (>= (ListPrimitiveSize!238 (t!51970 l!628)) (ListPrimitiveSize!238 l!628)))))

(declare-fun b!1586089 () Bool)

(declare-fun tp_is_empty!39583 () Bool)

(declare-fun tp!115443 () Bool)

(assert (=> b!1586089 (= e!885702 (and tp_is_empty!39583 tp!115443))))

(assert (= (and start!138404 res!1083231) b!1586088))

(assert (= (and start!138404 ((_ is Cons!37044) l!628)) b!1586089))

(declare-fun m!1453869 () Bool)

(assert (=> b!1586088 m!1453869))

(declare-fun m!1453871 () Bool)

(assert (=> b!1586088 m!1453871))

(check-sat (not b!1586088) (not b!1586089) tp_is_empty!39583)
(check-sat)
(get-model)

(declare-fun d!167685 () Bool)

(declare-fun lt!677246 () Int)

(assert (=> d!167685 (>= lt!677246 0)))

(declare-fun e!885717 () Int)

(assert (=> d!167685 (= lt!677246 e!885717)))

(declare-fun c!146977 () Bool)

(assert (=> d!167685 (= c!146977 ((_ is Nil!37045) (t!51970 l!628)))))

(assert (=> d!167685 (= (ListPrimitiveSize!238 (t!51970 l!628)) lt!677246)))

(declare-fun b!1586106 () Bool)

(assert (=> b!1586106 (= e!885717 0)))

(declare-fun b!1586107 () Bool)

(assert (=> b!1586107 (= e!885717 (+ 1 (ListPrimitiveSize!238 (t!51970 (t!51970 l!628)))))))

(assert (= (and d!167685 c!146977) b!1586106))

(assert (= (and d!167685 (not c!146977)) b!1586107))

(declare-fun m!1453881 () Bool)

(assert (=> b!1586107 m!1453881))

(assert (=> b!1586088 d!167685))

(declare-fun d!167687 () Bool)

(declare-fun lt!677247 () Int)

(assert (=> d!167687 (>= lt!677247 0)))

(declare-fun e!885718 () Int)

(assert (=> d!167687 (= lt!677247 e!885718)))

(declare-fun c!146978 () Bool)

(assert (=> d!167687 (= c!146978 ((_ is Nil!37045) l!628))))

(assert (=> d!167687 (= (ListPrimitiveSize!238 l!628) lt!677247)))

(declare-fun b!1586108 () Bool)

(assert (=> b!1586108 (= e!885718 0)))

(declare-fun b!1586109 () Bool)

(assert (=> b!1586109 (= e!885718 (+ 1 (ListPrimitiveSize!238 (t!51970 l!628))))))

(assert (= (and d!167687 c!146978) b!1586108))

(assert (= (and d!167687 (not c!146978)) b!1586109))

(assert (=> b!1586109 m!1453869))

(assert (=> b!1586088 d!167687))

(declare-fun b!1586114 () Bool)

(declare-fun e!885721 () Bool)

(declare-fun tp!115452 () Bool)

(assert (=> b!1586114 (= e!885721 (and tp_is_empty!39583 tp!115452))))

(assert (=> b!1586089 (= tp!115443 e!885721)))

(assert (= (and b!1586089 ((_ is Cons!37044) (t!51970 l!628))) b!1586114))

(check-sat (not b!1586107) (not b!1586109) (not b!1586114) tp_is_empty!39583)
(check-sat)
