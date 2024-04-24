; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96168 () Bool)

(assert start!96168)

(declare-fun b_free!22585 () Bool)

(declare-fun b_next!22585 () Bool)

(assert (=> start!96168 (= b_free!22585 (not b_next!22585))))

(declare-fun tp!79604 () Bool)

(declare-fun b_and!35855 () Bool)

(assert (=> start!96168 (= tp!79604 b_and!35855)))

(declare-fun b!1087928 () Bool)

(declare-fun res!725094 () Bool)

(declare-fun e!621568 () Bool)

(assert (=> b!1087928 (=> (not res!725094) (not e!621568))))

(declare-datatypes ((array!70141 0))(
  ( (array!70142 (arr!33738 (Array (_ BitVec 32) (_ BitVec 64))) (size!34275 (_ BitVec 32))) )
))
(declare-fun lt!483546 () array!70141)

(declare-datatypes ((List!23539 0))(
  ( (Nil!23536) (Cons!23535 (h!24753 (_ BitVec 64)) (t!33174 List!23539)) )
))
(declare-fun arrayNoDuplicates!0 (array!70141 (_ BitVec 32) List!23539) Bool)

(assert (=> b!1087928 (= res!725094 (arrayNoDuplicates!0 lt!483546 #b00000000000000000000000000000000 Nil!23536))))

(declare-fun b!1087929 () Bool)

(declare-fun res!725090 () Bool)

(declare-fun e!621569 () Bool)

(assert (=> b!1087929 (=> (not res!725090) (not e!621569))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087929 (= res!725090 (validKeyInArray!0 k0!904))))

(declare-fun b!1087930 () Bool)

(declare-fun e!621565 () Bool)

(assert (=> b!1087930 (= e!621565 true)))

(declare-datatypes ((V!40577 0))(
  ( (V!40578 (val!13350 Int)) )
))
(declare-datatypes ((tuple2!16944 0))(
  ( (tuple2!16945 (_1!8483 (_ BitVec 64)) (_2!8483 V!40577)) )
))
(declare-datatypes ((List!23540 0))(
  ( (Nil!23537) (Cons!23536 (h!24754 tuple2!16944) (t!33175 List!23540)) )
))
(declare-datatypes ((ListLongMap!14921 0))(
  ( (ListLongMap!14922 (toList!7476 List!23540)) )
))
(declare-fun lt!483555 () ListLongMap!14921)

(declare-fun lt!483548 () tuple2!16944)

(declare-fun lt!483549 () ListLongMap!14921)

(declare-fun -!788 (ListLongMap!14921 (_ BitVec 64)) ListLongMap!14921)

(declare-fun +!3300 (ListLongMap!14921 tuple2!16944) ListLongMap!14921)

(assert (=> b!1087930 (= (-!788 lt!483549 k0!904) (+!3300 lt!483555 lt!483548))))

(declare-fun minValue!831 () V!40577)

(declare-fun lt!483556 () ListLongMap!14921)

(declare-datatypes ((Unit!35743 0))(
  ( (Unit!35744) )
))
(declare-fun lt!483559 () Unit!35743)

(declare-fun addRemoveCommutativeForDiffKeys!34 (ListLongMap!14921 (_ BitVec 64) V!40577 (_ BitVec 64)) Unit!35743)

(assert (=> b!1087930 (= lt!483559 (addRemoveCommutativeForDiffKeys!34 lt!483556 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087931 () Bool)

(assert (=> b!1087931 (= e!621569 e!621568)))

(declare-fun res!725093 () Bool)

(assert (=> b!1087931 (=> (not res!725093) (not e!621568))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70141 (_ BitVec 32)) Bool)

(assert (=> b!1087931 (= res!725093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483546 mask!1414))))

(declare-fun _keys!1070 () array!70141)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087931 (= lt!483546 (array!70142 (store (arr!33738 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34275 _keys!1070)))))

(declare-fun mapIsEmpty!41635 () Bool)

(declare-fun mapRes!41635 () Bool)

(assert (=> mapIsEmpty!41635 mapRes!41635))

(declare-fun b!1087932 () Bool)

(declare-fun res!725095 () Bool)

(assert (=> b!1087932 (=> (not res!725095) (not e!621569))))

(assert (=> b!1087932 (= res!725095 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34275 _keys!1070))))))

(declare-fun b!1087933 () Bool)

(declare-fun e!621564 () Bool)

(declare-fun e!621562 () Bool)

(assert (=> b!1087933 (= e!621564 (and e!621562 mapRes!41635))))

(declare-fun condMapEmpty!41635 () Bool)

(declare-datatypes ((ValueCell!12584 0))(
  ( (ValueCellFull!12584 (v!15967 V!40577)) (EmptyCell!12584) )
))
(declare-datatypes ((array!70143 0))(
  ( (array!70144 (arr!33739 (Array (_ BitVec 32) ValueCell!12584)) (size!34276 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70143)

(declare-fun mapDefault!41635 () ValueCell!12584)

(assert (=> b!1087933 (= condMapEmpty!41635 (= (arr!33739 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12584)) mapDefault!41635)))))

(declare-fun res!725100 () Bool)

(assert (=> start!96168 (=> (not res!725100) (not e!621569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96168 (= res!725100 (validMask!0 mask!1414))))

(assert (=> start!96168 e!621569))

(assert (=> start!96168 tp!79604))

(assert (=> start!96168 true))

(declare-fun tp_is_empty!26587 () Bool)

(assert (=> start!96168 tp_is_empty!26587))

(declare-fun array_inv!26076 (array!70141) Bool)

(assert (=> start!96168 (array_inv!26076 _keys!1070)))

(declare-fun array_inv!26077 (array!70143) Bool)

(assert (=> start!96168 (and (array_inv!26077 _values!874) e!621564)))

(declare-fun b!1087934 () Bool)

(declare-fun res!725091 () Bool)

(assert (=> b!1087934 (=> (not res!725091) (not e!621569))))

(assert (=> b!1087934 (= res!725091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087935 () Bool)

(declare-fun res!725096 () Bool)

(assert (=> b!1087935 (=> (not res!725096) (not e!621569))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087935 (= res!725096 (and (= (size!34276 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34275 _keys!1070) (size!34276 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087936 () Bool)

(declare-fun res!725098 () Bool)

(assert (=> b!1087936 (=> (not res!725098) (not e!621569))))

(assert (=> b!1087936 (= res!725098 (= (select (arr!33738 _keys!1070) i!650) k0!904))))

(declare-fun b!1087937 () Bool)

(declare-fun res!725092 () Bool)

(assert (=> b!1087937 (=> (not res!725092) (not e!621569))))

(assert (=> b!1087937 (= res!725092 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23536))))

(declare-fun b!1087938 () Bool)

(declare-fun e!621566 () Bool)

(assert (=> b!1087938 (= e!621568 (not e!621566))))

(declare-fun res!725099 () Bool)

(assert (=> b!1087938 (=> res!725099 e!621566)))

(assert (=> b!1087938 (= res!725099 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!483550 () ListLongMap!14921)

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40577)

(declare-fun getCurrentListMap!4241 (array!70141 array!70143 (_ BitVec 32) (_ BitVec 32) V!40577 V!40577 (_ BitVec 32) Int) ListLongMap!14921)

(assert (=> b!1087938 (= lt!483550 (getCurrentListMap!4241 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483560 () array!70143)

(declare-fun lt!483547 () ListLongMap!14921)

(assert (=> b!1087938 (= lt!483547 (getCurrentListMap!4241 lt!483546 lt!483560 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483551 () ListLongMap!14921)

(declare-fun lt!483554 () ListLongMap!14921)

(assert (=> b!1087938 (and (= lt!483551 lt!483554) (= lt!483554 lt!483551))))

(declare-fun lt!483558 () ListLongMap!14921)

(assert (=> b!1087938 (= lt!483554 (-!788 lt!483558 k0!904))))

(declare-fun lt!483557 () Unit!35743)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!70 (array!70141 array!70143 (_ BitVec 32) (_ BitVec 32) V!40577 V!40577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35743)

(assert (=> b!1087938 (= lt!483557 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!70 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4046 (array!70141 array!70143 (_ BitVec 32) (_ BitVec 32) V!40577 V!40577 (_ BitVec 32) Int) ListLongMap!14921)

(assert (=> b!1087938 (= lt!483551 (getCurrentListMapNoExtraKeys!4046 lt!483546 lt!483560 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2167 (Int (_ BitVec 64)) V!40577)

(assert (=> b!1087938 (= lt!483560 (array!70144 (store (arr!33739 _values!874) i!650 (ValueCellFull!12584 (dynLambda!2167 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34276 _values!874)))))

(assert (=> b!1087938 (= lt!483558 (getCurrentListMapNoExtraKeys!4046 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087938 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483552 () Unit!35743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70141 (_ BitVec 64) (_ BitVec 32)) Unit!35743)

(assert (=> b!1087938 (= lt!483552 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087939 () Bool)

(declare-fun e!621563 () Bool)

(assert (=> b!1087939 (= e!621563 tp_is_empty!26587)))

(declare-fun b!1087940 () Bool)

(assert (=> b!1087940 (= e!621562 tp_is_empty!26587)))

(declare-fun b!1087941 () Bool)

(assert (=> b!1087941 (= e!621566 e!621565)))

(declare-fun res!725097 () Bool)

(assert (=> b!1087941 (=> res!725097 e!621565)))

(assert (=> b!1087941 (= res!725097 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483545 () ListLongMap!14921)

(assert (=> b!1087941 (= lt!483555 lt!483545)))

(assert (=> b!1087941 (= lt!483555 (-!788 lt!483556 k0!904))))

(declare-fun lt!483553 () Unit!35743)

(assert (=> b!1087941 (= lt!483553 (addRemoveCommutativeForDiffKeys!34 lt!483558 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1087941 (= lt!483547 (+!3300 lt!483545 lt!483548))))

(declare-fun lt!483561 () tuple2!16944)

(assert (=> b!1087941 (= lt!483545 (+!3300 lt!483554 lt!483561))))

(assert (=> b!1087941 (= lt!483550 lt!483549)))

(assert (=> b!1087941 (= lt!483549 (+!3300 lt!483556 lt!483548))))

(assert (=> b!1087941 (= lt!483556 (+!3300 lt!483558 lt!483561))))

(assert (=> b!1087941 (= lt!483547 (+!3300 (+!3300 lt!483551 lt!483561) lt!483548))))

(assert (=> b!1087941 (= lt!483548 (tuple2!16945 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087941 (= lt!483561 (tuple2!16945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41635 () Bool)

(declare-fun tp!79603 () Bool)

(assert (=> mapNonEmpty!41635 (= mapRes!41635 (and tp!79603 e!621563))))

(declare-fun mapKey!41635 () (_ BitVec 32))

(declare-fun mapRest!41635 () (Array (_ BitVec 32) ValueCell!12584))

(declare-fun mapValue!41635 () ValueCell!12584)

(assert (=> mapNonEmpty!41635 (= (arr!33739 _values!874) (store mapRest!41635 mapKey!41635 mapValue!41635))))

(assert (= (and start!96168 res!725100) b!1087935))

(assert (= (and b!1087935 res!725096) b!1087934))

(assert (= (and b!1087934 res!725091) b!1087937))

(assert (= (and b!1087937 res!725092) b!1087932))

(assert (= (and b!1087932 res!725095) b!1087929))

(assert (= (and b!1087929 res!725090) b!1087936))

(assert (= (and b!1087936 res!725098) b!1087931))

(assert (= (and b!1087931 res!725093) b!1087928))

(assert (= (and b!1087928 res!725094) b!1087938))

(assert (= (and b!1087938 (not res!725099)) b!1087941))

(assert (= (and b!1087941 (not res!725097)) b!1087930))

(assert (= (and b!1087933 condMapEmpty!41635) mapIsEmpty!41635))

(assert (= (and b!1087933 (not condMapEmpty!41635)) mapNonEmpty!41635))

(get-info :version)

(assert (= (and mapNonEmpty!41635 ((_ is ValueCellFull!12584) mapValue!41635)) b!1087939))

(assert (= (and b!1087933 ((_ is ValueCellFull!12584) mapDefault!41635)) b!1087940))

(assert (= start!96168 b!1087933))

(declare-fun b_lambda!17265 () Bool)

(assert (=> (not b_lambda!17265) (not b!1087938)))

(declare-fun t!33173 () Bool)

(declare-fun tb!7455 () Bool)

(assert (=> (and start!96168 (= defaultEntry!882 defaultEntry!882) t!33173) tb!7455))

(declare-fun result!15437 () Bool)

(assert (=> tb!7455 (= result!15437 tp_is_empty!26587)))

(assert (=> b!1087938 t!33173))

(declare-fun b_and!35857 () Bool)

(assert (= b_and!35855 (and (=> t!33173 result!15437) b_and!35857)))

(declare-fun m!1006847 () Bool)

(assert (=> b!1087941 m!1006847))

(declare-fun m!1006849 () Bool)

(assert (=> b!1087941 m!1006849))

(declare-fun m!1006851 () Bool)

(assert (=> b!1087941 m!1006851))

(declare-fun m!1006853 () Bool)

(assert (=> b!1087941 m!1006853))

(declare-fun m!1006855 () Bool)

(assert (=> b!1087941 m!1006855))

(declare-fun m!1006857 () Bool)

(assert (=> b!1087941 m!1006857))

(assert (=> b!1087941 m!1006853))

(declare-fun m!1006859 () Bool)

(assert (=> b!1087941 m!1006859))

(declare-fun m!1006861 () Bool)

(assert (=> b!1087941 m!1006861))

(declare-fun m!1006863 () Bool)

(assert (=> b!1087938 m!1006863))

(declare-fun m!1006865 () Bool)

(assert (=> b!1087938 m!1006865))

(declare-fun m!1006867 () Bool)

(assert (=> b!1087938 m!1006867))

(declare-fun m!1006869 () Bool)

(assert (=> b!1087938 m!1006869))

(declare-fun m!1006871 () Bool)

(assert (=> b!1087938 m!1006871))

(declare-fun m!1006873 () Bool)

(assert (=> b!1087938 m!1006873))

(declare-fun m!1006875 () Bool)

(assert (=> b!1087938 m!1006875))

(declare-fun m!1006877 () Bool)

(assert (=> b!1087938 m!1006877))

(declare-fun m!1006879 () Bool)

(assert (=> b!1087938 m!1006879))

(declare-fun m!1006881 () Bool)

(assert (=> b!1087938 m!1006881))

(declare-fun m!1006883 () Bool)

(assert (=> b!1087937 m!1006883))

(declare-fun m!1006885 () Bool)

(assert (=> b!1087931 m!1006885))

(declare-fun m!1006887 () Bool)

(assert (=> b!1087931 m!1006887))

(declare-fun m!1006889 () Bool)

(assert (=> b!1087928 m!1006889))

(declare-fun m!1006891 () Bool)

(assert (=> b!1087936 m!1006891))

(declare-fun m!1006893 () Bool)

(assert (=> start!96168 m!1006893))

(declare-fun m!1006895 () Bool)

(assert (=> start!96168 m!1006895))

(declare-fun m!1006897 () Bool)

(assert (=> start!96168 m!1006897))

(declare-fun m!1006899 () Bool)

(assert (=> mapNonEmpty!41635 m!1006899))

(declare-fun m!1006901 () Bool)

(assert (=> b!1087929 m!1006901))

(declare-fun m!1006903 () Bool)

(assert (=> b!1087930 m!1006903))

(declare-fun m!1006905 () Bool)

(assert (=> b!1087930 m!1006905))

(declare-fun m!1006907 () Bool)

(assert (=> b!1087930 m!1006907))

(declare-fun m!1006909 () Bool)

(assert (=> b!1087934 m!1006909))

(check-sat (not b!1087941) (not b_next!22585) (not b!1087938) (not b!1087934) b_and!35857 (not start!96168) (not b_lambda!17265) (not mapNonEmpty!41635) (not b!1087929) (not b!1087931) (not b!1087928) (not b!1087937) tp_is_empty!26587 (not b!1087930))
(check-sat b_and!35857 (not b_next!22585))
