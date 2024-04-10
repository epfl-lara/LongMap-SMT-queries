; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106480 () Bool)

(assert start!106480)

(declare-fun b!1265819 () Bool)

(declare-fun res!842811 () Bool)

(declare-fun e!720914 () Bool)

(assert (=> b!1265819 (=> (not res!842811) (not e!720914))))

(declare-datatypes ((B!1988 0))(
  ( (B!1989 (val!16329 Int)) )
))
(declare-datatypes ((tuple2!21176 0))(
  ( (tuple2!21177 (_1!10599 (_ BitVec 64)) (_2!10599 B!1988)) )
))
(declare-datatypes ((List!28321 0))(
  ( (Nil!28318) (Cons!28317 (h!29526 tuple2!21176) (t!41842 List!28321)) )
))
(declare-fun l!706 () List!28321)

(assert (=> b!1265819 (= res!842811 (is-Cons!28317 l!706))))

(declare-fun b!1265820 () Bool)

(declare-fun res!842809 () Bool)

(assert (=> b!1265820 (=> (not res!842809) (not e!720914))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!655 (List!28321 (_ BitVec 64)) Bool)

(assert (=> b!1265820 (= res!842809 (not (containsKey!655 l!706 key1!31)))))

(declare-fun b!1265821 () Bool)

(declare-fun e!720913 () Bool)

(declare-fun tp_is_empty!32521 () Bool)

(declare-fun tp!96392 () Bool)

(assert (=> b!1265821 (= e!720913 (and tp_is_empty!32521 tp!96392))))

(declare-fun b!1265822 () Bool)

(declare-fun res!842808 () Bool)

(assert (=> b!1265822 (=> (not res!842808) (not e!720914))))

(declare-fun isStrictlySorted!796 (List!28321) Bool)

(assert (=> b!1265822 (= res!842808 (isStrictlySorted!796 (t!41842 l!706)))))

(declare-fun b!1265823 () Bool)

(declare-fun res!842812 () Bool)

(assert (=> b!1265823 (=> (not res!842812) (not e!720914))))

(assert (=> b!1265823 (= res!842812 (not (containsKey!655 (t!41842 l!706) key1!31)))))

(declare-fun res!842810 () Bool)

(assert (=> start!106480 (=> (not res!842810) (not e!720914))))

(assert (=> start!106480 (= res!842810 (isStrictlySorted!796 l!706))))

(assert (=> start!106480 e!720914))

(assert (=> start!106480 e!720913))

(assert (=> start!106480 true))

(declare-fun b!1265824 () Bool)

(declare-fun ListPrimitiveSize!154 (List!28321) Int)

(assert (=> b!1265824 (= e!720914 (>= (ListPrimitiveSize!154 (t!41842 l!706)) (ListPrimitiveSize!154 l!706)))))

(assert (= (and start!106480 res!842810) b!1265820))

(assert (= (and b!1265820 res!842809) b!1265819))

(assert (= (and b!1265819 res!842811) b!1265822))

(assert (= (and b!1265822 res!842808) b!1265823))

(assert (= (and b!1265823 res!842812) b!1265824))

(assert (= (and start!106480 (is-Cons!28317 l!706)) b!1265821))

(declare-fun m!1165749 () Bool)

(assert (=> b!1265820 m!1165749))

(declare-fun m!1165751 () Bool)

(assert (=> start!106480 m!1165751))

(declare-fun m!1165753 () Bool)

(assert (=> b!1265823 m!1165753))

(declare-fun m!1165755 () Bool)

(assert (=> b!1265824 m!1165755))

(declare-fun m!1165757 () Bool)

(assert (=> b!1265824 m!1165757))

(declare-fun m!1165759 () Bool)

(assert (=> b!1265822 m!1165759))

(push 1)

(assert (not b!1265821))

(assert (not start!106480))

(assert (not b!1265824))

(assert (not b!1265823))

(assert (not b!1265820))

(assert (not b!1265822))

(assert tp_is_empty!32521)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138995 () Bool)

(declare-fun res!842849 () Bool)

(declare-fun e!720933 () Bool)

