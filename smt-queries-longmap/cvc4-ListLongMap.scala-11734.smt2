; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137602 () Bool)

(assert start!137602)

(declare-fun b!1582244 () Bool)

(declare-fun res!1080969 () Bool)

(declare-fun e!882989 () Bool)

(assert (=> b!1582244 (=> (not res!1080969) (not e!882989))))

(declare-datatypes ((B!2748 0))(
  ( (B!2749 (val!19736 Int)) )
))
(declare-datatypes ((tuple2!25640 0))(
  ( (tuple2!25641 (_1!12831 (_ BitVec 64)) (_2!12831 B!2748)) )
))
(declare-datatypes ((List!36856 0))(
  ( (Nil!36853) (Cons!36852 (h!38395 tuple2!25640) (t!51770 List!36856)) )
))
(declare-fun l!1356 () List!36856)

(assert (=> b!1582244 (= res!1080969 (not (is-Nil!36853 l!1356)))))

(declare-fun b!1582243 () Bool)

(declare-fun res!1080968 () Bool)

(assert (=> b!1582243 (=> (not res!1080968) (not e!882989))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!957 (List!36856 (_ BitVec 64)) Bool)

(assert (=> b!1582243 (= res!1080968 (not (containsKey!957 l!1356 key!387)))))

(declare-fun b!1582246 () Bool)

(declare-fun e!882988 () Bool)

(declare-fun tp_is_empty!39293 () Bool)

(declare-fun tp!114701 () Bool)

(assert (=> b!1582246 (= e!882988 (and tp_is_empty!39293 tp!114701))))

(declare-fun b!1582245 () Bool)

(declare-fun ListPrimitiveSize!204 (List!36856) Int)

(assert (=> b!1582245 (= e!882989 (>= (ListPrimitiveSize!204 (t!51770 l!1356)) (ListPrimitiveSize!204 l!1356)))))

(declare-fun res!1080967 () Bool)

(assert (=> start!137602 (=> (not res!1080967) (not e!882989))))

(declare-fun isStrictlySorted!1111 (List!36856) Bool)

(assert (=> start!137602 (= res!1080967 (isStrictlySorted!1111 l!1356))))

(assert (=> start!137602 e!882989))

(assert (=> start!137602 e!882988))

(assert (=> start!137602 true))

(assert (= (and start!137602 res!1080967) b!1582243))

(assert (= (and b!1582243 res!1080968) b!1582244))

(assert (= (and b!1582244 res!1080969) b!1582245))

(assert (= (and start!137602 (is-Cons!36852 l!1356)) b!1582246))

(declare-fun m!1452795 () Bool)

(assert (=> b!1582243 m!1452795))

(declare-fun m!1452797 () Bool)

(assert (=> b!1582245 m!1452797))

(declare-fun m!1452799 () Bool)

(assert (=> b!1582245 m!1452799))

(declare-fun m!1452801 () Bool)

(assert (=> start!137602 m!1452801))

(push 1)

(assert (not start!137602))

(assert (not b!1582245))

(assert (not b!1582243))

(assert (not b!1582246))

(assert tp_is_empty!39293)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166935 () Bool)

(declare-fun res!1080984 () Bool)

(declare-fun e!883006 () Bool)

(assert (=> d!166935 (=> res!1080984 e!883006)))

(assert (=> d!166935 (= res!1080984 (or (is-Nil!36853 l!1356) (is-Nil!36853 (t!51770 l!1356))))))

(assert (=> d!166935 (= (isStrictlySorted!1111 l!1356) e!883006)))

(declare-fun b!1582265 () Bool)

(declare-fun e!883007 () Bool)

(assert (=> b!1582265 (= e!883006 e!883007)))

(declare-fun res!1080985 () Bool)

(assert (=> b!1582265 (=> (not res!1080985) (not e!883007))))

(assert (=> b!1582265 (= res!1080985 (bvslt (_1!12831 (h!38395 l!1356)) (_1!12831 (h!38395 (t!51770 l!1356)))))))

(declare-fun b!1582266 () Bool)

(assert (=> b!1582266 (= e!883007 (isStrictlySorted!1111 (t!51770 l!1356)))))

