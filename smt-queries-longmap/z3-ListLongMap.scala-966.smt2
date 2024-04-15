; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20956 () Bool)

(assert start!20956)

(declare-fun b_free!5545 () Bool)

(declare-fun b_next!5545 () Bool)

(assert (=> start!20956 (= b_free!5545 (not b_next!5545))))

(declare-fun tp!19684 () Bool)

(declare-fun b_and!12301 () Bool)

(assert (=> start!20956 (= tp!19684 b_and!12301)))

(declare-fun b!210334 () Bool)

(declare-fun res!102604 () Bool)

(declare-fun e!136965 () Bool)

(assert (=> b!210334 (=> (not res!102604) (not e!136965))))

(declare-datatypes ((array!10003 0))(
  ( (array!10004 (arr!4748 (Array (_ BitVec 32) (_ BitVec 64))) (size!5074 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10003)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6857 0))(
  ( (V!6858 (val!2748 Int)) )
))
(declare-datatypes ((ValueCell!2360 0))(
  ( (ValueCellFull!2360 (v!4724 V!6857)) (EmptyCell!2360) )
))
(declare-datatypes ((array!10005 0))(
  ( (array!10006 (arr!4749 (Array (_ BitVec 32) ValueCell!2360)) (size!5075 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10005)

(assert (=> b!210334 (= res!102604 (and (= (size!5075 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5074 _keys!825) (size!5075 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210335 () Bool)

(declare-fun res!102598 () Bool)

(assert (=> b!210335 (=> (not res!102598) (not e!136965))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210335 (= res!102598 (validKeyInArray!0 k0!843))))

(declare-fun b!210337 () Bool)

(declare-fun res!102602 () Bool)

(assert (=> b!210337 (=> (not res!102602) (not e!136965))))

(declare-datatypes ((List!3040 0))(
  ( (Nil!3037) (Cons!3036 (h!3678 (_ BitVec 64)) (t!7968 List!3040)) )
))
(declare-fun arrayNoDuplicates!0 (array!10003 (_ BitVec 32) List!3040) Bool)

(assert (=> b!210337 (= res!102602 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3037))))

(declare-fun b!210338 () Bool)

(declare-fun e!136961 () Bool)

(declare-fun tp_is_empty!5407 () Bool)

(assert (=> b!210338 (= e!136961 tp_is_empty!5407)))

(declare-fun b!210339 () Bool)

(declare-fun e!136960 () Bool)

(assert (=> b!210339 (= e!136960 (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4132 0))(
  ( (tuple2!4133 (_1!2077 (_ BitVec 64)) (_2!2077 V!6857)) )
))
(declare-datatypes ((List!3041 0))(
  ( (Nil!3038) (Cons!3037 (h!3679 tuple2!4132) (t!7969 List!3041)) )
))
(declare-datatypes ((ListLongMap!3035 0))(
  ( (ListLongMap!3036 (toList!1533 List!3041)) )
))
(declare-fun lt!107645 () ListLongMap!3035)

(declare-fun lt!107651 () ListLongMap!3035)

(declare-fun lt!107650 () tuple2!4132)

(declare-fun +!557 (ListLongMap!3035 tuple2!4132) ListLongMap!3035)

(assert (=> b!210339 (= lt!107645 (+!557 lt!107651 lt!107650))))

(declare-fun lt!107654 () ListLongMap!3035)

(declare-datatypes ((Unit!6356 0))(
  ( (Unit!6357) )
))
(declare-fun lt!107647 () Unit!6356)

(declare-fun v!520 () V!6857)

(declare-fun zeroValue!615 () V!6857)

(declare-fun addCommutativeForDiffKeys!192 (ListLongMap!3035 (_ BitVec 64) V!6857 (_ BitVec 64) V!6857) Unit!6356)

(assert (=> b!210339 (= lt!107647 (addCommutativeForDiffKeys!192 lt!107654 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!107657 () ListLongMap!3035)

(declare-fun lt!107652 () tuple2!4132)

(assert (=> b!210339 (= lt!107657 (+!557 lt!107645 lt!107652))))

(declare-fun lt!107649 () ListLongMap!3035)

(declare-fun lt!107648 () tuple2!4132)

(assert (=> b!210339 (= lt!107645 (+!557 lt!107649 lt!107648))))

(declare-fun lt!107653 () ListLongMap!3035)

(assert (=> b!210339 (= lt!107653 (+!557 lt!107651 lt!107652))))

(assert (=> b!210339 (= lt!107651 (+!557 lt!107654 lt!107648))))

(declare-fun lt!107655 () ListLongMap!3035)

(assert (=> b!210339 (= lt!107657 (+!557 (+!557 lt!107655 lt!107648) lt!107652))))

(declare-fun minValue!615 () V!6857)

(assert (=> b!210339 (= lt!107652 (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210339 (= lt!107648 (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!9188 () Bool)

(declare-fun mapRes!9188 () Bool)

(assert (=> mapIsEmpty!9188 mapRes!9188))

(declare-fun b!210340 () Bool)

(declare-fun e!136964 () Bool)

(assert (=> b!210340 (= e!136964 tp_is_empty!5407)))

(declare-fun mapNonEmpty!9188 () Bool)

(declare-fun tp!19685 () Bool)

(assert (=> mapNonEmpty!9188 (= mapRes!9188 (and tp!19685 e!136964))))

(declare-fun mapKey!9188 () (_ BitVec 32))

(declare-fun mapRest!9188 () (Array (_ BitVec 32) ValueCell!2360))

(declare-fun mapValue!9188 () ValueCell!2360)

(assert (=> mapNonEmpty!9188 (= (arr!4749 _values!649) (store mapRest!9188 mapKey!9188 mapValue!9188))))

(declare-fun b!210341 () Bool)

(declare-fun res!102600 () Bool)

(assert (=> b!210341 (=> (not res!102600) (not e!136965))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210341 (= res!102600 (= (select (arr!4748 _keys!825) i!601) k0!843))))

(declare-fun b!210342 () Bool)

(assert (=> b!210342 (= e!136965 (not e!136960))))

(declare-fun res!102603 () Bool)

(assert (=> b!210342 (=> res!102603 e!136960)))

(assert (=> b!210342 (= res!102603 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1045 (array!10003 array!10005 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) Int) ListLongMap!3035)

(assert (=> b!210342 (= lt!107653 (getCurrentListMap!1045 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107646 () array!10005)

(assert (=> b!210342 (= lt!107657 (getCurrentListMap!1045 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210342 (and (= lt!107655 lt!107649) (= lt!107649 lt!107655))))

(assert (=> b!210342 (= lt!107649 (+!557 lt!107654 lt!107650))))

(assert (=> b!210342 (= lt!107650 (tuple2!4133 k0!843 v!520))))

(declare-fun lt!107656 () Unit!6356)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 (array!10003 array!10005 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) (_ BitVec 64) V!6857 (_ BitVec 32) Int) Unit!6356)

(assert (=> b!210342 (= lt!107656 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!482 (array!10003 array!10005 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) Int) ListLongMap!3035)

(assert (=> b!210342 (= lt!107655 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210342 (= lt!107646 (array!10006 (store (arr!4749 _values!649) i!601 (ValueCellFull!2360 v!520)) (size!5075 _values!649)))))

(assert (=> b!210342 (= lt!107654 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210336 () Bool)

(declare-fun res!102601 () Bool)

(assert (=> b!210336 (=> (not res!102601) (not e!136965))))

(assert (=> b!210336 (= res!102601 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5074 _keys!825))))))

(declare-fun res!102599 () Bool)

(assert (=> start!20956 (=> (not res!102599) (not e!136965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20956 (= res!102599 (validMask!0 mask!1149))))

(assert (=> start!20956 e!136965))

(declare-fun e!136963 () Bool)

(declare-fun array_inv!3119 (array!10005) Bool)

(assert (=> start!20956 (and (array_inv!3119 _values!649) e!136963)))

(assert (=> start!20956 true))

(assert (=> start!20956 tp_is_empty!5407))

(declare-fun array_inv!3120 (array!10003) Bool)

(assert (=> start!20956 (array_inv!3120 _keys!825)))

(assert (=> start!20956 tp!19684))

(declare-fun b!210343 () Bool)

(declare-fun res!102605 () Bool)

(assert (=> b!210343 (=> (not res!102605) (not e!136965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10003 (_ BitVec 32)) Bool)

(assert (=> b!210343 (= res!102605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210344 () Bool)

(assert (=> b!210344 (= e!136963 (and e!136961 mapRes!9188))))

(declare-fun condMapEmpty!9188 () Bool)

(declare-fun mapDefault!9188 () ValueCell!2360)

(assert (=> b!210344 (= condMapEmpty!9188 (= (arr!4749 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2360)) mapDefault!9188)))))

(assert (= (and start!20956 res!102599) b!210334))

(assert (= (and b!210334 res!102604) b!210343))

(assert (= (and b!210343 res!102605) b!210337))

(assert (= (and b!210337 res!102602) b!210336))

(assert (= (and b!210336 res!102601) b!210335))

(assert (= (and b!210335 res!102598) b!210341))

(assert (= (and b!210341 res!102600) b!210342))

(assert (= (and b!210342 (not res!102603)) b!210339))

(assert (= (and b!210344 condMapEmpty!9188) mapIsEmpty!9188))

(assert (= (and b!210344 (not condMapEmpty!9188)) mapNonEmpty!9188))

(get-info :version)

(assert (= (and mapNonEmpty!9188 ((_ is ValueCellFull!2360) mapValue!9188)) b!210340))

(assert (= (and b!210344 ((_ is ValueCellFull!2360) mapDefault!9188)) b!210338))

(assert (= start!20956 b!210344))

(declare-fun m!237387 () Bool)

(assert (=> b!210342 m!237387))

(declare-fun m!237389 () Bool)

(assert (=> b!210342 m!237389))

(declare-fun m!237391 () Bool)

(assert (=> b!210342 m!237391))

(declare-fun m!237393 () Bool)

(assert (=> b!210342 m!237393))

(declare-fun m!237395 () Bool)

(assert (=> b!210342 m!237395))

(declare-fun m!237397 () Bool)

(assert (=> b!210342 m!237397))

(declare-fun m!237399 () Bool)

(assert (=> b!210342 m!237399))

(declare-fun m!237401 () Bool)

(assert (=> b!210337 m!237401))

(declare-fun m!237403 () Bool)

(assert (=> mapNonEmpty!9188 m!237403))

(declare-fun m!237405 () Bool)

(assert (=> b!210341 m!237405))

(declare-fun m!237407 () Bool)

(assert (=> b!210335 m!237407))

(declare-fun m!237409 () Bool)

(assert (=> b!210343 m!237409))

(declare-fun m!237411 () Bool)

(assert (=> start!20956 m!237411))

(declare-fun m!237413 () Bool)

(assert (=> start!20956 m!237413))

(declare-fun m!237415 () Bool)

(assert (=> start!20956 m!237415))

(declare-fun m!237417 () Bool)

(assert (=> b!210339 m!237417))

(declare-fun m!237419 () Bool)

(assert (=> b!210339 m!237419))

(declare-fun m!237421 () Bool)

(assert (=> b!210339 m!237421))

(declare-fun m!237423 () Bool)

(assert (=> b!210339 m!237423))

(declare-fun m!237425 () Bool)

(assert (=> b!210339 m!237425))

(declare-fun m!237427 () Bool)

(assert (=> b!210339 m!237427))

(assert (=> b!210339 m!237421))

(declare-fun m!237429 () Bool)

(assert (=> b!210339 m!237429))

(declare-fun m!237431 () Bool)

(assert (=> b!210339 m!237431))

(check-sat tp_is_empty!5407 (not b!210337) (not mapNonEmpty!9188) (not start!20956) b_and!12301 (not b!210343) (not b_next!5545) (not b!210342) (not b!210335) (not b!210339))
(check-sat b_and!12301 (not b_next!5545))
(get-model)

(declare-fun b!210421 () Bool)

(declare-fun e!137012 () Bool)

(declare-fun call!19887 () Bool)

(assert (=> b!210421 (= e!137012 call!19887)))

(declare-fun b!210422 () Bool)

(declare-fun e!137010 () Bool)

(declare-fun contains!1376 (List!3040 (_ BitVec 64)) Bool)

(assert (=> b!210422 (= e!137010 (contains!1376 Nil!3037 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210423 () Bool)

(declare-fun e!137013 () Bool)

(assert (=> b!210423 (= e!137013 e!137012)))

(declare-fun c!35559 () Bool)

(assert (=> b!210423 (= c!35559 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210424 () Bool)

(declare-fun e!137011 () Bool)

(assert (=> b!210424 (= e!137011 e!137013)))

(declare-fun res!102661 () Bool)

(assert (=> b!210424 (=> (not res!102661) (not e!137013))))

(assert (=> b!210424 (= res!102661 (not e!137010))))

(declare-fun res!102662 () Bool)

(assert (=> b!210424 (=> (not res!102662) (not e!137010))))

(assert (=> b!210424 (= res!102662 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19884 () Bool)

(assert (=> bm!19884 (= call!19887 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35559 (Cons!3036 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) Nil!3037) Nil!3037)))))

(declare-fun d!57817 () Bool)

(declare-fun res!102660 () Bool)

(assert (=> d!57817 (=> res!102660 e!137011)))

(assert (=> d!57817 (= res!102660 (bvsge #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57817 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3037) e!137011)))

(declare-fun b!210425 () Bool)

(assert (=> b!210425 (= e!137012 call!19887)))

(assert (= (and d!57817 (not res!102660)) b!210424))

(assert (= (and b!210424 res!102662) b!210422))

(assert (= (and b!210424 res!102661) b!210423))

(assert (= (and b!210423 c!35559) b!210425))

(assert (= (and b!210423 (not c!35559)) b!210421))

(assert (= (or b!210425 b!210421) bm!19884))

(declare-fun m!237525 () Bool)

(assert (=> b!210422 m!237525))

(assert (=> b!210422 m!237525))

(declare-fun m!237527 () Bool)

(assert (=> b!210422 m!237527))

(assert (=> b!210423 m!237525))

(assert (=> b!210423 m!237525))

(declare-fun m!237529 () Bool)

(assert (=> b!210423 m!237529))

(assert (=> b!210424 m!237525))

(assert (=> b!210424 m!237525))

(assert (=> b!210424 m!237529))

(assert (=> bm!19884 m!237525))

(declare-fun m!237531 () Bool)

(assert (=> bm!19884 m!237531))

(assert (=> b!210337 d!57817))

(declare-fun d!57819 () Bool)

(assert (=> d!57819 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20956 d!57819))

(declare-fun d!57821 () Bool)

(assert (=> d!57821 (= (array_inv!3119 _values!649) (bvsge (size!5075 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20956 d!57821))

(declare-fun d!57823 () Bool)

(assert (=> d!57823 (= (array_inv!3120 _keys!825) (bvsge (size!5074 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20956 d!57823))

(declare-fun b!210450 () Bool)

(declare-fun e!137033 () ListLongMap!3035)

(declare-fun call!19890 () ListLongMap!3035)

(assert (=> b!210450 (= e!137033 call!19890)))

(declare-fun bm!19887 () Bool)

(assert (=> bm!19887 (= call!19890 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210452 () Bool)

(assert (=> b!210452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> b!210452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5075 lt!107646)))))

(declare-fun e!137034 () Bool)

(declare-fun lt!107756 () ListLongMap!3035)

(declare-fun apply!192 (ListLongMap!3035 (_ BitVec 64)) V!6857)

(declare-fun get!2544 (ValueCell!2360 V!6857) V!6857)

(declare-fun dynLambda!526 (Int (_ BitVec 64)) V!6857)

(assert (=> b!210452 (= e!137034 (= (apply!192 lt!107756 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2544 (select (arr!4749 lt!107646) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210453 () Bool)

(declare-fun e!137032 () Bool)

(declare-fun e!137028 () Bool)

(assert (=> b!210453 (= e!137032 e!137028)))

(declare-fun c!35569 () Bool)

(declare-fun e!137030 () Bool)

(assert (=> b!210453 (= c!35569 e!137030)))

(declare-fun res!102674 () Bool)

(assert (=> b!210453 (=> (not res!102674) (not e!137030))))

(assert (=> b!210453 (= res!102674 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210454 () Bool)

(declare-fun e!137031 () Bool)

(assert (=> b!210454 (= e!137028 e!137031)))

(declare-fun c!35571 () Bool)

(assert (=> b!210454 (= c!35571 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210455 () Bool)

(declare-fun e!137029 () ListLongMap!3035)

(assert (=> b!210455 (= e!137029 e!137033)))

(declare-fun c!35570 () Bool)

(assert (=> b!210455 (= c!35570 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210456 () Bool)

(declare-fun lt!107751 () Unit!6356)

(declare-fun lt!107752 () Unit!6356)

(assert (=> b!210456 (= lt!107751 lt!107752)))

(declare-fun lt!107755 () (_ BitVec 64))

(declare-fun lt!107753 () ListLongMap!3035)

(declare-fun lt!107754 () (_ BitVec 64))

(declare-fun lt!107750 () V!6857)

(declare-fun contains!1377 (ListLongMap!3035 (_ BitVec 64)) Bool)

(assert (=> b!210456 (not (contains!1377 (+!557 lt!107753 (tuple2!4133 lt!107754 lt!107750)) lt!107755))))

(declare-fun addStillNotContains!102 (ListLongMap!3035 (_ BitVec 64) V!6857 (_ BitVec 64)) Unit!6356)

(assert (=> b!210456 (= lt!107752 (addStillNotContains!102 lt!107753 lt!107754 lt!107750 lt!107755))))

(assert (=> b!210456 (= lt!107755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210456 (= lt!107750 (get!2544 (select (arr!4749 lt!107646) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210456 (= lt!107754 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210456 (= lt!107753 call!19890)))

(assert (=> b!210456 (= e!137033 (+!557 call!19890 (tuple2!4133 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) (get!2544 (select (arr!4749 lt!107646) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210457 () Bool)

(assert (=> b!210457 (= e!137028 e!137034)))

(assert (=> b!210457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun res!102673 () Bool)

(assert (=> b!210457 (= res!102673 (contains!1377 lt!107756 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210457 (=> (not res!102673) (not e!137034))))

(declare-fun b!210458 () Bool)

(assert (=> b!210458 (= e!137030 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210458 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210459 () Bool)

(assert (=> b!210459 (= e!137029 (ListLongMap!3036 Nil!3038))))

(declare-fun d!57825 () Bool)

(assert (=> d!57825 e!137032))

(declare-fun res!102672 () Bool)

(assert (=> d!57825 (=> (not res!102672) (not e!137032))))

(assert (=> d!57825 (= res!102672 (not (contains!1377 lt!107756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57825 (= lt!107756 e!137029)))

(declare-fun c!35568 () Bool)

(assert (=> d!57825 (= c!35568 (bvsge #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57825 (validMask!0 mask!1149)))

(assert (=> d!57825 (= (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107756)))

(declare-fun b!210451 () Bool)

(assert (=> b!210451 (= e!137031 (= lt!107756 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210460 () Bool)

(declare-fun isEmpty!497 (ListLongMap!3035) Bool)

(assert (=> b!210460 (= e!137031 (isEmpty!497 lt!107756))))

(declare-fun b!210461 () Bool)

(declare-fun res!102671 () Bool)

(assert (=> b!210461 (=> (not res!102671) (not e!137032))))

(assert (=> b!210461 (= res!102671 (not (contains!1377 lt!107756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57825 c!35568) b!210459))

(assert (= (and d!57825 (not c!35568)) b!210455))

(assert (= (and b!210455 c!35570) b!210456))

(assert (= (and b!210455 (not c!35570)) b!210450))

(assert (= (or b!210456 b!210450) bm!19887))

(assert (= (and d!57825 res!102672) b!210461))

(assert (= (and b!210461 res!102671) b!210453))

(assert (= (and b!210453 res!102674) b!210458))

(assert (= (and b!210453 c!35569) b!210457))

(assert (= (and b!210453 (not c!35569)) b!210454))

(assert (= (and b!210457 res!102673) b!210452))

(assert (= (and b!210454 c!35571) b!210451))

(assert (= (and b!210454 (not c!35571)) b!210460))

(declare-fun b_lambda!7593 () Bool)

(assert (=> (not b_lambda!7593) (not b!210452)))

(declare-fun t!7973 () Bool)

(declare-fun tb!2889 () Bool)

(assert (=> (and start!20956 (= defaultEntry!657 defaultEntry!657) t!7973) tb!2889))

(declare-fun result!4971 () Bool)

(assert (=> tb!2889 (= result!4971 tp_is_empty!5407)))

(assert (=> b!210452 t!7973))

(declare-fun b_and!12307 () Bool)

(assert (= b_and!12301 (and (=> t!7973 result!4971) b_and!12307)))

(declare-fun b_lambda!7595 () Bool)

(assert (=> (not b_lambda!7595) (not b!210456)))

(assert (=> b!210456 t!7973))

(declare-fun b_and!12309 () Bool)

(assert (= b_and!12307 (and (=> t!7973 result!4971) b_and!12309)))

(declare-fun m!237533 () Bool)

(assert (=> bm!19887 m!237533))

(assert (=> b!210458 m!237525))

(assert (=> b!210458 m!237525))

(assert (=> b!210458 m!237529))

(declare-fun m!237535 () Bool)

(assert (=> b!210461 m!237535))

(declare-fun m!237537 () Bool)

(assert (=> d!57825 m!237537))

(assert (=> d!57825 m!237411))

(assert (=> b!210455 m!237525))

(assert (=> b!210455 m!237525))

(assert (=> b!210455 m!237529))

(assert (=> b!210457 m!237525))

(assert (=> b!210457 m!237525))

(declare-fun m!237539 () Bool)

(assert (=> b!210457 m!237539))

(declare-fun m!237541 () Bool)

(assert (=> b!210460 m!237541))

(declare-fun m!237543 () Bool)

(assert (=> b!210452 m!237543))

(declare-fun m!237545 () Bool)

(assert (=> b!210452 m!237545))

(assert (=> b!210452 m!237543))

(declare-fun m!237547 () Bool)

(assert (=> b!210452 m!237547))

(assert (=> b!210452 m!237545))

(assert (=> b!210452 m!237525))

(assert (=> b!210452 m!237525))

(declare-fun m!237549 () Bool)

(assert (=> b!210452 m!237549))

(declare-fun m!237551 () Bool)

(assert (=> b!210456 m!237551))

(declare-fun m!237553 () Bool)

(assert (=> b!210456 m!237553))

(assert (=> b!210456 m!237543))

(assert (=> b!210456 m!237545))

(assert (=> b!210456 m!237543))

(assert (=> b!210456 m!237547))

(assert (=> b!210456 m!237545))

(declare-fun m!237555 () Bool)

(assert (=> b!210456 m!237555))

(assert (=> b!210456 m!237525))

(assert (=> b!210456 m!237555))

(declare-fun m!237557 () Bool)

(assert (=> b!210456 m!237557))

(assert (=> b!210451 m!237533))

(assert (=> b!210342 d!57825))

(declare-fun call!19895 () ListLongMap!3035)

(declare-fun b!210470 () Bool)

(declare-fun call!19896 () ListLongMap!3035)

(declare-fun e!137040 () Bool)

(assert (=> b!210470 (= e!137040 (= call!19895 (+!557 call!19896 (tuple2!4133 k0!843 v!520))))))

(declare-fun d!57827 () Bool)

(declare-fun e!137039 () Bool)

(assert (=> d!57827 e!137039))

(declare-fun res!102677 () Bool)

(assert (=> d!57827 (=> (not res!102677) (not e!137039))))

(assert (=> d!57827 (= res!102677 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5075 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5075 _values!649))))))))

(declare-fun lt!107759 () Unit!6356)

(declare-fun choose!1082 (array!10003 array!10005 (_ BitVec 32) (_ BitVec 32) V!6857 V!6857 (_ BitVec 32) (_ BitVec 64) V!6857 (_ BitVec 32) Int) Unit!6356)

(assert (=> d!57827 (= lt!107759 (choose!1082 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57827 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107759)))

(declare-fun b!210471 () Bool)

(assert (=> b!210471 (= e!137040 (= call!19895 call!19896))))

(declare-fun bm!19892 () Bool)

(assert (=> bm!19892 (= call!19896 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19893 () Bool)

(assert (=> bm!19893 (= call!19895 (getCurrentListMapNoExtraKeys!482 _keys!825 (array!10006 (store (arr!4749 _values!649) i!601 (ValueCellFull!2360 v!520)) (size!5075 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210472 () Bool)

(assert (=> b!210472 (= e!137039 e!137040)))

(declare-fun c!35574 () Bool)

(assert (=> b!210472 (= c!35574 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!57827 res!102677) b!210472))

(assert (= (and b!210472 c!35574) b!210470))

(assert (= (and b!210472 (not c!35574)) b!210471))

(assert (= (or b!210470 b!210471) bm!19893))

(assert (= (or b!210470 b!210471) bm!19892))

(declare-fun m!237559 () Bool)

(assert (=> b!210470 m!237559))

(declare-fun m!237561 () Bool)

(assert (=> d!57827 m!237561))

(assert (=> bm!19892 m!237395))

(assert (=> bm!19893 m!237387))

(declare-fun m!237563 () Bool)

(assert (=> bm!19893 m!237563))

(assert (=> b!210342 d!57827))

(declare-fun b!210515 () Bool)

(declare-fun e!137073 () Bool)

(assert (=> b!210515 (= e!137073 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210516 () Bool)

(declare-fun e!137078 () Bool)

(declare-fun lt!107807 () ListLongMap!3035)

(assert (=> b!210516 (= e!137078 (= (apply!192 lt!107807 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19908 () Bool)

(declare-fun call!19911 () ListLongMap!3035)

(declare-fun call!19915 () ListLongMap!3035)

(assert (=> bm!19908 (= call!19911 call!19915)))

(declare-fun call!19913 () ListLongMap!3035)

(declare-fun call!19914 () ListLongMap!3035)

(declare-fun c!35591 () Bool)

(declare-fun call!19916 () ListLongMap!3035)

(declare-fun bm!19909 () Bool)

(declare-fun c!35592 () Bool)

(assert (=> bm!19909 (= call!19915 (+!557 (ite c!35592 call!19913 (ite c!35591 call!19916 call!19914)) (ite (or c!35592 c!35591) (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210517 () Bool)

(declare-fun e!137071 () Bool)

(declare-fun e!137075 () Bool)

(assert (=> b!210517 (= e!137071 e!137075)))

(declare-fun c!35588 () Bool)

(assert (=> b!210517 (= c!35588 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210519 () Bool)

(declare-fun e!137074 () ListLongMap!3035)

(assert (=> b!210519 (= e!137074 call!19911)))

(declare-fun b!210520 () Bool)

(declare-fun call!19917 () Bool)

(assert (=> b!210520 (= e!137075 (not call!19917))))

(declare-fun b!210521 () Bool)

(assert (=> b!210521 (= e!137075 e!137078)))

(declare-fun res!102700 () Bool)

(assert (=> b!210521 (= res!102700 call!19917)))

(assert (=> b!210521 (=> (not res!102700) (not e!137078))))

(declare-fun bm!19910 () Bool)

(assert (=> bm!19910 (= call!19914 call!19916)))

(declare-fun b!210522 () Bool)

(declare-fun c!35587 () Bool)

(assert (=> b!210522 (= c!35587 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137072 () ListLongMap!3035)

(assert (=> b!210522 (= e!137072 e!137074)))

(declare-fun b!210523 () Bool)

(declare-fun e!137070 () Bool)

(assert (=> b!210523 (= e!137070 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210524 () Bool)

(declare-fun res!102703 () Bool)

(assert (=> b!210524 (=> (not res!102703) (not e!137071))))

(declare-fun e!137079 () Bool)

(assert (=> b!210524 (= res!102703 e!137079)))

(declare-fun res!102698 () Bool)

(assert (=> b!210524 (=> res!102698 e!137079)))

(assert (=> b!210524 (= res!102698 (not e!137073))))

(declare-fun res!102704 () Bool)

(assert (=> b!210524 (=> (not res!102704) (not e!137073))))

(assert (=> b!210524 (= res!102704 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210525 () Bool)

(declare-fun e!137067 () ListLongMap!3035)

(assert (=> b!210525 (= e!137067 e!137072)))

(assert (=> b!210525 (= c!35591 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210526 () Bool)

(declare-fun e!137068 () Unit!6356)

(declare-fun Unit!6360 () Unit!6356)

(assert (=> b!210526 (= e!137068 Unit!6360)))

(declare-fun b!210527 () Bool)

(declare-fun e!137076 () Bool)

(assert (=> b!210527 (= e!137079 e!137076)))

(declare-fun res!102701 () Bool)

(assert (=> b!210527 (=> (not res!102701) (not e!137076))))

(assert (=> b!210527 (= res!102701 (contains!1377 lt!107807 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210528 () Bool)

(assert (=> b!210528 (= e!137072 call!19911)))

(declare-fun b!210529 () Bool)

(declare-fun lt!107813 () Unit!6356)

(assert (=> b!210529 (= e!137068 lt!107813)))

(declare-fun lt!107817 () ListLongMap!3035)

(assert (=> b!210529 (= lt!107817 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107806 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107816 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107816 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107815 () Unit!6356)

(declare-fun addStillContains!168 (ListLongMap!3035 (_ BitVec 64) V!6857 (_ BitVec 64)) Unit!6356)

(assert (=> b!210529 (= lt!107815 (addStillContains!168 lt!107817 lt!107806 zeroValue!615 lt!107816))))

(assert (=> b!210529 (contains!1377 (+!557 lt!107817 (tuple2!4133 lt!107806 zeroValue!615)) lt!107816)))

(declare-fun lt!107825 () Unit!6356)

(assert (=> b!210529 (= lt!107825 lt!107815)))

(declare-fun lt!107819 () ListLongMap!3035)

(assert (=> b!210529 (= lt!107819 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107811 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107811 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107804 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107804 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107809 () Unit!6356)

(declare-fun addApplyDifferent!168 (ListLongMap!3035 (_ BitVec 64) V!6857 (_ BitVec 64)) Unit!6356)

(assert (=> b!210529 (= lt!107809 (addApplyDifferent!168 lt!107819 lt!107811 minValue!615 lt!107804))))

(assert (=> b!210529 (= (apply!192 (+!557 lt!107819 (tuple2!4133 lt!107811 minValue!615)) lt!107804) (apply!192 lt!107819 lt!107804))))

(declare-fun lt!107812 () Unit!6356)

(assert (=> b!210529 (= lt!107812 lt!107809)))

(declare-fun lt!107822 () ListLongMap!3035)

(assert (=> b!210529 (= lt!107822 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107823 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107808 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107808 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107821 () Unit!6356)

(assert (=> b!210529 (= lt!107821 (addApplyDifferent!168 lt!107822 lt!107823 zeroValue!615 lt!107808))))

(assert (=> b!210529 (= (apply!192 (+!557 lt!107822 (tuple2!4133 lt!107823 zeroValue!615)) lt!107808) (apply!192 lt!107822 lt!107808))))

(declare-fun lt!107810 () Unit!6356)

(assert (=> b!210529 (= lt!107810 lt!107821)))

(declare-fun lt!107818 () ListLongMap!3035)

(assert (=> b!210529 (= lt!107818 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107814 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107805 () (_ BitVec 64))

(assert (=> b!210529 (= lt!107805 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210529 (= lt!107813 (addApplyDifferent!168 lt!107818 lt!107814 minValue!615 lt!107805))))

(assert (=> b!210529 (= (apply!192 (+!557 lt!107818 (tuple2!4133 lt!107814 minValue!615)) lt!107805) (apply!192 lt!107818 lt!107805))))

(declare-fun b!210530 () Bool)

(declare-fun e!137077 () Bool)

(declare-fun e!137069 () Bool)

(assert (=> b!210530 (= e!137077 e!137069)))

(declare-fun res!102697 () Bool)

(declare-fun call!19912 () Bool)

(assert (=> b!210530 (= res!102697 call!19912)))

(assert (=> b!210530 (=> (not res!102697) (not e!137069))))

(declare-fun bm!19911 () Bool)

(assert (=> bm!19911 (= call!19913 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210531 () Bool)

(assert (=> b!210531 (= e!137074 call!19914)))

(declare-fun bm!19912 () Bool)

(assert (=> bm!19912 (= call!19916 call!19913)))

(declare-fun bm!19913 () Bool)

(assert (=> bm!19913 (= call!19917 (contains!1377 lt!107807 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210532 () Bool)

(assert (=> b!210532 (= e!137077 (not call!19912))))

(declare-fun d!57829 () Bool)

(assert (=> d!57829 e!137071))

(declare-fun res!102699 () Bool)

(assert (=> d!57829 (=> (not res!102699) (not e!137071))))

(assert (=> d!57829 (= res!102699 (or (bvsge #b00000000000000000000000000000000 (size!5074 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))))

(declare-fun lt!107824 () ListLongMap!3035)

(assert (=> d!57829 (= lt!107807 lt!107824)))

(declare-fun lt!107820 () Unit!6356)

(assert (=> d!57829 (= lt!107820 e!137068)))

(declare-fun c!35590 () Bool)

(assert (=> d!57829 (= c!35590 e!137070)))

(declare-fun res!102696 () Bool)

(assert (=> d!57829 (=> (not res!102696) (not e!137070))))

(assert (=> d!57829 (= res!102696 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57829 (= lt!107824 e!137067)))

(assert (=> d!57829 (= c!35592 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57829 (validMask!0 mask!1149)))

(assert (=> d!57829 (= (getCurrentListMap!1045 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107807)))

(declare-fun b!210518 () Bool)

(declare-fun res!102702 () Bool)

(assert (=> b!210518 (=> (not res!102702) (not e!137071))))

(assert (=> b!210518 (= res!102702 e!137077)))

(declare-fun c!35589 () Bool)

(assert (=> b!210518 (= c!35589 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210533 () Bool)

(assert (=> b!210533 (= e!137067 (+!557 call!19915 (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210534 () Bool)

(assert (=> b!210534 (= e!137076 (= (apply!192 lt!107807 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2544 (select (arr!4749 _values!649) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5075 _values!649)))))

(assert (=> b!210534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210535 () Bool)

(assert (=> b!210535 (= e!137069 (= (apply!192 lt!107807 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19914 () Bool)

(assert (=> bm!19914 (= call!19912 (contains!1377 lt!107807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57829 c!35592) b!210533))

(assert (= (and d!57829 (not c!35592)) b!210525))

(assert (= (and b!210525 c!35591) b!210528))

(assert (= (and b!210525 (not c!35591)) b!210522))

(assert (= (and b!210522 c!35587) b!210519))

(assert (= (and b!210522 (not c!35587)) b!210531))

(assert (= (or b!210519 b!210531) bm!19910))

(assert (= (or b!210528 bm!19910) bm!19912))

(assert (= (or b!210528 b!210519) bm!19908))

(assert (= (or b!210533 bm!19912) bm!19911))

(assert (= (or b!210533 bm!19908) bm!19909))

(assert (= (and d!57829 res!102696) b!210523))

(assert (= (and d!57829 c!35590) b!210529))

(assert (= (and d!57829 (not c!35590)) b!210526))

(assert (= (and d!57829 res!102699) b!210524))

(assert (= (and b!210524 res!102704) b!210515))

(assert (= (and b!210524 (not res!102698)) b!210527))

(assert (= (and b!210527 res!102701) b!210534))

(assert (= (and b!210524 res!102703) b!210518))

(assert (= (and b!210518 c!35589) b!210530))

(assert (= (and b!210518 (not c!35589)) b!210532))

(assert (= (and b!210530 res!102697) b!210535))

(assert (= (or b!210530 b!210532) bm!19914))

(assert (= (and b!210518 res!102702) b!210517))

(assert (= (and b!210517 c!35588) b!210521))

(assert (= (and b!210517 (not c!35588)) b!210520))

(assert (= (and b!210521 res!102700) b!210516))

(assert (= (or b!210521 b!210520) bm!19913))

(declare-fun b_lambda!7597 () Bool)

(assert (=> (not b_lambda!7597) (not b!210534)))

(assert (=> b!210534 t!7973))

(declare-fun b_and!12311 () Bool)

(assert (= b_and!12309 (and (=> t!7973 result!4971) b_and!12311)))

(assert (=> b!210534 m!237525))

(declare-fun m!237565 () Bool)

(assert (=> b!210534 m!237565))

(assert (=> b!210534 m!237565))

(assert (=> b!210534 m!237543))

(declare-fun m!237567 () Bool)

(assert (=> b!210534 m!237567))

(assert (=> b!210534 m!237525))

(declare-fun m!237569 () Bool)

(assert (=> b!210534 m!237569))

(assert (=> b!210534 m!237543))

(assert (=> b!210523 m!237525))

(assert (=> b!210523 m!237525))

(assert (=> b!210523 m!237529))

(assert (=> b!210515 m!237525))

(assert (=> b!210515 m!237525))

(assert (=> b!210515 m!237529))

(assert (=> bm!19911 m!237395))

(declare-fun m!237571 () Bool)

(assert (=> bm!19909 m!237571))

(declare-fun m!237573 () Bool)

(assert (=> b!210529 m!237573))

(declare-fun m!237575 () Bool)

(assert (=> b!210529 m!237575))

(declare-fun m!237577 () Bool)

(assert (=> b!210529 m!237577))

(declare-fun m!237579 () Bool)

(assert (=> b!210529 m!237579))

(declare-fun m!237581 () Bool)

(assert (=> b!210529 m!237581))

(declare-fun m!237583 () Bool)

(assert (=> b!210529 m!237583))

(assert (=> b!210529 m!237579))

(declare-fun m!237585 () Bool)

(assert (=> b!210529 m!237585))

(assert (=> b!210529 m!237395))

(declare-fun m!237587 () Bool)

(assert (=> b!210529 m!237587))

(declare-fun m!237589 () Bool)

(assert (=> b!210529 m!237589))

(declare-fun m!237591 () Bool)

(assert (=> b!210529 m!237591))

(declare-fun m!237593 () Bool)

(assert (=> b!210529 m!237593))

(declare-fun m!237595 () Bool)

(assert (=> b!210529 m!237595))

(assert (=> b!210529 m!237585))

(declare-fun m!237597 () Bool)

(assert (=> b!210529 m!237597))

(assert (=> b!210529 m!237591))

(assert (=> b!210529 m!237589))

(declare-fun m!237599 () Bool)

(assert (=> b!210529 m!237599))

(declare-fun m!237601 () Bool)

(assert (=> b!210529 m!237601))

(assert (=> b!210529 m!237525))

(declare-fun m!237603 () Bool)

(assert (=> b!210516 m!237603))

(assert (=> b!210527 m!237525))

(assert (=> b!210527 m!237525))

(declare-fun m!237605 () Bool)

(assert (=> b!210527 m!237605))

(declare-fun m!237607 () Bool)

(assert (=> bm!19913 m!237607))

(declare-fun m!237609 () Bool)

(assert (=> bm!19914 m!237609))

(declare-fun m!237611 () Bool)

(assert (=> b!210533 m!237611))

(assert (=> d!57829 m!237411))

(declare-fun m!237613 () Bool)

(assert (=> b!210535 m!237613))

(assert (=> b!210342 d!57829))

(declare-fun b!210536 () Bool)

(declare-fun e!137086 () Bool)

(assert (=> b!210536 (= e!137086 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210537 () Bool)

(declare-fun e!137091 () Bool)

(declare-fun lt!107829 () ListLongMap!3035)

(assert (=> b!210537 (= e!137091 (= (apply!192 lt!107829 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19915 () Bool)

(declare-fun call!19918 () ListLongMap!3035)

(declare-fun call!19922 () ListLongMap!3035)

(assert (=> bm!19915 (= call!19918 call!19922)))

(declare-fun call!19921 () ListLongMap!3035)

(declare-fun c!35598 () Bool)

(declare-fun bm!19916 () Bool)

(declare-fun call!19923 () ListLongMap!3035)

(declare-fun call!19920 () ListLongMap!3035)

(declare-fun c!35597 () Bool)

(assert (=> bm!19916 (= call!19922 (+!557 (ite c!35598 call!19920 (ite c!35597 call!19923 call!19921)) (ite (or c!35598 c!35597) (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210538 () Bool)

(declare-fun e!137084 () Bool)

(declare-fun e!137088 () Bool)

(assert (=> b!210538 (= e!137084 e!137088)))

(declare-fun c!35594 () Bool)

(assert (=> b!210538 (= c!35594 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210540 () Bool)

(declare-fun e!137087 () ListLongMap!3035)

(assert (=> b!210540 (= e!137087 call!19918)))

(declare-fun b!210541 () Bool)

(declare-fun call!19924 () Bool)

(assert (=> b!210541 (= e!137088 (not call!19924))))

(declare-fun b!210542 () Bool)

(assert (=> b!210542 (= e!137088 e!137091)))

(declare-fun res!102709 () Bool)

(assert (=> b!210542 (= res!102709 call!19924)))

(assert (=> b!210542 (=> (not res!102709) (not e!137091))))

(declare-fun bm!19917 () Bool)

(assert (=> bm!19917 (= call!19921 call!19923)))

(declare-fun b!210543 () Bool)

(declare-fun c!35593 () Bool)

(assert (=> b!210543 (= c!35593 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137085 () ListLongMap!3035)

(assert (=> b!210543 (= e!137085 e!137087)))

(declare-fun b!210544 () Bool)

(declare-fun e!137083 () Bool)

(assert (=> b!210544 (= e!137083 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210545 () Bool)

(declare-fun res!102712 () Bool)

(assert (=> b!210545 (=> (not res!102712) (not e!137084))))

(declare-fun e!137092 () Bool)

(assert (=> b!210545 (= res!102712 e!137092)))

(declare-fun res!102707 () Bool)

(assert (=> b!210545 (=> res!102707 e!137092)))

(assert (=> b!210545 (= res!102707 (not e!137086))))

(declare-fun res!102713 () Bool)

(assert (=> b!210545 (=> (not res!102713) (not e!137086))))

(assert (=> b!210545 (= res!102713 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210546 () Bool)

(declare-fun e!137080 () ListLongMap!3035)

(assert (=> b!210546 (= e!137080 e!137085)))

(assert (=> b!210546 (= c!35597 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210547 () Bool)

(declare-fun e!137081 () Unit!6356)

(declare-fun Unit!6361 () Unit!6356)

(assert (=> b!210547 (= e!137081 Unit!6361)))

(declare-fun b!210548 () Bool)

(declare-fun e!137089 () Bool)

(assert (=> b!210548 (= e!137092 e!137089)))

(declare-fun res!102710 () Bool)

(assert (=> b!210548 (=> (not res!102710) (not e!137089))))

(assert (=> b!210548 (= res!102710 (contains!1377 lt!107829 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210549 () Bool)

(assert (=> b!210549 (= e!137085 call!19918)))

(declare-fun b!210550 () Bool)

(declare-fun lt!107835 () Unit!6356)

(assert (=> b!210550 (= e!137081 lt!107835)))

(declare-fun lt!107839 () ListLongMap!3035)

(assert (=> b!210550 (= lt!107839 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107828 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107838 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107838 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107837 () Unit!6356)

(assert (=> b!210550 (= lt!107837 (addStillContains!168 lt!107839 lt!107828 zeroValue!615 lt!107838))))

(assert (=> b!210550 (contains!1377 (+!557 lt!107839 (tuple2!4133 lt!107828 zeroValue!615)) lt!107838)))

(declare-fun lt!107847 () Unit!6356)

(assert (=> b!210550 (= lt!107847 lt!107837)))

(declare-fun lt!107841 () ListLongMap!3035)

(assert (=> b!210550 (= lt!107841 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107833 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107833 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107826 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107826 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107831 () Unit!6356)

(assert (=> b!210550 (= lt!107831 (addApplyDifferent!168 lt!107841 lt!107833 minValue!615 lt!107826))))

(assert (=> b!210550 (= (apply!192 (+!557 lt!107841 (tuple2!4133 lt!107833 minValue!615)) lt!107826) (apply!192 lt!107841 lt!107826))))

(declare-fun lt!107834 () Unit!6356)

(assert (=> b!210550 (= lt!107834 lt!107831)))

(declare-fun lt!107844 () ListLongMap!3035)

(assert (=> b!210550 (= lt!107844 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107845 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107830 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107830 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107843 () Unit!6356)

(assert (=> b!210550 (= lt!107843 (addApplyDifferent!168 lt!107844 lt!107845 zeroValue!615 lt!107830))))

(assert (=> b!210550 (= (apply!192 (+!557 lt!107844 (tuple2!4133 lt!107845 zeroValue!615)) lt!107830) (apply!192 lt!107844 lt!107830))))

(declare-fun lt!107832 () Unit!6356)

(assert (=> b!210550 (= lt!107832 lt!107843)))

(declare-fun lt!107840 () ListLongMap!3035)

(assert (=> b!210550 (= lt!107840 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107836 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107836 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107827 () (_ BitVec 64))

(assert (=> b!210550 (= lt!107827 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210550 (= lt!107835 (addApplyDifferent!168 lt!107840 lt!107836 minValue!615 lt!107827))))

(assert (=> b!210550 (= (apply!192 (+!557 lt!107840 (tuple2!4133 lt!107836 minValue!615)) lt!107827) (apply!192 lt!107840 lt!107827))))

(declare-fun b!210551 () Bool)

(declare-fun e!137090 () Bool)

(declare-fun e!137082 () Bool)

(assert (=> b!210551 (= e!137090 e!137082)))

(declare-fun res!102706 () Bool)

(declare-fun call!19919 () Bool)

(assert (=> b!210551 (= res!102706 call!19919)))

(assert (=> b!210551 (=> (not res!102706) (not e!137082))))

(declare-fun bm!19918 () Bool)

(assert (=> bm!19918 (= call!19920 (getCurrentListMapNoExtraKeys!482 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210552 () Bool)

(assert (=> b!210552 (= e!137087 call!19921)))

(declare-fun bm!19919 () Bool)

(assert (=> bm!19919 (= call!19923 call!19920)))

(declare-fun bm!19920 () Bool)

(assert (=> bm!19920 (= call!19924 (contains!1377 lt!107829 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210553 () Bool)

(assert (=> b!210553 (= e!137090 (not call!19919))))

(declare-fun d!57831 () Bool)

(assert (=> d!57831 e!137084))

(declare-fun res!102708 () Bool)

(assert (=> d!57831 (=> (not res!102708) (not e!137084))))

(assert (=> d!57831 (= res!102708 (or (bvsge #b00000000000000000000000000000000 (size!5074 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))))

(declare-fun lt!107846 () ListLongMap!3035)

(assert (=> d!57831 (= lt!107829 lt!107846)))

(declare-fun lt!107842 () Unit!6356)

(assert (=> d!57831 (= lt!107842 e!137081)))

(declare-fun c!35596 () Bool)

(assert (=> d!57831 (= c!35596 e!137083)))

(declare-fun res!102705 () Bool)

(assert (=> d!57831 (=> (not res!102705) (not e!137083))))

(assert (=> d!57831 (= res!102705 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57831 (= lt!107846 e!137080)))

(assert (=> d!57831 (= c!35598 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57831 (validMask!0 mask!1149)))

(assert (=> d!57831 (= (getCurrentListMap!1045 _keys!825 lt!107646 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107829)))

(declare-fun b!210539 () Bool)

(declare-fun res!102711 () Bool)

(assert (=> b!210539 (=> (not res!102711) (not e!137084))))

(assert (=> b!210539 (= res!102711 e!137090)))

(declare-fun c!35595 () Bool)

(assert (=> b!210539 (= c!35595 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210554 () Bool)

(assert (=> b!210554 (= e!137080 (+!557 call!19922 (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210555 () Bool)

(assert (=> b!210555 (= e!137089 (= (apply!192 lt!107829 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2544 (select (arr!4749 lt!107646) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5075 lt!107646)))))

(assert (=> b!210555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210556 () Bool)

(assert (=> b!210556 (= e!137082 (= (apply!192 lt!107829 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!19921 () Bool)

(assert (=> bm!19921 (= call!19919 (contains!1377 lt!107829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57831 c!35598) b!210554))

(assert (= (and d!57831 (not c!35598)) b!210546))

(assert (= (and b!210546 c!35597) b!210549))

(assert (= (and b!210546 (not c!35597)) b!210543))

(assert (= (and b!210543 c!35593) b!210540))

(assert (= (and b!210543 (not c!35593)) b!210552))

(assert (= (or b!210540 b!210552) bm!19917))

(assert (= (or b!210549 bm!19917) bm!19919))

(assert (= (or b!210549 b!210540) bm!19915))

(assert (= (or b!210554 bm!19919) bm!19918))

(assert (= (or b!210554 bm!19915) bm!19916))

(assert (= (and d!57831 res!102705) b!210544))

(assert (= (and d!57831 c!35596) b!210550))

(assert (= (and d!57831 (not c!35596)) b!210547))

(assert (= (and d!57831 res!102708) b!210545))

(assert (= (and b!210545 res!102713) b!210536))

(assert (= (and b!210545 (not res!102707)) b!210548))

(assert (= (and b!210548 res!102710) b!210555))

(assert (= (and b!210545 res!102712) b!210539))

(assert (= (and b!210539 c!35595) b!210551))

(assert (= (and b!210539 (not c!35595)) b!210553))

(assert (= (and b!210551 res!102706) b!210556))

(assert (= (or b!210551 b!210553) bm!19921))

(assert (= (and b!210539 res!102711) b!210538))

(assert (= (and b!210538 c!35594) b!210542))

(assert (= (and b!210538 (not c!35594)) b!210541))

(assert (= (and b!210542 res!102709) b!210537))

(assert (= (or b!210542 b!210541) bm!19920))

(declare-fun b_lambda!7599 () Bool)

(assert (=> (not b_lambda!7599) (not b!210555)))

(assert (=> b!210555 t!7973))

(declare-fun b_and!12313 () Bool)

(assert (= b_and!12311 (and (=> t!7973 result!4971) b_and!12313)))

(assert (=> b!210555 m!237525))

(assert (=> b!210555 m!237545))

(assert (=> b!210555 m!237545))

(assert (=> b!210555 m!237543))

(assert (=> b!210555 m!237547))

(assert (=> b!210555 m!237525))

(declare-fun m!237615 () Bool)

(assert (=> b!210555 m!237615))

(assert (=> b!210555 m!237543))

(assert (=> b!210544 m!237525))

(assert (=> b!210544 m!237525))

(assert (=> b!210544 m!237529))

(assert (=> b!210536 m!237525))

(assert (=> b!210536 m!237525))

(assert (=> b!210536 m!237529))

(assert (=> bm!19918 m!237399))

(declare-fun m!237617 () Bool)

(assert (=> bm!19916 m!237617))

(declare-fun m!237619 () Bool)

(assert (=> b!210550 m!237619))

(declare-fun m!237621 () Bool)

(assert (=> b!210550 m!237621))

(declare-fun m!237623 () Bool)

(assert (=> b!210550 m!237623))

(declare-fun m!237625 () Bool)

(assert (=> b!210550 m!237625))

(declare-fun m!237627 () Bool)

(assert (=> b!210550 m!237627))

(declare-fun m!237629 () Bool)

(assert (=> b!210550 m!237629))

(assert (=> b!210550 m!237625))

(declare-fun m!237631 () Bool)

(assert (=> b!210550 m!237631))

(assert (=> b!210550 m!237399))

(declare-fun m!237633 () Bool)

(assert (=> b!210550 m!237633))

(declare-fun m!237635 () Bool)

(assert (=> b!210550 m!237635))

(declare-fun m!237637 () Bool)

(assert (=> b!210550 m!237637))

(declare-fun m!237639 () Bool)

(assert (=> b!210550 m!237639))

(declare-fun m!237641 () Bool)

(assert (=> b!210550 m!237641))

(assert (=> b!210550 m!237631))

(declare-fun m!237643 () Bool)

(assert (=> b!210550 m!237643))

(assert (=> b!210550 m!237637))

(assert (=> b!210550 m!237635))

(declare-fun m!237645 () Bool)

(assert (=> b!210550 m!237645))

(declare-fun m!237647 () Bool)

(assert (=> b!210550 m!237647))

(assert (=> b!210550 m!237525))

(declare-fun m!237649 () Bool)

(assert (=> b!210537 m!237649))

(assert (=> b!210548 m!237525))

(assert (=> b!210548 m!237525))

(declare-fun m!237651 () Bool)

(assert (=> b!210548 m!237651))

(declare-fun m!237653 () Bool)

(assert (=> bm!19920 m!237653))

(declare-fun m!237655 () Bool)

(assert (=> bm!19921 m!237655))

(declare-fun m!237657 () Bool)

(assert (=> b!210554 m!237657))

(assert (=> d!57831 m!237411))

(declare-fun m!237659 () Bool)

(assert (=> b!210556 m!237659))

(assert (=> b!210342 d!57831))

(declare-fun b!210557 () Bool)

(declare-fun e!137098 () ListLongMap!3035)

(declare-fun call!19925 () ListLongMap!3035)

(assert (=> b!210557 (= e!137098 call!19925)))

(declare-fun bm!19922 () Bool)

(assert (=> bm!19922 (= call!19925 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210559 () Bool)

(assert (=> b!210559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> b!210559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5075 _values!649)))))

(declare-fun e!137099 () Bool)

(declare-fun lt!107854 () ListLongMap!3035)

(assert (=> b!210559 (= e!137099 (= (apply!192 lt!107854 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)) (get!2544 (select (arr!4749 _values!649) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210560 () Bool)

(declare-fun e!137097 () Bool)

(declare-fun e!137093 () Bool)

(assert (=> b!210560 (= e!137097 e!137093)))

(declare-fun c!35600 () Bool)

(declare-fun e!137095 () Bool)

(assert (=> b!210560 (= c!35600 e!137095)))

(declare-fun res!102717 () Bool)

(assert (=> b!210560 (=> (not res!102717) (not e!137095))))

(assert (=> b!210560 (= res!102717 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210561 () Bool)

(declare-fun e!137096 () Bool)

(assert (=> b!210561 (= e!137093 e!137096)))

(declare-fun c!35602 () Bool)

(assert (=> b!210561 (= c!35602 (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun b!210562 () Bool)

(declare-fun e!137094 () ListLongMap!3035)

(assert (=> b!210562 (= e!137094 e!137098)))

(declare-fun c!35601 () Bool)

(assert (=> b!210562 (= c!35601 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210563 () Bool)

(declare-fun lt!107849 () Unit!6356)

(declare-fun lt!107850 () Unit!6356)

(assert (=> b!210563 (= lt!107849 lt!107850)))

(declare-fun lt!107848 () V!6857)

(declare-fun lt!107853 () (_ BitVec 64))

(declare-fun lt!107851 () ListLongMap!3035)

(declare-fun lt!107852 () (_ BitVec 64))

(assert (=> b!210563 (not (contains!1377 (+!557 lt!107851 (tuple2!4133 lt!107852 lt!107848)) lt!107853))))

(assert (=> b!210563 (= lt!107850 (addStillNotContains!102 lt!107851 lt!107852 lt!107848 lt!107853))))

(assert (=> b!210563 (= lt!107853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210563 (= lt!107848 (get!2544 (select (arr!4749 _values!649) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210563 (= lt!107852 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210563 (= lt!107851 call!19925)))

(assert (=> b!210563 (= e!137098 (+!557 call!19925 (tuple2!4133 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) (get!2544 (select (arr!4749 _values!649) #b00000000000000000000000000000000) (dynLambda!526 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210564 () Bool)

(assert (=> b!210564 (= e!137093 e!137099)))

(assert (=> b!210564 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(declare-fun res!102716 () Bool)

(assert (=> b!210564 (= res!102716 (contains!1377 lt!107854 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210564 (=> (not res!102716) (not e!137099))))

(declare-fun b!210565 () Bool)

(assert (=> b!210565 (= e!137095 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210565 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210566 () Bool)

(assert (=> b!210566 (= e!137094 (ListLongMap!3036 Nil!3038))))

(declare-fun d!57833 () Bool)

(assert (=> d!57833 e!137097))

(declare-fun res!102715 () Bool)

(assert (=> d!57833 (=> (not res!102715) (not e!137097))))

(assert (=> d!57833 (= res!102715 (not (contains!1377 lt!107854 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57833 (= lt!107854 e!137094)))

(declare-fun c!35599 () Bool)

(assert (=> d!57833 (= c!35599 (bvsge #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57833 (validMask!0 mask!1149)))

(assert (=> d!57833 (= (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107854)))

(declare-fun b!210558 () Bool)

(assert (=> b!210558 (= e!137096 (= lt!107854 (getCurrentListMapNoExtraKeys!482 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210567 () Bool)

(assert (=> b!210567 (= e!137096 (isEmpty!497 lt!107854))))

(declare-fun b!210568 () Bool)

(declare-fun res!102714 () Bool)

(assert (=> b!210568 (=> (not res!102714) (not e!137097))))

(assert (=> b!210568 (= res!102714 (not (contains!1377 lt!107854 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57833 c!35599) b!210566))

(assert (= (and d!57833 (not c!35599)) b!210562))

(assert (= (and b!210562 c!35601) b!210563))

(assert (= (and b!210562 (not c!35601)) b!210557))

(assert (= (or b!210563 b!210557) bm!19922))

(assert (= (and d!57833 res!102715) b!210568))

(assert (= (and b!210568 res!102714) b!210560))

(assert (= (and b!210560 res!102717) b!210565))

(assert (= (and b!210560 c!35600) b!210564))

(assert (= (and b!210560 (not c!35600)) b!210561))

(assert (= (and b!210564 res!102716) b!210559))

(assert (= (and b!210561 c!35602) b!210558))

(assert (= (and b!210561 (not c!35602)) b!210567))

(declare-fun b_lambda!7601 () Bool)

(assert (=> (not b_lambda!7601) (not b!210559)))

(assert (=> b!210559 t!7973))

(declare-fun b_and!12315 () Bool)

(assert (= b_and!12313 (and (=> t!7973 result!4971) b_and!12315)))

(declare-fun b_lambda!7603 () Bool)

(assert (=> (not b_lambda!7603) (not b!210563)))

(assert (=> b!210563 t!7973))

(declare-fun b_and!12317 () Bool)

(assert (= b_and!12315 (and (=> t!7973 result!4971) b_and!12317)))

(declare-fun m!237661 () Bool)

(assert (=> bm!19922 m!237661))

(assert (=> b!210565 m!237525))

(assert (=> b!210565 m!237525))

(assert (=> b!210565 m!237529))

(declare-fun m!237663 () Bool)

(assert (=> b!210568 m!237663))

(declare-fun m!237665 () Bool)

(assert (=> d!57833 m!237665))

(assert (=> d!57833 m!237411))

(assert (=> b!210562 m!237525))

(assert (=> b!210562 m!237525))

(assert (=> b!210562 m!237529))

(assert (=> b!210564 m!237525))

(assert (=> b!210564 m!237525))

(declare-fun m!237667 () Bool)

(assert (=> b!210564 m!237667))

(declare-fun m!237669 () Bool)

(assert (=> b!210567 m!237669))

(assert (=> b!210559 m!237543))

(assert (=> b!210559 m!237565))

(assert (=> b!210559 m!237543))

(assert (=> b!210559 m!237567))

(assert (=> b!210559 m!237565))

(assert (=> b!210559 m!237525))

(assert (=> b!210559 m!237525))

(declare-fun m!237671 () Bool)

(assert (=> b!210559 m!237671))

(declare-fun m!237673 () Bool)

(assert (=> b!210563 m!237673))

(declare-fun m!237675 () Bool)

(assert (=> b!210563 m!237675))

(assert (=> b!210563 m!237543))

(assert (=> b!210563 m!237565))

(assert (=> b!210563 m!237543))

(assert (=> b!210563 m!237567))

(assert (=> b!210563 m!237565))

(declare-fun m!237677 () Bool)

(assert (=> b!210563 m!237677))

(assert (=> b!210563 m!237525))

(assert (=> b!210563 m!237677))

(declare-fun m!237679 () Bool)

(assert (=> b!210563 m!237679))

(assert (=> b!210558 m!237661))

(assert (=> b!210342 d!57833))

(declare-fun d!57835 () Bool)

(declare-fun e!137102 () Bool)

(assert (=> d!57835 e!137102))

(declare-fun res!102722 () Bool)

(assert (=> d!57835 (=> (not res!102722) (not e!137102))))

(declare-fun lt!107866 () ListLongMap!3035)

(assert (=> d!57835 (= res!102722 (contains!1377 lt!107866 (_1!2077 lt!107650)))))

(declare-fun lt!107863 () List!3041)

(assert (=> d!57835 (= lt!107866 (ListLongMap!3036 lt!107863))))

(declare-fun lt!107865 () Unit!6356)

(declare-fun lt!107864 () Unit!6356)

(assert (=> d!57835 (= lt!107865 lt!107864)))

(declare-datatypes ((Option!254 0))(
  ( (Some!253 (v!4730 V!6857)) (None!252) )
))
(declare-fun getValueByKey!248 (List!3041 (_ BitVec 64)) Option!254)

(assert (=> d!57835 (= (getValueByKey!248 lt!107863 (_1!2077 lt!107650)) (Some!253 (_2!2077 lt!107650)))))

(declare-fun lemmaContainsTupThenGetReturnValue!138 (List!3041 (_ BitVec 64) V!6857) Unit!6356)

(assert (=> d!57835 (= lt!107864 (lemmaContainsTupThenGetReturnValue!138 lt!107863 (_1!2077 lt!107650) (_2!2077 lt!107650)))))

(declare-fun insertStrictlySorted!141 (List!3041 (_ BitVec 64) V!6857) List!3041)

(assert (=> d!57835 (= lt!107863 (insertStrictlySorted!141 (toList!1533 lt!107654) (_1!2077 lt!107650) (_2!2077 lt!107650)))))

(assert (=> d!57835 (= (+!557 lt!107654 lt!107650) lt!107866)))

(declare-fun b!210573 () Bool)

(declare-fun res!102723 () Bool)

(assert (=> b!210573 (=> (not res!102723) (not e!137102))))

(assert (=> b!210573 (= res!102723 (= (getValueByKey!248 (toList!1533 lt!107866) (_1!2077 lt!107650)) (Some!253 (_2!2077 lt!107650))))))

(declare-fun b!210574 () Bool)

(declare-fun contains!1378 (List!3041 tuple2!4132) Bool)

(assert (=> b!210574 (= e!137102 (contains!1378 (toList!1533 lt!107866) lt!107650))))

(assert (= (and d!57835 res!102722) b!210573))

(assert (= (and b!210573 res!102723) b!210574))

(declare-fun m!237681 () Bool)

(assert (=> d!57835 m!237681))

(declare-fun m!237683 () Bool)

(assert (=> d!57835 m!237683))

(declare-fun m!237685 () Bool)

(assert (=> d!57835 m!237685))

(declare-fun m!237687 () Bool)

(assert (=> d!57835 m!237687))

(declare-fun m!237689 () Bool)

(assert (=> b!210573 m!237689))

(declare-fun m!237691 () Bool)

(assert (=> b!210574 m!237691))

(assert (=> b!210342 d!57835))

(declare-fun b!210583 () Bool)

(declare-fun e!137109 () Bool)

(declare-fun call!19928 () Bool)

(assert (=> b!210583 (= e!137109 call!19928)))

(declare-fun b!210584 () Bool)

(declare-fun e!137111 () Bool)

(declare-fun e!137110 () Bool)

(assert (=> b!210584 (= e!137111 e!137110)))

(declare-fun c!35605 () Bool)

(assert (=> b!210584 (= c!35605 (validKeyInArray!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210585 () Bool)

(assert (=> b!210585 (= e!137110 e!137109)))

(declare-fun lt!107875 () (_ BitVec 64))

(assert (=> b!210585 (= lt!107875 (select (arr!4748 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107874 () Unit!6356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10003 (_ BitVec 64) (_ BitVec 32)) Unit!6356)

(assert (=> b!210585 (= lt!107874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107875 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210585 (arrayContainsKey!0 _keys!825 lt!107875 #b00000000000000000000000000000000)))

(declare-fun lt!107873 () Unit!6356)

(assert (=> b!210585 (= lt!107873 lt!107874)))

(declare-fun res!102729 () Bool)

(declare-datatypes ((SeekEntryResult!708 0))(
  ( (MissingZero!708 (index!5002 (_ BitVec 32))) (Found!708 (index!5003 (_ BitVec 32))) (Intermediate!708 (undefined!1520 Bool) (index!5004 (_ BitVec 32)) (x!22042 (_ BitVec 32))) (Undefined!708) (MissingVacant!708 (index!5005 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10003 (_ BitVec 32)) SeekEntryResult!708)

(assert (=> b!210585 (= res!102729 (= (seekEntryOrOpen!0 (select (arr!4748 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!708 #b00000000000000000000000000000000)))))

(assert (=> b!210585 (=> (not res!102729) (not e!137109))))

(declare-fun b!210586 () Bool)

(assert (=> b!210586 (= e!137110 call!19928)))

(declare-fun d!57837 () Bool)

(declare-fun res!102728 () Bool)

(assert (=> d!57837 (=> res!102728 e!137111)))

(assert (=> d!57837 (= res!102728 (bvsge #b00000000000000000000000000000000 (size!5074 _keys!825)))))

(assert (=> d!57837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137111)))

(declare-fun bm!19925 () Bool)

(assert (=> bm!19925 (= call!19928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(assert (= (and d!57837 (not res!102728)) b!210584))

(assert (= (and b!210584 c!35605) b!210585))

(assert (= (and b!210584 (not c!35605)) b!210586))

(assert (= (and b!210585 res!102729) b!210583))

(assert (= (or b!210583 b!210586) bm!19925))

(assert (=> b!210584 m!237525))

(assert (=> b!210584 m!237525))

(assert (=> b!210584 m!237529))

(assert (=> b!210585 m!237525))

(declare-fun m!237693 () Bool)

(assert (=> b!210585 m!237693))

(declare-fun m!237695 () Bool)

(assert (=> b!210585 m!237695))

(assert (=> b!210585 m!237525))

(declare-fun m!237697 () Bool)

(assert (=> b!210585 m!237697))

(declare-fun m!237699 () Bool)

(assert (=> bm!19925 m!237699))

(assert (=> b!210343 d!57837))

(declare-fun d!57839 () Bool)

(declare-fun e!137112 () Bool)

(assert (=> d!57839 e!137112))

(declare-fun res!102730 () Bool)

(assert (=> d!57839 (=> (not res!102730) (not e!137112))))

(declare-fun lt!107879 () ListLongMap!3035)

(assert (=> d!57839 (= res!102730 (contains!1377 lt!107879 (_1!2077 lt!107652)))))

(declare-fun lt!107876 () List!3041)

(assert (=> d!57839 (= lt!107879 (ListLongMap!3036 lt!107876))))

(declare-fun lt!107878 () Unit!6356)

(declare-fun lt!107877 () Unit!6356)

(assert (=> d!57839 (= lt!107878 lt!107877)))

(assert (=> d!57839 (= (getValueByKey!248 lt!107876 (_1!2077 lt!107652)) (Some!253 (_2!2077 lt!107652)))))

(assert (=> d!57839 (= lt!107877 (lemmaContainsTupThenGetReturnValue!138 lt!107876 (_1!2077 lt!107652) (_2!2077 lt!107652)))))

(assert (=> d!57839 (= lt!107876 (insertStrictlySorted!141 (toList!1533 lt!107645) (_1!2077 lt!107652) (_2!2077 lt!107652)))))

(assert (=> d!57839 (= (+!557 lt!107645 lt!107652) lt!107879)))

(declare-fun b!210587 () Bool)

(declare-fun res!102731 () Bool)

(assert (=> b!210587 (=> (not res!102731) (not e!137112))))

(assert (=> b!210587 (= res!102731 (= (getValueByKey!248 (toList!1533 lt!107879) (_1!2077 lt!107652)) (Some!253 (_2!2077 lt!107652))))))

(declare-fun b!210588 () Bool)

(assert (=> b!210588 (= e!137112 (contains!1378 (toList!1533 lt!107879) lt!107652))))

(assert (= (and d!57839 res!102730) b!210587))

(assert (= (and b!210587 res!102731) b!210588))

(declare-fun m!237701 () Bool)

(assert (=> d!57839 m!237701))

(declare-fun m!237703 () Bool)

(assert (=> d!57839 m!237703))

(declare-fun m!237705 () Bool)

(assert (=> d!57839 m!237705))

(declare-fun m!237707 () Bool)

(assert (=> d!57839 m!237707))

(declare-fun m!237709 () Bool)

(assert (=> b!210587 m!237709))

(declare-fun m!237711 () Bool)

(assert (=> b!210588 m!237711))

(assert (=> b!210339 d!57839))

(declare-fun d!57841 () Bool)

(declare-fun e!137113 () Bool)

(assert (=> d!57841 e!137113))

(declare-fun res!102732 () Bool)

(assert (=> d!57841 (=> (not res!102732) (not e!137113))))

(declare-fun lt!107883 () ListLongMap!3035)

(assert (=> d!57841 (= res!102732 (contains!1377 lt!107883 (_1!2077 lt!107648)))))

(declare-fun lt!107880 () List!3041)

(assert (=> d!57841 (= lt!107883 (ListLongMap!3036 lt!107880))))

(declare-fun lt!107882 () Unit!6356)

(declare-fun lt!107881 () Unit!6356)

(assert (=> d!57841 (= lt!107882 lt!107881)))

(assert (=> d!57841 (= (getValueByKey!248 lt!107880 (_1!2077 lt!107648)) (Some!253 (_2!2077 lt!107648)))))

(assert (=> d!57841 (= lt!107881 (lemmaContainsTupThenGetReturnValue!138 lt!107880 (_1!2077 lt!107648) (_2!2077 lt!107648)))))

(assert (=> d!57841 (= lt!107880 (insertStrictlySorted!141 (toList!1533 lt!107649) (_1!2077 lt!107648) (_2!2077 lt!107648)))))

(assert (=> d!57841 (= (+!557 lt!107649 lt!107648) lt!107883)))

(declare-fun b!210589 () Bool)

(declare-fun res!102733 () Bool)

(assert (=> b!210589 (=> (not res!102733) (not e!137113))))

(assert (=> b!210589 (= res!102733 (= (getValueByKey!248 (toList!1533 lt!107883) (_1!2077 lt!107648)) (Some!253 (_2!2077 lt!107648))))))

(declare-fun b!210590 () Bool)

(assert (=> b!210590 (= e!137113 (contains!1378 (toList!1533 lt!107883) lt!107648))))

(assert (= (and d!57841 res!102732) b!210589))

(assert (= (and b!210589 res!102733) b!210590))

(declare-fun m!237713 () Bool)

(assert (=> d!57841 m!237713))

(declare-fun m!237715 () Bool)

(assert (=> d!57841 m!237715))

(declare-fun m!237717 () Bool)

(assert (=> d!57841 m!237717))

(declare-fun m!237719 () Bool)

(assert (=> d!57841 m!237719))

(declare-fun m!237721 () Bool)

(assert (=> b!210589 m!237721))

(declare-fun m!237723 () Bool)

(assert (=> b!210590 m!237723))

(assert (=> b!210339 d!57841))

(declare-fun d!57843 () Bool)

(assert (=> d!57843 (= (+!557 (+!557 lt!107654 (tuple2!4133 k0!843 v!520)) (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (+!557 (+!557 lt!107654 (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4133 k0!843 v!520)))))

(declare-fun lt!107886 () Unit!6356)

(declare-fun choose!1083 (ListLongMap!3035 (_ BitVec 64) V!6857 (_ BitVec 64) V!6857) Unit!6356)

(assert (=> d!57843 (= lt!107886 (choose!1083 lt!107654 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> d!57843 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57843 (= (addCommutativeForDiffKeys!192 lt!107654 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) lt!107886)))

(declare-fun bs!8241 () Bool)

(assert (= bs!8241 d!57843))

(declare-fun m!237725 () Bool)

(assert (=> bs!8241 m!237725))

(declare-fun m!237727 () Bool)

(assert (=> bs!8241 m!237727))

(declare-fun m!237729 () Bool)

(assert (=> bs!8241 m!237729))

(declare-fun m!237731 () Bool)

(assert (=> bs!8241 m!237731))

(assert (=> bs!8241 m!237725))

(declare-fun m!237733 () Bool)

(assert (=> bs!8241 m!237733))

(assert (=> bs!8241 m!237729))

(assert (=> b!210339 d!57843))

(declare-fun d!57845 () Bool)

(declare-fun e!137114 () Bool)

(assert (=> d!57845 e!137114))

(declare-fun res!102734 () Bool)

(assert (=> d!57845 (=> (not res!102734) (not e!137114))))

(declare-fun lt!107890 () ListLongMap!3035)

(assert (=> d!57845 (= res!102734 (contains!1377 lt!107890 (_1!2077 lt!107648)))))

(declare-fun lt!107887 () List!3041)

(assert (=> d!57845 (= lt!107890 (ListLongMap!3036 lt!107887))))

(declare-fun lt!107889 () Unit!6356)

(declare-fun lt!107888 () Unit!6356)

(assert (=> d!57845 (= lt!107889 lt!107888)))

(assert (=> d!57845 (= (getValueByKey!248 lt!107887 (_1!2077 lt!107648)) (Some!253 (_2!2077 lt!107648)))))

(assert (=> d!57845 (= lt!107888 (lemmaContainsTupThenGetReturnValue!138 lt!107887 (_1!2077 lt!107648) (_2!2077 lt!107648)))))

(assert (=> d!57845 (= lt!107887 (insertStrictlySorted!141 (toList!1533 lt!107655) (_1!2077 lt!107648) (_2!2077 lt!107648)))))

(assert (=> d!57845 (= (+!557 lt!107655 lt!107648) lt!107890)))

(declare-fun b!210591 () Bool)

(declare-fun res!102735 () Bool)

(assert (=> b!210591 (=> (not res!102735) (not e!137114))))

(assert (=> b!210591 (= res!102735 (= (getValueByKey!248 (toList!1533 lt!107890) (_1!2077 lt!107648)) (Some!253 (_2!2077 lt!107648))))))

(declare-fun b!210592 () Bool)

(assert (=> b!210592 (= e!137114 (contains!1378 (toList!1533 lt!107890) lt!107648))))

(assert (= (and d!57845 res!102734) b!210591))

(assert (= (and b!210591 res!102735) b!210592))

(declare-fun m!237735 () Bool)

(assert (=> d!57845 m!237735))

(declare-fun m!237737 () Bool)

(assert (=> d!57845 m!237737))

(declare-fun m!237739 () Bool)

(assert (=> d!57845 m!237739))

(declare-fun m!237741 () Bool)

(assert (=> d!57845 m!237741))

(declare-fun m!237743 () Bool)

(assert (=> b!210591 m!237743))

(declare-fun m!237745 () Bool)

(assert (=> b!210592 m!237745))

(assert (=> b!210339 d!57845))

(declare-fun d!57847 () Bool)

(declare-fun e!137115 () Bool)

(assert (=> d!57847 e!137115))

(declare-fun res!102736 () Bool)

(assert (=> d!57847 (=> (not res!102736) (not e!137115))))

(declare-fun lt!107894 () ListLongMap!3035)

(assert (=> d!57847 (= res!102736 (contains!1377 lt!107894 (_1!2077 lt!107652)))))

(declare-fun lt!107891 () List!3041)

(assert (=> d!57847 (= lt!107894 (ListLongMap!3036 lt!107891))))

(declare-fun lt!107893 () Unit!6356)

(declare-fun lt!107892 () Unit!6356)

(assert (=> d!57847 (= lt!107893 lt!107892)))

(assert (=> d!57847 (= (getValueByKey!248 lt!107891 (_1!2077 lt!107652)) (Some!253 (_2!2077 lt!107652)))))

(assert (=> d!57847 (= lt!107892 (lemmaContainsTupThenGetReturnValue!138 lt!107891 (_1!2077 lt!107652) (_2!2077 lt!107652)))))

(assert (=> d!57847 (= lt!107891 (insertStrictlySorted!141 (toList!1533 lt!107651) (_1!2077 lt!107652) (_2!2077 lt!107652)))))

(assert (=> d!57847 (= (+!557 lt!107651 lt!107652) lt!107894)))

(declare-fun b!210593 () Bool)

(declare-fun res!102737 () Bool)

(assert (=> b!210593 (=> (not res!102737) (not e!137115))))

(assert (=> b!210593 (= res!102737 (= (getValueByKey!248 (toList!1533 lt!107894) (_1!2077 lt!107652)) (Some!253 (_2!2077 lt!107652))))))

(declare-fun b!210594 () Bool)

(assert (=> b!210594 (= e!137115 (contains!1378 (toList!1533 lt!107894) lt!107652))))

(assert (= (and d!57847 res!102736) b!210593))

(assert (= (and b!210593 res!102737) b!210594))

(declare-fun m!237747 () Bool)

(assert (=> d!57847 m!237747))

(declare-fun m!237749 () Bool)

(assert (=> d!57847 m!237749))

(declare-fun m!237751 () Bool)

(assert (=> d!57847 m!237751))

(declare-fun m!237753 () Bool)

(assert (=> d!57847 m!237753))

(declare-fun m!237755 () Bool)

(assert (=> b!210593 m!237755))

(declare-fun m!237757 () Bool)

(assert (=> b!210594 m!237757))

(assert (=> b!210339 d!57847))

(declare-fun d!57849 () Bool)

(declare-fun e!137116 () Bool)

(assert (=> d!57849 e!137116))

(declare-fun res!102738 () Bool)

(assert (=> d!57849 (=> (not res!102738) (not e!137116))))

(declare-fun lt!107898 () ListLongMap!3035)

(assert (=> d!57849 (= res!102738 (contains!1377 lt!107898 (_1!2077 lt!107648)))))

(declare-fun lt!107895 () List!3041)

(assert (=> d!57849 (= lt!107898 (ListLongMap!3036 lt!107895))))

(declare-fun lt!107897 () Unit!6356)

(declare-fun lt!107896 () Unit!6356)

(assert (=> d!57849 (= lt!107897 lt!107896)))

(assert (=> d!57849 (= (getValueByKey!248 lt!107895 (_1!2077 lt!107648)) (Some!253 (_2!2077 lt!107648)))))

(assert (=> d!57849 (= lt!107896 (lemmaContainsTupThenGetReturnValue!138 lt!107895 (_1!2077 lt!107648) (_2!2077 lt!107648)))))

(assert (=> d!57849 (= lt!107895 (insertStrictlySorted!141 (toList!1533 lt!107654) (_1!2077 lt!107648) (_2!2077 lt!107648)))))

(assert (=> d!57849 (= (+!557 lt!107654 lt!107648) lt!107898)))

(declare-fun b!210595 () Bool)

(declare-fun res!102739 () Bool)

(assert (=> b!210595 (=> (not res!102739) (not e!137116))))

(assert (=> b!210595 (= res!102739 (= (getValueByKey!248 (toList!1533 lt!107898) (_1!2077 lt!107648)) (Some!253 (_2!2077 lt!107648))))))

(declare-fun b!210596 () Bool)

(assert (=> b!210596 (= e!137116 (contains!1378 (toList!1533 lt!107898) lt!107648))))

(assert (= (and d!57849 res!102738) b!210595))

(assert (= (and b!210595 res!102739) b!210596))

(declare-fun m!237759 () Bool)

(assert (=> d!57849 m!237759))

(declare-fun m!237761 () Bool)

(assert (=> d!57849 m!237761))

(declare-fun m!237763 () Bool)

(assert (=> d!57849 m!237763))

(declare-fun m!237765 () Bool)

(assert (=> d!57849 m!237765))

(declare-fun m!237767 () Bool)

(assert (=> b!210595 m!237767))

(declare-fun m!237769 () Bool)

(assert (=> b!210596 m!237769))

(assert (=> b!210339 d!57849))

(declare-fun d!57851 () Bool)

(declare-fun e!137117 () Bool)

(assert (=> d!57851 e!137117))

(declare-fun res!102740 () Bool)

(assert (=> d!57851 (=> (not res!102740) (not e!137117))))

(declare-fun lt!107902 () ListLongMap!3035)

(assert (=> d!57851 (= res!102740 (contains!1377 lt!107902 (_1!2077 lt!107650)))))

(declare-fun lt!107899 () List!3041)

(assert (=> d!57851 (= lt!107902 (ListLongMap!3036 lt!107899))))

(declare-fun lt!107901 () Unit!6356)

(declare-fun lt!107900 () Unit!6356)

(assert (=> d!57851 (= lt!107901 lt!107900)))

(assert (=> d!57851 (= (getValueByKey!248 lt!107899 (_1!2077 lt!107650)) (Some!253 (_2!2077 lt!107650)))))

(assert (=> d!57851 (= lt!107900 (lemmaContainsTupThenGetReturnValue!138 lt!107899 (_1!2077 lt!107650) (_2!2077 lt!107650)))))

(assert (=> d!57851 (= lt!107899 (insertStrictlySorted!141 (toList!1533 lt!107651) (_1!2077 lt!107650) (_2!2077 lt!107650)))))

(assert (=> d!57851 (= (+!557 lt!107651 lt!107650) lt!107902)))

(declare-fun b!210597 () Bool)

(declare-fun res!102741 () Bool)

(assert (=> b!210597 (=> (not res!102741) (not e!137117))))

(assert (=> b!210597 (= res!102741 (= (getValueByKey!248 (toList!1533 lt!107902) (_1!2077 lt!107650)) (Some!253 (_2!2077 lt!107650))))))

(declare-fun b!210598 () Bool)

(assert (=> b!210598 (= e!137117 (contains!1378 (toList!1533 lt!107902) lt!107650))))

(assert (= (and d!57851 res!102740) b!210597))

(assert (= (and b!210597 res!102741) b!210598))

(declare-fun m!237771 () Bool)

(assert (=> d!57851 m!237771))

(declare-fun m!237773 () Bool)

(assert (=> d!57851 m!237773))

(declare-fun m!237775 () Bool)

(assert (=> d!57851 m!237775))

(declare-fun m!237777 () Bool)

(assert (=> d!57851 m!237777))

(declare-fun m!237779 () Bool)

(assert (=> b!210597 m!237779))

(declare-fun m!237781 () Bool)

(assert (=> b!210598 m!237781))

(assert (=> b!210339 d!57851))

(declare-fun d!57853 () Bool)

(declare-fun e!137118 () Bool)

(assert (=> d!57853 e!137118))

(declare-fun res!102742 () Bool)

(assert (=> d!57853 (=> (not res!102742) (not e!137118))))

(declare-fun lt!107906 () ListLongMap!3035)

(assert (=> d!57853 (= res!102742 (contains!1377 lt!107906 (_1!2077 lt!107652)))))

(declare-fun lt!107903 () List!3041)

(assert (=> d!57853 (= lt!107906 (ListLongMap!3036 lt!107903))))

(declare-fun lt!107905 () Unit!6356)

(declare-fun lt!107904 () Unit!6356)

(assert (=> d!57853 (= lt!107905 lt!107904)))

(assert (=> d!57853 (= (getValueByKey!248 lt!107903 (_1!2077 lt!107652)) (Some!253 (_2!2077 lt!107652)))))

(assert (=> d!57853 (= lt!107904 (lemmaContainsTupThenGetReturnValue!138 lt!107903 (_1!2077 lt!107652) (_2!2077 lt!107652)))))

(assert (=> d!57853 (= lt!107903 (insertStrictlySorted!141 (toList!1533 (+!557 lt!107655 lt!107648)) (_1!2077 lt!107652) (_2!2077 lt!107652)))))

(assert (=> d!57853 (= (+!557 (+!557 lt!107655 lt!107648) lt!107652) lt!107906)))

(declare-fun b!210599 () Bool)

(declare-fun res!102743 () Bool)

(assert (=> b!210599 (=> (not res!102743) (not e!137118))))

(assert (=> b!210599 (= res!102743 (= (getValueByKey!248 (toList!1533 lt!107906) (_1!2077 lt!107652)) (Some!253 (_2!2077 lt!107652))))))

(declare-fun b!210600 () Bool)

(assert (=> b!210600 (= e!137118 (contains!1378 (toList!1533 lt!107906) lt!107652))))

(assert (= (and d!57853 res!102742) b!210599))

(assert (= (and b!210599 res!102743) b!210600))

(declare-fun m!237783 () Bool)

(assert (=> d!57853 m!237783))

(declare-fun m!237785 () Bool)

(assert (=> d!57853 m!237785))

(declare-fun m!237787 () Bool)

(assert (=> d!57853 m!237787))

(declare-fun m!237789 () Bool)

(assert (=> d!57853 m!237789))

(declare-fun m!237791 () Bool)

(assert (=> b!210599 m!237791))

(declare-fun m!237793 () Bool)

(assert (=> b!210600 m!237793))

(assert (=> b!210339 d!57853))

(declare-fun d!57855 () Bool)

(assert (=> d!57855 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210335 d!57855))

(declare-fun b!210608 () Bool)

(declare-fun e!137123 () Bool)

(assert (=> b!210608 (= e!137123 tp_is_empty!5407)))

(declare-fun mapNonEmpty!9197 () Bool)

(declare-fun mapRes!9197 () Bool)

(declare-fun tp!19700 () Bool)

(declare-fun e!137124 () Bool)

(assert (=> mapNonEmpty!9197 (= mapRes!9197 (and tp!19700 e!137124))))

(declare-fun mapRest!9197 () (Array (_ BitVec 32) ValueCell!2360))

(declare-fun mapValue!9197 () ValueCell!2360)

(declare-fun mapKey!9197 () (_ BitVec 32))

(assert (=> mapNonEmpty!9197 (= mapRest!9188 (store mapRest!9197 mapKey!9197 mapValue!9197))))

(declare-fun b!210607 () Bool)

(assert (=> b!210607 (= e!137124 tp_is_empty!5407)))

(declare-fun condMapEmpty!9197 () Bool)

(declare-fun mapDefault!9197 () ValueCell!2360)

(assert (=> mapNonEmpty!9188 (= condMapEmpty!9197 (= mapRest!9188 ((as const (Array (_ BitVec 32) ValueCell!2360)) mapDefault!9197)))))

(assert (=> mapNonEmpty!9188 (= tp!19685 (and e!137123 mapRes!9197))))

(declare-fun mapIsEmpty!9197 () Bool)

(assert (=> mapIsEmpty!9197 mapRes!9197))

(assert (= (and mapNonEmpty!9188 condMapEmpty!9197) mapIsEmpty!9197))

(assert (= (and mapNonEmpty!9188 (not condMapEmpty!9197)) mapNonEmpty!9197))

(assert (= (and mapNonEmpty!9197 ((_ is ValueCellFull!2360) mapValue!9197)) b!210607))

(assert (= (and mapNonEmpty!9188 ((_ is ValueCellFull!2360) mapDefault!9197)) b!210608))

(declare-fun m!237795 () Bool)

(assert (=> mapNonEmpty!9197 m!237795))

(declare-fun b_lambda!7605 () Bool)

(assert (= b_lambda!7595 (or (and start!20956 b_free!5545) b_lambda!7605)))

(declare-fun b_lambda!7607 () Bool)

(assert (= b_lambda!7601 (or (and start!20956 b_free!5545) b_lambda!7607)))

(declare-fun b_lambda!7609 () Bool)

(assert (= b_lambda!7599 (or (and start!20956 b_free!5545) b_lambda!7609)))

(declare-fun b_lambda!7611 () Bool)

(assert (= b_lambda!7597 (or (and start!20956 b_free!5545) b_lambda!7611)))

(declare-fun b_lambda!7613 () Bool)

(assert (= b_lambda!7593 (or (and start!20956 b_free!5545) b_lambda!7613)))

(declare-fun b_lambda!7615 () Bool)

(assert (= b_lambda!7603 (or (and start!20956 b_free!5545) b_lambda!7615)))

(check-sat tp_is_empty!5407 (not b!210558) (not d!57835) (not b!210573) (not d!57847) (not bm!19913) (not b!210535) (not b!210584) (not d!57833) (not b!210598) (not b!210533) (not b!210458) (not bm!19922) (not bm!19921) (not b!210567) (not b!210423) (not b!210515) (not b!210536) (not b!210422) (not bm!19918) (not b!210596) (not b!210564) (not d!57853) (not b!210563) (not bm!19893) (not b!210562) (not b!210529) (not b!210559) (not b!210587) (not b!210565) (not bm!19914) (not d!57831) (not b!210424) (not b!210599) (not d!57851) (not b!210588) (not b!210554) (not d!57839) (not b!210455) (not b!210457) (not bm!19920) (not b!210593) (not b!210574) (not d!57849) (not b!210461) (not b!210595) (not d!57827) (not bm!19925) (not bm!19887) (not b!210585) (not bm!19892) (not b!210591) (not d!57825) (not b!210548) (not d!57841) b_and!12317 (not b!210600) (not b!210527) (not b!210550) (not b!210544) (not b!210452) (not b_lambda!7615) (not b_lambda!7611) (not b!210516) (not b!210568) (not bm!19911) (not b!210460) (not b!210555) (not mapNonEmpty!9197) (not bm!19884) (not b_next!5545) (not b!210556) (not b!210590) (not b!210597) (not b!210537) (not b_lambda!7605) (not b!210592) (not d!57845) (not b_lambda!7613) (not b!210451) (not b_lambda!7609) (not d!57843) (not d!57829) (not b!210589) (not b_lambda!7607) (not b!210594) (not b!210534) (not bm!19916) (not b!210470) (not b!210523) (not b!210456) (not bm!19909))
(check-sat b_and!12317 (not b_next!5545))
