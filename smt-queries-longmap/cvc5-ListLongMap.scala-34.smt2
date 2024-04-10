; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!636 () Bool)

(assert start!636)

(declare-fun b_free!109 () Bool)

(declare-fun b_next!109 () Bool)

(assert (=> start!636 (= b_free!109 (not b_next!109))))

(declare-fun tp!544 () Bool)

(declare-fun b_and!247 () Bool)

(assert (=> start!636 (= tp!544 b_and!247)))

(declare-fun b!4078 () Bool)

(declare-fun res!5534 () Bool)

(declare-fun e!2118 () Bool)

(assert (=> b!4078 (=> (not res!5534) (not e!2118))))

(declare-datatypes ((array!305 0))(
  ( (array!306 (arr!145 (Array (_ BitVec 32) (_ BitVec 64))) (size!207 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!305)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!305 (_ BitVec 32)) Bool)

(assert (=> b!4078 (= res!5534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4079 () Bool)

(declare-fun e!2116 () Bool)

(declare-fun tp_is_empty!187 () Bool)

(assert (=> b!4079 (= e!2116 tp_is_empty!187)))

(declare-fun b!4080 () Bool)

(declare-fun e!2117 () Bool)

(assert (=> b!4080 (= e!2117 tp_is_empty!187)))

(declare-fun res!5533 () Bool)

(assert (=> start!636 (=> (not res!5533) (not e!2118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!636 (= res!5533 (validMask!0 mask!2250))))

(assert (=> start!636 e!2118))

(assert (=> start!636 tp!544))

(assert (=> start!636 true))

(declare-datatypes ((V!427 0))(
  ( (V!428 (val!99 Int)) )
))
(declare-datatypes ((ValueCell!77 0))(
  ( (ValueCellFull!77 (v!1186 V!427)) (EmptyCell!77) )
))
(declare-datatypes ((array!307 0))(
  ( (array!308 (arr!146 (Array (_ BitVec 32) ValueCell!77)) (size!208 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!307)

(declare-fun e!2119 () Bool)

(declare-fun array_inv!105 (array!307) Bool)

(assert (=> start!636 (and (array_inv!105 _values!1492) e!2119)))

(assert (=> start!636 tp_is_empty!187))

(declare-fun array_inv!106 (array!305) Bool)

(assert (=> start!636 (array_inv!106 _keys!1806)))

(declare-fun b!4081 () Bool)

(declare-fun res!5536 () Bool)

(assert (=> b!4081 (=> (not res!5536) (not e!2118))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4081 (= res!5536 (and (= (size!208 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!207 _keys!1806) (size!208 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4082 () Bool)

(declare-fun mapRes!239 () Bool)

(assert (=> b!4082 (= e!2119 (and e!2116 mapRes!239))))

(declare-fun condMapEmpty!239 () Bool)

(declare-fun mapDefault!239 () ValueCell!77)

