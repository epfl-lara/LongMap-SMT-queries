; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7114 () Bool)

(assert start!7114)

(declare-fun b!45490 () Bool)

(declare-fun res!26692 () Bool)

(declare-fun e!28956 () Bool)

(assert (=> b!45490 (=> (not res!26692) (not e!28956))))

(declare-datatypes ((B!830 0))(
  ( (B!831 (val!1002 Int)) )
))
(declare-datatypes ((tuple2!1634 0))(
  ( (tuple2!1635 (_1!828 (_ BitVec 64)) (_2!828 B!830)) )
))
(declare-datatypes ((List!1206 0))(
  ( (Nil!1203) (Cons!1202 (h!1782 tuple2!1634) (t!4231 List!1206)) )
))
(declare-fun l!812 () List!1206)

(declare-fun isStrictlySorted!205 (List!1206) Bool)

(assert (=> b!45490 (= res!26692 (isStrictlySorted!205 (t!4231 l!812)))))

(declare-fun b!45491 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!26 (List!1206 (_ BitVec 64)) List!1206)

(assert (=> b!45491 (= e!28956 (not (isStrictlySorted!205 (removeStrictlySorted!26 l!812 key1!43))))))

(declare-fun key2!27 () (_ BitVec 64))

(assert (=> b!45491 (= (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4231 l!812) key1!43) key2!27) (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4231 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1314 0))(
  ( (Unit!1315) )
))
(declare-fun lt!20130 () Unit!1314)

(declare-fun lemmaRemoveStrictlySortedCommutative!7 (List!1206 (_ BitVec 64) (_ BitVec 64)) Unit!1314)

(assert (=> b!45491 (= lt!20130 (lemmaRemoveStrictlySortedCommutative!7 (t!4231 l!812) key1!43 key2!27))))

(declare-fun b!45492 () Bool)

(declare-fun e!28957 () Bool)

(declare-fun tp_is_empty!1927 () Bool)

(declare-fun tp!5984 () Bool)

(assert (=> b!45492 (= e!28957 (and tp_is_empty!1927 tp!5984))))

(declare-fun b!45489 () Bool)

(declare-fun res!26693 () Bool)

(assert (=> b!45489 (=> (not res!26693) (not e!28956))))

(get-info :version)

(assert (=> b!45489 (= res!26693 ((_ is Cons!1202) l!812))))

(declare-fun res!26691 () Bool)

(assert (=> start!7114 (=> (not res!26691) (not e!28956))))

(assert (=> start!7114 (= res!26691 (isStrictlySorted!205 l!812))))

(assert (=> start!7114 e!28956))

(assert (=> start!7114 e!28957))

(assert (=> start!7114 true))

(assert (= (and start!7114 res!26691) b!45489))

(assert (= (and b!45489 res!26693) b!45490))

(assert (= (and b!45490 res!26692) b!45491))

(assert (= (and start!7114 ((_ is Cons!1202) l!812)) b!45492))

(declare-fun m!39965 () Bool)

(assert (=> b!45490 m!39965))

(declare-fun m!39967 () Bool)

(assert (=> b!45491 m!39967))

(declare-fun m!39969 () Bool)

(assert (=> b!45491 m!39969))

(declare-fun m!39971 () Bool)

(assert (=> b!45491 m!39971))

(assert (=> b!45491 m!39967))

(declare-fun m!39973 () Bool)

(assert (=> b!45491 m!39973))

(declare-fun m!39975 () Bool)

(assert (=> b!45491 m!39975))

(declare-fun m!39977 () Bool)

(assert (=> b!45491 m!39977))

(assert (=> b!45491 m!39973))

(assert (=> b!45491 m!39971))

(declare-fun m!39979 () Bool)

(assert (=> b!45491 m!39979))

(declare-fun m!39981 () Bool)

(assert (=> start!7114 m!39981))

(check-sat (not start!7114) (not b!45490) (not b!45491) tp_is_empty!1927 (not b!45492))
(check-sat)
(get-model)

(declare-fun d!8865 () Bool)

(declare-fun res!26716 () Bool)

(declare-fun e!28974 () Bool)

