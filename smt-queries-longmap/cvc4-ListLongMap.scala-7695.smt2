; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96626 () Bool)

(assert start!96626)

(declare-fun b_free!23099 () Bool)

(declare-fun b_next!23099 () Bool)

(assert (=> start!96626 (= b_free!23099 (not b_next!23099))))

(declare-fun tp!81236 () Bool)

(declare-fun b_and!36917 () Bool)

(assert (=> start!96626 (= tp!81236 b_and!36917)))

(declare-fun b!1098870 () Bool)

(declare-fun e!627194 () Bool)

(declare-fun e!627193 () Bool)

(assert (=> b!1098870 (= e!627194 (not e!627193))))

(declare-fun res!733322 () Bool)

(assert (=> b!1098870 (=> res!733322 e!627193)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098870 (= res!733322 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41325 0))(
  ( (V!41326 (val!13631 Int)) )
))
(declare-fun minValue!831 () V!41325)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17316 0))(
  ( (tuple2!17317 (_1!8669 (_ BitVec 64)) (_2!8669 V!41325)) )
))
(declare-datatypes ((List!23935 0))(
  ( (Nil!23932) (Cons!23931 (h!25140 tuple2!17316) (t!34080 List!23935)) )
))
(declare-datatypes ((ListLongMap!15285 0))(
  ( (ListLongMap!15286 (toList!7658 List!23935)) )
))
(declare-fun lt!491783 () ListLongMap!15285)

(declare-fun zeroValue!831 () V!41325)

