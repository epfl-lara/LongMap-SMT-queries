; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1698 () Bool)

(assert start!1698)

(declare-fun res!9822 () Bool)

(declare-fun e!7145 () Bool)

(assert (=> start!1698 (=> (not res!9822) (not e!7145))))

(declare-datatypes ((B!434 0))(
  ( (B!435 (val!312 Int)) )
))
(declare-datatypes ((tuple2!420 0))(
  ( (tuple2!421 (_1!210 (_ BitVec 64)) (_2!210 B!434)) )
))
(declare-datatypes ((List!360 0))(
  ( (Nil!357) (Cons!356 (h!922 tuple2!420) (t!2747 List!360)) )
))
(declare-fun l!1094 () List!360)

(declare-fun isStrictlySorted!54 (List!360) Bool)

(assert (=> start!1698 (= res!9822 (isStrictlySorted!54 l!1094))))

(assert (=> start!1698 e!7145))

(declare-fun e!7144 () Bool)

(assert (=> start!1698 e!7144))

(assert (=> start!1698 true))

(declare-fun tp_is_empty!607 () Bool)

(assert (=> start!1698 tp_is_empty!607))

(declare-fun b!11985 () Bool)

(declare-fun res!9823 () Bool)

(assert (=> b!11985 (=> (not res!9823) (not e!7145))))

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!434)

(declare-datatypes ((Option!44 0))(
  ( (Some!43 (v!1358 B!434)) (None!42) )
))
(declare-fun getValueByKey!38 (List!360 (_ BitVec 64)) Option!44)

(assert (=> b!11985 (= res!9823 (= (getValueByKey!38 l!1094 key!303) (Some!43 v!194)))))

(declare-fun b!11986 () Bool)

(declare-fun ListPrimitiveSize!13 (List!360) Int)

(assert (=> b!11986 (= e!7145 (< (ListPrimitiveSize!13 l!1094) 0))))

(declare-fun b!11987 () Bool)

(declare-fun tp!2024 () Bool)

(assert (=> b!11987 (= e!7144 (and tp_is_empty!607 tp!2024))))

(assert (= (and start!1698 res!9822) b!11985))

(assert (= (and b!11985 res!9823) b!11986))

(get-info :version)

(assert (= (and start!1698 ((_ is Cons!356) l!1094)) b!11987))

(declare-fun m!8327 () Bool)

(assert (=> start!1698 m!8327))

(declare-fun m!8329 () Bool)

(assert (=> b!11985 m!8329))

(declare-fun m!8331 () Bool)

(assert (=> b!11986 m!8331))

(check-sat (not start!1698) (not b!11985) tp_is_empty!607 (not b!11986) (not b!11987))
(check-sat)
(get-model)

(declare-fun b!12017 () Bool)

(declare-fun e!7163 () Option!44)

(assert (=> b!12017 (= e!7163 None!42)))

(declare-fun b!12016 () Bool)

(assert (=> b!12016 (= e!7163 (getValueByKey!38 (t!2747 l!1094) key!303))))

(declare-fun d!1669 () Bool)

(declare-fun c!1018 () Bool)

(assert (=> d!1669 (= c!1018 (and ((_ is Cons!356) l!1094) (= (_1!210 (h!922 l!1094)) key!303)))))

(declare-fun e!7162 () Option!44)

(assert (=> d!1669 (= (getValueByKey!38 l!1094 key!303) e!7162)))

(declare-fun b!12014 () Bool)

(assert (=> b!12014 (= e!7162 (Some!43 (_2!210 (h!922 l!1094))))))

(declare-fun b!12015 () Bool)

(assert (=> b!12015 (= e!7162 e!7163)))

(declare-fun c!1019 () Bool)

(assert (=> b!12015 (= c!1019 (and ((_ is Cons!356) l!1094) (not (= (_1!210 (h!922 l!1094)) key!303))))))

(assert (= (and d!1669 c!1018) b!12014))

(assert (= (and d!1669 (not c!1018)) b!12015))

(assert (= (and b!12015 c!1019) b!12016))

(assert (= (and b!12015 (not c!1019)) b!12017))

(declare-fun m!8345 () Bool)

(assert (=> b!12016 m!8345))

(assert (=> b!11985 d!1669))

(declare-fun d!1675 () Bool)

(declare-fun lt!3090 () Int)

(assert (=> d!1675 (>= lt!3090 0)))

(declare-fun e!7170 () Int)

(assert (=> d!1675 (= lt!3090 e!7170)))

(declare-fun c!1026 () Bool)

(assert (=> d!1675 (= c!1026 ((_ is Nil!357) l!1094))))

(assert (=> d!1675 (= (ListPrimitiveSize!13 l!1094) lt!3090)))

(declare-fun b!12030 () Bool)

(assert (=> b!12030 (= e!7170 0)))

(declare-fun b!12031 () Bool)

(assert (=> b!12031 (= e!7170 (+ 1 (ListPrimitiveSize!13 (t!2747 l!1094))))))

(assert (= (and d!1675 c!1026) b!12030))

(assert (= (and d!1675 (not c!1026)) b!12031))

(declare-fun m!8347 () Bool)

(assert (=> b!12031 m!8347))

(assert (=> b!11986 d!1675))

(declare-fun d!1677 () Bool)

(declare-fun res!9840 () Bool)

(declare-fun e!7179 () Bool)

(assert (=> d!1677 (=> res!9840 e!7179)))

(assert (=> d!1677 (= res!9840 (or ((_ is Nil!357) l!1094) ((_ is Nil!357) (t!2747 l!1094))))))

(assert (=> d!1677 (= (isStrictlySorted!54 l!1094) e!7179)))

(declare-fun b!12044 () Bool)

(declare-fun e!7180 () Bool)

(assert (=> b!12044 (= e!7179 e!7180)))

(declare-fun res!9841 () Bool)

(assert (=> b!12044 (=> (not res!9841) (not e!7180))))

(assert (=> b!12044 (= res!9841 (bvslt (_1!210 (h!922 l!1094)) (_1!210 (h!922 (t!2747 l!1094)))))))

(declare-fun b!12045 () Bool)

(assert (=> b!12045 (= e!7180 (isStrictlySorted!54 (t!2747 l!1094)))))

(assert (= (and d!1677 (not res!9840)) b!12044))

(assert (= (and b!12044 res!9841) b!12045))

(declare-fun m!8349 () Bool)

(assert (=> b!12045 m!8349))

(assert (=> start!1698 d!1677))

(declare-fun b!12054 () Bool)

(declare-fun e!7185 () Bool)

(declare-fun tp!2033 () Bool)

(assert (=> b!12054 (= e!7185 (and tp_is_empty!607 tp!2033))))

(assert (=> b!11987 (= tp!2024 e!7185)))

(assert (= (and b!11987 ((_ is Cons!356) (t!2747 l!1094))) b!12054))

(check-sat (not b!12031) (not b!12016) (not b!12045) (not b!12054) tp_is_empty!607)
(check-sat)
