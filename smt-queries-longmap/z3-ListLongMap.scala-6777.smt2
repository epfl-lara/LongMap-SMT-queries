; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85400 () Bool)

(assert start!85400)

(declare-fun res!663911 () Bool)

(declare-fun e!560739 () Bool)

(assert (=> start!85400 (=> (not res!663911) (not e!560739))))

(declare-datatypes ((List!20891 0))(
  ( (Nil!20888) (Cons!20887 (h!22055 (_ BitVec 64)) (t!29884 List!20891)) )
))
(declare-fun l!3519 () List!20891)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5785 (List!20891 (_ BitVec 64)) Bool)

(assert (=> start!85400 (= res!663911 (not (contains!5785 l!3519 e!29)))))

(assert (=> start!85400 e!560739))

(assert (=> start!85400 true))

(declare-fun b!993745 () Bool)

(declare-fun ListPrimitiveSize!91 (List!20891) Int)

(assert (=> b!993745 (= e!560739 (< (ListPrimitiveSize!91 l!3519) 0))))

(assert (= (and start!85400 res!663911) b!993745))

(declare-fun m!921845 () Bool)

(assert (=> start!85400 m!921845))

(declare-fun m!921847 () Bool)

(assert (=> b!993745 m!921847))

(check-sat (not start!85400) (not b!993745))
(check-sat)
(get-model)

(declare-fun d!118637 () Bool)

(declare-fun lt!440684 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!454 (List!20891) (InoxSet (_ BitVec 64)))

(assert (=> d!118637 (= lt!440684 (select (content!454 l!3519) e!29))))

(declare-fun e!560759 () Bool)

(assert (=> d!118637 (= lt!440684 e!560759)))

(declare-fun res!663929 () Bool)

(assert (=> d!118637 (=> (not res!663929) (not e!560759))))

(get-info :version)

(assert (=> d!118637 (= res!663929 ((_ is Cons!20887) l!3519))))

(assert (=> d!118637 (= (contains!5785 l!3519 e!29) lt!440684)))

(declare-fun b!993768 () Bool)

(declare-fun e!560760 () Bool)

(assert (=> b!993768 (= e!560759 e!560760)))

(declare-fun res!663928 () Bool)

(assert (=> b!993768 (=> res!663928 e!560760)))

(assert (=> b!993768 (= res!663928 (= (h!22055 l!3519) e!29))))

(declare-fun b!993769 () Bool)

(assert (=> b!993769 (= e!560760 (contains!5785 (t!29884 l!3519) e!29))))

(assert (= (and d!118637 res!663929) b!993768))

(assert (= (and b!993768 (not res!663928)) b!993769))

(declare-fun m!921861 () Bool)

(assert (=> d!118637 m!921861))

(declare-fun m!921865 () Bool)

(assert (=> d!118637 m!921865))

(declare-fun m!921869 () Bool)

(assert (=> b!993769 m!921869))

(assert (=> start!85400 d!118637))

(declare-fun d!118647 () Bool)

(declare-fun lt!440693 () Int)

(assert (=> d!118647 (>= lt!440693 0)))

(declare-fun e!560772 () Int)

(assert (=> d!118647 (= lt!440693 e!560772)))

(declare-fun c!101065 () Bool)

(assert (=> d!118647 (= c!101065 ((_ is Nil!20888) l!3519))))

(assert (=> d!118647 (= (ListPrimitiveSize!91 l!3519) lt!440693)))

(declare-fun b!993786 () Bool)

(assert (=> b!993786 (= e!560772 0)))

(declare-fun b!993787 () Bool)

(assert (=> b!993787 (= e!560772 (+ 1 (ListPrimitiveSize!91 (t!29884 l!3519))))))

(assert (= (and d!118647 c!101065) b!993786))

(assert (= (and d!118647 (not c!101065)) b!993787))

(declare-fun m!921879 () Bool)

(assert (=> b!993787 m!921879))

(assert (=> b!993745 d!118647))

(check-sat (not b!993787) (not b!993769) (not d!118637))
(check-sat)
