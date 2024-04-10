; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96034 () Bool)

(assert start!96034)

(declare-fun b_free!22687 () Bool)

(declare-fun b_next!22687 () Bool)

(assert (=> start!96034 (= b_free!22687 (not b_next!22687))))

(declare-fun tp!79909 () Bool)

(declare-fun b_and!36049 () Bool)

(assert (=> start!96034 (= tp!79909 b_and!36049)))

(declare-fun mapNonEmpty!41788 () Bool)

(declare-fun mapRes!41788 () Bool)

(declare-fun tp!79910 () Bool)

(declare-fun e!621938 () Bool)

(assert (=> mapNonEmpty!41788 (= mapRes!41788 (and tp!79910 e!621938))))

(declare-datatypes ((V!40713 0))(
  ( (V!40714 (val!13401 Int)) )
))
(declare-datatypes ((ValueCell!12635 0))(
  ( (ValueCellFull!12635 (v!16022 V!40713)) (EmptyCell!12635) )
))
(declare-fun mapValue!41788 () ValueCell!12635)

(declare-datatypes ((array!70303 0))(
  ( (array!70304 (arr!33825 (Array (_ BitVec 32) ValueCell!12635)) (size!34361 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70303)

(declare-fun mapKey!41788 () (_ BitVec 32))

(declare-fun mapRest!41788 () (Array (_ BitVec 32) ValueCell!12635))

(assert (=> mapNonEmpty!41788 (= (arr!33825 _values!874) (store mapRest!41788 mapKey!41788 mapValue!41788))))

(declare-fun b!1088854 () Bool)

(declare-fun res!726270 () Bool)

(declare-fun e!621932 () Bool)

(assert (=> b!1088854 (=> (not res!726270) (not e!621932))))

(declare-datatypes ((array!70305 0))(
  ( (array!70306 (arr!33826 (Array (_ BitVec 32) (_ BitVec 64))) (size!34362 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70305)

(declare-datatypes ((List!23606 0))(
  ( (Nil!23603) (Cons!23602 (h!24811 (_ BitVec 64)) (t!33351 List!23606)) )
))
(declare-fun arrayNoDuplicates!0 (array!70305 (_ BitVec 32) List!23606) Bool)

(assert (=> b!1088854 (= res!726270 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23603))))

(declare-fun b!1088855 () Bool)

(declare-fun e!621936 () Bool)

(declare-fun e!621937 () Bool)

(assert (=> b!1088855 (= e!621936 (not e!621937))))

(declare-fun res!726264 () Bool)

(assert (=> b!1088855 (=> res!726264 e!621937)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088855 (= res!726264 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40713)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17018 0))(
  ( (tuple2!17019 (_1!8520 (_ BitVec 64)) (_2!8520 V!40713)) )
))
(declare-datatypes ((List!23607 0))(
  ( (Nil!23604) (Cons!23603 (h!24812 tuple2!17018) (t!33352 List!23607)) )
))
(declare-datatypes ((ListLongMap!14987 0))(
  ( (ListLongMap!14988 (toList!7509 List!23607)) )
))
(declare-fun lt!485175 () ListLongMap!14987)

(declare-fun zeroValue!831 () V!40713)

(declare-fun getCurrentListMap!4282 (array!70305 array!70303 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) Int) ListLongMap!14987)

(assert (=> b!1088855 (= lt!485175 (getCurrentListMap!4282 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485168 () ListLongMap!14987)

(declare-fun lt!485171 () array!70305)

(declare-fun lt!485176 () array!70303)

(assert (=> b!1088855 (= lt!485168 (getCurrentListMap!4282 lt!485171 lt!485176 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485169 () ListLongMap!14987)

(declare-fun lt!485164 () ListLongMap!14987)

(assert (=> b!1088855 (and (= lt!485169 lt!485164) (= lt!485164 lt!485169))))

(declare-fun lt!485166 () ListLongMap!14987)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!834 (ListLongMap!14987 (_ BitVec 64)) ListLongMap!14987)

(assert (=> b!1088855 (= lt!485164 (-!834 lt!485166 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35834 0))(
  ( (Unit!35835) )
))
(declare-fun lt!485165 () Unit!35834)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!101 (array!70305 array!70303 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35834)

(assert (=> b!1088855 (= lt!485165 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!101 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4042 (array!70305 array!70303 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) Int) ListLongMap!14987)

(assert (=> b!1088855 (= lt!485169 (getCurrentListMapNoExtraKeys!4042 lt!485171 lt!485176 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2179 (Int (_ BitVec 64)) V!40713)

(assert (=> b!1088855 (= lt!485176 (array!70304 (store (arr!33825 _values!874) i!650 (ValueCellFull!12635 (dynLambda!2179 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34361 _values!874)))))

(assert (=> b!1088855 (= lt!485166 (getCurrentListMapNoExtraKeys!4042 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088855 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485173 () Unit!35834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70305 (_ BitVec 64) (_ BitVec 32)) Unit!35834)

(assert (=> b!1088855 (= lt!485173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088856 () Bool)

(declare-fun res!726263 () Bool)

(assert (=> b!1088856 (=> (not res!726263) (not e!621932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088856 (= res!726263 (validKeyInArray!0 k!904))))

(declare-fun b!1088857 () Bool)

(declare-fun res!726267 () Bool)

(assert (=> b!1088857 (=> (not res!726267) (not e!621936))))

(assert (=> b!1088857 (= res!726267 (arrayNoDuplicates!0 lt!485171 #b00000000000000000000000000000000 Nil!23603))))

(declare-fun b!1088858 () Bool)

(assert (=> b!1088858 (= e!621932 e!621936)))

(declare-fun res!726262 () Bool)

(assert (=> b!1088858 (=> (not res!726262) (not e!621936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70305 (_ BitVec 32)) Bool)

(assert (=> b!1088858 (= res!726262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485171 mask!1414))))

(assert (=> b!1088858 (= lt!485171 (array!70306 (store (arr!33826 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34362 _keys!1070)))))

(declare-fun b!1088859 () Bool)

(declare-fun res!726268 () Bool)

(assert (=> b!1088859 (=> (not res!726268) (not e!621932))))

(assert (=> b!1088859 (= res!726268 (= (select (arr!33826 _keys!1070) i!650) k!904))))

(declare-fun b!1088860 () Bool)

(declare-fun res!726260 () Bool)

(assert (=> b!1088860 (=> (not res!726260) (not e!621932))))

(assert (=> b!1088860 (= res!726260 (and (= (size!34361 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34362 _keys!1070) (size!34361 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088861 () Bool)

(declare-fun e!621934 () Bool)

(assert (=> b!1088861 (= e!621934 true)))

(declare-fun lt!485174 () ListLongMap!14987)

(declare-fun lt!485170 () ListLongMap!14987)

(assert (=> b!1088861 (= (-!834 lt!485174 k!904) lt!485170)))

(declare-fun lt!485167 () Unit!35834)

(declare-fun addRemoveCommutativeForDiffKeys!62 (ListLongMap!14987 (_ BitVec 64) V!40713 (_ BitVec 64)) Unit!35834)

(assert (=> b!1088861 (= lt!485167 (addRemoveCommutativeForDiffKeys!62 lt!485166 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1088862 () Bool)

(declare-fun e!621931 () Bool)

(declare-fun tp_is_empty!26689 () Bool)

(assert (=> b!1088862 (= e!621931 tp_is_empty!26689)))

(declare-fun mapIsEmpty!41788 () Bool)

(assert (=> mapIsEmpty!41788 mapRes!41788))

(declare-fun b!1088863 () Bool)

(assert (=> b!1088863 (= e!621938 tp_is_empty!26689)))

(declare-fun res!726266 () Bool)

(assert (=> start!96034 (=> (not res!726266) (not e!621932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96034 (= res!726266 (validMask!0 mask!1414))))

(assert (=> start!96034 e!621932))

(assert (=> start!96034 tp!79909))

(assert (=> start!96034 true))

(assert (=> start!96034 tp_is_empty!26689))

(declare-fun array_inv!26088 (array!70305) Bool)

(assert (=> start!96034 (array_inv!26088 _keys!1070)))

(declare-fun e!621935 () Bool)

(declare-fun array_inv!26089 (array!70303) Bool)

(assert (=> start!96034 (and (array_inv!26089 _values!874) e!621935)))

(declare-fun b!1088864 () Bool)

(declare-fun res!726269 () Bool)

(assert (=> b!1088864 (=> (not res!726269) (not e!621932))))

(assert (=> b!1088864 (= res!726269 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34362 _keys!1070))))))

(declare-fun b!1088865 () Bool)

(declare-fun res!726261 () Bool)

(assert (=> b!1088865 (=> (not res!726261) (not e!621932))))

(assert (=> b!1088865 (= res!726261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088866 () Bool)

(assert (=> b!1088866 (= e!621935 (and e!621931 mapRes!41788))))

(declare-fun condMapEmpty!41788 () Bool)

(declare-fun mapDefault!41788 () ValueCell!12635)

