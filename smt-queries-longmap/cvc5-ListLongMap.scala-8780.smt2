; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106768 () Bool)

(assert start!106768)

(declare-fun b!1267307 () Bool)

(declare-fun res!843590 () Bool)

(declare-fun e!721940 () Bool)

(assert (=> b!1267307 (=> (not res!843590) (not e!721940))))

(declare-datatypes ((B!2072 0))(
  ( (B!2073 (val!16371 Int)) )
))
(declare-datatypes ((tuple2!21260 0))(
  ( (tuple2!21261 (_1!10641 (_ BitVec 64)) (_2!10641 B!2072)) )
))
(declare-datatypes ((List!28363 0))(
  ( (Nil!28360) (Cons!28359 (h!29568 tuple2!21260) (t!41890 List!28363)) )
))
(declare-fun l!874 () List!28363)

(assert (=> b!1267307 (= res!843590 (is-Cons!28359 l!874))))

(declare-fun res!843591 () Bool)

(assert (=> start!106768 (=> (not res!843591) (not e!721940))))

(declare-fun isStrictlySorted!820 (List!28363) Bool)

(assert (=> start!106768 (= res!843591 (isStrictlySorted!820 l!874))))

(assert (=> start!106768 e!721940))

(declare-fun e!721939 () Bool)

(assert (=> start!106768 e!721939))

(assert (=> start!106768 true))

(declare-fun b!1267308 () Bool)

(assert (=> b!1267308 (= e!721940 (not (isStrictlySorted!820 (t!41890 l!874))))))

(declare-fun b!1267306 () Bool)

(declare-fun res!843592 () Bool)

(assert (=> b!1267306 (=> (not res!843592) (not e!721940))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!679 (List!28363 (_ BitVec 64)) Bool)

(assert (=> b!1267306 (= res!843592 (not (containsKey!679 l!874 key!235)))))

(declare-fun b!1267309 () Bool)

(declare-fun tp_is_empty!32593 () Bool)

(declare-fun tp!96587 () Bool)

(assert (=> b!1267309 (= e!721939 (and tp_is_empty!32593 tp!96587))))

(assert (= (and start!106768 res!843591) b!1267306))

(assert (= (and b!1267306 res!843592) b!1267307))

(assert (= (and b!1267307 res!843590) b!1267308))

(assert (= (and start!106768 (is-Cons!28359 l!874)) b!1267309))

(declare-fun m!1166691 () Bool)

(assert (=> start!106768 m!1166691))

(declare-fun m!1166693 () Bool)

(assert (=> b!1267308 m!1166693))

(declare-fun m!1166695 () Bool)

(assert (=> b!1267306 m!1166695))

(push 1)

(assert tp_is_empty!32593)

(assert (not start!106768))

(assert (not b!1267306))

(assert (not b!1267308))

(assert (not b!1267309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139441 () Bool)

(declare-fun res!843619 () Bool)

(declare-fun e!721961 () Bool)

(assert (=> d!139441 (=> res!843619 e!721961)))

(assert (=> d!139441 (= res!843619 (and (is-Cons!28359 l!874) (= (_1!10641 (h!29568 l!874)) key!235)))))

(assert (=> d!139441 (= (containsKey!679 l!874 key!235) e!721961)))

(declare-fun b!1267342 () Bool)

(declare-fun e!721962 () Bool)

(assert (=> b!1267342 (= e!721961 e!721962)))

(declare-fun res!843620 () Bool)

(assert (=> b!1267342 (=> (not res!843620) (not e!721962))))

(assert (=> b!1267342 (= res!843620 (and (or (not (is-Cons!28359 l!874)) (bvsle (_1!10641 (h!29568 l!874)) key!235)) (is-Cons!28359 l!874) (bvslt (_1!10641 (h!29568 l!874)) key!235)))))

(declare-fun b!1267343 () Bool)

(assert (=> b!1267343 (= e!721962 (containsKey!679 (t!41890 l!874) key!235))))

(assert (= (and d!139441 (not res!843619)) b!1267342))

(assert (= (and b!1267342 res!843620) b!1267343))

(declare-fun m!1166709 () Bool)

(assert (=> b!1267343 m!1166709))

(assert (=> b!1267306 d!139441))

(declare-fun d!139447 () Bool)

(declare-fun res!843631 () Bool)

(declare-fun e!721973 () Bool)

(assert (=> d!139447 (=> res!843631 e!721973)))

(assert (=> d!139447 (= res!843631 (or (is-Nil!28360 (t!41890 l!874)) (is-Nil!28360 (t!41890 (t!41890 l!874)))))))

(assert (=> d!139447 (= (isStrictlySorted!820 (t!41890 l!874)) e!721973)))

(declare-fun b!1267354 () Bool)

(declare-fun e!721974 () Bool)

(assert (=> b!1267354 (= e!721973 e!721974)))

(declare-fun res!843632 () Bool)

(assert (=> b!1267354 (=> (not res!843632) (not e!721974))))

(assert (=> b!1267354 (= res!843632 (bvslt (_1!10641 (h!29568 (t!41890 l!874))) (_1!10641 (h!29568 (t!41890 (t!41890 l!874))))))))

(declare-fun b!1267355 () Bool)

(assert (=> b!1267355 (= e!721974 (isStrictlySorted!820 (t!41890 (t!41890 l!874))))))

(assert (= (and d!139447 (not res!843631)) b!1267354))

(assert (= (and b!1267354 res!843632) b!1267355))

(declare-fun m!1166713 () Bool)

(assert (=> b!1267355 m!1166713))

(assert (=> b!1267308 d!139447))

(declare-fun d!139451 () Bool)

(declare-fun res!843637 () Bool)

(declare-fun e!721979 () Bool)

(assert (=> d!139451 (=> res!843637 e!721979)))

(assert (=> d!139451 (= res!843637 (or (is-Nil!28360 l!874) (is-Nil!28360 (t!41890 l!874))))))

(assert (=> d!139451 (= (isStrictlySorted!820 l!874) e!721979)))

(declare-fun b!1267358 () Bool)

(declare-fun e!721980 () Bool)

(assert (=> b!1267358 (= e!721979 e!721980)))

(declare-fun res!843638 () Bool)

(assert (=> b!1267358 (=> (not res!843638) (not e!721980))))

(assert (=> b!1267358 (= res!843638 (bvslt (_1!10641 (h!29568 l!874)) (_1!10641 (h!29568 (t!41890 l!874)))))))

(declare-fun b!1267359 () Bool)

(assert (=> b!1267359 (= e!721980 (isStrictlySorted!820 (t!41890 l!874)))))

(assert (= (and d!139451 (not res!843637)) b!1267358))

(assert (= (and b!1267358 res!843638) b!1267359))

(assert (=> b!1267359 m!1166693))

(assert (=> start!106768 d!139451))

(declare-fun b!1267374 () Bool)

(declare-fun e!721989 () Bool)

(declare-fun tp!96598 () Bool)

(assert (=> b!1267374 (= e!721989 (and tp_is_empty!32593 tp!96598))))

(assert (=> b!1267309 (= tp!96587 e!721989)))

(assert (= (and b!1267309 (is-Cons!28359 (t!41890 l!874))) b!1267374))

(push 1)

(assert (not b!1267359))

(assert tp_is_empty!32593)

(assert (not b!1267343))

(assert (not b!1267355))

(assert (not b!1267374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

