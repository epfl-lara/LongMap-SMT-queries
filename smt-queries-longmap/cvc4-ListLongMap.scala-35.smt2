; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!646 () Bool)

(assert start!646)

(declare-fun b_free!119 () Bool)

(declare-fun b_next!119 () Bool)

(assert (=> start!646 (= b_free!119 (not b_next!119))))

(declare-fun tp!574 () Bool)

(declare-fun b_and!257 () Bool)

(assert (=> start!646 (= tp!574 b_and!257)))

(declare-fun b!4183 () Bool)

(declare-fun res!5596 () Bool)

(declare-fun e!2191 () Bool)

(assert (=> b!4183 (=> (not res!5596) (not e!2191))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!439 0))(
  ( (V!440 (val!104 Int)) )
))
(declare-datatypes ((ValueCell!82 0))(
  ( (ValueCellFull!82 (v!1191 V!439)) (EmptyCell!82) )
))
(declare-datatypes ((array!325 0))(
  ( (array!326 (arr!155 (Array (_ BitVec 32) ValueCell!82)) (size!217 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!325)

(declare-datatypes ((array!327 0))(
  ( (array!328 (arr!156 (Array (_ BitVec 32) (_ BitVec 64))) (size!218 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!327)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4183 (= res!5596 (and (= (size!217 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!218 _keys!1806) (size!217 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5595 () Bool)

(assert (=> start!646 (=> (not res!5595) (not e!2191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!646 (= res!5595 (validMask!0 mask!2250))))

(assert (=> start!646 e!2191))

(assert (=> start!646 tp!574))

(assert (=> start!646 true))

(declare-fun e!2195 () Bool)

(declare-fun array_inv!111 (array!325) Bool)

(assert (=> start!646 (and (array_inv!111 _values!1492) e!2195)))

(declare-fun tp_is_empty!197 () Bool)

(assert (=> start!646 tp_is_empty!197))

(declare-fun array_inv!112 (array!327) Bool)

(assert (=> start!646 (array_inv!112 _keys!1806)))

(declare-fun mapIsEmpty!254 () Bool)

(declare-fun mapRes!254 () Bool)

(assert (=> mapIsEmpty!254 mapRes!254))

(declare-fun b!4184 () Bool)

(declare-fun e!2193 () Bool)

(assert (=> b!4184 (= e!2193 tp_is_empty!197)))

(declare-fun b!4185 () Bool)

(declare-fun e!2194 () Bool)

(assert (=> b!4185 (= e!2195 (and e!2194 mapRes!254))))

(declare-fun condMapEmpty!254 () Bool)

(declare-fun mapDefault!254 () ValueCell!82)

