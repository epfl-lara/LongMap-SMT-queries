; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87706 () Bool)

(assert start!87706)

(assert (=> start!87706 false))

(declare-fun e!570756 () Bool)

(assert (=> start!87706 e!570756))

(declare-fun b!1014457 () Bool)

(declare-fun tp_is_empty!23449 () Bool)

(declare-fun tp!70383 () Bool)

(assert (=> b!1014457 (= e!570756 (and tp_is_empty!23449 tp!70383))))

(declare-datatypes ((B!1382 0))(
  ( (B!1383 (val!11775 Int)) )
))
(declare-datatypes ((tuple2!15100 0))(
  ( (tuple2!15101 (_1!7561 (_ BitVec 64)) (_2!7561 B!1382)) )
))
(declare-datatypes ((List!21383 0))(
  ( (Nil!21380) (Cons!21379 (h!22586 tuple2!15100) (t!30376 List!21383)) )
))
(declare-fun l!412 () List!21383)

(get-info :version)

(assert (= (and start!87706 ((_ is Cons!21379) l!412)) b!1014457))

(check-sat (not b!1014457) tp_is_empty!23449)
(check-sat)
