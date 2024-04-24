; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111802 () Bool)

(assert start!111802)

(declare-fun b_free!30235 () Bool)

(declare-fun b_next!30235 () Bool)

(assert (=> start!111802 (= b_free!30235 (not b_next!30235))))

(declare-fun tp!106181 () Bool)

(declare-fun b_and!48631 () Bool)

(assert (=> start!111802 (= tp!106181 b_and!48631)))

(declare-fun b!1322629 () Bool)

(declare-fun res!877522 () Bool)

(declare-fun e!754446 () Bool)

(assert (=> b!1322629 (=> (not res!877522) (not e!754446))))

(declare-datatypes ((array!89117 0))(
  ( (array!89118 (arr!43028 (Array (_ BitVec 32) (_ BitVec 64))) (size!43579 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89117)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53177 0))(
  ( (V!53178 (val!18102 Int)) )
))
(declare-fun zeroValue!1279 () V!53177)

(declare-datatypes ((ValueCell!17129 0))(
  ( (ValueCellFull!17129 (v!20727 V!53177)) (EmptyCell!17129) )
))
(declare-datatypes ((array!89119 0))(
  ( (array!89120 (arr!43029 (Array (_ BitVec 32) ValueCell!17129)) (size!43580 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89119)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun minValue!1279 () V!53177)

(declare-datatypes ((tuple2!23354 0))(
  ( (tuple2!23355 (_1!11688 (_ BitVec 64)) (_2!11688 V!53177)) )
))
(declare-datatypes ((List!30508 0))(
  ( (Nil!30505) (Cons!30504 (h!31722 tuple2!23354) (t!44284 List!30508)) )
))
(declare-datatypes ((ListLongMap!21019 0))(
  ( (ListLongMap!21020 (toList!10525 List!30508)) )
))
(declare-fun contains!8692 (ListLongMap!21019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5519 (array!89117 array!89119 (_ BitVec 32) (_ BitVec 32) V!53177 V!53177 (_ BitVec 32) Int) ListLongMap!21019)

(assert (=> b!1322629 (= res!877522 (contains!8692 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322630 () Bool)

(assert (=> b!1322630 (= e!754446 (not true))))

(declare-fun lt!587873 () ListLongMap!21019)

(assert (=> b!1322630 (contains!8692 lt!587873 k0!1164)))

(declare-datatypes ((Unit!43495 0))(
  ( (Unit!43496) )
))
(declare-fun lt!587876 () Unit!43495)

(declare-fun lt!587874 () V!53177)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!159 ((_ BitVec 64) (_ BitVec 64) V!53177 ListLongMap!21019) Unit!43495)

(assert (=> b!1322630 (= lt!587876 (lemmaInListMapAfterAddingDiffThenInBefore!159 k0!1164 (select (arr!43028 _keys!1609) from!2000) lt!587874 lt!587873))))

(declare-fun lt!587877 () ListLongMap!21019)

(assert (=> b!1322630 (contains!8692 lt!587877 k0!1164)))

(declare-fun lt!587875 () Unit!43495)

(assert (=> b!1322630 (= lt!587875 (lemmaInListMapAfterAddingDiffThenInBefore!159 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587877))))

(declare-fun lt!587878 () ListLongMap!21019)

(assert (=> b!1322630 (contains!8692 lt!587878 k0!1164)))

(declare-fun lt!587879 () Unit!43495)

(assert (=> b!1322630 (= lt!587879 (lemmaInListMapAfterAddingDiffThenInBefore!159 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587878))))

(declare-fun +!4604 (ListLongMap!21019 tuple2!23354) ListLongMap!21019)

(assert (=> b!1322630 (= lt!587878 (+!4604 lt!587877 (tuple2!23355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322630 (= lt!587877 (+!4604 lt!587873 (tuple2!23355 (select (arr!43028 _keys!1609) from!2000) lt!587874)))))

(declare-fun get!21677 (ValueCell!17129 V!53177) V!53177)

(declare-fun dynLambda!3558 (Int (_ BitVec 64)) V!53177)

(assert (=> b!1322630 (= lt!587874 (get!21677 (select (arr!43029 _values!1337) from!2000) (dynLambda!3558 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6243 (array!89117 array!89119 (_ BitVec 32) (_ BitVec 32) V!53177 V!53177 (_ BitVec 32) Int) ListLongMap!21019)

(assert (=> b!1322630 (= lt!587873 (getCurrentListMapNoExtraKeys!6243 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322631 () Bool)

(declare-fun e!754445 () Bool)

(declare-fun tp_is_empty!36055 () Bool)

(assert (=> b!1322631 (= e!754445 tp_is_empty!36055)))

(declare-fun b!1322632 () Bool)

(declare-fun res!877520 () Bool)

(assert (=> b!1322632 (=> (not res!877520) (not e!754446))))

(declare-datatypes ((List!30509 0))(
  ( (Nil!30506) (Cons!30505 (h!31723 (_ BitVec 64)) (t!44285 List!30509)) )
))
(declare-fun arrayNoDuplicates!0 (array!89117 (_ BitVec 32) List!30509) Bool)

(assert (=> b!1322632 (= res!877520 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30506))))

(declare-fun res!877519 () Bool)

(assert (=> start!111802 (=> (not res!877519) (not e!754446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111802 (= res!877519 (validMask!0 mask!2019))))

(assert (=> start!111802 e!754446))

(declare-fun array_inv!32759 (array!89117) Bool)

(assert (=> start!111802 (array_inv!32759 _keys!1609)))

(assert (=> start!111802 true))

(assert (=> start!111802 tp_is_empty!36055))

(declare-fun e!754444 () Bool)

(declare-fun array_inv!32760 (array!89119) Bool)

(assert (=> start!111802 (and (array_inv!32760 _values!1337) e!754444)))

(assert (=> start!111802 tp!106181))

(declare-fun b!1322633 () Bool)

(declare-fun res!877516 () Bool)

(assert (=> b!1322633 (=> (not res!877516) (not e!754446))))

(assert (=> b!1322633 (= res!877516 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43579 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55730 () Bool)

(declare-fun mapRes!55730 () Bool)

(declare-fun tp!106180 () Bool)

(declare-fun e!754443 () Bool)

(assert (=> mapNonEmpty!55730 (= mapRes!55730 (and tp!106180 e!754443))))

(declare-fun mapValue!55730 () ValueCell!17129)

(declare-fun mapKey!55730 () (_ BitVec 32))

(declare-fun mapRest!55730 () (Array (_ BitVec 32) ValueCell!17129))

(assert (=> mapNonEmpty!55730 (= (arr!43029 _values!1337) (store mapRest!55730 mapKey!55730 mapValue!55730))))

(declare-fun b!1322634 () Bool)

(declare-fun res!877521 () Bool)

(assert (=> b!1322634 (=> (not res!877521) (not e!754446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89117 (_ BitVec 32)) Bool)

(assert (=> b!1322634 (= res!877521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322635 () Bool)

(assert (=> b!1322635 (= e!754444 (and e!754445 mapRes!55730))))

(declare-fun condMapEmpty!55730 () Bool)

(declare-fun mapDefault!55730 () ValueCell!17129)

(assert (=> b!1322635 (= condMapEmpty!55730 (= (arr!43029 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17129)) mapDefault!55730)))))

(declare-fun b!1322636 () Bool)

(declare-fun res!877515 () Bool)

(assert (=> b!1322636 (=> (not res!877515) (not e!754446))))

(assert (=> b!1322636 (= res!877515 (not (= (select (arr!43028 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55730 () Bool)

(assert (=> mapIsEmpty!55730 mapRes!55730))

(declare-fun b!1322637 () Bool)

(declare-fun res!877517 () Bool)

(assert (=> b!1322637 (=> (not res!877517) (not e!754446))))

(assert (=> b!1322637 (= res!877517 (and (= (size!43580 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43579 _keys!1609) (size!43580 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322638 () Bool)

(assert (=> b!1322638 (= e!754443 tp_is_empty!36055)))

(declare-fun b!1322639 () Bool)

(declare-fun res!877518 () Bool)

(assert (=> b!1322639 (=> (not res!877518) (not e!754446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322639 (= res!877518 (validKeyInArray!0 (select (arr!43028 _keys!1609) from!2000)))))

(assert (= (and start!111802 res!877519) b!1322637))

(assert (= (and b!1322637 res!877517) b!1322634))

(assert (= (and b!1322634 res!877521) b!1322632))

(assert (= (and b!1322632 res!877520) b!1322633))

(assert (= (and b!1322633 res!877516) b!1322629))

(assert (= (and b!1322629 res!877522) b!1322636))

(assert (= (and b!1322636 res!877515) b!1322639))

(assert (= (and b!1322639 res!877518) b!1322630))

(assert (= (and b!1322635 condMapEmpty!55730) mapIsEmpty!55730))

(assert (= (and b!1322635 (not condMapEmpty!55730)) mapNonEmpty!55730))

(get-info :version)

(assert (= (and mapNonEmpty!55730 ((_ is ValueCellFull!17129) mapValue!55730)) b!1322638))

(assert (= (and b!1322635 ((_ is ValueCellFull!17129) mapDefault!55730)) b!1322631))

(assert (= start!111802 b!1322635))

(declare-fun b_lambda!23555 () Bool)

(assert (=> (not b_lambda!23555) (not b!1322630)))

(declare-fun t!44283 () Bool)

(declare-fun tb!11579 () Bool)

(assert (=> (and start!111802 (= defaultEntry!1340 defaultEntry!1340) t!44283) tb!11579))

(declare-fun result!24221 () Bool)

(assert (=> tb!11579 (= result!24221 tp_is_empty!36055)))

(assert (=> b!1322630 t!44283))

(declare-fun b_and!48633 () Bool)

(assert (= b_and!48631 (and (=> t!44283 result!24221) b_and!48633)))

(declare-fun m!1210829 () Bool)

(assert (=> b!1322629 m!1210829))

(assert (=> b!1322629 m!1210829))

(declare-fun m!1210831 () Bool)

(assert (=> b!1322629 m!1210831))

(declare-fun m!1210833 () Bool)

(assert (=> mapNonEmpty!55730 m!1210833))

(declare-fun m!1210835 () Bool)

(assert (=> b!1322634 m!1210835))

(declare-fun m!1210837 () Bool)

(assert (=> b!1322632 m!1210837))

(declare-fun m!1210839 () Bool)

(assert (=> b!1322636 m!1210839))

(declare-fun m!1210841 () Bool)

(assert (=> start!111802 m!1210841))

(declare-fun m!1210843 () Bool)

(assert (=> start!111802 m!1210843))

(declare-fun m!1210845 () Bool)

(assert (=> start!111802 m!1210845))

(assert (=> b!1322639 m!1210839))

(assert (=> b!1322639 m!1210839))

(declare-fun m!1210847 () Bool)

(assert (=> b!1322639 m!1210847))

(declare-fun m!1210849 () Bool)

(assert (=> b!1322630 m!1210849))

(declare-fun m!1210851 () Bool)

(assert (=> b!1322630 m!1210851))

(declare-fun m!1210853 () Bool)

(assert (=> b!1322630 m!1210853))

(declare-fun m!1210855 () Bool)

(assert (=> b!1322630 m!1210855))

(declare-fun m!1210857 () Bool)

(assert (=> b!1322630 m!1210857))

(assert (=> b!1322630 m!1210857))

(declare-fun m!1210859 () Bool)

(assert (=> b!1322630 m!1210859))

(declare-fun m!1210861 () Bool)

(assert (=> b!1322630 m!1210861))

(declare-fun m!1210863 () Bool)

(assert (=> b!1322630 m!1210863))

(assert (=> b!1322630 m!1210839))

(assert (=> b!1322630 m!1210859))

(declare-fun m!1210865 () Bool)

(assert (=> b!1322630 m!1210865))

(assert (=> b!1322630 m!1210839))

(declare-fun m!1210867 () Bool)

(assert (=> b!1322630 m!1210867))

(declare-fun m!1210869 () Bool)

(assert (=> b!1322630 m!1210869))

(declare-fun m!1210871 () Bool)

(assert (=> b!1322630 m!1210871))

(check-sat b_and!48633 (not b!1322639) (not b!1322630) (not b!1322634) (not b!1322629) tp_is_empty!36055 (not mapNonEmpty!55730) (not b_next!30235) (not b_lambda!23555) (not b!1322632) (not start!111802))
(check-sat b_and!48633 (not b_next!30235))
