; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1162 () Bool)

(assert start!1162)

(declare-datatypes ((B!300 0))(
  ( (B!301 (val!245 Int)) )
))
(declare-datatypes ((tuple2!290 0))(
  ( (tuple2!291 (_1!145 (_ BitVec 64)) (_2!145 B!300)) )
))
(declare-datatypes ((List!297 0))(
  ( (Nil!294) (Cons!293 (h!859 tuple2!290) (t!2444 List!297)) )
))
(declare-datatypes ((ListLongMap!295 0))(
  ( (ListLongMap!296 (toList!163 List!297)) )
))
(declare-fun lm!213 () ListLongMap!295)

(declare-fun isStrictlySorted!21 (List!297) Bool)

(assert (=> start!1162 (not (isStrictlySorted!21 (toList!163 lm!213)))))

(declare-fun e!5810 () Bool)

(declare-fun inv!452 (ListLongMap!295) Bool)

(assert (=> start!1162 (and (inv!452 lm!213) e!5810)))

(declare-fun b!10112 () Bool)

(declare-fun tp!1433 () Bool)

(assert (=> b!10112 (= e!5810 tp!1433)))

(assert (= start!1162 b!10112))

(declare-fun m!6463 () Bool)

(assert (=> start!1162 m!6463))

(declare-fun m!6465 () Bool)

(assert (=> start!1162 m!6465))

(push 1)

(assert (not start!1162))

(assert (not b!10112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1003 () Bool)

(declare-fun res!8829 () Bool)

(declare-fun e!5827 () Bool)

(assert (=> d!1003 (=> res!8829 e!5827)))

(assert (=> d!1003 (= res!8829 (or (is-Nil!294 (toList!163 lm!213)) (is-Nil!294 (t!2444 (toList!163 lm!213)))))))

(assert (=> d!1003 (= (isStrictlySorted!21 (toList!163 lm!213)) e!5827)))

(declare-fun b!10129 () Bool)

(declare-fun e!5828 () Bool)

(assert (=> b!10129 (= e!5827 e!5828)))

(declare-fun res!8830 () Bool)

(assert (=> b!10129 (=> (not res!8830) (not e!5828))))

(assert (=> b!10129 (= res!8830 (bvslt (_1!145 (h!859 (toList!163 lm!213))) (_1!145 (h!859 (t!2444 (toList!163 lm!213))))))))

(declare-fun b!10130 () Bool)

(assert (=> b!10130 (= e!5828 (isStrictlySorted!21 (t!2444 (toList!163 lm!213))))))

(assert (= (and d!1003 (not res!8829)) b!10129))

(assert (= (and b!10129 res!8830) b!10130))

(declare-fun m!6471 () Bool)

(assert (=> b!10130 m!6471))

(assert (=> start!1162 d!1003))

(declare-fun d!1009 () Bool)

(assert (=> d!1009 (= (inv!452 lm!213) (isStrictlySorted!21 (toList!163 lm!213)))))

(declare-fun bs!347 () Bool)

(assert (= bs!347 d!1009))

(assert (=> bs!347 m!6463))

(assert (=> start!1162 d!1009))

(declare-fun b!10145 () Bool)

(declare-fun e!5837 () Bool)

(declare-fun tp_is_empty!473 () Bool)

(declare-fun tp!1442 () Bool)

(assert (=> b!10145 (= e!5837 (and tp_is_empty!473 tp!1442))))

(assert (=> b!10112 (= tp!1433 e!5837)))

