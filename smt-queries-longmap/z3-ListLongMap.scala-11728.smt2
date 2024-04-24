; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137852 () Bool)

(assert start!137852)

(declare-fun b!1583955 () Bool)

(declare-fun res!1081348 () Bool)

(declare-fun e!883983 () Bool)

(assert (=> b!1583955 (=> (not res!1081348) (not e!883983))))

(declare-datatypes ((B!2696 0))(
  ( (B!2697 (val!19710 Int)) )
))
(declare-datatypes ((tuple2!25636 0))(
  ( (tuple2!25637 (_1!12829 (_ BitVec 64)) (_2!12829 B!2696)) )
))
(declare-datatypes ((List!36862 0))(
  ( (Nil!36859) (Cons!36858 (h!38419 tuple2!25636) (t!51768 List!36862)) )
))
(declare-fun l!1390 () List!36862)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!935 (List!36862 (_ BitVec 64)) Bool)

(assert (=> b!1583955 (= res!1081348 (containsKey!935 l!1390 key!405))))

(declare-fun b!1583956 () Bool)

(declare-fun e!883981 () Bool)

(declare-fun e!883984 () Bool)

(assert (=> b!1583956 (= e!883981 e!883984)))

(declare-fun res!1081355 () Bool)

(assert (=> b!1583956 (=> (not res!1081355) (not e!883984))))

(declare-fun e!883982 () Bool)

(assert (=> b!1583956 (= res!1081355 e!883982)))

(declare-fun res!1081347 () Bool)

(assert (=> b!1583956 (=> res!1081347 e!883982)))

(declare-datatypes ((tuple2!25638 0))(
  ( (tuple2!25639 (_1!12830 tuple2!25636) (_2!12830 List!36862)) )
))
(declare-datatypes ((Option!918 0))(
  ( (Some!917 (v!22430 tuple2!25638)) (None!916) )
))
(declare-fun lt!677859 () Option!918)

(declare-fun isEmpty!1184 (Option!918) Bool)

(assert (=> b!1583956 (= res!1081347 (isEmpty!1184 lt!677859))))

(declare-fun unapply!97 (List!36862) Option!918)

(assert (=> b!1583956 (= lt!677859 (unapply!97 l!1390))))

(declare-fun b!1583957 () Bool)

(declare-fun res!1081350 () Bool)

(assert (=> b!1583957 (=> (not res!1081350) (not e!883984))))

(declare-fun lt!677860 () tuple2!25636)

(declare-fun contains!10547 (List!36862 tuple2!25636) Bool)

(assert (=> b!1583957 (= res!1081350 (contains!10547 (t!51768 l!1390) lt!677860))))

(declare-datatypes ((Option!919 0))(
  ( (Some!918 (v!22431 B!2696)) (None!917) )
))
(declare-fun lt!677862 () Option!919)

(declare-fun b!1583958 () Bool)

(declare-fun getValueByKey!816 (List!36862 (_ BitVec 64)) Option!919)

(assert (=> b!1583958 (= e!883984 (not (= (getValueByKey!816 l!1390 key!405) lt!677862)))))

(assert (=> b!1583958 (= (getValueByKey!816 (t!51768 l!1390) key!405) lt!677862)))

(declare-fun value!194 () B!2696)

(assert (=> b!1583958 (= lt!677862 (Some!918 value!194))))

(declare-datatypes ((Unit!52159 0))(
  ( (Unit!52160) )
))
(declare-fun lt!677861 () Unit!52159)

(declare-fun lemmaContainsTupThenGetReturnValue!399 (List!36862 (_ BitVec 64) B!2696) Unit!52159)

(assert (=> b!1583958 (= lt!677861 (lemmaContainsTupThenGetReturnValue!399 (t!51768 l!1390) key!405 value!194))))

(declare-fun res!1081354 () Bool)

(assert (=> start!137852 (=> (not res!1081354) (not e!883983))))

(declare-fun isStrictlySorted!1076 (List!36862) Bool)

