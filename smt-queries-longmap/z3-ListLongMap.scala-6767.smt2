; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85082 () Bool)

(assert start!85082)

(declare-fun res!663470 () Bool)

(declare-fun e!560240 () Bool)

(assert (=> start!85082 (=> (not res!663470) (not e!560240))))

(declare-datatypes ((List!20861 0))(
  ( (Nil!20858) (Cons!20857 (h!22025 (_ BitVec 64)) (t!29836 List!20861)) )
))
(declare-fun tail!21 () List!20861)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5755 (List!20861 (_ BitVec 64)) Bool)

(assert (=> start!85082 (= res!663470 (not (contains!5755 tail!21 head!726)))))

(assert (=> start!85082 e!560240))

(assert (=> start!85082 true))

(declare-fun b!993056 () Bool)

(declare-fun res!663469 () Bool)

(assert (=> b!993056 (=> (not res!663469) (not e!560240))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!427 (List!20861) (InoxSet (_ BitVec 64)))

(assert (=> b!993056 (= res!663469 (not (select (content!427 tail!21) head!726)))))

(declare-fun b!993057 () Bool)

(declare-fun e!560241 () Bool)

(assert (=> b!993057 (= e!560240 e!560241)))

(declare-fun res!663468 () Bool)

(assert (=> b!993057 (=> (not res!663468) (not e!560241))))

(declare-datatypes ((tuple2!14938 0))(
  ( (tuple2!14939 (_1!7480 (_ BitVec 64)) (_2!7480 List!20861)) )
))
(declare-datatypes ((Option!520 0))(
  ( (Some!519 (v!14313 tuple2!14938)) (None!518) )
))
(declare-fun lt!440435 () Option!520)

(declare-fun isEmpty!735 (Option!520) Bool)

(assert (=> b!993057 (= res!663468 (not (isEmpty!735 lt!440435)))))

(declare-fun unapply!1 (List!20861) Option!520)

(declare-fun $colon$colon!557 (List!20861 (_ BitVec 64)) List!20861)

(assert (=> b!993057 (= lt!440435 (unapply!1 ($colon$colon!557 tail!21 head!726)))))

(declare-fun b!993058 () Bool)

(declare-fun isDefined!385 (Option!520) Bool)

(assert (=> b!993058 (= e!560241 (not (isDefined!385 lt!440435)))))

(assert (= (and start!85082 res!663470) b!993056))

(assert (= (and b!993056 res!663469) b!993057))

(assert (= (and b!993057 res!663468) b!993058))

(declare-fun m!921131 () Bool)

(assert (=> start!85082 m!921131))

(declare-fun m!921133 () Bool)

(assert (=> b!993056 m!921133))

(declare-fun m!921135 () Bool)

(assert (=> b!993056 m!921135))

(declare-fun m!921137 () Bool)

(assert (=> b!993057 m!921137))

(declare-fun m!921139 () Bool)

(assert (=> b!993057 m!921139))

(assert (=> b!993057 m!921139))

(declare-fun m!921141 () Bool)

(assert (=> b!993057 m!921141))

(declare-fun m!921143 () Bool)

(assert (=> b!993058 m!921143))

(check-sat (not start!85082) (not b!993058) (not b!993056) (not b!993057))
(check-sat)
(get-model)

(declare-fun d!118341 () Bool)

(declare-fun lt!440444 () Bool)

(assert (=> d!118341 (= lt!440444 (select (content!427 tail!21) head!726))))

(declare-fun e!560261 () Bool)

(assert (=> d!118341 (= lt!440444 e!560261)))

(declare-fun res!663493 () Bool)

(assert (=> d!118341 (=> (not res!663493) (not e!560261))))

(get-info :version)

(assert (=> d!118341 (= res!663493 ((_ is Cons!20857) tail!21))))

(assert (=> d!118341 (= (contains!5755 tail!21 head!726) lt!440444)))

(declare-fun b!993087 () Bool)

(declare-fun e!560262 () Bool)

(assert (=> b!993087 (= e!560261 e!560262)))

(declare-fun res!663494 () Bool)

(assert (=> b!993087 (=> res!663494 e!560262)))

(assert (=> b!993087 (= res!663494 (= (h!22025 tail!21) head!726))))

(declare-fun b!993088 () Bool)

(assert (=> b!993088 (= e!560262 (contains!5755 (t!29836 tail!21) head!726))))

(assert (= (and d!118341 res!663493) b!993087))

(assert (= (and b!993087 (not res!663494)) b!993088))

(assert (=> d!118341 m!921133))

(assert (=> d!118341 m!921135))

(declare-fun m!921177 () Bool)

(assert (=> b!993088 m!921177))

(assert (=> start!85082 d!118341))

(declare-fun d!118355 () Bool)

(assert (=> d!118355 (= (isDefined!385 lt!440435) (not (isEmpty!735 lt!440435)))))

(declare-fun bs!28220 () Bool)

(assert (= bs!28220 d!118355))

(assert (=> bs!28220 m!921137))

(assert (=> b!993058 d!118355))

(declare-fun d!118357 () Bool)

(declare-fun c!100939 () Bool)

(assert (=> d!118357 (= c!100939 ((_ is Nil!20858) tail!21))))

(declare-fun e!560277 () (InoxSet (_ BitVec 64)))

(assert (=> d!118357 (= (content!427 tail!21) e!560277)))

(declare-fun b!993105 () Bool)

(assert (=> b!993105 (= e!560277 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993106 () Bool)

(assert (=> b!993106 (= e!560277 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22025 tail!21) true) (content!427 (t!29836 tail!21))))))

(assert (= (and d!118357 c!100939) b!993105))

(assert (= (and d!118357 (not c!100939)) b!993106))

(declare-fun m!921183 () Bool)

(assert (=> b!993106 m!921183))

(declare-fun m!921185 () Bool)

(assert (=> b!993106 m!921185))

(assert (=> b!993056 d!118357))

(declare-fun d!118363 () Bool)

(assert (=> d!118363 (= (isEmpty!735 lt!440435) (not ((_ is Some!519) lt!440435)))))

(assert (=> b!993057 d!118363))

(declare-fun d!118369 () Bool)

(assert (=> d!118369 (= (unapply!1 ($colon$colon!557 tail!21 head!726)) (ite ((_ is Nil!20858) ($colon$colon!557 tail!21 head!726)) None!518 (Some!519 (tuple2!14939 (h!22025 ($colon$colon!557 tail!21 head!726)) (t!29836 ($colon$colon!557 tail!21 head!726))))))))

(assert (=> b!993057 d!118369))

(declare-fun d!118373 () Bool)

(assert (=> d!118373 (= ($colon$colon!557 tail!21 head!726) (Cons!20857 head!726 tail!21))))

(assert (=> b!993057 d!118373))

(check-sat (not d!118355) (not b!993088) (not d!118341) (not b!993106))
(check-sat)
