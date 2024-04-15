; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138354 () Bool)

(assert start!138354)

(declare-fun res!1083165 () Bool)

(declare-fun e!885557 () Bool)

(assert (=> start!138354 (=> (not res!1083165) (not e!885557))))

(declare-datatypes ((B!3030 0))(
  ( (B!3031 (val!19877 Int)) )
))
(declare-datatypes ((tuple2!25990 0))(
  ( (tuple2!25991 (_1!13006 (_ BitVec 64)) (_2!13006 B!3030)) )
))
(declare-datatypes ((List!37038 0))(
  ( (Nil!37035) (Cons!37034 (h!38578 tuple2!25990) (t!51960 List!37038)) )
))
(declare-fun l!636 () List!37038)

(declare-fun isStrictlySorted!1217 (List!37038) Bool)

(assert (=> start!138354 (= res!1083165 (isStrictlySorted!1217 l!636))))

(assert (=> start!138354 e!885557))

(declare-fun e!885558 () Bool)

(assert (=> start!138354 e!885558))

(declare-fun b!1585887 () Bool)

(declare-fun ListPrimitiveSize!231 (List!37038) Int)

(assert (=> b!1585887 (= e!885557 (< (ListPrimitiveSize!231 l!636) 0))))

(declare-fun b!1585888 () Bool)

(declare-fun tp_is_empty!39563 () Bool)

(declare-fun tp!115386 () Bool)

(assert (=> b!1585888 (= e!885558 (and tp_is_empty!39563 tp!115386))))

(assert (= (and start!138354 res!1083165) b!1585887))

(assert (= (and start!138354 (is-Cons!37034 l!636)) b!1585888))

(declare-fun m!1453805 () Bool)

(assert (=> start!138354 m!1453805))

(declare-fun m!1453807 () Bool)

(assert (=> b!1585887 m!1453807))

(push 1)

(assert (not b!1585887))

(assert (not start!138354))

(assert (not b!1585888))

(assert tp_is_empty!39563)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167643 () Bool)

(declare-fun lt!677218 () Int)

(assert (=> d!167643 (>= lt!677218 0)))

(declare-fun e!885563 () Int)

(assert (=> d!167643 (= lt!677218 e!885563)))

(declare-fun c!146949 () Bool)

(assert (=> d!167643 (= c!146949 (is-Nil!37035 l!636))))

(assert (=> d!167643 (= (ListPrimitiveSize!231 l!636) lt!677218)))

(declare-fun b!1585897 () Bool)

(assert (=> b!1585897 (= e!885563 0)))

(declare-fun b!1585898 () Bool)

(assert (=> b!1585898 (= e!885563 (+ 1 (ListPrimitiveSize!231 (t!51960 l!636))))))

(assert (= (and d!167643 c!146949) b!1585897))

(assert (= (and d!167643 (not c!146949)) b!1585898))

(declare-fun m!1453809 () Bool)

(assert (=> b!1585898 m!1453809))

(assert (=> b!1585887 d!167643))

(declare-fun d!167647 () Bool)

(declare-fun res!1083176 () Bool)

(declare-fun e!885575 () Bool)

(assert (=> d!167647 (=> res!1083176 e!885575)))

(assert (=> d!167647 (= res!1083176 (or (is-Nil!37035 l!636) (is-Nil!37035 (t!51960 l!636))))))

(assert (=> d!167647 (= (isStrictlySorted!1217 l!636) e!885575)))

(declare-fun b!1585911 () Bool)

(declare-fun e!885576 () Bool)

(assert (=> b!1585911 (= e!885575 e!885576)))

(declare-fun res!1083177 () Bool)

(assert (=> b!1585911 (=> (not res!1083177) (not e!885576))))

(assert (=> b!1585911 (= res!1083177 (bvslt (_1!13006 (h!38578 l!636)) (_1!13006 (h!38578 (t!51960 l!636)))))))

(declare-fun b!1585912 () Bool)

(assert (=> b!1585912 (= e!885576 (isStrictlySorted!1217 (t!51960 l!636)))))

(assert (= (and d!167647 (not res!1083176)) b!1585911))

(assert (= (and b!1585911 res!1083177) b!1585912))

(declare-fun m!1453815 () Bool)

(assert (=> b!1585912 m!1453815))

(assert (=> start!138354 d!167647))

(declare-fun b!1585921 () Bool)

(declare-fun e!885583 () Bool)

(declare-fun tp!115389 () Bool)

(assert (=> b!1585921 (= e!885583 (and tp_is_empty!39563 tp!115389))))

(assert (=> b!1585888 (= tp!115386 e!885583)))

(assert (= (and b!1585888 (is-Cons!37034 (t!51960 l!636))) b!1585921))

(push 1)

(assert (not b!1585912))

(assert (not b!1585898))

(assert (not b!1585921))

(assert tp_is_empty!39563)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

