; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94212 () Bool)

(assert start!94212)

(declare-fun b_free!21597 () Bool)

(declare-fun b_next!21597 () Bool)

(assert (=> start!94212 (= b_free!21597 (not b_next!21597))))

(declare-fun tp!76228 () Bool)

(declare-fun b_and!34357 () Bool)

(assert (=> start!94212 (= tp!76228 b_and!34357)))

(declare-fun b!1065418 () Bool)

(declare-fun e!607371 () Bool)

(declare-fun e!607373 () Bool)

(assert (=> b!1065418 (= e!607371 (not e!607373))))

(declare-fun res!711171 () Bool)

(assert (=> b!1065418 (=> res!711171 e!607373)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065418 (= res!711171 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39011 0))(
  ( (V!39012 (val!12754 Int)) )
))
(declare-datatypes ((tuple2!16164 0))(
  ( (tuple2!16165 (_1!8093 (_ BitVec 64)) (_2!8093 V!39011)) )
))
(declare-datatypes ((List!22732 0))(
  ( (Nil!22729) (Cons!22728 (h!23937 tuple2!16164) (t!32051 List!22732)) )
))
(declare-datatypes ((ListLongMap!14133 0))(
  ( (ListLongMap!14134 (toList!7082 List!22732)) )
))
(declare-fun lt!469833 () ListLongMap!14133)

(declare-fun lt!469829 () ListLongMap!14133)

(assert (=> b!1065418 (= lt!469833 lt!469829)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!34957 0))(
  ( (Unit!34958) )
))
(declare-fun lt!469832 () Unit!34957)

(declare-fun zeroValueBefore!47 () V!39011)

