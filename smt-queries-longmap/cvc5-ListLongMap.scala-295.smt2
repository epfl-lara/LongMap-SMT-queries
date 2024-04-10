; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5134 () Bool)

(assert start!5134)

(declare-fun res!22797 () Bool)

(declare-fun e!23913 () Bool)

(assert (=> start!5134 (=> (not res!22797) (not e!23913))))

(declare-datatypes ((List!986 0))(
  ( (Nil!983) (Cons!982 (h!1550 (_ BitVec 64)) (t!3819 List!986)) )
))
(declare-fun keys!14 () List!986)

(assert (=> start!5134 (= res!22797 (not (is-Nil!983 keys!14)))))

(assert (=> start!5134 e!23913))

(assert (=> start!5134 true))

(declare-datatypes ((B!758 0))(
  ( (B!759 (val!879 Int)) )
))
(declare-datatypes ((tuple2!1418 0))(
  ( (tuple2!1419 (_1!720 (_ BitVec 64)) (_2!720 B!758)) )
))
(declare-datatypes ((List!987 0))(
  ( (Nil!984) (Cons!983 (h!1551 tuple2!1418) (t!3820 List!987)) )
))
(declare-datatypes ((ListLongMap!995 0))(
  ( (ListLongMap!996 (toList!513 List!987)) )
))
(declare-fun thiss!221 () ListLongMap!995)

(declare-fun e!23914 () Bool)

(declare-fun inv!1659 (ListLongMap!995) Bool)

(assert (=> start!5134 (and (inv!1659 thiss!221) e!23914)))

(declare-fun b!37737 () Bool)

(declare-fun ListPrimitiveSize!37 (List!986) Int)

(assert (=> b!37737 (= e!23913 (>= (ListPrimitiveSize!37 (t!3819 keys!14)) (ListPrimitiveSize!37 keys!14)))))

(declare-fun lt!13889 () ListLongMap!995)

(declare-fun -!36 (ListLongMap!995 (_ BitVec 64)) ListLongMap!995)

(assert (=> b!37737 (= lt!13889 (-!36 thiss!221 (h!1550 keys!14)))))

(declare-fun b!37738 () Bool)

(declare-fun tp!5570 () Bool)

(assert (=> b!37738 (= e!23914 tp!5570)))

(assert (= (and start!5134 res!22797) b!37737))

(assert (= start!5134 b!37738))

(declare-fun m!30475 () Bool)

(assert (=> start!5134 m!30475))

(declare-fun m!30477 () Bool)

(assert (=> b!37737 m!30477))

(declare-fun m!30479 () Bool)

(assert (=> b!37737 m!30479))

(declare-fun m!30481 () Bool)

(assert (=> b!37737 m!30481))

(push 1)

(assert (not b!37737))

(assert (not start!5134))

(assert (not b!37738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6075 () Bool)

(declare-fun lt!13905 () Int)

(assert (=> d!6075 (>= lt!13905 0)))

(declare-fun e!23936 () Int)

(assert (=> d!6075 (= lt!13905 e!23936)))

(declare-fun c!4374 () Bool)

(assert (=> d!6075 (= c!4374 (is-Nil!983 (t!3819 keys!14)))))

(assert (=> d!6075 (= (ListPrimitiveSize!37 (t!3819 keys!14)) lt!13905)))

(declare-fun b!37769 () Bool)

(assert (=> b!37769 (= e!23936 0)))

(declare-fun b!37770 () Bool)

(assert (=> b!37770 (= e!23936 (+ 1 (ListPrimitiveSize!37 (t!3819 (t!3819 keys!14)))))))

(assert (= (and d!6075 c!4374) b!37769))

(assert (= (and d!6075 (not c!4374)) b!37770))

(declare-fun m!30503 () Bool)

(assert (=> b!37770 m!30503))

(assert (=> b!37737 d!6075))

(declare-fun d!6083 () Bool)

(declare-fun lt!13907 () Int)

(assert (=> d!6083 (>= lt!13907 0)))

(declare-fun e!23938 () Int)

(assert (=> d!6083 (= lt!13907 e!23938)))

(declare-fun c!4376 () Bool)

(assert (=> d!6083 (= c!4376 (is-Nil!983 keys!14))))

(assert (=> d!6083 (= (ListPrimitiveSize!37 keys!14) lt!13907)))

(declare-fun b!37773 () Bool)

(assert (=> b!37773 (= e!23938 0)))

(declare-fun b!37774 () Bool)

(assert (=> b!37774 (= e!23938 (+ 1 (ListPrimitiveSize!37 (t!3819 keys!14))))))

(assert (= (and d!6083 c!4376) b!37773))

(assert (= (and d!6083 (not c!4376)) b!37774))

(assert (=> b!37774 m!30477))

(assert (=> b!37737 d!6083))

(declare-fun d!6087 () Bool)

(declare-fun lt!13915 () ListLongMap!995)

(declare-fun contains!466 (ListLongMap!995 (_ BitVec 64)) Bool)

(assert (=> d!6087 (not (contains!466 lt!13915 (h!1550 keys!14)))))

(declare-fun removeStrictlySorted!23 (List!987 (_ BitVec 64)) List!987)

(assert (=> d!6087 (= lt!13915 (ListLongMap!996 (removeStrictlySorted!23 (toList!513 thiss!221) (h!1550 keys!14))))))

(assert (=> d!6087 (= (-!36 thiss!221 (h!1550 keys!14)) lt!13915)))

(declare-fun bs!1491 () Bool)

(assert (= bs!1491 d!6087))

(declare-fun m!30512 () Bool)

(assert (=> bs!1491 m!30512))

(declare-fun m!30517 () Bool)

(assert (=> bs!1491 m!30517))

(assert (=> b!37737 d!6087))

(declare-fun d!6093 () Bool)

(declare-fun isStrictlySorted!193 (List!987) Bool)

(assert (=> d!6093 (= (inv!1659 thiss!221) (isStrictlySorted!193 (toList!513 thiss!221)))))

(declare-fun bs!1493 () Bool)

(assert (= bs!1493 d!6093))

(declare-fun m!30520 () Bool)

(assert (=> bs!1493 m!30520))

(assert (=> start!5134 d!6093))

(declare-fun b!37788 () Bool)

(declare-fun e!23946 () Bool)

(declare-fun tp_is_empty!1684 () Bool)

(declare-fun tp!5584 () Bool)

(assert (=> b!37788 (= e!23946 (and tp_is_empty!1684 tp!5584))))

(assert (=> b!37738 (= tp!5570 e!23946)))

(assert (= (and b!37738 (is-Cons!983 (toList!513 thiss!221))) b!37788))

(push 1)

(assert (not b!37788))

(assert (not b!37774))