(assert (=> start!137852 (= res!1081354 (isStrictlySorted!1076 l!1390))))

(assert (=> start!137852 e!883983))

(declare-fun e!883985 () Bool)

(assert (=> start!137852 e!883985))

(assert (=> start!137852 true))

(declare-fun tp_is_empty!39241 () Bool)

(assert (=> start!137852 tp_is_empty!39241))

(declare-fun b!1583959 () Bool)

(declare-fun res!1081351 () Bool)

(assert (=> b!1583959 (=> (not res!1081351) (not e!883984))))

(assert (=> b!1583959 (= res!1081351 (containsKey!935 (t!51768 l!1390) key!405))))

(declare-fun b!1583960 () Bool)

(get-info :version)

(declare-fun get!26862 (Option!918) tuple2!25638)

(assert (=> b!1583960 (= e!883982 (not ((_ is Nil!36859) (_2!12830 (get!26862 lt!677859)))))))

(declare-fun b!1583961 () Bool)

(declare-fun tp!114579 () Bool)

(assert (=> b!1583961 (= e!883985 (and tp_is_empty!39241 tp!114579))))

(declare-fun b!1583962 () Bool)

(declare-fun res!1081352 () Bool)

(assert (=> b!1583962 (=> (not res!1081352) (not e!883984))))

(assert (=> b!1583962 (= res!1081352 (and (or (not ((_ is Cons!36858) l!1390)) (not (= (_1!12829 (h!38419 l!1390)) key!405))) ((_ is Cons!36858) l!1390)))))

(declare-fun b!1583963 () Bool)

(declare-fun res!1081353 () Bool)

(assert (=> b!1583963 (=> (not res!1081353) (not e!883984))))

(assert (=> b!1583963 (= res!1081353 (isStrictlySorted!1076 (t!51768 l!1390)))))

(declare-fun b!1583964 () Bool)

(assert (=> b!1583964 (= e!883983 e!883981)))

(declare-fun res!1081349 () Bool)

(assert (=> b!1583964 (=> (not res!1081349) (not e!883981))))

(assert (=> b!1583964 (= res!1081349 (contains!10547 l!1390 lt!677860))))

(assert (=> b!1583964 (= lt!677860 (tuple2!25637 key!405 value!194))))

(assert (= (and start!137852 res!1081354) b!1583955))

(assert (= (and b!1583955 res!1081348) b!1583964))

(assert (= (and b!1583964 res!1081349) b!1583956))

(assert (= (and b!1583956 (not res!1081347)) b!1583960))

(assert (= (and b!1583956 res!1081355) b!1583962))

(assert (= (and b!1583962 res!1081352) b!1583963))

(assert (= (and b!1583963 res!1081353) b!1583959))

(assert (= (and b!1583959 res!1081351) b!1583957))

(assert (= (and b!1583957 res!1081350) b!1583958))

(assert (= (and start!137852 ((_ is Cons!36858) l!1390)) b!1583961))

(declare-fun m!1454739 () Bool)

(assert (=> b!1583964 m!1454739))

(declare-fun m!1454741 () Bool)

(assert (=> b!1583956 m!1454741))

(declare-fun m!1454743 () Bool)

(assert (=> b!1583956 m!1454743))

(declare-fun m!1454745 () Bool)

(assert (=> b!1583958 m!1454745))

(declare-fun m!1454747 () Bool)

(assert (=> b!1583958 m!1454747))

(declare-fun m!1454749 () Bool)

(assert (=> b!1583958 m!1454749))

(declare-fun m!1454751 () Bool)

(assert (=> b!1583955 m!1454751))

(declare-fun m!1454753 () Bool)

(assert (=> b!1583957 m!1454753))

(declare-fun m!1454755 () Bool)

(assert (=> b!1583960 m!1454755))

(declare-fun m!1454757 () Bool)

(assert (=> b!1583963 m!1454757))

(declare-fun m!1454759 () Bool)

(assert (=> start!137852 m!1454759))

(declare-fun m!1454761 () Bool)

