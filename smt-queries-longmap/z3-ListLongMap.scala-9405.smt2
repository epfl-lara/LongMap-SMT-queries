; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111924 () Bool)

(assert start!111924)

(declare-fun b_free!30523 () Bool)

(declare-fun b_next!30523 () Bool)

(assert (=> start!111924 (= b_free!30523 (not b_next!30523))))

(declare-fun tp!107050 () Bool)

(declare-fun b_and!49123 () Bool)

(assert (=> start!111924 (= tp!107050 b_and!49123)))

(declare-fun b!1326363 () Bool)

(declare-fun res!880329 () Bool)

(declare-fun e!755989 () Bool)

(assert (=> b!1326363 (=> (not res!880329) (not e!755989))))

(declare-datatypes ((array!89525 0))(
  ( (array!89526 (arr!43236 (Array (_ BitVec 32) (_ BitVec 64))) (size!43788 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89525)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326363 (= res!880329 (not (= (select (arr!43236 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326364 () Bool)

(assert (=> b!1326364 (= e!755989 (not true))))

(declare-datatypes ((V!53561 0))(
  ( (V!53562 (val!18246 Int)) )
))
(declare-datatypes ((tuple2!23600 0))(
  ( (tuple2!23601 (_1!11811 (_ BitVec 64)) (_2!11811 V!53561)) )
))
(declare-datatypes ((List!30727 0))(
  ( (Nil!30724) (Cons!30723 (h!31932 tuple2!23600) (t!44713 List!30727)) )
))
(declare-datatypes ((ListLongMap!21257 0))(
  ( (ListLongMap!21258 (toList!10644 List!30727)) )
))
(declare-fun lt!589898 () ListLongMap!21257)

(declare-fun lt!589901 () tuple2!23600)

(declare-fun contains!8728 (ListLongMap!21257 (_ BitVec 64)) Bool)

(declare-fun +!4651 (ListLongMap!21257 tuple2!23600) ListLongMap!21257)

(assert (=> b!1326364 (contains!8728 (+!4651 lt!589898 lt!589901) k0!1164)))

(declare-fun zeroValue!1279 () V!53561)

(declare-datatypes ((Unit!43495 0))(
  ( (Unit!43496) )
))
(declare-fun lt!589904 () Unit!43495)

(declare-fun addStillContains!1155 (ListLongMap!21257 (_ BitVec 64) V!53561 (_ BitVec 64)) Unit!43495)

(assert (=> b!1326364 (= lt!589904 (addStillContains!1155 lt!589898 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1326364 (contains!8728 lt!589898 k0!1164)))

(declare-fun lt!589899 () V!53561)

(declare-fun lt!589902 () Unit!43495)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!213 ((_ BitVec 64) (_ BitVec 64) V!53561 ListLongMap!21257) Unit!43495)

(assert (=> b!1326364 (= lt!589902 (lemmaInListMapAfterAddingDiffThenInBefore!213 k0!1164 (select (arr!43236 _keys!1609) from!2000) lt!589899 lt!589898))))

(declare-fun lt!589897 () ListLongMap!21257)

(assert (=> b!1326364 (contains!8728 lt!589897 k0!1164)))

(declare-fun lt!589903 () Unit!43495)

(assert (=> b!1326364 (= lt!589903 (lemmaInListMapAfterAddingDiffThenInBefore!213 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589897))))

(declare-fun lt!589900 () ListLongMap!21257)

(assert (=> b!1326364 (contains!8728 lt!589900 k0!1164)))

(declare-fun minValue!1279 () V!53561)

(declare-fun lt!589905 () Unit!43495)

(assert (=> b!1326364 (= lt!589905 (lemmaInListMapAfterAddingDiffThenInBefore!213 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589900))))

(assert (=> b!1326364 (= lt!589900 (+!4651 lt!589897 lt!589901))))

(assert (=> b!1326364 (= lt!589901 (tuple2!23601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1326364 (= lt!589897 (+!4651 lt!589898 (tuple2!23601 (select (arr!43236 _keys!1609) from!2000) lt!589899)))))

(declare-datatypes ((ValueCell!17273 0))(
  ( (ValueCellFull!17273 (v!20878 V!53561)) (EmptyCell!17273) )
))
(declare-datatypes ((array!89527 0))(
  ( (array!89528 (arr!43237 (Array (_ BitVec 32) ValueCell!17273)) (size!43789 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89527)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21787 (ValueCell!17273 V!53561) V!53561)

(declare-fun dynLambda!3581 (Int (_ BitVec 64)) V!53561)

(assert (=> b!1326364 (= lt!589899 (get!21787 (select (arr!43237 _values!1337) from!2000) (dynLambda!3581 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6289 (array!89525 array!89527 (_ BitVec 32) (_ BitVec 32) V!53561 V!53561 (_ BitVec 32) Int) ListLongMap!21257)

(assert (=> b!1326364 (= lt!589898 (getCurrentListMapNoExtraKeys!6289 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326365 () Bool)

(declare-fun res!880325 () Bool)

(assert (=> b!1326365 (=> (not res!880325) (not e!755989))))

(declare-datatypes ((List!30728 0))(
  ( (Nil!30725) (Cons!30724 (h!31933 (_ BitVec 64)) (t!44714 List!30728)) )
))
(declare-fun arrayNoDuplicates!0 (array!89525 (_ BitVec 32) List!30728) Bool)

(assert (=> b!1326365 (= res!880325 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30725))))

(declare-fun mapNonEmpty!56166 () Bool)

(declare-fun mapRes!56166 () Bool)

(declare-fun tp!107049 () Bool)

(declare-fun e!755988 () Bool)

(assert (=> mapNonEmpty!56166 (= mapRes!56166 (and tp!107049 e!755988))))

(declare-fun mapKey!56166 () (_ BitVec 32))

(declare-fun mapValue!56166 () ValueCell!17273)

(declare-fun mapRest!56166 () (Array (_ BitVec 32) ValueCell!17273))

(assert (=> mapNonEmpty!56166 (= (arr!43237 _values!1337) (store mapRest!56166 mapKey!56166 mapValue!56166))))

(declare-fun b!1326367 () Bool)

(declare-fun tp_is_empty!36343 () Bool)

(assert (=> b!1326367 (= e!755988 tp_is_empty!36343)))

(declare-fun b!1326368 () Bool)

(declare-fun res!880331 () Bool)

(assert (=> b!1326368 (=> (not res!880331) (not e!755989))))

(declare-fun getCurrentListMap!5517 (array!89525 array!89527 (_ BitVec 32) (_ BitVec 32) V!53561 V!53561 (_ BitVec 32) Int) ListLongMap!21257)

(assert (=> b!1326368 (= res!880331 (contains!8728 (getCurrentListMap!5517 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56166 () Bool)

(assert (=> mapIsEmpty!56166 mapRes!56166))

(declare-fun b!1326369 () Bool)

(declare-fun res!880330 () Bool)

(assert (=> b!1326369 (=> (not res!880330) (not e!755989))))

(assert (=> b!1326369 (= res!880330 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43788 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326370 () Bool)

(declare-fun res!880324 () Bool)

(assert (=> b!1326370 (=> (not res!880324) (not e!755989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326370 (= res!880324 (validKeyInArray!0 (select (arr!43236 _keys!1609) from!2000)))))

(declare-fun b!1326371 () Bool)

(declare-fun res!880327 () Bool)

(assert (=> b!1326371 (=> (not res!880327) (not e!755989))))

(assert (=> b!1326371 (= res!880327 (and (= (size!43789 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43788 _keys!1609) (size!43789 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326366 () Bool)

(declare-fun res!880326 () Bool)

(assert (=> b!1326366 (=> (not res!880326) (not e!755989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89525 (_ BitVec 32)) Bool)

(assert (=> b!1326366 (= res!880326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!880328 () Bool)

(assert (=> start!111924 (=> (not res!880328) (not e!755989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111924 (= res!880328 (validMask!0 mask!2019))))

(assert (=> start!111924 e!755989))

(declare-fun array_inv!32809 (array!89525) Bool)

(assert (=> start!111924 (array_inv!32809 _keys!1609)))

(assert (=> start!111924 true))

(assert (=> start!111924 tp_is_empty!36343))

(declare-fun e!755985 () Bool)

(declare-fun array_inv!32810 (array!89527) Bool)

(assert (=> start!111924 (and (array_inv!32810 _values!1337) e!755985)))

(assert (=> start!111924 tp!107050))

(declare-fun b!1326372 () Bool)

(declare-fun e!755987 () Bool)

(assert (=> b!1326372 (= e!755987 tp_is_empty!36343)))

(declare-fun b!1326373 () Bool)

(assert (=> b!1326373 (= e!755985 (and e!755987 mapRes!56166))))

(declare-fun condMapEmpty!56166 () Bool)

(declare-fun mapDefault!56166 () ValueCell!17273)

(assert (=> b!1326373 (= condMapEmpty!56166 (= (arr!43237 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17273)) mapDefault!56166)))))

(assert (= (and start!111924 res!880328) b!1326371))

(assert (= (and b!1326371 res!880327) b!1326366))

(assert (= (and b!1326366 res!880326) b!1326365))

(assert (= (and b!1326365 res!880325) b!1326369))

(assert (= (and b!1326369 res!880330) b!1326368))

(assert (= (and b!1326368 res!880331) b!1326363))

(assert (= (and b!1326363 res!880329) b!1326370))

(assert (= (and b!1326370 res!880324) b!1326364))

(assert (= (and b!1326373 condMapEmpty!56166) mapIsEmpty!56166))

(assert (= (and b!1326373 (not condMapEmpty!56166)) mapNonEmpty!56166))

(get-info :version)

(assert (= (and mapNonEmpty!56166 ((_ is ValueCellFull!17273) mapValue!56166)) b!1326367))

(assert (= (and b!1326373 ((_ is ValueCellFull!17273) mapDefault!56166)) b!1326372))

(assert (= start!111924 b!1326373))

(declare-fun b_lambda!23791 () Bool)

(assert (=> (not b_lambda!23791) (not b!1326364)))

(declare-fun t!44712 () Bool)

(declare-fun tb!11789 () Bool)

(assert (=> (and start!111924 (= defaultEntry!1340 defaultEntry!1340) t!44712) tb!11789))

(declare-fun result!24643 () Bool)

(assert (=> tb!11789 (= result!24643 tp_is_empty!36343)))

(assert (=> b!1326364 t!44712))

(declare-fun b_and!49125 () Bool)

(assert (= b_and!49123 (and (=> t!44712 result!24643) b_and!49125)))

(declare-fun m!1214905 () Bool)

(assert (=> b!1326365 m!1214905))

(declare-fun m!1214907 () Bool)

(assert (=> b!1326366 m!1214907))

(declare-fun m!1214909 () Bool)

(assert (=> b!1326368 m!1214909))

(assert (=> b!1326368 m!1214909))

(declare-fun m!1214911 () Bool)

(assert (=> b!1326368 m!1214911))

(declare-fun m!1214913 () Bool)

(assert (=> b!1326364 m!1214913))

(declare-fun m!1214915 () Bool)

(assert (=> b!1326364 m!1214915))

(assert (=> b!1326364 m!1214915))

(declare-fun m!1214917 () Bool)

(assert (=> b!1326364 m!1214917))

(declare-fun m!1214919 () Bool)

(assert (=> b!1326364 m!1214919))

(declare-fun m!1214921 () Bool)

(assert (=> b!1326364 m!1214921))

(declare-fun m!1214923 () Bool)

(assert (=> b!1326364 m!1214923))

(declare-fun m!1214925 () Bool)

(assert (=> b!1326364 m!1214925))

(declare-fun m!1214927 () Bool)

(assert (=> b!1326364 m!1214927))

(declare-fun m!1214929 () Bool)

(assert (=> b!1326364 m!1214929))

(assert (=> b!1326364 m!1214929))

(assert (=> b!1326364 m!1214921))

(declare-fun m!1214931 () Bool)

(assert (=> b!1326364 m!1214931))

(declare-fun m!1214933 () Bool)

(assert (=> b!1326364 m!1214933))

(declare-fun m!1214935 () Bool)

(assert (=> b!1326364 m!1214935))

(declare-fun m!1214937 () Bool)

(assert (=> b!1326364 m!1214937))

(declare-fun m!1214939 () Bool)

(assert (=> b!1326364 m!1214939))

(assert (=> b!1326364 m!1214935))

(declare-fun m!1214941 () Bool)

(assert (=> b!1326364 m!1214941))

(declare-fun m!1214943 () Bool)

(assert (=> b!1326364 m!1214943))

(declare-fun m!1214945 () Bool)

(assert (=> start!111924 m!1214945))

(declare-fun m!1214947 () Bool)

(assert (=> start!111924 m!1214947))

(declare-fun m!1214949 () Bool)

(assert (=> start!111924 m!1214949))

(assert (=> b!1326370 m!1214935))

(assert (=> b!1326370 m!1214935))

(declare-fun m!1214951 () Bool)

(assert (=> b!1326370 m!1214951))

(declare-fun m!1214953 () Bool)

(assert (=> mapNonEmpty!56166 m!1214953))

(assert (=> b!1326363 m!1214935))

(check-sat tp_is_empty!36343 (not b!1326365) (not b!1326370) (not mapNonEmpty!56166) b_and!49125 (not b!1326364) (not b!1326368) (not b_next!30523) (not start!111924) (not b!1326366) (not b_lambda!23791))
(check-sat b_and!49125 (not b_next!30523))
