; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94764 () Bool)

(assert start!94764)

(declare-fun b_free!22017 () Bool)

(declare-fun b_next!22017 () Bool)

(assert (=> start!94764 (= b_free!22017 (not b_next!22017))))

(declare-fun tp!77509 () Bool)

(declare-fun b_and!34847 () Bool)

(assert (=> start!94764 (= tp!77509 b_and!34847)))

(declare-fun b!1071534 () Bool)

(declare-fun e!611868 () Bool)

(declare-fun tp_is_empty!25827 () Bool)

(assert (=> b!1071534 (= e!611868 tp_is_empty!25827)))

(declare-fun mapNonEmpty!40447 () Bool)

(declare-fun mapRes!40447 () Bool)

(declare-fun tp!77510 () Bool)

(assert (=> mapNonEmpty!40447 (= mapRes!40447 (and tp!77510 e!611868))))

(declare-datatypes ((V!39571 0))(
  ( (V!39572 (val!12964 Int)) )
))
(declare-datatypes ((ValueCell!12210 0))(
  ( (ValueCellFull!12210 (v!15580 V!39571)) (EmptyCell!12210) )
))
(declare-fun mapValue!40447 () ValueCell!12210)

(declare-fun mapRest!40447 () (Array (_ BitVec 32) ValueCell!12210))

