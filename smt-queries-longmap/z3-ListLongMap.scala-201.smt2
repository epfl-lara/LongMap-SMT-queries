; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3860 () Bool)

(assert start!3860)

(declare-fun b_free!793 () Bool)

(declare-fun b_next!793 () Bool)

(assert (=> start!3860 (= b_free!793 (not b_next!793))))

(declare-fun tp!3795 () Bool)

(declare-fun b_and!1595 () Bool)

(assert (=> start!3860 (= tp!3795 b_and!1595)))

(declare-fun mapNonEmpty!1246 () Bool)

(declare-fun mapRes!1246 () Bool)

(declare-fun tp!3796 () Bool)

(declare-fun e!17673 () Bool)

(assert (=> mapNonEmpty!1246 (= mapRes!1246 (and tp!3796 e!17673))))

(declare-datatypes ((V!1355 0))(
  ( (V!1356 (val!600 Int)) )
))
(declare-datatypes ((ValueCell!374 0))(
  ( (ValueCellFull!374 (v!1687 V!1355)) (EmptyCell!374) )
))
(declare-fun mapValue!1246 () ValueCell!374)

(declare-datatypes ((array!1509 0))(
  ( (array!1510 (arr!709 (Array (_ BitVec 32) ValueCell!374)) (size!810 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1509)

(declare-fun mapRest!1246 () (Array (_ BitVec 32) ValueCell!374))

(declare-fun mapKey!1246 () (_ BitVec 32))

(assert (=> mapNonEmpty!1246 (= (arr!709 _values!1501) (store mapRest!1246 mapKey!1246 mapValue!1246))))

(declare-fun b!27125 () Bool)

(declare-fun e!17677 () Bool)

(declare-datatypes ((array!1511 0))(
  ( (array!1512 (arr!710 (Array (_ BitVec 32) (_ BitVec 64))) (size!811 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1511)

(assert (=> b!27125 (= e!17677 (or (bvsge #b00000000000000000000000000000000 (size!811 _keys!1833)) (bvsge (size!811 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!1246 () Bool)

(assert (=> mapIsEmpty!1246 mapRes!1246))

(declare-fun b!27126 () Bool)

(declare-fun e!17675 () Bool)

(declare-fun tp_is_empty!1147 () Bool)

(assert (=> b!27126 (= e!17675 tp_is_empty!1147)))

(declare-fun res!16066 () Bool)

(assert (=> start!3860 (=> (not res!16066) (not e!17677))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3860 (= res!16066 (validMask!0 mask!2294))))

(assert (=> start!3860 e!17677))

(assert (=> start!3860 true))

(assert (=> start!3860 tp!3795))

(declare-fun e!17674 () Bool)

(declare-fun array_inv!503 (array!1509) Bool)

(assert (=> start!3860 (and (array_inv!503 _values!1501) e!17674)))

(declare-fun array_inv!504 (array!1511) Bool)

(assert (=> start!3860 (array_inv!504 _keys!1833)))

(assert (=> start!3860 tp_is_empty!1147))

(declare-fun b!27127 () Bool)

(declare-fun res!16064 () Bool)

(assert (=> b!27127 (=> (not res!16064) (not e!17677))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27127 (= res!16064 (validKeyInArray!0 k0!1304))))

(declare-fun b!27128 () Bool)

(declare-fun res!16060 () Bool)

(assert (=> b!27128 (=> (not res!16060) (not e!17677))))

(declare-fun arrayContainsKey!0 (array!1511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27128 (= res!16060 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27129 () Bool)

(declare-fun res!16063 () Bool)

(assert (=> b!27129 (=> (not res!16063) (not e!17677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1511 (_ BitVec 32)) Bool)

(assert (=> b!27129 (= res!16063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27130 () Bool)

(declare-fun res!16062 () Bool)

(assert (=> b!27130 (=> (not res!16062) (not e!17677))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27130 (= res!16062 (and (= (size!810 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!811 _keys!1833) (size!810 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27131 () Bool)

(assert (=> b!27131 (= e!17674 (and e!17675 mapRes!1246))))

(declare-fun condMapEmpty!1246 () Bool)

(declare-fun mapDefault!1246 () ValueCell!374)

(assert (=> b!27131 (= condMapEmpty!1246 (= (arr!709 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!374)) mapDefault!1246)))))

(declare-fun b!27132 () Bool)

(declare-fun res!16065 () Bool)

(assert (=> b!27132 (=> (not res!16065) (not e!17677))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1355)

(declare-fun minValue!1443 () V!1355)

(declare-datatypes ((tuple2!1018 0))(
  ( (tuple2!1019 (_1!520 (_ BitVec 64)) (_2!520 V!1355)) )
))
(declare-datatypes ((List!604 0))(
  ( (Nil!601) (Cons!600 (h!1167 tuple2!1018) (t!3288 List!604)) )
))
(declare-datatypes ((ListLongMap!583 0))(
  ( (ListLongMap!584 (toList!307 List!604)) )
))
(declare-fun contains!247 (ListLongMap!583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!137 (array!1511 array!1509 (_ BitVec 32) (_ BitVec 32) V!1355 V!1355 (_ BitVec 32) Int) ListLongMap!583)

(assert (=> b!27132 (= res!16065 (not (contains!247 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27133 () Bool)

(declare-fun res!16061 () Bool)

(assert (=> b!27133 (=> (not res!16061) (not e!17677))))

(declare-datatypes ((List!605 0))(
  ( (Nil!602) (Cons!601 (h!1168 (_ BitVec 64)) (t!3289 List!605)) )
))
(declare-fun arrayNoDuplicates!0 (array!1511 (_ BitVec 32) List!605) Bool)

(assert (=> b!27133 (= res!16061 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!602))))

(declare-fun b!27134 () Bool)

(assert (=> b!27134 (= e!17673 tp_is_empty!1147)))

(assert (= (and start!3860 res!16066) b!27130))

(assert (= (and b!27130 res!16062) b!27129))

(assert (= (and b!27129 res!16063) b!27133))

(assert (= (and b!27133 res!16061) b!27127))

(assert (= (and b!27127 res!16064) b!27132))

(assert (= (and b!27132 res!16065) b!27128))

(assert (= (and b!27128 res!16060) b!27125))

(assert (= (and b!27131 condMapEmpty!1246) mapIsEmpty!1246))

(assert (= (and b!27131 (not condMapEmpty!1246)) mapNonEmpty!1246))

(get-info :version)

(assert (= (and mapNonEmpty!1246 ((_ is ValueCellFull!374) mapValue!1246)) b!27134))

(assert (= (and b!27131 ((_ is ValueCellFull!374) mapDefault!1246)) b!27126))

(assert (= start!3860 b!27131))

(declare-fun m!21641 () Bool)

(assert (=> b!27132 m!21641))

(assert (=> b!27132 m!21641))

(declare-fun m!21643 () Bool)

(assert (=> b!27132 m!21643))

(declare-fun m!21645 () Bool)

(assert (=> b!27133 m!21645))

(declare-fun m!21647 () Bool)

(assert (=> b!27128 m!21647))

(declare-fun m!21649 () Bool)

(assert (=> start!3860 m!21649))

(declare-fun m!21651 () Bool)

(assert (=> start!3860 m!21651))

(declare-fun m!21653 () Bool)

(assert (=> start!3860 m!21653))

(declare-fun m!21655 () Bool)

(assert (=> b!27129 m!21655))

(declare-fun m!21657 () Bool)

(assert (=> mapNonEmpty!1246 m!21657))

(declare-fun m!21659 () Bool)

(assert (=> b!27127 m!21659))

(check-sat (not b!27132) (not b!27127) (not mapNonEmpty!1246) b_and!1595 (not b!27129) tp_is_empty!1147 (not b!27128) (not start!3860) (not b_next!793) (not b!27133))
(check-sat b_and!1595 (not b_next!793))
(get-model)

(declare-fun b!27203 () Bool)

(declare-fun e!17716 () Bool)

(declare-fun e!17714 () Bool)

(assert (=> b!27203 (= e!17716 e!17714)))

(declare-fun c!3702 () Bool)

(assert (=> b!27203 (= c!3702 (validKeyInArray!0 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27204 () Bool)

(declare-fun call!2564 () Bool)

(assert (=> b!27204 (= e!17714 call!2564)))

(declare-fun d!4909 () Bool)

(declare-fun res!16113 () Bool)

(assert (=> d!4909 (=> res!16113 e!17716)))

(assert (=> d!4909 (= res!16113 (bvsge #b00000000000000000000000000000000 (size!811 _keys!1833)))))

(assert (=> d!4909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17716)))

(declare-fun b!27205 () Bool)

(declare-fun e!17715 () Bool)

(assert (=> b!27205 (= e!17715 call!2564)))

(declare-fun bm!2561 () Bool)

(assert (=> bm!2561 (= call!2564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!27206 () Bool)

(assert (=> b!27206 (= e!17714 e!17715)))

(declare-fun lt!10586 () (_ BitVec 64))

(assert (=> b!27206 (= lt!10586 (select (arr!710 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!642 0))(
  ( (Unit!643) )
))
(declare-fun lt!10588 () Unit!642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1511 (_ BitVec 64) (_ BitVec 32)) Unit!642)

(assert (=> b!27206 (= lt!10588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10586 #b00000000000000000000000000000000))))

(assert (=> b!27206 (arrayContainsKey!0 _keys!1833 lt!10586 #b00000000000000000000000000000000)))

(declare-fun lt!10587 () Unit!642)

(assert (=> b!27206 (= lt!10587 lt!10588)))

(declare-fun res!16114 () Bool)

(declare-datatypes ((SeekEntryResult!65 0))(
  ( (MissingZero!65 (index!2382 (_ BitVec 32))) (Found!65 (index!2383 (_ BitVec 32))) (Intermediate!65 (undefined!877 Bool) (index!2384 (_ BitVec 32)) (x!6215 (_ BitVec 32))) (Undefined!65) (MissingVacant!65 (index!2385 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1511 (_ BitVec 32)) SeekEntryResult!65)

(assert (=> b!27206 (= res!16114 (= (seekEntryOrOpen!0 (select (arr!710 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!65 #b00000000000000000000000000000000)))))

(assert (=> b!27206 (=> (not res!16114) (not e!17715))))

(assert (= (and d!4909 (not res!16113)) b!27203))

(assert (= (and b!27203 c!3702) b!27206))

(assert (= (and b!27203 (not c!3702)) b!27204))

(assert (= (and b!27206 res!16114) b!27205))

(assert (= (or b!27205 b!27204) bm!2561))

(declare-fun m!21701 () Bool)

(assert (=> b!27203 m!21701))

(assert (=> b!27203 m!21701))

(declare-fun m!21703 () Bool)

(assert (=> b!27203 m!21703))

(declare-fun m!21705 () Bool)

(assert (=> bm!2561 m!21705))

(assert (=> b!27206 m!21701))

(declare-fun m!21707 () Bool)

(assert (=> b!27206 m!21707))

(declare-fun m!21709 () Bool)

(assert (=> b!27206 m!21709))

(assert (=> b!27206 m!21701))

(declare-fun m!21711 () Bool)

(assert (=> b!27206 m!21711))

(assert (=> b!27129 d!4909))

(declare-fun d!4911 () Bool)

(declare-fun e!17722 () Bool)

(assert (=> d!4911 e!17722))

(declare-fun res!16117 () Bool)

(assert (=> d!4911 (=> res!16117 e!17722)))

(declare-fun lt!10600 () Bool)

(assert (=> d!4911 (= res!16117 (not lt!10600))))

(declare-fun lt!10599 () Bool)

(assert (=> d!4911 (= lt!10600 lt!10599)))

(declare-fun lt!10598 () Unit!642)

(declare-fun e!17721 () Unit!642)

(assert (=> d!4911 (= lt!10598 e!17721)))

(declare-fun c!3705 () Bool)

(assert (=> d!4911 (= c!3705 lt!10599)))

(declare-fun containsKey!27 (List!604 (_ BitVec 64)) Bool)

(assert (=> d!4911 (= lt!10599 (containsKey!27 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4911 (= (contains!247 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10600)))

(declare-fun b!27213 () Bool)

(declare-fun lt!10597 () Unit!642)

(assert (=> b!27213 (= e!17721 lt!10597)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!24 (List!604 (_ BitVec 64)) Unit!642)

(assert (=> b!27213 (= lt!10597 (lemmaContainsKeyImpliesGetValueByKeyDefined!24 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!69 0))(
  ( (Some!68 (v!1690 V!1355)) (None!67) )
))
(declare-fun isDefined!25 (Option!69) Bool)

(declare-fun getValueByKey!63 (List!604 (_ BitVec 64)) Option!69)

(assert (=> b!27213 (isDefined!25 (getValueByKey!63 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!27214 () Bool)

(declare-fun Unit!644 () Unit!642)

(assert (=> b!27214 (= e!17721 Unit!644)))

(declare-fun b!27215 () Bool)

(assert (=> b!27215 (= e!17722 (isDefined!25 (getValueByKey!63 (toList!307 (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4911 c!3705) b!27213))

(assert (= (and d!4911 (not c!3705)) b!27214))

(assert (= (and d!4911 (not res!16117)) b!27215))

(declare-fun m!21713 () Bool)

(assert (=> d!4911 m!21713))

(declare-fun m!21715 () Bool)

(assert (=> b!27213 m!21715))

(declare-fun m!21717 () Bool)

(assert (=> b!27213 m!21717))

(assert (=> b!27213 m!21717))

(declare-fun m!21719 () Bool)

(assert (=> b!27213 m!21719))

(assert (=> b!27215 m!21717))

(assert (=> b!27215 m!21717))

(assert (=> b!27215 m!21719))

(assert (=> b!27132 d!4911))

(declare-fun b!27258 () Bool)

(declare-fun e!17755 () Bool)

(declare-fun call!2582 () Bool)

(assert (=> b!27258 (= e!17755 (not call!2582))))

(declare-fun bm!2576 () Bool)

(declare-fun call!2579 () ListLongMap!583)

(declare-fun getCurrentListMapNoExtraKeys!19 (array!1511 array!1509 (_ BitVec 32) (_ BitVec 32) V!1355 V!1355 (_ BitVec 32) Int) ListLongMap!583)

(assert (=> bm!2576 (= call!2579 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun bm!2577 () Bool)

(declare-fun call!2585 () ListLongMap!583)

(declare-fun call!2583 () ListLongMap!583)

(assert (=> bm!2577 (= call!2585 call!2583)))

(declare-fun bm!2578 () Bool)

(declare-fun call!2581 () Bool)

(declare-fun lt!10655 () ListLongMap!583)

(assert (=> bm!2578 (= call!2581 (contains!247 lt!10655 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!4913 () Bool)

(declare-fun e!17757 () Bool)

(assert (=> d!4913 e!17757))

(declare-fun res!16138 () Bool)

(assert (=> d!4913 (=> (not res!16138) (not e!17757))))

(assert (=> d!4913 (= res!16138 (or (bvsge #b00000000000000000000000000000000 (size!811 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!811 _keys!1833)))))))

(declare-fun lt!10663 () ListLongMap!583)

(assert (=> d!4913 (= lt!10655 lt!10663)))

(declare-fun lt!10661 () Unit!642)

(declare-fun e!17759 () Unit!642)

(assert (=> d!4913 (= lt!10661 e!17759)))

(declare-fun c!3721 () Bool)

(declare-fun e!17752 () Bool)

(assert (=> d!4913 (= c!3721 e!17752)))

(declare-fun res!16141 () Bool)

(assert (=> d!4913 (=> (not res!16141) (not e!17752))))

(assert (=> d!4913 (= res!16141 (bvslt #b00000000000000000000000000000000 (size!811 _keys!1833)))))

(declare-fun e!17760 () ListLongMap!583)

(assert (=> d!4913 (= lt!10663 e!17760)))

(declare-fun c!3723 () Bool)

(assert (=> d!4913 (= c!3723 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4913 (validMask!0 mask!2294)))

(assert (=> d!4913 (= (getCurrentListMap!137 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10655)))

(declare-fun bm!2579 () Bool)

(declare-fun call!2584 () ListLongMap!583)

(declare-fun call!2580 () ListLongMap!583)

(assert (=> bm!2579 (= call!2584 call!2580)))

(declare-fun b!27259 () Bool)

(declare-fun e!17749 () Bool)

(declare-fun e!17761 () Bool)

(assert (=> b!27259 (= e!17749 e!17761)))

(declare-fun res!16139 () Bool)

(assert (=> b!27259 (= res!16139 call!2581)))

(assert (=> b!27259 (=> (not res!16139) (not e!17761))))

(declare-fun b!27260 () Bool)

(declare-fun res!16144 () Bool)

(assert (=> b!27260 (=> (not res!16144) (not e!17757))))

(declare-fun e!17756 () Bool)

(assert (=> b!27260 (= res!16144 e!17756)))

(declare-fun res!16142 () Bool)

(assert (=> b!27260 (=> res!16142 e!17756)))

(declare-fun e!17753 () Bool)

(assert (=> b!27260 (= res!16142 (not e!17753))))

(declare-fun res!16136 () Bool)

(assert (=> b!27260 (=> (not res!16136) (not e!17753))))

(assert (=> b!27260 (= res!16136 (bvslt #b00000000000000000000000000000000 (size!811 _keys!1833)))))

(declare-fun b!27261 () Bool)

(declare-fun lt!10651 () Unit!642)

(assert (=> b!27261 (= e!17759 lt!10651)))

(declare-fun lt!10650 () ListLongMap!583)

(assert (=> b!27261 (= lt!10650 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10659 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10648 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10648 (select (arr!710 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10646 () Unit!642)

(declare-fun addStillContains!17 (ListLongMap!583 (_ BitVec 64) V!1355 (_ BitVec 64)) Unit!642)

(assert (=> b!27261 (= lt!10646 (addStillContains!17 lt!10650 lt!10659 zeroValue!1443 lt!10648))))

(declare-fun +!50 (ListLongMap!583 tuple2!1018) ListLongMap!583)

(assert (=> b!27261 (contains!247 (+!50 lt!10650 (tuple2!1019 lt!10659 zeroValue!1443)) lt!10648)))

(declare-fun lt!10656 () Unit!642)

(assert (=> b!27261 (= lt!10656 lt!10646)))

(declare-fun lt!10658 () ListLongMap!583)

(assert (=> b!27261 (= lt!10658 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10645 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10645 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10652 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10652 (select (arr!710 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10664 () Unit!642)

(declare-fun addApplyDifferent!17 (ListLongMap!583 (_ BitVec 64) V!1355 (_ BitVec 64)) Unit!642)

(assert (=> b!27261 (= lt!10664 (addApplyDifferent!17 lt!10658 lt!10645 minValue!1443 lt!10652))))

(declare-fun apply!32 (ListLongMap!583 (_ BitVec 64)) V!1355)

(assert (=> b!27261 (= (apply!32 (+!50 lt!10658 (tuple2!1019 lt!10645 minValue!1443)) lt!10652) (apply!32 lt!10658 lt!10652))))

(declare-fun lt!10657 () Unit!642)

(assert (=> b!27261 (= lt!10657 lt!10664)))

(declare-fun lt!10654 () ListLongMap!583)

(assert (=> b!27261 (= lt!10654 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10666 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10662 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10662 (select (arr!710 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10660 () Unit!642)

(assert (=> b!27261 (= lt!10660 (addApplyDifferent!17 lt!10654 lt!10666 zeroValue!1443 lt!10662))))

(assert (=> b!27261 (= (apply!32 (+!50 lt!10654 (tuple2!1019 lt!10666 zeroValue!1443)) lt!10662) (apply!32 lt!10654 lt!10662))))

(declare-fun lt!10665 () Unit!642)

(assert (=> b!27261 (= lt!10665 lt!10660)))

(declare-fun lt!10653 () ListLongMap!583)

(assert (=> b!27261 (= lt!10653 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10647 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10647 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10649 () (_ BitVec 64))

(assert (=> b!27261 (= lt!10649 (select (arr!710 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!27261 (= lt!10651 (addApplyDifferent!17 lt!10653 lt!10647 minValue!1443 lt!10649))))

(assert (=> b!27261 (= (apply!32 (+!50 lt!10653 (tuple2!1019 lt!10647 minValue!1443)) lt!10649) (apply!32 lt!10653 lt!10649))))

(declare-fun b!27262 () Bool)

(assert (=> b!27262 (= e!17753 (validKeyInArray!0 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27263 () Bool)

(declare-fun c!3720 () Bool)

(assert (=> b!27263 (= c!3720 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!17751 () ListLongMap!583)

(declare-fun e!17758 () ListLongMap!583)

(assert (=> b!27263 (= e!17751 e!17758)))

(declare-fun bm!2580 () Bool)

(assert (=> bm!2580 (= call!2582 (contains!247 lt!10655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27264 () Bool)

(declare-fun e!17750 () Bool)

(assert (=> b!27264 (= e!17755 e!17750)))

(declare-fun res!16137 () Bool)

(assert (=> b!27264 (= res!16137 call!2582)))

(assert (=> b!27264 (=> (not res!16137) (not e!17750))))

(declare-fun b!27265 () Bool)

(assert (=> b!27265 (= e!17761 (= (apply!32 lt!10655 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!27266 () Bool)

(assert (=> b!27266 (= e!17751 call!2585)))

(declare-fun b!27267 () Bool)

(declare-fun res!16140 () Bool)

(assert (=> b!27267 (=> (not res!16140) (not e!17757))))

(assert (=> b!27267 (= res!16140 e!17755)))

(declare-fun c!3718 () Bool)

(assert (=> b!27267 (= c!3718 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!27268 () Bool)

(assert (=> b!27268 (= e!17758 call!2584)))

(declare-fun b!27269 () Bool)

(assert (=> b!27269 (= e!17750 (= (apply!32 lt!10655 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!27270 () Bool)

(assert (=> b!27270 (= e!17752 (validKeyInArray!0 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27271 () Bool)

(assert (=> b!27271 (= e!17749 (not call!2581))))

(declare-fun b!27272 () Bool)

(assert (=> b!27272 (= e!17757 e!17749)))

(declare-fun c!3719 () Bool)

(assert (=> b!27272 (= c!3719 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27273 () Bool)

(declare-fun e!17754 () Bool)

(assert (=> b!27273 (= e!17756 e!17754)))

(declare-fun res!16143 () Bool)

(assert (=> b!27273 (=> (not res!16143) (not e!17754))))

(assert (=> b!27273 (= res!16143 (contains!247 lt!10655 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!27273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!811 _keys!1833)))))

(declare-fun c!3722 () Bool)

(declare-fun bm!2581 () Bool)

(assert (=> bm!2581 (= call!2583 (+!50 (ite c!3723 call!2579 (ite c!3722 call!2580 call!2584)) (ite (or c!3723 c!3722) (tuple2!1019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!27274 () Bool)

(assert (=> b!27274 (= e!17758 call!2585)))

(declare-fun b!27275 () Bool)

(declare-fun get!439 (ValueCell!374 V!1355) V!1355)

(declare-fun dynLambda!148 (Int (_ BitVec 64)) V!1355)

(assert (=> b!27275 (= e!17754 (= (apply!32 lt!10655 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)) (get!439 (select (arr!709 _values!1501) #b00000000000000000000000000000000) (dynLambda!148 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!810 _values!1501)))))

(assert (=> b!27275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!811 _keys!1833)))))

(declare-fun b!27276 () Bool)

(assert (=> b!27276 (= e!17760 (+!50 call!2583 (tuple2!1019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun bm!2582 () Bool)

(assert (=> bm!2582 (= call!2580 call!2579)))

(declare-fun b!27277 () Bool)

(assert (=> b!27277 (= e!17760 e!17751)))

(assert (=> b!27277 (= c!3722 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27278 () Bool)

(declare-fun Unit!645 () Unit!642)

(assert (=> b!27278 (= e!17759 Unit!645)))

(assert (= (and d!4913 c!3723) b!27276))

(assert (= (and d!4913 (not c!3723)) b!27277))

(assert (= (and b!27277 c!3722) b!27266))

(assert (= (and b!27277 (not c!3722)) b!27263))

(assert (= (and b!27263 c!3720) b!27274))

(assert (= (and b!27263 (not c!3720)) b!27268))

(assert (= (or b!27274 b!27268) bm!2579))

(assert (= (or b!27266 bm!2579) bm!2582))

(assert (= (or b!27266 b!27274) bm!2577))

(assert (= (or b!27276 bm!2582) bm!2576))

(assert (= (or b!27276 bm!2577) bm!2581))

(assert (= (and d!4913 res!16141) b!27270))

(assert (= (and d!4913 c!3721) b!27261))

(assert (= (and d!4913 (not c!3721)) b!27278))

(assert (= (and d!4913 res!16138) b!27260))

(assert (= (and b!27260 res!16136) b!27262))

(assert (= (and b!27260 (not res!16142)) b!27273))

(assert (= (and b!27273 res!16143) b!27275))

(assert (= (and b!27260 res!16144) b!27267))

(assert (= (and b!27267 c!3718) b!27264))

(assert (= (and b!27267 (not c!3718)) b!27258))

(assert (= (and b!27264 res!16137) b!27269))

(assert (= (or b!27264 b!27258) bm!2580))

(assert (= (and b!27267 res!16140) b!27272))

(assert (= (and b!27272 c!3719) b!27259))

(assert (= (and b!27272 (not c!3719)) b!27271))

(assert (= (and b!27259 res!16139) b!27265))

(assert (= (or b!27259 b!27271) bm!2578))

(declare-fun b_lambda!1679 () Bool)

(assert (=> (not b_lambda!1679) (not b!27275)))

(declare-fun t!3293 () Bool)

(declare-fun tb!673 () Bool)

(assert (=> (and start!3860 (= defaultEntry!1504 defaultEntry!1504) t!3293) tb!673))

(declare-fun result!1141 () Bool)

(assert (=> tb!673 (= result!1141 tp_is_empty!1147)))

(assert (=> b!27275 t!3293))

(declare-fun b_and!1601 () Bool)

(assert (= b_and!1595 (and (=> t!3293 result!1141) b_and!1601)))

(declare-fun m!21721 () Bool)

(assert (=> b!27269 m!21721))

(declare-fun m!21723 () Bool)

(assert (=> bm!2580 m!21723))

(declare-fun m!21725 () Bool)

(assert (=> b!27265 m!21725))

(declare-fun m!21727 () Bool)

(assert (=> bm!2578 m!21727))

(declare-fun m!21729 () Bool)

(assert (=> b!27261 m!21729))

(assert (=> b!27261 m!21729))

(declare-fun m!21731 () Bool)

(assert (=> b!27261 m!21731))

(declare-fun m!21733 () Bool)

(assert (=> b!27261 m!21733))

(declare-fun m!21735 () Bool)

(assert (=> b!27261 m!21735))

(declare-fun m!21737 () Bool)

(assert (=> b!27261 m!21737))

(declare-fun m!21739 () Bool)

(assert (=> b!27261 m!21739))

(assert (=> b!27261 m!21737))

(declare-fun m!21741 () Bool)

(assert (=> b!27261 m!21741))

(declare-fun m!21743 () Bool)

(assert (=> b!27261 m!21743))

(declare-fun m!21745 () Bool)

(assert (=> b!27261 m!21745))

(assert (=> b!27261 m!21743))

(declare-fun m!21747 () Bool)

(assert (=> b!27261 m!21747))

(assert (=> b!27261 m!21701))

(declare-fun m!21749 () Bool)

(assert (=> b!27261 m!21749))

(declare-fun m!21751 () Bool)

(assert (=> b!27261 m!21751))

(declare-fun m!21753 () Bool)

(assert (=> b!27261 m!21753))

(declare-fun m!21755 () Bool)

(assert (=> b!27261 m!21755))

(declare-fun m!21757 () Bool)

(assert (=> b!27261 m!21757))

(declare-fun m!21759 () Bool)

(assert (=> b!27261 m!21759))

(assert (=> b!27261 m!21753))

(assert (=> b!27262 m!21701))

(assert (=> b!27262 m!21701))

(assert (=> b!27262 m!21703))

(assert (=> bm!2576 m!21749))

(assert (=> d!4913 m!21649))

(declare-fun m!21761 () Bool)

(assert (=> b!27275 m!21761))

(assert (=> b!27275 m!21761))

(declare-fun m!21763 () Bool)

(assert (=> b!27275 m!21763))

(declare-fun m!21765 () Bool)

(assert (=> b!27275 m!21765))

(assert (=> b!27275 m!21701))

(declare-fun m!21767 () Bool)

(assert (=> b!27275 m!21767))

(assert (=> b!27275 m!21701))

(assert (=> b!27275 m!21763))

(assert (=> b!27270 m!21701))

(assert (=> b!27270 m!21701))

(assert (=> b!27270 m!21703))

(declare-fun m!21769 () Bool)

(assert (=> b!27276 m!21769))

(assert (=> b!27273 m!21701))

(assert (=> b!27273 m!21701))

(declare-fun m!21771 () Bool)

(assert (=> b!27273 m!21771))

(declare-fun m!21773 () Bool)

(assert (=> bm!2581 m!21773))

(assert (=> b!27132 d!4913))

(declare-fun d!4915 () Bool)

(assert (=> d!4915 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3860 d!4915))

(declare-fun d!4917 () Bool)

(assert (=> d!4917 (= (array_inv!503 _values!1501) (bvsge (size!810 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3860 d!4917))

(declare-fun d!4919 () Bool)

(assert (=> d!4919 (= (array_inv!504 _keys!1833) (bvsge (size!811 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3860 d!4919))

(declare-fun d!4921 () Bool)

(assert (=> d!4921 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27127 d!4921))

(declare-fun d!4923 () Bool)

(declare-fun res!16149 () Bool)

(declare-fun e!17766 () Bool)

(assert (=> d!4923 (=> res!16149 e!17766)))

(assert (=> d!4923 (= res!16149 (= (select (arr!710 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!4923 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!17766)))

(declare-fun b!27285 () Bool)

(declare-fun e!17767 () Bool)

(assert (=> b!27285 (= e!17766 e!17767)))

(declare-fun res!16150 () Bool)

(assert (=> b!27285 (=> (not res!16150) (not e!17767))))

(assert (=> b!27285 (= res!16150 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!811 _keys!1833)))))

(declare-fun b!27286 () Bool)

(assert (=> b!27286 (= e!17767 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!4923 (not res!16149)) b!27285))

(assert (= (and b!27285 res!16150) b!27286))

(assert (=> d!4923 m!21701))

(declare-fun m!21775 () Bool)

(assert (=> b!27286 m!21775))

(assert (=> b!27128 d!4923))

(declare-fun b!27297 () Bool)

(declare-fun e!17777 () Bool)

(declare-fun call!2588 () Bool)

(assert (=> b!27297 (= e!17777 call!2588)))

(declare-fun bm!2585 () Bool)

(declare-fun c!3726 () Bool)

(assert (=> bm!2585 (= call!2588 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3726 (Cons!601 (select (arr!710 _keys!1833) #b00000000000000000000000000000000) Nil!602) Nil!602)))))

(declare-fun b!27298 () Bool)

(assert (=> b!27298 (= e!17777 call!2588)))

(declare-fun d!4925 () Bool)

(declare-fun res!16158 () Bool)

(declare-fun e!17776 () Bool)

(assert (=> d!4925 (=> res!16158 e!17776)))

(assert (=> d!4925 (= res!16158 (bvsge #b00000000000000000000000000000000 (size!811 _keys!1833)))))

(assert (=> d!4925 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!602) e!17776)))

(declare-fun b!27299 () Bool)

(declare-fun e!17779 () Bool)

(declare-fun contains!249 (List!605 (_ BitVec 64)) Bool)

(assert (=> b!27299 (= e!17779 (contains!249 Nil!602 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27300 () Bool)

(declare-fun e!17778 () Bool)

(assert (=> b!27300 (= e!17776 e!17778)))

(declare-fun res!16159 () Bool)

(assert (=> b!27300 (=> (not res!16159) (not e!17778))))

(assert (=> b!27300 (= res!16159 (not e!17779))))

(declare-fun res!16157 () Bool)

(assert (=> b!27300 (=> (not res!16157) (not e!17779))))

(assert (=> b!27300 (= res!16157 (validKeyInArray!0 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27301 () Bool)

(assert (=> b!27301 (= e!17778 e!17777)))

(assert (=> b!27301 (= c!3726 (validKeyInArray!0 (select (arr!710 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4925 (not res!16158)) b!27300))

(assert (= (and b!27300 res!16157) b!27299))

(assert (= (and b!27300 res!16159) b!27301))

(assert (= (and b!27301 c!3726) b!27298))

(assert (= (and b!27301 (not c!3726)) b!27297))

(assert (= (or b!27298 b!27297) bm!2585))

(assert (=> bm!2585 m!21701))

(declare-fun m!21777 () Bool)

(assert (=> bm!2585 m!21777))

(assert (=> b!27299 m!21701))

(assert (=> b!27299 m!21701))

(declare-fun m!21779 () Bool)

(assert (=> b!27299 m!21779))

(assert (=> b!27300 m!21701))

(assert (=> b!27300 m!21701))

(assert (=> b!27300 m!21703))

(assert (=> b!27301 m!21701))

(assert (=> b!27301 m!21701))

(assert (=> b!27301 m!21703))

(assert (=> b!27133 d!4925))

(declare-fun condMapEmpty!1255 () Bool)

(declare-fun mapDefault!1255 () ValueCell!374)

(assert (=> mapNonEmpty!1246 (= condMapEmpty!1255 (= mapRest!1246 ((as const (Array (_ BitVec 32) ValueCell!374)) mapDefault!1255)))))

(declare-fun e!17785 () Bool)

(declare-fun mapRes!1255 () Bool)

(assert (=> mapNonEmpty!1246 (= tp!3796 (and e!17785 mapRes!1255))))

(declare-fun mapNonEmpty!1255 () Bool)

(declare-fun tp!3811 () Bool)

(declare-fun e!17784 () Bool)

(assert (=> mapNonEmpty!1255 (= mapRes!1255 (and tp!3811 e!17784))))

(declare-fun mapKey!1255 () (_ BitVec 32))

(declare-fun mapRest!1255 () (Array (_ BitVec 32) ValueCell!374))

(declare-fun mapValue!1255 () ValueCell!374)

(assert (=> mapNonEmpty!1255 (= mapRest!1246 (store mapRest!1255 mapKey!1255 mapValue!1255))))

(declare-fun b!27308 () Bool)

(assert (=> b!27308 (= e!17784 tp_is_empty!1147)))

(declare-fun b!27309 () Bool)

(assert (=> b!27309 (= e!17785 tp_is_empty!1147)))

(declare-fun mapIsEmpty!1255 () Bool)

(assert (=> mapIsEmpty!1255 mapRes!1255))

(assert (= (and mapNonEmpty!1246 condMapEmpty!1255) mapIsEmpty!1255))

(assert (= (and mapNonEmpty!1246 (not condMapEmpty!1255)) mapNonEmpty!1255))

(assert (= (and mapNonEmpty!1255 ((_ is ValueCellFull!374) mapValue!1255)) b!27308))

(assert (= (and mapNonEmpty!1246 ((_ is ValueCellFull!374) mapDefault!1255)) b!27309))

(declare-fun m!21781 () Bool)

(assert (=> mapNonEmpty!1255 m!21781))

(declare-fun b_lambda!1681 () Bool)

(assert (= b_lambda!1679 (or (and start!3860 b_free!793) b_lambda!1681)))

(check-sat b_and!1601 (not b!27276) (not bm!2585) (not b!27269) (not b!27265) (not b!27203) (not b!27215) (not bm!2561) (not b!27262) (not b!27286) (not bm!2578) (not b!27299) (not mapNonEmpty!1255) (not b_lambda!1681) (not b_next!793) (not b!27261) (not b!27206) (not bm!2581) (not b!27300) (not bm!2576) (not bm!2580) (not d!4913) (not d!4911) (not b!27270) (not b!27273) (not b!27301) tp_is_empty!1147 (not b!27213) (not b!27275))
(check-sat b_and!1601 (not b_next!793))
