; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87684 () Bool)

(assert start!87684)

(declare-fun res!680654 () Bool)

(declare-fun e!570496 () Bool)

(assert (=> start!87684 (=> (not res!680654) (not e!570496))))

(declare-datatypes ((B!1424 0))(
  ( (B!1425 (val!11796 Int)) )
))
(declare-datatypes ((tuple2!15218 0))(
  ( (tuple2!15219 (_1!7620 (_ BitVec 64)) (_2!7620 B!1424)) )
))
(declare-datatypes ((List!21462 0))(
  ( (Nil!21459) (Cons!21458 (h!22656 tuple2!15218) (t!30454 List!21462)) )
))
(declare-fun l!412 () List!21462)

(declare-fun isStrictlySorted!566 (List!21462) Bool)

(assert (=> start!87684 (= res!680654 (isStrictlySorted!566 l!412))))

(assert (=> start!87684 e!570496))

(declare-fun e!570497 () Bool)

(assert (=> start!87684 e!570497))

(declare-fun tp_is_empty!23491 () Bool)

(assert (=> start!87684 tp_is_empty!23491))

(declare-fun b!1014134 () Bool)

(declare-fun res!680653 () Bool)

(assert (=> b!1014134 (=> (not res!680653) (not e!570496))))

(declare-fun value!115 () B!1424)

(get-info :version)

(assert (=> b!1014134 (= res!680653 (and (not (= (_2!7620 (h!22656 l!412)) value!115)) ((_ is Cons!21458) l!412)))))

(declare-fun b!1014135 () Bool)

(declare-fun ListPrimitiveSize!109 (List!21462) Int)

(assert (=> b!1014135 (= e!570496 (>= (ListPrimitiveSize!109 (t!30454 l!412)) (ListPrimitiveSize!109 l!412)))))

(declare-fun b!1014136 () Bool)

(declare-fun tp!70503 () Bool)

(assert (=> b!1014136 (= e!570497 (and tp_is_empty!23491 tp!70503))))

(assert (= (and start!87684 res!680654) b!1014134))

(assert (= (and b!1014134 res!680653) b!1014135))

(assert (= (and start!87684 ((_ is Cons!21458) l!412)) b!1014136))

(declare-fun m!936373 () Bool)

(assert (=> start!87684 m!936373))

(declare-fun m!936375 () Bool)

(assert (=> b!1014135 m!936375))

(declare-fun m!936377 () Bool)

(assert (=> b!1014135 m!936377))

(check-sat (not b!1014135) (not start!87684) (not b!1014136) tp_is_empty!23491)
(check-sat)
(get-model)

(declare-fun d!120592 () Bool)

(declare-fun lt!448278 () Int)

(assert (=> d!120592 (>= lt!448278 0)))

(declare-fun e!570517 () Int)

(assert (=> d!120592 (= lt!448278 e!570517)))

(declare-fun c!102621 () Bool)

(assert (=> d!120592 (= c!102621 ((_ is Nil!21459) (t!30454 l!412)))))

(assert (=> d!120592 (= (ListPrimitiveSize!109 (t!30454 l!412)) lt!448278)))

(declare-fun b!1014168 () Bool)

(assert (=> b!1014168 (= e!570517 0)))

(declare-fun b!1014170 () Bool)

(assert (=> b!1014170 (= e!570517 (+ 1 (ListPrimitiveSize!109 (t!30454 (t!30454 l!412)))))))

(assert (= (and d!120592 c!102621) b!1014168))

(assert (= (and d!120592 (not c!102621)) b!1014170))

(declare-fun m!936392 () Bool)

(assert (=> b!1014170 m!936392))

(assert (=> b!1014135 d!120592))

(declare-fun d!120599 () Bool)

(declare-fun lt!448281 () Int)

(assert (=> d!120599 (>= lt!448281 0)))

(declare-fun e!570520 () Int)

(assert (=> d!120599 (= lt!448281 e!570520)))

(declare-fun c!102624 () Bool)

(assert (=> d!120599 (= c!102624 ((_ is Nil!21459) l!412))))

(assert (=> d!120599 (= (ListPrimitiveSize!109 l!412) lt!448281)))

(declare-fun b!1014174 () Bool)

(assert (=> b!1014174 (= e!570520 0)))

(declare-fun b!1014175 () Bool)

(assert (=> b!1014175 (= e!570520 (+ 1 (ListPrimitiveSize!109 (t!30454 l!412))))))

(assert (= (and d!120599 c!102624) b!1014174))

(assert (= (and d!120599 (not c!102624)) b!1014175))

(assert (=> b!1014175 m!936375))

(assert (=> b!1014135 d!120599))

(declare-fun d!120605 () Bool)

(declare-fun res!680681 () Bool)

(declare-fun e!570536 () Bool)

(assert (=> d!120605 (=> res!680681 e!570536)))

(assert (=> d!120605 (= res!680681 (or ((_ is Nil!21459) l!412) ((_ is Nil!21459) (t!30454 l!412))))))

(assert (=> d!120605 (= (isStrictlySorted!566 l!412) e!570536)))

(declare-fun b!1014193 () Bool)

(declare-fun e!570537 () Bool)

(assert (=> b!1014193 (= e!570536 e!570537)))

(declare-fun res!680682 () Bool)

(assert (=> b!1014193 (=> (not res!680682) (not e!570537))))

(assert (=> b!1014193 (= res!680682 (bvslt (_1!7620 (h!22656 l!412)) (_1!7620 (h!22656 (t!30454 l!412)))))))

(declare-fun b!1014194 () Bool)

(assert (=> b!1014194 (= e!570537 (isStrictlySorted!566 (t!30454 l!412)))))

(assert (= (and d!120605 (not res!680681)) b!1014193))

(assert (= (and b!1014193 res!680682) b!1014194))

(declare-fun m!936399 () Bool)

(assert (=> b!1014194 m!936399))

(assert (=> start!87684 d!120605))

(declare-fun b!1014211 () Bool)

(declare-fun e!570548 () Bool)

(declare-fun tp!70518 () Bool)

(assert (=> b!1014211 (= e!570548 (and tp_is_empty!23491 tp!70518))))

(assert (=> b!1014136 (= tp!70503 e!570548)))

(assert (= (and b!1014136 ((_ is Cons!21458) (t!30454 l!412))) b!1014211))

(check-sat (not b!1014194) (not b!1014211) (not b!1014175) (not b!1014170) tp_is_empty!23491)
(check-sat)
