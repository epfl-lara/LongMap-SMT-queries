; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106560 () Bool)

(assert start!106560)

(assert (=> start!106560 false))

(declare-fun e!721215 () Bool)

(assert (=> start!106560 e!721215))

(assert (=> start!106560 true))

(declare-fun b!1266265 () Bool)

(declare-fun tp_is_empty!32467 () Bool)

(declare-fun tp!96266 () Bool)

(assert (=> b!1266265 (= e!721215 (and tp_is_empty!32467 tp!96266))))

(declare-datatypes ((B!1934 0))(
  ( (B!1935 (val!16302 Int)) )
))
(declare-datatypes ((tuple2!21132 0))(
  ( (tuple2!21133 (_1!10577 (_ BitVec 64)) (_2!10577 B!1934)) )
))
(declare-datatypes ((List!28330 0))(
  ( (Nil!28327) (Cons!28326 (h!29544 tuple2!21132) (t!41843 List!28330)) )
))
(declare-fun l!706 () List!28330)

(get-info :version)

(assert (= (and start!106560 ((_ is Cons!28326) l!706)) b!1266265))

(check-sat (not b!1266265) tp_is_empty!32467)
(check-sat)
