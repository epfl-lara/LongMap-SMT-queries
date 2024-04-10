; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72002 () Bool)

(assert start!72002)

(declare-fun res!569009 () Bool)

(declare-fun e!466589 () Bool)

(assert (=> start!72002 (=> (not res!569009) (not e!466589))))

(declare-datatypes ((B!1188 0))(
  ( (B!1189 (val!7676 Int)) )
))
(declare-datatypes ((tuple2!10212 0))(
  ( (tuple2!10213 (_1!5117 (_ BitVec 64)) (_2!5117 B!1188)) )
))
(declare-datatypes ((List!15981 0))(
  ( (Nil!15978) (Cons!15977 (h!17108 tuple2!10212) (t!22352 List!15981)) )
))
(declare-fun l!390 () List!15981)

(declare-fun isStrictlySorted!451 (List!15981) Bool)

(assert (=> start!72002 (= res!569009 (isStrictlySorted!451 l!390))))

(assert (=> start!72002 e!466589))

(declare-fun e!466590 () Bool)

(assert (=> start!72002 e!466590))

(declare-fun b!836338 () Bool)

(declare-fun ListPrimitiveSize!69 (List!15981) Int)

(assert (=> b!836338 (= e!466589 (< (ListPrimitiveSize!69 l!390) 0))))

(declare-fun b!836339 () Bool)

(declare-fun tp_is_empty!15257 () Bool)

(declare-fun tp!47429 () Bool)

(assert (=> b!836339 (= e!466590 (and tp_is_empty!15257 tp!47429))))

(assert (= (and start!72002 res!569009) b!836338))

(assert (= (and start!72002 (is-Cons!15977 l!390)) b!836339))

(declare-fun m!781665 () Bool)

(assert (=> start!72002 m!781665))

(declare-fun m!781667 () Bool)

(assert (=> b!836338 m!781667))

(push 1)

(assert (not b!836338))

(assert (not start!72002))

(assert (not b!836339))

(assert tp_is_empty!15257)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107567 () Bool)

(declare-fun lt!380394 () Int)

(assert (=> d!107567 (>= lt!380394 0)))

(declare-fun e!466601 () Int)

(assert (=> d!107567 (= lt!380394 e!466601)))

(declare-fun c!91036 () Bool)

(assert (=> d!107567 (= c!91036 (is-Nil!15978 l!390))))

(assert (=> d!107567 (= (ListPrimitiveSize!69 l!390) lt!380394)))

(declare-fun b!836354 () Bool)

(assert (=> b!836354 (= e!466601 0)))

(declare-fun b!836355 () Bool)

(assert (=> b!836355 (= e!466601 (+ 1 (ListPrimitiveSize!69 (t!22352 l!390))))))

(assert (= (and d!107567 c!91036) b!836354))

(assert (= (and d!107567 (not c!91036)) b!836355))

(declare-fun m!781671 () Bool)

(assert (=> b!836355 m!781671))

(assert (=> b!836338 d!107567))

(declare-fun d!107573 () Bool)

(declare-fun res!569025 () Bool)

(declare-fun e!466618 () Bool)

(assert (=> d!107573 (=> res!569025 e!466618)))

(assert (=> d!107573 (= res!569025 (or (is-Nil!15978 l!390) (is-Nil!15978 (t!22352 l!390))))))

(assert (=> d!107573 (= (isStrictlySorted!451 l!390) e!466618)))

(declare-fun b!836378 () Bool)

(declare-fun e!466620 () Bool)

(assert (=> b!836378 (= e!466618 e!466620)))

(declare-fun res!569027 () Bool)

(assert (=> b!836378 (=> (not res!569027) (not e!466620))))

(assert (=> b!836378 (= res!569027 (bvslt (_1!5117 (h!17108 l!390)) (_1!5117 (h!17108 (t!22352 l!390)))))))

(declare-fun b!836380 () Bool)

(assert (=> b!836380 (= e!466620 (isStrictlySorted!451 (t!22352 l!390)))))

(assert (= (and d!107573 (not res!569025)) b!836378))

(assert (= (and b!836378 res!569027) b!836380))

(declare-fun m!781677 () Bool)

(assert (=> b!836380 m!781677))

(assert (=> start!72002 d!107573))

(declare-fun b!836389 () Bool)

(declare-fun e!466625 () Bool)

(declare-fun tp!47437 () Bool)

(assert (=> b!836389 (= e!466625 (and tp_is_empty!15257 tp!47437))))