(assert (=> b!1583959 m!1454761))

(check-sat (not b!1583957) tp_is_empty!39241 (not b!1583958) (not start!137852) (not b!1583961) (not b!1583955) (not b!1583963) (not b!1583960) (not b!1583959) (not b!1583956) (not b!1583964))
(check-sat)
(get-model)

(declare-fun d!167471 () Bool)

(declare-fun res!1081414 () Bool)

(declare-fun e!884020 () Bool)

(assert (=> d!167471 (=> res!1081414 e!884020)))

(assert (=> d!167471 (= res!1081414 (or ((_ is Nil!36859) (t!51768 l!1390)) ((_ is Nil!36859) (t!51768 (t!51768 l!1390)))))))

(assert (=> d!167471 (= (isStrictlySorted!1076 (t!51768 l!1390)) e!884020)))

(declare-fun b!1584029 () Bool)

(declare-fun e!884021 () Bool)

(assert (=> b!1584029 (= e!884020 e!884021)))

(declare-fun res!1081415 () Bool)

(assert (=> b!1584029 (=> (not res!1081415) (not e!884021))))

(assert (=> b!1584029 (= res!1081415 (bvslt (_1!12829 (h!38419 (t!51768 l!1390))) (_1!12829 (h!38419 (t!51768 (t!51768 l!1390))))))))

(declare-fun b!1584030 () Bool)

(assert (=> b!1584030 (= e!884021 (isStrictlySorted!1076 (t!51768 (t!51768 l!1390))))))

(assert (= (and d!167471 (not res!1081414)) b!1584029))

(assert (= (and b!1584029 res!1081415) b!1584030))

(declare-fun m!1454811 () Bool)

(assert (=> b!1584030 m!1454811))

(assert (=> b!1583963 d!167471))

(declare-fun d!167473 () Bool)

(declare-fun lt!677889 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!835 (List!36862) (InoxSet tuple2!25636))

(assert (=> d!167473 (= lt!677889 (select (content!835 (t!51768 l!1390)) lt!677860))))

(declare-fun e!884026 () Bool)

(assert (=> d!167473 (= lt!677889 e!884026)))

(declare-fun res!1081420 () Bool)

(assert (=> d!167473 (=> (not res!1081420) (not e!884026))))

(assert (=> d!167473 (= res!1081420 ((_ is Cons!36858) (t!51768 l!1390)))))

(assert (=> d!167473 (= (contains!10547 (t!51768 l!1390) lt!677860) lt!677889)))

(declare-fun b!1584035 () Bool)

(declare-fun e!884027 () Bool)

(assert (=> b!1584035 (= e!884026 e!884027)))

(declare-fun res!1081421 () Bool)

(assert (=> b!1584035 (=> res!1081421 e!884027)))

(assert (=> b!1584035 (= res!1081421 (= (h!38419 (t!51768 l!1390)) lt!677860))))

(declare-fun b!1584036 () Bool)

(assert (=> b!1584036 (= e!884027 (contains!10547 (t!51768 (t!51768 l!1390)) lt!677860))))

(assert (= (and d!167473 res!1081420) b!1584035))

(assert (= (and b!1584035 (not res!1081421)) b!1584036))

(declare-fun m!1454813 () Bool)

(assert (=> d!167473 m!1454813))

(declare-fun m!1454815 () Bool)

(assert (=> d!167473 m!1454815))

(declare-fun m!1454817 () Bool)

(assert (=> b!1584036 m!1454817))

(assert (=> b!1583957 d!167473))

(declare-fun d!167483 () Bool)

(assert (=> d!167483 (= (isEmpty!1184 lt!677859) (not ((_ is Some!917) lt!677859)))))

(assert (=> b!1583956 d!167483))

(declare-fun d!167485 () Bool)

(assert (=> d!167485 (= (unapply!97 l!1390) (ite ((_ is Nil!36859) l!1390) None!916 (Some!917 (tuple2!25639 (h!38419 l!1390) (t!51768 l!1390)))))))

(assert (=> b!1583956 d!167485))

