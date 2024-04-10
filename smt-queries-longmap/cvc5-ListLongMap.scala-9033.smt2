; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108982 () Bool)

(assert start!108982)

(declare-fun b_free!28471 () Bool)

(declare-fun b_next!28471 () Bool)

(assert (=> start!108982 (= b_free!28471 (not b_next!28471))))

(declare-fun tp!100532 () Bool)

(declare-fun b_and!46561 () Bool)

(assert (=> start!108982 (= tp!100532 b_and!46561)))

(declare-fun b!1287795 () Bool)

(declare-fun e!735412 () Bool)

(assert (=> b!1287795 (= e!735412 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50585 0))(
  ( (V!50586 (val!17130 Int)) )
))
(declare-datatypes ((tuple2!21982 0))(
  ( (tuple2!21983 (_1!11002 (_ BitVec 64)) (_2!11002 V!50585)) )
))
(declare-datatypes ((List!29160 0))(
  ( (Nil!29157) (Cons!29156 (h!30365 tuple2!21982) (t!42724 List!29160)) )
))
(declare-datatypes ((ListLongMap!19639 0))(
  ( (ListLongMap!19640 (toList!9835 List!29160)) )
))
(declare-fun contains!7953 (ListLongMap!19639 (_ BitVec 64)) Bool)

(assert (=> b!1287795 (not (contains!7953 (ListLongMap!19640 Nil!29157) k!1205))))

(declare-datatypes ((Unit!42590 0))(
  ( (Unit!42591) )
))
(declare-fun lt!577898 () Unit!42590)

(declare-fun emptyContainsNothing!24 ((_ BitVec 64)) Unit!42590)

(assert (=> b!1287795 (= lt!577898 (emptyContainsNothing!24 k!1205))))

(declare-fun mapNonEmpty!52727 () Bool)

(declare-fun mapRes!52727 () Bool)

(declare-fun tp!100531 () Bool)

(declare-fun e!735413 () Bool)

(assert (=> mapNonEmpty!52727 (= mapRes!52727 (and tp!100531 e!735413))))

(declare-datatypes ((ValueCell!16157 0))(
  ( (ValueCellFull!16157 (v!19733 V!50585)) (EmptyCell!16157) )
))
(declare-fun mapValue!52727 () ValueCell!16157)

(declare-fun mapRest!52727 () (Array (_ BitVec 32) ValueCell!16157))

(declare-fun mapKey!52727 () (_ BitVec 32))

(declare-datatypes ((array!85272 0))(
  ( (array!85273 (arr!41137 (Array (_ BitVec 32) ValueCell!16157)) (size!41687 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85272)

(assert (=> mapNonEmpty!52727 (= (arr!41137 _values!1445) (store mapRest!52727 mapKey!52727 mapValue!52727))))

(declare-fun b!1287797 () Bool)

(declare-fun e!735411 () Bool)

(declare-fun e!735410 () Bool)

(assert (=> b!1287797 (= e!735411 (and e!735410 mapRes!52727))))

(declare-fun condMapEmpty!52727 () Bool)

(declare-fun mapDefault!52727 () ValueCell!16157)

