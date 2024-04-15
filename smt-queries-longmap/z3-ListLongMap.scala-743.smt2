; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17254 () Bool)

(assert start!17254)

(declare-fun b!172899 () Bool)

(declare-fun b_free!4297 () Bool)

(declare-fun b_next!4297 () Bool)

(assert (=> b!172899 (= b_free!4297 (not b_next!4297))))

(declare-fun tp!15549 () Bool)

(declare-fun b_and!10711 () Bool)

(assert (=> b!172899 (= tp!15549 b_and!10711)))

(declare-fun b!172892 () Bool)

(declare-fun e!114192 () Bool)

(declare-datatypes ((V!5073 0))(
  ( (V!5074 (val!2079 Int)) )
))
(declare-datatypes ((ValueCell!1691 0))(
  ( (ValueCellFull!1691 (v!3941 V!5073)) (EmptyCell!1691) )
))
(declare-datatypes ((array!7245 0))(
  ( (array!7246 (arr!3442 (Array (_ BitVec 32) (_ BitVec 64))) (size!3742 (_ BitVec 32))) )
))
(declare-datatypes ((array!7247 0))(
  ( (array!7248 (arr!3443 (Array (_ BitVec 32) ValueCell!1691)) (size!3743 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2290 0))(
  ( (LongMapFixedSize!2291 (defaultEntry!3591 Int) (mask!8454 (_ BitVec 32)) (extraKeys!3330 (_ BitVec 32)) (zeroValue!3432 V!5073) (minValue!3434 V!5073) (_size!1194 (_ BitVec 32)) (_keys!5429 array!7245) (_values!3574 array!7247) (_vacant!1194 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2290)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7245 (_ BitVec 32)) Bool)

(assert (=> b!172892 (= e!114192 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5429 thiss!1248) (mask!8454 thiss!1248))))))

(declare-fun b!172893 () Bool)

(declare-fun e!114194 () Bool)

(declare-fun e!114190 () Bool)

(declare-fun mapRes!6924 () Bool)

(assert (=> b!172893 (= e!114194 (and e!114190 mapRes!6924))))

(declare-fun condMapEmpty!6924 () Bool)

(declare-fun mapDefault!6924 () ValueCell!1691)

(assert (=> b!172893 (= condMapEmpty!6924 (= (arr!3443 (_values!3574 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1691)) mapDefault!6924)))))

(declare-fun b!172894 () Bool)

(declare-fun e!114193 () Bool)

(declare-fun tp_is_empty!4069 () Bool)

(assert (=> b!172894 (= e!114193 tp_is_empty!4069)))

(declare-fun mapNonEmpty!6924 () Bool)

(declare-fun tp!15548 () Bool)

(assert (=> mapNonEmpty!6924 (= mapRes!6924 (and tp!15548 e!114193))))

(declare-fun mapKey!6924 () (_ BitVec 32))

(declare-fun mapRest!6924 () (Array (_ BitVec 32) ValueCell!1691))

(declare-fun mapValue!6924 () ValueCell!1691)

(assert (=> mapNonEmpty!6924 (= (arr!3443 (_values!3574 thiss!1248)) (store mapRest!6924 mapKey!6924 mapValue!6924))))

(declare-fun b!172896 () Bool)

(declare-fun res!82059 () Bool)

