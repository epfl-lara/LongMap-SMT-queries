; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88916 () Bool)

(assert start!88916)

(declare-fun res!683873 () Bool)

(declare-fun e!574284 () Bool)

(assert (=> start!88916 (=> (not res!683873) (not e!574284))))

(declare-datatypes ((B!1728 0))(
  ( (B!1729 (val!11948 Int)) )
))
(declare-datatypes ((tuple2!15442 0))(
  ( (tuple2!15443 (_1!7732 (_ BitVec 64)) (_2!7732 B!1728)) )
))
(declare-datatypes ((List!21636 0))(
  ( (Nil!21633) (Cons!21632 (h!22830 tuple2!15442) (t!30646 List!21636)) )
))
(declare-fun l!1367 () List!21636)

(declare-fun isStrictlySorted!701 (List!21636) Bool)

(assert (=> start!88916 (= res!683873 (isStrictlySorted!701 l!1367))))

(assert (=> start!88916 e!574284))

(declare-fun e!574283 () Bool)

(assert (=> start!88916 e!574283))

(assert (=> start!88916 true))

(declare-fun tp_is_empty!23795 () Bool)

(assert (=> start!88916 tp_is_empty!23795))

(declare-fun b!1020312 () Bool)

(declare-fun res!683872 () Bool)

(assert (=> b!1020312 (=> (not res!683872) (not e!574284))))

(declare-fun value!188 () B!1728)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun contains!5927 (List!21636 tuple2!15442) Bool)

(assert (=> b!1020312 (= res!683872 (contains!5927 l!1367 (tuple2!15443 key!393 value!188)))))

(declare-fun b!1020313 () Bool)

(declare-fun ListPrimitiveSize!141 (List!21636) Int)

(assert (=> b!1020313 (= e!574284 (< (ListPrimitiveSize!141 l!1367) 0))))

(declare-fun b!1020314 () Bool)

(declare-fun tp!71242 () Bool)

(assert (=> b!1020314 (= e!574283 (and tp_is_empty!23795 tp!71242))))

(assert (= (and start!88916 res!683873) b!1020312))

(assert (= (and b!1020312 res!683872) b!1020313))

(assert (= (and start!88916 (is-Cons!21632 l!1367)) b!1020314))

(declare-fun m!940315 () Bool)

(assert (=> start!88916 m!940315))

(declare-fun m!940317 () Bool)

(assert (=> b!1020312 m!940317))

(declare-fun m!940319 () Bool)

(assert (=> b!1020313 m!940319))

(push 1)

(assert (not b!1020314))

(assert (not start!88916))

(assert tp_is_empty!23795)

(assert (not b!1020312))

(assert (not b!1020313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!449843 () Bool)

(declare-fun d!122333 () Bool)

(declare-fun content!493 (List!21636) (Set tuple2!15442))

(assert (=> d!122333 (= lt!449843 (member (tuple2!15443 key!393 value!188) (content!493 l!1367)))))

(declare-fun e!574306 () Bool)

(assert (=> d!122333 (= lt!449843 e!574306)))

(declare-fun res!683889 () Bool)

(assert (=> d!122333 (=> (not res!683889) (not e!574306))))

(assert (=> d!122333 (= res!683889 (is-Cons!21632 l!1367))))

(assert (=> d!122333 (= (contains!5927 l!1367 (tuple2!15443 key!393 value!188)) lt!449843)))

(declare-fun b!1020341 () Bool)

(declare-fun e!574305 () Bool)

(assert (=> b!1020341 (= e!574306 e!574305)))

(declare-fun res!683888 () Bool)

(assert (=> b!1020341 (=> res!683888 e!574305)))

(assert (=> b!1020341 (= res!683888 (= (h!22830 l!1367) (tuple2!15443 key!393 value!188)))))

(declare-fun b!1020342 () Bool)

(assert (=> b!1020342 (= e!574305 (contains!5927 (t!30646 l!1367) (tuple2!15443 key!393 value!188)))))

(assert (= (and d!122333 res!683889) b!1020341))

(assert (= (and b!1020341 (not res!683888)) b!1020342))

(declare-fun m!940327 () Bool)

(assert (=> d!122333 m!940327))

(declare-fun m!940329 () Bool)

(assert (=> d!122333 m!940329))

(declare-fun m!940331 () Bool)

(assert (=> b!1020342 m!940331))

(assert (=> b!1020312 d!122333))

(declare-fun d!122341 () Bool)

(declare-fun res!683904 () Bool)

(declare-fun e!574321 () Bool)

(assert (=> d!122341 (=> res!683904 e!574321)))

(assert (=> d!122341 (= res!683904 (or (is-Nil!21633 l!1367) (is-Nil!21633 (t!30646 l!1367))))))

(assert (=> d!122341 (= (isStrictlySorted!701 l!1367) e!574321)))

(declare-fun b!1020357 () Bool)

(declare-fun e!574322 () Bool)

(assert (=> b!1020357 (= e!574321 e!574322)))

(declare-fun res!683905 () Bool)

(assert (=> b!1020357 (=> (not res!683905) (not e!574322))))

(assert (=> b!1020357 (= res!683905 (bvslt (_1!7732 (h!22830 l!1367)) (_1!7732 (h!22830 (t!30646 l!1367)))))))

(declare-fun b!1020358 () Bool)

(assert (=> b!1020358 (= e!574322 (isStrictlySorted!701 (t!30646 l!1367)))))

(assert (= (and d!122341 (not res!683904)) b!1020357))

(assert (= (and b!1020357 res!683905) b!1020358))

(declare-fun m!940345 () Bool)

(assert (=> b!1020358 m!940345))

(assert (=> start!88916 d!122341))

(declare-fun d!122345 () Bool)

(declare-fun lt!449850 () Int)

(assert (=> d!122345 (>= lt!449850 0)))

(declare-fun e!574335 () Int)

(assert (=> d!122345 (= lt!449850 e!574335)))

(declare-fun c!103501 () Bool)

(assert (=> d!122345 (= c!103501 (is-Nil!21633 l!1367))))

(assert (=> d!122345 (= (ListPrimitiveSize!141 l!1367) lt!449850)))

(declare-fun b!1020377 () Bool)

(assert (=> b!1020377 (= e!574335 0)))

(declare-fun b!1020378 () Bool)

