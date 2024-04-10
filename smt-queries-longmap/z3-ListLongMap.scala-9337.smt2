; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111460 () Bool)

(assert start!111460)

(declare-fun b_free!30117 () Bool)

(declare-fun b_next!30117 () Bool)

(assert (=> start!111460 (= b_free!30117 (not b_next!30117))))

(declare-fun tp!105827 () Bool)

(declare-fun b_and!48393 () Bool)

(assert (=> start!111460 (= tp!105827 b_and!48393)))

(declare-fun b!1319265 () Bool)

(declare-fun e!752715 () Bool)

(assert (=> b!1319265 (= e!752715 (not true))))

(declare-datatypes ((V!53019 0))(
  ( (V!53020 (val!18043 Int)) )
))
(declare-datatypes ((tuple2!23218 0))(
  ( (tuple2!23219 (_1!11620 (_ BitVec 64)) (_2!11620 V!53019)) )
))
(declare-datatypes ((List!30373 0))(
  ( (Nil!30370) (Cons!30369 (h!31578 tuple2!23218) (t!44039 List!30373)) )
))
(declare-datatypes ((ListLongMap!20875 0))(
  ( (ListLongMap!20876 (toList!10453 List!30373)) )
))
(declare-fun lt!586610 () ListLongMap!20875)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8608 (ListLongMap!20875 (_ BitVec 64)) Bool)

(assert (=> b!1319265 (contains!8608 lt!586610 k0!1164)))

(declare-datatypes ((Unit!43448 0))(
  ( (Unit!43449) )
))
(declare-fun lt!586611 () Unit!43448)

(declare-fun minValue!1279 () V!53019)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!110 ((_ BitVec 64) (_ BitVec 64) V!53019 ListLongMap!20875) Unit!43448)

(assert (=> b!1319265 (= lt!586611 (lemmaInListMapAfterAddingDiffThenInBefore!110 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586610))))

