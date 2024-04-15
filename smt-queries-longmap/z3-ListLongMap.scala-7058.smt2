; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89400 () Bool)

(assert start!89400)

(declare-fun b!1024848 () Bool)

(declare-fun b_free!20401 () Bool)

(declare-fun b_next!20401 () Bool)

(assert (=> b!1024848 (= b_free!20401 (not b_next!20401))))

(declare-fun tp!72249 () Bool)

(declare-fun b_and!32621 () Bool)

(assert (=> b!1024848 (= tp!72249 b_and!32621)))

(declare-fun mapNonEmpty!37610 () Bool)

(declare-fun mapRes!37610 () Bool)

(declare-fun tp!72248 () Bool)

(declare-fun e!577779 () Bool)

(assert (=> mapNonEmpty!37610 (= mapRes!37610 (and tp!72248 e!577779))))

(declare-fun mapKey!37610 () (_ BitVec 32))

(declare-datatypes ((V!37035 0))(
  ( (V!37036 (val!12111 Int)) )
))
(declare-datatypes ((ValueCell!11357 0))(
  ( (ValueCellFull!11357 (v!14679 V!37035)) (EmptyCell!11357) )
))
(declare-datatypes ((array!64231 0))(
  ( (array!64232 (arr!30924 (Array (_ BitVec 32) (_ BitVec 64))) (size!31439 (_ BitVec 32))) )
))
(declare-datatypes ((array!64233 0))(
  ( (array!64234 (arr!30925 (Array (_ BitVec 32) ValueCell!11357)) (size!31440 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5308 0))(
  ( (LongMapFixedSize!5309 (defaultEntry!6006 Int) (mask!29663 (_ BitVec 32)) (extraKeys!5738 (_ BitVec 32)) (zeroValue!5842 V!37035) (minValue!5842 V!37035) (_size!2709 (_ BitVec 32)) (_keys!11149 array!64231) (_values!6029 array!64233) (_vacant!2709 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5308)

(declare-fun mapValue!37610 () ValueCell!11357)

(declare-fun mapRest!37610 () (Array (_ BitVec 32) ValueCell!11357))

(assert (=> mapNonEmpty!37610 (= (arr!30925 (_values!6029 thiss!1427)) (store mapRest!37610 mapKey!37610 mapValue!37610))))

(declare-fun res!686184 () Bool)

(declare-fun e!577777 () Bool)

(assert (=> start!89400 (=> (not res!686184) (not e!577777))))

(declare-fun valid!2013 (LongMapFixedSize!5308) Bool)

(assert (=> start!89400 (= res!686184 (valid!2013 thiss!1427))))

(assert (=> start!89400 e!577777))

(declare-fun e!577774 () Bool)

(assert (=> start!89400 e!577774))

(assert (=> start!89400 true))

(declare-fun b!1024839 () Bool)

(declare-fun e!577778 () Bool)

(declare-fun e!577775 () Bool)

(assert (=> b!1024839 (= e!577778 (and e!577775 mapRes!37610))))

(declare-fun condMapEmpty!37610 () Bool)

(declare-fun mapDefault!37610 () ValueCell!11357)

(assert (=> b!1024839 (= condMapEmpty!37610 (= (arr!30925 (_values!6029 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11357)) mapDefault!37610)))))

(declare-fun b!1024840 () Bool)

(declare-fun res!686179 () Bool)

(assert (=> b!1024840 (=> (not res!686179) (not e!577777))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024840 (= res!686179 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024841 () Bool)

(declare-fun e!577772 () Bool)

(assert (=> b!1024841 (= e!577777 e!577772)))

(declare-fun res!686185 () Bool)

(assert (=> b!1024841 (=> (not res!686185) (not e!577772))))

(declare-datatypes ((SeekEntryResult!9602 0))(
  ( (MissingZero!9602 (index!40779 (_ BitVec 32))) (Found!9602 (index!40780 (_ BitVec 32))) (Intermediate!9602 (undefined!10414 Bool) (index!40781 (_ BitVec 32)) (x!91133 (_ BitVec 32))) (Undefined!9602) (MissingVacant!9602 (index!40782 (_ BitVec 32))) )
))
(declare-fun lt!450567 () SeekEntryResult!9602)

(get-info :version)

(assert (=> b!1024841 (= res!686185 ((_ is Found!9602) lt!450567))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64231 (_ BitVec 32)) SeekEntryResult!9602)

(assert (=> b!1024841 (= lt!450567 (seekEntry!0 key!909 (_keys!11149 thiss!1427) (mask!29663 thiss!1427)))))

(declare-fun b!1024842 () Bool)

(declare-fun res!686182 () Bool)

(declare-fun e!577776 () Bool)

(assert (=> b!1024842 (=> res!686182 e!577776)))

(declare-datatypes ((List!21777 0))(
  ( (Nil!21774) (Cons!21773 (h!22971 (_ BitVec 64)) (t!30830 List!21777)) )
))
(declare-fun contains!5937 (List!21777 (_ BitVec 64)) Bool)

(assert (=> b!1024842 (= res!686182 (contains!5937 Nil!21774 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024843 () Bool)

(declare-fun tp_is_empty!24121 () Bool)

(assert (=> b!1024843 (= e!577775 tp_is_empty!24121)))

(declare-fun b!1024844 () Bool)

(declare-fun res!686183 () Bool)

(assert (=> b!1024844 (=> res!686183 e!577776)))

(assert (=> b!1024844 (= res!686183 (contains!5937 Nil!21774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024845 () Bool)

(assert (=> b!1024845 (= e!577776 true)))

(declare-fun lt!450568 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64231 (_ BitVec 32) List!21777) Bool)

(assert (=> b!1024845 (= lt!450568 (arrayNoDuplicates!0 (_keys!11149 thiss!1427) #b00000000000000000000000000000000 Nil!21774))))

(declare-fun b!1024846 () Bool)

(assert (=> b!1024846 (= e!577779 tp_is_empty!24121)))

(declare-fun b!1024847 () Bool)

(assert (=> b!1024847 (= e!577772 (not e!577776))))

(declare-fun res!686181 () Bool)

(assert (=> b!1024847 (=> res!686181 e!577776)))

(assert (=> b!1024847 (= res!686181 (or (bvsge (size!31439 (_keys!11149 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31439 (_keys!11149 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64231 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024847 (= (arrayCountValidKeys!0 (array!64232 (store (arr!30924 (_keys!11149 thiss!1427)) (index!40780 lt!450567) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31439 (_keys!11149 thiss!1427))) #b00000000000000000000000000000000 (size!31439 (_keys!11149 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11149 thiss!1427) #b00000000000000000000000000000000 (size!31439 (_keys!11149 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33275 0))(
  ( (Unit!33276) )
))
(declare-fun lt!450566 () Unit!33275)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64231 (_ BitVec 32) (_ BitVec 64)) Unit!33275)

(assert (=> b!1024847 (= lt!450566 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11149 thiss!1427) (index!40780 lt!450567) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37610 () Bool)

(assert (=> mapIsEmpty!37610 mapRes!37610))

(declare-fun array_inv!23965 (array!64231) Bool)

(declare-fun array_inv!23966 (array!64233) Bool)

(assert (=> b!1024848 (= e!577774 (and tp!72249 tp_is_empty!24121 (array_inv!23965 (_keys!11149 thiss!1427)) (array_inv!23966 (_values!6029 thiss!1427)) e!577778))))

(declare-fun b!1024849 () Bool)

(declare-fun res!686180 () Bool)

(assert (=> b!1024849 (=> res!686180 e!577776)))

(declare-fun noDuplicate!1482 (List!21777) Bool)

(assert (=> b!1024849 (= res!686180 (not (noDuplicate!1482 Nil!21774)))))

(assert (= (and start!89400 res!686184) b!1024840))

(assert (= (and b!1024840 res!686179) b!1024841))

(assert (= (and b!1024841 res!686185) b!1024847))

(assert (= (and b!1024847 (not res!686181)) b!1024849))

(assert (= (and b!1024849 (not res!686180)) b!1024844))

(assert (= (and b!1024844 (not res!686183)) b!1024842))

(assert (= (and b!1024842 (not res!686182)) b!1024845))

(assert (= (and b!1024839 condMapEmpty!37610) mapIsEmpty!37610))

(assert (= (and b!1024839 (not condMapEmpty!37610)) mapNonEmpty!37610))

(assert (= (and mapNonEmpty!37610 ((_ is ValueCellFull!11357) mapValue!37610)) b!1024846))

(assert (= (and b!1024839 ((_ is ValueCellFull!11357) mapDefault!37610)) b!1024843))

(assert (= b!1024848 b!1024839))

(assert (= start!89400 b!1024848))

(declare-fun m!942599 () Bool)

(assert (=> b!1024849 m!942599))

(declare-fun m!942601 () Bool)

(assert (=> b!1024845 m!942601))

(declare-fun m!942603 () Bool)

(assert (=> b!1024847 m!942603))

(declare-fun m!942605 () Bool)

(assert (=> b!1024847 m!942605))

(declare-fun m!942607 () Bool)

(assert (=> b!1024847 m!942607))

(declare-fun m!942609 () Bool)

(assert (=> b!1024847 m!942609))

(declare-fun m!942611 () Bool)

(assert (=> b!1024841 m!942611))

(declare-fun m!942613 () Bool)

(assert (=> start!89400 m!942613))

(declare-fun m!942615 () Bool)

(assert (=> b!1024842 m!942615))

(declare-fun m!942617 () Bool)

(assert (=> b!1024844 m!942617))

(declare-fun m!942619 () Bool)

(assert (=> b!1024848 m!942619))

(declare-fun m!942621 () Bool)

(assert (=> b!1024848 m!942621))

(declare-fun m!942623 () Bool)

(assert (=> mapNonEmpty!37610 m!942623))

(check-sat (not start!89400) (not b!1024842) (not mapNonEmpty!37610) (not b!1024841) b_and!32621 (not b!1024849) (not b_next!20401) tp_is_empty!24121 (not b!1024844) (not b!1024848) (not b!1024845) (not b!1024847))
(check-sat b_and!32621 (not b_next!20401))
