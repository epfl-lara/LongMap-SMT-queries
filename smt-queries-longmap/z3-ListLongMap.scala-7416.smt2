; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94546 () Bool)

(assert start!94546)

(declare-fun b_free!21673 () Bool)

(declare-fun b_next!21673 () Bool)

(assert (=> start!94546 (= b_free!21673 (not b_next!21673))))

(declare-fun tp!76460 () Bool)

(declare-fun b_and!34455 () Bool)

(assert (=> start!94546 (= tp!76460 b_and!34455)))

(declare-fun res!712348 () Bool)

(declare-fun e!609027 () Bool)

(assert (=> start!94546 (=> (not res!712348) (not e!609027))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94546 (= res!712348 (validMask!0 mask!1515))))

(assert (=> start!94546 e!609027))

(assert (=> start!94546 true))

(declare-fun tp_is_empty!25483 () Bool)

(assert (=> start!94546 tp_is_empty!25483))

(declare-datatypes ((V!39113 0))(
  ( (V!39114 (val!12792 Int)) )
))
(declare-datatypes ((ValueCell!12038 0))(
  ( (ValueCellFull!12038 (v!15401 V!39113)) (EmptyCell!12038) )
))
(declare-datatypes ((array!67993 0))(
  ( (array!67994 (arr!32692 (Array (_ BitVec 32) ValueCell!12038)) (size!33229 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67993)

(declare-fun e!609031 () Bool)

(declare-fun array_inv!25334 (array!67993) Bool)

(assert (=> start!94546 (and (array_inv!25334 _values!955) e!609031)))

(assert (=> start!94546 tp!76460))

(declare-datatypes ((array!67995 0))(
  ( (array!67996 (arr!32693 (Array (_ BitVec 32) (_ BitVec 64))) (size!33230 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67995)

(declare-fun array_inv!25335 (array!67995) Bool)

(assert (=> start!94546 (array_inv!25335 _keys!1163)))

(declare-fun b!1067840 () Bool)

(declare-fun e!609029 () Bool)

(assert (=> b!1067840 (= e!609029 tp_is_empty!25483)))

(declare-fun b!1067841 () Bool)

(declare-fun res!712344 () Bool)

(assert (=> b!1067841 (=> (not res!712344) (not e!609027))))

(declare-datatypes ((List!22771 0))(
  ( (Nil!22768) (Cons!22767 (h!23985 (_ BitVec 64)) (t!32084 List!22771)) )
))
(declare-fun arrayNoDuplicates!0 (array!67995 (_ BitVec 32) List!22771) Bool)

(assert (=> b!1067841 (= res!712344 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22768))))

(declare-fun b!1067842 () Bool)

(declare-fun res!712347 () Bool)

(assert (=> b!1067842 (=> (not res!712347) (not e!609027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67995 (_ BitVec 32)) Bool)

(assert (=> b!1067842 (= res!712347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39913 () Bool)

(declare-fun mapRes!39913 () Bool)

(assert (=> mapIsEmpty!39913 mapRes!39913))

(declare-fun b!1067843 () Bool)

(declare-fun res!712345 () Bool)

(assert (=> b!1067843 (=> (not res!712345) (not e!609027))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067843 (= res!712345 (and (= (size!33229 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33230 _keys!1163) (size!33229 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39913 () Bool)

(declare-fun tp!76459 () Bool)

(declare-fun e!609028 () Bool)

(assert (=> mapNonEmpty!39913 (= mapRes!39913 (and tp!76459 e!609028))))

(declare-fun mapValue!39913 () ValueCell!12038)

(declare-fun mapRest!39913 () (Array (_ BitVec 32) ValueCell!12038))

(declare-fun mapKey!39913 () (_ BitVec 32))

(assert (=> mapNonEmpty!39913 (= (arr!32692 _values!955) (store mapRest!39913 mapKey!39913 mapValue!39913))))

(declare-fun b!1067844 () Bool)

(assert (=> b!1067844 (= e!609031 (and e!609029 mapRes!39913))))

(declare-fun condMapEmpty!39913 () Bool)

(declare-fun mapDefault!39913 () ValueCell!12038)

(assert (=> b!1067844 (= condMapEmpty!39913 (= (arr!32692 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12038)) mapDefault!39913)))))

(declare-fun b!1067845 () Bool)

(declare-fun e!609026 () Bool)

(assert (=> b!1067845 (= e!609026 true)))

(declare-datatypes ((tuple2!16204 0))(
  ( (tuple2!16205 (_1!8113 (_ BitVec 64)) (_2!8113 V!39113)) )
))
(declare-datatypes ((List!22772 0))(
  ( (Nil!22769) (Cons!22768 (h!23986 tuple2!16204) (t!32085 List!22772)) )
))
(declare-datatypes ((ListLongMap!14181 0))(
  ( (ListLongMap!14182 (toList!7106 List!22772)) )
))
(declare-fun lt!471396 () ListLongMap!14181)

(declare-fun lt!471394 () ListLongMap!14181)

(declare-fun -!619 (ListLongMap!14181 (_ BitVec 64)) ListLongMap!14181)

(assert (=> b!1067845 (= lt!471396 (-!619 lt!471394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471398 () ListLongMap!14181)

(declare-fun lt!471395 () ListLongMap!14181)

(assert (=> b!1067845 (= (-!619 lt!471398 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471395)))

(declare-datatypes ((Unit!35008 0))(
  ( (Unit!35009) )
))
(declare-fun lt!471397 () Unit!35008)

(declare-fun zeroValueBefore!47 () V!39113)

(declare-fun addThenRemoveForNewKeyIsSame!29 (ListLongMap!14181 (_ BitVec 64) V!39113) Unit!35008)

(assert (=> b!1067845 (= lt!471397 (addThenRemoveForNewKeyIsSame!29 lt!471395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471392 () ListLongMap!14181)

(declare-fun lt!471393 () ListLongMap!14181)

(assert (=> b!1067845 (and (= lt!471394 lt!471398) (= lt!471392 lt!471393))))

(declare-fun +!3172 (ListLongMap!14181 tuple2!16204) ListLongMap!14181)

(assert (=> b!1067845 (= lt!471398 (+!3172 lt!471395 (tuple2!16205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39113)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39113)

(declare-fun getCurrentListMap!4053 (array!67995 array!67993 (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 (_ BitVec 32) Int) ListLongMap!14181)

(assert (=> b!1067845 (= lt!471392 (getCurrentListMap!4053 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067845 (= lt!471394 (getCurrentListMap!4053 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067846 () Bool)

(assert (=> b!1067846 (= e!609028 tp_is_empty!25483)))

(declare-fun b!1067847 () Bool)

(assert (=> b!1067847 (= e!609027 (not e!609026))))

(declare-fun res!712346 () Bool)

(assert (=> b!1067847 (=> res!712346 e!609026)))

(assert (=> b!1067847 (= res!712346 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1067847 (= lt!471395 lt!471393)))

(declare-fun lt!471391 () Unit!35008)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!730 (array!67995 array!67993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 V!39113 V!39113 (_ BitVec 32) Int) Unit!35008)

(assert (=> b!1067847 (= lt!471391 (lemmaNoChangeToArrayThenSameMapNoExtras!730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3727 (array!67995 array!67993 (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 (_ BitVec 32) Int) ListLongMap!14181)

(assert (=> b!1067847 (= lt!471393 (getCurrentListMapNoExtraKeys!3727 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067847 (= lt!471395 (getCurrentListMapNoExtraKeys!3727 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94546 res!712348) b!1067843))

(assert (= (and b!1067843 res!712345) b!1067842))

(assert (= (and b!1067842 res!712347) b!1067841))

(assert (= (and b!1067841 res!712344) b!1067847))

(assert (= (and b!1067847 (not res!712346)) b!1067845))

(assert (= (and b!1067844 condMapEmpty!39913) mapIsEmpty!39913))

(assert (= (and b!1067844 (not condMapEmpty!39913)) mapNonEmpty!39913))

(get-info :version)

(assert (= (and mapNonEmpty!39913 ((_ is ValueCellFull!12038) mapValue!39913)) b!1067846))

(assert (= (and b!1067844 ((_ is ValueCellFull!12038) mapDefault!39913)) b!1067840))

(assert (= start!94546 b!1067844))

(declare-fun m!986865 () Bool)

(assert (=> b!1067845 m!986865))

(declare-fun m!986867 () Bool)

(assert (=> b!1067845 m!986867))

(declare-fun m!986869 () Bool)

(assert (=> b!1067845 m!986869))

(declare-fun m!986871 () Bool)

(assert (=> b!1067845 m!986871))

(declare-fun m!986873 () Bool)

(assert (=> b!1067845 m!986873))

(declare-fun m!986875 () Bool)

(assert (=> b!1067845 m!986875))

(declare-fun m!986877 () Bool)

(assert (=> mapNonEmpty!39913 m!986877))

(declare-fun m!986879 () Bool)

(assert (=> b!1067842 m!986879))

(declare-fun m!986881 () Bool)

(assert (=> b!1067841 m!986881))

(declare-fun m!986883 () Bool)

(assert (=> b!1067847 m!986883))

(declare-fun m!986885 () Bool)

(assert (=> b!1067847 m!986885))

(declare-fun m!986887 () Bool)

(assert (=> b!1067847 m!986887))

(declare-fun m!986889 () Bool)

(assert (=> start!94546 m!986889))

(declare-fun m!986891 () Bool)

(assert (=> start!94546 m!986891))

(declare-fun m!986893 () Bool)

(assert (=> start!94546 m!986893))

(check-sat b_and!34455 (not b!1067842) (not b!1067847) (not b!1067845) (not mapNonEmpty!39913) (not b!1067841) (not start!94546) (not b_next!21673) tp_is_empty!25483)
(check-sat b_and!34455 (not b_next!21673))
