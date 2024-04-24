; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138492 () Bool)

(assert start!138492)

(declare-fun b!1586851 () Bool)

(declare-fun res!1083090 () Bool)

(declare-fun e!885994 () Bool)

(assert (=> b!1586851 (=> (not res!1083090) (not e!885994))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2918 0))(
  ( (B!2919 (val!19821 Int)) )
))
(declare-datatypes ((tuple2!25870 0))(
  ( (tuple2!25871 (_1!12946 (_ BitVec 64)) (_2!12946 B!2918)) )
))
(declare-datatypes ((List!36973 0))(
  ( (Nil!36970) (Cons!36969 (h!38530 tuple2!25870) (t!51879 List!36973)) )
))
(declare-fun l!1251 () List!36973)

(get-info :version)

(assert (=> b!1586851 (= res!1083090 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36969) l!1251)))))

(declare-fun res!1083088 () Bool)

(assert (=> start!138492 (=> (not res!1083088) (not e!885994))))

(declare-fun isStrictlySorted!1154 (List!36973) Bool)

(assert (=> start!138492 (= res!1083088 (isStrictlySorted!1154 l!1251))))

(assert (=> start!138492 e!885994))

(declare-fun e!885993 () Bool)

(assert (=> start!138492 e!885993))

(assert (=> start!138492 true))

(declare-fun b!1586852 () Bool)

(declare-fun ListPrimitiveSize!220 (List!36973) Int)

(assert (=> b!1586852 (= e!885994 (>= (ListPrimitiveSize!220 (t!51879 l!1251)) (ListPrimitiveSize!220 l!1251)))))

(declare-fun b!1586853 () Bool)

(declare-fun tp_is_empty!39451 () Bool)

(declare-fun tp!115103 () Bool)

(assert (=> b!1586853 (= e!885993 (and tp_is_empty!39451 tp!115103))))

(declare-fun b!1586854 () Bool)

(declare-fun res!1083087 () Bool)

(assert (=> b!1586854 (=> (not res!1083087) (not e!885994))))

(declare-fun containsKey!1001 (List!36973 (_ BitVec 64)) Bool)

(assert (=> b!1586854 (= res!1083087 (not (containsKey!1001 l!1251 otherKey!56)))))

(declare-fun b!1586855 () Bool)

(declare-fun res!1083089 () Bool)

(assert (=> b!1586855 (=> (not res!1083089) (not e!885994))))

(assert (=> b!1586855 (= res!1083089 (not (containsKey!1001 (t!51879 l!1251) otherKey!56)))))

(declare-fun b!1586856 () Bool)

(declare-fun res!1083091 () Bool)

(assert (=> b!1586856 (=> (not res!1083091) (not e!885994))))

(assert (=> b!1586856 (= res!1083091 (isStrictlySorted!1154 (t!51879 l!1251)))))

(assert (= (and start!138492 res!1083088) b!1586854))

(assert (= (and b!1586854 res!1083087) b!1586851))

(assert (= (and b!1586851 res!1083090) b!1586856))

(assert (= (and b!1586856 res!1083091) b!1586855))

(assert (= (and b!1586855 res!1083089) b!1586852))

(assert (= (and start!138492 ((_ is Cons!36969) l!1251)) b!1586853))

(declare-fun m!1456011 () Bool)

(assert (=> b!1586856 m!1456011))

(declare-fun m!1456013 () Bool)

(assert (=> start!138492 m!1456013))

(declare-fun m!1456015 () Bool)

(assert (=> b!1586854 m!1456015))

(declare-fun m!1456017 () Bool)

(assert (=> b!1586852 m!1456017))

(declare-fun m!1456019 () Bool)

(assert (=> b!1586852 m!1456019))

(declare-fun m!1456021 () Bool)

(assert (=> b!1586855 m!1456021))

(check-sat (not b!1586853) (not b!1586855) (not start!138492) tp_is_empty!39451 (not b!1586852) (not b!1586856) (not b!1586854))
(check-sat)
(get-model)

(declare-fun d!168131 () Bool)

(declare-fun res!1083126 () Bool)

(declare-fun e!886011 () Bool)

(assert (=> d!168131 (=> res!1083126 e!886011)))

