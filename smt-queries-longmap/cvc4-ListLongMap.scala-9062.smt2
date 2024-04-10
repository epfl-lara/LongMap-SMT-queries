; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109160 () Bool)

(assert start!109160)

(declare-fun b_free!28649 () Bool)

(declare-fun b_next!28649 () Bool)

(assert (=> start!109160 (= b_free!28649 (not b_next!28649))))

(declare-fun tp!101066 () Bool)

(declare-fun b_and!46739 () Bool)

(assert (=> start!109160 (= tp!101066 b_and!46739)))

(declare-fun b!1290965 () Bool)

(declare-fun e!736977 () Bool)

(declare-fun tp_is_empty!34289 () Bool)

(assert (=> b!1290965 (= e!736977 tp_is_empty!34289)))

(declare-fun b!1290966 () Bool)

(declare-fun e!736979 () Bool)

(assert (=> b!1290966 (= e!736979 tp_is_empty!34289)))

(declare-fun mapIsEmpty!52994 () Bool)

(declare-fun mapRes!52994 () Bool)

(assert (=> mapIsEmpty!52994 mapRes!52994))

(declare-fun b!1290967 () Bool)

(declare-fun res!857666 () Bool)

(declare-fun e!736982 () Bool)

(assert (=> b!1290967 (=> (not res!857666) (not e!736982))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85614 0))(
  ( (array!85615 (arr!41308 (Array (_ BitVec 32) (_ BitVec 64))) (size!41858 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85614)

(assert (=> b!1290967 (= res!857666 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41858 _keys!1741))))))

(declare-fun b!1290968 () Bool)

(declare-fun res!857664 () Bool)

(assert (=> b!1290968 (=> (not res!857664) (not e!736982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290968 (= res!857664 (not (validKeyInArray!0 (select (arr!41308 _keys!1741) from!2144))))))

(declare-fun b!1290969 () Bool)

(declare-fun e!736981 () Bool)

(assert (=> b!1290969 (= e!736981 true)))

(assert (=> b!1290969 false))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42734 0))(
  ( (Unit!42735) )
))
(declare-fun lt!578893 () Unit!42734)

(declare-datatypes ((V!50821 0))(
  ( (V!50822 (val!17219 Int)) )
))
(declare-fun minValue!1387 () V!50821)

(declare-datatypes ((tuple2!22132 0))(
  ( (tuple2!22133 (_1!11077 (_ BitVec 64)) (_2!11077 V!50821)) )
))
(declare-datatypes ((List!29294 0))(
  ( (Nil!29291) (Cons!29290 (h!30499 tuple2!22132) (t!42858 List!29294)) )
))
(declare-datatypes ((ListLongMap!19789 0))(
  ( (ListLongMap!19790 (toList!9910 List!29294)) )
))
(declare-fun lt!578889 () ListLongMap!19789)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!50 ((_ BitVec 64) (_ BitVec 64) V!50821 ListLongMap!19789) Unit!42734)

(assert (=> b!1290969 (= lt!578893 (lemmaInListMapAfterAddingDiffThenInBefore!50 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578889))))

(declare-fun lt!578890 () ListLongMap!19789)

(declare-fun contains!8028 (ListLongMap!19789 (_ BitVec 64)) Bool)

(declare-fun +!4376 (ListLongMap!19789 tuple2!22132) ListLongMap!19789)

