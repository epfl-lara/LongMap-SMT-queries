; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90206 () Bool)

(assert start!90206)

(declare-fun b!1031661 () Bool)

(declare-fun b_free!20611 () Bool)

(declare-fun b_next!20611 () Bool)

(assert (=> b!1031661 (= b_free!20611 (not b_next!20611))))

(declare-fun tp!72901 () Bool)

(declare-fun b_and!32993 () Bool)

(assert (=> b!1031661 (= tp!72901 b_and!32993)))

(declare-fun res!689527 () Bool)

(declare-fun e!582656 () Bool)

(assert (=> start!90206 (=> (not res!689527) (not e!582656))))

(declare-datatypes ((V!37315 0))(
  ( (V!37316 (val!12216 Int)) )
))
(declare-datatypes ((ValueCell!11462 0))(
  ( (ValueCellFull!11462 (v!14789 V!37315)) (EmptyCell!11462) )
))
(declare-datatypes ((array!64773 0))(
  ( (array!64774 (arr!31183 (Array (_ BitVec 32) (_ BitVec 64))) (size!31701 (_ BitVec 32))) )
))
(declare-datatypes ((array!64775 0))(
  ( (array!64776 (arr!31184 (Array (_ BitVec 32) ValueCell!11462)) (size!31702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5518 0))(
  ( (LongMapFixedSize!5519 (defaultEntry!6131 Int) (mask!29967 (_ BitVec 32)) (extraKeys!5863 (_ BitVec 32)) (zeroValue!5967 V!37315) (minValue!5967 V!37315) (_size!2814 (_ BitVec 32)) (_keys!11340 array!64773) (_values!6154 array!64775) (_vacant!2814 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5518)

(declare-fun valid!2097 (LongMapFixedSize!5518) Bool)

(assert (=> start!90206 (= res!689527 (valid!2097 thiss!1427))))

(assert (=> start!90206 e!582656))

(declare-fun e!582660 () Bool)

(assert (=> start!90206 e!582660))

(assert (=> start!90206 true))

(declare-fun b!1031658 () Bool)

(declare-fun res!689529 () Bool)

(declare-fun e!582662 () Bool)

(assert (=> b!1031658 (=> res!689529 e!582662)))

(declare-datatypes ((Unit!33664 0))(
  ( (Unit!33665) )
))
(declare-datatypes ((tuple2!15590 0))(
  ( (tuple2!15591 (_1!7806 Unit!33664) (_2!7806 LongMapFixedSize!5518)) )
))
(declare-fun lt!454992 () tuple2!15590)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64773 (_ BitVec 32)) Bool)

(assert (=> b!1031658 (= res!689529 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11340 (_2!7806 lt!454992)) (mask!29967 (_2!7806 lt!454992)))))))

(declare-fun mapNonEmpty!37947 () Bool)

(declare-fun mapRes!37947 () Bool)

(declare-fun tp!72900 () Bool)

(declare-fun e!582657 () Bool)

(assert (=> mapNonEmpty!37947 (= mapRes!37947 (and tp!72900 e!582657))))

(declare-fun mapRest!37947 () (Array (_ BitVec 32) ValueCell!11462))

(declare-fun mapValue!37947 () ValueCell!11462)

(declare-fun mapKey!37947 () (_ BitVec 32))

(assert (=> mapNonEmpty!37947 (= (arr!31184 (_values!6154 thiss!1427)) (store mapRest!37947 mapKey!37947 mapValue!37947))))

(declare-fun b!1031659 () Bool)

(declare-fun e!582659 () Bool)

(declare-fun tp_is_empty!24331 () Bool)

(assert (=> b!1031659 (= e!582659 tp_is_empty!24331)))

(declare-fun b!1031660 () Bool)

(declare-fun e!582661 () Bool)

(assert (=> b!1031660 (= e!582656 e!582661)))

(declare-fun res!689531 () Bool)

(assert (=> b!1031660 (=> (not res!689531) (not e!582661))))

(declare-datatypes ((SeekEntryResult!9643 0))(
  ( (MissingZero!9643 (index!40943 (_ BitVec 32))) (Found!9643 (index!40944 (_ BitVec 32))) (Intermediate!9643 (undefined!10455 Bool) (index!40945 (_ BitVec 32)) (x!91671 (_ BitVec 32))) (Undefined!9643) (MissingVacant!9643 (index!40946 (_ BitVec 32))) )
))
(declare-fun lt!454996 () SeekEntryResult!9643)

(get-info :version)

(assert (=> b!1031660 (= res!689531 ((_ is Found!9643) lt!454996))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64773 (_ BitVec 32)) SeekEntryResult!9643)

(assert (=> b!1031660 (= lt!454996 (seekEntry!0 key!909 (_keys!11340 thiss!1427) (mask!29967 thiss!1427)))))

(declare-fun e!582655 () Bool)

(declare-fun array_inv!24151 (array!64773) Bool)

(declare-fun array_inv!24152 (array!64775) Bool)

(assert (=> b!1031661 (= e!582660 (and tp!72901 tp_is_empty!24331 (array_inv!24151 (_keys!11340 thiss!1427)) (array_inv!24152 (_values!6154 thiss!1427)) e!582655))))

(declare-fun b!1031662 () Bool)

(declare-datatypes ((List!21820 0))(
  ( (Nil!21817) (Cons!21816 (h!23027 (_ BitVec 64)) (t!30918 List!21820)) )
))
(declare-fun arrayNoDuplicates!0 (array!64773 (_ BitVec 32) List!21820) Bool)

(assert (=> b!1031662 (= e!582662 (arrayNoDuplicates!0 (_keys!11340 (_2!7806 lt!454992)) #b00000000000000000000000000000000 Nil!21817))))

(declare-fun b!1031663 () Bool)

(assert (=> b!1031663 (= e!582657 tp_is_empty!24331)))

(declare-fun b!1031664 () Bool)

(assert (=> b!1031664 (= e!582655 (and e!582659 mapRes!37947))))

(declare-fun condMapEmpty!37947 () Bool)

(declare-fun mapDefault!37947 () ValueCell!11462)

(assert (=> b!1031664 (= condMapEmpty!37947 (= (arr!31184 (_values!6154 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11462)) mapDefault!37947)))))

(declare-fun mapIsEmpty!37947 () Bool)

(assert (=> mapIsEmpty!37947 mapRes!37947))

(declare-fun b!1031665 () Bool)

(assert (=> b!1031665 (= e!582661 (not e!582662))))

(declare-fun res!689532 () Bool)

(assert (=> b!1031665 (=> res!689532 e!582662)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031665 (= res!689532 (not (validMask!0 (mask!29967 (_2!7806 lt!454992)))))))

(declare-fun lt!454991 () array!64775)

(declare-fun lt!454990 () array!64773)

(declare-fun Unit!33666 () Unit!33664)

(declare-fun Unit!33667 () Unit!33664)

(assert (=> b!1031665 (= lt!454992 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2814 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15591 Unit!33666 (LongMapFixedSize!5519 (defaultEntry!6131 thiss!1427) (mask!29967 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) (bvsub (_size!2814 thiss!1427) #b00000000000000000000000000000001) lt!454990 lt!454991 (bvadd #b00000000000000000000000000000001 (_vacant!2814 thiss!1427)))) (tuple2!15591 Unit!33667 (LongMapFixedSize!5519 (defaultEntry!6131 thiss!1427) (mask!29967 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) (bvsub (_size!2814 thiss!1427) #b00000000000000000000000000000001) lt!454990 lt!454991 (_vacant!2814 thiss!1427)))))))

(declare-datatypes ((tuple2!15592 0))(
  ( (tuple2!15593 (_1!7807 (_ BitVec 64)) (_2!7807 V!37315)) )
))
(declare-datatypes ((List!21821 0))(
  ( (Nil!21818) (Cons!21817 (h!23028 tuple2!15592) (t!30919 List!21821)) )
))
(declare-datatypes ((ListLongMap!13703 0))(
  ( (ListLongMap!13704 (toList!6867 List!21821)) )
))
(declare-fun -!490 (ListLongMap!13703 (_ BitVec 64)) ListLongMap!13703)

(declare-fun getCurrentListMap!3913 (array!64773 array!64775 (_ BitVec 32) (_ BitVec 32) V!37315 V!37315 (_ BitVec 32) Int) ListLongMap!13703)

(assert (=> b!1031665 (= (-!490 (getCurrentListMap!3913 (_keys!11340 thiss!1427) (_values!6154 thiss!1427) (mask!29967 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6131 thiss!1427)) key!909) (getCurrentListMap!3913 lt!454990 lt!454991 (mask!29967 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6131 thiss!1427)))))

(declare-fun dynLambda!1984 (Int (_ BitVec 64)) V!37315)

(assert (=> b!1031665 (= lt!454991 (array!64776 (store (arr!31184 (_values!6154 thiss!1427)) (index!40944 lt!454996) (ValueCellFull!11462 (dynLambda!1984 (defaultEntry!6131 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31702 (_values!6154 thiss!1427))))))

(declare-fun lt!454997 () Unit!33664)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!16 (array!64773 array!64775 (_ BitVec 32) (_ BitVec 32) V!37315 V!37315 (_ BitVec 32) (_ BitVec 64) Int) Unit!33664)

(assert (=> b!1031665 (= lt!454997 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!16 (_keys!11340 thiss!1427) (_values!6154 thiss!1427) (mask!29967 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) (index!40944 lt!454996) key!909 (defaultEntry!6131 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031665 (not (arrayContainsKey!0 lt!454990 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454989 () Unit!33664)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64773 (_ BitVec 32) (_ BitVec 64)) Unit!33664)

(assert (=> b!1031665 (= lt!454989 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11340 thiss!1427) (index!40944 lt!454996) key!909))))

(assert (=> b!1031665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454990 (mask!29967 thiss!1427))))

(declare-fun lt!454993 () Unit!33664)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64773 (_ BitVec 32) (_ BitVec 32)) Unit!33664)

(assert (=> b!1031665 (= lt!454993 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11340 thiss!1427) (index!40944 lt!454996) (mask!29967 thiss!1427)))))

(assert (=> b!1031665 (arrayNoDuplicates!0 lt!454990 #b00000000000000000000000000000000 Nil!21817)))

(declare-fun lt!454995 () Unit!33664)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64773 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21820) Unit!33664)

(assert (=> b!1031665 (= lt!454995 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11340 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40944 lt!454996) #b00000000000000000000000000000000 Nil!21817))))

(declare-fun arrayCountValidKeys!0 (array!64773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031665 (= (arrayCountValidKeys!0 lt!454990 #b00000000000000000000000000000000 (size!31701 (_keys!11340 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11340 thiss!1427) #b00000000000000000000000000000000 (size!31701 (_keys!11340 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031665 (= lt!454990 (array!64774 (store (arr!31183 (_keys!11340 thiss!1427)) (index!40944 lt!454996) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31701 (_keys!11340 thiss!1427))))))

(declare-fun lt!454994 () Unit!33664)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64773 (_ BitVec 32) (_ BitVec 64)) Unit!33664)

(assert (=> b!1031665 (= lt!454994 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11340 thiss!1427) (index!40944 lt!454996) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031666 () Bool)

(declare-fun res!689528 () Bool)

(assert (=> b!1031666 (=> res!689528 e!582662)))

(assert (=> b!1031666 (= res!689528 (or (not (= (size!31702 (_values!6154 (_2!7806 lt!454992))) (bvadd #b00000000000000000000000000000001 (mask!29967 (_2!7806 lt!454992))))) (not (= (size!31701 (_keys!11340 (_2!7806 lt!454992))) (size!31702 (_values!6154 (_2!7806 lt!454992))))) (bvslt (mask!29967 (_2!7806 lt!454992)) #b00000000000000000000000000000000) (bvslt (extraKeys!5863 (_2!7806 lt!454992)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5863 (_2!7806 lt!454992)) #b00000000000000000000000000000011)))))

(declare-fun b!1031667 () Bool)

(declare-fun res!689530 () Bool)

(assert (=> b!1031667 (=> (not res!689530) (not e!582656))))

(assert (=> b!1031667 (= res!689530 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90206 res!689527) b!1031667))

(assert (= (and b!1031667 res!689530) b!1031660))

(assert (= (and b!1031660 res!689531) b!1031665))

(assert (= (and b!1031665 (not res!689532)) b!1031666))

(assert (= (and b!1031666 (not res!689528)) b!1031658))

(assert (= (and b!1031658 (not res!689529)) b!1031662))

(assert (= (and b!1031664 condMapEmpty!37947) mapIsEmpty!37947))

(assert (= (and b!1031664 (not condMapEmpty!37947)) mapNonEmpty!37947))

(assert (= (and mapNonEmpty!37947 ((_ is ValueCellFull!11462) mapValue!37947)) b!1031663))

(assert (= (and b!1031664 ((_ is ValueCellFull!11462) mapDefault!37947)) b!1031659))

(assert (= b!1031661 b!1031664))

(assert (= start!90206 b!1031661))

(declare-fun b_lambda!15951 () Bool)

(assert (=> (not b_lambda!15951) (not b!1031665)))

(declare-fun t!30917 () Bool)

(declare-fun tb!6921 () Bool)

(assert (=> (and b!1031661 (= (defaultEntry!6131 thiss!1427) (defaultEntry!6131 thiss!1427)) t!30917) tb!6921))

(declare-fun result!14177 () Bool)

(assert (=> tb!6921 (= result!14177 tp_is_empty!24331)))

(assert (=> b!1031665 t!30917))

(declare-fun b_and!32995 () Bool)

(assert (= b_and!32993 (and (=> t!30917 result!14177) b_and!32995)))

(declare-fun m!951709 () Bool)

(assert (=> b!1031658 m!951709))

(declare-fun m!951711 () Bool)

(assert (=> start!90206 m!951711))

(declare-fun m!951713 () Bool)

(assert (=> b!1031665 m!951713))

(declare-fun m!951715 () Bool)

(assert (=> b!1031665 m!951715))

(declare-fun m!951717 () Bool)

(assert (=> b!1031665 m!951717))

(declare-fun m!951719 () Bool)

(assert (=> b!1031665 m!951719))

(declare-fun m!951721 () Bool)

(assert (=> b!1031665 m!951721))

(declare-fun m!951723 () Bool)

(assert (=> b!1031665 m!951723))

(declare-fun m!951725 () Bool)

(assert (=> b!1031665 m!951725))

(assert (=> b!1031665 m!951723))

(declare-fun m!951727 () Bool)

(assert (=> b!1031665 m!951727))

(declare-fun m!951729 () Bool)

(assert (=> b!1031665 m!951729))

(declare-fun m!951731 () Bool)

(assert (=> b!1031665 m!951731))

(declare-fun m!951733 () Bool)

(assert (=> b!1031665 m!951733))

(declare-fun m!951735 () Bool)

(assert (=> b!1031665 m!951735))

(declare-fun m!951737 () Bool)

(assert (=> b!1031665 m!951737))

(declare-fun m!951739 () Bool)

(assert (=> b!1031665 m!951739))

(declare-fun m!951741 () Bool)

(assert (=> b!1031665 m!951741))

(declare-fun m!951743 () Bool)

(assert (=> b!1031665 m!951743))

(declare-fun m!951745 () Bool)

(assert (=> b!1031665 m!951745))

(declare-fun m!951747 () Bool)

(assert (=> b!1031660 m!951747))

(declare-fun m!951749 () Bool)

(assert (=> mapNonEmpty!37947 m!951749))

(declare-fun m!951751 () Bool)

(assert (=> b!1031662 m!951751))

(declare-fun m!951753 () Bool)

(assert (=> b!1031661 m!951753))

(declare-fun m!951755 () Bool)

(assert (=> b!1031661 m!951755))

(check-sat (not b!1031658) (not b!1031661) (not b_lambda!15951) (not b!1031662) tp_is_empty!24331 (not b!1031660) (not b!1031665) b_and!32995 (not mapNonEmpty!37947) (not b_next!20611) (not start!90206))
(check-sat b_and!32995 (not b_next!20611))
