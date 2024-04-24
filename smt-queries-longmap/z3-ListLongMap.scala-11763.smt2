; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138450 () Bool)

(assert start!138450)

(declare-fun b!1586635 () Bool)

(declare-fun res!1082937 () Bool)

(declare-fun e!885837 () Bool)

(assert (=> b!1586635 (=> (not res!1082937) (not e!885837))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1586635 (= res!1082937 (not (= otherKey!56 newKey!123)))))

(declare-fun b!1586636 () Bool)

(declare-datatypes ((B!2906 0))(
  ( (B!2907 (val!19815 Int)) )
))
(declare-datatypes ((tuple2!25858 0))(
  ( (tuple2!25859 (_1!12940 (_ BitVec 64)) (_2!12940 B!2906)) )
))
(declare-datatypes ((List!36967 0))(
  ( (Nil!36964) (Cons!36963 (h!38524 tuple2!25858) (t!51873 List!36967)) )
))
(declare-fun l!1251 () List!36967)

(declare-fun ListPrimitiveSize!217 (List!36967) Int)

(assert (=> b!1586636 (= e!885837 (< (ListPrimitiveSize!217 l!1251) 0))))

(declare-fun res!1082936 () Bool)

(assert (=> start!138450 (=> (not res!1082936) (not e!885837))))

(declare-fun isStrictlySorted!1148 (List!36967) Bool)

(assert (=> start!138450 (= res!1082936 (isStrictlySorted!1148 l!1251))))

(assert (=> start!138450 e!885837))

(declare-fun e!885838 () Bool)

(assert (=> start!138450 e!885838))

(assert (=> start!138450 true))

(declare-fun b!1586634 () Bool)

(declare-fun res!1082938 () Bool)

(assert (=> b!1586634 (=> (not res!1082938) (not e!885837))))

(declare-fun containsKey!995 (List!36967 (_ BitVec 64)) Bool)

(assert (=> b!1586634 (= res!1082938 (not (containsKey!995 l!1251 otherKey!56)))))

(declare-fun b!1586637 () Bool)

(declare-fun tp_is_empty!39439 () Bool)

(declare-fun tp!115067 () Bool)

(assert (=> b!1586637 (= e!885838 (and tp_is_empty!39439 tp!115067))))

(assert (= (and start!138450 res!1082936) b!1586634))

(assert (= (and b!1586634 res!1082938) b!1586635))

(assert (= (and b!1586635 res!1082937) b!1586636))

(get-info :version)

(assert (= (and start!138450 ((_ is Cons!36963) l!1251)) b!1586637))

(declare-fun m!1455939 () Bool)

(assert (=> b!1586636 m!1455939))

(declare-fun m!1455941 () Bool)

(assert (=> start!138450 m!1455941))

(declare-fun m!1455943 () Bool)

(assert (=> b!1586634 m!1455943))

(check-sat (not b!1586634) (not b!1586637) (not b!1586636) tp_is_empty!39439 (not start!138450))
(check-sat)
(get-model)

(declare-fun d!168085 () Bool)

(declare-fun res!1082961 () Bool)

(declare-fun e!885855 () Bool)

(assert (=> d!168085 (=> res!1082961 e!885855)))

(assert (=> d!168085 (= res!1082961 (or ((_ is Nil!36964) l!1251) ((_ is Nil!36964) (t!51873 l!1251))))))

(assert (=> d!168085 (= (isStrictlySorted!1148 l!1251) e!885855)))

(declare-fun b!1586666 () Bool)

(declare-fun e!885856 () Bool)

(assert (=> b!1586666 (= e!885855 e!885856)))

(declare-fun res!1082962 () Bool)

(assert (=> b!1586666 (=> (not res!1082962) (not e!885856))))

(assert (=> b!1586666 (= res!1082962 (bvslt (_1!12940 (h!38524 l!1251)) (_1!12940 (h!38524 (t!51873 l!1251)))))))

(declare-fun b!1586667 () Bool)

(assert (=> b!1586667 (= e!885856 (isStrictlySorted!1148 (t!51873 l!1251)))))

(assert (= (and d!168085 (not res!1082961)) b!1586666))

(assert (= (and b!1586666 res!1082962) b!1586667))

(declare-fun m!1455957 () Bool)

(assert (=> b!1586667 m!1455957))

(assert (=> start!138450 d!168085))

(declare-fun d!168087 () Bool)

(declare-fun lt!678147 () Int)

(assert (=> d!168087 (>= lt!678147 0)))

(declare-fun e!885859 () Int)

(assert (=> d!168087 (= lt!678147 e!885859)))

(declare-fun c!147642 () Bool)

(assert (=> d!168087 (= c!147642 ((_ is Nil!36964) l!1251))))

(assert (=> d!168087 (= (ListPrimitiveSize!217 l!1251) lt!678147)))

(declare-fun b!1586672 () Bool)

(assert (=> b!1586672 (= e!885859 0)))

(declare-fun b!1586673 () Bool)

(assert (=> b!1586673 (= e!885859 (+ 1 (ListPrimitiveSize!217 (t!51873 l!1251))))))

(assert (= (and d!168087 c!147642) b!1586672))

(assert (= (and d!168087 (not c!147642)) b!1586673))

(declare-fun m!1455959 () Bool)

(assert (=> b!1586673 m!1455959))

(assert (=> b!1586636 d!168087))

(declare-fun d!168093 () Bool)

(declare-fun res!1082971 () Bool)

(declare-fun e!885871 () Bool)

(assert (=> d!168093 (=> res!1082971 e!885871)))

(assert (=> d!168093 (= res!1082971 (and ((_ is Cons!36963) l!1251) (= (_1!12940 (h!38524 l!1251)) otherKey!56)))))

(assert (=> d!168093 (= (containsKey!995 l!1251 otherKey!56) e!885871)))

(declare-fun b!1586688 () Bool)

(declare-fun e!885872 () Bool)

(assert (=> b!1586688 (= e!885871 e!885872)))

(declare-fun res!1082972 () Bool)

(assert (=> b!1586688 (=> (not res!1082972) (not e!885872))))

(assert (=> b!1586688 (= res!1082972 (and (or (not ((_ is Cons!36963) l!1251)) (bvsle (_1!12940 (h!38524 l!1251)) otherKey!56)) ((_ is Cons!36963) l!1251) (bvslt (_1!12940 (h!38524 l!1251)) otherKey!56)))))

(declare-fun b!1586689 () Bool)

(assert (=> b!1586689 (= e!885872 (containsKey!995 (t!51873 l!1251) otherKey!56))))

(assert (= (and d!168093 (not res!1082971)) b!1586688))

(assert (= (and b!1586688 res!1082972) b!1586689))

(declare-fun m!1455963 () Bool)

(assert (=> b!1586689 m!1455963))

(assert (=> b!1586634 d!168093))

(declare-fun b!1586694 () Bool)

(declare-fun e!885875 () Bool)

(declare-fun tp!115076 () Bool)

(assert (=> b!1586694 (= e!885875 (and tp_is_empty!39439 tp!115076))))

(assert (=> b!1586637 (= tp!115067 e!885875)))

(assert (= (and b!1586637 ((_ is Cons!36963) (t!51873 l!1251))) b!1586694))

(check-sat (not b!1586689) (not b!1586673) (not b!1586667) (not b!1586694) tp_is_empty!39439)
(check-sat)
