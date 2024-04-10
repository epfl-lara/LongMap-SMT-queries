; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95986 () Bool)

(assert start!95986)

(declare-fun b_free!22639 () Bool)

(declare-fun b_next!22639 () Bool)

(assert (=> start!95986 (= b_free!22639 (not b_next!22639))))

(declare-fun tp!79765 () Bool)

(declare-fun b_and!35953 () Bool)

(assert (=> start!95986 (= tp!79765 b_and!35953)))

(declare-fun b!1087798 () Bool)

(declare-fun e!621362 () Bool)

(declare-fun e!621358 () Bool)

(assert (=> b!1087798 (= e!621362 (not e!621358))))

(declare-fun res!725477 () Bool)

(assert (=> b!1087798 (=> res!725477 e!621358)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087798 (= res!725477 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40649 0))(
  ( (V!40650 (val!13377 Int)) )
))
(declare-datatypes ((tuple2!16978 0))(
  ( (tuple2!16979 (_1!8500 (_ BitVec 64)) (_2!8500 V!40649)) )
))
(declare-datatypes ((List!23564 0))(
  ( (Nil!23561) (Cons!23560 (h!24769 tuple2!16978) (t!33261 List!23564)) )
))
(declare-datatypes ((ListLongMap!14947 0))(
  ( (ListLongMap!14948 (toList!7489 List!23564)) )
))
(declare-fun lt!484237 () ListLongMap!14947)

(declare-fun minValue!831 () V!40649)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40649)

