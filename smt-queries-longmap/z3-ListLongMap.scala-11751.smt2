; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137844 () Bool)

(assert start!137844)

(declare-fun res!1081492 () Bool)

(declare-fun e!883588 () Bool)

(assert (=> start!137844 (=> (not res!1081492) (not e!883588))))

(declare-datatypes ((B!2846 0))(
  ( (B!2847 (val!19785 Int)) )
))
(declare-datatypes ((tuple2!25806 0))(
  ( (tuple2!25807 (_1!12914 (_ BitVec 64)) (_2!12914 B!2846)) )
))
(declare-datatypes ((List!36946 0))(
  ( (Nil!36943) (Cons!36942 (h!38486 tuple2!25806) (t!51852 List!36946)) )
))
(declare-fun l!548 () List!36946)

(declare-fun isStrictlySorted!1137 (List!36946) Bool)

(assert (=> start!137844 (= res!1081492 (isStrictlySorted!1137 l!548))))

(assert (=> start!137844 e!883588))

(declare-fun e!883587 () Bool)

(assert (=> start!137844 e!883587))

(assert (=> start!137844 true))

(declare-fun b!1583044 () Bool)

(declare-fun res!1081493 () Bool)

(assert (=> b!1583044 (=> (not res!1081493) (not e!883588))))

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583044 (= res!1081493 (and (not (= (_1!12914 (h!38486 l!548)) key!159)) ((_ is Cons!36942) l!548)))))

(declare-fun b!1583045 () Bool)

(assert (=> b!1583045 (= e!883588 (not (isStrictlySorted!1137 (t!51852 l!548))))))

(declare-fun b!1583046 () Bool)

(declare-fun tp_is_empty!39379 () Bool)

(declare-fun tp!114932 () Bool)

(assert (=> b!1583046 (= e!883587 (and tp_is_empty!39379 tp!114932))))

(assert (= (and start!137844 res!1081492) b!1583044))

(assert (= (and b!1583044 res!1081493) b!1583045))

(assert (= (and start!137844 ((_ is Cons!36942) l!548)) b!1583046))

(declare-fun m!1452403 () Bool)

(assert (=> start!137844 m!1452403))

(declare-fun m!1452405 () Bool)

(assert (=> b!1583045 m!1452405))

(check-sat (not start!137844) (not b!1583045) (not b!1583046) tp_is_empty!39379)
(check-sat)
(get-model)

(declare-fun d!166977 () Bool)

(declare-fun res!1081514 () Bool)

(declare-fun e!883609 () Bool)

(assert (=> d!166977 (=> res!1081514 e!883609)))

(assert (=> d!166977 (= res!1081514 (or ((_ is Nil!36943) l!548) ((_ is Nil!36943) (t!51852 l!548))))))

(assert (=> d!166977 (= (isStrictlySorted!1137 l!548) e!883609)))

(declare-fun b!1583073 () Bool)

(declare-fun e!883610 () Bool)

(assert (=> b!1583073 (= e!883609 e!883610)))

(declare-fun res!1081515 () Bool)

(assert (=> b!1583073 (=> (not res!1081515) (not e!883610))))

(assert (=> b!1583073 (= res!1081515 (bvslt (_1!12914 (h!38486 l!548)) (_1!12914 (h!38486 (t!51852 l!548)))))))

(declare-fun b!1583074 () Bool)

(assert (=> b!1583074 (= e!883610 (isStrictlySorted!1137 (t!51852 l!548)))))

(assert (= (and d!166977 (not res!1081514)) b!1583073))

(assert (= (and b!1583073 res!1081515) b!1583074))

(assert (=> b!1583074 m!1452405))

(assert (=> start!137844 d!166977))

(declare-fun d!166983 () Bool)

(declare-fun res!1081516 () Bool)

(declare-fun e!883611 () Bool)

(assert (=> d!166983 (=> res!1081516 e!883611)))

(assert (=> d!166983 (= res!1081516 (or ((_ is Nil!36943) (t!51852 l!548)) ((_ is Nil!36943) (t!51852 (t!51852 l!548)))))))

(assert (=> d!166983 (= (isStrictlySorted!1137 (t!51852 l!548)) e!883611)))

(declare-fun b!1583075 () Bool)

(declare-fun e!883612 () Bool)

(assert (=> b!1583075 (= e!883611 e!883612)))

(declare-fun res!1081517 () Bool)

(assert (=> b!1583075 (=> (not res!1081517) (not e!883612))))

(assert (=> b!1583075 (= res!1081517 (bvslt (_1!12914 (h!38486 (t!51852 l!548))) (_1!12914 (h!38486 (t!51852 (t!51852 l!548))))))))

(declare-fun b!1583076 () Bool)

(assert (=> b!1583076 (= e!883612 (isStrictlySorted!1137 (t!51852 (t!51852 l!548))))))

(assert (= (and d!166983 (not res!1081516)) b!1583075))

(assert (= (and b!1583075 res!1081517) b!1583076))

(declare-fun m!1452417 () Bool)

(assert (=> b!1583076 m!1452417))

(assert (=> b!1583045 d!166983))

(declare-fun b!1583094 () Bool)

(declare-fun e!883626 () Bool)

(declare-fun tp!114944 () Bool)

(assert (=> b!1583094 (= e!883626 (and tp_is_empty!39379 tp!114944))))

(assert (=> b!1583046 (= tp!114932 e!883626)))

(assert (= (and b!1583046 ((_ is Cons!36942) (t!51852 l!548))) b!1583094))

(check-sat (not b!1583076) (not b!1583074) (not b!1583094) tp_is_empty!39379)
(check-sat)
