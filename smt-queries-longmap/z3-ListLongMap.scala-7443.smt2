; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94766 () Bool)

(assert start!94766)

(declare-fun b_free!21835 () Bool)

(declare-fun b_next!21835 () Bool)

(assert (=> start!94766 (= b_free!21835 (not b_next!21835))))

(declare-fun tp!76955 () Bool)

(declare-fun b_and!34647 () Bool)

(assert (=> start!94766 (= tp!76955 b_and!34647)))

(declare-fun b!1070257 () Bool)

(declare-fun e!610810 () Bool)

(declare-fun e!610808 () Bool)

(declare-fun mapRes!40165 () Bool)

(assert (=> b!1070257 (= e!610810 (and e!610808 mapRes!40165))))

(declare-fun condMapEmpty!40165 () Bool)

(declare-datatypes ((V!39329 0))(
  ( (V!39330 (val!12873 Int)) )
))
(declare-datatypes ((ValueCell!12119 0))(
  ( (ValueCellFull!12119 (v!15484 V!39329)) (EmptyCell!12119) )
))
(declare-datatypes ((array!68313 0))(
  ( (array!68314 (arr!32849 (Array (_ BitVec 32) ValueCell!12119)) (size!33386 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68313)

(declare-fun mapDefault!40165 () ValueCell!12119)

(assert (=> b!1070257 (= condMapEmpty!40165 (= (arr!32849 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12119)) mapDefault!40165)))))

(declare-fun b!1070258 () Bool)

(declare-fun tp_is_empty!25645 () Bool)

(assert (=> b!1070258 (= e!610808 tp_is_empty!25645)))

(declare-fun b!1070259 () Bool)

(declare-fun e!610806 () Bool)

(declare-fun e!610811 () Bool)

(assert (=> b!1070259 (= e!610806 (not e!610811))))

(declare-fun res!713785 () Bool)

(assert (=> b!1070259 (=> res!713785 e!610811)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070259 (= res!713785 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16334 0))(
  ( (tuple2!16335 (_1!8178 (_ BitVec 64)) (_2!8178 V!39329)) )
))
(declare-datatypes ((List!22901 0))(
  ( (Nil!22898) (Cons!22897 (h!24115 tuple2!16334) (t!32220 List!22901)) )
))
(declare-datatypes ((ListLongMap!14311 0))(
  ( (ListLongMap!14312 (toList!7171 List!22901)) )
))
(declare-fun lt!472816 () ListLongMap!14311)

(declare-fun lt!472814 () ListLongMap!14311)

(assert (=> b!1070259 (= lt!472816 lt!472814)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39329)

(declare-datatypes ((Unit!35134 0))(
  ( (Unit!35135) )
))
(declare-fun lt!472813 () Unit!35134)

(declare-fun minValue!907 () V!39329)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39329)

(declare-datatypes ((array!68315 0))(
  ( (array!68316 (arr!32850 (Array (_ BitVec 32) (_ BitVec 64))) (size!33387 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68315)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!787 (array!68315 array!68313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 V!39329 V!39329 (_ BitVec 32) Int) Unit!35134)

(assert (=> b!1070259 (= lt!472813 (lemmaNoChangeToArrayThenSameMapNoExtras!787 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3784 (array!68315 array!68313 (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 (_ BitVec 32) Int) ListLongMap!14311)

(assert (=> b!1070259 (= lt!472814 (getCurrentListMapNoExtraKeys!3784 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070259 (= lt!472816 (getCurrentListMapNoExtraKeys!3784 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070260 () Bool)

(declare-fun e!610809 () Bool)

(assert (=> b!1070260 (= e!610809 true)))

(declare-fun lt!472812 () ListLongMap!14311)

(declare-fun -!653 (ListLongMap!14311 (_ BitVec 64)) ListLongMap!14311)

(assert (=> b!1070260 (= (-!653 lt!472812 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472812)))

(declare-fun lt!472815 () Unit!35134)

(declare-fun removeNotPresentStillSame!70 (ListLongMap!14311 (_ BitVec 64)) Unit!35134)

(assert (=> b!1070260 (= lt!472815 (removeNotPresentStillSame!70 lt!472812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070261 () Bool)

(assert (=> b!1070261 (= e!610811 e!610809)))

(declare-fun res!713780 () Bool)

(assert (=> b!1070261 (=> res!713780 e!610809)))

(declare-fun contains!6332 (ListLongMap!14311 (_ BitVec 64)) Bool)

(assert (=> b!1070261 (= res!713780 (contains!6332 lt!472812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4094 (array!68315 array!68313 (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 (_ BitVec 32) Int) ListLongMap!14311)

(assert (=> b!1070261 (= lt!472812 (getCurrentListMap!4094 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713782 () Bool)

(assert (=> start!94766 (=> (not res!713782) (not e!610806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94766 (= res!713782 (validMask!0 mask!1515))))

(assert (=> start!94766 e!610806))

(assert (=> start!94766 true))

(assert (=> start!94766 tp_is_empty!25645))

(declare-fun array_inv!25446 (array!68313) Bool)

(assert (=> start!94766 (and (array_inv!25446 _values!955) e!610810)))

(assert (=> start!94766 tp!76955))

(declare-fun array_inv!25447 (array!68315) Bool)

(assert (=> start!94766 (array_inv!25447 _keys!1163)))

(declare-fun b!1070262 () Bool)

(declare-fun e!610805 () Bool)

(assert (=> b!1070262 (= e!610805 tp_is_empty!25645)))

(declare-fun b!1070263 () Bool)

(declare-fun res!713783 () Bool)

(assert (=> b!1070263 (=> (not res!713783) (not e!610806))))

(assert (=> b!1070263 (= res!713783 (and (= (size!33386 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33387 _keys!1163) (size!33386 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070264 () Bool)

(declare-fun res!713784 () Bool)

(assert (=> b!1070264 (=> (not res!713784) (not e!610806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68315 (_ BitVec 32)) Bool)

(assert (=> b!1070264 (= res!713784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070265 () Bool)

(declare-fun res!713781 () Bool)

(assert (=> b!1070265 (=> (not res!713781) (not e!610806))))

(declare-datatypes ((List!22902 0))(
  ( (Nil!22899) (Cons!22898 (h!24116 (_ BitVec 64)) (t!32221 List!22902)) )
))
(declare-fun arrayNoDuplicates!0 (array!68315 (_ BitVec 32) List!22902) Bool)

(assert (=> b!1070265 (= res!713781 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22899))))

(declare-fun mapNonEmpty!40165 () Bool)

(declare-fun tp!76954 () Bool)

(assert (=> mapNonEmpty!40165 (= mapRes!40165 (and tp!76954 e!610805))))

(declare-fun mapRest!40165 () (Array (_ BitVec 32) ValueCell!12119))

(declare-fun mapValue!40165 () ValueCell!12119)

(declare-fun mapKey!40165 () (_ BitVec 32))

(assert (=> mapNonEmpty!40165 (= (arr!32849 _values!955) (store mapRest!40165 mapKey!40165 mapValue!40165))))

(declare-fun mapIsEmpty!40165 () Bool)

(assert (=> mapIsEmpty!40165 mapRes!40165))

(assert (= (and start!94766 res!713782) b!1070263))

(assert (= (and b!1070263 res!713783) b!1070264))

(assert (= (and b!1070264 res!713784) b!1070265))

(assert (= (and b!1070265 res!713781) b!1070259))

(assert (= (and b!1070259 (not res!713785)) b!1070261))

(assert (= (and b!1070261 (not res!713780)) b!1070260))

(assert (= (and b!1070257 condMapEmpty!40165) mapIsEmpty!40165))

(assert (= (and b!1070257 (not condMapEmpty!40165)) mapNonEmpty!40165))

(get-info :version)

(assert (= (and mapNonEmpty!40165 ((_ is ValueCellFull!12119) mapValue!40165)) b!1070262))

(assert (= (and b!1070257 ((_ is ValueCellFull!12119) mapDefault!40165)) b!1070258))

(assert (= start!94766 b!1070257))

(declare-fun m!989155 () Bool)

(assert (=> mapNonEmpty!40165 m!989155))

(declare-fun m!989157 () Bool)

(assert (=> b!1070261 m!989157))

(declare-fun m!989159 () Bool)

(assert (=> b!1070261 m!989159))

(declare-fun m!989161 () Bool)

(assert (=> b!1070260 m!989161))

(declare-fun m!989163 () Bool)

(assert (=> b!1070260 m!989163))

(declare-fun m!989165 () Bool)

(assert (=> b!1070264 m!989165))

(declare-fun m!989167 () Bool)

(assert (=> b!1070265 m!989167))

(declare-fun m!989169 () Bool)

(assert (=> b!1070259 m!989169))

(declare-fun m!989171 () Bool)

(assert (=> b!1070259 m!989171))

(declare-fun m!989173 () Bool)

(assert (=> b!1070259 m!989173))

(declare-fun m!989175 () Bool)

(assert (=> start!94766 m!989175))

(declare-fun m!989177 () Bool)

(assert (=> start!94766 m!989177))

(declare-fun m!989179 () Bool)

(assert (=> start!94766 m!989179))

(check-sat (not b!1070265) b_and!34647 (not mapNonEmpty!40165) (not b!1070261) tp_is_empty!25645 (not b!1070259) (not b!1070264) (not start!94766) (not b!1070260) (not b_next!21835))
(check-sat b_and!34647 (not b_next!21835))
