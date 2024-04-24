; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111502 () Bool)

(assert start!111502)

(declare-fun b!1318295 () Bool)

(declare-fun e!752252 () Bool)

(declare-fun e!752248 () Bool)

(declare-fun mapRes!55295 () Bool)

(assert (=> b!1318295 (= e!752252 (and e!752248 mapRes!55295))))

(declare-fun condMapEmpty!55295 () Bool)

(declare-datatypes ((V!52793 0))(
  ( (V!52794 (val!17958 Int)) )
))
(declare-datatypes ((ValueCell!16985 0))(
  ( (ValueCellFull!16985 (v!20582 V!52793)) (EmptyCell!16985) )
))
(declare-datatypes ((array!88555 0))(
  ( (array!88556 (arr!42748 (Array (_ BitVec 32) ValueCell!16985)) (size!43299 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88555)

(declare-fun mapDefault!55295 () ValueCell!16985)

(assert (=> b!1318295 (= condMapEmpty!55295 (= (arr!42748 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16985)) mapDefault!55295)))))

(declare-fun b!1318296 () Bool)

(declare-fun e!752251 () Bool)

(declare-datatypes ((List!30324 0))(
  ( (Nil!30321) (Cons!30320 (h!31538 (_ BitVec 64)) (t!43924 List!30324)) )
))
(declare-fun contains!8602 (List!30324 (_ BitVec 64)) Bool)

(assert (=> b!1318296 (= e!752251 (contains!8602 Nil!30321 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!874668 () Bool)

(declare-fun e!752250 () Bool)

(assert (=> start!111502 (=> (not res!874668) (not e!752250))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111502 (= res!874668 (validMask!0 mask!2019))))

(assert (=> start!111502 e!752250))

(assert (=> start!111502 true))

(declare-fun array_inv!32555 (array!88555) Bool)

(assert (=> start!111502 (and (array_inv!32555 _values!1337) e!752252)))

(declare-datatypes ((array!88557 0))(
  ( (array!88558 (arr!42749 (Array (_ BitVec 32) (_ BitVec 64))) (size!43300 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88557)

(declare-fun array_inv!32556 (array!88557) Bool)

(assert (=> start!111502 (array_inv!32556 _keys!1609)))

(declare-fun mapIsEmpty!55295 () Bool)

(assert (=> mapIsEmpty!55295 mapRes!55295))

(declare-fun b!1318297 () Bool)

(declare-fun res!874667 () Bool)

(assert (=> b!1318297 (=> (not res!874667) (not e!752250))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318297 (= res!874667 (and (= (size!43299 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43300 _keys!1609) (size!43299 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318298 () Bool)

(declare-fun res!874669 () Bool)

(assert (=> b!1318298 (=> (not res!874669) (not e!752250))))

(declare-fun noDuplicate!2079 (List!30324) Bool)

(assert (=> b!1318298 (= res!874669 (noDuplicate!2079 Nil!30321))))

(declare-fun b!1318299 () Bool)

(declare-fun res!874666 () Bool)

(assert (=> b!1318299 (=> (not res!874666) (not e!752250))))

(assert (=> b!1318299 (= res!874666 (and (bvsle #b00000000000000000000000000000000 (size!43300 _keys!1609)) (bvslt (size!43300 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1318300 () Bool)

(declare-fun e!752249 () Bool)

(declare-fun tp_is_empty!35767 () Bool)

(assert (=> b!1318300 (= e!752249 tp_is_empty!35767)))

(declare-fun b!1318301 () Bool)

(assert (=> b!1318301 (= e!752248 tp_is_empty!35767)))

(declare-fun mapNonEmpty!55295 () Bool)

(declare-fun tp!105401 () Bool)

(assert (=> mapNonEmpty!55295 (= mapRes!55295 (and tp!105401 e!752249))))

(declare-fun mapValue!55295 () ValueCell!16985)

(declare-fun mapKey!55295 () (_ BitVec 32))

(declare-fun mapRest!55295 () (Array (_ BitVec 32) ValueCell!16985))

(assert (=> mapNonEmpty!55295 (= (arr!42748 _values!1337) (store mapRest!55295 mapKey!55295 mapValue!55295))))

(declare-fun b!1318302 () Bool)

(declare-fun res!874670 () Bool)

(assert (=> b!1318302 (=> (not res!874670) (not e!752250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88557 (_ BitVec 32)) Bool)

(assert (=> b!1318302 (= res!874670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318303 () Bool)

(assert (=> b!1318303 (= e!752250 e!752251)))

(declare-fun res!874665 () Bool)

(assert (=> b!1318303 (=> res!874665 e!752251)))

(assert (=> b!1318303 (= res!874665 (contains!8602 Nil!30321 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!111502 res!874668) b!1318297))

(assert (= (and b!1318297 res!874667) b!1318302))

(assert (= (and b!1318302 res!874670) b!1318299))

(assert (= (and b!1318299 res!874666) b!1318298))

(assert (= (and b!1318298 res!874669) b!1318303))

(assert (= (and b!1318303 (not res!874665)) b!1318296))

(assert (= (and b!1318295 condMapEmpty!55295) mapIsEmpty!55295))

(assert (= (and b!1318295 (not condMapEmpty!55295)) mapNonEmpty!55295))

(get-info :version)

(assert (= (and mapNonEmpty!55295 ((_ is ValueCellFull!16985) mapValue!55295)) b!1318300))

(assert (= (and b!1318295 ((_ is ValueCellFull!16985) mapDefault!55295)) b!1318301))

(assert (= start!111502 b!1318295))

(declare-fun m!1206601 () Bool)

(assert (=> mapNonEmpty!55295 m!1206601))

(declare-fun m!1206603 () Bool)

(assert (=> b!1318303 m!1206603))

(declare-fun m!1206605 () Bool)

(assert (=> b!1318298 m!1206605))

(declare-fun m!1206607 () Bool)

(assert (=> b!1318296 m!1206607))

(declare-fun m!1206609 () Bool)

(assert (=> b!1318302 m!1206609))

(declare-fun m!1206611 () Bool)

(assert (=> start!111502 m!1206611))

(declare-fun m!1206613 () Bool)

(assert (=> start!111502 m!1206613))

(declare-fun m!1206615 () Bool)

(assert (=> start!111502 m!1206615))

(check-sat tp_is_empty!35767 (not b!1318298) (not b!1318303) (not mapNonEmpty!55295) (not b!1318302) (not b!1318296) (not start!111502))
(check-sat)
(get-model)

(declare-fun d!143155 () Bool)

(assert (=> d!143155 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111502 d!143155))

(declare-fun d!143157 () Bool)

(assert (=> d!143157 (= (array_inv!32555 _values!1337) (bvsge (size!43299 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111502 d!143157))

(declare-fun d!143159 () Bool)

(assert (=> d!143159 (= (array_inv!32556 _keys!1609) (bvsge (size!43300 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111502 d!143159))

(declare-fun b!1318366 () Bool)

(declare-fun e!752297 () Bool)

(declare-fun call!64749 () Bool)

(assert (=> b!1318366 (= e!752297 call!64749)))

(declare-fun bm!64746 () Bool)

(assert (=> bm!64746 (= call!64749 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1318367 () Bool)

(declare-fun e!752296 () Bool)

(assert (=> b!1318367 (= e!752297 e!752296)))

(declare-fun lt!586781 () (_ BitVec 64))

(assert (=> b!1318367 (= lt!586781 (select (arr!42749 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43383 0))(
  ( (Unit!43384) )
))
(declare-fun lt!586783 () Unit!43383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88557 (_ BitVec 64) (_ BitVec 32)) Unit!43383)

(assert (=> b!1318367 (= lt!586783 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586781 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1318367 (arrayContainsKey!0 _keys!1609 lt!586781 #b00000000000000000000000000000000)))

(declare-fun lt!586782 () Unit!43383)

(assert (=> b!1318367 (= lt!586782 lt!586783)))

(declare-fun res!874711 () Bool)

(declare-datatypes ((SeekEntryResult!9995 0))(
  ( (MissingZero!9995 (index!42351 (_ BitVec 32))) (Found!9995 (index!42352 (_ BitVec 32))) (Intermediate!9995 (undefined!10807 Bool) (index!42353 (_ BitVec 32)) (x!117070 (_ BitVec 32))) (Undefined!9995) (MissingVacant!9995 (index!42354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88557 (_ BitVec 32)) SeekEntryResult!9995)

(assert (=> b!1318367 (= res!874711 (= (seekEntryOrOpen!0 (select (arr!42749 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9995 #b00000000000000000000000000000000)))))

(assert (=> b!1318367 (=> (not res!874711) (not e!752296))))

(declare-fun b!1318368 () Bool)

(assert (=> b!1318368 (= e!752296 call!64749)))

(declare-fun d!143161 () Bool)

(declare-fun res!874712 () Bool)

(declare-fun e!752295 () Bool)

(assert (=> d!143161 (=> res!874712 e!752295)))

(assert (=> d!143161 (= res!874712 (bvsge #b00000000000000000000000000000000 (size!43300 _keys!1609)))))

(assert (=> d!143161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!752295)))

(declare-fun b!1318369 () Bool)

(assert (=> b!1318369 (= e!752295 e!752297)))

(declare-fun c!126038 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318369 (= c!126038 (validKeyInArray!0 (select (arr!42749 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143161 (not res!874712)) b!1318369))

(assert (= (and b!1318369 c!126038) b!1318367))

(assert (= (and b!1318369 (not c!126038)) b!1318366))

(assert (= (and b!1318367 res!874711) b!1318368))

(assert (= (or b!1318368 b!1318366) bm!64746))

(declare-fun m!1206649 () Bool)

(assert (=> bm!64746 m!1206649))

(declare-fun m!1206651 () Bool)

(assert (=> b!1318367 m!1206651))

(declare-fun m!1206653 () Bool)

(assert (=> b!1318367 m!1206653))

(declare-fun m!1206655 () Bool)

(assert (=> b!1318367 m!1206655))

(assert (=> b!1318367 m!1206651))

(declare-fun m!1206657 () Bool)

(assert (=> b!1318367 m!1206657))

(assert (=> b!1318369 m!1206651))

(assert (=> b!1318369 m!1206651))

(declare-fun m!1206659 () Bool)

(assert (=> b!1318369 m!1206659))

(assert (=> b!1318302 d!143161))

(declare-fun d!143163 () Bool)

(declare-fun res!874717 () Bool)

(declare-fun e!752302 () Bool)

(assert (=> d!143163 (=> res!874717 e!752302)))

(assert (=> d!143163 (= res!874717 ((_ is Nil!30321) Nil!30321))))

(assert (=> d!143163 (= (noDuplicate!2079 Nil!30321) e!752302)))

(declare-fun b!1318374 () Bool)

(declare-fun e!752303 () Bool)

(assert (=> b!1318374 (= e!752302 e!752303)))

(declare-fun res!874718 () Bool)

(assert (=> b!1318374 (=> (not res!874718) (not e!752303))))

(assert (=> b!1318374 (= res!874718 (not (contains!8602 (t!43924 Nil!30321) (h!31538 Nil!30321))))))

(declare-fun b!1318375 () Bool)

(assert (=> b!1318375 (= e!752303 (noDuplicate!2079 (t!43924 Nil!30321)))))

(assert (= (and d!143163 (not res!874717)) b!1318374))

(assert (= (and b!1318374 res!874718) b!1318375))

(declare-fun m!1206661 () Bool)

(assert (=> b!1318374 m!1206661))

(declare-fun m!1206663 () Bool)

(assert (=> b!1318375 m!1206663))

(assert (=> b!1318298 d!143163))

(declare-fun d!143165 () Bool)

(declare-fun lt!586786 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!651 (List!30324) (InoxSet (_ BitVec 64)))

(assert (=> d!143165 (= lt!586786 (select (content!651 Nil!30321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!752308 () Bool)

(assert (=> d!143165 (= lt!586786 e!752308)))

(declare-fun res!874724 () Bool)

(assert (=> d!143165 (=> (not res!874724) (not e!752308))))

(assert (=> d!143165 (= res!874724 ((_ is Cons!30320) Nil!30321))))

(assert (=> d!143165 (= (contains!8602 Nil!30321 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586786)))

(declare-fun b!1318380 () Bool)

(declare-fun e!752309 () Bool)

(assert (=> b!1318380 (= e!752308 e!752309)))

(declare-fun res!874723 () Bool)

(assert (=> b!1318380 (=> res!874723 e!752309)))

(assert (=> b!1318380 (= res!874723 (= (h!31538 Nil!30321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1318381 () Bool)

(assert (=> b!1318381 (= e!752309 (contains!8602 (t!43924 Nil!30321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143165 res!874724) b!1318380))

(assert (= (and b!1318380 (not res!874723)) b!1318381))

(declare-fun m!1206665 () Bool)

(assert (=> d!143165 m!1206665))

(declare-fun m!1206667 () Bool)

(assert (=> d!143165 m!1206667))

(declare-fun m!1206669 () Bool)

(assert (=> b!1318381 m!1206669))

(assert (=> b!1318303 d!143165))

(declare-fun d!143167 () Bool)

(declare-fun lt!586787 () Bool)

(assert (=> d!143167 (= lt!586787 (select (content!651 Nil!30321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!752310 () Bool)

(assert (=> d!143167 (= lt!586787 e!752310)))

(declare-fun res!874726 () Bool)

(assert (=> d!143167 (=> (not res!874726) (not e!752310))))

(assert (=> d!143167 (= res!874726 ((_ is Cons!30320) Nil!30321))))

(assert (=> d!143167 (= (contains!8602 Nil!30321 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586787)))

(declare-fun b!1318382 () Bool)

(declare-fun e!752311 () Bool)

(assert (=> b!1318382 (= e!752310 e!752311)))

(declare-fun res!874725 () Bool)

(assert (=> b!1318382 (=> res!874725 e!752311)))

(assert (=> b!1318382 (= res!874725 (= (h!31538 Nil!30321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1318383 () Bool)

(assert (=> b!1318383 (= e!752311 (contains!8602 (t!43924 Nil!30321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143167 res!874726) b!1318382))

(assert (= (and b!1318382 (not res!874725)) b!1318383))

(assert (=> d!143167 m!1206665))

(declare-fun m!1206671 () Bool)

(assert (=> d!143167 m!1206671))

(declare-fun m!1206673 () Bool)

(assert (=> b!1318383 m!1206673))

(assert (=> b!1318296 d!143167))

(declare-fun condMapEmpty!55304 () Bool)

(declare-fun mapDefault!55304 () ValueCell!16985)

(assert (=> mapNonEmpty!55295 (= condMapEmpty!55304 (= mapRest!55295 ((as const (Array (_ BitVec 32) ValueCell!16985)) mapDefault!55304)))))

(declare-fun e!752317 () Bool)

(declare-fun mapRes!55304 () Bool)

(assert (=> mapNonEmpty!55295 (= tp!105401 (and e!752317 mapRes!55304))))

(declare-fun mapIsEmpty!55304 () Bool)

(assert (=> mapIsEmpty!55304 mapRes!55304))

(declare-fun b!1318390 () Bool)

(declare-fun e!752316 () Bool)

(assert (=> b!1318390 (= e!752316 tp_is_empty!35767)))

(declare-fun b!1318391 () Bool)

(assert (=> b!1318391 (= e!752317 tp_is_empty!35767)))

(declare-fun mapNonEmpty!55304 () Bool)

(declare-fun tp!105410 () Bool)

(assert (=> mapNonEmpty!55304 (= mapRes!55304 (and tp!105410 e!752316))))

(declare-fun mapKey!55304 () (_ BitVec 32))

(declare-fun mapValue!55304 () ValueCell!16985)

(declare-fun mapRest!55304 () (Array (_ BitVec 32) ValueCell!16985))

(assert (=> mapNonEmpty!55304 (= mapRest!55295 (store mapRest!55304 mapKey!55304 mapValue!55304))))

(assert (= (and mapNonEmpty!55295 condMapEmpty!55304) mapIsEmpty!55304))

(assert (= (and mapNonEmpty!55295 (not condMapEmpty!55304)) mapNonEmpty!55304))

(assert (= (and mapNonEmpty!55304 ((_ is ValueCellFull!16985) mapValue!55304)) b!1318390))

(assert (= (and mapNonEmpty!55295 ((_ is ValueCellFull!16985) mapDefault!55304)) b!1318391))

(declare-fun m!1206675 () Bool)

(assert (=> mapNonEmpty!55304 m!1206675))

(check-sat (not b!1318367) (not b!1318381) tp_is_empty!35767 (not mapNonEmpty!55304) (not bm!64746) (not b!1318369) (not b!1318383) (not d!143165) (not d!143167) (not b!1318374) (not b!1318375))
(check-sat)
