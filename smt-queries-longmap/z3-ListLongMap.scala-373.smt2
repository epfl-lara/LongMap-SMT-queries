; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7102 () Bool)

(assert start!7102)

(assert (=> start!7102 false))

(declare-fun e!28927 () Bool)

(assert (=> start!7102 e!28927))

(declare-fun b!45438 () Bool)

(declare-fun tp_is_empty!1915 () Bool)

(declare-fun tp!5966 () Bool)

(assert (=> b!45438 (= e!28927 (and tp_is_empty!1915 tp!5966))))

(declare-datatypes ((B!818 0))(
  ( (B!819 (val!996 Int)) )
))
(declare-datatypes ((tuple2!1622 0))(
  ( (tuple2!1623 (_1!822 (_ BitVec 64)) (_2!822 B!818)) )
))
(declare-datatypes ((List!1200 0))(
  ( (Nil!1197) (Cons!1196 (h!1776 tuple2!1622) (t!4225 List!1200)) )
))
(declare-fun l!812 () List!1200)

(get-info :version)

(assert (= (and start!7102 ((_ is Cons!1196) l!812)) b!45438))

(check-sat (not b!45438) tp_is_empty!1915)
(check-sat)
