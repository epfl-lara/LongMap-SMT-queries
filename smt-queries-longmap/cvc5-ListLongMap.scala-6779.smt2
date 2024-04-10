; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85280 () Bool)

(assert start!85280)

(declare-fun res!663642 () Bool)

(declare-fun e!560239 () Bool)

(assert (=> start!85280 (=> (not res!663642) (not e!560239))))

(declare-datatypes ((List!20908 0))(
  ( (Nil!20905) (Cons!20904 (h!22066 (_ BitVec 64)) (t!29909 List!20908)) )
))
(declare-fun l!3519 () List!20908)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5769 (List!20908 (_ BitVec 64)) Bool)

(assert (=> start!85280 (= res!663642 (not (contains!5769 l!3519 e!29)))))

(assert (=> start!85280 e!560239))

(assert (=> start!85280 true))

(declare-fun b!992933 () Bool)

(declare-fun e!560241 () Bool)

(assert (=> b!992933 (= e!560239 e!560241)))

(declare-fun res!663640 () Bool)

(assert (=> b!992933 (=> (not res!663640) (not e!560241))))

(declare-datatypes ((tuple2!14994 0))(
  ( (tuple2!14995 (_1!7508 (_ BitVec 64)) (_2!7508 List!20908)) )
))
(declare-datatypes ((Option!552 0))(
  ( (Some!551 (v!14376 tuple2!14994)) (None!550) )
))
(declare-fun lt!440358 () Option!552)

(declare-fun isEmpty!759 (Option!552) Bool)

(assert (=> b!992933 (= res!663640 (not (isEmpty!759 lt!440358)))))

(declare-fun unapply!31 (List!20908) Option!552)

(assert (=> b!992933 (= lt!440358 (unapply!31 l!3519))))

(declare-fun b!992934 () Bool)

(declare-fun e!560240 () Bool)

(assert (=> b!992934 (= e!560241 e!560240)))

(declare-fun res!663641 () Bool)

(assert (=> b!992934 (=> (not res!663641) (not e!560240))))

(declare-fun lt!440359 () tuple2!14994)

(assert (=> b!992934 (= res!663641 (not (contains!5769 (_2!7508 lt!440359) e!29)))))

(declare-fun get!15718 (Option!552) tuple2!14994)

(assert (=> b!992934 (= lt!440359 (get!15718 lt!440358))))

(declare-fun b!992935 () Bool)

(declare-fun ListPrimitiveSize!94 (List!20908) Int)

(assert (=> b!992935 (= e!560240 (>= (ListPrimitiveSize!94 (_2!7508 lt!440359)) (ListPrimitiveSize!94 l!3519)))))

(assert (= (and start!85280 res!663642) b!992933))

(assert (= (and b!992933 res!663640) b!992934))

(assert (= (and b!992934 res!663641) b!992935))

(declare-fun m!920653 () Bool)

(assert (=> start!85280 m!920653))

(declare-fun m!920655 () Bool)

(assert (=> b!992933 m!920655))

(declare-fun m!920657 () Bool)

(assert (=> b!992933 m!920657))

(declare-fun m!920659 () Bool)

(assert (=> b!992934 m!920659))

(declare-fun m!920661 () Bool)

(assert (=> b!992934 m!920661))

(declare-fun m!920663 () Bool)

(assert (=> b!992935 m!920663))

(declare-fun m!920665 () Bool)

(assert (=> b!992935 m!920665))

(push 1)

(assert (not b!992933))

(assert (not b!992934))

(assert (not start!85280))

