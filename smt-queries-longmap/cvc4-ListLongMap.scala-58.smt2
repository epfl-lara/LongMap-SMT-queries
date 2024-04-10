; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!864 () Bool)

(assert start!864)

(declare-fun b_free!257 () Bool)

(declare-fun b_next!257 () Bool)

(assert (=> start!864 (= b_free!257 (not b_next!257))))

(declare-fun tp!1001 () Bool)

(declare-fun b_and!403 () Bool)

(assert (=> start!864 (= tp!1001 b_and!403)))

(declare-fun mapIsEmpty!473 () Bool)

(declare-fun mapRes!473 () Bool)

(assert (=> mapIsEmpty!473 mapRes!473))

(declare-fun b!7183 () Bool)

(declare-fun e!3975 () Bool)

(declare-datatypes ((array!601 0))(
  ( (array!602 (arr!289 (Array (_ BitVec 32) (_ BitVec 64))) (size!351 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!601)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7183 (= e!3975 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!7184 () Bool)

(declare-fun e!3976 () Bool)

(assert (=> b!7184 (= e!3976 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!7184 e!3975))

(declare-fun c!518 () Bool)

(assert (=> b!7184 (= c!518 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!623 0))(
  ( (V!624 (val!173 Int)) )
))
(declare-datatypes ((ValueCell!151 0))(
  ( (ValueCellFull!151 (v!1264 V!623)) (EmptyCell!151) )
))
(declare-datatypes ((array!603 0))(
  ( (array!604 (arr!290 (Array (_ BitVec 32) ValueCell!151)) (size!352 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!603)

(declare-fun minValue!1434 () V!623)

(declare-datatypes ((Unit!139 0))(
  ( (Unit!140) )
))
(declare-fun lt!1434 () Unit!139)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!623)

(declare-fun lemmaKeyInListMapIsInArray!51 (array!601 array!603 (_ BitVec 32) (_ BitVec 32) V!623 V!623 (_ BitVec 64) Int) Unit!139)

(assert (=> b!7184 (= lt!1434 (lemmaKeyInListMapIsInArray!51 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun res!7283 () Bool)

(assert (=> start!864 (=> (not res!7283) (not e!3976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!864 (= res!7283 (validMask!0 mask!2250))))

(assert (=> start!864 e!3976))

(assert (=> start!864 tp!1001))

(assert (=> start!864 true))

(declare-fun e!3972 () Bool)

(declare-fun array_inv!213 (array!603) Bool)

(assert (=> start!864 (and (array_inv!213 _values!1492) e!3972)))

(declare-fun tp_is_empty!335 () Bool)

(assert (=> start!864 tp_is_empty!335))

(declare-fun array_inv!214 (array!601) Bool)

(assert (=> start!864 (array_inv!214 _keys!1806)))

(declare-fun b!7185 () Bool)

(declare-fun e!3973 () Bool)

(assert (=> b!7185 (= e!3972 (and e!3973 mapRes!473))))

(declare-fun condMapEmpty!473 () Bool)

(declare-fun mapDefault!473 () ValueCell!151)

