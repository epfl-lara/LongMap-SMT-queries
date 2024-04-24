; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111772 () Bool)

(assert start!111772)

(declare-fun b_free!30205 () Bool)

(declare-fun b_next!30205 () Bool)

(assert (=> start!111772 (= b_free!30205 (not b_next!30205))))

(declare-fun tp!106090 () Bool)

(declare-fun b_and!48571 () Bool)

(assert (=> start!111772 (= tp!106090 b_and!48571)))

(declare-fun b!1322104 () Bool)

(declare-fun res!877160 () Bool)

(declare-fun e!754222 () Bool)

(assert (=> b!1322104 (=> (not res!877160) (not e!754222))))

(declare-datatypes ((array!89057 0))(
  ( (array!89058 (arr!42998 (Array (_ BitVec 32) (_ BitVec 64))) (size!43549 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89057)

(declare-datatypes ((List!30483 0))(
  ( (Nil!30480) (Cons!30479 (h!31697 (_ BitVec 64)) (t!44229 List!30483)) )
))
(declare-fun arrayNoDuplicates!0 (array!89057 (_ BitVec 32) List!30483) Bool)

(assert (=> b!1322104 (= res!877160 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30480))))

(declare-fun res!877155 () Bool)

(assert (=> start!111772 (=> (not res!877155) (not e!754222))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111772 (= res!877155 (validMask!0 mask!2019))))

(assert (=> start!111772 e!754222))

(declare-fun array_inv!32739 (array!89057) Bool)

(assert (=> start!111772 (array_inv!32739 _keys!1609)))

(assert (=> start!111772 true))

(declare-fun tp_is_empty!36025 () Bool)

(assert (=> start!111772 tp_is_empty!36025))

(declare-datatypes ((V!53137 0))(
  ( (V!53138 (val!18087 Int)) )
))
(declare-datatypes ((ValueCell!17114 0))(
  ( (ValueCellFull!17114 (v!20712 V!53137)) (EmptyCell!17114) )
))
(declare-datatypes ((array!89059 0))(
  ( (array!89060 (arr!42999 (Array (_ BitVec 32) ValueCell!17114)) (size!43550 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89059)

(declare-fun e!754218 () Bool)

(declare-fun array_inv!32740 (array!89059) Bool)

(assert (=> start!111772 (and (array_inv!32740 _values!1337) e!754218)))

(assert (=> start!111772 tp!106090))

(declare-fun b!1322105 () Bool)

(declare-fun e!754220 () Bool)

(declare-fun mapRes!55685 () Bool)

(assert (=> b!1322105 (= e!754218 (and e!754220 mapRes!55685))))

(declare-fun condMapEmpty!55685 () Bool)

(declare-fun mapDefault!55685 () ValueCell!17114)

(assert (=> b!1322105 (= condMapEmpty!55685 (= (arr!42999 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17114)) mapDefault!55685)))))

(declare-fun b!1322106 () Bool)

(assert (=> b!1322106 (= e!754222 (not true))))

(declare-datatypes ((tuple2!23328 0))(
  ( (tuple2!23329 (_1!11675 (_ BitVec 64)) (_2!11675 V!53137)) )
))
(declare-datatypes ((List!30484 0))(
  ( (Nil!30481) (Cons!30480 (h!31698 tuple2!23328) (t!44230 List!30484)) )
))
(declare-datatypes ((ListLongMap!20993 0))(
  ( (ListLongMap!20994 (toList!10512 List!30484)) )
))
(declare-fun lt!587559 () ListLongMap!20993)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8679 (ListLongMap!20993 (_ BitVec 64)) Bool)

(assert (=> b!1322106 (contains!8679 lt!587559 k0!1164)))

(declare-datatypes ((Unit!43475 0))(
  ( (Unit!43476) )
))
(declare-fun lt!587562 () Unit!43475)

(declare-fun lt!587560 () V!53137)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!149 ((_ BitVec 64) (_ BitVec 64) V!53137 ListLongMap!20993) Unit!43475)

(assert (=> b!1322106 (= lt!587562 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 (select (arr!42998 _keys!1609) from!2000) lt!587560 lt!587559))))

(declare-fun lt!587563 () ListLongMap!20993)

(assert (=> b!1322106 (contains!8679 lt!587563 k0!1164)))

(declare-fun zeroValue!1279 () V!53137)

(declare-fun lt!587561 () Unit!43475)

(assert (=> b!1322106 (= lt!587561 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587563))))

(declare-fun lt!587564 () ListLongMap!20993)

(assert (=> b!1322106 (contains!8679 lt!587564 k0!1164)))

(declare-fun lt!587558 () Unit!43475)

(declare-fun minValue!1279 () V!53137)

(assert (=> b!1322106 (= lt!587558 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587564))))

