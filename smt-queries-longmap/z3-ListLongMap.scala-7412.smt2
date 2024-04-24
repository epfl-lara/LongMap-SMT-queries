; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94522 () Bool)

(assert start!94522)

(declare-fun b_free!21649 () Bool)

(declare-fun b_next!21649 () Bool)

(assert (=> start!94522 (= b_free!21649 (not b_next!21649))))

(declare-fun tp!76387 () Bool)

(declare-fun b_and!34431 () Bool)

(assert (=> start!94522 (= tp!76387 b_and!34431)))

(declare-fun b!1067552 () Bool)

(declare-fun res!712165 () Bool)

(declare-fun e!608813 () Bool)

(assert (=> b!1067552 (=> (not res!712165) (not e!608813))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39081 0))(
  ( (V!39082 (val!12780 Int)) )
))
(declare-datatypes ((ValueCell!12026 0))(
  ( (ValueCellFull!12026 (v!15389 V!39081)) (EmptyCell!12026) )
))
(declare-datatypes ((array!67951 0))(
  ( (array!67952 (arr!32671 (Array (_ BitVec 32) ValueCell!12026)) (size!33208 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67951)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67953 0))(
  ( (array!67954 (arr!32672 (Array (_ BitVec 32) (_ BitVec 64))) (size!33209 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67953)

(assert (=> b!1067552 (= res!712165 (and (= (size!33208 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33209 _keys!1163) (size!33208 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39877 () Bool)

(declare-fun mapRes!39877 () Bool)

(declare-fun tp!76388 () Bool)

(declare-fun e!608815 () Bool)

(assert (=> mapNonEmpty!39877 (= mapRes!39877 (and tp!76388 e!608815))))

(declare-fun mapValue!39877 () ValueCell!12026)

(declare-fun mapKey!39877 () (_ BitVec 32))

(declare-fun mapRest!39877 () (Array (_ BitVec 32) ValueCell!12026))

(assert (=> mapNonEmpty!39877 (= (arr!32671 _values!955) (store mapRest!39877 mapKey!39877 mapValue!39877))))

(declare-fun b!1067553 () Bool)

(declare-fun res!712168 () Bool)

(assert (=> b!1067553 (=> (not res!712168) (not e!608813))))

(declare-datatypes ((List!22756 0))(
  ( (Nil!22753) (Cons!22752 (h!23970 (_ BitVec 64)) (t!32069 List!22756)) )
))
(declare-fun arrayNoDuplicates!0 (array!67953 (_ BitVec 32) List!22756) Bool)

(assert (=> b!1067553 (= res!712168 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22753))))

(declare-fun b!1067554 () Bool)

(declare-fun res!712164 () Bool)

(assert (=> b!1067554 (=> (not res!712164) (not e!608813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67953 (_ BitVec 32)) Bool)

(assert (=> b!1067554 (= res!712164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067555 () Bool)

(declare-fun e!608811 () Bool)

(declare-fun tp_is_empty!25459 () Bool)

(assert (=> b!1067555 (= e!608811 tp_is_empty!25459)))

(declare-fun b!1067556 () Bool)

(declare-fun e!608814 () Bool)

(assert (=> b!1067556 (= e!608814 (and e!608811 mapRes!39877))))

(declare-fun condMapEmpty!39877 () Bool)

(declare-fun mapDefault!39877 () ValueCell!12026)

(assert (=> b!1067556 (= condMapEmpty!39877 (= (arr!32671 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12026)) mapDefault!39877)))))

(declare-fun b!1067557 () Bool)

(assert (=> b!1067557 (= e!608815 tp_is_empty!25459)))

(declare-fun mapIsEmpty!39877 () Bool)

(assert (=> mapIsEmpty!39877 mapRes!39877))

(declare-fun res!712166 () Bool)

(assert (=> start!94522 (=> (not res!712166) (not e!608813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94522 (= res!712166 (validMask!0 mask!1515))))

(assert (=> start!94522 e!608813))

(assert (=> start!94522 true))

(assert (=> start!94522 tp_is_empty!25459))

(declare-fun array_inv!25318 (array!67951) Bool)

(assert (=> start!94522 (and (array_inv!25318 _values!955) e!608814)))

(assert (=> start!94522 tp!76387))

(declare-fun array_inv!25319 (array!67953) Bool)

(assert (=> start!94522 (array_inv!25319 _keys!1163)))

(declare-fun b!1067558 () Bool)

(declare-fun e!608810 () Bool)

(assert (=> b!1067558 (= e!608813 (not e!608810))))

(declare-fun res!712167 () Bool)

(assert (=> b!1067558 (=> res!712167 e!608810)))

(assert (=> b!1067558 (= res!712167 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16188 0))(
  ( (tuple2!16189 (_1!8105 (_ BitVec 64)) (_2!8105 V!39081)) )
))
(declare-datatypes ((List!22757 0))(
  ( (Nil!22754) (Cons!22753 (h!23971 tuple2!16188) (t!32070 List!22757)) )
))
(declare-datatypes ((ListLongMap!14165 0))(
  ( (ListLongMap!14166 (toList!7098 List!22757)) )
))
(declare-fun lt!471105 () ListLongMap!14165)

(declare-fun lt!471110 () ListLongMap!14165)

(assert (=> b!1067558 (= lt!471105 lt!471110)))

(declare-fun zeroValueBefore!47 () V!39081)

(declare-fun minValue!907 () V!39081)

(declare-datatypes ((Unit!34992 0))(
  ( (Unit!34993) )
))
(declare-fun lt!471108 () Unit!34992)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39081)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!723 (array!67953 array!67951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 V!39081 V!39081 (_ BitVec 32) Int) Unit!34992)

(assert (=> b!1067558 (= lt!471108 (lemmaNoChangeToArrayThenSameMapNoExtras!723 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3720 (array!67953 array!67951 (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 (_ BitVec 32) Int) ListLongMap!14165)

(assert (=> b!1067558 (= lt!471110 (getCurrentListMapNoExtraKeys!3720 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067558 (= lt!471105 (getCurrentListMapNoExtraKeys!3720 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067559 () Bool)

(assert (=> b!1067559 (= e!608810 true)))

(declare-fun lt!471106 () ListLongMap!14165)

(declare-fun lt!471104 () ListLongMap!14165)

(declare-fun -!614 (ListLongMap!14165 (_ BitVec 64)) ListLongMap!14165)

(assert (=> b!1067559 (= lt!471106 (-!614 lt!471104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471109 () ListLongMap!14165)

(assert (=> b!1067559 (= (-!614 lt!471109 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471105)))

(declare-fun lt!471103 () Unit!34992)

(declare-fun addThenRemoveForNewKeyIsSame!24 (ListLongMap!14165 (_ BitVec 64) V!39081) Unit!34992)

(assert (=> b!1067559 (= lt!471103 (addThenRemoveForNewKeyIsSame!24 lt!471105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471107 () ListLongMap!14165)

(assert (=> b!1067559 (and (= lt!471104 lt!471109) (= lt!471107 lt!471110))))

(declare-fun +!3167 (ListLongMap!14165 tuple2!16188) ListLongMap!14165)

(assert (=> b!1067559 (= lt!471109 (+!3167 lt!471105 (tuple2!16189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4048 (array!67953 array!67951 (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 (_ BitVec 32) Int) ListLongMap!14165)

(assert (=> b!1067559 (= lt!471107 (getCurrentListMap!4048 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067559 (= lt!471104 (getCurrentListMap!4048 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94522 res!712166) b!1067552))

(assert (= (and b!1067552 res!712165) b!1067554))

(assert (= (and b!1067554 res!712164) b!1067553))

(assert (= (and b!1067553 res!712168) b!1067558))

(assert (= (and b!1067558 (not res!712167)) b!1067559))

(assert (= (and b!1067556 condMapEmpty!39877) mapIsEmpty!39877))

(assert (= (and b!1067556 (not condMapEmpty!39877)) mapNonEmpty!39877))

(get-info :version)

(assert (= (and mapNonEmpty!39877 ((_ is ValueCellFull!12026) mapValue!39877)) b!1067557))

(assert (= (and b!1067556 ((_ is ValueCellFull!12026) mapDefault!39877)) b!1067555))

(assert (= start!94522 b!1067556))

(declare-fun m!986505 () Bool)

(assert (=> b!1067559 m!986505))

(declare-fun m!986507 () Bool)

(assert (=> b!1067559 m!986507))

(declare-fun m!986509 () Bool)

(assert (=> b!1067559 m!986509))

(declare-fun m!986511 () Bool)

(assert (=> b!1067559 m!986511))

(declare-fun m!986513 () Bool)

(assert (=> b!1067559 m!986513))

(declare-fun m!986515 () Bool)

(assert (=> b!1067559 m!986515))

(declare-fun m!986517 () Bool)

(assert (=> b!1067554 m!986517))

(declare-fun m!986519 () Bool)

(assert (=> mapNonEmpty!39877 m!986519))

(declare-fun m!986521 () Bool)

(assert (=> start!94522 m!986521))

(declare-fun m!986523 () Bool)

(assert (=> start!94522 m!986523))

(declare-fun m!986525 () Bool)

(assert (=> start!94522 m!986525))

(declare-fun m!986527 () Bool)

(assert (=> b!1067553 m!986527))

(declare-fun m!986529 () Bool)

(assert (=> b!1067558 m!986529))

(declare-fun m!986531 () Bool)

(assert (=> b!1067558 m!986531))

(declare-fun m!986533 () Bool)

(assert (=> b!1067558 m!986533))

(check-sat (not b_next!21649) (not start!94522) (not b!1067559) (not b!1067558) (not mapNonEmpty!39877) (not b!1067553) (not b!1067554) b_and!34431 tp_is_empty!25459)
(check-sat b_and!34431 (not b_next!21649))
