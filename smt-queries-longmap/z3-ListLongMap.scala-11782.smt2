; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138406 () Bool)

(assert start!138406)

(declare-fun res!1083325 () Bool)

(declare-fun e!885806 () Bool)

(assert (=> start!138406 (=> (not res!1083325) (not e!885806))))

(declare-datatypes ((B!3034 0))(
  ( (B!3035 (val!19879 Int)) )
))
(declare-datatypes ((tuple2!25926 0))(
  ( (tuple2!25927 (_1!12974 (_ BitVec 64)) (_2!12974 B!3034)) )
))
(declare-datatypes ((List!36999 0))(
  ( (Nil!36996) (Cons!36995 (h!38538 tuple2!25926) (t!51929 List!36999)) )
))
(declare-fun l!636 () List!36999)

(declare-fun isStrictlySorted!1221 (List!36999) Bool)

(assert (=> start!138406 (= res!1083325 (isStrictlySorted!1221 l!636))))

(assert (=> start!138406 e!885806))

(declare-fun e!885807 () Bool)

(assert (=> start!138406 e!885807))

(assert (=> start!138406 true))

(declare-fun b!1586271 () Bool)

(declare-fun res!1083326 () Bool)

(assert (=> b!1586271 (=> (not res!1083326) (not e!885806))))

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1586271 (= res!1083326 (and (or (not ((_ is Cons!36995) l!636)) (not (= (_1!12974 (h!38538 l!636)) key!185))) (or (not ((_ is Cons!36995) l!636)) (bvsle (_1!12974 (h!38538 l!636)) key!185)) ((_ is Cons!36995) l!636) (bvslt (_1!12974 (h!38538 l!636)) key!185)))))

(declare-fun b!1586272 () Bool)

(declare-fun ListPrimitiveSize!233 (List!36999) Int)

(assert (=> b!1586272 (= e!885806 (>= (ListPrimitiveSize!233 (t!51929 l!636)) (ListPrimitiveSize!233 l!636)))))

(declare-fun b!1586273 () Bool)

(declare-fun tp_is_empty!39567 () Bool)

(declare-fun tp!115401 () Bool)

(assert (=> b!1586273 (= e!885807 (and tp_is_empty!39567 tp!115401))))

(assert (= (and start!138406 res!1083325) b!1586271))

(assert (= (and b!1586271 res!1083326) b!1586272))

(assert (= (and start!138406 ((_ is Cons!36995) l!636)) b!1586273))

(declare-fun m!1454709 () Bool)

(assert (=> start!138406 m!1454709))

(declare-fun m!1454711 () Bool)

(assert (=> b!1586272 m!1454711))

(declare-fun m!1454713 () Bool)

(assert (=> b!1586272 m!1454713))

(check-sat (not start!138406) (not b!1586272) (not b!1586273) tp_is_empty!39567)
(check-sat)
(get-model)

(declare-fun d!167899 () Bool)

(declare-fun res!1083343 () Bool)

(declare-fun e!885824 () Bool)

(assert (=> d!167899 (=> res!1083343 e!885824)))

(assert (=> d!167899 (= res!1083343 (or ((_ is Nil!36996) l!636) ((_ is Nil!36996) (t!51929 l!636))))))

(assert (=> d!167899 (= (isStrictlySorted!1221 l!636) e!885824)))

(declare-fun b!1586293 () Bool)

(declare-fun e!885825 () Bool)

(assert (=> b!1586293 (= e!885824 e!885825)))

(declare-fun res!1083344 () Bool)

(assert (=> b!1586293 (=> (not res!1083344) (not e!885825))))

(assert (=> b!1586293 (= res!1083344 (bvslt (_1!12974 (h!38538 l!636)) (_1!12974 (h!38538 (t!51929 l!636)))))))

(declare-fun b!1586294 () Bool)

(assert (=> b!1586294 (= e!885825 (isStrictlySorted!1221 (t!51929 l!636)))))

(assert (= (and d!167899 (not res!1083343)) b!1586293))

(assert (= (and b!1586293 res!1083344) b!1586294))

(declare-fun m!1454723 () Bool)

(assert (=> b!1586294 m!1454723))

(assert (=> start!138406 d!167899))

(declare-fun d!167903 () Bool)

(declare-fun lt!677512 () Int)

(assert (=> d!167903 (>= lt!677512 0)))

(declare-fun e!885832 () Int)

(assert (=> d!167903 (= lt!677512 e!885832)))

(declare-fun c!147049 () Bool)

(assert (=> d!167903 (= c!147049 ((_ is Nil!36996) (t!51929 l!636)))))

(assert (=> d!167903 (= (ListPrimitiveSize!233 (t!51929 l!636)) lt!677512)))

(declare-fun b!1586307 () Bool)

(assert (=> b!1586307 (= e!885832 0)))

(declare-fun b!1586308 () Bool)

(assert (=> b!1586308 (= e!885832 (+ 1 (ListPrimitiveSize!233 (t!51929 (t!51929 l!636)))))))

(assert (= (and d!167903 c!147049) b!1586307))

(assert (= (and d!167903 (not c!147049)) b!1586308))

(declare-fun m!1454727 () Bool)

(assert (=> b!1586308 m!1454727))

(assert (=> b!1586272 d!167903))

(declare-fun d!167909 () Bool)

(declare-fun lt!677513 () Int)

(assert (=> d!167909 (>= lt!677513 0)))

(declare-fun e!885835 () Int)

(assert (=> d!167909 (= lt!677513 e!885835)))

(declare-fun c!147050 () Bool)

(assert (=> d!167909 (= c!147050 ((_ is Nil!36996) l!636))))

(assert (=> d!167909 (= (ListPrimitiveSize!233 l!636) lt!677513)))

(declare-fun b!1586313 () Bool)

(assert (=> b!1586313 (= e!885835 0)))

(declare-fun b!1586314 () Bool)

(assert (=> b!1586314 (= e!885835 (+ 1 (ListPrimitiveSize!233 (t!51929 l!636))))))

(assert (= (and d!167909 c!147050) b!1586313))

(assert (= (and d!167909 (not c!147050)) b!1586314))

(assert (=> b!1586314 m!1454711))

(assert (=> b!1586272 d!167909))

(declare-fun b!1586324 () Bool)

(declare-fun e!885843 () Bool)

(declare-fun tp!115410 () Bool)

(assert (=> b!1586324 (= e!885843 (and tp_is_empty!39567 tp!115410))))

(assert (=> b!1586273 (= tp!115401 e!885843)))

(assert (= (and b!1586273 ((_ is Cons!36995) (t!51929 l!636))) b!1586324))

(check-sat tp_is_empty!39567 (not b!1586308) (not b!1586324) (not b!1586314) (not b!1586294))
(check-sat)
