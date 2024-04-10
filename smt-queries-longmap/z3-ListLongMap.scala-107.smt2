; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1742 () Bool)

(assert start!1742)

(declare-fun b!12255 () Bool)

(declare-fun e!7322 () Bool)

(declare-fun tp_is_empty!621 () Bool)

(declare-fun tp!2063 () Bool)

(assert (=> b!12255 (= e!7322 (and tp_is_empty!621 tp!2063))))

(declare-fun b!12256 () Bool)

(declare-fun res!9939 () Bool)

(declare-fun e!7321 () Bool)

(assert (=> b!12256 (=> (not res!9939) (not e!7321))))

(declare-datatypes ((B!448 0))(
  ( (B!449 (val!319 Int)) )
))
(declare-datatypes ((tuple2!438 0))(
  ( (tuple2!439 (_1!219 (_ BitVec 64)) (_2!219 B!448)) )
))
(declare-datatypes ((List!371 0))(
  ( (Nil!368) (Cons!367 (h!933 tuple2!438) (t!2758 List!371)) )
))
(declare-fun l!1094 () List!371)

(declare-fun isStrictlySorted!64 (List!371) Bool)

(assert (=> b!12256 (= res!9939 (isStrictlySorted!64 (t!2758 l!1094)))))

(declare-fun b!12257 () Bool)

(declare-fun res!9941 () Bool)

(assert (=> b!12257 (=> (not res!9941) (not e!7321))))

(declare-fun key!303 () (_ BitVec 64))

(get-info :version)

(assert (=> b!12257 (= res!9941 (and ((_ is Cons!367) l!1094) (not (= (_1!219 (h!933 l!1094)) key!303))))))

(declare-fun res!9943 () Bool)

(declare-fun e!7320 () Bool)

(assert (=> start!1742 (=> (not res!9943) (not e!7320))))

(assert (=> start!1742 (= res!9943 (isStrictlySorted!64 l!1094))))

(assert (=> start!1742 e!7320))

(assert (=> start!1742 e!7322))

(assert (=> start!1742 tp_is_empty!621))

(assert (=> start!1742 true))

(declare-fun b!12258 () Bool)

(declare-fun res!9942 () Bool)

(assert (=> b!12258 (=> (not res!9942) (not e!7321))))

(declare-datatypes ((Option!51 0))(
  ( (Some!50 (v!1365 B!448)) (None!49) )
))
(declare-fun lt!3111 () Option!51)

(declare-fun getValueByKey!45 (List!371 (_ BitVec 64)) Option!51)

(assert (=> b!12258 (= res!9942 (= (getValueByKey!45 (t!2758 l!1094) key!303) lt!3111))))

(declare-fun b!12259 () Bool)

(declare-fun ListPrimitiveSize!17 (List!371) Int)

(assert (=> b!12259 (= e!7321 (>= (ListPrimitiveSize!17 (t!2758 l!1094)) (ListPrimitiveSize!17 l!1094)))))

(declare-fun b!12260 () Bool)

(assert (=> b!12260 (= e!7320 e!7321)))

(declare-fun res!9940 () Bool)

(assert (=> b!12260 (=> (not res!9940) (not e!7321))))

(assert (=> b!12260 (= res!9940 (= (getValueByKey!45 l!1094 key!303) lt!3111))))

(declare-fun v!194 () B!448)

(assert (=> b!12260 (= lt!3111 (Some!50 v!194))))

(assert (= (and start!1742 res!9943) b!12260))

(assert (= (and b!12260 res!9940) b!12257))

(assert (= (and b!12257 res!9941) b!12256))

(assert (= (and b!12256 res!9939) b!12258))

(assert (= (and b!12258 res!9942) b!12259))

(assert (= (and start!1742 ((_ is Cons!367) l!1094)) b!12255))

(declare-fun m!8411 () Bool)

(assert (=> b!12256 m!8411))

(declare-fun m!8413 () Bool)

(assert (=> start!1742 m!8413))

(declare-fun m!8415 () Bool)

(assert (=> b!12258 m!8415))

(declare-fun m!8417 () Bool)

(assert (=> b!12260 m!8417))

(declare-fun m!8419 () Bool)

(assert (=> b!12259 m!8419))

(declare-fun m!8421 () Bool)