(assert (=> d!138995 (=> res!842849 e!720933)))

(assert (=> d!138995 (= res!842849 (or (is-Nil!28318 (t!41842 l!706)) (is-Nil!28318 (t!41842 (t!41842 l!706)))))))

(assert (=> d!138995 (= (isStrictlySorted!796 (t!41842 l!706)) e!720933)))

(declare-fun b!1265865 () Bool)

(declare-fun e!720934 () Bool)

(assert (=> b!1265865 (= e!720933 e!720934)))

(declare-fun res!842850 () Bool)

(assert (=> b!1265865 (=> (not res!842850) (not e!720934))))

(assert (=> b!1265865 (= res!842850 (bvslt (_1!10599 (h!29526 (t!41842 l!706))) (_1!10599 (h!29526 (t!41842 (t!41842 l!706))))))))

(declare-fun b!1265866 () Bool)

(assert (=> b!1265866 (= e!720934 (isStrictlySorted!796 (t!41842 (t!41842 l!706))))))

(assert (= (and d!138995 (not res!842849)) b!1265865))

(assert (= (and b!1265865 res!842850) b!1265866))

(declare-fun m!1165785 () Bool)

(assert (=> b!1265866 m!1165785))

(assert (=> b!1265822 d!138995))

(declare-fun d!138999 () Bool)

(declare-fun res!842853 () Bool)

(declare-fun e!720937 () Bool)

(assert (=> d!138999 (=> res!842853 e!720937)))

(assert (=> d!138999 (= res!842853 (or (is-Nil!28318 l!706) (is-Nil!28318 (t!41842 l!706))))))

(assert (=> d!138999 (= (isStrictlySorted!796 l!706) e!720937)))

(declare-fun b!1265869 () Bool)

(declare-fun e!720938 () Bool)

(assert (=> b!1265869 (= e!720937 e!720938)))

(declare-fun res!842854 () Bool)

(assert (=> b!1265869 (=> (not res!842854) (not e!720938))))

(assert (=> b!1265869 (= res!842854 (bvslt (_1!10599 (h!29526 l!706)) (_1!10599 (h!29526 (t!41842 l!706)))))))

(declare-fun b!1265870 () Bool)

(assert (=> b!1265870 (= e!720938 (isStrictlySorted!796 (t!41842 l!706)))))

(assert (= (and d!138999 (not res!842853)) b!1265869))

(assert (= (and b!1265869 res!842854) b!1265870))

(assert (=> b!1265870 m!1165759))

(assert (=> start!106480 d!138999))

(declare-fun d!139001 () Bool)

(declare-fun res!842867 () Bool)

(declare-fun e!720951 () Bool)

(assert (=> d!139001 (=> res!842867 e!720951)))

(assert (=> d!139001 (= res!842867 (and (is-Cons!28317 (t!41842 l!706)) (= (_1!10599 (h!29526 (t!41842 l!706))) key1!31)))))

(assert (=> d!139001 (= (containsKey!655 (t!41842 l!706) key1!31) e!720951)))

(declare-fun b!1265885 () Bool)

(declare-fun e!720952 () Bool)

(assert (=> b!1265885 (= e!720951 e!720952)))

(declare-fun res!842868 () Bool)

(assert (=> b!1265885 (=> (not res!842868) (not e!720952))))

(assert (=> b!1265885 (= res!842868 (and (or (not (is-Cons!28317 (t!41842 l!706))) (bvsle (_1!10599 (h!29526 (t!41842 l!706))) key1!31)) (is-Cons!28317 (t!41842 l!706)) (bvslt (_1!10599 (h!29526 (t!41842 l!706))) key1!31)))))

(declare-fun b!1265886 () Bool)

(assert (=> b!1265886 (= e!720952 (containsKey!655 (t!41842 (t!41842 l!706)) key1!31))))

(assert (= (and d!139001 (not res!842867)) b!1265885))

(assert (= (and b!1265885 res!842868) b!1265886))

(declare-fun m!1165789 () Bool)

(assert (=> b!1265886 m!1165789))

(assert (=> b!1265823 d!139001))