(declare-datatypes ((array!71213 0))(
  ( (array!71214 (arr!34274 (Array (_ BitVec 32) (_ BitVec 64))) (size!34810 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71213)

(declare-datatypes ((ValueCell!12865 0))(
  ( (ValueCellFull!12865 (v!16256 V!41325)) (EmptyCell!12865) )
))
(declare-datatypes ((array!71215 0))(
  ( (array!71216 (arr!34275 (Array (_ BitVec 32) ValueCell!12865)) (size!34811 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71215)

(declare-fun getCurrentListMap!4375 (array!71213 array!71215 (_ BitVec 32) (_ BitVec 32) V!41325 V!41325 (_ BitVec 32) Int) ListLongMap!15285)

(assert (=> b!1098870 (= lt!491783 (getCurrentListMap!4375 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491770 () array!71213)

(declare-fun lt!491772 () array!71215)

(declare-fun lt!491769 () ListLongMap!15285)

(assert (=> b!1098870 (= lt!491769 (getCurrentListMap!4375 lt!491770 lt!491772 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491777 () ListLongMap!15285)

(declare-fun lt!491780 () ListLongMap!15285)

(assert (=> b!1098870 (and (= lt!491777 lt!491780) (= lt!491780 lt!491777))))

(declare-fun lt!491775 () ListLongMap!15285)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!947 (ListLongMap!15285 (_ BitVec 64)) ListLongMap!15285)

(assert (=> b!1098870 (= lt!491780 (-!947 lt!491775 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36134 0))(
  ( (Unit!36135) )
))
(declare-fun lt!491784 () Unit!36134)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!201 (array!71213 array!71215 (_ BitVec 32) (_ BitVec 32) V!41325 V!41325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36134)

(assert (=> b!1098870 (= lt!491784 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4171 (array!71213 array!71215 (_ BitVec 32) (_ BitVec 32) V!41325 V!41325 (_ BitVec 32) Int) ListLongMap!15285)

(assert (=> b!1098870 (= lt!491777 (getCurrentListMapNoExtraKeys!4171 lt!491770 lt!491772 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2306 (Int (_ BitVec 64)) V!41325)

(assert (=> b!1098870 (= lt!491772 (array!71216 (store (arr!34275 _values!874) i!650 (ValueCellFull!12865 (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34811 _values!874)))))

(assert (=> b!1098870 (= lt!491775 (getCurrentListMapNoExtraKeys!4171 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098870 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!491782 () Unit!36134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71213 (_ BitVec 64) (_ BitVec 32)) Unit!36134)

(assert (=> b!1098870 (= lt!491782 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1098871 () Bool)

(declare-fun res!733321 () Bool)

(declare-fun e!627196 () Bool)

(assert (=> b!1098871 (=> (not res!733321) (not e!627196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71213 (_ BitVec 32)) Bool)

(assert (=> b!1098871 (= res!733321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098872 () Bool)

(declare-fun res!733319 () Bool)

(assert (=> b!1098872 (=> (not res!733319) (not e!627194))))

(declare-datatypes ((List!23936 0))(
  ( (Nil!23933) (Cons!23932 (h!25141 (_ BitVec 64)) (t!34081 List!23936)) )
))
(declare-fun arrayNoDuplicates!0 (array!71213 (_ BitVec 32) List!23936) Bool)

(assert (=> b!1098872 (= res!733319 (arrayNoDuplicates!0 lt!491770 #b00000000000000000000000000000000 Nil!23933))))

(declare-fun mapNonEmpty!42496 () Bool)

(declare-fun mapRes!42496 () Bool)

(declare-fun tp!81235 () Bool)

(declare-fun e!627195 () Bool)

(assert (=> mapNonEmpty!42496 (= mapRes!42496 (and tp!81235 e!627195))))

(declare-fun mapRest!42496 () (Array (_ BitVec 32) ValueCell!12865))

(declare-fun mapKey!42496 () (_ BitVec 32))

(declare-fun mapValue!42496 () ValueCell!12865)

(assert (=> mapNonEmpty!42496 (= (arr!34275 _values!874) (store mapRest!42496 mapKey!42496 mapValue!42496))))

(declare-fun b!1098873 () Bool)

(declare-fun res!733328 () Bool)

(assert (=> b!1098873 (=> (not res!733328) (not e!627196))))

(assert (=> b!1098873 (= res!733328 (= (select (arr!34274 _keys!1070) i!650) k!904))))

(declare-fun b!1098875 () Bool)

(declare-fun tp_is_empty!27149 () Bool)

(assert (=> b!1098875 (= e!627195 tp_is_empty!27149)))

(declare-fun b!1098876 () Bool)

(declare-fun res!733325 () Bool)

(assert (=> b!1098876 (=> (not res!733325) (not e!627196))))

(assert (=> b!1098876 (= res!733325 (and (= (size!34811 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34810 _keys!1070) (size!34811 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42496 () Bool)

(assert (=> mapIsEmpty!42496 mapRes!42496))

(declare-fun b!1098877 () Bool)

(declare-fun e!627197 () Bool)

(assert (=> b!1098877 (= e!627193 e!627197)))

(declare-fun res!733324 () Bool)

(assert (=> b!1098877 (=> res!733324 e!627197)))

(assert (=> b!1098877 (= res!733324 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!491771 () ListLongMap!15285)

(declare-fun lt!491773 () ListLongMap!15285)

(assert (=> b!1098877 (= lt!491771 lt!491773)))

(declare-fun lt!491781 () ListLongMap!15285)

(assert (=> b!1098877 (= lt!491771 (-!947 lt!491781 k!904))))

(declare-fun lt!491779 () Unit!36134)

(declare-fun addRemoveCommutativeForDiffKeys!119 (ListLongMap!15285 (_ BitVec 64) V!41325 (_ BitVec 64)) Unit!36134)

(assert (=> b!1098877 (= lt!491779 (addRemoveCommutativeForDiffKeys!119 lt!491775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!491768 () tuple2!17316)

(declare-fun +!3367 (ListLongMap!15285 tuple2!17316) ListLongMap!15285)

(assert (=> b!1098877 (= lt!491769 (+!3367 lt!491773 lt!491768))))

(declare-fun lt!491778 () tuple2!17316)

(assert (=> b!1098877 (= lt!491773 (+!3367 lt!491780 lt!491778))))

(declare-fun lt!491774 () ListLongMap!15285)

(assert (=> b!1098877 (= lt!491783 lt!491774)))

(assert (=> b!1098877 (= lt!491774 (+!3367 lt!491781 lt!491768))))

(assert (=> b!1098877 (= lt!491781 (+!3367 lt!491775 lt!491778))))

(assert (=> b!1098877 (= lt!491769 (+!3367 (+!3367 lt!491777 lt!491778) lt!491768))))

(assert (=> b!1098877 (= lt!491768 (tuple2!17317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098877 (= lt!491778 (tuple2!17317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098878 () Bool)

(declare-fun res!733318 () Bool)

(assert (=> b!1098878 (=> (not res!733318) (not e!627196))))

(assert (=> b!1098878 (= res!733318 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34810 _keys!1070))))))

(declare-fun b!1098879 () Bool)

(declare-fun e!627198 () Bool)

(declare-fun e!627191 () Bool)

(assert (=> b!1098879 (= e!627198 (and e!627191 mapRes!42496))))

(declare-fun condMapEmpty!42496 () Bool)

(declare-fun mapDefault!42496 () ValueCell!12865)

