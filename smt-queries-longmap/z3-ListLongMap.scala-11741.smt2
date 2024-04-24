; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138122 () Bool)

(assert start!138122)

(assert (=> start!138122 false))

(declare-datatypes ((B!2774 0))(
  ( (B!2775 (val!19749 Int)) )
))
(declare-datatypes ((tuple2!25726 0))(
  ( (tuple2!25727 (_1!12874 (_ BitVec 64)) (_2!12874 B!2774)) )
))
(declare-datatypes ((List!36901 0))(
  ( (Nil!36898) (Cons!36897 (h!38458 tuple2!25726) (t!51807 List!36901)) )
))
(declare-datatypes ((ListLongMap!22845 0))(
  ( (ListLongMap!22846 (toList!11438 List!36901)) )
))
(declare-fun thiss!185 () ListLongMap!22845)

(declare-fun e!884750 () Bool)

(declare-fun inv!59129 (ListLongMap!22845) Bool)

(assert (=> start!138122 (and (inv!59129 thiss!185) e!884750)))

(assert (=> start!138122 true))

(declare-fun b!1585005 () Bool)

(declare-fun tp!114768 () Bool)

(assert (=> b!1585005 (= e!884750 tp!114768)))

(assert (= start!138122 b!1585005))

(declare-fun m!1455225 () Bool)

(assert (=> start!138122 m!1455225))

(check-sat (not start!138122) (not b!1585005))
(check-sat)
