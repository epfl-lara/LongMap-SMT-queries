; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87514 () Bool)

(assert start!87514)

(declare-fun res!680246 () Bool)

(declare-fun e!570032 () Bool)

(assert (=> start!87514 (=> (not res!680246) (not e!570032))))

(declare-datatypes ((B!1310 0))(
  ( (B!1311 (val!11739 Int)) )
))
(declare-datatypes ((tuple2!15028 0))(
  ( (tuple2!15029 (_1!7525 (_ BitVec 64)) (_2!7525 B!1310)) )
))
(declare-datatypes ((List!21320 0))(
  ( (Nil!21317) (Cons!21316 (h!22523 tuple2!15028) (t!30313 List!21320)) )
))
(declare-fun l!412 () List!21320)

(declare-fun isStrictlySorted!507 (List!21320) Bool)

(assert (=> start!87514 (= res!680246 (isStrictlySorted!507 l!412))))

(assert (=> start!87514 e!570032))

(declare-fun e!570033 () Bool)

(assert (=> start!87514 e!570033))

(declare-fun tp_is_empty!23377 () Bool)

(assert (=> start!87514 tp_is_empty!23377))

(declare-fun b!1013114 () Bool)

(declare-fun res!680245 () Bool)

(assert (=> b!1013114 (=> (not res!680245) (not e!570032))))

(declare-fun value!115 () B!1310)

(get-info :version)

(assert (=> b!1013114 (= res!680245 (and ((_ is Cons!21316) l!412) (= (_2!7525 (h!22523 l!412)) value!115)))))

(declare-fun b!1013115 () Bool)

(assert (=> b!1013115 (= e!570032 (not (isStrictlySorted!507 (t!30313 l!412))))))

(declare-fun b!1013116 () Bool)

(declare-fun tp!70212 () Bool)

(assert (=> b!1013116 (= e!570033 (and tp_is_empty!23377 tp!70212))))

(assert (= (and start!87514 res!680246) b!1013114))

(assert (= (and b!1013114 res!680245) b!1013115))

(assert (= (and start!87514 ((_ is Cons!21316) l!412)) b!1013116))

(declare-fun m!937385 () Bool)

(assert (=> start!87514 m!937385))

(declare-fun m!937387 () Bool)

(assert (=> b!1013115 m!937387))

(check-sat (not b!1013115) (not start!87514) (not b!1013116) tp_is_empty!23377)
(check-sat)
(get-model)

(declare-fun d!120669 () Bool)

(declare-fun res!680271 () Bool)

(declare-fun e!570058 () Bool)

(assert (=> d!120669 (=> res!680271 e!570058)))

(assert (=> d!120669 (= res!680271 (or ((_ is Nil!21317) (t!30313 l!412)) ((_ is Nil!21317) (t!30313 (t!30313 l!412)))))))

(assert (=> d!120669 (= (isStrictlySorted!507 (t!30313 l!412)) e!570058)))

(declare-fun b!1013147 () Bool)

(declare-fun e!570059 () Bool)

(assert (=> b!1013147 (= e!570058 e!570059)))

(declare-fun res!680272 () Bool)

(assert (=> b!1013147 (=> (not res!680272) (not e!570059))))

(assert (=> b!1013147 (= res!680272 (bvslt (_1!7525 (h!22523 (t!30313 l!412))) (_1!7525 (h!22523 (t!30313 (t!30313 l!412))))))))

(declare-fun b!1013148 () Bool)

(assert (=> b!1013148 (= e!570059 (isStrictlySorted!507 (t!30313 (t!30313 l!412))))))

(assert (= (and d!120669 (not res!680271)) b!1013147))

(assert (= (and b!1013147 res!680272) b!1013148))

(declare-fun m!937397 () Bool)

(assert (=> b!1013148 m!937397))

(assert (=> b!1013115 d!120669))

(declare-fun d!120675 () Bool)

(declare-fun res!680275 () Bool)

(declare-fun e!570062 () Bool)

(assert (=> d!120675 (=> res!680275 e!570062)))

(assert (=> d!120675 (= res!680275 (or ((_ is Nil!21317) l!412) ((_ is Nil!21317) (t!30313 l!412))))))

(assert (=> d!120675 (= (isStrictlySorted!507 l!412) e!570062)))

(declare-fun b!1013151 () Bool)

(declare-fun e!570063 () Bool)

(assert (=> b!1013151 (= e!570062 e!570063)))

(declare-fun res!680276 () Bool)

(assert (=> b!1013151 (=> (not res!680276) (not e!570063))))

(assert (=> b!1013151 (= res!680276 (bvslt (_1!7525 (h!22523 l!412)) (_1!7525 (h!22523 (t!30313 l!412)))))))

(declare-fun b!1013152 () Bool)

(assert (=> b!1013152 (= e!570063 (isStrictlySorted!507 (t!30313 l!412)))))

(assert (= (and d!120675 (not res!680275)) b!1013151))

(assert (= (and b!1013151 res!680276) b!1013152))

(assert (=> b!1013152 m!937387))

(assert (=> start!87514 d!120675))

(declare-fun b!1013171 () Bool)

(declare-fun e!570076 () Bool)

(declare-fun tp!70225 () Bool)

(assert (=> b!1013171 (= e!570076 (and tp_is_empty!23377 tp!70225))))

(assert (=> b!1013116 (= tp!70212 e!570076)))

(assert (= (and b!1013116 ((_ is Cons!21316) (t!30313 l!412))) b!1013171))

(check-sat (not b!1013152) (not b!1013148) (not b!1013171) tp_is_empty!23377)
(check-sat)
