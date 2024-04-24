; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89242 () Bool)

(assert start!89242)

(declare-fun b!1022112 () Bool)

(declare-fun e!575497 () Bool)

(declare-fun e!575499 () Bool)

(assert (=> b!1022112 (= e!575497 e!575499)))

(declare-fun res!684731 () Bool)

(assert (=> b!1022112 (=> (not res!684731) (not e!575499))))

(declare-datatypes ((B!1748 0))(
  ( (B!1749 (val!11958 Int)) )
))
(declare-datatypes ((tuple2!15466 0))(
  ( (tuple2!15467 (_1!7744 (_ BitVec 64)) (_2!7744 B!1748)) )
))
(declare-datatypes ((List!21635 0))(
  ( (Nil!21632) (Cons!21631 (h!22838 tuple2!15466) (t!30637 List!21635)) )
))
(declare-fun l!1367 () List!21635)

(declare-fun lt!450461 () tuple2!15466)

(declare-fun contains!5960 (List!21635 tuple2!15466) Bool)

(assert (=> b!1022112 (= res!684731 (contains!5960 l!1367 lt!450461))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1748)

(assert (=> b!1022112 (= lt!450461 (tuple2!15467 key!393 value!188))))

(declare-fun b!1022115 () Bool)

(declare-fun e!575498 () Bool)

(declare-fun tp_is_empty!23815 () Bool)

(declare-fun tp!71308 () Bool)

(assert (=> b!1022115 (= e!575498 (and tp_is_empty!23815 tp!71308))))

(declare-fun b!1022113 () Bool)

(declare-fun res!684729 () Bool)

(assert (=> b!1022113 (=> (not res!684729) (not e!575499))))

(get-info :version)

(assert (=> b!1022113 (= res!684729 (or (not ((_ is Cons!21631) l!1367)) (= (h!22838 l!1367) lt!450461)))))

(declare-fun b!1022114 () Bool)

(declare-fun containsKey!558 (List!21635 (_ BitVec 64)) Bool)

(assert (=> b!1022114 (= e!575499 (not (containsKey!558 l!1367 key!393)))))

(declare-fun res!684730 () Bool)

(assert (=> start!89242 (=> (not res!684730) (not e!575497))))

(declare-fun isStrictlySorted!699 (List!21635) Bool)

(assert (=> start!89242 (= res!684730 (isStrictlySorted!699 l!1367))))

(assert (=> start!89242 e!575497))

(assert (=> start!89242 e!575498))

(assert (=> start!89242 true))

(assert (=> start!89242 tp_is_empty!23815))

(assert (= (and start!89242 res!684730) b!1022112))

(assert (= (and b!1022112 res!684731) b!1022113))

(assert (= (and b!1022113 res!684729) b!1022114))

(assert (= (and start!89242 ((_ is Cons!21631) l!1367)) b!1022115))

(declare-fun m!942249 () Bool)

(assert (=> b!1022112 m!942249))

(declare-fun m!942251 () Bool)

(assert (=> b!1022114 m!942251))

(declare-fun m!942253 () Bool)

(assert (=> start!89242 m!942253))

(check-sat (not b!1022112) tp_is_empty!23815 (not b!1022115) (not start!89242) (not b!1022114))
(check-sat)
(get-model)

(declare-fun d!122921 () Bool)

(declare-fun res!684760 () Bool)

(declare-fun e!575528 () Bool)

(assert (=> d!122921 (=> res!684760 e!575528)))

(assert (=> d!122921 (= res!684760 (and ((_ is Cons!21631) l!1367) (= (_1!7744 (h!22838 l!1367)) key!393)))))

(assert (=> d!122921 (= (containsKey!558 l!1367 key!393) e!575528)))

(declare-fun b!1022150 () Bool)

(declare-fun e!575529 () Bool)

(assert (=> b!1022150 (= e!575528 e!575529)))

(declare-fun res!684761 () Bool)

(assert (=> b!1022150 (=> (not res!684761) (not e!575529))))

(assert (=> b!1022150 (= res!684761 (and (or (not ((_ is Cons!21631) l!1367)) (bvsle (_1!7744 (h!22838 l!1367)) key!393)) ((_ is Cons!21631) l!1367) (bvslt (_1!7744 (h!22838 l!1367)) key!393)))))

(declare-fun b!1022151 () Bool)

(assert (=> b!1022151 (= e!575529 (containsKey!558 (t!30637 l!1367) key!393))))

(assert (= (and d!122921 (not res!684760)) b!1022150))

(assert (= (and b!1022150 res!684761) b!1022151))

(declare-fun m!942269 () Bool)

(assert (=> b!1022151 m!942269))

(assert (=> b!1022114 d!122921))

(declare-fun d!122927 () Bool)

(declare-fun res!684776 () Bool)

(declare-fun e!575544 () Bool)

(assert (=> d!122927 (=> res!684776 e!575544)))

(assert (=> d!122927 (= res!684776 (or ((_ is Nil!21632) l!1367) ((_ is Nil!21632) (t!30637 l!1367))))))

(assert (=> d!122927 (= (isStrictlySorted!699 l!1367) e!575544)))

(declare-fun b!1022166 () Bool)

(declare-fun e!575545 () Bool)

(assert (=> b!1022166 (= e!575544 e!575545)))

(declare-fun res!684777 () Bool)

(assert (=> b!1022166 (=> (not res!684777) (not e!575545))))

(assert (=> b!1022166 (= res!684777 (bvslt (_1!7744 (h!22838 l!1367)) (_1!7744 (h!22838 (t!30637 l!1367)))))))

(declare-fun b!1022167 () Bool)

(assert (=> b!1022167 (= e!575545 (isStrictlySorted!699 (t!30637 l!1367)))))

(assert (= (and d!122927 (not res!684776)) b!1022166))

(assert (= (and b!1022166 res!684777) b!1022167))

(declare-fun m!942277 () Bool)

(assert (=> b!1022167 m!942277))

(assert (=> start!89242 d!122927))

(declare-fun d!122931 () Bool)

(declare-fun lt!450475 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!509 (List!21635) (InoxSet tuple2!15466))

(assert (=> d!122931 (= lt!450475 (select (content!509 l!1367) lt!450461))))

(declare-fun e!575563 () Bool)

(assert (=> d!122931 (= lt!450475 e!575563)))

(declare-fun res!684795 () Bool)

(assert (=> d!122931 (=> (not res!684795) (not e!575563))))

(assert (=> d!122931 (= res!684795 ((_ is Cons!21631) l!1367))))

(assert (=> d!122931 (= (contains!5960 l!1367 lt!450461) lt!450475)))

(declare-fun b!1022184 () Bool)

(declare-fun e!575562 () Bool)

(assert (=> b!1022184 (= e!575563 e!575562)))

(declare-fun res!684794 () Bool)

(assert (=> b!1022184 (=> res!684794 e!575562)))

(assert (=> b!1022184 (= res!684794 (= (h!22838 l!1367) lt!450461))))

(declare-fun b!1022185 () Bool)

(assert (=> b!1022185 (= e!575562 (contains!5960 (t!30637 l!1367) lt!450461))))

(assert (= (and d!122931 res!684795) b!1022184))

(assert (= (and b!1022184 (not res!684794)) b!1022185))

(declare-fun m!942283 () Bool)

(assert (=> d!122931 m!942283))

(declare-fun m!942285 () Bool)

(assert (=> d!122931 m!942285))

(declare-fun m!942287 () Bool)

(assert (=> b!1022185 m!942287))

(assert (=> b!1022112 d!122931))

(declare-fun b!1022200 () Bool)

(declare-fun e!575574 () Bool)

(declare-fun tp!71319 () Bool)

(assert (=> b!1022200 (= e!575574 (and tp_is_empty!23815 tp!71319))))

(assert (=> b!1022115 (= tp!71308 e!575574)))

(assert (= (and b!1022115 ((_ is Cons!21631) (t!30637 l!1367))) b!1022200))

(check-sat (not b!1022151) (not b!1022200) (not b!1022185) (not b!1022167) (not d!122931) tp_is_empty!23815)
(check-sat)
