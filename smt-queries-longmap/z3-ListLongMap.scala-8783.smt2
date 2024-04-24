; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107052 () Bool)

(assert start!107052)

(declare-fun b!1268958 () Bool)

(declare-fun res!844364 () Bool)

(declare-fun e!723017 () Bool)

(assert (=> b!1268958 (=> (not res!844364) (not e!723017))))

(declare-datatypes ((B!2090 0))(
  ( (B!2091 (val!16380 Int)) )
))
(declare-datatypes ((tuple2!21288 0))(
  ( (tuple2!21289 (_1!10655 (_ BitVec 64)) (_2!10655 B!2090)) )
))
(declare-datatypes ((List!28408 0))(
  ( (Nil!28405) (Cons!28404 (h!29622 tuple2!21288) (t!41927 List!28408)) )
))
(declare-fun l!874 () List!28408)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!688 (List!28408 (_ BitVec 64)) Bool)

(assert (=> b!1268958 (= res!844364 (not (containsKey!688 (t!41927 l!874) key!235)))))

(declare-fun b!1268959 () Bool)

(declare-fun res!844361 () Bool)

(assert (=> b!1268959 (=> (not res!844361) (not e!723017))))

(declare-fun isStrictlySorted!817 (List!28408) Bool)

(assert (=> b!1268959 (= res!844361 (isStrictlySorted!817 (t!41927 l!874)))))

(declare-fun b!1268960 () Bool)

(declare-fun res!844363 () Bool)

(assert (=> b!1268960 (=> (not res!844363) (not e!723017))))

(get-info :version)

(assert (=> b!1268960 (= res!844363 ((_ is Cons!28404) l!874))))

(declare-fun res!844360 () Bool)

(assert (=> start!107052 (=> (not res!844360) (not e!723017))))

(assert (=> start!107052 (= res!844360 (isStrictlySorted!817 l!874))))

(assert (=> start!107052 e!723017))

(declare-fun e!723018 () Bool)

(assert (=> start!107052 e!723018))

(assert (=> start!107052 true))

(declare-fun b!1268957 () Bool)

(declare-fun res!844362 () Bool)

(assert (=> b!1268957 (=> (not res!844362) (not e!723017))))

(assert (=> b!1268957 (= res!844362 (not (containsKey!688 l!874 key!235)))))

(declare-fun b!1268961 () Bool)

(declare-fun removeStrictlySorted!166 (List!28408 (_ BitVec 64)) List!28408)

(assert (=> b!1268961 (= e!723017 (not (= (removeStrictlySorted!166 l!874 key!235) l!874)))))

(assert (=> b!1268961 (= (removeStrictlySorted!166 (t!41927 l!874) key!235) (t!41927 l!874))))

(declare-datatypes ((Unit!42195 0))(
  ( (Unit!42196) )
))
(declare-fun lt!574828 () Unit!42195)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!7 (List!28408 (_ BitVec 64)) Unit!42195)

(assert (=> b!1268961 (= lt!574828 (lemmaRemoveStrictlySortedNotPresentPreserves!7 (t!41927 l!874) key!235))))

(declare-fun b!1268962 () Bool)

(declare-fun tp_is_empty!32611 () Bool)

(declare-fun tp!96641 () Bool)

(assert (=> b!1268962 (= e!723018 (and tp_is_empty!32611 tp!96641))))

(assert (= (and start!107052 res!844360) b!1268957))

(assert (= (and b!1268957 res!844362) b!1268960))

(assert (= (and b!1268960 res!844363) b!1268959))

(assert (= (and b!1268959 res!844361) b!1268958))

(assert (= (and b!1268958 res!844364) b!1268961))

(assert (= (and start!107052 ((_ is Cons!28404) l!874)) b!1268962))

(declare-fun m!1168423 () Bool)

(assert (=> start!107052 m!1168423))

(declare-fun m!1168425 () Bool)

(assert (=> b!1268961 m!1168425))

(declare-fun m!1168427 () Bool)

