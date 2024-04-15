; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83980 () Bool)

(assert start!83980)

(declare-fun b_free!19753 () Bool)

(declare-fun b_next!19753 () Bool)

(assert (=> start!83980 (= b_free!19753 (not b_next!19753))))

(declare-fun tp!68782 () Bool)

(declare-fun b_and!31563 () Bool)

(assert (=> start!83980 (= tp!68782 b_and!31563)))

(declare-fun b!981480 () Bool)

(declare-fun e!553280 () Bool)

(declare-fun tp_is_empty!22801 () Bool)

(assert (=> b!981480 (= e!553280 tp_is_empty!22801)))

(declare-fun b!981481 () Bool)

(declare-fun e!553275 () Bool)

(declare-fun mapRes!36230 () Bool)

(assert (=> b!981481 (= e!553275 (and e!553280 mapRes!36230))))

(declare-fun condMapEmpty!36230 () Bool)

(declare-datatypes ((V!35385 0))(
  ( (V!35386 (val!11451 Int)) )
))
(declare-datatypes ((ValueCell!10919 0))(
  ( (ValueCellFull!10919 (v!14012 V!35385)) (EmptyCell!10919) )
))
(declare-datatypes ((array!61530 0))(
  ( (array!61531 (arr!29623 (Array (_ BitVec 32) ValueCell!10919)) (size!30104 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61530)

(declare-fun mapDefault!36230 () ValueCell!10919)

(assert (=> b!981481 (= condMapEmpty!36230 (= (arr!29623 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10919)) mapDefault!36230)))))

(declare-fun b!981482 () Bool)

(declare-fun e!553276 () Bool)

(assert (=> b!981482 (= e!553276 (not true))))

(declare-datatypes ((tuple2!14732 0))(
  ( (tuple2!14733 (_1!7377 (_ BitVec 64)) (_2!7377 V!35385)) )
))
(declare-datatypes ((List!20573 0))(
  ( (Nil!20570) (Cons!20569 (h!21731 tuple2!14732) (t!29267 List!20573)) )
))
(declare-datatypes ((ListLongMap!13419 0))(
  ( (ListLongMap!13420 (toList!6725 List!20573)) )
))
(declare-fun lt!435591 () ListLongMap!13419)

(declare-fun lt!435590 () tuple2!14732)

(declare-fun lt!435593 () tuple2!14732)

(declare-fun +!3021 (ListLongMap!13419 tuple2!14732) ListLongMap!13419)

(assert (=> b!981482 (= (+!3021 (+!3021 lt!435591 lt!435590) lt!435593) (+!3021 (+!3021 lt!435591 lt!435593) lt!435590))))

(declare-fun lt!435592 () V!35385)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61532 0))(
  ( (array!61533 (arr!29624 (Array (_ BitVec 32) (_ BitVec 64))) (size!30105 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61532)

(assert (=> b!981482 (= lt!435593 (tuple2!14733 (select (arr!29624 _keys!1544) from!1932) lt!435592))))

(declare-fun zeroValue!1220 () V!35385)

(assert (=> b!981482 (= lt!435590 (tuple2!14733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32508 0))(
  ( (Unit!32509) )
))
(declare-fun lt!435594 () Unit!32508)

(declare-fun addCommutativeForDiffKeys!625 (ListLongMap!13419 (_ BitVec 64) V!35385 (_ BitVec 64) V!35385) Unit!32508)

(assert (=> b!981482 (= lt!435594 (addCommutativeForDiffKeys!625 lt!435591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29624 _keys!1544) from!1932) lt!435592))))

(declare-fun b!981483 () Bool)

(declare-fun res!656837 () Bool)

(declare-fun e!553279 () Bool)

(assert (=> b!981483 (=> (not res!656837) (not e!553279))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61532 (_ BitVec 32)) Bool)

(assert (=> b!981483 (= res!656837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981484 () Bool)

(declare-fun res!656843 () Bool)

(assert (=> b!981484 (=> (not res!656843) (not e!553279))))

(assert (=> b!981484 (= res!656843 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30105 _keys!1544))))))

(declare-fun mapIsEmpty!36230 () Bool)

(assert (=> mapIsEmpty!36230 mapRes!36230))

(declare-fun b!981485 () Bool)

(assert (=> b!981485 (= e!553279 e!553276)))

(declare-fun res!656844 () Bool)

(assert (=> b!981485 (=> (not res!656844) (not e!553276))))

(assert (=> b!981485 (= res!656844 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29624 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15368 (ValueCell!10919 V!35385) V!35385)

(declare-fun dynLambda!1768 (Int (_ BitVec 64)) V!35385)

(assert (=> b!981485 (= lt!435592 (get!15368 (select (arr!29623 _values!1278) from!1932) (dynLambda!1768 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35385)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3438 (array!61532 array!61530 (_ BitVec 32) (_ BitVec 32) V!35385 V!35385 (_ BitVec 32) Int) ListLongMap!13419)

(assert (=> b!981485 (= lt!435591 (getCurrentListMapNoExtraKeys!3438 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981486 () Bool)

(declare-fun res!656839 () Bool)

(assert (=> b!981486 (=> (not res!656839) (not e!553279))))

(declare-datatypes ((List!20574 0))(
  ( (Nil!20571) (Cons!20570 (h!21732 (_ BitVec 64)) (t!29268 List!20574)) )
))
(declare-fun arrayNoDuplicates!0 (array!61532 (_ BitVec 32) List!20574) Bool)

(assert (=> b!981486 (= res!656839 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20571))))

(declare-fun b!981487 () Bool)

(declare-fun e!553278 () Bool)

(assert (=> b!981487 (= e!553278 tp_is_empty!22801)))

(declare-fun res!656842 () Bool)

(assert (=> start!83980 (=> (not res!656842) (not e!553279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83980 (= res!656842 (validMask!0 mask!1948))))

(assert (=> start!83980 e!553279))

(assert (=> start!83980 true))

(assert (=> start!83980 tp_is_empty!22801))

(declare-fun array_inv!22925 (array!61530) Bool)

(assert (=> start!83980 (and (array_inv!22925 _values!1278) e!553275)))

(assert (=> start!83980 tp!68782))

(declare-fun array_inv!22926 (array!61532) Bool)

(assert (=> start!83980 (array_inv!22926 _keys!1544)))

(declare-fun mapNonEmpty!36230 () Bool)

(declare-fun tp!68783 () Bool)

(assert (=> mapNonEmpty!36230 (= mapRes!36230 (and tp!68783 e!553278))))

(declare-fun mapRest!36230 () (Array (_ BitVec 32) ValueCell!10919))

(declare-fun mapKey!36230 () (_ BitVec 32))

(declare-fun mapValue!36230 () ValueCell!10919)

(assert (=> mapNonEmpty!36230 (= (arr!29623 _values!1278) (store mapRest!36230 mapKey!36230 mapValue!36230))))

(declare-fun b!981488 () Bool)

(declare-fun res!656840 () Bool)

(assert (=> b!981488 (=> (not res!656840) (not e!553279))))

(assert (=> b!981488 (= res!656840 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981489 () Bool)

(declare-fun res!656841 () Bool)

(assert (=> b!981489 (=> (not res!656841) (not e!553279))))

(assert (=> b!981489 (= res!656841 (and (= (size!30104 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30105 _keys!1544) (size!30104 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981490 () Bool)

(declare-fun res!656838 () Bool)

(assert (=> b!981490 (=> (not res!656838) (not e!553279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981490 (= res!656838 (validKeyInArray!0 (select (arr!29624 _keys!1544) from!1932)))))

(assert (= (and start!83980 res!656842) b!981489))

(assert (= (and b!981489 res!656841) b!981483))

(assert (= (and b!981483 res!656837) b!981486))

(assert (= (and b!981486 res!656839) b!981484))

(assert (= (and b!981484 res!656843) b!981490))

(assert (= (and b!981490 res!656838) b!981488))

(assert (= (and b!981488 res!656840) b!981485))

(assert (= (and b!981485 res!656844) b!981482))

(assert (= (and b!981481 condMapEmpty!36230) mapIsEmpty!36230))

(assert (= (and b!981481 (not condMapEmpty!36230)) mapNonEmpty!36230))

(get-info :version)

(assert (= (and mapNonEmpty!36230 ((_ is ValueCellFull!10919) mapValue!36230)) b!981487))

(assert (= (and b!981481 ((_ is ValueCellFull!10919) mapDefault!36230)) b!981480))

(assert (= start!83980 b!981481))

(declare-fun b_lambda!14773 () Bool)

(assert (=> (not b_lambda!14773) (not b!981485)))

(declare-fun t!29266 () Bool)

(declare-fun tb!6545 () Bool)

(assert (=> (and start!83980 (= defaultEntry!1281 defaultEntry!1281) t!29266) tb!6545))

(declare-fun result!13087 () Bool)

(assert (=> tb!6545 (= result!13087 tp_is_empty!22801)))

(assert (=> b!981485 t!29266))

(declare-fun b_and!31565 () Bool)

(assert (= b_and!31563 (and (=> t!29266 result!13087) b_and!31565)))

(declare-fun m!908321 () Bool)

(assert (=> b!981486 m!908321))

(declare-fun m!908323 () Bool)

(assert (=> b!981490 m!908323))

(assert (=> b!981490 m!908323))

(declare-fun m!908325 () Bool)

(assert (=> b!981490 m!908325))

(declare-fun m!908327 () Bool)

(assert (=> mapNonEmpty!36230 m!908327))

(assert (=> b!981485 m!908323))

(declare-fun m!908329 () Bool)

(assert (=> b!981485 m!908329))

(declare-fun m!908331 () Bool)

(assert (=> b!981485 m!908331))

(declare-fun m!908333 () Bool)

(assert (=> b!981485 m!908333))

(assert (=> b!981485 m!908329))

(assert (=> b!981485 m!908333))

(declare-fun m!908335 () Bool)

(assert (=> b!981485 m!908335))

(declare-fun m!908337 () Bool)

(assert (=> start!83980 m!908337))

(declare-fun m!908339 () Bool)

(assert (=> start!83980 m!908339))

(declare-fun m!908341 () Bool)

(assert (=> start!83980 m!908341))

(assert (=> b!981482 m!908323))

(assert (=> b!981482 m!908323))

(declare-fun m!908343 () Bool)

(assert (=> b!981482 m!908343))

(declare-fun m!908345 () Bool)

(assert (=> b!981482 m!908345))

(declare-fun m!908347 () Bool)

(assert (=> b!981482 m!908347))

(assert (=> b!981482 m!908347))

(declare-fun m!908349 () Bool)

(assert (=> b!981482 m!908349))

(assert (=> b!981482 m!908345))

(declare-fun m!908351 () Bool)

(assert (=> b!981482 m!908351))

(declare-fun m!908353 () Bool)

(assert (=> b!981483 m!908353))

(check-sat (not b!981482) (not b_lambda!14773) (not b!981490) (not b!981483) (not b!981486) (not mapNonEmpty!36230) (not b_next!19753) (not b!981485) tp_is_empty!22801 (not start!83980) b_and!31565)
(check-sat b_and!31565 (not b_next!19753))
