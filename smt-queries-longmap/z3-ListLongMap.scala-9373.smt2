; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111674 () Bool)

(assert start!111674)

(declare-fun b_free!30331 () Bool)

(declare-fun b_next!30331 () Bool)

(assert (=> start!111674 (= b_free!30331 (not b_next!30331))))

(declare-fun tp!106470 () Bool)

(declare-fun b_and!48803 () Bool)

(assert (=> start!111674 (= tp!106470 b_and!48803)))

(declare-fun res!878124 () Bool)

(declare-fun e!754287 () Bool)

(assert (=> start!111674 (=> (not res!878124) (not e!754287))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111674 (= res!878124 (validMask!0 mask!2019))))

(assert (=> start!111674 e!754287))

(declare-datatypes ((array!89153 0))(
  ( (array!89154 (arr!43051 (Array (_ BitVec 32) (_ BitVec 64))) (size!43603 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89153)

(declare-fun array_inv!32685 (array!89153) Bool)

(assert (=> start!111674 (array_inv!32685 _keys!1609)))

(assert (=> start!111674 true))

(declare-fun tp_is_empty!36151 () Bool)

(assert (=> start!111674 tp_is_empty!36151))

(declare-datatypes ((V!53305 0))(
  ( (V!53306 (val!18150 Int)) )
))
(declare-datatypes ((ValueCell!17177 0))(
  ( (ValueCellFull!17177 (v!20779 V!53305)) (EmptyCell!17177) )
))
(declare-datatypes ((array!89155 0))(
  ( (array!89156 (arr!43052 (Array (_ BitVec 32) ValueCell!17177)) (size!43604 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89155)

(declare-fun e!754289 () Bool)

(declare-fun array_inv!32686 (array!89155) Bool)

(assert (=> start!111674 (and (array_inv!32686 _values!1337) e!754289)))

(assert (=> start!111674 tp!106470))

(declare-fun b!1322940 () Bool)

(declare-fun res!878122 () Bool)

(assert (=> b!1322940 (=> (not res!878122) (not e!754287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89153 (_ BitVec 32)) Bool)

(assert (=> b!1322940 (= res!878122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55874 () Bool)

(declare-fun mapRes!55874 () Bool)

(assert (=> mapIsEmpty!55874 mapRes!55874))

(declare-fun b!1322941 () Bool)

(declare-fun e!754291 () Bool)

(assert (=> b!1322941 (= e!754289 (and e!754291 mapRes!55874))))

(declare-fun condMapEmpty!55874 () Bool)

(declare-fun mapDefault!55874 () ValueCell!17177)

(assert (=> b!1322941 (= condMapEmpty!55874 (= (arr!43052 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17177)) mapDefault!55874)))))

(declare-fun b!1322942 () Bool)

(assert (=> b!1322942 (= e!754287 (not true))))

(declare-datatypes ((tuple2!23462 0))(
  ( (tuple2!23463 (_1!11742 (_ BitVec 64)) (_2!11742 V!53305)) )
))
(declare-datatypes ((List!30597 0))(
  ( (Nil!30594) (Cons!30593 (h!31802 tuple2!23462) (t!44469 List!30597)) )
))
(declare-datatypes ((ListLongMap!21119 0))(
  ( (ListLongMap!21120 (toList!10575 List!30597)) )
))
(declare-fun lt!588453 () ListLongMap!21119)

(declare-fun minValue!1279 () V!53305)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8658 (ListLongMap!21119 (_ BitVec 64)) Bool)

(declare-fun +!4614 (ListLongMap!21119 tuple2!23462) ListLongMap!21119)

(assert (=> b!1322942 (contains!8658 (+!4614 lt!588453 (tuple2!23463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43411 0))(
  ( (Unit!43412) )
))
(declare-fun lt!588446 () Unit!43411)

(declare-fun addStillContains!1138 (ListLongMap!21119 (_ BitVec 64) V!53305 (_ BitVec 64)) Unit!43411)

(assert (=> b!1322942 (= lt!588446 (addStillContains!1138 lt!588453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1322942 (contains!8658 lt!588453 k0!1164)))

(declare-fun lt!588451 () ListLongMap!21119)

(declare-fun lt!588443 () tuple2!23462)

(assert (=> b!1322942 (= lt!588453 (+!4614 lt!588451 lt!588443))))

(declare-fun zeroValue!1279 () V!53305)

(declare-fun lt!588447 () Unit!43411)

(assert (=> b!1322942 (= lt!588447 (addStillContains!1138 lt!588451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322942 (contains!8658 lt!588451 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588448 () V!53305)

(declare-fun lt!588452 () Unit!43411)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!179 ((_ BitVec 64) (_ BitVec 64) V!53305 ListLongMap!21119) Unit!43411)

(assert (=> b!1322942 (= lt!588452 (lemmaInListMapAfterAddingDiffThenInBefore!179 k0!1164 (select (arr!43051 _keys!1609) from!2000) lt!588448 lt!588451))))

(declare-fun lt!588445 () ListLongMap!21119)

(assert (=> b!1322942 (contains!8658 lt!588445 k0!1164)))

(declare-fun lt!588444 () Unit!43411)

(assert (=> b!1322942 (= lt!588444 (lemmaInListMapAfterAddingDiffThenInBefore!179 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588445))))

(declare-fun lt!588450 () ListLongMap!21119)

(assert (=> b!1322942 (contains!8658 lt!588450 k0!1164)))

(declare-fun lt!588449 () Unit!43411)

(assert (=> b!1322942 (= lt!588449 (lemmaInListMapAfterAddingDiffThenInBefore!179 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588450))))

(assert (=> b!1322942 (= lt!588450 (+!4614 lt!588445 lt!588443))))

(assert (=> b!1322942 (= lt!588443 (tuple2!23463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322942 (= lt!588445 (+!4614 lt!588451 (tuple2!23463 (select (arr!43051 _keys!1609) from!2000) lt!588448)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21683 (ValueCell!17177 V!53305) V!53305)

(declare-fun dynLambda!3544 (Int (_ BitVec 64)) V!53305)

(assert (=> b!1322942 (= lt!588448 (get!21683 (select (arr!43052 _values!1337) from!2000) (dynLambda!3544 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6247 (array!89153 array!89155 (_ BitVec 32) (_ BitVec 32) V!53305 V!53305 (_ BitVec 32) Int) ListLongMap!21119)

(assert (=> b!1322942 (= lt!588451 (getCurrentListMapNoExtraKeys!6247 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55874 () Bool)

(declare-fun tp!106469 () Bool)

(declare-fun e!754288 () Bool)

(assert (=> mapNonEmpty!55874 (= mapRes!55874 (and tp!106469 e!754288))))

(declare-fun mapValue!55874 () ValueCell!17177)

(declare-fun mapKey!55874 () (_ BitVec 32))

(declare-fun mapRest!55874 () (Array (_ BitVec 32) ValueCell!17177))

(assert (=> mapNonEmpty!55874 (= (arr!43052 _values!1337) (store mapRest!55874 mapKey!55874 mapValue!55874))))

(declare-fun b!1322943 () Bool)

(declare-fun res!878126 () Bool)

(assert (=> b!1322943 (=> (not res!878126) (not e!754287))))

(assert (=> b!1322943 (= res!878126 (and (= (size!43604 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43603 _keys!1609) (size!43604 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322944 () Bool)

(assert (=> b!1322944 (= e!754291 tp_is_empty!36151)))

(declare-fun b!1322945 () Bool)

(assert (=> b!1322945 (= e!754288 tp_is_empty!36151)))

(declare-fun b!1322946 () Bool)

(declare-fun res!878127 () Bool)

(assert (=> b!1322946 (=> (not res!878127) (not e!754287))))

(declare-fun getCurrentListMap!5458 (array!89153 array!89155 (_ BitVec 32) (_ BitVec 32) V!53305 V!53305 (_ BitVec 32) Int) ListLongMap!21119)

(assert (=> b!1322946 (= res!878127 (contains!8658 (getCurrentListMap!5458 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322947 () Bool)

(declare-fun res!878125 () Bool)

(assert (=> b!1322947 (=> (not res!878125) (not e!754287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322947 (= res!878125 (validKeyInArray!0 (select (arr!43051 _keys!1609) from!2000)))))

(declare-fun b!1322948 () Bool)

(declare-fun res!878120 () Bool)

(assert (=> b!1322948 (=> (not res!878120) (not e!754287))))

(declare-datatypes ((List!30598 0))(
  ( (Nil!30595) (Cons!30594 (h!31803 (_ BitVec 64)) (t!44470 List!30598)) )
))
(declare-fun arrayNoDuplicates!0 (array!89153 (_ BitVec 32) List!30598) Bool)

(assert (=> b!1322948 (= res!878120 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30595))))

(declare-fun b!1322949 () Bool)

(declare-fun res!878123 () Bool)

(assert (=> b!1322949 (=> (not res!878123) (not e!754287))))

(assert (=> b!1322949 (= res!878123 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43603 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322950 () Bool)

(declare-fun res!878121 () Bool)

(assert (=> b!1322950 (=> (not res!878121) (not e!754287))))

(assert (=> b!1322950 (= res!878121 (not (= (select (arr!43051 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111674 res!878124) b!1322943))

(assert (= (and b!1322943 res!878126) b!1322940))

(assert (= (and b!1322940 res!878122) b!1322948))

(assert (= (and b!1322948 res!878120) b!1322949))

(assert (= (and b!1322949 res!878123) b!1322946))

(assert (= (and b!1322946 res!878127) b!1322950))

(assert (= (and b!1322950 res!878121) b!1322947))

(assert (= (and b!1322947 res!878125) b!1322942))

(assert (= (and b!1322941 condMapEmpty!55874) mapIsEmpty!55874))

(assert (= (and b!1322941 (not condMapEmpty!55874)) mapNonEmpty!55874))

(get-info :version)

(assert (= (and mapNonEmpty!55874 ((_ is ValueCellFull!17177) mapValue!55874)) b!1322945))

(assert (= (and b!1322941 ((_ is ValueCellFull!17177) mapDefault!55874)) b!1322944))

(assert (= start!111674 b!1322941))

(declare-fun b_lambda!23647 () Bool)

(assert (=> (not b_lambda!23647) (not b!1322942)))

(declare-fun t!44468 () Bool)

(declare-fun tb!11675 () Bool)

(assert (=> (and start!111674 (= defaultEntry!1340 defaultEntry!1340) t!44468) tb!11675))

(declare-fun result!24413 () Bool)

(assert (=> tb!11675 (= result!24413 tp_is_empty!36151)))

(assert (=> b!1322942 t!44468))

(declare-fun b_and!48805 () Bool)

(assert (= b_and!48803 (and (=> t!44468 result!24413) b_and!48805)))

(declare-fun m!1211043 () Bool)

(assert (=> b!1322948 m!1211043))

(declare-fun m!1211045 () Bool)

(assert (=> b!1322946 m!1211045))

(assert (=> b!1322946 m!1211045))

(declare-fun m!1211047 () Bool)

(assert (=> b!1322946 m!1211047))

(declare-fun m!1211049 () Bool)

(assert (=> b!1322947 m!1211049))

(assert (=> b!1322947 m!1211049))

(declare-fun m!1211051 () Bool)

(assert (=> b!1322947 m!1211051))

(declare-fun m!1211053 () Bool)

(assert (=> start!111674 m!1211053))

(declare-fun m!1211055 () Bool)

(assert (=> start!111674 m!1211055))

(declare-fun m!1211057 () Bool)

(assert (=> start!111674 m!1211057))

(declare-fun m!1211059 () Bool)

(assert (=> b!1322940 m!1211059))

(declare-fun m!1211061 () Bool)

(assert (=> mapNonEmpty!55874 m!1211061))

(assert (=> b!1322950 m!1211049))

(declare-fun m!1211063 () Bool)

(assert (=> b!1322942 m!1211063))

(declare-fun m!1211065 () Bool)

(assert (=> b!1322942 m!1211065))

(declare-fun m!1211067 () Bool)

(assert (=> b!1322942 m!1211067))

(declare-fun m!1211069 () Bool)

(assert (=> b!1322942 m!1211069))

(declare-fun m!1211071 () Bool)

(assert (=> b!1322942 m!1211071))

(declare-fun m!1211073 () Bool)

(assert (=> b!1322942 m!1211073))

(declare-fun m!1211075 () Bool)

(assert (=> b!1322942 m!1211075))

(declare-fun m!1211077 () Bool)

(assert (=> b!1322942 m!1211077))

(declare-fun m!1211079 () Bool)

(assert (=> b!1322942 m!1211079))

(declare-fun m!1211081 () Bool)

(assert (=> b!1322942 m!1211081))

(declare-fun m!1211083 () Bool)

(assert (=> b!1322942 m!1211083))

(assert (=> b!1322942 m!1211049))

(assert (=> b!1322942 m!1211049))

(declare-fun m!1211085 () Bool)

(assert (=> b!1322942 m!1211085))

(declare-fun m!1211087 () Bool)

(assert (=> b!1322942 m!1211087))

(assert (=> b!1322942 m!1211077))

(declare-fun m!1211089 () Bool)

(assert (=> b!1322942 m!1211089))

(assert (=> b!1322942 m!1211089))

(assert (=> b!1322942 m!1211071))

(declare-fun m!1211091 () Bool)

(assert (=> b!1322942 m!1211091))

(declare-fun m!1211093 () Bool)

(assert (=> b!1322942 m!1211093))

(declare-fun m!1211095 () Bool)

(assert (=> b!1322942 m!1211095))

(declare-fun m!1211097 () Bool)

(assert (=> b!1322942 m!1211097))

(check-sat (not start!111674) (not b!1322948) (not b_lambda!23647) tp_is_empty!36151 (not b!1322942) (not b!1322947) (not b_next!30331) b_and!48805 (not b!1322946) (not b!1322940) (not mapNonEmpty!55874))
(check-sat b_and!48805 (not b_next!30331))