(assert (=> b!1268961 m!1168427))

(declare-fun m!1168429 () Bool)

(assert (=> b!1268961 m!1168429))

(declare-fun m!1168431 () Bool)

(assert (=> b!1268957 m!1168431))

(declare-fun m!1168433 () Bool)

(assert (=> b!1268958 m!1168433))

(declare-fun m!1168435 () Bool)

(assert (=> b!1268959 m!1168435))

(check-sat (not b!1268961) (not b!1268962) tp_is_empty!32611 (not b!1268957) (not start!107052) (not b!1268958) (not b!1268959))
(check-sat)
(get-model)

(declare-fun d!139973 () Bool)

(declare-fun res!844407 () Bool)

(declare-fun e!723043 () Bool)

(assert (=> d!139973 (=> res!844407 e!723043)))

(assert (=> d!139973 (= res!844407 (and ((_ is Cons!28404) (t!41927 l!874)) (= (_1!10655 (h!29622 (t!41927 l!874))) key!235)))))

(assert (=> d!139973 (= (containsKey!688 (t!41927 l!874) key!235) e!723043)))

(declare-fun b!1269011 () Bool)

(declare-fun e!723044 () Bool)

(assert (=> b!1269011 (= e!723043 e!723044)))

(declare-fun res!844408 () Bool)

(assert (=> b!1269011 (=> (not res!844408) (not e!723044))))

(assert (=> b!1269011 (= res!844408 (and (or (not ((_ is Cons!28404) (t!41927 l!874))) (bvsle (_1!10655 (h!29622 (t!41927 l!874))) key!235)) ((_ is Cons!28404) (t!41927 l!874)) (bvslt (_1!10655 (h!29622 (t!41927 l!874))) key!235)))))

(declare-fun b!1269012 () Bool)

(assert (=> b!1269012 (= e!723044 (containsKey!688 (t!41927 (t!41927 l!874)) key!235))))

(assert (= (and d!139973 (not res!844407)) b!1269011))

(assert (= (and b!1269011 res!844408) b!1269012))

(declare-fun m!1168465 () Bool)

(assert (=> b!1269012 m!1168465))

(assert (=> b!1268958 d!139973))

(declare-fun d!139979 () Bool)

(declare-fun res!844421 () Bool)

(declare-fun e!723057 () Bool)

(assert (=> d!139979 (=> res!844421 e!723057)))

(assert (=> d!139979 (= res!844421 (or ((_ is Nil!28405) l!874) ((_ is Nil!28405) (t!41927 l!874))))))

(assert (=> d!139979 (= (isStrictlySorted!817 l!874) e!723057)))

(declare-fun b!1269025 () Bool)

(declare-fun e!723058 () Bool)

(assert (=> b!1269025 (= e!723057 e!723058)))

(declare-fun res!844422 () Bool)

(assert (=> b!1269025 (=> (not res!844422) (not e!723058))))

(assert (=> b!1269025 (= res!844422 (bvslt (_1!10655 (h!29622 l!874)) (_1!10655 (h!29622 (t!41927 l!874)))))))

(declare-fun b!1269026 () Bool)

(assert (=> b!1269026 (= e!723058 (isStrictlySorted!817 (t!41927 l!874)))))

(assert (= (and d!139979 (not res!844421)) b!1269025))

(assert (= (and b!1269025 res!844422) b!1269026))

(assert (=> b!1269026 m!1168435))

(assert (=> start!107052 d!139979))

(declare-fun d!139985 () Bool)

(declare-fun res!844423 () Bool)

(declare-fun e!723059 () Bool)

(assert (=> d!139985 (=> res!844423 e!723059)))

(assert (=> d!139985 (= res!844423 (or ((_ is Nil!28405) (t!41927 l!874)) ((_ is Nil!28405) (t!41927 (t!41927 l!874)))))))

(assert (=> d!139985 (= (isStrictlySorted!817 (t!41927 l!874)) e!723059)))

