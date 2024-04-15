; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72060 () Bool)

(assert start!72060)

(declare-fun b!836412 () Bool)

(declare-fun e!466670 () Bool)

(declare-fun tp_is_empty!15271 () Bool)

(declare-fun tp!47480 () Bool)

(assert (=> b!836412 (= e!466670 (and tp_is_empty!15271 tp!47480))))

(declare-fun b!836411 () Bool)

(declare-fun e!466669 () Bool)

(declare-datatypes ((B!1202 0))(
  ( (B!1203 (val!7683 Int)) )
))
(declare-datatypes ((tuple2!10234 0))(
  ( (tuple2!10235 (_1!5128 (_ BitVec 64)) (_2!5128 B!1202)) )
))
(declare-datatypes ((List!15990 0))(
  ( (Nil!15987) (Cons!15986 (h!17117 tuple2!10234) (t!22352 List!15990)) )
))
(declare-fun l!390 () List!15990)

(declare-datatypes ((List!15991 0))(
  ( (Nil!15988) (Cons!15987 (h!17118 (_ BitVec 64)) (t!22353 List!15991)) )
))
(declare-fun length!23 (List!15991) Int)

(declare-fun length!24 (List!15990) Int)

(assert (=> b!836411 (= e!466669 (not (= (length!23 Nil!15988) (length!24 l!390))))))

(declare-fun b!836409 () Bool)

(declare-fun res!569053 () Bool)

(declare-fun e!466668 () Bool)

(assert (=> b!836409 (=> (not res!569053) (not e!466668))))

(get-info :version)

(assert (=> b!836409 (= res!569053 (not ((_ is Cons!15986) l!390)))))

(declare-fun b!836410 () Bool)

(assert (=> b!836410 (= e!466668 e!466669)))

(declare-fun res!569052 () Bool)

(assert (=> b!836410 (=> res!569052 e!466669)))

(assert (=> b!836410 (= res!569052 false)))

(declare-fun res!569051 () Bool)

(assert (=> start!72060 (=> (not res!569051) (not e!466668))))

(declare-fun isStrictlySorted!454 (List!15990) Bool)

(assert (=> start!72060 (= res!569051 (isStrictlySorted!454 l!390))))

(assert (=> start!72060 e!466668))

(assert (=> start!72060 e!466670))

(assert (= (and start!72060 res!569051) b!836409))

(assert (= (and b!836409 res!569053) b!836410))

(assert (= (and b!836410 (not res!569052)) b!836411))

(assert (= (and start!72060 ((_ is Cons!15986) l!390)) b!836412))

(declare-fun m!781087 () Bool)

(assert (=> b!836411 m!781087))

(declare-fun m!781089 () Bool)

(assert (=> b!836411 m!781089))

(declare-fun m!781091 () Bool)

(assert (=> start!72060 m!781091))

(check-sat (not start!72060) (not b!836411) (not b!836412) tp_is_empty!15271)
(check-sat)
(get-model)

(declare-fun d!107475 () Bool)

(declare-fun res!569076 () Bool)

(declare-fun e!466693 () Bool)

(assert (=> d!107475 (=> res!569076 e!466693)))

(assert (=> d!107475 (= res!569076 (or ((_ is Nil!15987) l!390) ((_ is Nil!15987) (t!22352 l!390))))))

(assert (=> d!107475 (= (isStrictlySorted!454 l!390) e!466693)))

(declare-fun b!836441 () Bool)

(declare-fun e!466694 () Bool)

(assert (=> b!836441 (= e!466693 e!466694)))

(declare-fun res!569077 () Bool)

(assert (=> b!836441 (=> (not res!569077) (not e!466694))))

(assert (=> b!836441 (= res!569077 (bvslt (_1!5128 (h!17117 l!390)) (_1!5128 (h!17117 (t!22352 l!390)))))))

(declare-fun b!836442 () Bool)

(assert (=> b!836442 (= e!466694 (isStrictlySorted!454 (t!22352 l!390)))))

(assert (= (and d!107475 (not res!569076)) b!836441))

(assert (= (and b!836441 res!569077) b!836442))

(declare-fun m!781107 () Bool)

(assert (=> b!836442 m!781107))

(assert (=> start!72060 d!107475))

(declare-fun d!107483 () Bool)

(declare-fun size!22887 (List!15991) Int)

(assert (=> d!107483 (= (length!23 Nil!15988) (size!22887 Nil!15988))))

(declare-fun bs!23470 () Bool)

(assert (= bs!23470 d!107483))

(declare-fun m!781113 () Bool)

(assert (=> bs!23470 m!781113))

(assert (=> b!836411 d!107483))

(declare-fun d!107489 () Bool)

(declare-fun size!22890 (List!15990) Int)

