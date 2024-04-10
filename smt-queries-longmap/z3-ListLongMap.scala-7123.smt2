; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90284 () Bool)

(assert start!90284)

(declare-fun b!1033476 () Bool)

(declare-fun b_free!20793 () Bool)

(declare-fun b_next!20793 () Bool)

(assert (=> b!1033476 (= b_free!20793 (not b_next!20793))))

(declare-fun tp!73475 () Bool)

(declare-fun b_and!33261 () Bool)

(assert (=> b!1033476 (= tp!73475 b_and!33261)))

(declare-fun mapIsEmpty!38249 () Bool)

(declare-fun mapRes!38249 () Bool)

(assert (=> mapIsEmpty!38249 mapRes!38249))

(declare-fun e!584154 () Bool)

(declare-fun e!584155 () Bool)

(declare-fun tp_is_empty!24513 () Bool)

(declare-datatypes ((V!37557 0))(
  ( (V!37558 (val!12307 Int)) )
))
(declare-datatypes ((ValueCell!11553 0))(
  ( (ValueCellFull!11553 (v!14884 V!37557)) (EmptyCell!11553) )
))
(declare-datatypes ((array!65104 0))(
  ( (array!65105 (arr!31347 (Array (_ BitVec 32) (_ BitVec 64))) (size!31869 (_ BitVec 32))) )
))
(declare-datatypes ((array!65106 0))(
  ( (array!65107 (arr!31348 (Array (_ BitVec 32) ValueCell!11553)) (size!31870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5700 0))(
  ( (LongMapFixedSize!5701 (defaultEntry!6224 Int) (mask!30077 (_ BitVec 32)) (extraKeys!5956 (_ BitVec 32)) (zeroValue!6060 V!37557) (minValue!6060 V!37557) (_size!2905 (_ BitVec 32)) (_keys!11403 array!65104) (_values!6247 array!65106) (_vacant!2905 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5700)

(declare-fun array_inv!24253 (array!65104) Bool)

(declare-fun array_inv!24254 (array!65106) Bool)

(assert (=> b!1033476 (= e!584154 (and tp!73475 tp_is_empty!24513 (array_inv!24253 (_keys!11403 thiss!1427)) (array_inv!24254 (_values!6247 thiss!1427)) e!584155))))

(declare-fun b!1033477 () Bool)

(declare-fun e!584150 () Bool)

(assert (=> b!1033477 (= e!584150 tp_is_empty!24513)))

(declare-fun b!1033478 () Bool)

(declare-fun e!584153 () Bool)

(assert (=> b!1033478 (= e!584153 tp_is_empty!24513)))

(declare-fun mapNonEmpty!38249 () Bool)

(declare-fun tp!73476 () Bool)

(assert (=> mapNonEmpty!38249 (= mapRes!38249 (and tp!73476 e!584153))))

(declare-fun mapKey!38249 () (_ BitVec 32))

(declare-fun mapValue!38249 () ValueCell!11553)

(declare-fun mapRest!38249 () (Array (_ BitVec 32) ValueCell!11553))

(assert (=> mapNonEmpty!38249 (= (arr!31348 (_values!6247 thiss!1427)) (store mapRest!38249 mapKey!38249 mapValue!38249))))

(declare-fun b!1033480 () Bool)

(declare-fun res!690526 () Bool)

(declare-fun e!584151 () Bool)

(assert (=> b!1033480 (=> (not res!690526) (not e!584151))))

(assert (=> b!1033480 (= res!690526 (and (= (size!31870 (_values!6247 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30077 thiss!1427))) (= (size!31869 (_keys!11403 thiss!1427)) (size!31870 (_values!6247 thiss!1427))) (bvsge (mask!30077 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5956 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5956 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5956 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5956 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5956 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5956 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5956 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033481 () Bool)

(declare-fun res!690527 () Bool)

(assert (=> b!1033481 (=> (not res!690527) (not e!584151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033481 (= res!690527 (validMask!0 (mask!30077 thiss!1427)))))

(declare-fun b!1033482 () Bool)

(declare-datatypes ((List!21902 0))(
  ( (Nil!21899) (Cons!21898 (h!23100 (_ BitVec 64)) (t!31096 List!21902)) )
))
(declare-fun arrayNoDuplicates!0 (array!65104 (_ BitVec 32) List!21902) Bool)

(assert (=> b!1033482 (= e!584151 (not (arrayNoDuplicates!0 (_keys!11403 thiss!1427) #b00000000000000000000000000000000 Nil!21899)))))

(declare-fun b!1033479 () Bool)

(declare-fun res!690529 () Bool)

(assert (=> b!1033479 (=> (not res!690529) (not e!584151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65104 (_ BitVec 32)) Bool)

(assert (=> b!1033479 (= res!690529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11403 thiss!1427) (mask!30077 thiss!1427)))))

(declare-fun res!690530 () Bool)

(assert (=> start!90284 (=> (not res!690530) (not e!584151))))

(declare-fun valid!2154 (LongMapFixedSize!5700) Bool)

(assert (=> start!90284 (= res!690530 (valid!2154 thiss!1427))))

(assert (=> start!90284 e!584151))

(assert (=> start!90284 e!584154))

(assert (=> start!90284 true))

(declare-fun b!1033483 () Bool)

(declare-fun res!690528 () Bool)

(assert (=> b!1033483 (=> (not res!690528) (not e!584151))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033483 (= res!690528 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033484 () Bool)

(assert (=> b!1033484 (= e!584155 (and e!584150 mapRes!38249))))

(declare-fun condMapEmpty!38249 () Bool)

(declare-fun mapDefault!38249 () ValueCell!11553)

(assert (=> b!1033484 (= condMapEmpty!38249 (= (arr!31348 (_values!6247 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11553)) mapDefault!38249)))))

(assert (= (and start!90284 res!690530) b!1033483))

(assert (= (and b!1033483 res!690528) b!1033481))

(assert (= (and b!1033481 res!690527) b!1033480))

(assert (= (and b!1033480 res!690526) b!1033479))

(assert (= (and b!1033479 res!690529) b!1033482))

(assert (= (and b!1033484 condMapEmpty!38249) mapIsEmpty!38249))

(assert (= (and b!1033484 (not condMapEmpty!38249)) mapNonEmpty!38249))

(get-info :version)

(assert (= (and mapNonEmpty!38249 ((_ is ValueCellFull!11553) mapValue!38249)) b!1033478))

(assert (= (and b!1033484 ((_ is ValueCellFull!11553) mapDefault!38249)) b!1033477))

(assert (= b!1033476 b!1033484))

(assert (= start!90284 b!1033476))

(declare-fun m!953217 () Bool)

(assert (=> b!1033482 m!953217))

(declare-fun m!953219 () Bool)

(assert (=> b!1033476 m!953219))

(declare-fun m!953221 () Bool)

(assert (=> b!1033476 m!953221))

(declare-fun m!953223 () Bool)

(assert (=> start!90284 m!953223))

(declare-fun m!953225 () Bool)

(assert (=> b!1033479 m!953225))

(declare-fun m!953227 () Bool)

(assert (=> mapNonEmpty!38249 m!953227))

(declare-fun m!953229 () Bool)

(assert (=> b!1033481 m!953229))

(check-sat (not start!90284) (not b!1033476) (not mapNonEmpty!38249) (not b!1033479) tp_is_empty!24513 (not b!1033481) (not b_next!20793) b_and!33261 (not b!1033482))
(check-sat b_and!33261 (not b_next!20793))
(get-model)

(declare-fun d!123791 () Bool)

(declare-fun res!690552 () Bool)

(declare-fun e!584176 () Bool)

(assert (=> d!123791 (=> (not res!690552) (not e!584176))))

(declare-fun simpleValid!404 (LongMapFixedSize!5700) Bool)

(assert (=> d!123791 (= res!690552 (simpleValid!404 thiss!1427))))

(assert (=> d!123791 (= (valid!2154 thiss!1427) e!584176)))

(declare-fun b!1033518 () Bool)

(declare-fun res!690553 () Bool)

(assert (=> b!1033518 (=> (not res!690553) (not e!584176))))

(declare-fun arrayCountValidKeys!0 (array!65104 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033518 (= res!690553 (= (arrayCountValidKeys!0 (_keys!11403 thiss!1427) #b00000000000000000000000000000000 (size!31869 (_keys!11403 thiss!1427))) (_size!2905 thiss!1427)))))

(declare-fun b!1033519 () Bool)

(declare-fun res!690554 () Bool)

(assert (=> b!1033519 (=> (not res!690554) (not e!584176))))

(assert (=> b!1033519 (= res!690554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11403 thiss!1427) (mask!30077 thiss!1427)))))

(declare-fun b!1033520 () Bool)

(assert (=> b!1033520 (= e!584176 (arrayNoDuplicates!0 (_keys!11403 thiss!1427) #b00000000000000000000000000000000 Nil!21899))))

(assert (= (and d!123791 res!690552) b!1033518))

(assert (= (and b!1033518 res!690553) b!1033519))

(assert (= (and b!1033519 res!690554) b!1033520))

(declare-fun m!953245 () Bool)

(assert (=> d!123791 m!953245))

(declare-fun m!953247 () Bool)

(assert (=> b!1033518 m!953247))

(assert (=> b!1033519 m!953225))

(assert (=> b!1033520 m!953217))

(assert (=> start!90284 d!123791))

(declare-fun d!123793 () Bool)

(declare-fun res!690563 () Bool)

(declare-fun e!584185 () Bool)

(assert (=> d!123793 (=> res!690563 e!584185)))

(assert (=> d!123793 (= res!690563 (bvsge #b00000000000000000000000000000000 (size!31869 (_keys!11403 thiss!1427))))))

(assert (=> d!123793 (= (arrayNoDuplicates!0 (_keys!11403 thiss!1427) #b00000000000000000000000000000000 Nil!21899) e!584185)))

(declare-fun b!1033531 () Bool)

(declare-fun e!584186 () Bool)

(declare-fun call!43641 () Bool)

(assert (=> b!1033531 (= e!584186 call!43641)))

(declare-fun b!1033532 () Bool)

(declare-fun e!584188 () Bool)

(declare-fun contains!6011 (List!21902 (_ BitVec 64)) Bool)

(assert (=> b!1033532 (= e!584188 (contains!6011 Nil!21899 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033533 () Bool)

(declare-fun e!584187 () Bool)

(assert (=> b!1033533 (= e!584185 e!584187)))

(declare-fun res!690562 () Bool)

(assert (=> b!1033533 (=> (not res!690562) (not e!584187))))

(assert (=> b!1033533 (= res!690562 (not e!584188))))

(declare-fun res!690561 () Bool)

(assert (=> b!1033533 (=> (not res!690561) (not e!584188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033533 (= res!690561 (validKeyInArray!0 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43638 () Bool)

(declare-fun c!104367 () Bool)

(assert (=> bm!43638 (= call!43641 (arrayNoDuplicates!0 (_keys!11403 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104367 (Cons!21898 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000) Nil!21899) Nil!21899)))))

(declare-fun b!1033534 () Bool)

(assert (=> b!1033534 (= e!584186 call!43641)))

(declare-fun b!1033535 () Bool)

(assert (=> b!1033535 (= e!584187 e!584186)))

(assert (=> b!1033535 (= c!104367 (validKeyInArray!0 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123793 (not res!690563)) b!1033533))

(assert (= (and b!1033533 res!690561) b!1033532))

(assert (= (and b!1033533 res!690562) b!1033535))

(assert (= (and b!1033535 c!104367) b!1033534))

(assert (= (and b!1033535 (not c!104367)) b!1033531))

(assert (= (or b!1033534 b!1033531) bm!43638))

(declare-fun m!953249 () Bool)

(assert (=> b!1033532 m!953249))

(assert (=> b!1033532 m!953249))

(declare-fun m!953251 () Bool)

(assert (=> b!1033532 m!953251))

(assert (=> b!1033533 m!953249))

(assert (=> b!1033533 m!953249))

(declare-fun m!953253 () Bool)

(assert (=> b!1033533 m!953253))

(assert (=> bm!43638 m!953249))

(declare-fun m!953255 () Bool)

(assert (=> bm!43638 m!953255))

(assert (=> b!1033535 m!953249))

(assert (=> b!1033535 m!953249))

(assert (=> b!1033535 m!953253))

(assert (=> b!1033482 d!123793))

(declare-fun d!123795 () Bool)

(assert (=> d!123795 (= (validMask!0 (mask!30077 thiss!1427)) (and (or (= (mask!30077 thiss!1427) #b00000000000000000000000000000111) (= (mask!30077 thiss!1427) #b00000000000000000000000000001111) (= (mask!30077 thiss!1427) #b00000000000000000000000000011111) (= (mask!30077 thiss!1427) #b00000000000000000000000000111111) (= (mask!30077 thiss!1427) #b00000000000000000000000001111111) (= (mask!30077 thiss!1427) #b00000000000000000000000011111111) (= (mask!30077 thiss!1427) #b00000000000000000000000111111111) (= (mask!30077 thiss!1427) #b00000000000000000000001111111111) (= (mask!30077 thiss!1427) #b00000000000000000000011111111111) (= (mask!30077 thiss!1427) #b00000000000000000000111111111111) (= (mask!30077 thiss!1427) #b00000000000000000001111111111111) (= (mask!30077 thiss!1427) #b00000000000000000011111111111111) (= (mask!30077 thiss!1427) #b00000000000000000111111111111111) (= (mask!30077 thiss!1427) #b00000000000000001111111111111111) (= (mask!30077 thiss!1427) #b00000000000000011111111111111111) (= (mask!30077 thiss!1427) #b00000000000000111111111111111111) (= (mask!30077 thiss!1427) #b00000000000001111111111111111111) (= (mask!30077 thiss!1427) #b00000000000011111111111111111111) (= (mask!30077 thiss!1427) #b00000000000111111111111111111111) (= (mask!30077 thiss!1427) #b00000000001111111111111111111111) (= (mask!30077 thiss!1427) #b00000000011111111111111111111111) (= (mask!30077 thiss!1427) #b00000000111111111111111111111111) (= (mask!30077 thiss!1427) #b00000001111111111111111111111111) (= (mask!30077 thiss!1427) #b00000011111111111111111111111111) (= (mask!30077 thiss!1427) #b00000111111111111111111111111111) (= (mask!30077 thiss!1427) #b00001111111111111111111111111111) (= (mask!30077 thiss!1427) #b00011111111111111111111111111111) (= (mask!30077 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30077 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033481 d!123795))

(declare-fun d!123797 () Bool)

(assert (=> d!123797 (= (array_inv!24253 (_keys!11403 thiss!1427)) (bvsge (size!31869 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033476 d!123797))

(declare-fun d!123799 () Bool)

(assert (=> d!123799 (= (array_inv!24254 (_values!6247 thiss!1427)) (bvsge (size!31870 (_values!6247 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033476 d!123799))

(declare-fun b!1033544 () Bool)

(declare-fun e!584197 () Bool)

(declare-fun call!43644 () Bool)

(assert (=> b!1033544 (= e!584197 call!43644)))

(declare-fun d!123801 () Bool)

(declare-fun res!690568 () Bool)

(declare-fun e!584196 () Bool)

(assert (=> d!123801 (=> res!690568 e!584196)))

(assert (=> d!123801 (= res!690568 (bvsge #b00000000000000000000000000000000 (size!31869 (_keys!11403 thiss!1427))))))

(assert (=> d!123801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11403 thiss!1427) (mask!30077 thiss!1427)) e!584196)))

(declare-fun bm!43641 () Bool)

(assert (=> bm!43641 (= call!43644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11403 thiss!1427) (mask!30077 thiss!1427)))))

(declare-fun b!1033545 () Bool)

(declare-fun e!584195 () Bool)

(assert (=> b!1033545 (= e!584197 e!584195)))

(declare-fun lt!456106 () (_ BitVec 64))

(assert (=> b!1033545 (= lt!456106 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33827 0))(
  ( (Unit!33828) )
))
(declare-fun lt!456107 () Unit!33827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65104 (_ BitVec 64) (_ BitVec 32)) Unit!33827)

(assert (=> b!1033545 (= lt!456107 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11403 thiss!1427) lt!456106 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033545 (arrayContainsKey!0 (_keys!11403 thiss!1427) lt!456106 #b00000000000000000000000000000000)))

(declare-fun lt!456105 () Unit!33827)

(assert (=> b!1033545 (= lt!456105 lt!456107)))

(declare-fun res!690569 () Bool)

(declare-datatypes ((SeekEntryResult!9737 0))(
  ( (MissingZero!9737 (index!41319 (_ BitVec 32))) (Found!9737 (index!41320 (_ BitVec 32))) (Intermediate!9737 (undefined!10549 Bool) (index!41321 (_ BitVec 32)) (x!92183 (_ BitVec 32))) (Undefined!9737) (MissingVacant!9737 (index!41322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65104 (_ BitVec 32)) SeekEntryResult!9737)

(assert (=> b!1033545 (= res!690569 (= (seekEntryOrOpen!0 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000) (_keys!11403 thiss!1427) (mask!30077 thiss!1427)) (Found!9737 #b00000000000000000000000000000000)))))

(assert (=> b!1033545 (=> (not res!690569) (not e!584195))))

(declare-fun b!1033546 () Bool)

(assert (=> b!1033546 (= e!584196 e!584197)))

(declare-fun c!104370 () Bool)

(assert (=> b!1033546 (= c!104370 (validKeyInArray!0 (select (arr!31347 (_keys!11403 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033547 () Bool)

(assert (=> b!1033547 (= e!584195 call!43644)))

(assert (= (and d!123801 (not res!690568)) b!1033546))

(assert (= (and b!1033546 c!104370) b!1033545))

(assert (= (and b!1033546 (not c!104370)) b!1033544))

(assert (= (and b!1033545 res!690569) b!1033547))

(assert (= (or b!1033547 b!1033544) bm!43641))

(declare-fun m!953257 () Bool)

(assert (=> bm!43641 m!953257))

(assert (=> b!1033545 m!953249))

(declare-fun m!953259 () Bool)

(assert (=> b!1033545 m!953259))

(declare-fun m!953261 () Bool)

(assert (=> b!1033545 m!953261))

(assert (=> b!1033545 m!953249))

(declare-fun m!953263 () Bool)

(assert (=> b!1033545 m!953263))

(assert (=> b!1033546 m!953249))

(assert (=> b!1033546 m!953249))

(assert (=> b!1033546 m!953253))

(assert (=> b!1033479 d!123801))

(declare-fun b!1033555 () Bool)

(declare-fun e!584203 () Bool)

(assert (=> b!1033555 (= e!584203 tp_is_empty!24513)))

(declare-fun b!1033554 () Bool)

(declare-fun e!584202 () Bool)

(assert (=> b!1033554 (= e!584202 tp_is_empty!24513)))

(declare-fun condMapEmpty!38255 () Bool)

(declare-fun mapDefault!38255 () ValueCell!11553)

(assert (=> mapNonEmpty!38249 (= condMapEmpty!38255 (= mapRest!38249 ((as const (Array (_ BitVec 32) ValueCell!11553)) mapDefault!38255)))))

(declare-fun mapRes!38255 () Bool)

(assert (=> mapNonEmpty!38249 (= tp!73476 (and e!584203 mapRes!38255))))

(declare-fun mapNonEmpty!38255 () Bool)

(declare-fun tp!73485 () Bool)

(assert (=> mapNonEmpty!38255 (= mapRes!38255 (and tp!73485 e!584202))))

(declare-fun mapValue!38255 () ValueCell!11553)

(declare-fun mapKey!38255 () (_ BitVec 32))

(declare-fun mapRest!38255 () (Array (_ BitVec 32) ValueCell!11553))

(assert (=> mapNonEmpty!38255 (= mapRest!38249 (store mapRest!38255 mapKey!38255 mapValue!38255))))

(declare-fun mapIsEmpty!38255 () Bool)

(assert (=> mapIsEmpty!38255 mapRes!38255))

(assert (= (and mapNonEmpty!38249 condMapEmpty!38255) mapIsEmpty!38255))

(assert (= (and mapNonEmpty!38249 (not condMapEmpty!38255)) mapNonEmpty!38255))

(assert (= (and mapNonEmpty!38255 ((_ is ValueCellFull!11553) mapValue!38255)) b!1033554))

(assert (= (and mapNonEmpty!38249 ((_ is ValueCellFull!11553) mapDefault!38255)) b!1033555))

(declare-fun m!953265 () Bool)

(assert (=> mapNonEmpty!38255 m!953265))

(check-sat (not b!1033532) (not b!1033545) (not b!1033546) (not b!1033520) (not b!1033519) (not b!1033535) (not mapNonEmpty!38255) (not b!1033533) tp_is_empty!24513 b_and!33261 (not bm!43641) (not b_next!20793) (not b!1033518) (not d!123791) (not bm!43638))
(check-sat b_and!33261 (not b_next!20793))
