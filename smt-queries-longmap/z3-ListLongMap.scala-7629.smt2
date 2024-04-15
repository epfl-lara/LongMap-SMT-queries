; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96088 () Bool)

(assert start!96088)

(declare-fun b_free!22747 () Bool)

(declare-fun b_next!22747 () Bool)

(assert (=> start!96088 (= b_free!22747 (not b_next!22747))))

(declare-fun tp!80089 () Bool)

(declare-fun b_and!36143 () Bool)

(assert (=> start!96088 (= tp!80089 b_and!36143)))

(declare-fun b!1090030 () Bool)

(declare-fun e!622564 () Bool)

(declare-fun e!622561 () Bool)

(assert (=> b!1090030 (= e!622564 e!622561)))

(declare-fun res!727196 () Bool)

(assert (=> b!1090030 (=> res!727196 e!622561)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1090030 (= res!727196 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40793 0))(
  ( (V!40794 (val!13431 Int)) )
))
(declare-datatypes ((tuple2!17122 0))(
  ( (tuple2!17123 (_1!8572 (_ BitVec 64)) (_2!8572 V!40793)) )
))
(declare-datatypes ((List!23688 0))(
  ( (Nil!23685) (Cons!23684 (h!24893 tuple2!17122) (t!33484 List!23688)) )
))
(declare-datatypes ((ListLongMap!15091 0))(
  ( (ListLongMap!15092 (toList!7561 List!23688)) )
))
(declare-fun lt!486109 () ListLongMap!15091)

(declare-fun lt!486110 () ListLongMap!15091)

(assert (=> b!1090030 (= lt!486109 lt!486110)))

(declare-fun lt!486115 () ListLongMap!15091)

(declare-fun lt!486117 () tuple2!17122)

(declare-fun +!3355 (ListLongMap!15091 tuple2!17122) ListLongMap!15091)

(assert (=> b!1090030 (= lt!486110 (+!3355 lt!486115 lt!486117))))

(declare-fun lt!486108 () ListLongMap!15091)

(declare-fun lt!486113 () ListLongMap!15091)

(assert (=> b!1090030 (= lt!486108 lt!486113)))

(declare-fun lt!486114 () ListLongMap!15091)

(assert (=> b!1090030 (= lt!486113 (+!3355 lt!486114 lt!486117))))

(declare-fun lt!486119 () ListLongMap!15091)

(assert (=> b!1090030 (= lt!486108 (+!3355 lt!486119 lt!486117))))

(declare-fun minValue!831 () V!40793)

