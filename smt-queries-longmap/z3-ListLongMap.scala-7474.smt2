; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95004 () Bool)

(assert start!95004)

(declare-fun b_free!22021 () Bool)

(declare-fun b_next!22021 () Bool)

(assert (=> start!95004 (= b_free!22021 (not b_next!22021))))

(declare-fun tp!77522 () Bool)

(declare-fun b_and!34861 () Bool)

(assert (=> start!95004 (= tp!77522 b_and!34861)))

(declare-fun res!715362 () Bool)

(declare-fun e!612766 () Bool)

(assert (=> start!95004 (=> (not res!715362) (not e!612766))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95004 (= res!715362 (validMask!0 mask!1515))))

(assert (=> start!95004 e!612766))

(assert (=> start!95004 true))

(declare-fun tp_is_empty!25831 () Bool)

(assert (=> start!95004 tp_is_empty!25831))

(declare-datatypes ((V!39577 0))(
  ( (V!39578 (val!12966 Int)) )
))
(declare-datatypes ((ValueCell!12212 0))(
  ( (ValueCellFull!12212 (v!15578 V!39577)) (EmptyCell!12212) )
))
(declare-datatypes ((array!68675 0))(
  ( (array!68676 (arr!33027 (Array (_ BitVec 32) ValueCell!12212)) (size!33564 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68675)

(declare-fun e!612764 () Bool)

(declare-fun array_inv!25566 (array!68675) Bool)

(assert (=> start!95004 (and (array_inv!25566 _values!955) e!612764)))

(assert (=> start!95004 tp!77522))

(declare-datatypes ((array!68677 0))(
  ( (array!68678 (arr!33028 (Array (_ BitVec 32) (_ BitVec 64))) (size!33565 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68677)

(declare-fun array_inv!25567 (array!68677) Bool)

(assert (=> start!95004 (array_inv!25567 _keys!1163)))

(declare-fun b!1072915 () Bool)

(declare-fun e!612768 () Bool)

(assert (=> b!1072915 (= e!612766 (not e!612768))))

(declare-fun res!715364 () Bool)

(assert (=> b!1072915 (=> res!715364 e!612768)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072915 (= res!715364 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16476 0))(
  ( (tuple2!16477 (_1!8249 (_ BitVec 64)) (_2!8249 V!39577)) )
))
(declare-datatypes ((List!23035 0))(
  ( (Nil!23032) (Cons!23031 (h!24249 tuple2!16476) (t!32360 List!23035)) )
))
(declare-datatypes ((ListLongMap!14453 0))(
  ( (ListLongMap!14454 (toList!7242 List!23035)) )
))
(declare-fun lt!474812 () ListLongMap!14453)

(declare-fun lt!474808 () ListLongMap!14453)

(assert (=> b!1072915 (= lt!474812 lt!474808)))

(declare-fun zeroValueBefore!47 () V!39577)

(declare-fun minValue!907 () V!39577)

(declare-datatypes ((Unit!35267 0))(
  ( (Unit!35268) )
))
(declare-fun lt!474813 () Unit!35267)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39577)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!850 (array!68677 array!68675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39577 V!39577 V!39577 V!39577 (_ BitVec 32) Int) Unit!35267)

(assert (=> b!1072915 (= lt!474813 (lemmaNoChangeToArrayThenSameMapNoExtras!850 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3847 (array!68677 array!68675 (_ BitVec 32) (_ BitVec 32) V!39577 V!39577 (_ BitVec 32) Int) ListLongMap!14453)

(assert (=> b!1072915 (= lt!474808 (getCurrentListMapNoExtraKeys!3847 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072915 (= lt!474812 (getCurrentListMapNoExtraKeys!3847 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072916 () Bool)

(declare-fun res!715366 () Bool)

(assert (=> b!1072916 (=> (not res!715366) (not e!612766))))

(declare-datatypes ((List!23036 0))(
  ( (Nil!23033) (Cons!23032 (h!24250 (_ BitVec 64)) (t!32361 List!23036)) )
))
(declare-fun arrayNoDuplicates!0 (array!68677 (_ BitVec 32) List!23036) Bool)

(assert (=> b!1072916 (= res!715366 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23033))))

(declare-fun b!1072917 () Bool)

(declare-fun lt!474810 () ListLongMap!14453)

(declare-fun e!612767 () Bool)

(declare-fun lt!474816 () tuple2!16476)

(declare-fun +!3205 (ListLongMap!14453 tuple2!16476) ListLongMap!14453)

(assert (=> b!1072917 (= e!612767 (= lt!474810 (+!3205 lt!474808 lt!474816)))))

(declare-fun b!1072918 () Bool)

(declare-fun res!715365 () Bool)

(assert (=> b!1072918 (=> (not res!715365) (not e!612766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68677 (_ BitVec 32)) Bool)

(assert (=> b!1072918 (= res!715365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072919 () Bool)

(declare-fun res!715363 () Bool)

(assert (=> b!1072919 (=> (not res!715363) (not e!612766))))

(assert (=> b!1072919 (= res!715363 (and (= (size!33564 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33565 _keys!1163) (size!33564 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40453 () Bool)

(declare-fun mapRes!40453 () Bool)

(assert (=> mapIsEmpty!40453 mapRes!40453))

(declare-fun mapNonEmpty!40453 () Bool)

(declare-fun tp!77521 () Bool)

(declare-fun e!612770 () Bool)

(assert (=> mapNonEmpty!40453 (= mapRes!40453 (and tp!77521 e!612770))))

(declare-fun mapRest!40453 () (Array (_ BitVec 32) ValueCell!12212))

(declare-fun mapKey!40453 () (_ BitVec 32))

(declare-fun mapValue!40453 () ValueCell!12212)

(assert (=> mapNonEmpty!40453 (= (arr!33027 _values!955) (store mapRest!40453 mapKey!40453 mapValue!40453))))

(declare-fun b!1072920 () Bool)

(declare-fun e!612769 () Bool)

(assert (=> b!1072920 (= e!612769 tp_is_empty!25831)))

(declare-fun b!1072921 () Bool)

(assert (=> b!1072921 (= e!612764 (and e!612769 mapRes!40453))))

(declare-fun condMapEmpty!40453 () Bool)

(declare-fun mapDefault!40453 () ValueCell!12212)

(assert (=> b!1072921 (= condMapEmpty!40453 (= (arr!33027 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12212)) mapDefault!40453)))))

(declare-fun b!1072922 () Bool)

(assert (=> b!1072922 (= e!612770 tp_is_empty!25831)))

(declare-fun b!1072923 () Bool)

(assert (=> b!1072923 (= e!612768 true)))

(declare-fun lt!474811 () ListLongMap!14453)

(declare-fun lt!474815 () ListLongMap!14453)

(declare-fun -!675 (ListLongMap!14453 (_ BitVec 64)) ListLongMap!14453)

(assert (=> b!1072923 (= lt!474811 (-!675 lt!474815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474817 () ListLongMap!14453)

(declare-fun lt!474818 () ListLongMap!14453)

(assert (=> b!1072923 (= lt!474817 lt!474818)))

(declare-fun lt!474814 () Unit!35267)

(declare-fun addCommutativeForDiffKeys!732 (ListLongMap!14453 (_ BitVec 64) V!39577 (_ BitVec 64) V!39577) Unit!35267)

(assert (=> b!1072923 (= lt!474814 (addCommutativeForDiffKeys!732 lt!474812 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474809 () ListLongMap!14453)

(assert (=> b!1072923 (= (-!675 lt!474818 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474809)))

(declare-fun lt!474819 () tuple2!16476)

(assert (=> b!1072923 (= lt!474818 (+!3205 lt!474809 lt!474819))))

(declare-fun lt!474820 () Unit!35267)

(declare-fun addThenRemoveForNewKeyIsSame!50 (ListLongMap!14453 (_ BitVec 64) V!39577) Unit!35267)

(assert (=> b!1072923 (= lt!474820 (addThenRemoveForNewKeyIsSame!50 lt!474809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072923 (= lt!474809 (+!3205 lt!474812 lt!474816))))

(assert (=> b!1072923 e!612767))

(declare-fun res!715361 () Bool)

(assert (=> b!1072923 (=> (not res!715361) (not e!612767))))

(assert (=> b!1072923 (= res!715361 (= lt!474815 lt!474817))))

(assert (=> b!1072923 (= lt!474817 (+!3205 (+!3205 lt!474812 lt!474819) lt!474816))))

(assert (=> b!1072923 (= lt!474816 (tuple2!16477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072923 (= lt!474819 (tuple2!16477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4136 (array!68677 array!68675 (_ BitVec 32) (_ BitVec 32) V!39577 V!39577 (_ BitVec 32) Int) ListLongMap!14453)

(assert (=> b!1072923 (= lt!474810 (getCurrentListMap!4136 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072923 (= lt!474815 (getCurrentListMap!4136 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95004 res!715362) b!1072919))

(assert (= (and b!1072919 res!715363) b!1072918))

(assert (= (and b!1072918 res!715365) b!1072916))

(assert (= (and b!1072916 res!715366) b!1072915))

(assert (= (and b!1072915 (not res!715364)) b!1072923))

(assert (= (and b!1072923 res!715361) b!1072917))

(assert (= (and b!1072921 condMapEmpty!40453) mapIsEmpty!40453))

(assert (= (and b!1072921 (not condMapEmpty!40453)) mapNonEmpty!40453))

(get-info :version)

(assert (= (and mapNonEmpty!40453 ((_ is ValueCellFull!12212) mapValue!40453)) b!1072922))

(assert (= (and b!1072921 ((_ is ValueCellFull!12212) mapDefault!40453)) b!1072920))

(assert (= start!95004 b!1072921))

(declare-fun m!991841 () Bool)

(assert (=> b!1072915 m!991841))

(declare-fun m!991843 () Bool)

(assert (=> b!1072915 m!991843))

(declare-fun m!991845 () Bool)

(assert (=> b!1072915 m!991845))

(declare-fun m!991847 () Bool)

(assert (=> b!1072923 m!991847))

(declare-fun m!991849 () Bool)

(assert (=> b!1072923 m!991849))

(declare-fun m!991851 () Bool)

(assert (=> b!1072923 m!991851))

(declare-fun m!991853 () Bool)

(assert (=> b!1072923 m!991853))

(declare-fun m!991855 () Bool)

(assert (=> b!1072923 m!991855))

(declare-fun m!991857 () Bool)

(assert (=> b!1072923 m!991857))

(declare-fun m!991859 () Bool)

(assert (=> b!1072923 m!991859))

(declare-fun m!991861 () Bool)

(assert (=> b!1072923 m!991861))

(declare-fun m!991863 () Bool)

(assert (=> b!1072923 m!991863))

(assert (=> b!1072923 m!991847))

(declare-fun m!991865 () Bool)

(assert (=> b!1072923 m!991865))

(declare-fun m!991867 () Bool)

(assert (=> b!1072917 m!991867))

(declare-fun m!991869 () Bool)

(assert (=> start!95004 m!991869))

(declare-fun m!991871 () Bool)

(assert (=> start!95004 m!991871))

(declare-fun m!991873 () Bool)

(assert (=> start!95004 m!991873))

(declare-fun m!991875 () Bool)

(assert (=> b!1072918 m!991875))

(declare-fun m!991877 () Bool)

(assert (=> b!1072916 m!991877))

(declare-fun m!991879 () Bool)

(assert (=> mapNonEmpty!40453 m!991879))

(check-sat (not b!1072918) (not b_next!22021) (not b!1072917) (not start!95004) (not b!1072916) tp_is_empty!25831 (not b!1072915) (not mapNonEmpty!40453) b_and!34861 (not b!1072923))
(check-sat b_and!34861 (not b_next!22021))
