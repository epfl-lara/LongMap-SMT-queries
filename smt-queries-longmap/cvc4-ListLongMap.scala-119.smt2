; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2044 () Bool)

(assert start!2044)

(declare-fun b!13831 () Bool)

(assert (=> b!13831 true))

(declare-fun b!13826 () Bool)

(declare-fun e!8244 () Bool)

(declare-datatypes ((B!516 0))(
  ( (B!517 (val!356 Int)) )
))
(declare-datatypes ((tuple2!512 0))(
  ( (tuple2!513 (_1!256 (_ BitVec 64)) (_2!256 B!516)) )
))
(declare-datatypes ((List!411 0))(
  ( (Nil!408) (Cons!407 (h!973 tuple2!512) (t!2807 List!411)) )
))
(declare-fun lt!3543 () List!411)

(assert (=> b!13826 (= e!8244 (= lt!3543 Nil!408))))

(declare-fun b!13827 () Bool)

(declare-fun res!10845 () Bool)

(declare-fun e!8245 () Bool)

(assert (=> b!13827 (=> (not res!10845) (not e!8245))))

(declare-fun l!522 () List!411)

(declare-fun value!159 () B!516)

(assert (=> b!13827 (= res!10845 (and (or (not (is-Cons!407 l!522)) (not (= (_2!256 (h!973 l!522)) value!159))) (or (not (is-Cons!407 l!522)) (= (_2!256 (h!973 l!522)) value!159)) (not (is-Nil!408 l!522))))))

(declare-fun res!10842 () Bool)

(assert (=> start!2044 (=> (not res!10842) (not e!8245))))

(declare-fun isStrictlySorted!98 (List!411) Bool)

(assert (=> start!2044 (= res!10842 (isStrictlySorted!98 l!522))))

(assert (=> start!2044 e!8245))

(declare-fun e!8246 () Bool)

(assert (=> start!2044 e!8246))

(declare-fun tp_is_empty!695 () Bool)

(assert (=> start!2044 tp_is_empty!695))

(declare-fun b!13828 () Bool)

(declare-fun tp!2246 () Bool)

(assert (=> b!13828 (= e!8246 (and tp_is_empty!695 tp!2246))))

(declare-fun b!13829 () Bool)

(assert (=> b!13829 (= e!8245 e!8244)))

(declare-fun res!10841 () Bool)

(assert (=> b!13829 (=> (not res!10841) (not e!8244))))

(assert (=> b!13829 (= res!10841 (isStrictlySorted!98 lt!3543))))

(declare-fun err!11 () List!411)

(assert (=> b!13829 (= lt!3543 err!11)))

(assert (=> b!13829 true))

(declare-fun e!8243 () Bool)

(assert (=> b!13829 e!8243))

(declare-fun b!13830 () Bool)

(declare-fun res!10846 () Bool)

(assert (=> b!13830 (=> (not res!10846) (not e!8244))))

(declare-fun isEmpty!95 (List!411) Bool)

(assert (=> b!13830 (= res!10846 (not (isEmpty!95 lt!3543)))))

(declare-fun res!10844 () Bool)

(assert (=> b!13831 (=> (not res!10844) (not e!8244))))

(declare-fun lambda!122 () Int)

(declare-fun forall!88 (List!411 Int) Bool)

(assert (=> b!13831 (= res!10844 (forall!88 lt!3543 lambda!122))))

(declare-fun b!13832 () Bool)

(declare-fun res!10843 () Bool)

(assert (=> b!13832 (=> (not res!10843) (not e!8244))))

(assert (=> b!13832 (= res!10843 (not (isEmpty!95 l!522)))))

(declare-fun b!13833 () Bool)

(declare-fun tp!2245 () Bool)

(assert (=> b!13833 (= e!8243 (and tp_is_empty!695 tp!2245))))

(assert (= (and start!2044 res!10842) b!13827))

(assert (= (and b!13827 res!10845) b!13829))

(assert (= (and b!13829 (is-Cons!407 err!11)) b!13833))

(assert (= (and b!13829 res!10841) b!13831))

(assert (= (and b!13831 res!10844) b!13832))

(assert (= (and b!13832 res!10843) b!13830))

(assert (= (and b!13830 res!10846) b!13826))

(assert (= (and start!2044 (is-Cons!407 l!522)) b!13828))

(declare-fun m!9301 () Bool)

(assert (=> b!13832 m!9301))

(declare-fun m!9303 () Bool)

(assert (=> start!2044 m!9303))

(declare-fun m!9305 () Bool)

(assert (=> b!13831 m!9305))

(declare-fun m!9307 () Bool)

(assert (=> b!13830 m!9307))

(declare-fun m!9309 () Bool)

(assert (=> b!13829 m!9309))

(push 1)

