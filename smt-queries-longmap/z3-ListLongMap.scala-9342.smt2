; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111490 () Bool)

(assert start!111490)

(declare-fun b_free!30147 () Bool)

(declare-fun b_next!30147 () Bool)

(assert (=> start!111490 (= b_free!30147 (not b_next!30147))))

(declare-fun tp!105916 () Bool)

(declare-fun b_and!48453 () Bool)

(assert (=> start!111490 (= tp!105916 b_and!48453)))

(declare-fun b!1319790 () Bool)

(declare-fun res!875945 () Bool)

(declare-fun e!752941 () Bool)

(assert (=> b!1319790 (=> (not res!875945) (not e!752941))))

(declare-datatypes ((array!88870 0))(
  ( (array!88871 (arr!42909 (Array (_ BitVec 32) (_ BitVec 64))) (size!43459 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88870)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53059 0))(
  ( (V!53060 (val!18058 Int)) )
))
(declare-datatypes ((ValueCell!17085 0))(
  ( (ValueCellFull!17085 (v!20688 V!53059)) (EmptyCell!17085) )
))
(declare-datatypes ((array!88872 0))(
  ( (array!88873 (arr!42910 (Array (_ BitVec 32) ValueCell!17085)) (size!43460 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88872)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319790 (= res!875945 (and (= (size!43460 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43459 _keys!1609) (size!43460 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319791 () Bool)

(declare-fun res!875941 () Bool)

(assert (=> b!1319791 (=> (not res!875941) (not e!752941))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53059)

(declare-fun minValue!1279 () V!53059)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23246 0))(
  ( (tuple2!23247 (_1!11634 (_ BitVec 64)) (_2!11634 V!53059)) )
))
(declare-datatypes ((List!30398 0))(
  ( (Nil!30395) (Cons!30394 (h!31603 tuple2!23246) (t!44094 List!30398)) )
))
(declare-datatypes ((ListLongMap!20903 0))(
  ( (ListLongMap!20904 (toList!10467 List!30398)) )
))
(declare-fun contains!8622 (ListLongMap!20903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5475 (array!88870 array!88872 (_ BitVec 32) (_ BitVec 32) V!53059 V!53059 (_ BitVec 32) Int) ListLongMap!20903)

(assert (=> b!1319791 (= res!875941 (contains!8622 (getCurrentListMap!5475 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55598 () Bool)

(declare-fun mapRes!55598 () Bool)

(declare-fun tp!105917 () Bool)

(declare-fun e!752943 () Bool)

(assert (=> mapNonEmpty!55598 (= mapRes!55598 (and tp!105917 e!752943))))

(declare-fun mapKey!55598 () (_ BitVec 32))

(declare-fun mapValue!55598 () ValueCell!17085)

(declare-fun mapRest!55598 () (Array (_ BitVec 32) ValueCell!17085))

(assert (=> mapNonEmpty!55598 (= (arr!42910 _values!1337) (store mapRest!55598 mapKey!55598 mapValue!55598))))

(declare-fun b!1319792 () Bool)

(declare-fun res!875943 () Bool)

(assert (=> b!1319792 (=> (not res!875943) (not e!752941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88870 (_ BitVec 32)) Bool)

(assert (=> b!1319792 (= res!875943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55598 () Bool)

(assert (=> mapIsEmpty!55598 mapRes!55598))

(declare-fun res!875944 () Bool)

(assert (=> start!111490 (=> (not res!875944) (not e!752941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111490 (= res!875944 (validMask!0 mask!2019))))

(assert (=> start!111490 e!752941))

(declare-fun array_inv!32397 (array!88870) Bool)

(assert (=> start!111490 (array_inv!32397 _keys!1609)))

(assert (=> start!111490 true))

(declare-fun tp_is_empty!35967 () Bool)

(assert (=> start!111490 tp_is_empty!35967))

(declare-fun e!752942 () Bool)

(declare-fun array_inv!32398 (array!88872) Bool)

(assert (=> start!111490 (and (array_inv!32398 _values!1337) e!752942)))

(assert (=> start!111490 tp!105916))

(declare-fun b!1319793 () Bool)

(declare-fun e!752940 () Bool)

(assert (=> b!1319793 (= e!752940 tp_is_empty!35967)))

(declare-fun b!1319794 () Bool)

(declare-fun res!875946 () Bool)

(assert (=> b!1319794 (=> (not res!875946) (not e!752941))))

(assert (=> b!1319794 (= res!875946 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43459 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319795 () Bool)

(declare-fun res!875948 () Bool)

(assert (=> b!1319795 (=> (not res!875948) (not e!752941))))

(assert (=> b!1319795 (= res!875948 (not (= (select (arr!42909 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319796 () Bool)

(assert (=> b!1319796 (= e!752943 tp_is_empty!35967)))

(declare-fun b!1319797 () Bool)

(declare-fun res!875942 () Bool)

(assert (=> b!1319797 (=> (not res!875942) (not e!752941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319797 (= res!875942 (validKeyInArray!0 (select (arr!42909 _keys!1609) from!2000)))))

(declare-fun b!1319798 () Bool)

(assert (=> b!1319798 (= e!752942 (and e!752940 mapRes!55598))))

(declare-fun condMapEmpty!55598 () Bool)

(declare-fun mapDefault!55598 () ValueCell!17085)

(assert (=> b!1319798 (= condMapEmpty!55598 (= (arr!42910 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17085)) mapDefault!55598)))))

(declare-fun b!1319799 () Bool)

(declare-fun res!875947 () Bool)

(assert (=> b!1319799 (=> (not res!875947) (not e!752941))))

(declare-datatypes ((List!30399 0))(
  ( (Nil!30396) (Cons!30395 (h!31604 (_ BitVec 64)) (t!44095 List!30399)) )
))
(declare-fun arrayNoDuplicates!0 (array!88870 (_ BitVec 32) List!30399) Bool)

(assert (=> b!1319799 (= res!875947 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30396))))

(declare-fun b!1319800 () Bool)

(assert (=> b!1319800 (= e!752941 (not true))))

(declare-fun lt!586731 () ListLongMap!20903)

(assert (=> b!1319800 (contains!8622 lt!586731 k0!1164)))

(declare-datatypes ((Unit!43472 0))(
  ( (Unit!43473) )
))
(declare-fun lt!586730 () Unit!43472)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!122 ((_ BitVec 64) (_ BitVec 64) V!53059 ListLongMap!20903) Unit!43472)

(assert (=> b!1319800 (= lt!586730 (lemmaInListMapAfterAddingDiffThenInBefore!122 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586731))))

(declare-fun lt!586728 () ListLongMap!20903)

(assert (=> b!1319800 (contains!8622 lt!586728 k0!1164)))

(declare-fun lt!586729 () Unit!43472)

(assert (=> b!1319800 (= lt!586729 (lemmaInListMapAfterAddingDiffThenInBefore!122 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586728))))

(declare-fun +!4526 (ListLongMap!20903 tuple2!23246) ListLongMap!20903)

(assert (=> b!1319800 (= lt!586728 (+!4526 lt!586731 (tuple2!23247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6161 (array!88870 array!88872 (_ BitVec 32) (_ BitVec 32) V!53059 V!53059 (_ BitVec 32) Int) ListLongMap!20903)

(declare-fun get!21566 (ValueCell!17085 V!53059) V!53059)

(declare-fun dynLambda!3465 (Int (_ BitVec 64)) V!53059)

(assert (=> b!1319800 (= lt!586731 (+!4526 (getCurrentListMapNoExtraKeys!6161 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23247 (select (arr!42909 _keys!1609) from!2000) (get!21566 (select (arr!42910 _values!1337) from!2000) (dynLambda!3465 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!111490 res!875944) b!1319790))

(assert (= (and b!1319790 res!875945) b!1319792))

(assert (= (and b!1319792 res!875943) b!1319799))

(assert (= (and b!1319799 res!875947) b!1319794))

(assert (= (and b!1319794 res!875946) b!1319791))

(assert (= (and b!1319791 res!875941) b!1319795))

(assert (= (and b!1319795 res!875948) b!1319797))

(assert (= (and b!1319797 res!875942) b!1319800))

(assert (= (and b!1319798 condMapEmpty!55598) mapIsEmpty!55598))

(assert (= (and b!1319798 (not condMapEmpty!55598)) mapNonEmpty!55598))

(get-info :version)

(assert (= (and mapNonEmpty!55598 ((_ is ValueCellFull!17085) mapValue!55598)) b!1319796))

(assert (= (and b!1319798 ((_ is ValueCellFull!17085) mapDefault!55598)) b!1319793))

(assert (= start!111490 b!1319798))

(declare-fun b_lambda!23473 () Bool)

(assert (=> (not b_lambda!23473) (not b!1319800)))

(declare-fun t!44093 () Bool)

(declare-fun tb!11499 () Bool)

(assert (=> (and start!111490 (= defaultEntry!1340 defaultEntry!1340) t!44093) tb!11499))

(declare-fun result!24053 () Bool)

(assert (=> tb!11499 (= result!24053 tp_is_empty!35967)))

(assert (=> b!1319800 t!44093))

(declare-fun b_and!48455 () Bool)

(assert (= b_and!48453 (and (=> t!44093 result!24053) b_and!48455)))

(declare-fun m!1207411 () Bool)

(assert (=> mapNonEmpty!55598 m!1207411))

(declare-fun m!1207413 () Bool)

(assert (=> start!111490 m!1207413))

(declare-fun m!1207415 () Bool)

(assert (=> start!111490 m!1207415))

(declare-fun m!1207417 () Bool)

(assert (=> start!111490 m!1207417))

(declare-fun m!1207419 () Bool)

(assert (=> b!1319791 m!1207419))

(assert (=> b!1319791 m!1207419))

(declare-fun m!1207421 () Bool)

(assert (=> b!1319791 m!1207421))

(declare-fun m!1207423 () Bool)

(assert (=> b!1319800 m!1207423))

(declare-fun m!1207425 () Bool)

(assert (=> b!1319800 m!1207425))

(declare-fun m!1207427 () Bool)

(assert (=> b!1319800 m!1207427))

(assert (=> b!1319800 m!1207423))

(declare-fun m!1207429 () Bool)

(assert (=> b!1319800 m!1207429))

(declare-fun m!1207431 () Bool)

(assert (=> b!1319800 m!1207431))

(declare-fun m!1207433 () Bool)

(assert (=> b!1319800 m!1207433))

(declare-fun m!1207435 () Bool)

(assert (=> b!1319800 m!1207435))

(assert (=> b!1319800 m!1207433))

(assert (=> b!1319800 m!1207427))

(declare-fun m!1207437 () Bool)

(assert (=> b!1319800 m!1207437))

(declare-fun m!1207439 () Bool)

(assert (=> b!1319800 m!1207439))

(declare-fun m!1207441 () Bool)

(assert (=> b!1319800 m!1207441))

(declare-fun m!1207443 () Bool)

(assert (=> b!1319800 m!1207443))

(declare-fun m!1207445 () Bool)

(assert (=> b!1319799 m!1207445))

(assert (=> b!1319797 m!1207441))

(assert (=> b!1319797 m!1207441))

(declare-fun m!1207447 () Bool)

(assert (=> b!1319797 m!1207447))

(declare-fun m!1207449 () Bool)

(assert (=> b!1319792 m!1207449))

(assert (=> b!1319795 m!1207441))

(check-sat (not b_next!30147) (not b!1319797) b_and!48455 (not b!1319800) (not b_lambda!23473) (not start!111490) tp_is_empty!35967 (not b!1319791) (not b!1319799) (not b!1319792) (not mapNonEmpty!55598))
(check-sat b_and!48455 (not b_next!30147))
