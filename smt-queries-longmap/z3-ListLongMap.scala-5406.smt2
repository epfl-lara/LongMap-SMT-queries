; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72334 () Bool)

(assert start!72334)

(declare-fun res!569579 () Bool)

(declare-fun e!467540 () Bool)

(assert (=> start!72334 (=> (not res!569579) (not e!467540))))

(declare-datatypes ((List!15916 0))(
  ( (Nil!15913) (Cons!15912 (h!17049 (_ BitVec 64)) (t!22279 List!15916)) )
))
(declare-fun l!404 () List!15916)

(declare-fun length!32 (List!15916) Int)

(assert (=> start!72334 (= res!569579 (< (length!32 l!404) 2147483647))))

(assert (=> start!72334 e!467540))

(assert (=> start!72334 true))

(declare-fun b!837762 () Bool)

(declare-fun ListPrimitiveSize!79 (List!15916) Int)

(assert (=> b!837762 (= e!467540 (< (ListPrimitiveSize!79 l!404) 0))))

(assert (= (and start!72334 res!569579) b!837762))

(declare-fun m!783245 () Bool)

(assert (=> start!72334 m!783245))

(declare-fun m!783247 () Bool)

(assert (=> b!837762 m!783247))

(check-sat (not b!837762) (not start!72334))
(check-sat)
(get-model)

(declare-fun d!108081 () Bool)

(declare-fun lt!380858 () Int)

(assert (=> d!108081 (>= lt!380858 0)))

(declare-fun e!467553 () Int)

(assert (=> d!108081 (= lt!380858 e!467553)))

(declare-fun c!91412 () Bool)

(get-info :version)

(assert (=> d!108081 (= c!91412 ((_ is Nil!15913) l!404))))

(assert (=> d!108081 (= (ListPrimitiveSize!79 l!404) lt!380858)))

(declare-fun b!837781 () Bool)

(assert (=> b!837781 (= e!467553 0)))

(declare-fun b!837782 () Bool)

(assert (=> b!837782 (= e!467553 (+ 1 (ListPrimitiveSize!79 (t!22279 l!404))))))

(assert (= (and d!108081 c!91412) b!837781))

(assert (= (and d!108081 (not c!91412)) b!837782))

(declare-fun m!783261 () Bool)

(assert (=> b!837782 m!783261))

(assert (=> b!837762 d!108081))

(declare-fun d!108091 () Bool)

(declare-fun size!22907 (List!15916) Int)

(assert (=> d!108091 (= (length!32 l!404) (size!22907 l!404))))

(declare-fun bs!23548 () Bool)

(assert (= bs!23548 d!108091))

(declare-fun m!783263 () Bool)

(assert (=> bs!23548 m!783263))

(assert (=> start!72334 d!108091))

(check-sat (not b!837782) (not d!108091))
(check-sat)
