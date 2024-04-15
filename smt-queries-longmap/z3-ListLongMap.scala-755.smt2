; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17700 () Bool)

(assert start!17700)

(declare-fun b!176781 () Bool)

(declare-fun b_free!4369 () Bool)

(declare-fun b_next!4369 () Bool)

(assert (=> b!176781 (= b_free!4369 (not b_next!4369))))

(declare-fun tp!15804 () Bool)

(declare-fun b_and!10841 () Bool)

(assert (=> b!176781 (= tp!15804 b_and!10841)))

(declare-fun b!176777 () Bool)

(declare-fun e!116585 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176777 (= e!116585 (not (validKeyInArray!0 key!828)))))

(declare-fun b!176778 () Bool)

(declare-fun res!83766 () Bool)

(assert (=> b!176778 (=> (not res!83766) (not e!116585))))

(declare-datatypes ((V!5169 0))(
  ( (V!5170 (val!2115 Int)) )
))
(declare-datatypes ((ValueCell!1727 0))(
  ( (ValueCellFull!1727 (v!3988 V!5169)) (EmptyCell!1727) )
))
(declare-datatypes ((array!7411 0))(
  ( (array!7412 (arr!3514 (Array (_ BitVec 32) (_ BitVec 64))) (size!3819 (_ BitVec 32))) )
))
(declare-datatypes ((array!7413 0))(
  ( (array!7414 (arr!3515 (Array (_ BitVec 32) ValueCell!1727)) (size!3820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2362 0))(
  ( (LongMapFixedSize!2363 (defaultEntry!3643 Int) (mask!8571 (_ BitVec 32)) (extraKeys!3380 (_ BitVec 32)) (zeroValue!3484 V!5169) (minValue!3484 V!5169) (_size!1230 (_ BitVec 32)) (_keys!5507 array!7411) (_values!3626 array!7413) (_vacant!1230 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2362)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7411 (_ BitVec 32)) Bool)

(assert (=> b!176778 (= res!83766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5507 thiss!1248) (mask!8571 thiss!1248)))))

(declare-fun res!83770 () Bool)

(assert (=> start!17700 (=> (not res!83770) (not e!116585))))

(declare-fun valid!1010 (LongMapFixedSize!2362) Bool)

(assert (=> start!17700 (= res!83770 (valid!1010 thiss!1248))))

(assert (=> start!17700 e!116585))

(declare-fun e!116588 () Bool)

(assert (=> start!17700 e!116588))

(assert (=> start!17700 true))

(declare-fun mapIsEmpty!7071 () Bool)

(declare-fun mapRes!7071 () Bool)

(assert (=> mapIsEmpty!7071 mapRes!7071))

(declare-fun b!176779 () Bool)

(declare-fun res!83769 () Bool)

(assert (=> b!176779 (=> (not res!83769) (not e!116585))))

(declare-datatypes ((tuple2!3278 0))(
  ( (tuple2!3279 (_1!1650 (_ BitVec 64)) (_2!1650 V!5169)) )
))
(declare-datatypes ((List!2247 0))(
  ( (Nil!2244) (Cons!2243 (h!2864 tuple2!3278) (t!7066 List!2247)) )
))
(declare-datatypes ((ListLongMap!2197 0))(
  ( (ListLongMap!2198 (toList!1114 List!2247)) )
))
(declare-fun contains!1184 (ListLongMap!2197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!750 (array!7411 array!7413 (_ BitVec 32) (_ BitVec 32) V!5169 V!5169 (_ BitVec 32) Int) ListLongMap!2197)

(assert (=> b!176779 (= res!83769 (contains!1184 (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)) key!828))))

(declare-fun b!176780 () Bool)

(declare-fun res!83771 () Bool)

(assert (=> b!176780 (=> (not res!83771) (not e!116585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176780 (= res!83771 (validMask!0 (mask!8571 thiss!1248)))))

(declare-fun tp_is_empty!4141 () Bool)

(declare-fun e!116589 () Bool)

(declare-fun array_inv!2269 (array!7411) Bool)

(declare-fun array_inv!2270 (array!7413) Bool)

(assert (=> b!176781 (= e!116588 (and tp!15804 tp_is_empty!4141 (array_inv!2269 (_keys!5507 thiss!1248)) (array_inv!2270 (_values!3626 thiss!1248)) e!116589))))

(declare-fun mapNonEmpty!7071 () Bool)

(declare-fun tp!15803 () Bool)

(declare-fun e!116586 () Bool)

(assert (=> mapNonEmpty!7071 (= mapRes!7071 (and tp!15803 e!116586))))

(declare-fun mapValue!7071 () ValueCell!1727)

(declare-fun mapRest!7071 () (Array (_ BitVec 32) ValueCell!1727))

(declare-fun mapKey!7071 () (_ BitVec 32))

(assert (=> mapNonEmpty!7071 (= (arr!3515 (_values!3626 thiss!1248)) (store mapRest!7071 mapKey!7071 mapValue!7071))))

(declare-fun b!176782 () Bool)

(declare-fun res!83768 () Bool)

(assert (=> b!176782 (=> (not res!83768) (not e!116585))))

(declare-datatypes ((List!2248 0))(
  ( (Nil!2245) (Cons!2244 (h!2865 (_ BitVec 64)) (t!7067 List!2248)) )
))
(declare-fun arrayNoDuplicates!0 (array!7411 (_ BitVec 32) List!2248) Bool)

(assert (=> b!176782 (= res!83768 (arrayNoDuplicates!0 (_keys!5507 thiss!1248) #b00000000000000000000000000000000 Nil!2245))))

(declare-fun b!176783 () Bool)

(declare-fun res!83772 () Bool)

(assert (=> b!176783 (=> (not res!83772) (not e!116585))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!573 0))(
  ( (MissingZero!573 (index!4460 (_ BitVec 32))) (Found!573 (index!4461 (_ BitVec 32))) (Intermediate!573 (undefined!1385 Bool) (index!4462 (_ BitVec 32)) (x!19426 (_ BitVec 32))) (Undefined!573) (MissingVacant!573 (index!4463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7411 (_ BitVec 32)) SeekEntryResult!573)

(assert (=> b!176783 (= res!83772 ((_ is Undefined!573) (seekEntryOrOpen!0 key!828 (_keys!5507 thiss!1248) (mask!8571 thiss!1248))))))

(declare-fun b!176784 () Bool)

(declare-fun e!116587 () Bool)

(assert (=> b!176784 (= e!116589 (and e!116587 mapRes!7071))))

(declare-fun condMapEmpty!7071 () Bool)

(declare-fun mapDefault!7071 () ValueCell!1727)

(assert (=> b!176784 (= condMapEmpty!7071 (= (arr!3515 (_values!3626 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1727)) mapDefault!7071)))))

(declare-fun b!176785 () Bool)

(assert (=> b!176785 (= e!116587 tp_is_empty!4141)))

(declare-fun b!176786 () Bool)

(assert (=> b!176786 (= e!116586 tp_is_empty!4141)))

(declare-fun b!176787 () Bool)

(declare-fun res!83767 () Bool)

(assert (=> b!176787 (=> (not res!83767) (not e!116585))))

(assert (=> b!176787 (= res!83767 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176788 () Bool)

(declare-fun res!83765 () Bool)

(assert (=> b!176788 (=> (not res!83765) (not e!116585))))

(assert (=> b!176788 (= res!83765 (and (= (size!3820 (_values!3626 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8571 thiss!1248))) (= (size!3819 (_keys!5507 thiss!1248)) (size!3820 (_values!3626 thiss!1248))) (bvsge (mask!8571 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3380 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3380 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!17700 res!83770) b!176787))

(assert (= (and b!176787 res!83767) b!176783))

(assert (= (and b!176783 res!83772) b!176779))

(assert (= (and b!176779 res!83769) b!176780))

(assert (= (and b!176780 res!83771) b!176788))

(assert (= (and b!176788 res!83765) b!176778))

(assert (= (and b!176778 res!83766) b!176782))

(assert (= (and b!176782 res!83768) b!176777))

(assert (= (and b!176784 condMapEmpty!7071) mapIsEmpty!7071))

(assert (= (and b!176784 (not condMapEmpty!7071)) mapNonEmpty!7071))

(assert (= (and mapNonEmpty!7071 ((_ is ValueCellFull!1727) mapValue!7071)) b!176786))

(assert (= (and b!176784 ((_ is ValueCellFull!1727) mapDefault!7071)) b!176785))

(assert (= b!176781 b!176784))

(assert (= start!17700 b!176781))

(declare-fun m!204961 () Bool)

(assert (=> b!176778 m!204961))

(declare-fun m!204963 () Bool)

(assert (=> b!176777 m!204963))

(declare-fun m!204965 () Bool)

(assert (=> b!176782 m!204965))

(declare-fun m!204967 () Bool)

(assert (=> b!176783 m!204967))

(declare-fun m!204969 () Bool)

(assert (=> start!17700 m!204969))

(declare-fun m!204971 () Bool)

(assert (=> mapNonEmpty!7071 m!204971))

(declare-fun m!204973 () Bool)

(assert (=> b!176779 m!204973))

(assert (=> b!176779 m!204973))

(declare-fun m!204975 () Bool)

(assert (=> b!176779 m!204975))

(declare-fun m!204977 () Bool)

(assert (=> b!176781 m!204977))

(declare-fun m!204979 () Bool)

(assert (=> b!176781 m!204979))

(declare-fun m!204981 () Bool)

(assert (=> b!176780 m!204981))

(check-sat (not b_next!4369) (not b!176777) (not b!176783) (not mapNonEmpty!7071) tp_is_empty!4141 b_and!10841 (not start!17700) (not b!176782) (not b!176779) (not b!176780) (not b!176778) (not b!176781))
(check-sat b_and!10841 (not b_next!4369))
(get-model)

(declare-fun d!53561 () Bool)

(assert (=> d!53561 (= (array_inv!2269 (_keys!5507 thiss!1248)) (bvsge (size!3819 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176781 d!53561))

(declare-fun d!53563 () Bool)

(assert (=> d!53563 (= (array_inv!2270 (_values!3626 thiss!1248)) (bvsge (size!3820 (_values!3626 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176781 d!53563))

(declare-fun d!53565 () Bool)

(assert (=> d!53565 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176777 d!53565))

(declare-fun d!53567 () Bool)

(declare-fun res!83827 () Bool)

(declare-fun e!116628 () Bool)

(assert (=> d!53567 (=> (not res!83827) (not e!116628))))

(declare-fun simpleValid!153 (LongMapFixedSize!2362) Bool)

(assert (=> d!53567 (= res!83827 (simpleValid!153 thiss!1248))))

(assert (=> d!53567 (= (valid!1010 thiss!1248) e!116628)))

(declare-fun b!176867 () Bool)

(declare-fun res!83828 () Bool)

(assert (=> b!176867 (=> (not res!83828) (not e!116628))))

(declare-fun arrayCountValidKeys!0 (array!7411 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176867 (= res!83828 (= (arrayCountValidKeys!0 (_keys!5507 thiss!1248) #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))) (_size!1230 thiss!1248)))))

(declare-fun b!176868 () Bool)

(declare-fun res!83829 () Bool)

(assert (=> b!176868 (=> (not res!83829) (not e!116628))))

(assert (=> b!176868 (= res!83829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5507 thiss!1248) (mask!8571 thiss!1248)))))

(declare-fun b!176869 () Bool)

(assert (=> b!176869 (= e!116628 (arrayNoDuplicates!0 (_keys!5507 thiss!1248) #b00000000000000000000000000000000 Nil!2245))))

(assert (= (and d!53567 res!83827) b!176867))

(assert (= (and b!176867 res!83828) b!176868))

(assert (= (and b!176868 res!83829) b!176869))

(declare-fun m!205027 () Bool)

(assert (=> d!53567 m!205027))

(declare-fun m!205029 () Bool)

(assert (=> b!176867 m!205029))

(assert (=> b!176868 m!204961))

(assert (=> b!176869 m!204965))

(assert (=> start!17700 d!53567))

(declare-fun d!53569 () Bool)

(assert (=> d!53569 (= (validMask!0 (mask!8571 thiss!1248)) (and (or (= (mask!8571 thiss!1248) #b00000000000000000000000000000111) (= (mask!8571 thiss!1248) #b00000000000000000000000000001111) (= (mask!8571 thiss!1248) #b00000000000000000000000000011111) (= (mask!8571 thiss!1248) #b00000000000000000000000000111111) (= (mask!8571 thiss!1248) #b00000000000000000000000001111111) (= (mask!8571 thiss!1248) #b00000000000000000000000011111111) (= (mask!8571 thiss!1248) #b00000000000000000000000111111111) (= (mask!8571 thiss!1248) #b00000000000000000000001111111111) (= (mask!8571 thiss!1248) #b00000000000000000000011111111111) (= (mask!8571 thiss!1248) #b00000000000000000000111111111111) (= (mask!8571 thiss!1248) #b00000000000000000001111111111111) (= (mask!8571 thiss!1248) #b00000000000000000011111111111111) (= (mask!8571 thiss!1248) #b00000000000000000111111111111111) (= (mask!8571 thiss!1248) #b00000000000000001111111111111111) (= (mask!8571 thiss!1248) #b00000000000000011111111111111111) (= (mask!8571 thiss!1248) #b00000000000000111111111111111111) (= (mask!8571 thiss!1248) #b00000000000001111111111111111111) (= (mask!8571 thiss!1248) #b00000000000011111111111111111111) (= (mask!8571 thiss!1248) #b00000000000111111111111111111111) (= (mask!8571 thiss!1248) #b00000000001111111111111111111111) (= (mask!8571 thiss!1248) #b00000000011111111111111111111111) (= (mask!8571 thiss!1248) #b00000000111111111111111111111111) (= (mask!8571 thiss!1248) #b00000001111111111111111111111111) (= (mask!8571 thiss!1248) #b00000011111111111111111111111111) (= (mask!8571 thiss!1248) #b00000111111111111111111111111111) (= (mask!8571 thiss!1248) #b00001111111111111111111111111111) (= (mask!8571 thiss!1248) #b00011111111111111111111111111111) (= (mask!8571 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8571 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176780 d!53569))

(declare-fun d!53571 () Bool)

(declare-fun e!116633 () Bool)

(assert (=> d!53571 e!116633))

(declare-fun res!83832 () Bool)

(assert (=> d!53571 (=> res!83832 e!116633)))

(declare-fun lt!87310 () Bool)

(assert (=> d!53571 (= res!83832 (not lt!87310))))

(declare-fun lt!87309 () Bool)

(assert (=> d!53571 (= lt!87310 lt!87309)))

(declare-datatypes ((Unit!5387 0))(
  ( (Unit!5388) )
))
(declare-fun lt!87308 () Unit!5387)

(declare-fun e!116634 () Unit!5387)

(assert (=> d!53571 (= lt!87308 e!116634)))

(declare-fun c!31673 () Bool)

(assert (=> d!53571 (= c!31673 lt!87309)))

(declare-fun containsKey!196 (List!2247 (_ BitVec 64)) Bool)

(assert (=> d!53571 (= lt!87309 (containsKey!196 (toList!1114 (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828))))

(assert (=> d!53571 (= (contains!1184 (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)) key!828) lt!87310)))

(declare-fun b!176876 () Bool)

(declare-fun lt!87311 () Unit!5387)

(assert (=> b!176876 (= e!116634 lt!87311)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!145 (List!2247 (_ BitVec 64)) Unit!5387)

(assert (=> b!176876 (= lt!87311 (lemmaContainsKeyImpliesGetValueByKeyDefined!145 (toList!1114 (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828))))

(declare-datatypes ((Option!198 0))(
  ( (Some!197 (v!3991 V!5169)) (None!196) )
))
(declare-fun isDefined!146 (Option!198) Bool)

(declare-fun getValueByKey!192 (List!2247 (_ BitVec 64)) Option!198)

(assert (=> b!176876 (isDefined!146 (getValueByKey!192 (toList!1114 (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828))))

(declare-fun b!176877 () Bool)

(declare-fun Unit!5389 () Unit!5387)

(assert (=> b!176877 (= e!116634 Unit!5389)))

(declare-fun b!176878 () Bool)

(assert (=> b!176878 (= e!116633 (isDefined!146 (getValueByKey!192 (toList!1114 (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828)))))

(assert (= (and d!53571 c!31673) b!176876))

(assert (= (and d!53571 (not c!31673)) b!176877))

(assert (= (and d!53571 (not res!83832)) b!176878))

(declare-fun m!205031 () Bool)

(assert (=> d!53571 m!205031))

(declare-fun m!205033 () Bool)

(assert (=> b!176876 m!205033))

(declare-fun m!205035 () Bool)

(assert (=> b!176876 m!205035))

(assert (=> b!176876 m!205035))

(declare-fun m!205037 () Bool)

(assert (=> b!176876 m!205037))

(assert (=> b!176878 m!205035))

(assert (=> b!176878 m!205035))

(assert (=> b!176878 m!205037))

(assert (=> b!176779 d!53571))

(declare-fun b!176921 () Bool)

(declare-fun e!116666 () Bool)

(declare-fun lt!87375 () ListLongMap!2197)

(declare-fun apply!139 (ListLongMap!2197 (_ BitVec 64)) V!5169)

(assert (=> b!176921 (= e!116666 (= (apply!139 lt!87375 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3484 thiss!1248)))))

(declare-fun b!176922 () Bool)

(declare-fun e!116663 () Bool)

(assert (=> b!176922 (= e!116663 (validKeyInArray!0 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176923 () Bool)

(declare-fun e!116661 () Bool)

(declare-fun e!116665 () Bool)

(assert (=> b!176923 (= e!116661 e!116665)))

(declare-fun res!83851 () Bool)

(declare-fun call!17888 () Bool)

(assert (=> b!176923 (= res!83851 call!17888)))

(assert (=> b!176923 (=> (not res!83851) (not e!116665))))

(declare-fun b!176925 () Bool)

(declare-fun c!31691 () Bool)

(assert (=> b!176925 (= c!31691 (and (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116671 () ListLongMap!2197)

(declare-fun e!116664 () ListLongMap!2197)

(assert (=> b!176925 (= e!116671 e!116664)))

(declare-fun b!176926 () Bool)

(declare-fun e!116669 () Bool)

(declare-fun e!116673 () Bool)

(assert (=> b!176926 (= e!116669 e!116673)))

(declare-fun c!31686 () Bool)

(assert (=> b!176926 (= c!31686 (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176927 () Bool)

(declare-fun call!17887 () ListLongMap!2197)

(assert (=> b!176927 (= e!116664 call!17887)))

(declare-fun call!17891 () ListLongMap!2197)

(declare-fun call!17892 () ListLongMap!2197)

(declare-fun c!31690 () Bool)

(declare-fun bm!17884 () Bool)

(declare-fun c!31687 () Bool)

(declare-fun call!17889 () ListLongMap!2197)

(declare-fun +!251 (ListLongMap!2197 tuple2!3278) ListLongMap!2197)

(assert (=> bm!17884 (= call!17892 (+!251 (ite c!31687 call!17889 (ite c!31690 call!17891 call!17887)) (ite (or c!31687 c!31690) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3484 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3484 thiss!1248)))))))

(declare-fun b!176928 () Bool)

(declare-fun res!83859 () Bool)

(assert (=> b!176928 (=> (not res!83859) (not e!116669))))

(declare-fun e!116667 () Bool)

(assert (=> b!176928 (= res!83859 e!116667)))

(declare-fun res!83852 () Bool)

(assert (=> b!176928 (=> res!83852 e!116667)))

(assert (=> b!176928 (= res!83852 (not e!116663))))

(declare-fun res!83858 () Bool)

(assert (=> b!176928 (=> (not res!83858) (not e!116663))))

(assert (=> b!176928 (= res!83858 (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))

(declare-fun bm!17885 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!160 (array!7411 array!7413 (_ BitVec 32) (_ BitVec 32) V!5169 V!5169 (_ BitVec 32) Int) ListLongMap!2197)

(assert (=> bm!17885 (= call!17889 (getCurrentListMapNoExtraKeys!160 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun bm!17886 () Bool)

(declare-fun call!17890 () ListLongMap!2197)

(assert (=> bm!17886 (= call!17890 call!17892)))

(declare-fun b!176929 () Bool)

(assert (=> b!176929 (= e!116673 e!116666)))

(declare-fun res!83854 () Bool)

(declare-fun call!17893 () Bool)

(assert (=> b!176929 (= res!83854 call!17893)))

(assert (=> b!176929 (=> (not res!83854) (not e!116666))))

(declare-fun b!176930 () Bool)

(declare-fun e!116672 () ListLongMap!2197)

(assert (=> b!176930 (= e!116672 e!116671)))

(assert (=> b!176930 (= c!31690 (and (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176931 () Bool)

(declare-fun e!116670 () Bool)

(declare-fun get!2006 (ValueCell!1727 V!5169) V!5169)

(declare-fun dynLambda!473 (Int (_ BitVec 64)) V!5169)

(assert (=> b!176931 (= e!116670 (= (apply!139 lt!87375 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)) (get!2006 (select (arr!3515 (_values!3626 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3643 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3820 (_values!3626 thiss!1248))))))

(assert (=> b!176931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))

(declare-fun b!176932 () Bool)

(declare-fun e!116662 () Unit!5387)

(declare-fun Unit!5390 () Unit!5387)

(assert (=> b!176932 (= e!116662 Unit!5390)))

(declare-fun b!176933 () Bool)

(assert (=> b!176933 (= e!116672 (+!251 call!17892 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3484 thiss!1248))))))

(declare-fun b!176934 () Bool)

(assert (=> b!176934 (= e!116665 (= (apply!139 lt!87375 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3484 thiss!1248)))))

(declare-fun b!176935 () Bool)

(assert (=> b!176935 (= e!116671 call!17890)))

(declare-fun b!176936 () Bool)

(declare-fun res!83856 () Bool)

(assert (=> b!176936 (=> (not res!83856) (not e!116669))))

(assert (=> b!176936 (= res!83856 e!116661)))

(declare-fun c!31689 () Bool)

(assert (=> b!176936 (= c!31689 (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!53573 () Bool)

(assert (=> d!53573 e!116669))

(declare-fun res!83857 () Bool)

(assert (=> d!53573 (=> (not res!83857) (not e!116669))))

(assert (=> d!53573 (= res!83857 (or (bvsge #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))))

(declare-fun lt!87367 () ListLongMap!2197)

(assert (=> d!53573 (= lt!87375 lt!87367)))

(declare-fun lt!87363 () Unit!5387)

(assert (=> d!53573 (= lt!87363 e!116662)))

(declare-fun c!31688 () Bool)

(declare-fun e!116668 () Bool)

(assert (=> d!53573 (= c!31688 e!116668)))

(declare-fun res!83855 () Bool)

(assert (=> d!53573 (=> (not res!83855) (not e!116668))))

(assert (=> d!53573 (= res!83855 (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))

(assert (=> d!53573 (= lt!87367 e!116672)))

(assert (=> d!53573 (= c!31687 (and (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53573 (validMask!0 (mask!8571 thiss!1248))))

(assert (=> d!53573 (= (getCurrentListMap!750 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)) lt!87375)))

(declare-fun b!176924 () Bool)

(assert (=> b!176924 (= e!116673 (not call!17893))))

(declare-fun b!176937 () Bool)

(assert (=> b!176937 (= e!116661 (not call!17888))))

(declare-fun b!176938 () Bool)

(assert (=> b!176938 (= e!116667 e!116670)))

(declare-fun res!83853 () Bool)

(assert (=> b!176938 (=> (not res!83853) (not e!116670))))

(assert (=> b!176938 (= res!83853 (contains!1184 lt!87375 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))

(declare-fun bm!17887 () Bool)

(assert (=> bm!17887 (= call!17887 call!17891)))

(declare-fun b!176939 () Bool)

(assert (=> b!176939 (= e!116664 call!17890)))

(declare-fun bm!17888 () Bool)

(assert (=> bm!17888 (= call!17891 call!17889)))

(declare-fun b!176940 () Bool)

(assert (=> b!176940 (= e!116668 (validKeyInArray!0 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176941 () Bool)

(declare-fun lt!87371 () Unit!5387)

(assert (=> b!176941 (= e!116662 lt!87371)))

(declare-fun lt!87359 () ListLongMap!2197)

(assert (=> b!176941 (= lt!87359 (getCurrentListMapNoExtraKeys!160 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87366 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87366 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87360 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87360 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87370 () Unit!5387)

(declare-fun addStillContains!115 (ListLongMap!2197 (_ BitVec 64) V!5169 (_ BitVec 64)) Unit!5387)

(assert (=> b!176941 (= lt!87370 (addStillContains!115 lt!87359 lt!87366 (zeroValue!3484 thiss!1248) lt!87360))))

(assert (=> b!176941 (contains!1184 (+!251 lt!87359 (tuple2!3279 lt!87366 (zeroValue!3484 thiss!1248))) lt!87360)))

(declare-fun lt!87373 () Unit!5387)

(assert (=> b!176941 (= lt!87373 lt!87370)))

(declare-fun lt!87374 () ListLongMap!2197)

(assert (=> b!176941 (= lt!87374 (getCurrentListMapNoExtraKeys!160 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87364 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87364 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87368 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87368 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87377 () Unit!5387)

(declare-fun addApplyDifferent!115 (ListLongMap!2197 (_ BitVec 64) V!5169 (_ BitVec 64)) Unit!5387)

(assert (=> b!176941 (= lt!87377 (addApplyDifferent!115 lt!87374 lt!87364 (minValue!3484 thiss!1248) lt!87368))))

(assert (=> b!176941 (= (apply!139 (+!251 lt!87374 (tuple2!3279 lt!87364 (minValue!3484 thiss!1248))) lt!87368) (apply!139 lt!87374 lt!87368))))

(declare-fun lt!87372 () Unit!5387)

(assert (=> b!176941 (= lt!87372 lt!87377)))

(declare-fun lt!87356 () ListLongMap!2197)

(assert (=> b!176941 (= lt!87356 (getCurrentListMapNoExtraKeys!160 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87365 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87376 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87376 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87357 () Unit!5387)

(assert (=> b!176941 (= lt!87357 (addApplyDifferent!115 lt!87356 lt!87365 (zeroValue!3484 thiss!1248) lt!87376))))

(assert (=> b!176941 (= (apply!139 (+!251 lt!87356 (tuple2!3279 lt!87365 (zeroValue!3484 thiss!1248))) lt!87376) (apply!139 lt!87356 lt!87376))))

(declare-fun lt!87358 () Unit!5387)

(assert (=> b!176941 (= lt!87358 lt!87357)))

(declare-fun lt!87361 () ListLongMap!2197)

(assert (=> b!176941 (= lt!87361 (getCurrentListMapNoExtraKeys!160 (_keys!5507 thiss!1248) (_values!3626 thiss!1248) (mask!8571 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87369 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87369 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87362 () (_ BitVec 64))

(assert (=> b!176941 (= lt!87362 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176941 (= lt!87371 (addApplyDifferent!115 lt!87361 lt!87369 (minValue!3484 thiss!1248) lt!87362))))

(assert (=> b!176941 (= (apply!139 (+!251 lt!87361 (tuple2!3279 lt!87369 (minValue!3484 thiss!1248))) lt!87362) (apply!139 lt!87361 lt!87362))))

(declare-fun bm!17889 () Bool)

(assert (=> bm!17889 (= call!17893 (contains!1184 lt!87375 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17890 () Bool)

(assert (=> bm!17890 (= call!17888 (contains!1184 lt!87375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53573 c!31687) b!176933))

(assert (= (and d!53573 (not c!31687)) b!176930))

(assert (= (and b!176930 c!31690) b!176935))

(assert (= (and b!176930 (not c!31690)) b!176925))

(assert (= (and b!176925 c!31691) b!176939))

(assert (= (and b!176925 (not c!31691)) b!176927))

(assert (= (or b!176939 b!176927) bm!17887))

(assert (= (or b!176935 bm!17887) bm!17888))

(assert (= (or b!176935 b!176939) bm!17886))

(assert (= (or b!176933 bm!17888) bm!17885))

(assert (= (or b!176933 bm!17886) bm!17884))

(assert (= (and d!53573 res!83855) b!176940))

(assert (= (and d!53573 c!31688) b!176941))

(assert (= (and d!53573 (not c!31688)) b!176932))

(assert (= (and d!53573 res!83857) b!176928))

(assert (= (and b!176928 res!83858) b!176922))

(assert (= (and b!176928 (not res!83852)) b!176938))

(assert (= (and b!176938 res!83853) b!176931))

(assert (= (and b!176928 res!83859) b!176936))

(assert (= (and b!176936 c!31689) b!176923))

(assert (= (and b!176936 (not c!31689)) b!176937))

(assert (= (and b!176923 res!83851) b!176934))

(assert (= (or b!176923 b!176937) bm!17890))

(assert (= (and b!176936 res!83856) b!176926))

(assert (= (and b!176926 c!31686) b!176929))

(assert (= (and b!176926 (not c!31686)) b!176924))

(assert (= (and b!176929 res!83854) b!176921))

(assert (= (or b!176929 b!176924) bm!17889))

(declare-fun b_lambda!7029 () Bool)

(assert (=> (not b_lambda!7029) (not b!176931)))

(declare-fun t!7073 () Bool)

(declare-fun tb!2781 () Bool)

(assert (=> (and b!176781 (= (defaultEntry!3643 thiss!1248) (defaultEntry!3643 thiss!1248)) t!7073) tb!2781))

(declare-fun result!4633 () Bool)

(assert (=> tb!2781 (= result!4633 tp_is_empty!4141)))

(assert (=> b!176931 t!7073))

(declare-fun b_and!10847 () Bool)

(assert (= b_and!10841 (and (=> t!7073 result!4633) b_and!10847)))

(declare-fun m!205039 () Bool)

(assert (=> b!176933 m!205039))

(declare-fun m!205041 () Bool)

(assert (=> bm!17884 m!205041))

(declare-fun m!205043 () Bool)

(assert (=> b!176931 m!205043))

(declare-fun m!205045 () Bool)

(assert (=> b!176931 m!205045))

(declare-fun m!205047 () Bool)

(assert (=> b!176931 m!205047))

(declare-fun m!205049 () Bool)

(assert (=> b!176931 m!205049))

(declare-fun m!205051 () Bool)

(assert (=> b!176931 m!205051))

(assert (=> b!176931 m!205047))

(assert (=> b!176931 m!205043))

(assert (=> b!176931 m!205049))

(declare-fun m!205053 () Bool)

(assert (=> b!176934 m!205053))

(assert (=> b!176940 m!205043))

(assert (=> b!176940 m!205043))

(declare-fun m!205055 () Bool)

(assert (=> b!176940 m!205055))

(declare-fun m!205057 () Bool)

(assert (=> b!176921 m!205057))

(assert (=> b!176938 m!205043))

(assert (=> b!176938 m!205043))

(declare-fun m!205059 () Bool)

(assert (=> b!176938 m!205059))

(declare-fun m!205061 () Bool)

(assert (=> b!176941 m!205061))

(declare-fun m!205063 () Bool)

(assert (=> b!176941 m!205063))

(declare-fun m!205065 () Bool)

(assert (=> b!176941 m!205065))

(declare-fun m!205067 () Bool)

(assert (=> b!176941 m!205067))

(declare-fun m!205069 () Bool)

(assert (=> b!176941 m!205069))

(declare-fun m!205071 () Bool)

(assert (=> b!176941 m!205071))

(declare-fun m!205073 () Bool)

(assert (=> b!176941 m!205073))

(declare-fun m!205075 () Bool)

(assert (=> b!176941 m!205075))

(declare-fun m!205077 () Bool)

(assert (=> b!176941 m!205077))

(declare-fun m!205079 () Bool)

(assert (=> b!176941 m!205079))

(declare-fun m!205081 () Bool)

(assert (=> b!176941 m!205081))

(assert (=> b!176941 m!205069))

(declare-fun m!205083 () Bool)

(assert (=> b!176941 m!205083))

(assert (=> b!176941 m!205061))

(declare-fun m!205085 () Bool)

(assert (=> b!176941 m!205085))

(declare-fun m!205087 () Bool)

(assert (=> b!176941 m!205087))

(declare-fun m!205089 () Bool)

(assert (=> b!176941 m!205089))

(assert (=> b!176941 m!205043))

(assert (=> b!176941 m!205071))

(declare-fun m!205091 () Bool)

(assert (=> b!176941 m!205091))

(assert (=> b!176941 m!205063))

(assert (=> d!53573 m!204981))

(assert (=> b!176922 m!205043))

(assert (=> b!176922 m!205043))

(assert (=> b!176922 m!205055))

(assert (=> bm!17885 m!205087))

(declare-fun m!205093 () Bool)

(assert (=> bm!17889 m!205093))

(declare-fun m!205095 () Bool)

(assert (=> bm!17890 m!205095))

(assert (=> b!176779 d!53573))

(declare-fun b!176956 () Bool)

(declare-fun e!116680 () SeekEntryResult!573)

(declare-fun lt!87384 () SeekEntryResult!573)

(assert (=> b!176956 (= e!116680 (MissingZero!573 (index!4462 lt!87384)))))

(declare-fun b!176957 () Bool)

(declare-fun e!116681 () SeekEntryResult!573)

(assert (=> b!176957 (= e!116681 Undefined!573)))

(declare-fun b!176959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7411 (_ BitVec 32)) SeekEntryResult!573)

(assert (=> b!176959 (= e!116680 (seekKeyOrZeroReturnVacant!0 (x!19426 lt!87384) (index!4462 lt!87384) (index!4462 lt!87384) key!828 (_keys!5507 thiss!1248) (mask!8571 thiss!1248)))))

(declare-fun b!176960 () Bool)

(declare-fun c!31700 () Bool)

(declare-fun lt!87385 () (_ BitVec 64))

(assert (=> b!176960 (= c!31700 (= lt!87385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116682 () SeekEntryResult!573)

(assert (=> b!176960 (= e!116682 e!116680)))

(declare-fun b!176961 () Bool)

(assert (=> b!176961 (= e!116682 (Found!573 (index!4462 lt!87384)))))

(declare-fun b!176958 () Bool)

(assert (=> b!176958 (= e!116681 e!116682)))

(assert (=> b!176958 (= lt!87385 (select (arr!3514 (_keys!5507 thiss!1248)) (index!4462 lt!87384)))))

(declare-fun c!31698 () Bool)

(assert (=> b!176958 (= c!31698 (= lt!87385 key!828))))

(declare-fun d!53575 () Bool)

(declare-fun lt!87386 () SeekEntryResult!573)

(assert (=> d!53575 (and (or ((_ is Undefined!573) lt!87386) (not ((_ is Found!573) lt!87386)) (and (bvsge (index!4461 lt!87386) #b00000000000000000000000000000000) (bvslt (index!4461 lt!87386) (size!3819 (_keys!5507 thiss!1248))))) (or ((_ is Undefined!573) lt!87386) ((_ is Found!573) lt!87386) (not ((_ is MissingZero!573) lt!87386)) (and (bvsge (index!4460 lt!87386) #b00000000000000000000000000000000) (bvslt (index!4460 lt!87386) (size!3819 (_keys!5507 thiss!1248))))) (or ((_ is Undefined!573) lt!87386) ((_ is Found!573) lt!87386) ((_ is MissingZero!573) lt!87386) (not ((_ is MissingVacant!573) lt!87386)) (and (bvsge (index!4463 lt!87386) #b00000000000000000000000000000000) (bvslt (index!4463 lt!87386) (size!3819 (_keys!5507 thiss!1248))))) (or ((_ is Undefined!573) lt!87386) (ite ((_ is Found!573) lt!87386) (= (select (arr!3514 (_keys!5507 thiss!1248)) (index!4461 lt!87386)) key!828) (ite ((_ is MissingZero!573) lt!87386) (= (select (arr!3514 (_keys!5507 thiss!1248)) (index!4460 lt!87386)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!573) lt!87386) (= (select (arr!3514 (_keys!5507 thiss!1248)) (index!4463 lt!87386)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53575 (= lt!87386 e!116681)))

(declare-fun c!31699 () Bool)

(assert (=> d!53575 (= c!31699 (and ((_ is Intermediate!573) lt!87384) (undefined!1385 lt!87384)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7411 (_ BitVec 32)) SeekEntryResult!573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53575 (= lt!87384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8571 thiss!1248)) key!828 (_keys!5507 thiss!1248) (mask!8571 thiss!1248)))))

(assert (=> d!53575 (validMask!0 (mask!8571 thiss!1248))))

(assert (=> d!53575 (= (seekEntryOrOpen!0 key!828 (_keys!5507 thiss!1248) (mask!8571 thiss!1248)) lt!87386)))

(assert (= (and d!53575 c!31699) b!176957))

(assert (= (and d!53575 (not c!31699)) b!176958))

(assert (= (and b!176958 c!31698) b!176961))

(assert (= (and b!176958 (not c!31698)) b!176960))

(assert (= (and b!176960 c!31700) b!176956))

(assert (= (and b!176960 (not c!31700)) b!176959))

(declare-fun m!205097 () Bool)

(assert (=> b!176959 m!205097))

(declare-fun m!205099 () Bool)

(assert (=> b!176958 m!205099))

(declare-fun m!205101 () Bool)

(assert (=> d!53575 m!205101))

(declare-fun m!205103 () Bool)

(assert (=> d!53575 m!205103))

(declare-fun m!205105 () Bool)

(assert (=> d!53575 m!205105))

(assert (=> d!53575 m!205101))

(declare-fun m!205107 () Bool)

(assert (=> d!53575 m!205107))

(assert (=> d!53575 m!204981))

(declare-fun m!205109 () Bool)

(assert (=> d!53575 m!205109))

(assert (=> b!176783 d!53575))

(declare-fun b!176972 () Bool)

(declare-fun e!116691 () Bool)

(declare-fun e!116693 () Bool)

(assert (=> b!176972 (= e!116691 e!116693)))

(declare-fun res!83867 () Bool)

(assert (=> b!176972 (=> (not res!83867) (not e!116693))))

(declare-fun e!116694 () Bool)

(assert (=> b!176972 (= res!83867 (not e!116694))))

(declare-fun res!83866 () Bool)

(assert (=> b!176972 (=> (not res!83866) (not e!116694))))

(assert (=> b!176972 (= res!83866 (validKeyInArray!0 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176973 () Bool)

(declare-fun e!116692 () Bool)

(declare-fun call!17896 () Bool)

(assert (=> b!176973 (= e!116692 call!17896)))

(declare-fun b!176974 () Bool)

(assert (=> b!176974 (= e!116693 e!116692)))

(declare-fun c!31703 () Bool)

(assert (=> b!176974 (= c!31703 (validKeyInArray!0 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176975 () Bool)

(assert (=> b!176975 (= e!116692 call!17896)))

(declare-fun b!176976 () Bool)

(declare-fun contains!1187 (List!2248 (_ BitVec 64)) Bool)

(assert (=> b!176976 (= e!116694 (contains!1187 Nil!2245 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17893 () Bool)

(assert (=> bm!17893 (= call!17896 (arrayNoDuplicates!0 (_keys!5507 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31703 (Cons!2244 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000) Nil!2245) Nil!2245)))))

(declare-fun d!53577 () Bool)

(declare-fun res!83868 () Bool)

(assert (=> d!53577 (=> res!83868 e!116691)))

(assert (=> d!53577 (= res!83868 (bvsge #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))

(assert (=> d!53577 (= (arrayNoDuplicates!0 (_keys!5507 thiss!1248) #b00000000000000000000000000000000 Nil!2245) e!116691)))

(assert (= (and d!53577 (not res!83868)) b!176972))

(assert (= (and b!176972 res!83866) b!176976))

(assert (= (and b!176972 res!83867) b!176974))

(assert (= (and b!176974 c!31703) b!176973))

(assert (= (and b!176974 (not c!31703)) b!176975))

(assert (= (or b!176973 b!176975) bm!17893))

(assert (=> b!176972 m!205043))

(assert (=> b!176972 m!205043))

(assert (=> b!176972 m!205055))

(assert (=> b!176974 m!205043))

(assert (=> b!176974 m!205043))

(assert (=> b!176974 m!205055))

(assert (=> b!176976 m!205043))

(assert (=> b!176976 m!205043))

(declare-fun m!205111 () Bool)

(assert (=> b!176976 m!205111))

(assert (=> bm!17893 m!205043))

(declare-fun m!205113 () Bool)

(assert (=> bm!17893 m!205113))

(assert (=> b!176782 d!53577))

(declare-fun bm!17896 () Bool)

(declare-fun call!17899 () Bool)

(assert (=> bm!17896 (= call!17899 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5507 thiss!1248) (mask!8571 thiss!1248)))))

(declare-fun b!176985 () Bool)

(declare-fun e!116702 () Bool)

(assert (=> b!176985 (= e!116702 call!17899)))

(declare-fun d!53579 () Bool)

(declare-fun res!83874 () Bool)

(declare-fun e!116701 () Bool)

(assert (=> d!53579 (=> res!83874 e!116701)))

(assert (=> d!53579 (= res!83874 (bvsge #b00000000000000000000000000000000 (size!3819 (_keys!5507 thiss!1248))))))

(assert (=> d!53579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5507 thiss!1248) (mask!8571 thiss!1248)) e!116701)))

(declare-fun b!176986 () Bool)

(declare-fun e!116703 () Bool)

(assert (=> b!176986 (= e!116703 call!17899)))

(declare-fun b!176987 () Bool)

(assert (=> b!176987 (= e!116702 e!116703)))

(declare-fun lt!87395 () (_ BitVec 64))

(assert (=> b!176987 (= lt!87395 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87394 () Unit!5387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7411 (_ BitVec 64) (_ BitVec 32)) Unit!5387)

(assert (=> b!176987 (= lt!87394 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5507 thiss!1248) lt!87395 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176987 (arrayContainsKey!0 (_keys!5507 thiss!1248) lt!87395 #b00000000000000000000000000000000)))

(declare-fun lt!87393 () Unit!5387)

(assert (=> b!176987 (= lt!87393 lt!87394)))

(declare-fun res!83873 () Bool)

(assert (=> b!176987 (= res!83873 (= (seekEntryOrOpen!0 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000) (_keys!5507 thiss!1248) (mask!8571 thiss!1248)) (Found!573 #b00000000000000000000000000000000)))))

(assert (=> b!176987 (=> (not res!83873) (not e!116703))))

(declare-fun b!176988 () Bool)

(assert (=> b!176988 (= e!116701 e!116702)))

(declare-fun c!31706 () Bool)

(assert (=> b!176988 (= c!31706 (validKeyInArray!0 (select (arr!3514 (_keys!5507 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53579 (not res!83874)) b!176988))

(assert (= (and b!176988 c!31706) b!176987))

(assert (= (and b!176988 (not c!31706)) b!176985))

(assert (= (and b!176987 res!83873) b!176986))

(assert (= (or b!176986 b!176985) bm!17896))

(declare-fun m!205115 () Bool)

(assert (=> bm!17896 m!205115))

(assert (=> b!176987 m!205043))

(declare-fun m!205117 () Bool)

(assert (=> b!176987 m!205117))

(declare-fun m!205119 () Bool)

(assert (=> b!176987 m!205119))

(assert (=> b!176987 m!205043))

(declare-fun m!205121 () Bool)

(assert (=> b!176987 m!205121))

(assert (=> b!176988 m!205043))

(assert (=> b!176988 m!205043))

(assert (=> b!176988 m!205055))

(assert (=> b!176778 d!53579))

(declare-fun b!176995 () Bool)

(declare-fun e!116708 () Bool)

(assert (=> b!176995 (= e!116708 tp_is_empty!4141)))

(declare-fun condMapEmpty!7080 () Bool)

(declare-fun mapDefault!7080 () ValueCell!1727)

(assert (=> mapNonEmpty!7071 (= condMapEmpty!7080 (= mapRest!7071 ((as const (Array (_ BitVec 32) ValueCell!1727)) mapDefault!7080)))))

(declare-fun e!116709 () Bool)

(declare-fun mapRes!7080 () Bool)

(assert (=> mapNonEmpty!7071 (= tp!15803 (and e!116709 mapRes!7080))))

(declare-fun mapNonEmpty!7080 () Bool)

(declare-fun tp!15819 () Bool)

(assert (=> mapNonEmpty!7080 (= mapRes!7080 (and tp!15819 e!116708))))

(declare-fun mapRest!7080 () (Array (_ BitVec 32) ValueCell!1727))

(declare-fun mapKey!7080 () (_ BitVec 32))

(declare-fun mapValue!7080 () ValueCell!1727)

(assert (=> mapNonEmpty!7080 (= mapRest!7071 (store mapRest!7080 mapKey!7080 mapValue!7080))))

(declare-fun b!176996 () Bool)

(assert (=> b!176996 (= e!116709 tp_is_empty!4141)))

(declare-fun mapIsEmpty!7080 () Bool)

(assert (=> mapIsEmpty!7080 mapRes!7080))

(assert (= (and mapNonEmpty!7071 condMapEmpty!7080) mapIsEmpty!7080))

(assert (= (and mapNonEmpty!7071 (not condMapEmpty!7080)) mapNonEmpty!7080))

(assert (= (and mapNonEmpty!7080 ((_ is ValueCellFull!1727) mapValue!7080)) b!176995))

(assert (= (and mapNonEmpty!7071 ((_ is ValueCellFull!1727) mapDefault!7080)) b!176996))

(declare-fun m!205123 () Bool)

(assert (=> mapNonEmpty!7080 m!205123))

(declare-fun b_lambda!7031 () Bool)

(assert (= b_lambda!7029 (or (and b!176781 b_free!4369) b_lambda!7031)))

(check-sat (not b_next!4369) (not b!176878) tp_is_empty!4141 (not b!176938) (not b!176976) (not d!53567) (not b!176921) (not d!53575) (not bm!17896) (not bm!17893) (not b!176987) (not d!53573) (not b!176959) (not b!176867) (not b!176972) (not b_lambda!7031) (not b!176988) (not b!176876) (not bm!17884) (not b!176933) (not bm!17890) (not b!176931) (not mapNonEmpty!7080) (not b!176974) (not b!176868) (not b!176941) (not b!176869) (not bm!17889) (not b!176940) (not b!176934) (not d!53571) (not bm!17885) (not b!176922) b_and!10847)
(check-sat b_and!10847 (not b_next!4369))