(declare-fun d!167487 () Bool)

(declare-fun res!1081432 () Bool)

(declare-fun e!884038 () Bool)

(assert (=> d!167487 (=> res!1081432 e!884038)))

(assert (=> d!167487 (= res!1081432 (or ((_ is Nil!36859) l!1390) ((_ is Nil!36859) (t!51768 l!1390))))))

(assert (=> d!167487 (= (isStrictlySorted!1076 l!1390) e!884038)))

(declare-fun b!1584047 () Bool)

(declare-fun e!884039 () Bool)

(assert (=> b!1584047 (= e!884038 e!884039)))

(declare-fun res!1081433 () Bool)

(assert (=> b!1584047 (=> (not res!1081433) (not e!884039))))

(assert (=> b!1584047 (= res!1081433 (bvslt (_1!12829 (h!38419 l!1390)) (_1!12829 (h!38419 (t!51768 l!1390)))))))

(declare-fun b!1584048 () Bool)

(assert (=> b!1584048 (= e!884039 (isStrictlySorted!1076 (t!51768 l!1390)))))

(assert (= (and d!167487 (not res!1081432)) b!1584047))

(assert (= (and b!1584047 res!1081433) b!1584048))

(assert (=> b!1584048 m!1454757))

(assert (=> start!137852 d!167487))

(declare-fun d!167491 () Bool)

(declare-fun res!1081450 () Bool)

(declare-fun e!884056 () Bool)

(assert (=> d!167491 (=> res!1081450 e!884056)))

(assert (=> d!167491 (= res!1081450 (and ((_ is Cons!36858) l!1390) (= (_1!12829 (h!38419 l!1390)) key!405)))))

(assert (=> d!167491 (= (containsKey!935 l!1390 key!405) e!884056)))

(declare-fun b!1584065 () Bool)

(declare-fun e!884057 () Bool)

(assert (=> b!1584065 (= e!884056 e!884057)))

(declare-fun res!1081451 () Bool)

(assert (=> b!1584065 (=> (not res!1081451) (not e!884057))))

(assert (=> b!1584065 (= res!1081451 (and (or (not ((_ is Cons!36858) l!1390)) (bvsle (_1!12829 (h!38419 l!1390)) key!405)) ((_ is Cons!36858) l!1390) (bvslt (_1!12829 (h!38419 l!1390)) key!405)))))

(declare-fun b!1584066 () Bool)

(assert (=> b!1584066 (= e!884057 (containsKey!935 (t!51768 l!1390) key!405))))

(assert (= (and d!167491 (not res!1081450)) b!1584065))

(assert (= (and b!1584065 res!1081451) b!1584066))

(assert (=> b!1584066 m!1454761))

(assert (=> b!1583955 d!167491))

(declare-fun d!167497 () Bool)

(assert (=> d!167497 (= (get!26862 lt!677859) (v!22430 lt!677859))))

(assert (=> b!1583960 d!167497))

(declare-fun d!167501 () Bool)

(declare-fun res!1081456 () Bool)

(declare-fun e!884062 () Bool)

(assert (=> d!167501 (=> res!1081456 e!884062)))

(assert (=> d!167501 (= res!1081456 (and ((_ is Cons!36858) (t!51768 l!1390)) (= (_1!12829 (h!38419 (t!51768 l!1390))) key!405)))))

(assert (=> d!167501 (= (containsKey!935 (t!51768 l!1390) key!405) e!884062)))

(declare-fun b!1584071 () Bool)

(declare-fun e!884063 () Bool)

(assert (=> b!1584071 (= e!884062 e!884063)))

(declare-fun res!1081457 () Bool)

(assert (=> b!1584071 (=> (not res!1081457) (not e!884063))))

(assert (=> b!1584071 (= res!1081457 (and (or (not ((_ is Cons!36858) (t!51768 l!1390))) (bvsle (_1!12829 (h!38419 (t!51768 l!1390))) key!405)) ((_ is Cons!36858) (t!51768 l!1390)) (bvslt (_1!12829 (h!38419 (t!51768 l!1390))) key!405)))))

