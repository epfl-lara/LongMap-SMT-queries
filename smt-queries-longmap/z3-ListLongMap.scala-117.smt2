; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2030 () Bool)

(assert start!2030)

(declare-fun b!13687 () Bool)

(assert (=> b!13687 true))

(declare-fun b!13683 () Bool)

(declare-fun e!8185 () Bool)

(declare-fun tp_is_empty!681 () Bool)

(declare-fun tp!2216 () Bool)

(assert (=> b!13683 (= e!8185 (and tp_is_empty!681 tp!2216))))

(declare-fun res!10741 () Bool)

(declare-fun e!8186 () Bool)

(assert (=> start!2030 (=> (not res!10741) (not e!8186))))

(declare-datatypes ((B!502 0))(
  ( (B!503 (val!349 Int)) )
))
(declare-datatypes ((tuple2!498 0))(
  ( (tuple2!499 (_1!249 (_ BitVec 64)) (_2!249 B!502)) )
))
(declare-datatypes ((List!404 0))(
  ( (Nil!401) (Cons!400 (h!966 tuple2!498) (t!2800 List!404)) )
))
(declare-fun l!522 () List!404)

(declare-fun isStrictlySorted!91 (List!404) Bool)

(assert (=> start!2030 (= res!10741 (isStrictlySorted!91 l!522))))

(assert (=> start!2030 e!8186))

(assert (=> start!2030 e!8185))

(assert (=> start!2030 tp_is_empty!681))

(declare-fun b!13684 () Bool)

(declare-fun res!10742 () Bool)

(assert (=> b!13684 (=> (not res!10742) (not e!8186))))

(declare-fun value!159 () B!502)

(get-info :version)

(assert (=> b!13684 (= res!10742 (and (or (not ((_ is Cons!400) l!522)) (not (= (_2!249 (h!966 l!522)) value!159))) (or (not ((_ is Cons!400) l!522)) (= (_2!249 (h!966 l!522)) value!159)) ((_ is Nil!401) l!522)))))

(declare-fun b!13685 () Bool)

(assert (=> b!13685 (= e!8186 false)))

(declare-fun b!13686 () Bool)

(declare-fun res!10744 () Bool)

(assert (=> b!13686 (=> (not res!10744) (not e!8186))))

(declare-fun isEmpty!88 (List!404) Bool)

(assert (=> b!13686 (= res!10744 (not (isEmpty!88 l!522)))))

(declare-fun res!10743 () Bool)

(assert (=> b!13687 (=> (not res!10743) (not e!8186))))

(declare-fun lambda!101 () Int)

(declare-fun forall!81 (List!404 Int) Bool)

(assert (=> b!13687 (= res!10743 (forall!81 Nil!401 lambda!101))))

(assert (= (and start!2030 res!10741) b!13684))

(assert (= (and b!13684 res!10742) b!13687))

(assert (= (and b!13687 res!10743) b!13686))

(assert (= (and b!13686 res!10744) b!13685))

(assert (= (and start!2030 ((_ is Cons!400) l!522)) b!13683))

(declare-fun m!9251 () Bool)

(assert (=> start!2030 m!9251))

(declare-fun m!9253 () Bool)

(assert (=> b!13686 m!9253))

(declare-fun m!9255 () Bool)

(assert (=> b!13687 m!9255))

(check-sat (not start!2030) tp_is_empty!681 (not b!13687) (not b!13683) (not b!13686))
(check-sat)
