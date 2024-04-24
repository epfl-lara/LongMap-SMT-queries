; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5174 () Bool)

(assert start!5174)

(declare-fun res!22799 () Bool)

(declare-fun e!23951 () Bool)

(assert (=> start!5174 (=> (not res!22799) (not e!23951))))

(declare-datatypes ((B!776 0))(
  ( (B!777 (val!888 Int)) )
))
(declare-fun b!99 () B!776)

(declare-datatypes ((tuple2!1418 0))(
  ( (tuple2!1419 (_1!720 (_ BitVec 64)) (_2!720 B!776)) )
))
(declare-datatypes ((List!984 0))(
  ( (Nil!981) (Cons!980 (h!1548 tuple2!1418) (t!3817 List!984)) )
))
(declare-datatypes ((ListLongMap!989 0))(
  ( (ListLongMap!990 (toList!510 List!984)) )
))
(declare-fun lm!264 () ListLongMap!989)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!463 (List!984 tuple2!1418) Bool)

(assert (=> start!5174 (= res!22799 (contains!463 (toList!510 lm!264) (tuple2!1419 a!526 b!99)))))

(assert (=> start!5174 e!23951))

(declare-fun e!23952 () Bool)

(declare-fun inv!1683 (ListLongMap!989) Bool)

(assert (=> start!5174 (and (inv!1683 lm!264) e!23952)))

(assert (=> start!5174 true))

(declare-fun tp_is_empty!1699 () Bool)

(assert (=> start!5174 tp_is_empty!1699))

(declare-fun b!37773 () Bool)

(declare-fun isStrictlySorted!181 (List!984) Bool)

(assert (=> b!37773 (= e!23951 (not (isStrictlySorted!181 (toList!510 lm!264))))))

(declare-fun b!37774 () Bool)

(declare-fun tp!5606 () Bool)

(assert (=> b!37774 (= e!23952 tp!5606)))

(assert (= (and start!5174 res!22799) b!37773))

(assert (= start!5174 b!37774))

(declare-fun m!30433 () Bool)

(assert (=> start!5174 m!30433))

(declare-fun m!30435 () Bool)

(assert (=> start!5174 m!30435))

(declare-fun m!30437 () Bool)

(assert (=> b!37773 m!30437))

(check-sat (not b!37773) (not start!5174) (not b!37774) tp_is_empty!1699)
(check-sat)
(get-model)

(declare-fun d!6091 () Bool)

(declare-fun res!22819 () Bool)

(declare-fun e!23978 () Bool)

(assert (=> d!6091 (=> res!22819 e!23978)))

(get-info :version)

(assert (=> d!6091 (= res!22819 (or ((_ is Nil!981) (toList!510 lm!264)) ((_ is Nil!981) (t!3817 (toList!510 lm!264)))))))

(assert (=> d!6091 (= (isStrictlySorted!181 (toList!510 lm!264)) e!23978)))

(declare-fun b!37800 () Bool)

(declare-fun e!23980 () Bool)

(assert (=> b!37800 (= e!23978 e!23980)))

(declare-fun res!22821 () Bool)

(assert (=> b!37800 (=> (not res!22821) (not e!23980))))

(assert (=> b!37800 (= res!22821 (bvslt (_1!720 (h!1548 (toList!510 lm!264))) (_1!720 (h!1548 (t!3817 (toList!510 lm!264))))))))

(declare-fun b!37802 () Bool)

(assert (=> b!37802 (= e!23980 (isStrictlySorted!181 (t!3817 (toList!510 lm!264))))))

(assert (= (and d!6091 (not res!22819)) b!37800))

(assert (= (and b!37800 res!22821) b!37802))

(declare-fun m!30452 () Bool)

(assert (=> b!37802 m!30452))

(assert (=> b!37773 d!6091))

(declare-fun d!6095 () Bool)

(declare-fun lt!13891 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!20 (List!984) (InoxSet tuple2!1418))

(assert (=> d!6095 (= lt!13891 (select (content!20 (toList!510 lm!264)) (tuple2!1419 a!526 b!99)))))

(declare-fun e!23998 () Bool)

(assert (=> d!6095 (= lt!13891 e!23998)))

(declare-fun res!22836 () Bool)

(assert (=> d!6095 (=> (not res!22836) (not e!23998))))

(assert (=> d!6095 (= res!22836 ((_ is Cons!980) (toList!510 lm!264)))))

(assert (=> d!6095 (= (contains!463 (toList!510 lm!264) (tuple2!1419 a!526 b!99)) lt!13891)))

(declare-fun b!37819 () Bool)

(declare-fun e!23997 () Bool)

(assert (=> b!37819 (= e!23998 e!23997)))

(declare-fun res!22839 () Bool)

(assert (=> b!37819 (=> res!22839 e!23997)))

(assert (=> b!37819 (= res!22839 (= (h!1548 (toList!510 lm!264)) (tuple2!1419 a!526 b!99)))))

(declare-fun b!37820 () Bool)

(assert (=> b!37820 (= e!23997 (contains!463 (t!3817 (toList!510 lm!264)) (tuple2!1419 a!526 b!99)))))

(assert (= (and d!6095 res!22836) b!37819))

(assert (= (and b!37819 (not res!22839)) b!37820))

(declare-fun m!30463 () Bool)

(assert (=> d!6095 m!30463))

(declare-fun m!30467 () Bool)

(assert (=> d!6095 m!30467))

(declare-fun m!30471 () Bool)

(assert (=> b!37820 m!30471))

(assert (=> start!5174 d!6095))

(declare-fun d!6103 () Bool)

(assert (=> d!6103 (= (inv!1683 lm!264) (isStrictlySorted!181 (toList!510 lm!264)))))

(declare-fun bs!1505 () Bool)

(assert (= bs!1505 d!6103))

(assert (=> bs!1505 m!30437))

(assert (=> start!5174 d!6103))

(declare-fun b!37837 () Bool)

(declare-fun e!24009 () Bool)

(declare-fun tp!5621 () Bool)

(assert (=> b!37837 (= e!24009 (and tp_is_empty!1699 tp!5621))))

(assert (=> b!37774 (= tp!5606 e!24009)))

(assert (= (and b!37774 ((_ is Cons!980) (toList!510 lm!264))) b!37837))

(check-sat tp_is_empty!1699 (not d!6095) (not b!37802) (not d!6103) (not b!37820) (not b!37837))
(check-sat)
