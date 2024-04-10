; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72020 () Bool)

(assert start!72020)

(declare-fun res!569045 () Bool)

(declare-fun e!466643 () Bool)

(assert (=> start!72020 (=> (not res!569045) (not e!466643))))

(declare-datatypes ((B!1194 0))(
  ( (B!1195 (val!7679 Int)) )
))
(declare-datatypes ((tuple2!10218 0))(
  ( (tuple2!10219 (_1!5120 (_ BitVec 64)) (_2!5120 B!1194)) )
))
(declare-datatypes ((List!15984 0))(
  ( (Nil!15981) (Cons!15980 (h!17111 tuple2!10218) (t!22355 List!15984)) )
))
(declare-fun l!390 () List!15984)

(declare-fun isStrictlySorted!454 (List!15984) Bool)

(assert (=> start!72020 (= res!569045 (isStrictlySorted!454 l!390))))

(assert (=> start!72020 e!466643))

(declare-fun e!466644 () Bool)

(assert (=> start!72020 e!466644))

(declare-fun b!836415 () Bool)

(declare-fun res!569044 () Bool)

(assert (=> b!836415 (=> (not res!569044) (not e!466643))))

(assert (=> b!836415 (= res!569044 (is-Cons!15980 l!390))))

(declare-fun b!836416 () Bool)

(declare-fun ListPrimitiveSize!72 (List!15984) Int)

(assert (=> b!836416 (= e!466643 (>= (ListPrimitiveSize!72 (t!22355 l!390)) (ListPrimitiveSize!72 l!390)))))

(declare-fun b!836417 () Bool)

(declare-fun tp_is_empty!15263 () Bool)

(declare-fun tp!47447 () Bool)

(assert (=> b!836417 (= e!466644 (and tp_is_empty!15263 tp!47447))))

(assert (= (and start!72020 res!569045) b!836415))

(assert (= (and b!836415 res!569044) b!836416))

(assert (= (and start!72020 (is-Cons!15980 l!390)) b!836417))

(declare-fun m!781693 () Bool)

(assert (=> start!72020 m!781693))

(declare-fun m!781695 () Bool)

(assert (=> b!836416 m!781695))

(declare-fun m!781697 () Bool)

(assert (=> b!836416 m!781697))

(push 1)

(assert (not start!72020))

(assert (not b!836416))

(assert (not b!836417))

(assert tp_is_empty!15263)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107581 () Bool)

(declare-fun res!569056 () Bool)

(declare-fun e!466655 () Bool)

(assert (=> d!107581 (=> res!569056 e!466655)))

(assert (=> d!107581 (= res!569056 (or (is-Nil!15981 l!390) (is-Nil!15981 (t!22355 l!390))))))

(assert (=> d!107581 (= (isStrictlySorted!454 l!390) e!466655)))

(declare-fun b!836428 () Bool)

(declare-fun e!466656 () Bool)

(assert (=> b!836428 (= e!466655 e!466656)))

(declare-fun res!569057 () Bool)

(assert (=> b!836428 (=> (not res!569057) (not e!466656))))

(assert (=> b!836428 (= res!569057 (bvslt (_1!5120 (h!17111 l!390)) (_1!5120 (h!17111 (t!22355 l!390)))))))

(declare-fun b!836429 () Bool)

(assert (=> b!836429 (= e!466656 (isStrictlySorted!454 (t!22355 l!390)))))

(assert (= (and d!107581 (not res!569056)) b!836428))

(assert (= (and b!836428 res!569057) b!836429))

(declare-fun m!781701 () Bool)

(assert (=> b!836429 m!781701))

(assert (=> start!72020 d!107581))

(declare-fun d!107585 () Bool)

(declare-fun lt!380404 () Int)

(assert (=> d!107585 (>= lt!380404 0)))

(declare-fun e!466662 () Int)

(assert (=> d!107585 (= lt!380404 e!466662)))

(declare-fun c!91046 () Bool)

(assert (=> d!107585 (= c!91046 (is-Nil!15981 (t!22355 l!390)))))

(assert (=> d!107585 (= (ListPrimitiveSize!72 (t!22355 l!390)) lt!380404)))

(declare-fun b!836439 () Bool)

(assert (=> b!836439 (= e!466662 0)))

(declare-fun b!836441 () Bool)

(assert (=> b!836441 (= e!466662 (+ 1 (ListPrimitiveSize!72 (t!22355 (t!22355 l!390)))))))

(assert (= (and d!107585 c!91046) b!836439))

(assert (= (and d!107585 (not c!91046)) b!836441))

(declare-fun m!781703 () Bool)

(assert (=> b!836441 m!781703))

(assert (=> b!836416 d!107585))

(declare-fun d!107590 () Bool)

(declare-fun lt!380406 () Int)

(assert (=> d!107590 (>= lt!380406 0)))

(declare-fun e!466664 () Int)

(assert (=> d!107590 (= lt!380406 e!466664)))

(declare-fun c!91048 () Bool)

(assert (=> d!107590 (= c!91048 (is-Nil!15981 l!390))))

(assert (=> d!107590 (= (ListPrimitiveSize!72 l!390) lt!380406)))

(declare-fun b!836443 () Bool)

(assert (=> b!836443 (= e!466664 0)))

(declare-fun b!836445 () Bool)

(assert (=> b!836445 (= e!466664 (+ 1 (ListPrimitiveSize!72 (t!22355 l!390))))))

(assert (= (and d!107590 c!91048) b!836443))

(assert (= (and d!107590 (not c!91048)) b!836445))

(assert (=> b!836445 m!781695))

(assert (=> b!836416 d!107590))

(declare-fun b!836455 () Bool)

(declare-fun e!466670 () Bool)

(declare-fun tp!47453 () Bool)

(assert (=> b!836455 (= e!466670 (and tp_is_empty!15263 tp!47453))))

(assert (=> b!836417 (= tp!47447 e!466670)))

(assert (= (and b!836417 (is-Cons!15980 (t!22355 l!390))) b!836455))

(push 1)

