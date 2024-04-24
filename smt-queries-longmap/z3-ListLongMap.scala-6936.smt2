; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87550 () Bool)

(assert start!87550)

(declare-fun b!1013360 () Bool)

(assert (=> b!1013360 true))

(assert (=> b!1013360 true))

(declare-fun res!680354 () Bool)

(declare-fun e!570173 () Bool)

(assert (=> start!87550 (=> (not res!680354) (not e!570173))))

(declare-datatypes ((B!1322 0))(
  ( (B!1323 (val!11745 Int)) )
))
(declare-datatypes ((tuple2!15040 0))(
  ( (tuple2!15041 (_1!7531 (_ BitVec 64)) (_2!7531 B!1322)) )
))
(declare-datatypes ((List!21329 0))(
  ( (Nil!21326) (Cons!21325 (h!22532 tuple2!15040) (t!30322 List!21329)) )
))
(declare-fun l!412 () List!21329)

(declare-fun isStrictlySorted!513 (List!21329) Bool)

(assert (=> start!87550 (= res!680354 (isStrictlySorted!513 l!412))))

(assert (=> start!87550 e!570173))

(declare-fun e!570172 () Bool)

(assert (=> start!87550 e!570172))

(declare-fun tp_is_empty!23389 () Bool)

(assert (=> start!87550 tp_is_empty!23389))

(declare-fun b!1013355 () Bool)

(declare-fun res!680352 () Bool)

(declare-fun e!570174 () Bool)

(assert (=> b!1013355 (=> (not res!680352) (not e!570174))))

(declare-fun head!918 (List!21329) tuple2!15040)

(assert (=> b!1013355 (= res!680352 (bvslt (_1!7531 (h!22532 l!412)) (_1!7531 (head!918 (t!30322 l!412)))))))

(declare-fun b!1013356 () Bool)

(declare-fun res!680350 () Bool)

(assert (=> b!1013356 (=> (not res!680350) (not e!570173))))

(declare-fun value!115 () B!1322)

(get-info :version)

(assert (=> b!1013356 (= res!680350 (and ((_ is Cons!21325) l!412) (= (_2!7531 (h!22532 l!412)) value!115)))))

(declare-fun b!1013357 () Bool)

(assert (=> b!1013357 (= e!570173 e!570174)))

(declare-fun res!680348 () Bool)

(assert (=> b!1013357 (=> (not res!680348) (not e!570174))))

(declare-datatypes ((List!21330 0))(
  ( (Nil!21327) (Cons!21326 (h!22533 (_ BitVec 64)) (t!30323 List!21330)) )
))
(declare-fun lt!447806 () List!21330)

(declare-fun isEmpty!783 (List!21330) Bool)

(assert (=> b!1013357 (= res!680348 (not (isEmpty!783 lt!447806)))))

(declare-fun getKeysOf!10 (List!21329 B!1322) List!21330)

(assert (=> b!1013357 (= lt!447806 (getKeysOf!10 (t!30322 l!412) value!115))))

(declare-fun b!1013358 () Bool)

(declare-fun res!680351 () Bool)

(assert (=> b!1013358 (=> (not res!680351) (not e!570174))))

(assert (=> b!1013358 (= res!680351 (isStrictlySorted!513 (t!30322 l!412)))))

(declare-fun b!1013359 () Bool)

(declare-fun lambda!274 () Int)

(declare-fun forall!204 (List!21330 Int) Bool)

(assert (=> b!1013359 (= e!570174 (not (forall!204 lt!447806 lambda!274)))))

(declare-fun res!680353 () Bool)

(assert (=> b!1013360 (=> (not res!680353) (not e!570174))))

(assert (=> b!1013360 (= res!680353 (forall!204 lt!447806 lambda!274))))

(declare-fun b!1013361 () Bool)

(declare-fun res!680349 () Bool)

(assert (=> b!1013361 (=> (not res!680349) (not e!570174))))

(declare-fun isEmpty!784 (List!21329) Bool)

(assert (=> b!1013361 (= res!680349 (not (isEmpty!784 (t!30322 l!412))))))

(declare-fun b!1013362 () Bool)

(declare-fun tp!70248 () Bool)

(assert (=> b!1013362 (= e!570172 (and tp_is_empty!23389 tp!70248))))

(assert (= (and start!87550 res!680354) b!1013356))

(assert (= (and b!1013356 res!680350) b!1013357))

(assert (= (and b!1013357 res!680348) b!1013358))

(assert (= (and b!1013358 res!680351) b!1013361))

(assert (= (and b!1013361 res!680349) b!1013360))

(assert (= (and b!1013360 res!680353) b!1013355))

(assert (= (and b!1013355 res!680352) b!1013359))

(assert (= (and start!87550 ((_ is Cons!21325) l!412)) b!1013362))

(declare-fun m!937463 () Bool)

(assert (=> start!87550 m!937463))

(declare-fun m!937465 () Bool)

(assert (=> b!1013360 m!937465))

(declare-fun m!937467 () Bool)

(assert (=> b!1013357 m!937467))

(declare-fun m!937469 () Bool)

(assert (=> b!1013357 m!937469))

(declare-fun m!937471 () Bool)

(assert (=> b!1013361 m!937471))

(assert (=> b!1013359 m!937465))

(declare-fun m!937473 () Bool)

(assert (=> b!1013358 m!937473))

(declare-fun m!937475 () Bool)

(assert (=> b!1013355 m!937475))

(check-sat (not b!1013357) (not b!1013359) (not b!1013360) (not b!1013355) (not b!1013362) (not b!1013358) (not b!1013361) tp_is_empty!23389 (not start!87550))
(check-sat)
