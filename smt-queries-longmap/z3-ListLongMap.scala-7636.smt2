; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96130 () Bool)

(assert start!96130)

(declare-fun b_free!22789 () Bool)

(declare-fun b_next!22789 () Bool)

(assert (=> start!96130 (= b_free!22789 (not b_next!22789))))

(declare-fun tp!80215 () Bool)

(declare-fun b_and!36227 () Bool)

(assert (=> start!96130 (= tp!80215 b_and!36227)))

(declare-fun b!1090954 () Bool)

(declare-fun res!727883 () Bool)

(declare-fun e!623066 () Bool)

(assert (=> b!1090954 (=> (not res!727883) (not e!623066))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090954 (= res!727883 (validKeyInArray!0 k0!904))))

(declare-fun b!1090955 () Bool)

(declare-fun e!623065 () Bool)

(declare-fun tp_is_empty!26791 () Bool)

(assert (=> b!1090955 (= e!623065 tp_is_empty!26791)))

(declare-fun mapIsEmpty!41941 () Bool)

(declare-fun mapRes!41941 () Bool)

(assert (=> mapIsEmpty!41941 mapRes!41941))

(declare-fun b!1090956 () Bool)

(declare-fun res!727891 () Bool)

(assert (=> b!1090956 (=> (not res!727891) (not e!623066))))

