; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2040 () Bool)

(assert start!2040)

(declare-fun b!13778 () Bool)

(assert (=> b!13778 true))

(declare-fun b!13774 () Bool)

(declare-fun e!8219 () Bool)

(declare-fun tp_is_empty!691 () Bool)

(declare-fun tp!2234 () Bool)

(assert (=> b!13774 (= e!8219 (and tp_is_empty!691 tp!2234))))

(declare-fun b!13775 () Bool)

(declare-fun res!10805 () Bool)

(declare-fun e!8221 () Bool)

(assert (=> b!13775 (=> (not res!10805) (not e!8221))))

(declare-datatypes ((B!512 0))(
  ( (B!513 (val!354 Int)) )
))
(declare-datatypes ((tuple2!504 0))(
  ( (tuple2!505 (_1!252 (_ BitVec 64)) (_2!252 B!512)) )
))
(declare-datatypes ((List!405 0))(
  ( (Nil!402) (Cons!401 (h!967 tuple2!504) (t!2801 List!405)) )
))
(declare-fun l!522 () List!405)

(declare-fun value!159 () B!512)

(get-info :version)

(assert (=> b!13775 (= res!10805 (and (or (not ((_ is Cons!401) l!522)) (not (= (_2!252 (h!967 l!522)) value!159))) (or (not ((_ is Cons!401) l!522)) (= (_2!252 (h!967 l!522)) value!159)) (not ((_ is Nil!402) l!522))))))

(declare-fun b!13776 () Bool)

(declare-fun res!10808 () Bool)

(declare-fun e!8222 () Bool)

(assert (=> b!13776 (=> (not res!10808) (not e!8222))))

(declare-fun isEmpty!93 (List!405) Bool)

(assert (=> b!13776 (= res!10808 (not (isEmpty!93 l!522)))))

(declare-fun b!13777 () Bool)

(assert (=> b!13777 (= e!8221 e!8222)))

(declare-fun res!10809 () Bool)

(assert (=> b!13777 (=> (not res!10809) (not e!8222))))

(declare-fun lt!3537 () List!405)

(declare-fun isStrictlySorted!93 (List!405) Bool)

(assert (=> b!13777 (= res!10809 (isStrictlySorted!93 lt!3537))))

(declare-fun err!3 () List!405)

(assert (=> b!13777 (= lt!3537 err!3)))

(assert (=> b!13777 true))

(assert (=> b!13777 e!8219))

(declare-fun res!10810 () Bool)

(assert (=> start!2040 (=> (not res!10810) (not e!8221))))

(assert (=> start!2040 (= res!10810 (isStrictlySorted!93 l!522))))

(assert (=> start!2040 e!8221))

(declare-fun e!8220 () Bool)

(assert (=> start!2040 e!8220))

(assert (=> start!2040 tp_is_empty!691))

(declare-fun res!10806 () Bool)

(assert (=> b!13778 (=> (not res!10806) (not e!8222))))

(declare-fun lambda!116 () Int)

(declare-fun forall!86 (List!405 Int) Bool)

(assert (=> b!13778 (= res!10806 (forall!86 lt!3537 lambda!116))))

(declare-fun b!13779 () Bool)

(declare-fun tp!2233 () Bool)

(assert (=> b!13779 (= e!8220 (and tp_is_empty!691 tp!2233))))

(declare-fun b!13780 () Bool)

(assert (=> b!13780 (= e!8222 (= lt!3537 Nil!402))))

(declare-fun b!13781 () Bool)

(declare-fun res!10807 () Bool)

(assert (=> b!13781 (=> (not res!10807) (not e!8222))))

(assert (=> b!13781 (= res!10807 (not (isEmpty!93 lt!3537)))))

(assert (= (and start!2040 res!10810) b!13775))

(assert (= (and b!13775 res!10805) b!13777))

(assert (= (and b!13777 ((_ is Cons!401) err!3)) b!13774))

(assert (= (and b!13777 res!10809) b!13778))

(assert (= (and b!13778 res!10806) b!13776))

(assert (= (and b!13776 res!10808) b!13781))

(assert (= (and b!13781 res!10807) b!13780))

(assert (= (and start!2040 ((_ is Cons!401) l!522)) b!13779))

(declare-fun m!9273 () Bool)

(assert (=> b!13781 m!9273))

(declare-fun m!9275 () Bool)

(assert (=> b!13778 m!9275))

(declare-fun m!9277 () Bool)

(assert (=> b!13776 m!9277))

(declare-fun m!9279 () Bool)

(assert (=> b!13777 m!9279))

(declare-fun m!9281 () Bool)

(assert (=> start!2040 m!9281))

(check-sat (not b!13777) (not b!13779) (not b!13774) (not start!2040) (not b!13776) tp_is_empty!691 (not b!13781) (not b!13778))
(check-sat)
