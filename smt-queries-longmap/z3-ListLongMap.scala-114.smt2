; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1982 () Bool)

(assert start!1982)

(declare-fun res!10513 () Bool)

(declare-fun e!7985 () Bool)

(assert (=> start!1982 (=> (not res!10513) (not e!7985))))

(declare-datatypes ((B!484 0))(
  ( (B!485 (val!340 Int)) )
))
(declare-datatypes ((tuple2!480 0))(
  ( (tuple2!481 (_1!240 (_ BitVec 64)) (_2!240 B!484)) )
))
(declare-datatypes ((List!395 0))(
  ( (Nil!392) (Cons!391 (h!957 tuple2!480) (t!2791 List!395)) )
))
(declare-fun l!522 () List!395)

(declare-fun isStrictlySorted!82 (List!395) Bool)

(assert (=> start!1982 (= res!10513 (isStrictlySorted!82 l!522))))

(assert (=> start!1982 e!7985))

(declare-fun e!7984 () Bool)

(assert (=> start!1982 e!7984))

(declare-fun tp_is_empty!663 () Bool)

(assert (=> start!1982 tp_is_empty!663))

(declare-fun b!13329 () Bool)

(declare-fun res!10512 () Bool)

(assert (=> b!13329 (=> (not res!10512) (not e!7985))))

(declare-fun value!159 () B!484)

(get-info :version)

(assert (=> b!13329 (= res!10512 (and (not (= (_2!240 (h!957 l!522)) value!159)) ((_ is Cons!391) l!522)))))

(declare-fun b!13330 () Bool)

(assert (=> b!13330 (= e!7985 (not (isStrictlySorted!82 (t!2791 l!522))))))

(declare-fun b!13331 () Bool)

(declare-fun tp!2171 () Bool)

(assert (=> b!13331 (= e!7984 (and tp_is_empty!663 tp!2171))))

(assert (= (and start!1982 res!10513) b!13329))

(assert (= (and b!13329 res!10512) b!13330))

(assert (= (and start!1982 ((_ is Cons!391) l!522)) b!13331))

(declare-fun m!9087 () Bool)

(assert (=> start!1982 m!9087))

(declare-fun m!9089 () Bool)

(assert (=> b!13330 m!9089))

(check-sat (not b!13330) (not start!1982) (not b!13331) tp_is_empty!663)
(check-sat)
(get-model)

(declare-fun d!1999 () Bool)

(declare-fun res!10533 () Bool)

(declare-fun e!8005 () Bool)

(assert (=> d!1999 (=> res!10533 e!8005)))

(assert (=> d!1999 (= res!10533 (or ((_ is Nil!392) (t!2791 l!522)) ((_ is Nil!392) (t!2791 (t!2791 l!522)))))))

(assert (=> d!1999 (= (isStrictlySorted!82 (t!2791 l!522)) e!8005)))

(declare-fun b!13354 () Bool)

(declare-fun e!8007 () Bool)

(assert (=> b!13354 (= e!8005 e!8007)))

(declare-fun res!10534 () Bool)

(assert (=> b!13354 (=> (not res!10534) (not e!8007))))

(assert (=> b!13354 (= res!10534 (bvslt (_1!240 (h!957 (t!2791 l!522))) (_1!240 (h!957 (t!2791 (t!2791 l!522))))))))

(declare-fun b!13356 () Bool)

(assert (=> b!13356 (= e!8007 (isStrictlySorted!82 (t!2791 (t!2791 l!522))))))

(assert (= (and d!1999 (not res!10533)) b!13354))

(assert (= (and b!13354 res!10534) b!13356))

(declare-fun m!9095 () Bool)

(assert (=> b!13356 m!9095))

(assert (=> b!13330 d!1999))

(declare-fun d!2006 () Bool)

(declare-fun res!10538 () Bool)

(declare-fun e!8010 () Bool)

(assert (=> d!2006 (=> res!10538 e!8010)))

(assert (=> d!2006 (= res!10538 (or ((_ is Nil!392) l!522) ((_ is Nil!392) (t!2791 l!522))))))

(assert (=> d!2006 (= (isStrictlySorted!82 l!522) e!8010)))

(declare-fun b!13359 () Bool)

(declare-fun e!8011 () Bool)

(assert (=> b!13359 (= e!8010 e!8011)))

(declare-fun res!10539 () Bool)

(assert (=> b!13359 (=> (not res!10539) (not e!8011))))

(assert (=> b!13359 (= res!10539 (bvslt (_1!240 (h!957 l!522)) (_1!240 (h!957 (t!2791 l!522)))))))

(declare-fun b!13360 () Bool)

(assert (=> b!13360 (= e!8011 (isStrictlySorted!82 (t!2791 l!522)))))

(assert (= (and d!2006 (not res!10538)) b!13359))

(assert (= (and b!13359 res!10539) b!13360))

(assert (=> b!13360 m!9089))

(assert (=> start!1982 d!2006))

(declare-fun b!13378 () Bool)

(declare-fun e!8023 () Bool)

(declare-fun tp!2182 () Bool)

(assert (=> b!13378 (= e!8023 (and tp_is_empty!663 tp!2182))))

(assert (=> b!13331 (= tp!2171 e!8023)))

(assert (= (and b!13331 ((_ is Cons!391) (t!2791 l!522))) b!13378))

(check-sat (not b!13360) (not b!13356) (not b!13378) tp_is_empty!663)
(check-sat)
