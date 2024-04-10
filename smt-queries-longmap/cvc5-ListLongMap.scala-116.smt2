; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2022 () Bool)

(assert start!2022)

(declare-fun b!13605 () Bool)

(assert (=> b!13605 true))

(declare-fun res!10681 () Bool)

(declare-fun e!8155 () Bool)

(assert (=> start!2022 (=> (not res!10681) (not e!8155))))

(declare-datatypes ((B!494 0))(
  ( (B!495 (val!345 Int)) )
))
(declare-datatypes ((tuple2!490 0))(
  ( (tuple2!491 (_1!245 (_ BitVec 64)) (_2!245 B!494)) )
))
(declare-datatypes ((List!400 0))(
  ( (Nil!397) (Cons!396 (h!962 tuple2!490) (t!2796 List!400)) )
))
(declare-fun l!522 () List!400)

(declare-fun isStrictlySorted!87 (List!400) Bool)

(assert (=> start!2022 (= res!10681 (isStrictlySorted!87 l!522))))

(assert (=> start!2022 e!8155))

(declare-fun e!8156 () Bool)

(assert (=> start!2022 e!8156))

(declare-fun tp_is_empty!673 () Bool)

(assert (=> start!2022 tp_is_empty!673))

(declare-fun b!13601 () Bool)

(declare-fun res!10683 () Bool)

(assert (=> b!13601 (=> (not res!10683) (not e!8155))))

(declare-fun value!159 () B!494)

(assert (=> b!13601 (= res!10683 (and (not (= (_2!245 (h!962 l!522)) value!159)) (is-Cons!396 l!522)))))

(declare-fun b!13602 () Bool)

(declare-fun res!10680 () Bool)

(declare-fun e!8154 () Bool)

(assert (=> b!13602 (=> (not res!10680) (not e!8154))))

(declare-fun lt!3528 () List!400)

(declare-fun isEmpty!84 (List!400) Bool)

(assert (=> b!13602 (= res!10680 (not (isEmpty!84 lt!3528)))))

(declare-fun b!13603 () Bool)

(assert (=> b!13603 (= e!8154 (= l!522 Nil!397))))

(declare-fun b!13604 () Bool)

(declare-fun res!10682 () Bool)

(assert (=> b!13604 (=> (not res!10682) (not e!8154))))

(assert (=> b!13604 (= res!10682 (not (isEmpty!84 l!522)))))

(declare-fun res!10679 () Bool)

(assert (=> b!13605 (=> (not res!10679) (not e!8154))))

(declare-fun lambda!89 () Int)

(declare-fun forall!77 (List!400 Int) Bool)

(assert (=> b!13605 (= res!10679 (forall!77 lt!3528 lambda!89))))

(declare-fun b!13606 () Bool)

(declare-fun tp!2204 () Bool)

(assert (=> b!13606 (= e!8156 (and tp_is_empty!673 tp!2204))))

(declare-fun b!13607 () Bool)

(assert (=> b!13607 (= e!8155 e!8154)))

(declare-fun res!10684 () Bool)

(assert (=> b!13607 (=> (not res!10684) (not e!8154))))

(assert (=> b!13607 (= res!10684 (isStrictlySorted!87 lt!3528))))

(declare-fun filterByValue!10 (List!400 B!494) List!400)

(assert (=> b!13607 (= lt!3528 (filterByValue!10 (t!2796 l!522) value!159))))

(assert (= (and start!2022 res!10681) b!13601))

(assert (= (and b!13601 res!10683) b!13607))

(assert (= (and b!13607 res!10684) b!13605))

(assert (= (and b!13605 res!10679) b!13604))

(assert (= (and b!13604 res!10682) b!13602))

(assert (= (and b!13602 res!10680) b!13603))

(assert (= (and start!2022 (is-Cons!396 l!522)) b!13606))

(declare-fun m!9209 () Bool)

(assert (=> start!2022 m!9209))

(declare-fun m!9211 () Bool)

(assert (=> b!13605 m!9211))

(declare-fun m!9213 () Bool)

(assert (=> b!13602 m!9213))

(declare-fun m!9215 () Bool)

(assert (=> b!13604 m!9215))

(declare-fun m!9217 () Bool)

(assert (=> b!13607 m!9217))

(declare-fun m!9219 () Bool)

(assert (=> b!13607 m!9219))

(push 1)

