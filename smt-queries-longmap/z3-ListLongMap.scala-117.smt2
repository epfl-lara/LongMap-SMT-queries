; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2028 () Bool)

(assert start!2028)

(declare-fun b!13660 () Bool)

(assert (=> b!13660 true))

(declare-fun res!10728 () Bool)

(declare-fun e!8176 () Bool)

(assert (=> b!13660 (=> (not res!10728) (not e!8176))))

(declare-fun lambda!98 () Int)

(declare-datatypes ((B!500 0))(
  ( (B!501 (val!348 Int)) )
))
(declare-datatypes ((tuple2!492 0))(
  ( (tuple2!493 (_1!246 (_ BitVec 64)) (_2!246 B!500)) )
))
(declare-datatypes ((List!399 0))(
  ( (Nil!396) (Cons!395 (h!961 tuple2!492) (t!2795 List!399)) )
))
(declare-fun forall!80 (List!399 Int) Bool)

(assert (=> b!13660 (= res!10728 (forall!80 Nil!396 lambda!98))))

(declare-fun res!10729 () Bool)

(assert (=> start!2028 (=> (not res!10729) (not e!8176))))

(declare-fun l!522 () List!399)

(declare-fun isStrictlySorted!84 (List!399) Bool)

(assert (=> start!2028 (= res!10729 (isStrictlySorted!84 l!522))))

(assert (=> start!2028 e!8176))

(declare-fun e!8175 () Bool)

(assert (=> start!2028 e!8175))

(declare-fun tp_is_empty!679 () Bool)

(assert (=> start!2028 tp_is_empty!679))

(declare-fun b!13661 () Bool)

(declare-fun res!10727 () Bool)

(assert (=> b!13661 (=> (not res!10727) (not e!8176))))

(declare-fun isEmpty!87 (List!399) Bool)

(assert (=> b!13661 (= res!10727 (not (isEmpty!87 l!522)))))

(declare-fun b!13662 () Bool)

(declare-fun res!10730 () Bool)

(assert (=> b!13662 (=> (not res!10730) (not e!8176))))

(declare-fun value!159 () B!500)

(get-info :version)

(assert (=> b!13662 (= res!10730 (and (or (not ((_ is Cons!395) l!522)) (not (= (_2!246 (h!961 l!522)) value!159))) (or (not ((_ is Cons!395) l!522)) (= (_2!246 (h!961 l!522)) value!159)) ((_ is Nil!396) l!522)))))

(declare-fun b!13663 () Bool)

(declare-fun tp!2213 () Bool)

(assert (=> b!13663 (= e!8175 (and tp_is_empty!679 tp!2213))))

(declare-fun b!13664 () Bool)

(assert (=> b!13664 (= e!8176 false)))

(assert (= (and start!2028 res!10729) b!13662))

(assert (= (and b!13662 res!10730) b!13660))

(assert (= (and b!13660 res!10728) b!13661))

(assert (= (and b!13661 res!10727) b!13664))

(assert (= (and start!2028 ((_ is Cons!395) l!522)) b!13663))

(declare-fun m!9237 () Bool)

(assert (=> b!13660 m!9237))

(declare-fun m!9239 () Bool)

(assert (=> start!2028 m!9239))

(declare-fun m!9241 () Bool)

(assert (=> b!13661 m!9241))

(check-sat (not b!13660) tp_is_empty!679 (not start!2028) (not b!13663) (not b!13661))
(check-sat)
