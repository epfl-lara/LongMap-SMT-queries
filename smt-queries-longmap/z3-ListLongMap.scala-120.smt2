; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2046 () Bool)

(assert start!2046)

(declare-fun b!13846 () Bool)

(assert (=> b!13846 true))

(declare-fun res!10859 () Bool)

(declare-fun e!8252 () Bool)

(assert (=> b!13846 (=> (not res!10859) (not e!8252))))

(declare-datatypes ((B!518 0))(
  ( (B!519 (val!357 Int)) )
))
(declare-datatypes ((tuple2!510 0))(
  ( (tuple2!511 (_1!255 (_ BitVec 64)) (_2!255 B!518)) )
))
(declare-datatypes ((List!408 0))(
  ( (Nil!405) (Cons!404 (h!970 tuple2!510) (t!2804 List!408)) )
))
(declare-fun lt!3546 () List!408)

(declare-fun lambda!125 () Int)

(declare-fun forall!89 (List!408 Int) Bool)

(assert (=> b!13846 (= res!10859 (forall!89 lt!3546 lambda!125))))

(declare-fun b!13847 () Bool)

(declare-fun res!10858 () Bool)

(declare-fun e!8254 () Bool)

(assert (=> b!13847 (=> (not res!10858) (not e!8254))))

(declare-fun l!522 () List!408)

(declare-fun value!159 () B!518)

(get-info :version)

(assert (=> b!13847 (= res!10858 (and (or (not ((_ is Cons!404) l!522)) (not (= (_2!255 (h!970 l!522)) value!159))) (or (not ((_ is Cons!404) l!522)) (= (_2!255 (h!970 l!522)) value!159)) (not ((_ is Nil!405) l!522))))))

(declare-fun b!13848 () Bool)

(declare-fun res!10861 () Bool)

(assert (=> b!13848 (=> (not res!10861) (not e!8252))))

(declare-fun isEmpty!96 (List!408) Bool)

(assert (=> b!13848 (= res!10861 (not (isEmpty!96 l!522)))))

(declare-fun b!13849 () Bool)

(assert (=> b!13849 (= e!8254 e!8252)))

(declare-fun res!10857 () Bool)

(assert (=> b!13849 (=> (not res!10857) (not e!8252))))

(declare-fun isStrictlySorted!93 (List!408) Bool)

(assert (=> b!13849 (= res!10857 (isStrictlySorted!93 lt!3546))))

(declare-fun err!15 () List!408)

(assert (=> b!13849 (= lt!3546 err!15)))

(assert (=> b!13849 true))

(declare-fun e!8251 () Bool)

(assert (=> b!13849 e!8251))

(declare-fun b!13850 () Bool)

(declare-fun tp_is_empty!697 () Bool)

(declare-fun tp!2252 () Bool)

(assert (=> b!13850 (= e!8251 (and tp_is_empty!697 tp!2252))))

(declare-fun b!13851 () Bool)

(declare-fun e!8253 () Bool)

(declare-fun tp!2251 () Bool)

(assert (=> b!13851 (= e!8253 (and tp_is_empty!697 tp!2251))))

(declare-fun res!10862 () Bool)

(assert (=> start!2046 (=> (not res!10862) (not e!8254))))

(assert (=> start!2046 (= res!10862 (isStrictlySorted!93 l!522))))

(assert (=> start!2046 e!8254))

(assert (=> start!2046 e!8253))

(assert (=> start!2046 tp_is_empty!697))

(declare-fun b!13852 () Bool)

(declare-fun res!10860 () Bool)

(assert (=> b!13852 (=> (not res!10860) (not e!8252))))

(assert (=> b!13852 (= res!10860 (not (isEmpty!96 lt!3546)))))

(declare-fun b!13853 () Bool)

(assert (=> b!13853 (= e!8252 (= l!522 Nil!405))))

(assert (= (and start!2046 res!10862) b!13847))

(assert (= (and b!13847 res!10858) b!13849))

(assert (= (and b!13849 ((_ is Cons!404) err!15)) b!13850))

(assert (= (and b!13849 res!10857) b!13846))

(assert (= (and b!13846 res!10859) b!13848))

(assert (= (and b!13848 res!10861) b!13852))

(assert (= (and b!13852 res!10860) b!13853))

(assert (= (and start!2046 ((_ is Cons!404) l!522)) b!13851))

(declare-fun m!9303 () Bool)

(assert (=> b!13849 m!9303))

(declare-fun m!9305 () Bool)

(assert (=> start!2046 m!9305))

(declare-fun m!9307 () Bool)

(assert (=> b!13848 m!9307))

(declare-fun m!9309 () Bool)

(assert (=> b!13852 m!9309))

(declare-fun m!9311 () Bool)

(assert (=> b!13846 m!9311))

(check-sat (not b!13848) (not start!2046) (not b!13850) (not b!13846) (not b!13851) tp_is_empty!697 (not b!13849) (not b!13852))
(check-sat)
