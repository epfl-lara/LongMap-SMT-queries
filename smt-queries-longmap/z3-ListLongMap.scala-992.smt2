; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21400 () Bool)

(assert start!21400)

(declare-fun b!215047 () Bool)

(declare-fun b_free!5701 () Bool)

(declare-fun b_next!5701 () Bool)

(assert (=> b!215047 (= b_free!5701 (not b_next!5701))))

(declare-fun tp!20207 () Bool)

(declare-fun b_and!12605 () Bool)

(assert (=> b!215047 (= tp!20207 b_and!12605)))

(declare-fun b!215042 () Bool)

(declare-fun e!139861 () Bool)

(declare-fun e!139857 () Bool)

(declare-fun mapRes!9476 () Bool)

(assert (=> b!215042 (= e!139861 (and e!139857 mapRes!9476))))

(declare-fun condMapEmpty!9476 () Bool)

(declare-datatypes ((V!7065 0))(
  ( (V!7066 (val!2826 Int)) )
))
(declare-datatypes ((ValueCell!2438 0))(
  ( (ValueCellFull!2438 (v!4845 V!7065)) (EmptyCell!2438) )
))
(declare-datatypes ((array!10345 0))(
  ( (array!10346 (arr!4903 (Array (_ BitVec 32) ValueCell!2438)) (size!5231 (_ BitVec 32))) )
))
(declare-datatypes ((array!10347 0))(
  ( (array!10348 (arr!4904 (Array (_ BitVec 32) (_ BitVec 64))) (size!5232 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2776 0))(
  ( (LongMapFixedSize!2777 (defaultEntry!4038 Int) (mask!9720 (_ BitVec 32)) (extraKeys!3775 (_ BitVec 32)) (zeroValue!3879 V!7065) (minValue!3879 V!7065) (_size!1437 (_ BitVec 32)) (_keys!6063 array!10347) (_values!4021 array!10345) (_vacant!1437 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2776)

(declare-fun mapDefault!9476 () ValueCell!2438)

(assert (=> b!215042 (= condMapEmpty!9476 (= (arr!4903 (_values!4021 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2438)) mapDefault!9476)))))

(declare-fun b!215044 () Bool)

(declare-fun e!139856 () Bool)

(declare-fun tp_is_empty!5563 () Bool)

(assert (=> b!215044 (= e!139856 tp_is_empty!5563)))

(declare-fun b!215045 () Bool)

(declare-fun res!105231 () Bool)

(declare-fun e!139859 () Bool)

(assert (=> b!215045 (=> (not res!105231) (not e!139859))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215045 (= res!105231 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215046 () Bool)

(declare-fun e!139858 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215046 (= e!139858 (not (validMask!0 (mask!9720 thiss!1504))))))

(declare-fun mapIsEmpty!9476 () Bool)

(assert (=> mapIsEmpty!9476 mapRes!9476))

(declare-fun e!139862 () Bool)

(declare-fun array_inv!3219 (array!10347) Bool)

(declare-fun array_inv!3220 (array!10345) Bool)

(assert (=> b!215047 (= e!139862 (and tp!20207 tp_is_empty!5563 (array_inv!3219 (_keys!6063 thiss!1504)) (array_inv!3220 (_values!4021 thiss!1504)) e!139861))))

(declare-fun res!105233 () Bool)

(assert (=> start!21400 (=> (not res!105233) (not e!139859))))

(declare-fun valid!1153 (LongMapFixedSize!2776) Bool)

(assert (=> start!21400 (= res!105233 (valid!1153 thiss!1504))))

(assert (=> start!21400 e!139859))

(assert (=> start!21400 e!139862))

(assert (=> start!21400 true))

(declare-fun b!215043 () Bool)

(assert (=> b!215043 (= e!139857 tp_is_empty!5563)))

(declare-fun mapNonEmpty!9476 () Bool)

(declare-fun tp!20206 () Bool)

(assert (=> mapNonEmpty!9476 (= mapRes!9476 (and tp!20206 e!139856))))

(declare-fun mapRest!9476 () (Array (_ BitVec 32) ValueCell!2438))

(declare-fun mapValue!9476 () ValueCell!2438)

(declare-fun mapKey!9476 () (_ BitVec 32))

(assert (=> mapNonEmpty!9476 (= (arr!4903 (_values!4021 thiss!1504)) (store mapRest!9476 mapKey!9476 mapValue!9476))))

(declare-fun b!215048 () Bool)

(assert (=> b!215048 (= e!139859 e!139858)))

(declare-fun res!105232 () Bool)

(assert (=> b!215048 (=> (not res!105232) (not e!139858))))

(declare-datatypes ((SeekEntryResult!715 0))(
  ( (MissingZero!715 (index!5030 (_ BitVec 32))) (Found!715 (index!5031 (_ BitVec 32))) (Intermediate!715 (undefined!1527 Bool) (index!5032 (_ BitVec 32)) (x!22431 (_ BitVec 32))) (Undefined!715) (MissingVacant!715 (index!5033 (_ BitVec 32))) )
))
(declare-fun lt!110918 () SeekEntryResult!715)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215048 (= res!105232 (or (= lt!110918 (MissingZero!715 index!297)) (= lt!110918 (MissingVacant!715 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10347 (_ BitVec 32)) SeekEntryResult!715)

(assert (=> b!215048 (= lt!110918 (seekEntryOrOpen!0 key!932 (_keys!6063 thiss!1504) (mask!9720 thiss!1504)))))

(assert (= (and start!21400 res!105233) b!215045))

(assert (= (and b!215045 res!105231) b!215048))

(assert (= (and b!215048 res!105232) b!215046))

(assert (= (and b!215042 condMapEmpty!9476) mapIsEmpty!9476))

(assert (= (and b!215042 (not condMapEmpty!9476)) mapNonEmpty!9476))

(get-info :version)

(assert (= (and mapNonEmpty!9476 ((_ is ValueCellFull!2438) mapValue!9476)) b!215044))

(assert (= (and b!215042 ((_ is ValueCellFull!2438) mapDefault!9476)) b!215043))

(assert (= b!215047 b!215042))

(assert (= start!21400 b!215047))

(declare-fun m!242595 () Bool)

(assert (=> b!215047 m!242595))

(declare-fun m!242597 () Bool)

(assert (=> b!215047 m!242597))

(declare-fun m!242599 () Bool)

(assert (=> b!215048 m!242599))

(declare-fun m!242601 () Bool)

(assert (=> mapNonEmpty!9476 m!242601))

(declare-fun m!242603 () Bool)

(assert (=> start!21400 m!242603))

(declare-fun m!242605 () Bool)

(assert (=> b!215046 m!242605))

(check-sat tp_is_empty!5563 b_and!12605 (not b!215046) (not mapNonEmpty!9476) (not b_next!5701) (not b!215048) (not b!215047) (not start!21400))
(check-sat b_and!12605 (not b_next!5701))
(get-model)

(declare-fun d!58457 () Bool)

(assert (=> d!58457 (= (array_inv!3219 (_keys!6063 thiss!1504)) (bvsge (size!5232 (_keys!6063 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215047 d!58457))

(declare-fun d!58459 () Bool)

(assert (=> d!58459 (= (array_inv!3220 (_values!4021 thiss!1504)) (bvsge (size!5231 (_values!4021 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215047 d!58459))

(declare-fun d!58461 () Bool)

(assert (=> d!58461 (= (validMask!0 (mask!9720 thiss!1504)) (and (or (= (mask!9720 thiss!1504) #b00000000000000000000000000000111) (= (mask!9720 thiss!1504) #b00000000000000000000000000001111) (= (mask!9720 thiss!1504) #b00000000000000000000000000011111) (= (mask!9720 thiss!1504) #b00000000000000000000000000111111) (= (mask!9720 thiss!1504) #b00000000000000000000000001111111) (= (mask!9720 thiss!1504) #b00000000000000000000000011111111) (= (mask!9720 thiss!1504) #b00000000000000000000000111111111) (= (mask!9720 thiss!1504) #b00000000000000000000001111111111) (= (mask!9720 thiss!1504) #b00000000000000000000011111111111) (= (mask!9720 thiss!1504) #b00000000000000000000111111111111) (= (mask!9720 thiss!1504) #b00000000000000000001111111111111) (= (mask!9720 thiss!1504) #b00000000000000000011111111111111) (= (mask!9720 thiss!1504) #b00000000000000000111111111111111) (= (mask!9720 thiss!1504) #b00000000000000001111111111111111) (= (mask!9720 thiss!1504) #b00000000000000011111111111111111) (= (mask!9720 thiss!1504) #b00000000000000111111111111111111) (= (mask!9720 thiss!1504) #b00000000000001111111111111111111) (= (mask!9720 thiss!1504) #b00000000000011111111111111111111) (= (mask!9720 thiss!1504) #b00000000000111111111111111111111) (= (mask!9720 thiss!1504) #b00000000001111111111111111111111) (= (mask!9720 thiss!1504) #b00000000011111111111111111111111) (= (mask!9720 thiss!1504) #b00000000111111111111111111111111) (= (mask!9720 thiss!1504) #b00000001111111111111111111111111) (= (mask!9720 thiss!1504) #b00000011111111111111111111111111) (= (mask!9720 thiss!1504) #b00000111111111111111111111111111) (= (mask!9720 thiss!1504) #b00001111111111111111111111111111) (= (mask!9720 thiss!1504) #b00011111111111111111111111111111) (= (mask!9720 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9720 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215046 d!58461))

(declare-fun d!58463 () Bool)

(declare-fun res!105258 () Bool)

(declare-fun e!139907 () Bool)

(assert (=> d!58463 (=> (not res!105258) (not e!139907))))

(declare-fun simpleValid!215 (LongMapFixedSize!2776) Bool)

(assert (=> d!58463 (= res!105258 (simpleValid!215 thiss!1504))))

(assert (=> d!58463 (= (valid!1153 thiss!1504) e!139907)))

(declare-fun b!215097 () Bool)

(declare-fun res!105259 () Bool)

(assert (=> b!215097 (=> (not res!105259) (not e!139907))))

(declare-fun arrayCountValidKeys!0 (array!10347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215097 (= res!105259 (= (arrayCountValidKeys!0 (_keys!6063 thiss!1504) #b00000000000000000000000000000000 (size!5232 (_keys!6063 thiss!1504))) (_size!1437 thiss!1504)))))

(declare-fun b!215098 () Bool)

(declare-fun res!105260 () Bool)

(assert (=> b!215098 (=> (not res!105260) (not e!139907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10347 (_ BitVec 32)) Bool)

(assert (=> b!215098 (= res!105260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6063 thiss!1504) (mask!9720 thiss!1504)))))

(declare-fun b!215099 () Bool)

(declare-datatypes ((List!3069 0))(
  ( (Nil!3066) (Cons!3065 (h!3708 (_ BitVec 64)) (t!8016 List!3069)) )
))
(declare-fun arrayNoDuplicates!0 (array!10347 (_ BitVec 32) List!3069) Bool)

(assert (=> b!215099 (= e!139907 (arrayNoDuplicates!0 (_keys!6063 thiss!1504) #b00000000000000000000000000000000 Nil!3066))))

(assert (= (and d!58463 res!105258) b!215097))

(assert (= (and b!215097 res!105259) b!215098))

(assert (= (and b!215098 res!105260) b!215099))

(declare-fun m!242631 () Bool)

(assert (=> d!58463 m!242631))

(declare-fun m!242633 () Bool)

(assert (=> b!215097 m!242633))

(declare-fun m!242635 () Bool)

(assert (=> b!215098 m!242635))

(declare-fun m!242637 () Bool)

(assert (=> b!215099 m!242637))

(assert (=> start!21400 d!58463))

(declare-fun d!58465 () Bool)

(declare-fun lt!110933 () SeekEntryResult!715)

(assert (=> d!58465 (and (or ((_ is Undefined!715) lt!110933) (not ((_ is Found!715) lt!110933)) (and (bvsge (index!5031 lt!110933) #b00000000000000000000000000000000) (bvslt (index!5031 lt!110933) (size!5232 (_keys!6063 thiss!1504))))) (or ((_ is Undefined!715) lt!110933) ((_ is Found!715) lt!110933) (not ((_ is MissingZero!715) lt!110933)) (and (bvsge (index!5030 lt!110933) #b00000000000000000000000000000000) (bvslt (index!5030 lt!110933) (size!5232 (_keys!6063 thiss!1504))))) (or ((_ is Undefined!715) lt!110933) ((_ is Found!715) lt!110933) ((_ is MissingZero!715) lt!110933) (not ((_ is MissingVacant!715) lt!110933)) (and (bvsge (index!5033 lt!110933) #b00000000000000000000000000000000) (bvslt (index!5033 lt!110933) (size!5232 (_keys!6063 thiss!1504))))) (or ((_ is Undefined!715) lt!110933) (ite ((_ is Found!715) lt!110933) (= (select (arr!4904 (_keys!6063 thiss!1504)) (index!5031 lt!110933)) key!932) (ite ((_ is MissingZero!715) lt!110933) (= (select (arr!4904 (_keys!6063 thiss!1504)) (index!5030 lt!110933)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!715) lt!110933) (= (select (arr!4904 (_keys!6063 thiss!1504)) (index!5033 lt!110933)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139914 () SeekEntryResult!715)

(assert (=> d!58465 (= lt!110933 e!139914)))

(declare-fun c!36133 () Bool)

(declare-fun lt!110931 () SeekEntryResult!715)

(assert (=> d!58465 (= c!36133 (and ((_ is Intermediate!715) lt!110931) (undefined!1527 lt!110931)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10347 (_ BitVec 32)) SeekEntryResult!715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58465 (= lt!110931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9720 thiss!1504)) key!932 (_keys!6063 thiss!1504) (mask!9720 thiss!1504)))))

(assert (=> d!58465 (validMask!0 (mask!9720 thiss!1504))))

(assert (=> d!58465 (= (seekEntryOrOpen!0 key!932 (_keys!6063 thiss!1504) (mask!9720 thiss!1504)) lt!110933)))

(declare-fun b!215112 () Bool)

(declare-fun c!36135 () Bool)

(declare-fun lt!110932 () (_ BitVec 64))

(assert (=> b!215112 (= c!36135 (= lt!110932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139915 () SeekEntryResult!715)

(declare-fun e!139916 () SeekEntryResult!715)

(assert (=> b!215112 (= e!139915 e!139916)))

(declare-fun b!215113 () Bool)

(assert (=> b!215113 (= e!139916 (MissingZero!715 (index!5032 lt!110931)))))

(declare-fun b!215114 () Bool)

(assert (=> b!215114 (= e!139914 Undefined!715)))

(declare-fun b!215115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10347 (_ BitVec 32)) SeekEntryResult!715)

(assert (=> b!215115 (= e!139916 (seekKeyOrZeroReturnVacant!0 (x!22431 lt!110931) (index!5032 lt!110931) (index!5032 lt!110931) key!932 (_keys!6063 thiss!1504) (mask!9720 thiss!1504)))))

(declare-fun b!215116 () Bool)

(assert (=> b!215116 (= e!139914 e!139915)))

(assert (=> b!215116 (= lt!110932 (select (arr!4904 (_keys!6063 thiss!1504)) (index!5032 lt!110931)))))

(declare-fun c!36134 () Bool)

(assert (=> b!215116 (= c!36134 (= lt!110932 key!932))))

(declare-fun b!215117 () Bool)

(assert (=> b!215117 (= e!139915 (Found!715 (index!5032 lt!110931)))))

(assert (= (and d!58465 c!36133) b!215114))

(assert (= (and d!58465 (not c!36133)) b!215116))

(assert (= (and b!215116 c!36134) b!215117))

(assert (= (and b!215116 (not c!36134)) b!215112))

(assert (= (and b!215112 c!36135) b!215113))

(assert (= (and b!215112 (not c!36135)) b!215115))

(declare-fun m!242639 () Bool)

(assert (=> d!58465 m!242639))

(declare-fun m!242641 () Bool)

(assert (=> d!58465 m!242641))

(assert (=> d!58465 m!242639))

(assert (=> d!58465 m!242605))

(declare-fun m!242643 () Bool)

(assert (=> d!58465 m!242643))

(declare-fun m!242645 () Bool)

(assert (=> d!58465 m!242645))

(declare-fun m!242647 () Bool)

(assert (=> d!58465 m!242647))

(declare-fun m!242649 () Bool)

(assert (=> b!215115 m!242649))

(declare-fun m!242651 () Bool)

(assert (=> b!215116 m!242651))

(assert (=> b!215048 d!58465))

(declare-fun b!215124 () Bool)

(declare-fun e!139922 () Bool)

(assert (=> b!215124 (= e!139922 tp_is_empty!5563)))

(declare-fun mapNonEmpty!9485 () Bool)

(declare-fun mapRes!9485 () Bool)

(declare-fun tp!20222 () Bool)

(assert (=> mapNonEmpty!9485 (= mapRes!9485 (and tp!20222 e!139922))))

(declare-fun mapValue!9485 () ValueCell!2438)

(declare-fun mapKey!9485 () (_ BitVec 32))

(declare-fun mapRest!9485 () (Array (_ BitVec 32) ValueCell!2438))

(assert (=> mapNonEmpty!9485 (= mapRest!9476 (store mapRest!9485 mapKey!9485 mapValue!9485))))

(declare-fun condMapEmpty!9485 () Bool)

(declare-fun mapDefault!9485 () ValueCell!2438)

(assert (=> mapNonEmpty!9476 (= condMapEmpty!9485 (= mapRest!9476 ((as const (Array (_ BitVec 32) ValueCell!2438)) mapDefault!9485)))))

(declare-fun e!139921 () Bool)

(assert (=> mapNonEmpty!9476 (= tp!20206 (and e!139921 mapRes!9485))))

(declare-fun mapIsEmpty!9485 () Bool)

(assert (=> mapIsEmpty!9485 mapRes!9485))

(declare-fun b!215125 () Bool)

(assert (=> b!215125 (= e!139921 tp_is_empty!5563)))

(assert (= (and mapNonEmpty!9476 condMapEmpty!9485) mapIsEmpty!9485))

(assert (= (and mapNonEmpty!9476 (not condMapEmpty!9485)) mapNonEmpty!9485))

(assert (= (and mapNonEmpty!9485 ((_ is ValueCellFull!2438) mapValue!9485)) b!215124))

(assert (= (and mapNonEmpty!9476 ((_ is ValueCellFull!2438) mapDefault!9485)) b!215125))

(declare-fun m!242653 () Bool)

(assert (=> mapNonEmpty!9485 m!242653))

(check-sat (not mapNonEmpty!9485) (not b!215099) tp_is_empty!5563 b_and!12605 (not b_next!5701) (not b!215098) (not b!215097) (not d!58465) (not b!215115) (not d!58463))
(check-sat b_and!12605 (not b_next!5701))