(declare-fun b!1269027 () Bool)

(declare-fun e!723060 () Bool)

(assert (=> b!1269027 (= e!723059 e!723060)))

(declare-fun res!844424 () Bool)

(assert (=> b!1269027 (=> (not res!844424) (not e!723060))))

(assert (=> b!1269027 (= res!844424 (bvslt (_1!10655 (h!29622 (t!41927 l!874))) (_1!10655 (h!29622 (t!41927 (t!41927 l!874))))))))

(declare-fun b!1269028 () Bool)

(assert (=> b!1269028 (= e!723060 (isStrictlySorted!817 (t!41927 (t!41927 l!874))))))

(assert (= (and d!139985 (not res!844423)) b!1269027))

(assert (= (and b!1269027 res!844424) b!1269028))

(declare-fun m!1168469 () Bool)

(assert (=> b!1269028 m!1168469))

(assert (=> b!1268959 d!139985))

(declare-fun b!1269073 () Bool)

(declare-fun e!723089 () List!28408)

(assert (=> b!1269073 (= e!723089 (t!41927 l!874))))

(declare-fun b!1269074 () Bool)

(declare-fun e!723090 () List!28408)

(declare-fun $colon$colon!649 (List!28408 tuple2!21288) List!28408)

(assert (=> b!1269074 (= e!723090 ($colon$colon!649 (removeStrictlySorted!166 (t!41927 l!874) key!235) (h!29622 l!874)))))

(declare-fun b!1269075 () Bool)

(declare-fun e!723091 () Bool)

(declare-fun lt!574843 () List!28408)

(assert (=> b!1269075 (= e!723091 (not (containsKey!688 lt!574843 key!235)))))

(declare-fun d!139987 () Bool)

(assert (=> d!139987 e!723091))

(declare-fun res!844437 () Bool)

(assert (=> d!139987 (=> (not res!844437) (not e!723091))))

(assert (=> d!139987 (= res!844437 (isStrictlySorted!817 lt!574843))))

(assert (=> d!139987 (= lt!574843 e!723089)))

(declare-fun c!123992 () Bool)

(assert (=> d!139987 (= c!123992 (and ((_ is Cons!28404) l!874) (= (_1!10655 (h!29622 l!874)) key!235)))))

(assert (=> d!139987 (isStrictlySorted!817 l!874)))

(assert (=> d!139987 (= (removeStrictlySorted!166 l!874 key!235) lt!574843)))

(declare-fun b!1269076 () Bool)

(assert (=> b!1269076 (= e!723090 Nil!28405)))

(declare-fun b!1269077 () Bool)

(assert (=> b!1269077 (= e!723089 e!723090)))

(declare-fun c!123991 () Bool)

(assert (=> b!1269077 (= c!123991 (and ((_ is Cons!28404) l!874) (not (= (_1!10655 (h!29622 l!874)) key!235))))))

(assert (= (and d!139987 c!123992) b!1269073))

(assert (= (and d!139987 (not c!123992)) b!1269077))

(assert (= (and b!1269077 c!123991) b!1269074))

(assert (= (and b!1269077 (not c!123991)) b!1269076))

(assert (= (and d!139987 res!844437) b!1269075))

(assert (=> b!1269074 m!1168427))

(assert (=> b!1269074 m!1168427))

(declare-fun m!1168487 () Bool)

(assert (=> b!1269074 m!1168487))

(declare-fun m!1168489 () Bool)

(assert (=> b!1269075 m!1168489))

(declare-fun m!1168491 () Bool)

(assert (=> d!139987 m!1168491))

(assert (=> d!139987 m!1168423))

(assert (=> b!1268961 d!139987))

(declare-fun b!1269078 () Bool)

(declare-fun e!723092 () List!28408)

(assert (=> b!1269078 (= e!723092 (t!41927 (t!41927 l!874)))))

(declare-fun b!1269079 () Bool)

(declare-fun e!723093 () List!28408)