(assert (=> b!1090030 (= lt!486117 (tuple2!17123 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090031 () Bool)

(assert (=> b!1090031 (= e!622561 true)))

(declare-fun -!836 (ListLongMap!15091 (_ BitVec 64)) ListLongMap!15091)

(assert (=> b!1090031 (= (-!836 lt!486110 k0!904) lt!486113)))

(declare-datatypes ((Unit!35707 0))(
  ( (Unit!35708) )
))
(declare-fun lt!486116 () Unit!35707)

(declare-fun addRemoveCommutativeForDiffKeys!83 (ListLongMap!15091 (_ BitVec 64) V!40793 (_ BitVec 64)) Unit!35707)

(assert (=> b!1090031 (= lt!486116 (addRemoveCommutativeForDiffKeys!83 lt!486115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41878 () Bool)

(declare-fun mapRes!41878 () Bool)

(assert (=> mapIsEmpty!41878 mapRes!41878))

(declare-fun b!1090032 () Bool)

(declare-fun res!727190 () Bool)

(declare-fun e!622560 () Bool)

(assert (=> b!1090032 (=> (not res!727190) (not e!622560))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70340 0))(
  ( (array!70341 (arr!33844 (Array (_ BitVec 32) (_ BitVec 64))) (size!34382 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70340)

(assert (=> b!1090032 (= res!727190 (= (select (arr!33844 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41878 () Bool)

(declare-fun tp!80090 () Bool)

(declare-fun e!622563 () Bool)

(assert (=> mapNonEmpty!41878 (= mapRes!41878 (and tp!80090 e!622563))))

(declare-fun mapKey!41878 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12665 0))(
  ( (ValueCellFull!12665 (v!16051 V!40793)) (EmptyCell!12665) )
))
(declare-fun mapRest!41878 () (Array (_ BitVec 32) ValueCell!12665))

(declare-fun mapValue!41878 () ValueCell!12665)

(declare-datatypes ((array!70342 0))(
  ( (array!70343 (arr!33845 (Array (_ BitVec 32) ValueCell!12665)) (size!34383 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70342)

(assert (=> mapNonEmpty!41878 (= (arr!33845 _values!874) (store mapRest!41878 mapKey!41878 mapValue!41878))))

(declare-fun b!1090033 () Bool)

(declare-fun res!727197 () Bool)

(assert (=> b!1090033 (=> (not res!727197) (not e!622560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090033 (= res!727197 (validKeyInArray!0 k0!904))))

(declare-fun b!1090034 () Bool)

(declare-fun res!727198 () Bool)

(declare-fun e!622565 () Bool)

(assert (=> b!1090034 (=> (not res!727198) (not e!622565))))

(declare-fun lt!486112 () array!70340)

(declare-datatypes ((List!23689 0))(
  ( (Nil!23686) (Cons!23685 (h!24894 (_ BitVec 64)) (t!33485 List!23689)) )
))
(declare-fun arrayNoDuplicates!0 (array!70340 (_ BitVec 32) List!23689) Bool)

(assert (=> b!1090034 (= res!727198 (arrayNoDuplicates!0 lt!486112 #b00000000000000000000000000000000 Nil!23686))))

(declare-fun b!1090035 () Bool)

(assert (=> b!1090035 (= e!622565 (not e!622564))))

(declare-fun res!727195 () Bool)

(assert (=> b!1090035 (=> res!727195 e!622564)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090035 (= res!727195 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40793)

(declare-fun getCurrentListMap!4233 (array!70340 array!70342 (_ BitVec 32) (_ BitVec 32) V!40793 V!40793 (_ BitVec 32) Int) ListLongMap!15091)

(assert (=> b!1090035 (= lt!486109 (getCurrentListMap!4233 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486107 () array!70342)

(assert (=> b!1090035 (= lt!486108 (getCurrentListMap!4233 lt!486112 lt!486107 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090035 (and (= lt!486119 lt!486114) (= lt!486114 lt!486119))))

(assert (=> b!1090035 (= lt!486114 (-!836 lt!486115 k0!904))))

(declare-fun lt!486111 () Unit!35707)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!117 (array!70340 array!70342 (_ BitVec 32) (_ BitVec 32) V!40793 V!40793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35707)

(assert (=> b!1090035 (= lt!486111 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!117 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4103 (array!70340 array!70342 (_ BitVec 32) (_ BitVec 32) V!40793 V!40793 (_ BitVec 32) Int) ListLongMap!15091)

(assert (=> b!1090035 (= lt!486119 (getCurrentListMapNoExtraKeys!4103 lt!486112 lt!486107 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2174 (Int (_ BitVec 64)) V!40793)

(assert (=> b!1090035 (= lt!486107 (array!70343 (store (arr!33845 _values!874) i!650 (ValueCellFull!12665 (dynLambda!2174 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34383 _values!874)))))

(assert (=> b!1090035 (= lt!486115 (getCurrentListMapNoExtraKeys!4103 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090035 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486118 () Unit!35707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70340 (_ BitVec 64) (_ BitVec 32)) Unit!35707)

(assert (=> b!1090035 (= lt!486118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090037 () Bool)

(declare-fun res!727199 () Bool)

(assert (=> b!1090037 (=> (not res!727199) (not e!622560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70340 (_ BitVec 32)) Bool)

(assert (=> b!1090037 (= res!727199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090038 () Bool)

(declare-fun res!727200 () Bool)

(assert (=> b!1090038 (=> (not res!727200) (not e!622560))))

(assert (=> b!1090038 (= res!727200 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23686))))

(declare-fun b!1090039 () Bool)

(assert (=> b!1090039 (= e!622560 e!622565)))

(declare-fun res!727194 () Bool)

(assert (=> b!1090039 (=> (not res!727194) (not e!622565))))

(assert (=> b!1090039 (= res!727194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486112 mask!1414))))

(assert (=> b!1090039 (= lt!486112 (array!70341 (store (arr!33844 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34382 _keys!1070)))))

(declare-fun b!1090040 () Bool)

(declare-fun res!727193 () Bool)

(assert (=> b!1090040 (=> (not res!727193) (not e!622560))))

(assert (=> b!1090040 (= res!727193 (and (= (size!34383 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34382 _keys!1070) (size!34383 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090041 () Bool)

(declare-fun e!622558 () Bool)

(declare-fun tp_is_empty!26749 () Bool)

(assert (=> b!1090041 (= e!622558 tp_is_empty!26749)))

(declare-fun b!1090042 () Bool)

(declare-fun e!622562 () Bool)

(assert (=> b!1090042 (= e!622562 (and e!622558 mapRes!41878))))

(declare-fun condMapEmpty!41878 () Bool)

(declare-fun mapDefault!41878 () ValueCell!12665)

(assert (=> b!1090042 (= condMapEmpty!41878 (= (arr!33845 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12665)) mapDefault!41878)))))

(declare-fun b!1090043 () Bool)

(assert (=> b!1090043 (= e!622563 tp_is_empty!26749)))

(declare-fun b!1090036 () Bool)

(declare-fun res!727192 () Bool)

(assert (=> b!1090036 (=> (not res!727192) (not e!622560))))

(assert (=> b!1090036 (= res!727192 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34382 _keys!1070))))))

(declare-fun res!727191 () Bool)

(assert (=> start!96088 (=> (not res!727191) (not e!622560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96088 (= res!727191 (validMask!0 mask!1414))))

(assert (=> start!96088 e!622560))

(assert (=> start!96088 tp!80089))

(assert (=> start!96088 true))

(assert (=> start!96088 tp_is_empty!26749))

(declare-fun array_inv!26138 (array!70340) Bool)

(assert (=> start!96088 (array_inv!26138 _keys!1070)))

(declare-fun array_inv!26139 (array!70342) Bool)

(assert (=> start!96088 (and (array_inv!26139 _values!874) e!622562)))

(assert (= (and start!96088 res!727191) b!1090040))

(assert (= (and b!1090040 res!727193) b!1090037))

(assert (= (and b!1090037 res!727199) b!1090038))

(assert (= (and b!1090038 res!727200) b!1090036))

(assert (= (and b!1090036 res!727192) b!1090033))

(assert (= (and b!1090033 res!727197) b!1090032))

(assert (= (and b!1090032 res!727190) b!1090039))

(assert (= (and b!1090039 res!727194) b!1090034))

(assert (= (and b!1090034 res!727198) b!1090035))

(assert (= (and b!1090035 (not res!727195)) b!1090030))

(assert (= (and b!1090030 (not res!727196)) b!1090031))

(assert (= (and b!1090042 condMapEmpty!41878) mapIsEmpty!41878))

(assert (= (and b!1090042 (not condMapEmpty!41878)) mapNonEmpty!41878))

(get-info :version)

(assert (= (and mapNonEmpty!41878 ((_ is ValueCellFull!12665) mapValue!41878)) b!1090043))

(assert (= (and b!1090042 ((_ is ValueCellFull!12665) mapDefault!41878)) b!1090041))

(assert (= start!96088 b!1090042))

(declare-fun b_lambda!17395 () Bool)

(assert (=> (not b_lambda!17395) (not b!1090035)))

(declare-fun t!33483 () Bool)

(declare-fun tb!7617 () Bool)

(assert (=> (and start!96088 (= defaultEntry!882 defaultEntry!882) t!33483) tb!7617))

(declare-fun result!15761 () Bool)

(assert (=> tb!7617 (= result!15761 tp_is_empty!26749)))

(assert (=> b!1090035 t!33483))

(declare-fun b_and!36145 () Bool)

(assert (= b_and!36143 (and (=> t!33483 result!15761) b_and!36145)))

(declare-fun m!1008917 () Bool)

(assert (=> b!1090039 m!1008917))

(declare-fun m!1008919 () Bool)

(assert (=> b!1090039 m!1008919))

(declare-fun m!1008921 () Bool)

(assert (=> b!1090032 m!1008921))

(declare-fun m!1008923 () Bool)

(assert (=> b!1090030 m!1008923))

(declare-fun m!1008925 () Bool)

(assert (=> b!1090030 m!1008925))

(declare-fun m!1008927 () Bool)

(assert (=> b!1090030 m!1008927))

(declare-fun m!1008929 () Bool)

(assert (=> b!1090038 m!1008929))

(declare-fun m!1008931 () Bool)

(assert (=> b!1090035 m!1008931))

(declare-fun m!1008933 () Bool)

(assert (=> b!1090035 m!1008933))

(declare-fun m!1008935 () Bool)

(assert (=> b!1090035 m!1008935))

(declare-fun m!1008937 () Bool)

(assert (=> b!1090035 m!1008937))

(declare-fun m!1008939 () Bool)

(assert (=> b!1090035 m!1008939))

(declare-fun m!1008941 () Bool)

(assert (=> b!1090035 m!1008941))

(declare-fun m!1008943 () Bool)

(assert (=> b!1090035 m!1008943))

(declare-fun m!1008945 () Bool)

(assert (=> b!1090035 m!1008945))

(declare-fun m!1008947 () Bool)

(assert (=> b!1090035 m!1008947))

(declare-fun m!1008949 () Bool)

(assert (=> b!1090035 m!1008949))

(declare-fun m!1008951 () Bool)

(assert (=> b!1090033 m!1008951))

(declare-fun m!1008953 () Bool)

(assert (=> start!96088 m!1008953))

(declare-fun m!1008955 () Bool)

(assert (=> start!96088 m!1008955))

(declare-fun m!1008957 () Bool)

(assert (=> start!96088 m!1008957))

(declare-fun m!1008959 () Bool)

(assert (=> b!1090034 m!1008959))

(declare-fun m!1008961 () Bool)

(assert (=> mapNonEmpty!41878 m!1008961))

(declare-fun m!1008963 () Bool)

(assert (=> b!1090037 m!1008963))

(declare-fun m!1008965 () Bool)

(assert (=> b!1090031 m!1008965))

(declare-fun m!1008967 () Bool)

(assert (=> b!1090031 m!1008967))

(check-sat (not b!1090037) (not b_next!22747) (not b!1090038) (not b!1090031) b_and!36145 (not mapNonEmpty!41878) tp_is_empty!26749 (not start!96088) (not b!1090039) (not b_lambda!17395) (not b!1090033) (not b!1090030) (not b!1090035) (not b!1090034))
(check-sat b_and!36145 (not b_next!22747))
