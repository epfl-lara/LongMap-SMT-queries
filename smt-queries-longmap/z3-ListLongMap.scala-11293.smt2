; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132062 () Bool)

(assert start!132062)

(declare-fun b!1544294 () Bool)

(declare-fun res!1059050 () Bool)

(declare-fun e!859168 () Bool)

(assert (=> b!1544294 (=> (not res!1059050) (not e!859168))))

(declare-datatypes ((List!35896 0))(
  ( (Nil!35893) (Cons!35892 (h!37355 (_ BitVec 64)) (t!50582 List!35896)) )
))
(declare-fun noDuplicate!2656 (List!35896) Bool)

(assert (=> b!1544294 (= res!1059050 (noDuplicate!2656 Nil!35893))))

(declare-fun mapIsEmpty!58177 () Bool)

(declare-fun mapRes!58177 () Bool)

(assert (=> mapIsEmpty!58177 mapRes!58177))

(declare-fun b!1544295 () Bool)

(declare-fun e!859165 () Bool)

(declare-fun tp_is_empty!37651 () Bool)

(assert (=> b!1544295 (= e!859165 tp_is_empty!37651)))

(declare-fun b!1544297 () Bool)

(declare-fun e!859167 () Bool)

(assert (=> b!1544297 (= e!859168 e!859167)))

(declare-fun res!1059053 () Bool)

(assert (=> b!1544297 (=> res!1059053 e!859167)))

(declare-fun contains!10071 (List!35896 (_ BitVec 64)) Bool)

