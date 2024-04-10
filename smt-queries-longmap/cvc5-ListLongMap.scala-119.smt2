; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2040 () Bool)

(assert start!2040)

(declare-fun b!13777 () Bool)

(assert (=> b!13777 true))

(declare-fun b!13774 () Bool)

(declare-fun e!8220 () Bool)

(declare-fun tp_is_empty!691 () Bool)

(declare-fun tp!2234 () Bool)

(assert (=> b!13774 (= e!8220 (and tp_is_empty!691 tp!2234))))

(declare-fun b!13775 () Bool)

(declare-fun res!10807 () Bool)

(declare-fun e!8219 () Bool)

(assert (=> b!13775 (=> (not res!10807) (not e!8219))))

(declare-datatypes ((B!512 0))(
  ( (B!513 (val!354 Int)) )
))
(declare-datatypes ((tuple2!508 0))(
  ( (tuple2!509 (_1!254 (_ BitVec 64)) (_2!254 B!512)) )
))
(declare-datatypes ((List!409 0))(
  ( (Nil!406) (Cons!405 (h!971 tuple2!508) (t!2805 List!409)) )
))
(declare-fun lt!3537 () List!409)

(declare-fun isEmpty!93 (List!409) Bool)

(assert (=> b!13775 (= res!10807 (not (isEmpty!93 lt!3537)))))

(declare-fun res!10809 () Bool)

(declare-fun e!8221 () Bool)

(assert (=> start!2040 (=> (not res!10809) (not e!8221))))

(declare-fun l!522 () List!409)

(declare-fun isStrictlySorted!96 (List!409) Bool)

(assert (=> start!2040 (= res!10809 (isStrictlySorted!96 l!522))))

(assert (=> start!2040 e!8221))

(declare-fun e!8222 () Bool)

(assert (=> start!2040 e!8222))

(assert (=> start!2040 tp_is_empty!691))

(declare-fun b!13776 () Bool)

(assert (=> b!13776 (= e!8221 e!8219)))

(declare-fun res!10805 () Bool)

(assert (=> b!13776 (=> (not res!10805) (not e!8219))))

(assert (=> b!13776 (= res!10805 (isStrictlySorted!96 lt!3537))))

(declare-fun err!3 () List!409)

(assert (=> b!13776 (= lt!3537 err!3)))

(assert (=> b!13776 true))

(assert (=> b!13776 e!8220))

(declare-fun res!10808 () Bool)

(assert (=> b!13777 (=> (not res!10808) (not e!8219))))

(declare-fun lambda!116 () Int)

(declare-fun forall!86 (List!409 Int) Bool)

(assert (=> b!13777 (= res!10808 (forall!86 lt!3537 lambda!116))))

(declare-fun b!13778 () Bool)

(declare-fun res!10806 () Bool)

(assert (=> b!13778 (=> (not res!10806) (not e!8221))))

(declare-fun value!159 () B!512)

(assert (=> b!13778 (= res!10806 (and (or (not (is-Cons!405 l!522)) (not (= (_2!254 (h!971 l!522)) value!159))) (or (not (is-Cons!405 l!522)) (= (_2!254 (h!971 l!522)) value!159)) (not (is-Nil!406 l!522))))))

(declare-fun b!13779 () Bool)

(declare-fun tp!2233 () Bool)

(assert (=> b!13779 (= e!8222 (and tp_is_empty!691 tp!2233))))

(declare-fun b!13780 () Bool)

(assert (=> b!13780 (= e!8219 (= lt!3537 Nil!406))))

(declare-fun b!13781 () Bool)

(declare-fun res!10810 () Bool)

(assert (=> b!13781 (=> (not res!10810) (not e!8219))))

(assert (=> b!13781 (= res!10810 (not (isEmpty!93 l!522)))))

(assert (= (and start!2040 res!10809) b!13778))

(assert (= (and b!13778 res!10806) b!13776))

(assert (= (and b!13776 (is-Cons!405 err!3)) b!13774))

(assert (= (and b!13776 res!10805) b!13777))

(assert (= (and b!13777 res!10808) b!13781))

(assert (= (and b!13781 res!10810) b!13775))

(assert (= (and b!13775 res!10807) b!13780))

(assert (= (and start!2040 (is-Cons!405 l!522)) b!13779))

(declare-fun m!9281 () Bool)

(assert (=> b!13777 m!9281))

(declare-fun m!9283 () Bool)

(assert (=> b!13776 m!9283))

(declare-fun m!9285 () Bool)

(assert (=> b!13781 m!9285))

(declare-fun m!9287 () Bool)

(assert (=> start!2040 m!9287))

(declare-fun m!9289 () Bool)

(assert (=> b!13775 m!9289))

(push 1)

