; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96866 () Bool)

(assert start!96866)

(declare-fun b_free!23183 () Bool)

(declare-fun b_next!23183 () Bool)

(assert (=> start!96866 (= b_free!23183 (not b_next!23183))))

(declare-fun tp!81506 () Bool)

(declare-fun b_and!37169 () Bool)

(assert (=> start!96866 (= tp!81506 b_and!37169)))

(declare-fun b!1101896 () Bool)

(declare-fun res!735225 () Bool)

(declare-fun e!628948 () Bool)

(assert (=> b!1101896 (=> (not res!735225) (not e!628948))))

(declare-datatypes ((array!71387 0))(
  ( (array!71388 (arr!34355 (Array (_ BitVec 32) (_ BitVec 64))) (size!34891 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71387)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71387 (_ BitVec 32)) Bool)

(assert (=> b!1101896 (= res!735225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101897 () Bool)

(declare-fun res!735232 () Bool)

(assert (=> b!1101897 (=> (not res!735232) (not e!628948))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101897 (= res!735232 (= (select (arr!34355 _keys!1070) i!650) k!904))))

(declare-fun b!1101898 () Bool)

(declare-fun e!628950 () Bool)

(declare-fun e!628944 () Bool)

(assert (=> b!1101898 (= e!628950 (not e!628944))))

(declare-fun res!735226 () Bool)

(assert (=> b!1101898 (=> res!735226 e!628944)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101898 (= res!735226 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41437 0))(
  ( (V!41438 (val!13673 Int)) )
))
(declare-fun minValue!831 () V!41437)

(declare-datatypes ((tuple2!17388 0))(
  ( (tuple2!17389 (_1!8705 (_ BitVec 64)) (_2!8705 V!41437)) )
))
(declare-datatypes ((List!24003 0))(
  ( (Nil!24000) (Cons!23999 (h!25208 tuple2!17388) (t!34232 List!24003)) )
))
(declare-datatypes ((ListLongMap!15357 0))(
  ( (ListLongMap!15358 (toList!7694 List!24003)) )
))
(declare-fun lt!494175 () ListLongMap!15357)

(declare-fun zeroValue!831 () V!41437)

(declare-datatypes ((ValueCell!12907 0))(
  ( (ValueCellFull!12907 (v!16304 V!41437)) (EmptyCell!12907) )
))
(declare-datatypes ((array!71389 0))(
  ( (array!71390 (arr!34356 (Array (_ BitVec 32) ValueCell!12907)) (size!34892 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71389)

(declare-fun getCurrentListMap!4399 (array!71387 array!71389 (_ BitVec 32) (_ BitVec 32) V!41437 V!41437 (_ BitVec 32) Int) ListLongMap!15357)

(assert (=> b!1101898 (= lt!494175 (getCurrentListMap!4399 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494170 () array!71387)

(declare-fun lt!494174 () ListLongMap!15357)

(declare-fun lt!494173 () array!71389)

(assert (=> b!1101898 (= lt!494174 (getCurrentListMap!4399 lt!494170 lt!494173 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494172 () ListLongMap!15357)

(declare-fun lt!494182 () ListLongMap!15357)

(assert (=> b!1101898 (and (= lt!494172 lt!494182) (= lt!494182 lt!494172))))

(declare-fun lt!494179 () ListLongMap!15357)

(declare-fun -!977 (ListLongMap!15357 (_ BitVec 64)) ListLongMap!15357)

(assert (=> b!1101898 (= lt!494182 (-!977 lt!494179 k!904))))

(declare-datatypes ((Unit!36206 0))(
  ( (Unit!36207) )
))
(declare-fun lt!494176 () Unit!36206)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!225 (array!71387 array!71389 (_ BitVec 32) (_ BitVec 32) V!41437 V!41437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36206)

(assert (=> b!1101898 (= lt!494176 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!225 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4195 (array!71387 array!71389 (_ BitVec 32) (_ BitVec 32) V!41437 V!41437 (_ BitVec 32) Int) ListLongMap!15357)

(assert (=> b!1101898 (= lt!494172 (getCurrentListMapNoExtraKeys!4195 lt!494170 lt!494173 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2330 (Int (_ BitVec 64)) V!41437)

(assert (=> b!1101898 (= lt!494173 (array!71390 (store (arr!34356 _values!874) i!650 (ValueCellFull!12907 (dynLambda!2330 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34892 _values!874)))))

(assert (=> b!1101898 (= lt!494179 (getCurrentListMapNoExtraKeys!4195 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101898 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494178 () Unit!36206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71387 (_ BitVec 64) (_ BitVec 32)) Unit!36206)

(assert (=> b!1101898 (= lt!494178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1101899 () Bool)

(declare-fun res!735224 () Bool)

(assert (=> b!1101899 (=> (not res!735224) (not e!628948))))

(declare-datatypes ((List!24004 0))(
  ( (Nil!24001) (Cons!24000 (h!25209 (_ BitVec 64)) (t!34233 List!24004)) )
))
(declare-fun arrayNoDuplicates!0 (array!71387 (_ BitVec 32) List!24004) Bool)

(assert (=> b!1101899 (= res!735224 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24001))))

(declare-fun b!1101900 () Bool)

(assert (=> b!1101900 (= e!628948 e!628950)))

(declare-fun res!735230 () Bool)

(assert (=> b!1101900 (=> (not res!735230) (not e!628950))))

(assert (=> b!1101900 (= res!735230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494170 mask!1414))))

(assert (=> b!1101900 (= lt!494170 (array!71388 (store (arr!34355 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34891 _keys!1070)))))

(declare-fun b!1101901 () Bool)

(declare-fun e!628946 () Bool)

(assert (=> b!1101901 (= e!628946 true)))

(declare-fun lt!494177 () ListLongMap!15357)

(declare-fun lt!494180 () ListLongMap!15357)

(assert (=> b!1101901 (= (-!977 lt!494177 k!904) lt!494180)))

(declare-fun lt!494171 () Unit!36206)

(declare-fun addRemoveCommutativeForDiffKeys!134 (ListLongMap!15357 (_ BitVec 64) V!41437 (_ BitVec 64)) Unit!36206)

(assert (=> b!1101901 (= lt!494171 (addRemoveCommutativeForDiffKeys!134 lt!494179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1101902 () Bool)

(declare-fun res!735228 () Bool)

(assert (=> b!1101902 (=> (not res!735228) (not e!628948))))

(assert (=> b!1101902 (= res!735228 (and (= (size!34892 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34891 _keys!1070) (size!34892 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!735229 () Bool)

(assert (=> start!96866 (=> (not res!735229) (not e!628948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96866 (= res!735229 (validMask!0 mask!1414))))

(assert (=> start!96866 e!628948))

(assert (=> start!96866 tp!81506))

(assert (=> start!96866 true))

(declare-fun tp_is_empty!27233 () Bool)

(assert (=> start!96866 tp_is_empty!27233))

(declare-fun array_inv!26460 (array!71387) Bool)

(assert (=> start!96866 (array_inv!26460 _keys!1070)))

(declare-fun e!628949 () Bool)

(declare-fun array_inv!26461 (array!71389) Bool)

(assert (=> start!96866 (and (array_inv!26461 _values!874) e!628949)))

(declare-fun b!1101903 () Bool)

(declare-fun res!735227 () Bool)

(assert (=> b!1101903 (=> (not res!735227) (not e!628948))))

(assert (=> b!1101903 (= res!735227 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34891 _keys!1070))))))

(declare-fun mapNonEmpty!42640 () Bool)

(declare-fun mapRes!42640 () Bool)

(declare-fun tp!81505 () Bool)

(declare-fun e!628945 () Bool)

(assert (=> mapNonEmpty!42640 (= mapRes!42640 (and tp!81505 e!628945))))

(declare-fun mapValue!42640 () ValueCell!12907)

(declare-fun mapKey!42640 () (_ BitVec 32))

(declare-fun mapRest!42640 () (Array (_ BitVec 32) ValueCell!12907))

(assert (=> mapNonEmpty!42640 (= (arr!34356 _values!874) (store mapRest!42640 mapKey!42640 mapValue!42640))))

(declare-fun b!1101904 () Bool)

(declare-fun e!628951 () Bool)

(assert (=> b!1101904 (= e!628951 tp_is_empty!27233)))

(declare-fun mapIsEmpty!42640 () Bool)

(assert (=> mapIsEmpty!42640 mapRes!42640))

(declare-fun b!1101905 () Bool)

(assert (=> b!1101905 (= e!628949 (and e!628951 mapRes!42640))))

(declare-fun condMapEmpty!42640 () Bool)

(declare-fun mapDefault!42640 () ValueCell!12907)

