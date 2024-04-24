; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88644 () Bool)

(assert start!88644)

(declare-fun res!682920 () Bool)

(declare-fun e!573276 () Bool)

(assert (=> start!88644 (=> (not res!682920) (not e!573276))))

(declare-datatypes ((B!1574 0))(
  ( (B!1575 (val!11871 Int)) )
))
(declare-datatypes ((tuple2!15292 0))(
  ( (tuple2!15293 (_1!7657 (_ BitVec 64)) (_2!7657 B!1574)) )
))
(declare-datatypes ((List!21548 0))(
  ( (Nil!21545) (Cons!21544 (h!22751 tuple2!15292) (t!30541 List!21548)) )
))
(declare-fun l!1036 () List!21548)

(declare-fun isStrictlySorted!621 (List!21548) Bool)

(assert (=> start!88644 (= res!682920 (isStrictlySorted!621 l!1036))))

(assert (=> start!88644 e!573276))

(declare-fun e!573277 () Bool)

(assert (=> start!88644 e!573277))

(assert (=> start!88644 true))

(declare-fun b!1018765 () Bool)

(assert (=> b!1018765 (= e!573276 (not true))))

(declare-fun key!271 () (_ BitVec 64))

(declare-fun containsKey!504 (List!21548 (_ BitVec 64)) Bool)

(assert (=> b!1018765 (containsKey!504 (t!30541 l!1036) key!271)))

(declare-datatypes ((Unit!33270 0))(
  ( (Unit!33271) )
))
(declare-fun lt!449966 () Unit!33270)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!22 (List!21548 (_ BitVec 64)) Unit!33270)

(assert (=> b!1018765 (= lt!449966 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!22 (t!30541 l!1036) key!271))))

(declare-fun b!1018766 () Bool)

(declare-fun res!682921 () Bool)

(assert (=> b!1018766 (=> (not res!682921) (not e!573276))))

(get-info :version)

(assert (=> b!1018766 (= res!682921 (and ((_ is Cons!21544) l!1036) (not (= (_1!7657 (h!22751 l!1036)) key!271))))))

(declare-fun b!1018767 () Bool)

(declare-fun tp_is_empty!23641 () Bool)

(declare-fun tp!70883 () Bool)

(assert (=> b!1018767 (= e!573277 (and tp_is_empty!23641 tp!70883))))

(declare-fun b!1018768 () Bool)

(declare-fun res!682919 () Bool)

(assert (=> b!1018768 (=> (not res!682919) (not e!573276))))

(declare-datatypes ((Option!613 0))(
  ( (Some!612 (v!14463 B!1574)) (None!611) )
))
(declare-fun isDefined!412 (Option!613) Bool)

(declare-fun getValueByKey!562 (List!21548 (_ BitVec 64)) Option!613)

(assert (=> b!1018768 (= res!682919 (isDefined!412 (getValueByKey!562 l!1036 key!271)))))

(declare-fun b!1018769 () Bool)

(declare-fun res!682922 () Bool)

(assert (=> b!1018769 (=> (not res!682922) (not e!573276))))

(assert (=> b!1018769 (= res!682922 (isStrictlySorted!621 (t!30541 l!1036)))))

(declare-fun b!1018770 () Bool)

(declare-fun res!682923 () Bool)

(assert (=> b!1018770 (=> (not res!682923) (not e!573276))))

(assert (=> b!1018770 (= res!682923 (isDefined!412 (getValueByKey!562 (t!30541 l!1036) key!271)))))

(assert (= (and start!88644 res!682920) b!1018768))

(assert (= (and b!1018768 res!682919) b!1018766))

(assert (= (and b!1018766 res!682921) b!1018769))

(assert (= (and b!1018769 res!682922) b!1018770))

(assert (= (and b!1018770 res!682923) b!1018765))

(assert (= (and start!88644 ((_ is Cons!21544) l!1036)) b!1018767))

(declare-fun m!940455 () Bool)

(assert (=> b!1018768 m!940455))

(assert (=> b!1018768 m!940455))

(declare-fun m!940457 () Bool)

(assert (=> b!1018768 m!940457))

(declare-fun m!940459 () Bool)

(assert (=> b!1018770 m!940459))

(assert (=> b!1018770 m!940459))

(declare-fun m!940461 () Bool)

(assert (=> b!1018770 m!940461))

(declare-fun m!940463 () Bool)

(assert (=> start!88644 m!940463))

(declare-fun m!940465 () Bool)

(assert (=> b!1018769 m!940465))

(declare-fun m!940467 () Bool)

(assert (=> b!1018765 m!940467))

(declare-fun m!940469 () Bool)

(assert (=> b!1018765 m!940469))

(check-sat (not b!1018769) tp_is_empty!23641 (not b!1018767) (not b!1018770) (not b!1018768) (not b!1018765) (not start!88644))
(check-sat)
