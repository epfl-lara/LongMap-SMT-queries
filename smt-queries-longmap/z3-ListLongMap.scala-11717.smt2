; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137092 () Bool)

(assert start!137092)

(declare-fun b!1579940 () Bool)

(declare-fun e!881381 () Bool)

(declare-datatypes ((B!2642 0))(
  ( (B!2643 (val!19683 Int)) )
))
(declare-datatypes ((tuple2!25554 0))(
  ( (tuple2!25555 (_1!12788 (_ BitVec 64)) (_2!12788 B!2642)) )
))
(declare-datatypes ((List!36844 0))(
  ( (Nil!36841) (Cons!36840 (h!38384 tuple2!25554) (t!51750 List!36844)) )
))
(declare-datatypes ((tuple2!25556 0))(
  ( (tuple2!25557 (_1!12789 tuple2!25554) (_2!12789 List!36844)) )
))
(declare-datatypes ((Option!898 0))(
  ( (Some!897 (v!22389 tuple2!25556)) (None!896) )
))
(declare-fun lt!676445 () Option!898)

(get-info :version)

(declare-fun get!26779 (Option!898) tuple2!25556)

(assert (=> b!1579940 (= e!881381 (not ((_ is Nil!36841) (_2!12789 (get!26779 lt!676445)))))))

(declare-fun b!1579941 () Bool)

(declare-fun e!881379 () Bool)

(declare-fun e!881380 () Bool)

(assert (=> b!1579941 (= e!881379 e!881380)))

(declare-fun res!1079413 () Bool)

(assert (=> b!1579941 (=> (not res!1079413) (not e!881380))))

(declare-fun l!1390 () List!36844)

(declare-fun lt!676446 () tuple2!25554)

(declare-fun contains!10430 (List!36844 tuple2!25554) Bool)

