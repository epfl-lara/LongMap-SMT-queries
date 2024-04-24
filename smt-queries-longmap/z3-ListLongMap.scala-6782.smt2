; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85556 () Bool)

(assert start!85556)

(declare-fun res!664150 () Bool)

(declare-fun e!561030 () Bool)

(assert (=> start!85556 (=> (not res!664150) (not e!561030))))

(declare-datatypes ((List!20906 0))(
  ( (Nil!20903) (Cons!20902 (h!22070 (_ BitVec 64)) (t!29899 List!20906)) )
))
(declare-fun l!3519 () List!20906)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5800 (List!20906 (_ BitVec 64)) Bool)

(assert (=> start!85556 (= res!664150 (not (contains!5800 l!3519 e!29)))))

(assert (=> start!85556 e!561030))

(assert (=> start!85556 true))

(declare-fun b!994110 () Bool)

(declare-fun res!664151 () Bool)

(assert (=> b!994110 (=> (not res!664151) (not e!561030))))

(declare-datatypes ((tuple2!15016 0))(
  ( (tuple2!15017 (_1!7519 (_ BitVec 64)) (_2!7519 List!20906)) )
))
(declare-datatypes ((Option!559 0))(
  ( (Some!558 (v!14391 tuple2!15016)) (None!557) )
))
(declare-fun isEmpty!774 (Option!559) Bool)

(declare-fun unapply!40 (List!20906) Option!559)

(assert (=> b!994110 (= res!664151 (isEmpty!774 (unapply!40 l!3519)))))

(declare-fun b!994111 () Bool)

(get-info :version)

(assert (=> b!994111 (= e!561030 (not ((_ is Nil!20903) l!3519)))))

(assert (= (and start!85556 res!664150) b!994110))

(assert (= (and b!994110 res!664151) b!994111))

(declare-fun m!922253 () Bool)

(assert (=> start!85556 m!922253))

(declare-fun m!922255 () Bool)

(assert (=> b!994110 m!922255))

(assert (=> b!994110 m!922255))

(declare-fun m!922257 () Bool)

(assert (=> b!994110 m!922257))

(check-sat (not b!994110) (not start!85556))
(check-sat)
(get-model)

(declare-fun d!118805 () Bool)

(assert (=> d!118805 (= (isEmpty!774 (unapply!40 l!3519)) (not ((_ is Some!558) (unapply!40 l!3519))))))

(assert (=> b!994110 d!118805))

(declare-fun d!118810 () Bool)

(assert (=> d!118810 (= (unapply!40 l!3519) (ite ((_ is Nil!20903) l!3519) None!557 (Some!558 (tuple2!15017 (h!22070 l!3519) (t!29899 l!3519)))))))

(assert (=> b!994110 d!118810))

(declare-fun d!118815 () Bool)

(declare-fun lt!440842 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!470 (List!20906) (InoxSet (_ BitVec 64)))

(assert (=> d!118815 (= lt!440842 (select (content!470 l!3519) e!29))))

(declare-fun e!561052 () Bool)

(assert (=> d!118815 (= lt!440842 e!561052)))

(declare-fun res!664179 () Bool)

(assert (=> d!118815 (=> (not res!664179) (not e!561052))))

(assert (=> d!118815 (= res!664179 ((_ is Cons!20902) l!3519))))

(assert (=> d!118815 (= (contains!5800 l!3519 e!29) lt!440842)))

(declare-fun b!994138 () Bool)

(declare-fun e!561051 () Bool)

(assert (=> b!994138 (= e!561052 e!561051)))

(declare-fun res!664178 () Bool)

(assert (=> b!994138 (=> res!664178 e!561051)))

(assert (=> b!994138 (= res!664178 (= (h!22070 l!3519) e!29))))

(declare-fun b!994139 () Bool)

(assert (=> b!994139 (= e!561051 (contains!5800 (t!29899 l!3519) e!29))))

(assert (= (and d!118815 res!664179) b!994138))

(assert (= (and b!994138 (not res!664178)) b!994139))

(declare-fun m!922277 () Bool)

(assert (=> d!118815 m!922277))

(declare-fun m!922279 () Bool)

(assert (=> d!118815 m!922279))

(declare-fun m!922283 () Bool)

(assert (=> b!994139 m!922283))

(assert (=> start!85556 d!118815))

(check-sat (not b!994139) (not d!118815))
(check-sat)
