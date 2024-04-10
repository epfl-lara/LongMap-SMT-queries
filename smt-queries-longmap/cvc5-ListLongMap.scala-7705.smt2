; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96760 () Bool)

(assert start!96760)

(declare-fun b_free!23155 () Bool)

(declare-fun b_next!23155 () Bool)

(assert (=> start!96760 (= b_free!23155 (not b_next!23155))))

(declare-fun tp!81413 () Bool)

(declare-fun b_and!37071 () Bool)

(assert (=> start!96760 (= tp!81413 b_and!37071)))

(declare-fun res!734500 () Bool)

(declare-fun e!628233 () Bool)

(assert (=> start!96760 (=> (not res!734500) (not e!628233))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96760 (= res!734500 (validMask!0 mask!1414))))

(assert (=> start!96760 e!628233))

(assert (=> start!96760 tp!81413))

(assert (=> start!96760 true))

(declare-fun tp_is_empty!27205 () Bool)

(assert (=> start!96760 tp_is_empty!27205))

(declare-datatypes ((array!71329 0))(
  ( (array!71330 (arr!34329 (Array (_ BitVec 32) (_ BitVec 64))) (size!34865 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71329)

(declare-fun array_inv!26442 (array!71329) Bool)

(assert (=> start!96760 (array_inv!26442 _keys!1070)))

(declare-datatypes ((V!41401 0))(
  ( (V!41402 (val!13659 Int)) )
))
(declare-datatypes ((ValueCell!12893 0))(
  ( (ValueCellFull!12893 (v!16287 V!41401)) (EmptyCell!12893) )
))
(declare-datatypes ((array!71331 0))(
  ( (array!71332 (arr!34330 (Array (_ BitVec 32) ValueCell!12893)) (size!34866 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71331)

(declare-fun e!628235 () Bool)

(declare-fun array_inv!26443 (array!71331) Bool)

(assert (=> start!96760 (and (array_inv!26443 _values!874) e!628235)))

(declare-fun b!1100688 () Bool)

(declare-fun res!734504 () Bool)

(assert (=> b!1100688 (=> (not res!734504) (not e!628233))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100688 (= res!734504 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34865 _keys!1070))))))

(declare-fun b!1100689 () Bool)

(declare-fun e!628238 () Bool)

(declare-fun mapRes!42589 () Bool)

(assert (=> b!1100689 (= e!628235 (and e!628238 mapRes!42589))))

(declare-fun condMapEmpty!42589 () Bool)

(declare-fun mapDefault!42589 () ValueCell!12893)

