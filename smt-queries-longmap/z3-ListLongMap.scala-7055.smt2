; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89382 () Bool)

(assert start!89382)

(declare-fun b!1024548 () Bool)

(declare-fun b_free!20383 () Bool)

(declare-fun b_next!20383 () Bool)

(assert (=> b!1024548 (= b_free!20383 (not b_next!20383))))

(declare-fun tp!72195 () Bool)

(declare-fun b_and!32603 () Bool)

(assert (=> b!1024548 (= tp!72195 b_and!32603)))

(declare-fun b!1024542 () Bool)

(declare-fun res!685991 () Bool)

(declare-fun e!577560 () Bool)

(assert (=> b!1024542 (=> res!685991 e!577560)))

(declare-datatypes ((List!21769 0))(
  ( (Nil!21766) (Cons!21765 (h!22963 (_ BitVec 64)) (t!30822 List!21769)) )
))
(declare-fun noDuplicate!1476 (List!21769) Bool)

(assert (=> b!1024542 (= res!685991 (not (noDuplicate!1476 Nil!21766)))))

(declare-fun b!1024543 () Bool)

(declare-fun e!577559 () Bool)

(declare-fun e!577557 () Bool)

(assert (=> b!1024543 (= e!577559 e!577557)))

(declare-fun res!685996 () Bool)

(assert (=> b!1024543 (=> (not res!685996) (not e!577557))))

(declare-datatypes ((SeekEntryResult!9594 0))(
  ( (MissingZero!9594 (index!40747 (_ BitVec 32))) (Found!9594 (index!40748 (_ BitVec 32))) (Intermediate!9594 (undefined!10406 Bool) (index!40749 (_ BitVec 32)) (x!91101 (_ BitVec 32))) (Undefined!9594) (MissingVacant!9594 (index!40750 (_ BitVec 32))) )
))
(declare-fun lt!450486 () SeekEntryResult!9594)

(get-info :version)

