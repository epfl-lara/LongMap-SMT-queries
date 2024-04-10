; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5136 () Bool)

(assert start!5136)

(declare-fun res!22800 () Bool)

(declare-fun e!23919 () Bool)

(assert (=> start!5136 (=> (not res!22800) (not e!23919))))

(declare-datatypes ((List!988 0))(
  ( (Nil!985) (Cons!984 (h!1552 (_ BitVec 64)) (t!3821 List!988)) )
))
(declare-fun keys!14 () List!988)

(get-info :version)

(assert (=> start!5136 (= res!22800 (not ((_ is Nil!985) keys!14)))))

(assert (=> start!5136 e!23919))

(assert (=> start!5136 true))

(declare-datatypes ((B!760 0))(
  ( (B!761 (val!880 Int)) )
))
(declare-datatypes ((tuple2!1420 0))(
  ( (tuple2!1421 (_1!721 (_ BitVec 64)) (_2!721 B!760)) )
))
(declare-datatypes ((List!989 0))(
  ( (Nil!986) (Cons!985 (h!1553 tuple2!1420) (t!3822 List!989)) )
))
(declare-datatypes ((ListLongMap!997 0))(
  ( (ListLongMap!998 (toList!514 List!989)) )
))
(declare-fun thiss!221 () ListLongMap!997)

(declare-fun e!23920 () Bool)

(declare-fun inv!1660 (ListLongMap!997) Bool)

(assert (=> start!5136 (and (inv!1660 thiss!221) e!23920)))

(declare-fun b!37743 () Bool)

(declare-fun ListPrimitiveSize!38 (List!988) Int)

(assert (=> b!37743 (= e!23919 (>= (ListPrimitiveSize!38 (t!3821 keys!14)) (ListPrimitiveSize!38 keys!14)))))

(declare-fun lt!13892 () ListLongMap!997)

(declare-fun -!37 (ListLongMap!997 (_ BitVec 64)) ListLongMap!997)

(assert (=> b!37743 (= lt!13892 (-!37 thiss!221 (h!1552 keys!14)))))

(declare-fun b!37744 () Bool)

(declare-fun tp!5573 () Bool)

(assert (=> b!37744 (= e!23920 tp!5573)))

(assert (= (and start!5136 res!22800) b!37743))

(assert (= start!5136 b!37744))

(declare-fun m!30483 () Bool)

(assert (=> start!5136 m!30483))

(declare-fun m!30485 () Bool)

(assert (=> b!37743 m!30485))

(declare-fun m!30487 () Bool)

(assert (=> b!37743 m!30487))

(declare-fun m!30489 () Bool)

(assert (=> b!37743 m!30489))

(check-sat (not b!37743) (not start!5136) (not b!37744))
(check-sat)
(get-model)

(declare-fun d!6071 () Bool)

(declare-fun lt!13904 () Int)

(assert (=> d!6071 (>= lt!13904 0)))

(declare-fun e!23935 () Int)

(assert (=> d!6071 (= lt!13904 e!23935)))

(declare-fun c!4373 () Bool)

(assert (=> d!6071 (= c!4373 ((_ is Nil!985) (t!3821 keys!14)))))

(assert (=> d!6071 (= (ListPrimitiveSize!38 (t!3821 keys!14)) lt!13904)))

(declare-fun b!37767 () Bool)

(assert (=> b!37767 (= e!23935 0)))

(declare-fun b!37768 () Bool)

(assert (=> b!37768 (= e!23935 (+ 1 (ListPrimitiveSize!38 (t!3821 (t!3821 keys!14)))))))

(assert (= (and d!6071 c!4373) b!37767))

(assert (= (and d!6071 (not c!4373)) b!37768))

(declare-fun m!30501 () Bool)

(assert (=> b!37768 m!30501))

(assert (=> b!37743 d!6071))

(declare-fun d!6081 () Bool)

(declare-fun lt!13906 () Int)

(assert (=> d!6081 (>= lt!13906 0)))

(declare-fun e!23937 () Int)

(assert (=> d!6081 (= lt!13906 e!23937)))

(declare-fun c!4375 () Bool)

(assert (=> d!6081 (= c!4375 ((_ is Nil!985) keys!14))))

(assert (=> d!6081 (= (ListPrimitiveSize!38 keys!14) lt!13906)))

(declare-fun b!37771 () Bool)

(assert (=> b!37771 (= e!23937 0)))

(declare-fun b!37772 () Bool)

(assert (=> b!37772 (= e!23937 (+ 1 (ListPrimitiveSize!38 (t!3821 keys!14))))))

(assert (= (and d!6081 c!4375) b!37771))

(assert (= (and d!6081 (not c!4375)) b!37772))

(assert (=> b!37772 m!30485))

(assert (=> b!37743 d!6081))

(declare-fun d!6085 () Bool)

(declare-fun lt!13916 () ListLongMap!997)

(declare-fun contains!465 (ListLongMap!997 (_ BitVec 64)) Bool)

(assert (=> d!6085 (not (contains!465 lt!13916 (h!1552 keys!14)))))

(declare-fun removeStrictlySorted!22 (List!989 (_ BitVec 64)) List!989)

(assert (=> d!6085 (= lt!13916 (ListLongMap!998 (removeStrictlySorted!22 (toList!514 thiss!221) (h!1552 keys!14))))))

(assert (=> d!6085 (= (-!37 thiss!221 (h!1552 keys!14)) lt!13916)))

(declare-fun bs!1492 () Bool)

(assert (= bs!1492 d!6085))

(declare-fun m!30513 () Bool)

(assert (=> bs!1492 m!30513))

(declare-fun m!30516 () Bool)

(assert (=> bs!1492 m!30516))

(assert (=> b!37743 d!6085))

(declare-fun d!6092 () Bool)

(declare-fun isStrictlySorted!192 (List!989) Bool)

(assert (=> d!6092 (= (inv!1660 thiss!221) (isStrictlySorted!192 (toList!514 thiss!221)))))

(declare-fun bs!1494 () Bool)

(assert (= bs!1494 d!6092))

(declare-fun m!30521 () Bool)

(assert (=> bs!1494 m!30521))

(assert (=> start!5136 d!6092))

(declare-fun b!37789 () Bool)

(declare-fun e!23947 () Bool)

(declare-fun tp_is_empty!1685 () Bool)

(declare-fun tp!5585 () Bool)

(assert (=> b!37789 (= e!23947 (and tp_is_empty!1685 tp!5585))))

(assert (=> b!37744 (= tp!5573 e!23947)))

(assert (= (and b!37744 ((_ is Cons!985) (toList!514 thiss!221))) b!37789))

(check-sat (not b!37789) (not b!37768) (not b!37772) tp_is_empty!1685 (not d!6085) (not d!6092))
(check-sat)
