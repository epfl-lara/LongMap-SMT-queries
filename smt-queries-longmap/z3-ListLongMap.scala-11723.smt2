; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137234 () Bool)

(assert start!137234)

(declare-fun b!1580551 () Bool)

(declare-fun e!881804 () Bool)

(declare-datatypes ((B!2678 0))(
  ( (B!2679 (val!19701 Int)) )
))
(declare-datatypes ((tuple2!25608 0))(
  ( (tuple2!25609 (_1!12815 (_ BitVec 64)) (_2!12815 B!2678)) )
))
(declare-datatypes ((List!36862 0))(
  ( (Nil!36859) (Cons!36858 (h!38402 tuple2!25608) (t!51768 List!36862)) )
))
(declare-datatypes ((tuple2!25610 0))(
  ( (tuple2!25611 (_1!12816 tuple2!25608) (_2!12816 List!36862)) )
))
(declare-datatypes ((Option!913 0))(
  ( (Some!912 (v!22413 tuple2!25610)) (None!911) )
))
(declare-fun lt!676546 () Option!913)

(get-info :version)

(declare-fun get!26800 (Option!913) tuple2!25610)

(assert (=> b!1580551 (= e!881804 (not ((_ is Nil!36859) (_2!12816 (get!26800 lt!676546)))))))

(declare-fun res!1079852 () Bool)

(declare-fun e!881802 () Bool)

(assert (=> start!137234 (=> (not res!1079852) (not e!881802))))

(declare-fun l!1390 () List!36862)

(declare-fun isStrictlySorted!1077 (List!36862) Bool)

(assert (=> start!137234 (= res!1079852 (isStrictlySorted!1077 l!1390))))

(assert (=> start!137234 e!881802))

(declare-fun e!881803 () Bool)

(assert (=> start!137234 e!881803))

(assert (=> start!137234 true))

(declare-fun tp_is_empty!39223 () Bool)

(assert (=> start!137234 tp_is_empty!39223))

(declare-fun b!1580552 () Bool)

(declare-fun e!881800 () Bool)

(assert (=> b!1580552 (= e!881802 e!881800)))

(declare-fun res!1079850 () Bool)

(assert (=> b!1580552 (=> (not res!1079850) (not e!881800))))

(declare-fun lt!676547 () tuple2!25608)

(declare-fun contains!10448 (List!36862 tuple2!25608) Bool)

(assert (=> b!1580552 (= res!1079850 (contains!10448 l!1390 lt!676547))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2678)

(assert (=> b!1580552 (= lt!676547 (tuple2!25609 key!405 value!194))))

(declare-fun b!1580553 () Bool)

(declare-fun res!1079851 () Bool)

(declare-fun e!881801 () Bool)

(assert (=> b!1580553 (=> (not res!1079851) (not e!881801))))

(assert (=> b!1580553 (= res!1079851 (and ((_ is Cons!36858) l!1390) (= (_1!12815 (h!38402 l!1390)) key!405)))))

(declare-fun b!1580554 () Bool)

(declare-fun res!1079846 () Bool)

(assert (=> b!1580554 (=> (not res!1079846) (not e!881802))))

(declare-fun containsKey!923 (List!36862 (_ BitVec 64)) Bool)

(assert (=> b!1580554 (= res!1079846 (containsKey!923 l!1390 key!405))))

(declare-fun b!1580555 () Bool)

(declare-fun tp!114525 () Bool)

(assert (=> b!1580555 (= e!881803 (and tp_is_empty!39223 tp!114525))))

(declare-fun b!1580556 () Bool)

(declare-datatypes ((Option!914 0))(
  ( (Some!913 (v!22414 B!2678)) (None!912) )
))
(declare-fun getValueByKey!820 (List!36862 (_ BitVec 64)) Option!914)

(assert (=> b!1580556 (= e!881801 (not (= (getValueByKey!820 l!1390 key!405) (Some!913 value!194))))))

(assert (=> b!1580556 (not (contains!10448 (t!51768 l!1390) lt!676547))))

(declare-datatypes ((Unit!52054 0))(
  ( (Unit!52055) )
))
(declare-fun lt!676545 () Unit!52054)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!4 (List!36862 (_ BitVec 64) B!2678) Unit!52054)

