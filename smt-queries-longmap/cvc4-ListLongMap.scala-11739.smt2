; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137686 () Bool)

(assert start!137686)

(assert (=> start!137686 false))

(declare-datatypes ((B!2778 0))(
  ( (B!2779 (val!19751 Int)) )
))
(declare-datatypes ((tuple2!25670 0))(
  ( (tuple2!25671 (_1!12846 (_ BitVec 64)) (_2!12846 B!2778)) )
))
(declare-datatypes ((List!36871 0))(
  ( (Nil!36868) (Cons!36867 (h!38410 tuple2!25670) (t!51785 List!36871)) )
))
(declare-datatypes ((ListLongMap!22781 0))(
  ( (ListLongMap!22782 (toList!11406 List!36871)) )
))
(declare-fun thiss!185 () ListLongMap!22781)

(declare-fun e!883199 () Bool)

(declare-fun inv!59121 (ListLongMap!22781) Bool)

(assert (=> start!137686 (and (inv!59121 thiss!185) e!883199)))

(assert (=> start!137686 true))

(declare-fun b!1582504 () Bool)

(declare-fun tp!114773 () Bool)

(assert (=> b!1582504 (= e!883199 tp!114773)))

(assert (= start!137686 b!1582504))

(declare-fun m!1452903 () Bool)

(assert (=> start!137686 m!1452903))

(push 1)

(assert (not start!137686))

(assert (not b!1582504))

(check-sat)

(pop 1)

