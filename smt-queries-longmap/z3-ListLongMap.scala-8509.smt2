; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103720 () Bool)

(assert start!103720)

(declare-fun b!1241850 () Bool)

(declare-fun res!828312 () Bool)

(declare-fun e!703932 () Bool)

(assert (=> b!1241850 (=> (not res!828312) (not e!703932))))

(declare-datatypes ((B!1880 0))(
  ( (B!1881 (val!15702 Int)) )
))
(declare-datatypes ((tuple2!20360 0))(
  ( (tuple2!20361 (_1!10191 (_ BitVec 64)) (_2!10191 B!1880)) )
))
(declare-datatypes ((List!27429 0))(
  ( (Nil!27426) (Cons!27425 (h!28634 tuple2!20360) (t!40883 List!27429)) )
))
(declare-fun l!644 () List!27429)

(declare-fun isStrictlySorted!756 (List!27429) Bool)

(assert (=> b!1241850 (= res!828312 (isStrictlySorted!756 (t!40883 l!644)))))

(declare-fun b!1241851 () Bool)

(declare-fun ListPrimitiveSize!148 (List!27429) Int)

(assert (=> b!1241851 (= e!703932 (>= (ListPrimitiveSize!148 (t!40883 l!644)) (ListPrimitiveSize!148 l!644)))))

(declare-fun b!1241852 () Bool)

(declare-fun res!828311 () Bool)

(assert (=> b!1241852 (=> (not res!828311) (not e!703932))))

(get-info :version)

(assert (=> b!1241852 (= res!828311 ((_ is Cons!27425) l!644))))

(declare-fun b!1241854 () Bool)

(declare-fun e!703931 () Bool)

(declare-fun tp_is_empty!31279 () Bool)

(declare-fun tp!92726 () Bool)

(assert (=> b!1241854 (= e!703931 (and tp_is_empty!31279 tp!92726))))

(declare-fun res!828309 () Bool)

(assert (=> start!103720 (=> (not res!828309) (not e!703932))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103720 (= res!828309 (not (= key1!25 key2!15)))))

(assert (=> start!103720 e!703932))

(assert (=> start!103720 true))

(assert (=> start!103720 e!703931))

(declare-fun b!1241853 () Bool)

(declare-fun res!828310 () Bool)

(assert (=> b!1241853 (=> (not res!828310) (not e!703932))))

(assert (=> b!1241853 (= res!828310 (isStrictlySorted!756 l!644))))

(assert (= (and start!103720 res!828309) b!1241853))

(assert (= (and b!1241853 res!828310) b!1241852))

(assert (= (and b!1241852 res!828311) b!1241850))

(assert (= (and b!1241850 res!828312) b!1241851))

(assert (= (and start!103720 ((_ is Cons!27425) l!644)) b!1241854))

(declare-fun m!1144183 () Bool)

(assert (=> b!1241850 m!1144183))

(declare-fun m!1144185 () Bool)

(assert (=> b!1241851 m!1144185))

(declare-fun m!1144187 () Bool)

(assert (=> b!1241851 m!1144187))

(declare-fun m!1144189 () Bool)

(assert (=> b!1241853 m!1144189))

(check-sat tp_is_empty!31279 (not b!1241854) (not b!1241851) (not b!1241850) (not b!1241853))
(check-sat)
(get-model)

(declare-fun d!136427 () Bool)

(declare-fun res!828341 () Bool)

(declare-fun e!703949 () Bool)

(assert (=> d!136427 (=> res!828341 e!703949)))

(assert (=> d!136427 (= res!828341 (or ((_ is Nil!27426) l!644) ((_ is Nil!27426) (t!40883 l!644))))))

(assert (=> d!136427 (= (isStrictlySorted!756 l!644) e!703949)))

(declare-fun b!1241889 () Bool)

(declare-fun e!703950 () Bool)

(assert (=> b!1241889 (= e!703949 e!703950)))

(declare-fun res!828342 () Bool)

(assert (=> b!1241889 (=> (not res!828342) (not e!703950))))

(assert (=> b!1241889 (= res!828342 (bvslt (_1!10191 (h!28634 l!644)) (_1!10191 (h!28634 (t!40883 l!644)))))))

(declare-fun b!1241890 () Bool)

(assert (=> b!1241890 (= e!703950 (isStrictlySorted!756 (t!40883 l!644)))))

