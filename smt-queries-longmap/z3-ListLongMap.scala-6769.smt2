; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85130 () Bool)

(assert start!85130)

(declare-fun res!663536 () Bool)

(declare-fun e!560301 () Bool)

(assert (=> start!85130 (=> (not res!663536) (not e!560301))))

(declare-datatypes ((List!20867 0))(
  ( (Nil!20864) (Cons!20863 (h!22031 (_ BitVec 64)) (t!29845 List!20867)) )
))
(declare-fun tail!21 () List!20867)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5761 (List!20867 (_ BitVec 64)) Bool)

(assert (=> start!85130 (= res!663536 (not (contains!5761 tail!21 head!726)))))

(assert (=> start!85130 e!560301))

(assert (=> start!85130 true))

(declare-fun b!993142 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!433 (List!20867) (InoxSet (_ BitVec 64)))

(assert (=> b!993142 (= e!560301 (select (content!433 tail!21) head!726))))

(assert (= (and start!85130 res!663536) b!993142))

(declare-fun m!921239 () Bool)

(assert (=> start!85130 m!921239))

(declare-fun m!921241 () Bool)

(assert (=> b!993142 m!921241))

(declare-fun m!921243 () Bool)

(assert (=> b!993142 m!921243))

(check-sat (not start!85130) (not b!993142))
(check-sat)
(get-model)

(declare-fun d!118381 () Bool)

(declare-fun lt!440473 () Bool)

(assert (=> d!118381 (= lt!440473 (select (content!433 tail!21) head!726))))

(declare-fun e!560319 () Bool)

(assert (=> d!118381 (= lt!440473 e!560319)))

(declare-fun res!663552 () Bool)

(assert (=> d!118381 (=> (not res!663552) (not e!560319))))

(get-info :version)

(assert (=> d!118381 (= res!663552 ((_ is Cons!20863) tail!21))))

(assert (=> d!118381 (= (contains!5761 tail!21 head!726) lt!440473)))

(declare-fun b!993163 () Bool)

(declare-fun e!560320 () Bool)

(assert (=> b!993163 (= e!560319 e!560320)))

(declare-fun res!663551 () Bool)

(assert (=> b!993163 (=> res!663551 e!560320)))

(assert (=> b!993163 (= res!663551 (= (h!22031 tail!21) head!726))))

(declare-fun b!993164 () Bool)

(assert (=> b!993164 (= e!560320 (contains!5761 (t!29845 tail!21) head!726))))

(assert (= (and d!118381 res!663552) b!993163))

(assert (= (and b!993163 (not res!663551)) b!993164))

(assert (=> d!118381 m!921241))

(assert (=> d!118381 m!921243))

(declare-fun m!921261 () Bool)

(assert (=> b!993164 m!921261))

(assert (=> start!85130 d!118381))

(declare-fun d!118389 () Bool)

(declare-fun c!100950 () Bool)

(assert (=> d!118389 (= c!100950 ((_ is Nil!20864) tail!21))))

(declare-fun e!560331 () (InoxSet (_ BitVec 64)))

(assert (=> d!118389 (= (content!433 tail!21) e!560331)))

(declare-fun b!993179 () Bool)

(assert (=> b!993179 (= e!560331 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993180 () Bool)

(assert (=> b!993180 (= e!560331 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22031 tail!21) true) (content!433 (t!29845 tail!21))))))

(assert (= (and d!118389 c!100950) b!993179))

(assert (= (and d!118389 (not c!100950)) b!993180))

(declare-fun m!921265 () Bool)

(assert (=> b!993180 m!921265))

(declare-fun m!921267 () Bool)

(assert (=> b!993180 m!921267))

(assert (=> b!993142 d!118389))

(check-sat (not b!993164) (not b!993180) (not d!118381))
(check-sat)
