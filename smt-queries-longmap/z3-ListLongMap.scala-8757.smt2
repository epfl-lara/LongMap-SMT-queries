; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106332 () Bool)

(assert start!106332)

(assert (=> start!106332 false))

(declare-fun e!720323 () Bool)

(assert (=> start!106332 e!720323))

(assert (=> start!106332 true))

(declare-fun b!1264878 () Bool)

(declare-fun tp_is_empty!32467 () Bool)

(declare-fun tp!96266 () Bool)

(assert (=> b!1264878 (= e!720323 (and tp_is_empty!32467 tp!96266))))

(declare-datatypes ((B!1934 0))(
  ( (B!1935 (val!16302 Int)) )
))
(declare-datatypes ((tuple2!21204 0))(
  ( (tuple2!21205 (_1!10613 (_ BitVec 64)) (_2!10613 B!1934)) )
))
(declare-datatypes ((List!28378 0))(
  ( (Nil!28375) (Cons!28374 (h!29583 tuple2!21204) (t!41890 List!28378)) )
))
(declare-fun l!706 () List!28378)

(get-info :version)

(assert (= (and start!106332 ((_ is Cons!28374) l!706)) b!1264878))

(check-sat (not b!1264878) tp_is_empty!32467)
(check-sat)
