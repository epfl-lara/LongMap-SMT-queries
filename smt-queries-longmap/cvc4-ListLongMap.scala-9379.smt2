; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111714 () Bool)

(assert start!111714)

(declare-fun b_free!30371 () Bool)

(declare-fun b_next!30371 () Bool)

(assert (=> start!111714 (= b_free!30371 (not b_next!30371))))

(declare-fun tp!106588 () Bool)

(declare-fun b_and!48901 () Bool)

(assert (=> start!111714 (= tp!106588 b_and!48901)))

(declare-fun b!1323710 () Bool)

(declare-fun res!878635 () Bool)

(declare-fun e!754623 () Bool)

(assert (=> b!1323710 (=> (not res!878635) (not e!754623))))

(declare-datatypes ((array!89298 0))(
  ( (array!89299 (arr!43123 (Array (_ BitVec 32) (_ BitVec 64))) (size!43673 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89298)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89298 (_ BitVec 32)) Bool)

(assert (=> b!1323710 (= res!878635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323711 () Bool)

(assert (=> b!1323711 (= e!754623 (not true))))

(declare-datatypes ((V!53357 0))(
  ( (V!53358 (val!18170 Int)) )
))
(declare-datatypes ((tuple2!23424 0))(
  ( (tuple2!23425 (_1!11723 (_ BitVec 64)) (_2!11723 V!53357)) )
))
(declare-datatypes ((List!30567 0))(
  ( (Nil!30564) (Cons!30563 (h!31772 tuple2!23424) (t!44487 List!30567)) )
))
(declare-datatypes ((ListLongMap!21081 0))(
  ( (ListLongMap!21082 (toList!10556 List!30567)) )
))
(declare-fun lt!589295 () ListLongMap!21081)

(declare-fun minValue!1279 () V!53357)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8711 (ListLongMap!21081 (_ BitVec 64)) Bool)

(declare-fun +!4607 (ListLongMap!21081 tuple2!23424) ListLongMap!21081)

(assert (=> b!1323711 (contains!8711 (+!4607 lt!589295 (tuple2!23425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43634 0))(
  ( (Unit!43635) )
))
(declare-fun lt!589299 () Unit!43634)

(declare-fun addStillContains!1156 (ListLongMap!21081 (_ BitVec 64) V!53357 (_ BitVec 64)) Unit!43634)

(assert (=> b!1323711 (= lt!589299 (addStillContains!1156 lt!589295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323711 (contains!8711 lt!589295 k!1164)))

(declare-fun lt!589297 () ListLongMap!21081)

(declare-fun lt!589291 () tuple2!23424)

(assert (=> b!1323711 (= lt!589295 (+!4607 lt!589297 lt!589291))))

(declare-fun zeroValue!1279 () V!53357)

(declare-fun lt!589294 () Unit!43634)

(assert (=> b!1323711 (= lt!589294 (addStillContains!1156 lt!589297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323711 (contains!8711 lt!589297 k!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!589296 () V!53357)

(declare-fun lt!589292 () Unit!43634)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!203 ((_ BitVec 64) (_ BitVec 64) V!53357 ListLongMap!21081) Unit!43634)

(assert (=> b!1323711 (= lt!589292 (lemmaInListMapAfterAddingDiffThenInBefore!203 k!1164 (select (arr!43123 _keys!1609) from!2000) lt!589296 lt!589297))))

(declare-fun lt!589298 () ListLongMap!21081)

(assert (=> b!1323711 (contains!8711 lt!589298 k!1164)))

(declare-fun lt!589289 () Unit!43634)

(assert (=> b!1323711 (= lt!589289 (lemmaInListMapAfterAddingDiffThenInBefore!203 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589298))))

(declare-fun lt!589290 () ListLongMap!21081)

(assert (=> b!1323711 (contains!8711 lt!589290 k!1164)))

(declare-fun lt!589293 () Unit!43634)

(assert (=> b!1323711 (= lt!589293 (lemmaInListMapAfterAddingDiffThenInBefore!203 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589290))))

(assert (=> b!1323711 (= lt!589290 (+!4607 lt!589298 lt!589291))))

(assert (=> b!1323711 (= lt!589291 (tuple2!23425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323711 (= lt!589298 (+!4607 lt!589297 (tuple2!23425 (select (arr!43123 _keys!1609) from!2000) lt!589296)))))

(declare-datatypes ((ValueCell!17197 0))(
  ( (ValueCellFull!17197 (v!20800 V!53357)) (EmptyCell!17197) )
))
(declare-datatypes ((array!89300 0))(
  ( (array!89301 (arr!43124 (Array (_ BitVec 32) ValueCell!17197)) (size!43674 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89300)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21721 (ValueCell!17197 V!53357) V!53357)

(declare-fun dynLambda!3546 (Int (_ BitVec 64)) V!53357)

(assert (=> b!1323711 (= lt!589296 (get!21721 (select (arr!43124 _values!1337) from!2000) (dynLambda!3546 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6242 (array!89298 array!89300 (_ BitVec 32) (_ BitVec 32) V!53357 V!53357 (_ BitVec 32) Int) ListLongMap!21081)

(assert (=> b!1323711 (= lt!589297 (getCurrentListMapNoExtraKeys!6242 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323712 () Bool)

(declare-fun e!754624 () Bool)

(declare-fun e!754621 () Bool)

(declare-fun mapRes!55934 () Bool)

(assert (=> b!1323712 (= e!754624 (and e!754621 mapRes!55934))))

(declare-fun condMapEmpty!55934 () Bool)

(declare-fun mapDefault!55934 () ValueCell!17197)

