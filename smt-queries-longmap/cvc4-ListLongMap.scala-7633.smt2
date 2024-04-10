; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96122 () Bool)

(assert start!96122)

(declare-fun b_free!22775 () Bool)

(declare-fun b_next!22775 () Bool)

(assert (=> start!96122 (= b_free!22775 (not b_next!22775))))

(declare-fun tp!80174 () Bool)

(declare-fun b_and!36225 () Bool)

(assert (=> start!96122 (= tp!80174 b_and!36225)))

(declare-fun b!1090799 () Bool)

(declare-fun e!622994 () Bool)

(declare-fun e!622993 () Bool)

(assert (=> b!1090799 (= e!622994 (not e!622993))))

(declare-fun res!727730 () Bool)

(assert (=> b!1090799 (=> res!727730 e!622993)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090799 (= res!727730 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40829 0))(
  ( (V!40830 (val!13445 Int)) )
))
(declare-fun minValue!831 () V!40829)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40829)

(declare-datatypes ((tuple2!17094 0))(
  ( (tuple2!17095 (_1!8558 (_ BitVec 64)) (_2!8558 V!40829)) )
))
(declare-datatypes ((List!23681 0))(
  ( (Nil!23678) (Cons!23677 (h!24886 tuple2!17094) (t!33514 List!23681)) )
))
(declare-datatypes ((ListLongMap!15063 0))(
  ( (ListLongMap!15064 (toList!7547 List!23681)) )
))
(declare-fun lt!486862 () ListLongMap!15063)

(declare-datatypes ((array!70475 0))(
  ( (array!70476 (arr!33911 (Array (_ BitVec 32) (_ BitVec 64))) (size!34447 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70475)

(declare-datatypes ((ValueCell!12679 0))(
  ( (ValueCellFull!12679 (v!16066 V!40829)) (EmptyCell!12679) )
))
(declare-datatypes ((array!70477 0))(
  ( (array!70478 (arr!33912 (Array (_ BitVec 32) ValueCell!12679)) (size!34448 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70477)

(declare-fun getCurrentListMap!4312 (array!70475 array!70477 (_ BitVec 32) (_ BitVec 32) V!40829 V!40829 (_ BitVec 32) Int) ListLongMap!15063)

(assert (=> b!1090799 (= lt!486862 (getCurrentListMap!4312 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486861 () ListLongMap!15063)

(declare-fun lt!486854 () array!70475)

(declare-fun lt!486859 () array!70477)

(assert (=> b!1090799 (= lt!486861 (getCurrentListMap!4312 lt!486854 lt!486859 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486863 () ListLongMap!15063)

(declare-fun lt!486865 () ListLongMap!15063)

(assert (=> b!1090799 (and (= lt!486863 lt!486865) (= lt!486865 lt!486863))))

(declare-fun lt!486855 () ListLongMap!15063)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!870 (ListLongMap!15063 (_ BitVec 64)) ListLongMap!15063)

(assert (=> b!1090799 (= lt!486865 (-!870 lt!486855 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35906 0))(
  ( (Unit!35907) )
))
(declare-fun lt!486860 () Unit!35906)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!131 (array!70475 array!70477 (_ BitVec 32) (_ BitVec 32) V!40829 V!40829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35906)

(assert (=> b!1090799 (= lt!486860 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!131 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4072 (array!70475 array!70477 (_ BitVec 32) (_ BitVec 32) V!40829 V!40829 (_ BitVec 32) Int) ListLongMap!15063)

(assert (=> b!1090799 (= lt!486863 (getCurrentListMapNoExtraKeys!4072 lt!486854 lt!486859 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2209 (Int (_ BitVec 64)) V!40829)

(assert (=> b!1090799 (= lt!486859 (array!70478 (store (arr!33912 _values!874) i!650 (ValueCellFull!12679 (dynLambda!2209 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34448 _values!874)))))

(assert (=> b!1090799 (= lt!486855 (getCurrentListMapNoExtraKeys!4072 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090799 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486858 () Unit!35906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70475 (_ BitVec 64) (_ BitVec 32)) Unit!35906)

(assert (=> b!1090799 (= lt!486858 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090800 () Bool)

(declare-fun e!622988 () Bool)

(assert (=> b!1090800 (= e!622988 true)))

(declare-fun lt!486853 () ListLongMap!15063)

(declare-fun lt!486857 () ListLongMap!15063)

(assert (=> b!1090800 (= (-!870 lt!486853 k!904) lt!486857)))

(declare-fun lt!486856 () Unit!35906)

(declare-fun addRemoveCommutativeForDiffKeys!94 (ListLongMap!15063 (_ BitVec 64) V!40829 (_ BitVec 64)) Unit!35906)

(assert (=> b!1090800 (= lt!486856 (addRemoveCommutativeForDiffKeys!94 lt!486855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090801 () Bool)

(declare-fun res!727722 () Bool)

(declare-fun e!622992 () Bool)

(assert (=> b!1090801 (=> (not res!727722) (not e!622992))))

(assert (=> b!1090801 (= res!727722 (= (select (arr!33911 _keys!1070) i!650) k!904))))

(declare-fun b!1090802 () Bool)

(declare-fun res!727727 () Bool)

(assert (=> b!1090802 (=> (not res!727727) (not e!622992))))

(declare-datatypes ((List!23682 0))(
  ( (Nil!23679) (Cons!23678 (h!24887 (_ BitVec 64)) (t!33515 List!23682)) )
))
(declare-fun arrayNoDuplicates!0 (array!70475 (_ BitVec 32) List!23682) Bool)

(assert (=> b!1090802 (= res!727727 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23679))))

(declare-fun b!1090803 () Bool)

(declare-fun e!622990 () Bool)

(declare-fun e!622989 () Bool)

(declare-fun mapRes!41920 () Bool)

(assert (=> b!1090803 (= e!622990 (and e!622989 mapRes!41920))))

(declare-fun condMapEmpty!41920 () Bool)

(declare-fun mapDefault!41920 () ValueCell!12679)