(assert (=> b!1269079 (= e!723093 ($colon$colon!649 (removeStrictlySorted!166 (t!41927 (t!41927 l!874)) key!235) (h!29622 (t!41927 l!874))))))

(declare-fun b!1269080 () Bool)

(declare-fun e!723094 () Bool)

(declare-fun lt!574846 () List!28408)

(assert (=> b!1269080 (= e!723094 (not (containsKey!688 lt!574846 key!235)))))

(declare-fun d!139997 () Bool)

(assert (=> d!139997 e!723094))

(declare-fun res!844438 () Bool)

(assert (=> d!139997 (=> (not res!844438) (not e!723094))))

(assert (=> d!139997 (= res!844438 (isStrictlySorted!817 lt!574846))))

(assert (=> d!139997 (= lt!574846 e!723092)))

(declare-fun c!123994 () Bool)

(assert (=> d!139997 (= c!123994 (and ((_ is Cons!28404) (t!41927 l!874)) (= (_1!10655 (h!29622 (t!41927 l!874))) key!235)))))

(assert (=> d!139997 (isStrictlySorted!817 (t!41927 l!874))))

(assert (=> d!139997 (= (removeStrictlySorted!166 (t!41927 l!874) key!235) lt!574846)))

(declare-fun b!1269081 () Bool)

(assert (=> b!1269081 (= e!723093 Nil!28405)))

(declare-fun b!1269082 () Bool)

(assert (=> b!1269082 (= e!723092 e!723093)))

(declare-fun c!123993 () Bool)

(assert (=> b!1269082 (= c!123993 (and ((_ is Cons!28404) (t!41927 l!874)) (not (= (_1!10655 (h!29622 (t!41927 l!874))) key!235))))))

(assert (= (and d!139997 c!123994) b!1269078))

(assert (= (and d!139997 (not c!123994)) b!1269082))

(assert (= (and b!1269082 c!123993) b!1269079))

(assert (= (and b!1269082 (not c!123993)) b!1269081))

(assert (= (and d!139997 res!844438) b!1269080))

(declare-fun m!1168493 () Bool)

(assert (=> b!1269079 m!1168493))

(assert (=> b!1269079 m!1168493))

(declare-fun m!1168495 () Bool)

(assert (=> b!1269079 m!1168495))

(declare-fun m!1168497 () Bool)

(assert (=> b!1269080 m!1168497))

(declare-fun m!1168501 () Bool)

(assert (=> d!139997 m!1168501))

(assert (=> d!139997 m!1168435))

(assert (=> b!1268961 d!139997))

(declare-fun d!139999 () Bool)

(assert (=> d!139999 (= (removeStrictlySorted!166 (t!41927 l!874) key!235) (t!41927 l!874))))

(declare-fun lt!574852 () Unit!42195)

(declare-fun choose!1896 (List!28408 (_ BitVec 64)) Unit!42195)

(assert (=> d!139999 (= lt!574852 (choose!1896 (t!41927 l!874) key!235))))

(assert (=> d!139999 (isStrictlySorted!817 (t!41927 l!874))))

(assert (=> d!139999 (= (lemmaRemoveStrictlySortedNotPresentPreserves!7 (t!41927 l!874) key!235) lt!574852)))

(declare-fun bs!35920 () Bool)

(assert (= bs!35920 d!139999))

(assert (=> bs!35920 m!1168427))

(declare-fun m!1168517 () Bool)

(assert (=> bs!35920 m!1168517))

(assert (=> bs!35920 m!1168435))

(assert (=> b!1268961 d!139999))

(declare-fun d!140007 () Bool)

(declare-fun res!844447 () Bool)

(declare-fun e!723107 () Bool)

(assert (=> d!140007 (=> res!844447 e!723107)))

(assert (=> d!140007 (= res!844447 (and ((_ is Cons!28404) l!874) (= (_1!10655 (h!29622 l!874)) key!235)))))

(assert (=> d!140007 (= (containsKey!688 l!874 key!235) e!723107)))

