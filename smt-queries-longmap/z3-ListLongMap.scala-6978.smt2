; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88408 () Bool)

(assert start!88408)

(declare-fun b!1017299 () Bool)

(declare-fun res!682345 () Bool)

(declare-fun e!572342 () Bool)

(assert (=> b!1017299 (=> (not res!682345) (not e!572342))))

(declare-datatypes ((B!1574 0))(
  ( (B!1575 (val!11871 Int)) )
))
(declare-datatypes ((tuple2!15368 0))(
  ( (tuple2!15369 (_1!7695 (_ BitVec 64)) (_2!7695 B!1574)) )
))
(declare-datatypes ((List!21594 0))(
  ( (Nil!21591) (Cons!21590 (h!22788 tuple2!15368) (t!30586 List!21594)) )
))
(declare-fun l!1036 () List!21594)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!619 0))(
  ( (Some!618 (v!14466 B!1574)) (None!617) )
))
(declare-fun isDefined!416 (Option!619) Bool)

(declare-fun getValueByKey!568 (List!21594 (_ BitVec 64)) Option!619)

(assert (=> b!1017299 (= res!682345 (isDefined!416 (getValueByKey!568 (t!30586 l!1036) key!271)))))

(declare-fun b!1017300 () Bool)

(declare-fun res!682346 () Bool)

(assert (=> b!1017300 (=> (not res!682346) (not e!572342))))

(assert (=> b!1017300 (= res!682346 (isDefined!416 (getValueByKey!568 l!1036 key!271)))))

(declare-fun b!1017301 () Bool)

(declare-fun res!682342 () Bool)

(assert (=> b!1017301 (=> (not res!682342) (not e!572342))))

(get-info :version)

(assert (=> b!1017301 (= res!682342 (and ((_ is Cons!21590) l!1036) (not (= (_1!7695 (h!22788 l!1036)) key!271))))))

(declare-fun b!1017302 () Bool)

(assert (=> b!1017302 (= e!572342 (not true))))

(declare-fun containsKey!502 (List!21594 (_ BitVec 64)) Bool)

(assert (=> b!1017302 (containsKey!502 (t!30586 l!1036) key!271)))

(declare-datatypes ((Unit!33165 0))(
  ( (Unit!33166) )
))
(declare-fun lt!449251 () Unit!33165)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!22 (List!21594 (_ BitVec 64)) Unit!33165)

(assert (=> b!1017302 (= lt!449251 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!22 (t!30586 l!1036) key!271))))

(declare-fun b!1017303 () Bool)

(declare-fun e!572343 () Bool)

(declare-fun tp_is_empty!23641 () Bool)

(declare-fun tp!70883 () Bool)

(assert (=> b!1017303 (= e!572343 (and tp_is_empty!23641 tp!70883))))

(declare-fun b!1017304 () Bool)

(declare-fun res!682343 () Bool)

(assert (=> b!1017304 (=> (not res!682343) (not e!572342))))

(declare-fun isStrictlySorted!629 (List!21594) Bool)

(assert (=> b!1017304 (= res!682343 (isStrictlySorted!629 (t!30586 l!1036)))))

(declare-fun res!682344 () Bool)

(assert (=> start!88408 (=> (not res!682344) (not e!572342))))

(assert (=> start!88408 (= res!682344 (isStrictlySorted!629 l!1036))))

(assert (=> start!88408 e!572342))

(assert (=> start!88408 e!572343))

(assert (=> start!88408 true))

(assert (= (and start!88408 res!682344) b!1017300))

(assert (= (and b!1017300 res!682346) b!1017301))

(assert (= (and b!1017301 res!682342) b!1017304))

(assert (= (and b!1017304 res!682343) b!1017299))

(assert (= (and b!1017299 res!682345) b!1017302))

(assert (= (and start!88408 ((_ is Cons!21590) l!1036)) b!1017303))

(declare-fun m!938173 () Bool)

(assert (=> start!88408 m!938173))

(declare-fun m!938175 () Bool)

(assert (=> b!1017302 m!938175))

(declare-fun m!938177 () Bool)

(assert (=> b!1017302 m!938177))

(declare-fun m!938179 () Bool)

(assert (=> b!1017300 m!938179))

(assert (=> b!1017300 m!938179))

(declare-fun m!938181 () Bool)

(assert (=> b!1017300 m!938181))

(declare-fun m!938183 () Bool)

(assert (=> b!1017304 m!938183))

(declare-fun m!938185 () Bool)

(assert (=> b!1017299 m!938185))

(assert (=> b!1017299 m!938185))

(declare-fun m!938187 () Bool)

(assert (=> b!1017299 m!938187))

(check-sat (not b!1017299) tp_is_empty!23641 (not b!1017303) (not start!88408) (not b!1017300) (not b!1017302) (not b!1017304))
(check-sat)
