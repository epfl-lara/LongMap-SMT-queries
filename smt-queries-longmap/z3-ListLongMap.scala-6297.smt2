; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80506 () Bool)

(assert start!80506)

(declare-fun b!945316 () Bool)

(declare-fun b_free!18103 () Bool)

(declare-fun b_next!18103 () Bool)

(assert (=> b!945316 (= b_free!18103 (not b_next!18103))))

(declare-fun tp!62831 () Bool)

(declare-fun b_and!29499 () Bool)

(assert (=> b!945316 (= tp!62831 b_and!29499)))

(declare-fun e!531706 () Bool)

(declare-fun e!531703 () Bool)

(declare-datatypes ((V!32447 0))(
  ( (V!32448 (val!10356 Int)) )
))
(declare-datatypes ((ValueCell!9824 0))(
  ( (ValueCellFull!9824 (v!12889 V!32447)) (EmptyCell!9824) )
))
(declare-datatypes ((array!57161 0))(
  ( (array!57162 (arr!27503 (Array (_ BitVec 32) ValueCell!9824)) (size!27973 (_ BitVec 32))) )
))
(declare-datatypes ((array!57163 0))(
  ( (array!57164 (arr!27504 (Array (_ BitVec 32) (_ BitVec 64))) (size!27974 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4798 0))(
  ( (LongMapFixedSize!4799 (defaultEntry!5696 Int) (mask!27360 (_ BitVec 32)) (extraKeys!5428 (_ BitVec 32)) (zeroValue!5532 V!32447) (minValue!5532 V!32447) (_size!2454 (_ BitVec 32)) (_keys!10572 array!57163) (_values!5719 array!57161) (_vacant!2454 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4798)

(declare-fun tp_is_empty!20611 () Bool)

(declare-fun array_inv!21418 (array!57163) Bool)

(declare-fun array_inv!21419 (array!57161) Bool)

(assert (=> b!945316 (= e!531706 (and tp!62831 tp_is_empty!20611 (array_inv!21418 (_keys!10572 thiss!1141)) (array_inv!21419 (_values!5719 thiss!1141)) e!531703))))

(declare-fun b!945317 () Bool)

(declare-fun res!634915 () Bool)

(declare-fun e!531701 () Bool)

(assert (=> b!945317 (=> (not res!634915) (not e!531701))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945317 (= res!634915 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945318 () Bool)

(declare-datatypes ((SeekEntryResult!9082 0))(
  ( (MissingZero!9082 (index!38699 (_ BitVec 32))) (Found!9082 (index!38700 (_ BitVec 32))) (Intermediate!9082 (undefined!9894 Bool) (index!38701 (_ BitVec 32)) (x!81240 (_ BitVec 32))) (Undefined!9082) (MissingVacant!9082 (index!38702 (_ BitVec 32))) )
))
(declare-fun lt!425812 () SeekEntryResult!9082)

(get-info :version)

(assert (=> b!945318 (= e!531701 (and ((_ is Found!9082) lt!425812) (bvsge (index!38700 lt!425812) #b00000000000000000000000000000000) (bvsge (index!38700 lt!425812) (size!27974 (_keys!10572 thiss!1141)))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57163 (_ BitVec 32)) SeekEntryResult!9082)

(assert (=> b!945318 (= lt!425812 (seekEntry!0 key!756 (_keys!10572 thiss!1141) (mask!27360 thiss!1141)))))

(declare-fun res!634914 () Bool)

(assert (=> start!80506 (=> (not res!634914) (not e!531701))))

(declare-fun valid!1834 (LongMapFixedSize!4798) Bool)

(assert (=> start!80506 (= res!634914 (valid!1834 thiss!1141))))

(assert (=> start!80506 e!531701))

(assert (=> start!80506 e!531706))

(assert (=> start!80506 true))

(declare-fun b!945319 () Bool)

(declare-fun e!531704 () Bool)

(declare-fun mapRes!32753 () Bool)

(assert (=> b!945319 (= e!531703 (and e!531704 mapRes!32753))))

(declare-fun condMapEmpty!32753 () Bool)

(declare-fun mapDefault!32753 () ValueCell!9824)

(assert (=> b!945319 (= condMapEmpty!32753 (= (arr!27503 (_values!5719 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9824)) mapDefault!32753)))))

(declare-fun b!945320 () Bool)

(assert (=> b!945320 (= e!531704 tp_is_empty!20611)))

(declare-fun b!945321 () Bool)

(declare-fun e!531702 () Bool)

(assert (=> b!945321 (= e!531702 tp_is_empty!20611)))

(declare-fun mapNonEmpty!32753 () Bool)

(declare-fun tp!62830 () Bool)

(assert (=> mapNonEmpty!32753 (= mapRes!32753 (and tp!62830 e!531702))))

(declare-fun mapKey!32753 () (_ BitVec 32))

(declare-fun mapValue!32753 () ValueCell!9824)

(declare-fun mapRest!32753 () (Array (_ BitVec 32) ValueCell!9824))

(assert (=> mapNonEmpty!32753 (= (arr!27503 (_values!5719 thiss!1141)) (store mapRest!32753 mapKey!32753 mapValue!32753))))

(declare-fun mapIsEmpty!32753 () Bool)

(assert (=> mapIsEmpty!32753 mapRes!32753))

(assert (= (and start!80506 res!634914) b!945317))

(assert (= (and b!945317 res!634915) b!945318))

(assert (= (and b!945319 condMapEmpty!32753) mapIsEmpty!32753))

(assert (= (and b!945319 (not condMapEmpty!32753)) mapNonEmpty!32753))

(assert (= (and mapNonEmpty!32753 ((_ is ValueCellFull!9824) mapValue!32753)) b!945321))

(assert (= (and b!945319 ((_ is ValueCellFull!9824) mapDefault!32753)) b!945320))

(assert (= b!945316 b!945319))

(assert (= start!80506 b!945316))

(declare-fun m!878561 () Bool)

(assert (=> b!945316 m!878561))

(declare-fun m!878563 () Bool)

(assert (=> b!945316 m!878563))

(declare-fun m!878565 () Bool)

(assert (=> b!945318 m!878565))

(declare-fun m!878567 () Bool)

(assert (=> start!80506 m!878567))

(declare-fun m!878569 () Bool)

(assert (=> mapNonEmpty!32753 m!878569))

(check-sat (not mapNonEmpty!32753) (not b!945316) (not b!945318) (not b_next!18103) b_and!29499 tp_is_empty!20611 (not start!80506))
(check-sat b_and!29499 (not b_next!18103))
(get-model)

(declare-fun d!114217 () Bool)

(declare-fun res!634934 () Bool)

(declare-fun e!531745 () Bool)

(assert (=> d!114217 (=> (not res!634934) (not e!531745))))

(declare-fun simpleValid!352 (LongMapFixedSize!4798) Bool)

(assert (=> d!114217 (= res!634934 (simpleValid!352 thiss!1141))))

(assert (=> d!114217 (= (valid!1834 thiss!1141) e!531745)))

(declare-fun b!945364 () Bool)

(declare-fun res!634935 () Bool)

(assert (=> b!945364 (=> (not res!634935) (not e!531745))))

(declare-fun arrayCountValidKeys!0 (array!57163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945364 (= res!634935 (= (arrayCountValidKeys!0 (_keys!10572 thiss!1141) #b00000000000000000000000000000000 (size!27974 (_keys!10572 thiss!1141))) (_size!2454 thiss!1141)))))

(declare-fun b!945365 () Bool)

(declare-fun res!634936 () Bool)

(assert (=> b!945365 (=> (not res!634936) (not e!531745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57163 (_ BitVec 32)) Bool)

(assert (=> b!945365 (= res!634936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10572 thiss!1141) (mask!27360 thiss!1141)))))

(declare-fun b!945366 () Bool)

(declare-datatypes ((List!19297 0))(
  ( (Nil!19294) (Cons!19293 (h!20444 (_ BitVec 64)) (t!27609 List!19297)) )
))
(declare-fun arrayNoDuplicates!0 (array!57163 (_ BitVec 32) List!19297) Bool)

(assert (=> b!945366 (= e!531745 (arrayNoDuplicates!0 (_keys!10572 thiss!1141) #b00000000000000000000000000000000 Nil!19294))))

(assert (= (and d!114217 res!634934) b!945364))

(assert (= (and b!945364 res!634935) b!945365))

(assert (= (and b!945365 res!634936) b!945366))

(declare-fun m!878591 () Bool)

(assert (=> d!114217 m!878591))

(declare-fun m!878593 () Bool)

(assert (=> b!945364 m!878593))

(declare-fun m!878595 () Bool)

(assert (=> b!945365 m!878595))

(declare-fun m!878597 () Bool)

(assert (=> b!945366 m!878597))

(assert (=> start!80506 d!114217))

(declare-fun d!114219 () Bool)

(assert (=> d!114219 (= (array_inv!21418 (_keys!10572 thiss!1141)) (bvsge (size!27974 (_keys!10572 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945316 d!114219))

(declare-fun d!114221 () Bool)

(assert (=> d!114221 (= (array_inv!21419 (_values!5719 thiss!1141)) (bvsge (size!27973 (_values!5719 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945316 d!114221))

(declare-fun b!945379 () Bool)

(declare-fun e!531752 () SeekEntryResult!9082)

(declare-fun lt!425830 () SeekEntryResult!9082)

(assert (=> b!945379 (= e!531752 (MissingZero!9082 (index!38701 lt!425830)))))

(declare-fun b!945380 () Bool)

(declare-fun e!531753 () SeekEntryResult!9082)

(assert (=> b!945380 (= e!531753 Undefined!9082)))

(declare-fun d!114223 () Bool)

(declare-fun lt!425827 () SeekEntryResult!9082)

(assert (=> d!114223 (and (or ((_ is MissingVacant!9082) lt!425827) (not ((_ is Found!9082) lt!425827)) (and (bvsge (index!38700 lt!425827) #b00000000000000000000000000000000) (bvslt (index!38700 lt!425827) (size!27974 (_keys!10572 thiss!1141))))) (not ((_ is MissingVacant!9082) lt!425827)) (or (not ((_ is Found!9082) lt!425827)) (= (select (arr!27504 (_keys!10572 thiss!1141)) (index!38700 lt!425827)) key!756)))))

(assert (=> d!114223 (= lt!425827 e!531753)))

(declare-fun c!98372 () Bool)

(assert (=> d!114223 (= c!98372 (and ((_ is Intermediate!9082) lt!425830) (undefined!9894 lt!425830)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57163 (_ BitVec 32)) SeekEntryResult!9082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114223 (= lt!425830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27360 thiss!1141)) key!756 (_keys!10572 thiss!1141) (mask!27360 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114223 (validMask!0 (mask!27360 thiss!1141))))

(assert (=> d!114223 (= (seekEntry!0 key!756 (_keys!10572 thiss!1141) (mask!27360 thiss!1141)) lt!425827)))

(declare-fun b!945381 () Bool)

(declare-fun e!531754 () SeekEntryResult!9082)

(assert (=> b!945381 (= e!531754 (Found!9082 (index!38701 lt!425830)))))

(declare-fun b!945382 () Bool)

(declare-fun lt!425828 () SeekEntryResult!9082)

(assert (=> b!945382 (= e!531752 (ite ((_ is MissingVacant!9082) lt!425828) (MissingZero!9082 (index!38702 lt!425828)) lt!425828))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57163 (_ BitVec 32)) SeekEntryResult!9082)

(assert (=> b!945382 (= lt!425828 (seekKeyOrZeroReturnVacant!0 (x!81240 lt!425830) (index!38701 lt!425830) (index!38701 lt!425830) key!756 (_keys!10572 thiss!1141) (mask!27360 thiss!1141)))))

(declare-fun b!945383 () Bool)

(declare-fun c!98371 () Bool)

(declare-fun lt!425829 () (_ BitVec 64))

(assert (=> b!945383 (= c!98371 (= lt!425829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945383 (= e!531754 e!531752)))

(declare-fun b!945384 () Bool)

(assert (=> b!945384 (= e!531753 e!531754)))

(assert (=> b!945384 (= lt!425829 (select (arr!27504 (_keys!10572 thiss!1141)) (index!38701 lt!425830)))))

(declare-fun c!98373 () Bool)

(assert (=> b!945384 (= c!98373 (= lt!425829 key!756))))

(assert (= (and d!114223 c!98372) b!945380))

(assert (= (and d!114223 (not c!98372)) b!945384))

(assert (= (and b!945384 c!98373) b!945381))

(assert (= (and b!945384 (not c!98373)) b!945383))

(assert (= (and b!945383 c!98371) b!945379))

(assert (= (and b!945383 (not c!98371)) b!945382))

(declare-fun m!878599 () Bool)

(assert (=> d!114223 m!878599))

(declare-fun m!878601 () Bool)

(assert (=> d!114223 m!878601))

(assert (=> d!114223 m!878601))

(declare-fun m!878603 () Bool)

(assert (=> d!114223 m!878603))

(declare-fun m!878605 () Bool)

(assert (=> d!114223 m!878605))

(declare-fun m!878607 () Bool)

(assert (=> b!945382 m!878607))

(declare-fun m!878609 () Bool)

(assert (=> b!945384 m!878609))

(assert (=> b!945318 d!114223))

(declare-fun mapNonEmpty!32762 () Bool)

(declare-fun mapRes!32762 () Bool)

(declare-fun tp!62846 () Bool)

(declare-fun e!531759 () Bool)

(assert (=> mapNonEmpty!32762 (= mapRes!32762 (and tp!62846 e!531759))))

(declare-fun mapKey!32762 () (_ BitVec 32))

(declare-fun mapValue!32762 () ValueCell!9824)

(declare-fun mapRest!32762 () (Array (_ BitVec 32) ValueCell!9824))

(assert (=> mapNonEmpty!32762 (= mapRest!32753 (store mapRest!32762 mapKey!32762 mapValue!32762))))

(declare-fun condMapEmpty!32762 () Bool)

(declare-fun mapDefault!32762 () ValueCell!9824)

(assert (=> mapNonEmpty!32753 (= condMapEmpty!32762 (= mapRest!32753 ((as const (Array (_ BitVec 32) ValueCell!9824)) mapDefault!32762)))))

(declare-fun e!531760 () Bool)

(assert (=> mapNonEmpty!32753 (= tp!62830 (and e!531760 mapRes!32762))))

(declare-fun mapIsEmpty!32762 () Bool)

(assert (=> mapIsEmpty!32762 mapRes!32762))

(declare-fun b!945392 () Bool)

(assert (=> b!945392 (= e!531760 tp_is_empty!20611)))

(declare-fun b!945391 () Bool)

(assert (=> b!945391 (= e!531759 tp_is_empty!20611)))

(assert (= (and mapNonEmpty!32753 condMapEmpty!32762) mapIsEmpty!32762))

(assert (= (and mapNonEmpty!32753 (not condMapEmpty!32762)) mapNonEmpty!32762))

(assert (= (and mapNonEmpty!32762 ((_ is ValueCellFull!9824) mapValue!32762)) b!945391))

(assert (= (and mapNonEmpty!32753 ((_ is ValueCellFull!9824) mapDefault!32762)) b!945392))

(declare-fun m!878611 () Bool)

(assert (=> mapNonEmpty!32762 m!878611))

(check-sat (not mapNonEmpty!32762) (not d!114217) (not b_next!18103) (not b!945382) b_and!29499 tp_is_empty!20611 (not d!114223) (not b!945366) (not b!945364) (not b!945365))
(check-sat b_and!29499 (not b_next!18103))
