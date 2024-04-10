; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4520 () Bool)

(assert start!4520)

(declare-fun b_free!1261 () Bool)

(declare-fun b_next!1261 () Bool)

(assert (=> start!4520 (= b_free!1261 (not b_next!1261))))

(declare-fun tp!5224 () Bool)

(declare-fun b_and!2085 () Bool)

(assert (=> start!4520 (= tp!5224 b_and!2085)))

(declare-fun b!35266 () Bool)

(declare-fun res!21431 () Bool)

(declare-fun e!22285 () Bool)

(assert (=> b!35266 (=> (not res!21431) (not e!22285))))

(declare-datatypes ((array!2445 0))(
  ( (array!2446 (arr!1169 (Array (_ BitVec 32) (_ BitVec 64))) (size!1270 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2445)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35266 (= res!21431 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun res!21428 () Bool)

(assert (=> start!4520 (=> (not res!21428) (not e!22285))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4520 (= res!21428 (validMask!0 mask!2294))))

(assert (=> start!4520 e!22285))

(assert (=> start!4520 true))

(assert (=> start!4520 tp!5224))

(declare-datatypes ((V!1979 0))(
  ( (V!1980 (val!834 Int)) )
))
(declare-datatypes ((ValueCell!608 0))(
  ( (ValueCellFull!608 (v!1930 V!1979)) (EmptyCell!608) )
))
(declare-datatypes ((array!2447 0))(
  ( (array!2448 (arr!1170 (Array (_ BitVec 32) ValueCell!608)) (size!1271 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2447)

(declare-fun e!22284 () Bool)

(declare-fun array_inv!825 (array!2447) Bool)

(assert (=> start!4520 (and (array_inv!825 _values!1501) e!22284)))

(declare-fun array_inv!826 (array!2445) Bool)

(assert (=> start!4520 (array_inv!826 _keys!1833)))

(declare-fun tp_is_empty!1615 () Bool)

(assert (=> start!4520 tp_is_empty!1615))

(declare-fun b!35267 () Bool)

(declare-fun e!22281 () Bool)

(declare-fun mapRes!1972 () Bool)

(assert (=> b!35267 (= e!22284 (and e!22281 mapRes!1972))))

(declare-fun condMapEmpty!1972 () Bool)

(declare-fun mapDefault!1972 () ValueCell!608)

