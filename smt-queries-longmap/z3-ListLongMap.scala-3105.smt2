; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43600 () Bool)

(assert start!43600)

(declare-fun b_free!12349 () Bool)

(declare-fun b_next!12349 () Bool)

(assert (=> start!43600 (= b_free!12349 (not b_next!12349))))

(declare-fun tp!43336 () Bool)

(declare-fun b_and!21123 () Bool)

(assert (=> start!43600 (= tp!43336 b_and!21123)))

(declare-fun b!483105 () Bool)

(declare-fun e!284302 () Bool)

(declare-fun e!284301 () Bool)

(declare-fun mapRes!22507 () Bool)

(assert (=> b!483105 (= e!284302 (and e!284301 mapRes!22507))))

(declare-fun condMapEmpty!22507 () Bool)

(declare-datatypes ((V!19553 0))(
  ( (V!19554 (val!6978 Int)) )
))
(declare-datatypes ((ValueCell!6569 0))(
  ( (ValueCellFull!6569 (v!9274 V!19553)) (EmptyCell!6569) )
))
(declare-datatypes ((array!31370 0))(
  ( (array!31371 (arr!15085 (Array (_ BitVec 32) ValueCell!6569)) (size!15443 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31370)

(declare-fun mapDefault!22507 () ValueCell!6569)

(assert (=> b!483105 (= condMapEmpty!22507 (= (arr!15085 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6569)) mapDefault!22507)))))

(declare-fun b!483106 () Bool)

(declare-fun e!284298 () Bool)

(declare-datatypes ((array!31372 0))(
  ( (array!31373 (arr!15086 (Array (_ BitVec 32) (_ BitVec 64))) (size!15444 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31372)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483106 (= e!284298 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483107 () Bool)

(declare-fun res!287941 () Bool)

(declare-fun e!284300 () Bool)

(assert (=> b!483107 (=> (not res!287941) (not e!284300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483107 (= res!287941 (validKeyInArray!0 k0!1332))))

(declare-fun b!483108 () Bool)

(declare-fun e!284299 () Bool)

(declare-fun tp_is_empty!13861 () Bool)

(assert (=> b!483108 (= e!284299 tp_is_empty!13861)))

(declare-fun b!483109 () Bool)

(declare-fun e!284304 () Bool)

(assert (=> b!483109 (= e!284300 (not e!284304))))

(declare-fun res!287944 () Bool)

(assert (=> b!483109 (=> res!287944 e!284304)))

(declare-datatypes ((SeekEntryResult!3523 0))(
  ( (MissingZero!3523 (index!16271 (_ BitVec 32))) (Found!3523 (index!16272 (_ BitVec 32))) (Intermediate!3523 (undefined!4335 Bool) (index!16273 (_ BitVec 32)) (x!45324 (_ BitVec 32))) (Undefined!3523) (MissingVacant!3523 (index!16274 (_ BitVec 32))) )
))
(declare-fun lt!219010 () SeekEntryResult!3523)

(get-info :version)

(assert (=> b!483109 (= res!287944 (not ((_ is Found!3523) lt!219010)))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31372 (_ BitVec 32)) SeekEntryResult!3523)

(assert (=> b!483109 (= lt!219010 (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352))))

(declare-fun lt!219011 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31372 (_ BitVec 32)) Bool)

(assert (=> b!483109 (arrayForallSeekEntryOrOpenFound!0 lt!219011 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14125 0))(
  ( (Unit!14126) )
))
(declare-fun lt!219013 () Unit!14125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14125)

(assert (=> b!483109 (= lt!219013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219011))))

(declare-fun arrayScanForKey!0 (array!31372 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483109 (= lt!219011 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483109 e!284298))

(declare-fun c!58035 () Bool)

(assert (=> b!483109 (= c!58035 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219012 () Unit!14125)

(declare-fun minValue!1458 () V!19553)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19553)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!152 (array!31372 array!31370 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 64) Int) Unit!14125)

(assert (=> b!483109 (= lt!219012 (lemmaKeyInListMapIsInArray!152 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!483110 () Bool)

(declare-fun res!287943 () Bool)

(assert (=> b!483110 (=> (not res!287943) (not e!284300))))

(assert (=> b!483110 (= res!287943 (and (= (size!15443 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15444 _keys!1874) (size!15443 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!483111 () Bool)

(declare-fun res!287939 () Bool)

(assert (=> b!483111 (=> (not res!287939) (not e!284300))))

(assert (=> b!483111 (= res!287939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483112 () Bool)

(declare-fun res!287945 () Bool)

(assert (=> b!483112 (=> (not res!287945) (not e!284300))))

(declare-datatypes ((tuple2!9076 0))(
  ( (tuple2!9077 (_1!4549 (_ BitVec 64)) (_2!4549 V!19553)) )
))
(declare-datatypes ((List!9142 0))(
  ( (Nil!9139) (Cons!9138 (h!9994 tuple2!9076) (t!15352 List!9142)) )
))
(declare-datatypes ((ListLongMap!7991 0))(
  ( (ListLongMap!7992 (toList!4011 List!9142)) )
))
(declare-fun contains!2645 (ListLongMap!7991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2325 (array!31372 array!31370 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 32) Int) ListLongMap!7991)

(assert (=> b!483112 (= res!287945 (contains!2645 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!483113 () Bool)

(assert (=> b!483113 (= e!284301 tp_is_empty!13861)))

(declare-fun b!483114 () Bool)

(declare-fun res!287940 () Bool)

(assert (=> b!483114 (=> res!287940 e!284304)))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483114 (= res!287940 (not (inRange!0 (index!16272 lt!219010) mask!2352)))))

(declare-fun res!287946 () Bool)

(assert (=> start!43600 (=> (not res!287946) (not e!284300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43600 (= res!287946 (validMask!0 mask!2352))))

(assert (=> start!43600 e!284300))

(assert (=> start!43600 true))

(assert (=> start!43600 tp_is_empty!13861))

(declare-fun array_inv!10950 (array!31370) Bool)

(assert (=> start!43600 (and (array_inv!10950 _values!1516) e!284302)))

(assert (=> start!43600 tp!43336))

(declare-fun array_inv!10951 (array!31372) Bool)

(assert (=> start!43600 (array_inv!10951 _keys!1874)))

(declare-fun mapIsEmpty!22507 () Bool)

(assert (=> mapIsEmpty!22507 mapRes!22507))

(declare-fun mapNonEmpty!22507 () Bool)

(declare-fun tp!43335 () Bool)

(assert (=> mapNonEmpty!22507 (= mapRes!22507 (and tp!43335 e!284299))))

(declare-fun mapKey!22507 () (_ BitVec 32))

(declare-fun mapRest!22507 () (Array (_ BitVec 32) ValueCell!6569))

(declare-fun mapValue!22507 () ValueCell!6569)

(assert (=> mapNonEmpty!22507 (= (arr!15085 _values!1516) (store mapRest!22507 mapKey!22507 mapValue!22507))))

(declare-fun b!483115 () Bool)

(assert (=> b!483115 (= e!284304 (and (bvsge (index!16272 lt!219010) #b00000000000000000000000000000000) (bvslt (index!16272 lt!219010) (size!15444 _keys!1874))))))

(declare-fun b!483116 () Bool)

(assert (=> b!483116 (= e!284298 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483117 () Bool)

(declare-fun res!287942 () Bool)

(assert (=> b!483117 (=> (not res!287942) (not e!284300))))

(declare-datatypes ((List!9143 0))(
  ( (Nil!9140) (Cons!9139 (h!9995 (_ BitVec 64)) (t!15353 List!9143)) )
))
(declare-fun arrayNoDuplicates!0 (array!31372 (_ BitVec 32) List!9143) Bool)

(assert (=> b!483117 (= res!287942 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9140))))

(assert (= (and start!43600 res!287946) b!483110))

(assert (= (and b!483110 res!287943) b!483111))

(assert (= (and b!483111 res!287939) b!483117))

(assert (= (and b!483117 res!287942) b!483112))

(assert (= (and b!483112 res!287945) b!483107))

(assert (= (and b!483107 res!287941) b!483109))

(assert (= (and b!483109 c!58035) b!483106))

(assert (= (and b!483109 (not c!58035)) b!483116))

(assert (= (and b!483109 (not res!287944)) b!483114))

(assert (= (and b!483114 (not res!287940)) b!483115))

(assert (= (and b!483105 condMapEmpty!22507) mapIsEmpty!22507))

(assert (= (and b!483105 (not condMapEmpty!22507)) mapNonEmpty!22507))

(assert (= (and mapNonEmpty!22507 ((_ is ValueCellFull!6569) mapValue!22507)) b!483108))

(assert (= (and b!483105 ((_ is ValueCellFull!6569) mapDefault!22507)) b!483113))

(assert (= start!43600 b!483105))

(declare-fun m!464385 () Bool)

(assert (=> b!483109 m!464385))

(declare-fun m!464387 () Bool)

(assert (=> b!483109 m!464387))

(declare-fun m!464389 () Bool)

(assert (=> b!483109 m!464389))

(declare-fun m!464391 () Bool)

(assert (=> b!483109 m!464391))

(declare-fun m!464393 () Bool)

(assert (=> b!483109 m!464393))

(declare-fun m!464395 () Bool)

(assert (=> b!483107 m!464395))

(declare-fun m!464397 () Bool)

(assert (=> b!483111 m!464397))

(declare-fun m!464399 () Bool)

(assert (=> mapNonEmpty!22507 m!464399))

(declare-fun m!464401 () Bool)

(assert (=> b!483114 m!464401))

(declare-fun m!464403 () Bool)

(assert (=> start!43600 m!464403))

(declare-fun m!464405 () Bool)

(assert (=> start!43600 m!464405))

(declare-fun m!464407 () Bool)

(assert (=> start!43600 m!464407))

(declare-fun m!464409 () Bool)

(assert (=> b!483112 m!464409))

(assert (=> b!483112 m!464409))

(declare-fun m!464411 () Bool)

(assert (=> b!483112 m!464411))

(declare-fun m!464413 () Bool)

(assert (=> b!483106 m!464413))

(declare-fun m!464415 () Bool)

(assert (=> b!483117 m!464415))

(check-sat (not start!43600) (not b_next!12349) (not mapNonEmpty!22507) (not b!483112) (not b!483106) tp_is_empty!13861 (not b!483114) (not b!483107) (not b!483111) (not b!483109) (not b!483117) b_and!21123)
(check-sat b_and!21123 (not b_next!12349))
(get-model)

(declare-fun b!483206 () Bool)

(declare-fun e!284355 () Bool)

(declare-fun call!31000 () Bool)

(assert (=> b!483206 (= e!284355 call!31000)))

(declare-fun bm!30997 () Bool)

(declare-fun c!58044 () Bool)

(assert (=> bm!30997 (= call!31000 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58044 (Cons!9139 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000) Nil!9140) Nil!9140)))))

(declare-fun d!76907 () Bool)

(declare-fun res!288001 () Bool)

(declare-fun e!284358 () Bool)

(assert (=> d!76907 (=> res!288001 e!284358)))

(assert (=> d!76907 (= res!288001 (bvsge #b00000000000000000000000000000000 (size!15444 _keys!1874)))))

(assert (=> d!76907 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9140) e!284358)))

(declare-fun b!483207 () Bool)

(declare-fun e!284356 () Bool)

(assert (=> b!483207 (= e!284356 e!284355)))

(assert (=> b!483207 (= c!58044 (validKeyInArray!0 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483208 () Bool)

(assert (=> b!483208 (= e!284355 call!31000)))

(declare-fun b!483209 () Bool)

(declare-fun e!284357 () Bool)

(declare-fun contains!2647 (List!9143 (_ BitVec 64)) Bool)

(assert (=> b!483209 (= e!284357 (contains!2647 Nil!9140 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483210 () Bool)

(assert (=> b!483210 (= e!284358 e!284356)))

(declare-fun res!288002 () Bool)

(assert (=> b!483210 (=> (not res!288002) (not e!284356))))

(assert (=> b!483210 (= res!288002 (not e!284357))))

(declare-fun res!288003 () Bool)

(assert (=> b!483210 (=> (not res!288003) (not e!284357))))

(assert (=> b!483210 (= res!288003 (validKeyInArray!0 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76907 (not res!288001)) b!483210))

(assert (= (and b!483210 res!288003) b!483209))

(assert (= (and b!483210 res!288002) b!483207))

(assert (= (and b!483207 c!58044) b!483208))

(assert (= (and b!483207 (not c!58044)) b!483206))

(assert (= (or b!483208 b!483206) bm!30997))

(declare-fun m!464481 () Bool)

(assert (=> bm!30997 m!464481))

(declare-fun m!464483 () Bool)

(assert (=> bm!30997 m!464483))

(assert (=> b!483207 m!464481))

(assert (=> b!483207 m!464481))

(declare-fun m!464485 () Bool)

(assert (=> b!483207 m!464485))

(assert (=> b!483209 m!464481))

(assert (=> b!483209 m!464481))

(declare-fun m!464487 () Bool)

(assert (=> b!483209 m!464487))

(assert (=> b!483210 m!464481))

(assert (=> b!483210 m!464481))

(assert (=> b!483210 m!464485))

(assert (=> b!483117 d!76907))

(declare-fun d!76909 () Bool)

(assert (=> d!76909 (= (inRange!0 (index!16272 lt!219010) mask!2352) (and (bvsge (index!16272 lt!219010) #b00000000000000000000000000000000) (bvslt (index!16272 lt!219010) (bvadd mask!2352 #b00000000000000000000000000000001))))))

(assert (=> b!483114 d!76909))

(declare-fun d!76911 () Bool)

(assert (=> d!76911 (arrayForallSeekEntryOrOpenFound!0 lt!219011 _keys!1874 mask!2352)))

(declare-fun lt!219040 () Unit!14125)

(declare-fun choose!38 (array!31372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14125)

(assert (=> d!76911 (= lt!219040 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219011))))

(assert (=> d!76911 (validMask!0 mask!2352)))

(assert (=> d!76911 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219011) lt!219040)))

(declare-fun bs!15381 () Bool)

(assert (= bs!15381 d!76911))

(assert (=> bs!15381 m!464385))

(declare-fun m!464489 () Bool)

(assert (=> bs!15381 m!464489))

(assert (=> bs!15381 m!464403))

(assert (=> b!483109 d!76911))

(declare-fun b!483219 () Bool)

(declare-fun e!284366 () Bool)

(declare-fun e!284365 () Bool)

(assert (=> b!483219 (= e!284366 e!284365)))

(declare-fun c!58047 () Bool)

(assert (=> b!483219 (= c!58047 (validKeyInArray!0 (select (arr!15086 _keys!1874) lt!219011)))))

(declare-fun b!483220 () Bool)

(declare-fun e!284367 () Bool)

(declare-fun call!31003 () Bool)

(assert (=> b!483220 (= e!284367 call!31003)))

(declare-fun b!483221 () Bool)

(assert (=> b!483221 (= e!284365 e!284367)))

(declare-fun lt!219048 () (_ BitVec 64))

(assert (=> b!483221 (= lt!219048 (select (arr!15086 _keys!1874) lt!219011))))

(declare-fun lt!219049 () Unit!14125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31372 (_ BitVec 64) (_ BitVec 32)) Unit!14125)

(assert (=> b!483221 (= lt!219049 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219048 lt!219011))))

(assert (=> b!483221 (arrayContainsKey!0 _keys!1874 lt!219048 #b00000000000000000000000000000000)))

(declare-fun lt!219047 () Unit!14125)

(assert (=> b!483221 (= lt!219047 lt!219049)))

(declare-fun res!288008 () Bool)

(assert (=> b!483221 (= res!288008 (= (seekEntryOrOpen!0 (select (arr!15086 _keys!1874) lt!219011) _keys!1874 mask!2352) (Found!3523 lt!219011)))))

(assert (=> b!483221 (=> (not res!288008) (not e!284367))))

(declare-fun b!483222 () Bool)

(assert (=> b!483222 (= e!284365 call!31003)))

(declare-fun bm!31000 () Bool)

(assert (=> bm!31000 (= call!31003 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!219011 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun d!76913 () Bool)

(declare-fun res!288009 () Bool)

(assert (=> d!76913 (=> res!288009 e!284366)))

(assert (=> d!76913 (= res!288009 (bvsge lt!219011 (size!15444 _keys!1874)))))

(assert (=> d!76913 (= (arrayForallSeekEntryOrOpenFound!0 lt!219011 _keys!1874 mask!2352) e!284366)))

(assert (= (and d!76913 (not res!288009)) b!483219))

(assert (= (and b!483219 c!58047) b!483221))

(assert (= (and b!483219 (not c!58047)) b!483222))

(assert (= (and b!483221 res!288008) b!483220))

(assert (= (or b!483220 b!483222) bm!31000))

(declare-fun m!464491 () Bool)

(assert (=> b!483219 m!464491))

(assert (=> b!483219 m!464491))

(declare-fun m!464493 () Bool)

(assert (=> b!483219 m!464493))

(assert (=> b!483221 m!464491))

(declare-fun m!464495 () Bool)

(assert (=> b!483221 m!464495))

(declare-fun m!464497 () Bool)

(assert (=> b!483221 m!464497))

(assert (=> b!483221 m!464491))

(declare-fun m!464499 () Bool)

(assert (=> b!483221 m!464499))

(declare-fun m!464501 () Bool)

(assert (=> bm!31000 m!464501))

(assert (=> b!483109 d!76913))

(declare-fun b!483235 () Bool)

(declare-fun c!58056 () Bool)

(declare-fun lt!219056 () (_ BitVec 64))

(assert (=> b!483235 (= c!58056 (= lt!219056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!284374 () SeekEntryResult!3523)

(declare-fun e!284375 () SeekEntryResult!3523)

(assert (=> b!483235 (= e!284374 e!284375)))

(declare-fun b!483236 () Bool)

(declare-fun lt!219057 () SeekEntryResult!3523)

(assert (=> b!483236 (= e!284374 (Found!3523 (index!16273 lt!219057)))))

(declare-fun d!76915 () Bool)

(declare-fun lt!219058 () SeekEntryResult!3523)

(assert (=> d!76915 (and (or ((_ is Undefined!3523) lt!219058) (not ((_ is Found!3523) lt!219058)) (and (bvsge (index!16272 lt!219058) #b00000000000000000000000000000000) (bvslt (index!16272 lt!219058) (size!15444 _keys!1874)))) (or ((_ is Undefined!3523) lt!219058) ((_ is Found!3523) lt!219058) (not ((_ is MissingZero!3523) lt!219058)) (and (bvsge (index!16271 lt!219058) #b00000000000000000000000000000000) (bvslt (index!16271 lt!219058) (size!15444 _keys!1874)))) (or ((_ is Undefined!3523) lt!219058) ((_ is Found!3523) lt!219058) ((_ is MissingZero!3523) lt!219058) (not ((_ is MissingVacant!3523) lt!219058)) (and (bvsge (index!16274 lt!219058) #b00000000000000000000000000000000) (bvslt (index!16274 lt!219058) (size!15444 _keys!1874)))) (or ((_ is Undefined!3523) lt!219058) (ite ((_ is Found!3523) lt!219058) (= (select (arr!15086 _keys!1874) (index!16272 lt!219058)) k0!1332) (ite ((_ is MissingZero!3523) lt!219058) (= (select (arr!15086 _keys!1874) (index!16271 lt!219058)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3523) lt!219058) (= (select (arr!15086 _keys!1874) (index!16274 lt!219058)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!284376 () SeekEntryResult!3523)

(assert (=> d!76915 (= lt!219058 e!284376)))

(declare-fun c!58054 () Bool)

(assert (=> d!76915 (= c!58054 (and ((_ is Intermediate!3523) lt!219057) (undefined!4335 lt!219057)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31372 (_ BitVec 32)) SeekEntryResult!3523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!76915 (= lt!219057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1332 mask!2352) k0!1332 _keys!1874 mask!2352))))

(assert (=> d!76915 (validMask!0 mask!2352)))

(assert (=> d!76915 (= (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352) lt!219058)))

(declare-fun b!483237 () Bool)

(assert (=> b!483237 (= e!284376 Undefined!3523)))

(declare-fun b!483238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31372 (_ BitVec 32)) SeekEntryResult!3523)

(assert (=> b!483238 (= e!284375 (seekKeyOrZeroReturnVacant!0 (x!45324 lt!219057) (index!16273 lt!219057) (index!16273 lt!219057) k0!1332 _keys!1874 mask!2352))))

(declare-fun b!483239 () Bool)

(assert (=> b!483239 (= e!284376 e!284374)))

(assert (=> b!483239 (= lt!219056 (select (arr!15086 _keys!1874) (index!16273 lt!219057)))))

(declare-fun c!58055 () Bool)

(assert (=> b!483239 (= c!58055 (= lt!219056 k0!1332))))

(declare-fun b!483240 () Bool)

(assert (=> b!483240 (= e!284375 (MissingZero!3523 (index!16273 lt!219057)))))

(assert (= (and d!76915 c!58054) b!483237))

(assert (= (and d!76915 (not c!58054)) b!483239))

(assert (= (and b!483239 c!58055) b!483236))

(assert (= (and b!483239 (not c!58055)) b!483235))

(assert (= (and b!483235 c!58056) b!483240))

(assert (= (and b!483235 (not c!58056)) b!483238))

(declare-fun m!464503 () Bool)

(assert (=> d!76915 m!464503))

(declare-fun m!464505 () Bool)

(assert (=> d!76915 m!464505))

(declare-fun m!464507 () Bool)

(assert (=> d!76915 m!464507))

(declare-fun m!464509 () Bool)

(assert (=> d!76915 m!464509))

(assert (=> d!76915 m!464507))

(assert (=> d!76915 m!464403))

(declare-fun m!464511 () Bool)

(assert (=> d!76915 m!464511))

(declare-fun m!464513 () Bool)

(assert (=> b!483238 m!464513))

(declare-fun m!464515 () Bool)

(assert (=> b!483239 m!464515))

(assert (=> b!483109 d!76915))

(declare-fun d!76917 () Bool)

(declare-fun e!284379 () Bool)

(assert (=> d!76917 e!284379))

(declare-fun c!58059 () Bool)

(assert (=> d!76917 (= c!58059 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219061 () Unit!14125)

(declare-fun choose!1386 (array!31372 array!31370 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 64) Int) Unit!14125)

(assert (=> d!76917 (= lt!219061 (choose!1386 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76917 (validMask!0 mask!2352)))

(assert (=> d!76917 (= (lemmaKeyInListMapIsInArray!152 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!219061)))

(declare-fun b!483245 () Bool)

(assert (=> b!483245 (= e!284379 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483246 () Bool)

(assert (=> b!483246 (= e!284379 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76917 c!58059) b!483245))

(assert (= (and d!76917 (not c!58059)) b!483246))

(declare-fun m!464517 () Bool)

(assert (=> d!76917 m!464517))

(assert (=> d!76917 m!464403))

(assert (=> b!483245 m!464413))

(assert (=> b!483109 d!76917))

(declare-fun d!76919 () Bool)

(declare-fun lt!219064 () (_ BitVec 32))

(assert (=> d!76919 (and (or (bvslt lt!219064 #b00000000000000000000000000000000) (bvsge lt!219064 (size!15444 _keys!1874)) (and (bvsge lt!219064 #b00000000000000000000000000000000) (bvslt lt!219064 (size!15444 _keys!1874)))) (bvsge lt!219064 #b00000000000000000000000000000000) (bvslt lt!219064 (size!15444 _keys!1874)) (= (select (arr!15086 _keys!1874) lt!219064) k0!1332))))

(declare-fun e!284382 () (_ BitVec 32))

(assert (=> d!76919 (= lt!219064 e!284382)))

(declare-fun c!58062 () Bool)

(assert (=> d!76919 (= c!58062 (= (select (arr!15086 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15444 _keys!1874)) (bvslt (size!15444 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76919 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!219064)))

(declare-fun b!483251 () Bool)

(assert (=> b!483251 (= e!284382 #b00000000000000000000000000000000)))

(declare-fun b!483252 () Bool)

(assert (=> b!483252 (= e!284382 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76919 c!58062) b!483251))

(assert (= (and d!76919 (not c!58062)) b!483252))

(declare-fun m!464519 () Bool)

(assert (=> d!76919 m!464519))

(assert (=> d!76919 m!464481))

(declare-fun m!464521 () Bool)

(assert (=> b!483252 m!464521))

(assert (=> b!483109 d!76919))

(declare-fun d!76921 () Bool)

(declare-fun e!284388 () Bool)

(assert (=> d!76921 e!284388))

(declare-fun res!288012 () Bool)

(assert (=> d!76921 (=> res!288012 e!284388)))

(declare-fun lt!219075 () Bool)

(assert (=> d!76921 (= res!288012 (not lt!219075))))

(declare-fun lt!219074 () Bool)

(assert (=> d!76921 (= lt!219075 lt!219074)))

(declare-fun lt!219076 () Unit!14125)

(declare-fun e!284387 () Unit!14125)

(assert (=> d!76921 (= lt!219076 e!284387)))

(declare-fun c!58065 () Bool)

(assert (=> d!76921 (= c!58065 lt!219074)))

(declare-fun containsKey!360 (List!9142 (_ BitVec 64)) Bool)

(assert (=> d!76921 (= lt!219074 (containsKey!360 (toList!4011 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76921 (= (contains!2645 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!219075)))

(declare-fun b!483259 () Bool)

(declare-fun lt!219073 () Unit!14125)

(assert (=> b!483259 (= e!284387 lt!219073)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!308 (List!9142 (_ BitVec 64)) Unit!14125)

(assert (=> b!483259 (= lt!219073 (lemmaContainsKeyImpliesGetValueByKeyDefined!308 (toList!4011 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!405 0))(
  ( (Some!404 (v!9277 V!19553)) (None!403) )
))
(declare-fun isDefined!309 (Option!405) Bool)

(declare-fun getValueByKey!399 (List!9142 (_ BitVec 64)) Option!405)

(assert (=> b!483259 (isDefined!309 (getValueByKey!399 (toList!4011 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!483260 () Bool)

(declare-fun Unit!14131 () Unit!14125)

(assert (=> b!483260 (= e!284387 Unit!14131)))

(declare-fun b!483261 () Bool)

(assert (=> b!483261 (= e!284388 (isDefined!309 (getValueByKey!399 (toList!4011 (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76921 c!58065) b!483259))

(assert (= (and d!76921 (not c!58065)) b!483260))

(assert (= (and d!76921 (not res!288012)) b!483261))

(declare-fun m!464523 () Bool)

(assert (=> d!76921 m!464523))

(declare-fun m!464525 () Bool)

(assert (=> b!483259 m!464525))

(declare-fun m!464527 () Bool)

(assert (=> b!483259 m!464527))

(assert (=> b!483259 m!464527))

(declare-fun m!464529 () Bool)

(assert (=> b!483259 m!464529))

(assert (=> b!483261 m!464527))

(assert (=> b!483261 m!464527))

(assert (=> b!483261 m!464529))

(assert (=> b!483112 d!76921))

(declare-fun b!483304 () Bool)

(declare-fun e!284424 () Bool)

(declare-fun e!284422 () Bool)

(assert (=> b!483304 (= e!284424 e!284422)))

(declare-fun res!288038 () Bool)

(assert (=> b!483304 (=> (not res!288038) (not e!284422))))

(declare-fun lt!219130 () ListLongMap!7991)

(assert (=> b!483304 (= res!288038 (contains!2645 lt!219130 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!483304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15444 _keys!1874)))))

(declare-fun b!483305 () Bool)

(declare-fun apply!345 (ListLongMap!7991 (_ BitVec 64)) V!19553)

(declare-fun get!7307 (ValueCell!6569 V!19553) V!19553)

(declare-fun dynLambda!953 (Int (_ BitVec 64)) V!19553)

(assert (=> b!483305 (= e!284422 (= (apply!345 lt!219130 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)) (get!7307 (select (arr!15085 _values!1516) #b00000000000000000000000000000000) (dynLambda!953 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15443 _values!1516)))))

(assert (=> b!483305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15444 _keys!1874)))))

(declare-fun b!483306 () Bool)

(declare-fun e!284425 () Bool)

(declare-fun call!31023 () Bool)

(assert (=> b!483306 (= e!284425 (not call!31023))))

(declare-fun b!483307 () Bool)

(declare-fun e!284419 () Bool)

(assert (=> b!483307 (= e!284419 (validKeyInArray!0 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483308 () Bool)

(declare-fun e!284420 () Bool)

(declare-fun call!31018 () Bool)

(assert (=> b!483308 (= e!284420 (not call!31018))))

(declare-fun b!483309 () Bool)

(declare-fun e!284417 () ListLongMap!7991)

(declare-fun call!31022 () ListLongMap!7991)

(declare-fun +!1784 (ListLongMap!7991 tuple2!9076) ListLongMap!7991)

(assert (=> b!483309 (= e!284417 (+!1784 call!31022 (tuple2!9077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!483310 () Bool)

(declare-fun res!288033 () Bool)

(declare-fun e!284415 () Bool)

(assert (=> b!483310 (=> (not res!288033) (not e!284415))))

(assert (=> b!483310 (= res!288033 e!284424)))

(declare-fun res!288031 () Bool)

(assert (=> b!483310 (=> res!288031 e!284424)))

(declare-fun e!284421 () Bool)

(assert (=> b!483310 (= res!288031 (not e!284421))))

(declare-fun res!288039 () Bool)

(assert (=> b!483310 (=> (not res!288039) (not e!284421))))

(assert (=> b!483310 (= res!288039 (bvslt #b00000000000000000000000000000000 (size!15444 _keys!1874)))))

(declare-fun bm!31015 () Bool)

(declare-fun call!31024 () ListLongMap!7991)

(assert (=> bm!31015 (= call!31024 call!31022)))

(declare-fun call!31021 () ListLongMap!7991)

(declare-fun bm!31016 () Bool)

(declare-fun call!31020 () ListLongMap!7991)

(declare-fun c!58083 () Bool)

(declare-fun c!58082 () Bool)

(declare-fun call!31019 () ListLongMap!7991)

(assert (=> bm!31016 (= call!31022 (+!1784 (ite c!58082 call!31020 (ite c!58083 call!31021 call!31019)) (ite (or c!58082 c!58083) (tuple2!9077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!483311 () Bool)

(declare-fun e!284423 () Bool)

(assert (=> b!483311 (= e!284423 (= (apply!345 lt!219130 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!483312 () Bool)

(declare-fun e!284426 () Unit!14125)

(declare-fun Unit!14132 () Unit!14125)

(assert (=> b!483312 (= e!284426 Unit!14132)))

(declare-fun bm!31017 () Bool)

(assert (=> bm!31017 (= call!31021 call!31020)))

(declare-fun b!483313 () Bool)

(declare-fun e!284427 () Bool)

(assert (=> b!483313 (= e!284427 (= (apply!345 lt!219130 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!483315 () Bool)

(declare-fun e!284418 () ListLongMap!7991)

(assert (=> b!483315 (= e!284418 call!31024)))

(declare-fun b!483316 () Bool)

(declare-fun e!284416 () ListLongMap!7991)

(assert (=> b!483316 (= e!284416 call!31019)))

(declare-fun b!483317 () Bool)

(assert (=> b!483317 (= e!284416 call!31024)))

(declare-fun b!483318 () Bool)

(declare-fun res!288034 () Bool)

(assert (=> b!483318 (=> (not res!288034) (not e!284415))))

(assert (=> b!483318 (= res!288034 e!284420)))

(declare-fun c!58079 () Bool)

(assert (=> b!483318 (= c!58079 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!31018 () Bool)

(assert (=> bm!31018 (= call!31019 call!31021)))

(declare-fun b!483319 () Bool)

(declare-fun c!58078 () Bool)

(assert (=> b!483319 (= c!58078 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!483319 (= e!284418 e!284416)))

(declare-fun bm!31019 () Bool)

(assert (=> bm!31019 (= call!31023 (contains!2645 lt!219130 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!31020 () Bool)

(assert (=> bm!31020 (= call!31018 (contains!2645 lt!219130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483320 () Bool)

(assert (=> b!483320 (= e!284425 e!284423)))

(declare-fun res!288036 () Bool)

(assert (=> b!483320 (= res!288036 call!31023)))

(assert (=> b!483320 (=> (not res!288036) (not e!284423))))

(declare-fun b!483321 () Bool)

(declare-fun lt!219128 () Unit!14125)

(assert (=> b!483321 (= e!284426 lt!219128)))

(declare-fun lt!219125 () ListLongMap!7991)

(declare-fun getCurrentListMapNoExtraKeys!2129 (array!31372 array!31370 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 32) Int) ListLongMap!7991)

(assert (=> b!483321 (= lt!219125 (getCurrentListMapNoExtraKeys!2129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219140 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219132 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219132 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219133 () Unit!14125)

(declare-fun addStillContains!303 (ListLongMap!7991 (_ BitVec 64) V!19553 (_ BitVec 64)) Unit!14125)

(assert (=> b!483321 (= lt!219133 (addStillContains!303 lt!219125 lt!219140 zeroValue!1458 lt!219132))))

(assert (=> b!483321 (contains!2645 (+!1784 lt!219125 (tuple2!9077 lt!219140 zeroValue!1458)) lt!219132)))

(declare-fun lt!219137 () Unit!14125)

(assert (=> b!483321 (= lt!219137 lt!219133)))

(declare-fun lt!219131 () ListLongMap!7991)

(assert (=> b!483321 (= lt!219131 (getCurrentListMapNoExtraKeys!2129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219139 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219122 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219122 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219141 () Unit!14125)

(declare-fun addApplyDifferent!303 (ListLongMap!7991 (_ BitVec 64) V!19553 (_ BitVec 64)) Unit!14125)

(assert (=> b!483321 (= lt!219141 (addApplyDifferent!303 lt!219131 lt!219139 minValue!1458 lt!219122))))

(assert (=> b!483321 (= (apply!345 (+!1784 lt!219131 (tuple2!9077 lt!219139 minValue!1458)) lt!219122) (apply!345 lt!219131 lt!219122))))

(declare-fun lt!219126 () Unit!14125)

(assert (=> b!483321 (= lt!219126 lt!219141)))

(declare-fun lt!219123 () ListLongMap!7991)

(assert (=> b!483321 (= lt!219123 (getCurrentListMapNoExtraKeys!2129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219121 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219129 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219129 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219142 () Unit!14125)

(assert (=> b!483321 (= lt!219142 (addApplyDifferent!303 lt!219123 lt!219121 zeroValue!1458 lt!219129))))

(assert (=> b!483321 (= (apply!345 (+!1784 lt!219123 (tuple2!9077 lt!219121 zeroValue!1458)) lt!219129) (apply!345 lt!219123 lt!219129))))

(declare-fun lt!219124 () Unit!14125)

(assert (=> b!483321 (= lt!219124 lt!219142)))

(declare-fun lt!219136 () ListLongMap!7991)

(assert (=> b!483321 (= lt!219136 (getCurrentListMapNoExtraKeys!2129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219134 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219134 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219127 () (_ BitVec 64))

(assert (=> b!483321 (= lt!219127 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!483321 (= lt!219128 (addApplyDifferent!303 lt!219136 lt!219134 minValue!1458 lt!219127))))

(assert (=> b!483321 (= (apply!345 (+!1784 lt!219136 (tuple2!9077 lt!219134 minValue!1458)) lt!219127) (apply!345 lt!219136 lt!219127))))

(declare-fun b!483322 () Bool)

(assert (=> b!483322 (= e!284415 e!284425)))

(declare-fun c!58081 () Bool)

(assert (=> b!483322 (= c!58081 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!31021 () Bool)

(assert (=> bm!31021 (= call!31020 (getCurrentListMapNoExtraKeys!2129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun d!76923 () Bool)

(assert (=> d!76923 e!284415))

(declare-fun res!288035 () Bool)

(assert (=> d!76923 (=> (not res!288035) (not e!284415))))

(assert (=> d!76923 (= res!288035 (or (bvsge #b00000000000000000000000000000000 (size!15444 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15444 _keys!1874)))))))

(declare-fun lt!219138 () ListLongMap!7991)

(assert (=> d!76923 (= lt!219130 lt!219138)))

(declare-fun lt!219135 () Unit!14125)

(assert (=> d!76923 (= lt!219135 e!284426)))

(declare-fun c!58080 () Bool)

(assert (=> d!76923 (= c!58080 e!284419)))

(declare-fun res!288037 () Bool)

(assert (=> d!76923 (=> (not res!288037) (not e!284419))))

(assert (=> d!76923 (= res!288037 (bvslt #b00000000000000000000000000000000 (size!15444 _keys!1874)))))

(assert (=> d!76923 (= lt!219138 e!284417)))

(assert (=> d!76923 (= c!58082 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76923 (validMask!0 mask!2352)))

(assert (=> d!76923 (= (getCurrentListMap!2325 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!219130)))

(declare-fun b!483314 () Bool)

(assert (=> b!483314 (= e!284417 e!284418)))

(assert (=> b!483314 (= c!58083 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483323 () Bool)

(assert (=> b!483323 (= e!284421 (validKeyInArray!0 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483324 () Bool)

(assert (=> b!483324 (= e!284420 e!284427)))

(declare-fun res!288032 () Bool)

(assert (=> b!483324 (= res!288032 call!31018)))

(assert (=> b!483324 (=> (not res!288032) (not e!284427))))

(assert (= (and d!76923 c!58082) b!483309))

(assert (= (and d!76923 (not c!58082)) b!483314))

(assert (= (and b!483314 c!58083) b!483315))

(assert (= (and b!483314 (not c!58083)) b!483319))

(assert (= (and b!483319 c!58078) b!483317))

(assert (= (and b!483319 (not c!58078)) b!483316))

(assert (= (or b!483317 b!483316) bm!31018))

(assert (= (or b!483315 bm!31018) bm!31017))

(assert (= (or b!483315 b!483317) bm!31015))

(assert (= (or b!483309 bm!31017) bm!31021))

(assert (= (or b!483309 bm!31015) bm!31016))

(assert (= (and d!76923 res!288037) b!483307))

(assert (= (and d!76923 c!58080) b!483321))

(assert (= (and d!76923 (not c!58080)) b!483312))

(assert (= (and d!76923 res!288035) b!483310))

(assert (= (and b!483310 res!288039) b!483323))

(assert (= (and b!483310 (not res!288031)) b!483304))

(assert (= (and b!483304 res!288038) b!483305))

(assert (= (and b!483310 res!288033) b!483318))

(assert (= (and b!483318 c!58079) b!483324))

(assert (= (and b!483318 (not c!58079)) b!483308))

(assert (= (and b!483324 res!288032) b!483313))

(assert (= (or b!483324 b!483308) bm!31020))

(assert (= (and b!483318 res!288034) b!483322))

(assert (= (and b!483322 c!58081) b!483320))

(assert (= (and b!483322 (not c!58081)) b!483306))

(assert (= (and b!483320 res!288036) b!483311))

(assert (= (or b!483320 b!483306) bm!31019))

(declare-fun b_lambda!10829 () Bool)

(assert (=> (not b_lambda!10829) (not b!483305)))

(declare-fun t!15357 () Bool)

(declare-fun tb!4163 () Bool)

(assert (=> (and start!43600 (= defaultEntry!1519 defaultEntry!1519) t!15357) tb!4163))

(declare-fun result!7773 () Bool)

(assert (=> tb!4163 (= result!7773 tp_is_empty!13861)))

(assert (=> b!483305 t!15357))

(declare-fun b_and!21129 () Bool)

(assert (= b_and!21123 (and (=> t!15357 result!7773) b_and!21129)))

(declare-fun m!464531 () Bool)

(assert (=> b!483309 m!464531))

(declare-fun m!464533 () Bool)

(assert (=> bm!31021 m!464533))

(declare-fun m!464535 () Bool)

(assert (=> b!483305 m!464535))

(assert (=> b!483305 m!464481))

(declare-fun m!464537 () Bool)

(assert (=> b!483305 m!464537))

(declare-fun m!464539 () Bool)

(assert (=> b!483305 m!464539))

(assert (=> b!483305 m!464481))

(assert (=> b!483305 m!464535))

(assert (=> b!483305 m!464539))

(declare-fun m!464541 () Bool)

(assert (=> b!483305 m!464541))

(declare-fun m!464543 () Bool)

(assert (=> b!483311 m!464543))

(declare-fun m!464545 () Bool)

(assert (=> b!483313 m!464545))

(assert (=> b!483307 m!464481))

(assert (=> b!483307 m!464481))

(assert (=> b!483307 m!464485))

(assert (=> d!76923 m!464403))

(declare-fun m!464547 () Bool)

(assert (=> bm!31019 m!464547))

(declare-fun m!464549 () Bool)

(assert (=> b!483321 m!464549))

(declare-fun m!464551 () Bool)

(assert (=> b!483321 m!464551))

(declare-fun m!464553 () Bool)

(assert (=> b!483321 m!464553))

(declare-fun m!464555 () Bool)

(assert (=> b!483321 m!464555))

(declare-fun m!464557 () Bool)

(assert (=> b!483321 m!464557))

(declare-fun m!464559 () Bool)

(assert (=> b!483321 m!464559))

(assert (=> b!483321 m!464551))

(declare-fun m!464561 () Bool)

(assert (=> b!483321 m!464561))

(declare-fun m!464563 () Bool)

(assert (=> b!483321 m!464563))

(assert (=> b!483321 m!464533))

(declare-fun m!464565 () Bool)

(assert (=> b!483321 m!464565))

(assert (=> b!483321 m!464481))

(declare-fun m!464567 () Bool)

(assert (=> b!483321 m!464567))

(assert (=> b!483321 m!464549))

(declare-fun m!464569 () Bool)

(assert (=> b!483321 m!464569))

(declare-fun m!464571 () Bool)

(assert (=> b!483321 m!464571))

(assert (=> b!483321 m!464561))

(declare-fun m!464573 () Bool)

(assert (=> b!483321 m!464573))

(assert (=> b!483321 m!464559))

(declare-fun m!464575 () Bool)

(assert (=> b!483321 m!464575))

(declare-fun m!464577 () Bool)

(assert (=> b!483321 m!464577))

(assert (=> b!483323 m!464481))

(assert (=> b!483323 m!464481))

(assert (=> b!483323 m!464485))

(declare-fun m!464579 () Bool)

(assert (=> bm!31016 m!464579))

(assert (=> b!483304 m!464481))

(assert (=> b!483304 m!464481))

(declare-fun m!464581 () Bool)

(assert (=> b!483304 m!464581))

(declare-fun m!464583 () Bool)

(assert (=> bm!31020 m!464583))

(assert (=> b!483112 d!76923))

(declare-fun d!76925 () Bool)

(assert (=> d!76925 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483107 d!76925))

(declare-fun d!76927 () Bool)

(assert (=> d!76927 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43600 d!76927))

(declare-fun d!76929 () Bool)

(assert (=> d!76929 (= (array_inv!10950 _values!1516) (bvsge (size!15443 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43600 d!76929))

(declare-fun d!76931 () Bool)

(assert (=> d!76931 (= (array_inv!10951 _keys!1874) (bvsge (size!15444 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43600 d!76931))

(declare-fun b!483327 () Bool)

(declare-fun e!284429 () Bool)

(declare-fun e!284428 () Bool)

(assert (=> b!483327 (= e!284429 e!284428)))

(declare-fun c!58084 () Bool)

(assert (=> b!483327 (= c!58084 (validKeyInArray!0 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483328 () Bool)

(declare-fun e!284430 () Bool)

(declare-fun call!31025 () Bool)

(assert (=> b!483328 (= e!284430 call!31025)))

(declare-fun b!483329 () Bool)

(assert (=> b!483329 (= e!284428 e!284430)))

(declare-fun lt!219144 () (_ BitVec 64))

(assert (=> b!483329 (= lt!219144 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219145 () Unit!14125)

(assert (=> b!483329 (= lt!219145 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219144 #b00000000000000000000000000000000))))

(assert (=> b!483329 (arrayContainsKey!0 _keys!1874 lt!219144 #b00000000000000000000000000000000)))

(declare-fun lt!219143 () Unit!14125)

(assert (=> b!483329 (= lt!219143 lt!219145)))

(declare-fun res!288040 () Bool)

(assert (=> b!483329 (= res!288040 (= (seekEntryOrOpen!0 (select (arr!15086 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3523 #b00000000000000000000000000000000)))))

(assert (=> b!483329 (=> (not res!288040) (not e!284430))))

(declare-fun b!483330 () Bool)

(assert (=> b!483330 (= e!284428 call!31025)))

(declare-fun bm!31022 () Bool)

(assert (=> bm!31022 (= call!31025 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun d!76933 () Bool)

(declare-fun res!288041 () Bool)

(assert (=> d!76933 (=> res!288041 e!284429)))

(assert (=> d!76933 (= res!288041 (bvsge #b00000000000000000000000000000000 (size!15444 _keys!1874)))))

(assert (=> d!76933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284429)))

(assert (= (and d!76933 (not res!288041)) b!483327))

(assert (= (and b!483327 c!58084) b!483329))

(assert (= (and b!483327 (not c!58084)) b!483330))

(assert (= (and b!483329 res!288040) b!483328))

(assert (= (or b!483328 b!483330) bm!31022))

(assert (=> b!483327 m!464481))

(assert (=> b!483327 m!464481))

(assert (=> b!483327 m!464485))

(assert (=> b!483329 m!464481))

(declare-fun m!464585 () Bool)

(assert (=> b!483329 m!464585))

(declare-fun m!464587 () Bool)

(assert (=> b!483329 m!464587))

(assert (=> b!483329 m!464481))

(declare-fun m!464589 () Bool)

(assert (=> b!483329 m!464589))

(declare-fun m!464591 () Bool)

(assert (=> bm!31022 m!464591))

(assert (=> b!483111 d!76933))

(declare-fun d!76935 () Bool)

(declare-fun res!288046 () Bool)

(declare-fun e!284435 () Bool)

(assert (=> d!76935 (=> res!288046 e!284435)))

(assert (=> d!76935 (= res!288046 (= (select (arr!15086 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76935 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284435)))

(declare-fun b!483335 () Bool)

(declare-fun e!284436 () Bool)

(assert (=> b!483335 (= e!284435 e!284436)))

(declare-fun res!288047 () Bool)

(assert (=> b!483335 (=> (not res!288047) (not e!284436))))

(assert (=> b!483335 (= res!288047 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15444 _keys!1874)))))

(declare-fun b!483336 () Bool)

(assert (=> b!483336 (= e!284436 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76935 (not res!288046)) b!483335))

(assert (= (and b!483335 res!288047) b!483336))

(assert (=> d!76935 m!464481))

(declare-fun m!464593 () Bool)

(assert (=> b!483336 m!464593))

(assert (=> b!483106 d!76935))

(declare-fun mapIsEmpty!22516 () Bool)

(declare-fun mapRes!22516 () Bool)

(assert (=> mapIsEmpty!22516 mapRes!22516))

(declare-fun b!483344 () Bool)

(declare-fun e!284441 () Bool)

(assert (=> b!483344 (= e!284441 tp_is_empty!13861)))

(declare-fun mapNonEmpty!22516 () Bool)

(declare-fun tp!43351 () Bool)

(declare-fun e!284442 () Bool)

(assert (=> mapNonEmpty!22516 (= mapRes!22516 (and tp!43351 e!284442))))

(declare-fun mapValue!22516 () ValueCell!6569)

(declare-fun mapRest!22516 () (Array (_ BitVec 32) ValueCell!6569))

(declare-fun mapKey!22516 () (_ BitVec 32))

(assert (=> mapNonEmpty!22516 (= mapRest!22507 (store mapRest!22516 mapKey!22516 mapValue!22516))))

(declare-fun condMapEmpty!22516 () Bool)

(declare-fun mapDefault!22516 () ValueCell!6569)

(assert (=> mapNonEmpty!22507 (= condMapEmpty!22516 (= mapRest!22507 ((as const (Array (_ BitVec 32) ValueCell!6569)) mapDefault!22516)))))

(assert (=> mapNonEmpty!22507 (= tp!43335 (and e!284441 mapRes!22516))))

(declare-fun b!483343 () Bool)

(assert (=> b!483343 (= e!284442 tp_is_empty!13861)))

(assert (= (and mapNonEmpty!22507 condMapEmpty!22516) mapIsEmpty!22516))

(assert (= (and mapNonEmpty!22507 (not condMapEmpty!22516)) mapNonEmpty!22516))

(assert (= (and mapNonEmpty!22516 ((_ is ValueCellFull!6569) mapValue!22516)) b!483343))

(assert (= (and mapNonEmpty!22507 ((_ is ValueCellFull!6569) mapDefault!22516)) b!483344))

(declare-fun m!464595 () Bool)

(assert (=> mapNonEmpty!22516 m!464595))

(declare-fun b_lambda!10831 () Bool)

(assert (= b_lambda!10829 (or (and start!43600 b_free!12349) b_lambda!10831)))

(check-sat (not b!483313) (not b!483305) (not bm!30997) (not bm!31022) (not b!483336) (not b!483323) (not bm!31000) (not bm!31016) (not b!483304) (not b!483311) (not b!483210) (not bm!31021) (not d!76911) (not b!483327) (not b!483207) (not b!483219) (not b!483321) (not b!483309) (not b!483307) (not d!76921) (not d!76915) (not bm!31020) (not b_next!12349) tp_is_empty!13861 (not b!483252) (not mapNonEmpty!22516) (not d!76923) (not b!483329) (not b!483238) (not bm!31019) (not b!483259) b_and!21129 (not b!483209) (not d!76917) (not b_lambda!10831) (not b!483221) (not b!483245) (not b!483261))
(check-sat b_and!21129 (not b_next!12349))
