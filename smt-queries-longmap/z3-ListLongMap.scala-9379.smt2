; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111710 () Bool)

(assert start!111710)

(declare-fun b_free!30367 () Bool)

(declare-fun b_next!30367 () Bool)

(assert (=> start!111710 (= b_free!30367 (not b_next!30367))))

(declare-fun tp!106577 () Bool)

(declare-fun b_and!48875 () Bool)

(assert (=> start!111710 (= tp!106577 b_and!48875)))

(declare-fun b!1323570 () Bool)

(declare-fun res!878552 () Bool)

(declare-fun e!754561 () Bool)

(assert (=> b!1323570 (=> (not res!878552) (not e!754561))))

(declare-datatypes ((array!89223 0))(
  ( (array!89224 (arr!43086 (Array (_ BitVec 32) (_ BitVec 64))) (size!43638 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89223)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53353 0))(
  ( (V!53354 (val!18168 Int)) )
))
(declare-fun zeroValue!1279 () V!53353)

(declare-datatypes ((ValueCell!17195 0))(
  ( (ValueCellFull!17195 (v!20797 V!53353)) (EmptyCell!17195) )
))
(declare-datatypes ((array!89225 0))(
  ( (array!89226 (arr!43087 (Array (_ BitVec 32) ValueCell!17195)) (size!43639 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89225)

(declare-fun minValue!1279 () V!53353)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23490 0))(
  ( (tuple2!23491 (_1!11756 (_ BitVec 64)) (_2!11756 V!53353)) )
))
(declare-datatypes ((List!30622 0))(
  ( (Nil!30619) (Cons!30618 (h!31827 tuple2!23490) (t!44530 List!30622)) )
))
(declare-datatypes ((ListLongMap!21147 0))(
  ( (ListLongMap!21148 (toList!10589 List!30622)) )
))
(declare-fun contains!8672 (ListLongMap!21147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5469 (array!89223 array!89225 (_ BitVec 32) (_ BitVec 32) V!53353 V!53353 (_ BitVec 32) Int) ListLongMap!21147)

(assert (=> b!1323570 (= res!878552 (contains!8672 (getCurrentListMap!5469 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323571 () Bool)

(declare-fun res!878559 () Bool)

(assert (=> b!1323571 (=> (not res!878559) (not e!754561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323571 (= res!878559 (validKeyInArray!0 (select (arr!43086 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55928 () Bool)

(declare-fun mapRes!55928 () Bool)

(declare-fun tp!106578 () Bool)

(declare-fun e!754558 () Bool)

(assert (=> mapNonEmpty!55928 (= mapRes!55928 (and tp!106578 e!754558))))

(declare-fun mapRest!55928 () (Array (_ BitVec 32) ValueCell!17195))

(declare-fun mapKey!55928 () (_ BitVec 32))

(declare-fun mapValue!55928 () ValueCell!17195)

(assert (=> mapNonEmpty!55928 (= (arr!43087 _values!1337) (store mapRest!55928 mapKey!55928 mapValue!55928))))

(declare-fun b!1323572 () Bool)

(declare-fun tp_is_empty!36187 () Bool)

(assert (=> b!1323572 (= e!754558 tp_is_empty!36187)))

(declare-fun b!1323573 () Bool)

(declare-fun res!878557 () Bool)

(assert (=> b!1323573 (=> (not res!878557) (not e!754561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89223 (_ BitVec 32)) Bool)

(assert (=> b!1323573 (= res!878557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55928 () Bool)

(assert (=> mapIsEmpty!55928 mapRes!55928))

(declare-fun b!1323574 () Bool)

(declare-fun res!878554 () Bool)

(assert (=> b!1323574 (=> (not res!878554) (not e!754561))))

(assert (=> b!1323574 (= res!878554 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43638 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323575 () Bool)

(declare-fun res!878556 () Bool)

(assert (=> b!1323575 (=> (not res!878556) (not e!754561))))

(declare-datatypes ((List!30623 0))(
  ( (Nil!30620) (Cons!30619 (h!31828 (_ BitVec 64)) (t!44531 List!30623)) )
))
(declare-fun arrayNoDuplicates!0 (array!89223 (_ BitVec 32) List!30623) Bool)

(assert (=> b!1323575 (= res!878556 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30620))))

(declare-fun b!1323576 () Bool)

(declare-fun res!878555 () Bool)

(assert (=> b!1323576 (=> (not res!878555) (not e!754561))))

(assert (=> b!1323576 (= res!878555 (not (= (select (arr!43086 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323577 () Bool)

(declare-fun res!878558 () Bool)

(assert (=> b!1323577 (=> (not res!878558) (not e!754561))))

(assert (=> b!1323577 (= res!878558 (and (= (size!43639 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43638 _keys!1609) (size!43639 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323579 () Bool)

(declare-fun e!754560 () Bool)

(declare-fun e!754557 () Bool)

(assert (=> b!1323579 (= e!754560 (and e!754557 mapRes!55928))))

(declare-fun condMapEmpty!55928 () Bool)

(declare-fun mapDefault!55928 () ValueCell!17195)

(assert (=> b!1323579 (= condMapEmpty!55928 (= (arr!43087 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17195)) mapDefault!55928)))))

(declare-fun b!1323580 () Bool)

(assert (=> b!1323580 (= e!754561 (not true))))

(declare-fun lt!589046 () ListLongMap!21147)

(declare-fun +!4626 (ListLongMap!21147 tuple2!23490) ListLongMap!21147)

(assert (=> b!1323580 (contains!8672 (+!4626 lt!589046 (tuple2!23491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43435 0))(
  ( (Unit!43436) )
))
(declare-fun lt!589041 () Unit!43435)

(declare-fun addStillContains!1150 (ListLongMap!21147 (_ BitVec 64) V!53353 (_ BitVec 64)) Unit!43435)

(assert (=> b!1323580 (= lt!589041 (addStillContains!1150 lt!589046 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323580 (contains!8672 lt!589046 k0!1164)))

(declare-fun lt!589045 () ListLongMap!21147)

(declare-fun lt!589042 () tuple2!23490)

(assert (=> b!1323580 (= lt!589046 (+!4626 lt!589045 lt!589042))))

(declare-fun lt!589043 () Unit!43435)

(assert (=> b!1323580 (= lt!589043 (addStillContains!1150 lt!589045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323580 (contains!8672 lt!589045 k0!1164)))

(declare-fun lt!589047 () Unit!43435)

(declare-fun lt!589040 () V!53353)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!191 ((_ BitVec 64) (_ BitVec 64) V!53353 ListLongMap!21147) Unit!43435)

(assert (=> b!1323580 (= lt!589047 (lemmaInListMapAfterAddingDiffThenInBefore!191 k0!1164 (select (arr!43086 _keys!1609) from!2000) lt!589040 lt!589045))))

(declare-fun lt!589037 () ListLongMap!21147)

(assert (=> b!1323580 (contains!8672 lt!589037 k0!1164)))

(declare-fun lt!589044 () Unit!43435)

(assert (=> b!1323580 (= lt!589044 (lemmaInListMapAfterAddingDiffThenInBefore!191 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589037))))

(declare-fun lt!589039 () ListLongMap!21147)

(assert (=> b!1323580 (contains!8672 lt!589039 k0!1164)))

(declare-fun lt!589038 () Unit!43435)

(assert (=> b!1323580 (= lt!589038 (lemmaInListMapAfterAddingDiffThenInBefore!191 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589039))))

(assert (=> b!1323580 (= lt!589039 (+!4626 lt!589037 lt!589042))))

(assert (=> b!1323580 (= lt!589042 (tuple2!23491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323580 (= lt!589037 (+!4626 lt!589045 (tuple2!23491 (select (arr!43086 _keys!1609) from!2000) lt!589040)))))

(declare-fun get!21707 (ValueCell!17195 V!53353) V!53353)

(declare-fun dynLambda!3556 (Int (_ BitVec 64)) V!53353)

(assert (=> b!1323580 (= lt!589040 (get!21707 (select (arr!43087 _values!1337) from!2000) (dynLambda!3556 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6259 (array!89223 array!89225 (_ BitVec 32) (_ BitVec 32) V!53353 V!53353 (_ BitVec 32) Int) ListLongMap!21147)

(assert (=> b!1323580 (= lt!589045 (getCurrentListMapNoExtraKeys!6259 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!878553 () Bool)

(assert (=> start!111710 (=> (not res!878553) (not e!754561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111710 (= res!878553 (validMask!0 mask!2019))))

(assert (=> start!111710 e!754561))

(declare-fun array_inv!32711 (array!89223) Bool)

(assert (=> start!111710 (array_inv!32711 _keys!1609)))

(assert (=> start!111710 true))

(assert (=> start!111710 tp_is_empty!36187))

(declare-fun array_inv!32712 (array!89225) Bool)

(assert (=> start!111710 (and (array_inv!32712 _values!1337) e!754560)))

(assert (=> start!111710 tp!106577))

(declare-fun b!1323578 () Bool)

(assert (=> b!1323578 (= e!754557 tp_is_empty!36187)))

(assert (= (and start!111710 res!878553) b!1323577))

(assert (= (and b!1323577 res!878558) b!1323573))

(assert (= (and b!1323573 res!878557) b!1323575))

(assert (= (and b!1323575 res!878556) b!1323574))

(assert (= (and b!1323574 res!878554) b!1323570))

(assert (= (and b!1323570 res!878552) b!1323576))

(assert (= (and b!1323576 res!878555) b!1323571))

(assert (= (and b!1323571 res!878559) b!1323580))

(assert (= (and b!1323579 condMapEmpty!55928) mapIsEmpty!55928))

(assert (= (and b!1323579 (not condMapEmpty!55928)) mapNonEmpty!55928))

(get-info :version)

(assert (= (and mapNonEmpty!55928 ((_ is ValueCellFull!17195) mapValue!55928)) b!1323572))

(assert (= (and b!1323579 ((_ is ValueCellFull!17195) mapDefault!55928)) b!1323578))

(assert (= start!111710 b!1323579))

(declare-fun b_lambda!23683 () Bool)

(assert (=> (not b_lambda!23683) (not b!1323580)))

(declare-fun t!44529 () Bool)

(declare-fun tb!11711 () Bool)

(assert (=> (and start!111710 (= defaultEntry!1340 defaultEntry!1340) t!44529) tb!11711))

(declare-fun result!24485 () Bool)

(assert (=> tb!11711 (= result!24485 tp_is_empty!36187)))

(assert (=> b!1323580 t!44529))

(declare-fun b_and!48877 () Bool)

(assert (= b_and!48875 (and (=> t!44529 result!24485) b_and!48877)))

(declare-fun m!1212051 () Bool)

(assert (=> start!111710 m!1212051))

(declare-fun m!1212053 () Bool)

(assert (=> start!111710 m!1212053))

(declare-fun m!1212055 () Bool)

(assert (=> start!111710 m!1212055))

(declare-fun m!1212057 () Bool)

(assert (=> b!1323576 m!1212057))

(declare-fun m!1212059 () Bool)

(assert (=> mapNonEmpty!55928 m!1212059))

(declare-fun m!1212061 () Bool)

(assert (=> b!1323573 m!1212061))

(declare-fun m!1212063 () Bool)

(assert (=> b!1323570 m!1212063))

(assert (=> b!1323570 m!1212063))

(declare-fun m!1212065 () Bool)

(assert (=> b!1323570 m!1212065))

(declare-fun m!1212067 () Bool)

(assert (=> b!1323580 m!1212067))

(declare-fun m!1212069 () Bool)

(assert (=> b!1323580 m!1212069))

(declare-fun m!1212071 () Bool)

(assert (=> b!1323580 m!1212071))

(declare-fun m!1212073 () Bool)

(assert (=> b!1323580 m!1212073))

(declare-fun m!1212075 () Bool)

(assert (=> b!1323580 m!1212075))

(assert (=> b!1323580 m!1212057))

(declare-fun m!1212077 () Bool)

(assert (=> b!1323580 m!1212077))

(declare-fun m!1212079 () Bool)

(assert (=> b!1323580 m!1212079))

(declare-fun m!1212081 () Bool)

(assert (=> b!1323580 m!1212081))

(declare-fun m!1212083 () Bool)

(assert (=> b!1323580 m!1212083))

(declare-fun m!1212085 () Bool)

(assert (=> b!1323580 m!1212085))

(declare-fun m!1212087 () Bool)

(assert (=> b!1323580 m!1212087))

(declare-fun m!1212089 () Bool)

(assert (=> b!1323580 m!1212089))

(assert (=> b!1323580 m!1212057))

(declare-fun m!1212091 () Bool)

(assert (=> b!1323580 m!1212091))

(declare-fun m!1212093 () Bool)

(assert (=> b!1323580 m!1212093))

(declare-fun m!1212095 () Bool)

(assert (=> b!1323580 m!1212095))

(assert (=> b!1323580 m!1212073))

(assert (=> b!1323580 m!1212089))

(declare-fun m!1212097 () Bool)

(assert (=> b!1323580 m!1212097))

(declare-fun m!1212099 () Bool)

(assert (=> b!1323580 m!1212099))

(assert (=> b!1323580 m!1212067))

(declare-fun m!1212101 () Bool)

(assert (=> b!1323580 m!1212101))

(assert (=> b!1323571 m!1212057))

(assert (=> b!1323571 m!1212057))

(declare-fun m!1212103 () Bool)

(assert (=> b!1323571 m!1212103))

(declare-fun m!1212105 () Bool)

(assert (=> b!1323575 m!1212105))

(check-sat tp_is_empty!36187 (not b!1323571) b_and!48877 (not b_lambda!23683) (not b!1323575) (not b!1323570) (not mapNonEmpty!55928) (not b!1323580) (not start!111710) (not b!1323573) (not b_next!30367))
(check-sat b_and!48877 (not b_next!30367))
