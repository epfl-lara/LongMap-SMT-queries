; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138816 () Bool)

(assert start!138816)

(declare-fun res!1084178 () Bool)

(declare-fun e!887260 () Bool)

(assert (=> start!138816 (=> (not res!1084178) (not e!887260))))

(declare-datatypes ((B!3020 0))(
  ( (B!3021 (val!19872 Int)) )
))
(declare-datatypes ((tuple2!25972 0))(
  ( (tuple2!25973 (_1!12997 (_ BitVec 64)) (_2!12997 B!3020)) )
))
(declare-datatypes ((List!37024 0))(
  ( (Nil!37021) (Cons!37020 (h!38581 tuple2!25972) (t!51947 List!37024)) )
))
(declare-fun l!636 () List!37024)

(declare-fun isStrictlySorted!1202 (List!37024) Bool)

(assert (=> start!138816 (= res!1084178 (isStrictlySorted!1202 l!636))))

(assert (=> start!138816 e!887260))

(declare-fun e!887261 () Bool)

(assert (=> start!138816 e!887261))

(assert (=> start!138816 true))

(declare-fun b!1588642 () Bool)

(declare-fun res!1084179 () Bool)

(assert (=> b!1588642 (=> (not res!1084179) (not e!887260))))

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1588642 (= res!1084179 (and (or (not ((_ is Cons!37020) l!636)) (not (= (_1!12997 (h!38581 l!636)) key!185))) (or (not ((_ is Cons!37020) l!636)) (bvsle (_1!12997 (h!38581 l!636)) key!185)) ((_ is Cons!37020) l!636) (bvslt (_1!12997 (h!38581 l!636)) key!185)))))

(declare-fun b!1588643 () Bool)

(assert (=> b!1588643 (= e!887260 (not (isStrictlySorted!1202 (t!51947 l!636))))))

(declare-fun b!1588644 () Bool)

(declare-fun tp_is_empty!39553 () Bool)

(declare-fun tp!115363 () Bool)

(assert (=> b!1588644 (= e!887261 (and tp_is_empty!39553 tp!115363))))

(assert (= (and start!138816 res!1084178) b!1588642))

(assert (= (and b!1588642 res!1084179) b!1588643))

(assert (= (and start!138816 ((_ is Cons!37020) l!636)) b!1588644))

(declare-fun m!1456989 () Bool)

(assert (=> start!138816 m!1456989))

(declare-fun m!1456991 () Bool)

(assert (=> b!1588643 m!1456991))

(check-sat (not b!1588643) (not start!138816) (not b!1588644) tp_is_empty!39553)
(check-sat)
(get-model)

(declare-fun d!168603 () Bool)

(declare-fun res!1084196 () Bool)

(declare-fun e!887278 () Bool)

(assert (=> d!168603 (=> res!1084196 e!887278)))

(assert (=> d!168603 (= res!1084196 (or ((_ is Nil!37021) (t!51947 l!636)) ((_ is Nil!37021) (t!51947 (t!51947 l!636)))))))

(assert (=> d!168603 (= (isStrictlySorted!1202 (t!51947 l!636)) e!887278)))

(declare-fun b!1588667 () Bool)

(declare-fun e!887279 () Bool)

(assert (=> b!1588667 (= e!887278 e!887279)))

(declare-fun res!1084197 () Bool)

(assert (=> b!1588667 (=> (not res!1084197) (not e!887279))))

(assert (=> b!1588667 (= res!1084197 (bvslt (_1!12997 (h!38581 (t!51947 l!636))) (_1!12997 (h!38581 (t!51947 (t!51947 l!636))))))))

(declare-fun b!1588668 () Bool)

(assert (=> b!1588668 (= e!887279 (isStrictlySorted!1202 (t!51947 (t!51947 l!636))))))

(assert (= (and d!168603 (not res!1084196)) b!1588667))

(assert (= (and b!1588667 res!1084197) b!1588668))

(declare-fun m!1457001 () Bool)

(assert (=> b!1588668 m!1457001))

(assert (=> b!1588643 d!168603))

(declare-fun d!168605 () Bool)

(declare-fun res!1084198 () Bool)

(declare-fun e!887280 () Bool)

(assert (=> d!168605 (=> res!1084198 e!887280)))

(assert (=> d!168605 (= res!1084198 (or ((_ is Nil!37021) l!636) ((_ is Nil!37021) (t!51947 l!636))))))

(assert (=> d!168605 (= (isStrictlySorted!1202 l!636) e!887280)))

(declare-fun b!1588669 () Bool)

(declare-fun e!887281 () Bool)

(assert (=> b!1588669 (= e!887280 e!887281)))

(declare-fun res!1084199 () Bool)

(assert (=> b!1588669 (=> (not res!1084199) (not e!887281))))

(assert (=> b!1588669 (= res!1084199 (bvslt (_1!12997 (h!38581 l!636)) (_1!12997 (h!38581 (t!51947 l!636)))))))

(declare-fun b!1588670 () Bool)

(assert (=> b!1588670 (= e!887281 (isStrictlySorted!1202 (t!51947 l!636)))))

(assert (= (and d!168605 (not res!1084198)) b!1588669))

(assert (= (and b!1588669 res!1084199) b!1588670))

(assert (=> b!1588670 m!1456991))

(assert (=> start!138816 d!168605))

(declare-fun b!1588675 () Bool)

(declare-fun e!887284 () Bool)

(declare-fun tp!115372 () Bool)

(assert (=> b!1588675 (= e!887284 (and tp_is_empty!39553 tp!115372))))

(assert (=> b!1588644 (= tp!115363 e!887284)))

(assert (= (and b!1588644 ((_ is Cons!37020) (t!51947 l!636))) b!1588675))

(check-sat (not b!1588670) (not b!1588668) (not b!1588675) tp_is_empty!39553)
(check-sat)
