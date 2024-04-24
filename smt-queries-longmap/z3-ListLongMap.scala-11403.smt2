; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133194 () Bool)

(assert start!133194)

(assert (=> start!133194 false))

(declare-fun e!867818 () Bool)

(assert (=> start!133194 e!867818))

(declare-fun b!1558028 () Bool)

(declare-fun tp_is_empty!38305 () Bool)

(declare-fun tp!112299 () Bool)

(assert (=> b!1558028 (= e!867818 (and tp_is_empty!38305 tp!112299))))

(declare-datatypes ((B!2294 0))(
  ( (B!2295 (val!19233 Int)) )
))
(declare-datatypes ((tuple2!24896 0))(
  ( (tuple2!24897 (_1!12459 (_ BitVec 64)) (_2!12459 B!2294)) )
))
(declare-datatypes ((List!36296 0))(
  ( (Nil!36293) (Cons!36292 (h!37756 tuple2!24896) (t!51009 List!36296)) )
))
(declare-fun l!1177 () List!36296)

(get-info :version)

(assert (= (and start!133194 ((_ is Cons!36292) l!1177)) b!1558028))

(check-sat (not b!1558028) tp_is_empty!38305)
(check-sat)
