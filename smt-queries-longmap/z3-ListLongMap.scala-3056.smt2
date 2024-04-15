; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43152 () Bool)

(assert start!43152)

(declare-fun b!478262 () Bool)

(declare-fun e!281192 () Bool)

(declare-fun e!281190 () Bool)

(assert (=> b!478262 (= e!281192 e!281190)))

(declare-fun res!285371 () Bool)

(assert (=> b!478262 (=> res!285371 e!281190)))

(declare-datatypes ((List!9105 0))(
  ( (Nil!9102) (Cons!9101 (h!9957 (_ BitVec 64)) (t!15302 List!9105)) )
))
(declare-fun contains!2572 (List!9105 (_ BitVec 64)) Bool)

(assert (=> b!478262 (= res!285371 (contains!2572 Nil!9102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!22042 () Bool)

(declare-fun mapRes!22042 () Bool)

(assert (=> mapIsEmpty!22042 mapRes!22042))

(declare-fun b!478264 () Bool)

(declare-fun e!281189 () Bool)

(declare-fun tp_is_empty!13567 () Bool)

(assert (=> b!478264 (= e!281189 tp_is_empty!13567)))

(declare-fun b!478265 () Bool)

(declare-fun res!285372 () Bool)

(assert (=> b!478265 (=> (not res!285372) (not e!281192))))

(declare-datatypes ((array!30801 0))(
  ( (array!30802 (arr!14809 (Array (_ BitVec 32) (_ BitVec 64))) (size!15168 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30801)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30801 (_ BitVec 32)) Bool)

(assert (=> b!478265 (= res!285372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478266 () Bool)

(declare-fun e!281193 () Bool)

(assert (=> b!478266 (= e!281193 tp_is_empty!13567)))

(declare-fun b!478267 () Bool)

(declare-fun res!285376 () Bool)

(assert (=> b!478267 (=> (not res!285376) (not e!281192))))

(declare-fun noDuplicate!209 (List!9105) Bool)

(assert (=> b!478267 (= res!285376 (noDuplicate!209 Nil!9102))))

(declare-fun b!478268 () Bool)

(assert (=> b!478268 (= e!281190 (contains!2572 Nil!9102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!22042 () Bool)

(declare-fun tp!42517 () Bool)

(assert (=> mapNonEmpty!22042 (= mapRes!22042 (and tp!42517 e!281189))))

(declare-datatypes ((V!19161 0))(
  ( (V!19162 (val!6831 Int)) )
))
(declare-datatypes ((ValueCell!6422 0))(
  ( (ValueCellFull!6422 (v!9113 V!19161)) (EmptyCell!6422) )
))
(declare-fun mapRest!22042 () (Array (_ BitVec 32) ValueCell!6422))

(declare-fun mapValue!22042 () ValueCell!6422)

(declare-datatypes ((array!30803 0))(
  ( (array!30804 (arr!14810 (Array (_ BitVec 32) ValueCell!6422)) (size!15169 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30803)

(declare-fun mapKey!22042 () (_ BitVec 32))

(assert (=> mapNonEmpty!22042 (= (arr!14810 _values!1516) (store mapRest!22042 mapKey!22042 mapValue!22042))))

(declare-fun res!285374 () Bool)

(assert (=> start!43152 (=> (not res!285374) (not e!281192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43152 (= res!285374 (validMask!0 mask!2352))))

(assert (=> start!43152 e!281192))

(assert (=> start!43152 true))

(declare-fun e!281194 () Bool)

(declare-fun array_inv!10772 (array!30803) Bool)

(assert (=> start!43152 (and (array_inv!10772 _values!1516) e!281194)))

(declare-fun array_inv!10773 (array!30801) Bool)

(assert (=> start!43152 (array_inv!10773 _keys!1874)))

(declare-fun b!478263 () Bool)

(declare-fun res!285375 () Bool)

(assert (=> b!478263 (=> (not res!285375) (not e!281192))))

(assert (=> b!478263 (= res!285375 (and (bvsle #b00000000000000000000000000000000 (size!15168 _keys!1874)) (bvslt (size!15168 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478269 () Bool)

(assert (=> b!478269 (= e!281194 (and e!281193 mapRes!22042))))

(declare-fun condMapEmpty!22042 () Bool)

(declare-fun mapDefault!22042 () ValueCell!6422)

(assert (=> b!478269 (= condMapEmpty!22042 (= (arr!14810 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6422)) mapDefault!22042)))))

(declare-fun b!478270 () Bool)

(declare-fun res!285373 () Bool)

(assert (=> b!478270 (=> (not res!285373) (not e!281192))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478270 (= res!285373 (and (= (size!15169 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15168 _keys!1874) (size!15169 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43152 res!285374) b!478270))

(assert (= (and b!478270 res!285373) b!478265))

(assert (= (and b!478265 res!285372) b!478263))

(assert (= (and b!478263 res!285375) b!478267))

(assert (= (and b!478267 res!285376) b!478262))

(assert (= (and b!478262 (not res!285371)) b!478268))

(assert (= (and b!478269 condMapEmpty!22042) mapIsEmpty!22042))

(assert (= (and b!478269 (not condMapEmpty!22042)) mapNonEmpty!22042))

(get-info :version)

(assert (= (and mapNonEmpty!22042 ((_ is ValueCellFull!6422) mapValue!22042)) b!478264))

(assert (= (and b!478269 ((_ is ValueCellFull!6422) mapDefault!22042)) b!478266))

(assert (= start!43152 b!478269))

(declare-fun m!460031 () Bool)

(assert (=> b!478262 m!460031))

(declare-fun m!460033 () Bool)

(assert (=> b!478268 m!460033))

(declare-fun m!460035 () Bool)

(assert (=> b!478265 m!460035))

(declare-fun m!460037 () Bool)

(assert (=> mapNonEmpty!22042 m!460037))

(declare-fun m!460039 () Bool)

(assert (=> b!478267 m!460039))

(declare-fun m!460041 () Bool)

(assert (=> start!43152 m!460041))

(declare-fun m!460043 () Bool)

(assert (=> start!43152 m!460043))

(declare-fun m!460045 () Bool)

(assert (=> start!43152 m!460045))

(check-sat (not b!478268) (not mapNonEmpty!22042) (not start!43152) (not b!478262) (not b!478265) (not b!478267) tp_is_empty!13567)
(check-sat)
(get-model)

(declare-fun d!76417 () Bool)

(declare-fun lt!217497 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!213 (List!9105) (InoxSet (_ BitVec 64)))

(assert (=> d!76417 (= lt!217497 (select (content!213 Nil!9102) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!281236 () Bool)

(assert (=> d!76417 (= lt!217497 e!281236)))

(declare-fun res!285418 () Bool)

(assert (=> d!76417 (=> (not res!285418) (not e!281236))))

(assert (=> d!76417 (= res!285418 ((_ is Cons!9101) Nil!9102))))

(assert (=> d!76417 (= (contains!2572 Nil!9102 #b0000000000000000000000000000000000000000000000000000000000000000) lt!217497)))

(declare-fun b!478329 () Bool)

(declare-fun e!281235 () Bool)

(assert (=> b!478329 (= e!281236 e!281235)))

(declare-fun res!285417 () Bool)

(assert (=> b!478329 (=> res!285417 e!281235)))

(assert (=> b!478329 (= res!285417 (= (h!9957 Nil!9102) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478330 () Bool)

(assert (=> b!478330 (= e!281235 (contains!2572 (t!15302 Nil!9102) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76417 res!285418) b!478329))

(assert (= (and b!478329 (not res!285417)) b!478330))

(declare-fun m!460079 () Bool)

(assert (=> d!76417 m!460079))

(declare-fun m!460081 () Bool)

(assert (=> d!76417 m!460081))

(declare-fun m!460083 () Bool)

(assert (=> b!478330 m!460083))

(assert (=> b!478262 d!76417))

(declare-fun d!76419 () Bool)

(declare-fun lt!217498 () Bool)

(assert (=> d!76419 (= lt!217498 (select (content!213 Nil!9102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!281238 () Bool)

(assert (=> d!76419 (= lt!217498 e!281238)))

(declare-fun res!285420 () Bool)

(assert (=> d!76419 (=> (not res!285420) (not e!281238))))

(assert (=> d!76419 (= res!285420 ((_ is Cons!9101) Nil!9102))))

(assert (=> d!76419 (= (contains!2572 Nil!9102 #b1000000000000000000000000000000000000000000000000000000000000000) lt!217498)))

(declare-fun b!478331 () Bool)

(declare-fun e!281237 () Bool)

(assert (=> b!478331 (= e!281238 e!281237)))

(declare-fun res!285419 () Bool)

(assert (=> b!478331 (=> res!285419 e!281237)))

(assert (=> b!478331 (= res!285419 (= (h!9957 Nil!9102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478332 () Bool)

(assert (=> b!478332 (= e!281237 (contains!2572 (t!15302 Nil!9102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76419 res!285420) b!478331))

(assert (= (and b!478331 (not res!285419)) b!478332))

(assert (=> d!76419 m!460079))

(declare-fun m!460085 () Bool)

(assert (=> d!76419 m!460085))

(declare-fun m!460087 () Bool)

(assert (=> b!478332 m!460087))

(assert (=> b!478268 d!76419))

(declare-fun d!76421 () Bool)

(declare-fun res!285425 () Bool)

(declare-fun e!281243 () Bool)

(assert (=> d!76421 (=> res!285425 e!281243)))

(assert (=> d!76421 (= res!285425 ((_ is Nil!9102) Nil!9102))))

(assert (=> d!76421 (= (noDuplicate!209 Nil!9102) e!281243)))

(declare-fun b!478337 () Bool)

(declare-fun e!281244 () Bool)

(assert (=> b!478337 (= e!281243 e!281244)))

(declare-fun res!285426 () Bool)

(assert (=> b!478337 (=> (not res!285426) (not e!281244))))

(assert (=> b!478337 (= res!285426 (not (contains!2572 (t!15302 Nil!9102) (h!9957 Nil!9102))))))

(declare-fun b!478338 () Bool)

(assert (=> b!478338 (= e!281244 (noDuplicate!209 (t!15302 Nil!9102)))))

(assert (= (and d!76421 (not res!285425)) b!478337))

(assert (= (and b!478337 res!285426) b!478338))

(declare-fun m!460089 () Bool)

(assert (=> b!478337 m!460089))

(declare-fun m!460091 () Bool)

(assert (=> b!478338 m!460091))

(assert (=> b!478267 d!76421))

(declare-fun b!478347 () Bool)

(declare-fun e!281252 () Bool)

(declare-fun call!30816 () Bool)

(assert (=> b!478347 (= e!281252 call!30816)))

(declare-fun b!478348 () Bool)

(declare-fun e!281251 () Bool)

(assert (=> b!478348 (= e!281251 call!30816)))

(declare-fun d!76423 () Bool)

(declare-fun res!285431 () Bool)

(declare-fun e!281253 () Bool)

(assert (=> d!76423 (=> res!285431 e!281253)))

(assert (=> d!76423 (= res!285431 (bvsge #b00000000000000000000000000000000 (size!15168 _keys!1874)))))

(assert (=> d!76423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281253)))

(declare-fun b!478349 () Bool)

(assert (=> b!478349 (= e!281253 e!281251)))

(declare-fun c!57599 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478349 (= c!57599 (validKeyInArray!0 (select (arr!14809 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30813 () Bool)

(assert (=> bm!30813 (= call!30816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478350 () Bool)

(assert (=> b!478350 (= e!281251 e!281252)))

(declare-fun lt!217506 () (_ BitVec 64))

(assert (=> b!478350 (= lt!217506 (select (arr!14809 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14044 0))(
  ( (Unit!14045) )
))
(declare-fun lt!217507 () Unit!14044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30801 (_ BitVec 64) (_ BitVec 32)) Unit!14044)

(assert (=> b!478350 (= lt!217507 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217506 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478350 (arrayContainsKey!0 _keys!1874 lt!217506 #b00000000000000000000000000000000)))

(declare-fun lt!217505 () Unit!14044)

(assert (=> b!478350 (= lt!217505 lt!217507)))

(declare-fun res!285432 () Bool)

(declare-datatypes ((SeekEntryResult!3561 0))(
  ( (MissingZero!3561 (index!16423 (_ BitVec 32))) (Found!3561 (index!16424 (_ BitVec 32))) (Intermediate!3561 (undefined!4373 Bool) (index!16425 (_ BitVec 32)) (x!44906 (_ BitVec 32))) (Undefined!3561) (MissingVacant!3561 (index!16426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30801 (_ BitVec 32)) SeekEntryResult!3561)

(assert (=> b!478350 (= res!285432 (= (seekEntryOrOpen!0 (select (arr!14809 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3561 #b00000000000000000000000000000000)))))

(assert (=> b!478350 (=> (not res!285432) (not e!281252))))

(assert (= (and d!76423 (not res!285431)) b!478349))

(assert (= (and b!478349 c!57599) b!478350))

(assert (= (and b!478349 (not c!57599)) b!478348))

(assert (= (and b!478350 res!285432) b!478347))

(assert (= (or b!478347 b!478348) bm!30813))

(declare-fun m!460093 () Bool)

(assert (=> b!478349 m!460093))

(assert (=> b!478349 m!460093))

(declare-fun m!460095 () Bool)

(assert (=> b!478349 m!460095))

(declare-fun m!460097 () Bool)

(assert (=> bm!30813 m!460097))

(assert (=> b!478350 m!460093))

(declare-fun m!460099 () Bool)

(assert (=> b!478350 m!460099))

(declare-fun m!460101 () Bool)

(assert (=> b!478350 m!460101))

(assert (=> b!478350 m!460093))

(declare-fun m!460103 () Bool)

(assert (=> b!478350 m!460103))

(assert (=> b!478265 d!76423))

(declare-fun d!76425 () Bool)

(assert (=> d!76425 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43152 d!76425))

(declare-fun d!76427 () Bool)

(assert (=> d!76427 (= (array_inv!10772 _values!1516) (bvsge (size!15169 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43152 d!76427))

(declare-fun d!76429 () Bool)

(assert (=> d!76429 (= (array_inv!10773 _keys!1874) (bvsge (size!15168 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43152 d!76429))

(declare-fun b!478358 () Bool)

(declare-fun e!281259 () Bool)

(assert (=> b!478358 (= e!281259 tp_is_empty!13567)))

(declare-fun mapNonEmpty!22051 () Bool)

(declare-fun mapRes!22051 () Bool)

(declare-fun tp!42526 () Bool)

(declare-fun e!281258 () Bool)

(assert (=> mapNonEmpty!22051 (= mapRes!22051 (and tp!42526 e!281258))))

(declare-fun mapRest!22051 () (Array (_ BitVec 32) ValueCell!6422))

(declare-fun mapKey!22051 () (_ BitVec 32))

(declare-fun mapValue!22051 () ValueCell!6422)

(assert (=> mapNonEmpty!22051 (= mapRest!22042 (store mapRest!22051 mapKey!22051 mapValue!22051))))

(declare-fun condMapEmpty!22051 () Bool)

(declare-fun mapDefault!22051 () ValueCell!6422)

(assert (=> mapNonEmpty!22042 (= condMapEmpty!22051 (= mapRest!22042 ((as const (Array (_ BitVec 32) ValueCell!6422)) mapDefault!22051)))))

(assert (=> mapNonEmpty!22042 (= tp!42517 (and e!281259 mapRes!22051))))

(declare-fun mapIsEmpty!22051 () Bool)

(assert (=> mapIsEmpty!22051 mapRes!22051))

(declare-fun b!478357 () Bool)

(assert (=> b!478357 (= e!281258 tp_is_empty!13567)))

(assert (= (and mapNonEmpty!22042 condMapEmpty!22051) mapIsEmpty!22051))

(assert (= (and mapNonEmpty!22042 (not condMapEmpty!22051)) mapNonEmpty!22051))

(assert (= (and mapNonEmpty!22051 ((_ is ValueCellFull!6422) mapValue!22051)) b!478357))

(assert (= (and mapNonEmpty!22042 ((_ is ValueCellFull!6422) mapDefault!22051)) b!478358))

(declare-fun m!460105 () Bool)

(assert (=> mapNonEmpty!22051 m!460105))

(check-sat (not b!478349) (not bm!30813) (not mapNonEmpty!22051) (not d!76419) (not b!478338) (not b!478330) (not b!478337) (not d!76417) (not b!478332) (not b!478350) tp_is_empty!13567)
(check-sat)
