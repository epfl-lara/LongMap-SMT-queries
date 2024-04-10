; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88706 () Bool)

(assert start!88706)

(declare-fun b!1018963 () Bool)

(declare-fun e!573404 () Bool)

(declare-fun e!573405 () Bool)

(assert (=> b!1018963 (= e!573404 e!573405)))

(declare-fun res!683192 () Bool)

(assert (=> b!1018963 (=> (not res!683192) (not e!573405))))

(declare-datatypes ((B!1680 0))(
  ( (B!1681 (val!11924 Int)) )
))
(declare-datatypes ((tuple2!15394 0))(
  ( (tuple2!15395 (_1!7708 (_ BitVec 64)) (_2!7708 B!1680)) )
))
(declare-datatypes ((List!21612 0))(
  ( (Nil!21609) (Cons!21608 (h!22806 tuple2!15394) (t!30616 List!21612)) )
))
(declare-fun l!996 () List!21612)

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1018963 (= res!683192 (and (is-Cons!21608 l!996) (bvslt (_1!7708 (h!22806 l!996)) key!261)))))

(declare-fun value!172 () B!1680)

(declare-fun lt!449616 () List!21612)

(declare-fun insertStrictlySorted!355 (List!21612 (_ BitVec 64) B!1680) List!21612)

(assert (=> b!1018963 (= lt!449616 (insertStrictlySorted!355 l!996 key!261 value!172))))

(declare-fun b!1018964 () Bool)

(declare-fun res!683193 () Bool)

(assert (=> b!1018964 (=> (not res!683193) (not e!573405))))

(declare-fun isStrictlySorted!677 (List!21612) Bool)

(assert (=> b!1018964 (= res!683193 (isStrictlySorted!677 (t!30616 l!996)))))

(declare-fun b!1018965 () Bool)

(declare-fun e!573403 () Bool)

(declare-fun tp_is_empty!23747 () Bool)

(declare-fun tp!71119 () Bool)

(assert (=> b!1018965 (= e!573403 (and tp_is_empty!23747 tp!71119))))

(declare-fun b!1018966 () Bool)

(declare-fun containsKey!537 (List!21612 (_ BitVec 64)) Bool)

(assert (=> b!1018966 (= e!573405 (not (containsKey!537 (t!30616 l!996) key!261)))))

(declare-fun b!1018967 () Bool)

(declare-fun res!683195 () Bool)

(assert (=> b!1018967 (=> (not res!683195) (not e!573404))))

(assert (=> b!1018967 (= res!683195 (containsKey!537 l!996 key!261))))

(declare-fun res!683194 () Bool)

(assert (=> start!88706 (=> (not res!683194) (not e!573404))))

(assert (=> start!88706 (= res!683194 (isStrictlySorted!677 l!996))))

(assert (=> start!88706 e!573404))

(assert (=> start!88706 e!573403))

(assert (=> start!88706 true))

(assert (=> start!88706 tp_is_empty!23747))

(assert (= (and start!88706 res!683194) b!1018967))

(assert (= (and b!1018967 res!683195) b!1018963))

(assert (= (and b!1018963 res!683192) b!1018964))

(assert (= (and b!1018964 res!683193) b!1018966))

(assert (= (and start!88706 (is-Cons!21608 l!996)) b!1018965))

(declare-fun m!939555 () Bool)

(assert (=> b!1018964 m!939555))

(declare-fun m!939557 () Bool)

(assert (=> b!1018963 m!939557))

(declare-fun m!939559 () Bool)

(assert (=> b!1018966 m!939559))

(declare-fun m!939561 () Bool)

(assert (=> start!88706 m!939561))

(declare-fun m!939563 () Bool)

(assert (=> b!1018967 m!939563))

(push 1)

(assert (not b!1018967))

(assert (not start!88706))

(assert tp_is_empty!23747)

(assert (not b!1018966))

(assert (not b!1018965))

(assert (not b!1018964))

