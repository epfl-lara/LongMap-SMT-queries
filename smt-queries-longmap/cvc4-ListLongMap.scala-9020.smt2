; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108884 () Bool)

(assert start!108884)

(declare-fun b_free!28397 () Bool)

(declare-fun b_next!28397 () Bool)

(assert (=> start!108884 (= b_free!28397 (not b_next!28397))))

(declare-fun tp!100306 () Bool)

(declare-fun b_and!46463 () Bool)

(assert (=> start!108884 (= tp!100306 b_and!46463)))

(declare-fun mapNonEmpty!52613 () Bool)

(declare-fun mapRes!52613 () Bool)

(declare-fun tp!100307 () Bool)

(declare-fun e!734538 () Bool)

(assert (=> mapNonEmpty!52613 (= mapRes!52613 (and tp!100307 e!734538))))

(declare-datatypes ((V!50485 0))(
  ( (V!50486 (val!17093 Int)) )
))
(declare-datatypes ((ValueCell!16120 0))(
  ( (ValueCellFull!16120 (v!19695 V!50485)) (EmptyCell!16120) )
))
(declare-fun mapRest!52613 () (Array (_ BitVec 32) ValueCell!16120))

(declare-fun mapKey!52613 () (_ BitVec 32))

(declare-fun mapValue!52613 () ValueCell!16120)

(declare-datatypes ((array!85126 0))(
  ( (array!85127 (arr!41065 (Array (_ BitVec 32) ValueCell!16120)) (size!41615 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85126)

(assert (=> mapNonEmpty!52613 (= (arr!41065 _values!1445) (store mapRest!52613 mapKey!52613 mapValue!52613))))

(declare-fun res!854317 () Bool)

(declare-fun e!734537 () Bool)

(assert (=> start!108884 (=> (not res!854317) (not e!734537))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108884 (= res!854317 (validMask!0 mask!2175))))

(assert (=> start!108884 e!734537))

(declare-fun tp_is_empty!34037 () Bool)

(assert (=> start!108884 tp_is_empty!34037))

(assert (=> start!108884 true))

(declare-fun e!734536 () Bool)

(declare-fun array_inv!31139 (array!85126) Bool)

(assert (=> start!108884 (and (array_inv!31139 _values!1445) e!734536)))

(declare-datatypes ((array!85128 0))(
  ( (array!85129 (arr!41066 (Array (_ BitVec 32) (_ BitVec 64))) (size!41616 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85128)

(declare-fun array_inv!31140 (array!85128) Bool)

(assert (=> start!108884 (array_inv!31140 _keys!1741)))

(assert (=> start!108884 tp!100306))

(declare-fun b!1285990 () Bool)

(declare-fun res!854313 () Bool)

(assert (=> b!1285990 (=> (not res!854313) (not e!734537))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285990 (= res!854313 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285991 () Bool)

(declare-fun res!854319 () Bool)

(assert (=> b!1285991 (=> (not res!854319) (not e!734537))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285991 (= res!854319 (validKeyInArray!0 (select (arr!41066 _keys!1741) from!2144)))))

(declare-fun b!1285992 () Bool)

(declare-fun res!854312 () Bool)

(assert (=> b!1285992 (=> (not res!854312) (not e!734537))))

(declare-fun minValue!1387 () V!50485)

(declare-fun zeroValue!1387 () V!50485)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21914 0))(
  ( (tuple2!21915 (_1!10968 (_ BitVec 64)) (_2!10968 V!50485)) )
))
(declare-datatypes ((List!29101 0))(
  ( (Nil!29098) (Cons!29097 (h!30306 tuple2!21914) (t!42645 List!29101)) )
))
(declare-datatypes ((ListLongMap!19571 0))(
  ( (ListLongMap!19572 (toList!9801 List!29101)) )
))
(declare-fun contains!7918 (ListLongMap!19571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4879 (array!85128 array!85126 (_ BitVec 32) (_ BitVec 32) V!50485 V!50485 (_ BitVec 32) Int) ListLongMap!19571)

(assert (=> b!1285992 (= res!854312 (contains!7918 (getCurrentListMap!4879 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285993 () Bool)

(declare-fun res!854311 () Bool)

(assert (=> b!1285993 (=> (not res!854311) (not e!734537))))

(assert (=> b!1285993 (= res!854311 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41616 _keys!1741))))))

(declare-fun b!1285994 () Bool)

(declare-fun res!854315 () Bool)

(assert (=> b!1285994 (=> (not res!854315) (not e!734537))))

(assert (=> b!1285994 (= res!854315 (and (= (size!41615 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41616 _keys!1741) (size!41615 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285995 () Bool)

(declare-fun e!734540 () Bool)

(assert (=> b!1285995 (= e!734540 tp_is_empty!34037)))

(declare-fun b!1285996 () Bool)

(declare-fun res!854316 () Bool)

(assert (=> b!1285996 (=> (not res!854316) (not e!734537))))

(declare-datatypes ((List!29102 0))(
  ( (Nil!29099) (Cons!29098 (h!30307 (_ BitVec 64)) (t!42646 List!29102)) )
))
(declare-fun arrayNoDuplicates!0 (array!85128 (_ BitVec 32) List!29102) Bool)

(assert (=> b!1285996 (= res!854316 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29099))))

(declare-fun b!1285997 () Bool)

(assert (=> b!1285997 (= e!734538 tp_is_empty!34037)))

(declare-fun b!1285998 () Bool)

(assert (=> b!1285998 (= e!734536 (and e!734540 mapRes!52613))))

(declare-fun condMapEmpty!52613 () Bool)

(declare-fun mapDefault!52613 () ValueCell!16120)

