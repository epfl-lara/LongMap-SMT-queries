; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87686 () Bool)

(assert start!87686)

(declare-fun res!680721 () Bool)

(declare-fun e!570579 () Bool)

(assert (=> start!87686 (=> (not res!680721) (not e!570579))))

(declare-datatypes ((B!1426 0))(
  ( (B!1427 (val!11797 Int)) )
))
(declare-datatypes ((tuple2!15140 0))(
  ( (tuple2!15141 (_1!7581 (_ BitVec 64)) (_2!7581 B!1426)) )
))
(declare-datatypes ((List!21428 0))(
  ( (Nil!21425) (Cons!21424 (h!22622 tuple2!15140) (t!30429 List!21428)) )
))
(declare-fun l!412 () List!21428)

(declare-fun isStrictlySorted!571 (List!21428) Bool)

(assert (=> start!87686 (= res!680721 (isStrictlySorted!571 l!412))))

(assert (=> start!87686 e!570579))

(declare-fun e!570580 () Bool)

(assert (=> start!87686 e!570580))

(declare-fun tp_is_empty!23493 () Bool)

(assert (=> start!87686 tp_is_empty!23493))

(declare-fun b!1014273 () Bool)

(declare-fun res!680720 () Bool)

(assert (=> b!1014273 (=> (not res!680720) (not e!570579))))

(declare-fun value!115 () B!1426)

(get-info :version)

(assert (=> b!1014273 (= res!680720 (and (not (= (_2!7581 (h!22622 l!412)) value!115)) ((_ is Cons!21424) l!412)))))

(declare-fun b!1014274 () Bool)

(declare-fun ListPrimitiveSize!110 (List!21428) Int)

(assert (=> b!1014274 (= e!570579 (>= (ListPrimitiveSize!110 (t!30429 l!412)) (ListPrimitiveSize!110 l!412)))))

(declare-fun b!1014275 () Bool)

(declare-fun tp!70505 () Bool)

(assert (=> b!1014275 (= e!570580 (and tp_is_empty!23493 tp!70505))))

(assert (= (and start!87686 res!680721) b!1014273))

(assert (= (and b!1014273 res!680720) b!1014274))

(assert (= (and start!87686 ((_ is Cons!21424) l!412)) b!1014275))

(declare-fun m!936987 () Bool)

(assert (=> start!87686 m!936987))

(declare-fun m!936989 () Bool)

(assert (=> b!1014274 m!936989))

(declare-fun m!936991 () Bool)

(assert (=> b!1014274 m!936991))

(check-sat (not start!87686) (not b!1014274) (not b!1014275) tp_is_empty!23493)
(check-sat)
(get-model)

(declare-fun d!120729 () Bool)

(declare-fun res!680742 () Bool)

(declare-fun e!570601 () Bool)

(assert (=> d!120729 (=> res!680742 e!570601)))

(assert (=> d!120729 (= res!680742 (or ((_ is Nil!21425) l!412) ((_ is Nil!21425) (t!30429 l!412))))))

(assert (=> d!120729 (= (isStrictlySorted!571 l!412) e!570601)))

(declare-fun b!1014299 () Bool)

(declare-fun e!570602 () Bool)

(assert (=> b!1014299 (= e!570601 e!570602)))

(declare-fun res!680743 () Bool)

(assert (=> b!1014299 (=> (not res!680743) (not e!570602))))

(assert (=> b!1014299 (= res!680743 (bvslt (_1!7581 (h!22622 l!412)) (_1!7581 (h!22622 (t!30429 l!412)))))))

(declare-fun b!1014300 () Bool)

(assert (=> b!1014300 (= e!570602 (isStrictlySorted!571 (t!30429 l!412)))))

(assert (= (and d!120729 (not res!680742)) b!1014299))

(assert (= (and b!1014299 res!680743) b!1014300))

(declare-fun m!937001 () Bool)

(assert (=> b!1014300 m!937001))

(assert (=> start!87686 d!120729))

(declare-fun d!120737 () Bool)

(declare-fun lt!448480 () Int)

(assert (=> d!120737 (>= lt!448480 0)))

(declare-fun e!570616 () Int)

(assert (=> d!120737 (= lt!448480 e!570616)))

(declare-fun c!102655 () Bool)

(assert (=> d!120737 (= c!102655 ((_ is Nil!21425) (t!30429 l!412)))))

(assert (=> d!120737 (= (ListPrimitiveSize!110 (t!30429 l!412)) lt!448480)))

(declare-fun b!1014325 () Bool)

(assert (=> b!1014325 (= e!570616 0)))

(declare-fun b!1014326 () Bool)

(assert (=> b!1014326 (= e!570616 (+ 1 (ListPrimitiveSize!110 (t!30429 (t!30429 l!412)))))))

(assert (= (and d!120737 c!102655) b!1014325))

(assert (= (and d!120737 (not c!102655)) b!1014326))

(declare-fun m!937009 () Bool)

(assert (=> b!1014326 m!937009))

(assert (=> b!1014274 d!120737))

(declare-fun d!120745 () Bool)

(declare-fun lt!448482 () Int)

(assert (=> d!120745 (>= lt!448482 0)))

(declare-fun e!570619 () Int)

(assert (=> d!120745 (= lt!448482 e!570619)))

(declare-fun c!102657 () Bool)

(assert (=> d!120745 (= c!102657 ((_ is Nil!21425) l!412))))

(assert (=> d!120745 (= (ListPrimitiveSize!110 l!412) lt!448482)))

(declare-fun b!1014332 () Bool)

(assert (=> b!1014332 (= e!570619 0)))

(declare-fun b!1014333 () Bool)

(assert (=> b!1014333 (= e!570619 (+ 1 (ListPrimitiveSize!110 (t!30429 l!412))))))

(assert (= (and d!120745 c!102657) b!1014332))

(assert (= (and d!120745 (not c!102657)) b!1014333))

(assert (=> b!1014333 m!936989))

(assert (=> b!1014274 d!120745))

(declare-fun b!1014341 () Bool)

(declare-fun e!570625 () Bool)

(declare-fun tp!70517 () Bool)

(assert (=> b!1014341 (= e!570625 (and tp_is_empty!23493 tp!70517))))

(assert (=> b!1014275 (= tp!70505 e!570625)))

(assert (= (and b!1014275 ((_ is Cons!21424) (t!30429 l!412))) b!1014341))

(check-sat (not b!1014300) (not b!1014326) tp_is_empty!23493 (not b!1014341) (not b!1014333))
(check-sat)
