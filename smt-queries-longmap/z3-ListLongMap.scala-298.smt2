; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5172 () Bool)

(assert start!5172)

(declare-fun res!22827 () Bool)

(declare-fun e!23994 () Bool)

(assert (=> start!5172 (=> (not res!22827) (not e!23994))))

(declare-datatypes ((B!778 0))(
  ( (B!779 (val!889 Int)) )
))
(declare-fun b!99 () B!778)

(declare-datatypes ((tuple2!1438 0))(
  ( (tuple2!1439 (_1!730 (_ BitVec 64)) (_2!730 B!778)) )
))
(declare-datatypes ((List!999 0))(
  ( (Nil!996) (Cons!995 (h!1563 tuple2!1438) (t!3832 List!999)) )
))
(declare-datatypes ((ListLongMap!1015 0))(
  ( (ListLongMap!1016 (toList!523 List!999)) )
))
(declare-fun lm!264 () ListLongMap!1015)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!474 (List!999 tuple2!1438) Bool)

(assert (=> start!5172 (= res!22827 (contains!474 (toList!523 lm!264) (tuple2!1439 a!526 b!99)))))

(assert (=> start!5172 e!23994))

(declare-fun e!23995 () Bool)

(declare-fun inv!1684 (ListLongMap!1015) Bool)

(assert (=> start!5172 (and (inv!1684 lm!264) e!23995)))

(assert (=> start!5172 true))

(declare-fun tp_is_empty!1701 () Bool)

(assert (=> start!5172 tp_is_empty!1701))

(declare-fun b!37836 () Bool)

(declare-fun isStrictlySorted!195 (List!999) Bool)

(assert (=> b!37836 (= e!23994 (not (isStrictlySorted!195 (toList!523 lm!264))))))

(declare-fun b!37837 () Bool)

(declare-fun tp!5609 () Bool)

(assert (=> b!37837 (= e!23995 tp!5609)))

(assert (= (and start!5172 res!22827) b!37836))

(assert (= start!5172 b!37837))

(declare-fun m!30565 () Bool)

(assert (=> start!5172 m!30565))

(declare-fun m!30567 () Bool)

(assert (=> start!5172 m!30567))

(declare-fun m!30569 () Bool)

(assert (=> b!37836 m!30569))

(check-sat (not start!5172) (not b!37836) (not b!37837) tp_is_empty!1701)
(check-sat)
(get-model)

(declare-fun d!6105 () Bool)

(declare-fun lt!13930 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!20 (List!999) (InoxSet tuple2!1438))

(assert (=> d!6105 (= lt!13930 (select (content!20 (toList!523 lm!264)) (tuple2!1439 a!526 b!99)))))

(declare-fun e!24022 () Bool)

(assert (=> d!6105 (= lt!13930 e!24022)))

(declare-fun res!22851 () Bool)

(assert (=> d!6105 (=> (not res!22851) (not e!24022))))

(get-info :version)

(assert (=> d!6105 (= res!22851 ((_ is Cons!995) (toList!523 lm!264)))))

(assert (=> d!6105 (= (contains!474 (toList!523 lm!264) (tuple2!1439 a!526 b!99)) lt!13930)))

(declare-fun b!37864 () Bool)

(declare-fun e!24023 () Bool)

(assert (=> b!37864 (= e!24022 e!24023)))

(declare-fun res!22852 () Bool)

(assert (=> b!37864 (=> res!22852 e!24023)))

(assert (=> b!37864 (= res!22852 (= (h!1563 (toList!523 lm!264)) (tuple2!1439 a!526 b!99)))))

(declare-fun b!37865 () Bool)

(assert (=> b!37865 (= e!24023 (contains!474 (t!3832 (toList!523 lm!264)) (tuple2!1439 a!526 b!99)))))

(assert (= (and d!6105 res!22851) b!37864))

(assert (= (and b!37864 (not res!22852)) b!37865))

(declare-fun m!30581 () Bool)

(assert (=> d!6105 m!30581))

(declare-fun m!30583 () Bool)

(assert (=> d!6105 m!30583))

(declare-fun m!30585 () Bool)

(assert (=> b!37865 m!30585))

(assert (=> start!5172 d!6105))

(declare-fun d!6111 () Bool)

(assert (=> d!6111 (= (inv!1684 lm!264) (isStrictlySorted!195 (toList!523 lm!264)))))

(declare-fun bs!1505 () Bool)

(assert (= bs!1505 d!6111))

(assert (=> bs!1505 m!30569))

(assert (=> start!5172 d!6111))

(declare-fun d!6115 () Bool)

(declare-fun res!22865 () Bool)

(declare-fun e!24039 () Bool)

(assert (=> d!6115 (=> res!22865 e!24039)))

(assert (=> d!6115 (= res!22865 (or ((_ is Nil!996) (toList!523 lm!264)) ((_ is Nil!996) (t!3832 (toList!523 lm!264)))))))

(assert (=> d!6115 (= (isStrictlySorted!195 (toList!523 lm!264)) e!24039)))

(declare-fun b!37883 () Bool)

(declare-fun e!24040 () Bool)

(assert (=> b!37883 (= e!24039 e!24040)))

(declare-fun res!22866 () Bool)

(assert (=> b!37883 (=> (not res!22866) (not e!24040))))

(assert (=> b!37883 (= res!22866 (bvslt (_1!730 (h!1563 (toList!523 lm!264))) (_1!730 (h!1563 (t!3832 (toList!523 lm!264))))))))

(declare-fun b!37885 () Bool)

