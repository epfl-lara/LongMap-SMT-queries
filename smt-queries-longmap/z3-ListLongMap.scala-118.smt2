; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2034 () Bool)

(assert start!2034)

(declare-fun b!13712 () Bool)

(assert (=> b!13712 true))

(declare-fun res!10765 () Bool)

(declare-fun e!8194 () Bool)

(assert (=> start!2034 (=> (not res!10765) (not e!8194))))

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

(declare-fun isStrictlySorted!87 (List!402) Bool)

(assert (=> start!2034 (= res!10765 (isStrictlySorted!87 l!522))))

(assert (=> start!2034 e!8194))

(declare-fun e!8193 () Bool)

(assert (=> start!2034 e!8193))

(declare-fun tp_is_empty!685 () Bool)

(assert (=> start!2034 tp_is_empty!685))

(declare-fun b!13711 () Bool)

(declare-fun res!10763 () Bool)

(assert (=> b!13711 (=> (not res!10763) (not e!8194))))

(declare-fun isEmpty!90 (List!402) Bool)

(assert (=> b!13711 (= res!10763 (not (isEmpty!90 l!522)))))

(declare-fun res!10766 () Bool)

(assert (=> b!13712 (=> (not res!10766) (not e!8194))))

(declare-fun lambda!107 () Int)

(declare-fun forall!83 (List!402 Int) Bool)

(assert (=> b!13712 (= res!10766 (forall!83 Nil!399 lambda!107))))

(declare-fun b!13713 () Bool)

(assert (=> b!13713 (= e!8194 false)))

(declare-fun b!13714 () Bool)

(declare-fun tp!2222 () Bool)

(assert (=> b!13714 (= e!8193 (and tp_is_empty!685 tp!2222))))

(declare-fun b!13715 () Bool)

(declare-fun res!10764 () Bool)

(assert (=> b!13715 (=> (not res!10764) (not e!8194))))

(declare-fun value!159 () B!506)

(get-info :version)

(assert (=> b!13715 (= res!10764 (and (or (not ((_ is Cons!398) l!522)) (not (= (_2!249 (h!964 l!522)) value!159))) (or (not ((_ is Cons!398) l!522)) (= (_2!249 (h!964 l!522)) value!159)) ((_ is Nil!399) l!522)))))

(assert (= (and start!2034 res!10765) b!13715))

(assert (= (and b!13715 res!10764) b!13712))

(assert (= (and b!13712 res!10766) b!13711))

(assert (= (and b!13711 res!10763) b!13713))

(assert (= (and start!2034 ((_ is Cons!398) l!522)) b!13714))

(declare-fun m!9255 () Bool)

(assert (=> start!2034 m!9255))

(declare-fun m!9257 () Bool)

(assert (=> b!13711 m!9257))

(declare-fun m!9259 () Bool)

(assert (=> b!13712 m!9259))

(check-sat (not b!13711) tp_is_empty!685 (not b!13712) (not b!13714) (not start!2034))
(check-sat)
