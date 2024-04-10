; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96426 () Bool)

(assert start!96426)

(declare-fun b_free!23005 () Bool)

(declare-fun b_next!23005 () Bool)

(assert (=> start!96426 (= b_free!23005 (not b_next!23005))))

(declare-fun tp!80941 () Bool)

(declare-fun b_and!36673 () Bool)

(assert (=> start!96426 (= tp!80941 b_and!36673)))

(declare-fun b!1096180 () Bool)

(declare-fun res!731585 () Bool)

(declare-fun e!625740 () Bool)

(assert (=> b!1096180 (=> (not res!731585) (not e!625740))))

(declare-datatypes ((array!71023 0))(
  ( (array!71024 (arr!34183 (Array (_ BitVec 32) (_ BitVec 64))) (size!34719 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71023)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71023 (_ BitVec 32)) Bool)

(assert (=> b!1096180 (= res!731585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096181 () Bool)

(declare-fun e!625737 () Bool)

(declare-fun e!625736 () Bool)

(declare-fun mapRes!42343 () Bool)

(assert (=> b!1096181 (= e!625737 (and e!625736 mapRes!42343))))

(declare-fun condMapEmpty!42343 () Bool)

(declare-datatypes ((V!41201 0))(
  ( (V!41202 (val!13584 Int)) )
))
(declare-datatypes ((ValueCell!12818 0))(
  ( (ValueCellFull!12818 (v!16205 V!41201)) (EmptyCell!12818) )
))
(declare-datatypes ((array!71025 0))(
  ( (array!71026 (arr!34184 (Array (_ BitVec 32) ValueCell!12818)) (size!34720 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71025)

(declare-fun mapDefault!42343 () ValueCell!12818)

