; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80574 () Bool)

(assert start!80574)

(declare-fun b!945331 () Bool)

(declare-fun b_free!18049 () Bool)

(declare-fun b_next!18049 () Bool)

(assert (=> b!945331 (= b_free!18049 (not b_next!18049))))

(declare-fun tp!62658 () Bool)

(declare-fun b_and!29477 () Bool)

(assert (=> b!945331 (= tp!62658 b_and!29477)))

(declare-fun b!945322 () Bool)

(declare-fun res!634783 () Bool)

(declare-fun e!531675 () Bool)

(assert (=> b!945322 (=> (not res!634783) (not e!531675))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945322 (= res!634783 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945323 () Bool)

(declare-fun res!634781 () Bool)

(declare-fun e!531673 () Bool)

(assert (=> b!945323 (=> res!634781 e!531673)))

(declare-datatypes ((V!32375 0))(
  ( (V!32376 (val!10329 Int)) )
))
(declare-datatypes ((ValueCell!9797 0))(
  ( (ValueCellFull!9797 (v!12858 V!32375)) (EmptyCell!9797) )
))
(declare-datatypes ((array!57133 0))(
  ( (array!57134 (arr!27487 (Array (_ BitVec 32) ValueCell!9797)) (size!27954 (_ BitVec 32))) )
))
(declare-datatypes ((array!57135 0))(
  ( (array!57136 (arr!27488 (Array (_ BitVec 32) (_ BitVec 64))) (size!27955 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4744 0))(
  ( (LongMapFixedSize!4745 (defaultEntry!5667 Int) (mask!27360 (_ BitVec 32)) (extraKeys!5399 (_ BitVec 32)) (zeroValue!5503 V!32375) (minValue!5503 V!32375) (_size!2427 (_ BitVec 32)) (_keys!10573 array!57135) (_values!5690 array!57133) (_vacant!2427 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4744)

(assert (=> b!945323 (= res!634781 (not (= (size!27955 (_keys!10573 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27360 thiss!1141)))))))

(declare-fun b!945324 () Bool)

(declare-fun res!634786 () Bool)

(assert (=> b!945324 (=> res!634786 e!531673)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945324 (= res!634786 (not (validKeyInArray!0 key!756)))))

(declare-fun b!945325 () Bool)

(declare-fun res!634784 () Bool)

(assert (=> b!945325 (=> (not res!634784) (not e!531675))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9028 0))(
  ( (MissingZero!9028 (index!38483 (_ BitVec 32))) (Found!9028 (index!38484 (_ BitVec 32))) (Intermediate!9028 (undefined!9840 Bool) (index!38485 (_ BitVec 32)) (x!81093 (_ BitVec 32))) (Undefined!9028) (MissingVacant!9028 (index!38486 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57135 (_ BitVec 32)) SeekEntryResult!9028)

(assert (=> b!945325 (= res!634784 (not ((_ is Found!9028) (seekEntry!0 key!756 (_keys!10573 thiss!1141) (mask!27360 thiss!1141)))))))

(declare-fun res!634785 () Bool)

(assert (=> start!80574 (=> (not res!634785) (not e!531675))))

(declare-fun valid!1821 (LongMapFixedSize!4744) Bool)

(assert (=> start!80574 (= res!634785 (valid!1821 thiss!1141))))

(assert (=> start!80574 e!531675))

(declare-fun e!531674 () Bool)

(assert (=> start!80574 e!531674))

(assert (=> start!80574 true))

(declare-fun b!945326 () Bool)

(declare-fun e!531677 () Bool)

(declare-fun tp_is_empty!20557 () Bool)

(assert (=> b!945326 (= e!531677 tp_is_empty!20557)))

(declare-fun b!945327 () Bool)

(declare-fun e!531676 () Bool)

(assert (=> b!945327 (= e!531676 tp_is_empty!20557)))

(declare-fun mapIsEmpty!32661 () Bool)

(declare-fun mapRes!32661 () Bool)

(assert (=> mapIsEmpty!32661 mapRes!32661))

(declare-fun mapNonEmpty!32661 () Bool)

(declare-fun tp!62657 () Bool)

(assert (=> mapNonEmpty!32661 (= mapRes!32661 (and tp!62657 e!531676))))

(declare-fun mapKey!32661 () (_ BitVec 32))

(declare-fun mapRest!32661 () (Array (_ BitVec 32) ValueCell!9797))

(declare-fun mapValue!32661 () ValueCell!9797)

(assert (=> mapNonEmpty!32661 (= (arr!27487 (_values!5690 thiss!1141)) (store mapRest!32661 mapKey!32661 mapValue!32661))))

(declare-fun b!945328 () Bool)

(declare-fun res!634780 () Bool)

(assert (=> b!945328 (=> res!634780 e!531673)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57135 (_ BitVec 32)) Bool)

(assert (=> b!945328 (= res!634780 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10573 thiss!1141) (mask!27360 thiss!1141))))))

(declare-fun b!945329 () Bool)

(declare-fun e!531678 () Bool)

(assert (=> b!945329 (= e!531678 (and e!531677 mapRes!32661))))

(declare-fun condMapEmpty!32661 () Bool)

(declare-fun mapDefault!32661 () ValueCell!9797)

(assert (=> b!945329 (= condMapEmpty!32661 (= (arr!27487 (_values!5690 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9797)) mapDefault!32661)))))

(declare-fun b!945330 () Bool)

(assert (=> b!945330 (= e!531673 true)))

(declare-fun lt!425983 () SeekEntryResult!9028)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57135 (_ BitVec 32)) SeekEntryResult!9028)

(assert (=> b!945330 (= lt!425983 (seekEntryOrOpen!0 key!756 (_keys!10573 thiss!1141) (mask!27360 thiss!1141)))))

(declare-fun array_inv!21442 (array!57135) Bool)

(declare-fun array_inv!21443 (array!57133) Bool)

(assert (=> b!945331 (= e!531674 (and tp!62658 tp_is_empty!20557 (array_inv!21442 (_keys!10573 thiss!1141)) (array_inv!21443 (_values!5690 thiss!1141)) e!531678))))

(declare-fun b!945332 () Bool)

(assert (=> b!945332 (= e!531675 (not e!531673))))

(declare-fun res!634787 () Bool)

(assert (=> b!945332 (=> res!634787 e!531673)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945332 (= res!634787 (not (validMask!0 (mask!27360 thiss!1141))))))

(declare-fun lt!425984 () (_ BitVec 32))

(assert (=> b!945332 (arrayForallSeekEntryOrOpenFound!0 lt!425984 (_keys!10573 thiss!1141) (mask!27360 thiss!1141))))

(declare-datatypes ((Unit!31828 0))(
  ( (Unit!31829) )
))
(declare-fun lt!425986 () Unit!31828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31828)

(assert (=> b!945332 (= lt!425986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10573 thiss!1141) (mask!27360 thiss!1141) #b00000000000000000000000000000000 lt!425984))))

(declare-fun arrayScanForKey!0 (array!57135 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945332 (= lt!425984 (arrayScanForKey!0 (_keys!10573 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945332 (arrayContainsKey!0 (_keys!10573 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425985 () Unit!31828)

(declare-fun lemmaKeyInListMapIsInArray!305 (array!57135 array!57133 (_ BitVec 32) (_ BitVec 32) V!32375 V!32375 (_ BitVec 64) Int) Unit!31828)

(assert (=> b!945332 (= lt!425985 (lemmaKeyInListMapIsInArray!305 (_keys!10573 thiss!1141) (_values!5690 thiss!1141) (mask!27360 thiss!1141) (extraKeys!5399 thiss!1141) (zeroValue!5503 thiss!1141) (minValue!5503 thiss!1141) key!756 (defaultEntry!5667 thiss!1141)))))

(declare-fun b!945333 () Bool)

(declare-fun res!634782 () Bool)

(assert (=> b!945333 (=> (not res!634782) (not e!531675))))

(declare-datatypes ((tuple2!13458 0))(
  ( (tuple2!13459 (_1!6740 (_ BitVec 64)) (_2!6740 V!32375)) )
))
(declare-datatypes ((List!19258 0))(
  ( (Nil!19255) (Cons!19254 (h!20411 tuple2!13458) (t!27567 List!19258)) )
))
(declare-datatypes ((ListLongMap!12157 0))(
  ( (ListLongMap!12158 (toList!6094 List!19258)) )
))
(declare-fun contains!5177 (ListLongMap!12157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3328 (array!57135 array!57133 (_ BitVec 32) (_ BitVec 32) V!32375 V!32375 (_ BitVec 32) Int) ListLongMap!12157)

(assert (=> b!945333 (= res!634782 (contains!5177 (getCurrentListMap!3328 (_keys!10573 thiss!1141) (_values!5690 thiss!1141) (mask!27360 thiss!1141) (extraKeys!5399 thiss!1141) (zeroValue!5503 thiss!1141) (minValue!5503 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5667 thiss!1141)) key!756))))

(assert (= (and start!80574 res!634785) b!945322))

(assert (= (and b!945322 res!634783) b!945325))

(assert (= (and b!945325 res!634784) b!945333))

(assert (= (and b!945333 res!634782) b!945332))

(assert (= (and b!945332 (not res!634787)) b!945323))

(assert (= (and b!945323 (not res!634781)) b!945328))

(assert (= (and b!945328 (not res!634780)) b!945324))

(assert (= (and b!945324 (not res!634786)) b!945330))

(assert (= (and b!945329 condMapEmpty!32661) mapIsEmpty!32661))

(assert (= (and b!945329 (not condMapEmpty!32661)) mapNonEmpty!32661))

(assert (= (and mapNonEmpty!32661 ((_ is ValueCellFull!9797) mapValue!32661)) b!945327))

(assert (= (and b!945329 ((_ is ValueCellFull!9797) mapDefault!32661)) b!945326))

(assert (= b!945331 b!945329))

(assert (= start!80574 b!945331))

(declare-fun m!879715 () Bool)

(assert (=> b!945332 m!879715))

(declare-fun m!879717 () Bool)

(assert (=> b!945332 m!879717))

(declare-fun m!879719 () Bool)

(assert (=> b!945332 m!879719))

(declare-fun m!879721 () Bool)

(assert (=> b!945332 m!879721))

(declare-fun m!879723 () Bool)

(assert (=> b!945332 m!879723))

(declare-fun m!879725 () Bool)

(assert (=> b!945332 m!879725))

(declare-fun m!879727 () Bool)

(assert (=> b!945331 m!879727))

(declare-fun m!879729 () Bool)

(assert (=> b!945331 m!879729))

(declare-fun m!879731 () Bool)

(assert (=> mapNonEmpty!32661 m!879731))

(declare-fun m!879733 () Bool)

(assert (=> start!80574 m!879733))

(declare-fun m!879735 () Bool)

(assert (=> b!945330 m!879735))

(declare-fun m!879737 () Bool)

(assert (=> b!945328 m!879737))

(declare-fun m!879739 () Bool)

(assert (=> b!945324 m!879739))

(declare-fun m!879741 () Bool)

(assert (=> b!945333 m!879741))

(assert (=> b!945333 m!879741))

(declare-fun m!879743 () Bool)

(assert (=> b!945333 m!879743))

(declare-fun m!879745 () Bool)

(assert (=> b!945325 m!879745))

(check-sat (not mapNonEmpty!32661) b_and!29477 (not b!945330) (not b!945331) (not start!80574) (not b!945324) (not b!945328) tp_is_empty!20557 (not b!945333) (not b!945332) (not b_next!18049) (not b!945325))
(check-sat b_and!29477 (not b_next!18049))
