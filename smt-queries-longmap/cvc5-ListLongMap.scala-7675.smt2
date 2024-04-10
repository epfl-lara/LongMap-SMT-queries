; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96396 () Bool)

(assert start!96396)

(declare-fun b_free!22975 () Bool)

(declare-fun b_next!22975 () Bool)

(assert (=> start!96396 (= b_free!22975 (not b_next!22975))))

(declare-fun tp!80852 () Bool)

(declare-fun b_and!36613 () Bool)

(assert (=> start!96396 (= tp!80852 b_and!36613)))

(declare-fun b!1095610 () Bool)

(declare-fun e!625471 () Bool)

(declare-fun tp_is_empty!27025 () Bool)

(assert (=> b!1095610 (= e!625471 tp_is_empty!27025)))

(declare-fun mapNonEmpty!42298 () Bool)

(declare-fun mapRes!42298 () Bool)

(declare-fun tp!80851 () Bool)

(declare-fun e!625469 () Bool)

(assert (=> mapNonEmpty!42298 (= mapRes!42298 (and tp!80851 e!625469))))

(declare-datatypes ((V!41161 0))(
  ( (V!41162 (val!13569 Int)) )
))
(declare-datatypes ((ValueCell!12803 0))(
  ( (ValueCellFull!12803 (v!16190 V!41161)) (EmptyCell!12803) )
))
(declare-fun mapValue!42298 () ValueCell!12803)

(declare-datatypes ((array!70963 0))(
  ( (array!70964 (arr!34153 (Array (_ BitVec 32) ValueCell!12803)) (size!34689 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70963)

(declare-fun mapKey!42298 () (_ BitVec 32))

(declare-fun mapRest!42298 () (Array (_ BitVec 32) ValueCell!12803))

(assert (=> mapNonEmpty!42298 (= (arr!34153 _values!874) (store mapRest!42298 mapKey!42298 mapValue!42298))))

(declare-fun b!1095611 () Bool)

(declare-fun e!625466 () Bool)

(declare-fun e!625468 () Bool)

(assert (=> b!1095611 (= e!625466 e!625468)))

(declare-fun res!731187 () Bool)

(assert (=> b!1095611 (=> (not res!731187) (not e!625468))))

(declare-datatypes ((array!70965 0))(
  ( (array!70966 (arr!34154 (Array (_ BitVec 32) (_ BitVec 64))) (size!34690 (_ BitVec 32))) )
))
(declare-fun lt!489888 () array!70965)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70965 (_ BitVec 32)) Bool)

(assert (=> b!1095611 (= res!731187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489888 mask!1414))))

(declare-fun _keys!1070 () array!70965)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095611 (= lt!489888 (array!70966 (store (arr!34154 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34690 _keys!1070)))))

(declare-fun mapIsEmpty!42298 () Bool)

(assert (=> mapIsEmpty!42298 mapRes!42298))

(declare-fun b!1095612 () Bool)

(declare-fun res!731181 () Bool)

(assert (=> b!1095612 (=> (not res!731181) (not e!625466))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1095612 (= res!731181 (= (select (arr!34154 _keys!1070) i!650) k!904))))

(declare-fun b!1095613 () Bool)

(declare-fun res!731188 () Bool)

(assert (=> b!1095613 (=> (not res!731188) (not e!625466))))

(assert (=> b!1095613 (= res!731188 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34690 _keys!1070))))))

(declare-fun b!1095614 () Bool)

(declare-fun e!625467 () Bool)

(assert (=> b!1095614 (= e!625467 (and e!625471 mapRes!42298))))

(declare-fun condMapEmpty!42298 () Bool)

(declare-fun mapDefault!42298 () ValueCell!12803)

