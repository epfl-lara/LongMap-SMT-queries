; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2028 () Bool)

(assert start!2028)

(declare-fun b!13667 () Bool)

(assert (=> b!13667 true))

(declare-fun res!10731 () Bool)

(declare-fun e!8180 () Bool)

(assert (=> start!2028 (=> (not res!10731) (not e!8180))))

(declare-datatypes ((B!500 0))(
  ( (B!501 (val!348 Int)) )
))
(declare-datatypes ((tuple2!492 0))(
  ( (tuple2!493 (_1!246 (_ BitVec 64)) (_2!246 B!500)) )
))
(declare-datatypes ((List!399 0))(
  ( (Nil!396) (Cons!395 (h!961 tuple2!492) (t!2795 List!399)) )
))
(declare-fun l!522 () List!399)

(declare-fun isStrictlySorted!87 (List!399) Bool)

(assert (=> start!2028 (= res!10731 (isStrictlySorted!87 l!522))))

(assert (=> start!2028 e!8180))

(declare-fun e!8179 () Bool)

(assert (=> start!2028 e!8179))

(declare-fun tp_is_empty!679 () Bool)

(assert (=> start!2028 tp_is_empty!679))

(declare-fun b!13666 () Bool)

(assert (=> b!13666 (= e!8180 false)))

(declare-fun res!10732 () Bool)

(assert (=> b!13667 (=> (not res!10732) (not e!8180))))

(declare-fun lambda!98 () Int)

(declare-fun forall!80 (List!399 Int) Bool)

(assert (=> b!13667 (= res!10732 (forall!80 Nil!396 lambda!98))))

(declare-fun b!13668 () Bool)

(declare-fun res!10729 () Bool)

(assert (=> b!13668 (=> (not res!10729) (not e!8180))))

(declare-fun value!159 () B!500)

(get-info :version)

(assert (=> b!13668 (= res!10729 (and (or (not ((_ is Cons!395) l!522)) (not (= (_2!246 (h!961 l!522)) value!159))) (or (not ((_ is Cons!395) l!522)) (= (_2!246 (h!961 l!522)) value!159)) ((_ is Nil!396) l!522)))))

(declare-fun b!13669 () Bool)

(declare-fun tp!2213 () Bool)

(assert (=> b!13669 (= e!8179 (and tp_is_empty!679 tp!2213))))

(declare-fun b!13670 () Bool)

(declare-fun res!10730 () Bool)

(assert (=> b!13670 (=> (not res!10730) (not e!8180))))

(declare-fun isEmpty!87 (List!399) Bool)

(assert (=> b!13670 (= res!10730 (not (isEmpty!87 l!522)))))

(assert (= (and start!2028 res!10731) b!13668))

(assert (= (and b!13668 res!10729) b!13667))

(assert (= (and b!13667 res!10732) b!13670))

(assert (= (and b!13670 res!10730) b!13666))

(assert (= (and start!2028 ((_ is Cons!395) l!522)) b!13669))

(declare-fun m!9237 () Bool)

(assert (=> start!2028 m!9237))

(declare-fun m!9239 () Bool)

(assert (=> b!13667 m!9239))

(declare-fun m!9241 () Bool)

(assert (=> b!13670 m!9241))

(check-sat (not b!13669) (not b!13670) tp_is_empty!679 (not start!2028) (not b!13667))
(check-sat)