(assert (=> d!8865 (=> res!26716 e!28974)))

(assert (=> d!8865 (= res!26716 (or ((_ is Nil!1203) (t!4231 l!812)) ((_ is Nil!1203) (t!4231 (t!4231 l!812)))))))

(assert (=> d!8865 (= (isStrictlySorted!205 (t!4231 l!812)) e!28974)))

(declare-fun b!45521 () Bool)

(declare-fun e!28975 () Bool)

(assert (=> b!45521 (= e!28974 e!28975)))

(declare-fun res!26717 () Bool)

(assert (=> b!45521 (=> (not res!26717) (not e!28975))))

(assert (=> b!45521 (= res!26717 (bvslt (_1!828 (h!1782 (t!4231 l!812))) (_1!828 (h!1782 (t!4231 (t!4231 l!812))))))))

(declare-fun b!45522 () Bool)

(assert (=> b!45522 (= e!28975 (isStrictlySorted!205 (t!4231 (t!4231 l!812))))))

(assert (= (and d!8865 (not res!26716)) b!45521))

(assert (= (and b!45521 res!26717) b!45522))

(declare-fun m!40019 () Bool)

(assert (=> b!45522 m!40019))

(assert (=> b!45490 d!8865))

(declare-fun d!8869 () Bool)

(declare-fun res!26722 () Bool)

(declare-fun e!28980 () Bool)

(assert (=> d!8869 (=> res!26722 e!28980)))

(assert (=> d!8869 (= res!26722 (or ((_ is Nil!1203) l!812) ((_ is Nil!1203) (t!4231 l!812))))))

(assert (=> d!8869 (= (isStrictlySorted!205 l!812) e!28980)))

(declare-fun b!45527 () Bool)

(declare-fun e!28981 () Bool)

(assert (=> b!45527 (= e!28980 e!28981)))

(declare-fun res!26723 () Bool)

(assert (=> b!45527 (=> (not res!26723) (not e!28981))))

(assert (=> b!45527 (= res!26723 (bvslt (_1!828 (h!1782 l!812)) (_1!828 (h!1782 (t!4231 l!812)))))))

(declare-fun b!45528 () Bool)

(assert (=> b!45528 (= e!28981 (isStrictlySorted!205 (t!4231 l!812)))))

(assert (= (and d!8869 (not res!26722)) b!45527))

(assert (= (and b!45527 res!26723) b!45528))

(assert (=> b!45528 m!39965))

(assert (=> start!7114 d!8869))

(declare-fun b!45553 () Bool)

(declare-fun e!28998 () Bool)

(declare-fun lt!20141 () List!1206)

(declare-fun containsKey!78 (List!1206 (_ BitVec 64)) Bool)

(assert (=> b!45553 (= e!28998 (not (containsKey!78 lt!20141 key1!43)))))

(declare-fun d!8871 () Bool)

(assert (=> d!8871 e!28998))

(declare-fun res!26732 () Bool)

(assert (=> d!8871 (=> (not res!26732) (not e!28998))))

(assert (=> d!8871 (= res!26732 (isStrictlySorted!205 lt!20141))))

(declare-fun e!29000 () List!1206)

(assert (=> d!8871 (= lt!20141 e!29000)))

(declare-fun c!6117 () Bool)

(assert (=> d!8871 (= c!6117 (and ((_ is Cons!1202) l!812) (= (_1!828 (h!1782 l!812)) key1!43)))))

(assert (=> d!8871 (isStrictlySorted!205 l!812)))

(assert (=> d!8871 (= (removeStrictlySorted!26 l!812 key1!43) lt!20141)))

(declare-fun b!45554 () Bool)

(declare-fun e!28999 () List!1206)

(assert (=> b!45554 (= e!28999 Nil!1203)))

(declare-fun b!45555 () Bool)

(declare-fun $colon$colon!31 (List!1206 tuple2!1634) List!1206)

(assert (=> b!45555 (= e!28999 ($colon$colon!31 (removeStrictlySorted!26 (t!4231 l!812) key1!43) (h!1782 l!812)))))

(declare-fun b!45556 () Bool)

(assert (=> b!45556 (= e!29000 e!28999)))

