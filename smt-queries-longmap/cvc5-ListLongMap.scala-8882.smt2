; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107840 () Bool)

(assert start!107840)

(declare-fun res!847428 () Bool)

(declare-fun e!727585 () Bool)

(assert (=> start!107840 (=> (not res!847428) (not e!727585))))

(declare-datatypes ((B!2162 0))(
  ( (B!2163 (val!16677 Int)) )
))
(declare-datatypes ((tuple2!21436 0))(
  ( (tuple2!21437 (_1!10729 (_ BitVec 64)) (_2!10729 B!2162)) )
))
(declare-datatypes ((List!28603 0))(
  ( (Nil!28600) (Cons!28599 (h!29808 tuple2!21436) (t!42136 List!28603)) )
))
(declare-fun l!595 () List!28603)

(declare-fun isStrictlySorted!855 (List!28603) Bool)

(assert (=> start!107840 (= res!847428 (isStrictlySorted!855 l!595))))

(assert (=> start!107840 e!727585))

(declare-fun e!727584 () Bool)

(assert (=> start!107840 e!727584))

(assert (=> start!107840 true))

(declare-fun b!1274818 () Bool)

(declare-fun res!847429 () Bool)

(assert (=> b!1274818 (=> (not res!847429) (not e!727585))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274818 (= res!847429 (and (not (= (_1!10729 (h!29808 l!595)) key!173)) (is-Cons!28599 l!595)))))

(declare-fun b!1274819 () Bool)

(declare-fun ListPrimitiveSize!166 (List!28603) Int)

(assert (=> b!1274819 (= e!727585 (>= (ListPrimitiveSize!166 (t!42136 l!595)) (ListPrimitiveSize!166 l!595)))))

(declare-fun b!1274820 () Bool)

(declare-fun tp_is_empty!33205 () Bool)

(declare-fun tp!98039 () Bool)

(assert (=> b!1274820 (= e!727584 (and tp_is_empty!33205 tp!98039))))

(assert (= (and start!107840 res!847428) b!1274818))

(assert (= (and b!1274818 res!847429) b!1274819))

(assert (= (and start!107840 (is-Cons!28599 l!595)) b!1274820))

(declare-fun m!1171363 () Bool)

(assert (=> start!107840 m!1171363))

(declare-fun m!1171365 () Bool)

(assert (=> b!1274819 m!1171365))

(declare-fun m!1171367 () Bool)

(assert (=> b!1274819 m!1171367))

(push 1)

(assert (not start!107840))

(assert (not b!1274819))

(assert (not b!1274820))

(assert tp_is_empty!33205)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140227 () Bool)

(declare-fun res!847452 () Bool)

(declare-fun e!727610 () Bool)

(assert (=> d!140227 (=> res!847452 e!727610)))

(assert (=> d!140227 (= res!847452 (or (is-Nil!28600 l!595) (is-Nil!28600 (t!42136 l!595))))))

(assert (=> d!140227 (= (isStrictlySorted!855 l!595) e!727610)))

(declare-fun b!1274853 () Bool)

(declare-fun e!727611 () Bool)

(assert (=> b!1274853 (= e!727610 e!727611)))

(declare-fun res!847453 () Bool)

(assert (=> b!1274853 (=> (not res!847453) (not e!727611))))

(assert (=> b!1274853 (= res!847453 (bvslt (_1!10729 (h!29808 l!595)) (_1!10729 (h!29808 (t!42136 l!595)))))))

(declare-fun b!1274854 () Bool)

(assert (=> b!1274854 (= e!727611 (isStrictlySorted!855 (t!42136 l!595)))))

(assert (= (and d!140227 (not res!847452)) b!1274853))

(assert (= (and b!1274853 res!847453) b!1274854))

(declare-fun m!1171383 () Bool)

(assert (=> b!1274854 m!1171383))

(assert (=> start!107840 d!140227))

(declare-fun d!140231 () Bool)

(declare-fun lt!575296 () Int)

(assert (=> d!140231 (>= lt!575296 0)))

(declare-fun e!727619 () Int)

(assert (=> d!140231 (= lt!575296 e!727619)))

(declare-fun c!123886 () Bool)

(assert (=> d!140231 (= c!123886 (is-Nil!28600 (t!42136 l!595)))))

(assert (=> d!140231 (= (ListPrimitiveSize!166 (t!42136 l!595)) lt!575296)))

(declare-fun b!1274868 () Bool)

(assert (=> b!1274868 (= e!727619 0)))

(declare-fun b!1274869 () Bool)

(assert (=> b!1274869 (= e!727619 (+ 1 (ListPrimitiveSize!166 (t!42136 (t!42136 l!595)))))))

(assert (= (and d!140231 c!123886) b!1274868))

(assert (= (and d!140231 (not c!123886)) b!1274869))

(declare-fun m!1171387 () Bool)

(assert (=> b!1274869 m!1171387))

(assert (=> b!1274819 d!140231))

(declare-fun d!140237 () Bool)

(declare-fun lt!575297 () Int)

(assert (=> d!140237 (>= lt!575297 0)))

(declare-fun e!727620 () Int)

(assert (=> d!140237 (= lt!575297 e!727620)))

(declare-fun c!123887 () Bool)

(assert (=> d!140237 (= c!123887 (is-Nil!28600 l!595))))

(assert (=> d!140237 (= (ListPrimitiveSize!166 l!595) lt!575297)))

(declare-fun b!1274870 () Bool)

(assert (=> b!1274870 (= e!727620 0)))

(declare-fun b!1274871 () Bool)

(assert (=> b!1274871 (= e!727620 (+ 1 (ListPrimitiveSize!166 (t!42136 l!595))))))

(assert (= (and d!140237 c!123887) b!1274870))

(assert (= (and d!140237 (not c!123887)) b!1274871))

(assert (=> b!1274871 m!1171365))

(assert (=> b!1274819 d!140237))

(declare-fun b!1274876 () Bool)

(declare-fun e!727624 () Bool)

(declare-fun tp!98051 () Bool)

(assert (=> b!1274876 (= e!727624 (and tp_is_empty!33205 tp!98051))))

(assert (=> b!1274820 (= tp!98039 e!727624)))

(assert (= (and b!1274820 (is-Cons!28599 (t!42136 l!595))) b!1274876))

(push 1)

(assert (not b!1274854))

(assert tp_is_empty!33205)

(assert (not b!1274876))

(assert (not b!1274871))

