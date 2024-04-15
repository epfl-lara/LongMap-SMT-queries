; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137086 () Bool)

(assert start!137086)

(declare-fun b!1579857 () Bool)

(declare-fun e!881334 () Bool)

(assert (=> b!1579857 (= e!881334 false)))

(declare-fun lt!676419 () Bool)

(declare-datatypes ((B!2636 0))(
  ( (B!2637 (val!19680 Int)) )
))
(declare-datatypes ((tuple2!25542 0))(
  ( (tuple2!25543 (_1!12782 (_ BitVec 64)) (_2!12782 B!2636)) )
))
(declare-datatypes ((List!36841 0))(
  ( (Nil!36838) (Cons!36837 (h!38381 tuple2!25542) (t!51747 List!36841)) )
))
(declare-fun l!1390 () List!36841)

(declare-fun lt!676418 () tuple2!25542)

(declare-fun contains!10427 (List!36841 tuple2!25542) Bool)

(assert (=> b!1579857 (= lt!676419 (contains!10427 (t!51747 l!1390) lt!676418))))

(declare-fun b!1579858 () Bool)

(declare-fun e!881333 () Bool)

(assert (=> b!1579858 (= e!881333 e!881334)))

(declare-fun res!1079340 () Bool)

(assert (=> b!1579858 (=> (not res!1079340) (not e!881334))))

(declare-fun e!881336 () Bool)

(assert (=> b!1579858 (= res!1079340 e!881336)))

(declare-fun res!1079339 () Bool)

(assert (=> b!1579858 (=> res!1079339 e!881336)))

(declare-datatypes ((tuple2!25544 0))(
  ( (tuple2!25545 (_1!12783 tuple2!25542) (_2!12783 List!36841)) )
))
(declare-datatypes ((Option!895 0))(
  ( (Some!894 (v!22386 tuple2!25544)) (None!893) )
))
(declare-fun lt!676417 () Option!895)

(declare-fun isEmpty!1164 (Option!895) Bool)

(assert (=> b!1579858 (= res!1079339 (isEmpty!1164 lt!676417))))

(declare-fun unapply!76 (List!36841) Option!895)

(assert (=> b!1579858 (= lt!676417 (unapply!76 l!1390))))

(declare-fun b!1579860 () Bool)

(get-info :version)

(declare-fun get!26774 (Option!895) tuple2!25544)

(assert (=> b!1579860 (= e!881336 (not ((_ is Nil!36838) (_2!12783 (get!26774 lt!676417)))))))

(declare-fun b!1579861 () Bool)

(declare-fun res!1079341 () Bool)

(assert (=> b!1579861 (=> (not res!1079341) (not e!881334))))

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1579861 (= res!1079341 (and (or (not ((_ is Cons!36837) l!1390)) (not (= (_1!12782 (h!38381 l!1390)) key!405))) ((_ is Cons!36837) l!1390)))))

(declare-fun b!1579862 () Bool)

(declare-fun e!881332 () Bool)

(declare-fun tp_is_empty!39181 () Bool)

(declare-fun tp!114433 () Bool)

(assert (=> b!1579862 (= e!881332 (and tp_is_empty!39181 tp!114433))))

(declare-fun b!1579863 () Bool)

(declare-fun res!1079343 () Bool)

(assert (=> b!1579863 (=> (not res!1079343) (not e!881334))))

(declare-fun isStrictlySorted!1056 (List!36841) Bool)

(assert (=> b!1579863 (= res!1079343 (isStrictlySorted!1056 (t!51747 l!1390)))))

(declare-fun b!1579864 () Bool)

(declare-fun res!1079342 () Bool)

(assert (=> b!1579864 (=> (not res!1079342) (not e!881334))))

(declare-fun containsKey!902 (List!36841 (_ BitVec 64)) Bool)

(assert (=> b!1579864 (= res!1079342 (containsKey!902 (t!51747 l!1390) key!405))))

(declare-fun b!1579865 () Bool)

(declare-fun res!1079338 () Bool)

(declare-fun e!881335 () Bool)

(assert (=> b!1579865 (=> (not res!1079338) (not e!881335))))

(assert (=> b!1579865 (= res!1079338 (containsKey!902 l!1390 key!405))))

(declare-fun res!1079337 () Bool)

(assert (=> start!137086 (=> (not res!1079337) (not e!881335))))

(assert (=> start!137086 (= res!1079337 (isStrictlySorted!1056 l!1390))))

(assert (=> start!137086 e!881335))

(assert (=> start!137086 e!881332))

(assert (=> start!137086 true))

(assert (=> start!137086 tp_is_empty!39181))

(declare-fun b!1579859 () Bool)

(assert (=> b!1579859 (= e!881335 e!881333)))

(declare-fun res!1079336 () Bool)

(assert (=> b!1579859 (=> (not res!1079336) (not e!881333))))

(assert (=> b!1579859 (= res!1079336 (contains!10427 l!1390 lt!676418))))

(declare-fun value!194 () B!2636)

(assert (=> b!1579859 (= lt!676418 (tuple2!25543 key!405 value!194))))

(assert (= (and start!137086 res!1079337) b!1579865))

(assert (= (and b!1579865 res!1079338) b!1579859))

(assert (= (and b!1579859 res!1079336) b!1579858))

(assert (= (and b!1579858 (not res!1079339)) b!1579860))

(assert (= (and b!1579858 res!1079340) b!1579861))

(assert (= (and b!1579861 res!1079341) b!1579863))

(assert (= (and b!1579863 res!1079343) b!1579864))

(assert (= (and b!1579864 res!1079342) b!1579857))

(assert (= (and start!137086 ((_ is Cons!36837) l!1390)) b!1579862))

(declare-fun m!1450797 () Bool)

(assert (=> b!1579865 m!1450797))

(declare-fun m!1450799 () Bool)

(assert (=> start!137086 m!1450799))

(declare-fun m!1450801 () Bool)

(assert (=> b!1579858 m!1450801))

(declare-fun m!1450803 () Bool)

(assert (=> b!1579858 m!1450803))

(declare-fun m!1450805 () Bool)

(assert (=> b!1579857 m!1450805))

(declare-fun m!1450807 () Bool)

(assert (=> b!1579860 m!1450807))

(declare-fun m!1450809 () Bool)

(assert (=> b!1579863 m!1450809))

(declare-fun m!1450811 () Bool)

(assert (=> b!1579859 m!1450811))

(declare-fun m!1450813 () Bool)

(assert (=> b!1579864 m!1450813))

(check-sat (not b!1579860) (not start!137086) (not b!1579858) (not b!1579862) (not b!1579857) tp_is_empty!39181 (not b!1579863) (not b!1579865) (not b!1579864) (not b!1579859))
(check-sat)
