; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18838 () Bool)

(assert start!18838)

(declare-fun b!186180 () Bool)

(declare-fun b_free!4593 () Bool)

(declare-fun b_next!4593 () Bool)

(assert (=> b!186180 (= b_free!4593 (not b_next!4593))))

(declare-fun tp!16581 () Bool)

(declare-fun b_and!11197 () Bool)

(assert (=> b!186180 (= tp!16581 b_and!11197)))

(declare-fun b!186171 () Bool)

(declare-fun e!122538 () Bool)

(declare-fun e!122532 () Bool)

(assert (=> b!186171 (= e!122538 e!122532)))

(declare-fun res!88071 () Bool)

(assert (=> b!186171 (=> (not res!88071) (not e!122532))))

(declare-datatypes ((SeekEntryResult!642 0))(
  ( (MissingZero!642 (index!4738 (_ BitVec 32))) (Found!642 (index!4739 (_ BitVec 32))) (Intermediate!642 (undefined!1454 Bool) (index!4740 (_ BitVec 32)) (x!20206 (_ BitVec 32))) (Undefined!642) (MissingVacant!642 (index!4741 (_ BitVec 32))) )
))
(declare-fun lt!92046 () SeekEntryResult!642)

(get-info :version)

(assert (=> b!186171 (= res!88071 (and (not ((_ is Undefined!642) lt!92046)) (not ((_ is MissingVacant!642) lt!92046)) (not ((_ is MissingZero!642) lt!92046)) ((_ is Found!642) lt!92046)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5467 0))(
  ( (V!5468 (val!2227 Int)) )
))
(declare-datatypes ((ValueCell!1839 0))(
  ( (ValueCellFull!1839 (v!4139 V!5467)) (EmptyCell!1839) )
))
(declare-datatypes ((array!7941 0))(
  ( (array!7942 (arr!3749 (Array (_ BitVec 32) (_ BitVec 64))) (size!4065 (_ BitVec 32))) )
))
(declare-datatypes ((array!7943 0))(
  ( (array!7944 (arr!3750 (Array (_ BitVec 32) ValueCell!1839)) (size!4066 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2586 0))(
  ( (LongMapFixedSize!2587 (defaultEntry!3798 Int) (mask!8920 (_ BitVec 32)) (extraKeys!3535 (_ BitVec 32)) (zeroValue!3639 V!5467) (minValue!3639 V!5467) (_size!1342 (_ BitVec 32)) (_keys!5740 array!7941) (_values!3781 array!7943) (_vacant!1342 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2586)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7941 (_ BitVec 32)) SeekEntryResult!642)

(assert (=> b!186171 (= lt!92046 (seekEntryOrOpen!0 key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun b!186172 () Bool)

(declare-fun e!122539 () Bool)

(declare-fun tp_is_empty!4365 () Bool)

(assert (=> b!186172 (= e!122539 tp_is_empty!4365)))

(declare-fun b!186173 () Bool)

(declare-fun e!122535 () Bool)

(assert (=> b!186173 (= e!122535 tp_is_empty!4365)))

(declare-fun b!186174 () Bool)

(declare-fun e!122531 () Bool)

(declare-fun mapRes!7512 () Bool)

(assert (=> b!186174 (= e!122531 (and e!122535 mapRes!7512))))

(declare-fun condMapEmpty!7512 () Bool)

(declare-fun mapDefault!7512 () ValueCell!1839)

(assert (=> b!186174 (= condMapEmpty!7512 (= (arr!3750 (_values!3781 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1839)) mapDefault!7512)))))

(declare-fun b!186175 () Bool)

(declare-datatypes ((Unit!5610 0))(
  ( (Unit!5611) )
))
(declare-fun e!122534 () Unit!5610)

(declare-fun Unit!5612 () Unit!5610)

(assert (=> b!186175 (= e!122534 Unit!5612)))

(declare-fun lt!92043 () Unit!5610)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!147 (array!7941 array!7943 (_ BitVec 32) (_ BitVec 32) V!5467 V!5467 (_ BitVec 64) Int) Unit!5610)

(assert (=> b!186175 (= lt!92043 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!147 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)))))

(assert (=> b!186175 false))

(declare-fun b!186176 () Bool)

(declare-fun e!122533 () Bool)

(assert (=> b!186176 (= e!122533 (not (= (size!4066 (_values!3781 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8920 thiss!1248)))))))

(declare-fun b!186177 () Bool)

(declare-fun lt!92044 () Unit!5610)

(assert (=> b!186177 (= e!122534 lt!92044)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (array!7941 array!7943 (_ BitVec 32) (_ BitVec 32) V!5467 V!5467 (_ BitVec 64) Int) Unit!5610)

(assert (=> b!186177 (= lt!92044 (lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)))))

(declare-fun res!88069 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186177 (= res!88069 (inRange!0 (index!4739 lt!92046) (mask!8920 thiss!1248)))))

(declare-fun e!122530 () Bool)

(assert (=> b!186177 (=> (not res!88069) (not e!122530))))

(assert (=> b!186177 e!122530))

(declare-fun mapIsEmpty!7512 () Bool)

(assert (=> mapIsEmpty!7512 mapRes!7512))

(declare-fun b!186178 () Bool)

(declare-fun res!88072 () Bool)

(assert (=> b!186178 (=> (not res!88072) (not e!122538))))

(assert (=> b!186178 (= res!88072 (not (= key!828 (bvneg key!828))))))

(declare-fun b!186179 () Bool)

(assert (=> b!186179 (= e!122532 e!122533)))

(declare-fun res!88070 () Bool)

(assert (=> b!186179 (=> (not res!88070) (not e!122533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186179 (= res!88070 (validMask!0 (mask!8920 thiss!1248)))))

(declare-fun lt!92045 () Unit!5610)

(assert (=> b!186179 (= lt!92045 e!122534)))

(declare-fun c!33373 () Bool)

(declare-datatypes ((tuple2!3468 0))(
  ( (tuple2!3469 (_1!1745 (_ BitVec 64)) (_2!1745 V!5467)) )
))
(declare-datatypes ((List!2374 0))(
  ( (Nil!2371) (Cons!2370 (h!3003 tuple2!3468) (t!7260 List!2374)) )
))
(declare-datatypes ((ListLongMap!2385 0))(
  ( (ListLongMap!2386 (toList!1208 List!2374)) )
))
(declare-fun contains!1304 (ListLongMap!2385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!856 (array!7941 array!7943 (_ BitVec 32) (_ BitVec 32) V!5467 V!5467 (_ BitVec 32) Int) ListLongMap!2385)

(assert (=> b!186179 (= c!33373 (contains!1304 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7512 () Bool)

(declare-fun tp!16580 () Bool)

(assert (=> mapNonEmpty!7512 (= mapRes!7512 (and tp!16580 e!122539))))

(declare-fun mapKey!7512 () (_ BitVec 32))

(declare-fun mapValue!7512 () ValueCell!1839)

(declare-fun mapRest!7512 () (Array (_ BitVec 32) ValueCell!1839))

(assert (=> mapNonEmpty!7512 (= (arr!3750 (_values!3781 thiss!1248)) (store mapRest!7512 mapKey!7512 mapValue!7512))))

(declare-fun res!88073 () Bool)

(assert (=> start!18838 (=> (not res!88073) (not e!122538))))

(declare-fun valid!1066 (LongMapFixedSize!2586) Bool)

(assert (=> start!18838 (= res!88073 (valid!1066 thiss!1248))))

(assert (=> start!18838 e!122538))

(declare-fun e!122536 () Bool)

(assert (=> start!18838 e!122536))

(assert (=> start!18838 true))

(declare-fun array_inv!2425 (array!7941) Bool)

(declare-fun array_inv!2426 (array!7943) Bool)

(assert (=> b!186180 (= e!122536 (and tp!16581 tp_is_empty!4365 (array_inv!2425 (_keys!5740 thiss!1248)) (array_inv!2426 (_values!3781 thiss!1248)) e!122531))))

(declare-fun b!186181 () Bool)

(assert (=> b!186181 (= e!122530 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4739 lt!92046)) key!828))))

(assert (= (and start!18838 res!88073) b!186178))

(assert (= (and b!186178 res!88072) b!186171))

(assert (= (and b!186171 res!88071) b!186179))

(assert (= (and b!186179 c!33373) b!186177))

(assert (= (and b!186179 (not c!33373)) b!186175))

(assert (= (and b!186177 res!88069) b!186181))

(assert (= (and b!186179 res!88070) b!186176))

(assert (= (and b!186174 condMapEmpty!7512) mapIsEmpty!7512))

(assert (= (and b!186174 (not condMapEmpty!7512)) mapNonEmpty!7512))

(assert (= (and mapNonEmpty!7512 ((_ is ValueCellFull!1839) mapValue!7512)) b!186172))

(assert (= (and b!186174 ((_ is ValueCellFull!1839) mapDefault!7512)) b!186173))

(assert (= b!186180 b!186174))

(assert (= start!18838 b!186180))

(declare-fun m!213175 () Bool)

(assert (=> b!186175 m!213175))

(declare-fun m!213177 () Bool)

(assert (=> b!186180 m!213177))

(declare-fun m!213179 () Bool)

(assert (=> b!186180 m!213179))

(declare-fun m!213181 () Bool)

(assert (=> b!186179 m!213181))

(declare-fun m!213183 () Bool)

(assert (=> b!186179 m!213183))

(assert (=> b!186179 m!213183))

(declare-fun m!213185 () Bool)

(assert (=> b!186179 m!213185))

(declare-fun m!213187 () Bool)

(assert (=> b!186171 m!213187))

(declare-fun m!213189 () Bool)

(assert (=> start!18838 m!213189))

(declare-fun m!213191 () Bool)

(assert (=> mapNonEmpty!7512 m!213191))

(declare-fun m!213193 () Bool)

(assert (=> b!186181 m!213193))

(declare-fun m!213195 () Bool)

(assert (=> b!186177 m!213195))

(declare-fun m!213197 () Bool)

(assert (=> b!186177 m!213197))

(check-sat (not b!186179) (not start!18838) (not b!186177) (not b!186175) b_and!11197 (not mapNonEmpty!7512) (not b!186171) tp_is_empty!4365 (not b_next!4593) (not b!186180))
(check-sat b_and!11197 (not b_next!4593))
(get-model)

(declare-fun b!186227 () Bool)

(declare-fun e!122578 () SeekEntryResult!642)

(declare-fun e!122576 () SeekEntryResult!642)

(assert (=> b!186227 (= e!122578 e!122576)))

(declare-fun lt!92066 () (_ BitVec 64))

(declare-fun lt!92067 () SeekEntryResult!642)

(assert (=> b!186227 (= lt!92066 (select (arr!3749 (_keys!5740 thiss!1248)) (index!4740 lt!92067)))))

(declare-fun c!33383 () Bool)

(assert (=> b!186227 (= c!33383 (= lt!92066 key!828))))

(declare-fun b!186228 () Bool)

(declare-fun e!122577 () SeekEntryResult!642)

(assert (=> b!186228 (= e!122577 (MissingZero!642 (index!4740 lt!92067)))))

(declare-fun b!186229 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7941 (_ BitVec 32)) SeekEntryResult!642)

(assert (=> b!186229 (= e!122577 (seekKeyOrZeroReturnVacant!0 (x!20206 lt!92067) (index!4740 lt!92067) (index!4740 lt!92067) key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun b!186230 () Bool)

(assert (=> b!186230 (= e!122576 (Found!642 (index!4740 lt!92067)))))

(declare-fun d!55165 () Bool)

(declare-fun lt!92065 () SeekEntryResult!642)

(assert (=> d!55165 (and (or ((_ is Undefined!642) lt!92065) (not ((_ is Found!642) lt!92065)) (and (bvsge (index!4739 lt!92065) #b00000000000000000000000000000000) (bvslt (index!4739 lt!92065) (size!4065 (_keys!5740 thiss!1248))))) (or ((_ is Undefined!642) lt!92065) ((_ is Found!642) lt!92065) (not ((_ is MissingZero!642) lt!92065)) (and (bvsge (index!4738 lt!92065) #b00000000000000000000000000000000) (bvslt (index!4738 lt!92065) (size!4065 (_keys!5740 thiss!1248))))) (or ((_ is Undefined!642) lt!92065) ((_ is Found!642) lt!92065) ((_ is MissingZero!642) lt!92065) (not ((_ is MissingVacant!642) lt!92065)) (and (bvsge (index!4741 lt!92065) #b00000000000000000000000000000000) (bvslt (index!4741 lt!92065) (size!4065 (_keys!5740 thiss!1248))))) (or ((_ is Undefined!642) lt!92065) (ite ((_ is Found!642) lt!92065) (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4739 lt!92065)) key!828) (ite ((_ is MissingZero!642) lt!92065) (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4738 lt!92065)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!642) lt!92065) (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4741 lt!92065)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55165 (= lt!92065 e!122578)))

(declare-fun c!33385 () Bool)

(assert (=> d!55165 (= c!33385 (and ((_ is Intermediate!642) lt!92067) (undefined!1454 lt!92067)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7941 (_ BitVec 32)) SeekEntryResult!642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55165 (= lt!92067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8920 thiss!1248)) key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(assert (=> d!55165 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55165 (= (seekEntryOrOpen!0 key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)) lt!92065)))

(declare-fun b!186231 () Bool)

(assert (=> b!186231 (= e!122578 Undefined!642)))

(declare-fun b!186232 () Bool)

(declare-fun c!33384 () Bool)

(assert (=> b!186232 (= c!33384 (= lt!92066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186232 (= e!122576 e!122577)))

(assert (= (and d!55165 c!33385) b!186231))

(assert (= (and d!55165 (not c!33385)) b!186227))

(assert (= (and b!186227 c!33383) b!186230))

(assert (= (and b!186227 (not c!33383)) b!186232))

(assert (= (and b!186232 c!33384) b!186228))

(assert (= (and b!186232 (not c!33384)) b!186229))

(declare-fun m!213223 () Bool)

(assert (=> b!186227 m!213223))

(declare-fun m!213225 () Bool)

(assert (=> b!186229 m!213225))

(assert (=> d!55165 m!213181))

(declare-fun m!213227 () Bool)

(assert (=> d!55165 m!213227))

(declare-fun m!213229 () Bool)

(assert (=> d!55165 m!213229))

(declare-fun m!213231 () Bool)

(assert (=> d!55165 m!213231))

(declare-fun m!213233 () Bool)

(assert (=> d!55165 m!213233))

(declare-fun m!213235 () Bool)

(assert (=> d!55165 m!213235))

(assert (=> d!55165 m!213227))

(assert (=> b!186171 d!55165))

(declare-fun d!55167 () Bool)

(assert (=> d!55167 (= (array_inv!2425 (_keys!5740 thiss!1248)) (bvsge (size!4065 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186180 d!55167))

(declare-fun d!55169 () Bool)

(assert (=> d!55169 (= (array_inv!2426 (_values!3781 thiss!1248)) (bvsge (size!4066 (_values!3781 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186180 d!55169))

(declare-fun d!55171 () Bool)

(declare-fun e!122581 () Bool)

(assert (=> d!55171 e!122581))

(declare-fun res!88093 () Bool)

(assert (=> d!55171 (=> (not res!88093) (not e!122581))))

(declare-fun lt!92073 () SeekEntryResult!642)

(assert (=> d!55171 (= res!88093 ((_ is Found!642) lt!92073))))

(assert (=> d!55171 (= lt!92073 (seekEntryOrOpen!0 key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun lt!92072 () Unit!5610)

(declare-fun choose!984 (array!7941 array!7943 (_ BitVec 32) (_ BitVec 32) V!5467 V!5467 (_ BitVec 64) Int) Unit!5610)

(assert (=> d!55171 (= lt!92072 (choose!984 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)))))

(assert (=> d!55171 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55171 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)) lt!92072)))

(declare-fun b!186237 () Bool)

(declare-fun res!88094 () Bool)

(assert (=> b!186237 (=> (not res!88094) (not e!122581))))

(assert (=> b!186237 (= res!88094 (inRange!0 (index!4739 lt!92073) (mask!8920 thiss!1248)))))

(declare-fun b!186238 () Bool)

(assert (=> b!186238 (= e!122581 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4739 lt!92073)) key!828))))

(assert (=> b!186238 (and (bvsge (index!4739 lt!92073) #b00000000000000000000000000000000) (bvslt (index!4739 lt!92073) (size!4065 (_keys!5740 thiss!1248))))))

(assert (= (and d!55171 res!88093) b!186237))

(assert (= (and b!186237 res!88094) b!186238))

(assert (=> d!55171 m!213187))

(declare-fun m!213237 () Bool)

(assert (=> d!55171 m!213237))

(assert (=> d!55171 m!213181))

(declare-fun m!213239 () Bool)

(assert (=> b!186237 m!213239))

(declare-fun m!213241 () Bool)

(assert (=> b!186238 m!213241))

(assert (=> b!186177 d!55171))

(declare-fun d!55173 () Bool)

(assert (=> d!55173 (= (inRange!0 (index!4739 lt!92046) (mask!8920 thiss!1248)) (and (bvsge (index!4739 lt!92046) #b00000000000000000000000000000000) (bvslt (index!4739 lt!92046) (bvadd (mask!8920 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186177 d!55173))

(declare-fun d!55175 () Bool)

(declare-fun res!88101 () Bool)

(declare-fun e!122584 () Bool)

(assert (=> d!55175 (=> (not res!88101) (not e!122584))))

(declare-fun simpleValid!184 (LongMapFixedSize!2586) Bool)

(assert (=> d!55175 (= res!88101 (simpleValid!184 thiss!1248))))

(assert (=> d!55175 (= (valid!1066 thiss!1248) e!122584)))

(declare-fun b!186245 () Bool)

(declare-fun res!88102 () Bool)

(assert (=> b!186245 (=> (not res!88102) (not e!122584))))

(declare-fun arrayCountValidKeys!0 (array!7941 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186245 (= res!88102 (= (arrayCountValidKeys!0 (_keys!5740 thiss!1248) #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))) (_size!1342 thiss!1248)))))

(declare-fun b!186246 () Bool)

(declare-fun res!88103 () Bool)

(assert (=> b!186246 (=> (not res!88103) (not e!122584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7941 (_ BitVec 32)) Bool)

(assert (=> b!186246 (= res!88103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun b!186247 () Bool)

(declare-datatypes ((List!2375 0))(
  ( (Nil!2372) (Cons!2371 (h!3004 (_ BitVec 64)) (t!7263 List!2375)) )
))
(declare-fun arrayNoDuplicates!0 (array!7941 (_ BitVec 32) List!2375) Bool)

(assert (=> b!186247 (= e!122584 (arrayNoDuplicates!0 (_keys!5740 thiss!1248) #b00000000000000000000000000000000 Nil!2372))))

(assert (= (and d!55175 res!88101) b!186245))

(assert (= (and b!186245 res!88102) b!186246))

(assert (= (and b!186246 res!88103) b!186247))

(declare-fun m!213243 () Bool)

(assert (=> d!55175 m!213243))

(declare-fun m!213245 () Bool)

(assert (=> b!186245 m!213245))

(declare-fun m!213247 () Bool)

(assert (=> b!186246 m!213247))

(declare-fun m!213249 () Bool)

(assert (=> b!186247 m!213249))

(assert (=> start!18838 d!55175))

(declare-fun d!55177 () Bool)

(assert (=> d!55177 (= (validMask!0 (mask!8920 thiss!1248)) (and (or (= (mask!8920 thiss!1248) #b00000000000000000000000000000111) (= (mask!8920 thiss!1248) #b00000000000000000000000000001111) (= (mask!8920 thiss!1248) #b00000000000000000000000000011111) (= (mask!8920 thiss!1248) #b00000000000000000000000000111111) (= (mask!8920 thiss!1248) #b00000000000000000000000001111111) (= (mask!8920 thiss!1248) #b00000000000000000000000011111111) (= (mask!8920 thiss!1248) #b00000000000000000000000111111111) (= (mask!8920 thiss!1248) #b00000000000000000000001111111111) (= (mask!8920 thiss!1248) #b00000000000000000000011111111111) (= (mask!8920 thiss!1248) #b00000000000000000000111111111111) (= (mask!8920 thiss!1248) #b00000000000000000001111111111111) (= (mask!8920 thiss!1248) #b00000000000000000011111111111111) (= (mask!8920 thiss!1248) #b00000000000000000111111111111111) (= (mask!8920 thiss!1248) #b00000000000000001111111111111111) (= (mask!8920 thiss!1248) #b00000000000000011111111111111111) (= (mask!8920 thiss!1248) #b00000000000000111111111111111111) (= (mask!8920 thiss!1248) #b00000000000001111111111111111111) (= (mask!8920 thiss!1248) #b00000000000011111111111111111111) (= (mask!8920 thiss!1248) #b00000000000111111111111111111111) (= (mask!8920 thiss!1248) #b00000000001111111111111111111111) (= (mask!8920 thiss!1248) #b00000000011111111111111111111111) (= (mask!8920 thiss!1248) #b00000000111111111111111111111111) (= (mask!8920 thiss!1248) #b00000001111111111111111111111111) (= (mask!8920 thiss!1248) #b00000011111111111111111111111111) (= (mask!8920 thiss!1248) #b00000111111111111111111111111111) (= (mask!8920 thiss!1248) #b00001111111111111111111111111111) (= (mask!8920 thiss!1248) #b00011111111111111111111111111111) (= (mask!8920 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8920 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!186179 d!55177))

(declare-fun d!55179 () Bool)

(declare-fun e!122589 () Bool)

(assert (=> d!55179 e!122589))

(declare-fun res!88106 () Bool)

(assert (=> d!55179 (=> res!88106 e!122589)))

(declare-fun lt!92083 () Bool)

(assert (=> d!55179 (= res!88106 (not lt!92083))))

(declare-fun lt!92084 () Bool)

(assert (=> d!55179 (= lt!92083 lt!92084)))

(declare-fun lt!92085 () Unit!5610)

(declare-fun e!122590 () Unit!5610)

(assert (=> d!55179 (= lt!92085 e!122590)))

(declare-fun c!33388 () Bool)

(assert (=> d!55179 (= c!33388 lt!92084)))

(declare-fun containsKey!229 (List!2374 (_ BitVec 64)) Bool)

(assert (=> d!55179 (= lt!92084 (containsKey!229 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))

(assert (=> d!55179 (= (contains!1304 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)) key!828) lt!92083)))

(declare-fun b!186254 () Bool)

(declare-fun lt!92082 () Unit!5610)

(assert (=> b!186254 (= e!122590 lt!92082)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!177 (List!2374 (_ BitVec 64)) Unit!5610)

(assert (=> b!186254 (= lt!92082 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))

(declare-datatypes ((Option!231 0))(
  ( (Some!230 (v!4141 V!5467)) (None!229) )
))
(declare-fun isDefined!178 (Option!231) Bool)

(declare-fun getValueByKey!225 (List!2374 (_ BitVec 64)) Option!231)

(assert (=> b!186254 (isDefined!178 (getValueByKey!225 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))

(declare-fun b!186255 () Bool)

(declare-fun Unit!5615 () Unit!5610)

(assert (=> b!186255 (= e!122590 Unit!5615)))

(declare-fun b!186256 () Bool)

(assert (=> b!186256 (= e!122589 (isDefined!178 (getValueByKey!225 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828)))))

(assert (= (and d!55179 c!33388) b!186254))

(assert (= (and d!55179 (not c!33388)) b!186255))

(assert (= (and d!55179 (not res!88106)) b!186256))

(declare-fun m!213251 () Bool)

(assert (=> d!55179 m!213251))

(declare-fun m!213253 () Bool)

(assert (=> b!186254 m!213253))

(declare-fun m!213255 () Bool)

(assert (=> b!186254 m!213255))

(assert (=> b!186254 m!213255))

(declare-fun m!213257 () Bool)

(assert (=> b!186254 m!213257))

(assert (=> b!186256 m!213255))

(assert (=> b!186256 m!213255))

(assert (=> b!186256 m!213257))

(assert (=> b!186179 d!55179))

(declare-fun b!186299 () Bool)

(declare-fun e!122621 () Bool)

(declare-fun lt!92150 () ListLongMap!2385)

(declare-fun apply!168 (ListLongMap!2385 (_ BitVec 64)) V!5467)

(declare-fun get!2151 (ValueCell!1839 V!5467) V!5467)

(declare-fun dynLambda!511 (Int (_ BitVec 64)) V!5467)

(assert (=> b!186299 (= e!122621 (= (apply!168 lt!92150 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)) (get!2151 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4066 (_values!3781 thiss!1248))))))

(assert (=> b!186299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186300 () Bool)

(declare-fun e!122629 () Bool)

(declare-fun e!122617 () Bool)

(assert (=> b!186300 (= e!122629 e!122617)))

(declare-fun res!88129 () Bool)

(declare-fun call!18782 () Bool)

(assert (=> b!186300 (= res!88129 call!18782)))

(assert (=> b!186300 (=> (not res!88129) (not e!122617))))

(declare-fun b!186302 () Bool)

(declare-fun e!122619 () Unit!5610)

(declare-fun lt!92135 () Unit!5610)

(assert (=> b!186302 (= e!122619 lt!92135)))

(declare-fun lt!92151 () ListLongMap!2385)

(declare-fun getCurrentListMapNoExtraKeys!201 (array!7941 array!7943 (_ BitVec 32) (_ BitVec 32) V!5467 V!5467 (_ BitVec 32) Int) ListLongMap!2385)

(assert (=> b!186302 (= lt!92151 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))

(declare-fun lt!92148 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92142 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92142 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92134 () Unit!5610)

(declare-fun addStillContains!144 (ListLongMap!2385 (_ BitVec 64) V!5467 (_ BitVec 64)) Unit!5610)

(assert (=> b!186302 (= lt!92134 (addStillContains!144 lt!92151 lt!92148 (zeroValue!3639 thiss!1248) lt!92142))))

(declare-fun +!288 (ListLongMap!2385 tuple2!3468) ListLongMap!2385)

(assert (=> b!186302 (contains!1304 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))) lt!92142)))

(declare-fun lt!92146 () Unit!5610)

(assert (=> b!186302 (= lt!92146 lt!92134)))

(declare-fun lt!92139 () ListLongMap!2385)

(assert (=> b!186302 (= lt!92139 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))

(declare-fun lt!92145 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92133 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92133 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92140 () Unit!5610)

(declare-fun addApplyDifferent!144 (ListLongMap!2385 (_ BitVec 64) V!5467 (_ BitVec 64)) Unit!5610)

(assert (=> b!186302 (= lt!92140 (addApplyDifferent!144 lt!92139 lt!92145 (minValue!3639 thiss!1248) lt!92133))))

(assert (=> b!186302 (= (apply!168 (+!288 lt!92139 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))) lt!92133) (apply!168 lt!92139 lt!92133))))

(declare-fun lt!92137 () Unit!5610)

(assert (=> b!186302 (= lt!92137 lt!92140)))

(declare-fun lt!92149 () ListLongMap!2385)

(assert (=> b!186302 (= lt!92149 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))

(declare-fun lt!92130 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92138 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92138 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92131 () Unit!5610)

(assert (=> b!186302 (= lt!92131 (addApplyDifferent!144 lt!92149 lt!92130 (zeroValue!3639 thiss!1248) lt!92138))))

(assert (=> b!186302 (= (apply!168 (+!288 lt!92149 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))) lt!92138) (apply!168 lt!92149 lt!92138))))

(declare-fun lt!92143 () Unit!5610)

(assert (=> b!186302 (= lt!92143 lt!92131)))

(declare-fun lt!92136 () ListLongMap!2385)

(assert (=> b!186302 (= lt!92136 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))

(declare-fun lt!92147 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92147 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92144 () (_ BitVec 64))

(assert (=> b!186302 (= lt!92144 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186302 (= lt!92135 (addApplyDifferent!144 lt!92136 lt!92147 (minValue!3639 thiss!1248) lt!92144))))

(assert (=> b!186302 (= (apply!168 (+!288 lt!92136 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))) lt!92144) (apply!168 lt!92136 lt!92144))))

(declare-fun b!186303 () Bool)

(declare-fun e!122622 () ListLongMap!2385)

(declare-fun call!18783 () ListLongMap!2385)

(assert (=> b!186303 (= e!122622 (+!288 call!18783 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))

(declare-fun bm!18778 () Bool)

(declare-fun call!18781 () ListLongMap!2385)

(declare-fun call!18787 () ListLongMap!2385)

(assert (=> bm!18778 (= call!18781 call!18787)))

(declare-fun b!186304 () Bool)

(declare-fun e!122620 () ListLongMap!2385)

(declare-fun call!18785 () ListLongMap!2385)

(assert (=> b!186304 (= e!122620 call!18785)))

(declare-fun bm!18779 () Bool)

(assert (=> bm!18779 (= call!18787 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))

(declare-fun b!186305 () Bool)

(declare-fun e!122627 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186305 (= e!122627 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18780 () Bool)

(declare-fun call!18784 () Bool)

(assert (=> bm!18780 (= call!18784 (contains!1304 lt!92150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186306 () Bool)

(assert (=> b!186306 (= e!122629 (not call!18782))))

(declare-fun bm!18781 () Bool)

(declare-fun call!18786 () ListLongMap!2385)

(assert (=> bm!18781 (= call!18786 call!18783)))

(declare-fun b!186307 () Bool)

(declare-fun e!122628 () Bool)

(assert (=> b!186307 (= e!122628 (not call!18784))))

(declare-fun b!186308 () Bool)

(declare-fun e!122626 () Bool)

(assert (=> b!186308 (= e!122626 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186301 () Bool)

(declare-fun e!122625 () Bool)

(assert (=> b!186301 (= e!122625 e!122629)))

(declare-fun c!33403 () Bool)

(assert (=> b!186301 (= c!33403 (not (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!55181 () Bool)

(assert (=> d!55181 e!122625))

(declare-fun res!88127 () Bool)

(assert (=> d!55181 (=> (not res!88127) (not e!122625))))

(assert (=> d!55181 (= res!88127 (or (bvsge #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))))

(declare-fun lt!92141 () ListLongMap!2385)

(assert (=> d!55181 (= lt!92150 lt!92141)))

(declare-fun lt!92132 () Unit!5610)

(assert (=> d!55181 (= lt!92132 e!122619)))

(declare-fun c!33406 () Bool)

(assert (=> d!55181 (= c!33406 e!122627)))

(declare-fun res!88131 () Bool)

(assert (=> d!55181 (=> (not res!88131) (not e!122627))))

(assert (=> d!55181 (= res!88131 (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> d!55181 (= lt!92141 e!122622)))

(declare-fun c!33404 () Bool)

(assert (=> d!55181 (= c!33404 (and (not (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55181 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55181 (= (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)) lt!92150)))

(declare-fun b!186309 () Bool)

(assert (=> b!186309 (= e!122617 (= (apply!168 lt!92150 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3639 thiss!1248)))))

(declare-fun b!186310 () Bool)

(declare-fun c!33401 () Bool)

(assert (=> b!186310 (= c!33401 (and (not (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122623 () ListLongMap!2385)

(assert (=> b!186310 (= e!122623 e!122620)))

(declare-fun b!186311 () Bool)

(assert (=> b!186311 (= e!122620 call!18786)))

(declare-fun b!186312 () Bool)

(declare-fun e!122618 () Bool)

(assert (=> b!186312 (= e!122618 (= (apply!168 lt!92150 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3639 thiss!1248)))))

(declare-fun b!186313 () Bool)

(assert (=> b!186313 (= e!122622 e!122623)))

(declare-fun c!33402 () Bool)

(assert (=> b!186313 (= c!33402 (and (not (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18782 () Bool)

(assert (=> bm!18782 (= call!18782 (contains!1304 lt!92150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18783 () Bool)

(assert (=> bm!18783 (= call!18785 call!18781)))

(declare-fun b!186314 () Bool)

(declare-fun e!122624 () Bool)

(assert (=> b!186314 (= e!122624 e!122621)))

(declare-fun res!88128 () Bool)

(assert (=> b!186314 (=> (not res!88128) (not e!122621))))

(assert (=> b!186314 (= res!88128 (contains!1304 lt!92150 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186315 () Bool)

(declare-fun res!88132 () Bool)

(assert (=> b!186315 (=> (not res!88132) (not e!122625))))

(assert (=> b!186315 (= res!88132 e!122624)))

(declare-fun res!88130 () Bool)

(assert (=> b!186315 (=> res!88130 e!122624)))

(assert (=> b!186315 (= res!88130 (not e!122626))))

(declare-fun res!88126 () Bool)

(assert (=> b!186315 (=> (not res!88126) (not e!122626))))

(assert (=> b!186315 (= res!88126 (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186316 () Bool)

(assert (=> b!186316 (= e!122628 e!122618)))

(declare-fun res!88125 () Bool)

(assert (=> b!186316 (= res!88125 call!18784)))

(assert (=> b!186316 (=> (not res!88125) (not e!122618))))

(declare-fun b!186317 () Bool)

(declare-fun Unit!5616 () Unit!5610)

(assert (=> b!186317 (= e!122619 Unit!5616)))

(declare-fun b!186318 () Bool)

(declare-fun res!88133 () Bool)

(assert (=> b!186318 (=> (not res!88133) (not e!122625))))

(assert (=> b!186318 (= res!88133 e!122628)))

(declare-fun c!33405 () Bool)

(assert (=> b!186318 (= c!33405 (not (= (bvand (extraKeys!3535 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186319 () Bool)

(assert (=> b!186319 (= e!122623 call!18786)))

(declare-fun bm!18784 () Bool)

(assert (=> bm!18784 (= call!18783 (+!288 (ite c!33404 call!18787 (ite c!33402 call!18781 call!18785)) (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))

(assert (= (and d!55181 c!33404) b!186303))

(assert (= (and d!55181 (not c!33404)) b!186313))

(assert (= (and b!186313 c!33402) b!186319))

(assert (= (and b!186313 (not c!33402)) b!186310))

(assert (= (and b!186310 c!33401) b!186311))

(assert (= (and b!186310 (not c!33401)) b!186304))

(assert (= (or b!186311 b!186304) bm!18783))

(assert (= (or b!186319 bm!18783) bm!18778))

(assert (= (or b!186319 b!186311) bm!18781))

(assert (= (or b!186303 bm!18778) bm!18779))

(assert (= (or b!186303 bm!18781) bm!18784))

(assert (= (and d!55181 res!88131) b!186305))

(assert (= (and d!55181 c!33406) b!186302))

(assert (= (and d!55181 (not c!33406)) b!186317))

(assert (= (and d!55181 res!88127) b!186315))

(assert (= (and b!186315 res!88126) b!186308))

(assert (= (and b!186315 (not res!88130)) b!186314))

(assert (= (and b!186314 res!88128) b!186299))

(assert (= (and b!186315 res!88132) b!186318))

(assert (= (and b!186318 c!33405) b!186316))

(assert (= (and b!186318 (not c!33405)) b!186307))

(assert (= (and b!186316 res!88125) b!186312))

(assert (= (or b!186316 b!186307) bm!18780))

(assert (= (and b!186318 res!88133) b!186301))

(assert (= (and b!186301 c!33403) b!186300))

(assert (= (and b!186301 (not c!33403)) b!186306))

(assert (= (and b!186300 res!88129) b!186309))

(assert (= (or b!186300 b!186306) bm!18782))

(declare-fun b_lambda!7259 () Bool)

(assert (=> (not b_lambda!7259) (not b!186299)))

(declare-fun t!7262 () Bool)

(declare-fun tb!2847 () Bool)

(assert (=> (and b!186180 (= (defaultEntry!3798 thiss!1248) (defaultEntry!3798 thiss!1248)) t!7262) tb!2847))

(declare-fun result!4819 () Bool)

(assert (=> tb!2847 (= result!4819 tp_is_empty!4365)))

(assert (=> b!186299 t!7262))

(declare-fun b_and!11201 () Bool)

(assert (= b_and!11197 (and (=> t!7262 result!4819) b_and!11201)))

(declare-fun m!213259 () Bool)

(assert (=> b!186309 m!213259))

(declare-fun m!213261 () Bool)

(assert (=> b!186312 m!213261))

(declare-fun m!213263 () Bool)

(assert (=> bm!18782 m!213263))

(declare-fun m!213265 () Bool)

(assert (=> b!186314 m!213265))

(assert (=> b!186314 m!213265))

(declare-fun m!213267 () Bool)

(assert (=> b!186314 m!213267))

(declare-fun m!213269 () Bool)

(assert (=> bm!18779 m!213269))

(declare-fun m!213271 () Bool)

(assert (=> bm!18780 m!213271))

(declare-fun m!213273 () Bool)

(assert (=> b!186302 m!213273))

(declare-fun m!213275 () Bool)

(assert (=> b!186302 m!213275))

(declare-fun m!213277 () Bool)

(assert (=> b!186302 m!213277))

(declare-fun m!213279 () Bool)

(assert (=> b!186302 m!213279))

(declare-fun m!213281 () Bool)

(assert (=> b!186302 m!213281))

(declare-fun m!213283 () Bool)

(assert (=> b!186302 m!213283))

(declare-fun m!213285 () Bool)

(assert (=> b!186302 m!213285))

(declare-fun m!213287 () Bool)

(assert (=> b!186302 m!213287))

(assert (=> b!186302 m!213287))

(declare-fun m!213289 () Bool)

(assert (=> b!186302 m!213289))

(assert (=> b!186302 m!213269))

(assert (=> b!186302 m!213277))

(assert (=> b!186302 m!213283))

(declare-fun m!213291 () Bool)

(assert (=> b!186302 m!213291))

(declare-fun m!213293 () Bool)

(assert (=> b!186302 m!213293))

(declare-fun m!213295 () Bool)

(assert (=> b!186302 m!213295))

(declare-fun m!213297 () Bool)

(assert (=> b!186302 m!213297))

(assert (=> b!186302 m!213265))

(declare-fun m!213299 () Bool)

(assert (=> b!186302 m!213299))

(assert (=> b!186302 m!213297))

(declare-fun m!213301 () Bool)

(assert (=> b!186302 m!213301))

(assert (=> d!55181 m!213181))

(declare-fun m!213303 () Bool)

(assert (=> b!186299 m!213303))

(assert (=> b!186299 m!213265))

(declare-fun m!213305 () Bool)

(assert (=> b!186299 m!213305))

(assert (=> b!186299 m!213303))

(declare-fun m!213307 () Bool)

(assert (=> b!186299 m!213307))

(assert (=> b!186299 m!213265))

(declare-fun m!213309 () Bool)

(assert (=> b!186299 m!213309))

(assert (=> b!186299 m!213305))

(assert (=> b!186305 m!213265))

(assert (=> b!186305 m!213265))

(declare-fun m!213311 () Bool)

(assert (=> b!186305 m!213311))

(declare-fun m!213313 () Bool)

(assert (=> bm!18784 m!213313))

(declare-fun m!213315 () Bool)

(assert (=> b!186303 m!213315))

(assert (=> b!186308 m!213265))

(assert (=> b!186308 m!213265))

(assert (=> b!186308 m!213311))

(assert (=> b!186179 d!55181))

(declare-fun b!186338 () Bool)

(declare-fun e!122641 () Bool)

(declare-fun e!122638 () Bool)

(assert (=> b!186338 (= e!122641 e!122638)))

(declare-fun res!88142 () Bool)

(declare-fun call!18792 () Bool)

(assert (=> b!186338 (= res!88142 call!18792)))

(assert (=> b!186338 (=> (not res!88142) (not e!122638))))

(declare-fun b!186339 () Bool)

(declare-fun res!88144 () Bool)

(declare-fun e!122639 () Bool)

(assert (=> b!186339 (=> (not res!88144) (not e!122639))))

(declare-fun lt!92156 () SeekEntryResult!642)

(assert (=> b!186339 (= res!88144 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4741 lt!92156)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186339 (and (bvsge (index!4741 lt!92156) #b00000000000000000000000000000000) (bvslt (index!4741 lt!92156) (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186340 () Bool)

(declare-fun e!122640 () Bool)

(assert (=> b!186340 (= e!122641 e!122640)))

(declare-fun c!33411 () Bool)

(assert (=> b!186340 (= c!33411 ((_ is MissingVacant!642) lt!92156))))

(declare-fun b!186341 () Bool)

(assert (=> b!186341 (and (bvsge (index!4738 lt!92156) #b00000000000000000000000000000000) (bvslt (index!4738 lt!92156) (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun res!88145 () Bool)

(assert (=> b!186341 (= res!88145 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4738 lt!92156)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186341 (=> (not res!88145) (not e!122638))))

(declare-fun b!186342 () Bool)

(assert (=> b!186342 (= e!122640 ((_ is Undefined!642) lt!92156))))

(declare-fun bm!18789 () Bool)

(declare-fun call!18793 () Bool)

(declare-fun arrayContainsKey!0 (array!7941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18789 (= call!18793 (arrayContainsKey!0 (_keys!5740 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun d!55183 () Bool)

(assert (=> d!55183 e!122641))

(declare-fun c!33412 () Bool)

(assert (=> d!55183 (= c!33412 ((_ is MissingZero!642) lt!92156))))

(assert (=> d!55183 (= lt!92156 (seekEntryOrOpen!0 key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun lt!92157 () Unit!5610)

(declare-fun choose!985 (array!7941 array!7943 (_ BitVec 32) (_ BitVec 32) V!5467 V!5467 (_ BitVec 64) Int) Unit!5610)

(assert (=> d!55183 (= lt!92157 (choose!985 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)))))

(assert (=> d!55183 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55183 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!147 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)) lt!92157)))

(declare-fun b!186343 () Bool)

(assert (=> b!186343 (= e!122638 (not call!18793))))

(declare-fun bm!18790 () Bool)

(assert (=> bm!18790 (= call!18792 (inRange!0 (ite c!33412 (index!4738 lt!92156) (index!4741 lt!92156)) (mask!8920 thiss!1248)))))

(declare-fun b!186344 () Bool)

(assert (=> b!186344 (= e!122639 (not call!18793))))

(declare-fun b!186345 () Bool)

(declare-fun res!88143 () Bool)

(assert (=> b!186345 (=> (not res!88143) (not e!122639))))

(assert (=> b!186345 (= res!88143 call!18792)))

(assert (=> b!186345 (= e!122640 e!122639)))

(assert (= (and d!55183 c!33412) b!186338))

(assert (= (and d!55183 (not c!33412)) b!186340))

(assert (= (and b!186338 res!88142) b!186341))

(assert (= (and b!186341 res!88145) b!186343))

(assert (= (and b!186340 c!33411) b!186345))

(assert (= (and b!186340 (not c!33411)) b!186342))

(assert (= (and b!186345 res!88143) b!186339))

(assert (= (and b!186339 res!88144) b!186344))

(assert (= (or b!186338 b!186345) bm!18790))

(assert (= (or b!186343 b!186344) bm!18789))

(declare-fun m!213317 () Bool)

(assert (=> bm!18789 m!213317))

(declare-fun m!213319 () Bool)

(assert (=> b!186339 m!213319))

(declare-fun m!213321 () Bool)

(assert (=> b!186341 m!213321))

(declare-fun m!213323 () Bool)

(assert (=> bm!18790 m!213323))

(assert (=> d!55183 m!213187))

(declare-fun m!213325 () Bool)

(assert (=> d!55183 m!213325))

(assert (=> d!55183 m!213181))

(assert (=> b!186175 d!55183))

(declare-fun condMapEmpty!7518 () Bool)

(declare-fun mapDefault!7518 () ValueCell!1839)

(assert (=> mapNonEmpty!7512 (= condMapEmpty!7518 (= mapRest!7512 ((as const (Array (_ BitVec 32) ValueCell!1839)) mapDefault!7518)))))

(declare-fun e!122646 () Bool)

(declare-fun mapRes!7518 () Bool)

(assert (=> mapNonEmpty!7512 (= tp!16580 (and e!122646 mapRes!7518))))

(declare-fun b!186352 () Bool)

(declare-fun e!122647 () Bool)

(assert (=> b!186352 (= e!122647 tp_is_empty!4365)))

(declare-fun b!186353 () Bool)

(assert (=> b!186353 (= e!122646 tp_is_empty!4365)))

(declare-fun mapNonEmpty!7518 () Bool)

(declare-fun tp!16590 () Bool)

(assert (=> mapNonEmpty!7518 (= mapRes!7518 (and tp!16590 e!122647))))

(declare-fun mapKey!7518 () (_ BitVec 32))

(declare-fun mapValue!7518 () ValueCell!1839)

(declare-fun mapRest!7518 () (Array (_ BitVec 32) ValueCell!1839))

(assert (=> mapNonEmpty!7518 (= mapRest!7512 (store mapRest!7518 mapKey!7518 mapValue!7518))))

(declare-fun mapIsEmpty!7518 () Bool)

(assert (=> mapIsEmpty!7518 mapRes!7518))

(assert (= (and mapNonEmpty!7512 condMapEmpty!7518) mapIsEmpty!7518))

(assert (= (and mapNonEmpty!7512 (not condMapEmpty!7518)) mapNonEmpty!7518))

(assert (= (and mapNonEmpty!7518 ((_ is ValueCellFull!1839) mapValue!7518)) b!186352))

(assert (= (and mapNonEmpty!7512 ((_ is ValueCellFull!1839) mapDefault!7518)) b!186353))

(declare-fun m!213327 () Bool)

(assert (=> mapNonEmpty!7518 m!213327))

(declare-fun b_lambda!7261 () Bool)

(assert (= b_lambda!7259 (or (and b!186180 b_free!4593) b_lambda!7261)))

(check-sat (not d!55165) (not b!186256) (not b!186303) (not d!55179) (not b!186245) (not b!186229) (not mapNonEmpty!7518) (not d!55181) (not d!55171) (not bm!18784) (not b!186305) (not b!186299) (not b!186308) (not b_lambda!7261) (not d!55175) (not bm!18779) (not b!186246) (not b!186247) (not b!186254) (not bm!18780) (not b_next!4593) (not bm!18782) (not d!55183) (not b!186237) (not b!186312) (not bm!18789) (not b!186314) (not bm!18790) (not b!186302) (not b!186309) tp_is_empty!4365 b_and!11201)
(check-sat b_and!11201 (not b_next!4593))
(get-model)

(declare-fun d!55185 () Bool)

(declare-fun e!122648 () Bool)

(assert (=> d!55185 e!122648))

(declare-fun res!88146 () Bool)

(assert (=> d!55185 (=> res!88146 e!122648)))

(declare-fun lt!92159 () Bool)

(assert (=> d!55185 (= res!88146 (not lt!92159))))

(declare-fun lt!92160 () Bool)

(assert (=> d!55185 (= lt!92159 lt!92160)))

(declare-fun lt!92161 () Unit!5610)

(declare-fun e!122649 () Unit!5610)

(assert (=> d!55185 (= lt!92161 e!122649)))

(declare-fun c!33413 () Bool)

(assert (=> d!55185 (= c!33413 lt!92160)))

(assert (=> d!55185 (= lt!92160 (containsKey!229 (toList!1208 lt!92150) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55185 (= (contains!1304 lt!92150 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92159)))

(declare-fun b!186354 () Bool)

(declare-fun lt!92158 () Unit!5610)

(assert (=> b!186354 (= e!122649 lt!92158)))

(assert (=> b!186354 (= lt!92158 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1208 lt!92150) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186354 (isDefined!178 (getValueByKey!225 (toList!1208 lt!92150) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186355 () Bool)

(declare-fun Unit!5617 () Unit!5610)

(assert (=> b!186355 (= e!122649 Unit!5617)))

(declare-fun b!186356 () Bool)

(assert (=> b!186356 (= e!122648 (isDefined!178 (getValueByKey!225 (toList!1208 lt!92150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55185 c!33413) b!186354))

(assert (= (and d!55185 (not c!33413)) b!186355))

(assert (= (and d!55185 (not res!88146)) b!186356))

(declare-fun m!213329 () Bool)

(assert (=> d!55185 m!213329))

(declare-fun m!213331 () Bool)

(assert (=> b!186354 m!213331))

(declare-fun m!213333 () Bool)

(assert (=> b!186354 m!213333))

(assert (=> b!186354 m!213333))

(declare-fun m!213335 () Bool)

(assert (=> b!186354 m!213335))

(assert (=> b!186356 m!213333))

(assert (=> b!186356 m!213333))

(assert (=> b!186356 m!213335))

(assert (=> bm!18780 d!55185))

(declare-fun d!55187 () Bool)

(assert (=> d!55187 (= (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186305 d!55187))

(declare-fun d!55189 () Bool)

(declare-fun isEmpty!471 (Option!231) Bool)

(assert (=> d!55189 (= (isDefined!178 (getValueByKey!225 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828)) (not (isEmpty!471 (getValueByKey!225 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))))

(declare-fun bs!7531 () Bool)

(assert (= bs!7531 d!55189))

(assert (=> bs!7531 m!213255))

(declare-fun m!213337 () Bool)

(assert (=> bs!7531 m!213337))

(assert (=> b!186256 d!55189))

(declare-fun b!186368 () Bool)

(declare-fun e!122655 () Option!231)

(assert (=> b!186368 (= e!122655 None!229)))

(declare-fun d!55191 () Bool)

(declare-fun c!33418 () Bool)

(assert (=> d!55191 (= c!33418 (and ((_ is Cons!2370) (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))) (= (_1!1745 (h!3003 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))))) key!828)))))

(declare-fun e!122654 () Option!231)

(assert (=> d!55191 (= (getValueByKey!225 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828) e!122654)))

(declare-fun b!186366 () Bool)

(assert (=> b!186366 (= e!122654 e!122655)))

(declare-fun c!33419 () Bool)

(assert (=> b!186366 (= c!33419 (and ((_ is Cons!2370) (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))) (not (= (_1!1745 (h!3003 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))))) key!828))))))

(declare-fun b!186367 () Bool)

(assert (=> b!186367 (= e!122655 (getValueByKey!225 (t!7260 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))) key!828))))

(declare-fun b!186365 () Bool)

(assert (=> b!186365 (= e!122654 (Some!230 (_2!1745 (h!3003 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))))))

(assert (= (and d!55191 c!33418) b!186365))

(assert (= (and d!55191 (not c!33418)) b!186366))

(assert (= (and b!186366 c!33419) b!186367))

(assert (= (and b!186366 (not c!33419)) b!186368))

(declare-fun m!213339 () Bool)

(assert (=> b!186367 m!213339))

(assert (=> b!186256 d!55191))

(declare-fun b!186381 () Bool)

(declare-fun e!122664 () SeekEntryResult!642)

(assert (=> b!186381 (= e!122664 (MissingVacant!642 (index!4740 lt!92067)))))

(declare-fun b!186382 () Bool)

(declare-fun e!122662 () SeekEntryResult!642)

(declare-fun e!122663 () SeekEntryResult!642)

(assert (=> b!186382 (= e!122662 e!122663)))

(declare-fun c!33427 () Bool)

(declare-fun lt!92166 () (_ BitVec 64))

(assert (=> b!186382 (= c!33427 (= lt!92166 key!828))))

(declare-fun b!186383 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186383 (= e!122664 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20206 lt!92067) #b00000000000000000000000000000001) (nextIndex!0 (index!4740 lt!92067) (x!20206 lt!92067) (mask!8920 thiss!1248)) (index!4740 lt!92067) key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun b!186384 () Bool)

(assert (=> b!186384 (= e!122663 (Found!642 (index!4740 lt!92067)))))

(declare-fun b!186385 () Bool)

(assert (=> b!186385 (= e!122662 Undefined!642)))

(declare-fun b!186386 () Bool)

(declare-fun c!33428 () Bool)

(assert (=> b!186386 (= c!33428 (= lt!92166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186386 (= e!122663 e!122664)))

(declare-fun d!55193 () Bool)

(declare-fun lt!92167 () SeekEntryResult!642)

(assert (=> d!55193 (and (or ((_ is Undefined!642) lt!92167) (not ((_ is Found!642) lt!92167)) (and (bvsge (index!4739 lt!92167) #b00000000000000000000000000000000) (bvslt (index!4739 lt!92167) (size!4065 (_keys!5740 thiss!1248))))) (or ((_ is Undefined!642) lt!92167) ((_ is Found!642) lt!92167) (not ((_ is MissingVacant!642) lt!92167)) (not (= (index!4741 lt!92167) (index!4740 lt!92067))) (and (bvsge (index!4741 lt!92167) #b00000000000000000000000000000000) (bvslt (index!4741 lt!92167) (size!4065 (_keys!5740 thiss!1248))))) (or ((_ is Undefined!642) lt!92167) (ite ((_ is Found!642) lt!92167) (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4739 lt!92167)) key!828) (and ((_ is MissingVacant!642) lt!92167) (= (index!4741 lt!92167) (index!4740 lt!92067)) (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4741 lt!92167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55193 (= lt!92167 e!122662)))

(declare-fun c!33426 () Bool)

(assert (=> d!55193 (= c!33426 (bvsge (x!20206 lt!92067) #b01111111111111111111111111111110))))

(assert (=> d!55193 (= lt!92166 (select (arr!3749 (_keys!5740 thiss!1248)) (index!4740 lt!92067)))))

(assert (=> d!55193 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55193 (= (seekKeyOrZeroReturnVacant!0 (x!20206 lt!92067) (index!4740 lt!92067) (index!4740 lt!92067) key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)) lt!92167)))

(assert (= (and d!55193 c!33426) b!186385))

(assert (= (and d!55193 (not c!33426)) b!186382))

(assert (= (and b!186382 c!33427) b!186384))

(assert (= (and b!186382 (not c!33427)) b!186386))

(assert (= (and b!186386 c!33428) b!186381))

(assert (= (and b!186386 (not c!33428)) b!186383))

(declare-fun m!213341 () Bool)

(assert (=> b!186383 m!213341))

(assert (=> b!186383 m!213341))

(declare-fun m!213343 () Bool)

(assert (=> b!186383 m!213343))

(declare-fun m!213345 () Bool)

(assert (=> d!55193 m!213345))

(declare-fun m!213347 () Bool)

(assert (=> d!55193 m!213347))

(assert (=> d!55193 m!213223))

(assert (=> d!55193 m!213181))

(assert (=> b!186229 d!55193))

(declare-fun b!186411 () Bool)

(declare-fun e!122683 () Bool)

(assert (=> b!186411 (= e!122683 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186411 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!186412 () Bool)

(declare-fun e!122684 () Bool)

(declare-fun e!122682 () Bool)

(assert (=> b!186412 (= e!122684 e!122682)))

(declare-fun c!33440 () Bool)

(assert (=> b!186412 (= c!33440 e!122683)))

(declare-fun res!88155 () Bool)

(assert (=> b!186412 (=> (not res!88155) (not e!122683))))

(assert (=> b!186412 (= res!88155 (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186413 () Bool)

(declare-fun e!122681 () ListLongMap!2385)

(assert (=> b!186413 (= e!122681 (ListLongMap!2386 Nil!2371))))

(declare-fun d!55195 () Bool)

(assert (=> d!55195 e!122684))

(declare-fun res!88157 () Bool)

(assert (=> d!55195 (=> (not res!88157) (not e!122684))))

(declare-fun lt!92182 () ListLongMap!2385)

(assert (=> d!55195 (= res!88157 (not (contains!1304 lt!92182 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55195 (= lt!92182 e!122681)))

(declare-fun c!33438 () Bool)

(assert (=> d!55195 (= c!33438 (bvsge #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> d!55195 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55195 (= (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)) lt!92182)))

(declare-fun b!186414 () Bool)

(declare-fun e!122680 () Bool)

(assert (=> b!186414 (= e!122682 e!122680)))

(assert (=> b!186414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun res!88156 () Bool)

(assert (=> b!186414 (= res!88156 (contains!1304 lt!92182 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186414 (=> (not res!88156) (not e!122680))))

(declare-fun b!186415 () Bool)

(assert (=> b!186415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> b!186415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4066 (_values!3781 thiss!1248))))))

(assert (=> b!186415 (= e!122680 (= (apply!168 lt!92182 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)) (get!2151 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!186416 () Bool)

(declare-fun res!88158 () Bool)

(assert (=> b!186416 (=> (not res!88158) (not e!122684))))

(assert (=> b!186416 (= res!88158 (not (contains!1304 lt!92182 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186417 () Bool)

(declare-fun e!122679 () Bool)

(declare-fun isEmpty!472 (ListLongMap!2385) Bool)

(assert (=> b!186417 (= e!122679 (isEmpty!472 lt!92182))))

(declare-fun b!186418 () Bool)

(declare-fun e!122685 () ListLongMap!2385)

(assert (=> b!186418 (= e!122681 e!122685)))

(declare-fun c!33437 () Bool)

(assert (=> b!186418 (= c!33437 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186419 () Bool)

(assert (=> b!186419 (= e!122682 e!122679)))

(declare-fun c!33439 () Bool)

(assert (=> b!186419 (= c!33439 (bvslt #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun bm!18793 () Bool)

(declare-fun call!18796 () ListLongMap!2385)

(assert (=> bm!18793 (= call!18796 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3798 thiss!1248)))))

(declare-fun b!186420 () Bool)

(assert (=> b!186420 (= e!122685 call!18796)))

(declare-fun b!186421 () Bool)

(assert (=> b!186421 (= e!122679 (= lt!92182 (getCurrentListMapNoExtraKeys!201 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3798 thiss!1248))))))

(declare-fun b!186422 () Bool)

(declare-fun lt!92185 () Unit!5610)

(declare-fun lt!92187 () Unit!5610)

(assert (=> b!186422 (= lt!92185 lt!92187)))

(declare-fun lt!92186 () ListLongMap!2385)

(declare-fun lt!92184 () V!5467)

(declare-fun lt!92188 () (_ BitVec 64))

(declare-fun lt!92183 () (_ BitVec 64))

(assert (=> b!186422 (not (contains!1304 (+!288 lt!92186 (tuple2!3469 lt!92183 lt!92184)) lt!92188))))

(declare-fun addStillNotContains!89 (ListLongMap!2385 (_ BitVec 64) V!5467 (_ BitVec 64)) Unit!5610)

(assert (=> b!186422 (= lt!92187 (addStillNotContains!89 lt!92186 lt!92183 lt!92184 lt!92188))))

(assert (=> b!186422 (= lt!92188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!186422 (= lt!92184 (get!2151 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186422 (= lt!92183 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186422 (= lt!92186 call!18796)))

(assert (=> b!186422 (= e!122685 (+!288 call!18796 (tuple2!3469 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000) (get!2151 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55195 c!33438) b!186413))

(assert (= (and d!55195 (not c!33438)) b!186418))

(assert (= (and b!186418 c!33437) b!186422))

(assert (= (and b!186418 (not c!33437)) b!186420))

(assert (= (or b!186422 b!186420) bm!18793))

(assert (= (and d!55195 res!88157) b!186416))

(assert (= (and b!186416 res!88158) b!186412))

(assert (= (and b!186412 res!88155) b!186411))

(assert (= (and b!186412 c!33440) b!186414))

(assert (= (and b!186412 (not c!33440)) b!186419))

(assert (= (and b!186414 res!88156) b!186415))

(assert (= (and b!186419 c!33439) b!186421))

(assert (= (and b!186419 (not c!33439)) b!186417))

(declare-fun b_lambda!7263 () Bool)

(assert (=> (not b_lambda!7263) (not b!186415)))

(assert (=> b!186415 t!7262))

(declare-fun b_and!11203 () Bool)

(assert (= b_and!11201 (and (=> t!7262 result!4819) b_and!11203)))

(declare-fun b_lambda!7265 () Bool)

(assert (=> (not b_lambda!7265) (not b!186422)))

(assert (=> b!186422 t!7262))

(declare-fun b_and!11205 () Bool)

(assert (= b_and!11203 (and (=> t!7262 result!4819) b_and!11205)))

(declare-fun m!213349 () Bool)

(assert (=> b!186422 m!213349))

(assert (=> b!186422 m!213265))

(assert (=> b!186422 m!213305))

(declare-fun m!213351 () Bool)

(assert (=> b!186422 m!213351))

(declare-fun m!213353 () Bool)

(assert (=> b!186422 m!213353))

(assert (=> b!186422 m!213351))

(declare-fun m!213355 () Bool)

(assert (=> b!186422 m!213355))

(assert (=> b!186422 m!213303))

(assert (=> b!186422 m!213305))

(assert (=> b!186422 m!213303))

(assert (=> b!186422 m!213307))

(declare-fun m!213357 () Bool)

(assert (=> b!186417 m!213357))

(assert (=> b!186411 m!213265))

(assert (=> b!186411 m!213265))

(assert (=> b!186411 m!213311))

(declare-fun m!213359 () Bool)

(assert (=> b!186416 m!213359))

(declare-fun m!213361 () Bool)

(assert (=> bm!18793 m!213361))

(declare-fun m!213363 () Bool)

(assert (=> d!55195 m!213363))

(assert (=> d!55195 m!213181))

(assert (=> b!186415 m!213265))

(declare-fun m!213365 () Bool)

(assert (=> b!186415 m!213365))

(assert (=> b!186415 m!213265))

(assert (=> b!186415 m!213305))

(assert (=> b!186415 m!213303))

(assert (=> b!186415 m!213305))

(assert (=> b!186415 m!213303))

(assert (=> b!186415 m!213307))

(assert (=> b!186414 m!213265))

(assert (=> b!186414 m!213265))

(declare-fun m!213367 () Bool)

(assert (=> b!186414 m!213367))

(assert (=> b!186418 m!213265))

(assert (=> b!186418 m!213265))

(assert (=> b!186418 m!213311))

(assert (=> b!186421 m!213361))

(assert (=> bm!18779 d!55195))

(declare-fun d!55197 () Bool)

(assert (=> d!55197 (isDefined!178 (getValueByKey!225 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))

(declare-fun lt!92191 () Unit!5610)

(declare-fun choose!986 (List!2374 (_ BitVec 64)) Unit!5610)

(assert (=> d!55197 (= lt!92191 (choose!986 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))

(declare-fun e!122688 () Bool)

(assert (=> d!55197 e!122688))

(declare-fun res!88161 () Bool)

(assert (=> d!55197 (=> (not res!88161) (not e!122688))))

(declare-fun isStrictlySorted!349 (List!2374) Bool)

(assert (=> d!55197 (= res!88161 (isStrictlySorted!349 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))))))

(assert (=> d!55197 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828) lt!92191)))

(declare-fun b!186425 () Bool)

(assert (=> b!186425 (= e!122688 (containsKey!229 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828))))

(assert (= (and d!55197 res!88161) b!186425))

(assert (=> d!55197 m!213255))

(assert (=> d!55197 m!213255))

(assert (=> d!55197 m!213257))

(declare-fun m!213369 () Bool)

(assert (=> d!55197 m!213369))

(declare-fun m!213371 () Bool)

(assert (=> d!55197 m!213371))

(assert (=> b!186425 m!213251))

(assert (=> b!186254 d!55197))

(assert (=> b!186254 d!55189))

(assert (=> b!186254 d!55191))

(declare-fun d!55199 () Bool)

(declare-fun e!122691 () Bool)

(assert (=> d!55199 e!122691))

(declare-fun res!88167 () Bool)

(assert (=> d!55199 (=> (not res!88167) (not e!122691))))

(declare-fun lt!92202 () ListLongMap!2385)

(assert (=> d!55199 (= res!88167 (contains!1304 lt!92202 (_1!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))))

(declare-fun lt!92201 () List!2374)

(assert (=> d!55199 (= lt!92202 (ListLongMap!2386 lt!92201))))

(declare-fun lt!92203 () Unit!5610)

(declare-fun lt!92200 () Unit!5610)

(assert (=> d!55199 (= lt!92203 lt!92200)))

(assert (=> d!55199 (= (getValueByKey!225 lt!92201 (_1!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))) (Some!230 (_2!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!117 (List!2374 (_ BitVec 64) V!5467) Unit!5610)

(assert (=> d!55199 (= lt!92200 (lemmaContainsTupThenGetReturnValue!117 lt!92201 (_1!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))) (_2!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))))

(declare-fun insertStrictlySorted!120 (List!2374 (_ BitVec 64) V!5467) List!2374)

(assert (=> d!55199 (= lt!92201 (insertStrictlySorted!120 (toList!1208 (ite c!33404 call!18787 (ite c!33402 call!18781 call!18785))) (_1!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))) (_2!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))))

(assert (=> d!55199 (= (+!288 (ite c!33404 call!18787 (ite c!33402 call!18781 call!18785)) (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))) lt!92202)))

(declare-fun b!186430 () Bool)

(declare-fun res!88166 () Bool)

(assert (=> b!186430 (=> (not res!88166) (not e!122691))))

(assert (=> b!186430 (= res!88166 (= (getValueByKey!225 (toList!1208 lt!92202) (_1!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))) (Some!230 (_2!1745 (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))))

(declare-fun b!186431 () Bool)

(declare-fun contains!1305 (List!2374 tuple2!3468) Bool)

(assert (=> b!186431 (= e!122691 (contains!1305 (toList!1208 lt!92202) (ite (or c!33404 c!33402) (tuple2!3469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3639 thiss!1248)) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))

(assert (= (and d!55199 res!88167) b!186430))

(assert (= (and b!186430 res!88166) b!186431))

(declare-fun m!213373 () Bool)

(assert (=> d!55199 m!213373))

(declare-fun m!213375 () Bool)

(assert (=> d!55199 m!213375))

(declare-fun m!213377 () Bool)

(assert (=> d!55199 m!213377))

(declare-fun m!213379 () Bool)

(assert (=> d!55199 m!213379))

(declare-fun m!213381 () Bool)

(assert (=> b!186430 m!213381))

(declare-fun m!213383 () Bool)

(assert (=> b!186431 m!213383))

(assert (=> bm!18784 d!55199))

(assert (=> d!55171 d!55165))

(declare-fun d!55201 () Bool)

(declare-fun e!122694 () Bool)

(assert (=> d!55201 e!122694))

(declare-fun res!88173 () Bool)

(assert (=> d!55201 (=> (not res!88173) (not e!122694))))

(declare-fun lt!92206 () SeekEntryResult!642)

(assert (=> d!55201 (= res!88173 ((_ is Found!642) lt!92206))))

(assert (=> d!55201 (= lt!92206 (seekEntryOrOpen!0 key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(assert (=> d!55201 true))

(declare-fun _$33!126 () Unit!5610)

(assert (=> d!55201 (= (choose!984 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)) _$33!126)))

(declare-fun b!186436 () Bool)

(declare-fun res!88172 () Bool)

(assert (=> b!186436 (=> (not res!88172) (not e!122694))))

(assert (=> b!186436 (= res!88172 (inRange!0 (index!4739 lt!92206) (mask!8920 thiss!1248)))))

(declare-fun b!186437 () Bool)

(assert (=> b!186437 (= e!122694 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4739 lt!92206)) key!828))))

(assert (= (and d!55201 res!88173) b!186436))

(assert (= (and b!186436 res!88172) b!186437))

(assert (=> d!55201 m!213187))

(declare-fun m!213385 () Bool)

(assert (=> b!186436 m!213385))

(declare-fun m!213387 () Bool)

(assert (=> b!186437 m!213387))

(assert (=> d!55171 d!55201))

(assert (=> d!55171 d!55177))

(declare-fun d!55203 () Bool)

(declare-fun get!2152 (Option!231) V!5467)

(assert (=> d!55203 (= (apply!168 lt!92150 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2152 (getValueByKey!225 (toList!1208 lt!92150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7532 () Bool)

(assert (= bs!7532 d!55203))

(declare-fun m!213389 () Bool)

(assert (=> bs!7532 m!213389))

(assert (=> bs!7532 m!213389))

(declare-fun m!213391 () Bool)

(assert (=> bs!7532 m!213391))

(assert (=> b!186309 d!55203))

(declare-fun d!55205 () Bool)

(declare-fun res!88178 () Bool)

(declare-fun e!122699 () Bool)

(assert (=> d!55205 (=> res!88178 e!122699)))

(assert (=> d!55205 (= res!88178 (and ((_ is Cons!2370) (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))) (= (_1!1745 (h!3003 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))))) key!828)))))

(assert (=> d!55205 (= (containsKey!229 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))) key!828) e!122699)))

(declare-fun b!186442 () Bool)

(declare-fun e!122700 () Bool)

(assert (=> b!186442 (= e!122699 e!122700)))

(declare-fun res!88179 () Bool)

(assert (=> b!186442 (=> (not res!88179) (not e!122700))))

(assert (=> b!186442 (= res!88179 (and (or (not ((_ is Cons!2370) (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))))) (bvsle (_1!1745 (h!3003 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))))) key!828)) ((_ is Cons!2370) (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))) (bvslt (_1!1745 (h!3003 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248))))) key!828)))))

(declare-fun b!186443 () Bool)

(assert (=> b!186443 (= e!122700 (containsKey!229 (t!7260 (toList!1208 (getCurrentListMap!856 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3798 thiss!1248)))) key!828))))

(assert (= (and d!55205 (not res!88178)) b!186442))

(assert (= (and b!186442 res!88179) b!186443))

(declare-fun m!213393 () Bool)

(assert (=> b!186443 m!213393))

(assert (=> d!55179 d!55205))

(assert (=> b!186308 d!55187))

(declare-fun d!55207 () Bool)

(assert (=> d!55207 (= (inRange!0 (ite c!33412 (index!4738 lt!92156) (index!4741 lt!92156)) (mask!8920 thiss!1248)) (and (bvsge (ite c!33412 (index!4738 lt!92156) (index!4741 lt!92156)) #b00000000000000000000000000000000) (bvslt (ite c!33412 (index!4738 lt!92156) (index!4741 lt!92156)) (bvadd (mask!8920 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18790 d!55207))

(declare-fun d!55209 () Bool)

(declare-fun res!88184 () Bool)

(declare-fun e!122705 () Bool)

(assert (=> d!55209 (=> res!88184 e!122705)))

(assert (=> d!55209 (= res!88184 (= (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55209 (= (arrayContainsKey!0 (_keys!5740 thiss!1248) key!828 #b00000000000000000000000000000000) e!122705)))

(declare-fun b!186448 () Bool)

(declare-fun e!122706 () Bool)

(assert (=> b!186448 (= e!122705 e!122706)))

(declare-fun res!88185 () Bool)

(assert (=> b!186448 (=> (not res!88185) (not e!122706))))

(assert (=> b!186448 (= res!88185 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186449 () Bool)

(assert (=> b!186449 (= e!122706 (arrayContainsKey!0 (_keys!5740 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55209 (not res!88184)) b!186448))

(assert (= (and b!186448 res!88185) b!186449))

(assert (=> d!55209 m!213265))

(declare-fun m!213395 () Bool)

(assert (=> b!186449 m!213395))

(assert (=> bm!18789 d!55209))

(declare-fun bm!18796 () Bool)

(declare-fun call!18799 () Bool)

(declare-fun c!33443 () Bool)

(assert (=> bm!18796 (= call!18799 (arrayNoDuplicates!0 (_keys!5740 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33443 (Cons!2371 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000) Nil!2372) Nil!2372)))))

(declare-fun b!186460 () Bool)

(declare-fun e!122718 () Bool)

(declare-fun contains!1306 (List!2375 (_ BitVec 64)) Bool)

(assert (=> b!186460 (= e!122718 (contains!1306 Nil!2372 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186461 () Bool)

(declare-fun e!122716 () Bool)

(assert (=> b!186461 (= e!122716 call!18799)))

(declare-fun d!55211 () Bool)

(declare-fun res!88193 () Bool)

(declare-fun e!122715 () Bool)

(assert (=> d!55211 (=> res!88193 e!122715)))

(assert (=> d!55211 (= res!88193 (bvsge #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> d!55211 (= (arrayNoDuplicates!0 (_keys!5740 thiss!1248) #b00000000000000000000000000000000 Nil!2372) e!122715)))

(declare-fun b!186462 () Bool)

(declare-fun e!122717 () Bool)

(assert (=> b!186462 (= e!122715 e!122717)))

(declare-fun res!88192 () Bool)

(assert (=> b!186462 (=> (not res!88192) (not e!122717))))

(assert (=> b!186462 (= res!88192 (not e!122718))))

(declare-fun res!88194 () Bool)

(assert (=> b!186462 (=> (not res!88194) (not e!122718))))

(assert (=> b!186462 (= res!88194 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186463 () Bool)

(assert (=> b!186463 (= e!122716 call!18799)))

(declare-fun b!186464 () Bool)

(assert (=> b!186464 (= e!122717 e!122716)))

(assert (=> b!186464 (= c!33443 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55211 (not res!88193)) b!186462))

(assert (= (and b!186462 res!88194) b!186460))

(assert (= (and b!186462 res!88192) b!186464))

(assert (= (and b!186464 c!33443) b!186461))

(assert (= (and b!186464 (not c!33443)) b!186463))

(assert (= (or b!186461 b!186463) bm!18796))

(assert (=> bm!18796 m!213265))

(declare-fun m!213397 () Bool)

(assert (=> bm!18796 m!213397))

(assert (=> b!186460 m!213265))

(assert (=> b!186460 m!213265))

(declare-fun m!213399 () Bool)

(assert (=> b!186460 m!213399))

(assert (=> b!186462 m!213265))

(assert (=> b!186462 m!213265))

(assert (=> b!186462 m!213311))

(assert (=> b!186464 m!213265))

(assert (=> b!186464 m!213265))

(assert (=> b!186464 m!213311))

(assert (=> b!186247 d!55211))

(declare-fun d!55213 () Bool)

(declare-fun e!122719 () Bool)

(assert (=> d!55213 e!122719))

(declare-fun res!88195 () Bool)

(assert (=> d!55213 (=> res!88195 e!122719)))

(declare-fun lt!92208 () Bool)

(assert (=> d!55213 (= res!88195 (not lt!92208))))

(declare-fun lt!92209 () Bool)

(assert (=> d!55213 (= lt!92208 lt!92209)))

(declare-fun lt!92210 () Unit!5610)

(declare-fun e!122720 () Unit!5610)

(assert (=> d!55213 (= lt!92210 e!122720)))

(declare-fun c!33444 () Bool)

(assert (=> d!55213 (= c!33444 lt!92209)))

(assert (=> d!55213 (= lt!92209 (containsKey!229 (toList!1208 lt!92150) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55213 (= (contains!1304 lt!92150 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92208)))

(declare-fun b!186465 () Bool)

(declare-fun lt!92207 () Unit!5610)

(assert (=> b!186465 (= e!122720 lt!92207)))

(assert (=> b!186465 (= lt!92207 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1208 lt!92150) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186465 (isDefined!178 (getValueByKey!225 (toList!1208 lt!92150) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186466 () Bool)

(declare-fun Unit!5618 () Unit!5610)

(assert (=> b!186466 (= e!122720 Unit!5618)))

(declare-fun b!186467 () Bool)

(assert (=> b!186467 (= e!122719 (isDefined!178 (getValueByKey!225 (toList!1208 lt!92150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55213 c!33444) b!186465))

(assert (= (and d!55213 (not c!33444)) b!186466))

(assert (= (and d!55213 (not res!88195)) b!186467))

(declare-fun m!213401 () Bool)

(assert (=> d!55213 m!213401))

(declare-fun m!213403 () Bool)

(assert (=> b!186465 m!213403))

(assert (=> b!186465 m!213389))

(assert (=> b!186465 m!213389))

(declare-fun m!213405 () Bool)

(assert (=> b!186465 m!213405))

(assert (=> b!186467 m!213389))

(assert (=> b!186467 m!213389))

(assert (=> b!186467 m!213405))

(assert (=> bm!18782 d!55213))

(declare-fun b!186476 () Bool)

(declare-fun e!122728 () Bool)

(declare-fun call!18802 () Bool)

(assert (=> b!186476 (= e!122728 call!18802)))

(declare-fun b!186477 () Bool)

(declare-fun e!122727 () Bool)

(assert (=> b!186477 (= e!122727 e!122728)))

(declare-fun lt!92218 () (_ BitVec 64))

(assert (=> b!186477 (= lt!92218 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92217 () Unit!5610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7941 (_ BitVec 64) (_ BitVec 32)) Unit!5610)

(assert (=> b!186477 (= lt!92217 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5740 thiss!1248) lt!92218 #b00000000000000000000000000000000))))

(assert (=> b!186477 (arrayContainsKey!0 (_keys!5740 thiss!1248) lt!92218 #b00000000000000000000000000000000)))

(declare-fun lt!92219 () Unit!5610)

(assert (=> b!186477 (= lt!92219 lt!92217)))

(declare-fun res!88200 () Bool)

(assert (=> b!186477 (= res!88200 (= (seekEntryOrOpen!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000) (_keys!5740 thiss!1248) (mask!8920 thiss!1248)) (Found!642 #b00000000000000000000000000000000)))))

(assert (=> b!186477 (=> (not res!88200) (not e!122728))))

(declare-fun bm!18799 () Bool)

(assert (=> bm!18799 (= call!18802 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun b!186478 () Bool)

(assert (=> b!186478 (= e!122727 call!18802)))

(declare-fun b!186479 () Bool)

(declare-fun e!122729 () Bool)

(assert (=> b!186479 (= e!122729 e!122727)))

(declare-fun c!33447 () Bool)

(assert (=> b!186479 (= c!33447 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55215 () Bool)

(declare-fun res!88201 () Bool)

(assert (=> d!55215 (=> res!88201 e!122729)))

(assert (=> d!55215 (= res!88201 (bvsge #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> d!55215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)) e!122729)))

(assert (= (and d!55215 (not res!88201)) b!186479))

(assert (= (and b!186479 c!33447) b!186477))

(assert (= (and b!186479 (not c!33447)) b!186478))

(assert (= (and b!186477 res!88200) b!186476))

(assert (= (or b!186476 b!186478) bm!18799))

(assert (=> b!186477 m!213265))

(declare-fun m!213407 () Bool)

(assert (=> b!186477 m!213407))

(declare-fun m!213409 () Bool)

(assert (=> b!186477 m!213409))

(assert (=> b!186477 m!213265))

(declare-fun m!213411 () Bool)

(assert (=> b!186477 m!213411))

(declare-fun m!213413 () Bool)

(assert (=> bm!18799 m!213413))

(assert (=> b!186479 m!213265))

(assert (=> b!186479 m!213265))

(assert (=> b!186479 m!213311))

(assert (=> b!186246 d!55215))

(assert (=> d!55181 d!55177))

(declare-fun bm!18802 () Bool)

(declare-fun call!18805 () (_ BitVec 32))

(assert (=> bm!18802 (= call!18805 (arrayCountValidKeys!0 (_keys!5740 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun b!186488 () Bool)

(declare-fun e!122735 () (_ BitVec 32))

(declare-fun e!122734 () (_ BitVec 32))

(assert (=> b!186488 (= e!122735 e!122734)))

(declare-fun c!33453 () Bool)

(assert (=> b!186488 (= c!33453 (validKeyInArray!0 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186489 () Bool)

(assert (=> b!186489 (= e!122735 #b00000000000000000000000000000000)))

(declare-fun d!55217 () Bool)

(declare-fun lt!92222 () (_ BitVec 32))

(assert (=> d!55217 (and (bvsge lt!92222 #b00000000000000000000000000000000) (bvsle lt!92222 (bvsub (size!4065 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55217 (= lt!92222 e!122735)))

(declare-fun c!33452 () Bool)

(assert (=> d!55217 (= c!33452 (bvsge #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> d!55217 (and (bvsle #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4065 (_keys!5740 thiss!1248)) (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> d!55217 (= (arrayCountValidKeys!0 (_keys!5740 thiss!1248) #b00000000000000000000000000000000 (size!4065 (_keys!5740 thiss!1248))) lt!92222)))

(declare-fun b!186490 () Bool)

(assert (=> b!186490 (= e!122734 call!18805)))

(declare-fun b!186491 () Bool)

(assert (=> b!186491 (= e!122734 (bvadd #b00000000000000000000000000000001 call!18805))))

(assert (= (and d!55217 c!33452) b!186489))

(assert (= (and d!55217 (not c!33452)) b!186488))

(assert (= (and b!186488 c!33453) b!186491))

(assert (= (and b!186488 (not c!33453)) b!186490))

(assert (= (or b!186491 b!186490) bm!18802))

(declare-fun m!213415 () Bool)

(assert (=> bm!18802 m!213415))

(assert (=> b!186488 m!213265))

(assert (=> b!186488 m!213265))

(assert (=> b!186488 m!213311))

(assert (=> b!186245 d!55217))

(assert (=> d!55183 d!55165))

(declare-fun bm!18807 () Bool)

(declare-fun call!18811 () Bool)

(assert (=> bm!18807 (= call!18811 (arrayContainsKey!0 (_keys!5740 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun call!18810 () Bool)

(declare-fun lt!92225 () SeekEntryResult!642)

(declare-fun c!33459 () Bool)

(declare-fun bm!18808 () Bool)

(assert (=> bm!18808 (= call!18810 (inRange!0 (ite c!33459 (index!4738 lt!92225) (index!4741 lt!92225)) (mask!8920 thiss!1248)))))

(declare-fun d!55219 () Bool)

(declare-fun e!122746 () Bool)

(assert (=> d!55219 e!122746))

(assert (=> d!55219 (= c!33459 ((_ is MissingZero!642) lt!92225))))

(assert (=> d!55219 (= lt!92225 (seekEntryOrOpen!0 key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(assert (=> d!55219 true))

(declare-fun _$34!1063 () Unit!5610)

(assert (=> d!55219 (= (choose!985 (_keys!5740 thiss!1248) (_values!3781 thiss!1248) (mask!8920 thiss!1248) (extraKeys!3535 thiss!1248) (zeroValue!3639 thiss!1248) (minValue!3639 thiss!1248) key!828 (defaultEntry!3798 thiss!1248)) _$34!1063)))

(declare-fun b!186508 () Bool)

(declare-fun res!88213 () Bool)

(declare-fun e!122744 () Bool)

(assert (=> b!186508 (=> (not res!88213) (not e!122744))))

(assert (=> b!186508 (= res!88213 call!18810)))

(declare-fun e!122747 () Bool)

(assert (=> b!186508 (= e!122747 e!122744)))

(declare-fun b!186509 () Bool)

(assert (=> b!186509 (= e!122744 (not call!18811))))

(declare-fun b!186510 () Bool)

(declare-fun e!122745 () Bool)

(assert (=> b!186510 (= e!122746 e!122745)))

(declare-fun res!88211 () Bool)

(assert (=> b!186510 (= res!88211 call!18810)))

(assert (=> b!186510 (=> (not res!88211) (not e!122745))))

(declare-fun b!186511 () Bool)

(declare-fun res!88210 () Bool)

(assert (=> b!186511 (= res!88210 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4738 lt!92225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186511 (=> (not res!88210) (not e!122745))))

(declare-fun b!186512 () Bool)

(declare-fun res!88212 () Bool)

(assert (=> b!186512 (=> (not res!88212) (not e!122744))))

(assert (=> b!186512 (= res!88212 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4741 lt!92225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186513 () Bool)

(assert (=> b!186513 (= e!122745 (not call!18811))))

(declare-fun b!186514 () Bool)

(assert (=> b!186514 (= e!122747 ((_ is Undefined!642) lt!92225))))

(declare-fun b!186515 () Bool)

(assert (=> b!186515 (= e!122746 e!122747)))

(declare-fun c!33458 () Bool)

(assert (=> b!186515 (= c!33458 ((_ is MissingVacant!642) lt!92225))))

(assert (= (and d!55219 c!33459) b!186510))

(assert (= (and d!55219 (not c!33459)) b!186515))

(assert (= (and b!186510 res!88211) b!186511))

(assert (= (and b!186511 res!88210) b!186513))

(assert (= (and b!186515 c!33458) b!186508))

(assert (= (and b!186515 (not c!33458)) b!186514))

(assert (= (and b!186508 res!88213) b!186512))

(assert (= (and b!186512 res!88212) b!186509))

(assert (= (or b!186510 b!186508) bm!18808))

(assert (= (or b!186513 b!186509) bm!18807))

(assert (=> bm!18807 m!213317))

(declare-fun m!213417 () Bool)

(assert (=> bm!18808 m!213417))

(declare-fun m!213419 () Bool)

(assert (=> b!186511 m!213419))

(declare-fun m!213421 () Bool)

(assert (=> b!186512 m!213421))

(assert (=> d!55219 m!213187))

(assert (=> d!55183 d!55219))

(assert (=> d!55183 d!55177))

(declare-fun b!186527 () Bool)

(declare-fun e!122750 () Bool)

(assert (=> b!186527 (= e!122750 (and (bvsge (extraKeys!3535 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3535 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1342 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!186524 () Bool)

(declare-fun res!88224 () Bool)

(assert (=> b!186524 (=> (not res!88224) (not e!122750))))

(assert (=> b!186524 (= res!88224 (and (= (size!4066 (_values!3781 thiss!1248)) (bvadd (mask!8920 thiss!1248) #b00000000000000000000000000000001)) (= (size!4065 (_keys!5740 thiss!1248)) (size!4066 (_values!3781 thiss!1248))) (bvsge (_size!1342 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1342 thiss!1248) (bvadd (mask!8920 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!186525 () Bool)

(declare-fun res!88223 () Bool)

(assert (=> b!186525 (=> (not res!88223) (not e!122750))))

(declare-fun size!4069 (LongMapFixedSize!2586) (_ BitVec 32))

(assert (=> b!186525 (= res!88223 (bvsge (size!4069 thiss!1248) (_size!1342 thiss!1248)))))

(declare-fun b!186526 () Bool)

(declare-fun res!88222 () Bool)

(assert (=> b!186526 (=> (not res!88222) (not e!122750))))

(assert (=> b!186526 (= res!88222 (= (size!4069 thiss!1248) (bvadd (_size!1342 thiss!1248) (bvsdiv (bvadd (extraKeys!3535 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!55221 () Bool)

(declare-fun res!88225 () Bool)

(assert (=> d!55221 (=> (not res!88225) (not e!122750))))

(assert (=> d!55221 (= res!88225 (validMask!0 (mask!8920 thiss!1248)))))

(assert (=> d!55221 (= (simpleValid!184 thiss!1248) e!122750)))

(assert (= (and d!55221 res!88225) b!186524))

(assert (= (and b!186524 res!88224) b!186525))

(assert (= (and b!186525 res!88223) b!186526))

(assert (= (and b!186526 res!88222) b!186527))

(declare-fun m!213423 () Bool)

(assert (=> b!186525 m!213423))

(assert (=> b!186526 m!213423))

(assert (=> d!55221 m!213181))

(assert (=> d!55175 d!55221))

(declare-fun d!55223 () Bool)

(assert (=> d!55223 (= (apply!168 lt!92150 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2152 (getValueByKey!225 (toList!1208 lt!92150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7533 () Bool)

(assert (= bs!7533 d!55223))

(assert (=> bs!7533 m!213333))

(assert (=> bs!7533 m!213333))

(declare-fun m!213425 () Bool)

(assert (=> bs!7533 m!213425))

(assert (=> b!186312 d!55223))

(declare-fun d!55225 () Bool)

(declare-fun e!122751 () Bool)

(assert (=> d!55225 e!122751))

(declare-fun res!88227 () Bool)

(assert (=> d!55225 (=> (not res!88227) (not e!122751))))

(declare-fun lt!92228 () ListLongMap!2385)

(assert (=> d!55225 (= res!88227 (contains!1304 lt!92228 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))

(declare-fun lt!92227 () List!2374)

(assert (=> d!55225 (= lt!92228 (ListLongMap!2386 lt!92227))))

(declare-fun lt!92229 () Unit!5610)

(declare-fun lt!92226 () Unit!5610)

(assert (=> d!55225 (= lt!92229 lt!92226)))

(assert (=> d!55225 (= (getValueByKey!225 lt!92227 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))

(assert (=> d!55225 (= lt!92226 (lemmaContainsTupThenGetReturnValue!117 lt!92227 (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))

(assert (=> d!55225 (= lt!92227 (insertStrictlySorted!120 (toList!1208 call!18783) (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))))))

(assert (=> d!55225 (= (+!288 call!18783 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))) lt!92228)))

(declare-fun b!186528 () Bool)

(declare-fun res!88226 () Bool)

(assert (=> b!186528 (=> (not res!88226) (not e!122751))))

(assert (=> b!186528 (= res!88226 (= (getValueByKey!225 (toList!1208 lt!92228) (_1!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))))

(declare-fun b!186529 () Bool)

(assert (=> b!186529 (= e!122751 (contains!1305 (toList!1208 lt!92228) (tuple2!3469 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3639 thiss!1248))))))

(assert (= (and d!55225 res!88227) b!186528))

(assert (= (and b!186528 res!88226) b!186529))

(declare-fun m!213427 () Bool)

(assert (=> d!55225 m!213427))

(declare-fun m!213429 () Bool)

(assert (=> d!55225 m!213429))

(declare-fun m!213431 () Bool)

(assert (=> d!55225 m!213431))

(declare-fun m!213433 () Bool)

(assert (=> d!55225 m!213433))

(declare-fun m!213435 () Bool)

(assert (=> b!186528 m!213435))

(declare-fun m!213437 () Bool)

(assert (=> b!186529 m!213437))

(assert (=> b!186303 d!55225))

(declare-fun d!55227 () Bool)

(assert (=> d!55227 (= (apply!168 (+!288 lt!92139 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))) lt!92133) (apply!168 lt!92139 lt!92133))))

(declare-fun lt!92232 () Unit!5610)

(declare-fun choose!987 (ListLongMap!2385 (_ BitVec 64) V!5467 (_ BitVec 64)) Unit!5610)

(assert (=> d!55227 (= lt!92232 (choose!987 lt!92139 lt!92145 (minValue!3639 thiss!1248) lt!92133))))

(declare-fun e!122754 () Bool)

(assert (=> d!55227 e!122754))

(declare-fun res!88230 () Bool)

(assert (=> d!55227 (=> (not res!88230) (not e!122754))))

(assert (=> d!55227 (= res!88230 (contains!1304 lt!92139 lt!92133))))

(assert (=> d!55227 (= (addApplyDifferent!144 lt!92139 lt!92145 (minValue!3639 thiss!1248) lt!92133) lt!92232)))

(declare-fun b!186533 () Bool)

(assert (=> b!186533 (= e!122754 (not (= lt!92133 lt!92145)))))

(assert (= (and d!55227 res!88230) b!186533))

(declare-fun m!213439 () Bool)

(assert (=> d!55227 m!213439))

(assert (=> d!55227 m!213281))

(declare-fun m!213441 () Bool)

(assert (=> d!55227 m!213441))

(assert (=> d!55227 m!213277))

(assert (=> d!55227 m!213279))

(assert (=> d!55227 m!213277))

(assert (=> b!186302 d!55227))

(assert (=> b!186302 d!55195))

(declare-fun d!55229 () Bool)

(declare-fun e!122755 () Bool)

(assert (=> d!55229 e!122755))

(declare-fun res!88232 () Bool)

(assert (=> d!55229 (=> (not res!88232) (not e!122755))))

(declare-fun lt!92235 () ListLongMap!2385)

(assert (=> d!55229 (= res!88232 (contains!1304 lt!92235 (_1!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))))))

(declare-fun lt!92234 () List!2374)

(assert (=> d!55229 (= lt!92235 (ListLongMap!2386 lt!92234))))

(declare-fun lt!92236 () Unit!5610)

(declare-fun lt!92233 () Unit!5610)

(assert (=> d!55229 (= lt!92236 lt!92233)))

(assert (=> d!55229 (= (getValueByKey!225 lt!92234 (_1!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))))))

(assert (=> d!55229 (= lt!92233 (lemmaContainsTupThenGetReturnValue!117 lt!92234 (_1!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))))))

(assert (=> d!55229 (= lt!92234 (insertStrictlySorted!120 (toList!1208 lt!92139) (_1!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))))))

(assert (=> d!55229 (= (+!288 lt!92139 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))) lt!92235)))

(declare-fun b!186534 () Bool)

(declare-fun res!88231 () Bool)

(assert (=> b!186534 (=> (not res!88231) (not e!122755))))

(assert (=> b!186534 (= res!88231 (= (getValueByKey!225 (toList!1208 lt!92235) (_1!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))))))))

(declare-fun b!186535 () Bool)

(assert (=> b!186535 (= e!122755 (contains!1305 (toList!1208 lt!92235) (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))))))

(assert (= (and d!55229 res!88232) b!186534))

(assert (= (and b!186534 res!88231) b!186535))

(declare-fun m!213443 () Bool)

(assert (=> d!55229 m!213443))

(declare-fun m!213445 () Bool)

(assert (=> d!55229 m!213445))

(declare-fun m!213447 () Bool)

(assert (=> d!55229 m!213447))

(declare-fun m!213449 () Bool)

(assert (=> d!55229 m!213449))

(declare-fun m!213451 () Bool)

(assert (=> b!186534 m!213451))

(declare-fun m!213453 () Bool)

(assert (=> b!186535 m!213453))

(assert (=> b!186302 d!55229))

(declare-fun d!55231 () Bool)

(declare-fun e!122756 () Bool)

(assert (=> d!55231 e!122756))

(declare-fun res!88233 () Bool)

(assert (=> d!55231 (=> res!88233 e!122756)))

(declare-fun lt!92238 () Bool)

(assert (=> d!55231 (= res!88233 (not lt!92238))))

(declare-fun lt!92239 () Bool)

(assert (=> d!55231 (= lt!92238 lt!92239)))

(declare-fun lt!92240 () Unit!5610)

(declare-fun e!122757 () Unit!5610)

(assert (=> d!55231 (= lt!92240 e!122757)))

(declare-fun c!33460 () Bool)

(assert (=> d!55231 (= c!33460 lt!92239)))

(assert (=> d!55231 (= lt!92239 (containsKey!229 (toList!1208 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))) lt!92142))))

(assert (=> d!55231 (= (contains!1304 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))) lt!92142) lt!92238)))

(declare-fun b!186536 () Bool)

(declare-fun lt!92237 () Unit!5610)

(assert (=> b!186536 (= e!122757 lt!92237)))

(assert (=> b!186536 (= lt!92237 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1208 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))) lt!92142))))

(assert (=> b!186536 (isDefined!178 (getValueByKey!225 (toList!1208 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))) lt!92142))))

(declare-fun b!186537 () Bool)

(declare-fun Unit!5619 () Unit!5610)

(assert (=> b!186537 (= e!122757 Unit!5619)))

(declare-fun b!186538 () Bool)

(assert (=> b!186538 (= e!122756 (isDefined!178 (getValueByKey!225 (toList!1208 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))) lt!92142)))))

(assert (= (and d!55231 c!33460) b!186536))

(assert (= (and d!55231 (not c!33460)) b!186537))

(assert (= (and d!55231 (not res!88233)) b!186538))

(declare-fun m!213455 () Bool)

(assert (=> d!55231 m!213455))

(declare-fun m!213457 () Bool)

(assert (=> b!186536 m!213457))

(declare-fun m!213459 () Bool)

(assert (=> b!186536 m!213459))

(assert (=> b!186536 m!213459))

(declare-fun m!213461 () Bool)

(assert (=> b!186536 m!213461))

(assert (=> b!186538 m!213459))

(assert (=> b!186538 m!213459))

(assert (=> b!186538 m!213461))

(assert (=> b!186302 d!55231))

(declare-fun d!55233 () Bool)

(declare-fun e!122758 () Bool)

(assert (=> d!55233 e!122758))

(declare-fun res!88235 () Bool)

(assert (=> d!55233 (=> (not res!88235) (not e!122758))))

(declare-fun lt!92243 () ListLongMap!2385)

(assert (=> d!55233 (= res!88235 (contains!1304 lt!92243 (_1!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))))))

(declare-fun lt!92242 () List!2374)

(assert (=> d!55233 (= lt!92243 (ListLongMap!2386 lt!92242))))

(declare-fun lt!92244 () Unit!5610)

(declare-fun lt!92241 () Unit!5610)

(assert (=> d!55233 (= lt!92244 lt!92241)))

(assert (=> d!55233 (= (getValueByKey!225 lt!92242 (_1!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))))))

(assert (=> d!55233 (= lt!92241 (lemmaContainsTupThenGetReturnValue!117 lt!92242 (_1!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))))))

(assert (=> d!55233 (= lt!92242 (insertStrictlySorted!120 (toList!1208 lt!92136) (_1!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))))))

(assert (=> d!55233 (= (+!288 lt!92136 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))) lt!92243)))

(declare-fun b!186539 () Bool)

(declare-fun res!88234 () Bool)

(assert (=> b!186539 (=> (not res!88234) (not e!122758))))

(assert (=> b!186539 (= res!88234 (= (getValueByKey!225 (toList!1208 lt!92243) (_1!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))))))))

(declare-fun b!186540 () Bool)

(assert (=> b!186540 (= e!122758 (contains!1305 (toList!1208 lt!92243) (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))))))

(assert (= (and d!55233 res!88235) b!186539))

(assert (= (and b!186539 res!88234) b!186540))

(declare-fun m!213463 () Bool)

(assert (=> d!55233 m!213463))

(declare-fun m!213465 () Bool)

(assert (=> d!55233 m!213465))

(declare-fun m!213467 () Bool)

(assert (=> d!55233 m!213467))

(declare-fun m!213469 () Bool)

(assert (=> d!55233 m!213469))

(declare-fun m!213471 () Bool)

(assert (=> b!186539 m!213471))

(declare-fun m!213473 () Bool)

(assert (=> b!186540 m!213473))

(assert (=> b!186302 d!55233))

(declare-fun d!55235 () Bool)

(declare-fun e!122759 () Bool)

(assert (=> d!55235 e!122759))

(declare-fun res!88237 () Bool)

(assert (=> d!55235 (=> (not res!88237) (not e!122759))))

(declare-fun lt!92247 () ListLongMap!2385)

(assert (=> d!55235 (= res!88237 (contains!1304 lt!92247 (_1!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))))))

(declare-fun lt!92246 () List!2374)

(assert (=> d!55235 (= lt!92247 (ListLongMap!2386 lt!92246))))

(declare-fun lt!92248 () Unit!5610)

(declare-fun lt!92245 () Unit!5610)

(assert (=> d!55235 (= lt!92248 lt!92245)))

(assert (=> d!55235 (= (getValueByKey!225 lt!92246 (_1!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))))))

(assert (=> d!55235 (= lt!92245 (lemmaContainsTupThenGetReturnValue!117 lt!92246 (_1!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))))))

(assert (=> d!55235 (= lt!92246 (insertStrictlySorted!120 (toList!1208 lt!92151) (_1!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))))))

(assert (=> d!55235 (= (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))) lt!92247)))

(declare-fun b!186541 () Bool)

(declare-fun res!88236 () Bool)

(assert (=> b!186541 (=> (not res!88236) (not e!122759))))

(assert (=> b!186541 (= res!88236 (= (getValueByKey!225 (toList!1208 lt!92247) (_1!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))))))))

(declare-fun b!186542 () Bool)

(assert (=> b!186542 (= e!122759 (contains!1305 (toList!1208 lt!92247) (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))))))

(assert (= (and d!55235 res!88237) b!186541))

(assert (= (and b!186541 res!88236) b!186542))

(declare-fun m!213475 () Bool)

(assert (=> d!55235 m!213475))

(declare-fun m!213477 () Bool)

(assert (=> d!55235 m!213477))

(declare-fun m!213479 () Bool)

(assert (=> d!55235 m!213479))

(declare-fun m!213481 () Bool)

(assert (=> d!55235 m!213481))

(declare-fun m!213483 () Bool)

(assert (=> b!186541 m!213483))

(declare-fun m!213485 () Bool)

(assert (=> b!186542 m!213485))

(assert (=> b!186302 d!55235))

(declare-fun d!55237 () Bool)

(assert (=> d!55237 (= (apply!168 lt!92149 lt!92138) (get!2152 (getValueByKey!225 (toList!1208 lt!92149) lt!92138)))))

(declare-fun bs!7534 () Bool)

(assert (= bs!7534 d!55237))

(declare-fun m!213487 () Bool)

(assert (=> bs!7534 m!213487))

(assert (=> bs!7534 m!213487))

(declare-fun m!213489 () Bool)

(assert (=> bs!7534 m!213489))

(assert (=> b!186302 d!55237))

(declare-fun d!55239 () Bool)

(assert (=> d!55239 (= (apply!168 (+!288 lt!92139 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248))) lt!92133) (get!2152 (getValueByKey!225 (toList!1208 (+!288 lt!92139 (tuple2!3469 lt!92145 (minValue!3639 thiss!1248)))) lt!92133)))))

(declare-fun bs!7535 () Bool)

(assert (= bs!7535 d!55239))

(declare-fun m!213491 () Bool)

(assert (=> bs!7535 m!213491))

(assert (=> bs!7535 m!213491))

(declare-fun m!213493 () Bool)

(assert (=> bs!7535 m!213493))

(assert (=> b!186302 d!55239))

(declare-fun d!55241 () Bool)

(assert (=> d!55241 (= (apply!168 (+!288 lt!92149 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))) lt!92138) (apply!168 lt!92149 lt!92138))))

(declare-fun lt!92249 () Unit!5610)

(assert (=> d!55241 (= lt!92249 (choose!987 lt!92149 lt!92130 (zeroValue!3639 thiss!1248) lt!92138))))

(declare-fun e!122760 () Bool)

(assert (=> d!55241 e!122760))

(declare-fun res!88238 () Bool)

(assert (=> d!55241 (=> (not res!88238) (not e!122760))))

(assert (=> d!55241 (= res!88238 (contains!1304 lt!92149 lt!92138))))

(assert (=> d!55241 (= (addApplyDifferent!144 lt!92149 lt!92130 (zeroValue!3639 thiss!1248) lt!92138) lt!92249)))

(declare-fun b!186543 () Bool)

(assert (=> b!186543 (= e!122760 (not (= lt!92138 lt!92130)))))

(assert (= (and d!55241 res!88238) b!186543))

(declare-fun m!213495 () Bool)

(assert (=> d!55241 m!213495))

(assert (=> d!55241 m!213293))

(declare-fun m!213497 () Bool)

(assert (=> d!55241 m!213497))

(assert (=> d!55241 m!213287))

(assert (=> d!55241 m!213289))

(assert (=> d!55241 m!213287))

(assert (=> b!186302 d!55241))

(declare-fun d!55243 () Bool)

(assert (=> d!55243 (= (apply!168 (+!288 lt!92136 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))) lt!92144) (get!2152 (getValueByKey!225 (toList!1208 (+!288 lt!92136 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248)))) lt!92144)))))

(declare-fun bs!7536 () Bool)

(assert (= bs!7536 d!55243))

(declare-fun m!213499 () Bool)

(assert (=> bs!7536 m!213499))

(assert (=> bs!7536 m!213499))

(declare-fun m!213501 () Bool)

(assert (=> bs!7536 m!213501))

(assert (=> b!186302 d!55243))

(declare-fun d!55245 () Bool)

(assert (=> d!55245 (= (apply!168 lt!92139 lt!92133) (get!2152 (getValueByKey!225 (toList!1208 lt!92139) lt!92133)))))

(declare-fun bs!7537 () Bool)

(assert (= bs!7537 d!55245))

(declare-fun m!213503 () Bool)

(assert (=> bs!7537 m!213503))

(assert (=> bs!7537 m!213503))

(declare-fun m!213505 () Bool)

(assert (=> bs!7537 m!213505))

(assert (=> b!186302 d!55245))

(declare-fun d!55247 () Bool)

(assert (=> d!55247 (= (apply!168 (+!288 lt!92136 (tuple2!3469 lt!92147 (minValue!3639 thiss!1248))) lt!92144) (apply!168 lt!92136 lt!92144))))

(declare-fun lt!92250 () Unit!5610)

(assert (=> d!55247 (= lt!92250 (choose!987 lt!92136 lt!92147 (minValue!3639 thiss!1248) lt!92144))))

(declare-fun e!122761 () Bool)

(assert (=> d!55247 e!122761))

(declare-fun res!88239 () Bool)

(assert (=> d!55247 (=> (not res!88239) (not e!122761))))

(assert (=> d!55247 (= res!88239 (contains!1304 lt!92136 lt!92144))))

(assert (=> d!55247 (= (addApplyDifferent!144 lt!92136 lt!92147 (minValue!3639 thiss!1248) lt!92144) lt!92250)))

(declare-fun b!186544 () Bool)

(assert (=> b!186544 (= e!122761 (not (= lt!92144 lt!92147)))))

(assert (= (and d!55247 res!88239) b!186544))

(declare-fun m!213507 () Bool)

(assert (=> d!55247 m!213507))

(assert (=> d!55247 m!213295))

(declare-fun m!213509 () Bool)

(assert (=> d!55247 m!213509))

(assert (=> d!55247 m!213283))

(assert (=> d!55247 m!213285))

(assert (=> d!55247 m!213283))

(assert (=> b!186302 d!55247))

(declare-fun d!55249 () Bool)

(declare-fun e!122762 () Bool)

(assert (=> d!55249 e!122762))

(declare-fun res!88241 () Bool)

(assert (=> d!55249 (=> (not res!88241) (not e!122762))))

(declare-fun lt!92253 () ListLongMap!2385)

(assert (=> d!55249 (= res!88241 (contains!1304 lt!92253 (_1!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))))))

(declare-fun lt!92252 () List!2374)

(assert (=> d!55249 (= lt!92253 (ListLongMap!2386 lt!92252))))

(declare-fun lt!92254 () Unit!5610)

(declare-fun lt!92251 () Unit!5610)

(assert (=> d!55249 (= lt!92254 lt!92251)))

(assert (=> d!55249 (= (getValueByKey!225 lt!92252 (_1!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))))))

(assert (=> d!55249 (= lt!92251 (lemmaContainsTupThenGetReturnValue!117 lt!92252 (_1!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))))))

(assert (=> d!55249 (= lt!92252 (insertStrictlySorted!120 (toList!1208 lt!92149) (_1!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))) (_2!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))))))

(assert (=> d!55249 (= (+!288 lt!92149 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))) lt!92253)))

(declare-fun b!186545 () Bool)

(declare-fun res!88240 () Bool)

(assert (=> b!186545 (=> (not res!88240) (not e!122762))))

(assert (=> b!186545 (= res!88240 (= (getValueByKey!225 (toList!1208 lt!92253) (_1!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))) (Some!230 (_2!1745 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))))))))

(declare-fun b!186546 () Bool)

(assert (=> b!186546 (= e!122762 (contains!1305 (toList!1208 lt!92253) (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))))))

(assert (= (and d!55249 res!88241) b!186545))

(assert (= (and b!186545 res!88240) b!186546))

(declare-fun m!213511 () Bool)

(assert (=> d!55249 m!213511))

(declare-fun m!213513 () Bool)

(assert (=> d!55249 m!213513))

(declare-fun m!213515 () Bool)

(assert (=> d!55249 m!213515))

(declare-fun m!213517 () Bool)

(assert (=> d!55249 m!213517))

(declare-fun m!213519 () Bool)

(assert (=> b!186545 m!213519))

(declare-fun m!213521 () Bool)

(assert (=> b!186546 m!213521))

(assert (=> b!186302 d!55249))

(declare-fun d!55251 () Bool)

(assert (=> d!55251 (contains!1304 (+!288 lt!92151 (tuple2!3469 lt!92148 (zeroValue!3639 thiss!1248))) lt!92142)))

(declare-fun lt!92257 () Unit!5610)

(declare-fun choose!988 (ListLongMap!2385 (_ BitVec 64) V!5467 (_ BitVec 64)) Unit!5610)

(assert (=> d!55251 (= lt!92257 (choose!988 lt!92151 lt!92148 (zeroValue!3639 thiss!1248) lt!92142))))

(assert (=> d!55251 (contains!1304 lt!92151 lt!92142)))

(assert (=> d!55251 (= (addStillContains!144 lt!92151 lt!92148 (zeroValue!3639 thiss!1248) lt!92142) lt!92257)))

(declare-fun bs!7538 () Bool)

(assert (= bs!7538 d!55251))

(assert (=> bs!7538 m!213297))

(assert (=> bs!7538 m!213297))

(assert (=> bs!7538 m!213301))

(declare-fun m!213523 () Bool)

(assert (=> bs!7538 m!213523))

(declare-fun m!213525 () Bool)

(assert (=> bs!7538 m!213525))

(assert (=> b!186302 d!55251))

(declare-fun d!55253 () Bool)

(assert (=> d!55253 (= (apply!168 (+!288 lt!92149 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248))) lt!92138) (get!2152 (getValueByKey!225 (toList!1208 (+!288 lt!92149 (tuple2!3469 lt!92130 (zeroValue!3639 thiss!1248)))) lt!92138)))))

(declare-fun bs!7539 () Bool)

(assert (= bs!7539 d!55253))

(declare-fun m!213527 () Bool)

(assert (=> bs!7539 m!213527))

(assert (=> bs!7539 m!213527))

(declare-fun m!213529 () Bool)

(assert (=> bs!7539 m!213529))

(assert (=> b!186302 d!55253))

(declare-fun d!55255 () Bool)

(assert (=> d!55255 (= (apply!168 lt!92136 lt!92144) (get!2152 (getValueByKey!225 (toList!1208 lt!92136) lt!92144)))))

(declare-fun bs!7540 () Bool)

(assert (= bs!7540 d!55255))

(declare-fun m!213531 () Bool)

(assert (=> bs!7540 m!213531))

(assert (=> bs!7540 m!213531))

(declare-fun m!213533 () Bool)

(assert (=> bs!7540 m!213533))

(assert (=> b!186302 d!55255))

(declare-fun d!55257 () Bool)

(assert (=> d!55257 (= (inRange!0 (index!4739 lt!92073) (mask!8920 thiss!1248)) (and (bvsge (index!4739 lt!92073) #b00000000000000000000000000000000) (bvslt (index!4739 lt!92073) (bvadd (mask!8920 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186237 d!55257))

(declare-fun d!55259 () Bool)

(assert (=> d!55259 (= (apply!168 lt!92150 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)) (get!2152 (getValueByKey!225 (toList!1208 lt!92150) (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7541 () Bool)

(assert (= bs!7541 d!55259))

(assert (=> bs!7541 m!213265))

(declare-fun m!213535 () Bool)

(assert (=> bs!7541 m!213535))

(assert (=> bs!7541 m!213535))

(declare-fun m!213537 () Bool)

(assert (=> bs!7541 m!213537))

(assert (=> b!186299 d!55259))

(declare-fun d!55261 () Bool)

(declare-fun c!33463 () Bool)

(assert (=> d!55261 (= c!33463 ((_ is ValueCellFull!1839) (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!122765 () V!5467)

(assert (=> d!55261 (= (get!2151 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!122765)))

(declare-fun b!186552 () Bool)

(declare-fun get!2153 (ValueCell!1839 V!5467) V!5467)

(assert (=> b!186552 (= e!122765 (get!2153 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186553 () Bool)

(declare-fun get!2154 (ValueCell!1839 V!5467) V!5467)

(assert (=> b!186553 (= e!122765 (get!2154 (select (arr!3750 (_values!3781 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3798 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55261 c!33463) b!186552))

(assert (= (and d!55261 (not c!33463)) b!186553))

(assert (=> b!186552 m!213305))

(assert (=> b!186552 m!213303))

(declare-fun m!213539 () Bool)

(assert (=> b!186552 m!213539))

(assert (=> b!186553 m!213305))

(assert (=> b!186553 m!213303))

(declare-fun m!213541 () Bool)

(assert (=> b!186553 m!213541))

(assert (=> b!186299 d!55261))

(declare-fun b!186572 () Bool)

(declare-fun e!122777 () Bool)

(declare-fun lt!92263 () SeekEntryResult!642)

(assert (=> b!186572 (= e!122777 (bvsge (x!20206 lt!92263) #b01111111111111111111111111111110))))

(declare-fun b!186573 () Bool)

(declare-fun e!122778 () SeekEntryResult!642)

(assert (=> b!186573 (= e!122778 (Intermediate!642 true (toIndex!0 key!828 (mask!8920 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186574 () Bool)

(assert (=> b!186574 (and (bvsge (index!4740 lt!92263) #b00000000000000000000000000000000) (bvslt (index!4740 lt!92263) (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun res!88249 () Bool)

(assert (=> b!186574 (= res!88249 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4740 lt!92263)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122776 () Bool)

(assert (=> b!186574 (=> res!88249 e!122776)))

(declare-fun b!186575 () Bool)

(assert (=> b!186575 (and (bvsge (index!4740 lt!92263) #b00000000000000000000000000000000) (bvslt (index!4740 lt!92263) (size!4065 (_keys!5740 thiss!1248))))))

(declare-fun res!88250 () Bool)

(assert (=> b!186575 (= res!88250 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4740 lt!92263)) key!828))))

(assert (=> b!186575 (=> res!88250 e!122776)))

(declare-fun e!122780 () Bool)

(assert (=> b!186575 (= e!122780 e!122776)))

(declare-fun d!55263 () Bool)

(assert (=> d!55263 e!122777))

(declare-fun c!33471 () Bool)

(assert (=> d!55263 (= c!33471 (and ((_ is Intermediate!642) lt!92263) (undefined!1454 lt!92263)))))

(assert (=> d!55263 (= lt!92263 e!122778)))

(declare-fun c!33472 () Bool)

(assert (=> d!55263 (= c!33472 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92262 () (_ BitVec 64))

(assert (=> d!55263 (= lt!92262 (select (arr!3749 (_keys!5740 thiss!1248)) (toIndex!0 key!828 (mask!8920 thiss!1248))))))

(assert (=> d!55263 (validMask!0 (mask!8920 thiss!1248))))

(assert (=> d!55263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8920 thiss!1248)) key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)) lt!92263)))

(declare-fun b!186576 () Bool)

(declare-fun e!122779 () SeekEntryResult!642)

(assert (=> b!186576 (= e!122779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8920 thiss!1248)) #b00000000000000000000000000000000 (mask!8920 thiss!1248)) key!828 (_keys!5740 thiss!1248) (mask!8920 thiss!1248)))))

(declare-fun b!186577 () Bool)

(assert (=> b!186577 (= e!122779 (Intermediate!642 false (toIndex!0 key!828 (mask!8920 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186578 () Bool)

(assert (=> b!186578 (and (bvsge (index!4740 lt!92263) #b00000000000000000000000000000000) (bvslt (index!4740 lt!92263) (size!4065 (_keys!5740 thiss!1248))))))

(assert (=> b!186578 (= e!122776 (= (select (arr!3749 (_keys!5740 thiss!1248)) (index!4740 lt!92263)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186579 () Bool)

(assert (=> b!186579 (= e!122777 e!122780)))

(declare-fun res!88248 () Bool)

(assert (=> b!186579 (= res!88248 (and ((_ is Intermediate!642) lt!92263) (not (undefined!1454 lt!92263)) (bvslt (x!20206 lt!92263) #b01111111111111111111111111111110) (bvsge (x!20206 lt!92263) #b00000000000000000000000000000000) (bvsge (x!20206 lt!92263) #b00000000000000000000000000000000)))))

(assert (=> b!186579 (=> (not res!88248) (not e!122780))))

(declare-fun b!186580 () Bool)

(assert (=> b!186580 (= e!122778 e!122779)))

(declare-fun c!33470 () Bool)

(assert (=> b!186580 (= c!33470 (or (= lt!92262 key!828) (= (bvadd lt!92262 lt!92262) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55263 c!33472) b!186573))

(assert (= (and d!55263 (not c!33472)) b!186580))

(assert (= (and b!186580 c!33470) b!186577))

(assert (= (and b!186580 (not c!33470)) b!186576))

(assert (= (and d!55263 c!33471) b!186572))

(assert (= (and d!55263 (not c!33471)) b!186579))

(assert (= (and b!186579 res!88248) b!186575))

(assert (= (and b!186575 (not res!88250)) b!186574))

(assert (= (and b!186574 (not res!88249)) b!186578))

(declare-fun m!213543 () Bool)

(assert (=> b!186575 m!213543))

(assert (=> b!186576 m!213227))

(declare-fun m!213545 () Bool)

(assert (=> b!186576 m!213545))

(assert (=> b!186576 m!213545))

(declare-fun m!213547 () Bool)

(assert (=> b!186576 m!213547))

(assert (=> d!55263 m!213227))

(declare-fun m!213549 () Bool)

(assert (=> d!55263 m!213549))

(assert (=> d!55263 m!213181))

(assert (=> b!186574 m!213543))

(assert (=> b!186578 m!213543))

(assert (=> d!55165 d!55263))

(declare-fun d!55265 () Bool)

(declare-fun lt!92269 () (_ BitVec 32))

(declare-fun lt!92268 () (_ BitVec 32))

(assert (=> d!55265 (= lt!92269 (bvmul (bvxor lt!92268 (bvlshr lt!92268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55265 (= lt!92268 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55265 (and (bvsge (mask!8920 thiss!1248) #b00000000000000000000000000000000) (let ((res!88251 (let ((h!3005 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20225 (bvmul (bvxor h!3005 (bvlshr h!3005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20225 (bvlshr x!20225 #b00000000000000000000000000001101)) (mask!8920 thiss!1248)))))) (and (bvslt res!88251 (bvadd (mask!8920 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88251 #b00000000000000000000000000000000))))))

(assert (=> d!55265 (= (toIndex!0 key!828 (mask!8920 thiss!1248)) (bvand (bvxor lt!92269 (bvlshr lt!92269 #b00000000000000000000000000001101)) (mask!8920 thiss!1248)))))

(assert (=> d!55165 d!55265))

(assert (=> d!55165 d!55177))

(declare-fun d!55267 () Bool)

(declare-fun e!122781 () Bool)

(assert (=> d!55267 e!122781))

(declare-fun res!88252 () Bool)

(assert (=> d!55267 (=> res!88252 e!122781)))

(declare-fun lt!92271 () Bool)

(assert (=> d!55267 (= res!88252 (not lt!92271))))

(declare-fun lt!92272 () Bool)

(assert (=> d!55267 (= lt!92271 lt!92272)))

(declare-fun lt!92273 () Unit!5610)

(declare-fun e!122782 () Unit!5610)

(assert (=> d!55267 (= lt!92273 e!122782)))

(declare-fun c!33473 () Bool)

(assert (=> d!55267 (= c!33473 lt!92272)))

(assert (=> d!55267 (= lt!92272 (containsKey!229 (toList!1208 lt!92150) (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55267 (= (contains!1304 lt!92150 (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)) lt!92271)))

(declare-fun b!186581 () Bool)

(declare-fun lt!92270 () Unit!5610)

(assert (=> b!186581 (= e!122782 lt!92270)))

(assert (=> b!186581 (= lt!92270 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1208 lt!92150) (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186581 (isDefined!178 (getValueByKey!225 (toList!1208 lt!92150) (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186582 () Bool)

(declare-fun Unit!5620 () Unit!5610)

(assert (=> b!186582 (= e!122782 Unit!5620)))

(declare-fun b!186583 () Bool)

(assert (=> b!186583 (= e!122781 (isDefined!178 (getValueByKey!225 (toList!1208 lt!92150) (select (arr!3749 (_keys!5740 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55267 c!33473) b!186581))

(assert (= (and d!55267 (not c!33473)) b!186582))

(assert (= (and d!55267 (not res!88252)) b!186583))

(assert (=> d!55267 m!213265))

(declare-fun m!213551 () Bool)

(assert (=> d!55267 m!213551))

(assert (=> b!186581 m!213265))

(declare-fun m!213553 () Bool)

(assert (=> b!186581 m!213553))

(assert (=> b!186581 m!213265))

(assert (=> b!186581 m!213535))

(assert (=> b!186581 m!213535))

(declare-fun m!213555 () Bool)

(assert (=> b!186581 m!213555))

(assert (=> b!186583 m!213265))

(assert (=> b!186583 m!213535))

(assert (=> b!186583 m!213535))

(assert (=> b!186583 m!213555))

(assert (=> b!186314 d!55267))

(declare-fun condMapEmpty!7519 () Bool)

(declare-fun mapDefault!7519 () ValueCell!1839)

(assert (=> mapNonEmpty!7518 (= condMapEmpty!7519 (= mapRest!7518 ((as const (Array (_ BitVec 32) ValueCell!1839)) mapDefault!7519)))))

(declare-fun e!122783 () Bool)

(declare-fun mapRes!7519 () Bool)

(assert (=> mapNonEmpty!7518 (= tp!16590 (and e!122783 mapRes!7519))))

(declare-fun b!186584 () Bool)

(declare-fun e!122784 () Bool)

(assert (=> b!186584 (= e!122784 tp_is_empty!4365)))

(declare-fun b!186585 () Bool)

(assert (=> b!186585 (= e!122783 tp_is_empty!4365)))

(declare-fun mapNonEmpty!7519 () Bool)

(declare-fun tp!16591 () Bool)

(assert (=> mapNonEmpty!7519 (= mapRes!7519 (and tp!16591 e!122784))))

(declare-fun mapRest!7519 () (Array (_ BitVec 32) ValueCell!1839))

(declare-fun mapKey!7519 () (_ BitVec 32))

(declare-fun mapValue!7519 () ValueCell!1839)

(assert (=> mapNonEmpty!7519 (= mapRest!7518 (store mapRest!7519 mapKey!7519 mapValue!7519))))

(declare-fun mapIsEmpty!7519 () Bool)

(assert (=> mapIsEmpty!7519 mapRes!7519))

(assert (= (and mapNonEmpty!7518 condMapEmpty!7519) mapIsEmpty!7519))

(assert (= (and mapNonEmpty!7518 (not condMapEmpty!7519)) mapNonEmpty!7519))

(assert (= (and mapNonEmpty!7519 ((_ is ValueCellFull!1839) mapValue!7519)) b!186584))

(assert (= (and mapNonEmpty!7518 ((_ is ValueCellFull!1839) mapDefault!7519)) b!186585))

(declare-fun m!213557 () Bool)

(assert (=> mapNonEmpty!7519 m!213557))

(declare-fun b_lambda!7267 () Bool)

(assert (= b_lambda!7263 (or (and b!186180 b_free!4593) b_lambda!7267)))

(declare-fun b_lambda!7269 () Bool)

(assert (= b_lambda!7265 (or (and b!186180 b_free!4593) b_lambda!7269)))

(check-sat (not d!55235) (not d!55221) (not b!186354) (not b!186416) (not b!186465) (not d!55263) (not d!55249) (not d!55243) (not b!186488) (not d!55233) (not b!186536) b_and!11205 (not bm!18808) (not b!186464) (not d!55245) (not d!55193) (not b_lambda!7261) (not b!186552) (not b!186462) (not b!186431) (not b!186576) (not d!55259) (not d!55225) (not b!186383) (not mapNonEmpty!7519) (not bm!18799) (not d!55267) (not b!186545) (not d!55237) (not b_next!4593) (not bm!18796) (not b!186528) (not b_lambda!7269) (not b!186541) (not bm!18802) (not b!186436) (not b!186430) (not b!186449) (not bm!18793) (not d!55203) (not b!186356) (not d!55195) (not d!55251) (not b!186538) (not d!55185) (not bm!18807) (not d!55213) (not b!186467) (not b!186477) (not b!186581) (not b!186539) (not d!55227) (not d!55255) (not b!186534) (not d!55253) (not b!186422) (not d!55199) (not d!55239) (not d!55219) (not d!55197) (not b!186546) (not b!186583) (not b!186540) (not b!186367) (not d!55201) (not d!55241) (not b!186529) (not b!186525) (not b_lambda!7267) (not b!186553) (not b!186411) (not d!55223) (not b!186414) (not b!186526) (not b!186479) (not d!55189) (not b!186443) (not b!186421) (not d!55229) (not b!186425) (not b!186535) (not b!186418) (not b!186415) (not b!186417) (not d!55247) (not b!186460) (not b!186542) (not d!55231) tp_is_empty!4365)
(check-sat b_and!11205 (not b_next!4593))
