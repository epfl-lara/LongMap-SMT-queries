; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111892 () Bool)

(assert start!111892)

(declare-fun b_free!30325 () Bool)

(declare-fun b_next!30325 () Bool)

(assert (=> start!111892 (= b_free!30325 (not b_next!30325))))

(declare-fun tp!106451 () Bool)

(declare-fun b_and!48811 () Bool)

(assert (=> start!111892 (= tp!106451 b_and!48811)))

(declare-fun b!1324204 () Bool)

(declare-fun e!755121 () Bool)

(declare-fun e!755122 () Bool)

(declare-fun mapRes!55865 () Bool)

(assert (=> b!1324204 (= e!755121 (and e!755122 mapRes!55865))))

(declare-fun condMapEmpty!55865 () Bool)

(declare-datatypes ((V!53297 0))(
  ( (V!53298 (val!18147 Int)) )
))
(declare-datatypes ((ValueCell!17174 0))(
  ( (ValueCellFull!17174 (v!20772 V!53297)) (EmptyCell!17174) )
))
(declare-datatypes ((array!89295 0))(
  ( (array!89296 (arr!43117 (Array (_ BitVec 32) ValueCell!17174)) (size!43668 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89295)

(declare-fun mapDefault!55865 () ValueCell!17174)

(assert (=> b!1324204 (= condMapEmpty!55865 (= (arr!43117 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17174)) mapDefault!55865)))))

(declare-fun b!1324205 () Bool)

(declare-fun res!878598 () Bool)

(declare-fun e!755119 () Bool)

(assert (=> b!1324205 (=> (not res!878598) (not e!755119))))

(declare-datatypes ((array!89297 0))(
  ( (array!89298 (arr!43118 (Array (_ BitVec 32) (_ BitVec 64))) (size!43669 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89297)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324205 (= res!878598 (and (= (size!43668 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43669 _keys!1609) (size!43668 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324207 () Bool)

(declare-fun res!878602 () Bool)

(assert (=> b!1324207 (=> (not res!878602) (not e!755119))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53297)

(declare-fun minValue!1279 () V!53297)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23432 0))(
  ( (tuple2!23433 (_1!11727 (_ BitVec 64)) (_2!11727 V!53297)) )
))
(declare-datatypes ((List!30582 0))(
  ( (Nil!30579) (Cons!30578 (h!31796 tuple2!23432) (t!44448 List!30582)) )
))
(declare-datatypes ((ListLongMap!21097 0))(
  ( (ListLongMap!21098 (toList!10564 List!30582)) )
))
(declare-fun contains!8731 (ListLongMap!21097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5550 (array!89297 array!89295 (_ BitVec 32) (_ BitVec 32) V!53297 V!53297 (_ BitVec 32) Int) ListLongMap!21097)

(assert (=> b!1324207 (= res!878602 (contains!8731 (getCurrentListMap!5550 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324208 () Bool)

(assert (=> b!1324208 (= e!755119 (not true))))

(declare-fun lt!589008 () ListLongMap!21097)

(declare-fun +!4639 (ListLongMap!21097 tuple2!23432) ListLongMap!21097)

(assert (=> b!1324208 (contains!8731 (+!4639 lt!589008 (tuple2!23433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43565 0))(
  ( (Unit!43566) )
))
(declare-fun lt!589006 () Unit!43565)

(declare-fun addStillContains!1151 (ListLongMap!21097 (_ BitVec 64) V!53297 (_ BitVec 64)) Unit!43565)

(assert (=> b!1324208 (= lt!589006 (addStillContains!1151 lt!589008 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324208 (contains!8731 lt!589008 k0!1164)))

(declare-fun lt!589016 () ListLongMap!21097)

(declare-fun lt!589013 () tuple2!23432)

(assert (=> b!1324208 (= lt!589008 (+!4639 lt!589016 lt!589013))))

(declare-fun lt!589009 () Unit!43565)

(assert (=> b!1324208 (= lt!589009 (addStillContains!1151 lt!589016 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324208 (contains!8731 lt!589016 k0!1164)))

(declare-fun lt!589007 () V!53297)

(declare-fun lt!589015 () Unit!43565)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!194 ((_ BitVec 64) (_ BitVec 64) V!53297 ListLongMap!21097) Unit!43565)

(assert (=> b!1324208 (= lt!589015 (lemmaInListMapAfterAddingDiffThenInBefore!194 k0!1164 (select (arr!43118 _keys!1609) from!2000) lt!589007 lt!589016))))

(declare-fun lt!589012 () ListLongMap!21097)

(assert (=> b!1324208 (contains!8731 lt!589012 k0!1164)))

(declare-fun lt!589010 () Unit!43565)

(assert (=> b!1324208 (= lt!589010 (lemmaInListMapAfterAddingDiffThenInBefore!194 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589012))))

(declare-fun lt!589014 () ListLongMap!21097)

(assert (=> b!1324208 (contains!8731 lt!589014 k0!1164)))

(declare-fun lt!589011 () Unit!43565)

(assert (=> b!1324208 (= lt!589011 (lemmaInListMapAfterAddingDiffThenInBefore!194 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589014))))

(assert (=> b!1324208 (= lt!589014 (+!4639 lt!589012 lt!589013))))

(assert (=> b!1324208 (= lt!589013 (tuple2!23433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324208 (= lt!589012 (+!4639 lt!589016 (tuple2!23433 (select (arr!43118 _keys!1609) from!2000) lt!589007)))))

(declare-fun get!21742 (ValueCell!17174 V!53297) V!53297)

(declare-fun dynLambda!3593 (Int (_ BitVec 64)) V!53297)

(assert (=> b!1324208 (= lt!589007 (get!21742 (select (arr!43117 _values!1337) from!2000) (dynLambda!3593 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6278 (array!89297 array!89295 (_ BitVec 32) (_ BitVec 32) V!53297 V!53297 (_ BitVec 32) Int) ListLongMap!21097)

(assert (=> b!1324208 (= lt!589016 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55865 () Bool)

(declare-fun tp!106450 () Bool)

(declare-fun e!755120 () Bool)

(assert (=> mapNonEmpty!55865 (= mapRes!55865 (and tp!106450 e!755120))))

(declare-fun mapValue!55865 () ValueCell!17174)

(declare-fun mapKey!55865 () (_ BitVec 32))

(declare-fun mapRest!55865 () (Array (_ BitVec 32) ValueCell!17174))

(assert (=> mapNonEmpty!55865 (= (arr!43117 _values!1337) (store mapRest!55865 mapKey!55865 mapValue!55865))))

(declare-fun b!1324209 () Bool)

(declare-fun tp_is_empty!36145 () Bool)

(assert (=> b!1324209 (= e!755122 tp_is_empty!36145)))

(declare-fun b!1324210 () Bool)

(declare-fun res!878596 () Bool)

(assert (=> b!1324210 (=> (not res!878596) (not e!755119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324210 (= res!878596 (validKeyInArray!0 (select (arr!43118 _keys!1609) from!2000)))))

(declare-fun b!1324211 () Bool)

(declare-fun res!878599 () Bool)

(assert (=> b!1324211 (=> (not res!878599) (not e!755119))))

(declare-datatypes ((List!30583 0))(
  ( (Nil!30580) (Cons!30579 (h!31797 (_ BitVec 64)) (t!44449 List!30583)) )
))
(declare-fun arrayNoDuplicates!0 (array!89297 (_ BitVec 32) List!30583) Bool)

(assert (=> b!1324211 (= res!878599 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30580))))

(declare-fun b!1324212 () Bool)

(assert (=> b!1324212 (= e!755120 tp_is_empty!36145)))

(declare-fun b!1324206 () Bool)

(declare-fun res!878601 () Bool)

(assert (=> b!1324206 (=> (not res!878601) (not e!755119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89297 (_ BitVec 32)) Bool)

(assert (=> b!1324206 (= res!878601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!878600 () Bool)

(assert (=> start!111892 (=> (not res!878600) (not e!755119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111892 (= res!878600 (validMask!0 mask!2019))))

(assert (=> start!111892 e!755119))

(declare-fun array_inv!32827 (array!89297) Bool)

(assert (=> start!111892 (array_inv!32827 _keys!1609)))

(assert (=> start!111892 true))

(assert (=> start!111892 tp_is_empty!36145))

(declare-fun array_inv!32828 (array!89295) Bool)

(assert (=> start!111892 (and (array_inv!32828 _values!1337) e!755121)))

(assert (=> start!111892 tp!106451))

(declare-fun b!1324213 () Bool)

(declare-fun res!878595 () Bool)

(assert (=> b!1324213 (=> (not res!878595) (not e!755119))))

(assert (=> b!1324213 (= res!878595 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43669 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324214 () Bool)

(declare-fun res!878597 () Bool)

(assert (=> b!1324214 (=> (not res!878597) (not e!755119))))

(assert (=> b!1324214 (= res!878597 (not (= (select (arr!43118 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55865 () Bool)

(assert (=> mapIsEmpty!55865 mapRes!55865))

(assert (= (and start!111892 res!878600) b!1324205))

(assert (= (and b!1324205 res!878598) b!1324206))

(assert (= (and b!1324206 res!878601) b!1324211))

(assert (= (and b!1324211 res!878599) b!1324213))

(assert (= (and b!1324213 res!878595) b!1324207))

(assert (= (and b!1324207 res!878602) b!1324214))

(assert (= (and b!1324214 res!878597) b!1324210))

(assert (= (and b!1324210 res!878596) b!1324208))

(assert (= (and b!1324204 condMapEmpty!55865) mapIsEmpty!55865))

(assert (= (and b!1324204 (not condMapEmpty!55865)) mapNonEmpty!55865))

(get-info :version)

(assert (= (and mapNonEmpty!55865 ((_ is ValueCellFull!17174) mapValue!55865)) b!1324212))

(assert (= (and b!1324204 ((_ is ValueCellFull!17174) mapDefault!55865)) b!1324209))

(assert (= start!111892 b!1324204))

(declare-fun b_lambda!23645 () Bool)

(assert (=> (not b_lambda!23645) (not b!1324208)))

(declare-fun t!44447 () Bool)

(declare-fun tb!11669 () Bool)

(assert (=> (and start!111892 (= defaultEntry!1340 defaultEntry!1340) t!44447) tb!11669))

(declare-fun result!24401 () Bool)

(assert (=> tb!11669 (= result!24401 tp_is_empty!36145)))

(assert (=> b!1324208 t!44447))

(declare-fun b_and!48813 () Bool)

(assert (= b_and!48811 (and (=> t!44447 result!24401) b_and!48813)))

(declare-fun m!1212989 () Bool)

(assert (=> mapNonEmpty!55865 m!1212989))

(declare-fun m!1212991 () Bool)

(assert (=> b!1324208 m!1212991))

(declare-fun m!1212993 () Bool)

(assert (=> b!1324208 m!1212993))

(declare-fun m!1212995 () Bool)

(assert (=> b!1324208 m!1212995))

(declare-fun m!1212997 () Bool)

(assert (=> b!1324208 m!1212997))

(declare-fun m!1212999 () Bool)

(assert (=> b!1324208 m!1212999))

(declare-fun m!1213001 () Bool)

(assert (=> b!1324208 m!1213001))

(declare-fun m!1213003 () Bool)

(assert (=> b!1324208 m!1213003))

(declare-fun m!1213005 () Bool)

(assert (=> b!1324208 m!1213005))

(declare-fun m!1213007 () Bool)

(assert (=> b!1324208 m!1213007))

(declare-fun m!1213009 () Bool)

(assert (=> b!1324208 m!1213009))

(assert (=> b!1324208 m!1213005))

(assert (=> b!1324208 m!1212995))

(declare-fun m!1213011 () Bool)

(assert (=> b!1324208 m!1213011))

(declare-fun m!1213013 () Bool)

(assert (=> b!1324208 m!1213013))

(declare-fun m!1213015 () Bool)

(assert (=> b!1324208 m!1213015))

(declare-fun m!1213017 () Bool)

(assert (=> b!1324208 m!1213017))

(declare-fun m!1213019 () Bool)

(assert (=> b!1324208 m!1213019))

(declare-fun m!1213021 () Bool)

(assert (=> b!1324208 m!1213021))

(assert (=> b!1324208 m!1213003))

(declare-fun m!1213023 () Bool)

(assert (=> b!1324208 m!1213023))

(assert (=> b!1324208 m!1213015))

(declare-fun m!1213025 () Bool)

(assert (=> b!1324208 m!1213025))

(declare-fun m!1213027 () Bool)

(assert (=> b!1324208 m!1213027))

(declare-fun m!1213029 () Bool)

(assert (=> b!1324211 m!1213029))

(declare-fun m!1213031 () Bool)

(assert (=> b!1324207 m!1213031))

(assert (=> b!1324207 m!1213031))

(declare-fun m!1213033 () Bool)

(assert (=> b!1324207 m!1213033))

(declare-fun m!1213035 () Bool)

(assert (=> start!111892 m!1213035))

(declare-fun m!1213037 () Bool)

(assert (=> start!111892 m!1213037))

(declare-fun m!1213039 () Bool)

(assert (=> start!111892 m!1213039))

(declare-fun m!1213041 () Bool)

(assert (=> b!1324206 m!1213041))

(assert (=> b!1324214 m!1213015))

(assert (=> b!1324210 m!1213015))

(assert (=> b!1324210 m!1213015))

(declare-fun m!1213043 () Bool)

(assert (=> b!1324210 m!1213043))

(check-sat (not b!1324211) (not b!1324206) (not b_lambda!23645) (not b!1324208) (not b!1324210) (not b_next!30325) b_and!48813 tp_is_empty!36145 (not b!1324207) (not mapNonEmpty!55865) (not start!111892))
(check-sat b_and!48813 (not b_next!30325))
