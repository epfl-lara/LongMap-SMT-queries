; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94432 () Bool)

(assert start!94432)

(declare-fun b_free!21759 () Bool)

(declare-fun b_next!21759 () Bool)

(assert (=> start!94432 (= b_free!21759 (not b_next!21759))))

(declare-fun tp!76723 () Bool)

(declare-fun b_and!34551 () Bool)

(assert (=> start!94432 (= tp!76723 b_and!34551)))

(declare-fun b!1067747 () Bool)

(declare-fun e!609056 () Bool)

(declare-fun e!609052 () Bool)

(assert (=> b!1067747 (= e!609056 (not e!609052))))

(declare-fun res!712515 () Bool)

(assert (=> b!1067747 (=> res!712515 e!609052)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067747 (= res!712515 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39227 0))(
  ( (V!39228 (val!12835 Int)) )
))
(declare-datatypes ((tuple2!16292 0))(
  ( (tuple2!16293 (_1!8157 (_ BitVec 64)) (_2!8157 V!39227)) )
))
(declare-datatypes ((List!22848 0))(
  ( (Nil!22845) (Cons!22844 (h!24053 tuple2!16292) (t!32173 List!22848)) )
))
(declare-datatypes ((ListLongMap!14261 0))(
  ( (ListLongMap!14262 (toList!7146 List!22848)) )
))
(declare-fun lt!471605 () ListLongMap!14261)

(declare-fun lt!471604 () ListLongMap!14261)