(declare-fun c!6116 () Bool)

(assert (=> b!45556 (= c!6116 (and ((_ is Cons!1202) l!812) (not (= (_1!828 (h!1782 l!812)) key1!43))))))

(declare-fun b!45557 () Bool)

(assert (=> b!45557 (= e!29000 (t!4231 l!812))))

(assert (= (and d!8871 c!6117) b!45557))

(assert (= (and d!8871 (not c!6117)) b!45556))

(assert (= (and b!45556 c!6116) b!45555))

(assert (= (and b!45556 (not c!6116)) b!45554))

(assert (= (and d!8871 res!26732) b!45553))

(declare-fun m!40023 () Bool)

(assert (=> b!45553 m!40023))

(declare-fun m!40025 () Bool)

(assert (=> d!8871 m!40025))

(assert (=> d!8871 m!39981))

(assert (=> b!45555 m!39967))

(assert (=> b!45555 m!39967))

(declare-fun m!40027 () Bool)

(assert (=> b!45555 m!40027))

(assert (=> b!45491 d!8871))

(declare-fun b!45558 () Bool)

(declare-fun e!29001 () Bool)

(declare-fun lt!20142 () List!1206)

(assert (=> b!45558 (= e!29001 (not (containsKey!78 lt!20142 key2!27)))))

(declare-fun d!8879 () Bool)

(assert (=> d!8879 e!29001))

(declare-fun res!26733 () Bool)

(assert (=> d!8879 (=> (not res!26733) (not e!29001))))

(assert (=> d!8879 (= res!26733 (isStrictlySorted!205 lt!20142))))

(declare-fun e!29003 () List!1206)

(assert (=> d!8879 (= lt!20142 e!29003)))

(declare-fun c!6119 () Bool)

(assert (=> d!8879 (= c!6119 (and ((_ is Cons!1202) (t!4231 l!812)) (= (_1!828 (h!1782 (t!4231 l!812))) key2!27)))))

(assert (=> d!8879 (isStrictlySorted!205 (t!4231 l!812))))

(assert (=> d!8879 (= (removeStrictlySorted!26 (t!4231 l!812) key2!27) lt!20142)))

(declare-fun b!45559 () Bool)

(declare-fun e!29002 () List!1206)

(assert (=> b!45559 (= e!29002 Nil!1203)))

(declare-fun b!45560 () Bool)

(assert (=> b!45560 (= e!29002 ($colon$colon!31 (removeStrictlySorted!26 (t!4231 (t!4231 l!812)) key2!27) (h!1782 (t!4231 l!812))))))

(declare-fun b!45561 () Bool)

(assert (=> b!45561 (= e!29003 e!29002)))

(declare-fun c!6118 () Bool)

(assert (=> b!45561 (= c!6118 (and ((_ is Cons!1202) (t!4231 l!812)) (not (= (_1!828 (h!1782 (t!4231 l!812))) key2!27))))))

(declare-fun b!45562 () Bool)

(assert (=> b!45562 (= e!29003 (t!4231 (t!4231 l!812)))))

(assert (= (and d!8879 c!6119) b!45562))

(assert (= (and d!8879 (not c!6119)) b!45561))

(assert (= (and b!45561 c!6118) b!45560))

(assert (= (and b!45561 (not c!6118)) b!45559))

(assert (= (and d!8879 res!26733) b!45558))

(declare-fun m!40029 () Bool)

(assert (=> b!45558 m!40029))

(declare-fun m!40031 () Bool)

(assert (=> d!8879 m!40031))

(assert (=> d!8879 m!39965))

(declare-fun m!40035 () Bool)

(assert (=> b!45560 m!40035))

(assert (=> b!45560 m!40035))

(declare-fun m!40039 () Bool)

(assert (=> b!45560 m!40039))

(assert (=> b!45491 d!8879))

(declare-fun d!8881 () Bool)

(assert (=> d!8881 (= (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4231 l!812) key1!43) key2!27) (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4231 l!812) key2!27) key1!43))))

(declare-fun lt!20149 () Unit!1314)

(declare-fun choose!278 (List!1206 (_ BitVec 64) (_ BitVec 64)) Unit!1314)

