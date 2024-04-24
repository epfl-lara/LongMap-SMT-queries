; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94552 () Bool)

(assert start!94552)

(declare-fun b_free!21679 () Bool)

(declare-fun b_next!21679 () Bool)

(assert (=> start!94552 (= b_free!21679 (not b_next!21679))))

(declare-fun tp!76477 () Bool)

(declare-fun b_and!34461 () Bool)

(assert (=> start!94552 (= tp!76477 b_and!34461)))

(declare-fun b!1067912 () Bool)

(declare-fun e!609083 () Bool)

(declare-fun e!609081 () Bool)

(assert (=> b!1067912 (= e!609083 (not e!609081))))

(declare-fun res!712392 () Bool)

(assert (=> b!1067912 (=> res!712392 e!609081)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067912 (= res!712392 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39121 0))(
  ( (V!39122 (val!12795 Int)) )
))
(declare-datatypes ((tuple2!16210 0))(
  ( (tuple2!16211 (_1!8116 (_ BitVec 64)) (_2!8116 V!39121)) )
))
(declare-datatypes ((List!22777 0))(
  ( (Nil!22774) (Cons!22773 (h!23991 tuple2!16210) (t!32090 List!22777)) )
))
(declare-datatypes ((ListLongMap!14187 0))(
  ( (ListLongMap!14188 (toList!7109 List!22777)) )
))
(declare-fun lt!471470 () ListLongMap!14187)

(declare-fun lt!471465 () ListLongMap!14187)

