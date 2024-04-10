; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43616 () Bool)

(assert start!43616)

(declare-fun b_free!12351 () Bool)

(declare-fun b_next!12351 () Bool)

(assert (=> start!43616 (= b_free!12351 (not b_next!12351))))

(declare-fun tp!43342 () Bool)

(declare-fun b_and!21115 () Bool)

(assert (=> start!43616 (= tp!43342 b_and!21115)))

(declare-fun b!483205 () Bool)

(declare-fun e!284362 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!483205 (= e!284362 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483206 () Bool)

(declare-fun res!287975 () Bool)

(declare-fun e!284361 () Bool)

(assert (=> b!483206 (=> res!287975 e!284361)))

(declare-datatypes ((SeekEntryResult!3575 0))(
  ( (MissingZero!3575 (index!16479 (_ BitVec 32))) (Found!3575 (index!16480 (_ BitVec 32))) (Intermediate!3575 (undefined!4387 Bool) (index!16481 (_ BitVec 32)) (x!45379 (_ BitVec 32))) (Undefined!3575) (MissingVacant!3575 (index!16482 (_ BitVec 32))) )
))
(declare-fun lt!219013 () SeekEntryResult!3575)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483206 (= res!287975 (not (inRange!0 (index!16480 lt!219013) mask!2352)))))

(declare-fun mapIsEmpty!22510 () Bool)

(declare-fun mapRes!22510 () Bool)

(assert (=> mapIsEmpty!22510 mapRes!22510))

(declare-fun b!483207 () Bool)

(declare-fun e!284358 () Bool)

(assert (=> b!483207 (= e!284358 (not e!284361))))

(declare-fun res!287973 () Bool)

(assert (=> b!483207 (=> res!287973 e!284361)))

(get-info :version)

(assert (=> b!483207 (= res!287973 (not ((_ is Found!3575) lt!219013)))))

(declare-datatypes ((array!31387 0))(
  ( (array!31388 (arr!15094 (Array (_ BitVec 32) (_ BitVec 64))) (size!15452 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31387)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31387 (_ BitVec 32)) SeekEntryResult!3575)

(assert (=> b!483207 (= lt!219013 (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352))))

(declare-fun lt!219010 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31387 (_ BitVec 32)) Bool)

(assert (=> b!483207 (arrayForallSeekEntryOrOpenFound!0 lt!219010 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14168 0))(
  ( (Unit!14169) )
))
(declare-fun lt!219012 () Unit!14168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14168)

(assert (=> b!483207 (= lt!219012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219010))))

