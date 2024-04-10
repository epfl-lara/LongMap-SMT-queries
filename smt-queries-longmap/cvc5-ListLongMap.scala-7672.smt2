; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96378 () Bool)

(assert start!96378)

(declare-fun b_free!22957 () Bool)

(declare-fun b_next!22957 () Bool)

(assert (=> start!96378 (= b_free!22957 (not b_next!22957))))

(declare-fun tp!80797 () Bool)

(declare-fun b_and!36583 () Bool)

(assert (=> start!96378 (= tp!80797 b_and!36583)))

(declare-fun mapIsEmpty!42271 () Bool)

(declare-fun mapRes!42271 () Bool)

(assert (=> mapIsEmpty!42271 mapRes!42271))

(declare-fun b!1095274 () Bool)

(declare-fun res!730940 () Bool)

(declare-fun e!625309 () Bool)

(assert (=> b!1095274 (=> (not res!730940) (not e!625309))))

(declare-datatypes ((array!70927 0))(
  ( (array!70928 (arr!34135 (Array (_ BitVec 32) (_ BitVec 64))) (size!34671 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70927)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70927 (_ BitVec 32)) Bool)

(assert (=> b!1095274 (= res!730940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095275 () Bool)

(declare-fun e!625308 () Bool)

(assert (=> b!1095275 (= e!625309 e!625308)))

(declare-fun res!730939 () Bool)

(assert (=> b!1095275 (=> (not res!730939) (not e!625308))))

(declare-fun lt!489787 () array!70927)

(assert (=> b!1095275 (= res!730939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489787 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095275 (= lt!489787 (array!70928 (store (arr!34135 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34671 _keys!1070)))))

(declare-fun b!1095276 () Bool)

(declare-fun e!625305 () Bool)

(declare-fun tp_is_empty!27007 () Bool)

(assert (=> b!1095276 (= e!625305 tp_is_empty!27007)))

(declare-fun b!1095277 () Bool)

(declare-fun e!625304 () Bool)

(assert (=> b!1095277 (= e!625304 (and e!625305 mapRes!42271))))

(declare-fun condMapEmpty!42271 () Bool)

(declare-datatypes ((V!41137 0))(
  ( (V!41138 (val!13560 Int)) )
))
(declare-datatypes ((ValueCell!12794 0))(
  ( (ValueCellFull!12794 (v!16181 V!41137)) (EmptyCell!12794) )
))
(declare-datatypes ((array!70929 0))(
  ( (array!70930 (arr!34136 (Array (_ BitVec 32) ValueCell!12794)) (size!34672 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70929)

(declare-fun mapDefault!42271 () ValueCell!12794)