(assert (=> b!12259 m!8421))

(check-sat tp_is_empty!621 (not b!12258) (not b!12260) (not b!12259) (not b!12256) (not start!1742) (not b!12255))
(check-sat)
(get-model)

(declare-fun d!1715 () Bool)

(declare-fun res!9963 () Bool)

(declare-fun e!7340 () Bool)

(assert (=> d!1715 (=> res!9963 e!7340)))

(assert (=> d!1715 (= res!9963 (or ((_ is Nil!368) (t!2758 l!1094)) ((_ is Nil!368) (t!2758 (t!2758 l!1094)))))))

(assert (=> d!1715 (= (isStrictlySorted!64 (t!2758 l!1094)) e!7340)))

(declare-fun b!12291 () Bool)

(declare-fun e!7341 () Bool)

(assert (=> b!12291 (= e!7340 e!7341)))

(declare-fun res!9964 () Bool)

(assert (=> b!12291 (=> (not res!9964) (not e!7341))))

(assert (=> b!12291 (= res!9964 (bvslt (_1!219 (h!933 (t!2758 l!1094))) (_1!219 (h!933 (t!2758 (t!2758 l!1094))))))))

(declare-fun b!12292 () Bool)

(assert (=> b!12292 (= e!7341 (isStrictlySorted!64 (t!2758 (t!2758 l!1094))))))

(assert (= (and d!1715 (not res!9963)) b!12291))

(assert (= (and b!12291 res!9964) b!12292))

(declare-fun m!8435 () Bool)

(assert (=> b!12292 m!8435))

(assert (=> b!12256 d!1715))

(declare-fun b!12328 () Bool)

(declare-fun e!7366 () Option!51)

(declare-fun e!7367 () Option!51)

(assert (=> b!12328 (= e!7366 e!7367)))

(declare-fun c!1080 () Bool)

(assert (=> b!12328 (= c!1080 (and ((_ is Cons!367) (t!2758 l!1094)) (not (= (_1!219 (h!933 (t!2758 l!1094))) key!303))))))

(declare-fun b!12330 () Bool)

(assert (=> b!12330 (= e!7367 None!49)))

(declare-fun d!1721 () Bool)

(declare-fun c!1079 () Bool)

(assert (=> d!1721 (= c!1079 (and ((_ is Cons!367) (t!2758 l!1094)) (= (_1!219 (h!933 (t!2758 l!1094))) key!303)))))

(assert (=> d!1721 (= (getValueByKey!45 (t!2758 l!1094) key!303) e!7366)))

(declare-fun b!12329 () Bool)

(assert (=> b!12329 (= e!7367 (getValueByKey!45 (t!2758 (t!2758 l!1094)) key!303))))

(declare-fun b!12327 () Bool)

(assert (=> b!12327 (= e!7366 (Some!50 (_2!219 (h!933 (t!2758 l!1094)))))))

(assert (= (and d!1721 c!1079) b!12327))

(assert (= (and d!1721 (not c!1079)) b!12328))

(assert (= (and b!12328 c!1080) b!12329))

(assert (= (and b!12328 (not c!1080)) b!12330))

(declare-fun m!8441 () Bool)

(assert (=> b!12329 m!8441))

(assert (=> b!12258 d!1721))

(declare-fun d!1733 () Bool)

(declare-fun res!9979 () Bool)

(declare-fun e!7371 () Bool)

(assert (=> d!1733 (=> res!9979 e!7371)))

(assert (=> d!1733 (= res!9979 (or ((_ is Nil!368) l!1094) ((_ is Nil!368) (t!2758 l!1094))))))

(assert (=> d!1733 (= (isStrictlySorted!64 l!1094) e!7371)))

(declare-fun b!12337 () Bool)

(declare-fun e!7372 () Bool)

(assert (=> b!12337 (= e!7371 e!7372)))

(declare-fun res!9980 () Bool)

(assert (=> b!12337 (=> (not res!9980) (not e!7372))))

(assert (=> b!12337 (= res!9980 (bvslt (_1!219 (h!933 l!1094)) (_1!219 (h!933 (t!2758 l!1094)))))))

(declare-fun b!12338 () Bool)

(assert (=> b!12338 (= e!7372 (isStrictlySorted!64 (t!2758 l!1094)))))

