; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111676 () Bool)

(assert start!111676)

(declare-fun b_free!30109 () Bool)

(declare-fun b_next!30109 () Bool)

(assert (=> start!111676 (= b_free!30109 (not b_next!30109))))

(declare-fun tp!105802 () Bool)

(declare-fun b_and!48379 () Bool)

(assert (=> start!111676 (= tp!105802 b_and!48379)))

(declare-fun b!1320424 () Bool)

(declare-fun res!876004 () Bool)

(declare-fun e!753499 () Bool)

(assert (=> b!1320424 (=> (not res!876004) (not e!753499))))

(declare-datatypes ((array!88871 0))(
  ( (array!88872 (arr!42905 (Array (_ BitVec 32) (_ BitVec 64))) (size!43456 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88871)

(declare-datatypes ((List!30410 0))(
  ( (Nil!30407) (Cons!30406 (h!31624 (_ BitVec 64)) (t!44060 List!30410)) )
))
(declare-fun arrayNoDuplicates!0 (array!88871 (_ BitVec 32) List!30410) Bool)

(assert (=> b!1320424 (= res!876004 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30407))))

(declare-fun b!1320425 () Bool)

(declare-fun res!876006 () Bool)

(assert (=> b!1320425 (=> (not res!876006) (not e!753499))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320425 (= res!876006 (validKeyInArray!0 (select (arr!42905 _keys!1609) from!2000)))))

(declare-fun b!1320426 () Bool)

(declare-fun e!753501 () Bool)

(declare-fun tp_is_empty!35929 () Bool)

(assert (=> b!1320426 (= e!753501 tp_is_empty!35929)))

(declare-fun b!1320427 () Bool)

(assert (=> b!1320427 (= e!753499 (not true))))

(declare-datatypes ((V!53009 0))(
  ( (V!53010 (val!18039 Int)) )
))
(declare-datatypes ((tuple2!23250 0))(
  ( (tuple2!23251 (_1!11636 (_ BitVec 64)) (_2!11636 V!53009)) )
))
(declare-datatypes ((List!30411 0))(
  ( (Nil!30408) (Cons!30407 (h!31625 tuple2!23250) (t!44061 List!30411)) )
))
(declare-datatypes ((ListLongMap!20915 0))(
  ( (ListLongMap!20916 (toList!10473 List!30411)) )
))
(declare-fun lt!587063 () ListLongMap!20915)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8640 (ListLongMap!20915 (_ BitVec 64)) Bool)

(assert (=> b!1320427 (contains!8640 lt!587063 k0!1164)))

(declare-fun minValue!1279 () V!53009)

(declare-datatypes ((Unit!43409 0))(
  ( (Unit!43410) )
))
(declare-fun lt!587062 () Unit!43409)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!116 ((_ BitVec 64) (_ BitVec 64) V!53009 ListLongMap!20915) Unit!43409)

(assert (=> b!1320427 (= lt!587062 (lemmaInListMapAfterAddingDiffThenInBefore!116 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587063))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53009)

(declare-datatypes ((ValueCell!17066 0))(
  ( (ValueCellFull!17066 (v!20664 V!53009)) (EmptyCell!17066) )
))
(declare-datatypes ((array!88873 0))(
  ( (array!88874 (arr!42906 (Array (_ BitVec 32) ValueCell!17066)) (size!43457 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88873)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4561 (ListLongMap!20915 tuple2!23250) ListLongMap!20915)

(declare-fun getCurrentListMapNoExtraKeys!6200 (array!88871 array!88873 (_ BitVec 32) (_ BitVec 32) V!53009 V!53009 (_ BitVec 32) Int) ListLongMap!20915)

(declare-fun get!21592 (ValueCell!17066 V!53009) V!53009)

(declare-fun dynLambda!3515 (Int (_ BitVec 64)) V!53009)

(assert (=> b!1320427 (= lt!587063 (+!4561 (+!4561 (getCurrentListMapNoExtraKeys!6200 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23251 (select (arr!42905 _keys!1609) from!2000) (get!21592 (select (arr!42906 _values!1337) from!2000) (dynLambda!3515 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320428 () Bool)

(declare-fun e!753498 () Bool)

(assert (=> b!1320428 (= e!753498 tp_is_empty!35929)))

(declare-fun mapNonEmpty!55541 () Bool)

(declare-fun mapRes!55541 () Bool)

(declare-fun tp!105803 () Bool)

(assert (=> mapNonEmpty!55541 (= mapRes!55541 (and tp!105803 e!753501))))

(declare-fun mapKey!55541 () (_ BitVec 32))

(declare-fun mapValue!55541 () ValueCell!17066)

(declare-fun mapRest!55541 () (Array (_ BitVec 32) ValueCell!17066))

(assert (=> mapNonEmpty!55541 (= (arr!42906 _values!1337) (store mapRest!55541 mapKey!55541 mapValue!55541))))

(declare-fun mapIsEmpty!55541 () Bool)

(assert (=> mapIsEmpty!55541 mapRes!55541))

(declare-fun b!1320429 () Bool)

(declare-fun res!876008 () Bool)

(assert (=> b!1320429 (=> (not res!876008) (not e!753499))))

(assert (=> b!1320429 (= res!876008 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43456 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320430 () Bool)

(declare-fun res!876010 () Bool)

(assert (=> b!1320430 (=> (not res!876010) (not e!753499))))

(assert (=> b!1320430 (= res!876010 (not (= (select (arr!42905 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320431 () Bool)

(declare-fun res!876005 () Bool)

(assert (=> b!1320431 (=> (not res!876005) (not e!753499))))

(assert (=> b!1320431 (= res!876005 (and (= (size!43457 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43456 _keys!1609) (size!43457 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!876007 () Bool)

(assert (=> start!111676 (=> (not res!876007) (not e!753499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111676 (= res!876007 (validMask!0 mask!2019))))

(assert (=> start!111676 e!753499))

(declare-fun array_inv!32665 (array!88871) Bool)

(assert (=> start!111676 (array_inv!32665 _keys!1609)))

(assert (=> start!111676 true))

(assert (=> start!111676 tp_is_empty!35929))

(declare-fun e!753500 () Bool)

(declare-fun array_inv!32666 (array!88873) Bool)

(assert (=> start!111676 (and (array_inv!32666 _values!1337) e!753500)))

(assert (=> start!111676 tp!105802))

(declare-fun b!1320432 () Bool)

(declare-fun res!876009 () Bool)

(assert (=> b!1320432 (=> (not res!876009) (not e!753499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88871 (_ BitVec 32)) Bool)

(assert (=> b!1320432 (= res!876009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320433 () Bool)

(declare-fun res!876003 () Bool)

(assert (=> b!1320433 (=> (not res!876003) (not e!753499))))

(declare-fun getCurrentListMap!5473 (array!88871 array!88873 (_ BitVec 32) (_ BitVec 32) V!53009 V!53009 (_ BitVec 32) Int) ListLongMap!20915)

(assert (=> b!1320433 (= res!876003 (contains!8640 (getCurrentListMap!5473 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320434 () Bool)

(assert (=> b!1320434 (= e!753500 (and e!753498 mapRes!55541))))

(declare-fun condMapEmpty!55541 () Bool)

(declare-fun mapDefault!55541 () ValueCell!17066)

(assert (=> b!1320434 (= condMapEmpty!55541 (= (arr!42906 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17066)) mapDefault!55541)))))

(assert (= (and start!111676 res!876007) b!1320431))

(assert (= (and b!1320431 res!876005) b!1320432))

(assert (= (and b!1320432 res!876009) b!1320424))

(assert (= (and b!1320424 res!876004) b!1320429))

(assert (= (and b!1320429 res!876008) b!1320433))

(assert (= (and b!1320433 res!876003) b!1320430))

(assert (= (and b!1320430 res!876010) b!1320425))

(assert (= (and b!1320425 res!876006) b!1320427))

(assert (= (and b!1320434 condMapEmpty!55541) mapIsEmpty!55541))

(assert (= (and b!1320434 (not condMapEmpty!55541)) mapNonEmpty!55541))

(get-info :version)

(assert (= (and mapNonEmpty!55541 ((_ is ValueCellFull!17066) mapValue!55541)) b!1320426))

(assert (= (and b!1320434 ((_ is ValueCellFull!17066) mapDefault!55541)) b!1320428))

(assert (= start!111676 b!1320434))

(declare-fun b_lambda!23429 () Bool)

(assert (=> (not b_lambda!23429) (not b!1320427)))

(declare-fun t!44059 () Bool)

(declare-fun tb!11453 () Bool)

(assert (=> (and start!111676 (= defaultEntry!1340 defaultEntry!1340) t!44059) tb!11453))

(declare-fun result!23969 () Bool)

(assert (=> tb!11453 (= result!23969 tp_is_empty!35929)))

(assert (=> b!1320427 t!44059))

(declare-fun b_and!48381 () Bool)

(assert (= b_and!48379 (and (=> t!44059 result!23969) b_and!48381)))

(declare-fun m!1208309 () Bool)

(assert (=> b!1320430 m!1208309))

(declare-fun m!1208311 () Bool)

(assert (=> mapNonEmpty!55541 m!1208311))

(declare-fun m!1208313 () Bool)

(assert (=> b!1320432 m!1208313))

(declare-fun m!1208315 () Bool)

(assert (=> b!1320427 m!1208315))

(declare-fun m!1208317 () Bool)

(assert (=> b!1320427 m!1208317))

(declare-fun m!1208319 () Bool)

(assert (=> b!1320427 m!1208319))

(assert (=> b!1320427 m!1208315))

(declare-fun m!1208321 () Bool)

(assert (=> b!1320427 m!1208321))

(declare-fun m!1208323 () Bool)

(assert (=> b!1320427 m!1208323))

(assert (=> b!1320427 m!1208321))

(declare-fun m!1208325 () Bool)

(assert (=> b!1320427 m!1208325))

(assert (=> b!1320427 m!1208323))

(assert (=> b!1320427 m!1208319))

(declare-fun m!1208327 () Bool)

(assert (=> b!1320427 m!1208327))

(assert (=> b!1320427 m!1208309))

(declare-fun m!1208329 () Bool)

(assert (=> b!1320427 m!1208329))

(declare-fun m!1208331 () Bool)

(assert (=> start!111676 m!1208331))

(declare-fun m!1208333 () Bool)

(assert (=> start!111676 m!1208333))

(declare-fun m!1208335 () Bool)

(assert (=> start!111676 m!1208335))

(declare-fun m!1208337 () Bool)

(assert (=> b!1320433 m!1208337))

(assert (=> b!1320433 m!1208337))

(declare-fun m!1208339 () Bool)

(assert (=> b!1320433 m!1208339))

(declare-fun m!1208341 () Bool)

(assert (=> b!1320424 m!1208341))

(assert (=> b!1320425 m!1208309))

(assert (=> b!1320425 m!1208309))

(declare-fun m!1208343 () Bool)

(assert (=> b!1320425 m!1208343))

(check-sat (not b_lambda!23429) tp_is_empty!35929 (not mapNonEmpty!55541) (not b!1320427) (not b_next!30109) (not b!1320424) (not b!1320425) (not b!1320433) b_and!48381 (not start!111676) (not b!1320432))
(check-sat b_and!48381 (not b_next!30109))
