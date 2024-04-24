; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137552 () Bool)

(assert start!137552)

(declare-fun b!1582579 () Bool)

(declare-fun e!883031 () Bool)

(declare-datatypes ((B!2630 0))(
  ( (B!2631 (val!19677 Int)) )
))
(declare-datatypes ((tuple2!25522 0))(
  ( (tuple2!25523 (_1!12772 (_ BitVec 64)) (_2!12772 B!2630)) )
))
(declare-datatypes ((List!36829 0))(
  ( (Nil!36826) (Cons!36825 (h!38386 tuple2!25522) (t!51735 List!36829)) )
))
(declare-datatypes ((tuple2!25524 0))(
  ( (tuple2!25525 (_1!12773 tuple2!25522) (_2!12773 List!36829)) )
))
(declare-datatypes ((Option!885 0))(
  ( (Some!884 (v!22379 tuple2!25524)) (None!883) )
))
(declare-fun lt!677582 () Option!885)

(get-info :version)

(declare-fun get!26816 (Option!885) tuple2!25524)

(assert (=> b!1582579 (= e!883031 (not ((_ is Nil!36826) (_2!12773 (get!26816 lt!677582)))))))

(declare-fun b!1582580 () Bool)

(declare-fun res!1080312 () Bool)

(declare-fun e!883030 () Bool)

(assert (=> b!1582580 (=> (not res!1080312) (not e!883030))))

(declare-fun l!1390 () List!36829)

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1582580 (= res!1080312 (and ((_ is Cons!36825) l!1390) (= (_1!12772 (h!38386 l!1390)) key!405)))))

(declare-fun b!1582581 () Bool)

(assert (=> b!1582581 (= e!883030 (not true))))

(declare-fun lt!677583 () tuple2!25522)

(declare-fun contains!10514 (List!36829 tuple2!25522) Bool)

(assert (=> b!1582581 (not (contains!10514 (t!51735 l!1390) lt!677583))))

(declare-datatypes ((Unit!52141 0))(
  ( (Unit!52142) )
))
(declare-fun lt!677581 () Unit!52141)

(declare-fun value!194 () B!2630)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!1 (List!36829 (_ BitVec 64) B!2630) Unit!52141)

(assert (=> b!1582581 (= lt!677581 (lemmaNotContainsKeyThenNotContainsTuple!1 (t!51735 l!1390) key!405 value!194))))

(declare-fun b!1582582 () Bool)

(declare-fun e!883032 () Bool)

(declare-fun e!883034 () Bool)

(assert (=> b!1582582 (= e!883032 e!883034)))

(declare-fun res!1080314 () Bool)

(assert (=> b!1582582 (=> (not res!1080314) (not e!883034))))

(assert (=> b!1582582 (= res!1080314 (contains!10514 l!1390 lt!677583))))

(assert (=> b!1582582 (= lt!677583 (tuple2!25523 key!405 value!194))))

(declare-fun b!1582583 () Bool)

(assert (=> b!1582583 (= e!883034 e!883030)))

(declare-fun res!1080311 () Bool)

(assert (=> b!1582583 (=> (not res!1080311) (not e!883030))))

(assert (=> b!1582583 (= res!1080311 e!883031)))

(declare-fun res!1080308 () Bool)

(assert (=> b!1582583 (=> res!1080308 e!883031)))

(declare-fun isEmpty!1160 (Option!885) Bool)

(assert (=> b!1582583 (= res!1080308 (isEmpty!1160 lt!677582))))

(declare-fun unapply!73 (List!36829) Option!885)

(assert (=> b!1582583 (= lt!677582 (unapply!73 l!1390))))

(declare-fun res!1080309 () Bool)

(assert (=> start!137552 (=> (not res!1080309) (not e!883032))))

(declare-fun isStrictlySorted!1043 (List!36829) Bool)

(assert (=> start!137552 (= res!1080309 (isStrictlySorted!1043 l!1390))))

(assert (=> start!137552 e!883032))

(declare-fun e!883033 () Bool)

(assert (=> start!137552 e!883033))

(assert (=> start!137552 true))

(declare-fun tp_is_empty!39175 () Bool)

(assert (=> start!137552 tp_is_empty!39175))

(declare-fun b!1582584 () Bool)

(declare-fun res!1080313 () Bool)

(assert (=> b!1582584 (=> (not res!1080313) (not e!883030))))

(declare-fun containsKey!902 (List!36829 (_ BitVec 64)) Bool)

(assert (=> b!1582584 (= res!1080313 (not (containsKey!902 (t!51735 l!1390) key!405)))))

(declare-fun b!1582585 () Bool)

(declare-fun res!1080307 () Bool)

(assert (=> b!1582585 (=> (not res!1080307) (not e!883032))))

(assert (=> b!1582585 (= res!1080307 (containsKey!902 l!1390 key!405))))

(declare-fun b!1582586 () Bool)

(declare-fun tp!114423 () Bool)

(assert (=> b!1582586 (= e!883033 (and tp_is_empty!39175 tp!114423))))

(declare-fun b!1582587 () Bool)

(declare-fun res!1080310 () Bool)

(assert (=> b!1582587 (=> (not res!1080310) (not e!883030))))

(assert (=> b!1582587 (= res!1080310 (isStrictlySorted!1043 (t!51735 l!1390)))))

(assert (= (and start!137552 res!1080309) b!1582585))

(assert (= (and b!1582585 res!1080307) b!1582582))

(assert (= (and b!1582582 res!1080314) b!1582583))

(assert (= (and b!1582583 (not res!1080308)) b!1582579))

(assert (= (and b!1582583 res!1080311) b!1582580))

(assert (= (and b!1582580 res!1080312) b!1582587))

(assert (= (and b!1582587 res!1080310) b!1582584))

(assert (= (and b!1582584 res!1080313) b!1582581))

(assert (= (and start!137552 ((_ is Cons!36825) l!1390)) b!1582586))

(declare-fun m!1453929 () Bool)

(assert (=> b!1582585 m!1453929))

(declare-fun m!1453931 () Bool)

(assert (=> b!1582587 m!1453931))

(declare-fun m!1453933 () Bool)

(assert (=> b!1582583 m!1453933))

(declare-fun m!1453935 () Bool)

(assert (=> b!1582583 m!1453935))

(declare-fun m!1453937 () Bool)

(assert (=> start!137552 m!1453937))

(declare-fun m!1453939 () Bool)

(assert (=> b!1582581 m!1453939))

(declare-fun m!1453941 () Bool)

(assert (=> b!1582581 m!1453941))

(declare-fun m!1453943 () Bool)

(assert (=> b!1582584 m!1453943))

(declare-fun m!1453945 () Bool)

(assert (=> b!1582579 m!1453945))

(declare-fun m!1453947 () Bool)

(assert (=> b!1582582 m!1453947))

(check-sat (not b!1582585) (not b!1582582) (not b!1582586) (not b!1582579) (not b!1582587) (not b!1582584) (not b!1582581) (not start!137552) tp_is_empty!39175 (not b!1582583))
(check-sat)
