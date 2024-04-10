; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103498 () Bool)

(assert start!103498)

(declare-fun res!827731 () Bool)

(declare-fun e!703106 () Bool)

(assert (=> start!103498 (=> (not res!827731) (not e!703106))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103498 (= res!827731 (not (= a1!66 a2!55)))))

(assert (=> start!103498 e!703106))

(assert (=> start!103498 true))

(declare-datatypes ((B!1794 0))(
  ( (B!1795 (val!15659 Int)) )
))
(declare-datatypes ((tuple2!20190 0))(
  ( (tuple2!20191 (_1!10106 (_ BitVec 64)) (_2!10106 B!1794)) )
))
(declare-datatypes ((List!27324 0))(
  ( (Nil!27321) (Cons!27320 (h!28529 tuple2!20190) (t!40787 List!27324)) )
))
(declare-datatypes ((ListLongMap!18159 0))(
  ( (ListLongMap!18160 (toList!9095 List!27324)) )
))
(declare-fun lm!211 () ListLongMap!18159)

(declare-fun e!703107 () Bool)

(declare-fun inv!42767 (ListLongMap!18159) Bool)

(assert (=> start!103498 (and (inv!42767 lm!211) e!703107)))

(declare-fun b!1240471 () Bool)

(declare-fun isStrictlySorted!732 (List!27324) Bool)

(assert (=> b!1240471 (= e!703106 (not (isStrictlySorted!732 (toList!9095 lm!211))))))

(declare-fun b!1240472 () Bool)

(declare-fun tp!92525 () Bool)

(assert (=> b!1240472 (= e!703107 tp!92525)))

(assert (= (and start!103498 res!827731) b!1240471))

(assert (= start!103498 b!1240472))

(declare-fun m!1143753 () Bool)

(assert (=> start!103498 m!1143753))

(declare-fun m!1143755 () Bool)

(assert (=> b!1240471 m!1143755))

(push 1)

(assert (not start!103498))

(assert (not b!1240471))

(assert (not b!1240472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136287 () Bool)

(assert (=> d!136287 (= (inv!42767 lm!211) (isStrictlySorted!732 (toList!9095 lm!211)))))

(declare-fun bs!34907 () Bool)

(assert (= bs!34907 d!136287))

(assert (=> bs!34907 m!1143755))

(assert (=> start!103498 d!136287))

(declare-fun d!136289 () Bool)

(declare-fun res!827736 () Bool)

(declare-fun e!703112 () Bool)

(assert (=> d!136289 (=> res!827736 e!703112)))

(assert (=> d!136289 (= res!827736 (or (is-Nil!27321 (toList!9095 lm!211)) (is-Nil!27321 (t!40787 (toList!9095 lm!211)))))))

(assert (=> d!136289 (= (isStrictlySorted!732 (toList!9095 lm!211)) e!703112)))

(declare-fun b!1240477 () Bool)

(declare-fun e!703113 () Bool)

(assert (=> b!1240477 (= e!703112 e!703113)))

(declare-fun res!827737 () Bool)

(assert (=> b!1240477 (=> (not res!827737) (not e!703113))))

(assert (=> b!1240477 (= res!827737 (bvslt (_1!10106 (h!28529 (toList!9095 lm!211))) (_1!10106 (h!28529 (t!40787 (toList!9095 lm!211))))))))

(declare-fun b!1240478 () Bool)

(assert (=> b!1240478 (= e!703113 (isStrictlySorted!732 (t!40787 (toList!9095 lm!211))))))

(assert (= (and d!136289 (not res!827736)) b!1240477))

(assert (= (and b!1240477 res!827737) b!1240478))

(declare-fun m!1143757 () Bool)

(assert (=> b!1240478 m!1143757))

(assert (=> b!1240471 d!136289))

(declare-fun b!1240487 () Bool)

(declare-fun e!703120 () Bool)

(declare-fun tp_is_empty!31189 () Bool)

(declare-fun tp!92528 () Bool)

(assert (=> b!1240487 (= e!703120 (and tp_is_empty!31189 tp!92528))))

(assert (=> b!1240472 (= tp!92525 e!703120)))

(assert (= (and b!1240472 (is-Cons!27320 (toList!9095 lm!211))) b!1240487))

(push 1)

(assert (not b!1240478))

