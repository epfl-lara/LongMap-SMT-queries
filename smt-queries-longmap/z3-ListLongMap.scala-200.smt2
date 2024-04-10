; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3850 () Bool)

(assert start!3850)

(declare-fun b_free!789 () Bool)

(declare-fun b_next!789 () Bool)

(assert (=> start!3850 (= b_free!789 (not b_next!789))))

(declare-fun tp!3781 () Bool)

(declare-fun b_and!1595 () Bool)

(assert (=> start!3850 (= tp!3781 b_and!1595)))

(declare-fun b!27014 () Bool)

(declare-fun res!16014 () Bool)

(declare-fun e!17615 () Bool)

(assert (=> b!27014 (=> (not res!16014) (not e!17615))))

(declare-datatypes ((array!1525 0))(
  ( (array!1526 (arr!718 (Array (_ BitVec 32) (_ BitVec 64))) (size!819 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1525)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1525 (_ BitVec 32)) Bool)

(assert (=> b!27014 (= res!16014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1237 () Bool)

(declare-fun mapRes!1237 () Bool)

(declare-fun tp!3780 () Bool)

(declare-fun e!17614 () Bool)

(assert (=> mapNonEmpty!1237 (= mapRes!1237 (and tp!3780 e!17614))))

(declare-datatypes ((V!1349 0))(
  ( (V!1350 (val!598 Int)) )
))
(declare-datatypes ((ValueCell!372 0))(
  ( (ValueCellFull!372 (v!1685 V!1349)) (EmptyCell!372) )
))
(declare-datatypes ((array!1527 0))(
  ( (array!1528 (arr!719 (Array (_ BitVec 32) ValueCell!372)) (size!820 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1527)

(declare-fun mapRest!1237 () (Array (_ BitVec 32) ValueCell!372))

(declare-fun mapKey!1237 () (_ BitVec 32))

(declare-fun mapValue!1237 () ValueCell!372)

(assert (=> mapNonEmpty!1237 (= (arr!719 _values!1501) (store mapRest!1237 mapKey!1237 mapValue!1237))))

(declare-fun mapIsEmpty!1237 () Bool)

(assert (=> mapIsEmpty!1237 mapRes!1237))

(declare-fun b!27015 () Bool)

(declare-fun e!17616 () Bool)

(declare-fun e!17618 () Bool)

(assert (=> b!27015 (= e!17616 (and e!17618 mapRes!1237))))

(declare-fun condMapEmpty!1237 () Bool)

(declare-fun mapDefault!1237 () ValueCell!372)

(assert (=> b!27015 (= condMapEmpty!1237 (= (arr!719 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!372)) mapDefault!1237)))))

(declare-fun b!27016 () Bool)

(declare-fun res!16010 () Bool)

(assert (=> b!27016 (=> (not res!16010) (not e!17615))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1349)

(declare-fun minValue!1443 () V!1349)

(declare-datatypes ((tuple2!1006 0))(
  ( (tuple2!1007 (_1!514 (_ BitVec 64)) (_2!514 V!1349)) )
))
(declare-datatypes ((List!606 0))(
  ( (Nil!603) (Cons!602 (h!1169 tuple2!1006) (t!3295 List!606)) )
))
(declare-datatypes ((ListLongMap!583 0))(
  ( (ListLongMap!584 (toList!307 List!606)) )
))
(declare-fun contains!245 (ListLongMap!583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!137 (array!1525 array!1527 (_ BitVec 32) (_ BitVec 32) V!1349 V!1349 (_ BitVec 32) Int) ListLongMap!583)

(assert (=> b!27016 (= res!16010 (not (contains!245 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27017 () Bool)

(declare-fun res!16009 () Bool)

(assert (=> b!27017 (=> (not res!16009) (not e!17615))))

(declare-datatypes ((List!607 0))(
  ( (Nil!604) (Cons!603 (h!1170 (_ BitVec 64)) (t!3296 List!607)) )
))
(declare-fun arrayNoDuplicates!0 (array!1525 (_ BitVec 32) List!607) Bool)

(assert (=> b!27017 (= res!16009 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!604))))

(declare-fun b!27019 () Bool)

(declare-fun tp_is_empty!1143 () Bool)

(assert (=> b!27019 (= e!17618 tp_is_empty!1143)))

(declare-fun b!27020 () Bool)

(declare-fun res!16013 () Bool)

(assert (=> b!27020 (=> (not res!16013) (not e!17615))))

(assert (=> b!27020 (= res!16013 (and (= (size!820 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!819 _keys!1833) (size!820 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27021 () Bool)

(declare-fun res!16011 () Bool)

(assert (=> b!27021 (=> (not res!16011) (not e!17615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27021 (= res!16011 (validKeyInArray!0 k0!1304))))

(declare-fun b!27022 () Bool)

(assert (=> b!27022 (= e!17615 (and (bvslt #b00000000000000000000000000000000 (size!819 _keys!1833)) (bvsge (size!819 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!27018 () Bool)

(assert (=> b!27018 (= e!17614 tp_is_empty!1143)))

(declare-fun res!16012 () Bool)

(assert (=> start!3850 (=> (not res!16012) (not e!17615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3850 (= res!16012 (validMask!0 mask!2294))))

(assert (=> start!3850 e!17615))

(assert (=> start!3850 true))

(assert (=> start!3850 tp!3781))

(declare-fun array_inv!493 (array!1527) Bool)

(assert (=> start!3850 (and (array_inv!493 _values!1501) e!17616)))

(declare-fun array_inv!494 (array!1525) Bool)

(assert (=> start!3850 (array_inv!494 _keys!1833)))

(assert (=> start!3850 tp_is_empty!1143))

(assert (= (and start!3850 res!16012) b!27020))

(assert (= (and b!27020 res!16013) b!27014))

(assert (= (and b!27014 res!16014) b!27017))

(assert (= (and b!27017 res!16009) b!27021))

(assert (= (and b!27021 res!16011) b!27016))

(assert (= (and b!27016 res!16010) b!27022))

(assert (= (and b!27015 condMapEmpty!1237) mapIsEmpty!1237))

(assert (= (and b!27015 (not condMapEmpty!1237)) mapNonEmpty!1237))

(get-info :version)

(assert (= (and mapNonEmpty!1237 ((_ is ValueCellFull!372) mapValue!1237)) b!27018))

(assert (= (and b!27015 ((_ is ValueCellFull!372) mapDefault!1237)) b!27019))

(assert (= start!3850 b!27015))

(declare-fun m!21595 () Bool)

(assert (=> mapNonEmpty!1237 m!21595))

(declare-fun m!21597 () Bool)

(assert (=> b!27016 m!21597))

(assert (=> b!27016 m!21597))

(declare-fun m!21599 () Bool)

(assert (=> b!27016 m!21599))

(declare-fun m!21601 () Bool)

(assert (=> start!3850 m!21601))

(declare-fun m!21603 () Bool)

(assert (=> start!3850 m!21603))

(declare-fun m!21605 () Bool)

(assert (=> start!3850 m!21605))

(declare-fun m!21607 () Bool)

(assert (=> b!27021 m!21607))

(declare-fun m!21609 () Bool)

(assert (=> b!27017 m!21609))

(declare-fun m!21611 () Bool)

(assert (=> b!27014 m!21611))

(check-sat (not b!27021) (not b!27016) (not b_next!789) (not b!27014) (not start!3850) tp_is_empty!1143 b_and!1595 (not mapNonEmpty!1237) (not b!27017))
(check-sat b_and!1595 (not b_next!789))
(get-model)

(declare-fun d!4929 () Bool)

(assert (=> d!4929 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3850 d!4929))

(declare-fun d!4931 () Bool)

(assert (=> d!4931 (= (array_inv!493 _values!1501) (bvsge (size!820 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3850 d!4931))

(declare-fun d!4933 () Bool)

(assert (=> d!4933 (= (array_inv!494 _keys!1833) (bvsge (size!819 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3850 d!4933))

(declare-fun d!4935 () Bool)

(assert (=> d!4935 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27021 d!4935))

(declare-fun d!4937 () Bool)

(declare-fun e!17638 () Bool)

(assert (=> d!4937 e!17638))

(declare-fun res!16035 () Bool)

(assert (=> d!4937 (=> res!16035 e!17638)))

(declare-fun lt!10508 () Bool)

(assert (=> d!4937 (= res!16035 (not lt!10508))))

(declare-fun lt!10507 () Bool)

(assert (=> d!4937 (= lt!10508 lt!10507)))

(declare-datatypes ((Unit!631 0))(
  ( (Unit!632) )
))
(declare-fun lt!10506 () Unit!631)

(declare-fun e!17639 () Unit!631)

(assert (=> d!4937 (= lt!10506 e!17639)))

(declare-fun c!3686 () Bool)

(assert (=> d!4937 (= c!3686 lt!10507)))

(declare-fun containsKey!27 (List!606 (_ BitVec 64)) Bool)

(assert (=> d!4937 (= lt!10507 (containsKey!27 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4937 (= (contains!245 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10508)))

(declare-fun b!27056 () Bool)

(declare-fun lt!10505 () Unit!631)

(assert (=> b!27056 (= e!17639 lt!10505)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!24 (List!606 (_ BitVec 64)) Unit!631)

(assert (=> b!27056 (= lt!10505 (lemmaContainsKeyImpliesGetValueByKeyDefined!24 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!69 0))(
  ( (Some!68 (v!1687 V!1349)) (None!67) )
))
(declare-fun isDefined!25 (Option!69) Bool)

(declare-fun getValueByKey!63 (List!606 (_ BitVec 64)) Option!69)

(assert (=> b!27056 (isDefined!25 (getValueByKey!63 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!27057 () Bool)

(declare-fun Unit!633 () Unit!631)

(assert (=> b!27057 (= e!17639 Unit!633)))

(declare-fun b!27058 () Bool)

(assert (=> b!27058 (= e!17638 (isDefined!25 (getValueByKey!63 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4937 c!3686) b!27056))

(assert (= (and d!4937 (not c!3686)) b!27057))

(assert (= (and d!4937 (not res!16035)) b!27058))

(declare-fun m!21631 () Bool)

(assert (=> d!4937 m!21631))

(declare-fun m!21633 () Bool)

(assert (=> b!27056 m!21633))

(declare-fun m!21635 () Bool)

(assert (=> b!27056 m!21635))

(assert (=> b!27056 m!21635))

(declare-fun m!21637 () Bool)

(assert (=> b!27056 m!21637))

(assert (=> b!27058 m!21635))

(assert (=> b!27058 m!21635))

(assert (=> b!27058 m!21637))

(assert (=> b!27016 d!4937))

(declare-fun b!27101 () Bool)

(declare-fun e!17666 () ListLongMap!583)

(declare-fun call!2554 () ListLongMap!583)

(assert (=> b!27101 (= e!17666 call!2554)))

(declare-fun b!27102 () Bool)

(declare-fun e!17677 () ListLongMap!583)

(declare-fun call!2550 () ListLongMap!583)

(declare-fun +!49 (ListLongMap!583 tuple2!1006) ListLongMap!583)

(assert (=> b!27102 (= e!17677 (+!49 call!2550 (tuple2!1007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!27103 () Bool)

(declare-fun e!17678 () Bool)

(declare-fun call!2552 () Bool)

(assert (=> b!27103 (= e!17678 (not call!2552))))

(declare-fun b!27104 () Bool)

(declare-fun res!16058 () Bool)

(declare-fun e!17673 () Bool)

(assert (=> b!27104 (=> (not res!16058) (not e!17673))))

(declare-fun e!17674 () Bool)

(assert (=> b!27104 (= res!16058 e!17674)))

(declare-fun res!16054 () Bool)

(assert (=> b!27104 (=> res!16054 e!17674)))

(declare-fun e!17667 () Bool)

(assert (=> b!27104 (= res!16054 (not e!17667))))

(declare-fun res!16062 () Bool)

(assert (=> b!27104 (=> (not res!16062) (not e!17667))))

(assert (=> b!27104 (= res!16062 (bvslt #b00000000000000000000000000000000 (size!819 _keys!1833)))))

(declare-fun b!27105 () Bool)

(declare-fun e!17672 () Bool)

(declare-fun lt!10574 () ListLongMap!583)

(declare-fun apply!31 (ListLongMap!583 (_ BitVec 64)) V!1349)

(assert (=> b!27105 (= e!17672 (= (apply!31 lt!10574 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!27106 () Bool)

(declare-fun c!3702 () Bool)

(assert (=> b!27106 (= c!3702 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!17676 () ListLongMap!583)

(assert (=> b!27106 (= e!17666 e!17676)))

(declare-fun b!27107 () Bool)

(declare-fun e!17668 () Bool)

(assert (=> b!27107 (= e!17668 e!17672)))

(declare-fun res!16055 () Bool)

(declare-fun call!2553 () Bool)

(assert (=> b!27107 (= res!16055 call!2553)))

(assert (=> b!27107 (=> (not res!16055) (not e!17672))))

(declare-fun bm!2546 () Bool)

(declare-fun call!2555 () ListLongMap!583)

(declare-fun call!2551 () ListLongMap!583)

(assert (=> bm!2546 (= call!2555 call!2551)))

(declare-fun b!27108 () Bool)

(assert (=> b!27108 (= e!17677 e!17666)))

(declare-fun c!3704 () Bool)

(assert (=> b!27108 (= c!3704 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27109 () Bool)

(declare-fun e!17669 () Unit!631)

(declare-fun lt!10570 () Unit!631)

(assert (=> b!27109 (= e!17669 lt!10570)))

(declare-fun lt!10558 () ListLongMap!583)

(declare-fun getCurrentListMapNoExtraKeys!18 (array!1525 array!1527 (_ BitVec 32) (_ BitVec 32) V!1349 V!1349 (_ BitVec 32) Int) ListLongMap!583)

(assert (=> b!27109 (= lt!10558 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10572 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10554 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10554 (select (arr!718 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10553 () Unit!631)

(declare-fun addStillContains!16 (ListLongMap!583 (_ BitVec 64) V!1349 (_ BitVec 64)) Unit!631)

(assert (=> b!27109 (= lt!10553 (addStillContains!16 lt!10558 lt!10572 zeroValue!1443 lt!10554))))

(assert (=> b!27109 (contains!245 (+!49 lt!10558 (tuple2!1007 lt!10572 zeroValue!1443)) lt!10554)))

(declare-fun lt!10562 () Unit!631)

(assert (=> b!27109 (= lt!10562 lt!10553)))

(declare-fun lt!10555 () ListLongMap!583)

(assert (=> b!27109 (= lt!10555 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10566 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10568 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10568 (select (arr!718 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10569 () Unit!631)

(declare-fun addApplyDifferent!16 (ListLongMap!583 (_ BitVec 64) V!1349 (_ BitVec 64)) Unit!631)

(assert (=> b!27109 (= lt!10569 (addApplyDifferent!16 lt!10555 lt!10566 minValue!1443 lt!10568))))

(assert (=> b!27109 (= (apply!31 (+!49 lt!10555 (tuple2!1007 lt!10566 minValue!1443)) lt!10568) (apply!31 lt!10555 lt!10568))))

(declare-fun lt!10557 () Unit!631)

(assert (=> b!27109 (= lt!10557 lt!10569)))

(declare-fun lt!10560 () ListLongMap!583)

(assert (=> b!27109 (= lt!10560 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10556 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10563 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10563 (select (arr!718 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10565 () Unit!631)

(assert (=> b!27109 (= lt!10565 (addApplyDifferent!16 lt!10560 lt!10556 zeroValue!1443 lt!10563))))

(assert (=> b!27109 (= (apply!31 (+!49 lt!10560 (tuple2!1007 lt!10556 zeroValue!1443)) lt!10563) (apply!31 lt!10560 lt!10563))))

(declare-fun lt!10559 () Unit!631)

(assert (=> b!27109 (= lt!10559 lt!10565)))

(declare-fun lt!10564 () ListLongMap!583)

(assert (=> b!27109 (= lt!10564 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10573 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10567 () (_ BitVec 64))

(assert (=> b!27109 (= lt!10567 (select (arr!718 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!27109 (= lt!10570 (addApplyDifferent!16 lt!10564 lt!10573 minValue!1443 lt!10567))))

(assert (=> b!27109 (= (apply!31 (+!49 lt!10564 (tuple2!1007 lt!10573 minValue!1443)) lt!10567) (apply!31 lt!10564 lt!10567))))

(declare-fun bm!2547 () Bool)

(declare-fun call!2549 () ListLongMap!583)

(assert (=> bm!2547 (= call!2551 call!2549)))

(declare-fun bm!2548 () Bool)

(assert (=> bm!2548 (= call!2549 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!27110 () Bool)

(assert (=> b!27110 (= e!17668 (not call!2553))))

(declare-fun b!27111 () Bool)

(assert (=> b!27111 (= e!17673 e!17678)))

(declare-fun c!3701 () Bool)

(assert (=> b!27111 (= c!3701 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27112 () Bool)

(declare-fun e!17675 () Bool)

(assert (=> b!27112 (= e!17674 e!17675)))

(declare-fun res!16060 () Bool)

(assert (=> b!27112 (=> (not res!16060) (not e!17675))))

(assert (=> b!27112 (= res!16060 (contains!245 lt!10574 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!27112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!819 _keys!1833)))))

(declare-fun b!27113 () Bool)

(declare-fun get!436 (ValueCell!372 V!1349) V!1349)

(declare-fun dynLambda!148 (Int (_ BitVec 64)) V!1349)

(assert (=> b!27113 (= e!17675 (= (apply!31 lt!10574 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)) (get!436 (select (arr!719 _values!1501) #b00000000000000000000000000000000) (dynLambda!148 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!820 _values!1501)))))

(assert (=> b!27113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!819 _keys!1833)))))

(declare-fun bm!2549 () Bool)

(assert (=> bm!2549 (= call!2552 (contains!245 lt!10574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27114 () Bool)

(assert (=> b!27114 (= e!17667 (validKeyInArray!0 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2550 () Bool)

(assert (=> bm!2550 (= call!2553 (contains!245 lt!10574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27115 () Bool)

(declare-fun e!17670 () Bool)

(assert (=> b!27115 (= e!17670 (= (apply!31 lt!10574 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!27116 () Bool)

(assert (=> b!27116 (= e!17676 call!2555)))

(declare-fun d!4939 () Bool)

(assert (=> d!4939 e!17673))

(declare-fun res!16059 () Bool)

(assert (=> d!4939 (=> (not res!16059) (not e!17673))))

(assert (=> d!4939 (= res!16059 (or (bvsge #b00000000000000000000000000000000 (size!819 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!819 _keys!1833)))))))

(declare-fun lt!10561 () ListLongMap!583)

(assert (=> d!4939 (= lt!10574 lt!10561)))

(declare-fun lt!10571 () Unit!631)

(assert (=> d!4939 (= lt!10571 e!17669)))

(declare-fun c!3703 () Bool)

(declare-fun e!17671 () Bool)

(assert (=> d!4939 (= c!3703 e!17671)))

(declare-fun res!16057 () Bool)

(assert (=> d!4939 (=> (not res!16057) (not e!17671))))

(assert (=> d!4939 (= res!16057 (bvslt #b00000000000000000000000000000000 (size!819 _keys!1833)))))

(assert (=> d!4939 (= lt!10561 e!17677)))

(declare-fun c!3700 () Bool)

(assert (=> d!4939 (= c!3700 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4939 (validMask!0 mask!2294)))

(assert (=> d!4939 (= (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10574)))

(declare-fun b!27117 () Bool)

(assert (=> b!27117 (= e!17678 e!17670)))

(declare-fun res!16056 () Bool)

(assert (=> b!27117 (= res!16056 call!2552)))

(assert (=> b!27117 (=> (not res!16056) (not e!17670))))

(declare-fun bm!2551 () Bool)

(assert (=> bm!2551 (= call!2550 (+!49 (ite c!3700 call!2549 (ite c!3704 call!2551 call!2555)) (ite (or c!3700 c!3704) (tuple2!1007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!27118 () Bool)

(declare-fun res!16061 () Bool)

(assert (=> b!27118 (=> (not res!16061) (not e!17673))))

(assert (=> b!27118 (= res!16061 e!17668)))

(declare-fun c!3699 () Bool)

(assert (=> b!27118 (= c!3699 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!2552 () Bool)

(assert (=> bm!2552 (= call!2554 call!2550)))

(declare-fun b!27119 () Bool)

(assert (=> b!27119 (= e!17676 call!2554)))

(declare-fun b!27120 () Bool)

(declare-fun Unit!634 () Unit!631)

(assert (=> b!27120 (= e!17669 Unit!634)))

(declare-fun b!27121 () Bool)

(assert (=> b!27121 (= e!17671 (validKeyInArray!0 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4939 c!3700) b!27102))

(assert (= (and d!4939 (not c!3700)) b!27108))

(assert (= (and b!27108 c!3704) b!27101))

(assert (= (and b!27108 (not c!3704)) b!27106))

(assert (= (and b!27106 c!3702) b!27119))

(assert (= (and b!27106 (not c!3702)) b!27116))

(assert (= (or b!27119 b!27116) bm!2546))

(assert (= (or b!27101 bm!2546) bm!2547))

(assert (= (or b!27101 b!27119) bm!2552))

(assert (= (or b!27102 bm!2547) bm!2548))

(assert (= (or b!27102 bm!2552) bm!2551))

(assert (= (and d!4939 res!16057) b!27121))

(assert (= (and d!4939 c!3703) b!27109))

(assert (= (and d!4939 (not c!3703)) b!27120))

(assert (= (and d!4939 res!16059) b!27104))

(assert (= (and b!27104 res!16062) b!27114))

(assert (= (and b!27104 (not res!16054)) b!27112))

(assert (= (and b!27112 res!16060) b!27113))

(assert (= (and b!27104 res!16058) b!27118))

(assert (= (and b!27118 c!3699) b!27107))

(assert (= (and b!27118 (not c!3699)) b!27110))

(assert (= (and b!27107 res!16055) b!27105))

(assert (= (or b!27107 b!27110) bm!2550))

(assert (= (and b!27118 res!16061) b!27111))

(assert (= (and b!27111 c!3701) b!27117))

(assert (= (and b!27111 (not c!3701)) b!27103))

(assert (= (and b!27117 res!16056) b!27115))

(assert (= (or b!27117 b!27103) bm!2549))

(declare-fun b_lambda!1687 () Bool)

(assert (=> (not b_lambda!1687) (not b!27113)))

(declare-fun t!3300 () Bool)

(declare-fun tb!677 () Bool)

(assert (=> (and start!3850 (= defaultEntry!1504 defaultEntry!1504) t!3300) tb!677))

(declare-fun result!1141 () Bool)

(assert (=> tb!677 (= result!1141 tp_is_empty!1143)))

(assert (=> b!27113 t!3300))

(declare-fun b_and!1599 () Bool)

(assert (= b_and!1595 (and (=> t!3300 result!1141) b_and!1599)))

(declare-fun m!21639 () Bool)

(assert (=> b!27105 m!21639))

(declare-fun m!21641 () Bool)

(assert (=> b!27121 m!21641))

(assert (=> b!27121 m!21641))

(declare-fun m!21643 () Bool)

(assert (=> b!27121 m!21643))

(declare-fun m!21645 () Bool)

(assert (=> b!27102 m!21645))

(assert (=> b!27114 m!21641))

(assert (=> b!27114 m!21641))

(assert (=> b!27114 m!21643))

(declare-fun m!21647 () Bool)

(assert (=> b!27109 m!21647))

(declare-fun m!21649 () Bool)

(assert (=> b!27109 m!21649))

(declare-fun m!21651 () Bool)

(assert (=> b!27109 m!21651))

(declare-fun m!21653 () Bool)

(assert (=> b!27109 m!21653))

(declare-fun m!21655 () Bool)

(assert (=> b!27109 m!21655))

(declare-fun m!21657 () Bool)

(assert (=> b!27109 m!21657))

(declare-fun m!21659 () Bool)

(assert (=> b!27109 m!21659))

(declare-fun m!21661 () Bool)

(assert (=> b!27109 m!21661))

(declare-fun m!21663 () Bool)

(assert (=> b!27109 m!21663))

(assert (=> b!27109 m!21647))

(declare-fun m!21665 () Bool)

(assert (=> b!27109 m!21665))

(assert (=> b!27109 m!21649))

(declare-fun m!21667 () Bool)

(assert (=> b!27109 m!21667))

(assert (=> b!27109 m!21657))

(declare-fun m!21669 () Bool)

(assert (=> b!27109 m!21669))

(assert (=> b!27109 m!21641))

(declare-fun m!21671 () Bool)

(assert (=> b!27109 m!21671))

(declare-fun m!21673 () Bool)

(assert (=> b!27109 m!21673))

(declare-fun m!21675 () Bool)

(assert (=> b!27109 m!21675))

(declare-fun m!21677 () Bool)

(assert (=> b!27109 m!21677))

(assert (=> b!27109 m!21673))

(assert (=> bm!2548 m!21661))

(assert (=> b!27112 m!21641))

(assert (=> b!27112 m!21641))

(declare-fun m!21679 () Bool)

(assert (=> b!27112 m!21679))

(assert (=> b!27113 m!21641))

(assert (=> b!27113 m!21641))

(declare-fun m!21681 () Bool)

(assert (=> b!27113 m!21681))

(declare-fun m!21683 () Bool)

(assert (=> b!27113 m!21683))

(declare-fun m!21685 () Bool)

(assert (=> b!27113 m!21685))

(declare-fun m!21687 () Bool)

(assert (=> b!27113 m!21687))

(assert (=> b!27113 m!21685))

(assert (=> b!27113 m!21683))

(declare-fun m!21689 () Bool)

(assert (=> bm!2549 m!21689))

(declare-fun m!21691 () Bool)

(assert (=> b!27115 m!21691))

(assert (=> d!4939 m!21601))

(declare-fun m!21693 () Bool)

(assert (=> bm!2550 m!21693))

(declare-fun m!21695 () Bool)

(assert (=> bm!2551 m!21695))

(assert (=> b!27016 d!4939))

(declare-fun b!27134 () Bool)

(declare-fun e!17687 () Bool)

(declare-fun call!2558 () Bool)

(assert (=> b!27134 (= e!17687 call!2558)))

(declare-fun b!27135 () Bool)

(assert (=> b!27135 (= e!17687 call!2558)))

(declare-fun b!27136 () Bool)

(declare-fun e!17689 () Bool)

(declare-fun e!17690 () Bool)

(assert (=> b!27136 (= e!17689 e!17690)))

(declare-fun res!16071 () Bool)

(assert (=> b!27136 (=> (not res!16071) (not e!17690))))

(declare-fun e!17688 () Bool)

(assert (=> b!27136 (= res!16071 (not e!17688))))

(declare-fun res!16070 () Bool)

(assert (=> b!27136 (=> (not res!16070) (not e!17688))))

(assert (=> b!27136 (= res!16070 (validKeyInArray!0 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27137 () Bool)

(assert (=> b!27137 (= e!17690 e!17687)))

(declare-fun c!3707 () Bool)

(assert (=> b!27137 (= c!3707 (validKeyInArray!0 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27138 () Bool)

(declare-fun contains!247 (List!607 (_ BitVec 64)) Bool)

(assert (=> b!27138 (= e!17688 (contains!247 Nil!604 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4941 () Bool)

(declare-fun res!16069 () Bool)

(assert (=> d!4941 (=> res!16069 e!17689)))

(assert (=> d!4941 (= res!16069 (bvsge #b00000000000000000000000000000000 (size!819 _keys!1833)))))

(assert (=> d!4941 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!604) e!17689)))

(declare-fun bm!2555 () Bool)

(assert (=> bm!2555 (= call!2558 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3707 (Cons!603 (select (arr!718 _keys!1833) #b00000000000000000000000000000000) Nil!604) Nil!604)))))

(assert (= (and d!4941 (not res!16069)) b!27136))

(assert (= (and b!27136 res!16070) b!27138))

(assert (= (and b!27136 res!16071) b!27137))

(assert (= (and b!27137 c!3707) b!27134))

(assert (= (and b!27137 (not c!3707)) b!27135))

(assert (= (or b!27134 b!27135) bm!2555))

(assert (=> b!27136 m!21641))

(assert (=> b!27136 m!21641))

(assert (=> b!27136 m!21643))

(assert (=> b!27137 m!21641))

(assert (=> b!27137 m!21641))

(assert (=> b!27137 m!21643))

(assert (=> b!27138 m!21641))

(assert (=> b!27138 m!21641))

(declare-fun m!21697 () Bool)

(assert (=> b!27138 m!21697))

(assert (=> bm!2555 m!21641))

(declare-fun m!21699 () Bool)

(assert (=> bm!2555 m!21699))

(assert (=> b!27017 d!4941))

(declare-fun b!27147 () Bool)

(declare-fun e!17697 () Bool)

(declare-fun e!17698 () Bool)

(assert (=> b!27147 (= e!17697 e!17698)))

(declare-fun lt!10581 () (_ BitVec 64))

(assert (=> b!27147 (= lt!10581 (select (arr!718 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10582 () Unit!631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1525 (_ BitVec 64) (_ BitVec 32)) Unit!631)

(assert (=> b!27147 (= lt!10582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10581 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27147 (arrayContainsKey!0 _keys!1833 lt!10581 #b00000000000000000000000000000000)))

(declare-fun lt!10583 () Unit!631)

(assert (=> b!27147 (= lt!10583 lt!10582)))

(declare-fun res!16077 () Bool)

(declare-datatypes ((SeekEntryResult!63 0))(
  ( (MissingZero!63 (index!2374 (_ BitVec 32))) (Found!63 (index!2375 (_ BitVec 32))) (Intermediate!63 (undefined!875 Bool) (index!2376 (_ BitVec 32)) (x!6195 (_ BitVec 32))) (Undefined!63) (MissingVacant!63 (index!2377 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1525 (_ BitVec 32)) SeekEntryResult!63)

(assert (=> b!27147 (= res!16077 (= (seekEntryOrOpen!0 (select (arr!718 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!63 #b00000000000000000000000000000000)))))

(assert (=> b!27147 (=> (not res!16077) (not e!17698))))

(declare-fun b!27148 () Bool)

(declare-fun e!17699 () Bool)

(assert (=> b!27148 (= e!17699 e!17697)))

(declare-fun c!3710 () Bool)

(assert (=> b!27148 (= c!3710 (validKeyInArray!0 (select (arr!718 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27149 () Bool)

(declare-fun call!2561 () Bool)

(assert (=> b!27149 (= e!17698 call!2561)))

(declare-fun bm!2558 () Bool)

(assert (=> bm!2558 (= call!2561 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!4943 () Bool)

(declare-fun res!16076 () Bool)

(assert (=> d!4943 (=> res!16076 e!17699)))

(assert (=> d!4943 (= res!16076 (bvsge #b00000000000000000000000000000000 (size!819 _keys!1833)))))

(assert (=> d!4943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17699)))

(declare-fun b!27150 () Bool)

(assert (=> b!27150 (= e!17697 call!2561)))

(assert (= (and d!4943 (not res!16076)) b!27148))

(assert (= (and b!27148 c!3710) b!27147))

(assert (= (and b!27148 (not c!3710)) b!27150))

(assert (= (and b!27147 res!16077) b!27149))

(assert (= (or b!27149 b!27150) bm!2558))

(assert (=> b!27147 m!21641))

(declare-fun m!21701 () Bool)

(assert (=> b!27147 m!21701))

(declare-fun m!21703 () Bool)

(assert (=> b!27147 m!21703))

(assert (=> b!27147 m!21641))

(declare-fun m!21705 () Bool)

(assert (=> b!27147 m!21705))

(assert (=> b!27148 m!21641))

(assert (=> b!27148 m!21641))

(assert (=> b!27148 m!21643))

(declare-fun m!21707 () Bool)

(assert (=> bm!2558 m!21707))

(assert (=> b!27014 d!4943))

(declare-fun condMapEmpty!1243 () Bool)

(declare-fun mapDefault!1243 () ValueCell!372)

(assert (=> mapNonEmpty!1237 (= condMapEmpty!1243 (= mapRest!1237 ((as const (Array (_ BitVec 32) ValueCell!372)) mapDefault!1243)))))

(declare-fun e!17704 () Bool)

(declare-fun mapRes!1243 () Bool)

(assert (=> mapNonEmpty!1237 (= tp!3780 (and e!17704 mapRes!1243))))

(declare-fun mapIsEmpty!1243 () Bool)

(assert (=> mapIsEmpty!1243 mapRes!1243))

(declare-fun b!27158 () Bool)

(assert (=> b!27158 (= e!17704 tp_is_empty!1143)))

(declare-fun mapNonEmpty!1243 () Bool)

(declare-fun tp!3790 () Bool)

(declare-fun e!17705 () Bool)

(assert (=> mapNonEmpty!1243 (= mapRes!1243 (and tp!3790 e!17705))))

(declare-fun mapKey!1243 () (_ BitVec 32))

(declare-fun mapValue!1243 () ValueCell!372)

(declare-fun mapRest!1243 () (Array (_ BitVec 32) ValueCell!372))

(assert (=> mapNonEmpty!1243 (= mapRest!1237 (store mapRest!1243 mapKey!1243 mapValue!1243))))

(declare-fun b!27157 () Bool)

(assert (=> b!27157 (= e!17705 tp_is_empty!1143)))

(assert (= (and mapNonEmpty!1237 condMapEmpty!1243) mapIsEmpty!1243))

(assert (= (and mapNonEmpty!1237 (not condMapEmpty!1243)) mapNonEmpty!1243))

(assert (= (and mapNonEmpty!1243 ((_ is ValueCellFull!372) mapValue!1243)) b!27157))

(assert (= (and mapNonEmpty!1237 ((_ is ValueCellFull!372) mapDefault!1243)) b!27158))

(declare-fun m!21709 () Bool)

(assert (=> mapNonEmpty!1243 m!21709))

(declare-fun b_lambda!1689 () Bool)

(assert (= b_lambda!1687 (or (and start!3850 b_free!789) b_lambda!1689)))

(check-sat (not b!27105) (not bm!2548) (not d!4937) (not bm!2551) (not b!27136) (not d!4939) (not b!27058) (not b_next!789) (not b!27137) (not b!27121) (not b!27102) (not b!27147) (not bm!2555) (not b!27109) (not mapNonEmpty!1243) (not b!27112) (not b!27056) tp_is_empty!1143 (not b!27113) (not b!27148) (not b!27115) (not bm!2558) (not b_lambda!1689) (not b!27138) (not bm!2550) b_and!1599 (not bm!2549) (not b!27114))
(check-sat b_and!1599 (not b_next!789))
