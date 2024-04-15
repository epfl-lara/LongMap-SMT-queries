; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111262 () Bool)

(assert start!111262)

(declare-fun mapIsEmpty!55283 () Bool)

(declare-fun mapRes!55283 () Bool)

(assert (=> mapIsEmpty!55283 mapRes!55283))

(declare-fun mapNonEmpty!55283 () Bool)

(declare-fun tp!105390 () Bool)

(declare-fun e!751305 () Bool)

(assert (=> mapNonEmpty!55283 (= mapRes!55283 (and tp!105390 e!751305))))

(declare-datatypes ((V!52785 0))(
  ( (V!52786 (val!17955 Int)) )
))
(declare-datatypes ((ValueCell!16982 0))(
  ( (ValueCellFull!16982 (v!20583 V!52785)) (EmptyCell!16982) )
))
(declare-datatypes ((array!88395 0))(
  ( (array!88396 (arr!42674 (Array (_ BitVec 32) ValueCell!16982)) (size!43226 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88395)

(declare-fun mapKey!55283 () (_ BitVec 32))

(declare-fun mapValue!55283 () ValueCell!16982)

(declare-fun mapRest!55283 () (Array (_ BitVec 32) ValueCell!16982))

(assert (=> mapNonEmpty!55283 (= (arr!42674 _values!1337) (store mapRest!55283 mapKey!55283 mapValue!55283))))

(declare-fun b!1316833 () Bool)

(declare-fun e!751307 () Bool)

(declare-fun tp_is_empty!35761 () Bool)

(assert (=> b!1316833 (= e!751307 tp_is_empty!35761)))

(declare-fun b!1316834 () Bool)

(declare-fun res!874069 () Bool)

(declare-fun e!751306 () Bool)

(assert (=> b!1316834 (=> (not res!874069) (not e!751306))))

(declare-datatypes ((array!88397 0))(
  ( (array!88398 (arr!42675 (Array (_ BitVec 32) (_ BitVec 64))) (size!43227 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88397)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316834 (= res!874069 (and (= (size!43226 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43227 _keys!1609) (size!43226 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1316835 () Bool)

(assert (=> b!1316835 (= e!751305 tp_is_empty!35761)))

(declare-fun b!1316836 () Bool)

(declare-datatypes ((List!30350 0))(
  ( (Nil!30347) (Cons!30346 (h!31555 (_ BitVec 64)) (t!43950 List!30350)) )
))
(declare-fun noDuplicate!2083 (List!30350) Bool)

(assert (=> b!1316836 (= e!751306 (not (noDuplicate!2083 Nil!30347)))))

(declare-fun b!1316837 () Bool)

(declare-fun e!751304 () Bool)

(assert (=> b!1316837 (= e!751304 (and e!751307 mapRes!55283))))

(declare-fun condMapEmpty!55283 () Bool)

(declare-fun mapDefault!55283 () ValueCell!16982)

(assert (=> b!1316837 (= condMapEmpty!55283 (= (arr!42674 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16982)) mapDefault!55283)))))

(declare-fun b!1316838 () Bool)

(declare-fun res!874066 () Bool)

(assert (=> b!1316838 (=> (not res!874066) (not e!751306))))

(assert (=> b!1316838 (= res!874066 (and (bvsle #b00000000000000000000000000000000 (size!43227 _keys!1609)) (bvslt (size!43227 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun res!874067 () Bool)

(assert (=> start!111262 (=> (not res!874067) (not e!751306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111262 (= res!874067 (validMask!0 mask!2019))))

(assert (=> start!111262 e!751306))

(assert (=> start!111262 true))

(declare-fun array_inv!32411 (array!88395) Bool)

(assert (=> start!111262 (and (array_inv!32411 _values!1337) e!751304)))

(declare-fun array_inv!32412 (array!88397) Bool)

(assert (=> start!111262 (array_inv!32412 _keys!1609)))

(declare-fun b!1316839 () Bool)

(declare-fun res!874068 () Bool)

(assert (=> b!1316839 (=> (not res!874068) (not e!751306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88397 (_ BitVec 32)) Bool)

(assert (=> b!1316839 (= res!874068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111262 res!874067) b!1316834))

(assert (= (and b!1316834 res!874069) b!1316839))

(assert (= (and b!1316839 res!874068) b!1316838))

(assert (= (and b!1316838 res!874066) b!1316836))

(assert (= (and b!1316837 condMapEmpty!55283) mapIsEmpty!55283))

(assert (= (and b!1316837 (not condMapEmpty!55283)) mapNonEmpty!55283))

(get-info :version)

(assert (= (and mapNonEmpty!55283 ((_ is ValueCellFull!16982) mapValue!55283)) b!1316835))

(assert (= (and b!1316837 ((_ is ValueCellFull!16982) mapDefault!55283)) b!1316833))

(assert (= start!111262 b!1316837))

(declare-fun m!1204433 () Bool)

(assert (=> mapNonEmpty!55283 m!1204433))

(declare-fun m!1204435 () Bool)

(assert (=> b!1316836 m!1204435))

(declare-fun m!1204437 () Bool)

(assert (=> start!111262 m!1204437))

(declare-fun m!1204439 () Bool)

(assert (=> start!111262 m!1204439))

(declare-fun m!1204441 () Bool)

(assert (=> start!111262 m!1204441))

(declare-fun m!1204443 () Bool)

(assert (=> b!1316839 m!1204443))

(check-sat tp_is_empty!35761 (not b!1316839) (not start!111262) (not b!1316836) (not mapNonEmpty!55283))
(check-sat)
(get-model)

(declare-fun b!1316890 () Bool)

(declare-fun e!751346 () Bool)

(declare-fun e!751345 () Bool)

(assert (=> b!1316890 (= e!751346 e!751345)))

(declare-fun lt!586110 () (_ BitVec 64))

(assert (=> b!1316890 (= lt!586110 (select (arr!42675 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43247 0))(
  ( (Unit!43248) )
))
(declare-fun lt!586112 () Unit!43247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88397 (_ BitVec 64) (_ BitVec 32)) Unit!43247)

(assert (=> b!1316890 (= lt!586112 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586110 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316890 (arrayContainsKey!0 _keys!1609 lt!586110 #b00000000000000000000000000000000)))

(declare-fun lt!586111 () Unit!43247)

(assert (=> b!1316890 (= lt!586111 lt!586112)))

(declare-fun res!874098 () Bool)

(declare-datatypes ((SeekEntryResult!10037 0))(
  ( (MissingZero!10037 (index!42519 (_ BitVec 32))) (Found!10037 (index!42520 (_ BitVec 32))) (Intermediate!10037 (undefined!10849 Bool) (index!42521 (_ BitVec 32)) (x!117077 (_ BitVec 32))) (Undefined!10037) (MissingVacant!10037 (index!42522 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88397 (_ BitVec 32)) SeekEntryResult!10037)

(assert (=> b!1316890 (= res!874098 (= (seekEntryOrOpen!0 (select (arr!42675 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10037 #b00000000000000000000000000000000)))))

(assert (=> b!1316890 (=> (not res!874098) (not e!751345))))

(declare-fun b!1316891 () Bool)

(declare-fun call!64662 () Bool)

(assert (=> b!1316891 (= e!751346 call!64662)))

(declare-fun b!1316892 () Bool)

(assert (=> b!1316892 (= e!751345 call!64662)))

(declare-fun b!1316893 () Bool)

(declare-fun e!751344 () Bool)

(assert (=> b!1316893 (= e!751344 e!751346)))

(declare-fun c!125619 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316893 (= c!125619 (validKeyInArray!0 (select (arr!42675 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64659 () Bool)

(assert (=> bm!64659 (= call!64662 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!142583 () Bool)

(declare-fun res!874099 () Bool)

(assert (=> d!142583 (=> res!874099 e!751344)))

(assert (=> d!142583 (= res!874099 (bvsge #b00000000000000000000000000000000 (size!43227 _keys!1609)))))

(assert (=> d!142583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751344)))

(assert (= (and d!142583 (not res!874099)) b!1316893))

(assert (= (and b!1316893 c!125619) b!1316890))

(assert (= (and b!1316893 (not c!125619)) b!1316891))

(assert (= (and b!1316890 res!874098) b!1316892))

(assert (= (or b!1316892 b!1316891) bm!64659))

(declare-fun m!1204469 () Bool)

(assert (=> b!1316890 m!1204469))

(declare-fun m!1204471 () Bool)

(assert (=> b!1316890 m!1204471))

(declare-fun m!1204473 () Bool)

(assert (=> b!1316890 m!1204473))

(assert (=> b!1316890 m!1204469))

(declare-fun m!1204475 () Bool)

(assert (=> b!1316890 m!1204475))

(assert (=> b!1316893 m!1204469))

(assert (=> b!1316893 m!1204469))

(declare-fun m!1204477 () Bool)

(assert (=> b!1316893 m!1204477))

(declare-fun m!1204479 () Bool)

(assert (=> bm!64659 m!1204479))

(assert (=> b!1316839 d!142583))

(declare-fun d!142585 () Bool)

(assert (=> d!142585 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111262 d!142585))

(declare-fun d!142587 () Bool)

(assert (=> d!142587 (= (array_inv!32411 _values!1337) (bvsge (size!43226 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111262 d!142587))

(declare-fun d!142589 () Bool)

(assert (=> d!142589 (= (array_inv!32412 _keys!1609) (bvsge (size!43227 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111262 d!142589))

(declare-fun d!142591 () Bool)

(declare-fun res!874104 () Bool)

(declare-fun e!751351 () Bool)

(assert (=> d!142591 (=> res!874104 e!751351)))

(assert (=> d!142591 (= res!874104 ((_ is Nil!30347) Nil!30347))))

(assert (=> d!142591 (= (noDuplicate!2083 Nil!30347) e!751351)))

(declare-fun b!1316898 () Bool)

(declare-fun e!751352 () Bool)

(assert (=> b!1316898 (= e!751351 e!751352)))

(declare-fun res!874105 () Bool)

(assert (=> b!1316898 (=> (not res!874105) (not e!751352))))

(declare-fun contains!8540 (List!30350 (_ BitVec 64)) Bool)

(assert (=> b!1316898 (= res!874105 (not (contains!8540 (t!43950 Nil!30347) (h!31555 Nil!30347))))))

(declare-fun b!1316899 () Bool)

(assert (=> b!1316899 (= e!751352 (noDuplicate!2083 (t!43950 Nil!30347)))))

(assert (= (and d!142591 (not res!874104)) b!1316898))

(assert (= (and b!1316898 res!874105) b!1316899))

(declare-fun m!1204481 () Bool)

(assert (=> b!1316898 m!1204481))

(declare-fun m!1204483 () Bool)

(assert (=> b!1316899 m!1204483))

(assert (=> b!1316836 d!142591))

(declare-fun mapIsEmpty!55292 () Bool)

(declare-fun mapRes!55292 () Bool)

(assert (=> mapIsEmpty!55292 mapRes!55292))

(declare-fun b!1316906 () Bool)

(declare-fun e!751357 () Bool)

(assert (=> b!1316906 (= e!751357 tp_is_empty!35761)))

(declare-fun mapNonEmpty!55292 () Bool)

(declare-fun tp!105399 () Bool)

(assert (=> mapNonEmpty!55292 (= mapRes!55292 (and tp!105399 e!751357))))

(declare-fun mapRest!55292 () (Array (_ BitVec 32) ValueCell!16982))

(declare-fun mapKey!55292 () (_ BitVec 32))

(declare-fun mapValue!55292 () ValueCell!16982)

(assert (=> mapNonEmpty!55292 (= mapRest!55283 (store mapRest!55292 mapKey!55292 mapValue!55292))))

(declare-fun condMapEmpty!55292 () Bool)

(declare-fun mapDefault!55292 () ValueCell!16982)

(assert (=> mapNonEmpty!55283 (= condMapEmpty!55292 (= mapRest!55283 ((as const (Array (_ BitVec 32) ValueCell!16982)) mapDefault!55292)))))

(declare-fun e!751358 () Bool)

(assert (=> mapNonEmpty!55283 (= tp!105390 (and e!751358 mapRes!55292))))

(declare-fun b!1316907 () Bool)

(assert (=> b!1316907 (= e!751358 tp_is_empty!35761)))

(assert (= (and mapNonEmpty!55283 condMapEmpty!55292) mapIsEmpty!55292))

(assert (= (and mapNonEmpty!55283 (not condMapEmpty!55292)) mapNonEmpty!55292))

(assert (= (and mapNonEmpty!55292 ((_ is ValueCellFull!16982) mapValue!55292)) b!1316906))

(assert (= (and mapNonEmpty!55283 ((_ is ValueCellFull!16982) mapDefault!55292)) b!1316907))

(declare-fun m!1204485 () Bool)

(assert (=> mapNonEmpty!55292 m!1204485))

(check-sat tp_is_empty!35761 (not bm!64659) (not b!1316890) (not b!1316898) (not b!1316899) (not mapNonEmpty!55292) (not b!1316893))
(check-sat)
