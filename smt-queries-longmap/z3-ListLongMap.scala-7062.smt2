; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89424 () Bool)

(assert start!89424)

(declare-fun b!1025241 () Bool)

(declare-fun b_free!20425 () Bool)

(declare-fun b_next!20425 () Bool)

(assert (=> b!1025241 (= b_free!20425 (not b_next!20425))))

(declare-fun tp!72321 () Bool)

(declare-fun b_and!32645 () Bool)

(assert (=> b!1025241 (= tp!72321 b_and!32645)))

(declare-fun res!686432 () Bool)

(declare-fun e!578066 () Bool)

(assert (=> start!89424 (=> (not res!686432) (not e!578066))))

(declare-datatypes ((V!37067 0))(
  ( (V!37068 (val!12123 Int)) )
))
(declare-datatypes ((ValueCell!11369 0))(
  ( (ValueCellFull!11369 (v!14691 V!37067)) (EmptyCell!11369) )
))
(declare-datatypes ((array!64279 0))(
  ( (array!64280 (arr!30948 (Array (_ BitVec 32) (_ BitVec 64))) (size!31463 (_ BitVec 32))) )
))
(declare-datatypes ((array!64281 0))(
  ( (array!64282 (arr!30949 (Array (_ BitVec 32) ValueCell!11369)) (size!31464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5332 0))(
  ( (LongMapFixedSize!5333 (defaultEntry!6018 Int) (mask!29683 (_ BitVec 32)) (extraKeys!5750 (_ BitVec 32)) (zeroValue!5854 V!37067) (minValue!5854 V!37067) (_size!2721 (_ BitVec 32)) (_keys!11161 array!64279) (_values!6041 array!64281) (_vacant!2721 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5332)

(declare-fun valid!2023 (LongMapFixedSize!5332) Bool)

(assert (=> start!89424 (= res!686432 (valid!2023 thiss!1427))))

(assert (=> start!89424 e!578066))

(declare-fun e!578061 () Bool)

(assert (=> start!89424 e!578061))

(assert (=> start!89424 true))

(declare-fun mapIsEmpty!37646 () Bool)

(declare-fun mapRes!37646 () Bool)

(assert (=> mapIsEmpty!37646 mapRes!37646))

(declare-fun b!1025235 () Bool)

(declare-fun res!686431 () Bool)

(declare-fun e!578064 () Bool)

(assert (=> b!1025235 (=> res!686431 e!578064)))

(declare-datatypes ((SeekEntryResult!9611 0))(
  ( (MissingZero!9611 (index!40815 (_ BitVec 32))) (Found!9611 (index!40816 (_ BitVec 32))) (Intermediate!9611 (undefined!10423 Bool) (index!40817 (_ BitVec 32)) (x!91174 (_ BitVec 32))) (Undefined!9611) (MissingVacant!9611 (index!40818 (_ BitVec 32))) )
))
(declare-fun lt!450718 () SeekEntryResult!9611)

(assert (=> b!1025235 (= res!686431 (or (not (= (size!31463 (_keys!11161 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29683 thiss!1427)))) (bvslt (index!40816 lt!450718) #b00000000000000000000000000000000) (bvsge (index!40816 lt!450718) (size!31463 (_keys!11161 thiss!1427)))))))

(declare-fun b!1025236 () Bool)

(declare-fun e!578060 () Bool)

(declare-fun tp_is_empty!24145 () Bool)

(assert (=> b!1025236 (= e!578060 tp_is_empty!24145)))

(declare-fun b!1025237 () Bool)

(declare-fun e!578062 () Bool)

(assert (=> b!1025237 (= e!578062 (not e!578064))))

(declare-fun res!686435 () Bool)

(assert (=> b!1025237 (=> res!686435 e!578064)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025237 (= res!686435 (not (validMask!0 (mask!29683 thiss!1427))))))

(declare-fun lt!450714 () array!64279)

(declare-datatypes ((List!21787 0))(
  ( (Nil!21784) (Cons!21783 (h!22981 (_ BitVec 64)) (t!30840 List!21787)) )
))
(declare-fun arrayNoDuplicates!0 (array!64279 (_ BitVec 32) List!21787) Bool)

(assert (=> b!1025237 (arrayNoDuplicates!0 lt!450714 #b00000000000000000000000000000000 Nil!21784)))

(declare-datatypes ((Unit!33291 0))(
  ( (Unit!33292) )
))
(declare-fun lt!450716 () Unit!33291)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21787) Unit!33291)

(assert (=> b!1025237 (= lt!450716 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11161 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40816 lt!450718) #b00000000000000000000000000000000 Nil!21784))))

(declare-fun arrayCountValidKeys!0 (array!64279 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025237 (= (arrayCountValidKeys!0 lt!450714 #b00000000000000000000000000000000 (size!31463 (_keys!11161 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11161 thiss!1427) #b00000000000000000000000000000000 (size!31463 (_keys!11161 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025237 (= lt!450714 (array!64280 (store (arr!30948 (_keys!11161 thiss!1427)) (index!40816 lt!450718) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31463 (_keys!11161 thiss!1427))))))

(declare-fun lt!450715 () Unit!33291)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64279 (_ BitVec 32) (_ BitVec 64)) Unit!33291)

(assert (=> b!1025237 (= lt!450715 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11161 thiss!1427) (index!40816 lt!450718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025238 () Bool)

(declare-fun e!578065 () Bool)

(assert (=> b!1025238 (= e!578065 (and e!578060 mapRes!37646))))

(declare-fun condMapEmpty!37646 () Bool)

(declare-fun mapDefault!37646 () ValueCell!11369)

(assert (=> b!1025238 (= condMapEmpty!37646 (= (arr!30949 (_values!6041 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11369)) mapDefault!37646)))))

(declare-fun b!1025239 () Bool)

(assert (=> b!1025239 (= e!578064 true)))

(declare-fun lt!450717 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64279 (_ BitVec 32)) Bool)

(assert (=> b!1025239 (= lt!450717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11161 thiss!1427) (mask!29683 thiss!1427)))))

(declare-fun b!1025240 () Bool)

(assert (=> b!1025240 (= e!578066 e!578062)))

(declare-fun res!686433 () Bool)

(assert (=> b!1025240 (=> (not res!686433) (not e!578062))))

(get-info :version)

(assert (=> b!1025240 (= res!686433 ((_ is Found!9611) lt!450718))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64279 (_ BitVec 32)) SeekEntryResult!9611)

(assert (=> b!1025240 (= lt!450718 (seekEntry!0 key!909 (_keys!11161 thiss!1427) (mask!29683 thiss!1427)))))

(declare-fun array_inv!23983 (array!64279) Bool)

(declare-fun array_inv!23984 (array!64281) Bool)

(assert (=> b!1025241 (= e!578061 (and tp!72321 tp_is_empty!24145 (array_inv!23983 (_keys!11161 thiss!1427)) (array_inv!23984 (_values!6041 thiss!1427)) e!578065))))

(declare-fun b!1025242 () Bool)

(declare-fun res!686434 () Bool)

(assert (=> b!1025242 (=> res!686434 e!578064)))

(assert (=> b!1025242 (= res!686434 (not (arrayNoDuplicates!0 (_keys!11161 thiss!1427) #b00000000000000000000000000000000 Nil!21784)))))

(declare-fun b!1025243 () Bool)

(declare-fun res!686436 () Bool)

(assert (=> b!1025243 (=> res!686436 e!578064)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025243 (= res!686436 (not (validKeyInArray!0 (select (arr!30948 (_keys!11161 thiss!1427)) (index!40816 lt!450718)))))))

(declare-fun mapNonEmpty!37646 () Bool)

(declare-fun tp!72320 () Bool)

(declare-fun e!578067 () Bool)

(assert (=> mapNonEmpty!37646 (= mapRes!37646 (and tp!72320 e!578067))))

(declare-fun mapRest!37646 () (Array (_ BitVec 32) ValueCell!11369))

(declare-fun mapKey!37646 () (_ BitVec 32))

(declare-fun mapValue!37646 () ValueCell!11369)

(assert (=> mapNonEmpty!37646 (= (arr!30949 (_values!6041 thiss!1427)) (store mapRest!37646 mapKey!37646 mapValue!37646))))

(declare-fun b!1025244 () Bool)

(declare-fun res!686437 () Bool)

(assert (=> b!1025244 (=> (not res!686437) (not e!578066))))

(assert (=> b!1025244 (= res!686437 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025245 () Bool)

(assert (=> b!1025245 (= e!578067 tp_is_empty!24145)))

(assert (= (and start!89424 res!686432) b!1025244))

(assert (= (and b!1025244 res!686437) b!1025240))

(assert (= (and b!1025240 res!686433) b!1025237))

(assert (= (and b!1025237 (not res!686435)) b!1025235))

(assert (= (and b!1025235 (not res!686431)) b!1025243))

(assert (= (and b!1025243 (not res!686436)) b!1025242))

(assert (= (and b!1025242 (not res!686434)) b!1025239))

(assert (= (and b!1025238 condMapEmpty!37646) mapIsEmpty!37646))

(assert (= (and b!1025238 (not condMapEmpty!37646)) mapNonEmpty!37646))

(assert (= (and mapNonEmpty!37646 ((_ is ValueCellFull!11369) mapValue!37646)) b!1025245))

(assert (= (and b!1025238 ((_ is ValueCellFull!11369) mapDefault!37646)) b!1025236))

(assert (= b!1025241 b!1025238))

(assert (= start!89424 b!1025241))

(declare-fun m!942947 () Bool)

(assert (=> b!1025239 m!942947))

(declare-fun m!942949 () Bool)

(assert (=> b!1025241 m!942949))

(declare-fun m!942951 () Bool)

(assert (=> b!1025241 m!942951))

(declare-fun m!942953 () Bool)

(assert (=> start!89424 m!942953))

(declare-fun m!942955 () Bool)

(assert (=> b!1025243 m!942955))

(assert (=> b!1025243 m!942955))

(declare-fun m!942957 () Bool)

(assert (=> b!1025243 m!942957))

(declare-fun m!942959 () Bool)

(assert (=> b!1025237 m!942959))

(declare-fun m!942961 () Bool)

(assert (=> b!1025237 m!942961))

(declare-fun m!942963 () Bool)

(assert (=> b!1025237 m!942963))

(declare-fun m!942965 () Bool)

(assert (=> b!1025237 m!942965))

(declare-fun m!942967 () Bool)

(assert (=> b!1025237 m!942967))

(declare-fun m!942969 () Bool)

(assert (=> b!1025237 m!942969))

(declare-fun m!942971 () Bool)

(assert (=> b!1025237 m!942971))

(declare-fun m!942973 () Bool)

(assert (=> mapNonEmpty!37646 m!942973))

(declare-fun m!942975 () Bool)

(assert (=> b!1025242 m!942975))

(declare-fun m!942977 () Bool)

(assert (=> b!1025240 m!942977))

(check-sat (not b!1025241) (not b!1025237) (not b!1025242) (not b_next!20425) (not b!1025239) tp_is_empty!24145 (not mapNonEmpty!37646) (not b!1025240) (not b!1025243) b_and!32645 (not start!89424))
(check-sat b_and!32645 (not b_next!20425))
