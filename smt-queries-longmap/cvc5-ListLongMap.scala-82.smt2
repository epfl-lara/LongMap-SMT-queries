; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1158 () Bool)

(assert start!1158)

(declare-datatypes ((B!296 0))(
  ( (B!297 (val!243 Int)) )
))
(declare-datatypes ((tuple2!286 0))(
  ( (tuple2!287 (_1!143 (_ BitVec 64)) (_2!143 B!296)) )
))
(declare-datatypes ((List!295 0))(
  ( (Nil!292) (Cons!291 (h!857 tuple2!286) (t!2442 List!295)) )
))
(declare-datatypes ((ListLongMap!291 0))(
  ( (ListLongMap!292 (toList!161 List!295)) )
))
(declare-fun lm!213 () ListLongMap!291)

(declare-fun isStrictlySorted!19 (List!295) Bool)

(assert (=> start!1158 (not (isStrictlySorted!19 (toList!161 lm!213)))))

(declare-fun e!5804 () Bool)

(declare-fun inv!450 (ListLongMap!291) Bool)

(assert (=> start!1158 (and (inv!450 lm!213) e!5804)))

(declare-fun b!10106 () Bool)

(declare-fun tp!1427 () Bool)

(assert (=> b!10106 (= e!5804 tp!1427)))

(assert (= start!1158 b!10106))

(declare-fun m!6455 () Bool)

(assert (=> start!1158 m!6455))

(declare-fun m!6457 () Bool)

(assert (=> start!1158 m!6457))

(push 1)

(assert (not start!1158))

(assert (not b!10106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1001 () Bool)

(declare-fun res!8827 () Bool)

(declare-fun e!5825 () Bool)

(assert (=> d!1001 (=> res!8827 e!5825)))

(assert (=> d!1001 (= res!8827 (or (is-Nil!292 (toList!161 lm!213)) (is-Nil!292 (t!2442 (toList!161 lm!213)))))))

(assert (=> d!1001 (= (isStrictlySorted!19 (toList!161 lm!213)) e!5825)))

(declare-fun b!10127 () Bool)

(declare-fun e!5826 () Bool)

(assert (=> b!10127 (= e!5825 e!5826)))

(declare-fun res!8828 () Bool)

(assert (=> b!10127 (=> (not res!8828) (not e!5826))))

(assert (=> b!10127 (= res!8828 (bvslt (_1!143 (h!857 (toList!161 lm!213))) (_1!143 (h!857 (t!2442 (toList!161 lm!213))))))))

(declare-fun b!10128 () Bool)

(assert (=> b!10128 (= e!5826 (isStrictlySorted!19 (t!2442 (toList!161 lm!213))))))

(assert (= (and d!1001 (not res!8827)) b!10127))

(assert (= (and b!10127 res!8828) b!10128))

(declare-fun m!6469 () Bool)

(assert (=> b!10128 m!6469))

(assert (=> start!1158 d!1001))

(declare-fun d!1007 () Bool)

(assert (=> d!1007 (= (inv!450 lm!213) (isStrictlySorted!19 (toList!161 lm!213)))))

(declare-fun bs!346 () Bool)

(assert (= bs!346 d!1007))

(assert (=> bs!346 m!6455))

(assert (=> start!1158 d!1007))

(declare-fun b!10143 () Bool)

(declare-fun e!5835 () Bool)

(declare-fun tp_is_empty!469 () Bool)

(declare-fun tp!1440 () Bool)

(assert (=> b!10143 (= e!5835 (and tp_is_empty!469 tp!1440))))

(assert (=> b!10106 (= tp!1427 e!5835)))

(assert (= (and b!10106 (is-Cons!291 (toList!161 lm!213))) b!10143))

(push 1)

