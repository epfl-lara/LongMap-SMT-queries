; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3866 () Bool)

(assert start!3866)

(declare-fun b_free!793 () Bool)

(declare-fun b_next!793 () Bool)

(assert (=> start!3866 (= b_free!793 (not b_next!793))))

(declare-fun tp!3796 () Bool)

(declare-fun b_and!1591 () Bool)

(assert (=> start!3866 (= tp!3796 b_and!1591)))

(declare-fun mapIsEmpty!1246 () Bool)

(declare-fun mapRes!1246 () Bool)

(assert (=> mapIsEmpty!1246 mapRes!1246))

(declare-fun b!27107 () Bool)

(declare-fun e!17666 () Bool)

(declare-fun e!17667 () Bool)

(assert (=> b!27107 (= e!17666 (and e!17667 mapRes!1246))))

(declare-fun condMapEmpty!1246 () Bool)

(declare-datatypes ((V!1355 0))(
  ( (V!1356 (val!600 Int)) )
))
(declare-datatypes ((ValueCell!374 0))(
  ( (ValueCellFull!374 (v!1688 V!1355)) (EmptyCell!374) )
))
(declare-datatypes ((array!1517 0))(
  ( (array!1518 (arr!713 (Array (_ BitVec 32) ValueCell!374)) (size!814 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1517)

(declare-fun mapDefault!1246 () ValueCell!374)

(assert (=> b!27107 (= condMapEmpty!1246 (= (arr!713 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!374)) mapDefault!1246)))))

(declare-fun b!27109 () Bool)

(declare-fun e!17664 () Bool)

(declare-fun tp_is_empty!1147 () Bool)

(assert (=> b!27109 (= e!17664 tp_is_empty!1147)))

(declare-fun b!27110 () Bool)

(declare-fun res!16054 () Bool)

(declare-fun e!17668 () Bool)

(assert (=> b!27110 (=> (not res!16054) (not e!17668))))

(declare-datatypes ((array!1519 0))(
  ( (array!1520 (arr!714 (Array (_ BitVec 32) (_ BitVec 64))) (size!815 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1519)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27110 (= res!16054 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27111 () Bool)

(assert (=> b!27111 (= e!17667 tp_is_empty!1147)))

(declare-fun b!27112 () Bool)

(declare-fun res!16057 () Bool)

(assert (=> b!27112 (=> (not res!16057) (not e!17668))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27112 (= res!16057 (and (= (size!814 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!815 _keys!1833) (size!814 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27113 () Bool)

(declare-fun res!16056 () Bool)

(assert (=> b!27113 (=> (not res!16056) (not e!17668))))

(declare-datatypes ((List!602 0))(
  ( (Nil!599) (Cons!598 (h!1165 (_ BitVec 64)) (t!3287 List!602)) )
))
(declare-fun arrayNoDuplicates!0 (array!1519 (_ BitVec 32) List!602) Bool)

(assert (=> b!27113 (= res!16056 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!599))))

(declare-fun b!27114 () Bool)

(declare-fun res!16055 () Bool)

(assert (=> b!27114 (=> (not res!16055) (not e!17668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27114 (= res!16055 (validKeyInArray!0 k0!1304))))

(declare-fun b!27115 () Bool)

(declare-fun res!16053 () Bool)

(assert (=> b!27115 (=> (not res!16053) (not e!17668))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1355)

(declare-fun minValue!1443 () V!1355)

(declare-datatypes ((tuple2!1010 0))(
  ( (tuple2!1011 (_1!516 (_ BitVec 64)) (_2!516 V!1355)) )
))
(declare-datatypes ((List!603 0))(
  ( (Nil!600) (Cons!599 (h!1166 tuple2!1010) (t!3288 List!603)) )
))
(declare-datatypes ((ListLongMap!581 0))(
  ( (ListLongMap!582 (toList!306 List!603)) )
))
(declare-fun contains!247 (ListLongMap!581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!136 (array!1519 array!1517 (_ BitVec 32) (_ BitVec 32) V!1355 V!1355 (_ BitVec 32) Int) ListLongMap!581)

(assert (=> b!27115 (= res!16053 (not (contains!247 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!16058 () Bool)

(assert (=> start!3866 (=> (not res!16058) (not e!17668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3866 (= res!16058 (validMask!0 mask!2294))))

(assert (=> start!3866 e!17668))

(assert (=> start!3866 true))

(assert (=> start!3866 tp!3796))

(declare-fun array_inv!499 (array!1517) Bool)

(assert (=> start!3866 (and (array_inv!499 _values!1501) e!17666)))

(declare-fun array_inv!500 (array!1519) Bool)

(assert (=> start!3866 (array_inv!500 _keys!1833)))

(assert (=> start!3866 tp_is_empty!1147))

(declare-fun b!27108 () Bool)

(declare-fun res!16052 () Bool)

(assert (=> b!27108 (=> (not res!16052) (not e!17668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1519 (_ BitVec 32)) Bool)

(assert (=> b!27108 (= res!16052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1246 () Bool)

(declare-fun tp!3795 () Bool)

(assert (=> mapNonEmpty!1246 (= mapRes!1246 (and tp!3795 e!17664))))

(declare-fun mapValue!1246 () ValueCell!374)

(declare-fun mapRest!1246 () (Array (_ BitVec 32) ValueCell!374))

(declare-fun mapKey!1246 () (_ BitVec 32))

(assert (=> mapNonEmpty!1246 (= (arr!713 _values!1501) (store mapRest!1246 mapKey!1246 mapValue!1246))))

(declare-fun b!27116 () Bool)

(assert (=> b!27116 (= e!17668 (or (bvsge #b00000000000000000000000000000000 (size!815 _keys!1833)) (bvsge (size!815 _keys!1833) #b01111111111111111111111111111111)))))

(assert (= (and start!3866 res!16058) b!27112))

(assert (= (and b!27112 res!16057) b!27108))

(assert (= (and b!27108 res!16052) b!27113))

(assert (= (and b!27113 res!16056) b!27114))

(assert (= (and b!27114 res!16055) b!27115))

(assert (= (and b!27115 res!16053) b!27110))

(assert (= (and b!27110 res!16054) b!27116))

(assert (= (and b!27107 condMapEmpty!1246) mapIsEmpty!1246))

(assert (= (and b!27107 (not condMapEmpty!1246)) mapNonEmpty!1246))

(get-info :version)

(assert (= (and mapNonEmpty!1246 ((_ is ValueCellFull!374) mapValue!1246)) b!27109))

(assert (= (and b!27107 ((_ is ValueCellFull!374) mapDefault!1246)) b!27111))

(assert (= start!3866 b!27107))

(declare-fun m!21559 () Bool)

(assert (=> b!27113 m!21559))

(declare-fun m!21561 () Bool)

(assert (=> b!27114 m!21561))

(declare-fun m!21563 () Bool)

(assert (=> mapNonEmpty!1246 m!21563))

(declare-fun m!21565 () Bool)

(assert (=> start!3866 m!21565))

(declare-fun m!21567 () Bool)

(assert (=> start!3866 m!21567))

(declare-fun m!21569 () Bool)

(assert (=> start!3866 m!21569))

(declare-fun m!21571 () Bool)

(assert (=> b!27108 m!21571))

(declare-fun m!21573 () Bool)

(assert (=> b!27110 m!21573))

(declare-fun m!21575 () Bool)

(assert (=> b!27115 m!21575))

(assert (=> b!27115 m!21575))

(declare-fun m!21577 () Bool)

(assert (=> b!27115 m!21577))

(check-sat (not b!27114) (not mapNonEmpty!1246) (not b!27115) b_and!1591 (not b!27110) (not b!27108) (not start!3866) (not b_next!793) tp_is_empty!1147 (not b!27113))
(check-sat b_and!1591 (not b_next!793))
(get-model)

(declare-fun b!27185 () Bool)

(declare-fun e!17707 () Bool)

(declare-fun e!17706 () Bool)

(assert (=> b!27185 (= e!17707 e!17706)))

(declare-fun lt!10547 () (_ BitVec 64))

(assert (=> b!27185 (= lt!10547 (select (arr!714 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!643 0))(
  ( (Unit!644) )
))
(declare-fun lt!10548 () Unit!643)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1519 (_ BitVec 64) (_ BitVec 32)) Unit!643)

(assert (=> b!27185 (= lt!10548 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10547 #b00000000000000000000000000000000))))

(assert (=> b!27185 (arrayContainsKey!0 _keys!1833 lt!10547 #b00000000000000000000000000000000)))

(declare-fun lt!10546 () Unit!643)

(assert (=> b!27185 (= lt!10546 lt!10548)))

(declare-fun res!16105 () Bool)

(declare-datatypes ((SeekEntryResult!64 0))(
  ( (MissingZero!64 (index!2378 (_ BitVec 32))) (Found!64 (index!2379 (_ BitVec 32))) (Intermediate!64 (undefined!876 Bool) (index!2380 (_ BitVec 32)) (x!6214 (_ BitVec 32))) (Undefined!64) (MissingVacant!64 (index!2381 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1519 (_ BitVec 32)) SeekEntryResult!64)

(assert (=> b!27185 (= res!16105 (= (seekEntryOrOpen!0 (select (arr!714 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!64 #b00000000000000000000000000000000)))))

(assert (=> b!27185 (=> (not res!16105) (not e!17706))))

(declare-fun b!27186 () Bool)

(declare-fun call!2550 () Bool)

(assert (=> b!27186 (= e!17706 call!2550)))

(declare-fun b!27187 () Bool)

(assert (=> b!27187 (= e!17707 call!2550)))

(declare-fun d!4911 () Bool)

(declare-fun res!16106 () Bool)

(declare-fun e!17705 () Bool)

(assert (=> d!4911 (=> res!16106 e!17705)))

(assert (=> d!4911 (= res!16106 (bvsge #b00000000000000000000000000000000 (size!815 _keys!1833)))))

(assert (=> d!4911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17705)))

(declare-fun b!27188 () Bool)

(assert (=> b!27188 (= e!17705 e!17707)))

(declare-fun c!3697 () Bool)

(assert (=> b!27188 (= c!3697 (validKeyInArray!0 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2547 () Bool)

(assert (=> bm!2547 (= call!2550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!4911 (not res!16106)) b!27188))

(assert (= (and b!27188 c!3697) b!27185))

(assert (= (and b!27188 (not c!3697)) b!27187))

(assert (= (and b!27185 res!16105) b!27186))

(assert (= (or b!27186 b!27187) bm!2547))

(declare-fun m!21619 () Bool)

(assert (=> b!27185 m!21619))

(declare-fun m!21621 () Bool)

(assert (=> b!27185 m!21621))

(declare-fun m!21623 () Bool)

(assert (=> b!27185 m!21623))

(assert (=> b!27185 m!21619))

(declare-fun m!21625 () Bool)

(assert (=> b!27185 m!21625))

(assert (=> b!27188 m!21619))

(assert (=> b!27188 m!21619))

(declare-fun m!21627 () Bool)

(assert (=> b!27188 m!21627))

(declare-fun m!21629 () Bool)

(assert (=> bm!2547 m!21629))

(assert (=> b!27108 d!4911))

(declare-fun d!4913 () Bool)

(assert (=> d!4913 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27114 d!4913))

(declare-fun d!4915 () Bool)

(declare-fun e!17713 () Bool)

(assert (=> d!4915 e!17713))

(declare-fun res!16109 () Bool)

(assert (=> d!4915 (=> res!16109 e!17713)))

(declare-fun lt!10559 () Bool)

(assert (=> d!4915 (= res!16109 (not lt!10559))))

(declare-fun lt!10557 () Bool)

(assert (=> d!4915 (= lt!10559 lt!10557)))

(declare-fun lt!10558 () Unit!643)

(declare-fun e!17712 () Unit!643)

(assert (=> d!4915 (= lt!10558 e!17712)))

(declare-fun c!3700 () Bool)

(assert (=> d!4915 (= c!3700 lt!10557)))

(declare-fun containsKey!28 (List!603 (_ BitVec 64)) Bool)

(assert (=> d!4915 (= lt!10557 (containsKey!28 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4915 (= (contains!247 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10559)))

(declare-fun b!27195 () Bool)

(declare-fun lt!10560 () Unit!643)

(assert (=> b!27195 (= e!17712 lt!10560)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!25 (List!603 (_ BitVec 64)) Unit!643)

(assert (=> b!27195 (= lt!10560 (lemmaContainsKeyImpliesGetValueByKeyDefined!25 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!70 0))(
  ( (Some!69 (v!1691 V!1355)) (None!68) )
))
(declare-fun isDefined!26 (Option!70) Bool)

(declare-fun getValueByKey!64 (List!603 (_ BitVec 64)) Option!70)

(assert (=> b!27195 (isDefined!26 (getValueByKey!64 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!27196 () Bool)

(declare-fun Unit!645 () Unit!643)

(assert (=> b!27196 (= e!17712 Unit!645)))

(declare-fun b!27197 () Bool)

(assert (=> b!27197 (= e!17713 (isDefined!26 (getValueByKey!64 (toList!306 (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4915 c!3700) b!27195))

(assert (= (and d!4915 (not c!3700)) b!27196))

(assert (= (and d!4915 (not res!16109)) b!27197))

(declare-fun m!21631 () Bool)

(assert (=> d!4915 m!21631))

(declare-fun m!21633 () Bool)

(assert (=> b!27195 m!21633))

(declare-fun m!21635 () Bool)

(assert (=> b!27195 m!21635))

(assert (=> b!27195 m!21635))

(declare-fun m!21637 () Bool)

(assert (=> b!27195 m!21637))

(assert (=> b!27197 m!21635))

(assert (=> b!27197 m!21635))

(assert (=> b!27197 m!21637))

(assert (=> b!27115 d!4915))

(declare-fun b!27240 () Bool)

(declare-fun e!17742 () Unit!643)

(declare-fun Unit!646 () Unit!643)

(assert (=> b!27240 (= e!17742 Unit!646)))

(declare-fun lt!10613 () ListLongMap!581)

(declare-fun b!27241 () Bool)

(declare-fun e!17740 () Bool)

(declare-fun apply!32 (ListLongMap!581 (_ BitVec 64)) V!1355)

(declare-fun get!439 (ValueCell!374 V!1355) V!1355)

(declare-fun dynLambda!145 (Int (_ BitVec 64)) V!1355)

(assert (=> b!27241 (= e!17740 (= (apply!32 lt!10613 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)) (get!439 (select (arr!713 _values!1501) #b00000000000000000000000000000000) (dynLambda!145 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!814 _values!1501)))))

(assert (=> b!27241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!815 _keys!1833)))))

(declare-fun b!27242 () Bool)

(declare-fun e!17750 () Bool)

(declare-fun call!2568 () Bool)

(assert (=> b!27242 (= e!17750 (not call!2568))))

(declare-fun b!27243 () Bool)

(declare-fun e!17751 () ListLongMap!581)

(declare-fun call!2569 () ListLongMap!581)

(assert (=> b!27243 (= e!17751 call!2569)))

(declare-fun b!27244 () Bool)

(declare-fun lt!10611 () Unit!643)

(assert (=> b!27244 (= e!17742 lt!10611)))

(declare-fun lt!10614 () ListLongMap!581)

(declare-fun getCurrentListMapNoExtraKeys!19 (array!1519 array!1517 (_ BitVec 32) (_ BitVec 32) V!1355 V!1355 (_ BitVec 32) Int) ListLongMap!581)

(assert (=> b!27244 (= lt!10614 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10617 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10608 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10608 (select (arr!714 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10618 () Unit!643)

(declare-fun addStillContains!17 (ListLongMap!581 (_ BitVec 64) V!1355 (_ BitVec 64)) Unit!643)

(assert (=> b!27244 (= lt!10618 (addStillContains!17 lt!10614 lt!10617 zeroValue!1443 lt!10608))))

(declare-fun +!49 (ListLongMap!581 tuple2!1010) ListLongMap!581)

(assert (=> b!27244 (contains!247 (+!49 lt!10614 (tuple2!1011 lt!10617 zeroValue!1443)) lt!10608)))

(declare-fun lt!10612 () Unit!643)

(assert (=> b!27244 (= lt!10612 lt!10618)))

(declare-fun lt!10609 () ListLongMap!581)

(assert (=> b!27244 (= lt!10609 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10620 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10620 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10626 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10626 (select (arr!714 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10625 () Unit!643)

(declare-fun addApplyDifferent!17 (ListLongMap!581 (_ BitVec 64) V!1355 (_ BitVec 64)) Unit!643)

(assert (=> b!27244 (= lt!10625 (addApplyDifferent!17 lt!10609 lt!10620 minValue!1443 lt!10626))))

(assert (=> b!27244 (= (apply!32 (+!49 lt!10609 (tuple2!1011 lt!10620 minValue!1443)) lt!10626) (apply!32 lt!10609 lt!10626))))

(declare-fun lt!10607 () Unit!643)

(assert (=> b!27244 (= lt!10607 lt!10625)))

(declare-fun lt!10623 () ListLongMap!581)

(assert (=> b!27244 (= lt!10623 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10624 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10619 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10619 (select (arr!714 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10615 () Unit!643)

(assert (=> b!27244 (= lt!10615 (addApplyDifferent!17 lt!10623 lt!10624 zeroValue!1443 lt!10619))))

(assert (=> b!27244 (= (apply!32 (+!49 lt!10623 (tuple2!1011 lt!10624 zeroValue!1443)) lt!10619) (apply!32 lt!10623 lt!10619))))

(declare-fun lt!10622 () Unit!643)

(assert (=> b!27244 (= lt!10622 lt!10615)))

(declare-fun lt!10605 () ListLongMap!581)

(assert (=> b!27244 (= lt!10605 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10621 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10621 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10616 () (_ BitVec 64))

(assert (=> b!27244 (= lt!10616 (select (arr!714 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!27244 (= lt!10611 (addApplyDifferent!17 lt!10605 lt!10621 minValue!1443 lt!10616))))

(assert (=> b!27244 (= (apply!32 (+!49 lt!10605 (tuple2!1011 lt!10621 minValue!1443)) lt!10616) (apply!32 lt!10605 lt!10616))))

(declare-fun b!27245 () Bool)

(declare-fun e!17748 () ListLongMap!581)

(declare-fun call!2565 () ListLongMap!581)

(assert (=> b!27245 (= e!17748 (+!49 call!2565 (tuple2!1011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!27246 () Bool)

(declare-fun e!17741 () ListLongMap!581)

(declare-fun call!2566 () ListLongMap!581)

(assert (=> b!27246 (= e!17741 call!2566)))

(declare-fun d!4917 () Bool)

(declare-fun e!17752 () Bool)

(assert (=> d!4917 e!17752))

(declare-fun res!16129 () Bool)

(assert (=> d!4917 (=> (not res!16129) (not e!17752))))

(assert (=> d!4917 (= res!16129 (or (bvsge #b00000000000000000000000000000000 (size!815 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!815 _keys!1833)))))))

(declare-fun lt!10610 () ListLongMap!581)

(assert (=> d!4917 (= lt!10613 lt!10610)))

(declare-fun lt!10606 () Unit!643)

(assert (=> d!4917 (= lt!10606 e!17742)))

(declare-fun c!3715 () Bool)

(declare-fun e!17744 () Bool)

(assert (=> d!4917 (= c!3715 e!17744)))

(declare-fun res!16130 () Bool)

(assert (=> d!4917 (=> (not res!16130) (not e!17744))))

(assert (=> d!4917 (= res!16130 (bvslt #b00000000000000000000000000000000 (size!815 _keys!1833)))))

(assert (=> d!4917 (= lt!10610 e!17748)))

(declare-fun c!3718 () Bool)

(assert (=> d!4917 (= c!3718 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4917 (validMask!0 mask!2294)))

(assert (=> d!4917 (= (getCurrentListMap!136 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10613)))

(declare-fun bm!2562 () Bool)

(assert (=> bm!2562 (= call!2569 call!2565)))

(declare-fun b!27247 () Bool)

(assert (=> b!27247 (= e!17748 e!17751)))

(declare-fun c!3713 () Bool)

(assert (=> b!27247 (= c!3713 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2563 () Bool)

(declare-fun call!2570 () ListLongMap!581)

(assert (=> bm!2563 (= call!2570 (getCurrentListMapNoExtraKeys!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!27248 () Bool)

(declare-fun res!16134 () Bool)

(assert (=> b!27248 (=> (not res!16134) (not e!17752))))

(declare-fun e!17749 () Bool)

(assert (=> b!27248 (= res!16134 e!17749)))

(declare-fun res!16133 () Bool)

(assert (=> b!27248 (=> res!16133 e!17749)))

(declare-fun e!17743 () Bool)

(assert (=> b!27248 (= res!16133 (not e!17743))))

(declare-fun res!16136 () Bool)

(assert (=> b!27248 (=> (not res!16136) (not e!17743))))

(assert (=> b!27248 (= res!16136 (bvslt #b00000000000000000000000000000000 (size!815 _keys!1833)))))

(declare-fun b!27249 () Bool)

(declare-fun e!17745 () Bool)

(declare-fun call!2571 () Bool)

(assert (=> b!27249 (= e!17745 (not call!2571))))

(declare-fun b!27250 () Bool)

(declare-fun res!16132 () Bool)

(assert (=> b!27250 (=> (not res!16132) (not e!17752))))

(assert (=> b!27250 (= res!16132 e!17750)))

(declare-fun c!3716 () Bool)

(assert (=> b!27250 (= c!3716 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!27251 () Bool)

(declare-fun e!17747 () Bool)

(assert (=> b!27251 (= e!17750 e!17747)))

(declare-fun res!16135 () Bool)

(assert (=> b!27251 (= res!16135 call!2568)))

(assert (=> b!27251 (=> (not res!16135) (not e!17747))))

(declare-fun b!27252 () Bool)

(assert (=> b!27252 (= e!17741 call!2569)))

(declare-fun b!27253 () Bool)

(declare-fun e!17746 () Bool)

(assert (=> b!27253 (= e!17745 e!17746)))

(declare-fun res!16131 () Bool)

(assert (=> b!27253 (= res!16131 call!2571)))

(assert (=> b!27253 (=> (not res!16131) (not e!17746))))

(declare-fun b!27254 () Bool)

(assert (=> b!27254 (= e!17744 (validKeyInArray!0 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27255 () Bool)

(assert (=> b!27255 (= e!17747 (= (apply!32 lt!10613 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!27256 () Bool)

(declare-fun c!3714 () Bool)

(assert (=> b!27256 (= c!3714 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!27256 (= e!17751 e!17741)))

(declare-fun b!27257 () Bool)

(assert (=> b!27257 (= e!17743 (validKeyInArray!0 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2564 () Bool)

(assert (=> bm!2564 (= call!2571 (contains!247 lt!10613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2565 () Bool)

(declare-fun call!2567 () ListLongMap!581)

(assert (=> bm!2565 (= call!2565 (+!49 (ite c!3718 call!2570 (ite c!3713 call!2567 call!2566)) (ite (or c!3718 c!3713) (tuple2!1011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2566 () Bool)

(assert (=> bm!2566 (= call!2566 call!2567)))

(declare-fun b!27258 () Bool)

(assert (=> b!27258 (= e!17749 e!17740)))

(declare-fun res!16128 () Bool)

(assert (=> b!27258 (=> (not res!16128) (not e!17740))))

(assert (=> b!27258 (= res!16128 (contains!247 lt!10613 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!27258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!815 _keys!1833)))))

(declare-fun bm!2567 () Bool)

(assert (=> bm!2567 (= call!2567 call!2570)))

(declare-fun bm!2568 () Bool)

(assert (=> bm!2568 (= call!2568 (contains!247 lt!10613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27259 () Bool)

(assert (=> b!27259 (= e!17752 e!17745)))

(declare-fun c!3717 () Bool)

(assert (=> b!27259 (= c!3717 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27260 () Bool)

(assert (=> b!27260 (= e!17746 (= (apply!32 lt!10613 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(assert (= (and d!4917 c!3718) b!27245))

(assert (= (and d!4917 (not c!3718)) b!27247))

(assert (= (and b!27247 c!3713) b!27243))

(assert (= (and b!27247 (not c!3713)) b!27256))

(assert (= (and b!27256 c!3714) b!27252))

(assert (= (and b!27256 (not c!3714)) b!27246))

(assert (= (or b!27252 b!27246) bm!2566))

(assert (= (or b!27243 bm!2566) bm!2567))

(assert (= (or b!27243 b!27252) bm!2562))

(assert (= (or b!27245 bm!2567) bm!2563))

(assert (= (or b!27245 bm!2562) bm!2565))

(assert (= (and d!4917 res!16130) b!27254))

(assert (= (and d!4917 c!3715) b!27244))

(assert (= (and d!4917 (not c!3715)) b!27240))

(assert (= (and d!4917 res!16129) b!27248))

(assert (= (and b!27248 res!16136) b!27257))

(assert (= (and b!27248 (not res!16133)) b!27258))

(assert (= (and b!27258 res!16128) b!27241))

(assert (= (and b!27248 res!16134) b!27250))

(assert (= (and b!27250 c!3716) b!27251))

(assert (= (and b!27250 (not c!3716)) b!27242))

(assert (= (and b!27251 res!16135) b!27255))

(assert (= (or b!27251 b!27242) bm!2568))

(assert (= (and b!27250 res!16132) b!27259))

(assert (= (and b!27259 c!3717) b!27253))

(assert (= (and b!27259 (not c!3717)) b!27249))

(assert (= (and b!27253 res!16131) b!27260))

(assert (= (or b!27253 b!27249) bm!2564))

(declare-fun b_lambda!1675 () Bool)

(assert (=> (not b_lambda!1675) (not b!27241)))

(declare-fun t!3293 () Bool)

(declare-fun tb!673 () Bool)

(assert (=> (and start!3866 (= defaultEntry!1504 defaultEntry!1504) t!3293) tb!673))

(declare-fun result!1141 () Bool)

(assert (=> tb!673 (= result!1141 tp_is_empty!1147)))

(assert (=> b!27241 t!3293))

(declare-fun b_and!1597 () Bool)

(assert (= b_and!1591 (and (=> t!3293 result!1141) b_and!1597)))

(assert (=> b!27258 m!21619))

(assert (=> b!27258 m!21619))

(declare-fun m!21639 () Bool)

(assert (=> b!27258 m!21639))

(declare-fun m!21641 () Bool)

(assert (=> bm!2565 m!21641))

(declare-fun m!21643 () Bool)

(assert (=> bm!2564 m!21643))

(declare-fun m!21645 () Bool)

(assert (=> bm!2563 m!21645))

(assert (=> d!4917 m!21565))

(declare-fun m!21647 () Bool)

(assert (=> b!27245 m!21647))

(declare-fun m!21649 () Bool)

(assert (=> bm!2568 m!21649))

(assert (=> b!27257 m!21619))

(assert (=> b!27257 m!21619))

(assert (=> b!27257 m!21627))

(declare-fun m!21651 () Bool)

(assert (=> b!27241 m!21651))

(assert (=> b!27241 m!21651))

(declare-fun m!21653 () Bool)

(assert (=> b!27241 m!21653))

(declare-fun m!21655 () Bool)

(assert (=> b!27241 m!21655))

(assert (=> b!27241 m!21653))

(assert (=> b!27241 m!21619))

(declare-fun m!21657 () Bool)

(assert (=> b!27241 m!21657))

(assert (=> b!27241 m!21619))

(declare-fun m!21659 () Bool)

(assert (=> b!27260 m!21659))

(assert (=> b!27254 m!21619))

(assert (=> b!27254 m!21619))

(assert (=> b!27254 m!21627))

(declare-fun m!21661 () Bool)

(assert (=> b!27244 m!21661))

(assert (=> b!27244 m!21645))

(declare-fun m!21663 () Bool)

(assert (=> b!27244 m!21663))

(declare-fun m!21665 () Bool)

(assert (=> b!27244 m!21665))

(declare-fun m!21667 () Bool)

(assert (=> b!27244 m!21667))

(declare-fun m!21669 () Bool)

(assert (=> b!27244 m!21669))

(declare-fun m!21671 () Bool)

(assert (=> b!27244 m!21671))

(declare-fun m!21673 () Bool)

(assert (=> b!27244 m!21673))

(assert (=> b!27244 m!21671))

(assert (=> b!27244 m!21665))

(declare-fun m!21675 () Bool)

(assert (=> b!27244 m!21675))

(declare-fun m!21677 () Bool)

(assert (=> b!27244 m!21677))

(declare-fun m!21679 () Bool)

(assert (=> b!27244 m!21679))

(declare-fun m!21681 () Bool)

(assert (=> b!27244 m!21681))

(declare-fun m!21683 () Bool)

(assert (=> b!27244 m!21683))

(declare-fun m!21685 () Bool)

(assert (=> b!27244 m!21685))

(assert (=> b!27244 m!21677))

(assert (=> b!27244 m!21683))

(declare-fun m!21687 () Bool)

(assert (=> b!27244 m!21687))

(assert (=> b!27244 m!21619))

(declare-fun m!21689 () Bool)

(assert (=> b!27244 m!21689))

(declare-fun m!21691 () Bool)

(assert (=> b!27255 m!21691))

(assert (=> b!27115 d!4917))

(declare-fun d!4919 () Bool)

(assert (=> d!4919 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3866 d!4919))

(declare-fun d!4921 () Bool)

(assert (=> d!4921 (= (array_inv!499 _values!1501) (bvsge (size!814 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3866 d!4921))

(declare-fun d!4923 () Bool)

(assert (=> d!4923 (= (array_inv!500 _keys!1833) (bvsge (size!815 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3866 d!4923))

(declare-fun d!4925 () Bool)

(declare-fun res!16141 () Bool)

(declare-fun e!17757 () Bool)

(assert (=> d!4925 (=> res!16141 e!17757)))

(assert (=> d!4925 (= res!16141 (= (select (arr!714 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!4925 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!17757)))

(declare-fun b!27267 () Bool)

(declare-fun e!17758 () Bool)

(assert (=> b!27267 (= e!17757 e!17758)))

(declare-fun res!16142 () Bool)

(assert (=> b!27267 (=> (not res!16142) (not e!17758))))

(assert (=> b!27267 (= res!16142 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!815 _keys!1833)))))

(declare-fun b!27268 () Bool)

(assert (=> b!27268 (= e!17758 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!4925 (not res!16141)) b!27267))

(assert (= (and b!27267 res!16142) b!27268))

(assert (=> d!4925 m!21619))

(declare-fun m!21693 () Bool)

(assert (=> b!27268 m!21693))

(assert (=> b!27110 d!4925))

(declare-fun b!27279 () Bool)

(declare-fun e!17770 () Bool)

(declare-fun contains!249 (List!602 (_ BitVec 64)) Bool)

(assert (=> b!27279 (= e!17770 (contains!249 Nil!599 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27280 () Bool)

(declare-fun e!17769 () Bool)

(declare-fun e!17767 () Bool)

(assert (=> b!27280 (= e!17769 e!17767)))

(declare-fun res!16150 () Bool)

(assert (=> b!27280 (=> (not res!16150) (not e!17767))))

(assert (=> b!27280 (= res!16150 (not e!17770))))

(declare-fun res!16151 () Bool)

(assert (=> b!27280 (=> (not res!16151) (not e!17770))))

(assert (=> b!27280 (= res!16151 (validKeyInArray!0 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2571 () Bool)

(declare-fun call!2574 () Bool)

(declare-fun c!3721 () Bool)

(assert (=> bm!2571 (= call!2574 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3721 (Cons!598 (select (arr!714 _keys!1833) #b00000000000000000000000000000000) Nil!599) Nil!599)))))

(declare-fun b!27281 () Bool)

(declare-fun e!17768 () Bool)

(assert (=> b!27281 (= e!17768 call!2574)))

(declare-fun b!27282 () Bool)

(assert (=> b!27282 (= e!17768 call!2574)))

(declare-fun b!27283 () Bool)

(assert (=> b!27283 (= e!17767 e!17768)))

(assert (=> b!27283 (= c!3721 (validKeyInArray!0 (select (arr!714 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4927 () Bool)

(declare-fun res!16149 () Bool)

(assert (=> d!4927 (=> res!16149 e!17769)))

(assert (=> d!4927 (= res!16149 (bvsge #b00000000000000000000000000000000 (size!815 _keys!1833)))))

(assert (=> d!4927 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!599) e!17769)))

(assert (= (and d!4927 (not res!16149)) b!27280))

(assert (= (and b!27280 res!16151) b!27279))

(assert (= (and b!27280 res!16150) b!27283))

(assert (= (and b!27283 c!3721) b!27282))

(assert (= (and b!27283 (not c!3721)) b!27281))

(assert (= (or b!27282 b!27281) bm!2571))

(assert (=> b!27279 m!21619))

(assert (=> b!27279 m!21619))

(declare-fun m!21695 () Bool)

(assert (=> b!27279 m!21695))

(assert (=> b!27280 m!21619))

(assert (=> b!27280 m!21619))

(assert (=> b!27280 m!21627))

(assert (=> bm!2571 m!21619))

(declare-fun m!21697 () Bool)

(assert (=> bm!2571 m!21697))

(assert (=> b!27283 m!21619))

(assert (=> b!27283 m!21619))

(assert (=> b!27283 m!21627))

(assert (=> b!27113 d!4927))

(declare-fun mapIsEmpty!1255 () Bool)

(declare-fun mapRes!1255 () Bool)

(assert (=> mapIsEmpty!1255 mapRes!1255))

(declare-fun condMapEmpty!1255 () Bool)

(declare-fun mapDefault!1255 () ValueCell!374)

(assert (=> mapNonEmpty!1246 (= condMapEmpty!1255 (= mapRest!1246 ((as const (Array (_ BitVec 32) ValueCell!374)) mapDefault!1255)))))

(declare-fun e!17775 () Bool)

(assert (=> mapNonEmpty!1246 (= tp!3795 (and e!17775 mapRes!1255))))

(declare-fun b!27291 () Bool)

(assert (=> b!27291 (= e!17775 tp_is_empty!1147)))

(declare-fun mapNonEmpty!1255 () Bool)

(declare-fun tp!3811 () Bool)

(declare-fun e!17776 () Bool)

(assert (=> mapNonEmpty!1255 (= mapRes!1255 (and tp!3811 e!17776))))

(declare-fun mapKey!1255 () (_ BitVec 32))

(declare-fun mapValue!1255 () ValueCell!374)

(declare-fun mapRest!1255 () (Array (_ BitVec 32) ValueCell!374))

(assert (=> mapNonEmpty!1255 (= mapRest!1246 (store mapRest!1255 mapKey!1255 mapValue!1255))))

(declare-fun b!27290 () Bool)

(assert (=> b!27290 (= e!17776 tp_is_empty!1147)))

(assert (= (and mapNonEmpty!1246 condMapEmpty!1255) mapIsEmpty!1255))

(assert (= (and mapNonEmpty!1246 (not condMapEmpty!1255)) mapNonEmpty!1255))

(assert (= (and mapNonEmpty!1255 ((_ is ValueCellFull!374) mapValue!1255)) b!27290))

(assert (= (and mapNonEmpty!1246 ((_ is ValueCellFull!374) mapDefault!1255)) b!27291))

(declare-fun m!21699 () Bool)

(assert (=> mapNonEmpty!1255 m!21699))

(declare-fun b_lambda!1677 () Bool)

(assert (= b_lambda!1675 (or (and start!3866 b_free!793) b_lambda!1677)))

(check-sat (not b!27197) (not mapNonEmpty!1255) (not bm!2564) (not bm!2571) (not d!4917) (not b!27245) (not b!27195) (not b!27279) (not bm!2568) (not b_lambda!1677) (not b!27244) tp_is_empty!1147 (not b!27241) (not b!27188) (not b!27255) (not b!27260) (not bm!2565) (not b!27258) (not b!27257) (not b!27268) (not d!4915) (not b!27283) (not b!27254) b_and!1597 (not b!27280) (not bm!2547) (not b_next!793) (not bm!2563) (not b!27185))
(check-sat b_and!1597 (not b_next!793))