(assert (= (and d!136427 (not res!828341)) b!1241889))

(assert (= (and b!1241889 res!828342) b!1241890))

(assert (=> b!1241890 m!1144183))

(assert (=> b!1241853 d!136427))

(declare-fun d!136431 () Bool)

(declare-fun lt!561993 () Int)

(assert (=> d!136431 (>= lt!561993 0)))

(declare-fun e!703959 () Int)

(assert (=> d!136431 (= lt!561993 e!703959)))

(declare-fun c!121498 () Bool)

(assert (=> d!136431 (= c!121498 ((_ is Nil!27426) (t!40883 l!644)))))

(assert (=> d!136431 (= (ListPrimitiveSize!148 (t!40883 l!644)) lt!561993)))

(declare-fun b!1241901 () Bool)

(assert (=> b!1241901 (= e!703959 0)))

(declare-fun b!1241902 () Bool)

(assert (=> b!1241902 (= e!703959 (+ 1 (ListPrimitiveSize!148 (t!40883 (t!40883 l!644)))))))

(assert (= (and d!136431 c!121498) b!1241901))

(assert (= (and d!136431 (not c!121498)) b!1241902))

(declare-fun m!1144207 () Bool)

(assert (=> b!1241902 m!1144207))

(assert (=> b!1241851 d!136431))

(declare-fun d!136435 () Bool)

(declare-fun lt!561994 () Int)

(assert (=> d!136435 (>= lt!561994 0)))

(declare-fun e!703962 () Int)

(assert (=> d!136435 (= lt!561994 e!703962)))

(declare-fun c!121499 () Bool)

(assert (=> d!136435 (= c!121499 ((_ is Nil!27426) l!644))))

(assert (=> d!136435 (= (ListPrimitiveSize!148 l!644) lt!561994)))

(declare-fun b!1241905 () Bool)

(assert (=> b!1241905 (= e!703962 0)))

(declare-fun b!1241906 () Bool)

(assert (=> b!1241906 (= e!703962 (+ 1 (ListPrimitiveSize!148 (t!40883 l!644))))))

(assert (= (and d!136435 c!121499) b!1241905))

(assert (= (and d!136435 (not c!121499)) b!1241906))

(assert (=> b!1241906 m!1144185))

(assert (=> b!1241851 d!136435))

(declare-fun d!136437 () Bool)

(declare-fun res!828353 () Bool)

(declare-fun e!703965 () Bool)

(assert (=> d!136437 (=> res!828353 e!703965)))

(assert (=> d!136437 (= res!828353 (or ((_ is Nil!27426) (t!40883 l!644)) ((_ is Nil!27426) (t!40883 (t!40883 l!644)))))))

(assert (=> d!136437 (= (isStrictlySorted!756 (t!40883 l!644)) e!703965)))

(declare-fun b!1241909 () Bool)

(declare-fun e!703966 () Bool)

(assert (=> b!1241909 (= e!703965 e!703966)))

(declare-fun res!828354 () Bool)

(assert (=> b!1241909 (=> (not res!828354) (not e!703966))))

(assert (=> b!1241909 (= res!828354 (bvslt (_1!10191 (h!28634 (t!40883 l!644))) (_1!10191 (h!28634 (t!40883 (t!40883 l!644))))))))

(declare-fun b!1241910 () Bool)

(assert (=> b!1241910 (= e!703966 (isStrictlySorted!756 (t!40883 (t!40883 l!644))))))

(assert (= (and d!136437 (not res!828353)) b!1241909))

(assert (= (and b!1241909 res!828354) b!1241910))

(declare-fun m!1144209 () Bool)

(assert (=> b!1241910 m!1144209))

(assert (=> b!1241850 d!136437))

(declare-fun b!1241917 () Bool)

(declare-fun e!703971 () Bool)

(declare-fun tp!92735 () Bool)

(assert (=> b!1241917 (= e!703971 (and tp_is_empty!31279 tp!92735))))

(assert (=> b!1241854 (= tp!92726 e!703971)))

(assert (= (and b!1241854 ((_ is Cons!27425) (t!40883 l!644))) b!1241917))

(check-sat (not b!1241906) (not b!1241910) (not b!1241917) (not b!1241902) (not b!1241890) tp_is_empty!31279)
(check-sat)
