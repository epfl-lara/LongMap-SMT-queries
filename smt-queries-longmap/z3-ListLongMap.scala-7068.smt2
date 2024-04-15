; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89460 () Bool)

(assert start!89460)

(declare-fun b!1025801 () Bool)

(declare-fun b_free!20461 () Bool)

(declare-fun b_next!20461 () Bool)

(assert (=> b!1025801 (= b_free!20461 (not b_next!20461))))

(declare-fun tp!72429 () Bool)

(declare-fun b_and!32681 () Bool)

(assert (=> b!1025801 (= tp!72429 b_and!32681)))

(declare-fun mapNonEmpty!37700 () Bool)

(declare-fun mapRes!37700 () Bool)

(declare-fun tp!72428 () Bool)

(declare-fun e!578498 () Bool)

(assert (=> mapNonEmpty!37700 (= mapRes!37700 (and tp!72428 e!578498))))

(declare-datatypes ((V!37115 0))(
  ( (V!37116 (val!12141 Int)) )
))
(declare-datatypes ((ValueCell!11387 0))(
  ( (ValueCellFull!11387 (v!14709 V!37115)) (EmptyCell!11387) )
))
(declare-fun mapRest!37700 () (Array (_ BitVec 32) ValueCell!11387))

(declare-fun mapValue!37700 () ValueCell!11387)

