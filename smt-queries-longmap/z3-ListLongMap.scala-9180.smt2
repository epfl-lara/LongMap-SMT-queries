; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110418 () Bool)

(assert start!110418)

(declare-fun mapNonEmpty!54118 () Bool)

(declare-fun mapRes!54118 () Bool)

(declare-fun tp!103198 () Bool)

(declare-fun e!745316 () Bool)

(assert (=> mapNonEmpty!54118 (= mapRes!54118 (and tp!103198 e!745316))))

(declare-datatypes ((V!51763 0))(
  ( (V!51764 (val!17572 Int)) )
))
(declare-datatypes ((ValueCell!16599 0))(
  ( (ValueCellFull!16599 (v!20198 V!51763)) (EmptyCell!16599) )
))
(declare-fun mapRest!54118 () (Array (_ BitVec 32) ValueCell!16599))

(declare-fun mapValue!54118 () ValueCell!16599)

(declare-datatypes ((array!87004 0))(
  ( (array!87005 (arr!41983 (Array (_ BitVec 32) ValueCell!16599)) (size!42533 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87004)

(declare-fun mapKey!54118 () (_ BitVec 32))

(assert (=> mapNonEmpty!54118 (= (arr!41983 _values!1354) (store mapRest!54118 mapKey!54118 mapValue!54118))))

(declare-fun b!1306434 () Bool)

(declare-fun tp_is_empty!34995 () Bool)

(assert (=> b!1306434 (= e!745316 tp_is_empty!34995)))

(declare-fun b!1306435 () Bool)

(declare-fun res!867302 () Bool)

(declare-fun e!745318 () Bool)

(assert (=> b!1306435 (=> (not res!867302) (not e!745318))))

(declare-datatypes ((array!87006 0))(
  ( (array!87007 (arr!41984 (Array (_ BitVec 32) (_ BitVec 64))) (size!42534 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87006)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87006 (_ BitVec 32)) Bool)

(assert (=> b!1306435 (= res!867302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306436 () Bool)

(declare-fun e!745320 () Bool)

(declare-fun e!745315 () Bool)

(assert (=> b!1306436 (= e!745320 (and e!745315 mapRes!54118))))

(declare-fun condMapEmpty!54118 () Bool)

(declare-fun mapDefault!54118 () ValueCell!16599)

(assert (=> b!1306436 (= condMapEmpty!54118 (= (arr!41983 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16599)) mapDefault!54118)))))

(declare-fun b!1306437 () Bool)

(assert (=> b!1306437 (= e!745315 tp_is_empty!34995)))

(declare-fun res!867304 () Bool)

(assert (=> start!110418 (=> (not res!867304) (not e!745318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110418 (= res!867304 (validMask!0 mask!2040))))

(assert (=> start!110418 e!745318))

(assert (=> start!110418 true))

(declare-fun array_inv!31739 (array!87004) Bool)

(assert (=> start!110418 (and (array_inv!31739 _values!1354) e!745320)))

(declare-fun array_inv!31740 (array!87006) Bool)

(assert (=> start!110418 (array_inv!31740 _keys!1628)))

(declare-fun b!1306438 () Bool)

(declare-fun res!867301 () Bool)

(assert (=> b!1306438 (=> (not res!867301) (not e!745318))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306438 (= res!867301 (and (= (size!42533 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42534 _keys!1628) (size!42533 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306439 () Bool)

(declare-fun res!867303 () Bool)

(assert (=> b!1306439 (=> (not res!867303) (not e!745318))))

(assert (=> b!1306439 (= res!867303 (and (bvsle #b00000000000000000000000000000000 (size!42534 _keys!1628)) (bvslt (size!42534 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun b!1306440 () Bool)

(declare-fun res!867300 () Bool)

(assert (=> b!1306440 (=> (not res!867300) (not e!745318))))

(declare-datatypes ((List!29789 0))(
  ( (Nil!29786) (Cons!29785 (h!30994 (_ BitVec 64)) (t!43395 List!29789)) )
))
(declare-fun noDuplicate!2060 (List!29789) Bool)

(assert (=> b!1306440 (= res!867300 (noDuplicate!2060 Nil!29786))))

(declare-fun mapIsEmpty!54118 () Bool)

(assert (=> mapIsEmpty!54118 mapRes!54118))

(declare-fun b!1306441 () Bool)

(declare-fun e!745319 () Bool)

(declare-fun contains!8325 (List!29789 (_ BitVec 64)) Bool)

(assert (=> b!1306441 (= e!745319 (contains!8325 Nil!29786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306442 () Bool)

(assert (=> b!1306442 (= e!745318 e!745319)))

(declare-fun res!867299 () Bool)

(assert (=> b!1306442 (=> res!867299 e!745319)))

(assert (=> b!1306442 (= res!867299 (contains!8325 Nil!29786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!110418 res!867304) b!1306438))

(assert (= (and b!1306438 res!867301) b!1306435))

(assert (= (and b!1306435 res!867302) b!1306439))

(assert (= (and b!1306439 res!867303) b!1306440))

(assert (= (and b!1306440 res!867300) b!1306442))

(assert (= (and b!1306442 (not res!867299)) b!1306441))

(assert (= (and b!1306436 condMapEmpty!54118) mapIsEmpty!54118))

(assert (= (and b!1306436 (not condMapEmpty!54118)) mapNonEmpty!54118))

(get-info :version)

(assert (= (and mapNonEmpty!54118 ((_ is ValueCellFull!16599) mapValue!54118)) b!1306434))

(assert (= (and b!1306436 ((_ is ValueCellFull!16599) mapDefault!54118)) b!1306437))

(assert (= start!110418 b!1306436))

(declare-fun m!1197465 () Bool)

(assert (=> b!1306442 m!1197465))

(declare-fun m!1197467 () Bool)

(assert (=> b!1306435 m!1197467))

(declare-fun m!1197469 () Bool)

(assert (=> b!1306441 m!1197469))

(declare-fun m!1197471 () Bool)

(assert (=> start!110418 m!1197471))

(declare-fun m!1197473 () Bool)

(assert (=> start!110418 m!1197473))

(declare-fun m!1197475 () Bool)

(assert (=> start!110418 m!1197475))

(declare-fun m!1197477 () Bool)

(assert (=> mapNonEmpty!54118 m!1197477))

(declare-fun m!1197479 () Bool)

(assert (=> b!1306440 m!1197479))

(check-sat tp_is_empty!34995 (not b!1306435) (not b!1306441) (not mapNonEmpty!54118) (not start!110418) (not b!1306442) (not b!1306440))
(check-sat)
(get-model)

(declare-fun d!142255 () Bool)

(declare-fun lt!584918 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!650 (List!29789) (InoxSet (_ BitVec 64)))

(assert (=> d!142255 (= lt!584918 (select (content!650 Nil!29786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!745344 () Bool)

(assert (=> d!142255 (= lt!584918 e!745344)))

(declare-fun res!867327 () Bool)

(assert (=> d!142255 (=> (not res!867327) (not e!745344))))

(assert (=> d!142255 (= res!867327 ((_ is Cons!29785) Nil!29786))))

(assert (=> d!142255 (= (contains!8325 Nil!29786 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584918)))

(declare-fun b!1306474 () Bool)

(declare-fun e!745343 () Bool)

(assert (=> b!1306474 (= e!745344 e!745343)))

(declare-fun res!867328 () Bool)

(assert (=> b!1306474 (=> res!867328 e!745343)))

(assert (=> b!1306474 (= res!867328 (= (h!30994 Nil!29786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306475 () Bool)

(assert (=> b!1306475 (= e!745343 (contains!8325 (t!43395 Nil!29786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142255 res!867327) b!1306474))

(assert (= (and b!1306474 (not res!867328)) b!1306475))

(declare-fun m!1197497 () Bool)

(assert (=> d!142255 m!1197497))

(declare-fun m!1197499 () Bool)

(assert (=> d!142255 m!1197499))

(declare-fun m!1197501 () Bool)

(assert (=> b!1306475 m!1197501))

(assert (=> b!1306442 d!142255))

(declare-fun d!142257 () Bool)

(declare-fun lt!584919 () Bool)

(assert (=> d!142257 (= lt!584919 (select (content!650 Nil!29786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!745346 () Bool)

(assert (=> d!142257 (= lt!584919 e!745346)))

(declare-fun res!867329 () Bool)

(assert (=> d!142257 (=> (not res!867329) (not e!745346))))

(assert (=> d!142257 (= res!867329 ((_ is Cons!29785) Nil!29786))))

(assert (=> d!142257 (= (contains!8325 Nil!29786 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584919)))

(declare-fun b!1306476 () Bool)

(declare-fun e!745345 () Bool)

(assert (=> b!1306476 (= e!745346 e!745345)))

(declare-fun res!867330 () Bool)

(assert (=> b!1306476 (=> res!867330 e!745345)))

(assert (=> b!1306476 (= res!867330 (= (h!30994 Nil!29786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306477 () Bool)

(assert (=> b!1306477 (= e!745345 (contains!8325 (t!43395 Nil!29786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142257 res!867329) b!1306476))

(assert (= (and b!1306476 (not res!867330)) b!1306477))

(assert (=> d!142257 m!1197497))

(declare-fun m!1197503 () Bool)

(assert (=> d!142257 m!1197503))

(declare-fun m!1197505 () Bool)

(assert (=> b!1306477 m!1197505))

(assert (=> b!1306441 d!142257))

(declare-fun d!142259 () Bool)

(assert (=> d!142259 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110418 d!142259))

(declare-fun d!142261 () Bool)

(assert (=> d!142261 (= (array_inv!31739 _values!1354) (bvsge (size!42533 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110418 d!142261))

(declare-fun d!142263 () Bool)

(assert (=> d!142263 (= (array_inv!31740 _keys!1628) (bvsge (size!42534 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110418 d!142263))

(declare-fun d!142265 () Bool)

(declare-fun res!867335 () Bool)

(declare-fun e!745351 () Bool)

(assert (=> d!142265 (=> res!867335 e!745351)))

(assert (=> d!142265 (= res!867335 ((_ is Nil!29786) Nil!29786))))

(assert (=> d!142265 (= (noDuplicate!2060 Nil!29786) e!745351)))

(declare-fun b!1306482 () Bool)

(declare-fun e!745352 () Bool)

(assert (=> b!1306482 (= e!745351 e!745352)))

(declare-fun res!867336 () Bool)

(assert (=> b!1306482 (=> (not res!867336) (not e!745352))))

(assert (=> b!1306482 (= res!867336 (not (contains!8325 (t!43395 Nil!29786) (h!30994 Nil!29786))))))

(declare-fun b!1306483 () Bool)

(assert (=> b!1306483 (= e!745352 (noDuplicate!2060 (t!43395 Nil!29786)))))

(assert (= (and d!142265 (not res!867335)) b!1306482))

(assert (= (and b!1306482 res!867336) b!1306483))

(declare-fun m!1197507 () Bool)

(assert (=> b!1306482 m!1197507))

(declare-fun m!1197509 () Bool)

(assert (=> b!1306483 m!1197509))

(assert (=> b!1306440 d!142265))

(declare-fun b!1306492 () Bool)

(declare-fun e!745359 () Bool)

(declare-fun call!64632 () Bool)

(assert (=> b!1306492 (= e!745359 call!64632)))

(declare-fun d!142267 () Bool)

(declare-fun res!867341 () Bool)

(declare-fun e!745360 () Bool)

(assert (=> d!142267 (=> res!867341 e!745360)))

(assert (=> d!142267 (= res!867341 (bvsge #b00000000000000000000000000000000 (size!42534 _keys!1628)))))

(assert (=> d!142267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745360)))

(declare-fun b!1306493 () Bool)

(declare-fun e!745361 () Bool)

(assert (=> b!1306493 (= e!745361 call!64632)))

(declare-fun bm!64629 () Bool)

(assert (=> bm!64629 (= call!64632 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1306494 () Bool)

(assert (=> b!1306494 (= e!745360 e!745359)))

(declare-fun c!125547 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306494 (= c!125547 (validKeyInArray!0 (select (arr!41984 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1306495 () Bool)

(assert (=> b!1306495 (= e!745359 e!745361)))

(declare-fun lt!584928 () (_ BitVec 64))

(assert (=> b!1306495 (= lt!584928 (select (arr!41984 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43272 0))(
  ( (Unit!43273) )
))
(declare-fun lt!584926 () Unit!43272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!87006 (_ BitVec 64) (_ BitVec 32)) Unit!43272)

(assert (=> b!1306495 (= lt!584926 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584928 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!87006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306495 (arrayContainsKey!0 _keys!1628 lt!584928 #b00000000000000000000000000000000)))

(declare-fun lt!584927 () Unit!43272)

(assert (=> b!1306495 (= lt!584927 lt!584926)))

(declare-fun res!867342 () Bool)

(declare-datatypes ((SeekEntryResult!10034 0))(
  ( (MissingZero!10034 (index!42507 (_ BitVec 32))) (Found!10034 (index!42508 (_ BitVec 32))) (Intermediate!10034 (undefined!10846 Bool) (index!42509 (_ BitVec 32)) (x!116030 (_ BitVec 32))) (Undefined!10034) (MissingVacant!10034 (index!42510 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!87006 (_ BitVec 32)) SeekEntryResult!10034)

(assert (=> b!1306495 (= res!867342 (= (seekEntryOrOpen!0 (select (arr!41984 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10034 #b00000000000000000000000000000000)))))

(assert (=> b!1306495 (=> (not res!867342) (not e!745361))))

(assert (= (and d!142267 (not res!867341)) b!1306494))

(assert (= (and b!1306494 c!125547) b!1306495))

(assert (= (and b!1306494 (not c!125547)) b!1306492))

(assert (= (and b!1306495 res!867342) b!1306493))

(assert (= (or b!1306493 b!1306492) bm!64629))

(declare-fun m!1197511 () Bool)

(assert (=> bm!64629 m!1197511))

(declare-fun m!1197513 () Bool)

(assert (=> b!1306494 m!1197513))

(assert (=> b!1306494 m!1197513))

(declare-fun m!1197515 () Bool)

(assert (=> b!1306494 m!1197515))

(assert (=> b!1306495 m!1197513))

(declare-fun m!1197517 () Bool)

(assert (=> b!1306495 m!1197517))

(declare-fun m!1197519 () Bool)

(assert (=> b!1306495 m!1197519))

(assert (=> b!1306495 m!1197513))

(declare-fun m!1197521 () Bool)

(assert (=> b!1306495 m!1197521))

(assert (=> b!1306435 d!142267))

(declare-fun mapIsEmpty!54124 () Bool)

(declare-fun mapRes!54124 () Bool)

(assert (=> mapIsEmpty!54124 mapRes!54124))

(declare-fun b!1306503 () Bool)

(declare-fun e!745366 () Bool)

(assert (=> b!1306503 (= e!745366 tp_is_empty!34995)))

(declare-fun b!1306502 () Bool)

(declare-fun e!745367 () Bool)

(assert (=> b!1306502 (= e!745367 tp_is_empty!34995)))

(declare-fun condMapEmpty!54124 () Bool)

(declare-fun mapDefault!54124 () ValueCell!16599)

(assert (=> mapNonEmpty!54118 (= condMapEmpty!54124 (= mapRest!54118 ((as const (Array (_ BitVec 32) ValueCell!16599)) mapDefault!54124)))))

(assert (=> mapNonEmpty!54118 (= tp!103198 (and e!745366 mapRes!54124))))

(declare-fun mapNonEmpty!54124 () Bool)

(declare-fun tp!103204 () Bool)

(assert (=> mapNonEmpty!54124 (= mapRes!54124 (and tp!103204 e!745367))))

(declare-fun mapRest!54124 () (Array (_ BitVec 32) ValueCell!16599))

(declare-fun mapValue!54124 () ValueCell!16599)

(declare-fun mapKey!54124 () (_ BitVec 32))

(assert (=> mapNonEmpty!54124 (= mapRest!54118 (store mapRest!54124 mapKey!54124 mapValue!54124))))

(assert (= (and mapNonEmpty!54118 condMapEmpty!54124) mapIsEmpty!54124))

(assert (= (and mapNonEmpty!54118 (not condMapEmpty!54124)) mapNonEmpty!54124))

(assert (= (and mapNonEmpty!54124 ((_ is ValueCellFull!16599) mapValue!54124)) b!1306502))

(assert (= (and mapNonEmpty!54118 ((_ is ValueCellFull!16599) mapDefault!54124)) b!1306503))

(declare-fun m!1197523 () Bool)

(assert (=> mapNonEmpty!54124 m!1197523))

(check-sat (not b!1306477) (not mapNonEmpty!54124) tp_is_empty!34995 (not d!142255) (not b!1306494) (not b!1306483) (not b!1306482) (not b!1306495) (not bm!64629) (not d!142257) (not b!1306475))
(check-sat)