(assert (=> d!8881 (= lt!20149 (choose!278 (t!4231 l!812) key1!43 key2!27))))

(assert (=> d!8881 (isStrictlySorted!205 (t!4231 l!812))))

(assert (=> d!8881 (= (lemmaRemoveStrictlySortedCommutative!7 (t!4231 l!812) key1!43 key2!27) lt!20149)))

(declare-fun bs!2146 () Bool)

(assert (= bs!2146 d!8881))

(assert (=> bs!2146 m!39965))

(assert (=> bs!2146 m!39967))

(assert (=> bs!2146 m!39973))

(assert (=> bs!2146 m!39975))

(assert (=> bs!2146 m!39967))

(assert (=> bs!2146 m!39969))

(assert (=> bs!2146 m!39973))

(declare-fun m!40051 () Bool)

(assert (=> bs!2146 m!40051))

(assert (=> b!45491 d!8881))

(declare-fun b!45573 () Bool)

(declare-fun e!29010 () Bool)

(declare-fun lt!20150 () List!1206)

(assert (=> b!45573 (= e!29010 (not (containsKey!78 lt!20150 key2!27)))))

(declare-fun d!8887 () Bool)

(assert (=> d!8887 e!29010))

(declare-fun res!26736 () Bool)

(assert (=> d!8887 (=> (not res!26736) (not e!29010))))

(assert (=> d!8887 (= res!26736 (isStrictlySorted!205 lt!20150))))

(declare-fun e!29012 () List!1206)

(assert (=> d!8887 (= lt!20150 e!29012)))

(declare-fun c!6125 () Bool)

(assert (=> d!8887 (= c!6125 (and ((_ is Cons!1202) (removeStrictlySorted!26 (t!4231 l!812) key1!43)) (= (_1!828 (h!1782 (removeStrictlySorted!26 (t!4231 l!812) key1!43))) key2!27)))))

(assert (=> d!8887 (isStrictlySorted!205 (removeStrictlySorted!26 (t!4231 l!812) key1!43))))

(assert (=> d!8887 (= (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4231 l!812) key1!43) key2!27) lt!20150)))

(declare-fun b!45574 () Bool)

(declare-fun e!29011 () List!1206)

(assert (=> b!45574 (= e!29011 Nil!1203)))

(declare-fun b!45575 () Bool)

(assert (=> b!45575 (= e!29011 ($colon$colon!31 (removeStrictlySorted!26 (t!4231 (removeStrictlySorted!26 (t!4231 l!812) key1!43)) key2!27) (h!1782 (removeStrictlySorted!26 (t!4231 l!812) key1!43))))))

(declare-fun b!45576 () Bool)

(assert (=> b!45576 (= e!29012 e!29011)))

(declare-fun c!6124 () Bool)

(assert (=> b!45576 (= c!6124 (and ((_ is Cons!1202) (removeStrictlySorted!26 (t!4231 l!812) key1!43)) (not (= (_1!828 (h!1782 (removeStrictlySorted!26 (t!4231 l!812) key1!43))) key2!27))))))

(declare-fun b!45577 () Bool)

(assert (=> b!45577 (= e!29012 (t!4231 (removeStrictlySorted!26 (t!4231 l!812) key1!43)))))

(assert (= (and d!8887 c!6125) b!45577))

(assert (= (and d!8887 (not c!6125)) b!45576))

(assert (= (and b!45576 c!6124) b!45575))

(assert (= (and b!45576 (not c!6124)) b!45574))

(assert (= (and d!8887 res!26736) b!45573))

(declare-fun m!40053 () Bool)

(assert (=> b!45573 m!40053))

(declare-fun m!40055 () Bool)

(assert (=> d!8887 m!40055))

(assert (=> d!8887 m!39967))

(declare-fun m!40057 () Bool)

(assert (=> d!8887 m!40057))

(declare-fun m!40059 () Bool)

(assert (=> b!45575 m!40059))

(assert (=> b!45575 m!40059))

(declare-fun m!40063 () Bool)

(assert (=> b!45575 m!40063))

(assert (=> b!45491 d!8887))

(declare-fun b!45591 () Bool)

