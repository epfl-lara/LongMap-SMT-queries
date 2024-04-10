; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94200 () Bool)

(assert start!94200)

(declare-fun b_free!21585 () Bool)

(declare-fun b_next!21585 () Bool)

(assert (=> start!94200 (= b_free!21585 (not b_next!21585))))

(declare-fun tp!76193 () Bool)

(declare-fun b_and!34345 () Bool)

(assert (=> start!94200 (= tp!76193 b_and!34345)))

(declare-fun mapIsEmpty!39778 () Bool)

(declare-fun mapRes!39778 () Bool)

(assert (=> mapIsEmpty!39778 mapRes!39778))

(declare-fun b!1065273 () Bool)

(declare-fun res!711084 () Bool)

(declare-fun e!607265 () Bool)

(assert (=> b!1065273 (=> (not res!711084) (not e!607265))))

(declare-datatypes ((array!67777 0))(
  ( (array!67778 (arr!32591 (Array (_ BitVec 32) (_ BitVec 64))) (size!33127 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67777)

(declare-datatypes ((List!22723 0))(
  ( (Nil!22720) (Cons!22719 (h!23928 (_ BitVec 64)) (t!32042 List!22723)) )
))
(declare-fun arrayNoDuplicates!0 (array!67777 (_ BitVec 32) List!22723) Bool)

(assert (=> b!1065273 (= res!711084 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22720))))

(declare-fun b!1065274 () Bool)

(declare-fun e!607261 () Bool)

(declare-fun tp_is_empty!25395 () Bool)

(assert (=> b!1065274 (= e!607261 tp_is_empty!25395)))

(declare-fun res!711080 () Bool)

(assert (=> start!94200 (=> (not res!711080) (not e!607265))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94200 (= res!711080 (validMask!0 mask!1515))))

(assert (=> start!94200 e!607265))

(assert (=> start!94200 true))

(assert (=> start!94200 tp_is_empty!25395))

(declare-datatypes ((V!38995 0))(
  ( (V!38996 (val!12748 Int)) )
))
(declare-datatypes ((ValueCell!11994 0))(
  ( (ValueCellFull!11994 (v!15360 V!38995)) (EmptyCell!11994) )
))
(declare-datatypes ((array!67779 0))(
  ( (array!67780 (arr!32592 (Array (_ BitVec 32) ValueCell!11994)) (size!33128 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67779)

(declare-fun e!607263 () Bool)

(declare-fun array_inv!25236 (array!67779) Bool)

(assert (=> start!94200 (and (array_inv!25236 _values!955) e!607263)))

(assert (=> start!94200 tp!76193))

(declare-fun array_inv!25237 (array!67777) Bool)

(assert (=> start!94200 (array_inv!25237 _keys!1163)))

(declare-fun mapNonEmpty!39778 () Bool)

(declare-fun tp!76192 () Bool)

(declare-fun e!607264 () Bool)

(assert (=> mapNonEmpty!39778 (= mapRes!39778 (and tp!76192 e!607264))))

(declare-fun mapRest!39778 () (Array (_ BitVec 32) ValueCell!11994))

(declare-fun mapValue!39778 () ValueCell!11994)

(declare-fun mapKey!39778 () (_ BitVec 32))

(assert (=> mapNonEmpty!39778 (= (arr!32592 _values!955) (store mapRest!39778 mapKey!39778 mapValue!39778))))

(declare-fun b!1065275 () Bool)

(assert (=> b!1065275 (= e!607264 tp_is_empty!25395)))

(declare-fun b!1065276 () Bool)

(declare-fun res!711081 () Bool)

(assert (=> b!1065276 (=> (not res!711081) (not e!607265))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065276 (= res!711081 (and (= (size!33128 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33127 _keys!1163) (size!33128 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065277 () Bool)

(declare-fun e!607262 () Bool)

(assert (=> b!1065277 (= e!607262 true)))

(declare-datatypes ((tuple2!16156 0))(
  ( (tuple2!16157 (_1!8089 (_ BitVec 64)) (_2!8089 V!38995)) )
))
(declare-datatypes ((List!22724 0))(
  ( (Nil!22721) (Cons!22720 (h!23929 tuple2!16156) (t!32043 List!22724)) )
))
(declare-datatypes ((ListLongMap!14125 0))(
  ( (ListLongMap!14126 (toList!7078 List!22724)) )
))
(declare-fun lt!469689 () ListLongMap!14125)

(declare-fun lt!469683 () ListLongMap!14125)

(declare-fun -!593 (ListLongMap!14125 (_ BitVec 64)) ListLongMap!14125)

(assert (=> b!1065277 (= lt!469689 (-!593 lt!469683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469682 () ListLongMap!14125)

(declare-fun lt!469684 () ListLongMap!14125)

(assert (=> b!1065277 (= (-!593 lt!469682 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469684)))

(declare-datatypes ((Unit!34949 0))(
  ( (Unit!34950) )
))
(declare-fun lt!469687 () Unit!34949)

(declare-fun zeroValueBefore!47 () V!38995)

(declare-fun addThenRemoveForNewKeyIsSame!2 (ListLongMap!14125 (_ BitVec 64) V!38995) Unit!34949)

(assert (=> b!1065277 (= lt!469687 (addThenRemoveForNewKeyIsSame!2 lt!469684 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469685 () ListLongMap!14125)

(declare-fun lt!469688 () ListLongMap!14125)

(assert (=> b!1065277 (and (= lt!469683 lt!469682) (= lt!469685 lt!469688))))

(declare-fun +!3124 (ListLongMap!14125 tuple2!16156) ListLongMap!14125)

(assert (=> b!1065277 (= lt!469682 (+!3124 lt!469684 (tuple2!16157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!38995)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38995)

(declare-fun getCurrentListMap!4037 (array!67777 array!67779 (_ BitVec 32) (_ BitVec 32) V!38995 V!38995 (_ BitVec 32) Int) ListLongMap!14125)

(assert (=> b!1065277 (= lt!469685 (getCurrentListMap!4037 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065277 (= lt!469683 (getCurrentListMap!4037 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065278 () Bool)

(declare-fun res!711082 () Bool)

(assert (=> b!1065278 (=> (not res!711082) (not e!607265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67777 (_ BitVec 32)) Bool)

(assert (=> b!1065278 (= res!711082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065279 () Bool)

(assert (=> b!1065279 (= e!607263 (and e!607261 mapRes!39778))))

(declare-fun condMapEmpty!39778 () Bool)

(declare-fun mapDefault!39778 () ValueCell!11994)

(assert (=> b!1065279 (= condMapEmpty!39778 (= (arr!32592 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11994)) mapDefault!39778)))))

(declare-fun b!1065280 () Bool)

(assert (=> b!1065280 (= e!607265 (not e!607262))))

(declare-fun res!711083 () Bool)

(assert (=> b!1065280 (=> res!711083 e!607262)))

(assert (=> b!1065280 (= res!711083 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065280 (= lt!469684 lt!469688)))

(declare-fun lt!469686 () Unit!34949)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!703 (array!67777 array!67779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38995 V!38995 V!38995 V!38995 (_ BitVec 32) Int) Unit!34949)

(assert (=> b!1065280 (= lt!469686 (lemmaNoChangeToArrayThenSameMapNoExtras!703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3666 (array!67777 array!67779 (_ BitVec 32) (_ BitVec 32) V!38995 V!38995 (_ BitVec 32) Int) ListLongMap!14125)

(assert (=> b!1065280 (= lt!469688 (getCurrentListMapNoExtraKeys!3666 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065280 (= lt!469684 (getCurrentListMapNoExtraKeys!3666 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94200 res!711080) b!1065276))

(assert (= (and b!1065276 res!711081) b!1065278))

(assert (= (and b!1065278 res!711082) b!1065273))

(assert (= (and b!1065273 res!711084) b!1065280))

(assert (= (and b!1065280 (not res!711083)) b!1065277))

(assert (= (and b!1065279 condMapEmpty!39778) mapIsEmpty!39778))

(assert (= (and b!1065279 (not condMapEmpty!39778)) mapNonEmpty!39778))

(get-info :version)

(assert (= (and mapNonEmpty!39778 ((_ is ValueCellFull!11994) mapValue!39778)) b!1065275))

(assert (= (and b!1065279 ((_ is ValueCellFull!11994) mapDefault!39778)) b!1065274))

(assert (= start!94200 b!1065279))

(declare-fun m!983689 () Bool)

(assert (=> b!1065277 m!983689))

(declare-fun m!983691 () Bool)

(assert (=> b!1065277 m!983691))

(declare-fun m!983693 () Bool)

(assert (=> b!1065277 m!983693))

(declare-fun m!983695 () Bool)

(assert (=> b!1065277 m!983695))

(declare-fun m!983697 () Bool)

(assert (=> b!1065277 m!983697))

(declare-fun m!983699 () Bool)

(assert (=> b!1065277 m!983699))

(declare-fun m!983701 () Bool)

(assert (=> b!1065280 m!983701))

(declare-fun m!983703 () Bool)

(assert (=> b!1065280 m!983703))

(declare-fun m!983705 () Bool)

(assert (=> b!1065280 m!983705))

(declare-fun m!983707 () Bool)

(assert (=> start!94200 m!983707))

(declare-fun m!983709 () Bool)

(assert (=> start!94200 m!983709))

(declare-fun m!983711 () Bool)

(assert (=> start!94200 m!983711))

(declare-fun m!983713 () Bool)

(assert (=> mapNonEmpty!39778 m!983713))

(declare-fun m!983715 () Bool)

(assert (=> b!1065278 m!983715))

(declare-fun m!983717 () Bool)

(assert (=> b!1065273 m!983717))

(check-sat (not start!94200) b_and!34345 (not mapNonEmpty!39778) (not b!1065280) (not b_next!21585) (not b!1065273) (not b!1065277) tp_is_empty!25395 (not b!1065278))
(check-sat b_and!34345 (not b_next!21585))
