; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137966 () Bool)

(assert start!137966)

(assert (=> start!137966 false))

(declare-fun e!884285 () Bool)

(assert (=> start!137966 e!884285))

(declare-fun b!1584402 () Bool)

(declare-fun tp_is_empty!39265 () Bool)

(declare-fun tp!114633 () Bool)

(assert (=> b!1584402 (= e!884285 (and tp_is_empty!39265 tp!114633))))

(declare-datatypes ((B!2720 0))(
  ( (B!2721 (val!19722 Int)) )
))
(declare-datatypes ((tuple2!25672 0))(
  ( (tuple2!25673 (_1!12847 (_ BitVec 64)) (_2!12847 B!2720)) )
))
(declare-datatypes ((List!36874 0))(
  ( (Nil!36871) (Cons!36870 (h!38431 tuple2!25672) (t!51780 List!36874)) )
))
(declare-fun l!1356 () List!36874)

(get-info :version)

(assert (= (and start!137966 ((_ is Cons!36870) l!1356)) b!1584402))

(check-sat (not b!1584402) tp_is_empty!39265)
(check-sat)