(declare-fun e!29020 () Bool)

(declare-fun lt!20155 () List!1206)

(assert (=> b!45591 (= e!29020 (not (containsKey!78 lt!20155 key1!43)))))

(declare-fun d!8891 () Bool)

(assert (=> d!8891 e!29020))

(declare-fun res!26738 () Bool)

(assert (=> d!8891 (=> (not res!26738) (not e!29020))))

(assert (=> d!8891 (= res!26738 (isStrictlySorted!205 lt!20155))))

(declare-fun e!29022 () List!1206)

(assert (=> d!8891 (= lt!20155 e!29022)))

(declare-fun c!6133 () Bool)

(assert (=> d!8891 (= c!6133 (and ((_ is Cons!1202) (removeStrictlySorted!26 (t!4231 l!812) key2!27)) (= (_1!828 (h!1782 (removeStrictlySorted!26 (t!4231 l!812) key2!27))) key1!43)))))

(assert (=> d!8891 (isStrictlySorted!205 (removeStrictlySorted!26 (t!4231 l!812) key2!27))))

(assert (=> d!8891 (= (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4231 l!812) key2!27) key1!43) lt!20155)))

(declare-fun b!45592 () Bool)

(declare-fun e!29021 () List!1206)

(assert (=> b!45592 (= e!29021 Nil!1203)))

(declare-fun b!45593 () Bool)

(assert (=> b!45593 (= e!29021 ($colon$colon!31 (removeStrictlySorted!26 (t!4231 (removeStrictlySorted!26 (t!4231 l!812) key2!27)) key1!43) (h!1782 (removeStrictlySorted!26 (t!4231 l!812) key2!27))))))

(declare-fun b!45594 () Bool)

(assert (=> b!45594 (= e!29022 e!29021)))

(declare-fun c!6132 () Bool)

(assert (=> b!45594 (= c!6132 (and ((_ is Cons!1202) (removeStrictlySorted!26 (t!4231 l!812) key2!27)) (not (= (_1!828 (h!1782 (removeStrictlySorted!26 (t!4231 l!812) key2!27))) key1!43))))))

(declare-fun b!45595 () Bool)

(assert (=> b!45595 (= e!29022 (t!4231 (removeStrictlySorted!26 (t!4231 l!812) key2!27)))))

(assert (= (and d!8891 c!6133) b!45595))

(assert (= (and d!8891 (not c!6133)) b!45594))

(assert (= (and b!45594 c!6132) b!45593))

(assert (= (and b!45594 (not c!6132)) b!45592))

(assert (= (and d!8891 res!26738) b!45591))

(declare-fun m!40069 () Bool)

(assert (=> b!45591 m!40069))

(declare-fun m!40073 () Bool)

(assert (=> d!8891 m!40073))

(assert (=> d!8891 m!39973))

(declare-fun m!40077 () Bool)

(assert (=> d!8891 m!40077))

(declare-fun m!40079 () Bool)

(assert (=> b!45593 m!40079))

(assert (=> b!45593 m!40079))

(declare-fun m!40083 () Bool)

(assert (=> b!45593 m!40083))

(assert (=> b!45491 d!8891))

(declare-fun b!45601 () Bool)

(declare-fun e!29026 () Bool)

(declare-fun lt!20157 () List!1206)

(assert (=> b!45601 (= e!29026 (not (containsKey!78 lt!20157 key1!43)))))

(declare-fun d!8895 () Bool)

(assert (=> d!8895 e!29026))

(declare-fun res!26740 () Bool)

(assert (=> d!8895 (=> (not res!26740) (not e!29026))))

(assert (=> d!8895 (= res!26740 (isStrictlySorted!205 lt!20157))))

(declare-fun e!29028 () List!1206)

(assert (=> d!8895 (= lt!20157 e!29028)))

(declare-fun c!6137 () Bool)

(assert (=> d!8895 (= c!6137 (and ((_ is Cons!1202) (t!4231 l!812)) (= (_1!828 (h!1782 (t!4231 l!812))) key1!43)))))

(assert (=> d!8895 (isStrictlySorted!205 (t!4231 l!812))))

