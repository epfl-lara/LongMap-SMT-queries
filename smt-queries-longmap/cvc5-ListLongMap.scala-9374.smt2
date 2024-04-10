; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111680 () Bool)

(assert start!111680)

(declare-fun b_free!30337 () Bool)

(declare-fun b_next!30337 () Bool)

(assert (=> start!111680 (= b_free!30337 (not b_next!30337))))

(declare-fun tp!106487 () Bool)

(declare-fun b_and!48833 () Bool)

(assert (=> start!111680 (= tp!106487 b_and!48833)))

(declare-fun mapIsEmpty!55883 () Bool)

(declare-fun mapRes!55883 () Bool)

(assert (=> mapIsEmpty!55883 mapRes!55883))

(declare-fun b!1323115 () Bool)

(declare-fun res!878225 () Bool)

(declare-fun e!754367 () Bool)

(assert (=> b!1323115 (=> (not res!878225) (not e!754367))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53313 0))(
  ( (V!53314 (val!18153 Int)) )
))
(declare-fun zeroValue!1279 () V!53313)

(declare-datatypes ((ValueCell!17180 0))(
  ( (ValueCellFull!17180 (v!20783 V!53313)) (EmptyCell!17180) )
))
(declare-datatypes ((array!89234 0))(
  ( (array!89235 (arr!43091 (Array (_ BitVec 32) ValueCell!17180)) (size!43641 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89234)

(declare-fun minValue!1279 () V!53313)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89236 0))(
  ( (array!89237 (arr!43092 (Array (_ BitVec 32) (_ BitVec 64))) (size!43642 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89236)

(declare-fun k!1164 () (_ BitVec 64))

(declare-datatypes ((tuple2!23398 0))(
  ( (tuple2!23399 (_1!11710 (_ BitVec 64)) (_2!11710 V!53313)) )
))
(declare-datatypes ((List!30540 0))(
  ( (Nil!30537) (Cons!30536 (h!31745 tuple2!23398) (t!44426 List!30540)) )
))
(declare-datatypes ((ListLongMap!21055 0))(
  ( (ListLongMap!21056 (toList!10543 List!30540)) )
))
(declare-fun contains!8698 (ListLongMap!21055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5540 (array!89236 array!89234 (_ BitVec 32) (_ BitVec 32) V!53313 V!53313 (_ BitVec 32) Int) ListLongMap!21055)

(assert (=> b!1323115 (= res!878225 (contains!8698 (getCurrentListMap!5540 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323116 () Bool)

(assert (=> b!1323116 (= e!754367 (not true))))

(declare-fun lt!588731 () ListLongMap!21055)

(declare-fun +!4595 (ListLongMap!21055 tuple2!23398) ListLongMap!21055)

(assert (=> b!1323116 (contains!8698 (+!4595 lt!588731 (tuple2!23399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43610 0))(
  ( (Unit!43611) )
))
(declare-fun lt!588729 () Unit!43610)

(declare-fun addStillContains!1144 (ListLongMap!21055 (_ BitVec 64) V!53313 (_ BitVec 64)) Unit!43610)

(assert (=> b!1323116 (= lt!588729 (addStillContains!1144 lt!588731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323116 (contains!8698 lt!588731 k!1164)))

(declare-fun lt!588733 () ListLongMap!21055)

(declare-fun lt!588732 () tuple2!23398)

(assert (=> b!1323116 (= lt!588731 (+!4595 lt!588733 lt!588732))))

(declare-fun lt!588738 () Unit!43610)

(assert (=> b!1323116 (= lt!588738 (addStillContains!1144 lt!588733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323116 (contains!8698 lt!588733 k!1164)))

(declare-fun lt!588730 () V!53313)

(declare-fun lt!588735 () Unit!43610)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!191 ((_ BitVec 64) (_ BitVec 64) V!53313 ListLongMap!21055) Unit!43610)

(assert (=> b!1323116 (= lt!588735 (lemmaInListMapAfterAddingDiffThenInBefore!191 k!1164 (select (arr!43092 _keys!1609) from!2000) lt!588730 lt!588733))))

(declare-fun lt!588734 () ListLongMap!21055)

(assert (=> b!1323116 (contains!8698 lt!588734 k!1164)))

(declare-fun lt!588737 () Unit!43610)

(assert (=> b!1323116 (= lt!588737 (lemmaInListMapAfterAddingDiffThenInBefore!191 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588734))))

(declare-fun lt!588736 () ListLongMap!21055)

(assert (=> b!1323116 (contains!8698 lt!588736 k!1164)))

(declare-fun lt!588728 () Unit!43610)

(assert (=> b!1323116 (= lt!588728 (lemmaInListMapAfterAddingDiffThenInBefore!191 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588736))))

(assert (=> b!1323116 (= lt!588736 (+!4595 lt!588734 lt!588732))))

(assert (=> b!1323116 (= lt!588732 (tuple2!23399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323116 (= lt!588734 (+!4595 lt!588733 (tuple2!23399 (select (arr!43092 _keys!1609) from!2000) lt!588730)))))

(declare-fun get!21699 (ValueCell!17180 V!53313) V!53313)

(declare-fun dynLambda!3534 (Int (_ BitVec 64)) V!53313)

(assert (=> b!1323116 (= lt!588730 (get!21699 (select (arr!43091 _values!1337) from!2000) (dynLambda!3534 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6230 (array!89236 array!89234 (_ BitVec 32) (_ BitVec 32) V!53313 V!53313 (_ BitVec 32) Int) ListLongMap!21055)

(assert (=> b!1323116 (= lt!588733 (getCurrentListMapNoExtraKeys!6230 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323117 () Bool)

(declare-fun res!878227 () Bool)

(assert (=> b!1323117 (=> (not res!878227) (not e!754367))))

(assert (=> b!1323117 (= res!878227 (and (= (size!43641 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43642 _keys!1609) (size!43641 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55883 () Bool)

(declare-fun tp!106486 () Bool)

(declare-fun e!754369 () Bool)

(assert (=> mapNonEmpty!55883 (= mapRes!55883 (and tp!106486 e!754369))))

(declare-fun mapValue!55883 () ValueCell!17180)

(declare-fun mapKey!55883 () (_ BitVec 32))

(declare-fun mapRest!55883 () (Array (_ BitVec 32) ValueCell!17180))

(assert (=> mapNonEmpty!55883 (= (arr!43091 _values!1337) (store mapRest!55883 mapKey!55883 mapValue!55883))))

(declare-fun b!1323118 () Bool)

(declare-fun res!878222 () Bool)

(assert (=> b!1323118 (=> (not res!878222) (not e!754367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323118 (= res!878222 (validKeyInArray!0 (select (arr!43092 _keys!1609) from!2000)))))

(declare-fun b!1323119 () Bool)

(declare-fun res!878226 () Bool)

(assert (=> b!1323119 (=> (not res!878226) (not e!754367))))

(assert (=> b!1323119 (= res!878226 (not (= (select (arr!43092 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1323120 () Bool)

(declare-fun res!878221 () Bool)

(assert (=> b!1323120 (=> (not res!878221) (not e!754367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89236 (_ BitVec 32)) Bool)

(assert (=> b!1323120 (= res!878221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323121 () Bool)

(declare-fun res!878224 () Bool)

(assert (=> b!1323121 (=> (not res!878224) (not e!754367))))

(declare-datatypes ((List!30541 0))(
  ( (Nil!30538) (Cons!30537 (h!31746 (_ BitVec 64)) (t!44427 List!30541)) )
))
(declare-fun arrayNoDuplicates!0 (array!89236 (_ BitVec 32) List!30541) Bool)

(assert (=> b!1323121 (= res!878224 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30538))))

(declare-fun res!878228 () Bool)

(assert (=> start!111680 (=> (not res!878228) (not e!754367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111680 (= res!878228 (validMask!0 mask!2019))))

(assert (=> start!111680 e!754367))

(declare-fun array_inv!32533 (array!89236) Bool)

(assert (=> start!111680 (array_inv!32533 _keys!1609)))

(assert (=> start!111680 true))

(declare-fun tp_is_empty!36157 () Bool)

(assert (=> start!111680 tp_is_empty!36157))

(declare-fun e!754365 () Bool)

(declare-fun array_inv!32534 (array!89234) Bool)

(assert (=> start!111680 (and (array_inv!32534 _values!1337) e!754365)))

(assert (=> start!111680 tp!106487))

(declare-fun b!1323122 () Bool)

(declare-fun res!878223 () Bool)

(assert (=> b!1323122 (=> (not res!878223) (not e!754367))))

(assert (=> b!1323122 (= res!878223 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43642 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323123 () Bool)

(declare-fun e!754366 () Bool)

(assert (=> b!1323123 (= e!754365 (and e!754366 mapRes!55883))))

(declare-fun condMapEmpty!55883 () Bool)

(declare-fun mapDefault!55883 () ValueCell!17180)

