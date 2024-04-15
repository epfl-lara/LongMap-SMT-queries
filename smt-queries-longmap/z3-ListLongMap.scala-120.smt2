; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2046 () Bool)

(assert start!2046)

(declare-fun b!13852 () Bool)

(assert (=> b!13852 true))

(declare-fun res!10860 () Bool)

(declare-fun e!8257 () Bool)

(assert (=> start!2046 (=> (not res!10860) (not e!8257))))

(declare-datatypes ((B!518 0))(
  ( (B!519 (val!357 Int)) )
))
(declare-datatypes ((tuple2!510 0))(
  ( (tuple2!511 (_1!255 (_ BitVec 64)) (_2!255 B!518)) )
))
(declare-datatypes ((List!408 0))(
  ( (Nil!405) (Cons!404 (h!970 tuple2!510) (t!2804 List!408)) )
))
(declare-fun l!522 () List!408)

(declare-fun isStrictlySorted!96 (List!408) Bool)

(assert (=> start!2046 (= res!10860 (isStrictlySorted!96 l!522))))

(assert (=> start!2046 e!8257))

(declare-fun e!8258 () Bool)

(assert (=> start!2046 e!8258))

(declare-fun tp_is_empty!697 () Bool)

(assert (=> start!2046 tp_is_empty!697))

(declare-fun res!10864 () Bool)

(declare-fun e!8255 () Bool)

(assert (=> b!13852 (=> (not res!10864) (not e!8255))))

(declare-fun lt!3546 () List!408)

(declare-fun lambda!125 () Int)

(declare-fun forall!89 (List!408 Int) Bool)

(assert (=> b!13852 (= res!10864 (forall!89 lt!3546 lambda!125))))

(declare-fun b!13853 () Bool)

(declare-fun tp!2252 () Bool)

(assert (=> b!13853 (= e!8258 (and tp_is_empty!697 tp!2252))))

(declare-fun b!13854 () Bool)

(declare-fun res!10862 () Bool)

(assert (=> b!13854 (=> (not res!10862) (not e!8255))))

(declare-fun isEmpty!96 (List!408) Bool)

(assert (=> b!13854 (= res!10862 (not (isEmpty!96 l!522)))))

(declare-fun b!13855 () Bool)

(declare-fun res!10861 () Bool)

(assert (=> b!13855 (=> (not res!10861) (not e!8257))))

(declare-fun value!159 () B!518)

(get-info :version)

(assert (=> b!13855 (= res!10861 (and (or (not ((_ is Cons!404) l!522)) (not (= (_2!255 (h!970 l!522)) value!159))) (or (not ((_ is Cons!404) l!522)) (= (_2!255 (h!970 l!522)) value!159)) (not ((_ is Nil!405) l!522))))))

(declare-fun b!13856 () Bool)

(declare-fun res!10859 () Bool)

(assert (=> b!13856 (=> (not res!10859) (not e!8255))))

(assert (=> b!13856 (= res!10859 (not (isEmpty!96 lt!3546)))))

(declare-fun b!13857 () Bool)

(assert (=> b!13857 (= e!8257 e!8255)))

(declare-fun res!10863 () Bool)

(assert (=> b!13857 (=> (not res!10863) (not e!8255))))

(assert (=> b!13857 (= res!10863 (isStrictlySorted!96 lt!3546))))

(declare-fun err!15 () List!408)

(assert (=> b!13857 (= lt!3546 err!15)))

(assert (=> b!13857 true))

(declare-fun e!8256 () Bool)

(assert (=> b!13857 e!8256))

(declare-fun b!13858 () Bool)

(assert (=> b!13858 (= e!8255 (= l!522 Nil!405))))

(declare-fun b!13859 () Bool)

(declare-fun tp!2251 () Bool)

(assert (=> b!13859 (= e!8256 (and tp_is_empty!697 tp!2251))))

(assert (= (and start!2046 res!10860) b!13855))

(assert (= (and b!13855 res!10861) b!13857))

(assert (= (and b!13857 ((_ is Cons!404) err!15)) b!13859))

(assert (= (and b!13857 res!10863) b!13852))

(assert (= (and b!13852 res!10864) b!13854))

(assert (= (and b!13854 res!10862) b!13856))

(assert (= (and b!13856 res!10859) b!13858))

(assert (= (and start!2046 ((_ is Cons!404) l!522)) b!13853))

(declare-fun m!9303 () Bool)

(assert (=> start!2046 m!9303))

(declare-fun m!9305 () Bool)

(assert (=> b!13852 m!9305))

(declare-fun m!9307 () Bool)

(assert (=> b!13856 m!9307))

(declare-fun m!9309 () Bool)

(assert (=> b!13857 m!9309))

(declare-fun m!9311 () Bool)

(assert (=> b!13854 m!9311))

(check-sat (not b!13854) tp_is_empty!697 (not b!13853) (not b!13859) (not b!13856) (not b!13852) (not start!2046) (not b!13857))
(check-sat)
