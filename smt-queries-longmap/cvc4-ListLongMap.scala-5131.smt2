; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69672 () Bool)

(assert start!69672)

(declare-datatypes ((B!1170 0))(
  ( (B!1171 (val!7037 Int)) )
))
(declare-datatypes ((tuple2!9276 0))(
  ( (tuple2!9277 (_1!4649 (_ BitVec 64)) (_2!4649 B!1170)) )
))
(declare-datatypes ((List!15088 0))(
  ( (Nil!15085) (Cons!15084 (h!16213 tuple2!9276) (t!21403 List!15088)) )
))
(declare-datatypes ((ListLongMap!8099 0))(
  ( (ListLongMap!8100 (toList!4065 List!15088)) )
))
(declare-fun thiss!191 () ListLongMap!8099)

(declare-fun isStrictlySorted!440 (List!15088) Bool)

(assert (=> start!69672 (not (isStrictlySorted!440 (toList!4065 thiss!191)))))

(declare-fun e!449288 () Bool)

(declare-fun inv!25919 (ListLongMap!8099) Bool)

(assert (=> start!69672 (and (inv!25919 thiss!191) e!449288)))

(declare-fun b!811797 () Bool)

(declare-fun tp!43627 () Bool)

(assert (=> b!811797 (= e!449288 tp!43627)))

(assert (= start!69672 b!811797))

(declare-fun m!754279 () Bool)

(assert (=> start!69672 m!754279))

(declare-fun m!754281 () Bool)

(assert (=> start!69672 m!754281))

(push 1)

(assert (not start!69672))

(assert (not b!811797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104213 () Bool)

(declare-fun res!554848 () Bool)

(declare-fun e!449311 () Bool)

(assert (=> d!104213 (=> res!554848 e!449311)))

(assert (=> d!104213 (= res!554848 (or (is-Nil!15085 (toList!4065 thiss!191)) (is-Nil!15085 (t!21403 (toList!4065 thiss!191)))))))

(assert (=> d!104213 (= (isStrictlySorted!440 (toList!4065 thiss!191)) e!449311)))

(declare-fun b!811824 () Bool)

(declare-fun e!449312 () Bool)

(assert (=> b!811824 (= e!449311 e!449312)))

(declare-fun res!554849 () Bool)

(assert (=> b!811824 (=> (not res!554849) (not e!449312))))

(assert (=> b!811824 (= res!554849 (bvslt (_1!4649 (h!16213 (toList!4065 thiss!191))) (_1!4649 (h!16213 (t!21403 (toList!4065 thiss!191))))))))

(declare-fun b!811825 () Bool)

