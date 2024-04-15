; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137630 () Bool)

(assert start!137630)

(declare-datatypes ((B!2768 0))(
  ( (B!2769 (val!19746 Int)) )
))
(declare-datatypes ((tuple2!25728 0))(
  ( (tuple2!25729 (_1!12875 (_ BitVec 64)) (_2!12875 B!2768)) )
))
(declare-datatypes ((List!36907 0))(
  ( (Nil!36904) (Cons!36903 (h!38447 tuple2!25728) (t!51813 List!36907)) )
))
(declare-datatypes ((ListLongMap!22839 0))(
  ( (ListLongMap!22840 (toList!11435 List!36907)) )
))
(declare-fun thiss!185 () ListLongMap!22839)

(declare-fun isStrictlySorted!1113 (List!36907) Bool)

(assert (=> start!137630 (not (isStrictlySorted!1113 (toList!11435 thiss!185)))))

(declare-fun e!882959 () Bool)

(declare-fun inv!59111 (ListLongMap!22839) Bool)

(assert (=> start!137630 (and (inv!59111 thiss!185) e!882959)))

(declare-fun b!1582143 () Bool)

(declare-fun tp!114750 () Bool)

(assert (=> b!1582143 (= e!882959 tp!114750)))

(assert (= start!137630 b!1582143))

(declare-fun m!1452001 () Bool)

(assert (=> start!137630 m!1452001))

(declare-fun m!1452003 () Bool)

(assert (=> start!137630 m!1452003))

(check-sat (not start!137630) (not b!1582143))
(check-sat)
(get-model)

(declare-fun d!166750 () Bool)

(declare-fun res!1080982 () Bool)

(declare-fun e!882981 () Bool)

(assert (=> d!166750 (=> res!1080982 e!882981)))

(get-info :version)

(assert (=> d!166750 (= res!1080982 (or ((_ is Nil!36904) (toList!11435 thiss!185)) ((_ is Nil!36904) (t!51813 (toList!11435 thiss!185)))))))

(assert (=> d!166750 (= (isStrictlySorted!1113 (toList!11435 thiss!185)) e!882981)))

(declare-fun b!1582164 () Bool)

(declare-fun e!882983 () Bool)

(assert (=> b!1582164 (= e!882981 e!882983)))

(declare-fun res!1080984 () Bool)

(assert (=> b!1582164 (=> (not res!1080984) (not e!882983))))

(assert (=> b!1582164 (= res!1080984 (bvslt (_1!12875 (h!38447 (toList!11435 thiss!185))) (_1!12875 (h!38447 (t!51813 (toList!11435 thiss!185))))))))

(declare-fun b!1582166 () Bool)

(assert (=> b!1582166 (= e!882983 (isStrictlySorted!1113 (t!51813 (toList!11435 thiss!185))))))

(assert (= (and d!166750 (not res!1080982)) b!1582164))

(assert (= (and b!1582164 res!1080984) b!1582166))

(declare-fun m!1452017 () Bool)

(assert (=> b!1582166 m!1452017))

(assert (=> start!137630 d!166750))

(declare-fun d!166758 () Bool)

(assert (=> d!166758 (= (inv!59111 thiss!185) (isStrictlySorted!1113 (toList!11435 thiss!185)))))

(declare-fun bs!45802 () Bool)

(assert (= bs!45802 d!166758))

(assert (=> bs!45802 m!1452001))

(assert (=> start!137630 d!166758))

(declare-fun b!1582182 () Bool)

(declare-fun e!882992 () Bool)

(declare-fun tp_is_empty!39317 () Bool)

(declare-fun tp!114765 () Bool)

(assert (=> b!1582182 (= e!882992 (and tp_is_empty!39317 tp!114765))))

(assert (=> b!1582143 (= tp!114750 e!882992)))

(assert (= (and b!1582143 ((_ is Cons!36903) (toList!11435 thiss!185))) b!1582182))

(check-sat (not d!166758) (not b!1582166) (not b!1582182) tp_is_empty!39317)
(check-sat)
