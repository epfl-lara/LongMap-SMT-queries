; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111638 () Bool)

(assert start!111638)

(declare-fun b_free!30295 () Bool)

(declare-fun b_next!30295 () Bool)

(assert (=> start!111638 (= b_free!30295 (not b_next!30295))))

(declare-fun tp!106361 () Bool)

(declare-fun b_and!48731 () Bool)

(assert (=> start!111638 (= tp!106361 b_and!48731)))

(declare-fun b!1322310 () Bool)

(declare-fun res!877689 () Bool)

(declare-fun e!754021 () Bool)

(assert (=> b!1322310 (=> (not res!877689) (not e!754021))))

(declare-datatypes ((array!89083 0))(
  ( (array!89084 (arr!43016 (Array (_ BitVec 32) (_ BitVec 64))) (size!43568 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89083)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322310 (= res!877689 (not (= (select (arr!43016 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322311 () Bool)

(declare-fun res!877694 () Bool)

(assert (=> b!1322311 (=> (not res!877694) (not e!754021))))

(declare-datatypes ((List!30573 0))(
  ( (Nil!30570) (Cons!30569 (h!31778 (_ BitVec 64)) (t!44409 List!30573)) )
))
(declare-fun arrayNoDuplicates!0 (array!89083 (_ BitVec 32) List!30573) Bool)

(assert (=> b!1322311 (= res!877694 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30570))))

(declare-fun b!1322312 () Bool)

(declare-fun res!877693 () Bool)

(assert (=> b!1322312 (=> (not res!877693) (not e!754021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322312 (= res!877693 (validKeyInArray!0 (select (arr!43016 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55820 () Bool)

(declare-fun mapRes!55820 () Bool)

(assert (=> mapIsEmpty!55820 mapRes!55820))

(declare-fun b!1322313 () Bool)

(declare-fun res!877688 () Bool)

(assert (=> b!1322313 (=> (not res!877688) (not e!754021))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322313 (= res!877688 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43568 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322314 () Bool)

(declare-fun res!877692 () Bool)

(assert (=> b!1322314 (=> (not res!877692) (not e!754021))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89083 (_ BitVec 32)) Bool)

(assert (=> b!1322314 (= res!877692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55820 () Bool)

(declare-fun tp!106362 () Bool)

(declare-fun e!754018 () Bool)

(assert (=> mapNonEmpty!55820 (= mapRes!55820 (and tp!106362 e!754018))))

(declare-datatypes ((V!53257 0))(
  ( (V!53258 (val!18132 Int)) )
))
(declare-datatypes ((ValueCell!17159 0))(
  ( (ValueCellFull!17159 (v!20761 V!53257)) (EmptyCell!17159) )
))
(declare-fun mapValue!55820 () ValueCell!17159)

(declare-datatypes ((array!89085 0))(
  ( (array!89086 (arr!43017 (Array (_ BitVec 32) ValueCell!17159)) (size!43569 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89085)

(declare-fun mapKey!55820 () (_ BitVec 32))

(declare-fun mapRest!55820 () (Array (_ BitVec 32) ValueCell!17159))

(assert (=> mapNonEmpty!55820 (= (arr!43017 _values!1337) (store mapRest!55820 mapKey!55820 mapValue!55820))))

(declare-fun b!1322315 () Bool)

(declare-fun res!877691 () Bool)

(assert (=> b!1322315 (=> (not res!877691) (not e!754021))))

(declare-fun zeroValue!1279 () V!53257)

(declare-fun minValue!1279 () V!53257)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23440 0))(
  ( (tuple2!23441 (_1!11731 (_ BitVec 64)) (_2!11731 V!53257)) )
))
(declare-datatypes ((List!30574 0))(
  ( (Nil!30571) (Cons!30570 (h!31779 tuple2!23440) (t!44410 List!30574)) )
))
(declare-datatypes ((ListLongMap!21097 0))(
  ( (ListLongMap!21098 (toList!10564 List!30574)) )
))
(declare-fun contains!8647 (ListLongMap!21097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5447 (array!89083 array!89085 (_ BitVec 32) (_ BitVec 32) V!53257 V!53257 (_ BitVec 32) Int) ListLongMap!21097)

(assert (=> b!1322315 (= res!877691 (contains!8647 (getCurrentListMap!5447 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322316 () Bool)

(assert (=> b!1322316 (= e!754021 (not true))))

(declare-fun lt!587939 () ListLongMap!21097)

(declare-fun lt!587937 () tuple2!23440)

(declare-fun +!4604 (ListLongMap!21097 tuple2!23440) ListLongMap!21097)

(assert (=> b!1322316 (contains!8647 (+!4604 lt!587939 lt!587937) k0!1164)))

(declare-datatypes ((Unit!43391 0))(
  ( (Unit!43392) )
))
(declare-fun lt!587938 () Unit!43391)

(declare-fun addStillContains!1128 (ListLongMap!21097 (_ BitVec 64) V!53257 (_ BitVec 64)) Unit!43391)

(assert (=> b!1322316 (= lt!587938 (addStillContains!1128 lt!587939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322316 (contains!8647 lt!587939 k0!1164)))

(declare-fun lt!587943 () V!53257)

(declare-fun lt!587935 () Unit!43391)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!169 ((_ BitVec 64) (_ BitVec 64) V!53257 ListLongMap!21097) Unit!43391)

(assert (=> b!1322316 (= lt!587935 (lemmaInListMapAfterAddingDiffThenInBefore!169 k0!1164 (select (arr!43016 _keys!1609) from!2000) lt!587943 lt!587939))))

(declare-fun lt!587942 () ListLongMap!21097)

(assert (=> b!1322316 (contains!8647 lt!587942 k0!1164)))

(declare-fun lt!587940 () Unit!43391)

(assert (=> b!1322316 (= lt!587940 (lemmaInListMapAfterAddingDiffThenInBefore!169 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587942))))

(declare-fun lt!587936 () ListLongMap!21097)

(assert (=> b!1322316 (contains!8647 lt!587936 k0!1164)))

(declare-fun lt!587941 () Unit!43391)

(assert (=> b!1322316 (= lt!587941 (lemmaInListMapAfterAddingDiffThenInBefore!169 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587936))))

(assert (=> b!1322316 (= lt!587936 (+!4604 lt!587942 lt!587937))))

(assert (=> b!1322316 (= lt!587937 (tuple2!23441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322316 (= lt!587942 (+!4604 lt!587939 (tuple2!23441 (select (arr!43016 _keys!1609) from!2000) lt!587943)))))

(declare-fun get!21661 (ValueCell!17159 V!53257) V!53257)

(declare-fun dynLambda!3534 (Int (_ BitVec 64)) V!53257)

(assert (=> b!1322316 (= lt!587943 (get!21661 (select (arr!43017 _values!1337) from!2000) (dynLambda!3534 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6237 (array!89083 array!89085 (_ BitVec 32) (_ BitVec 32) V!53257 V!53257 (_ BitVec 32) Int) ListLongMap!21097)

(assert (=> b!1322316 (= lt!587939 (getCurrentListMapNoExtraKeys!6237 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322317 () Bool)

(declare-fun e!754020 () Bool)

(declare-fun tp_is_empty!36115 () Bool)

(assert (=> b!1322317 (= e!754020 tp_is_empty!36115)))

(declare-fun res!877690 () Bool)

(assert (=> start!111638 (=> (not res!877690) (not e!754021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111638 (= res!877690 (validMask!0 mask!2019))))

(assert (=> start!111638 e!754021))

(declare-fun array_inv!32659 (array!89083) Bool)

(assert (=> start!111638 (array_inv!32659 _keys!1609)))

(assert (=> start!111638 true))

(assert (=> start!111638 tp_is_empty!36115))

(declare-fun e!754019 () Bool)

(declare-fun array_inv!32660 (array!89085) Bool)

(assert (=> start!111638 (and (array_inv!32660 _values!1337) e!754019)))

(assert (=> start!111638 tp!106361))

(declare-fun b!1322318 () Bool)

(assert (=> b!1322318 (= e!754018 tp_is_empty!36115)))

(declare-fun b!1322319 () Bool)

(assert (=> b!1322319 (= e!754019 (and e!754020 mapRes!55820))))

(declare-fun condMapEmpty!55820 () Bool)

(declare-fun mapDefault!55820 () ValueCell!17159)

(assert (=> b!1322319 (= condMapEmpty!55820 (= (arr!43017 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17159)) mapDefault!55820)))))

(declare-fun b!1322320 () Bool)

(declare-fun res!877695 () Bool)

(assert (=> b!1322320 (=> (not res!877695) (not e!754021))))

(assert (=> b!1322320 (= res!877695 (and (= (size!43569 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43568 _keys!1609) (size!43569 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111638 res!877690) b!1322320))

(assert (= (and b!1322320 res!877695) b!1322314))

(assert (= (and b!1322314 res!877692) b!1322311))

(assert (= (and b!1322311 res!877694) b!1322313))

(assert (= (and b!1322313 res!877688) b!1322315))

(assert (= (and b!1322315 res!877691) b!1322310))

(assert (= (and b!1322310 res!877689) b!1322312))

(assert (= (and b!1322312 res!877693) b!1322316))

(assert (= (and b!1322319 condMapEmpty!55820) mapIsEmpty!55820))

(assert (= (and b!1322319 (not condMapEmpty!55820)) mapNonEmpty!55820))

(get-info :version)

(assert (= (and mapNonEmpty!55820 ((_ is ValueCellFull!17159) mapValue!55820)) b!1322318))

(assert (= (and b!1322319 ((_ is ValueCellFull!17159) mapDefault!55820)) b!1322317))

(assert (= start!111638 b!1322319))

(declare-fun b_lambda!23611 () Bool)

(assert (=> (not b_lambda!23611) (not b!1322316)))

(declare-fun t!44408 () Bool)

(declare-fun tb!11639 () Bool)

(assert (=> (and start!111638 (= defaultEntry!1340 defaultEntry!1340) t!44408) tb!11639))

(declare-fun result!24341 () Bool)

(assert (=> tb!11639 (= result!24341 tp_is_empty!36115)))

(assert (=> b!1322316 t!44408))

(declare-fun b_and!48733 () Bool)

(assert (= b_and!48731 (and (=> t!44408 result!24341) b_and!48733)))

(declare-fun m!1210125 () Bool)

(assert (=> b!1322316 m!1210125))

(declare-fun m!1210127 () Bool)

(assert (=> b!1322316 m!1210127))

(declare-fun m!1210129 () Bool)

(assert (=> b!1322316 m!1210129))

(declare-fun m!1210131 () Bool)

(assert (=> b!1322316 m!1210131))

(declare-fun m!1210133 () Bool)

(assert (=> b!1322316 m!1210133))

(declare-fun m!1210135 () Bool)

(assert (=> b!1322316 m!1210135))

(declare-fun m!1210137 () Bool)

(assert (=> b!1322316 m!1210137))

(declare-fun m!1210139 () Bool)

(assert (=> b!1322316 m!1210139))

(assert (=> b!1322316 m!1210133))

(assert (=> b!1322316 m!1210129))

(declare-fun m!1210141 () Bool)

(assert (=> b!1322316 m!1210141))

(declare-fun m!1210143 () Bool)

(assert (=> b!1322316 m!1210143))

(declare-fun m!1210145 () Bool)

(assert (=> b!1322316 m!1210145))

(declare-fun m!1210147 () Bool)

(assert (=> b!1322316 m!1210147))

(declare-fun m!1210149 () Bool)

(assert (=> b!1322316 m!1210149))

(assert (=> b!1322316 m!1210143))

(declare-fun m!1210151 () Bool)

(assert (=> b!1322316 m!1210151))

(declare-fun m!1210153 () Bool)

(assert (=> b!1322316 m!1210153))

(declare-fun m!1210155 () Bool)

(assert (=> b!1322316 m!1210155))

(assert (=> b!1322316 m!1210135))

(declare-fun m!1210157 () Bool)

(assert (=> b!1322314 m!1210157))

(declare-fun m!1210159 () Bool)

(assert (=> mapNonEmpty!55820 m!1210159))

(assert (=> b!1322310 m!1210143))

(declare-fun m!1210161 () Bool)

(assert (=> b!1322311 m!1210161))

(assert (=> b!1322312 m!1210143))

(assert (=> b!1322312 m!1210143))

(declare-fun m!1210163 () Bool)

(assert (=> b!1322312 m!1210163))

(declare-fun m!1210165 () Bool)

(assert (=> b!1322315 m!1210165))

(assert (=> b!1322315 m!1210165))

(declare-fun m!1210167 () Bool)

(assert (=> b!1322315 m!1210167))

(declare-fun m!1210169 () Bool)

(assert (=> start!111638 m!1210169))

(declare-fun m!1210171 () Bool)

(assert (=> start!111638 m!1210171))

(declare-fun m!1210173 () Bool)

(assert (=> start!111638 m!1210173))

(check-sat (not b!1322312) (not b_lambda!23611) (not b!1322316) (not start!111638) tp_is_empty!36115 b_and!48733 (not b!1322311) (not mapNonEmpty!55820) (not b!1322314) (not b!1322315) (not b_next!30295))
(check-sat b_and!48733 (not b_next!30295))
