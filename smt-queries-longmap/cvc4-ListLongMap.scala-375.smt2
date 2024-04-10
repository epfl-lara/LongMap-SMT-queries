; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7112 () Bool)

(assert start!7112)

(declare-fun res!26735 () Bool)

(declare-fun e!29006 () Bool)

(assert (=> start!7112 (=> (not res!26735) (not e!29006))))

(declare-datatypes ((B!834 0))(
  ( (B!835 (val!1004 Int)) )
))
(declare-datatypes ((tuple2!1656 0))(
  ( (tuple2!1657 (_1!839 (_ BitVec 64)) (_2!839 B!834)) )
))
(declare-datatypes ((List!1222 0))(
  ( (Nil!1219) (Cons!1218 (h!1798 tuple2!1656) (t!4247 List!1222)) )
))
(declare-fun l!812 () List!1222)

(declare-fun isStrictlySorted!219 (List!1222) Bool)

(assert (=> start!7112 (= res!26735 (isStrictlySorted!219 l!812))))

(assert (=> start!7112 e!29006))

(declare-fun e!29005 () Bool)

(assert (=> start!7112 e!29005))

(assert (=> start!7112 true))

(declare-fun b!45571 () Bool)

(declare-fun res!26736 () Bool)

(assert (=> b!45571 (=> (not res!26736) (not e!29006))))

(assert (=> b!45571 (= res!26736 (isStrictlySorted!219 (t!4247 l!812)))))

(declare-fun b!45570 () Bool)

(declare-fun res!26734 () Bool)

(assert (=> b!45570 (=> (not res!26734) (not e!29006))))

(assert (=> b!45570 (= res!26734 (is-Cons!1218 l!812))))

(declare-fun b!45572 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!29 (List!1222 (_ BitVec 64)) List!1222)

(assert (=> b!45572 (= e!29006 (not (isStrictlySorted!219 (removeStrictlySorted!29 l!812 key1!43))))))

(declare-fun key2!27 () (_ BitVec 64))

(assert (=> b!45572 (= (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4247 l!812) key1!43) key2!27) (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4247 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1307 0))(
  ( (Unit!1308) )
))
(declare-fun lt!20179 () Unit!1307)

(declare-fun lemmaRemoveStrictlySortedCommutative!9 (List!1222 (_ BitVec 64) (_ BitVec 64)) Unit!1307)

(assert (=> b!45572 (= lt!20179 (lemmaRemoveStrictlySortedCommutative!9 (t!4247 l!812) key1!43 key2!27))))

(declare-fun b!45573 () Bool)

(declare-fun tp_is_empty!1931 () Bool)

(declare-fun tp!5990 () Bool)

(assert (=> b!45573 (= e!29005 (and tp_is_empty!1931 tp!5990))))

(assert (= (and start!7112 res!26735) b!45570))

(assert (= (and b!45570 res!26734) b!45571))

(assert (= (and b!45571 res!26736) b!45572))

(assert (= (and start!7112 (is-Cons!1218 l!812)) b!45573))

(declare-fun m!40125 () Bool)

(assert (=> start!7112 m!40125))

(declare-fun m!40127 () Bool)

(assert (=> b!45571 m!40127))

(declare-fun m!40129 () Bool)

(assert (=> b!45572 m!40129))

(declare-fun m!40131 () Bool)

(assert (=> b!45572 m!40131))

(declare-fun m!40133 () Bool)

(assert (=> b!45572 m!40133))

(assert (=> b!45572 m!40129))

(declare-fun m!40135 () Bool)

(assert (=> b!45572 m!40135))

(declare-fun m!40137 () Bool)

(assert (=> b!45572 m!40137))

(declare-fun m!40139 () Bool)

(assert (=> b!45572 m!40139))

(assert (=> b!45572 m!40135))

(assert (=> b!45572 m!40133))

(declare-fun m!40141 () Bool)

(assert (=> b!45572 m!40141))

(push 1)

(assert (not b!45572))

(assert (not b!45573))

(assert (not start!7112))

(assert tp_is_empty!1931)

(assert (not b!45571))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8881 () Bool)

(declare-fun res!26747 () Bool)

(declare-fun e!29017 () Bool)

(assert (=> d!8881 (=> res!26747 e!29017)))