(assert (=> b!1290969 (not (contains!8028 (+!4376 lt!578890 (tuple2!22133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578891 () Unit!42734)

(declare-fun addStillNotContains!394 (ListLongMap!19789 (_ BitVec 64) V!50821 (_ BitVec 64)) Unit!42734)

(assert (=> b!1290969 (= lt!578891 (addStillNotContains!394 lt!578890 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290969 (not (contains!8028 lt!578889 k!1205))))

(declare-fun zeroValue!1387 () V!50821)

(assert (=> b!1290969 (= lt!578889 (+!4376 lt!578890 (tuple2!22133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578894 () Unit!42734)

(assert (=> b!1290969 (= lt!578894 (addStillNotContains!394 lt!578890 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16246 0))(
  ( (ValueCellFull!16246 (v!19822 V!50821)) (EmptyCell!16246) )
))
(declare-datatypes ((array!85616 0))(
  ( (array!85617 (arr!41309 (Array (_ BitVec 32) ValueCell!16246)) (size!41859 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85616)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6007 (array!85614 array!85616 (_ BitVec 32) (_ BitVec 32) V!50821 V!50821 (_ BitVec 32) Int) ListLongMap!19789)

(assert (=> b!1290969 (= lt!578890 (getCurrentListMapNoExtraKeys!6007 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290970 () Bool)

(declare-fun res!857663 () Bool)

(assert (=> b!1290970 (=> (not res!857663) (not e!736982))))

(assert (=> b!1290970 (= res!857663 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41858 _keys!1741))))))

(declare-fun mapNonEmpty!52994 () Bool)

(declare-fun tp!101065 () Bool)

(assert (=> mapNonEmpty!52994 (= mapRes!52994 (and tp!101065 e!736979))))

(declare-fun mapRest!52994 () (Array (_ BitVec 32) ValueCell!16246))

(declare-fun mapValue!52994 () ValueCell!16246)

(declare-fun mapKey!52994 () (_ BitVec 32))

(assert (=> mapNonEmpty!52994 (= (arr!41309 _values!1445) (store mapRest!52994 mapKey!52994 mapValue!52994))))

(declare-fun b!1290972 () Bool)

(declare-fun res!857668 () Bool)

(assert (=> b!1290972 (=> (not res!857668) (not e!736982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85614 (_ BitVec 32)) Bool)

(assert (=> b!1290972 (= res!857668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290973 () Bool)

(declare-fun res!857665 () Bool)

(assert (=> b!1290973 (=> (not res!857665) (not e!736982))))

(declare-datatypes ((List!29295 0))(
  ( (Nil!29292) (Cons!29291 (h!30500 (_ BitVec 64)) (t!42859 List!29295)) )
))
(declare-fun arrayNoDuplicates!0 (array!85614 (_ BitVec 32) List!29295) Bool)

(assert (=> b!1290973 (= res!857665 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29292))))

(declare-fun b!1290974 () Bool)

(declare-fun res!857669 () Bool)

(assert (=> b!1290974 (=> (not res!857669) (not e!736982))))

(assert (=> b!1290974 (= res!857669 (and (= (size!41859 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41858 _keys!1741) (size!41859 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!857670 () Bool)

(assert (=> start!109160 (=> (not res!857670) (not e!736982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109160 (= res!857670 (validMask!0 mask!2175))))

(assert (=> start!109160 e!736982))

(assert (=> start!109160 tp_is_empty!34289))

(assert (=> start!109160 true))

(declare-fun e!736980 () Bool)

(declare-fun array_inv!31305 (array!85616) Bool)

(assert (=> start!109160 (and (array_inv!31305 _values!1445) e!736980)))

(declare-fun array_inv!31306 (array!85614) Bool)

(assert (=> start!109160 (array_inv!31306 _keys!1741)))

(assert (=> start!109160 tp!101066))

(declare-fun b!1290971 () Bool)

(assert (=> b!1290971 (= e!736982 (not e!736981))))

(declare-fun res!857667 () Bool)

(assert (=> b!1290971 (=> res!857667 e!736981)))

(assert (=> b!1290971 (= res!857667 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290971 (not (contains!8028 (ListLongMap!19790 Nil!29291) k!1205))))

(declare-fun lt!578892 () Unit!42734)

(declare-fun emptyContainsNothing!92 ((_ BitVec 64)) Unit!42734)

(assert (=> b!1290971 (= lt!578892 (emptyContainsNothing!92 k!1205))))

(declare-fun b!1290975 () Bool)

(assert (=> b!1290975 (= e!736980 (and e!736977 mapRes!52994))))

(declare-fun condMapEmpty!52994 () Bool)

(declare-fun mapDefault!52994 () ValueCell!16246)

