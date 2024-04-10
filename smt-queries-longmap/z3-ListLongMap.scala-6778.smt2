; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85252 () Bool)

(assert start!85252)

(declare-fun res!663602 () Bool)

(declare-fun e!560201 () Bool)

(assert (=> start!85252 (=> (not res!663602) (not e!560201))))

(declare-datatypes ((List!20906 0))(
  ( (Nil!20903) (Cons!20902 (h!22064 (_ BitVec 64)) (t!29907 List!20906)) )
))
(declare-fun l!3519 () List!20906)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5767 (List!20906 (_ BitVec 64)) Bool)

(assert (=> start!85252 (= res!663602 (not (contains!5767 l!3519 e!29)))))

(assert (=> start!85252 e!560201))

(assert (=> start!85252 true))

(declare-fun b!992895 () Bool)

(declare-fun e!560202 () Bool)

(assert (=> b!992895 (= e!560201 e!560202)))

(declare-fun res!663603 () Bool)

(assert (=> b!992895 (=> (not res!663603) (not e!560202))))

(declare-datatypes ((tuple2!14990 0))(
  ( (tuple2!14991 (_1!7506 (_ BitVec 64)) (_2!7506 List!20906)) )
))
(declare-datatypes ((Option!550 0))(
  ( (Some!549 (v!14371 tuple2!14990)) (None!548) )
))
(declare-fun lt!440338 () Option!550)

(declare-fun isEmpty!757 (Option!550) Bool)

(assert (=> b!992895 (= res!663603 (not (isEmpty!757 lt!440338)))))

(declare-fun unapply!29 (List!20906) Option!550)

(assert (=> b!992895 (= lt!440338 (unapply!29 l!3519))))

(declare-fun b!992896 () Bool)

(declare-fun get!15714 (Option!550) tuple2!14990)

(assert (=> b!992896 (= e!560202 (contains!5767 (_2!7506 (get!15714 lt!440338)) e!29))))

(assert (= (and start!85252 res!663602) b!992895))

(assert (= (and b!992895 res!663603) b!992896))

(declare-fun m!920597 () Bool)

(assert (=> start!85252 m!920597))

(declare-fun m!920599 () Bool)

(assert (=> b!992895 m!920599))

(declare-fun m!920601 () Bool)

(assert (=> b!992895 m!920601))

(declare-fun m!920603 () Bool)

(assert (=> b!992896 m!920603))

(declare-fun m!920605 () Bool)

(assert (=> b!992896 m!920605))

(check-sat (not b!992895) (not b!992896) (not start!85252))
(check-sat)
(get-model)

(declare-fun d!118329 () Bool)

(get-info :version)

(assert (=> d!118329 (= (isEmpty!757 lt!440338) (not ((_ is Some!549) lt!440338)))))

(assert (=> b!992895 d!118329))

(declare-fun d!118335 () Bool)

(assert (=> d!118335 (= (unapply!29 l!3519) (ite ((_ is Nil!20903) l!3519) None!548 (Some!549 (tuple2!14991 (h!22064 l!3519) (t!29907 l!3519)))))))

(assert (=> b!992895 d!118335))

(declare-fun d!118339 () Bool)

(declare-fun lt!440351 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!458 (List!20906) (InoxSet (_ BitVec 64)))

(assert (=> d!118339 (= lt!440351 (select (content!458 (_2!7506 (get!15714 lt!440338))) e!29))))

(declare-fun e!560227 () Bool)

(assert (=> d!118339 (= lt!440351 e!560227)))

(declare-fun res!663628 () Bool)

(assert (=> d!118339 (=> (not res!663628) (not e!560227))))

(assert (=> d!118339 (= res!663628 ((_ is Cons!20902) (_2!7506 (get!15714 lt!440338))))))

(assert (=> d!118339 (= (contains!5767 (_2!7506 (get!15714 lt!440338)) e!29) lt!440351)))

(declare-fun b!992921 () Bool)

(declare-fun e!560228 () Bool)

(assert (=> b!992921 (= e!560227 e!560228)))

(declare-fun res!663629 () Bool)

(assert (=> b!992921 (=> res!663629 e!560228)))

(assert (=> b!992921 (= res!663629 (= (h!22064 (_2!7506 (get!15714 lt!440338))) e!29))))

(declare-fun b!992922 () Bool)

(assert (=> b!992922 (= e!560228 (contains!5767 (t!29907 (_2!7506 (get!15714 lt!440338))) e!29))))

(assert (= (and d!118339 res!663628) b!992921))

(assert (= (and b!992921 (not res!663629)) b!992922))

(declare-fun m!920631 () Bool)

(assert (=> d!118339 m!920631))

(declare-fun m!920635 () Bool)

(assert (=> d!118339 m!920635))

(declare-fun m!920639 () Bool)

(assert (=> b!992922 m!920639))

(assert (=> b!992896 d!118339))

(declare-fun d!118353 () Bool)

(assert (=> d!118353 (= (get!15714 lt!440338) (v!14371 lt!440338))))

(assert (=> b!992896 d!118353))

(declare-fun d!118357 () Bool)

(declare-fun lt!440353 () Bool)

(assert (=> d!118357 (= lt!440353 (select (content!458 l!3519) e!29))))

(declare-fun e!560231 () Bool)

(assert (=> d!118357 (= lt!440353 e!560231)))

(declare-fun res!663632 () Bool)

(assert (=> d!118357 (=> (not res!663632) (not e!560231))))

(assert (=> d!118357 (= res!663632 ((_ is Cons!20902) l!3519))))

(assert (=> d!118357 (= (contains!5767 l!3519 e!29) lt!440353)))

(declare-fun b!992925 () Bool)

(declare-fun e!560232 () Bool)

(assert (=> b!992925 (= e!560231 e!560232)))

(declare-fun res!663633 () Bool)

(assert (=> b!992925 (=> res!663633 e!560232)))

(assert (=> b!992925 (= res!663633 (= (h!22064 l!3519) e!29))))

(declare-fun b!992926 () Bool)

(assert (=> b!992926 (= e!560232 (contains!5767 (t!29907 l!3519) e!29))))

(assert (= (and d!118357 res!663632) b!992925))

(assert (= (and b!992925 (not res!663633)) b!992926))

(declare-fun m!920644 () Bool)

(assert (=> d!118357 m!920644))

(declare-fun m!920649 () Bool)

(assert (=> d!118357 m!920649))

(declare-fun m!920651 () Bool)

(assert (=> b!992926 m!920651))

(assert (=> start!85252 d!118357))

(check-sat (not b!992926) (not d!118339) (not d!118357) (not b!992922))
(check-sat)
