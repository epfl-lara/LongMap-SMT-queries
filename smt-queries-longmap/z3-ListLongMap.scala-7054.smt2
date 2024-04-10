; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89380 () Bool)

(assert start!89380)

(declare-fun b!1024633 () Bool)

(declare-fun b_free!20379 () Bool)

(declare-fun b_next!20379 () Bool)

(assert (=> b!1024633 (= b_free!20379 (not b_next!20379))))

(declare-fun tp!72183 () Bool)

(declare-fun b_and!32625 () Bool)

(assert (=> b!1024633 (= tp!72183 b_and!32625)))

(declare-fun b!1024628 () Bool)

(declare-fun res!686015 () Bool)

(declare-fun e!577602 () Bool)

(assert (=> b!1024628 (=> (not res!686015) (not e!577602))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024628 (= res!686015 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024629 () Bool)

(declare-fun res!686017 () Bool)

(declare-fun e!577605 () Bool)

(assert (=> b!1024629 (=> res!686017 e!577605)))

(declare-datatypes ((List!21733 0))(
  ( (Nil!21730) (Cons!21729 (h!22927 (_ BitVec 64)) (t!30795 List!21733)) )
))
(declare-fun contains!5949 (List!21733 (_ BitVec 64)) Bool)

(assert (=> b!1024629 (= res!686017 (contains!5949 Nil!21730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37577 () Bool)

(declare-fun mapRes!37577 () Bool)

(declare-fun tp!72182 () Bool)

(declare-fun e!577601 () Bool)

(assert (=> mapNonEmpty!37577 (= mapRes!37577 (and tp!72182 e!577601))))

(declare-fun mapKey!37577 () (_ BitVec 32))

(declare-datatypes ((V!37005 0))(
  ( (V!37006 (val!12100 Int)) )
))
(declare-datatypes ((ValueCell!11346 0))(
  ( (ValueCellFull!11346 (v!14669 V!37005)) (EmptyCell!11346) )
))
(declare-fun mapRest!37577 () (Array (_ BitVec 32) ValueCell!11346))

(declare-datatypes ((array!64248 0))(
  ( (array!64249 (arr!30933 (Array (_ BitVec 32) (_ BitVec 64))) (size!31446 (_ BitVec 32))) )
))
(declare-datatypes ((array!64250 0))(
  ( (array!64251 (arr!30934 (Array (_ BitVec 32) ValueCell!11346)) (size!31447 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5286 0))(
  ( (LongMapFixedSize!5287 (defaultEntry!5995 Int) (mask!29649 (_ BitVec 32)) (extraKeys!5727 (_ BitVec 32)) (zeroValue!5831 V!37005) (minValue!5831 V!37005) (_size!2698 (_ BitVec 32)) (_keys!11142 array!64248) (_values!6018 array!64250) (_vacant!2698 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5286)

(declare-fun mapValue!37577 () ValueCell!11346)

(assert (=> mapNonEmpty!37577 (= (arr!30934 (_values!6018 thiss!1427)) (store mapRest!37577 mapKey!37577 mapValue!37577))))

(declare-fun mapIsEmpty!37577 () Bool)

(assert (=> mapIsEmpty!37577 mapRes!37577))

(declare-fun b!1024630 () Bool)

(declare-fun res!686016 () Bool)

(assert (=> b!1024630 (=> res!686016 e!577605)))

(assert (=> b!1024630 (= res!686016 (contains!5949 Nil!21730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024631 () Bool)

(declare-fun e!577603 () Bool)

(declare-fun tp_is_empty!24099 () Bool)

(assert (=> b!1024631 (= e!577603 tp_is_empty!24099)))

(declare-fun b!1024632 () Bool)

(declare-fun e!577599 () Bool)

(assert (=> b!1024632 (= e!577602 e!577599)))

(declare-fun res!686021 () Bool)

(assert (=> b!1024632 (=> (not res!686021) (not e!577599))))

(declare-datatypes ((SeekEntryResult!9599 0))(
  ( (MissingZero!9599 (index!40767 (_ BitVec 32))) (Found!9599 (index!40768 (_ BitVec 32))) (Intermediate!9599 (undefined!10411 Bool) (index!40769 (_ BitVec 32)) (x!91101 (_ BitVec 32))) (Undefined!9599) (MissingVacant!9599 (index!40770 (_ BitVec 32))) )
))
(declare-fun lt!450669 () SeekEntryResult!9599)

(get-info :version)

(assert (=> b!1024632 (= res!686021 ((_ is Found!9599) lt!450669))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64248 (_ BitVec 32)) SeekEntryResult!9599)

(assert (=> b!1024632 (= lt!450669 (seekEntry!0 key!909 (_keys!11142 thiss!1427) (mask!29649 thiss!1427)))))

(declare-fun e!577600 () Bool)

(declare-fun e!577606 () Bool)

(declare-fun array_inv!23961 (array!64248) Bool)

(declare-fun array_inv!23962 (array!64250) Bool)

(assert (=> b!1024633 (= e!577606 (and tp!72183 tp_is_empty!24099 (array_inv!23961 (_keys!11142 thiss!1427)) (array_inv!23962 (_values!6018 thiss!1427)) e!577600))))

(declare-fun b!1024634 () Bool)

(assert (=> b!1024634 (= e!577601 tp_is_empty!24099)))

(declare-fun b!1024635 () Bool)

(declare-fun res!686018 () Bool)

(assert (=> b!1024635 (=> res!686018 e!577605)))

(declare-fun noDuplicate!1465 (List!21733) Bool)

(assert (=> b!1024635 (= res!686018 (not (noDuplicate!1465 Nil!21730)))))

(declare-fun b!1024627 () Bool)

(assert (=> b!1024627 (= e!577599 (not e!577605))))

(declare-fun res!686020 () Bool)

(assert (=> b!1024627 (=> res!686020 e!577605)))

(assert (=> b!1024627 (= res!686020 (or (bvsge (size!31446 (_keys!11142 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31446 (_keys!11142 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64248 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024627 (= (arrayCountValidKeys!0 (array!64249 (store (arr!30933 (_keys!11142 thiss!1427)) (index!40768 lt!450669) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31446 (_keys!11142 thiss!1427))) #b00000000000000000000000000000000 (size!31446 (_keys!11142 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11142 thiss!1427) #b00000000000000000000000000000000 (size!31446 (_keys!11142 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33357 0))(
  ( (Unit!33358) )
))
(declare-fun lt!450668 () Unit!33357)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64248 (_ BitVec 32) (_ BitVec 64)) Unit!33357)

(assert (=> b!1024627 (= lt!450668 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11142 thiss!1427) (index!40768 lt!450669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686019 () Bool)

(assert (=> start!89380 (=> (not res!686019) (not e!577602))))

(declare-fun valid!2012 (LongMapFixedSize!5286) Bool)

(assert (=> start!89380 (= res!686019 (valid!2012 thiss!1427))))

(assert (=> start!89380 e!577602))

(assert (=> start!89380 e!577606))

(assert (=> start!89380 true))

(declare-fun b!1024636 () Bool)

(assert (=> b!1024636 (= e!577605 true)))

(declare-fun lt!450667 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64248 (_ BitVec 32) List!21733) Bool)

(assert (=> b!1024636 (= lt!450667 (arrayNoDuplicates!0 (_keys!11142 thiss!1427) #b00000000000000000000000000000000 Nil!21730))))

(declare-fun b!1024637 () Bool)

(assert (=> b!1024637 (= e!577600 (and e!577603 mapRes!37577))))

(declare-fun condMapEmpty!37577 () Bool)

(declare-fun mapDefault!37577 () ValueCell!11346)

(assert (=> b!1024637 (= condMapEmpty!37577 (= (arr!30934 (_values!6018 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11346)) mapDefault!37577)))))

(assert (= (and start!89380 res!686019) b!1024628))

(assert (= (and b!1024628 res!686015) b!1024632))

(assert (= (and b!1024632 res!686021) b!1024627))

(assert (= (and b!1024627 (not res!686020)) b!1024635))

(assert (= (and b!1024635 (not res!686018)) b!1024629))

(assert (= (and b!1024629 (not res!686017)) b!1024630))

(assert (= (and b!1024630 (not res!686016)) b!1024636))

(assert (= (and b!1024637 condMapEmpty!37577) mapIsEmpty!37577))

(assert (= (and b!1024637 (not condMapEmpty!37577)) mapNonEmpty!37577))

(assert (= (and mapNonEmpty!37577 ((_ is ValueCellFull!11346) mapValue!37577)) b!1024634))

(assert (= (and b!1024637 ((_ is ValueCellFull!11346) mapDefault!37577)) b!1024631))

(assert (= b!1024633 b!1024637))

(assert (= start!89380 b!1024633))

(declare-fun m!942933 () Bool)

(assert (=> b!1024629 m!942933))

(declare-fun m!942935 () Bool)

(assert (=> b!1024632 m!942935))

(declare-fun m!942937 () Bool)

(assert (=> b!1024627 m!942937))

(declare-fun m!942939 () Bool)

(assert (=> b!1024627 m!942939))

(declare-fun m!942941 () Bool)

(assert (=> b!1024627 m!942941))

(declare-fun m!942943 () Bool)

(assert (=> b!1024627 m!942943))

(declare-fun m!942945 () Bool)

(assert (=> mapNonEmpty!37577 m!942945))

(declare-fun m!942947 () Bool)

(assert (=> start!89380 m!942947))

(declare-fun m!942949 () Bool)

(assert (=> b!1024635 m!942949))

(declare-fun m!942951 () Bool)

(assert (=> b!1024630 m!942951))

(declare-fun m!942953 () Bool)

(assert (=> b!1024633 m!942953))

(declare-fun m!942955 () Bool)

(assert (=> b!1024633 m!942955))

(declare-fun m!942957 () Bool)

(assert (=> b!1024636 m!942957))

(check-sat (not b!1024629) (not b!1024627) b_and!32625 (not b!1024633) (not b!1024632) (not start!89380) (not b!1024635) (not b_next!20379) (not mapNonEmpty!37577) tp_is_empty!24099 (not b!1024636) (not b!1024630))
(check-sat b_and!32625 (not b_next!20379))
