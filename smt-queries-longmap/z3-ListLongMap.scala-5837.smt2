; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75556 () Bool)

(assert start!75556)

(declare-fun b!888596 () Bool)

(declare-fun b_free!15523 () Bool)

(declare-fun b_next!15523 () Bool)

(assert (=> b!888596 (= b_free!15523 (not b_next!15523))))

(declare-fun tp!54511 () Bool)

(declare-fun b_and!25769 () Bool)

(assert (=> b!888596 (= tp!54511 b_and!25769)))

(declare-fun b!888592 () Bool)

(declare-fun e!494982 () Bool)

(declare-fun e!494977 () Bool)

(assert (=> b!888592 (= e!494982 e!494977)))

(declare-fun b!888593 () Bool)

(declare-fun e!494979 () Bool)

(assert (=> b!888593 (= e!494977 e!494979)))

(declare-fun b!888594 () Bool)

(declare-fun e!494980 () Bool)

(declare-fun tp_is_empty!17851 () Bool)

(assert (=> b!888594 (= e!494980 tp_is_empty!17851)))

(declare-fun mapIsEmpty!28303 () Bool)

(declare-fun mapRes!28303 () Bool)

(assert (=> mapIsEmpty!28303 mapRes!28303))

(declare-fun b!888595 () Bool)

(declare-fun e!494983 () Bool)

(assert (=> b!888595 (= e!494983 tp_is_empty!17851)))

(declare-fun res!602530 () Bool)

(declare-fun e!494981 () Bool)

(assert (=> start!75556 (=> (not res!602530) (not e!494981))))

