; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75772 () Bool)

(assert start!75772)

(declare-fun b!889963 () Bool)

(declare-fun b_free!15601 () Bool)

(declare-fun b_next!15601 () Bool)

(assert (=> b!889963 (= b_free!15601 (not b_next!15601))))

(declare-fun tp!54765 () Bool)

(declare-fun b_and!25851 () Bool)

(assert (=> b!889963 (= tp!54765 b_and!25851)))

(declare-fun b!889959 () Bool)

(declare-fun res!602927 () Bool)

(declare-fun e!496090 () Bool)

(assert (=> b!889959 (=> (not res!602927) (not e!496090))))

(declare-datatypes ((array!51873 0))(
  ( (array!51874 (arr!24940 (Array (_ BitVec 32) (_ BitVec 64))) (size!25384 (_ BitVec 32))) )
))
(declare-datatypes ((V!28871 0))(
  ( (V!28872 (val!9015 Int)) )
))
(declare-datatypes ((ValueCell!8483 0))(
  ( (ValueCellFull!8483 (v!11490 V!28871)) (EmptyCell!8483) )
))
(declare-datatypes ((array!51875 0))(
  ( (array!51876 (arr!24941 (Array (_ BitVec 32) ValueCell!8483)) (size!25385 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3982 0))(
  ( (LongMapFixedSize!3983 (defaultEntry!5188 Int) (mask!25669 (_ BitVec 32)) (extraKeys!4882 (_ BitVec 32)) (zeroValue!4986 V!28871) (minValue!4986 V!28871) (_size!2046 (_ BitVec 32)) (_keys!9898 array!51873) (_values!5173 array!51875) (_vacant!2046 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3982)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889959 (= res!602927 (validMask!0 (mask!25669 thiss!1181)))))

(declare-fun b!889960 () Bool)

(declare-fun e!496089 () Bool)

(declare-fun tp_is_empty!17929 () Bool)

(assert (=> b!889960 (= e!496089 tp_is_empty!17929)))

(declare-fun mapNonEmpty!28441 () Bool)

(declare-fun mapRes!28441 () Bool)

(declare-fun tp!54766 () Bool)

(assert (=> mapNonEmpty!28441 (= mapRes!28441 (and tp!54766 e!496089))))

(declare-fun mapRest!28441 () (Array (_ BitVec 32) ValueCell!8483))

(declare-fun mapValue!28441 () ValueCell!8483)

(declare-fun mapKey!28441 () (_ BitVec 32))

(assert (=> mapNonEmpty!28441 (= (arr!24941 (_values!5173 thiss!1181)) (store mapRest!28441 mapKey!28441 mapValue!28441))))

(declare-fun mapIsEmpty!28441 () Bool)

(assert (=> mapIsEmpty!28441 mapRes!28441))

(declare-fun res!602928 () Bool)

(assert (=> start!75772 (=> (not res!602928) (not e!496090))))

(declare-fun valid!1563 (LongMapFixedSize!3982) Bool)

(assert (=> start!75772 (= res!602928 (valid!1563 thiss!1181))))

(assert (=> start!75772 e!496090))

(declare-fun e!496086 () Bool)

(assert (=> start!75772 e!496086))

(assert (=> start!75772 true))

(declare-fun b!889961 () Bool)

(declare-fun e!496085 () Bool)

(declare-fun e!496087 () Bool)

(assert (=> b!889961 (= e!496085 (and e!496087 mapRes!28441))))

(declare-fun condMapEmpty!28441 () Bool)

(declare-fun mapDefault!28441 () ValueCell!8483)

(assert (=> b!889961 (= condMapEmpty!28441 (= (arr!24941 (_values!5173 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8483)) mapDefault!28441)))))

(declare-fun b!889962 () Bool)

(assert (=> b!889962 (= e!496090 (not (= (size!25384 (_keys!9898 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25669 thiss!1181)))))))

(declare-fun array_inv!19664 (array!51873) Bool)

(declare-fun array_inv!19665 (array!51875) Bool)

(assert (=> b!889963 (= e!496086 (and tp!54765 tp_is_empty!17929 (array_inv!19664 (_keys!9898 thiss!1181)) (array_inv!19665 (_values!5173 thiss!1181)) e!496085))))

(declare-fun b!889964 () Bool)

(declare-fun res!602929 () Bool)

(assert (=> b!889964 (=> (not res!602929) (not e!496090))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889964 (= res!602929 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889965 () Bool)

(assert (=> b!889965 (= e!496087 tp_is_empty!17929)))

(assert (= (and start!75772 res!602928) b!889964))

(assert (= (and b!889964 res!602929) b!889959))

(assert (= (and b!889959 res!602927) b!889962))

(assert (= (and b!889961 condMapEmpty!28441) mapIsEmpty!28441))

(assert (= (and b!889961 (not condMapEmpty!28441)) mapNonEmpty!28441))

(get-info :version)

(assert (= (and mapNonEmpty!28441 ((_ is ValueCellFull!8483) mapValue!28441)) b!889960))

(assert (= (and b!889961 ((_ is ValueCellFull!8483) mapDefault!28441)) b!889965))

(assert (= b!889963 b!889961))

(assert (= start!75772 b!889963))

(declare-fun m!829447 () Bool)

(assert (=> b!889959 m!829447))

(declare-fun m!829449 () Bool)

(assert (=> mapNonEmpty!28441 m!829449))

(declare-fun m!829451 () Bool)

(assert (=> start!75772 m!829451))

(declare-fun m!829453 () Bool)

(assert (=> b!889963 m!829453))

(declare-fun m!829455 () Bool)

(assert (=> b!889963 m!829455))

(check-sat b_and!25851 (not b_next!15601) (not b!889959) (not b!889963) tp_is_empty!17929 (not mapNonEmpty!28441) (not start!75772))
(check-sat b_and!25851 (not b_next!15601))
(get-model)

(declare-fun d!110459 () Bool)

(assert (=> d!110459 (= (array_inv!19664 (_keys!9898 thiss!1181)) (bvsge (size!25384 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889963 d!110459))

(declare-fun d!110461 () Bool)

(assert (=> d!110461 (= (array_inv!19665 (_values!5173 thiss!1181)) (bvsge (size!25385 (_values!5173 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889963 d!110461))

(declare-fun d!110463 () Bool)

(declare-fun res!602954 () Bool)

(declare-fun e!496129 () Bool)

(assert (=> d!110463 (=> (not res!602954) (not e!496129))))

(declare-fun simpleValid!293 (LongMapFixedSize!3982) Bool)

(assert (=> d!110463 (= res!602954 (simpleValid!293 thiss!1181))))

(assert (=> d!110463 (= (valid!1563 thiss!1181) e!496129)))

(declare-fun b!890014 () Bool)

(declare-fun res!602955 () Bool)

(assert (=> b!890014 (=> (not res!602955) (not e!496129))))

(declare-fun arrayCountValidKeys!0 (array!51873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!890014 (= res!602955 (= (arrayCountValidKeys!0 (_keys!9898 thiss!1181) #b00000000000000000000000000000000 (size!25384 (_keys!9898 thiss!1181))) (_size!2046 thiss!1181)))))

(declare-fun b!890015 () Bool)

(declare-fun res!602956 () Bool)

(assert (=> b!890015 (=> (not res!602956) (not e!496129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51873 (_ BitVec 32)) Bool)

(assert (=> b!890015 (= res!602956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9898 thiss!1181) (mask!25669 thiss!1181)))))

(declare-fun b!890016 () Bool)

(declare-datatypes ((List!17649 0))(
  ( (Nil!17646) (Cons!17645 (h!18782 (_ BitVec 64)) (t!24940 List!17649)) )
))
(declare-fun arrayNoDuplicates!0 (array!51873 (_ BitVec 32) List!17649) Bool)

(assert (=> b!890016 (= e!496129 (arrayNoDuplicates!0 (_keys!9898 thiss!1181) #b00000000000000000000000000000000 Nil!17646))))

(assert (= (and d!110463 res!602954) b!890014))

(assert (= (and b!890014 res!602955) b!890015))

(assert (= (and b!890015 res!602956) b!890016))

(declare-fun m!829477 () Bool)

(assert (=> d!110463 m!829477))

(declare-fun m!829479 () Bool)

(assert (=> b!890014 m!829479))

(declare-fun m!829481 () Bool)

(assert (=> b!890015 m!829481))

(declare-fun m!829483 () Bool)

(assert (=> b!890016 m!829483))

(assert (=> start!75772 d!110463))

(declare-fun d!110465 () Bool)

(assert (=> d!110465 (= (validMask!0 (mask!25669 thiss!1181)) (and (or (= (mask!25669 thiss!1181) #b00000000000000000000000000000111) (= (mask!25669 thiss!1181) #b00000000000000000000000000001111) (= (mask!25669 thiss!1181) #b00000000000000000000000000011111) (= (mask!25669 thiss!1181) #b00000000000000000000000000111111) (= (mask!25669 thiss!1181) #b00000000000000000000000001111111) (= (mask!25669 thiss!1181) #b00000000000000000000000011111111) (= (mask!25669 thiss!1181) #b00000000000000000000000111111111) (= (mask!25669 thiss!1181) #b00000000000000000000001111111111) (= (mask!25669 thiss!1181) #b00000000000000000000011111111111) (= (mask!25669 thiss!1181) #b00000000000000000000111111111111) (= (mask!25669 thiss!1181) #b00000000000000000001111111111111) (= (mask!25669 thiss!1181) #b00000000000000000011111111111111) (= (mask!25669 thiss!1181) #b00000000000000000111111111111111) (= (mask!25669 thiss!1181) #b00000000000000001111111111111111) (= (mask!25669 thiss!1181) #b00000000000000011111111111111111) (= (mask!25669 thiss!1181) #b00000000000000111111111111111111) (= (mask!25669 thiss!1181) #b00000000000001111111111111111111) (= (mask!25669 thiss!1181) #b00000000000011111111111111111111) (= (mask!25669 thiss!1181) #b00000000000111111111111111111111) (= (mask!25669 thiss!1181) #b00000000001111111111111111111111) (= (mask!25669 thiss!1181) #b00000000011111111111111111111111) (= (mask!25669 thiss!1181) #b00000000111111111111111111111111) (= (mask!25669 thiss!1181) #b00000001111111111111111111111111) (= (mask!25669 thiss!1181) #b00000011111111111111111111111111) (= (mask!25669 thiss!1181) #b00000111111111111111111111111111) (= (mask!25669 thiss!1181) #b00001111111111111111111111111111) (= (mask!25669 thiss!1181) #b00011111111111111111111111111111) (= (mask!25669 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25669 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!889959 d!110465))

(declare-fun condMapEmpty!28450 () Bool)

(declare-fun mapDefault!28450 () ValueCell!8483)

(assert (=> mapNonEmpty!28441 (= condMapEmpty!28450 (= mapRest!28441 ((as const (Array (_ BitVec 32) ValueCell!8483)) mapDefault!28450)))))

(declare-fun e!496134 () Bool)

(declare-fun mapRes!28450 () Bool)

(assert (=> mapNonEmpty!28441 (= tp!54766 (and e!496134 mapRes!28450))))

(declare-fun b!890024 () Bool)

(assert (=> b!890024 (= e!496134 tp_is_empty!17929)))

(declare-fun mapNonEmpty!28450 () Bool)

(declare-fun tp!54781 () Bool)

(declare-fun e!496135 () Bool)

(assert (=> mapNonEmpty!28450 (= mapRes!28450 (and tp!54781 e!496135))))

(declare-fun mapValue!28450 () ValueCell!8483)

(declare-fun mapKey!28450 () (_ BitVec 32))

(declare-fun mapRest!28450 () (Array (_ BitVec 32) ValueCell!8483))

(assert (=> mapNonEmpty!28450 (= mapRest!28441 (store mapRest!28450 mapKey!28450 mapValue!28450))))

(declare-fun mapIsEmpty!28450 () Bool)

(assert (=> mapIsEmpty!28450 mapRes!28450))

(declare-fun b!890023 () Bool)

(assert (=> b!890023 (= e!496135 tp_is_empty!17929)))

(assert (= (and mapNonEmpty!28441 condMapEmpty!28450) mapIsEmpty!28450))

(assert (= (and mapNonEmpty!28441 (not condMapEmpty!28450)) mapNonEmpty!28450))

(assert (= (and mapNonEmpty!28450 ((_ is ValueCellFull!8483) mapValue!28450)) b!890023))

(assert (= (and mapNonEmpty!28441 ((_ is ValueCellFull!8483) mapDefault!28450)) b!890024))

(declare-fun m!829485 () Bool)

(assert (=> mapNonEmpty!28450 m!829485))

(check-sat b_and!25851 (not b_next!15601) (not mapNonEmpty!28450) (not b!890014) tp_is_empty!17929 (not b!890016) (not b!890015) (not d!110463))
(check-sat b_and!25851 (not b_next!15601))
(get-model)

(declare-fun b!890033 () Bool)

(declare-fun e!496141 () (_ BitVec 32))

(declare-fun call!39549 () (_ BitVec 32))

(assert (=> b!890033 (= e!496141 call!39549)))

(declare-fun bm!39546 () Bool)

(assert (=> bm!39546 (= call!39549 (arrayCountValidKeys!0 (_keys!9898 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25384 (_keys!9898 thiss!1181))))))

(declare-fun b!890034 () Bool)

(assert (=> b!890034 (= e!496141 (bvadd #b00000000000000000000000000000001 call!39549))))

(declare-fun b!890035 () Bool)

(declare-fun e!496140 () (_ BitVec 32))

(assert (=> b!890035 (= e!496140 e!496141)))

(declare-fun c!94221 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!890035 (= c!94221 (validKeyInArray!0 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110467 () Bool)

(declare-fun lt!402344 () (_ BitVec 32))

(assert (=> d!110467 (and (bvsge lt!402344 #b00000000000000000000000000000000) (bvsle lt!402344 (bvsub (size!25384 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110467 (= lt!402344 e!496140)))

(declare-fun c!94220 () Bool)

(assert (=> d!110467 (= c!94220 (bvsge #b00000000000000000000000000000000 (size!25384 (_keys!9898 thiss!1181))))))

(assert (=> d!110467 (and (bvsle #b00000000000000000000000000000000 (size!25384 (_keys!9898 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25384 (_keys!9898 thiss!1181)) (size!25384 (_keys!9898 thiss!1181))))))

(assert (=> d!110467 (= (arrayCountValidKeys!0 (_keys!9898 thiss!1181) #b00000000000000000000000000000000 (size!25384 (_keys!9898 thiss!1181))) lt!402344)))

(declare-fun b!890036 () Bool)

(assert (=> b!890036 (= e!496140 #b00000000000000000000000000000000)))

(assert (= (and d!110467 c!94220) b!890036))

(assert (= (and d!110467 (not c!94220)) b!890035))

(assert (= (and b!890035 c!94221) b!890034))

(assert (= (and b!890035 (not c!94221)) b!890033))

(assert (= (or b!890034 b!890033) bm!39546))

(declare-fun m!829487 () Bool)

(assert (=> bm!39546 m!829487))

(declare-fun m!829489 () Bool)

(assert (=> b!890035 m!829489))

(assert (=> b!890035 m!829489))

(declare-fun m!829491 () Bool)

(assert (=> b!890035 m!829491))

(assert (=> b!890014 d!110467))

(declare-fun b!890048 () Bool)

(declare-fun e!496144 () Bool)

(assert (=> b!890048 (= e!496144 (and (bvsge (extraKeys!4882 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4882 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2046 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!890047 () Bool)

(declare-fun res!602966 () Bool)

(assert (=> b!890047 (=> (not res!602966) (not e!496144))))

(declare-fun size!25390 (LongMapFixedSize!3982) (_ BitVec 32))

(assert (=> b!890047 (= res!602966 (= (size!25390 thiss!1181) (bvadd (_size!2046 thiss!1181) (bvsdiv (bvadd (extraKeys!4882 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!890045 () Bool)

(declare-fun res!602965 () Bool)

(assert (=> b!890045 (=> (not res!602965) (not e!496144))))

(assert (=> b!890045 (= res!602965 (and (= (size!25385 (_values!5173 thiss!1181)) (bvadd (mask!25669 thiss!1181) #b00000000000000000000000000000001)) (= (size!25384 (_keys!9898 thiss!1181)) (size!25385 (_values!5173 thiss!1181))) (bvsge (_size!2046 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2046 thiss!1181) (bvadd (mask!25669 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!890046 () Bool)

(declare-fun res!602968 () Bool)

(assert (=> b!890046 (=> (not res!602968) (not e!496144))))

(assert (=> b!890046 (= res!602968 (bvsge (size!25390 thiss!1181) (_size!2046 thiss!1181)))))

(declare-fun d!110469 () Bool)

(declare-fun res!602967 () Bool)

(assert (=> d!110469 (=> (not res!602967) (not e!496144))))

(assert (=> d!110469 (= res!602967 (validMask!0 (mask!25669 thiss!1181)))))

(assert (=> d!110469 (= (simpleValid!293 thiss!1181) e!496144)))

(assert (= (and d!110469 res!602967) b!890045))

(assert (= (and b!890045 res!602965) b!890046))

(assert (= (and b!890046 res!602968) b!890047))

(assert (= (and b!890047 res!602966) b!890048))

(declare-fun m!829493 () Bool)

(assert (=> b!890047 m!829493))

(assert (=> b!890046 m!829493))

(assert (=> d!110469 m!829447))

(assert (=> d!110463 d!110469))

(declare-fun b!890057 () Bool)

(declare-fun e!496152 () Bool)

(declare-fun e!496151 () Bool)

(assert (=> b!890057 (= e!496152 e!496151)))

(declare-fun c!94224 () Bool)

(assert (=> b!890057 (= c!94224 (validKeyInArray!0 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110471 () Bool)

(declare-fun res!602974 () Bool)

(assert (=> d!110471 (=> res!602974 e!496152)))

(assert (=> d!110471 (= res!602974 (bvsge #b00000000000000000000000000000000 (size!25384 (_keys!9898 thiss!1181))))))

(assert (=> d!110471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9898 thiss!1181) (mask!25669 thiss!1181)) e!496152)))

(declare-fun b!890058 () Bool)

(declare-fun e!496153 () Bool)

(assert (=> b!890058 (= e!496151 e!496153)))

(declare-fun lt!402352 () (_ BitVec 64))

(assert (=> b!890058 (= lt!402352 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30260 0))(
  ( (Unit!30261) )
))
(declare-fun lt!402351 () Unit!30260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51873 (_ BitVec 64) (_ BitVec 32)) Unit!30260)

(assert (=> b!890058 (= lt!402351 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9898 thiss!1181) lt!402352 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890058 (arrayContainsKey!0 (_keys!9898 thiss!1181) lt!402352 #b00000000000000000000000000000000)))

(declare-fun lt!402353 () Unit!30260)

(assert (=> b!890058 (= lt!402353 lt!402351)))

(declare-fun res!602973 () Bool)

(declare-datatypes ((SeekEntryResult!8721 0))(
  ( (MissingZero!8721 (index!37255 (_ BitVec 32))) (Found!8721 (index!37256 (_ BitVec 32))) (Intermediate!8721 (undefined!9533 Bool) (index!37257 (_ BitVec 32)) (x!75439 (_ BitVec 32))) (Undefined!8721) (MissingVacant!8721 (index!37258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51873 (_ BitVec 32)) SeekEntryResult!8721)

(assert (=> b!890058 (= res!602973 (= (seekEntryOrOpen!0 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000) (_keys!9898 thiss!1181) (mask!25669 thiss!1181)) (Found!8721 #b00000000000000000000000000000000)))))

(assert (=> b!890058 (=> (not res!602973) (not e!496153))))

(declare-fun b!890059 () Bool)

(declare-fun call!39552 () Bool)

(assert (=> b!890059 (= e!496151 call!39552)))

(declare-fun b!890060 () Bool)

(assert (=> b!890060 (= e!496153 call!39552)))

(declare-fun bm!39549 () Bool)

(assert (=> bm!39549 (= call!39552 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9898 thiss!1181) (mask!25669 thiss!1181)))))

(assert (= (and d!110471 (not res!602974)) b!890057))

(assert (= (and b!890057 c!94224) b!890058))

(assert (= (and b!890057 (not c!94224)) b!890059))

(assert (= (and b!890058 res!602973) b!890060))

(assert (= (or b!890060 b!890059) bm!39549))

(assert (=> b!890057 m!829489))

(assert (=> b!890057 m!829489))

(assert (=> b!890057 m!829491))

(assert (=> b!890058 m!829489))

(declare-fun m!829495 () Bool)

(assert (=> b!890058 m!829495))

(declare-fun m!829497 () Bool)

(assert (=> b!890058 m!829497))

(assert (=> b!890058 m!829489))

(declare-fun m!829499 () Bool)

(assert (=> b!890058 m!829499))

(declare-fun m!829501 () Bool)

(assert (=> bm!39549 m!829501))

(assert (=> b!890015 d!110471))

(declare-fun b!890071 () Bool)

(declare-fun e!496164 () Bool)

(declare-fun e!496162 () Bool)

(assert (=> b!890071 (= e!496164 e!496162)))

(declare-fun res!602982 () Bool)

(assert (=> b!890071 (=> (not res!602982) (not e!496162))))

(declare-fun e!496163 () Bool)

(assert (=> b!890071 (= res!602982 (not e!496163))))

(declare-fun res!602981 () Bool)

(assert (=> b!890071 (=> (not res!602981) (not e!496163))))

(assert (=> b!890071 (= res!602981 (validKeyInArray!0 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110473 () Bool)

(declare-fun res!602983 () Bool)

(assert (=> d!110473 (=> res!602983 e!496164)))

(assert (=> d!110473 (= res!602983 (bvsge #b00000000000000000000000000000000 (size!25384 (_keys!9898 thiss!1181))))))

(assert (=> d!110473 (= (arrayNoDuplicates!0 (_keys!9898 thiss!1181) #b00000000000000000000000000000000 Nil!17646) e!496164)))

(declare-fun b!890072 () Bool)

(declare-fun contains!4310 (List!17649 (_ BitVec 64)) Bool)

(assert (=> b!890072 (= e!496163 (contains!4310 Nil!17646 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!890073 () Bool)

(declare-fun e!496165 () Bool)

(assert (=> b!890073 (= e!496162 e!496165)))

(declare-fun c!94227 () Bool)

(assert (=> b!890073 (= c!94227 (validKeyInArray!0 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!890074 () Bool)

(declare-fun call!39555 () Bool)

(assert (=> b!890074 (= e!496165 call!39555)))

(declare-fun bm!39552 () Bool)

(assert (=> bm!39552 (= call!39555 (arrayNoDuplicates!0 (_keys!9898 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94227 (Cons!17645 (select (arr!24940 (_keys!9898 thiss!1181)) #b00000000000000000000000000000000) Nil!17646) Nil!17646)))))

(declare-fun b!890075 () Bool)

(assert (=> b!890075 (= e!496165 call!39555)))

(assert (= (and d!110473 (not res!602983)) b!890071))

(assert (= (and b!890071 res!602981) b!890072))

(assert (= (and b!890071 res!602982) b!890073))

(assert (= (and b!890073 c!94227) b!890074))

(assert (= (and b!890073 (not c!94227)) b!890075))

(assert (= (or b!890074 b!890075) bm!39552))

(assert (=> b!890071 m!829489))

(assert (=> b!890071 m!829489))

(assert (=> b!890071 m!829491))

(assert (=> b!890072 m!829489))

(assert (=> b!890072 m!829489))

(declare-fun m!829503 () Bool)

(assert (=> b!890072 m!829503))

(assert (=> b!890073 m!829489))

(assert (=> b!890073 m!829489))

(assert (=> b!890073 m!829491))

(assert (=> bm!39552 m!829489))

(declare-fun m!829505 () Bool)

(assert (=> bm!39552 m!829505))

(assert (=> b!890016 d!110473))

(declare-fun condMapEmpty!28451 () Bool)

(declare-fun mapDefault!28451 () ValueCell!8483)

(assert (=> mapNonEmpty!28450 (= condMapEmpty!28451 (= mapRest!28450 ((as const (Array (_ BitVec 32) ValueCell!8483)) mapDefault!28451)))))

(declare-fun e!496166 () Bool)

(declare-fun mapRes!28451 () Bool)

(assert (=> mapNonEmpty!28450 (= tp!54781 (and e!496166 mapRes!28451))))

(declare-fun b!890077 () Bool)

(assert (=> b!890077 (= e!496166 tp_is_empty!17929)))

(declare-fun mapNonEmpty!28451 () Bool)

(declare-fun tp!54782 () Bool)

(declare-fun e!496167 () Bool)

(assert (=> mapNonEmpty!28451 (= mapRes!28451 (and tp!54782 e!496167))))

(declare-fun mapKey!28451 () (_ BitVec 32))

(declare-fun mapValue!28451 () ValueCell!8483)

(declare-fun mapRest!28451 () (Array (_ BitVec 32) ValueCell!8483))

(assert (=> mapNonEmpty!28451 (= mapRest!28450 (store mapRest!28451 mapKey!28451 mapValue!28451))))

(declare-fun mapIsEmpty!28451 () Bool)

(assert (=> mapIsEmpty!28451 mapRes!28451))

(declare-fun b!890076 () Bool)

(assert (=> b!890076 (= e!496167 tp_is_empty!17929)))

(assert (= (and mapNonEmpty!28450 condMapEmpty!28451) mapIsEmpty!28451))

(assert (= (and mapNonEmpty!28450 (not condMapEmpty!28451)) mapNonEmpty!28451))

(assert (= (and mapNonEmpty!28451 ((_ is ValueCellFull!8483) mapValue!28451)) b!890076))

(assert (= (and mapNonEmpty!28450 ((_ is ValueCellFull!8483) mapDefault!28451)) b!890077))

(declare-fun m!829507 () Bool)

(assert (=> mapNonEmpty!28451 m!829507))

(check-sat (not b!890058) (not b_next!15601) (not bm!39552) (not d!110469) (not b!890071) (not b!890046) (not b!890057) (not bm!39546) (not b!890047) (not bm!39549) (not mapNonEmpty!28451) (not b!890035) b_and!25851 (not b!890072) (not b!890073) tp_is_empty!17929)
(check-sat b_and!25851 (not b_next!15601))
