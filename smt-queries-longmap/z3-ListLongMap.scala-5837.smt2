; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75370 () Bool)

(assert start!75370)

(declare-fun b!887450 () Bool)

(declare-fun b_free!15523 () Bool)

(declare-fun b_next!15523 () Bool)

(assert (=> b!887450 (= b_free!15523 (not b_next!15523))))

(declare-fun tp!54510 () Bool)

(declare-fun b_and!25733 () Bool)

(assert (=> b!887450 (= tp!54510 b_and!25733)))

(declare-datatypes ((V!28767 0))(
  ( (V!28768 (val!8976 Int)) )
))
(declare-datatypes ((array!51649 0))(
  ( (array!51650 (arr!24839 (Array (_ BitVec 32) (_ BitVec 64))) (size!25281 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8444 0))(
  ( (ValueCellFull!8444 (v!11430 V!28767)) (EmptyCell!8444) )
))
(declare-datatypes ((array!51651 0))(
  ( (array!51652 (arr!24840 (Array (_ BitVec 32) ValueCell!8444)) (size!25282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3904 0))(
  ( (LongMapFixedSize!3905 (defaultEntry!5143 Int) (mask!25538 (_ BitVec 32)) (extraKeys!4837 (_ BitVec 32)) (zeroValue!4941 V!28767) (minValue!4941 V!28767) (_size!2007 (_ BitVec 32)) (_keys!9815 array!51649) (_values!5128 array!51651) (_vacant!2007 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1056 0))(
  ( (Cell!1057 (v!11431 LongMapFixedSize!3904)) )
))
(declare-datatypes ((LongMap!1056 0))(
  ( (LongMap!1057 (underlying!539 Cell!1056)) )
))
(declare-fun thiss!821 () LongMap!1056)

(declare-fun e!494254 () Bool)

(declare-fun e!494247 () Bool)

(declare-fun tp_is_empty!17851 () Bool)

(declare-fun array_inv!19598 (array!51649) Bool)

(declare-fun array_inv!19599 (array!51651) Bool)

(assert (=> b!887450 (= e!494247 (and tp!54510 tp_is_empty!17851 (array_inv!19598 (_keys!9815 (v!11431 (underlying!539 thiss!821)))) (array_inv!19599 (_values!5128 (v!11431 (underlying!539 thiss!821)))) e!494254))))

(declare-fun b!887451 () Bool)

(declare-fun e!494251 () Bool)

(assert (=> b!887451 (= e!494251 tp_is_empty!17851)))

(declare-fun b!887452 () Bool)

(declare-fun e!494248 () Bool)

(declare-fun mapRes!28303 () Bool)

(assert (=> b!887452 (= e!494254 (and e!494248 mapRes!28303))))

(declare-fun condMapEmpty!28303 () Bool)

(declare-fun mapDefault!28303 () ValueCell!8444)

(assert (=> b!887452 (= condMapEmpty!28303 (= (arr!24840 (_values!5128 (v!11431 (underlying!539 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8444)) mapDefault!28303)))))

(declare-fun b!887453 () Bool)

(assert (=> b!887453 (= e!494248 tp_is_empty!17851)))

(declare-fun mapNonEmpty!28303 () Bool)

(declare-fun tp!54511 () Bool)

(assert (=> mapNonEmpty!28303 (= mapRes!28303 (and tp!54511 e!494251))))

(declare-fun mapValue!28303 () ValueCell!8444)

(declare-fun mapKey!28303 () (_ BitVec 32))

(declare-fun mapRest!28303 () (Array (_ BitVec 32) ValueCell!8444))

(assert (=> mapNonEmpty!28303 (= (arr!24840 (_values!5128 (v!11431 (underlying!539 thiss!821)))) (store mapRest!28303 mapKey!28303 mapValue!28303))))

(declare-fun res!602076 () Bool)

(declare-fun e!494249 () Bool)

(assert (=> start!75370 (=> (not res!602076) (not e!494249))))

(declare-fun valid!1530 (LongMap!1056) Bool)

(assert (=> start!75370 (= res!602076 (valid!1530 thiss!821))))

(assert (=> start!75370 e!494249))

(declare-fun e!494250 () Bool)

(assert (=> start!75370 e!494250))

(declare-fun mapIsEmpty!28303 () Bool)

(assert (=> mapIsEmpty!28303 mapRes!28303))

(declare-fun b!887454 () Bool)

(declare-fun valid!1531 (LongMapFixedSize!3904) Bool)

(assert (=> b!887454 (= e!494249 (not (valid!1531 (v!11431 (underlying!539 thiss!821)))))))

(declare-fun b!887455 () Bool)

(declare-fun e!494252 () Bool)

(assert (=> b!887455 (= e!494250 e!494252)))

(declare-fun b!887456 () Bool)

(assert (=> b!887456 (= e!494252 e!494247)))

(assert (= (and start!75370 res!602076) b!887454))

(assert (= (and b!887452 condMapEmpty!28303) mapIsEmpty!28303))

(assert (= (and b!887452 (not condMapEmpty!28303)) mapNonEmpty!28303))

(get-info :version)

(assert (= (and mapNonEmpty!28303 ((_ is ValueCellFull!8444) mapValue!28303)) b!887451))

(assert (= (and b!887452 ((_ is ValueCellFull!8444) mapDefault!28303)) b!887453))

(assert (= b!887450 b!887452))

(assert (= b!887456 b!887450))

(assert (= b!887455 b!887456))

(assert (= start!75370 b!887455))

(declare-fun m!826491 () Bool)

(assert (=> b!887450 m!826491))

(declare-fun m!826493 () Bool)

(assert (=> b!887450 m!826493))

(declare-fun m!826495 () Bool)

(assert (=> mapNonEmpty!28303 m!826495))

(declare-fun m!826497 () Bool)

(assert (=> start!75370 m!826497))

(declare-fun m!826499 () Bool)

(assert (=> b!887454 m!826499))

(check-sat (not b_next!15523) (not b!887454) (not mapNonEmpty!28303) (not start!75370) tp_is_empty!17851 b_and!25733 (not b!887450))
(check-sat b_and!25733 (not b_next!15523))
(get-model)

(declare-fun d!109763 () Bool)

(assert (=> d!109763 (= (valid!1530 thiss!821) (valid!1531 (v!11431 (underlying!539 thiss!821))))))

(declare-fun bs!24854 () Bool)

(assert (= bs!24854 d!109763))

(assert (=> bs!24854 m!826499))

(assert (=> start!75370 d!109763))

(declare-fun d!109765 () Bool)

(declare-fun res!602089 () Bool)

(declare-fun e!494305 () Bool)

(assert (=> d!109765 (=> (not res!602089) (not e!494305))))

(declare-fun simpleValid!288 (LongMapFixedSize!3904) Bool)

(assert (=> d!109765 (= res!602089 (simpleValid!288 (v!11431 (underlying!539 thiss!821))))))

(assert (=> d!109765 (= (valid!1531 (v!11431 (underlying!539 thiss!821))) e!494305)))

(declare-fun b!887505 () Bool)

(declare-fun res!602090 () Bool)

(assert (=> b!887505 (=> (not res!602090) (not e!494305))))

(declare-fun arrayCountValidKeys!0 (array!51649 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887505 (= res!602090 (= (arrayCountValidKeys!0 (_keys!9815 (v!11431 (underlying!539 thiss!821))) #b00000000000000000000000000000000 (size!25281 (_keys!9815 (v!11431 (underlying!539 thiss!821))))) (_size!2007 (v!11431 (underlying!539 thiss!821)))))))

(declare-fun b!887506 () Bool)

(declare-fun res!602091 () Bool)

(assert (=> b!887506 (=> (not res!602091) (not e!494305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51649 (_ BitVec 32)) Bool)

(assert (=> b!887506 (= res!602091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9815 (v!11431 (underlying!539 thiss!821))) (mask!25538 (v!11431 (underlying!539 thiss!821)))))))

(declare-fun b!887507 () Bool)

(declare-datatypes ((List!17691 0))(
  ( (Nil!17688) (Cons!17687 (h!18818 (_ BitVec 64)) (t!24977 List!17691)) )
))
(declare-fun arrayNoDuplicates!0 (array!51649 (_ BitVec 32) List!17691) Bool)

(assert (=> b!887507 (= e!494305 (arrayNoDuplicates!0 (_keys!9815 (v!11431 (underlying!539 thiss!821))) #b00000000000000000000000000000000 Nil!17688))))

(assert (= (and d!109765 res!602089) b!887505))

(assert (= (and b!887505 res!602090) b!887506))

(assert (= (and b!887506 res!602091) b!887507))

(declare-fun m!826521 () Bool)

(assert (=> d!109765 m!826521))

(declare-fun m!826523 () Bool)

(assert (=> b!887505 m!826523))

(declare-fun m!826525 () Bool)

(assert (=> b!887506 m!826525))

(declare-fun m!826527 () Bool)

(assert (=> b!887507 m!826527))

(assert (=> b!887454 d!109765))

(declare-fun d!109767 () Bool)

(assert (=> d!109767 (= (array_inv!19598 (_keys!9815 (v!11431 (underlying!539 thiss!821)))) (bvsge (size!25281 (_keys!9815 (v!11431 (underlying!539 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887450 d!109767))

(declare-fun d!109769 () Bool)

(assert (=> d!109769 (= (array_inv!19599 (_values!5128 (v!11431 (underlying!539 thiss!821)))) (bvsge (size!25282 (_values!5128 (v!11431 (underlying!539 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887450 d!109769))

(declare-fun mapIsEmpty!28312 () Bool)

(declare-fun mapRes!28312 () Bool)

(assert (=> mapIsEmpty!28312 mapRes!28312))

(declare-fun b!887515 () Bool)

(declare-fun e!494311 () Bool)

(assert (=> b!887515 (= e!494311 tp_is_empty!17851)))

(declare-fun condMapEmpty!28312 () Bool)

(declare-fun mapDefault!28312 () ValueCell!8444)

(assert (=> mapNonEmpty!28303 (= condMapEmpty!28312 (= mapRest!28303 ((as const (Array (_ BitVec 32) ValueCell!8444)) mapDefault!28312)))))

(assert (=> mapNonEmpty!28303 (= tp!54511 (and e!494311 mapRes!28312))))

(declare-fun b!887514 () Bool)

(declare-fun e!494310 () Bool)

(assert (=> b!887514 (= e!494310 tp_is_empty!17851)))

(declare-fun mapNonEmpty!28312 () Bool)

(declare-fun tp!54526 () Bool)

(assert (=> mapNonEmpty!28312 (= mapRes!28312 (and tp!54526 e!494310))))

(declare-fun mapValue!28312 () ValueCell!8444)

(declare-fun mapKey!28312 () (_ BitVec 32))

(declare-fun mapRest!28312 () (Array (_ BitVec 32) ValueCell!8444))

(assert (=> mapNonEmpty!28312 (= mapRest!28303 (store mapRest!28312 mapKey!28312 mapValue!28312))))

(assert (= (and mapNonEmpty!28303 condMapEmpty!28312) mapIsEmpty!28312))

(assert (= (and mapNonEmpty!28303 (not condMapEmpty!28312)) mapNonEmpty!28312))

(assert (= (and mapNonEmpty!28312 ((_ is ValueCellFull!8444) mapValue!28312)) b!887514))

(assert (= (and mapNonEmpty!28303 ((_ is ValueCellFull!8444) mapDefault!28312)) b!887515))

(declare-fun m!826529 () Bool)

(assert (=> mapNonEmpty!28312 m!826529))

(check-sat (not b!887507) (not b_next!15523) (not mapNonEmpty!28312) (not d!109765) (not d!109763) b_and!25733 tp_is_empty!17851 (not b!887506) (not b!887505))
(check-sat b_and!25733 (not b_next!15523))
