; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89442 () Bool)

(assert start!89442)

(declare-fun b!1025536 () Bool)

(declare-fun b_free!20443 () Bool)

(declare-fun b_next!20443 () Bool)

(assert (=> b!1025536 (= b_free!20443 (not b_next!20443))))

(declare-fun tp!72374 () Bool)

(declare-fun b_and!32663 () Bool)

(assert (=> b!1025536 (= tp!72374 b_and!32663)))

(declare-fun b!1025532 () Bool)

(declare-fun e!578276 () Bool)

(declare-fun e!578277 () Bool)

(declare-fun mapRes!37673 () Bool)

(assert (=> b!1025532 (= e!578276 (and e!578277 mapRes!37673))))

(declare-fun condMapEmpty!37673 () Bool)

(declare-datatypes ((V!37091 0))(
  ( (V!37092 (val!12132 Int)) )
))
(declare-datatypes ((ValueCell!11378 0))(
  ( (ValueCellFull!11378 (v!14700 V!37091)) (EmptyCell!11378) )
))
(declare-datatypes ((array!64315 0))(
  ( (array!64316 (arr!30966 (Array (_ BitVec 32) (_ BitVec 64))) (size!31481 (_ BitVec 32))) )
))
(declare-datatypes ((array!64317 0))(
  ( (array!64318 (arr!30967 (Array (_ BitVec 32) ValueCell!11378)) (size!31482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5350 0))(
  ( (LongMapFixedSize!5351 (defaultEntry!6027 Int) (mask!29698 (_ BitVec 32)) (extraKeys!5759 (_ BitVec 32)) (zeroValue!5863 V!37091) (minValue!5863 V!37091) (_size!2730 (_ BitVec 32)) (_keys!11170 array!64315) (_values!6050 array!64317) (_vacant!2730 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5350)

(declare-fun mapDefault!37673 () ValueCell!11378)

(assert (=> b!1025532 (= condMapEmpty!37673 (= (arr!30967 (_values!6050 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11378)) mapDefault!37673)))))

(declare-fun b!1025533 () Bool)

(declare-fun res!686622 () Bool)

(declare-fun e!578282 () Bool)

(assert (=> b!1025533 (=> res!686622 e!578282)))

(declare-datatypes ((SeekEntryResult!9620 0))(
  ( (MissingZero!9620 (index!40851 (_ BitVec 32))) (Found!9620 (index!40852 (_ BitVec 32))) (Intermediate!9620 (undefined!10432 Bool) (index!40853 (_ BitVec 32)) (x!91207 (_ BitVec 32))) (Undefined!9620) (MissingVacant!9620 (index!40854 (_ BitVec 32))) )
))
(declare-fun lt!450853 () SeekEntryResult!9620)

(assert (=> b!1025533 (= res!686622 (or (not (= (size!31481 (_keys!11170 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29698 thiss!1427)))) (bvslt (index!40852 lt!450853) #b00000000000000000000000000000000) (bvsge (index!40852 lt!450853) (size!31481 (_keys!11170 thiss!1427)))))))

(declare-fun b!1025534 () Bool)

(declare-fun tp_is_empty!24163 () Bool)

(assert (=> b!1025534 (= e!578277 tp_is_empty!24163)))

(declare-fun mapIsEmpty!37673 () Bool)

(assert (=> mapIsEmpty!37673 mapRes!37673))

(declare-fun b!1025535 () Bool)

(declare-fun e!578281 () Bool)

(assert (=> b!1025535 (= e!578281 (not e!578282))))

(declare-fun res!686626 () Bool)

(assert (=> b!1025535 (=> res!686626 e!578282)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025535 (= res!686626 (not (validMask!0 (mask!29698 thiss!1427))))))

(declare-fun lt!450852 () array!64315)

(declare-datatypes ((List!21793 0))(
  ( (Nil!21790) (Cons!21789 (h!22987 (_ BitVec 64)) (t!30846 List!21793)) )
))
(declare-fun arrayNoDuplicates!0 (array!64315 (_ BitVec 32) List!21793) Bool)

(assert (=> b!1025535 (arrayNoDuplicates!0 lt!450852 #b00000000000000000000000000000000 Nil!21790)))

(declare-datatypes ((Unit!33299 0))(
  ( (Unit!33300) )
))
(declare-fun lt!450849 () Unit!33299)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21793) Unit!33299)

(assert (=> b!1025535 (= lt!450849 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11170 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40852 lt!450853) #b00000000000000000000000000000000 Nil!21790))))

(declare-fun arrayCountValidKeys!0 (array!64315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025535 (= (arrayCountValidKeys!0 lt!450852 #b00000000000000000000000000000000 (size!31481 (_keys!11170 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11170 thiss!1427) #b00000000000000000000000000000000 (size!31481 (_keys!11170 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025535 (= lt!450852 (array!64316 (store (arr!30966 (_keys!11170 thiss!1427)) (index!40852 lt!450853) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31481 (_keys!11170 thiss!1427))))))

(declare-fun lt!450850 () Unit!33299)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64315 (_ BitVec 32) (_ BitVec 64)) Unit!33299)

(assert (=> b!1025535 (= lt!450850 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11170 thiss!1427) (index!40852 lt!450853) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578278 () Bool)

(declare-fun array_inv!23995 (array!64315) Bool)

(declare-fun array_inv!23996 (array!64317) Bool)

(assert (=> b!1025536 (= e!578278 (and tp!72374 tp_is_empty!24163 (array_inv!23995 (_keys!11170 thiss!1427)) (array_inv!23996 (_values!6050 thiss!1427)) e!578276))))

(declare-fun b!1025537 () Bool)

(declare-fun res!686623 () Bool)

(declare-fun e!578279 () Bool)

(assert (=> b!1025537 (=> (not res!686623) (not e!578279))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025537 (= res!686623 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025538 () Bool)

(declare-fun e!578280 () Bool)

(assert (=> b!1025538 (= e!578280 tp_is_empty!24163)))

(declare-fun b!1025539 () Bool)

(assert (=> b!1025539 (= e!578282 true)))

(declare-fun lt!450851 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64315 (_ BitVec 32)) Bool)

(assert (=> b!1025539 (= lt!450851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11170 thiss!1427) (mask!29698 thiss!1427)))))

(declare-fun b!1025540 () Bool)

(declare-fun res!686620 () Bool)

(assert (=> b!1025540 (=> res!686620 e!578282)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025540 (= res!686620 (not (validKeyInArray!0 (select (arr!30966 (_keys!11170 thiss!1427)) (index!40852 lt!450853)))))))

(declare-fun res!686625 () Bool)

(assert (=> start!89442 (=> (not res!686625) (not e!578279))))

(declare-fun valid!2028 (LongMapFixedSize!5350) Bool)

(assert (=> start!89442 (= res!686625 (valid!2028 thiss!1427))))

(assert (=> start!89442 e!578279))

(assert (=> start!89442 e!578278))

(assert (=> start!89442 true))

(declare-fun b!1025541 () Bool)

(declare-fun res!686624 () Bool)

(assert (=> b!1025541 (=> res!686624 e!578282)))

(assert (=> b!1025541 (= res!686624 (not (arrayNoDuplicates!0 (_keys!11170 thiss!1427) #b00000000000000000000000000000000 Nil!21790)))))

(declare-fun mapNonEmpty!37673 () Bool)

(declare-fun tp!72375 () Bool)

(assert (=> mapNonEmpty!37673 (= mapRes!37673 (and tp!72375 e!578280))))

(declare-fun mapKey!37673 () (_ BitVec 32))

(declare-fun mapValue!37673 () ValueCell!11378)

(declare-fun mapRest!37673 () (Array (_ BitVec 32) ValueCell!11378))

(assert (=> mapNonEmpty!37673 (= (arr!30967 (_values!6050 thiss!1427)) (store mapRest!37673 mapKey!37673 mapValue!37673))))

(declare-fun b!1025542 () Bool)

(assert (=> b!1025542 (= e!578279 e!578281)))

(declare-fun res!686621 () Bool)

(assert (=> b!1025542 (=> (not res!686621) (not e!578281))))

(get-info :version)

(assert (=> b!1025542 (= res!686621 ((_ is Found!9620) lt!450853))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64315 (_ BitVec 32)) SeekEntryResult!9620)

(assert (=> b!1025542 (= lt!450853 (seekEntry!0 key!909 (_keys!11170 thiss!1427) (mask!29698 thiss!1427)))))

(assert (= (and start!89442 res!686625) b!1025537))

(assert (= (and b!1025537 res!686623) b!1025542))

(assert (= (and b!1025542 res!686621) b!1025535))

(assert (= (and b!1025535 (not res!686626)) b!1025533))

(assert (= (and b!1025533 (not res!686622)) b!1025540))

(assert (= (and b!1025540 (not res!686620)) b!1025541))

(assert (= (and b!1025541 (not res!686624)) b!1025539))

(assert (= (and b!1025532 condMapEmpty!37673) mapIsEmpty!37673))

(assert (= (and b!1025532 (not condMapEmpty!37673)) mapNonEmpty!37673))

(assert (= (and mapNonEmpty!37673 ((_ is ValueCellFull!11378) mapValue!37673)) b!1025538))

(assert (= (and b!1025532 ((_ is ValueCellFull!11378) mapDefault!37673)) b!1025534))

(assert (= b!1025536 b!1025532))

(assert (= start!89442 b!1025536))

(declare-fun m!943235 () Bool)

(assert (=> b!1025539 m!943235))

(declare-fun m!943237 () Bool)

(assert (=> b!1025540 m!943237))

(assert (=> b!1025540 m!943237))

(declare-fun m!943239 () Bool)

(assert (=> b!1025540 m!943239))

(declare-fun m!943241 () Bool)

(assert (=> b!1025541 m!943241))

(declare-fun m!943243 () Bool)

(assert (=> b!1025536 m!943243))

(declare-fun m!943245 () Bool)

(assert (=> b!1025536 m!943245))

(declare-fun m!943247 () Bool)

(assert (=> b!1025535 m!943247))

(declare-fun m!943249 () Bool)

(assert (=> b!1025535 m!943249))

(declare-fun m!943251 () Bool)

(assert (=> b!1025535 m!943251))

(declare-fun m!943253 () Bool)

(assert (=> b!1025535 m!943253))

(declare-fun m!943255 () Bool)

(assert (=> b!1025535 m!943255))

(declare-fun m!943257 () Bool)

(assert (=> b!1025535 m!943257))

(declare-fun m!943259 () Bool)

(assert (=> b!1025535 m!943259))

(declare-fun m!943261 () Bool)

(assert (=> start!89442 m!943261))

(declare-fun m!943263 () Bool)

(assert (=> b!1025542 m!943263))

(declare-fun m!943265 () Bool)

(assert (=> mapNonEmpty!37673 m!943265))

(check-sat (not b!1025539) (not b!1025541) (not b!1025542) (not mapNonEmpty!37673) (not b!1025540) (not b!1025535) b_and!32663 (not start!89442) (not b_next!20443) (not b!1025536) tp_is_empty!24163)
(check-sat b_and!32663 (not b_next!20443))
