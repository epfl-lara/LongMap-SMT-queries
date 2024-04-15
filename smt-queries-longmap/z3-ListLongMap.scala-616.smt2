; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16034 () Bool)

(assert start!16034)

(declare-fun b!158928 () Bool)

(declare-fun b_free!3505 () Bool)

(declare-fun b_next!3505 () Bool)

(assert (=> b!158928 (= b_free!3505 (not b_next!3505))))

(declare-fun tp!13082 () Bool)

(declare-fun b_and!9893 () Bool)

(assert (=> b!158928 (= tp!13082 b_and!9893)))

(declare-fun b!158923 () Bool)

(declare-fun res!75016 () Bool)

(declare-fun e!104051 () Bool)

(assert (=> b!158923 (=> (not res!75016) (not e!104051))))

(declare-datatypes ((V!4057 0))(
  ( (V!4058 (val!1698 Int)) )
))
(declare-datatypes ((ValueCell!1310 0))(
  ( (ValueCellFull!1310 (v!3557 V!4057)) (EmptyCell!1310) )
))
(declare-datatypes ((array!5671 0))(
  ( (array!5672 (arr!2680 (Array (_ BitVec 32) (_ BitVec 64))) (size!2965 (_ BitVec 32))) )
))
(declare-datatypes ((array!5673 0))(
  ( (array!5674 (arr!2681 (Array (_ BitVec 32) ValueCell!1310)) (size!2966 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1528 0))(
  ( (LongMapFixedSize!1529 (defaultEntry!3206 Int) (mask!7746 (_ BitVec 32)) (extraKeys!2947 (_ BitVec 32)) (zeroValue!3049 V!4057) (minValue!3049 V!4057) (_size!813 (_ BitVec 32)) (_keys!5004 array!5671) (_values!3189 array!5673) (_vacant!813 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1528)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5671 (_ BitVec 32)) Bool)

(assert (=> b!158923 (= res!75016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5004 thiss!1248) (mask!7746 thiss!1248)))))

(declare-fun b!158924 () Bool)

(declare-fun res!75015 () Bool)

(assert (=> b!158924 (=> (not res!75015) (not e!104051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158924 (= res!75015 (validMask!0 (mask!7746 thiss!1248)))))

(declare-fun mapNonEmpty!5645 () Bool)

(declare-fun mapRes!5645 () Bool)

(declare-fun tp!13081 () Bool)

(declare-fun e!104055 () Bool)

(assert (=> mapNonEmpty!5645 (= mapRes!5645 (and tp!13081 e!104055))))

(declare-fun mapKey!5645 () (_ BitVec 32))

(declare-fun mapRest!5645 () (Array (_ BitVec 32) ValueCell!1310))

(declare-fun mapValue!5645 () ValueCell!1310)

(assert (=> mapNonEmpty!5645 (= (arr!2681 (_values!3189 thiss!1248)) (store mapRest!5645 mapKey!5645 mapValue!5645))))

(declare-fun b!158926 () Bool)

(declare-fun res!75020 () Bool)

(assert (=> b!158926 (=> (not res!75020) (not e!104051))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158926 (= res!75020 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158927 () Bool)

(declare-fun tp_is_empty!3307 () Bool)

(assert (=> b!158927 (= e!104055 tp_is_empty!3307)))

(declare-fun e!104054 () Bool)

(declare-fun e!104056 () Bool)

(declare-fun array_inv!1721 (array!5671) Bool)

(declare-fun array_inv!1722 (array!5673) Bool)

(assert (=> b!158928 (= e!104056 (and tp!13082 tp_is_empty!3307 (array_inv!1721 (_keys!5004 thiss!1248)) (array_inv!1722 (_values!3189 thiss!1248)) e!104054))))

(declare-fun b!158929 () Bool)

(assert (=> b!158929 (= e!104051 (bvsgt #b00000000000000000000000000000000 (size!2965 (_keys!5004 thiss!1248))))))

(declare-fun b!158930 () Bool)

(declare-fun e!104052 () Bool)

(assert (=> b!158930 (= e!104052 tp_is_empty!3307)))

(declare-fun b!158931 () Bool)

(declare-fun res!75021 () Bool)

(assert (=> b!158931 (=> (not res!75021) (not e!104051))))

(assert (=> b!158931 (= res!75021 (and (= (size!2966 (_values!3189 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7746 thiss!1248))) (= (size!2965 (_keys!5004 thiss!1248)) (size!2966 (_values!3189 thiss!1248))) (bvsge (mask!7746 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2947 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2947 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158932 () Bool)

(assert (=> b!158932 (= e!104054 (and e!104052 mapRes!5645))))

(declare-fun condMapEmpty!5645 () Bool)

(declare-fun mapDefault!5645 () ValueCell!1310)

(assert (=> b!158932 (= condMapEmpty!5645 (= (arr!2681 (_values!3189 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1310)) mapDefault!5645)))))

(declare-fun res!75017 () Bool)

(assert (=> start!16034 (=> (not res!75017) (not e!104051))))

(declare-fun valid!720 (LongMapFixedSize!1528) Bool)

(assert (=> start!16034 (= res!75017 (valid!720 thiss!1248))))

(assert (=> start!16034 e!104051))

(assert (=> start!16034 e!104056))

(assert (=> start!16034 true))

(declare-fun b!158925 () Bool)

(declare-fun res!75018 () Bool)

(assert (=> b!158925 (=> (not res!75018) (not e!104051))))

(declare-datatypes ((List!1892 0))(
  ( (Nil!1889) (Cons!1888 (h!2501 (_ BitVec 64)) (t!6685 List!1892)) )
))
(declare-fun arrayNoDuplicates!0 (array!5671 (_ BitVec 32) List!1892) Bool)

(assert (=> b!158925 (= res!75018 (arrayNoDuplicates!0 (_keys!5004 thiss!1248) #b00000000000000000000000000000000 Nil!1889))))

(declare-fun b!158933 () Bool)

(declare-fun res!75019 () Bool)

(assert (=> b!158933 (=> (not res!75019) (not e!104051))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!310 0))(
  ( (MissingZero!310 (index!3408 (_ BitVec 32))) (Found!310 (index!3409 (_ BitVec 32))) (Intermediate!310 (undefined!1122 Bool) (index!3410 (_ BitVec 32)) (x!17573 (_ BitVec 32))) (Undefined!310) (MissingVacant!310 (index!3411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5671 (_ BitVec 32)) SeekEntryResult!310)

(assert (=> b!158933 (= res!75019 ((_ is Undefined!310) (seekEntryOrOpen!0 key!828 (_keys!5004 thiss!1248) (mask!7746 thiss!1248))))))

(declare-fun mapIsEmpty!5645 () Bool)

(assert (=> mapIsEmpty!5645 mapRes!5645))

(assert (= (and start!16034 res!75017) b!158926))

(assert (= (and b!158926 res!75020) b!158933))

(assert (= (and b!158933 res!75019) b!158924))

(assert (= (and b!158924 res!75015) b!158931))

(assert (= (and b!158931 res!75021) b!158923))

(assert (= (and b!158923 res!75016) b!158925))

(assert (= (and b!158925 res!75018) b!158929))

(assert (= (and b!158932 condMapEmpty!5645) mapIsEmpty!5645))

(assert (= (and b!158932 (not condMapEmpty!5645)) mapNonEmpty!5645))

(assert (= (and mapNonEmpty!5645 ((_ is ValueCellFull!1310) mapValue!5645)) b!158927))

(assert (= (and b!158932 ((_ is ValueCellFull!1310) mapDefault!5645)) b!158930))

(assert (= b!158928 b!158932))

(assert (= start!16034 b!158928))

(declare-fun m!190873 () Bool)

(assert (=> mapNonEmpty!5645 m!190873))

(declare-fun m!190875 () Bool)

(assert (=> b!158924 m!190875))

(declare-fun m!190877 () Bool)

(assert (=> b!158923 m!190877))

(declare-fun m!190879 () Bool)

(assert (=> b!158925 m!190879))

(declare-fun m!190881 () Bool)

(assert (=> start!16034 m!190881))

(declare-fun m!190883 () Bool)

(assert (=> b!158933 m!190883))

(declare-fun m!190885 () Bool)

(assert (=> b!158928 m!190885))

(declare-fun m!190887 () Bool)

(assert (=> b!158928 m!190887))

(check-sat (not b!158924) (not b!158928) tp_is_empty!3307 (not b!158925) (not b!158933) (not b!158923) (not mapNonEmpty!5645) b_and!9893 (not start!16034) (not b_next!3505))
(check-sat b_and!9893 (not b_next!3505))
(get-model)

(declare-fun b!159010 () Bool)

(declare-fun e!104104 () Bool)

(declare-fun e!104101 () Bool)

(assert (=> b!159010 (= e!104104 e!104101)))

(declare-fun res!75071 () Bool)

(assert (=> b!159010 (=> (not res!75071) (not e!104101))))

(declare-fun e!104103 () Bool)

(assert (=> b!159010 (= res!75071 (not e!104103))))

(declare-fun res!75072 () Bool)

(assert (=> b!159010 (=> (not res!75072) (not e!104103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!159010 (= res!75072 (validKeyInArray!0 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17254 () Bool)

(declare-fun call!17257 () Bool)

(declare-fun c!29894 () Bool)

(assert (=> bm!17254 (= call!17257 (arrayNoDuplicates!0 (_keys!5004 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29894 (Cons!1888 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000) Nil!1889) Nil!1889)))))

(declare-fun b!159011 () Bool)

(declare-fun contains!969 (List!1892 (_ BitVec 64)) Bool)

(assert (=> b!159011 (= e!104103 (contains!969 Nil!1889 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51107 () Bool)

(declare-fun res!75070 () Bool)

(assert (=> d!51107 (=> res!75070 e!104104)))

(assert (=> d!51107 (= res!75070 (bvsge #b00000000000000000000000000000000 (size!2965 (_keys!5004 thiss!1248))))))

(assert (=> d!51107 (= (arrayNoDuplicates!0 (_keys!5004 thiss!1248) #b00000000000000000000000000000000 Nil!1889) e!104104)))

(declare-fun b!159012 () Bool)

(declare-fun e!104102 () Bool)

(assert (=> b!159012 (= e!104102 call!17257)))

(declare-fun b!159013 () Bool)

(assert (=> b!159013 (= e!104101 e!104102)))

(assert (=> b!159013 (= c!29894 (validKeyInArray!0 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159014 () Bool)

(assert (=> b!159014 (= e!104102 call!17257)))

(assert (= (and d!51107 (not res!75070)) b!159010))

(assert (= (and b!159010 res!75072) b!159011))

(assert (= (and b!159010 res!75071) b!159013))

(assert (= (and b!159013 c!29894) b!159014))

(assert (= (and b!159013 (not c!29894)) b!159012))

(assert (= (or b!159014 b!159012) bm!17254))

(declare-fun m!190921 () Bool)

(assert (=> b!159010 m!190921))

(assert (=> b!159010 m!190921))

(declare-fun m!190923 () Bool)

(assert (=> b!159010 m!190923))

(assert (=> bm!17254 m!190921))

(declare-fun m!190925 () Bool)

(assert (=> bm!17254 m!190925))

(assert (=> b!159011 m!190921))

(assert (=> b!159011 m!190921))

(declare-fun m!190927 () Bool)

(assert (=> b!159011 m!190927))

(assert (=> b!159013 m!190921))

(assert (=> b!159013 m!190921))

(assert (=> b!159013 m!190923))

(assert (=> b!158925 d!51107))

(declare-fun d!51109 () Bool)

(declare-fun res!75079 () Bool)

(declare-fun e!104107 () Bool)

(assert (=> d!51109 (=> (not res!75079) (not e!104107))))

(declare-fun simpleValid!117 (LongMapFixedSize!1528) Bool)

(assert (=> d!51109 (= res!75079 (simpleValid!117 thiss!1248))))

(assert (=> d!51109 (= (valid!720 thiss!1248) e!104107)))

(declare-fun b!159021 () Bool)

(declare-fun res!75080 () Bool)

(assert (=> b!159021 (=> (not res!75080) (not e!104107))))

(declare-fun arrayCountValidKeys!0 (array!5671 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!159021 (= res!75080 (= (arrayCountValidKeys!0 (_keys!5004 thiss!1248) #b00000000000000000000000000000000 (size!2965 (_keys!5004 thiss!1248))) (_size!813 thiss!1248)))))

(declare-fun b!159022 () Bool)

(declare-fun res!75081 () Bool)

(assert (=> b!159022 (=> (not res!75081) (not e!104107))))

(assert (=> b!159022 (= res!75081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5004 thiss!1248) (mask!7746 thiss!1248)))))

(declare-fun b!159023 () Bool)

(assert (=> b!159023 (= e!104107 (arrayNoDuplicates!0 (_keys!5004 thiss!1248) #b00000000000000000000000000000000 Nil!1889))))

(assert (= (and d!51109 res!75079) b!159021))

(assert (= (and b!159021 res!75080) b!159022))

(assert (= (and b!159022 res!75081) b!159023))

(declare-fun m!190929 () Bool)

(assert (=> d!51109 m!190929))

(declare-fun m!190931 () Bool)

(assert (=> b!159021 m!190931))

(assert (=> b!159022 m!190877))

(assert (=> b!159023 m!190879))

(assert (=> start!16034 d!51109))

(declare-fun d!51111 () Bool)

(assert (=> d!51111 (= (array_inv!1721 (_keys!5004 thiss!1248)) (bvsge (size!2965 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158928 d!51111))

(declare-fun d!51113 () Bool)

(assert (=> d!51113 (= (array_inv!1722 (_values!3189 thiss!1248)) (bvsge (size!2966 (_values!3189 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158928 d!51113))

(declare-fun d!51115 () Bool)

(assert (=> d!51115 (= (validMask!0 (mask!7746 thiss!1248)) (and (or (= (mask!7746 thiss!1248) #b00000000000000000000000000000111) (= (mask!7746 thiss!1248) #b00000000000000000000000000001111) (= (mask!7746 thiss!1248) #b00000000000000000000000000011111) (= (mask!7746 thiss!1248) #b00000000000000000000000000111111) (= (mask!7746 thiss!1248) #b00000000000000000000000001111111) (= (mask!7746 thiss!1248) #b00000000000000000000000011111111) (= (mask!7746 thiss!1248) #b00000000000000000000000111111111) (= (mask!7746 thiss!1248) #b00000000000000000000001111111111) (= (mask!7746 thiss!1248) #b00000000000000000000011111111111) (= (mask!7746 thiss!1248) #b00000000000000000000111111111111) (= (mask!7746 thiss!1248) #b00000000000000000001111111111111) (= (mask!7746 thiss!1248) #b00000000000000000011111111111111) (= (mask!7746 thiss!1248) #b00000000000000000111111111111111) (= (mask!7746 thiss!1248) #b00000000000000001111111111111111) (= (mask!7746 thiss!1248) #b00000000000000011111111111111111) (= (mask!7746 thiss!1248) #b00000000000000111111111111111111) (= (mask!7746 thiss!1248) #b00000000000001111111111111111111) (= (mask!7746 thiss!1248) #b00000000000011111111111111111111) (= (mask!7746 thiss!1248) #b00000000000111111111111111111111) (= (mask!7746 thiss!1248) #b00000000001111111111111111111111) (= (mask!7746 thiss!1248) #b00000000011111111111111111111111) (= (mask!7746 thiss!1248) #b00000000111111111111111111111111) (= (mask!7746 thiss!1248) #b00000001111111111111111111111111) (= (mask!7746 thiss!1248) #b00000011111111111111111111111111) (= (mask!7746 thiss!1248) #b00000111111111111111111111111111) (= (mask!7746 thiss!1248) #b00001111111111111111111111111111) (= (mask!7746 thiss!1248) #b00011111111111111111111111111111) (= (mask!7746 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7746 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158924 d!51115))

(declare-fun b!159032 () Bool)

(declare-fun e!104114 () Bool)

(declare-fun e!104116 () Bool)

(assert (=> b!159032 (= e!104114 e!104116)))

(declare-fun c!29897 () Bool)

(assert (=> b!159032 (= c!29897 (validKeyInArray!0 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159033 () Bool)

(declare-fun e!104115 () Bool)

(declare-fun call!17260 () Bool)

(assert (=> b!159033 (= e!104115 call!17260)))

(declare-fun b!159034 () Bool)

(assert (=> b!159034 (= e!104116 e!104115)))

(declare-fun lt!81785 () (_ BitVec 64))

(assert (=> b!159034 (= lt!81785 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4970 0))(
  ( (Unit!4971) )
))
(declare-fun lt!81784 () Unit!4970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5671 (_ BitVec 64) (_ BitVec 32)) Unit!4970)

(assert (=> b!159034 (= lt!81784 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5004 thiss!1248) lt!81785 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!159034 (arrayContainsKey!0 (_keys!5004 thiss!1248) lt!81785 #b00000000000000000000000000000000)))

(declare-fun lt!81786 () Unit!4970)

(assert (=> b!159034 (= lt!81786 lt!81784)))

(declare-fun res!75086 () Bool)

(assert (=> b!159034 (= res!75086 (= (seekEntryOrOpen!0 (select (arr!2680 (_keys!5004 thiss!1248)) #b00000000000000000000000000000000) (_keys!5004 thiss!1248) (mask!7746 thiss!1248)) (Found!310 #b00000000000000000000000000000000)))))

(assert (=> b!159034 (=> (not res!75086) (not e!104115))))

(declare-fun bm!17257 () Bool)

(assert (=> bm!17257 (= call!17260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5004 thiss!1248) (mask!7746 thiss!1248)))))

(declare-fun b!159035 () Bool)

(assert (=> b!159035 (= e!104116 call!17260)))

(declare-fun d!51117 () Bool)

(declare-fun res!75087 () Bool)

(assert (=> d!51117 (=> res!75087 e!104114)))

(assert (=> d!51117 (= res!75087 (bvsge #b00000000000000000000000000000000 (size!2965 (_keys!5004 thiss!1248))))))

(assert (=> d!51117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5004 thiss!1248) (mask!7746 thiss!1248)) e!104114)))

(assert (= (and d!51117 (not res!75087)) b!159032))

(assert (= (and b!159032 c!29897) b!159034))

(assert (= (and b!159032 (not c!29897)) b!159035))

(assert (= (and b!159034 res!75086) b!159033))

(assert (= (or b!159033 b!159035) bm!17257))

(assert (=> b!159032 m!190921))

(assert (=> b!159032 m!190921))

(assert (=> b!159032 m!190923))

(assert (=> b!159034 m!190921))

(declare-fun m!190933 () Bool)

(assert (=> b!159034 m!190933))

(declare-fun m!190935 () Bool)

(assert (=> b!159034 m!190935))

(assert (=> b!159034 m!190921))

(declare-fun m!190937 () Bool)

(assert (=> b!159034 m!190937))

(declare-fun m!190939 () Bool)

(assert (=> bm!17257 m!190939))

(assert (=> b!158923 d!51117))

(declare-fun b!159048 () Bool)

(declare-fun e!104123 () SeekEntryResult!310)

(assert (=> b!159048 (= e!104123 Undefined!310)))

(declare-fun b!159049 () Bool)

(declare-fun e!104125 () SeekEntryResult!310)

(declare-fun lt!81794 () SeekEntryResult!310)

(assert (=> b!159049 (= e!104125 (MissingZero!310 (index!3410 lt!81794)))))

(declare-fun d!51119 () Bool)

(declare-fun lt!81795 () SeekEntryResult!310)

(assert (=> d!51119 (and (or ((_ is Undefined!310) lt!81795) (not ((_ is Found!310) lt!81795)) (and (bvsge (index!3409 lt!81795) #b00000000000000000000000000000000) (bvslt (index!3409 lt!81795) (size!2965 (_keys!5004 thiss!1248))))) (or ((_ is Undefined!310) lt!81795) ((_ is Found!310) lt!81795) (not ((_ is MissingZero!310) lt!81795)) (and (bvsge (index!3408 lt!81795) #b00000000000000000000000000000000) (bvslt (index!3408 lt!81795) (size!2965 (_keys!5004 thiss!1248))))) (or ((_ is Undefined!310) lt!81795) ((_ is Found!310) lt!81795) ((_ is MissingZero!310) lt!81795) (not ((_ is MissingVacant!310) lt!81795)) (and (bvsge (index!3411 lt!81795) #b00000000000000000000000000000000) (bvslt (index!3411 lt!81795) (size!2965 (_keys!5004 thiss!1248))))) (or ((_ is Undefined!310) lt!81795) (ite ((_ is Found!310) lt!81795) (= (select (arr!2680 (_keys!5004 thiss!1248)) (index!3409 lt!81795)) key!828) (ite ((_ is MissingZero!310) lt!81795) (= (select (arr!2680 (_keys!5004 thiss!1248)) (index!3408 lt!81795)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!310) lt!81795) (= (select (arr!2680 (_keys!5004 thiss!1248)) (index!3411 lt!81795)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51119 (= lt!81795 e!104123)))

(declare-fun c!29906 () Bool)

(assert (=> d!51119 (= c!29906 (and ((_ is Intermediate!310) lt!81794) (undefined!1122 lt!81794)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5671 (_ BitVec 32)) SeekEntryResult!310)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51119 (= lt!81794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7746 thiss!1248)) key!828 (_keys!5004 thiss!1248) (mask!7746 thiss!1248)))))

(assert (=> d!51119 (validMask!0 (mask!7746 thiss!1248))))

(assert (=> d!51119 (= (seekEntryOrOpen!0 key!828 (_keys!5004 thiss!1248) (mask!7746 thiss!1248)) lt!81795)))

(declare-fun b!159050 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5671 (_ BitVec 32)) SeekEntryResult!310)

(assert (=> b!159050 (= e!104125 (seekKeyOrZeroReturnVacant!0 (x!17573 lt!81794) (index!3410 lt!81794) (index!3410 lt!81794) key!828 (_keys!5004 thiss!1248) (mask!7746 thiss!1248)))))

(declare-fun b!159051 () Bool)

(declare-fun c!29904 () Bool)

(declare-fun lt!81793 () (_ BitVec 64))

(assert (=> b!159051 (= c!29904 (= lt!81793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!104124 () SeekEntryResult!310)

(assert (=> b!159051 (= e!104124 e!104125)))

(declare-fun b!159052 () Bool)

(assert (=> b!159052 (= e!104124 (Found!310 (index!3410 lt!81794)))))

(declare-fun b!159053 () Bool)

(assert (=> b!159053 (= e!104123 e!104124)))

(assert (=> b!159053 (= lt!81793 (select (arr!2680 (_keys!5004 thiss!1248)) (index!3410 lt!81794)))))

(declare-fun c!29905 () Bool)

(assert (=> b!159053 (= c!29905 (= lt!81793 key!828))))

(assert (= (and d!51119 c!29906) b!159048))

(assert (= (and d!51119 (not c!29906)) b!159053))

(assert (= (and b!159053 c!29905) b!159052))

(assert (= (and b!159053 (not c!29905)) b!159051))

(assert (= (and b!159051 c!29904) b!159049))

(assert (= (and b!159051 (not c!29904)) b!159050))

(declare-fun m!190941 () Bool)

(assert (=> d!51119 m!190941))

(assert (=> d!51119 m!190875))

(assert (=> d!51119 m!190941))

(declare-fun m!190943 () Bool)

(assert (=> d!51119 m!190943))

(declare-fun m!190945 () Bool)

(assert (=> d!51119 m!190945))

(declare-fun m!190947 () Bool)

(assert (=> d!51119 m!190947))

(declare-fun m!190949 () Bool)

(assert (=> d!51119 m!190949))

(declare-fun m!190951 () Bool)

(assert (=> b!159050 m!190951))

(declare-fun m!190953 () Bool)

(assert (=> b!159053 m!190953))

(assert (=> b!158933 d!51119))

(declare-fun mapNonEmpty!5654 () Bool)

(declare-fun mapRes!5654 () Bool)

(declare-fun tp!13097 () Bool)

(declare-fun e!104131 () Bool)

(assert (=> mapNonEmpty!5654 (= mapRes!5654 (and tp!13097 e!104131))))

(declare-fun mapRest!5654 () (Array (_ BitVec 32) ValueCell!1310))

(declare-fun mapKey!5654 () (_ BitVec 32))

(declare-fun mapValue!5654 () ValueCell!1310)

(assert (=> mapNonEmpty!5654 (= mapRest!5645 (store mapRest!5654 mapKey!5654 mapValue!5654))))

(declare-fun condMapEmpty!5654 () Bool)

(declare-fun mapDefault!5654 () ValueCell!1310)

(assert (=> mapNonEmpty!5645 (= condMapEmpty!5654 (= mapRest!5645 ((as const (Array (_ BitVec 32) ValueCell!1310)) mapDefault!5654)))))

(declare-fun e!104130 () Bool)

(assert (=> mapNonEmpty!5645 (= tp!13081 (and e!104130 mapRes!5654))))

(declare-fun b!159060 () Bool)

(assert (=> b!159060 (= e!104131 tp_is_empty!3307)))

(declare-fun mapIsEmpty!5654 () Bool)

(assert (=> mapIsEmpty!5654 mapRes!5654))

(declare-fun b!159061 () Bool)

(assert (=> b!159061 (= e!104130 tp_is_empty!3307)))

(assert (= (and mapNonEmpty!5645 condMapEmpty!5654) mapIsEmpty!5654))

(assert (= (and mapNonEmpty!5645 (not condMapEmpty!5654)) mapNonEmpty!5654))

(assert (= (and mapNonEmpty!5654 ((_ is ValueCellFull!1310) mapValue!5654)) b!159060))

(assert (= (and mapNonEmpty!5645 ((_ is ValueCellFull!1310) mapDefault!5654)) b!159061))

(declare-fun m!190955 () Bool)

(assert (=> mapNonEmpty!5654 m!190955))

(check-sat (not b!159023) (not b_next!3505) (not d!51119) (not b!159050) (not b!159032) tp_is_empty!3307 (not mapNonEmpty!5654) (not bm!17257) (not b!159021) (not b!159013) (not b!159010) (not d!51109) b_and!9893 (not bm!17254) (not b!159034) (not b!159022) (not b!159011))
(check-sat b_and!9893 (not b_next!3505))