(assert (not b!1018963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121975 () Bool)

(declare-fun res!683222 () Bool)

(declare-fun e!573432 () Bool)

(assert (=> d!121975 (=> res!683222 e!573432)))

(assert (=> d!121975 (= res!683222 (and (is-Cons!21608 (t!30616 l!996)) (= (_1!7708 (h!22806 (t!30616 l!996))) key!261)))))

(assert (=> d!121975 (= (containsKey!537 (t!30616 l!996) key!261) e!573432)))

(declare-fun b!1018994 () Bool)

(declare-fun e!573433 () Bool)

(assert (=> b!1018994 (= e!573432 e!573433)))

(declare-fun res!683223 () Bool)

(assert (=> b!1018994 (=> (not res!683223) (not e!573433))))

(assert (=> b!1018994 (= res!683223 (and (or (not (is-Cons!21608 (t!30616 l!996))) (bvsle (_1!7708 (h!22806 (t!30616 l!996))) key!261)) (is-Cons!21608 (t!30616 l!996)) (bvslt (_1!7708 (h!22806 (t!30616 l!996))) key!261)))))

(declare-fun b!1018995 () Bool)

(assert (=> b!1018995 (= e!573433 (containsKey!537 (t!30616 (t!30616 l!996)) key!261))))

(assert (= (and d!121975 (not res!683222)) b!1018994))

(assert (= (and b!1018994 res!683223) b!1018995))

(declare-fun m!939569 () Bool)

(assert (=> b!1018995 m!939569))

(assert (=> b!1018966 d!121975))

(declare-fun d!121981 () Bool)

(declare-fun res!683228 () Bool)

(declare-fun e!573444 () Bool)

(assert (=> d!121981 (=> res!683228 e!573444)))

(assert (=> d!121981 (= res!683228 (or (is-Nil!21609 l!996) (is-Nil!21609 (t!30616 l!996))))))

(assert (=> d!121981 (= (isStrictlySorted!677 l!996) e!573444)))

(declare-fun b!1019012 () Bool)

(declare-fun e!573445 () Bool)

(assert (=> b!1019012 (= e!573444 e!573445)))

(declare-fun res!683229 () Bool)

(assert (=> b!1019012 (=> (not res!683229) (not e!573445))))

(assert (=> b!1019012 (= res!683229 (bvslt (_1!7708 (h!22806 l!996)) (_1!7708 (h!22806 (t!30616 l!996)))))))

(declare-fun b!1019014 () Bool)

(assert (=> b!1019014 (= e!573445 (isStrictlySorted!677 (t!30616 l!996)))))

(assert (= (and d!121981 (not res!683228)) b!1019012))

(assert (= (and b!1019012 res!683229) b!1019014))

(assert (=> b!1019014 m!939555))

(assert (=> start!88706 d!121981))

(declare-fun d!121983 () Bool)

(declare-fun res!683230 () Bool)

(declare-fun e!573452 () Bool)

(assert (=> d!121983 (=> res!683230 e!573452)))

(assert (=> d!121983 (= res!683230 (and (is-Cons!21608 l!996) (= (_1!7708 (h!22806 l!996)) key!261)))))

(assert (=> d!121983 (= (containsKey!537 l!996 key!261) e!573452)))

(declare-fun b!1019026 () Bool)

(declare-fun e!573453 () Bool)

(assert (=> b!1019026 (= e!573452 e!573453)))

(declare-fun res!683231 () Bool)

(assert (=> b!1019026 (=> (not res!683231) (not e!573453))))

(assert (=> b!1019026 (= res!683231 (and (or (not (is-Cons!21608 l!996)) (bvsle (_1!7708 (h!22806 l!996)) key!261)) (is-Cons!21608 l!996) (bvslt (_1!7708 (h!22806 l!996)) key!261)))))

(declare-fun b!1019027 () Bool)

(assert (=> b!1019027 (= e!573453 (containsKey!537 (t!30616 l!996) key!261))))

(assert (= (and d!121983 (not res!683230)) b!1019026))

(assert (= (and b!1019026 res!683231) b!1019027))

(assert (=> b!1019027 m!939559))

(assert (=> b!1018967 d!121983))

