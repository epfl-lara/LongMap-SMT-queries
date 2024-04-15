; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110252 () Bool)

(assert start!110252)

(declare-fun b_free!29299 () Bool)

(declare-fun b_next!29299 () Bool)

(assert (=> start!110252 (= b_free!29299 (not b_next!29299))))

(declare-fun tp!103063 () Bool)

(declare-fun b_and!47477 () Bool)

(assert (=> start!110252 (= tp!103063 b_and!47477)))

(declare-fun b!1304996 () Bool)

(declare-fun e!744400 () Bool)

(declare-fun tp_is_empty!34939 () Bool)

(assert (=> b!1304996 (= e!744400 tp_is_empty!34939)))

(declare-fun b!1304997 () Bool)

(declare-fun e!744396 () Bool)

(declare-fun e!744399 () Bool)

(declare-fun mapRes!54015 () Bool)

(assert (=> b!1304997 (= e!744396 (and e!744399 mapRes!54015))))

(declare-fun condMapEmpty!54015 () Bool)

(declare-datatypes ((V!51689 0))(
  ( (V!51690 (val!17544 Int)) )
))
(declare-datatypes ((ValueCell!16571 0))(
  ( (ValueCellFull!16571 (v!20165 V!51689)) (EmptyCell!16571) )
))
(declare-datatypes ((array!86803 0))(
  ( (array!86804 (arr!41889 (Array (_ BitVec 32) ValueCell!16571)) (size!42441 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86803)

(declare-fun mapDefault!54015 () ValueCell!16571)

(assert (=> b!1304997 (= condMapEmpty!54015 (= (arr!41889 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16571)) mapDefault!54015)))))

(declare-fun mapNonEmpty!54015 () Bool)

(declare-fun tp!103062 () Bool)

(assert (=> mapNonEmpty!54015 (= mapRes!54015 (and tp!103062 e!744400))))

(declare-fun mapRest!54015 () (Array (_ BitVec 32) ValueCell!16571))

(declare-fun mapValue!54015 () ValueCell!16571)

(declare-fun mapKey!54015 () (_ BitVec 32))

(assert (=> mapNonEmpty!54015 (= (arr!41889 _values!1445) (store mapRest!54015 mapKey!54015 mapValue!54015))))

(declare-fun res!866627 () Bool)

(declare-fun e!744401 () Bool)

(assert (=> start!110252 (=> (not res!866627) (not e!744401))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110252 (= res!866627 (validMask!0 mask!2175))))

(assert (=> start!110252 e!744401))

(assert (=> start!110252 tp_is_empty!34939))

(assert (=> start!110252 true))

(declare-fun array_inv!31859 (array!86803) Bool)

(assert (=> start!110252 (and (array_inv!31859 _values!1445) e!744396)))

(declare-datatypes ((array!86805 0))(
  ( (array!86806 (arr!41890 (Array (_ BitVec 32) (_ BitVec 64))) (size!42442 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86805)

(declare-fun array_inv!31860 (array!86805) Bool)

(assert (=> start!110252 (array_inv!31860 _keys!1741)))

(assert (=> start!110252 tp!103063))

(declare-fun b!1304998 () Bool)

(declare-fun res!866628 () Bool)

(assert (=> b!1304998 (=> (not res!866628) (not e!744401))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1304998 (= res!866628 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42442 _keys!1741))))))

(declare-fun b!1304999 () Bool)

(declare-fun res!866623 () Bool)

(assert (=> b!1304999 (=> (not res!866623) (not e!744401))))

(declare-fun minValue!1387 () V!51689)

(declare-fun zeroValue!1387 () V!51689)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22712 0))(
  ( (tuple2!22713 (_1!11367 (_ BitVec 64)) (_2!11367 V!51689)) )
))
(declare-datatypes ((List!29816 0))(
  ( (Nil!29813) (Cons!29812 (h!31021 tuple2!22712) (t!43410 List!29816)) )
))
(declare-datatypes ((ListLongMap!20369 0))(
  ( (ListLongMap!20370 (toList!10200 List!29816)) )
))
(declare-fun contains!8272 (ListLongMap!20369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5099 (array!86805 array!86803 (_ BitVec 32) (_ BitVec 32) V!51689 V!51689 (_ BitVec 32) Int) ListLongMap!20369)

(assert (=> b!1304999 (= res!866623 (contains!8272 (getCurrentListMap!5099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305000 () Bool)

(assert (=> b!1305000 (= e!744399 tp_is_empty!34939)))

(declare-fun b!1305001 () Bool)

(declare-fun e!744397 () Bool)

(assert (=> b!1305001 (= e!744401 (not e!744397))))

(declare-fun res!866626 () Bool)

(assert (=> b!1305001 (=> res!866626 e!744397)))

(assert (=> b!1305001 (= res!866626 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1305001 (not (contains!8272 (ListLongMap!20370 Nil!29813) k0!1205))))

(declare-datatypes ((Unit!43065 0))(
  ( (Unit!43066) )
))
(declare-fun lt!584000 () Unit!43065)

(declare-fun emptyContainsNothing!227 ((_ BitVec 64)) Unit!43065)

(assert (=> b!1305001 (= lt!584000 (emptyContainsNothing!227 k0!1205))))

(declare-fun mapIsEmpty!54015 () Bool)

(assert (=> mapIsEmpty!54015 mapRes!54015))

(declare-fun b!1305002 () Bool)

(assert (=> b!1305002 (= e!744397 true)))

(declare-fun lt!584001 () ListLongMap!20369)

(declare-fun +!4522 (ListLongMap!20369 tuple2!22712) ListLongMap!20369)

(assert (=> b!1305002 (not (contains!8272 (+!4522 lt!584001 (tuple2!22713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583999 () Unit!43065)

(declare-fun addStillNotContains!475 (ListLongMap!20369 (_ BitVec 64) V!51689 (_ BitVec 64)) Unit!43065)

(assert (=> b!1305002 (= lt!583999 (addStillNotContains!475 lt!584001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6157 (array!86805 array!86803 (_ BitVec 32) (_ BitVec 32) V!51689 V!51689 (_ BitVec 32) Int) ListLongMap!20369)

(assert (=> b!1305002 (= lt!584001 (getCurrentListMapNoExtraKeys!6157 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305003 () Bool)

(declare-fun res!866625 () Bool)

(assert (=> b!1305003 (=> (not res!866625) (not e!744401))))

(assert (=> b!1305003 (= res!866625 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42442 _keys!1741))))))

(declare-fun b!1305004 () Bool)

(declare-fun res!866622 () Bool)

(assert (=> b!1305004 (=> (not res!866622) (not e!744401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305004 (= res!866622 (not (validKeyInArray!0 (select (arr!41890 _keys!1741) from!2144))))))

(declare-fun b!1305005 () Bool)

(declare-fun res!866624 () Bool)

(assert (=> b!1305005 (=> (not res!866624) (not e!744401))))

(declare-datatypes ((List!29817 0))(
  ( (Nil!29814) (Cons!29813 (h!31022 (_ BitVec 64)) (t!43411 List!29817)) )
))
(declare-fun arrayNoDuplicates!0 (array!86805 (_ BitVec 32) List!29817) Bool)

(assert (=> b!1305005 (= res!866624 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29814))))

(declare-fun b!1305006 () Bool)

(declare-fun res!866621 () Bool)

(assert (=> b!1305006 (=> (not res!866621) (not e!744401))))

(assert (=> b!1305006 (= res!866621 (and (= (size!42441 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42442 _keys!1741) (size!42441 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305007 () Bool)

(declare-fun res!866620 () Bool)

(assert (=> b!1305007 (=> (not res!866620) (not e!744401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86805 (_ BitVec 32)) Bool)

(assert (=> b!1305007 (= res!866620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!110252 res!866627) b!1305006))

(assert (= (and b!1305006 res!866621) b!1305007))

(assert (= (and b!1305007 res!866620) b!1305005))

(assert (= (and b!1305005 res!866624) b!1305003))

(assert (= (and b!1305003 res!866625) b!1304999))

(assert (= (and b!1304999 res!866623) b!1304998))

(assert (= (and b!1304998 res!866628) b!1305004))

(assert (= (and b!1305004 res!866622) b!1305001))

(assert (= (and b!1305001 (not res!866626)) b!1305002))

(assert (= (and b!1304997 condMapEmpty!54015) mapIsEmpty!54015))

(assert (= (and b!1304997 (not condMapEmpty!54015)) mapNonEmpty!54015))

(get-info :version)

(assert (= (and mapNonEmpty!54015 ((_ is ValueCellFull!16571) mapValue!54015)) b!1304996))

(assert (= (and b!1304997 ((_ is ValueCellFull!16571) mapDefault!54015)) b!1305000))

(assert (= start!110252 b!1304997))

(declare-fun m!1195583 () Bool)

(assert (=> b!1305004 m!1195583))

(assert (=> b!1305004 m!1195583))

(declare-fun m!1195585 () Bool)

(assert (=> b!1305004 m!1195585))

(declare-fun m!1195587 () Bool)

(assert (=> start!110252 m!1195587))

(declare-fun m!1195589 () Bool)

(assert (=> start!110252 m!1195589))

(declare-fun m!1195591 () Bool)

(assert (=> start!110252 m!1195591))

(declare-fun m!1195593 () Bool)

(assert (=> b!1305002 m!1195593))

(assert (=> b!1305002 m!1195593))

(declare-fun m!1195595 () Bool)

(assert (=> b!1305002 m!1195595))

(declare-fun m!1195597 () Bool)

(assert (=> b!1305002 m!1195597))

(declare-fun m!1195599 () Bool)

(assert (=> b!1305002 m!1195599))

(declare-fun m!1195601 () Bool)

(assert (=> mapNonEmpty!54015 m!1195601))

(declare-fun m!1195603 () Bool)

(assert (=> b!1305007 m!1195603))

(declare-fun m!1195605 () Bool)

(assert (=> b!1304999 m!1195605))

(assert (=> b!1304999 m!1195605))

(declare-fun m!1195607 () Bool)

(assert (=> b!1304999 m!1195607))

(declare-fun m!1195609 () Bool)

(assert (=> b!1305005 m!1195609))

(declare-fun m!1195611 () Bool)

(assert (=> b!1305001 m!1195611))

(declare-fun m!1195613 () Bool)

(assert (=> b!1305001 m!1195613))

(check-sat (not b_next!29299) (not start!110252) (not b!1304999) (not b!1305005) (not mapNonEmpty!54015) (not b!1305002) (not b!1305007) (not b!1305004) (not b!1305001) b_and!47477 tp_is_empty!34939)
(check-sat b_and!47477 (not b_next!29299))
