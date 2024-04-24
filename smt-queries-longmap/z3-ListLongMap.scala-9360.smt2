; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111820 () Bool)

(assert start!111820)

(declare-fun b_free!30253 () Bool)

(declare-fun b_next!30253 () Bool)

(assert (=> start!111820 (= b_free!30253 (not b_next!30253))))

(declare-fun tp!106234 () Bool)

(declare-fun b_and!48667 () Bool)

(assert (=> start!111820 (= tp!106234 b_and!48667)))

(declare-fun b!1322944 () Bool)

(declare-fun e!754581 () Bool)

(declare-fun tp_is_empty!36073 () Bool)

(assert (=> b!1322944 (= e!754581 tp_is_empty!36073)))

(declare-fun b!1322945 () Bool)

(declare-fun res!877736 () Bool)

(declare-fun e!754579 () Bool)

(assert (=> b!1322945 (=> (not res!877736) (not e!754579))))

(declare-datatypes ((array!89151 0))(
  ( (array!89152 (arr!43045 (Array (_ BitVec 32) (_ BitVec 64))) (size!43596 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89151)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322945 (= res!877736 (validKeyInArray!0 (select (arr!43045 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55757 () Bool)

(declare-fun mapRes!55757 () Bool)

(assert (=> mapIsEmpty!55757 mapRes!55757))

(declare-fun b!1322946 () Bool)

(declare-fun res!877735 () Bool)

(assert (=> b!1322946 (=> (not res!877735) (not e!754579))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53201 0))(
  ( (V!53202 (val!18111 Int)) )
))
(declare-fun zeroValue!1279 () V!53201)

(declare-datatypes ((ValueCell!17138 0))(
  ( (ValueCellFull!17138 (v!20736 V!53201)) (EmptyCell!17138) )
))
(declare-datatypes ((array!89153 0))(
  ( (array!89154 (arr!43046 (Array (_ BitVec 32) ValueCell!17138)) (size!43597 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89153)

(declare-fun minValue!1279 () V!53201)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23370 0))(
  ( (tuple2!23371 (_1!11696 (_ BitVec 64)) (_2!11696 V!53201)) )
))
(declare-datatypes ((List!30521 0))(
  ( (Nil!30518) (Cons!30517 (h!31735 tuple2!23370) (t!44315 List!30521)) )
))
(declare-datatypes ((ListLongMap!21035 0))(
  ( (ListLongMap!21036 (toList!10533 List!30521)) )
))
(declare-fun contains!8700 (ListLongMap!21035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5525 (array!89151 array!89153 (_ BitVec 32) (_ BitVec 32) V!53201 V!53201 (_ BitVec 32) Int) ListLongMap!21035)

(assert (=> b!1322946 (= res!877735 (contains!8700 (getCurrentListMap!5525 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55757 () Bool)

(declare-fun tp!106235 () Bool)

(assert (=> mapNonEmpty!55757 (= mapRes!55757 (and tp!106235 e!754581))))

(declare-fun mapRest!55757 () (Array (_ BitVec 32) ValueCell!17138))

(declare-fun mapValue!55757 () ValueCell!17138)

(declare-fun mapKey!55757 () (_ BitVec 32))

(assert (=> mapNonEmpty!55757 (= (arr!43046 _values!1337) (store mapRest!55757 mapKey!55757 mapValue!55757))))

(declare-fun b!1322947 () Bool)

(declare-fun e!754578 () Bool)

(assert (=> b!1322947 (= e!754578 tp_is_empty!36073)))

(declare-fun res!877733 () Bool)

(assert (=> start!111820 (=> (not res!877733) (not e!754579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111820 (= res!877733 (validMask!0 mask!2019))))

(assert (=> start!111820 e!754579))

(declare-fun array_inv!32773 (array!89151) Bool)

(assert (=> start!111820 (array_inv!32773 _keys!1609)))

(assert (=> start!111820 true))

(assert (=> start!111820 tp_is_empty!36073))

(declare-fun e!754580 () Bool)

(declare-fun array_inv!32774 (array!89153) Bool)

(assert (=> start!111820 (and (array_inv!32774 _values!1337) e!754580)))

(assert (=> start!111820 tp!106234))

(declare-fun b!1322948 () Bool)

(declare-fun res!877731 () Bool)

(assert (=> b!1322948 (=> (not res!877731) (not e!754579))))

(assert (=> b!1322948 (= res!877731 (not (= (select (arr!43045 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322949 () Bool)

(declare-fun res!877737 () Bool)

(assert (=> b!1322949 (=> (not res!877737) (not e!754579))))

(assert (=> b!1322949 (= res!877737 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43596 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322950 () Bool)

(declare-fun res!877734 () Bool)

(assert (=> b!1322950 (=> (not res!877734) (not e!754579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89151 (_ BitVec 32)) Bool)

(assert (=> b!1322950 (= res!877734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322951 () Bool)

(declare-fun res!877738 () Bool)

(assert (=> b!1322951 (=> (not res!877738) (not e!754579))))

(declare-datatypes ((List!30522 0))(
  ( (Nil!30519) (Cons!30518 (h!31736 (_ BitVec 64)) (t!44316 List!30522)) )
))
(declare-fun arrayNoDuplicates!0 (array!89151 (_ BitVec 32) List!30522) Bool)

(assert (=> b!1322951 (= res!877738 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30519))))

(declare-fun b!1322952 () Bool)

(assert (=> b!1322952 (= e!754579 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!588064 () ListLongMap!21035)

(assert (=> b!1322952 (contains!8700 lt!588064 k0!1164)))

(declare-datatypes ((Unit!43507 0))(
  ( (Unit!43508) )
))
(declare-fun lt!588066 () Unit!43507)

(declare-fun lt!588068 () V!53201)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!165 ((_ BitVec 64) (_ BitVec 64) V!53201 ListLongMap!21035) Unit!43507)

(assert (=> b!1322952 (= lt!588066 (lemmaInListMapAfterAddingDiffThenInBefore!165 k0!1164 (select (arr!43045 _keys!1609) from!2000) lt!588068 lt!588064))))

(declare-fun lt!588063 () ListLongMap!21035)

(assert (=> b!1322952 (contains!8700 lt!588063 k0!1164)))

(declare-fun lt!588067 () Unit!43507)

(assert (=> b!1322952 (= lt!588067 (lemmaInListMapAfterAddingDiffThenInBefore!165 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588063))))

(declare-fun lt!588065 () ListLongMap!21035)

(assert (=> b!1322952 (contains!8700 lt!588065 k0!1164)))

(declare-fun lt!588062 () Unit!43507)

(assert (=> b!1322952 (= lt!588062 (lemmaInListMapAfterAddingDiffThenInBefore!165 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588065))))

(declare-fun +!4610 (ListLongMap!21035 tuple2!23370) ListLongMap!21035)

(assert (=> b!1322952 (= lt!588065 (+!4610 lt!588063 (tuple2!23371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322952 (= lt!588063 (+!4610 lt!588064 (tuple2!23371 (select (arr!43045 _keys!1609) from!2000) lt!588068)))))

(declare-fun get!21689 (ValueCell!17138 V!53201) V!53201)

(declare-fun dynLambda!3564 (Int (_ BitVec 64)) V!53201)

(assert (=> b!1322952 (= lt!588068 (get!21689 (select (arr!43046 _values!1337) from!2000) (dynLambda!3564 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6249 (array!89151 array!89153 (_ BitVec 32) (_ BitVec 32) V!53201 V!53201 (_ BitVec 32) Int) ListLongMap!21035)

(assert (=> b!1322952 (= lt!588064 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322953 () Bool)

(declare-fun res!877732 () Bool)

(assert (=> b!1322953 (=> (not res!877732) (not e!754579))))

(assert (=> b!1322953 (= res!877732 (and (= (size!43597 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43596 _keys!1609) (size!43597 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322954 () Bool)

(assert (=> b!1322954 (= e!754580 (and e!754578 mapRes!55757))))

(declare-fun condMapEmpty!55757 () Bool)

(declare-fun mapDefault!55757 () ValueCell!17138)

(assert (=> b!1322954 (= condMapEmpty!55757 (= (arr!43046 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17138)) mapDefault!55757)))))

(assert (= (and start!111820 res!877733) b!1322953))

(assert (= (and b!1322953 res!877732) b!1322950))

(assert (= (and b!1322950 res!877734) b!1322951))

(assert (= (and b!1322951 res!877738) b!1322949))

(assert (= (and b!1322949 res!877737) b!1322946))

(assert (= (and b!1322946 res!877735) b!1322948))

(assert (= (and b!1322948 res!877731) b!1322945))

(assert (= (and b!1322945 res!877736) b!1322952))

(assert (= (and b!1322954 condMapEmpty!55757) mapIsEmpty!55757))

(assert (= (and b!1322954 (not condMapEmpty!55757)) mapNonEmpty!55757))

(get-info :version)

(assert (= (and mapNonEmpty!55757 ((_ is ValueCellFull!17138) mapValue!55757)) b!1322944))

(assert (= (and b!1322954 ((_ is ValueCellFull!17138) mapDefault!55757)) b!1322947))

(assert (= start!111820 b!1322954))

(declare-fun b_lambda!23573 () Bool)

(assert (=> (not b_lambda!23573) (not b!1322952)))

(declare-fun t!44314 () Bool)

(declare-fun tb!11597 () Bool)

(assert (=> (and start!111820 (= defaultEntry!1340 defaultEntry!1340) t!44314) tb!11597))

(declare-fun result!24257 () Bool)

(assert (=> tb!11597 (= result!24257 tp_is_empty!36073)))

(assert (=> b!1322952 t!44314))

(declare-fun b_and!48669 () Bool)

(assert (= b_and!48667 (and (=> t!44314 result!24257) b_and!48669)))

(declare-fun m!1211225 () Bool)

(assert (=> b!1322952 m!1211225))

(declare-fun m!1211227 () Bool)

(assert (=> b!1322952 m!1211227))

(declare-fun m!1211229 () Bool)

(assert (=> b!1322952 m!1211229))

(declare-fun m!1211231 () Bool)

(assert (=> b!1322952 m!1211231))

(declare-fun m!1211233 () Bool)

(assert (=> b!1322952 m!1211233))

(declare-fun m!1211235 () Bool)

(assert (=> b!1322952 m!1211235))

(declare-fun m!1211237 () Bool)

(assert (=> b!1322952 m!1211237))

(assert (=> b!1322952 m!1211237))

(assert (=> b!1322952 m!1211229))

(declare-fun m!1211239 () Bool)

(assert (=> b!1322952 m!1211239))

(declare-fun m!1211241 () Bool)

(assert (=> b!1322952 m!1211241))

(declare-fun m!1211243 () Bool)

(assert (=> b!1322952 m!1211243))

(declare-fun m!1211245 () Bool)

(assert (=> b!1322952 m!1211245))

(assert (=> b!1322952 m!1211241))

(declare-fun m!1211247 () Bool)

(assert (=> b!1322952 m!1211247))

(declare-fun m!1211249 () Bool)

(assert (=> b!1322952 m!1211249))

(declare-fun m!1211251 () Bool)

(assert (=> b!1322950 m!1211251))

(assert (=> b!1322948 m!1211241))

(assert (=> b!1322945 m!1211241))

(assert (=> b!1322945 m!1211241))

(declare-fun m!1211253 () Bool)

(assert (=> b!1322945 m!1211253))

(declare-fun m!1211255 () Bool)

(assert (=> mapNonEmpty!55757 m!1211255))

(declare-fun m!1211257 () Bool)

(assert (=> b!1322951 m!1211257))

(declare-fun m!1211259 () Bool)

(assert (=> b!1322946 m!1211259))

(assert (=> b!1322946 m!1211259))

(declare-fun m!1211261 () Bool)

(assert (=> b!1322946 m!1211261))

(declare-fun m!1211263 () Bool)

(assert (=> start!111820 m!1211263))

(declare-fun m!1211265 () Bool)

(assert (=> start!111820 m!1211265))

(declare-fun m!1211267 () Bool)

(assert (=> start!111820 m!1211267))

(check-sat (not b_next!30253) (not b!1322946) b_and!48669 (not b!1322950) (not start!111820) (not b_lambda!23573) (not b!1322951) (not b!1322945) (not b!1322952) tp_is_empty!36073 (not mapNonEmpty!55757))
(check-sat b_and!48669 (not b_next!30253))
