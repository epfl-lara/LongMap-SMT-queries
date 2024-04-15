; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85370 () Bool)

(assert start!85370)

(declare-fun res!663696 () Bool)

(declare-fun e!560300 () Bool)

(assert (=> start!85370 (=> (not res!663696) (not e!560300))))

(declare-datatypes ((List!20952 0))(
  ( (Nil!20949) (Cons!20948 (h!22110 (_ BitVec 64)) (t!29944 List!20952)) )
))
(declare-fun l!3519 () List!20952)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5751 (List!20952 (_ BitVec 64)) Bool)

(assert (=> start!85370 (= res!663696 (not (contains!5751 l!3519 e!29)))))

(assert (=> start!85370 e!560300))

(assert (=> start!85370 true))

(declare-fun b!992968 () Bool)

(declare-fun res!663697 () Bool)

(assert (=> b!992968 (=> (not res!663697) (not e!560300))))

(declare-datatypes ((tuple2!15092 0))(
  ( (tuple2!15093 (_1!7557 (_ BitVec 64)) (_2!7557 List!20952)) )
))
(declare-datatypes ((Option!564 0))(
  ( (Some!563 (v!14393 tuple2!15092)) (None!562) )
))
(declare-fun isEmpty!773 (Option!564) Bool)

(declare-fun unapply!40 (List!20952) Option!564)

(assert (=> b!992968 (= res!663697 (isEmpty!773 (unapply!40 l!3519)))))

(declare-fun b!992969 () Bool)

(get-info :version)

(assert (=> b!992969 (= e!560300 (not ((_ is Nil!20949) l!3519)))))

(assert (= (and start!85370 res!663696) b!992968))

(assert (= (and b!992968 res!663697) b!992969))

(declare-fun m!920201 () Bool)

(assert (=> start!85370 m!920201))

(declare-fun m!920203 () Bool)

(assert (=> b!992968 m!920203))

(assert (=> b!992968 m!920203))

(declare-fun m!920205 () Bool)

(assert (=> b!992968 m!920205))

(check-sat (not b!992968) (not start!85370))
(check-sat)
(get-model)

(declare-fun d!118287 () Bool)

(assert (=> d!118287 (= (isEmpty!773 (unapply!40 l!3519)) (not ((_ is Some!563) (unapply!40 l!3519))))))

(assert (=> b!992968 d!118287))

(declare-fun d!118291 () Bool)

(assert (=> d!118291 (= (unapply!40 l!3519) (ite ((_ is Nil!20949) l!3519) None!562 (Some!563 (tuple2!15093 (h!22110 l!3519) (t!29944 l!3519)))))))

(assert (=> b!992968 d!118291))

(declare-fun d!118295 () Bool)

(declare-fun lt!440246 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!468 (List!20952) (InoxSet (_ BitVec 64)))

(assert (=> d!118295 (= lt!440246 (select (content!468 l!3519) e!29))))

(declare-fun e!560324 () Bool)

(assert (=> d!118295 (= lt!440246 e!560324)))

(declare-fun res!663727 () Bool)

(assert (=> d!118295 (=> (not res!663727) (not e!560324))))

(assert (=> d!118295 (= res!663727 ((_ is Cons!20948) l!3519))))

(assert (=> d!118295 (= (contains!5751 l!3519 e!29) lt!440246)))

(declare-fun b!992998 () Bool)

(declare-fun e!560323 () Bool)

(assert (=> b!992998 (= e!560324 e!560323)))

(declare-fun res!663726 () Bool)

(assert (=> b!992998 (=> res!663726 e!560323)))

(assert (=> b!992998 (= res!663726 (= (h!22110 l!3519) e!29))))

(declare-fun b!992999 () Bool)

(assert (=> b!992999 (= e!560323 (contains!5751 (t!29944 l!3519) e!29))))

(assert (= (and d!118295 res!663727) b!992998))

(assert (= (and b!992998 (not res!663726)) b!992999))

(declare-fun m!920225 () Bool)

(assert (=> d!118295 m!920225))

(declare-fun m!920229 () Bool)

(assert (=> d!118295 m!920229))

(declare-fun m!920233 () Bool)

(assert (=> b!992999 m!920233))

(assert (=> start!85370 d!118295))

(check-sat (not b!992999) (not d!118295))
(check-sat)