(assert (=> d!8881 (= res!26747 (or (is-Nil!1219 l!812) (is-Nil!1219 (t!4247 l!812))))))

(assert (=> d!8881 (= (isStrictlySorted!219 l!812) e!29017)))

(declare-fun b!45584 () Bool)

(declare-fun e!29018 () Bool)

(assert (=> b!45584 (= e!29017 e!29018)))

(declare-fun res!26748 () Bool)

(assert (=> b!45584 (=> (not res!26748) (not e!29018))))

(assert (=> b!45584 (= res!26748 (bvslt (_1!839 (h!1798 l!812)) (_1!839 (h!1798 (t!4247 l!812)))))))

(declare-fun b!45585 () Bool)

(assert (=> b!45585 (= e!29018 (isStrictlySorted!219 (t!4247 l!812)))))

(assert (= (and d!8881 (not res!26747)) b!45584))

(assert (= (and b!45584 res!26748) b!45585))

(assert (=> b!45585 m!40127))

(assert (=> start!7112 d!8881))

(declare-fun b!45626 () Bool)

(declare-fun e!29043 () Bool)

(declare-fun lt!20191 () List!1222)

(declare-fun containsKey!80 (List!1222 (_ BitVec 64)) Bool)

(assert (=> b!45626 (= e!29043 (not (containsKey!80 lt!20191 key1!43)))))

(declare-fun b!45627 () Bool)

(declare-fun e!29045 () List!1222)

(declare-fun e!29044 () List!1222)

(assert (=> b!45627 (= e!29045 e!29044)))

(declare-fun c!6140 () Bool)

(assert (=> b!45627 (= c!6140 (and (is-Cons!1218 l!812) (not (= (_1!839 (h!1798 l!812)) key1!43))))))

(declare-fun b!45628 () Bool)

(assert (=> b!45628 (= e!29044 Nil!1219)))

(declare-fun b!45629 () Bool)

(assert (=> b!45629 (= e!29045 (t!4247 l!812))))

(declare-fun d!8885 () Bool)

(assert (=> d!8885 e!29043))

(declare-fun res!26757 () Bool)

(assert (=> d!8885 (=> (not res!26757) (not e!29043))))

(assert (=> d!8885 (= res!26757 (isStrictlySorted!219 lt!20191))))

(assert (=> d!8885 (= lt!20191 e!29045)))

(declare-fun c!6141 () Bool)

(assert (=> d!8885 (= c!6141 (and (is-Cons!1218 l!812) (= (_1!839 (h!1798 l!812)) key1!43)))))

(assert (=> d!8885 (isStrictlySorted!219 l!812)))

(assert (=> d!8885 (= (removeStrictlySorted!29 l!812 key1!43) lt!20191)))

(declare-fun b!45630 () Bool)

(declare-fun $colon$colon!34 (List!1222 tuple2!1656) List!1222)

(assert (=> b!45630 (= e!29044 ($colon$colon!34 (removeStrictlySorted!29 (t!4247 l!812) key1!43) (h!1798 l!812)))))

(assert (= (and d!8885 c!6141) b!45629))

(assert (= (and d!8885 (not c!6141)) b!45627))

(assert (= (and b!45627 c!6140) b!45630))

(assert (= (and b!45627 (not c!6140)) b!45628))

(assert (= (and d!8885 res!26757) b!45626))

(declare-fun m!40159 () Bool)

(assert (=> b!45626 m!40159))

(declare-fun m!40161 () Bool)

(assert (=> d!8885 m!40161))

(assert (=> d!8885 m!40125))

(assert (=> b!45630 m!40129))

(assert (=> b!45630 m!40129))

(declare-fun m!40163 () Bool)

(assert (=> b!45630 m!40163))

(assert (=> b!45572 d!8885))

(declare-fun b!45641 () Bool)

(declare-fun e!29052 () Bool)

(declare-fun lt!20194 () List!1222)

(assert (=> b!45641 (= e!29052 (not (containsKey!80 lt!20194 key2!27)))))

(declare-fun b!45642 () Bool)

(declare-fun e!29054 () List!1222)

(declare-fun e!29053 () List!1222)

(assert (=> b!45642 (= e!29054 e!29053)))

(declare-fun c!6146 () Bool)