(assert (=> b!1544297 (= res!1059053 (contains!10071 Nil!35893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1544298 () Bool)

(declare-fun res!1059052 () Bool)

(assert (=> b!1544298 (=> (not res!1059052) (not e!859168))))

(declare-datatypes ((array!102660 0))(
  ( (array!102661 (arr!49526 (Array (_ BitVec 32) (_ BitVec 64))) (size!50077 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102660)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102660 (_ BitVec 32)) Bool)

(assert (=> b!1544298 (= res!1059052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544299 () Bool)

(declare-fun e!859163 () Bool)

(assert (=> b!1544299 (= e!859163 tp_is_empty!37651)))

(declare-fun b!1544300 () Bool)

(declare-fun res!1059049 () Bool)

(assert (=> b!1544300 (=> (not res!1059049) (not e!859168))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58645 0))(
  ( (V!58646 (val!18903 Int)) )
))
(declare-datatypes ((ValueCell!17915 0))(
  ( (ValueCellFull!17915 (v!21695 V!58645)) (EmptyCell!17915) )
))
(declare-datatypes ((array!102662 0))(
  ( (array!102663 (arr!49527 (Array (_ BitVec 32) ValueCell!17915)) (size!50078 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102662)

(assert (=> b!1544300 (= res!1059049 (and (= (size!50078 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50077 _keys!618) (size!50078 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58177 () Bool)

(declare-fun tp!110704 () Bool)

(assert (=> mapNonEmpty!58177 (= mapRes!58177 (and tp!110704 e!859163))))

(declare-fun mapKey!58177 () (_ BitVec 32))

(declare-fun mapRest!58177 () (Array (_ BitVec 32) ValueCell!17915))

(declare-fun mapValue!58177 () ValueCell!17915)

(assert (=> mapNonEmpty!58177 (= (arr!49527 _values!470) (store mapRest!58177 mapKey!58177 mapValue!58177))))

(declare-fun b!1544301 () Bool)

(declare-fun res!1059054 () Bool)

(assert (=> b!1544301 (=> (not res!1059054) (not e!859168))))

(assert (=> b!1544301 (= res!1059054 (and (bvsle #b00000000000000000000000000000000 (size!50077 _keys!618)) (bvslt (size!50077 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun b!1544302 () Bool)

(declare-fun e!859164 () Bool)

(assert (=> b!1544302 (= e!859164 (and e!859165 mapRes!58177))))

(declare-fun condMapEmpty!58177 () Bool)

(declare-fun mapDefault!58177 () ValueCell!17915)

(assert (=> b!1544302 (= condMapEmpty!58177 (= (arr!49527 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17915)) mapDefault!58177)))))

(declare-fun b!1544296 () Bool)

(assert (=> b!1544296 (= e!859167 (contains!10071 Nil!35893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1059051 () Bool)

(assert (=> start!132062 (=> (not res!1059051) (not e!859168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132062 (= res!1059051 (validMask!0 mask!926))))

(assert (=> start!132062 e!859168))

(assert (=> start!132062 true))

(declare-fun array_inv!38799 (array!102662) Bool)

(assert (=> start!132062 (and (array_inv!38799 _values!470) e!859164)))

(declare-fun array_inv!38800 (array!102660) Bool)

(assert (=> start!132062 (array_inv!38800 _keys!618)))

(assert (= (and start!132062 res!1059051) b!1544300))

(assert (= (and b!1544300 res!1059049) b!1544298))

(assert (= (and b!1544298 res!1059052) b!1544301))

(assert (= (and b!1544301 res!1059054) b!1544294))

(assert (= (and b!1544294 res!1059050) b!1544297))

(assert (= (and b!1544297 (not res!1059053)) b!1544296))

(assert (= (and b!1544302 condMapEmpty!58177) mapIsEmpty!58177))

(assert (= (and b!1544302 (not condMapEmpty!58177)) mapNonEmpty!58177))

(get-info :version)

(assert (= (and mapNonEmpty!58177 ((_ is ValueCellFull!17915) mapValue!58177)) b!1544299))

(assert (= (and b!1544302 ((_ is ValueCellFull!17915) mapDefault!58177)) b!1544295))

(assert (= start!132062 b!1544302))

(declare-fun m!1425947 () Bool)

(assert (=> b!1544298 m!1425947))

(declare-fun m!1425949 () Bool)

(assert (=> mapNonEmpty!58177 m!1425949))

(declare-fun m!1425951 () Bool)

(assert (=> b!1544297 m!1425951))

(declare-fun m!1425953 () Bool)

(assert (=> b!1544296 m!1425953))

(declare-fun m!1425955 () Bool)

(assert (=> b!1544294 m!1425955))

(declare-fun m!1425957 () Bool)

(assert (=> start!132062 m!1425957))

(declare-fun m!1425959 () Bool)

(assert (=> start!132062 m!1425959))

(declare-fun m!1425961 () Bool)

(assert (=> start!132062 m!1425961))

(check-sat (not b!1544297) (not b!1544296) (not b!1544294) (not b!1544298) tp_is_empty!37651 (not mapNonEmpty!58177) (not start!132062))
(check-sat)
(get-model)

(declare-fun d!161427 () Bool)

(declare-fun res!1059095 () Bool)

(declare-fun e!859209 () Bool)

(assert (=> d!161427 (=> res!1059095 e!859209)))

(assert (=> d!161427 (= res!1059095 ((_ is Nil!35893) Nil!35893))))

(assert (=> d!161427 (= (noDuplicate!2656 Nil!35893) e!859209)))

(declare-fun b!1544361 () Bool)

(declare-fun e!859210 () Bool)

(assert (=> b!1544361 (= e!859209 e!859210)))

(declare-fun res!1059096 () Bool)

(assert (=> b!1544361 (=> (not res!1059096) (not e!859210))))

(assert (=> b!1544361 (= res!1059096 (not (contains!10071 (t!50582 Nil!35893) (h!37355 Nil!35893))))))

(declare-fun b!1544362 () Bool)

(assert (=> b!1544362 (= e!859210 (noDuplicate!2656 (t!50582 Nil!35893)))))

(assert (= (and d!161427 (not res!1059095)) b!1544361))

(assert (= (and b!1544361 res!1059096) b!1544362))

(declare-fun m!1425995 () Bool)

(assert (=> b!1544361 m!1425995))

(declare-fun m!1425997 () Bool)

(assert (=> b!1544362 m!1425997))

(assert (=> b!1544294 d!161427))

(declare-fun b!1544371 () Bool)

(declare-fun e!859218 () Bool)

(declare-fun call!68844 () Bool)

(assert (=> b!1544371 (= e!859218 call!68844)))

(declare-fun bm!68841 () Bool)

(assert (=> bm!68841 (= call!68844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1544372 () Bool)

(declare-fun e!859219 () Bool)

(assert (=> b!1544372 (= e!859219 e!859218)))

(declare-fun lt!666638 () (_ BitVec 64))

(assert (=> b!1544372 (= lt!666638 (select (arr!49526 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51421 0))(
  ( (Unit!51422) )
))
(declare-fun lt!666637 () Unit!51421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102660 (_ BitVec 64) (_ BitVec 32)) Unit!51421)

(assert (=> b!1544372 (= lt!666637 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!666638 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1544372 (arrayContainsKey!0 _keys!618 lt!666638 #b00000000000000000000000000000000)))

(declare-fun lt!666639 () Unit!51421)

(assert (=> b!1544372 (= lt!666639 lt!666637)))

(declare-fun res!1059101 () Bool)

(declare-datatypes ((SeekEntryResult!13459 0))(
  ( (MissingZero!13459 (index!56234 (_ BitVec 32))) (Found!13459 (index!56235 (_ BitVec 32))) (Intermediate!13459 (undefined!14271 Bool) (index!56236 (_ BitVec 32)) (x!138390 (_ BitVec 32))) (Undefined!13459) (MissingVacant!13459 (index!56237 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102660 (_ BitVec 32)) SeekEntryResult!13459)

(assert (=> b!1544372 (= res!1059101 (= (seekEntryOrOpen!0 (select (arr!49526 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13459 #b00000000000000000000000000000000)))))

(assert (=> b!1544372 (=> (not res!1059101) (not e!859218))))

(declare-fun d!161429 () Bool)

(declare-fun res!1059102 () Bool)

(declare-fun e!859217 () Bool)

(assert (=> d!161429 (=> res!1059102 e!859217)))

(assert (=> d!161429 (= res!1059102 (bvsge #b00000000000000000000000000000000 (size!50077 _keys!618)))))

(assert (=> d!161429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!859217)))

(declare-fun b!1544373 () Bool)

(assert (=> b!1544373 (= e!859219 call!68844)))

(declare-fun b!1544374 () Bool)

(assert (=> b!1544374 (= e!859217 e!859219)))

(declare-fun c!142108 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1544374 (= c!142108 (validKeyInArray!0 (select (arr!49526 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161429 (not res!1059102)) b!1544374))

(assert (= (and b!1544374 c!142108) b!1544372))

(assert (= (and b!1544374 (not c!142108)) b!1544373))

(assert (= (and b!1544372 res!1059101) b!1544371))

(assert (= (or b!1544371 b!1544373) bm!68841))

(declare-fun m!1425999 () Bool)

(assert (=> bm!68841 m!1425999))

(declare-fun m!1426001 () Bool)

(assert (=> b!1544372 m!1426001))

(declare-fun m!1426003 () Bool)

(assert (=> b!1544372 m!1426003))

(declare-fun m!1426005 () Bool)

(assert (=> b!1544372 m!1426005))

(assert (=> b!1544372 m!1426001))

(declare-fun m!1426007 () Bool)

(assert (=> b!1544372 m!1426007))

(assert (=> b!1544374 m!1426001))

(assert (=> b!1544374 m!1426001))

(declare-fun m!1426009 () Bool)

(assert (=> b!1544374 m!1426009))

(assert (=> b!1544298 d!161429))

(declare-fun d!161431 () Bool)

(declare-fun lt!666642 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!782 (List!35896) (InoxSet (_ BitVec 64)))

(assert (=> d!161431 (= lt!666642 (select (content!782 Nil!35893) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!859224 () Bool)

(assert (=> d!161431 (= lt!666642 e!859224)))

(declare-fun res!1059108 () Bool)

(assert (=> d!161431 (=> (not res!1059108) (not e!859224))))

(assert (=> d!161431 (= res!1059108 ((_ is Cons!35892) Nil!35893))))

(assert (=> d!161431 (= (contains!10071 Nil!35893 #b0000000000000000000000000000000000000000000000000000000000000000) lt!666642)))

(declare-fun b!1544379 () Bool)

(declare-fun e!859225 () Bool)

(assert (=> b!1544379 (= e!859224 e!859225)))

(declare-fun res!1059107 () Bool)

(assert (=> b!1544379 (=> res!1059107 e!859225)))

(assert (=> b!1544379 (= res!1059107 (= (h!37355 Nil!35893) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1544380 () Bool)

(assert (=> b!1544380 (= e!859225 (contains!10071 (t!50582 Nil!35893) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161431 res!1059108) b!1544379))

(assert (= (and b!1544379 (not res!1059107)) b!1544380))

(declare-fun m!1426011 () Bool)

(assert (=> d!161431 m!1426011))

(declare-fun m!1426013 () Bool)

(assert (=> d!161431 m!1426013))

(declare-fun m!1426015 () Bool)

(assert (=> b!1544380 m!1426015))

(assert (=> b!1544297 d!161431))

(declare-fun d!161433 () Bool)

(assert (=> d!161433 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132062 d!161433))

(declare-fun d!161435 () Bool)

(assert (=> d!161435 (= (array_inv!38799 _values!470) (bvsge (size!50078 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132062 d!161435))

(declare-fun d!161437 () Bool)

(assert (=> d!161437 (= (array_inv!38800 _keys!618) (bvsge (size!50077 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132062 d!161437))

(declare-fun d!161439 () Bool)

(declare-fun lt!666643 () Bool)

(assert (=> d!161439 (= lt!666643 (select (content!782 Nil!35893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!859226 () Bool)

(assert (=> d!161439 (= lt!666643 e!859226)))

(declare-fun res!1059110 () Bool)

(assert (=> d!161439 (=> (not res!1059110) (not e!859226))))

(assert (=> d!161439 (= res!1059110 ((_ is Cons!35892) Nil!35893))))

(assert (=> d!161439 (= (contains!10071 Nil!35893 #b1000000000000000000000000000000000000000000000000000000000000000) lt!666643)))

(declare-fun b!1544381 () Bool)

(declare-fun e!859227 () Bool)

(assert (=> b!1544381 (= e!859226 e!859227)))

(declare-fun res!1059109 () Bool)

(assert (=> b!1544381 (=> res!1059109 e!859227)))

(assert (=> b!1544381 (= res!1059109 (= (h!37355 Nil!35893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1544382 () Bool)

(assert (=> b!1544382 (= e!859227 (contains!10071 (t!50582 Nil!35893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161439 res!1059110) b!1544381))

(assert (= (and b!1544381 (not res!1059109)) b!1544382))

(assert (=> d!161439 m!1426011))

(declare-fun m!1426017 () Bool)

(assert (=> d!161439 m!1426017))

(declare-fun m!1426019 () Bool)

(assert (=> b!1544382 m!1426019))

(assert (=> b!1544296 d!161439))

(declare-fun mapNonEmpty!58186 () Bool)

(declare-fun mapRes!58186 () Bool)

(declare-fun tp!110713 () Bool)

(declare-fun e!859233 () Bool)

(assert (=> mapNonEmpty!58186 (= mapRes!58186 (and tp!110713 e!859233))))

(declare-fun mapKey!58186 () (_ BitVec 32))

(declare-fun mapRest!58186 () (Array (_ BitVec 32) ValueCell!17915))

(declare-fun mapValue!58186 () ValueCell!17915)

(assert (=> mapNonEmpty!58186 (= mapRest!58177 (store mapRest!58186 mapKey!58186 mapValue!58186))))

(declare-fun condMapEmpty!58186 () Bool)

(declare-fun mapDefault!58186 () ValueCell!17915)

(assert (=> mapNonEmpty!58177 (= condMapEmpty!58186 (= mapRest!58177 ((as const (Array (_ BitVec 32) ValueCell!17915)) mapDefault!58186)))))

(declare-fun e!859232 () Bool)

(assert (=> mapNonEmpty!58177 (= tp!110704 (and e!859232 mapRes!58186))))

(declare-fun b!1544389 () Bool)

(assert (=> b!1544389 (= e!859233 tp_is_empty!37651)))

(declare-fun b!1544390 () Bool)

(assert (=> b!1544390 (= e!859232 tp_is_empty!37651)))

(declare-fun mapIsEmpty!58186 () Bool)

(assert (=> mapIsEmpty!58186 mapRes!58186))

(assert (= (and mapNonEmpty!58177 condMapEmpty!58186) mapIsEmpty!58186))

(assert (= (and mapNonEmpty!58177 (not condMapEmpty!58186)) mapNonEmpty!58186))

(assert (= (and mapNonEmpty!58186 ((_ is ValueCellFull!17915) mapValue!58186)) b!1544389))

(assert (= (and mapNonEmpty!58177 ((_ is ValueCellFull!17915) mapDefault!58186)) b!1544390))

(declare-fun m!1426021 () Bool)

(assert (=> mapNonEmpty!58186 m!1426021))

(check-sat tp_is_empty!37651 (not mapNonEmpty!58186) (not b!1544361) (not b!1544380) (not b!1544362) (not b!1544382) (not bm!68841) (not d!161431) (not d!161439) (not b!1544372) (not b!1544374))
(check-sat)
