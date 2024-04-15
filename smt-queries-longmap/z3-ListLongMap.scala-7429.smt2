; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94418 () Bool)

(assert start!94418)

(declare-fun b_free!21751 () Bool)

(declare-fun b_next!21751 () Bool)

(assert (=> start!94418 (= b_free!21751 (not b_next!21751))))

(declare-fun tp!76700 () Bool)

(declare-fun b_and!34517 () Bool)

(assert (=> start!94418 (= tp!76700 b_and!34517)))

(declare-fun mapNonEmpty!40036 () Bool)

(declare-fun mapRes!40036 () Bool)

(declare-fun tp!76699 () Bool)

(declare-fun e!608878 () Bool)

(assert (=> mapNonEmpty!40036 (= mapRes!40036 (and tp!76699 e!608878))))

(declare-datatypes ((V!39217 0))(
  ( (V!39218 (val!12831 Int)) )
))
(declare-datatypes ((ValueCell!12077 0))(
  ( (ValueCellFull!12077 (v!15444 V!39217)) (EmptyCell!12077) )
))
(declare-fun mapValue!40036 () ValueCell!12077)

(declare-fun mapRest!40036 () (Array (_ BitVec 32) ValueCell!12077))

(declare-fun mapKey!40036 () (_ BitVec 32))

