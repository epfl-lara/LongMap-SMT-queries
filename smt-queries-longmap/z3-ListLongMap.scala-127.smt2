; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2222 () Bool)

(assert start!2222)

(declare-fun res!11392 () Bool)

(declare-fun e!8929 () Bool)

(assert (=> start!2222 (=> (not res!11392) (not e!8929))))

(declare-datatypes ((B!562 0))(
  ( (B!563 (val!379 Int)) )
))
(declare-datatypes ((tuple2!558 0))(
  ( (tuple2!559 (_1!279 (_ BitVec 64)) (_2!279 B!562)) )
))
(declare-datatypes ((List!434 0))(
  ( (Nil!431) (Cons!430 (h!996 tuple2!558) (t!2836 List!434)) )
))
(declare-fun l!522 () List!434)

(declare-fun isStrictlySorted!121 (List!434) Bool)

(assert (=> start!2222 (= res!11392 (isStrictlySorted!121 l!522))))

(assert (=> start!2222 e!8929))

(declare-fun e!8930 () Bool)

(assert (=> start!2222 e!8930))

(declare-fun tp_is_empty!741 () Bool)

(assert (=> start!2222 tp_is_empty!741))

(declare-fun b!14842 () Bool)

(declare-fun value!159 () B!562)

(get-info :version)

(assert (=> b!14842 (= e!8929 (and (or (not ((_ is Cons!430) l!522)) (not (= (_2!279 (h!996 l!522)) value!159))) (or (not ((_ is Cons!430) l!522)) (= (_2!279 (h!996 l!522)) value!159)) (not ((_ is Nil!431) l!522))))))

(declare-fun b!14843 () Bool)

(declare-fun tp!2384 () Bool)

(assert (=> b!14843 (= e!8930 (and tp_is_empty!741 tp!2384))))

(assert (= (and start!2222 res!11392) b!14842))

(assert (= (and start!2222 ((_ is Cons!430) l!522)) b!14843))

(declare-fun m!9901 () Bool)

(assert (=> start!2222 m!9901))

(check-sat (not start!2222) (not b!14843) tp_is_empty!741)
(check-sat)