(assert (=> d!168131 (= res!1083126 (or ((_ is Nil!36970) (t!51879 l!1251)) ((_ is Nil!36970) (t!51879 (t!51879 l!1251)))))))

(assert (=> d!168131 (= (isStrictlySorted!1154 (t!51879 l!1251)) e!886011)))

(declare-fun b!1586897 () Bool)

(declare-fun e!886012 () Bool)

(assert (=> b!1586897 (= e!886011 e!886012)))

(declare-fun res!1083127 () Bool)

(assert (=> b!1586897 (=> (not res!1083127) (not e!886012))))

(assert (=> b!1586897 (= res!1083127 (bvslt (_1!12946 (h!38530 (t!51879 l!1251))) (_1!12946 (h!38530 (t!51879 (t!51879 l!1251))))))))

(declare-fun b!1586898 () Bool)

(assert (=> b!1586898 (= e!886012 (isStrictlySorted!1154 (t!51879 (t!51879 l!1251))))))

(assert (= (and d!168131 (not res!1083126)) b!1586897))

(assert (= (and b!1586897 res!1083127) b!1586898))

(declare-fun m!1456047 () Bool)

(assert (=> b!1586898 m!1456047))

(assert (=> b!1586856 d!168131))

(declare-fun d!168133 () Bool)

(declare-fun res!1083128 () Bool)

(declare-fun e!886013 () Bool)

(assert (=> d!168133 (=> res!1083128 e!886013)))

(assert (=> d!168133 (= res!1083128 (or ((_ is Nil!36970) l!1251) ((_ is Nil!36970) (t!51879 l!1251))))))

(assert (=> d!168133 (= (isStrictlySorted!1154 l!1251) e!886013)))

(declare-fun b!1586899 () Bool)

(declare-fun e!886014 () Bool)

(assert (=> b!1586899 (= e!886013 e!886014)))

(declare-fun res!1083129 () Bool)

(assert (=> b!1586899 (=> (not res!1083129) (not e!886014))))

(assert (=> b!1586899 (= res!1083129 (bvslt (_1!12946 (h!38530 l!1251)) (_1!12946 (h!38530 (t!51879 l!1251)))))))

(declare-fun b!1586900 () Bool)

(assert (=> b!1586900 (= e!886014 (isStrictlySorted!1154 (t!51879 l!1251)))))

(assert (= (and d!168133 (not res!1083128)) b!1586899))

(assert (= (and b!1586899 res!1083129) b!1586900))

(assert (=> b!1586900 m!1456011))

(assert (=> start!138492 d!168133))

(declare-fun d!168137 () Bool)

(declare-fun res!1083134 () Bool)

(declare-fun e!886021 () Bool)

(assert (=> d!168137 (=> res!1083134 e!886021)))

(assert (=> d!168137 (= res!1083134 (and ((_ is Cons!36969) (t!51879 l!1251)) (= (_1!12946 (h!38530 (t!51879 l!1251))) otherKey!56)))))

(assert (=> d!168137 (= (containsKey!1001 (t!51879 l!1251) otherKey!56) e!886021)))

(declare-fun b!1586909 () Bool)

(declare-fun e!886022 () Bool)

(assert (=> b!1586909 (= e!886021 e!886022)))

(declare-fun res!1083135 () Bool)

(assert (=> b!1586909 (=> (not res!1083135) (not e!886022))))

(assert (=> b!1586909 (= res!1083135 (and (or (not ((_ is Cons!36969) (t!51879 l!1251))) (bvsle (_1!12946 (h!38530 (t!51879 l!1251))) otherKey!56)) ((_ is Cons!36969) (t!51879 l!1251)) (bvslt (_1!12946 (h!38530 (t!51879 l!1251))) otherKey!56)))))

(declare-fun b!1586910 () Bool)

(assert (=> b!1586910 (= e!886022 (containsKey!1001 (t!51879 (t!51879 l!1251)) otherKey!56))))

(assert (= (and d!168137 (not res!1083134)) b!1586909))

(assert (= (and b!1586909 res!1083135) b!1586910))

(declare-fun m!1456049 () Bool)

(assert (=> b!1586910 m!1456049))

(assert (=> b!1586855 d!168137))

