; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87782 () Bool)

(assert start!87782)

(declare-fun b!1014866 () Bool)

(assert (=> b!1014866 true))

(assert (=> b!1014866 true))

(declare-fun b!1014864 () Bool)

(declare-fun e!571002 () Bool)

(declare-fun tp_is_empty!23477 () Bool)

(declare-fun tp!70452 () Bool)

(assert (=> b!1014864 (= e!571002 (and tp_is_empty!23477 tp!70452))))

(declare-fun res!680962 () Bool)

(declare-fun e!570999 () Bool)

(assert (=> start!87782 (=> (not res!680962) (not e!570999))))

(declare-datatypes ((B!1410 0))(
  ( (B!1411 (val!11789 Int)) )
))
(declare-datatypes ((tuple2!15128 0))(
  ( (tuple2!15129 (_1!7575 (_ BitVec 64)) (_2!7575 B!1410)) )
))
(declare-datatypes ((List!21402 0))(
  ( (Nil!21399) (Cons!21398 (h!22605 tuple2!15128) (t!30395 List!21402)) )
))
(declare-fun l!412 () List!21402)

(declare-fun isStrictlySorted!551 (List!21402) Bool)

(assert (=> start!87782 (= res!680962 (isStrictlySorted!551 l!412))))

(assert (=> start!87782 e!570999))

(assert (=> start!87782 e!571002))

(assert (=> start!87782 tp_is_empty!23477))

(declare-fun b!1014865 () Bool)

(declare-fun res!680964 () Bool)

(assert (=> b!1014865 (=> (not res!680964) (not e!570999))))

(declare-fun value!115 () B!1410)

(assert (=> b!1014865 (= res!680964 (and (is-Cons!21398 l!412) (= (_2!7575 (h!22605 l!412)) value!115)))))

(declare-fun res!680963 () Bool)

(declare-fun e!571000 () Bool)

(assert (=> b!1014866 (=> res!680963 e!571000)))

(declare-datatypes ((List!21403 0))(
  ( (Nil!21400) (Cons!21399 (h!22606 (_ BitVec 64)) (t!30396 List!21403)) )
))
(declare-fun lt!448538 () List!21403)

(declare-fun lambda!515 () Int)

(declare-fun forall!233 (List!21403 Int) Bool)

(assert (=> b!1014866 (= res!680963 (not (forall!233 lt!448538 lambda!515)))))

(declare-fun b!1014867 () Bool)

(declare-fun e!571001 () Bool)

(assert (=> b!1014867 (= e!571001 e!571000)))

(declare-fun res!680961 () Bool)

(assert (=> b!1014867 (=> res!680961 e!571000)))

(assert (=> b!1014867 (= res!680961 (not (isStrictlySorted!551 (t!30395 l!412))))))

(declare-fun b!1014868 () Bool)

(declare-fun res!680966 () Bool)

(assert (=> b!1014868 (=> res!680966 e!571000)))

(declare-fun isEmpty!824 (List!21402) Bool)

(assert (=> b!1014868 (= res!680966 (isEmpty!824 (t!30395 l!412)))))

(declare-fun b!1014869 () Bool)

(declare-fun head!931 (List!21402) tuple2!15128)

(assert (=> b!1014869 (= e!571000 (bvsge (_1!7575 (h!22605 l!412)) (_1!7575 (head!931 (t!30395 l!412)))))))

(declare-fun b!1014870 () Bool)

(assert (=> b!1014870 (= e!570999 e!571001)))

(declare-fun res!680965 () Bool)

(assert (=> b!1014870 (=> (not res!680965) (not e!571001))))

(declare-fun isEmpty!825 (List!21403) Bool)

(assert (=> b!1014870 (= res!680965 (not (isEmpty!825 lt!448538)))))

(declare-fun getKeysOf!39 (List!21402 B!1410) List!21403)

(assert (=> b!1014870 (= lt!448538 (getKeysOf!39 (t!30395 l!412) value!115))))

(assert (= (and start!87782 res!680962) b!1014865))

