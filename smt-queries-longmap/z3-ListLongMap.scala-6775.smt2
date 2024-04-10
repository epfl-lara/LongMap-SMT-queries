; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85198 () Bool)

(assert start!85198)

(declare-fun res!663521 () Bool)

(declare-fun e!560112 () Bool)

(assert (=> start!85198 (=> (not res!663521) (not e!560112))))

(declare-datatypes ((List!20897 0))(
  ( (Nil!20894) (Cons!20893 (h!22055 (_ BitVec 64)) (t!29898 List!20897)) )
))
(declare-fun l!3519 () List!20897)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5758 (List!20897 (_ BitVec 64)) Bool)

(assert (=> start!85198 (= res!663521 (not (contains!5758 l!3519 e!29)))))

(assert (=> start!85198 e!560112))

(assert (=> start!85198 true))

(declare-fun b!992796 () Bool)

(declare-fun e!560111 () Bool)

(assert (=> b!992796 (= e!560112 e!560111)))

(declare-fun res!663522 () Bool)

(assert (=> b!992796 (=> (not res!663522) (not e!560111))))

(declare-datatypes ((tuple2!14978 0))(
  ( (tuple2!14979 (_1!7500 (_ BitVec 64)) (_2!7500 List!20897)) )
))
(declare-datatypes ((Option!544 0))(
  ( (Some!543 (v!14359 tuple2!14978)) (None!542) )
))
(declare-fun lt!440284 () Option!544)

(declare-fun isEmpty!751 (Option!544) Bool)

(assert (=> b!992796 (= res!663522 (not (isEmpty!751 lt!440284)))))

(declare-fun unapply!23 (List!20897) Option!544)

(assert (=> b!992796 (= lt!440284 (unapply!23 l!3519))))

(declare-fun b!992797 () Bool)

(declare-fun isDefined!390 (Option!544) Bool)

(assert (=> b!992797 (= e!560111 (not (isDefined!390 lt!440284)))))

(assert (= (and start!85198 res!663521) b!992796))

(assert (= (and b!992796 res!663522) b!992797))

(declare-fun m!920487 () Bool)

(assert (=> start!85198 m!920487))

(declare-fun m!920489 () Bool)

(assert (=> b!992796 m!920489))

(declare-fun m!920491 () Bool)

(assert (=> b!992796 m!920491))

(declare-fun m!920493 () Bool)

(assert (=> b!992797 m!920493))

(check-sat (not start!85198) (not b!992797) (not b!992796))
(check-sat)
(get-model)

(declare-fun d!118289 () Bool)

(declare-fun lt!440295 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!452 (List!20897) (InoxSet (_ BitVec 64)))

(assert (=> d!118289 (= lt!440295 (select (content!452 l!3519) e!29))))

(declare-fun e!560135 () Bool)

(assert (=> d!118289 (= lt!440295 e!560135)))

(declare-fun res!663546 () Bool)

(assert (=> d!118289 (=> (not res!663546) (not e!560135))))

(get-info :version)

(assert (=> d!118289 (= res!663546 ((_ is Cons!20893) l!3519))))

(assert (=> d!118289 (= (contains!5758 l!3519 e!29) lt!440295)))

(declare-fun b!992818 () Bool)

(declare-fun e!560136 () Bool)

(assert (=> b!992818 (= e!560135 e!560136)))

(declare-fun res!663544 () Bool)

(assert (=> b!992818 (=> res!663544 e!560136)))

(assert (=> b!992818 (= res!663544 (= (h!22055 l!3519) e!29))))

(declare-fun b!992820 () Bool)

(assert (=> b!992820 (= e!560136 (contains!5758 (t!29898 l!3519) e!29))))

(assert (= (and d!118289 res!663546) b!992818))

(assert (= (and b!992818 (not res!663544)) b!992820))

(declare-fun m!920511 () Bool)

(assert (=> d!118289 m!920511))

(declare-fun m!920514 () Bool)

(assert (=> d!118289 m!920514))

(declare-fun m!920519 () Bool)

(assert (=> b!992820 m!920519))

(assert (=> start!85198 d!118289))

(declare-fun d!118301 () Bool)

(assert (=> d!118301 (= (isDefined!390 lt!440284) (not (isEmpty!751 lt!440284)))))

(declare-fun bs!28238 () Bool)

(assert (= bs!28238 d!118301))

(assert (=> bs!28238 m!920489))

(assert (=> b!992797 d!118301))

(declare-fun d!118305 () Bool)

(assert (=> d!118305 (= (isEmpty!751 lt!440284) (not ((_ is Some!543) lt!440284)))))

(assert (=> b!992796 d!118305))

(declare-fun d!118309 () Bool)

(assert (=> d!118309 (= (unapply!23 l!3519) (ite ((_ is Nil!20894) l!3519) None!542 (Some!543 (tuple2!14979 (h!22055 l!3519) (t!29898 l!3519)))))))

(assert (=> b!992796 d!118309))

(check-sat (not d!118301) (not d!118289) (not b!992820))