(declare-fun d!139007 () Bool)

(declare-fun lt!574062 () Int)

(assert (=> d!139007 (>= lt!574062 0)))

(declare-fun e!720963 () Int)

(assert (=> d!139007 (= lt!574062 e!720963)))

(declare-fun c!123331 () Bool)

(assert (=> d!139007 (= c!123331 (is-Nil!28318 (t!41842 l!706)))))

(assert (=> d!139007 (= (ListPrimitiveSize!154 (t!41842 l!706)) lt!574062)))

(declare-fun b!1265899 () Bool)

(assert (=> b!1265899 (= e!720963 0)))

(declare-fun b!1265900 () Bool)

(assert (=> b!1265900 (= e!720963 (+ 1 (ListPrimitiveSize!154 (t!41842 (t!41842 l!706)))))))

(assert (= (and d!139007 c!123331) b!1265899))

(assert (= (and d!139007 (not c!123331)) b!1265900))

(declare-fun m!1165791 () Bool)

(assert (=> b!1265900 m!1165791))

(assert (=> b!1265824 d!139007))

(declare-fun d!139009 () Bool)

(declare-fun lt!574063 () Int)

(assert (=> d!139009 (>= lt!574063 0)))

(declare-fun e!720964 () Int)

(assert (=> d!139009 (= lt!574063 e!720964)))

(declare-fun c!123332 () Bool)

(assert (=> d!139009 (= c!123332 (is-Nil!28318 l!706))))

(assert (=> d!139009 (= (ListPrimitiveSize!154 l!706) lt!574063)))

(declare-fun b!1265901 () Bool)

(assert (=> b!1265901 (= e!720964 0)))

(declare-fun b!1265902 () Bool)

(assert (=> b!1265902 (= e!720964 (+ 1 (ListPrimitiveSize!154 (t!41842 l!706))))))

(assert (= (and d!139009 c!123332) b!1265901))

(assert (= (and d!139009 (not c!123332)) b!1265902))

(assert (=> b!1265902 m!1165755))

(assert (=> b!1265824 d!139009))

(declare-fun d!139011 () Bool)

(declare-fun res!842879 () Bool)

(declare-fun e!720967 () Bool)

(assert (=> d!139011 (=> res!842879 e!720967)))

(assert (=> d!139011 (= res!842879 (and (is-Cons!28317 l!706) (= (_1!10599 (h!29526 l!706)) key1!31)))))

(assert (=> d!139011 (= (containsKey!655 l!706 key1!31) e!720967)))

(declare-fun b!1265905 () Bool)

(declare-fun e!720968 () Bool)

(assert (=> b!1265905 (= e!720967 e!720968)))

(declare-fun res!842880 () Bool)

(assert (=> b!1265905 (=> (not res!842880) (not e!720968))))

(assert (=> b!1265905 (= res!842880 (and (or (not (is-Cons!28317 l!706)) (bvsle (_1!10599 (h!29526 l!706)) key1!31)) (is-Cons!28317 l!706) (bvslt (_1!10599 (h!29526 l!706)) key1!31)))))

(declare-fun b!1265906 () Bool)

(assert (=> b!1265906 (= e!720968 (containsKey!655 (t!41842 l!706) key1!31))))

(assert (= (and d!139011 (not res!842879)) b!1265905))

(assert (= (and b!1265905 res!842880) b!1265906))

(assert (=> b!1265906 m!1165753))

(assert (=> b!1265820 d!139011))

(declare-fun b!1265915 () Bool)

(declare-fun e!720975 () Bool)

(declare-fun tp!96401 () Bool)

(assert (=> b!1265915 (= e!720975 (and tp_is_empty!32521 tp!96401))))

(assert (=> b!1265821 (= tp!96392 e!720975)))

(assert (= (and b!1265821 (is-Cons!28317 (t!41842 l!706))) b!1265915))

(push 1)

(assert (not b!1265915))

(assert (not b!1265886))

(assert (not b!1265906))

(assert tp_is_empty!32521)

(assert (not b!1265866))

(assert (not b!1265900))

(assert (not b!1265870))

(assert (not b!1265902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