(assert (= (and b!1014865 res!680964) b!1014870))

(assert (= (and b!1014870 res!680965) b!1014867))

(assert (= (and b!1014867 (not res!680961)) b!1014868))

(assert (= (and b!1014868 (not res!680966)) b!1014866))

(assert (= (and b!1014866 (not res!680963)) b!1014869))

(assert (= (and start!87782 (is-Cons!21398 l!412)) b!1014864))

(declare-fun m!938133 () Bool)

(assert (=> b!1014870 m!938133))

(declare-fun m!938135 () Bool)

(assert (=> b!1014870 m!938135))

(declare-fun m!938137 () Bool)

(assert (=> b!1014867 m!938137))

(declare-fun m!938139 () Bool)

(assert (=> b!1014869 m!938139))

(declare-fun m!938141 () Bool)

(assert (=> b!1014868 m!938141))

(declare-fun m!938143 () Bool)

(assert (=> b!1014866 m!938143))

(declare-fun m!938145 () Bool)

(assert (=> start!87782 m!938145))

(push 1)

(assert (not start!87782))

(assert (not b!1014867))

(assert (not b!1014868))

(assert (not b!1014866))

(assert (not b!1014869))

(assert (not b!1014870))

(assert (not b!1014864))

(assert tp_is_empty!23477)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120941 () Bool)

(assert (=> d!120941 (= (isEmpty!824 (t!30395 l!412)) (is-Nil!21399 (t!30395 l!412)))))

(assert (=> b!1014868 d!120941))

(declare-fun d!120945 () Bool)

(declare-fun res!680983 () Bool)

(declare-fun e!571019 () Bool)

(assert (=> d!120945 (=> res!680983 e!571019)))

(assert (=> d!120945 (= res!680983 (or (is-Nil!21399 (t!30395 l!412)) (is-Nil!21399 (t!30395 (t!30395 l!412)))))))

(assert (=> d!120945 (= (isStrictlySorted!551 (t!30395 l!412)) e!571019)))

(declare-fun b!1014891 () Bool)

(declare-fun e!571020 () Bool)

(assert (=> b!1014891 (= e!571019 e!571020)))

(declare-fun res!680984 () Bool)

(assert (=> b!1014891 (=> (not res!680984) (not e!571020))))

(assert (=> b!1014891 (= res!680984 (bvslt (_1!7575 (h!22605 (t!30395 l!412))) (_1!7575 (h!22605 (t!30395 (t!30395 l!412))))))))

(declare-fun b!1014892 () Bool)

(assert (=> b!1014892 (= e!571020 (isStrictlySorted!551 (t!30395 (t!30395 l!412))))))

(assert (= (and d!120945 (not res!680983)) b!1014891))

(assert (= (and b!1014891 res!680984) b!1014892))

(declare-fun m!938149 () Bool)

(assert (=> b!1014892 m!938149))

(assert (=> b!1014867 d!120945))

(declare-fun d!120953 () Bool)

(declare-fun res!680991 () Bool)

(declare-fun e!571027 () Bool)

(assert (=> d!120953 (=> res!680991 e!571027)))

(assert (=> d!120953 (= res!680991 (is-Nil!21400 lt!448538))))

(assert (=> d!120953 (= (forall!233 lt!448538 lambda!515) e!571027)))

(declare-fun b!1014899 () Bool)

(declare-fun e!571028 () Bool)

(assert (=> b!1014899 (= e!571027 e!571028)))

(declare-fun res!680992 () Bool)

(assert (=> b!1014899 (=> (not res!680992) (not e!571028))))

(declare-fun dynLambda!1908 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014899 (= res!680992 (dynLambda!1908 lambda!515 (h!22606 lt!448538)))))

(declare-fun b!1014900 () Bool)

(assert (=> b!1014900 (= e!571028 (forall!233 (t!30396 lt!448538) lambda!515))))

(assert (= (and d!120953 (not res!680991)) b!1014899))

(assert (= (and b!1014899 res!680992) b!1014900))

(declare-fun b_lambda!15267 () Bool)

