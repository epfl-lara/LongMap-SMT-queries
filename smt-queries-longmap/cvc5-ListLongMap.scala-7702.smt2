; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96742 () Bool)

(assert start!96742)

(declare-fun b_free!23137 () Bool)

(declare-fun b_next!23137 () Bool)

(assert (=> start!96742 (= b_free!23137 (not b_next!23137))))

(declare-fun tp!81359 () Bool)

(declare-fun b_and!37035 () Bool)

(assert (=> start!96742 (= tp!81359 b_and!37035)))

(declare-fun mapIsEmpty!42562 () Bool)

(declare-fun mapRes!42562 () Bool)

(assert (=> mapIsEmpty!42562 mapRes!42562))

(declare-fun b!1100295 () Bool)

(declare-fun e!628025 () Bool)

(declare-fun tp_is_empty!27187 () Bool)

(assert (=> b!1100295 (= e!628025 tp_is_empty!27187)))

(declare-fun b!1100296 () Bool)

(declare-fun e!628024 () Bool)

(assert (=> b!1100296 (= e!628024 true)))

(declare-datatypes ((V!41377 0))(
  ( (V!41378 (val!13650 Int)) )
))
(declare-datatypes ((tuple2!17352 0))(
  ( (tuple2!17353 (_1!8687 (_ BitVec 64)) (_2!8687 V!41377)) )
))
(declare-datatypes ((List!23969 0))(
  ( (Nil!23966) (Cons!23965 (h!25174 tuple2!17352) (t!34152 List!23969)) )
))
(declare-datatypes ((ListLongMap!15321 0))(
  ( (ListLongMap!15322 (toList!7676 List!23969)) )
))
(declare-fun lt!492937 () ListLongMap!15321)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!492931 () ListLongMap!15321)

(declare-fun -!962 (ListLongMap!15321 (_ BitVec 64)) ListLongMap!15321)

(assert (=> b!1100296 (= (-!962 lt!492937 k!904) lt!492931)))

(declare-datatypes ((Unit!36170 0))(
  ( (Unit!36171) )
))
(declare-fun lt!492932 () Unit!36170)

(declare-fun zeroValue!831 () V!41377)

(declare-fun lt!492934 () ListLongMap!15321)

(declare-fun addRemoveCommutativeForDiffKeys!125 (ListLongMap!15321 (_ BitVec 64) V!41377 (_ BitVec 64)) Unit!36170)

