; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110402 () Bool)

(assert start!110402)

(declare-fun b!1306335 () Bool)

(declare-fun res!867242 () Bool)

(declare-fun e!745246 () Bool)

(assert (=> b!1306335 (=> (not res!867242) (not e!745246))))

(declare-datatypes ((array!86992 0))(
  ( (array!86993 (arr!41978 (Array (_ BitVec 32) (_ BitVec 64))) (size!42528 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86992)

(assert (=> b!1306335 (= res!867242 (and (bvsle #b00000000000000000000000000000000 (size!42528 _keys!1628)) (bvslt (size!42528 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun b!1306336 () Bool)

(declare-fun e!745244 () Bool)

(declare-fun tp_is_empty!34989 () Bool)

(assert (=> b!1306336 (= e!745244 tp_is_empty!34989)))

(declare-fun b!1306337 () Bool)

(declare-datatypes ((List!29786 0))(
  ( (Nil!29783) (Cons!29782 (h!30991 (_ BitVec 64)) (t!43392 List!29786)) )
))
(declare-fun noDuplicate!2057 (List!29786) Bool)

(assert (=> b!1306337 (= e!745246 (not (noDuplicate!2057 Nil!29783)))))

(declare-fun b!1306338 () Bool)

(declare-fun e!745248 () Bool)

(declare-fun mapRes!54106 () Bool)

(assert (=> b!1306338 (= e!745248 (and e!745244 mapRes!54106))))

(declare-fun condMapEmpty!54106 () Bool)

(declare-datatypes ((V!51755 0))(
  ( (V!51756 (val!17569 Int)) )
))
(declare-datatypes ((ValueCell!16596 0))(
  ( (ValueCellFull!16596 (v!20195 V!51755)) (EmptyCell!16596) )
))
(declare-datatypes ((array!86994 0))(
  ( (array!86995 (arr!41979 (Array (_ BitVec 32) ValueCell!16596)) (size!42529 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86994)

(declare-fun mapDefault!54106 () ValueCell!16596)

(assert (=> b!1306338 (= condMapEmpty!54106 (= (arr!41979 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16596)) mapDefault!54106)))))

(declare-fun mapNonEmpty!54106 () Bool)

(declare-fun tp!103186 () Bool)

(declare-fun e!745247 () Bool)

(assert (=> mapNonEmpty!54106 (= mapRes!54106 (and tp!103186 e!745247))))

(declare-fun mapRest!54106 () (Array (_ BitVec 32) ValueCell!16596))

(declare-fun mapKey!54106 () (_ BitVec 32))

(declare-fun mapValue!54106 () ValueCell!16596)

(assert (=> mapNonEmpty!54106 (= (arr!41979 _values!1354) (store mapRest!54106 mapKey!54106 mapValue!54106))))

(declare-fun mapIsEmpty!54106 () Bool)

(assert (=> mapIsEmpty!54106 mapRes!54106))

(declare-fun res!867244 () Bool)

(assert (=> start!110402 (=> (not res!867244) (not e!745246))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110402 (= res!867244 (validMask!0 mask!2040))))

(assert (=> start!110402 e!745246))

(assert (=> start!110402 true))

(declare-fun array_inv!31735 (array!86994) Bool)

(assert (=> start!110402 (and (array_inv!31735 _values!1354) e!745248)))

(declare-fun array_inv!31736 (array!86992) Bool)

(assert (=> start!110402 (array_inv!31736 _keys!1628)))

(declare-fun b!1306339 () Bool)

(assert (=> b!1306339 (= e!745247 tp_is_empty!34989)))

(declare-fun b!1306340 () Bool)

(declare-fun res!867243 () Bool)

(assert (=> b!1306340 (=> (not res!867243) (not e!745246))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306340 (= res!867243 (and (= (size!42529 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42528 _keys!1628) (size!42529 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306341 () Bool)

(declare-fun res!867241 () Bool)

(assert (=> b!1306341 (=> (not res!867241) (not e!745246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86992 (_ BitVec 32)) Bool)

(assert (=> b!1306341 (= res!867241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110402 res!867244) b!1306340))

(assert (= (and b!1306340 res!867243) b!1306341))

(assert (= (and b!1306341 res!867241) b!1306335))

(assert (= (and b!1306335 res!867242) b!1306337))

(assert (= (and b!1306338 condMapEmpty!54106) mapIsEmpty!54106))

(assert (= (and b!1306338 (not condMapEmpty!54106)) mapNonEmpty!54106))

(get-info :version)

(assert (= (and mapNonEmpty!54106 ((_ is ValueCellFull!16596) mapValue!54106)) b!1306339))

(assert (= (and b!1306338 ((_ is ValueCellFull!16596) mapDefault!54106)) b!1306336))

(assert (= start!110402 b!1306338))

(declare-fun m!1197407 () Bool)

(assert (=> b!1306337 m!1197407))

(declare-fun m!1197409 () Bool)

(assert (=> mapNonEmpty!54106 m!1197409))

(declare-fun m!1197411 () Bool)

(assert (=> start!110402 m!1197411))

(declare-fun m!1197413 () Bool)

(assert (=> start!110402 m!1197413))

(declare-fun m!1197415 () Bool)

(assert (=> start!110402 m!1197415))

(declare-fun m!1197417 () Bool)

(assert (=> b!1306341 m!1197417))

(check-sat tp_is_empty!34989 (not b!1306337) (not mapNonEmpty!54106) (not start!110402) (not b!1306341))
(check-sat)
(get-model)

(declare-fun d!142243 () Bool)

(declare-fun res!867261 () Bool)

(declare-fun e!745268 () Bool)

(assert (=> d!142243 (=> res!867261 e!745268)))

(assert (=> d!142243 (= res!867261 ((_ is Nil!29783) Nil!29783))))

(assert (=> d!142243 (= (noDuplicate!2057 Nil!29783) e!745268)))

(declare-fun b!1306367 () Bool)

(declare-fun e!745269 () Bool)

(assert (=> b!1306367 (= e!745268 e!745269)))

(declare-fun res!867262 () Bool)

(assert (=> b!1306367 (=> (not res!867262) (not e!745269))))

(declare-fun contains!8323 (List!29786 (_ BitVec 64)) Bool)

(assert (=> b!1306367 (= res!867262 (not (contains!8323 (t!43392 Nil!29783) (h!30991 Nil!29783))))))

(declare-fun b!1306368 () Bool)

(assert (=> b!1306368 (= e!745269 (noDuplicate!2057 (t!43392 Nil!29783)))))

(assert (= (and d!142243 (not res!867261)) b!1306367))

(assert (= (and b!1306367 res!867262) b!1306368))

(declare-fun m!1197431 () Bool)

(assert (=> b!1306367 m!1197431))

(declare-fun m!1197433 () Bool)

(assert (=> b!1306368 m!1197433))

(assert (=> b!1306337 d!142243))

(declare-fun d!142245 () Bool)

(assert (=> d!142245 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110402 d!142245))

(declare-fun d!142247 () Bool)

(assert (=> d!142247 (= (array_inv!31735 _values!1354) (bvsge (size!42529 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110402 d!142247))

(declare-fun d!142249 () Bool)

(assert (=> d!142249 (= (array_inv!31736 _keys!1628) (bvsge (size!42528 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110402 d!142249))

(declare-fun b!1306377 () Bool)

(declare-fun e!745276 () Bool)

(declare-fun call!64629 () Bool)

(assert (=> b!1306377 (= e!745276 call!64629)))

(declare-fun bm!64626 () Bool)

(assert (=> bm!64626 (= call!64629 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1306378 () Bool)

(declare-fun e!745278 () Bool)

(assert (=> b!1306378 (= e!745278 call!64629)))

(declare-fun b!1306379 () Bool)

(declare-fun e!745277 () Bool)

(assert (=> b!1306379 (= e!745277 e!745276)))

(declare-fun c!125544 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306379 (= c!125544 (validKeyInArray!0 (select (arr!41978 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1306380 () Bool)

(assert (=> b!1306380 (= e!745276 e!745278)))

(declare-fun lt!584913 () (_ BitVec 64))

(assert (=> b!1306380 (= lt!584913 (select (arr!41978 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43270 0))(
  ( (Unit!43271) )
))
(declare-fun lt!584915 () Unit!43270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86992 (_ BitVec 64) (_ BitVec 32)) Unit!43270)

(assert (=> b!1306380 (= lt!584915 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584913 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306380 (arrayContainsKey!0 _keys!1628 lt!584913 #b00000000000000000000000000000000)))

(declare-fun lt!584914 () Unit!43270)

(assert (=> b!1306380 (= lt!584914 lt!584915)))

(declare-fun res!867268 () Bool)

(declare-datatypes ((SeekEntryResult!10033 0))(
  ( (MissingZero!10033 (index!42503 (_ BitVec 32))) (Found!10033 (index!42504 (_ BitVec 32))) (Intermediate!10033 (undefined!10845 Bool) (index!42505 (_ BitVec 32)) (x!116019 (_ BitVec 32))) (Undefined!10033) (MissingVacant!10033 (index!42506 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86992 (_ BitVec 32)) SeekEntryResult!10033)

(assert (=> b!1306380 (= res!867268 (= (seekEntryOrOpen!0 (select (arr!41978 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10033 #b00000000000000000000000000000000)))))

(assert (=> b!1306380 (=> (not res!867268) (not e!745278))))

(declare-fun d!142251 () Bool)

(declare-fun res!867267 () Bool)

(assert (=> d!142251 (=> res!867267 e!745277)))

(assert (=> d!142251 (= res!867267 (bvsge #b00000000000000000000000000000000 (size!42528 _keys!1628)))))

(assert (=> d!142251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745277)))

(assert (= (and d!142251 (not res!867267)) b!1306379))

(assert (= (and b!1306379 c!125544) b!1306380))

(assert (= (and b!1306379 (not c!125544)) b!1306377))

(assert (= (and b!1306380 res!867268) b!1306378))

(assert (= (or b!1306378 b!1306377) bm!64626))

(declare-fun m!1197435 () Bool)

(assert (=> bm!64626 m!1197435))

(declare-fun m!1197437 () Bool)

(assert (=> b!1306379 m!1197437))

(assert (=> b!1306379 m!1197437))

(declare-fun m!1197439 () Bool)

(assert (=> b!1306379 m!1197439))

(assert (=> b!1306380 m!1197437))

(declare-fun m!1197441 () Bool)

(assert (=> b!1306380 m!1197441))

(declare-fun m!1197443 () Bool)

(assert (=> b!1306380 m!1197443))

(assert (=> b!1306380 m!1197437))

(declare-fun m!1197445 () Bool)

(assert (=> b!1306380 m!1197445))

(assert (=> b!1306341 d!142251))

(declare-fun mapNonEmpty!54112 () Bool)

(declare-fun mapRes!54112 () Bool)

(declare-fun tp!103192 () Bool)

(declare-fun e!745283 () Bool)

(assert (=> mapNonEmpty!54112 (= mapRes!54112 (and tp!103192 e!745283))))

(declare-fun mapValue!54112 () ValueCell!16596)

(declare-fun mapKey!54112 () (_ BitVec 32))

(declare-fun mapRest!54112 () (Array (_ BitVec 32) ValueCell!16596))

(assert (=> mapNonEmpty!54112 (= mapRest!54106 (store mapRest!54112 mapKey!54112 mapValue!54112))))

(declare-fun b!1306388 () Bool)

(declare-fun e!745284 () Bool)

(assert (=> b!1306388 (= e!745284 tp_is_empty!34989)))

(declare-fun mapIsEmpty!54112 () Bool)

(assert (=> mapIsEmpty!54112 mapRes!54112))

(declare-fun condMapEmpty!54112 () Bool)

(declare-fun mapDefault!54112 () ValueCell!16596)

(assert (=> mapNonEmpty!54106 (= condMapEmpty!54112 (= mapRest!54106 ((as const (Array (_ BitVec 32) ValueCell!16596)) mapDefault!54112)))))

(assert (=> mapNonEmpty!54106 (= tp!103186 (and e!745284 mapRes!54112))))

(declare-fun b!1306387 () Bool)

(assert (=> b!1306387 (= e!745283 tp_is_empty!34989)))

(assert (= (and mapNonEmpty!54106 condMapEmpty!54112) mapIsEmpty!54112))

(assert (= (and mapNonEmpty!54106 (not condMapEmpty!54112)) mapNonEmpty!54112))

(assert (= (and mapNonEmpty!54112 ((_ is ValueCellFull!16596) mapValue!54112)) b!1306387))

(assert (= (and mapNonEmpty!54106 ((_ is ValueCellFull!16596) mapDefault!54112)) b!1306388))

(declare-fun m!1197447 () Bool)

(assert (=> mapNonEmpty!54112 m!1197447))

(check-sat tp_is_empty!34989 (not mapNonEmpty!54112) (not b!1306368) (not b!1306380) (not b!1306379) (not b!1306367) (not bm!64626))
(check-sat)
