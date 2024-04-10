; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111636 () Bool)

(assert start!111636)

(declare-fun b_free!30293 () Bool)

(declare-fun b_next!30293 () Bool)

(assert (=> start!111636 (= b_free!30293 (not b_next!30293))))

(declare-fun tp!106355 () Bool)

(declare-fun b_and!48745 () Bool)

(assert (=> start!111636 (= tp!106355 b_and!48745)))

(declare-fun b!1322345 () Bool)

(declare-fun res!877696 () Bool)

(declare-fun e!754037 () Bool)

(assert (=> b!1322345 (=> (not res!877696) (not e!754037))))

(declare-datatypes ((array!89148 0))(
  ( (array!89149 (arr!43048 (Array (_ BitVec 32) (_ BitVec 64))) (size!43598 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89148)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53253 0))(
  ( (V!53254 (val!18131 Int)) )
))
(declare-fun zeroValue!1279 () V!53253)

(declare-datatypes ((ValueCell!17158 0))(
  ( (ValueCellFull!17158 (v!20761 V!53253)) (EmptyCell!17158) )
))
(declare-datatypes ((array!89150 0))(
  ( (array!89151 (arr!43049 (Array (_ BitVec 32) ValueCell!17158)) (size!43599 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89150)

(declare-fun minValue!1279 () V!53253)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23360 0))(
  ( (tuple2!23361 (_1!11691 (_ BitVec 64)) (_2!11691 V!53253)) )
))
(declare-datatypes ((List!30507 0))(
  ( (Nil!30504) (Cons!30503 (h!31712 tuple2!23360) (t!44349 List!30507)) )
))
(declare-datatypes ((ListLongMap!21017 0))(
  ( (ListLongMap!21018 (toList!10524 List!30507)) )
))
(declare-fun contains!8679 (ListLongMap!21017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5525 (array!89148 array!89150 (_ BitVec 32) (_ BitVec 32) V!53253 V!53253 (_ BitVec 32) Int) ListLongMap!21017)

(assert (=> b!1322345 (= res!877696 (contains!8679 (getCurrentListMap!5525 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapIsEmpty!55817 () Bool)

(declare-fun mapRes!55817 () Bool)

(assert (=> mapIsEmpty!55817 mapRes!55817))

(declare-fun b!1322346 () Bool)

(declare-fun e!754036 () Bool)

(declare-fun tp_is_empty!36113 () Bool)

(assert (=> b!1322346 (= e!754036 tp_is_empty!36113)))

(declare-fun mapNonEmpty!55817 () Bool)

(declare-fun tp!106354 () Bool)

(assert (=> mapNonEmpty!55817 (= mapRes!55817 (and tp!106354 e!754036))))

(declare-fun mapRest!55817 () (Array (_ BitVec 32) ValueCell!17158))

(declare-fun mapValue!55817 () ValueCell!17158)

(declare-fun mapKey!55817 () (_ BitVec 32))

(assert (=> mapNonEmpty!55817 (= (arr!43049 _values!1337) (store mapRest!55817 mapKey!55817 mapValue!55817))))

(declare-fun b!1322347 () Bool)

(declare-fun res!877698 () Bool)

(assert (=> b!1322347 (=> (not res!877698) (not e!754037))))

(declare-datatypes ((List!30508 0))(
  ( (Nil!30505) (Cons!30504 (h!31713 (_ BitVec 64)) (t!44350 List!30508)) )
))
(declare-fun arrayNoDuplicates!0 (array!89148 (_ BitVec 32) List!30508) Bool)

(assert (=> b!1322347 (= res!877698 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30505))))

(declare-fun b!1322348 () Bool)

(declare-fun res!877693 () Bool)

(assert (=> b!1322348 (=> (not res!877693) (not e!754037))))

(assert (=> b!1322348 (= res!877693 (and (= (size!43599 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43598 _keys!1609) (size!43599 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322349 () Bool)

(declare-fun e!754038 () Bool)

(declare-fun e!754039 () Bool)

(assert (=> b!1322349 (= e!754038 (and e!754039 mapRes!55817))))

(declare-fun condMapEmpty!55817 () Bool)

(declare-fun mapDefault!55817 () ValueCell!17158)

