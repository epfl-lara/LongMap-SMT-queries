; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7098 () Bool)

(assert start!7098)

(assert (=> start!7098 false))

(declare-fun e!28967 () Bool)

(assert (=> start!7098 e!28967))

(declare-fun b!45498 () Bool)

(declare-fun tp_is_empty!1917 () Bool)

(declare-fun tp!5969 () Bool)

(assert (=> b!45498 (= e!28967 (and tp_is_empty!1917 tp!5969))))

(declare-datatypes ((B!820 0))(
  ( (B!821 (val!997 Int)) )
))
(declare-datatypes ((tuple2!1642 0))(
  ( (tuple2!1643 (_1!832 (_ BitVec 64)) (_2!832 B!820)) )
))
(declare-datatypes ((List!1215 0))(
  ( (Nil!1212) (Cons!1211 (h!1791 tuple2!1642) (t!4240 List!1215)) )
))
(declare-fun l!812 () List!1215)

(get-info :version)

(assert (= (and start!7098 ((_ is Cons!1211) l!812)) b!45498))

(check-sat (not b!45498) tp_is_empty!1917)
