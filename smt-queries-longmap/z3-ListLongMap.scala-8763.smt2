; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106644 () Bool)

(assert start!106644)

(declare-fun res!843116 () Bool)

(declare-fun e!721544 () Bool)

(assert (=> start!106644 (=> (not res!843116) (not e!721544))))

(declare-datatypes ((B!1970 0))(
  ( (B!1971 (val!16320 Int)) )
))
(declare-datatypes ((tuple2!21168 0))(
  ( (tuple2!21169 (_1!10595 (_ BitVec 64)) (_2!10595 B!1970)) )
))
(declare-datatypes ((List!28348 0))(
  ( (Nil!28345) (Cons!28344 (h!29562 tuple2!21168) (t!41861 List!28348)) )
))
(declare-fun l!706 () List!28348)

(declare-fun isStrictlySorted!775 (List!28348) Bool)

(assert (=> start!106644 (= res!843116 (isStrictlySorted!775 l!706))))

(assert (=> start!106644 e!721544))

(declare-fun e!721545 () Bool)

(assert (=> start!106644 e!721545))

(assert (=> start!106644 true))

(declare-fun b!1266821 () Bool)

(declare-fun res!843115 () Bool)

(assert (=> b!1266821 (=> (not res!843115) (not e!721544))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!646 (List!28348 (_ BitVec 64)) Bool)

(assert (=> b!1266821 (= res!843115 (not (containsKey!646 l!706 key1!31)))))

(declare-fun b!1266822 () Bool)

(declare-fun ListPrimitiveSize!151 (List!28348) Int)

(assert (=> b!1266822 (= e!721544 (< (ListPrimitiveSize!151 l!706) 0))))

(declare-fun b!1266823 () Bool)

(declare-fun tp_is_empty!32503 () Bool)

(declare-fun tp!96338 () Bool)

(assert (=> b!1266823 (= e!721545 (and tp_is_empty!32503 tp!96338))))

(assert (= (and start!106644 res!843116) b!1266821))

(assert (= (and b!1266821 res!843115) b!1266822))

(get-info :version)

(assert (= (and start!106644 ((_ is Cons!28344) l!706)) b!1266823))

(declare-fun m!1167259 () Bool)

(assert (=> start!106644 m!1167259))

(declare-fun m!1167261 () Bool)

(assert (=> b!1266821 m!1167261))

(declare-fun m!1167263 () Bool)

(assert (=> b!1266822 m!1167263))

(check-sat (not b!1266822) (not b!1266823) tp_is_empty!32503 (not start!106644) (not b!1266821))
(check-sat)
(get-model)

(declare-fun d!139375 () Bool)

(declare-fun res!843137 () Bool)

(declare-fun e!721566 () Bool)

(assert (=> d!139375 (=> res!843137 e!721566)))

(assert (=> d!139375 (= res!843137 (or ((_ is Nil!28345) l!706) ((_ is Nil!28345) (t!41861 l!706))))))

(assert (=> d!139375 (= (isStrictlySorted!775 l!706) e!721566)))

(declare-fun b!1266850 () Bool)

(declare-fun e!721567 () Bool)

(assert (=> b!1266850 (= e!721566 e!721567)))

(declare-fun res!843138 () Bool)

(assert (=> b!1266850 (=> (not res!843138) (not e!721567))))

(assert (=> b!1266850 (= res!843138 (bvslt (_1!10595 (h!29562 l!706)) (_1!10595 (h!29562 (t!41861 l!706)))))))

(declare-fun b!1266851 () Bool)

(assert (=> b!1266851 (= e!721567 (isStrictlySorted!775 (t!41861 l!706)))))

(assert (= (and d!139375 (not res!843137)) b!1266850))

(assert (= (and b!1266850 res!843138) b!1266851))

(declare-fun m!1167277 () Bool)

(assert (=> b!1266851 m!1167277))

(assert (=> start!106644 d!139375))

(declare-fun d!139381 () Bool)

(declare-fun res!843151 () Bool)

(declare-fun e!721585 () Bool)

(assert (=> d!139381 (=> res!843151 e!721585)))

(assert (=> d!139381 (= res!843151 (and ((_ is Cons!28344) l!706) (= (_1!10595 (h!29562 l!706)) key1!31)))))

(assert (=> d!139381 (= (containsKey!646 l!706 key1!31) e!721585)))

(declare-fun b!1266874 () Bool)

(declare-fun e!721586 () Bool)

(assert (=> b!1266874 (= e!721585 e!721586)))

(declare-fun res!843152 () Bool)

(assert (=> b!1266874 (=> (not res!843152) (not e!721586))))

(assert (=> b!1266874 (= res!843152 (and (or (not ((_ is Cons!28344) l!706)) (bvsle (_1!10595 (h!29562 l!706)) key1!31)) ((_ is Cons!28344) l!706) (bvslt (_1!10595 (h!29562 l!706)) key1!31)))))

(declare-fun b!1266875 () Bool)

(assert (=> b!1266875 (= e!721586 (containsKey!646 (t!41861 l!706) key1!31))))

(assert (= (and d!139381 (not res!843151)) b!1266874))

(assert (= (and b!1266874 res!843152) b!1266875))

(declare-fun m!1167285 () Bool)

(assert (=> b!1266875 m!1167285))

(assert (=> b!1266821 d!139381))

(declare-fun d!139389 () Bool)

(declare-fun lt!574543 () Int)

(assert (=> d!139389 (>= lt!574543 0)))

(declare-fun e!721594 () Int)

(assert (=> d!139389 (= lt!574543 e!721594)))

(declare-fun c!123728 () Bool)

(assert (=> d!139389 (= c!123728 ((_ is Nil!28345) l!706))))

(assert (=> d!139389 (= (ListPrimitiveSize!151 l!706) lt!574543)))

(declare-fun b!1266886 () Bool)

(assert (=> b!1266886 (= e!721594 0)))

(declare-fun b!1266887 () Bool)

(assert (=> b!1266887 (= e!721594 (+ 1 (ListPrimitiveSize!151 (t!41861 l!706))))))

(assert (= (and d!139389 c!123728) b!1266886))

(assert (= (and d!139389 (not c!123728)) b!1266887))

(declare-fun m!1167289 () Bool)

(assert (=> b!1266887 m!1167289))

(assert (=> b!1266822 d!139389))

(declare-fun b!1266902 () Bool)

(declare-fun e!721605 () Bool)

(declare-fun tp!96349 () Bool)

(assert (=> b!1266902 (= e!721605 (and tp_is_empty!32503 tp!96349))))

(assert (=> b!1266823 (= tp!96338 e!721605)))

(assert (= (and b!1266823 ((_ is Cons!28344) (t!41861 l!706))) b!1266902))

(check-sat (not b!1266875) (not b!1266851) (not b!1266887) tp_is_empty!32503 (not b!1266902))
(check-sat)