(declare-fun b!1584072 () Bool)

(assert (=> b!1584072 (= e!884063 (containsKey!935 (t!51768 (t!51768 l!1390)) key!405))))

(assert (= (and d!167501 (not res!1081456)) b!1584071))

(assert (= (and b!1584071 res!1081457) b!1584072))

(declare-fun m!1454835 () Bool)

(assert (=> b!1584072 m!1454835))

(assert (=> b!1583959 d!167501))

(declare-fun d!167507 () Bool)

(declare-fun lt!677897 () Bool)

(assert (=> d!167507 (= lt!677897 (select (content!835 l!1390) lt!677860))))

(declare-fun e!884064 () Bool)

(assert (=> d!167507 (= lt!677897 e!884064)))

(declare-fun res!1081458 () Bool)

(assert (=> d!167507 (=> (not res!1081458) (not e!884064))))

(assert (=> d!167507 (= res!1081458 ((_ is Cons!36858) l!1390))))

(assert (=> d!167507 (= (contains!10547 l!1390 lt!677860) lt!677897)))

(declare-fun b!1584073 () Bool)

(declare-fun e!884065 () Bool)

(assert (=> b!1584073 (= e!884064 e!884065)))

(declare-fun res!1081459 () Bool)

(assert (=> b!1584073 (=> res!1081459 e!884065)))

(assert (=> b!1584073 (= res!1081459 (= (h!38419 l!1390) lt!677860))))

(declare-fun b!1584074 () Bool)

(assert (=> b!1584074 (= e!884065 (contains!10547 (t!51768 l!1390) lt!677860))))

(assert (= (and d!167507 res!1081458) b!1584073))

(assert (= (and b!1584073 (not res!1081459)) b!1584074))

(declare-fun m!1454837 () Bool)

(assert (=> d!167507 m!1454837))

(declare-fun m!1454839 () Bool)

(assert (=> d!167507 m!1454839))

(assert (=> b!1584074 m!1454753))

(assert (=> b!1583964 d!167507))

(declare-fun b!1584101 () Bool)

(declare-fun e!884087 () Option!919)

(assert (=> b!1584101 (= e!884087 (getValueByKey!816 (t!51768 l!1390) key!405))))

(declare-fun b!1584099 () Bool)

(declare-fun e!884086 () Option!919)

(assert (=> b!1584099 (= e!884086 (Some!918 (_2!12829 (h!38419 l!1390))))))

(declare-fun b!1584100 () Bool)

(assert (=> b!1584100 (= e!884086 e!884087)))

(declare-fun c!147401 () Bool)

(assert (=> b!1584100 (= c!147401 (and ((_ is Cons!36858) l!1390) (not (= (_1!12829 (h!38419 l!1390)) key!405))))))

(declare-fun d!167509 () Bool)

(declare-fun c!147400 () Bool)

(assert (=> d!167509 (= c!147400 (and ((_ is Cons!36858) l!1390) (= (_1!12829 (h!38419 l!1390)) key!405)))))

(assert (=> d!167509 (= (getValueByKey!816 l!1390 key!405) e!884086)))

(declare-fun b!1584102 () Bool)

(assert (=> b!1584102 (= e!884087 None!917)))

(assert (= (and d!167509 c!147400) b!1584099))

(assert (= (and d!167509 (not c!147400)) b!1584100))

(assert (= (and b!1584100 c!147401) b!1584101))

(assert (= (and b!1584100 (not c!147401)) b!1584102))

(assert (=> b!1584101 m!1454747))

(assert (=> b!1583958 d!167509))

(declare-fun b!1584107 () Bool)

(declare-fun e!884091 () Option!919)

(assert (=> b!1584107 (= e!884091 (getValueByKey!816 (t!51768 (t!51768 l!1390)) key!405))))

(declare-fun b!1584105 () Bool)

(declare-fun e!884090 () Option!919)

