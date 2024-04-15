; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94756 () Bool)

(assert start!94756)

(declare-fun b_free!22015 () Bool)

(declare-fun b_next!22015 () Bool)

(assert (=> start!94756 (= b_free!22015 (not b_next!22015))))

(declare-fun tp!77503 () Bool)

(declare-fun b_and!34819 () Bool)

(assert (=> start!94756 (= tp!77503 b_and!34819)))

(declare-fun b!1071354 () Bool)

(declare-fun res!714720 () Bool)

(declare-fun e!611758 () Bool)

(assert (=> b!1071354 (=> (not res!714720) (not e!611758))))

(declare-datatypes ((array!68560 0))(
  ( (array!68561 (arr!32976 (Array (_ BitVec 32) (_ BitVec 64))) (size!33514 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68560)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68560 (_ BitVec 32)) Bool)

(assert (=> b!1071354 (= res!714720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!714717 () Bool)

(assert (=> start!94756 (=> (not res!714717) (not e!611758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94756 (= res!714717 (validMask!0 mask!1515))))

(assert (=> start!94756 e!611758))

(assert (=> start!94756 true))

(declare-fun tp_is_empty!25825 () Bool)

(assert (=> start!94756 tp_is_empty!25825))

(declare-datatypes ((V!39569 0))(
  ( (V!39570 (val!12963 Int)) )
))
(declare-datatypes ((ValueCell!12209 0))(
  ( (ValueCellFull!12209 (v!15578 V!39569)) (EmptyCell!12209) )
))
(declare-datatypes ((array!68562 0))(
  ( (array!68563 (arr!32977 (Array (_ BitVec 32) ValueCell!12209)) (size!33515 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68562)

(declare-fun e!611755 () Bool)

(declare-fun array_inv!25510 (array!68562) Bool)

(assert (=> start!94756 (and (array_inv!25510 _values!955) e!611755)))

(assert (=> start!94756 tp!77503))

(declare-fun array_inv!25511 (array!68560) Bool)

(assert (=> start!94756 (array_inv!25511 _keys!1163)))

(declare-fun b!1071355 () Bool)

(declare-fun e!611753 () Bool)

(declare-fun mapRes!40444 () Bool)

(assert (=> b!1071355 (= e!611755 (and e!611753 mapRes!40444))))

(declare-fun condMapEmpty!40444 () Bool)

(declare-fun mapDefault!40444 () ValueCell!12209)

(assert (=> b!1071355 (= condMapEmpty!40444 (= (arr!32977 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12209)) mapDefault!40444)))))

(declare-fun b!1071356 () Bool)

(assert (=> b!1071356 (= e!611753 tp_is_empty!25825)))

(declare-fun b!1071357 () Bool)

(declare-fun res!714719 () Bool)

(assert (=> b!1071357 (=> (not res!714719) (not e!611758))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071357 (= res!714719 (and (= (size!33515 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33514 _keys!1163) (size!33515 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40444 () Bool)

(assert (=> mapIsEmpty!40444 mapRes!40444))

(declare-fun b!1071358 () Bool)

(declare-fun e!611757 () Bool)

(assert (=> b!1071358 (= e!611757 true)))

(declare-datatypes ((tuple2!16548 0))(
  ( (tuple2!16549 (_1!8285 (_ BitVec 64)) (_2!8285 V!39569)) )
))
(declare-datatypes ((List!23074 0))(
  ( (Nil!23071) (Cons!23070 (h!24279 tuple2!16548) (t!32398 List!23074)) )
))
(declare-datatypes ((ListLongMap!14517 0))(
  ( (ListLongMap!14518 (toList!7274 List!23074)) )
))
(declare-fun lt!473979 () ListLongMap!14517)

(declare-fun lt!473981 () ListLongMap!14517)

(declare-fun -!669 (ListLongMap!14517 (_ BitVec 64)) ListLongMap!14517)

(assert (=> b!1071358 (= lt!473979 (-!669 lt!473981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473977 () ListLongMap!14517)

(declare-fun lt!473976 () ListLongMap!14517)

(assert (=> b!1071358 (= lt!473977 lt!473976)))

(declare-fun zeroValueBefore!47 () V!39569)

(declare-datatypes ((Unit!35127 0))(
  ( (Unit!35128) )
))
(declare-fun lt!473988 () Unit!35127)

(declare-fun lt!473978 () ListLongMap!14517)

(declare-fun minValue!907 () V!39569)

(declare-fun addCommutativeForDiffKeys!727 (ListLongMap!14517 (_ BitVec 64) V!39569 (_ BitVec 64) V!39569) Unit!35127)

(assert (=> b!1071358 (= lt!473988 (addCommutativeForDiffKeys!727 lt!473978 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473987 () ListLongMap!14517)

(assert (=> b!1071358 (= (-!669 lt!473976 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473987)))

(declare-fun lt!473983 () tuple2!16548)

(declare-fun +!3209 (ListLongMap!14517 tuple2!16548) ListLongMap!14517)

(assert (=> b!1071358 (= lt!473976 (+!3209 lt!473987 lt!473983))))

(declare-fun lt!473980 () Unit!35127)

(declare-fun addThenRemoveForNewKeyIsSame!50 (ListLongMap!14517 (_ BitVec 64) V!39569) Unit!35127)

(assert (=> b!1071358 (= lt!473980 (addThenRemoveForNewKeyIsSame!50 lt!473987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473986 () tuple2!16548)

(assert (=> b!1071358 (= lt!473987 (+!3209 lt!473978 lt!473986))))

(declare-fun e!611759 () Bool)

(assert (=> b!1071358 e!611759))

(declare-fun res!714716 () Bool)

(assert (=> b!1071358 (=> (not res!714716) (not e!611759))))

(assert (=> b!1071358 (= res!714716 (= lt!473981 lt!473977))))

(assert (=> b!1071358 (= lt!473977 (+!3209 (+!3209 lt!473978 lt!473983) lt!473986))))

(assert (=> b!1071358 (= lt!473986 (tuple2!16549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071358 (= lt!473983 (tuple2!16549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473982 () ListLongMap!14517)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39569)

(declare-fun getCurrentListMap!4082 (array!68560 array!68562 (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 (_ BitVec 32) Int) ListLongMap!14517)

(assert (=> b!1071358 (= lt!473982 (getCurrentListMap!4082 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071358 (= lt!473981 (getCurrentListMap!4082 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071359 () Bool)

(declare-fun res!714721 () Bool)

(assert (=> b!1071359 (=> (not res!714721) (not e!611758))))

(declare-datatypes ((List!23075 0))(
  ( (Nil!23072) (Cons!23071 (h!24280 (_ BitVec 64)) (t!32399 List!23075)) )
))
(declare-fun arrayNoDuplicates!0 (array!68560 (_ BitVec 32) List!23075) Bool)

(assert (=> b!1071359 (= res!714721 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23072))))

(declare-fun b!1071360 () Bool)

(declare-fun lt!473985 () ListLongMap!14517)

(assert (=> b!1071360 (= e!611759 (= lt!473982 (+!3209 lt!473985 lt!473986)))))

(declare-fun b!1071361 () Bool)

(assert (=> b!1071361 (= e!611758 (not e!611757))))

(declare-fun res!714718 () Bool)

(assert (=> b!1071361 (=> res!714718 e!611757)))

(assert (=> b!1071361 (= res!714718 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071361 (= lt!473978 lt!473985)))

(declare-fun lt!473984 () Unit!35127)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!852 (array!68560 array!68562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 V!39569 V!39569 (_ BitVec 32) Int) Unit!35127)

(assert (=> b!1071361 (= lt!473984 (lemmaNoChangeToArrayThenSameMapNoExtras!852 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3858 (array!68560 array!68562 (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 (_ BitVec 32) Int) ListLongMap!14517)

(assert (=> b!1071361 (= lt!473985 (getCurrentListMapNoExtraKeys!3858 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071361 (= lt!473978 (getCurrentListMapNoExtraKeys!3858 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071362 () Bool)

(declare-fun e!611754 () Bool)

(assert (=> b!1071362 (= e!611754 tp_is_empty!25825)))

(declare-fun mapNonEmpty!40444 () Bool)

(declare-fun tp!77504 () Bool)

(assert (=> mapNonEmpty!40444 (= mapRes!40444 (and tp!77504 e!611754))))

(declare-fun mapValue!40444 () ValueCell!12209)

(declare-fun mapRest!40444 () (Array (_ BitVec 32) ValueCell!12209))

(declare-fun mapKey!40444 () (_ BitVec 32))

(assert (=> mapNonEmpty!40444 (= (arr!32977 _values!955) (store mapRest!40444 mapKey!40444 mapValue!40444))))

(assert (= (and start!94756 res!714717) b!1071357))

(assert (= (and b!1071357 res!714719) b!1071354))

(assert (= (and b!1071354 res!714720) b!1071359))

(assert (= (and b!1071359 res!714721) b!1071361))

(assert (= (and b!1071361 (not res!714718)) b!1071358))

(assert (= (and b!1071358 res!714716) b!1071360))

(assert (= (and b!1071355 condMapEmpty!40444) mapIsEmpty!40444))

(assert (= (and b!1071355 (not condMapEmpty!40444)) mapNonEmpty!40444))

(get-info :version)

(assert (= (and mapNonEmpty!40444 ((_ is ValueCellFull!12209) mapValue!40444)) b!1071362))

(assert (= (and b!1071355 ((_ is ValueCellFull!12209) mapDefault!40444)) b!1071356))

(assert (= start!94756 b!1071355))

(declare-fun m!989423 () Bool)

(assert (=> mapNonEmpty!40444 m!989423))

(declare-fun m!989425 () Bool)

(assert (=> b!1071358 m!989425))

(declare-fun m!989427 () Bool)

(assert (=> b!1071358 m!989427))

(declare-fun m!989429 () Bool)

(assert (=> b!1071358 m!989429))

(declare-fun m!989431 () Bool)

(assert (=> b!1071358 m!989431))

(declare-fun m!989433 () Bool)

(assert (=> b!1071358 m!989433))

(declare-fun m!989435 () Bool)

(assert (=> b!1071358 m!989435))

(declare-fun m!989437 () Bool)

(assert (=> b!1071358 m!989437))

(declare-fun m!989439 () Bool)

(assert (=> b!1071358 m!989439))

(declare-fun m!989441 () Bool)

(assert (=> b!1071358 m!989441))

(assert (=> b!1071358 m!989431))

(declare-fun m!989443 () Bool)

(assert (=> b!1071358 m!989443))

(declare-fun m!989445 () Bool)

(assert (=> b!1071354 m!989445))

(declare-fun m!989447 () Bool)

(assert (=> b!1071359 m!989447))

(declare-fun m!989449 () Bool)

(assert (=> b!1071361 m!989449))

(declare-fun m!989451 () Bool)

(assert (=> b!1071361 m!989451))

(declare-fun m!989453 () Bool)

(assert (=> b!1071361 m!989453))

(declare-fun m!989455 () Bool)

(assert (=> b!1071360 m!989455))

(declare-fun m!989457 () Bool)

(assert (=> start!94756 m!989457))

(declare-fun m!989459 () Bool)

(assert (=> start!94756 m!989459))

(declare-fun m!989461 () Bool)

(assert (=> start!94756 m!989461))

(check-sat b_and!34819 (not b!1071359) tp_is_empty!25825 (not start!94756) (not b!1071358) (not b!1071354) (not mapNonEmpty!40444) (not b!1071361) (not b!1071360) (not b_next!22015))
(check-sat b_and!34819 (not b_next!22015))