(declare-fun b!1269099 () Bool)

(declare-fun e!723108 () Bool)

(assert (=> b!1269099 (= e!723107 e!723108)))

(declare-fun res!844448 () Bool)

(assert (=> b!1269099 (=> (not res!844448) (not e!723108))))

(assert (=> b!1269099 (= res!844448 (and (or (not ((_ is Cons!28404) l!874)) (bvsle (_1!10655 (h!29622 l!874)) key!235)) ((_ is Cons!28404) l!874) (bvslt (_1!10655 (h!29622 l!874)) key!235)))))

(declare-fun b!1269100 () Bool)

(assert (=> b!1269100 (= e!723108 (containsKey!688 (t!41927 l!874) key!235))))

(assert (= (and d!140007 (not res!844447)) b!1269099))

(assert (= (and b!1269099 res!844448) b!1269100))

(assert (=> b!1269100 m!1168433))

(assert (=> b!1268957 d!140007))

(declare-fun b!1269111 () Bool)

(declare-fun e!723117 () Bool)

(declare-fun tp!96650 () Bool)

(assert (=> b!1269111 (= e!723117 (and tp_is_empty!32611 tp!96650))))

(assert (=> b!1268962 (= tp!96641 e!723117)))

(assert (= (and b!1268962 ((_ is Cons!28404) (t!41927 l!874))) b!1269111))

(check-sat (not b!1269080) (not b!1269079) (not b!1269075) (not b!1269026) (not d!139987) tp_is_empty!32611 (not b!1269111) (not b!1269012) (not b!1269100) (not b!1269028) (not b!1269074) (not d!139999) (not d!139997))
(check-sat)
(get-model)

(assert (=> b!1269100 d!139973))

(declare-fun d!140015 () Bool)

(assert (=> d!140015 (= ($colon$colon!649 (removeStrictlySorted!166 (t!41927 (t!41927 l!874)) key!235) (h!29622 (t!41927 l!874))) (Cons!28404 (h!29622 (t!41927 l!874)) (removeStrictlySorted!166 (t!41927 (t!41927 l!874)) key!235)))))

(assert (=> b!1269079 d!140015))

(declare-fun b!1269122 () Bool)

(declare-fun e!723124 () List!28408)

(assert (=> b!1269122 (= e!723124 (t!41927 (t!41927 (t!41927 l!874))))))

(declare-fun b!1269123 () Bool)

(declare-fun e!723125 () List!28408)

(assert (=> b!1269123 (= e!723125 ($colon$colon!649 (removeStrictlySorted!166 (t!41927 (t!41927 (t!41927 l!874))) key!235) (h!29622 (t!41927 (t!41927 l!874)))))))

(declare-fun b!1269124 () Bool)

(declare-fun e!723126 () Bool)

(declare-fun lt!574856 () List!28408)

(assert (=> b!1269124 (= e!723126 (not (containsKey!688 lt!574856 key!235)))))

(declare-fun d!140017 () Bool)

(assert (=> d!140017 e!723126))

(declare-fun res!844455 () Bool)

(assert (=> d!140017 (=> (not res!844455) (not e!723126))))

(assert (=> d!140017 (= res!844455 (isStrictlySorted!817 lt!574856))))

(assert (=> d!140017 (= lt!574856 e!723124)))

(declare-fun c!124000 () Bool)

(assert (=> d!140017 (= c!124000 (and ((_ is Cons!28404) (t!41927 (t!41927 l!874))) (= (_1!10655 (h!29622 (t!41927 (t!41927 l!874)))) key!235)))))

(assert (=> d!140017 (isStrictlySorted!817 (t!41927 (t!41927 l!874)))))

(assert (=> d!140017 (= (removeStrictlySorted!166 (t!41927 (t!41927 l!874)) key!235) lt!574856)))

(declare-fun b!1269125 () Bool)

(assert (=> b!1269125 (= e!723125 Nil!28405)))

(declare-fun b!1269126 () Bool)

