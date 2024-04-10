; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94294 () Bool)

(assert start!94294)

(declare-fun b_free!21657 () Bool)

(declare-fun b_next!21657 () Bool)

(assert (=> start!94294 (= b_free!21657 (not b_next!21657))))

(declare-fun tp!76412 () Bool)

(declare-fun b_and!34429 () Bool)

(assert (=> start!94294 (= tp!76412 b_and!34429)))

(declare-fun res!711703 () Bool)

(declare-fun e!608031 () Bool)

(assert (=> start!94294 (=> (not res!711703) (not e!608031))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94294 (= res!711703 (validMask!0 mask!1515))))

(assert (=> start!94294 e!608031))

(assert (=> start!94294 true))

(declare-fun tp_is_empty!25467 () Bool)

(assert (=> start!94294 tp_is_empty!25467))

(declare-datatypes ((V!39091 0))(
  ( (V!39092 (val!12784 Int)) )
))
(declare-datatypes ((ValueCell!12030 0))(
  ( (ValueCellFull!12030 (v!15397 V!39091)) (EmptyCell!12030) )
))
(declare-datatypes ((array!67919 0))(
  ( (array!67920 (arr!32661 (Array (_ BitVec 32) ValueCell!12030)) (size!33197 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67919)

(declare-fun e!608028 () Bool)

(declare-fun array_inv!25288 (array!67919) Bool)

(assert (=> start!94294 (and (array_inv!25288 _values!955) e!608028)))

(assert (=> start!94294 tp!76412))

(declare-datatypes ((array!67921 0))(
  ( (array!67922 (arr!32662 (Array (_ BitVec 32) (_ BitVec 64))) (size!33198 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67921)

(declare-fun array_inv!25289 (array!67921) Bool)

(assert (=> start!94294 (array_inv!25289 _keys!1163)))

(declare-fun mapNonEmpty!39889 () Bool)

(declare-fun mapRes!39889 () Bool)

(declare-fun tp!76411 () Bool)

(declare-fun e!608027 () Bool)

(assert (=> mapNonEmpty!39889 (= mapRes!39889 (and tp!76411 e!608027))))

(declare-fun mapKey!39889 () (_ BitVec 32))

(declare-fun mapValue!39889 () ValueCell!12030)

(declare-fun mapRest!39889 () (Array (_ BitVec 32) ValueCell!12030))

(assert (=> mapNonEmpty!39889 (= (arr!32661 _values!955) (store mapRest!39889 mapKey!39889 mapValue!39889))))

(declare-fun b!1066321 () Bool)

(declare-fun res!711702 () Bool)

(assert (=> b!1066321 (=> (not res!711702) (not e!608031))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066321 (= res!711702 (and (= (size!33197 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33198 _keys!1163) (size!33197 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066322 () Bool)

(declare-fun e!608029 () Bool)

(assert (=> b!1066322 (= e!608029 tp_is_empty!25467)))

(declare-fun b!1066323 () Bool)

(assert (=> b!1066323 (= e!608028 (and e!608029 mapRes!39889))))

(declare-fun condMapEmpty!39889 () Bool)

(declare-fun mapDefault!39889 () ValueCell!12030)

(assert (=> b!1066323 (= condMapEmpty!39889 (= (arr!32661 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12030)) mapDefault!39889)))))

(declare-fun b!1066324 () Bool)

(declare-fun res!711704 () Bool)

(assert (=> b!1066324 (=> (not res!711704) (not e!608031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67921 (_ BitVec 32)) Bool)

(assert (=> b!1066324 (= res!711704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066325 () Bool)

(declare-fun e!608030 () Bool)

(assert (=> b!1066325 (= e!608031 (not e!608030))))

(declare-fun res!711705 () Bool)

(assert (=> b!1066325 (=> res!711705 e!608030)))

(assert (=> b!1066325 (= res!711705 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16212 0))(
  ( (tuple2!16213 (_1!8117 (_ BitVec 64)) (_2!8117 V!39091)) )
))
(declare-datatypes ((List!22775 0))(
  ( (Nil!22772) (Cons!22771 (h!23980 tuple2!16212) (t!32096 List!22775)) )
))
(declare-datatypes ((ListLongMap!14181 0))(
  ( (ListLongMap!14182 (toList!7106 List!22775)) )
))
(declare-fun lt!470685 () ListLongMap!14181)

(declare-fun lt!470686 () ListLongMap!14181)

(assert (=> b!1066325 (= lt!470685 lt!470686)))

(declare-fun zeroValueBefore!47 () V!39091)

(declare-datatypes ((Unit!35007 0))(
  ( (Unit!35008) )
))
(declare-fun lt!470684 () Unit!35007)

(declare-fun minValue!907 () V!39091)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39091)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!729 (array!67921 array!67919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39091 V!39091 V!39091 V!39091 (_ BitVec 32) Int) Unit!35007)

(assert (=> b!1066325 (= lt!470684 (lemmaNoChangeToArrayThenSameMapNoExtras!729 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3692 (array!67921 array!67919 (_ BitVec 32) (_ BitVec 32) V!39091 V!39091 (_ BitVec 32) Int) ListLongMap!14181)

(assert (=> b!1066325 (= lt!470686 (getCurrentListMapNoExtraKeys!3692 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066325 (= lt!470685 (getCurrentListMapNoExtraKeys!3692 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39889 () Bool)

(assert (=> mapIsEmpty!39889 mapRes!39889))

(declare-fun b!1066326 () Bool)

(assert (=> b!1066326 (= e!608030 true)))

(declare-fun lt!470687 () ListLongMap!14181)

(declare-fun lt!470688 () ListLongMap!14181)

(declare-fun -!618 (ListLongMap!14181 (_ BitVec 64)) ListLongMap!14181)

(assert (=> b!1066326 (= lt!470687 (-!618 lt!470688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470691 () ListLongMap!14181)

(assert (=> b!1066326 (= (-!618 lt!470691 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470685)))

(declare-fun lt!470689 () Unit!35007)

(declare-fun addThenRemoveForNewKeyIsSame!27 (ListLongMap!14181 (_ BitVec 64) V!39091) Unit!35007)

(assert (=> b!1066326 (= lt!470689 (addThenRemoveForNewKeyIsSame!27 lt!470685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470690 () ListLongMap!14181)

(assert (=> b!1066326 (and (= lt!470688 lt!470691) (= lt!470690 lt!470686))))

(declare-fun +!3149 (ListLongMap!14181 tuple2!16212) ListLongMap!14181)

(assert (=> b!1066326 (= lt!470691 (+!3149 lt!470685 (tuple2!16213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4062 (array!67921 array!67919 (_ BitVec 32) (_ BitVec 32) V!39091 V!39091 (_ BitVec 32) Int) ListLongMap!14181)

(assert (=> b!1066326 (= lt!470690 (getCurrentListMap!4062 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066326 (= lt!470688 (getCurrentListMap!4062 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066327 () Bool)

(declare-fun res!711706 () Bool)

(assert (=> b!1066327 (=> (not res!711706) (not e!608031))))

(declare-datatypes ((List!22776 0))(
  ( (Nil!22773) (Cons!22772 (h!23981 (_ BitVec 64)) (t!32097 List!22776)) )
))
(declare-fun arrayNoDuplicates!0 (array!67921 (_ BitVec 32) List!22776) Bool)

(assert (=> b!1066327 (= res!711706 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22773))))

(declare-fun b!1066328 () Bool)

(assert (=> b!1066328 (= e!608027 tp_is_empty!25467)))

(assert (= (and start!94294 res!711703) b!1066321))

(assert (= (and b!1066321 res!711702) b!1066324))

(assert (= (and b!1066324 res!711704) b!1066327))

(assert (= (and b!1066327 res!711706) b!1066325))

(assert (= (and b!1066325 (not res!711705)) b!1066326))

(assert (= (and b!1066323 condMapEmpty!39889) mapIsEmpty!39889))

(assert (= (and b!1066323 (not condMapEmpty!39889)) mapNonEmpty!39889))

(get-info :version)

(assert (= (and mapNonEmpty!39889 ((_ is ValueCellFull!12030) mapValue!39889)) b!1066328))

(assert (= (and b!1066323 ((_ is ValueCellFull!12030) mapDefault!39889)) b!1066322))

(assert (= start!94294 b!1066323))

(declare-fun m!984953 () Bool)

(assert (=> b!1066327 m!984953))

(declare-fun m!984955 () Bool)

(assert (=> start!94294 m!984955))

(declare-fun m!984957 () Bool)

(assert (=> start!94294 m!984957))

(declare-fun m!984959 () Bool)

(assert (=> start!94294 m!984959))

(declare-fun m!984961 () Bool)

(assert (=> mapNonEmpty!39889 m!984961))

(declare-fun m!984963 () Bool)

(assert (=> b!1066326 m!984963))

(declare-fun m!984965 () Bool)

(assert (=> b!1066326 m!984965))

(declare-fun m!984967 () Bool)

(assert (=> b!1066326 m!984967))

(declare-fun m!984969 () Bool)

(assert (=> b!1066326 m!984969))

(declare-fun m!984971 () Bool)

(assert (=> b!1066326 m!984971))

(declare-fun m!984973 () Bool)

(assert (=> b!1066326 m!984973))

(declare-fun m!984975 () Bool)

(assert (=> b!1066325 m!984975))

(declare-fun m!984977 () Bool)

(assert (=> b!1066325 m!984977))

(declare-fun m!984979 () Bool)

(assert (=> b!1066325 m!984979))

(declare-fun m!984981 () Bool)

(assert (=> b!1066324 m!984981))

(check-sat (not start!94294) b_and!34429 (not b!1066327) (not b!1066324) (not b!1066326) (not b!1066325) tp_is_empty!25467 (not b_next!21657) (not mapNonEmpty!39889))
(check-sat b_and!34429 (not b_next!21657))
