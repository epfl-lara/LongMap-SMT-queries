; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2040 () Bool)

(assert start!2040)

(declare-fun b!13773 () Bool)

(assert (=> b!13773 true))

(declare-fun b!13768 () Bool)

(declare-fun res!10803 () Bool)

(declare-fun e!8215 () Bool)

(assert (=> b!13768 (=> (not res!10803) (not e!8215))))

(declare-datatypes ((B!512 0))(
  ( (B!513 (val!354 Int)) )
))
(declare-datatypes ((tuple2!504 0))(
  ( (tuple2!505 (_1!252 (_ BitVec 64)) (_2!252 B!512)) )
))
(declare-datatypes ((List!405 0))(
  ( (Nil!402) (Cons!401 (h!967 tuple2!504) (t!2801 List!405)) )
))
(declare-fun lt!3537 () List!405)

(declare-fun isEmpty!93 (List!405) Bool)

(assert (=> b!13768 (= res!10803 (not (isEmpty!93 lt!3537)))))

(declare-fun b!13769 () Bool)

(declare-fun res!10807 () Bool)

(assert (=> b!13769 (=> (not res!10807) (not e!8215))))

(declare-fun l!522 () List!405)

(assert (=> b!13769 (= res!10807 (not (isEmpty!93 l!522)))))

(declare-fun b!13770 () Bool)

(declare-fun e!8216 () Bool)

(declare-fun tp_is_empty!691 () Bool)

(declare-fun tp!2234 () Bool)

(assert (=> b!13770 (= e!8216 (and tp_is_empty!691 tp!2234))))

(declare-fun b!13771 () Bool)

(assert (=> b!13771 (= e!8215 (= lt!3537 Nil!402))))

(declare-fun b!13772 () Bool)

(declare-fun e!8217 () Bool)

(assert (=> b!13772 (= e!8217 e!8215)))

(declare-fun res!10808 () Bool)

(assert (=> b!13772 (=> (not res!10808) (not e!8215))))

(declare-fun isStrictlySorted!90 (List!405) Bool)

(assert (=> b!13772 (= res!10808 (isStrictlySorted!90 lt!3537))))

(declare-fun err!3 () List!405)

(assert (=> b!13772 (= lt!3537 err!3)))

(assert (=> b!13772 true))

(declare-fun e!8218 () Bool)

(assert (=> b!13772 e!8218))

(declare-fun res!10804 () Bool)

(assert (=> b!13773 (=> (not res!10804) (not e!8215))))

(declare-fun lambda!116 () Int)

(declare-fun forall!86 (List!405 Int) Bool)

(assert (=> b!13773 (= res!10804 (forall!86 lt!3537 lambda!116))))

(declare-fun b!13774 () Bool)

(declare-fun res!10806 () Bool)

(assert (=> b!13774 (=> (not res!10806) (not e!8217))))

(declare-fun value!159 () B!512)

(get-info :version)

(assert (=> b!13774 (= res!10806 (and (or (not ((_ is Cons!401) l!522)) (not (= (_2!252 (h!967 l!522)) value!159))) (or (not ((_ is Cons!401) l!522)) (= (_2!252 (h!967 l!522)) value!159)) (not ((_ is Nil!402) l!522))))))

(declare-fun b!13775 () Bool)

(declare-fun tp!2233 () Bool)

(assert (=> b!13775 (= e!8218 (and tp_is_empty!691 tp!2233))))

(declare-fun res!10805 () Bool)

(assert (=> start!2040 (=> (not res!10805) (not e!8217))))

(assert (=> start!2040 (= res!10805 (isStrictlySorted!90 l!522))))

(assert (=> start!2040 e!8217))

(assert (=> start!2040 e!8216))

(assert (=> start!2040 tp_is_empty!691))

(assert (= (and start!2040 res!10805) b!13774))

(assert (= (and b!13774 res!10806) b!13772))

(assert (= (and b!13772 ((_ is Cons!401) err!3)) b!13775))

(assert (= (and b!13772 res!10808) b!13773))

(assert (= (and b!13773 res!10804) b!13769))

(assert (= (and b!13769 res!10807) b!13768))

(assert (= (and b!13768 res!10803) b!13771))

(assert (= (and start!2040 ((_ is Cons!401) l!522)) b!13770))

(declare-fun m!9273 () Bool)

(assert (=> b!13772 m!9273))

(declare-fun m!9275 () Bool)

(assert (=> b!13769 m!9275))

(declare-fun m!9277 () Bool)

(assert (=> b!13768 m!9277))

(declare-fun m!9279 () Bool)

(assert (=> b!13773 m!9279))

(declare-fun m!9281 () Bool)

(assert (=> start!2040 m!9281))

(check-sat (not b!13770) (not b!13773) (not b!13772) tp_is_empty!691 (not b!13769) (not b!13775) (not b!13768) (not start!2040))
(check-sat)
