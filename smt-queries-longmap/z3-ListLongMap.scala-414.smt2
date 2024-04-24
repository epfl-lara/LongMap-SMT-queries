; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7780 () Bool)

(assert start!7780)

(assert (=> start!7780 false))

(declare-fun e!31701 () Bool)

(assert (=> start!7780 e!31701))

(assert (=> start!7780 true))

(declare-fun b!49349 () Bool)

(declare-fun tp_is_empty!2149 () Bool)

(declare-fun tp!6524 () Bool)

(assert (=> b!49349 (= e!31701 (and tp_is_empty!2149 tp!6524))))

(declare-datatypes ((B!998 0))(
  ( (B!999 (val!1119 Int)) )
))
(declare-datatypes ((tuple2!1802 0))(
  ( (tuple2!1803 (_1!912 (_ BitVec 64)) (_2!912 B!998)) )
))
(declare-datatypes ((List!1302 0))(
  ( (Nil!1299) (Cons!1298 (h!1878 tuple2!1802) (t!4336 List!1302)) )
))
(declare-fun l!1333 () List!1302)

(get-info :version)

(assert (= (and start!7780 ((_ is Cons!1298) l!1333)) b!49349))

(check-sat (not b!49349) tp_is_empty!2149)
(check-sat)
