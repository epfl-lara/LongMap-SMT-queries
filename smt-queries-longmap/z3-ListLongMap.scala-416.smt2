; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7804 () Bool)

(assert start!7804)

(declare-datatypes ((B!1010 0))(
  ( (B!1011 (val!1125 Int)) )
))
(declare-datatypes ((tuple2!1814 0))(
  ( (tuple2!1815 (_1!918 (_ BitVec 64)) (_2!918 B!1010)) )
))
(declare-datatypes ((List!1308 0))(
  ( (Nil!1305) (Cons!1304 (h!1884 tuple2!1814) (t!4342 List!1308)) )
))
(declare-fun keyValues!2 () List!1308)

(declare-fun ListPrimitiveSize!55 (List!1308) Int)

(assert (=> start!7804 (< (ListPrimitiveSize!55 keyValues!2) 0)))

(declare-fun e!31746 () Bool)

(assert (=> start!7804 e!31746))

(declare-fun b!49400 () Bool)

(declare-fun tp_is_empty!2161 () Bool)

(declare-fun tp!6551 () Bool)

(assert (=> b!49400 (= e!31746 (and tp_is_empty!2161 tp!6551))))

(get-info :version)

(assert (= (and start!7804 ((_ is Cons!1304) keyValues!2)) b!49400))

(declare-fun m!42731 () Bool)

(assert (=> start!7804 m!42731))

(check-sat (not start!7804) (not b!49400) tp_is_empty!2161)
(check-sat)
(get-model)

(declare-fun d!9897 () Bool)

(declare-fun lt!20713 () Int)

(assert (=> d!9897 (>= lt!20713 0)))

(declare-fun e!31755 () Int)

(assert (=> d!9897 (= lt!20713 e!31755)))

(declare-fun c!6662 () Bool)

(assert (=> d!9897 (= c!6662 ((_ is Nil!1305) keyValues!2))))

(assert (=> d!9897 (= (ListPrimitiveSize!55 keyValues!2) lt!20713)))

(declare-fun b!49411 () Bool)

(assert (=> b!49411 (= e!31755 0)))

(declare-fun b!49412 () Bool)

(assert (=> b!49412 (= e!31755 (+ 1 (ListPrimitiveSize!55 (t!4342 keyValues!2))))))

(assert (= (and d!9897 c!6662) b!49411))

(assert (= (and d!9897 (not c!6662)) b!49412))

(declare-fun m!42737 () Bool)

(assert (=> b!49412 m!42737))

(assert (=> start!7804 d!9897))

(declare-fun b!49417 () Bool)

(declare-fun e!31758 () Bool)

(declare-fun tp!6560 () Bool)

(assert (=> b!49417 (= e!31758 (and tp_is_empty!2161 tp!6560))))

(assert (=> b!49400 (= tp!6551 e!31758)))

(assert (= (and b!49400 ((_ is Cons!1304) (t!4342 keyValues!2))) b!49417))

(check-sat (not b!49412) (not b!49417) tp_is_empty!2161)
(check-sat)
