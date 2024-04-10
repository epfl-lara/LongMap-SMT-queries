; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7800 () Bool)

(assert start!7800)

(declare-datatypes ((B!1012 0))(
  ( (B!1013 (val!1126 Int)) )
))
(declare-datatypes ((tuple2!1834 0))(
  ( (tuple2!1835 (_1!928 (_ BitVec 64)) (_2!928 B!1012)) )
))
(declare-datatypes ((List!1323 0))(
  ( (Nil!1320) (Cons!1319 (h!1899 tuple2!1834) (t!4357 List!1323)) )
))
(declare-fun keyValues!2 () List!1323)

(declare-fun ListPrimitiveSize!56 (List!1323) Int)

(assert (=> start!7800 (< (ListPrimitiveSize!56 keyValues!2) 0)))

(declare-fun e!31786 () Bool)

(assert (=> start!7800 e!31786))

(declare-fun b!49460 () Bool)

(declare-fun tp_is_empty!2163 () Bool)

(declare-fun tp!6554 () Bool)

(assert (=> b!49460 (= e!31786 (and tp_is_empty!2163 tp!6554))))

(get-info :version)

(assert (= (and start!7800 ((_ is Cons!1319) keyValues!2)) b!49460))

(declare-fun m!42857 () Bool)

(assert (=> start!7800 m!42857))

(check-sat (not start!7800) (not b!49460) tp_is_empty!2163)
(check-sat)
(get-model)

(declare-fun d!9909 () Bool)

(declare-fun lt!20760 () Int)

(assert (=> d!9909 (>= lt!20760 0)))

(declare-fun e!31796 () Int)

(assert (=> d!9909 (= lt!20760 e!31796)))

(declare-fun c!6682 () Bool)

(assert (=> d!9909 (= c!6682 ((_ is Nil!1320) keyValues!2))))

(assert (=> d!9909 (= (ListPrimitiveSize!56 keyValues!2) lt!20760)))

(declare-fun b!49476 () Bool)

(assert (=> b!49476 (= e!31796 0)))

(declare-fun b!49477 () Bool)

(assert (=> b!49477 (= e!31796 (+ 1 (ListPrimitiveSize!56 (t!4357 keyValues!2))))))

(assert (= (and d!9909 c!6682) b!49476))

(assert (= (and d!9909 (not c!6682)) b!49477))

(declare-fun m!42861 () Bool)

(assert (=> b!49477 m!42861))

(assert (=> start!7800 d!9909))

(declare-fun b!49494 () Bool)

(declare-fun e!31805 () Bool)

(declare-fun tp!6564 () Bool)

(assert (=> b!49494 (= e!31805 (and tp_is_empty!2163 tp!6564))))

(assert (=> b!49460 (= tp!6554 e!31805)))

(assert (= (and b!49460 ((_ is Cons!1319) (t!4357 keyValues!2))) b!49494))

(check-sat (not b!49477) (not b!49494) tp_is_empty!2163)
(check-sat)
