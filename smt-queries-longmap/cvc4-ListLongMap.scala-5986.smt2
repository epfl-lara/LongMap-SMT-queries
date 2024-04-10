; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77746 () Bool)

(assert start!77746)

(declare-fun b_free!16331 () Bool)

(declare-fun b_next!16331 () Bool)

(assert (=> start!77746 (= b_free!16331 (not b_next!16331))))

(declare-fun tp!57255 () Bool)

(declare-fun b_and!26815 () Bool)

(assert (=> start!77746 (= tp!57255 b_and!26815)))

(declare-fun b!907296 () Bool)

(declare-fun e!508466 () Bool)

(declare-fun e!508471 () Bool)

(assert (=> b!907296 (= e!508466 (not e!508471))))

(declare-fun res!612359 () Bool)

(assert (=> b!907296 (=> res!612359 e!508471)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53534 0))(
  ( (array!53535 (arr!25726 (Array (_ BitVec 32) (_ BitVec 64))) (size!26185 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53534)

(assert (=> b!907296 (= res!612359 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26185 _keys!1386))))))

(declare-datatypes ((V!29963 0))(
  ( (V!29964 (val!9425 Int)) )
))
(declare-datatypes ((ValueCell!8893 0))(
  ( (ValueCellFull!8893 (v!11930 V!29963)) (EmptyCell!8893) )
))
(declare-datatypes ((array!53536 0))(
  ( (array!53537 (arr!25727 (Array (_ BitVec 32) ValueCell!8893)) (size!26186 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53536)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409232 () V!29963)

(declare-fun get!13532 (ValueCell!8893 V!29963) V!29963)

(declare-fun dynLambda!1362 (Int (_ BitVec 64)) V!29963)

(assert (=> b!907296 (= lt!409232 (get!13532 (select (arr!25727 _values!1152) i!717) (dynLambda!1362 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907296 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29963)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29963)

(declare-datatypes ((Unit!30792 0))(
  ( (Unit!30793) )
))
(declare-fun lt!409233 () Unit!30792)

(declare-fun lemmaKeyInListMapIsInArray!234 (array!53534 array!53536 (_ BitVec 32) (_ BitVec 32) V!29963 V!29963 (_ BitVec 64) Int) Unit!30792)

(assert (=> b!907296 (= lt!409233 (lemmaKeyInListMapIsInArray!234 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!907297 () Bool)

(declare-fun e!508468 () Bool)

(declare-fun e!508472 () Bool)

(declare-fun mapRes!29836 () Bool)

(assert (=> b!907297 (= e!508468 (and e!508472 mapRes!29836))))

(declare-fun condMapEmpty!29836 () Bool)

(declare-fun mapDefault!29836 () ValueCell!8893)

