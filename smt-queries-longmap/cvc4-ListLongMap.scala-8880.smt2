; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107808 () Bool)

(assert start!107808)

(declare-fun res!847336 () Bool)

(declare-fun e!727464 () Bool)

(assert (=> start!107808 (=> (not res!847336) (not e!727464))))

(declare-datatypes ((B!2154 0))(
  ( (B!2155 (val!16673 Int)) )
))
(declare-datatypes ((tuple2!21428 0))(
  ( (tuple2!21429 (_1!10725 (_ BitVec 64)) (_2!10725 B!2154)) )
))
(declare-datatypes ((List!28599 0))(
  ( (Nil!28596) (Cons!28595 (h!29804 tuple2!21428) (t!42132 List!28599)) )
))
(declare-fun l!595 () List!28599)

(declare-fun isStrictlySorted!851 (List!28599) Bool)

(assert (=> start!107808 (= res!847336 (isStrictlySorted!851 l!595))))

(assert (=> start!107808 e!727464))

(declare-fun e!727465 () Bool)

(assert (=> start!107808 e!727465))

(declare-fun b!1274666 () Bool)

(declare-fun ListPrimitiveSize!165 (List!28599) Int)

(assert (=> b!1274666 (= e!727464 (< (ListPrimitiveSize!165 l!595) 0))))

(declare-fun b!1274667 () Bool)

(declare-fun tp_is_empty!33197 () Bool)

(declare-fun tp!98009 () Bool)

(assert (=> b!1274667 (= e!727465 (and tp_is_empty!33197 tp!98009))))

(assert (= (and start!107808 res!847336) b!1274666))

(assert (= (and start!107808 (is-Cons!28595 l!595)) b!1274667))

(declare-fun m!1171317 () Bool)

(assert (=> start!107808 m!1171317))

(declare-fun m!1171319 () Bool)

(assert (=> b!1274666 m!1171319))

(push 1)

(assert (not start!107808))

(assert (not b!1274666))

(assert (not b!1274667))

(assert tp_is_empty!33197)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140195 () Bool)

(declare-fun res!847347 () Bool)

(declare-fun e!727481 () Bool)

(assert (=> d!140195 (=> res!847347 e!727481)))

(assert (=> d!140195 (= res!847347 (or (is-Nil!28596 l!595) (is-Nil!28596 (t!42132 l!595))))))

(assert (=> d!140195 (= (isStrictlySorted!851 l!595) e!727481)))

(declare-fun b!1274688 () Bool)

(declare-fun e!727482 () Bool)

(assert (=> b!1274688 (= e!727481 e!727482)))

(declare-fun res!847348 () Bool)

(assert (=> b!1274688 (=> (not res!847348) (not e!727482))))

(assert (=> b!1274688 (= res!847348 (bvslt (_1!10725 (h!29804 l!595)) (_1!10725 (h!29804 (t!42132 l!595)))))))

(declare-fun b!1274689 () Bool)

(assert (=> b!1274689 (= e!727482 (isStrictlySorted!851 (t!42132 l!595)))))

(assert (= (and d!140195 (not res!847347)) b!1274688))

(assert (= (and b!1274688 res!847348) b!1274689))

(declare-fun m!1171325 () Bool)

(assert (=> b!1274689 m!1171325))

(assert (=> start!107808 d!140195))

(declare-fun d!140201 () Bool)

(declare-fun lt!575289 () Int)

(assert (=> d!140201 (>= lt!575289 0)))

(declare-fun e!727497 () Int)

(assert (=> d!140201 (= lt!575289 e!727497)))

(declare-fun c!123879 () Bool)

(assert (=> d!140201 (= c!123879 (is-Nil!28596 l!595))))

(assert (=> d!140201 (= (ListPrimitiveSize!165 l!595) lt!575289)))

(declare-fun b!1274711 () Bool)

(assert (=> b!1274711 (= e!727497 0)))

(declare-fun b!1274712 () Bool)

(assert (=> b!1274712 (= e!727497 (+ 1 (ListPrimitiveSize!165 (t!42132 l!595))))))

(assert (= (and d!140201 c!123879) b!1274711))

(assert (= (and d!140201 (not c!123879)) b!1274712))

(declare-fun m!1171331 () Bool)

(assert (=> b!1274712 m!1171331))

(assert (=> b!1274666 d!140201))

(declare-fun b!1274718 () Bool)

(declare-fun e!727501 () Bool)

(declare-fun tp!98018 () Bool)

(assert (=> b!1274718 (= e!727501 (and tp_is_empty!33197 tp!98018))))

(assert (=> b!1274667 (= tp!98009 e!727501)))

(assert (= (and b!1274667 (is-Cons!28595 (t!42132 l!595))) b!1274718))

