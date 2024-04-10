; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96002 () Bool)

(assert start!96002)

(declare-fun b_free!22655 () Bool)

(declare-fun b_next!22655 () Bool)

(assert (=> start!96002 (= b_free!22655 (not b_next!22655))))

(declare-fun tp!79814 () Bool)

(declare-fun b_and!35985 () Bool)

(assert (=> start!96002 (= tp!79814 b_and!35985)))

(declare-fun mapNonEmpty!41740 () Bool)

(declare-fun mapRes!41740 () Bool)

(declare-fun tp!79813 () Bool)

(declare-fun e!621554 () Bool)

(assert (=> mapNonEmpty!41740 (= mapRes!41740 (and tp!79813 e!621554))))

(declare-datatypes ((V!40669 0))(
  ( (V!40670 (val!13385 Int)) )
))
(declare-datatypes ((ValueCell!12619 0))(
  ( (ValueCellFull!12619 (v!16006 V!40669)) (EmptyCell!12619) )
))
(declare-datatypes ((array!70239 0))(
  ( (array!70240 (arr!33793 (Array (_ BitVec 32) ValueCell!12619)) (size!34329 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70239)

(declare-fun mapKey!41740 () (_ BitVec 32))

(declare-fun mapRest!41740 () (Array (_ BitVec 32) ValueCell!12619))

(declare-fun mapValue!41740 () ValueCell!12619)

(assert (=> mapNonEmpty!41740 (= (arr!33793 _values!874) (store mapRest!41740 mapKey!41740 mapValue!41740))))

(declare-fun b!1088150 () Bool)

(declare-fun res!725734 () Bool)

(declare-fun e!621547 () Bool)

(assert (=> b!1088150 (=> (not res!725734) (not e!621547))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70241 0))(
  ( (array!70242 (arr!33794 (Array (_ BitVec 32) (_ BitVec 64))) (size!34330 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70241)

(assert (=> b!1088150 (= res!725734 (and (= (size!34329 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34330 _keys!1070) (size!34329 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088151 () Bool)

(declare-fun e!621549 () Bool)

(declare-fun tp_is_empty!26657 () Bool)

(assert (=> b!1088151 (= e!621549 tp_is_empty!26657)))

(declare-fun b!1088152 () Bool)

(declare-fun res!725735 () Bool)

(assert (=> b!1088152 (=> (not res!725735) (not e!621547))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088152 (= res!725735 (= (select (arr!33794 _keys!1070) i!650) k!904))))

(declare-fun b!1088153 () Bool)

(assert (=> b!1088153 (= e!621554 tp_is_empty!26657)))

(declare-fun b!1088154 () Bool)

(declare-fun e!621550 () Bool)

(declare-fun e!621551 () Bool)

(assert (=> b!1088154 (= e!621550 e!621551)))

(declare-fun res!725741 () Bool)

(assert (=> b!1088154 (=> res!725741 e!621551)))

(assert (=> b!1088154 (= res!725741 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16988 0))(
  ( (tuple2!16989 (_1!8505 (_ BitVec 64)) (_2!8505 V!40669)) )
))
(declare-datatypes ((List!23576 0))(
  ( (Nil!23573) (Cons!23572 (h!24781 tuple2!16988) (t!33289 List!23576)) )
))
(declare-datatypes ((ListLongMap!14957 0))(
  ( (ListLongMap!14958 (toList!7494 List!23576)) )
))
(declare-fun lt!484550 () ListLongMap!14957)

(declare-fun lt!484544 () ListLongMap!14957)

(assert (=> b!1088154 (= lt!484550 lt!484544)))

(declare-fun lt!484552 () ListLongMap!14957)

(declare-fun lt!484542 () tuple2!16988)

(declare-fun +!3295 (ListLongMap!14957 tuple2!16988) ListLongMap!14957)

(assert (=> b!1088154 (= lt!484544 (+!3295 lt!484552 lt!484542))))

(declare-fun lt!484549 () ListLongMap!14957)

(declare-fun lt!484551 () ListLongMap!14957)

(assert (=> b!1088154 (= lt!484549 lt!484551)))

(declare-fun lt!484547 () ListLongMap!14957)

(assert (=> b!1088154 (= lt!484551 (+!3295 lt!484547 lt!484542))))

(declare-fun lt!484540 () ListLongMap!14957)

(assert (=> b!1088154 (= lt!484550 (+!3295 lt!484540 lt!484542))))

(declare-fun zeroValue!831 () V!40669)

(assert (=> b!1088154 (= lt!484542 (tuple2!16989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!41740 () Bool)

(assert (=> mapIsEmpty!41740 mapRes!41740))

(declare-fun b!1088155 () Bool)

(declare-fun res!725732 () Bool)

(assert (=> b!1088155 (=> (not res!725732) (not e!621547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088155 (= res!725732 (validKeyInArray!0 k!904))))

(declare-fun b!1088156 () Bool)

(declare-fun e!621553 () Bool)

(assert (=> b!1088156 (= e!621553 (not e!621550))))

(declare-fun res!725737 () Bool)

(assert (=> b!1088156 (=> res!725737 e!621550)))

(assert (=> b!1088156 (= res!725737 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40669)

(declare-fun getCurrentListMap!4268 (array!70241 array!70239 (_ BitVec 32) (_ BitVec 32) V!40669 V!40669 (_ BitVec 32) Int) ListLongMap!14957)

(assert (=> b!1088156 (= lt!484549 (getCurrentListMap!4268 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484545 () array!70241)

(declare-fun lt!484541 () array!70239)

(assert (=> b!1088156 (= lt!484550 (getCurrentListMap!4268 lt!484545 lt!484541 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088156 (and (= lt!484540 lt!484552) (= lt!484552 lt!484540))))

(declare-fun -!819 (ListLongMap!14957 (_ BitVec 64)) ListLongMap!14957)

(assert (=> b!1088156 (= lt!484552 (-!819 lt!484547 k!904))))

(declare-datatypes ((Unit!35804 0))(
  ( (Unit!35805) )
))
(declare-fun lt!484548 () Unit!35804)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!87 (array!70241 array!70239 (_ BitVec 32) (_ BitVec 32) V!40669 V!40669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35804)

(assert (=> b!1088156 (= lt!484548 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!87 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4028 (array!70241 array!70239 (_ BitVec 32) (_ BitVec 32) V!40669 V!40669 (_ BitVec 32) Int) ListLongMap!14957)

(assert (=> b!1088156 (= lt!484540 (getCurrentListMapNoExtraKeys!4028 lt!484545 lt!484541 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2165 (Int (_ BitVec 64)) V!40669)

(assert (=> b!1088156 (= lt!484541 (array!70240 (store (arr!33793 _values!874) i!650 (ValueCellFull!12619 (dynLambda!2165 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34329 _values!874)))))

(assert (=> b!1088156 (= lt!484547 (getCurrentListMapNoExtraKeys!4028 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088156 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484546 () Unit!35804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70241 (_ BitVec 64) (_ BitVec 32)) Unit!35804)

(assert (=> b!1088156 (= lt!484546 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088157 () Bool)

(assert (=> b!1088157 (= e!621551 true)))

(assert (=> b!1088157 (= (-!819 lt!484551 k!904) lt!484544)))

(declare-fun lt!484543 () Unit!35804)

(declare-fun addRemoveCommutativeForDiffKeys!50 (ListLongMap!14957 (_ BitVec 64) V!40669 (_ BitVec 64)) Unit!35804)

(assert (=> b!1088157 (= lt!484543 (addRemoveCommutativeForDiffKeys!50 lt!484547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088158 () Bool)

(declare-fun res!725739 () Bool)

(assert (=> b!1088158 (=> (not res!725739) (not e!621547))))

(declare-datatypes ((List!23577 0))(
  ( (Nil!23574) (Cons!23573 (h!24782 (_ BitVec 64)) (t!33290 List!23577)) )
))
(declare-fun arrayNoDuplicates!0 (array!70241 (_ BitVec 32) List!23577) Bool)

(assert (=> b!1088158 (= res!725739 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23574))))

(declare-fun b!1088159 () Bool)

(declare-fun res!725738 () Bool)

(assert (=> b!1088159 (=> (not res!725738) (not e!621553))))

(assert (=> b!1088159 (= res!725738 (arrayNoDuplicates!0 lt!484545 #b00000000000000000000000000000000 Nil!23574))))

(declare-fun b!1088160 () Bool)

(assert (=> b!1088160 (= e!621547 e!621553)))

(declare-fun res!725740 () Bool)

(assert (=> b!1088160 (=> (not res!725740) (not e!621553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70241 (_ BitVec 32)) Bool)

(assert (=> b!1088160 (= res!725740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484545 mask!1414))))

(assert (=> b!1088160 (= lt!484545 (array!70242 (store (arr!33794 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34330 _keys!1070)))))

(declare-fun b!1088161 () Bool)

(declare-fun res!725742 () Bool)

(assert (=> b!1088161 (=> (not res!725742) (not e!621547))))

(assert (=> b!1088161 (= res!725742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088162 () Bool)

(declare-fun res!725733 () Bool)

(assert (=> b!1088162 (=> (not res!725733) (not e!621547))))

(assert (=> b!1088162 (= res!725733 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34330 _keys!1070))))))

(declare-fun b!1088163 () Bool)

(declare-fun e!621548 () Bool)

(assert (=> b!1088163 (= e!621548 (and e!621549 mapRes!41740))))

(declare-fun condMapEmpty!41740 () Bool)

(declare-fun mapDefault!41740 () ValueCell!12619)

