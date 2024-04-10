; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71998 () Bool)

(assert start!71998)

(declare-fun res!569003 () Bool)

(declare-fun e!466577 () Bool)

(assert (=> start!71998 (=> (not res!569003) (not e!466577))))

(declare-datatypes ((B!1184 0))(
  ( (B!1185 (val!7674 Int)) )
))
(declare-datatypes ((tuple2!10208 0))(
  ( (tuple2!10209 (_1!5115 (_ BitVec 64)) (_2!5115 B!1184)) )
))
(declare-datatypes ((List!15979 0))(
  ( (Nil!15976) (Cons!15975 (h!17106 tuple2!10208) (t!22350 List!15979)) )
))
(declare-fun l!390 () List!15979)

(declare-fun isStrictlySorted!449 (List!15979) Bool)

(assert (=> start!71998 (= res!569003 (isStrictlySorted!449 l!390))))

(assert (=> start!71998 e!466577))

(declare-fun e!466578 () Bool)

(assert (=> start!71998 e!466578))

(declare-fun b!836326 () Bool)

(declare-fun ListPrimitiveSize!67 (List!15979) Int)

(assert (=> b!836326 (= e!466577 (< (ListPrimitiveSize!67 l!390) 0))))

(declare-fun b!836327 () Bool)

(declare-fun tp_is_empty!15253 () Bool)

(declare-fun tp!47423 () Bool)

(assert (=> b!836327 (= e!466578 (and tp_is_empty!15253 tp!47423))))

(assert (= (and start!71998 res!569003) b!836326))

(assert (= (and start!71998 (is-Cons!15975 l!390)) b!836327))

(declare-fun m!781657 () Bool)

(assert (=> start!71998 m!781657))

(declare-fun m!781659 () Bool)

(assert (=> b!836326 m!781659))

(push 1)

(assert (not b!836326))

(assert (not start!71998))

(assert (not b!836327))

(assert tp_is_empty!15253)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107569 () Bool)

(declare-fun lt!380397 () Int)

(assert (=> d!107569 (>= lt!380397 0)))

(declare-fun e!466602 () Int)

(assert (=> d!107569 (= lt!380397 e!466602)))

(declare-fun c!91037 () Bool)

(assert (=> d!107569 (= c!91037 (is-Nil!15976 l!390))))

(assert (=> d!107569 (= (ListPrimitiveSize!67 l!390) lt!380397)))

(declare-fun b!836359 () Bool)

(assert (=> b!836359 (= e!466602 0)))

(declare-fun b!836361 () Bool)

(assert (=> b!836361 (= e!466602 (+ 1 (ListPrimitiveSize!67 (t!22350 l!390))))))

(assert (= (and d!107569 c!91037) b!836359))

(assert (= (and d!107569 (not c!91037)) b!836361))

(declare-fun m!781673 () Bool)

(assert (=> b!836361 m!781673))

(assert (=> b!836326 d!107569))

(declare-fun d!107575 () Bool)

(declare-fun res!569024 () Bool)

(declare-fun e!466617 () Bool)

(assert (=> d!107575 (=> res!569024 e!466617)))

(assert (=> d!107575 (= res!569024 (or (is-Nil!15976 l!390) (is-Nil!15976 (t!22350 l!390))))))

(assert (=> d!107575 (= (isStrictlySorted!449 l!390) e!466617)))

(declare-fun b!836377 () Bool)

(declare-fun e!466619 () Bool)

(assert (=> b!836377 (= e!466617 e!466619)))

(declare-fun res!569026 () Bool)

(assert (=> b!836377 (=> (not res!569026) (not e!466619))))

(assert (=> b!836377 (= res!569026 (bvslt (_1!5115 (h!17106 l!390)) (_1!5115 (h!17106 (t!22350 l!390)))))))

(declare-fun b!836379 () Bool)

(assert (=> b!836379 (= e!466619 (isStrictlySorted!449 (t!22350 l!390)))))

(assert (= (and d!107575 (not res!569024)) b!836377))

(assert (= (and b!836377 res!569026) b!836379))

(declare-fun m!781679 () Bool)

(assert (=> b!836379 m!781679))

(assert (=> start!71998 d!107575))

(declare-fun b!836390 () Bool)

(declare-fun e!466626 () Bool)

(declare-fun tp!47438 () Bool)

(assert (=> b!836390 (= e!466626 (and tp_is_empty!15253 tp!47438))))

(assert (=> b!836327 (= tp!47423 e!466626)))

(assert (= (and b!836327 (is-Cons!15975 (t!22350 l!390))) b!836390))

(push 1)

