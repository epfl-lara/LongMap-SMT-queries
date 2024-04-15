; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138392 () Bool)

(assert start!138392)

(declare-datatypes ((B!3044 0))(
  ( (B!3045 (val!19884 Int)) )
))
(declare-datatypes ((tuple2!26004 0))(
  ( (tuple2!26005 (_1!13013 (_ BitVec 64)) (_2!13013 B!3044)) )
))
(declare-datatypes ((List!37045 0))(
  ( (Nil!37042) (Cons!37041 (h!38585 tuple2!26004) (t!51967 List!37045)) )
))
(declare-fun l!628 () List!37045)

(declare-fun ListPrimitiveSize!235 (List!37045) Int)

(assert (=> start!138392 (< (ListPrimitiveSize!235 l!628) 0)))

(declare-fun e!885672 () Bool)

(assert (=> start!138392 e!885672))

(declare-fun b!1586044 () Bool)

(declare-fun tp_is_empty!39577 () Bool)

(declare-fun tp!115425 () Bool)

(assert (=> b!1586044 (= e!885672 (and tp_is_empty!39577 tp!115425))))

(get-info :version)

(assert (= (and start!138392 ((_ is Cons!37041) l!628)) b!1586044))

(declare-fun m!1453857 () Bool)

(assert (=> start!138392 m!1453857))

(check-sat (not start!138392) (not b!1586044) tp_is_empty!39577)
(check-sat)
(get-model)

(declare-fun d!167677 () Bool)

(declare-fun lt!677241 () Int)

(assert (=> d!167677 (>= lt!677241 0)))

(declare-fun e!885685 () Int)

(assert (=> d!167677 (= lt!677241 e!885685)))

(declare-fun c!146972 () Bool)

(assert (=> d!167677 (= c!146972 ((_ is Nil!37042) l!628))))

(assert (=> d!167677 (= (ListPrimitiveSize!235 l!628) lt!677241)))

(declare-fun b!1586063 () Bool)

(assert (=> b!1586063 (= e!885685 0)))

(declare-fun b!1586064 () Bool)

(assert (=> b!1586064 (= e!885685 (+ 1 (ListPrimitiveSize!235 (t!51967 l!628))))))

(assert (= (and d!167677 c!146972) b!1586063))

(assert (= (and d!167677 (not c!146972)) b!1586064))

(declare-fun m!1453863 () Bool)

(assert (=> b!1586064 m!1453863))

(assert (=> start!138392 d!167677))

(declare-fun b!1586071 () Bool)

(declare-fun e!885689 () Bool)

(declare-fun tp!115434 () Bool)

(assert (=> b!1586071 (= e!885689 (and tp_is_empty!39577 tp!115434))))

(assert (=> b!1586044 (= tp!115425 e!885689)))

(assert (= (and b!1586044 ((_ is Cons!37041) (t!51967 l!628))) b!1586071))

(check-sat (not b!1586064) (not b!1586071) tp_is_empty!39577)
(check-sat)
