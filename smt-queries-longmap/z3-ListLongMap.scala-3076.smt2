; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43330 () Bool)

(assert start!43330)

(declare-fun b_free!12177 () Bool)

(declare-fun b_next!12177 () Bool)

(assert (=> start!43330 (= b_free!12177 (not b_next!12177))))

(declare-fun tp!42805 () Bool)

(declare-fun b_and!20931 () Bool)

(assert (=> start!43330 (= tp!42805 b_and!20931)))

(declare-fun b!480007 () Bool)

(declare-fun res!286294 () Bool)

(declare-fun e!282444 () Bool)

(assert (=> b!480007 (=> (not res!286294) (not e!282444))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31047 0))(
  ( (array!31048 (arr!14929 (Array (_ BitVec 32) (_ BitVec 64))) (size!15287 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31047)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19323 0))(
  ( (V!19324 (val!6892 Int)) )
))
(declare-datatypes ((ValueCell!6483 0))(
  ( (ValueCellFull!6483 (v!9182 V!19323)) (EmptyCell!6483) )
))
(declare-datatypes ((array!31049 0))(
  ( (array!31050 (arr!14930 (Array (_ BitVec 32) ValueCell!6483)) (size!15288 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31049)

(assert (=> b!480007 (= res!286294 (and (= (size!15288 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15287 _keys!1874) (size!15288 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480008 () Bool)

(declare-fun res!286298 () Bool)

(assert (=> b!480008 (=> (not res!286298) (not e!282444))))

(declare-datatypes ((List!9126 0))(
  ( (Nil!9123) (Cons!9122 (h!9978 (_ BitVec 64)) (t!15334 List!9126)) )
))
(declare-fun arrayNoDuplicates!0 (array!31047 (_ BitVec 32) List!9126) Bool)

(assert (=> b!480008 (= res!286298 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9123))))

(declare-fun b!480009 () Bool)

(declare-fun res!286299 () Bool)

(assert (=> b!480009 (=> (not res!286299) (not e!282444))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480009 (= res!286299 (validKeyInArray!0 k0!1332))))

(declare-fun b!480010 () Bool)

(declare-fun e!282442 () Bool)

(declare-fun arrayContainsKey!0 (array!31047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480010 (= e!282442 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480011 () Bool)

(declare-fun e!282445 () Bool)

(declare-fun e!282446 () Bool)

(declare-fun mapRes!22234 () Bool)

(assert (=> b!480011 (= e!282445 (and e!282446 mapRes!22234))))

(declare-fun condMapEmpty!22234 () Bool)

(declare-fun mapDefault!22234 () ValueCell!6483)

(assert (=> b!480011 (= condMapEmpty!22234 (= (arr!14930 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6483)) mapDefault!22234)))))

(declare-fun mapNonEmpty!22234 () Bool)

(declare-fun tp!42804 () Bool)

(declare-fun e!282447 () Bool)

(assert (=> mapNonEmpty!22234 (= mapRes!22234 (and tp!42804 e!282447))))

(declare-fun mapValue!22234 () ValueCell!6483)

(declare-fun mapKey!22234 () (_ BitVec 32))

(declare-fun mapRest!22234 () (Array (_ BitVec 32) ValueCell!6483))

(assert (=> mapNonEmpty!22234 (= (arr!14930 _values!1516) (store mapRest!22234 mapKey!22234 mapValue!22234))))

(declare-fun b!480012 () Bool)

(declare-fun res!286297 () Bool)

(assert (=> b!480012 (=> (not res!286297) (not e!282444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31047 (_ BitVec 32)) Bool)

(assert (=> b!480012 (= res!286297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480013 () Bool)

(declare-fun e!282441 () Bool)

(assert (=> b!480013 (= e!282441 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22234 () Bool)

(assert (=> mapIsEmpty!22234 mapRes!22234))

(declare-fun b!480015 () Bool)

(declare-fun tp_is_empty!13689 () Bool)

(assert (=> b!480015 (= e!282446 tp_is_empty!13689)))

(declare-fun b!480016 () Bool)

(assert (=> b!480016 (= e!282444 (not e!282441))))

(declare-fun res!286293 () Bool)

(assert (=> b!480016 (=> res!286293 e!282441)))

(assert (=> b!480016 (= res!286293 (or (bvsge #b00000000000000000000000000000000 (size!15287 _keys!1874)) (bvsge (size!15287 _keys!1874) #b01111111111111111111111111111111)))))

(assert (=> b!480016 e!282442))

(declare-fun c!57721 () Bool)

(assert (=> b!480016 (= c!57721 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14074 0))(
  ( (Unit!14075) )
))
(declare-fun lt!218008 () Unit!14074)

(declare-fun minValue!1458 () V!19323)

(declare-fun zeroValue!1458 () V!19323)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!111 (array!31047 array!31049 (_ BitVec 32) (_ BitVec 32) V!19323 V!19323 (_ BitVec 64) Int) Unit!14074)

(assert (=> b!480016 (= lt!218008 (lemmaKeyInListMapIsInArray!111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480017 () Bool)

(assert (=> b!480017 (= e!282442 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480018 () Bool)

(declare-fun res!286296 () Bool)

(assert (=> b!480018 (=> (not res!286296) (not e!282444))))

(declare-datatypes ((tuple2!9048 0))(
  ( (tuple2!9049 (_1!4535 (_ BitVec 64)) (_2!4535 V!19323)) )
))
(declare-datatypes ((List!9127 0))(
  ( (Nil!9124) (Cons!9123 (h!9979 tuple2!9048) (t!15335 List!9127)) )
))
(declare-datatypes ((ListLongMap!7961 0))(
  ( (ListLongMap!7962 (toList!3996 List!9127)) )
))
(declare-fun contains!2607 (ListLongMap!7961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2315 (array!31047 array!31049 (_ BitVec 32) (_ BitVec 32) V!19323 V!19323 (_ BitVec 32) Int) ListLongMap!7961)

(assert (=> b!480018 (= res!286296 (contains!2607 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480014 () Bool)

(assert (=> b!480014 (= e!282447 tp_is_empty!13689)))

(declare-fun res!286295 () Bool)

(assert (=> start!43330 (=> (not res!286295) (not e!282444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43330 (= res!286295 (validMask!0 mask!2352))))

(assert (=> start!43330 e!282444))

(assert (=> start!43330 true))

(assert (=> start!43330 tp_is_empty!13689))

(declare-fun array_inv!10770 (array!31049) Bool)

(assert (=> start!43330 (and (array_inv!10770 _values!1516) e!282445)))

(assert (=> start!43330 tp!42805))

(declare-fun array_inv!10771 (array!31047) Bool)

(assert (=> start!43330 (array_inv!10771 _keys!1874)))

(assert (= (and start!43330 res!286295) b!480007))

(assert (= (and b!480007 res!286294) b!480012))

(assert (= (and b!480012 res!286297) b!480008))

(assert (= (and b!480008 res!286298) b!480018))

(assert (= (and b!480018 res!286296) b!480009))

(assert (= (and b!480009 res!286299) b!480016))

(assert (= (and b!480016 c!57721) b!480010))

(assert (= (and b!480016 (not c!57721)) b!480017))

(assert (= (and b!480016 (not res!286293)) b!480013))

(assert (= (and b!480011 condMapEmpty!22234) mapIsEmpty!22234))

(assert (= (and b!480011 (not condMapEmpty!22234)) mapNonEmpty!22234))

(get-info :version)

(assert (= (and mapNonEmpty!22234 ((_ is ValueCellFull!6483) mapValue!22234)) b!480014))

(assert (= (and b!480011 ((_ is ValueCellFull!6483) mapDefault!22234)) b!480015))

(assert (= start!43330 b!480011))

(declare-fun m!461787 () Bool)

(assert (=> b!480010 m!461787))

(declare-fun m!461789 () Bool)

(assert (=> b!480018 m!461789))

(assert (=> b!480018 m!461789))

(declare-fun m!461791 () Bool)

(assert (=> b!480018 m!461791))

(declare-fun m!461793 () Bool)

(assert (=> b!480016 m!461793))

(declare-fun m!461795 () Bool)

(assert (=> b!480009 m!461795))

(assert (=> b!480013 m!461787))

(declare-fun m!461797 () Bool)

(assert (=> start!43330 m!461797))

(declare-fun m!461799 () Bool)

(assert (=> start!43330 m!461799))

(declare-fun m!461801 () Bool)

(assert (=> start!43330 m!461801))

(declare-fun m!461803 () Bool)

(assert (=> b!480012 m!461803))

(declare-fun m!461805 () Bool)

(assert (=> b!480008 m!461805))

(declare-fun m!461807 () Bool)

(assert (=> mapNonEmpty!22234 m!461807))

(check-sat b_and!20931 tp_is_empty!13689 (not b!480013) (not b!480016) (not b!480010) (not b!480012) (not start!43330) (not b!480009) (not mapNonEmpty!22234) (not b_next!12177) (not b!480008) (not b!480018))
(check-sat b_and!20931 (not b_next!12177))
(get-model)

(declare-fun d!76705 () Bool)

(declare-fun e!282471 () Bool)

(assert (=> d!76705 e!282471))

(declare-fun c!57727 () Bool)

(assert (=> d!76705 (= c!57727 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218014 () Unit!14074)

(declare-fun choose!1375 (array!31047 array!31049 (_ BitVec 32) (_ BitVec 32) V!19323 V!19323 (_ BitVec 64) Int) Unit!14074)

(assert (=> d!76705 (= lt!218014 (choose!1375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76705 (validMask!0 mask!2352)))

(assert (=> d!76705 (= (lemmaKeyInListMapIsInArray!111 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218014)))

(declare-fun b!480059 () Bool)

(assert (=> b!480059 (= e!282471 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480060 () Bool)

(assert (=> b!480060 (= e!282471 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76705 c!57727) b!480059))

(assert (= (and d!76705 (not c!57727)) b!480060))

(declare-fun m!461831 () Bool)

(assert (=> d!76705 m!461831))

(assert (=> d!76705 m!461797))

(assert (=> b!480059 m!461787))

(assert (=> b!480016 d!76705))

(declare-fun d!76707 () Bool)

(assert (=> d!76707 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43330 d!76707))

(declare-fun d!76709 () Bool)

(assert (=> d!76709 (= (array_inv!10770 _values!1516) (bvsge (size!15288 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43330 d!76709))

(declare-fun d!76711 () Bool)

(assert (=> d!76711 (= (array_inv!10771 _keys!1874) (bvsge (size!15287 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43330 d!76711))

(declare-fun d!76713 () Bool)

(declare-fun res!286325 () Bool)

(declare-fun e!282476 () Bool)

(assert (=> d!76713 (=> res!286325 e!282476)))

(assert (=> d!76713 (= res!286325 (= (select (arr!14929 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76713 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282476)))

(declare-fun b!480065 () Bool)

(declare-fun e!282477 () Bool)

(assert (=> b!480065 (= e!282476 e!282477)))

(declare-fun res!286326 () Bool)

(assert (=> b!480065 (=> (not res!286326) (not e!282477))))

(assert (=> b!480065 (= res!286326 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15287 _keys!1874)))))

(declare-fun b!480066 () Bool)

(assert (=> b!480066 (= e!282477 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76713 (not res!286325)) b!480065))

(assert (= (and b!480065 res!286326) b!480066))

(declare-fun m!461833 () Bool)

(assert (=> d!76713 m!461833))

(declare-fun m!461835 () Bool)

(assert (=> b!480066 m!461835))

(assert (=> b!480010 d!76713))

(declare-fun d!76715 () Bool)

(declare-fun e!282483 () Bool)

(assert (=> d!76715 e!282483))

(declare-fun res!286329 () Bool)

(assert (=> d!76715 (=> res!286329 e!282483)))

(declare-fun lt!218025 () Bool)

(assert (=> d!76715 (= res!286329 (not lt!218025))))

(declare-fun lt!218024 () Bool)

(assert (=> d!76715 (= lt!218025 lt!218024)))

(declare-fun lt!218026 () Unit!14074)

(declare-fun e!282482 () Unit!14074)

(assert (=> d!76715 (= lt!218026 e!282482)))

(declare-fun c!57730 () Bool)

(assert (=> d!76715 (= c!57730 lt!218024)))

(declare-fun containsKey!355 (List!9127 (_ BitVec 64)) Bool)

(assert (=> d!76715 (= lt!218024 (containsKey!355 (toList!3996 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76715 (= (contains!2607 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218025)))

(declare-fun b!480073 () Bool)

(declare-fun lt!218023 () Unit!14074)

(assert (=> b!480073 (= e!282482 lt!218023)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!303 (List!9127 (_ BitVec 64)) Unit!14074)

(assert (=> b!480073 (= lt!218023 (lemmaContainsKeyImpliesGetValueByKeyDefined!303 (toList!3996 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!399 0))(
  ( (Some!398 (v!9184 V!19323)) (None!397) )
))
(declare-fun isDefined!304 (Option!399) Bool)

(declare-fun getValueByKey!393 (List!9127 (_ BitVec 64)) Option!399)

(assert (=> b!480073 (isDefined!304 (getValueByKey!393 (toList!3996 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!480074 () Bool)

(declare-fun Unit!14076 () Unit!14074)

(assert (=> b!480074 (= e!282482 Unit!14076)))

(declare-fun b!480075 () Bool)

(assert (=> b!480075 (= e!282483 (isDefined!304 (getValueByKey!393 (toList!3996 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76715 c!57730) b!480073))

(assert (= (and d!76715 (not c!57730)) b!480074))

(assert (= (and d!76715 (not res!286329)) b!480075))

(declare-fun m!461837 () Bool)

(assert (=> d!76715 m!461837))

(declare-fun m!461839 () Bool)

(assert (=> b!480073 m!461839))

(declare-fun m!461841 () Bool)

(assert (=> b!480073 m!461841))

(assert (=> b!480073 m!461841))

(declare-fun m!461843 () Bool)

(assert (=> b!480073 m!461843))

(assert (=> b!480075 m!461841))

(assert (=> b!480075 m!461841))

(assert (=> b!480075 m!461843))

(assert (=> b!480018 d!76715))

(declare-fun b!480118 () Bool)

(declare-fun e!282513 () Bool)

(assert (=> b!480118 (= e!282513 (validKeyInArray!0 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480119 () Bool)

(declare-fun e!282510 () Bool)

(declare-fun e!282511 () Bool)

(assert (=> b!480119 (= e!282510 e!282511)))

(declare-fun c!57746 () Bool)

(assert (=> b!480119 (= c!57746 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!480120 () Bool)

(declare-fun e!282516 () Bool)

(assert (=> b!480120 (= e!282516 (validKeyInArray!0 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480121 () Bool)

(declare-fun e!282514 () Bool)

(declare-fun e!282517 () Bool)

(assert (=> b!480121 (= e!282514 e!282517)))

(declare-fun res!286352 () Bool)

(declare-fun call!30893 () Bool)

(assert (=> b!480121 (= res!286352 call!30893)))

(assert (=> b!480121 (=> (not res!286352) (not e!282517))))

(declare-fun bm!30886 () Bool)

(declare-fun lt!218073 () ListLongMap!7961)

(assert (=> bm!30886 (= call!30893 (contains!2607 lt!218073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!480122 () Bool)

(declare-fun e!282521 () ListLongMap!7961)

(declare-fun call!30895 () ListLongMap!7961)

(assert (=> b!480122 (= e!282521 call!30895)))

(declare-fun b!480123 () Bool)

(declare-fun apply!340 (ListLongMap!7961 (_ BitVec 64)) V!19323)

(assert (=> b!480123 (= e!282517 (= (apply!340 lt!218073 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!480124 () Bool)

(declare-fun e!282512 () Bool)

(assert (=> b!480124 (= e!282511 e!282512)))

(declare-fun res!286353 () Bool)

(declare-fun call!30890 () Bool)

(assert (=> b!480124 (= res!286353 call!30890)))

(assert (=> b!480124 (=> (not res!286353) (not e!282512))))

(declare-fun b!480125 () Bool)

(declare-fun e!282515 () Bool)

(declare-fun get!7241 (ValueCell!6483 V!19323) V!19323)

(declare-fun dynLambda!951 (Int (_ BitVec 64)) V!19323)

(assert (=> b!480125 (= e!282515 (= (apply!340 lt!218073 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)) (get!7241 (select (arr!14930 _values!1516) #b00000000000000000000000000000000) (dynLambda!951 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15288 _values!1516)))))

(assert (=> b!480125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15287 _keys!1874)))))

(declare-fun b!480126 () Bool)

(declare-fun res!286350 () Bool)

(assert (=> b!480126 (=> (not res!286350) (not e!282510))))

(declare-fun e!282520 () Bool)

(assert (=> b!480126 (= res!286350 e!282520)))

(declare-fun res!286356 () Bool)

(assert (=> b!480126 (=> res!286356 e!282520)))

(assert (=> b!480126 (= res!286356 (not e!282516))))

(declare-fun res!286348 () Bool)

(assert (=> b!480126 (=> (not res!286348) (not e!282516))))

(assert (=> b!480126 (= res!286348 (bvslt #b00000000000000000000000000000000 (size!15287 _keys!1874)))))

(declare-fun b!480127 () Bool)

(declare-fun c!57747 () Bool)

(assert (=> b!480127 (= c!57747 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!282522 () ListLongMap!7961)

(assert (=> b!480127 (= e!282522 e!282521)))

(declare-fun b!480128 () Bool)

(assert (=> b!480128 (= e!282514 (not call!30893))))

(declare-fun bm!30887 () Bool)

(declare-fun call!30889 () ListLongMap!7961)

(declare-fun call!30894 () ListLongMap!7961)

(assert (=> bm!30887 (= call!30889 call!30894)))

(declare-fun bm!30888 () Bool)

(assert (=> bm!30888 (= call!30890 (contains!2607 lt!218073 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!480129 () Bool)

(declare-fun e!282518 () ListLongMap!7961)

(declare-fun call!30891 () ListLongMap!7961)

(declare-fun +!1772 (ListLongMap!7961 tuple2!9048) ListLongMap!7961)

(assert (=> b!480129 (= e!282518 (+!1772 call!30891 (tuple2!9049 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun c!57743 () Bool)

(declare-fun call!30892 () ListLongMap!7961)

(declare-fun bm!30889 () Bool)

(declare-fun c!57748 () Bool)

(assert (=> bm!30889 (= call!30891 (+!1772 (ite c!57748 call!30894 (ite c!57743 call!30889 call!30892)) (ite (or c!57748 c!57743) (tuple2!9049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9049 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!480130 () Bool)

(assert (=> b!480130 (= e!282520 e!282515)))

(declare-fun res!286349 () Bool)

(assert (=> b!480130 (=> (not res!286349) (not e!282515))))

(assert (=> b!480130 (= res!286349 (contains!2607 lt!218073 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!480130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15287 _keys!1874)))))

(declare-fun b!480131 () Bool)

(assert (=> b!480131 (= e!282521 call!30892)))

(declare-fun b!480132 () Bool)

(declare-fun e!282519 () Unit!14074)

(declare-fun lt!218091 () Unit!14074)

(assert (=> b!480132 (= e!282519 lt!218091)))

(declare-fun lt!218092 () ListLongMap!7961)

(declare-fun getCurrentListMapNoExtraKeys!2109 (array!31047 array!31049 (_ BitVec 32) (_ BitVec 32) V!19323 V!19323 (_ BitVec 32) Int) ListLongMap!7961)

(assert (=> b!480132 (= lt!218092 (getCurrentListMapNoExtraKeys!2109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218085 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218086 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218086 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218087 () Unit!14074)

(declare-fun addStillContains!298 (ListLongMap!7961 (_ BitVec 64) V!19323 (_ BitVec 64)) Unit!14074)

(assert (=> b!480132 (= lt!218087 (addStillContains!298 lt!218092 lt!218085 zeroValue!1458 lt!218086))))

(assert (=> b!480132 (contains!2607 (+!1772 lt!218092 (tuple2!9049 lt!218085 zeroValue!1458)) lt!218086)))

(declare-fun lt!218074 () Unit!14074)

(assert (=> b!480132 (= lt!218074 lt!218087)))

(declare-fun lt!218071 () ListLongMap!7961)

(assert (=> b!480132 (= lt!218071 (getCurrentListMapNoExtraKeys!2109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218082 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218082 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218077 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218077 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218078 () Unit!14074)

(declare-fun addApplyDifferent!298 (ListLongMap!7961 (_ BitVec 64) V!19323 (_ BitVec 64)) Unit!14074)

(assert (=> b!480132 (= lt!218078 (addApplyDifferent!298 lt!218071 lt!218082 minValue!1458 lt!218077))))

(assert (=> b!480132 (= (apply!340 (+!1772 lt!218071 (tuple2!9049 lt!218082 minValue!1458)) lt!218077) (apply!340 lt!218071 lt!218077))))

(declare-fun lt!218075 () Unit!14074)

(assert (=> b!480132 (= lt!218075 lt!218078)))

(declare-fun lt!218081 () ListLongMap!7961)

(assert (=> b!480132 (= lt!218081 (getCurrentListMapNoExtraKeys!2109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218080 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218084 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218084 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218076 () Unit!14074)

(assert (=> b!480132 (= lt!218076 (addApplyDifferent!298 lt!218081 lt!218080 zeroValue!1458 lt!218084))))

(assert (=> b!480132 (= (apply!340 (+!1772 lt!218081 (tuple2!9049 lt!218080 zeroValue!1458)) lt!218084) (apply!340 lt!218081 lt!218084))))

(declare-fun lt!218079 () Unit!14074)

(assert (=> b!480132 (= lt!218079 lt!218076)))

(declare-fun lt!218072 () ListLongMap!7961)

(assert (=> b!480132 (= lt!218072 (getCurrentListMapNoExtraKeys!2109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218083 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218083 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218089 () (_ BitVec 64))

(assert (=> b!480132 (= lt!218089 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!480132 (= lt!218091 (addApplyDifferent!298 lt!218072 lt!218083 minValue!1458 lt!218089))))

(assert (=> b!480132 (= (apply!340 (+!1772 lt!218072 (tuple2!9049 lt!218083 minValue!1458)) lt!218089) (apply!340 lt!218072 lt!218089))))

(declare-fun b!480133 () Bool)

(declare-fun res!286355 () Bool)

(assert (=> b!480133 (=> (not res!286355) (not e!282510))))

(assert (=> b!480133 (= res!286355 e!282514)))

(declare-fun c!57744 () Bool)

(assert (=> b!480133 (= c!57744 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30890 () Bool)

(assert (=> bm!30890 (= call!30895 call!30891)))

(declare-fun bm!30891 () Bool)

(assert (=> bm!30891 (= call!30892 call!30889)))

(declare-fun b!480134 () Bool)

(declare-fun Unit!14077 () Unit!14074)

(assert (=> b!480134 (= e!282519 Unit!14077)))

(declare-fun b!480135 () Bool)

(assert (=> b!480135 (= e!282518 e!282522)))

(assert (=> b!480135 (= c!57743 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!76717 () Bool)

(assert (=> d!76717 e!282510))

(declare-fun res!286351 () Bool)

(assert (=> d!76717 (=> (not res!286351) (not e!282510))))

(assert (=> d!76717 (= res!286351 (or (bvsge #b00000000000000000000000000000000 (size!15287 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15287 _keys!1874)))))))

(declare-fun lt!218088 () ListLongMap!7961)

(assert (=> d!76717 (= lt!218073 lt!218088)))

(declare-fun lt!218090 () Unit!14074)

(assert (=> d!76717 (= lt!218090 e!282519)))

(declare-fun c!57745 () Bool)

(assert (=> d!76717 (= c!57745 e!282513)))

(declare-fun res!286354 () Bool)

(assert (=> d!76717 (=> (not res!286354) (not e!282513))))

(assert (=> d!76717 (= res!286354 (bvslt #b00000000000000000000000000000000 (size!15287 _keys!1874)))))

(assert (=> d!76717 (= lt!218088 e!282518)))

(assert (=> d!76717 (= c!57748 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76717 (validMask!0 mask!2352)))

(assert (=> d!76717 (= (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218073)))

(declare-fun b!480136 () Bool)

(assert (=> b!480136 (= e!282512 (= (apply!340 lt!218073 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun bm!30892 () Bool)

(assert (=> bm!30892 (= call!30894 (getCurrentListMapNoExtraKeys!2109 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!480137 () Bool)

(assert (=> b!480137 (= e!282511 (not call!30890))))

(declare-fun b!480138 () Bool)

(assert (=> b!480138 (= e!282522 call!30895)))

(assert (= (and d!76717 c!57748) b!480129))

(assert (= (and d!76717 (not c!57748)) b!480135))

(assert (= (and b!480135 c!57743) b!480138))

(assert (= (and b!480135 (not c!57743)) b!480127))

(assert (= (and b!480127 c!57747) b!480122))

(assert (= (and b!480127 (not c!57747)) b!480131))

(assert (= (or b!480122 b!480131) bm!30891))

(assert (= (or b!480138 bm!30891) bm!30887))

(assert (= (or b!480138 b!480122) bm!30890))

(assert (= (or b!480129 bm!30887) bm!30892))

(assert (= (or b!480129 bm!30890) bm!30889))

(assert (= (and d!76717 res!286354) b!480118))

(assert (= (and d!76717 c!57745) b!480132))

(assert (= (and d!76717 (not c!57745)) b!480134))

(assert (= (and d!76717 res!286351) b!480126))

(assert (= (and b!480126 res!286348) b!480120))

(assert (= (and b!480126 (not res!286356)) b!480130))

(assert (= (and b!480130 res!286349) b!480125))

(assert (= (and b!480126 res!286350) b!480133))

(assert (= (and b!480133 c!57744) b!480121))

(assert (= (and b!480133 (not c!57744)) b!480128))

(assert (= (and b!480121 res!286352) b!480123))

(assert (= (or b!480121 b!480128) bm!30886))

(assert (= (and b!480133 res!286355) b!480119))

(assert (= (and b!480119 c!57746) b!480124))

(assert (= (and b!480119 (not c!57746)) b!480137))

(assert (= (and b!480124 res!286353) b!480136))

(assert (= (or b!480124 b!480137) bm!30888))

(declare-fun b_lambda!10795 () Bool)

(assert (=> (not b_lambda!10795) (not b!480125)))

(declare-fun t!15337 () Bool)

(declare-fun tb!4161 () Bool)

(assert (=> (and start!43330 (= defaultEntry!1519 defaultEntry!1519) t!15337) tb!4161))

(declare-fun result!7751 () Bool)

(assert (=> tb!4161 (= result!7751 tp_is_empty!13689)))

(assert (=> b!480125 t!15337))

(declare-fun b_and!20935 () Bool)

(assert (= b_and!20931 (and (=> t!15337 result!7751) b_and!20935)))

(declare-fun m!461845 () Bool)

(assert (=> b!480123 m!461845))

(declare-fun m!461847 () Bool)

(assert (=> b!480136 m!461847))

(assert (=> b!480120 m!461833))

(assert (=> b!480120 m!461833))

(declare-fun m!461849 () Bool)

(assert (=> b!480120 m!461849))

(assert (=> b!480130 m!461833))

(assert (=> b!480130 m!461833))

(declare-fun m!461851 () Bool)

(assert (=> b!480130 m!461851))

(assert (=> b!480125 m!461833))

(declare-fun m!461853 () Bool)

(assert (=> b!480125 m!461853))

(declare-fun m!461855 () Bool)

(assert (=> b!480125 m!461855))

(assert (=> b!480125 m!461833))

(declare-fun m!461857 () Bool)

(assert (=> b!480125 m!461857))

(assert (=> b!480125 m!461855))

(declare-fun m!461859 () Bool)

(assert (=> b!480125 m!461859))

(assert (=> b!480125 m!461857))

(assert (=> d!76717 m!461797))

(declare-fun m!461861 () Bool)

(assert (=> bm!30886 m!461861))

(declare-fun m!461863 () Bool)

(assert (=> b!480129 m!461863))

(declare-fun m!461865 () Bool)

(assert (=> bm!30892 m!461865))

(declare-fun m!461867 () Bool)

(assert (=> bm!30889 m!461867))

(assert (=> b!480118 m!461833))

(assert (=> b!480118 m!461833))

(assert (=> b!480118 m!461849))

(declare-fun m!461869 () Bool)

(assert (=> b!480132 m!461869))

(declare-fun m!461871 () Bool)

(assert (=> b!480132 m!461871))

(declare-fun m!461873 () Bool)

(assert (=> b!480132 m!461873))

(declare-fun m!461875 () Bool)

(assert (=> b!480132 m!461875))

(declare-fun m!461877 () Bool)

(assert (=> b!480132 m!461877))

(declare-fun m!461879 () Bool)

(assert (=> b!480132 m!461879))

(assert (=> b!480132 m!461869))

(declare-fun m!461881 () Bool)

(assert (=> b!480132 m!461881))

(declare-fun m!461883 () Bool)

(assert (=> b!480132 m!461883))

(declare-fun m!461885 () Bool)

(assert (=> b!480132 m!461885))

(assert (=> b!480132 m!461865))

(declare-fun m!461887 () Bool)

(assert (=> b!480132 m!461887))

(assert (=> b!480132 m!461873))

(declare-fun m!461889 () Bool)

(assert (=> b!480132 m!461889))

(assert (=> b!480132 m!461883))

(declare-fun m!461891 () Bool)

(assert (=> b!480132 m!461891))

(declare-fun m!461893 () Bool)

(assert (=> b!480132 m!461893))

(assert (=> b!480132 m!461891))

(assert (=> b!480132 m!461833))

(declare-fun m!461895 () Bool)

(assert (=> b!480132 m!461895))

(declare-fun m!461897 () Bool)

(assert (=> b!480132 m!461897))

(declare-fun m!461899 () Bool)

(assert (=> bm!30888 m!461899))

(assert (=> b!480018 d!76717))

(declare-fun d!76719 () Bool)

(assert (=> d!76719 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480009 d!76719))

(assert (=> b!480013 d!76713))

(declare-fun bm!30895 () Bool)

(declare-fun call!30898 () Bool)

(declare-fun c!57751 () Bool)

(assert (=> bm!30895 (= call!30898 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57751 (Cons!9122 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000) Nil!9123) Nil!9123)))))

(declare-fun b!480151 () Bool)

(declare-fun e!282531 () Bool)

(declare-fun contains!2608 (List!9126 (_ BitVec 64)) Bool)

(assert (=> b!480151 (= e!282531 (contains!2608 Nil!9123 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480152 () Bool)

(declare-fun e!282534 () Bool)

(declare-fun e!282532 () Bool)

(assert (=> b!480152 (= e!282534 e!282532)))

(declare-fun res!286363 () Bool)

(assert (=> b!480152 (=> (not res!286363) (not e!282532))))

(assert (=> b!480152 (= res!286363 (not e!282531))))

(declare-fun res!286365 () Bool)

(assert (=> b!480152 (=> (not res!286365) (not e!282531))))

(assert (=> b!480152 (= res!286365 (validKeyInArray!0 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480153 () Bool)

(declare-fun e!282533 () Bool)

(assert (=> b!480153 (= e!282533 call!30898)))

(declare-fun b!480154 () Bool)

(assert (=> b!480154 (= e!282533 call!30898)))

(declare-fun b!480155 () Bool)

(assert (=> b!480155 (= e!282532 e!282533)))

(assert (=> b!480155 (= c!57751 (validKeyInArray!0 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76721 () Bool)

(declare-fun res!286364 () Bool)

(assert (=> d!76721 (=> res!286364 e!282534)))

(assert (=> d!76721 (= res!286364 (bvsge #b00000000000000000000000000000000 (size!15287 _keys!1874)))))

(assert (=> d!76721 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9123) e!282534)))

(assert (= (and d!76721 (not res!286364)) b!480152))

(assert (= (and b!480152 res!286365) b!480151))

(assert (= (and b!480152 res!286363) b!480155))

(assert (= (and b!480155 c!57751) b!480154))

(assert (= (and b!480155 (not c!57751)) b!480153))

(assert (= (or b!480154 b!480153) bm!30895))

(assert (=> bm!30895 m!461833))

(declare-fun m!461901 () Bool)

(assert (=> bm!30895 m!461901))

(assert (=> b!480151 m!461833))

(assert (=> b!480151 m!461833))

(declare-fun m!461903 () Bool)

(assert (=> b!480151 m!461903))

(assert (=> b!480152 m!461833))

(assert (=> b!480152 m!461833))

(assert (=> b!480152 m!461849))

(assert (=> b!480155 m!461833))

(assert (=> b!480155 m!461833))

(assert (=> b!480155 m!461849))

(assert (=> b!480008 d!76721))

(declare-fun b!480164 () Bool)

(declare-fun e!282543 () Bool)

(declare-fun call!30901 () Bool)

(assert (=> b!480164 (= e!282543 call!30901)))

(declare-fun b!480165 () Bool)

(declare-fun e!282542 () Bool)

(declare-fun e!282541 () Bool)

(assert (=> b!480165 (= e!282542 e!282541)))

(declare-fun c!57754 () Bool)

(assert (=> b!480165 (= c!57754 (validKeyInArray!0 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76723 () Bool)

(declare-fun res!286370 () Bool)

(assert (=> d!76723 (=> res!286370 e!282542)))

(assert (=> d!76723 (= res!286370 (bvsge #b00000000000000000000000000000000 (size!15287 _keys!1874)))))

(assert (=> d!76723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282542)))

(declare-fun bm!30898 () Bool)

(assert (=> bm!30898 (= call!30901 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!480166 () Bool)

(assert (=> b!480166 (= e!282541 call!30901)))

(declare-fun b!480167 () Bool)

(assert (=> b!480167 (= e!282541 e!282543)))

(declare-fun lt!218101 () (_ BitVec 64))

(assert (=> b!480167 (= lt!218101 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218099 () Unit!14074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31047 (_ BitVec 64) (_ BitVec 32)) Unit!14074)

(assert (=> b!480167 (= lt!218099 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218101 #b00000000000000000000000000000000))))

(assert (=> b!480167 (arrayContainsKey!0 _keys!1874 lt!218101 #b00000000000000000000000000000000)))

(declare-fun lt!218100 () Unit!14074)

(assert (=> b!480167 (= lt!218100 lt!218099)))

(declare-fun res!286371 () Bool)

(declare-datatypes ((SeekEntryResult!3569 0))(
  ( (MissingZero!3569 (index!16455 (_ BitVec 32))) (Found!3569 (index!16456 (_ BitVec 32))) (Intermediate!3569 (undefined!4381 Bool) (index!16457 (_ BitVec 32)) (x!45101 (_ BitVec 32))) (Undefined!3569) (MissingVacant!3569 (index!16458 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31047 (_ BitVec 32)) SeekEntryResult!3569)

(assert (=> b!480167 (= res!286371 (= (seekEntryOrOpen!0 (select (arr!14929 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3569 #b00000000000000000000000000000000)))))

(assert (=> b!480167 (=> (not res!286371) (not e!282543))))

(assert (= (and d!76723 (not res!286370)) b!480165))

(assert (= (and b!480165 c!57754) b!480167))

(assert (= (and b!480165 (not c!57754)) b!480166))

(assert (= (and b!480167 res!286371) b!480164))

(assert (= (or b!480164 b!480166) bm!30898))

(assert (=> b!480165 m!461833))

(assert (=> b!480165 m!461833))

(assert (=> b!480165 m!461849))

(declare-fun m!461905 () Bool)

(assert (=> bm!30898 m!461905))

(assert (=> b!480167 m!461833))

(declare-fun m!461907 () Bool)

(assert (=> b!480167 m!461907))

(declare-fun m!461909 () Bool)

(assert (=> b!480167 m!461909))

(assert (=> b!480167 m!461833))

(declare-fun m!461911 () Bool)

(assert (=> b!480167 m!461911))

(assert (=> b!480012 d!76723))

(declare-fun mapIsEmpty!22240 () Bool)

(declare-fun mapRes!22240 () Bool)

(assert (=> mapIsEmpty!22240 mapRes!22240))

(declare-fun b!480175 () Bool)

(declare-fun e!282548 () Bool)

(assert (=> b!480175 (= e!282548 tp_is_empty!13689)))

(declare-fun mapNonEmpty!22240 () Bool)

(declare-fun tp!42814 () Bool)

(declare-fun e!282549 () Bool)

(assert (=> mapNonEmpty!22240 (= mapRes!22240 (and tp!42814 e!282549))))

(declare-fun mapValue!22240 () ValueCell!6483)

(declare-fun mapKey!22240 () (_ BitVec 32))

(declare-fun mapRest!22240 () (Array (_ BitVec 32) ValueCell!6483))

(assert (=> mapNonEmpty!22240 (= mapRest!22234 (store mapRest!22240 mapKey!22240 mapValue!22240))))

(declare-fun b!480174 () Bool)

(assert (=> b!480174 (= e!282549 tp_is_empty!13689)))

(declare-fun condMapEmpty!22240 () Bool)

(declare-fun mapDefault!22240 () ValueCell!6483)

(assert (=> mapNonEmpty!22234 (= condMapEmpty!22240 (= mapRest!22234 ((as const (Array (_ BitVec 32) ValueCell!6483)) mapDefault!22240)))))

(assert (=> mapNonEmpty!22234 (= tp!42804 (and e!282548 mapRes!22240))))

(assert (= (and mapNonEmpty!22234 condMapEmpty!22240) mapIsEmpty!22240))

(assert (= (and mapNonEmpty!22234 (not condMapEmpty!22240)) mapNonEmpty!22240))

(assert (= (and mapNonEmpty!22240 ((_ is ValueCellFull!6483) mapValue!22240)) b!480174))

(assert (= (and mapNonEmpty!22234 ((_ is ValueCellFull!6483) mapDefault!22240)) b!480175))

(declare-fun m!461913 () Bool)

(assert (=> mapNonEmpty!22240 m!461913))

(declare-fun b_lambda!10797 () Bool)

(assert (= b_lambda!10795 (or (and start!43330 b_free!12177) b_lambda!10797)))

(check-sat (not b!480130) (not b!480073) (not b!480136) (not b!480167) (not b!480123) (not b!480066) (not bm!30895) (not b!480125) (not bm!30886) (not b!480155) (not b!480075) (not bm!30888) (not b_lambda!10797) (not b!480152) (not b!480059) (not b!480129) b_and!20935 tp_is_empty!13689 (not bm!30898) (not mapNonEmpty!22240) (not b!480151) (not b!480132) (not bm!30889) (not b!480120) (not b!480165) (not bm!30892) (not d!76715) (not b!480118) (not d!76705) (not d!76717) (not b_next!12177))
(check-sat b_and!20935 (not b_next!12177))
