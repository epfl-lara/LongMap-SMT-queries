; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89006 () Bool)

(assert start!89006)

(declare-fun b!1020647 () Bool)

(declare-fun res!684152 () Bool)

(declare-fun e!574563 () Bool)

(assert (=> b!1020647 (=> (not res!684152) (not e!574563))))

(declare-datatypes ((B!1748 0))(
  ( (B!1749 (val!11958 Int)) )
))
(declare-datatypes ((tuple2!15542 0))(
  ( (tuple2!15543 (_1!7782 (_ BitVec 64)) (_2!7782 B!1748)) )
))
(declare-datatypes ((List!21681 0))(
  ( (Nil!21678) (Cons!21677 (h!22875 tuple2!15542) (t!30682 List!21681)) )
))
(declare-fun l!1367 () List!21681)

(declare-fun lt!449746 () tuple2!15542)

(get-info :version)

(assert (=> b!1020647 (= res!684152 (or (not ((_ is Cons!21677) l!1367)) (= (h!22875 l!1367) lt!449746)))))

(declare-fun b!1020648 () Bool)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!556 (List!21681 (_ BitVec 64)) Bool)

(assert (=> b!1020648 (= e!574563 (not (containsKey!556 l!1367 key!393)))))

(declare-fun b!1020646 () Bool)

(declare-fun e!574564 () Bool)

(assert (=> b!1020646 (= e!574564 e!574563)))

(declare-fun res!684153 () Bool)

(assert (=> b!1020646 (=> (not res!684153) (not e!574563))))

(declare-fun contains!5913 (List!21681 tuple2!15542) Bool)

(assert (=> b!1020646 (= res!684153 (contains!5913 l!1367 lt!449746))))

(declare-fun value!188 () B!1748)

(assert (=> b!1020646 (= lt!449746 (tuple2!15543 key!393 value!188))))

(declare-fun b!1020649 () Bool)

(declare-fun e!574565 () Bool)

(declare-fun tp_is_empty!23815 () Bool)

(declare-fun tp!71308 () Bool)

(assert (=> b!1020649 (= e!574565 (and tp_is_empty!23815 tp!71308))))

(declare-fun res!684154 () Bool)

(assert (=> start!89006 (=> (not res!684154) (not e!574564))))

(declare-fun isStrictlySorted!707 (List!21681) Bool)

(assert (=> start!89006 (= res!684154 (isStrictlySorted!707 l!1367))))

(assert (=> start!89006 e!574564))

(assert (=> start!89006 e!574565))

(assert (=> start!89006 true))

(assert (=> start!89006 tp_is_empty!23815))

(assert (= (and start!89006 res!684154) b!1020646))

(assert (= (and b!1020646 res!684153) b!1020647))

(assert (= (and b!1020647 res!684152) b!1020648))

(assert (= (and start!89006 ((_ is Cons!21677) l!1367)) b!1020649))

(declare-fun m!939965 () Bool)

(assert (=> b!1020648 m!939965))

(declare-fun m!939967 () Bool)

(assert (=> b!1020646 m!939967))

(declare-fun m!939969 () Bool)

(assert (=> start!89006 m!939969))

(check-sat tp_is_empty!23815 (not b!1020649) (not start!89006) (not b!1020648) (not b!1020646))
(check-sat)
(get-model)

(declare-fun d!122308 () Bool)

(declare-fun res!684187 () Bool)

(declare-fun e!574598 () Bool)

(assert (=> d!122308 (=> res!684187 e!574598)))

(assert (=> d!122308 (= res!684187 (and ((_ is Cons!21677) l!1367) (= (_1!7782 (h!22875 l!1367)) key!393)))))

(assert (=> d!122308 (= (containsKey!556 l!1367 key!393) e!574598)))

(declare-fun b!1020688 () Bool)

(declare-fun e!574599 () Bool)

(assert (=> b!1020688 (= e!574598 e!574599)))

(declare-fun res!684188 () Bool)

(assert (=> b!1020688 (=> (not res!684188) (not e!574599))))