(declare-datatypes ((array!68050 0))(
  ( (array!68051 (arr!32725 (Array (_ BitVec 32) ValueCell!12077)) (size!33263 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68050)

(assert (=> mapNonEmpty!40036 (= (arr!32725 _values!955) (store mapRest!40036 mapKey!40036 mapValue!40036))))

(declare-fun b!1067486 () Bool)

(declare-fun e!608879 () Bool)

(assert (=> b!1067486 (= e!608879 true)))

(declare-datatypes ((tuple2!16340 0))(
  ( (tuple2!16341 (_1!8181 (_ BitVec 64)) (_2!8181 V!39217)) )
))
(declare-datatypes ((List!22882 0))(
  ( (Nil!22879) (Cons!22878 (h!24087 tuple2!16340) (t!32198 List!22882)) )
))
(declare-datatypes ((ListLongMap!14309 0))(
  ( (ListLongMap!14310 (toList!7170 List!22882)) )
))
(declare-fun lt!471347 () ListLongMap!14309)

(declare-fun -!618 (ListLongMap!14309 (_ BitVec 64)) ListLongMap!14309)

(assert (=> b!1067486 (= (-!618 lt!471347 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471347)))

(declare-datatypes ((Unit!34930 0))(
  ( (Unit!34931) )
))
(declare-fun lt!471344 () Unit!34930)

(declare-fun removeNotPresentStillSame!35 (ListLongMap!14309 (_ BitVec 64)) Unit!34930)

(assert (=> b!1067486 (= lt!471344 (removeNotPresentStillSame!35 lt!471347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067487 () Bool)

(declare-fun res!712377 () Bool)

(declare-fun e!608875 () Bool)

(assert (=> b!1067487 (=> (not res!712377) (not e!608875))))

(declare-datatypes ((array!68052 0))(
  ( (array!68053 (arr!32726 (Array (_ BitVec 32) (_ BitVec 64))) (size!33264 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68052)

(declare-datatypes ((List!22883 0))(
  ( (Nil!22880) (Cons!22879 (h!24088 (_ BitVec 64)) (t!32199 List!22883)) )
))
(declare-fun arrayNoDuplicates!0 (array!68052 (_ BitVec 32) List!22883) Bool)

(assert (=> b!1067487 (= res!712377 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22880))))

(declare-fun b!1067488 () Bool)

(declare-fun e!608881 () Bool)

(declare-fun tp_is_empty!25561 () Bool)

(assert (=> b!1067488 (= e!608881 tp_is_empty!25561)))

(declare-fun b!1067489 () Bool)

(declare-fun res!712372 () Bool)

(assert (=> b!1067489 (=> (not res!712372) (not e!608875))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067489 (= res!712372 (and (= (size!33263 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33264 _keys!1163) (size!33263 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067490 () Bool)

(declare-fun e!608880 () Bool)

(assert (=> b!1067490 (= e!608880 (and e!608881 mapRes!40036))))

(declare-fun condMapEmpty!40036 () Bool)

(declare-fun mapDefault!40036 () ValueCell!12077)

(assert (=> b!1067490 (= condMapEmpty!40036 (= (arr!32725 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12077)) mapDefault!40036)))))

(declare-fun b!1067491 () Bool)

(declare-fun res!712373 () Bool)

(assert (=> b!1067491 (=> (not res!712373) (not e!608875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68052 (_ BitVec 32)) Bool)

(assert (=> b!1067491 (= res!712373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40036 () Bool)

(assert (=> mapIsEmpty!40036 mapRes!40036))

(declare-fun res!712375 () Bool)

(assert (=> start!94418 (=> (not res!712375) (not e!608875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94418 (= res!712375 (validMask!0 mask!1515))))

(assert (=> start!94418 e!608875))

(assert (=> start!94418 true))

(assert (=> start!94418 tp_is_empty!25561))

(declare-fun array_inv!25332 (array!68050) Bool)

(assert (=> start!94418 (and (array_inv!25332 _values!955) e!608880)))

(assert (=> start!94418 tp!76700))

(declare-fun array_inv!25333 (array!68052) Bool)

(assert (=> start!94418 (array_inv!25333 _keys!1163)))

(declare-fun b!1067492 () Bool)

(declare-fun e!608877 () Bool)

(assert (=> b!1067492 (= e!608877 e!608879)))

(declare-fun res!712376 () Bool)

(assert (=> b!1067492 (=> res!712376 e!608879)))

(declare-fun contains!6248 (ListLongMap!14309 (_ BitVec 64)) Bool)

(assert (=> b!1067492 (= res!712376 (contains!6248 lt!471347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39217)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39217)

(declare-fun getCurrentListMap!4017 (array!68052 array!68050 (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 (_ BitVec 32) Int) ListLongMap!14309)

(assert (=> b!1067492 (= lt!471347 (getCurrentListMap!4017 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067493 () Bool)

(assert (=> b!1067493 (= e!608875 (not e!608877))))

(declare-fun res!712374 () Bool)

(assert (=> b!1067493 (=> res!712374 e!608877)))

(assert (=> b!1067493 (= res!712374 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471346 () ListLongMap!14309)

(declare-fun lt!471345 () ListLongMap!14309)

(assert (=> b!1067493 (= lt!471346 lt!471345)))

(declare-fun lt!471343 () Unit!34930)

(declare-fun zeroValueAfter!47 () V!39217)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!760 (array!68052 array!68050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 V!39217 V!39217 (_ BitVec 32) Int) Unit!34930)

(assert (=> b!1067493 (= lt!471343 (lemmaNoChangeToArrayThenSameMapNoExtras!760 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3766 (array!68052 array!68050 (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 (_ BitVec 32) Int) ListLongMap!14309)

(assert (=> b!1067493 (= lt!471345 (getCurrentListMapNoExtraKeys!3766 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067493 (= lt!471346 (getCurrentListMapNoExtraKeys!3766 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067494 () Bool)

(assert (=> b!1067494 (= e!608878 tp_is_empty!25561)))

(assert (= (and start!94418 res!712375) b!1067489))

(assert (= (and b!1067489 res!712372) b!1067491))

(assert (= (and b!1067491 res!712373) b!1067487))

(assert (= (and b!1067487 res!712377) b!1067493))

(assert (= (and b!1067493 (not res!712374)) b!1067492))

(assert (= (and b!1067492 (not res!712376)) b!1067486))

(assert (= (and b!1067490 condMapEmpty!40036) mapIsEmpty!40036))

(assert (= (and b!1067490 (not condMapEmpty!40036)) mapNonEmpty!40036))

(get-info :version)

(assert (= (and mapNonEmpty!40036 ((_ is ValueCellFull!12077) mapValue!40036)) b!1067494))

(assert (= (and b!1067490 ((_ is ValueCellFull!12077) mapDefault!40036)) b!1067488))

(assert (= start!94418 b!1067490))

(declare-fun m!985639 () Bool)

(assert (=> b!1067486 m!985639))

(declare-fun m!985641 () Bool)

(assert (=> b!1067486 m!985641))

(declare-fun m!985643 () Bool)

(assert (=> b!1067492 m!985643))

(declare-fun m!985645 () Bool)

(assert (=> b!1067492 m!985645))

(declare-fun m!985647 () Bool)

(assert (=> start!94418 m!985647))

(declare-fun m!985649 () Bool)

(assert (=> start!94418 m!985649))

(declare-fun m!985651 () Bool)

(assert (=> start!94418 m!985651))

(declare-fun m!985653 () Bool)

(assert (=> b!1067487 m!985653))

(declare-fun m!985655 () Bool)

(assert (=> b!1067493 m!985655))

(declare-fun m!985657 () Bool)

(assert (=> b!1067493 m!985657))

(declare-fun m!985659 () Bool)

(assert (=> b!1067493 m!985659))

(declare-fun m!985661 () Bool)

(assert (=> mapNonEmpty!40036 m!985661))

(declare-fun m!985663 () Bool)

(assert (=> b!1067491 m!985663))

(check-sat (not start!94418) (not b!1067486) (not b!1067493) (not b!1067491) b_and!34517 (not b_next!21751) (not mapNonEmpty!40036) tp_is_empty!25561 (not b!1067487) (not b!1067492))
(check-sat b_and!34517 (not b_next!21751))