(assert (=> d!107489 (= (length!24 l!390) (size!22890 l!390))))

(declare-fun bs!23472 () Bool)

(assert (= bs!23472 d!107489))

(declare-fun m!781117 () Bool)

(assert (=> bs!23472 m!781117))

(assert (=> b!836411 d!107489))

(declare-fun b!836447 () Bool)

(declare-fun e!466699 () Bool)

(declare-fun tp!47489 () Bool)

(assert (=> b!836447 (= e!466699 (and tp_is_empty!15271 tp!47489))))

(assert (=> b!836412 (= tp!47480 e!466699)))

(assert (= (and b!836412 ((_ is Cons!15986) (t!22352 l!390))) b!836447))

(check-sat (not b!836447) (not d!107489) tp_is_empty!15271 (not b!836442) (not d!107483))
(check-sat)
(get-model)

(declare-fun d!107495 () Bool)

(declare-fun lt!380213 () Int)

(assert (=> d!107495 (>= lt!380213 0)))

(declare-fun e!466725 () Int)

(assert (=> d!107495 (= lt!380213 e!466725)))

(declare-fun c!91017 () Bool)

(assert (=> d!107495 (= c!91017 ((_ is Nil!15988) Nil!15988))))

(assert (=> d!107495 (= (size!22887 Nil!15988) lt!380213)))

(declare-fun b!836484 () Bool)

(assert (=> b!836484 (= e!466725 0)))

(declare-fun b!836485 () Bool)

(assert (=> b!836485 (= e!466725 (+ 1 (size!22887 (t!22353 Nil!15988))))))

(assert (= (and d!107495 c!91017) b!836484))

(assert (= (and d!107495 (not c!91017)) b!836485))

(declare-fun m!781129 () Bool)

(assert (=> b!836485 m!781129))

(assert (=> d!107483 d!107495))

(declare-fun d!107505 () Bool)

(declare-fun res!569094 () Bool)

(declare-fun e!466726 () Bool)

(assert (=> d!107505 (=> res!569094 e!466726)))

(assert (=> d!107505 (= res!569094 (or ((_ is Nil!15987) (t!22352 l!390)) ((_ is Nil!15987) (t!22352 (t!22352 l!390)))))))

(assert (=> d!107505 (= (isStrictlySorted!454 (t!22352 l!390)) e!466726)))

(declare-fun b!836486 () Bool)

(declare-fun e!466727 () Bool)

(assert (=> b!836486 (= e!466726 e!466727)))

(declare-fun res!569095 () Bool)

(assert (=> b!836486 (=> (not res!569095) (not e!466727))))

(assert (=> b!836486 (= res!569095 (bvslt (_1!5128 (h!17117 (t!22352 l!390))) (_1!5128 (h!17117 (t!22352 (t!22352 l!390))))))))

(declare-fun b!836487 () Bool)

(assert (=> b!836487 (= e!466727 (isStrictlySorted!454 (t!22352 (t!22352 l!390))))))

(assert (= (and d!107505 (not res!569094)) b!836486))

(assert (= (and b!836486 res!569095) b!836487))

(declare-fun m!781131 () Bool)

(assert (=> b!836487 m!781131))

(assert (=> b!836442 d!107505))

(declare-fun d!107507 () Bool)

(declare-fun lt!380222 () Int)

(assert (=> d!107507 (>= lt!380222 0)))

(declare-fun e!466737 () Int)

(assert (=> d!107507 (= lt!380222 e!466737)))

(declare-fun c!91026 () Bool)

(assert (=> d!107507 (= c!91026 ((_ is Nil!15987) l!390))))

(assert (=> d!107507 (= (size!22890 l!390) lt!380222)))

(declare-fun b!836505 () Bool)

(assert (=> b!836505 (= e!466737 0)))

(declare-fun b!836506 () Bool)

(assert (=> b!836506 (= e!466737 (+ 1 (size!22890 (t!22352 l!390))))))

(assert (= (and d!107507 c!91026) b!836505))

(assert (= (and d!107507 (not c!91026)) b!836506))

(declare-fun m!781137 () Bool)

(assert (=> b!836506 m!781137))

(assert (=> d!107489 d!107507))

(declare-fun b!836507 () Bool)

(declare-fun e!466738 () Bool)

(declare-fun tp!47497 () Bool)

(assert (=> b!836507 (= e!466738 (and tp_is_empty!15271 tp!47497))))

(assert (=> b!836447 (= tp!47489 e!466738)))

(assert (= (and b!836447 ((_ is Cons!15986) (t!22352 (t!22352 l!390)))) b!836507))

(check-sat tp_is_empty!15271 (not b!836506) (not b!836485) (not b!836507) (not b!836487))
(check-sat)
