; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1794 () Bool)

(assert start!1794)

(declare-fun b!12572 () Bool)

(declare-fun res!10091 () Bool)

(declare-fun e!7522 () Bool)

(assert (=> b!12572 (=> (not res!10091) (not e!7522))))

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((B!458 0))(
  ( (B!459 (val!324 Int)) )
))
(declare-fun v!194 () B!458)

(declare-datatypes ((tuple2!448 0))(
  ( (tuple2!449 (_1!224 (_ BitVec 64)) (_2!224 B!458)) )
))
(declare-datatypes ((List!376 0))(
  ( (Nil!373) (Cons!372 (h!938 tuple2!448) (t!2763 List!376)) )
))
(declare-fun l!1094 () List!376)

(declare-datatypes ((Option!56 0))(
  ( (Some!55 (v!1376 B!458)) (None!54) )
))
(declare-fun getValueByKey!50 (List!376 (_ BitVec 64)) Option!56)

(assert (=> b!12572 (= res!10091 (= (getValueByKey!50 l!1094 key!303) (Some!55 v!194)))))

(declare-fun res!10093 () Bool)

(assert (=> start!1794 (=> (not res!10093) (not e!7522))))

(declare-fun isStrictlySorted!69 (List!376) Bool)

(assert (=> start!1794 (= res!10093 (isStrictlySorted!69 l!1094))))

(assert (=> start!1794 e!7522))

(declare-fun e!7523 () Bool)

(assert (=> start!1794 e!7523))

(assert (=> start!1794 true))

(declare-fun tp_is_empty!631 () Bool)

(assert (=> start!1794 tp_is_empty!631))

(declare-fun b!12575 () Bool)

(declare-fun tp!2096 () Bool)

(assert (=> b!12575 (= e!7523 (and tp_is_empty!631 tp!2096))))

(declare-fun b!12573 () Bool)

(declare-fun res!10092 () Bool)

(assert (=> b!12573 (=> (not res!10092) (not e!7522))))

(assert (=> b!12573 (= res!10092 (or (not (is-Cons!372 l!1094)) (= (_1!224 (h!938 l!1094)) key!303)))))

(declare-fun b!12574 () Bool)

(declare-fun contains!186 (List!376 tuple2!448) Bool)

(assert (=> b!12574 (= e!7522 (not (contains!186 l!1094 (tuple2!449 key!303 v!194))))))

(assert (= (and start!1794 res!10093) b!12572))

(assert (= (and b!12572 res!10091) b!12573))

(assert (= (and b!12573 res!10092) b!12574))

(assert (= (and start!1794 (is-Cons!372 l!1094)) b!12575))

(declare-fun m!8549 () Bool)

(assert (=> b!12572 m!8549))

(declare-fun m!8551 () Bool)

(assert (=> start!1794 m!8551))

(declare-fun m!8553 () Bool)

(assert (=> b!12574 m!8553))

(push 1)

(assert tp_is_empty!631)

(assert (not start!1794))

(assert (not b!12574))

(assert (not b!12575))

