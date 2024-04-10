; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3872 () Bool)

(assert start!3872)

(declare-fun b_free!795 () Bool)

(declare-fun b_next!795 () Bool)

(assert (=> start!3872 (= b_free!795 (not b_next!795))))

(declare-fun tp!3801 () Bool)

(declare-fun b_and!1603 () Bool)

(assert (=> start!3872 (= tp!3801 b_and!1603)))

(declare-fun b!27209 () Bool)

(declare-fun e!17734 () Bool)

(declare-fun tp_is_empty!1149 () Bool)

(assert (=> b!27209 (= e!17734 tp_is_empty!1149)))

(declare-fun b!27210 () Bool)

(declare-fun res!16115 () Bool)

(declare-fun e!17731 () Bool)

(assert (=> b!27210 (=> (not res!16115) (not e!17731))))

(declare-datatypes ((V!1357 0))(
  ( (V!1358 (val!601 Int)) )
))
(declare-datatypes ((ValueCell!375 0))(
  ( (ValueCellFull!375 (v!1689 V!1357)) (EmptyCell!375) )
))
(declare-datatypes ((array!1539 0))(
  ( (array!1540 (arr!724 (Array (_ BitVec 32) ValueCell!375)) (size!825 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1539)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1541 0))(
  ( (array!1542 (arr!725 (Array (_ BitVec 32) (_ BitVec 64))) (size!826 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1541)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27210 (= res!16115 (and (= (size!825 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!826 _keys!1833) (size!825 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1249 () Bool)

(declare-fun mapRes!1249 () Bool)

(declare-fun tp!3802 () Bool)

(declare-fun e!17732 () Bool)

(assert (=> mapNonEmpty!1249 (= mapRes!1249 (and tp!3802 e!17732))))

(declare-fun mapKey!1249 () (_ BitVec 32))

(declare-fun mapValue!1249 () ValueCell!375)

(declare-fun mapRest!1249 () (Array (_ BitVec 32) ValueCell!375))

(assert (=> mapNonEmpty!1249 (= (arr!724 _values!1501) (store mapRest!1249 mapKey!1249 mapValue!1249))))

(declare-fun b!27211 () Bool)

(assert (=> b!27211 (= e!17732 tp_is_empty!1149)))

(declare-fun b!27212 () Bool)

(declare-fun res!16119 () Bool)

(assert (=> b!27212 (=> (not res!16119) (not e!17731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1541 (_ BitVec 32)) Bool)

(assert (=> b!27212 (= res!16119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27213 () Bool)

(assert (=> b!27213 (= e!17731 (or (bvsge #b00000000000000000000000000000000 (size!826 _keys!1833)) (bvsge (size!826 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!27214 () Bool)

(declare-fun res!16116 () Bool)

(assert (=> b!27214 (=> (not res!16116) (not e!17731))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27214 (= res!16116 (validKeyInArray!0 k0!1304))))

(declare-fun b!27215 () Bool)

(declare-fun res!16113 () Bool)

(assert (=> b!27215 (=> (not res!16113) (not e!17731))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1357)

(declare-fun minValue!1443 () V!1357)

(declare-datatypes ((tuple2!1012 0))(
  ( (tuple2!1013 (_1!517 (_ BitVec 64)) (_2!517 V!1357)) )
))
(declare-datatypes ((List!612 0))(
  ( (Nil!609) (Cons!608 (h!1175 tuple2!1012) (t!3303 List!612)) )
))
(declare-datatypes ((ListLongMap!589 0))(
  ( (ListLongMap!590 (toList!310 List!612)) )
))
(declare-fun contains!249 (ListLongMap!589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!140 (array!1541 array!1539 (_ BitVec 32) (_ BitVec 32) V!1357 V!1357 (_ BitVec 32) Int) ListLongMap!589)

(assert (=> b!27215 (= res!16113 (not (contains!249 (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27216 () Bool)

(declare-fun res!16114 () Bool)

(assert (=> b!27216 (=> (not res!16114) (not e!17731))))

(declare-datatypes ((List!613 0))(
  ( (Nil!610) (Cons!609 (h!1176 (_ BitVec 64)) (t!3304 List!613)) )
))
(declare-fun arrayNoDuplicates!0 (array!1541 (_ BitVec 32) List!613) Bool)

(assert (=> b!27216 (= res!16114 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!610))))

(declare-fun b!27217 () Bool)

(declare-fun res!16117 () Bool)

(assert (=> b!27217 (=> (not res!16117) (not e!17731))))

(declare-fun arrayContainsKey!0 (array!1541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27217 (= res!16117 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16118 () Bool)

(assert (=> start!3872 (=> (not res!16118) (not e!17731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3872 (= res!16118 (validMask!0 mask!2294))))

(assert (=> start!3872 e!17731))

(assert (=> start!3872 true))

(assert (=> start!3872 tp!3801))

(declare-fun e!17733 () Bool)

(declare-fun array_inv!497 (array!1539) Bool)

(assert (=> start!3872 (and (array_inv!497 _values!1501) e!17733)))

(declare-fun array_inv!498 (array!1541) Bool)

(assert (=> start!3872 (array_inv!498 _keys!1833)))

(assert (=> start!3872 tp_is_empty!1149))

(declare-fun mapIsEmpty!1249 () Bool)

(assert (=> mapIsEmpty!1249 mapRes!1249))

(declare-fun b!27218 () Bool)

(assert (=> b!27218 (= e!17733 (and e!17734 mapRes!1249))))

(declare-fun condMapEmpty!1249 () Bool)

(declare-fun mapDefault!1249 () ValueCell!375)

(assert (=> b!27218 (= condMapEmpty!1249 (= (arr!724 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!375)) mapDefault!1249)))))

(assert (= (and start!3872 res!16118) b!27210))

(assert (= (and b!27210 res!16115) b!27212))

(assert (= (and b!27212 res!16119) b!27216))

(assert (= (and b!27216 res!16114) b!27214))

(assert (= (and b!27214 res!16116) b!27215))

(assert (= (and b!27215 res!16113) b!27217))

(assert (= (and b!27217 res!16117) b!27213))

(assert (= (and b!27218 condMapEmpty!1249) mapIsEmpty!1249))

(assert (= (and b!27218 (not condMapEmpty!1249)) mapNonEmpty!1249))

(get-info :version)

(assert (= (and mapNonEmpty!1249 ((_ is ValueCellFull!375) mapValue!1249)) b!27211))

(assert (= (and b!27218 ((_ is ValueCellFull!375) mapDefault!1249)) b!27209))

(assert (= start!3872 b!27218))

(declare-fun m!21731 () Bool)

(assert (=> b!27212 m!21731))

(declare-fun m!21733 () Bool)

(assert (=> mapNonEmpty!1249 m!21733))

(declare-fun m!21735 () Bool)

(assert (=> b!27217 m!21735))

(declare-fun m!21737 () Bool)

(assert (=> b!27214 m!21737))

(declare-fun m!21739 () Bool)

(assert (=> start!3872 m!21739))

(declare-fun m!21741 () Bool)

(assert (=> start!3872 m!21741))

(declare-fun m!21743 () Bool)

(assert (=> start!3872 m!21743))

(declare-fun m!21745 () Bool)

(assert (=> b!27216 m!21745))

(declare-fun m!21747 () Bool)

(assert (=> b!27215 m!21747))

(assert (=> b!27215 m!21747))

(declare-fun m!21749 () Bool)

(assert (=> b!27215 m!21749))

(check-sat (not mapNonEmpty!1249) (not b!27214) (not b!27215) (not b!27212) (not b!27216) b_and!1603 (not b!27217) (not b_next!795) tp_is_empty!1149 (not start!3872))
(check-sat b_and!1603 (not b_next!795))
(get-model)

(declare-fun d!4947 () Bool)

(assert (=> d!4947 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3872 d!4947))

(declare-fun d!4949 () Bool)

(assert (=> d!4949 (= (array_inv!497 _values!1501) (bvsge (size!825 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3872 d!4949))

(declare-fun d!4951 () Bool)

(assert (=> d!4951 (= (array_inv!498 _keys!1833) (bvsge (size!826 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3872 d!4951))

(declare-fun d!4953 () Bool)

(declare-fun res!16145 () Bool)

(declare-fun e!17755 () Bool)

(assert (=> d!4953 (=> res!16145 e!17755)))

(assert (=> d!4953 (= res!16145 (= (select (arr!725 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!4953 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!17755)))

(declare-fun b!27253 () Bool)

(declare-fun e!17756 () Bool)

(assert (=> b!27253 (= e!17755 e!17756)))

(declare-fun res!16146 () Bool)

(assert (=> b!27253 (=> (not res!16146) (not e!17756))))

(assert (=> b!27253 (= res!16146 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!826 _keys!1833)))))

(declare-fun b!27254 () Bool)

(assert (=> b!27254 (= e!17756 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!4953 (not res!16145)) b!27253))

(assert (= (and b!27253 res!16146) b!27254))

(declare-fun m!21771 () Bool)

(assert (=> d!4953 m!21771))

(declare-fun m!21773 () Bool)

(assert (=> b!27254 m!21773))

(assert (=> b!27217 d!4953))

(declare-fun bm!2561 () Bool)

(declare-fun call!2564 () Bool)

(assert (=> bm!2561 (= call!2564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!27263 () Bool)

(declare-fun e!17763 () Bool)

(declare-fun e!17765 () Bool)

(assert (=> b!27263 (= e!17763 e!17765)))

(declare-fun lt!10592 () (_ BitVec 64))

(assert (=> b!27263 (= lt!10592 (select (arr!725 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!635 0))(
  ( (Unit!636) )
))
(declare-fun lt!10591 () Unit!635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1541 (_ BitVec 64) (_ BitVec 32)) Unit!635)

(assert (=> b!27263 (= lt!10591 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10592 #b00000000000000000000000000000000))))

(assert (=> b!27263 (arrayContainsKey!0 _keys!1833 lt!10592 #b00000000000000000000000000000000)))

(declare-fun lt!10590 () Unit!635)

(assert (=> b!27263 (= lt!10590 lt!10591)))

(declare-fun res!16152 () Bool)

(declare-datatypes ((SeekEntryResult!64 0))(
  ( (MissingZero!64 (index!2378 (_ BitVec 32))) (Found!64 (index!2379 (_ BitVec 32))) (Intermediate!64 (undefined!876 Bool) (index!2380 (_ BitVec 32)) (x!6214 (_ BitVec 32))) (Undefined!64) (MissingVacant!64 (index!2381 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1541 (_ BitVec 32)) SeekEntryResult!64)

(assert (=> b!27263 (= res!16152 (= (seekEntryOrOpen!0 (select (arr!725 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!64 #b00000000000000000000000000000000)))))

(assert (=> b!27263 (=> (not res!16152) (not e!17765))))

(declare-fun b!27264 () Bool)

(declare-fun e!17764 () Bool)

(assert (=> b!27264 (= e!17764 e!17763)))

(declare-fun c!3713 () Bool)

(assert (=> b!27264 (= c!3713 (validKeyInArray!0 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27265 () Bool)

(assert (=> b!27265 (= e!17763 call!2564)))

(declare-fun d!4955 () Bool)

(declare-fun res!16151 () Bool)

(assert (=> d!4955 (=> res!16151 e!17764)))

(assert (=> d!4955 (= res!16151 (bvsge #b00000000000000000000000000000000 (size!826 _keys!1833)))))

(assert (=> d!4955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17764)))

(declare-fun b!27266 () Bool)

(assert (=> b!27266 (= e!17765 call!2564)))

(assert (= (and d!4955 (not res!16151)) b!27264))

(assert (= (and b!27264 c!3713) b!27263))

(assert (= (and b!27264 (not c!3713)) b!27265))

(assert (= (and b!27263 res!16152) b!27266))

(assert (= (or b!27266 b!27265) bm!2561))

(declare-fun m!21775 () Bool)

(assert (=> bm!2561 m!21775))

(assert (=> b!27263 m!21771))

(declare-fun m!21777 () Bool)

(assert (=> b!27263 m!21777))

(declare-fun m!21779 () Bool)

(assert (=> b!27263 m!21779))

(assert (=> b!27263 m!21771))

(declare-fun m!21781 () Bool)

(assert (=> b!27263 m!21781))

(assert (=> b!27264 m!21771))

(assert (=> b!27264 m!21771))

(declare-fun m!21783 () Bool)

(assert (=> b!27264 m!21783))

(assert (=> b!27212 d!4955))

(declare-fun d!4957 () Bool)

(assert (=> d!4957 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27214 d!4957))

(declare-fun d!4959 () Bool)

(declare-fun e!17770 () Bool)

(assert (=> d!4959 e!17770))

(declare-fun res!16155 () Bool)

(assert (=> d!4959 (=> res!16155 e!17770)))

(declare-fun lt!10602 () Bool)

(assert (=> d!4959 (= res!16155 (not lt!10602))))

(declare-fun lt!10604 () Bool)

(assert (=> d!4959 (= lt!10602 lt!10604)))

(declare-fun lt!10601 () Unit!635)

(declare-fun e!17771 () Unit!635)

(assert (=> d!4959 (= lt!10601 e!17771)))

(declare-fun c!3716 () Bool)

(assert (=> d!4959 (= c!3716 lt!10604)))

(declare-fun containsKey!28 (List!612 (_ BitVec 64)) Bool)

(assert (=> d!4959 (= lt!10604 (containsKey!28 (toList!310 (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4959 (= (contains!249 (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10602)))

(declare-fun b!27273 () Bool)

(declare-fun lt!10603 () Unit!635)

(assert (=> b!27273 (= e!17771 lt!10603)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!25 (List!612 (_ BitVec 64)) Unit!635)

(assert (=> b!27273 (= lt!10603 (lemmaContainsKeyImpliesGetValueByKeyDefined!25 (toList!310 (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!70 0))(
  ( (Some!69 (v!1691 V!1357)) (None!68) )
))
(declare-fun isDefined!26 (Option!70) Bool)

(declare-fun getValueByKey!64 (List!612 (_ BitVec 64)) Option!70)

(assert (=> b!27273 (isDefined!26 (getValueByKey!64 (toList!310 (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!27274 () Bool)

(declare-fun Unit!637 () Unit!635)

(assert (=> b!27274 (= e!17771 Unit!637)))

(declare-fun b!27275 () Bool)

(assert (=> b!27275 (= e!17770 (isDefined!26 (getValueByKey!64 (toList!310 (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4959 c!3716) b!27273))

(assert (= (and d!4959 (not c!3716)) b!27274))

(assert (= (and d!4959 (not res!16155)) b!27275))

(declare-fun m!21785 () Bool)

(assert (=> d!4959 m!21785))

(declare-fun m!21787 () Bool)

(assert (=> b!27273 m!21787))

(declare-fun m!21789 () Bool)

(assert (=> b!27273 m!21789))

(assert (=> b!27273 m!21789))

(declare-fun m!21791 () Bool)

(assert (=> b!27273 m!21791))

(assert (=> b!27275 m!21789))

(assert (=> b!27275 m!21789))

(assert (=> b!27275 m!21791))

(assert (=> b!27215 d!4959))

(declare-fun b!27318 () Bool)

(declare-fun e!17807 () ListLongMap!589)

(declare-fun call!2583 () ListLongMap!589)

(assert (=> b!27318 (= e!17807 call!2583)))

(declare-fun b!27319 () Bool)

(declare-fun res!16179 () Bool)

(declare-fun e!17800 () Bool)

(assert (=> b!27319 (=> (not res!16179) (not e!17800))))

(declare-fun e!17808 () Bool)

(assert (=> b!27319 (= res!16179 e!17808)))

(declare-fun c!3730 () Bool)

(assert (=> b!27319 (= c!3730 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!27320 () Bool)

(declare-fun e!17802 () Bool)

(declare-fun lt!10664 () ListLongMap!589)

(declare-fun apply!32 (ListLongMap!589 (_ BitVec 64)) V!1357)

(assert (=> b!27320 (= e!17802 (= (apply!32 lt!10664 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!27321 () Bool)

(declare-fun e!17803 () Bool)

(assert (=> b!27321 (= e!17803 (= (apply!32 lt!10664 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!27322 () Bool)

(declare-fun e!17805 () Bool)

(assert (=> b!27322 (= e!17800 e!17805)))

(declare-fun c!3734 () Bool)

(assert (=> b!27322 (= c!3734 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27323 () Bool)

(declare-fun e!17798 () Unit!635)

(declare-fun Unit!638 () Unit!635)

(assert (=> b!27323 (= e!17798 Unit!638)))

(declare-fun b!27324 () Bool)

(assert (=> b!27324 (= e!17808 e!17802)))

(declare-fun res!16182 () Bool)

(declare-fun call!2581 () Bool)

(assert (=> b!27324 (= res!16182 call!2581)))

(assert (=> b!27324 (=> (not res!16182) (not e!17802))))

(declare-fun b!27325 () Bool)

(declare-fun e!17801 () ListLongMap!589)

(declare-fun call!2582 () ListLongMap!589)

(declare-fun +!50 (ListLongMap!589 tuple2!1012) ListLongMap!589)

(assert (=> b!27325 (= e!17801 (+!50 call!2582 (tuple2!1013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun d!4961 () Bool)

(assert (=> d!4961 e!17800))

(declare-fun res!16174 () Bool)

(assert (=> d!4961 (=> (not res!16174) (not e!17800))))

(assert (=> d!4961 (= res!16174 (or (bvsge #b00000000000000000000000000000000 (size!826 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!826 _keys!1833)))))))

(declare-fun lt!10665 () ListLongMap!589)

(assert (=> d!4961 (= lt!10664 lt!10665)))

(declare-fun lt!10653 () Unit!635)

(assert (=> d!4961 (= lt!10653 e!17798)))

(declare-fun c!3732 () Bool)

(declare-fun e!17804 () Bool)

(assert (=> d!4961 (= c!3732 e!17804)))

(declare-fun res!16175 () Bool)

(assert (=> d!4961 (=> (not res!16175) (not e!17804))))

(assert (=> d!4961 (= res!16175 (bvslt #b00000000000000000000000000000000 (size!826 _keys!1833)))))

(assert (=> d!4961 (= lt!10665 e!17801)))

(declare-fun c!3731 () Bool)

(assert (=> d!4961 (= c!3731 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4961 (validMask!0 mask!2294)))

(assert (=> d!4961 (= (getCurrentListMap!140 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10664)))

(declare-fun b!27326 () Bool)

(declare-fun e!17806 () ListLongMap!589)

(assert (=> b!27326 (= e!17806 call!2583)))

(declare-fun bm!2576 () Bool)

(declare-fun call!2585 () ListLongMap!589)

(declare-fun getCurrentListMapNoExtraKeys!19 (array!1541 array!1539 (_ BitVec 32) (_ BitVec 32) V!1357 V!1357 (_ BitVec 32) Int) ListLongMap!589)

(assert (=> bm!2576 (= call!2585 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!27327 () Bool)

(declare-fun c!3733 () Bool)

(assert (=> b!27327 (= c!3733 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!27327 (= e!17807 e!17806)))

(declare-fun bm!2577 () Bool)

(assert (=> bm!2577 (= call!2581 (contains!249 lt!10664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27328 () Bool)

(assert (=> b!27328 (= e!17804 (validKeyInArray!0 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27329 () Bool)

(declare-fun e!17799 () Bool)

(declare-fun e!17809 () Bool)

(assert (=> b!27329 (= e!17799 e!17809)))

(declare-fun res!16178 () Bool)

(assert (=> b!27329 (=> (not res!16178) (not e!17809))))

(assert (=> b!27329 (= res!16178 (contains!249 lt!10664 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!27329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!826 _keys!1833)))))

(declare-fun bm!2578 () Bool)

(declare-fun call!2584 () Bool)

(assert (=> bm!2578 (= call!2584 (contains!249 lt!10664 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2579 () Bool)

(declare-fun call!2580 () ListLongMap!589)

(declare-fun call!2579 () ListLongMap!589)

(assert (=> bm!2579 (= call!2580 call!2579)))

(declare-fun bm!2580 () Bool)

(assert (=> bm!2580 (= call!2579 call!2585)))

(declare-fun b!27330 () Bool)

(declare-fun get!439 (ValueCell!375 V!1357) V!1357)

(declare-fun dynLambda!149 (Int (_ BitVec 64)) V!1357)

(assert (=> b!27330 (= e!17809 (= (apply!32 lt!10664 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)) (get!439 (select (arr!724 _values!1501) #b00000000000000000000000000000000) (dynLambda!149 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!825 _values!1501)))))

(assert (=> b!27330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!826 _keys!1833)))))

(declare-fun b!27331 () Bool)

(assert (=> b!27331 (= e!17805 (not call!2584))))

(declare-fun bm!2581 () Bool)

(assert (=> bm!2581 (= call!2583 call!2582)))

(declare-fun b!27332 () Bool)

(assert (=> b!27332 (= e!17808 (not call!2581))))

(declare-fun b!27333 () Bool)

(declare-fun lt!10655 () Unit!635)

(assert (=> b!27333 (= e!17798 lt!10655)))

(declare-fun lt!10659 () ListLongMap!589)

(assert (=> b!27333 (= lt!10659 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10658 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10662 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10662 (select (arr!725 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10667 () Unit!635)

(declare-fun addStillContains!17 (ListLongMap!589 (_ BitVec 64) V!1357 (_ BitVec 64)) Unit!635)

(assert (=> b!27333 (= lt!10667 (addStillContains!17 lt!10659 lt!10658 zeroValue!1443 lt!10662))))

(assert (=> b!27333 (contains!249 (+!50 lt!10659 (tuple2!1013 lt!10658 zeroValue!1443)) lt!10662)))

(declare-fun lt!10649 () Unit!635)

(assert (=> b!27333 (= lt!10649 lt!10667)))

(declare-fun lt!10669 () ListLongMap!589)

(assert (=> b!27333 (= lt!10669 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10650 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10650 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10654 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10654 (select (arr!725 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10657 () Unit!635)

(declare-fun addApplyDifferent!17 (ListLongMap!589 (_ BitVec 64) V!1357 (_ BitVec 64)) Unit!635)

(assert (=> b!27333 (= lt!10657 (addApplyDifferent!17 lt!10669 lt!10650 minValue!1443 lt!10654))))

(assert (=> b!27333 (= (apply!32 (+!50 lt!10669 (tuple2!1013 lt!10650 minValue!1443)) lt!10654) (apply!32 lt!10669 lt!10654))))

(declare-fun lt!10670 () Unit!635)

(assert (=> b!27333 (= lt!10670 lt!10657)))

(declare-fun lt!10660 () ListLongMap!589)

(assert (=> b!27333 (= lt!10660 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10651 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10668 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10668 (select (arr!725 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10661 () Unit!635)

(assert (=> b!27333 (= lt!10661 (addApplyDifferent!17 lt!10660 lt!10651 zeroValue!1443 lt!10668))))

(assert (=> b!27333 (= (apply!32 (+!50 lt!10660 (tuple2!1013 lt!10651 zeroValue!1443)) lt!10668) (apply!32 lt!10660 lt!10668))))

(declare-fun lt!10666 () Unit!635)

(assert (=> b!27333 (= lt!10666 lt!10661)))

(declare-fun lt!10663 () ListLongMap!589)

(assert (=> b!27333 (= lt!10663 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10652 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10656 () (_ BitVec 64))

(assert (=> b!27333 (= lt!10656 (select (arr!725 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!27333 (= lt!10655 (addApplyDifferent!17 lt!10663 lt!10652 minValue!1443 lt!10656))))

(assert (=> b!27333 (= (apply!32 (+!50 lt!10663 (tuple2!1013 lt!10652 minValue!1443)) lt!10656) (apply!32 lt!10663 lt!10656))))

(declare-fun b!27334 () Bool)

(assert (=> b!27334 (= e!17805 e!17803)))

(declare-fun res!16181 () Bool)

(assert (=> b!27334 (= res!16181 call!2584)))

(assert (=> b!27334 (=> (not res!16181) (not e!17803))))

(declare-fun c!3729 () Bool)

(declare-fun bm!2582 () Bool)

(assert (=> bm!2582 (= call!2582 (+!50 (ite c!3731 call!2585 (ite c!3729 call!2579 call!2580)) (ite (or c!3731 c!3729) (tuple2!1013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!27335 () Bool)

(declare-fun e!17810 () Bool)

(assert (=> b!27335 (= e!17810 (validKeyInArray!0 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27336 () Bool)

(assert (=> b!27336 (= e!17806 call!2580)))

(declare-fun b!27337 () Bool)

(assert (=> b!27337 (= e!17801 e!17807)))

(assert (=> b!27337 (= c!3729 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27338 () Bool)

(declare-fun res!16177 () Bool)

(assert (=> b!27338 (=> (not res!16177) (not e!17800))))

(assert (=> b!27338 (= res!16177 e!17799)))

(declare-fun res!16180 () Bool)

(assert (=> b!27338 (=> res!16180 e!17799)))

(assert (=> b!27338 (= res!16180 (not e!17810))))

(declare-fun res!16176 () Bool)

(assert (=> b!27338 (=> (not res!16176) (not e!17810))))

(assert (=> b!27338 (= res!16176 (bvslt #b00000000000000000000000000000000 (size!826 _keys!1833)))))

(assert (= (and d!4961 c!3731) b!27325))

(assert (= (and d!4961 (not c!3731)) b!27337))

(assert (= (and b!27337 c!3729) b!27318))

(assert (= (and b!27337 (not c!3729)) b!27327))

(assert (= (and b!27327 c!3733) b!27326))

(assert (= (and b!27327 (not c!3733)) b!27336))

(assert (= (or b!27326 b!27336) bm!2579))

(assert (= (or b!27318 bm!2579) bm!2580))

(assert (= (or b!27318 b!27326) bm!2581))

(assert (= (or b!27325 bm!2580) bm!2576))

(assert (= (or b!27325 bm!2581) bm!2582))

(assert (= (and d!4961 res!16175) b!27328))

(assert (= (and d!4961 c!3732) b!27333))

(assert (= (and d!4961 (not c!3732)) b!27323))

(assert (= (and d!4961 res!16174) b!27338))

(assert (= (and b!27338 res!16176) b!27335))

(assert (= (and b!27338 (not res!16180)) b!27329))

(assert (= (and b!27329 res!16178) b!27330))

(assert (= (and b!27338 res!16177) b!27319))

(assert (= (and b!27319 c!3730) b!27324))

(assert (= (and b!27319 (not c!3730)) b!27332))

(assert (= (and b!27324 res!16182) b!27320))

(assert (= (or b!27324 b!27332) bm!2577))

(assert (= (and b!27319 res!16179) b!27322))

(assert (= (and b!27322 c!3734) b!27334))

(assert (= (and b!27322 (not c!3734)) b!27331))

(assert (= (and b!27334 res!16181) b!27321))

(assert (= (or b!27334 b!27331) bm!2578))

(declare-fun b_lambda!1691 () Bool)

(assert (=> (not b_lambda!1691) (not b!27330)))

(declare-fun t!3308 () Bool)

(declare-fun tb!679 () Bool)

(assert (=> (and start!3872 (= defaultEntry!1504 defaultEntry!1504) t!3308) tb!679))

(declare-fun result!1147 () Bool)

(assert (=> tb!679 (= result!1147 tp_is_empty!1149)))

(assert (=> b!27330 t!3308))

(declare-fun b_and!1607 () Bool)

(assert (= b_and!1603 (and (=> t!3308 result!1147) b_and!1607)))

(assert (=> b!27328 m!21771))

(assert (=> b!27328 m!21771))

(assert (=> b!27328 m!21783))

(declare-fun m!21793 () Bool)

(assert (=> bm!2577 m!21793))

(assert (=> d!4961 m!21739))

(assert (=> b!27335 m!21771))

(assert (=> b!27335 m!21771))

(assert (=> b!27335 m!21783))

(declare-fun m!21795 () Bool)

(assert (=> b!27320 m!21795))

(assert (=> b!27329 m!21771))

(assert (=> b!27329 m!21771))

(declare-fun m!21797 () Bool)

(assert (=> b!27329 m!21797))

(declare-fun m!21799 () Bool)

(assert (=> b!27321 m!21799))

(declare-fun m!21801 () Bool)

(assert (=> b!27333 m!21801))

(declare-fun m!21803 () Bool)

(assert (=> b!27333 m!21803))

(declare-fun m!21805 () Bool)

(assert (=> b!27333 m!21805))

(declare-fun m!21807 () Bool)

(assert (=> b!27333 m!21807))

(declare-fun m!21809 () Bool)

(assert (=> b!27333 m!21809))

(declare-fun m!21811 () Bool)

(assert (=> b!27333 m!21811))

(declare-fun m!21813 () Bool)

(assert (=> b!27333 m!21813))

(declare-fun m!21815 () Bool)

(assert (=> b!27333 m!21815))

(declare-fun m!21817 () Bool)

(assert (=> b!27333 m!21817))

(declare-fun m!21819 () Bool)

(assert (=> b!27333 m!21819))

(assert (=> b!27333 m!21805))

(declare-fun m!21821 () Bool)

(assert (=> b!27333 m!21821))

(assert (=> b!27333 m!21771))

(declare-fun m!21823 () Bool)

(assert (=> b!27333 m!21823))

(declare-fun m!21825 () Bool)

(assert (=> b!27333 m!21825))

(declare-fun m!21827 () Bool)

(assert (=> b!27333 m!21827))

(assert (=> b!27333 m!21811))

(declare-fun m!21829 () Bool)

(assert (=> b!27333 m!21829))

(assert (=> b!27333 m!21815))

(declare-fun m!21831 () Bool)

(assert (=> b!27333 m!21831))

(assert (=> b!27333 m!21823))

(declare-fun m!21833 () Bool)

(assert (=> bm!2582 m!21833))

(declare-fun m!21835 () Bool)

(assert (=> bm!2578 m!21835))

(assert (=> bm!2576 m!21809))

(declare-fun m!21837 () Bool)

(assert (=> b!27325 m!21837))

(assert (=> b!27330 m!21771))

(declare-fun m!21839 () Bool)

(assert (=> b!27330 m!21839))

(declare-fun m!21841 () Bool)

(assert (=> b!27330 m!21841))

(declare-fun m!21843 () Bool)

(assert (=> b!27330 m!21843))

(declare-fun m!21845 () Bool)

(assert (=> b!27330 m!21845))

(assert (=> b!27330 m!21771))

(assert (=> b!27330 m!21841))

(assert (=> b!27330 m!21843))

(assert (=> b!27215 d!4961))

(declare-fun b!27351 () Bool)

(declare-fun e!17820 () Bool)

(declare-fun call!2588 () Bool)

(assert (=> b!27351 (= e!17820 call!2588)))

(declare-fun b!27352 () Bool)

(declare-fun e!17822 () Bool)

(assert (=> b!27352 (= e!17822 e!17820)))

(declare-fun c!3737 () Bool)

(assert (=> b!27352 (= c!3737 (validKeyInArray!0 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4963 () Bool)

(declare-fun res!16190 () Bool)

(declare-fun e!17821 () Bool)

(assert (=> d!4963 (=> res!16190 e!17821)))

(assert (=> d!4963 (= res!16190 (bvsge #b00000000000000000000000000000000 (size!826 _keys!1833)))))

(assert (=> d!4963 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!610) e!17821)))

(declare-fun b!27353 () Bool)

(assert (=> b!27353 (= e!17821 e!17822)))

(declare-fun res!16191 () Bool)

(assert (=> b!27353 (=> (not res!16191) (not e!17822))))

(declare-fun e!17819 () Bool)

(assert (=> b!27353 (= res!16191 (not e!17819))))

(declare-fun res!16189 () Bool)

(assert (=> b!27353 (=> (not res!16189) (not e!17819))))

(assert (=> b!27353 (= res!16189 (validKeyInArray!0 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27354 () Bool)

(declare-fun contains!251 (List!613 (_ BitVec 64)) Bool)

(assert (=> b!27354 (= e!17819 (contains!251 Nil!610 (select (arr!725 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27355 () Bool)

(assert (=> b!27355 (= e!17820 call!2588)))

(declare-fun bm!2585 () Bool)

(assert (=> bm!2585 (= call!2588 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3737 (Cons!609 (select (arr!725 _keys!1833) #b00000000000000000000000000000000) Nil!610) Nil!610)))))

(assert (= (and d!4963 (not res!16190)) b!27353))

(assert (= (and b!27353 res!16189) b!27354))

(assert (= (and b!27353 res!16191) b!27352))

(assert (= (and b!27352 c!3737) b!27351))

(assert (= (and b!27352 (not c!3737)) b!27355))

(assert (= (or b!27351 b!27355) bm!2585))

(assert (=> b!27352 m!21771))

(assert (=> b!27352 m!21771))

(assert (=> b!27352 m!21783))

(assert (=> b!27353 m!21771))

(assert (=> b!27353 m!21771))

(assert (=> b!27353 m!21783))

(assert (=> b!27354 m!21771))

(assert (=> b!27354 m!21771))

(declare-fun m!21847 () Bool)

(assert (=> b!27354 m!21847))

(assert (=> bm!2585 m!21771))

(declare-fun m!21849 () Bool)

(assert (=> bm!2585 m!21849))

(assert (=> b!27216 d!4963))

(declare-fun mapNonEmpty!1255 () Bool)

(declare-fun mapRes!1255 () Bool)

(declare-fun tp!3811 () Bool)

(declare-fun e!17827 () Bool)

(assert (=> mapNonEmpty!1255 (= mapRes!1255 (and tp!3811 e!17827))))

(declare-fun mapValue!1255 () ValueCell!375)

(declare-fun mapKey!1255 () (_ BitVec 32))

(declare-fun mapRest!1255 () (Array (_ BitVec 32) ValueCell!375))

(assert (=> mapNonEmpty!1255 (= mapRest!1249 (store mapRest!1255 mapKey!1255 mapValue!1255))))

(declare-fun condMapEmpty!1255 () Bool)

(declare-fun mapDefault!1255 () ValueCell!375)

(assert (=> mapNonEmpty!1249 (= condMapEmpty!1255 (= mapRest!1249 ((as const (Array (_ BitVec 32) ValueCell!375)) mapDefault!1255)))))

(declare-fun e!17828 () Bool)

(assert (=> mapNonEmpty!1249 (= tp!3802 (and e!17828 mapRes!1255))))

(declare-fun b!27363 () Bool)

(assert (=> b!27363 (= e!17828 tp_is_empty!1149)))

(declare-fun b!27362 () Bool)

(assert (=> b!27362 (= e!17827 tp_is_empty!1149)))

(declare-fun mapIsEmpty!1255 () Bool)

(assert (=> mapIsEmpty!1255 mapRes!1255))

(assert (= (and mapNonEmpty!1249 condMapEmpty!1255) mapIsEmpty!1255))

(assert (= (and mapNonEmpty!1249 (not condMapEmpty!1255)) mapNonEmpty!1255))

(assert (= (and mapNonEmpty!1255 ((_ is ValueCellFull!375) mapValue!1255)) b!27362))

(assert (= (and mapNonEmpty!1249 ((_ is ValueCellFull!375) mapDefault!1255)) b!27363))

(declare-fun m!21851 () Bool)

(assert (=> mapNonEmpty!1255 m!21851))

(declare-fun b_lambda!1693 () Bool)

(assert (= b_lambda!1691 (or (and start!3872 b_free!795) b_lambda!1693)))

(check-sat (not bm!2561) (not b!27333) (not b!27353) (not b_next!795) (not b!27254) (not b!27263) (not b!27325) (not b!27328) (not b!27354) (not mapNonEmpty!1255) (not b!27321) (not b!27264) (not b_lambda!1693) (not b!27352) (not b!27273) (not b!27329) (not bm!2577) b_and!1607 (not d!4959) (not bm!2585) tp_is_empty!1149 (not bm!2582) (not bm!2576) (not bm!2578) (not b!27330) (not b!27335) (not b!27320) (not b!27275) (not d!4961))
(check-sat b_and!1607 (not b_next!795))
