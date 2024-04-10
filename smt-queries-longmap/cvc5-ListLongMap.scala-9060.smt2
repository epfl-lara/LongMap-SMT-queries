; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109144 () Bool)

(assert start!109144)

(declare-fun b_free!28633 () Bool)

(declare-fun b_next!28633 () Bool)

(assert (=> start!109144 (= b_free!28633 (not b_next!28633))))

(declare-fun tp!101017 () Bool)

(declare-fun b_and!46723 () Bool)

(assert (=> start!109144 (= tp!101017 b_and!46723)))

(declare-fun b!1290677 () Bool)

(declare-fun res!857452 () Bool)

(declare-fun e!736838 () Bool)

(assert (=> b!1290677 (=> (not res!857452) (not e!736838))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85584 0))(
  ( (array!85585 (arr!41293 (Array (_ BitVec 32) (_ BitVec 64))) (size!41843 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85584)

(assert (=> b!1290677 (= res!857452 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41843 _keys!1741))))))

(declare-fun mapIsEmpty!52970 () Bool)

(declare-fun mapRes!52970 () Bool)

(assert (=> mapIsEmpty!52970 mapRes!52970))

(declare-fun b!1290678 () Bool)

(declare-fun res!857453 () Bool)

(assert (=> b!1290678 (=> (not res!857453) (not e!736838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290678 (= res!857453 (not (validKeyInArray!0 (select (arr!41293 _keys!1741) from!2144))))))

(declare-fun b!1290679 () Bool)

(declare-fun e!736835 () Bool)

(assert (=> b!1290679 (= e!736835 true)))

(assert (=> b!1290679 false))

(declare-datatypes ((V!50801 0))(
  ( (V!50802 (val!17211 Int)) )
))
(declare-fun minValue!1387 () V!50801)

(declare-datatypes ((Unit!42720 0))(
  ( (Unit!42721) )
))
(declare-fun lt!578745 () Unit!42720)

(declare-datatypes ((tuple2!22118 0))(
  ( (tuple2!22119 (_1!11070 (_ BitVec 64)) (_2!11070 V!50801)) )
))
(declare-datatypes ((List!29283 0))(
  ( (Nil!29280) (Cons!29279 (h!30488 tuple2!22118) (t!42847 List!29283)) )
))
(declare-datatypes ((ListLongMap!19775 0))(
  ( (ListLongMap!19776 (toList!9903 List!29283)) )
))
(declare-fun lt!578748 () ListLongMap!19775)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!44 ((_ BitVec 64) (_ BitVec 64) V!50801 ListLongMap!19775) Unit!42720)

(assert (=> b!1290679 (= lt!578745 (lemmaInListMapAfterAddingDiffThenInBefore!44 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578748))))

(declare-fun lt!578746 () ListLongMap!19775)

(declare-fun contains!8021 (ListLongMap!19775 (_ BitVec 64)) Bool)

(declare-fun +!4370 (ListLongMap!19775 tuple2!22118) ListLongMap!19775)

(assert (=> b!1290679 (not (contains!8021 (+!4370 lt!578746 (tuple2!22119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578749 () Unit!42720)

(declare-fun addStillNotContains!388 (ListLongMap!19775 (_ BitVec 64) V!50801 (_ BitVec 64)) Unit!42720)

(assert (=> b!1290679 (= lt!578749 (addStillNotContains!388 lt!578746 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290679 (not (contains!8021 lt!578748 k!1205))))

(declare-fun zeroValue!1387 () V!50801)

(assert (=> b!1290679 (= lt!578748 (+!4370 lt!578746 (tuple2!22119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578747 () Unit!42720)

(assert (=> b!1290679 (= lt!578747 (addStillNotContains!388 lt!578746 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16238 0))(
  ( (ValueCellFull!16238 (v!19814 V!50801)) (EmptyCell!16238) )
))
(declare-datatypes ((array!85586 0))(
  ( (array!85587 (arr!41294 (Array (_ BitVec 32) ValueCell!16238)) (size!41844 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85586)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6001 (array!85584 array!85586 (_ BitVec 32) (_ BitVec 32) V!50801 V!50801 (_ BitVec 32) Int) ListLongMap!19775)

(assert (=> b!1290679 (= lt!578746 (getCurrentListMapNoExtraKeys!6001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290680 () Bool)

(declare-fun res!857447 () Bool)

(assert (=> b!1290680 (=> (not res!857447) (not e!736838))))

(assert (=> b!1290680 (= res!857447 (and (= (size!41844 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41843 _keys!1741) (size!41844 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290681 () Bool)

(declare-fun res!857448 () Bool)

(assert (=> b!1290681 (=> (not res!857448) (not e!736838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85584 (_ BitVec 32)) Bool)

(assert (=> b!1290681 (= res!857448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290682 () Bool)

(declare-fun res!857451 () Bool)

(assert (=> b!1290682 (=> (not res!857451) (not e!736838))))

(assert (=> b!1290682 (= res!857451 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41843 _keys!1741))))))

(declare-fun res!857450 () Bool)

(assert (=> start!109144 (=> (not res!857450) (not e!736838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109144 (= res!857450 (validMask!0 mask!2175))))

(assert (=> start!109144 e!736838))

(declare-fun tp_is_empty!34273 () Bool)

(assert (=> start!109144 tp_is_empty!34273))

(assert (=> start!109144 true))

(declare-fun e!736837 () Bool)

(declare-fun array_inv!31293 (array!85586) Bool)

(assert (=> start!109144 (and (array_inv!31293 _values!1445) e!736837)))

(declare-fun array_inv!31294 (array!85584) Bool)

(assert (=> start!109144 (array_inv!31294 _keys!1741)))

(assert (=> start!109144 tp!101017))

(declare-fun b!1290683 () Bool)

(declare-fun res!857446 () Bool)

(assert (=> b!1290683 (=> (not res!857446) (not e!736838))))

(declare-fun getCurrentListMap!4959 (array!85584 array!85586 (_ BitVec 32) (_ BitVec 32) V!50801 V!50801 (_ BitVec 32) Int) ListLongMap!19775)

(assert (=> b!1290683 (= res!857446 (contains!8021 (getCurrentListMap!4959 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290684 () Bool)

(assert (=> b!1290684 (= e!736838 (not e!736835))))

(declare-fun res!857454 () Bool)

(assert (=> b!1290684 (=> res!857454 e!736835)))

(assert (=> b!1290684 (= res!857454 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290684 (not (contains!8021 (ListLongMap!19776 Nil!29280) k!1205))))

(declare-fun lt!578750 () Unit!42720)

(declare-fun emptyContainsNothing!86 ((_ BitVec 64)) Unit!42720)

(assert (=> b!1290684 (= lt!578750 (emptyContainsNothing!86 k!1205))))

(declare-fun b!1290685 () Bool)

(declare-fun e!736833 () Bool)

(assert (=> b!1290685 (= e!736837 (and e!736833 mapRes!52970))))

(declare-fun condMapEmpty!52970 () Bool)

(declare-fun mapDefault!52970 () ValueCell!16238)

