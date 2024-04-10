; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111544 () Bool)

(assert start!111544)

(declare-fun b_free!30201 () Bool)

(declare-fun b_next!30201 () Bool)

(assert (=> start!111544 (= b_free!30201 (not b_next!30201))))

(declare-fun tp!106079 () Bool)

(declare-fun b_and!48561 () Bool)

(assert (=> start!111544 (= tp!106079 b_and!48561)))

(declare-fun b!1320735 () Bool)

(declare-fun res!876596 () Bool)

(declare-fun e!753345 () Bool)

(assert (=> b!1320735 (=> (not res!876596) (not e!753345))))

(declare-datatypes ((array!88972 0))(
  ( (array!88973 (arr!42960 (Array (_ BitVec 32) (_ BitVec 64))) (size!43510 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88972)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53131 0))(
  ( (V!53132 (val!18085 Int)) )
))
(declare-fun zeroValue!1279 () V!53131)

(declare-datatypes ((ValueCell!17112 0))(
  ( (ValueCellFull!17112 (v!20715 V!53131)) (EmptyCell!17112) )
))
(declare-datatypes ((array!88974 0))(
  ( (array!88975 (arr!42961 (Array (_ BitVec 32) ValueCell!17112)) (size!43511 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88974)

(declare-fun minValue!1279 () V!53131)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23290 0))(
  ( (tuple2!23291 (_1!11656 (_ BitVec 64)) (_2!11656 V!53131)) )
))
(declare-datatypes ((List!30439 0))(
  ( (Nil!30436) (Cons!30435 (h!31644 tuple2!23290) (t!44189 List!30439)) )
))
(declare-datatypes ((ListLongMap!20947 0))(
  ( (ListLongMap!20948 (toList!10489 List!30439)) )
))
(declare-fun contains!8644 (ListLongMap!20947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5492 (array!88972 array!88974 (_ BitVec 32) (_ BitVec 32) V!53131 V!53131 (_ BitVec 32) Int) ListLongMap!20947)

(assert (=> b!1320735 (= res!876596 (contains!8644 (getCurrentListMap!5492 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320736 () Bool)

(declare-fun res!876593 () Bool)

(assert (=> b!1320736 (=> (not res!876593) (not e!753345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88972 (_ BitVec 32)) Bool)

(assert (=> b!1320736 (= res!876593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!876592 () Bool)

(assert (=> start!111544 (=> (not res!876592) (not e!753345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111544 (= res!876592 (validMask!0 mask!2019))))

(assert (=> start!111544 e!753345))

(declare-fun array_inv!32433 (array!88972) Bool)

(assert (=> start!111544 (array_inv!32433 _keys!1609)))

(assert (=> start!111544 true))

(declare-fun tp_is_empty!36021 () Bool)

(assert (=> start!111544 tp_is_empty!36021))

(declare-fun e!753346 () Bool)

(declare-fun array_inv!32434 (array!88974) Bool)

(assert (=> start!111544 (and (array_inv!32434 _values!1337) e!753346)))

(assert (=> start!111544 tp!106079))

(declare-fun mapNonEmpty!55679 () Bool)

(declare-fun mapRes!55679 () Bool)

(declare-fun tp!106078 () Bool)

(declare-fun e!753349 () Bool)

(assert (=> mapNonEmpty!55679 (= mapRes!55679 (and tp!106078 e!753349))))

(declare-fun mapKey!55679 () (_ BitVec 32))

(declare-fun mapValue!55679 () ValueCell!17112)

(declare-fun mapRest!55679 () (Array (_ BitVec 32) ValueCell!17112))

(assert (=> mapNonEmpty!55679 (= (arr!42961 _values!1337) (store mapRest!55679 mapKey!55679 mapValue!55679))))

(declare-fun b!1320737 () Bool)

(declare-fun res!876591 () Bool)

(assert (=> b!1320737 (=> (not res!876591) (not e!753345))))

(declare-datatypes ((List!30440 0))(
  ( (Nil!30437) (Cons!30436 (h!31645 (_ BitVec 64)) (t!44190 List!30440)) )
))
(declare-fun arrayNoDuplicates!0 (array!88972 (_ BitVec 32) List!30440) Bool)

(assert (=> b!1320737 (= res!876591 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30437))))

(declare-fun b!1320738 () Bool)

(declare-fun res!876590 () Bool)

(assert (=> b!1320738 (=> (not res!876590) (not e!753345))))

(assert (=> b!1320738 (= res!876590 (and (= (size!43511 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43510 _keys!1609) (size!43511 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320739 () Bool)

(declare-fun res!876594 () Bool)

(assert (=> b!1320739 (=> (not res!876594) (not e!753345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320739 (= res!876594 (validKeyInArray!0 (select (arr!42960 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55679 () Bool)

(assert (=> mapIsEmpty!55679 mapRes!55679))

(declare-fun b!1320740 () Bool)

(assert (=> b!1320740 (= e!753345 (not true))))

(declare-fun lt!587052 () ListLongMap!20947)

(assert (=> b!1320740 (contains!8644 lt!587052 k0!1164)))

(declare-datatypes ((Unit!43516 0))(
  ( (Unit!43517) )
))
(declare-fun lt!587054 () Unit!43516)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!144 ((_ BitVec 64) (_ BitVec 64) V!53131 ListLongMap!20947) Unit!43516)

(assert (=> b!1320740 (= lt!587054 (lemmaInListMapAfterAddingDiffThenInBefore!144 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587052))))

(declare-fun lt!587053 () ListLongMap!20947)

(assert (=> b!1320740 (contains!8644 lt!587053 k0!1164)))

(declare-fun lt!587055 () Unit!43516)

(assert (=> b!1320740 (= lt!587055 (lemmaInListMapAfterAddingDiffThenInBefore!144 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587053))))

(declare-fun +!4548 (ListLongMap!20947 tuple2!23290) ListLongMap!20947)

(assert (=> b!1320740 (= lt!587053 (+!4548 lt!587052 (tuple2!23291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6183 (array!88972 array!88974 (_ BitVec 32) (_ BitVec 32) V!53131 V!53131 (_ BitVec 32) Int) ListLongMap!20947)

(declare-fun get!21606 (ValueCell!17112 V!53131) V!53131)

(declare-fun dynLambda!3487 (Int (_ BitVec 64)) V!53131)

(assert (=> b!1320740 (= lt!587052 (+!4548 (getCurrentListMapNoExtraKeys!6183 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23291 (select (arr!42960 _keys!1609) from!2000) (get!21606 (select (arr!42961 _values!1337) from!2000) (dynLambda!3487 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320741 () Bool)

(declare-fun res!876589 () Bool)

(assert (=> b!1320741 (=> (not res!876589) (not e!753345))))

(assert (=> b!1320741 (= res!876589 (not (= (select (arr!42960 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320742 () Bool)

(assert (=> b!1320742 (= e!753349 tp_is_empty!36021)))

(declare-fun b!1320743 () Bool)

(declare-fun res!876595 () Bool)

(assert (=> b!1320743 (=> (not res!876595) (not e!753345))))

(assert (=> b!1320743 (= res!876595 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43510 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320744 () Bool)

(declare-fun e!753347 () Bool)

(assert (=> b!1320744 (= e!753347 tp_is_empty!36021)))

(declare-fun b!1320745 () Bool)

(assert (=> b!1320745 (= e!753346 (and e!753347 mapRes!55679))))

(declare-fun condMapEmpty!55679 () Bool)

(declare-fun mapDefault!55679 () ValueCell!17112)

(assert (=> b!1320745 (= condMapEmpty!55679 (= (arr!42961 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17112)) mapDefault!55679)))))

(assert (= (and start!111544 res!876592) b!1320738))

(assert (= (and b!1320738 res!876590) b!1320736))

(assert (= (and b!1320736 res!876593) b!1320737))

(assert (= (and b!1320737 res!876591) b!1320743))

(assert (= (and b!1320743 res!876595) b!1320735))

(assert (= (and b!1320735 res!876596) b!1320741))

(assert (= (and b!1320741 res!876589) b!1320739))

(assert (= (and b!1320739 res!876594) b!1320740))

(assert (= (and b!1320745 condMapEmpty!55679) mapIsEmpty!55679))

(assert (= (and b!1320745 (not condMapEmpty!55679)) mapNonEmpty!55679))

(get-info :version)

(assert (= (and mapNonEmpty!55679 ((_ is ValueCellFull!17112) mapValue!55679)) b!1320742))

(assert (= (and b!1320745 ((_ is ValueCellFull!17112) mapDefault!55679)) b!1320744))

(assert (= start!111544 b!1320745))

(declare-fun b_lambda!23527 () Bool)

(assert (=> (not b_lambda!23527) (not b!1320740)))

(declare-fun t!44188 () Bool)

(declare-fun tb!11553 () Bool)

(assert (=> (and start!111544 (= defaultEntry!1340 defaultEntry!1340) t!44188) tb!11553))

(declare-fun result!24161 () Bool)

(assert (=> tb!11553 (= result!24161 tp_is_empty!36021)))

(assert (=> b!1320740 t!44188))

(declare-fun b_and!48563 () Bool)

(assert (= b_and!48561 (and (=> t!44188 result!24161) b_and!48563)))

(declare-fun m!1208491 () Bool)

(assert (=> b!1320735 m!1208491))

(assert (=> b!1320735 m!1208491))

(declare-fun m!1208493 () Bool)

(assert (=> b!1320735 m!1208493))

(declare-fun m!1208495 () Bool)

(assert (=> b!1320737 m!1208495))

(declare-fun m!1208497 () Bool)

(assert (=> start!111544 m!1208497))

(declare-fun m!1208499 () Bool)

(assert (=> start!111544 m!1208499))

(declare-fun m!1208501 () Bool)

(assert (=> start!111544 m!1208501))

(declare-fun m!1208503 () Bool)

(assert (=> b!1320736 m!1208503))

(declare-fun m!1208505 () Bool)

(assert (=> b!1320740 m!1208505))

(declare-fun m!1208507 () Bool)

(assert (=> b!1320740 m!1208507))

(declare-fun m!1208509 () Bool)

(assert (=> b!1320740 m!1208509))

(assert (=> b!1320740 m!1208507))

(declare-fun m!1208511 () Bool)

(assert (=> b!1320740 m!1208511))

(declare-fun m!1208513 () Bool)

(assert (=> b!1320740 m!1208513))

(declare-fun m!1208515 () Bool)

(assert (=> b!1320740 m!1208515))

(declare-fun m!1208517 () Bool)

(assert (=> b!1320740 m!1208517))

(assert (=> b!1320740 m!1208517))

(assert (=> b!1320740 m!1208509))

(declare-fun m!1208519 () Bool)

(assert (=> b!1320740 m!1208519))

(declare-fun m!1208521 () Bool)

(assert (=> b!1320740 m!1208521))

(declare-fun m!1208523 () Bool)

(assert (=> b!1320740 m!1208523))

(declare-fun m!1208525 () Bool)

(assert (=> b!1320740 m!1208525))

(declare-fun m!1208527 () Bool)

(assert (=> mapNonEmpty!55679 m!1208527))

(assert (=> b!1320739 m!1208521))

(assert (=> b!1320739 m!1208521))

(declare-fun m!1208529 () Bool)

(assert (=> b!1320739 m!1208529))

(assert (=> b!1320741 m!1208521))

(check-sat (not b!1320736) (not b!1320739) (not start!111544) tp_is_empty!36021 (not b_next!30201) (not mapNonEmpty!55679) (not b!1320740) (not b_lambda!23527) b_and!48563 (not b!1320737) (not b!1320735))
(check-sat b_and!48563 (not b_next!30201))
