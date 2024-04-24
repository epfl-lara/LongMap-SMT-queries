; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96276 () Bool)

(assert start!96276)

(declare-fun b_free!22693 () Bool)

(declare-fun b_next!22693 () Bool)

(assert (=> start!96276 (= b_free!22693 (not b_next!22693))))

(declare-fun tp!79928 () Bool)

(declare-fun b_and!36071 () Bool)

(assert (=> start!96276 (= tp!79928 b_and!36071)))

(declare-fun b!1090313 () Bool)

(declare-fun res!726888 () Bool)

(declare-fun e!622862 () Bool)

(assert (=> b!1090313 (=> (not res!726888) (not e!622862))))

(declare-datatypes ((array!70353 0))(
  ( (array!70354 (arr!33844 (Array (_ BitVec 32) (_ BitVec 64))) (size!34381 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70353)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090313 (= res!726888 (= (select (arr!33844 _keys!1070) i!650) k0!904))))

(declare-fun b!1090314 () Bool)

(declare-fun e!622861 () Bool)

(declare-fun e!622859 () Bool)

(assert (=> b!1090314 (= e!622861 (not e!622859))))

(declare-fun res!726890 () Bool)

(assert (=> b!1090314 (=> res!726890 e!622859)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090314 (= res!726890 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!40721 0))(
  ( (V!40722 (val!13404 Int)) )
))
(declare-datatypes ((tuple2!17036 0))(
  ( (tuple2!17037 (_1!8529 (_ BitVec 64)) (_2!8529 V!40721)) )
))
(declare-datatypes ((List!23629 0))(
  ( (Nil!23626) (Cons!23625 (h!24843 tuple2!17036) (t!33372 List!23629)) )
))
(declare-datatypes ((ListLongMap!15013 0))(
  ( (ListLongMap!15014 (toList!7522 List!23629)) )
))
(declare-fun lt!485799 () ListLongMap!15013)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40721)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40721)