(assert (=> b!1020688 (= res!684188 (and (or (not ((_ is Cons!21677) l!1367)) (bvsle (_1!7782 (h!22875 l!1367)) key!393)) ((_ is Cons!21677) l!1367) (bvslt (_1!7782 (h!22875 l!1367)) key!393)))))

(declare-fun b!1020689 () Bool)

(assert (=> b!1020689 (= e!574599 (containsKey!556 (t!30682 l!1367) key!393))))

(assert (= (and d!122308 (not res!684187)) b!1020688))

(assert (= (and b!1020688 res!684188) b!1020689))

(declare-fun m!939985 () Bool)

(assert (=> b!1020689 m!939985))

(assert (=> b!1020648 d!122308))

(declare-fun d!122315 () Bool)

(declare-fun res!684203 () Bool)

(declare-fun e!574614 () Bool)

(assert (=> d!122315 (=> res!684203 e!574614)))

(assert (=> d!122315 (= res!684203 (or ((_ is Nil!21678) l!1367) ((_ is Nil!21678) (t!30682 l!1367))))))

(assert (=> d!122315 (= (isStrictlySorted!707 l!1367) e!574614)))

(declare-fun b!1020704 () Bool)

(declare-fun e!574615 () Bool)

(assert (=> b!1020704 (= e!574614 e!574615)))

(declare-fun res!684204 () Bool)

(assert (=> b!1020704 (=> (not res!684204) (not e!574615))))

(assert (=> b!1020704 (= res!684204 (bvslt (_1!7782 (h!22875 l!1367)) (_1!7782 (h!22875 (t!30682 l!1367)))))))

(declare-fun b!1020705 () Bool)

(assert (=> b!1020705 (= e!574615 (isStrictlySorted!707 (t!30682 l!1367)))))

(assert (= (and d!122315 (not res!684203)) b!1020704))

(assert (= (and b!1020704 res!684204) b!1020705))

(declare-fun m!939993 () Bool)

(assert (=> b!1020705 m!939993))

(assert (=> start!89006 d!122315))

(declare-fun d!122319 () Bool)

(declare-fun lt!449760 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!506 (List!21681) (InoxSet tuple2!15542))

(assert (=> d!122319 (= lt!449760 (select (content!506 l!1367) lt!449746))))

(declare-fun e!574632 () Bool)

(assert (=> d!122319 (= lt!449760 e!574632)))

(declare-fun res!684221 () Bool)

(assert (=> d!122319 (=> (not res!684221) (not e!574632))))

(assert (=> d!122319 (= res!684221 ((_ is Cons!21677) l!1367))))

(assert (=> d!122319 (= (contains!5913 l!1367 lt!449746) lt!449760)))

(declare-fun b!1020722 () Bool)

(declare-fun e!574633 () Bool)

(assert (=> b!1020722 (= e!574632 e!574633)))

(declare-fun res!684222 () Bool)

(assert (=> b!1020722 (=> res!684222 e!574633)))

(assert (=> b!1020722 (= res!684222 (= (h!22875 l!1367) lt!449746))))

(declare-fun b!1020723 () Bool)

(assert (=> b!1020723 (= e!574633 (contains!5913 (t!30682 l!1367) lt!449746))))

(assert (= (and d!122319 res!684221) b!1020722))

(assert (= (and b!1020722 (not res!684222)) b!1020723))

(declare-fun m!939999 () Bool)

(assert (=> d!122319 m!939999))

(declare-fun m!940003 () Bool)

(assert (=> d!122319 m!940003))

(declare-fun m!940007 () Bool)

(assert (=> b!1020723 m!940007))

(assert (=> b!1020646 d!122319))

(declare-fun b!1020741 () Bool)

(declare-fun e!574645 () Bool)

(declare-fun tp!71322 () Bool)

(assert (=> b!1020741 (= e!574645 (and tp_is_empty!23815 tp!71322))))

(assert (=> b!1020649 (= tp!71308 e!574645)))

(assert (= (and b!1020649 ((_ is Cons!21677) (t!30682 l!1367))) b!1020741))

(check-sat tp_is_empty!23815 (not b!1020689) (not b!1020705) (not b!1020741) (not d!122319) (not b!1020723))
(check-sat)
