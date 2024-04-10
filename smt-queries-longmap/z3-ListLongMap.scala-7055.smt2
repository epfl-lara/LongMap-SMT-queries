; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89386 () Bool)

(assert start!89386)

(declare-fun b!1024735 () Bool)

(declare-fun b_free!20385 () Bool)

(declare-fun b_next!20385 () Bool)

(assert (=> b!1024735 (= b_free!20385 (not b_next!20385))))

(declare-fun tp!72201 () Bool)

(declare-fun b_and!32631 () Bool)

(assert (=> b!1024735 (= tp!72201 b_and!32631)))

(declare-fun mapIsEmpty!37586 () Bool)

(declare-fun mapRes!37586 () Bool)

(assert (=> mapIsEmpty!37586 mapRes!37586))

(declare-fun res!686080 () Bool)

(declare-fun e!577677 () Bool)

(assert (=> start!89386 (=> (not res!686080) (not e!577677))))

(declare-datatypes ((V!37013 0))(
  ( (V!37014 (val!12103 Int)) )
))
(declare-datatypes ((ValueCell!11349 0))(
  ( (ValueCellFull!11349 (v!14672 V!37013)) (EmptyCell!11349) )
))
(declare-datatypes ((array!64260 0))(
  ( (array!64261 (arr!30939 (Array (_ BitVec 32) (_ BitVec 64))) (size!31452 (_ BitVec 32))) )
))
(declare-datatypes ((array!64262 0))(
  ( (array!64263 (arr!30940 (Array (_ BitVec 32) ValueCell!11349)) (size!31453 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5292 0))(
  ( (LongMapFixedSize!5293 (defaultEntry!5998 Int) (mask!29654 (_ BitVec 32)) (extraKeys!5730 (_ BitVec 32)) (zeroValue!5834 V!37013) (minValue!5834 V!37013) (_size!2701 (_ BitVec 32)) (_keys!11145 array!64260) (_values!6021 array!64262) (_vacant!2701 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5292)

(declare-fun valid!2014 (LongMapFixedSize!5292) Bool)

(assert (=> start!89386 (= res!686080 (valid!2014 thiss!1427))))

(assert (=> start!89386 e!577677))

(declare-fun e!577676 () Bool)

(assert (=> start!89386 e!577676))

(assert (=> start!89386 true))

(declare-fun b!1024726 () Bool)

(declare-fun e!577673 () Bool)

(declare-fun tp_is_empty!24105 () Bool)

(assert (=> b!1024726 (= e!577673 tp_is_empty!24105)))

(declare-fun b!1024727 () Bool)

(declare-fun e!577678 () Bool)

(assert (=> b!1024727 (= e!577677 e!577678)))

(declare-fun res!686078 () Bool)

(assert (=> b!1024727 (=> (not res!686078) (not e!577678))))

(declare-datatypes ((SeekEntryResult!9602 0))(
  ( (MissingZero!9602 (index!40779 (_ BitVec 32))) (Found!9602 (index!40780 (_ BitVec 32))) (Intermediate!9602 (undefined!10414 Bool) (index!40781 (_ BitVec 32)) (x!91112 (_ BitVec 32))) (Undefined!9602) (MissingVacant!9602 (index!40782 (_ BitVec 32))) )
))
(declare-fun lt!450694 () SeekEntryResult!9602)

(get-info :version)

(assert (=> b!1024727 (= res!686078 ((_ is Found!9602) lt!450694))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64260 (_ BitVec 32)) SeekEntryResult!9602)

(assert (=> b!1024727 (= lt!450694 (seekEntry!0 key!909 (_keys!11145 thiss!1427) (mask!29654 thiss!1427)))))

(declare-fun mapNonEmpty!37586 () Bool)

(declare-fun tp!72200 () Bool)

(assert (=> mapNonEmpty!37586 (= mapRes!37586 (and tp!72200 e!577673))))

(declare-fun mapKey!37586 () (_ BitVec 32))

(declare-fun mapValue!37586 () ValueCell!11349)

(declare-fun mapRest!37586 () (Array (_ BitVec 32) ValueCell!11349))

(assert (=> mapNonEmpty!37586 (= (arr!30940 (_values!6021 thiss!1427)) (store mapRest!37586 mapKey!37586 mapValue!37586))))

(declare-fun b!1024728 () Bool)

(declare-fun e!577672 () Bool)

(assert (=> b!1024728 (= e!577678 (not e!577672))))

(declare-fun res!686083 () Bool)

(assert (=> b!1024728 (=> res!686083 e!577672)))

(assert (=> b!1024728 (= res!686083 (or (bvsge (size!31452 (_keys!11145 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31452 (_keys!11145 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64260 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024728 (= (arrayCountValidKeys!0 (array!64261 (store (arr!30939 (_keys!11145 thiss!1427)) (index!40780 lt!450694) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31452 (_keys!11145 thiss!1427))) #b00000000000000000000000000000000 (size!31452 (_keys!11145 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11145 thiss!1427) #b00000000000000000000000000000000 (size!31452 (_keys!11145 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33361 0))(
  ( (Unit!33362) )
))
(declare-fun lt!450695 () Unit!33361)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64260 (_ BitVec 32) (_ BitVec 64)) Unit!33361)

(assert (=> b!1024728 (= lt!450695 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11145 thiss!1427) (index!40780 lt!450694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024729 () Bool)

(assert (=> b!1024729 (= e!577672 true)))

(declare-fun lt!450696 () Bool)

(declare-datatypes ((List!21736 0))(
  ( (Nil!21733) (Cons!21732 (h!22930 (_ BitVec 64)) (t!30798 List!21736)) )
))
(declare-fun arrayNoDuplicates!0 (array!64260 (_ BitVec 32) List!21736) Bool)

(assert (=> b!1024729 (= lt!450696 (arrayNoDuplicates!0 (_keys!11145 thiss!1427) #b00000000000000000000000000000000 Nil!21733))))

(declare-fun b!1024730 () Bool)

(declare-fun res!686084 () Bool)

(assert (=> b!1024730 (=> res!686084 e!577672)))

(declare-fun contains!5952 (List!21736 (_ BitVec 64)) Bool)

(assert (=> b!1024730 (= res!686084 (contains!5952 Nil!21733 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024731 () Bool)

(declare-fun e!577674 () Bool)

(assert (=> b!1024731 (= e!577674 tp_is_empty!24105)))

(declare-fun b!1024732 () Bool)

(declare-fun res!686082 () Bool)

(assert (=> b!1024732 (=> (not res!686082) (not e!577677))))

(assert (=> b!1024732 (= res!686082 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024733 () Bool)

(declare-fun e!577671 () Bool)

(assert (=> b!1024733 (= e!577671 (and e!577674 mapRes!37586))))

(declare-fun condMapEmpty!37586 () Bool)

(declare-fun mapDefault!37586 () ValueCell!11349)

(assert (=> b!1024733 (= condMapEmpty!37586 (= (arr!30940 (_values!6021 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11349)) mapDefault!37586)))))

(declare-fun b!1024734 () Bool)

(declare-fun res!686079 () Bool)

(assert (=> b!1024734 (=> res!686079 e!577672)))

(declare-fun noDuplicate!1468 (List!21736) Bool)

(assert (=> b!1024734 (= res!686079 (not (noDuplicate!1468 Nil!21733)))))

(declare-fun array_inv!23965 (array!64260) Bool)

(declare-fun array_inv!23966 (array!64262) Bool)

(assert (=> b!1024735 (= e!577676 (and tp!72201 tp_is_empty!24105 (array_inv!23965 (_keys!11145 thiss!1427)) (array_inv!23966 (_values!6021 thiss!1427)) e!577671))))

(declare-fun b!1024736 () Bool)

(declare-fun res!686081 () Bool)

(assert (=> b!1024736 (=> res!686081 e!577672)))

(assert (=> b!1024736 (= res!686081 (contains!5952 Nil!21733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89386 res!686080) b!1024732))

(assert (= (and b!1024732 res!686082) b!1024727))

(assert (= (and b!1024727 res!686078) b!1024728))

(assert (= (and b!1024728 (not res!686083)) b!1024734))

(assert (= (and b!1024734 (not res!686079)) b!1024736))

(assert (= (and b!1024736 (not res!686081)) b!1024730))

(assert (= (and b!1024730 (not res!686084)) b!1024729))

(assert (= (and b!1024733 condMapEmpty!37586) mapIsEmpty!37586))

(assert (= (and b!1024733 (not condMapEmpty!37586)) mapNonEmpty!37586))

(assert (= (and mapNonEmpty!37586 ((_ is ValueCellFull!11349) mapValue!37586)) b!1024726))

(assert (= (and b!1024733 ((_ is ValueCellFull!11349) mapDefault!37586)) b!1024731))

(assert (= b!1024735 b!1024733))

(assert (= start!89386 b!1024735))

(declare-fun m!943011 () Bool)

(assert (=> b!1024729 m!943011))

(declare-fun m!943013 () Bool)

(assert (=> b!1024727 m!943013))

(declare-fun m!943015 () Bool)

(assert (=> start!89386 m!943015))

(declare-fun m!943017 () Bool)

(assert (=> b!1024735 m!943017))

(declare-fun m!943019 () Bool)

(assert (=> b!1024735 m!943019))

(declare-fun m!943021 () Bool)

(assert (=> b!1024736 m!943021))

(declare-fun m!943023 () Bool)

(assert (=> b!1024728 m!943023))

(declare-fun m!943025 () Bool)

(assert (=> b!1024728 m!943025))

(declare-fun m!943027 () Bool)

(assert (=> b!1024728 m!943027))

(declare-fun m!943029 () Bool)

(assert (=> b!1024728 m!943029))

(declare-fun m!943031 () Bool)

(assert (=> b!1024734 m!943031))

(declare-fun m!943033 () Bool)

(assert (=> b!1024730 m!943033))

(declare-fun m!943035 () Bool)

(assert (=> mapNonEmpty!37586 m!943035))

(check-sat (not b!1024727) (not b!1024728) (not mapNonEmpty!37586) (not b_next!20385) (not b!1024736) (not b!1024735) (not b!1024729) b_and!32631 (not start!89386) (not b!1024734) (not b!1024730) tp_is_empty!24105)
(check-sat b_and!32631 (not b_next!20385))
