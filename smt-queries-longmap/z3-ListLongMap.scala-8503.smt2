; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103886 () Bool)

(assert start!103886)

(declare-fun b!1242805 () Bool)

(declare-fun res!828672 () Bool)

(declare-fun e!704548 () Bool)

(assert (=> b!1242805 (=> (not res!828672) (not e!704548))))

(declare-datatypes ((B!1844 0))(
  ( (B!1845 (val!15684 Int)) )
))
(declare-datatypes ((tuple2!20256 0))(
  ( (tuple2!20257 (_1!10139 (_ BitVec 64)) (_2!10139 B!1844)) )
))
(declare-datatypes ((List!27374 0))(
  ( (Nil!27371) (Cons!27370 (h!28588 tuple2!20256) (t!40829 List!27374)) )
))
(declare-fun l!644 () List!27374)

(get-info :version)

(assert (=> b!1242805 (= res!828672 (not ((_ is Cons!27370) l!644)))))

(declare-fun b!1242804 () Bool)

(declare-fun res!828671 () Bool)

(assert (=> b!1242804 (=> (not res!828671) (not e!704548))))

(declare-fun isStrictlySorted!736 (List!27374) Bool)

(assert (=> b!1242804 (= res!828671 (isStrictlySorted!736 l!644))))

(declare-fun b!1242806 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun removeStrictlySorted!126 (List!27374 (_ BitVec 64)) List!27374)

(assert (=> b!1242806 (= e!704548 (not (isStrictlySorted!736 (removeStrictlySorted!126 l!644 key2!15))))))

(declare-fun b!1242807 () Bool)

(declare-fun e!704549 () Bool)

(declare-fun tp_is_empty!31243 () Bool)

(declare-fun tp!92636 () Bool)

(assert (=> b!1242807 (= e!704549 (and tp_is_empty!31243 tp!92636))))

(declare-fun res!828670 () Bool)

(assert (=> start!103886 (=> (not res!828670) (not e!704548))))

(declare-fun key1!25 () (_ BitVec 64))

(assert (=> start!103886 (= res!828670 (not (= key1!25 key2!15)))))

(assert (=> start!103886 e!704548))

(assert (=> start!103886 true))

(assert (=> start!103886 e!704549))

(assert (= (and start!103886 res!828670) b!1242804))

(assert (= (and b!1242804 res!828671) b!1242805))

(assert (= (and b!1242805 res!828672) b!1242806))

(assert (= (and start!103886 ((_ is Cons!27370) l!644)) b!1242807))

(declare-fun m!1146203 () Bool)

(assert (=> b!1242804 m!1146203))

(declare-fun m!1146205 () Bool)

(assert (=> b!1242806 m!1146205))

(assert (=> b!1242806 m!1146205))

(declare-fun m!1146207 () Bool)

(assert (=> b!1242806 m!1146207))

(check-sat (not b!1242804) (not b!1242806) (not b!1242807) tp_is_empty!31243)
(check-sat)
(get-model)

(declare-fun d!136955 () Bool)

(declare-fun res!828699 () Bool)

(declare-fun e!704570 () Bool)

(assert (=> d!136955 (=> res!828699 e!704570)))

(assert (=> d!136955 (= res!828699 (or ((_ is Nil!27371) l!644) ((_ is Nil!27371) (t!40829 l!644))))))

(assert (=> d!136955 (= (isStrictlySorted!736 l!644) e!704570)))

(declare-fun b!1242840 () Bool)

(declare-fun e!704571 () Bool)

(assert (=> b!1242840 (= e!704570 e!704571)))

(declare-fun res!828700 () Bool)

(assert (=> b!1242840 (=> (not res!828700) (not e!704571))))

(assert (=> b!1242840 (= res!828700 (bvslt (_1!10139 (h!28588 l!644)) (_1!10139 (h!28588 (t!40829 l!644)))))))

(declare-fun b!1242841 () Bool)

(assert (=> b!1242841 (= e!704571 (isStrictlySorted!736 (t!40829 l!644)))))

(assert (= (and d!136955 (not res!828699)) b!1242840))

(assert (= (and b!1242840 res!828700) b!1242841))

(declare-fun m!1146221 () Bool)

(assert (=> b!1242841 m!1146221))

(assert (=> b!1242804 d!136955))

(declare-fun d!136959 () Bool)

(declare-fun res!828703 () Bool)

(declare-fun e!704574 () Bool)

(assert (=> d!136959 (=> res!828703 e!704574)))

(assert (=> d!136959 (= res!828703 (or ((_ is Nil!27371) (removeStrictlySorted!126 l!644 key2!15)) ((_ is Nil!27371) (t!40829 (removeStrictlySorted!126 l!644 key2!15)))))))

