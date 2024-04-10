; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111462 () Bool)

(assert start!111462)

(declare-fun b_free!30119 () Bool)

(declare-fun b_next!30119 () Bool)

(assert (=> start!111462 (= b_free!30119 (not b_next!30119))))

(declare-fun tp!105833 () Bool)

(declare-fun b_and!48397 () Bool)

(assert (=> start!111462 (= tp!105833 b_and!48397)))

(declare-fun b!1319300 () Bool)

(declare-fun res!875607 () Bool)

(declare-fun e!752732 () Bool)

(assert (=> b!1319300 (=> (not res!875607) (not e!752732))))

(declare-datatypes ((array!88816 0))(
  ( (array!88817 (arr!42882 (Array (_ BitVec 32) (_ BitVec 64))) (size!43432 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88816)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53021 0))(
  ( (V!53022 (val!18044 Int)) )
))
(declare-datatypes ((ValueCell!17071 0))(
  ( (ValueCellFull!17071 (v!20674 V!53021)) (EmptyCell!17071) )
))
(declare-datatypes ((array!88818 0))(
  ( (array!88819 (arr!42883 (Array (_ BitVec 32) ValueCell!17071)) (size!43433 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88818)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319300 (= res!875607 (and (= (size!43433 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43432 _keys!1609) (size!43433 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319301 () Bool)

(assert (=> b!1319301 (= e!752732 (not true))))

(declare-datatypes ((tuple2!23220 0))(
  ( (tuple2!23221 (_1!11621 (_ BitVec 64)) (_2!11621 V!53021)) )
))
(declare-datatypes ((List!30375 0))(
  ( (Nil!30372) (Cons!30371 (h!31580 tuple2!23220) (t!44043 List!30375)) )
))
(declare-datatypes ((ListLongMap!20877 0))(
  ( (ListLongMap!20878 (toList!10454 List!30375)) )
))
(declare-fun lt!586616 () ListLongMap!20877)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8609 (ListLongMap!20877 (_ BitVec 64)) Bool)

(assert (=> b!1319301 (contains!8609 lt!586616 k!1164)))

(declare-datatypes ((Unit!43450 0))(
  ( (Unit!43451) )
))
(declare-fun lt!586617 () Unit!43450)

(declare-fun minValue!1279 () V!53021)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!111 ((_ BitVec 64) (_ BitVec 64) V!53021 ListLongMap!20877) Unit!43450)

(assert (=> b!1319301 (= lt!586617 (lemmaInListMapAfterAddingDiffThenInBefore!111 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586616))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53021)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4515 (ListLongMap!20877 tuple2!23220) ListLongMap!20877)

(declare-fun getCurrentListMapNoExtraKeys!6150 (array!88816 array!88818 (_ BitVec 32) (_ BitVec 32) V!53021 V!53021 (_ BitVec 32) Int) ListLongMap!20877)

(declare-fun get!21545 (ValueCell!17071 V!53021) V!53021)

(declare-fun dynLambda!3454 (Int (_ BitVec 64)) V!53021)

(assert (=> b!1319301 (= lt!586616 (+!4515 (+!4515 (getCurrentListMapNoExtraKeys!6150 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23221 (select (arr!42882 _keys!1609) from!2000) (get!21545 (select (arr!42883 _values!1337) from!2000) (dynLambda!3454 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319302 () Bool)

(declare-fun res!875606 () Bool)

(assert (=> b!1319302 (=> (not res!875606) (not e!752732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88816 (_ BitVec 32)) Bool)

(assert (=> b!1319302 (= res!875606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55556 () Bool)

(declare-fun mapRes!55556 () Bool)

(declare-fun tp!105832 () Bool)

(declare-fun e!752731 () Bool)

(assert (=> mapNonEmpty!55556 (= mapRes!55556 (and tp!105832 e!752731))))

(declare-fun mapKey!55556 () (_ BitVec 32))

(declare-fun mapValue!55556 () ValueCell!17071)

(declare-fun mapRest!55556 () (Array (_ BitVec 32) ValueCell!17071))

(assert (=> mapNonEmpty!55556 (= (arr!42883 _values!1337) (store mapRest!55556 mapKey!55556 mapValue!55556))))

(declare-fun b!1319303 () Bool)

(declare-fun res!875609 () Bool)

(assert (=> b!1319303 (=> (not res!875609) (not e!752732))))

(assert (=> b!1319303 (= res!875609 (not (= (select (arr!42882 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55556 () Bool)

(assert (=> mapIsEmpty!55556 mapRes!55556))

(declare-fun b!1319304 () Bool)

(declare-fun res!875608 () Bool)

(assert (=> b!1319304 (=> (not res!875608) (not e!752732))))

(declare-datatypes ((List!30376 0))(
  ( (Nil!30373) (Cons!30372 (h!31581 (_ BitVec 64)) (t!44044 List!30376)) )
))
(declare-fun arrayNoDuplicates!0 (array!88816 (_ BitVec 32) List!30376) Bool)

(assert (=> b!1319304 (= res!875608 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30373))))

(declare-fun b!1319305 () Bool)

(declare-fun e!752730 () Bool)

(declare-fun e!752733 () Bool)

(assert (=> b!1319305 (= e!752730 (and e!752733 mapRes!55556))))

(declare-fun condMapEmpty!55556 () Bool)

(declare-fun mapDefault!55556 () ValueCell!17071)