(assert (=> b!45642 (= c!6146 (and (is-Cons!1218 (t!4247 l!812)) (not (= (_1!839 (h!1798 (t!4247 l!812))) key2!27))))))

(declare-fun b!45643 () Bool)

(assert (=> b!45643 (= e!29053 Nil!1219)))

(declare-fun b!45644 () Bool)

(assert (=> b!45644 (= e!29054 (t!4247 (t!4247 l!812)))))

(declare-fun d!8893 () Bool)

(assert (=> d!8893 e!29052))

(declare-fun res!26760 () Bool)

(assert (=> d!8893 (=> (not res!26760) (not e!29052))))

(assert (=> d!8893 (= res!26760 (isStrictlySorted!219 lt!20194))))

(assert (=> d!8893 (= lt!20194 e!29054)))

(declare-fun c!6147 () Bool)

(assert (=> d!8893 (= c!6147 (and (is-Cons!1218 (t!4247 l!812)) (= (_1!839 (h!1798 (t!4247 l!812))) key2!27)))))

(assert (=> d!8893 (isStrictlySorted!219 (t!4247 l!812))))

(assert (=> d!8893 (= (removeStrictlySorted!29 (t!4247 l!812) key2!27) lt!20194)))

(declare-fun b!45645 () Bool)

(assert (=> b!45645 (= e!29053 ($colon$colon!34 (removeStrictlySorted!29 (t!4247 (t!4247 l!812)) key2!27) (h!1798 (t!4247 l!812))))))

(assert (= (and d!8893 c!6147) b!45644))

(assert (= (and d!8893 (not c!6147)) b!45642))

(assert (= (and b!45642 c!6146) b!45645))

(assert (= (and b!45642 (not c!6146)) b!45643))

(assert (= (and d!8893 res!26760) b!45641))

(declare-fun m!40179 () Bool)

(assert (=> b!45641 m!40179))

(declare-fun m!40182 () Bool)

(assert (=> d!8893 m!40182))

(assert (=> d!8893 m!40127))

(declare-fun m!40185 () Bool)

(assert (=> b!45645 m!40185))

(assert (=> b!45645 m!40185))

(declare-fun m!40187 () Bool)

(assert (=> b!45645 m!40187))

(assert (=> b!45572 d!8893))

(declare-fun d!8899 () Bool)

(assert (=> d!8899 (= (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4247 l!812) key1!43) key2!27) (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4247 l!812) key2!27) key1!43))))

(declare-fun lt!20200 () Unit!1307)

(declare-fun choose!273 (List!1222 (_ BitVec 64) (_ BitVec 64)) Unit!1307)

(assert (=> d!8899 (= lt!20200 (choose!273 (t!4247 l!812) key1!43 key2!27))))

(assert (=> d!8899 (isStrictlySorted!219 (t!4247 l!812))))

(assert (=> d!8899 (= (lemmaRemoveStrictlySortedCommutative!9 (t!4247 l!812) key1!43 key2!27) lt!20200)))

(declare-fun bs!2147 () Bool)

(assert (= bs!2147 d!8899))

(assert (=> bs!2147 m!40135))

(assert (=> bs!2147 m!40129))

(assert (=> bs!2147 m!40129))

(assert (=> bs!2147 m!40131))

(assert (=> bs!2147 m!40135))

(assert (=> bs!2147 m!40137))

(assert (=> bs!2147 m!40127))

(declare-fun m!40215 () Bool)

(assert (=> bs!2147 m!40215))

(assert (=> b!45572 d!8899))

(declare-fun b!45665 () Bool)

(declare-fun e!29068 () Bool)

(declare-fun lt!20203 () List!1222)

(assert (=> b!45665 (= e!29068 (not (containsKey!80 lt!20203 key2!27)))))

(declare-fun b!45666 () Bool)

(declare-fun e!29070 () List!1222)

(declare-fun e!29069 () List!1222)

(assert (=> b!45666 (= e!29070 e!29069)))

(declare-fun c!6154 () Bool)

(assert (=> b!45666 (= c!6154 (and (is-Cons!1218 (removeStrictlySorted!29 (t!4247 l!812) key1!43)) (not (= (_1!839 (h!1798 (removeStrictlySorted!29 (t!4247 l!812) key1!43))) key2!27))))))