(declare-datatypes ((ValueCell!12000 0))(
  ( (ValueCellFull!12000 (v!15366 V!39011)) (EmptyCell!12000) )
))
(declare-datatypes ((array!67801 0))(
  ( (array!67802 (arr!32603 (Array (_ BitVec 32) ValueCell!12000)) (size!33139 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67801)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39011)

(declare-fun minValue!907 () V!39011)

(declare-datatypes ((array!67803 0))(
  ( (array!67804 (arr!32604 (Array (_ BitVec 32) (_ BitVec 64))) (size!33140 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67803)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!707 (array!67803 array!67801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39011 V!39011 V!39011 V!39011 (_ BitVec 32) Int) Unit!34957)

(assert (=> b!1065418 (= lt!469832 (lemmaNoChangeToArrayThenSameMapNoExtras!707 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3670 (array!67803 array!67801 (_ BitVec 32) (_ BitVec 32) V!39011 V!39011 (_ BitVec 32) Int) ListLongMap!14133)

(assert (=> b!1065418 (= lt!469829 (getCurrentListMapNoExtraKeys!3670 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065418 (= lt!469833 (getCurrentListMapNoExtraKeys!3670 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065419 () Bool)

(assert (=> b!1065419 (= e!607373 true)))

(declare-fun lt!469828 () ListLongMap!14133)

(declare-fun lt!469831 () ListLongMap!14133)

(declare-fun -!597 (ListLongMap!14133 (_ BitVec 64)) ListLongMap!14133)

(assert (=> b!1065419 (= lt!469828 (-!597 lt!469831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469830 () ListLongMap!14133)

(assert (=> b!1065419 (= (-!597 lt!469830 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469833)))

(declare-fun lt!469826 () Unit!34957)

(declare-fun addThenRemoveForNewKeyIsSame!6 (ListLongMap!14133 (_ BitVec 64) V!39011) Unit!34957)

(assert (=> b!1065419 (= lt!469826 (addThenRemoveForNewKeyIsSame!6 lt!469833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469827 () ListLongMap!14133)

(assert (=> b!1065419 (and (= lt!469831 lt!469830) (= lt!469827 lt!469829))))

(declare-fun +!3128 (ListLongMap!14133 tuple2!16164) ListLongMap!14133)

(assert (=> b!1065419 (= lt!469830 (+!3128 lt!469833 (tuple2!16165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4041 (array!67803 array!67801 (_ BitVec 32) (_ BitVec 32) V!39011 V!39011 (_ BitVec 32) Int) ListLongMap!14133)

(assert (=> b!1065419 (= lt!469827 (getCurrentListMap!4041 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065419 (= lt!469831 (getCurrentListMap!4041 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39796 () Bool)

(declare-fun mapRes!39796 () Bool)

(declare-fun tp!76229 () Bool)

(declare-fun e!607372 () Bool)

(assert (=> mapNonEmpty!39796 (= mapRes!39796 (and tp!76229 e!607372))))

(declare-fun mapRest!39796 () (Array (_ BitVec 32) ValueCell!12000))

(declare-fun mapKey!39796 () (_ BitVec 32))

(declare-fun mapValue!39796 () ValueCell!12000)

(assert (=> mapNonEmpty!39796 (= (arr!32603 _values!955) (store mapRest!39796 mapKey!39796 mapValue!39796))))

(declare-fun b!1065420 () Bool)

(declare-fun e!607369 () Bool)

(declare-fun tp_is_empty!25407 () Bool)

(assert (=> b!1065420 (= e!607369 tp_is_empty!25407)))

(declare-fun b!1065421 () Bool)

(assert (=> b!1065421 (= e!607372 tp_is_empty!25407)))

(declare-fun b!1065422 () Bool)

(declare-fun res!711172 () Bool)

(assert (=> b!1065422 (=> (not res!711172) (not e!607371))))

(assert (=> b!1065422 (= res!711172 (and (= (size!33139 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33140 _keys!1163) (size!33139 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065423 () Bool)

(declare-fun res!711170 () Bool)

(assert (=> b!1065423 (=> (not res!711170) (not e!607371))))

(declare-datatypes ((List!22733 0))(
  ( (Nil!22730) (Cons!22729 (h!23938 (_ BitVec 64)) (t!32052 List!22733)) )
))
(declare-fun arrayNoDuplicates!0 (array!67803 (_ BitVec 32) List!22733) Bool)

(assert (=> b!1065423 (= res!711170 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22730))))

(declare-fun b!1065417 () Bool)

(declare-fun e!607370 () Bool)

(assert (=> b!1065417 (= e!607370 (and e!607369 mapRes!39796))))

(declare-fun condMapEmpty!39796 () Bool)

(declare-fun mapDefault!39796 () ValueCell!12000)

(assert (=> b!1065417 (= condMapEmpty!39796 (= (arr!32603 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12000)) mapDefault!39796)))))

(declare-fun res!711174 () Bool)

(assert (=> start!94212 (=> (not res!711174) (not e!607371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94212 (= res!711174 (validMask!0 mask!1515))))

(assert (=> start!94212 e!607371))

(assert (=> start!94212 true))

(assert (=> start!94212 tp_is_empty!25407))

(declare-fun array_inv!25246 (array!67801) Bool)

(assert (=> start!94212 (and (array_inv!25246 _values!955) e!607370)))

(assert (=> start!94212 tp!76228))

(declare-fun array_inv!25247 (array!67803) Bool)

(assert (=> start!94212 (array_inv!25247 _keys!1163)))

(declare-fun mapIsEmpty!39796 () Bool)

(assert (=> mapIsEmpty!39796 mapRes!39796))

(declare-fun b!1065424 () Bool)

(declare-fun res!711173 () Bool)

(assert (=> b!1065424 (=> (not res!711173) (not e!607371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67803 (_ BitVec 32)) Bool)

(assert (=> b!1065424 (= res!711173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94212 res!711174) b!1065422))

(assert (= (and b!1065422 res!711172) b!1065424))

(assert (= (and b!1065424 res!711173) b!1065423))

(assert (= (and b!1065423 res!711170) b!1065418))

(assert (= (and b!1065418 (not res!711171)) b!1065419))

(assert (= (and b!1065417 condMapEmpty!39796) mapIsEmpty!39796))

(assert (= (and b!1065417 (not condMapEmpty!39796)) mapNonEmpty!39796))

(get-info :version)

(assert (= (and mapNonEmpty!39796 ((_ is ValueCellFull!12000) mapValue!39796)) b!1065421))

(assert (= (and b!1065417 ((_ is ValueCellFull!12000) mapDefault!39796)) b!1065420))

(assert (= start!94212 b!1065417))

(declare-fun m!983869 () Bool)

(assert (=> b!1065424 m!983869))

(declare-fun m!983871 () Bool)

(assert (=> start!94212 m!983871))

(declare-fun m!983873 () Bool)

(assert (=> start!94212 m!983873))

(declare-fun m!983875 () Bool)

(assert (=> start!94212 m!983875))

(declare-fun m!983877 () Bool)

(assert (=> mapNonEmpty!39796 m!983877))

(declare-fun m!983879 () Bool)

(assert (=> b!1065423 m!983879))

(declare-fun m!983881 () Bool)

(assert (=> b!1065418 m!983881))

(declare-fun m!983883 () Bool)

(assert (=> b!1065418 m!983883))

(declare-fun m!983885 () Bool)

(assert (=> b!1065418 m!983885))

(declare-fun m!983887 () Bool)

(assert (=> b!1065419 m!983887))

(declare-fun m!983889 () Bool)

(assert (=> b!1065419 m!983889))

(declare-fun m!983891 () Bool)

(assert (=> b!1065419 m!983891))

(declare-fun m!983893 () Bool)

(assert (=> b!1065419 m!983893))

(declare-fun m!983895 () Bool)

(assert (=> b!1065419 m!983895))

(declare-fun m!983897 () Bool)

(assert (=> b!1065419 m!983897))

(check-sat b_and!34357 (not start!94212) (not mapNonEmpty!39796) (not b!1065424) (not b!1065419) (not b_next!21597) tp_is_empty!25407 (not b!1065423) (not b!1065418))
(check-sat b_and!34357 (not b_next!21597))
