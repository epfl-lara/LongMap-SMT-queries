; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96040 () Bool)

(assert start!96040)

(declare-fun b_free!22693 () Bool)

(declare-fun b_next!22693 () Bool)

(assert (=> start!96040 (= b_free!22693 (not b_next!22693))))

(declare-fun tp!79928 () Bool)

(declare-fun b_and!36061 () Bool)

(assert (=> start!96040 (= tp!79928 b_and!36061)))

(declare-fun b!1088986 () Bool)

(declare-fun e!622007 () Bool)

(assert (=> b!1088986 (= e!622007 true)))

(declare-datatypes ((V!40721 0))(
  ( (V!40722 (val!13404 Int)) )
))
(declare-datatypes ((tuple2!17024 0))(
  ( (tuple2!17025 (_1!8523 (_ BitVec 64)) (_2!8523 V!40721)) )
))
(declare-datatypes ((List!23612 0))(
  ( (Nil!23609) (Cons!23608 (h!24817 tuple2!17024) (t!33363 List!23612)) )
))
(declare-datatypes ((ListLongMap!14993 0))(
  ( (ListLongMap!14994 (toList!7512 List!23612)) )
))
(declare-fun lt!485286 () ListLongMap!14993)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!485284 () ListLongMap!14993)

(declare-fun -!837 (ListLongMap!14993 (_ BitVec 64)) ListLongMap!14993)

(assert (=> b!1088986 (= (-!837 lt!485286 k!904) lt!485284)))

(declare-fun lt!485282 () ListLongMap!14993)

(declare-fun zeroValue!831 () V!40721)

(declare-datatypes ((Unit!35840 0))(
  ( (Unit!35841) )
))
(declare-fun lt!485287 () Unit!35840)

(declare-fun addRemoveCommutativeForDiffKeys!65 (ListLongMap!14993 (_ BitVec 64) V!40721 (_ BitVec 64)) Unit!35840)

