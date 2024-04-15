; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137648 () Bool)

(assert start!137648)

(assert (=> start!137648 false))

(declare-datatypes ((B!2774 0))(
  ( (B!2775 (val!19749 Int)) )
))
(declare-datatypes ((tuple2!25734 0))(
  ( (tuple2!25735 (_1!12878 (_ BitVec 64)) (_2!12878 B!2774)) )
))
(declare-datatypes ((List!36910 0))(
  ( (Nil!36907) (Cons!36906 (h!38450 tuple2!25734) (t!51816 List!36910)) )
))
(declare-datatypes ((ListLongMap!22845 0))(
  ( (ListLongMap!22846 (toList!11438 List!36910)) )
))
(declare-fun thiss!185 () ListLongMap!22845)

(declare-fun e!882995 () Bool)

(declare-fun inv!59119 (ListLongMap!22845) Bool)

(assert (=> start!137648 (and (inv!59119 thiss!185) e!882995)))

(assert (=> start!137648 true))

(declare-fun b!1582185 () Bool)

(declare-fun tp!114768 () Bool)

(assert (=> b!1582185 (= e!882995 tp!114768)))

(assert (= start!137648 b!1582185))

(declare-fun m!1452019 () Bool)

(assert (=> start!137648 m!1452019))

(check-sat (not start!137648) (not b!1582185))
(check-sat)
