; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2048 () Bool)

(assert start!2048)

(declare-fun b!13882 () Bool)

(assert (=> b!13882 true))

(declare-fun b!13878 () Bool)

(declare-fun e!8267 () Bool)

(declare-datatypes ((B!520 0))(
  ( (B!521 (val!358 Int)) )
))
(declare-datatypes ((tuple2!516 0))(
  ( (tuple2!517 (_1!258 (_ BitVec 64)) (_2!258 B!520)) )
))
(declare-datatypes ((List!413 0))(
  ( (Nil!410) (Cons!409 (h!975 tuple2!516) (t!2809 List!413)) )
))
(declare-fun l!522 () List!413)

(assert (=> b!13878 (= e!8267 (= l!522 Nil!410))))

(declare-fun b!13879 () Bool)

(declare-fun res!10882 () Bool)

(assert (=> b!13879 (=> (not res!10882) (not e!8267))))

(declare-fun isEmpty!97 (List!413) Bool)

(assert (=> b!13879 (= res!10882 (not (isEmpty!97 l!522)))))

(declare-fun b!13880 () Bool)

(declare-fun e!8269 () Bool)

(declare-fun tp_is_empty!699 () Bool)

(declare-fun tp!2258 () Bool)

(assert (=> b!13880 (= e!8269 (and tp_is_empty!699 tp!2258))))

(declare-fun b!13881 () Bool)

(declare-fun res!10881 () Bool)

(declare-fun e!8268 () Bool)

(assert (=> b!13881 (=> (not res!10881) (not e!8268))))

(declare-fun value!159 () B!520)

(get-info :version)

(assert (=> b!13881 (= res!10881 (and (or (not ((_ is Cons!409) l!522)) (not (= (_2!258 (h!975 l!522)) value!159))) (or (not ((_ is Cons!409) l!522)) (= (_2!258 (h!975 l!522)) value!159)) (not ((_ is Nil!410) l!522))))))

(declare-fun res!10880 () Bool)

(assert (=> b!13882 (=> (not res!10880) (not e!8267))))

(declare-fun lt!3549 () List!413)

(declare-fun lambda!128 () Int)

(declare-fun forall!90 (List!413 Int) Bool)

(assert (=> b!13882 (= res!10880 (forall!90 lt!3549 lambda!128))))

(declare-fun b!13883 () Bool)

(declare-fun res!10877 () Bool)

(assert (=> b!13883 (=> (not res!10877) (not e!8267))))

(assert (=> b!13883 (= res!10877 (not (isEmpty!97 lt!3549)))))

(declare-fun res!10879 () Bool)

(assert (=> start!2048 (=> (not res!10879) (not e!8268))))

(declare-fun isStrictlySorted!100 (List!413) Bool)

(assert (=> start!2048 (= res!10879 (isStrictlySorted!100 l!522))))

(assert (=> start!2048 e!8268))

(declare-fun e!8270 () Bool)

(assert (=> start!2048 e!8270))

(assert (=> start!2048 tp_is_empty!699))

(declare-fun b!13884 () Bool)

(declare-fun tp!2257 () Bool)

(assert (=> b!13884 (= e!8270 (and tp_is_empty!699 tp!2257))))

(declare-fun b!13885 () Bool)

(assert (=> b!13885 (= e!8268 e!8267)))

(declare-fun res!10878 () Bool)

(assert (=> b!13885 (=> (not res!10878) (not e!8267))))

(assert (=> b!13885 (= res!10878 (isStrictlySorted!100 lt!3549))))

(declare-fun err!19 () List!413)

(assert (=> b!13885 (= lt!3549 err!19)))

(assert (=> b!13885 true))

(assert (=> b!13885 e!8269))

(assert (= (and start!2048 res!10879) b!13881))

(assert (= (and b!13881 res!10881) b!13885))

(assert (= (and b!13885 ((_ is Cons!409) err!19)) b!13880))

(assert (= (and b!13885 res!10878) b!13882))

(assert (= (and b!13882 res!10880) b!13879))

(assert (= (and b!13879 res!10882) b!13883))

(assert (= (and b!13883 res!10877) b!13878))

(assert (= (and start!2048 ((_ is Cons!409) l!522)) b!13884))

(declare-fun m!9321 () Bool)

(assert (=> start!2048 m!9321))

(declare-fun m!9323 () Bool)

(assert (=> b!13885 m!9323))

(declare-fun m!9325 () Bool)

(assert (=> b!13879 m!9325))

(declare-fun m!9327 () Bool)

(assert (=> b!13883 m!9327))

(declare-fun m!9329 () Bool)

(assert (=> b!13882 m!9329))

(check-sat (not b!13883) (not b!13880) tp_is_empty!699 (not b!13884) (not start!2048) (not b!13885) (not b!13879) (not b!13882))
(check-sat)
