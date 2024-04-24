; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91814 () Bool)

(assert start!91814)

(declare-fun b!1044169 () Bool)

(declare-fun b_free!21073 () Bool)

(declare-fun b_next!21073 () Bool)

(assert (=> b!1044169 (= b_free!21073 (not b_next!21073))))

(declare-fun tp!74451 () Bool)

(declare-fun b_and!33615 () Bool)

(assert (=> b!1044169 (= tp!74451 b_and!33615)))

(declare-fun e!591635 () Bool)

(declare-fun e!591640 () Bool)

(declare-datatypes ((V!37931 0))(
  ( (V!37932 (val!12447 Int)) )
))
(declare-datatypes ((ValueCell!11693 0))(
  ( (ValueCellFull!11693 (v!15034 V!37931)) (EmptyCell!11693) )
))
(declare-datatypes ((array!65793 0))(
  ( (array!65794 (arr!31645 (Array (_ BitVec 32) (_ BitVec 64))) (size!32181 (_ BitVec 32))) )
))
(declare-datatypes ((array!65795 0))(
  ( (array!65796 (arr!31646 (Array (_ BitVec 32) ValueCell!11693)) (size!32182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5980 0))(
  ( (LongMapFixedSize!5981 (defaultEntry!6372 Int) (mask!30507 (_ BitVec 32)) (extraKeys!6100 (_ BitVec 32)) (zeroValue!6206 V!37931) (minValue!6206 V!37931) (_size!3045 (_ BitVec 32)) (_keys!11664 array!65793) (_values!6395 array!65795) (_vacant!3045 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5980)

(declare-fun tp_is_empty!24793 () Bool)

(declare-fun array_inv!24463 (array!65793) Bool)

(declare-fun array_inv!24464 (array!65795) Bool)

(assert (=> b!1044169 (= e!591640 (and tp!74451 tp_is_empty!24793 (array_inv!24463 (_keys!11664 thiss!1427)) (array_inv!24464 (_values!6395 thiss!1427)) e!591635))))

(declare-fun b!1044170 () Bool)

(declare-fun e!591641 () Bool)

(declare-fun mapRes!38804 () Bool)

(assert (=> b!1044170 (= e!591635 (and e!591641 mapRes!38804))))

(declare-fun condMapEmpty!38804 () Bool)

(declare-fun mapDefault!38804 () ValueCell!11693)

(assert (=> b!1044170 (= condMapEmpty!38804 (= (arr!31646 (_values!6395 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11693)) mapDefault!38804)))))

(declare-fun b!1044171 () Bool)

(declare-fun e!591642 () Bool)

(declare-fun e!591638 () Bool)

(assert (=> b!1044171 (= e!591642 (not e!591638))))

(declare-fun res!695337 () Bool)

(assert (=> b!1044171 (=> res!695337 e!591638)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044171 (= res!695337 (not (validMask!0 (mask!30507 thiss!1427))))))

(declare-fun lt!460170 () array!65793)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044171 (not (arrayContainsKey!0 lt!460170 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34069 0))(
  ( (Unit!34070) )
))
(declare-fun lt!460172 () Unit!34069)

(declare-datatypes ((SeekEntryResult!9778 0))(
  ( (MissingZero!9778 (index!41483 (_ BitVec 32))) (Found!9778 (index!41484 (_ BitVec 32))) (Intermediate!9778 (undefined!10590 Bool) (index!41485 (_ BitVec 32)) (x!93084 (_ BitVec 32))) (Undefined!9778) (MissingVacant!9778 (index!41486 (_ BitVec 32))) )
))
(declare-fun lt!460173 () SeekEntryResult!9778)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65793 (_ BitVec 32) (_ BitVec 64)) Unit!34069)

(assert (=> b!1044171 (= lt!460172 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11664 thiss!1427) (index!41484 lt!460173) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65793 (_ BitVec 32)) Bool)

(assert (=> b!1044171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460170 (mask!30507 thiss!1427))))

(declare-fun lt!460174 () Unit!34069)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65793 (_ BitVec 32) (_ BitVec 32)) Unit!34069)

(assert (=> b!1044171 (= lt!460174 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11664 thiss!1427) (index!41484 lt!460173) (mask!30507 thiss!1427)))))

(declare-datatypes ((List!21973 0))(
  ( (Nil!21970) (Cons!21969 (h!23186 (_ BitVec 64)) (t!31179 List!21973)) )
))
(declare-fun arrayNoDuplicates!0 (array!65793 (_ BitVec 32) List!21973) Bool)

