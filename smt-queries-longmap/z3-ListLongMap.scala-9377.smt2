; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111922 () Bool)

(assert start!111922)

(declare-fun b_free!30355 () Bool)

(declare-fun b_next!30355 () Bool)

(assert (=> start!111922 (= b_free!30355 (not b_next!30355))))

(declare-fun tp!106541 () Bool)

(declare-fun b_and!48871 () Bool)

(assert (=> start!111922 (= tp!106541 b_and!48871)))

(declare-fun b!1324729 () Bool)

(declare-fun res!878955 () Bool)

(declare-fun e!755347 () Bool)

(assert (=> b!1324729 (=> (not res!878955) (not e!755347))))

(declare-datatypes ((array!89355 0))(
  ( (array!89356 (arr!43147 (Array (_ BitVec 32) (_ BitVec 64))) (size!43698 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89355)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324729 (= res!878955 (validKeyInArray!0 (select (arr!43147 _keys!1609) from!2000)))))

(declare-fun res!878957 () Bool)

(assert (=> start!111922 (=> (not res!878957) (not e!755347))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111922 (= res!878957 (validMask!0 mask!2019))))

(assert (=> start!111922 e!755347))

(declare-fun array_inv!32845 (array!89355) Bool)

(assert (=> start!111922 (array_inv!32845 _keys!1609)))

(assert (=> start!111922 true))

(declare-fun tp_is_empty!36175 () Bool)

(assert (=> start!111922 tp_is_empty!36175))

(declare-datatypes ((V!53337 0))(
  ( (V!53338 (val!18162 Int)) )
))
(declare-datatypes ((ValueCell!17189 0))(
  ( (ValueCellFull!17189 (v!20787 V!53337)) (EmptyCell!17189) )
))
(declare-datatypes ((array!89357 0))(
  ( (array!89358 (arr!43148 (Array (_ BitVec 32) ValueCell!17189)) (size!43699 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89357)

(declare-fun e!755345 () Bool)

(declare-fun array_inv!32846 (array!89357) Bool)

(assert (=> start!111922 (and (array_inv!32846 _values!1337) e!755345)))

(assert (=> start!111922 tp!106541))

(declare-fun b!1324730 () Bool)

(declare-fun e!755344 () Bool)

(assert (=> b!1324730 (= e!755344 tp_is_empty!36175)))

(declare-fun b!1324731 () Bool)

(declare-fun res!878959 () Bool)

(assert (=> b!1324731 (=> (not res!878959) (not e!755347))))

(declare-datatypes ((List!30604 0))(
  ( (Nil!30601) (Cons!30600 (h!31818 (_ BitVec 64)) (t!44500 List!30604)) )
))
(declare-fun arrayNoDuplicates!0 (array!89355 (_ BitVec 32) List!30604) Bool)

(assert (=> b!1324731 (= res!878959 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30601))))

(declare-fun b!1324732 () Bool)

(declare-fun e!755343 () Bool)

(declare-fun mapRes!55910 () Bool)

(assert (=> b!1324732 (= e!755345 (and e!755343 mapRes!55910))))

(declare-fun condMapEmpty!55910 () Bool)

(declare-fun mapDefault!55910 () ValueCell!17189)

(assert (=> b!1324732 (= condMapEmpty!55910 (= (arr!43148 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17189)) mapDefault!55910)))))

(declare-fun b!1324733 () Bool)

(assert (=> b!1324733 (= e!755343 tp_is_empty!36175)))

(declare-fun b!1324734 () Bool)

(assert (=> b!1324734 (= e!755347 (not true))))

(declare-datatypes ((tuple2!23454 0))(
  ( (tuple2!23455 (_1!11738 (_ BitVec 64)) (_2!11738 V!53337)) )
))
(declare-datatypes ((List!30605 0))(
  ( (Nil!30602) (Cons!30601 (h!31819 tuple2!23454) (t!44501 List!30605)) )
))
(declare-datatypes ((ListLongMap!21119 0))(
  ( (ListLongMap!21120 (toList!10575 List!30605)) )
))
(declare-fun lt!589504 () ListLongMap!21119)

(declare-fun minValue!1279 () V!53337)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8742 (ListLongMap!21119 (_ BitVec 64)) Bool)

(declare-fun +!4646 (ListLongMap!21119 tuple2!23454) ListLongMap!21119)

(assert (=> b!1324734 (contains!8742 (+!4646 lt!589504 (tuple2!23455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43579 0))(
  ( (Unit!43580) )
))
(declare-fun lt!589509 () Unit!43579)

(declare-fun addStillContains!1158 (ListLongMap!21119 (_ BitVec 64) V!53337 (_ BitVec 64)) Unit!43579)

(assert (=> b!1324734 (= lt!589509 (addStillContains!1158 lt!589504 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324734 (contains!8742 lt!589504 k0!1164)))

(declare-fun lt!589506 () ListLongMap!21119)

(declare-fun lt!589502 () tuple2!23454)

(assert (=> b!1324734 (= lt!589504 (+!4646 lt!589506 lt!589502))))

(declare-fun zeroValue!1279 () V!53337)

(declare-fun lt!589511 () Unit!43579)

(assert (=> b!1324734 (= lt!589511 (addStillContains!1158 lt!589506 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324734 (contains!8742 lt!589506 k0!1164)))

(declare-fun lt!589503 () Unit!43579)

(declare-fun lt!589501 () V!53337)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!201 ((_ BitVec 64) (_ BitVec 64) V!53337 ListLongMap!21119) Unit!43579)

(assert (=> b!1324734 (= lt!589503 (lemmaInListMapAfterAddingDiffThenInBefore!201 k0!1164 (select (arr!43147 _keys!1609) from!2000) lt!589501 lt!589506))))

(declare-fun lt!589507 () ListLongMap!21119)

(assert (=> b!1324734 (contains!8742 lt!589507 k0!1164)))

(declare-fun lt!589510 () Unit!43579)

(assert (=> b!1324734 (= lt!589510 (lemmaInListMapAfterAddingDiffThenInBefore!201 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589507))))

(declare-fun lt!589508 () ListLongMap!21119)

(assert (=> b!1324734 (contains!8742 lt!589508 k0!1164)))

(declare-fun lt!589505 () Unit!43579)

(assert (=> b!1324734 (= lt!589505 (lemmaInListMapAfterAddingDiffThenInBefore!201 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589508))))

(assert (=> b!1324734 (= lt!589508 (+!4646 lt!589507 lt!589502))))

(assert (=> b!1324734 (= lt!589502 (tuple2!23455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324734 (= lt!589507 (+!4646 lt!589506 (tuple2!23455 (select (arr!43147 _keys!1609) from!2000) lt!589501)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21759 (ValueCell!17189 V!53337) V!53337)

(declare-fun dynLambda!3600 (Int (_ BitVec 64)) V!53337)

(assert (=> b!1324734 (= lt!589501 (get!21759 (select (arr!43148 _values!1337) from!2000) (dynLambda!3600 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6285 (array!89355 array!89357 (_ BitVec 32) (_ BitVec 32) V!53337 V!53337 (_ BitVec 32) Int) ListLongMap!21119)

(assert (=> b!1324734 (= lt!589506 (getCurrentListMapNoExtraKeys!6285 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55910 () Bool)

(declare-fun tp!106540 () Bool)

(assert (=> mapNonEmpty!55910 (= mapRes!55910 (and tp!106540 e!755344))))

(declare-fun mapValue!55910 () ValueCell!17189)

(declare-fun mapRest!55910 () (Array (_ BitVec 32) ValueCell!17189))

(declare-fun mapKey!55910 () (_ BitVec 32))

(assert (=> mapNonEmpty!55910 (= (arr!43148 _values!1337) (store mapRest!55910 mapKey!55910 mapValue!55910))))

(declare-fun b!1324735 () Bool)

(declare-fun res!878956 () Bool)

(assert (=> b!1324735 (=> (not res!878956) (not e!755347))))

(assert (=> b!1324735 (= res!878956 (and (= (size!43699 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43698 _keys!1609) (size!43699 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55910 () Bool)

(assert (=> mapIsEmpty!55910 mapRes!55910))

(declare-fun b!1324736 () Bool)

(declare-fun res!878961 () Bool)

(assert (=> b!1324736 (=> (not res!878961) (not e!755347))))

(assert (=> b!1324736 (= res!878961 (not (= (select (arr!43147 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324737 () Bool)

(declare-fun res!878958 () Bool)

(assert (=> b!1324737 (=> (not res!878958) (not e!755347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89355 (_ BitVec 32)) Bool)

(assert (=> b!1324737 (= res!878958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324738 () Bool)

(declare-fun res!878960 () Bool)

(assert (=> b!1324738 (=> (not res!878960) (not e!755347))))

(declare-fun getCurrentListMap!5560 (array!89355 array!89357 (_ BitVec 32) (_ BitVec 32) V!53337 V!53337 (_ BitVec 32) Int) ListLongMap!21119)

(assert (=> b!1324738 (= res!878960 (contains!8742 (getCurrentListMap!5560 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324739 () Bool)

(declare-fun res!878962 () Bool)

(assert (=> b!1324739 (=> (not res!878962) (not e!755347))))

(assert (=> b!1324739 (= res!878962 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43698 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111922 res!878957) b!1324735))

(assert (= (and b!1324735 res!878956) b!1324737))

(assert (= (and b!1324737 res!878958) b!1324731))

(assert (= (and b!1324731 res!878959) b!1324739))

(assert (= (and b!1324739 res!878962) b!1324738))

(assert (= (and b!1324738 res!878960) b!1324736))

(assert (= (and b!1324736 res!878961) b!1324729))

(assert (= (and b!1324729 res!878955) b!1324734))

(assert (= (and b!1324732 condMapEmpty!55910) mapIsEmpty!55910))

(assert (= (and b!1324732 (not condMapEmpty!55910)) mapNonEmpty!55910))

(get-info :version)

(assert (= (and mapNonEmpty!55910 ((_ is ValueCellFull!17189) mapValue!55910)) b!1324730))

(assert (= (and b!1324732 ((_ is ValueCellFull!17189) mapDefault!55910)) b!1324733))

(assert (= start!111922 b!1324732))

(declare-fun b_lambda!23675 () Bool)

(assert (=> (not b_lambda!23675) (not b!1324734)))

(declare-fun t!44499 () Bool)

(declare-fun tb!11699 () Bool)

(assert (=> (and start!111922 (= defaultEntry!1340 defaultEntry!1340) t!44499) tb!11699))

(declare-fun result!24461 () Bool)

(assert (=> tb!11699 (= result!24461 tp_is_empty!36175)))

(assert (=> b!1324734 t!44499))

(declare-fun b_and!48873 () Bool)

(assert (= b_and!48871 (and (=> t!44499 result!24461) b_and!48873)))

(declare-fun m!1213829 () Bool)

(assert (=> b!1324729 m!1213829))

(assert (=> b!1324729 m!1213829))

(declare-fun m!1213831 () Bool)

(assert (=> b!1324729 m!1213831))

(declare-fun m!1213833 () Bool)

(assert (=> b!1324731 m!1213833))

(declare-fun m!1213835 () Bool)

(assert (=> start!111922 m!1213835))

(declare-fun m!1213837 () Bool)

(assert (=> start!111922 m!1213837))

(declare-fun m!1213839 () Bool)

(assert (=> start!111922 m!1213839))

(declare-fun m!1213841 () Bool)

(assert (=> b!1324737 m!1213841))

(declare-fun m!1213843 () Bool)

(assert (=> b!1324738 m!1213843))

(assert (=> b!1324738 m!1213843))

(declare-fun m!1213845 () Bool)

(assert (=> b!1324738 m!1213845))

(assert (=> b!1324736 m!1213829))

(declare-fun m!1213847 () Bool)

(assert (=> b!1324734 m!1213847))

(declare-fun m!1213849 () Bool)

(assert (=> b!1324734 m!1213849))

(declare-fun m!1213851 () Bool)

(assert (=> b!1324734 m!1213851))

(declare-fun m!1213853 () Bool)

(assert (=> b!1324734 m!1213853))

(declare-fun m!1213855 () Bool)

(assert (=> b!1324734 m!1213855))

(declare-fun m!1213857 () Bool)

(assert (=> b!1324734 m!1213857))

(declare-fun m!1213859 () Bool)

(assert (=> b!1324734 m!1213859))

(declare-fun m!1213861 () Bool)

(assert (=> b!1324734 m!1213861))

(assert (=> b!1324734 m!1213829))

(declare-fun m!1213863 () Bool)

(assert (=> b!1324734 m!1213863))

(declare-fun m!1213865 () Bool)

(assert (=> b!1324734 m!1213865))

(declare-fun m!1213867 () Bool)

(assert (=> b!1324734 m!1213867))

(declare-fun m!1213869 () Bool)

(assert (=> b!1324734 m!1213869))

(declare-fun m!1213871 () Bool)

(assert (=> b!1324734 m!1213871))

(assert (=> b!1324734 m!1213829))

(declare-fun m!1213873 () Bool)

(assert (=> b!1324734 m!1213873))

(assert (=> b!1324734 m!1213859))

(assert (=> b!1324734 m!1213851))

(declare-fun m!1213875 () Bool)

(assert (=> b!1324734 m!1213875))

(declare-fun m!1213877 () Bool)

(assert (=> b!1324734 m!1213877))

(declare-fun m!1213879 () Bool)

(assert (=> b!1324734 m!1213879))

(assert (=> b!1324734 m!1213877))

(declare-fun m!1213881 () Bool)

(assert (=> b!1324734 m!1213881))

(declare-fun m!1213883 () Bool)

(assert (=> mapNonEmpty!55910 m!1213883))

(check-sat tp_is_empty!36175 (not b_next!30355) (not b!1324738) (not b!1324729) (not b_lambda!23675) (not start!111922) (not b!1324734) b_and!48873 (not b!1324731) (not mapNonEmpty!55910) (not b!1324737))
(check-sat b_and!48873 (not b_next!30355))
