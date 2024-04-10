; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72122 () Bool)

(assert start!72122)

(assert (=> start!72122 false))

(declare-fun e!466905 () Bool)

(assert (=> start!72122 e!466905))

(declare-fun b!836768 () Bool)

(declare-fun tp_is_empty!15285 () Bool)

(declare-fun tp!47512 () Bool)

(assert (=> b!836768 (= e!466905 (and tp_is_empty!15285 tp!47512))))

(declare-datatypes ((B!1216 0))(
  ( (B!1217 (val!7690 Int)) )
))
(declare-datatypes ((tuple2!10240 0))(
  ( (tuple2!10241 (_1!5131 (_ BitVec 64)) (_2!5131 B!1216)) )
))
(declare-datatypes ((List!16001 0))(
  ( (Nil!15998) (Cons!15997 (h!17128 tuple2!10240) (t!22372 List!16001)) )
))
(declare-fun l!390 () List!16001)

(get-info :version)

(assert (= (and start!72122 ((_ is Cons!15997) l!390)) b!836768))

(check-sat (not b!836768) tp_is_empty!15285)
(check-sat)
