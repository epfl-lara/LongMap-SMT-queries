; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110256 () Bool)

(assert start!110256)

(declare-fun b_free!29303 () Bool)

(declare-fun b_next!29303 () Bool)

(assert (=> start!110256 (= b_free!29303 (not b_next!29303))))

(declare-fun tp!103073 () Bool)

(declare-fun b_and!47499 () Bool)

(assert (=> start!110256 (= tp!103073 b_and!47499)))

(declare-fun b!1305138 () Bool)

(declare-fun e!744469 () Bool)

(declare-fun tp_is_empty!34943 () Bool)

(assert (=> b!1305138 (= e!744469 tp_is_empty!34943)))

(declare-fun b!1305139 () Bool)

(declare-fun res!866710 () Bool)

(declare-fun e!744470 () Bool)

(assert (=> b!1305139 (=> (not res!866710) (not e!744470))))

(declare-datatypes ((array!86902 0))(
  ( (array!86903 (arr!41938 (Array (_ BitVec 32) (_ BitVec 64))) (size!42488 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86902)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86902 (_ BitVec 32)) Bool)

(assert (=> b!1305139 (= res!866710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!54021 () Bool)

(declare-fun mapRes!54021 () Bool)

(declare-fun tp!103074 () Bool)

(declare-fun e!744465 () Bool)

(assert (=> mapNonEmpty!54021 (= mapRes!54021 (and tp!103074 e!744465))))

(declare-fun mapKey!54021 () (_ BitVec 32))

(declare-datatypes ((V!51693 0))(
  ( (V!51694 (val!17546 Int)) )
))
(declare-datatypes ((ValueCell!16573 0))(
  ( (ValueCellFull!16573 (v!20168 V!51693)) (EmptyCell!16573) )
))
(declare-fun mapRest!54021 () (Array (_ BitVec 32) ValueCell!16573))

(declare-datatypes ((array!86904 0))(
  ( (array!86905 (arr!41939 (Array (_ BitVec 32) ValueCell!16573)) (size!42489 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86904)

(declare-fun mapValue!54021 () ValueCell!16573)

(assert (=> mapNonEmpty!54021 (= (arr!41939 _values!1445) (store mapRest!54021 mapKey!54021 mapValue!54021))))

(declare-fun b!1305140 () Bool)

(declare-fun res!866707 () Bool)

(assert (=> b!1305140 (=> (not res!866707) (not e!744470))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1305140 (= res!866707 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42488 _keys!1741))))))

(declare-fun b!1305141 () Bool)

(declare-fun res!866711 () Bool)

(assert (=> b!1305141 (=> (not res!866711) (not e!744470))))

(declare-datatypes ((List!29770 0))(
  ( (Nil!29767) (Cons!29766 (h!30975 (_ BitVec 64)) (t!43372 List!29770)) )
))
(declare-fun arrayNoDuplicates!0 (array!86902 (_ BitVec 32) List!29770) Bool)

(assert (=> b!1305141 (= res!866711 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29767))))

(declare-fun res!866708 () Bool)

(assert (=> start!110256 (=> (not res!866708) (not e!744470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110256 (= res!866708 (validMask!0 mask!2175))))

(assert (=> start!110256 e!744470))

(assert (=> start!110256 tp_is_empty!34943))

(assert (=> start!110256 true))

(declare-fun e!744467 () Bool)

(declare-fun array_inv!31711 (array!86904) Bool)

(assert (=> start!110256 (and (array_inv!31711 _values!1445) e!744467)))

(declare-fun array_inv!31712 (array!86902) Bool)

(assert (=> start!110256 (array_inv!31712 _keys!1741)))

(assert (=> start!110256 tp!103073))

(declare-fun b!1305142 () Bool)

(declare-fun res!866706 () Bool)

(assert (=> b!1305142 (=> (not res!866706) (not e!744470))))

(assert (=> b!1305142 (= res!866706 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42488 _keys!1741))))))

(declare-fun b!1305143 () Bool)

(declare-fun e!744466 () Bool)

(assert (=> b!1305143 (= e!744470 (not e!744466))))

(declare-fun res!866703 () Bool)

(assert (=> b!1305143 (=> res!866703 e!744466)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305143 (= res!866703 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22650 0))(
  ( (tuple2!22651 (_1!11336 (_ BitVec 64)) (_2!11336 V!51693)) )
))
(declare-datatypes ((List!29771 0))(
  ( (Nil!29768) (Cons!29767 (h!30976 tuple2!22650) (t!43373 List!29771)) )
))
(declare-datatypes ((ListLongMap!20307 0))(
  ( (ListLongMap!20308 (toList!10169 List!29771)) )
))
(declare-fun contains!8313 (ListLongMap!20307 (_ BitVec 64)) Bool)

(assert (=> b!1305143 (not (contains!8313 (ListLongMap!20308 Nil!29768) k!1205))))

(declare-datatypes ((Unit!43222 0))(
  ( (Unit!43223) )
))
(declare-fun lt!584204 () Unit!43222)

(declare-fun emptyContainsNothing!232 ((_ BitVec 64)) Unit!43222)

(assert (=> b!1305143 (= lt!584204 (emptyContainsNothing!232 k!1205))))

(declare-fun b!1305144 () Bool)

(declare-fun res!866709 () Bool)

(assert (=> b!1305144 (=> (not res!866709) (not e!744470))))

(assert (=> b!1305144 (= res!866709 (and (= (size!42489 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42488 _keys!1741) (size!42489 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305145 () Bool)

(assert (=> b!1305145 (= e!744465 tp_is_empty!34943)))

(declare-fun mapIsEmpty!54021 () Bool)

(assert (=> mapIsEmpty!54021 mapRes!54021))

(declare-fun b!1305146 () Bool)

(assert (=> b!1305146 (= e!744466 true)))

(declare-fun lt!584203 () ListLongMap!20307)

(declare-fun minValue!1387 () V!51693)

(declare-fun +!4490 (ListLongMap!20307 tuple2!22650) ListLongMap!20307)

(assert (=> b!1305146 (not (contains!8313 (+!4490 lt!584203 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!584205 () Unit!43222)

(declare-fun addStillNotContains!487 (ListLongMap!20307 (_ BitVec 64) V!51693 (_ BitVec 64)) Unit!43222)

(assert (=> b!1305146 (= lt!584205 (addStillNotContains!487 lt!584203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51693)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6126 (array!86902 array!86904 (_ BitVec 32) (_ BitVec 32) V!51693 V!51693 (_ BitVec 32) Int) ListLongMap!20307)

(assert (=> b!1305146 (= lt!584203 (getCurrentListMapNoExtraKeys!6126 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305147 () Bool)

(declare-fun res!866705 () Bool)

(assert (=> b!1305147 (=> (not res!866705) (not e!744470))))

(declare-fun getCurrentListMap!5186 (array!86902 array!86904 (_ BitVec 32) (_ BitVec 32) V!51693 V!51693 (_ BitVec 32) Int) ListLongMap!20307)

(assert (=> b!1305147 (= res!866705 (contains!8313 (getCurrentListMap!5186 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1305148 () Bool)

(declare-fun res!866704 () Bool)

(assert (=> b!1305148 (=> (not res!866704) (not e!744470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305148 (= res!866704 (not (validKeyInArray!0 (select (arr!41938 _keys!1741) from!2144))))))

(declare-fun b!1305149 () Bool)

(assert (=> b!1305149 (= e!744467 (and e!744469 mapRes!54021))))

(declare-fun condMapEmpty!54021 () Bool)

(declare-fun mapDefault!54021 () ValueCell!16573)

