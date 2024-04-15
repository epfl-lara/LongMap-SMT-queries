; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107804 () Bool)

(assert start!107804)

(declare-fun res!847303 () Bool)

(declare-fun e!727423 () Bool)

(assert (=> start!107804 (=> (not res!847303) (not e!727423))))

(declare-datatypes ((B!2150 0))(
  ( (B!2151 (val!16671 Int)) )
))
(declare-datatypes ((tuple2!21500 0))(
  ( (tuple2!21501 (_1!10761 (_ BitVec 64)) (_2!10761 B!2150)) )
))
(declare-datatypes ((List!28670 0))(
  ( (Nil!28667) (Cons!28666 (h!29875 tuple2!21500) (t!42195 List!28670)) )
))
(declare-fun l!595 () List!28670)

(declare-fun isStrictlySorted!846 (List!28670) Bool)

(assert (=> start!107804 (= res!847303 (isStrictlySorted!846 l!595))))

(assert (=> start!107804 e!727423))

(declare-fun e!727424 () Bool)

(assert (=> start!107804 e!727424))

(declare-fun b!1274590 () Bool)

(declare-fun ListPrimitiveSize!163 (List!28670) Int)

(assert (=> b!1274590 (= e!727423 (< (ListPrimitiveSize!163 l!595) 0))))

(declare-fun b!1274591 () Bool)

(declare-fun tp_is_empty!33193 () Bool)

(declare-fun tp!98004 () Bool)

(assert (=> b!1274591 (= e!727424 (and tp_is_empty!33193 tp!98004))))

(assert (= (and start!107804 res!847303) b!1274590))

(get-info :version)

(assert (= (and start!107804 ((_ is Cons!28666) l!595)) b!1274591))

(declare-fun m!1170809 () Bool)

(assert (=> start!107804 m!1170809))

(declare-fun m!1170811 () Bool)

(assert (=> b!1274590 m!1170811))

(check-sat (not b!1274590) (not start!107804) (not b!1274591) tp_is_empty!33193)
(check-sat)
(get-model)

(declare-fun d!140079 () Bool)

(declare-fun lt!575107 () Int)

(assert (=> d!140079 (>= lt!575107 0)))

(declare-fun e!727445 () Int)

(assert (=> d!140079 (= lt!575107 e!727445)))

(declare-fun c!123859 () Bool)

(assert (=> d!140079 (= c!123859 ((_ is Nil!28667) l!595))))

(assert (=> d!140079 (= (ListPrimitiveSize!163 l!595) lt!575107)))

(declare-fun b!1274616 () Bool)

(assert (=> b!1274616 (= e!727445 0)))

(declare-fun b!1274617 () Bool)

(assert (=> b!1274617 (= e!727445 (+ 1 (ListPrimitiveSize!163 (t!42195 l!595))))))

(assert (= (and d!140079 c!123859) b!1274616))

(assert (= (and d!140079 (not c!123859)) b!1274617))

(declare-fun m!1170821 () Bool)

(assert (=> b!1274617 m!1170821))

(assert (=> b!1274590 d!140079))

(declare-fun d!140085 () Bool)

(declare-fun res!847324 () Bool)

(declare-fun e!727459 () Bool)

(assert (=> d!140085 (=> res!847324 e!727459)))

(assert (=> d!140085 (= res!847324 (or ((_ is Nil!28667) l!595) ((_ is Nil!28667) (t!42195 l!595))))))

(assert (=> d!140085 (= (isStrictlySorted!846 l!595) e!727459)))

(declare-fun b!1274634 () Bool)

(declare-fun e!727460 () Bool)

(assert (=> b!1274634 (= e!727459 e!727460)))

(declare-fun res!847325 () Bool)

(assert (=> b!1274634 (=> (not res!847325) (not e!727460))))

(assert (=> b!1274634 (= res!847325 (bvslt (_1!10761 (h!29875 l!595)) (_1!10761 (h!29875 (t!42195 l!595)))))))

(declare-fun b!1274635 () Bool)

(assert (=> b!1274635 (= e!727460 (isStrictlySorted!846 (t!42195 l!595)))))

(assert (= (and d!140085 (not res!847324)) b!1274634))

(assert (= (and b!1274634 res!847325) b!1274635))

(declare-fun m!1170827 () Bool)

(assert (=> b!1274635 m!1170827))

(assert (=> start!107804 d!140085))

(declare-fun b!1274652 () Bool)

(declare-fun e!727470 () Bool)

(declare-fun tp!98017 () Bool)

(assert (=> b!1274652 (= e!727470 (and tp_is_empty!33193 tp!98017))))

(assert (=> b!1274591 (= tp!98004 e!727470)))

(assert (= (and b!1274591 ((_ is Cons!28666) (t!42195 l!595))) b!1274652))

(check-sat (not b!1274635) (not b!1274617) (not b!1274652) tp_is_empty!33193)
(check-sat)
