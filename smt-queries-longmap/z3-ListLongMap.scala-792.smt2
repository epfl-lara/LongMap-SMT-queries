; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18840 () Bool)

(assert start!18840)

(declare-fun b!185999 () Bool)

(declare-fun b_free!4591 () Bool)

(declare-fun b_next!4591 () Bool)

(assert (=> b!185999 (= b_free!4591 (not b_next!4591))))

(declare-fun tp!16575 () Bool)

(declare-fun b_and!11169 () Bool)

(assert (=> b!185999 (= tp!16575 b_and!11169)))

(declare-fun b!185991 () Bool)

(declare-fun e!122408 () Bool)

(declare-fun e!122407 () Bool)

(assert (=> b!185991 (= e!122408 e!122407)))

(declare-fun res!87963 () Bool)

(assert (=> b!185991 (=> (not res!87963) (not e!122407))))

(declare-datatypes ((V!5465 0))(
  ( (V!5466 (val!2226 Int)) )
))
(declare-datatypes ((ValueCell!1838 0))(
  ( (ValueCellFull!1838 (v!4132 V!5465)) (EmptyCell!1838) )
))
(declare-datatypes ((array!7917 0))(
  ( (array!7918 (arr!3736 (Array (_ BitVec 32) (_ BitVec 64))) (size!4053 (_ BitVec 32))) )
))
(declare-datatypes ((array!7919 0))(
  ( (array!7920 (arr!3737 (Array (_ BitVec 32) ValueCell!1838)) (size!4054 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2584 0))(
  ( (LongMapFixedSize!2585 (defaultEntry!3797 Int) (mask!8918 (_ BitVec 32)) (extraKeys!3534 (_ BitVec 32)) (zeroValue!3638 V!5465) (minValue!3638 V!5465) (_size!1341 (_ BitVec 32)) (_keys!5738 array!7917) (_values!3780 array!7919) (_vacant!1341 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2584)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185991 (= res!87963 (validMask!0 (mask!8918 thiss!1248)))))

(declare-datatypes ((Unit!5578 0))(
  ( (Unit!5579) )
))
(declare-fun lt!91853 () Unit!5578)

(declare-fun e!122401 () Unit!5578)

(assert (=> b!185991 (= lt!91853 e!122401)))

(declare-fun c!33344 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3428 0))(
  ( (tuple2!3429 (_1!1725 (_ BitVec 64)) (_2!1725 V!5465)) )
))
(declare-datatypes ((List!2360 0))(
  ( (Nil!2357) (Cons!2356 (h!2989 tuple2!3428) (t!7237 List!2360)) )
))
(declare-datatypes ((ListLongMap!2337 0))(
  ( (ListLongMap!2338 (toList!1184 List!2360)) )
))
(declare-fun contains!1286 (ListLongMap!2337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!817 (array!7917 array!7919 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 32) Int) ListLongMap!2337)

(assert (=> b!185991 (= c!33344 (contains!1286 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7509 () Bool)

(declare-fun mapRes!7509 () Bool)

(declare-fun tp!16574 () Bool)

(declare-fun e!122400 () Bool)

(assert (=> mapNonEmpty!7509 (= mapRes!7509 (and tp!16574 e!122400))))

(declare-fun mapRest!7509 () (Array (_ BitVec 32) ValueCell!1838))

(declare-fun mapKey!7509 () (_ BitVec 32))

(declare-fun mapValue!7509 () ValueCell!1838)

(assert (=> mapNonEmpty!7509 (= (arr!3737 (_values!3780 thiss!1248)) (store mapRest!7509 mapKey!7509 mapValue!7509))))

(declare-datatypes ((SeekEntryResult!644 0))(
  ( (MissingZero!644 (index!4746 (_ BitVec 32))) (Found!644 (index!4747 (_ BitVec 32))) (Intermediate!644 (undefined!1456 Bool) (index!4748 (_ BitVec 32)) (x!20207 (_ BitVec 32))) (Undefined!644) (MissingVacant!644 (index!4749 (_ BitVec 32))) )
))
(declare-fun lt!91850 () SeekEntryResult!644)

(declare-fun b!185992 () Bool)

(declare-fun e!122405 () Bool)

(assert (=> b!185992 (= e!122405 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4747 lt!91850)) key!828))))

(declare-fun b!185993 () Bool)

(declare-fun e!122403 () Bool)

(declare-fun e!122399 () Bool)

(assert (=> b!185993 (= e!122403 (and e!122399 mapRes!7509))))

(declare-fun condMapEmpty!7509 () Bool)

(declare-fun mapDefault!7509 () ValueCell!1838)

(assert (=> b!185993 (= condMapEmpty!7509 (= (arr!3737 (_values!3780 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1838)) mapDefault!7509)))))

(declare-fun b!185994 () Bool)

(declare-fun tp_is_empty!4363 () Bool)

(assert (=> b!185994 (= e!122400 tp_is_empty!4363)))

(declare-fun b!185995 () Bool)

(assert (=> b!185995 (= e!122407 (not (= (size!4054 (_values!3780 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8918 thiss!1248)))))))

(declare-fun b!185996 () Bool)

(declare-fun Unit!5580 () Unit!5578)

(assert (=> b!185996 (= e!122401 Unit!5580)))

(declare-fun lt!91851 () Unit!5578)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (array!7917 array!7919 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5578)

(assert (=> b!185996 (= lt!91851 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(assert (=> b!185996 false))

(declare-fun b!185997 () Bool)

(declare-fun res!87959 () Bool)

(declare-fun e!122402 () Bool)

(assert (=> b!185997 (=> (not res!87959) (not e!122402))))

(assert (=> b!185997 (= res!87959 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7509 () Bool)

(assert (=> mapIsEmpty!7509 mapRes!7509))

(declare-fun e!122404 () Bool)

(declare-fun array_inv!2419 (array!7917) Bool)

(declare-fun array_inv!2420 (array!7919) Bool)

(assert (=> b!185999 (= e!122404 (and tp!16575 tp_is_empty!4363 (array_inv!2419 (_keys!5738 thiss!1248)) (array_inv!2420 (_values!3780 thiss!1248)) e!122403))))

(declare-fun res!87962 () Bool)

(assert (=> start!18840 (=> (not res!87962) (not e!122402))))

(declare-fun valid!1084 (LongMapFixedSize!2584) Bool)

(assert (=> start!18840 (= res!87962 (valid!1084 thiss!1248))))

(assert (=> start!18840 e!122402))

(assert (=> start!18840 e!122404))

(assert (=> start!18840 true))

(declare-fun b!185998 () Bool)

(assert (=> b!185998 (= e!122399 tp_is_empty!4363)))

(declare-fun b!186000 () Bool)

(declare-fun lt!91852 () Unit!5578)

(assert (=> b!186000 (= e!122401 lt!91852)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (array!7917 array!7919 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5578)

(assert (=> b!186000 (= lt!91852 (lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(declare-fun res!87960 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186000 (= res!87960 (inRange!0 (index!4747 lt!91850) (mask!8918 thiss!1248)))))

(assert (=> b!186000 (=> (not res!87960) (not e!122405))))

(assert (=> b!186000 e!122405))

(declare-fun b!186001 () Bool)

(assert (=> b!186001 (= e!122402 e!122408)))

(declare-fun res!87961 () Bool)

(assert (=> b!186001 (=> (not res!87961) (not e!122408))))

(get-info :version)

(assert (=> b!186001 (= res!87961 (and (not ((_ is Undefined!644) lt!91850)) (not ((_ is MissingVacant!644) lt!91850)) (not ((_ is MissingZero!644) lt!91850)) ((_ is Found!644) lt!91850)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7917 (_ BitVec 32)) SeekEntryResult!644)

(assert (=> b!186001 (= lt!91850 (seekEntryOrOpen!0 key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(assert (= (and start!18840 res!87962) b!185997))

(assert (= (and b!185997 res!87959) b!186001))

(assert (= (and b!186001 res!87961) b!185991))

(assert (= (and b!185991 c!33344) b!186000))

(assert (= (and b!185991 (not c!33344)) b!185996))

(assert (= (and b!186000 res!87960) b!185992))

(assert (= (and b!185991 res!87963) b!185995))

(assert (= (and b!185993 condMapEmpty!7509) mapIsEmpty!7509))

(assert (= (and b!185993 (not condMapEmpty!7509)) mapNonEmpty!7509))

(assert (= (and mapNonEmpty!7509 ((_ is ValueCellFull!1838) mapValue!7509)) b!185994))

(assert (= (and b!185993 ((_ is ValueCellFull!1838) mapDefault!7509)) b!185998))

(assert (= b!185999 b!185993))

(assert (= start!18840 b!185999))

(declare-fun m!212535 () Bool)

(assert (=> b!186001 m!212535))

(declare-fun m!212537 () Bool)

(assert (=> b!185999 m!212537))

(declare-fun m!212539 () Bool)

(assert (=> b!185999 m!212539))

(declare-fun m!212541 () Bool)

(assert (=> start!18840 m!212541))

(declare-fun m!212543 () Bool)

(assert (=> b!185996 m!212543))

(declare-fun m!212545 () Bool)

(assert (=> b!185991 m!212545))

(declare-fun m!212547 () Bool)

(assert (=> b!185991 m!212547))

(assert (=> b!185991 m!212547))

(declare-fun m!212549 () Bool)

(assert (=> b!185991 m!212549))

(declare-fun m!212551 () Bool)

(assert (=> b!186000 m!212551))

(declare-fun m!212553 () Bool)

(assert (=> b!186000 m!212553))

(declare-fun m!212555 () Bool)

(assert (=> b!185992 m!212555))

(declare-fun m!212557 () Bool)

(assert (=> mapNonEmpty!7509 m!212557))

(check-sat (not start!18840) (not b!185999) (not b!185996) (not b!185991) (not b!186001) (not b!186000) b_and!11169 (not b_next!4591) (not mapNonEmpty!7509) tp_is_empty!4363)
(check-sat b_and!11169 (not b_next!4591))
(get-model)

(declare-fun d!55017 () Bool)

(declare-fun e!122471 () Bool)

(assert (=> d!55017 e!122471))

(declare-fun res!87999 () Bool)

(assert (=> d!55017 (=> (not res!87999) (not e!122471))))

(declare-fun lt!91882 () SeekEntryResult!644)

(assert (=> d!55017 (= res!87999 ((_ is Found!644) lt!91882))))

(assert (=> d!55017 (= lt!91882 (seekEntryOrOpen!0 key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun lt!91883 () Unit!5578)

(declare-fun choose!991 (array!7917 array!7919 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5578)

(assert (=> d!55017 (= lt!91883 (choose!991 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(assert (=> d!55017 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55017 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!144 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) lt!91883)))

(declare-fun b!186072 () Bool)

(declare-fun res!87998 () Bool)

(assert (=> b!186072 (=> (not res!87998) (not e!122471))))

(assert (=> b!186072 (= res!87998 (inRange!0 (index!4747 lt!91882) (mask!8918 thiss!1248)))))

(declare-fun b!186073 () Bool)

(assert (=> b!186073 (= e!122471 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4747 lt!91882)) key!828))))

(assert (=> b!186073 (and (bvsge (index!4747 lt!91882) #b00000000000000000000000000000000) (bvslt (index!4747 lt!91882) (size!4053 (_keys!5738 thiss!1248))))))

(assert (= (and d!55017 res!87999) b!186072))

(assert (= (and b!186072 res!87998) b!186073))

(assert (=> d!55017 m!212535))

(declare-fun m!212607 () Bool)

(assert (=> d!55017 m!212607))

(assert (=> d!55017 m!212545))

(declare-fun m!212609 () Bool)

(assert (=> b!186072 m!212609))

(declare-fun m!212611 () Bool)

(assert (=> b!186073 m!212611))

(assert (=> b!186000 d!55017))

(declare-fun d!55019 () Bool)

(assert (=> d!55019 (= (inRange!0 (index!4747 lt!91850) (mask!8918 thiss!1248)) (and (bvsge (index!4747 lt!91850) #b00000000000000000000000000000000) (bvslt (index!4747 lt!91850) (bvadd (mask!8918 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186000 d!55019))

(declare-fun call!18747 () Bool)

(declare-fun lt!91888 () SeekEntryResult!644)

(declare-fun c!33356 () Bool)

(declare-fun bm!18744 () Bool)

(assert (=> bm!18744 (= call!18747 (inRange!0 (ite c!33356 (index!4746 lt!91888) (index!4749 lt!91888)) (mask!8918 thiss!1248)))))

(declare-fun b!186090 () Bool)

(declare-fun e!122481 () Bool)

(declare-fun call!18748 () Bool)

(assert (=> b!186090 (= e!122481 (not call!18748))))

(declare-fun b!186091 () Bool)

(declare-fun e!122483 () Bool)

(assert (=> b!186091 (= e!122483 (not call!18748))))

(declare-fun b!186092 () Bool)

(declare-fun e!122482 () Bool)

(declare-fun e!122480 () Bool)

(assert (=> b!186092 (= e!122482 e!122480)))

(declare-fun c!33355 () Bool)

(assert (=> b!186092 (= c!33355 ((_ is MissingVacant!644) lt!91888))))

(declare-fun d!55021 () Bool)

(assert (=> d!55021 e!122482))

(assert (=> d!55021 (= c!33356 ((_ is MissingZero!644) lt!91888))))

(assert (=> d!55021 (= lt!91888 (seekEntryOrOpen!0 key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun lt!91889 () Unit!5578)

(declare-fun choose!992 (array!7917 array!7919 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 64) Int) Unit!5578)

(assert (=> d!55021 (= lt!91889 (choose!992 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)))))

(assert (=> d!55021 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55021 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) lt!91889)))

(declare-fun b!186093 () Bool)

(assert (=> b!186093 (= e!122480 ((_ is Undefined!644) lt!91888))))

(declare-fun b!186094 () Bool)

(assert (=> b!186094 (= e!122482 e!122481)))

(declare-fun res!88009 () Bool)

(assert (=> b!186094 (= res!88009 call!18747)))

(assert (=> b!186094 (=> (not res!88009) (not e!122481))))

(declare-fun b!186095 () Bool)

(declare-fun res!88008 () Bool)

(assert (=> b!186095 (=> (not res!88008) (not e!122483))))

(assert (=> b!186095 (= res!88008 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4749 lt!91888)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186095 (and (bvsge (index!4749 lt!91888) #b00000000000000000000000000000000) (bvslt (index!4749 lt!91888) (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186096 () Bool)

(assert (=> b!186096 (and (bvsge (index!4746 lt!91888) #b00000000000000000000000000000000) (bvslt (index!4746 lt!91888) (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun res!88011 () Bool)

(assert (=> b!186096 (= res!88011 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4746 lt!91888)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186096 (=> (not res!88011) (not e!122481))))

(declare-fun bm!18745 () Bool)

(declare-fun arrayContainsKey!0 (array!7917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18745 (= call!18748 (arrayContainsKey!0 (_keys!5738 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186097 () Bool)

(declare-fun res!88010 () Bool)

(assert (=> b!186097 (=> (not res!88010) (not e!122483))))

(assert (=> b!186097 (= res!88010 call!18747)))

(assert (=> b!186097 (= e!122480 e!122483)))

(assert (= (and d!55021 c!33356) b!186094))

(assert (= (and d!55021 (not c!33356)) b!186092))

(assert (= (and b!186094 res!88009) b!186096))

(assert (= (and b!186096 res!88011) b!186090))

(assert (= (and b!186092 c!33355) b!186097))

(assert (= (and b!186092 (not c!33355)) b!186093))

(assert (= (and b!186097 res!88010) b!186095))

(assert (= (and b!186095 res!88008) b!186091))

(assert (= (or b!186094 b!186097) bm!18744))

(assert (= (or b!186090 b!186091) bm!18745))

(assert (=> d!55021 m!212535))

(declare-fun m!212613 () Bool)

(assert (=> d!55021 m!212613))

(assert (=> d!55021 m!212545))

(declare-fun m!212615 () Bool)

(assert (=> b!186095 m!212615))

(declare-fun m!212617 () Bool)

(assert (=> bm!18744 m!212617))

(declare-fun m!212619 () Bool)

(assert (=> bm!18745 m!212619))

(declare-fun m!212621 () Bool)

(assert (=> b!186096 m!212621))

(assert (=> b!185996 d!55021))

(declare-fun d!55023 () Bool)

(assert (=> d!55023 (= (validMask!0 (mask!8918 thiss!1248)) (and (or (= (mask!8918 thiss!1248) #b00000000000000000000000000000111) (= (mask!8918 thiss!1248) #b00000000000000000000000000001111) (= (mask!8918 thiss!1248) #b00000000000000000000000000011111) (= (mask!8918 thiss!1248) #b00000000000000000000000000111111) (= (mask!8918 thiss!1248) #b00000000000000000000000001111111) (= (mask!8918 thiss!1248) #b00000000000000000000000011111111) (= (mask!8918 thiss!1248) #b00000000000000000000000111111111) (= (mask!8918 thiss!1248) #b00000000000000000000001111111111) (= (mask!8918 thiss!1248) #b00000000000000000000011111111111) (= (mask!8918 thiss!1248) #b00000000000000000000111111111111) (= (mask!8918 thiss!1248) #b00000000000000000001111111111111) (= (mask!8918 thiss!1248) #b00000000000000000011111111111111) (= (mask!8918 thiss!1248) #b00000000000000000111111111111111) (= (mask!8918 thiss!1248) #b00000000000000001111111111111111) (= (mask!8918 thiss!1248) #b00000000000000011111111111111111) (= (mask!8918 thiss!1248) #b00000000000000111111111111111111) (= (mask!8918 thiss!1248) #b00000000000001111111111111111111) (= (mask!8918 thiss!1248) #b00000000000011111111111111111111) (= (mask!8918 thiss!1248) #b00000000000111111111111111111111) (= (mask!8918 thiss!1248) #b00000000001111111111111111111111) (= (mask!8918 thiss!1248) #b00000000011111111111111111111111) (= (mask!8918 thiss!1248) #b00000000111111111111111111111111) (= (mask!8918 thiss!1248) #b00000001111111111111111111111111) (= (mask!8918 thiss!1248) #b00000011111111111111111111111111) (= (mask!8918 thiss!1248) #b00000111111111111111111111111111) (= (mask!8918 thiss!1248) #b00001111111111111111111111111111) (= (mask!8918 thiss!1248) #b00011111111111111111111111111111) (= (mask!8918 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8918 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185991 d!55023))

(declare-fun d!55025 () Bool)

(declare-fun e!122489 () Bool)

(assert (=> d!55025 e!122489))

(declare-fun res!88014 () Bool)

(assert (=> d!55025 (=> res!88014 e!122489)))

(declare-fun lt!91898 () Bool)

(assert (=> d!55025 (= res!88014 (not lt!91898))))

(declare-fun lt!91900 () Bool)

(assert (=> d!55025 (= lt!91898 lt!91900)))

(declare-fun lt!91901 () Unit!5578)

(declare-fun e!122488 () Unit!5578)

(assert (=> d!55025 (= lt!91901 e!122488)))

(declare-fun c!33359 () Bool)

(assert (=> d!55025 (= c!33359 lt!91900)))

(declare-fun containsKey!227 (List!2360 (_ BitVec 64)) Bool)

(assert (=> d!55025 (= lt!91900 (containsKey!227 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(assert (=> d!55025 (= (contains!1286 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) key!828) lt!91898)))

(declare-fun b!186104 () Bool)

(declare-fun lt!91899 () Unit!5578)

(assert (=> b!186104 (= e!122488 lt!91899)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!176 (List!2360 (_ BitVec 64)) Unit!5578)

(assert (=> b!186104 (= lt!91899 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-datatypes ((Option!229 0))(
  ( (Some!228 (v!4135 V!5465)) (None!227) )
))
(declare-fun isDefined!177 (Option!229) Bool)

(declare-fun getValueByKey!223 (List!2360 (_ BitVec 64)) Option!229)

(assert (=> b!186104 (isDefined!177 (getValueByKey!223 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-fun b!186105 () Bool)

(declare-fun Unit!5587 () Unit!5578)

(assert (=> b!186105 (= e!122488 Unit!5587)))

(declare-fun b!186106 () Bool)

(assert (=> b!186106 (= e!122489 (isDefined!177 (getValueByKey!223 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828)))))

(assert (= (and d!55025 c!33359) b!186104))

(assert (= (and d!55025 (not c!33359)) b!186105))

(assert (= (and d!55025 (not res!88014)) b!186106))

(declare-fun m!212623 () Bool)

(assert (=> d!55025 m!212623))

(declare-fun m!212625 () Bool)

(assert (=> b!186104 m!212625))

(declare-fun m!212627 () Bool)

(assert (=> b!186104 m!212627))

(assert (=> b!186104 m!212627))

(declare-fun m!212629 () Bool)

(assert (=> b!186104 m!212629))

(assert (=> b!186106 m!212627))

(assert (=> b!186106 m!212627))

(assert (=> b!186106 m!212629))

(assert (=> b!185991 d!55025))

(declare-fun b!186149 () Bool)

(declare-fun e!122518 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186149 (= e!122518 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18760 () Bool)

(declare-fun call!18766 () ListLongMap!2337)

(declare-fun call!18768 () ListLongMap!2337)

(assert (=> bm!18760 (= call!18766 call!18768)))

(declare-fun b!186150 () Bool)

(declare-fun e!122520 () Bool)

(declare-fun lt!91962 () ListLongMap!2337)

(declare-fun apply!168 (ListLongMap!2337 (_ BitVec 64)) V!5465)

(assert (=> b!186150 (= e!122520 (= (apply!168 lt!91962 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3638 thiss!1248)))))

(declare-fun bm!18761 () Bool)

(declare-fun call!18763 () Bool)

(assert (=> bm!18761 (= call!18763 (contains!1286 lt!91962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186151 () Bool)

(declare-fun e!122524 () ListLongMap!2337)

(declare-fun e!122526 () ListLongMap!2337)

(assert (=> b!186151 (= e!122524 e!122526)))

(declare-fun c!33374 () Bool)

(assert (=> b!186151 (= c!33374 (and (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186152 () Bool)

(declare-fun e!122522 () Bool)

(assert (=> b!186152 (= e!122522 (not call!18763))))

(declare-fun b!186153 () Bool)

(declare-fun e!122527 () Bool)

(assert (=> b!186153 (= e!122522 e!122527)))

(declare-fun res!88037 () Bool)

(assert (=> b!186153 (= res!88037 call!18763)))

(assert (=> b!186153 (=> (not res!88037) (not e!122527))))

(declare-fun b!186154 () Bool)

(declare-fun e!122516 () Unit!5578)

(declare-fun lt!91967 () Unit!5578)

(assert (=> b!186154 (= e!122516 lt!91967)))

(declare-fun lt!91960 () ListLongMap!2337)

(declare-fun getCurrentListMapNoExtraKeys!189 (array!7917 array!7919 (_ BitVec 32) (_ BitVec 32) V!5465 V!5465 (_ BitVec 32) Int) ListLongMap!2337)

(assert (=> b!186154 (= lt!91960 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!91955 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91955 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91950 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91950 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91965 () Unit!5578)

(declare-fun addStillContains!144 (ListLongMap!2337 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5578)

(assert (=> b!186154 (= lt!91965 (addStillContains!144 lt!91960 lt!91955 (zeroValue!3638 thiss!1248) lt!91950))))

(declare-fun +!285 (ListLongMap!2337 tuple2!3428) ListLongMap!2337)

(assert (=> b!186154 (contains!1286 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))) lt!91950)))

(declare-fun lt!91951 () Unit!5578)

(assert (=> b!186154 (= lt!91951 lt!91965)))

(declare-fun lt!91957 () ListLongMap!2337)

(assert (=> b!186154 (= lt!91957 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!91958 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91958 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91961 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91961 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91952 () Unit!5578)

(declare-fun addApplyDifferent!144 (ListLongMap!2337 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5578)

(assert (=> b!186154 (= lt!91952 (addApplyDifferent!144 lt!91957 lt!91958 (minValue!3638 thiss!1248) lt!91961))))

(assert (=> b!186154 (= (apply!168 (+!285 lt!91957 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))) lt!91961) (apply!168 lt!91957 lt!91961))))

(declare-fun lt!91963 () Unit!5578)

(assert (=> b!186154 (= lt!91963 lt!91952)))

(declare-fun lt!91949 () ListLongMap!2337)

(assert (=> b!186154 (= lt!91949 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!91964 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91946 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91946 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91959 () Unit!5578)

(assert (=> b!186154 (= lt!91959 (addApplyDifferent!144 lt!91949 lt!91964 (zeroValue!3638 thiss!1248) lt!91946))))

(assert (=> b!186154 (= (apply!168 (+!285 lt!91949 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))) lt!91946) (apply!168 lt!91949 lt!91946))))

(declare-fun lt!91956 () Unit!5578)

(assert (=> b!186154 (= lt!91956 lt!91959)))

(declare-fun lt!91953 () ListLongMap!2337)

(assert (=> b!186154 (= lt!91953 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun lt!91947 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91947 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91948 () (_ BitVec 64))

(assert (=> b!186154 (= lt!91948 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186154 (= lt!91967 (addApplyDifferent!144 lt!91953 lt!91947 (minValue!3638 thiss!1248) lt!91948))))

(assert (=> b!186154 (= (apply!168 (+!285 lt!91953 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))) lt!91948) (apply!168 lt!91953 lt!91948))))

(declare-fun bm!18762 () Bool)

(declare-fun call!18765 () Bool)

(assert (=> bm!18762 (= call!18765 (contains!1286 lt!91962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55027 () Bool)

(declare-fun e!122517 () Bool)

(assert (=> d!55027 e!122517))

(declare-fun res!88033 () Bool)

(assert (=> d!55027 (=> (not res!88033) (not e!122517))))

(assert (=> d!55027 (= res!88033 (or (bvsge #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))))

(declare-fun lt!91954 () ListLongMap!2337)

(assert (=> d!55027 (= lt!91962 lt!91954)))

(declare-fun lt!91966 () Unit!5578)

(assert (=> d!55027 (= lt!91966 e!122516)))

(declare-fun c!33372 () Bool)

(assert (=> d!55027 (= c!33372 e!122518)))

(declare-fun res!88035 () Bool)

(assert (=> d!55027 (=> (not res!88035) (not e!122518))))

(assert (=> d!55027 (= res!88035 (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> d!55027 (= lt!91954 e!122524)))

(declare-fun c!33375 () Bool)

(assert (=> d!55027 (= c!33375 (and (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55027 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55027 (= (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) lt!91962)))

(declare-fun b!186155 () Bool)

(declare-fun e!122523 () Bool)

(assert (=> b!186155 (= e!122523 (not call!18765))))

(declare-fun b!186156 () Bool)

(declare-fun c!33373 () Bool)

(assert (=> b!186156 (= c!33373 (and (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122521 () ListLongMap!2337)

(assert (=> b!186156 (= e!122526 e!122521)))

(declare-fun bm!18763 () Bool)

(declare-fun call!18767 () ListLongMap!2337)

(declare-fun call!18769 () ListLongMap!2337)

(assert (=> bm!18763 (= call!18767 call!18769)))

(declare-fun b!186157 () Bool)

(declare-fun Unit!5588 () Unit!5578)

(assert (=> b!186157 (= e!122516 Unit!5588)))

(declare-fun b!186158 () Bool)

(declare-fun e!122528 () Bool)

(assert (=> b!186158 (= e!122528 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18764 () Bool)

(declare-fun call!18764 () ListLongMap!2337)

(assert (=> bm!18764 (= call!18764 call!18766)))

(declare-fun bm!18765 () Bool)

(assert (=> bm!18765 (= call!18768 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))

(declare-fun b!186159 () Bool)

(assert (=> b!186159 (= e!122521 call!18767)))

(declare-fun b!186160 () Bool)

(declare-fun e!122519 () Bool)

(declare-fun e!122525 () Bool)

(assert (=> b!186160 (= e!122519 e!122525)))

(declare-fun res!88038 () Bool)

(assert (=> b!186160 (=> (not res!88038) (not e!122525))))

(assert (=> b!186160 (= res!88038 (contains!1286 lt!91962 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186160 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186161 () Bool)

(assert (=> b!186161 (= e!122526 call!18767)))

(declare-fun b!186162 () Bool)

(declare-fun res!88039 () Bool)

(assert (=> b!186162 (=> (not res!88039) (not e!122517))))

(assert (=> b!186162 (= res!88039 e!122523)))

(declare-fun c!33377 () Bool)

(assert (=> b!186162 (= c!33377 (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186163 () Bool)

(assert (=> b!186163 (= e!122517 e!122522)))

(declare-fun c!33376 () Bool)

(assert (=> b!186163 (= c!33376 (not (= (bvand (extraKeys!3534 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186164 () Bool)

(declare-fun get!2145 (ValueCell!1838 V!5465) V!5465)

(declare-fun dynLambda!502 (Int (_ BitVec 64)) V!5465)

(assert (=> b!186164 (= e!122525 (= (apply!168 lt!91962 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)) (get!2145 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4054 (_values!3780 thiss!1248))))))

(assert (=> b!186164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186165 () Bool)

(assert (=> b!186165 (= e!122523 e!122520)))

(declare-fun res!88036 () Bool)

(assert (=> b!186165 (= res!88036 call!18765)))

(assert (=> b!186165 (=> (not res!88036) (not e!122520))))

(declare-fun b!186166 () Bool)

(assert (=> b!186166 (= e!122524 (+!285 call!18769 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))

(declare-fun b!186167 () Bool)

(assert (=> b!186167 (= e!122527 (= (apply!168 lt!91962 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3638 thiss!1248)))))

(declare-fun b!186168 () Bool)

(declare-fun res!88041 () Bool)

(assert (=> b!186168 (=> (not res!88041) (not e!122517))))

(assert (=> b!186168 (= res!88041 e!122519)))

(declare-fun res!88040 () Bool)

(assert (=> b!186168 (=> res!88040 e!122519)))

(assert (=> b!186168 (= res!88040 (not e!122528))))

(declare-fun res!88034 () Bool)

(assert (=> b!186168 (=> (not res!88034) (not e!122528))))

(assert (=> b!186168 (= res!88034 (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun bm!18766 () Bool)

(assert (=> bm!18766 (= call!18769 (+!285 (ite c!33375 call!18768 (ite c!33374 call!18766 call!18764)) (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(declare-fun b!186169 () Bool)

(assert (=> b!186169 (= e!122521 call!18764)))

(assert (= (and d!55027 c!33375) b!186166))

(assert (= (and d!55027 (not c!33375)) b!186151))

(assert (= (and b!186151 c!33374) b!186161))

(assert (= (and b!186151 (not c!33374)) b!186156))

(assert (= (and b!186156 c!33373) b!186159))

(assert (= (and b!186156 (not c!33373)) b!186169))

(assert (= (or b!186159 b!186169) bm!18764))

(assert (= (or b!186161 bm!18764) bm!18760))

(assert (= (or b!186161 b!186159) bm!18763))

(assert (= (or b!186166 bm!18760) bm!18765))

(assert (= (or b!186166 bm!18763) bm!18766))

(assert (= (and d!55027 res!88035) b!186149))

(assert (= (and d!55027 c!33372) b!186154))

(assert (= (and d!55027 (not c!33372)) b!186157))

(assert (= (and d!55027 res!88033) b!186168))

(assert (= (and b!186168 res!88034) b!186158))

(assert (= (and b!186168 (not res!88040)) b!186160))

(assert (= (and b!186160 res!88038) b!186164))

(assert (= (and b!186168 res!88041) b!186162))

(assert (= (and b!186162 c!33377) b!186165))

(assert (= (and b!186162 (not c!33377)) b!186155))

(assert (= (and b!186165 res!88036) b!186150))

(assert (= (or b!186165 b!186155) bm!18762))

(assert (= (and b!186162 res!88039) b!186163))

(assert (= (and b!186163 c!33376) b!186153))

(assert (= (and b!186163 (not c!33376)) b!186152))

(assert (= (and b!186153 res!88037) b!186167))

(assert (= (or b!186153 b!186152) bm!18761))

(declare-fun b_lambda!7241 () Bool)

(assert (=> (not b_lambda!7241) (not b!186164)))

(declare-fun t!7241 () Bool)

(declare-fun tb!2839 () Bool)

(assert (=> (and b!185999 (= (defaultEntry!3797 thiss!1248) (defaultEntry!3797 thiss!1248)) t!7241) tb!2839))

(declare-fun result!4811 () Bool)

(assert (=> tb!2839 (= result!4811 tp_is_empty!4363)))

(assert (=> b!186164 t!7241))

(declare-fun b_and!11175 () Bool)

(assert (= b_and!11169 (and (=> t!7241 result!4811) b_and!11175)))

(declare-fun m!212631 () Bool)

(assert (=> bm!18762 m!212631))

(declare-fun m!212633 () Bool)

(assert (=> bm!18761 m!212633))

(declare-fun m!212635 () Bool)

(assert (=> b!186167 m!212635))

(declare-fun m!212637 () Bool)

(assert (=> b!186150 m!212637))

(declare-fun m!212639 () Bool)

(assert (=> b!186154 m!212639))

(declare-fun m!212641 () Bool)

(assert (=> b!186154 m!212641))

(declare-fun m!212643 () Bool)

(assert (=> b!186154 m!212643))

(declare-fun m!212645 () Bool)

(assert (=> b!186154 m!212645))

(declare-fun m!212647 () Bool)

(assert (=> b!186154 m!212647))

(declare-fun m!212649 () Bool)

(assert (=> b!186154 m!212649))

(declare-fun m!212651 () Bool)

(assert (=> b!186154 m!212651))

(declare-fun m!212653 () Bool)

(assert (=> b!186154 m!212653))

(declare-fun m!212655 () Bool)

(assert (=> b!186154 m!212655))

(declare-fun m!212657 () Bool)

(assert (=> b!186154 m!212657))

(declare-fun m!212659 () Bool)

(assert (=> b!186154 m!212659))

(declare-fun m!212661 () Bool)

(assert (=> b!186154 m!212661))

(declare-fun m!212663 () Bool)

(assert (=> b!186154 m!212663))

(assert (=> b!186154 m!212657))

(assert (=> b!186154 m!212661))

(assert (=> b!186154 m!212645))

(assert (=> b!186154 m!212641))

(declare-fun m!212665 () Bool)

(assert (=> b!186154 m!212665))

(declare-fun m!212667 () Bool)

(assert (=> b!186154 m!212667))

(declare-fun m!212669 () Bool)

(assert (=> b!186154 m!212669))

(declare-fun m!212671 () Bool)

(assert (=> b!186154 m!212671))

(assert (=> b!186164 m!212649))

(declare-fun m!212673 () Bool)

(assert (=> b!186164 m!212673))

(assert (=> b!186164 m!212649))

(declare-fun m!212675 () Bool)

(assert (=> b!186164 m!212675))

(declare-fun m!212677 () Bool)

(assert (=> b!186164 m!212677))

(assert (=> b!186164 m!212677))

(assert (=> b!186164 m!212675))

(declare-fun m!212679 () Bool)

(assert (=> b!186164 m!212679))

(assert (=> d!55027 m!212545))

(assert (=> b!186160 m!212649))

(assert (=> b!186160 m!212649))

(declare-fun m!212681 () Bool)

(assert (=> b!186160 m!212681))

(assert (=> b!186158 m!212649))

(assert (=> b!186158 m!212649))

(declare-fun m!212683 () Bool)

(assert (=> b!186158 m!212683))

(assert (=> b!186149 m!212649))

(assert (=> b!186149 m!212649))

(assert (=> b!186149 m!212683))

(assert (=> bm!18765 m!212651))

(declare-fun m!212685 () Bool)

(assert (=> b!186166 m!212685))

(declare-fun m!212687 () Bool)

(assert (=> bm!18766 m!212687))

(assert (=> b!185991 d!55027))

(declare-fun b!186184 () Bool)

(declare-fun c!33386 () Bool)

(declare-fun lt!91976 () (_ BitVec 64))

(assert (=> b!186184 (= c!33386 (= lt!91976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122535 () SeekEntryResult!644)

(declare-fun e!122536 () SeekEntryResult!644)

(assert (=> b!186184 (= e!122535 e!122536)))

(declare-fun lt!91975 () SeekEntryResult!644)

(declare-fun b!186185 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7917 (_ BitVec 32)) SeekEntryResult!644)

(assert (=> b!186185 (= e!122536 (seekKeyOrZeroReturnVacant!0 (x!20207 lt!91975) (index!4748 lt!91975) (index!4748 lt!91975) key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun b!186186 () Bool)

(assert (=> b!186186 (= e!122536 (MissingZero!644 (index!4748 lt!91975)))))

(declare-fun b!186187 () Bool)

(assert (=> b!186187 (= e!122535 (Found!644 (index!4748 lt!91975)))))

(declare-fun b!186188 () Bool)

(declare-fun e!122537 () SeekEntryResult!644)

(assert (=> b!186188 (= e!122537 e!122535)))

(assert (=> b!186188 (= lt!91976 (select (arr!3736 (_keys!5738 thiss!1248)) (index!4748 lt!91975)))))

(declare-fun c!33385 () Bool)

(assert (=> b!186188 (= c!33385 (= lt!91976 key!828))))

(declare-fun d!55029 () Bool)

(declare-fun lt!91974 () SeekEntryResult!644)

(assert (=> d!55029 (and (or ((_ is Undefined!644) lt!91974) (not ((_ is Found!644) lt!91974)) (and (bvsge (index!4747 lt!91974) #b00000000000000000000000000000000) (bvslt (index!4747 lt!91974) (size!4053 (_keys!5738 thiss!1248))))) (or ((_ is Undefined!644) lt!91974) ((_ is Found!644) lt!91974) (not ((_ is MissingZero!644) lt!91974)) (and (bvsge (index!4746 lt!91974) #b00000000000000000000000000000000) (bvslt (index!4746 lt!91974) (size!4053 (_keys!5738 thiss!1248))))) (or ((_ is Undefined!644) lt!91974) ((_ is Found!644) lt!91974) ((_ is MissingZero!644) lt!91974) (not ((_ is MissingVacant!644) lt!91974)) (and (bvsge (index!4749 lt!91974) #b00000000000000000000000000000000) (bvslt (index!4749 lt!91974) (size!4053 (_keys!5738 thiss!1248))))) (or ((_ is Undefined!644) lt!91974) (ite ((_ is Found!644) lt!91974) (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4747 lt!91974)) key!828) (ite ((_ is MissingZero!644) lt!91974) (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4746 lt!91974)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!644) lt!91974) (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4749 lt!91974)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55029 (= lt!91974 e!122537)))

(declare-fun c!33384 () Bool)

(assert (=> d!55029 (= c!33384 (and ((_ is Intermediate!644) lt!91975) (undefined!1456 lt!91975)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7917 (_ BitVec 32)) SeekEntryResult!644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55029 (= lt!91975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8918 thiss!1248)) key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(assert (=> d!55029 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55029 (= (seekEntryOrOpen!0 key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)) lt!91974)))

(declare-fun b!186189 () Bool)

(assert (=> b!186189 (= e!122537 Undefined!644)))

(assert (= (and d!55029 c!33384) b!186189))

(assert (= (and d!55029 (not c!33384)) b!186188))

(assert (= (and b!186188 c!33385) b!186187))

(assert (= (and b!186188 (not c!33385)) b!186184))

(assert (= (and b!186184 c!33386) b!186186))

(assert (= (and b!186184 (not c!33386)) b!186185))

(declare-fun m!212689 () Bool)

(assert (=> b!186185 m!212689))

(declare-fun m!212691 () Bool)

(assert (=> b!186188 m!212691))

(declare-fun m!212693 () Bool)

(assert (=> d!55029 m!212693))

(declare-fun m!212695 () Bool)

(assert (=> d!55029 m!212695))

(assert (=> d!55029 m!212545))

(assert (=> d!55029 m!212693))

(declare-fun m!212697 () Bool)

(assert (=> d!55029 m!212697))

(declare-fun m!212699 () Bool)

(assert (=> d!55029 m!212699))

(declare-fun m!212701 () Bool)

(assert (=> d!55029 m!212701))

(assert (=> b!186001 d!55029))

(declare-fun d!55031 () Bool)

(declare-fun res!88048 () Bool)

(declare-fun e!122540 () Bool)

(assert (=> d!55031 (=> (not res!88048) (not e!122540))))

(declare-fun simpleValid!184 (LongMapFixedSize!2584) Bool)

(assert (=> d!55031 (= res!88048 (simpleValid!184 thiss!1248))))

(assert (=> d!55031 (= (valid!1084 thiss!1248) e!122540)))

(declare-fun b!186196 () Bool)

(declare-fun res!88049 () Bool)

(assert (=> b!186196 (=> (not res!88049) (not e!122540))))

(declare-fun arrayCountValidKeys!0 (array!7917 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186196 (= res!88049 (= (arrayCountValidKeys!0 (_keys!5738 thiss!1248) #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))) (_size!1341 thiss!1248)))))

(declare-fun b!186197 () Bool)

(declare-fun res!88050 () Bool)

(assert (=> b!186197 (=> (not res!88050) (not e!122540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7917 (_ BitVec 32)) Bool)

(assert (=> b!186197 (= res!88050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun b!186198 () Bool)

(declare-datatypes ((List!2363 0))(
  ( (Nil!2360) (Cons!2359 (h!2992 (_ BitVec 64)) (t!7242 List!2363)) )
))
(declare-fun arrayNoDuplicates!0 (array!7917 (_ BitVec 32) List!2363) Bool)

(assert (=> b!186198 (= e!122540 (arrayNoDuplicates!0 (_keys!5738 thiss!1248) #b00000000000000000000000000000000 Nil!2360))))

(assert (= (and d!55031 res!88048) b!186196))

(assert (= (and b!186196 res!88049) b!186197))

(assert (= (and b!186197 res!88050) b!186198))

(declare-fun m!212703 () Bool)

(assert (=> d!55031 m!212703))

(declare-fun m!212705 () Bool)

(assert (=> b!186196 m!212705))

(declare-fun m!212707 () Bool)

(assert (=> b!186197 m!212707))

(declare-fun m!212709 () Bool)

(assert (=> b!186198 m!212709))

(assert (=> start!18840 d!55031))

(declare-fun d!55033 () Bool)

(assert (=> d!55033 (= (array_inv!2419 (_keys!5738 thiss!1248)) (bvsge (size!4053 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185999 d!55033))

(declare-fun d!55035 () Bool)

(assert (=> d!55035 (= (array_inv!2420 (_values!3780 thiss!1248)) (bvsge (size!4054 (_values!3780 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185999 d!55035))

(declare-fun mapIsEmpty!7518 () Bool)

(declare-fun mapRes!7518 () Bool)

(assert (=> mapIsEmpty!7518 mapRes!7518))

(declare-fun b!186205 () Bool)

(declare-fun e!122546 () Bool)

(assert (=> b!186205 (= e!122546 tp_is_empty!4363)))

(declare-fun condMapEmpty!7518 () Bool)

(declare-fun mapDefault!7518 () ValueCell!1838)

(assert (=> mapNonEmpty!7509 (= condMapEmpty!7518 (= mapRest!7509 ((as const (Array (_ BitVec 32) ValueCell!1838)) mapDefault!7518)))))

(declare-fun e!122545 () Bool)

(assert (=> mapNonEmpty!7509 (= tp!16574 (and e!122545 mapRes!7518))))

(declare-fun mapNonEmpty!7518 () Bool)

(declare-fun tp!16590 () Bool)

(assert (=> mapNonEmpty!7518 (= mapRes!7518 (and tp!16590 e!122546))))

(declare-fun mapKey!7518 () (_ BitVec 32))

(declare-fun mapRest!7518 () (Array (_ BitVec 32) ValueCell!1838))

(declare-fun mapValue!7518 () ValueCell!1838)

(assert (=> mapNonEmpty!7518 (= mapRest!7509 (store mapRest!7518 mapKey!7518 mapValue!7518))))

(declare-fun b!186206 () Bool)

(assert (=> b!186206 (= e!122545 tp_is_empty!4363)))

(assert (= (and mapNonEmpty!7509 condMapEmpty!7518) mapIsEmpty!7518))

(assert (= (and mapNonEmpty!7509 (not condMapEmpty!7518)) mapNonEmpty!7518))

(assert (= (and mapNonEmpty!7518 ((_ is ValueCellFull!1838) mapValue!7518)) b!186205))

(assert (= (and mapNonEmpty!7509 ((_ is ValueCellFull!1838) mapDefault!7518)) b!186206))

(declare-fun m!212711 () Bool)

(assert (=> mapNonEmpty!7518 m!212711))

(declare-fun b_lambda!7243 () Bool)

(assert (= b_lambda!7241 (or (and b!185999 b_free!4591) b_lambda!7243)))

(check-sat (not bm!18762) (not b!186154) (not b!186150) (not b!186197) (not b!186198) (not b!186196) (not d!55031) (not b!186149) (not b!186104) (not b!186185) (not b_next!4591) (not d!55029) (not bm!18766) (not d!55021) (not bm!18761) (not b!186164) (not b!186160) tp_is_empty!4363 (not b!186167) (not b!186072) b_and!11175 (not mapNonEmpty!7518) (not b!186166) (not bm!18745) (not b!186106) (not d!55027) (not d!55025) (not bm!18744) (not d!55017) (not b!186158) (not b_lambda!7243) (not bm!18765))
(check-sat b_and!11175 (not b_next!4591))
(get-model)

(declare-fun d!55037 () Bool)

(assert (=> d!55037 (= (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186158 d!55037))

(declare-fun d!55039 () Bool)

(declare-fun res!88055 () Bool)

(declare-fun e!122551 () Bool)

(assert (=> d!55039 (=> res!88055 e!122551)))

(assert (=> d!55039 (= res!88055 (and ((_ is Cons!2356) (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (= (_1!1725 (h!2989 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)))))

(assert (=> d!55039 (= (containsKey!227 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828) e!122551)))

(declare-fun b!186211 () Bool)

(declare-fun e!122552 () Bool)

(assert (=> b!186211 (= e!122551 e!122552)))

(declare-fun res!88056 () Bool)

(assert (=> b!186211 (=> (not res!88056) (not e!122552))))

(assert (=> b!186211 (= res!88056 (and (or (not ((_ is Cons!2356) (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) (bvsle (_1!1725 (h!2989 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)) ((_ is Cons!2356) (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (bvslt (_1!1725 (h!2989 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)))))

(declare-fun b!186212 () Bool)

(assert (=> b!186212 (= e!122552 (containsKey!227 (t!7237 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) key!828))))

(assert (= (and d!55039 (not res!88055)) b!186211))

(assert (= (and b!186211 res!88056) b!186212))

(declare-fun m!212713 () Bool)

(assert (=> b!186212 m!212713))

(assert (=> d!55025 d!55039))

(declare-fun b!186237 () Bool)

(declare-fun e!122571 () Bool)

(declare-fun lt!91993 () ListLongMap!2337)

(declare-fun isEmpty!475 (ListLongMap!2337) Bool)

(assert (=> b!186237 (= e!122571 (isEmpty!475 lt!91993))))

(declare-fun b!186238 () Bool)

(declare-fun e!122572 () ListLongMap!2337)

(assert (=> b!186238 (= e!122572 (ListLongMap!2338 Nil!2357))))

(declare-fun b!186239 () Bool)

(declare-fun e!122569 () ListLongMap!2337)

(declare-fun call!18772 () ListLongMap!2337)

(assert (=> b!186239 (= e!122569 call!18772)))

(declare-fun b!186240 () Bool)

(declare-fun e!122567 () Bool)

(declare-fun e!122573 () Bool)

(assert (=> b!186240 (= e!122567 e!122573)))

(declare-fun c!33396 () Bool)

(declare-fun e!122568 () Bool)

(assert (=> b!186240 (= c!33396 e!122568)))

(declare-fun res!88066 () Bool)

(assert (=> b!186240 (=> (not res!88066) (not e!122568))))

(assert (=> b!186240 (= res!88066 (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186241 () Bool)

(assert (=> b!186241 (= e!122568 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186241 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!186242 () Bool)

(declare-fun lt!91991 () Unit!5578)

(declare-fun lt!91996 () Unit!5578)

(assert (=> b!186242 (= lt!91991 lt!91996)))

(declare-fun lt!91992 () V!5465)

(declare-fun lt!91997 () ListLongMap!2337)

(declare-fun lt!91995 () (_ BitVec 64))

(declare-fun lt!91994 () (_ BitVec 64))

(assert (=> b!186242 (not (contains!1286 (+!285 lt!91997 (tuple2!3429 lt!91994 lt!91992)) lt!91995))))

(declare-fun addStillNotContains!90 (ListLongMap!2337 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5578)

(assert (=> b!186242 (= lt!91996 (addStillNotContains!90 lt!91997 lt!91994 lt!91992 lt!91995))))

(assert (=> b!186242 (= lt!91995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!186242 (= lt!91992 (get!2145 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186242 (= lt!91994 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186242 (= lt!91997 call!18772)))

(assert (=> b!186242 (= e!122569 (+!285 call!18772 (tuple2!3429 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000) (get!2145 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!186243 () Bool)

(assert (=> b!186243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> b!186243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4054 (_values!3780 thiss!1248))))))

(declare-fun e!122570 () Bool)

(assert (=> b!186243 (= e!122570 (= (apply!168 lt!91993 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)) (get!2145 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!18769 () Bool)

(assert (=> bm!18769 (= call!18772 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3797 thiss!1248)))))

(declare-fun b!186245 () Bool)

(assert (=> b!186245 (= e!122572 e!122569)))

(declare-fun c!33398 () Bool)

(assert (=> b!186245 (= c!33398 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186246 () Bool)

(assert (=> b!186246 (= e!122573 e!122570)))

(assert (=> b!186246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun res!88067 () Bool)

(assert (=> b!186246 (= res!88067 (contains!1286 lt!91993 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186246 (=> (not res!88067) (not e!122570))))

(declare-fun b!186247 () Bool)

(declare-fun res!88068 () Bool)

(assert (=> b!186247 (=> (not res!88068) (not e!122567))))

(assert (=> b!186247 (= res!88068 (not (contains!1286 lt!91993 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186248 () Bool)

(assert (=> b!186248 (= e!122573 e!122571)))

(declare-fun c!33397 () Bool)

(assert (=> b!186248 (= c!33397 (bvslt #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186244 () Bool)

(assert (=> b!186244 (= e!122571 (= lt!91993 (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3797 thiss!1248))))))

(declare-fun d!55041 () Bool)

(assert (=> d!55041 e!122567))

(declare-fun res!88065 () Bool)

(assert (=> d!55041 (=> (not res!88065) (not e!122567))))

(assert (=> d!55041 (= res!88065 (not (contains!1286 lt!91993 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55041 (= lt!91993 e!122572)))

(declare-fun c!33395 () Bool)

(assert (=> d!55041 (= c!33395 (bvsge #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> d!55041 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55041 (= (getCurrentListMapNoExtraKeys!189 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)) lt!91993)))

(assert (= (and d!55041 c!33395) b!186238))

(assert (= (and d!55041 (not c!33395)) b!186245))

(assert (= (and b!186245 c!33398) b!186242))

(assert (= (and b!186245 (not c!33398)) b!186239))

(assert (= (or b!186242 b!186239) bm!18769))

(assert (= (and d!55041 res!88065) b!186247))

(assert (= (and b!186247 res!88068) b!186240))

(assert (= (and b!186240 res!88066) b!186241))

(assert (= (and b!186240 c!33396) b!186246))

(assert (= (and b!186240 (not c!33396)) b!186248))

(assert (= (and b!186246 res!88067) b!186243))

(assert (= (and b!186248 c!33397) b!186244))

(assert (= (and b!186248 (not c!33397)) b!186237))

(declare-fun b_lambda!7245 () Bool)

(assert (=> (not b_lambda!7245) (not b!186242)))

(assert (=> b!186242 t!7241))

(declare-fun b_and!11177 () Bool)

(assert (= b_and!11175 (and (=> t!7241 result!4811) b_and!11177)))

(declare-fun b_lambda!7247 () Bool)

(assert (=> (not b_lambda!7247) (not b!186243)))

(assert (=> b!186243 t!7241))

(declare-fun b_and!11179 () Bool)

(assert (= b_and!11177 (and (=> t!7241 result!4811) b_and!11179)))

(declare-fun m!212715 () Bool)

(assert (=> bm!18769 m!212715))

(assert (=> b!186246 m!212649))

(assert (=> b!186246 m!212649))

(declare-fun m!212717 () Bool)

(assert (=> b!186246 m!212717))

(assert (=> b!186243 m!212677))

(assert (=> b!186243 m!212675))

(assert (=> b!186243 m!212679))

(assert (=> b!186243 m!212677))

(assert (=> b!186243 m!212649))

(declare-fun m!212719 () Bool)

(assert (=> b!186243 m!212719))

(assert (=> b!186243 m!212675))

(assert (=> b!186243 m!212649))

(declare-fun m!212721 () Bool)

(assert (=> b!186237 m!212721))

(declare-fun m!212723 () Bool)

(assert (=> d!55041 m!212723))

(assert (=> d!55041 m!212545))

(assert (=> b!186241 m!212649))

(assert (=> b!186241 m!212649))

(assert (=> b!186241 m!212683))

(assert (=> b!186244 m!212715))

(declare-fun m!212725 () Bool)

(assert (=> b!186247 m!212725))

(assert (=> b!186245 m!212649))

(assert (=> b!186245 m!212649))

(assert (=> b!186245 m!212683))

(declare-fun m!212727 () Bool)

(assert (=> b!186242 m!212727))

(declare-fun m!212729 () Bool)

(assert (=> b!186242 m!212729))

(assert (=> b!186242 m!212677))

(assert (=> b!186242 m!212675))

(declare-fun m!212731 () Bool)

(assert (=> b!186242 m!212731))

(assert (=> b!186242 m!212649))

(assert (=> b!186242 m!212727))

(declare-fun m!212733 () Bool)

(assert (=> b!186242 m!212733))

(assert (=> b!186242 m!212677))

(assert (=> b!186242 m!212675))

(assert (=> b!186242 m!212679))

(assert (=> bm!18765 d!55041))

(declare-fun d!55043 () Bool)

(assert (=> d!55043 (isDefined!177 (getValueByKey!223 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-fun lt!92000 () Unit!5578)

(declare-fun choose!993 (List!2360 (_ BitVec 64)) Unit!5578)

(assert (=> d!55043 (= lt!92000 (choose!993 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(declare-fun e!122576 () Bool)

(assert (=> d!55043 e!122576))

(declare-fun res!88071 () Bool)

(assert (=> d!55043 (=> (not res!88071) (not e!122576))))

(declare-fun isStrictlySorted!344 (List!2360) Bool)

(assert (=> d!55043 (= res!88071 (isStrictlySorted!344 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))))

(assert (=> d!55043 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828) lt!92000)))

(declare-fun b!186251 () Bool)

(assert (=> b!186251 (= e!122576 (containsKey!227 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))

(assert (= (and d!55043 res!88071) b!186251))

(assert (=> d!55043 m!212627))

(assert (=> d!55043 m!212627))

(assert (=> d!55043 m!212629))

(declare-fun m!212735 () Bool)

(assert (=> d!55043 m!212735))

(declare-fun m!212737 () Bool)

(assert (=> d!55043 m!212737))

(assert (=> b!186251 m!212623))

(assert (=> b!186104 d!55043))

(declare-fun d!55045 () Bool)

(declare-fun isEmpty!476 (Option!229) Bool)

(assert (=> d!55045 (= (isDefined!177 (getValueByKey!223 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828)) (not (isEmpty!476 (getValueByKey!223 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828))))))

(declare-fun bs!7506 () Bool)

(assert (= bs!7506 d!55045))

(assert (=> bs!7506 m!212627))

(declare-fun m!212739 () Bool)

(assert (=> bs!7506 m!212739))

(assert (=> b!186104 d!55045))

(declare-fun d!55047 () Bool)

(declare-fun c!33403 () Bool)

(assert (=> d!55047 (= c!33403 (and ((_ is Cons!2356) (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (= (_1!1725 (h!2989 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828)))))

(declare-fun e!122581 () Option!229)

(assert (=> d!55047 (= (getValueByKey!223 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))) key!828) e!122581)))

(declare-fun b!186261 () Bool)

(declare-fun e!122582 () Option!229)

(assert (=> b!186261 (= e!122581 e!122582)))

(declare-fun c!33404 () Bool)

(assert (=> b!186261 (= c!33404 (and ((_ is Cons!2356) (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) (not (= (_1!1725 (h!2989 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248))))) key!828))))))

(declare-fun b!186260 () Bool)

(assert (=> b!186260 (= e!122581 (Some!228 (_2!1725 (h!2989 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))))))))

(declare-fun b!186263 () Bool)

(assert (=> b!186263 (= e!122582 None!227)))

(declare-fun b!186262 () Bool)

(assert (=> b!186262 (= e!122582 (getValueByKey!223 (t!7237 (toList!1184 (getCurrentListMap!817 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3797 thiss!1248)))) key!828))))

(assert (= (and d!55047 c!33403) b!186260))

(assert (= (and d!55047 (not c!33403)) b!186261))

(assert (= (and b!186261 c!33404) b!186262))

(assert (= (and b!186261 (not c!33404)) b!186263))

(declare-fun m!212741 () Bool)

(assert (=> b!186262 m!212741))

(assert (=> b!186104 d!55047))

(declare-fun d!55049 () Bool)

(assert (=> d!55049 (= (inRange!0 (index!4747 lt!91882) (mask!8918 thiss!1248)) (and (bvsge (index!4747 lt!91882) #b00000000000000000000000000000000) (bvslt (index!4747 lt!91882) (bvadd (mask!8918 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186072 d!55049))

(declare-fun d!55051 () Bool)

(declare-fun e!122585 () Bool)

(assert (=> d!55051 e!122585))

(declare-fun res!88077 () Bool)

(assert (=> d!55051 (=> (not res!88077) (not e!122585))))

(declare-fun lt!92010 () ListLongMap!2337)

(assert (=> d!55051 (= res!88077 (contains!1286 lt!92010 (_1!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))))))

(declare-fun lt!92011 () List!2360)

(assert (=> d!55051 (= lt!92010 (ListLongMap!2338 lt!92011))))

(declare-fun lt!92009 () Unit!5578)

(declare-fun lt!92012 () Unit!5578)

(assert (=> d!55051 (= lt!92009 lt!92012)))

(assert (=> d!55051 (= (getValueByKey!223 lt!92011 (_1!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!118 (List!2360 (_ BitVec 64) V!5465) Unit!5578)

(assert (=> d!55051 (= lt!92012 (lemmaContainsTupThenGetReturnValue!118 lt!92011 (_1!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))))))

(declare-fun insertStrictlySorted!121 (List!2360 (_ BitVec 64) V!5465) List!2360)

(assert (=> d!55051 (= lt!92011 (insertStrictlySorted!121 (toList!1184 lt!91957) (_1!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))))))

(assert (=> d!55051 (= (+!285 lt!91957 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))) lt!92010)))

(declare-fun b!186268 () Bool)

(declare-fun res!88076 () Bool)

(assert (=> b!186268 (=> (not res!88076) (not e!122585))))

(assert (=> b!186268 (= res!88076 (= (getValueByKey!223 (toList!1184 lt!92010) (_1!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))))))))

(declare-fun b!186269 () Bool)

(declare-fun contains!1289 (List!2360 tuple2!3428) Bool)

(assert (=> b!186269 (= e!122585 (contains!1289 (toList!1184 lt!92010) (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))))))

(assert (= (and d!55051 res!88077) b!186268))

(assert (= (and b!186268 res!88076) b!186269))

(declare-fun m!212743 () Bool)

(assert (=> d!55051 m!212743))

(declare-fun m!212745 () Bool)

(assert (=> d!55051 m!212745))

(declare-fun m!212747 () Bool)

(assert (=> d!55051 m!212747))

(declare-fun m!212749 () Bool)

(assert (=> d!55051 m!212749))

(declare-fun m!212751 () Bool)

(assert (=> b!186268 m!212751))

(declare-fun m!212753 () Bool)

(assert (=> b!186269 m!212753))

(assert (=> b!186154 d!55051))

(assert (=> b!186154 d!55041))

(declare-fun d!55053 () Bool)

(declare-fun get!2146 (Option!229) V!5465)

(assert (=> d!55053 (= (apply!168 lt!91953 lt!91948) (get!2146 (getValueByKey!223 (toList!1184 lt!91953) lt!91948)))))

(declare-fun bs!7507 () Bool)

(assert (= bs!7507 d!55053))

(declare-fun m!212755 () Bool)

(assert (=> bs!7507 m!212755))

(assert (=> bs!7507 m!212755))

(declare-fun m!212757 () Bool)

(assert (=> bs!7507 m!212757))

(assert (=> b!186154 d!55053))

(declare-fun d!55055 () Bool)

(assert (=> d!55055 (= (apply!168 (+!285 lt!91953 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))) lt!91948) (apply!168 lt!91953 lt!91948))))

(declare-fun lt!92015 () Unit!5578)

(declare-fun choose!994 (ListLongMap!2337 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5578)

(assert (=> d!55055 (= lt!92015 (choose!994 lt!91953 lt!91947 (minValue!3638 thiss!1248) lt!91948))))

(declare-fun e!122588 () Bool)

(assert (=> d!55055 e!122588))

(declare-fun res!88080 () Bool)

(assert (=> d!55055 (=> (not res!88080) (not e!122588))))

(assert (=> d!55055 (= res!88080 (contains!1286 lt!91953 lt!91948))))

(assert (=> d!55055 (= (addApplyDifferent!144 lt!91953 lt!91947 (minValue!3638 thiss!1248) lt!91948) lt!92015)))

(declare-fun b!186273 () Bool)

(assert (=> b!186273 (= e!122588 (not (= lt!91948 lt!91947)))))

(assert (= (and d!55055 res!88080) b!186273))

(assert (=> d!55055 m!212641))

(assert (=> d!55055 m!212641))

(assert (=> d!55055 m!212665))

(declare-fun m!212759 () Bool)

(assert (=> d!55055 m!212759))

(assert (=> d!55055 m!212669))

(declare-fun m!212761 () Bool)

(assert (=> d!55055 m!212761))

(assert (=> b!186154 d!55055))

(declare-fun d!55057 () Bool)

(assert (=> d!55057 (= (apply!168 (+!285 lt!91957 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))) lt!91961) (get!2146 (getValueByKey!223 (toList!1184 (+!285 lt!91957 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248)))) lt!91961)))))

(declare-fun bs!7508 () Bool)

(assert (= bs!7508 d!55057))

(declare-fun m!212763 () Bool)

(assert (=> bs!7508 m!212763))

(assert (=> bs!7508 m!212763))

(declare-fun m!212765 () Bool)

(assert (=> bs!7508 m!212765))

(assert (=> b!186154 d!55057))

(declare-fun d!55059 () Bool)

(declare-fun e!122589 () Bool)

(assert (=> d!55059 e!122589))

(declare-fun res!88082 () Bool)

(assert (=> d!55059 (=> (not res!88082) (not e!122589))))

(declare-fun lt!92017 () ListLongMap!2337)

(assert (=> d!55059 (= res!88082 (contains!1286 lt!92017 (_1!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))))))

(declare-fun lt!92018 () List!2360)

(assert (=> d!55059 (= lt!92017 (ListLongMap!2338 lt!92018))))

(declare-fun lt!92016 () Unit!5578)

(declare-fun lt!92019 () Unit!5578)

(assert (=> d!55059 (= lt!92016 lt!92019)))

(assert (=> d!55059 (= (getValueByKey!223 lt!92018 (_1!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55059 (= lt!92019 (lemmaContainsTupThenGetReturnValue!118 lt!92018 (_1!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55059 (= lt!92018 (insertStrictlySorted!121 (toList!1184 lt!91960) (_1!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55059 (= (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))) lt!92017)))

(declare-fun b!186274 () Bool)

(declare-fun res!88081 () Bool)

(assert (=> b!186274 (=> (not res!88081) (not e!122589))))

(assert (=> b!186274 (= res!88081 (= (getValueByKey!223 (toList!1184 lt!92017) (_1!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))))))))

(declare-fun b!186275 () Bool)

(assert (=> b!186275 (= e!122589 (contains!1289 (toList!1184 lt!92017) (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))))))

(assert (= (and d!55059 res!88082) b!186274))

(assert (= (and b!186274 res!88081) b!186275))

(declare-fun m!212767 () Bool)

(assert (=> d!55059 m!212767))

(declare-fun m!212769 () Bool)

(assert (=> d!55059 m!212769))

(declare-fun m!212771 () Bool)

(assert (=> d!55059 m!212771))

(declare-fun m!212773 () Bool)

(assert (=> d!55059 m!212773))

(declare-fun m!212775 () Bool)

(assert (=> b!186274 m!212775))

(declare-fun m!212777 () Bool)

(assert (=> b!186275 m!212777))

(assert (=> b!186154 d!55059))

(declare-fun d!55061 () Bool)

(assert (=> d!55061 (= (apply!168 (+!285 lt!91953 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))) lt!91948) (get!2146 (getValueByKey!223 (toList!1184 (+!285 lt!91953 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))) lt!91948)))))

(declare-fun bs!7509 () Bool)

(assert (= bs!7509 d!55061))

(declare-fun m!212779 () Bool)

(assert (=> bs!7509 m!212779))

(assert (=> bs!7509 m!212779))

(declare-fun m!212781 () Bool)

(assert (=> bs!7509 m!212781))

(assert (=> b!186154 d!55061))

(declare-fun d!55063 () Bool)

(assert (=> d!55063 (= (apply!168 (+!285 lt!91949 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))) lt!91946) (apply!168 lt!91949 lt!91946))))

(declare-fun lt!92020 () Unit!5578)

(assert (=> d!55063 (= lt!92020 (choose!994 lt!91949 lt!91964 (zeroValue!3638 thiss!1248) lt!91946))))

(declare-fun e!122590 () Bool)

(assert (=> d!55063 e!122590))

(declare-fun res!88083 () Bool)

(assert (=> d!55063 (=> (not res!88083) (not e!122590))))

(assert (=> d!55063 (= res!88083 (contains!1286 lt!91949 lt!91946))))

(assert (=> d!55063 (= (addApplyDifferent!144 lt!91949 lt!91964 (zeroValue!3638 thiss!1248) lt!91946) lt!92020)))

(declare-fun b!186276 () Bool)

(assert (=> b!186276 (= e!122590 (not (= lt!91946 lt!91964)))))

(assert (= (and d!55063 res!88083) b!186276))

(assert (=> d!55063 m!212657))

(assert (=> d!55063 m!212657))

(assert (=> d!55063 m!212659))

(declare-fun m!212783 () Bool)

(assert (=> d!55063 m!212783))

(assert (=> d!55063 m!212655))

(declare-fun m!212785 () Bool)

(assert (=> d!55063 m!212785))

(assert (=> b!186154 d!55063))

(declare-fun d!55065 () Bool)

(assert (=> d!55065 (= (apply!168 (+!285 lt!91949 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))) lt!91946) (get!2146 (getValueByKey!223 (toList!1184 (+!285 lt!91949 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))) lt!91946)))))

(declare-fun bs!7510 () Bool)

(assert (= bs!7510 d!55065))

(declare-fun m!212787 () Bool)

(assert (=> bs!7510 m!212787))

(assert (=> bs!7510 m!212787))

(declare-fun m!212789 () Bool)

(assert (=> bs!7510 m!212789))

(assert (=> b!186154 d!55065))

(declare-fun d!55067 () Bool)

(assert (=> d!55067 (contains!1286 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))) lt!91950)))

(declare-fun lt!92023 () Unit!5578)

(declare-fun choose!995 (ListLongMap!2337 (_ BitVec 64) V!5465 (_ BitVec 64)) Unit!5578)

(assert (=> d!55067 (= lt!92023 (choose!995 lt!91960 lt!91955 (zeroValue!3638 thiss!1248) lt!91950))))

(assert (=> d!55067 (contains!1286 lt!91960 lt!91950)))

(assert (=> d!55067 (= (addStillContains!144 lt!91960 lt!91955 (zeroValue!3638 thiss!1248) lt!91950) lt!92023)))

(declare-fun bs!7511 () Bool)

(assert (= bs!7511 d!55067))

(assert (=> bs!7511 m!212645))

(assert (=> bs!7511 m!212645))

(assert (=> bs!7511 m!212647))

(declare-fun m!212791 () Bool)

(assert (=> bs!7511 m!212791))

(declare-fun m!212793 () Bool)

(assert (=> bs!7511 m!212793))

(assert (=> b!186154 d!55067))

(declare-fun d!55069 () Bool)

(assert (=> d!55069 (= (apply!168 lt!91957 lt!91961) (get!2146 (getValueByKey!223 (toList!1184 lt!91957) lt!91961)))))

(declare-fun bs!7512 () Bool)

(assert (= bs!7512 d!55069))

(declare-fun m!212795 () Bool)

(assert (=> bs!7512 m!212795))

(assert (=> bs!7512 m!212795))

(declare-fun m!212797 () Bool)

(assert (=> bs!7512 m!212797))

(assert (=> b!186154 d!55069))

(declare-fun d!55071 () Bool)

(declare-fun e!122591 () Bool)

(assert (=> d!55071 e!122591))

(declare-fun res!88085 () Bool)

(assert (=> d!55071 (=> (not res!88085) (not e!122591))))

(declare-fun lt!92025 () ListLongMap!2337)

(assert (=> d!55071 (= res!88085 (contains!1286 lt!92025 (_1!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))))))

(declare-fun lt!92026 () List!2360)

(assert (=> d!55071 (= lt!92025 (ListLongMap!2338 lt!92026))))

(declare-fun lt!92024 () Unit!5578)

(declare-fun lt!92027 () Unit!5578)

(assert (=> d!55071 (= lt!92024 lt!92027)))

(assert (=> d!55071 (= (getValueByKey!223 lt!92026 (_1!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))))))

(assert (=> d!55071 (= lt!92027 (lemmaContainsTupThenGetReturnValue!118 lt!92026 (_1!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))))))

(assert (=> d!55071 (= lt!92026 (insertStrictlySorted!121 (toList!1184 lt!91953) (_1!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))))))

(assert (=> d!55071 (= (+!285 lt!91953 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))) lt!92025)))

(declare-fun b!186278 () Bool)

(declare-fun res!88084 () Bool)

(assert (=> b!186278 (=> (not res!88084) (not e!122591))))

(assert (=> b!186278 (= res!88084 (= (getValueByKey!223 (toList!1184 lt!92025) (_1!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))))))))

(declare-fun b!186279 () Bool)

(assert (=> b!186279 (= e!122591 (contains!1289 (toList!1184 lt!92025) (tuple2!3429 lt!91947 (minValue!3638 thiss!1248))))))

(assert (= (and d!55071 res!88085) b!186278))

(assert (= (and b!186278 res!88084) b!186279))

(declare-fun m!212799 () Bool)

(assert (=> d!55071 m!212799))

(declare-fun m!212801 () Bool)

(assert (=> d!55071 m!212801))

(declare-fun m!212803 () Bool)

(assert (=> d!55071 m!212803))

(declare-fun m!212805 () Bool)

(assert (=> d!55071 m!212805))

(declare-fun m!212807 () Bool)

(assert (=> b!186278 m!212807))

(declare-fun m!212809 () Bool)

(assert (=> b!186279 m!212809))

(assert (=> b!186154 d!55071))

(declare-fun d!55073 () Bool)

(declare-fun e!122592 () Bool)

(assert (=> d!55073 e!122592))

(declare-fun res!88087 () Bool)

(assert (=> d!55073 (=> (not res!88087) (not e!122592))))

(declare-fun lt!92029 () ListLongMap!2337)

(assert (=> d!55073 (= res!88087 (contains!1286 lt!92029 (_1!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))))))

(declare-fun lt!92030 () List!2360)

(assert (=> d!55073 (= lt!92029 (ListLongMap!2338 lt!92030))))

(declare-fun lt!92028 () Unit!5578)

(declare-fun lt!92031 () Unit!5578)

(assert (=> d!55073 (= lt!92028 lt!92031)))

(assert (=> d!55073 (= (getValueByKey!223 lt!92030 (_1!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55073 (= lt!92031 (lemmaContainsTupThenGetReturnValue!118 lt!92030 (_1!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55073 (= lt!92030 (insertStrictlySorted!121 (toList!1184 lt!91949) (_1!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))))))

(assert (=> d!55073 (= (+!285 lt!91949 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))) lt!92029)))

(declare-fun b!186280 () Bool)

(declare-fun res!88086 () Bool)

(assert (=> b!186280 (=> (not res!88086) (not e!122592))))

(assert (=> b!186280 (= res!88086 (= (getValueByKey!223 (toList!1184 lt!92029) (_1!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))))))))

(declare-fun b!186281 () Bool)

(assert (=> b!186281 (= e!122592 (contains!1289 (toList!1184 lt!92029) (tuple2!3429 lt!91964 (zeroValue!3638 thiss!1248))))))

(assert (= (and d!55073 res!88087) b!186280))

(assert (= (and b!186280 res!88086) b!186281))

(declare-fun m!212811 () Bool)

(assert (=> d!55073 m!212811))

(declare-fun m!212813 () Bool)

(assert (=> d!55073 m!212813))

(declare-fun m!212815 () Bool)

(assert (=> d!55073 m!212815))

(declare-fun m!212817 () Bool)

(assert (=> d!55073 m!212817))

(declare-fun m!212819 () Bool)

(assert (=> b!186280 m!212819))

(declare-fun m!212821 () Bool)

(assert (=> b!186281 m!212821))

(assert (=> b!186154 d!55073))

(declare-fun d!55075 () Bool)

(assert (=> d!55075 (= (apply!168 lt!91949 lt!91946) (get!2146 (getValueByKey!223 (toList!1184 lt!91949) lt!91946)))))

(declare-fun bs!7513 () Bool)

(assert (= bs!7513 d!55075))

(declare-fun m!212823 () Bool)

(assert (=> bs!7513 m!212823))

(assert (=> bs!7513 m!212823))

(declare-fun m!212825 () Bool)

(assert (=> bs!7513 m!212825))

(assert (=> b!186154 d!55075))

(declare-fun d!55077 () Bool)

(declare-fun e!122594 () Bool)

(assert (=> d!55077 e!122594))

(declare-fun res!88088 () Bool)

(assert (=> d!55077 (=> res!88088 e!122594)))

(declare-fun lt!92032 () Bool)

(assert (=> d!55077 (= res!88088 (not lt!92032))))

(declare-fun lt!92034 () Bool)

(assert (=> d!55077 (= lt!92032 lt!92034)))

(declare-fun lt!92035 () Unit!5578)

(declare-fun e!122593 () Unit!5578)

(assert (=> d!55077 (= lt!92035 e!122593)))

(declare-fun c!33405 () Bool)

(assert (=> d!55077 (= c!33405 lt!92034)))

(assert (=> d!55077 (= lt!92034 (containsKey!227 (toList!1184 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))) lt!91950))))

(assert (=> d!55077 (= (contains!1286 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248))) lt!91950) lt!92032)))

(declare-fun b!186282 () Bool)

(declare-fun lt!92033 () Unit!5578)

(assert (=> b!186282 (= e!122593 lt!92033)))

(assert (=> b!186282 (= lt!92033 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1184 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))) lt!91950))))

(assert (=> b!186282 (isDefined!177 (getValueByKey!223 (toList!1184 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))) lt!91950))))

(declare-fun b!186283 () Bool)

(declare-fun Unit!5589 () Unit!5578)

(assert (=> b!186283 (= e!122593 Unit!5589)))

(declare-fun b!186284 () Bool)

(assert (=> b!186284 (= e!122594 (isDefined!177 (getValueByKey!223 (toList!1184 (+!285 lt!91960 (tuple2!3429 lt!91955 (zeroValue!3638 thiss!1248)))) lt!91950)))))

(assert (= (and d!55077 c!33405) b!186282))

(assert (= (and d!55077 (not c!33405)) b!186283))

(assert (= (and d!55077 (not res!88088)) b!186284))

(declare-fun m!212827 () Bool)

(assert (=> d!55077 m!212827))

(declare-fun m!212829 () Bool)

(assert (=> b!186282 m!212829))

(declare-fun m!212831 () Bool)

(assert (=> b!186282 m!212831))

(assert (=> b!186282 m!212831))

(declare-fun m!212833 () Bool)

(assert (=> b!186282 m!212833))

(assert (=> b!186284 m!212831))

(assert (=> b!186284 m!212831))

(assert (=> b!186284 m!212833))

(assert (=> b!186154 d!55077))

(declare-fun d!55079 () Bool)

(assert (=> d!55079 (= (apply!168 (+!285 lt!91957 (tuple2!3429 lt!91958 (minValue!3638 thiss!1248))) lt!91961) (apply!168 lt!91957 lt!91961))))

(declare-fun lt!92036 () Unit!5578)

(assert (=> d!55079 (= lt!92036 (choose!994 lt!91957 lt!91958 (minValue!3638 thiss!1248) lt!91961))))

(declare-fun e!122595 () Bool)

(assert (=> d!55079 e!122595))

(declare-fun res!88089 () Bool)

(assert (=> d!55079 (=> (not res!88089) (not e!122595))))

(assert (=> d!55079 (= res!88089 (contains!1286 lt!91957 lt!91961))))

(assert (=> d!55079 (= (addApplyDifferent!144 lt!91957 lt!91958 (minValue!3638 thiss!1248) lt!91961) lt!92036)))

(declare-fun b!186285 () Bool)

(assert (=> b!186285 (= e!122595 (not (= lt!91961 lt!91958)))))

(assert (= (and d!55079 res!88089) b!186285))

(assert (=> d!55079 m!212661))

(assert (=> d!55079 m!212661))

(assert (=> d!55079 m!212663))

(declare-fun m!212835 () Bool)

(assert (=> d!55079 m!212835))

(assert (=> d!55079 m!212667))

(declare-fun m!212837 () Bool)

(assert (=> d!55079 m!212837))

(assert (=> b!186154 d!55079))

(declare-fun d!55081 () Bool)

(declare-fun e!122597 () Bool)

(assert (=> d!55081 e!122597))

(declare-fun res!88090 () Bool)

(assert (=> d!55081 (=> res!88090 e!122597)))

(declare-fun lt!92037 () Bool)

(assert (=> d!55081 (= res!88090 (not lt!92037))))

(declare-fun lt!92039 () Bool)

(assert (=> d!55081 (= lt!92037 lt!92039)))

(declare-fun lt!92040 () Unit!5578)

(declare-fun e!122596 () Unit!5578)

(assert (=> d!55081 (= lt!92040 e!122596)))

(declare-fun c!33406 () Bool)

(assert (=> d!55081 (= c!33406 lt!92039)))

(assert (=> d!55081 (= lt!92039 (containsKey!227 (toList!1184 lt!91962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55081 (= (contains!1286 lt!91962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92037)))

(declare-fun b!186286 () Bool)

(declare-fun lt!92038 () Unit!5578)

(assert (=> b!186286 (= e!122596 lt!92038)))

(assert (=> b!186286 (= lt!92038 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1184 lt!91962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186286 (isDefined!177 (getValueByKey!223 (toList!1184 lt!91962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186287 () Bool)

(declare-fun Unit!5590 () Unit!5578)

(assert (=> b!186287 (= e!122596 Unit!5590)))

(declare-fun b!186288 () Bool)

(assert (=> b!186288 (= e!122597 (isDefined!177 (getValueByKey!223 (toList!1184 lt!91962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55081 c!33406) b!186286))

(assert (= (and d!55081 (not c!33406)) b!186287))

(assert (= (and d!55081 (not res!88090)) b!186288))

(declare-fun m!212839 () Bool)

(assert (=> d!55081 m!212839))

(declare-fun m!212841 () Bool)

(assert (=> b!186286 m!212841))

(declare-fun m!212843 () Bool)

(assert (=> b!186286 m!212843))

(assert (=> b!186286 m!212843))

(declare-fun m!212845 () Bool)

(assert (=> b!186286 m!212845))

(assert (=> b!186288 m!212843))

(assert (=> b!186288 m!212843))

(assert (=> b!186288 m!212845))

(assert (=> bm!18762 d!55081))

(assert (=> b!186106 d!55045))

(assert (=> b!186106 d!55047))

(declare-fun d!55083 () Bool)

(assert (=> d!55083 (= (inRange!0 (ite c!33356 (index!4746 lt!91888) (index!4749 lt!91888)) (mask!8918 thiss!1248)) (and (bvsge (ite c!33356 (index!4746 lt!91888) (index!4749 lt!91888)) #b00000000000000000000000000000000) (bvslt (ite c!33356 (index!4746 lt!91888) (index!4749 lt!91888)) (bvadd (mask!8918 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18744 d!55083))

(assert (=> b!186149 d!55037))

(assert (=> d!55021 d!55029))

(declare-fun b!186305 () Bool)

(declare-fun res!88101 () Bool)

(declare-fun e!122608 () Bool)

(assert (=> b!186305 (=> (not res!88101) (not e!122608))))

(declare-fun lt!92043 () SeekEntryResult!644)

(assert (=> b!186305 (= res!88101 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4749 lt!92043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186306 () Bool)

(declare-fun e!122607 () Bool)

(assert (=> b!186306 (= e!122607 ((_ is Undefined!644) lt!92043))))

(declare-fun b!186307 () Bool)

(declare-fun e!122609 () Bool)

(declare-fun e!122606 () Bool)

(assert (=> b!186307 (= e!122609 e!122606)))

(declare-fun res!88099 () Bool)

(declare-fun call!18778 () Bool)

(assert (=> b!186307 (= res!88099 call!18778)))

(assert (=> b!186307 (=> (not res!88099) (not e!122606))))

(declare-fun bm!18775 () Bool)

(declare-fun call!18777 () Bool)

(assert (=> bm!18775 (= call!18777 (arrayContainsKey!0 (_keys!5738 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186308 () Bool)

(assert (=> b!186308 (= e!122609 e!122607)))

(declare-fun c!33412 () Bool)

(assert (=> b!186308 (= c!33412 ((_ is MissingVacant!644) lt!92043))))

(declare-fun b!186309 () Bool)

(assert (=> b!186309 (= e!122608 (not call!18777))))

(declare-fun b!186310 () Bool)

(declare-fun res!88100 () Bool)

(assert (=> b!186310 (=> (not res!88100) (not e!122608))))

(assert (=> b!186310 (= res!88100 call!18778)))

(assert (=> b!186310 (= e!122607 e!122608)))

(declare-fun b!186311 () Bool)

(declare-fun res!88102 () Bool)

(assert (=> b!186311 (= res!88102 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4746 lt!92043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186311 (=> (not res!88102) (not e!122606))))

(declare-fun b!186312 () Bool)

(assert (=> b!186312 (= e!122606 (not call!18777))))

(declare-fun d!55085 () Bool)

(assert (=> d!55085 e!122609))

(declare-fun c!33411 () Bool)

(assert (=> d!55085 (= c!33411 ((_ is MissingZero!644) lt!92043))))

(assert (=> d!55085 (= lt!92043 (seekEntryOrOpen!0 key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(assert (=> d!55085 true))

(declare-fun _$34!1063 () Unit!5578)

(assert (=> d!55085 (= (choose!992 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) _$34!1063)))

(declare-fun bm!18774 () Bool)

(assert (=> bm!18774 (= call!18778 (inRange!0 (ite c!33411 (index!4746 lt!92043) (index!4749 lt!92043)) (mask!8918 thiss!1248)))))

(assert (= (and d!55085 c!33411) b!186307))

(assert (= (and d!55085 (not c!33411)) b!186308))

(assert (= (and b!186307 res!88099) b!186311))

(assert (= (and b!186311 res!88102) b!186312))

(assert (= (and b!186308 c!33412) b!186310))

(assert (= (and b!186308 (not c!33412)) b!186306))

(assert (= (and b!186310 res!88100) b!186305))

(assert (= (and b!186305 res!88101) b!186309))

(assert (= (or b!186307 b!186310) bm!18774))

(assert (= (or b!186312 b!186309) bm!18775))

(assert (=> d!55085 m!212535))

(declare-fun m!212847 () Bool)

(assert (=> b!186311 m!212847))

(declare-fun m!212849 () Bool)

(assert (=> bm!18774 m!212849))

(assert (=> bm!18775 m!212619))

(declare-fun m!212851 () Bool)

(assert (=> b!186305 m!212851))

(assert (=> d!55021 d!55085))

(assert (=> d!55021 d!55023))

(declare-fun d!55087 () Bool)

(assert (=> d!55087 (= (apply!168 lt!91962 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)) (get!2146 (getValueByKey!223 (toList!1184 lt!91962) (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7514 () Bool)

(assert (= bs!7514 d!55087))

(assert (=> bs!7514 m!212649))

(declare-fun m!212853 () Bool)

(assert (=> bs!7514 m!212853))

(assert (=> bs!7514 m!212853))

(declare-fun m!212855 () Bool)

(assert (=> bs!7514 m!212855))

(assert (=> b!186164 d!55087))

(declare-fun d!55089 () Bool)

(declare-fun c!33415 () Bool)

(assert (=> d!55089 (= c!33415 ((_ is ValueCellFull!1838) (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!122612 () V!5465)

(assert (=> d!55089 (= (get!2145 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!122612)))

(declare-fun b!186317 () Bool)

(declare-fun get!2147 (ValueCell!1838 V!5465) V!5465)

(assert (=> b!186317 (= e!122612 (get!2147 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186318 () Bool)

(declare-fun get!2148 (ValueCell!1838 V!5465) V!5465)

(assert (=> b!186318 (= e!122612 (get!2148 (select (arr!3737 (_values!3780 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!502 (defaultEntry!3797 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55089 c!33415) b!186317))

(assert (= (and d!55089 (not c!33415)) b!186318))

(assert (=> b!186317 m!212677))

(assert (=> b!186317 m!212675))

(declare-fun m!212857 () Bool)

(assert (=> b!186317 m!212857))

(assert (=> b!186318 m!212677))

(assert (=> b!186318 m!212675))

(declare-fun m!212859 () Bool)

(assert (=> b!186318 m!212859))

(assert (=> b!186164 d!55089))

(declare-fun b!186327 () Bool)

(declare-fun res!88114 () Bool)

(declare-fun e!122615 () Bool)

(assert (=> b!186327 (=> (not res!88114) (not e!122615))))

(assert (=> b!186327 (= res!88114 (and (= (size!4054 (_values!3780 thiss!1248)) (bvadd (mask!8918 thiss!1248) #b00000000000000000000000000000001)) (= (size!4053 (_keys!5738 thiss!1248)) (size!4054 (_values!3780 thiss!1248))) (bvsge (_size!1341 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1341 thiss!1248) (bvadd (mask!8918 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!186330 () Bool)

(assert (=> b!186330 (= e!122615 (and (bvsge (extraKeys!3534 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3534 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1341 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!186329 () Bool)

(declare-fun res!88112 () Bool)

(assert (=> b!186329 (=> (not res!88112) (not e!122615))))

(declare-fun size!4059 (LongMapFixedSize!2584) (_ BitVec 32))

(assert (=> b!186329 (= res!88112 (= (size!4059 thiss!1248) (bvadd (_size!1341 thiss!1248) (bvsdiv (bvadd (extraKeys!3534 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!186328 () Bool)

(declare-fun res!88113 () Bool)

(assert (=> b!186328 (=> (not res!88113) (not e!122615))))

(assert (=> b!186328 (= res!88113 (bvsge (size!4059 thiss!1248) (_size!1341 thiss!1248)))))

(declare-fun d!55091 () Bool)

(declare-fun res!88111 () Bool)

(assert (=> d!55091 (=> (not res!88111) (not e!122615))))

(assert (=> d!55091 (= res!88111 (validMask!0 (mask!8918 thiss!1248)))))

(assert (=> d!55091 (= (simpleValid!184 thiss!1248) e!122615)))

(assert (= (and d!55091 res!88111) b!186327))

(assert (= (and b!186327 res!88114) b!186328))

(assert (= (and b!186328 res!88113) b!186329))

(assert (= (and b!186329 res!88112) b!186330))

(declare-fun m!212861 () Bool)

(assert (=> b!186329 m!212861))

(assert (=> b!186328 m!212861))

(assert (=> d!55091 m!212545))

(assert (=> d!55031 d!55091))

(declare-fun d!55093 () Bool)

(assert (=> d!55093 (= (apply!168 lt!91962 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2146 (getValueByKey!223 (toList!1184 lt!91962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7515 () Bool)

(assert (= bs!7515 d!55093))

(assert (=> bs!7515 m!212843))

(assert (=> bs!7515 m!212843))

(declare-fun m!212863 () Bool)

(assert (=> bs!7515 m!212863))

(assert (=> b!186150 d!55093))

(declare-fun d!55095 () Bool)

(declare-fun e!122616 () Bool)

(assert (=> d!55095 e!122616))

(declare-fun res!88116 () Bool)

(assert (=> d!55095 (=> (not res!88116) (not e!122616))))

(declare-fun lt!92045 () ListLongMap!2337)

(assert (=> d!55095 (= res!88116 (contains!1286 lt!92045 (_1!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(declare-fun lt!92046 () List!2360)

(assert (=> d!55095 (= lt!92045 (ListLongMap!2338 lt!92046))))

(declare-fun lt!92044 () Unit!5578)

(declare-fun lt!92047 () Unit!5578)

(assert (=> d!55095 (= lt!92044 lt!92047)))

(assert (=> d!55095 (= (getValueByKey!223 lt!92046 (_1!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(assert (=> d!55095 (= lt!92047 (lemmaContainsTupThenGetReturnValue!118 lt!92046 (_1!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(assert (=> d!55095 (= lt!92046 (insertStrictlySorted!121 (toList!1184 call!18769) (_1!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))) (_2!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(assert (=> d!55095 (= (+!285 call!18769 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))) lt!92045)))

(declare-fun b!186331 () Bool)

(declare-fun res!88115 () Bool)

(assert (=> b!186331 (=> (not res!88115) (not e!122616))))

(assert (=> b!186331 (= res!88115 (= (getValueByKey!223 (toList!1184 lt!92045) (_1!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (Some!228 (_2!1725 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(declare-fun b!186332 () Bool)

(assert (=> b!186332 (= e!122616 (contains!1289 (toList!1184 lt!92045) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))

(assert (= (and d!55095 res!88116) b!186331))

(assert (= (and b!186331 res!88115) b!186332))

(declare-fun m!212865 () Bool)

(assert (=> d!55095 m!212865))

(declare-fun m!212867 () Bool)

(assert (=> d!55095 m!212867))

(declare-fun m!212869 () Bool)

(assert (=> d!55095 m!212869))

(declare-fun m!212871 () Bool)

(assert (=> d!55095 m!212871))

(declare-fun m!212873 () Bool)

(assert (=> b!186331 m!212873))

(declare-fun m!212875 () Bool)

(assert (=> b!186332 m!212875))

(assert (=> b!186166 d!55095))

(declare-fun b!186341 () Bool)

(declare-fun e!122622 () (_ BitVec 32))

(declare-fun call!18781 () (_ BitVec 32))

(assert (=> b!186341 (= e!122622 (bvadd #b00000000000000000000000000000001 call!18781))))

(declare-fun d!55097 () Bool)

(declare-fun lt!92050 () (_ BitVec 32))

(assert (=> d!55097 (and (bvsge lt!92050 #b00000000000000000000000000000000) (bvsle lt!92050 (bvsub (size!4053 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!122621 () (_ BitVec 32))

(assert (=> d!55097 (= lt!92050 e!122621)))

(declare-fun c!33420 () Bool)

(assert (=> d!55097 (= c!33420 (bvsge #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> d!55097 (and (bvsle #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4053 (_keys!5738 thiss!1248)) (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> d!55097 (= (arrayCountValidKeys!0 (_keys!5738 thiss!1248) #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))) lt!92050)))

(declare-fun b!186342 () Bool)

(assert (=> b!186342 (= e!122621 e!122622)))

(declare-fun c!33421 () Bool)

(assert (=> b!186342 (= c!33421 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186343 () Bool)

(assert (=> b!186343 (= e!122622 call!18781)))

(declare-fun bm!18778 () Bool)

(assert (=> bm!18778 (= call!18781 (arrayCountValidKeys!0 (_keys!5738 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186344 () Bool)

(assert (=> b!186344 (= e!122621 #b00000000000000000000000000000000)))

(assert (= (and d!55097 c!33420) b!186344))

(assert (= (and d!55097 (not c!33420)) b!186342))

(assert (= (and b!186342 c!33421) b!186341))

(assert (= (and b!186342 (not c!33421)) b!186343))

(assert (= (or b!186341 b!186343) bm!18778))

(assert (=> b!186342 m!212649))

(assert (=> b!186342 m!212649))

(assert (=> b!186342 m!212683))

(declare-fun m!212877 () Bool)

(assert (=> bm!18778 m!212877))

(assert (=> b!186196 d!55097))

(declare-fun b!186357 () Bool)

(declare-fun e!122629 () SeekEntryResult!644)

(assert (=> b!186357 (= e!122629 Undefined!644)))

(declare-fun b!186358 () Bool)

(declare-fun e!122630 () SeekEntryResult!644)

(assert (=> b!186358 (= e!122630 (MissingVacant!644 (index!4748 lt!91975)))))

(declare-fun d!55099 () Bool)

(declare-fun lt!92055 () SeekEntryResult!644)

(assert (=> d!55099 (and (or ((_ is Undefined!644) lt!92055) (not ((_ is Found!644) lt!92055)) (and (bvsge (index!4747 lt!92055) #b00000000000000000000000000000000) (bvslt (index!4747 lt!92055) (size!4053 (_keys!5738 thiss!1248))))) (or ((_ is Undefined!644) lt!92055) ((_ is Found!644) lt!92055) (not ((_ is MissingVacant!644) lt!92055)) (not (= (index!4749 lt!92055) (index!4748 lt!91975))) (and (bvsge (index!4749 lt!92055) #b00000000000000000000000000000000) (bvslt (index!4749 lt!92055) (size!4053 (_keys!5738 thiss!1248))))) (or ((_ is Undefined!644) lt!92055) (ite ((_ is Found!644) lt!92055) (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4747 lt!92055)) key!828) (and ((_ is MissingVacant!644) lt!92055) (= (index!4749 lt!92055) (index!4748 lt!91975)) (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4749 lt!92055)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55099 (= lt!92055 e!122629)))

(declare-fun c!33430 () Bool)

(assert (=> d!55099 (= c!33430 (bvsge (x!20207 lt!91975) #b01111111111111111111111111111110))))

(declare-fun lt!92056 () (_ BitVec 64))

(assert (=> d!55099 (= lt!92056 (select (arr!3736 (_keys!5738 thiss!1248)) (index!4748 lt!91975)))))

(assert (=> d!55099 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55099 (= (seekKeyOrZeroReturnVacant!0 (x!20207 lt!91975) (index!4748 lt!91975) (index!4748 lt!91975) key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)) lt!92055)))

(declare-fun b!186359 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186359 (= e!122630 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20207 lt!91975) #b00000000000000000000000000000001) (nextIndex!0 (index!4748 lt!91975) (x!20207 lt!91975) (mask!8918 thiss!1248)) (index!4748 lt!91975) key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun b!186360 () Bool)

(declare-fun e!122631 () SeekEntryResult!644)

(assert (=> b!186360 (= e!122631 (Found!644 (index!4748 lt!91975)))))

(declare-fun b!186361 () Bool)

(assert (=> b!186361 (= e!122629 e!122631)))

(declare-fun c!33429 () Bool)

(assert (=> b!186361 (= c!33429 (= lt!92056 key!828))))

(declare-fun b!186362 () Bool)

(declare-fun c!33428 () Bool)

(assert (=> b!186362 (= c!33428 (= lt!92056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186362 (= e!122631 e!122630)))

(assert (= (and d!55099 c!33430) b!186357))

(assert (= (and d!55099 (not c!33430)) b!186361))

(assert (= (and b!186361 c!33429) b!186360))

(assert (= (and b!186361 (not c!33429)) b!186362))

(assert (= (and b!186362 c!33428) b!186358))

(assert (= (and b!186362 (not c!33428)) b!186359))

(declare-fun m!212879 () Bool)

(assert (=> d!55099 m!212879))

(declare-fun m!212881 () Bool)

(assert (=> d!55099 m!212881))

(assert (=> d!55099 m!212691))

(assert (=> d!55099 m!212545))

(declare-fun m!212883 () Bool)

(assert (=> b!186359 m!212883))

(assert (=> b!186359 m!212883))

(declare-fun m!212885 () Bool)

(assert (=> b!186359 m!212885))

(assert (=> b!186185 d!55099))

(declare-fun d!55101 () Bool)

(assert (=> d!55101 (= (apply!168 lt!91962 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2146 (getValueByKey!223 (toList!1184 lt!91962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7516 () Bool)

(assert (= bs!7516 d!55101))

(declare-fun m!212887 () Bool)

(assert (=> bs!7516 m!212887))

(assert (=> bs!7516 m!212887))

(declare-fun m!212889 () Bool)

(assert (=> bs!7516 m!212889))

(assert (=> b!186167 d!55101))

(declare-fun b!186371 () Bool)

(declare-fun e!122640 () Bool)

(declare-fun e!122638 () Bool)

(assert (=> b!186371 (= e!122640 e!122638)))

(declare-fun c!33433 () Bool)

(assert (=> b!186371 (= c!33433 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55103 () Bool)

(declare-fun res!88122 () Bool)

(assert (=> d!55103 (=> res!88122 e!122640)))

(assert (=> d!55103 (= res!88122 (bvsge #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> d!55103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)) e!122640)))

(declare-fun bm!18781 () Bool)

(declare-fun call!18784 () Bool)

(assert (=> bm!18781 (= call!18784 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun b!186372 () Bool)

(declare-fun e!122639 () Bool)

(assert (=> b!186372 (= e!122638 e!122639)))

(declare-fun lt!92065 () (_ BitVec 64))

(assert (=> b!186372 (= lt!92065 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92063 () Unit!5578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7917 (_ BitVec 64) (_ BitVec 32)) Unit!5578)

(assert (=> b!186372 (= lt!92063 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5738 thiss!1248) lt!92065 #b00000000000000000000000000000000))))

(assert (=> b!186372 (arrayContainsKey!0 (_keys!5738 thiss!1248) lt!92065 #b00000000000000000000000000000000)))

(declare-fun lt!92064 () Unit!5578)

(assert (=> b!186372 (= lt!92064 lt!92063)))

(declare-fun res!88121 () Bool)

(assert (=> b!186372 (= res!88121 (= (seekEntryOrOpen!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000) (_keys!5738 thiss!1248) (mask!8918 thiss!1248)) (Found!644 #b00000000000000000000000000000000)))))

(assert (=> b!186372 (=> (not res!88121) (not e!122639))))

(declare-fun b!186373 () Bool)

(assert (=> b!186373 (= e!122638 call!18784)))

(declare-fun b!186374 () Bool)

(assert (=> b!186374 (= e!122639 call!18784)))

(assert (= (and d!55103 (not res!88122)) b!186371))

(assert (= (and b!186371 c!33433) b!186372))

(assert (= (and b!186371 (not c!33433)) b!186373))

(assert (= (and b!186372 res!88121) b!186374))

(assert (= (or b!186374 b!186373) bm!18781))

(assert (=> b!186371 m!212649))

(assert (=> b!186371 m!212649))

(assert (=> b!186371 m!212683))

(declare-fun m!212891 () Bool)

(assert (=> bm!18781 m!212891))

(assert (=> b!186372 m!212649))

(declare-fun m!212893 () Bool)

(assert (=> b!186372 m!212893))

(declare-fun m!212895 () Bool)

(assert (=> b!186372 m!212895))

(assert (=> b!186372 m!212649))

(declare-fun m!212897 () Bool)

(assert (=> b!186372 m!212897))

(assert (=> b!186197 d!55103))

(declare-fun d!55105 () Bool)

(declare-fun e!122642 () Bool)

(assert (=> d!55105 e!122642))

(declare-fun res!88123 () Bool)

(assert (=> d!55105 (=> res!88123 e!122642)))

(declare-fun lt!92066 () Bool)

(assert (=> d!55105 (= res!88123 (not lt!92066))))

(declare-fun lt!92068 () Bool)

(assert (=> d!55105 (= lt!92066 lt!92068)))

(declare-fun lt!92069 () Unit!5578)

(declare-fun e!122641 () Unit!5578)

(assert (=> d!55105 (= lt!92069 e!122641)))

(declare-fun c!33434 () Bool)

(assert (=> d!55105 (= c!33434 lt!92068)))

(assert (=> d!55105 (= lt!92068 (containsKey!227 (toList!1184 lt!91962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55105 (= (contains!1286 lt!91962 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92066)))

(declare-fun b!186375 () Bool)

(declare-fun lt!92067 () Unit!5578)

(assert (=> b!186375 (= e!122641 lt!92067)))

(assert (=> b!186375 (= lt!92067 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1184 lt!91962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186375 (isDefined!177 (getValueByKey!223 (toList!1184 lt!91962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186376 () Bool)

(declare-fun Unit!5591 () Unit!5578)

(assert (=> b!186376 (= e!122641 Unit!5591)))

(declare-fun b!186377 () Bool)

(assert (=> b!186377 (= e!122642 (isDefined!177 (getValueByKey!223 (toList!1184 lt!91962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55105 c!33434) b!186375))

(assert (= (and d!55105 (not c!33434)) b!186376))

(assert (= (and d!55105 (not res!88123)) b!186377))

(declare-fun m!212899 () Bool)

(assert (=> d!55105 m!212899))

(declare-fun m!212901 () Bool)

(assert (=> b!186375 m!212901))

(assert (=> b!186375 m!212887))

(assert (=> b!186375 m!212887))

(declare-fun m!212903 () Bool)

(assert (=> b!186375 m!212903))

(assert (=> b!186377 m!212887))

(assert (=> b!186377 m!212887))

(assert (=> b!186377 m!212903))

(assert (=> bm!18761 d!55105))

(declare-fun b!186388 () Bool)

(declare-fun e!122654 () Bool)

(declare-fun call!18787 () Bool)

(assert (=> b!186388 (= e!122654 call!18787)))

(declare-fun b!186389 () Bool)

(declare-fun e!122651 () Bool)

(assert (=> b!186389 (= e!122651 e!122654)))

(declare-fun c!33437 () Bool)

(assert (=> b!186389 (= c!33437 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186390 () Bool)

(declare-fun e!122653 () Bool)

(assert (=> b!186390 (= e!122653 e!122651)))

(declare-fun res!88132 () Bool)

(assert (=> b!186390 (=> (not res!88132) (not e!122651))))

(declare-fun e!122652 () Bool)

(assert (=> b!186390 (= res!88132 (not e!122652))))

(declare-fun res!88131 () Bool)

(assert (=> b!186390 (=> (not res!88131) (not e!122652))))

(assert (=> b!186390 (= res!88131 (validKeyInArray!0 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55107 () Bool)

(declare-fun res!88130 () Bool)

(assert (=> d!55107 (=> res!88130 e!122653)))

(assert (=> d!55107 (= res!88130 (bvsge #b00000000000000000000000000000000 (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> d!55107 (= (arrayNoDuplicates!0 (_keys!5738 thiss!1248) #b00000000000000000000000000000000 Nil!2360) e!122653)))

(declare-fun bm!18784 () Bool)

(assert (=> bm!18784 (= call!18787 (arrayNoDuplicates!0 (_keys!5738 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33437 (Cons!2359 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000) Nil!2360) Nil!2360)))))

(declare-fun b!186391 () Bool)

(declare-fun contains!1290 (List!2363 (_ BitVec 64)) Bool)

(assert (=> b!186391 (= e!122652 (contains!1290 Nil!2360 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186392 () Bool)

(assert (=> b!186392 (= e!122654 call!18787)))

(assert (= (and d!55107 (not res!88130)) b!186390))

(assert (= (and b!186390 res!88131) b!186391))

(assert (= (and b!186390 res!88132) b!186389))

(assert (= (and b!186389 c!33437) b!186388))

(assert (= (and b!186389 (not c!33437)) b!186392))

(assert (= (or b!186388 b!186392) bm!18784))

(assert (=> b!186389 m!212649))

(assert (=> b!186389 m!212649))

(assert (=> b!186389 m!212683))

(assert (=> b!186390 m!212649))

(assert (=> b!186390 m!212649))

(assert (=> b!186390 m!212683))

(assert (=> bm!18784 m!212649))

(declare-fun m!212905 () Bool)

(assert (=> bm!18784 m!212905))

(assert (=> b!186391 m!212649))

(assert (=> b!186391 m!212649))

(declare-fun m!212907 () Bool)

(assert (=> b!186391 m!212907))

(assert (=> b!186198 d!55107))

(declare-fun d!55109 () Bool)

(declare-fun e!122655 () Bool)

(assert (=> d!55109 e!122655))

(declare-fun res!88134 () Bool)

(assert (=> d!55109 (=> (not res!88134) (not e!122655))))

(declare-fun lt!92071 () ListLongMap!2337)

(assert (=> d!55109 (= res!88134 (contains!1286 lt!92071 (_1!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(declare-fun lt!92072 () List!2360)

(assert (=> d!55109 (= lt!92071 (ListLongMap!2338 lt!92072))))

(declare-fun lt!92070 () Unit!5578)

(declare-fun lt!92073 () Unit!5578)

(assert (=> d!55109 (= lt!92070 lt!92073)))

(assert (=> d!55109 (= (getValueByKey!223 lt!92072 (_1!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))) (Some!228 (_2!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(assert (=> d!55109 (= lt!92073 (lemmaContainsTupThenGetReturnValue!118 lt!92072 (_1!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (_2!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(assert (=> d!55109 (= lt!92072 (insertStrictlySorted!121 (toList!1184 (ite c!33375 call!18768 (ite c!33374 call!18766 call!18764))) (_1!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) (_2!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))))))

(assert (=> d!55109 (= (+!285 (ite c!33375 call!18768 (ite c!33374 call!18766 call!18764)) (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))) lt!92071)))

(declare-fun b!186393 () Bool)

(declare-fun res!88133 () Bool)

(assert (=> b!186393 (=> (not res!88133) (not e!122655))))

(assert (=> b!186393 (= res!88133 (= (getValueByKey!223 (toList!1184 lt!92071) (_1!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248))))) (Some!228 (_2!1725 (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))))

(declare-fun b!186394 () Bool)

(assert (=> b!186394 (= e!122655 (contains!1289 (toList!1184 lt!92071) (ite (or c!33375 c!33374) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3638 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3638 thiss!1248)))))))

(assert (= (and d!55109 res!88134) b!186393))

(assert (= (and b!186393 res!88133) b!186394))

(declare-fun m!212909 () Bool)

(assert (=> d!55109 m!212909))

(declare-fun m!212911 () Bool)

(assert (=> d!55109 m!212911))

(declare-fun m!212913 () Bool)

(assert (=> d!55109 m!212913))

(declare-fun m!212915 () Bool)

(assert (=> d!55109 m!212915))

(declare-fun m!212917 () Bool)

(assert (=> b!186393 m!212917))

(declare-fun m!212919 () Bool)

(assert (=> b!186394 m!212919))

(assert (=> bm!18766 d!55109))

(declare-fun d!55111 () Bool)

(declare-fun e!122657 () Bool)

(assert (=> d!55111 e!122657))

(declare-fun res!88135 () Bool)

(assert (=> d!55111 (=> res!88135 e!122657)))

(declare-fun lt!92074 () Bool)

(assert (=> d!55111 (= res!88135 (not lt!92074))))

(declare-fun lt!92076 () Bool)

(assert (=> d!55111 (= lt!92074 lt!92076)))

(declare-fun lt!92077 () Unit!5578)

(declare-fun e!122656 () Unit!5578)

(assert (=> d!55111 (= lt!92077 e!122656)))

(declare-fun c!33438 () Bool)

(assert (=> d!55111 (= c!33438 lt!92076)))

(assert (=> d!55111 (= lt!92076 (containsKey!227 (toList!1184 lt!91962) (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55111 (= (contains!1286 lt!91962 (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)) lt!92074)))

(declare-fun b!186395 () Bool)

(declare-fun lt!92075 () Unit!5578)

(assert (=> b!186395 (= e!122656 lt!92075)))

(assert (=> b!186395 (= lt!92075 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1184 lt!91962) (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186395 (isDefined!177 (getValueByKey!223 (toList!1184 lt!91962) (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186396 () Bool)

(declare-fun Unit!5592 () Unit!5578)

(assert (=> b!186396 (= e!122656 Unit!5592)))

(declare-fun b!186397 () Bool)

(assert (=> b!186397 (= e!122657 (isDefined!177 (getValueByKey!223 (toList!1184 lt!91962) (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55111 c!33438) b!186395))

(assert (= (and d!55111 (not c!33438)) b!186396))

(assert (= (and d!55111 (not res!88135)) b!186397))

(assert (=> d!55111 m!212649))

(declare-fun m!212921 () Bool)

(assert (=> d!55111 m!212921))

(assert (=> b!186395 m!212649))

(declare-fun m!212923 () Bool)

(assert (=> b!186395 m!212923))

(assert (=> b!186395 m!212649))

(assert (=> b!186395 m!212853))

(assert (=> b!186395 m!212853))

(declare-fun m!212925 () Bool)

(assert (=> b!186395 m!212925))

(assert (=> b!186397 m!212649))

(assert (=> b!186397 m!212853))

(assert (=> b!186397 m!212853))

(assert (=> b!186397 m!212925))

(assert (=> b!186160 d!55111))

(declare-fun d!55113 () Bool)

(declare-fun res!88140 () Bool)

(declare-fun e!122662 () Bool)

(assert (=> d!55113 (=> res!88140 e!122662)))

(assert (=> d!55113 (= res!88140 (= (select (arr!3736 (_keys!5738 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55113 (= (arrayContainsKey!0 (_keys!5738 thiss!1248) key!828 #b00000000000000000000000000000000) e!122662)))

(declare-fun b!186402 () Bool)

(declare-fun e!122663 () Bool)

(assert (=> b!186402 (= e!122662 e!122663)))

(declare-fun res!88141 () Bool)

(assert (=> b!186402 (=> (not res!88141) (not e!122663))))

(assert (=> b!186402 (= res!88141 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun b!186403 () Bool)

(assert (=> b!186403 (= e!122663 (arrayContainsKey!0 (_keys!5738 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55113 (not res!88140)) b!186402))

(assert (= (and b!186402 res!88141) b!186403))

(assert (=> d!55113 m!212649))

(declare-fun m!212927 () Bool)

(assert (=> b!186403 m!212927))

(assert (=> bm!18745 d!55113))

(assert (=> d!55027 d!55023))

(declare-fun d!55115 () Bool)

(declare-fun e!122676 () Bool)

(assert (=> d!55115 e!122676))

(declare-fun c!33445 () Bool)

(declare-fun lt!92083 () SeekEntryResult!644)

(assert (=> d!55115 (= c!33445 (and ((_ is Intermediate!644) lt!92083) (undefined!1456 lt!92083)))))

(declare-fun e!122674 () SeekEntryResult!644)

(assert (=> d!55115 (= lt!92083 e!122674)))

(declare-fun c!33446 () Bool)

(assert (=> d!55115 (= c!33446 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92082 () (_ BitVec 64))

(assert (=> d!55115 (= lt!92082 (select (arr!3736 (_keys!5738 thiss!1248)) (toIndex!0 key!828 (mask!8918 thiss!1248))))))

(assert (=> d!55115 (validMask!0 (mask!8918 thiss!1248))))

(assert (=> d!55115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8918 thiss!1248)) key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)) lt!92083)))

(declare-fun b!186422 () Bool)

(declare-fun e!122677 () Bool)

(assert (=> b!186422 (= e!122676 e!122677)))

(declare-fun res!88149 () Bool)

(assert (=> b!186422 (= res!88149 (and ((_ is Intermediate!644) lt!92083) (not (undefined!1456 lt!92083)) (bvslt (x!20207 lt!92083) #b01111111111111111111111111111110) (bvsge (x!20207 lt!92083) #b00000000000000000000000000000000) (bvsge (x!20207 lt!92083) #b00000000000000000000000000000000)))))

(assert (=> b!186422 (=> (not res!88149) (not e!122677))))

(declare-fun b!186423 () Bool)

(assert (=> b!186423 (= e!122676 (bvsge (x!20207 lt!92083) #b01111111111111111111111111111110))))

(declare-fun b!186424 () Bool)

(declare-fun e!122678 () SeekEntryResult!644)

(assert (=> b!186424 (= e!122678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8918 thiss!1248)) #b00000000000000000000000000000000 (mask!8918 thiss!1248)) key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(declare-fun b!186425 () Bool)

(assert (=> b!186425 (= e!122674 e!122678)))

(declare-fun c!33447 () Bool)

(assert (=> b!186425 (= c!33447 (or (= lt!92082 key!828) (= (bvadd lt!92082 lt!92082) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186426 () Bool)

(assert (=> b!186426 (and (bvsge (index!4748 lt!92083) #b00000000000000000000000000000000) (bvslt (index!4748 lt!92083) (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun res!88148 () Bool)

(assert (=> b!186426 (= res!88148 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4748 lt!92083)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122675 () Bool)

(assert (=> b!186426 (=> res!88148 e!122675)))

(declare-fun b!186427 () Bool)

(assert (=> b!186427 (= e!122678 (Intermediate!644 false (toIndex!0 key!828 (mask!8918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186428 () Bool)

(assert (=> b!186428 (= e!122674 (Intermediate!644 true (toIndex!0 key!828 (mask!8918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186429 () Bool)

(assert (=> b!186429 (and (bvsge (index!4748 lt!92083) #b00000000000000000000000000000000) (bvslt (index!4748 lt!92083) (size!4053 (_keys!5738 thiss!1248))))))

(assert (=> b!186429 (= e!122675 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4748 lt!92083)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186430 () Bool)

(assert (=> b!186430 (and (bvsge (index!4748 lt!92083) #b00000000000000000000000000000000) (bvslt (index!4748 lt!92083) (size!4053 (_keys!5738 thiss!1248))))))

(declare-fun res!88150 () Bool)

(assert (=> b!186430 (= res!88150 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4748 lt!92083)) key!828))))

(assert (=> b!186430 (=> res!88150 e!122675)))

(assert (=> b!186430 (= e!122677 e!122675)))

(assert (= (and d!55115 c!33446) b!186428))

(assert (= (and d!55115 (not c!33446)) b!186425))

(assert (= (and b!186425 c!33447) b!186427))

(assert (= (and b!186425 (not c!33447)) b!186424))

(assert (= (and d!55115 c!33445) b!186423))

(assert (= (and d!55115 (not c!33445)) b!186422))

(assert (= (and b!186422 res!88149) b!186430))

(assert (= (and b!186430 (not res!88150)) b!186426))

(assert (= (and b!186426 (not res!88148)) b!186429))

(declare-fun m!212929 () Bool)

(assert (=> b!186430 m!212929))

(assert (=> b!186426 m!212929))

(assert (=> d!55115 m!212693))

(declare-fun m!212931 () Bool)

(assert (=> d!55115 m!212931))

(assert (=> d!55115 m!212545))

(assert (=> b!186424 m!212693))

(declare-fun m!212933 () Bool)

(assert (=> b!186424 m!212933))

(assert (=> b!186424 m!212933))

(declare-fun m!212935 () Bool)

(assert (=> b!186424 m!212935))

(assert (=> b!186429 m!212929))

(assert (=> d!55029 d!55115))

(declare-fun d!55117 () Bool)

(declare-fun lt!92089 () (_ BitVec 32))

(declare-fun lt!92088 () (_ BitVec 32))

(assert (=> d!55117 (= lt!92089 (bvmul (bvxor lt!92088 (bvlshr lt!92088 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55117 (= lt!92088 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55117 (and (bvsge (mask!8918 thiss!1248) #b00000000000000000000000000000000) (let ((res!88151 (let ((h!2993 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20226 (bvmul (bvxor h!2993 (bvlshr h!2993 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20226 (bvlshr x!20226 #b00000000000000000000000000001101)) (mask!8918 thiss!1248)))))) (and (bvslt res!88151 (bvadd (mask!8918 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88151 #b00000000000000000000000000000000))))))

(assert (=> d!55117 (= (toIndex!0 key!828 (mask!8918 thiss!1248)) (bvand (bvxor lt!92089 (bvlshr lt!92089 #b00000000000000000000000000001101)) (mask!8918 thiss!1248)))))

(assert (=> d!55029 d!55117))

(assert (=> d!55029 d!55023))

(assert (=> d!55017 d!55029))

(declare-fun d!55119 () Bool)

(declare-fun e!122681 () Bool)

(assert (=> d!55119 e!122681))

(declare-fun res!88156 () Bool)

(assert (=> d!55119 (=> (not res!88156) (not e!122681))))

(declare-fun lt!92092 () SeekEntryResult!644)

(assert (=> d!55119 (= res!88156 ((_ is Found!644) lt!92092))))

(assert (=> d!55119 (= lt!92092 (seekEntryOrOpen!0 key!828 (_keys!5738 thiss!1248) (mask!8918 thiss!1248)))))

(assert (=> d!55119 true))

(declare-fun _$33!126 () Unit!5578)

(assert (=> d!55119 (= (choose!991 (_keys!5738 thiss!1248) (_values!3780 thiss!1248) (mask!8918 thiss!1248) (extraKeys!3534 thiss!1248) (zeroValue!3638 thiss!1248) (minValue!3638 thiss!1248) key!828 (defaultEntry!3797 thiss!1248)) _$33!126)))

(declare-fun b!186435 () Bool)

(declare-fun res!88157 () Bool)

(assert (=> b!186435 (=> (not res!88157) (not e!122681))))

(assert (=> b!186435 (= res!88157 (inRange!0 (index!4747 lt!92092) (mask!8918 thiss!1248)))))

(declare-fun b!186436 () Bool)

(assert (=> b!186436 (= e!122681 (= (select (arr!3736 (_keys!5738 thiss!1248)) (index!4747 lt!92092)) key!828))))

(assert (= (and d!55119 res!88156) b!186435))

(assert (= (and b!186435 res!88157) b!186436))

(assert (=> d!55119 m!212535))

(declare-fun m!212937 () Bool)

(assert (=> b!186435 m!212937))

(declare-fun m!212939 () Bool)

(assert (=> b!186436 m!212939))

(assert (=> d!55017 d!55119))

(assert (=> d!55017 d!55023))

(declare-fun mapIsEmpty!7519 () Bool)

(declare-fun mapRes!7519 () Bool)

(assert (=> mapIsEmpty!7519 mapRes!7519))

(declare-fun b!186437 () Bool)

(declare-fun e!122683 () Bool)

(assert (=> b!186437 (= e!122683 tp_is_empty!4363)))

(declare-fun condMapEmpty!7519 () Bool)

(declare-fun mapDefault!7519 () ValueCell!1838)

(assert (=> mapNonEmpty!7518 (= condMapEmpty!7519 (= mapRest!7518 ((as const (Array (_ BitVec 32) ValueCell!1838)) mapDefault!7519)))))

(declare-fun e!122682 () Bool)

(assert (=> mapNonEmpty!7518 (= tp!16590 (and e!122682 mapRes!7519))))

(declare-fun mapNonEmpty!7519 () Bool)

(declare-fun tp!16591 () Bool)

(assert (=> mapNonEmpty!7519 (= mapRes!7519 (and tp!16591 e!122683))))

(declare-fun mapValue!7519 () ValueCell!1838)

(declare-fun mapRest!7519 () (Array (_ BitVec 32) ValueCell!1838))

(declare-fun mapKey!7519 () (_ BitVec 32))

(assert (=> mapNonEmpty!7519 (= mapRest!7518 (store mapRest!7519 mapKey!7519 mapValue!7519))))

(declare-fun b!186438 () Bool)

(assert (=> b!186438 (= e!122682 tp_is_empty!4363)))

(assert (= (and mapNonEmpty!7518 condMapEmpty!7519) mapIsEmpty!7519))

(assert (= (and mapNonEmpty!7518 (not condMapEmpty!7519)) mapNonEmpty!7519))

(assert (= (and mapNonEmpty!7519 ((_ is ValueCellFull!1838) mapValue!7519)) b!186437))

(assert (= (and mapNonEmpty!7518 ((_ is ValueCellFull!1838) mapDefault!7519)) b!186438))

(declare-fun m!212941 () Bool)

(assert (=> mapNonEmpty!7519 m!212941))

(declare-fun b_lambda!7249 () Bool)

(assert (= b_lambda!7247 (or (and b!185999 b_free!4591) b_lambda!7249)))

(declare-fun b_lambda!7251 () Bool)

(assert (= b_lambda!7245 (or (and b!185999 b_free!4591) b_lambda!7251)))

(check-sat (not d!55073) (not b!186329) (not d!55099) (not b!186279) (not b!186245) (not d!55065) (not d!55115) (not b!186371) (not mapNonEmpty!7519) (not b!186359) (not d!55101) (not b!186328) (not b!186246) (not d!55095) (not b!186247) (not d!55069) (not d!55063) (not d!55105) (not b!186375) (not b!186237) (not d!55061) (not b!186243) (not b!186262) tp_is_empty!4363 (not d!55059) (not b!186394) (not b!186288) (not b_lambda!7249) (not b!186284) (not bm!18778) (not b!186331) (not b!186244) (not b!186332) (not d!55051) (not b!186318) (not bm!18784) (not b!186395) (not d!55079) (not bm!18769) (not b!186275) (not b!186391) (not b!186397) (not d!55081) (not b!186403) (not b!186281) (not b!186278) (not bm!18781) (not d!55091) (not d!55077) (not b!186282) (not b!186286) (not b!186389) (not d!55085) (not b!186390) (not b!186424) (not b!186212) (not d!55045) (not b!186372) (not b!186280) (not d!55067) (not b!186274) (not bm!18775) (not d!55111) (not b!186342) (not d!55087) (not b!186435) (not d!55057) (not d!55041) (not b!186393) (not b!186241) (not d!55093) (not b!186269) (not b!186377) (not b!186317) (not b_lambda!7251) (not d!55055) (not d!55075) (not d!55053) b_and!11179 (not d!55119) (not d!55109) (not b!186251) (not b_next!4591) (not d!55071) (not bm!18774) (not b_lambda!7243) (not b!186242) (not d!55043) (not b!186268))
(check-sat b_and!11179 (not b_next!4591))
