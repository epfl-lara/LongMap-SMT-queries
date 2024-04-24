; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106668 () Bool)

(assert start!106668)

(declare-fun b!1266920 () Bool)

(declare-fun res!843172 () Bool)

(declare-fun e!721617 () Bool)

(assert (=> b!1266920 (=> (not res!843172) (not e!721617))))

(declare-datatypes ((B!1976 0))(
  ( (B!1977 (val!16323 Int)) )
))
(declare-datatypes ((tuple2!21174 0))(
  ( (tuple2!21175 (_1!10598 (_ BitVec 64)) (_2!10598 B!1976)) )
))
(declare-datatypes ((List!28351 0))(
  ( (Nil!28348) (Cons!28347 (h!29565 tuple2!21174) (t!41864 List!28351)) )
))
(declare-fun l!706 () List!28351)

(get-info :version)

(assert (=> b!1266920 (= res!843172 ((_ is Cons!28347) l!706))))

(declare-fun b!1266922 () Bool)

(declare-fun e!721616 () Bool)

(declare-fun tp_is_empty!32509 () Bool)

(declare-fun tp!96356 () Bool)

(assert (=> b!1266922 (= e!721616 (and tp_is_empty!32509 tp!96356))))

(declare-fun b!1266919 () Bool)

(declare-fun res!843173 () Bool)

(assert (=> b!1266919 (=> (not res!843173) (not e!721617))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!649 (List!28351 (_ BitVec 64)) Bool)

(assert (=> b!1266919 (= res!843173 (not (containsKey!649 l!706 key1!31)))))

(declare-fun b!1266921 () Bool)

(declare-fun isStrictlySorted!778 (List!28351) Bool)

(assert (=> b!1266921 (= e!721617 (not (isStrictlySorted!778 (t!41864 l!706))))))

(declare-fun res!843171 () Bool)

(assert (=> start!106668 (=> (not res!843171) (not e!721617))))

(assert (=> start!106668 (= res!843171 (isStrictlySorted!778 l!706))))

(assert (=> start!106668 e!721617))

(assert (=> start!106668 e!721616))

(assert (=> start!106668 true))

(assert (= (and start!106668 res!843171) b!1266919))

(assert (= (and b!1266919 res!843173) b!1266920))

(assert (= (and b!1266920 res!843172) b!1266921))

(assert (= (and start!106668 ((_ is Cons!28347) l!706)) b!1266922))

(declare-fun m!1167295 () Bool)

(assert (=> b!1266919 m!1167295))

(declare-fun m!1167297 () Bool)

(assert (=> b!1266921 m!1167297))

(declare-fun m!1167299 () Bool)

(assert (=> start!106668 m!1167299))

(check-sat (not b!1266921) (not start!106668) (not b!1266919) tp_is_empty!32509 (not b!1266922))
(check-sat)
(get-model)

(declare-fun d!139397 () Bool)

(declare-fun res!843208 () Bool)

(declare-fun e!721646 () Bool)

(assert (=> d!139397 (=> res!843208 e!721646)))

(assert (=> d!139397 (= res!843208 (and ((_ is Cons!28347) l!706) (= (_1!10598 (h!29565 l!706)) key1!31)))))

(assert (=> d!139397 (= (containsKey!649 l!706 key1!31) e!721646)))

(declare-fun b!1266963 () Bool)

(declare-fun e!721647 () Bool)

(assert (=> b!1266963 (= e!721646 e!721647)))

(declare-fun res!843209 () Bool)

(assert (=> b!1266963 (=> (not res!843209) (not e!721647))))

(assert (=> b!1266963 (= res!843209 (and (or (not ((_ is Cons!28347) l!706)) (bvsle (_1!10598 (h!29565 l!706)) key1!31)) ((_ is Cons!28347) l!706) (bvslt (_1!10598 (h!29565 l!706)) key1!31)))))

(declare-fun b!1266964 () Bool)

(assert (=> b!1266964 (= e!721647 (containsKey!649 (t!41864 l!706) key1!31))))

(assert (= (and d!139397 (not res!843208)) b!1266963))

(assert (= (and b!1266963 res!843209) b!1266964))

(declare-fun m!1167315 () Bool)

(assert (=> b!1266964 m!1167315))

(assert (=> b!1266919 d!139397))

(declare-fun d!139405 () Bool)

(declare-fun res!843224 () Bool)

(declare-fun e!721662 () Bool)

(assert (=> d!139405 (=> res!843224 e!721662)))

(assert (=> d!139405 (= res!843224 (or ((_ is Nil!28348) (t!41864 l!706)) ((_ is Nil!28348) (t!41864 (t!41864 l!706)))))))

(assert (=> d!139405 (= (isStrictlySorted!778 (t!41864 l!706)) e!721662)))

(declare-fun b!1266979 () Bool)

(declare-fun e!721663 () Bool)

(assert (=> b!1266979 (= e!721662 e!721663)))

(declare-fun res!843225 () Bool)

(assert (=> b!1266979 (=> (not res!843225) (not e!721663))))

(assert (=> b!1266979 (= res!843225 (bvslt (_1!10598 (h!29565 (t!41864 l!706))) (_1!10598 (h!29565 (t!41864 (t!41864 l!706))))))))

(declare-fun b!1266980 () Bool)

(assert (=> b!1266980 (= e!721663 (isStrictlySorted!778 (t!41864 (t!41864 l!706))))))

(assert (= (and d!139405 (not res!843224)) b!1266979))

(assert (= (and b!1266979 res!843225) b!1266980))

(declare-fun m!1167319 () Bool)

(assert (=> b!1266980 m!1167319))

(assert (=> b!1266921 d!139405))

(declare-fun d!139411 () Bool)

(declare-fun res!843228 () Bool)

(declare-fun e!721666 () Bool)

(assert (=> d!139411 (=> res!843228 e!721666)))

(assert (=> d!139411 (= res!843228 (or ((_ is Nil!28348) l!706) ((_ is Nil!28348) (t!41864 l!706))))))

(assert (=> d!139411 (= (isStrictlySorted!778 l!706) e!721666)))

(declare-fun b!1266983 () Bool)

(declare-fun e!721667 () Bool)

(assert (=> b!1266983 (= e!721666 e!721667)))

(declare-fun res!843229 () Bool)

(assert (=> b!1266983 (=> (not res!843229) (not e!721667))))

(assert (=> b!1266983 (= res!843229 (bvslt (_1!10598 (h!29565 l!706)) (_1!10598 (h!29565 (t!41864 l!706)))))))

(declare-fun b!1266984 () Bool)

(assert (=> b!1266984 (= e!721667 (isStrictlySorted!778 (t!41864 l!706)))))

(assert (= (and d!139411 (not res!843228)) b!1266983))

(assert (= (and b!1266983 res!843229) b!1266984))

(assert (=> b!1266984 m!1167297))

(assert (=> start!106668 d!139411))

(declare-fun b!1266995 () Bool)

(declare-fun e!721674 () Bool)

(declare-fun tp!96367 () Bool)

(assert (=> b!1266995 (= e!721674 (and tp_is_empty!32509 tp!96367))))

(assert (=> b!1266922 (= tp!96356 e!721674)))

(assert (= (and b!1266922 ((_ is Cons!28347) (t!41864 l!706))) b!1266995))

(check-sat (not b!1266980) (not b!1266995) (not b!1266984) (not b!1266964) tp_is_empty!32509)
(check-sat)
