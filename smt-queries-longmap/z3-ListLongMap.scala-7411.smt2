; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94516 () Bool)

(assert start!94516)

(declare-fun b_free!21643 () Bool)

(declare-fun b_next!21643 () Bool)

(assert (=> start!94516 (= b_free!21643 (not b_next!21643))))

(declare-fun tp!76370 () Bool)

(declare-fun b_and!34425 () Bool)

(assert (=> start!94516 (= tp!76370 b_and!34425)))

(declare-fun b!1067480 () Bool)

(declare-fun res!712122 () Bool)

(declare-fun e!608757 () Bool)

(assert (=> b!1067480 (=> (not res!712122) (not e!608757))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39073 0))(
  ( (V!39074 (val!12777 Int)) )
))
(declare-datatypes ((ValueCell!12023 0))(
  ( (ValueCellFull!12023 (v!15386 V!39073)) (EmptyCell!12023) )
))
(declare-datatypes ((array!67939 0))(
  ( (array!67940 (arr!32665 (Array (_ BitVec 32) ValueCell!12023)) (size!33202 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67939)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67941 0))(
  ( (array!67942 (arr!32666 (Array (_ BitVec 32) (_ BitVec 64))) (size!33203 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67941)

(assert (=> b!1067480 (= res!712122 (and (= (size!33202 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33203 _keys!1163) (size!33202 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067481 () Bool)

(declare-fun res!712121 () Bool)

(assert (=> b!1067481 (=> (not res!712121) (not e!608757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67941 (_ BitVec 32)) Bool)

(assert (=> b!1067481 (= res!712121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067482 () Bool)

(declare-fun e!608760 () Bool)

(declare-fun e!608756 () Bool)

(declare-fun mapRes!39868 () Bool)

(assert (=> b!1067482 (= e!608760 (and e!608756 mapRes!39868))))

(declare-fun condMapEmpty!39868 () Bool)

(declare-fun mapDefault!39868 () ValueCell!12023)

(assert (=> b!1067482 (= condMapEmpty!39868 (= (arr!32665 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12023)) mapDefault!39868)))))

(declare-fun b!1067483 () Bool)

(declare-fun e!608759 () Bool)

(declare-fun tp_is_empty!25453 () Bool)

(assert (=> b!1067483 (= e!608759 tp_is_empty!25453)))

(declare-fun mapNonEmpty!39868 () Bool)

(declare-fun tp!76369 () Bool)

(assert (=> mapNonEmpty!39868 (= mapRes!39868 (and tp!76369 e!608759))))

(declare-fun mapValue!39868 () ValueCell!12023)

(declare-fun mapRest!39868 () (Array (_ BitVec 32) ValueCell!12023))

(declare-fun mapKey!39868 () (_ BitVec 32))

(assert (=> mapNonEmpty!39868 (= (arr!32665 _values!955) (store mapRest!39868 mapKey!39868 mapValue!39868))))

(declare-fun b!1067485 () Bool)

(assert (=> b!1067485 (= e!608756 tp_is_empty!25453)))

(declare-fun b!1067486 () Bool)

(declare-fun res!712123 () Bool)

(assert (=> b!1067486 (=> (not res!712123) (not e!608757))))

(declare-datatypes ((List!22750 0))(
  ( (Nil!22747) (Cons!22746 (h!23964 (_ BitVec 64)) (t!32063 List!22750)) )
))
(declare-fun arrayNoDuplicates!0 (array!67941 (_ BitVec 32) List!22750) Bool)

(assert (=> b!1067486 (= res!712123 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22747))))

(declare-fun res!712120 () Bool)

(assert (=> start!94516 (=> (not res!712120) (not e!608757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94516 (= res!712120 (validMask!0 mask!1515))))

(assert (=> start!94516 e!608757))

(assert (=> start!94516 true))

(assert (=> start!94516 tp_is_empty!25453))

(declare-fun array_inv!25314 (array!67939) Bool)

(assert (=> start!94516 (and (array_inv!25314 _values!955) e!608760)))

(assert (=> start!94516 tp!76370))

(declare-fun array_inv!25315 (array!67941) Bool)

(assert (=> start!94516 (array_inv!25315 _keys!1163)))

(declare-fun b!1067484 () Bool)

(declare-fun e!608758 () Bool)

(assert (=> b!1067484 (= e!608757 (not e!608758))))

(declare-fun res!712119 () Bool)

(assert (=> b!1067484 (=> res!712119 e!608758)))

(assert (=> b!1067484 (= res!712119 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16182 0))(
  ( (tuple2!16183 (_1!8102 (_ BitVec 64)) (_2!8102 V!39073)) )
))
(declare-datatypes ((List!22751 0))(
  ( (Nil!22748) (Cons!22747 (h!23965 tuple2!16182) (t!32064 List!22751)) )
))
(declare-datatypes ((ListLongMap!14159 0))(
  ( (ListLongMap!14160 (toList!7095 List!22751)) )
))
(declare-fun lt!471032 () ListLongMap!14159)

(declare-fun lt!471035 () ListLongMap!14159)

(assert (=> b!1067484 (= lt!471032 lt!471035)))

(declare-fun zeroValueBefore!47 () V!39073)

(declare-datatypes ((Unit!34986 0))(
  ( (Unit!34987) )
))
(declare-fun lt!471034 () Unit!34986)

(declare-fun minValue!907 () V!39073)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39073)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!721 (array!67941 array!67939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 V!39073 V!39073 (_ BitVec 32) Int) Unit!34986)

(assert (=> b!1067484 (= lt!471034 (lemmaNoChangeToArrayThenSameMapNoExtras!721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3718 (array!67941 array!67939 (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 (_ BitVec 32) Int) ListLongMap!14159)

(assert (=> b!1067484 (= lt!471035 (getCurrentListMapNoExtraKeys!3718 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067484 (= lt!471032 (getCurrentListMapNoExtraKeys!3718 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39868 () Bool)

(assert (=> mapIsEmpty!39868 mapRes!39868))

(declare-fun b!1067487 () Bool)

(assert (=> b!1067487 (= e!608758 true)))

(declare-fun lt!471031 () ListLongMap!14159)

(declare-fun lt!471037 () ListLongMap!14159)

(declare-fun -!611 (ListLongMap!14159 (_ BitVec 64)) ListLongMap!14159)

(assert (=> b!1067487 (= lt!471031 (-!611 lt!471037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471036 () ListLongMap!14159)

(assert (=> b!1067487 (= (-!611 lt!471036 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471032)))

(declare-fun lt!471033 () Unit!34986)

(declare-fun addThenRemoveForNewKeyIsSame!21 (ListLongMap!14159 (_ BitVec 64) V!39073) Unit!34986)

(assert (=> b!1067487 (= lt!471033 (addThenRemoveForNewKeyIsSame!21 lt!471032 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471038 () ListLongMap!14159)

(assert (=> b!1067487 (and (= lt!471037 lt!471036) (= lt!471038 lt!471035))))

(declare-fun +!3164 (ListLongMap!14159 tuple2!16182) ListLongMap!14159)

(assert (=> b!1067487 (= lt!471036 (+!3164 lt!471032 (tuple2!16183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4045 (array!67941 array!67939 (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 (_ BitVec 32) Int) ListLongMap!14159)

(assert (=> b!1067487 (= lt!471038 (getCurrentListMap!4045 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067487 (= lt!471037 (getCurrentListMap!4045 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94516 res!712120) b!1067480))

(assert (= (and b!1067480 res!712122) b!1067481))

(assert (= (and b!1067481 res!712121) b!1067486))

(assert (= (and b!1067486 res!712123) b!1067484))

(assert (= (and b!1067484 (not res!712119)) b!1067487))

(assert (= (and b!1067482 condMapEmpty!39868) mapIsEmpty!39868))

(assert (= (and b!1067482 (not condMapEmpty!39868)) mapNonEmpty!39868))

(get-info :version)

(assert (= (and mapNonEmpty!39868 ((_ is ValueCellFull!12023) mapValue!39868)) b!1067483))

(assert (= (and b!1067482 ((_ is ValueCellFull!12023) mapDefault!39868)) b!1067485))

(assert (= start!94516 b!1067482))

(declare-fun m!986415 () Bool)

(assert (=> b!1067487 m!986415))

(declare-fun m!986417 () Bool)

(assert (=> b!1067487 m!986417))

(declare-fun m!986419 () Bool)

(assert (=> b!1067487 m!986419))

(declare-fun m!986421 () Bool)

(assert (=> b!1067487 m!986421))

(declare-fun m!986423 () Bool)

(assert (=> b!1067487 m!986423))

(declare-fun m!986425 () Bool)

(assert (=> b!1067487 m!986425))

(declare-fun m!986427 () Bool)

(assert (=> b!1067484 m!986427))

(declare-fun m!986429 () Bool)

(assert (=> b!1067484 m!986429))

(declare-fun m!986431 () Bool)

(assert (=> b!1067484 m!986431))

(declare-fun m!986433 () Bool)

(assert (=> b!1067486 m!986433))

(declare-fun m!986435 () Bool)

(assert (=> b!1067481 m!986435))

(declare-fun m!986437 () Bool)

(assert (=> start!94516 m!986437))

(declare-fun m!986439 () Bool)

(assert (=> start!94516 m!986439))

(declare-fun m!986441 () Bool)

(assert (=> start!94516 m!986441))

(declare-fun m!986443 () Bool)

(assert (=> mapNonEmpty!39868 m!986443))

(check-sat (not b_next!21643) (not b!1067484) (not mapNonEmpty!39868) (not b!1067481) (not b!1067486) tp_is_empty!25453 b_and!34425 (not b!1067487) (not start!94516))
(check-sat b_and!34425 (not b_next!21643))
