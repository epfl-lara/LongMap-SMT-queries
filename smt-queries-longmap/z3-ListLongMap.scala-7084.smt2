; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89560 () Bool)

(assert start!89560)

(declare-fun b!1027336 () Bool)

(declare-fun b_free!20559 () Bool)

(declare-fun b_next!20559 () Bool)

(assert (=> b!1027336 (= b_free!20559 (not b_next!20559))))

(declare-fun tp!72722 () Bool)

(declare-fun b_and!32805 () Bool)

(assert (=> b!1027336 (= tp!72722 b_and!32805)))

(declare-fun b!1027331 () Bool)

(declare-fun res!687642 () Bool)

(declare-fun e!579760 () Bool)

(assert (=> b!1027331 (=> res!687642 e!579760)))

(declare-datatypes ((V!37245 0))(
  ( (V!37246 (val!12190 Int)) )
))
(declare-datatypes ((ValueCell!11436 0))(
  ( (ValueCellFull!11436 (v!14759 V!37245)) (EmptyCell!11436) )
))
(declare-datatypes ((array!64608 0))(
  ( (array!64609 (arr!31113 (Array (_ BitVec 32) (_ BitVec 64))) (size!31626 (_ BitVec 32))) )
))
(declare-datatypes ((array!64610 0))(
  ( (array!64611 (arr!31114 (Array (_ BitVec 32) ValueCell!11436)) (size!31627 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5466 0))(
  ( (LongMapFixedSize!5467 (defaultEntry!6085 Int) (mask!29799 (_ BitVec 32)) (extraKeys!5817 (_ BitVec 32)) (zeroValue!5921 V!37245) (minValue!5921 V!37245) (_size!2788 (_ BitVec 32)) (_keys!11232 array!64608) (_values!6108 array!64610) (_vacant!2788 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5466)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64608 (_ BitVec 32)) Bool)

(assert (=> b!1027331 (= res!687642 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11232 thiss!1427) (mask!29799 thiss!1427))))))

(declare-fun mapIsEmpty!37847 () Bool)

(declare-fun mapRes!37847 () Bool)

(assert (=> mapIsEmpty!37847 mapRes!37847))

(declare-fun b!1027332 () Bool)

(declare-fun e!579764 () Bool)

(declare-fun e!579759 () Bool)

(assert (=> b!1027332 (= e!579764 e!579759)))

(declare-fun res!687639 () Bool)

(assert (=> b!1027332 (=> (not res!687639) (not e!579759))))

(declare-datatypes ((SeekEntryResult!9670 0))(
  ( (MissingZero!9670 (index!41051 (_ BitVec 32))) (Found!9670 (index!41052 (_ BitVec 32))) (Intermediate!9670 (undefined!10482 Bool) (index!41053 (_ BitVec 32)) (x!91412 (_ BitVec 32))) (Undefined!9670) (MissingVacant!9670 (index!41054 (_ BitVec 32))) )
))
(declare-fun lt!452184 () SeekEntryResult!9670)

(get-info :version)

(assert (=> b!1027332 (= res!687639 ((_ is Found!9670) lt!452184))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64608 (_ BitVec 32)) SeekEntryResult!9670)

(assert (=> b!1027332 (= lt!452184 (seekEntry!0 key!909 (_keys!11232 thiss!1427) (mask!29799 thiss!1427)))))

(declare-fun res!687644 () Bool)

(assert (=> start!89560 (=> (not res!687644) (not e!579764))))

(declare-fun valid!2070 (LongMapFixedSize!5466) Bool)

(assert (=> start!89560 (= res!687644 (valid!2070 thiss!1427))))

(assert (=> start!89560 e!579764))

(declare-fun e!579766 () Bool)

(assert (=> start!89560 e!579766))

(assert (=> start!89560 true))

(declare-fun b!1027333 () Bool)

(declare-fun res!687641 () Bool)

(assert (=> b!1027333 (=> res!687641 e!579760)))

(assert (=> b!1027333 (= res!687641 (or (not (= (size!31627 (_values!6108 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29799 thiss!1427)))) (not (= (size!31626 (_keys!11232 thiss!1427)) (size!31627 (_values!6108 thiss!1427)))) (bvslt (mask!29799 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5817 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5817 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027334 () Bool)

(declare-fun e!579762 () Bool)

(declare-fun tp_is_empty!24279 () Bool)

(assert (=> b!1027334 (= e!579762 tp_is_empty!24279)))

(declare-fun mapNonEmpty!37847 () Bool)

(declare-fun tp!72723 () Bool)

(declare-fun e!579765 () Bool)

(assert (=> mapNonEmpty!37847 (= mapRes!37847 (and tp!72723 e!579765))))

(declare-fun mapRest!37847 () (Array (_ BitVec 32) ValueCell!11436))

(declare-fun mapKey!37847 () (_ BitVec 32))

(declare-fun mapValue!37847 () ValueCell!11436)

(assert (=> mapNonEmpty!37847 (= (arr!31114 (_values!6108 thiss!1427)) (store mapRest!37847 mapKey!37847 mapValue!37847))))

(declare-fun b!1027335 () Bool)

(declare-fun res!687640 () Bool)

(assert (=> b!1027335 (=> (not res!687640) (not e!579764))))

(assert (=> b!1027335 (= res!687640 (not (= key!909 (bvneg key!909))))))

(declare-fun e!579763 () Bool)

(declare-fun array_inv!24089 (array!64608) Bool)

(declare-fun array_inv!24090 (array!64610) Bool)

(assert (=> b!1027336 (= e!579766 (and tp!72722 tp_is_empty!24279 (array_inv!24089 (_keys!11232 thiss!1427)) (array_inv!24090 (_values!6108 thiss!1427)) e!579763))))

(declare-fun b!1027337 () Bool)

(assert (=> b!1027337 (= e!579763 (and e!579762 mapRes!37847))))

(declare-fun condMapEmpty!37847 () Bool)

(declare-fun mapDefault!37847 () ValueCell!11436)

(assert (=> b!1027337 (= condMapEmpty!37847 (= (arr!31114 (_values!6108 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11436)) mapDefault!37847)))))

(declare-fun b!1027338 () Bool)

(assert (=> b!1027338 (= e!579765 tp_is_empty!24279)))

(declare-fun b!1027339 () Bool)

(assert (=> b!1027339 (= e!579760 true)))

(declare-fun lt!452186 () Bool)

(declare-datatypes ((List!21804 0))(
  ( (Nil!21801) (Cons!21800 (h!22998 (_ BitVec 64)) (t!30866 List!21804)) )
))
(declare-fun arrayNoDuplicates!0 (array!64608 (_ BitVec 32) List!21804) Bool)

(assert (=> b!1027339 (= lt!452186 (arrayNoDuplicates!0 (_keys!11232 thiss!1427) #b00000000000000000000000000000000 Nil!21801))))

(declare-fun b!1027340 () Bool)

(assert (=> b!1027340 (= e!579759 (not e!579760))))

(declare-fun res!687643 () Bool)

(assert (=> b!1027340 (=> res!687643 e!579760)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027340 (= res!687643 (not (validMask!0 (mask!29799 thiss!1427))))))

(declare-fun lt!452185 () array!64608)

(declare-fun arrayContainsKey!0 (array!64608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027340 (not (arrayContainsKey!0 lt!452185 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33479 0))(
  ( (Unit!33480) )
))
(declare-fun lt!452181 () Unit!33479)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64608 (_ BitVec 32) (_ BitVec 64)) Unit!33479)

(assert (=> b!1027340 (= lt!452181 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11232 thiss!1427) (index!41052 lt!452184) key!909))))

(assert (=> b!1027340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452185 (mask!29799 thiss!1427))))

(declare-fun lt!452187 () Unit!33479)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64608 (_ BitVec 32) (_ BitVec 32)) Unit!33479)

(assert (=> b!1027340 (= lt!452187 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11232 thiss!1427) (index!41052 lt!452184) (mask!29799 thiss!1427)))))

(assert (=> b!1027340 (arrayNoDuplicates!0 lt!452185 #b00000000000000000000000000000000 Nil!21801)))

(declare-fun lt!452183 () Unit!33479)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21804) Unit!33479)

(assert (=> b!1027340 (= lt!452183 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11232 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41052 lt!452184) #b00000000000000000000000000000000 Nil!21801))))

(declare-fun arrayCountValidKeys!0 (array!64608 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027340 (= (arrayCountValidKeys!0 lt!452185 #b00000000000000000000000000000000 (size!31626 (_keys!11232 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11232 thiss!1427) #b00000000000000000000000000000000 (size!31626 (_keys!11232 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027340 (= lt!452185 (array!64609 (store (arr!31113 (_keys!11232 thiss!1427)) (index!41052 lt!452184) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31626 (_keys!11232 thiss!1427))))))

(declare-fun lt!452182 () Unit!33479)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64608 (_ BitVec 32) (_ BitVec 64)) Unit!33479)

(assert (=> b!1027340 (= lt!452182 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11232 thiss!1427) (index!41052 lt!452184) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89560 res!687644) b!1027335))

(assert (= (and b!1027335 res!687640) b!1027332))

(assert (= (and b!1027332 res!687639) b!1027340))

(assert (= (and b!1027340 (not res!687643)) b!1027333))

(assert (= (and b!1027333 (not res!687641)) b!1027331))

(assert (= (and b!1027331 (not res!687642)) b!1027339))

(assert (= (and b!1027337 condMapEmpty!37847) mapIsEmpty!37847))

(assert (= (and b!1027337 (not condMapEmpty!37847)) mapNonEmpty!37847))

(assert (= (and mapNonEmpty!37847 ((_ is ValueCellFull!11436) mapValue!37847)) b!1027338))

(assert (= (and b!1027337 ((_ is ValueCellFull!11436) mapDefault!37847)) b!1027334))

(assert (= b!1027336 b!1027337))

(assert (= start!89560 b!1027336))

(declare-fun m!945775 () Bool)

(assert (=> mapNonEmpty!37847 m!945775))

(declare-fun m!945777 () Bool)

(assert (=> b!1027339 m!945777))

(declare-fun m!945779 () Bool)

(assert (=> b!1027340 m!945779))

(declare-fun m!945781 () Bool)

(assert (=> b!1027340 m!945781))

(declare-fun m!945783 () Bool)

(assert (=> b!1027340 m!945783))

(declare-fun m!945785 () Bool)

(assert (=> b!1027340 m!945785))

(declare-fun m!945787 () Bool)

(assert (=> b!1027340 m!945787))

(declare-fun m!945789 () Bool)

(assert (=> b!1027340 m!945789))

(declare-fun m!945791 () Bool)

(assert (=> b!1027340 m!945791))

(declare-fun m!945793 () Bool)

(assert (=> b!1027340 m!945793))

(declare-fun m!945795 () Bool)

(assert (=> b!1027340 m!945795))

(declare-fun m!945797 () Bool)

(assert (=> b!1027340 m!945797))

(declare-fun m!945799 () Bool)

(assert (=> b!1027340 m!945799))

(declare-fun m!945801 () Bool)

(assert (=> start!89560 m!945801))

(declare-fun m!945803 () Bool)

(assert (=> b!1027332 m!945803))

(declare-fun m!945805 () Bool)

(assert (=> b!1027336 m!945805))

(declare-fun m!945807 () Bool)

(assert (=> b!1027336 m!945807))

(declare-fun m!945809 () Bool)

(assert (=> b!1027331 m!945809))

(check-sat (not b!1027332) (not b!1027339) (not b_next!20559) (not b!1027331) (not b!1027336) (not b!1027340) b_and!32805 (not mapNonEmpty!37847) (not start!89560) tp_is_empty!24279)
(check-sat b_and!32805 (not b_next!20559))
