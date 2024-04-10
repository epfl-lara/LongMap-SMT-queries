; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133156 () Bool)

(assert start!133156)

(declare-fun b!1557974 () Bool)

(declare-fun e!867863 () Bool)

(declare-fun tp_is_empty!38421 () Bool)

(declare-fun tp!112587 () Bool)

(assert (=> b!1557974 (= e!867863 (and tp_is_empty!38421 tp!112587))))

(declare-fun b!1557972 () Bool)

(declare-fun res!1065578 () Bool)

(declare-fun e!867862 () Bool)

(assert (=> b!1557972 (=> (not res!1065578) (not e!867862))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2416 0))(
  ( (B!2417 (val!19294 Int)) )
))
(declare-datatypes ((tuple2!24964 0))(
  ( (tuple2!24965 (_1!12493 (_ BitVec 64)) (_2!12493 B!2416)) )
))
(declare-datatypes ((List!36328 0))(
  ( (Nil!36325) (Cons!36324 (h!37770 tuple2!24964) (t!51055 List!36328)) )
))
(declare-fun l!1292 () List!36328)

(get-info :version)

(assert (=> b!1557972 (= res!1065578 (and (not (= otherKey!62 newKey!135)) (or (not ((_ is Cons!36324) l!1292)) (= (_1!12493 (h!37770 l!1292)) otherKey!62))))))

(declare-fun newValue!135 () B!2416)

(declare-fun b!1557973 () Bool)

(declare-fun isStrictlySorted!968 (List!36328) Bool)

(declare-fun insertStrictlySorted!568 (List!36328 (_ BitVec 64) B!2416) List!36328)

