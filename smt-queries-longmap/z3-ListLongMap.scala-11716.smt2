; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137122 () Bool)

(assert start!137122)

(declare-fun b!1580197 () Bool)

(declare-fun e!881546 () Bool)

(declare-datatypes ((B!2638 0))(
  ( (B!2639 (val!19681 Int)) )
))
(declare-datatypes ((tuple2!25478 0))(
  ( (tuple2!25479 (_1!12750 (_ BitVec 64)) (_2!12750 B!2638)) )
))
(declare-datatypes ((List!36801 0))(
  ( (Nil!36798) (Cons!36797 (h!38340 tuple2!25478) (t!51715 List!36801)) )
))
(declare-datatypes ((tuple2!25480 0))(
  ( (tuple2!25481 (_1!12751 tuple2!25478) (_2!12751 List!36801)) )
))
(declare-datatypes ((Option!894 0))(
  ( (Some!893 (v!22391 tuple2!25480)) (None!892) )
))
(declare-fun lt!676711 () Option!894)

(get-info :version)

(declare-fun get!26778 (Option!894) tuple2!25480)

(assert (=> b!1580197 (= e!881546 (not ((_ is Nil!36798) (_2!12751 (get!26778 lt!676711)))))))

(declare-fun res!1079492 () Bool)

(declare-fun e!881547 () Bool)

(assert (=> start!137122 (=> (not res!1079492) (not e!881547))))

(declare-fun l!1390 () List!36801)

(declare-fun isStrictlySorted!1059 (List!36801) Bool)

(assert (=> start!137122 (= res!1079492 (isStrictlySorted!1059 l!1390))))

(assert (=> start!137122 e!881547))

(declare-fun e!881549 () Bool)

(assert (=> start!137122 e!881549))

(assert (=> start!137122 true))

(declare-fun tp_is_empty!39183 () Bool)

(assert (=> start!137122 tp_is_empty!39183))

(declare-fun b!1580198 () Bool)

(declare-fun e!881545 () Bool)

(assert (=> b!1580198 (= e!881547 e!881545)))

(declare-fun res!1079493 () Bool)

(assert (=> b!1580198 (=> (not res!1079493) (not e!881545))))

(declare-fun lt!676709 () tuple2!25478)

(declare-fun contains!10473 (List!36801 tuple2!25478) Bool)

(assert (=> b!1580198 (= res!1079493 (contains!10473 l!1390 lt!676709))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2638)

(assert (=> b!1580198 (= lt!676709 (tuple2!25479 key!405 value!194))))

(declare-fun b!1580199 () Bool)

(declare-fun res!1079495 () Bool)

(declare-fun e!881548 () Bool)

(assert (=> b!1580199 (=> (not res!1079495) (not e!881548))))

(assert (=> b!1580199 (= res!1079495 (and (or (not ((_ is Cons!36797) l!1390)) (not (= (_1!12750 (h!38340 l!1390)) key!405))) ((_ is Cons!36797) l!1390)))))

(declare-fun b!1580200 () Bool)

(declare-fun res!1079490 () Bool)

(assert (=> b!1580200 (=> (not res!1079490) (not e!881548))))

(assert (=> b!1580200 (= res!1079490 (isStrictlySorted!1059 (t!51715 l!1390)))))

(declare-fun b!1580201 () Bool)

(declare-fun res!1079494 () Bool)

(assert (=> b!1580201 (=> (not res!1079494) (not e!881547))))

(declare-fun containsKey!905 (List!36801 (_ BitVec 64)) Bool)

(assert (=> b!1580201 (= res!1079494 (containsKey!905 l!1390 key!405))))

(declare-fun b!1580202 () Bool)

(declare-fun res!1079489 () Bool)

(assert (=> b!1580202 (=> (not res!1079489) (not e!881548))))

(assert (=> b!1580202 (= res!1079489 (containsKey!905 (t!51715 l!1390) key!405))))

(declare-fun b!1580203 () Bool)

(assert (=> b!1580203 (= e!881548 false)))

(declare-fun lt!676710 () Bool)

(assert (=> b!1580203 (= lt!676710 (contains!10473 (t!51715 l!1390) lt!676709))))

(declare-fun b!1580204 () Bool)

(declare-fun tp!114435 () Bool)

(assert (=> b!1580204 (= e!881549 (and tp_is_empty!39183 tp!114435))))

(declare-fun b!1580205 () Bool)

(assert (=> b!1580205 (= e!881545 e!881548)))

(declare-fun res!1079491 () Bool)

(assert (=> b!1580205 (=> (not res!1079491) (not e!881548))))

(assert (=> b!1580205 (= res!1079491 e!881546)))

(declare-fun res!1079496 () Bool)

(assert (=> b!1580205 (=> res!1079496 e!881546)))

(declare-fun isEmpty!1161 (Option!894) Bool)

(assert (=> b!1580205 (= res!1079496 (isEmpty!1161 lt!676711))))

(declare-fun unapply!77 (List!36801) Option!894)

(assert (=> b!1580205 (= lt!676711 (unapply!77 l!1390))))

(assert (= (and start!137122 res!1079492) b!1580201))

(assert (= (and b!1580201 res!1079494) b!1580198))

(assert (= (and b!1580198 res!1079493) b!1580205))

(assert (= (and b!1580205 (not res!1079496)) b!1580197))

(assert (= (and b!1580205 res!1079491) b!1580199))

(assert (= (and b!1580199 res!1079495) b!1580200))

(assert (= (and b!1580200 res!1079490) b!1580202))

(assert (= (and b!1580202 res!1079489) b!1580203))

(assert (= (and start!137122 ((_ is Cons!36797) l!1390)) b!1580204))

(declare-fun m!1451695 () Bool)

(assert (=> b!1580198 m!1451695))

(declare-fun m!1451697 () Bool)

(assert (=> b!1580200 m!1451697))

(declare-fun m!1451699 () Bool)

(assert (=> b!1580205 m!1451699))

(declare-fun m!1451701 () Bool)

(assert (=> b!1580205 m!1451701))

(declare-fun m!1451703 () Bool)

(assert (=> b!1580201 m!1451703))

(declare-fun m!1451705 () Bool)

(assert (=> b!1580197 m!1451705))

(declare-fun m!1451707 () Bool)

(assert (=> start!137122 m!1451707))

(declare-fun m!1451709 () Bool)

(assert (=> b!1580203 m!1451709))

(declare-fun m!1451711 () Bool)

(assert (=> b!1580202 m!1451711))

(check-sat (not b!1580200) (not b!1580205) (not b!1580198) (not b!1580202) (not b!1580197) (not b!1580204) tp_is_empty!39183 (not b!1580203) (not b!1580201) (not start!137122))
(check-sat)
