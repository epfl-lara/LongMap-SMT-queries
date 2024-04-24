; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70680 () Bool)

(assert start!70680)

(declare-fun b_free!12841 () Bool)

(declare-fun b_next!12841 () Bool)

(assert (=> start!70680 (= b_free!12841 (not b_next!12841))))

(declare-fun tp!45256 () Bool)

(declare-fun b_and!21681 () Bool)

(assert (=> start!70680 (= tp!45256 b_and!21681)))

(declare-fun mapNonEmpty!23425 () Bool)

(declare-fun mapRes!23425 () Bool)

(declare-fun tp!45255 () Bool)

(declare-fun e!455406 () Bool)

(assert (=> mapNonEmpty!23425 (= mapRes!23425 (and tp!45255 e!455406))))

(declare-fun mapKey!23425 () (_ BitVec 32))

(declare-datatypes ((V!24403 0))(
  ( (V!24404 (val!7323 Int)) )
))
(declare-datatypes ((ValueCell!6860 0))(
  ( (ValueCellFull!6860 (v!9752 V!24403)) (EmptyCell!6860) )
))
(declare-fun mapValue!23425 () ValueCell!6860)

(declare-fun mapRest!23425 () (Array (_ BitVec 32) ValueCell!6860))

(declare-datatypes ((array!45301 0))(
  ( (array!45302 (arr!21700 (Array (_ BitVec 32) ValueCell!6860)) (size!22120 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45301)

(assert (=> mapNonEmpty!23425 (= (arr!21700 _values!788) (store mapRest!23425 mapKey!23425 mapValue!23425))))

(declare-fun res!559323 () Bool)

(declare-fun e!455407 () Bool)

(assert (=> start!70680 (=> (not res!559323) (not e!455407))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70680 (= res!559323 (validMask!0 mask!1312))))

(assert (=> start!70680 e!455407))

(declare-fun tp_is_empty!14551 () Bool)

(assert (=> start!70680 tp_is_empty!14551))

(declare-datatypes ((array!45303 0))(
  ( (array!45304 (arr!21701 (Array (_ BitVec 32) (_ BitVec 64))) (size!22121 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45303)

(declare-fun array_inv!17375 (array!45303) Bool)

(assert (=> start!70680 (array_inv!17375 _keys!976)))

(assert (=> start!70680 true))

(declare-fun e!455405 () Bool)

(declare-fun array_inv!17376 (array!45301) Bool)

(assert (=> start!70680 (and (array_inv!17376 _values!788) e!455405)))

(assert (=> start!70680 tp!45256))

(declare-fun b!820005 () Bool)

(declare-fun e!455403 () Bool)

(assert (=> b!820005 (= e!455403 tp_is_empty!14551)))

(declare-fun b!820006 () Bool)

(assert (=> b!820006 (= e!455406 tp_is_empty!14551)))

(declare-fun b!820007 () Bool)

(declare-fun res!559324 () Bool)

(assert (=> b!820007 (=> (not res!559324) (not e!455407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45303 (_ BitVec 32)) Bool)

(assert (=> b!820007 (= res!559324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820008 () Bool)

(declare-fun e!455402 () Bool)

(assert (=> b!820008 (= e!455407 (not e!455402))))

(declare-fun res!559320 () Bool)

(assert (=> b!820008 (=> res!559320 e!455402)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820008 (= res!559320 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9546 0))(
  ( (tuple2!9547 (_1!4784 (_ BitVec 64)) (_2!4784 V!24403)) )
))
(declare-datatypes ((List!15352 0))(
  ( (Nil!15349) (Cons!15348 (h!16483 tuple2!9546) (t!21673 List!15352)) )
))
(declare-datatypes ((ListLongMap!8371 0))(
  ( (ListLongMap!8372 (toList!4201 List!15352)) )
))
(declare-fun lt!367762 () ListLongMap!8371)

(declare-fun lt!367759 () ListLongMap!8371)

(assert (=> b!820008 (= lt!367762 lt!367759)))

(declare-fun zeroValueBefore!34 () V!24403)

(declare-fun zeroValueAfter!34 () V!24403)

(declare-fun minValue!754 () V!24403)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27952 0))(
  ( (Unit!27953) )
))
(declare-fun lt!367761 () Unit!27952)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!385 (array!45303 array!45301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24403 V!24403 V!24403 V!24403 (_ BitVec 32) Int) Unit!27952)

(assert (=> b!820008 (= lt!367761 (lemmaNoChangeToArrayThenSameMapNoExtras!385 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2297 (array!45303 array!45301 (_ BitVec 32) (_ BitVec 32) V!24403 V!24403 (_ BitVec 32) Int) ListLongMap!8371)

(assert (=> b!820008 (= lt!367759 (getCurrentListMapNoExtraKeys!2297 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820008 (= lt!367762 (getCurrentListMapNoExtraKeys!2297 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820009 () Bool)

(declare-fun res!559322 () Bool)

(assert (=> b!820009 (=> (not res!559322) (not e!455407))))

(declare-datatypes ((List!15353 0))(
  ( (Nil!15350) (Cons!15349 (h!16484 (_ BitVec 64)) (t!21674 List!15353)) )
))
(declare-fun arrayNoDuplicates!0 (array!45303 (_ BitVec 32) List!15353) Bool)

(assert (=> b!820009 (= res!559322 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15350))))

(declare-fun mapIsEmpty!23425 () Bool)

(assert (=> mapIsEmpty!23425 mapRes!23425))

(declare-fun b!820010 () Bool)

(declare-fun res!559319 () Bool)

(assert (=> b!820010 (=> (not res!559319) (not e!455407))))

(assert (=> b!820010 (= res!559319 (and (= (size!22120 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22121 _keys!976) (size!22120 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820011 () Bool)

(assert (=> b!820011 (= e!455405 (and e!455403 mapRes!23425))))

(declare-fun condMapEmpty!23425 () Bool)

(declare-fun mapDefault!23425 () ValueCell!6860)

(assert (=> b!820011 (= condMapEmpty!23425 (= (arr!21700 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6860)) mapDefault!23425)))))

(declare-fun b!820012 () Bool)

(assert (=> b!820012 (= e!455402 true)))

(declare-fun lt!367765 () ListLongMap!8371)

(declare-fun lt!367757 () tuple2!9546)

(declare-fun lt!367764 () tuple2!9546)

(declare-fun +!1839 (ListLongMap!8371 tuple2!9546) ListLongMap!8371)

(assert (=> b!820012 (= lt!367765 (+!1839 (+!1839 lt!367759 lt!367764) lt!367757))))

(declare-fun lt!367763 () ListLongMap!8371)

(assert (=> b!820012 (= (+!1839 lt!367762 lt!367757) (+!1839 lt!367763 lt!367757))))

(declare-fun lt!367760 () Unit!27952)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!178 (ListLongMap!8371 (_ BitVec 64) V!24403 V!24403) Unit!27952)

(assert (=> b!820012 (= lt!367760 (addSameAsAddTwiceSameKeyDiffValues!178 lt!367762 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820012 (= lt!367757 (tuple2!9547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455404 () Bool)

(assert (=> b!820012 e!455404))

(declare-fun res!559321 () Bool)

(assert (=> b!820012 (=> (not res!559321) (not e!455404))))

(declare-fun lt!367766 () ListLongMap!8371)

(assert (=> b!820012 (= res!559321 (= lt!367766 lt!367763))))

(assert (=> b!820012 (= lt!367763 (+!1839 lt!367762 lt!367764))))

(assert (=> b!820012 (= lt!367764 (tuple2!9547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!367758 () ListLongMap!8371)

(declare-fun getCurrentListMap!2391 (array!45303 array!45301 (_ BitVec 32) (_ BitVec 32) V!24403 V!24403 (_ BitVec 32) Int) ListLongMap!8371)

(assert (=> b!820012 (= lt!367758 (getCurrentListMap!2391 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820012 (= lt!367766 (getCurrentListMap!2391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820013 () Bool)

(assert (=> b!820013 (= e!455404 (= lt!367758 (+!1839 lt!367759 (tuple2!9547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70680 res!559323) b!820010))

(assert (= (and b!820010 res!559319) b!820007))

(assert (= (and b!820007 res!559324) b!820009))

(assert (= (and b!820009 res!559322) b!820008))

(assert (= (and b!820008 (not res!559320)) b!820012))

(assert (= (and b!820012 res!559321) b!820013))

(assert (= (and b!820011 condMapEmpty!23425) mapIsEmpty!23425))

(assert (= (and b!820011 (not condMapEmpty!23425)) mapNonEmpty!23425))

(get-info :version)

(assert (= (and mapNonEmpty!23425 ((_ is ValueCellFull!6860) mapValue!23425)) b!820006))

(assert (= (and b!820011 ((_ is ValueCellFull!6860) mapDefault!23425)) b!820005))

(assert (= start!70680 b!820011))

(declare-fun m!761927 () Bool)

(assert (=> start!70680 m!761927))

(declare-fun m!761929 () Bool)

(assert (=> start!70680 m!761929))

(declare-fun m!761931 () Bool)

(assert (=> start!70680 m!761931))

(declare-fun m!761933 () Bool)

(assert (=> b!820008 m!761933))

(declare-fun m!761935 () Bool)

(assert (=> b!820008 m!761935))

(declare-fun m!761937 () Bool)

(assert (=> b!820008 m!761937))

(declare-fun m!761939 () Bool)

(assert (=> b!820012 m!761939))

(declare-fun m!761941 () Bool)

(assert (=> b!820012 m!761941))

(declare-fun m!761943 () Bool)

(assert (=> b!820012 m!761943))

(declare-fun m!761945 () Bool)

(assert (=> b!820012 m!761945))

(declare-fun m!761947 () Bool)

(assert (=> b!820012 m!761947))

(declare-fun m!761949 () Bool)

(assert (=> b!820012 m!761949))

(declare-fun m!761951 () Bool)

(assert (=> b!820012 m!761951))

(assert (=> b!820012 m!761939))

(declare-fun m!761953 () Bool)

(assert (=> b!820012 m!761953))

(declare-fun m!761955 () Bool)

(assert (=> b!820009 m!761955))

(declare-fun m!761957 () Bool)

(assert (=> b!820013 m!761957))

(declare-fun m!761959 () Bool)

(assert (=> b!820007 m!761959))

(declare-fun m!761961 () Bool)

(assert (=> mapNonEmpty!23425 m!761961))

(check-sat tp_is_empty!14551 (not b!820009) (not b!820012) (not b!820008) (not b_next!12841) b_and!21681 (not b!820013) (not b!820007) (not start!70680) (not mapNonEmpty!23425))
(check-sat b_and!21681 (not b_next!12841))