(assert (=> (not b_lambda!15267) (not b!1014899)))

(declare-fun m!938151 () Bool)

(assert (=> b!1014899 m!938151))

(declare-fun m!938153 () Bool)

(assert (=> b!1014900 m!938153))

(assert (=> b!1014866 d!120953))

(declare-fun d!120957 () Bool)

(declare-fun res!680997 () Bool)

(declare-fun e!571033 () Bool)

(assert (=> d!120957 (=> res!680997 e!571033)))

(assert (=> d!120957 (= res!680997 (or (is-Nil!21399 l!412) (is-Nil!21399 (t!30395 l!412))))))

(assert (=> d!120957 (= (isStrictlySorted!551 l!412) e!571033)))

(declare-fun b!1014905 () Bool)

(declare-fun e!571034 () Bool)

(assert (=> b!1014905 (= e!571033 e!571034)))

(declare-fun res!680998 () Bool)

(assert (=> b!1014905 (=> (not res!680998) (not e!571034))))

(assert (=> b!1014905 (= res!680998 (bvslt (_1!7575 (h!22605 l!412)) (_1!7575 (h!22605 (t!30395 l!412)))))))

(declare-fun b!1014906 () Bool)

(assert (=> b!1014906 (= e!571034 (isStrictlySorted!551 (t!30395 l!412)))))

(assert (= (and d!120957 (not res!680997)) b!1014905))

(assert (= (and b!1014905 res!680998) b!1014906))

(assert (=> b!1014906 m!938137))

(assert (=> start!87782 d!120957))

(declare-fun d!120959 () Bool)

(assert (=> d!120959 (= (isEmpty!825 lt!448538) (is-Nil!21400 lt!448538))))

(assert (=> b!1014870 d!120959))

(declare-fun bs!28946 () Bool)

(declare-fun b!1014947 () Bool)

(assert (= bs!28946 (and b!1014947 b!1014866)))

(declare-fun lt!448591 () tuple2!15128)

(declare-fun lt!448596 () List!21402)

(declare-fun lambda!526 () Int)

(assert (=> bs!28946 (= (= (Cons!21398 lt!448591 lt!448596) (t!30395 l!412)) (= lambda!526 lambda!515))))

(assert (=> b!1014947 true))

(assert (=> b!1014947 true))

(assert (=> b!1014947 true))

(declare-fun bs!28947 () Bool)

(declare-fun b!1014946 () Bool)

(assert (= bs!28947 (and b!1014946 b!1014866)))

(declare-fun lt!448592 () List!21402)

(declare-fun lambda!527 () Int)

(declare-fun lt!448594 () tuple2!15128)

(assert (=> bs!28947 (= (= (Cons!21398 lt!448594 lt!448592) (t!30395 l!412)) (= lambda!527 lambda!515))))

(declare-fun bs!28948 () Bool)

(assert (= bs!28948 (and b!1014946 b!1014947)))

(assert (=> bs!28948 (= (= (Cons!21398 lt!448594 lt!448592) (Cons!21398 lt!448591 lt!448596)) (= lambda!527 lambda!526))))

(assert (=> b!1014946 true))

(assert (=> b!1014946 true))

(assert (=> b!1014946 true))

(declare-fun bs!28949 () Bool)

(declare-fun d!120961 () Bool)

(assert (= bs!28949 (and d!120961 b!1014866)))

(declare-fun lambda!528 () Int)

(assert (=> bs!28949 (= lambda!528 lambda!515)))

(declare-fun bs!28950 () Bool)

(assert (= bs!28950 (and d!120961 b!1014947)))

(assert (=> bs!28950 (= (= (t!30395 l!412) (Cons!21398 lt!448591 lt!448596)) (= lambda!528 lambda!526))))

(declare-fun bs!28951 () Bool)

(assert (= bs!28951 (and d!120961 b!1014946)))

(assert (=> bs!28951 (= (= (t!30395 l!412) (Cons!21398 lt!448594 lt!448592)) (= lambda!528 lambda!527))))

(assert (=> d!120961 true))

