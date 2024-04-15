; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16358 () Bool)

(assert start!16358)

(declare-fun b!162904 () Bool)

(declare-fun b_free!3781 () Bool)

(declare-fun b_next!3781 () Bool)

(assert (=> b!162904 (= b_free!3781 (not b_next!3781))))

(declare-fun tp!13919 () Bool)

(declare-fun b_and!10169 () Bool)

(assert (=> b!162904 (= tp!13919 b_and!10169)))

(declare-fun b!162900 () Bool)

(declare-fun e!106857 () Bool)

(declare-datatypes ((V!4425 0))(
  ( (V!4426 (val!1836 Int)) )
))
(declare-datatypes ((ValueCell!1448 0))(
  ( (ValueCellFull!1448 (v!3695 V!4425)) (EmptyCell!1448) )
))
(declare-datatypes ((array!6229 0))(
  ( (array!6230 (arr!2956 (Array (_ BitVec 32) (_ BitVec 64))) (size!3242 (_ BitVec 32))) )
))
(declare-datatypes ((array!6231 0))(
  ( (array!6232 (arr!2957 (Array (_ BitVec 32) ValueCell!1448)) (size!3243 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1804 0))(
  ( (LongMapFixedSize!1805 (defaultEntry!3344 Int) (mask!7987 (_ BitVec 32)) (extraKeys!3085 (_ BitVec 32)) (zeroValue!3187 V!4425) (minValue!3187 V!4425) (_size!951 (_ BitVec 32)) (_keys!5149 array!6229) (_values!3327 array!6231) (_vacant!951 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1804)

(assert (=> b!162900 (= e!106857 (and (= (size!3243 (_values!3327 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7987 thiss!1248))) (not (= (size!3242 (_keys!5149 thiss!1248)) (size!3243 (_values!3327 thiss!1248))))))))

(declare-fun b!162901 () Bool)

(declare-fun e!106858 () Bool)

(declare-fun tp_is_empty!3583 () Bool)

(assert (=> b!162901 (= e!106858 tp_is_empty!3583)))

(declare-fun b!162902 () Bool)

(declare-fun e!106860 () Bool)

(assert (=> b!162902 (= e!106860 e!106857)))

(declare-fun res!77095 () Bool)

(assert (=> b!162902 (=> (not res!77095) (not e!106857))))

(declare-datatypes ((SeekEntryResult!406 0))(
  ( (MissingZero!406 (index!3792 (_ BitVec 32))) (Found!406 (index!3793 (_ BitVec 32))) (Intermediate!406 (undefined!1218 Bool) (index!3794 (_ BitVec 32)) (x!18070 (_ BitVec 32))) (Undefined!406) (MissingVacant!406 (index!3795 (_ BitVec 32))) )
))
(declare-fun lt!82422 () SeekEntryResult!406)

(get-info :version)

(assert (=> b!162902 (= res!77095 (and (not ((_ is Undefined!406) lt!82422)) (not ((_ is MissingVacant!406) lt!82422)) (not ((_ is MissingZero!406) lt!82422)) ((_ is Found!406) lt!82422)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6229 (_ BitVec 32)) SeekEntryResult!406)

(assert (=> b!162902 (= lt!82422 (seekEntryOrOpen!0 key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(declare-fun mapNonEmpty!6069 () Bool)

(declare-fun mapRes!6069 () Bool)

(declare-fun tp!13920 () Bool)

(declare-fun e!106859 () Bool)

(assert (=> mapNonEmpty!6069 (= mapRes!6069 (and tp!13920 e!106859))))

(declare-fun mapRest!6069 () (Array (_ BitVec 32) ValueCell!1448))

(declare-fun mapKey!6069 () (_ BitVec 32))

(declare-fun mapValue!6069 () ValueCell!1448)

(assert (=> mapNonEmpty!6069 (= (arr!2957 (_values!3327 thiss!1248)) (store mapRest!6069 mapKey!6069 mapValue!6069))))

(declare-fun b!162903 () Bool)

(declare-fun res!77097 () Bool)

(assert (=> b!162903 (=> (not res!77097) (not e!106857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162903 (= res!77097 (validMask!0 (mask!7987 thiss!1248)))))

(declare-fun res!77098 () Bool)

(assert (=> start!16358 (=> (not res!77098) (not e!106860))))

(declare-fun valid!816 (LongMapFixedSize!1804) Bool)

(assert (=> start!16358 (= res!77098 (valid!816 thiss!1248))))

(assert (=> start!16358 e!106860))

(declare-fun e!106862 () Bool)

(assert (=> start!16358 e!106862))

(assert (=> start!16358 true))

(declare-fun e!106861 () Bool)

(declare-fun array_inv!1903 (array!6229) Bool)

(declare-fun array_inv!1904 (array!6231) Bool)

(assert (=> b!162904 (= e!106862 (and tp!13919 tp_is_empty!3583 (array_inv!1903 (_keys!5149 thiss!1248)) (array_inv!1904 (_values!3327 thiss!1248)) e!106861))))

(declare-fun b!162905 () Bool)

(assert (=> b!162905 (= e!106859 tp_is_empty!3583)))

(declare-fun b!162906 () Bool)

(assert (=> b!162906 (= e!106861 (and e!106858 mapRes!6069))))

(declare-fun condMapEmpty!6069 () Bool)

(declare-fun mapDefault!6069 () ValueCell!1448)

(assert (=> b!162906 (= condMapEmpty!6069 (= (arr!2957 (_values!3327 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1448)) mapDefault!6069)))))

(declare-fun b!162907 () Bool)

(declare-fun res!77096 () Bool)

(assert (=> b!162907 (=> (not res!77096) (not e!106860))))

(assert (=> b!162907 (= res!77096 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6069 () Bool)

(assert (=> mapIsEmpty!6069 mapRes!6069))

(assert (= (and start!16358 res!77098) b!162907))

(assert (= (and b!162907 res!77096) b!162902))

(assert (= (and b!162902 res!77095) b!162903))

(assert (= (and b!162903 res!77097) b!162900))

(assert (= (and b!162906 condMapEmpty!6069) mapIsEmpty!6069))

(assert (= (and b!162906 (not condMapEmpty!6069)) mapNonEmpty!6069))

(assert (= (and mapNonEmpty!6069 ((_ is ValueCellFull!1448) mapValue!6069)) b!162905))

(assert (= (and b!162906 ((_ is ValueCellFull!1448) mapDefault!6069)) b!162901))

(assert (= b!162904 b!162906))

(assert (= start!16358 b!162904))

(declare-fun m!193293 () Bool)

(assert (=> b!162904 m!193293))

(declare-fun m!193295 () Bool)

(assert (=> b!162904 m!193295))

(declare-fun m!193297 () Bool)

(assert (=> b!162902 m!193297))

(declare-fun m!193299 () Bool)

(assert (=> mapNonEmpty!6069 m!193299))

(declare-fun m!193301 () Bool)

(assert (=> start!16358 m!193301))

(declare-fun m!193303 () Bool)

(assert (=> b!162903 m!193303))

(check-sat (not b!162903) (not b!162904) tp_is_empty!3583 b_and!10169 (not mapNonEmpty!6069) (not b_next!3781) (not start!16358) (not b!162902))
(check-sat b_and!10169 (not b_next!3781))
(get-model)

(declare-fun d!51247 () Bool)

(assert (=> d!51247 (= (array_inv!1903 (_keys!5149 thiss!1248)) (bvsge (size!3242 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162904 d!51247))

(declare-fun d!51249 () Bool)

(assert (=> d!51249 (= (array_inv!1904 (_values!3327 thiss!1248)) (bvsge (size!3243 (_values!3327 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162904 d!51249))

(declare-fun d!51251 () Bool)

(assert (=> d!51251 (= (validMask!0 (mask!7987 thiss!1248)) (and (or (= (mask!7987 thiss!1248) #b00000000000000000000000000000111) (= (mask!7987 thiss!1248) #b00000000000000000000000000001111) (= (mask!7987 thiss!1248) #b00000000000000000000000000011111) (= (mask!7987 thiss!1248) #b00000000000000000000000000111111) (= (mask!7987 thiss!1248) #b00000000000000000000000001111111) (= (mask!7987 thiss!1248) #b00000000000000000000000011111111) (= (mask!7987 thiss!1248) #b00000000000000000000000111111111) (= (mask!7987 thiss!1248) #b00000000000000000000001111111111) (= (mask!7987 thiss!1248) #b00000000000000000000011111111111) (= (mask!7987 thiss!1248) #b00000000000000000000111111111111) (= (mask!7987 thiss!1248) #b00000000000000000001111111111111) (= (mask!7987 thiss!1248) #b00000000000000000011111111111111) (= (mask!7987 thiss!1248) #b00000000000000000111111111111111) (= (mask!7987 thiss!1248) #b00000000000000001111111111111111) (= (mask!7987 thiss!1248) #b00000000000000011111111111111111) (= (mask!7987 thiss!1248) #b00000000000000111111111111111111) (= (mask!7987 thiss!1248) #b00000000000001111111111111111111) (= (mask!7987 thiss!1248) #b00000000000011111111111111111111) (= (mask!7987 thiss!1248) #b00000000000111111111111111111111) (= (mask!7987 thiss!1248) #b00000000001111111111111111111111) (= (mask!7987 thiss!1248) #b00000000011111111111111111111111) (= (mask!7987 thiss!1248) #b00000000111111111111111111111111) (= (mask!7987 thiss!1248) #b00000001111111111111111111111111) (= (mask!7987 thiss!1248) #b00000011111111111111111111111111) (= (mask!7987 thiss!1248) #b00000111111111111111111111111111) (= (mask!7987 thiss!1248) #b00001111111111111111111111111111) (= (mask!7987 thiss!1248) #b00011111111111111111111111111111) (= (mask!7987 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7987 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162903 d!51251))

(declare-fun d!51253 () Bool)

(declare-fun res!77129 () Bool)

(declare-fun e!106908 () Bool)

(assert (=> d!51253 (=> (not res!77129) (not e!106908))))

(declare-fun simpleValid!120 (LongMapFixedSize!1804) Bool)

(assert (=> d!51253 (= res!77129 (simpleValid!120 thiss!1248))))

(assert (=> d!51253 (= (valid!816 thiss!1248) e!106908)))

(declare-fun b!162962 () Bool)

(declare-fun res!77130 () Bool)

(assert (=> b!162962 (=> (not res!77130) (not e!106908))))

(declare-fun arrayCountValidKeys!0 (array!6229 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162962 (= res!77130 (= (arrayCountValidKeys!0 (_keys!5149 thiss!1248) #b00000000000000000000000000000000 (size!3242 (_keys!5149 thiss!1248))) (_size!951 thiss!1248)))))

(declare-fun b!162963 () Bool)

(declare-fun res!77131 () Bool)

(assert (=> b!162963 (=> (not res!77131) (not e!106908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6229 (_ BitVec 32)) Bool)

(assert (=> b!162963 (= res!77131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(declare-fun b!162964 () Bool)

(declare-datatypes ((List!1995 0))(
  ( (Nil!1992) (Cons!1991 (h!2605 (_ BitVec 64)) (t!6788 List!1995)) )
))
(declare-fun arrayNoDuplicates!0 (array!6229 (_ BitVec 32) List!1995) Bool)

(assert (=> b!162964 (= e!106908 (arrayNoDuplicates!0 (_keys!5149 thiss!1248) #b00000000000000000000000000000000 Nil!1992))))

(assert (= (and d!51253 res!77129) b!162962))

(assert (= (and b!162962 res!77130) b!162963))

(assert (= (and b!162963 res!77131) b!162964))

(declare-fun m!193329 () Bool)

(assert (=> d!51253 m!193329))

(declare-fun m!193331 () Bool)

(assert (=> b!162962 m!193331))

(declare-fun m!193333 () Bool)

(assert (=> b!162963 m!193333))

(declare-fun m!193335 () Bool)

(assert (=> b!162964 m!193335))

(assert (=> start!16358 d!51253))

(declare-fun d!51255 () Bool)

(declare-fun lt!82436 () SeekEntryResult!406)

(assert (=> d!51255 (and (or ((_ is Undefined!406) lt!82436) (not ((_ is Found!406) lt!82436)) (and (bvsge (index!3793 lt!82436) #b00000000000000000000000000000000) (bvslt (index!3793 lt!82436) (size!3242 (_keys!5149 thiss!1248))))) (or ((_ is Undefined!406) lt!82436) ((_ is Found!406) lt!82436) (not ((_ is MissingZero!406) lt!82436)) (and (bvsge (index!3792 lt!82436) #b00000000000000000000000000000000) (bvslt (index!3792 lt!82436) (size!3242 (_keys!5149 thiss!1248))))) (or ((_ is Undefined!406) lt!82436) ((_ is Found!406) lt!82436) ((_ is MissingZero!406) lt!82436) (not ((_ is MissingVacant!406) lt!82436)) (and (bvsge (index!3795 lt!82436) #b00000000000000000000000000000000) (bvslt (index!3795 lt!82436) (size!3242 (_keys!5149 thiss!1248))))) (or ((_ is Undefined!406) lt!82436) (ite ((_ is Found!406) lt!82436) (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3793 lt!82436)) key!828) (ite ((_ is MissingZero!406) lt!82436) (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3792 lt!82436)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!406) lt!82436) (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3795 lt!82436)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!106915 () SeekEntryResult!406)

(assert (=> d!51255 (= lt!82436 e!106915)))

(declare-fun c!30006 () Bool)

(declare-fun lt!82435 () SeekEntryResult!406)

(assert (=> d!51255 (= c!30006 (and ((_ is Intermediate!406) lt!82435) (undefined!1218 lt!82435)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6229 (_ BitVec 32)) SeekEntryResult!406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51255 (= lt!82435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7987 thiss!1248)) key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(assert (=> d!51255 (validMask!0 (mask!7987 thiss!1248))))

(assert (=> d!51255 (= (seekEntryOrOpen!0 key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)) lt!82436)))

(declare-fun b!162977 () Bool)

(declare-fun e!106916 () SeekEntryResult!406)

(assert (=> b!162977 (= e!106916 (MissingZero!406 (index!3794 lt!82435)))))

(declare-fun b!162978 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6229 (_ BitVec 32)) SeekEntryResult!406)

(assert (=> b!162978 (= e!106916 (seekKeyOrZeroReturnVacant!0 (x!18070 lt!82435) (index!3794 lt!82435) (index!3794 lt!82435) key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(declare-fun b!162979 () Bool)

(declare-fun c!30007 () Bool)

(declare-fun lt!82437 () (_ BitVec 64))

(assert (=> b!162979 (= c!30007 (= lt!82437 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!106917 () SeekEntryResult!406)

(assert (=> b!162979 (= e!106917 e!106916)))

(declare-fun b!162980 () Bool)

(assert (=> b!162980 (= e!106915 e!106917)))

(assert (=> b!162980 (= lt!82437 (select (arr!2956 (_keys!5149 thiss!1248)) (index!3794 lt!82435)))))

(declare-fun c!30008 () Bool)

(assert (=> b!162980 (= c!30008 (= lt!82437 key!828))))

(declare-fun b!162981 () Bool)

(assert (=> b!162981 (= e!106915 Undefined!406)))

(declare-fun b!162982 () Bool)

(assert (=> b!162982 (= e!106917 (Found!406 (index!3794 lt!82435)))))

(assert (= (and d!51255 c!30006) b!162981))

(assert (= (and d!51255 (not c!30006)) b!162980))

(assert (= (and b!162980 c!30008) b!162982))

(assert (= (and b!162980 (not c!30008)) b!162979))

(assert (= (and b!162979 c!30007) b!162977))

(assert (= (and b!162979 (not c!30007)) b!162978))

(declare-fun m!193337 () Bool)

(assert (=> d!51255 m!193337))

(declare-fun m!193339 () Bool)

(assert (=> d!51255 m!193339))

(declare-fun m!193341 () Bool)

(assert (=> d!51255 m!193341))

(declare-fun m!193343 () Bool)

(assert (=> d!51255 m!193343))

(assert (=> d!51255 m!193339))

(declare-fun m!193345 () Bool)

(assert (=> d!51255 m!193345))

(assert (=> d!51255 m!193303))

(declare-fun m!193347 () Bool)

(assert (=> b!162978 m!193347))

(declare-fun m!193349 () Bool)

(assert (=> b!162980 m!193349))

(assert (=> b!162902 d!51255))

(declare-fun mapNonEmpty!6078 () Bool)

(declare-fun mapRes!6078 () Bool)

(declare-fun tp!13935 () Bool)

(declare-fun e!106923 () Bool)

(assert (=> mapNonEmpty!6078 (= mapRes!6078 (and tp!13935 e!106923))))

(declare-fun mapValue!6078 () ValueCell!1448)

(declare-fun mapKey!6078 () (_ BitVec 32))

(declare-fun mapRest!6078 () (Array (_ BitVec 32) ValueCell!1448))

(assert (=> mapNonEmpty!6078 (= mapRest!6069 (store mapRest!6078 mapKey!6078 mapValue!6078))))

(declare-fun b!162990 () Bool)

(declare-fun e!106922 () Bool)

(assert (=> b!162990 (= e!106922 tp_is_empty!3583)))

(declare-fun b!162989 () Bool)

(assert (=> b!162989 (= e!106923 tp_is_empty!3583)))

(declare-fun condMapEmpty!6078 () Bool)

(declare-fun mapDefault!6078 () ValueCell!1448)

(assert (=> mapNonEmpty!6069 (= condMapEmpty!6078 (= mapRest!6069 ((as const (Array (_ BitVec 32) ValueCell!1448)) mapDefault!6078)))))

(assert (=> mapNonEmpty!6069 (= tp!13920 (and e!106922 mapRes!6078))))

(declare-fun mapIsEmpty!6078 () Bool)

(assert (=> mapIsEmpty!6078 mapRes!6078))

(assert (= (and mapNonEmpty!6069 condMapEmpty!6078) mapIsEmpty!6078))

(assert (= (and mapNonEmpty!6069 (not condMapEmpty!6078)) mapNonEmpty!6078))

(assert (= (and mapNonEmpty!6078 ((_ is ValueCellFull!1448) mapValue!6078)) b!162989))

(assert (= (and mapNonEmpty!6069 ((_ is ValueCellFull!1448) mapDefault!6078)) b!162990))

(declare-fun m!193351 () Bool)

(assert (=> mapNonEmpty!6078 m!193351))

(check-sat (not b!162963) (not mapNonEmpty!6078) tp_is_empty!3583 b_and!10169 (not b!162964) (not b!162978) (not b_next!3781) (not b!162962) (not d!51255) (not d!51253))
(check-sat b_and!10169 (not b_next!3781))
(get-model)

(declare-fun d!51257 () Bool)

(declare-fun lt!82440 () (_ BitVec 32))

(assert (=> d!51257 (and (bvsge lt!82440 #b00000000000000000000000000000000) (bvsle lt!82440 (bvsub (size!3242 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!106928 () (_ BitVec 32))

(assert (=> d!51257 (= lt!82440 e!106928)))

(declare-fun c!30014 () Bool)

(assert (=> d!51257 (= c!30014 (bvsge #b00000000000000000000000000000000 (size!3242 (_keys!5149 thiss!1248))))))

(assert (=> d!51257 (and (bvsle #b00000000000000000000000000000000 (size!3242 (_keys!5149 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3242 (_keys!5149 thiss!1248)) (size!3242 (_keys!5149 thiss!1248))))))

(assert (=> d!51257 (= (arrayCountValidKeys!0 (_keys!5149 thiss!1248) #b00000000000000000000000000000000 (size!3242 (_keys!5149 thiss!1248))) lt!82440)))

(declare-fun bm!17269 () Bool)

(declare-fun call!17272 () (_ BitVec 32))

(assert (=> bm!17269 (= call!17272 (arrayCountValidKeys!0 (_keys!5149 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3242 (_keys!5149 thiss!1248))))))

(declare-fun b!162999 () Bool)

(declare-fun e!106929 () (_ BitVec 32))

(assert (=> b!162999 (= e!106928 e!106929)))

(declare-fun c!30013 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!162999 (= c!30013 (validKeyInArray!0 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163000 () Bool)

(assert (=> b!163000 (= e!106928 #b00000000000000000000000000000000)))

(declare-fun b!163001 () Bool)

(assert (=> b!163001 (= e!106929 call!17272)))

(declare-fun b!163002 () Bool)

(assert (=> b!163002 (= e!106929 (bvadd #b00000000000000000000000000000001 call!17272))))

(assert (= (and d!51257 c!30014) b!163000))

(assert (= (and d!51257 (not c!30014)) b!162999))

(assert (= (and b!162999 c!30013) b!163002))

(assert (= (and b!162999 (not c!30013)) b!163001))

(assert (= (or b!163002 b!163001) bm!17269))

(declare-fun m!193353 () Bool)

(assert (=> bm!17269 m!193353))

(declare-fun m!193355 () Bool)

(assert (=> b!162999 m!193355))

(assert (=> b!162999 m!193355))

(declare-fun m!193357 () Bool)

(assert (=> b!162999 m!193357))

(assert (=> b!162962 d!51257))

(declare-fun b!163011 () Bool)

(declare-fun e!106937 () Bool)

(declare-fun e!106938 () Bool)

(assert (=> b!163011 (= e!106937 e!106938)))

(declare-fun lt!82447 () (_ BitVec 64))

(assert (=> b!163011 (= lt!82447 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5007 0))(
  ( (Unit!5008) )
))
(declare-fun lt!82448 () Unit!5007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6229 (_ BitVec 64) (_ BitVec 32)) Unit!5007)

(assert (=> b!163011 (= lt!82448 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5149 thiss!1248) lt!82447 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163011 (arrayContainsKey!0 (_keys!5149 thiss!1248) lt!82447 #b00000000000000000000000000000000)))

(declare-fun lt!82449 () Unit!5007)

(assert (=> b!163011 (= lt!82449 lt!82448)))

(declare-fun res!77137 () Bool)

(assert (=> b!163011 (= res!77137 (= (seekEntryOrOpen!0 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000) (_keys!5149 thiss!1248) (mask!7987 thiss!1248)) (Found!406 #b00000000000000000000000000000000)))))

(assert (=> b!163011 (=> (not res!77137) (not e!106938))))

(declare-fun d!51259 () Bool)

(declare-fun res!77136 () Bool)

(declare-fun e!106936 () Bool)

(assert (=> d!51259 (=> res!77136 e!106936)))

(assert (=> d!51259 (= res!77136 (bvsge #b00000000000000000000000000000000 (size!3242 (_keys!5149 thiss!1248))))))

(assert (=> d!51259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)) e!106936)))

(declare-fun bm!17272 () Bool)

(declare-fun call!17275 () Bool)

(assert (=> bm!17272 (= call!17275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(declare-fun b!163012 () Bool)

(assert (=> b!163012 (= e!106936 e!106937)))

(declare-fun c!30017 () Bool)

(assert (=> b!163012 (= c!30017 (validKeyInArray!0 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163013 () Bool)

(assert (=> b!163013 (= e!106937 call!17275)))

(declare-fun b!163014 () Bool)

(assert (=> b!163014 (= e!106938 call!17275)))

(assert (= (and d!51259 (not res!77136)) b!163012))

(assert (= (and b!163012 c!30017) b!163011))

(assert (= (and b!163012 (not c!30017)) b!163013))

(assert (= (and b!163011 res!77137) b!163014))

(assert (= (or b!163014 b!163013) bm!17272))

(assert (=> b!163011 m!193355))

(declare-fun m!193359 () Bool)

(assert (=> b!163011 m!193359))

(declare-fun m!193361 () Bool)

(assert (=> b!163011 m!193361))

(assert (=> b!163011 m!193355))

(declare-fun m!193363 () Bool)

(assert (=> b!163011 m!193363))

(declare-fun m!193365 () Bool)

(assert (=> bm!17272 m!193365))

(assert (=> b!163012 m!193355))

(assert (=> b!163012 m!193355))

(assert (=> b!163012 m!193357))

(assert (=> b!162963 d!51259))

(declare-fun b!163023 () Bool)

(declare-fun res!77147 () Bool)

(declare-fun e!106941 () Bool)

(assert (=> b!163023 (=> (not res!77147) (not e!106941))))

(assert (=> b!163023 (= res!77147 (and (= (size!3243 (_values!3327 thiss!1248)) (bvadd (mask!7987 thiss!1248) #b00000000000000000000000000000001)) (= (size!3242 (_keys!5149 thiss!1248)) (size!3243 (_values!3327 thiss!1248))) (bvsge (_size!951 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!951 thiss!1248) (bvadd (mask!7987 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163025 () Bool)

(declare-fun res!77148 () Bool)

(assert (=> b!163025 (=> (not res!77148) (not e!106941))))

(declare-fun size!3248 (LongMapFixedSize!1804) (_ BitVec 32))

(assert (=> b!163025 (= res!77148 (= (size!3248 thiss!1248) (bvadd (_size!951 thiss!1248) (bvsdiv (bvadd (extraKeys!3085 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163026 () Bool)

(assert (=> b!163026 (= e!106941 (and (bvsge (extraKeys!3085 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3085 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!951 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163024 () Bool)

(declare-fun res!77146 () Bool)

(assert (=> b!163024 (=> (not res!77146) (not e!106941))))

(assert (=> b!163024 (= res!77146 (bvsge (size!3248 thiss!1248) (_size!951 thiss!1248)))))

(declare-fun d!51261 () Bool)

(declare-fun res!77149 () Bool)

(assert (=> d!51261 (=> (not res!77149) (not e!106941))))

(assert (=> d!51261 (= res!77149 (validMask!0 (mask!7987 thiss!1248)))))

(assert (=> d!51261 (= (simpleValid!120 thiss!1248) e!106941)))

(assert (= (and d!51261 res!77149) b!163023))

(assert (= (and b!163023 res!77147) b!163024))

(assert (= (and b!163024 res!77146) b!163025))

(assert (= (and b!163025 res!77148) b!163026))

(declare-fun m!193367 () Bool)

(assert (=> b!163025 m!193367))

(assert (=> b!163024 m!193367))

(assert (=> d!51261 m!193303))

(assert (=> d!51253 d!51261))

(declare-fun d!51263 () Bool)

(declare-fun e!106953 () Bool)

(assert (=> d!51263 e!106953))

(declare-fun c!30026 () Bool)

(declare-fun lt!82455 () SeekEntryResult!406)

(assert (=> d!51263 (= c!30026 (and ((_ is Intermediate!406) lt!82455) (undefined!1218 lt!82455)))))

(declare-fun e!106952 () SeekEntryResult!406)

(assert (=> d!51263 (= lt!82455 e!106952)))

(declare-fun c!30024 () Bool)

(assert (=> d!51263 (= c!30024 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!82454 () (_ BitVec 64))

(assert (=> d!51263 (= lt!82454 (select (arr!2956 (_keys!5149 thiss!1248)) (toIndex!0 key!828 (mask!7987 thiss!1248))))))

(assert (=> d!51263 (validMask!0 (mask!7987 thiss!1248))))

(assert (=> d!51263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7987 thiss!1248)) key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)) lt!82455)))

(declare-fun b!163045 () Bool)

(assert (=> b!163045 (and (bvsge (index!3794 lt!82455) #b00000000000000000000000000000000) (bvslt (index!3794 lt!82455) (size!3242 (_keys!5149 thiss!1248))))))

(declare-fun res!77158 () Bool)

(assert (=> b!163045 (= res!77158 (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3794 lt!82455)) key!828))))

(declare-fun e!106954 () Bool)

(assert (=> b!163045 (=> res!77158 e!106954)))

(declare-fun e!106955 () Bool)

(assert (=> b!163045 (= e!106955 e!106954)))

(declare-fun b!163046 () Bool)

(declare-fun e!106956 () SeekEntryResult!406)

(assert (=> b!163046 (= e!106956 (Intermediate!406 false (toIndex!0 key!828 (mask!7987 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163047 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163047 (= e!106956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7987 thiss!1248)) #b00000000000000000000000000000000 (mask!7987 thiss!1248)) key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(declare-fun b!163048 () Bool)

(assert (=> b!163048 (and (bvsge (index!3794 lt!82455) #b00000000000000000000000000000000) (bvslt (index!3794 lt!82455) (size!3242 (_keys!5149 thiss!1248))))))

(assert (=> b!163048 (= e!106954 (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3794 lt!82455)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163049 () Bool)

(assert (=> b!163049 (= e!106953 e!106955)))

(declare-fun res!77156 () Bool)

(assert (=> b!163049 (= res!77156 (and ((_ is Intermediate!406) lt!82455) (not (undefined!1218 lt!82455)) (bvslt (x!18070 lt!82455) #b01111111111111111111111111111110) (bvsge (x!18070 lt!82455) #b00000000000000000000000000000000) (bvsge (x!18070 lt!82455) #b00000000000000000000000000000000)))))

(assert (=> b!163049 (=> (not res!77156) (not e!106955))))

(declare-fun b!163050 () Bool)

(assert (=> b!163050 (= e!106952 (Intermediate!406 true (toIndex!0 key!828 (mask!7987 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163051 () Bool)

(assert (=> b!163051 (= e!106952 e!106956)))

(declare-fun c!30025 () Bool)

(assert (=> b!163051 (= c!30025 (or (= lt!82454 key!828) (= (bvadd lt!82454 lt!82454) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163052 () Bool)

(assert (=> b!163052 (and (bvsge (index!3794 lt!82455) #b00000000000000000000000000000000) (bvslt (index!3794 lt!82455) (size!3242 (_keys!5149 thiss!1248))))))

(declare-fun res!77157 () Bool)

(assert (=> b!163052 (= res!77157 (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3794 lt!82455)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163052 (=> res!77157 e!106954)))

(declare-fun b!163053 () Bool)

(assert (=> b!163053 (= e!106953 (bvsge (x!18070 lt!82455) #b01111111111111111111111111111110))))

(assert (= (and d!51263 c!30024) b!163050))

(assert (= (and d!51263 (not c!30024)) b!163051))

(assert (= (and b!163051 c!30025) b!163046))

(assert (= (and b!163051 (not c!30025)) b!163047))

(assert (= (and d!51263 c!30026) b!163053))

(assert (= (and d!51263 (not c!30026)) b!163049))

(assert (= (and b!163049 res!77156) b!163045))

(assert (= (and b!163045 (not res!77158)) b!163052))

(assert (= (and b!163052 (not res!77157)) b!163048))

(assert (=> d!51263 m!193339))

(declare-fun m!193369 () Bool)

(assert (=> d!51263 m!193369))

(assert (=> d!51263 m!193303))

(declare-fun m!193371 () Bool)

(assert (=> b!163052 m!193371))

(assert (=> b!163045 m!193371))

(assert (=> b!163047 m!193339))

(declare-fun m!193373 () Bool)

(assert (=> b!163047 m!193373))

(assert (=> b!163047 m!193373))

(declare-fun m!193375 () Bool)

(assert (=> b!163047 m!193375))

(assert (=> b!163048 m!193371))

(assert (=> d!51255 d!51263))

(declare-fun d!51265 () Bool)

(declare-fun lt!82461 () (_ BitVec 32))

(declare-fun lt!82460 () (_ BitVec 32))

(assert (=> d!51265 (= lt!82461 (bvmul (bvxor lt!82460 (bvlshr lt!82460 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51265 (= lt!82460 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51265 (and (bvsge (mask!7987 thiss!1248) #b00000000000000000000000000000000) (let ((res!77159 (let ((h!2606 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18087 (bvmul (bvxor h!2606 (bvlshr h!2606 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18087 (bvlshr x!18087 #b00000000000000000000000000001101)) (mask!7987 thiss!1248)))))) (and (bvslt res!77159 (bvadd (mask!7987 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77159 #b00000000000000000000000000000000))))))

(assert (=> d!51265 (= (toIndex!0 key!828 (mask!7987 thiss!1248)) (bvand (bvxor lt!82461 (bvlshr lt!82461 #b00000000000000000000000000001101)) (mask!7987 thiss!1248)))))

(assert (=> d!51255 d!51265))

(assert (=> d!51255 d!51251))

(declare-fun e!106963 () SeekEntryResult!406)

(declare-fun b!163066 () Bool)

(assert (=> b!163066 (= e!106963 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18070 lt!82435) #b00000000000000000000000000000001) (nextIndex!0 (index!3794 lt!82435) (x!18070 lt!82435) (mask!7987 thiss!1248)) (index!3794 lt!82435) key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)))))

(declare-fun lt!82466 () SeekEntryResult!406)

(declare-fun d!51267 () Bool)

(assert (=> d!51267 (and (or ((_ is Undefined!406) lt!82466) (not ((_ is Found!406) lt!82466)) (and (bvsge (index!3793 lt!82466) #b00000000000000000000000000000000) (bvslt (index!3793 lt!82466) (size!3242 (_keys!5149 thiss!1248))))) (or ((_ is Undefined!406) lt!82466) ((_ is Found!406) lt!82466) (not ((_ is MissingVacant!406) lt!82466)) (not (= (index!3795 lt!82466) (index!3794 lt!82435))) (and (bvsge (index!3795 lt!82466) #b00000000000000000000000000000000) (bvslt (index!3795 lt!82466) (size!3242 (_keys!5149 thiss!1248))))) (or ((_ is Undefined!406) lt!82466) (ite ((_ is Found!406) lt!82466) (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3793 lt!82466)) key!828) (and ((_ is MissingVacant!406) lt!82466) (= (index!3795 lt!82466) (index!3794 lt!82435)) (= (select (arr!2956 (_keys!5149 thiss!1248)) (index!3795 lt!82466)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!106964 () SeekEntryResult!406)

(assert (=> d!51267 (= lt!82466 e!106964)))

(declare-fun c!30034 () Bool)

(assert (=> d!51267 (= c!30034 (bvsge (x!18070 lt!82435) #b01111111111111111111111111111110))))

(declare-fun lt!82467 () (_ BitVec 64))

(assert (=> d!51267 (= lt!82467 (select (arr!2956 (_keys!5149 thiss!1248)) (index!3794 lt!82435)))))

(assert (=> d!51267 (validMask!0 (mask!7987 thiss!1248))))

(assert (=> d!51267 (= (seekKeyOrZeroReturnVacant!0 (x!18070 lt!82435) (index!3794 lt!82435) (index!3794 lt!82435) key!828 (_keys!5149 thiss!1248) (mask!7987 thiss!1248)) lt!82466)))

(declare-fun b!163067 () Bool)

(declare-fun e!106965 () SeekEntryResult!406)

(assert (=> b!163067 (= e!106965 (Found!406 (index!3794 lt!82435)))))

(declare-fun b!163068 () Bool)

(assert (=> b!163068 (= e!106964 e!106965)))

(declare-fun c!30035 () Bool)

(assert (=> b!163068 (= c!30035 (= lt!82467 key!828))))

(declare-fun b!163069 () Bool)

(assert (=> b!163069 (= e!106963 (MissingVacant!406 (index!3794 lt!82435)))))

(declare-fun b!163070 () Bool)

(declare-fun c!30033 () Bool)

(assert (=> b!163070 (= c!30033 (= lt!82467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163070 (= e!106965 e!106963)))

(declare-fun b!163071 () Bool)

(assert (=> b!163071 (= e!106964 Undefined!406)))

(assert (= (and d!51267 c!30034) b!163071))

(assert (= (and d!51267 (not c!30034)) b!163068))

(assert (= (and b!163068 c!30035) b!163067))

(assert (= (and b!163068 (not c!30035)) b!163070))

(assert (= (and b!163070 c!30033) b!163069))

(assert (= (and b!163070 (not c!30033)) b!163066))

(declare-fun m!193377 () Bool)

(assert (=> b!163066 m!193377))

(assert (=> b!163066 m!193377))

(declare-fun m!193379 () Bool)

(assert (=> b!163066 m!193379))

(declare-fun m!193381 () Bool)

(assert (=> d!51267 m!193381))

(declare-fun m!193383 () Bool)

(assert (=> d!51267 m!193383))

(assert (=> d!51267 m!193349))

(assert (=> d!51267 m!193303))

(assert (=> b!162978 d!51267))

(declare-fun d!51269 () Bool)

(declare-fun res!77166 () Bool)

(declare-fun e!106975 () Bool)

(assert (=> d!51269 (=> res!77166 e!106975)))

(assert (=> d!51269 (= res!77166 (bvsge #b00000000000000000000000000000000 (size!3242 (_keys!5149 thiss!1248))))))

(assert (=> d!51269 (= (arrayNoDuplicates!0 (_keys!5149 thiss!1248) #b00000000000000000000000000000000 Nil!1992) e!106975)))

(declare-fun b!163082 () Bool)

(declare-fun e!106974 () Bool)

(declare-fun e!106977 () Bool)

(assert (=> b!163082 (= e!106974 e!106977)))

(declare-fun c!30038 () Bool)

(assert (=> b!163082 (= c!30038 (validKeyInArray!0 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17275 () Bool)

(declare-fun call!17278 () Bool)

(assert (=> bm!17275 (= call!17278 (arrayNoDuplicates!0 (_keys!5149 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30038 (Cons!1991 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000) Nil!1992) Nil!1992)))))

(declare-fun b!163083 () Bool)

(assert (=> b!163083 (= e!106977 call!17278)))

(declare-fun b!163084 () Bool)

(assert (=> b!163084 (= e!106977 call!17278)))

(declare-fun b!163085 () Bool)

(assert (=> b!163085 (= e!106975 e!106974)))

(declare-fun res!77168 () Bool)

(assert (=> b!163085 (=> (not res!77168) (not e!106974))))

(declare-fun e!106976 () Bool)

(assert (=> b!163085 (= res!77168 (not e!106976))))

(declare-fun res!77167 () Bool)

(assert (=> b!163085 (=> (not res!77167) (not e!106976))))

(assert (=> b!163085 (= res!77167 (validKeyInArray!0 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163086 () Bool)

(declare-fun contains!1029 (List!1995 (_ BitVec 64)) Bool)

(assert (=> b!163086 (= e!106976 (contains!1029 Nil!1992 (select (arr!2956 (_keys!5149 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51269 (not res!77166)) b!163085))

(assert (= (and b!163085 res!77167) b!163086))

(assert (= (and b!163085 res!77168) b!163082))

(assert (= (and b!163082 c!30038) b!163083))

(assert (= (and b!163082 (not c!30038)) b!163084))

(assert (= (or b!163083 b!163084) bm!17275))

(assert (=> b!163082 m!193355))

(assert (=> b!163082 m!193355))

(assert (=> b!163082 m!193357))

(assert (=> bm!17275 m!193355))

(declare-fun m!193385 () Bool)

(assert (=> bm!17275 m!193385))

(assert (=> b!163085 m!193355))

(assert (=> b!163085 m!193355))

(assert (=> b!163085 m!193357))

(assert (=> b!163086 m!193355))

(assert (=> b!163086 m!193355))

(declare-fun m!193387 () Bool)

(assert (=> b!163086 m!193387))

(assert (=> b!162964 d!51269))

(declare-fun mapNonEmpty!6079 () Bool)

(declare-fun mapRes!6079 () Bool)

(declare-fun tp!13936 () Bool)

(declare-fun e!106979 () Bool)

(assert (=> mapNonEmpty!6079 (= mapRes!6079 (and tp!13936 e!106979))))

(declare-fun mapKey!6079 () (_ BitVec 32))

(declare-fun mapRest!6079 () (Array (_ BitVec 32) ValueCell!1448))

(declare-fun mapValue!6079 () ValueCell!1448)

(assert (=> mapNonEmpty!6079 (= mapRest!6078 (store mapRest!6079 mapKey!6079 mapValue!6079))))

(declare-fun b!163088 () Bool)

(declare-fun e!106978 () Bool)

(assert (=> b!163088 (= e!106978 tp_is_empty!3583)))

(declare-fun b!163087 () Bool)

(assert (=> b!163087 (= e!106979 tp_is_empty!3583)))

(declare-fun condMapEmpty!6079 () Bool)

(declare-fun mapDefault!6079 () ValueCell!1448)

(assert (=> mapNonEmpty!6078 (= condMapEmpty!6079 (= mapRest!6078 ((as const (Array (_ BitVec 32) ValueCell!1448)) mapDefault!6079)))))

(assert (=> mapNonEmpty!6078 (= tp!13935 (and e!106978 mapRes!6079))))

(declare-fun mapIsEmpty!6079 () Bool)

(assert (=> mapIsEmpty!6079 mapRes!6079))

(assert (= (and mapNonEmpty!6078 condMapEmpty!6079) mapIsEmpty!6079))

(assert (= (and mapNonEmpty!6078 (not condMapEmpty!6079)) mapNonEmpty!6079))

(assert (= (and mapNonEmpty!6079 ((_ is ValueCellFull!1448) mapValue!6079)) b!163087))

(assert (= (and mapNonEmpty!6078 ((_ is ValueCellFull!1448) mapDefault!6079)) b!163088))

(declare-fun m!193389 () Bool)

(assert (=> mapNonEmpty!6079 m!193389))

(check-sat (not b!163085) (not b!163012) (not b!163086) (not d!51261) (not d!51267) (not b!162999) (not bm!17275) (not b!163025) (not b!163011) (not b!163082) tp_is_empty!3583 b_and!10169 (not b!163066) (not b!163047) (not b_next!3781) (not b!163024) (not bm!17269) (not bm!17272) (not d!51263) (not mapNonEmpty!6079))
(check-sat b_and!10169 (not b_next!3781))