(assert (= (and d!1733 (not res!9979)) b!12337))

(assert (= (and b!12337 res!9980) b!12338))

(assert (=> b!12338 m!8411))

(assert (=> start!1742 d!1733))

(declare-fun d!1739 () Bool)

(declare-fun lt!3125 () Int)

(assert (=> d!1739 (>= lt!3125 0)))

(declare-fun e!7387 () Int)

(assert (=> d!1739 (= lt!3125 e!7387)))

(declare-fun c!1093 () Bool)

(assert (=> d!1739 (= c!1093 ((_ is Nil!368) (t!2758 l!1094)))))

(assert (=> d!1739 (= (ListPrimitiveSize!17 (t!2758 l!1094)) lt!3125)))

(declare-fun b!12364 () Bool)

(assert (=> b!12364 (= e!7387 0)))

(declare-fun b!12365 () Bool)

(assert (=> b!12365 (= e!7387 (+ 1 (ListPrimitiveSize!17 (t!2758 (t!2758 l!1094)))))))

(assert (= (and d!1739 c!1093) b!12364))

(assert (= (and d!1739 (not c!1093)) b!12365))

(declare-fun m!8449 () Bool)

(assert (=> b!12365 m!8449))

(assert (=> b!12259 d!1739))

(declare-fun d!1745 () Bool)

(declare-fun lt!3126 () Int)

(assert (=> d!1745 (>= lt!3126 0)))

(declare-fun e!7388 () Int)

(assert (=> d!1745 (= lt!3126 e!7388)))

(declare-fun c!1094 () Bool)

(assert (=> d!1745 (= c!1094 ((_ is Nil!368) l!1094))))

(assert (=> d!1745 (= (ListPrimitiveSize!17 l!1094) lt!3126)))

(declare-fun b!12366 () Bool)

(assert (=> b!12366 (= e!7388 0)))

(declare-fun b!12367 () Bool)

(assert (=> b!12367 (= e!7388 (+ 1 (ListPrimitiveSize!17 (t!2758 l!1094))))))

(assert (= (and d!1745 c!1094) b!12366))

(assert (= (and d!1745 (not c!1094)) b!12367))

(assert (=> b!12367 m!8419))

(assert (=> b!12259 d!1745))

(declare-fun b!12369 () Bool)

(declare-fun e!7389 () Option!51)

(declare-fun e!7390 () Option!51)

(assert (=> b!12369 (= e!7389 e!7390)))

(declare-fun c!1096 () Bool)

(assert (=> b!12369 (= c!1096 (and ((_ is Cons!367) l!1094) (not (= (_1!219 (h!933 l!1094)) key!303))))))

(declare-fun b!12371 () Bool)

(assert (=> b!12371 (= e!7390 None!49)))

(declare-fun d!1747 () Bool)

(declare-fun c!1095 () Bool)

(assert (=> d!1747 (= c!1095 (and ((_ is Cons!367) l!1094) (= (_1!219 (h!933 l!1094)) key!303)))))

(assert (=> d!1747 (= (getValueByKey!45 l!1094 key!303) e!7389)))

(declare-fun b!12370 () Bool)

(assert (=> b!12370 (= e!7390 (getValueByKey!45 (t!2758 l!1094) key!303))))

(declare-fun b!12368 () Bool)

(assert (=> b!12368 (= e!7389 (Some!50 (_2!219 (h!933 l!1094))))))

(assert (= (and d!1747 c!1095) b!12368))

(assert (= (and d!1747 (not c!1095)) b!12369))

(assert (= (and b!12369 c!1096) b!12370))

(assert (= (and b!12369 (not c!1096)) b!12371))

(assert (=> b!12370 m!8415))

(assert (=> b!12260 d!1747))

(declare-fun b!12380 () Bool)

(declare-fun e!7395 () Bool)

(declare-fun tp!2072 () Bool)

(assert (=> b!12380 (= e!7395 (and tp_is_empty!621 tp!2072))))

(assert (=> b!12255 (= tp!2063 e!7395)))

(assert (= (and b!12255 ((_ is Cons!367) (t!2758 l!1094))) b!12380))

(check-sat tp_is_empty!621 (not b!12338) (not b!12329) (not b!12292) (not b!12380) (not b!12370) (not b!12365) (not b!12367))
(check-sat)
