; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71990 () Bool)

(assert start!71990)

(declare-fun res!568976 () Bool)

(declare-fun e!466538 () Bool)

(assert (=> start!71990 (=> (not res!568976) (not e!466538))))

(declare-datatypes ((B!1182 0))(
  ( (B!1183 (val!7673 Int)) )
))
(declare-datatypes ((tuple2!10206 0))(
  ( (tuple2!10207 (_1!5114 (_ BitVec 64)) (_2!5114 B!1182)) )
))
(declare-datatypes ((List!15978 0))(
  ( (Nil!15975) (Cons!15974 (h!17105 tuple2!10206) (t!22349 List!15978)) )
))
(declare-fun l!390 () List!15978)

(declare-fun isStrictlySorted!448 (List!15978) Bool)

(assert (=> start!71990 (= res!568976 (isStrictlySorted!448 l!390))))

(assert (=> start!71990 e!466538))

(declare-fun e!466539 () Bool)

(assert (=> start!71990 e!466539))

(declare-fun b!836280 () Bool)

(declare-fun res!568975 () Bool)

(assert (=> b!836280 (=> (not res!568975) (not e!466538))))

(assert (=> b!836280 (= res!568975 (is-Cons!15974 l!390))))

(declare-fun b!836281 () Bool)

(assert (=> b!836281 (= e!466538 (not (isStrictlySorted!448 (t!22349 l!390))))))

(declare-fun b!836282 () Bool)

(declare-fun tp_is_empty!15251 () Bool)

(declare-fun tp!47411 () Bool)

(assert (=> b!836282 (= e!466539 (and tp_is_empty!15251 tp!47411))))

(assert (= (and start!71990 res!568976) b!836280))

(assert (= (and b!836280 res!568975) b!836281))

(assert (= (and start!71990 (is-Cons!15974 l!390)) b!836282))

(declare-fun m!781647 () Bool)

(assert (=> start!71990 m!781647))

(declare-fun m!781649 () Bool)

(assert (=> b!836281 m!781649))

(push 1)

(assert (not start!71990))

(assert (not b!836281))

(assert (not b!836282))

(assert tp_is_empty!15251)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107555 () Bool)

(declare-fun res!568997 () Bool)

(declare-fun e!466560 () Bool)

(assert (=> d!107555 (=> res!568997 e!466560)))

(assert (=> d!107555 (= res!568997 (or (is-Nil!15975 l!390) (is-Nil!15975 (t!22349 l!390))))))

(assert (=> d!107555 (= (isStrictlySorted!448 l!390) e!466560)))

(declare-fun b!836303 () Bool)

(declare-fun e!466561 () Bool)

(assert (=> b!836303 (= e!466560 e!466561)))

(declare-fun res!568998 () Bool)

(assert (=> b!836303 (=> (not res!568998) (not e!466561))))

(assert (=> b!836303 (= res!568998 (bvslt (_1!5114 (h!17105 l!390)) (_1!5114 (h!17105 (t!22349 l!390)))))))

(declare-fun b!836304 () Bool)

(assert (=> b!836304 (= e!466561 (isStrictlySorted!448 (t!22349 l!390)))))

(assert (= (and d!107555 (not res!568997)) b!836303))

(assert (= (and b!836303 res!568998) b!836304))

(assert (=> b!836304 m!781649))

(assert (=> start!71990 d!107555))

(declare-fun d!107561 () Bool)

(declare-fun res!568999 () Bool)

(declare-fun e!466566 () Bool)

(assert (=> d!107561 (=> res!568999 e!466566)))

(assert (=> d!107561 (= res!568999 (or (is-Nil!15975 (t!22349 l!390)) (is-Nil!15975 (t!22349 (t!22349 l!390)))))))

(assert (=> d!107561 (= (isStrictlySorted!448 (t!22349 l!390)) e!466566)))

(declare-fun b!836313 () Bool)

(declare-fun e!466567 () Bool)

(assert (=> b!836313 (= e!466566 e!466567)))

(declare-fun res!569000 () Bool)

(assert (=> b!836313 (=> (not res!569000) (not e!466567))))

(assert (=> b!836313 (= res!569000 (bvslt (_1!5114 (h!17105 (t!22349 l!390))) (_1!5114 (h!17105 (t!22349 (t!22349 l!390))))))))

(declare-fun b!836314 () Bool)

(assert (=> b!836314 (= e!466567 (isStrictlySorted!448 (t!22349 (t!22349 l!390))))))

(assert (= (and d!107561 (not res!568999)) b!836313))

(assert (= (and b!836313 res!569000) b!836314))

(declare-fun m!781655 () Bool)

(assert (=> b!836314 m!781655))

(assert (=> b!836281 d!107561))

(declare-fun b!836321 () Bool)

(declare-fun e!466572 () Bool)

(declare-fun tp!47420 () Bool)

(assert (=> b!836321 (= e!466572 (and tp_is_empty!15251 tp!47420))))

(assert (=> b!836282 (= tp!47411 e!466572)))

(assert (= (and b!836282 (is-Cons!15974 (t!22349 l!390))) b!836321))

(push 1)

