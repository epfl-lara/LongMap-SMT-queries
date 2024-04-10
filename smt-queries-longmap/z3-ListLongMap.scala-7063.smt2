; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89434 () Bool)

(assert start!89434)

(declare-fun b!1025523 () Bool)

(declare-fun b_free!20433 () Bool)

(declare-fun b_next!20433 () Bool)

(assert (=> b!1025523 (= b_free!20433 (not b_next!20433))))

(declare-fun tp!72345 () Bool)

(declare-fun b_and!32679 () Bool)

(assert (=> b!1025523 (= tp!72345 b_and!32679)))

(declare-fun res!686587 () Bool)

(declare-fun e!578248 () Bool)

(assert (=> start!89434 (=> (not res!686587) (not e!578248))))

(declare-datatypes ((V!37077 0))(
  ( (V!37078 (val!12127 Int)) )
))
(declare-datatypes ((ValueCell!11373 0))(
  ( (ValueCellFull!11373 (v!14696 V!37077)) (EmptyCell!11373) )
))
(declare-datatypes ((array!64356 0))(
  ( (array!64357 (arr!30987 (Array (_ BitVec 32) (_ BitVec 64))) (size!31500 (_ BitVec 32))) )
))
(declare-datatypes ((array!64358 0))(
  ( (array!64359 (arr!30988 (Array (_ BitVec 32) ValueCell!11373)) (size!31501 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5340 0))(
  ( (LongMapFixedSize!5341 (defaultEntry!6022 Int) (mask!29694 (_ BitVec 32)) (extraKeys!5754 (_ BitVec 32)) (zeroValue!5858 V!37077) (minValue!5858 V!37077) (_size!2725 (_ BitVec 32)) (_keys!11169 array!64356) (_values!6045 array!64358) (_vacant!2725 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5340)

(declare-fun valid!2029 (LongMapFixedSize!5340) Bool)

(assert (=> start!89434 (= res!686587 (valid!2029 thiss!1427))))

(assert (=> start!89434 e!578248))

(declare-fun e!578252 () Bool)

(assert (=> start!89434 e!578252))

(assert (=> start!89434 true))

(declare-fun b!1025518 () Bool)

(declare-fun e!578254 () Bool)

(declare-fun tp_is_empty!24153 () Bool)

(assert (=> b!1025518 (= e!578254 tp_is_empty!24153)))

(declare-fun b!1025519 () Bool)

(declare-fun e!578250 () Bool)

(assert (=> b!1025519 (= e!578248 e!578250)))

(declare-fun res!686588 () Bool)

(assert (=> b!1025519 (=> (not res!686588) (not e!578250))))

(declare-datatypes ((SeekEntryResult!9621 0))(
  ( (MissingZero!9621 (index!40855 (_ BitVec 32))) (Found!9621 (index!40856 (_ BitVec 32))) (Intermediate!9621 (undefined!10433 Bool) (index!40857 (_ BitVec 32)) (x!91195 (_ BitVec 32))) (Undefined!9621) (MissingVacant!9621 (index!40858 (_ BitVec 32))) )
))
(declare-fun lt!450977 () SeekEntryResult!9621)

(get-info :version)

(assert (=> b!1025519 (= res!686588 ((_ is Found!9621) lt!450977))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64356 (_ BitVec 32)) SeekEntryResult!9621)

(assert (=> b!1025519 (= lt!450977 (seekEntry!0 key!909 (_keys!11169 thiss!1427) (mask!29694 thiss!1427)))))

(declare-fun b!1025520 () Bool)

(declare-fun e!578247 () Bool)

(assert (=> b!1025520 (= e!578250 (not e!578247))))

(declare-fun res!686582 () Bool)

(assert (=> b!1025520 (=> res!686582 e!578247)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025520 (= res!686582 (not (validMask!0 (mask!29694 thiss!1427))))))

(declare-fun lt!450975 () array!64356)

(declare-datatypes ((List!21754 0))(
  ( (Nil!21751) (Cons!21750 (h!22948 (_ BitVec 64)) (t!30816 List!21754)) )
))
(declare-fun arrayNoDuplicates!0 (array!64356 (_ BitVec 32) List!21754) Bool)

(assert (=> b!1025520 (arrayNoDuplicates!0 lt!450975 #b00000000000000000000000000000000 Nil!21751)))

(declare-datatypes ((Unit!33393 0))(
  ( (Unit!33394) )
))
(declare-fun lt!450978 () Unit!33393)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21754) Unit!33393)

(assert (=> b!1025520 (= lt!450978 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11169 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40856 lt!450977) #b00000000000000000000000000000000 Nil!21751))))

(declare-fun arrayCountValidKeys!0 (array!64356 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025520 (= (arrayCountValidKeys!0 lt!450975 #b00000000000000000000000000000000 (size!31500 (_keys!11169 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11169 thiss!1427) #b00000000000000000000000000000000 (size!31500 (_keys!11169 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025520 (= lt!450975 (array!64357 (store (arr!30987 (_keys!11169 thiss!1427)) (index!40856 lt!450977) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31500 (_keys!11169 thiss!1427))))))

(declare-fun lt!450974 () Unit!33393)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64356 (_ BitVec 32) (_ BitVec 64)) Unit!33393)

(assert (=> b!1025520 (= lt!450974 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11169 thiss!1427) (index!40856 lt!450977) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37658 () Bool)

(declare-fun mapRes!37658 () Bool)

(assert (=> mapIsEmpty!37658 mapRes!37658))

(declare-fun b!1025521 () Bool)

(declare-fun e!578249 () Bool)

(assert (=> b!1025521 (= e!578249 tp_is_empty!24153)))

(declare-fun b!1025522 () Bool)

(declare-fun e!578251 () Bool)

(assert (=> b!1025522 (= e!578251 (and e!578249 mapRes!37658))))

(declare-fun condMapEmpty!37658 () Bool)

(declare-fun mapDefault!37658 () ValueCell!11373)

(assert (=> b!1025522 (= condMapEmpty!37658 (= (arr!30988 (_values!6045 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11373)) mapDefault!37658)))))

(declare-fun array_inv!23999 (array!64356) Bool)

(declare-fun array_inv!24000 (array!64358) Bool)

(assert (=> b!1025523 (= e!578252 (and tp!72345 tp_is_empty!24153 (array_inv!23999 (_keys!11169 thiss!1427)) (array_inv!24000 (_values!6045 thiss!1427)) e!578251))))

(declare-fun mapNonEmpty!37658 () Bool)

(declare-fun tp!72344 () Bool)

(assert (=> mapNonEmpty!37658 (= mapRes!37658 (and tp!72344 e!578254))))

(declare-fun mapValue!37658 () ValueCell!11373)

(declare-fun mapKey!37658 () (_ BitVec 32))

(declare-fun mapRest!37658 () (Array (_ BitVec 32) ValueCell!11373))

(assert (=> mapNonEmpty!37658 (= (arr!30988 (_values!6045 thiss!1427)) (store mapRest!37658 mapKey!37658 mapValue!37658))))

(declare-fun b!1025524 () Bool)

(declare-fun res!686583 () Bool)

(assert (=> b!1025524 (=> res!686583 e!578247)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025524 (= res!686583 (not (validKeyInArray!0 (select (arr!30987 (_keys!11169 thiss!1427)) (index!40856 lt!450977)))))))

(declare-fun b!1025525 () Bool)

(assert (=> b!1025525 (= e!578247 true)))

(declare-fun lt!450976 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64356 (_ BitVec 32)) Bool)

(assert (=> b!1025525 (= lt!450976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11169 thiss!1427) (mask!29694 thiss!1427)))))

(declare-fun b!1025526 () Bool)

(declare-fun res!686586 () Bool)

(assert (=> b!1025526 (=> res!686586 e!578247)))

(assert (=> b!1025526 (= res!686586 (or (not (= (size!31500 (_keys!11169 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29694 thiss!1427)))) (bvslt (index!40856 lt!450977) #b00000000000000000000000000000000) (bvsge (index!40856 lt!450977) (size!31500 (_keys!11169 thiss!1427)))))))

(declare-fun b!1025527 () Bool)

(declare-fun res!686585 () Bool)

(assert (=> b!1025527 (=> res!686585 e!578247)))

(assert (=> b!1025527 (= res!686585 (not (arrayNoDuplicates!0 (_keys!11169 thiss!1427) #b00000000000000000000000000000000 Nil!21751)))))

(declare-fun b!1025528 () Bool)

(declare-fun res!686584 () Bool)

(assert (=> b!1025528 (=> (not res!686584) (not e!578248))))

(assert (=> b!1025528 (= res!686584 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89434 res!686587) b!1025528))

(assert (= (and b!1025528 res!686584) b!1025519))

(assert (= (and b!1025519 res!686588) b!1025520))

(assert (= (and b!1025520 (not res!686582)) b!1025526))

(assert (= (and b!1025526 (not res!686586)) b!1025524))

(assert (= (and b!1025524 (not res!686583)) b!1025527))

(assert (= (and b!1025527 (not res!686585)) b!1025525))

(assert (= (and b!1025522 condMapEmpty!37658) mapIsEmpty!37658))

(assert (= (and b!1025522 (not condMapEmpty!37658)) mapNonEmpty!37658))

(assert (= (and mapNonEmpty!37658 ((_ is ValueCellFull!11373) mapValue!37658)) b!1025518))

(assert (= (and b!1025522 ((_ is ValueCellFull!11373) mapDefault!37658)) b!1025521))

(assert (= b!1025523 b!1025522))

(assert (= start!89434 b!1025523))

(declare-fun m!943695 () Bool)

(assert (=> b!1025525 m!943695))

(declare-fun m!943697 () Bool)

(assert (=> b!1025523 m!943697))

(declare-fun m!943699 () Bool)

(assert (=> b!1025523 m!943699))

(declare-fun m!943701 () Bool)

(assert (=> b!1025520 m!943701))

(declare-fun m!943703 () Bool)

(assert (=> b!1025520 m!943703))

(declare-fun m!943705 () Bool)

(assert (=> b!1025520 m!943705))

(declare-fun m!943707 () Bool)

(assert (=> b!1025520 m!943707))

(declare-fun m!943709 () Bool)

(assert (=> b!1025520 m!943709))

(declare-fun m!943711 () Bool)

(assert (=> b!1025520 m!943711))

(declare-fun m!943713 () Bool)

(assert (=> b!1025520 m!943713))

(declare-fun m!943715 () Bool)

(assert (=> b!1025527 m!943715))

(declare-fun m!943717 () Bool)

(assert (=> start!89434 m!943717))

(declare-fun m!943719 () Bool)

(assert (=> b!1025519 m!943719))

(declare-fun m!943721 () Bool)

(assert (=> b!1025524 m!943721))

(assert (=> b!1025524 m!943721))

(declare-fun m!943723 () Bool)

(assert (=> b!1025524 m!943723))

(declare-fun m!943725 () Bool)

(assert (=> mapNonEmpty!37658 m!943725))

(check-sat (not b!1025520) (not b!1025525) (not b_next!20433) b_and!32679 (not b!1025523) (not start!89434) tp_is_empty!24153 (not b!1025524) (not mapNonEmpty!37658) (not b!1025527) (not b!1025519))
(check-sat b_and!32679 (not b_next!20433))
