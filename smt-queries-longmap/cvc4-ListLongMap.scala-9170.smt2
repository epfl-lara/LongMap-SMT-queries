; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110226 () Bool)

(assert start!110226)

(declare-fun b_free!29297 () Bool)

(declare-fun b_next!29297 () Bool)

(assert (=> start!110226 (= b_free!29297 (not b_next!29297))))

(declare-fun tp!103053 () Bool)

(declare-fun b_and!47487 () Bool)

(assert (=> start!110226 (= tp!103053 b_and!47487)))

(declare-fun b!1304869 () Bool)

(declare-fun res!866560 () Bool)

(declare-fun e!744308 () Bool)

(assert (=> b!1304869 (=> (not res!866560) (not e!744308))))

(declare-datatypes ((V!51685 0))(
  ( (V!51686 (val!17543 Int)) )
))
(declare-fun minValue!1387 () V!51685)

(declare-fun zeroValue!1387 () V!51685)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16570 0))(
  ( (ValueCellFull!16570 (v!20164 V!51685)) (EmptyCell!16570) )
))
(declare-datatypes ((array!86890 0))(
  ( (array!86891 (arr!41933 (Array (_ BitVec 32) ValueCell!16570)) (size!42483 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86890)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!86892 0))(
  ( (array!86893 (arr!41934 (Array (_ BitVec 32) (_ BitVec 64))) (size!42484 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86892)

(declare-datatypes ((tuple2!22646 0))(
  ( (tuple2!22647 (_1!11334 (_ BitVec 64)) (_2!11334 V!51685)) )
))
(declare-datatypes ((List!29766 0))(
  ( (Nil!29763) (Cons!29762 (h!30971 tuple2!22646) (t!43366 List!29766)) )
))
(declare-datatypes ((ListLongMap!20303 0))(
  ( (ListLongMap!20304 (toList!10167 List!29766)) )
))
(declare-fun contains!8309 (ListLongMap!20303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5184 (array!86892 array!86890 (_ BitVec 32) (_ BitVec 32) V!51685 V!51685 (_ BitVec 32) Int) ListLongMap!20303)

(assert (=> b!1304869 (= res!866560 (contains!8309 (getCurrentListMap!5184 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1304870 () Bool)

(declare-fun e!744312 () Bool)

(assert (=> b!1304870 (= e!744308 (not e!744312))))

(declare-fun res!866557 () Bool)

(assert (=> b!1304870 (=> res!866557 e!744312)))

(assert (=> b!1304870 (= res!866557 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304870 (not (contains!8309 (ListLongMap!20304 Nil!29763) k!1205))))

(declare-datatypes ((Unit!43214 0))(
  ( (Unit!43215) )
))
(declare-fun lt!584042 () Unit!43214)

(declare-fun emptyContainsNothing!230 ((_ BitVec 64)) Unit!43214)

(assert (=> b!1304870 (= lt!584042 (emptyContainsNothing!230 k!1205))))

(declare-fun b!1304871 () Bool)

(declare-fun res!866558 () Bool)

(assert (=> b!1304871 (=> (not res!866558) (not e!744308))))

(assert (=> b!1304871 (= res!866558 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42484 _keys!1741))))))

(declare-fun b!1304872 () Bool)

(declare-fun res!866556 () Bool)

(assert (=> b!1304872 (=> (not res!866556) (not e!744308))))

(assert (=> b!1304872 (= res!866556 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42484 _keys!1741))))))

(declare-fun b!1304873 () Bool)

(declare-fun res!866555 () Bool)

(assert (=> b!1304873 (=> (not res!866555) (not e!744308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86892 (_ BitVec 32)) Bool)

(assert (=> b!1304873 (= res!866555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304874 () Bool)

(declare-fun res!866562 () Bool)

(assert (=> b!1304874 (=> (not res!866562) (not e!744308))))

(assert (=> b!1304874 (= res!866562 (and (= (size!42483 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42484 _keys!1741) (size!42483 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304875 () Bool)

(declare-fun e!744313 () Bool)

(declare-fun tp_is_empty!34937 () Bool)

(assert (=> b!1304875 (= e!744313 tp_is_empty!34937)))

(declare-fun b!1304876 () Bool)

(declare-fun res!866561 () Bool)

(assert (=> b!1304876 (=> (not res!866561) (not e!744308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304876 (= res!866561 (not (validKeyInArray!0 (select (arr!41934 _keys!1741) from!2144))))))

(declare-fun b!1304877 () Bool)

(declare-fun e!744310 () Bool)

(assert (=> b!1304877 (= e!744310 tp_is_empty!34937)))

(declare-fun b!1304878 () Bool)

(assert (=> b!1304878 (= e!744312 false)))

(declare-fun lt!584043 () ListLongMap!20303)

(declare-fun +!4488 (ListLongMap!20303 tuple2!22646) ListLongMap!20303)

(assert (=> b!1304878 (not (contains!8309 (+!4488 lt!584043 (tuple2!22647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!584044 () Unit!43214)

(declare-fun addStillNotContains!485 (ListLongMap!20303 (_ BitVec 64) V!51685 (_ BitVec 64)) Unit!43214)

(assert (=> b!1304878 (= lt!584044 (addStillNotContains!485 lt!584043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6124 (array!86892 array!86890 (_ BitVec 32) (_ BitVec 32) V!51685 V!51685 (_ BitVec 32) Int) ListLongMap!20303)

(assert (=> b!1304878 (= lt!584043 (getCurrentListMapNoExtraKeys!6124 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304879 () Bool)

(declare-fun res!866559 () Bool)

(assert (=> b!1304879 (=> (not res!866559) (not e!744308))))

(declare-datatypes ((List!29767 0))(
  ( (Nil!29764) (Cons!29763 (h!30972 (_ BitVec 64)) (t!43367 List!29767)) )
))
(declare-fun arrayNoDuplicates!0 (array!86892 (_ BitVec 32) List!29767) Bool)

(assert (=> b!1304879 (= res!866559 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29764))))

(declare-fun mapNonEmpty!54009 () Bool)

(declare-fun mapRes!54009 () Bool)

(declare-fun tp!103052 () Bool)

(assert (=> mapNonEmpty!54009 (= mapRes!54009 (and tp!103052 e!744310))))

(declare-fun mapValue!54009 () ValueCell!16570)

(declare-fun mapKey!54009 () (_ BitVec 32))

(declare-fun mapRest!54009 () (Array (_ BitVec 32) ValueCell!16570))

(assert (=> mapNonEmpty!54009 (= (arr!41933 _values!1445) (store mapRest!54009 mapKey!54009 mapValue!54009))))

(declare-fun mapIsEmpty!54009 () Bool)

(assert (=> mapIsEmpty!54009 mapRes!54009))

(declare-fun b!1304880 () Bool)

(declare-fun e!744311 () Bool)

(assert (=> b!1304880 (= e!744311 (and e!744313 mapRes!54009))))

(declare-fun condMapEmpty!54009 () Bool)

(declare-fun mapDefault!54009 () ValueCell!16570)