(declare-fun +!4594 (ListLongMap!20993 tuple2!23328) ListLongMap!20993)

(assert (=> b!1322106 (= lt!587564 (+!4594 lt!587563 (tuple2!23329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322106 (= lt!587563 (+!4594 lt!587559 (tuple2!23329 (select (arr!42998 _keys!1609) from!2000) lt!587560)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21657 (ValueCell!17114 V!53137) V!53137)

(declare-fun dynLambda!3548 (Int (_ BitVec 64)) V!53137)

(assert (=> b!1322106 (= lt!587560 (get!21657 (select (arr!42999 _values!1337) from!2000) (dynLambda!3548 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6233 (array!89057 array!89059 (_ BitVec 32) (_ BitVec 32) V!53137 V!53137 (_ BitVec 32) Int) ListLongMap!20993)

(assert (=> b!1322106 (= lt!587559 (getCurrentListMapNoExtraKeys!6233 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322107 () Bool)

(declare-fun res!877158 () Bool)

(assert (=> b!1322107 (=> (not res!877158) (not e!754222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89057 (_ BitVec 32)) Bool)

(assert (=> b!1322107 (= res!877158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322108 () Bool)

(declare-fun res!877159 () Bool)

(assert (=> b!1322108 (=> (not res!877159) (not e!754222))))

(assert (=> b!1322108 (= res!877159 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43549 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322109 () Bool)

(declare-fun res!877162 () Bool)

(assert (=> b!1322109 (=> (not res!877162) (not e!754222))))

(assert (=> b!1322109 (= res!877162 (and (= (size!43550 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43549 _keys!1609) (size!43550 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322110 () Bool)

(assert (=> b!1322110 (= e!754220 tp_is_empty!36025)))

(declare-fun b!1322111 () Bool)

(declare-fun e!754221 () Bool)

(assert (=> b!1322111 (= e!754221 tp_is_empty!36025)))

(declare-fun mapIsEmpty!55685 () Bool)

(assert (=> mapIsEmpty!55685 mapRes!55685))

(declare-fun b!1322112 () Bool)

(declare-fun res!877161 () Bool)

(assert (=> b!1322112 (=> (not res!877161) (not e!754222))))

(declare-fun getCurrentListMap!5508 (array!89057 array!89059 (_ BitVec 32) (_ BitVec 32) V!53137 V!53137 (_ BitVec 32) Int) ListLongMap!20993)

(assert (=> b!1322112 (= res!877161 (contains!8679 (getCurrentListMap!5508 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322113 () Bool)

(declare-fun res!877157 () Bool)

(assert (=> b!1322113 (=> (not res!877157) (not e!754222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322113 (= res!877157 (validKeyInArray!0 (select (arr!42998 _keys!1609) from!2000)))))

(declare-fun b!1322114 () Bool)

(declare-fun res!877156 () Bool)

(assert (=> b!1322114 (=> (not res!877156) (not e!754222))))

(assert (=> b!1322114 (= res!877156 (not (= (select (arr!42998 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55685 () Bool)

(declare-fun tp!106091 () Bool)

(assert (=> mapNonEmpty!55685 (= mapRes!55685 (and tp!106091 e!754221))))

(declare-fun mapValue!55685 () ValueCell!17114)

(declare-fun mapRest!55685 () (Array (_ BitVec 32) ValueCell!17114))

(declare-fun mapKey!55685 () (_ BitVec 32))

(assert (=> mapNonEmpty!55685 (= (arr!42999 _values!1337) (store mapRest!55685 mapKey!55685 mapValue!55685))))

(assert (= (and start!111772 res!877155) b!1322109))

(assert (= (and b!1322109 res!877162) b!1322107))

(assert (= (and b!1322107 res!877158) b!1322104))

(assert (= (and b!1322104 res!877160) b!1322108))

(assert (= (and b!1322108 res!877159) b!1322112))

(assert (= (and b!1322112 res!877161) b!1322114))

(assert (= (and b!1322114 res!877156) b!1322113))

(assert (= (and b!1322113 res!877157) b!1322106))

(assert (= (and b!1322105 condMapEmpty!55685) mapIsEmpty!55685))

(assert (= (and b!1322105 (not condMapEmpty!55685)) mapNonEmpty!55685))

(get-info :version)

(assert (= (and mapNonEmpty!55685 ((_ is ValueCellFull!17114) mapValue!55685)) b!1322111))

(assert (= (and b!1322105 ((_ is ValueCellFull!17114) mapDefault!55685)) b!1322110))

(assert (= start!111772 b!1322105))

(declare-fun b_lambda!23525 () Bool)

(assert (=> (not b_lambda!23525) (not b!1322106)))

(declare-fun t!44228 () Bool)

(declare-fun tb!11549 () Bool)

(assert (=> (and start!111772 (= defaultEntry!1340 defaultEntry!1340) t!44228) tb!11549))

(declare-fun result!24161 () Bool)

(assert (=> tb!11549 (= result!24161 tp_is_empty!36025)))

(assert (=> b!1322106 t!44228))

(declare-fun b_and!48573 () Bool)

(assert (= b_and!48571 (and (=> t!44228 result!24161) b_and!48573)))

(declare-fun m!1210169 () Bool)

(assert (=> b!1322106 m!1210169))

(declare-fun m!1210171 () Bool)

(assert (=> b!1322106 m!1210171))

(declare-fun m!1210173 () Bool)

(assert (=> b!1322106 m!1210173))

(declare-fun m!1210175 () Bool)

(assert (=> b!1322106 m!1210175))

(declare-fun m!1210177 () Bool)

(assert (=> b!1322106 m!1210177))

(declare-fun m!1210179 () Bool)

(assert (=> b!1322106 m!1210179))

(declare-fun m!1210181 () Bool)

(assert (=> b!1322106 m!1210181))

(declare-fun m!1210183 () Bool)

(assert (=> b!1322106 m!1210183))

(declare-fun m!1210185 () Bool)

(assert (=> b!1322106 m!1210185))

(assert (=> b!1322106 m!1210181))

(assert (=> b!1322106 m!1210177))

(declare-fun m!1210187 () Bool)

(assert (=> b!1322106 m!1210187))

(declare-fun m!1210189 () Bool)

(assert (=> b!1322106 m!1210189))

(declare-fun m!1210191 () Bool)

(assert (=> b!1322106 m!1210191))

(declare-fun m!1210193 () Bool)

(assert (=> b!1322106 m!1210193))

(assert (=> b!1322106 m!1210191))

(declare-fun m!1210195 () Bool)

(assert (=> mapNonEmpty!55685 m!1210195))

(declare-fun m!1210197 () Bool)

(assert (=> b!1322107 m!1210197))

(declare-fun m!1210199 () Bool)

(assert (=> start!111772 m!1210199))

(declare-fun m!1210201 () Bool)

(assert (=> start!111772 m!1210201))

(declare-fun m!1210203 () Bool)

(assert (=> start!111772 m!1210203))

(assert (=> b!1322113 m!1210191))

(assert (=> b!1322113 m!1210191))

(declare-fun m!1210205 () Bool)

(assert (=> b!1322113 m!1210205))

(assert (=> b!1322114 m!1210191))

(declare-fun m!1210207 () Bool)

(assert (=> b!1322112 m!1210207))

(assert (=> b!1322112 m!1210207))

(declare-fun m!1210209 () Bool)

(assert (=> b!1322112 m!1210209))

(declare-fun m!1210211 () Bool)

(assert (=> b!1322104 m!1210211))

(check-sat (not mapNonEmpty!55685) (not b!1322113) (not b!1322104) tp_is_empty!36025 (not b!1322106) b_and!48573 (not b_lambda!23525) (not start!111772) (not b_next!30205) (not b!1322112) (not b!1322107))
(check-sat b_and!48573 (not b_next!30205))
