; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137928 () Bool)

(assert start!137928)

(declare-fun res!1081727 () Bool)

(declare-fun e!883953 () Bool)

(assert (=> start!137928 (=> (not res!1081727) (not e!883953))))

(declare-datatypes ((B!2866 0))(
  ( (B!2867 (val!19795 Int)) )
))
(declare-datatypes ((tuple2!25758 0))(
  ( (tuple2!25759 (_1!12890 (_ BitVec 64)) (_2!12890 B!2866)) )
))
(declare-datatypes ((List!36915 0))(
  ( (Nil!36912) (Cons!36911 (h!38454 tuple2!25758) (t!51829 List!36915)) )
))
(declare-fun l!548 () List!36915)

(declare-fun isStrictlySorted!1149 (List!36915) Bool)

(assert (=> start!137928 (= res!1081727 (isStrictlySorted!1149 l!548))))

(assert (=> start!137928 e!883953))

(declare-fun e!883954 () Bool)

(assert (=> start!137928 e!883954))

(assert (=> start!137928 true))

(declare-fun b!1583580 () Bool)

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583580 (= e!883953 (and (or (not ((_ is Cons!36911) l!548)) (not (= (_1!12890 (h!38454 l!548)) key!159))) (or (not ((_ is Cons!36911) l!548)) (= (_1!12890 (h!38454 l!548)) key!159)) (not ((_ is Nil!36912) l!548))))))

(declare-fun b!1583581 () Bool)

(declare-fun tp_is_empty!39399 () Bool)

(declare-fun tp!114988 () Bool)

(assert (=> b!1583581 (= e!883954 (and tp_is_empty!39399 tp!114988))))

(assert (= (and start!137928 res!1081727) b!1583580))

(assert (= (and start!137928 ((_ is Cons!36911) l!548)) b!1583581))

(declare-fun m!1453357 () Bool)

(assert (=> start!137928 m!1453357))

(check-sat (not start!137928) (not b!1583581) tp_is_empty!39399)
(check-sat)