(assert (=> b!1580556 (= lt!676545 (lemmaNotContainsKeyThenNotContainsTuple!4 (t!51768 l!1390) key!405 value!194))))

(declare-fun b!1580557 () Bool)

(assert (=> b!1580557 (= e!881800 e!881801)))

(declare-fun res!1079849 () Bool)

(assert (=> b!1580557 (=> (not res!1079849) (not e!881801))))

(assert (=> b!1580557 (= res!1079849 e!881804)))

(declare-fun res!1079848 () Bool)

(assert (=> b!1580557 (=> res!1079848 e!881804)))

(declare-fun isEmpty!1176 (Option!913) Bool)

(assert (=> b!1580557 (= res!1079848 (isEmpty!1176 lt!676546))))

(declare-fun unapply!88 (List!36862) Option!913)

(assert (=> b!1580557 (= lt!676546 (unapply!88 l!1390))))

(declare-fun b!1580558 () Bool)

(declare-fun res!1079847 () Bool)

(assert (=> b!1580558 (=> (not res!1079847) (not e!881801))))

(assert (=> b!1580558 (= res!1079847 (not (containsKey!923 (t!51768 l!1390) key!405)))))

(declare-fun b!1580559 () Bool)

(declare-fun res!1079853 () Bool)

(assert (=> b!1580559 (=> (not res!1079853) (not e!881801))))

(assert (=> b!1580559 (= res!1079853 (isStrictlySorted!1077 (t!51768 l!1390)))))

(assert (= (and start!137234 res!1079852) b!1580554))

(assert (= (and b!1580554 res!1079846) b!1580552))

(assert (= (and b!1580552 res!1079850) b!1580557))

(assert (= (and b!1580557 (not res!1079848)) b!1580551))

(assert (= (and b!1580557 res!1079849) b!1580553))

(assert (= (and b!1580553 res!1079851) b!1580559))

(assert (= (and b!1580559 res!1079853) b!1580558))

(assert (= (and b!1580558 res!1079847) b!1580556))

(assert (= (and start!137234 ((_ is Cons!36858) l!1390)) b!1580555))

(declare-fun m!1451197 () Bool)

(assert (=> b!1580556 m!1451197))

(declare-fun m!1451199 () Bool)

(assert (=> b!1580556 m!1451199))

(declare-fun m!1451201 () Bool)

(assert (=> b!1580556 m!1451201))

(declare-fun m!1451203 () Bool)

(assert (=> start!137234 m!1451203))

(declare-fun m!1451205 () Bool)

(assert (=> b!1580554 m!1451205))

(declare-fun m!1451207 () Bool)

(assert (=> b!1580557 m!1451207))

(declare-fun m!1451209 () Bool)

(assert (=> b!1580557 m!1451209))

(declare-fun m!1451211 () Bool)

(assert (=> b!1580551 m!1451211))

(declare-fun m!1451213 () Bool)

(assert (=> b!1580552 m!1451213))

(declare-fun m!1451215 () Bool)

(assert (=> b!1580558 m!1451215))

(declare-fun m!1451217 () Bool)

(assert (=> b!1580559 m!1451217))

(check-sat (not b!1580554) (not b!1580551) (not b!1580556) tp_is_empty!39223 (not b!1580558) (not b!1580555) (not b!1580557) (not b!1580559) (not start!137234) (not b!1580552))
(check-sat)
(get-model)

(declare-fun d!166311 () Bool)

(declare-fun res!1079906 () Bool)

(declare-fun e!881839 () Bool)

(assert (=> d!166311 (=> res!1079906 e!881839)))

(assert (=> d!166311 (= res!1079906 (and ((_ is Cons!36858) l!1390) (= (_1!12815 (h!38402 l!1390)) key!405)))))

(assert (=> d!166311 (= (containsKey!923 l!1390 key!405) e!881839)))

(declare-fun b!1580618 () Bool)

(declare-fun e!881840 () Bool)

(assert (=> b!1580618 (= e!881839 e!881840)))

(declare-fun res!1079907 () Bool)

(assert (=> b!1580618 (=> (not res!1079907) (not e!881840))))