(assert (=> d!8895 (= (removeStrictlySorted!26 (t!4231 l!812) key1!43) lt!20157)))

(declare-fun b!45602 () Bool)

(declare-fun e!29027 () List!1206)

(assert (=> b!45602 (= e!29027 Nil!1203)))

(declare-fun b!45603 () Bool)

(assert (=> b!45603 (= e!29027 ($colon$colon!31 (removeStrictlySorted!26 (t!4231 (t!4231 l!812)) key1!43) (h!1782 (t!4231 l!812))))))

(declare-fun b!45604 () Bool)

(assert (=> b!45604 (= e!29028 e!29027)))

(declare-fun c!6136 () Bool)

(assert (=> b!45604 (= c!6136 (and ((_ is Cons!1202) (t!4231 l!812)) (not (= (_1!828 (h!1782 (t!4231 l!812))) key1!43))))))

(declare-fun b!45605 () Bool)

(assert (=> b!45605 (= e!29028 (t!4231 (t!4231 l!812)))))

(assert (= (and d!8895 c!6137) b!45605))

(assert (= (and d!8895 (not c!6137)) b!45604))

(assert (= (and b!45604 c!6136) b!45603))

(assert (= (and b!45604 (not c!6136)) b!45602))

(assert (= (and d!8895 res!26740) b!45601))

(declare-fun m!40087 () Bool)

(assert (=> b!45601 m!40087))

(declare-fun m!40089 () Bool)

(assert (=> d!8895 m!40089))

(assert (=> d!8895 m!39965))

(declare-fun m!40095 () Bool)

(assert (=> b!45603 m!40095))

(assert (=> b!45603 m!40095))

(declare-fun m!40099 () Bool)

(assert (=> b!45603 m!40099))

(assert (=> b!45491 d!8895))

(declare-fun d!8897 () Bool)

(declare-fun res!26743 () Bool)

(declare-fun e!29031 () Bool)

(assert (=> d!8897 (=> res!26743 e!29031)))

(assert (=> d!8897 (= res!26743 (or ((_ is Nil!1203) (removeStrictlySorted!26 l!812 key1!43)) ((_ is Nil!1203) (t!4231 (removeStrictlySorted!26 l!812 key1!43)))))))

(assert (=> d!8897 (= (isStrictlySorted!205 (removeStrictlySorted!26 l!812 key1!43)) e!29031)))

(declare-fun b!45608 () Bool)

(declare-fun e!29032 () Bool)

(assert (=> b!45608 (= e!29031 e!29032)))

(declare-fun res!26744 () Bool)

(assert (=> b!45608 (=> (not res!26744) (not e!29032))))

(assert (=> b!45608 (= res!26744 (bvslt (_1!828 (h!1782 (removeStrictlySorted!26 l!812 key1!43))) (_1!828 (h!1782 (t!4231 (removeStrictlySorted!26 l!812 key1!43))))))))

(declare-fun b!45609 () Bool)

(assert (=> b!45609 (= e!29032 (isStrictlySorted!205 (t!4231 (removeStrictlySorted!26 l!812 key1!43))))))

(assert (= (and d!8897 (not res!26743)) b!45608))

(assert (= (and b!45608 res!26744) b!45609))

(declare-fun m!40103 () Bool)

(assert (=> b!45609 m!40103))

(assert (=> b!45491 d!8897))

(declare-fun b!45621 () Bool)

(declare-fun e!29040 () Bool)

(declare-fun tp!5993 () Bool)

(assert (=> b!45621 (= e!29040 (and tp_is_empty!1927 tp!5993))))

(assert (=> b!45492 (= tp!5984 e!29040)))

(assert (= (and b!45492 ((_ is Cons!1202) (t!4231 l!812))) b!45621))

(check-sat (not b!45558) (not b!45575) (not b!45621) (not b!45609) (not d!8871) (not b!45603) (not d!8895) (not b!45593) (not b!45553) (not b!45573) tp_is_empty!1927 (not b!45522) (not b!45601) (not b!45560) (not d!8887) (not b!45591) (not b!45555) (not b!45528) (not d!8879) (not d!8881) (not d!8891))
(check-sat)
