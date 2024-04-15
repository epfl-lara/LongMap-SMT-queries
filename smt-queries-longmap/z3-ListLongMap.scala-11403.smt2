; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132732 () Bool)

(assert start!132732)

(assert (=> start!132732 false))

(declare-fun e!866111 () Bool)

(assert (=> start!132732 e!866111))

(declare-fun b!1555279 () Bool)

(declare-fun tp_is_empty!38305 () Bool)

(declare-fun tp!112300 () Bool)

(assert (=> b!1555279 (= e!866111 (and tp_is_empty!38305 tp!112300))))

(declare-datatypes ((B!2294 0))(
  ( (B!2295 (val!19233 Int)) )
))
(declare-datatypes ((tuple2!24914 0))(
  ( (tuple2!24915 (_1!12468 (_ BitVec 64)) (_2!12468 B!2294)) )
))
(declare-datatypes ((List!36312 0))(
  ( (Nil!36309) (Cons!36308 (h!37755 tuple2!24914) (t!51025 List!36312)) )
))
(declare-fun l!1177 () List!36312)

(get-info :version)

(assert (= (and start!132732 ((_ is Cons!36308) l!1177)) b!1555279))

(check-sat (not b!1555279) tp_is_empty!38305)
(check-sat)
