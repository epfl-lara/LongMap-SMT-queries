; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2034 () Bool)

(assert start!2034)

(declare-fun b!13718 () Bool)

(assert (=> b!13718 true))

(declare-fun res!10767 () Bool)

(declare-fun e!8198 () Bool)

(assert (=> start!2034 (=> (not res!10767) (not e!8198))))

(declare-datatypes ((B!506 0))(
  ( (B!507 (val!351 Int)) )
))
(declare-datatypes ((tuple2!498 0))(
  ( (tuple2!499 (_1!249 (_ BitVec 64)) (_2!249 B!506)) )
))
(declare-datatypes ((List!402 0))(
  ( (Nil!399) (Cons!398 (h!964 tuple2!498) (t!2798 List!402)) )
))
(declare-fun l!522 () List!402)

(declare-fun isStrictlySorted!90 (List!402) Bool)

(assert (=> start!2034 (= res!10767 (isStrictlySorted!90 l!522))))

(assert (=> start!2034 e!8198))

(declare-fun e!8197 () Bool)

(assert (=> start!2034 e!8197))

(declare-fun tp_is_empty!685 () Bool)

(assert (=> start!2034 tp_is_empty!685))

(declare-fun b!13717 () Bool)

(declare-fun tp!2222 () Bool)

(assert (=> b!13717 (= e!8197 (and tp_is_empty!685 tp!2222))))

(declare-fun res!10765 () Bool)

(assert (=> b!13718 (=> (not res!10765) (not e!8198))))

(declare-fun lambda!107 () Int)

(declare-fun forall!83 (List!402 Int) Bool)

(assert (=> b!13718 (= res!10765 (forall!83 Nil!399 lambda!107))))

(declare-fun b!13719 () Bool)

(assert (=> b!13719 (= e!8198 false)))

(declare-fun b!13720 () Bool)

(declare-fun res!10768 () Bool)

(assert (=> b!13720 (=> (not res!10768) (not e!8198))))

(declare-fun value!159 () B!506)

(get-info :version)

(assert (=> b!13720 (= res!10768 (and (or (not ((_ is Cons!398) l!522)) (not (= (_2!249 (h!964 l!522)) value!159))) (or (not ((_ is Cons!398) l!522)) (= (_2!249 (h!964 l!522)) value!159)) ((_ is Nil!399) l!522)))))

(declare-fun b!13721 () Bool)

(declare-fun res!10766 () Bool)

(assert (=> b!13721 (=> (not res!10766) (not e!8198))))

(declare-fun isEmpty!90 (List!402) Bool)

(assert (=> b!13721 (= res!10766 (not (isEmpty!90 l!522)))))

(assert (= (and start!2034 res!10767) b!13720))

(assert (= (and b!13720 res!10768) b!13718))

(assert (= (and b!13718 res!10765) b!13721))

(assert (= (and b!13721 res!10766) b!13719))

(assert (= (and start!2034 ((_ is Cons!398) l!522)) b!13717))

(declare-fun m!9255 () Bool)

(assert (=> start!2034 m!9255))

(declare-fun m!9257 () Bool)

(assert (=> b!13718 m!9257))

(declare-fun m!9259 () Bool)

(assert (=> b!13721 m!9259))

(check-sat (not b!13718) (not b!13721) (not start!2034) (not b!13717) tp_is_empty!685)
(check-sat)
