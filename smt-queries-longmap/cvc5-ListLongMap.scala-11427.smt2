; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133244 () Bool)

(assert start!133244)

(declare-fun res!1065901 () Bool)

(declare-fun e!868214 () Bool)

(assert (=> start!133244 (=> (not res!1065901) (not e!868214))))

(declare-datatypes ((B!2438 0))(
  ( (B!2439 (val!19305 Int)) )
))
(declare-datatypes ((tuple2!24986 0))(
  ( (tuple2!24987 (_1!12504 (_ BitVec 64)) (_2!12504 B!2438)) )
))
(declare-datatypes ((List!36339 0))(
  ( (Nil!36336) (Cons!36335 (h!37781 tuple2!24986) (t!51066 List!36339)) )
))
(declare-fun l!1292 () List!36339)

(declare-fun isStrictlySorted!979 (List!36339) Bool)

(assert (=> start!133244 (= res!1065901 (isStrictlySorted!979 l!1292))))

(assert (=> start!133244 e!868214))

(declare-fun e!868213 () Bool)

(assert (=> start!133244 e!868213))

(assert (=> start!133244 true))

(declare-fun tp_is_empty!38443 () Bool)

(assert (=> start!133244 tp_is_empty!38443))

(declare-fun b!1558500 () Bool)

(declare-fun res!1065903 () Bool)

(assert (=> b!1558500 (=> (not res!1065903) (not e!868214))))

(assert (=> b!1558500 (= res!1065903 (isStrictlySorted!979 (t!51066 l!1292)))))

(declare-fun b!1558501 () Bool)

(declare-fun res!1065900 () Bool)

(assert (=> b!1558501 (=> (not res!1065900) (not e!868214))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!842 (List!36339 (_ BitVec 64)) Bool)

(assert (=> b!1558501 (= res!1065900 (containsKey!842 (t!51066 l!1292) otherKey!62))))

(declare-fun b!1558502 () Bool)

(declare-fun res!1065902 () Bool)

(assert (=> b!1558502 (=> (not res!1065902) (not e!868214))))

(assert (=> b!1558502 (= res!1065902 (containsKey!842 l!1292 otherKey!62))))

(declare-fun b!1558503 () Bool)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun newValue!135 () B!2438)

(declare-fun insertStrictlySorted!570 (List!36339 (_ BitVec 64) B!2438) List!36339)

(assert (=> b!1558503 (= e!868214 (not (containsKey!842 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135) otherKey!62)))))

(assert (=> b!1558503 (containsKey!842 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51888 0))(
  ( (Unit!51889) )
))
(declare-fun lt!670787 () Unit!51888)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!10 (List!36339 (_ BitVec 64) B!2438 (_ BitVec 64)) Unit!51888)