(assert (=> b!172896 (=> (not res!82059) (not e!114192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172896 (= res!82059 (validMask!0 (mask!8454 thiss!1248)))))

(declare-fun b!172897 () Bool)

(declare-fun res!82060 () Bool)

(assert (=> b!172897 (=> (not res!82060) (not e!114192))))

(assert (=> b!172897 (= res!82060 (and (= (size!3743 (_values!3574 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8454 thiss!1248))) (= (size!3742 (_keys!5429 thiss!1248)) (size!3743 (_values!3574 thiss!1248))) (bvsge (mask!8454 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3330 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3330 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3330 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6924 () Bool)

(assert (=> mapIsEmpty!6924 mapRes!6924))

(declare-fun b!172898 () Bool)

(declare-fun res!82058 () Bool)

(assert (=> b!172898 (=> (not res!82058) (not e!114192))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172898 (= res!82058 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!114191 () Bool)

(declare-fun array_inv!2217 (array!7245) Bool)

(declare-fun array_inv!2218 (array!7247) Bool)

(assert (=> b!172899 (= e!114191 (and tp!15549 tp_is_empty!4069 (array_inv!2217 (_keys!5429 thiss!1248)) (array_inv!2218 (_values!3574 thiss!1248)) e!114194))))

(declare-fun b!172895 () Bool)

(assert (=> b!172895 (= e!114190 tp_is_empty!4069)))

(declare-fun res!82057 () Bool)

(assert (=> start!17254 (=> (not res!82057) (not e!114192))))

(declare-fun valid!986 (LongMapFixedSize!2290) Bool)

(assert (=> start!17254 (= res!82057 (valid!986 thiss!1248))))

(assert (=> start!17254 e!114192))

(assert (=> start!17254 e!114191))

(assert (=> start!17254 true))

(assert (= (and start!17254 res!82057) b!172898))

(assert (= (and b!172898 res!82058) b!172896))

(assert (= (and b!172896 res!82059) b!172897))

(assert (= (and b!172897 res!82060) b!172892))

(assert (= (and b!172893 condMapEmpty!6924) mapIsEmpty!6924))

(assert (= (and b!172893 (not condMapEmpty!6924)) mapNonEmpty!6924))

(get-info :version)

(assert (= (and mapNonEmpty!6924 ((_ is ValueCellFull!1691) mapValue!6924)) b!172894))

(assert (= (and b!172893 ((_ is ValueCellFull!1691) mapDefault!6924)) b!172895))

(assert (= b!172899 b!172893))

(assert (= start!17254 b!172899))

(declare-fun m!200893 () Bool)

(assert (=> start!17254 m!200893))

(declare-fun m!200895 () Bool)

(assert (=> b!172896 m!200895))

(declare-fun m!200897 () Bool)

(assert (=> b!172892 m!200897))

(declare-fun m!200899 () Bool)

(assert (=> b!172899 m!200899))

(declare-fun m!200901 () Bool)

(assert (=> b!172899 m!200901))

(declare-fun m!200903 () Bool)

(assert (=> mapNonEmpty!6924 m!200903))

(check-sat b_and!10711 (not b!172892) (not b_next!4297) (not b!172899) tp_is_empty!4069 (not b!172896) (not mapNonEmpty!6924) (not start!17254))
(check-sat b_and!10711 (not b_next!4297))
(get-model)

(declare-fun d!52415 () Bool)

(assert (=> d!52415 (= (validMask!0 (mask!8454 thiss!1248)) (and (or (= (mask!8454 thiss!1248) #b00000000000000000000000000000111) (= (mask!8454 thiss!1248) #b00000000000000000000000000001111) (= (mask!8454 thiss!1248) #b00000000000000000000000000011111) (= (mask!8454 thiss!1248) #b00000000000000000000000000111111) (= (mask!8454 thiss!1248) #b00000000000000000000000001111111) (= (mask!8454 thiss!1248) #b00000000000000000000000011111111) (= (mask!8454 thiss!1248) #b00000000000000000000000111111111) (= (mask!8454 thiss!1248) #b00000000000000000000001111111111) (= (mask!8454 thiss!1248) #b00000000000000000000011111111111) (= (mask!8454 thiss!1248) #b00000000000000000000111111111111) (= (mask!8454 thiss!1248) #b00000000000000000001111111111111) (= (mask!8454 thiss!1248) #b00000000000000000011111111111111) (= (mask!8454 thiss!1248) #b00000000000000000111111111111111) (= (mask!8454 thiss!1248) #b00000000000000001111111111111111) (= (mask!8454 thiss!1248) #b00000000000000011111111111111111) (= (mask!8454 thiss!1248) #b00000000000000111111111111111111) (= (mask!8454 thiss!1248) #b00000000000001111111111111111111) (= (mask!8454 thiss!1248) #b00000000000011111111111111111111) (= (mask!8454 thiss!1248) #b00000000000111111111111111111111) (= (mask!8454 thiss!1248) #b00000000001111111111111111111111) (= (mask!8454 thiss!1248) #b00000000011111111111111111111111) (= (mask!8454 thiss!1248) #b00000000111111111111111111111111) (= (mask!8454 thiss!1248) #b00000001111111111111111111111111) (= (mask!8454 thiss!1248) #b00000011111111111111111111111111) (= (mask!8454 thiss!1248) #b00000111111111111111111111111111) (= (mask!8454 thiss!1248) #b00001111111111111111111111111111) (= (mask!8454 thiss!1248) #b00011111111111111111111111111111) (= (mask!8454 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8454 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172896 d!52415))

(declare-fun b!172956 () Bool)

(declare-fun e!114239 () Bool)

(declare-fun e!114238 () Bool)

(assert (=> b!172956 (= e!114239 e!114238)))

(declare-fun c!30864 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172956 (= c!30864 (validKeyInArray!0 (select (arr!3442 (_keys!5429 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52417 () Bool)

(declare-fun res!82089 () Bool)

(assert (=> d!52417 (=> res!82089 e!114239)))

(assert (=> d!52417 (= res!82089 (bvsge #b00000000000000000000000000000000 (size!3742 (_keys!5429 thiss!1248))))))

(assert (=> d!52417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5429 thiss!1248) (mask!8454 thiss!1248)) e!114239)))

(declare-fun b!172957 () Bool)

(declare-fun call!17527 () Bool)

(assert (=> b!172957 (= e!114238 call!17527)))

(declare-fun b!172958 () Bool)

(declare-fun e!114240 () Bool)

(assert (=> b!172958 (= e!114240 call!17527)))

(declare-fun b!172959 () Bool)

(assert (=> b!172959 (= e!114238 e!114240)))

(declare-fun lt!85519 () (_ BitVec 64))

(assert (=> b!172959 (= lt!85519 (select (arr!3442 (_keys!5429 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5287 0))(
  ( (Unit!5288) )
))
(declare-fun lt!85521 () Unit!5287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7245 (_ BitVec 64) (_ BitVec 32)) Unit!5287)

(assert (=> b!172959 (= lt!85521 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5429 thiss!1248) lt!85519 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172959 (arrayContainsKey!0 (_keys!5429 thiss!1248) lt!85519 #b00000000000000000000000000000000)))

(declare-fun lt!85520 () Unit!5287)

(assert (=> b!172959 (= lt!85520 lt!85521)))

(declare-fun res!82090 () Bool)

(declare-datatypes ((SeekEntryResult!551 0))(
  ( (MissingZero!551 (index!4372 (_ BitVec 32))) (Found!551 (index!4373 (_ BitVec 32))) (Intermediate!551 (undefined!1363 Bool) (index!4374 (_ BitVec 32)) (x!19157 (_ BitVec 32))) (Undefined!551) (MissingVacant!551 (index!4375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7245 (_ BitVec 32)) SeekEntryResult!551)

(assert (=> b!172959 (= res!82090 (= (seekEntryOrOpen!0 (select (arr!3442 (_keys!5429 thiss!1248)) #b00000000000000000000000000000000) (_keys!5429 thiss!1248) (mask!8454 thiss!1248)) (Found!551 #b00000000000000000000000000000000)))))

(assert (=> b!172959 (=> (not res!82090) (not e!114240))))

(declare-fun bm!17524 () Bool)

(assert (=> bm!17524 (= call!17527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5429 thiss!1248) (mask!8454 thiss!1248)))))

(assert (= (and d!52417 (not res!82089)) b!172956))

(assert (= (and b!172956 c!30864) b!172959))

(assert (= (and b!172956 (not c!30864)) b!172957))

(assert (= (and b!172959 res!82090) b!172958))

(assert (= (or b!172958 b!172957) bm!17524))

(declare-fun m!200929 () Bool)

(assert (=> b!172956 m!200929))

(assert (=> b!172956 m!200929))

(declare-fun m!200931 () Bool)

(assert (=> b!172956 m!200931))

(assert (=> b!172959 m!200929))

(declare-fun m!200933 () Bool)

(assert (=> b!172959 m!200933))

(declare-fun m!200935 () Bool)

(assert (=> b!172959 m!200935))

(assert (=> b!172959 m!200929))

(declare-fun m!200937 () Bool)

(assert (=> b!172959 m!200937))

(declare-fun m!200939 () Bool)

(assert (=> bm!17524 m!200939))

(assert (=> b!172892 d!52417))

(declare-fun d!52419 () Bool)

(declare-fun res!82097 () Bool)

(declare-fun e!114243 () Bool)

(assert (=> d!52419 (=> (not res!82097) (not e!114243))))

(declare-fun simpleValid!142 (LongMapFixedSize!2290) Bool)

(assert (=> d!52419 (= res!82097 (simpleValid!142 thiss!1248))))

(assert (=> d!52419 (= (valid!986 thiss!1248) e!114243)))

(declare-fun b!172966 () Bool)

(declare-fun res!82098 () Bool)

(assert (=> b!172966 (=> (not res!82098) (not e!114243))))

(declare-fun arrayCountValidKeys!0 (array!7245 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172966 (= res!82098 (= (arrayCountValidKeys!0 (_keys!5429 thiss!1248) #b00000000000000000000000000000000 (size!3742 (_keys!5429 thiss!1248))) (_size!1194 thiss!1248)))))

(declare-fun b!172967 () Bool)

(declare-fun res!82099 () Bool)

(assert (=> b!172967 (=> (not res!82099) (not e!114243))))

(assert (=> b!172967 (= res!82099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5429 thiss!1248) (mask!8454 thiss!1248)))))

(declare-fun b!172968 () Bool)

(declare-datatypes ((List!2212 0))(
  ( (Nil!2209) (Cons!2208 (h!2825 (_ BitVec 64)) (t!7010 List!2212)) )
))
(declare-fun arrayNoDuplicates!0 (array!7245 (_ BitVec 32) List!2212) Bool)

(assert (=> b!172968 (= e!114243 (arrayNoDuplicates!0 (_keys!5429 thiss!1248) #b00000000000000000000000000000000 Nil!2209))))

(assert (= (and d!52419 res!82097) b!172966))

(assert (= (and b!172966 res!82098) b!172967))

(assert (= (and b!172967 res!82099) b!172968))

(declare-fun m!200941 () Bool)

(assert (=> d!52419 m!200941))

(declare-fun m!200943 () Bool)

(assert (=> b!172966 m!200943))

(assert (=> b!172967 m!200897))

(declare-fun m!200945 () Bool)

(assert (=> b!172968 m!200945))

(assert (=> start!17254 d!52419))

(declare-fun d!52421 () Bool)

(assert (=> d!52421 (= (array_inv!2217 (_keys!5429 thiss!1248)) (bvsge (size!3742 (_keys!5429 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172899 d!52421))

(declare-fun d!52423 () Bool)

(assert (=> d!52423 (= (array_inv!2218 (_values!3574 thiss!1248)) (bvsge (size!3743 (_values!3574 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172899 d!52423))

(declare-fun b!172976 () Bool)

(declare-fun e!114249 () Bool)

(assert (=> b!172976 (= e!114249 tp_is_empty!4069)))

(declare-fun mapNonEmpty!6933 () Bool)

(declare-fun mapRes!6933 () Bool)

(declare-fun tp!15564 () Bool)

(declare-fun e!114248 () Bool)

(assert (=> mapNonEmpty!6933 (= mapRes!6933 (and tp!15564 e!114248))))

(declare-fun mapRest!6933 () (Array (_ BitVec 32) ValueCell!1691))

(declare-fun mapKey!6933 () (_ BitVec 32))

(declare-fun mapValue!6933 () ValueCell!1691)

(assert (=> mapNonEmpty!6933 (= mapRest!6924 (store mapRest!6933 mapKey!6933 mapValue!6933))))

(declare-fun mapIsEmpty!6933 () Bool)

(assert (=> mapIsEmpty!6933 mapRes!6933))

(declare-fun b!172975 () Bool)

(assert (=> b!172975 (= e!114248 tp_is_empty!4069)))

(declare-fun condMapEmpty!6933 () Bool)

(declare-fun mapDefault!6933 () ValueCell!1691)

(assert (=> mapNonEmpty!6924 (= condMapEmpty!6933 (= mapRest!6924 ((as const (Array (_ BitVec 32) ValueCell!1691)) mapDefault!6933)))))

(assert (=> mapNonEmpty!6924 (= tp!15548 (and e!114249 mapRes!6933))))

(assert (= (and mapNonEmpty!6924 condMapEmpty!6933) mapIsEmpty!6933))

(assert (= (and mapNonEmpty!6924 (not condMapEmpty!6933)) mapNonEmpty!6933))

(assert (= (and mapNonEmpty!6933 ((_ is ValueCellFull!1691) mapValue!6933)) b!172975))

(assert (= (and mapNonEmpty!6924 ((_ is ValueCellFull!1691) mapDefault!6933)) b!172976))

(declare-fun m!200947 () Bool)

(assert (=> mapNonEmpty!6933 m!200947))

(check-sat (not bm!17524) (not b_next!4297) (not b!172966) (not b!172959) (not mapNonEmpty!6933) (not b!172967) b_and!10711 tp_is_empty!4069 (not b!172968) (not d!52419) (not b!172956))
(check-sat b_and!10711 (not b_next!4297))