(assert (=> b!1024543 (= res!685996 ((_ is Found!9594) lt!450486))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37011 0))(
  ( (V!37012 (val!12102 Int)) )
))
(declare-datatypes ((ValueCell!11348 0))(
  ( (ValueCellFull!11348 (v!14670 V!37011)) (EmptyCell!11348) )
))
(declare-datatypes ((array!64195 0))(
  ( (array!64196 (arr!30906 (Array (_ BitVec 32) (_ BitVec 64))) (size!31421 (_ BitVec 32))) )
))
(declare-datatypes ((array!64197 0))(
  ( (array!64198 (arr!30907 (Array (_ BitVec 32) ValueCell!11348)) (size!31422 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5290 0))(
  ( (LongMapFixedSize!5291 (defaultEntry!5997 Int) (mask!29648 (_ BitVec 32)) (extraKeys!5729 (_ BitVec 32)) (zeroValue!5833 V!37011) (minValue!5833 V!37011) (_size!2700 (_ BitVec 32)) (_keys!11140 array!64195) (_values!6020 array!64197) (_vacant!2700 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5290)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64195 (_ BitVec 32)) SeekEntryResult!9594)

(assert (=> b!1024543 (= lt!450486 (seekEntry!0 key!909 (_keys!11140 thiss!1427) (mask!29648 thiss!1427)))))

(declare-fun b!1024544 () Bool)

(assert (=> b!1024544 (= e!577557 (not e!577560))))

(declare-fun res!685994 () Bool)

(assert (=> b!1024544 (=> res!685994 e!577560)))

(assert (=> b!1024544 (= res!685994 (or (bvsge (size!31421 (_keys!11140 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31421 (_keys!11140 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64195 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024544 (= (arrayCountValidKeys!0 (array!64196 (store (arr!30906 (_keys!11140 thiss!1427)) (index!40748 lt!450486) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31421 (_keys!11140 thiss!1427))) #b00000000000000000000000000000000 (size!31421 (_keys!11140 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11140 thiss!1427) #b00000000000000000000000000000000 (size!31421 (_keys!11140 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33259 0))(
  ( (Unit!33260) )
))
(declare-fun lt!450487 () Unit!33259)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64195 (_ BitVec 32) (_ BitVec 64)) Unit!33259)

(assert (=> b!1024544 (= lt!450487 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11140 thiss!1427) (index!40748 lt!450486) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024545 () Bool)

(declare-fun e!577556 () Bool)

(declare-fun tp_is_empty!24103 () Bool)

(assert (=> b!1024545 (= e!577556 tp_is_empty!24103)))

(declare-fun b!1024546 () Bool)

(declare-fun res!685993 () Bool)

(assert (=> b!1024546 (=> res!685993 e!577560)))

(declare-fun contains!5929 (List!21769 (_ BitVec 64)) Bool)

(assert (=> b!1024546 (= res!685993 (contains!5929 Nil!21766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!577563 () Bool)

(declare-fun e!577558 () Bool)

(declare-fun array_inv!23951 (array!64195) Bool)

(declare-fun array_inv!23952 (array!64197) Bool)

(assert (=> b!1024548 (= e!577558 (and tp!72195 tp_is_empty!24103 (array_inv!23951 (_keys!11140 thiss!1427)) (array_inv!23952 (_values!6020 thiss!1427)) e!577563))))

(declare-fun b!1024549 () Bool)

(declare-fun e!577561 () Bool)

(assert (=> b!1024549 (= e!577561 tp_is_empty!24103)))

(declare-fun b!1024550 () Bool)

(assert (=> b!1024550 (= e!577560 true)))

(declare-fun lt!450485 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64195 (_ BitVec 32) List!21769) Bool)

(assert (=> b!1024550 (= lt!450485 (arrayNoDuplicates!0 (_keys!11140 thiss!1427) #b00000000000000000000000000000000 Nil!21766))))

(declare-fun mapIsEmpty!37583 () Bool)

(declare-fun mapRes!37583 () Bool)

(assert (=> mapIsEmpty!37583 mapRes!37583))

(declare-fun res!685990 () Bool)

(assert (=> start!89382 (=> (not res!685990) (not e!577559))))

(declare-fun valid!2006 (LongMapFixedSize!5290) Bool)

(assert (=> start!89382 (= res!685990 (valid!2006 thiss!1427))))

(assert (=> start!89382 e!577559))

(assert (=> start!89382 e!577558))

(assert (=> start!89382 true))

(declare-fun b!1024547 () Bool)

(declare-fun res!685995 () Bool)

(assert (=> b!1024547 (=> res!685995 e!577560)))

(assert (=> b!1024547 (= res!685995 (contains!5929 Nil!21766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37583 () Bool)

(declare-fun tp!72194 () Bool)

(assert (=> mapNonEmpty!37583 (= mapRes!37583 (and tp!72194 e!577556))))

(declare-fun mapKey!37583 () (_ BitVec 32))

(declare-fun mapRest!37583 () (Array (_ BitVec 32) ValueCell!11348))

(declare-fun mapValue!37583 () ValueCell!11348)

(assert (=> mapNonEmpty!37583 (= (arr!30907 (_values!6020 thiss!1427)) (store mapRest!37583 mapKey!37583 mapValue!37583))))

(declare-fun b!1024551 () Bool)

(declare-fun res!685992 () Bool)

(assert (=> b!1024551 (=> (not res!685992) (not e!577559))))

(assert (=> b!1024551 (= res!685992 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024552 () Bool)

(assert (=> b!1024552 (= e!577563 (and e!577561 mapRes!37583))))

(declare-fun condMapEmpty!37583 () Bool)

(declare-fun mapDefault!37583 () ValueCell!11348)

(assert (=> b!1024552 (= condMapEmpty!37583 (= (arr!30907 (_values!6020 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11348)) mapDefault!37583)))))

(assert (= (and start!89382 res!685990) b!1024551))

(assert (= (and b!1024551 res!685992) b!1024543))

(assert (= (and b!1024543 res!685996) b!1024544))

(assert (= (and b!1024544 (not res!685994)) b!1024542))

(assert (= (and b!1024542 (not res!685991)) b!1024546))

(assert (= (and b!1024546 (not res!685993)) b!1024547))

(assert (= (and b!1024547 (not res!685995)) b!1024550))

(assert (= (and b!1024552 condMapEmpty!37583) mapIsEmpty!37583))

(assert (= (and b!1024552 (not condMapEmpty!37583)) mapNonEmpty!37583))

(assert (= (and mapNonEmpty!37583 ((_ is ValueCellFull!11348) mapValue!37583)) b!1024545))

(assert (= (and b!1024552 ((_ is ValueCellFull!11348) mapDefault!37583)) b!1024549))

(assert (= b!1024548 b!1024552))

(assert (= start!89382 b!1024548))

(declare-fun m!942365 () Bool)

(assert (=> b!1024548 m!942365))

(declare-fun m!942367 () Bool)

(assert (=> b!1024548 m!942367))

(declare-fun m!942369 () Bool)

(assert (=> mapNonEmpty!37583 m!942369))

(declare-fun m!942371 () Bool)

(assert (=> start!89382 m!942371))

(declare-fun m!942373 () Bool)

(assert (=> b!1024543 m!942373))

(declare-fun m!942375 () Bool)

(assert (=> b!1024550 m!942375))

(declare-fun m!942377 () Bool)

(assert (=> b!1024546 m!942377))

(declare-fun m!942379 () Bool)

(assert (=> b!1024542 m!942379))

(declare-fun m!942381 () Bool)

(assert (=> b!1024547 m!942381))

(declare-fun m!942383 () Bool)

(assert (=> b!1024544 m!942383))

(declare-fun m!942385 () Bool)

(assert (=> b!1024544 m!942385))

(declare-fun m!942387 () Bool)

(assert (=> b!1024544 m!942387))

(declare-fun m!942389 () Bool)

(assert (=> b!1024544 m!942389))

(check-sat (not b!1024547) (not b_next!20383) (not b!1024544) (not b!1024542) (not mapNonEmpty!37583) (not b!1024548) b_and!32603 (not b!1024550) (not b!1024546) (not b!1024543) tp_is_empty!24103 (not start!89382))
(check-sat b_and!32603 (not b_next!20383))
