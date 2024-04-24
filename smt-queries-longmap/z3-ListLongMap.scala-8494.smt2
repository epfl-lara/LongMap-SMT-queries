; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103730 () Bool)

(assert start!103730)

(declare-fun res!828258 () Bool)

(declare-fun e!703957 () Bool)

(assert (=> start!103730 (=> (not res!828258) (not e!703957))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103730 (= res!828258 (not (= a1!66 a2!55)))))

(assert (=> start!103730 e!703957))

(assert (=> start!103730 true))

(declare-datatypes ((B!1790 0))(
  ( (B!1791 (val!15657 Int)) )
))
(declare-datatypes ((tuple2!20202 0))(
  ( (tuple2!20203 (_1!10112 (_ BitVec 64)) (_2!10112 B!1790)) )
))
(declare-datatypes ((List!27347 0))(
  ( (Nil!27344) (Cons!27343 (h!28561 tuple2!20202) (t!40802 List!27347)) )
))
(declare-datatypes ((ListLongMap!18179 0))(
  ( (ListLongMap!18180 (toList!9105 List!27347)) )
))
(declare-fun lm!211 () ListLongMap!18179)

(declare-fun e!703958 () Bool)

(declare-fun inv!42765 (ListLongMap!18179) Bool)

(assert (=> start!103730 (and (inv!42765 lm!211) e!703958)))

(declare-fun b!1241783 () Bool)

(declare-fun isStrictlySorted!718 (List!27347) Bool)

(assert (=> b!1241783 (= e!703957 (not (isStrictlySorted!718 (toList!9105 lm!211))))))

(declare-fun b!1241784 () Bool)

(declare-fun tp!92519 () Bool)

(assert (=> b!1241784 (= e!703958 tp!92519)))

(assert (= (and start!103730 res!828258) b!1241783))

(assert (= start!103730 b!1241784))

(declare-fun m!1145389 () Bool)

(assert (=> start!103730 m!1145389))

(declare-fun m!1145391 () Bool)

(assert (=> b!1241783 m!1145391))

(check-sat (not start!103730) (not b!1241783) (not b!1241784))
(check-sat)
(get-model)

(declare-fun d!136751 () Bool)

(assert (=> d!136751 (= (inv!42765 lm!211) (isStrictlySorted!718 (toList!9105 lm!211)))))

(declare-fun bs!34925 () Bool)

(assert (= bs!34925 d!136751))

(assert (=> bs!34925 m!1145391))

(assert (=> start!103730 d!136751))

(declare-fun d!136753 () Bool)

(declare-fun res!828273 () Bool)

(declare-fun e!703979 () Bool)

(assert (=> d!136753 (=> res!828273 e!703979)))

(get-info :version)

(assert (=> d!136753 (= res!828273 (or ((_ is Nil!27344) (toList!9105 lm!211)) ((_ is Nil!27344) (t!40802 (toList!9105 lm!211)))))))

(assert (=> d!136753 (= (isStrictlySorted!718 (toList!9105 lm!211)) e!703979)))

(declare-fun b!1241805 () Bool)

(declare-fun e!703980 () Bool)

(assert (=> b!1241805 (= e!703979 e!703980)))

(declare-fun res!828274 () Bool)

(assert (=> b!1241805 (=> (not res!828274) (not e!703980))))

(assert (=> b!1241805 (= res!828274 (bvslt (_1!10112 (h!28561 (toList!9105 lm!211))) (_1!10112 (h!28561 (t!40802 (toList!9105 lm!211))))))))

(declare-fun b!1241806 () Bool)

(assert (=> b!1241806 (= e!703980 (isStrictlySorted!718 (t!40802 (toList!9105 lm!211))))))

(assert (= (and d!136753 (not res!828273)) b!1241805))

(assert (= (and b!1241805 res!828274) b!1241806))

(declare-fun m!1145401 () Bool)

(assert (=> b!1241806 m!1145401))

(assert (=> b!1241783 d!136753))

(declare-fun b!1241813 () Bool)

(declare-fun e!703985 () Bool)

(declare-fun tp_is_empty!31189 () Bool)

(declare-fun tp!92528 () Bool)

(assert (=> b!1241813 (= e!703985 (and tp_is_empty!31189 tp!92528))))

(assert (=> b!1241784 (= tp!92519 e!703985)))

(assert (= (and b!1241784 ((_ is Cons!27343) (toList!9105 lm!211))) b!1241813))

(check-sat (not d!136751) (not b!1241806) (not b!1241813) tp_is_empty!31189)
(check-sat)