(declare-datatypes ((array!70207 0))(
  ( (array!70208 (arr!33777 (Array (_ BitVec 32) (_ BitVec 64))) (size!34313 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70207)

(declare-datatypes ((ValueCell!12611 0))(
  ( (ValueCellFull!12611 (v!15998 V!40649)) (EmptyCell!12611) )
))
(declare-datatypes ((array!70209 0))(
  ( (array!70210 (arr!33778 (Array (_ BitVec 32) ValueCell!12611)) (size!34314 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70209)

(declare-fun getCurrentListMap!4263 (array!70207 array!70209 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) Int) ListLongMap!14947)

(assert (=> b!1087798 (= lt!484237 (getCurrentListMap!4263 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484233 () ListLongMap!14947)

(declare-fun lt!484234 () array!70207)

(declare-fun lt!484238 () array!70209)

(assert (=> b!1087798 (= lt!484233 (getCurrentListMap!4263 lt!484234 lt!484238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484231 () ListLongMap!14947)

(declare-fun lt!484240 () ListLongMap!14947)

(assert (=> b!1087798 (and (= lt!484231 lt!484240) (= lt!484240 lt!484231))))

(declare-fun lt!484232 () ListLongMap!14947)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!814 (ListLongMap!14947 (_ BitVec 64)) ListLongMap!14947)

(assert (=> b!1087798 (= lt!484240 (-!814 lt!484232 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35794 0))(
  ( (Unit!35795) )
))
(declare-fun lt!484235 () Unit!35794)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!82 (array!70207 array!70209 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35794)

(assert (=> b!1087798 (= lt!484235 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!82 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4023 (array!70207 array!70209 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) Int) ListLongMap!14947)

(assert (=> b!1087798 (= lt!484231 (getCurrentListMapNoExtraKeys!4023 lt!484234 lt!484238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2160 (Int (_ BitVec 64)) V!40649)

(assert (=> b!1087798 (= lt!484238 (array!70210 (store (arr!33778 _values!874) i!650 (ValueCellFull!12611 (dynLambda!2160 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34314 _values!874)))))

(assert (=> b!1087798 (= lt!484232 (getCurrentListMapNoExtraKeys!4023 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087798 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484230 () Unit!35794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70207 (_ BitVec 64) (_ BitVec 32)) Unit!35794)

(assert (=> b!1087798 (= lt!484230 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087799 () Bool)

(declare-fun e!621356 () Bool)

(assert (=> b!1087799 (= e!621356 true)))

(declare-fun lt!484228 () ListLongMap!14947)

(declare-fun lt!484239 () ListLongMap!14947)

(assert (=> b!1087799 (= (-!814 lt!484228 k!904) lt!484239)))

(declare-fun lt!484236 () Unit!35794)

(declare-fun addRemoveCommutativeForDiffKeys!45 (ListLongMap!14947 (_ BitVec 64) V!40649 (_ BitVec 64)) Unit!35794)

(assert (=> b!1087799 (= lt!484236 (addRemoveCommutativeForDiffKeys!45 lt!484232 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun res!725468 () Bool)

(declare-fun e!621355 () Bool)

(assert (=> start!95986 (=> (not res!725468) (not e!621355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95986 (= res!725468 (validMask!0 mask!1414))))

(assert (=> start!95986 e!621355))

(assert (=> start!95986 tp!79765))

(assert (=> start!95986 true))

(declare-fun tp_is_empty!26641 () Bool)

(assert (=> start!95986 tp_is_empty!26641))

(declare-fun array_inv!26050 (array!70207) Bool)

(assert (=> start!95986 (array_inv!26050 _keys!1070)))

(declare-fun e!621360 () Bool)

(declare-fun array_inv!26051 (array!70209) Bool)

(assert (=> start!95986 (and (array_inv!26051 _values!874) e!621360)))

(declare-fun b!1087800 () Bool)

(declare-fun e!621359 () Bool)

(assert (=> b!1087800 (= e!621359 tp_is_empty!26641)))

(declare-fun mapIsEmpty!41716 () Bool)

(declare-fun mapRes!41716 () Bool)

(assert (=> mapIsEmpty!41716 mapRes!41716))

(declare-fun b!1087801 () Bool)

(declare-fun res!725469 () Bool)

(assert (=> b!1087801 (=> (not res!725469) (not e!621355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087801 (= res!725469 (validKeyInArray!0 k!904))))

(declare-fun b!1087802 () Bool)

(declare-fun res!725476 () Bool)

(assert (=> b!1087802 (=> (not res!725476) (not e!621355))))

(declare-datatypes ((List!23565 0))(
  ( (Nil!23562) (Cons!23561 (h!24770 (_ BitVec 64)) (t!33262 List!23565)) )
))
(declare-fun arrayNoDuplicates!0 (array!70207 (_ BitVec 32) List!23565) Bool)

(assert (=> b!1087802 (= res!725476 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23562))))

(declare-fun b!1087803 () Bool)

(declare-fun res!725470 () Bool)

(assert (=> b!1087803 (=> (not res!725470) (not e!621355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70207 (_ BitVec 32)) Bool)

(assert (=> b!1087803 (= res!725470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087804 () Bool)

(declare-fun res!725478 () Bool)

(assert (=> b!1087804 (=> (not res!725478) (not e!621355))))

(assert (=> b!1087804 (= res!725478 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34313 _keys!1070))))))

(declare-fun mapNonEmpty!41716 () Bool)

(declare-fun tp!79766 () Bool)

(assert (=> mapNonEmpty!41716 (= mapRes!41716 (and tp!79766 e!621359))))

(declare-fun mapRest!41716 () (Array (_ BitVec 32) ValueCell!12611))

(declare-fun mapKey!41716 () (_ BitVec 32))

(declare-fun mapValue!41716 () ValueCell!12611)

(assert (=> mapNonEmpty!41716 (= (arr!33778 _values!874) (store mapRest!41716 mapKey!41716 mapValue!41716))))

(declare-fun b!1087805 () Bool)

(declare-fun e!621357 () Bool)

(assert (=> b!1087805 (= e!621360 (and e!621357 mapRes!41716))))

(declare-fun condMapEmpty!41716 () Bool)

(declare-fun mapDefault!41716 () ValueCell!12611)

