; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43776 () Bool)

(assert start!43776)

(declare-fun res!288233 () Bool)

(declare-fun e!284690 () Bool)

(assert (=> start!43776 (=> (not res!288233) (not e!284690))))

(declare-datatypes ((B!1118 0))(
  ( (B!1119 (val!7011 Int)) )
))
(declare-datatypes ((tuple2!9274 0))(
  ( (tuple2!9275 (_1!4648 (_ BitVec 64)) (_2!4648 B!1118)) )
))
(declare-datatypes ((List!9313 0))(
  ( (Nil!9310) (Cons!9309 (h!10165 tuple2!9274) (t!15526 List!9313)) )
))
(declare-fun l!956 () List!9313)

(declare-fun isStrictlySorted!410 (List!9313) Bool)

(assert (=> start!43776 (= res!288233 (isStrictlySorted!410 l!956))))

(assert (=> start!43776 e!284690))

(declare-fun e!284691 () Bool)

(assert (=> start!43776 e!284691))

(assert (=> start!43776 true))

(declare-fun b!483701 () Bool)

(declare-fun res!288232 () Bool)

(assert (=> b!483701 (=> (not res!288232) (not e!284690))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!375 (List!9313 (_ BitVec 64)) Bool)

(assert (=> b!483701 (= res!288232 (not (containsKey!375 l!956 key!251)))))

(declare-fun b!483702 () Bool)

(declare-fun ListPrimitiveSize!61 (List!9313) Int)

(assert (=> b!483702 (= e!284690 (< (ListPrimitiveSize!61 l!956) 0))))

(declare-fun b!483703 () Bool)

(declare-fun tp_is_empty!13927 () Bool)

(declare-fun tp!43480 () Bool)

(assert (=> b!483703 (= e!284691 (and tp_is_empty!13927 tp!43480))))

(assert (= (and start!43776 res!288233) b!483701))

(assert (= (and b!483701 res!288232) b!483702))

(get-info :version)

(assert (= (and start!43776 ((_ is Cons!9309) l!956)) b!483703))

(declare-fun m!464109 () Bool)

(assert (=> start!43776 m!464109))

(declare-fun m!464111 () Bool)

(assert (=> b!483701 m!464111))

(declare-fun m!464113 () Bool)

(assert (=> b!483702 m!464113))

(check-sat (not b!483701) (not b!483702) tp_is_empty!13927 (not start!43776) (not b!483703))
(check-sat)
(get-model)

(declare-fun d!76823 () Bool)

(declare-fun res!288254 () Bool)

(declare-fun e!284712 () Bool)

(assert (=> d!76823 (=> res!288254 e!284712)))

(assert (=> d!76823 (= res!288254 (or ((_ is Nil!9310) l!956) ((_ is Nil!9310) (t!15526 l!956))))))

(assert (=> d!76823 (= (isStrictlySorted!410 l!956) e!284712)))

(declare-fun b!483730 () Bool)

(declare-fun e!284713 () Bool)

(assert (=> b!483730 (= e!284712 e!284713)))

(declare-fun res!288255 () Bool)

(assert (=> b!483730 (=> (not res!288255) (not e!284713))))

(assert (=> b!483730 (= res!288255 (bvslt (_1!4648 (h!10165 l!956)) (_1!4648 (h!10165 (t!15526 l!956)))))))

(declare-fun b!483731 () Bool)

(assert (=> b!483731 (= e!284713 (isStrictlySorted!410 (t!15526 l!956)))))

(assert (= (and d!76823 (not res!288254)) b!483730))

(assert (= (and b!483730 res!288255) b!483731))

(declare-fun m!464127 () Bool)

(assert (=> b!483731 m!464127))

(assert (=> start!43776 d!76823))

(declare-fun d!76829 () Bool)

(declare-fun lt!219105 () Int)

(assert (=> d!76829 (>= lt!219105 0)))

(declare-fun e!284723 () Int)

(assert (=> d!76829 (= lt!219105 e!284723)))

(declare-fun c!58100 () Bool)

(assert (=> d!76829 (= c!58100 ((_ is Nil!9310) l!956))))

(assert (=> d!76829 (= (ListPrimitiveSize!61 l!956) lt!219105)))

(declare-fun b!483748 () Bool)

(assert (=> b!483748 (= e!284723 0)))

(declare-fun b!483749 () Bool)

(assert (=> b!483749 (= e!284723 (+ 1 (ListPrimitiveSize!61 (t!15526 l!956))))))

(assert (= (and d!76829 c!58100) b!483748))

(assert (= (and d!76829 (not c!58100)) b!483749))

(declare-fun m!464133 () Bool)

(assert (=> b!483749 m!464133))

(assert (=> b!483702 d!76829))

(declare-fun d!76835 () Bool)

(declare-fun res!288272 () Bool)

(declare-fun e!284739 () Bool)

(assert (=> d!76835 (=> res!288272 e!284739)))

(assert (=> d!76835 (= res!288272 (and ((_ is Cons!9309) l!956) (= (_1!4648 (h!10165 l!956)) key!251)))))

(assert (=> d!76835 (= (containsKey!375 l!956 key!251) e!284739)))

(declare-fun b!483766 () Bool)

(declare-fun e!284740 () Bool)

(assert (=> b!483766 (= e!284739 e!284740)))

(declare-fun res!288273 () Bool)

(assert (=> b!483766 (=> (not res!288273) (not e!284740))))

(assert (=> b!483766 (= res!288273 (and (or (not ((_ is Cons!9309) l!956)) (bvsle (_1!4648 (h!10165 l!956)) key!251)) ((_ is Cons!9309) l!956) (bvslt (_1!4648 (h!10165 l!956)) key!251)))))

(declare-fun b!483767 () Bool)

(assert (=> b!483767 (= e!284740 (containsKey!375 (t!15526 l!956) key!251))))

(assert (= (and d!76835 (not res!288272)) b!483766))

(assert (= (and b!483766 res!288273) b!483767))

(declare-fun m!464139 () Bool)

(assert (=> b!483767 m!464139))

(assert (=> b!483701 d!76835))

(declare-fun b!483774 () Bool)

(declare-fun e!284745 () Bool)

(declare-fun tp!43489 () Bool)

(assert (=> b!483774 (= e!284745 (and tp_is_empty!13927 tp!43489))))

(assert (=> b!483703 (= tp!43480 e!284745)))

(assert (= (and b!483703 ((_ is Cons!9309) (t!15526 l!956))) b!483774))

(check-sat (not b!483731) (not b!483749) (not b!483774) (not b!483767) tp_is_empty!13927)
(check-sat)
