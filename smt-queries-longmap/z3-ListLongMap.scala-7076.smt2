; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89744 () Bool)

(assert start!89744)

(declare-fun b!1027898 () Bool)

(declare-fun b_free!20509 () Bool)

(declare-fun b_next!20509 () Bool)

(assert (=> b!1027898 (= b_free!20509 (not b_next!20509))))

(declare-fun tp!72573 () Bool)

(declare-fun b_and!32765 () Bool)

(assert (=> b!1027898 (= tp!72573 b_and!32765)))

(declare-fun b!1027896 () Bool)

(declare-fun e!580003 () Bool)

(declare-fun e!580008 () Bool)

(assert (=> b!1027896 (= e!580003 (not e!580008))))

(declare-fun res!687700 () Bool)

(assert (=> b!1027896 (=> res!687700 e!580008)))

(declare-datatypes ((V!37179 0))(
  ( (V!37180 (val!12165 Int)) )
))
(declare-datatypes ((ValueCell!11411 0))(
  ( (ValueCellFull!11411 (v!14730 V!37179)) (EmptyCell!11411) )
))
(declare-datatypes ((array!64557 0))(
  ( (array!64558 (arr!31081 (Array (_ BitVec 32) (_ BitVec 64))) (size!31595 (_ BitVec 32))) )
))
(declare-datatypes ((array!64559 0))(
  ( (array!64560 (arr!31082 (Array (_ BitVec 32) ValueCell!11411)) (size!31596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5416 0))(
  ( (LongMapFixedSize!5417 (defaultEntry!6060 Int) (mask!29818 (_ BitVec 32)) (extraKeys!5792 (_ BitVec 32)) (zeroValue!5896 V!37179) (minValue!5896 V!37179) (_size!2763 (_ BitVec 32)) (_keys!11245 array!64557) (_values!6083 array!64559) (_vacant!2763 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5416)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027896 (= res!687700 (not (validMask!0 (mask!29818 thiss!1427))))))

(declare-fun lt!452171 () array!64557)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027896 (not (arrayContainsKey!0 lt!452171 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9605 0))(
  ( (MissingZero!9605 (index!40791 (_ BitVec 32))) (Found!9605 (index!40792 (_ BitVec 32))) (Intermediate!9605 (undefined!10417 Bool) (index!40793 (_ BitVec 32)) (x!91305 (_ BitVec 32))) (Undefined!9605) (MissingVacant!9605 (index!40794 (_ BitVec 32))) )
))
(declare-fun lt!452177 () SeekEntryResult!9605)

(declare-datatypes ((Unit!33456 0))(
  ( (Unit!33457) )
))
(declare-fun lt!452175 () Unit!33456)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64557 (_ BitVec 32) (_ BitVec 64)) Unit!33456)

(assert (=> b!1027896 (= lt!452175 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11245 thiss!1427) (index!40792 lt!452177) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64557 (_ BitVec 32)) Bool)

(assert (=> b!1027896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452171 (mask!29818 thiss!1427))))

(declare-fun lt!452174 () Unit!33456)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64557 (_ BitVec 32) (_ BitVec 32)) Unit!33456)

(assert (=> b!1027896 (= lt!452174 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11245 thiss!1427) (index!40792 lt!452177) (mask!29818 thiss!1427)))))

(declare-datatypes ((List!21771 0))(
  ( (Nil!21768) (Cons!21767 (h!22974 (_ BitVec 64)) (t!30825 List!21771)) )
))
(declare-fun arrayNoDuplicates!0 (array!64557 (_ BitVec 32) List!21771) Bool)

