; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111642 () Bool)

(assert start!111642)

(declare-fun b_free!30299 () Bool)

(declare-fun b_next!30299 () Bool)

(assert (=> start!111642 (= b_free!30299 (not b_next!30299))))

(declare-fun tp!106372 () Bool)

(declare-fun b_and!48757 () Bool)

(assert (=> start!111642 (= tp!106372 b_and!48757)))

(declare-fun b!1322451 () Bool)

(declare-fun res!877771 () Bool)

(declare-fun e!754082 () Bool)

(assert (=> b!1322451 (=> (not res!877771) (not e!754082))))

(declare-datatypes ((array!89160 0))(
  ( (array!89161 (arr!43054 (Array (_ BitVec 32) (_ BitVec 64))) (size!43604 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89160)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53261 0))(
  ( (V!53262 (val!18134 Int)) )
))
(declare-datatypes ((ValueCell!17161 0))(
  ( (ValueCellFull!17161 (v!20764 V!53261)) (EmptyCell!17161) )
))
(declare-datatypes ((array!89162 0))(
  ( (array!89163 (arr!43055 (Array (_ BitVec 32) ValueCell!17161)) (size!43605 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89162)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1322451 (= res!877771 (and (= (size!43605 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43604 _keys!1609) (size!43605 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322452 () Bool)

(declare-fun res!877769 () Bool)

(assert (=> b!1322452 (=> (not res!877769) (not e!754082))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53261)

(declare-fun minValue!1279 () V!53261)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23364 0))(
  ( (tuple2!23365 (_1!11693 (_ BitVec 64)) (_2!11693 V!53261)) )
))
(declare-datatypes ((List!30511 0))(
  ( (Nil!30508) (Cons!30507 (h!31716 tuple2!23364) (t!44359 List!30511)) )
))
(declare-datatypes ((ListLongMap!21021 0))(
  ( (ListLongMap!21022 (toList!10526 List!30511)) )
))
(declare-fun contains!8681 (ListLongMap!21021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5527 (array!89160 array!89162 (_ BitVec 32) (_ BitVec 32) V!53261 V!53261 (_ BitVec 32) Int) ListLongMap!21021)

(assert (=> b!1322452 (= res!877769 (contains!8681 (getCurrentListMap!5527 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapIsEmpty!55826 () Bool)

(declare-fun mapRes!55826 () Bool)

(assert (=> mapIsEmpty!55826 mapRes!55826))

(declare-fun b!1322453 () Bool)

(declare-fun res!877772 () Bool)

(assert (=> b!1322453 (=> (not res!877772) (not e!754082))))

(assert (=> b!1322453 (= res!877772 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43604 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322454 () Bool)

(declare-fun e!754080 () Bool)

(declare-fun e!754083 () Bool)

(assert (=> b!1322454 (= e!754080 (and e!754083 mapRes!55826))))

(declare-fun condMapEmpty!55826 () Bool)

(declare-fun mapDefault!55826 () ValueCell!17161)

