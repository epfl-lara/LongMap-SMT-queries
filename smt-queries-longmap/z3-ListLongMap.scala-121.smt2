; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2052 () Bool)

(assert start!2052)

(declare-fun res!10903 () Bool)

(declare-fun e!8287 () Bool)

(assert (=> start!2052 (=> (not res!10903) (not e!8287))))

(declare-datatypes ((B!524 0))(
  ( (B!525 (val!360 Int)) )
))
(declare-datatypes ((tuple2!516 0))(
  ( (tuple2!517 (_1!258 (_ BitVec 64)) (_2!258 B!524)) )
))
(declare-datatypes ((List!411 0))(
  ( (Nil!408) (Cons!407 (h!973 tuple2!516) (t!2807 List!411)) )
))
(declare-fun l!522 () List!411)

(declare-fun isStrictlySorted!99 (List!411) Bool)

(assert (=> start!2052 (= res!10903 (isStrictlySorted!99 l!522))))

(assert (=> start!2052 e!8287))

(declare-fun e!8288 () Bool)

(assert (=> start!2052 e!8288))

(declare-fun b!13918 () Bool)

(declare-fun ListPrimitiveSize!19 (List!411) Int)

(assert (=> b!13918 (= e!8287 (< (ListPrimitiveSize!19 l!522) 0))))

(declare-fun b!13919 () Bool)

(declare-fun tp_is_empty!703 () Bool)

(declare-fun tp!2267 () Bool)

(assert (=> b!13919 (= e!8288 (and tp_is_empty!703 tp!2267))))

(assert (= (and start!2052 res!10903) b!13918))

(get-info :version)

(assert (= (and start!2052 ((_ is Cons!407) l!522)) b!13919))

(declare-fun m!9333 () Bool)

(assert (=> start!2052 m!9333))

(declare-fun m!9335 () Bool)

(assert (=> b!13918 m!9335))

(check-sat (not start!2052) (not b!13918) (not b!13919) tp_is_empty!703)
(check-sat)
(get-model)

(declare-fun d!2067 () Bool)

(declare-fun res!10920 () Bool)

(declare-fun e!8314 () Bool)

(assert (=> d!2067 (=> res!10920 e!8314)))

(assert (=> d!2067 (= res!10920 (or ((_ is Nil!408) l!522) ((_ is Nil!408) (t!2807 l!522))))))

(assert (=> d!2067 (= (isStrictlySorted!99 l!522) e!8314)))

(declare-fun b!13948 () Bool)

(declare-fun e!8315 () Bool)

(assert (=> b!13948 (= e!8314 e!8315)))

(declare-fun res!10921 () Bool)

(assert (=> b!13948 (=> (not res!10921) (not e!8315))))

(assert (=> b!13948 (= res!10921 (bvslt (_1!258 (h!973 l!522)) (_1!258 (h!973 (t!2807 l!522)))))))

(declare-fun b!13949 () Bool)

(assert (=> b!13949 (= e!8315 (isStrictlySorted!99 (t!2807 l!522)))))

(assert (= (and d!2067 (not res!10920)) b!13948))

(assert (= (and b!13948 res!10921) b!13949))

(declare-fun m!9349 () Bool)

(assert (=> b!13949 m!9349))

(assert (=> start!2052 d!2067))

(declare-fun d!2077 () Bool)

(declare-fun lt!3561 () Int)

(assert (=> d!2077 (>= lt!3561 0)))

(declare-fun e!8325 () Int)

(assert (=> d!2077 (= lt!3561 e!8325)))

(declare-fun c!1277 () Bool)

(assert (=> d!2077 (= c!1277 ((_ is Nil!408) l!522))))

(assert (=> d!2077 (= (ListPrimitiveSize!19 l!522) lt!3561)))

(declare-fun b!13964 () Bool)

(assert (=> b!13964 (= e!8325 0)))

(declare-fun b!13965 () Bool)

(assert (=> b!13965 (= e!8325 (+ 1 (ListPrimitiveSize!19 (t!2807 l!522))))))

(assert (= (and d!2077 c!1277) b!13964))

(assert (= (and d!2077 (not c!1277)) b!13965))

(declare-fun m!9353 () Bool)

(assert (=> b!13965 m!9353))

(assert (=> b!13918 d!2077))

(declare-fun b!13980 () Bool)

(declare-fun e!8334 () Bool)

(declare-fun tp!2280 () Bool)

(assert (=> b!13980 (= e!8334 (and tp_is_empty!703 tp!2280))))

(assert (=> b!13919 (= tp!2267 e!8334)))

(assert (= (and b!13919 ((_ is Cons!407) (t!2807 l!522))) b!13980))

(check-sat (not b!13949) (not b!13965) (not b!13980) tp_is_empty!703)
(check-sat)