(declare-fun b!45667 () Bool)

(assert (=> b!45667 (= e!29069 Nil!1219)))

(declare-fun b!45668 () Bool)

(assert (=> b!45668 (= e!29070 (t!4247 (removeStrictlySorted!29 (t!4247 l!812) key1!43)))))

(declare-fun d!8907 () Bool)

(assert (=> d!8907 e!29068))

(declare-fun res!26768 () Bool)

(assert (=> d!8907 (=> (not res!26768) (not e!29068))))

(assert (=> d!8907 (= res!26768 (isStrictlySorted!219 lt!20203))))

(assert (=> d!8907 (= lt!20203 e!29070)))

(declare-fun c!6155 () Bool)

(assert (=> d!8907 (= c!6155 (and (is-Cons!1218 (removeStrictlySorted!29 (t!4247 l!812) key1!43)) (= (_1!839 (h!1798 (removeStrictlySorted!29 (t!4247 l!812) key1!43))) key2!27)))))

(assert (=> d!8907 (isStrictlySorted!219 (removeStrictlySorted!29 (t!4247 l!812) key1!43))))

(assert (=> d!8907 (= (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4247 l!812) key1!43) key2!27) lt!20203)))

(declare-fun b!45669 () Bool)

(assert (=> b!45669 (= e!29069 ($colon$colon!34 (removeStrictlySorted!29 (t!4247 (removeStrictlySorted!29 (t!4247 l!812) key1!43)) key2!27) (h!1798 (removeStrictlySorted!29 (t!4247 l!812) key1!43))))))

(assert (= (and d!8907 c!6155) b!45668))

(assert (= (and d!8907 (not c!6155)) b!45666))

(assert (= (and b!45666 c!6154) b!45669))

(assert (= (and b!45666 (not c!6154)) b!45667))

(assert (= (and d!8907 res!26768) b!45665))

(declare-fun m!40217 () Bool)

(assert (=> b!45665 m!40217))

(declare-fun m!40219 () Bool)

(assert (=> d!8907 m!40219))

(assert (=> d!8907 m!40129))

(declare-fun m!40223 () Bool)

(assert (=> d!8907 m!40223))

(declare-fun m!40225 () Bool)

(assert (=> b!45669 m!40225))

(assert (=> b!45669 m!40225))

(declare-fun m!40227 () Bool)

(assert (=> b!45669 m!40227))

(assert (=> b!45572 d!8907))

(declare-fun b!45674 () Bool)

(declare-fun e!29075 () Bool)

(declare-fun lt!20204 () List!1222)

(assert (=> b!45674 (= e!29075 (not (containsKey!80 lt!20204 key1!43)))))

(declare-fun b!45675 () Bool)

(declare-fun e!29077 () List!1222)

(declare-fun e!29076 () List!1222)

(assert (=> b!45675 (= e!29077 e!29076)))

(declare-fun c!6156 () Bool)

(assert (=> b!45675 (= c!6156 (and (is-Cons!1218 (removeStrictlySorted!29 (t!4247 l!812) key2!27)) (not (= (_1!839 (h!1798 (removeStrictlySorted!29 (t!4247 l!812) key2!27))) key1!43))))))

(declare-fun b!45676 () Bool)

(assert (=> b!45676 (= e!29076 Nil!1219)))

(declare-fun b!45677 () Bool)

(assert (=> b!45677 (= e!29077 (t!4247 (removeStrictlySorted!29 (t!4247 l!812) key2!27)))))

(declare-fun d!8911 () Bool)

(assert (=> d!8911 e!29075))

(declare-fun res!26773 () Bool)

(assert (=> d!8911 (=> (not res!26773) (not e!29075))))

(assert (=> d!8911 (= res!26773 (isStrictlySorted!219 lt!20204))))

(assert (=> d!8911 (= lt!20204 e!29077)))

(declare-fun c!6157 () Bool)

(assert (=> d!8911 (= c!6157 (and (is-Cons!1218 (removeStrictlySorted!29 (t!4247 l!812) key2!27)) (= (_1!839 (h!1798 (removeStrictlySorted!29 (t!4247 l!812) key2!27))) key1!43)))))

(assert (=> d!8911 (isStrictlySorted!219 (removeStrictlySorted!29 (t!4247 l!812) key2!27))))

