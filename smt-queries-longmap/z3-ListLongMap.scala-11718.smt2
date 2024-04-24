; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137558 () Bool)

(assert start!137558)

(declare-fun res!1080384 () Bool)

(declare-fun e!883075 () Bool)

(assert (=> start!137558 (=> (not res!1080384) (not e!883075))))

(declare-datatypes ((B!2636 0))(
  ( (B!2637 (val!19680 Int)) )
))
(declare-datatypes ((tuple2!25534 0))(
  ( (tuple2!25535 (_1!12778 (_ BitVec 64)) (_2!12778 B!2636)) )
))
(declare-datatypes ((List!36832 0))(
  ( (Nil!36829) (Cons!36828 (h!38389 tuple2!25534) (t!51738 List!36832)) )
))
(declare-fun l!1390 () List!36832)

(declare-fun isStrictlySorted!1046 (List!36832) Bool)

(assert (=> start!137558 (= res!1080384 (isStrictlySorted!1046 l!1390))))

(assert (=> start!137558 e!883075))

(declare-fun e!883077 () Bool)

(assert (=> start!137558 e!883077))

(assert (=> start!137558 true))

(declare-fun tp_is_empty!39181 () Bool)

(assert (=> start!137558 tp_is_empty!39181))

(declare-fun b!1582660 () Bool)

(declare-fun e!883078 () Bool)

(assert (=> b!1582660 (= e!883078 false)))

(declare-fun lt!677608 () Bool)

(declare-fun lt!677609 () tuple2!25534)

(declare-fun contains!10517 (List!36832 tuple2!25534) Bool)

(assert (=> b!1582660 (= lt!677608 (contains!10517 (t!51738 l!1390) lt!677609))))

(declare-fun b!1582661 () Bool)

(declare-fun e!883079 () Bool)

(assert (=> b!1582661 (= e!883075 e!883079)))

(declare-fun res!1080379 () Bool)

(assert (=> b!1582661 (=> (not res!1080379) (not e!883079))))

(assert (=> b!1582661 (= res!1080379 (contains!10517 l!1390 lt!677609))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2636)

(assert (=> b!1582661 (= lt!677609 (tuple2!25535 key!405 value!194))))

(declare-fun b!1582662 () Bool)

(declare-fun e!883076 () Bool)

(declare-datatypes ((tuple2!25536 0))(
  ( (tuple2!25537 (_1!12779 tuple2!25534) (_2!12779 List!36832)) )
))
(declare-datatypes ((Option!888 0))(
  ( (Some!887 (v!22382 tuple2!25536)) (None!886) )
))
(declare-fun lt!677610 () Option!888)

(get-info :version)

(declare-fun get!26821 (Option!888) tuple2!25536)

(assert (=> b!1582662 (= e!883076 (not ((_ is Nil!36829) (_2!12779 (get!26821 lt!677610)))))))

(declare-fun b!1582663 () Bool)

(declare-fun tp!114432 () Bool)

(assert (=> b!1582663 (= e!883077 (and tp_is_empty!39181 tp!114432))))

(declare-fun b!1582664 () Bool)

(declare-fun res!1080385 () Bool)

(assert (=> b!1582664 (=> (not res!1080385) (not e!883075))))

(declare-fun containsKey!905 (List!36832 (_ BitVec 64)) Bool)

(assert (=> b!1582664 (= res!1080385 (containsKey!905 l!1390 key!405))))

(declare-fun b!1582665 () Bool)

(assert (=> b!1582665 (= e!883079 e!883078)))

(declare-fun res!1080386 () Bool)

(assert (=> b!1582665 (=> (not res!1080386) (not e!883078))))

(assert (=> b!1582665 (= res!1080386 e!883076)))

(declare-fun res!1080382 () Bool)

(assert (=> b!1582665 (=> res!1080382 e!883076)))

(declare-fun isEmpty!1163 (Option!888) Bool)

(assert (=> b!1582665 (= res!1080382 (isEmpty!1163 lt!677610))))

(declare-fun unapply!76 (List!36832) Option!888)

(assert (=> b!1582665 (= lt!677610 (unapply!76 l!1390))))

(declare-fun b!1582666 () Bool)

(declare-fun res!1080380 () Bool)

(assert (=> b!1582666 (=> (not res!1080380) (not e!883078))))

(assert (=> b!1582666 (= res!1080380 (isStrictlySorted!1046 (t!51738 l!1390)))))

(declare-fun b!1582667 () Bool)

(declare-fun res!1080383 () Bool)

(assert (=> b!1582667 (=> (not res!1080383) (not e!883078))))

(assert (=> b!1582667 (= res!1080383 (and (or (not ((_ is Cons!36828) l!1390)) (not (= (_1!12778 (h!38389 l!1390)) key!405))) ((_ is Cons!36828) l!1390)))))

(declare-fun b!1582668 () Bool)

(declare-fun res!1080381 () Bool)

(assert (=> b!1582668 (=> (not res!1080381) (not e!883078))))

(assert (=> b!1582668 (= res!1080381 (containsKey!905 (t!51738 l!1390) key!405))))

(assert (= (and start!137558 res!1080384) b!1582664))

(assert (= (and b!1582664 res!1080385) b!1582661))

(assert (= (and b!1582661 res!1080379) b!1582665))

(assert (= (and b!1582665 (not res!1080382)) b!1582662))

(assert (= (and b!1582665 res!1080386) b!1582667))

(assert (= (and b!1582667 res!1080383) b!1582666))

(assert (= (and b!1582666 res!1080380) b!1582668))

(assert (= (and b!1582668 res!1080381) b!1582660))

(assert (= (and start!137558 ((_ is Cons!36828) l!1390)) b!1582663))

(declare-fun m!1453989 () Bool)

(assert (=> b!1582666 m!1453989))

(declare-fun m!1453991 () Bool)

(assert (=> b!1582660 m!1453991))

(declare-fun m!1453993 () Bool)

(assert (=> b!1582661 m!1453993))

(declare-fun m!1453995 () Bool)

(assert (=> b!1582662 m!1453995))

(declare-fun m!1453997 () Bool)

(assert (=> b!1582668 m!1453997))

(declare-fun m!1453999 () Bool)

(assert (=> start!137558 m!1453999))

(declare-fun m!1454001 () Bool)

(assert (=> b!1582664 m!1454001))

(declare-fun m!1454003 () Bool)

(assert (=> b!1582665 m!1454003))

(declare-fun m!1454005 () Bool)

(assert (=> b!1582665 m!1454005))

(check-sat (not b!1582663) (not b!1582662) tp_is_empty!39181 (not b!1582668) (not b!1582665) (not b!1582660) (not b!1582666) (not start!137558) (not b!1582664) (not b!1582661))
(check-sat)
