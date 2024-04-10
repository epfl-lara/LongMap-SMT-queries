; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89010 () Bool)

(assert start!89010)

(declare-fun res!684230 () Bool)

(declare-fun e!574662 () Bool)

(assert (=> start!89010 (=> (not res!684230) (not e!574662))))

(declare-datatypes ((B!1750 0))(
  ( (B!1751 (val!11959 Int)) )
))
(declare-datatypes ((tuple2!15464 0))(
  ( (tuple2!15465 (_1!7743 (_ BitVec 64)) (_2!7743 B!1750)) )
))
(declare-datatypes ((List!21647 0))(
  ( (Nil!21644) (Cons!21643 (h!22841 tuple2!15464) (t!30657 List!21647)) )
))
(declare-fun l!1367 () List!21647)

(declare-fun isStrictlySorted!712 (List!21647) Bool)

(assert (=> start!89010 (= res!684230 (isStrictlySorted!712 l!1367))))

(assert (=> start!89010 e!574662))

(declare-fun e!574661 () Bool)

(assert (=> start!89010 e!574661))

(assert (=> start!89010 true))

(declare-fun tp_is_empty!23817 () Bool)

(assert (=> start!89010 tp_is_empty!23817))

(declare-fun b!1020804 () Bool)

(declare-fun res!684228 () Bool)

(declare-fun e!574660 () Bool)

(assert (=> b!1020804 (=> (not res!684228) (not e!574660))))

(declare-fun lt!449949 () tuple2!15464)

(get-info :version)

(assert (=> b!1020804 (= res!684228 (or (not ((_ is Cons!21643) l!1367)) (= (h!22841 l!1367) lt!449949)))))

(declare-fun b!1020805 () Bool)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!557 (List!21647 (_ BitVec 64)) Bool)

(assert (=> b!1020805 (= e!574660 (not (containsKey!557 l!1367 key!393)))))

(declare-fun b!1020803 () Bool)

(assert (=> b!1020803 (= e!574662 e!574660)))

(declare-fun res!684229 () Bool)

(assert (=> b!1020803 (=> (not res!684229) (not e!574660))))

(declare-fun contains!5938 (List!21647 tuple2!15464) Bool)

(assert (=> b!1020803 (= res!684229 (contains!5938 l!1367 lt!449949))))

(declare-fun value!188 () B!1750)

(assert (=> b!1020803 (= lt!449949 (tuple2!15465 key!393 value!188))))

(declare-fun b!1020806 () Bool)

(declare-fun tp!71311 () Bool)

(assert (=> b!1020806 (= e!574661 (and tp_is_empty!23817 tp!71311))))

(assert (= (and start!89010 res!684230) b!1020803))

(assert (= (and b!1020803 res!684229) b!1020804))

(assert (= (and b!1020804 res!684228) b!1020805))

(assert (= (and start!89010 ((_ is Cons!21643) l!1367)) b!1020806))

(declare-fun m!940591 () Bool)

(assert (=> start!89010 m!940591))

(declare-fun m!940593 () Bool)

(assert (=> b!1020805 m!940593))

(declare-fun m!940595 () Bool)

(assert (=> b!1020803 m!940595))

(check-sat tp_is_empty!23817 (not b!1020805) (not b!1020806) (not b!1020803) (not start!89010))
(check-sat)
(get-model)

(declare-fun d!122459 () Bool)

(declare-fun lt!449955 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!505 (List!21647) (InoxSet tuple2!15464))

(assert (=> d!122459 (= lt!449955 (select (content!505 l!1367) lt!449949))))

(declare-fun e!574683 () Bool)

(assert (=> d!122459 (= lt!449955 e!574683)))

(declare-fun res!684251 () Bool)

(assert (=> d!122459 (=> (not res!684251) (not e!574683))))

(assert (=> d!122459 (= res!684251 ((_ is Cons!21643) l!1367))))

(assert (=> d!122459 (= (contains!5938 l!1367 lt!449949) lt!449955)))

(declare-fun b!1020829 () Bool)

(declare-fun e!574682 () Bool)

(assert (=> b!1020829 (= e!574683 e!574682)))