(assert (=> d!136959 (= (isStrictlySorted!736 (removeStrictlySorted!126 l!644 key2!15)) e!704574)))

(declare-fun b!1242844 () Bool)

(declare-fun e!704575 () Bool)

(assert (=> b!1242844 (= e!704574 e!704575)))

(declare-fun res!828704 () Bool)

(assert (=> b!1242844 (=> (not res!828704) (not e!704575))))

(assert (=> b!1242844 (= res!828704 (bvslt (_1!10139 (h!28588 (removeStrictlySorted!126 l!644 key2!15))) (_1!10139 (h!28588 (t!40829 (removeStrictlySorted!126 l!644 key2!15))))))))

(declare-fun b!1242845 () Bool)

(assert (=> b!1242845 (= e!704575 (isStrictlySorted!736 (t!40829 (removeStrictlySorted!126 l!644 key2!15))))))

(assert (= (and d!136959 (not res!828703)) b!1242844))

(assert (= (and b!1242844 res!828704) b!1242845))

(declare-fun m!1146225 () Bool)

(assert (=> b!1242845 m!1146225))

(assert (=> b!1242806 d!136959))

(declare-fun b!1242871 () Bool)

(declare-fun e!704593 () List!27374)

(assert (=> b!1242871 (= e!704593 Nil!27371)))

(declare-fun b!1242873 () Bool)

(declare-fun e!704591 () List!27374)

(assert (=> b!1242873 (= e!704591 (t!40829 l!644))))

(declare-fun d!136963 () Bool)

(declare-fun e!704592 () Bool)

(assert (=> d!136963 e!704592))

(declare-fun res!828710 () Bool)

(assert (=> d!136963 (=> (not res!828710) (not e!704592))))

(declare-fun lt!562634 () List!27374)

(assert (=> d!136963 (= res!828710 (isStrictlySorted!736 lt!562634))))

(assert (=> d!136963 (= lt!562634 e!704591)))

(declare-fun c!121864 () Bool)

(assert (=> d!136963 (= c!121864 (and ((_ is Cons!27370) l!644) (= (_1!10139 (h!28588 l!644)) key2!15)))))

(assert (=> d!136963 (isStrictlySorted!736 l!644)))

(assert (=> d!136963 (= (removeStrictlySorted!126 l!644 key2!15) lt!562634)))

(declare-fun b!1242872 () Bool)

(declare-fun $colon$colon!621 (List!27374 tuple2!20256) List!27374)

(assert (=> b!1242872 (= e!704593 ($colon$colon!621 (removeStrictlySorted!126 (t!40829 l!644) key2!15) (h!28588 l!644)))))

(declare-fun b!1242874 () Bool)

(assert (=> b!1242874 (= e!704591 e!704593)))

(declare-fun c!121865 () Bool)

(assert (=> b!1242874 (= c!121865 (and ((_ is Cons!27370) l!644) (not (= (_1!10139 (h!28588 l!644)) key2!15))))))

(declare-fun b!1242875 () Bool)

(declare-fun containsKey!608 (List!27374 (_ BitVec 64)) Bool)

(assert (=> b!1242875 (= e!704592 (not (containsKey!608 lt!562634 key2!15)))))

(assert (= (and d!136963 c!121864) b!1242873))

(assert (= (and d!136963 (not c!121864)) b!1242874))

(assert (= (and b!1242874 c!121865) b!1242872))

(assert (= (and b!1242874 (not c!121865)) b!1242871))

(assert (= (and d!136963 res!828710) b!1242875))

(declare-fun m!1146229 () Bool)

(assert (=> d!136963 m!1146229))

(assert (=> d!136963 m!1146203))

(declare-fun m!1146233 () Bool)

(assert (=> b!1242872 m!1146233))

(assert (=> b!1242872 m!1146233))

(declare-fun m!1146237 () Bool)

(assert (=> b!1242872 m!1146237))

(declare-fun m!1146241 () Bool)

(assert (=> b!1242875 m!1146241))

(assert (=> b!1242806 d!136963))

(declare-fun b!1242886 () Bool)

(declare-fun e!704600 () Bool)

(declare-fun tp!92647 () Bool)

(assert (=> b!1242886 (= e!704600 (and tp_is_empty!31243 tp!92647))))

(assert (=> b!1242807 (= tp!92636 e!704600)))

(assert (= (and b!1242807 ((_ is Cons!27370) (t!40829 l!644))) b!1242886))

(check-sat (not b!1242875) (not b!1242886) (not b!1242845) (not d!136963) tp_is_empty!31243 (not b!1242872) (not b!1242841))
(check-sat)