(assert (=> b!1558503 (= lt!670787 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!10 (t!51066 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1558504 () Bool)

(declare-fun res!1065904 () Bool)

(assert (=> b!1558504 (=> (not res!1065904) (not e!868214))))

(assert (=> b!1558504 (= res!1065904 (and (not (= otherKey!62 newKey!135)) (is-Cons!36335 l!1292) (not (= (_1!12504 (h!37781 l!1292)) otherKey!62))))))

(declare-fun b!1558505 () Bool)

(declare-fun tp!112656 () Bool)

(assert (=> b!1558505 (= e!868213 (and tp_is_empty!38443 tp!112656))))

(assert (= (and start!133244 res!1065901) b!1558502))

(assert (= (and b!1558502 res!1065902) b!1558504))

(assert (= (and b!1558504 res!1065904) b!1558500))

(assert (= (and b!1558500 res!1065903) b!1558501))

(assert (= (and b!1558501 res!1065900) b!1558503))

(assert (= (and start!133244 (is-Cons!36335 l!1292)) b!1558505))

(declare-fun m!1435095 () Bool)

(assert (=> b!1558503 m!1435095))

(declare-fun m!1435097 () Bool)

(assert (=> b!1558503 m!1435097))

(assert (=> b!1558503 m!1435095))

(declare-fun m!1435099 () Bool)

(assert (=> b!1558503 m!1435099))

(declare-fun m!1435101 () Bool)

(assert (=> b!1558503 m!1435101))

(assert (=> b!1558503 m!1435099))

(declare-fun m!1435103 () Bool)

(assert (=> b!1558503 m!1435103))

(declare-fun m!1435105 () Bool)

(assert (=> b!1558502 m!1435105))

(declare-fun m!1435107 () Bool)

(assert (=> b!1558500 m!1435107))

(declare-fun m!1435109 () Bool)

(assert (=> b!1558501 m!1435109))

(declare-fun m!1435111 () Bool)

(assert (=> start!133244 m!1435111))

(push 1)

(assert (not b!1558500))

(assert (not start!133244))

(assert (not b!1558501))

(assert (not b!1558505))

(assert (not b!1558502))

(assert (not b!1558503))

(assert tp_is_empty!38443)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162685 () Bool)

(declare-fun res!1065963 () Bool)

(declare-fun e!868255 () Bool)

(assert (=> d!162685 (=> res!1065963 e!868255)))

(assert (=> d!162685 (= res!1065963 (and (is-Cons!36335 l!1292) (= (_1!12504 (h!37781 l!1292)) otherKey!62)))))

(assert (=> d!162685 (= (containsKey!842 l!1292 otherKey!62) e!868255)))

(declare-fun b!1558570 () Bool)

(declare-fun e!868256 () Bool)

(assert (=> b!1558570 (= e!868255 e!868256)))

(declare-fun res!1065964 () Bool)

(assert (=> b!1558570 (=> (not res!1065964) (not e!868256))))

(assert (=> b!1558570 (= res!1065964 (and (or (not (is-Cons!36335 l!1292)) (bvsle (_1!12504 (h!37781 l!1292)) otherKey!62)) (is-Cons!36335 l!1292) (bvslt (_1!12504 (h!37781 l!1292)) otherKey!62)))))

(declare-fun b!1558571 () Bool)

(assert (=> b!1558571 (= e!868256 (containsKey!842 (t!51066 l!1292) otherKey!62))))

(assert (= (and d!162685 (not res!1065963)) b!1558570))

(assert (= (and b!1558570 res!1065964) b!1558571))

(assert (=> b!1558571 m!1435109))

(assert (=> b!1558502 d!162685))

(declare-fun d!162691 () Bool)

(declare-fun res!1065967 () Bool)

(declare-fun e!868259 () Bool)

(assert (=> d!162691 (=> res!1065967 e!868259)))

(assert (=> d!162691 (= res!1065967 (and (is-Cons!36335 (t!51066 l!1292)) (= (_1!12504 (h!37781 (t!51066 l!1292))) otherKey!62)))))

(assert (=> d!162691 (= (containsKey!842 (t!51066 l!1292) otherKey!62) e!868259)))

(declare-fun b!1558574 () Bool)

(declare-fun e!868260 () Bool)

(assert (=> b!1558574 (= e!868259 e!868260)))

(declare-fun res!1065968 () Bool)

(assert (=> b!1558574 (=> (not res!1065968) (not e!868260))))

(assert (=> b!1558574 (= res!1065968 (and (or (not (is-Cons!36335 (t!51066 l!1292))) (bvsle (_1!12504 (h!37781 (t!51066 l!1292))) otherKey!62)) (is-Cons!36335 (t!51066 l!1292)) (bvslt (_1!12504 (h!37781 (t!51066 l!1292))) otherKey!62)))))

(declare-fun b!1558575 () Bool)

(assert (=> b!1558575 (= e!868260 (containsKey!842 (t!51066 (t!51066 l!1292)) otherKey!62))))

(assert (= (and d!162691 (not res!1065967)) b!1558574))

(assert (= (and b!1558574 res!1065968) b!1558575))

(declare-fun m!1435155 () Bool)

(assert (=> b!1558575 m!1435155))

(assert (=> b!1558501 d!162691))

(declare-fun d!162697 () Bool)

(declare-fun res!1065979 () Bool)

(declare-fun e!868271 () Bool)

(assert (=> d!162697 (=> res!1065979 e!868271)))

(assert (=> d!162697 (= res!1065979 (or (is-Nil!36336 l!1292) (is-Nil!36336 (t!51066 l!1292))))))

(assert (=> d!162697 (= (isStrictlySorted!979 l!1292) e!868271)))

(declare-fun b!1558586 () Bool)

(declare-fun e!868272 () Bool)

(assert (=> b!1558586 (= e!868271 e!868272)))

(declare-fun res!1065980 () Bool)

(assert (=> b!1558586 (=> (not res!1065980) (not e!868272))))

(assert (=> b!1558586 (= res!1065980 (bvslt (_1!12504 (h!37781 l!1292)) (_1!12504 (h!37781 (t!51066 l!1292)))))))

(declare-fun b!1558587 () Bool)

(assert (=> b!1558587 (= e!868272 (isStrictlySorted!979 (t!51066 l!1292)))))

(assert (= (and d!162697 (not res!1065979)) b!1558586))

(assert (= (and b!1558586 res!1065980) b!1558587))

(assert (=> b!1558587 m!1435107))

(assert (=> start!133244 d!162697))

(declare-fun d!162705 () Bool)

(declare-fun res!1065981 () Bool)

(declare-fun e!868273 () Bool)

(assert (=> d!162705 (=> res!1065981 e!868273)))

(assert (=> d!162705 (= res!1065981 (or (is-Nil!36336 (t!51066 l!1292)) (is-Nil!36336 (t!51066 (t!51066 l!1292)))))))

(assert (=> d!162705 (= (isStrictlySorted!979 (t!51066 l!1292)) e!868273)))

(declare-fun b!1558588 () Bool)

(declare-fun e!868274 () Bool)

(assert (=> b!1558588 (= e!868273 e!868274)))

(declare-fun res!1065982 () Bool)

(assert (=> b!1558588 (=> (not res!1065982) (not e!868274))))

(assert (=> b!1558588 (= res!1065982 (bvslt (_1!12504 (h!37781 (t!51066 l!1292))) (_1!12504 (h!37781 (t!51066 (t!51066 l!1292))))))))

(declare-fun b!1558589 () Bool)

(assert (=> b!1558589 (= e!868274 (isStrictlySorted!979 (t!51066 (t!51066 l!1292))))))

(assert (= (and d!162705 (not res!1065981)) b!1558588))

(assert (= (and b!1558588 res!1065982) b!1558589))

(declare-fun m!1435163 () Bool)

(assert (=> b!1558589 m!1435163))

(assert (=> b!1558500 d!162705))

(declare-fun d!162707 () Bool)

(declare-fun res!1065983 () Bool)

(declare-fun e!868275 () Bool)

(assert (=> d!162707 (=> res!1065983 e!868275)))

(assert (=> d!162707 (= res!1065983 (and (is-Cons!36335 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)) (= (_1!12504 (h!37781 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162707 (= (containsKey!842 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135) otherKey!62) e!868275)))

(declare-fun b!1558590 () Bool)

(declare-fun e!868276 () Bool)

(assert (=> b!1558590 (= e!868275 e!868276)))

(declare-fun res!1065984 () Bool)

(assert (=> b!1558590 (=> (not res!1065984) (not e!868276))))

(assert (=> b!1558590 (= res!1065984 (and (or (not (is-Cons!36335 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) (bvsle (_1!12504 (h!37781 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) otherKey!62)) (is-Cons!36335 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)) (bvslt (_1!12504 (h!37781 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558591 () Bool)

(assert (=> b!1558591 (= e!868276 (containsKey!842 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162707 (not res!1065983)) b!1558590))

(assert (= (and b!1558590 res!1065984) b!1558591))

(declare-fun m!1435165 () Bool)

(assert (=> b!1558591 m!1435165))

(assert (=> b!1558503 d!162707))

(declare-fun d!162709 () Bool)

(declare-fun res!1065985 () Bool)

(declare-fun e!868277 () Bool)

(assert (=> d!162709 (=> res!1065985 e!868277)))

(assert (=> d!162709 (= res!1065985 (and (is-Cons!36335 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)) (= (_1!12504 (h!37781 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162709 (= (containsKey!842 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135) otherKey!62) e!868277)))

(declare-fun b!1558592 () Bool)

(declare-fun e!868278 () Bool)

(assert (=> b!1558592 (= e!868277 e!868278)))

(declare-fun res!1065986 () Bool)

(assert (=> b!1558592 (=> (not res!1065986) (not e!868278))))

(assert (=> b!1558592 (= res!1065986 (and (or (not (is-Cons!36335 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) (bvsle (_1!12504 (h!37781 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36335 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)) (bvslt (_1!12504 (h!37781 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558593 () Bool)

(assert (=> b!1558593 (= e!868278 (containsKey!842 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162709 (not res!1065985)) b!1558592))

(assert (= (and b!1558592 res!1065986) b!1558593))

(declare-fun m!1435167 () Bool)

(assert (=> b!1558593 m!1435167))

(assert (=> b!1558503 d!162709))

(declare-fun c!144139 () Bool)

(declare-fun call!71778 () List!36339)

(declare-fun bm!71773 () Bool)

(declare-fun e!868325 () List!36339)

(declare-fun $colon$colon!982 (List!36339 tuple2!24986) List!36339)

(assert (=> bm!71773 (= call!71778 ($colon$colon!982 e!868325 (ite c!144139 (h!37781 l!1292) (tuple2!24987 newKey!135 newValue!135))))))

(declare-fun c!144137 () Bool)

(assert (=> bm!71773 (= c!144137 c!144139)))

(declare-fun bm!71774 () Bool)

(declare-fun call!71776 () List!36339)

(declare-fun call!71777 () List!36339)

(assert (=> bm!71774 (= call!71776 call!71777)))

(declare-fun b!1558678 () Bool)

(assert (=> b!1558678 (= e!868325 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))))

(declare-fun c!144138 () Bool)

(declare-fun b!1558679 () Bool)

(declare-fun c!144140 () Bool)

(assert (=> b!1558679 (= e!868325 (ite c!144140 (t!51066 l!1292) (ite c!144138 (Cons!36335 (h!37781 l!1292) (t!51066 l!1292)) Nil!36336)))))

(declare-fun d!162711 () Bool)

(declare-fun e!868323 () Bool)

(assert (=> d!162711 e!868323))

(declare-fun res!1066008 () Bool)

(assert (=> d!162711 (=> (not res!1066008) (not e!868323))))

(declare-fun lt!670804 () List!36339)

(assert (=> d!162711 (= res!1066008 (isStrictlySorted!979 lt!670804))))

(declare-fun e!868324 () List!36339)

(assert (=> d!162711 (= lt!670804 e!868324)))

(assert (=> d!162711 (= c!144139 (and (is-Cons!36335 l!1292) (bvslt (_1!12504 (h!37781 l!1292)) newKey!135)))))

(assert (=> d!162711 (isStrictlySorted!979 l!1292)))

(assert (=> d!162711 (= (insertStrictlySorted!570 l!1292 newKey!135 newValue!135) lt!670804)))

(declare-fun b!1558680 () Bool)

(declare-fun e!868322 () List!36339)

(assert (=> b!1558680 (= e!868322 call!71777)))

(declare-fun b!1558681 () Bool)

(assert (=> b!1558681 (= e!868324 e!868322)))

(assert (=> b!1558681 (= c!144140 (and (is-Cons!36335 l!1292) (= (_1!12504 (h!37781 l!1292)) newKey!135)))))

(declare-fun b!1558682 () Bool)

(declare-fun e!868321 () List!36339)

(assert (=> b!1558682 (= e!868321 call!71776)))

(declare-fun b!1558683 () Bool)

(assert (=> b!1558683 (= e!868324 call!71778)))

(declare-fun b!1558684 () Bool)

(declare-fun contains!10214 (List!36339 tuple2!24986) Bool)

(assert (=> b!1558684 (= e!868323 (contains!10214 lt!670804 (tuple2!24987 newKey!135 newValue!135)))))

(declare-fun b!1558685 () Bool)

(assert (=> b!1558685 (= e!868321 call!71776)))

(declare-fun bm!71775 () Bool)

(assert (=> bm!71775 (= call!71777 call!71778)))

(declare-fun b!1558686 () Bool)

(assert (=> b!1558686 (= c!144138 (and (is-Cons!36335 l!1292) (bvsgt (_1!12504 (h!37781 l!1292)) newKey!135)))))

(assert (=> b!1558686 (= e!868322 e!868321)))

(declare-fun b!1558687 () Bool)

(declare-fun res!1066007 () Bool)

(assert (=> b!1558687 (=> (not res!1066007) (not e!868323))))

(assert (=> b!1558687 (= res!1066007 (containsKey!842 lt!670804 newKey!135))))

(assert (= (and d!162711 c!144139) b!1558683))

(assert (= (and d!162711 (not c!144139)) b!1558681))

(assert (= (and b!1558681 c!144140) b!1558680))

(assert (= (and b!1558681 (not c!144140)) b!1558686))

(assert (= (and b!1558686 c!144138) b!1558682))

(assert (= (and b!1558686 (not c!144138)) b!1558685))

(assert (= (or b!1558682 b!1558685) bm!71774))

(assert (= (or b!1558680 bm!71774) bm!71775))

(assert (= (or b!1558683 bm!71775) bm!71773))

(assert (= (and bm!71773 c!144137) b!1558678))

(assert (= (and bm!71773 (not c!144137)) b!1558679))

(assert (= (and d!162711 res!1066008) b!1558687))

(assert (= (and b!1558687 res!1066007) b!1558684))

(declare-fun m!1435185 () Bool)

(assert (=> b!1558684 m!1435185))

(declare-fun m!1435187 () Bool)

(assert (=> b!1558687 m!1435187))

(assert (=> b!1558678 m!1435095))

(declare-fun m!1435189 () Bool)

(assert (=> d!162711 m!1435189))

(assert (=> d!162711 m!1435111))

(declare-fun m!1435191 () Bool)

(assert (=> bm!71773 m!1435191))

(assert (=> b!1558503 d!162711))

(declare-fun d!162717 () Bool)

(assert (=> d!162717 (containsKey!842 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670813 () Unit!51888)

(declare-fun choose!2072 (List!36339 (_ BitVec 64) B!2438 (_ BitVec 64)) Unit!51888)

(assert (=> d!162717 (= lt!670813 (choose!2072 (t!51066 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!868356 () Bool)

(assert (=> d!162717 e!868356))

(declare-fun res!1066033 () Bool)

(assert (=> d!162717 (=> (not res!1066033) (not e!868356))))

(assert (=> d!162717 (= res!1066033 (isStrictlySorted!979 (t!51066 l!1292)))))

(assert (=> d!162717 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!10 (t!51066 l!1292) newKey!135 newValue!135 otherKey!62) lt!670813)))

(declare-fun b!1558738 () Bool)

(declare-fun res!1066034 () Bool)

(assert (=> b!1558738 (=> (not res!1066034) (not e!868356))))

(assert (=> b!1558738 (= res!1066034 (containsKey!842 (t!51066 l!1292) otherKey!62))))

(declare-fun b!1558739 () Bool)

(assert (=> b!1558739 (= e!868356 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162717 res!1066033) b!1558738))

(assert (= (and b!1558738 res!1066034) b!1558739))

(assert (=> d!162717 m!1435095))

(assert (=> d!162717 m!1435095))

(assert (=> d!162717 m!1435097))

(declare-fun m!1435221 () Bool)

(assert (=> d!162717 m!1435221))

(assert (=> d!162717 m!1435107))

(assert (=> b!1558738 m!1435109))

(assert (=> b!1558503 d!162717))

(declare-fun e!868361 () List!36339)

(declare-fun call!71787 () List!36339)

(declare-fun c!144151 () Bool)

(declare-fun bm!71782 () Bool)

(assert (=> bm!71782 (= call!71787 ($colon$colon!982 e!868361 (ite c!144151 (h!37781 (t!51066 l!1292)) (tuple2!24987 newKey!135 newValue!135))))))

(declare-fun c!144149 () Bool)

(assert (=> bm!71782 (= c!144149 c!144151)))

(declare-fun bm!71783 () Bool)

(declare-fun call!71785 () List!36339)

(declare-fun call!71786 () List!36339)

(assert (=> bm!71783 (= call!71785 call!71786)))

(declare-fun b!1558740 () Bool)

(assert (=> b!1558740 (= e!868361 (insertStrictlySorted!570 (t!51066 (t!51066 l!1292)) newKey!135 newValue!135))))

(declare-fun c!144150 () Bool)

(declare-fun c!144152 () Bool)

(declare-fun b!1558741 () Bool)

(assert (=> b!1558741 (= e!868361 (ite c!144152 (t!51066 (t!51066 l!1292)) (ite c!144150 (Cons!36335 (h!37781 (t!51066 l!1292)) (t!51066 (t!51066 l!1292))) Nil!36336)))))

(declare-fun d!162731 () Bool)

(declare-fun e!868359 () Bool)

(assert (=> d!162731 e!868359))

(declare-fun res!1066036 () Bool)

(assert (=> d!162731 (=> (not res!1066036) (not e!868359))))

(declare-fun lt!670814 () List!36339)

(assert (=> d!162731 (= res!1066036 (isStrictlySorted!979 lt!670814))))

(declare-fun e!868360 () List!36339)

(assert (=> d!162731 (= lt!670814 e!868360)))

(assert (=> d!162731 (= c!144151 (and (is-Cons!36335 (t!51066 l!1292)) (bvslt (_1!12504 (h!37781 (t!51066 l!1292))) newKey!135)))))

(assert (=> d!162731 (isStrictlySorted!979 (t!51066 l!1292))))

(assert (=> d!162731 (= (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135) lt!670814)))

(declare-fun b!1558742 () Bool)

(declare-fun e!868358 () List!36339)

(assert (=> b!1558742 (= e!868358 call!71786)))

(declare-fun b!1558743 () Bool)

(assert (=> b!1558743 (= e!868360 e!868358)))

(assert (=> b!1558743 (= c!144152 (and (is-Cons!36335 (t!51066 l!1292)) (= (_1!12504 (h!37781 (t!51066 l!1292))) newKey!135)))))

(declare-fun b!1558744 () Bool)

(declare-fun e!868357 () List!36339)

(assert (=> b!1558744 (= e!868357 call!71785)))

(declare-fun b!1558745 () Bool)

(assert (=> b!1558745 (= e!868360 call!71787)))

(declare-fun b!1558746 () Bool)

(assert (=> b!1558746 (= e!868359 (contains!10214 lt!670814 (tuple2!24987 newKey!135 newValue!135)))))

(declare-fun b!1558747 () Bool)

(assert (=> b!1558747 (= e!868357 call!71785)))

(declare-fun bm!71784 () Bool)

(assert (=> bm!71784 (= call!71786 call!71787)))

(declare-fun b!1558748 () Bool)

(assert (=> b!1558748 (= c!144150 (and (is-Cons!36335 (t!51066 l!1292)) (bvsgt (_1!12504 (h!37781 (t!51066 l!1292))) newKey!135)))))

(assert (=> b!1558748 (= e!868358 e!868357)))

(declare-fun b!1558749 () Bool)

(declare-fun res!1066035 () Bool)

(assert (=> b!1558749 (=> (not res!1066035) (not e!868359))))

(assert (=> b!1558749 (= res!1066035 (containsKey!842 lt!670814 newKey!135))))

(assert (= (and d!162731 c!144151) b!1558745))

(assert (= (and d!162731 (not c!144151)) b!1558743))

(assert (= (and b!1558743 c!144152) b!1558742))

(assert (= (and b!1558743 (not c!144152)) b!1558748))

(assert (= (and b!1558748 c!144150) b!1558744))

(assert (= (and b!1558748 (not c!144150)) b!1558747))

(assert (= (or b!1558744 b!1558747) bm!71783))

(assert (= (or b!1558742 bm!71783) bm!71784))

(assert (= (or b!1558745 bm!71784) bm!71782))

(assert (= (and bm!71782 c!144149) b!1558740))

(assert (= (and bm!71782 (not c!144149)) b!1558741))

(assert (= (and d!162731 res!1066036) b!1558749))

(assert (= (and b!1558749 res!1066035) b!1558746))

(declare-fun m!1435223 () Bool)

(assert (=> b!1558746 m!1435223))

(declare-fun m!1435225 () Bool)

(assert (=> b!1558749 m!1435225))

(declare-fun m!1435227 () Bool)

(assert (=> b!1558740 m!1435227))

(declare-fun m!1435229 () Bool)

(assert (=> d!162731 m!1435229))

(assert (=> d!162731 m!1435107))

(declare-fun m!1435231 () Bool)

(assert (=> bm!71782 m!1435231))

(assert (=> b!1558503 d!162731))

(declare-fun b!1558754 () Bool)

(declare-fun e!868364 () Bool)

(declare-fun tp!112671 () Bool)

(assert (=> b!1558754 (= e!868364 (and tp_is_empty!38443 tp!112671))))

(assert (=> b!1558505 (= tp!112656 e!868364)))

(assert (= (and b!1558505 (is-Cons!36335 (t!51066 l!1292))) b!1558754))

(push 1)

(assert (not b!1558575))

(assert (not b!1558687))

(assert (not b!1558740))

(assert (not b!1558589))

(assert (not b!1558678))

(assert (not b!1558684))

(assert (not bm!71782))

(assert (not d!162711))

(assert (not b!1558749))

(assert (not b!1558746))

(assert (not b!1558593))

(assert (not bm!71773))

(assert (not b!1558571))

(assert (not b!1558587))

(assert (not b!1558591))

(assert (not b!1558738))

(assert (not b!1558754))

(assert tp_is_empty!38443)

(assert (not d!162717))

(assert (not d!162731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162761 () Bool)

(declare-fun lt!670822 () Bool)

(declare-fun content!803 (List!36339) (Set tuple2!24986))

(assert (=> d!162761 (= lt!670822 (set.member (tuple2!24987 newKey!135 newValue!135) (content!803 lt!670804)))))

(declare-fun e!868399 () Bool)

(assert (=> d!162761 (= lt!670822 e!868399)))

(declare-fun res!1066068 () Bool)

(assert (=> d!162761 (=> (not res!1066068) (not e!868399))))

(assert (=> d!162761 (= res!1066068 (is-Cons!36335 lt!670804))))

(assert (=> d!162761 (= (contains!10214 lt!670804 (tuple2!24987 newKey!135 newValue!135)) lt!670822)))

(declare-fun b!1558794 () Bool)

(declare-fun e!868400 () Bool)

(assert (=> b!1558794 (= e!868399 e!868400)))

(declare-fun res!1066067 () Bool)

(assert (=> b!1558794 (=> res!1066067 e!868400)))

(assert (=> b!1558794 (= res!1066067 (= (h!37781 lt!670804) (tuple2!24987 newKey!135 newValue!135)))))

(declare-fun b!1558795 () Bool)

(assert (=> b!1558795 (= e!868400 (contains!10214 (t!51066 lt!670804) (tuple2!24987 newKey!135 newValue!135)))))

(assert (= (and d!162761 res!1066068) b!1558794))

(assert (= (and b!1558794 (not res!1066067)) b!1558795))

(declare-fun m!1435271 () Bool)

(assert (=> d!162761 m!1435271))

(declare-fun m!1435273 () Bool)

(assert (=> d!162761 m!1435273))

(declare-fun m!1435275 () Bool)

(assert (=> b!1558795 m!1435275))

(assert (=> b!1558684 d!162761))

(declare-fun d!162763 () Bool)

(declare-fun res!1066069 () Bool)

(declare-fun e!868401 () Bool)

(assert (=> d!162763 (=> res!1066069 e!868401)))

(assert (=> d!162763 (= res!1066069 (or (is-Nil!36336 lt!670814) (is-Nil!36336 (t!51066 lt!670814))))))

(assert (=> d!162763 (= (isStrictlySorted!979 lt!670814) e!868401)))

(declare-fun b!1558796 () Bool)

(declare-fun e!868402 () Bool)

(assert (=> b!1558796 (= e!868401 e!868402)))

(declare-fun res!1066070 () Bool)

(assert (=> b!1558796 (=> (not res!1066070) (not e!868402))))

(assert (=> b!1558796 (= res!1066070 (bvslt (_1!12504 (h!37781 lt!670814)) (_1!12504 (h!37781 (t!51066 lt!670814)))))))

(declare-fun b!1558797 () Bool)

(assert (=> b!1558797 (= e!868402 (isStrictlySorted!979 (t!51066 lt!670814)))))

(assert (= (and d!162763 (not res!1066069)) b!1558796))

(assert (= (and b!1558796 res!1066070) b!1558797))

(declare-fun m!1435277 () Bool)

(assert (=> b!1558797 m!1435277))

(assert (=> d!162731 d!162763))

(assert (=> d!162731 d!162705))

(declare-fun d!162765 () Bool)

(assert (=> d!162765 (= ($colon$colon!982 e!868325 (ite c!144139 (h!37781 l!1292) (tuple2!24987 newKey!135 newValue!135))) (Cons!36335 (ite c!144139 (h!37781 l!1292) (tuple2!24987 newKey!135 newValue!135)) e!868325))))

(assert (=> bm!71773 d!162765))

(assert (=> d!162717 d!162707))

(assert (=> d!162717 d!162731))

(declare-fun d!162767 () Bool)

(assert (=> d!162767 (containsKey!842 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135) otherKey!62)))

(assert (=> d!162767 true))

(declare-fun _$18!44 () Unit!51888)

(assert (=> d!162767 (= (choose!2072 (t!51066 l!1292) newKey!135 newValue!135 otherKey!62) _$18!44)))

(declare-fun bs!44805 () Bool)

(assert (= bs!44805 d!162767))

(assert (=> bs!44805 m!1435095))

(assert (=> bs!44805 m!1435095))

(assert (=> bs!44805 m!1435097))

(assert (=> d!162717 d!162767))

(assert (=> d!162717 d!162705))

(declare-fun d!162769 () Bool)

(declare-fun lt!670823 () Bool)

(assert (=> d!162769 (= lt!670823 (set.member (tuple2!24987 newKey!135 newValue!135) (content!803 lt!670814)))))

(declare-fun e!868403 () Bool)

(assert (=> d!162769 (= lt!670823 e!868403)))

(declare-fun res!1066072 () Bool)

(assert (=> d!162769 (=> (not res!1066072) (not e!868403))))

(assert (=> d!162769 (= res!1066072 (is-Cons!36335 lt!670814))))

(assert (=> d!162769 (= (contains!10214 lt!670814 (tuple2!24987 newKey!135 newValue!135)) lt!670823)))

(declare-fun b!1558798 () Bool)

(declare-fun e!868404 () Bool)

(assert (=> b!1558798 (= e!868403 e!868404)))

(declare-fun res!1066071 () Bool)

(assert (=> b!1558798 (=> res!1066071 e!868404)))

(assert (=> b!1558798 (= res!1066071 (= (h!37781 lt!670814) (tuple2!24987 newKey!135 newValue!135)))))

(declare-fun b!1558799 () Bool)

(assert (=> b!1558799 (= e!868404 (contains!10214 (t!51066 lt!670814) (tuple2!24987 newKey!135 newValue!135)))))

(assert (= (and d!162769 res!1066072) b!1558798))

(assert (= (and b!1558798 (not res!1066071)) b!1558799))

(declare-fun m!1435279 () Bool)

(assert (=> d!162769 m!1435279))

(declare-fun m!1435281 () Bool)

(assert (=> d!162769 m!1435281))

(declare-fun m!1435283 () Bool)

(assert (=> b!1558799 m!1435283))

(assert (=> b!1558746 d!162769))

(declare-fun bm!71788 () Bool)

(declare-fun e!868409 () List!36339)

(declare-fun c!144159 () Bool)

(declare-fun call!71793 () List!36339)

(assert (=> bm!71788 (= call!71793 ($colon$colon!982 e!868409 (ite c!144159 (h!37781 (t!51066 (t!51066 l!1292))) (tuple2!24987 newKey!135 newValue!135))))))

(declare-fun c!144157 () Bool)

(assert (=> bm!71788 (= c!144157 c!144159)))

(declare-fun bm!71789 () Bool)

(declare-fun call!71791 () List!36339)

(declare-fun call!71792 () List!36339)

(assert (=> bm!71789 (= call!71791 call!71792)))

(declare-fun b!1558800 () Bool)

(assert (=> b!1558800 (= e!868409 (insertStrictlySorted!570 (t!51066 (t!51066 (t!51066 l!1292))) newKey!135 newValue!135))))

(declare-fun c!144160 () Bool)

(declare-fun b!1558801 () Bool)

(declare-fun c!144158 () Bool)

(assert (=> b!1558801 (= e!868409 (ite c!144160 (t!51066 (t!51066 (t!51066 l!1292))) (ite c!144158 (Cons!36335 (h!37781 (t!51066 (t!51066 l!1292))) (t!51066 (t!51066 (t!51066 l!1292)))) Nil!36336)))))

(declare-fun d!162771 () Bool)

(declare-fun e!868407 () Bool)

(assert (=> d!162771 e!868407))

(declare-fun res!1066074 () Bool)

(assert (=> d!162771 (=> (not res!1066074) (not e!868407))))

(declare-fun lt!670824 () List!36339)

(assert (=> d!162771 (= res!1066074 (isStrictlySorted!979 lt!670824))))

(declare-fun e!868408 () List!36339)

(assert (=> d!162771 (= lt!670824 e!868408)))

(assert (=> d!162771 (= c!144159 (and (is-Cons!36335 (t!51066 (t!51066 l!1292))) (bvslt (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) newKey!135)))))

(assert (=> d!162771 (isStrictlySorted!979 (t!51066 (t!51066 l!1292)))))

(assert (=> d!162771 (= (insertStrictlySorted!570 (t!51066 (t!51066 l!1292)) newKey!135 newValue!135) lt!670824)))

(declare-fun b!1558802 () Bool)

(declare-fun e!868406 () List!36339)

(assert (=> b!1558802 (= e!868406 call!71792)))

(declare-fun b!1558803 () Bool)

(assert (=> b!1558803 (= e!868408 e!868406)))

(assert (=> b!1558803 (= c!144160 (and (is-Cons!36335 (t!51066 (t!51066 l!1292))) (= (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) newKey!135)))))

(declare-fun b!1558804 () Bool)

(declare-fun e!868405 () List!36339)

(assert (=> b!1558804 (= e!868405 call!71791)))

(declare-fun b!1558805 () Bool)

(assert (=> b!1558805 (= e!868408 call!71793)))

(declare-fun b!1558806 () Bool)

(assert (=> b!1558806 (= e!868407 (contains!10214 lt!670824 (tuple2!24987 newKey!135 newValue!135)))))

(declare-fun b!1558807 () Bool)

(assert (=> b!1558807 (= e!868405 call!71791)))

(declare-fun bm!71790 () Bool)

(assert (=> bm!71790 (= call!71792 call!71793)))

(declare-fun b!1558808 () Bool)

(assert (=> b!1558808 (= c!144158 (and (is-Cons!36335 (t!51066 (t!51066 l!1292))) (bvsgt (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) newKey!135)))))

(assert (=> b!1558808 (= e!868406 e!868405)))

(declare-fun b!1558809 () Bool)

(declare-fun res!1066073 () Bool)

(assert (=> b!1558809 (=> (not res!1066073) (not e!868407))))

(assert (=> b!1558809 (= res!1066073 (containsKey!842 lt!670824 newKey!135))))

(assert (= (and d!162771 c!144159) b!1558805))

(assert (= (and d!162771 (not c!144159)) b!1558803))

(assert (= (and b!1558803 c!144160) b!1558802))

(assert (= (and b!1558803 (not c!144160)) b!1558808))

(assert (= (and b!1558808 c!144158) b!1558804))

(assert (= (and b!1558808 (not c!144158)) b!1558807))

(assert (= (or b!1558804 b!1558807) bm!71789))

(assert (= (or b!1558802 bm!71789) bm!71790))

(assert (= (or b!1558805 bm!71790) bm!71788))

(assert (= (and bm!71788 c!144157) b!1558800))

(assert (= (and bm!71788 (not c!144157)) b!1558801))

(assert (= (and d!162771 res!1066074) b!1558809))

(assert (= (and b!1558809 res!1066073) b!1558806))

(declare-fun m!1435285 () Bool)

(assert (=> b!1558806 m!1435285))

(declare-fun m!1435287 () Bool)

(assert (=> b!1558809 m!1435287))

(declare-fun m!1435289 () Bool)

(assert (=> b!1558800 m!1435289))

(declare-fun m!1435291 () Bool)

(assert (=> d!162771 m!1435291))

(assert (=> d!162771 m!1435163))

(declare-fun m!1435293 () Bool)

(assert (=> bm!71788 m!1435293))

(assert (=> b!1558740 d!162771))

(declare-fun d!162773 () Bool)

(declare-fun res!1066075 () Bool)

(declare-fun e!868410 () Bool)

(assert (=> d!162773 (=> res!1066075 e!868410)))

(assert (=> d!162773 (= res!1066075 (or (is-Nil!36336 (t!51066 (t!51066 l!1292))) (is-Nil!36336 (t!51066 (t!51066 (t!51066 l!1292))))))))

(assert (=> d!162773 (= (isStrictlySorted!979 (t!51066 (t!51066 l!1292))) e!868410)))

(declare-fun b!1558810 () Bool)

(declare-fun e!868411 () Bool)

(assert (=> b!1558810 (= e!868410 e!868411)))

(declare-fun res!1066076 () Bool)

(assert (=> b!1558810 (=> (not res!1066076) (not e!868411))))

(assert (=> b!1558810 (= res!1066076 (bvslt (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) (_1!12504 (h!37781 (t!51066 (t!51066 (t!51066 l!1292)))))))))

(declare-fun b!1558811 () Bool)

(assert (=> b!1558811 (= e!868411 (isStrictlySorted!979 (t!51066 (t!51066 (t!51066 l!1292)))))))

(assert (= (and d!162773 (not res!1066075)) b!1558810))

(assert (= (and b!1558810 res!1066076) b!1558811))

(declare-fun m!1435295 () Bool)

(assert (=> b!1558811 m!1435295))

(assert (=> b!1558589 d!162773))

(assert (=> b!1558678 d!162731))

(declare-fun d!162775 () Bool)

(declare-fun res!1066077 () Bool)

(declare-fun e!868412 () Bool)

(assert (=> d!162775 (=> res!1066077 e!868412)))

(assert (=> d!162775 (= res!1066077 (and (is-Cons!36335 lt!670814) (= (_1!12504 (h!37781 lt!670814)) newKey!135)))))

(assert (=> d!162775 (= (containsKey!842 lt!670814 newKey!135) e!868412)))

(declare-fun b!1558812 () Bool)

(declare-fun e!868413 () Bool)

(assert (=> b!1558812 (= e!868412 e!868413)))

(declare-fun res!1066078 () Bool)

(assert (=> b!1558812 (=> (not res!1066078) (not e!868413))))

(assert (=> b!1558812 (= res!1066078 (and (or (not (is-Cons!36335 lt!670814)) (bvsle (_1!12504 (h!37781 lt!670814)) newKey!135)) (is-Cons!36335 lt!670814) (bvslt (_1!12504 (h!37781 lt!670814)) newKey!135)))))

(declare-fun b!1558813 () Bool)

(assert (=> b!1558813 (= e!868413 (containsKey!842 (t!51066 lt!670814) newKey!135))))

(assert (= (and d!162775 (not res!1066077)) b!1558812))

(assert (= (and b!1558812 res!1066078) b!1558813))

(declare-fun m!1435297 () Bool)

(assert (=> b!1558813 m!1435297))

(assert (=> b!1558749 d!162775))

(declare-fun d!162777 () Bool)

(declare-fun res!1066079 () Bool)

(declare-fun e!868414 () Bool)

(assert (=> d!162777 (=> res!1066079 e!868414)))

(assert (=> d!162777 (= res!1066079 (and (is-Cons!36335 (t!51066 (t!51066 l!1292))) (= (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) otherKey!62)))))

(assert (=> d!162777 (= (containsKey!842 (t!51066 (t!51066 l!1292)) otherKey!62) e!868414)))

(declare-fun b!1558814 () Bool)

(declare-fun e!868415 () Bool)

(assert (=> b!1558814 (= e!868414 e!868415)))

(declare-fun res!1066080 () Bool)

(assert (=> b!1558814 (=> (not res!1066080) (not e!868415))))

(assert (=> b!1558814 (= res!1066080 (and (or (not (is-Cons!36335 (t!51066 (t!51066 l!1292)))) (bvsle (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) otherKey!62)) (is-Cons!36335 (t!51066 (t!51066 l!1292))) (bvslt (_1!12504 (h!37781 (t!51066 (t!51066 l!1292)))) otherKey!62)))))

(declare-fun b!1558815 () Bool)

(assert (=> b!1558815 (= e!868415 (containsKey!842 (t!51066 (t!51066 (t!51066 l!1292))) otherKey!62))))

(assert (= (and d!162777 (not res!1066079)) b!1558814))

(assert (= (and b!1558814 res!1066080) b!1558815))

(declare-fun m!1435299 () Bool)

(assert (=> b!1558815 m!1435299))

(assert (=> b!1558575 d!162777))

(declare-fun d!162779 () Bool)

(declare-fun res!1066081 () Bool)

(declare-fun e!868416 () Bool)

(assert (=> d!162779 (=> res!1066081 e!868416)))

(assert (=> d!162779 (= res!1066081 (and (is-Cons!36335 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) (= (_1!12504 (h!37781 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162779 (= (containsKey!842 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)) otherKey!62) e!868416)))

(declare-fun b!1558816 () Bool)

(declare-fun e!868417 () Bool)

(assert (=> b!1558816 (= e!868416 e!868417)))

(declare-fun res!1066082 () Bool)

(assert (=> b!1558816 (=> (not res!1066082) (not e!868417))))

(assert (=> b!1558816 (= res!1066082 (and (or (not (is-Cons!36335 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)))) (bvsle (_1!12504 (h!37781 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36335 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) (bvslt (_1!12504 (h!37781 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558817 () Bool)

(assert (=> b!1558817 (= e!868417 (containsKey!842 (t!51066 (t!51066 (insertStrictlySorted!570 (t!51066 l!1292) newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162779 (not res!1066081)) b!1558816))

(assert (= (and b!1558816 res!1066082) b!1558817))

(declare-fun m!1435301 () Bool)

(assert (=> b!1558817 m!1435301))

(assert (=> b!1558591 d!162779))

(declare-fun d!162781 () Bool)

(declare-fun res!1066083 () Bool)

(declare-fun e!868418 () Bool)

(assert (=> d!162781 (=> res!1066083 e!868418)))

(assert (=> d!162781 (= res!1066083 (and (is-Cons!36335 lt!670804) (= (_1!12504 (h!37781 lt!670804)) newKey!135)))))

(assert (=> d!162781 (= (containsKey!842 lt!670804 newKey!135) e!868418)))

(declare-fun b!1558818 () Bool)

(declare-fun e!868419 () Bool)

(assert (=> b!1558818 (= e!868418 e!868419)))

(declare-fun res!1066084 () Bool)

(assert (=> b!1558818 (=> (not res!1066084) (not e!868419))))

(assert (=> b!1558818 (= res!1066084 (and (or (not (is-Cons!36335 lt!670804)) (bvsle (_1!12504 (h!37781 lt!670804)) newKey!135)) (is-Cons!36335 lt!670804) (bvslt (_1!12504 (h!37781 lt!670804)) newKey!135)))))

(declare-fun b!1558819 () Bool)

(assert (=> b!1558819 (= e!868419 (containsKey!842 (t!51066 lt!670804) newKey!135))))

(assert (= (and d!162781 (not res!1066083)) b!1558818))

(assert (= (and b!1558818 res!1066084) b!1558819))

(declare-fun m!1435303 () Bool)

(assert (=> b!1558819 m!1435303))

(assert (=> b!1558687 d!162781))

(declare-fun d!162783 () Bool)

(declare-fun res!1066085 () Bool)

(declare-fun e!868420 () Bool)

(assert (=> d!162783 (=> res!1066085 e!868420)))

(assert (=> d!162783 (= res!1066085 (and (is-Cons!36335 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) (= (_1!12504 (h!37781 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162783 (= (containsKey!842 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)) otherKey!62) e!868420)))

(declare-fun b!1558820 () Bool)

(declare-fun e!868421 () Bool)

(assert (=> b!1558820 (= e!868420 e!868421)))

(declare-fun res!1066086 () Bool)

(assert (=> b!1558820 (=> (not res!1066086) (not e!868421))))

(assert (=> b!1558820 (= res!1066086 (and (or (not (is-Cons!36335 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12504 (h!37781 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36335 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) (bvslt (_1!12504 (h!37781 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558821 () Bool)

(assert (=> b!1558821 (= e!868421 (containsKey!842 (t!51066 (t!51066 (insertStrictlySorted!570 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162783 (not res!1066085)) b!1558820))

(assert (= (and b!1558820 res!1066086) b!1558821))

(declare-fun m!1435305 () Bool)

(assert (=> b!1558821 m!1435305))

(assert (=> b!1558593 d!162783))

(declare-fun d!162785 () Bool)

(assert (=> d!162785 (= ($colon$colon!982 e!868361 (ite c!144151 (h!37781 (t!51066 l!1292)) (tuple2!24987 newKey!135 newValue!135))) (Cons!36335 (ite c!144151 (h!37781 (t!51066 l!1292)) (tuple2!24987 newKey!135 newValue!135)) e!868361))))

(assert (=> bm!71782 d!162785))

(assert (=> b!1558738 d!162691))

(assert (=> b!1558571 d!162691))

(assert (=> b!1558587 d!162705))

(declare-fun d!162787 () Bool)

(declare-fun res!1066087 () Bool)

(declare-fun e!868422 () Bool)

(assert (=> d!162787 (=> res!1066087 e!868422)))

(assert (=> d!162787 (= res!1066087 (or (is-Nil!36336 lt!670804) (is-Nil!36336 (t!51066 lt!670804))))))

(assert (=> d!162787 (= (isStrictlySorted!979 lt!670804) e!868422)))

(declare-fun b!1558822 () Bool)

(declare-fun e!868423 () Bool)

(assert (=> b!1558822 (= e!868422 e!868423)))

(declare-fun res!1066088 () Bool)

(assert (=> b!1558822 (=> (not res!1066088) (not e!868423))))

(assert (=> b!1558822 (= res!1066088 (bvslt (_1!12504 (h!37781 lt!670804)) (_1!12504 (h!37781 (t!51066 lt!670804)))))))

(declare-fun b!1558823 () Bool)

(assert (=> b!1558823 (= e!868423 (isStrictlySorted!979 (t!51066 lt!670804)))))

(assert (= (and d!162787 (not res!1066087)) b!1558822))

(assert (= (and b!1558822 res!1066088) b!1558823))

(declare-fun m!1435307 () Bool)

(assert (=> b!1558823 m!1435307))

(assert (=> d!162711 d!162787))

(assert (=> d!162711 d!162697))

(declare-fun b!1558824 () Bool)

(declare-fun e!868424 () Bool)

(declare-fun tp!112673 () Bool)

(assert (=> b!1558824 (= e!868424 (and tp_is_empty!38443 tp!112673))))

(assert (=> b!1558754 (= tp!112671 e!868424)))

(assert (= (and b!1558754 (is-Cons!36335 (t!51066 (t!51066 l!1292)))) b!1558824))

(push 1)

(assert (not b!1558809))

(assert (not b!1558823))

(assert (not b!1558811))

(assert (not b!1558817))

(assert (not b!1558821))

(assert (not b!1558800))

(assert (not b!1558824))

(assert tp_is_empty!38443)

(assert (not b!1558806))

(assert (not d!162767))

(assert (not b!1558813))

(assert (not b!1558815))

(assert (not d!162771))

(assert (not b!1558819))

(assert (not b!1558797))

(assert (not d!162761))

(assert (not bm!71788))

(assert (not b!1558799))

(assert (not b!1558795))

(assert (not d!162769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

