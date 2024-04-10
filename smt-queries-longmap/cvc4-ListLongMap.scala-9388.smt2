; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111768 () Bool)

(assert start!111768)

(declare-fun b_free!30425 () Bool)

(declare-fun b_next!30425 () Bool)

(assert (=> start!111768 (= b_free!30425 (not b_next!30425))))

(declare-fun tp!106751 () Bool)

(declare-fun b_and!48963 () Bool)

(assert (=> start!111768 (= tp!106751 b_and!48963)))

(declare-fun b!1324396 () Bool)

(declare-fun e!755028 () Bool)

(declare-fun tp_is_empty!36245 () Bool)

(assert (=> b!1324396 (= e!755028 tp_is_empty!36245)))

(declare-fun b!1324397 () Bool)

(declare-fun e!755027 () Bool)

(assert (=> b!1324397 (= e!755027 tp_is_empty!36245)))

(declare-fun b!1324398 () Bool)

(declare-fun e!755029 () Bool)

(assert (=> b!1324398 (= e!755029 false)))

(declare-datatypes ((array!89406 0))(
  ( (array!89407 (arr!43177 (Array (_ BitVec 32) (_ BitVec 64))) (size!43727 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89406)

(declare-datatypes ((V!53429 0))(
  ( (V!53430 (val!18197 Int)) )
))
(declare-fun zeroValue!1279 () V!53429)

(declare-datatypes ((ValueCell!17224 0))(
  ( (ValueCellFull!17224 (v!20827 V!53429)) (EmptyCell!17224) )
))
(declare-datatypes ((array!89408 0))(
  ( (array!89409 (arr!43178 (Array (_ BitVec 32) ValueCell!17224)) (size!43728 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89408)

(declare-fun minValue!1279 () V!53429)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun lt!589470 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23464 0))(
  ( (tuple2!23465 (_1!11743 (_ BitVec 64)) (_2!11743 V!53429)) )
))
(declare-datatypes ((List!30607 0))(
  ( (Nil!30604) (Cons!30603 (h!31812 tuple2!23464) (t!44533 List!30607)) )
))
(declare-datatypes ((ListLongMap!21121 0))(
  ( (ListLongMap!21122 (toList!10576 List!30607)) )
))
(declare-fun contains!8731 (ListLongMap!21121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5572 (array!89406 array!89408 (_ BitVec 32) (_ BitVec 32) V!53429 V!53429 (_ BitVec 32) Int) ListLongMap!21121)

(assert (=> b!1324398 (= lt!589470 (contains!8731 (getCurrentListMap!5572 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324399 () Bool)

(declare-fun res!879068 () Bool)

(assert (=> b!1324399 (=> (not res!879068) (not e!755029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89406 (_ BitVec 32)) Bool)

(assert (=> b!1324399 (= res!879068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324400 () Bool)

(declare-fun e!755025 () Bool)

(declare-fun mapRes!56015 () Bool)

(assert (=> b!1324400 (= e!755025 (and e!755027 mapRes!56015))))

(declare-fun condMapEmpty!56015 () Bool)

(declare-fun mapDefault!56015 () ValueCell!17224)

