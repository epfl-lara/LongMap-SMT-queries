; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137276 () Bool)

(assert start!137276)

(declare-fun res!1079681 () Bool)

(declare-fun e!882220 () Bool)

(assert (=> start!137276 (=> (not res!1079681) (not e!882220))))

(declare-datatypes ((B!2558 0))(
  ( (B!2559 (val!19641 Int)) )
))
(declare-datatypes ((tuple2!25444 0))(
  ( (tuple2!25445 (_1!12733 (_ BitVec 64)) (_2!12733 B!2558)) )
))
(declare-datatypes ((List!36793 0))(
  ( (Nil!36790) (Cons!36789 (h!38350 tuple2!25444) (t!51699 List!36793)) )
))
(declare-datatypes ((ListLongMap!22791 0))(
  ( (ListLongMap!22792 (toList!11411 List!36793)) )
))
(declare-fun lm!251 () ListLongMap!22791)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun contains!10478 (ListLongMap!22791 (_ BitVec 64)) Bool)

(assert (=> start!137276 (= res!1079681 (not (contains!10478 lm!251 a0!51)))))

(assert (=> start!137276 e!882220))

(declare-fun e!882221 () Bool)

(declare-fun inv!58922 (ListLongMap!22791) Bool)

(assert (=> start!137276 (and (inv!58922 lm!251) e!882221)))

(assert (=> start!137276 true))

(declare-fun b!1581320 () Bool)

(assert (=> b!1581320 (= e!882220 false)))

(declare-fun b!1581321 () Bool)

(declare-fun tp!114252 () Bool)

(assert (=> b!1581321 (= e!882221 tp!114252)))

(assert (= (and start!137276 res!1079681) b!1581320))

(assert (= start!137276 b!1581321))

(declare-fun m!1453185 () Bool)

(assert (=> start!137276 m!1453185))

(declare-fun m!1453187 () Bool)

(assert (=> start!137276 m!1453187))

(check-sat (not start!137276) (not b!1581321))
(check-sat)
