; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7164 () Bool)

(assert start!7164)

(assert (=> start!7164 false))

(declare-fun e!29206 () Bool)

(assert (=> start!7164 e!29206))

(declare-fun b!45882 () Bool)

(declare-fun tp_is_empty!1945 () Bool)

(declare-fun tp!6029 () Bool)

(assert (=> b!45882 (= e!29206 (and tp_is_empty!1945 tp!6029))))

(declare-datatypes ((B!848 0))(
  ( (B!849 (val!1011 Int)) )
))
(declare-datatypes ((tuple2!1674 0))(
  ( (tuple2!1675 (_1!848 (_ BitVec 64)) (_2!848 B!848)) )
))
(declare-datatypes ((List!1222 0))(
  ( (Nil!1219) (Cons!1218 (h!1798 tuple2!1674) (t!4246 List!1222)) )
))
(declare-fun l!812 () List!1222)

(get-info :version)

(assert (= (and start!7164 ((_ is Cons!1218) l!812)) b!45882))

(check-sat (not b!45882) tp_is_empty!1945)
(check-sat)