(declare-datatypes ((array!88812 0))(
  ( (array!88813 (arr!42880 (Array (_ BitVec 32) (_ BitVec 64))) (size!43430 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88812)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53019)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17070 0))(
  ( (ValueCellFull!17070 (v!20673 V!53019)) (EmptyCell!17070) )
))
(declare-datatypes ((array!88814 0))(
  ( (array!88815 (arr!42881 (Array (_ BitVec 32) ValueCell!17070)) (size!43431 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88814)

(declare-fun +!4514 (ListLongMap!20875 tuple2!23218) ListLongMap!20875)

(declare-fun getCurrentListMapNoExtraKeys!6149 (array!88812 array!88814 (_ BitVec 32) (_ BitVec 32) V!53019 V!53019 (_ BitVec 32) Int) ListLongMap!20875)

(declare-fun get!21544 (ValueCell!17070 V!53019) V!53019)

(declare-fun dynLambda!3453 (Int (_ BitVec 64)) V!53019)

(assert (=> b!1319265 (= lt!586610 (+!4514 (+!4514 (getCurrentListMapNoExtraKeys!6149 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23219 (select (arr!42880 _keys!1609) from!2000) (get!21544 (select (arr!42881 _values!1337) from!2000) (dynLambda!3453 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55553 () Bool)

(declare-fun mapRes!55553 () Bool)

(declare-fun tp!105826 () Bool)

(declare-fun e!752719 () Bool)

(assert (=> mapNonEmpty!55553 (= mapRes!55553 (and tp!105826 e!752719))))

(declare-fun mapRest!55553 () (Array (_ BitVec 32) ValueCell!17070))

(declare-fun mapValue!55553 () ValueCell!17070)

(declare-fun mapKey!55553 () (_ BitVec 32))

(assert (=> mapNonEmpty!55553 (= (arr!42881 _values!1337) (store mapRest!55553 mapKey!55553 mapValue!55553))))

(declare-fun b!1319266 () Bool)

(declare-fun res!875581 () Bool)

(assert (=> b!1319266 (=> (not res!875581) (not e!752715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319266 (= res!875581 (validKeyInArray!0 (select (arr!42880 _keys!1609) from!2000)))))

(declare-fun b!1319267 () Bool)

(declare-fun e!752717 () Bool)

(declare-fun e!752718 () Bool)

(assert (=> b!1319267 (= e!752717 (and e!752718 mapRes!55553))))

(declare-fun condMapEmpty!55553 () Bool)

(declare-fun mapDefault!55553 () ValueCell!17070)

(assert (=> b!1319267 (= condMapEmpty!55553 (= (arr!42881 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17070)) mapDefault!55553)))))

(declare-fun b!1319268 () Bool)

(declare-fun res!875587 () Bool)

(assert (=> b!1319268 (=> (not res!875587) (not e!752715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88812 (_ BitVec 32)) Bool)

(assert (=> b!1319268 (= res!875587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319269 () Bool)

(declare-fun tp_is_empty!35937 () Bool)

(assert (=> b!1319269 (= e!752719 tp_is_empty!35937)))

(declare-fun b!1319270 () Bool)

(declare-fun res!875583 () Bool)

(assert (=> b!1319270 (=> (not res!875583) (not e!752715))))

(declare-datatypes ((List!30374 0))(
  ( (Nil!30371) (Cons!30370 (h!31579 (_ BitVec 64)) (t!44040 List!30374)) )
))
(declare-fun arrayNoDuplicates!0 (array!88812 (_ BitVec 32) List!30374) Bool)

(assert (=> b!1319270 (= res!875583 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30371))))

(declare-fun b!1319271 () Bool)

(declare-fun res!875585 () Bool)

(assert (=> b!1319271 (=> (not res!875585) (not e!752715))))

(declare-fun getCurrentListMap!5464 (array!88812 array!88814 (_ BitVec 32) (_ BitVec 32) V!53019 V!53019 (_ BitVec 32) Int) ListLongMap!20875)

(assert (=> b!1319271 (= res!875585 (contains!8608 (getCurrentListMap!5464 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55553 () Bool)

(assert (=> mapIsEmpty!55553 mapRes!55553))

(declare-fun res!875588 () Bool)

(assert (=> start!111460 (=> (not res!875588) (not e!752715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111460 (= res!875588 (validMask!0 mask!2019))))

(assert (=> start!111460 e!752715))

(declare-fun array_inv!32375 (array!88812) Bool)

(assert (=> start!111460 (array_inv!32375 _keys!1609)))

(assert (=> start!111460 true))

(assert (=> start!111460 tp_is_empty!35937))

(declare-fun array_inv!32376 (array!88814) Bool)

(assert (=> start!111460 (and (array_inv!32376 _values!1337) e!752717)))

(assert (=> start!111460 tp!105827))

(declare-fun b!1319272 () Bool)

(declare-fun res!875586 () Bool)

(assert (=> b!1319272 (=> (not res!875586) (not e!752715))))

(assert (=> b!1319272 (= res!875586 (not (= (select (arr!42880 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319273 () Bool)

(declare-fun res!875582 () Bool)

(assert (=> b!1319273 (=> (not res!875582) (not e!752715))))

(assert (=> b!1319273 (= res!875582 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43430 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319274 () Bool)

(assert (=> b!1319274 (= e!752718 tp_is_empty!35937)))

(declare-fun b!1319275 () Bool)

(declare-fun res!875584 () Bool)

(assert (=> b!1319275 (=> (not res!875584) (not e!752715))))

(assert (=> b!1319275 (= res!875584 (and (= (size!43431 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43430 _keys!1609) (size!43431 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111460 res!875588) b!1319275))

(assert (= (and b!1319275 res!875584) b!1319268))

(assert (= (and b!1319268 res!875587) b!1319270))

(assert (= (and b!1319270 res!875583) b!1319273))

(assert (= (and b!1319273 res!875582) b!1319271))

(assert (= (and b!1319271 res!875585) b!1319272))

(assert (= (and b!1319272 res!875586) b!1319266))

(assert (= (and b!1319266 res!875581) b!1319265))

(assert (= (and b!1319267 condMapEmpty!55553) mapIsEmpty!55553))

(assert (= (and b!1319267 (not condMapEmpty!55553)) mapNonEmpty!55553))

(get-info :version)

(assert (= (and mapNonEmpty!55553 ((_ is ValueCellFull!17070) mapValue!55553)) b!1319269))

(assert (= (and b!1319267 ((_ is ValueCellFull!17070) mapDefault!55553)) b!1319274))

(assert (= start!111460 b!1319267))

(declare-fun b_lambda!23443 () Bool)

(assert (=> (not b_lambda!23443) (not b!1319265)))

(declare-fun t!44038 () Bool)

(declare-fun tb!11469 () Bool)

(assert (=> (and start!111460 (= defaultEntry!1340 defaultEntry!1340) t!44038) tb!11469))

(declare-fun result!23993 () Bool)

(assert (=> tb!11469 (= result!23993 tp_is_empty!35937)))

(assert (=> b!1319265 t!44038))

(declare-fun b_and!48395 () Bool)

(assert (= b_and!48393 (and (=> t!44038 result!23993) b_and!48395)))

(declare-fun m!1206855 () Bool)

(assert (=> start!111460 m!1206855))

(declare-fun m!1206857 () Bool)

(assert (=> start!111460 m!1206857))

(declare-fun m!1206859 () Bool)

(assert (=> start!111460 m!1206859))

(declare-fun m!1206861 () Bool)

(assert (=> b!1319271 m!1206861))

(assert (=> b!1319271 m!1206861))

(declare-fun m!1206863 () Bool)

(assert (=> b!1319271 m!1206863))

(declare-fun m!1206865 () Bool)

(assert (=> b!1319266 m!1206865))

(assert (=> b!1319266 m!1206865))

(declare-fun m!1206867 () Bool)

(assert (=> b!1319266 m!1206867))

(declare-fun m!1206869 () Bool)

(assert (=> b!1319270 m!1206869))

(declare-fun m!1206871 () Bool)

(assert (=> mapNonEmpty!55553 m!1206871))

(declare-fun m!1206873 () Bool)

(assert (=> b!1319265 m!1206873))

(assert (=> b!1319265 m!1206873))

(declare-fun m!1206875 () Bool)

(assert (=> b!1319265 m!1206875))

(declare-fun m!1206877 () Bool)

(assert (=> b!1319265 m!1206877))

(assert (=> b!1319265 m!1206875))

(declare-fun m!1206879 () Bool)

(assert (=> b!1319265 m!1206879))

(declare-fun m!1206881 () Bool)

(assert (=> b!1319265 m!1206881))

(assert (=> b!1319265 m!1206877))

(declare-fun m!1206883 () Bool)

(assert (=> b!1319265 m!1206883))

(declare-fun m!1206885 () Bool)

(assert (=> b!1319265 m!1206885))

(assert (=> b!1319265 m!1206865))

(assert (=> b!1319265 m!1206883))

(declare-fun m!1206887 () Bool)

(assert (=> b!1319265 m!1206887))

(assert (=> b!1319272 m!1206865))

(declare-fun m!1206889 () Bool)

(assert (=> b!1319268 m!1206889))

(check-sat tp_is_empty!35937 (not b_lambda!23443) (not b!1319265) (not b!1319271) (not b!1319270) (not b!1319266) (not b_next!30117) (not mapNonEmpty!55553) (not b!1319268) b_and!48395 (not start!111460))
(check-sat b_and!48395 (not b_next!30117))
