; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111626 () Bool)

(assert start!111626)

(declare-fun b_free!30283 () Bool)

(declare-fun b_next!30283 () Bool)

(assert (=> start!111626 (= b_free!30283 (not b_next!30283))))

(declare-fun tp!106324 () Bool)

(declare-fun b_and!48725 () Bool)

(assert (=> start!111626 (= tp!106324 b_and!48725)))

(declare-fun res!877576 () Bool)

(declare-fun e!753964 () Bool)

(assert (=> start!111626 (=> (not res!877576) (not e!753964))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111626 (= res!877576 (validMask!0 mask!2019))))

(assert (=> start!111626 e!753964))

(declare-datatypes ((array!89128 0))(
  ( (array!89129 (arr!43038 (Array (_ BitVec 32) (_ BitVec 64))) (size!43588 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89128)

(declare-fun array_inv!32493 (array!89128) Bool)

(assert (=> start!111626 (array_inv!32493 _keys!1609)))

(assert (=> start!111626 true))

(declare-fun tp_is_empty!36103 () Bool)

(assert (=> start!111626 tp_is_empty!36103))

(declare-datatypes ((V!53241 0))(
  ( (V!53242 (val!18126 Int)) )
))
(declare-datatypes ((ValueCell!17153 0))(
  ( (ValueCellFull!17153 (v!20756 V!53241)) (EmptyCell!17153) )
))
(declare-datatypes ((array!89130 0))(
  ( (array!89131 (arr!43039 (Array (_ BitVec 32) ValueCell!17153)) (size!43589 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89130)

(declare-fun e!753963 () Bool)

(declare-fun array_inv!32494 (array!89130) Bool)

(assert (=> start!111626 (and (array_inv!32494 _values!1337) e!753963)))

(assert (=> start!111626 tp!106324))

(declare-fun b!1322170 () Bool)

(declare-fun res!877578 () Bool)

(assert (=> b!1322170 (=> (not res!877578) (not e!753964))))

(declare-datatypes ((List!30497 0))(
  ( (Nil!30494) (Cons!30493 (h!31702 (_ BitVec 64)) (t!44329 List!30497)) )
))
(declare-fun arrayNoDuplicates!0 (array!89128 (_ BitVec 32) List!30497) Bool)

(assert (=> b!1322170 (= res!877578 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30494))))

(declare-fun mapNonEmpty!55802 () Bool)

(declare-fun mapRes!55802 () Bool)

(declare-fun tp!106325 () Bool)

(declare-fun e!753961 () Bool)

(assert (=> mapNonEmpty!55802 (= mapRes!55802 (and tp!106325 e!753961))))

(declare-fun mapKey!55802 () (_ BitVec 32))

(declare-fun mapRest!55802 () (Array (_ BitVec 32) ValueCell!17153))

(declare-fun mapValue!55802 () ValueCell!17153)

(assert (=> mapNonEmpty!55802 (= (arr!43039 _values!1337) (store mapRest!55802 mapKey!55802 mapValue!55802))))

(declare-fun b!1322171 () Bool)

(declare-fun res!877579 () Bool)

(assert (=> b!1322171 (=> (not res!877579) (not e!753964))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322171 (= res!877579 (and (= (size!43589 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43588 _keys!1609) (size!43589 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322172 () Bool)

(assert (=> b!1322172 (= e!753964 (not true))))

(declare-datatypes ((tuple2!23350 0))(
  ( (tuple2!23351 (_1!11686 (_ BitVec 64)) (_2!11686 V!53241)) )
))
(declare-datatypes ((List!30498 0))(
  ( (Nil!30495) (Cons!30494 (h!31703 tuple2!23350) (t!44330 List!30498)) )
))
(declare-datatypes ((ListLongMap!21007 0))(
  ( (ListLongMap!21008 (toList!10519 List!30498)) )
))
(declare-fun lt!587960 () ListLongMap!21007)

(declare-fun lt!587967 () tuple2!23350)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8674 (ListLongMap!21007 (_ BitVec 64)) Bool)

(declare-fun +!4574 (ListLongMap!21007 tuple2!23350) ListLongMap!21007)

(assert (=> b!1322172 (contains!8674 (+!4574 lt!587960 lt!587967) k!1164)))

(declare-datatypes ((Unit!43568 0))(
  ( (Unit!43569) )
))
(declare-fun lt!587965 () Unit!43568)

(declare-fun zeroValue!1279 () V!53241)

(declare-fun addStillContains!1123 (ListLongMap!21007 (_ BitVec 64) V!53241 (_ BitVec 64)) Unit!43568)

(assert (=> b!1322172 (= lt!587965 (addStillContains!1123 lt!587960 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322172 (contains!8674 lt!587960 k!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!587959 () V!53241)

(declare-fun lt!587966 () Unit!43568)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!170 ((_ BitVec 64) (_ BitVec 64) V!53241 ListLongMap!21007) Unit!43568)

(assert (=> b!1322172 (= lt!587966 (lemmaInListMapAfterAddingDiffThenInBefore!170 k!1164 (select (arr!43038 _keys!1609) from!2000) lt!587959 lt!587960))))

(declare-fun lt!587961 () ListLongMap!21007)

(assert (=> b!1322172 (contains!8674 lt!587961 k!1164)))

(declare-fun lt!587963 () Unit!43568)

(assert (=> b!1322172 (= lt!587963 (lemmaInListMapAfterAddingDiffThenInBefore!170 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587961))))

(declare-fun lt!587964 () ListLongMap!21007)

(assert (=> b!1322172 (contains!8674 lt!587964 k!1164)))

(declare-fun minValue!1279 () V!53241)

(declare-fun lt!587962 () Unit!43568)

(assert (=> b!1322172 (= lt!587962 (lemmaInListMapAfterAddingDiffThenInBefore!170 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587964))))

(assert (=> b!1322172 (= lt!587964 (+!4574 lt!587961 lt!587967))))

(assert (=> b!1322172 (= lt!587967 (tuple2!23351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322172 (= lt!587961 (+!4574 lt!587960 (tuple2!23351 (select (arr!43038 _keys!1609) from!2000) lt!587959)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21660 (ValueCell!17153 V!53241) V!53241)

(declare-fun dynLambda!3513 (Int (_ BitVec 64)) V!53241)

(assert (=> b!1322172 (= lt!587959 (get!21660 (select (arr!43039 _values!1337) from!2000) (dynLambda!3513 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6209 (array!89128 array!89130 (_ BitVec 32) (_ BitVec 32) V!53241 V!53241 (_ BitVec 32) Int) ListLongMap!21007)

(assert (=> b!1322172 (= lt!587960 (getCurrentListMapNoExtraKeys!6209 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322173 () Bool)

(declare-fun res!877573 () Bool)

(assert (=> b!1322173 (=> (not res!877573) (not e!753964))))

(assert (=> b!1322173 (= res!877573 (not (= (select (arr!43038 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322174 () Bool)

(declare-fun e!753962 () Bool)

(assert (=> b!1322174 (= e!753962 tp_is_empty!36103)))

(declare-fun b!1322175 () Bool)

(declare-fun res!877575 () Bool)

(assert (=> b!1322175 (=> (not res!877575) (not e!753964))))

(declare-fun getCurrentListMap!5520 (array!89128 array!89130 (_ BitVec 32) (_ BitVec 32) V!53241 V!53241 (_ BitVec 32) Int) ListLongMap!21007)

(assert (=> b!1322175 (= res!877575 (contains!8674 (getCurrentListMap!5520 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322176 () Bool)

(assert (=> b!1322176 (= e!753963 (and e!753962 mapRes!55802))))

(declare-fun condMapEmpty!55802 () Bool)

(declare-fun mapDefault!55802 () ValueCell!17153)