(assert (=> b!1579941 (= res!1079413 (contains!10430 l!1390 lt!676446))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2642)

(assert (=> b!1579941 (= lt!676446 (tuple2!25555 key!405 value!194))))

(declare-fun b!1579942 () Bool)

(declare-fun e!881377 () Bool)

(assert (=> b!1579942 (= e!881377 (not true))))

(declare-datatypes ((Option!899 0))(
  ( (Some!898 (v!22390 B!2642)) (None!897) )
))
(declare-fun getValueByKey!814 (List!36844 (_ BitVec 64)) Option!899)

(assert (=> b!1579942 (= (getValueByKey!814 (t!51750 l!1390) key!405) (Some!898 value!194))))

(declare-datatypes ((Unit!52048 0))(
  ( (Unit!52049) )
))
(declare-fun lt!676444 () Unit!52048)

(declare-fun lemmaContainsTupThenGetReturnValue!398 (List!36844 (_ BitVec 64) B!2642) Unit!52048)

(assert (=> b!1579942 (= lt!676444 (lemmaContainsTupThenGetReturnValue!398 (t!51750 l!1390) key!405 value!194))))

(declare-fun b!1579943 () Bool)

(declare-fun res!1079412 () Bool)

(assert (=> b!1579943 (=> (not res!1079412) (not e!881377))))

(declare-fun containsKey!905 (List!36844 (_ BitVec 64)) Bool)

(assert (=> b!1579943 (= res!1079412 (containsKey!905 (t!51750 l!1390) key!405))))

(declare-fun res!1079411 () Bool)

(assert (=> start!137092 (=> (not res!1079411) (not e!881379))))

(declare-fun isStrictlySorted!1059 (List!36844) Bool)

(assert (=> start!137092 (= res!1079411 (isStrictlySorted!1059 l!1390))))

(assert (=> start!137092 e!881379))

(declare-fun e!881378 () Bool)

(assert (=> start!137092 e!881378))

(assert (=> start!137092 true))

(declare-fun tp_is_empty!39187 () Bool)

(assert (=> start!137092 tp_is_empty!39187))

(declare-fun b!1579944 () Bool)

(declare-fun res!1079415 () Bool)

(assert (=> b!1579944 (=> (not res!1079415) (not e!881377))))

(assert (=> b!1579944 (= res!1079415 (contains!10430 (t!51750 l!1390) lt!676446))))

(declare-fun b!1579945 () Bool)

(declare-fun res!1079418 () Bool)

(assert (=> b!1579945 (=> (not res!1079418) (not e!881377))))

(assert (=> b!1579945 (= res!1079418 (and (or (not ((_ is Cons!36840) l!1390)) (not (= (_1!12788 (h!38384 l!1390)) key!405))) ((_ is Cons!36840) l!1390)))))

(declare-fun b!1579946 () Bool)

(assert (=> b!1579946 (= e!881380 e!881377)))

(declare-fun res!1079410 () Bool)

(assert (=> b!1579946 (=> (not res!1079410) (not e!881377))))

(assert (=> b!1579946 (= res!1079410 e!881381)))

(declare-fun res!1079417 () Bool)

(assert (=> b!1579946 (=> res!1079417 e!881381)))

(declare-fun isEmpty!1167 (Option!898) Bool)

(assert (=> b!1579946 (= res!1079417 (isEmpty!1167 lt!676445))))

(declare-fun unapply!79 (List!36844) Option!898)

(assert (=> b!1579946 (= lt!676445 (unapply!79 l!1390))))

(declare-fun b!1579947 () Bool)

(declare-fun tp!114442 () Bool)

(assert (=> b!1579947 (= e!881378 (and tp_is_empty!39187 tp!114442))))

(declare-fun b!1579948 () Bool)

(declare-fun res!1079416 () Bool)

(assert (=> b!1579948 (=> (not res!1079416) (not e!881377))))

(assert (=> b!1579948 (= res!1079416 (isStrictlySorted!1059 (t!51750 l!1390)))))

(declare-fun b!1579949 () Bool)

(declare-fun res!1079414 () Bool)

(assert (=> b!1579949 (=> (not res!1079414) (not e!881379))))

(assert (=> b!1579949 (= res!1079414 (containsKey!905 l!1390 key!405))))

(assert (= (and start!137092 res!1079411) b!1579949))

(assert (= (and b!1579949 res!1079414) b!1579941))

(assert (= (and b!1579941 res!1079413) b!1579946))

(assert (= (and b!1579946 (not res!1079417)) b!1579940))

(assert (= (and b!1579946 res!1079410) b!1579945))

(assert (= (and b!1579945 res!1079418) b!1579948))

(assert (= (and b!1579948 res!1079416) b!1579943))

(assert (= (and b!1579943 res!1079412) b!1579944))

(assert (= (and b!1579944 res!1079415) b!1579942))

(assert (= (and start!137092 ((_ is Cons!36840) l!1390)) b!1579947))

(declare-fun m!1450851 () Bool)

(assert (=> b!1579943 m!1450851))

(declare-fun m!1450853 () Bool)

(assert (=> b!1579944 m!1450853))

(declare-fun m!1450855 () Bool)

(assert (=> b!1579940 m!1450855))

(declare-fun m!1450857 () Bool)

(assert (=> b!1579948 m!1450857))

(declare-fun m!1450859 () Bool)

(assert (=> b!1579941 m!1450859))

(declare-fun m!1450861 () Bool)

(assert (=> b!1579942 m!1450861))

(declare-fun m!1450863 () Bool)

(assert (=> b!1579942 m!1450863))

(declare-fun m!1450865 () Bool)

(assert (=> b!1579946 m!1450865))

(declare-fun m!1450867 () Bool)

(assert (=> b!1579946 m!1450867))

(declare-fun m!1450869 () Bool)

(assert (=> b!1579949 m!1450869))

(declare-fun m!1450871 () Bool)

(assert (=> start!137092 m!1450871))

(check-sat tp_is_empty!39187 (not b!1579941) (not b!1579943) (not b!1579944) (not b!1579948) (not start!137092) (not b!1579949) (not b!1579947) (not b!1579942) (not b!1579940) (not b!1579946))
(check-sat)
