; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72316 () Bool)

(assert start!72316)

(declare-fun res!569563 () Bool)

(declare-fun e!467519 () Bool)

(assert (=> start!72316 (=> (not res!569563) (not e!467519))))

(declare-datatypes ((List!15913 0))(
  ( (Nil!15910) (Cons!15909 (h!17046 (_ BitVec 64)) (t!22276 List!15913)) )
))
(declare-fun l!404 () List!15913)

(declare-fun length!29 (List!15913) Int)

(assert (=> start!72316 (= res!569563 (< (length!29 l!404) 2147483647))))

(assert (=> start!72316 e!467519))

(assert (=> start!72316 true))

(declare-fun b!837722 () Bool)

(declare-fun res!569564 () Bool)

(assert (=> b!837722 (=> (not res!569564) (not e!467519))))

(get-info :version)

(assert (=> b!837722 (= res!569564 ((_ is Cons!15909) l!404))))

(declare-fun b!837723 () Bool)

(assert (=> b!837723 (= e!467519 (>= (length!29 (t!22276 l!404)) 2147483647))))

(assert (= (and start!72316 res!569563) b!837722))

(assert (= (and b!837722 res!569564) b!837723))

(declare-fun m!783215 () Bool)

(assert (=> start!72316 m!783215))

(declare-fun m!783217 () Bool)

(assert (=> b!837723 m!783217))

(check-sat (not b!837723) (not start!72316))
(check-sat)
(get-model)

(declare-fun d!108055 () Bool)

(declare-fun size!22902 (List!15913) Int)

(assert (=> d!108055 (= (length!29 (t!22276 l!404)) (size!22902 (t!22276 l!404)))))

(declare-fun bs!23537 () Bool)

(assert (= bs!23537 d!108055))

(declare-fun m!783227 () Bool)

(assert (=> bs!23537 m!783227))

(assert (=> b!837723 d!108055))

(declare-fun d!108061 () Bool)

(assert (=> d!108061 (= (length!29 l!404) (size!22902 l!404))))

(declare-fun bs!23538 () Bool)

(assert (= bs!23538 d!108061))

(declare-fun m!783229 () Bool)

(assert (=> bs!23538 m!783229))

(assert (=> start!72316 d!108061))

(check-sat (not d!108061) (not d!108055))
(check-sat)
(get-model)

(declare-fun d!108067 () Bool)

(declare-fun lt!380842 () Int)

(assert (=> d!108067 (>= lt!380842 0)))

(declare-fun e!467528 () Int)

(assert (=> d!108067 (= lt!380842 e!467528)))

(declare-fun c!91396 () Bool)

(assert (=> d!108067 (= c!91396 ((_ is Nil!15910) l!404))))

(assert (=> d!108067 (= (size!22902 l!404) lt!380842)))

(declare-fun b!837740 () Bool)

(assert (=> b!837740 (= e!467528 0)))

(declare-fun b!837741 () Bool)

(assert (=> b!837741 (= e!467528 (+ 1 (size!22902 (t!22276 l!404))))))

(assert (= (and d!108067 c!91396) b!837740))

(assert (= (and d!108067 (not c!91396)) b!837741))

(assert (=> b!837741 m!783227))

(assert (=> d!108061 d!108067))

(declare-fun d!108073 () Bool)

(declare-fun lt!380843 () Int)

(assert (=> d!108073 (>= lt!380843 0)))

(declare-fun e!467529 () Int)

(assert (=> d!108073 (= lt!380843 e!467529)))

(declare-fun c!91397 () Bool)

(assert (=> d!108073 (= c!91397 ((_ is Nil!15910) (t!22276 l!404)))))

(assert (=> d!108073 (= (size!22902 (t!22276 l!404)) lt!380843)))

(declare-fun b!837742 () Bool)

(assert (=> b!837742 (= e!467529 0)))

(declare-fun b!837743 () Bool)

(assert (=> b!837743 (= e!467529 (+ 1 (size!22902 (t!22276 (t!22276 l!404)))))))

(assert (= (and d!108073 c!91397) b!837742))

(assert (= (and d!108073 (not c!91397)) b!837743))

(declare-fun m!783239 () Bool)

(assert (=> b!837743 m!783239))

(assert (=> d!108055 d!108073))

(check-sat (not b!837743) (not b!837741))
(check-sat)
