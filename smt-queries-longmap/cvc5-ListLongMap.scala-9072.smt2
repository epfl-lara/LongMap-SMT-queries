; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109216 () Bool)

(assert start!109216)

(declare-fun b_free!28705 () Bool)

(declare-fun b_next!28705 () Bool)

(assert (=> start!109216 (= b_free!28705 (not b_next!28705))))

(declare-fun tp!101233 () Bool)

(declare-fun b_and!46795 () Bool)

(assert (=> start!109216 (= tp!101233 b_and!46795)))

(declare-fun b!1291953 () Bool)

(declare-fun e!737462 () Bool)

(assert (=> b!1291953 (= e!737462 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50897 0))(
  ( (V!50898 (val!17247 Int)) )
))
(declare-datatypes ((tuple2!22184 0))(
  ( (tuple2!22185 (_1!11103 (_ BitVec 64)) (_2!11103 V!50897)) )
))
(declare-datatypes ((List!29338 0))(
  ( (Nil!29335) (Cons!29334 (h!30543 tuple2!22184) (t!42902 List!29338)) )
))
(declare-datatypes ((ListLongMap!19841 0))(
  ( (ListLongMap!19842 (toList!9936 List!29338)) )
))
(declare-fun contains!8054 (ListLongMap!19841 (_ BitVec 64)) Bool)

(assert (=> b!1291953 (not (contains!8054 (ListLongMap!19842 Nil!29335) k!1205))))

(declare-datatypes ((Unit!42782 0))(
  ( (Unit!42783) )
))
(declare-fun lt!579293 () Unit!42782)

(declare-fun emptyContainsNothing!113 ((_ BitVec 64)) Unit!42782)

(assert (=> b!1291953 (= lt!579293 (emptyContainsNothing!113 k!1205))))

(declare-fun b!1291954 () Bool)

(declare-fun e!737465 () Bool)

(declare-fun e!737461 () Bool)

(declare-fun mapRes!53078 () Bool)

(assert (=> b!1291954 (= e!737465 (and e!737461 mapRes!53078))))

(declare-fun condMapEmpty!53078 () Bool)

(declare-datatypes ((ValueCell!16274 0))(
  ( (ValueCellFull!16274 (v!19850 V!50897)) (EmptyCell!16274) )
))
(declare-datatypes ((array!85726 0))(
  ( (array!85727 (arr!41364 (Array (_ BitVec 32) ValueCell!16274)) (size!41914 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85726)

(declare-fun mapDefault!53078 () ValueCell!16274)

