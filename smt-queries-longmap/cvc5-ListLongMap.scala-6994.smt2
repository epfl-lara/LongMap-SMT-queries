; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88678 () Bool)

(assert start!88678)

(declare-fun b!1018749 () Bool)

(declare-fun e!573262 () Bool)

(declare-fun e!573264 () Bool)

(assert (=> b!1018749 (= e!573262 e!573264)))

(declare-fun res!683079 () Bool)

(assert (=> b!1018749 (=> (not res!683079) (not e!573264))))

(declare-datatypes ((B!1670 0))(
  ( (B!1671 (val!11919 Int)) )
))
(declare-datatypes ((tuple2!15384 0))(
  ( (tuple2!15385 (_1!7703 (_ BitVec 64)) (_2!7703 B!1670)) )
))
(declare-datatypes ((List!21607 0))(
  ( (Nil!21604) (Cons!21603 (h!22801 tuple2!15384) (t!30611 List!21607)) )
))
(declare-fun l!996 () List!21607)

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1018749 (= res!683079 (and (is-Cons!21603 l!996) (bvslt (_1!7703 (h!22801 l!996)) key!261)))))

(declare-fun value!172 () B!1670)

(declare-fun lt!449592 () List!21607)

(declare-fun insertStrictlySorted!350 (List!21607 (_ BitVec 64) B!1670) List!21607)

(assert (=> b!1018749 (= lt!449592 (insertStrictlySorted!350 l!996 key!261 value!172))))

(declare-fun b!1018748 () Bool)

(declare-fun res!683081 () Bool)

(assert (=> b!1018748 (=> (not res!683081) (not e!573262))))

(declare-fun containsKey!532 (List!21607 (_ BitVec 64)) Bool)

(assert (=> b!1018748 (= res!683081 (containsKey!532 l!996 key!261))))

(declare-fun b!1018750 () Bool)

(declare-fun isStrictlySorted!672 (List!21607) Bool)

(assert (=> b!1018750 (= e!573264 (not (isStrictlySorted!672 (t!30611 l!996))))))

(declare-fun res!683080 () Bool)

(assert (=> start!88678 (=> (not res!683080) (not e!573262))))

(assert (=> start!88678 (= res!683080 (isStrictlySorted!672 l!996))))

(assert (=> start!88678 e!573262))

(declare-fun e!573263 () Bool)

(assert (=> start!88678 e!573263))

(assert (=> start!88678 true))

(declare-fun tp_is_empty!23737 () Bool)

(assert (=> start!88678 tp_is_empty!23737))

(declare-fun b!1018751 () Bool)

(declare-fun tp!71095 () Bool)

(assert (=> b!1018751 (= e!573263 (and tp_is_empty!23737 tp!71095))))

(assert (= (and start!88678 res!683080) b!1018748))

(assert (= (and b!1018748 res!683081) b!1018749))

(assert (= (and b!1018749 res!683079) b!1018750))

(assert (= (and start!88678 (is-Cons!21603 l!996)) b!1018751))

(declare-fun m!939469 () Bool)

(assert (=> b!1018749 m!939469))

(declare-fun m!939471 () Bool)

(assert (=> b!1018748 m!939471))

(declare-fun m!939473 () Bool)

(assert (=> b!1018750 m!939473))

(declare-fun m!939475 () Bool)

(assert (=> start!88678 m!939475))

(push 1)

(assert (not b!1018751))

(assert (not b!1018749))

(assert (not b!1018748))

(assert tp_is_empty!23737)

(assert (not start!88678))

(assert (not b!1018750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121941 () Bool)

(declare-fun res!683104 () Bool)

(declare-fun e!573287 () Bool)

(assert (=> d!121941 (=> res!683104 e!573287)))

(assert (=> d!121941 (= res!683104 (and (is-Cons!21603 l!996) (= (_1!7703 (h!22801 l!996)) key!261)))))

(assert (=> d!121941 (= (containsKey!532 l!996 key!261) e!573287)))

(declare-fun b!1018780 () Bool)

(declare-fun e!573288 () Bool)

(assert (=> b!1018780 (= e!573287 e!573288)))

(declare-fun res!683105 () Bool)

(assert (=> b!1018780 (=> (not res!683105) (not e!573288))))

(assert (=> b!1018780 (= res!683105 (and (or (not (is-Cons!21603 l!996)) (bvsle (_1!7703 (h!22801 l!996)) key!261)) (is-Cons!21603 l!996) (bvslt (_1!7703 (h!22801 l!996)) key!261)))))

(declare-fun b!1018781 () Bool)

(assert (=> b!1018781 (= e!573288 (containsKey!532 (t!30611 l!996) key!261))))

(assert (= (and d!121941 (not res!683104)) b!1018780))

(assert (= (and b!1018780 res!683105) b!1018781))

(declare-fun m!939493 () Bool)

(assert (=> b!1018781 m!939493))

(assert (=> b!1018748 d!121941))

(declare-fun d!121945 () Bool)

(declare-fun e!573353 () Bool)

(assert (=> d!121945 e!573353))

(declare-fun res!683142 () Bool)

(assert (=> d!121945 (=> (not res!683142) (not e!573353))))

(declare-fun lt!449606 () List!21607)

(assert (=> d!121945 (= res!683142 (isStrictlySorted!672 lt!449606))))

(declare-fun e!573351 () List!21607)

(assert (=> d!121945 (= lt!449606 e!573351)))

(declare-fun c!103227 () Bool)

(assert (=> d!121945 (= c!103227 (and (is-Cons!21603 l!996) (bvslt (_1!7703 (h!22801 l!996)) key!261)))))

(assert (=> d!121945 (isStrictlySorted!672 l!996)))

(assert (=> d!121945 (= (insertStrictlySorted!350 l!996 key!261 value!172) lt!449606)))

(declare-fun call!43016 () List!21607)

(declare-fun e!573349 () List!21607)

(declare-fun bm!43012 () Bool)

(declare-fun $colon$colon!583 (List!21607 tuple2!15384) List!21607)

(assert (=> bm!43012 (= call!43016 ($colon$colon!583 e!573349 (ite c!103227 (h!22801 l!996) (tuple2!15385 key!261 value!172))))))

(declare-fun c!103230 () Bool)

(assert (=> bm!43012 (= c!103230 c!103227)))

(declare-fun b!1018879 () Bool)

(assert (=> b!1018879 (= e!573349 (insertStrictlySorted!350 (t!30611 l!996) key!261 value!172))))

(declare-fun b!1018880 () Bool)

(declare-fun contains!5903 (List!21607 tuple2!15384) Bool)

(assert (=> b!1018880 (= e!573353 (contains!5903 lt!449606 (tuple2!15385 key!261 value!172)))))

