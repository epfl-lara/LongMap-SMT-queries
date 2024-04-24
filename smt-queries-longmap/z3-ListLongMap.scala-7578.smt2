; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96024 () Bool)

(assert start!96024)

(declare-fun b_free!22441 () Bool)

(declare-fun b_next!22441 () Bool)

(assert (=> start!96024 (= b_free!22441 (not b_next!22441))))

(declare-fun tp!79172 () Bool)

(declare-fun b_and!35567 () Bool)

(assert (=> start!96024 (= tp!79172 b_and!35567)))

(declare-fun mapIsEmpty!41419 () Bool)

(declare-fun mapRes!41419 () Bool)

(assert (=> mapIsEmpty!41419 mapRes!41419))

(declare-fun res!722872 () Bool)

(declare-fun e!620001 () Bool)

(assert (=> start!96024 (=> (not res!722872) (not e!620001))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96024 (= res!722872 (validMask!0 mask!1414))))

(assert (=> start!96024 e!620001))

(assert (=> start!96024 tp!79172))

(assert (=> start!96024 true))

(declare-fun tp_is_empty!26443 () Bool)

(assert (=> start!96024 tp_is_empty!26443))

(declare-datatypes ((array!69863 0))(
  ( (array!69864 (arr!33599 (Array (_ BitVec 32) (_ BitVec 64))) (size!34136 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69863)

(declare-fun array_inv!25978 (array!69863) Bool)

(assert (=> start!96024 (array_inv!25978 _keys!1070)))

(declare-datatypes ((V!40385 0))(
  ( (V!40386 (val!13278 Int)) )
))
(declare-datatypes ((ValueCell!12512 0))(
  ( (ValueCellFull!12512 (v!15895 V!40385)) (EmptyCell!12512) )
))
(declare-datatypes ((array!69865 0))(
  ( (array!69866 (arr!33600 (Array (_ BitVec 32) ValueCell!12512)) (size!34137 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69865)

(declare-fun e!620004 () Bool)

(declare-fun array_inv!25979 (array!69865) Bool)

(assert (=> start!96024 (and (array_inv!25979 _values!874) e!620004)))

(declare-fun mapNonEmpty!41419 () Bool)

(declare-fun tp!79171 () Bool)

(declare-fun e!620006 () Bool)

(assert (=> mapNonEmpty!41419 (= mapRes!41419 (and tp!79171 e!620006))))

(declare-fun mapRest!41419 () (Array (_ BitVec 32) ValueCell!12512))

(declare-fun mapValue!41419 () ValueCell!12512)

(declare-fun mapKey!41419 () (_ BitVec 32))

(assert (=> mapNonEmpty!41419 (= (arr!33600 _values!874) (store mapRest!41419 mapKey!41419 mapValue!41419))))

(declare-fun b!1084918 () Bool)

(declare-fun res!722879 () Bool)

(declare-fun e!620005 () Bool)

(assert (=> b!1084918 (=> (not res!722879) (not e!620005))))

(declare-fun lt!480672 () array!69863)

(declare-datatypes ((List!23426 0))(
  ( (Nil!23423) (Cons!23422 (h!24640 (_ BitVec 64)) (t!32917 List!23426)) )
))
(declare-fun arrayNoDuplicates!0 (array!69863 (_ BitVec 32) List!23426) Bool)

(assert (=> b!1084918 (= res!722879 (arrayNoDuplicates!0 lt!480672 #b00000000000000000000000000000000 Nil!23423))))

(declare-fun b!1084919 () Bool)

(declare-fun res!722873 () Bool)

(assert (=> b!1084919 (=> (not res!722873) (not e!620001))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084919 (= res!722873 (and (= (size!34137 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34136 _keys!1070) (size!34137 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084920 () Bool)

(declare-fun res!722877 () Bool)

(assert (=> b!1084920 (=> (not res!722877) (not e!620001))))

(assert (=> b!1084920 (= res!722877 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23423))))

(declare-fun b!1084921 () Bool)

(declare-fun e!620002 () Bool)

(assert (=> b!1084921 (= e!620004 (and e!620002 mapRes!41419))))

(declare-fun condMapEmpty!41419 () Bool)

(declare-fun mapDefault!41419 () ValueCell!12512)

(assert (=> b!1084921 (= condMapEmpty!41419 (= (arr!33600 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12512)) mapDefault!41419)))))

(declare-fun b!1084922 () Bool)

(assert (=> b!1084922 (= e!620002 tp_is_empty!26443)))

(declare-fun b!1084923 () Bool)

(declare-fun res!722874 () Bool)

(assert (=> b!1084923 (=> (not res!722874) (not e!620001))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084923 (= res!722874 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34136 _keys!1070))))))

(declare-fun b!1084924 () Bool)

(assert (=> b!1084924 (= e!620006 tp_is_empty!26443)))

(declare-fun b!1084925 () Bool)

(declare-fun res!722880 () Bool)

(assert (=> b!1084925 (=> (not res!722880) (not e!620001))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084925 (= res!722880 (= (select (arr!33599 _keys!1070) i!650) k0!904))))

(declare-fun b!1084926 () Bool)

(assert (=> b!1084926 (= e!620005 (not true))))

(declare-fun lt!480670 () array!69865)

(declare-fun minValue!831 () V!40385)

(declare-fun zeroValue!831 () V!40385)

(declare-datatypes ((tuple2!16830 0))(
  ( (tuple2!16831 (_1!8426 (_ BitVec 64)) (_2!8426 V!40385)) )
))
(declare-datatypes ((List!23427 0))(
  ( (Nil!23424) (Cons!23423 (h!24641 tuple2!16830) (t!32918 List!23427)) )
))
(declare-datatypes ((ListLongMap!14807 0))(
  ( (ListLongMap!14808 (toList!7419 List!23427)) )
))
(declare-fun lt!480666 () ListLongMap!14807)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4191 (array!69863 array!69865 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) Int) ListLongMap!14807)

(assert (=> b!1084926 (= lt!480666 (getCurrentListMap!4191 lt!480672 lt!480670 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480667 () ListLongMap!14807)

(declare-fun lt!480665 () ListLongMap!14807)

(assert (=> b!1084926 (and (= lt!480667 lt!480665) (= lt!480665 lt!480667))))

(declare-fun lt!480668 () ListLongMap!14807)

(declare-fun -!731 (ListLongMap!14807 (_ BitVec 64)) ListLongMap!14807)

(assert (=> b!1084926 (= lt!480665 (-!731 lt!480668 k0!904))))

(declare-datatypes ((Unit!35629 0))(
  ( (Unit!35630) )
))
(declare-fun lt!480669 () Unit!35629)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!20 (array!69863 array!69865 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35629)

(assert (=> b!1084926 (= lt!480669 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!20 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3996 (array!69863 array!69865 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) Int) ListLongMap!14807)

(assert (=> b!1084926 (= lt!480667 (getCurrentListMapNoExtraKeys!3996 lt!480672 lt!480670 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2117 (Int (_ BitVec 64)) V!40385)

(assert (=> b!1084926 (= lt!480670 (array!69866 (store (arr!33600 _values!874) i!650 (ValueCellFull!12512 (dynLambda!2117 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34137 _values!874)))))

(assert (=> b!1084926 (= lt!480668 (getCurrentListMapNoExtraKeys!3996 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084926 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480671 () Unit!35629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69863 (_ BitVec 64) (_ BitVec 32)) Unit!35629)

(assert (=> b!1084926 (= lt!480671 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084927 () Bool)

(declare-fun res!722875 () Bool)

(assert (=> b!1084927 (=> (not res!722875) (not e!620001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69863 (_ BitVec 32)) Bool)

(assert (=> b!1084927 (= res!722875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084928 () Bool)

(assert (=> b!1084928 (= e!620001 e!620005)))

(declare-fun res!722876 () Bool)

(assert (=> b!1084928 (=> (not res!722876) (not e!620005))))

(assert (=> b!1084928 (= res!722876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480672 mask!1414))))

(assert (=> b!1084928 (= lt!480672 (array!69864 (store (arr!33599 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34136 _keys!1070)))))

(declare-fun b!1084929 () Bool)

(declare-fun res!722878 () Bool)

(assert (=> b!1084929 (=> (not res!722878) (not e!620001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084929 (= res!722878 (validKeyInArray!0 k0!904))))

(assert (= (and start!96024 res!722872) b!1084919))

(assert (= (and b!1084919 res!722873) b!1084927))

(assert (= (and b!1084927 res!722875) b!1084920))

(assert (= (and b!1084920 res!722877) b!1084923))

(assert (= (and b!1084923 res!722874) b!1084929))

(assert (= (and b!1084929 res!722878) b!1084925))

(assert (= (and b!1084925 res!722880) b!1084928))

(assert (= (and b!1084928 res!722876) b!1084918))

(assert (= (and b!1084918 res!722879) b!1084926))

(assert (= (and b!1084921 condMapEmpty!41419) mapIsEmpty!41419))

(assert (= (and b!1084921 (not condMapEmpty!41419)) mapNonEmpty!41419))

(get-info :version)

(assert (= (and mapNonEmpty!41419 ((_ is ValueCellFull!12512) mapValue!41419)) b!1084924))

(assert (= (and b!1084921 ((_ is ValueCellFull!12512) mapDefault!41419)) b!1084922))

(assert (= start!96024 b!1084921))

(declare-fun b_lambda!17121 () Bool)

(assert (=> (not b_lambda!17121) (not b!1084926)))

(declare-fun t!32916 () Bool)

(declare-fun tb!7311 () Bool)

(assert (=> (and start!96024 (= defaultEntry!882 defaultEntry!882) t!32916) tb!7311))

(declare-fun result!15149 () Bool)

(assert (=> tb!7311 (= result!15149 tp_is_empty!26443)))

(assert (=> b!1084926 t!32916))

(declare-fun b_and!35569 () Bool)

(assert (= b_and!35567 (and (=> t!32916 result!15149) b_and!35569)))

(declare-fun m!1002935 () Bool)

(assert (=> start!96024 m!1002935))

(declare-fun m!1002937 () Bool)

(assert (=> start!96024 m!1002937))

(declare-fun m!1002939 () Bool)

(assert (=> start!96024 m!1002939))

(declare-fun m!1002941 () Bool)

(assert (=> b!1084929 m!1002941))

(declare-fun m!1002943 () Bool)

(assert (=> b!1084926 m!1002943))

(declare-fun m!1002945 () Bool)

(assert (=> b!1084926 m!1002945))

(declare-fun m!1002947 () Bool)

(assert (=> b!1084926 m!1002947))

(declare-fun m!1002949 () Bool)

(assert (=> b!1084926 m!1002949))

(declare-fun m!1002951 () Bool)

(assert (=> b!1084926 m!1002951))

(declare-fun m!1002953 () Bool)

(assert (=> b!1084926 m!1002953))

(declare-fun m!1002955 () Bool)

(assert (=> b!1084926 m!1002955))

(declare-fun m!1002957 () Bool)

(assert (=> b!1084926 m!1002957))

(declare-fun m!1002959 () Bool)

(assert (=> b!1084926 m!1002959))

(declare-fun m!1002961 () Bool)

(assert (=> b!1084927 m!1002961))

(declare-fun m!1002963 () Bool)

(assert (=> b!1084918 m!1002963))

(declare-fun m!1002965 () Bool)

(assert (=> mapNonEmpty!41419 m!1002965))

(declare-fun m!1002967 () Bool)

(assert (=> b!1084920 m!1002967))

(declare-fun m!1002969 () Bool)

(assert (=> b!1084928 m!1002969))

(declare-fun m!1002971 () Bool)

(assert (=> b!1084928 m!1002971))

(declare-fun m!1002973 () Bool)

(assert (=> b!1084925 m!1002973))

(check-sat (not b!1084927) (not b!1084928) b_and!35569 (not b_lambda!17121) (not b!1084918) (not b!1084926) (not b_next!22441) (not b!1084920) (not start!96024) tp_is_empty!26443 (not b!1084929) (not mapNonEmpty!41419))
(check-sat b_and!35569 (not b_next!22441))