(assert (not b!992935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118363 () Bool)

(assert (=> d!118363 (= (isEmpty!759 lt!440358) (not (is-Some!551 lt!440358)))))

(assert (=> b!992933 d!118363))

(declare-fun d!118367 () Bool)

(assert (=> d!118367 (= (unapply!31 l!3519) (ite (is-Nil!20905 l!3519) None!550 (Some!551 (tuple2!14995 (h!22066 l!3519) (t!29909 l!3519)))))))

(assert (=> b!992933 d!118367))

(declare-fun d!118371 () Bool)

(declare-fun lt!440382 () Bool)

(declare-fun content!461 (List!20908) (Set (_ BitVec 64)))

(assert (=> d!118371 (= lt!440382 (set.member e!29 (content!461 (_2!7508 lt!440359))))))

(declare-fun e!560279 () Bool)

(assert (=> d!118371 (= lt!440382 e!560279)))

(declare-fun res!663677 () Bool)

(assert (=> d!118371 (=> (not res!663677) (not e!560279))))

(assert (=> d!118371 (= res!663677 (is-Cons!20904 (_2!7508 lt!440359)))))

(assert (=> d!118371 (= (contains!5769 (_2!7508 lt!440359) e!29) lt!440382)))

(declare-fun b!992974 () Bool)

(declare-fun e!560278 () Bool)

(assert (=> b!992974 (= e!560279 e!560278)))

(declare-fun res!663678 () Bool)

(assert (=> b!992974 (=> res!663678 e!560278)))

(assert (=> b!992974 (= res!663678 (= (h!22066 (_2!7508 lt!440359)) e!29))))

(declare-fun b!992975 () Bool)

(assert (=> b!992975 (= e!560278 (contains!5769 (t!29909 (_2!7508 lt!440359)) e!29))))

(assert (= (and d!118371 res!663677) b!992974))

(assert (= (and b!992974 (not res!663678)) b!992975))

(declare-fun m!920707 () Bool)

(assert (=> d!118371 m!920707))

(declare-fun m!920709 () Bool)

(assert (=> d!118371 m!920709))

(declare-fun m!920711 () Bool)

(assert (=> b!992975 m!920711))

(assert (=> b!992934 d!118371))

(declare-fun d!118381 () Bool)

(assert (=> d!118381 (= (get!15718 lt!440358) (v!14376 lt!440358))))

(assert (=> b!992934 d!118381))

(declare-fun d!118385 () Bool)

(declare-fun lt!440385 () Bool)

(assert (=> d!118385 (= lt!440385 (set.member e!29 (content!461 l!3519)))))

(declare-fun e!560284 () Bool)

(assert (=> d!118385 (= lt!440385 e!560284)))

(declare-fun res!663681 () Bool)

(assert (=> d!118385 (=> (not res!663681) (not e!560284))))

(assert (=> d!118385 (= res!663681 (is-Cons!20904 l!3519))))

(assert (=> d!118385 (= (contains!5769 l!3519 e!29) lt!440385)))

(declare-fun b!992980 () Bool)

(declare-fun e!560283 () Bool)

(assert (=> b!992980 (= e!560284 e!560283)))

(declare-fun res!663682 () Bool)

(assert (=> b!992980 (=> res!663682 e!560283)))

(assert (=> b!992980 (= res!663682 (= (h!22066 l!3519) e!29))))

(declare-fun b!992981 () Bool)

(assert (=> b!992981 (= e!560283 (contains!5769 (t!29909 l!3519) e!29))))

(assert (= (and d!118385 res!663681) b!992980))

(assert (= (and b!992980 (not res!663682)) b!992981))

(declare-fun m!920721 () Bool)

(assert (=> d!118385 m!920721))

(declare-fun m!920723 () Bool)

(assert (=> d!118385 m!920723))

(declare-fun m!920727 () Bool)

(assert (=> b!992981 m!920727))

(assert (=> start!85280 d!118385))

(declare-fun d!118393 () Bool)

(declare-fun lt!440392 () Int)

(assert (=> d!118393 (>= lt!440392 0)))

(declare-fun e!560292 () Int)

(assert (=> d!118393 (= lt!440392 e!560292)))

(declare-fun c!100792 () Bool)

(assert (=> d!118393 (= c!100792 (is-Nil!20905 (_2!7508 lt!440359)))))

(assert (=> d!118393 (= (ListPrimitiveSize!94 (_2!7508 lt!440359)) lt!440392)))

(declare-fun b!992994 () Bool)

(assert (=> b!992994 (= e!560292 0)))

(declare-fun b!992995 () Bool)

(assert (=> b!992995 (= e!560292 (+ 1 (ListPrimitiveSize!94 (t!29909 (_2!7508 lt!440359)))))))

(assert (= (and d!118393 c!100792) b!992994))

(assert (= (and d!118393 (not c!100792)) b!992995))

(declare-fun m!920735 () Bool)

(assert (=> b!992995 m!920735))

(assert (=> b!992935 d!118393))

(declare-fun d!118399 () Bool)

(declare-fun lt!440394 () Int)

(assert (=> d!118399 (>= lt!440394 0)))

(declare-fun e!560294 () Int)

(assert (=> d!118399 (= lt!440394 e!560294)))

(declare-fun c!100794 () Bool)

(assert (=> d!118399 (= c!100794 (is-Nil!20905 l!3519))))

(assert (=> d!118399 (= (ListPrimitiveSize!94 l!3519) lt!440394)))

(declare-fun b!992997 () Bool)

(assert (=> b!992997 (= e!560294 0)))

(declare-fun b!992999 () Bool)

(assert (=> b!992999 (= e!560294 (+ 1 (ListPrimitiveSize!94 (t!29909 l!3519))))))

(assert (= (and d!118399 c!100794) b!992997))

(assert (= (and d!118399 (not c!100794)) b!992999))

(declare-fun m!920737 () Bool)

(assert (=> b!992999 m!920737))

(assert (=> b!992935 d!118399))

(push 1)

