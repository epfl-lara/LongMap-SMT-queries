; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103496 () Bool)

(assert start!103496)

(declare-fun res!827728 () Bool)

(declare-fun e!703100 () Bool)

(assert (=> start!103496 (=> (not res!827728) (not e!703100))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103496 (= res!827728 (not (= a1!66 a2!55)))))

(assert (=> start!103496 e!703100))

(assert (=> start!103496 true))

(declare-datatypes ((B!1792 0))(
  ( (B!1793 (val!15658 Int)) )
))
(declare-datatypes ((tuple2!20188 0))(
  ( (tuple2!20189 (_1!10105 (_ BitVec 64)) (_2!10105 B!1792)) )
))
(declare-datatypes ((List!27323 0))(
  ( (Nil!27320) (Cons!27319 (h!28528 tuple2!20188) (t!40786 List!27323)) )
))
(declare-datatypes ((ListLongMap!18157 0))(
  ( (ListLongMap!18158 (toList!9094 List!27323)) )
))
(declare-fun lm!211 () ListLongMap!18157)

(declare-fun e!703101 () Bool)

(declare-fun inv!42766 (ListLongMap!18157) Bool)

(assert (=> start!103496 (and (inv!42766 lm!211) e!703101)))

(declare-fun b!1240465 () Bool)

(declare-fun isStrictlySorted!731 (List!27323) Bool)

(assert (=> b!1240465 (= e!703100 (not (isStrictlySorted!731 (toList!9094 lm!211))))))

(declare-fun b!1240466 () Bool)

(declare-fun tp!92522 () Bool)

(assert (=> b!1240466 (= e!703101 tp!92522)))

(assert (= (and start!103496 res!827728) b!1240465))

(assert (= start!103496 b!1240466))

(declare-fun m!1143749 () Bool)

(assert (=> start!103496 m!1143749))

(declare-fun m!1143751 () Bool)

(assert (=> b!1240465 m!1143751))

(check-sat (not start!103496) (not b!1240465) (not b!1240466))
(check-sat)
(get-model)

(declare-fun d!136295 () Bool)

(assert (=> d!136295 (= (inv!42766 lm!211) (isStrictlySorted!731 (toList!9094 lm!211)))))

(declare-fun bs!34909 () Bool)

(assert (= bs!34909 d!136295))

(assert (=> bs!34909 m!1143751))

