; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89364 () Bool)

(assert start!89364)

(declare-fun b!1024247 () Bool)

(declare-fun b_free!20365 () Bool)

(declare-fun b_next!20365 () Bool)

(assert (=> b!1024247 (= b_free!20365 (not b_next!20365))))

(declare-fun tp!72141 () Bool)

(declare-fun b_and!32585 () Bool)

(assert (=> b!1024247 (= tp!72141 b_and!32585)))

(declare-fun mapNonEmpty!37556 () Bool)

(declare-fun mapRes!37556 () Bool)

(declare-fun tp!72140 () Bool)

(declare-fun e!577346 () Bool)

(assert (=> mapNonEmpty!37556 (= mapRes!37556 (and tp!72140 e!577346))))

(declare-fun mapKey!37556 () (_ BitVec 32))

(declare-datatypes ((V!36987 0))(
  ( (V!36988 (val!12093 Int)) )
))
(declare-datatypes ((ValueCell!11339 0))(
  ( (ValueCellFull!11339 (v!14661 V!36987)) (EmptyCell!11339) )
))
(declare-fun mapValue!37556 () ValueCell!11339)

(declare-fun mapRest!37556 () (Array (_ BitVec 32) ValueCell!11339))

(declare-datatypes ((array!64159 0))(
  ( (array!64160 (arr!30888 (Array (_ BitVec 32) (_ BitVec 64))) (size!31403 (_ BitVec 32))) )
))
(declare-datatypes ((array!64161 0))(
  ( (array!64162 (arr!30889 (Array (_ BitVec 32) ValueCell!11339)) (size!31404 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5272 0))(
  ( (LongMapFixedSize!5273 (defaultEntry!5988 Int) (mask!29633 (_ BitVec 32)) (extraKeys!5720 (_ BitVec 32)) (zeroValue!5824 V!36987) (minValue!5824 V!36987) (_size!2691 (_ BitVec 32)) (_keys!11131 array!64159) (_values!6011 array!64161) (_vacant!2691 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5272)

(assert (=> mapNonEmpty!37556 (= (arr!30889 (_values!6011 thiss!1427)) (store mapRest!37556 mapKey!37556 mapValue!37556))))

(declare-fun b!1024245 () Bool)

(declare-fun e!577344 () Bool)

(declare-fun e!577345 () Bool)

(assert (=> b!1024245 (= e!577344 e!577345)))

(declare-fun res!685805 () Bool)

(assert (=> b!1024245 (=> (not res!685805) (not e!577345))))

(declare-datatypes ((SeekEntryResult!9588 0))(
  ( (MissingZero!9588 (index!40723 (_ BitVec 32))) (Found!9588 (index!40724 (_ BitVec 32))) (Intermediate!9588 (undefined!10400 Bool) (index!40725 (_ BitVec 32)) (x!91071 (_ BitVec 32))) (Undefined!9588) (MissingVacant!9588 (index!40726 (_ BitVec 32))) )
))
(declare-fun lt!450405 () SeekEntryResult!9588)

(get-info :version)

(assert (=> b!1024245 (= res!685805 ((_ is Found!9588) lt!450405))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64159 (_ BitVec 32)) SeekEntryResult!9588)

(assert (=> b!1024245 (= lt!450405 (seekEntry!0 key!909 (_keys!11131 thiss!1427) (mask!29633 thiss!1427)))))

(declare-fun b!1024246 () Bool)

(declare-fun res!685806 () Bool)

(declare-fun e!577341 () Bool)

(assert (=> b!1024246 (=> res!685806 e!577341)))

(declare-datatypes ((List!21760 0))(
  ( (Nil!21757) (Cons!21756 (h!22954 (_ BitVec 64)) (t!30813 List!21760)) )
))
(declare-fun noDuplicate!1470 (List!21760) Bool)

(assert (=> b!1024246 (= res!685806 (not (noDuplicate!1470 Nil!21757)))))

(declare-fun res!685802 () Bool)

(assert (=> start!89364 (=> (not res!685802) (not e!577344))))

(declare-fun valid!2002 (LongMapFixedSize!5272) Bool)

(assert (=> start!89364 (= res!685802 (valid!2002 thiss!1427))))

(assert (=> start!89364 e!577344))

(declare-fun e!577342 () Bool)

(assert (=> start!89364 e!577342))

(assert (=> start!89364 true))

(declare-fun tp_is_empty!24085 () Bool)

(declare-fun e!577340 () Bool)

(declare-fun array_inv!23941 (array!64159) Bool)

(declare-fun array_inv!23942 (array!64161) Bool)

(assert (=> b!1024247 (= e!577342 (and tp!72141 tp_is_empty!24085 (array_inv!23941 (_keys!11131 thiss!1427)) (array_inv!23942 (_values!6011 thiss!1427)) e!577340))))

(declare-fun b!1024248 () Bool)

(assert (=> b!1024248 (= e!577345 (not e!577341))))

(declare-fun res!685807 () Bool)

(assert (=> b!1024248 (=> res!685807 e!577341)))

(assert (=> b!1024248 (= res!685807 (or (bvsge (size!31403 (_keys!11131 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31403 (_keys!11131 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64159 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024248 (= (arrayCountValidKeys!0 (array!64160 (store (arr!30888 (_keys!11131 thiss!1427)) (index!40724 lt!450405) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31403 (_keys!11131 thiss!1427))) #b00000000000000000000000000000000 (size!31403 (_keys!11131 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11131 thiss!1427) #b00000000000000000000000000000000 (size!31403 (_keys!11131 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33249 0))(
  ( (Unit!33250) )
))
(declare-fun lt!450404 () Unit!33249)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64159 (_ BitVec 32) (_ BitVec 64)) Unit!33249)

(assert (=> b!1024248 (= lt!450404 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11131 thiss!1427) (index!40724 lt!450405) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024249 () Bool)

(declare-fun e!577343 () Bool)

(assert (=> b!1024249 (= e!577340 (and e!577343 mapRes!37556))))

(declare-fun condMapEmpty!37556 () Bool)

(declare-fun mapDefault!37556 () ValueCell!11339)

(assert (=> b!1024249 (= condMapEmpty!37556 (= (arr!30889 (_values!6011 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11339)) mapDefault!37556)))))

(declare-fun b!1024250 () Bool)

(assert (=> b!1024250 (= e!577341 true)))

(declare-fun lt!450406 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64159 (_ BitVec 32) List!21760) Bool)

(assert (=> b!1024250 (= lt!450406 (arrayNoDuplicates!0 (_keys!11131 thiss!1427) #b00000000000000000000000000000000 Nil!21757))))

(declare-fun b!1024251 () Bool)

(assert (=> b!1024251 (= e!577343 tp_is_empty!24085)))

(declare-fun b!1024252 () Bool)

(declare-fun res!685801 () Bool)

(assert (=> b!1024252 (=> res!685801 e!577341)))

(declare-fun contains!5922 (List!21760 (_ BitVec 64)) Bool)

(assert (=> b!1024252 (= res!685801 (contains!5922 Nil!21757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024253 () Bool)

(assert (=> b!1024253 (= e!577346 tp_is_empty!24085)))

(declare-fun b!1024254 () Bool)

(declare-fun res!685804 () Bool)

(assert (=> b!1024254 (=> (not res!685804) (not e!577344))))

(assert (=> b!1024254 (= res!685804 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024255 () Bool)

(declare-fun res!685803 () Bool)

(assert (=> b!1024255 (=> res!685803 e!577341)))

(assert (=> b!1024255 (= res!685803 (contains!5922 Nil!21757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37556 () Bool)

(assert (=> mapIsEmpty!37556 mapRes!37556))

(assert (= (and start!89364 res!685802) b!1024254))

(assert (= (and b!1024254 res!685804) b!1024245))

(assert (= (and b!1024245 res!685805) b!1024248))

(assert (= (and b!1024248 (not res!685807)) b!1024246))

(assert (= (and b!1024246 (not res!685806)) b!1024255))

(assert (= (and b!1024255 (not res!685803)) b!1024252))

(assert (= (and b!1024252 (not res!685801)) b!1024250))

(assert (= (and b!1024249 condMapEmpty!37556) mapIsEmpty!37556))

(assert (= (and b!1024249 (not condMapEmpty!37556)) mapNonEmpty!37556))

(assert (= (and mapNonEmpty!37556 ((_ is ValueCellFull!11339) mapValue!37556)) b!1024253))

(assert (= (and b!1024249 ((_ is ValueCellFull!11339) mapDefault!37556)) b!1024251))

(assert (= b!1024247 b!1024249))

(assert (= start!89364 b!1024247))

(declare-fun m!942131 () Bool)

(assert (=> b!1024246 m!942131))

(declare-fun m!942133 () Bool)

(assert (=> b!1024247 m!942133))

(declare-fun m!942135 () Bool)

(assert (=> b!1024247 m!942135))

(declare-fun m!942137 () Bool)

(assert (=> b!1024255 m!942137))

(declare-fun m!942139 () Bool)

(assert (=> b!1024245 m!942139))

(declare-fun m!942141 () Bool)

(assert (=> mapNonEmpty!37556 m!942141))

(declare-fun m!942143 () Bool)

(assert (=> b!1024252 m!942143))

(declare-fun m!942145 () Bool)

(assert (=> start!89364 m!942145))

(declare-fun m!942147 () Bool)

(assert (=> b!1024248 m!942147))

(declare-fun m!942149 () Bool)

(assert (=> b!1024248 m!942149))

(declare-fun m!942151 () Bool)

(assert (=> b!1024248 m!942151))

(declare-fun m!942153 () Bool)

(assert (=> b!1024248 m!942153))

(declare-fun m!942155 () Bool)

(assert (=> b!1024250 m!942155))

(check-sat (not b_next!20365) (not b!1024250) (not start!89364) (not mapNonEmpty!37556) (not b!1024247) (not b!1024245) (not b!1024246) tp_is_empty!24085 (not b!1024255) (not b!1024252) b_and!32585 (not b!1024248))
(check-sat b_and!32585 (not b_next!20365))
