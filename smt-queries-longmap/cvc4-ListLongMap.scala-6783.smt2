; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85416 () Bool)

(assert start!85416)

(declare-fun res!663862 () Bool)

(declare-fun e!560481 () Bool)

(assert (=> start!85416 (=> (not res!663862) (not e!560481))))

(declare-datatypes ((List!20922 0))(
  ( (Nil!20919) (Cons!20918 (h!22080 (_ BitVec 64)) (t!29923 List!20922)) )
))
(declare-fun l!3519 () List!20922)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5783 (List!20922 (_ BitVec 64)) Bool)

(assert (=> start!85416 (= res!663862 (not (contains!5783 l!3519 e!29)))))

(assert (=> start!85416 e!560481))

(assert (=> start!85416 true))

(declare-fun b!993263 () Bool)

(declare-fun res!663863 () Bool)

(assert (=> b!993263 (=> (not res!663863) (not e!560481))))

(declare-datatypes ((tuple2!15022 0))(
  ( (tuple2!15023 (_1!7522 (_ BitVec 64)) (_2!7522 List!20922)) )
))
(declare-datatypes ((Option!566 0))(
  ( (Some!565 (v!14402 tuple2!15022)) (None!564) )
))
(declare-fun isEmpty!773 (Option!566) Bool)

(declare-fun unapply!45 (List!20922) Option!566)

(assert (=> b!993263 (= res!663863 (isEmpty!773 (unapply!45 l!3519)))))

(declare-fun b!993264 () Bool)

(declare-fun res!663864 () Bool)

(assert (=> b!993264 (=> (not res!663864) (not e!560481))))

(assert (=> b!993264 (= res!663864 (not (is-Nil!20919 l!3519)))))

(declare-fun b!993265 () Bool)

(declare-fun -!458 (List!20922 (_ BitVec 64)) List!20922)

(assert (=> b!993265 (= e!560481 (not (= (-!458 l!3519 e!29) l!3519)))))

(assert (= (and start!85416 res!663862) b!993263))

(assert (= (and b!993263 res!663863) b!993264))

(assert (= (and b!993264 res!663864) b!993265))

(declare-fun m!921011 () Bool)

(assert (=> start!85416 m!921011))

(declare-fun m!921013 () Bool)

(assert (=> b!993263 m!921013))

(assert (=> b!993263 m!921013))

(declare-fun m!921015 () Bool)

(assert (=> b!993263 m!921015))

(declare-fun m!921017 () Bool)

(assert (=> b!993265 m!921017))

(push 1)

(assert (not b!993263))

(assert (not start!85416))

(assert (not b!993265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118505 () Bool)

(assert (=> d!118505 (= (isEmpty!773 (unapply!45 l!3519)) (not (is-Some!565 (unapply!45 l!3519))))))

(assert (=> b!993263 d!118505))

(declare-fun d!118511 () Bool)

(assert (=> d!118511 (= (unapply!45 l!3519) (ite (is-Nil!20919 l!3519) None!564 (Some!565 (tuple2!15023 (h!22080 l!3519) (t!29923 l!3519)))))))

(assert (=> b!993263 d!118511))

(declare-fun d!118515 () Bool)

(declare-fun lt!440487 () Bool)

(declare-fun content!473 (List!20922) (Set (_ BitVec 64)))

(assert (=> d!118515 (= lt!440487 (member e!29 (content!473 l!3519)))))

(declare-fun e!560492 () Bool)

(assert (=> d!118515 (= lt!440487 e!560492)))

(declare-fun res!663869 () Bool)

(assert (=> d!118515 (=> (not res!663869) (not e!560492))))

(assert (=> d!118515 (= res!663869 (is-Cons!20918 l!3519))))

(assert (=> d!118515 (= (contains!5783 l!3519 e!29) lt!440487)))

(declare-fun b!993278 () Bool)

(declare-fun e!560491 () Bool)

(assert (=> b!993278 (= e!560492 e!560491)))

(declare-fun res!663870 () Bool)

(assert (=> b!993278 (=> res!663870 e!560491)))

(assert (=> b!993278 (= res!663870 (= (h!22080 l!3519) e!29))))

(declare-fun b!993279 () Bool)

(assert (=> b!993279 (= e!560491 (contains!5783 (t!29923 l!3519) e!29))))

(assert (= (and d!118515 res!663869) b!993278))

(assert (= (and b!993278 (not res!663870)) b!993279))

(declare-fun m!921019 () Bool)

(assert (=> d!118515 m!921019))

(declare-fun m!921021 () Bool)

(assert (=> d!118515 m!921021))

(declare-fun m!921023 () Bool)

(assert (=> b!993279 m!921023))

(assert (=> start!85416 d!118515))

(declare-fun d!118519 () Bool)

(declare-fun e!560525 () Bool)

(assert (=> d!118519 e!560525))

(declare-fun res!663889 () Bool)

(assert (=> d!118519 (=> (not res!663889) (not e!560525))))

(declare-fun lt!440499 () List!20922)

(declare-fun size!30701 (List!20922) Int)

(assert (=> d!118519 (= res!663889 (<= (size!30701 lt!440499) (size!30701 l!3519)))))

(declare-fun e!560526 () List!20922)

(assert (=> d!118519 (= lt!440499 e!560526)))

(declare-fun c!100855 () Bool)

(assert (=> d!118519 (= c!100855 (is-Cons!20918 l!3519))))

(assert (=> d!118519 (= (-!458 l!3519 e!29) lt!440499)))

(declare-fun b!993322 () Bool)

(declare-fun e!560527 () List!20922)

(declare-fun call!42151 () List!20922)

(assert (=> b!993322 (= e!560527 call!42151)))

