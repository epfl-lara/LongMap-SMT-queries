; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96186 () Bool)

(assert start!96186)

(declare-fun b_free!22839 () Bool)

(declare-fun b_next!22839 () Bool)

(assert (=> start!96186 (= b_free!22839 (not b_next!22839))))

(declare-fun tp!80365 () Bool)

(declare-fun b_and!36353 () Bool)

(assert (=> start!96186 (= tp!80365 b_and!36353)))

(declare-fun b!1092207 () Bool)

(declare-fun res!728777 () Bool)

(declare-fun e!623759 () Bool)

(assert (=> b!1092207 (=> (not res!728777) (not e!623759))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092207 (= res!728777 (validKeyInArray!0 k0!904))))

(declare-fun b!1092208 () Bool)

(declare-fun e!623756 () Bool)

(declare-fun tp_is_empty!26841 () Bool)

(assert (=> b!1092208 (= e!623756 tp_is_empty!26841)))

(declare-fun mapNonEmpty!42016 () Bool)

(declare-fun mapRes!42016 () Bool)

(declare-fun tp!80366 () Bool)

(assert (=> mapNonEmpty!42016 (= mapRes!42016 (and tp!80366 e!623756))))

(declare-datatypes ((V!40915 0))(
  ( (V!40916 (val!13477 Int)) )
))
(declare-datatypes ((ValueCell!12711 0))(
  ( (ValueCellFull!12711 (v!16098 V!40915)) (EmptyCell!12711) )
))
(declare-datatypes ((array!70601 0))(
  ( (array!70602 (arr!33974 (Array (_ BitVec 32) ValueCell!12711)) (size!34510 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70601)

(declare-fun mapValue!42016 () ValueCell!12711)

(declare-fun mapRest!42016 () (Array (_ BitVec 32) ValueCell!12711))

(declare-fun mapKey!42016 () (_ BitVec 32))

(assert (=> mapNonEmpty!42016 (= (arr!33974 _values!874) (store mapRest!42016 mapKey!42016 mapValue!42016))))

(declare-fun b!1092209 () Bool)

(declare-fun e!623761 () Bool)

(declare-fun e!623757 () Bool)

(assert (=> b!1092209 (= e!623761 (not e!623757))))

(declare-fun res!728783 () Bool)

(assert (=> b!1092209 (=> res!728783 e!623757)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092209 (= res!728783 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17148 0))(
  ( (tuple2!17149 (_1!8585 (_ BitVec 64)) (_2!8585 V!40915)) )
))
(declare-datatypes ((List!23732 0))(
  ( (Nil!23729) (Cons!23728 (h!24937 tuple2!17148) (t!33629 List!23732)) )
))
(declare-datatypes ((ListLongMap!15117 0))(
  ( (ListLongMap!15118 (toList!7574 List!23732)) )
))
(declare-fun lt!488103 () ListLongMap!15117)

(declare-fun minValue!831 () V!40915)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40915)

(declare-datatypes ((array!70603 0))(
  ( (array!70604 (arr!33975 (Array (_ BitVec 32) (_ BitVec 64))) (size!34511 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70603)

(declare-fun getCurrentListMap!4330 (array!70603 array!70601 (_ BitVec 32) (_ BitVec 32) V!40915 V!40915 (_ BitVec 32) Int) ListLongMap!15117)

(assert (=> b!1092209 (= lt!488103 (getCurrentListMap!4330 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488102 () array!70601)

(declare-fun lt!488113 () ListLongMap!15117)

(declare-fun lt!488106 () array!70603)

(assert (=> b!1092209 (= lt!488113 (getCurrentListMap!4330 lt!488106 lt!488102 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488108 () ListLongMap!15117)

(declare-fun lt!488101 () ListLongMap!15117)

(assert (=> b!1092209 (and (= lt!488108 lt!488101) (= lt!488101 lt!488108))))

(declare-fun lt!488105 () ListLongMap!15117)

(declare-fun -!893 (ListLongMap!15117 (_ BitVec 64)) ListLongMap!15117)

(assert (=> b!1092209 (= lt!488101 (-!893 lt!488105 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35952 0))(
  ( (Unit!35953) )
))
(declare-fun lt!488110 () Unit!35952)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!149 (array!70603 array!70601 (_ BitVec 32) (_ BitVec 32) V!40915 V!40915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35952)

(assert (=> b!1092209 (= lt!488110 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!149 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4090 (array!70603 array!70601 (_ BitVec 32) (_ BitVec 32) V!40915 V!40915 (_ BitVec 32) Int) ListLongMap!15117)

(assert (=> b!1092209 (= lt!488108 (getCurrentListMapNoExtraKeys!4090 lt!488106 lt!488102 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2227 (Int (_ BitVec 64)) V!40915)

(assert (=> b!1092209 (= lt!488102 (array!70602 (store (arr!33974 _values!874) i!650 (ValueCellFull!12711 (dynLambda!2227 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34510 _values!874)))))

(assert (=> b!1092209 (= lt!488105 (getCurrentListMapNoExtraKeys!4090 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092209 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488104 () Unit!35952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70603 (_ BitVec 64) (_ BitVec 32)) Unit!35952)

(assert (=> b!1092209 (= lt!488104 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092210 () Bool)

(declare-fun res!728782 () Bool)

(assert (=> b!1092210 (=> (not res!728782) (not e!623759))))

(assert (=> b!1092210 (= res!728782 (= (select (arr!33975 _keys!1070) i!650) k0!904))))

(declare-fun b!1092211 () Bool)

(declare-fun e!623762 () Bool)

(assert (=> b!1092211 (= e!623757 e!623762)))

(declare-fun res!728787 () Bool)

(assert (=> b!1092211 (=> res!728787 e!623762)))

(assert (=> b!1092211 (= res!728787 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!488109 () ListLongMap!15117)

(assert (=> b!1092211 (= lt!488103 lt!488109)))

(declare-fun lt!488112 () tuple2!17148)

(declare-fun +!3354 (ListLongMap!15117 tuple2!17148) ListLongMap!15117)

(assert (=> b!1092211 (= lt!488109 (+!3354 lt!488105 lt!488112))))

(declare-fun lt!488107 () ListLongMap!15117)

(assert (=> b!1092211 (= lt!488113 lt!488107)))

(assert (=> b!1092211 (= lt!488107 (+!3354 lt!488101 lt!488112))))

(assert (=> b!1092211 (= lt!488113 (+!3354 lt!488108 lt!488112))))

(assert (=> b!1092211 (= lt!488112 (tuple2!17149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092212 () Bool)

(assert (=> b!1092212 (= e!623759 e!623761)))

(declare-fun res!728778 () Bool)

(assert (=> b!1092212 (=> (not res!728778) (not e!623761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70603 (_ BitVec 32)) Bool)

(assert (=> b!1092212 (= res!728778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488106 mask!1414))))

(assert (=> b!1092212 (= lt!488106 (array!70604 (store (arr!33975 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34511 _keys!1070)))))

(declare-fun res!728785 () Bool)

(assert (=> start!96186 (=> (not res!728785) (not e!623759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96186 (= res!728785 (validMask!0 mask!1414))))

(assert (=> start!96186 e!623759))

(assert (=> start!96186 tp!80365))

(assert (=> start!96186 true))

(assert (=> start!96186 tp_is_empty!26841))

(declare-fun array_inv!26194 (array!70603) Bool)

(assert (=> start!96186 (array_inv!26194 _keys!1070)))

(declare-fun e!623760 () Bool)

(declare-fun array_inv!26195 (array!70601) Bool)

(assert (=> start!96186 (and (array_inv!26195 _values!874) e!623760)))

(declare-fun b!1092213 () Bool)

(declare-fun res!728786 () Bool)

(assert (=> b!1092213 (=> (not res!728786) (not e!623759))))

(assert (=> b!1092213 (= res!728786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092214 () Bool)

(declare-fun res!728781 () Bool)

(assert (=> b!1092214 (=> (not res!728781) (not e!623759))))

(assert (=> b!1092214 (= res!728781 (and (= (size!34510 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34511 _keys!1070) (size!34510 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092215 () Bool)

(declare-fun res!728780 () Bool)

(assert (=> b!1092215 (=> (not res!728780) (not e!623759))))

(assert (=> b!1092215 (= res!728780 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34511 _keys!1070))))))

(declare-fun b!1092216 () Bool)

(declare-fun res!728779 () Bool)

(assert (=> b!1092216 (=> (not res!728779) (not e!623759))))

(declare-datatypes ((List!23733 0))(
  ( (Nil!23730) (Cons!23729 (h!24938 (_ BitVec 64)) (t!33630 List!23733)) )
))
(declare-fun arrayNoDuplicates!0 (array!70603 (_ BitVec 32) List!23733) Bool)

(assert (=> b!1092216 (= res!728779 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23730))))

(declare-fun b!1092217 () Bool)

(declare-fun e!623758 () Bool)

(assert (=> b!1092217 (= e!623760 (and e!623758 mapRes!42016))))

(declare-fun condMapEmpty!42016 () Bool)

(declare-fun mapDefault!42016 () ValueCell!12711)

(assert (=> b!1092217 (= condMapEmpty!42016 (= (arr!33974 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12711)) mapDefault!42016)))))

(declare-fun b!1092218 () Bool)

(declare-fun res!728784 () Bool)

(assert (=> b!1092218 (=> (not res!728784) (not e!623761))))

(assert (=> b!1092218 (= res!728784 (arrayNoDuplicates!0 lt!488106 #b00000000000000000000000000000000 Nil!23730))))

(declare-fun b!1092219 () Bool)

(assert (=> b!1092219 (= e!623758 tp_is_empty!26841)))

(declare-fun b!1092220 () Bool)

(assert (=> b!1092220 (= e!623762 (bvsle #b00000000000000000000000000000000 (size!34511 _keys!1070)))))

(assert (=> b!1092220 (= (-!893 lt!488109 k0!904) lt!488107)))

(declare-fun lt!488111 () Unit!35952)

(declare-fun addRemoveCommutativeForDiffKeys!114 (ListLongMap!15117 (_ BitVec 64) V!40915 (_ BitVec 64)) Unit!35952)

(assert (=> b!1092220 (= lt!488111 (addRemoveCommutativeForDiffKeys!114 lt!488105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!42016 () Bool)

(assert (=> mapIsEmpty!42016 mapRes!42016))

(assert (= (and start!96186 res!728785) b!1092214))

(assert (= (and b!1092214 res!728781) b!1092213))

(assert (= (and b!1092213 res!728786) b!1092216))

(assert (= (and b!1092216 res!728779) b!1092215))

(assert (= (and b!1092215 res!728780) b!1092207))

(assert (= (and b!1092207 res!728777) b!1092210))

(assert (= (and b!1092210 res!728782) b!1092212))

(assert (= (and b!1092212 res!728778) b!1092218))

(assert (= (and b!1092218 res!728784) b!1092209))

(assert (= (and b!1092209 (not res!728783)) b!1092211))

(assert (= (and b!1092211 (not res!728787)) b!1092220))

(assert (= (and b!1092217 condMapEmpty!42016) mapIsEmpty!42016))

(assert (= (and b!1092217 (not condMapEmpty!42016)) mapNonEmpty!42016))

(get-info :version)

(assert (= (and mapNonEmpty!42016 ((_ is ValueCellFull!12711) mapValue!42016)) b!1092208))

(assert (= (and b!1092217 ((_ is ValueCellFull!12711) mapDefault!42016)) b!1092219))

(assert (= start!96186 b!1092217))

(declare-fun b_lambda!17509 () Bool)

(assert (=> (not b_lambda!17509) (not b!1092209)))

(declare-fun t!33628 () Bool)

(declare-fun tb!7717 () Bool)

(assert (=> (and start!96186 (= defaultEntry!882 defaultEntry!882) t!33628) tb!7717))

(declare-fun result!15953 () Bool)

(assert (=> tb!7717 (= result!15953 tp_is_empty!26841)))

(assert (=> b!1092209 t!33628))

(declare-fun b_and!36355 () Bool)

(assert (= b_and!36353 (and (=> t!33628 result!15953) b_and!36355)))

(declare-fun m!1011935 () Bool)

(assert (=> b!1092220 m!1011935))

(declare-fun m!1011937 () Bool)

(assert (=> b!1092220 m!1011937))

(declare-fun m!1011939 () Bool)

(assert (=> b!1092218 m!1011939))

(declare-fun m!1011941 () Bool)

(assert (=> b!1092211 m!1011941))

(declare-fun m!1011943 () Bool)

(assert (=> b!1092211 m!1011943))

(declare-fun m!1011945 () Bool)

(assert (=> b!1092211 m!1011945))

(declare-fun m!1011947 () Bool)

(assert (=> mapNonEmpty!42016 m!1011947))

(declare-fun m!1011949 () Bool)

(assert (=> b!1092212 m!1011949))

(declare-fun m!1011951 () Bool)

(assert (=> b!1092212 m!1011951))

(declare-fun m!1011953 () Bool)

(assert (=> b!1092207 m!1011953))

(declare-fun m!1011955 () Bool)

(assert (=> b!1092209 m!1011955))

(declare-fun m!1011957 () Bool)

(assert (=> b!1092209 m!1011957))

(declare-fun m!1011959 () Bool)

(assert (=> b!1092209 m!1011959))

(declare-fun m!1011961 () Bool)

(assert (=> b!1092209 m!1011961))

(declare-fun m!1011963 () Bool)

(assert (=> b!1092209 m!1011963))

(declare-fun m!1011965 () Bool)

(assert (=> b!1092209 m!1011965))

(declare-fun m!1011967 () Bool)

(assert (=> b!1092209 m!1011967))

(declare-fun m!1011969 () Bool)

(assert (=> b!1092209 m!1011969))

(declare-fun m!1011971 () Bool)

(assert (=> b!1092209 m!1011971))

(declare-fun m!1011973 () Bool)

(assert (=> b!1092209 m!1011973))

(declare-fun m!1011975 () Bool)

(assert (=> b!1092213 m!1011975))

(declare-fun m!1011977 () Bool)

(assert (=> b!1092216 m!1011977))

(declare-fun m!1011979 () Bool)

(assert (=> start!96186 m!1011979))

(declare-fun m!1011981 () Bool)

(assert (=> start!96186 m!1011981))

(declare-fun m!1011983 () Bool)

(assert (=> start!96186 m!1011983))

(declare-fun m!1011985 () Bool)

(assert (=> b!1092210 m!1011985))

(check-sat (not b!1092212) (not b!1092213) (not mapNonEmpty!42016) (not b!1092220) (not start!96186) (not b!1092216) (not b_next!22839) (not b!1092209) (not b!1092218) (not b!1092207) tp_is_empty!26841 b_and!36355 (not b_lambda!17509) (not b!1092211))
(check-sat b_and!36355 (not b_next!22839))
