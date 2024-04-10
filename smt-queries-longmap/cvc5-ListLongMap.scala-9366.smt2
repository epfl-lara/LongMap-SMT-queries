; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111632 () Bool)

(assert start!111632)

(declare-fun b_free!30289 () Bool)

(declare-fun b_next!30289 () Bool)

(assert (=> start!111632 (= b_free!30289 (not b_next!30289))))

(declare-fun tp!106342 () Bool)

(declare-fun b_and!48737 () Bool)

(assert (=> start!111632 (= tp!106342 b_and!48737)))

(declare-fun b!1322275 () Bool)

(declare-fun e!754007 () Bool)

(declare-fun tp_is_empty!36109 () Bool)

(assert (=> b!1322275 (= e!754007 tp_is_empty!36109)))

(declare-fun b!1322276 () Bool)

(declare-fun e!754008 () Bool)

(assert (=> b!1322276 (= e!754008 (not true))))

(declare-datatypes ((V!53249 0))(
  ( (V!53250 (val!18129 Int)) )
))
(declare-datatypes ((tuple2!23356 0))(
  ( (tuple2!23357 (_1!11689 (_ BitVec 64)) (_2!11689 V!53249)) )
))
(declare-datatypes ((List!30503 0))(
  ( (Nil!30500) (Cons!30499 (h!31708 tuple2!23356) (t!44341 List!30503)) )
))
(declare-datatypes ((ListLongMap!21013 0))(
  ( (ListLongMap!21014 (toList!10522 List!30503)) )
))
(declare-fun lt!588043 () ListLongMap!21013)

(declare-fun lt!588042 () tuple2!23356)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8677 (ListLongMap!21013 (_ BitVec 64)) Bool)

(declare-fun +!4577 (ListLongMap!21013 tuple2!23356) ListLongMap!21013)

(assert (=> b!1322276 (contains!8677 (+!4577 lt!588043 lt!588042) k!1164)))

(declare-fun zeroValue!1279 () V!53249)

(declare-datatypes ((Unit!43574 0))(
  ( (Unit!43575) )
))
(declare-fun lt!588041 () Unit!43574)

(declare-fun addStillContains!1126 (ListLongMap!21013 (_ BitVec 64) V!53249 (_ BitVec 64)) Unit!43574)