(assert (=> b!1044171 (arrayNoDuplicates!0 lt!460170 #b00000000000000000000000000000000 Nil!21970)))

(declare-fun lt!460169 () Unit!34069)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65793 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21973) Unit!34069)

(assert (=> b!1044171 (= lt!460169 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11664 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41484 lt!460173) #b00000000000000000000000000000000 Nil!21970))))

(declare-fun arrayCountValidKeys!0 (array!65793 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044171 (= (arrayCountValidKeys!0 lt!460170 #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044171 (= lt!460170 (array!65794 (store (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11664 thiss!1427))))))

(declare-fun lt!460171 () Unit!34069)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65793 (_ BitVec 32) (_ BitVec 64)) Unit!34069)

(assert (=> b!1044171 (= lt!460171 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11664 thiss!1427) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044172 () Bool)

(declare-fun res!695333 () Bool)

(assert (=> b!1044172 (=> res!695333 e!591638)))

(assert (=> b!1044172 (= res!695333 (or (not (= (size!32182 (_values!6395 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30507 thiss!1427)))) (not (= (size!32181 (_keys!11664 thiss!1427)) (size!32182 (_values!6395 thiss!1427)))) (bvslt (mask!30507 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6100 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6100 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38804 () Bool)

(assert (=> mapIsEmpty!38804 mapRes!38804))

(declare-fun mapNonEmpty!38804 () Bool)

(declare-fun tp!74450 () Bool)

(declare-fun e!591637 () Bool)

(assert (=> mapNonEmpty!38804 (= mapRes!38804 (and tp!74450 e!591637))))

(declare-fun mapValue!38804 () ValueCell!11693)

(declare-fun mapKey!38804 () (_ BitVec 32))

(declare-fun mapRest!38804 () (Array (_ BitVec 32) ValueCell!11693))

(assert (=> mapNonEmpty!38804 (= (arr!31646 (_values!6395 thiss!1427)) (store mapRest!38804 mapKey!38804 mapValue!38804))))

(declare-fun b!1044173 () Bool)

(assert (=> b!1044173 (= e!591641 tp_is_empty!24793)))

(declare-fun res!695338 () Bool)

(declare-fun e!591639 () Bool)

(assert (=> start!91814 (=> (not res!695338) (not e!591639))))

(declare-fun valid!2253 (LongMapFixedSize!5980) Bool)

(assert (=> start!91814 (= res!695338 (valid!2253 thiss!1427))))

(assert (=> start!91814 e!591639))

(assert (=> start!91814 e!591640))

(assert (=> start!91814 true))

(declare-fun b!1044174 () Bool)

(assert (=> b!1044174 (= e!591639 e!591642)))

(declare-fun res!695334 () Bool)

(assert (=> b!1044174 (=> (not res!695334) (not e!591642))))

(get-info :version)

(assert (=> b!1044174 (= res!695334 ((_ is Found!9778) lt!460173))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65793 (_ BitVec 32)) SeekEntryResult!9778)

(assert (=> b!1044174 (= lt!460173 (seekEntry!0 key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(declare-fun b!1044175 () Bool)

(declare-fun res!695335 () Bool)

(assert (=> b!1044175 (=> res!695335 e!591638)))

(assert (=> b!1044175 (= res!695335 (or (bvslt (index!41484 lt!460173) #b00000000000000000000000000000000) (bvsge (index!41484 lt!460173) (size!32181 (_keys!11664 thiss!1427)))))))

(declare-fun b!1044176 () Bool)

(declare-fun res!695339 () Bool)

(assert (=> b!1044176 (=> res!695339 e!591638)))

(assert (=> b!1044176 (= res!695339 (not (arrayNoDuplicates!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 Nil!21970)))))

(declare-fun b!1044177 () Bool)

(declare-fun res!695332 () Bool)

(assert (=> b!1044177 (=> res!695332 e!591638)))

(assert (=> b!1044177 (= res!695332 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11664 thiss!1427) (mask!30507 thiss!1427))))))

(declare-fun b!1044178 () Bool)

(assert (=> b!1044178 (= e!591637 tp_is_empty!24793)))

(declare-fun b!1044179 () Bool)

(declare-fun res!695336 () Bool)

(assert (=> b!1044179 (=> (not res!695336) (not e!591639))))

(assert (=> b!1044179 (= res!695336 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044180 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044180 (= e!591638 (validKeyInArray!0 key!909))))

(assert (= (and start!91814 res!695338) b!1044179))

(assert (= (and b!1044179 res!695336) b!1044174))

(assert (= (and b!1044174 res!695334) b!1044171))

(assert (= (and b!1044171 (not res!695337)) b!1044172))

(assert (= (and b!1044172 (not res!695333)) b!1044177))

(assert (= (and b!1044177 (not res!695332)) b!1044176))

(assert (= (and b!1044176 (not res!695339)) b!1044175))

(assert (= (and b!1044175 (not res!695335)) b!1044180))

(assert (= (and b!1044170 condMapEmpty!38804) mapIsEmpty!38804))

(assert (= (and b!1044170 (not condMapEmpty!38804)) mapNonEmpty!38804))

(assert (= (and mapNonEmpty!38804 ((_ is ValueCellFull!11693) mapValue!38804)) b!1044178))

(assert (= (and b!1044170 ((_ is ValueCellFull!11693) mapDefault!38804)) b!1044173))

(assert (= b!1044169 b!1044170))

(assert (= start!91814 b!1044169))

(declare-fun m!963767 () Bool)

(assert (=> b!1044169 m!963767))

(declare-fun m!963769 () Bool)

(assert (=> b!1044169 m!963769))

(declare-fun m!963771 () Bool)

(assert (=> mapNonEmpty!38804 m!963771))

(declare-fun m!963773 () Bool)

(assert (=> b!1044176 m!963773))

(declare-fun m!963775 () Bool)

(assert (=> b!1044180 m!963775))

(declare-fun m!963777 () Bool)

(assert (=> b!1044174 m!963777))

(declare-fun m!963779 () Bool)

(assert (=> b!1044177 m!963779))

(declare-fun m!963781 () Bool)

(assert (=> b!1044171 m!963781))

(declare-fun m!963783 () Bool)

(assert (=> b!1044171 m!963783))

(declare-fun m!963785 () Bool)

(assert (=> b!1044171 m!963785))

(declare-fun m!963787 () Bool)

(assert (=> b!1044171 m!963787))

(declare-fun m!963789 () Bool)

(assert (=> b!1044171 m!963789))

(declare-fun m!963791 () Bool)

(assert (=> b!1044171 m!963791))

(declare-fun m!963793 () Bool)

(assert (=> b!1044171 m!963793))

(declare-fun m!963795 () Bool)

(assert (=> b!1044171 m!963795))

(declare-fun m!963797 () Bool)

(assert (=> b!1044171 m!963797))

(declare-fun m!963799 () Bool)

(assert (=> b!1044171 m!963799))

(declare-fun m!963801 () Bool)

(assert (=> b!1044171 m!963801))

(declare-fun m!963803 () Bool)

(assert (=> start!91814 m!963803))

(check-sat (not b!1044174) b_and!33615 (not b_next!21073) (not start!91814) (not b!1044177) (not mapNonEmpty!38804) (not b!1044171) (not b!1044176) tp_is_empty!24793 (not b!1044169) (not b!1044180))
(check-sat b_and!33615 (not b_next!21073))
(get-model)

(declare-fun d!126647 () Bool)

(assert (=> d!126647 (= (array_inv!24463 (_keys!11664 thiss!1427)) (bvsge (size!32181 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044169 d!126647))

(declare-fun d!126649 () Bool)

(assert (=> d!126649 (= (array_inv!24464 (_values!6395 thiss!1427)) (bvsge (size!32182 (_values!6395 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044169 d!126649))

(declare-fun b!1044265 () Bool)

(declare-fun c!106301 () Bool)

(declare-fun lt!460219 () (_ BitVec 64))

(assert (=> b!1044265 (= c!106301 (= lt!460219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591697 () SeekEntryResult!9778)

(declare-fun e!591699 () SeekEntryResult!9778)

(assert (=> b!1044265 (= e!591697 e!591699)))

(declare-fun b!1044266 () Bool)

(declare-fun lt!460222 () SeekEntryResult!9778)

(assert (=> b!1044266 (= e!591699 (ite ((_ is MissingVacant!9778) lt!460222) (MissingZero!9778 (index!41486 lt!460222)) lt!460222))))

(declare-fun lt!460221 () SeekEntryResult!9778)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65793 (_ BitVec 32)) SeekEntryResult!9778)

(assert (=> b!1044266 (= lt!460222 (seekKeyOrZeroReturnVacant!0 (x!93084 lt!460221) (index!41485 lt!460221) (index!41485 lt!460221) key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(declare-fun b!1044267 () Bool)

(assert (=> b!1044267 (= e!591699 (MissingZero!9778 (index!41485 lt!460221)))))

(declare-fun b!1044268 () Bool)

(declare-fun e!591698 () SeekEntryResult!9778)

(assert (=> b!1044268 (= e!591698 e!591697)))

(assert (=> b!1044268 (= lt!460219 (select (arr!31645 (_keys!11664 thiss!1427)) (index!41485 lt!460221)))))

(declare-fun c!106300 () Bool)

(assert (=> b!1044268 (= c!106300 (= lt!460219 key!909))))

(declare-fun d!126651 () Bool)

(declare-fun lt!460220 () SeekEntryResult!9778)

(assert (=> d!126651 (and (or ((_ is MissingVacant!9778) lt!460220) (not ((_ is Found!9778) lt!460220)) (and (bvsge (index!41484 lt!460220) #b00000000000000000000000000000000) (bvslt (index!41484 lt!460220) (size!32181 (_keys!11664 thiss!1427))))) (not ((_ is MissingVacant!9778) lt!460220)) (or (not ((_ is Found!9778) lt!460220)) (= (select (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460220)) key!909)))))

(assert (=> d!126651 (= lt!460220 e!591698)))

(declare-fun c!106299 () Bool)

(assert (=> d!126651 (= c!106299 (and ((_ is Intermediate!9778) lt!460221) (undefined!10590 lt!460221)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65793 (_ BitVec 32)) SeekEntryResult!9778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126651 (= lt!460221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30507 thiss!1427)) key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(assert (=> d!126651 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126651 (= (seekEntry!0 key!909 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)) lt!460220)))

(declare-fun b!1044269 () Bool)

(assert (=> b!1044269 (= e!591698 Undefined!9778)))

(declare-fun b!1044270 () Bool)

(assert (=> b!1044270 (= e!591697 (Found!9778 (index!41485 lt!460221)))))

(assert (= (and d!126651 c!106299) b!1044269))

(assert (= (and d!126651 (not c!106299)) b!1044268))

(assert (= (and b!1044268 c!106300) b!1044270))

(assert (= (and b!1044268 (not c!106300)) b!1044265))

(assert (= (and b!1044265 c!106301) b!1044267))

(assert (= (and b!1044265 (not c!106301)) b!1044266))

(declare-fun m!963881 () Bool)

(assert (=> b!1044266 m!963881))

(declare-fun m!963883 () Bool)

(assert (=> b!1044268 m!963883))

(declare-fun m!963885 () Bool)

(assert (=> d!126651 m!963885))

(declare-fun m!963887 () Bool)

(assert (=> d!126651 m!963887))

(assert (=> d!126651 m!963887))

(declare-fun m!963889 () Bool)

(assert (=> d!126651 m!963889))

(assert (=> d!126651 m!963783))

(assert (=> b!1044174 d!126651))

(declare-fun d!126653 () Bool)

(declare-fun res!695394 () Bool)

(declare-fun e!591702 () Bool)

(assert (=> d!126653 (=> (not res!695394) (not e!591702))))

(declare-fun simpleValid!444 (LongMapFixedSize!5980) Bool)

(assert (=> d!126653 (= res!695394 (simpleValid!444 thiss!1427))))

(assert (=> d!126653 (= (valid!2253 thiss!1427) e!591702)))

(declare-fun b!1044277 () Bool)

(declare-fun res!695395 () Bool)

(assert (=> b!1044277 (=> (not res!695395) (not e!591702))))

(assert (=> b!1044277 (= res!695395 (= (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) (_size!3045 thiss!1427)))))

(declare-fun b!1044278 () Bool)

(declare-fun res!695396 () Bool)

(assert (=> b!1044278 (=> (not res!695396) (not e!591702))))

(assert (=> b!1044278 (= res!695396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(declare-fun b!1044279 () Bool)

(assert (=> b!1044279 (= e!591702 (arrayNoDuplicates!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 Nil!21970))))

(assert (= (and d!126653 res!695394) b!1044277))

(assert (= (and b!1044277 res!695395) b!1044278))

(assert (= (and b!1044278 res!695396) b!1044279))

(declare-fun m!963891 () Bool)

(assert (=> d!126653 m!963891))

(assert (=> b!1044277 m!963801))

(assert (=> b!1044278 m!963779))

(assert (=> b!1044279 m!963773))

(assert (=> start!91814 d!126653))

(declare-fun bm!44265 () Bool)

(declare-fun call!44268 () (_ BitVec 32))

(assert (=> bm!44265 (= call!44268 (arrayCountValidKeys!0 lt!460170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32181 (_keys!11664 thiss!1427))))))

(declare-fun b!1044288 () Bool)

(declare-fun e!591707 () (_ BitVec 32))

(declare-fun e!591708 () (_ BitVec 32))

(assert (=> b!1044288 (= e!591707 e!591708)))

(declare-fun c!106307 () Bool)

(assert (=> b!1044288 (= c!106307 (validKeyInArray!0 (select (arr!31645 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun b!1044289 () Bool)

(assert (=> b!1044289 (= e!591708 call!44268)))

(declare-fun b!1044291 () Bool)

(assert (=> b!1044291 (= e!591707 #b00000000000000000000000000000000)))

(declare-fun b!1044290 () Bool)

(assert (=> b!1044290 (= e!591708 (bvadd #b00000000000000000000000000000001 call!44268))))

(declare-fun d!126655 () Bool)

(declare-fun lt!460225 () (_ BitVec 32))

(assert (=> d!126655 (and (bvsge lt!460225 #b00000000000000000000000000000000) (bvsle lt!460225 (bvsub (size!32181 lt!460170) #b00000000000000000000000000000000)))))

(assert (=> d!126655 (= lt!460225 e!591707)))

(declare-fun c!106306 () Bool)

(assert (=> d!126655 (= c!106306 (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))))))

(assert (=> d!126655 (and (bvsle #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32181 (_keys!11664 thiss!1427)) (size!32181 lt!460170)))))

(assert (=> d!126655 (= (arrayCountValidKeys!0 lt!460170 #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) lt!460225)))

(assert (= (and d!126655 c!106306) b!1044291))

(assert (= (and d!126655 (not c!106306)) b!1044288))

(assert (= (and b!1044288 c!106307) b!1044290))

(assert (= (and b!1044288 (not c!106307)) b!1044289))

(assert (= (or b!1044290 b!1044289) bm!44265))

(declare-fun m!963893 () Bool)

(assert (=> bm!44265 m!963893))

(declare-fun m!963895 () Bool)

(assert (=> b!1044288 m!963895))

(assert (=> b!1044288 m!963895))

(declare-fun m!963897 () Bool)

(assert (=> b!1044288 m!963897))

(assert (=> b!1044171 d!126655))

(declare-fun d!126657 () Bool)

(assert (=> d!126657 (= (validMask!0 (mask!30507 thiss!1427)) (and (or (= (mask!30507 thiss!1427) #b00000000000000000000000000000111) (= (mask!30507 thiss!1427) #b00000000000000000000000000001111) (= (mask!30507 thiss!1427) #b00000000000000000000000000011111) (= (mask!30507 thiss!1427) #b00000000000000000000000000111111) (= (mask!30507 thiss!1427) #b00000000000000000000000001111111) (= (mask!30507 thiss!1427) #b00000000000000000000000011111111) (= (mask!30507 thiss!1427) #b00000000000000000000000111111111) (= (mask!30507 thiss!1427) #b00000000000000000000001111111111) (= (mask!30507 thiss!1427) #b00000000000000000000011111111111) (= (mask!30507 thiss!1427) #b00000000000000000000111111111111) (= (mask!30507 thiss!1427) #b00000000000000000001111111111111) (= (mask!30507 thiss!1427) #b00000000000000000011111111111111) (= (mask!30507 thiss!1427) #b00000000000000000111111111111111) (= (mask!30507 thiss!1427) #b00000000000000001111111111111111) (= (mask!30507 thiss!1427) #b00000000000000011111111111111111) (= (mask!30507 thiss!1427) #b00000000000000111111111111111111) (= (mask!30507 thiss!1427) #b00000000000001111111111111111111) (= (mask!30507 thiss!1427) #b00000000000011111111111111111111) (= (mask!30507 thiss!1427) #b00000000000111111111111111111111) (= (mask!30507 thiss!1427) #b00000000001111111111111111111111) (= (mask!30507 thiss!1427) #b00000000011111111111111111111111) (= (mask!30507 thiss!1427) #b00000000111111111111111111111111) (= (mask!30507 thiss!1427) #b00000001111111111111111111111111) (= (mask!30507 thiss!1427) #b00000011111111111111111111111111) (= (mask!30507 thiss!1427) #b00000111111111111111111111111111) (= (mask!30507 thiss!1427) #b00001111111111111111111111111111) (= (mask!30507 thiss!1427) #b00011111111111111111111111111111) (= (mask!30507 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30507 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1044171 d!126657))

(declare-fun b!1044303 () Bool)

(declare-fun e!591714 () Bool)

(assert (=> b!1044303 (= e!591714 (= (arrayCountValidKeys!0 (array!65794 (store (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11664 thiss!1427))) #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1044300 () Bool)

(declare-fun res!695406 () Bool)

(declare-fun e!591713 () Bool)

(assert (=> b!1044300 (=> (not res!695406) (not e!591713))))

(assert (=> b!1044300 (= res!695406 (validKeyInArray!0 (select (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460173))))))

(declare-fun b!1044301 () Bool)

(declare-fun res!695408 () Bool)

(assert (=> b!1044301 (=> (not res!695408) (not e!591713))))

(assert (=> b!1044301 (= res!695408 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044302 () Bool)

(assert (=> b!1044302 (= e!591713 (bvslt (size!32181 (_keys!11664 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126659 () Bool)

(assert (=> d!126659 e!591714))

(declare-fun res!695407 () Bool)

(assert (=> d!126659 (=> (not res!695407) (not e!591714))))

(assert (=> d!126659 (= res!695407 (and (bvsge (index!41484 lt!460173) #b00000000000000000000000000000000) (bvslt (index!41484 lt!460173) (size!32181 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460228 () Unit!34069)

(declare-fun choose!82 (array!65793 (_ BitVec 32) (_ BitVec 64)) Unit!34069)

(assert (=> d!126659 (= lt!460228 (choose!82 (_keys!11664 thiss!1427) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126659 e!591713))

(declare-fun res!695405 () Bool)

(assert (=> d!126659 (=> (not res!695405) (not e!591713))))

(assert (=> d!126659 (= res!695405 (and (bvsge (index!41484 lt!460173) #b00000000000000000000000000000000) (bvslt (index!41484 lt!460173) (size!32181 (_keys!11664 thiss!1427)))))))

(assert (=> d!126659 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11664 thiss!1427) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460228)))

(assert (= (and d!126659 res!695405) b!1044300))

(assert (= (and b!1044300 res!695406) b!1044301))

(assert (= (and b!1044301 res!695408) b!1044302))

(assert (= (and d!126659 res!695407) b!1044303))

(assert (=> b!1044303 m!963787))

(declare-fun m!963899 () Bool)

(assert (=> b!1044303 m!963899))

(assert (=> b!1044303 m!963801))

(declare-fun m!963901 () Bool)

(assert (=> b!1044300 m!963901))

(assert (=> b!1044300 m!963901))

(declare-fun m!963903 () Bool)

(assert (=> b!1044300 m!963903))

(declare-fun m!963905 () Bool)

(assert (=> b!1044301 m!963905))

(declare-fun m!963907 () Bool)

(assert (=> d!126659 m!963907))

(assert (=> b!1044171 d!126659))

(declare-fun b!1044312 () Bool)

(declare-fun e!591721 () Bool)

(declare-fun e!591722 () Bool)

(assert (=> b!1044312 (= e!591721 e!591722)))

(declare-fun c!106310 () Bool)

(assert (=> b!1044312 (= c!106310 (validKeyInArray!0 (select (arr!31645 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun bm!44268 () Bool)

(declare-fun call!44271 () Bool)

(assert (=> bm!44268 (= call!44271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460170 (mask!30507 thiss!1427)))))

(declare-fun b!1044314 () Bool)

(assert (=> b!1044314 (= e!591722 call!44271)))

(declare-fun b!1044315 () Bool)

(declare-fun e!591723 () Bool)

(assert (=> b!1044315 (= e!591723 call!44271)))

(declare-fun b!1044313 () Bool)

(assert (=> b!1044313 (= e!591722 e!591723)))

(declare-fun lt!460235 () (_ BitVec 64))

(assert (=> b!1044313 (= lt!460235 (select (arr!31645 lt!460170) #b00000000000000000000000000000000))))

(declare-fun lt!460236 () Unit!34069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65793 (_ BitVec 64) (_ BitVec 32)) Unit!34069)

(assert (=> b!1044313 (= lt!460236 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460170 lt!460235 #b00000000000000000000000000000000))))

(assert (=> b!1044313 (arrayContainsKey!0 lt!460170 lt!460235 #b00000000000000000000000000000000)))

(declare-fun lt!460237 () Unit!34069)

(assert (=> b!1044313 (= lt!460237 lt!460236)))

(declare-fun res!695414 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65793 (_ BitVec 32)) SeekEntryResult!9778)

(assert (=> b!1044313 (= res!695414 (= (seekEntryOrOpen!0 (select (arr!31645 lt!460170) #b00000000000000000000000000000000) lt!460170 (mask!30507 thiss!1427)) (Found!9778 #b00000000000000000000000000000000)))))

(assert (=> b!1044313 (=> (not res!695414) (not e!591723))))

(declare-fun d!126661 () Bool)

(declare-fun res!695413 () Bool)

(assert (=> d!126661 (=> res!695413 e!591721)))

(assert (=> d!126661 (= res!695413 (bvsge #b00000000000000000000000000000000 (size!32181 lt!460170)))))

(assert (=> d!126661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460170 (mask!30507 thiss!1427)) e!591721)))

(assert (= (and d!126661 (not res!695413)) b!1044312))

(assert (= (and b!1044312 c!106310) b!1044313))

(assert (= (and b!1044312 (not c!106310)) b!1044314))

(assert (= (and b!1044313 res!695414) b!1044315))

(assert (= (or b!1044315 b!1044314) bm!44268))

(assert (=> b!1044312 m!963895))

(assert (=> b!1044312 m!963895))

(assert (=> b!1044312 m!963897))

(declare-fun m!963909 () Bool)

(assert (=> bm!44268 m!963909))

(assert (=> b!1044313 m!963895))

(declare-fun m!963911 () Bool)

(assert (=> b!1044313 m!963911))

(declare-fun m!963913 () Bool)

(assert (=> b!1044313 m!963913))

(assert (=> b!1044313 m!963895))

(declare-fun m!963915 () Bool)

(assert (=> b!1044313 m!963915))

(assert (=> b!1044171 d!126661))

(declare-fun bm!44269 () Bool)

(declare-fun call!44272 () (_ BitVec 32))

(assert (=> bm!44269 (= call!44272 (arrayCountValidKeys!0 (_keys!11664 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32181 (_keys!11664 thiss!1427))))))

(declare-fun b!1044316 () Bool)

(declare-fun e!591724 () (_ BitVec 32))

(declare-fun e!591725 () (_ BitVec 32))

(assert (=> b!1044316 (= e!591724 e!591725)))

(declare-fun c!106312 () Bool)

(assert (=> b!1044316 (= c!106312 (validKeyInArray!0 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044317 () Bool)

(assert (=> b!1044317 (= e!591725 call!44272)))

(declare-fun b!1044319 () Bool)

(assert (=> b!1044319 (= e!591724 #b00000000000000000000000000000000)))

(declare-fun b!1044318 () Bool)

(assert (=> b!1044318 (= e!591725 (bvadd #b00000000000000000000000000000001 call!44272))))

(declare-fun d!126663 () Bool)

(declare-fun lt!460238 () (_ BitVec 32))

(assert (=> d!126663 (and (bvsge lt!460238 #b00000000000000000000000000000000) (bvsle lt!460238 (bvsub (size!32181 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126663 (= lt!460238 e!591724)))

(declare-fun c!106311 () Bool)

(assert (=> d!126663 (= c!106311 (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))))))

(assert (=> d!126663 (and (bvsle #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32181 (_keys!11664 thiss!1427)) (size!32181 (_keys!11664 thiss!1427))))))

(assert (=> d!126663 (= (arrayCountValidKeys!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))) lt!460238)))

(assert (= (and d!126663 c!106311) b!1044319))

(assert (= (and d!126663 (not c!106311)) b!1044316))

(assert (= (and b!1044316 c!106312) b!1044318))

(assert (= (and b!1044316 (not c!106312)) b!1044317))

(assert (= (or b!1044318 b!1044317) bm!44269))

(declare-fun m!963917 () Bool)

(assert (=> bm!44269 m!963917))

(declare-fun m!963919 () Bool)

(assert (=> b!1044316 m!963919))

(assert (=> b!1044316 m!963919))

(declare-fun m!963921 () Bool)

(assert (=> b!1044316 m!963921))

(assert (=> b!1044171 d!126663))

(declare-fun d!126665 () Bool)

(declare-fun res!695419 () Bool)

(declare-fun e!591730 () Bool)

(assert (=> d!126665 (=> res!695419 e!591730)))

(assert (=> d!126665 (= res!695419 (= (select (arr!31645 lt!460170) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126665 (= (arrayContainsKey!0 lt!460170 key!909 #b00000000000000000000000000000000) e!591730)))

(declare-fun b!1044324 () Bool)

(declare-fun e!591731 () Bool)

(assert (=> b!1044324 (= e!591730 e!591731)))

(declare-fun res!695420 () Bool)

(assert (=> b!1044324 (=> (not res!695420) (not e!591731))))

(assert (=> b!1044324 (= res!695420 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32181 lt!460170)))))

(declare-fun b!1044325 () Bool)

(assert (=> b!1044325 (= e!591731 (arrayContainsKey!0 lt!460170 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126665 (not res!695419)) b!1044324))

(assert (= (and b!1044324 res!695420) b!1044325))

(assert (=> d!126665 m!963895))

(declare-fun m!963923 () Bool)

(assert (=> b!1044325 m!963923))

(assert (=> b!1044171 d!126665))

(declare-fun d!126667 () Bool)

(declare-fun e!591734 () Bool)

(assert (=> d!126667 e!591734))

(declare-fun res!695423 () Bool)

(assert (=> d!126667 (=> (not res!695423) (not e!591734))))

(assert (=> d!126667 (= res!695423 (and (bvsge (index!41484 lt!460173) #b00000000000000000000000000000000) (bvslt (index!41484 lt!460173) (size!32181 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460241 () Unit!34069)

(declare-fun choose!53 (array!65793 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21973) Unit!34069)

(assert (=> d!126667 (= lt!460241 (choose!53 (_keys!11664 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41484 lt!460173) #b00000000000000000000000000000000 Nil!21970))))

(assert (=> d!126667 (bvslt (size!32181 (_keys!11664 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126667 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11664 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41484 lt!460173) #b00000000000000000000000000000000 Nil!21970) lt!460241)))

(declare-fun b!1044328 () Bool)

(assert (=> b!1044328 (= e!591734 (arrayNoDuplicates!0 (array!65794 (store (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11664 thiss!1427))) #b00000000000000000000000000000000 Nil!21970))))

(assert (= (and d!126667 res!695423) b!1044328))

(declare-fun m!963925 () Bool)

(assert (=> d!126667 m!963925))

(assert (=> b!1044328 m!963787))

(declare-fun m!963927 () Bool)

(assert (=> b!1044328 m!963927))

(assert (=> b!1044171 d!126667))

(declare-fun d!126669 () Bool)

(declare-fun e!591737 () Bool)

(assert (=> d!126669 e!591737))

(declare-fun res!695426 () Bool)

(assert (=> d!126669 (=> (not res!695426) (not e!591737))))

(assert (=> d!126669 (= res!695426 (bvslt (index!41484 lt!460173) (size!32181 (_keys!11664 thiss!1427))))))

(declare-fun lt!460244 () Unit!34069)

(declare-fun choose!121 (array!65793 (_ BitVec 32) (_ BitVec 64)) Unit!34069)

(assert (=> d!126669 (= lt!460244 (choose!121 (_keys!11664 thiss!1427) (index!41484 lt!460173) key!909))))

(assert (=> d!126669 (bvsge (index!41484 lt!460173) #b00000000000000000000000000000000)))

(assert (=> d!126669 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11664 thiss!1427) (index!41484 lt!460173) key!909) lt!460244)))

(declare-fun b!1044331 () Bool)

(assert (=> b!1044331 (= e!591737 (not (arrayContainsKey!0 (array!65794 (store (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11664 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126669 res!695426) b!1044331))

(declare-fun m!963929 () Bool)

(assert (=> d!126669 m!963929))

(assert (=> b!1044331 m!963787))

(declare-fun m!963931 () Bool)

(assert (=> b!1044331 m!963931))

(assert (=> b!1044171 d!126669))

(declare-fun d!126671 () Bool)

(declare-fun e!591740 () Bool)

(assert (=> d!126671 e!591740))

(declare-fun res!695429 () Bool)

(assert (=> d!126671 (=> (not res!695429) (not e!591740))))

(assert (=> d!126671 (= res!695429 (and (bvsge (index!41484 lt!460173) #b00000000000000000000000000000000) (bvslt (index!41484 lt!460173) (size!32181 (_keys!11664 thiss!1427)))))))

(declare-fun lt!460247 () Unit!34069)

(declare-fun choose!25 (array!65793 (_ BitVec 32) (_ BitVec 32)) Unit!34069)

(assert (=> d!126671 (= lt!460247 (choose!25 (_keys!11664 thiss!1427) (index!41484 lt!460173) (mask!30507 thiss!1427)))))

(assert (=> d!126671 (validMask!0 (mask!30507 thiss!1427))))

(assert (=> d!126671 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11664 thiss!1427) (index!41484 lt!460173) (mask!30507 thiss!1427)) lt!460247)))

(declare-fun b!1044334 () Bool)

(assert (=> b!1044334 (= e!591740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65794 (store (arr!31645 (_keys!11664 thiss!1427)) (index!41484 lt!460173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11664 thiss!1427))) (mask!30507 thiss!1427)))))

(assert (= (and d!126671 res!695429) b!1044334))

(declare-fun m!963933 () Bool)

(assert (=> d!126671 m!963933))

(assert (=> d!126671 m!963783))

(assert (=> b!1044334 m!963787))

(declare-fun m!963935 () Bool)

(assert (=> b!1044334 m!963935))

(assert (=> b!1044171 d!126671))

(declare-fun bm!44272 () Bool)

(declare-fun call!44275 () Bool)

(declare-fun c!106315 () Bool)

(assert (=> bm!44272 (= call!44275 (arrayNoDuplicates!0 lt!460170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106315 (Cons!21969 (select (arr!31645 lt!460170) #b00000000000000000000000000000000) Nil!21970) Nil!21970)))))

(declare-fun b!1044345 () Bool)

(declare-fun e!591751 () Bool)

(declare-fun contains!6086 (List!21973 (_ BitVec 64)) Bool)

(assert (=> b!1044345 (= e!591751 (contains!6086 Nil!21970 (select (arr!31645 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun b!1044346 () Bool)

(declare-fun e!591752 () Bool)

(assert (=> b!1044346 (= e!591752 call!44275)))

(declare-fun b!1044347 () Bool)

(assert (=> b!1044347 (= e!591752 call!44275)))

(declare-fun b!1044348 () Bool)

(declare-fun e!591749 () Bool)

(declare-fun e!591750 () Bool)

(assert (=> b!1044348 (= e!591749 e!591750)))

(declare-fun res!695438 () Bool)

(assert (=> b!1044348 (=> (not res!695438) (not e!591750))))

(assert (=> b!1044348 (= res!695438 (not e!591751))))

(declare-fun res!695437 () Bool)

(assert (=> b!1044348 (=> (not res!695437) (not e!591751))))

(assert (=> b!1044348 (= res!695437 (validKeyInArray!0 (select (arr!31645 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun b!1044349 () Bool)

(assert (=> b!1044349 (= e!591750 e!591752)))

(assert (=> b!1044349 (= c!106315 (validKeyInArray!0 (select (arr!31645 lt!460170) #b00000000000000000000000000000000)))))

(declare-fun d!126673 () Bool)

(declare-fun res!695436 () Bool)

(assert (=> d!126673 (=> res!695436 e!591749)))

(assert (=> d!126673 (= res!695436 (bvsge #b00000000000000000000000000000000 (size!32181 lt!460170)))))

(assert (=> d!126673 (= (arrayNoDuplicates!0 lt!460170 #b00000000000000000000000000000000 Nil!21970) e!591749)))

(assert (= (and d!126673 (not res!695436)) b!1044348))

(assert (= (and b!1044348 res!695437) b!1044345))

(assert (= (and b!1044348 res!695438) b!1044349))

(assert (= (and b!1044349 c!106315) b!1044347))

(assert (= (and b!1044349 (not c!106315)) b!1044346))

(assert (= (or b!1044347 b!1044346) bm!44272))

(assert (=> bm!44272 m!963895))

(declare-fun m!963937 () Bool)

(assert (=> bm!44272 m!963937))

(assert (=> b!1044345 m!963895))

(assert (=> b!1044345 m!963895))

(declare-fun m!963939 () Bool)

(assert (=> b!1044345 m!963939))

(assert (=> b!1044348 m!963895))

(assert (=> b!1044348 m!963895))

(assert (=> b!1044348 m!963897))

(assert (=> b!1044349 m!963895))

(assert (=> b!1044349 m!963895))

(assert (=> b!1044349 m!963897))

(assert (=> b!1044171 d!126673))

(declare-fun d!126675 () Bool)

(assert (=> d!126675 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044180 d!126675))

(declare-fun bm!44273 () Bool)

(declare-fun call!44276 () Bool)

(declare-fun c!106316 () Bool)

(assert (=> bm!44273 (= call!44276 (arrayNoDuplicates!0 (_keys!11664 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106316 (Cons!21969 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000) Nil!21970) Nil!21970)))))

(declare-fun b!1044350 () Bool)

(declare-fun e!591755 () Bool)

(assert (=> b!1044350 (= e!591755 (contains!6086 Nil!21970 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044351 () Bool)

(declare-fun e!591756 () Bool)

(assert (=> b!1044351 (= e!591756 call!44276)))

(declare-fun b!1044352 () Bool)

(assert (=> b!1044352 (= e!591756 call!44276)))

(declare-fun b!1044353 () Bool)

(declare-fun e!591753 () Bool)

(declare-fun e!591754 () Bool)

(assert (=> b!1044353 (= e!591753 e!591754)))

(declare-fun res!695441 () Bool)

(assert (=> b!1044353 (=> (not res!695441) (not e!591754))))

(assert (=> b!1044353 (= res!695441 (not e!591755))))

(declare-fun res!695440 () Bool)

(assert (=> b!1044353 (=> (not res!695440) (not e!591755))))

(assert (=> b!1044353 (= res!695440 (validKeyInArray!0 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044354 () Bool)

(assert (=> b!1044354 (= e!591754 e!591756)))

(assert (=> b!1044354 (= c!106316 (validKeyInArray!0 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126677 () Bool)

(declare-fun res!695439 () Bool)

(assert (=> d!126677 (=> res!695439 e!591753)))

(assert (=> d!126677 (= res!695439 (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))))))

(assert (=> d!126677 (= (arrayNoDuplicates!0 (_keys!11664 thiss!1427) #b00000000000000000000000000000000 Nil!21970) e!591753)))

(assert (= (and d!126677 (not res!695439)) b!1044353))

(assert (= (and b!1044353 res!695440) b!1044350))

(assert (= (and b!1044353 res!695441) b!1044354))

(assert (= (and b!1044354 c!106316) b!1044352))

(assert (= (and b!1044354 (not c!106316)) b!1044351))

(assert (= (or b!1044352 b!1044351) bm!44273))

(assert (=> bm!44273 m!963919))

(declare-fun m!963941 () Bool)

(assert (=> bm!44273 m!963941))

(assert (=> b!1044350 m!963919))

(assert (=> b!1044350 m!963919))

(declare-fun m!963943 () Bool)

(assert (=> b!1044350 m!963943))

(assert (=> b!1044353 m!963919))

(assert (=> b!1044353 m!963919))

(assert (=> b!1044353 m!963921))

(assert (=> b!1044354 m!963919))

(assert (=> b!1044354 m!963919))

(assert (=> b!1044354 m!963921))

(assert (=> b!1044176 d!126677))

(declare-fun b!1044355 () Bool)

(declare-fun e!591757 () Bool)

(declare-fun e!591758 () Bool)

(assert (=> b!1044355 (= e!591757 e!591758)))

(declare-fun c!106317 () Bool)

(assert (=> b!1044355 (= c!106317 (validKeyInArray!0 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44274 () Bool)

(declare-fun call!44277 () Bool)

(assert (=> bm!44274 (= call!44277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11664 thiss!1427) (mask!30507 thiss!1427)))))

(declare-fun b!1044357 () Bool)

(assert (=> b!1044357 (= e!591758 call!44277)))

(declare-fun b!1044358 () Bool)

(declare-fun e!591759 () Bool)

(assert (=> b!1044358 (= e!591759 call!44277)))

(declare-fun b!1044356 () Bool)

(assert (=> b!1044356 (= e!591758 e!591759)))

(declare-fun lt!460248 () (_ BitVec 64))

(assert (=> b!1044356 (= lt!460248 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460249 () Unit!34069)

(assert (=> b!1044356 (= lt!460249 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11664 thiss!1427) lt!460248 #b00000000000000000000000000000000))))

(assert (=> b!1044356 (arrayContainsKey!0 (_keys!11664 thiss!1427) lt!460248 #b00000000000000000000000000000000)))

(declare-fun lt!460250 () Unit!34069)

(assert (=> b!1044356 (= lt!460250 lt!460249)))

(declare-fun res!695443 () Bool)

(assert (=> b!1044356 (= res!695443 (= (seekEntryOrOpen!0 (select (arr!31645 (_keys!11664 thiss!1427)) #b00000000000000000000000000000000) (_keys!11664 thiss!1427) (mask!30507 thiss!1427)) (Found!9778 #b00000000000000000000000000000000)))))

(assert (=> b!1044356 (=> (not res!695443) (not e!591759))))

(declare-fun d!126679 () Bool)

(declare-fun res!695442 () Bool)

(assert (=> d!126679 (=> res!695442 e!591757)))

(assert (=> d!126679 (= res!695442 (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11664 thiss!1427))))))

(assert (=> d!126679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11664 thiss!1427) (mask!30507 thiss!1427)) e!591757)))

(assert (= (and d!126679 (not res!695442)) b!1044355))

(assert (= (and b!1044355 c!106317) b!1044356))

(assert (= (and b!1044355 (not c!106317)) b!1044357))

(assert (= (and b!1044356 res!695443) b!1044358))

(assert (= (or b!1044358 b!1044357) bm!44274))

(assert (=> b!1044355 m!963919))

(assert (=> b!1044355 m!963919))

(assert (=> b!1044355 m!963921))

(declare-fun m!963945 () Bool)

(assert (=> bm!44274 m!963945))

(assert (=> b!1044356 m!963919))

(declare-fun m!963947 () Bool)

(assert (=> b!1044356 m!963947))

(declare-fun m!963949 () Bool)

(assert (=> b!1044356 m!963949))

(assert (=> b!1044356 m!963919))

(declare-fun m!963951 () Bool)

(assert (=> b!1044356 m!963951))

(assert (=> b!1044177 d!126679))

(declare-fun mapNonEmpty!38813 () Bool)

(declare-fun mapRes!38813 () Bool)

(declare-fun tp!74466 () Bool)

(declare-fun e!591764 () Bool)

(assert (=> mapNonEmpty!38813 (= mapRes!38813 (and tp!74466 e!591764))))

(declare-fun mapRest!38813 () (Array (_ BitVec 32) ValueCell!11693))

(declare-fun mapKey!38813 () (_ BitVec 32))

(declare-fun mapValue!38813 () ValueCell!11693)

(assert (=> mapNonEmpty!38813 (= mapRest!38804 (store mapRest!38813 mapKey!38813 mapValue!38813))))

(declare-fun b!1044365 () Bool)

(assert (=> b!1044365 (= e!591764 tp_is_empty!24793)))

(declare-fun condMapEmpty!38813 () Bool)

(declare-fun mapDefault!38813 () ValueCell!11693)

(assert (=> mapNonEmpty!38804 (= condMapEmpty!38813 (= mapRest!38804 ((as const (Array (_ BitVec 32) ValueCell!11693)) mapDefault!38813)))))

(declare-fun e!591765 () Bool)

(assert (=> mapNonEmpty!38804 (= tp!74450 (and e!591765 mapRes!38813))))

(declare-fun b!1044366 () Bool)

(assert (=> b!1044366 (= e!591765 tp_is_empty!24793)))

(declare-fun mapIsEmpty!38813 () Bool)

(assert (=> mapIsEmpty!38813 mapRes!38813))

(assert (= (and mapNonEmpty!38804 condMapEmpty!38813) mapIsEmpty!38813))

(assert (= (and mapNonEmpty!38804 (not condMapEmpty!38813)) mapNonEmpty!38813))

(assert (= (and mapNonEmpty!38813 ((_ is ValueCellFull!11693) mapValue!38813)) b!1044365))

(assert (= (and mapNonEmpty!38804 ((_ is ValueCellFull!11693) mapDefault!38813)) b!1044366))

(declare-fun m!963953 () Bool)

(assert (=> mapNonEmpty!38813 m!963953))

(check-sat (not b!1044331) b_and!33615 (not b!1044312) (not d!126669) (not bm!44273) (not b!1044353) (not b!1044277) (not b!1044334) (not bm!44268) (not b!1044356) (not b!1044345) (not b!1044325) (not b!1044266) (not b!1044316) (not b!1044300) (not bm!44265) (not d!126651) (not d!126671) (not b!1044348) (not bm!44274) (not b!1044288) (not b!1044278) (not bm!44269) (not b!1044328) (not b_next!21073) (not b!1044350) (not b!1044301) (not b!1044303) (not b!1044279) (not b!1044349) (not bm!44272) (not b!1044355) (not mapNonEmpty!38813) tp_is_empty!24793 (not d!126659) (not b!1044354) (not d!126667) (not d!126653) (not b!1044313))
(check-sat b_and!33615 (not b_next!21073))
