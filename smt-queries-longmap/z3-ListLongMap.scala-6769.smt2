; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84944 () Bool)

(assert start!84944)

(declare-fun res!663082 () Bool)

(declare-fun e!559571 () Bool)

(assert (=> start!84944 (=> (not res!663082) (not e!559571))))

(declare-datatypes ((List!20913 0))(
  ( (Nil!20910) (Cons!20909 (h!22071 (_ BitVec 64)) (t!29890 List!20913)) )
))
(declare-fun tail!21 () List!20913)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5712 (List!20913 (_ BitVec 64)) Bool)

(assert (=> start!84944 (= res!663082 (not (contains!5712 tail!21 head!726)))))

(assert (=> start!84944 e!559571))

(assert (=> start!84944 true))

(declare-fun b!992000 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!431 (List!20913) (InoxSet (_ BitVec 64)))

(assert (=> b!992000 (= e!559571 (select (content!431 tail!21) head!726))))

(assert (= (and start!84944 res!663082) b!992000))

(declare-fun m!919187 () Bool)

(assert (=> start!84944 m!919187))

(declare-fun m!919189 () Bool)

(assert (=> b!992000 m!919189))

(declare-fun m!919191 () Bool)

(assert (=> b!992000 m!919191))

(check-sat (not b!992000) (not start!84944))
(check-sat)
(get-model)

(declare-fun d!117865 () Bool)

(declare-fun c!100601 () Bool)

(get-info :version)

(assert (=> d!117865 (= c!100601 ((_ is Nil!20910) tail!21))))

(declare-fun e!559587 () (InoxSet (_ BitVec 64)))

(assert (=> d!117865 (= (content!431 tail!21) e!559587)))

(declare-fun b!992021 () Bool)

(assert (=> b!992021 (= e!559587 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992022 () Bool)

(assert (=> b!992022 (= e!559587 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22071 tail!21) true) (content!431 (t!29890 tail!21))))))

(assert (= (and d!117865 c!100601) b!992021))

(assert (= (and d!117865 (not c!100601)) b!992022))

(declare-fun m!919209 () Bool)

(assert (=> b!992022 m!919209))

(declare-fun m!919211 () Bool)

(assert (=> b!992022 m!919211))

(assert (=> b!992000 d!117865))

(declare-fun d!117869 () Bool)

(declare-fun lt!439880 () Bool)

(assert (=> d!117869 (= lt!439880 (select (content!431 tail!21) head!726))))

(declare-fun e!559604 () Bool)

(assert (=> d!117869 (= lt!439880 e!559604)))

(declare-fun res!663105 () Bool)

(assert (=> d!117869 (=> (not res!663105) (not e!559604))))

(assert (=> d!117869 (= res!663105 ((_ is Cons!20909) tail!21))))

(assert (=> d!117869 (= (contains!5712 tail!21 head!726) lt!439880)))

(declare-fun b!992041 () Bool)

(declare-fun e!559603 () Bool)

(assert (=> b!992041 (= e!559604 e!559603)))

(declare-fun res!663106 () Bool)

(assert (=> b!992041 (=> res!663106 e!559603)))

(assert (=> b!992041 (= res!663106 (= (h!22071 tail!21) head!726))))

(declare-fun b!992042 () Bool)

(assert (=> b!992042 (= e!559603 (contains!5712 (t!29890 tail!21) head!726))))

(assert (= (and d!117869 res!663105) b!992041))

(assert (= (and b!992041 (not res!663106)) b!992042))

(assert (=> d!117869 m!919189))

(assert (=> d!117869 m!919191))

(declare-fun m!919221 () Bool)

(assert (=> b!992042 m!919221))

(assert (=> start!84944 d!117869))

(check-sat (not b!992042) (not d!117869) (not b!992022))
(check-sat)
