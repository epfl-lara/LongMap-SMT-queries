; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1980 () Bool)

(assert start!1980)

(declare-fun res!10504 () Bool)

(declare-fun e!7975 () Bool)

(assert (=> start!1980 (=> (not res!10504) (not e!7975))))

(declare-datatypes ((B!482 0))(
  ( (B!483 (val!339 Int)) )
))
(declare-datatypes ((tuple2!474 0))(
  ( (tuple2!475 (_1!237 (_ BitVec 64)) (_2!237 B!482)) )
))
(declare-datatypes ((List!390 0))(
  ( (Nil!387) (Cons!386 (h!952 tuple2!474) (t!2786 List!390)) )
))
(declare-fun l!522 () List!390)

(declare-fun isStrictlySorted!75 (List!390) Bool)

(assert (=> start!1980 (= res!10504 (isStrictlySorted!75 l!522))))

(assert (=> start!1980 e!7975))

(declare-fun e!7974 () Bool)

(assert (=> start!1980 e!7974))

(declare-fun tp_is_empty!661 () Bool)

(assert (=> start!1980 tp_is_empty!661))

(declare-fun b!13314 () Bool)

(declare-fun res!10505 () Bool)

(assert (=> b!13314 (=> (not res!10505) (not e!7975))))

(declare-fun value!159 () B!482)

(get-info :version)

(assert (=> b!13314 (= res!10505 (and (not (= (_2!237 (h!952 l!522)) value!159)) ((_ is Cons!386) l!522)))))

(declare-fun b!13315 () Bool)

(assert (=> b!13315 (= e!7975 (not (isStrictlySorted!75 (t!2786 l!522))))))

(declare-fun b!13316 () Bool)

(declare-fun tp!2168 () Bool)

(assert (=> b!13316 (= e!7974 (and tp_is_empty!661 tp!2168))))

(assert (= (and start!1980 res!10504) b!13314))

(assert (= (and b!13314 res!10505) b!13315))

(assert (= (and start!1980 ((_ is Cons!386) l!522)) b!13316))

(declare-fun m!9075 () Bool)

(assert (=> start!1980 m!9075))

(declare-fun m!9077 () Bool)

(assert (=> b!13315 m!9077))

(check-sat (not start!1980) (not b!13315) (not b!13316) tp_is_empty!661)
(check-sat)
(get-model)

(declare-fun d!1995 () Bool)

(declare-fun res!10526 () Bool)

(declare-fun e!7996 () Bool)

(assert (=> d!1995 (=> res!10526 e!7996)))

(assert (=> d!1995 (= res!10526 (or ((_ is Nil!387) l!522) ((_ is Nil!387) (t!2786 l!522))))))

(assert (=> d!1995 (= (isStrictlySorted!75 l!522) e!7996)))

(declare-fun b!13343 () Bool)

(declare-fun e!7997 () Bool)

(assert (=> b!13343 (= e!7996 e!7997)))

(declare-fun res!10527 () Bool)

(assert (=> b!13343 (=> (not res!10527) (not e!7997))))

(assert (=> b!13343 (= res!10527 (bvslt (_1!237 (h!952 l!522)) (_1!237 (h!952 (t!2786 l!522)))))))

(declare-fun b!13344 () Bool)

(assert (=> b!13344 (= e!7997 (isStrictlySorted!75 (t!2786 l!522)))))

(assert (= (and d!1995 (not res!10526)) b!13343))

(assert (= (and b!13343 res!10527) b!13344))

(assert (=> b!13344 m!9077))

(assert (=> start!1980 d!1995))

(declare-fun d!2001 () Bool)

(declare-fun res!10532 () Bool)

(declare-fun e!8002 () Bool)

(assert (=> d!2001 (=> res!10532 e!8002)))

(assert (=> d!2001 (= res!10532 (or ((_ is Nil!387) (t!2786 l!522)) ((_ is Nil!387) (t!2786 (t!2786 l!522)))))))

(assert (=> d!2001 (= (isStrictlySorted!75 (t!2786 l!522)) e!8002)))

(declare-fun b!13347 () Bool)

(declare-fun e!8003 () Bool)

(assert (=> b!13347 (= e!8002 e!8003)))

(declare-fun res!10533 () Bool)

(assert (=> b!13347 (=> (not res!10533) (not e!8003))))

(assert (=> b!13347 (= res!10533 (bvslt (_1!237 (h!952 (t!2786 l!522))) (_1!237 (h!952 (t!2786 (t!2786 l!522))))))))

(declare-fun b!13348 () Bool)

(assert (=> b!13348 (= e!8003 (isStrictlySorted!75 (t!2786 (t!2786 l!522))))))

(assert (= (and d!2001 (not res!10532)) b!13347))

(assert (= (and b!13347 res!10533) b!13348))

(declare-fun m!9089 () Bool)

(assert (=> b!13348 m!9089))

(assert (=> b!13315 d!2001))

(declare-fun b!13365 () Bool)

(declare-fun e!8014 () Bool)

(declare-fun tp!2179 () Bool)

(assert (=> b!13365 (= e!8014 (and tp_is_empty!661 tp!2179))))

(assert (=> b!13316 (= tp!2168 e!8014)))

(assert (= (and b!13316 ((_ is Cons!386) (t!2786 l!522))) b!13365))

(check-sat (not b!13348) (not b!13344) (not b!13365) tp_is_empty!661)
(check-sat)
