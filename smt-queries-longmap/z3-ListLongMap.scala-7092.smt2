; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90200 () Bool)

(assert start!90200)

(declare-fun b!1031573 () Bool)

(declare-fun b_free!20605 () Bool)

(declare-fun b_next!20605 () Bool)

(assert (=> b!1031573 (= b_free!20605 (not b_next!20605))))

(declare-fun tp!72882 () Bool)

(declare-fun b_and!32981 () Bool)

(assert (=> b!1031573 (= tp!72882 b_and!32981)))

(declare-fun b!1031569 () Bool)

(declare-fun e!582586 () Bool)

(declare-fun tp_is_empty!24325 () Bool)

(assert (=> b!1031569 (= e!582586 tp_is_empty!24325)))

(declare-fun res!689481 () Bool)

(declare-fun e!582585 () Bool)

(assert (=> start!90200 (=> (not res!689481) (not e!582585))))

(declare-datatypes ((V!37307 0))(
  ( (V!37308 (val!12213 Int)) )
))
(declare-datatypes ((ValueCell!11459 0))(
  ( (ValueCellFull!11459 (v!14786 V!37307)) (EmptyCell!11459) )
))
(declare-datatypes ((array!64761 0))(
  ( (array!64762 (arr!31177 (Array (_ BitVec 32) (_ BitVec 64))) (size!31695 (_ BitVec 32))) )
))
(declare-datatypes ((array!64763 0))(
  ( (array!64764 (arr!31178 (Array (_ BitVec 32) ValueCell!11459)) (size!31696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5512 0))(
  ( (LongMapFixedSize!5513 (defaultEntry!6128 Int) (mask!29962 (_ BitVec 32)) (extraKeys!5860 (_ BitVec 32)) (zeroValue!5964 V!37307) (minValue!5964 V!37307) (_size!2811 (_ BitVec 32)) (_keys!11337 array!64761) (_values!6151 array!64763) (_vacant!2811 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5512)

(declare-fun valid!2096 (LongMapFixedSize!5512) Bool)

(assert (=> start!90200 (= res!689481 (valid!2096 thiss!1427))))

(assert (=> start!90200 e!582585))

(declare-fun e!582584 () Bool)

(assert (=> start!90200 e!582584))

(assert (=> start!90200 true))

(declare-fun b!1031570 () Bool)

(declare-fun e!582583 () Bool)

(assert (=> b!1031570 (= e!582585 e!582583)))

(declare-fun res!689482 () Bool)

(assert (=> b!1031570 (=> (not res!689482) (not e!582583))))

(declare-datatypes ((SeekEntryResult!9642 0))(
  ( (MissingZero!9642 (index!40939 (_ BitVec 32))) (Found!9642 (index!40940 (_ BitVec 32))) (Intermediate!9642 (undefined!10454 Bool) (index!40941 (_ BitVec 32)) (x!91656 (_ BitVec 32))) (Undefined!9642) (MissingVacant!9642 (index!40942 (_ BitVec 32))) )
))
(declare-fun lt!454913 () SeekEntryResult!9642)

(get-info :version)

(assert (=> b!1031570 (= res!689482 ((_ is Found!9642) lt!454913))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64761 (_ BitVec 32)) SeekEntryResult!9642)

(assert (=> b!1031570 (= lt!454913 (seekEntry!0 key!909 (_keys!11337 thiss!1427) (mask!29962 thiss!1427)))))

(declare-fun b!1031571 () Bool)

(declare-fun e!582587 () Bool)

(declare-fun e!582588 () Bool)

(declare-fun mapRes!37938 () Bool)

(assert (=> b!1031571 (= e!582587 (and e!582588 mapRes!37938))))

(declare-fun condMapEmpty!37938 () Bool)

(declare-fun mapDefault!37938 () ValueCell!11459)

(assert (=> b!1031571 (= condMapEmpty!37938 (= (arr!31178 (_values!6151 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11459)) mapDefault!37938)))))

(declare-fun mapNonEmpty!37938 () Bool)

(declare-fun tp!72883 () Bool)

(assert (=> mapNonEmpty!37938 (= mapRes!37938 (and tp!72883 e!582586))))

(declare-fun mapKey!37938 () (_ BitVec 32))

(declare-fun mapValue!37938 () ValueCell!11459)

(declare-fun mapRest!37938 () (Array (_ BitVec 32) ValueCell!11459))

(assert (=> mapNonEmpty!37938 (= (arr!31178 (_values!6151 thiss!1427)) (store mapRest!37938 mapKey!37938 mapValue!37938))))

(declare-fun b!1031572 () Bool)

(declare-fun res!689484 () Bool)

(assert (=> b!1031572 (=> (not res!689484) (not e!582585))))

(assert (=> b!1031572 (= res!689484 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37938 () Bool)

(assert (=> mapIsEmpty!37938 mapRes!37938))

(declare-fun array_inv!24149 (array!64761) Bool)

(declare-fun array_inv!24150 (array!64763) Bool)

(assert (=> b!1031573 (= e!582584 (and tp!72882 tp_is_empty!24325 (array_inv!24149 (_keys!11337 thiss!1427)) (array_inv!24150 (_values!6151 thiss!1427)) e!582587))))

(declare-fun b!1031574 () Bool)

(declare-fun res!689483 () Bool)

(declare-fun e!582590 () Bool)

(assert (=> b!1031574 (=> res!689483 e!582590)))

(declare-datatypes ((Unit!33658 0))(
  ( (Unit!33659) )
))
(declare-datatypes ((tuple2!15584 0))(
  ( (tuple2!15585 (_1!7803 Unit!33658) (_2!7803 LongMapFixedSize!5512)) )
))
(declare-fun lt!454916 () tuple2!15584)

(assert (=> b!1031574 (= res!689483 (or (not (= (size!31696 (_values!6151 (_2!7803 lt!454916))) (bvadd #b00000000000000000000000000000001 (mask!29962 (_2!7803 lt!454916))))) (not (= (size!31695 (_keys!11337 (_2!7803 lt!454916))) (size!31696 (_values!6151 (_2!7803 lt!454916))))) (bvslt (mask!29962 (_2!7803 lt!454916)) #b00000000000000000000000000000000) (bvslt (extraKeys!5860 (_2!7803 lt!454916)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5860 (_2!7803 lt!454916)) #b00000000000000000000000000000011)))))

(declare-fun b!1031575 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64761 (_ BitVec 32)) Bool)

(assert (=> b!1031575 (= e!582590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11337 (_2!7803 lt!454916)) (mask!29962 (_2!7803 lt!454916))))))

(declare-fun b!1031576 () Bool)

(assert (=> b!1031576 (= e!582588 tp_is_empty!24325)))

(declare-fun b!1031577 () Bool)

(assert (=> b!1031577 (= e!582583 (not e!582590))))

(declare-fun res!689480 () Bool)

(assert (=> b!1031577 (=> res!689480 e!582590)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031577 (= res!689480 (not (validMask!0 (mask!29962 (_2!7803 lt!454916)))))))

(declare-fun lt!454911 () array!64763)

(declare-fun lt!454910 () array!64761)

(declare-fun Unit!33660 () Unit!33658)

(declare-fun Unit!33661 () Unit!33658)

(assert (=> b!1031577 (= lt!454916 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2811 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15585 Unit!33660 (LongMapFixedSize!5513 (defaultEntry!6128 thiss!1427) (mask!29962 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) (bvsub (_size!2811 thiss!1427) #b00000000000000000000000000000001) lt!454910 lt!454911 (bvadd #b00000000000000000000000000000001 (_vacant!2811 thiss!1427)))) (tuple2!15585 Unit!33661 (LongMapFixedSize!5513 (defaultEntry!6128 thiss!1427) (mask!29962 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) (bvsub (_size!2811 thiss!1427) #b00000000000000000000000000000001) lt!454910 lt!454911 (_vacant!2811 thiss!1427)))))))

(declare-datatypes ((tuple2!15586 0))(
  ( (tuple2!15587 (_1!7804 (_ BitVec 64)) (_2!7804 V!37307)) )
))
(declare-datatypes ((List!21818 0))(
  ( (Nil!21815) (Cons!21814 (h!23025 tuple2!15586) (t!30910 List!21818)) )
))
(declare-datatypes ((ListLongMap!13701 0))(
  ( (ListLongMap!13702 (toList!6866 List!21818)) )
))
(declare-fun -!489 (ListLongMap!13701 (_ BitVec 64)) ListLongMap!13701)

(declare-fun getCurrentListMap!3912 (array!64761 array!64763 (_ BitVec 32) (_ BitVec 32) V!37307 V!37307 (_ BitVec 32) Int) ListLongMap!13701)

(assert (=> b!1031577 (= (-!489 (getCurrentListMap!3912 (_keys!11337 thiss!1427) (_values!6151 thiss!1427) (mask!29962 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6128 thiss!1427)) key!909) (getCurrentListMap!3912 lt!454910 lt!454911 (mask!29962 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6128 thiss!1427)))))

(declare-fun dynLambda!1983 (Int (_ BitVec 64)) V!37307)

(assert (=> b!1031577 (= lt!454911 (array!64764 (store (arr!31178 (_values!6151 thiss!1427)) (index!40940 lt!454913) (ValueCellFull!11459 (dynLambda!1983 (defaultEntry!6128 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31696 (_values!6151 thiss!1427))))))

(declare-fun lt!454908 () Unit!33658)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!15 (array!64761 array!64763 (_ BitVec 32) (_ BitVec 32) V!37307 V!37307 (_ BitVec 32) (_ BitVec 64) Int) Unit!33658)

(assert (=> b!1031577 (= lt!454908 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!15 (_keys!11337 thiss!1427) (_values!6151 thiss!1427) (mask!29962 thiss!1427) (extraKeys!5860 thiss!1427) (zeroValue!5964 thiss!1427) (minValue!5964 thiss!1427) (index!40940 lt!454913) key!909 (defaultEntry!6128 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031577 (not (arrayContainsKey!0 lt!454910 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454915 () Unit!33658)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64761 (_ BitVec 32) (_ BitVec 64)) Unit!33658)

(assert (=> b!1031577 (= lt!454915 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11337 thiss!1427) (index!40940 lt!454913) key!909))))

(assert (=> b!1031577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454910 (mask!29962 thiss!1427))))

(declare-fun lt!454912 () Unit!33658)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64761 (_ BitVec 32) (_ BitVec 32)) Unit!33658)

(assert (=> b!1031577 (= lt!454912 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11337 thiss!1427) (index!40940 lt!454913) (mask!29962 thiss!1427)))))

(declare-datatypes ((List!21819 0))(
  ( (Nil!21816) (Cons!21815 (h!23026 (_ BitVec 64)) (t!30911 List!21819)) )
))
(declare-fun arrayNoDuplicates!0 (array!64761 (_ BitVec 32) List!21819) Bool)

(assert (=> b!1031577 (arrayNoDuplicates!0 lt!454910 #b00000000000000000000000000000000 Nil!21816)))

(declare-fun lt!454914 () Unit!33658)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64761 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21819) Unit!33658)

(assert (=> b!1031577 (= lt!454914 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11337 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40940 lt!454913) #b00000000000000000000000000000000 Nil!21816))))

(declare-fun arrayCountValidKeys!0 (array!64761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031577 (= (arrayCountValidKeys!0 lt!454910 #b00000000000000000000000000000000 (size!31695 (_keys!11337 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11337 thiss!1427) #b00000000000000000000000000000000 (size!31695 (_keys!11337 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031577 (= lt!454910 (array!64762 (store (arr!31177 (_keys!11337 thiss!1427)) (index!40940 lt!454913) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31695 (_keys!11337 thiss!1427))))))

(declare-fun lt!454909 () Unit!33658)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64761 (_ BitVec 32) (_ BitVec 64)) Unit!33658)

(assert (=> b!1031577 (= lt!454909 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11337 thiss!1427) (index!40940 lt!454913) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90200 res!689481) b!1031572))

(assert (= (and b!1031572 res!689484) b!1031570))

(assert (= (and b!1031570 res!689482) b!1031577))

(assert (= (and b!1031577 (not res!689480)) b!1031574))

(assert (= (and b!1031574 (not res!689483)) b!1031575))

(assert (= (and b!1031571 condMapEmpty!37938) mapIsEmpty!37938))

(assert (= (and b!1031571 (not condMapEmpty!37938)) mapNonEmpty!37938))

(assert (= (and mapNonEmpty!37938 ((_ is ValueCellFull!11459) mapValue!37938)) b!1031569))

(assert (= (and b!1031571 ((_ is ValueCellFull!11459) mapDefault!37938)) b!1031576))

(assert (= b!1031573 b!1031571))

(assert (= start!90200 b!1031573))

(declare-fun b_lambda!15945 () Bool)

(assert (=> (not b_lambda!15945) (not b!1031577)))

(declare-fun t!30909 () Bool)

(declare-fun tb!6915 () Bool)

(assert (=> (and b!1031573 (= (defaultEntry!6128 thiss!1427) (defaultEntry!6128 thiss!1427)) t!30909) tb!6915))

(declare-fun result!14165 () Bool)

(assert (=> tb!6915 (= result!14165 tp_is_empty!24325)))

(assert (=> b!1031577 t!30909))

(declare-fun b_and!32983 () Bool)

(assert (= b_and!32981 (and (=> t!30909 result!14165) b_and!32983)))

(declare-fun m!951571 () Bool)

(assert (=> b!1031575 m!951571))

(declare-fun m!951573 () Bool)

(assert (=> start!90200 m!951573))

(declare-fun m!951575 () Bool)

(assert (=> mapNonEmpty!37938 m!951575))

(declare-fun m!951577 () Bool)

(assert (=> b!1031573 m!951577))

(declare-fun m!951579 () Bool)

(assert (=> b!1031573 m!951579))

(declare-fun m!951581 () Bool)

(assert (=> b!1031577 m!951581))

(declare-fun m!951583 () Bool)

(assert (=> b!1031577 m!951583))

(declare-fun m!951585 () Bool)

(assert (=> b!1031577 m!951585))

(declare-fun m!951587 () Bool)

(assert (=> b!1031577 m!951587))

(declare-fun m!951589 () Bool)

(assert (=> b!1031577 m!951589))

(declare-fun m!951591 () Bool)

(assert (=> b!1031577 m!951591))

(declare-fun m!951593 () Bool)

(assert (=> b!1031577 m!951593))

(declare-fun m!951595 () Bool)

(assert (=> b!1031577 m!951595))

(declare-fun m!951597 () Bool)

(assert (=> b!1031577 m!951597))

(declare-fun m!951599 () Bool)

(assert (=> b!1031577 m!951599))

(declare-fun m!951601 () Bool)

(assert (=> b!1031577 m!951601))

(declare-fun m!951603 () Bool)

(assert (=> b!1031577 m!951603))

(declare-fun m!951605 () Bool)

(assert (=> b!1031577 m!951605))

(declare-fun m!951607 () Bool)

(assert (=> b!1031577 m!951607))

(declare-fun m!951609 () Bool)

(assert (=> b!1031577 m!951609))

(declare-fun m!951611 () Bool)

(assert (=> b!1031577 m!951611))

(declare-fun m!951613 () Bool)

(assert (=> b!1031577 m!951613))

(assert (=> b!1031577 m!951605))

(declare-fun m!951615 () Bool)

(assert (=> b!1031570 m!951615))

(check-sat (not b!1031577) (not mapNonEmpty!37938) (not b!1031575) b_and!32983 (not b_lambda!15945) tp_is_empty!24325 (not b_next!20605) (not b!1031573) (not b!1031570) (not start!90200))
(check-sat b_and!32983 (not b_next!20605))
