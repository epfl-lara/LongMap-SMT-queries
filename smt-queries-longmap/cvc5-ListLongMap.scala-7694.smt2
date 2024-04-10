; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96588 () Bool)

(assert start!96588)

(declare-fun b_free!23089 () Bool)

(declare-fun b_next!23089 () Bool)

(assert (=> start!96588 (= b_free!23089 (not b_next!23089))))

(declare-fun tp!81203 () Bool)

(declare-fun b_and!36883 () Bool)

(assert (=> start!96588 (= tp!81203 b_and!36883)))

(declare-fun b!1098450 () Bool)

(declare-fun res!733067 () Bool)

(declare-fun e!626948 () Bool)

(assert (=> b!1098450 (=> (not res!733067) (not e!626948))))

(declare-datatypes ((array!71191 0))(
  ( (array!71192 (arr!34264 (Array (_ BitVec 32) (_ BitVec 64))) (size!34800 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71191)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71191 (_ BitVec 32)) Bool)

(assert (=> b!1098450 (= res!733067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42478 () Bool)

(declare-fun mapRes!42478 () Bool)

(declare-fun tp!81202 () Bool)

(declare-fun e!626947 () Bool)

(assert (=> mapNonEmpty!42478 (= mapRes!42478 (and tp!81202 e!626947))))

(declare-datatypes ((V!41313 0))(
  ( (V!41314 (val!13626 Int)) )
))
(declare-datatypes ((ValueCell!12860 0))(
  ( (ValueCellFull!12860 (v!16250 V!41313)) (EmptyCell!12860) )
))
(declare-fun mapRest!42478 () (Array (_ BitVec 32) ValueCell!12860))

(declare-datatypes ((array!71193 0))(
  ( (array!71194 (arr!34265 (Array (_ BitVec 32) ValueCell!12860)) (size!34801 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71193)

(declare-fun mapKey!42478 () (_ BitVec 32))

(declare-fun mapValue!42478 () ValueCell!12860)

(assert (=> mapNonEmpty!42478 (= (arr!34265 _values!874) (store mapRest!42478 mapKey!42478 mapValue!42478))))

(declare-fun b!1098451 () Bool)

(declare-fun e!626945 () Bool)

(declare-fun e!626949 () Bool)

(assert (=> b!1098451 (= e!626945 (and e!626949 mapRes!42478))))

(declare-fun condMapEmpty!42478 () Bool)

(declare-fun mapDefault!42478 () ValueCell!12860)