(declare-datatypes ((V!28767 0))(
  ( (V!28768 (val!8976 Int)) )
))
(declare-datatypes ((array!51705 0))(
  ( (array!51706 (arr!24862 (Array (_ BitVec 32) (_ BitVec 64))) (size!25303 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8444 0))(
  ( (ValueCellFull!8444 (v!11435 V!28767)) (EmptyCell!8444) )
))
(declare-datatypes ((array!51707 0))(
  ( (array!51708 (arr!24863 (Array (_ BitVec 32) ValueCell!8444)) (size!25304 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3904 0))(
  ( (LongMapFixedSize!3905 (defaultEntry!5143 Int) (mask!25588 (_ BitVec 32)) (extraKeys!4837 (_ BitVec 32)) (zeroValue!4941 V!28767) (minValue!4941 V!28767) (_size!2007 (_ BitVec 32)) (_keys!9848 array!51705) (_values!5128 array!51707) (_vacant!2007 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1064 0))(
  ( (Cell!1065 (v!11436 LongMapFixedSize!3904)) )
))
(declare-datatypes ((LongMap!1064 0))(
  ( (LongMap!1065 (underlying!543 Cell!1064)) )
))
(declare-fun thiss!821 () LongMap!1064)

(declare-fun valid!1530 (LongMap!1064) Bool)

(assert (=> start!75556 (= res!602530 (valid!1530 thiss!821))))

(assert (=> start!75556 e!494981))

(assert (=> start!75556 e!494982))

(declare-fun e!494978 () Bool)

(declare-fun array_inv!19608 (array!51705) Bool)

(declare-fun array_inv!19609 (array!51707) Bool)

(assert (=> b!888596 (= e!494979 (and tp!54511 tp_is_empty!17851 (array_inv!19608 (_keys!9848 (v!11436 (underlying!543 thiss!821)))) (array_inv!19609 (_values!5128 (v!11436 (underlying!543 thiss!821)))) e!494978))))

(declare-fun b!888597 () Bool)

(declare-fun valid!1531 (LongMapFixedSize!3904) Bool)

(assert (=> b!888597 (= e!494981 (not (valid!1531 (v!11436 (underlying!543 thiss!821)))))))

(declare-fun mapNonEmpty!28303 () Bool)

(declare-fun tp!54510 () Bool)

(assert (=> mapNonEmpty!28303 (= mapRes!28303 (and tp!54510 e!494980))))

(declare-fun mapKey!28303 () (_ BitVec 32))

(declare-fun mapValue!28303 () ValueCell!8444)

(declare-fun mapRest!28303 () (Array (_ BitVec 32) ValueCell!8444))

(assert (=> mapNonEmpty!28303 (= (arr!24863 (_values!5128 (v!11436 (underlying!543 thiss!821)))) (store mapRest!28303 mapKey!28303 mapValue!28303))))

(declare-fun b!888598 () Bool)

(assert (=> b!888598 (= e!494978 (and e!494983 mapRes!28303))))

(declare-fun condMapEmpty!28303 () Bool)

(declare-fun mapDefault!28303 () ValueCell!8444)

(assert (=> b!888598 (= condMapEmpty!28303 (= (arr!24863 (_values!5128 (v!11436 (underlying!543 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8444)) mapDefault!28303)))))

(assert (= (and start!75556 res!602530) b!888597))

(assert (= (and b!888598 condMapEmpty!28303) mapIsEmpty!28303))

(assert (= (and b!888598 (not condMapEmpty!28303)) mapNonEmpty!28303))

(get-info :version)

(assert (= (and mapNonEmpty!28303 ((_ is ValueCellFull!8444) mapValue!28303)) b!888594))

(assert (= (and b!888598 ((_ is ValueCellFull!8444) mapDefault!28303)) b!888595))

(assert (= b!888596 b!888598))

(assert (= b!888593 b!888596))

(assert (= b!888592 b!888593))

(assert (= start!75556 b!888592))

(declare-fun m!828543 () Bool)

(assert (=> start!75556 m!828543))

(declare-fun m!828545 () Bool)

(assert (=> b!888596 m!828545))

(declare-fun m!828547 () Bool)

(assert (=> b!888596 m!828547))

(declare-fun m!828549 () Bool)

(assert (=> b!888597 m!828549))

(declare-fun m!828551 () Bool)

(assert (=> mapNonEmpty!28303 m!828551))

(check-sat (not start!75556) (not mapNonEmpty!28303) (not b_next!15523) b_and!25769 tp_is_empty!17851 (not b!888597) (not b!888596))
(check-sat b_and!25769 (not b_next!15523))
(get-model)

(declare-fun d!110283 () Bool)

(assert (=> d!110283 (= (valid!1530 thiss!821) (valid!1531 (v!11436 (underlying!543 thiss!821))))))

(declare-fun bs!24900 () Bool)

(assert (= bs!24900 d!110283))

(assert (=> bs!24900 m!828549))

(assert (=> start!75556 d!110283))

(declare-fun d!110285 () Bool)

(declare-fun res!602543 () Bool)

(declare-fun e!495035 () Bool)

(assert (=> d!110285 (=> (not res!602543) (not e!495035))))

(declare-fun simpleValid!288 (LongMapFixedSize!3904) Bool)

(assert (=> d!110285 (= res!602543 (simpleValid!288 (v!11436 (underlying!543 thiss!821))))))

(assert (=> d!110285 (= (valid!1531 (v!11436 (underlying!543 thiss!821))) e!495035)))

(declare-fun b!888647 () Bool)

(declare-fun res!602544 () Bool)

(assert (=> b!888647 (=> (not res!602544) (not e!495035))))

(declare-fun arrayCountValidKeys!0 (array!51705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888647 (= res!602544 (= (arrayCountValidKeys!0 (_keys!9848 (v!11436 (underlying!543 thiss!821))) #b00000000000000000000000000000000 (size!25303 (_keys!9848 (v!11436 (underlying!543 thiss!821))))) (_size!2007 (v!11436 (underlying!543 thiss!821)))))))

(declare-fun b!888648 () Bool)

(declare-fun res!602545 () Bool)

(assert (=> b!888648 (=> (not res!602545) (not e!495035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51705 (_ BitVec 32)) Bool)

(assert (=> b!888648 (= res!602545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9848 (v!11436 (underlying!543 thiss!821))) (mask!25588 (v!11436 (underlying!543 thiss!821)))))))

(declare-fun b!888649 () Bool)

(declare-datatypes ((List!17637 0))(
  ( (Nil!17634) (Cons!17633 (h!18770 (_ BitVec 64)) (t!24924 List!17637)) )
))
(declare-fun arrayNoDuplicates!0 (array!51705 (_ BitVec 32) List!17637) Bool)

(assert (=> b!888649 (= e!495035 (arrayNoDuplicates!0 (_keys!9848 (v!11436 (underlying!543 thiss!821))) #b00000000000000000000000000000000 Nil!17634))))

(assert (= (and d!110285 res!602543) b!888647))

(assert (= (and b!888647 res!602544) b!888648))

(assert (= (and b!888648 res!602545) b!888649))

(declare-fun m!828573 () Bool)

(assert (=> d!110285 m!828573))

(declare-fun m!828575 () Bool)

(assert (=> b!888647 m!828575))

(declare-fun m!828577 () Bool)

(assert (=> b!888648 m!828577))

(declare-fun m!828579 () Bool)

(assert (=> b!888649 m!828579))

(assert (=> b!888597 d!110285))

(declare-fun d!110287 () Bool)

(assert (=> d!110287 (= (array_inv!19608 (_keys!9848 (v!11436 (underlying!543 thiss!821)))) (bvsge (size!25303 (_keys!9848 (v!11436 (underlying!543 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!888596 d!110287))

(declare-fun d!110289 () Bool)

(assert (=> d!110289 (= (array_inv!19609 (_values!5128 (v!11436 (underlying!543 thiss!821)))) (bvsge (size!25304 (_values!5128 (v!11436 (underlying!543 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!888596 d!110289))

(declare-fun mapIsEmpty!28312 () Bool)

(declare-fun mapRes!28312 () Bool)

(assert (=> mapIsEmpty!28312 mapRes!28312))

(declare-fun condMapEmpty!28312 () Bool)

(declare-fun mapDefault!28312 () ValueCell!8444)

(assert (=> mapNonEmpty!28303 (= condMapEmpty!28312 (= mapRest!28303 ((as const (Array (_ BitVec 32) ValueCell!8444)) mapDefault!28312)))))

(declare-fun e!495040 () Bool)

(assert (=> mapNonEmpty!28303 (= tp!54510 (and e!495040 mapRes!28312))))

(declare-fun mapNonEmpty!28312 () Bool)

(declare-fun tp!54526 () Bool)

(declare-fun e!495041 () Bool)

(assert (=> mapNonEmpty!28312 (= mapRes!28312 (and tp!54526 e!495041))))

(declare-fun mapRest!28312 () (Array (_ BitVec 32) ValueCell!8444))

(declare-fun mapValue!28312 () ValueCell!8444)

(declare-fun mapKey!28312 () (_ BitVec 32))

(assert (=> mapNonEmpty!28312 (= mapRest!28303 (store mapRest!28312 mapKey!28312 mapValue!28312))))

(declare-fun b!888657 () Bool)

(assert (=> b!888657 (= e!495040 tp_is_empty!17851)))

(declare-fun b!888656 () Bool)

(assert (=> b!888656 (= e!495041 tp_is_empty!17851)))

(assert (= (and mapNonEmpty!28303 condMapEmpty!28312) mapIsEmpty!28312))

(assert (= (and mapNonEmpty!28303 (not condMapEmpty!28312)) mapNonEmpty!28312))

(assert (= (and mapNonEmpty!28312 ((_ is ValueCellFull!8444) mapValue!28312)) b!888656))

(assert (= (and mapNonEmpty!28303 ((_ is ValueCellFull!8444) mapDefault!28312)) b!888657))

(declare-fun m!828581 () Bool)

(assert (=> mapNonEmpty!28312 m!828581))

(check-sat (not d!110285) (not b_next!15523) (not b!888649) b_and!25769 (not d!110283) (not mapNonEmpty!28312) (not b!888648) (not b!888647) tp_is_empty!17851)
(check-sat b_and!25769 (not b_next!15523))
