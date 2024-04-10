; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2024 () Bool)

(assert start!2024)

(declare-fun b!13626 () Bool)

(assert (=> b!13626 true))

(declare-fun b!13624 () Bool)

(declare-fun res!10700 () Bool)

(declare-fun e!8164 () Bool)

(assert (=> b!13624 (=> (not res!10700) (not e!8164))))

(declare-datatypes ((B!496 0))(
  ( (B!497 (val!346 Int)) )
))
(declare-datatypes ((tuple2!492 0))(
  ( (tuple2!493 (_1!246 (_ BitVec 64)) (_2!246 B!496)) )
))
(declare-datatypes ((List!401 0))(
  ( (Nil!398) (Cons!397 (h!963 tuple2!492) (t!2797 List!401)) )
))
(declare-fun l!522 () List!401)

(declare-fun isEmpty!85 (List!401) Bool)

(assert (=> b!13624 (= res!10700 (not (isEmpty!85 l!522)))))

(declare-fun b!13625 () Bool)

(declare-fun res!10697 () Bool)

(declare-fun e!8163 () Bool)

(assert (=> b!13625 (=> (not res!10697) (not e!8163))))

(declare-fun value!159 () B!496)

(get-info :version)

(assert (=> b!13625 (= res!10697 (and (not (= (_2!246 (h!963 l!522)) value!159)) ((_ is Cons!397) l!522)))))

(declare-fun res!10699 () Bool)

(assert (=> start!2024 (=> (not res!10699) (not e!8163))))

(declare-fun isStrictlySorted!88 (List!401) Bool)

(assert (=> start!2024 (= res!10699 (isStrictlySorted!88 l!522))))

(assert (=> start!2024 e!8163))

(declare-fun e!8165 () Bool)

(assert (=> start!2024 e!8165))

(declare-fun tp_is_empty!675 () Bool)

(assert (=> start!2024 tp_is_empty!675))

(declare-fun res!10698 () Bool)

(assert (=> b!13626 (=> (not res!10698) (not e!8164))))

(declare-fun lt!3531 () List!401)

(declare-fun lambda!92 () Int)

(declare-fun forall!78 (List!401 Int) Bool)

(assert (=> b!13626 (= res!10698 (forall!78 lt!3531 lambda!92))))

(declare-fun b!13627 () Bool)

(declare-fun res!10701 () Bool)

(assert (=> b!13627 (=> (not res!10701) (not e!8164))))

(assert (=> b!13627 (= res!10701 (not (isEmpty!85 lt!3531)))))

(declare-fun b!13628 () Bool)

(assert (=> b!13628 (= e!8164 (= l!522 Nil!398))))

(declare-fun b!13629 () Bool)

(declare-fun tp!2207 () Bool)

(assert (=> b!13629 (= e!8165 (and tp_is_empty!675 tp!2207))))

(declare-fun b!13630 () Bool)

(assert (=> b!13630 (= e!8163 e!8164)))

(declare-fun res!10702 () Bool)

(assert (=> b!13630 (=> (not res!10702) (not e!8164))))

(assert (=> b!13630 (= res!10702 (isStrictlySorted!88 lt!3531))))

(declare-fun filterByValue!11 (List!401 B!496) List!401)

(assert (=> b!13630 (= lt!3531 (filterByValue!11 (t!2797 l!522) value!159))))

(assert (= (and start!2024 res!10699) b!13625))

(assert (= (and b!13625 res!10697) b!13630))

(assert (= (and b!13630 res!10702) b!13626))

(assert (= (and b!13626 res!10698) b!13624))

(assert (= (and b!13624 res!10700) b!13627))

(assert (= (and b!13627 res!10701) b!13628))

(assert (= (and start!2024 ((_ is Cons!397) l!522)) b!13629))

(declare-fun m!9221 () Bool)

(assert (=> start!2024 m!9221))

(declare-fun m!9223 () Bool)

(assert (=> b!13627 m!9223))

(declare-fun m!9225 () Bool)

(assert (=> b!13626 m!9225))

(declare-fun m!9227 () Bool)

(assert (=> b!13624 m!9227))

(declare-fun m!9229 () Bool)

(assert (=> b!13630 m!9229))

(declare-fun m!9231 () Bool)

(assert (=> b!13630 m!9231))

(check-sat (not start!2024) (not b!13630) (not b!13624) (not b!13629) (not b!13627) tp_is_empty!675 (not b!13626))
(check-sat)