(assert (=> b!1269126 (= e!723124 e!723125)))

(declare-fun c!123999 () Bool)

(assert (=> b!1269126 (= c!123999 (and ((_ is Cons!28404) (t!41927 (t!41927 l!874))) (not (= (_1!10655 (h!29622 (t!41927 (t!41927 l!874)))) key!235))))))

(assert (= (and d!140017 c!124000) b!1269122))

(assert (= (and d!140017 (not c!124000)) b!1269126))

(assert (= (and b!1269126 c!123999) b!1269123))

(assert (= (and b!1269126 (not c!123999)) b!1269125))

(assert (= (and d!140017 res!844455) b!1269124))

(declare-fun m!1168525 () Bool)

(assert (=> b!1269123 m!1168525))

(assert (=> b!1269123 m!1168525))

(declare-fun m!1168527 () Bool)

(assert (=> b!1269123 m!1168527))

(declare-fun m!1168529 () Bool)

(assert (=> b!1269124 m!1168529))

(declare-fun m!1168531 () Bool)

(assert (=> d!140017 m!1168531))

(assert (=> d!140017 m!1168469))

(assert (=> b!1269079 d!140017))

(assert (=> b!1269026 d!139985))

(declare-fun d!140019 () Bool)

(assert (=> d!140019 (= ($colon$colon!649 (removeStrictlySorted!166 (t!41927 l!874) key!235) (h!29622 l!874)) (Cons!28404 (h!29622 l!874) (removeStrictlySorted!166 (t!41927 l!874) key!235)))))

(assert (=> b!1269074 d!140019))

(assert (=> b!1269074 d!139997))

(declare-fun d!140021 () Bool)

(declare-fun res!844456 () Bool)

(declare-fun e!723127 () Bool)

(assert (=> d!140021 (=> res!844456 e!723127)))

(assert (=> d!140021 (= res!844456 (and ((_ is Cons!28404) lt!574846) (= (_1!10655 (h!29622 lt!574846)) key!235)))))

(assert (=> d!140021 (= (containsKey!688 lt!574846 key!235) e!723127)))

(declare-fun b!1269127 () Bool)

(declare-fun e!723128 () Bool)

(assert (=> b!1269127 (= e!723127 e!723128)))

(declare-fun res!844457 () Bool)

(assert (=> b!1269127 (=> (not res!844457) (not e!723128))))

(assert (=> b!1269127 (= res!844457 (and (or (not ((_ is Cons!28404) lt!574846)) (bvsle (_1!10655 (h!29622 lt!574846)) key!235)) ((_ is Cons!28404) lt!574846) (bvslt (_1!10655 (h!29622 lt!574846)) key!235)))))

(declare-fun b!1269128 () Bool)

(assert (=> b!1269128 (= e!723128 (containsKey!688 (t!41927 lt!574846) key!235))))

(assert (= (and d!140021 (not res!844456)) b!1269127))

(assert (= (and b!1269127 res!844457) b!1269128))

(declare-fun m!1168533 () Bool)

(assert (=> b!1269128 m!1168533))

(assert (=> b!1269080 d!140021))

(declare-fun d!140023 () Bool)

(declare-fun res!844458 () Bool)

(declare-fun e!723129 () Bool)

(assert (=> d!140023 (=> res!844458 e!723129)))

(assert (=> d!140023 (= res!844458 (and ((_ is Cons!28404) (t!41927 (t!41927 l!874))) (= (_1!10655 (h!29622 (t!41927 (t!41927 l!874)))) key!235)))))

(assert (=> d!140023 (= (containsKey!688 (t!41927 (t!41927 l!874)) key!235) e!723129)))

(declare-fun b!1269129 () Bool)

(declare-fun e!723130 () Bool)

(assert (=> b!1269129 (= e!723129 e!723130)))

(declare-fun res!844459 () Bool)

(assert (=> b!1269129 (=> (not res!844459) (not e!723130))))

