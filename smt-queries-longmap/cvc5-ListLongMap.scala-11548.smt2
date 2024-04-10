; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134432 () Bool)

(assert start!134432)

(declare-fun res!1072682 () Bool)

(declare-fun e!875017 () Bool)

(assert (=> start!134432 (=> (not res!1072682) (not e!875017))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134432 (= res!1072682 (not (= key1!37 key2!21)))))

(assert (=> start!134432 e!875017))

(assert (=> start!134432 true))

(declare-fun e!875018 () Bool)

(assert (=> start!134432 e!875018))

(declare-fun b!1569628 () Bool)

(declare-fun res!1072683 () Bool)

(assert (=> b!1569628 (=> (not res!1072683) (not e!875017))))

(declare-datatypes ((B!2522 0))(
  ( (B!2523 (val!19623 Int)) )
))
(declare-datatypes ((tuple2!25348 0))(
  ( (tuple2!25349 (_1!12685 (_ BitVec 64)) (_2!12685 B!2522)) )
))
(declare-datatypes ((List!36743 0))(
  ( (Nil!36740) (Cons!36739 (h!38186 tuple2!25348) (t!51651 List!36743)) )
))
(declare-fun l!750 () List!36743)

(declare-fun isStrictlySorted!1010 (List!36743) Bool)

(assert (=> b!1569628 (= res!1072683 (isStrictlySorted!1010 l!750))))

(declare-fun b!1569629 () Bool)

(declare-fun ListPrimitiveSize!187 (List!36743) Int)

(assert (=> b!1569629 (= e!875017 (< (ListPrimitiveSize!187 l!750) 0))))

(declare-fun b!1569630 () Bool)

(declare-fun tp_is_empty!39073 () Bool)

(declare-fun tp!114147 () Bool)

(assert (=> b!1569630 (= e!875018 (and tp_is_empty!39073 tp!114147))))

(assert (= (and start!134432 res!1072682) b!1569628))

(assert (= (and b!1569628 res!1072683) b!1569629))

(assert (= (and start!134432 (is-Cons!36739 l!750)) b!1569630))

(declare-fun m!1443859 () Bool)

(assert (=> b!1569628 m!1443859))

(declare-fun m!1443861 () Bool)

(assert (=> b!1569629 m!1443861))

(push 1)

(assert (not b!1569629))

(assert (not b!1569628))

(assert (not b!1569630))

(assert tp_is_empty!39073)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163921 () Bool)

(declare-fun lt!673323 () Int)

(assert (=> d!163921 (>= lt!673323 0)))

(declare-fun e!875048 () Int)

(assert (=> d!163921 (= lt!673323 e!875048)))

(declare-fun c!144782 () Bool)

(assert (=> d!163921 (= c!144782 (is-Nil!36740 l!750))))

(assert (=> d!163921 (= (ListPrimitiveSize!187 l!750) lt!673323)))

(declare-fun b!1569673 () Bool)

(assert (=> b!1569673 (= e!875048 0)))

(declare-fun b!1569674 () Bool)

(assert (=> b!1569674 (= e!875048 (+ 1 (ListPrimitiveSize!187 (t!51651 l!750))))))

(assert (= (and d!163921 c!144782) b!1569673))

(assert (= (and d!163921 (not c!144782)) b!1569674))

(declare-fun m!1443875 () Bool)

(assert (=> b!1569674 m!1443875))

(assert (=> b!1569629 d!163921))

(declare-fun d!163927 () Bool)

(declare-fun res!1072712 () Bool)

(declare-fun e!875062 () Bool)

(assert (=> d!163927 (=> res!1072712 e!875062)))

(assert (=> d!163927 (= res!1072712 (or (is-Nil!36740 l!750) (is-Nil!36740 (t!51651 l!750))))))

(assert (=> d!163927 (= (isStrictlySorted!1010 l!750) e!875062)))

(declare-fun b!1569693 () Bool)

(declare-fun e!875063 () Bool)

(assert (=> b!1569693 (= e!875062 e!875063)))

(declare-fun res!1072713 () Bool)

(assert (=> b!1569693 (=> (not res!1072713) (not e!875063))))

(assert (=> b!1569693 (= res!1072713 (bvslt (_1!12685 (h!38186 l!750)) (_1!12685 (h!38186 (t!51651 l!750)))))))

(declare-fun b!1569694 () Bool)

(assert (=> b!1569694 (= e!875063 (isStrictlySorted!1010 (t!51651 l!750)))))

(assert (= (and d!163927 (not res!1072712)) b!1569693))

(assert (= (and b!1569693 res!1072713) b!1569694))

(declare-fun m!1443881 () Bool)

(assert (=> b!1569694 m!1443881))

(assert (=> b!1569628 d!163927))

(declare-fun b!1569699 () Bool)

(declare-fun e!875066 () Bool)

(declare-fun tp!114162 () Bool)

(assert (=> b!1569699 (= e!875066 (and tp_is_empty!39073 tp!114162))))

(assert (=> b!1569630 (= tp!114147 e!875066)))

(assert (= (and b!1569630 (is-Cons!36739 (t!51651 l!750))) b!1569699))

(push 1)