(declare-datatypes ((array!64351 0))(
  ( (array!64352 (arr!30984 (Array (_ BitVec 32) (_ BitVec 64))) (size!31499 (_ BitVec 32))) )
))
(declare-datatypes ((array!64353 0))(
  ( (array!64354 (arr!30985 (Array (_ BitVec 32) ValueCell!11387)) (size!31500 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5368 0))(
  ( (LongMapFixedSize!5369 (defaultEntry!6036 Int) (mask!29713 (_ BitVec 32)) (extraKeys!5768 (_ BitVec 32)) (zeroValue!5872 V!37115) (minValue!5872 V!37115) (_size!2739 (_ BitVec 32)) (_keys!11179 array!64351) (_values!6059 array!64353) (_vacant!2739 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5368)

(declare-fun mapKey!37700 () (_ BitVec 32))

(assert (=> mapNonEmpty!37700 (= (arr!30985 (_values!6059 thiss!1427)) (store mapRest!37700 mapKey!37700 mapValue!37700))))

(declare-fun b!1025796 () Bool)

(declare-fun e!578495 () Bool)

(declare-fun e!578499 () Bool)

(assert (=> b!1025796 (= e!578495 (and e!578499 mapRes!37700))))

(declare-fun condMapEmpty!37700 () Bool)

(declare-fun mapDefault!37700 () ValueCell!11387)

(assert (=> b!1025796 (= condMapEmpty!37700 (= (arr!30985 (_values!6059 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11387)) mapDefault!37700)))))

(declare-fun res!686779 () Bool)

(declare-fun e!578496 () Bool)

(assert (=> start!89460 (=> (not res!686779) (not e!578496))))

(declare-fun valid!2035 (LongMapFixedSize!5368) Bool)

(assert (=> start!89460 (= res!686779 (valid!2035 thiss!1427))))

(assert (=> start!89460 e!578496))

(declare-fun e!578493 () Bool)

(assert (=> start!89460 e!578493))

(assert (=> start!89460 true))

(declare-fun b!1025797 () Bool)

(declare-fun e!578497 () Bool)

(assert (=> b!1025797 (= e!578497 true)))

(declare-fun lt!450998 () Bool)

(declare-datatypes ((List!21801 0))(
  ( (Nil!21798) (Cons!21797 (h!22995 (_ BitVec 64)) (t!30854 List!21801)) )
))
(declare-fun arrayNoDuplicates!0 (array!64351 (_ BitVec 32) List!21801) Bool)

(assert (=> b!1025797 (= lt!450998 (arrayNoDuplicates!0 (_keys!11179 thiss!1427) #b00000000000000000000000000000000 Nil!21798))))

(declare-fun b!1025798 () Bool)

(declare-fun e!578492 () Bool)

(assert (=> b!1025798 (= e!578496 e!578492)))

(declare-fun res!686777 () Bool)

(assert (=> b!1025798 (=> (not res!686777) (not e!578492))))

(declare-datatypes ((SeekEntryResult!9629 0))(
  ( (MissingZero!9629 (index!40887 (_ BitVec 32))) (Found!9629 (index!40888 (_ BitVec 32))) (Intermediate!9629 (undefined!10441 Bool) (index!40889 (_ BitVec 32)) (x!91240 (_ BitVec 32))) (Undefined!9629) (MissingVacant!9629 (index!40890 (_ BitVec 32))) )
))
(declare-fun lt!450995 () SeekEntryResult!9629)

(get-info :version)

(assert (=> b!1025798 (= res!686777 ((_ is Found!9629) lt!450995))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64351 (_ BitVec 32)) SeekEntryResult!9629)

(assert (=> b!1025798 (= lt!450995 (seekEntry!0 key!909 (_keys!11179 thiss!1427) (mask!29713 thiss!1427)))))

(declare-fun b!1025799 () Bool)

(declare-fun tp_is_empty!24181 () Bool)

(assert (=> b!1025799 (= e!578498 tp_is_empty!24181)))

(declare-fun b!1025800 () Bool)

(assert (=> b!1025800 (= e!578499 tp_is_empty!24181)))

(declare-fun array_inv!24009 (array!64351) Bool)

(declare-fun array_inv!24010 (array!64353) Bool)

(assert (=> b!1025801 (= e!578493 (and tp!72429 tp_is_empty!24181 (array_inv!24009 (_keys!11179 thiss!1427)) (array_inv!24010 (_values!6059 thiss!1427)) e!578495))))

(declare-fun b!1025802 () Bool)

(declare-fun res!686778 () Bool)

(assert (=> b!1025802 (=> (not res!686778) (not e!578496))))

(assert (=> b!1025802 (= res!686778 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025803 () Bool)

(assert (=> b!1025803 (= e!578492 (not e!578497))))

(declare-fun res!686776 () Bool)

(assert (=> b!1025803 (=> res!686776 e!578497)))

(assert (=> b!1025803 (= res!686776 (or (bvslt (index!40888 lt!450995) #b00000000000000000000000000000000) (bvsge (index!40888 lt!450995) (size!31499 (_keys!11179 thiss!1427))) (bvsge (size!31499 (_keys!11179 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451000 () array!64351)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64351 (_ BitVec 32)) Bool)

(assert (=> b!1025803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451000 (mask!29713 thiss!1427))))

(declare-datatypes ((Unit!33313 0))(
  ( (Unit!33314) )
))
(declare-fun lt!450999 () Unit!33313)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64351 (_ BitVec 32) (_ BitVec 32)) Unit!33313)

(assert (=> b!1025803 (= lt!450999 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11179 thiss!1427) (index!40888 lt!450995) (mask!29713 thiss!1427)))))

(assert (=> b!1025803 (arrayNoDuplicates!0 lt!451000 #b00000000000000000000000000000000 Nil!21798)))

(declare-fun lt!450997 () Unit!33313)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64351 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21801) Unit!33313)

(assert (=> b!1025803 (= lt!450997 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11179 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40888 lt!450995) #b00000000000000000000000000000000 Nil!21798))))

(declare-fun arrayCountValidKeys!0 (array!64351 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025803 (= (arrayCountValidKeys!0 lt!451000 #b00000000000000000000000000000000 (size!31499 (_keys!11179 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11179 thiss!1427) #b00000000000000000000000000000000 (size!31499 (_keys!11179 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025803 (= lt!451000 (array!64352 (store (arr!30984 (_keys!11179 thiss!1427)) (index!40888 lt!450995) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31499 (_keys!11179 thiss!1427))))))

(declare-fun lt!450996 () Unit!33313)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64351 (_ BitVec 32) (_ BitVec 64)) Unit!33313)

(assert (=> b!1025803 (= lt!450996 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11179 thiss!1427) (index!40888 lt!450995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37700 () Bool)

(assert (=> mapIsEmpty!37700 mapRes!37700))

(assert (= (and start!89460 res!686779) b!1025802))

(assert (= (and b!1025802 res!686778) b!1025798))

(assert (= (and b!1025798 res!686777) b!1025803))

(assert (= (and b!1025803 (not res!686776)) b!1025797))

(assert (= (and b!1025796 condMapEmpty!37700) mapIsEmpty!37700))

(assert (= (and b!1025796 (not condMapEmpty!37700)) mapNonEmpty!37700))

(assert (= (and mapNonEmpty!37700 ((_ is ValueCellFull!11387) mapValue!37700)) b!1025799))

(assert (= (and b!1025796 ((_ is ValueCellFull!11387) mapDefault!37700)) b!1025800))

(assert (= b!1025801 b!1025796))

(assert (= start!89460 b!1025801))

(declare-fun m!943511 () Bool)

(assert (=> start!89460 m!943511))

(declare-fun m!943513 () Bool)

(assert (=> b!1025803 m!943513))

(declare-fun m!943515 () Bool)

(assert (=> b!1025803 m!943515))

(declare-fun m!943517 () Bool)

(assert (=> b!1025803 m!943517))

(declare-fun m!943519 () Bool)

(assert (=> b!1025803 m!943519))

(declare-fun m!943521 () Bool)

(assert (=> b!1025803 m!943521))

(declare-fun m!943523 () Bool)

(assert (=> b!1025803 m!943523))

(declare-fun m!943525 () Bool)

(assert (=> b!1025803 m!943525))

(declare-fun m!943527 () Bool)

(assert (=> b!1025803 m!943527))

(declare-fun m!943529 () Bool)

(assert (=> b!1025797 m!943529))

(declare-fun m!943531 () Bool)

(assert (=> b!1025801 m!943531))

(declare-fun m!943533 () Bool)

(assert (=> b!1025801 m!943533))

(declare-fun m!943535 () Bool)

(assert (=> b!1025798 m!943535))

(declare-fun m!943537 () Bool)

(assert (=> mapNonEmpty!37700 m!943537))

(check-sat (not b!1025798) b_and!32681 (not b!1025801) (not b!1025803) (not b!1025797) (not b_next!20461) (not start!89460) tp_is_empty!24181 (not mapNonEmpty!37700))
(check-sat b_and!32681 (not b_next!20461))