(assert (=> b!1269129 (= res!844459 (and (or (not ((_ is Cons!28404) (t!41927 (t!41927 l!874)))) (bvsle (_1!10655 (h!29622 (t!41927 (t!41927 l!874)))) key!235)) ((_ is Cons!28404) (t!41927 (t!41927 l!874))) (bvslt (_1!10655 (h!29622 (t!41927 (t!41927 l!874)))) key!235)))))

(declare-fun b!1269130 () Bool)

(assert (=> b!1269130 (= e!723130 (containsKey!688 (t!41927 (t!41927 (t!41927 l!874))) key!235))))

(assert (= (and d!140023 (not res!844458)) b!1269129))

(assert (= (and b!1269129 res!844459) b!1269130))

(declare-fun m!1168535 () Bool)

(assert (=> b!1269130 m!1168535))

(assert (=> b!1269012 d!140023))

(declare-fun d!140027 () Bool)

(declare-fun res!844462 () Bool)

(declare-fun e!723133 () Bool)

(assert (=> d!140027 (=> res!844462 e!723133)))

(assert (=> d!140027 (= res!844462 (or ((_ is Nil!28405) lt!574846) ((_ is Nil!28405) (t!41927 lt!574846))))))

(assert (=> d!140027 (= (isStrictlySorted!817 lt!574846) e!723133)))

(declare-fun b!1269133 () Bool)

(declare-fun e!723134 () Bool)

(assert (=> b!1269133 (= e!723133 e!723134)))

(declare-fun res!844463 () Bool)

(assert (=> b!1269133 (=> (not res!844463) (not e!723134))))

(assert (=> b!1269133 (= res!844463 (bvslt (_1!10655 (h!29622 lt!574846)) (_1!10655 (h!29622 (t!41927 lt!574846)))))))

(declare-fun b!1269134 () Bool)

(assert (=> b!1269134 (= e!723134 (isStrictlySorted!817 (t!41927 lt!574846)))))

(assert (= (and d!140027 (not res!844462)) b!1269133))

(assert (= (and b!1269133 res!844463) b!1269134))

(declare-fun m!1168537 () Bool)

(assert (=> b!1269134 m!1168537))

(assert (=> d!139997 d!140027))

(assert (=> d!139997 d!139985))

(declare-fun d!140029 () Bool)

(declare-fun res!844464 () Bool)

(declare-fun e!723135 () Bool)

(assert (=> d!140029 (=> res!844464 e!723135)))

(assert (=> d!140029 (= res!844464 (and ((_ is Cons!28404) lt!574843) (= (_1!10655 (h!29622 lt!574843)) key!235)))))

(assert (=> d!140029 (= (containsKey!688 lt!574843 key!235) e!723135)))

(declare-fun b!1269135 () Bool)

(declare-fun e!723136 () Bool)

(assert (=> b!1269135 (= e!723135 e!723136)))

(declare-fun res!844465 () Bool)

(assert (=> b!1269135 (=> (not res!844465) (not e!723136))))

(assert (=> b!1269135 (= res!844465 (and (or (not ((_ is Cons!28404) lt!574843)) (bvsle (_1!10655 (h!29622 lt!574843)) key!235)) ((_ is Cons!28404) lt!574843) (bvslt (_1!10655 (h!29622 lt!574843)) key!235)))))

(declare-fun b!1269136 () Bool)

(assert (=> b!1269136 (= e!723136 (containsKey!688 (t!41927 lt!574843) key!235))))

(assert (= (and d!140029 (not res!844464)) b!1269135))

(assert (= (and b!1269135 res!844465) b!1269136))

(declare-fun m!1168541 () Bool)

(assert (=> b!1269136 m!1168541))

(assert (=> b!1269075 d!140029))

(declare-fun d!140033 () Bool)

(declare-fun res!844466 () Bool)

(declare-fun e!723137 () Bool)

(assert (=> d!140033 (=> res!844466 e!723137)))

