; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109624 () Bool)

(assert start!109624)

(declare-fun b_free!29113 () Bool)

(declare-fun b_next!29113 () Bool)

(assert (=> start!109624 (= b_free!29113 (not b_next!29113))))

(declare-fun tp!102458 () Bool)

(declare-fun b_and!47203 () Bool)

(assert (=> start!109624 (= tp!102458 b_and!47203)))

(declare-fun b!1298557 () Bool)

(declare-fun res!863010 () Bool)

(declare-fun e!740821 () Bool)

(assert (=> b!1298557 (=> (not res!863010) (not e!740821))))

(declare-datatypes ((V!51441 0))(
  ( (V!51442 (val!17451 Int)) )
))
(declare-fun minValue!1387 () V!51441)

(declare-fun zeroValue!1387 () V!51441)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16478 0))(
  ( (ValueCellFull!16478 (v!20054 V!51441)) (EmptyCell!16478) )
))
(declare-datatypes ((array!86512 0))(
  ( (array!86513 (arr!41757 (Array (_ BitVec 32) ValueCell!16478)) (size!42307 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86512)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86514 0))(
  ( (array!86515 (arr!41758 (Array (_ BitVec 32) (_ BitVec 64))) (size!42308 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86514)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22504 0))(
  ( (tuple2!22505 (_1!11263 (_ BitVec 64)) (_2!11263 V!51441)) )
))
(declare-datatypes ((List!29632 0))(
  ( (Nil!29629) (Cons!29628 (h!30837 tuple2!22504) (t!43196 List!29632)) )
))
(declare-datatypes ((ListLongMap!20161 0))(
  ( (ListLongMap!20162 (toList!10096 List!29632)) )
))
(declare-fun contains!8214 (ListLongMap!20161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5125 (array!86514 array!86512 (_ BitVec 32) (_ BitVec 32) V!51441 V!51441 (_ BitVec 32) Int) ListLongMap!20161)

(assert (=> b!1298557 (= res!863010 (contains!8214 (getCurrentListMap!5125 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298558 () Bool)

(declare-fun res!863007 () Bool)

(assert (=> b!1298558 (=> (not res!863007) (not e!740821))))

(declare-datatypes ((List!29633 0))(
  ( (Nil!29630) (Cons!29629 (h!30838 (_ BitVec 64)) (t!43197 List!29633)) )
))
(declare-fun arrayNoDuplicates!0 (array!86514 (_ BitVec 32) List!29633) Bool)

(assert (=> b!1298558 (= res!863007 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29630))))

(declare-fun b!1298560 () Bool)

(assert (=> b!1298560 (= e!740821 (not true))))

(assert (=> b!1298560 (contains!8214 (getCurrentListMap!5125 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42999 0))(
  ( (Unit!43000) )
))
(declare-fun lt!580715 () Unit!42999)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!52 (array!86514 array!86512 (_ BitVec 32) (_ BitVec 32) V!51441 V!51441 (_ BitVec 64) (_ BitVec 32) Int) Unit!42999)

(assert (=> b!1298560 (= lt!580715 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!52 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298561 () Bool)

(declare-fun e!740819 () Bool)

(declare-fun e!740818 () Bool)

(declare-fun mapRes!53690 () Bool)

(assert (=> b!1298561 (= e!740819 (and e!740818 mapRes!53690))))

(declare-fun condMapEmpty!53690 () Bool)

(declare-fun mapDefault!53690 () ValueCell!16478)