(declare-datatypes ((ValueCell!12638 0))(
  ( (ValueCellFull!12638 (v!16021 V!40721)) (EmptyCell!12638) )
))
(declare-datatypes ((array!70355 0))(
  ( (array!70356 (arr!33845 (Array (_ BitVec 32) ValueCell!12638)) (size!34382 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70355)

(declare-fun getCurrentListMap!4281 (array!70353 array!70355 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) Int) ListLongMap!15013)

(assert (=> b!1090314 (= lt!485799 (getCurrentListMap!4281 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485803 () array!70355)

(declare-fun lt!485798 () array!70353)

(declare-fun lt!485796 () ListLongMap!15013)

(assert (=> b!1090314 (= lt!485796 (getCurrentListMap!4281 lt!485798 lt!485803 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485800 () ListLongMap!15013)

(declare-fun lt!485797 () ListLongMap!15013)

(assert (=> b!1090314 (and (= lt!485800 lt!485797) (= lt!485797 lt!485800))))

(declare-fun lt!485805 () ListLongMap!15013)

(declare-fun -!833 (ListLongMap!15013 (_ BitVec 64)) ListLongMap!15013)

(assert (=> b!1090314 (= lt!485797 (-!833 lt!485805 k0!904))))

(declare-datatypes ((Unit!35833 0))(
  ( (Unit!35834) )
))
(declare-fun lt!485804 () Unit!35833)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!110 (array!70353 array!70355 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35833)

(assert (=> b!1090314 (= lt!485804 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!110 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4086 (array!70353 array!70355 (_ BitVec 32) (_ BitVec 32) V!40721 V!40721 (_ BitVec 32) Int) ListLongMap!15013)

(assert (=> b!1090314 (= lt!485800 (getCurrentListMapNoExtraKeys!4086 lt!485798 lt!485803 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2207 (Int (_ BitVec 64)) V!40721)

(assert (=> b!1090314 (= lt!485803 (array!70356 (store (arr!33845 _values!874) i!650 (ValueCellFull!12638 (dynLambda!2207 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34382 _values!874)))))

(assert (=> b!1090314 (= lt!485805 (getCurrentListMapNoExtraKeys!4086 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090314 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485808 () Unit!35833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70353 (_ BitVec 64) (_ BitVec 32)) Unit!35833)

(assert (=> b!1090314 (= lt!485808 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090315 () Bool)

(declare-fun res!726887 () Bool)

(assert (=> b!1090315 (=> (not res!726887) (not e!622862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70353 (_ BitVec 32)) Bool)

(assert (=> b!1090315 (= res!726887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090316 () Bool)

(declare-fun res!726884 () Bool)

(assert (=> b!1090316 (=> (not res!726884) (not e!622862))))

(declare-datatypes ((List!23630 0))(
  ( (Nil!23627) (Cons!23626 (h!24844 (_ BitVec 64)) (t!33373 List!23630)) )
))
(declare-fun arrayNoDuplicates!0 (array!70353 (_ BitVec 32) List!23630) Bool)

(assert (=> b!1090316 (= res!726884 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23627))))

(declare-fun mapNonEmpty!41797 () Bool)

(declare-fun mapRes!41797 () Bool)

(declare-fun tp!79927 () Bool)

(declare-fun e!622865 () Bool)

(assert (=> mapNonEmpty!41797 (= mapRes!41797 (and tp!79927 e!622865))))

(declare-fun mapRest!41797 () (Array (_ BitVec 32) ValueCell!12638))

(declare-fun mapKey!41797 () (_ BitVec 32))

(declare-fun mapValue!41797 () ValueCell!12638)

(assert (=> mapNonEmpty!41797 (= (arr!33845 _values!874) (store mapRest!41797 mapKey!41797 mapValue!41797))))

(declare-fun b!1090317 () Bool)

(declare-fun res!726885 () Bool)

(assert (=> b!1090317 (=> (not res!726885) (not e!622862))))

(assert (=> b!1090317 (= res!726885 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34381 _keys!1070))))))

(declare-fun b!1090318 () Bool)

(assert (=> b!1090318 (= e!622862 e!622861)))

(declare-fun res!726881 () Bool)

(assert (=> b!1090318 (=> (not res!726881) (not e!622861))))

(assert (=> b!1090318 (= res!726881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485798 mask!1414))))

(assert (=> b!1090318 (= lt!485798 (array!70354 (store (arr!33844 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34381 _keys!1070)))))

(declare-fun b!1090319 () Bool)

(declare-fun tp_is_empty!26695 () Bool)

(assert (=> b!1090319 (= e!622865 tp_is_empty!26695)))

(declare-fun b!1090320 () Bool)

(declare-fun res!726889 () Bool)

(assert (=> b!1090320 (=> (not res!726889) (not e!622862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090320 (= res!726889 (validKeyInArray!0 k0!904))))

(declare-fun b!1090321 () Bool)

(declare-fun e!622863 () Bool)

(assert (=> b!1090321 (= e!622863 tp_is_empty!26695)))

(declare-fun b!1090322 () Bool)

(declare-fun e!622858 () Bool)

(assert (=> b!1090322 (= e!622858 (and e!622863 mapRes!41797))))

(declare-fun condMapEmpty!41797 () Bool)

(declare-fun mapDefault!41797 () ValueCell!12638)

(assert (=> b!1090322 (= condMapEmpty!41797 (= (arr!33845 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12638)) mapDefault!41797)))))

(declare-fun b!1090323 () Bool)

(declare-fun e!622864 () Bool)

(assert (=> b!1090323 (= e!622864 true)))

(declare-fun lt!485801 () ListLongMap!15013)

(declare-fun lt!485806 () ListLongMap!15013)

(assert (=> b!1090323 (= (-!833 lt!485801 k0!904) lt!485806)))

(declare-fun lt!485807 () Unit!35833)

(declare-fun addRemoveCommutativeForDiffKeys!71 (ListLongMap!15013 (_ BitVec 64) V!40721 (_ BitVec 64)) Unit!35833)

(assert (=> b!1090323 (= lt!485807 (addRemoveCommutativeForDiffKeys!71 lt!485805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun res!726886 () Bool)

(assert (=> start!96276 (=> (not res!726886) (not e!622862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96276 (= res!726886 (validMask!0 mask!1414))))

(assert (=> start!96276 e!622862))

(assert (=> start!96276 tp!79928))

(assert (=> start!96276 true))

(assert (=> start!96276 tp_is_empty!26695))

(declare-fun array_inv!26152 (array!70353) Bool)

(assert (=> start!96276 (array_inv!26152 _keys!1070)))

(declare-fun array_inv!26153 (array!70355) Bool)

(assert (=> start!96276 (and (array_inv!26153 _values!874) e!622858)))

(declare-fun b!1090324 () Bool)

(declare-fun res!726882 () Bool)

(assert (=> b!1090324 (=> (not res!726882) (not e!622861))))

(assert (=> b!1090324 (= res!726882 (arrayNoDuplicates!0 lt!485798 #b00000000000000000000000000000000 Nil!23627))))

(declare-fun b!1090325 () Bool)

(assert (=> b!1090325 (= e!622859 e!622864)))

(declare-fun res!726891 () Bool)

(assert (=> b!1090325 (=> res!726891 e!622864)))

(assert (=> b!1090325 (= res!726891 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1090325 (= lt!485796 lt!485806)))

(declare-fun lt!485802 () tuple2!17036)

(declare-fun +!3340 (ListLongMap!15013 tuple2!17036) ListLongMap!15013)

(assert (=> b!1090325 (= lt!485806 (+!3340 lt!485797 lt!485802))))

(assert (=> b!1090325 (= lt!485799 lt!485801)))

(assert (=> b!1090325 (= lt!485801 (+!3340 lt!485805 lt!485802))))

(assert (=> b!1090325 (= lt!485796 (+!3340 lt!485800 lt!485802))))

(assert (=> b!1090325 (= lt!485802 (tuple2!17037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090326 () Bool)

(declare-fun res!726883 () Bool)

(assert (=> b!1090326 (=> (not res!726883) (not e!622862))))

(assert (=> b!1090326 (= res!726883 (and (= (size!34382 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34381 _keys!1070) (size!34382 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41797 () Bool)

(assert (=> mapIsEmpty!41797 mapRes!41797))

(assert (= (and start!96276 res!726886) b!1090326))

(assert (= (and b!1090326 res!726883) b!1090315))

(assert (= (and b!1090315 res!726887) b!1090316))

(assert (= (and b!1090316 res!726884) b!1090317))

(assert (= (and b!1090317 res!726885) b!1090320))

(assert (= (and b!1090320 res!726889) b!1090313))

(assert (= (and b!1090313 res!726888) b!1090318))

(assert (= (and b!1090318 res!726881) b!1090324))

(assert (= (and b!1090324 res!726882) b!1090314))

(assert (= (and b!1090314 (not res!726890)) b!1090325))

(assert (= (and b!1090325 (not res!726891)) b!1090323))

(assert (= (and b!1090322 condMapEmpty!41797) mapIsEmpty!41797))

(assert (= (and b!1090322 (not condMapEmpty!41797)) mapNonEmpty!41797))

(get-info :version)

(assert (= (and mapNonEmpty!41797 ((_ is ValueCellFull!12638) mapValue!41797)) b!1090319))

(assert (= (and b!1090322 ((_ is ValueCellFull!12638) mapDefault!41797)) b!1090321))

(assert (= start!96276 b!1090322))

(declare-fun b_lambda!17373 () Bool)

(assert (=> (not b_lambda!17373) (not b!1090314)))

(declare-fun t!33371 () Bool)

(declare-fun tb!7563 () Bool)

(assert (=> (and start!96276 (= defaultEntry!882 defaultEntry!882) t!33371) tb!7563))

(declare-fun result!15653 () Bool)

(assert (=> tb!7563 (= result!15653 tp_is_empty!26695)))

(assert (=> b!1090314 t!33371))

(declare-fun b_and!36073 () Bool)

(assert (= b_and!36071 (and (=> t!33371 result!15653) b_and!36073)))

(declare-fun m!1009823 () Bool)

(assert (=> b!1090325 m!1009823))

(declare-fun m!1009825 () Bool)

(assert (=> b!1090325 m!1009825))

(declare-fun m!1009827 () Bool)

(assert (=> b!1090325 m!1009827))

(declare-fun m!1009829 () Bool)

(assert (=> b!1090315 m!1009829))

(declare-fun m!1009831 () Bool)

(assert (=> b!1090324 m!1009831))

(declare-fun m!1009833 () Bool)

(assert (=> b!1090323 m!1009833))

(declare-fun m!1009835 () Bool)

(assert (=> b!1090323 m!1009835))

(declare-fun m!1009837 () Bool)

(assert (=> b!1090314 m!1009837))

(declare-fun m!1009839 () Bool)

(assert (=> b!1090314 m!1009839))

(declare-fun m!1009841 () Bool)

(assert (=> b!1090314 m!1009841))

(declare-fun m!1009843 () Bool)

(assert (=> b!1090314 m!1009843))

(declare-fun m!1009845 () Bool)

(assert (=> b!1090314 m!1009845))

(declare-fun m!1009847 () Bool)

(assert (=> b!1090314 m!1009847))

(declare-fun m!1009849 () Bool)

(assert (=> b!1090314 m!1009849))

(declare-fun m!1009851 () Bool)

(assert (=> b!1090314 m!1009851))

(declare-fun m!1009853 () Bool)

(assert (=> b!1090314 m!1009853))

(declare-fun m!1009855 () Bool)

(assert (=> b!1090314 m!1009855))

(declare-fun m!1009857 () Bool)

(assert (=> start!96276 m!1009857))

(declare-fun m!1009859 () Bool)

(assert (=> start!96276 m!1009859))

(declare-fun m!1009861 () Bool)

(assert (=> start!96276 m!1009861))

(declare-fun m!1009863 () Bool)

(assert (=> b!1090320 m!1009863))

(declare-fun m!1009865 () Bool)

(assert (=> b!1090318 m!1009865))

(declare-fun m!1009867 () Bool)

(assert (=> b!1090318 m!1009867))

(declare-fun m!1009869 () Bool)

(assert (=> b!1090316 m!1009869))

(declare-fun m!1009871 () Bool)

(assert (=> b!1090313 m!1009871))

(declare-fun m!1009873 () Bool)

(assert (=> mapNonEmpty!41797 m!1009873))

(check-sat (not b_lambda!17373) (not start!96276) (not b!1090318) (not b!1090323) (not b!1090316) (not b!1090325) (not b!1090324) tp_is_empty!26695 (not b_next!22693) (not b!1090315) b_and!36073 (not mapNonEmpty!41797) (not b!1090320) (not b!1090314))
(check-sat b_and!36073 (not b_next!22693))
