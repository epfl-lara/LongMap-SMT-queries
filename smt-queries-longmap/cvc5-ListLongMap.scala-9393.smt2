; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111794 () Bool)

(assert start!111794)

(declare-fun b_free!30451 () Bool)

(declare-fun b_next!30451 () Bool)

(assert (=> start!111794 (= b_free!30451 (not b_next!30451))))

(declare-fun tp!106828 () Bool)

(declare-fun b_and!48989 () Bool)

(assert (=> start!111794 (= tp!106828 b_and!48989)))

(declare-fun b!1324768 () Bool)

(declare-fun res!879319 () Bool)

(declare-fun e!755223 () Bool)

(assert (=> b!1324768 (=> (not res!879319) (not e!755223))))

(declare-datatypes ((array!89450 0))(
  ( (array!89451 (arr!43199 (Array (_ BitVec 32) (_ BitVec 64))) (size!43749 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89450)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324768 (= res!879319 (validKeyInArray!0 (select (arr!43199 _keys!1609) from!2000)))))

(declare-fun b!1324769 () Bool)

(declare-fun res!879322 () Bool)

(assert (=> b!1324769 (=> (not res!879322) (not e!755223))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53465 0))(
  ( (V!53466 (val!18210 Int)) )
))
(declare-datatypes ((ValueCell!17237 0))(
  ( (ValueCellFull!17237 (v!20840 V!53465)) (EmptyCell!17237) )
))
(declare-datatypes ((array!89452 0))(
  ( (array!89453 (arr!43200 (Array (_ BitVec 32) ValueCell!17237)) (size!43750 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89452)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324769 (= res!879322 (and (= (size!43750 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43749 _keys!1609) (size!43750 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324770 () Bool)

(declare-fun res!879325 () Bool)

(assert (=> b!1324770 (=> (not res!879325) (not e!755223))))

(declare-datatypes ((List!30622 0))(
  ( (Nil!30619) (Cons!30618 (h!31827 (_ BitVec 64)) (t!44548 List!30622)) )
))
(declare-fun arrayNoDuplicates!0 (array!89450 (_ BitVec 32) List!30622) Bool)

(assert (=> b!1324770 (= res!879325 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30619))))

(declare-fun b!1324771 () Bool)

(declare-fun res!879324 () Bool)

(assert (=> b!1324771 (=> (not res!879324) (not e!755223))))

(declare-fun zeroValue!1279 () V!53465)

(declare-fun minValue!1279 () V!53465)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23482 0))(
  ( (tuple2!23483 (_1!11752 (_ BitVec 64)) (_2!11752 V!53465)) )
))
(declare-datatypes ((List!30623 0))(
  ( (Nil!30620) (Cons!30619 (h!31828 tuple2!23482) (t!44549 List!30623)) )
))
(declare-datatypes ((ListLongMap!21139 0))(
  ( (ListLongMap!21140 (toList!10585 List!30623)) )
))
(declare-fun contains!8740 (ListLongMap!21139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5581 (array!89450 array!89452 (_ BitVec 32) (_ BitVec 32) V!53465 V!53465 (_ BitVec 32) Int) ListLongMap!21139)

(assert (=> b!1324771 (= res!879324 (contains!8740 (getCurrentListMap!5581 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324772 () Bool)

(declare-fun e!755222 () Bool)

(declare-fun tp_is_empty!36271 () Bool)

(assert (=> b!1324772 (= e!755222 tp_is_empty!36271)))

(declare-fun b!1324773 () Bool)

(declare-fun e!755221 () Bool)

(assert (=> b!1324773 (= e!755221 tp_is_empty!36271)))

(declare-fun b!1324774 () Bool)

(declare-fun res!879320 () Bool)

(assert (=> b!1324774 (=> (not res!879320) (not e!755223))))

(assert (=> b!1324774 (= res!879320 (not (= (select (arr!43199 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!56054 () Bool)

(declare-fun mapRes!56054 () Bool)

(assert (=> mapIsEmpty!56054 mapRes!56054))

(declare-fun b!1324776 () Bool)

(assert (=> b!1324776 (= e!755223 (bvsge from!2000 (size!43750 _values!1337)))))

(declare-fun lt!589500 () ListLongMap!21139)

(declare-fun getCurrentListMapNoExtraKeys!6247 (array!89450 array!89452 (_ BitVec 32) (_ BitVec 32) V!53465 V!53465 (_ BitVec 32) Int) ListLongMap!21139)

(assert (=> b!1324776 (= lt!589500 (getCurrentListMapNoExtraKeys!6247 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!56054 () Bool)

(declare-fun tp!106829 () Bool)

(assert (=> mapNonEmpty!56054 (= mapRes!56054 (and tp!106829 e!755221))))

(declare-fun mapRest!56054 () (Array (_ BitVec 32) ValueCell!17237))

(declare-fun mapValue!56054 () ValueCell!17237)

(declare-fun mapKey!56054 () (_ BitVec 32))

(assert (=> mapNonEmpty!56054 (= (arr!43200 _values!1337) (store mapRest!56054 mapKey!56054 mapValue!56054))))

(declare-fun b!1324777 () Bool)

(declare-fun e!755220 () Bool)

(assert (=> b!1324777 (= e!755220 (and e!755222 mapRes!56054))))

(declare-fun condMapEmpty!56054 () Bool)

(declare-fun mapDefault!56054 () ValueCell!17237)