(assert (=> b!1088986 (= lt!485287 (addRemoveCommutativeForDiffKeys!65 lt!485282 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088987 () Bool)

(declare-fun res!726367 () Bool)

(declare-fun e!622005 () Bool)

(assert (=> b!1088987 (=> (not res!726367) (not e!622005))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70315 0))(
  ( (array!70316 (arr!33831 (Array (_ BitVec 32) (_ BitVec 64))) (size!34367 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70315)

(declare-datatypes ((ValueCell!12638 0))(
  ( (ValueCellFull!12638 (v!16025 V!40721)) (EmptyCell!12638) )
))
(declare-datatypes ((array!70317 0))(
  ( (array!70318 (arr!33832 (Array (_ BitVec 32) ValueCell!12638)) (size!34368 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70317)

(assert (=> b!1088987 (= res!726367 (and (= (size!34368 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34367 _keys!1070) (size!34368 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088988 () Bool)

(declare-fun res!726361 () Bool)

(declare-fun e!622006 () Bool)

(assert (=> b!1088988 (=> (not res!726361) (not e!622006))))

(declare-fun lt!485281 () array!70315)

(declare-datatypes ((List!23613 0))(
  ( (Nil!23610) (Cons!23609 (h!24818 (_ BitVec 64)) (t!33364 List!23613)) )
))
(declare-fun arrayNoDuplicates!0 (array!70315 (_ BitVec 32) List!23613) Bool)

(assert (=> b!1088988 (= res!726361 (arrayNoDuplicates!0 lt!485281 #b00000000000000000000000000000000 Nil!23610))))

(declare-fun mapNonEmpty!41797 () Bool)

(declare-fun mapRes!41797 () Bool)

(declare-fun tp!79927 () Bool)

(declare-fun e!622004 () Bool)

(assert (=> mapNonEmpty!41797 (= mapRes!41797 (and tp!79927 e!622004))))

(declare-fun mapRest!41797 () (Array (_ BitVec 32) ValueCell!12638))

(declare-fun mapKey!41797 () (_ BitVec 32))

(declare-fun mapValue!41797 () ValueCell!12638)

(assert (=> mapNonEmpty!41797 (= (arr!33832 _values!874) (store mapRest!41797 mapKey!41797 mapValue!41797))))

(declare-fun b!1088989 () Bool)

(declare-fun e!622008 () Bool)

(declare-fun tp_is_empty!26695 () Bool)

(assert (=> b!1088989 (= e!622008 tp_is_empty!26695)))

(declare-fun b!1088990 () Bool)

(declare-fun res!726362 () Bool)

(assert (=> b!1088990 (=> (not res!726362) (not e!622005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088990 (= res!726362 (validKeyInArray!0 k!904))))

(declare-fun res!726368 () Bool)

(assert (=> start!96040 (=> (not res!726368) (not e!622005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96040 (= res!726368 (validMask!0 mask!1414))))

(assert (=> start!96040 e!622005))

(assert (=> start!96040 tp!79928))

(assert (=> start!96040 true))

(assert (=> start!96040 tp_is_empty!26695))

(declare-fun array_inv!26092 (array!70315) Bool)

(assert (=> start!96040 (array_inv!26092 _keys!1070)))

(declare-fun e!622003 () Bool)

(declare-fun array_inv!26093 (array!70317) Bool)

(assert (=> start!96040 (and (array_inv!26093 _values!874) e!622003)))

(declare-fun b!1088991 () Bool)

(declare-fun res!726366 () Bool)

(assert (=> b!1088991 (=> (not res!726366) (not e!622005))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088991 (= res!726366 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34367 _keys!1070))))))

(declare-fun b!1088992 () Bool)

(declare-fun res!726360 () Bool)

(assert (=> b!1088992 (=> (not res!726360) (not e!622005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70315 (_ BitVec 32)) Bool)

(assert (=> b!1088992 (= res!726360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41797 () Bool)

(assert (=> mapIsEmpty!41797 mapRes!41797))

(declare-fun b!1088993 () Bool)

(declare-fun res!726359 () Bool)

(assert (=> b!1088993 (=> (not res!726359) (not e!622005))))

(assert (=> b!1088993 (= res!726359 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23610))))

(declare-fun b!1088994 () Bool)

(declare-fun res!726364 () Bool)

(assert (=> b!1088994 (=> (not res!726364) (not e!622005))))

(assert (=> b!1088994 (= res!726364 (= (select (arr!33831 _keys!1070) i!650) k!904))))

(declare-fun b!1088995 () Bool)

(declare-fun e!622010 () Bool)

(assert (=> b!1088995 (= e!622006 (not e!622010))))

(declare-fun res!726365 () Bool)

(assert (=> b!1088995 (=> res!726365 e!622010)))

(assert (=> b!1088995 (= res!726365 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40721)

(declare-fun lt!485291 () ListLongMap!14993)

(declare-fun getCurrentListMap!4285 (array!70315 array!70317 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) Int) ListLongMap!14993)

(assert (=> b!1088995 (= lt!485291 (getCurrentListMap!4285 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485288 () array!70317)

(declare-fun lt!485292 () ListLongMap!14993)

(assert (=> b!1088995 (= lt!485292 (getCurrentListMap!4285 lt!485281 lt!485288 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485290 () ListLongMap!14993)

(declare-fun lt!485289 () ListLongMap!14993)

(assert (=> b!1088995 (and (= lt!485290 lt!485289) (= lt!485289 lt!485290))))

(assert (=> b!1088995 (= lt!485289 (-!837 lt!485282 k!904))))

(declare-fun lt!485293 () Unit!35840)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!104 (array!70315 array!70317 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35840)

(assert (=> b!1088995 (= lt!485293 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!104 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4045 (array!70315 array!70317 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) Int) ListLongMap!14993)

(assert (=> b!1088995 (= lt!485290 (getCurrentListMapNoExtraKeys!4045 lt!485281 lt!485288 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2182 (Int (_ BitVec 64)) V!40721)

(assert (=> b!1088995 (= lt!485288 (array!70318 (store (arr!33832 _values!874) i!650 (ValueCellFull!12638 (dynLambda!2182 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34368 _values!874)))))

(assert (=> b!1088995 (= lt!485282 (getCurrentListMapNoExtraKeys!4045 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088995 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485285 () Unit!35840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70315 (_ BitVec 64) (_ BitVec 32)) Unit!35840)

(assert (=> b!1088995 (= lt!485285 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088996 () Bool)

(assert (=> b!1088996 (= e!622005 e!622006)))

(declare-fun res!726363 () Bool)

(assert (=> b!1088996 (=> (not res!726363) (not e!622006))))

(assert (=> b!1088996 (= res!726363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485281 mask!1414))))

(assert (=> b!1088996 (= lt!485281 (array!70316 (store (arr!33831 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34367 _keys!1070)))))

(declare-fun b!1088997 () Bool)

(assert (=> b!1088997 (= e!622004 tp_is_empty!26695)))

(declare-fun b!1088998 () Bool)

(assert (=> b!1088998 (= e!622003 (and e!622008 mapRes!41797))))

(declare-fun condMapEmpty!41797 () Bool)

(declare-fun mapDefault!41797 () ValueCell!12638)