(declare-fun res!684250 () Bool)

(assert (=> b!1020829 (=> res!684250 e!574682)))

(assert (=> b!1020829 (= res!684250 (= (h!22841 l!1367) lt!449949))))

(declare-fun b!1020830 () Bool)

(assert (=> b!1020830 (= e!574682 (contains!5938 (t!30657 l!1367) lt!449949))))

(assert (= (and d!122459 res!684251) b!1020829))

(assert (= (and b!1020829 (not res!684250)) b!1020830))

(declare-fun m!940605 () Bool)

(assert (=> d!122459 m!940605))

(declare-fun m!940607 () Bool)

(assert (=> d!122459 m!940607))

(declare-fun m!940609 () Bool)

(assert (=> b!1020830 m!940609))

(assert (=> b!1020803 d!122459))

(declare-fun d!122465 () Bool)

(declare-fun res!684262 () Bool)

(declare-fun e!574694 () Bool)

(assert (=> d!122465 (=> res!684262 e!574694)))

(assert (=> d!122465 (= res!684262 (and ((_ is Cons!21643) l!1367) (= (_1!7743 (h!22841 l!1367)) key!393)))))

(assert (=> d!122465 (= (containsKey!557 l!1367 key!393) e!574694)))

(declare-fun b!1020841 () Bool)

(declare-fun e!574695 () Bool)

(assert (=> b!1020841 (= e!574694 e!574695)))

(declare-fun res!684263 () Bool)

(assert (=> b!1020841 (=> (not res!684263) (not e!574695))))

(assert (=> b!1020841 (= res!684263 (and (or (not ((_ is Cons!21643) l!1367)) (bvsle (_1!7743 (h!22841 l!1367)) key!393)) ((_ is Cons!21643) l!1367) (bvslt (_1!7743 (h!22841 l!1367)) key!393)))))

(declare-fun b!1020842 () Bool)

(assert (=> b!1020842 (= e!574695 (containsKey!557 (t!30657 l!1367) key!393))))

(assert (= (and d!122465 (not res!684262)) b!1020841))

(assert (= (and b!1020841 res!684263) b!1020842))

(declare-fun m!940617 () Bool)

(assert (=> b!1020842 m!940617))

(assert (=> b!1020805 d!122465))

(declare-fun d!122469 () Bool)

(declare-fun res!684278 () Bool)

(declare-fun e!574710 () Bool)

(assert (=> d!122469 (=> res!684278 e!574710)))

(assert (=> d!122469 (= res!684278 (or ((_ is Nil!21644) l!1367) ((_ is Nil!21644) (t!30657 l!1367))))))

(assert (=> d!122469 (= (isStrictlySorted!712 l!1367) e!574710)))

(declare-fun b!1020857 () Bool)

(declare-fun e!574711 () Bool)

(assert (=> b!1020857 (= e!574710 e!574711)))

(declare-fun res!684279 () Bool)

(assert (=> b!1020857 (=> (not res!684279) (not e!574711))))

(assert (=> b!1020857 (= res!684279 (bvslt (_1!7743 (h!22841 l!1367)) (_1!7743 (h!22841 (t!30657 l!1367)))))))

(declare-fun b!1020858 () Bool)

(assert (=> b!1020858 (= e!574711 (isStrictlySorted!712 (t!30657 l!1367)))))

(assert (= (and d!122469 (not res!684278)) b!1020857))

(assert (= (and b!1020857 res!684279) b!1020858))

(declare-fun m!940621 () Bool)

(assert (=> b!1020858 m!940621))

(assert (=> start!89010 d!122469))

(declare-fun b!1020867 () Bool)

(declare-fun e!574716 () Bool)

(declare-fun tp!71319 () Bool)

(assert (=> b!1020867 (= e!574716 (and tp_is_empty!23817 tp!71319))))

(assert (=> b!1020806 (= tp!71311 e!574716)))

(assert (= (and b!1020806 ((_ is Cons!21643) (t!30657 l!1367))) b!1020867))

(check-sat (not d!122459) (not b!1020867) (not b!1020830) (not b!1020858) (not b!1020842) tp_is_empty!23817)
(check-sat)
