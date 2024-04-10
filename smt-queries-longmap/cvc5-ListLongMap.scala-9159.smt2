; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109902 () Bool)

(assert start!109902)

(declare-fun b_free!29227 () Bool)

(declare-fun b_next!29227 () Bool)

(assert (=> start!109902 (= b_free!29227 (not b_next!29227))))

(declare-fun tp!102818 () Bool)

(declare-fun b_and!47363 () Bool)

(assert (=> start!109902 (= tp!102818 b_and!47363)))

(declare-fun b!1301968 () Bool)

(declare-fun res!864899 () Bool)

(declare-fun e!742610 () Bool)

(assert (=> b!1301968 (=> (not res!864899) (not e!742610))))

(declare-datatypes ((array!86744 0))(
  ( (array!86745 (arr!41867 (Array (_ BitVec 32) (_ BitVec 64))) (size!42417 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86744)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301968 (= res!864899 (validKeyInArray!0 (select (arr!41867 _keys!1741) from!2144)))))

(declare-fun b!1301969 () Bool)

(declare-fun res!864903 () Bool)

(assert (=> b!1301969 (=> (not res!864903) (not e!742610))))

(assert (=> b!1301969 (= res!864903 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42417 _keys!1741))))))

(declare-fun b!1301970 () Bool)

(declare-fun res!864896 () Bool)

(assert (=> b!1301970 (=> (not res!864896) (not e!742610))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86744 (_ BitVec 32)) Bool)

