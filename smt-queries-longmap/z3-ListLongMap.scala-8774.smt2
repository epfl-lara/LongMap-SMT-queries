; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106938 () Bool)

(assert start!106938)

(assert (=> start!106938 false))

(declare-fun e!722658 () Bool)

(assert (=> start!106938 e!722658))

(declare-fun b!1268419 () Bool)

(declare-fun tp_is_empty!32557 () Bool)

(declare-fun tp!96524 () Bool)

(assert (=> b!1268419 (= e!722658 (and tp_is_empty!32557 tp!96524))))

(declare-datatypes ((B!2036 0))(
  ( (B!2037 (val!16353 Int)) )
))
(declare-datatypes ((tuple2!21234 0))(
  ( (tuple2!21235 (_1!10628 (_ BitVec 64)) (_2!10628 B!2036)) )
))
(declare-datatypes ((List!28381 0))(
  ( (Nil!28378) (Cons!28377 (h!29595 tuple2!21234) (t!41900 List!28381)) )
))
(declare-fun l!874 () List!28381)

(get-info :version)

(assert (= (and start!106938 ((_ is Cons!28377) l!874)) b!1268419))

(check-sat (not b!1268419) tp_is_empty!32557)
(check-sat)
