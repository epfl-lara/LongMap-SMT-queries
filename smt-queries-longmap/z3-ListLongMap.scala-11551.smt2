; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134418 () Bool)

(assert start!134418)

(declare-fun b!1569481 () Bool)

(declare-fun res!1072645 () Bool)

(declare-fun e!874934 () Bool)

(assert (=> b!1569481 (=> (not res!1072645) (not e!874934))))

(declare-datatypes ((B!2540 0))(
  ( (B!2541 (val!19632 Int)) )
))
(declare-datatypes ((tuple2!25434 0))(
  ( (tuple2!25435 (_1!12728 (_ BitVec 64)) (_2!12728 B!2540)) )
))
(declare-datatypes ((List!36793 0))(
  ( (Nil!36790) (Cons!36789 (h!38237 tuple2!25434) (t!51693 List!36793)) )
))
(declare-fun l!750 () List!36793)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1569481 (= res!1072645 (and ((_ is Cons!36789) l!750) (bvslt (_1!12728 (h!38237 l!750)) key1!37) (bvslt (_1!12728 (h!38237 l!750)) key2!21)))))

(declare-fun b!1569482 () Bool)

(declare-fun e!874933 () Bool)

(declare-fun tp_is_empty!39091 () Bool)

(declare-fun tp!114193 () Bool)

(assert (=> b!1569482 (= e!874933 (and tp_is_empty!39091 tp!114193))))

(declare-fun b!1569483 () Bool)

(declare-fun ListPrimitiveSize!190 (List!36793) Int)

(assert (=> b!1569483 (= e!874934 (>= (ListPrimitiveSize!190 (t!51693 l!750)) (ListPrimitiveSize!190 l!750)))))

(declare-fun b!1569484 () Bool)

(declare-fun res!1072644 () Bool)

(assert (=> b!1569484 (=> (not res!1072644) (not e!874934))))

(declare-fun isStrictlySorted!1014 (List!36793) Bool)

(assert (=> b!1569484 (= res!1072644 (isStrictlySorted!1014 (t!51693 l!750)))))

(declare-fun b!1569485 () Bool)

(declare-fun res!1072646 () Bool)

(assert (=> b!1569485 (=> (not res!1072646) (not e!874934))))

(assert (=> b!1569485 (= res!1072646 (isStrictlySorted!1014 l!750))))

(declare-fun res!1072647 () Bool)

(assert (=> start!134418 (=> (not res!1072647) (not e!874934))))

(assert (=> start!134418 (= res!1072647 (not (= key1!37 key2!21)))))

(assert (=> start!134418 e!874934))

(assert (=> start!134418 true))

(assert (=> start!134418 e!874933))

(assert (= (and start!134418 res!1072647) b!1569485))

(assert (= (and b!1569485 res!1072646) b!1569481))

(assert (= (and b!1569481 res!1072645) b!1569484))

(assert (= (and b!1569484 res!1072644) b!1569483))

(assert (= (and start!134418 ((_ is Cons!36789) l!750)) b!1569482))

(declare-fun m!1443009 () Bool)

(assert (=> b!1569483 m!1443009))

(declare-fun m!1443011 () Bool)

(assert (=> b!1569483 m!1443011))

(declare-fun m!1443013 () Bool)

(assert (=> b!1569484 m!1443013))

(declare-fun m!1443015 () Bool)

(assert (=> b!1569485 m!1443015))

(check-sat (not b!1569485) (not b!1569482) (not b!1569484) (not b!1569483) tp_is_empty!39091)
(check-sat)
(get-model)

(declare-fun d!163693 () Bool)

(declare-fun lt!673041 () Int)

(assert (=> d!163693 (>= lt!673041 0)))

(declare-fun e!874949 () Int)

(assert (=> d!163693 (= lt!673041 e!874949)))

(declare-fun c!144697 () Bool)

(assert (=> d!163693 (= c!144697 ((_ is Nil!36790) (t!51693 l!750)))))

(assert (=> d!163693 (= (ListPrimitiveSize!190 (t!51693 l!750)) lt!673041)))

(declare-fun b!1569520 () Bool)

(assert (=> b!1569520 (= e!874949 0)))

(declare-fun b!1569521 () Bool)

(assert (=> b!1569521 (= e!874949 (+ 1 (ListPrimitiveSize!190 (t!51693 (t!51693 l!750)))))))

(assert (= (and d!163693 c!144697) b!1569520))

(assert (= (and d!163693 (not c!144697)) b!1569521))

