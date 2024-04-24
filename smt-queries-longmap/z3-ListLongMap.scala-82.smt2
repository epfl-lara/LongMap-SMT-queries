; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1158 () Bool)

(assert start!1158)

(declare-datatypes ((B!296 0))(
  ( (B!297 (val!243 Int)) )
))
(declare-datatypes ((tuple2!282 0))(
  ( (tuple2!283 (_1!141 (_ BitVec 64)) (_2!141 B!296)) )
))
(declare-datatypes ((List!291 0))(
  ( (Nil!288) (Cons!287 (h!853 tuple2!282) (t!2438 List!291)) )
))
(declare-datatypes ((ListLongMap!287 0))(
  ( (ListLongMap!288 (toList!159 List!291)) )
))
(declare-fun lm!213 () ListLongMap!287)

(declare-fun isStrictlySorted!18 (List!291) Bool)

(assert (=> start!1158 (not (isStrictlySorted!18 (toList!159 lm!213)))))

(declare-fun e!5804 () Bool)

(declare-fun inv!450 (ListLongMap!287) Bool)

(assert (=> start!1158 (and (inv!450 lm!213) e!5804)))

(declare-fun b!10106 () Bool)

(declare-fun tp!1427 () Bool)

(assert (=> b!10106 (= e!5804 tp!1427)))

(assert (= start!1158 b!10106))

(declare-fun m!6455 () Bool)

(assert (=> start!1158 m!6455))

(declare-fun m!6457 () Bool)

(assert (=> start!1158 m!6457))

(check-sat (not start!1158) (not b!10106))
(check-sat)
(get-model)

(declare-fun d!999 () Bool)

(declare-fun res!8821 () Bool)

(declare-fun e!5819 () Bool)

(assert (=> d!999 (=> res!8821 e!5819)))

(get-info :version)

(assert (=> d!999 (= res!8821 (or ((_ is Nil!288) (toList!159 lm!213)) ((_ is Nil!288) (t!2438 (toList!159 lm!213)))))))

(assert (=> d!999 (= (isStrictlySorted!18 (toList!159 lm!213)) e!5819)))

(declare-fun b!10121 () Bool)

(declare-fun e!5820 () Bool)

(assert (=> b!10121 (= e!5819 e!5820)))

(declare-fun res!8822 () Bool)

(assert (=> b!10121 (=> (not res!8822) (not e!5820))))

(assert (=> b!10121 (= res!8822 (bvslt (_1!141 (h!853 (toList!159 lm!213))) (_1!141 (h!853 (t!2438 (toList!159 lm!213))))))))

(declare-fun b!10122 () Bool)

(assert (=> b!10122 (= e!5820 (isStrictlySorted!18 (t!2438 (toList!159 lm!213))))))

(assert (= (and d!999 (not res!8821)) b!10121))

(assert (= (and b!10121 res!8822) b!10122))

(declare-fun m!6467 () Bool)

(assert (=> b!10122 m!6467))

(assert (=> start!1158 d!999))

(declare-fun d!1005 () Bool)

(assert (=> d!1005 (= (inv!450 lm!213) (isStrictlySorted!18 (toList!159 lm!213)))))

(declare-fun bs!345 () Bool)

(assert (= bs!345 d!1005))

(assert (=> bs!345 m!6455))

(assert (=> start!1158 d!1005))

(declare-fun b!10133 () Bool)

(declare-fun e!5827 () Bool)

(declare-fun tp_is_empty!469 () Bool)

(declare-fun tp!1438 () Bool)

(assert (=> b!10133 (= e!5827 (and tp_is_empty!469 tp!1438))))

(assert (=> b!10106 (= tp!1427 e!5827)))

(assert (= (and b!10106 ((_ is Cons!287) (toList!159 lm!213))) b!10133))

(check-sat (not b!10122) (not d!1005) (not b!10133) tp_is_empty!469)
(check-sat)