(assert (=> d!120961 true))

(declare-fun b!1014943 () Bool)

(declare-fun e!571057 () List!21403)

(assert (=> b!1014943 (= e!571057 Nil!21400)))

(declare-fun b!1014944 () Bool)

(declare-fun e!571055 () List!21403)

(assert (=> b!1014944 (= e!571055 e!571057)))

(declare-fun c!102904 () Bool)

(assert (=> b!1014944 (= c!102904 (and (is-Cons!21398 (t!30395 l!412)) (not (= (_2!7575 (h!22605 (t!30395 l!412))) value!115))))))

(declare-datatypes ((Unit!33121 0))(
  ( (Unit!33122) )
))
(declare-fun e!571056 () Unit!33121)

(declare-fun lt!448597 () Unit!33121)

(assert (=> b!1014946 (= e!571056 lt!448597)))

(assert (=> b!1014946 (= lt!448592 (t!30395 (t!30395 l!412)))))

(declare-fun lt!448595 () List!21403)

(declare-fun call!42734 () List!21403)

(assert (=> b!1014946 (= lt!448595 call!42734)))

(assert (=> b!1014946 (= lt!448594 (h!22605 (t!30395 l!412)))))

(declare-fun call!42735 () Unit!33121)

(assert (=> b!1014946 (= lt!448597 call!42735)))

(declare-fun call!42733 () Bool)

(assert (=> b!1014946 call!42733))

(declare-fun lt!448588 () List!21403)

(declare-fun c!102903 () Bool)

(declare-fun bm!42730 () Bool)

(assert (=> bm!42730 (= call!42733 (forall!233 (ite c!102903 lt!448588 lt!448595) (ite c!102903 lambda!526 lambda!527)))))

(assert (=> b!1014947 call!42733))

(declare-fun lt!448590 () Unit!33121)

(assert (=> b!1014947 (= lt!448590 call!42735)))

(assert (=> b!1014947 (= lt!448591 (h!22605 (t!30395 l!412)))))

(assert (=> b!1014947 (= lt!448588 call!42734)))

(assert (=> b!1014947 (= lt!448596 (t!30395 (t!30395 l!412)))))

(declare-fun e!571058 () Unit!33121)

(assert (=> b!1014947 (= e!571058 lt!448590)))

(declare-fun b!1014948 () Bool)

(declare-fun lt!448593 () Unit!33121)

(assert (=> b!1014948 (= lt!448593 e!571056)))

(declare-fun c!102905 () Bool)

(declare-fun call!42736 () Bool)

(assert (=> b!1014948 (= c!102905 (not call!42736))))

(declare-fun lt!448598 () List!21403)

(assert (=> b!1014948 (= lt!448598 call!42734)))

(assert (=> b!1014948 (= e!571057 call!42734)))

(declare-fun bm!42731 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!26 (List!21402 List!21403 B!1410 tuple2!15128) Unit!33121)

(assert (=> bm!42731 (= call!42735 (lemmaForallGetValueByKeySameWithASmallerHead!26 (ite c!102903 lt!448596 lt!448592) (ite c!102903 lt!448588 lt!448595) value!115 (ite c!102903 lt!448591 lt!448594)))))

(declare-fun b!1014949 () Bool)

(assert (=> b!1014949 (= e!571055 (Cons!21399 (_1!7575 (h!22605 (t!30395 l!412))) call!42734))))

(declare-fun c!102906 () Bool)

(assert (=> b!1014949 (= c!102906 (not call!42736))))

(declare-fun lt!448589 () Unit!33121)

(assert (=> b!1014949 (= lt!448589 e!571058)))

(declare-fun b!1014950 () Bool)

(declare-fun Unit!33123 () Unit!33121)

(assert (=> b!1014950 (= e!571056 Unit!33123)))

(declare-fun lt!448587 () List!21403)

(assert (=> d!120961 (forall!233 lt!448587 lambda!528)))

(assert (=> d!120961 (= lt!448587 e!571055)))