(assert (=> b!1322276 (= lt!588041 (addStillContains!1126 lt!588043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322276 (contains!8677 lt!588043 k!1164)))

(declare-datatypes ((array!89140 0))(
  ( (array!89141 (arr!43044 (Array (_ BitVec 32) (_ BitVec 64))) (size!43594 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89140)

(declare-fun lt!588046 () Unit!43574)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588040 () V!53249)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!173 ((_ BitVec 64) (_ BitVec 64) V!53249 ListLongMap!21013) Unit!43574)

(assert (=> b!1322276 (= lt!588046 (lemmaInListMapAfterAddingDiffThenInBefore!173 k!1164 (select (arr!43044 _keys!1609) from!2000) lt!588040 lt!588043))))

(declare-fun lt!588044 () ListLongMap!21013)

(assert (=> b!1322276 (contains!8677 lt!588044 k!1164)))

(declare-fun lt!588047 () Unit!43574)

(assert (=> b!1322276 (= lt!588047 (lemmaInListMapAfterAddingDiffThenInBefore!173 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588044))))

(declare-fun lt!588048 () ListLongMap!21013)

(assert (=> b!1322276 (contains!8677 lt!588048 k!1164)))

(declare-fun minValue!1279 () V!53249)

(declare-fun lt!588045 () Unit!43574)

(assert (=> b!1322276 (= lt!588045 (lemmaInListMapAfterAddingDiffThenInBefore!173 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588048))))

(assert (=> b!1322276 (= lt!588048 (+!4577 lt!588044 lt!588042))))

(assert (=> b!1322276 (= lt!588042 (tuple2!23357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322276 (= lt!588044 (+!4577 lt!588043 (tuple2!23357 (select (arr!43044 _keys!1609) from!2000) lt!588040)))))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((ValueCell!17156 0))(
  ( (ValueCellFull!17156 (v!20759 V!53249)) (EmptyCell!17156) )
))
(declare-datatypes ((array!89142 0))(
  ( (array!89143 (arr!43045 (Array (_ BitVec 32) ValueCell!17156)) (size!43595 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89142)

(declare-fun get!21665 (ValueCell!17156 V!53249) V!53249)

(declare-fun dynLambda!3516 (Int (_ BitVec 64)) V!53249)

(assert (=> b!1322276 (= lt!588040 (get!21665 (select (arr!43045 _values!1337) from!2000) (dynLambda!3516 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6212 (array!89140 array!89142 (_ BitVec 32) (_ BitVec 32) V!53249 V!53249 (_ BitVec 32) Int) ListLongMap!21013)

(assert (=> b!1322276 (= lt!588043 (getCurrentListMapNoExtraKeys!6212 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322277 () Bool)

(declare-fun res!877648 () Bool)

(assert (=> b!1322277 (=> (not res!877648) (not e!754008))))

(declare-fun getCurrentListMap!5523 (array!89140 array!89142 (_ BitVec 32) (_ BitVec 32) V!53249 V!53249 (_ BitVec 32) Int) ListLongMap!21013)

(assert (=> b!1322277 (= res!877648 (contains!8677 (getCurrentListMap!5523 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322278 () Bool)

(declare-fun res!877645 () Bool)

(assert (=> b!1322278 (=> (not res!877645) (not e!754008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89140 (_ BitVec 32)) Bool)

(assert (=> b!1322278 (= res!877645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55811 () Bool)

(declare-fun mapRes!55811 () Bool)

(declare-fun tp!106343 () Bool)

(assert (=> mapNonEmpty!55811 (= mapRes!55811 (and tp!106343 e!754007))))

(declare-fun mapRest!55811 () (Array (_ BitVec 32) ValueCell!17156))

(declare-fun mapValue!55811 () ValueCell!17156)

(declare-fun mapKey!55811 () (_ BitVec 32))

(assert (=> mapNonEmpty!55811 (= (arr!43045 _values!1337) (store mapRest!55811 mapKey!55811 mapValue!55811))))

(declare-fun b!1322279 () Bool)

(declare-fun res!877647 () Bool)

(assert (=> b!1322279 (=> (not res!877647) (not e!754008))))

(declare-datatypes ((List!30504 0))(
  ( (Nil!30501) (Cons!30500 (h!31709 (_ BitVec 64)) (t!44342 List!30504)) )
))
(declare-fun arrayNoDuplicates!0 (array!89140 (_ BitVec 32) List!30504) Bool)

(assert (=> b!1322279 (= res!877647 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30501))))

(declare-fun res!877649 () Bool)

(assert (=> start!111632 (=> (not res!877649) (not e!754008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111632 (= res!877649 (validMask!0 mask!2019))))

(assert (=> start!111632 e!754008))

(declare-fun array_inv!32499 (array!89140) Bool)

(assert (=> start!111632 (array_inv!32499 _keys!1609)))

(assert (=> start!111632 true))

(assert (=> start!111632 tp_is_empty!36109))

(declare-fun e!754006 () Bool)

(declare-fun array_inv!32500 (array!89142) Bool)

(assert (=> start!111632 (and (array_inv!32500 _values!1337) e!754006)))

(assert (=> start!111632 tp!106342))

(declare-fun mapIsEmpty!55811 () Bool)

(assert (=> mapIsEmpty!55811 mapRes!55811))

(declare-fun b!1322280 () Bool)

(declare-fun res!877651 () Bool)

(assert (=> b!1322280 (=> (not res!877651) (not e!754008))))

(assert (=> b!1322280 (= res!877651 (not (= (select (arr!43044 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322281 () Bool)

(declare-fun res!877652 () Bool)

(assert (=> b!1322281 (=> (not res!877652) (not e!754008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322281 (= res!877652 (validKeyInArray!0 (select (arr!43044 _keys!1609) from!2000)))))

(declare-fun b!1322282 () Bool)

(declare-fun res!877646 () Bool)

(assert (=> b!1322282 (=> (not res!877646) (not e!754008))))

(assert (=> b!1322282 (= res!877646 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43594 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322283 () Bool)

(declare-fun e!754009 () Bool)

(assert (=> b!1322283 (= e!754006 (and e!754009 mapRes!55811))))

(declare-fun condMapEmpty!55811 () Bool)

(declare-fun mapDefault!55811 () ValueCell!17156)