(assert (not b!12572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1799 () Bool)

(declare-fun res!10120 () Bool)

(declare-fun e!7544 () Bool)

(assert (=> d!1799 (=> res!10120 e!7544)))

(assert (=> d!1799 (= res!10120 (or (is-Nil!373 l!1094) (is-Nil!373 (t!2763 l!1094))))))

(assert (=> d!1799 (= (isStrictlySorted!69 l!1094) e!7544)))

(declare-fun b!12608 () Bool)

(declare-fun e!7545 () Bool)

(assert (=> b!12608 (= e!7544 e!7545)))

(declare-fun res!10121 () Bool)

(assert (=> b!12608 (=> (not res!10121) (not e!7545))))

(assert (=> b!12608 (= res!10121 (bvslt (_1!224 (h!938 l!1094)) (_1!224 (h!938 (t!2763 l!1094)))))))

(declare-fun b!12609 () Bool)

(assert (=> b!12609 (= e!7545 (isStrictlySorted!69 (t!2763 l!1094)))))

(assert (= (and d!1799 (not res!10120)) b!12608))

(assert (= (and b!12608 res!10121) b!12609))

(declare-fun m!8567 () Bool)

(assert (=> b!12609 m!8567))

(assert (=> start!1794 d!1799))

(declare-fun d!1803 () Bool)

(declare-fun lt!3179 () Bool)

(declare-fun content!11 (List!376) (Set tuple2!448))

(assert (=> d!1803 (= lt!3179 (set.member (tuple2!449 key!303 v!194) (content!11 l!1094)))))

(declare-fun e!7563 () Bool)

(assert (=> d!1803 (= lt!3179 e!7563)))

(declare-fun res!10139 () Bool)

(assert (=> d!1803 (=> (not res!10139) (not e!7563))))

(assert (=> d!1803 (= res!10139 (is-Cons!372 l!1094))))

(assert (=> d!1803 (= (contains!186 l!1094 (tuple2!449 key!303 v!194)) lt!3179)))

(declare-fun b!12626 () Bool)

(declare-fun e!7562 () Bool)

(assert (=> b!12626 (= e!7563 e!7562)))

(declare-fun res!10138 () Bool)

(assert (=> b!12626 (=> res!10138 e!7562)))

(assert (=> b!12626 (= res!10138 (= (h!938 l!1094) (tuple2!449 key!303 v!194)))))

(declare-fun b!12627 () Bool)

(assert (=> b!12627 (= e!7562 (contains!186 (t!2763 l!1094) (tuple2!449 key!303 v!194)))))

(assert (= (and d!1803 res!10139) b!12626))

(assert (= (and b!12626 (not res!10138)) b!12627))

(declare-fun m!8573 () Bool)

(assert (=> d!1803 m!8573))

(declare-fun m!8575 () Bool)

(assert (=> d!1803 m!8575))

(declare-fun m!8577 () Bool)

(assert (=> b!12627 m!8577))

(assert (=> b!12574 d!1803))

(declare-fun b!12646 () Bool)

(declare-fun e!7577 () Option!56)

(assert (=> b!12646 (= e!7577 (getValueByKey!50 (t!2763 l!1094) key!303))))

(declare-fun b!12644 () Bool)

(declare-fun e!7576 () Option!56)

(assert (=> b!12644 (= e!7576 (Some!55 (_2!224 (h!938 l!1094))))))

(declare-fun b!12645 () Bool)

(assert (=> b!12645 (= e!7576 e!7577)))

(declare-fun c!1130 () Bool)

(assert (=> b!12645 (= c!1130 (and (is-Cons!372 l!1094) (not (= (_1!224 (h!938 l!1094)) key!303))))))

(declare-fun d!1809 () Bool)

(declare-fun c!1129 () Bool)

(assert (=> d!1809 (= c!1129 (and (is-Cons!372 l!1094) (= (_1!224 (h!938 l!1094)) key!303)))))

(assert (=> d!1809 (= (getValueByKey!50 l!1094 key!303) e!7576)))

(declare-fun b!12647 () Bool)

(assert (=> b!12647 (= e!7577 None!54)))

(assert (= (and d!1809 c!1129) b!12644))

(assert (= (and d!1809 (not c!1129)) b!12645))

(assert (= (and b!12645 c!1130) b!12646))

(assert (= (and b!12645 (not c!1130)) b!12647))

(declare-fun m!8589 () Bool)

(assert (=> b!12646 m!8589))

(assert (=> b!12572 d!1809))

(declare-fun b!12660 () Bool)

(declare-fun e!7584 () Bool)

(declare-fun tp!2105 () Bool)

(assert (=> b!12660 (= e!7584 (and tp_is_empty!631 tp!2105))))

(assert (=> b!12575 (= tp!2096 e!7584)))

(assert (= (and b!12575 (is-Cons!372 (t!2763 l!1094))) b!12660))

(push 1)

(assert (not b!12627))

(assert (not b!12609))

(assert (not b!12660))

(assert tp_is_empty!631)

(assert (not d!1803))

(assert (not b!12646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

