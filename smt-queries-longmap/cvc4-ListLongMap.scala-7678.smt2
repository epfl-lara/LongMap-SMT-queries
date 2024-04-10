; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96418 () Bool)

(assert start!96418)

(declare-fun b_free!22997 () Bool)

(declare-fun b_next!22997 () Bool)

(assert (=> start!96418 (= b_free!22997 (not b_next!22997))))

(declare-fun tp!80918 () Bool)

(declare-fun b_and!36657 () Bool)

(assert (=> start!96418 (= tp!80918 b_and!36657)))

(declare-fun b!1096028 () Bool)

(declare-fun res!731480 () Bool)

(declare-fun e!625666 () Bool)

(assert (=> b!1096028 (=> (not res!731480) (not e!625666))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71007 0))(
  ( (array!71008 (arr!34175 (Array (_ BitVec 32) (_ BitVec 64))) (size!34711 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71007)

(assert (=> b!1096028 (= res!731480 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34711 _keys!1070))))))

(declare-fun b!1096029 () Bool)

(declare-fun res!731478 () Bool)

(assert (=> b!1096029 (=> (not res!731478) (not e!625666))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1096029 (= res!731478 (= (select (arr!34175 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!42331 () Bool)

(declare-fun mapRes!42331 () Bool)

(assert (=> mapIsEmpty!42331 mapRes!42331))

(declare-fun b!1096030 () Bool)

(declare-fun res!731483 () Bool)

(assert (=> b!1096030 (=> (not res!731483) (not e!625666))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71007 (_ BitVec 32)) Bool)

(assert (=> b!1096030 (= res!731483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096031 () Bool)

(declare-fun e!625665 () Bool)

(declare-fun tp_is_empty!27047 () Bool)

(assert (=> b!1096031 (= e!625665 tp_is_empty!27047)))

(declare-fun b!1096032 () Bool)

(declare-fun e!625664 () Bool)

(assert (=> b!1096032 (= e!625664 tp_is_empty!27047)))

(declare-fun res!731481 () Bool)

(assert (=> start!96418 (=> (not res!731481) (not e!625666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96418 (= res!731481 (validMask!0 mask!1414))))

(assert (=> start!96418 e!625666))

(assert (=> start!96418 tp!80918))

(assert (=> start!96418 true))

(assert (=> start!96418 tp_is_empty!27047))

(declare-fun array_inv!26332 (array!71007) Bool)

(assert (=> start!96418 (array_inv!26332 _keys!1070)))

(declare-datatypes ((V!41189 0))(
  ( (V!41190 (val!13580 Int)) )
))
(declare-datatypes ((ValueCell!12814 0))(
  ( (ValueCellFull!12814 (v!16201 V!41189)) (EmptyCell!12814) )
))
(declare-datatypes ((array!71009 0))(
  ( (array!71010 (arr!34176 (Array (_ BitVec 32) ValueCell!12814)) (size!34712 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71009)

(declare-fun e!625668 () Bool)

(declare-fun array_inv!26333 (array!71009) Bool)

(assert (=> start!96418 (and (array_inv!26333 _values!874) e!625668)))

(declare-fun b!1096033 () Bool)

(declare-fun e!625667 () Bool)

(assert (=> b!1096033 (= e!625666 e!625667)))

(declare-fun res!731485 () Bool)

(assert (=> b!1096033 (=> (not res!731485) (not e!625667))))

(declare-fun lt!490020 () array!71007)

(assert (=> b!1096033 (= res!731485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490020 mask!1414))))

(assert (=> b!1096033 (= lt!490020 (array!71008 (store (arr!34175 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34711 _keys!1070)))))

(declare-fun b!1096034 () Bool)

(declare-fun res!731482 () Bool)

(assert (=> b!1096034 (=> (not res!731482) (not e!625666))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096034 (= res!731482 (and (= (size!34712 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34711 _keys!1070) (size!34712 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096035 () Bool)

(assert (=> b!1096035 (= e!625667 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41189)

(declare-fun zeroValue!831 () V!41189)

(declare-datatypes ((tuple2!17244 0))(
  ( (tuple2!17245 (_1!8633 (_ BitVec 64)) (_2!8633 V!41189)) )
))
(declare-datatypes ((List!23864 0))(
  ( (Nil!23861) (Cons!23860 (h!25069 tuple2!17244) (t!33907 List!23864)) )
))
(declare-datatypes ((ListLongMap!15213 0))(
  ( (ListLongMap!15214 (toList!7622 List!23864)) )
))
(declare-fun lt!490018 () ListLongMap!15213)

(declare-fun getCurrentListMapNoExtraKeys!4138 (array!71007 array!71009 (_ BitVec 32) (_ BitVec 32) V!41189 V!41189 (_ BitVec 32) Int) ListLongMap!15213)

(declare-fun dynLambda!2273 (Int (_ BitVec 64)) V!41189)

(assert (=> b!1096035 (= lt!490018 (getCurrentListMapNoExtraKeys!4138 lt!490020 (array!71010 (store (arr!34176 _values!874) i!650 (ValueCellFull!12814 (dynLambda!2273 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34712 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490019 () ListLongMap!15213)

(assert (=> b!1096035 (= lt!490019 (getCurrentListMapNoExtraKeys!4138 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096035 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36056 0))(
  ( (Unit!36057) )
))
(declare-fun lt!490021 () Unit!36056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71007 (_ BitVec 64) (_ BitVec 32)) Unit!36056)

(assert (=> b!1096035 (= lt!490021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096036 () Bool)

(declare-fun res!731479 () Bool)

(assert (=> b!1096036 (=> (not res!731479) (not e!625666))))

(declare-datatypes ((List!23865 0))(
  ( (Nil!23862) (Cons!23861 (h!25070 (_ BitVec 64)) (t!33908 List!23865)) )
))
(declare-fun arrayNoDuplicates!0 (array!71007 (_ BitVec 32) List!23865) Bool)

(assert (=> b!1096036 (= res!731479 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23862))))

(declare-fun b!1096037 () Bool)

(declare-fun res!731484 () Bool)

(assert (=> b!1096037 (=> (not res!731484) (not e!625666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096037 (= res!731484 (validKeyInArray!0 k!904))))

(declare-fun b!1096038 () Bool)

(assert (=> b!1096038 (= e!625668 (and e!625664 mapRes!42331))))

(declare-fun condMapEmpty!42331 () Bool)

(declare-fun mapDefault!42331 () ValueCell!12814)