(assert (=> b!1067747 (= lt!471605 lt!471604)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39227)

(declare-datatypes ((ValueCell!12081 0))(
  ( (ValueCellFull!12081 (v!15449 V!39227)) (EmptyCell!12081) )
))
(declare-datatypes ((array!68121 0))(
  ( (array!68122 (arr!32760 (Array (_ BitVec 32) ValueCell!12081)) (size!33296 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68121)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39227)

(declare-fun minValue!907 () V!39227)

(declare-datatypes ((Unit!35089 0))(
  ( (Unit!35090) )
))
(declare-fun lt!471607 () Unit!35089)

(declare-datatypes ((array!68123 0))(
  ( (array!68124 (arr!32761 (Array (_ BitVec 32) (_ BitVec 64))) (size!33297 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68123)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!766 (array!68123 array!68121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39227 V!39227 V!39227 V!39227 (_ BitVec 32) Int) Unit!35089)

(assert (=> b!1067747 (= lt!471607 (lemmaNoChangeToArrayThenSameMapNoExtras!766 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3729 (array!68123 array!68121 (_ BitVec 32) (_ BitVec 32) V!39227 V!39227 (_ BitVec 32) Int) ListLongMap!14261)

(assert (=> b!1067747 (= lt!471604 (getCurrentListMapNoExtraKeys!3729 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067747 (= lt!471605 (getCurrentListMapNoExtraKeys!3729 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067748 () Bool)

(declare-fun e!609058 () Bool)

(declare-fun tp_is_empty!25569 () Bool)

(assert (=> b!1067748 (= e!609058 tp_is_empty!25569)))

(declare-fun b!1067749 () Bool)

(declare-fun e!609054 () Bool)

(assert (=> b!1067749 (= e!609054 tp_is_empty!25569)))

(declare-fun b!1067750 () Bool)

(declare-fun e!609057 () Bool)

(assert (=> b!1067750 (= e!609052 e!609057)))

(declare-fun res!712516 () Bool)

(assert (=> b!1067750 (=> res!712516 e!609057)))

(declare-fun lt!471603 () ListLongMap!14261)

(declare-fun contains!6282 (ListLongMap!14261 (_ BitVec 64)) Bool)

(assert (=> b!1067750 (= res!712516 (contains!6282 lt!471603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4079 (array!68123 array!68121 (_ BitVec 32) (_ BitVec 32) V!39227 V!39227 (_ BitVec 32) Int) ListLongMap!14261)

(assert (=> b!1067750 (= lt!471603 (getCurrentListMap!4079 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067751 () Bool)

(declare-fun res!712513 () Bool)

(assert (=> b!1067751 (=> (not res!712513) (not e!609056))))

(assert (=> b!1067751 (= res!712513 (and (= (size!33296 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33297 _keys!1163) (size!33296 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067752 () Bool)

(assert (=> b!1067752 (= e!609057 true)))

(declare-fun -!632 (ListLongMap!14261 (_ BitVec 64)) ListLongMap!14261)

(assert (=> b!1067752 (= (-!632 lt!471603 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471603)))

(declare-fun lt!471606 () Unit!35089)

(declare-fun removeNotPresentStillSame!42 (ListLongMap!14261 (_ BitVec 64)) Unit!35089)

(assert (=> b!1067752 (= lt!471606 (removeNotPresentStillSame!42 lt!471603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067753 () Bool)

(declare-fun res!712518 () Bool)

(assert (=> b!1067753 (=> (not res!712518) (not e!609056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68123 (_ BitVec 32)) Bool)

(assert (=> b!1067753 (= res!712518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40048 () Bool)

(declare-fun mapRes!40048 () Bool)

(declare-fun tp!76724 () Bool)

(assert (=> mapNonEmpty!40048 (= mapRes!40048 (and tp!76724 e!609054))))

(declare-fun mapValue!40048 () ValueCell!12081)

(declare-fun mapKey!40048 () (_ BitVec 32))

(declare-fun mapRest!40048 () (Array (_ BitVec 32) ValueCell!12081))

(assert (=> mapNonEmpty!40048 (= (arr!32760 _values!955) (store mapRest!40048 mapKey!40048 mapValue!40048))))

(declare-fun b!1067754 () Bool)

(declare-fun res!712517 () Bool)

(assert (=> b!1067754 (=> (not res!712517) (not e!609056))))

(declare-datatypes ((List!22849 0))(
  ( (Nil!22846) (Cons!22845 (h!24054 (_ BitVec 64)) (t!32174 List!22849)) )
))
(declare-fun arrayNoDuplicates!0 (array!68123 (_ BitVec 32) List!22849) Bool)

(assert (=> b!1067754 (= res!712517 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22846))))

(declare-fun b!1067755 () Bool)

(declare-fun e!609055 () Bool)

(assert (=> b!1067755 (= e!609055 (and e!609058 mapRes!40048))))

(declare-fun condMapEmpty!40048 () Bool)

(declare-fun mapDefault!40048 () ValueCell!12081)

(assert (=> b!1067755 (= condMapEmpty!40048 (= (arr!32760 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12081)) mapDefault!40048)))))

(declare-fun mapIsEmpty!40048 () Bool)

(assert (=> mapIsEmpty!40048 mapRes!40048))

(declare-fun res!712514 () Bool)

(assert (=> start!94432 (=> (not res!712514) (not e!609056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94432 (= res!712514 (validMask!0 mask!1515))))

(assert (=> start!94432 e!609056))

(assert (=> start!94432 true))

(assert (=> start!94432 tp_is_empty!25569))

(declare-fun array_inv!25362 (array!68121) Bool)

(assert (=> start!94432 (and (array_inv!25362 _values!955) e!609055)))

(assert (=> start!94432 tp!76723))

(declare-fun array_inv!25363 (array!68123) Bool)

(assert (=> start!94432 (array_inv!25363 _keys!1163)))

(assert (= (and start!94432 res!712514) b!1067751))

(assert (= (and b!1067751 res!712513) b!1067753))

(assert (= (and b!1067753 res!712518) b!1067754))

(assert (= (and b!1067754 res!712517) b!1067747))

(assert (= (and b!1067747 (not res!712515)) b!1067750))

(assert (= (and b!1067750 (not res!712516)) b!1067752))

(assert (= (and b!1067755 condMapEmpty!40048) mapIsEmpty!40048))

(assert (= (and b!1067755 (not condMapEmpty!40048)) mapNonEmpty!40048))

(get-info :version)

(assert (= (and mapNonEmpty!40048 ((_ is ValueCellFull!12081) mapValue!40048)) b!1067749))

(assert (= (and b!1067755 ((_ is ValueCellFull!12081) mapDefault!40048)) b!1067748))

(assert (= start!94432 b!1067755))

(declare-fun m!986369 () Bool)

(assert (=> start!94432 m!986369))

(declare-fun m!986371 () Bool)

(assert (=> start!94432 m!986371))

(declare-fun m!986373 () Bool)

(assert (=> start!94432 m!986373))

(declare-fun m!986375 () Bool)

(assert (=> b!1067753 m!986375))

(declare-fun m!986377 () Bool)

(assert (=> b!1067752 m!986377))

(declare-fun m!986379 () Bool)

(assert (=> b!1067752 m!986379))

(declare-fun m!986381 () Bool)

(assert (=> b!1067747 m!986381))

(declare-fun m!986383 () Bool)

(assert (=> b!1067747 m!986383))

(declare-fun m!986385 () Bool)

(assert (=> b!1067747 m!986385))

(declare-fun m!986387 () Bool)

(assert (=> mapNonEmpty!40048 m!986387))

(declare-fun m!986389 () Bool)

(assert (=> b!1067754 m!986389))

(declare-fun m!986391 () Bool)

(assert (=> b!1067750 m!986391))

(declare-fun m!986393 () Bool)

(assert (=> b!1067750 m!986393))

(check-sat (not start!94432) b_and!34551 (not b!1067753) (not mapNonEmpty!40048) tp_is_empty!25569 (not b!1067754) (not b_next!21759) (not b!1067750) (not b!1067752) (not b!1067747))
(check-sat b_and!34551 (not b_next!21759))
