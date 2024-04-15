; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72148 () Bool)

(assert start!72148)

(declare-fun res!569125 () Bool)

(declare-fun e!466810 () Bool)

(assert (=> start!72148 (=> (not res!569125) (not e!466810))))

(declare-datatypes ((List!16011 0))(
  ( (Nil!16008) (Cons!16007 (h!17138 (_ BitVec 64)) (t!22373 List!16011)) )
))
(declare-fun l!404 () List!16011)

(declare-fun length!32 (List!16011) Int)

(assert (=> start!72148 (= res!569125 (< (length!32 l!404) 2147483647))))

(assert (=> start!72148 e!466810))

(assert (=> start!72148 true))

(declare-fun b!836620 () Bool)

(declare-fun ListPrimitiveSize!79 (List!16011) Int)

(assert (=> b!836620 (= e!466810 (< (ListPrimitiveSize!79 l!404) 0))))

(assert (= (and start!72148 res!569125) b!836620))

(declare-fun m!781199 () Bool)

(assert (=> start!72148 m!781199))

(declare-fun m!781201 () Bool)

(assert (=> b!836620 m!781201))

(check-sat (not b!836620) (not start!72148))
(check-sat)
(get-model)

(declare-fun d!107561 () Bool)

(declare-fun lt!380261 () Int)

(assert (=> d!107561 (>= lt!380261 0)))

(declare-fun e!466823 () Int)

(assert (=> d!107561 (= lt!380261 e!466823)))

(declare-fun c!91065 () Bool)

(get-info :version)

(assert (=> d!107561 (= c!91065 ((_ is Nil!16008) l!404))))

(assert (=> d!107561 (= (ListPrimitiveSize!79 l!404) lt!380261)))

(declare-fun b!836639 () Bool)

(assert (=> b!836639 (= e!466823 0)))

(declare-fun b!836640 () Bool)

(assert (=> b!836640 (= e!466823 (+ 1 (ListPrimitiveSize!79 (t!22373 l!404))))))

(assert (= (and d!107561 c!91065) b!836639))

(assert (= (and d!107561 (not c!91065)) b!836640))

(declare-fun m!781211 () Bool)

(assert (=> b!836640 m!781211))

(assert (=> b!836620 d!107561))

(declare-fun d!107567 () Bool)

(declare-fun size!22894 (List!16011) Int)

(assert (=> d!107567 (= (length!32 l!404) (size!22894 l!404))))

(declare-fun bs!23500 () Bool)

(assert (= bs!23500 d!107567))

(declare-fun m!781215 () Bool)

(assert (=> bs!23500 m!781215))

(assert (=> start!72148 d!107567))

(check-sat (not b!836640) (not d!107567))
(check-sat)