(assert (=> b!1301970 (= res!864896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-datatypes ((V!51593 0))(
  ( (V!51594 (val!17508 Int)) )
))
(declare-fun minValue!1387 () V!51593)

(declare-fun zeroValue!1387 () V!51593)

(declare-datatypes ((ValueCell!16535 0))(
  ( (ValueCellFull!16535 (v!20119 V!51593)) (EmptyCell!16535) )
))
(declare-datatypes ((array!86746 0))(
  ( (array!86747 (arr!41868 (Array (_ BitVec 32) ValueCell!16535)) (size!42418 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86746)

(declare-datatypes ((tuple2!22588 0))(
  ( (tuple2!22589 (_1!11305 (_ BitVec 64)) (_2!11305 V!51593)) )
))
(declare-datatypes ((List!29716 0))(
  ( (Nil!29713) (Cons!29712 (h!30921 tuple2!22588) (t!43302 List!29716)) )
))
(declare-datatypes ((ListLongMap!20245 0))(
  ( (ListLongMap!20246 (toList!10138 List!29716)) )
))
(declare-fun call!64046 () ListLongMap!20245)

(declare-fun defaultEntry!1448 () Int)

(declare-fun bm!64039 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6097 (array!86744 array!86746 (_ BitVec 32) (_ BitVec 32) V!51593 V!51593 (_ BitVec 32) Int) ListLongMap!20245)

(assert (=> bm!64039 (= call!64046 (getCurrentListMapNoExtraKeys!6097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582352 () ListLongMap!20245)

(declare-fun c!124880 () Bool)

(declare-fun bm!64040 () Bool)

(declare-fun lt!582350 () ListLongMap!20245)

(declare-fun call!64044 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun c!124882 () Bool)

(declare-fun lt!582351 () ListLongMap!20245)

(declare-fun contains!8266 (ListLongMap!20245 (_ BitVec 64)) Bool)

(assert (=> bm!64040 (= call!64044 (contains!8266 (ite c!124882 lt!582352 (ite c!124880 lt!582351 lt!582350)) k!1205))))

(declare-fun b!1301971 () Bool)

(declare-fun res!864897 () Bool)

(assert (=> b!1301971 (=> (not res!864897) (not e!742610))))

(declare-datatypes ((List!29717 0))(
  ( (Nil!29714) (Cons!29713 (h!30922 (_ BitVec 64)) (t!43303 List!29717)) )
))
(declare-fun arrayNoDuplicates!0 (array!86744 (_ BitVec 32) List!29717) Bool)

(assert (=> b!1301971 (= res!864897 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29714))))

(declare-fun b!1301972 () Bool)

(declare-datatypes ((Unit!43101 0))(
  ( (Unit!43102) )
))
(declare-fun e!742608 () Unit!43101)

(declare-fun lt!582354 () Unit!43101)

(assert (=> b!1301972 (= e!742608 lt!582354)))

(declare-fun call!64045 () ListLongMap!20245)

(assert (=> b!1301972 (= lt!582350 call!64045)))

(declare-fun call!64043 () Unit!43101)

(assert (=> b!1301972 (= lt!582354 call!64043)))

(declare-fun call!64042 () Bool)

(assert (=> b!1301972 call!64042))

(declare-fun mapIsEmpty!53880 () Bool)

(declare-fun mapRes!53880 () Bool)

(assert (=> mapIsEmpty!53880 mapRes!53880))

(declare-fun b!1301973 () Bool)

(declare-fun res!864900 () Bool)

(assert (=> b!1301973 (=> (not res!864900) (not e!742610))))

(declare-fun getCurrentListMap!5163 (array!86744 array!86746 (_ BitVec 32) (_ BitVec 32) V!51593 V!51593 (_ BitVec 32) Int) ListLongMap!20245)

(assert (=> b!1301973 (= res!864900 (contains!8266 (getCurrentListMap!5163 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun e!742613 () Bool)

(declare-fun b!1301974 () Bool)

(declare-fun arrayContainsKey!0 (array!86744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1301974 (= e!742613 (arrayContainsKey!0 _keys!1741 k!1205 from!2144))))

(declare-fun b!1301975 () Bool)

(declare-fun c!124881 () Bool)

(declare-fun lt!582356 () Bool)

(assert (=> b!1301975 (= c!124881 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582356))))

(declare-fun e!742607 () Unit!43101)

(assert (=> b!1301975 (= e!742607 e!742608)))

(declare-fun mapNonEmpty!53880 () Bool)

(declare-fun tp!102819 () Bool)

(declare-fun e!742615 () Bool)

(assert (=> mapNonEmpty!53880 (= mapRes!53880 (and tp!102819 e!742615))))

(declare-fun mapKey!53880 () (_ BitVec 32))

(declare-fun mapValue!53880 () ValueCell!16535)

(declare-fun mapRest!53880 () (Array (_ BitVec 32) ValueCell!16535))

(assert (=> mapNonEmpty!53880 (= (arr!41868 _values!1445) (store mapRest!53880 mapKey!53880 mapValue!53880))))

(declare-fun res!864902 () Bool)

(assert (=> start!109902 (=> (not res!864902) (not e!742610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109902 (= res!864902 (validMask!0 mask!2175))))

(assert (=> start!109902 e!742610))

(declare-fun tp_is_empty!34867 () Bool)

(assert (=> start!109902 tp_is_empty!34867))

(assert (=> start!109902 true))

(declare-fun e!742609 () Bool)

(declare-fun array_inv!31671 (array!86746) Bool)

(assert (=> start!109902 (and (array_inv!31671 _values!1445) e!742609)))

(declare-fun array_inv!31672 (array!86744) Bool)

(assert (=> start!109902 (array_inv!31672 _keys!1741)))

(assert (=> start!109902 tp!102818))

(declare-fun b!1301976 () Bool)

(declare-fun e!742614 () Unit!43101)

(declare-fun lt!582360 () Unit!43101)

(assert (=> b!1301976 (= e!742614 lt!582360)))

(declare-fun lt!582355 () ListLongMap!20245)

(assert (=> b!1301976 (= lt!582355 call!64046)))

(declare-fun +!4465 (ListLongMap!20245 tuple2!22588) ListLongMap!20245)

(assert (=> b!1301976 (= lt!582352 (+!4465 lt!582355 (tuple2!22589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582357 () Unit!43101)

(declare-fun call!64047 () Unit!43101)

(assert (=> b!1301976 (= lt!582357 call!64047)))

(assert (=> b!1301976 call!64044))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!87 ((_ BitVec 64) (_ BitVec 64) V!51593 ListLongMap!20245) Unit!43101)

(assert (=> b!1301976 (= lt!582360 (lemmaInListMapAfterAddingDiffThenInBefore!87 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582355))))

(assert (=> b!1301976 (contains!8266 lt!582355 k!1205)))

(declare-fun b!1301977 () Bool)

(declare-fun e!742611 () Bool)

(assert (=> b!1301977 (= e!742611 tp_is_empty!34867)))

(declare-fun b!1301978 () Bool)

(declare-fun res!864904 () Bool)

(assert (=> b!1301978 (=> (not res!864904) (not e!742610))))

(assert (=> b!1301978 (= res!864904 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42417 _keys!1741))))))

(declare-fun bm!64041 () Bool)

(assert (=> bm!64041 (= call!64047 (lemmaInListMapAfterAddingDiffThenInBefore!87 k!1205 (ite c!124882 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124880 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124882 minValue!1387 (ite c!124880 zeroValue!1387 minValue!1387)) (ite c!124882 lt!582352 (ite c!124880 lt!582351 lt!582350))))))

(declare-fun b!1301979 () Bool)

(assert (=> b!1301979 call!64042))

(declare-fun lt!582359 () Unit!43101)

(assert (=> b!1301979 (= lt!582359 call!64043)))

(assert (=> b!1301979 (= lt!582351 call!64045)))

(assert (=> b!1301979 (= e!742607 lt!582359)))

(declare-fun bm!64042 () Bool)

(assert (=> bm!64042 (= call!64045 call!64046)))

(declare-fun b!1301980 () Bool)

(assert (=> b!1301980 (= e!742615 tp_is_empty!34867)))

(declare-fun b!1301981 () Bool)

(declare-fun res!864898 () Bool)

(assert (=> b!1301981 (=> (not res!864898) (not e!742610))))

(assert (=> b!1301981 (= res!864898 (and (= (size!42418 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42417 _keys!1741) (size!42418 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301982 () Bool)

(assert (=> b!1301982 (= e!742610 (not e!742613))))

(declare-fun res!864901 () Bool)

(assert (=> b!1301982 (=> res!864901 e!742613)))

(assert (=> b!1301982 (= res!864901 (not (= k!1205 (select (arr!41867 _keys!1741) from!2144))))))

(assert (=> b!1301982 (not (contains!8266 (ListLongMap!20246 Nil!29713) k!1205))))

(declare-fun lt!582353 () Unit!43101)

(declare-fun emptyContainsNothing!205 ((_ BitVec 64)) Unit!43101)

(assert (=> b!1301982 (= lt!582353 (emptyContainsNothing!205 k!1205))))

(declare-fun lt!582358 () Unit!43101)

(assert (=> b!1301982 (= lt!582358 e!742614)))

(assert (=> b!1301982 (= c!124882 (and (not lt!582356) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301982 (= lt!582356 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301983 () Bool)

(assert (=> b!1301983 (= e!742609 (and e!742611 mapRes!53880))))

(declare-fun condMapEmpty!53880 () Bool)

(declare-fun mapDefault!53880 () ValueCell!16535)

