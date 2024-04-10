; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107800 () Bool)

(assert start!107800)

(assert (=> start!107800 false))

(declare-fun e!727444 () Bool)

(assert (=> start!107800 e!727444))

(assert (=> start!107800 true))

(declare-fun b!1274646 () Bool)

(declare-fun tp_is_empty!33189 () Bool)

(declare-fun tp!97997 () Bool)

(assert (=> b!1274646 (= e!727444 (and tp_is_empty!33189 tp!97997))))

(declare-datatypes ((B!2146 0))(
  ( (B!2147 (val!16669 Int)) )
))
(declare-datatypes ((tuple2!21420 0))(
  ( (tuple2!21421 (_1!10721 (_ BitVec 64)) (_2!10721 B!2146)) )
))
(declare-datatypes ((List!28595 0))(
  ( (Nil!28592) (Cons!28591 (h!29800 tuple2!21420) (t!42128 List!28595)) )
))
(declare-fun l!595 () List!28595)

(get-info :version)

(assert (= (and start!107800 ((_ is Cons!28591) l!595)) b!1274646))

(check-sat (not b!1274646) tp_is_empty!33189)
(check-sat)