(assert (=> b!1027896 (arrayNoDuplicates!0 lt!452171 #b00000000000000000000000000000000 Nil!21768)))

(declare-fun lt!452173 () Unit!33456)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21771) Unit!33456)

(assert (=> b!1027896 (= lt!452173 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11245 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40792 lt!452177) #b00000000000000000000000000000000 Nil!21768))))

(declare-fun arrayCountValidKeys!0 (array!64557 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027896 (= (arrayCountValidKeys!0 lt!452171 #b00000000000000000000000000000000 (size!31595 (_keys!11245 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 (size!31595 (_keys!11245 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027896 (= lt!452171 (array!64558 (store (arr!31081 (_keys!11245 thiss!1427)) (index!40792 lt!452177) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31595 (_keys!11245 thiss!1427))))))

(declare-fun lt!452172 () Unit!33456)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64557 (_ BitVec 32) (_ BitVec 64)) Unit!33456)

(assert (=> b!1027896 (= lt!452172 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11245 thiss!1427) (index!40792 lt!452177) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687704 () Bool)

(declare-fun e!580004 () Bool)

(assert (=> start!89744 (=> (not res!687704) (not e!580004))))

(declare-fun valid!2063 (LongMapFixedSize!5416) Bool)

(assert (=> start!89744 (= res!687704 (valid!2063 thiss!1427))))

(assert (=> start!89744 e!580004))

(declare-fun e!580002 () Bool)

(assert (=> start!89744 e!580002))

(assert (=> start!89744 true))

(declare-fun b!1027897 () Bool)

(assert (=> b!1027897 (= e!580008 true)))

(declare-fun lt!452176 () Bool)

(assert (=> b!1027897 (= lt!452176 (arrayNoDuplicates!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 Nil!21768))))

(declare-fun e!580009 () Bool)

(declare-fun tp_is_empty!24229 () Bool)

(declare-fun array_inv!24081 (array!64557) Bool)

(declare-fun array_inv!24082 (array!64559) Bool)

(assert (=> b!1027898 (= e!580002 (and tp!72573 tp_is_empty!24229 (array_inv!24081 (_keys!11245 thiss!1427)) (array_inv!24082 (_values!6083 thiss!1427)) e!580009))))

(declare-fun b!1027899 () Bool)

(declare-fun e!580006 () Bool)

(assert (=> b!1027899 (= e!580006 tp_is_empty!24229)))

(declare-fun b!1027900 () Bool)

(declare-fun mapRes!37772 () Bool)

(assert (=> b!1027900 (= e!580009 (and e!580006 mapRes!37772))))

(declare-fun condMapEmpty!37772 () Bool)

(declare-fun mapDefault!37772 () ValueCell!11411)

(assert (=> b!1027900 (= condMapEmpty!37772 (= (arr!31082 (_values!6083 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11411)) mapDefault!37772)))))

(declare-fun b!1027901 () Bool)

(assert (=> b!1027901 (= e!580004 e!580003)))

(declare-fun res!687703 () Bool)

(assert (=> b!1027901 (=> (not res!687703) (not e!580003))))

(get-info :version)

(assert (=> b!1027901 (= res!687703 ((_ is Found!9605) lt!452177))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64557 (_ BitVec 32)) SeekEntryResult!9605)

(assert (=> b!1027901 (= lt!452177 (seekEntry!0 key!909 (_keys!11245 thiss!1427) (mask!29818 thiss!1427)))))

(declare-fun mapIsEmpty!37772 () Bool)

(assert (=> mapIsEmpty!37772 mapRes!37772))

(declare-fun b!1027902 () Bool)

(declare-fun res!687701 () Bool)

(assert (=> b!1027902 (=> res!687701 e!580008)))

(assert (=> b!1027902 (= res!687701 (or (not (= (size!31596 (_values!6083 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29818 thiss!1427)))) (not (= (size!31595 (_keys!11245 thiss!1427)) (size!31596 (_values!6083 thiss!1427)))) (bvslt (mask!29818 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5792 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5792 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027903 () Bool)

(declare-fun res!687702 () Bool)

(assert (=> b!1027903 (=> (not res!687702) (not e!580004))))

(assert (=> b!1027903 (= res!687702 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37772 () Bool)

(declare-fun tp!72572 () Bool)

(declare-fun e!580007 () Bool)

(assert (=> mapNonEmpty!37772 (= mapRes!37772 (and tp!72572 e!580007))))

(declare-fun mapKey!37772 () (_ BitVec 32))

(declare-fun mapRest!37772 () (Array (_ BitVec 32) ValueCell!11411))

(declare-fun mapValue!37772 () ValueCell!11411)

(assert (=> mapNonEmpty!37772 (= (arr!31082 (_values!6083 thiss!1427)) (store mapRest!37772 mapKey!37772 mapValue!37772))))

(declare-fun b!1027904 () Bool)

(declare-fun res!687699 () Bool)

(assert (=> b!1027904 (=> res!687699 e!580008)))

(assert (=> b!1027904 (= res!687699 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11245 thiss!1427) (mask!29818 thiss!1427))))))

(declare-fun b!1027905 () Bool)

(assert (=> b!1027905 (= e!580007 tp_is_empty!24229)))

(assert (= (and start!89744 res!687704) b!1027903))

(assert (= (and b!1027903 res!687702) b!1027901))

(assert (= (and b!1027901 res!687703) b!1027896))

(assert (= (and b!1027896 (not res!687700)) b!1027902))

(assert (= (and b!1027902 (not res!687701)) b!1027904))

(assert (= (and b!1027904 (not res!687699)) b!1027897))

(assert (= (and b!1027900 condMapEmpty!37772) mapIsEmpty!37772))

(assert (= (and b!1027900 (not condMapEmpty!37772)) mapNonEmpty!37772))

(assert (= (and mapNonEmpty!37772 ((_ is ValueCellFull!11411) mapValue!37772)) b!1027905))

(assert (= (and b!1027900 ((_ is ValueCellFull!11411) mapDefault!37772)) b!1027899))

(assert (= b!1027898 b!1027900))

(assert (= start!89744 b!1027898))

(declare-fun m!946539 () Bool)

(assert (=> start!89744 m!946539))

(declare-fun m!946541 () Bool)

(assert (=> mapNonEmpty!37772 m!946541))

(declare-fun m!946543 () Bool)

(assert (=> b!1027904 m!946543))

(declare-fun m!946545 () Bool)

(assert (=> b!1027901 m!946545))

(declare-fun m!946547 () Bool)

(assert (=> b!1027898 m!946547))

(declare-fun m!946549 () Bool)

(assert (=> b!1027898 m!946549))

(declare-fun m!946551 () Bool)

(assert (=> b!1027897 m!946551))

(declare-fun m!946553 () Bool)

(assert (=> b!1027896 m!946553))

(declare-fun m!946555 () Bool)

(assert (=> b!1027896 m!946555))

(declare-fun m!946557 () Bool)

(assert (=> b!1027896 m!946557))

(declare-fun m!946559 () Bool)

(assert (=> b!1027896 m!946559))

(declare-fun m!946561 () Bool)

(assert (=> b!1027896 m!946561))

(declare-fun m!946563 () Bool)

(assert (=> b!1027896 m!946563))

(declare-fun m!946565 () Bool)

(assert (=> b!1027896 m!946565))

(declare-fun m!946567 () Bool)

(assert (=> b!1027896 m!946567))

(declare-fun m!946569 () Bool)

(assert (=> b!1027896 m!946569))

(declare-fun m!946571 () Bool)

(assert (=> b!1027896 m!946571))

(declare-fun m!946573 () Bool)

(assert (=> b!1027896 m!946573))

(check-sat (not b!1027896) (not b_next!20509) (not b!1027897) (not start!89744) (not b!1027898) (not b!1027901) b_and!32765 tp_is_empty!24229 (not b!1027904) (not mapNonEmpty!37772))
(check-sat b_and!32765 (not b_next!20509))
