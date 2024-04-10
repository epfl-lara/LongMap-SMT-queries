; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87362 () Bool)

(assert start!87362)

(declare-fun res!679995 () Bool)

(declare-fun e!569497 () Bool)

(assert (=> start!87362 (=> (not res!679995) (not e!569497))))

(declare-datatypes ((B!1342 0))(
  ( (B!1343 (val!11755 Int)) )
))
(declare-datatypes ((tuple2!15056 0))(
  ( (tuple2!15057 (_1!7539 (_ BitVec 64)) (_2!7539 B!1342)) )
))
(declare-datatypes ((List!21359 0))(
  ( (Nil!21356) (Cons!21355 (h!22553 tuple2!15056) (t!30360 List!21359)) )
))
(declare-fun l!412 () List!21359)

(declare-fun isStrictlySorted!535 (List!21359) Bool)

(assert (=> start!87362 (= res!679995 (isStrictlySorted!535 l!412))))

(assert (=> start!87362 e!569497))

(declare-fun e!569496 () Bool)

(assert (=> start!87362 e!569496))

(declare-fun tp_is_empty!23409 () Bool)

(assert (=> start!87362 tp_is_empty!23409))

(declare-fun b!1012380 () Bool)

(declare-fun res!679994 () Bool)

(assert (=> b!1012380 (=> (not res!679994) (not e!569497))))

(declare-fun value!115 () B!1342)

(get-info :version)

(assert (=> b!1012380 (= res!679994 (and (not (= (_2!7539 (h!22553 l!412)) value!115)) ((_ is Cons!21355) l!412)))))

(declare-fun b!1012381 () Bool)

(assert (=> b!1012381 (= e!569497 (not (isStrictlySorted!535 (t!30360 l!412))))))

(declare-fun b!1012382 () Bool)

(declare-fun tp!70286 () Bool)

(assert (=> b!1012382 (= e!569496 (and tp_is_empty!23409 tp!70286))))

(assert (= (and start!87362 res!679995) b!1012380))

(assert (= (and b!1012380 res!679994) b!1012381))

(assert (= (and start!87362 ((_ is Cons!21355) l!412)) b!1012382))

(declare-fun m!935993 () Bool)

(assert (=> start!87362 m!935993))

(declare-fun m!935995 () Bool)

(assert (=> b!1012381 m!935995))

(check-sat (not b!1012381) (not start!87362) (not b!1012382) tp_is_empty!23409)
(check-sat)
(get-model)

(declare-fun d!120281 () Bool)

(declare-fun res!680010 () Bool)

(declare-fun e!569512 () Bool)

(assert (=> d!120281 (=> res!680010 e!569512)))

(assert (=> d!120281 (= res!680010 (or ((_ is Nil!21356) (t!30360 l!412)) ((_ is Nil!21356) (t!30360 (t!30360 l!412)))))))

(assert (=> d!120281 (= (isStrictlySorted!535 (t!30360 l!412)) e!569512)))

(declare-fun b!1012400 () Bool)

(declare-fun e!569513 () Bool)

(assert (=> b!1012400 (= e!569512 e!569513)))

(declare-fun res!680011 () Bool)

(assert (=> b!1012400 (=> (not res!680011) (not e!569513))))

(assert (=> b!1012400 (= res!680011 (bvslt (_1!7539 (h!22553 (t!30360 l!412))) (_1!7539 (h!22553 (t!30360 (t!30360 l!412))))))))

(declare-fun b!1012401 () Bool)

(assert (=> b!1012401 (= e!569513 (isStrictlySorted!535 (t!30360 (t!30360 l!412))))))

(assert (= (and d!120281 (not res!680010)) b!1012400))

(assert (= (and b!1012400 res!680011) b!1012401))

(declare-fun m!936001 () Bool)

(assert (=> b!1012401 m!936001))

(assert (=> b!1012381 d!120281))

(declare-fun d!120287 () Bool)

(declare-fun res!680016 () Bool)

(declare-fun e!569518 () Bool)

(assert (=> d!120287 (=> res!680016 e!569518)))

(assert (=> d!120287 (= res!680016 (or ((_ is Nil!21356) l!412) ((_ is Nil!21356) (t!30360 l!412))))))

(assert (=> d!120287 (= (isStrictlySorted!535 l!412) e!569518)))

(declare-fun b!1012406 () Bool)

(declare-fun e!569519 () Bool)

(assert (=> b!1012406 (= e!569518 e!569519)))

(declare-fun res!680017 () Bool)

(assert (=> b!1012406 (=> (not res!680017) (not e!569519))))

(assert (=> b!1012406 (= res!680017 (bvslt (_1!7539 (h!22553 l!412)) (_1!7539 (h!22553 (t!30360 l!412)))))))

(declare-fun b!1012407 () Bool)

(assert (=> b!1012407 (= e!569519 (isStrictlySorted!535 (t!30360 l!412)))))

(assert (= (and d!120287 (not res!680016)) b!1012406))

(assert (= (and b!1012406 res!680017) b!1012407))

(assert (=> b!1012407 m!935995))

(assert (=> start!87362 d!120287))

(declare-fun b!1012418 () Bool)

(declare-fun e!569526 () Bool)

(declare-fun tp!70292 () Bool)

(assert (=> b!1012418 (= e!569526 (and tp_is_empty!23409 tp!70292))))

(assert (=> b!1012382 (= tp!70286 e!569526)))

(assert (= (and b!1012382 ((_ is Cons!21355) (t!30360 l!412))) b!1012418))

(check-sat (not b!1012407) (not b!1012401) (not b!1012418) tp_is_empty!23409)
(check-sat)
