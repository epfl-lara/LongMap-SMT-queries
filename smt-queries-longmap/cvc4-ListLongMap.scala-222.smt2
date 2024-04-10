; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4018 () Bool)

(assert start!4018)

(declare-fun b_free!923 () Bool)

(declare-fun b_next!923 () Bool)

(assert (=> start!4018 (= b_free!923 (not b_next!923))))

(declare-fun tp!4189 () Bool)

(declare-fun b_and!1733 () Bool)

(assert (=> start!4018 (= tp!4189 b_and!1733)))

(declare-fun b!29271 () Bool)

(declare-fun res!17536 () Bool)

(declare-fun e!18905 () Bool)

(assert (=> b!29271 (=> (not res!17536) (not e!18905))))

(declare-datatypes ((array!1785 0))(
  ( (array!1786 (arr!846 (Array (_ BitVec 32) (_ BitVec 64))) (size!947 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1785)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29271 (= res!17536 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29272 () Bool)

(declare-fun e!18903 () Bool)

(assert (=> b!29272 (= e!18903 e!18905)))

(declare-fun res!17537 () Bool)

(assert (=> b!29272 (=> (not res!17537) (not e!18905))))

(declare-datatypes ((V!1527 0))(
  ( (V!1528 (val!665 Int)) )
))
(declare-datatypes ((tuple2!1102 0))(
  ( (tuple2!1103 (_1!562 (_ BitVec 64)) (_2!562 V!1527)) )
))
(declare-datatypes ((List!702 0))(
  ( (Nil!699) (Cons!698 (h!1265 tuple2!1102) (t!3395 List!702)) )
))
(declare-datatypes ((ListLongMap!679 0))(
  ( (ListLongMap!680 (toList!355 List!702)) )
))
(declare-fun lt!11174 () ListLongMap!679)

(declare-fun contains!295 (ListLongMap!679 (_ BitVec 64)) Bool)

(assert (=> b!29272 (= res!17537 (not (contains!295 lt!11174 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!439 0))(
  ( (ValueCellFull!439 (v!1754 V!1527)) (EmptyCell!439) )
))
(declare-datatypes ((array!1787 0))(
  ( (array!1788 (arr!847 (Array (_ BitVec 32) ValueCell!439)) (size!948 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1787)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1527)

(declare-fun minValue!1443 () V!1527)

(declare-fun getCurrentListMap!185 (array!1785 array!1787 (_ BitVec 32) (_ BitVec 32) V!1527 V!1527 (_ BitVec 32) Int) ListLongMap!679)

(assert (=> b!29272 (= lt!11174 (getCurrentListMap!185 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29273 () Bool)

(declare-fun e!18908 () Bool)

(declare-fun e!18907 () Bool)

(declare-fun mapRes!1444 () Bool)

(assert (=> b!29273 (= e!18908 (and e!18907 mapRes!1444))))

(declare-fun condMapEmpty!1444 () Bool)

(declare-fun mapDefault!1444 () ValueCell!439)