(assert (=> d!140033 (= res!844466 (or ((_ is Nil!28405) lt!574843) ((_ is Nil!28405) (t!41927 lt!574843))))))

(assert (=> d!140033 (= (isStrictlySorted!817 lt!574843) e!723137)))

(declare-fun b!1269137 () Bool)

(declare-fun e!723138 () Bool)

(assert (=> b!1269137 (= e!723137 e!723138)))

(declare-fun res!844467 () Bool)

(assert (=> b!1269137 (=> (not res!844467) (not e!723138))))

(assert (=> b!1269137 (= res!844467 (bvslt (_1!10655 (h!29622 lt!574843)) (_1!10655 (h!29622 (t!41927 lt!574843)))))))

(declare-fun b!1269138 () Bool)

(assert (=> b!1269138 (= e!723138 (isStrictlySorted!817 (t!41927 lt!574843)))))

(assert (= (and d!140033 (not res!844466)) b!1269137))

(assert (= (and b!1269137 res!844467) b!1269138))

(declare-fun m!1168543 () Bool)

(assert (=> b!1269138 m!1168543))

(assert (=> d!139987 d!140033))

(assert (=> d!139987 d!139979))

(assert (=> d!139999 d!139997))

(declare-fun d!140035 () Bool)

(assert (=> d!140035 (= (removeStrictlySorted!166 (t!41927 l!874) key!235) (t!41927 l!874))))

(assert (=> d!140035 true))

(declare-fun _$7!131 () Unit!42195)

(assert (=> d!140035 (= (choose!1896 (t!41927 l!874) key!235) _$7!131)))

(declare-fun bs!35922 () Bool)

(assert (= bs!35922 d!140035))

(assert (=> bs!35922 m!1168427))

(assert (=> d!139999 d!140035))

(assert (=> d!139999 d!139985))

(declare-fun d!140045 () Bool)

(declare-fun res!844473 () Bool)

(declare-fun e!723146 () Bool)

(assert (=> d!140045 (=> res!844473 e!723146)))

(assert (=> d!140045 (= res!844473 (or ((_ is Nil!28405) (t!41927 (t!41927 l!874))) ((_ is Nil!28405) (t!41927 (t!41927 (t!41927 l!874))))))))

(assert (=> d!140045 (= (isStrictlySorted!817 (t!41927 (t!41927 l!874))) e!723146)))

(declare-fun b!1269148 () Bool)

(declare-fun e!723147 () Bool)

(assert (=> b!1269148 (= e!723146 e!723147)))

(declare-fun res!844474 () Bool)

(assert (=> b!1269148 (=> (not res!844474) (not e!723147))))

(assert (=> b!1269148 (= res!844474 (bvslt (_1!10655 (h!29622 (t!41927 (t!41927 l!874)))) (_1!10655 (h!29622 (t!41927 (t!41927 (t!41927 l!874)))))))))

(declare-fun b!1269149 () Bool)

(assert (=> b!1269149 (= e!723147 (isStrictlySorted!817 (t!41927 (t!41927 (t!41927 l!874)))))))

(assert (= (and d!140045 (not res!844473)) b!1269148))

(assert (= (and b!1269148 res!844474) b!1269149))

(declare-fun m!1168557 () Bool)

(assert (=> b!1269149 m!1168557))

(assert (=> b!1269028 d!140045))

(declare-fun b!1269152 () Bool)

(declare-fun e!723150 () Bool)

(declare-fun tp!96657 () Bool)

(assert (=> b!1269152 (= e!723150 (and tp_is_empty!32611 tp!96657))))

(assert (=> b!1269111 (= tp!96650 e!723150)))

(assert (= (and b!1269111 ((_ is Cons!28404) (t!41927 (t!41927 l!874)))) b!1269152))

(check-sat (not b!1269149) (not d!140017) (not b!1269152) (not d!140035) (not b!1269130) (not b!1269134) tp_is_empty!32611 (not b!1269138) (not b!1269123) (not b!1269124) (not b!1269136) (not b!1269128))
(check-sat)
