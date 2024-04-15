; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106710 () Bool)

(assert start!106710)

(assert (=> start!106710 false))

(declare-fun e!721766 () Bool)

(assert (=> start!106710 e!721766))

(declare-fun b!1267032 () Bool)

(declare-fun tp_is_empty!32557 () Bool)

(declare-fun tp!96524 () Bool)

(assert (=> b!1267032 (= e!721766 (and tp_is_empty!32557 tp!96524))))

(declare-datatypes ((B!2036 0))(
  ( (B!2037 (val!16353 Int)) )
))
(declare-datatypes ((tuple2!21306 0))(
  ( (tuple2!21307 (_1!10664 (_ BitVec 64)) (_2!10664 B!2036)) )
))
(declare-datatypes ((List!28429 0))(
  ( (Nil!28426) (Cons!28425 (h!29634 tuple2!21306) (t!41947 List!28429)) )
))
(declare-fun l!874 () List!28429)

(get-info :version)

(assert (= (and start!106710 ((_ is Cons!28425) l!874)) b!1267032))

(check-sat (not b!1267032) tp_is_empty!32557)
(check-sat)