(assert (=> b!1584105 (= e!884090 (Some!918 (_2!12829 (h!38419 (t!51768 l!1390)))))))

(declare-fun b!1584106 () Bool)

(assert (=> b!1584106 (= e!884090 e!884091)))

(declare-fun c!147403 () Bool)

(assert (=> b!1584106 (= c!147403 (and ((_ is Cons!36858) (t!51768 l!1390)) (not (= (_1!12829 (h!38419 (t!51768 l!1390))) key!405))))))

(declare-fun d!167523 () Bool)

(declare-fun c!147402 () Bool)

(assert (=> d!167523 (= c!147402 (and ((_ is Cons!36858) (t!51768 l!1390)) (= (_1!12829 (h!38419 (t!51768 l!1390))) key!405)))))

(assert (=> d!167523 (= (getValueByKey!816 (t!51768 l!1390) key!405) e!884090)))

(declare-fun b!1584108 () Bool)

(assert (=> b!1584108 (= e!884091 None!917)))

(assert (= (and d!167523 c!147402) b!1584105))

(assert (= (and d!167523 (not c!147402)) b!1584106))

(assert (= (and b!1584106 c!147403) b!1584107))

(assert (= (and b!1584106 (not c!147403)) b!1584108))

(declare-fun m!1454851 () Bool)

(assert (=> b!1584107 m!1454851))

(assert (=> b!1583958 d!167523))

(declare-fun d!167527 () Bool)

(assert (=> d!167527 (= (getValueByKey!816 (t!51768 l!1390) key!405) (Some!918 value!194))))

(declare-fun lt!677901 () Unit!52159)

(declare-fun choose!2092 (List!36862 (_ BitVec 64) B!2696) Unit!52159)

(assert (=> d!167527 (= lt!677901 (choose!2092 (t!51768 l!1390) key!405 value!194))))

(declare-fun e!884112 () Bool)

(assert (=> d!167527 e!884112))

(declare-fun res!1081484 () Bool)

(assert (=> d!167527 (=> (not res!1081484) (not e!884112))))

(assert (=> d!167527 (= res!1081484 (isStrictlySorted!1076 (t!51768 l!1390)))))

(assert (=> d!167527 (= (lemmaContainsTupThenGetReturnValue!399 (t!51768 l!1390) key!405 value!194) lt!677901)))

(declare-fun b!1584147 () Bool)

(declare-fun res!1081485 () Bool)

(assert (=> b!1584147 (=> (not res!1081485) (not e!884112))))

(assert (=> b!1584147 (= res!1081485 (containsKey!935 (t!51768 l!1390) key!405))))

(declare-fun b!1584148 () Bool)

(assert (=> b!1584148 (= e!884112 (contains!10547 (t!51768 l!1390) (tuple2!25637 key!405 value!194)))))

(assert (= (and d!167527 res!1081484) b!1584147))

(assert (= (and b!1584147 res!1081485) b!1584148))

(assert (=> d!167527 m!1454747))

(declare-fun m!1454857 () Bool)

(assert (=> d!167527 m!1454857))

(assert (=> d!167527 m!1454757))

(assert (=> b!1584147 m!1454761))

(declare-fun m!1454859 () Bool)

(assert (=> b!1584148 m!1454859))

(assert (=> b!1583958 d!167527))

(declare-fun b!1584153 () Bool)

(declare-fun e!884115 () Bool)

(declare-fun tp!114588 () Bool)

(assert (=> b!1584153 (= e!884115 (and tp_is_empty!39241 tp!114588))))

(assert (=> b!1583961 (= tp!114579 e!884115)))

(assert (= (and b!1583961 ((_ is Cons!36858) (t!51768 l!1390))) b!1584153))

(check-sat tp_is_empty!39241 (not d!167527) (not b!1584101) (not b!1584148) (not d!167473) (not b!1584048) (not d!167507) (not b!1584066) (not b!1584030) (not b!1584036) (not b!1584153) (not b!1584107) (not b!1584147) (not b!1584074) (not b!1584072))
(check-sat)
