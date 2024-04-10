; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111782 () Bool)

(assert start!111782)

(declare-fun b_free!30439 () Bool)

(declare-fun b_next!30439 () Bool)

(assert (=> start!111782 (= b_free!30439 (not b_next!30439))))

(declare-fun tp!106792 () Bool)

(declare-fun b_and!48977 () Bool)

(assert (=> start!111782 (= tp!106792 b_and!48977)))

(declare-fun b!1324591 () Bool)

(declare-fun e!755134 () Bool)

(declare-fun tp_is_empty!36259 () Bool)

(assert (=> b!1324591 (= e!755134 tp_is_empty!36259)))

(declare-fun mapIsEmpty!56036 () Bool)

(declare-fun mapRes!56036 () Bool)

(assert (=> mapIsEmpty!56036 mapRes!56036))

(declare-fun b!1324592 () Bool)

(declare-fun e!755131 () Bool)

(assert (=> b!1324592 (= e!755131 false)))

(declare-datatypes ((array!89432 0))(
  ( (array!89433 (arr!43190 (Array (_ BitVec 32) (_ BitVec 64))) (size!43740 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89432)

(declare-fun lt!589482 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53449 0))(
  ( (V!53450 (val!18204 Int)) )
))
(declare-fun zeroValue!1279 () V!53449)

(declare-datatypes ((ValueCell!17231 0))(
  ( (ValueCellFull!17231 (v!20834 V!53449)) (EmptyCell!17231) )
))
(declare-datatypes ((array!89434 0))(
  ( (array!89435 (arr!43191 (Array (_ BitVec 32) ValueCell!17231)) (size!43741 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89434)

(declare-fun minValue!1279 () V!53449)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23476 0))(
  ( (tuple2!23477 (_1!11749 (_ BitVec 64)) (_2!11749 V!53449)) )
))
(declare-datatypes ((List!30617 0))(
  ( (Nil!30614) (Cons!30613 (h!31822 tuple2!23476) (t!44543 List!30617)) )
))
(declare-datatypes ((ListLongMap!21133 0))(
  ( (ListLongMap!21134 (toList!10582 List!30617)) )
))
(declare-fun contains!8737 (ListLongMap!21133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5578 (array!89432 array!89434 (_ BitVec 32) (_ BitVec 32) V!53449 V!53449 (_ BitVec 32) Int) ListLongMap!21133)

(assert (=> b!1324592 (= lt!589482 (contains!8737 (getCurrentListMap!5578 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324594 () Bool)

(declare-fun res!879197 () Bool)

(assert (=> b!1324594 (=> (not res!879197) (not e!755131))))

(assert (=> b!1324594 (= res!879197 (and (= (size!43741 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43740 _keys!1609) (size!43741 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324595 () Bool)

(declare-fun e!755133 () Bool)

(assert (=> b!1324595 (= e!755133 (and e!755134 mapRes!56036))))

(declare-fun condMapEmpty!56036 () Bool)

(declare-fun mapDefault!56036 () ValueCell!17231)

