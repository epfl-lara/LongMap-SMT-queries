; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96010 () Bool)

(assert start!96010)

(declare-fun b_free!22669 () Bool)

(declare-fun b_next!22669 () Bool)

(assert (=> start!96010 (= b_free!22669 (not b_next!22669))))

(declare-fun tp!79856 () Bool)

(declare-fun b_and!35987 () Bool)

(assert (=> start!96010 (= tp!79856 b_and!35987)))

(declare-fun b!1088306 () Bool)

(declare-fun res!725895 () Bool)

(declare-fun e!621624 () Bool)

(assert (=> b!1088306 (=> (not res!725895) (not e!621624))))

(declare-datatypes ((array!70192 0))(
  ( (array!70193 (arr!33770 (Array (_ BitVec 32) (_ BitVec 64))) (size!34308 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70192)

(declare-datatypes ((List!23629 0))(
  ( (Nil!23626) (Cons!23625 (h!24834 (_ BitVec 64)) (t!33347 List!23629)) )
))
(declare-fun arrayNoDuplicates!0 (array!70192 (_ BitVec 32) List!23629) Bool)

(assert (=> b!1088306 (= res!725895 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23626))))

(declare-fun b!1088307 () Bool)

(declare-fun res!725900 () Bool)

(assert (=> b!1088307 (=> (not res!725900) (not e!621624))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088307 (= res!725900 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34308 _keys!1070))))))

(declare-fun b!1088308 () Bool)

(declare-fun e!621627 () Bool)

(declare-fun tp_is_empty!26671 () Bool)

(assert (=> b!1088308 (= e!621627 tp_is_empty!26671)))

(declare-fun b!1088309 () Bool)

(declare-fun res!725901 () Bool)

