; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89750 () Bool)

(assert start!89750)

(declare-fun b!1027991 () Bool)

(declare-fun b_free!20515 () Bool)

(declare-fun b_next!20515 () Bool)

(assert (=> b!1027991 (= b_free!20515 (not b_next!20515))))

(declare-fun tp!72590 () Bool)

(declare-fun b_and!32771 () Bool)

(assert (=> b!1027991 (= tp!72590 b_and!32771)))

(declare-fun b!1027986 () Bool)

(declare-fun e!580076 () Bool)

(assert (=> b!1027986 (= e!580076 true)))

(declare-fun lt!452235 () Bool)

(declare-datatypes ((V!37187 0))(
  ( (V!37188 (val!12168 Int)) )
))
(declare-datatypes ((ValueCell!11414 0))(
  ( (ValueCellFull!11414 (v!14733 V!37187)) (EmptyCell!11414) )
))
(declare-datatypes ((array!64569 0))(
  ( (array!64570 (arr!31087 (Array (_ BitVec 32) (_ BitVec 64))) (size!31601 (_ BitVec 32))) )
))
(declare-datatypes ((array!64571 0))(
  ( (array!64572 (arr!31088 (Array (_ BitVec 32) ValueCell!11414)) (size!31602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5422 0))(
  ( (LongMapFixedSize!5423 (defaultEntry!6063 Int) (mask!29823 (_ BitVec 32)) (extraKeys!5795 (_ BitVec 32)) (zeroValue!5899 V!37187) (minValue!5899 V!37187) (_size!2766 (_ BitVec 32)) (_keys!11248 array!64569) (_values!6086 array!64571) (_vacant!2766 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5422)

(declare-datatypes ((List!21773 0))(
  ( (Nil!21770) (Cons!21769 (h!22976 (_ BitVec 64)) (t!30827 List!21773)) )
))
(declare-fun arrayNoDuplicates!0 (array!64569 (_ BitVec 32) List!21773) Bool)

(assert (=> b!1027986 (= lt!452235 (arrayNoDuplicates!0 (_keys!11248 thiss!1427) #b00000000000000000000000000000000 Nil!21770))))

(declare-fun b!1027987 () Bool)

(declare-fun e!580079 () Bool)

(declare-fun e!580075 () Bool)

(assert (=> b!1027987 (= e!580079 e!580075)))

(declare-fun res!687753 () Bool)

(assert (=> b!1027987 (=> (not res!687753) (not e!580075))))

(declare-datatypes ((SeekEntryResult!9608 0))(
  ( (MissingZero!9608 (index!40803 (_ BitVec 32))) (Found!9608 (index!40804 (_ BitVec 32))) (Intermediate!9608 (undefined!10420 Bool) (index!40805 (_ BitVec 32)) (x!91316 (_ BitVec 32))) (Undefined!9608) (MissingVacant!9608 (index!40806 (_ BitVec 32))) )
))
(declare-fun lt!452236 () SeekEntryResult!9608)

(get-info :version)

(assert (=> b!1027987 (= res!687753 ((_ is Found!9608) lt!452236))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64569 (_ BitVec 32)) SeekEntryResult!9608)

(assert (=> b!1027987 (= lt!452236 (seekEntry!0 key!909 (_keys!11248 thiss!1427) (mask!29823 thiss!1427)))))

(declare-fun b!1027988 () Bool)

(declare-fun e!580078 () Bool)

(declare-fun tp_is_empty!24235 () Bool)

(assert (=> b!1027988 (= e!580078 tp_is_empty!24235)))

(declare-fun b!1027989 () Bool)

(assert (=> b!1027989 (= e!580075 (not e!580076))))

(declare-fun res!687756 () Bool)

(assert (=> b!1027989 (=> res!687756 e!580076)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027989 (= res!687756 (not (validMask!0 (mask!29823 thiss!1427))))))

(declare-fun lt!452238 () array!64569)

(declare-fun arrayContainsKey!0 (array!64569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027989 (not (arrayContainsKey!0 lt!452238 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33460 0))(
  ( (Unit!33461) )
))
(declare-fun lt!452237 () Unit!33460)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64569 (_ BitVec 32) (_ BitVec 64)) Unit!33460)

(assert (=> b!1027989 (= lt!452237 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11248 thiss!1427) (index!40804 lt!452236) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64569 (_ BitVec 32)) Bool)

(assert (=> b!1027989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452238 (mask!29823 thiss!1427))))

(declare-fun lt!452240 () Unit!33460)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64569 (_ BitVec 32) (_ BitVec 32)) Unit!33460)

(assert (=> b!1027989 (= lt!452240 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11248 thiss!1427) (index!40804 lt!452236) (mask!29823 thiss!1427)))))

(assert (=> b!1027989 (arrayNoDuplicates!0 lt!452238 #b00000000000000000000000000000000 Nil!21770)))

(declare-fun lt!452234 () Unit!33460)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21773) Unit!33460)

(assert (=> b!1027989 (= lt!452234 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11248 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40804 lt!452236) #b00000000000000000000000000000000 Nil!21770))))

(declare-fun arrayCountValidKeys!0 (array!64569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027989 (= (arrayCountValidKeys!0 lt!452238 #b00000000000000000000000000000000 (size!31601 (_keys!11248 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11248 thiss!1427) #b00000000000000000000000000000000 (size!31601 (_keys!11248 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027989 (= lt!452238 (array!64570 (store (arr!31087 (_keys!11248 thiss!1427)) (index!40804 lt!452236) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31601 (_keys!11248 thiss!1427))))))

(declare-fun lt!452239 () Unit!33460)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64569 (_ BitVec 32) (_ BitVec 64)) Unit!33460)

(assert (=> b!1027989 (= lt!452239 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11248 thiss!1427) (index!40804 lt!452236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027990 () Bool)

(declare-fun e!580074 () Bool)

(declare-fun mapRes!37781 () Bool)

(assert (=> b!1027990 (= e!580074 (and e!580078 mapRes!37781))))

(declare-fun condMapEmpty!37781 () Bool)

(declare-fun mapDefault!37781 () ValueCell!11414)

(assert (=> b!1027990 (= condMapEmpty!37781 (= (arr!31088 (_values!6086 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11414)) mapDefault!37781)))))

(declare-fun res!687757 () Bool)

(assert (=> start!89750 (=> (not res!687757) (not e!580079))))

(declare-fun valid!2065 (LongMapFixedSize!5422) Bool)

(assert (=> start!89750 (= res!687757 (valid!2065 thiss!1427))))

(assert (=> start!89750 e!580079))

(declare-fun e!580077 () Bool)

(assert (=> start!89750 e!580077))

(assert (=> start!89750 true))

(declare-fun mapNonEmpty!37781 () Bool)

(declare-fun tp!72591 () Bool)

(declare-fun e!580081 () Bool)

(assert (=> mapNonEmpty!37781 (= mapRes!37781 (and tp!72591 e!580081))))

(declare-fun mapKey!37781 () (_ BitVec 32))

(declare-fun mapRest!37781 () (Array (_ BitVec 32) ValueCell!11414))

(declare-fun mapValue!37781 () ValueCell!11414)

(assert (=> mapNonEmpty!37781 (= (arr!31088 (_values!6086 thiss!1427)) (store mapRest!37781 mapKey!37781 mapValue!37781))))

(declare-fun array_inv!24085 (array!64569) Bool)

(declare-fun array_inv!24086 (array!64571) Bool)

(assert (=> b!1027991 (= e!580077 (and tp!72590 tp_is_empty!24235 (array_inv!24085 (_keys!11248 thiss!1427)) (array_inv!24086 (_values!6086 thiss!1427)) e!580074))))

(declare-fun b!1027992 () Bool)

(assert (=> b!1027992 (= e!580081 tp_is_empty!24235)))

(declare-fun mapIsEmpty!37781 () Bool)

(assert (=> mapIsEmpty!37781 mapRes!37781))

(declare-fun b!1027993 () Bool)

(declare-fun res!687755 () Bool)

(assert (=> b!1027993 (=> res!687755 e!580076)))

(assert (=> b!1027993 (= res!687755 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11248 thiss!1427) (mask!29823 thiss!1427))))))

(declare-fun b!1027994 () Bool)

(declare-fun res!687754 () Bool)

(assert (=> b!1027994 (=> (not res!687754) (not e!580079))))

(assert (=> b!1027994 (= res!687754 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027995 () Bool)

(declare-fun res!687758 () Bool)

(assert (=> b!1027995 (=> res!687758 e!580076)))

(assert (=> b!1027995 (= res!687758 (or (not (= (size!31602 (_values!6086 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29823 thiss!1427)))) (not (= (size!31601 (_keys!11248 thiss!1427)) (size!31602 (_values!6086 thiss!1427)))) (bvslt (mask!29823 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5795 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5795 thiss!1427) #b00000000000000000000000000000011)))))

(assert (= (and start!89750 res!687757) b!1027994))

(assert (= (and b!1027994 res!687754) b!1027987))

(assert (= (and b!1027987 res!687753) b!1027989))

(assert (= (and b!1027989 (not res!687756)) b!1027995))

(assert (= (and b!1027995 (not res!687758)) b!1027993))

(assert (= (and b!1027993 (not res!687755)) b!1027986))

(assert (= (and b!1027990 condMapEmpty!37781) mapIsEmpty!37781))

(assert (= (and b!1027990 (not condMapEmpty!37781)) mapNonEmpty!37781))

(assert (= (and mapNonEmpty!37781 ((_ is ValueCellFull!11414) mapValue!37781)) b!1027992))

(assert (= (and b!1027990 ((_ is ValueCellFull!11414) mapDefault!37781)) b!1027988))

(assert (= b!1027991 b!1027990))

(assert (= start!89750 b!1027991))

(declare-fun m!946647 () Bool)

(assert (=> mapNonEmpty!37781 m!946647))

(declare-fun m!946649 () Bool)

(assert (=> start!89750 m!946649))

(declare-fun m!946651 () Bool)

(assert (=> b!1027987 m!946651))

(declare-fun m!946653 () Bool)

(assert (=> b!1027991 m!946653))

(declare-fun m!946655 () Bool)

(assert (=> b!1027991 m!946655))

(declare-fun m!946657 () Bool)

(assert (=> b!1027989 m!946657))

(declare-fun m!946659 () Bool)

(assert (=> b!1027989 m!946659))

(declare-fun m!946661 () Bool)

(assert (=> b!1027989 m!946661))

(declare-fun m!946663 () Bool)

(assert (=> b!1027989 m!946663))

(declare-fun m!946665 () Bool)

(assert (=> b!1027989 m!946665))

(declare-fun m!946667 () Bool)

(assert (=> b!1027989 m!946667))

(declare-fun m!946669 () Bool)

(assert (=> b!1027989 m!946669))

(declare-fun m!946671 () Bool)

(assert (=> b!1027989 m!946671))

(declare-fun m!946673 () Bool)

(assert (=> b!1027989 m!946673))

(declare-fun m!946675 () Bool)

(assert (=> b!1027989 m!946675))

(declare-fun m!946677 () Bool)

(assert (=> b!1027989 m!946677))

(declare-fun m!946679 () Bool)

(assert (=> b!1027986 m!946679))

(declare-fun m!946681 () Bool)

(assert (=> b!1027993 m!946681))

(check-sat (not mapNonEmpty!37781) b_and!32771 (not b!1027986) (not start!89750) (not b!1027989) (not b!1027991) tp_is_empty!24235 (not b!1027993) (not b!1027987) (not b_next!20515))
(check-sat b_and!32771 (not b_next!20515))
