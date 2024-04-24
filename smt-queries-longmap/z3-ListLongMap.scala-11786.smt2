; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138870 () Bool)

(assert start!138870)

(declare-datatypes ((B!3044 0))(
  ( (B!3045 (val!19884 Int)) )
))
(declare-datatypes ((tuple2!25996 0))(
  ( (tuple2!25997 (_1!13009 (_ BitVec 64)) (_2!13009 B!3044)) )
))
(declare-datatypes ((List!37036 0))(
  ( (Nil!37033) (Cons!37032 (h!38593 tuple2!25996) (t!51959 List!37036)) )
))
(declare-fun l!628 () List!37036)

(declare-fun ListPrimitiveSize!235 (List!37036) Int)

(assert (=> start!138870 (< (ListPrimitiveSize!235 l!628) 0)))

(declare-fun e!887435 () Bool)

(assert (=> start!138870 e!887435))

(declare-fun b!1588871 () Bool)

(declare-fun tp_is_empty!39577 () Bool)

(declare-fun tp!115426 () Bool)

(assert (=> b!1588871 (= e!887435 (and tp_is_empty!39577 tp!115426))))

(get-info :version)

(assert (= (and start!138870 ((_ is Cons!37032) l!628)) b!1588871))

(declare-fun m!1457061 () Bool)

(assert (=> start!138870 m!1457061))

(check-sat (not start!138870) (not b!1588871) tp_is_empty!39577)
(check-sat)
(get-model)

(declare-fun d!168649 () Bool)

(declare-fun lt!678433 () Int)

(assert (=> d!168649 (>= lt!678433 0)))

(declare-fun e!887446 () Int)

(assert (=> d!168649 (= lt!678433 e!887446)))

(declare-fun c!147863 () Bool)

(assert (=> d!168649 (= c!147863 ((_ is Nil!37033) l!628))))

(assert (=> d!168649 (= (ListPrimitiveSize!235 l!628) lt!678433)))

(declare-fun b!1588886 () Bool)

(assert (=> b!1588886 (= e!887446 0)))

(declare-fun b!1588887 () Bool)

(assert (=> b!1588887 (= e!887446 (+ 1 (ListPrimitiveSize!235 (t!51959 l!628))))))

(assert (= (and d!168649 c!147863) b!1588886))

(assert (= (and d!168649 (not c!147863)) b!1588887))

(declare-fun m!1457067 () Bool)

(assert (=> b!1588887 m!1457067))

(assert (=> start!138870 d!168649))

(declare-fun b!1588898 () Bool)

(declare-fun e!887452 () Bool)

(declare-fun tp!115435 () Bool)

(assert (=> b!1588898 (= e!887452 (and tp_is_empty!39577 tp!115435))))

(assert (=> b!1588871 (= tp!115426 e!887452)))

(assert (= (and b!1588871 ((_ is Cons!37032) (t!51959 l!628))) b!1588898))

(check-sat (not b!1588887) (not b!1588898) tp_is_empty!39577)
(check-sat)
