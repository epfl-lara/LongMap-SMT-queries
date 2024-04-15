; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5132 () Bool)

(assert start!5132)

(declare-fun res!22780 () Bool)

(declare-fun e!23886 () Bool)

(assert (=> start!5132 (=> (not res!22780) (not e!23886))))

(declare-datatypes ((List!979 0))(
  ( (Nil!976) (Cons!975 (h!1543 (_ BitVec 64)) (t!3811 List!979)) )
))
(declare-fun keys!14 () List!979)

(get-info :version)

(assert (=> start!5132 (= res!22780 (not ((_ is Nil!976) keys!14)))))

(assert (=> start!5132 e!23886))

(assert (=> start!5132 true))

(declare-datatypes ((B!758 0))(
  ( (B!759 (val!879 Int)) )
))
(declare-datatypes ((tuple2!1422 0))(
  ( (tuple2!1423 (_1!722 (_ BitVec 64)) (_2!722 B!758)) )
))
(declare-datatypes ((List!980 0))(
  ( (Nil!977) (Cons!976 (h!1544 tuple2!1422) (t!3812 List!980)) )
))
(declare-datatypes ((ListLongMap!987 0))(
  ( (ListLongMap!988 (toList!509 List!980)) )
))
(declare-fun thiss!221 () ListLongMap!987)

(declare-fun e!23885 () Bool)

(declare-fun inv!1659 (ListLongMap!987) Bool)

(assert (=> start!5132 (and (inv!1659 thiss!221) e!23885)))

(declare-fun b!37698 () Bool)

(declare-fun ListPrimitiveSize!37 (List!979) Int)

(assert (=> b!37698 (= e!23886 (>= (ListPrimitiveSize!37 (t!3811 keys!14)) (ListPrimitiveSize!37 keys!14)))))

(declare-fun lt!13886 () ListLongMap!987)

(declare-fun -!36 (ListLongMap!987 (_ BitVec 64)) ListLongMap!987)

(assert (=> b!37698 (= lt!13886 (-!36 thiss!221 (h!1543 keys!14)))))

(declare-fun b!37699 () Bool)

(declare-fun tp!5570 () Bool)

(assert (=> b!37699 (= e!23885 tp!5570)))

(assert (= (and start!5132 res!22780) b!37698))

(assert (= start!5132 b!37699))

(declare-fun m!30431 () Bool)

(assert (=> start!5132 m!30431))

(declare-fun m!30433 () Bool)

(assert (=> b!37698 m!30433))

(declare-fun m!30435 () Bool)

(assert (=> b!37698 m!30435))

(declare-fun m!30437 () Bool)

(assert (=> b!37698 m!30437))

(check-sat (not b!37698) (not start!5132) (not b!37699))
(check-sat)
(get-model)

(declare-fun d!6057 () Bool)

(declare-fun lt!13899 () Int)

(assert (=> d!6057 (>= lt!13899 0)))

(declare-fun e!23905 () Int)

(assert (=> d!6057 (= lt!13899 e!23905)))

(declare-fun c!4360 () Bool)

(assert (=> d!6057 (= c!4360 ((_ is Nil!976) (t!3811 keys!14)))))

(assert (=> d!6057 (= (ListPrimitiveSize!37 (t!3811 keys!14)) lt!13899)))

(declare-fun b!37724 () Bool)

(assert (=> b!37724 (= e!23905 0)))

(declare-fun b!37725 () Bool)

(assert (=> b!37725 (= e!23905 (+ 1 (ListPrimitiveSize!37 (t!3811 (t!3811 keys!14)))))))

(assert (= (and d!6057 c!4360) b!37724))

(assert (= (and d!6057 (not c!4360)) b!37725))

(declare-fun m!30455 () Bool)

(assert (=> b!37725 m!30455))

(assert (=> b!37698 d!6057))

(declare-fun d!6061 () Bool)

(declare-fun lt!13902 () Int)

(assert (=> d!6061 (>= lt!13902 0)))

(declare-fun e!23908 () Int)

(assert (=> d!6061 (= lt!13902 e!23908)))

(declare-fun c!4363 () Bool)

(assert (=> d!6061 (= c!4363 ((_ is Nil!976) keys!14))))

(assert (=> d!6061 (= (ListPrimitiveSize!37 keys!14) lt!13902)))

(declare-fun b!37730 () Bool)

(assert (=> b!37730 (= e!23908 0)))

(declare-fun b!37731 () Bool)

(assert (=> b!37731 (= e!23908 (+ 1 (ListPrimitiveSize!37 (t!3811 keys!14))))))

(assert (= (and d!6061 c!4363) b!37730))

(assert (= (and d!6061 (not c!4363)) b!37731))

(assert (=> b!37731 m!30433))

(assert (=> b!37698 d!6061))

(declare-fun d!6068 () Bool)

(declare-fun lt!13912 () ListLongMap!987)

(declare-fun contains!462 (ListLongMap!987 (_ BitVec 64)) Bool)

(assert (=> d!6068 (not (contains!462 lt!13912 (h!1543 keys!14)))))

(declare-fun removeStrictlySorted!22 (List!980 (_ BitVec 64)) List!980)

(assert (=> d!6068 (= lt!13912 (ListLongMap!988 (removeStrictlySorted!22 (toList!509 thiss!221) (h!1543 keys!14))))))

(assert (=> d!6068 (= (-!36 thiss!221 (h!1543 keys!14)) lt!13912)))

(declare-fun bs!1488 () Bool)

(assert (= bs!1488 d!6068))

(declare-fun m!30463 () Bool)

(assert (=> bs!1488 m!30463))

(declare-fun m!30465 () Bool)

(assert (=> bs!1488 m!30465))

(assert (=> b!37698 d!6068))

(declare-fun d!6074 () Bool)

(declare-fun isStrictlySorted!186 (List!980) Bool)

(assert (=> d!6074 (= (inv!1659 thiss!221) (isStrictlySorted!186 (toList!509 thiss!221)))))

(declare-fun bs!1491 () Bool)

(assert (= bs!1491 d!6074))

(declare-fun m!30473 () Bool)

(assert (=> bs!1491 m!30473))

(assert (=> start!5132 d!6074))

(declare-fun b!37748 () Bool)

(declare-fun e!23917 () Bool)

(declare-fun tp_is_empty!1681 () Bool)

(declare-fun tp!5583 () Bool)

(assert (=> b!37748 (= e!23917 (and tp_is_empty!1681 tp!5583))))

(assert (=> b!37699 (= tp!5570 e!23917)))

(assert (= (and b!37699 ((_ is Cons!976) (toList!509 thiss!221))) b!37748))

(check-sat (not b!37748) (not d!6068) tp_is_empty!1681 (not b!37731) (not b!37725) (not d!6074))
(check-sat)
