; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106114 () Bool)

(assert start!106114)

(declare-fun b_free!27511 () Bool)

(declare-fun b_next!27511 () Bool)

(assert (=> start!106114 (= b_free!27511 (not b_next!27511))))

(declare-fun tp!96088 () Bool)

(declare-fun b_and!45489 () Bool)

(assert (=> start!106114 (= tp!96088 b_and!45489)))

(declare-fun b!1263448 () Bool)

(declare-fun e!719328 () Bool)

(declare-fun e!719329 () Bool)

(declare-fun mapRes!50446 () Bool)

(assert (=> b!1263448 (= e!719328 (and e!719329 mapRes!50446))))

(declare-fun condMapEmpty!50446 () Bool)

(declare-datatypes ((V!48583 0))(
  ( (V!48584 (val!16269 Int)) )
))
(declare-datatypes ((ValueCell!15443 0))(
  ( (ValueCellFull!15443 (v!18979 V!48583)) (EmptyCell!15443) )
))
(declare-datatypes ((array!82373 0))(
  ( (array!82374 (arr!39732 (Array (_ BitVec 32) ValueCell!15443)) (size!40270 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82373)

(declare-fun mapDefault!50446 () ValueCell!15443)

(assert (=> b!1263448 (= condMapEmpty!50446 (= (arr!39732 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15443)) mapDefault!50446)))))

(declare-fun b!1263449 () Bool)

(declare-fun res!841561 () Bool)

(declare-fun e!719330 () Bool)

(assert (=> b!1263449 (=> (not res!841561) (not e!719330))))

(declare-datatypes ((array!82375 0))(
  ( (array!82376 (arr!39733 (Array (_ BitVec 32) (_ BitVec 64))) (size!40271 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82375)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82375 (_ BitVec 32)) Bool)

(assert (=> b!1263449 (= res!841561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263450 () Bool)

(declare-fun e!719327 () Bool)

(assert (=> b!1263450 (= e!719330 (not e!719327))))

(declare-fun res!841563 () Bool)

(assert (=> b!1263450 (=> res!841563 e!719327)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263450 (= res!841563 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21142 0))(
  ( (tuple2!21143 (_1!10582 (_ BitVec 64)) (_2!10582 V!48583)) )
))
(declare-datatypes ((List!28339 0))(
  ( (Nil!28336) (Cons!28335 (h!29544 tuple2!21142) (t!41845 List!28339)) )
))
(declare-datatypes ((ListLongMap!19015 0))(
  ( (ListLongMap!19016 (toList!9523 List!28339)) )
))
(declare-fun lt!572885 () ListLongMap!19015)

(declare-fun lt!572888 () ListLongMap!19015)

(assert (=> b!1263450 (= lt!572885 lt!572888)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48583)

(declare-datatypes ((Unit!41963 0))(
  ( (Unit!41964) )
))
(declare-fun lt!572886 () Unit!41963)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48583)

(declare-fun minValueBefore!43 () V!48583)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1188 (array!82375 array!82373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 V!48583 V!48583 (_ BitVec 32) Int) Unit!41963)

(assert (=> b!1263450 (= lt!572886 (lemmaNoChangeToArrayThenSameMapNoExtras!1188 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5888 (array!82375 array!82373 (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 (_ BitVec 32) Int) ListLongMap!19015)

(assert (=> b!1263450 (= lt!572888 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263450 (= lt!572885 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50446 () Bool)

(declare-fun tp!96089 () Bool)

(declare-fun e!719331 () Bool)

(assert (=> mapNonEmpty!50446 (= mapRes!50446 (and tp!96089 e!719331))))

(declare-fun mapValue!50446 () ValueCell!15443)

(declare-fun mapKey!50446 () (_ BitVec 32))

(declare-fun mapRest!50446 () (Array (_ BitVec 32) ValueCell!15443))

(assert (=> mapNonEmpty!50446 (= (arr!39732 _values!914) (store mapRest!50446 mapKey!50446 mapValue!50446))))

(declare-fun b!1263451 () Bool)

(declare-fun res!841562 () Bool)

(assert (=> b!1263451 (=> (not res!841562) (not e!719330))))

(assert (=> b!1263451 (= res!841562 (and (= (size!40270 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40271 _keys!1118) (size!40270 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50446 () Bool)

(assert (=> mapIsEmpty!50446 mapRes!50446))

(declare-fun b!1263452 () Bool)

(declare-fun tp_is_empty!32413 () Bool)

(assert (=> b!1263452 (= e!719331 tp_is_empty!32413)))

(declare-fun b!1263453 () Bool)

(assert (=> b!1263453 (= e!719329 tp_is_empty!32413)))

(declare-fun b!1263454 () Bool)

(declare-fun res!841564 () Bool)

(assert (=> b!1263454 (=> (not res!841564) (not e!719330))))

(declare-datatypes ((List!28340 0))(
  ( (Nil!28337) (Cons!28336 (h!29545 (_ BitVec 64)) (t!41846 List!28340)) )
))
(declare-fun arrayNoDuplicates!0 (array!82375 (_ BitVec 32) List!28340) Bool)

(assert (=> b!1263454 (= res!841564 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28337))))

(declare-fun b!1263455 () Bool)

(declare-fun getCurrentListMap!4578 (array!82375 array!82373 (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 (_ BitVec 32) Int) ListLongMap!19015)

(declare-fun +!4292 (ListLongMap!19015 tuple2!21142) ListLongMap!19015)

(assert (=> b!1263455 (= e!719327 (= (getCurrentListMap!4578 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4292 (+!4292 lt!572885 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572887 () ListLongMap!19015)

(assert (=> b!1263455 (= lt!572887 (getCurrentListMap!4578 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841565 () Bool)

(assert (=> start!106114 (=> (not res!841565) (not e!719330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106114 (= res!841565 (validMask!0 mask!1466))))

(assert (=> start!106114 e!719330))

(assert (=> start!106114 true))

(assert (=> start!106114 tp!96088))

(assert (=> start!106114 tp_is_empty!32413))

(declare-fun array_inv!30399 (array!82375) Bool)

(assert (=> start!106114 (array_inv!30399 _keys!1118)))

(declare-fun array_inv!30400 (array!82373) Bool)

(assert (=> start!106114 (and (array_inv!30400 _values!914) e!719328)))

(assert (= (and start!106114 res!841565) b!1263451))

(assert (= (and b!1263451 res!841562) b!1263449))

(assert (= (and b!1263449 res!841561) b!1263454))

(assert (= (and b!1263454 res!841564) b!1263450))

(assert (= (and b!1263450 (not res!841563)) b!1263455))

(assert (= (and b!1263448 condMapEmpty!50446) mapIsEmpty!50446))

(assert (= (and b!1263448 (not condMapEmpty!50446)) mapNonEmpty!50446))

(get-info :version)

(assert (= (and mapNonEmpty!50446 ((_ is ValueCellFull!15443) mapValue!50446)) b!1263452))

(assert (= (and b!1263448 ((_ is ValueCellFull!15443) mapDefault!50446)) b!1263453))

(assert (= start!106114 b!1263448))

(declare-fun m!1163493 () Bool)

(assert (=> b!1263455 m!1163493))

(declare-fun m!1163495 () Bool)

(assert (=> b!1263455 m!1163495))

(assert (=> b!1263455 m!1163495))

(declare-fun m!1163497 () Bool)

(assert (=> b!1263455 m!1163497))

(declare-fun m!1163499 () Bool)

(assert (=> b!1263455 m!1163499))

(declare-fun m!1163501 () Bool)

(assert (=> mapNonEmpty!50446 m!1163501))

(declare-fun m!1163503 () Bool)

(assert (=> b!1263454 m!1163503))

(declare-fun m!1163505 () Bool)

(assert (=> start!106114 m!1163505))

(declare-fun m!1163507 () Bool)

(assert (=> start!106114 m!1163507))

(declare-fun m!1163509 () Bool)

(assert (=> start!106114 m!1163509))

(declare-fun m!1163511 () Bool)

(assert (=> b!1263449 m!1163511))

(declare-fun m!1163513 () Bool)

(assert (=> b!1263450 m!1163513))

(declare-fun m!1163515 () Bool)

(assert (=> b!1263450 m!1163515))

(declare-fun m!1163517 () Bool)

(assert (=> b!1263450 m!1163517))

(check-sat (not start!106114) (not b!1263454) (not b!1263449) b_and!45489 tp_is_empty!32413 (not mapNonEmpty!50446) (not b!1263450) (not b_next!27511) (not b!1263455))
(check-sat b_and!45489 (not b_next!27511))
(get-model)

(declare-fun b!1263512 () Bool)

(declare-fun e!719376 () Bool)

(declare-fun e!719374 () Bool)

(assert (=> b!1263512 (= e!719376 e!719374)))

(declare-fun lt!572921 () (_ BitVec 64))

(assert (=> b!1263512 (= lt!572921 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572920 () Unit!41963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82375 (_ BitVec 64) (_ BitVec 32)) Unit!41963)

(assert (=> b!1263512 (= lt!572920 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572921 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263512 (arrayContainsKey!0 _keys!1118 lt!572921 #b00000000000000000000000000000000)))

(declare-fun lt!572919 () Unit!41963)

(assert (=> b!1263512 (= lt!572919 lt!572920)))

(declare-fun res!841600 () Bool)

(declare-datatypes ((SeekEntryResult!9979 0))(
  ( (MissingZero!9979 (index!42287 (_ BitVec 32))) (Found!9979 (index!42288 (_ BitVec 32))) (Intermediate!9979 (undefined!10791 Bool) (index!42289 (_ BitVec 32)) (x!111341 (_ BitVec 32))) (Undefined!9979) (MissingVacant!9979 (index!42290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82375 (_ BitVec 32)) SeekEntryResult!9979)

(assert (=> b!1263512 (= res!841600 (= (seekEntryOrOpen!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9979 #b00000000000000000000000000000000)))))

(assert (=> b!1263512 (=> (not res!841600) (not e!719374))))

(declare-fun d!138509 () Bool)

(declare-fun res!841601 () Bool)

(declare-fun e!719375 () Bool)

(assert (=> d!138509 (=> res!841601 e!719375)))

(assert (=> d!138509 (= res!841601 (bvsge #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(assert (=> d!138509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719375)))

(declare-fun bm!62199 () Bool)

(declare-fun call!62202 () Bool)

(assert (=> bm!62199 (= call!62202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263513 () Bool)

(assert (=> b!1263513 (= e!719375 e!719376)))

(declare-fun c!122980 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263513 (= c!122980 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263514 () Bool)

(assert (=> b!1263514 (= e!719376 call!62202)))

(declare-fun b!1263515 () Bool)

(assert (=> b!1263515 (= e!719374 call!62202)))

(assert (= (and d!138509 (not res!841601)) b!1263513))

(assert (= (and b!1263513 c!122980) b!1263512))

(assert (= (and b!1263513 (not c!122980)) b!1263514))

(assert (= (and b!1263512 res!841600) b!1263515))

(assert (= (or b!1263515 b!1263514) bm!62199))

(declare-fun m!1163571 () Bool)

(assert (=> b!1263512 m!1163571))

(declare-fun m!1163573 () Bool)

(assert (=> b!1263512 m!1163573))

(declare-fun m!1163575 () Bool)

(assert (=> b!1263512 m!1163575))

(assert (=> b!1263512 m!1163571))

(declare-fun m!1163577 () Bool)

(assert (=> b!1263512 m!1163577))

(declare-fun m!1163579 () Bool)

(assert (=> bm!62199 m!1163579))

(assert (=> b!1263513 m!1163571))

(assert (=> b!1263513 m!1163571))

(declare-fun m!1163581 () Bool)

(assert (=> b!1263513 m!1163581))

(assert (=> b!1263449 d!138509))

(declare-fun d!138511 () Bool)

(assert (=> d!138511 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106114 d!138511))

(declare-fun d!138513 () Bool)

(assert (=> d!138513 (= (array_inv!30399 _keys!1118) (bvsge (size!40271 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106114 d!138513))

(declare-fun d!138515 () Bool)

(assert (=> d!138515 (= (array_inv!30400 _values!914) (bvsge (size!40270 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106114 d!138515))

(declare-fun bm!62214 () Bool)

(declare-fun call!62217 () Bool)

(declare-fun lt!572983 () ListLongMap!19015)

(declare-fun contains!7575 (ListLongMap!19015 (_ BitVec 64)) Bool)

(assert (=> bm!62214 (= call!62217 (contains!7575 lt!572983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263558 () Bool)

(declare-fun e!719411 () Bool)

(declare-fun apply!995 (ListLongMap!19015 (_ BitVec 64)) V!48583)

(assert (=> b!1263558 (= e!719411 (= (apply!995 lt!572983 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263559 () Bool)

(declare-fun e!719415 () Bool)

(declare-fun e!719413 () Bool)

(assert (=> b!1263559 (= e!719415 e!719413)))

(declare-fun res!841620 () Bool)

(declare-fun call!62220 () Bool)

(assert (=> b!1263559 (= res!841620 call!62220)))

(assert (=> b!1263559 (=> (not res!841620) (not e!719413))))

(declare-fun b!1263560 () Bool)

(assert (=> b!1263560 (= e!719413 (= (apply!995 lt!572983 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!62215 () Bool)

(declare-fun call!62221 () ListLongMap!19015)

(declare-fun call!62222 () ListLongMap!19015)

(assert (=> bm!62215 (= call!62221 call!62222)))

(declare-fun b!1263561 () Bool)

(declare-fun e!719409 () Bool)

(assert (=> b!1263561 (= e!719409 (not call!62217))))

(declare-fun d!138517 () Bool)

(declare-fun e!719412 () Bool)

(assert (=> d!138517 e!719412))

(declare-fun res!841623 () Bool)

(assert (=> d!138517 (=> (not res!841623) (not e!719412))))

(assert (=> d!138517 (= res!841623 (or (bvsge #b00000000000000000000000000000000 (size!40271 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))))

(declare-fun lt!572970 () ListLongMap!19015)

(assert (=> d!138517 (= lt!572983 lt!572970)))

(declare-fun lt!572981 () Unit!41963)

(declare-fun e!719414 () Unit!41963)

(assert (=> d!138517 (= lt!572981 e!719414)))

(declare-fun c!122995 () Bool)

(declare-fun e!719405 () Bool)

(assert (=> d!138517 (= c!122995 e!719405)))

(declare-fun res!841624 () Bool)

(assert (=> d!138517 (=> (not res!841624) (not e!719405))))

(assert (=> d!138517 (= res!841624 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun e!719408 () ListLongMap!19015)

(assert (=> d!138517 (= lt!572970 e!719408)))

(declare-fun c!122996 () Bool)

(assert (=> d!138517 (= c!122996 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138517 (validMask!0 mask!1466)))

(assert (=> d!138517 (= (getCurrentListMap!4578 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572983)))

(declare-fun b!1263562 () Bool)

(declare-fun e!719406 () Bool)

(assert (=> b!1263562 (= e!719406 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263563 () Bool)

(declare-fun c!122993 () Bool)

(assert (=> b!1263563 (= c!122993 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719404 () ListLongMap!19015)

(declare-fun e!719410 () ListLongMap!19015)

(assert (=> b!1263563 (= e!719404 e!719410)))

(declare-fun b!1263564 () Bool)

(declare-fun e!719407 () Bool)

(declare-fun get!20292 (ValueCell!15443 V!48583) V!48583)

(declare-fun dynLambda!3425 (Int (_ BitVec 64)) V!48583)

(assert (=> b!1263564 (= e!719407 (= (apply!995 lt!572983 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)) (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263564 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40270 _values!914)))))

(assert (=> b!1263564 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun bm!62216 () Bool)

(declare-fun call!62219 () ListLongMap!19015)

(assert (=> bm!62216 (= call!62219 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263565 () Bool)

(declare-fun call!62218 () ListLongMap!19015)

(assert (=> b!1263565 (= e!719404 call!62218)))

(declare-fun b!1263566 () Bool)

(declare-fun call!62223 () ListLongMap!19015)

(assert (=> b!1263566 (= e!719408 (+!4292 call!62223 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263567 () Bool)

(assert (=> b!1263567 (= e!719405 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263568 () Bool)

(declare-fun res!841621 () Bool)

(assert (=> b!1263568 (=> (not res!841621) (not e!719412))))

(assert (=> b!1263568 (= res!841621 e!719409)))

(declare-fun c!122997 () Bool)

(assert (=> b!1263568 (= c!122997 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263569 () Bool)

(declare-fun e!719403 () Bool)

(assert (=> b!1263569 (= e!719403 e!719407)))

(declare-fun res!841626 () Bool)

(assert (=> b!1263569 (=> (not res!841626) (not e!719407))))

(assert (=> b!1263569 (= res!841626 (contains!7575 lt!572983 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun b!1263570 () Bool)

(assert (=> b!1263570 (= e!719410 call!62221)))

(declare-fun c!122998 () Bool)

(declare-fun bm!62217 () Bool)

(assert (=> bm!62217 (= call!62223 (+!4292 (ite c!122996 call!62219 (ite c!122998 call!62222 call!62221)) (ite (or c!122996 c!122998) (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263571 () Bool)

(assert (=> b!1263571 (= e!719412 e!719415)))

(declare-fun c!122994 () Bool)

(assert (=> b!1263571 (= c!122994 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62218 () Bool)

(assert (=> bm!62218 (= call!62218 call!62223)))

(declare-fun b!1263572 () Bool)

(assert (=> b!1263572 (= e!719410 call!62218)))

(declare-fun b!1263573 () Bool)

(declare-fun res!841625 () Bool)

(assert (=> b!1263573 (=> (not res!841625) (not e!719412))))

(assert (=> b!1263573 (= res!841625 e!719403)))

(declare-fun res!841627 () Bool)

(assert (=> b!1263573 (=> res!841627 e!719403)))

(assert (=> b!1263573 (= res!841627 (not e!719406))))

(declare-fun res!841622 () Bool)

(assert (=> b!1263573 (=> (not res!841622) (not e!719406))))

(assert (=> b!1263573 (= res!841622 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun b!1263574 () Bool)

(assert (=> b!1263574 (= e!719408 e!719404)))

(assert (=> b!1263574 (= c!122998 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263575 () Bool)

(declare-fun Unit!41969 () Unit!41963)

(assert (=> b!1263575 (= e!719414 Unit!41969)))

(declare-fun b!1263576 () Bool)

(assert (=> b!1263576 (= e!719415 (not call!62220))))

(declare-fun bm!62219 () Bool)

(assert (=> bm!62219 (= call!62220 (contains!7575 lt!572983 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263577 () Bool)

(assert (=> b!1263577 (= e!719409 e!719411)))

(declare-fun res!841628 () Bool)

(assert (=> b!1263577 (= res!841628 call!62217)))

(assert (=> b!1263577 (=> (not res!841628) (not e!719411))))

(declare-fun bm!62220 () Bool)

(assert (=> bm!62220 (= call!62222 call!62219)))

(declare-fun b!1263578 () Bool)

(declare-fun lt!572975 () Unit!41963)

(assert (=> b!1263578 (= e!719414 lt!572975)))

(declare-fun lt!572968 () ListLongMap!19015)

(assert (=> b!1263578 (= lt!572968 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572985 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572967 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572967 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572973 () Unit!41963)

(declare-fun addStillContains!1092 (ListLongMap!19015 (_ BitVec 64) V!48583 (_ BitVec 64)) Unit!41963)

(assert (=> b!1263578 (= lt!572973 (addStillContains!1092 lt!572968 lt!572985 zeroValue!871 lt!572967))))

(assert (=> b!1263578 (contains!7575 (+!4292 lt!572968 (tuple2!21143 lt!572985 zeroValue!871)) lt!572967)))

(declare-fun lt!572984 () Unit!41963)

(assert (=> b!1263578 (= lt!572984 lt!572973)))

(declare-fun lt!572972 () ListLongMap!19015)

(assert (=> b!1263578 (= lt!572972 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572982 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572982 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572987 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572987 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572971 () Unit!41963)

(declare-fun addApplyDifferent!535 (ListLongMap!19015 (_ BitVec 64) V!48583 (_ BitVec 64)) Unit!41963)

(assert (=> b!1263578 (= lt!572971 (addApplyDifferent!535 lt!572972 lt!572982 minValueBefore!43 lt!572987))))

(assert (=> b!1263578 (= (apply!995 (+!4292 lt!572972 (tuple2!21143 lt!572982 minValueBefore!43)) lt!572987) (apply!995 lt!572972 lt!572987))))

(declare-fun lt!572979 () Unit!41963)

(assert (=> b!1263578 (= lt!572979 lt!572971)))

(declare-fun lt!572977 () ListLongMap!19015)

(assert (=> b!1263578 (= lt!572977 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572974 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572969 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572969 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572980 () Unit!41963)

(assert (=> b!1263578 (= lt!572980 (addApplyDifferent!535 lt!572977 lt!572974 zeroValue!871 lt!572969))))

(assert (=> b!1263578 (= (apply!995 (+!4292 lt!572977 (tuple2!21143 lt!572974 zeroValue!871)) lt!572969) (apply!995 lt!572977 lt!572969))))

(declare-fun lt!572966 () Unit!41963)

(assert (=> b!1263578 (= lt!572966 lt!572980)))

(declare-fun lt!572976 () ListLongMap!19015)

(assert (=> b!1263578 (= lt!572976 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572986 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572986 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572978 () (_ BitVec 64))

(assert (=> b!1263578 (= lt!572978 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263578 (= lt!572975 (addApplyDifferent!535 lt!572976 lt!572986 minValueBefore!43 lt!572978))))

(assert (=> b!1263578 (= (apply!995 (+!4292 lt!572976 (tuple2!21143 lt!572986 minValueBefore!43)) lt!572978) (apply!995 lt!572976 lt!572978))))

(assert (= (and d!138517 c!122996) b!1263566))

(assert (= (and d!138517 (not c!122996)) b!1263574))

(assert (= (and b!1263574 c!122998) b!1263565))

(assert (= (and b!1263574 (not c!122998)) b!1263563))

(assert (= (and b!1263563 c!122993) b!1263572))

(assert (= (and b!1263563 (not c!122993)) b!1263570))

(assert (= (or b!1263572 b!1263570) bm!62215))

(assert (= (or b!1263565 bm!62215) bm!62220))

(assert (= (or b!1263565 b!1263572) bm!62218))

(assert (= (or b!1263566 bm!62220) bm!62216))

(assert (= (or b!1263566 bm!62218) bm!62217))

(assert (= (and d!138517 res!841624) b!1263567))

(assert (= (and d!138517 c!122995) b!1263578))

(assert (= (and d!138517 (not c!122995)) b!1263575))

(assert (= (and d!138517 res!841623) b!1263573))

(assert (= (and b!1263573 res!841622) b!1263562))

(assert (= (and b!1263573 (not res!841627)) b!1263569))

(assert (= (and b!1263569 res!841626) b!1263564))

(assert (= (and b!1263573 res!841625) b!1263568))

(assert (= (and b!1263568 c!122997) b!1263577))

(assert (= (and b!1263568 (not c!122997)) b!1263561))

(assert (= (and b!1263577 res!841628) b!1263558))

(assert (= (or b!1263577 b!1263561) bm!62214))

(assert (= (and b!1263568 res!841621) b!1263571))

(assert (= (and b!1263571 c!122994) b!1263559))

(assert (= (and b!1263571 (not c!122994)) b!1263576))

(assert (= (and b!1263559 res!841620) b!1263560))

(assert (= (or b!1263559 b!1263576) bm!62219))

(declare-fun b_lambda!22957 () Bool)

(assert (=> (not b_lambda!22957) (not b!1263564)))

(declare-fun t!41850 () Bool)

(declare-fun tb!11323 () Bool)

(assert (=> (and start!106114 (= defaultEntry!922 defaultEntry!922) t!41850) tb!11323))

(declare-fun result!23393 () Bool)

(assert (=> tb!11323 (= result!23393 tp_is_empty!32413)))

(assert (=> b!1263564 t!41850))

(declare-fun b_and!45495 () Bool)

(assert (= b_and!45489 (and (=> t!41850 result!23393) b_and!45495)))

(assert (=> b!1263569 m!1163571))

(assert (=> b!1263569 m!1163571))

(declare-fun m!1163583 () Bool)

(assert (=> b!1263569 m!1163583))

(declare-fun m!1163585 () Bool)

(assert (=> b!1263578 m!1163585))

(assert (=> b!1263578 m!1163517))

(declare-fun m!1163587 () Bool)

(assert (=> b!1263578 m!1163587))

(declare-fun m!1163589 () Bool)

(assert (=> b!1263578 m!1163589))

(declare-fun m!1163591 () Bool)

(assert (=> b!1263578 m!1163591))

(declare-fun m!1163593 () Bool)

(assert (=> b!1263578 m!1163593))

(declare-fun m!1163595 () Bool)

(assert (=> b!1263578 m!1163595))

(declare-fun m!1163597 () Bool)

(assert (=> b!1263578 m!1163597))

(declare-fun m!1163599 () Bool)

(assert (=> b!1263578 m!1163599))

(declare-fun m!1163601 () Bool)

(assert (=> b!1263578 m!1163601))

(declare-fun m!1163603 () Bool)

(assert (=> b!1263578 m!1163603))

(assert (=> b!1263578 m!1163591))

(declare-fun m!1163605 () Bool)

(assert (=> b!1263578 m!1163605))

(declare-fun m!1163607 () Bool)

(assert (=> b!1263578 m!1163607))

(assert (=> b!1263578 m!1163571))

(declare-fun m!1163609 () Bool)

(assert (=> b!1263578 m!1163609))

(assert (=> b!1263578 m!1163601))

(assert (=> b!1263578 m!1163599))

(declare-fun m!1163611 () Bool)

(assert (=> b!1263578 m!1163611))

(declare-fun m!1163613 () Bool)

(assert (=> b!1263578 m!1163613))

(assert (=> b!1263578 m!1163593))

(declare-fun m!1163615 () Bool)

(assert (=> b!1263564 m!1163615))

(assert (=> b!1263564 m!1163615))

(declare-fun m!1163617 () Bool)

(assert (=> b!1263564 m!1163617))

(declare-fun m!1163619 () Bool)

(assert (=> b!1263564 m!1163619))

(assert (=> b!1263564 m!1163571))

(declare-fun m!1163621 () Bool)

(assert (=> b!1263564 m!1163621))

(assert (=> b!1263564 m!1163617))

(assert (=> b!1263564 m!1163571))

(declare-fun m!1163623 () Bool)

(assert (=> bm!62219 m!1163623))

(assert (=> bm!62216 m!1163517))

(declare-fun m!1163625 () Bool)

(assert (=> bm!62217 m!1163625))

(declare-fun m!1163627 () Bool)

(assert (=> bm!62214 m!1163627))

(declare-fun m!1163629 () Bool)

(assert (=> b!1263558 m!1163629))

(declare-fun m!1163631 () Bool)

(assert (=> b!1263560 m!1163631))

(assert (=> d!138517 m!1163505))

(assert (=> b!1263567 m!1163571))

(assert (=> b!1263567 m!1163571))

(assert (=> b!1263567 m!1163581))

(declare-fun m!1163633 () Bool)

(assert (=> b!1263566 m!1163633))

(assert (=> b!1263562 m!1163571))

(assert (=> b!1263562 m!1163571))

(assert (=> b!1263562 m!1163581))

(assert (=> b!1263455 d!138517))

(declare-fun d!138519 () Bool)

(declare-fun e!719418 () Bool)

(assert (=> d!138519 e!719418))

(declare-fun res!841634 () Bool)

(assert (=> d!138519 (=> (not res!841634) (not e!719418))))

(declare-fun lt!572996 () ListLongMap!19015)

(assert (=> d!138519 (= res!841634 (contains!7575 lt!572996 (_1!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572999 () List!28339)

(assert (=> d!138519 (= lt!572996 (ListLongMap!19016 lt!572999))))

(declare-fun lt!572998 () Unit!41963)

(declare-fun lt!572997 () Unit!41963)

(assert (=> d!138519 (= lt!572998 lt!572997)))

(declare-datatypes ((Option!720 0))(
  ( (Some!719 (v!18982 V!48583)) (None!718) )
))
(declare-fun getValueByKey!669 (List!28339 (_ BitVec 64)) Option!720)

(assert (=> d!138519 (= (getValueByKey!669 lt!572999 (_1!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!719 (_2!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!337 (List!28339 (_ BitVec 64) V!48583) Unit!41963)

(assert (=> d!138519 (= lt!572997 (lemmaContainsTupThenGetReturnValue!337 lt!572999 (_1!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!451 (List!28339 (_ BitVec 64) V!48583) List!28339)

(assert (=> d!138519 (= lt!572999 (insertStrictlySorted!451 (toList!9523 (+!4292 lt!572885 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (_1!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138519 (= (+!4292 (+!4292 lt!572885 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572996)))

(declare-fun b!1263585 () Bool)

(declare-fun res!841633 () Bool)

(assert (=> b!1263585 (=> (not res!841633) (not e!719418))))

(assert (=> b!1263585 (= res!841633 (= (getValueByKey!669 (toList!9523 lt!572996) (_1!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!719 (_2!10582 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1263586 () Bool)

(declare-fun contains!7576 (List!28339 tuple2!21142) Bool)

(assert (=> b!1263586 (= e!719418 (contains!7576 (toList!9523 lt!572996) (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138519 res!841634) b!1263585))

(assert (= (and b!1263585 res!841633) b!1263586))

(declare-fun m!1163635 () Bool)

(assert (=> d!138519 m!1163635))

(declare-fun m!1163637 () Bool)

(assert (=> d!138519 m!1163637))

(declare-fun m!1163639 () Bool)

(assert (=> d!138519 m!1163639))

(declare-fun m!1163641 () Bool)

(assert (=> d!138519 m!1163641))

(declare-fun m!1163643 () Bool)

(assert (=> b!1263585 m!1163643))

(declare-fun m!1163645 () Bool)

(assert (=> b!1263586 m!1163645))

(assert (=> b!1263455 d!138519))

(declare-fun d!138521 () Bool)

(declare-fun e!719419 () Bool)

(assert (=> d!138521 e!719419))

(declare-fun res!841636 () Bool)

(assert (=> d!138521 (=> (not res!841636) (not e!719419))))

(declare-fun lt!573000 () ListLongMap!19015)

(assert (=> d!138521 (= res!841636 (contains!7575 lt!573000 (_1!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573003 () List!28339)

(assert (=> d!138521 (= lt!573000 (ListLongMap!19016 lt!573003))))

(declare-fun lt!573002 () Unit!41963)

(declare-fun lt!573001 () Unit!41963)

(assert (=> d!138521 (= lt!573002 lt!573001)))

(assert (=> d!138521 (= (getValueByKey!669 lt!573003 (_1!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!719 (_2!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138521 (= lt!573001 (lemmaContainsTupThenGetReturnValue!337 lt!573003 (_1!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138521 (= lt!573003 (insertStrictlySorted!451 (toList!9523 lt!572885) (_1!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138521 (= (+!4292 lt!572885 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573000)))

(declare-fun b!1263587 () Bool)

(declare-fun res!841635 () Bool)

(assert (=> b!1263587 (=> (not res!841635) (not e!719419))))

(assert (=> b!1263587 (= res!841635 (= (getValueByKey!669 (toList!9523 lt!573000) (_1!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!719 (_2!10582 (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1263588 () Bool)

(assert (=> b!1263588 (= e!719419 (contains!7576 (toList!9523 lt!573000) (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!138521 res!841636) b!1263587))

(assert (= (and b!1263587 res!841635) b!1263588))

(declare-fun m!1163647 () Bool)

(assert (=> d!138521 m!1163647))

(declare-fun m!1163649 () Bool)

(assert (=> d!138521 m!1163649))

(declare-fun m!1163651 () Bool)

(assert (=> d!138521 m!1163651))

(declare-fun m!1163653 () Bool)

(assert (=> d!138521 m!1163653))

(declare-fun m!1163655 () Bool)

(assert (=> b!1263587 m!1163655))

(declare-fun m!1163657 () Bool)

(assert (=> b!1263588 m!1163657))

(assert (=> b!1263455 d!138521))

(declare-fun bm!62221 () Bool)

(declare-fun call!62224 () Bool)

(declare-fun lt!573021 () ListLongMap!19015)

(assert (=> bm!62221 (= call!62224 (contains!7575 lt!573021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263589 () Bool)

(declare-fun e!719428 () Bool)

(assert (=> b!1263589 (= e!719428 (= (apply!995 lt!573021 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263590 () Bool)

(declare-fun e!719432 () Bool)

(declare-fun e!719430 () Bool)

(assert (=> b!1263590 (= e!719432 e!719430)))

(declare-fun res!841637 () Bool)

(declare-fun call!62227 () Bool)

(assert (=> b!1263590 (= res!841637 call!62227)))

(assert (=> b!1263590 (=> (not res!841637) (not e!719430))))

(declare-fun b!1263591 () Bool)

(assert (=> b!1263591 (= e!719430 (= (apply!995 lt!573021 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!62222 () Bool)

(declare-fun call!62228 () ListLongMap!19015)

(declare-fun call!62229 () ListLongMap!19015)

(assert (=> bm!62222 (= call!62228 call!62229)))

(declare-fun b!1263592 () Bool)

(declare-fun e!719426 () Bool)

(assert (=> b!1263592 (= e!719426 (not call!62224))))

(declare-fun d!138523 () Bool)

(declare-fun e!719429 () Bool)

(assert (=> d!138523 e!719429))

(declare-fun res!841640 () Bool)

(assert (=> d!138523 (=> (not res!841640) (not e!719429))))

(assert (=> d!138523 (= res!841640 (or (bvsge #b00000000000000000000000000000000 (size!40271 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))))

(declare-fun lt!573008 () ListLongMap!19015)

(assert (=> d!138523 (= lt!573021 lt!573008)))

(declare-fun lt!573019 () Unit!41963)

(declare-fun e!719431 () Unit!41963)

(assert (=> d!138523 (= lt!573019 e!719431)))

(declare-fun c!123001 () Bool)

(declare-fun e!719422 () Bool)

(assert (=> d!138523 (= c!123001 e!719422)))

(declare-fun res!841641 () Bool)

(assert (=> d!138523 (=> (not res!841641) (not e!719422))))

(assert (=> d!138523 (= res!841641 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun e!719425 () ListLongMap!19015)

(assert (=> d!138523 (= lt!573008 e!719425)))

(declare-fun c!123002 () Bool)

(assert (=> d!138523 (= c!123002 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138523 (validMask!0 mask!1466)))

(assert (=> d!138523 (= (getCurrentListMap!4578 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573021)))

(declare-fun b!1263593 () Bool)

(declare-fun e!719423 () Bool)

(assert (=> b!1263593 (= e!719423 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263594 () Bool)

(declare-fun c!122999 () Bool)

(assert (=> b!1263594 (= c!122999 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719421 () ListLongMap!19015)

(declare-fun e!719427 () ListLongMap!19015)

(assert (=> b!1263594 (= e!719421 e!719427)))

(declare-fun e!719424 () Bool)

(declare-fun b!1263595 () Bool)

(assert (=> b!1263595 (= e!719424 (= (apply!995 lt!573021 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)) (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40270 _values!914)))))

(assert (=> b!1263595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun bm!62223 () Bool)

(declare-fun call!62226 () ListLongMap!19015)

(assert (=> bm!62223 (= call!62226 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263596 () Bool)

(declare-fun call!62225 () ListLongMap!19015)

(assert (=> b!1263596 (= e!719421 call!62225)))

(declare-fun b!1263597 () Bool)

(declare-fun call!62230 () ListLongMap!19015)

(assert (=> b!1263597 (= e!719425 (+!4292 call!62230 (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263598 () Bool)

(assert (=> b!1263598 (= e!719422 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263599 () Bool)

(declare-fun res!841638 () Bool)

(assert (=> b!1263599 (=> (not res!841638) (not e!719429))))

(assert (=> b!1263599 (= res!841638 e!719426)))

(declare-fun c!123003 () Bool)

(assert (=> b!1263599 (= c!123003 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263600 () Bool)

(declare-fun e!719420 () Bool)

(assert (=> b!1263600 (= e!719420 e!719424)))

(declare-fun res!841643 () Bool)

(assert (=> b!1263600 (=> (not res!841643) (not e!719424))))

(assert (=> b!1263600 (= res!841643 (contains!7575 lt!573021 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun b!1263601 () Bool)

(assert (=> b!1263601 (= e!719427 call!62228)))

(declare-fun c!123004 () Bool)

(declare-fun bm!62224 () Bool)

(assert (=> bm!62224 (= call!62230 (+!4292 (ite c!123002 call!62226 (ite c!123004 call!62229 call!62228)) (ite (or c!123002 c!123004) (tuple2!21143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21143 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263602 () Bool)

(assert (=> b!1263602 (= e!719429 e!719432)))

(declare-fun c!123000 () Bool)

(assert (=> b!1263602 (= c!123000 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62225 () Bool)

(assert (=> bm!62225 (= call!62225 call!62230)))

(declare-fun b!1263603 () Bool)

(assert (=> b!1263603 (= e!719427 call!62225)))

(declare-fun b!1263604 () Bool)

(declare-fun res!841642 () Bool)

(assert (=> b!1263604 (=> (not res!841642) (not e!719429))))

(assert (=> b!1263604 (= res!841642 e!719420)))

(declare-fun res!841644 () Bool)

(assert (=> b!1263604 (=> res!841644 e!719420)))

(assert (=> b!1263604 (= res!841644 (not e!719423))))

(declare-fun res!841639 () Bool)

(assert (=> b!1263604 (=> (not res!841639) (not e!719423))))

(assert (=> b!1263604 (= res!841639 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun b!1263605 () Bool)

(assert (=> b!1263605 (= e!719425 e!719421)))

(assert (=> b!1263605 (= c!123004 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263606 () Bool)

(declare-fun Unit!41970 () Unit!41963)

(assert (=> b!1263606 (= e!719431 Unit!41970)))

(declare-fun b!1263607 () Bool)

(assert (=> b!1263607 (= e!719432 (not call!62227))))

(declare-fun bm!62226 () Bool)

(assert (=> bm!62226 (= call!62227 (contains!7575 lt!573021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263608 () Bool)

(assert (=> b!1263608 (= e!719426 e!719428)))

(declare-fun res!841645 () Bool)

(assert (=> b!1263608 (= res!841645 call!62224)))

(assert (=> b!1263608 (=> (not res!841645) (not e!719428))))

(declare-fun bm!62227 () Bool)

(assert (=> bm!62227 (= call!62229 call!62226)))

(declare-fun b!1263609 () Bool)

(declare-fun lt!573013 () Unit!41963)

(assert (=> b!1263609 (= e!719431 lt!573013)))

(declare-fun lt!573006 () ListLongMap!19015)

(assert (=> b!1263609 (= lt!573006 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573023 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573005 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573005 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573011 () Unit!41963)

(assert (=> b!1263609 (= lt!573011 (addStillContains!1092 lt!573006 lt!573023 zeroValue!871 lt!573005))))

(assert (=> b!1263609 (contains!7575 (+!4292 lt!573006 (tuple2!21143 lt!573023 zeroValue!871)) lt!573005)))

(declare-fun lt!573022 () Unit!41963)

(assert (=> b!1263609 (= lt!573022 lt!573011)))

(declare-fun lt!573010 () ListLongMap!19015)

(assert (=> b!1263609 (= lt!573010 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573020 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573020 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573025 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573025 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573009 () Unit!41963)

(assert (=> b!1263609 (= lt!573009 (addApplyDifferent!535 lt!573010 lt!573020 minValueAfter!43 lt!573025))))

(assert (=> b!1263609 (= (apply!995 (+!4292 lt!573010 (tuple2!21143 lt!573020 minValueAfter!43)) lt!573025) (apply!995 lt!573010 lt!573025))))

(declare-fun lt!573017 () Unit!41963)

(assert (=> b!1263609 (= lt!573017 lt!573009)))

(declare-fun lt!573015 () ListLongMap!19015)

(assert (=> b!1263609 (= lt!573015 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573012 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573012 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573007 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573007 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573018 () Unit!41963)

(assert (=> b!1263609 (= lt!573018 (addApplyDifferent!535 lt!573015 lt!573012 zeroValue!871 lt!573007))))

(assert (=> b!1263609 (= (apply!995 (+!4292 lt!573015 (tuple2!21143 lt!573012 zeroValue!871)) lt!573007) (apply!995 lt!573015 lt!573007))))

(declare-fun lt!573004 () Unit!41963)

(assert (=> b!1263609 (= lt!573004 lt!573018)))

(declare-fun lt!573014 () ListLongMap!19015)

(assert (=> b!1263609 (= lt!573014 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573024 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573016 () (_ BitVec 64))

(assert (=> b!1263609 (= lt!573016 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263609 (= lt!573013 (addApplyDifferent!535 lt!573014 lt!573024 minValueAfter!43 lt!573016))))

(assert (=> b!1263609 (= (apply!995 (+!4292 lt!573014 (tuple2!21143 lt!573024 minValueAfter!43)) lt!573016) (apply!995 lt!573014 lt!573016))))

(assert (= (and d!138523 c!123002) b!1263597))

(assert (= (and d!138523 (not c!123002)) b!1263605))

(assert (= (and b!1263605 c!123004) b!1263596))

(assert (= (and b!1263605 (not c!123004)) b!1263594))

(assert (= (and b!1263594 c!122999) b!1263603))

(assert (= (and b!1263594 (not c!122999)) b!1263601))

(assert (= (or b!1263603 b!1263601) bm!62222))

(assert (= (or b!1263596 bm!62222) bm!62227))

(assert (= (or b!1263596 b!1263603) bm!62225))

(assert (= (or b!1263597 bm!62227) bm!62223))

(assert (= (or b!1263597 bm!62225) bm!62224))

(assert (= (and d!138523 res!841641) b!1263598))

(assert (= (and d!138523 c!123001) b!1263609))

(assert (= (and d!138523 (not c!123001)) b!1263606))

(assert (= (and d!138523 res!841640) b!1263604))

(assert (= (and b!1263604 res!841639) b!1263593))

(assert (= (and b!1263604 (not res!841644)) b!1263600))

(assert (= (and b!1263600 res!841643) b!1263595))

(assert (= (and b!1263604 res!841642) b!1263599))

(assert (= (and b!1263599 c!123003) b!1263608))

(assert (= (and b!1263599 (not c!123003)) b!1263592))

(assert (= (and b!1263608 res!841645) b!1263589))

(assert (= (or b!1263608 b!1263592) bm!62221))

(assert (= (and b!1263599 res!841638) b!1263602))

(assert (= (and b!1263602 c!123000) b!1263590))

(assert (= (and b!1263602 (not c!123000)) b!1263607))

(assert (= (and b!1263590 res!841637) b!1263591))

(assert (= (or b!1263590 b!1263607) bm!62226))

(declare-fun b_lambda!22959 () Bool)

(assert (=> (not b_lambda!22959) (not b!1263595)))

(assert (=> b!1263595 t!41850))

(declare-fun b_and!45497 () Bool)

(assert (= b_and!45495 (and (=> t!41850 result!23393) b_and!45497)))

(assert (=> b!1263600 m!1163571))

(assert (=> b!1263600 m!1163571))

(declare-fun m!1163659 () Bool)

(assert (=> b!1263600 m!1163659))

(declare-fun m!1163661 () Bool)

(assert (=> b!1263609 m!1163661))

(assert (=> b!1263609 m!1163515))

(declare-fun m!1163663 () Bool)

(assert (=> b!1263609 m!1163663))

(declare-fun m!1163665 () Bool)

(assert (=> b!1263609 m!1163665))

(declare-fun m!1163667 () Bool)

(assert (=> b!1263609 m!1163667))

(declare-fun m!1163669 () Bool)

(assert (=> b!1263609 m!1163669))

(declare-fun m!1163671 () Bool)

(assert (=> b!1263609 m!1163671))

(declare-fun m!1163673 () Bool)

(assert (=> b!1263609 m!1163673))

(declare-fun m!1163675 () Bool)

(assert (=> b!1263609 m!1163675))

(declare-fun m!1163677 () Bool)

(assert (=> b!1263609 m!1163677))

(declare-fun m!1163679 () Bool)

(assert (=> b!1263609 m!1163679))

(assert (=> b!1263609 m!1163667))

(declare-fun m!1163681 () Bool)

(assert (=> b!1263609 m!1163681))

(declare-fun m!1163683 () Bool)

(assert (=> b!1263609 m!1163683))

(assert (=> b!1263609 m!1163571))

(declare-fun m!1163685 () Bool)

(assert (=> b!1263609 m!1163685))

(assert (=> b!1263609 m!1163677))

(assert (=> b!1263609 m!1163675))

(declare-fun m!1163687 () Bool)

(assert (=> b!1263609 m!1163687))

(declare-fun m!1163689 () Bool)

(assert (=> b!1263609 m!1163689))

(assert (=> b!1263609 m!1163669))

(assert (=> b!1263595 m!1163615))

(assert (=> b!1263595 m!1163615))

(assert (=> b!1263595 m!1163617))

(assert (=> b!1263595 m!1163619))

(assert (=> b!1263595 m!1163571))

(declare-fun m!1163691 () Bool)

(assert (=> b!1263595 m!1163691))

(assert (=> b!1263595 m!1163617))

(assert (=> b!1263595 m!1163571))

(declare-fun m!1163693 () Bool)

(assert (=> bm!62226 m!1163693))

(assert (=> bm!62223 m!1163515))

(declare-fun m!1163695 () Bool)

(assert (=> bm!62224 m!1163695))

(declare-fun m!1163697 () Bool)

(assert (=> bm!62221 m!1163697))

(declare-fun m!1163699 () Bool)

(assert (=> b!1263589 m!1163699))

(declare-fun m!1163701 () Bool)

(assert (=> b!1263591 m!1163701))

(assert (=> d!138523 m!1163505))

(assert (=> b!1263598 m!1163571))

(assert (=> b!1263598 m!1163571))

(assert (=> b!1263598 m!1163581))

(declare-fun m!1163703 () Bool)

(assert (=> b!1263597 m!1163703))

(assert (=> b!1263593 m!1163571))

(assert (=> b!1263593 m!1163571))

(assert (=> b!1263593 m!1163581))

(assert (=> b!1263455 d!138523))

(declare-fun b!1263620 () Bool)

(declare-fun e!719444 () Bool)

(declare-fun call!62233 () Bool)

(assert (=> b!1263620 (= e!719444 call!62233)))

(declare-fun b!1263621 () Bool)

(declare-fun e!719443 () Bool)

(declare-fun e!719442 () Bool)

(assert (=> b!1263621 (= e!719443 e!719442)))

(declare-fun res!841654 () Bool)

(assert (=> b!1263621 (=> (not res!841654) (not e!719442))))

(declare-fun e!719441 () Bool)

(assert (=> b!1263621 (= res!841654 (not e!719441))))

(declare-fun res!841652 () Bool)

(assert (=> b!1263621 (=> (not res!841652) (not e!719441))))

(assert (=> b!1263621 (= res!841652 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62230 () Bool)

(declare-fun c!123007 () Bool)

(assert (=> bm!62230 (= call!62233 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123007 (Cons!28336 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000) Nil!28337) Nil!28337)))))

(declare-fun b!1263622 () Bool)

(declare-fun contains!7577 (List!28340 (_ BitVec 64)) Bool)

(assert (=> b!1263622 (= e!719441 (contains!7577 Nil!28337 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263623 () Bool)

(assert (=> b!1263623 (= e!719442 e!719444)))

(assert (=> b!1263623 (= c!123007 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138525 () Bool)

(declare-fun res!841653 () Bool)

(assert (=> d!138525 (=> res!841653 e!719443)))

(assert (=> d!138525 (= res!841653 (bvsge #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(assert (=> d!138525 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28337) e!719443)))

(declare-fun b!1263624 () Bool)

(assert (=> b!1263624 (= e!719444 call!62233)))

(assert (= (and d!138525 (not res!841653)) b!1263621))

(assert (= (and b!1263621 res!841652) b!1263622))

(assert (= (and b!1263621 res!841654) b!1263623))

(assert (= (and b!1263623 c!123007) b!1263624))

(assert (= (and b!1263623 (not c!123007)) b!1263620))

(assert (= (or b!1263624 b!1263620) bm!62230))

(assert (=> b!1263621 m!1163571))

(assert (=> b!1263621 m!1163571))

(assert (=> b!1263621 m!1163581))

(assert (=> bm!62230 m!1163571))

(declare-fun m!1163705 () Bool)

(assert (=> bm!62230 m!1163705))

(assert (=> b!1263622 m!1163571))

(assert (=> b!1263622 m!1163571))

(declare-fun m!1163707 () Bool)

(assert (=> b!1263622 m!1163707))

(assert (=> b!1263623 m!1163571))

(assert (=> b!1263623 m!1163571))

(assert (=> b!1263623 m!1163581))

(assert (=> b!1263454 d!138525))

(declare-fun d!138527 () Bool)

(assert (=> d!138527 (= (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573028 () Unit!41963)

(declare-fun choose!1886 (array!82375 array!82373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48583 V!48583 V!48583 V!48583 (_ BitVec 32) Int) Unit!41963)

(assert (=> d!138527 (= lt!573028 (choose!1886 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138527 (validMask!0 mask!1466)))

(assert (=> d!138527 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1188 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573028)))

(declare-fun bs!35722 () Bool)

(assert (= bs!35722 d!138527))

(assert (=> bs!35722 m!1163517))

(assert (=> bs!35722 m!1163515))

(declare-fun m!1163709 () Bool)

(assert (=> bs!35722 m!1163709))

(assert (=> bs!35722 m!1163505))

(assert (=> b!1263450 d!138527))

(declare-fun b!1263649 () Bool)

(declare-fun e!719460 () Bool)

(declare-fun e!719465 () Bool)

(assert (=> b!1263649 (= e!719460 e!719465)))

(declare-fun c!123019 () Bool)

(assert (=> b!1263649 (= c!123019 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun b!1263650 () Bool)

(assert (=> b!1263650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(assert (=> b!1263650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40270 _values!914)))))

(declare-fun e!719462 () Bool)

(declare-fun lt!573043 () ListLongMap!19015)

(assert (=> b!1263650 (= e!719462 (= (apply!995 lt!573043 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)) (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62233 () Bool)

(declare-fun call!62236 () ListLongMap!19015)

(assert (=> bm!62233 (= call!62236 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263651 () Bool)

(assert (=> b!1263651 (= e!719460 e!719462)))

(assert (=> b!1263651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun res!841664 () Bool)

(assert (=> b!1263651 (= res!841664 (contains!7575 lt!573043 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263651 (=> (not res!841664) (not e!719462))))

(declare-fun b!1263652 () Bool)

(declare-fun lt!573047 () Unit!41963)

(declare-fun lt!573049 () Unit!41963)

(assert (=> b!1263652 (= lt!573047 lt!573049)))

(declare-fun lt!573046 () (_ BitVec 64))

(declare-fun lt!573044 () V!48583)

(declare-fun lt!573045 () ListLongMap!19015)

(declare-fun lt!573048 () (_ BitVec 64))

(assert (=> b!1263652 (not (contains!7575 (+!4292 lt!573045 (tuple2!21143 lt!573046 lt!573044)) lt!573048))))

(declare-fun addStillNotContains!331 (ListLongMap!19015 (_ BitVec 64) V!48583 (_ BitVec 64)) Unit!41963)

(assert (=> b!1263652 (= lt!573049 (addStillNotContains!331 lt!573045 lt!573046 lt!573044 lt!573048))))

(assert (=> b!1263652 (= lt!573048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263652 (= lt!573044 (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263652 (= lt!573046 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263652 (= lt!573045 call!62236)))

(declare-fun e!719464 () ListLongMap!19015)

(assert (=> b!1263652 (= e!719464 (+!4292 call!62236 (tuple2!21143 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000) (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263653 () Bool)

(declare-fun e!719461 () ListLongMap!19015)

(assert (=> b!1263653 (= e!719461 (ListLongMap!19016 Nil!28336))))

(declare-fun b!1263654 () Bool)

(declare-fun e!719463 () Bool)

(assert (=> b!1263654 (= e!719463 e!719460)))

(declare-fun c!123016 () Bool)

(declare-fun e!719459 () Bool)

(assert (=> b!1263654 (= c!123016 e!719459)))

(declare-fun res!841663 () Bool)

(assert (=> b!1263654 (=> (not res!841663) (not e!719459))))

(assert (=> b!1263654 (= res!841663 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun d!138529 () Bool)

(assert (=> d!138529 e!719463))

(declare-fun res!841665 () Bool)

(assert (=> d!138529 (=> (not res!841665) (not e!719463))))

(assert (=> d!138529 (= res!841665 (not (contains!7575 lt!573043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138529 (= lt!573043 e!719461)))

(declare-fun c!123017 () Bool)

(assert (=> d!138529 (= c!123017 (bvsge #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(assert (=> d!138529 (validMask!0 mask!1466)))

(assert (=> d!138529 (= (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573043)))

(declare-fun b!1263655 () Bool)

(assert (=> b!1263655 (= e!719459 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263655 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263656 () Bool)

(assert (=> b!1263656 (= e!719465 (= lt!573043 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263657 () Bool)

(assert (=> b!1263657 (= e!719464 call!62236)))

(declare-fun b!1263658 () Bool)

(declare-fun res!841666 () Bool)

(assert (=> b!1263658 (=> (not res!841666) (not e!719463))))

(assert (=> b!1263658 (= res!841666 (not (contains!7575 lt!573043 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263659 () Bool)

(declare-fun isEmpty!1050 (ListLongMap!19015) Bool)

(assert (=> b!1263659 (= e!719465 (isEmpty!1050 lt!573043))))

(declare-fun b!1263660 () Bool)

(assert (=> b!1263660 (= e!719461 e!719464)))

(declare-fun c!123018 () Bool)

(assert (=> b!1263660 (= c!123018 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138529 c!123017) b!1263653))

(assert (= (and d!138529 (not c!123017)) b!1263660))

(assert (= (and b!1263660 c!123018) b!1263652))

(assert (= (and b!1263660 (not c!123018)) b!1263657))

(assert (= (or b!1263652 b!1263657) bm!62233))

(assert (= (and d!138529 res!841665) b!1263658))

(assert (= (and b!1263658 res!841666) b!1263654))

(assert (= (and b!1263654 res!841663) b!1263655))

(assert (= (and b!1263654 c!123016) b!1263651))

(assert (= (and b!1263654 (not c!123016)) b!1263649))

(assert (= (and b!1263651 res!841664) b!1263650))

(assert (= (and b!1263649 c!123019) b!1263656))

(assert (= (and b!1263649 (not c!123019)) b!1263659))

(declare-fun b_lambda!22961 () Bool)

(assert (=> (not b_lambda!22961) (not b!1263650)))

(assert (=> b!1263650 t!41850))

(declare-fun b_and!45499 () Bool)

(assert (= b_and!45497 (and (=> t!41850 result!23393) b_and!45499)))

(declare-fun b_lambda!22963 () Bool)

(assert (=> (not b_lambda!22963) (not b!1263652)))

(assert (=> b!1263652 t!41850))

(declare-fun b_and!45501 () Bool)

(assert (= b_and!45499 (and (=> t!41850 result!23393) b_and!45501)))

(declare-fun m!1163711 () Bool)

(assert (=> b!1263656 m!1163711))

(declare-fun m!1163713 () Bool)

(assert (=> d!138529 m!1163713))

(assert (=> d!138529 m!1163505))

(declare-fun m!1163715 () Bool)

(assert (=> b!1263659 m!1163715))

(assert (=> b!1263650 m!1163571))

(declare-fun m!1163717 () Bool)

(assert (=> b!1263650 m!1163717))

(assert (=> b!1263650 m!1163571))

(assert (=> b!1263650 m!1163615))

(assert (=> b!1263650 m!1163617))

(assert (=> b!1263650 m!1163615))

(assert (=> b!1263650 m!1163617))

(assert (=> b!1263650 m!1163619))

(assert (=> bm!62233 m!1163711))

(declare-fun m!1163719 () Bool)

(assert (=> b!1263658 m!1163719))

(assert (=> b!1263660 m!1163571))

(assert (=> b!1263660 m!1163571))

(assert (=> b!1263660 m!1163581))

(declare-fun m!1163721 () Bool)

(assert (=> b!1263652 m!1163721))

(declare-fun m!1163723 () Bool)

(assert (=> b!1263652 m!1163723))

(assert (=> b!1263652 m!1163571))

(declare-fun m!1163725 () Bool)

(assert (=> b!1263652 m!1163725))

(declare-fun m!1163727 () Bool)

(assert (=> b!1263652 m!1163727))

(assert (=> b!1263652 m!1163725))

(assert (=> b!1263652 m!1163615))

(assert (=> b!1263652 m!1163617))

(assert (=> b!1263652 m!1163615))

(assert (=> b!1263652 m!1163617))

(assert (=> b!1263652 m!1163619))

(assert (=> b!1263651 m!1163571))

(assert (=> b!1263651 m!1163571))

(declare-fun m!1163729 () Bool)

(assert (=> b!1263651 m!1163729))

(assert (=> b!1263655 m!1163571))

(assert (=> b!1263655 m!1163571))

(assert (=> b!1263655 m!1163581))

(assert (=> b!1263450 d!138529))

(declare-fun b!1263661 () Bool)

(declare-fun e!719467 () Bool)

(declare-fun e!719472 () Bool)

(assert (=> b!1263661 (= e!719467 e!719472)))

(declare-fun c!123023 () Bool)

(assert (=> b!1263661 (= c!123023 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun b!1263662 () Bool)

(assert (=> b!1263662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(assert (=> b!1263662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40270 _values!914)))))

(declare-fun e!719469 () Bool)

(declare-fun lt!573050 () ListLongMap!19015)

(assert (=> b!1263662 (= e!719469 (= (apply!995 lt!573050 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)) (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62234 () Bool)

(declare-fun call!62237 () ListLongMap!19015)

(assert (=> bm!62234 (= call!62237 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263663 () Bool)

(assert (=> b!1263663 (= e!719467 e!719469)))

(assert (=> b!1263663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun res!841668 () Bool)

(assert (=> b!1263663 (= res!841668 (contains!7575 lt!573050 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263663 (=> (not res!841668) (not e!719469))))

(declare-fun b!1263664 () Bool)

(declare-fun lt!573054 () Unit!41963)

(declare-fun lt!573056 () Unit!41963)

(assert (=> b!1263664 (= lt!573054 lt!573056)))

(declare-fun lt!573051 () V!48583)

(declare-fun lt!573052 () ListLongMap!19015)

(declare-fun lt!573053 () (_ BitVec 64))

(declare-fun lt!573055 () (_ BitVec 64))

(assert (=> b!1263664 (not (contains!7575 (+!4292 lt!573052 (tuple2!21143 lt!573053 lt!573051)) lt!573055))))

(assert (=> b!1263664 (= lt!573056 (addStillNotContains!331 lt!573052 lt!573053 lt!573051 lt!573055))))

(assert (=> b!1263664 (= lt!573055 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263664 (= lt!573051 (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263664 (= lt!573053 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263664 (= lt!573052 call!62237)))

(declare-fun e!719471 () ListLongMap!19015)

(assert (=> b!1263664 (= e!719471 (+!4292 call!62237 (tuple2!21143 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000) (get!20292 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3425 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263665 () Bool)

(declare-fun e!719468 () ListLongMap!19015)

(assert (=> b!1263665 (= e!719468 (ListLongMap!19016 Nil!28336))))

(declare-fun b!1263666 () Bool)

(declare-fun e!719470 () Bool)

(assert (=> b!1263666 (= e!719470 e!719467)))

(declare-fun c!123020 () Bool)

(declare-fun e!719466 () Bool)

(assert (=> b!1263666 (= c!123020 e!719466)))

(declare-fun res!841667 () Bool)

(assert (=> b!1263666 (=> (not res!841667) (not e!719466))))

(assert (=> b!1263666 (= res!841667 (bvslt #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(declare-fun d!138531 () Bool)

(assert (=> d!138531 e!719470))

(declare-fun res!841669 () Bool)

(assert (=> d!138531 (=> (not res!841669) (not e!719470))))

(assert (=> d!138531 (= res!841669 (not (contains!7575 lt!573050 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138531 (= lt!573050 e!719468)))

(declare-fun c!123021 () Bool)

(assert (=> d!138531 (= c!123021 (bvsge #b00000000000000000000000000000000 (size!40271 _keys!1118)))))

(assert (=> d!138531 (validMask!0 mask!1466)))

(assert (=> d!138531 (= (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573050)))

(declare-fun b!1263667 () Bool)

(assert (=> b!1263667 (= e!719466 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263667 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263668 () Bool)

(assert (=> b!1263668 (= e!719472 (= lt!573050 (getCurrentListMapNoExtraKeys!5888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263669 () Bool)

(assert (=> b!1263669 (= e!719471 call!62237)))

(declare-fun b!1263670 () Bool)

(declare-fun res!841670 () Bool)

(assert (=> b!1263670 (=> (not res!841670) (not e!719470))))

(assert (=> b!1263670 (= res!841670 (not (contains!7575 lt!573050 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263671 () Bool)

(assert (=> b!1263671 (= e!719472 (isEmpty!1050 lt!573050))))

(declare-fun b!1263672 () Bool)

(assert (=> b!1263672 (= e!719468 e!719471)))

(declare-fun c!123022 () Bool)

(assert (=> b!1263672 (= c!123022 (validKeyInArray!0 (select (arr!39733 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138531 c!123021) b!1263665))

(assert (= (and d!138531 (not c!123021)) b!1263672))

(assert (= (and b!1263672 c!123022) b!1263664))

(assert (= (and b!1263672 (not c!123022)) b!1263669))

(assert (= (or b!1263664 b!1263669) bm!62234))

(assert (= (and d!138531 res!841669) b!1263670))

(assert (= (and b!1263670 res!841670) b!1263666))

(assert (= (and b!1263666 res!841667) b!1263667))

(assert (= (and b!1263666 c!123020) b!1263663))

(assert (= (and b!1263666 (not c!123020)) b!1263661))

(assert (= (and b!1263663 res!841668) b!1263662))

(assert (= (and b!1263661 c!123023) b!1263668))

(assert (= (and b!1263661 (not c!123023)) b!1263671))

(declare-fun b_lambda!22965 () Bool)

(assert (=> (not b_lambda!22965) (not b!1263662)))

(assert (=> b!1263662 t!41850))

(declare-fun b_and!45503 () Bool)

(assert (= b_and!45501 (and (=> t!41850 result!23393) b_and!45503)))

(declare-fun b_lambda!22967 () Bool)

(assert (=> (not b_lambda!22967) (not b!1263664)))

(assert (=> b!1263664 t!41850))

(declare-fun b_and!45505 () Bool)

(assert (= b_and!45503 (and (=> t!41850 result!23393) b_and!45505)))

(declare-fun m!1163731 () Bool)

(assert (=> b!1263668 m!1163731))

(declare-fun m!1163733 () Bool)

(assert (=> d!138531 m!1163733))

(assert (=> d!138531 m!1163505))

(declare-fun m!1163735 () Bool)

(assert (=> b!1263671 m!1163735))

(assert (=> b!1263662 m!1163571))

(declare-fun m!1163737 () Bool)

(assert (=> b!1263662 m!1163737))

(assert (=> b!1263662 m!1163571))

(assert (=> b!1263662 m!1163615))

(assert (=> b!1263662 m!1163617))

(assert (=> b!1263662 m!1163615))

(assert (=> b!1263662 m!1163617))

(assert (=> b!1263662 m!1163619))

(assert (=> bm!62234 m!1163731))

(declare-fun m!1163739 () Bool)

(assert (=> b!1263670 m!1163739))

(assert (=> b!1263672 m!1163571))

(assert (=> b!1263672 m!1163571))

(assert (=> b!1263672 m!1163581))

(declare-fun m!1163741 () Bool)

(assert (=> b!1263664 m!1163741))

(declare-fun m!1163743 () Bool)

(assert (=> b!1263664 m!1163743))

(assert (=> b!1263664 m!1163571))

(declare-fun m!1163745 () Bool)

(assert (=> b!1263664 m!1163745))

(declare-fun m!1163747 () Bool)

(assert (=> b!1263664 m!1163747))

(assert (=> b!1263664 m!1163745))

(assert (=> b!1263664 m!1163615))

(assert (=> b!1263664 m!1163617))

(assert (=> b!1263664 m!1163615))

(assert (=> b!1263664 m!1163617))

(assert (=> b!1263664 m!1163619))

(assert (=> b!1263663 m!1163571))

(assert (=> b!1263663 m!1163571))

(declare-fun m!1163749 () Bool)

(assert (=> b!1263663 m!1163749))

(assert (=> b!1263667 m!1163571))

(assert (=> b!1263667 m!1163571))

(assert (=> b!1263667 m!1163581))

(assert (=> b!1263450 d!138531))

(declare-fun mapIsEmpty!50455 () Bool)

(declare-fun mapRes!50455 () Bool)

(assert (=> mapIsEmpty!50455 mapRes!50455))

(declare-fun b!1263680 () Bool)

(declare-fun e!719478 () Bool)

(assert (=> b!1263680 (= e!719478 tp_is_empty!32413)))

(declare-fun mapNonEmpty!50455 () Bool)

(declare-fun tp!96104 () Bool)

(declare-fun e!719477 () Bool)

(assert (=> mapNonEmpty!50455 (= mapRes!50455 (and tp!96104 e!719477))))

(declare-fun mapRest!50455 () (Array (_ BitVec 32) ValueCell!15443))

(declare-fun mapValue!50455 () ValueCell!15443)

(declare-fun mapKey!50455 () (_ BitVec 32))

(assert (=> mapNonEmpty!50455 (= mapRest!50446 (store mapRest!50455 mapKey!50455 mapValue!50455))))

(declare-fun condMapEmpty!50455 () Bool)

(declare-fun mapDefault!50455 () ValueCell!15443)

(assert (=> mapNonEmpty!50446 (= condMapEmpty!50455 (= mapRest!50446 ((as const (Array (_ BitVec 32) ValueCell!15443)) mapDefault!50455)))))

(assert (=> mapNonEmpty!50446 (= tp!96089 (and e!719478 mapRes!50455))))

(declare-fun b!1263679 () Bool)

(assert (=> b!1263679 (= e!719477 tp_is_empty!32413)))

(assert (= (and mapNonEmpty!50446 condMapEmpty!50455) mapIsEmpty!50455))

(assert (= (and mapNonEmpty!50446 (not condMapEmpty!50455)) mapNonEmpty!50455))

(assert (= (and mapNonEmpty!50455 ((_ is ValueCellFull!15443) mapValue!50455)) b!1263679))

(assert (= (and mapNonEmpty!50446 ((_ is ValueCellFull!15443) mapDefault!50455)) b!1263680))

(declare-fun m!1163751 () Bool)

(assert (=> mapNonEmpty!50455 m!1163751))

(declare-fun b_lambda!22969 () Bool)

(assert (= b_lambda!22959 (or (and start!106114 b_free!27511) b_lambda!22969)))

(declare-fun b_lambda!22971 () Bool)

(assert (= b_lambda!22965 (or (and start!106114 b_free!27511) b_lambda!22971)))

(declare-fun b_lambda!22973 () Bool)

(assert (= b_lambda!22957 (or (and start!106114 b_free!27511) b_lambda!22973)))

(declare-fun b_lambda!22975 () Bool)

(assert (= b_lambda!22963 (or (and start!106114 b_free!27511) b_lambda!22975)))

(declare-fun b_lambda!22977 () Bool)

(assert (= b_lambda!22961 (or (and start!106114 b_free!27511) b_lambda!22977)))

(declare-fun b_lambda!22979 () Bool)

(assert (= b_lambda!22967 (or (and start!106114 b_free!27511) b_lambda!22979)))

(check-sat (not b!1263621) (not b!1263672) (not b!1263598) (not b_lambda!22977) (not bm!62223) tp_is_empty!32413 (not b!1263558) (not d!138527) (not b!1263567) (not b!1263597) (not bm!62221) (not d!138531) (not bm!62216) (not b_lambda!22975) (not b!1263662) (not b!1263656) (not b!1263663) (not b!1263586) (not b!1263664) (not b!1263652) (not b!1263569) (not b!1263658) (not b_lambda!22979) (not b!1263587) (not b!1263600) (not b!1263671) (not b!1263623) (not bm!62219) (not b!1263595) (not d!138529) (not b!1263609) (not b!1263513) (not b!1263650) (not bm!62214) (not b!1263588) (not b!1263651) (not mapNonEmpty!50455) (not b!1263670) (not bm!62233) (not b_lambda!22971) (not b!1263512) (not b!1263668) (not bm!62217) (not d!138517) (not bm!62224) (not b!1263660) b_and!45505 (not b!1263566) (not bm!62226) (not b!1263622) (not bm!62230) (not b!1263562) (not b!1263578) (not b!1263659) (not b_next!27511) (not d!138519) (not bm!62234) (not b!1263589) (not d!138521) (not b!1263564) (not b_lambda!22969) (not b_lambda!22973) (not bm!62199) (not b!1263560) (not b!1263591) (not b!1263593) (not b!1263585) (not d!138523) (not b!1263667) (not b!1263655))
(check-sat b_and!45505 (not b_next!27511))