(assert (=> b!1067912 (= lt!471470 lt!471465)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39121)

(declare-datatypes ((Unit!35014 0))(
  ( (Unit!35015) )
))
(declare-fun lt!471468 () Unit!35014)

(declare-datatypes ((ValueCell!12041 0))(
  ( (ValueCellFull!12041 (v!15404 V!39121)) (EmptyCell!12041) )
))
(declare-datatypes ((array!68005 0))(
  ( (array!68006 (arr!32698 (Array (_ BitVec 32) ValueCell!12041)) (size!33235 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68005)

(declare-fun minValue!907 () V!39121)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39121)

(declare-datatypes ((array!68007 0))(
  ( (array!68008 (arr!32699 (Array (_ BitVec 32) (_ BitVec 64))) (size!33236 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68007)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!732 (array!68007 array!68005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39121 V!39121 V!39121 V!39121 (_ BitVec 32) Int) Unit!35014)

(assert (=> b!1067912 (= lt!471468 (lemmaNoChangeToArrayThenSameMapNoExtras!732 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3729 (array!68007 array!68005 (_ BitVec 32) (_ BitVec 32) V!39121 V!39121 (_ BitVec 32) Int) ListLongMap!14187)

(assert (=> b!1067912 (= lt!471465 (getCurrentListMapNoExtraKeys!3729 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067912 (= lt!471470 (getCurrentListMapNoExtraKeys!3729 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067913 () Bool)

(declare-fun e!609082 () Bool)

(declare-fun tp_is_empty!25489 () Bool)

(assert (=> b!1067913 (= e!609082 tp_is_empty!25489)))

(declare-fun b!1067914 () Bool)

(assert (=> b!1067914 (= e!609081 true)))

(declare-fun lt!471467 () ListLongMap!14187)

(declare-fun lt!471466 () ListLongMap!14187)

(declare-fun -!622 (ListLongMap!14187 (_ BitVec 64)) ListLongMap!14187)

(assert (=> b!1067914 (= lt!471467 (-!622 lt!471466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471469 () ListLongMap!14187)

(assert (=> b!1067914 (= (-!622 lt!471469 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471470)))

(declare-fun lt!471464 () Unit!35014)

(declare-fun addThenRemoveForNewKeyIsSame!32 (ListLongMap!14187 (_ BitVec 64) V!39121) Unit!35014)

(assert (=> b!1067914 (= lt!471464 (addThenRemoveForNewKeyIsSame!32 lt!471470 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471463 () ListLongMap!14187)

(assert (=> b!1067914 (and (= lt!471466 lt!471469) (= lt!471463 lt!471465))))

(declare-fun +!3175 (ListLongMap!14187 tuple2!16210) ListLongMap!14187)

(assert (=> b!1067914 (= lt!471469 (+!3175 lt!471470 (tuple2!16211 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4056 (array!68007 array!68005 (_ BitVec 32) (_ BitVec 32) V!39121 V!39121 (_ BitVec 32) Int) ListLongMap!14187)

(assert (=> b!1067914 (= lt!471463 (getCurrentListMap!4056 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067914 (= lt!471466 (getCurrentListMap!4056 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067915 () Bool)

(declare-fun res!712393 () Bool)

(assert (=> b!1067915 (=> (not res!712393) (not e!609083))))

(assert (=> b!1067915 (= res!712393 (and (= (size!33235 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33236 _keys!1163) (size!33235 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067916 () Bool)

(declare-fun e!609080 () Bool)

(declare-fun e!609084 () Bool)

(declare-fun mapRes!39922 () Bool)

(assert (=> b!1067916 (= e!609080 (and e!609084 mapRes!39922))))

(declare-fun condMapEmpty!39922 () Bool)

(declare-fun mapDefault!39922 () ValueCell!12041)

(assert (=> b!1067916 (= condMapEmpty!39922 (= (arr!32698 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12041)) mapDefault!39922)))))

(declare-fun b!1067918 () Bool)

(declare-fun res!712391 () Bool)

(assert (=> b!1067918 (=> (not res!712391) (not e!609083))))

(declare-datatypes ((List!22778 0))(
  ( (Nil!22775) (Cons!22774 (h!23992 (_ BitVec 64)) (t!32091 List!22778)) )
))
(declare-fun arrayNoDuplicates!0 (array!68007 (_ BitVec 32) List!22778) Bool)

(assert (=> b!1067918 (= res!712391 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22775))))

(declare-fun b!1067919 () Bool)

(declare-fun res!712389 () Bool)

(assert (=> b!1067919 (=> (not res!712389) (not e!609083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68007 (_ BitVec 32)) Bool)

(assert (=> b!1067919 (= res!712389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39922 () Bool)

(declare-fun tp!76478 () Bool)

(assert (=> mapNonEmpty!39922 (= mapRes!39922 (and tp!76478 e!609082))))

(declare-fun mapRest!39922 () (Array (_ BitVec 32) ValueCell!12041))

(declare-fun mapValue!39922 () ValueCell!12041)

(declare-fun mapKey!39922 () (_ BitVec 32))

(assert (=> mapNonEmpty!39922 (= (arr!32698 _values!955) (store mapRest!39922 mapKey!39922 mapValue!39922))))

(declare-fun mapIsEmpty!39922 () Bool)

(assert (=> mapIsEmpty!39922 mapRes!39922))

(declare-fun res!712390 () Bool)

(assert (=> start!94552 (=> (not res!712390) (not e!609083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94552 (= res!712390 (validMask!0 mask!1515))))

(assert (=> start!94552 e!609083))

(assert (=> start!94552 true))

(assert (=> start!94552 tp_is_empty!25489))

(declare-fun array_inv!25340 (array!68005) Bool)

(assert (=> start!94552 (and (array_inv!25340 _values!955) e!609080)))

(assert (=> start!94552 tp!76477))

(declare-fun array_inv!25341 (array!68007) Bool)

(assert (=> start!94552 (array_inv!25341 _keys!1163)))

(declare-fun b!1067917 () Bool)

(assert (=> b!1067917 (= e!609084 tp_is_empty!25489)))

(assert (= (and start!94552 res!712390) b!1067915))

(assert (= (and b!1067915 res!712393) b!1067919))

(assert (= (and b!1067919 res!712389) b!1067918))

(assert (= (and b!1067918 res!712391) b!1067912))

(assert (= (and b!1067912 (not res!712392)) b!1067914))

(assert (= (and b!1067916 condMapEmpty!39922) mapIsEmpty!39922))

(assert (= (and b!1067916 (not condMapEmpty!39922)) mapNonEmpty!39922))

(get-info :version)

(assert (= (and mapNonEmpty!39922 ((_ is ValueCellFull!12041) mapValue!39922)) b!1067913))

(assert (= (and b!1067916 ((_ is ValueCellFull!12041) mapDefault!39922)) b!1067917))

(assert (= start!94552 b!1067916))

(declare-fun m!986955 () Bool)

(assert (=> mapNonEmpty!39922 m!986955))

(declare-fun m!986957 () Bool)

(assert (=> start!94552 m!986957))

(declare-fun m!986959 () Bool)

(assert (=> start!94552 m!986959))

(declare-fun m!986961 () Bool)

(assert (=> start!94552 m!986961))

(declare-fun m!986963 () Bool)

(assert (=> b!1067914 m!986963))

(declare-fun m!986965 () Bool)

(assert (=> b!1067914 m!986965))

(declare-fun m!986967 () Bool)

(assert (=> b!1067914 m!986967))

(declare-fun m!986969 () Bool)

(assert (=> b!1067914 m!986969))

(declare-fun m!986971 () Bool)

(assert (=> b!1067914 m!986971))

(declare-fun m!986973 () Bool)

(assert (=> b!1067914 m!986973))

(declare-fun m!986975 () Bool)

(assert (=> b!1067912 m!986975))

(declare-fun m!986977 () Bool)

(assert (=> b!1067912 m!986977))

(declare-fun m!986979 () Bool)

(assert (=> b!1067912 m!986979))

(declare-fun m!986981 () Bool)

(assert (=> b!1067918 m!986981))

(declare-fun m!986983 () Bool)

(assert (=> b!1067919 m!986983))

(check-sat (not mapNonEmpty!39922) tp_is_empty!25489 (not b!1067914) (not b!1067919) (not b!1067912) (not b!1067918) b_and!34461 (not b_next!21679) (not start!94552))
(check-sat b_and!34461 (not b_next!21679))
