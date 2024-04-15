; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21416 () Bool)

(assert start!21416)

(declare-fun b!214949 () Bool)

(declare-fun b_free!5707 () Bool)

(declare-fun b_next!5707 () Bool)

(assert (=> b!214949 (= b_free!5707 (not b_next!5707))))

(declare-fun tp!20228 () Bool)

(declare-fun b_and!12571 () Bool)

(assert (=> b!214949 (= tp!20228 b_and!12571)))

(declare-fun b!214948 () Bool)

(declare-fun e!139814 () Bool)

(declare-fun e!139816 () Bool)

(assert (=> b!214948 (= e!139814 e!139816)))

(declare-fun res!105155 () Bool)

(assert (=> b!214948 (=> (not res!105155) (not e!139816))))

(declare-datatypes ((SeekEntryResult!727 0))(
  ( (MissingZero!727 (index!5078 (_ BitVec 32))) (Found!727 (index!5079 (_ BitVec 32))) (Intermediate!727 (undefined!1539 Bool) (index!5080 (_ BitVec 32)) (x!22458 (_ BitVec 32))) (Undefined!727) (MissingVacant!727 (index!5081 (_ BitVec 32))) )
))
(declare-fun lt!110696 () SeekEntryResult!727)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!214948 (= res!105155 (or (= lt!110696 (MissingZero!727 index!297)) (= lt!110696 (MissingVacant!727 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7073 0))(
  ( (V!7074 (val!2829 Int)) )
))
(declare-datatypes ((ValueCell!2441 0))(
  ( (ValueCellFull!2441 (v!4841 V!7073)) (EmptyCell!2441) )
))
(declare-datatypes ((array!10353 0))(
  ( (array!10354 (arr!4905 (Array (_ BitVec 32) ValueCell!2441)) (size!5234 (_ BitVec 32))) )
))
(declare-datatypes ((array!10355 0))(
  ( (array!10356 (arr!4906 (Array (_ BitVec 32) (_ BitVec 64))) (size!5235 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2782 0))(
  ( (LongMapFixedSize!2783 (defaultEntry!4041 Int) (mask!9726 (_ BitVec 32)) (extraKeys!3778 (_ BitVec 32)) (zeroValue!3882 V!7073) (minValue!3882 V!7073) (_size!1440 (_ BitVec 32)) (_keys!6066 array!10355) (_values!4024 array!10353) (_vacant!1440 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2782)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10355 (_ BitVec 32)) SeekEntryResult!727)

(assert (=> b!214948 (= lt!110696 (seekEntryOrOpen!0 key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(declare-fun mapNonEmpty!9488 () Bool)

(declare-fun mapRes!9488 () Bool)

(declare-fun tp!20227 () Bool)

(declare-fun e!139812 () Bool)

(assert (=> mapNonEmpty!9488 (= mapRes!9488 (and tp!20227 e!139812))))

(declare-fun mapKey!9488 () (_ BitVec 32))

(declare-fun mapRest!9488 () (Array (_ BitVec 32) ValueCell!2441))

(declare-fun mapValue!9488 () ValueCell!2441)

(assert (=> mapNonEmpty!9488 (= (arr!4905 (_values!4024 thiss!1504)) (store mapRest!9488 mapKey!9488 mapValue!9488))))

(declare-fun e!139818 () Bool)

(declare-fun tp_is_empty!5569 () Bool)

(declare-fun e!139817 () Bool)

(declare-fun array_inv!3227 (array!10355) Bool)

(declare-fun array_inv!3228 (array!10353) Bool)

(assert (=> b!214949 (= e!139818 (and tp!20228 tp_is_empty!5569 (array_inv!3227 (_keys!6066 thiss!1504)) (array_inv!3228 (_values!4024 thiss!1504)) e!139817))))

(declare-fun b!214950 () Bool)

(declare-fun res!105154 () Bool)

(assert (=> b!214950 (=> (not res!105154) (not e!139814))))

(assert (=> b!214950 (= res!105154 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9488 () Bool)

(assert (=> mapIsEmpty!9488 mapRes!9488))

(declare-fun b!214951 () Bool)

(declare-fun res!105153 () Bool)

(assert (=> b!214951 (=> (not res!105153) (not e!139816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214951 (= res!105153 (validMask!0 (mask!9726 thiss!1504)))))

(declare-fun b!214952 () Bool)

(assert (=> b!214952 (= e!139812 tp_is_empty!5569)))

(declare-fun b!214953 () Bool)

(assert (=> b!214953 (= e!139816 (not (= (size!5234 (_values!4024 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9726 thiss!1504)))))))

(declare-fun b!214954 () Bool)

(declare-fun e!139815 () Bool)

(assert (=> b!214954 (= e!139815 tp_is_empty!5569)))

(declare-fun b!214955 () Bool)

(assert (=> b!214955 (= e!139817 (and e!139815 mapRes!9488))))

(declare-fun condMapEmpty!9488 () Bool)

(declare-fun mapDefault!9488 () ValueCell!2441)

(assert (=> b!214955 (= condMapEmpty!9488 (= (arr!4905 (_values!4024 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2441)) mapDefault!9488)))))

(declare-fun res!105156 () Bool)

(assert (=> start!21416 (=> (not res!105156) (not e!139814))))

(declare-fun valid!1155 (LongMapFixedSize!2782) Bool)

(assert (=> start!21416 (= res!105156 (valid!1155 thiss!1504))))

(assert (=> start!21416 e!139814))

(assert (=> start!21416 e!139818))

(assert (=> start!21416 true))

(assert (= (and start!21416 res!105156) b!214950))

(assert (= (and b!214950 res!105154) b!214948))

(assert (= (and b!214948 res!105155) b!214951))

(assert (= (and b!214951 res!105153) b!214953))

(assert (= (and b!214955 condMapEmpty!9488) mapIsEmpty!9488))

(assert (= (and b!214955 (not condMapEmpty!9488)) mapNonEmpty!9488))

(get-info :version)

(assert (= (and mapNonEmpty!9488 ((_ is ValueCellFull!2441) mapValue!9488)) b!214952))

(assert (= (and b!214955 ((_ is ValueCellFull!2441) mapDefault!9488)) b!214954))

(assert (= b!214949 b!214955))

(assert (= start!21416 b!214949))

(declare-fun m!241857 () Bool)

(assert (=> b!214951 m!241857))

(declare-fun m!241859 () Bool)

(assert (=> mapNonEmpty!9488 m!241859))

(declare-fun m!241861 () Bool)

(assert (=> start!21416 m!241861))

(declare-fun m!241863 () Bool)

(assert (=> b!214948 m!241863))

(declare-fun m!241865 () Bool)

(assert (=> b!214949 m!241865))

(declare-fun m!241867 () Bool)

(assert (=> b!214949 m!241867))

(check-sat (not mapNonEmpty!9488) (not start!21416) (not b!214951) b_and!12571 (not b!214949) tp_is_empty!5569 (not b!214948) (not b_next!5707))
(check-sat b_and!12571 (not b_next!5707))
(get-model)

(declare-fun b!215016 () Bool)

(declare-fun e!139869 () SeekEntryResult!727)

(declare-fun lt!110710 () SeekEntryResult!727)

(assert (=> b!215016 (= e!139869 (MissingZero!727 (index!5080 lt!110710)))))

(declare-fun b!215017 () Bool)

(declare-fun e!139867 () SeekEntryResult!727)

(declare-fun e!139868 () SeekEntryResult!727)

(assert (=> b!215017 (= e!139867 e!139868)))

(declare-fun lt!110711 () (_ BitVec 64))

(assert (=> b!215017 (= lt!110711 (select (arr!4906 (_keys!6066 thiss!1504)) (index!5080 lt!110710)))))

(declare-fun c!36105 () Bool)

(assert (=> b!215017 (= c!36105 (= lt!110711 key!932))))

(declare-fun b!215018 () Bool)

(assert (=> b!215018 (= e!139868 (Found!727 (index!5080 lt!110710)))))

(declare-fun d!58247 () Bool)

(declare-fun lt!110709 () SeekEntryResult!727)

(assert (=> d!58247 (and (or ((_ is Undefined!727) lt!110709) (not ((_ is Found!727) lt!110709)) (and (bvsge (index!5079 lt!110709) #b00000000000000000000000000000000) (bvslt (index!5079 lt!110709) (size!5235 (_keys!6066 thiss!1504))))) (or ((_ is Undefined!727) lt!110709) ((_ is Found!727) lt!110709) (not ((_ is MissingZero!727) lt!110709)) (and (bvsge (index!5078 lt!110709) #b00000000000000000000000000000000) (bvslt (index!5078 lt!110709) (size!5235 (_keys!6066 thiss!1504))))) (or ((_ is Undefined!727) lt!110709) ((_ is Found!727) lt!110709) ((_ is MissingZero!727) lt!110709) (not ((_ is MissingVacant!727) lt!110709)) (and (bvsge (index!5081 lt!110709) #b00000000000000000000000000000000) (bvslt (index!5081 lt!110709) (size!5235 (_keys!6066 thiss!1504))))) (or ((_ is Undefined!727) lt!110709) (ite ((_ is Found!727) lt!110709) (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5079 lt!110709)) key!932) (ite ((_ is MissingZero!727) lt!110709) (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5078 lt!110709)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!727) lt!110709) (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5081 lt!110709)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58247 (= lt!110709 e!139867)))

(declare-fun c!36104 () Bool)

(assert (=> d!58247 (= c!36104 (and ((_ is Intermediate!727) lt!110710) (undefined!1539 lt!110710)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10355 (_ BitVec 32)) SeekEntryResult!727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58247 (= lt!110710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9726 thiss!1504)) key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(assert (=> d!58247 (validMask!0 (mask!9726 thiss!1504))))

(assert (=> d!58247 (= (seekEntryOrOpen!0 key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)) lt!110709)))

(declare-fun b!215019 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10355 (_ BitVec 32)) SeekEntryResult!727)

(assert (=> b!215019 (= e!139869 (seekKeyOrZeroReturnVacant!0 (x!22458 lt!110710) (index!5080 lt!110710) (index!5080 lt!110710) key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(declare-fun b!215020 () Bool)

(assert (=> b!215020 (= e!139867 Undefined!727)))

(declare-fun b!215021 () Bool)

(declare-fun c!36103 () Bool)

(assert (=> b!215021 (= c!36103 (= lt!110711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215021 (= e!139868 e!139869)))

(assert (= (and d!58247 c!36104) b!215020))

(assert (= (and d!58247 (not c!36104)) b!215017))

(assert (= (and b!215017 c!36105) b!215018))

(assert (= (and b!215017 (not c!36105)) b!215021))

(assert (= (and b!215021 c!36103) b!215016))

(assert (= (and b!215021 (not c!36103)) b!215019))

(declare-fun m!241893 () Bool)

(assert (=> b!215017 m!241893))

(declare-fun m!241895 () Bool)

(assert (=> d!58247 m!241895))

(declare-fun m!241897 () Bool)

(assert (=> d!58247 m!241897))

(declare-fun m!241899 () Bool)

(assert (=> d!58247 m!241899))

(declare-fun m!241901 () Bool)

(assert (=> d!58247 m!241901))

(assert (=> d!58247 m!241897))

(declare-fun m!241903 () Bool)

(assert (=> d!58247 m!241903))

(assert (=> d!58247 m!241857))

(declare-fun m!241905 () Bool)

(assert (=> b!215019 m!241905))

(assert (=> b!214948 d!58247))

(declare-fun d!58249 () Bool)

(assert (=> d!58249 (= (validMask!0 (mask!9726 thiss!1504)) (and (or (= (mask!9726 thiss!1504) #b00000000000000000000000000000111) (= (mask!9726 thiss!1504) #b00000000000000000000000000001111) (= (mask!9726 thiss!1504) #b00000000000000000000000000011111) (= (mask!9726 thiss!1504) #b00000000000000000000000000111111) (= (mask!9726 thiss!1504) #b00000000000000000000000001111111) (= (mask!9726 thiss!1504) #b00000000000000000000000011111111) (= (mask!9726 thiss!1504) #b00000000000000000000000111111111) (= (mask!9726 thiss!1504) #b00000000000000000000001111111111) (= (mask!9726 thiss!1504) #b00000000000000000000011111111111) (= (mask!9726 thiss!1504) #b00000000000000000000111111111111) (= (mask!9726 thiss!1504) #b00000000000000000001111111111111) (= (mask!9726 thiss!1504) #b00000000000000000011111111111111) (= (mask!9726 thiss!1504) #b00000000000000000111111111111111) (= (mask!9726 thiss!1504) #b00000000000000001111111111111111) (= (mask!9726 thiss!1504) #b00000000000000011111111111111111) (= (mask!9726 thiss!1504) #b00000000000000111111111111111111) (= (mask!9726 thiss!1504) #b00000000000001111111111111111111) (= (mask!9726 thiss!1504) #b00000000000011111111111111111111) (= (mask!9726 thiss!1504) #b00000000000111111111111111111111) (= (mask!9726 thiss!1504) #b00000000001111111111111111111111) (= (mask!9726 thiss!1504) #b00000000011111111111111111111111) (= (mask!9726 thiss!1504) #b00000000111111111111111111111111) (= (mask!9726 thiss!1504) #b00000001111111111111111111111111) (= (mask!9726 thiss!1504) #b00000011111111111111111111111111) (= (mask!9726 thiss!1504) #b00000111111111111111111111111111) (= (mask!9726 thiss!1504) #b00001111111111111111111111111111) (= (mask!9726 thiss!1504) #b00011111111111111111111111111111) (= (mask!9726 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9726 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214951 d!58249))

(declare-fun d!58251 () Bool)

(declare-fun res!105187 () Bool)

(declare-fun e!139872 () Bool)

(assert (=> d!58251 (=> (not res!105187) (not e!139872))))

(declare-fun simpleValid!216 (LongMapFixedSize!2782) Bool)

(assert (=> d!58251 (= res!105187 (simpleValid!216 thiss!1504))))

(assert (=> d!58251 (= (valid!1155 thiss!1504) e!139872)))

(declare-fun b!215028 () Bool)

(declare-fun res!105188 () Bool)

(assert (=> b!215028 (=> (not res!105188) (not e!139872))))

(declare-fun arrayCountValidKeys!0 (array!10355 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215028 (= res!105188 (= (arrayCountValidKeys!0 (_keys!6066 thiss!1504) #b00000000000000000000000000000000 (size!5235 (_keys!6066 thiss!1504))) (_size!1440 thiss!1504)))))

(declare-fun b!215029 () Bool)

(declare-fun res!105189 () Bool)

(assert (=> b!215029 (=> (not res!105189) (not e!139872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10355 (_ BitVec 32)) Bool)

(assert (=> b!215029 (= res!105189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(declare-fun b!215030 () Bool)

(declare-datatypes ((List!3122 0))(
  ( (Nil!3119) (Cons!3118 (h!3761 (_ BitVec 64)) (t!8068 List!3122)) )
))
(declare-fun arrayNoDuplicates!0 (array!10355 (_ BitVec 32) List!3122) Bool)

(assert (=> b!215030 (= e!139872 (arrayNoDuplicates!0 (_keys!6066 thiss!1504) #b00000000000000000000000000000000 Nil!3119))))

(assert (= (and d!58251 res!105187) b!215028))

(assert (= (and b!215028 res!105188) b!215029))

(assert (= (and b!215029 res!105189) b!215030))

(declare-fun m!241907 () Bool)

(assert (=> d!58251 m!241907))

(declare-fun m!241909 () Bool)

(assert (=> b!215028 m!241909))

(declare-fun m!241911 () Bool)

(assert (=> b!215029 m!241911))

(declare-fun m!241913 () Bool)

(assert (=> b!215030 m!241913))

(assert (=> start!21416 d!58251))

(declare-fun d!58253 () Bool)

(assert (=> d!58253 (= (array_inv!3227 (_keys!6066 thiss!1504)) (bvsge (size!5235 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214949 d!58253))

(declare-fun d!58255 () Bool)

(assert (=> d!58255 (= (array_inv!3228 (_values!4024 thiss!1504)) (bvsge (size!5234 (_values!4024 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214949 d!58255))

(declare-fun mapNonEmpty!9497 () Bool)

(declare-fun mapRes!9497 () Bool)

(declare-fun tp!20243 () Bool)

(declare-fun e!139877 () Bool)

(assert (=> mapNonEmpty!9497 (= mapRes!9497 (and tp!20243 e!139877))))

(declare-fun mapRest!9497 () (Array (_ BitVec 32) ValueCell!2441))

(declare-fun mapValue!9497 () ValueCell!2441)

(declare-fun mapKey!9497 () (_ BitVec 32))

(assert (=> mapNonEmpty!9497 (= mapRest!9488 (store mapRest!9497 mapKey!9497 mapValue!9497))))

(declare-fun b!215038 () Bool)

(declare-fun e!139878 () Bool)

(assert (=> b!215038 (= e!139878 tp_is_empty!5569)))

(declare-fun condMapEmpty!9497 () Bool)

(declare-fun mapDefault!9497 () ValueCell!2441)

(assert (=> mapNonEmpty!9488 (= condMapEmpty!9497 (= mapRest!9488 ((as const (Array (_ BitVec 32) ValueCell!2441)) mapDefault!9497)))))

(assert (=> mapNonEmpty!9488 (= tp!20227 (and e!139878 mapRes!9497))))

(declare-fun b!215037 () Bool)

(assert (=> b!215037 (= e!139877 tp_is_empty!5569)))

(declare-fun mapIsEmpty!9497 () Bool)

(assert (=> mapIsEmpty!9497 mapRes!9497))

(assert (= (and mapNonEmpty!9488 condMapEmpty!9497) mapIsEmpty!9497))

(assert (= (and mapNonEmpty!9488 (not condMapEmpty!9497)) mapNonEmpty!9497))

(assert (= (and mapNonEmpty!9497 ((_ is ValueCellFull!2441) mapValue!9497)) b!215037))

(assert (= (and mapNonEmpty!9488 ((_ is ValueCellFull!2441) mapDefault!9497)) b!215038))

(declare-fun m!241915 () Bool)

(assert (=> mapNonEmpty!9497 m!241915))

(check-sat (not b!215030) (not d!58247) (not b!215028) b_and!12571 (not d!58251) tp_is_empty!5569 (not b_next!5707) (not mapNonEmpty!9497) (not b!215019) (not b!215029))
(check-sat b_and!12571 (not b_next!5707))
(get-model)

(declare-fun b!215047 () Bool)

(declare-fun e!139883 () (_ BitVec 32))

(declare-fun call!20310 () (_ BitVec 32))

(assert (=> b!215047 (= e!139883 (bvadd #b00000000000000000000000000000001 call!20310))))

(declare-fun b!215049 () Bool)

(assert (=> b!215049 (= e!139883 call!20310)))

(declare-fun bm!20307 () Bool)

(assert (=> bm!20307 (= call!20310 (arrayCountValidKeys!0 (_keys!6066 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5235 (_keys!6066 thiss!1504))))))

(declare-fun b!215050 () Bool)

(declare-fun e!139884 () (_ BitVec 32))

(assert (=> b!215050 (= e!139884 e!139883)))

(declare-fun c!36111 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215050 (= c!36111 (validKeyInArray!0 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58257 () Bool)

(declare-fun lt!110714 () (_ BitVec 32))

(assert (=> d!58257 (and (bvsge lt!110714 #b00000000000000000000000000000000) (bvsle lt!110714 (bvsub (size!5235 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58257 (= lt!110714 e!139884)))

(declare-fun c!36110 () Bool)

(assert (=> d!58257 (= c!36110 (bvsge #b00000000000000000000000000000000 (size!5235 (_keys!6066 thiss!1504))))))

(assert (=> d!58257 (and (bvsle #b00000000000000000000000000000000 (size!5235 (_keys!6066 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5235 (_keys!6066 thiss!1504)) (size!5235 (_keys!6066 thiss!1504))))))

(assert (=> d!58257 (= (arrayCountValidKeys!0 (_keys!6066 thiss!1504) #b00000000000000000000000000000000 (size!5235 (_keys!6066 thiss!1504))) lt!110714)))

(declare-fun b!215048 () Bool)

(assert (=> b!215048 (= e!139884 #b00000000000000000000000000000000)))

(assert (= (and d!58257 c!36110) b!215048))

(assert (= (and d!58257 (not c!36110)) b!215050))

(assert (= (and b!215050 c!36111) b!215047))

(assert (= (and b!215050 (not c!36111)) b!215049))

(assert (= (or b!215047 b!215049) bm!20307))

(declare-fun m!241917 () Bool)

(assert (=> bm!20307 m!241917))

(declare-fun m!241919 () Bool)

(assert (=> b!215050 m!241919))

(assert (=> b!215050 m!241919))

(declare-fun m!241921 () Bool)

(assert (=> b!215050 m!241921))

(assert (=> b!215028 d!58257))

(declare-fun d!58259 () Bool)

(declare-fun e!139896 () Bool)

(assert (=> d!58259 e!139896))

(declare-fun c!36120 () Bool)

(declare-fun lt!110719 () SeekEntryResult!727)

(assert (=> d!58259 (= c!36120 (and ((_ is Intermediate!727) lt!110719) (undefined!1539 lt!110719)))))

(declare-fun e!139895 () SeekEntryResult!727)

(assert (=> d!58259 (= lt!110719 e!139895)))

(declare-fun c!36118 () Bool)

(assert (=> d!58259 (= c!36118 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110720 () (_ BitVec 64))

(assert (=> d!58259 (= lt!110720 (select (arr!4906 (_keys!6066 thiss!1504)) (toIndex!0 key!932 (mask!9726 thiss!1504))))))

(assert (=> d!58259 (validMask!0 (mask!9726 thiss!1504))))

(assert (=> d!58259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9726 thiss!1504)) key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)) lt!110719)))

(declare-fun b!215069 () Bool)

(declare-fun e!139897 () SeekEntryResult!727)

(assert (=> b!215069 (= e!139895 e!139897)))

(declare-fun c!36119 () Bool)

(assert (=> b!215069 (= c!36119 (or (= lt!110720 key!932) (= (bvadd lt!110720 lt!110720) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215070 () Bool)

(declare-fun e!139898 () Bool)

(assert (=> b!215070 (= e!139896 e!139898)))

(declare-fun res!105198 () Bool)

(assert (=> b!215070 (= res!105198 (and ((_ is Intermediate!727) lt!110719) (not (undefined!1539 lt!110719)) (bvslt (x!22458 lt!110719) #b01111111111111111111111111111110) (bvsge (x!22458 lt!110719) #b00000000000000000000000000000000) (bvsge (x!22458 lt!110719) #b00000000000000000000000000000000)))))

(assert (=> b!215070 (=> (not res!105198) (not e!139898))))

(declare-fun b!215071 () Bool)

(assert (=> b!215071 (= e!139895 (Intermediate!727 true (toIndex!0 key!932 (mask!9726 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215072 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215072 (= e!139897 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9726 thiss!1504)) #b00000000000000000000000000000000 (mask!9726 thiss!1504)) key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(declare-fun b!215073 () Bool)

(assert (=> b!215073 (= e!139896 (bvsge (x!22458 lt!110719) #b01111111111111111111111111111110))))

(declare-fun b!215074 () Bool)

(assert (=> b!215074 (and (bvsge (index!5080 lt!110719) #b00000000000000000000000000000000) (bvslt (index!5080 lt!110719) (size!5235 (_keys!6066 thiss!1504))))))

(declare-fun res!105197 () Bool)

(assert (=> b!215074 (= res!105197 (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5080 lt!110719)) key!932))))

(declare-fun e!139899 () Bool)

(assert (=> b!215074 (=> res!105197 e!139899)))

(assert (=> b!215074 (= e!139898 e!139899)))

(declare-fun b!215075 () Bool)

(assert (=> b!215075 (and (bvsge (index!5080 lt!110719) #b00000000000000000000000000000000) (bvslt (index!5080 lt!110719) (size!5235 (_keys!6066 thiss!1504))))))

(assert (=> b!215075 (= e!139899 (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5080 lt!110719)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215076 () Bool)

(assert (=> b!215076 (and (bvsge (index!5080 lt!110719) #b00000000000000000000000000000000) (bvslt (index!5080 lt!110719) (size!5235 (_keys!6066 thiss!1504))))))

(declare-fun res!105196 () Bool)

(assert (=> b!215076 (= res!105196 (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5080 lt!110719)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215076 (=> res!105196 e!139899)))

(declare-fun b!215077 () Bool)

(assert (=> b!215077 (= e!139897 (Intermediate!727 false (toIndex!0 key!932 (mask!9726 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!58259 c!36118) b!215071))

(assert (= (and d!58259 (not c!36118)) b!215069))

(assert (= (and b!215069 c!36119) b!215077))

(assert (= (and b!215069 (not c!36119)) b!215072))

(assert (= (and d!58259 c!36120) b!215073))

(assert (= (and d!58259 (not c!36120)) b!215070))

(assert (= (and b!215070 res!105198) b!215074))

(assert (= (and b!215074 (not res!105197)) b!215076))

(assert (= (and b!215076 (not res!105196)) b!215075))

(assert (=> d!58259 m!241897))

(declare-fun m!241923 () Bool)

(assert (=> d!58259 m!241923))

(assert (=> d!58259 m!241857))

(declare-fun m!241925 () Bool)

(assert (=> b!215076 m!241925))

(assert (=> b!215072 m!241897))

(declare-fun m!241927 () Bool)

(assert (=> b!215072 m!241927))

(assert (=> b!215072 m!241927))

(declare-fun m!241929 () Bool)

(assert (=> b!215072 m!241929))

(assert (=> b!215075 m!241925))

(assert (=> b!215074 m!241925))

(assert (=> d!58247 d!58259))

(declare-fun d!58261 () Bool)

(declare-fun lt!110726 () (_ BitVec 32))

(declare-fun lt!110725 () (_ BitVec 32))

(assert (=> d!58261 (= lt!110726 (bvmul (bvxor lt!110725 (bvlshr lt!110725 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58261 (= lt!110725 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58261 (and (bvsge (mask!9726 thiss!1504) #b00000000000000000000000000000000) (let ((res!105199 (let ((h!3762 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22474 (bvmul (bvxor h!3762 (bvlshr h!3762 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22474 (bvlshr x!22474 #b00000000000000000000000000001101)) (mask!9726 thiss!1504)))))) (and (bvslt res!105199 (bvadd (mask!9726 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105199 #b00000000000000000000000000000000))))))

(assert (=> d!58261 (= (toIndex!0 key!932 (mask!9726 thiss!1504)) (bvand (bvxor lt!110726 (bvlshr lt!110726 #b00000000000000000000000000001101)) (mask!9726 thiss!1504)))))

(assert (=> d!58247 d!58261))

(assert (=> d!58247 d!58249))

(declare-fun b!215086 () Bool)

(declare-fun e!139906 () Bool)

(declare-fun e!139908 () Bool)

(assert (=> b!215086 (= e!139906 e!139908)))

(declare-fun c!36123 () Bool)

(assert (=> b!215086 (= c!36123 (validKeyInArray!0 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20310 () Bool)

(declare-fun call!20313 () Bool)

(assert (=> bm!20310 (= call!20313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(declare-fun b!215087 () Bool)

(declare-fun e!139907 () Bool)

(assert (=> b!215087 (= e!139907 call!20313)))

(declare-fun d!58263 () Bool)

(declare-fun res!105205 () Bool)

(assert (=> d!58263 (=> res!105205 e!139906)))

(assert (=> d!58263 (= res!105205 (bvsge #b00000000000000000000000000000000 (size!5235 (_keys!6066 thiss!1504))))))

(assert (=> d!58263 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)) e!139906)))

(declare-fun b!215088 () Bool)

(assert (=> b!215088 (= e!139908 e!139907)))

(declare-fun lt!110733 () (_ BitVec 64))

(assert (=> b!215088 (= lt!110733 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6452 0))(
  ( (Unit!6453) )
))
(declare-fun lt!110734 () Unit!6452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10355 (_ BitVec 64) (_ BitVec 32)) Unit!6452)

(assert (=> b!215088 (= lt!110734 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6066 thiss!1504) lt!110733 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215088 (arrayContainsKey!0 (_keys!6066 thiss!1504) lt!110733 #b00000000000000000000000000000000)))

(declare-fun lt!110735 () Unit!6452)

(assert (=> b!215088 (= lt!110735 lt!110734)))

(declare-fun res!105204 () Bool)

(assert (=> b!215088 (= res!105204 (= (seekEntryOrOpen!0 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000) (_keys!6066 thiss!1504) (mask!9726 thiss!1504)) (Found!727 #b00000000000000000000000000000000)))))

(assert (=> b!215088 (=> (not res!105204) (not e!139907))))

(declare-fun b!215089 () Bool)

(assert (=> b!215089 (= e!139908 call!20313)))

(assert (= (and d!58263 (not res!105205)) b!215086))

(assert (= (and b!215086 c!36123) b!215088))

(assert (= (and b!215086 (not c!36123)) b!215089))

(assert (= (and b!215088 res!105204) b!215087))

(assert (= (or b!215087 b!215089) bm!20310))

(assert (=> b!215086 m!241919))

(assert (=> b!215086 m!241919))

(assert (=> b!215086 m!241921))

(declare-fun m!241931 () Bool)

(assert (=> bm!20310 m!241931))

(assert (=> b!215088 m!241919))

(declare-fun m!241933 () Bool)

(assert (=> b!215088 m!241933))

(declare-fun m!241935 () Bool)

(assert (=> b!215088 m!241935))

(assert (=> b!215088 m!241919))

(declare-fun m!241937 () Bool)

(assert (=> b!215088 m!241937))

(assert (=> b!215029 d!58263))

(declare-fun b!215100 () Bool)

(declare-fun res!105217 () Bool)

(declare-fun e!139911 () Bool)

(assert (=> b!215100 (=> (not res!105217) (not e!139911))))

(declare-fun size!5240 (LongMapFixedSize!2782) (_ BitVec 32))

(assert (=> b!215100 (= res!105217 (= (size!5240 thiss!1504) (bvadd (_size!1440 thiss!1504) (bvsdiv (bvadd (extraKeys!3778 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!215101 () Bool)

(assert (=> b!215101 (= e!139911 (and (bvsge (extraKeys!3778 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3778 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1440 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215099 () Bool)

(declare-fun res!105216 () Bool)

(assert (=> b!215099 (=> (not res!105216) (not e!139911))))

(assert (=> b!215099 (= res!105216 (bvsge (size!5240 thiss!1504) (_size!1440 thiss!1504)))))

(declare-fun d!58265 () Bool)

(declare-fun res!105215 () Bool)

(assert (=> d!58265 (=> (not res!105215) (not e!139911))))

(assert (=> d!58265 (= res!105215 (validMask!0 (mask!9726 thiss!1504)))))

(assert (=> d!58265 (= (simpleValid!216 thiss!1504) e!139911)))

(declare-fun b!215098 () Bool)

(declare-fun res!105214 () Bool)

(assert (=> b!215098 (=> (not res!105214) (not e!139911))))

(assert (=> b!215098 (= res!105214 (and (= (size!5234 (_values!4024 thiss!1504)) (bvadd (mask!9726 thiss!1504) #b00000000000000000000000000000001)) (= (size!5235 (_keys!6066 thiss!1504)) (size!5234 (_values!4024 thiss!1504))) (bvsge (_size!1440 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1440 thiss!1504) (bvadd (mask!9726 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!58265 res!105215) b!215098))

(assert (= (and b!215098 res!105214) b!215099))

(assert (= (and b!215099 res!105216) b!215100))

(assert (= (and b!215100 res!105217) b!215101))

(declare-fun m!241939 () Bool)

(assert (=> b!215100 m!241939))

(assert (=> b!215099 m!241939))

(assert (=> d!58265 m!241857))

(assert (=> d!58251 d!58265))

(declare-fun b!215114 () Bool)

(declare-fun c!36132 () Bool)

(declare-fun lt!110741 () (_ BitVec 64))

(assert (=> b!215114 (= c!36132 (= lt!110741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139918 () SeekEntryResult!727)

(declare-fun e!139919 () SeekEntryResult!727)

(assert (=> b!215114 (= e!139918 e!139919)))

(declare-fun b!215115 () Bool)

(declare-fun e!139920 () SeekEntryResult!727)

(assert (=> b!215115 (= e!139920 e!139918)))

(declare-fun c!36131 () Bool)

(assert (=> b!215115 (= c!36131 (= lt!110741 key!932))))

(declare-fun b!215116 () Bool)

(assert (=> b!215116 (= e!139918 (Found!727 (index!5080 lt!110710)))))

(declare-fun lt!110740 () SeekEntryResult!727)

(declare-fun d!58267 () Bool)

(assert (=> d!58267 (and (or ((_ is Undefined!727) lt!110740) (not ((_ is Found!727) lt!110740)) (and (bvsge (index!5079 lt!110740) #b00000000000000000000000000000000) (bvslt (index!5079 lt!110740) (size!5235 (_keys!6066 thiss!1504))))) (or ((_ is Undefined!727) lt!110740) ((_ is Found!727) lt!110740) (not ((_ is MissingVacant!727) lt!110740)) (not (= (index!5081 lt!110740) (index!5080 lt!110710))) (and (bvsge (index!5081 lt!110740) #b00000000000000000000000000000000) (bvslt (index!5081 lt!110740) (size!5235 (_keys!6066 thiss!1504))))) (or ((_ is Undefined!727) lt!110740) (ite ((_ is Found!727) lt!110740) (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5079 lt!110740)) key!932) (and ((_ is MissingVacant!727) lt!110740) (= (index!5081 lt!110740) (index!5080 lt!110710)) (= (select (arr!4906 (_keys!6066 thiss!1504)) (index!5081 lt!110740)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58267 (= lt!110740 e!139920)))

(declare-fun c!36130 () Bool)

(assert (=> d!58267 (= c!36130 (bvsge (x!22458 lt!110710) #b01111111111111111111111111111110))))

(assert (=> d!58267 (= lt!110741 (select (arr!4906 (_keys!6066 thiss!1504)) (index!5080 lt!110710)))))

(assert (=> d!58267 (validMask!0 (mask!9726 thiss!1504))))

(assert (=> d!58267 (= (seekKeyOrZeroReturnVacant!0 (x!22458 lt!110710) (index!5080 lt!110710) (index!5080 lt!110710) key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)) lt!110740)))

(declare-fun b!215117 () Bool)

(assert (=> b!215117 (= e!139920 Undefined!727)))

(declare-fun b!215118 () Bool)

(assert (=> b!215118 (= e!139919 (MissingVacant!727 (index!5080 lt!110710)))))

(declare-fun b!215119 () Bool)

(assert (=> b!215119 (= e!139919 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22458 lt!110710) #b00000000000000000000000000000001) (nextIndex!0 (index!5080 lt!110710) (x!22458 lt!110710) (mask!9726 thiss!1504)) (index!5080 lt!110710) key!932 (_keys!6066 thiss!1504) (mask!9726 thiss!1504)))))

(assert (= (and d!58267 c!36130) b!215117))

(assert (= (and d!58267 (not c!36130)) b!215115))

(assert (= (and b!215115 c!36131) b!215116))

(assert (= (and b!215115 (not c!36131)) b!215114))

(assert (= (and b!215114 c!36132) b!215118))

(assert (= (and b!215114 (not c!36132)) b!215119))

(declare-fun m!241941 () Bool)

(assert (=> d!58267 m!241941))

(declare-fun m!241943 () Bool)

(assert (=> d!58267 m!241943))

(assert (=> d!58267 m!241893))

(assert (=> d!58267 m!241857))

(declare-fun m!241945 () Bool)

(assert (=> b!215119 m!241945))

(assert (=> b!215119 m!241945))

(declare-fun m!241947 () Bool)

(assert (=> b!215119 m!241947))

(assert (=> b!215019 d!58267))

(declare-fun b!215130 () Bool)

(declare-fun e!139932 () Bool)

(declare-fun contains!1406 (List!3122 (_ BitVec 64)) Bool)

(assert (=> b!215130 (= e!139932 (contains!1406 Nil!3119 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215131 () Bool)

(declare-fun e!139930 () Bool)

(declare-fun e!139929 () Bool)

(assert (=> b!215131 (= e!139930 e!139929)))

(declare-fun res!105225 () Bool)

(assert (=> b!215131 (=> (not res!105225) (not e!139929))))

(assert (=> b!215131 (= res!105225 (not e!139932))))

(declare-fun res!105224 () Bool)

(assert (=> b!215131 (=> (not res!105224) (not e!139932))))

(assert (=> b!215131 (= res!105224 (validKeyInArray!0 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215132 () Bool)

(declare-fun e!139931 () Bool)

(assert (=> b!215132 (= e!139929 e!139931)))

(declare-fun c!36135 () Bool)

(assert (=> b!215132 (= c!36135 (validKeyInArray!0 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58269 () Bool)

(declare-fun res!105226 () Bool)

(assert (=> d!58269 (=> res!105226 e!139930)))

(assert (=> d!58269 (= res!105226 (bvsge #b00000000000000000000000000000000 (size!5235 (_keys!6066 thiss!1504))))))

(assert (=> d!58269 (= (arrayNoDuplicates!0 (_keys!6066 thiss!1504) #b00000000000000000000000000000000 Nil!3119) e!139930)))

(declare-fun bm!20313 () Bool)

(declare-fun call!20316 () Bool)

(assert (=> bm!20313 (= call!20316 (arrayNoDuplicates!0 (_keys!6066 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36135 (Cons!3118 (select (arr!4906 (_keys!6066 thiss!1504)) #b00000000000000000000000000000000) Nil!3119) Nil!3119)))))

(declare-fun b!215133 () Bool)

(assert (=> b!215133 (= e!139931 call!20316)))

(declare-fun b!215134 () Bool)

(assert (=> b!215134 (= e!139931 call!20316)))

(assert (= (and d!58269 (not res!105226)) b!215131))

(assert (= (and b!215131 res!105224) b!215130))

(assert (= (and b!215131 res!105225) b!215132))

(assert (= (and b!215132 c!36135) b!215134))

(assert (= (and b!215132 (not c!36135)) b!215133))

(assert (= (or b!215134 b!215133) bm!20313))

(assert (=> b!215130 m!241919))

(assert (=> b!215130 m!241919))

(declare-fun m!241949 () Bool)

(assert (=> b!215130 m!241949))

(assert (=> b!215131 m!241919))

(assert (=> b!215131 m!241919))

(assert (=> b!215131 m!241921))

(assert (=> b!215132 m!241919))

(assert (=> b!215132 m!241919))

(assert (=> b!215132 m!241921))

(assert (=> bm!20313 m!241919))

(declare-fun m!241951 () Bool)

(assert (=> bm!20313 m!241951))

(assert (=> b!215030 d!58269))

(declare-fun mapNonEmpty!9498 () Bool)

(declare-fun mapRes!9498 () Bool)

(declare-fun tp!20244 () Bool)

(declare-fun e!139933 () Bool)

(assert (=> mapNonEmpty!9498 (= mapRes!9498 (and tp!20244 e!139933))))

(declare-fun mapKey!9498 () (_ BitVec 32))

(declare-fun mapValue!9498 () ValueCell!2441)

(declare-fun mapRest!9498 () (Array (_ BitVec 32) ValueCell!2441))

(assert (=> mapNonEmpty!9498 (= mapRest!9497 (store mapRest!9498 mapKey!9498 mapValue!9498))))

(declare-fun b!215136 () Bool)

(declare-fun e!139934 () Bool)

(assert (=> b!215136 (= e!139934 tp_is_empty!5569)))

(declare-fun condMapEmpty!9498 () Bool)

(declare-fun mapDefault!9498 () ValueCell!2441)

(assert (=> mapNonEmpty!9497 (= condMapEmpty!9498 (= mapRest!9497 ((as const (Array (_ BitVec 32) ValueCell!2441)) mapDefault!9498)))))

(assert (=> mapNonEmpty!9497 (= tp!20243 (and e!139934 mapRes!9498))))

(declare-fun b!215135 () Bool)

(assert (=> b!215135 (= e!139933 tp_is_empty!5569)))

(declare-fun mapIsEmpty!9498 () Bool)

(assert (=> mapIsEmpty!9498 mapRes!9498))

(assert (= (and mapNonEmpty!9497 condMapEmpty!9498) mapIsEmpty!9498))

(assert (= (and mapNonEmpty!9497 (not condMapEmpty!9498)) mapNonEmpty!9498))

(assert (= (and mapNonEmpty!9498 ((_ is ValueCellFull!2441) mapValue!9498)) b!215135))

(assert (= (and mapNonEmpty!9497 ((_ is ValueCellFull!2441) mapDefault!9498)) b!215136))

(declare-fun m!241953 () Bool)

(assert (=> mapNonEmpty!9498 m!241953))

(check-sat (not b!215072) (not b!215088) (not b!215050) (not bm!20307) (not b!215099) (not b!215131) (not bm!20313) (not d!58267) (not b!215086) (not d!58265) b_and!12571 (not b!215130) (not b!215132) tp_is_empty!5569 (not bm!20310) (not b!215100) (not b!215119) (not mapNonEmpty!9498) (not d!58259) (not b_next!5707))
(check-sat b_and!12571 (not b_next!5707))
