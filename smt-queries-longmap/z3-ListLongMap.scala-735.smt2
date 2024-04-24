; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17150 () Bool)

(assert start!17150)

(declare-fun b!172355 () Bool)

(declare-fun b_free!4249 () Bool)

(declare-fun b_next!4249 () Bool)

(assert (=> b!172355 (= b_free!4249 (not b_next!4249))))

(declare-fun tp!15389 () Bool)

(declare-fun b_and!10703 () Bool)

(assert (=> b!172355 (= tp!15389 b_and!10703)))

(declare-fun b!172353 () Bool)

(declare-fun res!81838 () Bool)

(declare-fun e!113751 () Bool)

(assert (=> b!172353 (=> (not res!81838) (not e!113751))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172353 (= res!81838 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6837 () Bool)

(declare-fun mapRes!6837 () Bool)

(assert (=> mapIsEmpty!6837 mapRes!6837))

(declare-fun mapNonEmpty!6837 () Bool)

(declare-fun tp!15390 () Bool)

(declare-fun e!113752 () Bool)

(assert (=> mapNonEmpty!6837 (= mapRes!6837 (and tp!15390 e!113752))))

(declare-fun mapKey!6837 () (_ BitVec 32))

(declare-datatypes ((V!5009 0))(
  ( (V!5010 (val!2055 Int)) )
))
(declare-datatypes ((ValueCell!1667 0))(
  ( (ValueCellFull!1667 (v!3924 V!5009)) (EmptyCell!1667) )
))
(declare-fun mapRest!6837 () (Array (_ BitVec 32) ValueCell!1667))

(declare-datatypes ((array!7147 0))(
  ( (array!7148 (arr!3398 (Array (_ BitVec 32) (_ BitVec 64))) (size!3694 (_ BitVec 32))) )
))
(declare-datatypes ((array!7149 0))(
  ( (array!7150 (arr!3399 (Array (_ BitVec 32) ValueCell!1667)) (size!3695 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2242 0))(
  ( (LongMapFixedSize!2243 (defaultEntry!3567 Int) (mask!8408 (_ BitVec 32)) (extraKeys!3306 (_ BitVec 32)) (zeroValue!3408 V!5009) (minValue!3410 V!5009) (_size!1170 (_ BitVec 32)) (_keys!5403 array!7147) (_values!3550 array!7149) (_vacant!1170 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2242)

(declare-fun mapValue!6837 () ValueCell!1667)

(assert (=> mapNonEmpty!6837 (= (arr!3399 (_values!3550 thiss!1248)) (store mapRest!6837 mapKey!6837 mapValue!6837))))

(declare-fun res!81839 () Bool)

(assert (=> start!17150 (=> (not res!81839) (not e!113751))))

(declare-fun valid!969 (LongMapFixedSize!2242) Bool)

(assert (=> start!17150 (= res!81839 (valid!969 thiss!1248))))

(assert (=> start!17150 e!113751))

(declare-fun e!113756 () Bool)

(assert (=> start!17150 e!113756))

(assert (=> start!17150 true))

(declare-fun b!172354 () Bool)

(declare-fun res!81840 () Bool)

(assert (=> b!172354 (=> (not res!81840) (not e!113751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172354 (= res!81840 (validMask!0 (mask!8408 thiss!1248)))))

(declare-fun tp_is_empty!4021 () Bool)

(declare-fun e!113755 () Bool)

(declare-fun array_inv!2187 (array!7147) Bool)

(declare-fun array_inv!2188 (array!7149) Bool)

(assert (=> b!172355 (= e!113756 (and tp!15389 tp_is_empty!4021 (array_inv!2187 (_keys!5403 thiss!1248)) (array_inv!2188 (_values!3550 thiss!1248)) e!113755))))

(declare-fun b!172356 () Bool)

(assert (=> b!172356 (= e!113751 (and (= (size!3695 (_values!3550 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8408 thiss!1248))) (not (= (size!3694 (_keys!5403 thiss!1248)) (size!3695 (_values!3550 thiss!1248))))))))

(declare-fun b!172357 () Bool)

(declare-fun e!113754 () Bool)

(assert (=> b!172357 (= e!113755 (and e!113754 mapRes!6837))))

(declare-fun condMapEmpty!6837 () Bool)

(declare-fun mapDefault!6837 () ValueCell!1667)

(assert (=> b!172357 (= condMapEmpty!6837 (= (arr!3399 (_values!3550 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1667)) mapDefault!6837)))))

(declare-fun b!172358 () Bool)

(assert (=> b!172358 (= e!113752 tp_is_empty!4021)))

(declare-fun b!172359 () Bool)

(assert (=> b!172359 (= e!113754 tp_is_empty!4021)))

(assert (= (and start!17150 res!81839) b!172353))

(assert (= (and b!172353 res!81838) b!172354))

(assert (= (and b!172354 res!81840) b!172356))

(assert (= (and b!172357 condMapEmpty!6837) mapIsEmpty!6837))

(assert (= (and b!172357 (not condMapEmpty!6837)) mapNonEmpty!6837))

(get-info :version)

(assert (= (and mapNonEmpty!6837 ((_ is ValueCellFull!1667) mapValue!6837)) b!172358))

(assert (= (and b!172357 ((_ is ValueCellFull!1667) mapDefault!6837)) b!172359))

(assert (= b!172355 b!172357))

(assert (= start!17150 b!172355))

(declare-fun m!201349 () Bool)

(assert (=> mapNonEmpty!6837 m!201349))

(declare-fun m!201351 () Bool)

(assert (=> start!17150 m!201351))

(declare-fun m!201353 () Bool)

(assert (=> b!172354 m!201353))

(declare-fun m!201355 () Bool)

(assert (=> b!172355 m!201355))

(declare-fun m!201357 () Bool)

(assert (=> b!172355 m!201357))

(check-sat tp_is_empty!4021 (not start!17150) b_and!10703 (not b!172354) (not b!172355) (not mapNonEmpty!6837) (not b_next!4249))
(check-sat b_and!10703 (not b_next!4249))
(get-model)

(declare-fun d!52565 () Bool)

(assert (=> d!52565 (= (array_inv!2187 (_keys!5403 thiss!1248)) (bvsge (size!3694 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172355 d!52565))

(declare-fun d!52567 () Bool)

(assert (=> d!52567 (= (array_inv!2188 (_values!3550 thiss!1248)) (bvsge (size!3695 (_values!3550 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172355 d!52567))

(declare-fun d!52569 () Bool)

(assert (=> d!52569 (= (validMask!0 (mask!8408 thiss!1248)) (and (or (= (mask!8408 thiss!1248) #b00000000000000000000000000000111) (= (mask!8408 thiss!1248) #b00000000000000000000000000001111) (= (mask!8408 thiss!1248) #b00000000000000000000000000011111) (= (mask!8408 thiss!1248) #b00000000000000000000000000111111) (= (mask!8408 thiss!1248) #b00000000000000000000000001111111) (= (mask!8408 thiss!1248) #b00000000000000000000000011111111) (= (mask!8408 thiss!1248) #b00000000000000000000000111111111) (= (mask!8408 thiss!1248) #b00000000000000000000001111111111) (= (mask!8408 thiss!1248) #b00000000000000000000011111111111) (= (mask!8408 thiss!1248) #b00000000000000000000111111111111) (= (mask!8408 thiss!1248) #b00000000000000000001111111111111) (= (mask!8408 thiss!1248) #b00000000000000000011111111111111) (= (mask!8408 thiss!1248) #b00000000000000000111111111111111) (= (mask!8408 thiss!1248) #b00000000000000001111111111111111) (= (mask!8408 thiss!1248) #b00000000000000011111111111111111) (= (mask!8408 thiss!1248) #b00000000000000111111111111111111) (= (mask!8408 thiss!1248) #b00000000000001111111111111111111) (= (mask!8408 thiss!1248) #b00000000000011111111111111111111) (= (mask!8408 thiss!1248) #b00000000000111111111111111111111) (= (mask!8408 thiss!1248) #b00000000001111111111111111111111) (= (mask!8408 thiss!1248) #b00000000011111111111111111111111) (= (mask!8408 thiss!1248) #b00000000111111111111111111111111) (= (mask!8408 thiss!1248) #b00000001111111111111111111111111) (= (mask!8408 thiss!1248) #b00000011111111111111111111111111) (= (mask!8408 thiss!1248) #b00000111111111111111111111111111) (= (mask!8408 thiss!1248) #b00001111111111111111111111111111) (= (mask!8408 thiss!1248) #b00011111111111111111111111111111) (= (mask!8408 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8408 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172354 d!52569))

(declare-fun d!52571 () Bool)

(declare-fun res!81865 () Bool)

(declare-fun e!113795 () Bool)

(assert (=> d!52571 (=> (not res!81865) (not e!113795))))

(declare-fun simpleValid!138 (LongMapFixedSize!2242) Bool)

(assert (=> d!52571 (= res!81865 (simpleValid!138 thiss!1248))))

(assert (=> d!52571 (= (valid!969 thiss!1248) e!113795)))

(declare-fun b!172408 () Bool)

(declare-fun res!81866 () Bool)

(assert (=> b!172408 (=> (not res!81866) (not e!113795))))

(declare-fun arrayCountValidKeys!0 (array!7147 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172408 (= res!81866 (= (arrayCountValidKeys!0 (_keys!5403 thiss!1248) #b00000000000000000000000000000000 (size!3694 (_keys!5403 thiss!1248))) (_size!1170 thiss!1248)))))

(declare-fun b!172409 () Bool)

(declare-fun res!81867 () Bool)

(assert (=> b!172409 (=> (not res!81867) (not e!113795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7147 (_ BitVec 32)) Bool)

(assert (=> b!172409 (= res!81867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5403 thiss!1248) (mask!8408 thiss!1248)))))

(declare-fun b!172410 () Bool)

(declare-datatypes ((List!2181 0))(
  ( (Nil!2178) (Cons!2177 (h!2794 (_ BitVec 64)) (t!6980 List!2181)) )
))
(declare-fun arrayNoDuplicates!0 (array!7147 (_ BitVec 32) List!2181) Bool)

(assert (=> b!172410 (= e!113795 (arrayNoDuplicates!0 (_keys!5403 thiss!1248) #b00000000000000000000000000000000 Nil!2178))))

(assert (= (and d!52571 res!81865) b!172408))

(assert (= (and b!172408 res!81866) b!172409))

(assert (= (and b!172409 res!81867) b!172410))

(declare-fun m!201379 () Bool)

(assert (=> d!52571 m!201379))

(declare-fun m!201381 () Bool)

(assert (=> b!172408 m!201381))

(declare-fun m!201383 () Bool)

(assert (=> b!172409 m!201383))

(declare-fun m!201385 () Bool)

(assert (=> b!172410 m!201385))

(assert (=> start!17150 d!52571))

(declare-fun b!172417 () Bool)

(declare-fun e!113800 () Bool)

(assert (=> b!172417 (= e!113800 tp_is_empty!4021)))

(declare-fun condMapEmpty!6846 () Bool)

(declare-fun mapDefault!6846 () ValueCell!1667)

(assert (=> mapNonEmpty!6837 (= condMapEmpty!6846 (= mapRest!6837 ((as const (Array (_ BitVec 32) ValueCell!1667)) mapDefault!6846)))))

(declare-fun e!113801 () Bool)

(declare-fun mapRes!6846 () Bool)

(assert (=> mapNonEmpty!6837 (= tp!15390 (and e!113801 mapRes!6846))))

(declare-fun mapNonEmpty!6846 () Bool)

(declare-fun tp!15405 () Bool)

(assert (=> mapNonEmpty!6846 (= mapRes!6846 (and tp!15405 e!113800))))

(declare-fun mapValue!6846 () ValueCell!1667)

(declare-fun mapRest!6846 () (Array (_ BitVec 32) ValueCell!1667))

(declare-fun mapKey!6846 () (_ BitVec 32))

(assert (=> mapNonEmpty!6846 (= mapRest!6837 (store mapRest!6846 mapKey!6846 mapValue!6846))))

(declare-fun b!172418 () Bool)

(assert (=> b!172418 (= e!113801 tp_is_empty!4021)))

(declare-fun mapIsEmpty!6846 () Bool)

(assert (=> mapIsEmpty!6846 mapRes!6846))

(assert (= (and mapNonEmpty!6837 condMapEmpty!6846) mapIsEmpty!6846))

(assert (= (and mapNonEmpty!6837 (not condMapEmpty!6846)) mapNonEmpty!6846))

(assert (= (and mapNonEmpty!6846 ((_ is ValueCellFull!1667) mapValue!6846)) b!172417))

(assert (= (and mapNonEmpty!6837 ((_ is ValueCellFull!1667) mapDefault!6846)) b!172418))

(declare-fun m!201387 () Bool)

(assert (=> mapNonEmpty!6846 m!201387))

(check-sat tp_is_empty!4021 (not b_next!4249) (not b!172409) b_and!10703 (not b!172410) (not d!52571) (not mapNonEmpty!6846) (not b!172408))
(check-sat b_and!10703 (not b_next!4249))
(get-model)

(declare-fun b!172429 () Bool)

(declare-fun e!113811 () Bool)

(declare-fun e!113810 () Bool)

(assert (=> b!172429 (= e!113811 e!113810)))

(declare-fun res!81876 () Bool)

(assert (=> b!172429 (=> (not res!81876) (not e!113810))))

(declare-fun e!113812 () Bool)

(assert (=> b!172429 (= res!81876 (not e!113812))))

(declare-fun res!81874 () Bool)

(assert (=> b!172429 (=> (not res!81874) (not e!113812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172429 (= res!81874 (validKeyInArray!0 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172430 () Bool)

(declare-fun e!113813 () Bool)

(declare-fun call!17512 () Bool)

(assert (=> b!172430 (= e!113813 call!17512)))

(declare-fun b!172431 () Bool)

(assert (=> b!172431 (= e!113813 call!17512)))

(declare-fun b!172432 () Bool)

(assert (=> b!172432 (= e!113810 e!113813)))

(declare-fun c!30867 () Bool)

(assert (=> b!172432 (= c!30867 (validKeyInArray!0 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17509 () Bool)

(assert (=> bm!17509 (= call!17512 (arrayNoDuplicates!0 (_keys!5403 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30867 (Cons!2177 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000) Nil!2178) Nil!2178)))))

(declare-fun d!52573 () Bool)

(declare-fun res!81875 () Bool)

(assert (=> d!52573 (=> res!81875 e!113811)))

(assert (=> d!52573 (= res!81875 (bvsge #b00000000000000000000000000000000 (size!3694 (_keys!5403 thiss!1248))))))

(assert (=> d!52573 (= (arrayNoDuplicates!0 (_keys!5403 thiss!1248) #b00000000000000000000000000000000 Nil!2178) e!113811)))

(declare-fun b!172433 () Bool)

(declare-fun contains!1145 (List!2181 (_ BitVec 64)) Bool)

(assert (=> b!172433 (= e!113812 (contains!1145 Nil!2178 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52573 (not res!81875)) b!172429))

(assert (= (and b!172429 res!81874) b!172433))

(assert (= (and b!172429 res!81876) b!172432))

(assert (= (and b!172432 c!30867) b!172431))

(assert (= (and b!172432 (not c!30867)) b!172430))

(assert (= (or b!172431 b!172430) bm!17509))

(declare-fun m!201389 () Bool)

(assert (=> b!172429 m!201389))

(assert (=> b!172429 m!201389))

(declare-fun m!201391 () Bool)

(assert (=> b!172429 m!201391))

(assert (=> b!172432 m!201389))

(assert (=> b!172432 m!201389))

(assert (=> b!172432 m!201391))

(assert (=> bm!17509 m!201389))

(declare-fun m!201393 () Bool)

(assert (=> bm!17509 m!201393))

(assert (=> b!172433 m!201389))

(assert (=> b!172433 m!201389))

(declare-fun m!201395 () Bool)

(assert (=> b!172433 m!201395))

(assert (=> b!172410 d!52573))

(declare-fun d!52575 () Bool)

(declare-fun res!81882 () Bool)

(declare-fun e!113821 () Bool)

(assert (=> d!52575 (=> res!81882 e!113821)))

(assert (=> d!52575 (= res!81882 (bvsge #b00000000000000000000000000000000 (size!3694 (_keys!5403 thiss!1248))))))

(assert (=> d!52575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5403 thiss!1248) (mask!8408 thiss!1248)) e!113821)))

(declare-fun b!172442 () Bool)

(declare-fun e!113822 () Bool)

(assert (=> b!172442 (= e!113821 e!113822)))

(declare-fun c!30870 () Bool)

(assert (=> b!172442 (= c!30870 (validKeyInArray!0 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17512 () Bool)

(declare-fun call!17515 () Bool)

(assert (=> bm!17512 (= call!17515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5403 thiss!1248) (mask!8408 thiss!1248)))))

(declare-fun b!172443 () Bool)

(declare-fun e!113820 () Bool)

(assert (=> b!172443 (= e!113820 call!17515)))

(declare-fun b!172444 () Bool)

(assert (=> b!172444 (= e!113822 e!113820)))

(declare-fun lt!85723 () (_ BitVec 64))

(assert (=> b!172444 (= lt!85723 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5305 0))(
  ( (Unit!5306) )
))
(declare-fun lt!85724 () Unit!5305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7147 (_ BitVec 64) (_ BitVec 32)) Unit!5305)

(assert (=> b!172444 (= lt!85724 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5403 thiss!1248) lt!85723 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172444 (arrayContainsKey!0 (_keys!5403 thiss!1248) lt!85723 #b00000000000000000000000000000000)))

(declare-fun lt!85725 () Unit!5305)

(assert (=> b!172444 (= lt!85725 lt!85724)))

(declare-fun res!81881 () Bool)

(declare-datatypes ((SeekEntryResult!531 0))(
  ( (MissingZero!531 (index!4292 (_ BitVec 32))) (Found!531 (index!4293 (_ BitVec 32))) (Intermediate!531 (undefined!1343 Bool) (index!4294 (_ BitVec 32)) (x!19030 (_ BitVec 32))) (Undefined!531) (MissingVacant!531 (index!4295 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7147 (_ BitVec 32)) SeekEntryResult!531)

(assert (=> b!172444 (= res!81881 (= (seekEntryOrOpen!0 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000) (_keys!5403 thiss!1248) (mask!8408 thiss!1248)) (Found!531 #b00000000000000000000000000000000)))))

(assert (=> b!172444 (=> (not res!81881) (not e!113820))))

(declare-fun b!172445 () Bool)

(assert (=> b!172445 (= e!113822 call!17515)))

(assert (= (and d!52575 (not res!81882)) b!172442))

(assert (= (and b!172442 c!30870) b!172444))

(assert (= (and b!172442 (not c!30870)) b!172445))

(assert (= (and b!172444 res!81881) b!172443))

(assert (= (or b!172443 b!172445) bm!17512))

(assert (=> b!172442 m!201389))

(assert (=> b!172442 m!201389))

(assert (=> b!172442 m!201391))

(declare-fun m!201397 () Bool)

(assert (=> bm!17512 m!201397))

(assert (=> b!172444 m!201389))

(declare-fun m!201399 () Bool)

(assert (=> b!172444 m!201399))

(declare-fun m!201401 () Bool)

(assert (=> b!172444 m!201401))

(assert (=> b!172444 m!201389))

(declare-fun m!201403 () Bool)

(assert (=> b!172444 m!201403))

(assert (=> b!172409 d!52575))

(declare-fun b!172454 () Bool)

(declare-fun e!113827 () (_ BitVec 32))

(declare-fun call!17518 () (_ BitVec 32))

(assert (=> b!172454 (= e!113827 (bvadd #b00000000000000000000000000000001 call!17518))))

(declare-fun bm!17515 () Bool)

(assert (=> bm!17515 (= call!17518 (arrayCountValidKeys!0 (_keys!5403 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3694 (_keys!5403 thiss!1248))))))

(declare-fun b!172455 () Bool)

(declare-fun e!113828 () (_ BitVec 32))

(assert (=> b!172455 (= e!113828 #b00000000000000000000000000000000)))

(declare-fun b!172456 () Bool)

(assert (=> b!172456 (= e!113828 e!113827)))

(declare-fun c!30876 () Bool)

(assert (=> b!172456 (= c!30876 (validKeyInArray!0 (select (arr!3398 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172457 () Bool)

(assert (=> b!172457 (= e!113827 call!17518)))

(declare-fun d!52577 () Bool)

(declare-fun lt!85728 () (_ BitVec 32))

(assert (=> d!52577 (and (bvsge lt!85728 #b00000000000000000000000000000000) (bvsle lt!85728 (bvsub (size!3694 (_keys!5403 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52577 (= lt!85728 e!113828)))

(declare-fun c!30875 () Bool)

(assert (=> d!52577 (= c!30875 (bvsge #b00000000000000000000000000000000 (size!3694 (_keys!5403 thiss!1248))))))

(assert (=> d!52577 (and (bvsle #b00000000000000000000000000000000 (size!3694 (_keys!5403 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3694 (_keys!5403 thiss!1248)) (size!3694 (_keys!5403 thiss!1248))))))

(assert (=> d!52577 (= (arrayCountValidKeys!0 (_keys!5403 thiss!1248) #b00000000000000000000000000000000 (size!3694 (_keys!5403 thiss!1248))) lt!85728)))

(assert (= (and d!52577 c!30875) b!172455))

(assert (= (and d!52577 (not c!30875)) b!172456))

(assert (= (and b!172456 c!30876) b!172454))

(assert (= (and b!172456 (not c!30876)) b!172457))

(assert (= (or b!172454 b!172457) bm!17515))

(declare-fun m!201405 () Bool)

(assert (=> bm!17515 m!201405))

(assert (=> b!172456 m!201389))

(assert (=> b!172456 m!201389))

(assert (=> b!172456 m!201391))

(assert (=> b!172408 d!52577))

(declare-fun d!52579 () Bool)

(declare-fun res!81894 () Bool)

(declare-fun e!113831 () Bool)

(assert (=> d!52579 (=> (not res!81894) (not e!113831))))

(assert (=> d!52579 (= res!81894 (validMask!0 (mask!8408 thiss!1248)))))

(assert (=> d!52579 (= (simpleValid!138 thiss!1248) e!113831)))

(declare-fun b!172468 () Bool)

(declare-fun res!81892 () Bool)

(assert (=> b!172468 (=> (not res!81892) (not e!113831))))

(declare-fun size!3700 (LongMapFixedSize!2242) (_ BitVec 32))

(assert (=> b!172468 (= res!81892 (= (size!3700 thiss!1248) (bvadd (_size!1170 thiss!1248) (bvsdiv (bvadd (extraKeys!3306 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!172469 () Bool)

(assert (=> b!172469 (= e!113831 (and (bvsge (extraKeys!3306 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3306 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1170 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172466 () Bool)

(declare-fun res!81891 () Bool)

(assert (=> b!172466 (=> (not res!81891) (not e!113831))))

(assert (=> b!172466 (= res!81891 (and (= (size!3695 (_values!3550 thiss!1248)) (bvadd (mask!8408 thiss!1248) #b00000000000000000000000000000001)) (= (size!3694 (_keys!5403 thiss!1248)) (size!3695 (_values!3550 thiss!1248))) (bvsge (_size!1170 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1170 thiss!1248) (bvadd (mask!8408 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172467 () Bool)

(declare-fun res!81893 () Bool)

(assert (=> b!172467 (=> (not res!81893) (not e!113831))))

(assert (=> b!172467 (= res!81893 (bvsge (size!3700 thiss!1248) (_size!1170 thiss!1248)))))

(assert (= (and d!52579 res!81894) b!172466))

(assert (= (and b!172466 res!81891) b!172467))

(assert (= (and b!172467 res!81893) b!172468))

(assert (= (and b!172468 res!81892) b!172469))

(assert (=> d!52579 m!201353))

(declare-fun m!201407 () Bool)

(assert (=> b!172468 m!201407))

(assert (=> b!172467 m!201407))

(assert (=> d!52571 d!52579))

(declare-fun b!172470 () Bool)

(declare-fun e!113832 () Bool)

(assert (=> b!172470 (= e!113832 tp_is_empty!4021)))

(declare-fun condMapEmpty!6847 () Bool)

(declare-fun mapDefault!6847 () ValueCell!1667)

(assert (=> mapNonEmpty!6846 (= condMapEmpty!6847 (= mapRest!6846 ((as const (Array (_ BitVec 32) ValueCell!1667)) mapDefault!6847)))))

(declare-fun e!113833 () Bool)

(declare-fun mapRes!6847 () Bool)

(assert (=> mapNonEmpty!6846 (= tp!15405 (and e!113833 mapRes!6847))))

(declare-fun mapNonEmpty!6847 () Bool)

(declare-fun tp!15406 () Bool)

(assert (=> mapNonEmpty!6847 (= mapRes!6847 (and tp!15406 e!113832))))

(declare-fun mapValue!6847 () ValueCell!1667)

(declare-fun mapRest!6847 () (Array (_ BitVec 32) ValueCell!1667))

(declare-fun mapKey!6847 () (_ BitVec 32))

(assert (=> mapNonEmpty!6847 (= mapRest!6846 (store mapRest!6847 mapKey!6847 mapValue!6847))))

(declare-fun b!172471 () Bool)

(assert (=> b!172471 (= e!113833 tp_is_empty!4021)))

(declare-fun mapIsEmpty!6847 () Bool)

(assert (=> mapIsEmpty!6847 mapRes!6847))

(assert (= (and mapNonEmpty!6846 condMapEmpty!6847) mapIsEmpty!6847))

(assert (= (and mapNonEmpty!6846 (not condMapEmpty!6847)) mapNonEmpty!6847))

(assert (= (and mapNonEmpty!6847 ((_ is ValueCellFull!1667) mapValue!6847)) b!172470))

(assert (= (and mapNonEmpty!6846 ((_ is ValueCellFull!1667) mapDefault!6847)) b!172471))

(declare-fun m!201409 () Bool)

(assert (=> mapNonEmpty!6847 m!201409))

(check-sat (not mapNonEmpty!6847) tp_is_empty!4021 (not b!172468) (not b_next!4249) (not bm!17515) (not b!172442) (not b!172432) (not b!172444) (not b!172433) (not b!172429) (not b!172456) (not bm!17509) b_and!10703 (not d!52579) (not b!172467) (not bm!17512))
(check-sat b_and!10703 (not b_next!4249))
