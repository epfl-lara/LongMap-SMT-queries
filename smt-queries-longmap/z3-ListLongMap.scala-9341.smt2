; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111484 () Bool)

(assert start!111484)

(declare-fun b_free!30141 () Bool)

(declare-fun b_next!30141 () Bool)

(assert (=> start!111484 (= b_free!30141 (not b_next!30141))))

(declare-fun tp!105898 () Bool)

(declare-fun b_and!48441 () Bool)

(assert (=> start!111484 (= tp!105898 b_and!48441)))

(declare-fun b!1319685 () Bool)

(declare-fun e!752899 () Bool)

(assert (=> b!1319685 (= e!752899 (not true))))

(declare-datatypes ((V!53051 0))(
  ( (V!53052 (val!18055 Int)) )
))
(declare-datatypes ((tuple2!23242 0))(
  ( (tuple2!23243 (_1!11632 (_ BitVec 64)) (_2!11632 V!53051)) )
))
(declare-datatypes ((List!30394 0))(
  ( (Nil!30391) (Cons!30390 (h!31599 tuple2!23242) (t!44084 List!30394)) )
))
(declare-datatypes ((ListLongMap!20899 0))(
  ( (ListLongMap!20900 (toList!10465 List!30394)) )
))
(declare-fun lt!586692 () ListLongMap!20899)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8620 (ListLongMap!20899 (_ BitVec 64)) Bool)

(assert (=> b!1319685 (contains!8620 lt!586692 k0!1164)))

(declare-fun zeroValue!1279 () V!53051)

(declare-datatypes ((Unit!43468 0))(
  ( (Unit!43469) )
))
(declare-fun lt!586694 () Unit!43468)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!120 ((_ BitVec 64) (_ BitVec 64) V!53051 ListLongMap!20899) Unit!43468)

(assert (=> b!1319685 (= lt!586694 (lemmaInListMapAfterAddingDiffThenInBefore!120 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586692))))

(declare-fun lt!586695 () ListLongMap!20899)

(assert (=> b!1319685 (contains!8620 lt!586695 k0!1164)))

(declare-fun lt!586693 () Unit!43468)

(declare-fun minValue!1279 () V!53051)

(assert (=> b!1319685 (= lt!586693 (lemmaInListMapAfterAddingDiffThenInBefore!120 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586695))))

(declare-fun +!4524 (ListLongMap!20899 tuple2!23242) ListLongMap!20899)

