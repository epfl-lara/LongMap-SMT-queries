; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15826 () Bool)

(assert start!15826)

(declare-fun b!157697 () Bool)

(declare-fun b_free!3453 () Bool)

(declare-fun b_next!3453 () Bool)

(assert (=> b!157697 (= b_free!3453 (not b_next!3453))))

(declare-fun tp!12895 () Bool)

(declare-fun b_and!9867 () Bool)

(assert (=> b!157697 (= tp!12895 b_and!9867)))

(declare-fun b!157694 () Bool)

(declare-fun e!103281 () Bool)

(declare-fun tp_is_empty!3255 () Bool)

(assert (=> b!157694 (= e!103281 tp_is_empty!3255)))

(declare-fun mapIsEmpty!5536 () Bool)

(declare-fun mapRes!5536 () Bool)

(assert (=> mapIsEmpty!5536 mapRes!5536))

(declare-fun b!157695 () Bool)

(declare-fun res!74527 () Bool)

(declare-fun e!103277 () Bool)

(assert (=> b!157695 (=> (not res!74527) (not e!103277))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157695 (= res!74527 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157696 () Bool)

(declare-fun res!74526 () Bool)

(assert (=> b!157696 (=> (not res!74526) (not e!103277))))

(declare-datatypes ((V!3987 0))(
  ( (V!3988 (val!1672 Int)) )
))
(declare-datatypes ((ValueCell!1284 0))(
  ( (ValueCellFull!1284 (v!3537 V!3987)) (EmptyCell!1284) )
))
(declare-datatypes ((array!5569 0))(
  ( (array!5570 (arr!2639 (Array (_ BitVec 32) (_ BitVec 64))) (size!2919 (_ BitVec 32))) )
))
(declare-datatypes ((array!5571 0))(
  ( (array!5572 (arr!2640 (Array (_ BitVec 32) ValueCell!1284)) (size!2920 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1476 0))(
  ( (LongMapFixedSize!1477 (defaultEntry!3180 Int) (mask!7668 (_ BitVec 32)) (extraKeys!2921 (_ BitVec 32)) (zeroValue!3023 V!3987) (minValue!3023 V!3987) (_size!787 (_ BitVec 32)) (_keys!4957 array!5569) (_values!3163 array!5571) (_vacant!787 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1476)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157696 (= res!74526 (validMask!0 (mask!7668 thiss!1248)))))

(declare-fun e!103278 () Bool)

(declare-fun e!103282 () Bool)

(declare-fun array_inv!1677 (array!5569) Bool)

(declare-fun array_inv!1678 (array!5571) Bool)

(assert (=> b!157697 (= e!103278 (and tp!12895 tp_is_empty!3255 (array_inv!1677 (_keys!4957 thiss!1248)) (array_inv!1678 (_values!3163 thiss!1248)) e!103282))))

(declare-fun b!157698 () Bool)

(declare-fun e!103279 () Bool)

(assert (=> b!157698 (= e!103282 (and e!103279 mapRes!5536))))

(declare-fun condMapEmpty!5536 () Bool)

(declare-fun mapDefault!5536 () ValueCell!1284)

(assert (=> b!157698 (= condMapEmpty!5536 (= (arr!2640 (_values!3163 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1284)) mapDefault!5536)))))

(declare-fun b!157700 () Bool)

(assert (=> b!157700 (= e!103279 tp_is_empty!3255)))

(declare-fun mapNonEmpty!5536 () Bool)

(declare-fun tp!12894 () Bool)

(assert (=> mapNonEmpty!5536 (= mapRes!5536 (and tp!12894 e!103281))))

(declare-fun mapRest!5536 () (Array (_ BitVec 32) ValueCell!1284))

(declare-fun mapValue!5536 () ValueCell!1284)

(declare-fun mapKey!5536 () (_ BitVec 32))

(assert (=> mapNonEmpty!5536 (= (arr!2640 (_values!3163 thiss!1248)) (store mapRest!5536 mapKey!5536 mapValue!5536))))

(declare-fun b!157701 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157701 (= e!103277 (not (validKeyInArray!0 key!828)))))

(declare-fun res!74524 () Bool)

(assert (=> start!15826 (=> (not res!74524) (not e!103277))))

(declare-fun valid!700 (LongMapFixedSize!1476) Bool)

(assert (=> start!15826 (= res!74524 (valid!700 thiss!1248))))

(assert (=> start!15826 e!103277))

(assert (=> start!15826 e!103278))

(assert (=> start!15826 true))

(declare-fun b!157699 () Bool)

(declare-fun res!74525 () Bool)

(assert (=> b!157699 (=> (not res!74525) (not e!103277))))

(assert (=> b!157699 (= res!74525 (and (bvsge (mask!7668 thiss!1248) #b00000000000000000000000000000000) (= (size!2919 (_keys!4957 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7668 thiss!1248)))))))

(assert (= (and start!15826 res!74524) b!157695))

(assert (= (and b!157695 res!74527) b!157696))

(assert (= (and b!157696 res!74526) b!157699))

(assert (= (and b!157699 res!74525) b!157701))

(assert (= (and b!157698 condMapEmpty!5536) mapIsEmpty!5536))

(assert (= (and b!157698 (not condMapEmpty!5536)) mapNonEmpty!5536))

(get-info :version)

(assert (= (and mapNonEmpty!5536 ((_ is ValueCellFull!1284) mapValue!5536)) b!157694))

(assert (= (and b!157698 ((_ is ValueCellFull!1284) mapDefault!5536)) b!157700))

(assert (= b!157697 b!157698))

(assert (= start!15826 b!157697))

(declare-fun m!190787 () Bool)

(assert (=> start!15826 m!190787))

(declare-fun m!190789 () Bool)

(assert (=> b!157697 m!190789))

(declare-fun m!190791 () Bool)

(assert (=> b!157697 m!190791))

(declare-fun m!190793 () Bool)

(assert (=> b!157696 m!190793))

(declare-fun m!190795 () Bool)

(assert (=> b!157701 m!190795))

(declare-fun m!190797 () Bool)

(assert (=> mapNonEmpty!5536 m!190797))

(check-sat (not b!157701) (not b!157697) (not start!15826) tp_is_empty!3255 b_and!9867 (not b_next!3453) (not b!157696) (not mapNonEmpty!5536))
(check-sat b_and!9867 (not b_next!3453))
(get-model)

(declare-fun d!51085 () Bool)

(declare-fun res!74546 () Bool)

(declare-fun e!103303 () Bool)

(assert (=> d!51085 (=> (not res!74546) (not e!103303))))

(declare-fun simpleValid!108 (LongMapFixedSize!1476) Bool)

(assert (=> d!51085 (= res!74546 (simpleValid!108 thiss!1248))))

(assert (=> d!51085 (= (valid!700 thiss!1248) e!103303)))

(declare-fun b!157732 () Bool)

(declare-fun res!74547 () Bool)

(assert (=> b!157732 (=> (not res!74547) (not e!103303))))

(declare-fun arrayCountValidKeys!0 (array!5569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157732 (= res!74547 (= (arrayCountValidKeys!0 (_keys!4957 thiss!1248) #b00000000000000000000000000000000 (size!2919 (_keys!4957 thiss!1248))) (_size!787 thiss!1248)))))

(declare-fun b!157733 () Bool)

(declare-fun res!74548 () Bool)

(assert (=> b!157733 (=> (not res!74548) (not e!103303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5569 (_ BitVec 32)) Bool)

(assert (=> b!157733 (= res!74548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4957 thiss!1248) (mask!7668 thiss!1248)))))

(declare-fun b!157734 () Bool)

(declare-datatypes ((List!1885 0))(
  ( (Nil!1882) (Cons!1881 (h!2490 (_ BitVec 64)) (t!6687 List!1885)) )
))
(declare-fun arrayNoDuplicates!0 (array!5569 (_ BitVec 32) List!1885) Bool)

(assert (=> b!157734 (= e!103303 (arrayNoDuplicates!0 (_keys!4957 thiss!1248) #b00000000000000000000000000000000 Nil!1882))))

(assert (= (and d!51085 res!74546) b!157732))

(assert (= (and b!157732 res!74547) b!157733))

(assert (= (and b!157733 res!74548) b!157734))

(declare-fun m!190811 () Bool)

(assert (=> d!51085 m!190811))

(declare-fun m!190813 () Bool)

(assert (=> b!157732 m!190813))

(declare-fun m!190815 () Bool)

(assert (=> b!157733 m!190815))

(declare-fun m!190817 () Bool)

(assert (=> b!157734 m!190817))

(assert (=> start!15826 d!51085))

(declare-fun d!51087 () Bool)

(assert (=> d!51087 (= (validMask!0 (mask!7668 thiss!1248)) (and (or (= (mask!7668 thiss!1248) #b00000000000000000000000000000111) (= (mask!7668 thiss!1248) #b00000000000000000000000000001111) (= (mask!7668 thiss!1248) #b00000000000000000000000000011111) (= (mask!7668 thiss!1248) #b00000000000000000000000000111111) (= (mask!7668 thiss!1248) #b00000000000000000000000001111111) (= (mask!7668 thiss!1248) #b00000000000000000000000011111111) (= (mask!7668 thiss!1248) #b00000000000000000000000111111111) (= (mask!7668 thiss!1248) #b00000000000000000000001111111111) (= (mask!7668 thiss!1248) #b00000000000000000000011111111111) (= (mask!7668 thiss!1248) #b00000000000000000000111111111111) (= (mask!7668 thiss!1248) #b00000000000000000001111111111111) (= (mask!7668 thiss!1248) #b00000000000000000011111111111111) (= (mask!7668 thiss!1248) #b00000000000000000111111111111111) (= (mask!7668 thiss!1248) #b00000000000000001111111111111111) (= (mask!7668 thiss!1248) #b00000000000000011111111111111111) (= (mask!7668 thiss!1248) #b00000000000000111111111111111111) (= (mask!7668 thiss!1248) #b00000000000001111111111111111111) (= (mask!7668 thiss!1248) #b00000000000011111111111111111111) (= (mask!7668 thiss!1248) #b00000000000111111111111111111111) (= (mask!7668 thiss!1248) #b00000000001111111111111111111111) (= (mask!7668 thiss!1248) #b00000000011111111111111111111111) (= (mask!7668 thiss!1248) #b00000000111111111111111111111111) (= (mask!7668 thiss!1248) #b00000001111111111111111111111111) (= (mask!7668 thiss!1248) #b00000011111111111111111111111111) (= (mask!7668 thiss!1248) #b00000111111111111111111111111111) (= (mask!7668 thiss!1248) #b00001111111111111111111111111111) (= (mask!7668 thiss!1248) #b00011111111111111111111111111111) (= (mask!7668 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7668 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157696 d!51087))

(declare-fun d!51089 () Bool)

(assert (=> d!51089 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!157701 d!51089))

(declare-fun d!51091 () Bool)

(assert (=> d!51091 (= (array_inv!1677 (_keys!4957 thiss!1248)) (bvsge (size!2919 (_keys!4957 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157697 d!51091))

(declare-fun d!51093 () Bool)

(assert (=> d!51093 (= (array_inv!1678 (_values!3163 thiss!1248)) (bvsge (size!2920 (_values!3163 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157697 d!51093))

(declare-fun mapNonEmpty!5542 () Bool)

(declare-fun mapRes!5542 () Bool)

(declare-fun tp!12904 () Bool)

(declare-fun e!103309 () Bool)

(assert (=> mapNonEmpty!5542 (= mapRes!5542 (and tp!12904 e!103309))))

(declare-fun mapRest!5542 () (Array (_ BitVec 32) ValueCell!1284))

(declare-fun mapValue!5542 () ValueCell!1284)

(declare-fun mapKey!5542 () (_ BitVec 32))

(assert (=> mapNonEmpty!5542 (= mapRest!5536 (store mapRest!5542 mapKey!5542 mapValue!5542))))

(declare-fun condMapEmpty!5542 () Bool)

(declare-fun mapDefault!5542 () ValueCell!1284)

(assert (=> mapNonEmpty!5536 (= condMapEmpty!5542 (= mapRest!5536 ((as const (Array (_ BitVec 32) ValueCell!1284)) mapDefault!5542)))))

(declare-fun e!103308 () Bool)

(assert (=> mapNonEmpty!5536 (= tp!12894 (and e!103308 mapRes!5542))))

(declare-fun mapIsEmpty!5542 () Bool)

(assert (=> mapIsEmpty!5542 mapRes!5542))

(declare-fun b!157742 () Bool)

(assert (=> b!157742 (= e!103308 tp_is_empty!3255)))

(declare-fun b!157741 () Bool)

(assert (=> b!157741 (= e!103309 tp_is_empty!3255)))

(assert (= (and mapNonEmpty!5536 condMapEmpty!5542) mapIsEmpty!5542))

(assert (= (and mapNonEmpty!5536 (not condMapEmpty!5542)) mapNonEmpty!5542))

(assert (= (and mapNonEmpty!5542 ((_ is ValueCellFull!1284) mapValue!5542)) b!157741))

(assert (= (and mapNonEmpty!5536 ((_ is ValueCellFull!1284) mapDefault!5542)) b!157742))

(declare-fun m!190819 () Bool)

(assert (=> mapNonEmpty!5542 m!190819))

(check-sat b_and!9867 (not b!157732) (not d!51085) (not b_next!3453) (not mapNonEmpty!5542) (not b!157733) tp_is_empty!3255 (not b!157734))
(check-sat b_and!9867 (not b_next!3453))
