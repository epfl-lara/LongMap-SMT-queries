; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113180 () Bool)

(assert start!113180)

(declare-fun b_free!31231 () Bool)

(declare-fun b_next!31231 () Bool)

(assert (=> start!113180 (= b_free!31231 (not b_next!31231))))

(declare-fun tp!109498 () Bool)

(declare-fun b_and!50351 () Bool)

(assert (=> start!113180 (= tp!109498 b_and!50351)))

(declare-fun b!1342213 () Bool)

(declare-fun res!890487 () Bool)

(declare-fun e!764178 () Bool)

(assert (=> b!1342213 (=> (not res!890487) (not e!764178))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91255 0))(
  ( (array!91256 (arr!44084 (Array (_ BitVec 32) (_ BitVec 64))) (size!44636 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91255)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342213 (= res!890487 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44636 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57553 () Bool)

(declare-fun mapRes!57553 () Bool)

(assert (=> mapIsEmpty!57553 mapRes!57553))

(declare-fun res!890488 () Bool)

(assert (=> start!113180 (=> (not res!890488) (not e!764178))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113180 (= res!890488 (validMask!0 mask!1977))))

(assert (=> start!113180 e!764178))

(declare-fun tp_is_empty!37231 () Bool)

(assert (=> start!113180 tp_is_empty!37231))

(assert (=> start!113180 true))

(declare-fun array_inv!33425 (array!91255) Bool)

(assert (=> start!113180 (array_inv!33425 _keys!1571)))

(declare-datatypes ((V!54745 0))(
  ( (V!54746 (val!18690 Int)) )
))
(declare-datatypes ((ValueCell!17717 0))(
  ( (ValueCellFull!17717 (v!21337 V!54745)) (EmptyCell!17717) )
))
(declare-datatypes ((array!91257 0))(
  ( (array!91258 (arr!44085 (Array (_ BitVec 32) ValueCell!17717)) (size!44637 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91257)

(declare-fun e!764179 () Bool)

(declare-fun array_inv!33426 (array!91257) Bool)

(assert (=> start!113180 (and (array_inv!33426 _values!1303) e!764179)))

(assert (=> start!113180 tp!109498))

(declare-fun b!1342214 () Bool)

(declare-fun res!890490 () Bool)

(assert (=> b!1342214 (=> (not res!890490) (not e!764178))))

(assert (=> b!1342214 (= res!890490 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342215 () Bool)

(assert (=> b!1342215 (= e!764178 (not true))))

(declare-datatypes ((tuple2!24130 0))(
  ( (tuple2!24131 (_1!12076 (_ BitVec 64)) (_2!12076 V!54745)) )
))
(declare-datatypes ((List!31277 0))(
  ( (Nil!31274) (Cons!31273 (h!32482 tuple2!24130) (t!45711 List!31277)) )
))
(declare-datatypes ((ListLongMap!21787 0))(
  ( (ListLongMap!21788 (toList!10909 List!31277)) )
))
(declare-fun lt!594235 () ListLongMap!21787)

(declare-fun contains!9014 (ListLongMap!21787 (_ BitVec 64)) Bool)

(assert (=> b!1342215 (contains!9014 lt!594235 k0!1142)))

(declare-datatypes ((Unit!43868 0))(
  ( (Unit!43869) )
))
(declare-fun lt!594237 () Unit!43868)

(declare-fun lt!594234 () V!54745)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!352 ((_ BitVec 64) (_ BitVec 64) V!54745 ListLongMap!21787) Unit!43868)

(assert (=> b!1342215 (= lt!594237 (lemmaInListMapAfterAddingDiffThenInBefore!352 k0!1142 (select (arr!44084 _keys!1571) from!1960) lt!594234 lt!594235))))

(declare-fun lt!594233 () ListLongMap!21787)

(assert (=> b!1342215 (contains!9014 lt!594233 k0!1142)))

(declare-fun zeroValue!1245 () V!54745)

(declare-fun lt!594236 () Unit!43868)

(assert (=> b!1342215 (= lt!594236 (lemmaInListMapAfterAddingDiffThenInBefore!352 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594233))))

(declare-fun +!4813 (ListLongMap!21787 tuple2!24130) ListLongMap!21787)

(assert (=> b!1342215 (= lt!594233 (+!4813 lt!594235 (tuple2!24131 (select (arr!44084 _keys!1571) from!1960) lt!594234)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22263 (ValueCell!17717 V!54745) V!54745)

(declare-fun dynLambda!3743 (Int (_ BitVec 64)) V!54745)

(assert (=> b!1342215 (= lt!594234 (get!22263 (select (arr!44085 _values!1303) from!1960) (dynLambda!3743 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54745)

(declare-fun getCurrentListMapNoExtraKeys!6456 (array!91255 array!91257 (_ BitVec 32) (_ BitVec 32) V!54745 V!54745 (_ BitVec 32) Int) ListLongMap!21787)

(assert (=> b!1342215 (= lt!594235 (getCurrentListMapNoExtraKeys!6456 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342216 () Bool)

(declare-fun res!890493 () Bool)

(assert (=> b!1342216 (=> (not res!890493) (not e!764178))))

(declare-datatypes ((List!31278 0))(
  ( (Nil!31275) (Cons!31274 (h!32483 (_ BitVec 64)) (t!45712 List!31278)) )
))
(declare-fun arrayNoDuplicates!0 (array!91255 (_ BitVec 32) List!31278) Bool)

(assert (=> b!1342216 (= res!890493 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31275))))

(declare-fun b!1342217 () Bool)

(declare-fun res!890491 () Bool)

(assert (=> b!1342217 (=> (not res!890491) (not e!764178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91255 (_ BitVec 32)) Bool)

(assert (=> b!1342217 (= res!890491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342218 () Bool)

(declare-fun res!890486 () Bool)

(assert (=> b!1342218 (=> (not res!890486) (not e!764178))))

(declare-fun getCurrentListMap!5760 (array!91255 array!91257 (_ BitVec 32) (_ BitVec 32) V!54745 V!54745 (_ BitVec 32) Int) ListLongMap!21787)

(assert (=> b!1342218 (= res!890486 (contains!9014 (getCurrentListMap!5760 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57553 () Bool)

(declare-fun tp!109499 () Bool)

(declare-fun e!764177 () Bool)

(assert (=> mapNonEmpty!57553 (= mapRes!57553 (and tp!109499 e!764177))))

(declare-fun mapValue!57553 () ValueCell!17717)

(declare-fun mapKey!57553 () (_ BitVec 32))

(declare-fun mapRest!57553 () (Array (_ BitVec 32) ValueCell!17717))

(assert (=> mapNonEmpty!57553 (= (arr!44085 _values!1303) (store mapRest!57553 mapKey!57553 mapValue!57553))))

(declare-fun b!1342219 () Bool)

(declare-fun e!764180 () Bool)

(assert (=> b!1342219 (= e!764179 (and e!764180 mapRes!57553))))

(declare-fun condMapEmpty!57553 () Bool)

(declare-fun mapDefault!57553 () ValueCell!17717)

(assert (=> b!1342219 (= condMapEmpty!57553 (= (arr!44085 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17717)) mapDefault!57553)))))

(declare-fun b!1342220 () Bool)

(declare-fun res!890489 () Bool)

(assert (=> b!1342220 (=> (not res!890489) (not e!764178))))

(assert (=> b!1342220 (= res!890489 (not (= (select (arr!44084 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342221 () Bool)

(assert (=> b!1342221 (= e!764177 tp_is_empty!37231)))

(declare-fun b!1342222 () Bool)

(assert (=> b!1342222 (= e!764180 tp_is_empty!37231)))

(declare-fun b!1342223 () Bool)

(declare-fun res!890494 () Bool)

(assert (=> b!1342223 (=> (not res!890494) (not e!764178))))

(assert (=> b!1342223 (= res!890494 (and (= (size!44637 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44636 _keys!1571) (size!44637 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342224 () Bool)

(declare-fun res!890492 () Bool)

(assert (=> b!1342224 (=> (not res!890492) (not e!764178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342224 (= res!890492 (validKeyInArray!0 (select (arr!44084 _keys!1571) from!1960)))))

(assert (= (and start!113180 res!890488) b!1342223))

(assert (= (and b!1342223 res!890494) b!1342217))

(assert (= (and b!1342217 res!890491) b!1342216))

(assert (= (and b!1342216 res!890493) b!1342213))

(assert (= (and b!1342213 res!890487) b!1342218))

(assert (= (and b!1342218 res!890486) b!1342220))

(assert (= (and b!1342220 res!890489) b!1342224))

(assert (= (and b!1342224 res!890492) b!1342214))

(assert (= (and b!1342214 res!890490) b!1342215))

(assert (= (and b!1342219 condMapEmpty!57553) mapIsEmpty!57553))

(assert (= (and b!1342219 (not condMapEmpty!57553)) mapNonEmpty!57553))

(get-info :version)

(assert (= (and mapNonEmpty!57553 ((_ is ValueCellFull!17717) mapValue!57553)) b!1342221))

(assert (= (and b!1342219 ((_ is ValueCellFull!17717) mapDefault!57553)) b!1342222))

(assert (= start!113180 b!1342219))

(declare-fun b_lambda!24397 () Bool)

(assert (=> (not b_lambda!24397) (not b!1342215)))

(declare-fun t!45710 () Bool)

(declare-fun tb!12237 () Bool)

(assert (=> (and start!113180 (= defaultEntry!1306 defaultEntry!1306) t!45710) tb!12237))

(declare-fun result!25573 () Bool)

(assert (=> tb!12237 (= result!25573 tp_is_empty!37231)))

(assert (=> b!1342215 t!45710))

(declare-fun b_and!50353 () Bool)

(assert (= b_and!50351 (and (=> t!45710 result!25573) b_and!50353)))

(declare-fun m!1229389 () Bool)

(assert (=> mapNonEmpty!57553 m!1229389))

(declare-fun m!1229391 () Bool)

(assert (=> b!1342224 m!1229391))

(assert (=> b!1342224 m!1229391))

(declare-fun m!1229393 () Bool)

(assert (=> b!1342224 m!1229393))

(declare-fun m!1229395 () Bool)

(assert (=> b!1342216 m!1229395))

(declare-fun m!1229397 () Bool)

(assert (=> b!1342215 m!1229397))

(declare-fun m!1229399 () Bool)

(assert (=> b!1342215 m!1229399))

(declare-fun m!1229401 () Bool)

(assert (=> b!1342215 m!1229401))

(assert (=> b!1342215 m!1229397))

(declare-fun m!1229403 () Bool)

(assert (=> b!1342215 m!1229403))

(assert (=> b!1342215 m!1229391))

(declare-fun m!1229405 () Bool)

(assert (=> b!1342215 m!1229405))

(declare-fun m!1229407 () Bool)

(assert (=> b!1342215 m!1229407))

(assert (=> b!1342215 m!1229399))

(assert (=> b!1342215 m!1229391))

(declare-fun m!1229409 () Bool)

(assert (=> b!1342215 m!1229409))

(declare-fun m!1229411 () Bool)

(assert (=> b!1342215 m!1229411))

(declare-fun m!1229413 () Bool)

(assert (=> b!1342215 m!1229413))

(declare-fun m!1229415 () Bool)

(assert (=> b!1342218 m!1229415))

(assert (=> b!1342218 m!1229415))

(declare-fun m!1229417 () Bool)

(assert (=> b!1342218 m!1229417))

(assert (=> b!1342220 m!1229391))

(declare-fun m!1229419 () Bool)

(assert (=> start!113180 m!1229419))

(declare-fun m!1229421 () Bool)

(assert (=> start!113180 m!1229421))

(declare-fun m!1229423 () Bool)

(assert (=> start!113180 m!1229423))

(declare-fun m!1229425 () Bool)

(assert (=> b!1342217 m!1229425))

(check-sat (not b_lambda!24397) (not b!1342218) (not b!1342216) (not b!1342217) (not b!1342224) b_and!50353 (not b!1342215) (not b_next!31231) (not mapNonEmpty!57553) (not start!113180) tp_is_empty!37231)
(check-sat b_and!50353 (not b_next!31231))
