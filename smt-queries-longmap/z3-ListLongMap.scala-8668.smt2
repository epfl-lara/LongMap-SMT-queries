; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105366 () Bool)

(assert start!105366)

(declare-fun b_free!27043 () Bool)

(declare-fun b_next!27043 () Bool)

(assert (=> start!105366 (= b_free!27043 (not b_next!27043))))

(declare-fun tp!94639 () Bool)

(declare-fun b_and!44863 () Bool)

(assert (=> start!105366 (= tp!94639 b_and!44863)))

(declare-fun b!1255353 () Bool)

(declare-fun e!713473 () Bool)

(declare-fun tp_is_empty!31945 () Bool)

(assert (=> b!1255353 (= e!713473 tp_is_empty!31945)))

(declare-fun mapIsEmpty!49699 () Bool)

(declare-fun mapRes!49699 () Bool)

(assert (=> mapIsEmpty!49699 mapRes!49699))

(declare-fun b!1255354 () Bool)

(declare-fun res!836942 () Bool)

(declare-fun e!713472 () Bool)

(assert (=> b!1255354 (=> (not res!836942) (not e!713472))))

(declare-datatypes ((array!81461 0))(
  ( (array!81462 (arr!39291 (Array (_ BitVec 32) (_ BitVec 64))) (size!39829 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81461)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81461 (_ BitVec 32)) Bool)

(assert (=> b!1255354 (= res!836942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255355 () Bool)

(declare-fun res!836943 () Bool)

(assert (=> b!1255355 (=> (not res!836943) (not e!713472))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47959 0))(
  ( (V!47960 (val!16035 Int)) )
))
(declare-datatypes ((ValueCell!15209 0))(
  ( (ValueCellFull!15209 (v!18734 V!47959)) (EmptyCell!15209) )
))
(declare-datatypes ((array!81463 0))(
  ( (array!81464 (arr!39292 (Array (_ BitVec 32) ValueCell!15209)) (size!39830 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81463)

(assert (=> b!1255355 (= res!836943 (and (= (size!39830 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39829 _keys!1118) (size!39830 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255357 () Bool)

(declare-fun e!713471 () Bool)

(declare-fun e!713470 () Bool)

(assert (=> b!1255357 (= e!713471 (and e!713470 mapRes!49699))))

(declare-fun condMapEmpty!49699 () Bool)

(declare-fun mapDefault!49699 () ValueCell!15209)

(assert (=> b!1255357 (= condMapEmpty!49699 (= (arr!39292 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15209)) mapDefault!49699)))))

(declare-fun b!1255358 () Bool)

(declare-fun res!836940 () Bool)

(assert (=> b!1255358 (=> (not res!836940) (not e!713472))))

(declare-datatypes ((List!27997 0))(
  ( (Nil!27994) (Cons!27993 (h!29202 (_ BitVec 64)) (t!41473 List!27997)) )
))
(declare-fun arrayNoDuplicates!0 (array!81461 (_ BitVec 32) List!27997) Bool)

(assert (=> b!1255358 (= res!836940 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27994))))

(declare-fun mapNonEmpty!49699 () Bool)

(declare-fun tp!94640 () Bool)

(assert (=> mapNonEmpty!49699 (= mapRes!49699 (and tp!94640 e!713473))))

(declare-fun mapKey!49699 () (_ BitVec 32))

(declare-fun mapValue!49699 () ValueCell!15209)

(declare-fun mapRest!49699 () (Array (_ BitVec 32) ValueCell!15209))

(assert (=> mapNonEmpty!49699 (= (arr!39292 _values!914) (store mapRest!49699 mapKey!49699 mapValue!49699))))

(declare-fun b!1255359 () Bool)

(assert (=> b!1255359 (= e!713470 tp_is_empty!31945)))

(declare-fun b!1255356 () Bool)

(assert (=> b!1255356 (= e!713472 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39829 _keys!1118)))))))

(declare-datatypes ((tuple2!20786 0))(
  ( (tuple2!20787 (_1!10404 (_ BitVec 64)) (_2!10404 V!47959)) )
))
(declare-datatypes ((List!27998 0))(
  ( (Nil!27995) (Cons!27994 (h!29203 tuple2!20786) (t!41474 List!27998)) )
))
(declare-datatypes ((ListLongMap!18659 0))(
  ( (ListLongMap!18660 (toList!9345 List!27998)) )
))
(declare-fun lt!567400 () ListLongMap!18659)

(declare-fun lt!567399 () ListLongMap!18659)

(assert (=> b!1255356 (= lt!567400 lt!567399)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41657 0))(
  ( (Unit!41658) )
))
(declare-fun lt!567398 () Unit!41657)

(declare-fun minValueAfter!43 () V!47959)

(declare-fun zeroValue!871 () V!47959)

(declare-fun minValueBefore!43 () V!47959)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1062 (array!81461 array!81463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47959 V!47959 V!47959 V!47959 (_ BitVec 32) Int) Unit!41657)

(assert (=> b!1255356 (= lt!567398 (lemmaNoChangeToArrayThenSameMapNoExtras!1062 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5740 (array!81461 array!81463 (_ BitVec 32) (_ BitVec 32) V!47959 V!47959 (_ BitVec 32) Int) ListLongMap!18659)

(assert (=> b!1255356 (= lt!567399 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255356 (= lt!567400 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836941 () Bool)

(assert (=> start!105366 (=> (not res!836941) (not e!713472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105366 (= res!836941 (validMask!0 mask!1466))))

(assert (=> start!105366 e!713472))

(assert (=> start!105366 true))

(assert (=> start!105366 tp!94639))

(assert (=> start!105366 tp_is_empty!31945))

(declare-fun array_inv!30079 (array!81461) Bool)

(assert (=> start!105366 (array_inv!30079 _keys!1118)))

(declare-fun array_inv!30080 (array!81463) Bool)

(assert (=> start!105366 (and (array_inv!30080 _values!914) e!713471)))

(assert (= (and start!105366 res!836941) b!1255355))

(assert (= (and b!1255355 res!836943) b!1255354))

(assert (= (and b!1255354 res!836942) b!1255358))

(assert (= (and b!1255358 res!836940) b!1255356))

(assert (= (and b!1255357 condMapEmpty!49699) mapIsEmpty!49699))

(assert (= (and b!1255357 (not condMapEmpty!49699)) mapNonEmpty!49699))

(get-info :version)

(assert (= (and mapNonEmpty!49699 ((_ is ValueCellFull!15209) mapValue!49699)) b!1255353))

(assert (= (and b!1255357 ((_ is ValueCellFull!15209) mapDefault!49699)) b!1255359))

(assert (= start!105366 b!1255357))

(declare-fun m!1155655 () Bool)

(assert (=> mapNonEmpty!49699 m!1155655))

(declare-fun m!1155657 () Bool)

(assert (=> b!1255358 m!1155657))

(declare-fun m!1155659 () Bool)

(assert (=> b!1255354 m!1155659))

(declare-fun m!1155661 () Bool)

(assert (=> b!1255356 m!1155661))

(declare-fun m!1155663 () Bool)

(assert (=> b!1255356 m!1155663))

(declare-fun m!1155665 () Bool)

(assert (=> b!1255356 m!1155665))

(declare-fun m!1155667 () Bool)

(assert (=> start!105366 m!1155667))

(declare-fun m!1155669 () Bool)

(assert (=> start!105366 m!1155669))

(declare-fun m!1155671 () Bool)

(assert (=> start!105366 m!1155671))

(check-sat (not b!1255358) (not b!1255354) (not start!105366) tp_is_empty!31945 (not mapNonEmpty!49699) (not b!1255356) b_and!44863 (not b_next!27043))
(check-sat b_and!44863 (not b_next!27043))
(get-model)

(declare-fun b!1255412 () Bool)

(declare-fun e!713512 () Bool)

(declare-fun call!61751 () Bool)

(assert (=> b!1255412 (= e!713512 call!61751)))

(declare-fun b!1255413 () Bool)

(declare-fun e!713513 () Bool)

(declare-fun contains!7499 (List!27997 (_ BitVec 64)) Bool)

(assert (=> b!1255413 (= e!713513 (contains!7499 Nil!27994 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255414 () Bool)

(declare-fun e!713515 () Bool)

(declare-fun e!713514 () Bool)

(assert (=> b!1255414 (= e!713515 e!713514)))

(declare-fun res!836975 () Bool)

(assert (=> b!1255414 (=> (not res!836975) (not e!713514))))

(assert (=> b!1255414 (= res!836975 (not e!713513))))

(declare-fun res!836974 () Bool)

(assert (=> b!1255414 (=> (not res!836974) (not e!713513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1255414 (= res!836974 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255415 () Bool)

(assert (=> b!1255415 (= e!713512 call!61751)))

(declare-fun bm!61748 () Bool)

(declare-fun c!122371 () Bool)

(assert (=> bm!61748 (= call!61751 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122371 (Cons!27993 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000) Nil!27994) Nil!27994)))))

(declare-fun d!138017 () Bool)

(declare-fun res!836976 () Bool)

(assert (=> d!138017 (=> res!836976 e!713515)))

(assert (=> d!138017 (= res!836976 (bvsge #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(assert (=> d!138017 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27994) e!713515)))

(declare-fun b!1255416 () Bool)

(assert (=> b!1255416 (= e!713514 e!713512)))

(assert (=> b!1255416 (= c!122371 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138017 (not res!836976)) b!1255414))

(assert (= (and b!1255414 res!836974) b!1255413))

(assert (= (and b!1255414 res!836975) b!1255416))

(assert (= (and b!1255416 c!122371) b!1255412))

(assert (= (and b!1255416 (not c!122371)) b!1255415))

(assert (= (or b!1255412 b!1255415) bm!61748))

(declare-fun m!1155709 () Bool)

(assert (=> b!1255413 m!1155709))

(assert (=> b!1255413 m!1155709))

(declare-fun m!1155711 () Bool)

(assert (=> b!1255413 m!1155711))

(assert (=> b!1255414 m!1155709))

(assert (=> b!1255414 m!1155709))

(declare-fun m!1155713 () Bool)

(assert (=> b!1255414 m!1155713))

(assert (=> bm!61748 m!1155709))

(declare-fun m!1155715 () Bool)

(assert (=> bm!61748 m!1155715))

(assert (=> b!1255416 m!1155709))

(assert (=> b!1255416 m!1155709))

(assert (=> b!1255416 m!1155713))

(assert (=> b!1255358 d!138017))

(declare-fun b!1255425 () Bool)

(declare-fun e!713522 () Bool)

(declare-fun call!61754 () Bool)

(assert (=> b!1255425 (= e!713522 call!61754)))

(declare-fun b!1255426 () Bool)

(declare-fun e!713524 () Bool)

(declare-fun e!713523 () Bool)

(assert (=> b!1255426 (= e!713524 e!713523)))

(declare-fun c!122374 () Bool)

(assert (=> b!1255426 (= c!122374 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61751 () Bool)

(assert (=> bm!61751 (= call!61754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1255428 () Bool)

(assert (=> b!1255428 (= e!713523 e!713522)))

(declare-fun lt!567427 () (_ BitVec 64))

(assert (=> b!1255428 (= lt!567427 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567425 () Unit!41657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81461 (_ BitVec 64) (_ BitVec 32)) Unit!41657)

(assert (=> b!1255428 (= lt!567425 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567427 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1255428 (arrayContainsKey!0 _keys!1118 lt!567427 #b00000000000000000000000000000000)))

(declare-fun lt!567426 () Unit!41657)

(assert (=> b!1255428 (= lt!567426 lt!567425)))

(declare-fun res!836981 () Bool)

(declare-datatypes ((SeekEntryResult!9964 0))(
  ( (MissingZero!9964 (index!42227 (_ BitVec 32))) (Found!9964 (index!42228 (_ BitVec 32))) (Intermediate!9964 (undefined!10776 Bool) (index!42229 (_ BitVec 32)) (x!110537 (_ BitVec 32))) (Undefined!9964) (MissingVacant!9964 (index!42230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81461 (_ BitVec 32)) SeekEntryResult!9964)

(assert (=> b!1255428 (= res!836981 (= (seekEntryOrOpen!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9964 #b00000000000000000000000000000000)))))

(assert (=> b!1255428 (=> (not res!836981) (not e!713522))))

(declare-fun b!1255427 () Bool)

(assert (=> b!1255427 (= e!713523 call!61754)))

(declare-fun d!138019 () Bool)

(declare-fun res!836982 () Bool)

(assert (=> d!138019 (=> res!836982 e!713524)))

(assert (=> d!138019 (= res!836982 (bvsge #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(assert (=> d!138019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!713524)))

(assert (= (and d!138019 (not res!836982)) b!1255426))

(assert (= (and b!1255426 c!122374) b!1255428))

(assert (= (and b!1255426 (not c!122374)) b!1255427))

(assert (= (and b!1255428 res!836981) b!1255425))

(assert (= (or b!1255425 b!1255427) bm!61751))

(assert (=> b!1255426 m!1155709))

(assert (=> b!1255426 m!1155709))

(assert (=> b!1255426 m!1155713))

(declare-fun m!1155717 () Bool)

(assert (=> bm!61751 m!1155717))

(assert (=> b!1255428 m!1155709))

(declare-fun m!1155719 () Bool)

(assert (=> b!1255428 m!1155719))

(declare-fun m!1155721 () Bool)

(assert (=> b!1255428 m!1155721))

(assert (=> b!1255428 m!1155709))

(declare-fun m!1155723 () Bool)

(assert (=> b!1255428 m!1155723))

(assert (=> b!1255354 d!138019))

(declare-fun d!138021 () Bool)

(assert (=> d!138021 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105366 d!138021))

(declare-fun d!138023 () Bool)

(assert (=> d!138023 (= (array_inv!30079 _keys!1118) (bvsge (size!39829 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105366 d!138023))

(declare-fun d!138025 () Bool)

(assert (=> d!138025 (= (array_inv!30080 _values!914) (bvsge (size!39830 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105366 d!138025))

(declare-fun d!138027 () Bool)

(assert (=> d!138027 (= (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567430 () Unit!41657)

(declare-fun choose!1866 (array!81461 array!81463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47959 V!47959 V!47959 V!47959 (_ BitVec 32) Int) Unit!41657)

(assert (=> d!138027 (= lt!567430 (choose!1866 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138027 (validMask!0 mask!1466)))

(assert (=> d!138027 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1062 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567430)))

(declare-fun bs!35460 () Bool)

(assert (= bs!35460 d!138027))

(assert (=> bs!35460 m!1155665))

(assert (=> bs!35460 m!1155663))

(declare-fun m!1155725 () Bool)

(assert (=> bs!35460 m!1155725))

(assert (=> bs!35460 m!1155667))

(assert (=> b!1255356 d!138027))

(declare-fun b!1255453 () Bool)

(declare-fun lt!567447 () ListLongMap!18659)

(declare-fun e!713540 () Bool)

(assert (=> b!1255453 (= e!713540 (= lt!567447 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1255454 () Bool)

(declare-fun e!713541 () Bool)

(declare-fun e!713539 () Bool)

(assert (=> b!1255454 (= e!713541 e!713539)))

(assert (=> b!1255454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(declare-fun res!836991 () Bool)

(declare-fun contains!7500 (ListLongMap!18659 (_ BitVec 64)) Bool)

(assert (=> b!1255454 (= res!836991 (contains!7500 lt!567447 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255454 (=> (not res!836991) (not e!713539))))

(declare-fun b!1255455 () Bool)

(assert (=> b!1255455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(assert (=> b!1255455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39830 _values!914)))))

(declare-fun apply!980 (ListLongMap!18659 (_ BitVec 64)) V!47959)

(declare-fun get!20121 (ValueCell!15209 V!47959) V!47959)

(declare-fun dynLambda!3410 (Int (_ BitVec 64)) V!47959)

(assert (=> b!1255455 (= e!713539 (= (apply!980 lt!567447 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)) (get!20121 (select (arr!39292 _values!914) #b00000000000000000000000000000000) (dynLambda!3410 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1255456 () Bool)

(declare-fun e!713542 () Bool)

(assert (=> b!1255456 (= e!713542 e!713541)))

(declare-fun c!122385 () Bool)

(declare-fun e!713543 () Bool)

(assert (=> b!1255456 (= c!122385 e!713543)))

(declare-fun res!836993 () Bool)

(assert (=> b!1255456 (=> (not res!836993) (not e!713543))))

(assert (=> b!1255456 (= res!836993 (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(declare-fun d!138029 () Bool)

(assert (=> d!138029 e!713542))

(declare-fun res!836992 () Bool)

(assert (=> d!138029 (=> (not res!836992) (not e!713542))))

(assert (=> d!138029 (= res!836992 (not (contains!7500 lt!567447 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!713544 () ListLongMap!18659)

(assert (=> d!138029 (= lt!567447 e!713544)))

(declare-fun c!122384 () Bool)

(assert (=> d!138029 (= c!122384 (bvsge #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(assert (=> d!138029 (validMask!0 mask!1466)))

(assert (=> d!138029 (= (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567447)))

(declare-fun b!1255457 () Bool)

(declare-fun e!713545 () ListLongMap!18659)

(declare-fun call!61757 () ListLongMap!18659)

(assert (=> b!1255457 (= e!713545 call!61757)))

(declare-fun bm!61754 () Bool)

(assert (=> bm!61754 (= call!61757 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1255458 () Bool)

(assert (=> b!1255458 (= e!713544 (ListLongMap!18660 Nil!27995))))

(declare-fun b!1255459 () Bool)

(declare-fun res!836994 () Bool)

(assert (=> b!1255459 (=> (not res!836994) (not e!713542))))

(assert (=> b!1255459 (= res!836994 (not (contains!7500 lt!567447 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1255460 () Bool)

(assert (=> b!1255460 (= e!713544 e!713545)))

(declare-fun c!122383 () Bool)

(assert (=> b!1255460 (= c!122383 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255461 () Bool)

(assert (=> b!1255461 (= e!713541 e!713540)))

(declare-fun c!122386 () Bool)

(assert (=> b!1255461 (= c!122386 (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(declare-fun b!1255462 () Bool)

(declare-fun lt!567451 () Unit!41657)

(declare-fun lt!567448 () Unit!41657)

(assert (=> b!1255462 (= lt!567451 lt!567448)))

(declare-fun lt!567446 () (_ BitVec 64))

(declare-fun lt!567450 () ListLongMap!18659)

(declare-fun lt!567445 () V!47959)

(declare-fun lt!567449 () (_ BitVec 64))

(declare-fun +!4225 (ListLongMap!18659 tuple2!20786) ListLongMap!18659)

(assert (=> b!1255462 (not (contains!7500 (+!4225 lt!567450 (tuple2!20787 lt!567446 lt!567445)) lt!567449))))

(declare-fun addStillNotContains!316 (ListLongMap!18659 (_ BitVec 64) V!47959 (_ BitVec 64)) Unit!41657)

(assert (=> b!1255462 (= lt!567448 (addStillNotContains!316 lt!567450 lt!567446 lt!567445 lt!567449))))

(assert (=> b!1255462 (= lt!567449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1255462 (= lt!567445 (get!20121 (select (arr!39292 _values!914) #b00000000000000000000000000000000) (dynLambda!3410 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1255462 (= lt!567446 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255462 (= lt!567450 call!61757)))

(assert (=> b!1255462 (= e!713545 (+!4225 call!61757 (tuple2!20787 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000) (get!20121 (select (arr!39292 _values!914) #b00000000000000000000000000000000) (dynLambda!3410 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1255463 () Bool)

(assert (=> b!1255463 (= e!713543 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255463 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1255464 () Bool)

(declare-fun isEmpty!1035 (ListLongMap!18659) Bool)

(assert (=> b!1255464 (= e!713540 (isEmpty!1035 lt!567447))))

(assert (= (and d!138029 c!122384) b!1255458))

(assert (= (and d!138029 (not c!122384)) b!1255460))

(assert (= (and b!1255460 c!122383) b!1255462))

(assert (= (and b!1255460 (not c!122383)) b!1255457))

(assert (= (or b!1255462 b!1255457) bm!61754))

(assert (= (and d!138029 res!836992) b!1255459))

(assert (= (and b!1255459 res!836994) b!1255456))

(assert (= (and b!1255456 res!836993) b!1255463))

(assert (= (and b!1255456 c!122385) b!1255454))

(assert (= (and b!1255456 (not c!122385)) b!1255461))

(assert (= (and b!1255454 res!836991) b!1255455))

(assert (= (and b!1255461 c!122386) b!1255453))

(assert (= (and b!1255461 (not c!122386)) b!1255464))

(declare-fun b_lambda!22641 () Bool)

(assert (=> (not b_lambda!22641) (not b!1255455)))

(declare-fun t!41478 () Bool)

(declare-fun tb!11293 () Bool)

(assert (=> (and start!105366 (= defaultEntry!922 defaultEntry!922) t!41478) tb!11293))

(declare-fun result!23303 () Bool)

(assert (=> tb!11293 (= result!23303 tp_is_empty!31945)))

(assert (=> b!1255455 t!41478))

(declare-fun b_and!44869 () Bool)

(assert (= b_and!44863 (and (=> t!41478 result!23303) b_and!44869)))

(declare-fun b_lambda!22643 () Bool)

(assert (=> (not b_lambda!22643) (not b!1255462)))

(assert (=> b!1255462 t!41478))

(declare-fun b_and!44871 () Bool)

(assert (= b_and!44869 (and (=> t!41478 result!23303) b_and!44871)))

(declare-fun m!1155727 () Bool)

(assert (=> b!1255462 m!1155727))

(declare-fun m!1155729 () Bool)

(assert (=> b!1255462 m!1155729))

(declare-fun m!1155731 () Bool)

(assert (=> b!1255462 m!1155731))

(declare-fun m!1155733 () Bool)

(assert (=> b!1255462 m!1155733))

(assert (=> b!1255462 m!1155733))

(declare-fun m!1155735 () Bool)

(assert (=> b!1255462 m!1155735))

(assert (=> b!1255462 m!1155709))

(declare-fun m!1155737 () Bool)

(assert (=> b!1255462 m!1155737))

(assert (=> b!1255462 m!1155729))

(assert (=> b!1255462 m!1155731))

(declare-fun m!1155739 () Bool)

(assert (=> b!1255462 m!1155739))

(assert (=> b!1255454 m!1155709))

(assert (=> b!1255454 m!1155709))

(declare-fun m!1155741 () Bool)

(assert (=> b!1255454 m!1155741))

(declare-fun m!1155743 () Bool)

(assert (=> b!1255459 m!1155743))

(declare-fun m!1155745 () Bool)

(assert (=> d!138029 m!1155745))

(assert (=> d!138029 m!1155667))

(declare-fun m!1155747 () Bool)

(assert (=> bm!61754 m!1155747))

(declare-fun m!1155749 () Bool)

(assert (=> b!1255464 m!1155749))

(assert (=> b!1255460 m!1155709))

(assert (=> b!1255460 m!1155709))

(assert (=> b!1255460 m!1155713))

(assert (=> b!1255455 m!1155709))

(assert (=> b!1255455 m!1155729))

(assert (=> b!1255455 m!1155731))

(assert (=> b!1255455 m!1155709))

(declare-fun m!1155751 () Bool)

(assert (=> b!1255455 m!1155751))

(assert (=> b!1255455 m!1155729))

(assert (=> b!1255455 m!1155731))

(assert (=> b!1255455 m!1155739))

(assert (=> b!1255453 m!1155747))

(assert (=> b!1255463 m!1155709))

(assert (=> b!1255463 m!1155709))

(assert (=> b!1255463 m!1155713))

(assert (=> b!1255356 d!138029))

(declare-fun b!1255467 () Bool)

(declare-fun e!713547 () Bool)

(declare-fun lt!567454 () ListLongMap!18659)

(assert (=> b!1255467 (= e!713547 (= lt!567454 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1255468 () Bool)

(declare-fun e!713548 () Bool)

(declare-fun e!713546 () Bool)

(assert (=> b!1255468 (= e!713548 e!713546)))

(assert (=> b!1255468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(declare-fun res!836995 () Bool)

(assert (=> b!1255468 (= res!836995 (contains!7500 lt!567454 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255468 (=> (not res!836995) (not e!713546))))

(declare-fun b!1255469 () Bool)

(assert (=> b!1255469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(assert (=> b!1255469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39830 _values!914)))))

(assert (=> b!1255469 (= e!713546 (= (apply!980 lt!567454 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)) (get!20121 (select (arr!39292 _values!914) #b00000000000000000000000000000000) (dynLambda!3410 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1255470 () Bool)

(declare-fun e!713549 () Bool)

(assert (=> b!1255470 (= e!713549 e!713548)))

(declare-fun c!122389 () Bool)

(declare-fun e!713550 () Bool)

(assert (=> b!1255470 (= c!122389 e!713550)))

(declare-fun res!836997 () Bool)

(assert (=> b!1255470 (=> (not res!836997) (not e!713550))))

(assert (=> b!1255470 (= res!836997 (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(declare-fun d!138031 () Bool)

(assert (=> d!138031 e!713549))

(declare-fun res!836996 () Bool)

(assert (=> d!138031 (=> (not res!836996) (not e!713549))))

(assert (=> d!138031 (= res!836996 (not (contains!7500 lt!567454 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!713551 () ListLongMap!18659)

(assert (=> d!138031 (= lt!567454 e!713551)))

(declare-fun c!122388 () Bool)

(assert (=> d!138031 (= c!122388 (bvsge #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(assert (=> d!138031 (validMask!0 mask!1466)))

(assert (=> d!138031 (= (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567454)))

(declare-fun b!1255471 () Bool)

(declare-fun e!713552 () ListLongMap!18659)

(declare-fun call!61758 () ListLongMap!18659)

(assert (=> b!1255471 (= e!713552 call!61758)))

(declare-fun bm!61755 () Bool)

(assert (=> bm!61755 (= call!61758 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1255472 () Bool)

(assert (=> b!1255472 (= e!713551 (ListLongMap!18660 Nil!27995))))

(declare-fun b!1255473 () Bool)

(declare-fun res!836998 () Bool)

(assert (=> b!1255473 (=> (not res!836998) (not e!713549))))

(assert (=> b!1255473 (= res!836998 (not (contains!7500 lt!567454 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1255474 () Bool)

(assert (=> b!1255474 (= e!713551 e!713552)))

(declare-fun c!122387 () Bool)

(assert (=> b!1255474 (= c!122387 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255475 () Bool)

(assert (=> b!1255475 (= e!713548 e!713547)))

(declare-fun c!122390 () Bool)

(assert (=> b!1255475 (= c!122390 (bvslt #b00000000000000000000000000000000 (size!39829 _keys!1118)))))

(declare-fun b!1255476 () Bool)

(declare-fun lt!567458 () Unit!41657)

(declare-fun lt!567455 () Unit!41657)

(assert (=> b!1255476 (= lt!567458 lt!567455)))

(declare-fun lt!567452 () V!47959)

(declare-fun lt!567453 () (_ BitVec 64))

(declare-fun lt!567456 () (_ BitVec 64))

(declare-fun lt!567457 () ListLongMap!18659)

(assert (=> b!1255476 (not (contains!7500 (+!4225 lt!567457 (tuple2!20787 lt!567453 lt!567452)) lt!567456))))

(assert (=> b!1255476 (= lt!567455 (addStillNotContains!316 lt!567457 lt!567453 lt!567452 lt!567456))))

(assert (=> b!1255476 (= lt!567456 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1255476 (= lt!567452 (get!20121 (select (arr!39292 _values!914) #b00000000000000000000000000000000) (dynLambda!3410 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1255476 (= lt!567453 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255476 (= lt!567457 call!61758)))

(assert (=> b!1255476 (= e!713552 (+!4225 call!61758 (tuple2!20787 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000) (get!20121 (select (arr!39292 _values!914) #b00000000000000000000000000000000) (dynLambda!3410 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1255477 () Bool)

(assert (=> b!1255477 (= e!713550 (validKeyInArray!0 (select (arr!39291 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255477 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1255478 () Bool)

(assert (=> b!1255478 (= e!713547 (isEmpty!1035 lt!567454))))

(assert (= (and d!138031 c!122388) b!1255472))

(assert (= (and d!138031 (not c!122388)) b!1255474))

(assert (= (and b!1255474 c!122387) b!1255476))

(assert (= (and b!1255474 (not c!122387)) b!1255471))

(assert (= (or b!1255476 b!1255471) bm!61755))

(assert (= (and d!138031 res!836996) b!1255473))

(assert (= (and b!1255473 res!836998) b!1255470))

(assert (= (and b!1255470 res!836997) b!1255477))

(assert (= (and b!1255470 c!122389) b!1255468))

(assert (= (and b!1255470 (not c!122389)) b!1255475))

(assert (= (and b!1255468 res!836995) b!1255469))

(assert (= (and b!1255475 c!122390) b!1255467))

(assert (= (and b!1255475 (not c!122390)) b!1255478))

(declare-fun b_lambda!22645 () Bool)

(assert (=> (not b_lambda!22645) (not b!1255469)))

(assert (=> b!1255469 t!41478))

(declare-fun b_and!44873 () Bool)

(assert (= b_and!44871 (and (=> t!41478 result!23303) b_and!44873)))

(declare-fun b_lambda!22647 () Bool)

(assert (=> (not b_lambda!22647) (not b!1255476)))

(assert (=> b!1255476 t!41478))

(declare-fun b_and!44875 () Bool)

(assert (= b_and!44873 (and (=> t!41478 result!23303) b_and!44875)))

(declare-fun m!1155753 () Bool)

(assert (=> b!1255476 m!1155753))

(assert (=> b!1255476 m!1155729))

(assert (=> b!1255476 m!1155731))

(declare-fun m!1155755 () Bool)

(assert (=> b!1255476 m!1155755))

(assert (=> b!1255476 m!1155755))

(declare-fun m!1155757 () Bool)

(assert (=> b!1255476 m!1155757))

(assert (=> b!1255476 m!1155709))

(declare-fun m!1155759 () Bool)

(assert (=> b!1255476 m!1155759))

(assert (=> b!1255476 m!1155729))

(assert (=> b!1255476 m!1155731))

(assert (=> b!1255476 m!1155739))

(assert (=> b!1255468 m!1155709))

(assert (=> b!1255468 m!1155709))

(declare-fun m!1155761 () Bool)

(assert (=> b!1255468 m!1155761))

(declare-fun m!1155763 () Bool)

(assert (=> b!1255473 m!1155763))

(declare-fun m!1155765 () Bool)

(assert (=> d!138031 m!1155765))

(assert (=> d!138031 m!1155667))

(declare-fun m!1155767 () Bool)

(assert (=> bm!61755 m!1155767))

(declare-fun m!1155769 () Bool)

(assert (=> b!1255478 m!1155769))

(assert (=> b!1255474 m!1155709))

(assert (=> b!1255474 m!1155709))

(assert (=> b!1255474 m!1155713))

(assert (=> b!1255469 m!1155709))

(assert (=> b!1255469 m!1155729))

(assert (=> b!1255469 m!1155731))

(assert (=> b!1255469 m!1155709))

(declare-fun m!1155771 () Bool)

(assert (=> b!1255469 m!1155771))

(assert (=> b!1255469 m!1155729))

(assert (=> b!1255469 m!1155731))

(assert (=> b!1255469 m!1155739))

(assert (=> b!1255467 m!1155767))

(assert (=> b!1255477 m!1155709))

(assert (=> b!1255477 m!1155709))

(assert (=> b!1255477 m!1155713))

(assert (=> b!1255356 d!138031))

(declare-fun mapIsEmpty!49708 () Bool)

(declare-fun mapRes!49708 () Bool)

(assert (=> mapIsEmpty!49708 mapRes!49708))

(declare-fun b!1255486 () Bool)

(declare-fun e!713557 () Bool)

(assert (=> b!1255486 (= e!713557 tp_is_empty!31945)))

(declare-fun condMapEmpty!49708 () Bool)

(declare-fun mapDefault!49708 () ValueCell!15209)

(assert (=> mapNonEmpty!49699 (= condMapEmpty!49708 (= mapRest!49699 ((as const (Array (_ BitVec 32) ValueCell!15209)) mapDefault!49708)))))

(assert (=> mapNonEmpty!49699 (= tp!94640 (and e!713557 mapRes!49708))))

(declare-fun b!1255485 () Bool)

(declare-fun e!713558 () Bool)

(assert (=> b!1255485 (= e!713558 tp_is_empty!31945)))

(declare-fun mapNonEmpty!49708 () Bool)

(declare-fun tp!94655 () Bool)

(assert (=> mapNonEmpty!49708 (= mapRes!49708 (and tp!94655 e!713558))))

(declare-fun mapKey!49708 () (_ BitVec 32))

(declare-fun mapValue!49708 () ValueCell!15209)

(declare-fun mapRest!49708 () (Array (_ BitVec 32) ValueCell!15209))

(assert (=> mapNonEmpty!49708 (= mapRest!49699 (store mapRest!49708 mapKey!49708 mapValue!49708))))

(assert (= (and mapNonEmpty!49699 condMapEmpty!49708) mapIsEmpty!49708))

(assert (= (and mapNonEmpty!49699 (not condMapEmpty!49708)) mapNonEmpty!49708))

(assert (= (and mapNonEmpty!49708 ((_ is ValueCellFull!15209) mapValue!49708)) b!1255485))

(assert (= (and mapNonEmpty!49699 ((_ is ValueCellFull!15209) mapDefault!49708)) b!1255486))

(declare-fun m!1155773 () Bool)

(assert (=> mapNonEmpty!49708 m!1155773))

(declare-fun b_lambda!22649 () Bool)

(assert (= b_lambda!22647 (or (and start!105366 b_free!27043) b_lambda!22649)))

(declare-fun b_lambda!22651 () Bool)

(assert (= b_lambda!22641 (or (and start!105366 b_free!27043) b_lambda!22651)))

(declare-fun b_lambda!22653 () Bool)

(assert (= b_lambda!22645 (or (and start!105366 b_free!27043) b_lambda!22653)))

(declare-fun b_lambda!22655 () Bool)

(assert (= b_lambda!22643 (or (and start!105366 b_free!27043) b_lambda!22655)))

(check-sat (not b!1255468) (not b!1255477) (not b!1255464) (not mapNonEmpty!49708) (not b!1255414) (not b_next!27043) (not b!1255478) (not b_lambda!22649) (not b!1255469) (not d!138027) (not bm!61754) (not b!1255426) (not d!138031) (not bm!61751) (not b_lambda!22651) (not b!1255462) (not b!1255454) (not b!1255455) (not d!138029) (not b!1255459) (not b!1255474) (not b_lambda!22653) (not b!1255416) (not b!1255463) (not bm!61748) (not b!1255460) (not b!1255473) tp_is_empty!31945 (not b!1255428) (not b_lambda!22655) b_and!44875 (not b!1255476) (not b!1255453) (not bm!61755) (not b!1255413) (not b!1255467))
(check-sat b_and!44875 (not b_next!27043))
