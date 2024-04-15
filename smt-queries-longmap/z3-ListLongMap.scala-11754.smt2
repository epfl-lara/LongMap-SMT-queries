; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137892 () Bool)

(assert start!137892)

(declare-fun res!1081595 () Bool)

(declare-fun e!883749 () Bool)

(assert (=> start!137892 (=> (not res!1081595) (not e!883749))))

(declare-datatypes ((B!2864 0))(
  ( (B!2865 (val!19794 Int)) )
))
(declare-datatypes ((tuple2!25824 0))(
  ( (tuple2!25825 (_1!12923 (_ BitVec 64)) (_2!12923 B!2864)) )
))
(declare-datatypes ((List!36955 0))(
  ( (Nil!36952) (Cons!36951 (h!38495 tuple2!25824) (t!51861 List!36955)) )
))
(declare-fun l!548 () List!36955)

(declare-fun isStrictlySorted!1146 (List!36955) Bool)

(assert (=> start!137892 (= res!1081595 (isStrictlySorted!1146 l!548))))

(assert (=> start!137892 e!883749))

(declare-fun e!883750 () Bool)

(assert (=> start!137892 e!883750))

(assert (=> start!137892 true))

(declare-fun b!1583261 () Bool)

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583261 (= e!883749 (and (or (not ((_ is Cons!36951) l!548)) (not (= (_1!12923 (h!38495 l!548)) key!159))) (or (not ((_ is Cons!36951) l!548)) (= (_1!12923 (h!38495 l!548)) key!159)) (not ((_ is Nil!36952) l!548))))))

(declare-fun b!1583262 () Bool)

(declare-fun tp_is_empty!39397 () Bool)

(declare-fun tp!114986 () Bool)

(assert (=> b!1583262 (= e!883750 (and tp_is_empty!39397 tp!114986))))

(assert (= (and start!137892 res!1081595) b!1583261))

(assert (= (and start!137892 ((_ is Cons!36951) l!548)) b!1583262))

(declare-fun m!1452475 () Bool)

(assert (=> start!137892 m!1452475))

(check-sat (not start!137892) (not b!1583262) tp_is_empty!39397)
(check-sat)
