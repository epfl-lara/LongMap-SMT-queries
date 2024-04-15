; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85214 () Bool)

(assert start!85214)

(declare-fun res!663457 () Bool)

(declare-fun e!560009 () Bool)

(assert (=> start!85214 (=> (not res!663457) (not e!560009))))

(declare-datatypes ((List!20937 0))(
  ( (Nil!20934) (Cons!20933 (h!22095 (_ BitVec 64)) (t!29929 List!20937)) )
))
(declare-fun l!3519 () List!20937)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5736 (List!20937 (_ BitVec 64)) Bool)

(assert (=> start!85214 (= res!663457 (not (contains!5736 l!3519 e!29)))))

(assert (=> start!85214 e!560009))

(assert (=> start!85214 true))

(declare-fun b!992603 () Bool)

(declare-fun ListPrimitiveSize!91 (List!20937) Int)

(assert (=> b!992603 (= e!560009 (< (ListPrimitiveSize!91 l!3519) 0))))

(assert (= (and start!85214 res!663457) b!992603))

(declare-fun m!919793 () Bool)

(assert (=> start!85214 m!919793))

(declare-fun m!919795 () Bool)

(assert (=> b!992603 m!919795))

(check-sat (not b!992603) (not start!85214))
(check-sat)
(get-model)

(declare-fun d!118119 () Bool)

(declare-fun lt!440086 () Int)

(assert (=> d!118119 (>= lt!440086 0)))

(declare-fun e!560023 () Int)

(assert (=> d!118119 (= lt!440086 e!560023)))

(declare-fun c!100717 () Bool)

(get-info :version)

(assert (=> d!118119 (= c!100717 ((_ is Nil!20934) l!3519))))

(assert (=> d!118119 (= (ListPrimitiveSize!91 l!3519) lt!440086)))

(declare-fun b!992624 () Bool)

(assert (=> b!992624 (= e!560023 0)))

(declare-fun b!992625 () Bool)

(assert (=> b!992625 (= e!560023 (+ 1 (ListPrimitiveSize!91 (t!29929 l!3519))))))

(assert (= (and d!118119 c!100717) b!992624))

(assert (= (and d!118119 (not c!100717)) b!992625))

(declare-fun m!919807 () Bool)

(assert (=> b!992625 m!919807))

(assert (=> b!992603 d!118119))

(declare-fun d!118125 () Bool)

(declare-fun lt!440096 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!453 (List!20937) (InoxSet (_ BitVec 64)))

(assert (=> d!118125 (= lt!440096 (select (content!453 l!3519) e!29))))

(declare-fun e!560041 () Bool)

(assert (=> d!118125 (= lt!440096 e!560041)))

(declare-fun res!663480 () Bool)

(assert (=> d!118125 (=> (not res!663480) (not e!560041))))

(assert (=> d!118125 (= res!663480 ((_ is Cons!20933) l!3519))))

(assert (=> d!118125 (= (contains!5736 l!3519 e!29) lt!440096)))

(declare-fun b!992643 () Bool)

(declare-fun e!560040 () Bool)

(assert (=> b!992643 (= e!560041 e!560040)))

(declare-fun res!663478 () Bool)

(assert (=> b!992643 (=> res!663478 e!560040)))

(assert (=> b!992643 (= res!663478 (= (h!22095 l!3519) e!29))))

(declare-fun b!992645 () Bool)

(assert (=> b!992645 (= e!560040 (contains!5736 (t!29929 l!3519) e!29))))

(assert (= (and d!118125 res!663480) b!992643))

(assert (= (and b!992643 (not res!663478)) b!992645))

(declare-fun m!919819 () Bool)

(assert (=> d!118125 m!919819))

(declare-fun m!919823 () Bool)

(assert (=> d!118125 m!919823))

(declare-fun m!919827 () Bool)

(assert (=> b!992645 m!919827))

(assert (=> start!85214 d!118125))

(check-sat (not b!992645) (not d!118125) (not b!992625))
(check-sat)