(declare-datatypes ((array!70422 0))(
  ( (array!70423 (arr!33885 (Array (_ BitVec 32) (_ BitVec 64))) (size!34423 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70422)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090956 (= res!727891 (= (select (arr!33885 _keys!1070) i!650) k0!904))))

(declare-fun b!1090957 () Bool)

(declare-fun res!727886 () Bool)

(assert (=> b!1090957 (=> (not res!727886) (not e!623066))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40849 0))(
  ( (V!40850 (val!13452 Int)) )
))
(declare-datatypes ((ValueCell!12686 0))(
  ( (ValueCellFull!12686 (v!16072 V!40849)) (EmptyCell!12686) )
))
(declare-datatypes ((array!70424 0))(
  ( (array!70425 (arr!33886 (Array (_ BitVec 32) ValueCell!12686)) (size!34424 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70424)

(assert (=> b!1090957 (= res!727886 (and (= (size!34424 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34423 _keys!1070) (size!34424 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090958 () Bool)

(declare-fun e!623064 () Bool)

(declare-fun e!623068 () Bool)

(assert (=> b!1090958 (= e!623064 (not e!623068))))

(declare-fun res!727892 () Bool)

(assert (=> b!1090958 (=> res!727892 e!623068)))

(assert (=> b!1090958 (= res!727892 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40849)

(declare-fun zeroValue!831 () V!40849)

(declare-datatypes ((tuple2!17158 0))(
  ( (tuple2!17159 (_1!8590 (_ BitVec 64)) (_2!8590 V!40849)) )
))
(declare-datatypes ((List!23724 0))(
  ( (Nil!23721) (Cons!23720 (h!24929 tuple2!17158) (t!33562 List!23724)) )
))
(declare-datatypes ((ListLongMap!15127 0))(
  ( (ListLongMap!15128 (toList!7579 List!23724)) )
))
(declare-fun lt!486930 () ListLongMap!15127)

(declare-fun getCurrentListMap!4249 (array!70422 array!70424 (_ BitVec 32) (_ BitVec 32) V!40849 V!40849 (_ BitVec 32) Int) ListLongMap!15127)

(assert (=> b!1090958 (= lt!486930 (getCurrentListMap!4249 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486933 () array!70424)

(declare-fun lt!486936 () ListLongMap!15127)

(declare-fun lt!486928 () array!70422)

(assert (=> b!1090958 (= lt!486936 (getCurrentListMap!4249 lt!486928 lt!486933 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486937 () ListLongMap!15127)

(declare-fun lt!486927 () ListLongMap!15127)

(assert (=> b!1090958 (and (= lt!486937 lt!486927) (= lt!486927 lt!486937))))

(declare-fun lt!486929 () ListLongMap!15127)

(declare-fun -!853 (ListLongMap!15127 (_ BitVec 64)) ListLongMap!15127)

(assert (=> b!1090958 (= lt!486927 (-!853 lt!486929 k0!904))))

(declare-datatypes ((Unit!35741 0))(
  ( (Unit!35742) )
))
(declare-fun lt!486931 () Unit!35741)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!133 (array!70422 array!70424 (_ BitVec 32) (_ BitVec 32) V!40849 V!40849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35741)

(assert (=> b!1090958 (= lt!486931 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!133 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4119 (array!70422 array!70424 (_ BitVec 32) (_ BitVec 32) V!40849 V!40849 (_ BitVec 32) Int) ListLongMap!15127)

(assert (=> b!1090958 (= lt!486937 (getCurrentListMapNoExtraKeys!4119 lt!486928 lt!486933 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2190 (Int (_ BitVec 64)) V!40849)

(assert (=> b!1090958 (= lt!486933 (array!70425 (store (arr!33886 _values!874) i!650 (ValueCellFull!12686 (dynLambda!2190 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34424 _values!874)))))

(assert (=> b!1090958 (= lt!486929 (getCurrentListMapNoExtraKeys!4119 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090958 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486938 () Unit!35741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70422 (_ BitVec 64) (_ BitVec 32)) Unit!35741)

(assert (=> b!1090958 (= lt!486938 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090959 () Bool)

(declare-fun res!727890 () Bool)

(assert (=> b!1090959 (=> (not res!727890) (not e!623064))))

(declare-datatypes ((List!23725 0))(
  ( (Nil!23722) (Cons!23721 (h!24930 (_ BitVec 64)) (t!33563 List!23725)) )
))
(declare-fun arrayNoDuplicates!0 (array!70422 (_ BitVec 32) List!23725) Bool)

(assert (=> b!1090959 (= res!727890 (arrayNoDuplicates!0 lt!486928 #b00000000000000000000000000000000 Nil!23722))))

(declare-fun res!727888 () Bool)

(assert (=> start!96130 (=> (not res!727888) (not e!623066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96130 (= res!727888 (validMask!0 mask!1414))))

(assert (=> start!96130 e!623066))

(assert (=> start!96130 tp!80215))

(assert (=> start!96130 true))

(assert (=> start!96130 tp_is_empty!26791))

(declare-fun array_inv!26166 (array!70422) Bool)

(assert (=> start!96130 (array_inv!26166 _keys!1070)))

(declare-fun e!623063 () Bool)

(declare-fun array_inv!26167 (array!70424) Bool)

(assert (=> start!96130 (and (array_inv!26167 _values!874) e!623063)))

(declare-fun b!1090960 () Bool)

(declare-fun e!623069 () Bool)

(assert (=> b!1090960 (= e!623069 tp_is_empty!26791)))

(declare-fun b!1090961 () Bool)

(declare-fun e!623067 () Bool)

(assert (=> b!1090961 (= e!623068 e!623067)))

(declare-fun res!727889 () Bool)

(assert (=> b!1090961 (=> res!727889 e!623067)))

(assert (=> b!1090961 (= res!727889 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486932 () ListLongMap!15127)

(assert (=> b!1090961 (= lt!486930 lt!486932)))

(declare-fun lt!486935 () tuple2!17158)

(declare-fun +!3369 (ListLongMap!15127 tuple2!17158) ListLongMap!15127)

(assert (=> b!1090961 (= lt!486932 (+!3369 lt!486929 lt!486935))))

(declare-fun lt!486934 () ListLongMap!15127)

(assert (=> b!1090961 (= lt!486936 lt!486934)))

(assert (=> b!1090961 (= lt!486934 (+!3369 lt!486927 lt!486935))))

(assert (=> b!1090961 (= lt!486936 (+!3369 lt!486937 lt!486935))))

(assert (=> b!1090961 (= lt!486935 (tuple2!17159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090962 () Bool)

(declare-fun res!727885 () Bool)

(assert (=> b!1090962 (=> (not res!727885) (not e!623066))))

(assert (=> b!1090962 (= res!727885 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23722))))

(declare-fun b!1090963 () Bool)

(declare-fun res!727887 () Bool)

(assert (=> b!1090963 (=> (not res!727887) (not e!623066))))

(assert (=> b!1090963 (= res!727887 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34423 _keys!1070))))))

(declare-fun b!1090964 () Bool)

(assert (=> b!1090964 (= e!623066 e!623064)))

(declare-fun res!727893 () Bool)

(assert (=> b!1090964 (=> (not res!727893) (not e!623064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70422 (_ BitVec 32)) Bool)

(assert (=> b!1090964 (= res!727893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486928 mask!1414))))

(assert (=> b!1090964 (= lt!486928 (array!70423 (store (arr!33885 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34423 _keys!1070)))))

(declare-fun b!1090965 () Bool)

(assert (=> b!1090965 (= e!623063 (and e!623069 mapRes!41941))))

(declare-fun condMapEmpty!41941 () Bool)

(declare-fun mapDefault!41941 () ValueCell!12686)

(assert (=> b!1090965 (= condMapEmpty!41941 (= (arr!33886 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12686)) mapDefault!41941)))))

(declare-fun b!1090966 () Bool)

(declare-fun res!727884 () Bool)

(assert (=> b!1090966 (=> (not res!727884) (not e!623066))))

(assert (=> b!1090966 (= res!727884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090967 () Bool)

(assert (=> b!1090967 (= e!623067 true)))

(assert (=> b!1090967 (= (-!853 lt!486932 k0!904) lt!486934)))

(declare-fun lt!486926 () Unit!35741)

(declare-fun addRemoveCommutativeForDiffKeys!97 (ListLongMap!15127 (_ BitVec 64) V!40849 (_ BitVec 64)) Unit!35741)

(assert (=> b!1090967 (= lt!486926 (addRemoveCommutativeForDiffKeys!97 lt!486929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!41941 () Bool)

(declare-fun tp!80216 () Bool)

(assert (=> mapNonEmpty!41941 (= mapRes!41941 (and tp!80216 e!623065))))

(declare-fun mapRest!41941 () (Array (_ BitVec 32) ValueCell!12686))

(declare-fun mapValue!41941 () ValueCell!12686)

(declare-fun mapKey!41941 () (_ BitVec 32))

(assert (=> mapNonEmpty!41941 (= (arr!33886 _values!874) (store mapRest!41941 mapKey!41941 mapValue!41941))))

(assert (= (and start!96130 res!727888) b!1090957))

(assert (= (and b!1090957 res!727886) b!1090966))

(assert (= (and b!1090966 res!727884) b!1090962))

(assert (= (and b!1090962 res!727885) b!1090963))

(assert (= (and b!1090963 res!727887) b!1090954))

(assert (= (and b!1090954 res!727883) b!1090956))

(assert (= (and b!1090956 res!727891) b!1090964))

(assert (= (and b!1090964 res!727893) b!1090959))

(assert (= (and b!1090959 res!727890) b!1090958))

(assert (= (and b!1090958 (not res!727892)) b!1090961))

(assert (= (and b!1090961 (not res!727889)) b!1090967))

(assert (= (and b!1090965 condMapEmpty!41941) mapIsEmpty!41941))

(assert (= (and b!1090965 (not condMapEmpty!41941)) mapNonEmpty!41941))

(get-info :version)

(assert (= (and mapNonEmpty!41941 ((_ is ValueCellFull!12686) mapValue!41941)) b!1090955))

(assert (= (and b!1090965 ((_ is ValueCellFull!12686) mapDefault!41941)) b!1090960))

(assert (= start!96130 b!1090965))

(declare-fun b_lambda!17437 () Bool)

(assert (=> (not b_lambda!17437) (not b!1090958)))

(declare-fun t!33561 () Bool)

(declare-fun tb!7659 () Bool)

(assert (=> (and start!96130 (= defaultEntry!882 defaultEntry!882) t!33561) tb!7659))

(declare-fun result!15845 () Bool)

(assert (=> tb!7659 (= result!15845 tp_is_empty!26791)))

(assert (=> b!1090958 t!33561))

(declare-fun b_and!36229 () Bool)

(assert (= b_and!36227 (and (=> t!33561 result!15845) b_and!36229)))

(declare-fun m!1010009 () Bool)

(assert (=> b!1090966 m!1010009))

(declare-fun m!1010011 () Bool)

(assert (=> b!1090962 m!1010011))

(declare-fun m!1010013 () Bool)

(assert (=> b!1090959 m!1010013))

(declare-fun m!1010015 () Bool)

(assert (=> b!1090961 m!1010015))

(declare-fun m!1010017 () Bool)

(assert (=> b!1090961 m!1010017))

(declare-fun m!1010019 () Bool)

(assert (=> b!1090961 m!1010019))

(declare-fun m!1010021 () Bool)

(assert (=> mapNonEmpty!41941 m!1010021))

(declare-fun m!1010023 () Bool)

(assert (=> b!1090967 m!1010023))

(declare-fun m!1010025 () Bool)

(assert (=> b!1090967 m!1010025))

(declare-fun m!1010027 () Bool)

(assert (=> b!1090956 m!1010027))

(declare-fun m!1010029 () Bool)

(assert (=> b!1090964 m!1010029))

(declare-fun m!1010031 () Bool)

(assert (=> b!1090964 m!1010031))

(declare-fun m!1010033 () Bool)

(assert (=> b!1090958 m!1010033))

(declare-fun m!1010035 () Bool)

(assert (=> b!1090958 m!1010035))

(declare-fun m!1010037 () Bool)

(assert (=> b!1090958 m!1010037))

(declare-fun m!1010039 () Bool)

(assert (=> b!1090958 m!1010039))

(declare-fun m!1010041 () Bool)

(assert (=> b!1090958 m!1010041))

(declare-fun m!1010043 () Bool)

(assert (=> b!1090958 m!1010043))

(declare-fun m!1010045 () Bool)

(assert (=> b!1090958 m!1010045))

(declare-fun m!1010047 () Bool)

(assert (=> b!1090958 m!1010047))

(declare-fun m!1010049 () Bool)

(assert (=> b!1090958 m!1010049))

(declare-fun m!1010051 () Bool)

(assert (=> b!1090958 m!1010051))

(declare-fun m!1010053 () Bool)

(assert (=> b!1090954 m!1010053))

(declare-fun m!1010055 () Bool)

(assert (=> start!96130 m!1010055))

(declare-fun m!1010057 () Bool)

(assert (=> start!96130 m!1010057))

(declare-fun m!1010059 () Bool)

(assert (=> start!96130 m!1010059))

(check-sat (not b!1090962) (not b!1090966) (not b!1090967) (not mapNonEmpty!41941) (not start!96130) tp_is_empty!26791 (not b!1090961) (not b!1090958) (not b!1090954) (not b!1090959) (not b!1090964) (not b_lambda!17437) (not b_next!22789) b_and!36229)
(check-sat b_and!36229 (not b_next!22789))