(assert (=> b!1319685 (= lt!586695 (+!4524 lt!586692 (tuple2!23243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88860 0))(
  ( (array!88861 (arr!42904 (Array (_ BitVec 32) (_ BitVec 64))) (size!43454 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88860)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17082 0))(
  ( (ValueCellFull!17082 (v!20685 V!53051)) (EmptyCell!17082) )
))
(declare-datatypes ((array!88862 0))(
  ( (array!88863 (arr!42905 (Array (_ BitVec 32) ValueCell!17082)) (size!43455 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88862)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6159 (array!88860 array!88862 (_ BitVec 32) (_ BitVec 32) V!53051 V!53051 (_ BitVec 32) Int) ListLongMap!20899)

(declare-fun get!21562 (ValueCell!17082 V!53051) V!53051)

(declare-fun dynLambda!3463 (Int (_ BitVec 64)) V!53051)

(assert (=> b!1319685 (= lt!586692 (+!4524 (getCurrentListMapNoExtraKeys!6159 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23243 (select (arr!42904 _keys!1609) from!2000) (get!21562 (select (arr!42905 _values!1337) from!2000) (dynLambda!3463 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319686 () Bool)

(declare-fun e!752897 () Bool)

(declare-fun tp_is_empty!35961 () Bool)

(assert (=> b!1319686 (= e!752897 tp_is_empty!35961)))

(declare-fun b!1319687 () Bool)

(declare-fun e!752895 () Bool)

(declare-fun mapRes!55589 () Bool)

(assert (=> b!1319687 (= e!752895 (and e!752897 mapRes!55589))))

(declare-fun condMapEmpty!55589 () Bool)

(declare-fun mapDefault!55589 () ValueCell!17082)

(assert (=> b!1319687 (= condMapEmpty!55589 (= (arr!42905 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17082)) mapDefault!55589)))))

(declare-fun mapIsEmpty!55589 () Bool)

(assert (=> mapIsEmpty!55589 mapRes!55589))

(declare-fun b!1319688 () Bool)

(declare-fun res!875874 () Bool)

(assert (=> b!1319688 (=> (not res!875874) (not e!752899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319688 (= res!875874 (validKeyInArray!0 (select (arr!42904 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55589 () Bool)

(declare-fun tp!105899 () Bool)

(declare-fun e!752896 () Bool)

(assert (=> mapNonEmpty!55589 (= mapRes!55589 (and tp!105899 e!752896))))

(declare-fun mapRest!55589 () (Array (_ BitVec 32) ValueCell!17082))

(declare-fun mapValue!55589 () ValueCell!17082)

(declare-fun mapKey!55589 () (_ BitVec 32))

(assert (=> mapNonEmpty!55589 (= (arr!42905 _values!1337) (store mapRest!55589 mapKey!55589 mapValue!55589))))

(declare-fun res!875876 () Bool)

(assert (=> start!111484 (=> (not res!875876) (not e!752899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111484 (= res!875876 (validMask!0 mask!2019))))

(assert (=> start!111484 e!752899))

(declare-fun array_inv!32393 (array!88860) Bool)

(assert (=> start!111484 (array_inv!32393 _keys!1609)))

(assert (=> start!111484 true))

(assert (=> start!111484 tp_is_empty!35961))

(declare-fun array_inv!32394 (array!88862) Bool)

(assert (=> start!111484 (and (array_inv!32394 _values!1337) e!752895)))

(assert (=> start!111484 tp!105898))

(declare-fun b!1319689 () Bool)

(declare-fun res!875873 () Bool)

(assert (=> b!1319689 (=> (not res!875873) (not e!752899))))

(assert (=> b!1319689 (= res!875873 (not (= (select (arr!42904 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319690 () Bool)

(assert (=> b!1319690 (= e!752896 tp_is_empty!35961)))

(declare-fun b!1319691 () Bool)

(declare-fun res!875870 () Bool)

(assert (=> b!1319691 (=> (not res!875870) (not e!752899))))

(declare-datatypes ((List!30395 0))(
  ( (Nil!30392) (Cons!30391 (h!31600 (_ BitVec 64)) (t!44085 List!30395)) )
))
(declare-fun arrayNoDuplicates!0 (array!88860 (_ BitVec 32) List!30395) Bool)

(assert (=> b!1319691 (= res!875870 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30392))))

(declare-fun b!1319692 () Bool)

(declare-fun res!875869 () Bool)

(assert (=> b!1319692 (=> (not res!875869) (not e!752899))))

(assert (=> b!1319692 (= res!875869 (and (= (size!43455 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43454 _keys!1609) (size!43455 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319693 () Bool)

(declare-fun res!875875 () Bool)

(assert (=> b!1319693 (=> (not res!875875) (not e!752899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88860 (_ BitVec 32)) Bool)

(assert (=> b!1319693 (= res!875875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319694 () Bool)

(declare-fun res!875872 () Bool)

(assert (=> b!1319694 (=> (not res!875872) (not e!752899))))

(declare-fun getCurrentListMap!5473 (array!88860 array!88862 (_ BitVec 32) (_ BitVec 32) V!53051 V!53051 (_ BitVec 32) Int) ListLongMap!20899)

(assert (=> b!1319694 (= res!875872 (contains!8620 (getCurrentListMap!5473 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319695 () Bool)

(declare-fun res!875871 () Bool)

(assert (=> b!1319695 (=> (not res!875871) (not e!752899))))

(assert (=> b!1319695 (= res!875871 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43454 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111484 res!875876) b!1319692))

(assert (= (and b!1319692 res!875869) b!1319693))

(assert (= (and b!1319693 res!875875) b!1319691))

(assert (= (and b!1319691 res!875870) b!1319695))

(assert (= (and b!1319695 res!875871) b!1319694))

(assert (= (and b!1319694 res!875872) b!1319689))

(assert (= (and b!1319689 res!875873) b!1319688))

(assert (= (and b!1319688 res!875874) b!1319685))

(assert (= (and b!1319687 condMapEmpty!55589) mapIsEmpty!55589))

(assert (= (and b!1319687 (not condMapEmpty!55589)) mapNonEmpty!55589))

(get-info :version)

(assert (= (and mapNonEmpty!55589 ((_ is ValueCellFull!17082) mapValue!55589)) b!1319690))

(assert (= (and b!1319687 ((_ is ValueCellFull!17082) mapDefault!55589)) b!1319686))

(assert (= start!111484 b!1319687))

(declare-fun b_lambda!23467 () Bool)

(assert (=> (not b_lambda!23467) (not b!1319685)))

(declare-fun t!44083 () Bool)

(declare-fun tb!11493 () Bool)

(assert (=> (and start!111484 (= defaultEntry!1340 defaultEntry!1340) t!44083) tb!11493))

(declare-fun result!24041 () Bool)

(assert (=> tb!11493 (= result!24041 tp_is_empty!35961)))

(assert (=> b!1319685 t!44083))

(declare-fun b_and!48443 () Bool)

(assert (= b_and!48441 (and (=> t!44083 result!24041) b_and!48443)))

(declare-fun m!1207291 () Bool)

(assert (=> b!1319693 m!1207291))

(declare-fun m!1207293 () Bool)

(assert (=> b!1319691 m!1207293))

(declare-fun m!1207295 () Bool)

(assert (=> b!1319685 m!1207295))

(declare-fun m!1207297 () Bool)

(assert (=> b!1319685 m!1207297))

(declare-fun m!1207299 () Bool)

(assert (=> b!1319685 m!1207299))

(declare-fun m!1207301 () Bool)

(assert (=> b!1319685 m!1207301))

(declare-fun m!1207303 () Bool)

(assert (=> b!1319685 m!1207303))

(assert (=> b!1319685 m!1207299))

(declare-fun m!1207305 () Bool)

(assert (=> b!1319685 m!1207305))

(declare-fun m!1207307 () Bool)

(assert (=> b!1319685 m!1207307))

(declare-fun m!1207309 () Bool)

(assert (=> b!1319685 m!1207309))

(declare-fun m!1207311 () Bool)

(assert (=> b!1319685 m!1207311))

(assert (=> b!1319685 m!1207297))

(declare-fun m!1207313 () Bool)

(assert (=> b!1319685 m!1207313))

(assert (=> b!1319685 m!1207303))

(declare-fun m!1207315 () Bool)

(assert (=> b!1319685 m!1207315))

(assert (=> b!1319688 m!1207307))

(assert (=> b!1319688 m!1207307))

(declare-fun m!1207317 () Bool)

(assert (=> b!1319688 m!1207317))

(assert (=> b!1319689 m!1207307))

(declare-fun m!1207319 () Bool)

(assert (=> mapNonEmpty!55589 m!1207319))

(declare-fun m!1207321 () Bool)

(assert (=> start!111484 m!1207321))

(declare-fun m!1207323 () Bool)

(assert (=> start!111484 m!1207323))

(declare-fun m!1207325 () Bool)

(assert (=> start!111484 m!1207325))

(declare-fun m!1207327 () Bool)

(assert (=> b!1319694 m!1207327))

(assert (=> b!1319694 m!1207327))

(declare-fun m!1207329 () Bool)

(assert (=> b!1319694 m!1207329))

(check-sat tp_is_empty!35961 (not b!1319693) (not mapNonEmpty!55589) (not b!1319685) b_and!48443 (not b!1319694) (not b!1319688) (not b_lambda!23467) (not start!111484) (not b_next!30141) (not b!1319691))
(check-sat b_and!48443 (not b_next!30141))
