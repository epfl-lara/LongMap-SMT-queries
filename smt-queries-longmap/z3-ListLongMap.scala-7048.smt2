; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89314 () Bool)

(assert start!89314)

(declare-fun b!1023867 () Bool)

(declare-fun b_free!20341 () Bool)

(declare-fun b_next!20341 () Bool)

(assert (=> b!1023867 (= b_free!20341 (not b_next!20341))))

(declare-fun tp!72062 () Bool)

(declare-fun b_and!32561 () Bool)

(assert (=> b!1023867 (= tp!72062 b_and!32561)))

(declare-fun b!1023862 () Bool)

(declare-fun e!577053 () Bool)

(declare-fun e!577056 () Bool)

(declare-fun mapRes!37513 () Bool)

(assert (=> b!1023862 (= e!577053 (and e!577056 mapRes!37513))))

(declare-fun condMapEmpty!37513 () Bool)

(declare-datatypes ((V!36955 0))(
  ( (V!36956 (val!12081 Int)) )
))
(declare-datatypes ((ValueCell!11327 0))(
  ( (ValueCellFull!11327 (v!14649 V!36955)) (EmptyCell!11327) )
))
(declare-datatypes ((array!64107 0))(
  ( (array!64108 (arr!30864 (Array (_ BitVec 32) (_ BitVec 64))) (size!31378 (_ BitVec 32))) )
))
(declare-datatypes ((array!64109 0))(
  ( (array!64110 (arr!30865 (Array (_ BitVec 32) ValueCell!11327)) (size!31379 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5248 0))(
  ( (LongMapFixedSize!5249 (defaultEntry!5976 Int) (mask!29610 (_ BitVec 32)) (extraKeys!5708 (_ BitVec 32)) (zeroValue!5812 V!36955) (minValue!5812 V!36955) (_size!2679 (_ BitVec 32)) (_keys!11118 array!64107) (_values!5999 array!64109) (_vacant!2679 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5248)

(declare-fun mapDefault!37513 () ValueCell!11327)

(assert (=> b!1023862 (= condMapEmpty!37513 (= (arr!30865 (_values!5999 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11327)) mapDefault!37513)))))

(declare-fun res!685606 () Bool)

(declare-fun e!577057 () Bool)

(assert (=> start!89314 (=> (not res!685606) (not e!577057))))

(declare-fun valid!1994 (LongMapFixedSize!5248) Bool)

(assert (=> start!89314 (= res!685606 (valid!1994 thiss!1427))))

(assert (=> start!89314 e!577057))

(declare-fun e!577054 () Bool)

(assert (=> start!89314 e!577054))

(assert (=> start!89314 true))

(declare-fun mapNonEmpty!37513 () Bool)

(declare-fun tp!72061 () Bool)

(declare-fun e!577055 () Bool)

(assert (=> mapNonEmpty!37513 (= mapRes!37513 (and tp!72061 e!577055))))

(declare-fun mapRest!37513 () (Array (_ BitVec 32) ValueCell!11327))

(declare-fun mapValue!37513 () ValueCell!11327)

(declare-fun mapKey!37513 () (_ BitVec 32))

(assert (=> mapNonEmpty!37513 (= (arr!30865 (_values!5999 thiss!1427)) (store mapRest!37513 mapKey!37513 mapValue!37513))))

(declare-fun mapIsEmpty!37513 () Bool)

(assert (=> mapIsEmpty!37513 mapRes!37513))

(declare-fun b!1023863 () Bool)

(assert (=> b!1023863 (= e!577057 (not (= (size!31378 (_keys!11118 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29610 thiss!1427)))))))

(declare-fun b!1023864 () Bool)

(declare-fun res!685605 () Bool)

(assert (=> b!1023864 (=> (not res!685605) (not e!577057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023864 (= res!685605 (validMask!0 (mask!29610 thiss!1427)))))

(declare-fun b!1023865 () Bool)

(declare-fun res!685604 () Bool)

(assert (=> b!1023865 (=> (not res!685604) (not e!577057))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023865 (= res!685604 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1023866 () Bool)

(declare-fun tp_is_empty!24061 () Bool)

(assert (=> b!1023866 (= e!577056 tp_is_empty!24061)))

(declare-fun array_inv!23927 (array!64107) Bool)

(declare-fun array_inv!23928 (array!64109) Bool)

(assert (=> b!1023867 (= e!577054 (and tp!72062 tp_is_empty!24061 (array_inv!23927 (_keys!11118 thiss!1427)) (array_inv!23928 (_values!5999 thiss!1427)) e!577053))))

(declare-fun b!1023868 () Bool)

(assert (=> b!1023868 (= e!577055 tp_is_empty!24061)))

(assert (= (and start!89314 res!685606) b!1023865))

(assert (= (and b!1023865 res!685604) b!1023864))

(assert (= (and b!1023864 res!685605) b!1023863))

(assert (= (and b!1023862 condMapEmpty!37513) mapIsEmpty!37513))

(assert (= (and b!1023862 (not condMapEmpty!37513)) mapNonEmpty!37513))

(get-info :version)

(assert (= (and mapNonEmpty!37513 ((_ is ValueCellFull!11327) mapValue!37513)) b!1023868))

(assert (= (and b!1023862 ((_ is ValueCellFull!11327) mapDefault!37513)) b!1023866))

(assert (= b!1023867 b!1023862))

(assert (= start!89314 b!1023867))

(declare-fun m!941915 () Bool)

(assert (=> start!89314 m!941915))

(declare-fun m!941917 () Bool)

(assert (=> mapNonEmpty!37513 m!941917))

(declare-fun m!941919 () Bool)

(assert (=> b!1023864 m!941919))

(declare-fun m!941921 () Bool)

(assert (=> b!1023867 m!941921))

(declare-fun m!941923 () Bool)

(assert (=> b!1023867 m!941923))

(check-sat (not start!89314) tp_is_empty!24061 (not mapNonEmpty!37513) b_and!32561 (not b!1023864) (not b!1023867) (not b_next!20341))
(check-sat b_and!32561 (not b_next!20341))
(get-model)

(declare-fun d!122455 () Bool)

(declare-fun res!685631 () Bool)

(declare-fun e!577096 () Bool)

(assert (=> d!122455 (=> (not res!685631) (not e!577096))))

(declare-fun simpleValid!388 (LongMapFixedSize!5248) Bool)

(assert (=> d!122455 (= res!685631 (simpleValid!388 thiss!1427))))

(assert (=> d!122455 (= (valid!1994 thiss!1427) e!577096)))

(declare-fun b!1023917 () Bool)

(declare-fun res!685632 () Bool)

(assert (=> b!1023917 (=> (not res!685632) (not e!577096))))

(declare-fun arrayCountValidKeys!0 (array!64107 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1023917 (= res!685632 (= (arrayCountValidKeys!0 (_keys!11118 thiss!1427) #b00000000000000000000000000000000 (size!31378 (_keys!11118 thiss!1427))) (_size!2679 thiss!1427)))))

(declare-fun b!1023918 () Bool)

(declare-fun res!685633 () Bool)

(assert (=> b!1023918 (=> (not res!685633) (not e!577096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64107 (_ BitVec 32)) Bool)

(assert (=> b!1023918 (= res!685633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11118 thiss!1427) (mask!29610 thiss!1427)))))

(declare-fun b!1023919 () Bool)

(declare-datatypes ((List!21755 0))(
  ( (Nil!21752) (Cons!21751 (h!22949 (_ BitVec 64)) (t!30808 List!21755)) )
))
(declare-fun arrayNoDuplicates!0 (array!64107 (_ BitVec 32) List!21755) Bool)

(assert (=> b!1023919 (= e!577096 (arrayNoDuplicates!0 (_keys!11118 thiss!1427) #b00000000000000000000000000000000 Nil!21752))))

(assert (= (and d!122455 res!685631) b!1023917))

(assert (= (and b!1023917 res!685632) b!1023918))

(assert (= (and b!1023918 res!685633) b!1023919))

(declare-fun m!941945 () Bool)

(assert (=> d!122455 m!941945))

(declare-fun m!941947 () Bool)

(assert (=> b!1023917 m!941947))

(declare-fun m!941949 () Bool)

(assert (=> b!1023918 m!941949))

(declare-fun m!941951 () Bool)

(assert (=> b!1023919 m!941951))

(assert (=> start!89314 d!122455))

(declare-fun d!122457 () Bool)

(assert (=> d!122457 (= (array_inv!23927 (_keys!11118 thiss!1427)) (bvsge (size!31378 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023867 d!122457))

(declare-fun d!122459 () Bool)

(assert (=> d!122459 (= (array_inv!23928 (_values!5999 thiss!1427)) (bvsge (size!31379 (_values!5999 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023867 d!122459))

(declare-fun d!122461 () Bool)

(assert (=> d!122461 (= (validMask!0 (mask!29610 thiss!1427)) (and (or (= (mask!29610 thiss!1427) #b00000000000000000000000000000111) (= (mask!29610 thiss!1427) #b00000000000000000000000000001111) (= (mask!29610 thiss!1427) #b00000000000000000000000000011111) (= (mask!29610 thiss!1427) #b00000000000000000000000000111111) (= (mask!29610 thiss!1427) #b00000000000000000000000001111111) (= (mask!29610 thiss!1427) #b00000000000000000000000011111111) (= (mask!29610 thiss!1427) #b00000000000000000000000111111111) (= (mask!29610 thiss!1427) #b00000000000000000000001111111111) (= (mask!29610 thiss!1427) #b00000000000000000000011111111111) (= (mask!29610 thiss!1427) #b00000000000000000000111111111111) (= (mask!29610 thiss!1427) #b00000000000000000001111111111111) (= (mask!29610 thiss!1427) #b00000000000000000011111111111111) (= (mask!29610 thiss!1427) #b00000000000000000111111111111111) (= (mask!29610 thiss!1427) #b00000000000000001111111111111111) (= (mask!29610 thiss!1427) #b00000000000000011111111111111111) (= (mask!29610 thiss!1427) #b00000000000000111111111111111111) (= (mask!29610 thiss!1427) #b00000000000001111111111111111111) (= (mask!29610 thiss!1427) #b00000000000011111111111111111111) (= (mask!29610 thiss!1427) #b00000000000111111111111111111111) (= (mask!29610 thiss!1427) #b00000000001111111111111111111111) (= (mask!29610 thiss!1427) #b00000000011111111111111111111111) (= (mask!29610 thiss!1427) #b00000000111111111111111111111111) (= (mask!29610 thiss!1427) #b00000001111111111111111111111111) (= (mask!29610 thiss!1427) #b00000011111111111111111111111111) (= (mask!29610 thiss!1427) #b00000111111111111111111111111111) (= (mask!29610 thiss!1427) #b00001111111111111111111111111111) (= (mask!29610 thiss!1427) #b00011111111111111111111111111111) (= (mask!29610 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29610 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1023864 d!122461))

(declare-fun mapNonEmpty!37522 () Bool)

(declare-fun mapRes!37522 () Bool)

(declare-fun tp!72077 () Bool)

(declare-fun e!577102 () Bool)

(assert (=> mapNonEmpty!37522 (= mapRes!37522 (and tp!72077 e!577102))))

(declare-fun mapKey!37522 () (_ BitVec 32))

(declare-fun mapRest!37522 () (Array (_ BitVec 32) ValueCell!11327))

(declare-fun mapValue!37522 () ValueCell!11327)

(assert (=> mapNonEmpty!37522 (= mapRest!37513 (store mapRest!37522 mapKey!37522 mapValue!37522))))

(declare-fun mapIsEmpty!37522 () Bool)

(assert (=> mapIsEmpty!37522 mapRes!37522))

(declare-fun b!1023926 () Bool)

(assert (=> b!1023926 (= e!577102 tp_is_empty!24061)))

(declare-fun condMapEmpty!37522 () Bool)

(declare-fun mapDefault!37522 () ValueCell!11327)

(assert (=> mapNonEmpty!37513 (= condMapEmpty!37522 (= mapRest!37513 ((as const (Array (_ BitVec 32) ValueCell!11327)) mapDefault!37522)))))

(declare-fun e!577101 () Bool)

(assert (=> mapNonEmpty!37513 (= tp!72061 (and e!577101 mapRes!37522))))

(declare-fun b!1023927 () Bool)

(assert (=> b!1023927 (= e!577101 tp_is_empty!24061)))

(assert (= (and mapNonEmpty!37513 condMapEmpty!37522) mapIsEmpty!37522))

(assert (= (and mapNonEmpty!37513 (not condMapEmpty!37522)) mapNonEmpty!37522))

(assert (= (and mapNonEmpty!37522 ((_ is ValueCellFull!11327) mapValue!37522)) b!1023926))

(assert (= (and mapNonEmpty!37513 ((_ is ValueCellFull!11327) mapDefault!37522)) b!1023927))

(declare-fun m!941953 () Bool)

(assert (=> mapNonEmpty!37522 m!941953))

(check-sat (not b!1023917) (not b!1023919) (not b_next!20341) tp_is_empty!24061 (not b!1023918) (not mapNonEmpty!37522) b_and!32561 (not d!122455))
(check-sat b_and!32561 (not b_next!20341))
(get-model)

(declare-fun b!1023938 () Bool)

(declare-fun res!685642 () Bool)

(declare-fun e!577105 () Bool)

(assert (=> b!1023938 (=> (not res!685642) (not e!577105))))

(declare-fun size!31384 (LongMapFixedSize!5248) (_ BitVec 32))

(assert (=> b!1023938 (= res!685642 (= (size!31384 thiss!1427) (bvadd (_size!2679 thiss!1427) (bvsdiv (bvadd (extraKeys!5708 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1023936 () Bool)

(declare-fun res!685644 () Bool)

(assert (=> b!1023936 (=> (not res!685644) (not e!577105))))

(assert (=> b!1023936 (= res!685644 (and (= (size!31379 (_values!5999 thiss!1427)) (bvadd (mask!29610 thiss!1427) #b00000000000000000000000000000001)) (= (size!31378 (_keys!11118 thiss!1427)) (size!31379 (_values!5999 thiss!1427))) (bvsge (_size!2679 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2679 thiss!1427) (bvadd (mask!29610 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!122463 () Bool)

(declare-fun res!685645 () Bool)

(assert (=> d!122463 (=> (not res!685645) (not e!577105))))

(assert (=> d!122463 (= res!685645 (validMask!0 (mask!29610 thiss!1427)))))

(assert (=> d!122463 (= (simpleValid!388 thiss!1427) e!577105)))

(declare-fun b!1023939 () Bool)

(assert (=> b!1023939 (= e!577105 (and (bvsge (extraKeys!5708 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5708 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2679 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1023937 () Bool)

(declare-fun res!685643 () Bool)

(assert (=> b!1023937 (=> (not res!685643) (not e!577105))))

(assert (=> b!1023937 (= res!685643 (bvsge (size!31384 thiss!1427) (_size!2679 thiss!1427)))))

(assert (= (and d!122463 res!685645) b!1023936))

(assert (= (and b!1023936 res!685644) b!1023937))

(assert (= (and b!1023937 res!685643) b!1023938))

(assert (= (and b!1023938 res!685642) b!1023939))

(declare-fun m!941955 () Bool)

(assert (=> b!1023938 m!941955))

(assert (=> d!122463 m!941919))

(assert (=> b!1023937 m!941955))

(assert (=> d!122455 d!122463))

(declare-fun b!1023948 () Bool)

(declare-fun e!577110 () (_ BitVec 32))

(declare-fun e!577111 () (_ BitVec 32))

(assert (=> b!1023948 (= e!577110 e!577111)))

(declare-fun c!103525 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1023948 (= c!103525 (validKeyInArray!0 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122465 () Bool)

(declare-fun lt!450352 () (_ BitVec 32))

(assert (=> d!122465 (and (bvsge lt!450352 #b00000000000000000000000000000000) (bvsle lt!450352 (bvsub (size!31378 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122465 (= lt!450352 e!577110)))

(declare-fun c!103524 () Bool)

(assert (=> d!122465 (= c!103524 (bvsge #b00000000000000000000000000000000 (size!31378 (_keys!11118 thiss!1427))))))

(assert (=> d!122465 (and (bvsle #b00000000000000000000000000000000 (size!31378 (_keys!11118 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31378 (_keys!11118 thiss!1427)) (size!31378 (_keys!11118 thiss!1427))))))

(assert (=> d!122465 (= (arrayCountValidKeys!0 (_keys!11118 thiss!1427) #b00000000000000000000000000000000 (size!31378 (_keys!11118 thiss!1427))) lt!450352)))

(declare-fun b!1023949 () Bool)

(assert (=> b!1023949 (= e!577110 #b00000000000000000000000000000000)))

(declare-fun b!1023950 () Bool)

(declare-fun call!43213 () (_ BitVec 32))

(assert (=> b!1023950 (= e!577111 call!43213)))

(declare-fun bm!43210 () Bool)

(assert (=> bm!43210 (= call!43213 (arrayCountValidKeys!0 (_keys!11118 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31378 (_keys!11118 thiss!1427))))))

(declare-fun b!1023951 () Bool)

(assert (=> b!1023951 (= e!577111 (bvadd #b00000000000000000000000000000001 call!43213))))

(assert (= (and d!122465 c!103524) b!1023949))

(assert (= (and d!122465 (not c!103524)) b!1023948))

(assert (= (and b!1023948 c!103525) b!1023951))

(assert (= (and b!1023948 (not c!103525)) b!1023950))

(assert (= (or b!1023951 b!1023950) bm!43210))

(declare-fun m!941957 () Bool)

(assert (=> b!1023948 m!941957))

(assert (=> b!1023948 m!941957))

(declare-fun m!941959 () Bool)

(assert (=> b!1023948 m!941959))

(declare-fun m!941961 () Bool)

(assert (=> bm!43210 m!941961))

(assert (=> b!1023917 d!122465))

(declare-fun b!1023962 () Bool)

(declare-fun e!577121 () Bool)

(declare-fun call!43216 () Bool)

(assert (=> b!1023962 (= e!577121 call!43216)))

(declare-fun b!1023963 () Bool)

(declare-fun e!577120 () Bool)

(declare-fun contains!5918 (List!21755 (_ BitVec 64)) Bool)

(assert (=> b!1023963 (= e!577120 (contains!5918 Nil!21752 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122467 () Bool)

(declare-fun res!685654 () Bool)

(declare-fun e!577122 () Bool)

(assert (=> d!122467 (=> res!685654 e!577122)))

(assert (=> d!122467 (= res!685654 (bvsge #b00000000000000000000000000000000 (size!31378 (_keys!11118 thiss!1427))))))

(assert (=> d!122467 (= (arrayNoDuplicates!0 (_keys!11118 thiss!1427) #b00000000000000000000000000000000 Nil!21752) e!577122)))

(declare-fun b!1023964 () Bool)

(declare-fun e!577123 () Bool)

(assert (=> b!1023964 (= e!577122 e!577123)))

(declare-fun res!685653 () Bool)

(assert (=> b!1023964 (=> (not res!685653) (not e!577123))))

(assert (=> b!1023964 (= res!685653 (not e!577120))))

(declare-fun res!685652 () Bool)

(assert (=> b!1023964 (=> (not res!685652) (not e!577120))))

(assert (=> b!1023964 (= res!685652 (validKeyInArray!0 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1023965 () Bool)

(assert (=> b!1023965 (= e!577123 e!577121)))

(declare-fun c!103528 () Bool)

(assert (=> b!1023965 (= c!103528 (validKeyInArray!0 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43213 () Bool)

(assert (=> bm!43213 (= call!43216 (arrayNoDuplicates!0 (_keys!11118 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103528 (Cons!21751 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000) Nil!21752) Nil!21752)))))

(declare-fun b!1023966 () Bool)

(assert (=> b!1023966 (= e!577121 call!43216)))

(assert (= (and d!122467 (not res!685654)) b!1023964))

(assert (= (and b!1023964 res!685652) b!1023963))

(assert (= (and b!1023964 res!685653) b!1023965))

(assert (= (and b!1023965 c!103528) b!1023962))

(assert (= (and b!1023965 (not c!103528)) b!1023966))

(assert (= (or b!1023962 b!1023966) bm!43213))

(assert (=> b!1023963 m!941957))

(assert (=> b!1023963 m!941957))

(declare-fun m!941963 () Bool)

(assert (=> b!1023963 m!941963))

(assert (=> b!1023964 m!941957))

(assert (=> b!1023964 m!941957))

(assert (=> b!1023964 m!941959))

(assert (=> b!1023965 m!941957))

(assert (=> b!1023965 m!941957))

(assert (=> b!1023965 m!941959))

(assert (=> bm!43213 m!941957))

(declare-fun m!941965 () Bool)

(assert (=> bm!43213 m!941965))

(assert (=> b!1023919 d!122467))

(declare-fun b!1023975 () Bool)

(declare-fun e!577131 () Bool)

(declare-fun e!577132 () Bool)

(assert (=> b!1023975 (= e!577131 e!577132)))

(declare-fun lt!450359 () (_ BitVec 64))

(assert (=> b!1023975 (= lt!450359 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33241 0))(
  ( (Unit!33242) )
))
(declare-fun lt!450361 () Unit!33241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64107 (_ BitVec 64) (_ BitVec 32)) Unit!33241)

(assert (=> b!1023975 (= lt!450361 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11118 thiss!1427) lt!450359 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1023975 (arrayContainsKey!0 (_keys!11118 thiss!1427) lt!450359 #b00000000000000000000000000000000)))

(declare-fun lt!450360 () Unit!33241)

(assert (=> b!1023975 (= lt!450360 lt!450361)))

(declare-fun res!685660 () Bool)

(declare-datatypes ((SeekEntryResult!9583 0))(
  ( (MissingZero!9583 (index!40703 (_ BitVec 32))) (Found!9583 (index!40704 (_ BitVec 32))) (Intermediate!9583 (undefined!10395 Bool) (index!40705 (_ BitVec 32)) (x!91026 (_ BitVec 32))) (Undefined!9583) (MissingVacant!9583 (index!40706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64107 (_ BitVec 32)) SeekEntryResult!9583)

(assert (=> b!1023975 (= res!685660 (= (seekEntryOrOpen!0 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000) (_keys!11118 thiss!1427) (mask!29610 thiss!1427)) (Found!9583 #b00000000000000000000000000000000)))))

(assert (=> b!1023975 (=> (not res!685660) (not e!577132))))

(declare-fun b!1023976 () Bool)

(declare-fun call!43219 () Bool)

(assert (=> b!1023976 (= e!577132 call!43219)))

(declare-fun bm!43216 () Bool)

(assert (=> bm!43216 (= call!43219 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11118 thiss!1427) (mask!29610 thiss!1427)))))

(declare-fun b!1023977 () Bool)

(assert (=> b!1023977 (= e!577131 call!43219)))

(declare-fun d!122469 () Bool)

(declare-fun res!685659 () Bool)

(declare-fun e!577130 () Bool)

(assert (=> d!122469 (=> res!685659 e!577130)))

(assert (=> d!122469 (= res!685659 (bvsge #b00000000000000000000000000000000 (size!31378 (_keys!11118 thiss!1427))))))

(assert (=> d!122469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11118 thiss!1427) (mask!29610 thiss!1427)) e!577130)))

(declare-fun b!1023978 () Bool)

(assert (=> b!1023978 (= e!577130 e!577131)))

(declare-fun c!103531 () Bool)

(assert (=> b!1023978 (= c!103531 (validKeyInArray!0 (select (arr!30864 (_keys!11118 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122469 (not res!685659)) b!1023978))

(assert (= (and b!1023978 c!103531) b!1023975))

(assert (= (and b!1023978 (not c!103531)) b!1023977))

(assert (= (and b!1023975 res!685660) b!1023976))

(assert (= (or b!1023976 b!1023977) bm!43216))

(assert (=> b!1023975 m!941957))

(declare-fun m!941967 () Bool)

(assert (=> b!1023975 m!941967))

(declare-fun m!941969 () Bool)

(assert (=> b!1023975 m!941969))

(assert (=> b!1023975 m!941957))

(declare-fun m!941971 () Bool)

(assert (=> b!1023975 m!941971))

(declare-fun m!941973 () Bool)

(assert (=> bm!43216 m!941973))

(assert (=> b!1023978 m!941957))

(assert (=> b!1023978 m!941957))

(assert (=> b!1023978 m!941959))

(assert (=> b!1023918 d!122469))

(declare-fun mapNonEmpty!37523 () Bool)

(declare-fun mapRes!37523 () Bool)

(declare-fun tp!72078 () Bool)

(declare-fun e!577134 () Bool)

(assert (=> mapNonEmpty!37523 (= mapRes!37523 (and tp!72078 e!577134))))

(declare-fun mapValue!37523 () ValueCell!11327)

(declare-fun mapKey!37523 () (_ BitVec 32))

(declare-fun mapRest!37523 () (Array (_ BitVec 32) ValueCell!11327))

(assert (=> mapNonEmpty!37523 (= mapRest!37522 (store mapRest!37523 mapKey!37523 mapValue!37523))))

(declare-fun mapIsEmpty!37523 () Bool)

(assert (=> mapIsEmpty!37523 mapRes!37523))

(declare-fun b!1023979 () Bool)

(assert (=> b!1023979 (= e!577134 tp_is_empty!24061)))

(declare-fun condMapEmpty!37523 () Bool)

(declare-fun mapDefault!37523 () ValueCell!11327)

(assert (=> mapNonEmpty!37522 (= condMapEmpty!37523 (= mapRest!37522 ((as const (Array (_ BitVec 32) ValueCell!11327)) mapDefault!37523)))))

(declare-fun e!577133 () Bool)

(assert (=> mapNonEmpty!37522 (= tp!72077 (and e!577133 mapRes!37523))))

(declare-fun b!1023980 () Bool)

(assert (=> b!1023980 (= e!577133 tp_is_empty!24061)))

(assert (= (and mapNonEmpty!37522 condMapEmpty!37523) mapIsEmpty!37523))

(assert (= (and mapNonEmpty!37522 (not condMapEmpty!37523)) mapNonEmpty!37523))

(assert (= (and mapNonEmpty!37523 ((_ is ValueCellFull!11327) mapValue!37523)) b!1023979))

(assert (= (and mapNonEmpty!37522 ((_ is ValueCellFull!11327) mapDefault!37523)) b!1023980))

(declare-fun m!941975 () Bool)

(assert (=> mapNonEmpty!37523 m!941975))

(check-sat (not mapNonEmpty!37523) (not bm!43210) (not b!1023948) (not b!1023964) (not bm!43213) (not d!122463) (not b!1023963) (not bm!43216) (not b_next!20341) tp_is_empty!24061 (not b!1023937) (not b!1023938) (not b!1023975) b_and!32561 (not b!1023978) (not b!1023965))
(check-sat b_and!32561 (not b_next!20341))
