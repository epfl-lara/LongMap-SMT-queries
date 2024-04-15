; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106326 () Bool)

(assert start!106326)

(assert (=> start!106326 false))

(declare-fun e!720314 () Bool)

(assert (=> start!106326 e!720314))

(declare-fun b!1264869 () Bool)

(declare-fun tp_is_empty!32461 () Bool)

(declare-fun tp!96257 () Bool)

(assert (=> b!1264869 (= e!720314 (and tp_is_empty!32461 tp!96257))))

(declare-datatypes ((B!1928 0))(
  ( (B!1929 (val!16299 Int)) )
))
(declare-datatypes ((tuple2!21198 0))(
  ( (tuple2!21199 (_1!10610 (_ BitVec 64)) (_2!10610 B!1928)) )
))
(declare-datatypes ((List!28375 0))(
  ( (Nil!28372) (Cons!28371 (h!29580 tuple2!21198) (t!41887 List!28375)) )
))
(declare-fun l!706 () List!28375)

(get-info :version)

(assert (= (and start!106326 ((_ is Cons!28371) l!706)) b!1264869))

(check-sat (not b!1264869) tp_is_empty!32461)
(check-sat)
