; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2050 () Bool)

(assert start!2050)

(declare-fun b!13908 () Bool)

(assert (=> b!13908 true))

(declare-fun res!10898 () Bool)

(declare-fun e!8280 () Bool)

(assert (=> start!2050 (=> (not res!10898) (not e!8280))))

(declare-datatypes ((B!522 0))(
  ( (B!523 (val!359 Int)) )
))
(declare-datatypes ((tuple2!518 0))(
  ( (tuple2!519 (_1!259 (_ BitVec 64)) (_2!259 B!522)) )
))
(declare-datatypes ((List!414 0))(
  ( (Nil!411) (Cons!410 (h!976 tuple2!518) (t!2810 List!414)) )
))
(declare-fun l!522 () List!414)

(declare-fun isStrictlySorted!101 (List!414) Bool)

(assert (=> start!2050 (= res!10898 (isStrictlySorted!101 l!522))))

(assert (=> start!2050 e!8280))

(declare-fun e!8281 () Bool)

(assert (=> start!2050 e!8281))

(declare-fun tp_is_empty!701 () Bool)

(assert (=> start!2050 tp_is_empty!701))

(declare-fun b!13904 () Bool)

(declare-fun res!10897 () Bool)

(declare-fun e!8282 () Bool)

(assert (=> b!13904 (=> (not res!10897) (not e!8282))))

(declare-fun isEmpty!98 (List!414) Bool)

(assert (=> b!13904 (= res!10897 (not (isEmpty!98 l!522)))))

(declare-fun b!13905 () Bool)

(declare-fun tp!2263 () Bool)

(assert (=> b!13905 (= e!8281 (and tp_is_empty!701 tp!2263))))

(declare-fun b!13906 () Bool)

(declare-fun e!8279 () Bool)

(declare-fun tp!2264 () Bool)

(assert (=> b!13906 (= e!8279 (and tp_is_empty!701 tp!2264))))

(declare-fun b!13907 () Bool)

(declare-fun res!10895 () Bool)

(assert (=> b!13907 (=> (not res!10895) (not e!8282))))

(declare-fun lt!3552 () List!414)

(assert (=> b!13907 (= res!10895 (not (isEmpty!98 lt!3552)))))

(declare-fun res!10900 () Bool)

(assert (=> b!13908 (=> (not res!10900) (not e!8282))))

(declare-fun lambda!131 () Int)

(declare-fun forall!91 (List!414 Int) Bool)

(assert (=> b!13908 (= res!10900 (forall!91 lt!3552 lambda!131))))

(declare-fun b!13909 () Bool)

(declare-fun res!10896 () Bool)

(assert (=> b!13909 (=> (not res!10896) (not e!8280))))

(declare-fun value!159 () B!522)

(assert (=> b!13909 (= res!10896 (and (or (not (is-Cons!410 l!522)) (not (= (_2!259 (h!976 l!522)) value!159))) (or (not (is-Cons!410 l!522)) (= (_2!259 (h!976 l!522)) value!159)) (not (is-Nil!411 l!522))))))

(declare-fun b!13910 () Bool)

(assert (=> b!13910 (= e!8280 e!8282)))

(declare-fun res!10899 () Bool)

(assert (=> b!13910 (=> (not res!10899) (not e!8282))))

(assert (=> b!13910 (= res!10899 (isStrictlySorted!101 lt!3552))))

(declare-fun err!23 () List!414)

(assert (=> b!13910 (= lt!3552 err!23)))

(assert (=> b!13910 true))

(assert (=> b!13910 e!8279))

(declare-fun b!13911 () Bool)

(assert (=> b!13911 (= e!8282 (= l!522 Nil!411))))

(assert (= (and start!2050 res!10898) b!13909))

(assert (= (and b!13909 res!10896) b!13910))

(assert (= (and b!13910 (is-Cons!410 err!23)) b!13906))

(assert (= (and b!13910 res!10899) b!13908))

(assert (= (and b!13908 res!10900) b!13904))

(assert (= (and b!13904 res!10897) b!13907))

(assert (= (and b!13907 res!10895) b!13911))

(assert (= (and start!2050 (is-Cons!410 l!522)) b!13905))

(declare-fun m!9331 () Bool)

(assert (=> b!13904 m!9331))

(declare-fun m!9333 () Bool)

(assert (=> start!2050 m!9333))

(declare-fun m!9335 () Bool)

(assert (=> b!13910 m!9335))

(declare-fun m!9337 () Bool)

(assert (=> b!13908 m!9337))

(declare-fun m!9339 () Bool)

(assert (=> b!13907 m!9339))

(push 1)

(assert (not b!13905))

(assert tp_is_empty!701)

(assert (not b!13904))