(assert (=> d!120961 (= c!102903 (and (is-Cons!21398 (t!30395 l!412)) (= (_2!7575 (h!22605 (t!30395 l!412))) value!115)))))

(assert (=> d!120961 (isStrictlySorted!551 (t!30395 l!412))))

(assert (=> d!120961 (= (getKeysOf!39 (t!30395 l!412) value!115) lt!448587)))

(declare-fun b!1014945 () Bool)

(declare-fun Unit!33124 () Unit!33121)

(assert (=> b!1014945 (= e!571058 Unit!33124)))

(declare-fun bm!42732 () Bool)

(assert (=> bm!42732 (= call!42736 (isEmpty!825 call!42734))))

(declare-fun bm!42733 () Bool)

(assert (=> bm!42733 (= call!42734 (getKeysOf!39 (t!30395 (t!30395 l!412)) value!115))))

(assert (= (and d!120961 c!102903) b!1014949))

(assert (= (and d!120961 (not c!102903)) b!1014944))

(assert (= (and b!1014949 c!102906) b!1014947))

(assert (= (and b!1014949 (not c!102906)) b!1014945))

(assert (= (and b!1014944 c!102904) b!1014948))

(assert (= (and b!1014944 (not c!102904)) b!1014943))

(assert (= (and b!1014948 c!102905) b!1014946))

(assert (= (and b!1014948 (not c!102905)) b!1014950))

(assert (= (or b!1014947 b!1014946) bm!42731))

(assert (= (or b!1014947 b!1014946) bm!42730))

(assert (= (or b!1014949 b!1014947 b!1014948 b!1014946) bm!42733))

(assert (= (or b!1014949 b!1014948) bm!42732))

(declare-fun m!938161 () Bool)

(assert (=> bm!42731 m!938161))

(declare-fun m!938163 () Bool)

(assert (=> bm!42733 m!938163))

(declare-fun m!938165 () Bool)

(assert (=> d!120961 m!938165))

(assert (=> d!120961 m!938137))

(declare-fun m!938167 () Bool)

(assert (=> bm!42732 m!938167))

(declare-fun m!938169 () Bool)

(assert (=> bm!42730 m!938169))

(assert (=> b!1014870 d!120961))

(declare-fun d!120969 () Bool)

(assert (=> d!120969 (= (head!931 (t!30395 l!412)) (h!22605 (t!30395 l!412)))))

(assert (=> b!1014869 d!120969))

(declare-fun b!1014973 () Bool)

(declare-fun e!571069 () Bool)

(declare-fun tp!70455 () Bool)

(assert (=> b!1014973 (= e!571069 (and tp_is_empty!23477 tp!70455))))

(assert (=> b!1014864 (= tp!70452 e!571069)))

(assert (= (and b!1014864 (is-Cons!21398 (t!30395 l!412))) b!1014973))

(declare-fun b_lambda!15271 () Bool)

(assert (= b_lambda!15267 (or b!1014866 b_lambda!15271)))

(declare-fun bs!28952 () Bool)

(declare-fun d!120971 () Bool)

(assert (= bs!28952 (and d!120971 b!1014866)))

(declare-datatypes ((Option!569 0))(
  ( (Some!568 (v!14419 B!1410)) (None!567) )
))
(declare-fun getValueByKey!518 (List!21402 (_ BitVec 64)) Option!569)

(assert (=> bs!28952 (= (dynLambda!1908 lambda!515 (h!22606 lt!448538)) (= (getValueByKey!518 (t!30395 l!412) (h!22606 lt!448538)) (Some!568 value!115)))))

(declare-fun m!938171 () Bool)

(assert (=> bs!28952 m!938171))

(assert (=> b!1014899 d!120971))

(push 1)

(assert (not d!120961))

(assert (not bm!42732))

(assert tp_is_empty!23477)

(assert (not b!1014973))

(assert (not bm!42733))

(assert (not bm!42731))

(assert (not bs!28952))

(assert (not b_lambda!15271))

(assert (not bm!42730))

(assert (not b!1014900))

(assert (not b!1014892))

(assert (not b!1014906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

