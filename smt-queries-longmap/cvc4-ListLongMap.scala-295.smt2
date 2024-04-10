; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5138 () Bool)

(assert start!5138)

(declare-fun res!22803 () Bool)

(declare-fun e!23925 () Bool)

(assert (=> start!5138 (=> (not res!22803) (not e!23925))))

(declare-datatypes ((List!990 0))(
  ( (Nil!987) (Cons!986 (h!1554 (_ BitVec 64)) (t!3823 List!990)) )
))
(declare-fun keys!14 () List!990)

(assert (=> start!5138 (= res!22803 (not (is-Nil!987 keys!14)))))

(assert (=> start!5138 e!23925))

(assert (=> start!5138 true))

(declare-datatypes ((B!762 0))(
  ( (B!763 (val!881 Int)) )
))
(declare-datatypes ((tuple2!1422 0))(
  ( (tuple2!1423 (_1!722 (_ BitVec 64)) (_2!722 B!762)) )
))
(declare-datatypes ((List!991 0))(
  ( (Nil!988) (Cons!987 (h!1555 tuple2!1422) (t!3824 List!991)) )
))
(declare-datatypes ((ListLongMap!999 0))(
  ( (ListLongMap!1000 (toList!515 List!991)) )
))
(declare-fun thiss!221 () ListLongMap!999)

(declare-fun e!23926 () Bool)

(declare-fun inv!1661 (ListLongMap!999) Bool)

(assert (=> start!5138 (and (inv!1661 thiss!221) e!23926)))

(declare-fun b!37749 () Bool)

(declare-fun ListPrimitiveSize!39 (List!990) Int)

(assert (=> b!37749 (= e!23925 (>= (ListPrimitiveSize!39 (t!3823 keys!14)) (ListPrimitiveSize!39 keys!14)))))

(declare-fun lt!13895 () ListLongMap!999)

(declare-fun -!38 (ListLongMap!999 (_ BitVec 64)) ListLongMap!999)

(assert (=> b!37749 (= lt!13895 (-!38 thiss!221 (h!1554 keys!14)))))

(declare-fun b!37750 () Bool)

(declare-fun tp!5576 () Bool)

(assert (=> b!37750 (= e!23926 tp!5576)))

(assert (= (and start!5138 res!22803) b!37749))

(assert (= start!5138 b!37750))

(declare-fun m!30491 () Bool)

(assert (=> start!5138 m!30491))

(declare-fun m!30493 () Bool)

(assert (=> b!37749 m!30493))

(declare-fun m!30495 () Bool)

(assert (=> b!37749 m!30495))

(declare-fun m!30497 () Bool)

(assert (=> b!37749 m!30497))

(push 1)

(assert (not b!37749))

(assert (not start!5138))

(assert (not b!37750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6073 () Bool)

(declare-fun lt!13902 () Int)

(assert (=> d!6073 (>= lt!13902 0)))

(declare-fun e!23933 () Int)

(assert (=> d!6073 (= lt!13902 e!23933)))

(declare-fun c!4371 () Bool)

(assert (=> d!6073 (= c!4371 (is-Nil!987 (t!3823 keys!14)))))

(assert (=> d!6073 (= (ListPrimitiveSize!39 (t!3823 keys!14)) lt!13902)))

(declare-fun b!37763 () Bool)

(assert (=> b!37763 (= e!23933 0)))

(declare-fun b!37764 () Bool)

(assert (=> b!37764 (= e!23933 (+ 1 (ListPrimitiveSize!39 (t!3823 (t!3823 keys!14)))))))

(assert (= (and d!6073 c!4371) b!37763))

(assert (= (and d!6073 (not c!4371)) b!37764))

(declare-fun m!30499 () Bool)

(assert (=> b!37764 m!30499))

(assert (=> b!37749 d!6073))

(declare-fun d!6077 () Bool)

(declare-fun lt!13903 () Int)

(assert (=> d!6077 (>= lt!13903 0)))

(declare-fun e!23934 () Int)

(assert (=> d!6077 (= lt!13903 e!23934)))

(declare-fun c!4372 () Bool)

(assert (=> d!6077 (= c!4372 (is-Nil!987 keys!14))))

(assert (=> d!6077 (= (ListPrimitiveSize!39 keys!14) lt!13903)))

(declare-fun b!37765 () Bool)

(assert (=> b!37765 (= e!23934 0)))

(declare-fun b!37766 () Bool)

(assert (=> b!37766 (= e!23934 (+ 1 (ListPrimitiveSize!39 (t!3823 keys!14))))))

(assert (= (and d!6077 c!4372) b!37765))

(assert (= (and d!6077 (not c!4372)) b!37766))

(assert (=> b!37766 m!30493))

(assert (=> b!37749 d!6077))

(declare-fun d!6079 () Bool)

(declare-fun lt!13910 () ListLongMap!999)

(declare-fun contains!464 (ListLongMap!999 (_ BitVec 64)) Bool)

(assert (=> d!6079 (not (contains!464 lt!13910 (h!1554 keys!14)))))

(declare-fun removeStrictlySorted!21 (List!991 (_ BitVec 64)) List!991)

(assert (=> d!6079 (= lt!13910 (ListLongMap!1000 (removeStrictlySorted!21 (toList!515 thiss!221) (h!1554 keys!14))))))

(assert (=> d!6079 (= (-!38 thiss!221 (h!1554 keys!14)) lt!13910)))

(declare-fun bs!1489 () Bool)

(assert (= bs!1489 d!6079))

(declare-fun m!30505 () Bool)

(assert (=> bs!1489 m!30505))

(declare-fun m!30507 () Bool)

(assert (=> bs!1489 m!30507))

(assert (=> b!37749 d!6079))

(declare-fun d!6089 () Bool)

(declare-fun isStrictlySorted!191 (List!991) Bool)

(assert (=> d!6089 (= (inv!1661 thiss!221) (isStrictlySorted!191 (toList!515 thiss!221)))))

(declare-fun bs!1490 () Bool)

(assert (= bs!1490 d!6089))

(declare-fun m!30509 () Bool)

(assert (=> bs!1490 m!30509))

(assert (=> start!5138 d!6089))

(declare-fun b!37779 () Bool)

(declare-fun e!23941 () Bool)

(declare-fun tp_is_empty!1681 () Bool)

(declare-fun tp!5579 () Bool)

(assert (=> b!37779 (= e!23941 (and tp_is_empty!1681 tp!5579))))

(assert (=> b!37750 (= tp!5576 e!23941)))

(assert (= (and b!37750 (is-Cons!987 (toList!515 thiss!221))) b!37779))

(push 1)

