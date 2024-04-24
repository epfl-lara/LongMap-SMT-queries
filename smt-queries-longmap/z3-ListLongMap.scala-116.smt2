; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2022 () Bool)

(assert start!2022)

(declare-fun b!13596 () Bool)

(assert (=> b!13596 true))

(declare-fun b!13595 () Bool)

(declare-fun res!10679 () Bool)

(declare-fun e!8152 () Bool)

(assert (=> b!13595 (=> (not res!10679) (not e!8152))))

(declare-datatypes ((B!494 0))(
  ( (B!495 (val!345 Int)) )
))
(declare-datatypes ((tuple2!486 0))(
  ( (tuple2!487 (_1!243 (_ BitVec 64)) (_2!243 B!494)) )
))
(declare-datatypes ((List!396 0))(
  ( (Nil!393) (Cons!392 (h!958 tuple2!486) (t!2792 List!396)) )
))
(declare-fun lt!3528 () List!396)

(declare-fun isEmpty!84 (List!396) Bool)

(assert (=> b!13595 (= res!10679 (not (isEmpty!84 lt!3528)))))

(declare-fun res!10682 () Bool)

(assert (=> b!13596 (=> (not res!10682) (not e!8152))))

(declare-fun lambda!89 () Int)

(declare-fun forall!77 (List!396 Int) Bool)

(assert (=> b!13596 (= res!10682 (forall!77 lt!3528 lambda!89))))

(declare-fun b!13597 () Bool)

(declare-fun res!10680 () Bool)

(assert (=> b!13597 (=> (not res!10680) (not e!8152))))

(declare-fun l!522 () List!396)

(assert (=> b!13597 (= res!10680 (not (isEmpty!84 l!522)))))

(declare-fun b!13598 () Bool)

(assert (=> b!13598 (= e!8152 (= l!522 Nil!393))))

(declare-fun res!10678 () Bool)

(declare-fun e!8151 () Bool)

(assert (=> start!2022 (=> (not res!10678) (not e!8151))))

(declare-fun isStrictlySorted!81 (List!396) Bool)

(assert (=> start!2022 (= res!10678 (isStrictlySorted!81 l!522))))

(assert (=> start!2022 e!8151))

(declare-fun e!8150 () Bool)

(assert (=> start!2022 e!8150))

(declare-fun tp_is_empty!673 () Bool)

(assert (=> start!2022 tp_is_empty!673))

(declare-fun b!13599 () Bool)

(declare-fun res!10681 () Bool)

(assert (=> b!13599 (=> (not res!10681) (not e!8151))))

(declare-fun value!159 () B!494)

(get-info :version)

(assert (=> b!13599 (= res!10681 (and (not (= (_2!243 (h!958 l!522)) value!159)) ((_ is Cons!392) l!522)))))

(declare-fun b!13600 () Bool)

(assert (=> b!13600 (= e!8151 e!8152)))

(declare-fun res!10677 () Bool)

(assert (=> b!13600 (=> (not res!10677) (not e!8152))))

(assert (=> b!13600 (= res!10677 (isStrictlySorted!81 lt!3528))))

(declare-fun filterByValue!10 (List!396 B!494) List!396)

(assert (=> b!13600 (= lt!3528 (filterByValue!10 (t!2792 l!522) value!159))))

(declare-fun b!13601 () Bool)

(declare-fun tp!2204 () Bool)

(assert (=> b!13601 (= e!8150 (and tp_is_empty!673 tp!2204))))

(assert (= (and start!2022 res!10678) b!13599))

(assert (= (and b!13599 res!10681) b!13600))

(assert (= (and b!13600 res!10677) b!13596))

(assert (= (and b!13596 res!10682) b!13597))

(assert (= (and b!13597 res!10680) b!13595))

(assert (= (and b!13595 res!10679) b!13598))

(assert (= (and start!2022 ((_ is Cons!392) l!522)) b!13601))

(declare-fun m!9201 () Bool)

(assert (=> start!2022 m!9201))

(declare-fun m!9203 () Bool)

(assert (=> b!13600 m!9203))

(declare-fun m!9205 () Bool)

(assert (=> b!13600 m!9205))

(declare-fun m!9207 () Bool)

(assert (=> b!13596 m!9207))

(declare-fun m!9209 () Bool)

(assert (=> b!13595 m!9209))

(declare-fun m!9211 () Bool)

(assert (=> b!13597 m!9211))

(check-sat (not start!2022) (not b!13600) (not b!13601) tp_is_empty!673 (not b!13596) (not b!13595) (not b!13597))
(check-sat)
