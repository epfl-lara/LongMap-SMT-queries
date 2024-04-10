; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137528 () Bool)

(assert start!137528)

(assert (=> start!137528 false))

(declare-fun e!882731 () Bool)

(assert (=> start!137528 e!882731))

(declare-fun b!1581898 () Bool)

(declare-fun tp_is_empty!39267 () Bool)

(declare-fun tp!114635 () Bool)

(assert (=> b!1581898 (= e!882731 (and tp_is_empty!39267 tp!114635))))

(declare-datatypes ((B!2722 0))(
  ( (B!2723 (val!19723 Int)) )
))
(declare-datatypes ((tuple2!25614 0))(
  ( (tuple2!25615 (_1!12818 (_ BitVec 64)) (_2!12818 B!2722)) )
))
(declare-datatypes ((List!36843 0))(
  ( (Nil!36840) (Cons!36839 (h!38382 tuple2!25614) (t!51757 List!36843)) )
))
(declare-fun l!1356 () List!36843)

(get-info :version)

(assert (= (and start!137528 ((_ is Cons!36839) l!1356)) b!1581898))

(check-sat (not b!1581898) tp_is_empty!39267)
(check-sat)
