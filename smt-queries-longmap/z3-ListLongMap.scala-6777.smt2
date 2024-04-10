; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85234 () Bool)

(assert start!85234)

(declare-fun res!663570 () Bool)

(declare-fun e!560160 () Bool)

(assert (=> start!85234 (=> (not res!663570) (not e!560160))))

(declare-datatypes ((List!20903 0))(
  ( (Nil!20900) (Cons!20899 (h!22061 (_ BitVec 64)) (t!29904 List!20903)) )
))
(declare-fun l!3519 () List!20903)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5764 (List!20903 (_ BitVec 64)) Bool)

(assert (=> start!85234 (= res!663570 (not (contains!5764 l!3519 e!29)))))

(assert (=> start!85234 e!560160))

(assert (=> start!85234 true))

(declare-fun b!992845 () Bool)

(declare-fun ListPrimitiveSize!92 (List!20903) Int)

(assert (=> b!992845 (= e!560160 (< (ListPrimitiveSize!92 l!3519) 0))))

(assert (= (and start!85234 res!663570) b!992845))

(declare-fun m!920555 () Bool)

(assert (=> start!85234 m!920555))

(declare-fun m!920557 () Bool)

(assert (=> b!992845 m!920557))

(check-sat (not start!85234) (not b!992845))
(check-sat)
(get-model)

(declare-fun d!118319 () Bool)

(declare-fun lt!440323 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!455 (List!20903) (InoxSet (_ BitVec 64)))

(assert (=> d!118319 (= lt!440323 (select (content!455 l!3519) e!29))))

(declare-fun e!560178 () Bool)

(assert (=> d!118319 (= lt!440323 e!560178)))

(declare-fun res!663584 () Bool)

(assert (=> d!118319 (=> (not res!663584) (not e!560178))))

(get-info :version)

(assert (=> d!118319 (= res!663584 ((_ is Cons!20899) l!3519))))

(assert (=> d!118319 (= (contains!5764 l!3519 e!29) lt!440323)))

(declare-fun b!992865 () Bool)

(declare-fun e!560177 () Bool)

(assert (=> b!992865 (= e!560178 e!560177)))

(declare-fun res!663585 () Bool)

(assert (=> b!992865 (=> res!663585 e!560177)))

(assert (=> b!992865 (= res!663585 (= (h!22061 l!3519) e!29))))

(declare-fun b!992866 () Bool)

(assert (=> b!992866 (= e!560177 (contains!5764 (t!29904 l!3519) e!29))))

(assert (= (and d!118319 res!663584) b!992865))

(assert (= (and b!992865 (not res!663585)) b!992866))

(declare-fun m!920571 () Bool)

(assert (=> d!118319 m!920571))

(declare-fun m!920573 () Bool)

(assert (=> d!118319 m!920573))

(declare-fun m!920575 () Bool)

(assert (=> b!992866 m!920575))

(assert (=> start!85234 d!118319))

(declare-fun d!118325 () Bool)

(declare-fun lt!440332 () Int)

(assert (=> d!118325 (>= lt!440332 0)))

(declare-fun e!560190 () Int)

(assert (=> d!118325 (= lt!440332 e!560190)))

(declare-fun c!100783 () Bool)

(assert (=> d!118325 (= c!100783 ((_ is Nil!20900) l!3519))))

(assert (=> d!118325 (= (ListPrimitiveSize!92 l!3519) lt!440332)))

(declare-fun b!992883 () Bool)

(assert (=> b!992883 (= e!560190 0)))

(declare-fun b!992884 () Bool)

(assert (=> b!992884 (= e!560190 (+ 1 (ListPrimitiveSize!92 (t!29904 l!3519))))))

(assert (= (and d!118325 c!100783) b!992883))

(assert (= (and d!118325 (not c!100783)) b!992884))

(declare-fun m!920585 () Bool)

(assert (=> b!992884 m!920585))

(assert (=> b!992845 d!118325))

(check-sat (not d!118319) (not b!992866) (not b!992884))
(check-sat)