(assert (=> b!1580618 (= res!1079907 (and (or (not ((_ is Cons!36858) l!1390)) (bvsle (_1!12815 (h!38402 l!1390)) key!405)) ((_ is Cons!36858) l!1390) (bvslt (_1!12815 (h!38402 l!1390)) key!405)))))

(declare-fun b!1580619 () Bool)

(assert (=> b!1580619 (= e!881840 (containsKey!923 (t!51768 l!1390) key!405))))

(assert (= (and d!166311 (not res!1079906)) b!1580618))

(assert (= (and b!1580618 res!1079907) b!1580619))

(assert (=> b!1580619 m!1451215))

(assert (=> b!1580554 d!166311))

(declare-fun d!166313 () Bool)

(declare-fun res!1079912 () Bool)

(declare-fun e!881845 () Bool)

(assert (=> d!166313 (=> res!1079912 e!881845)))

(assert (=> d!166313 (= res!1079912 (or ((_ is Nil!36859) l!1390) ((_ is Nil!36859) (t!51768 l!1390))))))

(assert (=> d!166313 (= (isStrictlySorted!1077 l!1390) e!881845)))

(declare-fun b!1580624 () Bool)

(declare-fun e!881846 () Bool)

(assert (=> b!1580624 (= e!881845 e!881846)))

(declare-fun res!1079913 () Bool)

(assert (=> b!1580624 (=> (not res!1079913) (not e!881846))))

(assert (=> b!1580624 (= res!1079913 (bvslt (_1!12815 (h!38402 l!1390)) (_1!12815 (h!38402 (t!51768 l!1390)))))))

(declare-fun b!1580625 () Bool)

(assert (=> b!1580625 (= e!881846 (isStrictlySorted!1077 (t!51768 l!1390)))))

(assert (= (and d!166313 (not res!1079912)) b!1580624))

(assert (= (and b!1580624 res!1079913) b!1580625))

(assert (=> b!1580625 m!1451217))

(assert (=> start!137234 d!166313))

(declare-fun d!166319 () Bool)

(declare-fun res!1079914 () Bool)

(declare-fun e!881847 () Bool)

(assert (=> d!166319 (=> res!1079914 e!881847)))

(assert (=> d!166319 (= res!1079914 (or ((_ is Nil!36859) (t!51768 l!1390)) ((_ is Nil!36859) (t!51768 (t!51768 l!1390)))))))

(assert (=> d!166319 (= (isStrictlySorted!1077 (t!51768 l!1390)) e!881847)))

(declare-fun b!1580626 () Bool)

(declare-fun e!881848 () Bool)

(assert (=> b!1580626 (= e!881847 e!881848)))

(declare-fun res!1079915 () Bool)

(assert (=> b!1580626 (=> (not res!1079915) (not e!881848))))

(assert (=> b!1580626 (= res!1079915 (bvslt (_1!12815 (h!38402 (t!51768 l!1390))) (_1!12815 (h!38402 (t!51768 (t!51768 l!1390))))))))

(declare-fun b!1580627 () Bool)

(assert (=> b!1580627 (= e!881848 (isStrictlySorted!1077 (t!51768 (t!51768 l!1390))))))

(assert (= (and d!166319 (not res!1079914)) b!1580626))

(assert (= (and b!1580626 res!1079915) b!1580627))

(declare-fun m!1451263 () Bool)

(assert (=> b!1580627 m!1451263))

(assert (=> b!1580559 d!166319))

(declare-fun d!166321 () Bool)

(declare-fun res!1079920 () Bool)

(declare-fun e!881853 () Bool)

(assert (=> d!166321 (=> res!1079920 e!881853)))

(assert (=> d!166321 (= res!1079920 (and ((_ is Cons!36858) (t!51768 l!1390)) (= (_1!12815 (h!38402 (t!51768 l!1390))) key!405)))))

(assert (=> d!166321 (= (containsKey!923 (t!51768 l!1390) key!405) e!881853)))

(declare-fun b!1580634 () Bool)

(declare-fun e!881854 () Bool)

(assert (=> b!1580634 (= e!881853 e!881854)))

(declare-fun res!1079921 () Bool)

(assert (=> b!1580634 (=> (not res!1079921) (not e!881854))))

