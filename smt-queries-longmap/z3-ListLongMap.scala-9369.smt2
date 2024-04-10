; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111652 () Bool)

(assert start!111652)

(declare-fun b_free!30309 () Bool)

(declare-fun b_next!30309 () Bool)

(assert (=> start!111652 (= b_free!30309 (not b_next!30309))))

(declare-fun tp!106402 () Bool)

(declare-fun b_and!48777 () Bool)

(assert (=> start!111652 (= tp!106402 b_and!48777)))

(declare-fun b!1322625 () Bool)

(declare-fun res!877892 () Bool)

(declare-fun e!754156 () Bool)

(assert (=> b!1322625 (=> (not res!877892) (not e!754156))))

(declare-datatypes ((array!89178 0))(
  ( (array!89179 (arr!43063 (Array (_ BitVec 32) (_ BitVec 64))) (size!43613 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89178)

(declare-datatypes ((List!30517 0))(
  ( (Nil!30514) (Cons!30513 (h!31722 (_ BitVec 64)) (t!44375 List!30517)) )
))
(declare-fun arrayNoDuplicates!0 (array!89178 (_ BitVec 32) List!30517) Bool)

(assert (=> b!1322625 (= res!877892 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30514))))

(declare-fun b!1322626 () Bool)

(declare-fun e!754159 () Bool)

(declare-fun tp_is_empty!36129 () Bool)

(assert (=> b!1322626 (= e!754159 tp_is_empty!36129)))

(declare-fun mapIsEmpty!55841 () Bool)

(declare-fun mapRes!55841 () Bool)

(assert (=> mapIsEmpty!55841 mapRes!55841))

(declare-fun b!1322627 () Bool)

(assert (=> b!1322627 (= e!754156 (not true))))

(declare-datatypes ((V!53275 0))(
  ( (V!53276 (val!18139 Int)) )
))
(declare-datatypes ((tuple2!23372 0))(
  ( (tuple2!23373 (_1!11697 (_ BitVec 64)) (_2!11697 V!53275)) )
))
(declare-datatypes ((List!30518 0))(
  ( (Nil!30515) (Cons!30514 (h!31723 tuple2!23372) (t!44376 List!30518)) )
))
(declare-datatypes ((ListLongMap!21029 0))(
  ( (ListLongMap!21030 (toList!10530 List!30518)) )
))
(declare-fun lt!588317 () ListLongMap!21029)

(declare-fun lt!588311 () tuple2!23372)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8685 (ListLongMap!21029 (_ BitVec 64)) Bool)

(declare-fun +!4582 (ListLongMap!21029 tuple2!23372) ListLongMap!21029)

(assert (=> b!1322627 (contains!8685 (+!4582 lt!588317 lt!588311) k0!1164)))

(declare-fun zeroValue!1279 () V!53275)

(declare-datatypes ((Unit!43584 0))(
  ( (Unit!43585) )
))
(declare-fun lt!588314 () Unit!43584)

(declare-fun addStillContains!1131 (ListLongMap!21029 (_ BitVec 64) V!53275 (_ BitVec 64)) Unit!43584)

(assert (=> b!1322627 (= lt!588314 (addStillContains!1131 lt!588317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322627 (contains!8685 lt!588317 k0!1164)))

(declare-fun lt!588318 () V!53275)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588316 () Unit!43584)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!178 ((_ BitVec 64) (_ BitVec 64) V!53275 ListLongMap!21029) Unit!43584)

(assert (=> b!1322627 (= lt!588316 (lemmaInListMapAfterAddingDiffThenInBefore!178 k0!1164 (select (arr!43063 _keys!1609) from!2000) lt!588318 lt!588317))))

(declare-fun lt!588312 () ListLongMap!21029)

(assert (=> b!1322627 (contains!8685 lt!588312 k0!1164)))

(declare-fun lt!588310 () Unit!43584)

(assert (=> b!1322627 (= lt!588310 (lemmaInListMapAfterAddingDiffThenInBefore!178 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588312))))

(declare-fun lt!588315 () ListLongMap!21029)

(assert (=> b!1322627 (contains!8685 lt!588315 k0!1164)))

(declare-fun lt!588313 () Unit!43584)

(declare-fun minValue!1279 () V!53275)

(assert (=> b!1322627 (= lt!588313 (lemmaInListMapAfterAddingDiffThenInBefore!178 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588315))))

(assert (=> b!1322627 (= lt!588315 (+!4582 lt!588312 lt!588311))))

(assert (=> b!1322627 (= lt!588311 (tuple2!23373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322627 (= lt!588312 (+!4582 lt!588317 (tuple2!23373 (select (arr!43063 _keys!1609) from!2000) lt!588318)))))

(declare-datatypes ((ValueCell!17166 0))(
  ( (ValueCellFull!17166 (v!20769 V!53275)) (EmptyCell!17166) )
))
(declare-datatypes ((array!89180 0))(
  ( (array!89181 (arr!43064 (Array (_ BitVec 32) ValueCell!17166)) (size!43614 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89180)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21676 (ValueCell!17166 V!53275) V!53275)

(declare-fun dynLambda!3521 (Int (_ BitVec 64)) V!53275)

(assert (=> b!1322627 (= lt!588318 (get!21676 (select (arr!43064 _values!1337) from!2000) (dynLambda!3521 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6217 (array!89178 array!89180 (_ BitVec 32) (_ BitVec 32) V!53275 V!53275 (_ BitVec 32) Int) ListLongMap!21029)

(assert (=> b!1322627 (= lt!588317 (getCurrentListMapNoExtraKeys!6217 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322628 () Bool)

(declare-fun res!877885 () Bool)

(assert (=> b!1322628 (=> (not res!877885) (not e!754156))))

(assert (=> b!1322628 (= res!877885 (and (= (size!43614 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43613 _keys!1609) (size!43614 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322629 () Bool)

(declare-fun res!877890 () Bool)

(assert (=> b!1322629 (=> (not res!877890) (not e!754156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322629 (= res!877890 (validKeyInArray!0 (select (arr!43063 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55841 () Bool)

(declare-fun tp!106403 () Bool)

(assert (=> mapNonEmpty!55841 (= mapRes!55841 (and tp!106403 e!754159))))

(declare-fun mapKey!55841 () (_ BitVec 32))

(declare-fun mapRest!55841 () (Array (_ BitVec 32) ValueCell!17166))

(declare-fun mapValue!55841 () ValueCell!17166)

(assert (=> mapNonEmpty!55841 (= (arr!43064 _values!1337) (store mapRest!55841 mapKey!55841 mapValue!55841))))

(declare-fun res!877887 () Bool)

(assert (=> start!111652 (=> (not res!877887) (not e!754156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111652 (= res!877887 (validMask!0 mask!2019))))

(assert (=> start!111652 e!754156))

(declare-fun array_inv!32513 (array!89178) Bool)

(assert (=> start!111652 (array_inv!32513 _keys!1609)))

(assert (=> start!111652 true))

(assert (=> start!111652 tp_is_empty!36129))

(declare-fun e!754155 () Bool)

(declare-fun array_inv!32514 (array!89180) Bool)

(assert (=> start!111652 (and (array_inv!32514 _values!1337) e!754155)))

(assert (=> start!111652 tp!106402))

(declare-fun b!1322630 () Bool)

(declare-fun res!877889 () Bool)

(assert (=> b!1322630 (=> (not res!877889) (not e!754156))))

(assert (=> b!1322630 (= res!877889 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43613 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322631 () Bool)

(declare-fun res!877888 () Bool)

(assert (=> b!1322631 (=> (not res!877888) (not e!754156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89178 (_ BitVec 32)) Bool)

(assert (=> b!1322631 (= res!877888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322632 () Bool)

(declare-fun e!754157 () Bool)

(assert (=> b!1322632 (= e!754157 tp_is_empty!36129)))

(declare-fun b!1322633 () Bool)

(declare-fun res!877891 () Bool)

(assert (=> b!1322633 (=> (not res!877891) (not e!754156))))

(assert (=> b!1322633 (= res!877891 (not (= (select (arr!43063 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322634 () Bool)

(assert (=> b!1322634 (= e!754155 (and e!754157 mapRes!55841))))

(declare-fun condMapEmpty!55841 () Bool)

(declare-fun mapDefault!55841 () ValueCell!17166)

(assert (=> b!1322634 (= condMapEmpty!55841 (= (arr!43064 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17166)) mapDefault!55841)))))

(declare-fun b!1322635 () Bool)

(declare-fun res!877886 () Bool)

(assert (=> b!1322635 (=> (not res!877886) (not e!754156))))

(declare-fun getCurrentListMap!5531 (array!89178 array!89180 (_ BitVec 32) (_ BitVec 32) V!53275 V!53275 (_ BitVec 32) Int) ListLongMap!21029)

(assert (=> b!1322635 (= res!877886 (contains!8685 (getCurrentListMap!5531 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111652 res!877887) b!1322628))

(assert (= (and b!1322628 res!877885) b!1322631))

(assert (= (and b!1322631 res!877888) b!1322625))

(assert (= (and b!1322625 res!877892) b!1322630))

(assert (= (and b!1322630 res!877889) b!1322635))

(assert (= (and b!1322635 res!877886) b!1322633))

(assert (= (and b!1322633 res!877891) b!1322629))

(assert (= (and b!1322629 res!877890) b!1322627))

(assert (= (and b!1322634 condMapEmpty!55841) mapIsEmpty!55841))

(assert (= (and b!1322634 (not condMapEmpty!55841)) mapNonEmpty!55841))

(get-info :version)

(assert (= (and mapNonEmpty!55841 ((_ is ValueCellFull!17166) mapValue!55841)) b!1322626))

(assert (= (and b!1322634 ((_ is ValueCellFull!17166) mapDefault!55841)) b!1322632))

(assert (= start!111652 b!1322634))

(declare-fun b_lambda!23635 () Bool)

(assert (=> (not b_lambda!23635) (not b!1322627)))

(declare-fun t!44374 () Bool)

(declare-fun tb!11661 () Bool)

(assert (=> (and start!111652 (= defaultEntry!1340 defaultEntry!1340) t!44374) tb!11661))

(declare-fun result!24377 () Bool)

(assert (=> tb!11661 (= result!24377 tp_is_empty!36129)))

(assert (=> b!1322627 t!44374))

(declare-fun b_and!48779 () Bool)

(assert (= b_and!48777 (and (=> t!44374 result!24377) b_and!48779)))

(declare-fun m!1210991 () Bool)

(assert (=> b!1322635 m!1210991))

(assert (=> b!1322635 m!1210991))

(declare-fun m!1210993 () Bool)

(assert (=> b!1322635 m!1210993))

(declare-fun m!1210995 () Bool)

(assert (=> b!1322629 m!1210995))

(assert (=> b!1322629 m!1210995))

(declare-fun m!1210997 () Bool)

(assert (=> b!1322629 m!1210997))

(declare-fun m!1210999 () Bool)

(assert (=> mapNonEmpty!55841 m!1210999))

(assert (=> b!1322633 m!1210995))

(declare-fun m!1211001 () Bool)

(assert (=> start!111652 m!1211001))

(declare-fun m!1211003 () Bool)

(assert (=> start!111652 m!1211003))

(declare-fun m!1211005 () Bool)

(assert (=> start!111652 m!1211005))

(declare-fun m!1211007 () Bool)

(assert (=> b!1322631 m!1211007))

(declare-fun m!1211009 () Bool)

(assert (=> b!1322625 m!1211009))

(declare-fun m!1211011 () Bool)

(assert (=> b!1322627 m!1211011))

(declare-fun m!1211013 () Bool)

(assert (=> b!1322627 m!1211013))

(declare-fun m!1211015 () Bool)

(assert (=> b!1322627 m!1211015))

(declare-fun m!1211017 () Bool)

(assert (=> b!1322627 m!1211017))

(declare-fun m!1211019 () Bool)

(assert (=> b!1322627 m!1211019))

(declare-fun m!1211021 () Bool)

(assert (=> b!1322627 m!1211021))

(declare-fun m!1211023 () Bool)

(assert (=> b!1322627 m!1211023))

(assert (=> b!1322627 m!1210995))

(declare-fun m!1211025 () Bool)

(assert (=> b!1322627 m!1211025))

(declare-fun m!1211027 () Bool)

(assert (=> b!1322627 m!1211027))

(declare-fun m!1211029 () Bool)

(assert (=> b!1322627 m!1211029))

(declare-fun m!1211031 () Bool)

(assert (=> b!1322627 m!1211031))

(assert (=> b!1322627 m!1211015))

(assert (=> b!1322627 m!1211021))

(assert (=> b!1322627 m!1211019))

(declare-fun m!1211033 () Bool)

(assert (=> b!1322627 m!1211033))

(declare-fun m!1211035 () Bool)

(assert (=> b!1322627 m!1211035))

(declare-fun m!1211037 () Bool)

(assert (=> b!1322627 m!1211037))

(assert (=> b!1322627 m!1210995))

(declare-fun m!1211039 () Bool)

(assert (=> b!1322627 m!1211039))

(check-sat (not b_lambda!23635) (not start!111652) b_and!48779 (not b!1322629) (not b!1322631) (not b!1322625) (not b_next!30309) (not b!1322635) tp_is_empty!36129 (not mapNonEmpty!55841) (not b!1322627))
(check-sat b_and!48779 (not b_next!30309))
