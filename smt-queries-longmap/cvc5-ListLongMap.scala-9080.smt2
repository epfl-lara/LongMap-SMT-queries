; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109264 () Bool)

(assert start!109264)

(declare-fun b_free!28753 () Bool)

(declare-fun b_next!28753 () Bool)

(assert (=> start!109264 (= b_free!28753 (not b_next!28753))))

(declare-fun tp!101377 () Bool)

(declare-fun b_and!46843 () Bool)

(assert (=> start!109264 (= tp!101377 b_and!46843)))

(declare-fun b!1292756 () Bool)

(declare-fun e!737832 () Bool)

(declare-fun tp_is_empty!34393 () Bool)

(assert (=> b!1292756 (= e!737832 tp_is_empty!34393)))

(declare-fun b!1292757 () Bool)

(declare-fun e!737836 () Bool)

(declare-fun e!737834 () Bool)

(assert (=> b!1292757 (= e!737836 (not e!737834))))

(declare-fun res!858993 () Bool)

(assert (=> b!1292757 (=> res!858993 e!737834)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292757 (= res!858993 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50961 0))(
  ( (V!50962 (val!17271 Int)) )
))
(declare-datatypes ((tuple2!22224 0))(
  ( (tuple2!22225 (_1!11123 (_ BitVec 64)) (_2!11123 V!50961)) )
))
(declare-datatypes ((List!29374 0))(
  ( (Nil!29371) (Cons!29370 (h!30579 tuple2!22224) (t!42938 List!29374)) )
))
(declare-datatypes ((ListLongMap!19881 0))(
  ( (ListLongMap!19882 (toList!9956 List!29374)) )
))
(declare-fun contains!8074 (ListLongMap!19881 (_ BitVec 64)) Bool)

(assert (=> b!1292757 (not (contains!8074 (ListLongMap!19882 Nil!29371) k!1205))))

(declare-datatypes ((Unit!42812 0))(
  ( (Unit!42813) )
))
(declare-fun lt!579380 () Unit!42812)

(declare-fun emptyContainsNothing!128 ((_ BitVec 64)) Unit!42812)

(assert (=> b!1292757 (= lt!579380 (emptyContainsNothing!128 k!1205))))

(declare-fun b!1292758 () Bool)

(declare-fun res!858990 () Bool)

(assert (=> b!1292758 (=> (not res!858990) (not e!737836))))

(declare-datatypes ((array!85818 0))(
  ( (array!85819 (arr!41410 (Array (_ BitVec 32) (_ BitVec 64))) (size!41960 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85818)

(declare-datatypes ((List!29375 0))(
  ( (Nil!29372) (Cons!29371 (h!30580 (_ BitVec 64)) (t!42939 List!29375)) )
))
(declare-fun arrayNoDuplicates!0 (array!85818 (_ BitVec 32) List!29375) Bool)

(assert (=> b!1292758 (= res!858990 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29372))))

(declare-fun b!1292759 () Bool)

(declare-fun res!858985 () Bool)

(assert (=> b!1292759 (=> (not res!858985) (not e!737836))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292759 (= res!858985 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41960 _keys!1741))))))

(declare-fun b!1292760 () Bool)

(declare-fun res!858992 () Bool)

(assert (=> b!1292760 (=> (not res!858992) (not e!737836))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85818 (_ BitVec 32)) Bool)

(assert (=> b!1292760 (= res!858992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292761 () Bool)

(declare-fun res!858989 () Bool)

(assert (=> b!1292761 (=> (not res!858989) (not e!737836))))

(assert (=> b!1292761 (= res!858989 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41960 _keys!1741))))))

(declare-fun res!858987 () Bool)

(assert (=> start!109264 (=> (not res!858987) (not e!737836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109264 (= res!858987 (validMask!0 mask!2175))))

(assert (=> start!109264 e!737836))

(assert (=> start!109264 tp_is_empty!34393))

(assert (=> start!109264 true))

(declare-datatypes ((ValueCell!16298 0))(
  ( (ValueCellFull!16298 (v!19874 V!50961)) (EmptyCell!16298) )
))
(declare-datatypes ((array!85820 0))(
  ( (array!85821 (arr!41411 (Array (_ BitVec 32) ValueCell!16298)) (size!41961 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85820)

(declare-fun e!737837 () Bool)

(declare-fun array_inv!31375 (array!85820) Bool)

(assert (=> start!109264 (and (array_inv!31375 _values!1445) e!737837)))

(declare-fun array_inv!31376 (array!85818) Bool)

(assert (=> start!109264 (array_inv!31376 _keys!1741)))

(assert (=> start!109264 tp!101377))

(declare-fun b!1292762 () Bool)

(assert (=> b!1292762 (= e!737834 true)))

(declare-fun lt!579378 () ListLongMap!19881)

(declare-fun zeroValue!1387 () V!50961)

(declare-fun +!4392 (ListLongMap!19881 tuple2!22224) ListLongMap!19881)

(assert (=> b!1292762 (not (contains!8074 (+!4392 lt!579378 (tuple2!22225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!579379 () Unit!42812)

(declare-fun addStillNotContains!410 (ListLongMap!19881 (_ BitVec 64) V!50961 (_ BitVec 64)) Unit!42812)

(assert (=> b!1292762 (= lt!579379 (addStillNotContains!410 lt!579378 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50961)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6024 (array!85818 array!85820 (_ BitVec 32) (_ BitVec 32) V!50961 V!50961 (_ BitVec 32) Int) ListLongMap!19881)

(assert (=> b!1292762 (= lt!579378 (getCurrentListMapNoExtraKeys!6024 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53150 () Bool)

(declare-fun mapRes!53150 () Bool)

(assert (=> mapIsEmpty!53150 mapRes!53150))

(declare-fun b!1292763 () Bool)

(declare-fun res!858988 () Bool)

(assert (=> b!1292763 (=> (not res!858988) (not e!737836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292763 (= res!858988 (not (validKeyInArray!0 (select (arr!41410 _keys!1741) from!2144))))))

(declare-fun b!1292764 () Bool)

(declare-fun e!737835 () Bool)

(assert (=> b!1292764 (= e!737837 (and e!737835 mapRes!53150))))

(declare-fun condMapEmpty!53150 () Bool)

(declare-fun mapDefault!53150 () ValueCell!16298)

