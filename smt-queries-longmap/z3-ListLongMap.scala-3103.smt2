; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43566 () Bool)

(assert start!43566)

(declare-fun b_free!12337 () Bool)

(declare-fun b_next!12337 () Bool)

(assert (=> start!43566 (= b_free!12337 (not b_next!12337))))

(declare-fun tp!43297 () Bool)

(declare-fun b_and!21073 () Bool)

(assert (=> start!43566 (= tp!43297 b_and!21073)))

(declare-fun lt!218631 () (_ BitVec 32))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31351 0))(
  ( (array!31352 (arr!15077 (Array (_ BitVec 32) (_ BitVec 64))) (size!15436 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31351)

(declare-fun e!283969 () Bool)

(declare-fun b!482566 () Bool)

(assert (=> b!482566 (= e!283969 (not (or (not (= (size!15436 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsgt #b00000000000000000000000000000000 (size!15436 _keys!1874)) (and (bvsge lt!218631 #b00000000000000000000000000000000) (bvsle lt!218631 (size!15436 _keys!1874))))))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31351 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482566 (= lt!218631 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283973 () Bool)

(assert (=> b!482566 e!283973))

(declare-fun c!57940 () Bool)

(assert (=> b!482566 (= c!57940 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!19537 0))(
  ( (V!19538 (val!6972 Int)) )
))
(declare-fun minValue!1458 () V!19537)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19537)

(declare-datatypes ((ValueCell!6563 0))(
  ( (ValueCellFull!6563 (v!9260 V!19537)) (EmptyCell!6563) )
))
(declare-datatypes ((array!31353 0))(
  ( (array!31354 (arr!15078 (Array (_ BitVec 32) ValueCell!6563)) (size!15437 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31353)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((Unit!14136 0))(
  ( (Unit!14137) )
))
(declare-fun lt!218632 () Unit!14136)

(declare-fun lemmaKeyInListMapIsInArray!154 (array!31351 array!31353 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 64) Int) Unit!14136)

(assert (=> b!482566 (= lt!218632 (lemmaKeyInListMapIsInArray!154 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482567 () Bool)

(declare-fun e!283972 () Bool)

(declare-fun tp_is_empty!13849 () Bool)

(assert (=> b!482567 (= e!283972 tp_is_empty!13849)))

(declare-fun b!482568 () Bool)

(declare-fun e!283971 () Bool)

(declare-fun e!283974 () Bool)

(declare-fun mapRes!22486 () Bool)

(assert (=> b!482568 (= e!283971 (and e!283974 mapRes!22486))))

(declare-fun condMapEmpty!22486 () Bool)

(declare-fun mapDefault!22486 () ValueCell!6563)

(assert (=> b!482568 (= condMapEmpty!22486 (= (arr!15078 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6563)) mapDefault!22486)))))

(declare-fun b!482569 () Bool)

(declare-fun res!287658 () Bool)

(assert (=> b!482569 (=> (not res!287658) (not e!283969))))

(assert (=> b!482569 (= res!287658 (and (= (size!15437 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15436 _keys!1874) (size!15437 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22486 () Bool)

(declare-fun tp!43296 () Bool)

(assert (=> mapNonEmpty!22486 (= mapRes!22486 (and tp!43296 e!283972))))

(declare-fun mapKey!22486 () (_ BitVec 32))

(declare-fun mapRest!22486 () (Array (_ BitVec 32) ValueCell!6563))

(declare-fun mapValue!22486 () ValueCell!6563)

(assert (=> mapNonEmpty!22486 (= (arr!15078 _values!1516) (store mapRest!22486 mapKey!22486 mapValue!22486))))

(declare-fun mapIsEmpty!22486 () Bool)

(assert (=> mapIsEmpty!22486 mapRes!22486))

(declare-fun b!482570 () Bool)

(assert (=> b!482570 (= e!283973 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482572 () Bool)

(assert (=> b!482572 (= e!283974 tp_is_empty!13849)))

(declare-fun b!482573 () Bool)

(declare-fun res!287656 () Bool)

(assert (=> b!482573 (=> (not res!287656) (not e!283969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482573 (= res!287656 (validKeyInArray!0 k0!1332))))

(declare-fun b!482574 () Bool)

(declare-fun res!287657 () Bool)

(assert (=> b!482574 (=> (not res!287657) (not e!283969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31351 (_ BitVec 32)) Bool)

(assert (=> b!482574 (= res!287657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482575 () Bool)

(declare-fun arrayContainsKey!0 (array!31351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482575 (= e!283973 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482576 () Bool)

(declare-fun res!287654 () Bool)

(assert (=> b!482576 (=> (not res!287654) (not e!283969))))

(declare-datatypes ((tuple2!9202 0))(
  ( (tuple2!9203 (_1!4612 (_ BitVec 64)) (_2!4612 V!19537)) )
))
(declare-datatypes ((List!9267 0))(
  ( (Nil!9264) (Cons!9263 (h!10119 tuple2!9202) (t!15474 List!9267)) )
))
(declare-datatypes ((ListLongMap!8105 0))(
  ( (ListLongMap!8106 (toList!4068 List!9267)) )
))
(declare-fun contains!2648 (ListLongMap!8105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2321 (array!31351 array!31353 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 32) Int) ListLongMap!8105)

(assert (=> b!482576 (= res!287654 (contains!2648 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287655 () Bool)

(assert (=> start!43566 (=> (not res!287655) (not e!283969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43566 (= res!287655 (validMask!0 mask!2352))))

(assert (=> start!43566 e!283969))

(assert (=> start!43566 true))

(assert (=> start!43566 tp_is_empty!13849))

(declare-fun array_inv!10964 (array!31353) Bool)

(assert (=> start!43566 (and (array_inv!10964 _values!1516) e!283971)))

(assert (=> start!43566 tp!43297))

(declare-fun array_inv!10965 (array!31351) Bool)

(assert (=> start!43566 (array_inv!10965 _keys!1874)))

(declare-fun b!482571 () Bool)

(declare-fun res!287659 () Bool)

(assert (=> b!482571 (=> (not res!287659) (not e!283969))))

(declare-datatypes ((List!9268 0))(
  ( (Nil!9265) (Cons!9264 (h!10120 (_ BitVec 64)) (t!15475 List!9268)) )
))
(declare-fun arrayNoDuplicates!0 (array!31351 (_ BitVec 32) List!9268) Bool)

(assert (=> b!482571 (= res!287659 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9265))))

(assert (= (and start!43566 res!287655) b!482569))

(assert (= (and b!482569 res!287658) b!482574))

(assert (= (and b!482574 res!287657) b!482571))

(assert (= (and b!482571 res!287659) b!482576))

(assert (= (and b!482576 res!287654) b!482573))

(assert (= (and b!482573 res!287656) b!482566))

(assert (= (and b!482566 c!57940) b!482575))

(assert (= (and b!482566 (not c!57940)) b!482570))

(assert (= (and b!482568 condMapEmpty!22486) mapIsEmpty!22486))

(assert (= (and b!482568 (not condMapEmpty!22486)) mapNonEmpty!22486))

(get-info :version)

(assert (= (and mapNonEmpty!22486 ((_ is ValueCellFull!6563) mapValue!22486)) b!482567))

(assert (= (and b!482568 ((_ is ValueCellFull!6563) mapDefault!22486)) b!482572))

(assert (= start!43566 b!482568))

(declare-fun m!463237 () Bool)

(assert (=> b!482575 m!463237))

(declare-fun m!463239 () Bool)

(assert (=> b!482571 m!463239))

(declare-fun m!463241 () Bool)

(assert (=> b!482573 m!463241))

(declare-fun m!463243 () Bool)

(assert (=> mapNonEmpty!22486 m!463243))

(declare-fun m!463245 () Bool)

(assert (=> b!482566 m!463245))

(declare-fun m!463247 () Bool)

(assert (=> b!482566 m!463247))

(declare-fun m!463249 () Bool)

(assert (=> start!43566 m!463249))

(declare-fun m!463251 () Bool)

(assert (=> start!43566 m!463251))

(declare-fun m!463253 () Bool)

(assert (=> start!43566 m!463253))

(declare-fun m!463255 () Bool)

(assert (=> b!482576 m!463255))

(assert (=> b!482576 m!463255))

(declare-fun m!463257 () Bool)

(assert (=> b!482576 m!463257))

(declare-fun m!463259 () Bool)

(assert (=> b!482574 m!463259))

(check-sat (not b!482573) (not b!482576) (not b!482566) tp_is_empty!13849 b_and!21073 (not start!43566) (not b_next!12337) (not b!482575) (not b!482571) (not mapNonEmpty!22486) (not b!482574))
(check-sat b_and!21073 (not b_next!12337))
(get-model)

(declare-fun d!76649 () Bool)

(declare-fun e!284016 () Bool)

(assert (=> d!76649 e!284016))

(declare-fun res!287698 () Bool)

(assert (=> d!76649 (=> res!287698 e!284016)))

(declare-fun lt!218656 () Bool)

(assert (=> d!76649 (= res!287698 (not lt!218656))))

(declare-fun lt!218654 () Bool)

(assert (=> d!76649 (= lt!218656 lt!218654)))

(declare-fun lt!218655 () Unit!14136)

(declare-fun e!284015 () Unit!14136)

(assert (=> d!76649 (= lt!218655 e!284015)))

(declare-fun c!57949 () Bool)

(assert (=> d!76649 (= c!57949 lt!218654)))

(declare-fun containsKey!357 (List!9267 (_ BitVec 64)) Bool)

(assert (=> d!76649 (= lt!218654 (containsKey!357 (toList!4068 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76649 (= (contains!2648 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218656)))

(declare-fun b!482649 () Bool)

(declare-fun lt!218653 () Unit!14136)

(assert (=> b!482649 (= e!284015 lt!218653)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!306 (List!9267 (_ BitVec 64)) Unit!14136)

(assert (=> b!482649 (= lt!218653 (lemmaContainsKeyImpliesGetValueByKeyDefined!306 (toList!4068 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!401 0))(
  ( (Some!400 (v!9263 V!19537)) (None!399) )
))
(declare-fun isDefined!307 (Option!401) Bool)

(declare-fun getValueByKey!395 (List!9267 (_ BitVec 64)) Option!401)

(assert (=> b!482649 (isDefined!307 (getValueByKey!395 (toList!4068 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!482650 () Bool)

(declare-fun Unit!14142 () Unit!14136)

(assert (=> b!482650 (= e!284015 Unit!14142)))

(declare-fun b!482651 () Bool)

(assert (=> b!482651 (= e!284016 (isDefined!307 (getValueByKey!395 (toList!4068 (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76649 c!57949) b!482649))

(assert (= (and d!76649 (not c!57949)) b!482650))

(assert (= (and d!76649 (not res!287698)) b!482651))

(declare-fun m!463309 () Bool)

(assert (=> d!76649 m!463309))

(declare-fun m!463311 () Bool)

(assert (=> b!482649 m!463311))

(declare-fun m!463313 () Bool)

(assert (=> b!482649 m!463313))

(assert (=> b!482649 m!463313))

(declare-fun m!463315 () Bool)

(assert (=> b!482649 m!463315))

(assert (=> b!482651 m!463313))

(assert (=> b!482651 m!463313))

(assert (=> b!482651 m!463315))

(assert (=> b!482576 d!76649))

(declare-fun b!482694 () Bool)

(declare-fun res!287717 () Bool)

(declare-fun e!284053 () Bool)

(assert (=> b!482694 (=> (not res!287717) (not e!284053))))

(declare-fun e!284050 () Bool)

(assert (=> b!482694 (= res!287717 e!284050)))

(declare-fun c!57964 () Bool)

(assert (=> b!482694 (= c!57964 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!482695 () Bool)

(declare-fun e!284045 () Bool)

(declare-fun e!284049 () Bool)

(assert (=> b!482695 (= e!284045 e!284049)))

(declare-fun res!287718 () Bool)

(assert (=> b!482695 (=> (not res!287718) (not e!284049))))

(declare-fun lt!218720 () ListLongMap!8105)

(assert (=> b!482695 (= res!287718 (contains!2648 lt!218720 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!482695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15436 _keys!1874)))))

(declare-fun b!482696 () Bool)

(declare-fun e!284051 () Bool)

(assert (=> b!482696 (= e!284051 (validKeyInArray!0 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482697 () Bool)

(declare-fun e!284046 () ListLongMap!8105)

(declare-fun call!30978 () ListLongMap!8105)

(assert (=> b!482697 (= e!284046 call!30978)))

(declare-fun d!76651 () Bool)

(assert (=> d!76651 e!284053))

(declare-fun res!287725 () Bool)

(assert (=> d!76651 (=> (not res!287725) (not e!284053))))

(assert (=> d!76651 (= res!287725 (or (bvsge #b00000000000000000000000000000000 (size!15436 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15436 _keys!1874)))))))

(declare-fun lt!218716 () ListLongMap!8105)

(assert (=> d!76651 (= lt!218720 lt!218716)))

(declare-fun lt!218701 () Unit!14136)

(declare-fun e!284047 () Unit!14136)

(assert (=> d!76651 (= lt!218701 e!284047)))

(declare-fun c!57965 () Bool)

(assert (=> d!76651 (= c!57965 e!284051)))

(declare-fun res!287724 () Bool)

(assert (=> d!76651 (=> (not res!287724) (not e!284051))))

(assert (=> d!76651 (= res!287724 (bvslt #b00000000000000000000000000000000 (size!15436 _keys!1874)))))

(declare-fun e!284052 () ListLongMap!8105)

(assert (=> d!76651 (= lt!218716 e!284052)))

(declare-fun c!57966 () Bool)

(assert (=> d!76651 (= c!57966 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76651 (validMask!0 mask!2352)))

(assert (=> d!76651 (= (getCurrentListMap!2321 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218720)))

(declare-fun b!482698 () Bool)

(declare-fun call!30979 () ListLongMap!8105)

(declare-fun +!1812 (ListLongMap!8105 tuple2!9202) ListLongMap!8105)

(assert (=> b!482698 (= e!284052 (+!1812 call!30979 (tuple2!9203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!482699 () Bool)

(declare-fun e!284055 () Bool)

(declare-fun call!30977 () Bool)

(assert (=> b!482699 (= e!284055 (not call!30977))))

(declare-fun bm!30971 () Bool)

(declare-fun call!30975 () ListLongMap!8105)

(assert (=> bm!30971 (= call!30978 call!30975)))

(declare-fun b!482700 () Bool)

(declare-fun e!284054 () Bool)

(declare-fun apply!344 (ListLongMap!8105 (_ BitVec 64)) V!19537)

(assert (=> b!482700 (= e!284054 (= (apply!344 lt!218720 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!482701 () Bool)

(declare-fun e!284043 () Bool)

(assert (=> b!482701 (= e!284050 e!284043)))

(declare-fun res!287722 () Bool)

(declare-fun call!30974 () Bool)

(assert (=> b!482701 (= res!287722 call!30974)))

(assert (=> b!482701 (=> (not res!287722) (not e!284043))))

(declare-fun b!482702 () Bool)

(assert (=> b!482702 (= e!284050 (not call!30974))))

(declare-fun bm!30972 () Bool)

(declare-fun call!30980 () ListLongMap!8105)

(assert (=> bm!30972 (= call!30975 call!30980)))

(declare-fun b!482703 () Bool)

(declare-fun Unit!14143 () Unit!14136)

(assert (=> b!482703 (= e!284047 Unit!14143)))

(declare-fun bm!30973 () Bool)

(assert (=> bm!30973 (= call!30974 (contains!2648 lt!218720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30974 () Bool)

(declare-fun c!57962 () Bool)

(assert (=> bm!30974 (= call!30979 (+!1812 (ite c!57966 call!30980 (ite c!57962 call!30975 call!30978)) (ite (or c!57966 c!57962) (tuple2!9203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!482704 () Bool)

(declare-fun lt!218719 () Unit!14136)

(assert (=> b!482704 (= e!284047 lt!218719)))

(declare-fun lt!218702 () ListLongMap!8105)

(declare-fun getCurrentListMapNoExtraKeys!2148 (array!31351 array!31353 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 32) Int) ListLongMap!8105)

(assert (=> b!482704 (= lt!218702 (getCurrentListMapNoExtraKeys!2148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218710 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218721 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218721 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218703 () Unit!14136)

(declare-fun addStillContains!302 (ListLongMap!8105 (_ BitVec 64) V!19537 (_ BitVec 64)) Unit!14136)

(assert (=> b!482704 (= lt!218703 (addStillContains!302 lt!218702 lt!218710 zeroValue!1458 lt!218721))))

(assert (=> b!482704 (contains!2648 (+!1812 lt!218702 (tuple2!9203 lt!218710 zeroValue!1458)) lt!218721)))

(declare-fun lt!218717 () Unit!14136)

(assert (=> b!482704 (= lt!218717 lt!218703)))

(declare-fun lt!218704 () ListLongMap!8105)

(assert (=> b!482704 (= lt!218704 (getCurrentListMapNoExtraKeys!2148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218713 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218705 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218705 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218706 () Unit!14136)

(declare-fun addApplyDifferent!302 (ListLongMap!8105 (_ BitVec 64) V!19537 (_ BitVec 64)) Unit!14136)

(assert (=> b!482704 (= lt!218706 (addApplyDifferent!302 lt!218704 lt!218713 minValue!1458 lt!218705))))

(assert (=> b!482704 (= (apply!344 (+!1812 lt!218704 (tuple2!9203 lt!218713 minValue!1458)) lt!218705) (apply!344 lt!218704 lt!218705))))

(declare-fun lt!218712 () Unit!14136)

(assert (=> b!482704 (= lt!218712 lt!218706)))

(declare-fun lt!218711 () ListLongMap!8105)

(assert (=> b!482704 (= lt!218711 (getCurrentListMapNoExtraKeys!2148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218714 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218709 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218709 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218715 () Unit!14136)

(assert (=> b!482704 (= lt!218715 (addApplyDifferent!302 lt!218711 lt!218714 zeroValue!1458 lt!218709))))

(assert (=> b!482704 (= (apply!344 (+!1812 lt!218711 (tuple2!9203 lt!218714 zeroValue!1458)) lt!218709) (apply!344 lt!218711 lt!218709))))

(declare-fun lt!218722 () Unit!14136)

(assert (=> b!482704 (= lt!218722 lt!218715)))

(declare-fun lt!218708 () ListLongMap!8105)

(assert (=> b!482704 (= lt!218708 (getCurrentListMapNoExtraKeys!2148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218718 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218718 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218707 () (_ BitVec 64))

(assert (=> b!482704 (= lt!218707 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!482704 (= lt!218719 (addApplyDifferent!302 lt!218708 lt!218718 minValue!1458 lt!218707))))

(assert (=> b!482704 (= (apply!344 (+!1812 lt!218708 (tuple2!9203 lt!218718 minValue!1458)) lt!218707) (apply!344 lt!218708 lt!218707))))

(declare-fun bm!30975 () Bool)

(assert (=> bm!30975 (= call!30980 (getCurrentListMapNoExtraKeys!2148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!482705 () Bool)

(assert (=> b!482705 (= e!284043 (= (apply!344 lt!218720 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!482706 () Bool)

(assert (=> b!482706 (= e!284053 e!284055)))

(declare-fun c!57963 () Bool)

(assert (=> b!482706 (= c!57963 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!482707 () Bool)

(declare-fun res!287723 () Bool)

(assert (=> b!482707 (=> (not res!287723) (not e!284053))))

(assert (=> b!482707 (= res!287723 e!284045)))

(declare-fun res!287719 () Bool)

(assert (=> b!482707 (=> res!287719 e!284045)))

(declare-fun e!284044 () Bool)

(assert (=> b!482707 (= res!287719 (not e!284044))))

(declare-fun res!287721 () Bool)

(assert (=> b!482707 (=> (not res!287721) (not e!284044))))

(assert (=> b!482707 (= res!287721 (bvslt #b00000000000000000000000000000000 (size!15436 _keys!1874)))))

(declare-fun b!482708 () Bool)

(assert (=> b!482708 (= e!284044 (validKeyInArray!0 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482709 () Bool)

(declare-fun call!30976 () ListLongMap!8105)

(assert (=> b!482709 (= e!284046 call!30976)))

(declare-fun b!482710 () Bool)

(declare-fun e!284048 () ListLongMap!8105)

(assert (=> b!482710 (= e!284048 call!30976)))

(declare-fun b!482711 () Bool)

(declare-fun c!57967 () Bool)

(assert (=> b!482711 (= c!57967 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!482711 (= e!284048 e!284046)))

(declare-fun b!482712 () Bool)

(assert (=> b!482712 (= e!284055 e!284054)))

(declare-fun res!287720 () Bool)

(assert (=> b!482712 (= res!287720 call!30977)))

(assert (=> b!482712 (=> (not res!287720) (not e!284054))))

(declare-fun b!482713 () Bool)

(assert (=> b!482713 (= e!284052 e!284048)))

(assert (=> b!482713 (= c!57962 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30976 () Bool)

(assert (=> bm!30976 (= call!30976 call!30979)))

(declare-fun bm!30977 () Bool)

(assert (=> bm!30977 (= call!30977 (contains!2648 lt!218720 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482714 () Bool)

(declare-fun get!7305 (ValueCell!6563 V!19537) V!19537)

(declare-fun dynLambda!958 (Int (_ BitVec 64)) V!19537)

(assert (=> b!482714 (= e!284049 (= (apply!344 lt!218720 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)) (get!7305 (select (arr!15078 _values!1516) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15437 _values!1516)))))

(assert (=> b!482714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15436 _keys!1874)))))

(assert (= (and d!76651 c!57966) b!482698))

(assert (= (and d!76651 (not c!57966)) b!482713))

(assert (= (and b!482713 c!57962) b!482710))

(assert (= (and b!482713 (not c!57962)) b!482711))

(assert (= (and b!482711 c!57967) b!482709))

(assert (= (and b!482711 (not c!57967)) b!482697))

(assert (= (or b!482709 b!482697) bm!30971))

(assert (= (or b!482710 bm!30971) bm!30972))

(assert (= (or b!482710 b!482709) bm!30976))

(assert (= (or b!482698 bm!30972) bm!30975))

(assert (= (or b!482698 bm!30976) bm!30974))

(assert (= (and d!76651 res!287724) b!482696))

(assert (= (and d!76651 c!57965) b!482704))

(assert (= (and d!76651 (not c!57965)) b!482703))

(assert (= (and d!76651 res!287725) b!482707))

(assert (= (and b!482707 res!287721) b!482708))

(assert (= (and b!482707 (not res!287719)) b!482695))

(assert (= (and b!482695 res!287718) b!482714))

(assert (= (and b!482707 res!287723) b!482694))

(assert (= (and b!482694 c!57964) b!482701))

(assert (= (and b!482694 (not c!57964)) b!482702))

(assert (= (and b!482701 res!287722) b!482705))

(assert (= (or b!482701 b!482702) bm!30973))

(assert (= (and b!482694 res!287717) b!482706))

(assert (= (and b!482706 c!57963) b!482712))

(assert (= (and b!482706 (not c!57963)) b!482699))

(assert (= (and b!482712 res!287720) b!482700))

(assert (= (or b!482712 b!482699) bm!30977))

(declare-fun b_lambda!10793 () Bool)

(assert (=> (not b_lambda!10793) (not b!482714)))

(declare-fun t!15479 () Bool)

(declare-fun tb!4161 () Bool)

(assert (=> (and start!43566 (= defaultEntry!1519 defaultEntry!1519) t!15479) tb!4161))

(declare-fun result!7767 () Bool)

(assert (=> tb!4161 (= result!7767 tp_is_empty!13849)))

(assert (=> b!482714 t!15479))

(declare-fun b_and!21079 () Bool)

(assert (= b_and!21073 (and (=> t!15479 result!7767) b_and!21079)))

(declare-fun m!463317 () Bool)

(assert (=> b!482696 m!463317))

(assert (=> b!482696 m!463317))

(declare-fun m!463319 () Bool)

(assert (=> b!482696 m!463319))

(declare-fun m!463321 () Bool)

(assert (=> b!482700 m!463321))

(assert (=> b!482695 m!463317))

(assert (=> b!482695 m!463317))

(declare-fun m!463323 () Bool)

(assert (=> b!482695 m!463323))

(declare-fun m!463325 () Bool)

(assert (=> b!482705 m!463325))

(declare-fun m!463327 () Bool)

(assert (=> b!482714 m!463327))

(assert (=> b!482714 m!463317))

(declare-fun m!463329 () Bool)

(assert (=> b!482714 m!463329))

(assert (=> b!482714 m!463327))

(declare-fun m!463331 () Bool)

(assert (=> b!482714 m!463331))

(declare-fun m!463333 () Bool)

(assert (=> b!482714 m!463333))

(assert (=> b!482714 m!463317))

(assert (=> b!482714 m!463331))

(declare-fun m!463335 () Bool)

(assert (=> b!482704 m!463335))

(declare-fun m!463337 () Bool)

(assert (=> b!482704 m!463337))

(declare-fun m!463339 () Bool)

(assert (=> b!482704 m!463339))

(assert (=> b!482704 m!463317))

(declare-fun m!463341 () Bool)

(assert (=> b!482704 m!463341))

(declare-fun m!463343 () Bool)

(assert (=> b!482704 m!463343))

(declare-fun m!463345 () Bool)

(assert (=> b!482704 m!463345))

(assert (=> b!482704 m!463339))

(declare-fun m!463347 () Bool)

(assert (=> b!482704 m!463347))

(declare-fun m!463349 () Bool)

(assert (=> b!482704 m!463349))

(declare-fun m!463351 () Bool)

(assert (=> b!482704 m!463351))

(assert (=> b!482704 m!463343))

(declare-fun m!463353 () Bool)

(assert (=> b!482704 m!463353))

(declare-fun m!463355 () Bool)

(assert (=> b!482704 m!463355))

(declare-fun m!463357 () Bool)

(assert (=> b!482704 m!463357))

(declare-fun m!463359 () Bool)

(assert (=> b!482704 m!463359))

(assert (=> b!482704 m!463353))

(declare-fun m!463361 () Bool)

(assert (=> b!482704 m!463361))

(assert (=> b!482704 m!463337))

(declare-fun m!463363 () Bool)

(assert (=> b!482704 m!463363))

(declare-fun m!463365 () Bool)

(assert (=> b!482704 m!463365))

(declare-fun m!463367 () Bool)

(assert (=> bm!30974 m!463367))

(assert (=> b!482708 m!463317))

(assert (=> b!482708 m!463317))

(assert (=> b!482708 m!463319))

(declare-fun m!463369 () Bool)

(assert (=> b!482698 m!463369))

(assert (=> bm!30975 m!463349))

(declare-fun m!463371 () Bool)

(assert (=> bm!30973 m!463371))

(declare-fun m!463373 () Bool)

(assert (=> bm!30977 m!463373))

(assert (=> d!76651 m!463249))

(assert (=> b!482576 d!76651))

(declare-fun bm!30980 () Bool)

(declare-fun call!30983 () Bool)

(declare-fun c!57970 () Bool)

(assert (=> bm!30980 (= call!30983 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57970 (Cons!9264 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000) Nil!9265) Nil!9265)))))

(declare-fun b!482727 () Bool)

(declare-fun e!284066 () Bool)

(declare-fun e!284064 () Bool)

(assert (=> b!482727 (= e!284066 e!284064)))

(assert (=> b!482727 (= c!57970 (validKeyInArray!0 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482728 () Bool)

(assert (=> b!482728 (= e!284064 call!30983)))

(declare-fun b!482729 () Bool)

(declare-fun e!284067 () Bool)

(assert (=> b!482729 (= e!284067 e!284066)))

(declare-fun res!287732 () Bool)

(assert (=> b!482729 (=> (not res!287732) (not e!284066))))

(declare-fun e!284065 () Bool)

(assert (=> b!482729 (= res!287732 (not e!284065))))

(declare-fun res!287733 () Bool)

(assert (=> b!482729 (=> (not res!287733) (not e!284065))))

(assert (=> b!482729 (= res!287733 (validKeyInArray!0 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76653 () Bool)

(declare-fun res!287734 () Bool)

(assert (=> d!76653 (=> res!287734 e!284067)))

(assert (=> d!76653 (= res!287734 (bvsge #b00000000000000000000000000000000 (size!15436 _keys!1874)))))

(assert (=> d!76653 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9265) e!284067)))

(declare-fun b!482730 () Bool)

(assert (=> b!482730 (= e!284064 call!30983)))

(declare-fun b!482731 () Bool)

(declare-fun contains!2650 (List!9268 (_ BitVec 64)) Bool)

(assert (=> b!482731 (= e!284065 (contains!2650 Nil!9265 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76653 (not res!287734)) b!482729))

(assert (= (and b!482729 res!287733) b!482731))

(assert (= (and b!482729 res!287732) b!482727))

(assert (= (and b!482727 c!57970) b!482730))

(assert (= (and b!482727 (not c!57970)) b!482728))

(assert (= (or b!482730 b!482728) bm!30980))

(assert (=> bm!30980 m!463317))

(declare-fun m!463375 () Bool)

(assert (=> bm!30980 m!463375))

(assert (=> b!482727 m!463317))

(assert (=> b!482727 m!463317))

(assert (=> b!482727 m!463319))

(assert (=> b!482729 m!463317))

(assert (=> b!482729 m!463317))

(assert (=> b!482729 m!463319))

(assert (=> b!482731 m!463317))

(assert (=> b!482731 m!463317))

(declare-fun m!463377 () Bool)

(assert (=> b!482731 m!463377))

(assert (=> b!482571 d!76653))

(declare-fun d!76655 () Bool)

(declare-fun lt!218725 () (_ BitVec 32))

(assert (=> d!76655 (and (or (bvslt lt!218725 #b00000000000000000000000000000000) (bvsge lt!218725 (size!15436 _keys!1874)) (and (bvsge lt!218725 #b00000000000000000000000000000000) (bvslt lt!218725 (size!15436 _keys!1874)))) (bvsge lt!218725 #b00000000000000000000000000000000) (bvslt lt!218725 (size!15436 _keys!1874)) (= (select (arr!15077 _keys!1874) lt!218725) k0!1332))))

(declare-fun e!284070 () (_ BitVec 32))

(assert (=> d!76655 (= lt!218725 e!284070)))

(declare-fun c!57973 () Bool)

(assert (=> d!76655 (= c!57973 (= (select (arr!15077 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15436 _keys!1874)) (bvslt (size!15436 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76655 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218725)))

(declare-fun b!482736 () Bool)

(assert (=> b!482736 (= e!284070 #b00000000000000000000000000000000)))

(declare-fun b!482737 () Bool)

(assert (=> b!482737 (= e!284070 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76655 c!57973) b!482736))

(assert (= (and d!76655 (not c!57973)) b!482737))

(declare-fun m!463379 () Bool)

(assert (=> d!76655 m!463379))

(assert (=> d!76655 m!463317))

(declare-fun m!463381 () Bool)

(assert (=> b!482737 m!463381))

(assert (=> b!482566 d!76655))

(declare-fun d!76657 () Bool)

(declare-fun e!284073 () Bool)

(assert (=> d!76657 e!284073))

(declare-fun c!57976 () Bool)

(assert (=> d!76657 (= c!57976 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218728 () Unit!14136)

(declare-fun choose!1387 (array!31351 array!31353 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 64) Int) Unit!14136)

(assert (=> d!76657 (= lt!218728 (choose!1387 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76657 (validMask!0 mask!2352)))

(assert (=> d!76657 (= (lemmaKeyInListMapIsInArray!154 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218728)))

(declare-fun b!482742 () Bool)

(assert (=> b!482742 (= e!284073 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482743 () Bool)

(assert (=> b!482743 (= e!284073 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76657 c!57976) b!482742))

(assert (= (and d!76657 (not c!57976)) b!482743))

(declare-fun m!463383 () Bool)

(assert (=> d!76657 m!463383))

(assert (=> d!76657 m!463249))

(assert (=> b!482742 m!463237))

(assert (=> b!482566 d!76657))

(declare-fun d!76659 () Bool)

(declare-fun res!287739 () Bool)

(declare-fun e!284078 () Bool)

(assert (=> d!76659 (=> res!287739 e!284078)))

(assert (=> d!76659 (= res!287739 (= (select (arr!15077 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76659 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284078)))

(declare-fun b!482748 () Bool)

(declare-fun e!284079 () Bool)

(assert (=> b!482748 (= e!284078 e!284079)))

(declare-fun res!287740 () Bool)

(assert (=> b!482748 (=> (not res!287740) (not e!284079))))

(assert (=> b!482748 (= res!287740 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15436 _keys!1874)))))

(declare-fun b!482749 () Bool)

(assert (=> b!482749 (= e!284079 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76659 (not res!287739)) b!482748))

(assert (= (and b!482748 res!287740) b!482749))

(assert (=> d!76659 m!463317))

(declare-fun m!463385 () Bool)

(assert (=> b!482749 m!463385))

(assert (=> b!482575 d!76659))

(declare-fun b!482758 () Bool)

(declare-fun e!284087 () Bool)

(declare-fun call!30986 () Bool)

(assert (=> b!482758 (= e!284087 call!30986)))

(declare-fun b!482759 () Bool)

(declare-fun e!284086 () Bool)

(declare-fun e!284088 () Bool)

(assert (=> b!482759 (= e!284086 e!284088)))

(declare-fun c!57979 () Bool)

(assert (=> b!482759 (= c!57979 (validKeyInArray!0 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76661 () Bool)

(declare-fun res!287746 () Bool)

(assert (=> d!76661 (=> res!287746 e!284086)))

(assert (=> d!76661 (= res!287746 (bvsge #b00000000000000000000000000000000 (size!15436 _keys!1874)))))

(assert (=> d!76661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284086)))

(declare-fun b!482760 () Bool)

(assert (=> b!482760 (= e!284088 e!284087)))

(declare-fun lt!218735 () (_ BitVec 64))

(assert (=> b!482760 (= lt!218735 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218736 () Unit!14136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31351 (_ BitVec 64) (_ BitVec 32)) Unit!14136)

(assert (=> b!482760 (= lt!218736 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218735 #b00000000000000000000000000000000))))

(assert (=> b!482760 (arrayContainsKey!0 _keys!1874 lt!218735 #b00000000000000000000000000000000)))

(declare-fun lt!218737 () Unit!14136)

(assert (=> b!482760 (= lt!218737 lt!218736)))

(declare-fun res!287745 () Bool)

(declare-datatypes ((SeekEntryResult!3568 0))(
  ( (MissingZero!3568 (index!16451 (_ BitVec 32))) (Found!3568 (index!16452 (_ BitVec 32))) (Intermediate!3568 (undefined!4380 Bool) (index!16453 (_ BitVec 32)) (x!45351 (_ BitVec 32))) (Undefined!3568) (MissingVacant!3568 (index!16454 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31351 (_ BitVec 32)) SeekEntryResult!3568)

(assert (=> b!482760 (= res!287745 (= (seekEntryOrOpen!0 (select (arr!15077 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3568 #b00000000000000000000000000000000)))))

(assert (=> b!482760 (=> (not res!287745) (not e!284087))))

(declare-fun b!482761 () Bool)

(assert (=> b!482761 (= e!284088 call!30986)))

(declare-fun bm!30983 () Bool)

(assert (=> bm!30983 (= call!30986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76661 (not res!287746)) b!482759))

(assert (= (and b!482759 c!57979) b!482760))

(assert (= (and b!482759 (not c!57979)) b!482761))

(assert (= (and b!482760 res!287745) b!482758))

(assert (= (or b!482758 b!482761) bm!30983))

(assert (=> b!482759 m!463317))

(assert (=> b!482759 m!463317))

(assert (=> b!482759 m!463319))

(assert (=> b!482760 m!463317))

(declare-fun m!463387 () Bool)

(assert (=> b!482760 m!463387))

(declare-fun m!463389 () Bool)

(assert (=> b!482760 m!463389))

(assert (=> b!482760 m!463317))

(declare-fun m!463391 () Bool)

(assert (=> b!482760 m!463391))

(declare-fun m!463393 () Bool)

(assert (=> bm!30983 m!463393))

(assert (=> b!482574 d!76661))

(declare-fun d!76663 () Bool)

(assert (=> d!76663 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43566 d!76663))

(declare-fun d!76665 () Bool)

(assert (=> d!76665 (= (array_inv!10964 _values!1516) (bvsge (size!15437 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43566 d!76665))

(declare-fun d!76667 () Bool)

(assert (=> d!76667 (= (array_inv!10965 _keys!1874) (bvsge (size!15436 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43566 d!76667))

(declare-fun d!76669 () Bool)

(assert (=> d!76669 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482573 d!76669))

(declare-fun mapNonEmpty!22495 () Bool)

(declare-fun mapRes!22495 () Bool)

(declare-fun tp!43312 () Bool)

(declare-fun e!284094 () Bool)

(assert (=> mapNonEmpty!22495 (= mapRes!22495 (and tp!43312 e!284094))))

(declare-fun mapValue!22495 () ValueCell!6563)

(declare-fun mapKey!22495 () (_ BitVec 32))

(declare-fun mapRest!22495 () (Array (_ BitVec 32) ValueCell!6563))

(assert (=> mapNonEmpty!22495 (= mapRest!22486 (store mapRest!22495 mapKey!22495 mapValue!22495))))

(declare-fun mapIsEmpty!22495 () Bool)

(assert (=> mapIsEmpty!22495 mapRes!22495))

(declare-fun b!482768 () Bool)

(assert (=> b!482768 (= e!284094 tp_is_empty!13849)))

(declare-fun condMapEmpty!22495 () Bool)

(declare-fun mapDefault!22495 () ValueCell!6563)

(assert (=> mapNonEmpty!22486 (= condMapEmpty!22495 (= mapRest!22486 ((as const (Array (_ BitVec 32) ValueCell!6563)) mapDefault!22495)))))

(declare-fun e!284093 () Bool)

(assert (=> mapNonEmpty!22486 (= tp!43296 (and e!284093 mapRes!22495))))

(declare-fun b!482769 () Bool)

(assert (=> b!482769 (= e!284093 tp_is_empty!13849)))

(assert (= (and mapNonEmpty!22486 condMapEmpty!22495) mapIsEmpty!22495))

(assert (= (and mapNonEmpty!22486 (not condMapEmpty!22495)) mapNonEmpty!22495))

(assert (= (and mapNonEmpty!22495 ((_ is ValueCellFull!6563) mapValue!22495)) b!482768))

(assert (= (and mapNonEmpty!22486 ((_ is ValueCellFull!6563) mapDefault!22495)) b!482769))

(declare-fun m!463395 () Bool)

(assert (=> mapNonEmpty!22495 m!463395))

(declare-fun b_lambda!10795 () Bool)

(assert (= b_lambda!10793 (or (and start!43566 b_free!12337) b_lambda!10795)))

(check-sat (not mapNonEmpty!22495) (not b!482700) (not b!482696) (not d!76649) (not b!482737) (not bm!30973) (not bm!30977) (not b!482704) tp_is_empty!13849 (not b!482749) (not b_next!12337) (not b!482705) (not b!482729) b_and!21079 (not d!76657) (not b!482695) (not bm!30983) (not b!482649) (not b!482651) (not b!482708) (not b!482714) (not d!76651) (not bm!30975) (not b!482727) (not b!482698) (not b_lambda!10795) (not bm!30974) (not b!482731) (not b!482759) (not bm!30980) (not b!482742) (not b!482760))
(check-sat b_and!21079 (not b_next!12337))