(declare-fun m!1443033 () Bool)

(assert (=> b!1569521 m!1443033))

(assert (=> b!1569483 d!163693))

(declare-fun d!163695 () Bool)

(declare-fun lt!673042 () Int)

(assert (=> d!163695 (>= lt!673042 0)))

(declare-fun e!874950 () Int)

(assert (=> d!163695 (= lt!673042 e!874950)))

(declare-fun c!144698 () Bool)

(assert (=> d!163695 (= c!144698 ((_ is Nil!36790) l!750))))

(assert (=> d!163695 (= (ListPrimitiveSize!190 l!750) lt!673042)))

(declare-fun b!1569522 () Bool)

(assert (=> b!1569522 (= e!874950 0)))

(declare-fun b!1569523 () Bool)

(assert (=> b!1569523 (= e!874950 (+ 1 (ListPrimitiveSize!190 (t!51693 l!750))))))

(assert (= (and d!163695 c!144698) b!1569522))

(assert (= (and d!163695 (not c!144698)) b!1569523))

(assert (=> b!1569523 m!1443009))

(assert (=> b!1569483 d!163695))

(declare-fun d!163697 () Bool)

(declare-fun res!1072676 () Bool)

(declare-fun e!874955 () Bool)

(assert (=> d!163697 (=> res!1072676 e!874955)))

(assert (=> d!163697 (= res!1072676 (or ((_ is Nil!36790) (t!51693 l!750)) ((_ is Nil!36790) (t!51693 (t!51693 l!750)))))))

(assert (=> d!163697 (= (isStrictlySorted!1014 (t!51693 l!750)) e!874955)))

(declare-fun b!1569528 () Bool)

(declare-fun e!874956 () Bool)

(assert (=> b!1569528 (= e!874955 e!874956)))

(declare-fun res!1072677 () Bool)

(assert (=> b!1569528 (=> (not res!1072677) (not e!874956))))

(assert (=> b!1569528 (= res!1072677 (bvslt (_1!12728 (h!38237 (t!51693 l!750))) (_1!12728 (h!38237 (t!51693 (t!51693 l!750))))))))

(declare-fun b!1569529 () Bool)

(assert (=> b!1569529 (= e!874956 (isStrictlySorted!1014 (t!51693 (t!51693 l!750))))))

(assert (= (and d!163697 (not res!1072676)) b!1569528))

(assert (= (and b!1569528 res!1072677) b!1569529))

(declare-fun m!1443035 () Bool)

(assert (=> b!1569529 m!1443035))

(assert (=> b!1569484 d!163697))

(declare-fun d!163701 () Bool)

(declare-fun res!1072678 () Bool)

(declare-fun e!874957 () Bool)

(assert (=> d!163701 (=> res!1072678 e!874957)))

(assert (=> d!163701 (= res!1072678 (or ((_ is Nil!36790) l!750) ((_ is Nil!36790) (t!51693 l!750))))))

(assert (=> d!163701 (= (isStrictlySorted!1014 l!750) e!874957)))

(declare-fun b!1569530 () Bool)

(declare-fun e!874958 () Bool)

(assert (=> b!1569530 (= e!874957 e!874958)))

(declare-fun res!1072679 () Bool)

(assert (=> b!1569530 (=> (not res!1072679) (not e!874958))))

(assert (=> b!1569530 (= res!1072679 (bvslt (_1!12728 (h!38237 l!750)) (_1!12728 (h!38237 (t!51693 l!750)))))))

(declare-fun b!1569531 () Bool)

(assert (=> b!1569531 (= e!874958 (isStrictlySorted!1014 (t!51693 l!750)))))

(assert (= (and d!163701 (not res!1072678)) b!1569530))

(assert (= (and b!1569530 res!1072679) b!1569531))

(assert (=> b!1569531 m!1443013))

(assert (=> b!1569485 d!163701))

(declare-fun b!1569536 () Bool)

(declare-fun e!874961 () Bool)

(declare-fun tp!114202 () Bool)

(assert (=> b!1569536 (= e!874961 (and tp_is_empty!39091 tp!114202))))

(assert (=> b!1569482 (= tp!114193 e!874961)))

(assert (= (and b!1569482 ((_ is Cons!36789) (t!51693 l!750))) b!1569536))

(check-sat (not b!1569521) (not b!1569529) (not b!1569536) tp_is_empty!39091 (not b!1569523) (not b!1569531))
(check-sat)
