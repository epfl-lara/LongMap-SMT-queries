; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21400 () Bool)

(assert start!21400)

(declare-fun b!214849 () Bool)

(declare-fun b_free!5701 () Bool)

(declare-fun b_next!5701 () Bool)

(assert (=> b!214849 (= b_free!5701 (not b_next!5701))))

(declare-fun tp!20207 () Bool)

(declare-fun b_and!12565 () Bool)

(assert (=> b!214849 (= tp!20207 b_and!12565)))

(declare-fun b!214848 () Bool)

(declare-fun e!139737 () Bool)

(declare-fun tp_is_empty!5563 () Bool)

(assert (=> b!214848 (= e!139737 tp_is_empty!5563)))

(declare-fun mapIsEmpty!9476 () Bool)

(declare-fun mapRes!9476 () Bool)

(assert (=> mapIsEmpty!9476 mapRes!9476))

(declare-fun e!139736 () Bool)

(declare-datatypes ((V!7065 0))(
  ( (V!7066 (val!2826 Int)) )
))
(declare-datatypes ((ValueCell!2438 0))(
  ( (ValueCellFull!2438 (v!4838 V!7065)) (EmptyCell!2438) )
))
(declare-datatypes ((array!10339 0))(
  ( (array!10340 (arr!4899 (Array (_ BitVec 32) ValueCell!2438)) (size!5228 (_ BitVec 32))) )
))
(declare-datatypes ((array!10341 0))(
  ( (array!10342 (arr!4900 (Array (_ BitVec 32) (_ BitVec 64))) (size!5229 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2776 0))(
  ( (LongMapFixedSize!2777 (defaultEntry!4038 Int) (mask!9719 (_ BitVec 32)) (extraKeys!3775 (_ BitVec 32)) (zeroValue!3879 V!7065) (minValue!3879 V!7065) (_size!1437 (_ BitVec 32)) (_keys!6062 array!10341) (_values!4021 array!10339) (_vacant!1437 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2776)

(declare-fun e!139732 () Bool)

(declare-fun array_inv!3221 (array!10341) Bool)

(declare-fun array_inv!3222 (array!10339) Bool)

(assert (=> b!214849 (= e!139736 (and tp!20207 tp_is_empty!5563 (array_inv!3221 (_keys!6062 thiss!1504)) (array_inv!3222 (_values!4021 thiss!1504)) e!139732))))

(declare-fun b!214850 () Bool)

(declare-fun e!139733 () Bool)

(declare-fun e!139731 () Bool)

(assert (=> b!214850 (= e!139733 e!139731)))

(declare-fun res!105116 () Bool)

(assert (=> b!214850 (=> (not res!105116) (not e!139731))))

(declare-datatypes ((SeekEntryResult!724 0))(
  ( (MissingZero!724 (index!5066 (_ BitVec 32))) (Found!724 (index!5067 (_ BitVec 32))) (Intermediate!724 (undefined!1536 Bool) (index!5068 (_ BitVec 32)) (x!22439 (_ BitVec 32))) (Undefined!724) (MissingVacant!724 (index!5069 (_ BitVec 32))) )
))
(declare-fun lt!110678 () SeekEntryResult!724)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!214850 (= res!105116 (or (= lt!110678 (MissingZero!724 index!297)) (= lt!110678 (MissingVacant!724 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10341 (_ BitVec 32)) SeekEntryResult!724)

(assert (=> b!214850 (= lt!110678 (seekEntryOrOpen!0 key!932 (_keys!6062 thiss!1504) (mask!9719 thiss!1504)))))

(declare-fun res!105115 () Bool)

(assert (=> start!21400 (=> (not res!105115) (not e!139733))))

(declare-fun valid!1152 (LongMapFixedSize!2776) Bool)

(assert (=> start!21400 (= res!105115 (valid!1152 thiss!1504))))

(assert (=> start!21400 e!139733))

(assert (=> start!21400 e!139736))

(assert (=> start!21400 true))

(declare-fun b!214851 () Bool)

(declare-fun e!139735 () Bool)

(assert (=> b!214851 (= e!139735 tp_is_empty!5563)))

(declare-fun b!214852 () Bool)

(assert (=> b!214852 (= e!139732 (and e!139735 mapRes!9476))))

(declare-fun condMapEmpty!9476 () Bool)

(declare-fun mapDefault!9476 () ValueCell!2438)

(assert (=> b!214852 (= condMapEmpty!9476 (= (arr!4899 (_values!4021 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2438)) mapDefault!9476)))))

(declare-fun b!214853 () Bool)

(declare-fun res!105117 () Bool)

(assert (=> b!214853 (=> (not res!105117) (not e!139733))))

(assert (=> b!214853 (= res!105117 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9476 () Bool)

(declare-fun tp!20206 () Bool)

(assert (=> mapNonEmpty!9476 (= mapRes!9476 (and tp!20206 e!139737))))

(declare-fun mapRest!9476 () (Array (_ BitVec 32) ValueCell!2438))

(declare-fun mapValue!9476 () ValueCell!2438)

(declare-fun mapKey!9476 () (_ BitVec 32))

(assert (=> mapNonEmpty!9476 (= (arr!4899 (_values!4021 thiss!1504)) (store mapRest!9476 mapKey!9476 mapValue!9476))))

(declare-fun b!214854 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214854 (= e!139731 (not (validMask!0 (mask!9719 thiss!1504))))))

(assert (= (and start!21400 res!105115) b!214853))

(assert (= (and b!214853 res!105117) b!214850))

(assert (= (and b!214850 res!105116) b!214854))

(assert (= (and b!214852 condMapEmpty!9476) mapIsEmpty!9476))

(assert (= (and b!214852 (not condMapEmpty!9476)) mapNonEmpty!9476))

(get-info :version)

(assert (= (and mapNonEmpty!9476 ((_ is ValueCellFull!2438) mapValue!9476)) b!214848))

(assert (= (and b!214852 ((_ is ValueCellFull!2438) mapDefault!9476)) b!214851))

(assert (= b!214849 b!214852))

(assert (= start!21400 b!214849))

(declare-fun m!241797 () Bool)

(assert (=> b!214854 m!241797))

(declare-fun m!241799 () Bool)

(assert (=> b!214849 m!241799))

(declare-fun m!241801 () Bool)

(assert (=> b!214849 m!241801))

(declare-fun m!241803 () Bool)

(assert (=> b!214850 m!241803))

(declare-fun m!241805 () Bool)

(assert (=> start!21400 m!241805))

(declare-fun m!241807 () Bool)

(assert (=> mapNonEmpty!9476 m!241807))

(check-sat (not start!21400) (not mapNonEmpty!9476) (not b!214854) (not b_next!5701) tp_is_empty!5563 (not b!214850) b_and!12565 (not b!214849))
(check-sat b_and!12565 (not b_next!5701))
(get-model)

(declare-fun d!58235 () Bool)

(declare-fun res!105142 () Bool)

(declare-fun e!139782 () Bool)

(assert (=> d!58235 (=> (not res!105142) (not e!139782))))

(declare-fun simpleValid!215 (LongMapFixedSize!2776) Bool)

(assert (=> d!58235 (= res!105142 (simpleValid!215 thiss!1504))))

(assert (=> d!58235 (= (valid!1152 thiss!1504) e!139782)))

(declare-fun b!214903 () Bool)

(declare-fun res!105143 () Bool)

(assert (=> b!214903 (=> (not res!105143) (not e!139782))))

(declare-fun arrayCountValidKeys!0 (array!10341 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214903 (= res!105143 (= (arrayCountValidKeys!0 (_keys!6062 thiss!1504) #b00000000000000000000000000000000 (size!5229 (_keys!6062 thiss!1504))) (_size!1437 thiss!1504)))))

(declare-fun b!214904 () Bool)

(declare-fun res!105144 () Bool)

(assert (=> b!214904 (=> (not res!105144) (not e!139782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10341 (_ BitVec 32)) Bool)

(assert (=> b!214904 (= res!105144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6062 thiss!1504) (mask!9719 thiss!1504)))))

(declare-fun b!214905 () Bool)

(declare-datatypes ((List!3121 0))(
  ( (Nil!3118) (Cons!3117 (h!3760 (_ BitVec 64)) (t!8067 List!3121)) )
))
(declare-fun arrayNoDuplicates!0 (array!10341 (_ BitVec 32) List!3121) Bool)

(assert (=> b!214905 (= e!139782 (arrayNoDuplicates!0 (_keys!6062 thiss!1504) #b00000000000000000000000000000000 Nil!3118))))

(assert (= (and d!58235 res!105142) b!214903))

(assert (= (and b!214903 res!105143) b!214904))

(assert (= (and b!214904 res!105144) b!214905))

(declare-fun m!241833 () Bool)

(assert (=> d!58235 m!241833))

(declare-fun m!241835 () Bool)

(assert (=> b!214903 m!241835))

(declare-fun m!241837 () Bool)

(assert (=> b!214904 m!241837))

(declare-fun m!241839 () Bool)

(assert (=> b!214905 m!241839))

(assert (=> start!21400 d!58235))

(declare-fun d!58237 () Bool)

(assert (=> d!58237 (= (array_inv!3221 (_keys!6062 thiss!1504)) (bvsge (size!5229 (_keys!6062 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214849 d!58237))

(declare-fun d!58239 () Bool)

(assert (=> d!58239 (= (array_inv!3222 (_values!4021 thiss!1504)) (bvsge (size!5228 (_values!4021 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214849 d!58239))

(declare-fun b!214918 () Bool)

(declare-fun c!36095 () Bool)

(declare-fun lt!110691 () (_ BitVec 64))

(assert (=> b!214918 (= c!36095 (= lt!110691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139791 () SeekEntryResult!724)

(declare-fun e!139789 () SeekEntryResult!724)

(assert (=> b!214918 (= e!139791 e!139789)))

(declare-fun b!214919 () Bool)

(declare-fun lt!110692 () SeekEntryResult!724)

(assert (=> b!214919 (= e!139789 (MissingZero!724 (index!5068 lt!110692)))))

(declare-fun b!214920 () Bool)

(declare-fun e!139790 () SeekEntryResult!724)

(assert (=> b!214920 (= e!139790 Undefined!724)))

(declare-fun b!214921 () Bool)

(assert (=> b!214921 (= e!139791 (Found!724 (index!5068 lt!110692)))))

(declare-fun d!58241 () Bool)

(declare-fun lt!110693 () SeekEntryResult!724)

(assert (=> d!58241 (and (or ((_ is Undefined!724) lt!110693) (not ((_ is Found!724) lt!110693)) (and (bvsge (index!5067 lt!110693) #b00000000000000000000000000000000) (bvslt (index!5067 lt!110693) (size!5229 (_keys!6062 thiss!1504))))) (or ((_ is Undefined!724) lt!110693) ((_ is Found!724) lt!110693) (not ((_ is MissingZero!724) lt!110693)) (and (bvsge (index!5066 lt!110693) #b00000000000000000000000000000000) (bvslt (index!5066 lt!110693) (size!5229 (_keys!6062 thiss!1504))))) (or ((_ is Undefined!724) lt!110693) ((_ is Found!724) lt!110693) ((_ is MissingZero!724) lt!110693) (not ((_ is MissingVacant!724) lt!110693)) (and (bvsge (index!5069 lt!110693) #b00000000000000000000000000000000) (bvslt (index!5069 lt!110693) (size!5229 (_keys!6062 thiss!1504))))) (or ((_ is Undefined!724) lt!110693) (ite ((_ is Found!724) lt!110693) (= (select (arr!4900 (_keys!6062 thiss!1504)) (index!5067 lt!110693)) key!932) (ite ((_ is MissingZero!724) lt!110693) (= (select (arr!4900 (_keys!6062 thiss!1504)) (index!5066 lt!110693)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!724) lt!110693) (= (select (arr!4900 (_keys!6062 thiss!1504)) (index!5069 lt!110693)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58241 (= lt!110693 e!139790)))

(declare-fun c!36096 () Bool)

(assert (=> d!58241 (= c!36096 (and ((_ is Intermediate!724) lt!110692) (undefined!1536 lt!110692)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10341 (_ BitVec 32)) SeekEntryResult!724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58241 (= lt!110692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9719 thiss!1504)) key!932 (_keys!6062 thiss!1504) (mask!9719 thiss!1504)))))

(assert (=> d!58241 (validMask!0 (mask!9719 thiss!1504))))

(assert (=> d!58241 (= (seekEntryOrOpen!0 key!932 (_keys!6062 thiss!1504) (mask!9719 thiss!1504)) lt!110693)))

(declare-fun b!214922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10341 (_ BitVec 32)) SeekEntryResult!724)

(assert (=> b!214922 (= e!139789 (seekKeyOrZeroReturnVacant!0 (x!22439 lt!110692) (index!5068 lt!110692) (index!5068 lt!110692) key!932 (_keys!6062 thiss!1504) (mask!9719 thiss!1504)))))

(declare-fun b!214923 () Bool)

(assert (=> b!214923 (= e!139790 e!139791)))

(assert (=> b!214923 (= lt!110691 (select (arr!4900 (_keys!6062 thiss!1504)) (index!5068 lt!110692)))))

(declare-fun c!36094 () Bool)

(assert (=> b!214923 (= c!36094 (= lt!110691 key!932))))

(assert (= (and d!58241 c!36096) b!214920))

(assert (= (and d!58241 (not c!36096)) b!214923))

(assert (= (and b!214923 c!36094) b!214921))

(assert (= (and b!214923 (not c!36094)) b!214918))

(assert (= (and b!214918 c!36095) b!214919))

(assert (= (and b!214918 (not c!36095)) b!214922))

(declare-fun m!241841 () Bool)

(assert (=> d!58241 m!241841))

(declare-fun m!241843 () Bool)

(assert (=> d!58241 m!241843))

(assert (=> d!58241 m!241797))

(assert (=> d!58241 m!241841))

(declare-fun m!241845 () Bool)

(assert (=> d!58241 m!241845))

(declare-fun m!241847 () Bool)

(assert (=> d!58241 m!241847))

(declare-fun m!241849 () Bool)

(assert (=> d!58241 m!241849))

(declare-fun m!241851 () Bool)

(assert (=> b!214922 m!241851))

(declare-fun m!241853 () Bool)

(assert (=> b!214923 m!241853))

(assert (=> b!214850 d!58241))

(declare-fun d!58243 () Bool)

(assert (=> d!58243 (= (validMask!0 (mask!9719 thiss!1504)) (and (or (= (mask!9719 thiss!1504) #b00000000000000000000000000000111) (= (mask!9719 thiss!1504) #b00000000000000000000000000001111) (= (mask!9719 thiss!1504) #b00000000000000000000000000011111) (= (mask!9719 thiss!1504) #b00000000000000000000000000111111) (= (mask!9719 thiss!1504) #b00000000000000000000000001111111) (= (mask!9719 thiss!1504) #b00000000000000000000000011111111) (= (mask!9719 thiss!1504) #b00000000000000000000000111111111) (= (mask!9719 thiss!1504) #b00000000000000000000001111111111) (= (mask!9719 thiss!1504) #b00000000000000000000011111111111) (= (mask!9719 thiss!1504) #b00000000000000000000111111111111) (= (mask!9719 thiss!1504) #b00000000000000000001111111111111) (= (mask!9719 thiss!1504) #b00000000000000000011111111111111) (= (mask!9719 thiss!1504) #b00000000000000000111111111111111) (= (mask!9719 thiss!1504) #b00000000000000001111111111111111) (= (mask!9719 thiss!1504) #b00000000000000011111111111111111) (= (mask!9719 thiss!1504) #b00000000000000111111111111111111) (= (mask!9719 thiss!1504) #b00000000000001111111111111111111) (= (mask!9719 thiss!1504) #b00000000000011111111111111111111) (= (mask!9719 thiss!1504) #b00000000000111111111111111111111) (= (mask!9719 thiss!1504) #b00000000001111111111111111111111) (= (mask!9719 thiss!1504) #b00000000011111111111111111111111) (= (mask!9719 thiss!1504) #b00000000111111111111111111111111) (= (mask!9719 thiss!1504) #b00000001111111111111111111111111) (= (mask!9719 thiss!1504) #b00000011111111111111111111111111) (= (mask!9719 thiss!1504) #b00000111111111111111111111111111) (= (mask!9719 thiss!1504) #b00001111111111111111111111111111) (= (mask!9719 thiss!1504) #b00011111111111111111111111111111) (= (mask!9719 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9719 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214854 d!58243))

(declare-fun b!214931 () Bool)

(declare-fun e!139797 () Bool)

(assert (=> b!214931 (= e!139797 tp_is_empty!5563)))

(declare-fun b!214930 () Bool)

(declare-fun e!139796 () Bool)

(assert (=> b!214930 (= e!139796 tp_is_empty!5563)))

(declare-fun mapIsEmpty!9485 () Bool)

(declare-fun mapRes!9485 () Bool)

(assert (=> mapIsEmpty!9485 mapRes!9485))

(declare-fun mapNonEmpty!9485 () Bool)

(declare-fun tp!20222 () Bool)

(assert (=> mapNonEmpty!9485 (= mapRes!9485 (and tp!20222 e!139796))))

(declare-fun mapValue!9485 () ValueCell!2438)

(declare-fun mapKey!9485 () (_ BitVec 32))

(declare-fun mapRest!9485 () (Array (_ BitVec 32) ValueCell!2438))

(assert (=> mapNonEmpty!9485 (= mapRest!9476 (store mapRest!9485 mapKey!9485 mapValue!9485))))

(declare-fun condMapEmpty!9485 () Bool)

(declare-fun mapDefault!9485 () ValueCell!2438)

(assert (=> mapNonEmpty!9476 (= condMapEmpty!9485 (= mapRest!9476 ((as const (Array (_ BitVec 32) ValueCell!2438)) mapDefault!9485)))))

(assert (=> mapNonEmpty!9476 (= tp!20206 (and e!139797 mapRes!9485))))

(assert (= (and mapNonEmpty!9476 condMapEmpty!9485) mapIsEmpty!9485))

(assert (= (and mapNonEmpty!9476 (not condMapEmpty!9485)) mapNonEmpty!9485))

(assert (= (and mapNonEmpty!9485 ((_ is ValueCellFull!2438) mapValue!9485)) b!214930))

(assert (= (and mapNonEmpty!9476 ((_ is ValueCellFull!2438) mapDefault!9485)) b!214931))

(declare-fun m!241855 () Bool)

(assert (=> mapNonEmpty!9485 m!241855))

(check-sat (not d!58235) (not b!214922) (not d!58241) (not b!214904) tp_is_empty!5563 (not b!214903) (not mapNonEmpty!9485) b_and!12565 (not b_next!5701) (not b!214905))
(check-sat b_and!12565 (not b_next!5701))
