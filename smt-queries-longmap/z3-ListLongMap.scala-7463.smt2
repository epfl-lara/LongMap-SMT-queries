; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94922 () Bool)

(assert start!94922)

(declare-fun b_free!21955 () Bool)

(declare-fun b_next!21955 () Bool)

(assert (=> start!94922 (= b_free!21955 (not b_next!21955))))

(declare-fun tp!77320 () Bool)

(declare-fun b_and!34785 () Bool)

(assert (=> start!94922 (= tp!77320 b_and!34785)))

(declare-fun b!1071892 () Bool)

(declare-fun e!611996 () Bool)

(declare-fun tp_is_empty!25765 () Bool)

(assert (=> b!1071892 (= e!611996 tp_is_empty!25765)))

(declare-fun res!714725 () Bool)

(declare-fun e!611993 () Bool)

(assert (=> start!94922 (=> (not res!714725) (not e!611993))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94922 (= res!714725 (validMask!0 mask!1515))))

(assert (=> start!94922 e!611993))

(assert (=> start!94922 true))

(assert (=> start!94922 tp_is_empty!25765))

(declare-datatypes ((V!39489 0))(
  ( (V!39490 (val!12933 Int)) )
))
(declare-datatypes ((ValueCell!12179 0))(
  ( (ValueCellFull!12179 (v!15545 V!39489)) (EmptyCell!12179) )
))
(declare-datatypes ((array!68545 0))(
  ( (array!68546 (arr!32963 (Array (_ BitVec 32) ValueCell!12179)) (size!33500 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68545)

(declare-fun e!611995 () Bool)

(declare-fun array_inv!25528 (array!68545) Bool)

(assert (=> start!94922 (and (array_inv!25528 _values!955) e!611995)))

(assert (=> start!94922 tp!77320))

(declare-datatypes ((array!68547 0))(
  ( (array!68548 (arr!32964 (Array (_ BitVec 32) (_ BitVec 64))) (size!33501 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68547)

(declare-fun array_inv!25529 (array!68547) Bool)

(assert (=> start!94922 (array_inv!25529 _keys!1163)))

(declare-fun mapIsEmpty!40351 () Bool)

(declare-fun mapRes!40351 () Bool)

(assert (=> mapIsEmpty!40351 mapRes!40351))

(declare-fun b!1071893 () Bool)

(declare-fun e!611997 () Bool)

(assert (=> b!1071893 (= e!611993 (not e!611997))))

(declare-fun res!714729 () Bool)

(assert (=> b!1071893 (=> res!714729 e!611997)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071893 (= res!714729 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16422 0))(
  ( (tuple2!16423 (_1!8222 (_ BitVec 64)) (_2!8222 V!39489)) )
))
(declare-datatypes ((List!22988 0))(
  ( (Nil!22985) (Cons!22984 (h!24202 tuple2!16422) (t!32311 List!22988)) )
))
(declare-datatypes ((ListLongMap!14399 0))(
  ( (ListLongMap!14400 (toList!7215 List!22988)) )
))
(declare-fun lt!473649 () ListLongMap!14399)

(declare-fun lt!473650 () ListLongMap!14399)

(assert (=> b!1071893 (= lt!473649 lt!473650)))

(declare-fun zeroValueBefore!47 () V!39489)

(declare-datatypes ((Unit!35216 0))(
  ( (Unit!35217) )
))
(declare-fun lt!473652 () Unit!35216)

(declare-fun minValue!907 () V!39489)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39489)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!826 (array!68547 array!68545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 V!39489 V!39489 (_ BitVec 32) Int) Unit!35216)

(assert (=> b!1071893 (= lt!473652 (lemmaNoChangeToArrayThenSameMapNoExtras!826 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3823 (array!68547 array!68545 (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 (_ BitVec 32) Int) ListLongMap!14399)

(assert (=> b!1071893 (= lt!473650 (getCurrentListMapNoExtraKeys!3823 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071893 (= lt!473649 (getCurrentListMapNoExtraKeys!3823 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40351 () Bool)

(declare-fun tp!77321 () Bool)

(assert (=> mapNonEmpty!40351 (= mapRes!40351 (and tp!77321 e!611996))))

(declare-fun mapKey!40351 () (_ BitVec 32))

(declare-fun mapValue!40351 () ValueCell!12179)

(declare-fun mapRest!40351 () (Array (_ BitVec 32) ValueCell!12179))

(assert (=> mapNonEmpty!40351 (= (arr!32963 _values!955) (store mapRest!40351 mapKey!40351 mapValue!40351))))

(declare-fun b!1071894 () Bool)

(assert (=> b!1071894 (= e!611997 true)))

(declare-fun lt!473651 () ListLongMap!14399)

(declare-fun getCurrentListMap!4115 (array!68547 array!68545 (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 (_ BitVec 32) Int) ListLongMap!14399)

(assert (=> b!1071894 (= lt!473651 (getCurrentListMap!4115 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071895 () Bool)

(declare-fun e!611998 () Bool)

(assert (=> b!1071895 (= e!611998 tp_is_empty!25765)))

(declare-fun b!1071896 () Bool)

(declare-fun res!714726 () Bool)

(assert (=> b!1071896 (=> (not res!714726) (not e!611993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68547 (_ BitVec 32)) Bool)

(assert (=> b!1071896 (= res!714726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071897 () Bool)

(declare-fun res!714728 () Bool)

(assert (=> b!1071897 (=> (not res!714728) (not e!611993))))

(assert (=> b!1071897 (= res!714728 (and (= (size!33500 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33501 _keys!1163) (size!33500 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071898 () Bool)

(declare-fun res!714727 () Bool)

(assert (=> b!1071898 (=> (not res!714727) (not e!611993))))

(declare-datatypes ((List!22989 0))(
  ( (Nil!22986) (Cons!22985 (h!24203 (_ BitVec 64)) (t!32312 List!22989)) )
))
(declare-fun arrayNoDuplicates!0 (array!68547 (_ BitVec 32) List!22989) Bool)

(assert (=> b!1071898 (= res!714727 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22986))))

(declare-fun b!1071899 () Bool)

(assert (=> b!1071899 (= e!611995 (and e!611998 mapRes!40351))))

(declare-fun condMapEmpty!40351 () Bool)

(declare-fun mapDefault!40351 () ValueCell!12179)

(assert (=> b!1071899 (= condMapEmpty!40351 (= (arr!32963 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12179)) mapDefault!40351)))))

(assert (= (and start!94922 res!714725) b!1071897))

(assert (= (and b!1071897 res!714728) b!1071896))

(assert (= (and b!1071896 res!714726) b!1071898))

(assert (= (and b!1071898 res!714727) b!1071893))

(assert (= (and b!1071893 (not res!714729)) b!1071894))

(assert (= (and b!1071899 condMapEmpty!40351) mapIsEmpty!40351))

(assert (= (and b!1071899 (not condMapEmpty!40351)) mapNonEmpty!40351))

(get-info :version)

(assert (= (and mapNonEmpty!40351 ((_ is ValueCellFull!12179) mapValue!40351)) b!1071892))

(assert (= (and b!1071899 ((_ is ValueCellFull!12179) mapDefault!40351)) b!1071895))

(assert (= start!94922 b!1071899))

(declare-fun m!990565 () Bool)

(assert (=> b!1071898 m!990565))

(declare-fun m!990567 () Bool)

(assert (=> mapNonEmpty!40351 m!990567))

(declare-fun m!990569 () Bool)

(assert (=> start!94922 m!990569))

(declare-fun m!990571 () Bool)

(assert (=> start!94922 m!990571))

(declare-fun m!990573 () Bool)

(assert (=> start!94922 m!990573))

(declare-fun m!990575 () Bool)

(assert (=> b!1071893 m!990575))

(declare-fun m!990577 () Bool)

(assert (=> b!1071893 m!990577))

(declare-fun m!990579 () Bool)

(assert (=> b!1071893 m!990579))

(declare-fun m!990581 () Bool)

(assert (=> b!1071894 m!990581))

(declare-fun m!990583 () Bool)

(assert (=> b!1071896 m!990583))

(check-sat (not b_next!21955) (not b!1071893) (not b!1071898) (not mapNonEmpty!40351) tp_is_empty!25765 (not b!1071896) (not b!1071894) (not start!94922) b_and!34785)
(check-sat b_and!34785 (not b_next!21955))
