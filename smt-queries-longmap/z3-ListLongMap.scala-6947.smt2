; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87474 () Bool)

(assert start!87474)

(declare-fun res!680228 () Bool)

(declare-fun e!569833 () Bool)

(assert (=> start!87474 (=> (not res!680228) (not e!569833))))

(declare-datatypes ((B!1388 0))(
  ( (B!1389 (val!11778 Int)) )
))
(declare-datatypes ((tuple2!15182 0))(
  ( (tuple2!15183 (_1!7602 (_ BitVec 64)) (_2!7602 B!1388)) )
))
(declare-datatypes ((List!21432 0))(
  ( (Nil!21429) (Cons!21428 (h!22626 tuple2!15182) (t!30424 List!21432)) )
))
(declare-fun l!412 () List!21432)

(declare-fun isStrictlySorted!548 (List!21432) Bool)

(assert (=> start!87474 (= res!680228 (isStrictlySorted!548 l!412))))

(assert (=> start!87474 e!569833))

(declare-fun e!569834 () Bool)

(assert (=> start!87474 e!569834))

(declare-fun b!1013004 () Bool)

(declare-fun ListPrimitiveSize!97 (List!21432) Int)

(assert (=> b!1013004 (= e!569833 (< (ListPrimitiveSize!97 l!412) 0))))

(declare-fun b!1013005 () Bool)

(declare-fun tp_is_empty!23455 () Bool)

(declare-fun tp!70392 () Bool)

(assert (=> b!1013005 (= e!569834 (and tp_is_empty!23455 tp!70392))))

(assert (= (and start!87474 res!680228) b!1013004))

(get-info :version)

(assert (= (and start!87474 ((_ is Cons!21428) l!412)) b!1013005))

(declare-fun m!935695 () Bool)

(assert (=> start!87474 m!935695))

(declare-fun m!935697 () Bool)

(assert (=> b!1013004 m!935697))

(check-sat (not b!1013004) (not start!87474) (not b!1013005) tp_is_empty!23455)
(check-sat)
(get-model)

(declare-fun d!120255 () Bool)

(declare-fun lt!447678 () Int)

(assert (=> d!120255 (>= lt!447678 0)))

(declare-fun e!569855 () Int)

(assert (=> d!120255 (= lt!447678 e!569855)))

(declare-fun c!102375 () Bool)

(assert (=> d!120255 (= c!102375 ((_ is Nil!21429) l!412))))

(assert (=> d!120255 (= (ListPrimitiveSize!97 l!412) lt!447678)))

(declare-fun b!1013030 () Bool)

(assert (=> b!1013030 (= e!569855 0)))

(declare-fun b!1013031 () Bool)

(assert (=> b!1013031 (= e!569855 (+ 1 (ListPrimitiveSize!97 (t!30424 l!412))))))

(assert (= (and d!120255 c!102375) b!1013030))

(assert (= (and d!120255 (not c!102375)) b!1013031))

(declare-fun m!935707 () Bool)

(assert (=> b!1013031 m!935707))

(assert (=> b!1013004 d!120255))

(declare-fun d!120261 () Bool)

(declare-fun res!680249 () Bool)

(declare-fun e!569869 () Bool)

(assert (=> d!120261 (=> res!680249 e!569869)))

(assert (=> d!120261 (= res!680249 (or ((_ is Nil!21429) l!412) ((_ is Nil!21429) (t!30424 l!412))))))

(assert (=> d!120261 (= (isStrictlySorted!548 l!412) e!569869)))

(declare-fun b!1013048 () Bool)

(declare-fun e!569870 () Bool)

(assert (=> b!1013048 (= e!569869 e!569870)))

(declare-fun res!680250 () Bool)

(assert (=> b!1013048 (=> (not res!680250) (not e!569870))))

(assert (=> b!1013048 (= res!680250 (bvslt (_1!7602 (h!22626 l!412)) (_1!7602 (h!22626 (t!30424 l!412)))))))

(declare-fun b!1013049 () Bool)

(assert (=> b!1013049 (= e!569870 (isStrictlySorted!548 (t!30424 l!412)))))

(assert (= (and d!120261 (not res!680249)) b!1013048))

(assert (= (and b!1013048 res!680250) b!1013049))

(declare-fun m!935713 () Bool)

(assert (=> b!1013049 m!935713))

(assert (=> start!87474 d!120261))

(declare-fun b!1013058 () Bool)

(declare-fun e!569876 () Bool)

(declare-fun tp!70401 () Bool)

(assert (=> b!1013058 (= e!569876 (and tp_is_empty!23455 tp!70401))))

(assert (=> b!1013005 (= tp!70392 e!569876)))

(assert (= (and b!1013005 ((_ is Cons!21428) (t!30424 l!412))) b!1013058))

(check-sat (not b!1013049) (not b!1013031) (not b!1013058) tp_is_empty!23455)
(check-sat)
