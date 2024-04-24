; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72352 () Bool)

(assert start!72352)

(declare-fun res!569590 () Bool)

(declare-fun e!467558 () Bool)

(assert (=> start!72352 (=> (not res!569590) (not e!467558))))

(declare-datatypes ((List!15919 0))(
  ( (Nil!15916) (Cons!15915 (h!17052 (_ BitVec 64)) (t!22282 List!15919)) )
))
(declare-fun l!404 () List!15919)

(declare-fun length!35 (List!15919) Int)

(assert (=> start!72352 (= res!569590 (< (length!35 l!404) 2147483647))))

(assert (=> start!72352 e!467558))

(assert (=> start!72352 true))

(declare-fun b!837791 () Bool)

(declare-fun res!569591 () Bool)

(assert (=> b!837791 (=> (not res!569591) (not e!467558))))

(get-info :version)

(assert (=> b!837791 (= res!569591 ((_ is Cons!15915) l!404))))

(declare-fun b!837792 () Bool)

(declare-fun ListPrimitiveSize!82 (List!15919) Int)

(assert (=> b!837792 (= e!467558 (>= (ListPrimitiveSize!82 (t!22282 l!404)) (ListPrimitiveSize!82 l!404)))))

(assert (= (and start!72352 res!569590) b!837791))

(assert (= (and b!837791 res!569591) b!837792))

(declare-fun m!783269 () Bool)

(assert (=> start!72352 m!783269))

(declare-fun m!783271 () Bool)

(assert (=> b!837792 m!783271))

(declare-fun m!783273 () Bool)

(assert (=> b!837792 m!783273))

(check-sat (not start!72352) (not b!837792))
(check-sat)
(get-model)

(declare-fun d!108095 () Bool)

(declare-fun size!22908 (List!15919) Int)

(assert (=> d!108095 (= (length!35 l!404) (size!22908 l!404))))

(declare-fun bs!23552 () Bool)

(assert (= bs!23552 d!108095))

(declare-fun m!783287 () Bool)

(assert (=> bs!23552 m!783287))

(assert (=> start!72352 d!108095))

(declare-fun d!108099 () Bool)

(declare-fun lt!380867 () Int)

(assert (=> d!108099 (>= lt!380867 0)))

(declare-fun e!467571 () Int)

(assert (=> d!108099 (= lt!380867 e!467571)))

(declare-fun c!91421 () Bool)

(assert (=> d!108099 (= c!91421 ((_ is Nil!15916) (t!22282 l!404)))))

(assert (=> d!108099 (= (ListPrimitiveSize!82 (t!22282 l!404)) lt!380867)))

(declare-fun b!837817 () Bool)

(assert (=> b!837817 (= e!467571 0)))

(declare-fun b!837818 () Bool)

(assert (=> b!837818 (= e!467571 (+ 1 (ListPrimitiveSize!82 (t!22282 (t!22282 l!404)))))))

(assert (= (and d!108099 c!91421) b!837817))

(assert (= (and d!108099 (not c!91421)) b!837818))

(declare-fun m!783293 () Bool)

(assert (=> b!837818 m!783293))

(assert (=> b!837792 d!108099))

(declare-fun d!108107 () Bool)

(declare-fun lt!380868 () Int)

(assert (=> d!108107 (>= lt!380868 0)))

(declare-fun e!467572 () Int)

(assert (=> d!108107 (= lt!380868 e!467572)))

(declare-fun c!91422 () Bool)

(assert (=> d!108107 (= c!91422 ((_ is Nil!15916) l!404))))

(assert (=> d!108107 (= (ListPrimitiveSize!82 l!404) lt!380868)))

(declare-fun b!837819 () Bool)

(assert (=> b!837819 (= e!467572 0)))

(declare-fun b!837820 () Bool)

(assert (=> b!837820 (= e!467572 (+ 1 (ListPrimitiveSize!82 (t!22282 l!404))))))

(assert (= (and d!108107 c!91422) b!837819))

(assert (= (and d!108107 (not c!91422)) b!837820))

(assert (=> b!837820 m!783271))

(assert (=> b!837792 d!108107))

(check-sat (not d!108095) (not b!837818) (not b!837820))
(check-sat)
