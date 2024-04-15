; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89406 () Bool)

(assert start!89406)

(declare-fun b!1024944 () Bool)

(declare-fun b_free!20407 () Bool)

(declare-fun b_next!20407 () Bool)

(assert (=> b!1024944 (= b_free!20407 (not b_next!20407))))

(declare-fun tp!72266 () Bool)

(declare-fun b_and!32627 () Bool)

(assert (=> b!1024944 (= tp!72266 b_and!32627)))

(declare-fun b!1024938 () Bool)

(declare-fun e!577844 () Bool)

(assert (=> b!1024938 (= e!577844 true)))

(declare-fun lt!450594 () Bool)

(declare-datatypes ((V!37043 0))(
  ( (V!37044 (val!12114 Int)) )
))
(declare-datatypes ((ValueCell!11360 0))(
  ( (ValueCellFull!11360 (v!14682 V!37043)) (EmptyCell!11360) )
))
(declare-datatypes ((array!64243 0))(
  ( (array!64244 (arr!30930 (Array (_ BitVec 32) (_ BitVec 64))) (size!31445 (_ BitVec 32))) )
))
(declare-datatypes ((array!64245 0))(
  ( (array!64246 (arr!30931 (Array (_ BitVec 32) ValueCell!11360)) (size!31446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5314 0))(
  ( (LongMapFixedSize!5315 (defaultEntry!6009 Int) (mask!29668 (_ BitVec 32)) (extraKeys!5741 (_ BitVec 32)) (zeroValue!5845 V!37043) (minValue!5845 V!37043) (_size!2712 (_ BitVec 32)) (_keys!11152 array!64243) (_values!6032 array!64245) (_vacant!2712 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5314)

(declare-datatypes ((List!21779 0))(
  ( (Nil!21776) (Cons!21775 (h!22973 (_ BitVec 64)) (t!30832 List!21779)) )
))
(declare-fun arrayNoDuplicates!0 (array!64243 (_ BitVec 32) List!21779) Bool)

(assert (=> b!1024938 (= lt!450594 (arrayNoDuplicates!0 (_keys!11152 thiss!1427) #b00000000000000000000000000000000 Nil!21776))))

(declare-fun b!1024939 () Bool)

(declare-fun res!686243 () Bool)

(declare-fun e!577851 () Bool)

(assert (=> b!1024939 (=> (not res!686243) (not e!577851))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024939 (= res!686243 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37619 () Bool)

(declare-fun mapRes!37619 () Bool)

(assert (=> mapIsEmpty!37619 mapRes!37619))

(declare-fun b!1024940 () Bool)

(declare-fun e!577847 () Bool)

(declare-fun tp_is_empty!24127 () Bool)

(assert (=> b!1024940 (= e!577847 tp_is_empty!24127)))

(declare-fun b!1024941 () Bool)

(declare-fun e!577849 () Bool)

(assert (=> b!1024941 (= e!577849 (and e!577847 mapRes!37619))))

(declare-fun condMapEmpty!37619 () Bool)

(declare-fun mapDefault!37619 () ValueCell!11360)

(assert (=> b!1024941 (= condMapEmpty!37619 (= (arr!30931 (_values!6032 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11360)) mapDefault!37619)))))

(declare-fun b!1024942 () Bool)

(declare-fun e!577850 () Bool)

(assert (=> b!1024942 (= e!577851 e!577850)))

(declare-fun res!686242 () Bool)

(assert (=> b!1024942 (=> (not res!686242) (not e!577850))))

(declare-datatypes ((SeekEntryResult!9604 0))(
  ( (MissingZero!9604 (index!40787 (_ BitVec 32))) (Found!9604 (index!40788 (_ BitVec 32))) (Intermediate!9604 (undefined!10416 Bool) (index!40789 (_ BitVec 32)) (x!91143 (_ BitVec 32))) (Undefined!9604) (MissingVacant!9604 (index!40790 (_ BitVec 32))) )
))
(declare-fun lt!450593 () SeekEntryResult!9604)

(get-info :version)

(assert (=> b!1024942 (= res!686242 ((_ is Found!9604) lt!450593))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64243 (_ BitVec 32)) SeekEntryResult!9604)

(assert (=> b!1024942 (= lt!450593 (seekEntry!0 key!909 (_keys!11152 thiss!1427) (mask!29668 thiss!1427)))))

(declare-fun b!1024943 () Bool)

(declare-fun res!686248 () Bool)

(assert (=> b!1024943 (=> res!686248 e!577844)))

(declare-fun contains!5939 (List!21779 (_ BitVec 64)) Bool)

(assert (=> b!1024943 (= res!686248 (contains!5939 Nil!21776 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!577845 () Bool)

(declare-fun array_inv!23971 (array!64243) Bool)

(declare-fun array_inv!23972 (array!64245) Bool)

(assert (=> b!1024944 (= e!577845 (and tp!72266 tp_is_empty!24127 (array_inv!23971 (_keys!11152 thiss!1427)) (array_inv!23972 (_values!6032 thiss!1427)) e!577849))))

(declare-fun mapNonEmpty!37619 () Bool)

(declare-fun tp!72267 () Bool)

(declare-fun e!577846 () Bool)

(assert (=> mapNonEmpty!37619 (= mapRes!37619 (and tp!72267 e!577846))))

(declare-fun mapValue!37619 () ValueCell!11360)

(declare-fun mapKey!37619 () (_ BitVec 32))

(declare-fun mapRest!37619 () (Array (_ BitVec 32) ValueCell!11360))

(assert (=> mapNonEmpty!37619 (= (arr!30931 (_values!6032 thiss!1427)) (store mapRest!37619 mapKey!37619 mapValue!37619))))

(declare-fun res!686244 () Bool)

(assert (=> start!89406 (=> (not res!686244) (not e!577851))))

(declare-fun valid!2016 (LongMapFixedSize!5314) Bool)

(assert (=> start!89406 (= res!686244 (valid!2016 thiss!1427))))

(assert (=> start!89406 e!577851))

(assert (=> start!89406 e!577845))

(assert (=> start!89406 true))

(declare-fun b!1024945 () Bool)

(assert (=> b!1024945 (= e!577850 (not e!577844))))

(declare-fun res!686245 () Bool)

(assert (=> b!1024945 (=> res!686245 e!577844)))

(assert (=> b!1024945 (= res!686245 (or (bvsge (size!31445 (_keys!11152 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31445 (_keys!11152 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64243 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024945 (= (arrayCountValidKeys!0 (array!64244 (store (arr!30930 (_keys!11152 thiss!1427)) (index!40788 lt!450593) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31445 (_keys!11152 thiss!1427))) #b00000000000000000000000000000000 (size!31445 (_keys!11152 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11152 thiss!1427) #b00000000000000000000000000000000 (size!31445 (_keys!11152 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33279 0))(
  ( (Unit!33280) )
))
(declare-fun lt!450595 () Unit!33279)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64243 (_ BitVec 32) (_ BitVec 64)) Unit!33279)

(assert (=> b!1024945 (= lt!450595 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11152 thiss!1427) (index!40788 lt!450593) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024946 () Bool)

(declare-fun res!686247 () Bool)

(assert (=> b!1024946 (=> res!686247 e!577844)))

(assert (=> b!1024946 (= res!686247 (contains!5939 Nil!21776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024947 () Bool)

(assert (=> b!1024947 (= e!577846 tp_is_empty!24127)))

(declare-fun b!1024948 () Bool)

(declare-fun res!686246 () Bool)

(assert (=> b!1024948 (=> res!686246 e!577844)))

(declare-fun noDuplicate!1484 (List!21779) Bool)

(assert (=> b!1024948 (= res!686246 (not (noDuplicate!1484 Nil!21776)))))

(assert (= (and start!89406 res!686244) b!1024939))

(assert (= (and b!1024939 res!686243) b!1024942))

(assert (= (and b!1024942 res!686242) b!1024945))

(assert (= (and b!1024945 (not res!686245)) b!1024948))

(assert (= (and b!1024948 (not res!686246)) b!1024946))

(assert (= (and b!1024946 (not res!686247)) b!1024943))

(assert (= (and b!1024943 (not res!686248)) b!1024938))

(assert (= (and b!1024941 condMapEmpty!37619) mapIsEmpty!37619))

(assert (= (and b!1024941 (not condMapEmpty!37619)) mapNonEmpty!37619))

(assert (= (and mapNonEmpty!37619 ((_ is ValueCellFull!11360) mapValue!37619)) b!1024947))

(assert (= (and b!1024941 ((_ is ValueCellFull!11360) mapDefault!37619)) b!1024940))

(assert (= b!1024944 b!1024941))

(assert (= start!89406 b!1024944))

(declare-fun m!942677 () Bool)

(assert (=> b!1024942 m!942677))

(declare-fun m!942679 () Bool)

(assert (=> mapNonEmpty!37619 m!942679))

(declare-fun m!942681 () Bool)

(assert (=> b!1024945 m!942681))

(declare-fun m!942683 () Bool)

(assert (=> b!1024945 m!942683))

(declare-fun m!942685 () Bool)

(assert (=> b!1024945 m!942685))

(declare-fun m!942687 () Bool)

(assert (=> b!1024945 m!942687))

(declare-fun m!942689 () Bool)

(assert (=> start!89406 m!942689))

(declare-fun m!942691 () Bool)

(assert (=> b!1024943 m!942691))

(declare-fun m!942693 () Bool)

(assert (=> b!1024946 m!942693))

(declare-fun m!942695 () Bool)

(assert (=> b!1024948 m!942695))

(declare-fun m!942697 () Bool)

(assert (=> b!1024944 m!942697))

(declare-fun m!942699 () Bool)

(assert (=> b!1024944 m!942699))

(declare-fun m!942701 () Bool)

(assert (=> b!1024938 m!942701))

(check-sat (not b!1024948) (not start!89406) (not b_next!20407) (not b!1024945) (not b!1024943) (not mapNonEmpty!37619) (not b!1024944) b_and!32627 (not b!1024938) tp_is_empty!24127 (not b!1024942) (not b!1024946))
(check-sat b_and!32627 (not b_next!20407))
