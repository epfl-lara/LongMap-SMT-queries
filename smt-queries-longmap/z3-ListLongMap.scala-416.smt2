; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7800 () Bool)

(assert start!7800)

(declare-datatypes ((B!1010 0))(
  ( (B!1011 (val!1125 Int)) )
))
(declare-datatypes ((tuple2!1836 0))(
  ( (tuple2!1837 (_1!929 (_ BitVec 64)) (_2!929 B!1010)) )
))
(declare-datatypes ((List!1318 0))(
  ( (Nil!1315) (Cons!1314 (h!1894 tuple2!1836) (t!4351 List!1318)) )
))
(declare-fun keyValues!2 () List!1318)

(declare-fun ListPrimitiveSize!55 (List!1318) Int)

(assert (=> start!7800 (< (ListPrimitiveSize!55 keyValues!2) 0)))

(declare-fun e!31740 () Bool)

(assert (=> start!7800 e!31740))

(declare-fun b!49391 () Bool)

(declare-fun tp_is_empty!2161 () Bool)

(declare-fun tp!6551 () Bool)

(assert (=> b!49391 (= e!31740 (and tp_is_empty!2161 tp!6551))))

(get-info :version)

(assert (= (and start!7800 ((_ is Cons!1314) keyValues!2)) b!49391))

(declare-fun m!42773 () Bool)

(assert (=> start!7800 m!42773))

(check-sat (not start!7800) (not b!49391) tp_is_empty!2161)
(check-sat)
(get-model)

(declare-fun d!9883 () Bool)

(declare-fun lt!20742 () Int)

(assert (=> d!9883 (>= lt!20742 0)))

(declare-fun e!31751 () Int)

(assert (=> d!9883 (= lt!20742 e!31751)))

(declare-fun c!6657 () Bool)

(assert (=> d!9883 (= c!6657 ((_ is Nil!1315) keyValues!2))))

(assert (=> d!9883 (= (ListPrimitiveSize!55 keyValues!2) lt!20742)))

(declare-fun b!49406 () Bool)

(assert (=> b!49406 (= e!31751 0)))

(declare-fun b!49407 () Bool)

(assert (=> b!49407 (= e!31751 (+ 1 (ListPrimitiveSize!55 (t!4351 keyValues!2))))))

(assert (= (and d!9883 c!6657) b!49406))

(assert (= (and d!9883 (not c!6657)) b!49407))

(declare-fun m!42779 () Bool)

(assert (=> b!49407 m!42779))

(assert (=> start!7800 d!9883))

(declare-fun b!49418 () Bool)

(declare-fun e!31757 () Bool)

(declare-fun tp!6560 () Bool)

(assert (=> b!49418 (= e!31757 (and tp_is_empty!2161 tp!6560))))

(assert (=> b!49391 (= tp!6551 e!31757)))

(assert (= (and b!49391 ((_ is Cons!1314) (t!4351 keyValues!2))) b!49418))

(check-sat (not b!49407) (not b!49418) tp_is_empty!2161)
(check-sat)
