; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!612 () Bool)

(assert start!612)

(declare-fun b_free!85 () Bool)

(declare-fun b_next!85 () Bool)

(assert (=> start!612 (= b_free!85 (not b_next!85))))

(declare-fun tp!473 () Bool)

(declare-fun b_and!223 () Bool)

(assert (=> start!612 (= tp!473 b_and!223)))

(declare-fun b!3826 () Bool)

(declare-fun res!5391 () Bool)

(declare-fun e!1937 () Bool)

(assert (=> b!3826 (=> (not res!5391) (not e!1937))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!395 0))(
  ( (V!396 (val!87 Int)) )
))
(declare-datatypes ((ValueCell!65 0))(
  ( (ValueCellFull!65 (v!1174 V!395)) (EmptyCell!65) )
))
(declare-datatypes ((array!261 0))(
  ( (array!262 (arr!123 (Array (_ BitVec 32) ValueCell!65)) (size!185 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!261)

(declare-datatypes ((array!263 0))(
  ( (array!264 (arr!124 (Array (_ BitVec 32) (_ BitVec 64))) (size!186 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!263)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3826 (= res!5391 (and (= (size!185 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!186 _keys!1806) (size!185 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5389 () Bool)

(assert (=> start!612 (=> (not res!5389) (not e!1937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!612 (= res!5389 (validMask!0 mask!2250))))

(assert (=> start!612 e!1937))

(assert (=> start!612 tp!473))

(assert (=> start!612 true))

(declare-fun e!1938 () Bool)

(declare-fun array_inv!87 (array!261) Bool)

(assert (=> start!612 (and (array_inv!87 _values!1492) e!1938)))

(declare-fun tp_is_empty!163 () Bool)

(assert (=> start!612 tp_is_empty!163))

(declare-fun array_inv!88 (array!263) Bool)

(assert (=> start!612 (array_inv!88 _keys!1806)))

(declare-fun b!3827 () Bool)

(declare-fun e!1936 () Bool)

(declare-fun mapRes!203 () Bool)

(assert (=> b!3827 (= e!1938 (and e!1936 mapRes!203))))

(declare-fun condMapEmpty!203 () Bool)

(declare-fun mapDefault!203 () ValueCell!65)

