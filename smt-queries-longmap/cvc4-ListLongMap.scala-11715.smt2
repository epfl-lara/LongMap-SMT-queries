; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137118 () Bool)

(assert start!137118)

(declare-fun b!1580143 () Bool)

(declare-fun res!1079447 () Bool)

(declare-fun e!881515 () Bool)

(assert (=> b!1580143 (=> (not res!1079447) (not e!881515))))

(declare-datatypes ((B!2634 0))(
  ( (B!2635 (val!19679 Int)) )
))
(declare-datatypes ((tuple2!25470 0))(
  ( (tuple2!25471 (_1!12746 (_ BitVec 64)) (_2!12746 B!2634)) )
))
(declare-datatypes ((List!36799 0))(
  ( (Nil!36796) (Cons!36795 (h!38338 tuple2!25470) (t!51713 List!36799)) )
))
(declare-fun l!1390 () List!36799)

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1580143 (= res!1079447 (and (is-Cons!36795 l!1390) (= (_1!12746 (h!38338 l!1390)) key!405)))))

(declare-fun b!1580144 () Bool)

(declare-fun e!881517 () Bool)

(declare-datatypes ((tuple2!25472 0))(
  ( (tuple2!25473 (_1!12747 tuple2!25470) (_2!12747 List!36799)) )
))
(declare-datatypes ((Option!892 0))(
  ( (Some!891 (v!22389 tuple2!25472)) (None!890) )
))
(declare-fun lt!676693 () Option!892)

(declare-fun get!26774 (Option!892) tuple2!25472)

(assert (=> b!1580144 (= e!881517 (not (is-Nil!36796 (_2!12747 (get!26774 lt!676693)))))))

(declare-fun b!1580145 () Bool)

(declare-fun res!1079444 () Bool)

(assert (=> b!1580145 (=> (not res!1079444) (not e!881515))))

(declare-fun isStrictlySorted!1057 (List!36799) Bool)

(assert (=> b!1580145 (= res!1079444 (isStrictlySorted!1057 (t!51713 l!1390)))))

(declare-fun res!1079441 () Bool)

(declare-fun e!881516 () Bool)

(assert (=> start!137118 (=> (not res!1079441) (not e!881516))))

(assert (=> start!137118 (= res!1079441 (isStrictlySorted!1057 l!1390))))

(assert (=> start!137118 e!881516))

(declare-fun e!881519 () Bool)

(assert (=> start!137118 e!881519))

(assert (=> start!137118 true))

(declare-fun tp_is_empty!39179 () Bool)

(assert (=> start!137118 tp_is_empty!39179))

(declare-fun b!1580146 () Bool)

(declare-fun tp!114429 () Bool)

(assert (=> b!1580146 (= e!881519 (and tp_is_empty!39179 tp!114429))))

(declare-fun b!1580147 () Bool)

(assert (=> b!1580147 (= e!881515 (not true))))

(declare-fun lt!676692 () tuple2!25470)

(declare-fun contains!10471 (List!36799 tuple2!25470) Bool)

(assert (=> b!1580147 (not (contains!10471 (t!51713 l!1390) lt!676692))))

(declare-datatypes ((Unit!52238 0))(
  ( (Unit!52239) )
))
(declare-fun lt!676691 () Unit!52238)

(declare-fun value!194 () B!2634)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!3 (List!36799 (_ BitVec 64) B!2634) Unit!52238)

(assert (=> b!1580147 (= lt!676691 (lemmaNotContainsKeyThenNotContainsTuple!3 (t!51713 l!1390) key!405 value!194))))

(declare-fun b!1580148 () Bool)

(declare-fun res!1079443 () Bool)

(assert (=> b!1580148 (=> (not res!1079443) (not e!881516))))

(declare-fun containsKey!903 (List!36799 (_ BitVec 64)) Bool)

(assert (=> b!1580148 (= res!1079443 (containsKey!903 l!1390 key!405))))

(declare-fun b!1580149 () Bool)

(declare-fun e!881518 () Bool)

(assert (=> b!1580149 (= e!881516 e!881518)))

(declare-fun res!1079446 () Bool)

(assert (=> b!1580149 (=> (not res!1079446) (not e!881518))))

(assert (=> b!1580149 (= res!1079446 (contains!10471 l!1390 lt!676692))))

(assert (=> b!1580149 (= lt!676692 (tuple2!25471 key!405 value!194))))

(declare-fun b!1580150 () Bool)

(assert (=> b!1580150 (= e!881518 e!881515)))

(declare-fun res!1079442 () Bool)

(assert (=> b!1580150 (=> (not res!1079442) (not e!881515))))

(assert (=> b!1580150 (= res!1079442 e!881517)))

(declare-fun res!1079448 () Bool)

(assert (=> b!1580150 (=> res!1079448 e!881517)))

(declare-fun isEmpty!1159 (Option!892) Bool)

(assert (=> b!1580150 (= res!1079448 (isEmpty!1159 lt!676693))))

(declare-fun unapply!75 (List!36799) Option!892)

(assert (=> b!1580150 (= lt!676693 (unapply!75 l!1390))))

(declare-fun b!1580151 () Bool)

(declare-fun res!1079445 () Bool)

(assert (=> b!1580151 (=> (not res!1079445) (not e!881515))))

(assert (=> b!1580151 (= res!1079445 (not (containsKey!903 (t!51713 l!1390) key!405)))))

(assert (= (and start!137118 res!1079441) b!1580148))

(assert (= (and b!1580148 res!1079443) b!1580149))

(assert (= (and b!1580149 res!1079446) b!1580150))

(assert (= (and b!1580150 (not res!1079448)) b!1580144))

(assert (= (and b!1580150 res!1079442) b!1580143))

(assert (= (and b!1580143 res!1079447) b!1580145))

(assert (= (and b!1580145 res!1079444) b!1580151))

(assert (= (and b!1580151 res!1079445) b!1580147))

(assert (= (and start!137118 (is-Cons!36795 l!1390)) b!1580146))

(declare-fun m!1451657 () Bool)

(assert (=> b!1580145 m!1451657))

(declare-fun m!1451659 () Bool)

(assert (=> b!1580151 m!1451659))

(declare-fun m!1451661 () Bool)

(assert (=> b!1580147 m!1451661))

(declare-fun m!1451663 () Bool)

(assert (=> b!1580147 m!1451663))

(declare-fun m!1451665 () Bool)

(assert (=> b!1580144 m!1451665))

(declare-fun m!1451667 () Bool)

(assert (=> b!1580150 m!1451667))

(declare-fun m!1451669 () Bool)

(assert (=> b!1580150 m!1451669))

(declare-fun m!1451671 () Bool)

(assert (=> b!1580148 m!1451671))

(declare-fun m!1451673 () Bool)

(assert (=> start!137118 m!1451673))

(declare-fun m!1451675 () Bool)

(assert (=> b!1580149 m!1451675))

(push 1)

