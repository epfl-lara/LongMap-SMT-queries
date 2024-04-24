; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138882 () Bool)

(assert start!138882)

(declare-fun res!1084288 () Bool)

(declare-fun e!887464 () Bool)

(assert (=> start!138882 (=> (not res!1084288) (not e!887464))))

(declare-datatypes ((B!3050 0))(
  ( (B!3051 (val!19887 Int)) )
))
(declare-datatypes ((tuple2!26002 0))(
  ( (tuple2!26003 (_1!13012 (_ BitVec 64)) (_2!13012 B!3050)) )
))
(declare-datatypes ((List!37039 0))(
  ( (Nil!37036) (Cons!37035 (h!38596 tuple2!26002) (t!51962 List!37039)) )
))
(declare-fun l!628 () List!37039)

(get-info :version)

(assert (=> start!138882 (= res!1084288 (and (not ((_ is Nil!37036) l!628)) (not ((_ is Nil!37036) (t!51962 l!628))) (bvslt (_1!13012 (h!38596 l!628)) (_1!13012 (h!38596 (t!51962 l!628))))))))

(assert (=> start!138882 e!887464))

(declare-fun e!887465 () Bool)

(assert (=> start!138882 e!887465))

(declare-fun b!1588915 () Bool)

(declare-fun ListPrimitiveSize!238 (List!37039) Int)

(assert (=> b!1588915 (= e!887464 (>= (ListPrimitiveSize!238 (t!51962 l!628)) (ListPrimitiveSize!238 l!628)))))

(declare-fun b!1588916 () Bool)

(declare-fun tp_is_empty!39583 () Bool)

(declare-fun tp!115444 () Bool)

(assert (=> b!1588916 (= e!887465 (and tp_is_empty!39583 tp!115444))))

(assert (= (and start!138882 res!1084288) b!1588915))

(assert (= (and start!138882 ((_ is Cons!37035) l!628)) b!1588916))

(declare-fun m!1457073 () Bool)

(assert (=> b!1588915 m!1457073))

(declare-fun m!1457075 () Bool)

(assert (=> b!1588915 m!1457075))

(check-sat (not b!1588915) (not b!1588916) tp_is_empty!39583)
(check-sat)
(get-model)

(declare-fun d!168657 () Bool)

(declare-fun lt!678440 () Int)

(assert (=> d!168657 (>= lt!678440 0)))

(declare-fun e!887480 () Int)

(assert (=> d!168657 (= lt!678440 e!887480)))

(declare-fun c!147870 () Bool)

(assert (=> d!168657 (= c!147870 ((_ is Nil!37036) (t!51962 l!628)))))

(assert (=> d!168657 (= (ListPrimitiveSize!238 (t!51962 l!628)) lt!678440)))

(declare-fun b!1588933 () Bool)

(assert (=> b!1588933 (= e!887480 0)))

(declare-fun b!1588934 () Bool)

(assert (=> b!1588934 (= e!887480 (+ 1 (ListPrimitiveSize!238 (t!51962 (t!51962 l!628)))))))

(assert (= (and d!168657 c!147870) b!1588933))

(assert (= (and d!168657 (not c!147870)) b!1588934))

(declare-fun m!1457085 () Bool)

(assert (=> b!1588934 m!1457085))

(assert (=> b!1588915 d!168657))

(declare-fun d!168659 () Bool)

(declare-fun lt!678441 () Int)

(assert (=> d!168659 (>= lt!678441 0)))

(declare-fun e!887481 () Int)

(assert (=> d!168659 (= lt!678441 e!887481)))

(declare-fun c!147871 () Bool)

(assert (=> d!168659 (= c!147871 ((_ is Nil!37036) l!628))))

(assert (=> d!168659 (= (ListPrimitiveSize!238 l!628) lt!678441)))

(declare-fun b!1588935 () Bool)

(assert (=> b!1588935 (= e!887481 0)))

(declare-fun b!1588936 () Bool)

(assert (=> b!1588936 (= e!887481 (+ 1 (ListPrimitiveSize!238 (t!51962 l!628))))))

(assert (= (and d!168659 c!147871) b!1588935))

(assert (= (and d!168659 (not c!147871)) b!1588936))

(assert (=> b!1588936 m!1457073))

(assert (=> b!1588915 d!168659))

(declare-fun b!1588941 () Bool)

(declare-fun e!887484 () Bool)

(declare-fun tp!115453 () Bool)

(assert (=> b!1588941 (= e!887484 (and tp_is_empty!39583 tp!115453))))

(assert (=> b!1588916 (= tp!115444 e!887484)))

(assert (= (and b!1588916 ((_ is Cons!37035) (t!51962 l!628))) b!1588941))

(check-sat (not b!1588934) (not b!1588936) (not b!1588941) tp_is_empty!39583)
(check-sat)