(assert (=> b!1557973 (= e!867862 (not (isStrictlySorted!968 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))

(declare-fun res!1065579 () Bool)

(assert (=> start!133156 (=> (not res!1065579) (not e!867862))))

(assert (=> start!133156 (= res!1065579 (isStrictlySorted!968 l!1292))))

(assert (=> start!133156 e!867862))

(assert (=> start!133156 e!867863))

(assert (=> start!133156 true))

(assert (=> start!133156 tp_is_empty!38421))

(declare-fun b!1557971 () Bool)

(declare-fun res!1065580 () Bool)

(assert (=> b!1557971 (=> (not res!1065580) (not e!867862))))

(declare-fun containsKey!831 (List!36328 (_ BitVec 64)) Bool)

(assert (=> b!1557971 (= res!1065580 (containsKey!831 l!1292 otherKey!62))))

(assert (= (and start!133156 res!1065579) b!1557971))

(assert (= (and b!1557971 res!1065580) b!1557972))

(assert (= (and b!1557972 res!1065578) b!1557973))

(assert (= (and start!133156 ((_ is Cons!36324) l!1292)) b!1557974))

(declare-fun m!1434905 () Bool)

(assert (=> b!1557973 m!1434905))

(assert (=> b!1557973 m!1434905))

(declare-fun m!1434907 () Bool)

(assert (=> b!1557973 m!1434907))

(declare-fun m!1434909 () Bool)

(assert (=> start!133156 m!1434909))

(declare-fun m!1434911 () Bool)

(assert (=> b!1557971 m!1434911))

(check-sat (not b!1557973) (not b!1557971) tp_is_empty!38421 (not start!133156) (not b!1557974))
(check-sat)
(get-model)

(declare-fun d!162569 () Bool)

(declare-fun res!1065594 () Bool)

(declare-fun e!867874 () Bool)

(assert (=> d!162569 (=> res!1065594 e!867874)))

(assert (=> d!162569 (= res!1065594 (or ((_ is Nil!36325) (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)) ((_ is Nil!36325) (t!51055 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162569 (= (isStrictlySorted!968 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)) e!867874)))

(declare-fun b!1557991 () Bool)

(declare-fun e!867875 () Bool)

(assert (=> b!1557991 (= e!867874 e!867875)))

(declare-fun res!1065595 () Bool)

(assert (=> b!1557991 (=> (not res!1065595) (not e!867875))))

(assert (=> b!1557991 (= res!1065595 (bvslt (_1!12493 (h!37770 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))) (_1!12493 (h!37770 (t!51055 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1557992 () Bool)

(assert (=> b!1557992 (= e!867875 (isStrictlySorted!968 (t!51055 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162569 (not res!1065594)) b!1557991))

(assert (= (and b!1557991 res!1065595) b!1557992))

(declare-fun m!1434921 () Bool)

(assert (=> b!1557992 m!1434921))

(assert (=> b!1557973 d!162569))

(declare-fun b!1558063 () Bool)

(declare-fun res!1065626 () Bool)

(declare-fun e!867925 () Bool)

(assert (=> b!1558063 (=> (not res!1065626) (not e!867925))))

(declare-fun lt!670761 () List!36328)

(assert (=> b!1558063 (= res!1065626 (containsKey!831 lt!670761 newKey!135))))

(declare-fun b!1558064 () Bool)

(declare-fun c!144069 () Bool)

(assert (=> b!1558064 (= c!144069 (and ((_ is Cons!36324) l!1292) (bvsgt (_1!12493 (h!37770 l!1292)) newKey!135)))))

(declare-fun e!867926 () List!36328)

(declare-fun e!867924 () List!36328)

(assert (=> b!1558064 (= e!867926 e!867924)))

(declare-fun d!162575 () Bool)

(assert (=> d!162575 e!867925))

(declare-fun res!1065627 () Bool)

(assert (=> d!162575 (=> (not res!1065627) (not e!867925))))

(assert (=> d!162575 (= res!1065627 (isStrictlySorted!968 lt!670761))))

(declare-fun e!867927 () List!36328)

(assert (=> d!162575 (= lt!670761 e!867927)))

(declare-fun c!144068 () Bool)

(assert (=> d!162575 (= c!144068 (and ((_ is Cons!36324) l!1292) (bvslt (_1!12493 (h!37770 l!1292)) newKey!135)))))

(assert (=> d!162575 (isStrictlySorted!968 l!1292)))

(assert (=> d!162575 (= (insertStrictlySorted!568 l!1292 newKey!135 newValue!135) lt!670761)))

(declare-fun bm!71728 () Bool)

(declare-fun call!71731 () List!36328)

(declare-fun call!71732 () List!36328)

(assert (=> bm!71728 (= call!71731 call!71732)))

(declare-fun e!867928 () List!36328)

(declare-fun b!1558065 () Bool)

(assert (=> b!1558065 (= e!867928 (insertStrictlySorted!568 (t!51055 l!1292) newKey!135 newValue!135))))

(declare-fun b!1558066 () Bool)

(declare-fun call!71733 () List!36328)

(assert (=> b!1558066 (= e!867924 call!71733)))

(declare-fun b!1558067 () Bool)

(declare-fun contains!10209 (List!36328 tuple2!24964) Bool)

(assert (=> b!1558067 (= e!867925 (contains!10209 lt!670761 (tuple2!24965 newKey!135 newValue!135)))))

(declare-fun b!1558068 () Bool)

(assert (=> b!1558068 (= e!867927 e!867926)))

(declare-fun c!144070 () Bool)

(assert (=> b!1558068 (= c!144070 (and ((_ is Cons!36324) l!1292) (= (_1!12493 (h!37770 l!1292)) newKey!135)))))

(declare-fun bm!71729 () Bool)

(assert (=> bm!71729 (= call!71733 call!71731)))

(declare-fun b!1558069 () Bool)

(assert (=> b!1558069 (= e!867927 call!71732)))

(declare-fun b!1558070 () Bool)

(assert (=> b!1558070 (= e!867926 call!71731)))

(declare-fun b!1558071 () Bool)

(assert (=> b!1558071 (= e!867924 call!71733)))

(declare-fun b!1558072 () Bool)

(assert (=> b!1558072 (= e!867928 (ite c!144070 (t!51055 l!1292) (ite c!144069 (Cons!36324 (h!37770 l!1292) (t!51055 l!1292)) Nil!36325)))))

(declare-fun bm!71730 () Bool)

(declare-fun $colon$colon!978 (List!36328 tuple2!24964) List!36328)

(assert (=> bm!71730 (= call!71732 ($colon$colon!978 e!867928 (ite c!144068 (h!37770 l!1292) (tuple2!24965 newKey!135 newValue!135))))))

(declare-fun c!144071 () Bool)

(assert (=> bm!71730 (= c!144071 c!144068)))

(assert (= (and d!162575 c!144068) b!1558069))

(assert (= (and d!162575 (not c!144068)) b!1558068))

(assert (= (and b!1558068 c!144070) b!1558070))

(assert (= (and b!1558068 (not c!144070)) b!1558064))

(assert (= (and b!1558064 c!144069) b!1558071))

(assert (= (and b!1558064 (not c!144069)) b!1558066))

(assert (= (or b!1558071 b!1558066) bm!71729))

(assert (= (or b!1558070 bm!71729) bm!71728))

(assert (= (or b!1558069 bm!71728) bm!71730))

(assert (= (and bm!71730 c!144071) b!1558065))

(assert (= (and bm!71730 (not c!144071)) b!1558072))

(assert (= (and d!162575 res!1065627) b!1558063))

(assert (= (and b!1558063 res!1065626) b!1558067))

(declare-fun m!1434933 () Bool)

(assert (=> d!162575 m!1434933))

(assert (=> d!162575 m!1434909))

(declare-fun m!1434935 () Bool)

(assert (=> bm!71730 m!1434935))

(declare-fun m!1434937 () Bool)

(assert (=> b!1558067 m!1434937))

(declare-fun m!1434939 () Bool)

(assert (=> b!1558063 m!1434939))

(declare-fun m!1434941 () Bool)

(assert (=> b!1558065 m!1434941))

(assert (=> b!1557973 d!162575))

(declare-fun d!162587 () Bool)

(declare-fun res!1065628 () Bool)

(declare-fun e!867929 () Bool)

(assert (=> d!162587 (=> res!1065628 e!867929)))

(assert (=> d!162587 (= res!1065628 (or ((_ is Nil!36325) l!1292) ((_ is Nil!36325) (t!51055 l!1292))))))

(assert (=> d!162587 (= (isStrictlySorted!968 l!1292) e!867929)))

(declare-fun b!1558073 () Bool)

(declare-fun e!867930 () Bool)

(assert (=> b!1558073 (= e!867929 e!867930)))

(declare-fun res!1065629 () Bool)

(assert (=> b!1558073 (=> (not res!1065629) (not e!867930))))

(assert (=> b!1558073 (= res!1065629 (bvslt (_1!12493 (h!37770 l!1292)) (_1!12493 (h!37770 (t!51055 l!1292)))))))

(declare-fun b!1558074 () Bool)

(assert (=> b!1558074 (= e!867930 (isStrictlySorted!968 (t!51055 l!1292)))))

(assert (= (and d!162587 (not res!1065628)) b!1558073))

(assert (= (and b!1558073 res!1065629) b!1558074))

(declare-fun m!1434943 () Bool)

(assert (=> b!1558074 m!1434943))

(assert (=> start!133156 d!162587))

(declare-fun d!162589 () Bool)

(declare-fun res!1065642 () Bool)

(declare-fun e!867943 () Bool)

(assert (=> d!162589 (=> res!1065642 e!867943)))

(assert (=> d!162589 (= res!1065642 (and ((_ is Cons!36324) l!1292) (= (_1!12493 (h!37770 l!1292)) otherKey!62)))))

(assert (=> d!162589 (= (containsKey!831 l!1292 otherKey!62) e!867943)))

(declare-fun b!1558095 () Bool)

(declare-fun e!867944 () Bool)

(assert (=> b!1558095 (= e!867943 e!867944)))

(declare-fun res!1065643 () Bool)

(assert (=> b!1558095 (=> (not res!1065643) (not e!867944))))

(assert (=> b!1558095 (= res!1065643 (and (or (not ((_ is Cons!36324) l!1292)) (bvsle (_1!12493 (h!37770 l!1292)) otherKey!62)) ((_ is Cons!36324) l!1292) (bvslt (_1!12493 (h!37770 l!1292)) otherKey!62)))))

(declare-fun b!1558096 () Bool)

(assert (=> b!1558096 (= e!867944 (containsKey!831 (t!51055 l!1292) otherKey!62))))

(assert (= (and d!162589 (not res!1065642)) b!1558095))

(assert (= (and b!1558095 res!1065643) b!1558096))

(declare-fun m!1434945 () Bool)

(assert (=> b!1558096 m!1434945))

(assert (=> b!1557971 d!162589))

(declare-fun b!1558101 () Bool)

(declare-fun e!867947 () Bool)

(declare-fun tp!112593 () Bool)

(assert (=> b!1558101 (= e!867947 (and tp_is_empty!38421 tp!112593))))

(assert (=> b!1557974 (= tp!112587 e!867947)))

(assert (= (and b!1557974 ((_ is Cons!36324) (t!51055 l!1292))) b!1558101))

(check-sat (not b!1558063) (not b!1558074) (not b!1557992) (not b!1558101) (not b!1558065) (not b!1558067) (not b!1558096) (not bm!71730) tp_is_empty!38421 (not d!162575))
(check-sat)
