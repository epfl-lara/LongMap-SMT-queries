; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75154 () Bool)

(assert start!75154)

(declare-fun res!601391 () Bool)

(declare-fun e!492893 () Bool)

(assert (=> start!75154 (=> (not res!601391) (not e!492893))))

(declare-datatypes ((B!1286 0))(
  ( (B!1287 (val!8949 Int)) )
))
(declare-datatypes ((tuple2!11912 0))(
  ( (tuple2!11913 (_1!5967 (_ BitVec 64)) (_2!5967 B!1286)) )
))
(declare-datatypes ((List!17673 0))(
  ( (Nil!17670) (Cons!17669 (h!18800 tuple2!11912) (t!24941 List!17673)) )
))
(declare-fun l!906 () List!17673)

(declare-fun isStrictlySorted!479 (List!17673) Bool)

(assert (=> start!75154 (= res!601391 (isStrictlySorted!479 l!906))))

(assert (=> start!75154 e!492893))

(declare-fun e!492892 () Bool)

(assert (=> start!75154 e!492892))

(assert (=> start!75154 true))

(declare-fun b!885600 () Bool)

(declare-fun res!601390 () Bool)

(assert (=> b!885600 (=> (not res!601390) (not e!492893))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885600 (= res!601390 (and ((_ is Cons!17669) l!906) (bvslt (_1!5967 (h!18800 l!906)) key1!49)))))

(declare-fun b!885601 () Bool)

(assert (=> b!885601 (= e!492893 (not (isStrictlySorted!479 (t!24941 l!906))))))

(declare-fun b!885602 () Bool)

(declare-fun tp_is_empty!17797 () Bool)

(declare-fun tp!54330 () Bool)

(assert (=> b!885602 (= e!492892 (and tp_is_empty!17797 tp!54330))))

(assert (= (and start!75154 res!601391) b!885600))

(assert (= (and b!885600 res!601390) b!885601))

(assert (= (and start!75154 ((_ is Cons!17669) l!906)) b!885602))

(declare-fun m!825107 () Bool)

(assert (=> start!75154 m!825107))

(declare-fun m!825109 () Bool)

(assert (=> b!885601 m!825109))

(check-sat (not start!75154) (not b!885601) (not b!885602) tp_is_empty!17797)
(check-sat)
(get-model)

(declare-fun d!109259 () Bool)

(declare-fun res!601408 () Bool)

(declare-fun e!492910 () Bool)

(assert (=> d!109259 (=> res!601408 e!492910)))

(assert (=> d!109259 (= res!601408 (or ((_ is Nil!17670) l!906) ((_ is Nil!17670) (t!24941 l!906))))))

(assert (=> d!109259 (= (isStrictlySorted!479 l!906) e!492910)))

(declare-fun b!885625 () Bool)

(declare-fun e!492911 () Bool)

(assert (=> b!885625 (= e!492910 e!492911)))

(declare-fun res!601409 () Bool)

(assert (=> b!885625 (=> (not res!601409) (not e!492911))))

(assert (=> b!885625 (= res!601409 (bvslt (_1!5967 (h!18800 l!906)) (_1!5967 (h!18800 (t!24941 l!906)))))))

(declare-fun b!885626 () Bool)

(assert (=> b!885626 (= e!492911 (isStrictlySorted!479 (t!24941 l!906)))))

(assert (= (and d!109259 (not res!601408)) b!885625))

(assert (= (and b!885625 res!601409) b!885626))

(assert (=> b!885626 m!825109))

(assert (=> start!75154 d!109259))

(declare-fun d!109261 () Bool)

(declare-fun res!601410 () Bool)

(declare-fun e!492912 () Bool)

(assert (=> d!109261 (=> res!601410 e!492912)))

(assert (=> d!109261 (= res!601410 (or ((_ is Nil!17670) (t!24941 l!906)) ((_ is Nil!17670) (t!24941 (t!24941 l!906)))))))

(assert (=> d!109261 (= (isStrictlySorted!479 (t!24941 l!906)) e!492912)))

(declare-fun b!885627 () Bool)

(declare-fun e!492913 () Bool)

(assert (=> b!885627 (= e!492912 e!492913)))

(declare-fun res!601411 () Bool)

(assert (=> b!885627 (=> (not res!601411) (not e!492913))))

(assert (=> b!885627 (= res!601411 (bvslt (_1!5967 (h!18800 (t!24941 l!906))) (_1!5967 (h!18800 (t!24941 (t!24941 l!906))))))))

(declare-fun b!885628 () Bool)

(assert (=> b!885628 (= e!492913 (isStrictlySorted!479 (t!24941 (t!24941 l!906))))))

(assert (= (and d!109261 (not res!601410)) b!885627))

(assert (= (and b!885627 res!601411) b!885628))

(declare-fun m!825119 () Bool)

(assert (=> b!885628 m!825119))

(assert (=> b!885601 d!109261))

(declare-fun b!885633 () Bool)

(declare-fun e!492916 () Bool)

(declare-fun tp!54339 () Bool)

(assert (=> b!885633 (= e!492916 (and tp_is_empty!17797 tp!54339))))

(assert (=> b!885602 (= tp!54330 e!492916)))

(assert (= (and b!885602 ((_ is Cons!17669) (t!24941 l!906))) b!885633))

(check-sat (not b!885628) (not b!885626) (not b!885633) tp_is_empty!17797)
(check-sat)