(declare-datatypes ((array!68627 0))(
  ( (array!68628 (arr!33009 (Array (_ BitVec 32) ValueCell!12210)) (size!33545 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68627)

(declare-fun mapKey!40447 () (_ BitVec 32))

(assert (=> mapNonEmpty!40447 (= (arr!33009 _values!955) (store mapRest!40447 mapKey!40447 mapValue!40447))))

(declare-fun b!1071535 () Bool)

(declare-fun e!611870 () Bool)

(declare-fun e!611869 () Bool)

(assert (=> b!1071535 (= e!611870 (not e!611869))))

(declare-fun res!714807 () Bool)

(assert (=> b!1071535 (=> res!714807 e!611869)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071535 (= res!714807 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16502 0))(
  ( (tuple2!16503 (_1!8262 (_ BitVec 64)) (_2!8262 V!39571)) )
))
(declare-datatypes ((List!23041 0))(
  ( (Nil!23038) (Cons!23037 (h!24246 tuple2!16502) (t!32374 List!23041)) )
))
(declare-datatypes ((ListLongMap!14471 0))(
  ( (ListLongMap!14472 (toList!7251 List!23041)) )
))
(declare-fun lt!474224 () ListLongMap!14471)

(declare-fun lt!474227 () ListLongMap!14471)

(assert (=> b!1071535 (= lt!474224 lt!474227)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39571)

(declare-datatypes ((Unit!35298 0))(
  ( (Unit!35299) )
))
(declare-fun lt!474216 () Unit!35298)

(declare-fun minValue!907 () V!39571)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39571)

(declare-datatypes ((array!68629 0))(
  ( (array!68630 (arr!33010 (Array (_ BitVec 32) (_ BitVec 64))) (size!33546 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68629)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!858 (array!68629 array!68627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39571 V!39571 V!39571 V!39571 (_ BitVec 32) Int) Unit!35298)

(assert (=> b!1071535 (= lt!474216 (lemmaNoChangeToArrayThenSameMapNoExtras!858 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3821 (array!68629 array!68627 (_ BitVec 32) (_ BitVec 32) V!39571 V!39571 (_ BitVec 32) Int) ListLongMap!14471)

(assert (=> b!1071535 (= lt!474227 (getCurrentListMapNoExtraKeys!3821 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071535 (= lt!474224 (getCurrentListMapNoExtraKeys!3821 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071536 () Bool)

(declare-fun e!611872 () Bool)

(assert (=> b!1071536 (= e!611872 tp_is_empty!25827)))

(declare-fun b!1071537 () Bool)

(declare-fun res!714806 () Bool)

(assert (=> b!1071537 (=> (not res!714806) (not e!611870))))

(assert (=> b!1071537 (= res!714806 (and (= (size!33545 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33546 _keys!1163) (size!33545 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071538 () Bool)

(declare-fun e!611873 () Bool)

(assert (=> b!1071538 (= e!611873 (and e!611872 mapRes!40447))))

(declare-fun condMapEmpty!40447 () Bool)

(declare-fun mapDefault!40447 () ValueCell!12210)

(assert (=> b!1071538 (= condMapEmpty!40447 (= (arr!33009 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12210)) mapDefault!40447)))))

(declare-fun b!1071540 () Bool)

(assert (=> b!1071540 (= e!611869 true)))

(declare-fun lt!474218 () ListLongMap!14471)

(declare-fun lt!474217 () ListLongMap!14471)

(declare-fun -!684 (ListLongMap!14471 (_ BitVec 64)) ListLongMap!14471)

(assert (=> b!1071540 (= lt!474218 (-!684 lt!474217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474220 () ListLongMap!14471)

(declare-fun lt!474222 () ListLongMap!14471)

(assert (=> b!1071540 (= lt!474220 lt!474222)))

(declare-fun lt!474215 () Unit!35298)

(declare-fun addCommutativeForDiffKeys!729 (ListLongMap!14471 (_ BitVec 64) V!39571 (_ BitVec 64) V!39571) Unit!35298)

(assert (=> b!1071540 (= lt!474215 (addCommutativeForDiffKeys!729 lt!474224 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474225 () ListLongMap!14471)

(assert (=> b!1071540 (= (-!684 lt!474222 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474225)))

(declare-fun lt!474221 () tuple2!16502)

(declare-fun +!3186 (ListLongMap!14471 tuple2!16502) ListLongMap!14471)

(assert (=> b!1071540 (= lt!474222 (+!3186 lt!474225 lt!474221))))

(declare-fun lt!474219 () Unit!35298)

(declare-fun addThenRemoveForNewKeyIsSame!54 (ListLongMap!14471 (_ BitVec 64) V!39571) Unit!35298)

(assert (=> b!1071540 (= lt!474219 (addThenRemoveForNewKeyIsSame!54 lt!474225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474226 () tuple2!16502)

(assert (=> b!1071540 (= lt!474225 (+!3186 lt!474224 lt!474226))))

(declare-fun e!611871 () Bool)

(assert (=> b!1071540 e!611871))

(declare-fun res!714808 () Bool)

(assert (=> b!1071540 (=> (not res!714808) (not e!611871))))

(assert (=> b!1071540 (= res!714808 (= lt!474217 lt!474220))))

(assert (=> b!1071540 (= lt!474220 (+!3186 (+!3186 lt!474224 lt!474221) lt!474226))))

(assert (=> b!1071540 (= lt!474226 (tuple2!16503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071540 (= lt!474221 (tuple2!16503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474223 () ListLongMap!14471)

(declare-fun getCurrentListMap!4150 (array!68629 array!68627 (_ BitVec 32) (_ BitVec 32) V!39571 V!39571 (_ BitVec 32) Int) ListLongMap!14471)

(assert (=> b!1071540 (= lt!474223 (getCurrentListMap!4150 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071540 (= lt!474217 (getCurrentListMap!4150 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071541 () Bool)

(assert (=> b!1071541 (= e!611871 (= lt!474223 (+!3186 lt!474227 lt!474226)))))

(declare-fun b!1071542 () Bool)

(declare-fun res!714805 () Bool)

(assert (=> b!1071542 (=> (not res!714805) (not e!611870))))

(declare-datatypes ((List!23042 0))(
  ( (Nil!23039) (Cons!23038 (h!24247 (_ BitVec 64)) (t!32375 List!23042)) )
))
(declare-fun arrayNoDuplicates!0 (array!68629 (_ BitVec 32) List!23042) Bool)

(assert (=> b!1071542 (= res!714805 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23039))))

(declare-fun mapIsEmpty!40447 () Bool)

(assert (=> mapIsEmpty!40447 mapRes!40447))

(declare-fun res!714803 () Bool)

(assert (=> start!94764 (=> (not res!714803) (not e!611870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94764 (= res!714803 (validMask!0 mask!1515))))

(assert (=> start!94764 e!611870))

(assert (=> start!94764 true))

(assert (=> start!94764 tp_is_empty!25827))

(declare-fun array_inv!25526 (array!68627) Bool)

(assert (=> start!94764 (and (array_inv!25526 _values!955) e!611873)))

(assert (=> start!94764 tp!77509))

(declare-fun array_inv!25527 (array!68629) Bool)

(assert (=> start!94764 (array_inv!25527 _keys!1163)))

(declare-fun b!1071539 () Bool)

(declare-fun res!714804 () Bool)

(assert (=> b!1071539 (=> (not res!714804) (not e!611870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68629 (_ BitVec 32)) Bool)

(assert (=> b!1071539 (= res!714804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94764 res!714803) b!1071537))

(assert (= (and b!1071537 res!714806) b!1071539))

(assert (= (and b!1071539 res!714804) b!1071542))

(assert (= (and b!1071542 res!714805) b!1071535))

(assert (= (and b!1071535 (not res!714807)) b!1071540))

(assert (= (and b!1071540 res!714808) b!1071541))

(assert (= (and b!1071538 condMapEmpty!40447) mapIsEmpty!40447))

(assert (= (and b!1071538 (not condMapEmpty!40447)) mapNonEmpty!40447))

(get-info :version)

(assert (= (and mapNonEmpty!40447 ((_ is ValueCellFull!12210) mapValue!40447)) b!1071534))

(assert (= (and b!1071538 ((_ is ValueCellFull!12210) mapDefault!40447)) b!1071536))

(assert (= start!94764 b!1071538))

(declare-fun m!990089 () Bool)

(assert (=> start!94764 m!990089))

(declare-fun m!990091 () Bool)

(assert (=> start!94764 m!990091))

(declare-fun m!990093 () Bool)

(assert (=> start!94764 m!990093))

(declare-fun m!990095 () Bool)

(assert (=> b!1071540 m!990095))

(declare-fun m!990097 () Bool)

(assert (=> b!1071540 m!990097))

(declare-fun m!990099 () Bool)

(assert (=> b!1071540 m!990099))

(declare-fun m!990101 () Bool)

(assert (=> b!1071540 m!990101))

(declare-fun m!990103 () Bool)

(assert (=> b!1071540 m!990103))

(declare-fun m!990105 () Bool)

(assert (=> b!1071540 m!990105))

(declare-fun m!990107 () Bool)

(assert (=> b!1071540 m!990107))

(assert (=> b!1071540 m!990107))

(declare-fun m!990109 () Bool)

(assert (=> b!1071540 m!990109))

(declare-fun m!990111 () Bool)

(assert (=> b!1071540 m!990111))

(declare-fun m!990113 () Bool)

(assert (=> b!1071540 m!990113))

(declare-fun m!990115 () Bool)

(assert (=> b!1071535 m!990115))

(declare-fun m!990117 () Bool)

(assert (=> b!1071535 m!990117))

(declare-fun m!990119 () Bool)

(assert (=> b!1071535 m!990119))

(declare-fun m!990121 () Bool)

(assert (=> b!1071541 m!990121))

(declare-fun m!990123 () Bool)

(assert (=> mapNonEmpty!40447 m!990123))

(declare-fun m!990125 () Bool)

(assert (=> b!1071539 m!990125))

(declare-fun m!990127 () Bool)

(assert (=> b!1071542 m!990127))

(check-sat (not b_next!22017) (not mapNonEmpty!40447) (not b!1071542) tp_is_empty!25827 (not b!1071539) (not b!1071535) b_and!34847 (not start!94764) (not b!1071541) (not b!1071540))
(check-sat b_and!34847 (not b_next!22017))