(assert (=> b!1580634 (= res!1079921 (and (or (not ((_ is Cons!36858) (t!51768 l!1390))) (bvsle (_1!12815 (h!38402 (t!51768 l!1390))) key!405)) ((_ is Cons!36858) (t!51768 l!1390)) (bvslt (_1!12815 (h!38402 (t!51768 l!1390))) key!405)))))

(declare-fun b!1580635 () Bool)

(assert (=> b!1580635 (= e!881854 (containsKey!923 (t!51768 (t!51768 l!1390)) key!405))))

(assert (= (and d!166321 (not res!1079920)) b!1580634))

(assert (= (and b!1580634 res!1079921) b!1580635))

(declare-fun m!1451265 () Bool)

(assert (=> b!1580635 m!1451265))

(assert (=> b!1580558 d!166321))

(declare-fun d!166323 () Bool)

(declare-fun lt!676571 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!831 (List!36862) (InoxSet tuple2!25608))

(assert (=> d!166323 (= lt!676571 (select (content!831 l!1390) lt!676547))))

(declare-fun e!881871 () Bool)

(assert (=> d!166323 (= lt!676571 e!881871)))

(declare-fun res!1079932 () Bool)

(assert (=> d!166323 (=> (not res!1079932) (not e!881871))))

(assert (=> d!166323 (= res!1079932 ((_ is Cons!36858) l!1390))))

(assert (=> d!166323 (= (contains!10448 l!1390 lt!676547) lt!676571)))

(declare-fun b!1580656 () Bool)

(declare-fun e!881872 () Bool)

(assert (=> b!1580656 (= e!881871 e!881872)))

(declare-fun res!1079933 () Bool)

(assert (=> b!1580656 (=> res!1079933 e!881872)))

(assert (=> b!1580656 (= res!1079933 (= (h!38402 l!1390) lt!676547))))

(declare-fun b!1580657 () Bool)

(assert (=> b!1580657 (= e!881872 (contains!10448 (t!51768 l!1390) lt!676547))))

(assert (= (and d!166323 res!1079932) b!1580656))

(assert (= (and b!1580656 (not res!1079933)) b!1580657))

(declare-fun m!1451273 () Bool)

(assert (=> d!166323 m!1451273))

(declare-fun m!1451275 () Bool)

(assert (=> d!166323 m!1451275))

(assert (=> b!1580657 m!1451199))

(assert (=> b!1580552 d!166323))

(declare-fun d!166329 () Bool)

(assert (=> d!166329 (= (isEmpty!1176 lt!676546) (not ((_ is Some!912) lt!676546)))))

(assert (=> b!1580557 d!166329))

(declare-fun d!166333 () Bool)

(assert (=> d!166333 (= (unapply!88 l!1390) (ite ((_ is Nil!36859) l!1390) None!911 (Some!912 (tuple2!25611 (h!38402 l!1390) (t!51768 l!1390)))))))

(assert (=> b!1580557 d!166333))

(declare-fun d!166335 () Bool)

(assert (=> d!166335 (= (get!26800 lt!676546) (v!22413 lt!676546))))

(assert (=> b!1580551 d!166335))

(declare-fun d!166339 () Bool)

(declare-fun c!146488 () Bool)

(assert (=> d!166339 (= c!146488 (and ((_ is Cons!36858) l!1390) (= (_1!12815 (h!38402 l!1390)) key!405)))))

(declare-fun e!881896 () Option!914)

(assert (=> d!166339 (= (getValueByKey!820 l!1390 key!405) e!881896)))

(declare-fun b!1580694 () Bool)

(declare-fun e!881897 () Option!914)

(assert (=> b!1580694 (= e!881897 None!912)))

(declare-fun b!1580691 () Bool)

(assert (=> b!1580691 (= e!881896 (Some!913 (_2!12815 (h!38402 l!1390))))))

(declare-fun b!1580693 () Bool)

(assert (=> b!1580693 (= e!881897 (getValueByKey!820 (t!51768 l!1390) key!405))))

(declare-fun b!1580692 () Bool)

(assert (=> b!1580692 (= e!881896 e!881897)))

(declare-fun c!146489 () Bool)

(assert (=> b!1580692 (= c!146489 (and ((_ is Cons!36858) l!1390) (not (= (_1!12815 (h!38402 l!1390)) key!405))))))

(assert (= (and d!166339 c!146488) b!1580691))

