; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111856 () Bool)

(assert start!111856)

(declare-fun b_free!30289 () Bool)

(declare-fun b_next!30289 () Bool)

(assert (=> start!111856 (= b_free!30289 (not b_next!30289))))

(declare-fun tp!106342 () Bool)

(declare-fun b_and!48739 () Bool)

(assert (=> start!111856 (= tp!106342 b_and!48739)))

(declare-fun mapNonEmpty!55811 () Bool)

(declare-fun mapRes!55811 () Bool)

(declare-fun tp!106343 () Bool)

(declare-fun e!754848 () Bool)

(assert (=> mapNonEmpty!55811 (= mapRes!55811 (and tp!106343 e!754848))))

(declare-datatypes ((V!53249 0))(
  ( (V!53250 (val!18129 Int)) )
))
(declare-datatypes ((ValueCell!17156 0))(
  ( (ValueCellFull!17156 (v!20754 V!53249)) (EmptyCell!17156) )
))
(declare-fun mapRest!55811 () (Array (_ BitVec 32) ValueCell!17156))

(declare-datatypes ((array!89223 0))(
  ( (array!89224 (arr!43081 (Array (_ BitVec 32) ValueCell!17156)) (size!43632 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89223)

(declare-fun mapKey!55811 () (_ BitVec 32))

(declare-fun mapValue!55811 () ValueCell!17156)

(assert (=> mapNonEmpty!55811 (= (arr!43081 _values!1337) (store mapRest!55811 mapKey!55811 mapValue!55811))))

(declare-fun b!1323574 () Bool)

(declare-fun e!754851 () Bool)

(assert (=> b!1323574 (= e!754851 (not true))))

(declare-datatypes ((tuple2!23400 0))(
  ( (tuple2!23401 (_1!11711 (_ BitVec 64)) (_2!11711 V!53249)) )
))
(declare-datatypes ((List!30550 0))(
  ( (Nil!30547) (Cons!30546 (h!31764 tuple2!23400) (t!44380 List!30550)) )
))
(declare-datatypes ((ListLongMap!21065 0))(
  ( (ListLongMap!21066 (toList!10548 List!30550)) )
))
(declare-fun lt!588524 () ListLongMap!21065)

(declare-fun lt!588519 () tuple2!23400)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8715 (ListLongMap!21065 (_ BitVec 64)) Bool)

(declare-fun +!4623 (ListLongMap!21065 tuple2!23400) ListLongMap!21065)

(assert (=> b!1323574 (contains!8715 (+!4623 lt!588524 lt!588519) k0!1164)))

(declare-datatypes ((Unit!43533 0))(
  ( (Unit!43534) )
))
(declare-fun lt!588522 () Unit!43533)

(declare-fun zeroValue!1279 () V!53249)

(declare-fun addStillContains!1135 (ListLongMap!21065 (_ BitVec 64) V!53249 (_ BitVec 64)) Unit!43533)

(assert (=> b!1323574 (= lt!588522 (addStillContains!1135 lt!588524 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323574 (contains!8715 lt!588524 k0!1164)))

(declare-datatypes ((array!89225 0))(
  ( (array!89226 (arr!43082 (Array (_ BitVec 32) (_ BitVec 64))) (size!43633 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89225)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588517 () Unit!43533)

(declare-fun lt!588523 () V!53249)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!178 ((_ BitVec 64) (_ BitVec 64) V!53249 ListLongMap!21065) Unit!43533)

(assert (=> b!1323574 (= lt!588517 (lemmaInListMapAfterAddingDiffThenInBefore!178 k0!1164 (select (arr!43082 _keys!1609) from!2000) lt!588523 lt!588524))))

(declare-fun lt!588518 () ListLongMap!21065)

(assert (=> b!1323574 (contains!8715 lt!588518 k0!1164)))

(declare-fun lt!588516 () Unit!43533)

(assert (=> b!1323574 (= lt!588516 (lemmaInListMapAfterAddingDiffThenInBefore!178 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588518))))

(declare-fun lt!588521 () ListLongMap!21065)

(assert (=> b!1323574 (contains!8715 lt!588521 k0!1164)))

(declare-fun lt!588520 () Unit!43533)

(declare-fun minValue!1279 () V!53249)

(assert (=> b!1323574 (= lt!588520 (lemmaInListMapAfterAddingDiffThenInBefore!178 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588521))))

(assert (=> b!1323574 (= lt!588521 (+!4623 lt!588518 lt!588519))))

(assert (=> b!1323574 (= lt!588519 (tuple2!23401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323574 (= lt!588518 (+!4623 lt!588524 (tuple2!23401 (select (arr!43082 _keys!1609) from!2000) lt!588523)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21714 (ValueCell!17156 V!53249) V!53249)

(declare-fun dynLambda!3577 (Int (_ BitVec 64)) V!53249)

(assert (=> b!1323574 (= lt!588523 (get!21714 (select (arr!43081 _values!1337) from!2000) (dynLambda!3577 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6262 (array!89225 array!89223 (_ BitVec 32) (_ BitVec 32) V!53249 V!53249 (_ BitVec 32) Int) ListLongMap!21065)

(assert (=> b!1323574 (= lt!588524 (getCurrentListMapNoExtraKeys!6262 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323575 () Bool)

(declare-fun res!878165 () Bool)

(assert (=> b!1323575 (=> (not res!878165) (not e!754851))))

(assert (=> b!1323575 (= res!878165 (and (= (size!43632 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43633 _keys!1609) (size!43632 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323576 () Bool)

(declare-fun res!878167 () Bool)

(assert (=> b!1323576 (=> (not res!878167) (not e!754851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89225 (_ BitVec 32)) Bool)

(assert (=> b!1323576 (= res!878167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323577 () Bool)

(declare-fun res!878170 () Bool)

(assert (=> b!1323577 (=> (not res!878170) (not e!754851))))

(declare-datatypes ((List!30551 0))(
  ( (Nil!30548) (Cons!30547 (h!31765 (_ BitVec 64)) (t!44381 List!30551)) )
))
(declare-fun arrayNoDuplicates!0 (array!89225 (_ BitVec 32) List!30551) Bool)

(assert (=> b!1323577 (= res!878170 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30548))))

(declare-fun b!1323578 () Bool)

(declare-fun tp_is_empty!36109 () Bool)

(assert (=> b!1323578 (= e!754848 tp_is_empty!36109)))

(declare-fun b!1323579 () Bool)

(declare-fun res!878166 () Bool)

(assert (=> b!1323579 (=> (not res!878166) (not e!754851))))

(assert (=> b!1323579 (= res!878166 (not (= (select (arr!43082 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323580 () Bool)

(declare-fun res!878163 () Bool)

(assert (=> b!1323580 (=> (not res!878163) (not e!754851))))

(declare-fun getCurrentListMap!5538 (array!89225 array!89223 (_ BitVec 32) (_ BitVec 32) V!53249 V!53249 (_ BitVec 32) Int) ListLongMap!21065)

(assert (=> b!1323580 (= res!878163 (contains!8715 (getCurrentListMap!5538 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55811 () Bool)

(assert (=> mapIsEmpty!55811 mapRes!55811))

(declare-fun b!1323582 () Bool)

(declare-fun e!754849 () Bool)

(declare-fun e!754852 () Bool)

(assert (=> b!1323582 (= e!754849 (and e!754852 mapRes!55811))))

(declare-fun condMapEmpty!55811 () Bool)

(declare-fun mapDefault!55811 () ValueCell!17156)

(assert (=> b!1323582 (= condMapEmpty!55811 (= (arr!43081 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17156)) mapDefault!55811)))))

(declare-fun b!1323583 () Bool)

(declare-fun res!878169 () Bool)

(assert (=> b!1323583 (=> (not res!878169) (not e!754851))))

(assert (=> b!1323583 (= res!878169 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43633 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323584 () Bool)

(assert (=> b!1323584 (= e!754852 tp_is_empty!36109)))

(declare-fun res!878164 () Bool)

(assert (=> start!111856 (=> (not res!878164) (not e!754851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111856 (= res!878164 (validMask!0 mask!2019))))

(assert (=> start!111856 e!754851))

(declare-fun array_inv!32797 (array!89225) Bool)

(assert (=> start!111856 (array_inv!32797 _keys!1609)))

(assert (=> start!111856 true))

(assert (=> start!111856 tp_is_empty!36109))

(declare-fun array_inv!32798 (array!89223) Bool)

(assert (=> start!111856 (and (array_inv!32798 _values!1337) e!754849)))

(assert (=> start!111856 tp!106342))

(declare-fun b!1323581 () Bool)

(declare-fun res!878168 () Bool)

(assert (=> b!1323581 (=> (not res!878168) (not e!754851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323581 (= res!878168 (validKeyInArray!0 (select (arr!43082 _keys!1609) from!2000)))))

(assert (= (and start!111856 res!878164) b!1323575))

(assert (= (and b!1323575 res!878165) b!1323576))

(assert (= (and b!1323576 res!878167) b!1323577))

(assert (= (and b!1323577 res!878170) b!1323583))

(assert (= (and b!1323583 res!878169) b!1323580))

(assert (= (and b!1323580 res!878163) b!1323579))

(assert (= (and b!1323579 res!878166) b!1323581))

(assert (= (and b!1323581 res!878168) b!1323574))

(assert (= (and b!1323582 condMapEmpty!55811) mapIsEmpty!55811))

(assert (= (and b!1323582 (not condMapEmpty!55811)) mapNonEmpty!55811))

(get-info :version)

(assert (= (and mapNonEmpty!55811 ((_ is ValueCellFull!17156) mapValue!55811)) b!1323578))

(assert (= (and b!1323582 ((_ is ValueCellFull!17156) mapDefault!55811)) b!1323584))

(assert (= start!111856 b!1323582))

(declare-fun b_lambda!23609 () Bool)

(assert (=> (not b_lambda!23609) (not b!1323574)))

(declare-fun t!44379 () Bool)

(declare-fun tb!11633 () Bool)

(assert (=> (and start!111856 (= defaultEntry!1340 defaultEntry!1340) t!44379) tb!11633))

(declare-fun result!24329 () Bool)

(assert (=> tb!11633 (= result!24329 tp_is_empty!36109)))

(assert (=> b!1323574 t!44379))

(declare-fun b_and!48741 () Bool)

(assert (= b_and!48739 (and (=> t!44379 result!24329) b_and!48741)))

(declare-fun m!1212089 () Bool)

(assert (=> b!1323574 m!1212089))

(declare-fun m!1212091 () Bool)

(assert (=> b!1323574 m!1212091))

(declare-fun m!1212093 () Bool)

(assert (=> b!1323574 m!1212093))

(declare-fun m!1212095 () Bool)

(assert (=> b!1323574 m!1212095))

(declare-fun m!1212097 () Bool)

(assert (=> b!1323574 m!1212097))

(declare-fun m!1212099 () Bool)

(assert (=> b!1323574 m!1212099))

(assert (=> b!1323574 m!1212091))

(declare-fun m!1212101 () Bool)

(assert (=> b!1323574 m!1212101))

(declare-fun m!1212103 () Bool)

(assert (=> b!1323574 m!1212103))

(declare-fun m!1212105 () Bool)

(assert (=> b!1323574 m!1212105))

(declare-fun m!1212107 () Bool)

(assert (=> b!1323574 m!1212107))

(declare-fun m!1212109 () Bool)

(assert (=> b!1323574 m!1212109))

(declare-fun m!1212111 () Bool)

(assert (=> b!1323574 m!1212111))

(assert (=> b!1323574 m!1212101))

(declare-fun m!1212113 () Bool)

(assert (=> b!1323574 m!1212113))

(declare-fun m!1212115 () Bool)

(assert (=> b!1323574 m!1212115))

(assert (=> b!1323574 m!1212107))

(assert (=> b!1323574 m!1212095))

(declare-fun m!1212117 () Bool)

(assert (=> b!1323574 m!1212117))

(declare-fun m!1212119 () Bool)

(assert (=> b!1323574 m!1212119))

(declare-fun m!1212121 () Bool)

(assert (=> b!1323577 m!1212121))

(assert (=> b!1323579 m!1212101))

(declare-fun m!1212123 () Bool)

(assert (=> mapNonEmpty!55811 m!1212123))

(assert (=> b!1323581 m!1212101))

(assert (=> b!1323581 m!1212101))

(declare-fun m!1212125 () Bool)

(assert (=> b!1323581 m!1212125))

(declare-fun m!1212127 () Bool)

(assert (=> start!111856 m!1212127))

(declare-fun m!1212129 () Bool)

(assert (=> start!111856 m!1212129))

(declare-fun m!1212131 () Bool)

(assert (=> start!111856 m!1212131))

(declare-fun m!1212133 () Bool)

(assert (=> b!1323576 m!1212133))

(declare-fun m!1212135 () Bool)

(assert (=> b!1323580 m!1212135))

(assert (=> b!1323580 m!1212135))

(declare-fun m!1212137 () Bool)

(assert (=> b!1323580 m!1212137))

(check-sat (not b_lambda!23609) b_and!48741 (not b!1323574) (not b!1323580) (not start!111856) (not b!1323581) (not b!1323577) tp_is_empty!36109 (not mapNonEmpty!55811) (not b!1323576) (not b_next!30289))
(check-sat b_and!48741 (not b_next!30289))
