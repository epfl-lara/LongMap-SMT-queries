; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111566 () Bool)

(assert start!111566)

(declare-fun b_free!30223 () Bool)

(declare-fun b_next!30223 () Bool)

(assert (=> start!111566 (= b_free!30223 (not b_next!30223))))

(declare-fun tp!106146 () Bool)

(declare-fun b_and!48587 () Bool)

(assert (=> start!111566 (= tp!106146 b_and!48587)))

(declare-fun b!1321050 () Bool)

(declare-fun e!753477 () Bool)

(assert (=> b!1321050 (= e!753477 (not true))))

(declare-datatypes ((V!53161 0))(
  ( (V!53162 (val!18096 Int)) )
))
(declare-datatypes ((tuple2!23384 0))(
  ( (tuple2!23385 (_1!11703 (_ BitVec 64)) (_2!11703 V!53161)) )
))
(declare-datatypes ((List!30517 0))(
  ( (Nil!30514) (Cons!30513 (h!31722 tuple2!23384) (t!44281 List!30517)) )
))
(declare-datatypes ((ListLongMap!21041 0))(
  ( (ListLongMap!21042 (toList!10536 List!30517)) )
))
(declare-fun lt!587089 () ListLongMap!21041)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8619 (ListLongMap!21041 (_ BitVec 64)) Bool)

(assert (=> b!1321050 (contains!8619 lt!587089 k0!1164)))

(declare-datatypes ((array!88939 0))(
  ( (array!88940 (arr!42944 (Array (_ BitVec 32) (_ BitVec 64))) (size!43496 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88939)

(declare-fun lt!587091 () V!53161)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43341 0))(
  ( (Unit!43342) )
))
(declare-fun lt!587088 () Unit!43341)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!144 ((_ BitVec 64) (_ BitVec 64) V!53161 ListLongMap!21041) Unit!43341)

(assert (=> b!1321050 (= lt!587088 (lemmaInListMapAfterAddingDiffThenInBefore!144 k0!1164 (select (arr!42944 _keys!1609) from!2000) lt!587091 lt!587089))))

(declare-fun lt!587090 () ListLongMap!21041)

(assert (=> b!1321050 (contains!8619 lt!587090 k0!1164)))

(declare-fun zeroValue!1279 () V!53161)

(declare-fun lt!587087 () Unit!43341)

(assert (=> b!1321050 (= lt!587087 (lemmaInListMapAfterAddingDiffThenInBefore!144 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587090))))

(declare-fun lt!587086 () ListLongMap!21041)

(assert (=> b!1321050 (contains!8619 lt!587086 k0!1164)))

(declare-fun lt!587085 () Unit!43341)

(declare-fun minValue!1279 () V!53161)

(assert (=> b!1321050 (= lt!587085 (lemmaInListMapAfterAddingDiffThenInBefore!144 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587086))))

(declare-fun +!4579 (ListLongMap!21041 tuple2!23384) ListLongMap!21041)

