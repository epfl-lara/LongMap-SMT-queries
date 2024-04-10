; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94776 () Bool)

(assert start!94776)

(declare-fun b_free!22029 () Bool)

(declare-fun b_next!22029 () Bool)

(assert (=> start!94776 (= b_free!22029 (not b_next!22029))))

(declare-fun tp!77545 () Bool)

(declare-fun b_and!34859 () Bool)

(assert (=> start!94776 (= tp!77545 b_and!34859)))

(declare-fun b!1071701 () Bool)

(declare-fun e!612002 () Bool)

(declare-fun tp_is_empty!25839 () Bool)

(assert (=> b!1071701 (= e!612002 tp_is_empty!25839)))

(declare-fun mapNonEmpty!40465 () Bool)

(declare-fun mapRes!40465 () Bool)

(declare-fun tp!77546 () Bool)

(declare-fun e!612001 () Bool)

(assert (=> mapNonEmpty!40465 (= mapRes!40465 (and tp!77546 e!612001))))

(declare-fun mapKey!40465 () (_ BitVec 32))

(declare-datatypes ((V!39587 0))(
  ( (V!39588 (val!12970 Int)) )
))
(declare-datatypes ((ValueCell!12216 0))(
  ( (ValueCellFull!12216 (v!15586 V!39587)) (EmptyCell!12216) )
))
(declare-fun mapValue!40465 () ValueCell!12216)

