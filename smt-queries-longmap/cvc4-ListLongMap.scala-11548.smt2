; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134436 () Bool)

(assert start!134436)

(declare-fun res!1072695 () Bool)

(declare-fun e!875029 () Bool)

(assert (=> start!134436 (=> (not res!1072695) (not e!875029))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134436 (= res!1072695 (not (= key1!37 key2!21)))))

(assert (=> start!134436 e!875029))

(assert (=> start!134436 true))

(declare-fun e!875030 () Bool)

(assert (=> start!134436 e!875030))

(declare-fun b!1569646 () Bool)

(declare-fun res!1072694 () Bool)

(assert (=> b!1569646 (=> (not res!1072694) (not e!875029))))

(declare-datatypes ((B!2526 0))(
  ( (B!2527 (val!19625 Int)) )
))
(declare-datatypes ((tuple2!25352 0))(
  ( (tuple2!25353 (_1!12687 (_ BitVec 64)) (_2!12687 B!2526)) )
))
(declare-datatypes ((List!36745 0))(
  ( (Nil!36742) (Cons!36741 (h!38188 tuple2!25352) (t!51653 List!36745)) )
))
(declare-fun l!750 () List!36745)

(declare-fun isStrictlySorted!1012 (List!36745) Bool)

(assert (=> b!1569646 (= res!1072694 (isStrictlySorted!1012 l!750))))

(declare-fun b!1569647 () Bool)

(declare-fun ListPrimitiveSize!189 (List!36745) Int)

(assert (=> b!1569647 (= e!875029 (< (ListPrimitiveSize!189 l!750) 0))))

(declare-fun b!1569648 () Bool)

(declare-fun tp_is_empty!39077 () Bool)

(declare-fun tp!114153 () Bool)

(assert (=> b!1569648 (= e!875030 (and tp_is_empty!39077 tp!114153))))

(assert (= (and start!134436 res!1072695) b!1569646))

(assert (= (and b!1569646 res!1072694) b!1569647))

(assert (= (and start!134436 (is-Cons!36741 l!750)) b!1569648))

(declare-fun m!1443867 () Bool)

(assert (=> b!1569646 m!1443867))

(declare-fun m!1443869 () Bool)

(assert (=> b!1569647 m!1443869))

(push 1)

(assert (not b!1569646))

(assert (not b!1569647))

(assert (not b!1569648))

(assert tp_is_empty!39077)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163917 () Bool)

(declare-fun res!1072700 () Bool)

(declare-fun e!875038 () Bool)

(assert (=> d!163917 (=> res!1072700 e!875038)))

(assert (=> d!163917 (= res!1072700 (or (is-Nil!36742 l!750) (is-Nil!36742 (t!51653 l!750))))))

(assert (=> d!163917 (= (isStrictlySorted!1012 l!750) e!875038)))

(declare-fun b!1569659 () Bool)

(declare-fun e!875039 () Bool)

(assert (=> b!1569659 (= e!875038 e!875039)))

(declare-fun res!1072701 () Bool)

(assert (=> b!1569659 (=> (not res!1072701) (not e!875039))))

(assert (=> b!1569659 (= res!1072701 (bvslt (_1!12687 (h!38188 l!750)) (_1!12687 (h!38188 (t!51653 l!750)))))))

(declare-fun b!1569660 () Bool)

(assert (=> b!1569660 (= e!875039 (isStrictlySorted!1012 (t!51653 l!750)))))

(assert (= (and d!163917 (not res!1072700)) b!1569659))

(assert (= (and b!1569659 res!1072701) b!1569660))

(declare-fun m!1443873 () Bool)

(assert (=> b!1569660 m!1443873))

(assert (=> b!1569646 d!163917))

(declare-fun d!163925 () Bool)

(declare-fun lt!673324 () Int)

(assert (=> d!163925 (>= lt!673324 0)))

(declare-fun e!875049 () Int)

(assert (=> d!163925 (= lt!673324 e!875049)))

(declare-fun c!144783 () Bool)

(assert (=> d!163925 (= c!144783 (is-Nil!36742 l!750))))

(assert (=> d!163925 (= (ListPrimitiveSize!189 l!750) lt!673324)))

(declare-fun b!1569675 () Bool)

(assert (=> b!1569675 (= e!875049 0)))

(declare-fun b!1569676 () Bool)

(assert (=> b!1569676 (= e!875049 (+ 1 (ListPrimitiveSize!189 (t!51653 l!750))))))

(assert (= (and d!163925 c!144783) b!1569675))

(assert (= (and d!163925 (not c!144783)) b!1569676))

(declare-fun m!1443877 () Bool)

(assert (=> b!1569676 m!1443877))

(assert (=> b!1569647 d!163925))

(declare-fun b!1569687 () Bool)

(declare-fun e!875056 () Bool)

(declare-fun tp!114158 () Bool)

(assert (=> b!1569687 (= e!875056 (and tp_is_empty!39077 tp!114158))))

(assert (=> b!1569648 (= tp!114153 e!875056)))

(assert (= (and b!1569648 (is-Cons!36741 (t!51653 l!750))) b!1569687))

(push 1)