(assert (=> b!1321050 (= lt!587086 (+!4579 lt!587090 (tuple2!23385 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321050 (= lt!587090 (+!4579 lt!587089 (tuple2!23385 (select (arr!42944 _keys!1609) from!2000) lt!587091)))))

(declare-datatypes ((ValueCell!17123 0))(
  ( (ValueCellFull!17123 (v!20725 V!53161)) (EmptyCell!17123) )
))
(declare-datatypes ((array!88941 0))(
  ( (array!88942 (arr!42945 (Array (_ BitVec 32) ValueCell!17123)) (size!43497 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88941)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21612 (ValueCell!17123 V!53161) V!53161)

(declare-fun dynLambda!3509 (Int (_ BitVec 64)) V!53161)

(assert (=> b!1321050 (= lt!587091 (get!21612 (select (arr!42945 _values!1337) from!2000) (dynLambda!3509 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6212 (array!88939 array!88941 (_ BitVec 32) (_ BitVec 32) V!53161 V!53161 (_ BitVec 32) Int) ListLongMap!21041)

(assert (=> b!1321050 (= lt!587089 (getCurrentListMapNoExtraKeys!6212 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321051 () Bool)

(declare-fun e!753479 () Bool)

(declare-fun e!753481 () Bool)

(declare-fun mapRes!55712 () Bool)

(assert (=> b!1321051 (= e!753479 (and e!753481 mapRes!55712))))

(declare-fun condMapEmpty!55712 () Bool)

(declare-fun mapDefault!55712 () ValueCell!17123)

(assert (=> b!1321051 (= condMapEmpty!55712 (= (arr!42945 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17123)) mapDefault!55712)))))

(declare-fun b!1321052 () Bool)

(declare-fun res!876824 () Bool)

(assert (=> b!1321052 (=> (not res!876824) (not e!753477))))

(assert (=> b!1321052 (= res!876824 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43496 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321053 () Bool)

(declare-fun res!876828 () Bool)

(assert (=> b!1321053 (=> (not res!876828) (not e!753477))))

(declare-fun getCurrentListMap!5422 (array!88939 array!88941 (_ BitVec 32) (_ BitVec 32) V!53161 V!53161 (_ BitVec 32) Int) ListLongMap!21041)

(assert (=> b!1321053 (= res!876828 (contains!8619 (getCurrentListMap!5422 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321054 () Bool)

(declare-fun res!876827 () Bool)

(assert (=> b!1321054 (=> (not res!876827) (not e!753477))))

(assert (=> b!1321054 (= res!876827 (and (= (size!43497 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43496 _keys!1609) (size!43497 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321055 () Bool)

(declare-fun e!753480 () Bool)

(declare-fun tp_is_empty!36043 () Bool)

(assert (=> b!1321055 (= e!753480 tp_is_empty!36043)))

(declare-fun mapIsEmpty!55712 () Bool)

(assert (=> mapIsEmpty!55712 mapRes!55712))

(declare-fun res!876825 () Bool)

(assert (=> start!111566 (=> (not res!876825) (not e!753477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111566 (= res!876825 (validMask!0 mask!2019))))

(assert (=> start!111566 e!753477))

(declare-fun array_inv!32605 (array!88939) Bool)

(assert (=> start!111566 (array_inv!32605 _keys!1609)))

(assert (=> start!111566 true))

(assert (=> start!111566 tp_is_empty!36043))

(declare-fun array_inv!32606 (array!88941) Bool)

(assert (=> start!111566 (and (array_inv!32606 _values!1337) e!753479)))

(assert (=> start!111566 tp!106146))

(declare-fun b!1321056 () Bool)

(declare-fun res!876830 () Bool)

(assert (=> b!1321056 (=> (not res!876830) (not e!753477))))

(declare-datatypes ((List!30518 0))(
  ( (Nil!30515) (Cons!30514 (h!31723 (_ BitVec 64)) (t!44282 List!30518)) )
))
(declare-fun arrayNoDuplicates!0 (array!88939 (_ BitVec 32) List!30518) Bool)

(assert (=> b!1321056 (= res!876830 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30515))))

(declare-fun b!1321057 () Bool)

(declare-fun res!876826 () Bool)

(assert (=> b!1321057 (=> (not res!876826) (not e!753477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88939 (_ BitVec 32)) Bool)

(assert (=> b!1321057 (= res!876826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321058 () Bool)

(declare-fun res!876829 () Bool)

(assert (=> b!1321058 (=> (not res!876829) (not e!753477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321058 (= res!876829 (validKeyInArray!0 (select (arr!42944 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55712 () Bool)

(declare-fun tp!106145 () Bool)

(assert (=> mapNonEmpty!55712 (= mapRes!55712 (and tp!106145 e!753480))))

(declare-fun mapRest!55712 () (Array (_ BitVec 32) ValueCell!17123))

(declare-fun mapKey!55712 () (_ BitVec 32))

(declare-fun mapValue!55712 () ValueCell!17123)

(assert (=> mapNonEmpty!55712 (= (arr!42945 _values!1337) (store mapRest!55712 mapKey!55712 mapValue!55712))))

(declare-fun b!1321059 () Bool)

(declare-fun res!876831 () Bool)

(assert (=> b!1321059 (=> (not res!876831) (not e!753477))))

(assert (=> b!1321059 (= res!876831 (not (= (select (arr!42944 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321060 () Bool)

(assert (=> b!1321060 (= e!753481 tp_is_empty!36043)))

(assert (= (and start!111566 res!876825) b!1321054))

(assert (= (and b!1321054 res!876827) b!1321057))

(assert (= (and b!1321057 res!876826) b!1321056))

(assert (= (and b!1321056 res!876830) b!1321052))

(assert (= (and b!1321052 res!876824) b!1321053))

(assert (= (and b!1321053 res!876828) b!1321059))

(assert (= (and b!1321059 res!876831) b!1321058))

(assert (= (and b!1321058 res!876829) b!1321050))

(assert (= (and b!1321051 condMapEmpty!55712) mapIsEmpty!55712))

(assert (= (and b!1321051 (not condMapEmpty!55712)) mapNonEmpty!55712))

(get-info :version)

(assert (= (and mapNonEmpty!55712 ((_ is ValueCellFull!17123) mapValue!55712)) b!1321055))

(assert (= (and b!1321051 ((_ is ValueCellFull!17123) mapDefault!55712)) b!1321060))

(assert (= start!111566 b!1321051))

(declare-fun b_lambda!23539 () Bool)

(assert (=> (not b_lambda!23539) (not b!1321050)))

(declare-fun t!44280 () Bool)

(declare-fun tb!11567 () Bool)

(assert (=> (and start!111566 (= defaultEntry!1340 defaultEntry!1340) t!44280) tb!11567))

(declare-fun result!24197 () Bool)

(assert (=> tb!11567 (= result!24197 tp_is_empty!36043)))

(assert (=> b!1321050 t!44280))

(declare-fun b_and!48589 () Bool)

(assert (= b_and!48587 (and (=> t!44280 result!24197) b_and!48589)))

(declare-fun m!1208451 () Bool)

(assert (=> b!1321059 m!1208451))

(declare-fun m!1208453 () Bool)

(assert (=> b!1321057 m!1208453))

(declare-fun m!1208455 () Bool)

(assert (=> start!111566 m!1208455))

(declare-fun m!1208457 () Bool)

(assert (=> start!111566 m!1208457))

(declare-fun m!1208459 () Bool)

(assert (=> start!111566 m!1208459))

(assert (=> b!1321058 m!1208451))

(assert (=> b!1321058 m!1208451))

(declare-fun m!1208461 () Bool)

(assert (=> b!1321058 m!1208461))

(declare-fun m!1208463 () Bool)

(assert (=> b!1321053 m!1208463))

(assert (=> b!1321053 m!1208463))

(declare-fun m!1208465 () Bool)

(assert (=> b!1321053 m!1208465))

(declare-fun m!1208467 () Bool)

(assert (=> b!1321050 m!1208467))

(declare-fun m!1208469 () Bool)

(assert (=> b!1321050 m!1208469))

(declare-fun m!1208471 () Bool)

(assert (=> b!1321050 m!1208471))

(declare-fun m!1208473 () Bool)

(assert (=> b!1321050 m!1208473))

(declare-fun m!1208475 () Bool)

(assert (=> b!1321050 m!1208475))

(declare-fun m!1208477 () Bool)

(assert (=> b!1321050 m!1208477))

(assert (=> b!1321050 m!1208475))

(declare-fun m!1208479 () Bool)

(assert (=> b!1321050 m!1208479))

(declare-fun m!1208481 () Bool)

(assert (=> b!1321050 m!1208481))

(assert (=> b!1321050 m!1208451))

(assert (=> b!1321050 m!1208451))

(declare-fun m!1208483 () Bool)

(assert (=> b!1321050 m!1208483))

(declare-fun m!1208485 () Bool)

(assert (=> b!1321050 m!1208485))

(declare-fun m!1208487 () Bool)

(assert (=> b!1321050 m!1208487))

(declare-fun m!1208489 () Bool)

(assert (=> b!1321050 m!1208489))

(assert (=> b!1321050 m!1208479))

(declare-fun m!1208491 () Bool)

(assert (=> b!1321056 m!1208491))

(declare-fun m!1208493 () Bool)

(assert (=> mapNonEmpty!55712 m!1208493))

(check-sat (not b!1321050) (not b!1321058) b_and!48589 (not b!1321057) (not b_next!30223) (not mapNonEmpty!55712) (not b!1321053) tp_is_empty!36043 (not b!1321056) (not b_lambda!23539) (not start!111566))
(check-sat b_and!48589 (not b_next!30223))
