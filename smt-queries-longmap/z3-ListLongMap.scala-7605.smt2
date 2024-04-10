; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95952 () Bool)

(assert start!95952)

(declare-fun b_free!22605 () Bool)

(declare-fun b_next!22605 () Bool)

(assert (=> start!95952 (= b_free!22605 (not b_next!22605))))

(declare-fun tp!79663 () Bool)

(declare-fun b_and!35885 () Bool)

(assert (=> start!95952 (= tp!79663 b_and!35885)))

(declare-fun b!1087041 () Bool)

(declare-fun res!724901 () Bool)

(declare-fun e!620952 () Bool)

(assert (=> b!1087041 (=> (not res!724901) (not e!620952))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087041 (= res!724901 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41665 () Bool)

(declare-fun mapRes!41665 () Bool)

(declare-fun tp!79664 () Bool)

(declare-fun e!620951 () Bool)

(assert (=> mapNonEmpty!41665 (= mapRes!41665 (and tp!79664 e!620951))))

(declare-datatypes ((V!40603 0))(
  ( (V!40604 (val!13360 Int)) )
))
(declare-datatypes ((ValueCell!12594 0))(
  ( (ValueCellFull!12594 (v!15981 V!40603)) (EmptyCell!12594) )
))
(declare-datatypes ((array!70143 0))(
  ( (array!70144 (arr!33745 (Array (_ BitVec 32) ValueCell!12594)) (size!34281 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70143)

(declare-fun mapRest!41665 () (Array (_ BitVec 32) ValueCell!12594))

(declare-fun mapKey!41665 () (_ BitVec 32))

(declare-fun mapValue!41665 () ValueCell!12594)

(assert (=> mapNonEmpty!41665 (= (arr!33745 _values!874) (store mapRest!41665 mapKey!41665 mapValue!41665))))

(declare-fun b!1087042 () Bool)

(declare-fun tp_is_empty!26607 () Bool)

(assert (=> b!1087042 (= e!620951 tp_is_empty!26607)))

(declare-fun b!1087043 () Bool)

(declare-fun res!724907 () Bool)

(assert (=> b!1087043 (=> (not res!724907) (not e!620952))))

(declare-datatypes ((array!70145 0))(
  ( (array!70146 (arr!33746 (Array (_ BitVec 32) (_ BitVec 64))) (size!34282 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70145)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087043 (= res!724907 (= (select (arr!33746 _keys!1070) i!650) k0!904))))

(declare-fun b!1087044 () Bool)

(declare-fun e!620949 () Bool)

(assert (=> b!1087044 (= e!620952 e!620949)))

(declare-fun res!724900 () Bool)

(assert (=> b!1087044 (=> (not res!724900) (not e!620949))))

(declare-fun lt!483554 () array!70145)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70145 (_ BitVec 32)) Bool)

(assert (=> b!1087044 (= res!724900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483554 mask!1414))))

(assert (=> b!1087044 (= lt!483554 (array!70146 (store (arr!33746 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34282 _keys!1070)))))

(declare-fun b!1087045 () Bool)

(declare-fun e!620947 () Bool)

(assert (=> b!1087045 (= e!620949 (not e!620947))))

(declare-fun res!724899 () Bool)

(assert (=> b!1087045 (=> res!724899 e!620947)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087045 (= res!724899 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40603)

(declare-fun zeroValue!831 () V!40603)

(declare-datatypes ((tuple2!16950 0))(
  ( (tuple2!16951 (_1!8486 (_ BitVec 64)) (_2!8486 V!40603)) )
))
(declare-datatypes ((List!23540 0))(
  ( (Nil!23537) (Cons!23536 (h!24745 tuple2!16950) (t!33203 List!23540)) )
))
(declare-datatypes ((ListLongMap!14919 0))(
  ( (ListLongMap!14920 (toList!7475 List!23540)) )
))
(declare-fun lt!483550 () ListLongMap!14919)

(declare-fun getCurrentListMap!4252 (array!70145 array!70143 (_ BitVec 32) (_ BitVec 32) V!40603 V!40603 (_ BitVec 32) Int) ListLongMap!14919)

(assert (=> b!1087045 (= lt!483550 (getCurrentListMap!4252 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483551 () array!70143)

(declare-fun lt!483543 () ListLongMap!14919)

(assert (=> b!1087045 (= lt!483543 (getCurrentListMap!4252 lt!483554 lt!483551 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483548 () ListLongMap!14919)

(declare-fun lt!483556 () ListLongMap!14919)

(assert (=> b!1087045 (and (= lt!483548 lt!483556) (= lt!483556 lt!483548))))

(declare-fun lt!483540 () ListLongMap!14919)

(declare-fun -!801 (ListLongMap!14919 (_ BitVec 64)) ListLongMap!14919)

(assert (=> b!1087045 (= lt!483556 (-!801 lt!483540 k0!904))))

(declare-datatypes ((Unit!35768 0))(
  ( (Unit!35769) )
))
(declare-fun lt!483549 () Unit!35768)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!71 (array!70145 array!70143 (_ BitVec 32) (_ BitVec 32) V!40603 V!40603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35768)

(assert (=> b!1087045 (= lt!483549 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!71 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4012 (array!70145 array!70143 (_ BitVec 32) (_ BitVec 32) V!40603 V!40603 (_ BitVec 32) Int) ListLongMap!14919)

(assert (=> b!1087045 (= lt!483548 (getCurrentListMapNoExtraKeys!4012 lt!483554 lt!483551 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2149 (Int (_ BitVec 64)) V!40603)

(assert (=> b!1087045 (= lt!483551 (array!70144 (store (arr!33745 _values!874) i!650 (ValueCellFull!12594 (dynLambda!2149 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34281 _values!874)))))

(assert (=> b!1087045 (= lt!483540 (getCurrentListMapNoExtraKeys!4012 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087045 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483544 () Unit!35768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70145 (_ BitVec 64) (_ BitVec 32)) Unit!35768)

(assert (=> b!1087045 (= lt!483544 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087046 () Bool)

(declare-fun res!724898 () Bool)

(assert (=> b!1087046 (=> (not res!724898) (not e!620952))))

(assert (=> b!1087046 (= res!724898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087048 () Bool)

(declare-fun res!724908 () Bool)

(assert (=> b!1087048 (=> (not res!724908) (not e!620952))))

(assert (=> b!1087048 (= res!724908 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34282 _keys!1070))))))

(declare-fun b!1087049 () Bool)

(declare-fun e!620950 () Bool)

(assert (=> b!1087049 (= e!620950 tp_is_empty!26607)))

(declare-fun b!1087050 () Bool)

(declare-fun e!620953 () Bool)

(assert (=> b!1087050 (= e!620947 e!620953)))

(declare-fun res!724906 () Bool)

(assert (=> b!1087050 (=> res!724906 e!620953)))

(assert (=> b!1087050 (= res!724906 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483546 () ListLongMap!14919)

(declare-fun lt!483553 () ListLongMap!14919)

(assert (=> b!1087050 (= lt!483546 lt!483553)))

(declare-fun lt!483547 () ListLongMap!14919)

(assert (=> b!1087050 (= lt!483546 (-!801 lt!483547 k0!904))))

(declare-fun lt!483552 () Unit!35768)

(declare-fun addRemoveCommutativeForDiffKeys!37 (ListLongMap!14919 (_ BitVec 64) V!40603 (_ BitVec 64)) Unit!35768)

(assert (=> b!1087050 (= lt!483552 (addRemoveCommutativeForDiffKeys!37 lt!483540 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483542 () tuple2!16950)

(declare-fun +!3281 (ListLongMap!14919 tuple2!16950) ListLongMap!14919)

(assert (=> b!1087050 (= lt!483543 (+!3281 lt!483553 lt!483542))))

(declare-fun lt!483541 () tuple2!16950)

(assert (=> b!1087050 (= lt!483553 (+!3281 lt!483556 lt!483541))))

(declare-fun lt!483545 () ListLongMap!14919)

(assert (=> b!1087050 (= lt!483550 lt!483545)))

(assert (=> b!1087050 (= lt!483545 (+!3281 lt!483547 lt!483542))))

(assert (=> b!1087050 (= lt!483547 (+!3281 lt!483540 lt!483541))))

(assert (=> b!1087050 (= lt!483543 (+!3281 (+!3281 lt!483548 lt!483541) lt!483542))))

(assert (=> b!1087050 (= lt!483542 (tuple2!16951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087050 (= lt!483541 (tuple2!16951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087051 () Bool)

(declare-fun e!620948 () Bool)

(assert (=> b!1087051 (= e!620948 (and e!620950 mapRes!41665))))

(declare-fun condMapEmpty!41665 () Bool)

(declare-fun mapDefault!41665 () ValueCell!12594)

(assert (=> b!1087051 (= condMapEmpty!41665 (= (arr!33745 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12594)) mapDefault!41665)))))

(declare-fun b!1087052 () Bool)

(assert (=> b!1087052 (= e!620953 true)))

(assert (=> b!1087052 (= (-!801 lt!483545 k0!904) (+!3281 lt!483546 lt!483542))))

(declare-fun lt!483555 () Unit!35768)

(assert (=> b!1087052 (= lt!483555 (addRemoveCommutativeForDiffKeys!37 lt!483547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41665 () Bool)

(assert (=> mapIsEmpty!41665 mapRes!41665))

(declare-fun b!1087053 () Bool)

(declare-fun res!724902 () Bool)

(assert (=> b!1087053 (=> (not res!724902) (not e!620949))))

(declare-datatypes ((List!23541 0))(
  ( (Nil!23538) (Cons!23537 (h!24746 (_ BitVec 64)) (t!33204 List!23541)) )
))
(declare-fun arrayNoDuplicates!0 (array!70145 (_ BitVec 32) List!23541) Bool)

(assert (=> b!1087053 (= res!724902 (arrayNoDuplicates!0 lt!483554 #b00000000000000000000000000000000 Nil!23538))))

(declare-fun b!1087054 () Bool)

(declare-fun res!724905 () Bool)

(assert (=> b!1087054 (=> (not res!724905) (not e!620952))))

(assert (=> b!1087054 (= res!724905 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23538))))

(declare-fun res!724904 () Bool)

(assert (=> start!95952 (=> (not res!724904) (not e!620952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95952 (= res!724904 (validMask!0 mask!1414))))

(assert (=> start!95952 e!620952))

(assert (=> start!95952 tp!79663))

(assert (=> start!95952 true))

(assert (=> start!95952 tp_is_empty!26607))

(declare-fun array_inv!26032 (array!70145) Bool)

(assert (=> start!95952 (array_inv!26032 _keys!1070)))

(declare-fun array_inv!26033 (array!70143) Bool)

(assert (=> start!95952 (and (array_inv!26033 _values!874) e!620948)))

(declare-fun b!1087047 () Bool)

(declare-fun res!724903 () Bool)

(assert (=> b!1087047 (=> (not res!724903) (not e!620952))))

(assert (=> b!1087047 (= res!724903 (and (= (size!34281 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34282 _keys!1070) (size!34281 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95952 res!724904) b!1087047))

(assert (= (and b!1087047 res!724903) b!1087046))

(assert (= (and b!1087046 res!724898) b!1087054))

(assert (= (and b!1087054 res!724905) b!1087048))

(assert (= (and b!1087048 res!724908) b!1087041))

(assert (= (and b!1087041 res!724901) b!1087043))

(assert (= (and b!1087043 res!724907) b!1087044))

(assert (= (and b!1087044 res!724900) b!1087053))

(assert (= (and b!1087053 res!724902) b!1087045))

(assert (= (and b!1087045 (not res!724899)) b!1087050))

(assert (= (and b!1087050 (not res!724906)) b!1087052))

(assert (= (and b!1087051 condMapEmpty!41665) mapIsEmpty!41665))

(assert (= (and b!1087051 (not condMapEmpty!41665)) mapNonEmpty!41665))

(get-info :version)

(assert (= (and mapNonEmpty!41665 ((_ is ValueCellFull!12594) mapValue!41665)) b!1087042))

(assert (= (and b!1087051 ((_ is ValueCellFull!12594) mapDefault!41665)) b!1087049))

(assert (= start!95952 b!1087051))

(declare-fun b_lambda!17275 () Bool)

(assert (=> (not b_lambda!17275) (not b!1087045)))

(declare-fun t!33202 () Bool)

(declare-fun tb!7483 () Bool)

(assert (=> (and start!95952 (= defaultEntry!882 defaultEntry!882) t!33202) tb!7483))

(declare-fun result!15485 () Bool)

(assert (=> tb!7483 (= result!15485 tp_is_empty!26607)))

(assert (=> b!1087045 t!33202))

(declare-fun b_and!35887 () Bool)

(assert (= b_and!35885 (and (=> t!33202 result!15485) b_and!35887)))

(declare-fun m!1005815 () Bool)

(assert (=> mapNonEmpty!41665 m!1005815))

(declare-fun m!1005817 () Bool)

(assert (=> b!1087052 m!1005817))

(declare-fun m!1005819 () Bool)

(assert (=> b!1087052 m!1005819))

(declare-fun m!1005821 () Bool)

(assert (=> b!1087052 m!1005821))

(declare-fun m!1005823 () Bool)

(assert (=> b!1087054 m!1005823))

(declare-fun m!1005825 () Bool)

(assert (=> b!1087046 m!1005825))

(declare-fun m!1005827 () Bool)

(assert (=> b!1087041 m!1005827))

(declare-fun m!1005829 () Bool)

(assert (=> b!1087045 m!1005829))

(declare-fun m!1005831 () Bool)

(assert (=> b!1087045 m!1005831))

(declare-fun m!1005833 () Bool)

(assert (=> b!1087045 m!1005833))

(declare-fun m!1005835 () Bool)

(assert (=> b!1087045 m!1005835))

(declare-fun m!1005837 () Bool)

(assert (=> b!1087045 m!1005837))

(declare-fun m!1005839 () Bool)

(assert (=> b!1087045 m!1005839))

(declare-fun m!1005841 () Bool)

(assert (=> b!1087045 m!1005841))

(declare-fun m!1005843 () Bool)

(assert (=> b!1087045 m!1005843))

(declare-fun m!1005845 () Bool)

(assert (=> b!1087045 m!1005845))

(declare-fun m!1005847 () Bool)

(assert (=> b!1087045 m!1005847))

(declare-fun m!1005849 () Bool)

(assert (=> b!1087050 m!1005849))

(declare-fun m!1005851 () Bool)

(assert (=> b!1087050 m!1005851))

(declare-fun m!1005853 () Bool)

(assert (=> b!1087050 m!1005853))

(declare-fun m!1005855 () Bool)

(assert (=> b!1087050 m!1005855))

(assert (=> b!1087050 m!1005851))

(declare-fun m!1005857 () Bool)

(assert (=> b!1087050 m!1005857))

(declare-fun m!1005859 () Bool)

(assert (=> b!1087050 m!1005859))

(declare-fun m!1005861 () Bool)

(assert (=> b!1087050 m!1005861))

(declare-fun m!1005863 () Bool)

(assert (=> b!1087050 m!1005863))

(declare-fun m!1005865 () Bool)

(assert (=> b!1087043 m!1005865))

(declare-fun m!1005867 () Bool)

(assert (=> b!1087053 m!1005867))

(declare-fun m!1005869 () Bool)

(assert (=> b!1087044 m!1005869))

(declare-fun m!1005871 () Bool)

(assert (=> b!1087044 m!1005871))

(declare-fun m!1005873 () Bool)

(assert (=> start!95952 m!1005873))

(declare-fun m!1005875 () Bool)

(assert (=> start!95952 m!1005875))

(declare-fun m!1005877 () Bool)

(assert (=> start!95952 m!1005877))

(check-sat (not start!95952) (not b!1087050) (not b!1087044) (not b!1087041) b_and!35887 (not mapNonEmpty!41665) (not b!1087054) (not b!1087046) (not b!1087052) (not b_lambda!17275) (not b_next!22605) tp_is_empty!26607 (not b!1087053) (not b!1087045))
(check-sat b_and!35887 (not b_next!22605))
