; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103494 () Bool)

(assert start!103494)

(declare-fun res!827725 () Bool)

(declare-fun e!703094 () Bool)

(assert (=> start!103494 (=> (not res!827725) (not e!703094))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103494 (= res!827725 (not (= a1!66 a2!55)))))

(assert (=> start!103494 e!703094))

(assert (=> start!103494 true))

(declare-datatypes ((B!1790 0))(
  ( (B!1791 (val!15657 Int)) )
))
(declare-datatypes ((tuple2!20186 0))(
  ( (tuple2!20187 (_1!10104 (_ BitVec 64)) (_2!10104 B!1790)) )
))
(declare-datatypes ((List!27322 0))(
  ( (Nil!27319) (Cons!27318 (h!28527 tuple2!20186) (t!40785 List!27322)) )
))
(declare-datatypes ((ListLongMap!18155 0))(
  ( (ListLongMap!18156 (toList!9093 List!27322)) )
))
(declare-fun lm!211 () ListLongMap!18155)

(declare-fun e!703095 () Bool)

(declare-fun inv!42765 (ListLongMap!18155) Bool)

(assert (=> start!103494 (and (inv!42765 lm!211) e!703095)))

(declare-fun b!1240459 () Bool)

(declare-fun isStrictlySorted!730 (List!27322) Bool)

(assert (=> b!1240459 (= e!703094 (not (isStrictlySorted!730 (toList!9093 lm!211))))))

(declare-fun b!1240460 () Bool)

(declare-fun tp!92519 () Bool)

(assert (=> b!1240460 (= e!703095 tp!92519)))

(assert (= (and start!103494 res!827725) b!1240459))

(assert (= start!103494 b!1240460))

(declare-fun m!1143745 () Bool)

(assert (=> start!103494 m!1143745))

(declare-fun m!1143747 () Bool)

(assert (=> b!1240459 m!1143747))

(push 1)

(assert (not start!103494))

(assert (not b!1240459))

(assert (not b!1240460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136291 () Bool)

(assert (=> d!136291 (= (inv!42765 lm!211) (isStrictlySorted!730 (toList!9093 lm!211)))))

(declare-fun bs!34908 () Bool)

(assert (= bs!34908 d!136291))

(assert (=> bs!34908 m!1143747))

(assert (=> start!103494 d!136291))

(declare-fun d!136293 () Bool)

(declare-fun res!827742 () Bool)

(declare-fun e!703121 () Bool)

(assert (=> d!136293 (=> res!827742 e!703121)))

(assert (=> d!136293 (= res!827742 (or (is-Nil!27319 (toList!9093 lm!211)) (is-Nil!27319 (t!40785 (toList!9093 lm!211)))))))

(assert (=> d!136293 (= (isStrictlySorted!730 (toList!9093 lm!211)) e!703121)))

(declare-fun b!1240488 () Bool)

(declare-fun e!703122 () Bool)

(assert (=> b!1240488 (= e!703121 e!703122)))

(declare-fun res!827743 () Bool)

(assert (=> b!1240488 (=> (not res!827743) (not e!703122))))

(assert (=> b!1240488 (= res!827743 (bvslt (_1!10104 (h!28527 (toList!9093 lm!211))) (_1!10104 (h!28527 (t!40785 (toList!9093 lm!211))))))))

(declare-fun b!1240489 () Bool)

(assert (=> b!1240489 (= e!703122 (isStrictlySorted!730 (t!40785 (toList!9093 lm!211))))))

(assert (= (and d!136293 (not res!827742)) b!1240488))

(assert (= (and b!1240488 res!827743) b!1240489))

(declare-fun m!1143759 () Bool)

(assert (=> b!1240489 m!1143759))

(assert (=> b!1240459 d!136293))

(declare-fun b!1240494 () Bool)

(declare-fun e!703125 () Bool)

(declare-fun tp_is_empty!31191 () Bool)

(declare-fun tp!92531 () Bool)

(assert (=> b!1240494 (= e!703125 (and tp_is_empty!31191 tp!92531))))

(assert (=> b!1240460 (= tp!92519 e!703125)))

(assert (= (and b!1240460 (is-Cons!27318 (toList!9093 lm!211))) b!1240494))

(push 1)

(assert (not b!1240489))

(assert (not d!136291))

(assert (not b!1240494))

(assert tp_is_empty!31191)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