(declare-fun d!168141 () Bool)

(declare-fun res!1083136 () Bool)

(declare-fun e!886023 () Bool)

(assert (=> d!168141 (=> res!1083136 e!886023)))

(assert (=> d!168141 (= res!1083136 (and ((_ is Cons!36969) l!1251) (= (_1!12946 (h!38530 l!1251)) otherKey!56)))))

(assert (=> d!168141 (= (containsKey!1001 l!1251 otherKey!56) e!886023)))

(declare-fun b!1586911 () Bool)

(declare-fun e!886024 () Bool)

(assert (=> b!1586911 (= e!886023 e!886024)))

(declare-fun res!1083137 () Bool)

(assert (=> b!1586911 (=> (not res!1083137) (not e!886024))))

(assert (=> b!1586911 (= res!1083137 (and (or (not ((_ is Cons!36969) l!1251)) (bvsle (_1!12946 (h!38530 l!1251)) otherKey!56)) ((_ is Cons!36969) l!1251) (bvslt (_1!12946 (h!38530 l!1251)) otherKey!56)))))

(declare-fun b!1586912 () Bool)

(assert (=> b!1586912 (= e!886024 (containsKey!1001 (t!51879 l!1251) otherKey!56))))

(assert (= (and d!168141 (not res!1083136)) b!1586911))

(assert (= (and b!1586911 res!1083137) b!1586912))

(assert (=> b!1586912 m!1456021))

(assert (=> b!1586854 d!168141))

(declare-fun d!168143 () Bool)

(declare-fun lt!678160 () Int)

(assert (=> d!168143 (>= lt!678160 0)))

(declare-fun e!886033 () Int)

(assert (=> d!168143 (= lt!678160 e!886033)))

(declare-fun c!147655 () Bool)

(assert (=> d!168143 (= c!147655 ((_ is Nil!36970) (t!51879 l!1251)))))

(assert (=> d!168143 (= (ListPrimitiveSize!220 (t!51879 l!1251)) lt!678160)))

(declare-fun b!1586925 () Bool)

(assert (=> b!1586925 (= e!886033 0)))

(declare-fun b!1586926 () Bool)

(assert (=> b!1586926 (= e!886033 (+ 1 (ListPrimitiveSize!220 (t!51879 (t!51879 l!1251)))))))

(assert (= (and d!168143 c!147655) b!1586925))

(assert (= (and d!168143 (not c!147655)) b!1586926))

(declare-fun m!1456053 () Bool)

(assert (=> b!1586926 m!1456053))

(assert (=> b!1586852 d!168143))

(declare-fun d!168149 () Bool)

(declare-fun lt!678161 () Int)

(assert (=> d!168149 (>= lt!678161 0)))

(declare-fun e!886036 () Int)

(assert (=> d!168149 (= lt!678161 e!886036)))

(declare-fun c!147656 () Bool)

(assert (=> d!168149 (= c!147656 ((_ is Nil!36970) l!1251))))

(assert (=> d!168149 (= (ListPrimitiveSize!220 l!1251) lt!678161)))

(declare-fun b!1586929 () Bool)

(assert (=> b!1586929 (= e!886036 0)))

(declare-fun b!1586930 () Bool)

(assert (=> b!1586930 (= e!886036 (+ 1 (ListPrimitiveSize!220 (t!51879 l!1251))))))

(assert (= (and d!168149 c!147656) b!1586929))

(assert (= (and d!168149 (not c!147656)) b!1586930))

(assert (=> b!1586930 m!1456017))

(assert (=> b!1586852 d!168149))

(declare-fun b!1586939 () Bool)

(declare-fun e!886043 () Bool)

(declare-fun tp!115112 () Bool)

(assert (=> b!1586939 (= e!886043 (and tp_is_empty!39451 tp!115112))))

(assert (=> b!1586853 (= tp!115103 e!886043)))

(assert (= (and b!1586853 ((_ is Cons!36969) (t!51879 l!1251))) b!1586939))

(check-sat (not b!1586898) tp_is_empty!39451 (not b!1586930) (not b!1586926) (not b!1586939) (not b!1586900) (not b!1586912) (not b!1586910))
(check-sat)
