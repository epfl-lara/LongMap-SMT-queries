; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96874 () Bool)

(assert start!96874)

(declare-fun b_free!23191 () Bool)

(declare-fun b_next!23191 () Bool)

(assert (=> start!96874 (= b_free!23191 (not b_next!23191))))

(declare-fun tp!81530 () Bool)

(declare-fun b_and!37185 () Bool)

(assert (=> start!96874 (= tp!81530 b_and!37185)))

(declare-fun b!1102072 () Bool)

(declare-fun res!735358 () Bool)

(declare-fun e!629042 () Bool)

(assert (=> b!1102072 (=> (not res!735358) (not e!629042))))

(declare-datatypes ((array!71403 0))(
  ( (array!71404 (arr!34363 (Array (_ BitVec 32) (_ BitVec 64))) (size!34899 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71403)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102072 (= res!735358 (= (select (arr!34363 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!42652 () Bool)

(declare-fun mapRes!42652 () Bool)

(assert (=> mapIsEmpty!42652 mapRes!42652))

(declare-fun res!735364 () Bool)

(assert (=> start!96874 (=> (not res!735364) (not e!629042))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96874 (= res!735364 (validMask!0 mask!1414))))

(assert (=> start!96874 e!629042))

(assert (=> start!96874 tp!81530))

(assert (=> start!96874 true))

(declare-fun tp_is_empty!27241 () Bool)

(assert (=> start!96874 tp_is_empty!27241))

(declare-fun array_inv!26468 (array!71403) Bool)

(assert (=> start!96874 (array_inv!26468 _keys!1070)))

(declare-datatypes ((V!41449 0))(
  ( (V!41450 (val!13677 Int)) )
))
(declare-datatypes ((ValueCell!12911 0))(
  ( (ValueCellFull!12911 (v!16308 V!41449)) (EmptyCell!12911) )
))
(declare-datatypes ((array!71405 0))(
  ( (array!71406 (arr!34364 (Array (_ BitVec 32) ValueCell!12911)) (size!34900 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71405)

(declare-fun e!629041 () Bool)

(declare-fun array_inv!26469 (array!71405) Bool)

(assert (=> start!96874 (and (array_inv!26469 _values!874) e!629041)))

(declare-datatypes ((tuple2!17396 0))(
  ( (tuple2!17397 (_1!8709 (_ BitVec 64)) (_2!8709 V!41449)) )
))
(declare-datatypes ((List!24011 0))(
  ( (Nil!24008) (Cons!24007 (h!25216 tuple2!17396) (t!34248 List!24011)) )
))
(declare-datatypes ((ListLongMap!15365 0))(
  ( (ListLongMap!15366 (toList!7698 List!24011)) )
))
(declare-fun lt!494338 () ListLongMap!15365)

(declare-fun lt!494333 () ListLongMap!15365)

(declare-fun e!629044 () Bool)

(declare-fun b!1102073 () Bool)

(declare-fun -!981 (ListLongMap!15365 (_ BitVec 64)) ListLongMap!15365)

(assert (=> b!1102073 (= e!629044 (= (-!981 lt!494338 k!904) lt!494333))))

(declare-fun lt!494336 () ListLongMap!15365)

(declare-fun lt!494327 () ListLongMap!15365)

(assert (=> b!1102073 (= (-!981 lt!494336 k!904) lt!494327)))

(declare-fun lt!494331 () ListLongMap!15365)

(declare-fun minValue!831 () V!41449)

(declare-datatypes ((Unit!36214 0))(
  ( (Unit!36215) )
))
(declare-fun lt!494334 () Unit!36214)

(declare-fun addRemoveCommutativeForDiffKeys!138 (ListLongMap!15365 (_ BitVec 64) V!41449 (_ BitVec 64)) Unit!36214)

(assert (=> b!1102073 (= lt!494334 (addRemoveCommutativeForDiffKeys!138 lt!494331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1102074 () Bool)

(declare-fun e!629040 () Bool)

(assert (=> b!1102074 (= e!629040 tp_is_empty!27241)))

(declare-fun b!1102075 () Bool)

(declare-fun e!629043 () Bool)

(declare-fun e!629047 () Bool)

(assert (=> b!1102075 (= e!629043 (not e!629047))))

(declare-fun res!735362 () Bool)

(assert (=> b!1102075 (=> res!735362 e!629047)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102075 (= res!735362 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41449)

(declare-fun getCurrentListMap!4402 (array!71403 array!71405 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) Int) ListLongMap!15365)

(assert (=> b!1102075 (= lt!494338 (getCurrentListMap!4402 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494332 () array!71405)

(declare-fun lt!494335 () array!71403)

(assert (=> b!1102075 (= lt!494333 (getCurrentListMap!4402 lt!494335 lt!494332 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494328 () ListLongMap!15365)

(declare-fun lt!494337 () ListLongMap!15365)

(assert (=> b!1102075 (and (= lt!494328 lt!494337) (= lt!494337 lt!494328))))

(assert (=> b!1102075 (= lt!494337 (-!981 lt!494331 k!904))))

(declare-fun lt!494329 () Unit!36214)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!228 (array!71403 array!71405 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36214)

(assert (=> b!1102075 (= lt!494329 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!228 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4198 (array!71403 array!71405 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) Int) ListLongMap!15365)

(assert (=> b!1102075 (= lt!494328 (getCurrentListMapNoExtraKeys!4198 lt!494335 lt!494332 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2333 (Int (_ BitVec 64)) V!41449)

(assert (=> b!1102075 (= lt!494332 (array!71406 (store (arr!34364 _values!874) i!650 (ValueCellFull!12911 (dynLambda!2333 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34900 _values!874)))))

(assert (=> b!1102075 (= lt!494331 (getCurrentListMapNoExtraKeys!4198 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102075 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494330 () Unit!36214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71403 (_ BitVec 64) (_ BitVec 32)) Unit!36214)

(assert (=> b!1102075 (= lt!494330 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!42652 () Bool)

(declare-fun tp!81529 () Bool)

(declare-fun e!629045 () Bool)

(assert (=> mapNonEmpty!42652 (= mapRes!42652 (and tp!81529 e!629045))))

(declare-fun mapValue!42652 () ValueCell!12911)

(declare-fun mapRest!42652 () (Array (_ BitVec 32) ValueCell!12911))

(declare-fun mapKey!42652 () (_ BitVec 32))

(assert (=> mapNonEmpty!42652 (= (arr!34364 _values!874) (store mapRest!42652 mapKey!42652 mapValue!42652))))

(declare-fun b!1102076 () Bool)

(declare-fun res!735361 () Bool)

(assert (=> b!1102076 (=> (not res!735361) (not e!629042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71403 (_ BitVec 32)) Bool)

(assert (=> b!1102076 (= res!735361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102077 () Bool)

(declare-fun res!735359 () Bool)

(assert (=> b!1102077 (=> (not res!735359) (not e!629043))))

(declare-datatypes ((List!24012 0))(
  ( (Nil!24009) (Cons!24008 (h!25217 (_ BitVec 64)) (t!34249 List!24012)) )
))
(declare-fun arrayNoDuplicates!0 (array!71403 (_ BitVec 32) List!24012) Bool)

(assert (=> b!1102077 (= res!735359 (arrayNoDuplicates!0 lt!494335 #b00000000000000000000000000000000 Nil!24009))))

(declare-fun b!1102078 () Bool)

(assert (=> b!1102078 (= e!629047 e!629044)))

(declare-fun res!735363 () Bool)

(assert (=> b!1102078 (=> res!735363 e!629044)))

(assert (=> b!1102078 (= res!735363 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1102078 (= lt!494338 lt!494336)))

(declare-fun lt!494326 () tuple2!17396)

(declare-fun +!3401 (ListLongMap!15365 tuple2!17396) ListLongMap!15365)

(assert (=> b!1102078 (= lt!494336 (+!3401 lt!494331 lt!494326))))

(assert (=> b!1102078 (= lt!494333 lt!494327)))

(assert (=> b!1102078 (= lt!494327 (+!3401 lt!494337 lt!494326))))

(assert (=> b!1102078 (= lt!494333 (+!3401 lt!494328 lt!494326))))

(assert (=> b!1102078 (= lt!494326 (tuple2!17397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1102079 () Bool)

(assert (=> b!1102079 (= e!629042 e!629043)))

(declare-fun res!735360 () Bool)

(assert (=> b!1102079 (=> (not res!735360) (not e!629043))))

(assert (=> b!1102079 (= res!735360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494335 mask!1414))))

(assert (=> b!1102079 (= lt!494335 (array!71404 (store (arr!34363 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34899 _keys!1070)))))

(declare-fun b!1102080 () Bool)

(declare-fun res!735357 () Bool)

(assert (=> b!1102080 (=> (not res!735357) (not e!629042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102080 (= res!735357 (validKeyInArray!0 k!904))))

(declare-fun b!1102081 () Bool)

(assert (=> b!1102081 (= e!629041 (and e!629040 mapRes!42652))))

(declare-fun condMapEmpty!42652 () Bool)

(declare-fun mapDefault!42652 () ValueCell!12911)

