; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111630 () Bool)

(assert start!111630)

(declare-fun b_free!30287 () Bool)

(declare-fun b_next!30287 () Bool)

(assert (=> start!111630 (= b_free!30287 (not b_next!30287))))

(declare-fun tp!106336 () Bool)

(declare-fun b_and!48733 () Bool)

(assert (=> start!111630 (= tp!106336 b_and!48733)))

(declare-fun b!1322240 () Bool)

(declare-fun res!877628 () Bool)

(declare-fun e!753993 () Bool)

(assert (=> b!1322240 (=> (not res!877628) (not e!753993))))

(declare-datatypes ((array!89136 0))(
  ( (array!89137 (arr!43042 (Array (_ BitVec 32) (_ BitVec 64))) (size!43592 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89136)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53245 0))(
  ( (V!53246 (val!18128 Int)) )
))
(declare-fun zeroValue!1279 () V!53245)

(declare-datatypes ((ValueCell!17155 0))(
  ( (ValueCellFull!17155 (v!20758 V!53245)) (EmptyCell!17155) )
))
(declare-datatypes ((array!89138 0))(
  ( (array!89139 (arr!43043 (Array (_ BitVec 32) ValueCell!17155)) (size!43593 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89138)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun minValue!1279 () V!53245)

(declare-datatypes ((tuple2!23354 0))(
  ( (tuple2!23355 (_1!11688 (_ BitVec 64)) (_2!11688 V!53245)) )
))
(declare-datatypes ((List!30501 0))(
  ( (Nil!30498) (Cons!30497 (h!31706 tuple2!23354) (t!44337 List!30501)) )
))
(declare-datatypes ((ListLongMap!21011 0))(
  ( (ListLongMap!21012 (toList!10521 List!30501)) )
))
(declare-fun contains!8676 (ListLongMap!21011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5522 (array!89136 array!89138 (_ BitVec 32) (_ BitVec 32) V!53245 V!53245 (_ BitVec 32) Int) ListLongMap!21011)

(assert (=> b!1322240 (= res!877628 (contains!8676 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!55808 () Bool)

(declare-fun mapRes!55808 () Bool)

(declare-fun tp!106337 () Bool)

(declare-fun e!753992 () Bool)

(assert (=> mapNonEmpty!55808 (= mapRes!55808 (and tp!106337 e!753992))))

(declare-fun mapValue!55808 () ValueCell!17155)

(declare-fun mapKey!55808 () (_ BitVec 32))

(declare-fun mapRest!55808 () (Array (_ BitVec 32) ValueCell!17155))

(assert (=> mapNonEmpty!55808 (= (arr!43043 _values!1337) (store mapRest!55808 mapKey!55808 mapValue!55808))))

(declare-fun b!1322241 () Bool)

(declare-fun res!877622 () Bool)

(assert (=> b!1322241 (=> (not res!877622) (not e!753993))))

(assert (=> b!1322241 (= res!877622 (and (= (size!43593 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43592 _keys!1609) (size!43593 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55808 () Bool)

(assert (=> mapIsEmpty!55808 mapRes!55808))

(declare-fun b!1322242 () Bool)

(assert (=> b!1322242 (= e!753993 (not true))))

(declare-fun lt!588014 () ListLongMap!21011)

(declare-fun lt!588016 () tuple2!23354)

(declare-fun +!4576 (ListLongMap!21011 tuple2!23354) ListLongMap!21011)

(assert (=> b!1322242 (contains!8676 (+!4576 lt!588014 lt!588016) k!1164)))

(declare-datatypes ((Unit!43572 0))(
  ( (Unit!43573) )
))
(declare-fun lt!588018 () Unit!43572)

(declare-fun addStillContains!1125 (ListLongMap!21011 (_ BitVec 64) V!53245 (_ BitVec 64)) Unit!43572)

(assert (=> b!1322242 (= lt!588018 (addStillContains!1125 lt!588014 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322242 (contains!8676 lt!588014 k!1164)))

(declare-fun lt!588017 () V!53245)

(declare-fun lt!588021 () Unit!43572)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!172 ((_ BitVec 64) (_ BitVec 64) V!53245 ListLongMap!21011) Unit!43572)

(assert (=> b!1322242 (= lt!588021 (lemmaInListMapAfterAddingDiffThenInBefore!172 k!1164 (select (arr!43042 _keys!1609) from!2000) lt!588017 lt!588014))))

(declare-fun lt!588019 () ListLongMap!21011)

(assert (=> b!1322242 (contains!8676 lt!588019 k!1164)))

(declare-fun lt!588020 () Unit!43572)

(assert (=> b!1322242 (= lt!588020 (lemmaInListMapAfterAddingDiffThenInBefore!172 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588019))))

(declare-fun lt!588013 () ListLongMap!21011)

(assert (=> b!1322242 (contains!8676 lt!588013 k!1164)))

(declare-fun lt!588015 () Unit!43572)

(assert (=> b!1322242 (= lt!588015 (lemmaInListMapAfterAddingDiffThenInBefore!172 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588013))))

(assert (=> b!1322242 (= lt!588013 (+!4576 lt!588019 lt!588016))))

(assert (=> b!1322242 (= lt!588016 (tuple2!23355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322242 (= lt!588019 (+!4576 lt!588014 (tuple2!23355 (select (arr!43042 _keys!1609) from!2000) lt!588017)))))

(declare-fun get!21662 (ValueCell!17155 V!53245) V!53245)

(declare-fun dynLambda!3515 (Int (_ BitVec 64)) V!53245)

(assert (=> b!1322242 (= lt!588017 (get!21662 (select (arr!43043 _values!1337) from!2000) (dynLambda!3515 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6211 (array!89136 array!89138 (_ BitVec 32) (_ BitVec 32) V!53245 V!53245 (_ BitVec 32) Int) ListLongMap!21011)

(assert (=> b!1322242 (= lt!588014 (getCurrentListMapNoExtraKeys!6211 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322243 () Bool)

(declare-fun res!877627 () Bool)

(assert (=> b!1322243 (=> (not res!877627) (not e!753993))))

(assert (=> b!1322243 (= res!877627 (not (= (select (arr!43042 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322244 () Bool)

(declare-fun res!877623 () Bool)

(assert (=> b!1322244 (=> (not res!877623) (not e!753993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322244 (= res!877623 (validKeyInArray!0 (select (arr!43042 _keys!1609) from!2000)))))

(declare-fun res!877624 () Bool)

(assert (=> start!111630 (=> (not res!877624) (not e!753993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111630 (= res!877624 (validMask!0 mask!2019))))

(assert (=> start!111630 e!753993))

(declare-fun array_inv!32497 (array!89136) Bool)

(assert (=> start!111630 (array_inv!32497 _keys!1609)))

(assert (=> start!111630 true))

(declare-fun tp_is_empty!36107 () Bool)

(assert (=> start!111630 tp_is_empty!36107))

(declare-fun e!753994 () Bool)

(declare-fun array_inv!32498 (array!89138) Bool)

(assert (=> start!111630 (and (array_inv!32498 _values!1337) e!753994)))

(assert (=> start!111630 tp!106336))

(declare-fun b!1322245 () Bool)

(assert (=> b!1322245 (= e!753992 tp_is_empty!36107)))

(declare-fun b!1322246 () Bool)

(declare-fun e!753991 () Bool)

(assert (=> b!1322246 (= e!753991 tp_is_empty!36107)))

(declare-fun b!1322247 () Bool)

(declare-fun res!877621 () Bool)

(assert (=> b!1322247 (=> (not res!877621) (not e!753993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89136 (_ BitVec 32)) Bool)

(assert (=> b!1322247 (= res!877621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322248 () Bool)

(declare-fun res!877626 () Bool)

(assert (=> b!1322248 (=> (not res!877626) (not e!753993))))

(assert (=> b!1322248 (= res!877626 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43592 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322249 () Bool)

(declare-fun res!877625 () Bool)

(assert (=> b!1322249 (=> (not res!877625) (not e!753993))))

(declare-datatypes ((List!30502 0))(
  ( (Nil!30499) (Cons!30498 (h!31707 (_ BitVec 64)) (t!44338 List!30502)) )
))
(declare-fun arrayNoDuplicates!0 (array!89136 (_ BitVec 32) List!30502) Bool)

(assert (=> b!1322249 (= res!877625 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30499))))

(declare-fun b!1322250 () Bool)

(assert (=> b!1322250 (= e!753994 (and e!753991 mapRes!55808))))

(declare-fun condMapEmpty!55808 () Bool)

(declare-fun mapDefault!55808 () ValueCell!17155)

