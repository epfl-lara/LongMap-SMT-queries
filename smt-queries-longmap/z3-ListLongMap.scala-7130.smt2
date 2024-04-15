; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90492 () Bool)

(assert start!90492)

(declare-fun b!1035121 () Bool)

(declare-fun b_free!20833 () Bool)

(declare-fun b_next!20833 () Bool)

(assert (=> b!1035121 (= b_free!20833 (not b_next!20833))))

(declare-fun tp!73623 () Bool)

(declare-fun b_and!33307 () Bool)

(assert (=> b!1035121 (= tp!73623 b_and!33307)))

(declare-fun b!1035116 () Bool)

(declare-fun e!585255 () Bool)

(declare-fun tp_is_empty!24553 () Bool)

(assert (=> b!1035116 (= e!585255 tp_is_empty!24553)))

(declare-fun b!1035117 () Bool)

(declare-fun e!585257 () Bool)

(assert (=> b!1035117 (= e!585257 tp_is_empty!24553)))

(declare-fun b!1035118 () Bool)

(declare-fun e!585259 () Bool)

(declare-datatypes ((V!37611 0))(
  ( (V!37612 (val!12327 Int)) )
))
(declare-datatypes ((ValueCell!11573 0))(
  ( (ValueCellFull!11573 (v!14906 V!37611)) (EmptyCell!11573) )
))
(declare-datatypes ((array!65137 0))(
  ( (array!65138 (arr!31356 (Array (_ BitVec 32) (_ BitVec 64))) (size!31885 (_ BitVec 32))) )
))
(declare-datatypes ((array!65139 0))(
  ( (array!65140 (arr!31357 (Array (_ BitVec 32) ValueCell!11573)) (size!31886 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5740 0))(
  ( (LongMapFixedSize!5741 (defaultEntry!6248 Int) (mask!30124 (_ BitVec 32)) (extraKeys!5978 (_ BitVec 32)) (zeroValue!6082 V!37611) (minValue!6084 V!37611) (_size!2925 (_ BitVec 32)) (_keys!11430 array!65137) (_values!6271 array!65139) (_vacant!2925 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5740)

(assert (=> b!1035118 (= e!585259 (and (= (size!31886 (_values!6271 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30124 thiss!1427))) (= (size!31885 (_keys!11430 thiss!1427)) (size!31886 (_values!6271 thiss!1427))) (bvsge (mask!30124 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5978 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5978 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!691213 () Bool)

(assert (=> start!90492 (=> (not res!691213) (not e!585259))))

(declare-fun valid!2157 (LongMapFixedSize!5740) Bool)

(assert (=> start!90492 (= res!691213 (valid!2157 thiss!1427))))

(assert (=> start!90492 e!585259))

(declare-fun e!585258 () Bool)

(assert (=> start!90492 e!585258))

(assert (=> start!90492 true))

(declare-fun b!1035119 () Bool)

(declare-fun e!585254 () Bool)

(declare-fun mapRes!38336 () Bool)

(assert (=> b!1035119 (= e!585254 (and e!585257 mapRes!38336))))

(declare-fun condMapEmpty!38336 () Bool)

(declare-fun mapDefault!38336 () ValueCell!11573)

(assert (=> b!1035119 (= condMapEmpty!38336 (= (arr!31357 (_values!6271 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11573)) mapDefault!38336)))))

(declare-fun b!1035120 () Bool)

(declare-fun res!691212 () Bool)

(assert (=> b!1035120 (=> (not res!691212) (not e!585259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035120 (= res!691212 (validMask!0 (mask!30124 thiss!1427)))))

(declare-fun array_inv!24253 (array!65137) Bool)

(declare-fun array_inv!24254 (array!65139) Bool)

(assert (=> b!1035121 (= e!585258 (and tp!73623 tp_is_empty!24553 (array_inv!24253 (_keys!11430 thiss!1427)) (array_inv!24254 (_values!6271 thiss!1427)) e!585254))))

(declare-fun mapIsEmpty!38336 () Bool)

(assert (=> mapIsEmpty!38336 mapRes!38336))

(declare-fun mapNonEmpty!38336 () Bool)

(declare-fun tp!73622 () Bool)

(assert (=> mapNonEmpty!38336 (= mapRes!38336 (and tp!73622 e!585255))))

(declare-fun mapValue!38336 () ValueCell!11573)

(declare-fun mapRest!38336 () (Array (_ BitVec 32) ValueCell!11573))

(declare-fun mapKey!38336 () (_ BitVec 32))

(assert (=> mapNonEmpty!38336 (= (arr!31357 (_values!6271 thiss!1427)) (store mapRest!38336 mapKey!38336 mapValue!38336))))

(declare-fun b!1035122 () Bool)

(declare-fun res!691211 () Bool)

(assert (=> b!1035122 (=> (not res!691211) (not e!585259))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035122 (= res!691211 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!90492 res!691213) b!1035122))

(assert (= (and b!1035122 res!691211) b!1035120))

(assert (= (and b!1035120 res!691212) b!1035118))

(assert (= (and b!1035119 condMapEmpty!38336) mapIsEmpty!38336))

(assert (= (and b!1035119 (not condMapEmpty!38336)) mapNonEmpty!38336))

(get-info :version)

(assert (= (and mapNonEmpty!38336 ((_ is ValueCellFull!11573) mapValue!38336)) b!1035116))

(assert (= (and b!1035119 ((_ is ValueCellFull!11573) mapDefault!38336)) b!1035117))

(assert (= b!1035121 b!1035119))

(assert (= start!90492 b!1035121))

(declare-fun m!954681 () Bool)

(assert (=> start!90492 m!954681))

(declare-fun m!954683 () Bool)

(assert (=> b!1035120 m!954683))

(declare-fun m!954685 () Bool)

(assert (=> b!1035121 m!954685))

(declare-fun m!954687 () Bool)

(assert (=> b!1035121 m!954687))

(declare-fun m!954689 () Bool)

(assert (=> mapNonEmpty!38336 m!954689))

(check-sat (not b!1035121) (not start!90492) (not b!1035120) b_and!33307 tp_is_empty!24553 (not mapNonEmpty!38336) (not b_next!20833))
(check-sat b_and!33307 (not b_next!20833))
(get-model)

(declare-fun d!124357 () Bool)

(assert (=> d!124357 (= (validMask!0 (mask!30124 thiss!1427)) (and (or (= (mask!30124 thiss!1427) #b00000000000000000000000000000111) (= (mask!30124 thiss!1427) #b00000000000000000000000000001111) (= (mask!30124 thiss!1427) #b00000000000000000000000000011111) (= (mask!30124 thiss!1427) #b00000000000000000000000000111111) (= (mask!30124 thiss!1427) #b00000000000000000000000001111111) (= (mask!30124 thiss!1427) #b00000000000000000000000011111111) (= (mask!30124 thiss!1427) #b00000000000000000000000111111111) (= (mask!30124 thiss!1427) #b00000000000000000000001111111111) (= (mask!30124 thiss!1427) #b00000000000000000000011111111111) (= (mask!30124 thiss!1427) #b00000000000000000000111111111111) (= (mask!30124 thiss!1427) #b00000000000000000001111111111111) (= (mask!30124 thiss!1427) #b00000000000000000011111111111111) (= (mask!30124 thiss!1427) #b00000000000000000111111111111111) (= (mask!30124 thiss!1427) #b00000000000000001111111111111111) (= (mask!30124 thiss!1427) #b00000000000000011111111111111111) (= (mask!30124 thiss!1427) #b00000000000000111111111111111111) (= (mask!30124 thiss!1427) #b00000000000001111111111111111111) (= (mask!30124 thiss!1427) #b00000000000011111111111111111111) (= (mask!30124 thiss!1427) #b00000000000111111111111111111111) (= (mask!30124 thiss!1427) #b00000000001111111111111111111111) (= (mask!30124 thiss!1427) #b00000000011111111111111111111111) (= (mask!30124 thiss!1427) #b00000000111111111111111111111111) (= (mask!30124 thiss!1427) #b00000001111111111111111111111111) (= (mask!30124 thiss!1427) #b00000011111111111111111111111111) (= (mask!30124 thiss!1427) #b00000111111111111111111111111111) (= (mask!30124 thiss!1427) #b00001111111111111111111111111111) (= (mask!30124 thiss!1427) #b00011111111111111111111111111111) (= (mask!30124 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30124 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035120 d!124357))

(declare-fun d!124359 () Bool)

(assert (=> d!124359 (= (array_inv!24253 (_keys!11430 thiss!1427)) (bvsge (size!31885 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035121 d!124359))

(declare-fun d!124361 () Bool)

(assert (=> d!124361 (= (array_inv!24254 (_values!6271 thiss!1427)) (bvsge (size!31886 (_values!6271 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035121 d!124361))

(declare-fun d!124363 () Bool)

(declare-fun res!691238 () Bool)

(declare-fun e!585298 () Bool)

(assert (=> d!124363 (=> (not res!691238) (not e!585298))))

(declare-fun simpleValid!411 (LongMapFixedSize!5740) Bool)

(assert (=> d!124363 (= res!691238 (simpleValid!411 thiss!1427))))

(assert (=> d!124363 (= (valid!2157 thiss!1427) e!585298)))

(declare-fun b!1035171 () Bool)

(declare-fun res!691239 () Bool)

(assert (=> b!1035171 (=> (not res!691239) (not e!585298))))

(declare-fun arrayCountValidKeys!0 (array!65137 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035171 (= res!691239 (= (arrayCountValidKeys!0 (_keys!11430 thiss!1427) #b00000000000000000000000000000000 (size!31885 (_keys!11430 thiss!1427))) (_size!2925 thiss!1427)))))

(declare-fun b!1035172 () Bool)

(declare-fun res!691240 () Bool)

(assert (=> b!1035172 (=> (not res!691240) (not e!585298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65137 (_ BitVec 32)) Bool)

(assert (=> b!1035172 (= res!691240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11430 thiss!1427) (mask!30124 thiss!1427)))))

(declare-fun b!1035173 () Bool)

(declare-datatypes ((List!21947 0))(
  ( (Nil!21944) (Cons!21943 (h!23145 (_ BitVec 64)) (t!31141 List!21947)) )
))
(declare-fun arrayNoDuplicates!0 (array!65137 (_ BitVec 32) List!21947) Bool)

(assert (=> b!1035173 (= e!585298 (arrayNoDuplicates!0 (_keys!11430 thiss!1427) #b00000000000000000000000000000000 Nil!21944))))

(assert (= (and d!124363 res!691238) b!1035171))

(assert (= (and b!1035171 res!691239) b!1035172))

(assert (= (and b!1035172 res!691240) b!1035173))

(declare-fun m!954711 () Bool)

(assert (=> d!124363 m!954711))

(declare-fun m!954713 () Bool)

(assert (=> b!1035171 m!954713))

(declare-fun m!954715 () Bool)

(assert (=> b!1035172 m!954715))

(declare-fun m!954717 () Bool)

(assert (=> b!1035173 m!954717))

(assert (=> start!90492 d!124363))

(declare-fun condMapEmpty!38345 () Bool)

(declare-fun mapDefault!38345 () ValueCell!11573)

(assert (=> mapNonEmpty!38336 (= condMapEmpty!38345 (= mapRest!38336 ((as const (Array (_ BitVec 32) ValueCell!11573)) mapDefault!38345)))))

(declare-fun e!585304 () Bool)

(declare-fun mapRes!38345 () Bool)

(assert (=> mapNonEmpty!38336 (= tp!73622 (and e!585304 mapRes!38345))))

(declare-fun b!1035180 () Bool)

(declare-fun e!585303 () Bool)

(assert (=> b!1035180 (= e!585303 tp_is_empty!24553)))

(declare-fun mapIsEmpty!38345 () Bool)

(assert (=> mapIsEmpty!38345 mapRes!38345))

(declare-fun mapNonEmpty!38345 () Bool)

(declare-fun tp!73638 () Bool)

(assert (=> mapNonEmpty!38345 (= mapRes!38345 (and tp!73638 e!585303))))

(declare-fun mapRest!38345 () (Array (_ BitVec 32) ValueCell!11573))

(declare-fun mapValue!38345 () ValueCell!11573)

(declare-fun mapKey!38345 () (_ BitVec 32))

(assert (=> mapNonEmpty!38345 (= mapRest!38336 (store mapRest!38345 mapKey!38345 mapValue!38345))))

(declare-fun b!1035181 () Bool)

(assert (=> b!1035181 (= e!585304 tp_is_empty!24553)))

(assert (= (and mapNonEmpty!38336 condMapEmpty!38345) mapIsEmpty!38345))

(assert (= (and mapNonEmpty!38336 (not condMapEmpty!38345)) mapNonEmpty!38345))

(assert (= (and mapNonEmpty!38345 ((_ is ValueCellFull!11573) mapValue!38345)) b!1035180))

(assert (= (and mapNonEmpty!38336 ((_ is ValueCellFull!11573) mapDefault!38345)) b!1035181))

(declare-fun m!954719 () Bool)

(assert (=> mapNonEmpty!38345 m!954719))

(check-sat (not b!1035173) (not d!124363) (not b!1035171) (not b_next!20833) (not mapNonEmpty!38345) (not b!1035172) b_and!33307 tp_is_empty!24553)
(check-sat b_and!33307 (not b_next!20833))
(get-model)

(declare-fun d!124365 () Bool)

(declare-fun res!691246 () Bool)

(declare-fun e!585312 () Bool)

(assert (=> d!124365 (=> res!691246 e!585312)))

(assert (=> d!124365 (= res!691246 (bvsge #b00000000000000000000000000000000 (size!31885 (_keys!11430 thiss!1427))))))

(assert (=> d!124365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11430 thiss!1427) (mask!30124 thiss!1427)) e!585312)))

(declare-fun bm!43759 () Bool)

(declare-fun call!43762 () Bool)

(assert (=> bm!43759 (= call!43762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11430 thiss!1427) (mask!30124 thiss!1427)))))

(declare-fun b!1035190 () Bool)

(declare-fun e!585311 () Bool)

(assert (=> b!1035190 (= e!585311 call!43762)))

(declare-fun b!1035191 () Bool)

(declare-fun e!585313 () Bool)

(assert (=> b!1035191 (= e!585313 e!585311)))

(declare-fun lt!456551 () (_ BitVec 64))

(assert (=> b!1035191 (= lt!456551 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33768 0))(
  ( (Unit!33769) )
))
(declare-fun lt!456552 () Unit!33768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65137 (_ BitVec 64) (_ BitVec 32)) Unit!33768)

(assert (=> b!1035191 (= lt!456552 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11430 thiss!1427) lt!456551 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035191 (arrayContainsKey!0 (_keys!11430 thiss!1427) lt!456551 #b00000000000000000000000000000000)))

(declare-fun lt!456553 () Unit!33768)

(assert (=> b!1035191 (= lt!456553 lt!456552)))

(declare-fun res!691245 () Bool)

(declare-datatypes ((SeekEntryResult!9734 0))(
  ( (MissingZero!9734 (index!41307 (_ BitVec 32))) (Found!9734 (index!41308 (_ BitVec 32))) (Intermediate!9734 (undefined!10546 Bool) (index!41309 (_ BitVec 32)) (x!92352 (_ BitVec 32))) (Undefined!9734) (MissingVacant!9734 (index!41310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65137 (_ BitVec 32)) SeekEntryResult!9734)

(assert (=> b!1035191 (= res!691245 (= (seekEntryOrOpen!0 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000) (_keys!11430 thiss!1427) (mask!30124 thiss!1427)) (Found!9734 #b00000000000000000000000000000000)))))

(assert (=> b!1035191 (=> (not res!691245) (not e!585311))))

(declare-fun b!1035192 () Bool)

(assert (=> b!1035192 (= e!585313 call!43762)))

(declare-fun b!1035193 () Bool)

(assert (=> b!1035193 (= e!585312 e!585313)))

(declare-fun c!104688 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035193 (= c!104688 (validKeyInArray!0 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124365 (not res!691246)) b!1035193))

(assert (= (and b!1035193 c!104688) b!1035191))

(assert (= (and b!1035193 (not c!104688)) b!1035192))

(assert (= (and b!1035191 res!691245) b!1035190))

(assert (= (or b!1035190 b!1035192) bm!43759))

(declare-fun m!954721 () Bool)

(assert (=> bm!43759 m!954721))

(declare-fun m!954723 () Bool)

(assert (=> b!1035191 m!954723))

(declare-fun m!954725 () Bool)

(assert (=> b!1035191 m!954725))

(declare-fun m!954727 () Bool)

(assert (=> b!1035191 m!954727))

(assert (=> b!1035191 m!954723))

(declare-fun m!954729 () Bool)

(assert (=> b!1035191 m!954729))

(assert (=> b!1035193 m!954723))

(assert (=> b!1035193 m!954723))

(declare-fun m!954731 () Bool)

(assert (=> b!1035193 m!954731))

(assert (=> b!1035172 d!124365))

(declare-fun b!1035204 () Bool)

(declare-fun e!585324 () Bool)

(declare-fun e!585325 () Bool)

(assert (=> b!1035204 (= e!585324 e!585325)))

(declare-fun res!691253 () Bool)

(assert (=> b!1035204 (=> (not res!691253) (not e!585325))))

(declare-fun e!585323 () Bool)

(assert (=> b!1035204 (= res!691253 (not e!585323))))

(declare-fun res!691255 () Bool)

(assert (=> b!1035204 (=> (not res!691255) (not e!585323))))

(assert (=> b!1035204 (= res!691255 (validKeyInArray!0 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035205 () Bool)

(declare-fun contains!5999 (List!21947 (_ BitVec 64)) Bool)

(assert (=> b!1035205 (= e!585323 (contains!5999 Nil!21944 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43762 () Bool)

(declare-fun call!43765 () Bool)

(declare-fun c!104691 () Bool)

(assert (=> bm!43762 (= call!43765 (arrayNoDuplicates!0 (_keys!11430 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104691 (Cons!21943 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000) Nil!21944) Nil!21944)))))

(declare-fun b!1035206 () Bool)

(declare-fun e!585322 () Bool)

(assert (=> b!1035206 (= e!585322 call!43765)))

(declare-fun b!1035207 () Bool)

(assert (=> b!1035207 (= e!585325 e!585322)))

(assert (=> b!1035207 (= c!104691 (validKeyInArray!0 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035208 () Bool)

(assert (=> b!1035208 (= e!585322 call!43765)))

(declare-fun d!124367 () Bool)

(declare-fun res!691254 () Bool)

(assert (=> d!124367 (=> res!691254 e!585324)))

(assert (=> d!124367 (= res!691254 (bvsge #b00000000000000000000000000000000 (size!31885 (_keys!11430 thiss!1427))))))

(assert (=> d!124367 (= (arrayNoDuplicates!0 (_keys!11430 thiss!1427) #b00000000000000000000000000000000 Nil!21944) e!585324)))

(assert (= (and d!124367 (not res!691254)) b!1035204))

(assert (= (and b!1035204 res!691255) b!1035205))

(assert (= (and b!1035204 res!691253) b!1035207))

(assert (= (and b!1035207 c!104691) b!1035208))

(assert (= (and b!1035207 (not c!104691)) b!1035206))

(assert (= (or b!1035208 b!1035206) bm!43762))

(assert (=> b!1035204 m!954723))

(assert (=> b!1035204 m!954723))

(assert (=> b!1035204 m!954731))

(assert (=> b!1035205 m!954723))

(assert (=> b!1035205 m!954723))

(declare-fun m!954733 () Bool)

(assert (=> b!1035205 m!954733))

(assert (=> bm!43762 m!954723))

(declare-fun m!954735 () Bool)

(assert (=> bm!43762 m!954735))

(assert (=> b!1035207 m!954723))

(assert (=> b!1035207 m!954723))

(assert (=> b!1035207 m!954731))

(assert (=> b!1035173 d!124367))

(declare-fun d!124369 () Bool)

(declare-fun lt!456556 () (_ BitVec 32))

(assert (=> d!124369 (and (bvsge lt!456556 #b00000000000000000000000000000000) (bvsle lt!456556 (bvsub (size!31885 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585331 () (_ BitVec 32))

(assert (=> d!124369 (= lt!456556 e!585331)))

(declare-fun c!104697 () Bool)

(assert (=> d!124369 (= c!104697 (bvsge #b00000000000000000000000000000000 (size!31885 (_keys!11430 thiss!1427))))))

(assert (=> d!124369 (and (bvsle #b00000000000000000000000000000000 (size!31885 (_keys!11430 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31885 (_keys!11430 thiss!1427)) (size!31885 (_keys!11430 thiss!1427))))))

(assert (=> d!124369 (= (arrayCountValidKeys!0 (_keys!11430 thiss!1427) #b00000000000000000000000000000000 (size!31885 (_keys!11430 thiss!1427))) lt!456556)))

(declare-fun b!1035217 () Bool)

(declare-fun e!585330 () (_ BitVec 32))

(declare-fun call!43768 () (_ BitVec 32))

(assert (=> b!1035217 (= e!585330 call!43768)))

(declare-fun b!1035218 () Bool)

(assert (=> b!1035218 (= e!585331 #b00000000000000000000000000000000)))

(declare-fun b!1035219 () Bool)

(assert (=> b!1035219 (= e!585330 (bvadd #b00000000000000000000000000000001 call!43768))))

(declare-fun bm!43765 () Bool)

(assert (=> bm!43765 (= call!43768 (arrayCountValidKeys!0 (_keys!11430 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31885 (_keys!11430 thiss!1427))))))

(declare-fun b!1035220 () Bool)

(assert (=> b!1035220 (= e!585331 e!585330)))

(declare-fun c!104696 () Bool)

(assert (=> b!1035220 (= c!104696 (validKeyInArray!0 (select (arr!31356 (_keys!11430 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124369 c!104697) b!1035218))

(assert (= (and d!124369 (not c!104697)) b!1035220))

(assert (= (and b!1035220 c!104696) b!1035219))

(assert (= (and b!1035220 (not c!104696)) b!1035217))

(assert (= (or b!1035219 b!1035217) bm!43765))

(declare-fun m!954737 () Bool)

(assert (=> bm!43765 m!954737))

(assert (=> b!1035220 m!954723))

(assert (=> b!1035220 m!954723))

(assert (=> b!1035220 m!954731))

(assert (=> b!1035171 d!124369))

(declare-fun b!1035230 () Bool)

(declare-fun res!691265 () Bool)

(declare-fun e!585334 () Bool)

(assert (=> b!1035230 (=> (not res!691265) (not e!585334))))

(declare-fun size!31891 (LongMapFixedSize!5740) (_ BitVec 32))

(assert (=> b!1035230 (= res!691265 (bvsge (size!31891 thiss!1427) (_size!2925 thiss!1427)))))

(declare-fun d!124371 () Bool)

(declare-fun res!691266 () Bool)

(assert (=> d!124371 (=> (not res!691266) (not e!585334))))

(assert (=> d!124371 (= res!691266 (validMask!0 (mask!30124 thiss!1427)))))

(assert (=> d!124371 (= (simpleValid!411 thiss!1427) e!585334)))

(declare-fun b!1035231 () Bool)

(declare-fun res!691267 () Bool)

(assert (=> b!1035231 (=> (not res!691267) (not e!585334))))

(assert (=> b!1035231 (= res!691267 (= (size!31891 thiss!1427) (bvadd (_size!2925 thiss!1427) (bvsdiv (bvadd (extraKeys!5978 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1035229 () Bool)

(declare-fun res!691264 () Bool)

(assert (=> b!1035229 (=> (not res!691264) (not e!585334))))

(assert (=> b!1035229 (= res!691264 (and (= (size!31886 (_values!6271 thiss!1427)) (bvadd (mask!30124 thiss!1427) #b00000000000000000000000000000001)) (= (size!31885 (_keys!11430 thiss!1427)) (size!31886 (_values!6271 thiss!1427))) (bvsge (_size!2925 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2925 thiss!1427) (bvadd (mask!30124 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1035232 () Bool)

(assert (=> b!1035232 (= e!585334 (and (bvsge (extraKeys!5978 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5978 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2925 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124371 res!691266) b!1035229))

(assert (= (and b!1035229 res!691264) b!1035230))

(assert (= (and b!1035230 res!691265) b!1035231))

(assert (= (and b!1035231 res!691267) b!1035232))

(declare-fun m!954739 () Bool)

(assert (=> b!1035230 m!954739))

(assert (=> d!124371 m!954683))

(assert (=> b!1035231 m!954739))

(assert (=> d!124363 d!124371))

(declare-fun condMapEmpty!38346 () Bool)

(declare-fun mapDefault!38346 () ValueCell!11573)

(assert (=> mapNonEmpty!38345 (= condMapEmpty!38346 (= mapRest!38345 ((as const (Array (_ BitVec 32) ValueCell!11573)) mapDefault!38346)))))

(declare-fun e!585336 () Bool)

(declare-fun mapRes!38346 () Bool)

(assert (=> mapNonEmpty!38345 (= tp!73638 (and e!585336 mapRes!38346))))

(declare-fun b!1035233 () Bool)

(declare-fun e!585335 () Bool)

(assert (=> b!1035233 (= e!585335 tp_is_empty!24553)))

(declare-fun mapIsEmpty!38346 () Bool)

(assert (=> mapIsEmpty!38346 mapRes!38346))

(declare-fun mapNonEmpty!38346 () Bool)

(declare-fun tp!73639 () Bool)

(assert (=> mapNonEmpty!38346 (= mapRes!38346 (and tp!73639 e!585335))))

(declare-fun mapRest!38346 () (Array (_ BitVec 32) ValueCell!11573))

(declare-fun mapValue!38346 () ValueCell!11573)

(declare-fun mapKey!38346 () (_ BitVec 32))

(assert (=> mapNonEmpty!38346 (= mapRest!38345 (store mapRest!38346 mapKey!38346 mapValue!38346))))

(declare-fun b!1035234 () Bool)

(assert (=> b!1035234 (= e!585336 tp_is_empty!24553)))

(assert (= (and mapNonEmpty!38345 condMapEmpty!38346) mapIsEmpty!38346))

(assert (= (and mapNonEmpty!38345 (not condMapEmpty!38346)) mapNonEmpty!38346))

(assert (= (and mapNonEmpty!38346 ((_ is ValueCellFull!11573) mapValue!38346)) b!1035233))

(assert (= (and mapNonEmpty!38345 ((_ is ValueCellFull!11573) mapDefault!38346)) b!1035234))

(declare-fun m!954741 () Bool)

(assert (=> mapNonEmpty!38346 m!954741))

(check-sat (not b!1035220) (not mapNonEmpty!38346) (not bm!43759) (not b!1035204) (not d!124371) (not b!1035230) (not b!1035205) (not b!1035193) (not b!1035231) b_and!33307 (not bm!43762) (not b_next!20833) (not b!1035191) (not bm!43765) tp_is_empty!24553 (not b!1035207))
(check-sat b_and!33307 (not b_next!20833))
