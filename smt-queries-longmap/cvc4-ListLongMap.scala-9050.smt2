; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109088 () Bool)

(assert start!109088)

(declare-fun b_free!28577 () Bool)

(declare-fun b_next!28577 () Bool)

(assert (=> start!109088 (= b_free!28577 (not b_next!28577))))

(declare-fun tp!100850 () Bool)

(declare-fun b_and!46667 () Bool)

(assert (=> start!109088 (= tp!100850 b_and!46667)))

(declare-fun b!1289669 () Bool)

(declare-fun e!736333 () Bool)

(declare-fun tp_is_empty!34217 () Bool)

(assert (=> b!1289669 (= e!736333 tp_is_empty!34217)))

(declare-fun res!856693 () Bool)

(declare-fun e!736330 () Bool)

(assert (=> start!109088 (=> (not res!856693) (not e!736330))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109088 (= res!856693 (validMask!0 mask!2175))))

(assert (=> start!109088 e!736330))

(assert (=> start!109088 tp_is_empty!34217))

(assert (=> start!109088 true))

(declare-datatypes ((V!50725 0))(
  ( (V!50726 (val!17183 Int)) )
))
(declare-datatypes ((ValueCell!16210 0))(
  ( (ValueCellFull!16210 (v!19786 V!50725)) (EmptyCell!16210) )
))
(declare-datatypes ((array!85476 0))(
  ( (array!85477 (arr!41239 (Array (_ BitVec 32) ValueCell!16210)) (size!41789 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85476)

(declare-fun e!736332 () Bool)

(declare-fun array_inv!31259 (array!85476) Bool)

(assert (=> start!109088 (and (array_inv!31259 _values!1445) e!736332)))

(declare-datatypes ((array!85478 0))(
  ( (array!85479 (arr!41240 (Array (_ BitVec 32) (_ BitVec 64))) (size!41790 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85478)

(declare-fun array_inv!31260 (array!85478) Bool)

(assert (=> start!109088 (array_inv!31260 _keys!1741)))

(assert (=> start!109088 tp!100850))

(declare-fun b!1289670 () Bool)

(declare-fun res!856690 () Bool)

(assert (=> b!1289670 (=> (not res!856690) (not e!736330))))

(declare-fun minValue!1387 () V!50725)

(declare-fun zeroValue!1387 () V!50725)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22072 0))(
  ( (tuple2!22073 (_1!11047 (_ BitVec 64)) (_2!11047 V!50725)) )
))
(declare-datatypes ((List!29240 0))(
  ( (Nil!29237) (Cons!29236 (h!30445 tuple2!22072) (t!42804 List!29240)) )
))
(declare-datatypes ((ListLongMap!19729 0))(
  ( (ListLongMap!19730 (toList!9880 List!29240)) )
))
(declare-fun contains!7998 (ListLongMap!19729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4940 (array!85478 array!85476 (_ BitVec 32) (_ BitVec 32) V!50725 V!50725 (_ BitVec 32) Int) ListLongMap!19729)

(assert (=> b!1289670 (= res!856690 (contains!7998 (getCurrentListMap!4940 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52886 () Bool)

(declare-fun mapRes!52886 () Bool)

(assert (=> mapIsEmpty!52886 mapRes!52886))

(declare-fun b!1289671 () Bool)

(declare-fun res!856696 () Bool)

(assert (=> b!1289671 (=> (not res!856696) (not e!736330))))

(assert (=> b!1289671 (= res!856696 (and (= (size!41789 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41790 _keys!1741) (size!41789 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289672 () Bool)

(declare-fun res!856691 () Bool)

(assert (=> b!1289672 (=> (not res!856691) (not e!736330))))

(declare-datatypes ((List!29241 0))(
  ( (Nil!29238) (Cons!29237 (h!30446 (_ BitVec 64)) (t!42805 List!29241)) )
))
(declare-fun arrayNoDuplicates!0 (array!85478 (_ BitVec 32) List!29241) Bool)

(assert (=> b!1289672 (= res!856691 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29238))))

(declare-fun mapNonEmpty!52886 () Bool)

(declare-fun tp!100849 () Bool)

(declare-fun e!736331 () Bool)

(assert (=> mapNonEmpty!52886 (= mapRes!52886 (and tp!100849 e!736331))))

(declare-fun mapValue!52886 () ValueCell!16210)

(declare-fun mapKey!52886 () (_ BitVec 32))

(declare-fun mapRest!52886 () (Array (_ BitVec 32) ValueCell!16210))

(assert (=> mapNonEmpty!52886 (= (arr!41239 _values!1445) (store mapRest!52886 mapKey!52886 mapValue!52886))))

(declare-fun b!1289673 () Bool)

(declare-fun res!856695 () Bool)

(assert (=> b!1289673 (=> (not res!856695) (not e!736330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85478 (_ BitVec 32)) Bool)

(assert (=> b!1289673 (= res!856695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289674 () Bool)

(declare-fun e!736329 () Bool)

(assert (=> b!1289674 (= e!736330 (not e!736329))))

(declare-fun res!856698 () Bool)

(assert (=> b!1289674 (=> res!856698 e!736329)))

(assert (=> b!1289674 (= res!856698 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289674 (not (contains!7998 (ListLongMap!19730 Nil!29237) k!1205))))

(declare-datatypes ((Unit!42678 0))(
  ( (Unit!42679) )
))
(declare-fun lt!578335 () Unit!42678)

(declare-fun emptyContainsNothing!67 ((_ BitVec 64)) Unit!42678)

(assert (=> b!1289674 (= lt!578335 (emptyContainsNothing!67 k!1205))))

(declare-fun b!1289675 () Bool)

(declare-fun res!856694 () Bool)

(assert (=> b!1289675 (=> (not res!856694) (not e!736330))))

(assert (=> b!1289675 (= res!856694 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41790 _keys!1741))))))

(declare-fun b!1289676 () Bool)

(declare-fun res!856697 () Bool)

(assert (=> b!1289676 (=> (not res!856697) (not e!736330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289676 (= res!856697 (not (validKeyInArray!0 (select (arr!41240 _keys!1741) from!2144))))))

(declare-fun b!1289677 () Bool)

(assert (=> b!1289677 (= e!736329 true)))

(declare-fun lt!578336 () ListLongMap!19729)

(declare-fun +!4352 (ListLongMap!19729 tuple2!22072) ListLongMap!19729)

(assert (=> b!1289677 (not (contains!7998 (+!4352 lt!578336 (tuple2!22073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578334 () Unit!42678)

(declare-fun addStillNotContains!370 (ListLongMap!19729 (_ BitVec 64) V!50725 (_ BitVec 64)) Unit!42678)

(assert (=> b!1289677 (= lt!578334 (addStillNotContains!370 lt!578336 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1289677 (not (contains!7998 (+!4352 lt!578336 (tuple2!22073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578333 () Unit!42678)

(assert (=> b!1289677 (= lt!578333 (addStillNotContains!370 lt!578336 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5983 (array!85478 array!85476 (_ BitVec 32) (_ BitVec 32) V!50725 V!50725 (_ BitVec 32) Int) ListLongMap!19729)

(assert (=> b!1289677 (= lt!578336 (getCurrentListMapNoExtraKeys!5983 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289678 () Bool)

(assert (=> b!1289678 (= e!736332 (and e!736333 mapRes!52886))))

(declare-fun condMapEmpty!52886 () Bool)

(declare-fun mapDefault!52886 () ValueCell!16210)

