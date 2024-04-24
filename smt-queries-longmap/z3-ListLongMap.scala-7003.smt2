; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89146 () Bool)

(assert start!89146)

(declare-fun res!684371 () Bool)

(declare-fun e!575118 () Bool)

(assert (=> start!89146 (=> (not res!684371) (not e!575118))))

(declare-datatypes ((B!1724 0))(
  ( (B!1725 (val!11946 Int)) )
))
(declare-datatypes ((tuple2!15442 0))(
  ( (tuple2!15443 (_1!7732 (_ BitVec 64)) (_2!7732 B!1724)) )
))
(declare-datatypes ((List!21623 0))(
  ( (Nil!21620) (Cons!21619 (h!22826 tuple2!15442) (t!30625 List!21623)) )
))
(declare-fun l!1367 () List!21623)

(declare-fun isStrictlySorted!687 (List!21623) Bool)

(assert (=> start!89146 (= res!684371 (isStrictlySorted!687 l!1367))))

(assert (=> start!89146 e!575118))

(declare-fun e!575117 () Bool)

(assert (=> start!89146 e!575117))

(assert (=> start!89146 true))

(declare-fun tp_is_empty!23791 () Bool)

(assert (=> start!89146 tp_is_empty!23791))

(declare-fun b!1021615 () Bool)

(declare-fun res!684370 () Bool)

(assert (=> b!1021615 (=> (not res!684370) (not e!575118))))

(declare-fun value!188 () B!1724)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun contains!5948 (List!21623 tuple2!15442) Bool)

(assert (=> b!1021615 (= res!684370 (contains!5948 l!1367 (tuple2!15443 key!393 value!188)))))

(declare-fun b!1021616 () Bool)

(declare-fun ListPrimitiveSize!139 (List!21623) Int)

(assert (=> b!1021616 (= e!575118 (< (ListPrimitiveSize!139 l!1367) 0))))

(declare-fun b!1021617 () Bool)

(declare-fun tp!71236 () Bool)

(assert (=> b!1021617 (= e!575117 (and tp_is_empty!23791 tp!71236))))

(assert (= (and start!89146 res!684371) b!1021615))

(assert (= (and b!1021615 res!684370) b!1021616))

(get-info :version)

(assert (= (and start!89146 ((_ is Cons!21619) l!1367)) b!1021617))

(declare-fun m!941967 () Bool)

(assert (=> start!89146 m!941967))

(declare-fun m!941969 () Bool)

(assert (=> b!1021615 m!941969))

(declare-fun m!941971 () Bool)

(assert (=> b!1021616 m!941971))

(check-sat (not b!1021615) (not b!1021617) tp_is_empty!23791 (not start!89146) (not b!1021616))
(check-sat)
(get-model)

(declare-fun d!122791 () Bool)

(declare-fun lt!450354 () Int)

(assert (=> d!122791 (>= lt!450354 0)))

(declare-fun e!575139 () Int)

(assert (=> d!122791 (= lt!450354 e!575139)))

(declare-fun c!103910 () Bool)

(assert (=> d!122791 (= c!103910 ((_ is Nil!21620) l!1367))))

(assert (=> d!122791 (= (ListPrimitiveSize!139 l!1367) lt!450354)))

(declare-fun b!1021648 () Bool)

(assert (=> b!1021648 (= e!575139 0)))

(declare-fun b!1021649 () Bool)

(assert (=> b!1021649 (= e!575139 (+ 1 (ListPrimitiveSize!139 (t!30625 l!1367))))))

(assert (= (and d!122791 c!103910) b!1021648))

(assert (= (and d!122791 (not c!103910)) b!1021649))

(declare-fun m!941985 () Bool)

(assert (=> b!1021649 m!941985))

(assert (=> b!1021616 d!122791))

(declare-fun lt!450362 () Bool)

(declare-fun d!122799 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!497 (List!21623) (InoxSet tuple2!15442))

(assert (=> d!122799 (= lt!450362 (select (content!497 l!1367) (tuple2!15443 key!393 value!188)))))

(declare-fun e!575157 () Bool)

(assert (=> d!122799 (= lt!450362 e!575157)))

(declare-fun res!684404 () Bool)

(assert (=> d!122799 (=> (not res!684404) (not e!575157))))

(assert (=> d!122799 (= res!684404 ((_ is Cons!21619) l!1367))))

(assert (=> d!122799 (= (contains!5948 l!1367 (tuple2!15443 key!393 value!188)) lt!450362)))

(declare-fun b!1021668 () Bool)

(declare-fun e!575158 () Bool)

(assert (=> b!1021668 (= e!575157 e!575158)))

(declare-fun res!684405 () Bool)

(assert (=> b!1021668 (=> res!684405 e!575158)))

(assert (=> b!1021668 (= res!684405 (= (h!22826 l!1367) (tuple2!15443 key!393 value!188)))))

(declare-fun b!1021669 () Bool)

(assert (=> b!1021669 (= e!575158 (contains!5948 (t!30625 l!1367) (tuple2!15443 key!393 value!188)))))

(assert (= (and d!122799 res!684404) b!1021668))

(assert (= (and b!1021668 (not res!684405)) b!1021669))

(declare-fun m!942001 () Bool)

(assert (=> d!122799 m!942001))

(declare-fun m!942003 () Bool)

(assert (=> d!122799 m!942003))

(declare-fun m!942005 () Bool)

(assert (=> b!1021669 m!942005))

(assert (=> b!1021615 d!122799))

(declare-fun d!122805 () Bool)

(declare-fun res!684418 () Bool)

(declare-fun e!575174 () Bool)

(assert (=> d!122805 (=> res!684418 e!575174)))

(assert (=> d!122805 (= res!684418 (or ((_ is Nil!21620) l!1367) ((_ is Nil!21620) (t!30625 l!1367))))))

(assert (=> d!122805 (= (isStrictlySorted!687 l!1367) e!575174)))

(declare-fun b!1021688 () Bool)

(declare-fun e!575175 () Bool)

(assert (=> b!1021688 (= e!575174 e!575175)))

(declare-fun res!684419 () Bool)

(assert (=> b!1021688 (=> (not res!684419) (not e!575175))))

(assert (=> b!1021688 (= res!684419 (bvslt (_1!7732 (h!22826 l!1367)) (_1!7732 (h!22826 (t!30625 l!1367)))))))

(declare-fun b!1021689 () Bool)

(assert (=> b!1021689 (= e!575175 (isStrictlySorted!687 (t!30625 l!1367)))))

(assert (= (and d!122805 (not res!684418)) b!1021688))

(assert (= (and b!1021688 res!684419) b!1021689))

(declare-fun m!942013 () Bool)

(assert (=> b!1021689 m!942013))

(assert (=> start!89146 d!122805))

(declare-fun b!1021704 () Bool)

(declare-fun e!575184 () Bool)

(declare-fun tp!71251 () Bool)

(assert (=> b!1021704 (= e!575184 (and tp_is_empty!23791 tp!71251))))

(assert (=> b!1021617 (= tp!71236 e!575184)))

(assert (= (and b!1021617 ((_ is Cons!21619) (t!30625 l!1367))) b!1021704))

(check-sat (not d!122799) (not b!1021704) (not b!1021689) tp_is_empty!23791 (not b!1021669) (not b!1021649))
(check-sat)
