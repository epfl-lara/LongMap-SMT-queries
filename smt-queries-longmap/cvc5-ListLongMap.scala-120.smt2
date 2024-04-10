; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2046 () Bool)

(assert start!2046)

(declare-fun b!13853 () Bool)

(assert (=> b!13853 true))

(declare-fun b!13852 () Bool)

(declare-fun res!10860 () Bool)

(declare-fun e!8256 () Bool)

(assert (=> b!13852 (=> (not res!10860) (not e!8256))))

(declare-datatypes ((B!518 0))(
  ( (B!519 (val!357 Int)) )
))
(declare-datatypes ((tuple2!514 0))(
  ( (tuple2!515 (_1!257 (_ BitVec 64)) (_2!257 B!518)) )
))
(declare-datatypes ((List!412 0))(
  ( (Nil!409) (Cons!408 (h!974 tuple2!514) (t!2808 List!412)) )
))
(declare-fun lt!3546 () List!412)

(declare-fun isEmpty!96 (List!412) Bool)

(assert (=> b!13852 (= res!10860 (not (isEmpty!96 lt!3546)))))

(declare-fun res!10863 () Bool)

(assert (=> b!13853 (=> (not res!10863) (not e!8256))))

(declare-fun lambda!125 () Int)

(declare-fun forall!89 (List!412 Int) Bool)

(assert (=> b!13853 (= res!10863 (forall!89 lt!3546 lambda!125))))

(declare-fun b!13854 () Bool)

(declare-fun l!522 () List!412)

(assert (=> b!13854 (= e!8256 (= l!522 Nil!409))))

(declare-fun b!13855 () Bool)

(declare-fun e!8257 () Bool)

(declare-fun tp_is_empty!697 () Bool)

(declare-fun tp!2252 () Bool)

(assert (=> b!13855 (= e!8257 (and tp_is_empty!697 tp!2252))))

(declare-fun b!13857 () Bool)

(declare-fun e!8255 () Bool)

(assert (=> b!13857 (= e!8255 e!8256)))

(declare-fun res!10864 () Bool)

(assert (=> b!13857 (=> (not res!10864) (not e!8256))))

(declare-fun isStrictlySorted!99 (List!412) Bool)

(assert (=> b!13857 (= res!10864 (isStrictlySorted!99 lt!3546))))

(declare-fun err!15 () List!412)

(assert (=> b!13857 (= lt!3546 err!15)))

(assert (=> b!13857 true))

(declare-fun e!8258 () Bool)

(assert (=> b!13857 e!8258))

(declare-fun b!13858 () Bool)

(declare-fun res!10859 () Bool)

(assert (=> b!13858 (=> (not res!10859) (not e!8256))))

(assert (=> b!13858 (= res!10859 (not (isEmpty!96 l!522)))))

(declare-fun b!13859 () Bool)

(declare-fun res!10861 () Bool)

(assert (=> b!13859 (=> (not res!10861) (not e!8255))))

(declare-fun value!159 () B!518)

(assert (=> b!13859 (= res!10861 (and (or (not (is-Cons!408 l!522)) (not (= (_2!257 (h!974 l!522)) value!159))) (or (not (is-Cons!408 l!522)) (= (_2!257 (h!974 l!522)) value!159)) (not (is-Nil!409 l!522))))))

(declare-fun b!13856 () Bool)

(declare-fun tp!2251 () Bool)

(assert (=> b!13856 (= e!8258 (and tp_is_empty!697 tp!2251))))

(declare-fun res!10862 () Bool)

(assert (=> start!2046 (=> (not res!10862) (not e!8255))))

(assert (=> start!2046 (= res!10862 (isStrictlySorted!99 l!522))))

(assert (=> start!2046 e!8255))

(assert (=> start!2046 e!8257))

(assert (=> start!2046 tp_is_empty!697))

(assert (= (and start!2046 res!10862) b!13859))

(assert (= (and b!13859 res!10861) b!13857))

(assert (= (and b!13857 (is-Cons!408 err!15)) b!13856))

(assert (= (and b!13857 res!10864) b!13853))

(assert (= (and b!13853 res!10863) b!13858))

(assert (= (and b!13858 res!10859) b!13852))

(assert (= (and b!13852 res!10860) b!13854))

(assert (= (and start!2046 (is-Cons!408 l!522)) b!13855))

(declare-fun m!9311 () Bool)

(assert (=> b!13852 m!9311))

(declare-fun m!9313 () Bool)

(assert (=> b!13857 m!9313))

(declare-fun m!9315 () Bool)

(assert (=> start!2046 m!9315))

(declare-fun m!9317 () Bool)

(assert (=> b!13853 m!9317))

(declare-fun m!9319 () Bool)

(assert (=> b!13858 m!9319))

(push 1)