(assert (= (and d!166339 (not c!146488)) b!1580692))

(assert (= (and b!1580692 c!146489) b!1580693))

(assert (= (and b!1580692 (not c!146489)) b!1580694))

(declare-fun m!1451295 () Bool)

(assert (=> b!1580693 m!1451295))

(assert (=> b!1580556 d!166339))

(declare-fun d!166347 () Bool)

(declare-fun lt!676579 () Bool)

(assert (=> d!166347 (= lt!676579 (select (content!831 (t!51768 l!1390)) lt!676547))))

(declare-fun e!881898 () Bool)

(assert (=> d!166347 (= lt!676579 e!881898)))

(declare-fun res!1079947 () Bool)

(assert (=> d!166347 (=> (not res!1079947) (not e!881898))))

(assert (=> d!166347 (= res!1079947 ((_ is Cons!36858) (t!51768 l!1390)))))

(assert (=> d!166347 (= (contains!10448 (t!51768 l!1390) lt!676547) lt!676579)))

(declare-fun b!1580695 () Bool)

(declare-fun e!881899 () Bool)

(assert (=> b!1580695 (= e!881898 e!881899)))

(declare-fun res!1079948 () Bool)

(assert (=> b!1580695 (=> res!1079948 e!881899)))

(assert (=> b!1580695 (= res!1079948 (= (h!38402 (t!51768 l!1390)) lt!676547))))

(declare-fun b!1580696 () Bool)

(assert (=> b!1580696 (= e!881899 (contains!10448 (t!51768 (t!51768 l!1390)) lt!676547))))

(assert (= (and d!166347 res!1079947) b!1580695))

(assert (= (and b!1580695 (not res!1079948)) b!1580696))

(declare-fun m!1451297 () Bool)

(assert (=> d!166347 m!1451297))

(declare-fun m!1451299 () Bool)

(assert (=> d!166347 m!1451299))

(declare-fun m!1451301 () Bool)

(assert (=> b!1580696 m!1451301))

(assert (=> b!1580556 d!166347))

(declare-fun d!166349 () Bool)

(assert (=> d!166349 (not (contains!10448 (t!51768 l!1390) (tuple2!25609 key!405 value!194)))))

(declare-fun lt!676585 () Unit!52054)

(declare-fun choose!2106 (List!36862 (_ BitVec 64) B!2678) Unit!52054)

(assert (=> d!166349 (= lt!676585 (choose!2106 (t!51768 l!1390) key!405 value!194))))

(declare-fun e!881913 () Bool)

(assert (=> d!166349 e!881913))

(declare-fun res!1079962 () Bool)

(assert (=> d!166349 (=> (not res!1079962) (not e!881913))))

(assert (=> d!166349 (= res!1079962 (isStrictlySorted!1077 (t!51768 l!1390)))))

(assert (=> d!166349 (= (lemmaNotContainsKeyThenNotContainsTuple!4 (t!51768 l!1390) key!405 value!194) lt!676585)))

(declare-fun b!1580710 () Bool)

(assert (=> b!1580710 (= e!881913 (not (containsKey!923 (t!51768 l!1390) key!405)))))

(assert (= (and d!166349 res!1079962) b!1580710))

(declare-fun m!1451307 () Bool)

(assert (=> d!166349 m!1451307))

(declare-fun m!1451309 () Bool)

(assert (=> d!166349 m!1451309))

(assert (=> d!166349 m!1451217))

(assert (=> b!1580710 m!1451215))

(assert (=> b!1580556 d!166349))

(declare-fun b!1580721 () Bool)

(declare-fun e!881922 () Bool)

(declare-fun tp!114534 () Bool)

(assert (=> b!1580721 (= e!881922 (and tp_is_empty!39223 tp!114534))))

(assert (=> b!1580555 (= tp!114525 e!881922)))

(assert (= (and b!1580555 ((_ is Cons!36858) (t!51768 l!1390))) b!1580721))

(check-sat (not b!1580619) (not b!1580696) (not b!1580635) (not b!1580657) (not b!1580710) (not b!1580693) (not b!1580721) (not b!1580625) (not b!1580627) tp_is_empty!39223 (not d!166349) (not d!166347) (not d!166323))
(check-sat)
