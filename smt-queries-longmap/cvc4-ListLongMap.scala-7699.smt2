; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96676 () Bool)

(assert start!96676)

(declare-fun b_free!23123 () Bool)

(declare-fun b_next!23123 () Bool)

(assert (=> start!96676 (= b_free!23123 (not b_next!23123))))

(declare-fun tp!81311 () Bool)

(declare-fun b_and!36979 () Bool)

(assert (=> start!96676 (= tp!81311 b_and!36979)))

(declare-fun b!1099578 () Bool)

(declare-fun res!733787 () Bool)

(declare-fun e!627596 () Bool)

(assert (=> b!1099578 (=> (not res!733787) (not e!627596))))

(declare-datatypes ((array!71261 0))(
  ( (array!71262 (arr!34297 (Array (_ BitVec 32) (_ BitVec 64))) (size!34833 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71261)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099578 (= res!733787 (= (select (arr!34297 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!42535 () Bool)

(declare-fun mapRes!42535 () Bool)

(declare-fun tp!81310 () Bool)

(declare-fun e!627591 () Bool)

(assert (=> mapNonEmpty!42535 (= mapRes!42535 (and tp!81310 e!627591))))

(declare-datatypes ((V!41357 0))(
  ( (V!41358 (val!13643 Int)) )
))
(declare-datatypes ((ValueCell!12877 0))(
  ( (ValueCellFull!12877 (v!16269 V!41357)) (EmptyCell!12877) )
))
(declare-datatypes ((array!71263 0))(
  ( (array!71264 (arr!34298 (Array (_ BitVec 32) ValueCell!12877)) (size!34834 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71263)

(declare-fun mapRest!42535 () (Array (_ BitVec 32) ValueCell!12877))

(declare-fun mapKey!42535 () (_ BitVec 32))

(declare-fun mapValue!42535 () ValueCell!12877)

(assert (=> mapNonEmpty!42535 (= (arr!34298 _values!874) (store mapRest!42535 mapKey!42535 mapValue!42535))))

(declare-datatypes ((tuple2!17338 0))(
  ( (tuple2!17339 (_1!8680 (_ BitVec 64)) (_2!8680 V!41357)) )
))
(declare-datatypes ((List!23956 0))(
  ( (Nil!23953) (Cons!23952 (h!25161 tuple2!17338) (t!34125 List!23956)) )
))
(declare-datatypes ((ListLongMap!15307 0))(
  ( (ListLongMap!15308 (toList!7669 List!23956)) )
))
(declare-fun lt!492406 () ListLongMap!15307)

(declare-fun lt!492408 () ListLongMap!15307)

(declare-fun b!1099579 () Bool)

(declare-fun e!627595 () Bool)

(declare-fun lt!492409 () tuple2!17338)

(declare-fun +!3377 (ListLongMap!15307 tuple2!17338) ListLongMap!15307)

(assert (=> b!1099579 (= e!627595 (= lt!492408 (+!3377 lt!492406 lt!492409)))))

(declare-fun lt!492405 () ListLongMap!15307)

(declare-fun lt!492402 () ListLongMap!15307)

(assert (=> b!1099579 (= lt!492405 (+!3377 lt!492402 lt!492409))))

(declare-fun zeroValue!831 () V!41357)

(assert (=> b!1099579 (= lt!492409 (tuple2!17339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099580 () Bool)

(declare-fun res!733786 () Bool)

(assert (=> b!1099580 (=> (not res!733786) (not e!627596))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099580 (= res!733786 (and (= (size!34834 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34833 _keys!1070) (size!34834 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099581 () Bool)

(declare-fun e!627594 () Bool)

(assert (=> b!1099581 (= e!627596 e!627594)))

(declare-fun res!733784 () Bool)

(assert (=> b!1099581 (=> (not res!733784) (not e!627594))))

(declare-fun lt!492404 () array!71261)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71261 (_ BitVec 32)) Bool)

(assert (=> b!1099581 (= res!733784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492404 mask!1414))))

(assert (=> b!1099581 (= lt!492404 (array!71262 (store (arr!34297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34833 _keys!1070)))))

(declare-fun res!733790 () Bool)

(assert (=> start!96676 (=> (not res!733790) (not e!627596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96676 (= res!733790 (validMask!0 mask!1414))))

(assert (=> start!96676 e!627596))

(assert (=> start!96676 tp!81311))

(assert (=> start!96676 true))

(declare-fun tp_is_empty!27173 () Bool)

(assert (=> start!96676 tp_is_empty!27173))

(declare-fun array_inv!26420 (array!71261) Bool)

(assert (=> start!96676 (array_inv!26420 _keys!1070)))

(declare-fun e!627597 () Bool)

(declare-fun array_inv!26421 (array!71263) Bool)

(assert (=> start!96676 (and (array_inv!26421 _values!874) e!627597)))

(declare-fun b!1099582 () Bool)

(assert (=> b!1099582 (= e!627591 tp_is_empty!27173)))

(declare-fun b!1099583 () Bool)

(declare-fun res!733788 () Bool)

(assert (=> b!1099583 (=> (not res!733788) (not e!627596))))

(assert (=> b!1099583 (= res!733788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099584 () Bool)

(declare-fun res!733792 () Bool)

(assert (=> b!1099584 (=> (not res!733792) (not e!627594))))

(declare-datatypes ((List!23957 0))(
  ( (Nil!23954) (Cons!23953 (h!25162 (_ BitVec 64)) (t!34126 List!23957)) )
))
(declare-fun arrayNoDuplicates!0 (array!71261 (_ BitVec 32) List!23957) Bool)

(assert (=> b!1099584 (= res!733792 (arrayNoDuplicates!0 lt!492404 #b00000000000000000000000000000000 Nil!23954))))

(declare-fun b!1099585 () Bool)

(declare-fun e!627592 () Bool)

(assert (=> b!1099585 (= e!627597 (and e!627592 mapRes!42535))))

(declare-fun condMapEmpty!42535 () Bool)

(declare-fun mapDefault!42535 () ValueCell!12877)