(declare-datatypes ((array!68649 0))(
  ( (array!68650 (arr!33020 (Array (_ BitVec 32) ValueCell!12216)) (size!33556 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68649)

(declare-fun mapRest!40465 () (Array (_ BitVec 32) ValueCell!12216))

(assert (=> mapNonEmpty!40465 (= (arr!33020 _values!955) (store mapRest!40465 mapKey!40465 mapValue!40465))))

(declare-fun b!1071702 () Bool)

(assert (=> b!1071702 (= e!612001 tp_is_empty!25839)))

(declare-fun b!1071703 () Bool)

(declare-fun e!611999 () Bool)

(assert (=> b!1071703 (= e!611999 (and e!612002 mapRes!40465))))

(declare-fun condMapEmpty!40465 () Bool)

(declare-fun mapDefault!40465 () ValueCell!12216)

(assert (=> b!1071703 (= condMapEmpty!40465 (= (arr!33020 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12216)) mapDefault!40465)))))

(declare-fun b!1071704 () Bool)

(declare-fun e!612000 () Bool)

(declare-datatypes ((array!68651 0))(
  ( (array!68652 (arr!33021 (Array (_ BitVec 32) (_ BitVec 64))) (size!33557 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68651)

(assert (=> b!1071704 (= e!612000 (bvsle #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun b!1071705 () Bool)

(declare-fun res!714921 () Bool)

(declare-fun e!612004 () Bool)

(assert (=> b!1071705 (=> (not res!714921) (not e!612004))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071705 (= res!714921 (and (= (size!33556 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33557 _keys!1163) (size!33556 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071706 () Bool)

(declare-fun e!612003 () Bool)

(assert (=> b!1071706 (= e!612003 e!612000)))

(declare-fun res!714919 () Bool)

(assert (=> b!1071706 (=> res!714919 e!612000)))

(declare-datatypes ((tuple2!16514 0))(
  ( (tuple2!16515 (_1!8268 (_ BitVec 64)) (_2!8268 V!39587)) )
))
(declare-datatypes ((List!23050 0))(
  ( (Nil!23047) (Cons!23046 (h!24255 tuple2!16514) (t!32383 List!23050)) )
))
(declare-datatypes ((ListLongMap!14483 0))(
  ( (ListLongMap!14484 (toList!7257 List!23050)) )
))
(declare-fun lt!474445 () ListLongMap!14483)

(declare-fun lt!474449 () ListLongMap!14483)

(declare-fun -!688 (ListLongMap!14483 (_ BitVec 64)) ListLongMap!14483)

(assert (=> b!1071706 (= res!714919 (not (= (-!688 lt!474445 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474449)))))

(declare-fun lt!474447 () ListLongMap!14483)

(declare-fun lt!474446 () ListLongMap!14483)

(assert (=> b!1071706 (= lt!474447 lt!474446)))

(declare-datatypes ((Unit!35308 0))(
  ( (Unit!35309) )
))
(declare-fun lt!474448 () Unit!35308)

(declare-fun zeroValueBefore!47 () V!39587)

(declare-fun minValue!907 () V!39587)

(declare-fun lt!474455 () ListLongMap!14483)

(declare-fun addCommutativeForDiffKeys!733 (ListLongMap!14483 (_ BitVec 64) V!39587 (_ BitVec 64) V!39587) Unit!35308)

(assert (=> b!1071706 (= lt!474448 (addCommutativeForDiffKeys!733 lt!474455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474454 () ListLongMap!14483)

(assert (=> b!1071706 (= (-!688 lt!474446 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474454)))

(declare-fun lt!474450 () tuple2!16514)

(declare-fun +!3192 (ListLongMap!14483 tuple2!16514) ListLongMap!14483)

(assert (=> b!1071706 (= lt!474446 (+!3192 lt!474454 lt!474450))))

(declare-fun lt!474453 () Unit!35308)

(declare-fun addThenRemoveForNewKeyIsSame!58 (ListLongMap!14483 (_ BitVec 64) V!39587) Unit!35308)

(assert (=> b!1071706 (= lt!474453 (addThenRemoveForNewKeyIsSame!58 lt!474454 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474444 () tuple2!16514)

(assert (=> b!1071706 (= lt!474454 (+!3192 lt!474455 lt!474444))))

(declare-fun e!612005 () Bool)

(assert (=> b!1071706 e!612005))

(declare-fun res!714922 () Bool)

(assert (=> b!1071706 (=> (not res!714922) (not e!612005))))

(assert (=> b!1071706 (= res!714922 (= lt!474445 lt!474447))))

(assert (=> b!1071706 (= lt!474447 (+!3192 (+!3192 lt!474455 lt!474450) lt!474444))))

(assert (=> b!1071706 (= lt!474444 (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071706 (= lt!474450 (tuple2!16515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39587)

(declare-fun getCurrentListMap!4154 (array!68651 array!68649 (_ BitVec 32) (_ BitVec 32) V!39587 V!39587 (_ BitVec 32) Int) ListLongMap!14483)

(assert (=> b!1071706 (= lt!474449 (getCurrentListMap!4154 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071706 (= lt!474445 (getCurrentListMap!4154 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071707 () Bool)

(declare-fun res!714917 () Bool)

(assert (=> b!1071707 (=> (not res!714917) (not e!612004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68651 (_ BitVec 32)) Bool)

(assert (=> b!1071707 (= res!714917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071708 () Bool)

(assert (=> b!1071708 (= e!612004 (not e!612003))))

(declare-fun res!714920 () Bool)

(assert (=> b!1071708 (=> res!714920 e!612003)))

(assert (=> b!1071708 (= res!714920 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!474451 () ListLongMap!14483)

(assert (=> b!1071708 (= lt!474455 lt!474451)))

(declare-fun lt!474452 () Unit!35308)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!861 (array!68651 array!68649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39587 V!39587 V!39587 V!39587 (_ BitVec 32) Int) Unit!35308)

(assert (=> b!1071708 (= lt!474452 (lemmaNoChangeToArrayThenSameMapNoExtras!861 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3824 (array!68651 array!68649 (_ BitVec 32) (_ BitVec 32) V!39587 V!39587 (_ BitVec 32) Int) ListLongMap!14483)

(assert (=> b!1071708 (= lt!474451 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071708 (= lt!474455 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!714918 () Bool)

(assert (=> start!94776 (=> (not res!714918) (not e!612004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94776 (= res!714918 (validMask!0 mask!1515))))

(assert (=> start!94776 e!612004))

(assert (=> start!94776 true))

(assert (=> start!94776 tp_is_empty!25839))

(declare-fun array_inv!25530 (array!68649) Bool)

(assert (=> start!94776 (and (array_inv!25530 _values!955) e!611999)))

(assert (=> start!94776 tp!77545))

(declare-fun array_inv!25531 (array!68651) Bool)

(assert (=> start!94776 (array_inv!25531 _keys!1163)))

(declare-fun mapIsEmpty!40465 () Bool)

(assert (=> mapIsEmpty!40465 mapRes!40465))

(declare-fun b!1071709 () Bool)

(declare-fun res!714916 () Bool)

(assert (=> b!1071709 (=> (not res!714916) (not e!612004))))

(declare-datatypes ((List!23051 0))(
  ( (Nil!23048) (Cons!23047 (h!24256 (_ BitVec 64)) (t!32384 List!23051)) )
))
(declare-fun arrayNoDuplicates!0 (array!68651 (_ BitVec 32) List!23051) Bool)

(assert (=> b!1071709 (= res!714916 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23048))))

(declare-fun b!1071710 () Bool)

(assert (=> b!1071710 (= e!612005 (= lt!474449 (+!3192 lt!474451 lt!474444)))))

(assert (= (and start!94776 res!714918) b!1071705))

(assert (= (and b!1071705 res!714921) b!1071707))

(assert (= (and b!1071707 res!714917) b!1071709))

(assert (= (and b!1071709 res!714916) b!1071708))

(assert (= (and b!1071708 (not res!714920)) b!1071706))

(assert (= (and b!1071706 res!714922) b!1071710))

(assert (= (and b!1071706 (not res!714919)) b!1071704))

(assert (= (and b!1071703 condMapEmpty!40465) mapIsEmpty!40465))

(assert (= (and b!1071703 (not condMapEmpty!40465)) mapNonEmpty!40465))

(get-info :version)

(assert (= (and mapNonEmpty!40465 ((_ is ValueCellFull!12216) mapValue!40465)) b!1071702))

(assert (= (and b!1071703 ((_ is ValueCellFull!12216) mapDefault!40465)) b!1071701))

(assert (= start!94776 b!1071703))

(declare-fun m!990329 () Bool)

(assert (=> mapNonEmpty!40465 m!990329))

(declare-fun m!990331 () Bool)

(assert (=> b!1071709 m!990331))

(declare-fun m!990333 () Bool)

(assert (=> b!1071708 m!990333))

(declare-fun m!990335 () Bool)

(assert (=> b!1071708 m!990335))

(declare-fun m!990337 () Bool)

(assert (=> b!1071708 m!990337))

(declare-fun m!990339 () Bool)

(assert (=> b!1071706 m!990339))

(declare-fun m!990341 () Bool)

(assert (=> b!1071706 m!990341))

(declare-fun m!990343 () Bool)

(assert (=> b!1071706 m!990343))

(declare-fun m!990345 () Bool)

(assert (=> b!1071706 m!990345))

(declare-fun m!990347 () Bool)

(assert (=> b!1071706 m!990347))

(declare-fun m!990349 () Bool)

(assert (=> b!1071706 m!990349))

(assert (=> b!1071706 m!990339))

(declare-fun m!990351 () Bool)

(assert (=> b!1071706 m!990351))

(declare-fun m!990353 () Bool)

(assert (=> b!1071706 m!990353))

(declare-fun m!990355 () Bool)

(assert (=> b!1071706 m!990355))

(declare-fun m!990357 () Bool)

(assert (=> b!1071706 m!990357))

(declare-fun m!990359 () Bool)

(assert (=> b!1071707 m!990359))

(declare-fun m!990361 () Bool)

(assert (=> start!94776 m!990361))

(declare-fun m!990363 () Bool)

(assert (=> start!94776 m!990363))

(declare-fun m!990365 () Bool)

(assert (=> start!94776 m!990365))

(declare-fun m!990367 () Bool)

(assert (=> b!1071710 m!990367))

(check-sat (not start!94776) (not mapNonEmpty!40465) (not b!1071708) (not b_next!22029) (not b!1071706) (not b!1071710) b_and!34859 (not b!1071709) tp_is_empty!25839 (not b!1071707))
(check-sat b_and!34859 (not b_next!22029))
(get-model)

(declare-fun bm!45201 () Bool)

(declare-fun call!45204 () Bool)

(declare-fun c!107652 () Bool)

(assert (=> bm!45201 (= call!45204 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107652 (Cons!23047 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000) Nil!23048) Nil!23048)))))

(declare-fun b!1071751 () Bool)

(declare-fun e!612038 () Bool)

(declare-fun contains!6322 (List!23051 (_ BitVec 64)) Bool)

(assert (=> b!1071751 (= e!612038 (contains!6322 Nil!23048 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129305 () Bool)

(declare-fun res!714951 () Bool)

(declare-fun e!612040 () Bool)

(assert (=> d!129305 (=> res!714951 e!612040)))

(assert (=> d!129305 (= res!714951 (bvsge #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (=> d!129305 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23048) e!612040)))

(declare-fun b!1071752 () Bool)

(declare-fun e!612039 () Bool)

(assert (=> b!1071752 (= e!612039 call!45204)))

(declare-fun b!1071753 () Bool)

(declare-fun e!612041 () Bool)

(assert (=> b!1071753 (= e!612041 e!612039)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1071753 (= c!107652 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071754 () Bool)

(assert (=> b!1071754 (= e!612039 call!45204)))

(declare-fun b!1071755 () Bool)

(assert (=> b!1071755 (= e!612040 e!612041)))

(declare-fun res!714950 () Bool)

(assert (=> b!1071755 (=> (not res!714950) (not e!612041))))

(assert (=> b!1071755 (= res!714950 (not e!612038))))

(declare-fun res!714952 () Bool)

(assert (=> b!1071755 (=> (not res!714952) (not e!612038))))

(assert (=> b!1071755 (= res!714952 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129305 (not res!714951)) b!1071755))

(assert (= (and b!1071755 res!714952) b!1071751))

(assert (= (and b!1071755 res!714950) b!1071753))

(assert (= (and b!1071753 c!107652) b!1071752))

(assert (= (and b!1071753 (not c!107652)) b!1071754))

(assert (= (or b!1071752 b!1071754) bm!45201))

(declare-fun m!990409 () Bool)

(assert (=> bm!45201 m!990409))

(declare-fun m!990411 () Bool)

(assert (=> bm!45201 m!990411))

(assert (=> b!1071751 m!990409))

(assert (=> b!1071751 m!990409))

(declare-fun m!990413 () Bool)

(assert (=> b!1071751 m!990413))

(assert (=> b!1071753 m!990409))

(assert (=> b!1071753 m!990409))

(declare-fun m!990415 () Bool)

(assert (=> b!1071753 m!990415))

(assert (=> b!1071755 m!990409))

(assert (=> b!1071755 m!990409))

(assert (=> b!1071755 m!990415))

(assert (=> b!1071709 d!129305))

(declare-fun d!129307 () Bool)

(assert (=> d!129307 (= (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474494 () Unit!35308)

(declare-fun choose!1741 (array!68651 array!68649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39587 V!39587 V!39587 V!39587 (_ BitVec 32) Int) Unit!35308)

(assert (=> d!129307 (= lt!474494 (choose!1741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129307 (validMask!0 mask!1515)))

(assert (=> d!129307 (= (lemmaNoChangeToArrayThenSameMapNoExtras!861 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474494)))

(declare-fun bs!31575 () Bool)

(assert (= bs!31575 d!129307))

(assert (=> bs!31575 m!990337))

(assert (=> bs!31575 m!990335))

(declare-fun m!990417 () Bool)

(assert (=> bs!31575 m!990417))

(assert (=> bs!31575 m!990361))

(assert (=> b!1071708 d!129307))

(declare-fun b!1071780 () Bool)

(declare-fun e!612056 () ListLongMap!14483)

(declare-fun call!45207 () ListLongMap!14483)

(assert (=> b!1071780 (= e!612056 call!45207)))

(declare-fun lt!474512 () ListLongMap!14483)

(declare-fun e!612057 () Bool)

(declare-fun b!1071781 () Bool)

(assert (=> b!1071781 (= e!612057 (= lt!474512 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129309 () Bool)

(declare-fun e!612062 () Bool)

(assert (=> d!129309 e!612062))

(declare-fun res!714962 () Bool)

(assert (=> d!129309 (=> (not res!714962) (not e!612062))))

(declare-fun contains!6323 (ListLongMap!14483 (_ BitVec 64)) Bool)

(assert (=> d!129309 (= res!714962 (not (contains!6323 lt!474512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!612060 () ListLongMap!14483)

(assert (=> d!129309 (= lt!474512 e!612060)))

(declare-fun c!107661 () Bool)

(assert (=> d!129309 (= c!107661 (bvsge #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (=> d!129309 (validMask!0 mask!1515)))

(assert (=> d!129309 (= (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474512)))

(declare-fun b!1071782 () Bool)

(declare-fun e!612061 () Bool)

(declare-fun e!612058 () Bool)

(assert (=> b!1071782 (= e!612061 e!612058)))

(assert (=> b!1071782 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun res!714961 () Bool)

(assert (=> b!1071782 (= res!714961 (contains!6323 lt!474512 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071782 (=> (not res!714961) (not e!612058))))

(declare-fun bm!45204 () Bool)

(assert (=> bm!45204 (= call!45207 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1071783 () Bool)

(assert (=> b!1071783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (=> b!1071783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33556 _values!955)))))

(declare-fun apply!930 (ListLongMap!14483 (_ BitVec 64)) V!39587)

(declare-fun get!17168 (ValueCell!12216 V!39587) V!39587)

(declare-fun dynLambda!2037 (Int (_ BitVec 64)) V!39587)

(assert (=> b!1071783 (= e!612058 (= (apply!930 lt!474512 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)) (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1071784 () Bool)

(assert (=> b!1071784 (= e!612060 (ListLongMap!14484 Nil!23047))))

(declare-fun b!1071785 () Bool)

(assert (=> b!1071785 (= e!612061 e!612057)))

(declare-fun c!107662 () Bool)

(assert (=> b!1071785 (= c!107662 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun b!1071786 () Bool)

(assert (=> b!1071786 (= e!612060 e!612056)))

(declare-fun c!107664 () Bool)

(assert (=> b!1071786 (= c!107664 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071787 () Bool)

(declare-fun isEmpty!948 (ListLongMap!14483) Bool)

(assert (=> b!1071787 (= e!612057 (isEmpty!948 lt!474512))))

(declare-fun b!1071788 () Bool)

(declare-fun res!714964 () Bool)

(assert (=> b!1071788 (=> (not res!714964) (not e!612062))))

(assert (=> b!1071788 (= res!714964 (not (contains!6323 lt!474512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1071789 () Bool)

(declare-fun e!612059 () Bool)

(assert (=> b!1071789 (= e!612059 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071789 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1071790 () Bool)

(declare-fun lt!474511 () Unit!35308)

(declare-fun lt!474509 () Unit!35308)

(assert (=> b!1071790 (= lt!474511 lt!474509)))

(declare-fun lt!474515 () V!39587)

(declare-fun lt!474513 () (_ BitVec 64))

(declare-fun lt!474514 () ListLongMap!14483)

(declare-fun lt!474510 () (_ BitVec 64))

(assert (=> b!1071790 (not (contains!6323 (+!3192 lt!474514 (tuple2!16515 lt!474510 lt!474515)) lt!474513))))

(declare-fun addStillNotContains!258 (ListLongMap!14483 (_ BitVec 64) V!39587 (_ BitVec 64)) Unit!35308)

(assert (=> b!1071790 (= lt!474509 (addStillNotContains!258 lt!474514 lt!474510 lt!474515 lt!474513))))

(assert (=> b!1071790 (= lt!474513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1071790 (= lt!474515 (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1071790 (= lt!474510 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071790 (= lt!474514 call!45207)))

(assert (=> b!1071790 (= e!612056 (+!3192 call!45207 (tuple2!16515 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000) (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1071791 () Bool)

(assert (=> b!1071791 (= e!612062 e!612061)))

(declare-fun c!107663 () Bool)

(assert (=> b!1071791 (= c!107663 e!612059)))

(declare-fun res!714963 () Bool)

(assert (=> b!1071791 (=> (not res!714963) (not e!612059))))

(assert (=> b!1071791 (= res!714963 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (= (and d!129309 c!107661) b!1071784))

(assert (= (and d!129309 (not c!107661)) b!1071786))

(assert (= (and b!1071786 c!107664) b!1071790))

(assert (= (and b!1071786 (not c!107664)) b!1071780))

(assert (= (or b!1071790 b!1071780) bm!45204))

(assert (= (and d!129309 res!714962) b!1071788))

(assert (= (and b!1071788 res!714964) b!1071791))

(assert (= (and b!1071791 res!714963) b!1071789))

(assert (= (and b!1071791 c!107663) b!1071782))

(assert (= (and b!1071791 (not c!107663)) b!1071785))

(assert (= (and b!1071782 res!714961) b!1071783))

(assert (= (and b!1071785 c!107662) b!1071781))

(assert (= (and b!1071785 (not c!107662)) b!1071787))

(declare-fun b_lambda!16677 () Bool)

(assert (=> (not b_lambda!16677) (not b!1071783)))

(declare-fun t!32387 () Bool)

(declare-fun tb!7155 () Bool)

(assert (=> (and start!94776 (= defaultEntry!963 defaultEntry!963) t!32387) tb!7155))

(declare-fun result!14773 () Bool)

(assert (=> tb!7155 (= result!14773 tp_is_empty!25839)))

(assert (=> b!1071783 t!32387))

(declare-fun b_and!34863 () Bool)

(assert (= b_and!34859 (and (=> t!32387 result!14773) b_and!34863)))

(declare-fun b_lambda!16679 () Bool)

(assert (=> (not b_lambda!16679) (not b!1071790)))

(assert (=> b!1071790 t!32387))

(declare-fun b_and!34865 () Bool)

(assert (= b_and!34863 (and (=> t!32387 result!14773) b_and!34865)))

(declare-fun m!990419 () Bool)

(assert (=> d!129309 m!990419))

(assert (=> d!129309 m!990361))

(declare-fun m!990421 () Bool)

(assert (=> b!1071781 m!990421))

(declare-fun m!990423 () Bool)

(assert (=> b!1071787 m!990423))

(declare-fun m!990425 () Bool)

(assert (=> b!1071788 m!990425))

(assert (=> b!1071786 m!990409))

(assert (=> b!1071786 m!990409))

(assert (=> b!1071786 m!990415))

(assert (=> bm!45204 m!990421))

(assert (=> b!1071789 m!990409))

(assert (=> b!1071789 m!990409))

(assert (=> b!1071789 m!990415))

(assert (=> b!1071783 m!990409))

(declare-fun m!990427 () Bool)

(assert (=> b!1071783 m!990427))

(declare-fun m!990429 () Bool)

(assert (=> b!1071783 m!990429))

(assert (=> b!1071783 m!990409))

(assert (=> b!1071783 m!990429))

(declare-fun m!990431 () Bool)

(assert (=> b!1071783 m!990431))

(declare-fun m!990433 () Bool)

(assert (=> b!1071783 m!990433))

(assert (=> b!1071783 m!990431))

(assert (=> b!1071782 m!990409))

(assert (=> b!1071782 m!990409))

(declare-fun m!990435 () Bool)

(assert (=> b!1071782 m!990435))

(declare-fun m!990437 () Bool)

(assert (=> b!1071790 m!990437))

(declare-fun m!990439 () Bool)

(assert (=> b!1071790 m!990439))

(assert (=> b!1071790 m!990437))

(declare-fun m!990441 () Bool)

(assert (=> b!1071790 m!990441))

(assert (=> b!1071790 m!990429))

(assert (=> b!1071790 m!990409))

(declare-fun m!990443 () Bool)

(assert (=> b!1071790 m!990443))

(assert (=> b!1071790 m!990429))

(assert (=> b!1071790 m!990431))

(assert (=> b!1071790 m!990433))

(assert (=> b!1071790 m!990431))

(assert (=> b!1071708 d!129309))

(declare-fun b!1071794 () Bool)

(declare-fun e!612063 () ListLongMap!14483)

(declare-fun call!45208 () ListLongMap!14483)

(assert (=> b!1071794 (= e!612063 call!45208)))

(declare-fun e!612064 () Bool)

(declare-fun b!1071795 () Bool)

(declare-fun lt!474519 () ListLongMap!14483)

(assert (=> b!1071795 (= e!612064 (= lt!474519 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129311 () Bool)

(declare-fun e!612069 () Bool)

(assert (=> d!129311 e!612069))

(declare-fun res!714966 () Bool)

(assert (=> d!129311 (=> (not res!714966) (not e!612069))))

(assert (=> d!129311 (= res!714966 (not (contains!6323 lt!474519 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!612067 () ListLongMap!14483)

(assert (=> d!129311 (= lt!474519 e!612067)))

(declare-fun c!107665 () Bool)

(assert (=> d!129311 (= c!107665 (bvsge #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (=> d!129311 (validMask!0 mask!1515)))

(assert (=> d!129311 (= (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474519)))

(declare-fun b!1071796 () Bool)

(declare-fun e!612068 () Bool)

(declare-fun e!612065 () Bool)

(assert (=> b!1071796 (= e!612068 e!612065)))

(assert (=> b!1071796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun res!714965 () Bool)

(assert (=> b!1071796 (= res!714965 (contains!6323 lt!474519 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071796 (=> (not res!714965) (not e!612065))))

(declare-fun bm!45205 () Bool)

(assert (=> bm!45205 (= call!45208 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1071797 () Bool)

(assert (=> b!1071797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (=> b!1071797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33556 _values!955)))))

(assert (=> b!1071797 (= e!612065 (= (apply!930 lt!474519 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)) (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1071798 () Bool)

(assert (=> b!1071798 (= e!612067 (ListLongMap!14484 Nil!23047))))

(declare-fun b!1071799 () Bool)

(assert (=> b!1071799 (= e!612068 e!612064)))

(declare-fun c!107666 () Bool)

(assert (=> b!1071799 (= c!107666 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun b!1071800 () Bool)

(assert (=> b!1071800 (= e!612067 e!612063)))

(declare-fun c!107668 () Bool)

(assert (=> b!1071800 (= c!107668 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071801 () Bool)

(assert (=> b!1071801 (= e!612064 (isEmpty!948 lt!474519))))

(declare-fun b!1071802 () Bool)

(declare-fun res!714968 () Bool)

(assert (=> b!1071802 (=> (not res!714968) (not e!612069))))

(assert (=> b!1071802 (= res!714968 (not (contains!6323 lt!474519 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1071803 () Bool)

(declare-fun e!612066 () Bool)

(assert (=> b!1071803 (= e!612066 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071803 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1071804 () Bool)

(declare-fun lt!474518 () Unit!35308)

(declare-fun lt!474516 () Unit!35308)

(assert (=> b!1071804 (= lt!474518 lt!474516)))

(declare-fun lt!474521 () ListLongMap!14483)

(declare-fun lt!474520 () (_ BitVec 64))

(declare-fun lt!474522 () V!39587)

(declare-fun lt!474517 () (_ BitVec 64))

(assert (=> b!1071804 (not (contains!6323 (+!3192 lt!474521 (tuple2!16515 lt!474517 lt!474522)) lt!474520))))

(assert (=> b!1071804 (= lt!474516 (addStillNotContains!258 lt!474521 lt!474517 lt!474522 lt!474520))))

(assert (=> b!1071804 (= lt!474520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1071804 (= lt!474522 (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1071804 (= lt!474517 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071804 (= lt!474521 call!45208)))

(assert (=> b!1071804 (= e!612063 (+!3192 call!45208 (tuple2!16515 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000) (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1071805 () Bool)

(assert (=> b!1071805 (= e!612069 e!612068)))

(declare-fun c!107667 () Bool)

(assert (=> b!1071805 (= c!107667 e!612066)))

(declare-fun res!714967 () Bool)

(assert (=> b!1071805 (=> (not res!714967) (not e!612066))))

(assert (=> b!1071805 (= res!714967 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (= (and d!129311 c!107665) b!1071798))

(assert (= (and d!129311 (not c!107665)) b!1071800))

(assert (= (and b!1071800 c!107668) b!1071804))

(assert (= (and b!1071800 (not c!107668)) b!1071794))

(assert (= (or b!1071804 b!1071794) bm!45205))

(assert (= (and d!129311 res!714966) b!1071802))

(assert (= (and b!1071802 res!714968) b!1071805))

(assert (= (and b!1071805 res!714967) b!1071803))

(assert (= (and b!1071805 c!107667) b!1071796))

(assert (= (and b!1071805 (not c!107667)) b!1071799))

(assert (= (and b!1071796 res!714965) b!1071797))

(assert (= (and b!1071799 c!107666) b!1071795))

(assert (= (and b!1071799 (not c!107666)) b!1071801))

(declare-fun b_lambda!16681 () Bool)

(assert (=> (not b_lambda!16681) (not b!1071797)))

(assert (=> b!1071797 t!32387))

(declare-fun b_and!34867 () Bool)

(assert (= b_and!34865 (and (=> t!32387 result!14773) b_and!34867)))

(declare-fun b_lambda!16683 () Bool)

(assert (=> (not b_lambda!16683) (not b!1071804)))

(assert (=> b!1071804 t!32387))

(declare-fun b_and!34869 () Bool)

(assert (= b_and!34867 (and (=> t!32387 result!14773) b_and!34869)))

(declare-fun m!990445 () Bool)

(assert (=> d!129311 m!990445))

(assert (=> d!129311 m!990361))

(declare-fun m!990447 () Bool)

(assert (=> b!1071795 m!990447))

(declare-fun m!990449 () Bool)

(assert (=> b!1071801 m!990449))

(declare-fun m!990451 () Bool)

(assert (=> b!1071802 m!990451))

(assert (=> b!1071800 m!990409))

(assert (=> b!1071800 m!990409))

(assert (=> b!1071800 m!990415))

(assert (=> bm!45205 m!990447))

(assert (=> b!1071803 m!990409))

(assert (=> b!1071803 m!990409))

(assert (=> b!1071803 m!990415))

(assert (=> b!1071797 m!990409))

(declare-fun m!990453 () Bool)

(assert (=> b!1071797 m!990453))

(assert (=> b!1071797 m!990429))

(assert (=> b!1071797 m!990409))

(assert (=> b!1071797 m!990429))

(assert (=> b!1071797 m!990431))

(assert (=> b!1071797 m!990433))

(assert (=> b!1071797 m!990431))

(assert (=> b!1071796 m!990409))

(assert (=> b!1071796 m!990409))

(declare-fun m!990455 () Bool)

(assert (=> b!1071796 m!990455))

(declare-fun m!990457 () Bool)

(assert (=> b!1071804 m!990457))

(declare-fun m!990459 () Bool)

(assert (=> b!1071804 m!990459))

(assert (=> b!1071804 m!990457))

(declare-fun m!990461 () Bool)

(assert (=> b!1071804 m!990461))

(assert (=> b!1071804 m!990429))

(assert (=> b!1071804 m!990409))

(declare-fun m!990463 () Bool)

(assert (=> b!1071804 m!990463))

(assert (=> b!1071804 m!990429))

(assert (=> b!1071804 m!990431))

(assert (=> b!1071804 m!990433))

(assert (=> b!1071804 m!990431))

(assert (=> b!1071708 d!129311))

(declare-fun b!1071814 () Bool)

(declare-fun e!612077 () Bool)

(declare-fun call!45211 () Bool)

(assert (=> b!1071814 (= e!612077 call!45211)))

(declare-fun b!1071815 () Bool)

(declare-fun e!612078 () Bool)

(assert (=> b!1071815 (= e!612078 e!612077)))

(declare-fun c!107671 () Bool)

(assert (=> b!1071815 (= c!107671 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45208 () Bool)

(assert (=> bm!45208 (= call!45211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!129313 () Bool)

(declare-fun res!714974 () Bool)

(assert (=> d!129313 (=> res!714974 e!612078)))

(assert (=> d!129313 (= res!714974 (bvsge #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(assert (=> d!129313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!612078)))

(declare-fun b!1071816 () Bool)

(declare-fun e!612076 () Bool)

(assert (=> b!1071816 (= e!612077 e!612076)))

(declare-fun lt!474529 () (_ BitVec 64))

(assert (=> b!1071816 (= lt!474529 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474530 () Unit!35308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68651 (_ BitVec 64) (_ BitVec 32)) Unit!35308)

(assert (=> b!1071816 (= lt!474530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!474529 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1071816 (arrayContainsKey!0 _keys!1163 lt!474529 #b00000000000000000000000000000000)))

(declare-fun lt!474531 () Unit!35308)

(assert (=> b!1071816 (= lt!474531 lt!474530)))

(declare-fun res!714973 () Bool)

(declare-datatypes ((SeekEntryResult!9883 0))(
  ( (MissingZero!9883 (index!41903 (_ BitVec 32))) (Found!9883 (index!41904 (_ BitVec 32))) (Intermediate!9883 (undefined!10695 Bool) (index!41905 (_ BitVec 32)) (x!96034 (_ BitVec 32))) (Undefined!9883) (MissingVacant!9883 (index!41906 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68651 (_ BitVec 32)) SeekEntryResult!9883)

(assert (=> b!1071816 (= res!714973 (= (seekEntryOrOpen!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9883 #b00000000000000000000000000000000)))))

(assert (=> b!1071816 (=> (not res!714973) (not e!612076))))

(declare-fun b!1071817 () Bool)

(assert (=> b!1071817 (= e!612076 call!45211)))

(assert (= (and d!129313 (not res!714974)) b!1071815))

(assert (= (and b!1071815 c!107671) b!1071816))

(assert (= (and b!1071815 (not c!107671)) b!1071814))

(assert (= (and b!1071816 res!714973) b!1071817))

(assert (= (or b!1071817 b!1071814) bm!45208))

(assert (=> b!1071815 m!990409))

(assert (=> b!1071815 m!990409))

(assert (=> b!1071815 m!990415))

(declare-fun m!990465 () Bool)

(assert (=> bm!45208 m!990465))

(assert (=> b!1071816 m!990409))

(declare-fun m!990467 () Bool)

(assert (=> b!1071816 m!990467))

(declare-fun m!990469 () Bool)

(assert (=> b!1071816 m!990469))

(assert (=> b!1071816 m!990409))

(declare-fun m!990471 () Bool)

(assert (=> b!1071816 m!990471))

(assert (=> b!1071707 d!129313))

(declare-fun d!129315 () Bool)

(assert (=> d!129315 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94776 d!129315))

(declare-fun d!129317 () Bool)

(assert (=> d!129317 (= (array_inv!25530 _values!955) (bvsge (size!33556 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94776 d!129317))

(declare-fun d!129319 () Bool)

(assert (=> d!129319 (= (array_inv!25531 _keys!1163) (bvsge (size!33557 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94776 d!129319))

(declare-fun d!129321 () Bool)

(assert (=> d!129321 (= (+!3192 (+!3192 lt!474455 (tuple2!16515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (+!3192 (+!3192 lt!474455 (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (tuple2!16515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun lt!474534 () Unit!35308)

(declare-fun choose!1742 (ListLongMap!14483 (_ BitVec 64) V!39587 (_ BitVec 64) V!39587) Unit!35308)

(assert (=> d!129321 (= lt!474534 (choose!1742 lt!474455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> d!129321 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129321 (= (addCommutativeForDiffKeys!733 lt!474455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907) lt!474534)))

(declare-fun bs!31576 () Bool)

(assert (= bs!31576 d!129321))

(declare-fun m!990473 () Bool)

(assert (=> bs!31576 m!990473))

(assert (=> bs!31576 m!990473))

(declare-fun m!990475 () Bool)

(assert (=> bs!31576 m!990475))

(declare-fun m!990477 () Bool)

(assert (=> bs!31576 m!990477))

(declare-fun m!990479 () Bool)

(assert (=> bs!31576 m!990479))

(assert (=> bs!31576 m!990477))

(declare-fun m!990481 () Bool)

(assert (=> bs!31576 m!990481))

(assert (=> b!1071706 d!129321))

(declare-fun d!129323 () Bool)

(declare-fun e!612081 () Bool)

(assert (=> d!129323 e!612081))

(declare-fun res!714979 () Bool)

(assert (=> d!129323 (=> (not res!714979) (not e!612081))))

(declare-fun lt!474544 () ListLongMap!14483)

(assert (=> d!129323 (= res!714979 (contains!6323 lt!474544 (_1!8268 lt!474444)))))

(declare-fun lt!474543 () List!23050)

(assert (=> d!129323 (= lt!474544 (ListLongMap!14484 lt!474543))))

(declare-fun lt!474546 () Unit!35308)

(declare-fun lt!474545 () Unit!35308)

(assert (=> d!129323 (= lt!474546 lt!474545)))

(declare-datatypes ((Option!654 0))(
  ( (Some!653 (v!15588 V!39587)) (None!652) )
))
(declare-fun getValueByKey!603 (List!23050 (_ BitVec 64)) Option!654)

(assert (=> d!129323 (= (getValueByKey!603 lt!474543 (_1!8268 lt!474444)) (Some!653 (_2!8268 lt!474444)))))

(declare-fun lemmaContainsTupThenGetReturnValue!284 (List!23050 (_ BitVec 64) V!39587) Unit!35308)

(assert (=> d!129323 (= lt!474545 (lemmaContainsTupThenGetReturnValue!284 lt!474543 (_1!8268 lt!474444) (_2!8268 lt!474444)))))

(declare-fun insertStrictlySorted!377 (List!23050 (_ BitVec 64) V!39587) List!23050)

(assert (=> d!129323 (= lt!474543 (insertStrictlySorted!377 (toList!7257 lt!474455) (_1!8268 lt!474444) (_2!8268 lt!474444)))))

(assert (=> d!129323 (= (+!3192 lt!474455 lt!474444) lt!474544)))

(declare-fun b!1071822 () Bool)

(declare-fun res!714980 () Bool)

(assert (=> b!1071822 (=> (not res!714980) (not e!612081))))

(assert (=> b!1071822 (= res!714980 (= (getValueByKey!603 (toList!7257 lt!474544) (_1!8268 lt!474444)) (Some!653 (_2!8268 lt!474444))))))

(declare-fun b!1071823 () Bool)

(declare-fun contains!6324 (List!23050 tuple2!16514) Bool)

(assert (=> b!1071823 (= e!612081 (contains!6324 (toList!7257 lt!474544) lt!474444))))

(assert (= (and d!129323 res!714979) b!1071822))

(assert (= (and b!1071822 res!714980) b!1071823))

(declare-fun m!990483 () Bool)

(assert (=> d!129323 m!990483))

(declare-fun m!990485 () Bool)

(assert (=> d!129323 m!990485))

(declare-fun m!990487 () Bool)

(assert (=> d!129323 m!990487))

(declare-fun m!990489 () Bool)

(assert (=> d!129323 m!990489))

(declare-fun m!990491 () Bool)

(assert (=> b!1071822 m!990491))

(declare-fun m!990493 () Bool)

(assert (=> b!1071823 m!990493))

(assert (=> b!1071706 d!129323))

(declare-fun d!129325 () Bool)

(declare-fun e!612082 () Bool)

(assert (=> d!129325 e!612082))

(declare-fun res!714981 () Bool)

(assert (=> d!129325 (=> (not res!714981) (not e!612082))))

(declare-fun lt!474548 () ListLongMap!14483)

(assert (=> d!129325 (= res!714981 (contains!6323 lt!474548 (_1!8268 lt!474450)))))

(declare-fun lt!474547 () List!23050)

(assert (=> d!129325 (= lt!474548 (ListLongMap!14484 lt!474547))))

(declare-fun lt!474550 () Unit!35308)

(declare-fun lt!474549 () Unit!35308)

(assert (=> d!129325 (= lt!474550 lt!474549)))

(assert (=> d!129325 (= (getValueByKey!603 lt!474547 (_1!8268 lt!474450)) (Some!653 (_2!8268 lt!474450)))))

(assert (=> d!129325 (= lt!474549 (lemmaContainsTupThenGetReturnValue!284 lt!474547 (_1!8268 lt!474450) (_2!8268 lt!474450)))))

(assert (=> d!129325 (= lt!474547 (insertStrictlySorted!377 (toList!7257 lt!474454) (_1!8268 lt!474450) (_2!8268 lt!474450)))))

(assert (=> d!129325 (= (+!3192 lt!474454 lt!474450) lt!474548)))

(declare-fun b!1071824 () Bool)

(declare-fun res!714982 () Bool)

(assert (=> b!1071824 (=> (not res!714982) (not e!612082))))

(assert (=> b!1071824 (= res!714982 (= (getValueByKey!603 (toList!7257 lt!474548) (_1!8268 lt!474450)) (Some!653 (_2!8268 lt!474450))))))

(declare-fun b!1071825 () Bool)

(assert (=> b!1071825 (= e!612082 (contains!6324 (toList!7257 lt!474548) lt!474450))))

(assert (= (and d!129325 res!714981) b!1071824))

(assert (= (and b!1071824 res!714982) b!1071825))

(declare-fun m!990495 () Bool)

(assert (=> d!129325 m!990495))

(declare-fun m!990497 () Bool)

(assert (=> d!129325 m!990497))

(declare-fun m!990499 () Bool)

(assert (=> d!129325 m!990499))

(declare-fun m!990501 () Bool)

(assert (=> d!129325 m!990501))

(declare-fun m!990503 () Bool)

(assert (=> b!1071824 m!990503))

(declare-fun m!990505 () Bool)

(assert (=> b!1071825 m!990505))

(assert (=> b!1071706 d!129325))

(declare-fun b!1071868 () Bool)

(declare-fun e!612110 () Bool)

(declare-fun e!612109 () Bool)

(assert (=> b!1071868 (= e!612110 e!612109)))

(declare-fun res!715005 () Bool)

(assert (=> b!1071868 (=> (not res!715005) (not e!612109))))

(declare-fun lt!474608 () ListLongMap!14483)

(assert (=> b!1071868 (= res!715005 (contains!6323 lt!474608 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun b!1071869 () Bool)

(declare-fun e!612120 () Bool)

(assert (=> b!1071869 (= e!612120 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071870 () Bool)

(declare-fun res!715004 () Bool)

(declare-fun e!612117 () Bool)

(assert (=> b!1071870 (=> (not res!715004) (not e!612117))))

(declare-fun e!612111 () Bool)

(assert (=> b!1071870 (= res!715004 e!612111)))

(declare-fun c!107686 () Bool)

(assert (=> b!1071870 (= c!107686 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071871 () Bool)

(declare-fun e!612115 () Bool)

(assert (=> b!1071871 (= e!612115 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45223 () Bool)

(declare-fun call!45230 () ListLongMap!14483)

(declare-fun call!45229 () ListLongMap!14483)

(assert (=> bm!45223 (= call!45230 call!45229)))

(declare-fun b!1071872 () Bool)

(declare-fun e!612118 () ListLongMap!14483)

(declare-fun call!45232 () ListLongMap!14483)

(assert (=> b!1071872 (= e!612118 call!45232)))

(declare-fun b!1071873 () Bool)

(declare-fun e!612113 () Bool)

(assert (=> b!1071873 (= e!612117 e!612113)))

(declare-fun c!107689 () Bool)

(assert (=> b!1071873 (= c!107689 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1071874 () Bool)

(assert (=> b!1071874 (= e!612109 (= (apply!930 lt!474608 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)) (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1071874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33556 _values!955)))))

(assert (=> b!1071874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun d!129327 () Bool)

(assert (=> d!129327 e!612117))

(declare-fun res!715007 () Bool)

(assert (=> d!129327 (=> (not res!715007) (not e!612117))))

(assert (=> d!129327 (= res!715007 (or (bvsge #b00000000000000000000000000000000 (size!33557 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))))

(declare-fun lt!474595 () ListLongMap!14483)

(assert (=> d!129327 (= lt!474608 lt!474595)))

(declare-fun lt!474604 () Unit!35308)

(declare-fun e!612119 () Unit!35308)

(assert (=> d!129327 (= lt!474604 e!612119)))

(declare-fun c!107685 () Bool)

(assert (=> d!129327 (= c!107685 e!612120)))

(declare-fun res!715009 () Bool)

(assert (=> d!129327 (=> (not res!715009) (not e!612120))))

(assert (=> d!129327 (= res!715009 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun e!612116 () ListLongMap!14483)

(assert (=> d!129327 (= lt!474595 e!612116)))

(declare-fun c!107688 () Bool)

(assert (=> d!129327 (= c!107688 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129327 (validMask!0 mask!1515)))

(assert (=> d!129327 (= (getCurrentListMap!4154 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474608)))

(declare-fun bm!45224 () Bool)

(declare-fun call!45226 () ListLongMap!14483)

(assert (=> bm!45224 (= call!45232 call!45226)))

(declare-fun b!1071875 () Bool)

(declare-fun lt!474612 () Unit!35308)

(assert (=> b!1071875 (= e!612119 lt!474612)))

(declare-fun lt!474603 () ListLongMap!14483)

(assert (=> b!1071875 (= lt!474603 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474598 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474615 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474615 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474601 () Unit!35308)

(declare-fun addStillContains!644 (ListLongMap!14483 (_ BitVec 64) V!39587 (_ BitVec 64)) Unit!35308)

(assert (=> b!1071875 (= lt!474601 (addStillContains!644 lt!474603 lt!474598 zeroValueAfter!47 lt!474615))))

(assert (=> b!1071875 (contains!6323 (+!3192 lt!474603 (tuple2!16515 lt!474598 zeroValueAfter!47)) lt!474615)))

(declare-fun lt!474610 () Unit!35308)

(assert (=> b!1071875 (= lt!474610 lt!474601)))

(declare-fun lt!474616 () ListLongMap!14483)

(assert (=> b!1071875 (= lt!474616 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474611 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474596 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474596 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474606 () Unit!35308)

(declare-fun addApplyDifferent!504 (ListLongMap!14483 (_ BitVec 64) V!39587 (_ BitVec 64)) Unit!35308)

(assert (=> b!1071875 (= lt!474606 (addApplyDifferent!504 lt!474616 lt!474611 minValue!907 lt!474596))))

(assert (=> b!1071875 (= (apply!930 (+!3192 lt!474616 (tuple2!16515 lt!474611 minValue!907)) lt!474596) (apply!930 lt!474616 lt!474596))))

(declare-fun lt!474605 () Unit!35308)

(assert (=> b!1071875 (= lt!474605 lt!474606)))

(declare-fun lt!474597 () ListLongMap!14483)

(assert (=> b!1071875 (= lt!474597 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474609 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474614 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474614 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474613 () Unit!35308)

(assert (=> b!1071875 (= lt!474613 (addApplyDifferent!504 lt!474597 lt!474609 zeroValueAfter!47 lt!474614))))

(assert (=> b!1071875 (= (apply!930 (+!3192 lt!474597 (tuple2!16515 lt!474609 zeroValueAfter!47)) lt!474614) (apply!930 lt!474597 lt!474614))))

(declare-fun lt!474602 () Unit!35308)

(assert (=> b!1071875 (= lt!474602 lt!474613)))

(declare-fun lt!474607 () ListLongMap!14483)

(assert (=> b!1071875 (= lt!474607 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474599 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474599 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474600 () (_ BitVec 64))

(assert (=> b!1071875 (= lt!474600 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071875 (= lt!474612 (addApplyDifferent!504 lt!474607 lt!474599 minValue!907 lt!474600))))

(assert (=> b!1071875 (= (apply!930 (+!3192 lt!474607 (tuple2!16515 lt!474599 minValue!907)) lt!474600) (apply!930 lt!474607 lt!474600))))

(declare-fun b!1071876 () Bool)

(declare-fun e!612114 () Bool)

(assert (=> b!1071876 (= e!612114 (= (apply!930 lt!474608 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1071877 () Bool)

(assert (=> b!1071877 (= e!612118 call!45230)))

(declare-fun bm!45225 () Bool)

(declare-fun call!45231 () Bool)

(assert (=> bm!45225 (= call!45231 (contains!6323 lt!474608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071878 () Bool)

(assert (=> b!1071878 (= e!612111 e!612114)))

(declare-fun res!715003 () Bool)

(assert (=> b!1071878 (= res!715003 call!45231)))

(assert (=> b!1071878 (=> (not res!715003) (not e!612114))))

(declare-fun bm!45226 () Bool)

(declare-fun call!45228 () Bool)

(assert (=> bm!45226 (= call!45228 (contains!6323 lt!474608 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071879 () Bool)

(declare-fun e!612121 () Bool)

(assert (=> b!1071879 (= e!612113 e!612121)))

(declare-fun res!715002 () Bool)

(assert (=> b!1071879 (= res!715002 call!45228)))

(assert (=> b!1071879 (=> (not res!715002) (not e!612121))))

(declare-fun b!1071880 () Bool)

(declare-fun e!612112 () ListLongMap!14483)

(assert (=> b!1071880 (= e!612116 e!612112)))

(declare-fun c!107684 () Bool)

(assert (=> b!1071880 (= c!107684 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45227 () Bool)

(declare-fun call!45227 () ListLongMap!14483)

(assert (=> bm!45227 (= call!45229 call!45227)))

(declare-fun b!1071881 () Bool)

(declare-fun res!715001 () Bool)

(assert (=> b!1071881 (=> (not res!715001) (not e!612117))))

(assert (=> b!1071881 (= res!715001 e!612110)))

(declare-fun res!715008 () Bool)

(assert (=> b!1071881 (=> res!715008 e!612110)))

(assert (=> b!1071881 (= res!715008 (not e!612115))))

(declare-fun res!715006 () Bool)

(assert (=> b!1071881 (=> (not res!715006) (not e!612115))))

(assert (=> b!1071881 (= res!715006 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun bm!45228 () Bool)

(assert (=> bm!45228 (= call!45227 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071882 () Bool)

(declare-fun c!107687 () Bool)

(assert (=> b!1071882 (= c!107687 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071882 (= e!612112 e!612118)))

(declare-fun b!1071883 () Bool)

(assert (=> b!1071883 (= e!612121 (= (apply!930 lt!474608 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1071884 () Bool)

(assert (=> b!1071884 (= e!612116 (+!3192 call!45226 (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1071885 () Bool)

(declare-fun Unit!35312 () Unit!35308)

(assert (=> b!1071885 (= e!612119 Unit!35312)))

(declare-fun bm!45229 () Bool)

(assert (=> bm!45229 (= call!45226 (+!3192 (ite c!107688 call!45227 (ite c!107684 call!45229 call!45230)) (ite (or c!107688 c!107684) (tuple2!16515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1071886 () Bool)

(assert (=> b!1071886 (= e!612111 (not call!45231))))

(declare-fun b!1071887 () Bool)

(assert (=> b!1071887 (= e!612112 call!45232)))

(declare-fun b!1071888 () Bool)

(assert (=> b!1071888 (= e!612113 (not call!45228))))

(assert (= (and d!129327 c!107688) b!1071884))

(assert (= (and d!129327 (not c!107688)) b!1071880))

(assert (= (and b!1071880 c!107684) b!1071887))

(assert (= (and b!1071880 (not c!107684)) b!1071882))

(assert (= (and b!1071882 c!107687) b!1071872))

(assert (= (and b!1071882 (not c!107687)) b!1071877))

(assert (= (or b!1071872 b!1071877) bm!45223))

(assert (= (or b!1071887 bm!45223) bm!45227))

(assert (= (or b!1071887 b!1071872) bm!45224))

(assert (= (or b!1071884 bm!45227) bm!45228))

(assert (= (or b!1071884 bm!45224) bm!45229))

(assert (= (and d!129327 res!715009) b!1071869))

(assert (= (and d!129327 c!107685) b!1071875))

(assert (= (and d!129327 (not c!107685)) b!1071885))

(assert (= (and d!129327 res!715007) b!1071881))

(assert (= (and b!1071881 res!715006) b!1071871))

(assert (= (and b!1071881 (not res!715008)) b!1071868))

(assert (= (and b!1071868 res!715005) b!1071874))

(assert (= (and b!1071881 res!715001) b!1071870))

(assert (= (and b!1071870 c!107686) b!1071878))

(assert (= (and b!1071870 (not c!107686)) b!1071886))

(assert (= (and b!1071878 res!715003) b!1071876))

(assert (= (or b!1071878 b!1071886) bm!45225))

(assert (= (and b!1071870 res!715004) b!1071873))

(assert (= (and b!1071873 c!107689) b!1071879))

(assert (= (and b!1071873 (not c!107689)) b!1071888))

(assert (= (and b!1071879 res!715002) b!1071883))

(assert (= (or b!1071879 b!1071888) bm!45226))

(declare-fun b_lambda!16685 () Bool)

(assert (=> (not b_lambda!16685) (not b!1071874)))

(assert (=> b!1071874 t!32387))

(declare-fun b_and!34871 () Bool)

(assert (= b_and!34869 (and (=> t!32387 result!14773) b_and!34871)))

(declare-fun m!990507 () Bool)

(assert (=> b!1071876 m!990507))

(declare-fun m!990509 () Bool)

(assert (=> b!1071883 m!990509))

(assert (=> b!1071868 m!990409))

(assert (=> b!1071868 m!990409))

(declare-fun m!990511 () Bool)

(assert (=> b!1071868 m!990511))

(assert (=> b!1071869 m!990409))

(assert (=> b!1071869 m!990409))

(assert (=> b!1071869 m!990415))

(assert (=> bm!45228 m!990335))

(declare-fun m!990513 () Bool)

(assert (=> b!1071884 m!990513))

(declare-fun m!990515 () Bool)

(assert (=> bm!45226 m!990515))

(declare-fun m!990517 () Bool)

(assert (=> b!1071875 m!990517))

(declare-fun m!990519 () Bool)

(assert (=> b!1071875 m!990519))

(declare-fun m!990521 () Bool)

(assert (=> b!1071875 m!990521))

(declare-fun m!990523 () Bool)

(assert (=> b!1071875 m!990523))

(declare-fun m!990525 () Bool)

(assert (=> b!1071875 m!990525))

(declare-fun m!990527 () Bool)

(assert (=> b!1071875 m!990527))

(declare-fun m!990529 () Bool)

(assert (=> b!1071875 m!990529))

(declare-fun m!990531 () Bool)

(assert (=> b!1071875 m!990531))

(declare-fun m!990533 () Bool)

(assert (=> b!1071875 m!990533))

(assert (=> b!1071875 m!990517))

(declare-fun m!990535 () Bool)

(assert (=> b!1071875 m!990535))

(assert (=> b!1071875 m!990519))

(declare-fun m!990537 () Bool)

(assert (=> b!1071875 m!990537))

(assert (=> b!1071875 m!990521))

(declare-fun m!990539 () Bool)

(assert (=> b!1071875 m!990539))

(assert (=> b!1071875 m!990539))

(declare-fun m!990541 () Bool)

(assert (=> b!1071875 m!990541))

(declare-fun m!990543 () Bool)

(assert (=> b!1071875 m!990543))

(assert (=> b!1071875 m!990409))

(assert (=> b!1071875 m!990335))

(declare-fun m!990545 () Bool)

(assert (=> b!1071875 m!990545))

(assert (=> b!1071871 m!990409))

(assert (=> b!1071871 m!990409))

(assert (=> b!1071871 m!990415))

(assert (=> d!129327 m!990361))

(assert (=> b!1071874 m!990409))

(declare-fun m!990547 () Bool)

(assert (=> b!1071874 m!990547))

(assert (=> b!1071874 m!990429))

(assert (=> b!1071874 m!990409))

(assert (=> b!1071874 m!990429))

(assert (=> b!1071874 m!990431))

(assert (=> b!1071874 m!990433))

(assert (=> b!1071874 m!990431))

(declare-fun m!990549 () Bool)

(assert (=> bm!45229 m!990549))

(declare-fun m!990551 () Bool)

(assert (=> bm!45225 m!990551))

(assert (=> b!1071706 d!129327))

(declare-fun b!1071889 () Bool)

(declare-fun e!612123 () Bool)

(declare-fun e!612122 () Bool)

(assert (=> b!1071889 (= e!612123 e!612122)))

(declare-fun res!715014 () Bool)

(assert (=> b!1071889 (=> (not res!715014) (not e!612122))))

(declare-fun lt!474630 () ListLongMap!14483)

(assert (=> b!1071889 (= res!715014 (contains!6323 lt!474630 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun b!1071890 () Bool)

(declare-fun e!612133 () Bool)

(assert (=> b!1071890 (= e!612133 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071891 () Bool)

(declare-fun res!715013 () Bool)

(declare-fun e!612130 () Bool)

(assert (=> b!1071891 (=> (not res!715013) (not e!612130))))

(declare-fun e!612124 () Bool)

(assert (=> b!1071891 (= res!715013 e!612124)))

(declare-fun c!107692 () Bool)

(assert (=> b!1071891 (= c!107692 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071892 () Bool)

(declare-fun e!612128 () Bool)

(assert (=> b!1071892 (= e!612128 (validKeyInArray!0 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45230 () Bool)

(declare-fun call!45237 () ListLongMap!14483)

(declare-fun call!45236 () ListLongMap!14483)

(assert (=> bm!45230 (= call!45237 call!45236)))

(declare-fun b!1071893 () Bool)

(declare-fun e!612131 () ListLongMap!14483)

(declare-fun call!45239 () ListLongMap!14483)

(assert (=> b!1071893 (= e!612131 call!45239)))

(declare-fun b!1071894 () Bool)

(declare-fun e!612126 () Bool)

(assert (=> b!1071894 (= e!612130 e!612126)))

(declare-fun c!107695 () Bool)

(assert (=> b!1071894 (= c!107695 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1071895 () Bool)

(assert (=> b!1071895 (= e!612122 (= (apply!930 lt!474630 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000)) (get!17168 (select (arr!33020 _values!955) #b00000000000000000000000000000000) (dynLambda!2037 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1071895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33556 _values!955)))))

(assert (=> b!1071895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun d!129329 () Bool)

(assert (=> d!129329 e!612130))

(declare-fun res!715016 () Bool)

(assert (=> d!129329 (=> (not res!715016) (not e!612130))))

(assert (=> d!129329 (= res!715016 (or (bvsge #b00000000000000000000000000000000 (size!33557 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))))

(declare-fun lt!474617 () ListLongMap!14483)

(assert (=> d!129329 (= lt!474630 lt!474617)))

(declare-fun lt!474626 () Unit!35308)

(declare-fun e!612132 () Unit!35308)

(assert (=> d!129329 (= lt!474626 e!612132)))

(declare-fun c!107691 () Bool)

(assert (=> d!129329 (= c!107691 e!612133)))

(declare-fun res!715018 () Bool)

(assert (=> d!129329 (=> (not res!715018) (not e!612133))))

(assert (=> d!129329 (= res!715018 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun e!612129 () ListLongMap!14483)

(assert (=> d!129329 (= lt!474617 e!612129)))

(declare-fun c!107694 () Bool)

(assert (=> d!129329 (= c!107694 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129329 (validMask!0 mask!1515)))

(assert (=> d!129329 (= (getCurrentListMap!4154 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!474630)))

(declare-fun bm!45231 () Bool)

(declare-fun call!45233 () ListLongMap!14483)

(assert (=> bm!45231 (= call!45239 call!45233)))

(declare-fun b!1071896 () Bool)

(declare-fun lt!474634 () Unit!35308)

(assert (=> b!1071896 (= e!612132 lt!474634)))

(declare-fun lt!474625 () ListLongMap!14483)

(assert (=> b!1071896 (= lt!474625 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474620 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474637 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474637 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474623 () Unit!35308)

(assert (=> b!1071896 (= lt!474623 (addStillContains!644 lt!474625 lt!474620 zeroValueBefore!47 lt!474637))))

(assert (=> b!1071896 (contains!6323 (+!3192 lt!474625 (tuple2!16515 lt!474620 zeroValueBefore!47)) lt!474637)))

(declare-fun lt!474632 () Unit!35308)

(assert (=> b!1071896 (= lt!474632 lt!474623)))

(declare-fun lt!474638 () ListLongMap!14483)

(assert (=> b!1071896 (= lt!474638 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474633 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474633 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474618 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474618 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474628 () Unit!35308)

(assert (=> b!1071896 (= lt!474628 (addApplyDifferent!504 lt!474638 lt!474633 minValue!907 lt!474618))))

(assert (=> b!1071896 (= (apply!930 (+!3192 lt!474638 (tuple2!16515 lt!474633 minValue!907)) lt!474618) (apply!930 lt!474638 lt!474618))))

(declare-fun lt!474627 () Unit!35308)

(assert (=> b!1071896 (= lt!474627 lt!474628)))

(declare-fun lt!474619 () ListLongMap!14483)

(assert (=> b!1071896 (= lt!474619 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474631 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474636 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474636 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!474635 () Unit!35308)

(assert (=> b!1071896 (= lt!474635 (addApplyDifferent!504 lt!474619 lt!474631 zeroValueBefore!47 lt!474636))))

(assert (=> b!1071896 (= (apply!930 (+!3192 lt!474619 (tuple2!16515 lt!474631 zeroValueBefore!47)) lt!474636) (apply!930 lt!474619 lt!474636))))

(declare-fun lt!474624 () Unit!35308)

(assert (=> b!1071896 (= lt!474624 lt!474635)))

(declare-fun lt!474629 () ListLongMap!14483)

(assert (=> b!1071896 (= lt!474629 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474621 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474621 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!474622 () (_ BitVec 64))

(assert (=> b!1071896 (= lt!474622 (select (arr!33021 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071896 (= lt!474634 (addApplyDifferent!504 lt!474629 lt!474621 minValue!907 lt!474622))))

(assert (=> b!1071896 (= (apply!930 (+!3192 lt!474629 (tuple2!16515 lt!474621 minValue!907)) lt!474622) (apply!930 lt!474629 lt!474622))))

(declare-fun b!1071897 () Bool)

(declare-fun e!612127 () Bool)

(assert (=> b!1071897 (= e!612127 (= (apply!930 lt!474630 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1071898 () Bool)

(assert (=> b!1071898 (= e!612131 call!45237)))

(declare-fun bm!45232 () Bool)

(declare-fun call!45238 () Bool)

(assert (=> bm!45232 (= call!45238 (contains!6323 lt!474630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071899 () Bool)

(assert (=> b!1071899 (= e!612124 e!612127)))

(declare-fun res!715012 () Bool)

(assert (=> b!1071899 (= res!715012 call!45238)))

(assert (=> b!1071899 (=> (not res!715012) (not e!612127))))

(declare-fun bm!45233 () Bool)

(declare-fun call!45235 () Bool)

(assert (=> bm!45233 (= call!45235 (contains!6323 lt!474630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1071900 () Bool)

(declare-fun e!612134 () Bool)

(assert (=> b!1071900 (= e!612126 e!612134)))

(declare-fun res!715011 () Bool)

(assert (=> b!1071900 (= res!715011 call!45235)))

(assert (=> b!1071900 (=> (not res!715011) (not e!612134))))

(declare-fun b!1071901 () Bool)

(declare-fun e!612125 () ListLongMap!14483)

(assert (=> b!1071901 (= e!612129 e!612125)))

(declare-fun c!107690 () Bool)

(assert (=> b!1071901 (= c!107690 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45234 () Bool)

(declare-fun call!45234 () ListLongMap!14483)

(assert (=> bm!45234 (= call!45236 call!45234)))

(declare-fun b!1071902 () Bool)

(declare-fun res!715010 () Bool)

(assert (=> b!1071902 (=> (not res!715010) (not e!612130))))

(assert (=> b!1071902 (= res!715010 e!612123)))

(declare-fun res!715017 () Bool)

(assert (=> b!1071902 (=> res!715017 e!612123)))

(assert (=> b!1071902 (= res!715017 (not e!612128))))

(declare-fun res!715015 () Bool)

(assert (=> b!1071902 (=> (not res!715015) (not e!612128))))

(assert (=> b!1071902 (= res!715015 (bvslt #b00000000000000000000000000000000 (size!33557 _keys!1163)))))

(declare-fun bm!45235 () Bool)

(assert (=> bm!45235 (= call!45234 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071903 () Bool)

(declare-fun c!107693 () Bool)

(assert (=> b!1071903 (= c!107693 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071903 (= e!612125 e!612131)))

(declare-fun b!1071904 () Bool)

(assert (=> b!1071904 (= e!612134 (= (apply!930 lt!474630 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1071905 () Bool)

(assert (=> b!1071905 (= e!612129 (+!3192 call!45233 (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1071906 () Bool)

(declare-fun Unit!35313 () Unit!35308)

(assert (=> b!1071906 (= e!612132 Unit!35313)))

(declare-fun bm!45236 () Bool)

(assert (=> bm!45236 (= call!45233 (+!3192 (ite c!107694 call!45234 (ite c!107690 call!45236 call!45237)) (ite (or c!107694 c!107690) (tuple2!16515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1071907 () Bool)

(assert (=> b!1071907 (= e!612124 (not call!45238))))

(declare-fun b!1071908 () Bool)

(assert (=> b!1071908 (= e!612125 call!45239)))

(declare-fun b!1071909 () Bool)

(assert (=> b!1071909 (= e!612126 (not call!45235))))

(assert (= (and d!129329 c!107694) b!1071905))

(assert (= (and d!129329 (not c!107694)) b!1071901))

(assert (= (and b!1071901 c!107690) b!1071908))

(assert (= (and b!1071901 (not c!107690)) b!1071903))

(assert (= (and b!1071903 c!107693) b!1071893))

(assert (= (and b!1071903 (not c!107693)) b!1071898))

(assert (= (or b!1071893 b!1071898) bm!45230))

(assert (= (or b!1071908 bm!45230) bm!45234))

(assert (= (or b!1071908 b!1071893) bm!45231))

(assert (= (or b!1071905 bm!45234) bm!45235))

(assert (= (or b!1071905 bm!45231) bm!45236))

(assert (= (and d!129329 res!715018) b!1071890))

(assert (= (and d!129329 c!107691) b!1071896))

(assert (= (and d!129329 (not c!107691)) b!1071906))

(assert (= (and d!129329 res!715016) b!1071902))

(assert (= (and b!1071902 res!715015) b!1071892))

(assert (= (and b!1071902 (not res!715017)) b!1071889))

(assert (= (and b!1071889 res!715014) b!1071895))

(assert (= (and b!1071902 res!715010) b!1071891))

(assert (= (and b!1071891 c!107692) b!1071899))

(assert (= (and b!1071891 (not c!107692)) b!1071907))

(assert (= (and b!1071899 res!715012) b!1071897))

(assert (= (or b!1071899 b!1071907) bm!45232))

(assert (= (and b!1071891 res!715013) b!1071894))

(assert (= (and b!1071894 c!107695) b!1071900))

(assert (= (and b!1071894 (not c!107695)) b!1071909))

(assert (= (and b!1071900 res!715011) b!1071904))

(assert (= (or b!1071900 b!1071909) bm!45233))

(declare-fun b_lambda!16687 () Bool)

(assert (=> (not b_lambda!16687) (not b!1071895)))

(assert (=> b!1071895 t!32387))

(declare-fun b_and!34873 () Bool)

(assert (= b_and!34871 (and (=> t!32387 result!14773) b_and!34873)))

(declare-fun m!990553 () Bool)

(assert (=> b!1071897 m!990553))

(declare-fun m!990555 () Bool)

(assert (=> b!1071904 m!990555))

(assert (=> b!1071889 m!990409))

(assert (=> b!1071889 m!990409))

(declare-fun m!990557 () Bool)

(assert (=> b!1071889 m!990557))

(assert (=> b!1071890 m!990409))

(assert (=> b!1071890 m!990409))

(assert (=> b!1071890 m!990415))

(assert (=> bm!45235 m!990337))

(declare-fun m!990559 () Bool)

(assert (=> b!1071905 m!990559))

(declare-fun m!990561 () Bool)

(assert (=> bm!45233 m!990561))

(declare-fun m!990563 () Bool)

(assert (=> b!1071896 m!990563))

(declare-fun m!990565 () Bool)

(assert (=> b!1071896 m!990565))

(declare-fun m!990567 () Bool)

(assert (=> b!1071896 m!990567))

(declare-fun m!990569 () Bool)

(assert (=> b!1071896 m!990569))

(declare-fun m!990571 () Bool)

(assert (=> b!1071896 m!990571))

(declare-fun m!990573 () Bool)

(assert (=> b!1071896 m!990573))

(declare-fun m!990575 () Bool)

(assert (=> b!1071896 m!990575))

(declare-fun m!990577 () Bool)

(assert (=> b!1071896 m!990577))

(declare-fun m!990579 () Bool)

(assert (=> b!1071896 m!990579))

(assert (=> b!1071896 m!990563))

(declare-fun m!990581 () Bool)

(assert (=> b!1071896 m!990581))

(assert (=> b!1071896 m!990565))

(declare-fun m!990583 () Bool)

(assert (=> b!1071896 m!990583))

(assert (=> b!1071896 m!990567))

(declare-fun m!990585 () Bool)

(assert (=> b!1071896 m!990585))

(assert (=> b!1071896 m!990585))

(declare-fun m!990587 () Bool)

(assert (=> b!1071896 m!990587))

(declare-fun m!990589 () Bool)

(assert (=> b!1071896 m!990589))

(assert (=> b!1071896 m!990409))

(assert (=> b!1071896 m!990337))

(declare-fun m!990591 () Bool)

(assert (=> b!1071896 m!990591))

(assert (=> b!1071892 m!990409))

(assert (=> b!1071892 m!990409))

(assert (=> b!1071892 m!990415))

(assert (=> d!129329 m!990361))

(assert (=> b!1071895 m!990409))

(declare-fun m!990593 () Bool)

(assert (=> b!1071895 m!990593))

(assert (=> b!1071895 m!990429))

(assert (=> b!1071895 m!990409))

(assert (=> b!1071895 m!990429))

(assert (=> b!1071895 m!990431))

(assert (=> b!1071895 m!990433))

(assert (=> b!1071895 m!990431))

(declare-fun m!990595 () Bool)

(assert (=> bm!45236 m!990595))

(declare-fun m!990597 () Bool)

(assert (=> bm!45232 m!990597))

(assert (=> b!1071706 d!129329))

(declare-fun d!129331 () Bool)

(declare-fun e!612135 () Bool)

(assert (=> d!129331 e!612135))

(declare-fun res!715019 () Bool)

(assert (=> d!129331 (=> (not res!715019) (not e!612135))))

(declare-fun lt!474640 () ListLongMap!14483)

(assert (=> d!129331 (= res!715019 (contains!6323 lt!474640 (_1!8268 lt!474450)))))

(declare-fun lt!474639 () List!23050)

(assert (=> d!129331 (= lt!474640 (ListLongMap!14484 lt!474639))))

(declare-fun lt!474642 () Unit!35308)

(declare-fun lt!474641 () Unit!35308)

(assert (=> d!129331 (= lt!474642 lt!474641)))

(assert (=> d!129331 (= (getValueByKey!603 lt!474639 (_1!8268 lt!474450)) (Some!653 (_2!8268 lt!474450)))))

(assert (=> d!129331 (= lt!474641 (lemmaContainsTupThenGetReturnValue!284 lt!474639 (_1!8268 lt!474450) (_2!8268 lt!474450)))))

(assert (=> d!129331 (= lt!474639 (insertStrictlySorted!377 (toList!7257 lt!474455) (_1!8268 lt!474450) (_2!8268 lt!474450)))))

(assert (=> d!129331 (= (+!3192 lt!474455 lt!474450) lt!474640)))

(declare-fun b!1071910 () Bool)

(declare-fun res!715020 () Bool)

(assert (=> b!1071910 (=> (not res!715020) (not e!612135))))

(assert (=> b!1071910 (= res!715020 (= (getValueByKey!603 (toList!7257 lt!474640) (_1!8268 lt!474450)) (Some!653 (_2!8268 lt!474450))))))

(declare-fun b!1071911 () Bool)

(assert (=> b!1071911 (= e!612135 (contains!6324 (toList!7257 lt!474640) lt!474450))))

(assert (= (and d!129331 res!715019) b!1071910))

(assert (= (and b!1071910 res!715020) b!1071911))

(declare-fun m!990599 () Bool)

(assert (=> d!129331 m!990599))

(declare-fun m!990601 () Bool)

(assert (=> d!129331 m!990601))

(declare-fun m!990603 () Bool)

(assert (=> d!129331 m!990603))

(declare-fun m!990605 () Bool)

(assert (=> d!129331 m!990605))

(declare-fun m!990607 () Bool)

(assert (=> b!1071910 m!990607))

(declare-fun m!990609 () Bool)

(assert (=> b!1071911 m!990609))

(assert (=> b!1071706 d!129331))

(declare-fun d!129333 () Bool)

(declare-fun e!612136 () Bool)

(assert (=> d!129333 e!612136))

(declare-fun res!715021 () Bool)

(assert (=> d!129333 (=> (not res!715021) (not e!612136))))

(declare-fun lt!474644 () ListLongMap!14483)

(assert (=> d!129333 (= res!715021 (contains!6323 lt!474644 (_1!8268 lt!474444)))))

(declare-fun lt!474643 () List!23050)

(assert (=> d!129333 (= lt!474644 (ListLongMap!14484 lt!474643))))

(declare-fun lt!474646 () Unit!35308)

(declare-fun lt!474645 () Unit!35308)

(assert (=> d!129333 (= lt!474646 lt!474645)))

(assert (=> d!129333 (= (getValueByKey!603 lt!474643 (_1!8268 lt!474444)) (Some!653 (_2!8268 lt!474444)))))

(assert (=> d!129333 (= lt!474645 (lemmaContainsTupThenGetReturnValue!284 lt!474643 (_1!8268 lt!474444) (_2!8268 lt!474444)))))

(assert (=> d!129333 (= lt!474643 (insertStrictlySorted!377 (toList!7257 (+!3192 lt!474455 lt!474450)) (_1!8268 lt!474444) (_2!8268 lt!474444)))))

(assert (=> d!129333 (= (+!3192 (+!3192 lt!474455 lt!474450) lt!474444) lt!474644)))

(declare-fun b!1071912 () Bool)

(declare-fun res!715022 () Bool)

(assert (=> b!1071912 (=> (not res!715022) (not e!612136))))

(assert (=> b!1071912 (= res!715022 (= (getValueByKey!603 (toList!7257 lt!474644) (_1!8268 lt!474444)) (Some!653 (_2!8268 lt!474444))))))

(declare-fun b!1071913 () Bool)

(assert (=> b!1071913 (= e!612136 (contains!6324 (toList!7257 lt!474644) lt!474444))))

(assert (= (and d!129333 res!715021) b!1071912))

(assert (= (and b!1071912 res!715022) b!1071913))

(declare-fun m!990611 () Bool)

(assert (=> d!129333 m!990611))

(declare-fun m!990613 () Bool)

(assert (=> d!129333 m!990613))

(declare-fun m!990615 () Bool)

(assert (=> d!129333 m!990615))

(declare-fun m!990617 () Bool)

(assert (=> d!129333 m!990617))

(declare-fun m!990619 () Bool)

(assert (=> b!1071912 m!990619))

(declare-fun m!990621 () Bool)

(assert (=> b!1071913 m!990621))

(assert (=> b!1071706 d!129333))

(declare-fun d!129335 () Bool)

(declare-fun lt!474649 () ListLongMap!14483)

(assert (=> d!129335 (not (contains!6323 lt!474649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!73 (List!23050 (_ BitVec 64)) List!23050)

(assert (=> d!129335 (= lt!474649 (ListLongMap!14484 (removeStrictlySorted!73 (toList!7257 lt!474446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129335 (= (-!688 lt!474446 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474649)))

(declare-fun bs!31577 () Bool)

(assert (= bs!31577 d!129335))

(declare-fun m!990623 () Bool)

(assert (=> bs!31577 m!990623))

(declare-fun m!990625 () Bool)

(assert (=> bs!31577 m!990625))

(assert (=> b!1071706 d!129335))

(declare-fun d!129337 () Bool)

(declare-fun lt!474650 () ListLongMap!14483)

(assert (=> d!129337 (not (contains!6323 lt!474650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129337 (= lt!474650 (ListLongMap!14484 (removeStrictlySorted!73 (toList!7257 lt!474445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129337 (= (-!688 lt!474445 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474650)))

(declare-fun bs!31578 () Bool)

(assert (= bs!31578 d!129337))

(declare-fun m!990627 () Bool)

(assert (=> bs!31578 m!990627))

(declare-fun m!990629 () Bool)

(assert (=> bs!31578 m!990629))

(assert (=> b!1071706 d!129337))

(declare-fun d!129339 () Bool)

(assert (=> d!129339 (= (-!688 (+!3192 lt!474454 (tuple2!16515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!474454)))

(declare-fun lt!474653 () Unit!35308)

(declare-fun choose!1743 (ListLongMap!14483 (_ BitVec 64) V!39587) Unit!35308)

(assert (=> d!129339 (= lt!474653 (choose!1743 lt!474454 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129339 (not (contains!6323 lt!474454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129339 (= (addThenRemoveForNewKeyIsSame!58 lt!474454 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!474653)))

(declare-fun bs!31579 () Bool)

(assert (= bs!31579 d!129339))

(declare-fun m!990631 () Bool)

(assert (=> bs!31579 m!990631))

(assert (=> bs!31579 m!990631))

(declare-fun m!990633 () Bool)

(assert (=> bs!31579 m!990633))

(declare-fun m!990635 () Bool)

(assert (=> bs!31579 m!990635))

(declare-fun m!990637 () Bool)

(assert (=> bs!31579 m!990637))

(assert (=> b!1071706 d!129339))

(declare-fun d!129341 () Bool)

(declare-fun e!612137 () Bool)

(assert (=> d!129341 e!612137))

(declare-fun res!715023 () Bool)

(assert (=> d!129341 (=> (not res!715023) (not e!612137))))

(declare-fun lt!474655 () ListLongMap!14483)

(assert (=> d!129341 (= res!715023 (contains!6323 lt!474655 (_1!8268 lt!474444)))))

(declare-fun lt!474654 () List!23050)

(assert (=> d!129341 (= lt!474655 (ListLongMap!14484 lt!474654))))

(declare-fun lt!474657 () Unit!35308)

(declare-fun lt!474656 () Unit!35308)

(assert (=> d!129341 (= lt!474657 lt!474656)))

(assert (=> d!129341 (= (getValueByKey!603 lt!474654 (_1!8268 lt!474444)) (Some!653 (_2!8268 lt!474444)))))

(assert (=> d!129341 (= lt!474656 (lemmaContainsTupThenGetReturnValue!284 lt!474654 (_1!8268 lt!474444) (_2!8268 lt!474444)))))

(assert (=> d!129341 (= lt!474654 (insertStrictlySorted!377 (toList!7257 lt!474451) (_1!8268 lt!474444) (_2!8268 lt!474444)))))

(assert (=> d!129341 (= (+!3192 lt!474451 lt!474444) lt!474655)))

(declare-fun b!1071914 () Bool)

(declare-fun res!715024 () Bool)

(assert (=> b!1071914 (=> (not res!715024) (not e!612137))))

(assert (=> b!1071914 (= res!715024 (= (getValueByKey!603 (toList!7257 lt!474655) (_1!8268 lt!474444)) (Some!653 (_2!8268 lt!474444))))))

(declare-fun b!1071915 () Bool)

(assert (=> b!1071915 (= e!612137 (contains!6324 (toList!7257 lt!474655) lt!474444))))

(assert (= (and d!129341 res!715023) b!1071914))

(assert (= (and b!1071914 res!715024) b!1071915))

(declare-fun m!990639 () Bool)

(assert (=> d!129341 m!990639))

(declare-fun m!990641 () Bool)

(assert (=> d!129341 m!990641))

(declare-fun m!990643 () Bool)

(assert (=> d!129341 m!990643))

(declare-fun m!990645 () Bool)

(assert (=> d!129341 m!990645))

(declare-fun m!990647 () Bool)

(assert (=> b!1071914 m!990647))

(declare-fun m!990649 () Bool)

(assert (=> b!1071915 m!990649))

(assert (=> b!1071710 d!129341))

(declare-fun b!1071922 () Bool)

(declare-fun e!612142 () Bool)

(assert (=> b!1071922 (= e!612142 tp_is_empty!25839)))

(declare-fun condMapEmpty!40471 () Bool)

(declare-fun mapDefault!40471 () ValueCell!12216)

(assert (=> mapNonEmpty!40465 (= condMapEmpty!40471 (= mapRest!40465 ((as const (Array (_ BitVec 32) ValueCell!12216)) mapDefault!40471)))))

(declare-fun e!612143 () Bool)

(declare-fun mapRes!40471 () Bool)

(assert (=> mapNonEmpty!40465 (= tp!77546 (and e!612143 mapRes!40471))))

(declare-fun mapNonEmpty!40471 () Bool)

(declare-fun tp!77555 () Bool)

(assert (=> mapNonEmpty!40471 (= mapRes!40471 (and tp!77555 e!612142))))

(declare-fun mapValue!40471 () ValueCell!12216)

(declare-fun mapKey!40471 () (_ BitVec 32))

(declare-fun mapRest!40471 () (Array (_ BitVec 32) ValueCell!12216))

(assert (=> mapNonEmpty!40471 (= mapRest!40465 (store mapRest!40471 mapKey!40471 mapValue!40471))))

(declare-fun b!1071923 () Bool)

(assert (=> b!1071923 (= e!612143 tp_is_empty!25839)))

(declare-fun mapIsEmpty!40471 () Bool)

(assert (=> mapIsEmpty!40471 mapRes!40471))

(assert (= (and mapNonEmpty!40465 condMapEmpty!40471) mapIsEmpty!40471))

(assert (= (and mapNonEmpty!40465 (not condMapEmpty!40471)) mapNonEmpty!40471))

(assert (= (and mapNonEmpty!40471 ((_ is ValueCellFull!12216) mapValue!40471)) b!1071922))

(assert (= (and mapNonEmpty!40465 ((_ is ValueCellFull!12216) mapDefault!40471)) b!1071923))

(declare-fun m!990651 () Bool)

(assert (=> mapNonEmpty!40471 m!990651))

(declare-fun b_lambda!16689 () Bool)

(assert (= b_lambda!16683 (or (and start!94776 b_free!22029) b_lambda!16689)))

(declare-fun b_lambda!16691 () Bool)

(assert (= b_lambda!16685 (or (and start!94776 b_free!22029) b_lambda!16691)))

(declare-fun b_lambda!16693 () Bool)

(assert (= b_lambda!16679 (or (and start!94776 b_free!22029) b_lambda!16693)))

(declare-fun b_lambda!16695 () Bool)

(assert (= b_lambda!16677 (or (and start!94776 b_free!22029) b_lambda!16695)))

(declare-fun b_lambda!16697 () Bool)

(assert (= b_lambda!16687 (or (and start!94776 b_free!22029) b_lambda!16697)))

(declare-fun b_lambda!16699 () Bool)

(assert (= b_lambda!16681 (or (and start!94776 b_free!22029) b_lambda!16699)))

(check-sat (not b!1071790) (not d!129339) (not b!1071890) (not b!1071822) (not b!1071795) tp_is_empty!25839 (not b!1071915) (not b!1071884) (not b!1071797) (not d!129311) (not d!129309) (not d!129337) (not bm!45205) (not d!129325) (not b_lambda!16697) (not b!1071781) (not b!1071825) (not b!1071816) (not b!1071905) (not bm!45235) (not b!1071753) (not b!1071874) (not mapNonEmpty!40471) (not b!1071883) (not b!1071896) (not b!1071786) (not b!1071801) (not d!129333) (not b!1071895) (not d!129321) (not b_lambda!16695) (not b!1071910) (not bm!45201) (not b!1071815) (not b!1071804) (not b!1071803) (not b!1071912) (not b!1071892) (not b!1071789) (not b!1071876) (not b_lambda!16693) (not d!129335) (not bm!45208) (not bm!45225) b_and!34873 (not b!1071913) (not b!1071783) (not b_next!22029) (not bm!45228) (not bm!45229) (not b!1071787) (not b!1071868) (not b_lambda!16699) (not b_lambda!16691) (not d!129331) (not b!1071904) (not bm!45232) (not b!1071823) (not b!1071911) (not b!1071802) (not bm!45236) (not b!1071914) (not b!1071782) (not b!1071897) (not b!1071889) (not d!129329) (not b!1071755) (not b!1071871) (not b!1071796) (not d!129327) (not d!129341) (not bm!45233) (not bm!45204) (not b!1071875) (not b!1071824) (not d!129323) (not d!129307) (not b!1071751) (not b!1071800) (not bm!45226) (not b!1071788) (not b_lambda!16689) (not b!1071869))
(check-sat b_and!34873 (not b_next!22029))
