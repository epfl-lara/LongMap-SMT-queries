; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91656 () Bool)

(assert start!91656)

(declare-fun b!1043423 () Bool)

(declare-fun b_free!21093 () Bool)

(declare-fun b_next!21093 () Bool)

(assert (=> b!1043423 (= b_free!21093 (not b_next!21093))))

(declare-fun tp!74517 () Bool)

(declare-fun b_and!33625 () Bool)

(assert (=> b!1043423 (= tp!74517 b_and!33625)))

(declare-fun e!591183 () Bool)

(declare-fun e!591189 () Bool)

(declare-fun tp_is_empty!24813 () Bool)

(declare-datatypes ((V!37957 0))(
  ( (V!37958 (val!12457 Int)) )
))
(declare-datatypes ((ValueCell!11703 0))(
  ( (ValueCellFull!11703 (v!15048 V!37957)) (EmptyCell!11703) )
))
(declare-datatypes ((array!65788 0))(
  ( (array!65789 (arr!31647 (Array (_ BitVec 32) (_ BitVec 64))) (size!32182 (_ BitVec 32))) )
))
(declare-datatypes ((array!65790 0))(
  ( (array!65791 (arr!31648 (Array (_ BitVec 32) ValueCell!11703)) (size!32183 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6000 0))(
  ( (LongMapFixedSize!6001 (defaultEntry!6382 Int) (mask!30471 (_ BitVec 32)) (extraKeys!6110 (_ BitVec 32)) (zeroValue!6216 V!37957) (minValue!6216 V!37957) (_size!3055 (_ BitVec 32)) (_keys!11640 array!65788) (_values!6405 array!65790) (_vacant!3055 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6000)

(declare-fun array_inv!24449 (array!65788) Bool)

(declare-fun array_inv!24450 (array!65790) Bool)

(assert (=> b!1043423 (= e!591189 (and tp!74517 tp_is_empty!24813 (array_inv!24449 (_keys!11640 thiss!1427)) (array_inv!24450 (_values!6405 thiss!1427)) e!591183))))

(declare-fun mapNonEmpty!38840 () Bool)

(declare-fun mapRes!38840 () Bool)

(declare-fun tp!74516 () Bool)

(declare-fun e!591185 () Bool)

(assert (=> mapNonEmpty!38840 (= mapRes!38840 (and tp!74516 e!591185))))

(declare-fun mapValue!38840 () ValueCell!11703)

(declare-fun mapRest!38840 () (Array (_ BitVec 32) ValueCell!11703))

(declare-fun mapKey!38840 () (_ BitVec 32))

(assert (=> mapNonEmpty!38840 (= (arr!31648 (_values!6405 thiss!1427)) (store mapRest!38840 mapKey!38840 mapValue!38840))))

(declare-fun b!1043424 () Bool)

(declare-fun e!591188 () Bool)

(assert (=> b!1043424 (= e!591183 (and e!591188 mapRes!38840))))

(declare-fun condMapEmpty!38840 () Bool)

(declare-fun mapDefault!38840 () ValueCell!11703)

(assert (=> b!1043424 (= condMapEmpty!38840 (= (arr!31648 (_values!6405 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11703)) mapDefault!38840)))))

(declare-fun b!1043425 () Bool)

(declare-fun e!591184 () Bool)

(declare-fun e!591182 () Bool)

(assert (=> b!1043425 (= e!591184 e!591182)))

(declare-fun res!695159 () Bool)

(assert (=> b!1043425 (=> (not res!695159) (not e!591182))))

(declare-datatypes ((SeekEntryResult!9829 0))(
  ( (MissingZero!9829 (index!41687 (_ BitVec 32))) (Found!9829 (index!41688 (_ BitVec 32))) (Intermediate!9829 (undefined!10641 Bool) (index!41689 (_ BitVec 32)) (x!93153 (_ BitVec 32))) (Undefined!9829) (MissingVacant!9829 (index!41690 (_ BitVec 32))) )
))
(declare-fun lt!459933 () SeekEntryResult!9829)

(get-info :version)

(assert (=> b!1043425 (= res!695159 ((_ is Found!9829) lt!459933))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65788 (_ BitVec 32)) SeekEntryResult!9829)

(assert (=> b!1043425 (= lt!459933 (seekEntry!0 key!909 (_keys!11640 thiss!1427) (mask!30471 thiss!1427)))))

(declare-fun mapIsEmpty!38840 () Bool)

(assert (=> mapIsEmpty!38840 mapRes!38840))

(declare-fun b!1043426 () Bool)

(declare-fun res!695156 () Bool)

(declare-fun e!591187 () Bool)

(assert (=> b!1043426 (=> res!695156 e!591187)))

(assert (=> b!1043426 (= res!695156 (or (not (= (size!32183 (_values!6405 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30471 thiss!1427)))) (not (= (size!32182 (_keys!11640 thiss!1427)) (size!32183 (_values!6405 thiss!1427)))) (bvslt (mask!30471 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6110 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6110 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043427 () Bool)

(assert (=> b!1043427 (= e!591187 true)))

(declare-fun lt!459929 () Bool)

(declare-datatypes ((List!21986 0))(
  ( (Nil!21983) (Cons!21982 (h!23190 (_ BitVec 64)) (t!31200 List!21986)) )
))
(declare-fun arrayNoDuplicates!0 (array!65788 (_ BitVec 32) List!21986) Bool)

(assert (=> b!1043427 (= lt!459929 (arrayNoDuplicates!0 (_keys!11640 thiss!1427) #b00000000000000000000000000000000 Nil!21983))))

(declare-fun b!1043428 () Bool)

(declare-fun res!695157 () Bool)

(assert (=> b!1043428 (=> (not res!695157) (not e!591184))))

(assert (=> b!1043428 (= res!695157 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043430 () Bool)

(declare-fun res!695155 () Bool)

(assert (=> b!1043430 (=> res!695155 e!591187)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65788 (_ BitVec 32)) Bool)

(assert (=> b!1043430 (= res!695155 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11640 thiss!1427) (mask!30471 thiss!1427))))))

(declare-fun b!1043431 () Bool)

(assert (=> b!1043431 (= e!591182 (not e!591187))))

(declare-fun res!695160 () Bool)

(assert (=> b!1043431 (=> res!695160 e!591187)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043431 (= res!695160 (not (validMask!0 (mask!30471 thiss!1427))))))

(declare-fun lt!459931 () array!65788)

(declare-fun arrayContainsKey!0 (array!65788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043431 (not (arrayContainsKey!0 lt!459931 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34065 0))(
  ( (Unit!34066) )
))
(declare-fun lt!459928 () Unit!34065)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65788 (_ BitVec 32) (_ BitVec 64)) Unit!34065)

(assert (=> b!1043431 (= lt!459928 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11640 thiss!1427) (index!41688 lt!459933) key!909))))

(assert (=> b!1043431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459931 (mask!30471 thiss!1427))))

(declare-fun lt!459934 () Unit!34065)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65788 (_ BitVec 32) (_ BitVec 32)) Unit!34065)

(assert (=> b!1043431 (= lt!459934 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11640 thiss!1427) (index!41688 lt!459933) (mask!30471 thiss!1427)))))

(assert (=> b!1043431 (arrayNoDuplicates!0 lt!459931 #b00000000000000000000000000000000 Nil!21983)))

(declare-fun lt!459932 () Unit!34065)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65788 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21986) Unit!34065)

(assert (=> b!1043431 (= lt!459932 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11640 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41688 lt!459933) #b00000000000000000000000000000000 Nil!21983))))

(declare-fun arrayCountValidKeys!0 (array!65788 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043431 (= (arrayCountValidKeys!0 lt!459931 #b00000000000000000000000000000000 (size!32182 (_keys!11640 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11640 thiss!1427) #b00000000000000000000000000000000 (size!32182 (_keys!11640 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043431 (= lt!459931 (array!65789 (store (arr!31647 (_keys!11640 thiss!1427)) (index!41688 lt!459933) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32182 (_keys!11640 thiss!1427))))))

(declare-fun lt!459930 () Unit!34065)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65788 (_ BitVec 32) (_ BitVec 64)) Unit!34065)

(assert (=> b!1043431 (= lt!459930 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11640 thiss!1427) (index!41688 lt!459933) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043432 () Bool)

(assert (=> b!1043432 (= e!591185 tp_is_empty!24813)))

(declare-fun res!695158 () Bool)

(assert (=> start!91656 (=> (not res!695158) (not e!591184))))

(declare-fun valid!2252 (LongMapFixedSize!6000) Bool)

(assert (=> start!91656 (= res!695158 (valid!2252 thiss!1427))))

(assert (=> start!91656 e!591184))

(assert (=> start!91656 e!591189))

(assert (=> start!91656 true))

(declare-fun b!1043429 () Bool)

(assert (=> b!1043429 (= e!591188 tp_is_empty!24813)))

(assert (= (and start!91656 res!695158) b!1043428))

(assert (= (and b!1043428 res!695157) b!1043425))

(assert (= (and b!1043425 res!695159) b!1043431))

(assert (= (and b!1043431 (not res!695160)) b!1043426))

(assert (= (and b!1043426 (not res!695156)) b!1043430))

(assert (= (and b!1043430 (not res!695155)) b!1043427))

(assert (= (and b!1043424 condMapEmpty!38840) mapIsEmpty!38840))

(assert (= (and b!1043424 (not condMapEmpty!38840)) mapNonEmpty!38840))

(assert (= (and mapNonEmpty!38840 ((_ is ValueCellFull!11703) mapValue!38840)) b!1043432))

(assert (= (and b!1043424 ((_ is ValueCellFull!11703) mapDefault!38840)) b!1043429))

(assert (= b!1043423 b!1043424))

(assert (= start!91656 b!1043423))

(declare-fun m!962627 () Bool)

(assert (=> start!91656 m!962627))

(declare-fun m!962629 () Bool)

(assert (=> b!1043423 m!962629))

(declare-fun m!962631 () Bool)

(assert (=> b!1043423 m!962631))

(declare-fun m!962633 () Bool)

(assert (=> b!1043425 m!962633))

(declare-fun m!962635 () Bool)

(assert (=> b!1043427 m!962635))

(declare-fun m!962637 () Bool)

(assert (=> b!1043431 m!962637))

(declare-fun m!962639 () Bool)

(assert (=> b!1043431 m!962639))

(declare-fun m!962641 () Bool)

(assert (=> b!1043431 m!962641))

(declare-fun m!962643 () Bool)

(assert (=> b!1043431 m!962643))

(declare-fun m!962645 () Bool)

(assert (=> b!1043431 m!962645))

(declare-fun m!962647 () Bool)

(assert (=> b!1043431 m!962647))

(declare-fun m!962649 () Bool)

(assert (=> b!1043431 m!962649))

(declare-fun m!962651 () Bool)

(assert (=> b!1043431 m!962651))

(declare-fun m!962653 () Bool)

(assert (=> b!1043431 m!962653))

(declare-fun m!962655 () Bool)

(assert (=> b!1043431 m!962655))

(declare-fun m!962657 () Bool)

(assert (=> b!1043431 m!962657))

(declare-fun m!962659 () Bool)

(assert (=> b!1043430 m!962659))

(declare-fun m!962661 () Bool)

(assert (=> mapNonEmpty!38840 m!962661))

(check-sat (not b!1043431) (not mapNonEmpty!38840) (not start!91656) tp_is_empty!24813 b_and!33625 (not b!1043427) (not b!1043430) (not b_next!21093) (not b!1043425) (not b!1043423))
(check-sat b_and!33625 (not b_next!21093))