(declare-fun arrayScanForKey!0 (array!31387 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483207 (= lt!219010 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483207 e!284362))

(declare-fun c!58065 () Bool)

(assert (=> b!483207 (= c!58065 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219011 () Unit!14168)

(declare-datatypes ((V!19555 0))(
  ( (V!19556 (val!6979 Int)) )
))
(declare-fun minValue!1458 () V!19555)

(declare-fun zeroValue!1458 () V!19555)

(declare-datatypes ((ValueCell!6570 0))(
  ( (ValueCellFull!6570 (v!9274 V!19555)) (EmptyCell!6570) )
))
(declare-datatypes ((array!31389 0))(
  ( (array!31390 (arr!15095 (Array (_ BitVec 32) ValueCell!6570)) (size!15453 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31389)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!153 (array!31387 array!31389 (_ BitVec 32) (_ BitVec 32) V!19555 V!19555 (_ BitVec 64) Int) Unit!14168)

(assert (=> b!483207 (= lt!219011 (lemmaKeyInListMapIsInArray!153 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22510 () Bool)

(declare-fun tp!43341 () Bool)

(declare-fun e!284359 () Bool)

(assert (=> mapNonEmpty!22510 (= mapRes!22510 (and tp!43341 e!284359))))

(declare-fun mapKey!22510 () (_ BitVec 32))

(declare-fun mapRest!22510 () (Array (_ BitVec 32) ValueCell!6570))

(declare-fun mapValue!22510 () ValueCell!6570)

(assert (=> mapNonEmpty!22510 (= (arr!15095 _values!1516) (store mapRest!22510 mapKey!22510 mapValue!22510))))

(declare-fun b!483208 () Bool)

(declare-fun e!284360 () Bool)

(declare-fun e!284363 () Bool)

(assert (=> b!483208 (= e!284360 (and e!284363 mapRes!22510))))

(declare-fun condMapEmpty!22510 () Bool)

(declare-fun mapDefault!22510 () ValueCell!6570)

(assert (=> b!483208 (= condMapEmpty!22510 (= (arr!15095 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6570)) mapDefault!22510)))))

(declare-fun b!483209 () Bool)

(declare-fun arrayContainsKey!0 (array!31387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483209 (= e!284362 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!287972 () Bool)

(assert (=> start!43616 (=> (not res!287972) (not e!284358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43616 (= res!287972 (validMask!0 mask!2352))))

(assert (=> start!43616 e!284358))

(assert (=> start!43616 true))

(declare-fun tp_is_empty!13863 () Bool)

(assert (=> start!43616 tp_is_empty!13863))

(declare-fun array_inv!10892 (array!31389) Bool)

(assert (=> start!43616 (and (array_inv!10892 _values!1516) e!284360)))

(assert (=> start!43616 tp!43342))

(declare-fun array_inv!10893 (array!31387) Bool)

(assert (=> start!43616 (array_inv!10893 _keys!1874)))

(declare-fun b!483210 () Bool)

(declare-fun res!287974 () Bool)

(assert (=> b!483210 (=> (not res!287974) (not e!284358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483210 (= res!287974 (validKeyInArray!0 k0!1332))))

(declare-fun b!483211 () Bool)

(declare-fun res!287977 () Bool)

(assert (=> b!483211 (=> (not res!287977) (not e!284358))))

(declare-datatypes ((tuple2!9164 0))(
  ( (tuple2!9165 (_1!4593 (_ BitVec 64)) (_2!4593 V!19555)) )
))
(declare-datatypes ((List!9243 0))(
  ( (Nil!9240) (Cons!9239 (h!10095 tuple2!9164) (t!15461 List!9243)) )
))
(declare-datatypes ((ListLongMap!8077 0))(
  ( (ListLongMap!8078 (toList!4054 List!9243)) )
))
(declare-fun contains!2670 (ListLongMap!8077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2373 (array!31387 array!31389 (_ BitVec 32) (_ BitVec 32) V!19555 V!19555 (_ BitVec 32) Int) ListLongMap!8077)

(assert (=> b!483211 (= res!287977 (contains!2670 (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!483212 () Bool)

(declare-fun res!287976 () Bool)

(assert (=> b!483212 (=> (not res!287976) (not e!284358))))

(assert (=> b!483212 (= res!287976 (and (= (size!15453 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15452 _keys!1874) (size!15453 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!483213 () Bool)

(declare-fun res!287970 () Bool)

(assert (=> b!483213 (=> (not res!287970) (not e!284358))))

(declare-datatypes ((List!9244 0))(
  ( (Nil!9241) (Cons!9240 (h!10096 (_ BitVec 64)) (t!15462 List!9244)) )
))
(declare-fun arrayNoDuplicates!0 (array!31387 (_ BitVec 32) List!9244) Bool)

(assert (=> b!483213 (= res!287970 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9241))))

(declare-fun b!483214 () Bool)

(declare-fun res!287971 () Bool)

(assert (=> b!483214 (=> (not res!287971) (not e!284358))))

(assert (=> b!483214 (= res!287971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483215 () Bool)

(assert (=> b!483215 (= e!284359 tp_is_empty!13863)))

(declare-fun b!483216 () Bool)

(assert (=> b!483216 (= e!284361 (and (bvsge (index!16480 lt!219013) #b00000000000000000000000000000000) (bvslt (index!16480 lt!219013) (size!15452 _keys!1874))))))

(declare-fun b!483217 () Bool)

(assert (=> b!483217 (= e!284363 tp_is_empty!13863)))

(assert (= (and start!43616 res!287972) b!483212))

(assert (= (and b!483212 res!287976) b!483214))

(assert (= (and b!483214 res!287971) b!483213))

(assert (= (and b!483213 res!287970) b!483211))

(assert (= (and b!483211 res!287977) b!483210))

(assert (= (and b!483210 res!287974) b!483207))

(assert (= (and b!483207 c!58065) b!483209))

(assert (= (and b!483207 (not c!58065)) b!483205))

(assert (= (and b!483207 (not res!287973)) b!483206))

(assert (= (and b!483206 (not res!287975)) b!483216))

(assert (= (and b!483208 condMapEmpty!22510) mapIsEmpty!22510))

(assert (= (and b!483208 (not condMapEmpty!22510)) mapNonEmpty!22510))

(assert (= (and mapNonEmpty!22510 ((_ is ValueCellFull!6570) mapValue!22510)) b!483215))

(assert (= (and b!483208 ((_ is ValueCellFull!6570) mapDefault!22510)) b!483217))

(assert (= start!43616 b!483208))

(declare-fun m!464235 () Bool)

(assert (=> b!483210 m!464235))

(declare-fun m!464237 () Bool)

(assert (=> b!483213 m!464237))

(declare-fun m!464239 () Bool)

(assert (=> mapNonEmpty!22510 m!464239))

(declare-fun m!464241 () Bool)

(assert (=> b!483211 m!464241))

(assert (=> b!483211 m!464241))

(declare-fun m!464243 () Bool)

(assert (=> b!483211 m!464243))

(declare-fun m!464245 () Bool)

(assert (=> b!483209 m!464245))

(declare-fun m!464247 () Bool)

(assert (=> start!43616 m!464247))

(declare-fun m!464249 () Bool)

(assert (=> start!43616 m!464249))

(declare-fun m!464251 () Bool)

(assert (=> start!43616 m!464251))

(declare-fun m!464253 () Bool)

(assert (=> b!483206 m!464253))

(declare-fun m!464255 () Bool)

(assert (=> b!483214 m!464255))

(declare-fun m!464257 () Bool)

(assert (=> b!483207 m!464257))

(declare-fun m!464259 () Bool)

(assert (=> b!483207 m!464259))

(declare-fun m!464261 () Bool)

(assert (=> b!483207 m!464261))

(declare-fun m!464263 () Bool)

(assert (=> b!483207 m!464263))

(declare-fun m!464265 () Bool)

(assert (=> b!483207 m!464265))

(check-sat (not b!483210) (not b!483207) tp_is_empty!13863 (not b_next!12351) (not start!43616) (not b!483211) b_and!21115 (not mapNonEmpty!22510) (not b!483213) (not b!483206) (not b!483209) (not b!483214))
(check-sat b_and!21115 (not b_next!12351))
(get-model)

(declare-fun b!483267 () Bool)

(declare-fun e!284394 () Bool)

(declare-fun e!284395 () Bool)

(assert (=> b!483267 (= e!284394 e!284395)))

(declare-fun c!58071 () Bool)

(assert (=> b!483267 (= c!58071 (validKeyInArray!0 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483268 () Bool)

(declare-fun e!284396 () Bool)

(declare-fun contains!2672 (List!9244 (_ BitVec 64)) Bool)

(assert (=> b!483268 (= e!284396 (contains!2672 Nil!9241 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!31011 () Bool)

(declare-fun call!31014 () Bool)

(assert (=> bm!31011 (= call!31014 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58071 (Cons!9240 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000) Nil!9241) Nil!9241)))))

(declare-fun b!483269 () Bool)

(declare-fun e!284397 () Bool)

(assert (=> b!483269 (= e!284397 e!284394)))

(declare-fun res!288010 () Bool)

(assert (=> b!483269 (=> (not res!288010) (not e!284394))))

(assert (=> b!483269 (= res!288010 (not e!284396))))

(declare-fun res!288009 () Bool)

(assert (=> b!483269 (=> (not res!288009) (not e!284396))))

(assert (=> b!483269 (= res!288009 (validKeyInArray!0 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483270 () Bool)

(assert (=> b!483270 (= e!284395 call!31014)))

(declare-fun b!483271 () Bool)

(assert (=> b!483271 (= e!284395 call!31014)))

(declare-fun d!76879 () Bool)

(declare-fun res!288008 () Bool)

(assert (=> d!76879 (=> res!288008 e!284397)))

(assert (=> d!76879 (= res!288008 (bvsge #b00000000000000000000000000000000 (size!15452 _keys!1874)))))

(assert (=> d!76879 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9241) e!284397)))

(assert (= (and d!76879 (not res!288008)) b!483269))

(assert (= (and b!483269 res!288009) b!483268))

(assert (= (and b!483269 res!288010) b!483267))

(assert (= (and b!483267 c!58071) b!483271))

(assert (= (and b!483267 (not c!58071)) b!483270))

(assert (= (or b!483271 b!483270) bm!31011))

(declare-fun m!464299 () Bool)

(assert (=> b!483267 m!464299))

(assert (=> b!483267 m!464299))

(declare-fun m!464301 () Bool)

(assert (=> b!483267 m!464301))

(assert (=> b!483268 m!464299))

(assert (=> b!483268 m!464299))

(declare-fun m!464303 () Bool)

(assert (=> b!483268 m!464303))

(assert (=> bm!31011 m!464299))

(declare-fun m!464305 () Bool)

(assert (=> bm!31011 m!464305))

(assert (=> b!483269 m!464299))

(assert (=> b!483269 m!464299))

(assert (=> b!483269 m!464301))

(assert (=> b!483213 d!76879))

(declare-fun d!76881 () Bool)

(declare-fun res!288015 () Bool)

(declare-fun e!284402 () Bool)

(assert (=> d!76881 (=> res!288015 e!284402)))

(assert (=> d!76881 (= res!288015 (= (select (arr!15094 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76881 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284402)))

(declare-fun b!483276 () Bool)

(declare-fun e!284403 () Bool)

(assert (=> b!483276 (= e!284402 e!284403)))

(declare-fun res!288016 () Bool)

(assert (=> b!483276 (=> (not res!288016) (not e!284403))))

(assert (=> b!483276 (= res!288016 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15452 _keys!1874)))))

(declare-fun b!483277 () Bool)

(assert (=> b!483277 (= e!284403 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76881 (not res!288015)) b!483276))

(assert (= (and b!483276 res!288016) b!483277))

(assert (=> d!76881 m!464299))

(declare-fun m!464307 () Bool)

(assert (=> b!483277 m!464307))

(assert (=> b!483209 d!76881))

(declare-fun b!483286 () Bool)

(declare-fun e!284412 () Bool)

(declare-fun call!31017 () Bool)

(assert (=> b!483286 (= e!284412 call!31017)))

(declare-fun d!76883 () Bool)

(declare-fun res!288022 () Bool)

(declare-fun e!284411 () Bool)

(assert (=> d!76883 (=> res!288022 e!284411)))

(assert (=> d!76883 (= res!288022 (bvsge #b00000000000000000000000000000000 (size!15452 _keys!1874)))))

(assert (=> d!76883 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284411)))

(declare-fun b!483287 () Bool)

(assert (=> b!483287 (= e!284411 e!284412)))

(declare-fun c!58074 () Bool)

(assert (=> b!483287 (= c!58074 (validKeyInArray!0 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483288 () Bool)

(declare-fun e!284410 () Bool)

(assert (=> b!483288 (= e!284410 call!31017)))

(declare-fun b!483289 () Bool)

(assert (=> b!483289 (= e!284412 e!284410)))

(declare-fun lt!219034 () (_ BitVec 64))

(assert (=> b!483289 (= lt!219034 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219032 () Unit!14168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31387 (_ BitVec 64) (_ BitVec 32)) Unit!14168)

(assert (=> b!483289 (= lt!219032 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219034 #b00000000000000000000000000000000))))

(assert (=> b!483289 (arrayContainsKey!0 _keys!1874 lt!219034 #b00000000000000000000000000000000)))

(declare-fun lt!219033 () Unit!14168)

(assert (=> b!483289 (= lt!219033 lt!219032)))

(declare-fun res!288021 () Bool)

(assert (=> b!483289 (= res!288021 (= (seekEntryOrOpen!0 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3575 #b00000000000000000000000000000000)))))

(assert (=> b!483289 (=> (not res!288021) (not e!284410))))

(declare-fun bm!31014 () Bool)

(assert (=> bm!31014 (= call!31017 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76883 (not res!288022)) b!483287))

(assert (= (and b!483287 c!58074) b!483289))

(assert (= (and b!483287 (not c!58074)) b!483286))

(assert (= (and b!483289 res!288021) b!483288))

(assert (= (or b!483288 b!483286) bm!31014))

(assert (=> b!483287 m!464299))

(assert (=> b!483287 m!464299))

(assert (=> b!483287 m!464301))

(assert (=> b!483289 m!464299))

(declare-fun m!464309 () Bool)

(assert (=> b!483289 m!464309))

(declare-fun m!464311 () Bool)

(assert (=> b!483289 m!464311))

(assert (=> b!483289 m!464299))

(declare-fun m!464313 () Bool)

(assert (=> b!483289 m!464313))

(declare-fun m!464315 () Bool)

(assert (=> bm!31014 m!464315))

(assert (=> b!483214 d!76883))

(declare-fun d!76885 () Bool)

(assert (=> d!76885 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43616 d!76885))

(declare-fun d!76887 () Bool)

(assert (=> d!76887 (= (array_inv!10892 _values!1516) (bvsge (size!15453 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43616 d!76887))

(declare-fun d!76889 () Bool)

(assert (=> d!76889 (= (array_inv!10893 _keys!1874) (bvsge (size!15452 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43616 d!76889))

(declare-fun d!76891 () Bool)

(assert (=> d!76891 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483210 d!76891))

(declare-fun d!76893 () Bool)

(assert (=> d!76893 (= (inRange!0 (index!16480 lt!219013) mask!2352) (and (bvsge (index!16480 lt!219013) #b00000000000000000000000000000000) (bvslt (index!16480 lt!219013) (bvadd mask!2352 #b00000000000000000000000000000001))))))

(assert (=> b!483206 d!76893))

(declare-fun b!483302 () Bool)

(declare-fun e!284420 () SeekEntryResult!3575)

(declare-fun lt!219041 () SeekEntryResult!3575)

(assert (=> b!483302 (= e!284420 (Found!3575 (index!16481 lt!219041)))))

(declare-fun b!483304 () Bool)

(declare-fun e!284419 () SeekEntryResult!3575)

(assert (=> b!483304 (= e!284419 Undefined!3575)))

(declare-fun e!284421 () SeekEntryResult!3575)

(declare-fun b!483305 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31387 (_ BitVec 32)) SeekEntryResult!3575)

(assert (=> b!483305 (= e!284421 (seekKeyOrZeroReturnVacant!0 (x!45379 lt!219041) (index!16481 lt!219041) (index!16481 lt!219041) k0!1332 _keys!1874 mask!2352))))

(declare-fun b!483306 () Bool)

(declare-fun c!58083 () Bool)

(declare-fun lt!219043 () (_ BitVec 64))

(assert (=> b!483306 (= c!58083 (= lt!219043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!483306 (= e!284420 e!284421)))

(declare-fun b!483307 () Bool)

(assert (=> b!483307 (= e!284419 e!284420)))

(assert (=> b!483307 (= lt!219043 (select (arr!15094 _keys!1874) (index!16481 lt!219041)))))

(declare-fun c!58081 () Bool)

(assert (=> b!483307 (= c!58081 (= lt!219043 k0!1332))))

(declare-fun d!76895 () Bool)

(declare-fun lt!219042 () SeekEntryResult!3575)

(assert (=> d!76895 (and (or ((_ is Undefined!3575) lt!219042) (not ((_ is Found!3575) lt!219042)) (and (bvsge (index!16480 lt!219042) #b00000000000000000000000000000000) (bvslt (index!16480 lt!219042) (size!15452 _keys!1874)))) (or ((_ is Undefined!3575) lt!219042) ((_ is Found!3575) lt!219042) (not ((_ is MissingZero!3575) lt!219042)) (and (bvsge (index!16479 lt!219042) #b00000000000000000000000000000000) (bvslt (index!16479 lt!219042) (size!15452 _keys!1874)))) (or ((_ is Undefined!3575) lt!219042) ((_ is Found!3575) lt!219042) ((_ is MissingZero!3575) lt!219042) (not ((_ is MissingVacant!3575) lt!219042)) (and (bvsge (index!16482 lt!219042) #b00000000000000000000000000000000) (bvslt (index!16482 lt!219042) (size!15452 _keys!1874)))) (or ((_ is Undefined!3575) lt!219042) (ite ((_ is Found!3575) lt!219042) (= (select (arr!15094 _keys!1874) (index!16480 lt!219042)) k0!1332) (ite ((_ is MissingZero!3575) lt!219042) (= (select (arr!15094 _keys!1874) (index!16479 lt!219042)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3575) lt!219042) (= (select (arr!15094 _keys!1874) (index!16482 lt!219042)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!76895 (= lt!219042 e!284419)))

(declare-fun c!58082 () Bool)

(assert (=> d!76895 (= c!58082 (and ((_ is Intermediate!3575) lt!219041) (undefined!4387 lt!219041)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31387 (_ BitVec 32)) SeekEntryResult!3575)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!76895 (= lt!219041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1332 mask!2352) k0!1332 _keys!1874 mask!2352))))

(assert (=> d!76895 (validMask!0 mask!2352)))

(assert (=> d!76895 (= (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352) lt!219042)))

(declare-fun b!483303 () Bool)

(assert (=> b!483303 (= e!284421 (MissingZero!3575 (index!16481 lt!219041)))))

(assert (= (and d!76895 c!58082) b!483304))

(assert (= (and d!76895 (not c!58082)) b!483307))

(assert (= (and b!483307 c!58081) b!483302))

(assert (= (and b!483307 (not c!58081)) b!483306))

(assert (= (and b!483306 c!58083) b!483303))

(assert (= (and b!483306 (not c!58083)) b!483305))

(declare-fun m!464317 () Bool)

(assert (=> b!483305 m!464317))

(declare-fun m!464319 () Bool)

(assert (=> b!483307 m!464319))

(declare-fun m!464321 () Bool)

(assert (=> d!76895 m!464321))

(declare-fun m!464323 () Bool)

(assert (=> d!76895 m!464323))

(assert (=> d!76895 m!464247))

(declare-fun m!464325 () Bool)

(assert (=> d!76895 m!464325))

(declare-fun m!464327 () Bool)

(assert (=> d!76895 m!464327))

(declare-fun m!464329 () Bool)

(assert (=> d!76895 m!464329))

(assert (=> d!76895 m!464325))

(assert (=> b!483207 d!76895))

(declare-fun d!76897 () Bool)

(assert (=> d!76897 (arrayForallSeekEntryOrOpenFound!0 lt!219010 _keys!1874 mask!2352)))

(declare-fun lt!219046 () Unit!14168)

(declare-fun choose!38 (array!31387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14168)

(assert (=> d!76897 (= lt!219046 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219010))))

(assert (=> d!76897 (validMask!0 mask!2352)))

(assert (=> d!76897 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219010) lt!219046)))

(declare-fun bs!15365 () Bool)

(assert (= bs!15365 d!76897))

(assert (=> bs!15365 m!464261))

(declare-fun m!464331 () Bool)

(assert (=> bs!15365 m!464331))

(assert (=> bs!15365 m!464247))

(assert (=> b!483207 d!76897))

(declare-fun b!483308 () Bool)

(declare-fun e!284424 () Bool)

(declare-fun call!31018 () Bool)

(assert (=> b!483308 (= e!284424 call!31018)))

(declare-fun d!76899 () Bool)

(declare-fun res!288024 () Bool)

(declare-fun e!284423 () Bool)

(assert (=> d!76899 (=> res!288024 e!284423)))

(assert (=> d!76899 (= res!288024 (bvsge lt!219010 (size!15452 _keys!1874)))))

(assert (=> d!76899 (= (arrayForallSeekEntryOrOpenFound!0 lt!219010 _keys!1874 mask!2352) e!284423)))

(declare-fun b!483309 () Bool)

(assert (=> b!483309 (= e!284423 e!284424)))

(declare-fun c!58084 () Bool)

(assert (=> b!483309 (= c!58084 (validKeyInArray!0 (select (arr!15094 _keys!1874) lt!219010)))))

(declare-fun b!483310 () Bool)

(declare-fun e!284422 () Bool)

(assert (=> b!483310 (= e!284422 call!31018)))

(declare-fun b!483311 () Bool)

(assert (=> b!483311 (= e!284424 e!284422)))

(declare-fun lt!219049 () (_ BitVec 64))

(assert (=> b!483311 (= lt!219049 (select (arr!15094 _keys!1874) lt!219010))))

(declare-fun lt!219047 () Unit!14168)

(assert (=> b!483311 (= lt!219047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219049 lt!219010))))

(assert (=> b!483311 (arrayContainsKey!0 _keys!1874 lt!219049 #b00000000000000000000000000000000)))

(declare-fun lt!219048 () Unit!14168)

(assert (=> b!483311 (= lt!219048 lt!219047)))

(declare-fun res!288023 () Bool)

(assert (=> b!483311 (= res!288023 (= (seekEntryOrOpen!0 (select (arr!15094 _keys!1874) lt!219010) _keys!1874 mask!2352) (Found!3575 lt!219010)))))

(assert (=> b!483311 (=> (not res!288023) (not e!284422))))

(declare-fun bm!31015 () Bool)

(assert (=> bm!31015 (= call!31018 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!219010 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76899 (not res!288024)) b!483309))

(assert (= (and b!483309 c!58084) b!483311))

(assert (= (and b!483309 (not c!58084)) b!483308))

(assert (= (and b!483311 res!288023) b!483310))

(assert (= (or b!483310 b!483308) bm!31015))

(declare-fun m!464333 () Bool)

(assert (=> b!483309 m!464333))

(assert (=> b!483309 m!464333))

(declare-fun m!464335 () Bool)

(assert (=> b!483309 m!464335))

(assert (=> b!483311 m!464333))

(declare-fun m!464337 () Bool)

(assert (=> b!483311 m!464337))

(declare-fun m!464339 () Bool)

(assert (=> b!483311 m!464339))

(assert (=> b!483311 m!464333))

(declare-fun m!464341 () Bool)

(assert (=> b!483311 m!464341))

(declare-fun m!464343 () Bool)

(assert (=> bm!31015 m!464343))

(assert (=> b!483207 d!76899))

(declare-fun d!76901 () Bool)

(declare-fun e!284427 () Bool)

(assert (=> d!76901 e!284427))

(declare-fun c!58087 () Bool)

(assert (=> d!76901 (= c!58087 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219052 () Unit!14168)

(declare-fun choose!1380 (array!31387 array!31389 (_ BitVec 32) (_ BitVec 32) V!19555 V!19555 (_ BitVec 64) Int) Unit!14168)

(assert (=> d!76901 (= lt!219052 (choose!1380 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76901 (validMask!0 mask!2352)))

(assert (=> d!76901 (= (lemmaKeyInListMapIsInArray!153 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!219052)))

(declare-fun b!483316 () Bool)

(assert (=> b!483316 (= e!284427 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483317 () Bool)

(assert (=> b!483317 (= e!284427 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76901 c!58087) b!483316))

(assert (= (and d!76901 (not c!58087)) b!483317))

(declare-fun m!464345 () Bool)

(assert (=> d!76901 m!464345))

(assert (=> d!76901 m!464247))

(assert (=> b!483316 m!464245))

(assert (=> b!483207 d!76901))

(declare-fun d!76903 () Bool)

(declare-fun lt!219055 () (_ BitVec 32))

(assert (=> d!76903 (and (or (bvslt lt!219055 #b00000000000000000000000000000000) (bvsge lt!219055 (size!15452 _keys!1874)) (and (bvsge lt!219055 #b00000000000000000000000000000000) (bvslt lt!219055 (size!15452 _keys!1874)))) (bvsge lt!219055 #b00000000000000000000000000000000) (bvslt lt!219055 (size!15452 _keys!1874)) (= (select (arr!15094 _keys!1874) lt!219055) k0!1332))))

(declare-fun e!284430 () (_ BitVec 32))

(assert (=> d!76903 (= lt!219055 e!284430)))

(declare-fun c!58090 () Bool)

(assert (=> d!76903 (= c!58090 (= (select (arr!15094 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15452 _keys!1874)) (bvslt (size!15452 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76903 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!219055)))

(declare-fun b!483322 () Bool)

(assert (=> b!483322 (= e!284430 #b00000000000000000000000000000000)))

(declare-fun b!483323 () Bool)

(assert (=> b!483323 (= e!284430 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76903 c!58090) b!483322))

(assert (= (and d!76903 (not c!58090)) b!483323))

(declare-fun m!464347 () Bool)

(assert (=> d!76903 m!464347))

(assert (=> d!76903 m!464299))

(declare-fun m!464349 () Bool)

(assert (=> b!483323 m!464349))

(assert (=> b!483207 d!76903))

(declare-fun d!76905 () Bool)

(declare-fun e!284435 () Bool)

(assert (=> d!76905 e!284435))

(declare-fun res!288027 () Bool)

(assert (=> d!76905 (=> res!288027 e!284435)))

(declare-fun lt!219067 () Bool)

(assert (=> d!76905 (= res!288027 (not lt!219067))))

(declare-fun lt!219066 () Bool)

(assert (=> d!76905 (= lt!219067 lt!219066)))

(declare-fun lt!219065 () Unit!14168)

(declare-fun e!284436 () Unit!14168)

(assert (=> d!76905 (= lt!219065 e!284436)))

(declare-fun c!58093 () Bool)

(assert (=> d!76905 (= c!58093 lt!219066)))

(declare-fun containsKey!360 (List!9243 (_ BitVec 64)) Bool)

(assert (=> d!76905 (= lt!219066 (containsKey!360 (toList!4054 (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76905 (= (contains!2670 (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!219067)))

(declare-fun b!483330 () Bool)

(declare-fun lt!219064 () Unit!14168)

(assert (=> b!483330 (= e!284436 lt!219064)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!308 (List!9243 (_ BitVec 64)) Unit!14168)

(assert (=> b!483330 (= lt!219064 (lemmaContainsKeyImpliesGetValueByKeyDefined!308 (toList!4054 (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!404 0))(
  ( (Some!403 (v!9276 V!19555)) (None!402) )
))
(declare-fun isDefined!309 (Option!404) Bool)

(declare-fun getValueByKey!398 (List!9243 (_ BitVec 64)) Option!404)

(assert (=> b!483330 (isDefined!309 (getValueByKey!398 (toList!4054 (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!483331 () Bool)

(declare-fun Unit!14170 () Unit!14168)

(assert (=> b!483331 (= e!284436 Unit!14170)))

(declare-fun b!483332 () Bool)

(assert (=> b!483332 (= e!284435 (isDefined!309 (getValueByKey!398 (toList!4054 (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76905 c!58093) b!483330))

(assert (= (and d!76905 (not c!58093)) b!483331))

(assert (= (and d!76905 (not res!288027)) b!483332))

(declare-fun m!464351 () Bool)

(assert (=> d!76905 m!464351))

(declare-fun m!464353 () Bool)

(assert (=> b!483330 m!464353))

(declare-fun m!464355 () Bool)

(assert (=> b!483330 m!464355))

(assert (=> b!483330 m!464355))

(declare-fun m!464357 () Bool)

(assert (=> b!483330 m!464357))

(assert (=> b!483332 m!464355))

(assert (=> b!483332 m!464355))

(assert (=> b!483332 m!464357))

(assert (=> b!483211 d!76905))

(declare-fun bm!31030 () Bool)

(declare-fun call!31039 () ListLongMap!8077)

(declare-fun call!31036 () ListLongMap!8077)

(assert (=> bm!31030 (= call!31039 call!31036)))

(declare-fun b!483375 () Bool)

(declare-fun e!284466 () Bool)

(declare-fun e!284468 () Bool)

(assert (=> b!483375 (= e!284466 e!284468)))

(declare-fun c!58106 () Bool)

(assert (=> b!483375 (= c!58106 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483376 () Bool)

(declare-fun e!284465 () Bool)

(assert (=> b!483376 (= e!284465 (validKeyInArray!0 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76907 () Bool)

(assert (=> d!76907 e!284466))

(declare-fun res!288052 () Bool)

(assert (=> d!76907 (=> (not res!288052) (not e!284466))))

(assert (=> d!76907 (= res!288052 (or (bvsge #b00000000000000000000000000000000 (size!15452 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15452 _keys!1874)))))))

(declare-fun lt!219119 () ListLongMap!8077)

(declare-fun lt!219126 () ListLongMap!8077)

(assert (=> d!76907 (= lt!219119 lt!219126)))

(declare-fun lt!219117 () Unit!14168)

(declare-fun e!284467 () Unit!14168)

(assert (=> d!76907 (= lt!219117 e!284467)))

(declare-fun c!58109 () Bool)

(declare-fun e!284470 () Bool)

(assert (=> d!76907 (= c!58109 e!284470)))

(declare-fun res!288051 () Bool)

(assert (=> d!76907 (=> (not res!288051) (not e!284470))))

(assert (=> d!76907 (= res!288051 (bvslt #b00000000000000000000000000000000 (size!15452 _keys!1874)))))

(declare-fun e!284463 () ListLongMap!8077)

(assert (=> d!76907 (= lt!219126 e!284463)))

(declare-fun c!58111 () Bool)

(assert (=> d!76907 (= c!58111 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76907 (validMask!0 mask!2352)))

(assert (=> d!76907 (= (getCurrentListMap!2373 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!219119)))

(declare-fun b!483377 () Bool)

(declare-fun res!288047 () Bool)

(assert (=> b!483377 (=> (not res!288047) (not e!284466))))

(declare-fun e!284474 () Bool)

(assert (=> b!483377 (= res!288047 e!284474)))

(declare-fun c!58107 () Bool)

(assert (=> b!483377 (= c!58107 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!483378 () Bool)

(declare-fun lt!219114 () Unit!14168)

(assert (=> b!483378 (= e!284467 lt!219114)))

(declare-fun lt!219130 () ListLongMap!8077)

(declare-fun getCurrentListMapNoExtraKeys!2114 (array!31387 array!31389 (_ BitVec 32) (_ BitVec 32) V!19555 V!19555 (_ BitVec 32) Int) ListLongMap!8077)

(assert (=> b!483378 (= lt!219130 (getCurrentListMapNoExtraKeys!2114 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219124 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219120 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219120 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219133 () Unit!14168)

(declare-fun addStillContains!303 (ListLongMap!8077 (_ BitVec 64) V!19555 (_ BitVec 64)) Unit!14168)

(assert (=> b!483378 (= lt!219133 (addStillContains!303 lt!219130 lt!219124 zeroValue!1458 lt!219120))))

(declare-fun +!1777 (ListLongMap!8077 tuple2!9164) ListLongMap!8077)

(assert (=> b!483378 (contains!2670 (+!1777 lt!219130 (tuple2!9165 lt!219124 zeroValue!1458)) lt!219120)))

(declare-fun lt!219113 () Unit!14168)

(assert (=> b!483378 (= lt!219113 lt!219133)))

(declare-fun lt!219121 () ListLongMap!8077)

(assert (=> b!483378 (= lt!219121 (getCurrentListMapNoExtraKeys!2114 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219125 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219125 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219131 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219131 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219123 () Unit!14168)

(declare-fun addApplyDifferent!303 (ListLongMap!8077 (_ BitVec 64) V!19555 (_ BitVec 64)) Unit!14168)

(assert (=> b!483378 (= lt!219123 (addApplyDifferent!303 lt!219121 lt!219125 minValue!1458 lt!219131))))

(declare-fun apply!345 (ListLongMap!8077 (_ BitVec 64)) V!19555)

(assert (=> b!483378 (= (apply!345 (+!1777 lt!219121 (tuple2!9165 lt!219125 minValue!1458)) lt!219131) (apply!345 lt!219121 lt!219131))))

(declare-fun lt!219116 () Unit!14168)

(assert (=> b!483378 (= lt!219116 lt!219123)))

(declare-fun lt!219112 () ListLongMap!8077)

(assert (=> b!483378 (= lt!219112 (getCurrentListMapNoExtraKeys!2114 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219122 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219132 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219132 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219128 () Unit!14168)

(assert (=> b!483378 (= lt!219128 (addApplyDifferent!303 lt!219112 lt!219122 zeroValue!1458 lt!219132))))

(assert (=> b!483378 (= (apply!345 (+!1777 lt!219112 (tuple2!9165 lt!219122 zeroValue!1458)) lt!219132) (apply!345 lt!219112 lt!219132))))

(declare-fun lt!219118 () Unit!14168)

(assert (=> b!483378 (= lt!219118 lt!219128)))

(declare-fun lt!219129 () ListLongMap!8077)

(assert (=> b!483378 (= lt!219129 (getCurrentListMapNoExtraKeys!2114 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219127 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219127 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219115 () (_ BitVec 64))

(assert (=> b!483378 (= lt!219115 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!483378 (= lt!219114 (addApplyDifferent!303 lt!219129 lt!219127 minValue!1458 lt!219115))))

(assert (=> b!483378 (= (apply!345 (+!1777 lt!219129 (tuple2!9165 lt!219127 minValue!1458)) lt!219115) (apply!345 lt!219129 lt!219115))))

(declare-fun b!483379 () Bool)

(declare-fun e!284464 () Bool)

(declare-fun e!284473 () Bool)

(assert (=> b!483379 (= e!284464 e!284473)))

(declare-fun res!288049 () Bool)

(assert (=> b!483379 (=> (not res!288049) (not e!284473))))

(assert (=> b!483379 (= res!288049 (contains!2670 lt!219119 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!483379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15452 _keys!1874)))))

(declare-fun b!483380 () Bool)

(declare-fun e!284469 () ListLongMap!8077)

(declare-fun call!31035 () ListLongMap!8077)

(assert (=> b!483380 (= e!284469 call!31035)))

(declare-fun b!483381 () Bool)

(declare-fun get!7304 (ValueCell!6570 V!19555) V!19555)

(declare-fun dynLambda!956 (Int (_ BitVec 64)) V!19555)

(assert (=> b!483381 (= e!284473 (= (apply!345 lt!219119 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)) (get!7304 (select (arr!15095 _values!1516) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15453 _values!1516)))))

(assert (=> b!483381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15452 _keys!1874)))))

(declare-fun bm!31031 () Bool)

(declare-fun call!31033 () ListLongMap!8077)

(declare-fun call!31034 () ListLongMap!8077)

(declare-fun c!58108 () Bool)

(assert (=> bm!31031 (= call!31036 (+!1777 (ite c!58111 call!31033 (ite c!58108 call!31034 call!31035)) (ite (or c!58111 c!58108) (tuple2!9165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!483382 () Bool)

(assert (=> b!483382 (= e!284463 (+!1777 call!31036 (tuple2!9165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun bm!31032 () Bool)

(assert (=> bm!31032 (= call!31035 call!31034)))

(declare-fun b!483383 () Bool)

(declare-fun e!284472 () Bool)

(assert (=> b!483383 (= e!284472 (= (apply!345 lt!219119 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!483384 () Bool)

(declare-fun c!58110 () Bool)

(assert (=> b!483384 (= c!58110 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284471 () ListLongMap!8077)

(assert (=> b!483384 (= e!284471 e!284469)))

(declare-fun b!483385 () Bool)

(assert (=> b!483385 (= e!284469 call!31039)))

(declare-fun bm!31033 () Bool)

(declare-fun call!31038 () Bool)

(assert (=> bm!31033 (= call!31038 (contains!2670 lt!219119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483386 () Bool)

(declare-fun e!284475 () Bool)

(assert (=> b!483386 (= e!284475 (= (apply!345 lt!219119 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!483387 () Bool)

(assert (=> b!483387 (= e!284474 e!284475)))

(declare-fun res!288053 () Bool)

(declare-fun call!31037 () Bool)

(assert (=> b!483387 (= res!288053 call!31037)))

(assert (=> b!483387 (=> (not res!288053) (not e!284475))))

(declare-fun b!483388 () Bool)

(declare-fun Unit!14171 () Unit!14168)

(assert (=> b!483388 (= e!284467 Unit!14171)))

(declare-fun b!483389 () Bool)

(assert (=> b!483389 (= e!284474 (not call!31037))))

(declare-fun bm!31034 () Bool)

(assert (=> bm!31034 (= call!31034 call!31033)))

(declare-fun b!483390 () Bool)

(declare-fun res!288046 () Bool)

(assert (=> b!483390 (=> (not res!288046) (not e!284466))))

(assert (=> b!483390 (= res!288046 e!284464)))

(declare-fun res!288050 () Bool)

(assert (=> b!483390 (=> res!288050 e!284464)))

(assert (=> b!483390 (= res!288050 (not e!284465))))

(declare-fun res!288048 () Bool)

(assert (=> b!483390 (=> (not res!288048) (not e!284465))))

(assert (=> b!483390 (= res!288048 (bvslt #b00000000000000000000000000000000 (size!15452 _keys!1874)))))

(declare-fun b!483391 () Bool)

(assert (=> b!483391 (= e!284463 e!284471)))

(assert (=> b!483391 (= c!58108 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483392 () Bool)

(assert (=> b!483392 (= e!284468 e!284472)))

(declare-fun res!288054 () Bool)

(assert (=> b!483392 (= res!288054 call!31038)))

(assert (=> b!483392 (=> (not res!288054) (not e!284472))))

(declare-fun bm!31035 () Bool)

(assert (=> bm!31035 (= call!31037 (contains!2670 lt!219119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483393 () Bool)

(assert (=> b!483393 (= e!284468 (not call!31038))))

(declare-fun b!483394 () Bool)

(assert (=> b!483394 (= e!284470 (validKeyInArray!0 (select (arr!15094 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!31036 () Bool)

(assert (=> bm!31036 (= call!31033 (getCurrentListMapNoExtraKeys!2114 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!483395 () Bool)

(assert (=> b!483395 (= e!284471 call!31039)))

(assert (= (and d!76907 c!58111) b!483382))

(assert (= (and d!76907 (not c!58111)) b!483391))

(assert (= (and b!483391 c!58108) b!483395))

(assert (= (and b!483391 (not c!58108)) b!483384))

(assert (= (and b!483384 c!58110) b!483385))

(assert (= (and b!483384 (not c!58110)) b!483380))

(assert (= (or b!483385 b!483380) bm!31032))

(assert (= (or b!483395 bm!31032) bm!31034))

(assert (= (or b!483395 b!483385) bm!31030))

(assert (= (or b!483382 bm!31034) bm!31036))

(assert (= (or b!483382 bm!31030) bm!31031))

(assert (= (and d!76907 res!288051) b!483394))

(assert (= (and d!76907 c!58109) b!483378))

(assert (= (and d!76907 (not c!58109)) b!483388))

(assert (= (and d!76907 res!288052) b!483390))

(assert (= (and b!483390 res!288048) b!483376))

(assert (= (and b!483390 (not res!288050)) b!483379))

(assert (= (and b!483379 res!288049) b!483381))

(assert (= (and b!483390 res!288046) b!483377))

(assert (= (and b!483377 c!58107) b!483387))

(assert (= (and b!483377 (not c!58107)) b!483389))

(assert (= (and b!483387 res!288053) b!483386))

(assert (= (or b!483387 b!483389) bm!31035))

(assert (= (and b!483377 res!288047) b!483375))

(assert (= (and b!483375 c!58106) b!483392))

(assert (= (and b!483375 (not c!58106)) b!483393))

(assert (= (and b!483392 res!288054) b!483383))

(assert (= (or b!483392 b!483393) bm!31033))

(declare-fun b_lambda!10815 () Bool)

(assert (=> (not b_lambda!10815) (not b!483381)))

(declare-fun t!15465 () Bool)

(declare-fun tb!4171 () Bool)

(assert (=> (and start!43616 (= defaultEntry!1519 defaultEntry!1519) t!15465) tb!4171))

(declare-fun result!7781 () Bool)

(assert (=> tb!4171 (= result!7781 tp_is_empty!13863)))

(assert (=> b!483381 t!15465))

(declare-fun b_and!21119 () Bool)

(assert (= b_and!21115 (and (=> t!15465 result!7781) b_and!21119)))

(declare-fun m!464359 () Bool)

(assert (=> bm!31036 m!464359))

(assert (=> b!483394 m!464299))

(assert (=> b!483394 m!464299))

(assert (=> b!483394 m!464301))

(declare-fun m!464361 () Bool)

(assert (=> bm!31035 m!464361))

(declare-fun m!464363 () Bool)

(assert (=> b!483386 m!464363))

(assert (=> b!483376 m!464299))

(assert (=> b!483376 m!464299))

(assert (=> b!483376 m!464301))

(declare-fun m!464365 () Bool)

(assert (=> bm!31033 m!464365))

(assert (=> d!76907 m!464247))

(declare-fun m!464367 () Bool)

(assert (=> bm!31031 m!464367))

(declare-fun m!464369 () Bool)

(assert (=> b!483378 m!464369))

(declare-fun m!464371 () Bool)

(assert (=> b!483378 m!464371))

(declare-fun m!464373 () Bool)

(assert (=> b!483378 m!464373))

(declare-fun m!464375 () Bool)

(assert (=> b!483378 m!464375))

(declare-fun m!464377 () Bool)

(assert (=> b!483378 m!464377))

(declare-fun m!464379 () Bool)

(assert (=> b!483378 m!464379))

(declare-fun m!464381 () Bool)

(assert (=> b!483378 m!464381))

(declare-fun m!464383 () Bool)

(assert (=> b!483378 m!464383))

(declare-fun m!464385 () Bool)

(assert (=> b!483378 m!464385))

(declare-fun m!464387 () Bool)

(assert (=> b!483378 m!464387))

(assert (=> b!483378 m!464359))

(assert (=> b!483378 m!464299))

(assert (=> b!483378 m!464377))

(declare-fun m!464389 () Bool)

(assert (=> b!483378 m!464389))

(declare-fun m!464391 () Bool)

(assert (=> b!483378 m!464391))

(assert (=> b!483378 m!464373))

(declare-fun m!464393 () Bool)

(assert (=> b!483378 m!464393))

(assert (=> b!483378 m!464381))

(declare-fun m!464395 () Bool)

(assert (=> b!483378 m!464395))

(assert (=> b!483378 m!464385))

(declare-fun m!464397 () Bool)

(assert (=> b!483378 m!464397))

(declare-fun m!464399 () Bool)

(assert (=> b!483382 m!464399))

(declare-fun m!464401 () Bool)

(assert (=> b!483381 m!464401))

(declare-fun m!464403 () Bool)

(assert (=> b!483381 m!464403))

(assert (=> b!483381 m!464401))

(declare-fun m!464405 () Bool)

(assert (=> b!483381 m!464405))

(assert (=> b!483381 m!464299))

(assert (=> b!483381 m!464403))

(assert (=> b!483381 m!464299))

(declare-fun m!464407 () Bool)

(assert (=> b!483381 m!464407))

(assert (=> b!483379 m!464299))

(assert (=> b!483379 m!464299))

(declare-fun m!464409 () Bool)

(assert (=> b!483379 m!464409))

(declare-fun m!464411 () Bool)

(assert (=> b!483383 m!464411))

(assert (=> b!483211 d!76907))

(declare-fun b!483404 () Bool)

(declare-fun e!284480 () Bool)

(assert (=> b!483404 (= e!284480 tp_is_empty!13863)))

(declare-fun mapNonEmpty!22516 () Bool)

(declare-fun mapRes!22516 () Bool)

(declare-fun tp!43351 () Bool)

(assert (=> mapNonEmpty!22516 (= mapRes!22516 (and tp!43351 e!284480))))

(declare-fun mapKey!22516 () (_ BitVec 32))

(declare-fun mapRest!22516 () (Array (_ BitVec 32) ValueCell!6570))

(declare-fun mapValue!22516 () ValueCell!6570)

(assert (=> mapNonEmpty!22516 (= mapRest!22510 (store mapRest!22516 mapKey!22516 mapValue!22516))))

(declare-fun condMapEmpty!22516 () Bool)

(declare-fun mapDefault!22516 () ValueCell!6570)

(assert (=> mapNonEmpty!22510 (= condMapEmpty!22516 (= mapRest!22510 ((as const (Array (_ BitVec 32) ValueCell!6570)) mapDefault!22516)))))

(declare-fun e!284481 () Bool)

(assert (=> mapNonEmpty!22510 (= tp!43341 (and e!284481 mapRes!22516))))

(declare-fun b!483405 () Bool)

(assert (=> b!483405 (= e!284481 tp_is_empty!13863)))

(declare-fun mapIsEmpty!22516 () Bool)

(assert (=> mapIsEmpty!22516 mapRes!22516))

(assert (= (and mapNonEmpty!22510 condMapEmpty!22516) mapIsEmpty!22516))

(assert (= (and mapNonEmpty!22510 (not condMapEmpty!22516)) mapNonEmpty!22516))

(assert (= (and mapNonEmpty!22516 ((_ is ValueCellFull!6570) mapValue!22516)) b!483404))

(assert (= (and mapNonEmpty!22510 ((_ is ValueCellFull!6570) mapDefault!22516)) b!483405))

(declare-fun m!464413 () Bool)

(assert (=> mapNonEmpty!22516 m!464413))

(declare-fun b_lambda!10817 () Bool)

(assert (= b_lambda!10815 (or (and start!43616 b_free!12351) b_lambda!10817)))

(check-sat (not b!483267) (not b!483316) (not b!483378) (not b!483287) (not d!76897) (not b!483381) tp_is_empty!13863 (not bm!31036) (not b!483309) (not bm!31015) (not b!483382) (not d!76907) (not b!483379) (not b!483268) (not b!483332) (not bm!31035) (not b!483383) (not b!483376) (not d!76895) (not b!483305) (not bm!31011) (not bm!31014) (not b!483289) (not d!76901) (not bm!31033) (not mapNonEmpty!22516) b_and!21119 (not b!483277) (not b!483269) (not bm!31031) (not b!483386) (not b!483330) (not d!76905) (not b_next!12351) (not b_lambda!10817) (not b!483323) (not b!483394) (not b!483311))
(check-sat b_and!21119 (not b_next!12351))