(assert (=> b!1088309 (=> (not res!725901) (not e!621624))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40689 0))(
  ( (V!40690 (val!13392 Int)) )
))
(declare-datatypes ((ValueCell!12626 0))(
  ( (ValueCellFull!12626 (v!16012 V!40689)) (EmptyCell!12626) )
))
(declare-datatypes ((array!70194 0))(
  ( (array!70195 (arr!33771 (Array (_ BitVec 32) ValueCell!12626)) (size!34309 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70194)

(assert (=> b!1088309 (= res!725901 (and (= (size!34309 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34308 _keys!1070) (size!34309 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088310 () Bool)

(declare-fun e!621629 () Bool)

(assert (=> b!1088310 (= e!621629 (bvsle #b00000000000000000000000000000000 (size!34308 _keys!1070)))))

(declare-datatypes ((tuple2!17062 0))(
  ( (tuple2!17063 (_1!8542 (_ BitVec 64)) (_2!8542 V!40689)) )
))
(declare-datatypes ((List!23630 0))(
  ( (Nil!23627) (Cons!23626 (h!24835 tuple2!17062) (t!33348 List!23630)) )
))
(declare-datatypes ((ListLongMap!15031 0))(
  ( (ListLongMap!15032 (toList!7531 List!23630)) )
))
(declare-fun lt!484613 () ListLongMap!15031)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!484625 () ListLongMap!15031)

(declare-fun -!809 (ListLongMap!15031 (_ BitVec 64)) ListLongMap!15031)

(assert (=> b!1088310 (= (-!809 lt!484613 k0!904) lt!484625)))

(declare-fun lt!484616 () ListLongMap!15031)

(declare-datatypes ((Unit!35653 0))(
  ( (Unit!35654) )
))
(declare-fun lt!484624 () Unit!35653)

(declare-fun zeroValue!831 () V!40689)

(declare-fun addRemoveCommutativeForDiffKeys!60 (ListLongMap!15031 (_ BitVec 64) V!40689 (_ BitVec 64)) Unit!35653)

(assert (=> b!1088310 (= lt!484624 (addRemoveCommutativeForDiffKeys!60 lt!484616 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088311 () Bool)

(declare-fun e!621628 () Bool)

(declare-fun e!621625 () Bool)

(declare-fun mapRes!41761 () Bool)

(assert (=> b!1088311 (= e!621628 (and e!621625 mapRes!41761))))

(declare-fun condMapEmpty!41761 () Bool)

(declare-fun mapDefault!41761 () ValueCell!12626)

(assert (=> b!1088311 (= condMapEmpty!41761 (= (arr!33771 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12626)) mapDefault!41761)))))

(declare-fun mapIsEmpty!41761 () Bool)

(assert (=> mapIsEmpty!41761 mapRes!41761))

(declare-fun b!1088305 () Bool)

(declare-fun res!725904 () Bool)

(assert (=> b!1088305 (=> (not res!725904) (not e!621624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088305 (= res!725904 (validKeyInArray!0 k0!904))))

(declare-fun res!725894 () Bool)

(assert (=> start!96010 (=> (not res!725894) (not e!621624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96010 (= res!725894 (validMask!0 mask!1414))))

(assert (=> start!96010 e!621624))

(assert (=> start!96010 tp!79856))

(assert (=> start!96010 true))

(assert (=> start!96010 tp_is_empty!26671))

(declare-fun array_inv!26094 (array!70192) Bool)

(assert (=> start!96010 (array_inv!26094 _keys!1070)))

(declare-fun array_inv!26095 (array!70194) Bool)

(assert (=> start!96010 (and (array_inv!26095 _values!874) e!621628)))

(declare-fun b!1088312 () Bool)

(declare-fun e!621626 () Bool)

(assert (=> b!1088312 (= e!621624 e!621626)))

(declare-fun res!725896 () Bool)

(assert (=> b!1088312 (=> (not res!725896) (not e!621626))))

(declare-fun lt!484615 () array!70192)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70192 (_ BitVec 32)) Bool)

(assert (=> b!1088312 (= res!725896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484615 mask!1414))))

(assert (=> b!1088312 (= lt!484615 (array!70193 (store (arr!33770 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34308 _keys!1070)))))

(declare-fun mapNonEmpty!41761 () Bool)

(declare-fun tp!79855 () Bool)

(assert (=> mapNonEmpty!41761 (= mapRes!41761 (and tp!79855 e!621627))))

(declare-fun mapRest!41761 () (Array (_ BitVec 32) ValueCell!12626))

(declare-fun mapValue!41761 () ValueCell!12626)

(declare-fun mapKey!41761 () (_ BitVec 32))

(assert (=> mapNonEmpty!41761 (= (arr!33771 _values!874) (store mapRest!41761 mapKey!41761 mapValue!41761))))

(declare-fun b!1088313 () Bool)

(declare-fun res!725902 () Bool)

(assert (=> b!1088313 (=> (not res!725902) (not e!621626))))

(assert (=> b!1088313 (= res!725902 (arrayNoDuplicates!0 lt!484615 #b00000000000000000000000000000000 Nil!23626))))

(declare-fun b!1088314 () Bool)

(declare-fun e!621622 () Bool)

(assert (=> b!1088314 (= e!621622 e!621629)))

(declare-fun res!725898 () Bool)

(assert (=> b!1088314 (=> res!725898 e!621629)))

(assert (=> b!1088314 (= res!725898 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484614 () ListLongMap!15031)

(assert (=> b!1088314 (= lt!484614 lt!484625)))

(declare-fun lt!484622 () ListLongMap!15031)

(declare-fun lt!484620 () tuple2!17062)

(declare-fun +!3332 (ListLongMap!15031 tuple2!17062) ListLongMap!15031)

(assert (=> b!1088314 (= lt!484625 (+!3332 lt!484622 lt!484620))))

(declare-fun lt!484621 () ListLongMap!15031)

(assert (=> b!1088314 (= lt!484621 lt!484613)))

(assert (=> b!1088314 (= lt!484613 (+!3332 lt!484616 lt!484620))))

(declare-fun lt!484618 () ListLongMap!15031)

(assert (=> b!1088314 (= lt!484614 (+!3332 lt!484618 lt!484620))))

(assert (=> b!1088314 (= lt!484620 (tuple2!17063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088315 () Bool)

(assert (=> b!1088315 (= e!621625 tp_is_empty!26671)))

(declare-fun b!1088316 () Bool)

(declare-fun res!725897 () Bool)

(assert (=> b!1088316 (=> (not res!725897) (not e!621624))))

(assert (=> b!1088316 (= res!725897 (= (select (arr!33770 _keys!1070) i!650) k0!904))))

(declare-fun b!1088317 () Bool)

(assert (=> b!1088317 (= e!621626 (not e!621622))))

(declare-fun res!725903 () Bool)

(assert (=> b!1088317 (=> res!725903 e!621622)))

(assert (=> b!1088317 (= res!725903 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40689)

(declare-fun getCurrentListMap!4212 (array!70192 array!70194 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) Int) ListLongMap!15031)

(assert (=> b!1088317 (= lt!484621 (getCurrentListMap!4212 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484617 () array!70194)

(assert (=> b!1088317 (= lt!484614 (getCurrentListMap!4212 lt!484615 lt!484617 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088317 (and (= lt!484618 lt!484622) (= lt!484622 lt!484618))))

(assert (=> b!1088317 (= lt!484622 (-!809 lt!484616 k0!904))))

(declare-fun lt!484623 () Unit!35653)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!96 (array!70192 array!70194 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35653)

(assert (=> b!1088317 (= lt!484623 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!96 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4082 (array!70192 array!70194 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) Int) ListLongMap!15031)

(assert (=> b!1088317 (= lt!484618 (getCurrentListMapNoExtraKeys!4082 lt!484615 lt!484617 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2153 (Int (_ BitVec 64)) V!40689)

(assert (=> b!1088317 (= lt!484617 (array!70195 (store (arr!33771 _values!874) i!650 (ValueCellFull!12626 (dynLambda!2153 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34309 _values!874)))))

(assert (=> b!1088317 (= lt!484616 (getCurrentListMapNoExtraKeys!4082 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088317 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484619 () Unit!35653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70192 (_ BitVec 64) (_ BitVec 32)) Unit!35653)

(assert (=> b!1088317 (= lt!484619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088318 () Bool)

(declare-fun res!725899 () Bool)

(assert (=> b!1088318 (=> (not res!725899) (not e!621624))))

(assert (=> b!1088318 (= res!725899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96010 res!725894) b!1088309))

(assert (= (and b!1088309 res!725901) b!1088318))

(assert (= (and b!1088318 res!725899) b!1088306))

(assert (= (and b!1088306 res!725895) b!1088307))

(assert (= (and b!1088307 res!725900) b!1088305))

(assert (= (and b!1088305 res!725904) b!1088316))

(assert (= (and b!1088316 res!725897) b!1088312))

(assert (= (and b!1088312 res!725896) b!1088313))

(assert (= (and b!1088313 res!725902) b!1088317))

(assert (= (and b!1088317 (not res!725903)) b!1088314))

(assert (= (and b!1088314 (not res!725898)) b!1088310))

(assert (= (and b!1088311 condMapEmpty!41761) mapIsEmpty!41761))

(assert (= (and b!1088311 (not condMapEmpty!41761)) mapNonEmpty!41761))

(get-info :version)

(assert (= (and mapNonEmpty!41761 ((_ is ValueCellFull!12626) mapValue!41761)) b!1088308))

(assert (= (and b!1088311 ((_ is ValueCellFull!12626) mapDefault!41761)) b!1088315))

(assert (= start!96010 b!1088311))

(declare-fun b_lambda!17317 () Bool)

(assert (=> (not b_lambda!17317) (not b!1088317)))

(declare-fun t!33346 () Bool)

(declare-fun tb!7539 () Bool)

(assert (=> (and start!96010 (= defaultEntry!882 defaultEntry!882) t!33346) tb!7539))

(declare-fun result!15605 () Bool)

(assert (=> tb!7539 (= result!15605 tp_is_empty!26671)))

(assert (=> b!1088317 t!33346))

(declare-fun b_and!35989 () Bool)

(assert (= b_and!35987 (and (=> t!33346 result!15605) b_and!35989)))

(declare-fun m!1006901 () Bool)

(assert (=> b!1088306 m!1006901))

(declare-fun m!1006903 () Bool)

(assert (=> b!1088314 m!1006903))

(declare-fun m!1006905 () Bool)

(assert (=> b!1088314 m!1006905))

(declare-fun m!1006907 () Bool)

(assert (=> b!1088314 m!1006907))

(declare-fun m!1006909 () Bool)

(assert (=> b!1088316 m!1006909))

(declare-fun m!1006911 () Bool)

(assert (=> mapNonEmpty!41761 m!1006911))

(declare-fun m!1006913 () Bool)

(assert (=> b!1088310 m!1006913))

(declare-fun m!1006915 () Bool)

(assert (=> b!1088310 m!1006915))

(declare-fun m!1006917 () Bool)

(assert (=> start!96010 m!1006917))

(declare-fun m!1006919 () Bool)

(assert (=> start!96010 m!1006919))

(declare-fun m!1006921 () Bool)

(assert (=> start!96010 m!1006921))

(declare-fun m!1006923 () Bool)

(assert (=> b!1088312 m!1006923))

(declare-fun m!1006925 () Bool)

(assert (=> b!1088312 m!1006925))

(declare-fun m!1006927 () Bool)

(assert (=> b!1088305 m!1006927))

(declare-fun m!1006929 () Bool)

(assert (=> b!1088313 m!1006929))

(declare-fun m!1006931 () Bool)

(assert (=> b!1088317 m!1006931))

(declare-fun m!1006933 () Bool)

(assert (=> b!1088317 m!1006933))

(declare-fun m!1006935 () Bool)

(assert (=> b!1088317 m!1006935))

(declare-fun m!1006937 () Bool)

(assert (=> b!1088317 m!1006937))

(declare-fun m!1006939 () Bool)

(assert (=> b!1088317 m!1006939))

(declare-fun m!1006941 () Bool)

(assert (=> b!1088317 m!1006941))

(declare-fun m!1006943 () Bool)

(assert (=> b!1088317 m!1006943))

(declare-fun m!1006945 () Bool)

(assert (=> b!1088317 m!1006945))

(declare-fun m!1006947 () Bool)

(assert (=> b!1088317 m!1006947))

(declare-fun m!1006949 () Bool)

(assert (=> b!1088317 m!1006949))

(declare-fun m!1006951 () Bool)

(assert (=> b!1088318 m!1006951))

(check-sat (not b_next!22669) b_and!35989 (not b!1088305) (not start!96010) (not b!1088313) tp_is_empty!26671 (not b!1088312) (not b!1088314) (not b_lambda!17317) (not b!1088310) (not b!1088318) (not mapNonEmpty!41761) (not b!1088306) (not b!1088317))
(check-sat b_and!35989 (not b_next!22669))
