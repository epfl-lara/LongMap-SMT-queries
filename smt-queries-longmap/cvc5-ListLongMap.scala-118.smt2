; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2034 () Bool)

(assert start!2034)

(declare-fun b!13717 () Bool)

(assert (=> b!13717 true))

(declare-fun res!10766 () Bool)

(declare-fun e!8197 () Bool)

(assert (=> b!13717 (=> (not res!10766) (not e!8197))))

(declare-fun lambda!107 () Int)

(declare-datatypes ((B!506 0))(
  ( (B!507 (val!351 Int)) )
))
(declare-datatypes ((tuple2!502 0))(
  ( (tuple2!503 (_1!251 (_ BitVec 64)) (_2!251 B!506)) )
))
(declare-datatypes ((List!406 0))(
  ( (Nil!403) (Cons!402 (h!968 tuple2!502) (t!2802 List!406)) )
))
(declare-fun forall!83 (List!406 Int) Bool)

(assert (=> b!13717 (= res!10766 (forall!83 Nil!403 lambda!107))))

(declare-fun b!13718 () Bool)

(assert (=> b!13718 (= e!8197 false)))

(declare-fun res!10767 () Bool)

(assert (=> start!2034 (=> (not res!10767) (not e!8197))))

(declare-fun l!522 () List!406)

(declare-fun isStrictlySorted!93 (List!406) Bool)

(assert (=> start!2034 (= res!10767 (isStrictlySorted!93 l!522))))

(assert (=> start!2034 e!8197))

(declare-fun e!8198 () Bool)

(assert (=> start!2034 e!8198))

(declare-fun tp_is_empty!685 () Bool)

(assert (=> start!2034 tp_is_empty!685))

(declare-fun b!13719 () Bool)

(declare-fun res!10765 () Bool)

(assert (=> b!13719 (=> (not res!10765) (not e!8197))))

(declare-fun isEmpty!90 (List!406) Bool)

(assert (=> b!13719 (= res!10765 (not (isEmpty!90 l!522)))))

(declare-fun b!13720 () Bool)

(declare-fun tp!2222 () Bool)

(assert (=> b!13720 (= e!8198 (and tp_is_empty!685 tp!2222))))

(declare-fun b!13721 () Bool)

(declare-fun res!10768 () Bool)

(assert (=> b!13721 (=> (not res!10768) (not e!8197))))

(declare-fun value!159 () B!506)

(assert (=> b!13721 (= res!10768 (and (or (not (is-Cons!402 l!522)) (not (= (_2!251 (h!968 l!522)) value!159))) (or (not (is-Cons!402 l!522)) (= (_2!251 (h!968 l!522)) value!159)) (is-Nil!403 l!522)))))

(assert (= (and start!2034 res!10767) b!13721))

(assert (= (and b!13721 res!10768) b!13717))

(assert (= (and b!13717 res!10766) b!13719))

(assert (= (and b!13719 res!10765) b!13718))

(assert (= (and start!2034 (is-Cons!402 l!522)) b!13720))

(declare-fun m!9263 () Bool)

(assert (=> b!13717 m!9263))

(declare-fun m!9265 () Bool)

(assert (=> start!2034 m!9265))

(declare-fun m!9267 () Bool)

(assert (=> b!13719 m!9267))

(push 1)

(assert (not b!13720))

(assert (not b!13719))

(assert tp_is_empty!685)

(assert (not start!2034))

(assert (not b!13717))

(check-sat)

(pop 1)