(assert (=> b!1100296 (= lt!492932 (addRemoveCommutativeForDiffKeys!125 lt!492934 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1100297 () Bool)

(declare-fun res!734208 () Bool)

(declare-fun e!628020 () Bool)

(assert (=> b!1100297 (=> (not res!734208) (not e!628020))))

(declare-datatypes ((array!71293 0))(
  ( (array!71294 (arr!34311 (Array (_ BitVec 32) (_ BitVec 64))) (size!34847 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71293)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71293 (_ BitVec 32)) Bool)

(assert (=> b!1100297 (= res!734208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100298 () Bool)

(declare-fun e!628021 () Bool)

(assert (=> b!1100298 (= e!628021 e!628024)))

(declare-fun res!734212 () Bool)

(assert (=> b!1100298 (=> res!734212 e!628024)))

(assert (=> b!1100298 (= res!734212 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!492929 () ListLongMap!15321)

(assert (=> b!1100298 (= lt!492929 lt!492931)))

(declare-fun lt!492936 () ListLongMap!15321)

(declare-fun lt!492927 () tuple2!17352)

(declare-fun +!3383 (ListLongMap!15321 tuple2!17352) ListLongMap!15321)

(assert (=> b!1100298 (= lt!492931 (+!3383 lt!492936 lt!492927))))

(declare-fun lt!492939 () ListLongMap!15321)

(assert (=> b!1100298 (= lt!492939 lt!492937)))

(assert (=> b!1100298 (= lt!492937 (+!3383 lt!492934 lt!492927))))

(declare-fun lt!492930 () ListLongMap!15321)

(assert (=> b!1100298 (= lt!492929 (+!3383 lt!492930 lt!492927))))

(assert (=> b!1100298 (= lt!492927 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100299 () Bool)

(declare-fun res!734205 () Bool)

(assert (=> b!1100299 (=> (not res!734205) (not e!628020))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100299 (= res!734205 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34847 _keys!1070))))))

(declare-fun b!1100300 () Bool)

(declare-fun res!734210 () Bool)

(assert (=> b!1100300 (=> (not res!734210) (not e!628020))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12884 0))(
  ( (ValueCellFull!12884 (v!16278 V!41377)) (EmptyCell!12884) )
))
(declare-datatypes ((array!71295 0))(
  ( (array!71296 (arr!34312 (Array (_ BitVec 32) ValueCell!12884)) (size!34848 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71295)

(assert (=> b!1100300 (= res!734210 (and (= (size!34848 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34847 _keys!1070) (size!34848 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100301 () Bool)

(declare-fun res!734209 () Bool)

(declare-fun e!628026 () Bool)

(assert (=> b!1100301 (=> (not res!734209) (not e!628026))))

(declare-fun lt!492935 () array!71293)

(declare-datatypes ((List!23970 0))(
  ( (Nil!23967) (Cons!23966 (h!25175 (_ BitVec 64)) (t!34153 List!23970)) )
))
(declare-fun arrayNoDuplicates!0 (array!71293 (_ BitVec 32) List!23970) Bool)

(assert (=> b!1100301 (= res!734209 (arrayNoDuplicates!0 lt!492935 #b00000000000000000000000000000000 Nil!23967))))

(declare-fun b!1100302 () Bool)

(assert (=> b!1100302 (= e!628026 (not e!628021))))

(declare-fun res!734204 () Bool)

(assert (=> b!1100302 (=> res!734204 e!628021)))

(assert (=> b!1100302 (= res!734204 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41377)

(declare-fun getCurrentListMap!4387 (array!71293 array!71295 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) Int) ListLongMap!15321)

(assert (=> b!1100302 (= lt!492939 (getCurrentListMap!4387 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492938 () array!71295)

(assert (=> b!1100302 (= lt!492929 (getCurrentListMap!4387 lt!492935 lt!492938 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1100302 (and (= lt!492930 lt!492936) (= lt!492936 lt!492930))))

(assert (=> b!1100302 (= lt!492936 (-!962 lt!492934 k!904))))

(declare-fun lt!492928 () Unit!36170)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!213 (array!71293 array!71295 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36170)

(assert (=> b!1100302 (= lt!492928 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4183 (array!71293 array!71295 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) Int) ListLongMap!15321)

(assert (=> b!1100302 (= lt!492930 (getCurrentListMapNoExtraKeys!4183 lt!492935 lt!492938 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2318 (Int (_ BitVec 64)) V!41377)

(assert (=> b!1100302 (= lt!492938 (array!71296 (store (arr!34312 _values!874) i!650 (ValueCellFull!12884 (dynLambda!2318 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34848 _values!874)))))

(assert (=> b!1100302 (= lt!492934 (getCurrentListMapNoExtraKeys!4183 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100302 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!492933 () Unit!36170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71293 (_ BitVec 64) (_ BitVec 32)) Unit!36170)

(assert (=> b!1100302 (= lt!492933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1100303 () Bool)

(declare-fun res!734213 () Bool)

(assert (=> b!1100303 (=> (not res!734213) (not e!628020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100303 (= res!734213 (validKeyInArray!0 k!904))))

(declare-fun b!1100304 () Bool)

(declare-fun e!628019 () Bool)

(assert (=> b!1100304 (= e!628019 tp_is_empty!27187)))

(declare-fun b!1100294 () Bool)

(assert (=> b!1100294 (= e!628020 e!628026)))

(declare-fun res!734206 () Bool)

(assert (=> b!1100294 (=> (not res!734206) (not e!628026))))

(assert (=> b!1100294 (= res!734206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492935 mask!1414))))

(assert (=> b!1100294 (= lt!492935 (array!71294 (store (arr!34311 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34847 _keys!1070)))))

(declare-fun res!734203 () Bool)

(assert (=> start!96742 (=> (not res!734203) (not e!628020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96742 (= res!734203 (validMask!0 mask!1414))))

(assert (=> start!96742 e!628020))

(assert (=> start!96742 tp!81359))

(assert (=> start!96742 true))

(assert (=> start!96742 tp_is_empty!27187))

(declare-fun array_inv!26428 (array!71293) Bool)

(assert (=> start!96742 (array_inv!26428 _keys!1070)))

(declare-fun e!628022 () Bool)

(declare-fun array_inv!26429 (array!71295) Bool)

(assert (=> start!96742 (and (array_inv!26429 _values!874) e!628022)))

(declare-fun b!1100305 () Bool)

(declare-fun res!734207 () Bool)

(assert (=> b!1100305 (=> (not res!734207) (not e!628020))))

(assert (=> b!1100305 (= res!734207 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23967))))

(declare-fun mapNonEmpty!42562 () Bool)

(declare-fun tp!81358 () Bool)

(assert (=> mapNonEmpty!42562 (= mapRes!42562 (and tp!81358 e!628019))))

(declare-fun mapValue!42562 () ValueCell!12884)

(declare-fun mapRest!42562 () (Array (_ BitVec 32) ValueCell!12884))

(declare-fun mapKey!42562 () (_ BitVec 32))

(assert (=> mapNonEmpty!42562 (= (arr!34312 _values!874) (store mapRest!42562 mapKey!42562 mapValue!42562))))

(declare-fun b!1100306 () Bool)

(assert (=> b!1100306 (= e!628022 (and e!628025 mapRes!42562))))

(declare-fun condMapEmpty!42562 () Bool)

(declare-fun mapDefault!42562 () ValueCell!12884)