(assert (= (and d!166935 (not res!1080984)) b!1582265))

(assert (= (and b!1582265 res!1080985) b!1582266))

(declare-fun m!1452805 () Bool)

(assert (=> b!1582266 m!1452805))

(assert (=> start!137602 d!166935))

(declare-fun d!166939 () Bool)

(declare-fun lt!677059 () Int)

(assert (=> d!166939 (>= lt!677059 0)))

(declare-fun e!883022 () Int)

(assert (=> d!166939 (= lt!677059 e!883022)))

(declare-fun c!146648 () Bool)

(assert (=> d!166939 (= c!146648 (is-Nil!36853 (t!51770 l!1356)))))

(assert (=> d!166939 (= (ListPrimitiveSize!204 (t!51770 l!1356)) lt!677059)))

(declare-fun b!1582283 () Bool)

(assert (=> b!1582283 (= e!883022 0)))

(declare-fun b!1582284 () Bool)

(assert (=> b!1582284 (= e!883022 (+ 1 (ListPrimitiveSize!204 (t!51770 (t!51770 l!1356)))))))

(assert (= (and d!166939 c!146648) b!1582283))

(assert (= (and d!166939 (not c!146648)) b!1582284))

(declare-fun m!1452811 () Bool)

(assert (=> b!1582284 m!1452811))

(assert (=> b!1582245 d!166939))

(declare-fun d!166947 () Bool)

(declare-fun lt!677060 () Int)

(assert (=> d!166947 (>= lt!677060 0)))

(declare-fun e!883023 () Int)

(assert (=> d!166947 (= lt!677060 e!883023)))

(declare-fun c!146649 () Bool)

(assert (=> d!166947 (= c!146649 (is-Nil!36853 l!1356))))

(assert (=> d!166947 (= (ListPrimitiveSize!204 l!1356) lt!677060)))

(declare-fun b!1582287 () Bool)

(assert (=> b!1582287 (= e!883023 0)))

(declare-fun b!1582288 () Bool)

(assert (=> b!1582288 (= e!883023 (+ 1 (ListPrimitiveSize!204 (t!51770 l!1356))))))

(assert (= (and d!166947 c!146649) b!1582287))

(assert (= (and d!166947 (not c!146649)) b!1582288))

(assert (=> b!1582288 m!1452797))

(assert (=> b!1582245 d!166947))

(declare-fun d!166949 () Bool)

(declare-fun res!1081004 () Bool)

(declare-fun e!883037 () Bool)

(assert (=> d!166949 (=> res!1081004 e!883037)))

(assert (=> d!166949 (= res!1081004 (and (is-Cons!36852 l!1356) (= (_1!12831 (h!38395 l!1356)) key!387)))))

(assert (=> d!166949 (= (containsKey!957 l!1356 key!387) e!883037)))

(declare-fun b!1582306 () Bool)

(declare-fun e!883038 () Bool)

(assert (=> b!1582306 (= e!883037 e!883038)))

(declare-fun res!1081005 () Bool)

(assert (=> b!1582306 (=> (not res!1081005) (not e!883038))))

(assert (=> b!1582306 (= res!1081005 (and (or (not (is-Cons!36852 l!1356)) (bvsle (_1!12831 (h!38395 l!1356)) key!387)) (is-Cons!36852 l!1356) (bvslt (_1!12831 (h!38395 l!1356)) key!387)))))

(declare-fun b!1582307 () Bool)

(assert (=> b!1582307 (= e!883038 (containsKey!957 (t!51770 l!1356) key!387))))

(assert (= (and d!166949 (not res!1081004)) b!1582306))

(assert (= (and b!1582306 res!1081005) b!1582307))

(declare-fun m!1452817 () Bool)

(assert (=> b!1582307 m!1452817))

(assert (=> b!1582243 d!166949))

(declare-fun b!1582320 () Bool)

(declare-fun e!883045 () Bool)

(declare-fun tp!114707 () Bool)

(assert (=> b!1582320 (= e!883045 (and tp_is_empty!39293 tp!114707))))

(assert (=> b!1582246 (= tp!114701 e!883045)))

