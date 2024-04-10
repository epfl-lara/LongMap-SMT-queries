; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88912 () Bool)

(assert start!88912)

(declare-fun res!683860 () Bool)

(declare-fun e!574271 () Bool)

(assert (=> start!88912 (=> (not res!683860) (not e!574271))))

(declare-datatypes ((B!1724 0))(
  ( (B!1725 (val!11946 Int)) )
))
(declare-datatypes ((tuple2!15438 0))(
  ( (tuple2!15439 (_1!7730 (_ BitVec 64)) (_2!7730 B!1724)) )
))
(declare-datatypes ((List!21634 0))(
  ( (Nil!21631) (Cons!21630 (h!22828 tuple2!15438) (t!30644 List!21634)) )
))
(declare-fun l!1367 () List!21634)

(declare-fun isStrictlySorted!699 (List!21634) Bool)

(assert (=> start!88912 (= res!683860 (isStrictlySorted!699 l!1367))))

(assert (=> start!88912 e!574271))

(declare-fun e!574272 () Bool)

(assert (=> start!88912 e!574272))

(assert (=> start!88912 true))

(declare-fun tp_is_empty!23791 () Bool)

(assert (=> start!88912 tp_is_empty!23791))

(declare-fun b!1020294 () Bool)

(declare-fun res!683861 () Bool)

(assert (=> b!1020294 (=> (not res!683861) (not e!574271))))

(declare-fun value!188 () B!1724)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun contains!5925 (List!21634 tuple2!15438) Bool)

(assert (=> b!1020294 (= res!683861 (contains!5925 l!1367 (tuple2!15439 key!393 value!188)))))

(declare-fun b!1020295 () Bool)

(declare-fun ListPrimitiveSize!139 (List!21634) Int)

(assert (=> b!1020295 (= e!574271 (< (ListPrimitiveSize!139 l!1367) 0))))

(declare-fun b!1020296 () Bool)

(declare-fun tp!71236 () Bool)

(assert (=> b!1020296 (= e!574272 (and tp_is_empty!23791 tp!71236))))

(assert (= (and start!88912 res!683860) b!1020294))

(assert (= (and b!1020294 res!683861) b!1020295))

(assert (= (and start!88912 (is-Cons!21630 l!1367)) b!1020296))

(declare-fun m!940303 () Bool)

(assert (=> start!88912 m!940303))

(declare-fun m!940305 () Bool)

(assert (=> b!1020294 m!940305))

(declare-fun m!940307 () Bool)

(assert (=> b!1020295 m!940307))

(push 1)

(assert (not b!1020295))

(assert (not start!88912))

(assert tp_is_empty!23791)

(assert (not b!1020296))

(assert (not b!1020294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122329 () Bool)

(declare-fun res!683878 () Bool)

(declare-fun e!574291 () Bool)

(assert (=> d!122329 (=> res!683878 e!574291)))

(assert (=> d!122329 (= res!683878 (or (is-Nil!21631 l!1367) (is-Nil!21631 (t!30644 l!1367))))))

(assert (=> d!122329 (= (isStrictlySorted!699 l!1367) e!574291)))

(declare-fun b!1020323 () Bool)

(declare-fun e!574292 () Bool)

(assert (=> b!1020323 (= e!574291 e!574292)))

(declare-fun res!683879 () Bool)

(assert (=> b!1020323 (=> (not res!683879) (not e!574292))))

(assert (=> b!1020323 (= res!683879 (bvslt (_1!7730 (h!22828 l!1367)) (_1!7730 (h!22828 (t!30644 l!1367)))))))

(declare-fun b!1020324 () Bool)

(assert (=> b!1020324 (= e!574292 (isStrictlySorted!699 (t!30644 l!1367)))))

(assert (= (and d!122329 (not res!683878)) b!1020323))

(assert (= (and b!1020323 res!683879) b!1020324))

(declare-fun m!940321 () Bool)

(assert (=> b!1020324 m!940321))

(assert (=> start!88912 d!122329))

(declare-fun d!122335 () Bool)

(declare-fun lt!449840 () Int)

(assert (=> d!122335 (>= lt!449840 0)))

(declare-fun e!574300 () Int)

(assert (=> d!122335 (= lt!449840 e!574300)))

(declare-fun c!103498 () Bool)

(assert (=> d!122335 (= c!103498 (is-Nil!21631 l!1367))))

(assert (=> d!122335 (= (ListPrimitiveSize!139 l!1367) lt!449840)))

(declare-fun b!1020335 () Bool)

(assert (=> b!1020335 (= e!574300 0)))

(declare-fun b!1020336 () Bool)

(assert (=> b!1020336 (= e!574300 (+ 1 (ListPrimitiveSize!139 (t!30644 l!1367))))))

(assert (= (and d!122335 c!103498) b!1020335))

(assert (= (and d!122335 (not c!103498)) b!1020336))

(declare-fun m!940325 () Bool)

(assert (=> b!1020336 m!940325))

(assert (=> b!1020295 d!122335))

(declare-fun lt!449847 () Bool)

(declare-fun d!122339 () Bool)

(declare-fun content!495 (List!21634) (Set tuple2!15438))

(assert (=> d!122339 (= lt!449847 (set.member (tuple2!15439 key!393 value!188) (content!495 l!1367)))))

(declare-fun e!574318 () Bool)

(assert (=> d!122339 (= lt!449847 e!574318)))

(declare-fun res!683900 () Bool)

(assert (=> d!122339 (=> (not res!683900) (not e!574318))))

(assert (=> d!122339 (= res!683900 (is-Cons!21630 l!1367))))

(assert (=> d!122339 (= (contains!5925 l!1367 (tuple2!15439 key!393 value!188)) lt!449847)))

(declare-fun b!1020353 () Bool)

(declare-fun e!574317 () Bool)

(assert (=> b!1020353 (= e!574318 e!574317)))

(declare-fun res!683901 () Bool)

(assert (=> b!1020353 (=> res!683901 e!574317)))

(assert (=> b!1020353 (= res!683901 (= (h!22828 l!1367) (tuple2!15439 key!393 value!188)))))

(declare-fun b!1020354 () Bool)

(assert (=> b!1020354 (= e!574317 (contains!5925 (t!30644 l!1367) (tuple2!15439 key!393 value!188)))))

(assert (= (and d!122339 res!683900) b!1020353))

(assert (= (and b!1020353 (not res!683901)) b!1020354))

(declare-fun m!940339 () Bool)

(assert (=> d!122339 m!940339))

(declare-fun m!940341 () Bool)

(assert (=> d!122339 m!940341))

(declare-fun m!940343 () Bool)

(assert (=> b!1020354 m!940343))

(assert (=> b!1020294 d!122339))

(declare-fun b!1020365 () Bool)

(declare-fun e!574327 () Bool)

(declare-fun tp!71245 () Bool)

(assert (=> b!1020365 (= e!574327 (and tp_is_empty!23791 tp!71245))))

(assert (=> b!1020296 (= tp!71236 e!574327)))

(assert (= (and b!1020296 (is-Cons!21630 (t!30644 l!1367))) b!1020365))

(push 1)

(assert (not b!1020365))

(assert tp_is_empty!23791)

(assert (not d!122339))

(assert (not b!1020354))

(assert (not b!1020324))

(assert (not b!1020336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

