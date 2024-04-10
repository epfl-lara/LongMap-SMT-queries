; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132848 () Bool)

(assert start!132848)

(declare-fun res!1064574 () Bool)

(declare-fun e!866591 () Bool)

(assert (=> start!132848 (=> (not res!1064574) (not e!866591))))

(declare-datatypes ((B!2330 0))(
  ( (B!2331 (val!19251 Int)) )
))
(declare-datatypes ((tuple2!24878 0))(
  ( (tuple2!24879 (_1!12450 (_ BitVec 64)) (_2!12450 B!2330)) )
))
(declare-datatypes ((List!36285 0))(
  ( (Nil!36282) (Cons!36281 (h!37727 tuple2!24878) (t!51006 List!36285)) )
))
(declare-fun l!1177 () List!36285)

(declare-fun isStrictlySorted!938 (List!36285) Bool)

(assert (=> start!132848 (= res!1064574 (isStrictlySorted!938 l!1177))))

(assert (=> start!132848 e!866591))

(declare-fun e!866590 () Bool)

(assert (=> start!132848 e!866590))

(assert (=> start!132848 true))

(declare-fun b!1556013 () Bool)

(declare-fun res!1064575 () Bool)

(assert (=> b!1556013 (=> (not res!1064575) (not e!866591))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556013 (= res!1064575 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556014 () Bool)

(declare-fun ListPrimitiveSize!175 (List!36285) Int)

(assert (=> b!1556014 (= e!866591 (< (ListPrimitiveSize!175 l!1177) 0))))

(declare-fun b!1556015 () Bool)

(declare-fun tp_is_empty!38341 () Bool)

(declare-fun tp!112371 () Bool)

(assert (=> b!1556015 (= e!866590 (and tp_is_empty!38341 tp!112371))))

(assert (= (and start!132848 res!1064574) b!1556013))

(assert (= (and b!1556013 res!1064575) b!1556014))

(assert (= (and start!132848 (is-Cons!36281 l!1177)) b!1556015))

(declare-fun m!1433751 () Bool)

(assert (=> start!132848 m!1433751))

(declare-fun m!1433753 () Bool)

(assert (=> b!1556014 m!1433753))

(push 1)

(assert (not start!132848))

(assert (not b!1556014))

(assert (not b!1556015))

(assert tp_is_empty!38341)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162053 () Bool)

(declare-fun res!1064594 () Bool)

(declare-fun e!866616 () Bool)

(assert (=> d!162053 (=> res!1064594 e!866616)))

(assert (=> d!162053 (= res!1064594 (or (is-Nil!36282 l!1177) (is-Nil!36282 (t!51006 l!1177))))))

(assert (=> d!162053 (= (isStrictlySorted!938 l!1177) e!866616)))

(declare-fun b!1556052 () Bool)

(declare-fun e!866617 () Bool)

(assert (=> b!1556052 (= e!866616 e!866617)))

(declare-fun res!1064595 () Bool)

(assert (=> b!1556052 (=> (not res!1064595) (not e!866617))))

(assert (=> b!1556052 (= res!1064595 (bvslt (_1!12450 (h!37727 l!1177)) (_1!12450 (h!37727 (t!51006 l!1177)))))))

(declare-fun b!1556053 () Bool)

(assert (=> b!1556053 (= e!866617 (isStrictlySorted!938 (t!51006 l!1177)))))

(assert (= (and d!162053 (not res!1064594)) b!1556052))

(assert (= (and b!1556052 res!1064595) b!1556053))

(declare-fun m!1433767 () Bool)

(assert (=> b!1556053 m!1433767))

(assert (=> start!132848 d!162053))

(declare-fun d!162059 () Bool)

(declare-fun lt!670379 () Int)

(assert (=> d!162059 (>= lt!670379 0)))

(declare-fun e!866635 () Int)

(assert (=> d!162059 (= lt!670379 e!866635)))

(declare-fun c!143714 () Bool)

(assert (=> d!162059 (= c!143714 (is-Nil!36282 l!1177))))

(assert (=> d!162059 (= (ListPrimitiveSize!175 l!1177) lt!670379)))

(declare-fun b!1556077 () Bool)

(assert (=> b!1556077 (= e!866635 0)))

(declare-fun b!1556078 () Bool)

(assert (=> b!1556078 (= e!866635 (+ 1 (ListPrimitiveSize!175 (t!51006 l!1177))))))

(assert (= (and d!162059 c!143714) b!1556077))

(assert (= (and d!162059 (not c!143714)) b!1556078))

(declare-fun m!1433773 () Bool)

(assert (=> b!1556078 m!1433773))

(assert (=> b!1556014 d!162059))

(declare-fun b!1556084 () Bool)

(declare-fun e!866639 () Bool)

(declare-fun tp!112386 () Bool)

(assert (=> b!1556084 (= e!866639 (and tp_is_empty!38341 tp!112386))))

(assert (=> b!1556015 (= tp!112371 e!866639)))

(assert (= (and b!1556015 (is-Cons!36281 (t!51006 l!1177))) b!1556084))

(push 1)

