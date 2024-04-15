; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2022 () Bool)

(assert start!2022)

(declare-fun b!13601 () Bool)

(assert (=> b!13601 true))

(declare-fun res!10684 () Bool)

(declare-fun e!8154 () Bool)

(assert (=> b!13601 (=> (not res!10684) (not e!8154))))

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

(declare-fun lambda!89 () Int)

(declare-fun forall!77 (List!396 Int) Bool)

(assert (=> b!13601 (= res!10684 (forall!77 lt!3528 lambda!89))))

(declare-fun b!13602 () Bool)

(declare-fun res!10682 () Bool)

(assert (=> b!13602 (=> (not res!10682) (not e!8154))))

(declare-fun isEmpty!84 (List!396) Bool)

(assert (=> b!13602 (= res!10682 (not (isEmpty!84 lt!3528)))))

(declare-fun b!13603 () Bool)

(declare-fun l!522 () List!396)

(assert (=> b!13603 (= e!8154 (= l!522 Nil!393))))

(declare-fun b!13604 () Bool)

(declare-fun res!10683 () Bool)

(declare-fun e!8155 () Bool)

(assert (=> b!13604 (=> (not res!10683) (not e!8155))))

(declare-fun value!159 () B!494)

(get-info :version)

(assert (=> b!13604 (= res!10683 (and (not (= (_2!243 (h!958 l!522)) value!159)) ((_ is Cons!392) l!522)))))

(declare-fun res!10679 () Bool)

(assert (=> start!2022 (=> (not res!10679) (not e!8155))))

(declare-fun isStrictlySorted!84 (List!396) Bool)

(assert (=> start!2022 (= res!10679 (isStrictlySorted!84 l!522))))

(assert (=> start!2022 e!8155))

(declare-fun e!8156 () Bool)

(assert (=> start!2022 e!8156))

(declare-fun tp_is_empty!673 () Bool)

(assert (=> start!2022 tp_is_empty!673))

(declare-fun b!13605 () Bool)

(assert (=> b!13605 (= e!8155 e!8154)))

(declare-fun res!10680 () Bool)

(assert (=> b!13605 (=> (not res!10680) (not e!8154))))

(assert (=> b!13605 (= res!10680 (isStrictlySorted!84 lt!3528))))

(declare-fun filterByValue!10 (List!396 B!494) List!396)

(assert (=> b!13605 (= lt!3528 (filterByValue!10 (t!2792 l!522) value!159))))

(declare-fun b!13606 () Bool)

(declare-fun res!10681 () Bool)

(assert (=> b!13606 (=> (not res!10681) (not e!8154))))

(assert (=> b!13606 (= res!10681 (not (isEmpty!84 l!522)))))

(declare-fun b!13607 () Bool)

(declare-fun tp!2204 () Bool)

(assert (=> b!13607 (= e!8156 (and tp_is_empty!673 tp!2204))))

(assert (= (and start!2022 res!10679) b!13604))

(assert (= (and b!13604 res!10683) b!13605))

(assert (= (and b!13605 res!10680) b!13601))

(assert (= (and b!13601 res!10684) b!13606))

(assert (= (and b!13606 res!10681) b!13602))

(assert (= (and b!13602 res!10682) b!13603))

(assert (= (and start!2022 ((_ is Cons!392) l!522)) b!13607))

(declare-fun m!9201 () Bool)

(assert (=> b!13602 m!9201))

(declare-fun m!9203 () Bool)

(assert (=> start!2022 m!9203))

(declare-fun m!9205 () Bool)

(assert (=> b!13606 m!9205))

(declare-fun m!9207 () Bool)

(assert (=> b!13605 m!9207))

(declare-fun m!9209 () Bool)

(assert (=> b!13605 m!9209))

(declare-fun m!9211 () Bool)

(assert (=> b!13601 m!9211))

(check-sat tp_is_empty!673 (not b!13606) (not start!2022) (not b!13601) (not b!13602) (not b!13605) (not b!13607))
(check-sat)
