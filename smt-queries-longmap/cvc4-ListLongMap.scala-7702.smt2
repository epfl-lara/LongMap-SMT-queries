; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96746 () Bool)

(assert start!96746)

(declare-fun b_free!23141 () Bool)

(declare-fun b_next!23141 () Bool)

(assert (=> start!96746 (= b_free!23141 (not b_next!23141))))

(declare-fun tp!81371 () Bool)

(declare-fun b_and!37043 () Bool)

(assert (=> start!96746 (= tp!81371 b_and!37043)))

(declare-fun mapNonEmpty!42568 () Bool)

(declare-fun mapRes!42568 () Bool)

(declare-fun tp!81370 () Bool)

(declare-fun e!628067 () Bool)

(assert (=> mapNonEmpty!42568 (= mapRes!42568 (and tp!81370 e!628067))))

(declare-datatypes ((V!41381 0))(
  ( (V!41382 (val!13652 Int)) )
))
(declare-datatypes ((ValueCell!12886 0))(
  ( (ValueCellFull!12886 (v!16280 V!41381)) (EmptyCell!12886) )
))
(declare-datatypes ((array!71301 0))(
  ( (array!71302 (arr!34315 (Array (_ BitVec 32) ValueCell!12886)) (size!34851 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71301)

(declare-fun mapKey!42568 () (_ BitVec 32))

(declare-fun mapValue!42568 () ValueCell!12886)

(declare-fun mapRest!42568 () (Array (_ BitVec 32) ValueCell!12886))

(assert (=> mapNonEmpty!42568 (= (arr!34315 _values!874) (store mapRest!42568 mapKey!42568 mapValue!42568))))

(declare-fun b!1100382 () Bool)

(declare-fun res!734272 () Bool)

(declare-fun e!628073 () Bool)

(assert (=> b!1100382 (=> (not res!734272) (not e!628073))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71303 0))(
  ( (array!71304 (arr!34316 (Array (_ BitVec 32) (_ BitVec 64))) (size!34852 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71303)

(assert (=> b!1100382 (= res!734272 (and (= (size!34851 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34852 _keys!1070) (size!34851 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100383 () Bool)

(declare-fun e!628071 () Bool)

(declare-fun e!628070 () Bool)

(assert (=> b!1100383 (= e!628071 (not e!628070))))

(declare-fun res!734276 () Bool)

(assert (=> b!1100383 (=> res!734276 e!628070)))

(assert (=> b!1100383 (= res!734276 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41381)

(declare-datatypes ((tuple2!17356 0))(
  ( (tuple2!17357 (_1!8689 (_ BitVec 64)) (_2!8689 V!41381)) )
))
(declare-datatypes ((List!23973 0))(
  ( (Nil!23970) (Cons!23969 (h!25178 tuple2!17356) (t!34160 List!23973)) )
))
(declare-datatypes ((ListLongMap!15325 0))(
  ( (ListLongMap!15326 (toList!7678 List!23973)) )
))
(declare-fun lt!493013 () ListLongMap!15325)

(declare-fun zeroValue!831 () V!41381)

(declare-fun getCurrentListMap!4389 (array!71303 array!71301 (_ BitVec 32) (_ BitVec 32) V!41381 V!41381 (_ BitVec 32) Int) ListLongMap!15325)

(assert (=> b!1100383 (= lt!493013 (getCurrentListMap!4389 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493005 () ListLongMap!15325)

(declare-fun lt!493012 () array!71301)

(declare-fun lt!493009 () array!71303)

(assert (=> b!1100383 (= lt!493005 (getCurrentListMap!4389 lt!493009 lt!493012 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493017 () ListLongMap!15325)

(declare-fun lt!493015 () ListLongMap!15325)

(assert (=> b!1100383 (and (= lt!493017 lt!493015) (= lt!493015 lt!493017))))

(declare-fun lt!493016 () ListLongMap!15325)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!964 (ListLongMap!15325 (_ BitVec 64)) ListLongMap!15325)

(assert (=> b!1100383 (= lt!493015 (-!964 lt!493016 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36174 0))(
  ( (Unit!36175) )
))
(declare-fun lt!493010 () Unit!36174)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!215 (array!71303 array!71301 (_ BitVec 32) (_ BitVec 32) V!41381 V!41381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36174)

(assert (=> b!1100383 (= lt!493010 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4185 (array!71303 array!71301 (_ BitVec 32) (_ BitVec 32) V!41381 V!41381 (_ BitVec 32) Int) ListLongMap!15325)

(assert (=> b!1100383 (= lt!493017 (getCurrentListMapNoExtraKeys!4185 lt!493009 lt!493012 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2320 (Int (_ BitVec 64)) V!41381)

(assert (=> b!1100383 (= lt!493012 (array!71302 (store (arr!34315 _values!874) i!650 (ValueCellFull!12886 (dynLambda!2320 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34851 _values!874)))))

(assert (=> b!1100383 (= lt!493016 (getCurrentListMapNoExtraKeys!4185 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100383 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!493007 () Unit!36174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71303 (_ BitVec 64) (_ BitVec 32)) Unit!36174)

(assert (=> b!1100383 (= lt!493007 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1100384 () Bool)

(declare-fun tp_is_empty!27191 () Bool)

(assert (=> b!1100384 (= e!628067 tp_is_empty!27191)))

(declare-fun b!1100385 () Bool)

(declare-fun res!734269 () Bool)

(assert (=> b!1100385 (=> (not res!734269) (not e!628073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71303 (_ BitVec 32)) Bool)

(assert (=> b!1100385 (= res!734269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!734271 () Bool)

(assert (=> start!96746 (=> (not res!734271) (not e!628073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96746 (= res!734271 (validMask!0 mask!1414))))

(assert (=> start!96746 e!628073))

(assert (=> start!96746 tp!81371))

(assert (=> start!96746 true))

(assert (=> start!96746 tp_is_empty!27191))

(declare-fun array_inv!26432 (array!71303) Bool)

(assert (=> start!96746 (array_inv!26432 _keys!1070)))

(declare-fun e!628072 () Bool)

(declare-fun array_inv!26433 (array!71301) Bool)

(assert (=> start!96746 (and (array_inv!26433 _values!874) e!628072)))

(declare-fun b!1100386 () Bool)

(declare-fun e!628068 () Bool)

(assert (=> b!1100386 (= e!628068 true)))

(declare-fun lt!493011 () ListLongMap!15325)

(declare-fun lt!493008 () ListLongMap!15325)

(assert (=> b!1100386 (= (-!964 lt!493011 k!904) lt!493008)))

(declare-fun lt!493006 () Unit!36174)

(declare-fun addRemoveCommutativeForDiffKeys!127 (ListLongMap!15325 (_ BitVec 64) V!41381 (_ BitVec 64)) Unit!36174)

(assert (=> b!1100386 (= lt!493006 (addRemoveCommutativeForDiffKeys!127 lt!493016 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1100387 () Bool)

(declare-fun e!628074 () Bool)

(assert (=> b!1100387 (= e!628072 (and e!628074 mapRes!42568))))

(declare-fun condMapEmpty!42568 () Bool)

(declare-fun mapDefault!42568 () ValueCell!12886)

