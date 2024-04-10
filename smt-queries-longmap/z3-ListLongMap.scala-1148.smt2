; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24010 () Bool)

(assert start!24010)

(declare-fun b!251415 () Bool)

(declare-fun b_free!6639 () Bool)

(declare-fun b_next!6639 () Bool)

(assert (=> b!251415 (= b_free!6639 (not b_next!6639))))

(declare-fun tp!23189 () Bool)

(declare-fun b_and!13667 () Bool)

(assert (=> b!251415 (= tp!23189 b_and!13667)))

(declare-fun b!251409 () Bool)

(declare-fun e!163052 () Bool)

(declare-fun call!23653 () Bool)

(assert (=> b!251409 (= e!163052 (not call!23653))))

(declare-fun b!251410 () Bool)

(declare-fun res!123098 () Bool)

(declare-fun e!163058 () Bool)

(assert (=> b!251410 (=> (not res!123098) (not e!163058))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!251410 (= res!123098 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251411 () Bool)

(declare-fun res!123097 () Bool)

(declare-fun e!163047 () Bool)

(assert (=> b!251411 (=> (not res!123097) (not e!163047))))

(declare-datatypes ((V!8315 0))(
  ( (V!8316 (val!3295 Int)) )
))
(declare-datatypes ((ValueCell!2907 0))(
  ( (ValueCellFull!2907 (v!5363 V!8315)) (EmptyCell!2907) )
))
(declare-datatypes ((array!12323 0))(
  ( (array!12324 (arr!5842 (Array (_ BitVec 32) ValueCell!2907)) (size!6188 (_ BitVec 32))) )
))
(declare-datatypes ((array!12325 0))(
  ( (array!12326 (arr!5843 (Array (_ BitVec 32) (_ BitVec 64))) (size!6189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3714 0))(
  ( (LongMapFixedSize!3715 (defaultEntry!4646 Int) (mask!10847 (_ BitVec 32)) (extraKeys!4383 (_ BitVec 32)) (zeroValue!4487 V!8315) (minValue!4487 V!8315) (_size!1906 (_ BitVec 32)) (_keys!6788 array!12325) (_values!4629 array!12323) (_vacant!1906 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3714)

(declare-datatypes ((SeekEntryResult!1127 0))(
  ( (MissingZero!1127 (index!6678 (_ BitVec 32))) (Found!1127 (index!6679 (_ BitVec 32))) (Intermediate!1127 (undefined!1939 Bool) (index!6680 (_ BitVec 32)) (x!24721 (_ BitVec 32))) (Undefined!1127) (MissingVacant!1127 (index!6681 (_ BitVec 32))) )
))
(declare-fun lt!125994 () SeekEntryResult!1127)

(assert (=> b!251411 (= res!123097 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6678 lt!125994)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!123093 () Bool)

(assert (=> start!24010 (=> (not res!123093) (not e!163058))))

(declare-fun valid!1452 (LongMapFixedSize!3714) Bool)

(assert (=> start!24010 (= res!123093 (valid!1452 thiss!1504))))

(assert (=> start!24010 e!163058))

(declare-fun e!163055 () Bool)

(assert (=> start!24010 e!163055))

(assert (=> start!24010 true))

(declare-fun b!251412 () Bool)

(declare-fun e!163057 () Bool)

(declare-fun e!163049 () Bool)

(assert (=> b!251412 (= e!163057 e!163049)))

(declare-fun res!123092 () Bool)

(assert (=> b!251412 (=> (not res!123092) (not e!163049))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251412 (= res!123092 (inRange!0 index!297 (mask!10847 thiss!1504)))))

(declare-datatypes ((Unit!7781 0))(
  ( (Unit!7782) )
))
(declare-fun lt!125991 () Unit!7781)

(declare-fun e!163050 () Unit!7781)

(assert (=> b!251412 (= lt!125991 e!163050)))

(declare-fun c!42305 () Bool)

(declare-datatypes ((tuple2!4852 0))(
  ( (tuple2!4853 (_1!2437 (_ BitVec 64)) (_2!2437 V!8315)) )
))
(declare-datatypes ((List!3732 0))(
  ( (Nil!3729) (Cons!3728 (h!4389 tuple2!4852) (t!8769 List!3732)) )
))
(declare-datatypes ((ListLongMap!3765 0))(
  ( (ListLongMap!3766 (toList!1898 List!3732)) )
))
(declare-fun contains!1822 (ListLongMap!3765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1426 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 32) Int) ListLongMap!3765)

(assert (=> b!251412 (= c!42305 (contains!1822 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) key!932))))

(declare-fun b!251413 () Bool)

(declare-fun res!123095 () Bool)

(assert (=> b!251413 (= res!123095 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6681 lt!125994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251413 (=> (not res!123095) (not e!163052))))

(declare-fun b!251414 () Bool)

(declare-fun lt!125998 () Unit!7781)

(assert (=> b!251414 (= e!163050 lt!125998)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!405 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 64) Int) Unit!7781)

(assert (=> b!251414 (= lt!125998 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!405 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)))))

(declare-fun c!42303 () Bool)

(get-info :version)

(assert (=> b!251414 (= c!42303 ((_ is MissingZero!1127) lt!125994))))

(declare-fun e!163048 () Bool)

(assert (=> b!251414 e!163048))

(declare-fun tp_is_empty!6501 () Bool)

(declare-fun e!163056 () Bool)

(declare-fun array_inv!3859 (array!12325) Bool)

(declare-fun array_inv!3860 (array!12323) Bool)

(assert (=> b!251415 (= e!163055 (and tp!23189 tp_is_empty!6501 (array_inv!3859 (_keys!6788 thiss!1504)) (array_inv!3860 (_values!4629 thiss!1504)) e!163056))))

(declare-fun mapIsEmpty!11051 () Bool)

(declare-fun mapRes!11051 () Bool)

(assert (=> mapIsEmpty!11051 mapRes!11051))

(declare-fun b!251416 () Bool)

(declare-fun res!123099 () Bool)

(assert (=> b!251416 (=> (not res!123099) (not e!163047))))

(declare-fun call!23652 () Bool)

(assert (=> b!251416 (= res!123099 call!23652)))

(assert (=> b!251416 (= e!163048 e!163047)))

(declare-fun b!251417 () Bool)

(declare-fun e!163046 () Bool)

(assert (=> b!251417 (= e!163046 ((_ is Undefined!1127) lt!125994))))

(declare-fun b!251418 () Bool)

(declare-fun e!163045 () Bool)

(assert (=> b!251418 (= e!163045 tp_is_empty!6501)))

(declare-fun b!251419 () Bool)

(declare-fun e!163059 () Unit!7781)

(declare-fun Unit!7783 () Unit!7781)

(assert (=> b!251419 (= e!163059 Unit!7783)))

(declare-fun lt!125989 () Unit!7781)

(declare-fun lemmaArrayContainsKeyThenInListMap!205 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 64) (_ BitVec 32) Int) Unit!7781)

(assert (=> b!251419 (= lt!125989 (lemmaArrayContainsKeyThenInListMap!205 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(assert (=> b!251419 false))

(declare-fun b!251420 () Bool)

(assert (=> b!251420 (= e!163046 e!163052)))

(declare-fun res!123100 () Bool)

(assert (=> b!251420 (= res!123100 call!23652)))

(assert (=> b!251420 (=> (not res!123100) (not e!163052))))

(declare-fun b!251421 () Bool)

(declare-fun Unit!7784 () Unit!7781)

(assert (=> b!251421 (= e!163059 Unit!7784)))

(declare-fun b!251422 () Bool)

(assert (=> b!251422 (= e!163058 e!163057)))

(declare-fun res!123096 () Bool)

(assert (=> b!251422 (=> (not res!123096) (not e!163057))))

(assert (=> b!251422 (= res!123096 (or (= lt!125994 (MissingZero!1127 index!297)) (= lt!125994 (MissingVacant!1127 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12325 (_ BitVec 32)) SeekEntryResult!1127)

(assert (=> b!251422 (= lt!125994 (seekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun b!251423 () Bool)

(assert (=> b!251423 (= e!163047 (not call!23653))))

(declare-fun bm!23649 () Bool)

(declare-fun arrayContainsKey!0 (array!12325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23649 (= call!23653 (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23650 () Bool)

(assert (=> bm!23650 (= call!23652 (inRange!0 (ite c!42303 (index!6678 lt!125994) (index!6681 lt!125994)) (mask!10847 thiss!1504)))))

(declare-fun b!251424 () Bool)

(declare-fun e!163053 () Bool)

(assert (=> b!251424 (= e!163056 (and e!163053 mapRes!11051))))

(declare-fun condMapEmpty!11051 () Bool)

(declare-fun mapDefault!11051 () ValueCell!2907)

(assert (=> b!251424 (= condMapEmpty!11051 (= (arr!5842 (_values!4629 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2907)) mapDefault!11051)))))

(declare-fun b!251425 () Bool)

(declare-fun Unit!7785 () Unit!7781)

(assert (=> b!251425 (= e!163050 Unit!7785)))

(declare-fun lt!125990 () Unit!7781)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!402 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 64) Int) Unit!7781)

(assert (=> b!251425 (= lt!125990 (lemmaInListMapThenSeekEntryOrOpenFindsIt!402 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)))))

(assert (=> b!251425 false))

(declare-fun mapNonEmpty!11051 () Bool)

(declare-fun tp!23188 () Bool)

(assert (=> mapNonEmpty!11051 (= mapRes!11051 (and tp!23188 e!163045))))

(declare-fun mapRest!11051 () (Array (_ BitVec 32) ValueCell!2907))

(declare-fun mapValue!11051 () ValueCell!2907)

(declare-fun mapKey!11051 () (_ BitVec 32))

(assert (=> mapNonEmpty!11051 (= (arr!5842 (_values!4629 thiss!1504)) (store mapRest!11051 mapKey!11051 mapValue!11051))))

(declare-fun b!251426 () Bool)

(declare-fun e!163054 () Bool)

(assert (=> b!251426 (= e!163049 (not e!163054))))

(declare-fun res!123094 () Bool)

(assert (=> b!251426 (=> res!123094 e!163054)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!251426 (= res!123094 (not (validMask!0 (mask!10847 thiss!1504))))))

(declare-fun lt!125995 () array!12325)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12325 (_ BitVec 32)) Bool)

(assert (=> b!251426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125995 (mask!10847 thiss!1504))))

(declare-fun lt!125996 () Unit!7781)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12325 (_ BitVec 32) (_ BitVec 32)) Unit!7781)

(assert (=> b!251426 (= lt!125996 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) index!297 (mask!10847 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12325 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251426 (= (arrayCountValidKeys!0 lt!125995 #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504)))))))

(declare-fun lt!125997 () Unit!7781)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12325 (_ BitVec 32) (_ BitVec 64)) Unit!7781)

(assert (=> b!251426 (= lt!125997 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6788 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3733 0))(
  ( (Nil!3730) (Cons!3729 (h!4390 (_ BitVec 64)) (t!8770 List!3733)) )
))
(declare-fun arrayNoDuplicates!0 (array!12325 (_ BitVec 32) List!3733) Bool)

(assert (=> b!251426 (arrayNoDuplicates!0 lt!125995 #b00000000000000000000000000000000 Nil!3730)))

(assert (=> b!251426 (= lt!125995 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun lt!125992 () Unit!7781)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3733) Unit!7781)

(assert (=> b!251426 (= lt!125992 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6788 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730))))

(declare-fun lt!125993 () Unit!7781)

(assert (=> b!251426 (= lt!125993 e!163059)))

(declare-fun c!42302 () Bool)

(assert (=> b!251426 (= c!42302 (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251427 () Bool)

(declare-fun c!42304 () Bool)

(assert (=> b!251427 (= c!42304 ((_ is MissingVacant!1127) lt!125994))))

(assert (=> b!251427 (= e!163048 e!163046)))

(declare-fun b!251428 () Bool)

(assert (=> b!251428 (= e!163054 (or (not (= (size!6188 (_values!4629 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10847 thiss!1504)))) (not (= (size!6189 (_keys!6788 thiss!1504)) (size!6188 (_values!4629 thiss!1504)))) (bvslt (mask!10847 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4383 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4383 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!251429 () Bool)

(assert (=> b!251429 (= e!163053 tp_is_empty!6501)))

(assert (= (and start!24010 res!123093) b!251410))

(assert (= (and b!251410 res!123098) b!251422))

(assert (= (and b!251422 res!123096) b!251412))

(assert (= (and b!251412 c!42305) b!251425))

(assert (= (and b!251412 (not c!42305)) b!251414))

(assert (= (and b!251414 c!42303) b!251416))

(assert (= (and b!251414 (not c!42303)) b!251427))

(assert (= (and b!251416 res!123099) b!251411))

(assert (= (and b!251411 res!123097) b!251423))

(assert (= (and b!251427 c!42304) b!251420))

(assert (= (and b!251427 (not c!42304)) b!251417))

(assert (= (and b!251420 res!123100) b!251413))

(assert (= (and b!251413 res!123095) b!251409))

(assert (= (or b!251416 b!251420) bm!23650))

(assert (= (or b!251423 b!251409) bm!23649))

(assert (= (and b!251412 res!123092) b!251426))

(assert (= (and b!251426 c!42302) b!251419))

(assert (= (and b!251426 (not c!42302)) b!251421))

(assert (= (and b!251426 (not res!123094)) b!251428))

(assert (= (and b!251424 condMapEmpty!11051) mapIsEmpty!11051))

(assert (= (and b!251424 (not condMapEmpty!11051)) mapNonEmpty!11051))

(assert (= (and mapNonEmpty!11051 ((_ is ValueCellFull!2907) mapValue!11051)) b!251418))

(assert (= (and b!251424 ((_ is ValueCellFull!2907) mapDefault!11051)) b!251429))

(assert (= b!251415 b!251424))

(assert (= start!24010 b!251415))

(declare-fun m!267695 () Bool)

(assert (=> b!251425 m!267695))

(declare-fun m!267697 () Bool)

(assert (=> bm!23650 m!267697))

(declare-fun m!267699 () Bool)

(assert (=> b!251415 m!267699))

(declare-fun m!267701 () Bool)

(assert (=> b!251415 m!267701))

(declare-fun m!267703 () Bool)

(assert (=> b!251411 m!267703))

(declare-fun m!267705 () Bool)

(assert (=> mapNonEmpty!11051 m!267705))

(declare-fun m!267707 () Bool)

(assert (=> b!251426 m!267707))

(declare-fun m!267709 () Bool)

(assert (=> b!251426 m!267709))

(declare-fun m!267711 () Bool)

(assert (=> b!251426 m!267711))

(declare-fun m!267713 () Bool)

(assert (=> b!251426 m!267713))

(declare-fun m!267715 () Bool)

(assert (=> b!251426 m!267715))

(declare-fun m!267717 () Bool)

(assert (=> b!251426 m!267717))

(declare-fun m!267719 () Bool)

(assert (=> b!251426 m!267719))

(declare-fun m!267721 () Bool)

(assert (=> b!251426 m!267721))

(declare-fun m!267723 () Bool)

(assert (=> b!251426 m!267723))

(declare-fun m!267725 () Bool)

(assert (=> b!251426 m!267725))

(declare-fun m!267727 () Bool)

(assert (=> b!251414 m!267727))

(declare-fun m!267729 () Bool)

(assert (=> b!251419 m!267729))

(declare-fun m!267731 () Bool)

(assert (=> b!251413 m!267731))

(assert (=> bm!23649 m!267725))

(declare-fun m!267733 () Bool)

(assert (=> start!24010 m!267733))

(declare-fun m!267735 () Bool)

(assert (=> b!251422 m!267735))

(declare-fun m!267737 () Bool)

(assert (=> b!251412 m!267737))

(declare-fun m!267739 () Bool)

(assert (=> b!251412 m!267739))

(assert (=> b!251412 m!267739))

(declare-fun m!267741 () Bool)

(assert (=> b!251412 m!267741))

(check-sat (not start!24010) (not b!251422) (not bm!23650) (not mapNonEmpty!11051) (not b!251425) (not b!251426) (not bm!23649) (not b_next!6639) (not b!251419) tp_is_empty!6501 b_and!13667 (not b!251415) (not b!251412) (not b!251414))
(check-sat b_and!13667 (not b_next!6639))
(get-model)

(declare-fun b!251505 () Bool)

(declare-fun e!163112 () SeekEntryResult!1127)

(declare-fun e!163111 () SeekEntryResult!1127)

(assert (=> b!251505 (= e!163112 e!163111)))

(declare-fun lt!126036 () (_ BitVec 64))

(declare-fun lt!126037 () SeekEntryResult!1127)

(assert (=> b!251505 (= lt!126036 (select (arr!5843 (_keys!6788 thiss!1504)) (index!6680 lt!126037)))))

(declare-fun c!42326 () Bool)

(assert (=> b!251505 (= c!42326 (= lt!126036 key!932))))

(declare-fun d!61133 () Bool)

(declare-fun lt!126035 () SeekEntryResult!1127)

(assert (=> d!61133 (and (or ((_ is Undefined!1127) lt!126035) (not ((_ is Found!1127) lt!126035)) (and (bvsge (index!6679 lt!126035) #b00000000000000000000000000000000) (bvslt (index!6679 lt!126035) (size!6189 (_keys!6788 thiss!1504))))) (or ((_ is Undefined!1127) lt!126035) ((_ is Found!1127) lt!126035) (not ((_ is MissingZero!1127) lt!126035)) (and (bvsge (index!6678 lt!126035) #b00000000000000000000000000000000) (bvslt (index!6678 lt!126035) (size!6189 (_keys!6788 thiss!1504))))) (or ((_ is Undefined!1127) lt!126035) ((_ is Found!1127) lt!126035) ((_ is MissingZero!1127) lt!126035) (not ((_ is MissingVacant!1127) lt!126035)) (and (bvsge (index!6681 lt!126035) #b00000000000000000000000000000000) (bvslt (index!6681 lt!126035) (size!6189 (_keys!6788 thiss!1504))))) (or ((_ is Undefined!1127) lt!126035) (ite ((_ is Found!1127) lt!126035) (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6679 lt!126035)) key!932) (ite ((_ is MissingZero!1127) lt!126035) (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6678 lt!126035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1127) lt!126035) (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6681 lt!126035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61133 (= lt!126035 e!163112)))

(declare-fun c!42324 () Bool)

(assert (=> d!61133 (= c!42324 (and ((_ is Intermediate!1127) lt!126037) (undefined!1939 lt!126037)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12325 (_ BitVec 32)) SeekEntryResult!1127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61133 (= lt!126037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10847 thiss!1504)) key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(assert (=> d!61133 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61133 (= (seekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)) lt!126035)))

(declare-fun b!251506 () Bool)

(assert (=> b!251506 (= e!163112 Undefined!1127)))

(declare-fun b!251507 () Bool)

(assert (=> b!251507 (= e!163111 (Found!1127 (index!6680 lt!126037)))))

(declare-fun b!251508 () Bool)

(declare-fun e!163113 () SeekEntryResult!1127)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12325 (_ BitVec 32)) SeekEntryResult!1127)

(assert (=> b!251508 (= e!163113 (seekKeyOrZeroReturnVacant!0 (x!24721 lt!126037) (index!6680 lt!126037) (index!6680 lt!126037) key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun b!251509 () Bool)

(assert (=> b!251509 (= e!163113 (MissingZero!1127 (index!6680 lt!126037)))))

(declare-fun b!251510 () Bool)

(declare-fun c!42325 () Bool)

(assert (=> b!251510 (= c!42325 (= lt!126036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251510 (= e!163111 e!163113)))

(assert (= (and d!61133 c!42324) b!251506))

(assert (= (and d!61133 (not c!42324)) b!251505))

(assert (= (and b!251505 c!42326) b!251507))

(assert (= (and b!251505 (not c!42326)) b!251510))

(assert (= (and b!251510 c!42325) b!251509))

(assert (= (and b!251510 (not c!42325)) b!251508))

(declare-fun m!267791 () Bool)

(assert (=> b!251505 m!267791))

(assert (=> d!61133 m!267707))

(declare-fun m!267793 () Bool)

(assert (=> d!61133 m!267793))

(declare-fun m!267795 () Bool)

(assert (=> d!61133 m!267795))

(declare-fun m!267797 () Bool)

(assert (=> d!61133 m!267797))

(assert (=> d!61133 m!267793))

(declare-fun m!267799 () Bool)

(assert (=> d!61133 m!267799))

(declare-fun m!267801 () Bool)

(assert (=> d!61133 m!267801))

(declare-fun m!267803 () Bool)

(assert (=> b!251508 m!267803))

(assert (=> b!251422 d!61133))

(declare-fun d!61135 () Bool)

(declare-fun e!163116 () Bool)

(assert (=> d!61135 e!163116))

(declare-fun res!123132 () Bool)

(assert (=> d!61135 (=> (not res!123132) (not e!163116))))

(declare-fun lt!126043 () SeekEntryResult!1127)

(assert (=> d!61135 (= res!123132 ((_ is Found!1127) lt!126043))))

(assert (=> d!61135 (= lt!126043 (seekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun lt!126042 () Unit!7781)

(declare-fun choose!1194 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 64) Int) Unit!7781)

(assert (=> d!61135 (= lt!126042 (choose!1194 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)))))

(assert (=> d!61135 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61135 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!402 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)) lt!126042)))

(declare-fun b!251515 () Bool)

(declare-fun res!123133 () Bool)

(assert (=> b!251515 (=> (not res!123133) (not e!163116))))

(assert (=> b!251515 (= res!123133 (inRange!0 (index!6679 lt!126043) (mask!10847 thiss!1504)))))

(declare-fun b!251516 () Bool)

(assert (=> b!251516 (= e!163116 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6679 lt!126043)) key!932))))

(assert (=> b!251516 (and (bvsge (index!6679 lt!126043) #b00000000000000000000000000000000) (bvslt (index!6679 lt!126043) (size!6189 (_keys!6788 thiss!1504))))))

(assert (= (and d!61135 res!123132) b!251515))

(assert (= (and b!251515 res!123133) b!251516))

(assert (=> d!61135 m!267735))

(declare-fun m!267805 () Bool)

(assert (=> d!61135 m!267805))

(assert (=> d!61135 m!267707))

(declare-fun m!267807 () Bool)

(assert (=> b!251515 m!267807))

(declare-fun m!267809 () Bool)

(assert (=> b!251516 m!267809))

(assert (=> b!251425 d!61135))

(declare-fun d!61137 () Bool)

(assert (=> d!61137 (= (inRange!0 index!297 (mask!10847 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251412 d!61137))

(declare-fun d!61139 () Bool)

(declare-fun e!163122 () Bool)

(assert (=> d!61139 e!163122))

(declare-fun res!123136 () Bool)

(assert (=> d!61139 (=> res!123136 e!163122)))

(declare-fun lt!126055 () Bool)

(assert (=> d!61139 (= res!123136 (not lt!126055))))

(declare-fun lt!126052 () Bool)

(assert (=> d!61139 (= lt!126055 lt!126052)))

(declare-fun lt!126054 () Unit!7781)

(declare-fun e!163121 () Unit!7781)

(assert (=> d!61139 (= lt!126054 e!163121)))

(declare-fun c!42329 () Bool)

(assert (=> d!61139 (= c!42329 lt!126052)))

(declare-fun containsKey!292 (List!3732 (_ BitVec 64)) Bool)

(assert (=> d!61139 (= lt!126052 (containsKey!292 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))

(assert (=> d!61139 (= (contains!1822 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) key!932) lt!126055)))

(declare-fun b!251523 () Bool)

(declare-fun lt!126053 () Unit!7781)

(assert (=> b!251523 (= e!163121 lt!126053)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!240 (List!3732 (_ BitVec 64)) Unit!7781)

(assert (=> b!251523 (= lt!126053 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))

(declare-datatypes ((Option!306 0))(
  ( (Some!305 (v!5365 V!8315)) (None!304) )
))
(declare-fun isDefined!241 (Option!306) Bool)

(declare-fun getValueByKey!300 (List!3732 (_ BitVec 64)) Option!306)

(assert (=> b!251523 (isDefined!241 (getValueByKey!300 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))

(declare-fun b!251524 () Bool)

(declare-fun Unit!7790 () Unit!7781)

(assert (=> b!251524 (= e!163121 Unit!7790)))

(declare-fun b!251525 () Bool)

(assert (=> b!251525 (= e!163122 (isDefined!241 (getValueByKey!300 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932)))))

(assert (= (and d!61139 c!42329) b!251523))

(assert (= (and d!61139 (not c!42329)) b!251524))

(assert (= (and d!61139 (not res!123136)) b!251525))

(declare-fun m!267811 () Bool)

(assert (=> d!61139 m!267811))

(declare-fun m!267813 () Bool)

(assert (=> b!251523 m!267813))

(declare-fun m!267815 () Bool)

(assert (=> b!251523 m!267815))

(assert (=> b!251523 m!267815))

(declare-fun m!267817 () Bool)

(assert (=> b!251523 m!267817))

(assert (=> b!251525 m!267815))

(assert (=> b!251525 m!267815))

(assert (=> b!251525 m!267817))

(assert (=> b!251412 d!61139))

(declare-fun d!61141 () Bool)

(declare-fun e!163160 () Bool)

(assert (=> d!61141 e!163160))

(declare-fun res!123161 () Bool)

(assert (=> d!61141 (=> (not res!123161) (not e!163160))))

(assert (=> d!61141 (= res!123161 (or (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))))

(declare-fun lt!126107 () ListLongMap!3765)

(declare-fun lt!126100 () ListLongMap!3765)

(assert (=> d!61141 (= lt!126107 lt!126100)))

(declare-fun lt!126108 () Unit!7781)

(declare-fun e!163158 () Unit!7781)

(assert (=> d!61141 (= lt!126108 e!163158)))

(declare-fun c!42342 () Bool)

(declare-fun e!163155 () Bool)

(assert (=> d!61141 (= c!42342 e!163155)))

(declare-fun res!123157 () Bool)

(assert (=> d!61141 (=> (not res!123157) (not e!163155))))

(assert (=> d!61141 (= res!123157 (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun e!163150 () ListLongMap!3765)

(assert (=> d!61141 (= lt!126100 e!163150)))

(declare-fun c!42346 () Bool)

(assert (=> d!61141 (= c!42346 (and (not (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61141 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61141 (= (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) lt!126107)))

(declare-fun b!251568 () Bool)

(declare-fun e!163156 () ListLongMap!3765)

(declare-fun call!23675 () ListLongMap!3765)

(assert (=> b!251568 (= e!163156 call!23675)))

(declare-fun bm!23671 () Bool)

(declare-fun call!23677 () Bool)

(assert (=> bm!23671 (= call!23677 (contains!1822 lt!126107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251569 () Bool)

(declare-fun res!123155 () Bool)

(assert (=> b!251569 (=> (not res!123155) (not e!163160))))

(declare-fun e!163157 () Bool)

(assert (=> b!251569 (= res!123155 e!163157)))

(declare-fun c!42344 () Bool)

(assert (=> b!251569 (= c!42344 (not (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!42345 () Bool)

(declare-fun call!23676 () ListLongMap!3765)

(declare-fun call!23678 () ListLongMap!3765)

(declare-fun call!23674 () ListLongMap!3765)

(declare-fun bm!23672 () Bool)

(declare-fun call!23679 () ListLongMap!3765)

(declare-fun +!669 (ListLongMap!3765 tuple2!4852) ListLongMap!3765)

(assert (=> bm!23672 (= call!23676 (+!669 (ite c!42346 call!23674 (ite c!42345 call!23679 call!23678)) (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))

(declare-fun b!251570 () Bool)

(declare-fun e!163154 () Bool)

(declare-fun e!163161 () Bool)

(assert (=> b!251570 (= e!163154 e!163161)))

(declare-fun res!123159 () Bool)

(assert (=> b!251570 (= res!123159 call!23677)))

(assert (=> b!251570 (=> (not res!123159) (not e!163161))))

(declare-fun b!251571 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!251571 (= e!163155 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251572 () Bool)

(declare-fun e!163152 () Bool)

(assert (=> b!251572 (= e!163152 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251573 () Bool)

(declare-fun Unit!7791 () Unit!7781)

(assert (=> b!251573 (= e!163158 Unit!7791)))

(declare-fun b!251574 () Bool)

(assert (=> b!251574 (= e!163154 (not call!23677))))

(declare-fun b!251575 () Bool)

(declare-fun e!163153 () Bool)

(declare-fun apply!242 (ListLongMap!3765 (_ BitVec 64)) V!8315)

(assert (=> b!251575 (= e!163153 (= (apply!242 lt!126107 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4487 thiss!1504)))))

(declare-fun bm!23673 () Bool)

(assert (=> bm!23673 (= call!23675 call!23676)))

(declare-fun bm!23674 () Bool)

(declare-fun call!23680 () Bool)

(assert (=> bm!23674 (= call!23680 (contains!1822 lt!126107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251576 () Bool)

(declare-fun c!42347 () Bool)

(assert (=> b!251576 (= c!42347 (and (not (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!163159 () ListLongMap!3765)

(assert (=> b!251576 (= e!163156 e!163159)))

(declare-fun bm!23675 () Bool)

(assert (=> bm!23675 (= call!23679 call!23674)))

(declare-fun b!251577 () Bool)

(assert (=> b!251577 (= e!163159 call!23675)))

(declare-fun b!251578 () Bool)

(declare-fun lt!126105 () Unit!7781)

(assert (=> b!251578 (= e!163158 lt!126105)))

(declare-fun lt!126104 () ListLongMap!3765)

(declare-fun getCurrentListMapNoExtraKeys!564 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 32) Int) ListLongMap!3765)

(assert (=> b!251578 (= lt!126104 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(declare-fun lt!126103 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126113 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126113 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126106 () Unit!7781)

(declare-fun addStillContains!218 (ListLongMap!3765 (_ BitVec 64) V!8315 (_ BitVec 64)) Unit!7781)

(assert (=> b!251578 (= lt!126106 (addStillContains!218 lt!126104 lt!126103 (zeroValue!4487 thiss!1504) lt!126113))))

(assert (=> b!251578 (contains!1822 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))) lt!126113)))

(declare-fun lt!126112 () Unit!7781)

(assert (=> b!251578 (= lt!126112 lt!126106)))

(declare-fun lt!126109 () ListLongMap!3765)

(assert (=> b!251578 (= lt!126109 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(declare-fun lt!126110 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126110 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126117 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126117 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126114 () Unit!7781)

(declare-fun addApplyDifferent!218 (ListLongMap!3765 (_ BitVec 64) V!8315 (_ BitVec 64)) Unit!7781)

(assert (=> b!251578 (= lt!126114 (addApplyDifferent!218 lt!126109 lt!126110 (minValue!4487 thiss!1504) lt!126117))))

(assert (=> b!251578 (= (apply!242 (+!669 lt!126109 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))) lt!126117) (apply!242 lt!126109 lt!126117))))

(declare-fun lt!126119 () Unit!7781)

(assert (=> b!251578 (= lt!126119 lt!126114)))

(declare-fun lt!126101 () ListLongMap!3765)

(assert (=> b!251578 (= lt!126101 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(declare-fun lt!126111 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126116 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126116 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126115 () Unit!7781)

(assert (=> b!251578 (= lt!126115 (addApplyDifferent!218 lt!126101 lt!126111 (zeroValue!4487 thiss!1504) lt!126116))))

(assert (=> b!251578 (= (apply!242 (+!669 lt!126101 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))) lt!126116) (apply!242 lt!126101 lt!126116))))

(declare-fun lt!126118 () Unit!7781)

(assert (=> b!251578 (= lt!126118 lt!126115)))

(declare-fun lt!126121 () ListLongMap!3765)

(assert (=> b!251578 (= lt!126121 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(declare-fun lt!126120 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126102 () (_ BitVec 64))

(assert (=> b!251578 (= lt!126102 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251578 (= lt!126105 (addApplyDifferent!218 lt!126121 lt!126120 (minValue!4487 thiss!1504) lt!126102))))

(assert (=> b!251578 (= (apply!242 (+!669 lt!126121 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))) lt!126102) (apply!242 lt!126121 lt!126102))))

(declare-fun b!251579 () Bool)

(assert (=> b!251579 (= e!163160 e!163154)))

(declare-fun c!42343 () Bool)

(assert (=> b!251579 (= c!42343 (not (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!251580 () Bool)

(assert (=> b!251580 (= e!163157 (not call!23680))))

(declare-fun b!251581 () Bool)

(declare-fun res!123162 () Bool)

(assert (=> b!251581 (=> (not res!123162) (not e!163160))))

(declare-fun e!163151 () Bool)

(assert (=> b!251581 (= res!123162 e!163151)))

(declare-fun res!123160 () Bool)

(assert (=> b!251581 (=> res!123160 e!163151)))

(assert (=> b!251581 (= res!123160 (not e!163152))))

(declare-fun res!123163 () Bool)

(assert (=> b!251581 (=> (not res!123163) (not e!163152))))

(assert (=> b!251581 (= res!123163 (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251582 () Bool)

(assert (=> b!251582 (= e!163157 e!163153)))

(declare-fun res!123156 () Bool)

(assert (=> b!251582 (= res!123156 call!23680)))

(assert (=> b!251582 (=> (not res!123156) (not e!163153))))

(declare-fun b!251583 () Bool)

(declare-fun e!163149 () Bool)

(assert (=> b!251583 (= e!163151 e!163149)))

(declare-fun res!123158 () Bool)

(assert (=> b!251583 (=> (not res!123158) (not e!163149))))

(assert (=> b!251583 (= res!123158 (contains!1822 lt!126107 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251584 () Bool)

(declare-fun get!3006 (ValueCell!2907 V!8315) V!8315)

(declare-fun dynLambda!585 (Int (_ BitVec 64)) V!8315)

(assert (=> b!251584 (= e!163149 (= (apply!242 lt!126107 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)) (get!3006 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6188 (_values!4629 thiss!1504))))))

(assert (=> b!251584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun bm!23676 () Bool)

(assert (=> bm!23676 (= call!23678 call!23679)))

(declare-fun b!251585 () Bool)

(assert (=> b!251585 (= e!163150 e!163156)))

(assert (=> b!251585 (= c!42345 (and (not (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4383 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23677 () Bool)

(assert (=> bm!23677 (= call!23674 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(declare-fun b!251586 () Bool)

(assert (=> b!251586 (= e!163159 call!23678)))

(declare-fun b!251587 () Bool)

(assert (=> b!251587 (= e!163161 (= (apply!242 lt!126107 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4487 thiss!1504)))))

(declare-fun b!251588 () Bool)

(assert (=> b!251588 (= e!163150 (+!669 call!23676 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))

(assert (= (and d!61141 c!42346) b!251588))

(assert (= (and d!61141 (not c!42346)) b!251585))

(assert (= (and b!251585 c!42345) b!251568))

(assert (= (and b!251585 (not c!42345)) b!251576))

(assert (= (and b!251576 c!42347) b!251577))

(assert (= (and b!251576 (not c!42347)) b!251586))

(assert (= (or b!251577 b!251586) bm!23676))

(assert (= (or b!251568 bm!23676) bm!23675))

(assert (= (or b!251568 b!251577) bm!23673))

(assert (= (or b!251588 bm!23675) bm!23677))

(assert (= (or b!251588 bm!23673) bm!23672))

(assert (= (and d!61141 res!123157) b!251571))

(assert (= (and d!61141 c!42342) b!251578))

(assert (= (and d!61141 (not c!42342)) b!251573))

(assert (= (and d!61141 res!123161) b!251581))

(assert (= (and b!251581 res!123163) b!251572))

(assert (= (and b!251581 (not res!123160)) b!251583))

(assert (= (and b!251583 res!123158) b!251584))

(assert (= (and b!251581 res!123162) b!251569))

(assert (= (and b!251569 c!42344) b!251582))

(assert (= (and b!251569 (not c!42344)) b!251580))

(assert (= (and b!251582 res!123156) b!251575))

(assert (= (or b!251582 b!251580) bm!23674))

(assert (= (and b!251569 res!123155) b!251579))

(assert (= (and b!251579 c!42343) b!251570))

(assert (= (and b!251579 (not c!42343)) b!251574))

(assert (= (and b!251570 res!123159) b!251587))

(assert (= (or b!251570 b!251574) bm!23671))

(declare-fun b_lambda!8103 () Bool)

(assert (=> (not b_lambda!8103) (not b!251584)))

(declare-fun t!8774 () Bool)

(declare-fun tb!2997 () Bool)

(assert (=> (and b!251415 (= (defaultEntry!4646 thiss!1504) (defaultEntry!4646 thiss!1504)) t!8774) tb!2997))

(declare-fun result!5313 () Bool)

(assert (=> tb!2997 (= result!5313 tp_is_empty!6501)))

(assert (=> b!251584 t!8774))

(declare-fun b_and!13671 () Bool)

(assert (= b_and!13667 (and (=> t!8774 result!5313) b_and!13671)))

(declare-fun m!267819 () Bool)

(assert (=> b!251583 m!267819))

(assert (=> b!251583 m!267819))

(declare-fun m!267821 () Bool)

(assert (=> b!251583 m!267821))

(declare-fun m!267823 () Bool)

(assert (=> bm!23672 m!267823))

(declare-fun m!267825 () Bool)

(assert (=> bm!23671 m!267825))

(declare-fun m!267827 () Bool)

(assert (=> b!251588 m!267827))

(declare-fun m!267829 () Bool)

(assert (=> b!251587 m!267829))

(declare-fun m!267831 () Bool)

(assert (=> bm!23677 m!267831))

(assert (=> d!61141 m!267707))

(declare-fun m!267833 () Bool)

(assert (=> b!251578 m!267833))

(declare-fun m!267835 () Bool)

(assert (=> b!251578 m!267835))

(declare-fun m!267837 () Bool)

(assert (=> b!251578 m!267837))

(assert (=> b!251578 m!267831))

(declare-fun m!267839 () Bool)

(assert (=> b!251578 m!267839))

(declare-fun m!267841 () Bool)

(assert (=> b!251578 m!267841))

(declare-fun m!267843 () Bool)

(assert (=> b!251578 m!267843))

(declare-fun m!267845 () Bool)

(assert (=> b!251578 m!267845))

(declare-fun m!267847 () Bool)

(assert (=> b!251578 m!267847))

(declare-fun m!267849 () Bool)

(assert (=> b!251578 m!267849))

(assert (=> b!251578 m!267841))

(declare-fun m!267851 () Bool)

(assert (=> b!251578 m!267851))

(declare-fun m!267853 () Bool)

(assert (=> b!251578 m!267853))

(declare-fun m!267855 () Bool)

(assert (=> b!251578 m!267855))

(assert (=> b!251578 m!267853))

(assert (=> b!251578 m!267819))

(declare-fun m!267857 () Bool)

(assert (=> b!251578 m!267857))

(assert (=> b!251578 m!267845))

(declare-fun m!267859 () Bool)

(assert (=> b!251578 m!267859))

(assert (=> b!251578 m!267833))

(declare-fun m!267861 () Bool)

(assert (=> b!251578 m!267861))

(assert (=> b!251572 m!267819))

(assert (=> b!251572 m!267819))

(declare-fun m!267863 () Bool)

(assert (=> b!251572 m!267863))

(declare-fun m!267865 () Bool)

(assert (=> bm!23674 m!267865))

(assert (=> b!251571 m!267819))

(assert (=> b!251571 m!267819))

(assert (=> b!251571 m!267863))

(declare-fun m!267867 () Bool)

(assert (=> b!251575 m!267867))

(declare-fun m!267869 () Bool)

(assert (=> b!251584 m!267869))

(declare-fun m!267871 () Bool)

(assert (=> b!251584 m!267871))

(declare-fun m!267873 () Bool)

(assert (=> b!251584 m!267873))

(assert (=> b!251584 m!267869))

(assert (=> b!251584 m!267819))

(declare-fun m!267875 () Bool)

(assert (=> b!251584 m!267875))

(assert (=> b!251584 m!267819))

(assert (=> b!251584 m!267871))

(assert (=> b!251412 d!61141))

(declare-fun d!61143 () Bool)

(declare-fun res!123168 () Bool)

(declare-fun e!163166 () Bool)

(assert (=> d!61143 (=> res!123168 e!163166)))

(assert (=> d!61143 (= res!123168 (= (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61143 (= (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 #b00000000000000000000000000000000) e!163166)))

(declare-fun b!251595 () Bool)

(declare-fun e!163167 () Bool)

(assert (=> b!251595 (= e!163166 e!163167)))

(declare-fun res!123169 () Bool)

(assert (=> b!251595 (=> (not res!123169) (not e!163167))))

(assert (=> b!251595 (= res!123169 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251596 () Bool)

(assert (=> b!251596 (= e!163167 (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61143 (not res!123168)) b!251595))

(assert (= (and b!251595 res!123169) b!251596))

(assert (=> d!61143 m!267819))

(declare-fun m!267877 () Bool)

(assert (=> b!251596 m!267877))

(assert (=> bm!23649 d!61143))

(declare-fun b!251607 () Bool)

(declare-fun e!163173 () Bool)

(assert (=> b!251607 (= e!163173 (bvslt (size!6189 (_keys!6788 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!251608 () Bool)

(declare-fun e!163172 () Bool)

(assert (=> b!251608 (= e!163172 (= (arrayCountValidKeys!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!251606 () Bool)

(declare-fun res!123178 () Bool)

(assert (=> b!251606 (=> (not res!123178) (not e!163173))))

(assert (=> b!251606 (= res!123178 (validKeyInArray!0 key!932))))

(declare-fun d!61145 () Bool)

(assert (=> d!61145 e!163172))

(declare-fun res!123181 () Bool)

(assert (=> d!61145 (=> (not res!123181) (not e!163172))))

(assert (=> d!61145 (= res!123181 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6189 (_keys!6788 thiss!1504)))))))

(declare-fun lt!126124 () Unit!7781)

(declare-fun choose!1 (array!12325 (_ BitVec 32) (_ BitVec 64)) Unit!7781)

(assert (=> d!61145 (= lt!126124 (choose!1 (_keys!6788 thiss!1504) index!297 key!932))))

(assert (=> d!61145 e!163173))

(declare-fun res!123179 () Bool)

(assert (=> d!61145 (=> (not res!123179) (not e!163173))))

(assert (=> d!61145 (= res!123179 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6189 (_keys!6788 thiss!1504)))))))

(assert (=> d!61145 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6788 thiss!1504) index!297 key!932) lt!126124)))

(declare-fun b!251605 () Bool)

(declare-fun res!123180 () Bool)

(assert (=> b!251605 (=> (not res!123180) (not e!163173))))

(assert (=> b!251605 (= res!123180 (not (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) index!297))))))

(assert (= (and d!61145 res!123179) b!251605))

(assert (= (and b!251605 res!123180) b!251606))

(assert (= (and b!251606 res!123178) b!251607))

(assert (= (and d!61145 res!123181) b!251608))

(assert (=> b!251608 m!267717))

(declare-fun m!267879 () Bool)

(assert (=> b!251608 m!267879))

(assert (=> b!251608 m!267719))

(declare-fun m!267881 () Bool)

(assert (=> b!251606 m!267881))

(declare-fun m!267883 () Bool)

(assert (=> d!61145 m!267883))

(declare-fun m!267885 () Bool)

(assert (=> b!251605 m!267885))

(assert (=> b!251605 m!267885))

(declare-fun m!267887 () Bool)

(assert (=> b!251605 m!267887))

(assert (=> b!251426 d!61145))

(declare-fun d!61147 () Bool)

(declare-fun lt!126127 () (_ BitVec 32))

(assert (=> d!61147 (and (bvsge lt!126127 #b00000000000000000000000000000000) (bvsle lt!126127 (bvsub (size!6189 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!163178 () (_ BitVec 32))

(assert (=> d!61147 (= lt!126127 e!163178)))

(declare-fun c!42352 () Bool)

(assert (=> d!61147 (= c!42352 (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61147 (and (bvsle #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6189 (_keys!6788 thiss!1504)) (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61147 (= (arrayCountValidKeys!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) lt!126127)))

(declare-fun bm!23680 () Bool)

(declare-fun call!23683 () (_ BitVec 32))

(assert (=> bm!23680 (= call!23683 (arrayCountValidKeys!0 (_keys!6788 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251617 () Bool)

(declare-fun e!163179 () (_ BitVec 32))

(assert (=> b!251617 (= e!163179 (bvadd #b00000000000000000000000000000001 call!23683))))

(declare-fun b!251618 () Bool)

(assert (=> b!251618 (= e!163178 e!163179)))

(declare-fun c!42353 () Bool)

(assert (=> b!251618 (= c!42353 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251619 () Bool)

(assert (=> b!251619 (= e!163178 #b00000000000000000000000000000000)))

(declare-fun b!251620 () Bool)

(assert (=> b!251620 (= e!163179 call!23683)))

(assert (= (and d!61147 c!42352) b!251619))

(assert (= (and d!61147 (not c!42352)) b!251618))

(assert (= (and b!251618 c!42353) b!251617))

(assert (= (and b!251618 (not c!42353)) b!251620))

(assert (= (or b!251617 b!251620) bm!23680))

(declare-fun m!267889 () Bool)

(assert (=> bm!23680 m!267889))

(assert (=> b!251618 m!267819))

(assert (=> b!251618 m!267819))

(assert (=> b!251618 m!267863))

(assert (=> b!251426 d!61147))

(declare-fun d!61149 () Bool)

(assert (=> d!61149 (= (validMask!0 (mask!10847 thiss!1504)) (and (or (= (mask!10847 thiss!1504) #b00000000000000000000000000000111) (= (mask!10847 thiss!1504) #b00000000000000000000000000001111) (= (mask!10847 thiss!1504) #b00000000000000000000000000011111) (= (mask!10847 thiss!1504) #b00000000000000000000000000111111) (= (mask!10847 thiss!1504) #b00000000000000000000000001111111) (= (mask!10847 thiss!1504) #b00000000000000000000000011111111) (= (mask!10847 thiss!1504) #b00000000000000000000000111111111) (= (mask!10847 thiss!1504) #b00000000000000000000001111111111) (= (mask!10847 thiss!1504) #b00000000000000000000011111111111) (= (mask!10847 thiss!1504) #b00000000000000000000111111111111) (= (mask!10847 thiss!1504) #b00000000000000000001111111111111) (= (mask!10847 thiss!1504) #b00000000000000000011111111111111) (= (mask!10847 thiss!1504) #b00000000000000000111111111111111) (= (mask!10847 thiss!1504) #b00000000000000001111111111111111) (= (mask!10847 thiss!1504) #b00000000000000011111111111111111) (= (mask!10847 thiss!1504) #b00000000000000111111111111111111) (= (mask!10847 thiss!1504) #b00000000000001111111111111111111) (= (mask!10847 thiss!1504) #b00000000000011111111111111111111) (= (mask!10847 thiss!1504) #b00000000000111111111111111111111) (= (mask!10847 thiss!1504) #b00000000001111111111111111111111) (= (mask!10847 thiss!1504) #b00000000011111111111111111111111) (= (mask!10847 thiss!1504) #b00000000111111111111111111111111) (= (mask!10847 thiss!1504) #b00000001111111111111111111111111) (= (mask!10847 thiss!1504) #b00000011111111111111111111111111) (= (mask!10847 thiss!1504) #b00000111111111111111111111111111) (= (mask!10847 thiss!1504) #b00001111111111111111111111111111) (= (mask!10847 thiss!1504) #b00011111111111111111111111111111) (= (mask!10847 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10847 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!251426 d!61149))

(declare-fun d!61151 () Bool)

(declare-fun res!123186 () Bool)

(declare-fun e!163186 () Bool)

(assert (=> d!61151 (=> res!123186 e!163186)))

(assert (=> d!61151 (= res!123186 (bvsge #b00000000000000000000000000000000 (size!6189 lt!125995)))))

(assert (=> d!61151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125995 (mask!10847 thiss!1504)) e!163186)))

(declare-fun b!251629 () Bool)

(declare-fun e!163188 () Bool)

(assert (=> b!251629 (= e!163186 e!163188)))

(declare-fun c!42356 () Bool)

(assert (=> b!251629 (= c!42356 (validKeyInArray!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun b!251630 () Bool)

(declare-fun call!23686 () Bool)

(assert (=> b!251630 (= e!163188 call!23686)))

(declare-fun bm!23683 () Bool)

(assert (=> bm!23683 (= call!23686 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125995 (mask!10847 thiss!1504)))))

(declare-fun b!251631 () Bool)

(declare-fun e!163187 () Bool)

(assert (=> b!251631 (= e!163187 call!23686)))

(declare-fun b!251632 () Bool)

(assert (=> b!251632 (= e!163188 e!163187)))

(declare-fun lt!126134 () (_ BitVec 64))

(assert (=> b!251632 (= lt!126134 (select (arr!5843 lt!125995) #b00000000000000000000000000000000))))

(declare-fun lt!126135 () Unit!7781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12325 (_ BitVec 64) (_ BitVec 32)) Unit!7781)

(assert (=> b!251632 (= lt!126135 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125995 lt!126134 #b00000000000000000000000000000000))))

(assert (=> b!251632 (arrayContainsKey!0 lt!125995 lt!126134 #b00000000000000000000000000000000)))

(declare-fun lt!126136 () Unit!7781)

(assert (=> b!251632 (= lt!126136 lt!126135)))

(declare-fun res!123187 () Bool)

(assert (=> b!251632 (= res!123187 (= (seekEntryOrOpen!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) lt!125995 (mask!10847 thiss!1504)) (Found!1127 #b00000000000000000000000000000000)))))

(assert (=> b!251632 (=> (not res!123187) (not e!163187))))

(assert (= (and d!61151 (not res!123186)) b!251629))

(assert (= (and b!251629 c!42356) b!251632))

(assert (= (and b!251629 (not c!42356)) b!251630))

(assert (= (and b!251632 res!123187) b!251631))

(assert (= (or b!251631 b!251630) bm!23683))

(declare-fun m!267891 () Bool)

(assert (=> b!251629 m!267891))

(assert (=> b!251629 m!267891))

(declare-fun m!267893 () Bool)

(assert (=> b!251629 m!267893))

(declare-fun m!267895 () Bool)

(assert (=> bm!23683 m!267895))

(assert (=> b!251632 m!267891))

(declare-fun m!267897 () Bool)

(assert (=> b!251632 m!267897))

(declare-fun m!267899 () Bool)

(assert (=> b!251632 m!267899))

(assert (=> b!251632 m!267891))

(declare-fun m!267901 () Bool)

(assert (=> b!251632 m!267901))

(assert (=> b!251426 d!61151))

(declare-fun d!61153 () Bool)

(declare-fun lt!126137 () (_ BitVec 32))

(assert (=> d!61153 (and (bvsge lt!126137 #b00000000000000000000000000000000) (bvsle lt!126137 (bvsub (size!6189 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun e!163189 () (_ BitVec 32))

(assert (=> d!61153 (= lt!126137 e!163189)))

(declare-fun c!42357 () Bool)

(assert (=> d!61153 (= c!42357 (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61153 (and (bvsle #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6189 (_keys!6788 thiss!1504)) (size!6189 lt!125995)))))

(assert (=> d!61153 (= (arrayCountValidKeys!0 lt!125995 #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) lt!126137)))

(declare-fun bm!23684 () Bool)

(declare-fun call!23687 () (_ BitVec 32))

(assert (=> bm!23684 (= call!23687 (arrayCountValidKeys!0 lt!125995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251633 () Bool)

(declare-fun e!163190 () (_ BitVec 32))

(assert (=> b!251633 (= e!163190 (bvadd #b00000000000000000000000000000001 call!23687))))

(declare-fun b!251634 () Bool)

(assert (=> b!251634 (= e!163189 e!163190)))

(declare-fun c!42358 () Bool)

(assert (=> b!251634 (= c!42358 (validKeyInArray!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun b!251635 () Bool)

(assert (=> b!251635 (= e!163189 #b00000000000000000000000000000000)))

(declare-fun b!251636 () Bool)

(assert (=> b!251636 (= e!163190 call!23687)))

(assert (= (and d!61153 c!42357) b!251635))

(assert (= (and d!61153 (not c!42357)) b!251634))

(assert (= (and b!251634 c!42358) b!251633))

(assert (= (and b!251634 (not c!42358)) b!251636))

(assert (= (or b!251633 b!251636) bm!23684))

(declare-fun m!267903 () Bool)

(assert (=> bm!23684 m!267903))

(assert (=> b!251634 m!267891))

(assert (=> b!251634 m!267891))

(assert (=> b!251634 m!267893))

(assert (=> b!251426 d!61153))

(declare-fun bm!23687 () Bool)

(declare-fun call!23690 () Bool)

(declare-fun c!42361 () Bool)

(assert (=> bm!23687 (= call!23690 (arrayNoDuplicates!0 lt!125995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42361 (Cons!3729 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) Nil!3730) Nil!3730)))))

(declare-fun d!61155 () Bool)

(declare-fun res!123194 () Bool)

(declare-fun e!163200 () Bool)

(assert (=> d!61155 (=> res!123194 e!163200)))

(assert (=> d!61155 (= res!123194 (bvsge #b00000000000000000000000000000000 (size!6189 lt!125995)))))

(assert (=> d!61155 (= (arrayNoDuplicates!0 lt!125995 #b00000000000000000000000000000000 Nil!3730) e!163200)))

(declare-fun b!251647 () Bool)

(declare-fun e!163199 () Bool)

(declare-fun contains!1824 (List!3733 (_ BitVec 64)) Bool)

(assert (=> b!251647 (= e!163199 (contains!1824 Nil!3730 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun b!251648 () Bool)

(declare-fun e!163201 () Bool)

(assert (=> b!251648 (= e!163201 call!23690)))

(declare-fun b!251649 () Bool)

(declare-fun e!163202 () Bool)

(assert (=> b!251649 (= e!163202 e!163201)))

(assert (=> b!251649 (= c!42361 (validKeyInArray!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun b!251650 () Bool)

(assert (=> b!251650 (= e!163201 call!23690)))

(declare-fun b!251651 () Bool)

(assert (=> b!251651 (= e!163200 e!163202)))

(declare-fun res!123196 () Bool)

(assert (=> b!251651 (=> (not res!123196) (not e!163202))))

(assert (=> b!251651 (= res!123196 (not e!163199))))

(declare-fun res!123195 () Bool)

(assert (=> b!251651 (=> (not res!123195) (not e!163199))))

(assert (=> b!251651 (= res!123195 (validKeyInArray!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(assert (= (and d!61155 (not res!123194)) b!251651))

(assert (= (and b!251651 res!123195) b!251647))

(assert (= (and b!251651 res!123196) b!251649))

(assert (= (and b!251649 c!42361) b!251648))

(assert (= (and b!251649 (not c!42361)) b!251650))

(assert (= (or b!251648 b!251650) bm!23687))

(assert (=> bm!23687 m!267891))

(declare-fun m!267905 () Bool)

(assert (=> bm!23687 m!267905))

(assert (=> b!251647 m!267891))

(assert (=> b!251647 m!267891))

(declare-fun m!267907 () Bool)

(assert (=> b!251647 m!267907))

(assert (=> b!251649 m!267891))

(assert (=> b!251649 m!267891))

(assert (=> b!251649 m!267893))

(assert (=> b!251651 m!267891))

(assert (=> b!251651 m!267891))

(assert (=> b!251651 m!267893))

(assert (=> b!251426 d!61155))

(declare-fun d!61157 () Bool)

(declare-fun e!163205 () Bool)

(assert (=> d!61157 e!163205))

(declare-fun res!123199 () Bool)

(assert (=> d!61157 (=> (not res!123199) (not e!163205))))

(assert (=> d!61157 (= res!123199 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6189 (_keys!6788 thiss!1504)))))))

(declare-fun lt!126140 () Unit!7781)

(declare-fun choose!41 (array!12325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3733) Unit!7781)

(assert (=> d!61157 (= lt!126140 (choose!41 (_keys!6788 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730))))

(assert (=> d!61157 (bvslt (size!6189 (_keys!6788 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61157 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6788 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730) lt!126140)))

(declare-fun b!251654 () Bool)

(assert (=> b!251654 (= e!163205 (arrayNoDuplicates!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000000 Nil!3730))))

(assert (= (and d!61157 res!123199) b!251654))

(declare-fun m!267909 () Bool)

(assert (=> d!61157 m!267909))

(assert (=> b!251654 m!267717))

(declare-fun m!267911 () Bool)

(assert (=> b!251654 m!267911))

(assert (=> b!251426 d!61157))

(assert (=> b!251426 d!61143))

(declare-fun d!61159 () Bool)

(declare-fun e!163208 () Bool)

(assert (=> d!61159 e!163208))

(declare-fun res!123202 () Bool)

(assert (=> d!61159 (=> (not res!123202) (not e!163208))))

(assert (=> d!61159 (= res!123202 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6189 (_keys!6788 thiss!1504)))))))

(declare-fun lt!126143 () Unit!7781)

(declare-fun choose!102 ((_ BitVec 64) array!12325 (_ BitVec 32) (_ BitVec 32)) Unit!7781)

(assert (=> d!61159 (= lt!126143 (choose!102 key!932 (_keys!6788 thiss!1504) index!297 (mask!10847 thiss!1504)))))

(assert (=> d!61159 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61159 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) index!297 (mask!10847 thiss!1504)) lt!126143)))

(declare-fun b!251657 () Bool)

(assert (=> b!251657 (= e!163208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (mask!10847 thiss!1504)))))

(assert (= (and d!61159 res!123202) b!251657))

(declare-fun m!267913 () Bool)

(assert (=> d!61159 m!267913))

(assert (=> d!61159 m!267707))

(assert (=> b!251657 m!267717))

(declare-fun m!267915 () Bool)

(assert (=> b!251657 m!267915))

(assert (=> b!251426 d!61159))

(declare-fun b!251674 () Bool)

(declare-fun e!163219 () Bool)

(declare-fun e!163218 () Bool)

(assert (=> b!251674 (= e!163219 e!163218)))

(declare-fun c!42367 () Bool)

(declare-fun lt!126148 () SeekEntryResult!1127)

(assert (=> b!251674 (= c!42367 ((_ is MissingVacant!1127) lt!126148))))

(declare-fun b!251675 () Bool)

(declare-fun e!163217 () Bool)

(declare-fun call!23696 () Bool)

(assert (=> b!251675 (= e!163217 (not call!23696))))

(declare-fun b!251676 () Bool)

(declare-fun res!123213 () Bool)

(declare-fun e!163220 () Bool)

(assert (=> b!251676 (=> (not res!123213) (not e!163220))))

(declare-fun call!23695 () Bool)

(assert (=> b!251676 (= res!123213 call!23695)))

(assert (=> b!251676 (= e!163218 e!163220)))

(declare-fun b!251677 () Bool)

(assert (=> b!251677 (= e!163219 e!163217)))

(declare-fun res!123211 () Bool)

(assert (=> b!251677 (= res!123211 call!23695)))

(assert (=> b!251677 (=> (not res!123211) (not e!163217))))

(declare-fun d!61161 () Bool)

(assert (=> d!61161 e!163219))

(declare-fun c!42366 () Bool)

(assert (=> d!61161 (= c!42366 ((_ is MissingZero!1127) lt!126148))))

(assert (=> d!61161 (= lt!126148 (seekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun lt!126149 () Unit!7781)

(declare-fun choose!1195 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 64) Int) Unit!7781)

(assert (=> d!61161 (= lt!126149 (choose!1195 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)))))

(assert (=> d!61161 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61161 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!405 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)) lt!126149)))

(declare-fun bm!23692 () Bool)

(assert (=> bm!23692 (= call!23695 (inRange!0 (ite c!42366 (index!6678 lt!126148) (index!6681 lt!126148)) (mask!10847 thiss!1504)))))

(declare-fun b!251678 () Bool)

(declare-fun res!123212 () Bool)

(assert (=> b!251678 (=> (not res!123212) (not e!163220))))

(assert (=> b!251678 (= res!123212 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6681 lt!126148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251678 (and (bvsge (index!6681 lt!126148) #b00000000000000000000000000000000) (bvslt (index!6681 lt!126148) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun bm!23693 () Bool)

(assert (=> bm!23693 (= call!23696 (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251679 () Bool)

(assert (=> b!251679 (and (bvsge (index!6678 lt!126148) #b00000000000000000000000000000000) (bvslt (index!6678 lt!126148) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun res!123214 () Bool)

(assert (=> b!251679 (= res!123214 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6678 lt!126148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251679 (=> (not res!123214) (not e!163217))))

(declare-fun b!251680 () Bool)

(assert (=> b!251680 (= e!163218 ((_ is Undefined!1127) lt!126148))))

(declare-fun b!251681 () Bool)

(assert (=> b!251681 (= e!163220 (not call!23696))))

(assert (= (and d!61161 c!42366) b!251677))

(assert (= (and d!61161 (not c!42366)) b!251674))

(assert (= (and b!251677 res!123211) b!251679))

(assert (= (and b!251679 res!123214) b!251675))

(assert (= (and b!251674 c!42367) b!251676))

(assert (= (and b!251674 (not c!42367)) b!251680))

(assert (= (and b!251676 res!123213) b!251678))

(assert (= (and b!251678 res!123212) b!251681))

(assert (= (or b!251677 b!251676) bm!23692))

(assert (= (or b!251675 b!251681) bm!23693))

(assert (=> d!61161 m!267735))

(declare-fun m!267917 () Bool)

(assert (=> d!61161 m!267917))

(assert (=> d!61161 m!267707))

(assert (=> bm!23693 m!267725))

(declare-fun m!267919 () Bool)

(assert (=> b!251679 m!267919))

(declare-fun m!267921 () Bool)

(assert (=> b!251678 m!267921))

(declare-fun m!267923 () Bool)

(assert (=> bm!23692 m!267923))

(assert (=> b!251414 d!61161))

(declare-fun d!61163 () Bool)

(assert (=> d!61163 (= (array_inv!3859 (_keys!6788 thiss!1504)) (bvsge (size!6189 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251415 d!61163))

(declare-fun d!61165 () Bool)

(assert (=> d!61165 (= (array_inv!3860 (_values!4629 thiss!1504)) (bvsge (size!6188 (_values!4629 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251415 d!61165))

(declare-fun d!61167 () Bool)

(assert (=> d!61167 (contains!1822 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) key!932)))

(declare-fun lt!126152 () Unit!7781)

(declare-fun choose!1196 (array!12325 array!12323 (_ BitVec 32) (_ BitVec 32) V!8315 V!8315 (_ BitVec 64) (_ BitVec 32) Int) Unit!7781)

(assert (=> d!61167 (= lt!126152 (choose!1196 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))

(assert (=> d!61167 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61167 (= (lemmaArrayContainsKeyThenInListMap!205 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) lt!126152)))

(declare-fun bs!9007 () Bool)

(assert (= bs!9007 d!61167))

(assert (=> bs!9007 m!267739))

(assert (=> bs!9007 m!267739))

(assert (=> bs!9007 m!267741))

(declare-fun m!267925 () Bool)

(assert (=> bs!9007 m!267925))

(assert (=> bs!9007 m!267707))

(assert (=> b!251419 d!61167))

(declare-fun d!61169 () Bool)

(declare-fun res!123221 () Bool)

(declare-fun e!163223 () Bool)

(assert (=> d!61169 (=> (not res!123221) (not e!163223))))

(declare-fun simpleValid!265 (LongMapFixedSize!3714) Bool)

(assert (=> d!61169 (= res!123221 (simpleValid!265 thiss!1504))))

(assert (=> d!61169 (= (valid!1452 thiss!1504) e!163223)))

(declare-fun b!251688 () Bool)

(declare-fun res!123222 () Bool)

(assert (=> b!251688 (=> (not res!123222) (not e!163223))))

(assert (=> b!251688 (= res!123222 (= (arrayCountValidKeys!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (_size!1906 thiss!1504)))))

(declare-fun b!251689 () Bool)

(declare-fun res!123223 () Bool)

(assert (=> b!251689 (=> (not res!123223) (not e!163223))))

(assert (=> b!251689 (= res!123223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun b!251690 () Bool)

(assert (=> b!251690 (= e!163223 (arrayNoDuplicates!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 Nil!3730))))

(assert (= (and d!61169 res!123221) b!251688))

(assert (= (and b!251688 res!123222) b!251689))

(assert (= (and b!251689 res!123223) b!251690))

(declare-fun m!267927 () Bool)

(assert (=> d!61169 m!267927))

(assert (=> b!251688 m!267719))

(declare-fun m!267929 () Bool)

(assert (=> b!251689 m!267929))

(declare-fun m!267931 () Bool)

(assert (=> b!251690 m!267931))

(assert (=> start!24010 d!61169))

(declare-fun d!61171 () Bool)

(assert (=> d!61171 (= (inRange!0 (ite c!42303 (index!6678 lt!125994) (index!6681 lt!125994)) (mask!10847 thiss!1504)) (and (bvsge (ite c!42303 (index!6678 lt!125994) (index!6681 lt!125994)) #b00000000000000000000000000000000) (bvslt (ite c!42303 (index!6678 lt!125994) (index!6681 lt!125994)) (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23650 d!61171))

(declare-fun b!251698 () Bool)

(declare-fun e!163229 () Bool)

(assert (=> b!251698 (= e!163229 tp_is_empty!6501)))

(declare-fun mapIsEmpty!11057 () Bool)

(declare-fun mapRes!11057 () Bool)

(assert (=> mapIsEmpty!11057 mapRes!11057))

(declare-fun mapNonEmpty!11057 () Bool)

(declare-fun tp!23198 () Bool)

(declare-fun e!163228 () Bool)

(assert (=> mapNonEmpty!11057 (= mapRes!11057 (and tp!23198 e!163228))))

(declare-fun mapKey!11057 () (_ BitVec 32))

(declare-fun mapRest!11057 () (Array (_ BitVec 32) ValueCell!2907))

(declare-fun mapValue!11057 () ValueCell!2907)

(assert (=> mapNonEmpty!11057 (= mapRest!11051 (store mapRest!11057 mapKey!11057 mapValue!11057))))

(declare-fun b!251697 () Bool)

(assert (=> b!251697 (= e!163228 tp_is_empty!6501)))

(declare-fun condMapEmpty!11057 () Bool)

(declare-fun mapDefault!11057 () ValueCell!2907)

(assert (=> mapNonEmpty!11051 (= condMapEmpty!11057 (= mapRest!11051 ((as const (Array (_ BitVec 32) ValueCell!2907)) mapDefault!11057)))))

(assert (=> mapNonEmpty!11051 (= tp!23188 (and e!163229 mapRes!11057))))

(assert (= (and mapNonEmpty!11051 condMapEmpty!11057) mapIsEmpty!11057))

(assert (= (and mapNonEmpty!11051 (not condMapEmpty!11057)) mapNonEmpty!11057))

(assert (= (and mapNonEmpty!11057 ((_ is ValueCellFull!2907) mapValue!11057)) b!251697))

(assert (= (and mapNonEmpty!11051 ((_ is ValueCellFull!2907) mapDefault!11057)) b!251698))

(declare-fun m!267933 () Bool)

(assert (=> mapNonEmpty!11057 m!267933))

(declare-fun b_lambda!8105 () Bool)

(assert (= b_lambda!8103 (or (and b!251415 b_free!6639) b_lambda!8105)))

(check-sat (not b!251515) (not bm!23672) (not d!61167) (not b!251647) (not bm!23671) (not b!251606) (not b!251632) (not b!251651) (not b!251629) (not b!251657) (not b!251634) (not bm!23693) (not mapNonEmpty!11057) (not b!251649) (not d!61145) (not d!61159) (not b!251588) (not d!61161) (not bm!23680) (not b_lambda!8105) (not b!251572) (not b!251605) (not b!251689) (not b!251523) b_and!13671 (not bm!23692) (not b!251508) (not b!251571) (not d!61135) (not bm!23687) (not d!61133) (not b!251587) (not b!251690) (not d!61139) (not b!251596) (not b!251575) (not bm!23683) (not b_next!6639) (not bm!23684) (not b!251654) (not b!251584) (not b!251618) (not bm!23674) (not b!251578) (not bm!23677) (not d!61157) (not d!61169) (not b!251608) (not b!251583) tp_is_empty!6501 (not b!251525) (not d!61141) (not b!251688))
(check-sat b_and!13671 (not b_next!6639))
(get-model)

(declare-fun b!251708 () Bool)

(declare-fun res!123233 () Bool)

(declare-fun e!163232 () Bool)

(assert (=> b!251708 (=> (not res!123233) (not e!163232))))

(declare-fun size!6192 (LongMapFixedSize!3714) (_ BitVec 32))

(assert (=> b!251708 (= res!123233 (bvsge (size!6192 thiss!1504) (_size!1906 thiss!1504)))))

(declare-fun b!251710 () Bool)

(assert (=> b!251710 (= e!163232 (and (bvsge (extraKeys!4383 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4383 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1906 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!251707 () Bool)

(declare-fun res!123235 () Bool)

(assert (=> b!251707 (=> (not res!123235) (not e!163232))))

(assert (=> b!251707 (= res!123235 (and (= (size!6188 (_values!4629 thiss!1504)) (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001)) (= (size!6189 (_keys!6788 thiss!1504)) (size!6188 (_values!4629 thiss!1504))) (bvsge (_size!1906 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1906 thiss!1504) (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!61173 () Bool)

(declare-fun res!123232 () Bool)

(assert (=> d!61173 (=> (not res!123232) (not e!163232))))

(assert (=> d!61173 (= res!123232 (validMask!0 (mask!10847 thiss!1504)))))

(assert (=> d!61173 (= (simpleValid!265 thiss!1504) e!163232)))

(declare-fun b!251709 () Bool)

(declare-fun res!123234 () Bool)

(assert (=> b!251709 (=> (not res!123234) (not e!163232))))

(assert (=> b!251709 (= res!123234 (= (size!6192 thiss!1504) (bvadd (_size!1906 thiss!1504) (bvsdiv (bvadd (extraKeys!4383 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!61173 res!123232) b!251707))

(assert (= (and b!251707 res!123235) b!251708))

(assert (= (and b!251708 res!123233) b!251709))

(assert (= (and b!251709 res!123234) b!251710))

(declare-fun m!267935 () Bool)

(assert (=> b!251708 m!267935))

(assert (=> d!61173 m!267707))

(assert (=> b!251709 m!267935))

(assert (=> d!61169 d!61173))

(declare-fun d!61175 () Bool)

(assert (=> d!61175 (= (inRange!0 (ite c!42366 (index!6678 lt!126148) (index!6681 lt!126148)) (mask!10847 thiss!1504)) (and (bvsge (ite c!42366 (index!6678 lt!126148) (index!6681 lt!126148)) #b00000000000000000000000000000000) (bvslt (ite c!42366 (index!6678 lt!126148) (index!6681 lt!126148)) (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23692 d!61175))

(declare-fun call!23697 () Bool)

(declare-fun c!42368 () Bool)

(declare-fun bm!23694 () Bool)

(assert (=> bm!23694 (= call!23697 (arrayNoDuplicates!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42368 (Cons!3729 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000) Nil!3730) Nil!3730)))))

(declare-fun d!61177 () Bool)

(declare-fun res!123236 () Bool)

(declare-fun e!163234 () Bool)

(assert (=> d!61177 (=> res!123236 e!163234)))

(assert (=> d!61177 (= res!123236 (bvsge #b00000000000000000000000000000000 (size!6189 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))))))))

(assert (=> d!61177 (= (arrayNoDuplicates!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000000 Nil!3730) e!163234)))

(declare-fun b!251711 () Bool)

(declare-fun e!163233 () Bool)

(assert (=> b!251711 (= e!163233 (contains!1824 Nil!3730 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251712 () Bool)

(declare-fun e!163235 () Bool)

(assert (=> b!251712 (= e!163235 call!23697)))

(declare-fun b!251713 () Bool)

(declare-fun e!163236 () Bool)

(assert (=> b!251713 (= e!163236 e!163235)))

(assert (=> b!251713 (= c!42368 (validKeyInArray!0 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251714 () Bool)

(assert (=> b!251714 (= e!163235 call!23697)))

(declare-fun b!251715 () Bool)

(assert (=> b!251715 (= e!163234 e!163236)))

(declare-fun res!123238 () Bool)

(assert (=> b!251715 (=> (not res!123238) (not e!163236))))

(assert (=> b!251715 (= res!123238 (not e!163233))))

(declare-fun res!123237 () Bool)

(assert (=> b!251715 (=> (not res!123237) (not e!163233))))

(assert (=> b!251715 (= res!123237 (validKeyInArray!0 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!61177 (not res!123236)) b!251715))

(assert (= (and b!251715 res!123237) b!251711))

(assert (= (and b!251715 res!123238) b!251713))

(assert (= (and b!251713 c!42368) b!251712))

(assert (= (and b!251713 (not c!42368)) b!251714))

(assert (= (or b!251712 b!251714) bm!23694))

(declare-fun m!267937 () Bool)

(assert (=> bm!23694 m!267937))

(declare-fun m!267939 () Bool)

(assert (=> bm!23694 m!267939))

(assert (=> b!251711 m!267937))

(assert (=> b!251711 m!267937))

(declare-fun m!267941 () Bool)

(assert (=> b!251711 m!267941))

(assert (=> b!251713 m!267937))

(assert (=> b!251713 m!267937))

(declare-fun m!267943 () Bool)

(assert (=> b!251713 m!267943))

(assert (=> b!251715 m!267937))

(assert (=> b!251715 m!267937))

(assert (=> b!251715 m!267943))

(assert (=> b!251654 d!61177))

(declare-fun d!61179 () Bool)

(declare-fun e!163238 () Bool)

(assert (=> d!61179 e!163238))

(declare-fun res!123239 () Bool)

(assert (=> d!61179 (=> res!123239 e!163238)))

(declare-fun lt!126156 () Bool)

(assert (=> d!61179 (= res!123239 (not lt!126156))))

(declare-fun lt!126153 () Bool)

(assert (=> d!61179 (= lt!126156 lt!126153)))

(declare-fun lt!126155 () Unit!7781)

(declare-fun e!163237 () Unit!7781)

(assert (=> d!61179 (= lt!126155 e!163237)))

(declare-fun c!42369 () Bool)

(assert (=> d!61179 (= c!42369 lt!126153)))

(assert (=> d!61179 (= lt!126153 (containsKey!292 (toList!1898 lt!126107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61179 (= (contains!1822 lt!126107 #b1000000000000000000000000000000000000000000000000000000000000000) lt!126156)))

(declare-fun b!251716 () Bool)

(declare-fun lt!126154 () Unit!7781)

(assert (=> b!251716 (= e!163237 lt!126154)))

(assert (=> b!251716 (= lt!126154 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1898 lt!126107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251716 (isDefined!241 (getValueByKey!300 (toList!1898 lt!126107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251717 () Bool)

(declare-fun Unit!7792 () Unit!7781)

(assert (=> b!251717 (= e!163237 Unit!7792)))

(declare-fun b!251718 () Bool)

(assert (=> b!251718 (= e!163238 (isDefined!241 (getValueByKey!300 (toList!1898 lt!126107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61179 c!42369) b!251716))

(assert (= (and d!61179 (not c!42369)) b!251717))

(assert (= (and d!61179 (not res!123239)) b!251718))

(declare-fun m!267945 () Bool)

(assert (=> d!61179 m!267945))

(declare-fun m!267947 () Bool)

(assert (=> b!251716 m!267947))

(declare-fun m!267949 () Bool)

(assert (=> b!251716 m!267949))

(assert (=> b!251716 m!267949))

(declare-fun m!267951 () Bool)

(assert (=> b!251716 m!267951))

(assert (=> b!251718 m!267949))

(assert (=> b!251718 m!267949))

(assert (=> b!251718 m!267951))

(assert (=> bm!23671 d!61179))

(declare-fun b!251743 () Bool)

(declare-fun e!163257 () Bool)

(declare-fun e!163258 () Bool)

(assert (=> b!251743 (= e!163257 e!163258)))

(declare-fun c!42381 () Bool)

(declare-fun e!163255 () Bool)

(assert (=> b!251743 (= c!42381 e!163255)))

(declare-fun res!123251 () Bool)

(assert (=> b!251743 (=> (not res!123251) (not e!163255))))

(assert (=> b!251743 (= res!123251 (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251744 () Bool)

(declare-fun e!163256 () ListLongMap!3765)

(declare-fun e!163253 () ListLongMap!3765)

(assert (=> b!251744 (= e!163256 e!163253)))

(declare-fun c!42378 () Bool)

(assert (=> b!251744 (= c!42378 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61181 () Bool)

(assert (=> d!61181 e!163257))

(declare-fun res!123249 () Bool)

(assert (=> d!61181 (=> (not res!123249) (not e!163257))))

(declare-fun lt!126176 () ListLongMap!3765)

(assert (=> d!61181 (= res!123249 (not (contains!1822 lt!126176 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61181 (= lt!126176 e!163256)))

(declare-fun c!42379 () Bool)

(assert (=> d!61181 (= c!42379 (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61181 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61181 (= (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) lt!126176)))

(declare-fun b!251745 () Bool)

(declare-fun e!163254 () Bool)

(assert (=> b!251745 (= e!163258 e!163254)))

(assert (=> b!251745 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun res!123250 () Bool)

(assert (=> b!251745 (= res!123250 (contains!1822 lt!126176 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251745 (=> (not res!123250) (not e!163254))))

(declare-fun b!251746 () Bool)

(declare-fun e!163259 () Bool)

(assert (=> b!251746 (= e!163259 (= lt!126176 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4646 thiss!1504))))))

(declare-fun b!251747 () Bool)

(declare-fun isEmpty!530 (ListLongMap!3765) Bool)

(assert (=> b!251747 (= e!163259 (isEmpty!530 lt!126176))))

(declare-fun bm!23697 () Bool)

(declare-fun call!23700 () ListLongMap!3765)

(assert (=> bm!23697 (= call!23700 (getCurrentListMapNoExtraKeys!564 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4646 thiss!1504)))))

(declare-fun b!251748 () Bool)

(assert (=> b!251748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> b!251748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6188 (_values!4629 thiss!1504))))))

(assert (=> b!251748 (= e!163254 (= (apply!242 lt!126176 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)) (get!3006 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251749 () Bool)

(assert (=> b!251749 (= e!163255 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251749 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!251750 () Bool)

(declare-fun res!123248 () Bool)

(assert (=> b!251750 (=> (not res!123248) (not e!163257))))

(assert (=> b!251750 (= res!123248 (not (contains!1822 lt!126176 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251751 () Bool)

(assert (=> b!251751 (= e!163256 (ListLongMap!3766 Nil!3729))))

(declare-fun b!251752 () Bool)

(assert (=> b!251752 (= e!163253 call!23700)))

(declare-fun b!251753 () Bool)

(declare-fun lt!126173 () Unit!7781)

(declare-fun lt!126172 () Unit!7781)

(assert (=> b!251753 (= lt!126173 lt!126172)))

(declare-fun lt!126174 () (_ BitVec 64))

(declare-fun lt!126177 () ListLongMap!3765)

(declare-fun lt!126171 () V!8315)

(declare-fun lt!126175 () (_ BitVec 64))

(assert (=> b!251753 (not (contains!1822 (+!669 lt!126177 (tuple2!4853 lt!126175 lt!126171)) lt!126174))))

(declare-fun addStillNotContains!124 (ListLongMap!3765 (_ BitVec 64) V!8315 (_ BitVec 64)) Unit!7781)

(assert (=> b!251753 (= lt!126172 (addStillNotContains!124 lt!126177 lt!126175 lt!126171 lt!126174))))

(assert (=> b!251753 (= lt!126174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!251753 (= lt!126171 (get!3006 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251753 (= lt!126175 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251753 (= lt!126177 call!23700)))

(assert (=> b!251753 (= e!163253 (+!669 call!23700 (tuple2!4853 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000) (get!3006 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!251754 () Bool)

(assert (=> b!251754 (= e!163258 e!163259)))

(declare-fun c!42380 () Bool)

(assert (=> b!251754 (= c!42380 (bvslt #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (= (and d!61181 c!42379) b!251751))

(assert (= (and d!61181 (not c!42379)) b!251744))

(assert (= (and b!251744 c!42378) b!251753))

(assert (= (and b!251744 (not c!42378)) b!251752))

(assert (= (or b!251753 b!251752) bm!23697))

(assert (= (and d!61181 res!123249) b!251750))

(assert (= (and b!251750 res!123248) b!251743))

(assert (= (and b!251743 res!123251) b!251749))

(assert (= (and b!251743 c!42381) b!251745))

(assert (= (and b!251743 (not c!42381)) b!251754))

(assert (= (and b!251745 res!123250) b!251748))

(assert (= (and b!251754 c!42380) b!251746))

(assert (= (and b!251754 (not c!42380)) b!251747))

(declare-fun b_lambda!8107 () Bool)

(assert (=> (not b_lambda!8107) (not b!251748)))

(assert (=> b!251748 t!8774))

(declare-fun b_and!13673 () Bool)

(assert (= b_and!13671 (and (=> t!8774 result!5313) b_and!13673)))

(declare-fun b_lambda!8109 () Bool)

(assert (=> (not b_lambda!8109) (not b!251753)))

(assert (=> b!251753 t!8774))

(declare-fun b_and!13675 () Bool)

(assert (= b_and!13673 (and (=> t!8774 result!5313) b_and!13675)))

(declare-fun m!267953 () Bool)

(assert (=> b!251753 m!267953))

(assert (=> b!251753 m!267869))

(assert (=> b!251753 m!267871))

(assert (=> b!251753 m!267873))

(assert (=> b!251753 m!267953))

(declare-fun m!267955 () Bool)

(assert (=> b!251753 m!267955))

(assert (=> b!251753 m!267819))

(assert (=> b!251753 m!267871))

(assert (=> b!251753 m!267869))

(declare-fun m!267957 () Bool)

(assert (=> b!251753 m!267957))

(declare-fun m!267959 () Bool)

(assert (=> b!251753 m!267959))

(assert (=> b!251745 m!267819))

(assert (=> b!251745 m!267819))

(declare-fun m!267961 () Bool)

(assert (=> b!251745 m!267961))

(assert (=> b!251744 m!267819))

(assert (=> b!251744 m!267819))

(assert (=> b!251744 m!267863))

(declare-fun m!267963 () Bool)

(assert (=> b!251750 m!267963))

(assert (=> b!251748 m!267869))

(assert (=> b!251748 m!267871))

(assert (=> b!251748 m!267873))

(assert (=> b!251748 m!267819))

(declare-fun m!267965 () Bool)

(assert (=> b!251748 m!267965))

(assert (=> b!251748 m!267819))

(assert (=> b!251748 m!267871))

(assert (=> b!251748 m!267869))

(declare-fun m!267967 () Bool)

(assert (=> bm!23697 m!267967))

(assert (=> b!251749 m!267819))

(assert (=> b!251749 m!267819))

(assert (=> b!251749 m!267863))

(assert (=> b!251746 m!267967))

(declare-fun m!267969 () Bool)

(assert (=> d!61181 m!267969))

(assert (=> d!61181 m!267707))

(declare-fun m!267971 () Bool)

(assert (=> b!251747 m!267971))

(assert (=> bm!23677 d!61181))

(declare-fun d!61183 () Bool)

(declare-fun e!163262 () Bool)

(assert (=> d!61183 e!163262))

(declare-fun res!123256 () Bool)

(assert (=> d!61183 (=> (not res!123256) (not e!163262))))

(declare-fun lt!126188 () ListLongMap!3765)

(assert (=> d!61183 (= res!123256 (contains!1822 lt!126188 (_1!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))))

(declare-fun lt!126186 () List!3732)

(assert (=> d!61183 (= lt!126188 (ListLongMap!3766 lt!126186))))

(declare-fun lt!126187 () Unit!7781)

(declare-fun lt!126189 () Unit!7781)

(assert (=> d!61183 (= lt!126187 lt!126189)))

(assert (=> d!61183 (= (getValueByKey!300 lt!126186 (_1!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))) (Some!305 (_2!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!160 (List!3732 (_ BitVec 64) V!8315) Unit!7781)

(assert (=> d!61183 (= lt!126189 (lemmaContainsTupThenGetReturnValue!160 lt!126186 (_1!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))) (_2!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))))

(declare-fun insertStrictlySorted!163 (List!3732 (_ BitVec 64) V!8315) List!3732)

(assert (=> d!61183 (= lt!126186 (insertStrictlySorted!163 (toList!1898 (ite c!42346 call!23674 (ite c!42345 call!23679 call!23678))) (_1!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))) (_2!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))))

(assert (=> d!61183 (= (+!669 (ite c!42346 call!23674 (ite c!42345 call!23679 call!23678)) (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))) lt!126188)))

(declare-fun b!251759 () Bool)

(declare-fun res!123257 () Bool)

(assert (=> b!251759 (=> (not res!123257) (not e!163262))))

(assert (=> b!251759 (= res!123257 (= (getValueByKey!300 (toList!1898 lt!126188) (_1!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))) (Some!305 (_2!2437 (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))))

(declare-fun b!251760 () Bool)

(declare-fun contains!1825 (List!3732 tuple2!4852) Bool)

(assert (=> b!251760 (= e!163262 (contains!1825 (toList!1898 lt!126188) (ite (or c!42346 c!42345) (tuple2!4853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4487 thiss!1504)) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))

(assert (= (and d!61183 res!123256) b!251759))

(assert (= (and b!251759 res!123257) b!251760))

(declare-fun m!267973 () Bool)

(assert (=> d!61183 m!267973))

(declare-fun m!267975 () Bool)

(assert (=> d!61183 m!267975))

(declare-fun m!267977 () Bool)

(assert (=> d!61183 m!267977))

(declare-fun m!267979 () Bool)

(assert (=> d!61183 m!267979))

(declare-fun m!267981 () Bool)

(assert (=> b!251759 m!267981))

(declare-fun m!267983 () Bool)

(assert (=> b!251760 m!267983))

(assert (=> bm!23672 d!61183))

(declare-fun d!61185 () Bool)

(assert (=> d!61185 (= (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) index!297)) (and (not (= (select (arr!5843 (_keys!6788 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5843 (_keys!6788 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251605 d!61185))

(declare-fun d!61187 () Bool)

(assert (=> d!61187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (mask!10847 thiss!1504))))

(assert (=> d!61187 true))

(declare-fun _$56!30 () Unit!7781)

(assert (=> d!61187 (= (choose!102 key!932 (_keys!6788 thiss!1504) index!297 (mask!10847 thiss!1504)) _$56!30)))

(declare-fun bs!9008 () Bool)

(assert (= bs!9008 d!61187))

(assert (=> bs!9008 m!267717))

(assert (=> bs!9008 m!267915))

(assert (=> d!61159 d!61187))

(assert (=> d!61159 d!61149))

(assert (=> d!61141 d!61149))

(assert (=> d!61167 d!61139))

(assert (=> d!61167 d!61141))

(declare-fun d!61189 () Bool)

(assert (=> d!61189 (contains!1822 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) key!932)))

(assert (=> d!61189 true))

(declare-fun _$17!80 () Unit!7781)

(assert (=> d!61189 (= (choose!1196 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)) _$17!80)))

(declare-fun bs!9009 () Bool)

(assert (= bs!9009 d!61189))

(assert (=> bs!9009 m!267739))

(assert (=> bs!9009 m!267739))

(assert (=> bs!9009 m!267741))

(assert (=> d!61167 d!61189))

(assert (=> d!61167 d!61149))

(declare-fun d!61191 () Bool)

(declare-fun res!123258 () Bool)

(declare-fun e!163263 () Bool)

(assert (=> d!61191 (=> res!123258 e!163263)))

(assert (=> d!61191 (= res!123258 (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)) e!163263)))

(declare-fun b!251761 () Bool)

(declare-fun e!163265 () Bool)

(assert (=> b!251761 (= e!163263 e!163265)))

(declare-fun c!42382 () Bool)

(assert (=> b!251761 (= c!42382 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251762 () Bool)

(declare-fun call!23701 () Bool)

(assert (=> b!251762 (= e!163265 call!23701)))

(declare-fun bm!23698 () Bool)

(assert (=> bm!23698 (= call!23701 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun b!251763 () Bool)

(declare-fun e!163264 () Bool)

(assert (=> b!251763 (= e!163264 call!23701)))

(declare-fun b!251764 () Bool)

(assert (=> b!251764 (= e!163265 e!163264)))

(declare-fun lt!126190 () (_ BitVec 64))

(assert (=> b!251764 (= lt!126190 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126191 () Unit!7781)

(assert (=> b!251764 (= lt!126191 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6788 thiss!1504) lt!126190 #b00000000000000000000000000000000))))

(assert (=> b!251764 (arrayContainsKey!0 (_keys!6788 thiss!1504) lt!126190 #b00000000000000000000000000000000)))

(declare-fun lt!126192 () Unit!7781)

(assert (=> b!251764 (= lt!126192 lt!126191)))

(declare-fun res!123259 () Bool)

(assert (=> b!251764 (= res!123259 (= (seekEntryOrOpen!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000) (_keys!6788 thiss!1504) (mask!10847 thiss!1504)) (Found!1127 #b00000000000000000000000000000000)))))

(assert (=> b!251764 (=> (not res!123259) (not e!163264))))

(assert (= (and d!61191 (not res!123258)) b!251761))

(assert (= (and b!251761 c!42382) b!251764))

(assert (= (and b!251761 (not c!42382)) b!251762))

(assert (= (and b!251764 res!123259) b!251763))

(assert (= (or b!251763 b!251762) bm!23698))

(assert (=> b!251761 m!267819))

(assert (=> b!251761 m!267819))

(assert (=> b!251761 m!267863))

(declare-fun m!267985 () Bool)

(assert (=> bm!23698 m!267985))

(assert (=> b!251764 m!267819))

(declare-fun m!267987 () Bool)

(assert (=> b!251764 m!267987))

(declare-fun m!267989 () Bool)

(assert (=> b!251764 m!267989))

(assert (=> b!251764 m!267819))

(declare-fun m!267991 () Bool)

(assert (=> b!251764 m!267991))

(assert (=> b!251689 d!61191))

(assert (=> bm!23693 d!61143))

(declare-fun d!61193 () Bool)

(assert (=> d!61193 (arrayNoDuplicates!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000000 Nil!3730)))

(assert (=> d!61193 true))

(declare-fun _$65!83 () Unit!7781)

(assert (=> d!61193 (= (choose!41 (_keys!6788 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730) _$65!83)))

(declare-fun bs!9010 () Bool)

(assert (= bs!9010 d!61193))

(assert (=> bs!9010 m!267717))

(assert (=> bs!9010 m!267911))

(assert (=> d!61157 d!61193))

(declare-fun d!61195 () Bool)

(declare-fun e!163267 () Bool)

(assert (=> d!61195 e!163267))

(declare-fun res!123260 () Bool)

(assert (=> d!61195 (=> res!123260 e!163267)))

(declare-fun lt!126196 () Bool)

(assert (=> d!61195 (= res!123260 (not lt!126196))))

(declare-fun lt!126193 () Bool)

(assert (=> d!61195 (= lt!126196 lt!126193)))

(declare-fun lt!126195 () Unit!7781)

(declare-fun e!163266 () Unit!7781)

(assert (=> d!61195 (= lt!126195 e!163266)))

(declare-fun c!42383 () Bool)

(assert (=> d!61195 (= c!42383 lt!126193)))

(assert (=> d!61195 (= lt!126193 (containsKey!292 (toList!1898 lt!126107) (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61195 (= (contains!1822 lt!126107 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)) lt!126196)))

(declare-fun b!251765 () Bool)

(declare-fun lt!126194 () Unit!7781)

(assert (=> b!251765 (= e!163266 lt!126194)))

(assert (=> b!251765 (= lt!126194 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1898 lt!126107) (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251765 (isDefined!241 (getValueByKey!300 (toList!1898 lt!126107) (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251766 () Bool)

(declare-fun Unit!7793 () Unit!7781)

(assert (=> b!251766 (= e!163266 Unit!7793)))

(declare-fun b!251767 () Bool)

(assert (=> b!251767 (= e!163267 (isDefined!241 (getValueByKey!300 (toList!1898 lt!126107) (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!61195 c!42383) b!251765))

(assert (= (and d!61195 (not c!42383)) b!251766))

(assert (= (and d!61195 (not res!123260)) b!251767))

(assert (=> d!61195 m!267819))

(declare-fun m!267993 () Bool)

(assert (=> d!61195 m!267993))

(assert (=> b!251765 m!267819))

(declare-fun m!267995 () Bool)

(assert (=> b!251765 m!267995))

(assert (=> b!251765 m!267819))

(declare-fun m!267997 () Bool)

(assert (=> b!251765 m!267997))

(assert (=> b!251765 m!267997))

(declare-fun m!267999 () Bool)

(assert (=> b!251765 m!267999))

(assert (=> b!251767 m!267819))

(assert (=> b!251767 m!267997))

(assert (=> b!251767 m!267997))

(assert (=> b!251767 m!267999))

(assert (=> b!251583 d!61195))

(declare-fun d!61197 () Bool)

(declare-fun e!163269 () Bool)

(assert (=> d!61197 e!163269))

(declare-fun res!123261 () Bool)

(assert (=> d!61197 (=> res!123261 e!163269)))

(declare-fun lt!126200 () Bool)

(assert (=> d!61197 (= res!123261 (not lt!126200))))

(declare-fun lt!126197 () Bool)

(assert (=> d!61197 (= lt!126200 lt!126197)))

(declare-fun lt!126199 () Unit!7781)

(declare-fun e!163268 () Unit!7781)

(assert (=> d!61197 (= lt!126199 e!163268)))

(declare-fun c!42384 () Bool)

(assert (=> d!61197 (= c!42384 lt!126197)))

(assert (=> d!61197 (= lt!126197 (containsKey!292 (toList!1898 lt!126107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61197 (= (contains!1822 lt!126107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!126200)))

(declare-fun b!251768 () Bool)

(declare-fun lt!126198 () Unit!7781)

(assert (=> b!251768 (= e!163268 lt!126198)))

(assert (=> b!251768 (= lt!126198 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1898 lt!126107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251768 (isDefined!241 (getValueByKey!300 (toList!1898 lt!126107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251769 () Bool)

(declare-fun Unit!7794 () Unit!7781)

(assert (=> b!251769 (= e!163268 Unit!7794)))

(declare-fun b!251770 () Bool)

(assert (=> b!251770 (= e!163269 (isDefined!241 (getValueByKey!300 (toList!1898 lt!126107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61197 c!42384) b!251768))

(assert (= (and d!61197 (not c!42384)) b!251769))

(assert (= (and d!61197 (not res!123261)) b!251770))

(declare-fun m!268001 () Bool)

(assert (=> d!61197 m!268001))

(declare-fun m!268003 () Bool)

(assert (=> b!251768 m!268003))

(declare-fun m!268005 () Bool)

(assert (=> b!251768 m!268005))

(assert (=> b!251768 m!268005))

(declare-fun m!268007 () Bool)

(assert (=> b!251768 m!268007))

(assert (=> b!251770 m!268005))

(assert (=> b!251770 m!268005))

(assert (=> b!251770 m!268007))

(assert (=> bm!23674 d!61197))

(declare-fun d!61199 () Bool)

(declare-fun res!123266 () Bool)

(declare-fun e!163274 () Bool)

(assert (=> d!61199 (=> res!123266 e!163274)))

(assert (=> d!61199 (= res!123266 (and ((_ is Cons!3728) (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))) (= (_1!2437 (h!4389 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))))) key!932)))))

(assert (=> d!61199 (= (containsKey!292 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932) e!163274)))

(declare-fun b!251775 () Bool)

(declare-fun e!163275 () Bool)

(assert (=> b!251775 (= e!163274 e!163275)))

(declare-fun res!123267 () Bool)

(assert (=> b!251775 (=> (not res!123267) (not e!163275))))

(assert (=> b!251775 (= res!123267 (and (or (not ((_ is Cons!3728) (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))))) (bvsle (_1!2437 (h!4389 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))))) key!932)) ((_ is Cons!3728) (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))) (bvslt (_1!2437 (h!4389 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))))) key!932)))))

(declare-fun b!251776 () Bool)

(assert (=> b!251776 (= e!163275 (containsKey!292 (t!8769 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))) key!932))))

(assert (= (and d!61199 (not res!123266)) b!251775))

(assert (= (and b!251775 res!123267) b!251776))

(declare-fun m!268009 () Bool)

(assert (=> b!251776 m!268009))

(assert (=> d!61139 d!61199))

(declare-fun b!251789 () Bool)

(declare-fun e!163282 () SeekEntryResult!1127)

(assert (=> b!251789 (= e!163282 Undefined!1127)))

(declare-fun b!251790 () Bool)

(declare-fun e!163283 () SeekEntryResult!1127)

(assert (=> b!251790 (= e!163283 (Found!1127 (index!6680 lt!126037)))))

(declare-fun b!251791 () Bool)

(declare-fun e!163284 () SeekEntryResult!1127)

(assert (=> b!251791 (= e!163284 (MissingVacant!1127 (index!6680 lt!126037)))))

(declare-fun b!251792 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251792 (= e!163284 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24721 lt!126037) #b00000000000000000000000000000001) (nextIndex!0 (index!6680 lt!126037) (x!24721 lt!126037) (mask!10847 thiss!1504)) (index!6680 lt!126037) key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun b!251793 () Bool)

(assert (=> b!251793 (= e!163282 e!163283)))

(declare-fun c!42391 () Bool)

(declare-fun lt!126206 () (_ BitVec 64))

(assert (=> b!251793 (= c!42391 (= lt!126206 key!932))))

(declare-fun b!251794 () Bool)

(declare-fun c!42393 () Bool)

(assert (=> b!251794 (= c!42393 (= lt!126206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251794 (= e!163283 e!163284)))

(declare-fun d!61201 () Bool)

(declare-fun lt!126205 () SeekEntryResult!1127)

(assert (=> d!61201 (and (or ((_ is Undefined!1127) lt!126205) (not ((_ is Found!1127) lt!126205)) (and (bvsge (index!6679 lt!126205) #b00000000000000000000000000000000) (bvslt (index!6679 lt!126205) (size!6189 (_keys!6788 thiss!1504))))) (or ((_ is Undefined!1127) lt!126205) ((_ is Found!1127) lt!126205) (not ((_ is MissingVacant!1127) lt!126205)) (not (= (index!6681 lt!126205) (index!6680 lt!126037))) (and (bvsge (index!6681 lt!126205) #b00000000000000000000000000000000) (bvslt (index!6681 lt!126205) (size!6189 (_keys!6788 thiss!1504))))) (or ((_ is Undefined!1127) lt!126205) (ite ((_ is Found!1127) lt!126205) (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6679 lt!126205)) key!932) (and ((_ is MissingVacant!1127) lt!126205) (= (index!6681 lt!126205) (index!6680 lt!126037)) (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6681 lt!126205)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!61201 (= lt!126205 e!163282)))

(declare-fun c!42392 () Bool)

(assert (=> d!61201 (= c!42392 (bvsge (x!24721 lt!126037) #b01111111111111111111111111111110))))

(assert (=> d!61201 (= lt!126206 (select (arr!5843 (_keys!6788 thiss!1504)) (index!6680 lt!126037)))))

(assert (=> d!61201 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61201 (= (seekKeyOrZeroReturnVacant!0 (x!24721 lt!126037) (index!6680 lt!126037) (index!6680 lt!126037) key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)) lt!126205)))

(assert (= (and d!61201 c!42392) b!251789))

(assert (= (and d!61201 (not c!42392)) b!251793))

(assert (= (and b!251793 c!42391) b!251790))

(assert (= (and b!251793 (not c!42391)) b!251794))

(assert (= (and b!251794 c!42393) b!251791))

(assert (= (and b!251794 (not c!42393)) b!251792))

(declare-fun m!268011 () Bool)

(assert (=> b!251792 m!268011))

(assert (=> b!251792 m!268011))

(declare-fun m!268013 () Bool)

(assert (=> b!251792 m!268013))

(declare-fun m!268015 () Bool)

(assert (=> d!61201 m!268015))

(declare-fun m!268017 () Bool)

(assert (=> d!61201 m!268017))

(assert (=> d!61201 m!267791))

(assert (=> d!61201 m!267707))

(assert (=> b!251508 d!61201))

(declare-fun d!61203 () Bool)

(declare-fun get!3007 (Option!306) V!8315)

(assert (=> d!61203 (= (apply!242 lt!126107 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3007 (getValueByKey!300 (toList!1898 lt!126107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9011 () Bool)

(assert (= bs!9011 d!61203))

(assert (=> bs!9011 m!267949))

(assert (=> bs!9011 m!267949))

(declare-fun m!268019 () Bool)

(assert (=> bs!9011 m!268019))

(assert (=> b!251587 d!61203))

(declare-fun d!61205 () Bool)

(assert (=> d!61205 (= (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251571 d!61205))

(declare-fun d!61207 () Bool)

(assert (=> d!61207 (= (apply!242 lt!126107 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3007 (getValueByKey!300 (toList!1898 lt!126107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9012 () Bool)

(assert (= bs!9012 d!61207))

(assert (=> bs!9012 m!268005))

(assert (=> bs!9012 m!268005))

(declare-fun m!268021 () Bool)

(assert (=> bs!9012 m!268021))

(assert (=> b!251575 d!61207))

(declare-fun call!23702 () Bool)

(declare-fun bm!23699 () Bool)

(declare-fun c!42394 () Bool)

(assert (=> bm!23699 (= call!23702 (arrayNoDuplicates!0 lt!125995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42394 (Cons!3729 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!42361 (Cons!3729 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) Nil!3730) Nil!3730)) (ite c!42361 (Cons!3729 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) Nil!3730) Nil!3730))))))

(declare-fun d!61209 () Bool)

(declare-fun res!123268 () Bool)

(declare-fun e!163286 () Bool)

(assert (=> d!61209 (=> res!123268 e!163286)))

(assert (=> d!61209 (= res!123268 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 lt!125995)))))

(assert (=> d!61209 (= (arrayNoDuplicates!0 lt!125995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42361 (Cons!3729 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) Nil!3730) Nil!3730)) e!163286)))

(declare-fun b!251795 () Bool)

(declare-fun e!163285 () Bool)

(assert (=> b!251795 (= e!163285 (contains!1824 (ite c!42361 (Cons!3729 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) Nil!3730) Nil!3730) (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251796 () Bool)

(declare-fun e!163287 () Bool)

(assert (=> b!251796 (= e!163287 call!23702)))

(declare-fun b!251797 () Bool)

(declare-fun e!163288 () Bool)

(assert (=> b!251797 (= e!163288 e!163287)))

(assert (=> b!251797 (= c!42394 (validKeyInArray!0 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251798 () Bool)

(assert (=> b!251798 (= e!163287 call!23702)))

(declare-fun b!251799 () Bool)

(assert (=> b!251799 (= e!163286 e!163288)))

(declare-fun res!123270 () Bool)

(assert (=> b!251799 (=> (not res!123270) (not e!163288))))

(assert (=> b!251799 (= res!123270 (not e!163285))))

(declare-fun res!123269 () Bool)

(assert (=> b!251799 (=> (not res!123269) (not e!163285))))

(assert (=> b!251799 (= res!123269 (validKeyInArray!0 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!61209 (not res!123268)) b!251799))

(assert (= (and b!251799 res!123269) b!251795))

(assert (= (and b!251799 res!123270) b!251797))

(assert (= (and b!251797 c!42394) b!251796))

(assert (= (and b!251797 (not c!42394)) b!251798))

(assert (= (or b!251796 b!251798) bm!23699))

(declare-fun m!268023 () Bool)

(assert (=> bm!23699 m!268023))

(declare-fun m!268025 () Bool)

(assert (=> bm!23699 m!268025))

(assert (=> b!251795 m!268023))

(assert (=> b!251795 m!268023))

(declare-fun m!268027 () Bool)

(assert (=> b!251795 m!268027))

(assert (=> b!251797 m!268023))

(assert (=> b!251797 m!268023))

(declare-fun m!268029 () Bool)

(assert (=> b!251797 m!268029))

(assert (=> b!251799 m!268023))

(assert (=> b!251799 m!268023))

(assert (=> b!251799 m!268029))

(assert (=> bm!23687 d!61209))

(declare-fun d!61211 () Bool)

(assert (=> d!61211 (= (apply!242 lt!126107 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)) (get!3007 (getValueByKey!300 (toList!1898 lt!126107) (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9013 () Bool)

(assert (= bs!9013 d!61211))

(assert (=> bs!9013 m!267819))

(assert (=> bs!9013 m!267997))

(assert (=> bs!9013 m!267997))

(declare-fun m!268031 () Bool)

(assert (=> bs!9013 m!268031))

(assert (=> b!251584 d!61211))

(declare-fun d!61213 () Bool)

(declare-fun c!42397 () Bool)

(assert (=> d!61213 (= c!42397 ((_ is ValueCellFull!2907) (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!163291 () V!8315)

(assert (=> d!61213 (= (get!3006 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!163291)))

(declare-fun b!251804 () Bool)

(declare-fun get!3008 (ValueCell!2907 V!8315) V!8315)

(assert (=> b!251804 (= e!163291 (get!3008 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251805 () Bool)

(declare-fun get!3009 (ValueCell!2907 V!8315) V!8315)

(assert (=> b!251805 (= e!163291 (get!3009 (select (arr!5842 (_values!4629 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4646 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61213 c!42397) b!251804))

(assert (= (and d!61213 (not c!42397)) b!251805))

(assert (=> b!251804 m!267869))

(assert (=> b!251804 m!267871))

(declare-fun m!268033 () Bool)

(assert (=> b!251804 m!268033))

(assert (=> b!251805 m!267869))

(assert (=> b!251805 m!267871))

(declare-fun m!268035 () Bool)

(assert (=> b!251805 m!268035))

(assert (=> b!251584 d!61213))

(declare-fun d!61215 () Bool)

(declare-fun res!123271 () Bool)

(declare-fun e!163292 () Bool)

(assert (=> d!61215 (=> res!123271 e!163292)))

(assert (=> d!61215 (= res!123271 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 lt!125995)))))

(assert (=> d!61215 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125995 (mask!10847 thiss!1504)) e!163292)))

(declare-fun b!251806 () Bool)

(declare-fun e!163294 () Bool)

(assert (=> b!251806 (= e!163292 e!163294)))

(declare-fun c!42398 () Bool)

(assert (=> b!251806 (= c!42398 (validKeyInArray!0 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251807 () Bool)

(declare-fun call!23703 () Bool)

(assert (=> b!251807 (= e!163294 call!23703)))

(declare-fun bm!23700 () Bool)

(assert (=> bm!23700 (= call!23703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125995 (mask!10847 thiss!1504)))))

(declare-fun b!251808 () Bool)

(declare-fun e!163293 () Bool)

(assert (=> b!251808 (= e!163293 call!23703)))

(declare-fun b!251809 () Bool)

(assert (=> b!251809 (= e!163294 e!163293)))

(declare-fun lt!126207 () (_ BitVec 64))

(assert (=> b!251809 (= lt!126207 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!126208 () Unit!7781)

(assert (=> b!251809 (= lt!126208 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125995 lt!126207 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!251809 (arrayContainsKey!0 lt!125995 lt!126207 #b00000000000000000000000000000000)))

(declare-fun lt!126209 () Unit!7781)

(assert (=> b!251809 (= lt!126209 lt!126208)))

(declare-fun res!123272 () Bool)

(assert (=> b!251809 (= res!123272 (= (seekEntryOrOpen!0 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125995 (mask!10847 thiss!1504)) (Found!1127 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!251809 (=> (not res!123272) (not e!163293))))

(assert (= (and d!61215 (not res!123271)) b!251806))

(assert (= (and b!251806 c!42398) b!251809))

(assert (= (and b!251806 (not c!42398)) b!251807))

(assert (= (and b!251809 res!123272) b!251808))

(assert (= (or b!251808 b!251807) bm!23700))

(assert (=> b!251806 m!268023))

(assert (=> b!251806 m!268023))

(assert (=> b!251806 m!268029))

(declare-fun m!268037 () Bool)

(assert (=> bm!23700 m!268037))

(assert (=> b!251809 m!268023))

(declare-fun m!268039 () Bool)

(assert (=> b!251809 m!268039))

(declare-fun m!268041 () Bool)

(assert (=> b!251809 m!268041))

(assert (=> b!251809 m!268023))

(declare-fun m!268043 () Bool)

(assert (=> b!251809 m!268043))

(assert (=> bm!23683 d!61215))

(declare-fun d!61217 () Bool)

(assert (=> d!61217 (= (arrayCountValidKeys!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!61217 true))

(declare-fun _$84!33 () Unit!7781)

(assert (=> d!61217 (= (choose!1 (_keys!6788 thiss!1504) index!297 key!932) _$84!33)))

(declare-fun bs!9014 () Bool)

(assert (= bs!9014 d!61217))

(assert (=> bs!9014 m!267717))

(assert (=> bs!9014 m!267879))

(assert (=> bs!9014 m!267719))

(assert (=> d!61145 d!61217))

(declare-fun d!61219 () Bool)

(assert (=> d!61219 (= (validKeyInArray!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)) (and (not (= (select (arr!5843 lt!125995) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5843 lt!125995) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251629 d!61219))

(declare-fun d!61221 () Bool)

(declare-fun e!163295 () Bool)

(assert (=> d!61221 e!163295))

(declare-fun res!123273 () Bool)

(assert (=> d!61221 (=> (not res!123273) (not e!163295))))

(declare-fun lt!126212 () ListLongMap!3765)

(assert (=> d!61221 (= res!123273 (contains!1822 lt!126212 (_1!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))))))

(declare-fun lt!126210 () List!3732)

(assert (=> d!61221 (= lt!126212 (ListLongMap!3766 lt!126210))))

(declare-fun lt!126211 () Unit!7781)

(declare-fun lt!126213 () Unit!7781)

(assert (=> d!61221 (= lt!126211 lt!126213)))

(assert (=> d!61221 (= (getValueByKey!300 lt!126210 (_1!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))))))

(assert (=> d!61221 (= lt!126213 (lemmaContainsTupThenGetReturnValue!160 lt!126210 (_1!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))))))

(assert (=> d!61221 (= lt!126210 (insertStrictlySorted!163 (toList!1898 lt!126104) (_1!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))))))

(assert (=> d!61221 (= (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))) lt!126212)))

(declare-fun b!251810 () Bool)

(declare-fun res!123274 () Bool)

(assert (=> b!251810 (=> (not res!123274) (not e!163295))))

(assert (=> b!251810 (= res!123274 (= (getValueByKey!300 (toList!1898 lt!126212) (_1!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))))))))

(declare-fun b!251811 () Bool)

(assert (=> b!251811 (= e!163295 (contains!1825 (toList!1898 lt!126212) (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))))))

(assert (= (and d!61221 res!123273) b!251810))

(assert (= (and b!251810 res!123274) b!251811))

(declare-fun m!268045 () Bool)

(assert (=> d!61221 m!268045))

(declare-fun m!268047 () Bool)

(assert (=> d!61221 m!268047))

(declare-fun m!268049 () Bool)

(assert (=> d!61221 m!268049))

(declare-fun m!268051 () Bool)

(assert (=> d!61221 m!268051))

(declare-fun m!268053 () Bool)

(assert (=> b!251810 m!268053))

(declare-fun m!268055 () Bool)

(assert (=> b!251811 m!268055))

(assert (=> b!251578 d!61221))

(declare-fun d!61223 () Bool)

(assert (=> d!61223 (= (apply!242 (+!669 lt!126101 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))) lt!126116) (apply!242 lt!126101 lt!126116))))

(declare-fun lt!126216 () Unit!7781)

(declare-fun choose!1197 (ListLongMap!3765 (_ BitVec 64) V!8315 (_ BitVec 64)) Unit!7781)

(assert (=> d!61223 (= lt!126216 (choose!1197 lt!126101 lt!126111 (zeroValue!4487 thiss!1504) lt!126116))))

(declare-fun e!163298 () Bool)

(assert (=> d!61223 e!163298))

(declare-fun res!123277 () Bool)

(assert (=> d!61223 (=> (not res!123277) (not e!163298))))

(assert (=> d!61223 (= res!123277 (contains!1822 lt!126101 lt!126116))))

(assert (=> d!61223 (= (addApplyDifferent!218 lt!126101 lt!126111 (zeroValue!4487 thiss!1504) lt!126116) lt!126216)))

(declare-fun b!251815 () Bool)

(assert (=> b!251815 (= e!163298 (not (= lt!126116 lt!126111)))))

(assert (= (and d!61223 res!123277) b!251815))

(assert (=> d!61223 m!267841))

(declare-fun m!268057 () Bool)

(assert (=> d!61223 m!268057))

(declare-fun m!268059 () Bool)

(assert (=> d!61223 m!268059))

(assert (=> d!61223 m!267839))

(assert (=> d!61223 m!267841))

(assert (=> d!61223 m!267851))

(assert (=> b!251578 d!61223))

(declare-fun d!61225 () Bool)

(assert (=> d!61225 (= (apply!242 lt!126101 lt!126116) (get!3007 (getValueByKey!300 (toList!1898 lt!126101) lt!126116)))))

(declare-fun bs!9015 () Bool)

(assert (= bs!9015 d!61225))

(declare-fun m!268061 () Bool)

(assert (=> bs!9015 m!268061))

(assert (=> bs!9015 m!268061))

(declare-fun m!268063 () Bool)

(assert (=> bs!9015 m!268063))

(assert (=> b!251578 d!61225))

(declare-fun d!61227 () Bool)

(declare-fun e!163299 () Bool)

(assert (=> d!61227 e!163299))

(declare-fun res!123278 () Bool)

(assert (=> d!61227 (=> (not res!123278) (not e!163299))))

(declare-fun lt!126219 () ListLongMap!3765)

(assert (=> d!61227 (= res!123278 (contains!1822 lt!126219 (_1!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))))))

(declare-fun lt!126217 () List!3732)

(assert (=> d!61227 (= lt!126219 (ListLongMap!3766 lt!126217))))

(declare-fun lt!126218 () Unit!7781)

(declare-fun lt!126220 () Unit!7781)

(assert (=> d!61227 (= lt!126218 lt!126220)))

(assert (=> d!61227 (= (getValueByKey!300 lt!126217 (_1!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))))))

(assert (=> d!61227 (= lt!126220 (lemmaContainsTupThenGetReturnValue!160 lt!126217 (_1!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))))))

(assert (=> d!61227 (= lt!126217 (insertStrictlySorted!163 (toList!1898 lt!126121) (_1!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))))))

(assert (=> d!61227 (= (+!669 lt!126121 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))) lt!126219)))

(declare-fun b!251816 () Bool)

(declare-fun res!123279 () Bool)

(assert (=> b!251816 (=> (not res!123279) (not e!163299))))

(assert (=> b!251816 (= res!123279 (= (getValueByKey!300 (toList!1898 lt!126219) (_1!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))))))))

(declare-fun b!251817 () Bool)

(assert (=> b!251817 (= e!163299 (contains!1825 (toList!1898 lt!126219) (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))))))

(assert (= (and d!61227 res!123278) b!251816))

(assert (= (and b!251816 res!123279) b!251817))

(declare-fun m!268065 () Bool)

(assert (=> d!61227 m!268065))

(declare-fun m!268067 () Bool)

(assert (=> d!61227 m!268067))

(declare-fun m!268069 () Bool)

(assert (=> d!61227 m!268069))

(declare-fun m!268071 () Bool)

(assert (=> d!61227 m!268071))

(declare-fun m!268073 () Bool)

(assert (=> b!251816 m!268073))

(declare-fun m!268075 () Bool)

(assert (=> b!251817 m!268075))

(assert (=> b!251578 d!61227))

(declare-fun d!61229 () Bool)

(assert (=> d!61229 (= (apply!242 (+!669 lt!126121 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))) lt!126102) (apply!242 lt!126121 lt!126102))))

(declare-fun lt!126221 () Unit!7781)

(assert (=> d!61229 (= lt!126221 (choose!1197 lt!126121 lt!126120 (minValue!4487 thiss!1504) lt!126102))))

(declare-fun e!163300 () Bool)

(assert (=> d!61229 e!163300))

(declare-fun res!123280 () Bool)

(assert (=> d!61229 (=> (not res!123280) (not e!163300))))

(assert (=> d!61229 (= res!123280 (contains!1822 lt!126121 lt!126102))))

(assert (=> d!61229 (= (addApplyDifferent!218 lt!126121 lt!126120 (minValue!4487 thiss!1504) lt!126102) lt!126221)))

(declare-fun b!251818 () Bool)

(assert (=> b!251818 (= e!163300 (not (= lt!126102 lt!126120)))))

(assert (= (and d!61229 res!123280) b!251818))

(assert (=> d!61229 m!267853))

(declare-fun m!268077 () Bool)

(assert (=> d!61229 m!268077))

(declare-fun m!268079 () Bool)

(assert (=> d!61229 m!268079))

(assert (=> d!61229 m!267849))

(assert (=> d!61229 m!267853))

(assert (=> d!61229 m!267855))

(assert (=> b!251578 d!61229))

(declare-fun d!61231 () Bool)

(assert (=> d!61231 (= (apply!242 (+!669 lt!126109 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))) lt!126117) (get!3007 (getValueByKey!300 (toList!1898 (+!669 lt!126109 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))) lt!126117)))))

(declare-fun bs!9016 () Bool)

(assert (= bs!9016 d!61231))

(declare-fun m!268081 () Bool)

(assert (=> bs!9016 m!268081))

(assert (=> bs!9016 m!268081))

(declare-fun m!268083 () Bool)

(assert (=> bs!9016 m!268083))

(assert (=> b!251578 d!61231))

(declare-fun d!61233 () Bool)

(assert (=> d!61233 (= (apply!242 lt!126109 lt!126117) (get!3007 (getValueByKey!300 (toList!1898 lt!126109) lt!126117)))))

(declare-fun bs!9017 () Bool)

(assert (= bs!9017 d!61233))

(declare-fun m!268085 () Bool)

(assert (=> bs!9017 m!268085))

(assert (=> bs!9017 m!268085))

(declare-fun m!268087 () Bool)

(assert (=> bs!9017 m!268087))

(assert (=> b!251578 d!61233))

(declare-fun d!61235 () Bool)

(assert (=> d!61235 (= (apply!242 lt!126121 lt!126102) (get!3007 (getValueByKey!300 (toList!1898 lt!126121) lt!126102)))))

(declare-fun bs!9018 () Bool)

(assert (= bs!9018 d!61235))

(declare-fun m!268089 () Bool)

(assert (=> bs!9018 m!268089))

(assert (=> bs!9018 m!268089))

(declare-fun m!268091 () Bool)

(assert (=> bs!9018 m!268091))

(assert (=> b!251578 d!61235))

(declare-fun d!61237 () Bool)

(declare-fun e!163301 () Bool)

(assert (=> d!61237 e!163301))

(declare-fun res!123281 () Bool)

(assert (=> d!61237 (=> (not res!123281) (not e!163301))))

(declare-fun lt!126224 () ListLongMap!3765)

(assert (=> d!61237 (= res!123281 (contains!1822 lt!126224 (_1!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))))))

(declare-fun lt!126222 () List!3732)

(assert (=> d!61237 (= lt!126224 (ListLongMap!3766 lt!126222))))

(declare-fun lt!126223 () Unit!7781)

(declare-fun lt!126225 () Unit!7781)

(assert (=> d!61237 (= lt!126223 lt!126225)))

(assert (=> d!61237 (= (getValueByKey!300 lt!126222 (_1!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))))))

(assert (=> d!61237 (= lt!126225 (lemmaContainsTupThenGetReturnValue!160 lt!126222 (_1!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))))))

(assert (=> d!61237 (= lt!126222 (insertStrictlySorted!163 (toList!1898 lt!126101) (_1!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))))))

(assert (=> d!61237 (= (+!669 lt!126101 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))) lt!126224)))

(declare-fun b!251819 () Bool)

(declare-fun res!123282 () Bool)

(assert (=> b!251819 (=> (not res!123282) (not e!163301))))

(assert (=> b!251819 (= res!123282 (= (getValueByKey!300 (toList!1898 lt!126224) (_1!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))))))))

(declare-fun b!251820 () Bool)

(assert (=> b!251820 (= e!163301 (contains!1825 (toList!1898 lt!126224) (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))))))

(assert (= (and d!61237 res!123281) b!251819))

(assert (= (and b!251819 res!123282) b!251820))

(declare-fun m!268093 () Bool)

(assert (=> d!61237 m!268093))

(declare-fun m!268095 () Bool)

(assert (=> d!61237 m!268095))

(declare-fun m!268097 () Bool)

(assert (=> d!61237 m!268097))

(declare-fun m!268099 () Bool)

(assert (=> d!61237 m!268099))

(declare-fun m!268101 () Bool)

(assert (=> b!251819 m!268101))

(declare-fun m!268103 () Bool)

(assert (=> b!251820 m!268103))

(assert (=> b!251578 d!61237))

(declare-fun d!61239 () Bool)

(assert (=> d!61239 (= (apply!242 (+!669 lt!126121 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504))) lt!126102) (get!3007 (getValueByKey!300 (toList!1898 (+!669 lt!126121 (tuple2!4853 lt!126120 (minValue!4487 thiss!1504)))) lt!126102)))))

(declare-fun bs!9019 () Bool)

(assert (= bs!9019 d!61239))

(declare-fun m!268105 () Bool)

(assert (=> bs!9019 m!268105))

(assert (=> bs!9019 m!268105))

(declare-fun m!268107 () Bool)

(assert (=> bs!9019 m!268107))

(assert (=> b!251578 d!61239))

(assert (=> b!251578 d!61181))

(declare-fun d!61241 () Bool)

(assert (=> d!61241 (= (apply!242 (+!669 lt!126109 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))) lt!126117) (apply!242 lt!126109 lt!126117))))

(declare-fun lt!126226 () Unit!7781)

(assert (=> d!61241 (= lt!126226 (choose!1197 lt!126109 lt!126110 (minValue!4487 thiss!1504) lt!126117))))

(declare-fun e!163302 () Bool)

(assert (=> d!61241 e!163302))

(declare-fun res!123283 () Bool)

(assert (=> d!61241 (=> (not res!123283) (not e!163302))))

(assert (=> d!61241 (= res!123283 (contains!1822 lt!126109 lt!126117))))

(assert (=> d!61241 (= (addApplyDifferent!218 lt!126109 lt!126110 (minValue!4487 thiss!1504) lt!126117) lt!126226)))

(declare-fun b!251821 () Bool)

(assert (=> b!251821 (= e!163302 (not (= lt!126117 lt!126110)))))

(assert (= (and d!61241 res!123283) b!251821))

(assert (=> d!61241 m!267833))

(declare-fun m!268109 () Bool)

(assert (=> d!61241 m!268109))

(declare-fun m!268111 () Bool)

(assert (=> d!61241 m!268111))

(assert (=> d!61241 m!267859))

(assert (=> d!61241 m!267833))

(assert (=> d!61241 m!267861))

(assert (=> b!251578 d!61241))

(declare-fun d!61243 () Bool)

(assert (=> d!61243 (contains!1822 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))) lt!126113)))

(declare-fun lt!126229 () Unit!7781)

(declare-fun choose!1198 (ListLongMap!3765 (_ BitVec 64) V!8315 (_ BitVec 64)) Unit!7781)

(assert (=> d!61243 (= lt!126229 (choose!1198 lt!126104 lt!126103 (zeroValue!4487 thiss!1504) lt!126113))))

(assert (=> d!61243 (contains!1822 lt!126104 lt!126113)))

(assert (=> d!61243 (= (addStillContains!218 lt!126104 lt!126103 (zeroValue!4487 thiss!1504) lt!126113) lt!126229)))

(declare-fun bs!9020 () Bool)

(assert (= bs!9020 d!61243))

(assert (=> bs!9020 m!267845))

(assert (=> bs!9020 m!267845))

(assert (=> bs!9020 m!267847))

(declare-fun m!268113 () Bool)

(assert (=> bs!9020 m!268113))

(declare-fun m!268115 () Bool)

(assert (=> bs!9020 m!268115))

(assert (=> b!251578 d!61243))

(declare-fun d!61245 () Bool)

(declare-fun e!163304 () Bool)

(assert (=> d!61245 e!163304))

(declare-fun res!123284 () Bool)

(assert (=> d!61245 (=> res!123284 e!163304)))

(declare-fun lt!126233 () Bool)

(assert (=> d!61245 (= res!123284 (not lt!126233))))

(declare-fun lt!126230 () Bool)

(assert (=> d!61245 (= lt!126233 lt!126230)))

(declare-fun lt!126232 () Unit!7781)

(declare-fun e!163303 () Unit!7781)

(assert (=> d!61245 (= lt!126232 e!163303)))

(declare-fun c!42399 () Bool)

(assert (=> d!61245 (= c!42399 lt!126230)))

(assert (=> d!61245 (= lt!126230 (containsKey!292 (toList!1898 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))) lt!126113))))

(assert (=> d!61245 (= (contains!1822 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504))) lt!126113) lt!126233)))

(declare-fun b!251823 () Bool)

(declare-fun lt!126231 () Unit!7781)

(assert (=> b!251823 (= e!163303 lt!126231)))

(assert (=> b!251823 (= lt!126231 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1898 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))) lt!126113))))

(assert (=> b!251823 (isDefined!241 (getValueByKey!300 (toList!1898 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))) lt!126113))))

(declare-fun b!251824 () Bool)

(declare-fun Unit!7795 () Unit!7781)

(assert (=> b!251824 (= e!163303 Unit!7795)))

(declare-fun b!251825 () Bool)

(assert (=> b!251825 (= e!163304 (isDefined!241 (getValueByKey!300 (toList!1898 (+!669 lt!126104 (tuple2!4853 lt!126103 (zeroValue!4487 thiss!1504)))) lt!126113)))))

(assert (= (and d!61245 c!42399) b!251823))

(assert (= (and d!61245 (not c!42399)) b!251824))

(assert (= (and d!61245 (not res!123284)) b!251825))

(declare-fun m!268117 () Bool)

(assert (=> d!61245 m!268117))

(declare-fun m!268119 () Bool)

(assert (=> b!251823 m!268119))

(declare-fun m!268121 () Bool)

(assert (=> b!251823 m!268121))

(assert (=> b!251823 m!268121))

(declare-fun m!268123 () Bool)

(assert (=> b!251823 m!268123))

(assert (=> b!251825 m!268121))

(assert (=> b!251825 m!268121))

(assert (=> b!251825 m!268123))

(assert (=> b!251578 d!61245))

(declare-fun d!61247 () Bool)

(assert (=> d!61247 (= (apply!242 (+!669 lt!126101 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504))) lt!126116) (get!3007 (getValueByKey!300 (toList!1898 (+!669 lt!126101 (tuple2!4853 lt!126111 (zeroValue!4487 thiss!1504)))) lt!126116)))))

(declare-fun bs!9021 () Bool)

(assert (= bs!9021 d!61247))

(declare-fun m!268125 () Bool)

(assert (=> bs!9021 m!268125))

(assert (=> bs!9021 m!268125))

(declare-fun m!268127 () Bool)

(assert (=> bs!9021 m!268127))

(assert (=> b!251578 d!61247))

(declare-fun d!61249 () Bool)

(declare-fun e!163305 () Bool)

(assert (=> d!61249 e!163305))

(declare-fun res!123285 () Bool)

(assert (=> d!61249 (=> (not res!123285) (not e!163305))))

(declare-fun lt!126236 () ListLongMap!3765)

(assert (=> d!61249 (= res!123285 (contains!1822 lt!126236 (_1!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))))))

(declare-fun lt!126234 () List!3732)

(assert (=> d!61249 (= lt!126236 (ListLongMap!3766 lt!126234))))

(declare-fun lt!126235 () Unit!7781)

(declare-fun lt!126237 () Unit!7781)

(assert (=> d!61249 (= lt!126235 lt!126237)))

(assert (=> d!61249 (= (getValueByKey!300 lt!126234 (_1!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))))))

(assert (=> d!61249 (= lt!126237 (lemmaContainsTupThenGetReturnValue!160 lt!126234 (_1!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))))))

(assert (=> d!61249 (= lt!126234 (insertStrictlySorted!163 (toList!1898 lt!126109) (_1!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))))))

(assert (=> d!61249 (= (+!669 lt!126109 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))) lt!126236)))

(declare-fun b!251826 () Bool)

(declare-fun res!123286 () Bool)

(assert (=> b!251826 (=> (not res!123286) (not e!163305))))

(assert (=> b!251826 (= res!123286 (= (getValueByKey!300 (toList!1898 lt!126236) (_1!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))))))))

(declare-fun b!251827 () Bool)

(assert (=> b!251827 (= e!163305 (contains!1825 (toList!1898 lt!126236) (tuple2!4853 lt!126110 (minValue!4487 thiss!1504))))))

(assert (= (and d!61249 res!123285) b!251826))

(assert (= (and b!251826 res!123286) b!251827))

(declare-fun m!268129 () Bool)

(assert (=> d!61249 m!268129))

(declare-fun m!268131 () Bool)

(assert (=> d!61249 m!268131))

(declare-fun m!268133 () Bool)

(assert (=> d!61249 m!268133))

(declare-fun m!268135 () Bool)

(assert (=> d!61249 m!268135))

(declare-fun m!268137 () Bool)

(assert (=> b!251826 m!268137))

(declare-fun m!268139 () Bool)

(assert (=> b!251827 m!268139))

(assert (=> b!251578 d!61249))

(assert (=> b!251618 d!61205))

(declare-fun d!61251 () Bool)

(assert (=> d!61251 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251606 d!61251))

(declare-fun bm!23701 () Bool)

(declare-fun call!23704 () Bool)

(declare-fun c!42400 () Bool)

(assert (=> bm!23701 (= call!23704 (arrayNoDuplicates!0 (_keys!6788 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42400 (Cons!3729 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000) Nil!3730) Nil!3730)))))

(declare-fun d!61253 () Bool)

(declare-fun res!123287 () Bool)

(declare-fun e!163307 () Bool)

(assert (=> d!61253 (=> res!123287 e!163307)))

(assert (=> d!61253 (= res!123287 (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61253 (= (arrayNoDuplicates!0 (_keys!6788 thiss!1504) #b00000000000000000000000000000000 Nil!3730) e!163307)))

(declare-fun b!251828 () Bool)

(declare-fun e!163306 () Bool)

(assert (=> b!251828 (= e!163306 (contains!1824 Nil!3730 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251829 () Bool)

(declare-fun e!163308 () Bool)

(assert (=> b!251829 (= e!163308 call!23704)))

(declare-fun b!251830 () Bool)

(declare-fun e!163309 () Bool)

(assert (=> b!251830 (= e!163309 e!163308)))

(assert (=> b!251830 (= c!42400 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251831 () Bool)

(assert (=> b!251831 (= e!163308 call!23704)))

(declare-fun b!251832 () Bool)

(assert (=> b!251832 (= e!163307 e!163309)))

(declare-fun res!123289 () Bool)

(assert (=> b!251832 (=> (not res!123289) (not e!163309))))

(assert (=> b!251832 (= res!123289 (not e!163306))))

(declare-fun res!123288 () Bool)

(assert (=> b!251832 (=> (not res!123288) (not e!163306))))

(assert (=> b!251832 (= res!123288 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61253 (not res!123287)) b!251832))

(assert (= (and b!251832 res!123288) b!251828))

(assert (= (and b!251832 res!123289) b!251830))

(assert (= (and b!251830 c!42400) b!251829))

(assert (= (and b!251830 (not c!42400)) b!251831))

(assert (= (or b!251829 b!251831) bm!23701))

(assert (=> bm!23701 m!267819))

(declare-fun m!268141 () Bool)

(assert (=> bm!23701 m!268141))

(assert (=> b!251828 m!267819))

(assert (=> b!251828 m!267819))

(declare-fun m!268143 () Bool)

(assert (=> b!251828 m!268143))

(assert (=> b!251830 m!267819))

(assert (=> b!251830 m!267819))

(assert (=> b!251830 m!267863))

(assert (=> b!251832 m!267819))

(assert (=> b!251832 m!267819))

(assert (=> b!251832 m!267863))

(assert (=> b!251690 d!61253))

(assert (=> b!251634 d!61219))

(declare-fun d!61255 () Bool)

(declare-fun lt!126238 () (_ BitVec 32))

(assert (=> d!61255 (and (bvsge lt!126238 #b00000000000000000000000000000000) (bvsle lt!126238 (bvsub (size!6189 (_keys!6788 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!163310 () (_ BitVec 32))

(assert (=> d!61255 (= lt!126238 e!163310)))

(declare-fun c!42401 () Bool)

(assert (=> d!61255 (= c!42401 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61255 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6189 (_keys!6788 thiss!1504)) (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61255 (= (arrayCountValidKeys!0 (_keys!6788 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))) lt!126238)))

(declare-fun bm!23702 () Bool)

(declare-fun call!23705 () (_ BitVec 32))

(assert (=> bm!23702 (= call!23705 (arrayCountValidKeys!0 (_keys!6788 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251833 () Bool)

(declare-fun e!163311 () (_ BitVec 32))

(assert (=> b!251833 (= e!163311 (bvadd #b00000000000000000000000000000001 call!23705))))

(declare-fun b!251834 () Bool)

(assert (=> b!251834 (= e!163310 e!163311)))

(declare-fun c!42402 () Bool)

(assert (=> b!251834 (= c!42402 (validKeyInArray!0 (select (arr!5843 (_keys!6788 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251835 () Bool)

(assert (=> b!251835 (= e!163310 #b00000000000000000000000000000000)))

(declare-fun b!251836 () Bool)

(assert (=> b!251836 (= e!163311 call!23705)))

(assert (= (and d!61255 c!42401) b!251835))

(assert (= (and d!61255 (not c!42401)) b!251834))

(assert (= (and b!251834 c!42402) b!251833))

(assert (= (and b!251834 (not c!42402)) b!251836))

(assert (= (or b!251833 b!251836) bm!23702))

(declare-fun m!268145 () Bool)

(assert (=> bm!23702 m!268145))

(declare-fun m!268147 () Bool)

(assert (=> b!251834 m!268147))

(assert (=> b!251834 m!268147))

(declare-fun m!268149 () Bool)

(assert (=> b!251834 m!268149))

(assert (=> bm!23680 d!61255))

(declare-fun d!61257 () Bool)

(declare-fun lt!126239 () (_ BitVec 32))

(assert (=> d!61257 (and (bvsge lt!126239 #b00000000000000000000000000000000) (bvsle lt!126239 (bvsub (size!6189 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!163312 () (_ BitVec 32))

(assert (=> d!61257 (= lt!126239 e!163312)))

(declare-fun c!42403 () Bool)

(assert (=> d!61257 (= c!42403 (bvsge #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61257 (and (bvsle #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6189 (_keys!6788 thiss!1504)) (size!6189 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))))))))

(assert (=> d!61257 (= (arrayCountValidKeys!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) #b00000000000000000000000000000000 (size!6189 (_keys!6788 thiss!1504))) lt!126239)))

(declare-fun bm!23703 () Bool)

(declare-fun call!23706 () (_ BitVec 32))

(assert (=> bm!23703 (= call!23706 (arrayCountValidKeys!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251837 () Bool)

(declare-fun e!163313 () (_ BitVec 32))

(assert (=> b!251837 (= e!163313 (bvadd #b00000000000000000000000000000001 call!23706))))

(declare-fun b!251838 () Bool)

(assert (=> b!251838 (= e!163312 e!163313)))

(declare-fun c!42404 () Bool)

(assert (=> b!251838 (= c!42404 (validKeyInArray!0 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251839 () Bool)

(assert (=> b!251839 (= e!163312 #b00000000000000000000000000000000)))

(declare-fun b!251840 () Bool)

(assert (=> b!251840 (= e!163313 call!23706)))

(assert (= (and d!61257 c!42403) b!251839))

(assert (= (and d!61257 (not c!42403)) b!251838))

(assert (= (and b!251838 c!42404) b!251837))

(assert (= (and b!251838 (not c!42404)) b!251840))

(assert (= (or b!251837 b!251840) bm!23703))

(declare-fun m!268151 () Bool)

(assert (=> bm!23703 m!268151))

(assert (=> b!251838 m!267937))

(assert (=> b!251838 m!267937))

(assert (=> b!251838 m!267943))

(assert (=> b!251608 d!61257))

(assert (=> b!251608 d!61147))

(declare-fun d!61259 () Bool)

(declare-fun res!123290 () Bool)

(declare-fun e!163314 () Bool)

(assert (=> d!61259 (=> res!123290 e!163314)))

(assert (=> d!61259 (= res!123290 (= (select (arr!5843 (_keys!6788 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61259 (= (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!163314)))

(declare-fun b!251841 () Bool)

(declare-fun e!163315 () Bool)

(assert (=> b!251841 (= e!163314 e!163315)))

(declare-fun res!123291 () Bool)

(assert (=> b!251841 (=> (not res!123291) (not e!163315))))

(assert (=> b!251841 (= res!123291 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251842 () Bool)

(assert (=> b!251842 (= e!163315 (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61259 (not res!123290)) b!251841))

(assert (= (and b!251841 res!123291) b!251842))

(assert (=> d!61259 m!268147))

(declare-fun m!268153 () Bool)

(assert (=> b!251842 m!268153))

(assert (=> b!251596 d!61259))

(declare-fun d!61261 () Bool)

(declare-fun res!123292 () Bool)

(declare-fun e!163316 () Bool)

(assert (=> d!61261 (=> res!123292 e!163316)))

(assert (=> d!61261 (= res!123292 (bvsge #b00000000000000000000000000000000 (size!6189 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))))))))

(assert (=> d!61261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (mask!10847 thiss!1504)) e!163316)))

(declare-fun b!251843 () Bool)

(declare-fun e!163318 () Bool)

(assert (=> b!251843 (= e!163316 e!163318)))

(declare-fun c!42405 () Bool)

(assert (=> b!251843 (= c!42405 (validKeyInArray!0 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251844 () Bool)

(declare-fun call!23707 () Bool)

(assert (=> b!251844 (= e!163318 call!23707)))

(declare-fun bm!23704 () Bool)

(assert (=> bm!23704 (= call!23707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (mask!10847 thiss!1504)))))

(declare-fun b!251845 () Bool)

(declare-fun e!163317 () Bool)

(assert (=> b!251845 (= e!163317 call!23707)))

(declare-fun b!251846 () Bool)

(assert (=> b!251846 (= e!163318 e!163317)))

(declare-fun lt!126240 () (_ BitVec 64))

(assert (=> b!251846 (= lt!126240 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!126241 () Unit!7781)

(assert (=> b!251846 (= lt!126241 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) lt!126240 #b00000000000000000000000000000000))))

(assert (=> b!251846 (arrayContainsKey!0 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) lt!126240 #b00000000000000000000000000000000)))

(declare-fun lt!126242 () Unit!7781)

(assert (=> b!251846 (= lt!126242 lt!126241)))

(declare-fun res!123293 () Bool)

(assert (=> b!251846 (= res!123293 (= (seekEntryOrOpen!0 (select (arr!5843 (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504)))) #b00000000000000000000000000000000) (array!12326 (store (arr!5843 (_keys!6788 thiss!1504)) index!297 key!932) (size!6189 (_keys!6788 thiss!1504))) (mask!10847 thiss!1504)) (Found!1127 #b00000000000000000000000000000000)))))

(assert (=> b!251846 (=> (not res!123293) (not e!163317))))

(assert (= (and d!61261 (not res!123292)) b!251843))

(assert (= (and b!251843 c!42405) b!251846))

(assert (= (and b!251843 (not c!42405)) b!251844))

(assert (= (and b!251846 res!123293) b!251845))

(assert (= (or b!251845 b!251844) bm!23704))

(assert (=> b!251843 m!267937))

(assert (=> b!251843 m!267937))

(assert (=> b!251843 m!267943))

(declare-fun m!268155 () Bool)

(assert (=> bm!23704 m!268155))

(assert (=> b!251846 m!267937))

(declare-fun m!268157 () Bool)

(assert (=> b!251846 m!268157))

(declare-fun m!268159 () Bool)

(assert (=> b!251846 m!268159))

(assert (=> b!251846 m!267937))

(declare-fun m!268161 () Bool)

(assert (=> b!251846 m!268161))

(assert (=> b!251657 d!61261))

(declare-fun d!61263 () Bool)

(assert (=> d!61263 (arrayContainsKey!0 lt!125995 lt!126134 #b00000000000000000000000000000000)))

(declare-fun lt!126245 () Unit!7781)

(declare-fun choose!13 (array!12325 (_ BitVec 64) (_ BitVec 32)) Unit!7781)

(assert (=> d!61263 (= lt!126245 (choose!13 lt!125995 lt!126134 #b00000000000000000000000000000000))))

(assert (=> d!61263 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!61263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125995 lt!126134 #b00000000000000000000000000000000) lt!126245)))

(declare-fun bs!9022 () Bool)

(assert (= bs!9022 d!61263))

(assert (=> bs!9022 m!267899))

(declare-fun m!268163 () Bool)

(assert (=> bs!9022 m!268163))

(assert (=> b!251632 d!61263))

(declare-fun d!61265 () Bool)

(declare-fun res!123294 () Bool)

(declare-fun e!163319 () Bool)

(assert (=> d!61265 (=> res!123294 e!163319)))

(assert (=> d!61265 (= res!123294 (= (select (arr!5843 lt!125995) #b00000000000000000000000000000000) lt!126134))))

(assert (=> d!61265 (= (arrayContainsKey!0 lt!125995 lt!126134 #b00000000000000000000000000000000) e!163319)))

(declare-fun b!251847 () Bool)

(declare-fun e!163320 () Bool)

(assert (=> b!251847 (= e!163319 e!163320)))

(declare-fun res!123295 () Bool)

(assert (=> b!251847 (=> (not res!123295) (not e!163320))))

(assert (=> b!251847 (= res!123295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 lt!125995)))))

(declare-fun b!251848 () Bool)

(assert (=> b!251848 (= e!163320 (arrayContainsKey!0 lt!125995 lt!126134 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61265 (not res!123294)) b!251847))

(assert (= (and b!251847 res!123295) b!251848))

(assert (=> d!61265 m!267891))

(declare-fun m!268165 () Bool)

(assert (=> b!251848 m!268165))

(assert (=> b!251632 d!61265))

(declare-fun b!251849 () Bool)

(declare-fun e!163322 () SeekEntryResult!1127)

(declare-fun e!163321 () SeekEntryResult!1127)

(assert (=> b!251849 (= e!163322 e!163321)))

(declare-fun lt!126247 () (_ BitVec 64))

(declare-fun lt!126248 () SeekEntryResult!1127)

(assert (=> b!251849 (= lt!126247 (select (arr!5843 lt!125995) (index!6680 lt!126248)))))

(declare-fun c!42408 () Bool)

(assert (=> b!251849 (= c!42408 (= lt!126247 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun d!61267 () Bool)

(declare-fun lt!126246 () SeekEntryResult!1127)

(assert (=> d!61267 (and (or ((_ is Undefined!1127) lt!126246) (not ((_ is Found!1127) lt!126246)) (and (bvsge (index!6679 lt!126246) #b00000000000000000000000000000000) (bvslt (index!6679 lt!126246) (size!6189 lt!125995)))) (or ((_ is Undefined!1127) lt!126246) ((_ is Found!1127) lt!126246) (not ((_ is MissingZero!1127) lt!126246)) (and (bvsge (index!6678 lt!126246) #b00000000000000000000000000000000) (bvslt (index!6678 lt!126246) (size!6189 lt!125995)))) (or ((_ is Undefined!1127) lt!126246) ((_ is Found!1127) lt!126246) ((_ is MissingZero!1127) lt!126246) (not ((_ is MissingVacant!1127) lt!126246)) (and (bvsge (index!6681 lt!126246) #b00000000000000000000000000000000) (bvslt (index!6681 lt!126246) (size!6189 lt!125995)))) (or ((_ is Undefined!1127) lt!126246) (ite ((_ is Found!1127) lt!126246) (= (select (arr!5843 lt!125995) (index!6679 lt!126246)) (select (arr!5843 lt!125995) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1127) lt!126246) (= (select (arr!5843 lt!125995) (index!6678 lt!126246)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1127) lt!126246) (= (select (arr!5843 lt!125995) (index!6681 lt!126246)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61267 (= lt!126246 e!163322)))

(declare-fun c!42406 () Bool)

(assert (=> d!61267 (= c!42406 (and ((_ is Intermediate!1127) lt!126248) (undefined!1939 lt!126248)))))

(assert (=> d!61267 (= lt!126248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) (mask!10847 thiss!1504)) (select (arr!5843 lt!125995) #b00000000000000000000000000000000) lt!125995 (mask!10847 thiss!1504)))))

(assert (=> d!61267 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61267 (= (seekEntryOrOpen!0 (select (arr!5843 lt!125995) #b00000000000000000000000000000000) lt!125995 (mask!10847 thiss!1504)) lt!126246)))

(declare-fun b!251850 () Bool)

(assert (=> b!251850 (= e!163322 Undefined!1127)))

(declare-fun b!251851 () Bool)

(assert (=> b!251851 (= e!163321 (Found!1127 (index!6680 lt!126248)))))

(declare-fun e!163323 () SeekEntryResult!1127)

(declare-fun b!251852 () Bool)

(assert (=> b!251852 (= e!163323 (seekKeyOrZeroReturnVacant!0 (x!24721 lt!126248) (index!6680 lt!126248) (index!6680 lt!126248) (select (arr!5843 lt!125995) #b00000000000000000000000000000000) lt!125995 (mask!10847 thiss!1504)))))

(declare-fun b!251853 () Bool)

(assert (=> b!251853 (= e!163323 (MissingZero!1127 (index!6680 lt!126248)))))

(declare-fun b!251854 () Bool)

(declare-fun c!42407 () Bool)

(assert (=> b!251854 (= c!42407 (= lt!126247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251854 (= e!163321 e!163323)))

(assert (= (and d!61267 c!42406) b!251850))

(assert (= (and d!61267 (not c!42406)) b!251849))

(assert (= (and b!251849 c!42408) b!251851))

(assert (= (and b!251849 (not c!42408)) b!251854))

(assert (= (and b!251854 c!42407) b!251853))

(assert (= (and b!251854 (not c!42407)) b!251852))

(declare-fun m!268167 () Bool)

(assert (=> b!251849 m!268167))

(assert (=> d!61267 m!267707))

(assert (=> d!61267 m!267891))

(declare-fun m!268169 () Bool)

(assert (=> d!61267 m!268169))

(declare-fun m!268171 () Bool)

(assert (=> d!61267 m!268171))

(declare-fun m!268173 () Bool)

(assert (=> d!61267 m!268173))

(assert (=> d!61267 m!268169))

(assert (=> d!61267 m!267891))

(declare-fun m!268175 () Bool)

(assert (=> d!61267 m!268175))

(declare-fun m!268177 () Bool)

(assert (=> d!61267 m!268177))

(assert (=> b!251852 m!267891))

(declare-fun m!268179 () Bool)

(assert (=> b!251852 m!268179))

(assert (=> b!251632 d!61267))

(assert (=> b!251688 d!61147))

(declare-fun d!61269 () Bool)

(declare-fun lt!126249 () (_ BitVec 32))

(assert (=> d!61269 (and (bvsge lt!126249 #b00000000000000000000000000000000) (bvsle lt!126249 (bvsub (size!6189 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!163324 () (_ BitVec 32))

(assert (=> d!61269 (= lt!126249 e!163324)))

(declare-fun c!42409 () Bool)

(assert (=> d!61269 (= c!42409 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(assert (=> d!61269 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6189 (_keys!6788 thiss!1504)) (size!6189 lt!125995)))))

(assert (=> d!61269 (= (arrayCountValidKeys!0 lt!125995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))) lt!126249)))

(declare-fun bm!23705 () Bool)

(declare-fun call!23708 () (_ BitVec 32))

(assert (=> bm!23705 (= call!23708 (arrayCountValidKeys!0 lt!125995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun b!251855 () Bool)

(declare-fun e!163325 () (_ BitVec 32))

(assert (=> b!251855 (= e!163325 (bvadd #b00000000000000000000000000000001 call!23708))))

(declare-fun b!251856 () Bool)

(assert (=> b!251856 (= e!163324 e!163325)))

(declare-fun c!42410 () Bool)

(assert (=> b!251856 (= c!42410 (validKeyInArray!0 (select (arr!5843 lt!125995) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251857 () Bool)

(assert (=> b!251857 (= e!163324 #b00000000000000000000000000000000)))

(declare-fun b!251858 () Bool)

(assert (=> b!251858 (= e!163325 call!23708)))

(assert (= (and d!61269 c!42409) b!251857))

(assert (= (and d!61269 (not c!42409)) b!251856))

(assert (= (and b!251856 c!42410) b!251855))

(assert (= (and b!251856 (not c!42410)) b!251858))

(assert (= (or b!251855 b!251858) bm!23705))

(declare-fun m!268181 () Bool)

(assert (=> bm!23705 m!268181))

(assert (=> b!251856 m!268023))

(assert (=> b!251856 m!268023))

(assert (=> b!251856 m!268029))

(assert (=> bm!23684 d!61269))

(declare-fun d!61271 () Bool)

(assert (=> d!61271 (= (inRange!0 (index!6679 lt!126043) (mask!10847 thiss!1504)) (and (bvsge (index!6679 lt!126043) #b00000000000000000000000000000000) (bvslt (index!6679 lt!126043) (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251515 d!61271))

(assert (=> d!61135 d!61133))

(declare-fun d!61273 () Bool)

(declare-fun e!163328 () Bool)

(assert (=> d!61273 e!163328))

(declare-fun res!123300 () Bool)

(assert (=> d!61273 (=> (not res!123300) (not e!163328))))

(declare-fun lt!126252 () SeekEntryResult!1127)

(assert (=> d!61273 (= res!123300 ((_ is Found!1127) lt!126252))))

(assert (=> d!61273 (= lt!126252 (seekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(assert (=> d!61273 true))

(declare-fun _$33!171 () Unit!7781)

(assert (=> d!61273 (= (choose!1194 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)) _$33!171)))

(declare-fun b!251863 () Bool)

(declare-fun res!123301 () Bool)

(assert (=> b!251863 (=> (not res!123301) (not e!163328))))

(assert (=> b!251863 (= res!123301 (inRange!0 (index!6679 lt!126252) (mask!10847 thiss!1504)))))

(declare-fun b!251864 () Bool)

(assert (=> b!251864 (= e!163328 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6679 lt!126252)) key!932))))

(assert (= (and d!61273 res!123300) b!251863))

(assert (= (and b!251863 res!123301) b!251864))

(assert (=> d!61273 m!267735))

(declare-fun m!268183 () Bool)

(assert (=> b!251863 m!268183))

(declare-fun m!268185 () Bool)

(assert (=> b!251864 m!268185))

(assert (=> d!61135 d!61273))

(assert (=> d!61135 d!61149))

(assert (=> d!61161 d!61133))

(declare-fun b!251881 () Bool)

(declare-fun e!163337 () Bool)

(declare-fun lt!126255 () SeekEntryResult!1127)

(assert (=> b!251881 (= e!163337 ((_ is Undefined!1127) lt!126255))))

(declare-fun b!251882 () Bool)

(declare-fun res!123312 () Bool)

(assert (=> b!251882 (= res!123312 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6678 lt!126255)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163338 () Bool)

(assert (=> b!251882 (=> (not res!123312) (not e!163338))))

(declare-fun bm!23710 () Bool)

(declare-fun call!23714 () Bool)

(assert (=> bm!23710 (= call!23714 (arrayContainsKey!0 (_keys!6788 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251884 () Bool)

(declare-fun e!163339 () Bool)

(assert (=> b!251884 (= e!163339 (not call!23714))))

(declare-fun b!251885 () Bool)

(declare-fun e!163340 () Bool)

(assert (=> b!251885 (= e!163340 e!163338)))

(declare-fun res!123313 () Bool)

(declare-fun call!23713 () Bool)

(assert (=> b!251885 (= res!123313 call!23713)))

(assert (=> b!251885 (=> (not res!123313) (not e!163338))))

(declare-fun b!251886 () Bool)

(assert (=> b!251886 (= e!163340 e!163337)))

(declare-fun c!42415 () Bool)

(assert (=> b!251886 (= c!42415 ((_ is MissingVacant!1127) lt!126255))))

(declare-fun b!251887 () Bool)

(declare-fun res!123310 () Bool)

(assert (=> b!251887 (=> (not res!123310) (not e!163339))))

(assert (=> b!251887 (= res!123310 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6681 lt!126255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251888 () Bool)

(assert (=> b!251888 (= e!163338 (not call!23714))))

(declare-fun bm!23711 () Bool)

(declare-fun c!42416 () Bool)

(assert (=> bm!23711 (= call!23713 (inRange!0 (ite c!42416 (index!6678 lt!126255) (index!6681 lt!126255)) (mask!10847 thiss!1504)))))

(declare-fun b!251883 () Bool)

(declare-fun res!123311 () Bool)

(assert (=> b!251883 (=> (not res!123311) (not e!163339))))

(assert (=> b!251883 (= res!123311 call!23713)))

(assert (=> b!251883 (= e!163337 e!163339)))

(declare-fun d!61275 () Bool)

(assert (=> d!61275 e!163340))

(assert (=> d!61275 (= c!42416 ((_ is MissingZero!1127) lt!126255))))

(assert (=> d!61275 (= lt!126255 (seekEntryOrOpen!0 key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(assert (=> d!61275 true))

(declare-fun _$34!1116 () Unit!7781)

(assert (=> d!61275 (= (choose!1195 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) key!932 (defaultEntry!4646 thiss!1504)) _$34!1116)))

(assert (= (and d!61275 c!42416) b!251885))

(assert (= (and d!61275 (not c!42416)) b!251886))

(assert (= (and b!251885 res!123313) b!251882))

(assert (= (and b!251882 res!123312) b!251888))

(assert (= (and b!251886 c!42415) b!251883))

(assert (= (and b!251886 (not c!42415)) b!251881))

(assert (= (and b!251883 res!123311) b!251887))

(assert (= (and b!251887 res!123310) b!251884))

(assert (= (or b!251885 b!251883) bm!23711))

(assert (= (or b!251888 b!251884) bm!23710))

(declare-fun m!268187 () Bool)

(assert (=> bm!23711 m!268187))

(assert (=> d!61275 m!267735))

(declare-fun m!268189 () Bool)

(assert (=> b!251887 m!268189))

(assert (=> bm!23710 m!267725))

(declare-fun m!268191 () Bool)

(assert (=> b!251882 m!268191))

(assert (=> d!61161 d!61275))

(assert (=> d!61161 d!61149))

(assert (=> b!251651 d!61219))

(declare-fun d!61277 () Bool)

(declare-fun e!163341 () Bool)

(assert (=> d!61277 e!163341))

(declare-fun res!123314 () Bool)

(assert (=> d!61277 (=> (not res!123314) (not e!163341))))

(declare-fun lt!126258 () ListLongMap!3765)

(assert (=> d!61277 (= res!123314 (contains!1822 lt!126258 (_1!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))

(declare-fun lt!126256 () List!3732)

(assert (=> d!61277 (= lt!126258 (ListLongMap!3766 lt!126256))))

(declare-fun lt!126257 () Unit!7781)

(declare-fun lt!126259 () Unit!7781)

(assert (=> d!61277 (= lt!126257 lt!126259)))

(assert (=> d!61277 (= (getValueByKey!300 lt!126256 (_1!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))

(assert (=> d!61277 (= lt!126259 (lemmaContainsTupThenGetReturnValue!160 lt!126256 (_1!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))

(assert (=> d!61277 (= lt!126256 (insertStrictlySorted!163 (toList!1898 call!23676) (_1!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))) (_2!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))))))

(assert (=> d!61277 (= (+!669 call!23676 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))) lt!126258)))

(declare-fun b!251889 () Bool)

(declare-fun res!123315 () Bool)

(assert (=> b!251889 (=> (not res!123315) (not e!163341))))

(assert (=> b!251889 (= res!123315 (= (getValueByKey!300 (toList!1898 lt!126258) (_1!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504)))) (Some!305 (_2!2437 (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))))

(declare-fun b!251890 () Bool)

(assert (=> b!251890 (= e!163341 (contains!1825 (toList!1898 lt!126258) (tuple2!4853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4487 thiss!1504))))))

(assert (= (and d!61277 res!123314) b!251889))

(assert (= (and b!251889 res!123315) b!251890))

(declare-fun m!268193 () Bool)

(assert (=> d!61277 m!268193))

(declare-fun m!268195 () Bool)

(assert (=> d!61277 m!268195))

(declare-fun m!268197 () Bool)

(assert (=> d!61277 m!268197))

(declare-fun m!268199 () Bool)

(assert (=> d!61277 m!268199))

(declare-fun m!268201 () Bool)

(assert (=> b!251889 m!268201))

(declare-fun m!268203 () Bool)

(assert (=> b!251890 m!268203))

(assert (=> b!251588 d!61277))

(assert (=> b!251572 d!61205))

(declare-fun d!61279 () Bool)

(assert (=> d!61279 (isDefined!241 (getValueByKey!300 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))

(declare-fun lt!126262 () Unit!7781)

(declare-fun choose!1199 (List!3732 (_ BitVec 64)) Unit!7781)

(assert (=> d!61279 (= lt!126262 (choose!1199 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))

(declare-fun e!163344 () Bool)

(assert (=> d!61279 e!163344))

(declare-fun res!123318 () Bool)

(assert (=> d!61279 (=> (not res!123318) (not e!163344))))

(declare-fun isStrictlySorted!372 (List!3732) Bool)

(assert (=> d!61279 (= res!123318 (isStrictlySorted!372 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))))

(assert (=> d!61279 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932) lt!126262)))

(declare-fun b!251893 () Bool)

(assert (=> b!251893 (= e!163344 (containsKey!292 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))

(assert (= (and d!61279 res!123318) b!251893))

(assert (=> d!61279 m!267815))

(assert (=> d!61279 m!267815))

(assert (=> d!61279 m!267817))

(declare-fun m!268205 () Bool)

(assert (=> d!61279 m!268205))

(declare-fun m!268207 () Bool)

(assert (=> d!61279 m!268207))

(assert (=> b!251893 m!267811))

(assert (=> b!251523 d!61279))

(declare-fun d!61281 () Bool)

(declare-fun isEmpty!531 (Option!306) Bool)

(assert (=> d!61281 (= (isDefined!241 (getValueByKey!300 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932)) (not (isEmpty!531 (getValueByKey!300 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932))))))

(declare-fun bs!9023 () Bool)

(assert (= bs!9023 d!61281))

(assert (=> bs!9023 m!267815))

(declare-fun m!268209 () Bool)

(assert (=> bs!9023 m!268209))

(assert (=> b!251523 d!61281))

(declare-fun b!251904 () Bool)

(declare-fun e!163350 () Option!306)

(assert (=> b!251904 (= e!163350 (getValueByKey!300 (t!8769 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))) key!932))))

(declare-fun b!251903 () Bool)

(declare-fun e!163349 () Option!306)

(assert (=> b!251903 (= e!163349 e!163350)))

(declare-fun c!42422 () Bool)

(assert (=> b!251903 (= c!42422 (and ((_ is Cons!3728) (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))) (not (= (_1!2437 (h!4389 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))))) key!932))))))

(declare-fun d!61283 () Bool)

(declare-fun c!42421 () Bool)

(assert (=> d!61283 (= c!42421 (and ((_ is Cons!3728) (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))) (= (_1!2437 (h!4389 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))))) key!932)))))

(assert (=> d!61283 (= (getValueByKey!300 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504))) key!932) e!163349)))

(declare-fun b!251905 () Bool)

(assert (=> b!251905 (= e!163350 None!304)))

(declare-fun b!251902 () Bool)

(assert (=> b!251902 (= e!163349 (Some!305 (_2!2437 (h!4389 (toList!1898 (getCurrentListMap!1426 (_keys!6788 thiss!1504) (_values!4629 thiss!1504) (mask!10847 thiss!1504) (extraKeys!4383 thiss!1504) (zeroValue!4487 thiss!1504) (minValue!4487 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4646 thiss!1504)))))))))

(assert (= (and d!61283 c!42421) b!251902))

(assert (= (and d!61283 (not c!42421)) b!251903))

(assert (= (and b!251903 c!42422) b!251904))

(assert (= (and b!251903 (not c!42422)) b!251905))

(declare-fun m!268211 () Bool)

(assert (=> b!251904 m!268211))

(assert (=> b!251523 d!61283))

(declare-fun b!251924 () Bool)

(declare-fun e!163361 () SeekEntryResult!1127)

(assert (=> b!251924 (= e!163361 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10847 thiss!1504)) #b00000000000000000000000000000000 (mask!10847 thiss!1504)) key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)))))

(declare-fun d!61285 () Bool)

(declare-fun e!163364 () Bool)

(assert (=> d!61285 e!163364))

(declare-fun c!42429 () Bool)

(declare-fun lt!126268 () SeekEntryResult!1127)

(assert (=> d!61285 (= c!42429 (and ((_ is Intermediate!1127) lt!126268) (undefined!1939 lt!126268)))))

(declare-fun e!163362 () SeekEntryResult!1127)

(assert (=> d!61285 (= lt!126268 e!163362)))

(declare-fun c!42430 () Bool)

(assert (=> d!61285 (= c!42430 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!126267 () (_ BitVec 64))

(assert (=> d!61285 (= lt!126267 (select (arr!5843 (_keys!6788 thiss!1504)) (toIndex!0 key!932 (mask!10847 thiss!1504))))))

(assert (=> d!61285 (validMask!0 (mask!10847 thiss!1504))))

(assert (=> d!61285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10847 thiss!1504)) key!932 (_keys!6788 thiss!1504) (mask!10847 thiss!1504)) lt!126268)))

(declare-fun b!251925 () Bool)

(assert (=> b!251925 (and (bvsge (index!6680 lt!126268) #b00000000000000000000000000000000) (bvslt (index!6680 lt!126268) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun e!163365 () Bool)

(assert (=> b!251925 (= e!163365 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6680 lt!126268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251926 () Bool)

(assert (=> b!251926 (= e!163362 e!163361)))

(declare-fun c!42431 () Bool)

(assert (=> b!251926 (= c!42431 (or (= lt!126267 key!932) (= (bvadd lt!126267 lt!126267) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251927 () Bool)

(assert (=> b!251927 (= e!163362 (Intermediate!1127 true (toIndex!0 key!932 (mask!10847 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251928 () Bool)

(assert (=> b!251928 (= e!163364 (bvsge (x!24721 lt!126268) #b01111111111111111111111111111110))))

(declare-fun b!251929 () Bool)

(assert (=> b!251929 (= e!163361 (Intermediate!1127 false (toIndex!0 key!932 (mask!10847 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251930 () Bool)

(assert (=> b!251930 (and (bvsge (index!6680 lt!126268) #b00000000000000000000000000000000) (bvslt (index!6680 lt!126268) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun res!123325 () Bool)

(assert (=> b!251930 (= res!123325 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6680 lt!126268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251930 (=> res!123325 e!163365)))

(declare-fun b!251931 () Bool)

(assert (=> b!251931 (and (bvsge (index!6680 lt!126268) #b00000000000000000000000000000000) (bvslt (index!6680 lt!126268) (size!6189 (_keys!6788 thiss!1504))))))

(declare-fun res!123326 () Bool)

(assert (=> b!251931 (= res!123326 (= (select (arr!5843 (_keys!6788 thiss!1504)) (index!6680 lt!126268)) key!932))))

(assert (=> b!251931 (=> res!123326 e!163365)))

(declare-fun e!163363 () Bool)

(assert (=> b!251931 (= e!163363 e!163365)))

(declare-fun b!251932 () Bool)

(assert (=> b!251932 (= e!163364 e!163363)))

(declare-fun res!123327 () Bool)

(assert (=> b!251932 (= res!123327 (and ((_ is Intermediate!1127) lt!126268) (not (undefined!1939 lt!126268)) (bvslt (x!24721 lt!126268) #b01111111111111111111111111111110) (bvsge (x!24721 lt!126268) #b00000000000000000000000000000000) (bvsge (x!24721 lt!126268) #b00000000000000000000000000000000)))))

(assert (=> b!251932 (=> (not res!123327) (not e!163363))))

(assert (= (and d!61285 c!42430) b!251927))

(assert (= (and d!61285 (not c!42430)) b!251926))

(assert (= (and b!251926 c!42431) b!251929))

(assert (= (and b!251926 (not c!42431)) b!251924))

(assert (= (and d!61285 c!42429) b!251928))

(assert (= (and d!61285 (not c!42429)) b!251932))

(assert (= (and b!251932 res!123327) b!251931))

(assert (= (and b!251931 (not res!123326)) b!251930))

(assert (= (and b!251930 (not res!123325)) b!251925))

(declare-fun m!268213 () Bool)

(assert (=> b!251931 m!268213))

(assert (=> d!61285 m!267793))

(declare-fun m!268215 () Bool)

(assert (=> d!61285 m!268215))

(assert (=> d!61285 m!267707))

(assert (=> b!251925 m!268213))

(assert (=> b!251924 m!267793))

(declare-fun m!268217 () Bool)

(assert (=> b!251924 m!268217))

(assert (=> b!251924 m!268217))

(declare-fun m!268219 () Bool)

(assert (=> b!251924 m!268219))

(assert (=> b!251930 m!268213))

(assert (=> d!61133 d!61285))

(declare-fun d!61287 () Bool)

(declare-fun lt!126274 () (_ BitVec 32))

(declare-fun lt!126273 () (_ BitVec 32))

(assert (=> d!61287 (= lt!126274 (bvmul (bvxor lt!126273 (bvlshr lt!126273 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!61287 (= lt!126273 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!61287 (and (bvsge (mask!10847 thiss!1504) #b00000000000000000000000000000000) (let ((res!123328 (let ((h!4393 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24740 (bvmul (bvxor h!4393 (bvlshr h!4393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24740 (bvlshr x!24740 #b00000000000000000000000000001101)) (mask!10847 thiss!1504)))))) (and (bvslt res!123328 (bvadd (mask!10847 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!123328 #b00000000000000000000000000000000))))))

(assert (=> d!61287 (= (toIndex!0 key!932 (mask!10847 thiss!1504)) (bvand (bvxor lt!126274 (bvlshr lt!126274 #b00000000000000000000000000001101)) (mask!10847 thiss!1504)))))

(assert (=> d!61133 d!61287))

(assert (=> d!61133 d!61149))

(assert (=> b!251649 d!61219))

(assert (=> b!251525 d!61281))

(assert (=> b!251525 d!61283))

(declare-fun d!61289 () Bool)

(declare-fun lt!126277 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!167 (List!3733) (InoxSet (_ BitVec 64)))

(assert (=> d!61289 (= lt!126277 (select (content!167 Nil!3730) (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun e!163370 () Bool)

(assert (=> d!61289 (= lt!126277 e!163370)))

(declare-fun res!123334 () Bool)

(assert (=> d!61289 (=> (not res!123334) (not e!163370))))

(assert (=> d!61289 (= res!123334 ((_ is Cons!3729) Nil!3730))))

(assert (=> d!61289 (= (contains!1824 Nil!3730 (select (arr!5843 lt!125995) #b00000000000000000000000000000000)) lt!126277)))

(declare-fun b!251937 () Bool)

(declare-fun e!163371 () Bool)

(assert (=> b!251937 (= e!163370 e!163371)))

(declare-fun res!123333 () Bool)

(assert (=> b!251937 (=> res!123333 e!163371)))

(assert (=> b!251937 (= res!123333 (= (h!4390 Nil!3730) (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(declare-fun b!251938 () Bool)

(assert (=> b!251938 (= e!163371 (contains!1824 (t!8770 Nil!3730) (select (arr!5843 lt!125995) #b00000000000000000000000000000000)))))

(assert (= (and d!61289 res!123334) b!251937))

(assert (= (and b!251937 (not res!123333)) b!251938))

(declare-fun m!268221 () Bool)

(assert (=> d!61289 m!268221))

(assert (=> d!61289 m!267891))

(declare-fun m!268223 () Bool)

(assert (=> d!61289 m!268223))

(assert (=> b!251938 m!267891))

(declare-fun m!268225 () Bool)

(assert (=> b!251938 m!268225))

(assert (=> b!251647 d!61289))

(declare-fun b!251940 () Bool)

(declare-fun e!163373 () Bool)

(assert (=> b!251940 (= e!163373 tp_is_empty!6501)))

(declare-fun mapIsEmpty!11058 () Bool)

(declare-fun mapRes!11058 () Bool)

(assert (=> mapIsEmpty!11058 mapRes!11058))

(declare-fun mapNonEmpty!11058 () Bool)

(declare-fun tp!23199 () Bool)

(declare-fun e!163372 () Bool)

(assert (=> mapNonEmpty!11058 (= mapRes!11058 (and tp!23199 e!163372))))

(declare-fun mapRest!11058 () (Array (_ BitVec 32) ValueCell!2907))

(declare-fun mapKey!11058 () (_ BitVec 32))

(declare-fun mapValue!11058 () ValueCell!2907)

(assert (=> mapNonEmpty!11058 (= mapRest!11057 (store mapRest!11058 mapKey!11058 mapValue!11058))))

(declare-fun b!251939 () Bool)

(assert (=> b!251939 (= e!163372 tp_is_empty!6501)))

(declare-fun condMapEmpty!11058 () Bool)

(declare-fun mapDefault!11058 () ValueCell!2907)

(assert (=> mapNonEmpty!11057 (= condMapEmpty!11058 (= mapRest!11057 ((as const (Array (_ BitVec 32) ValueCell!2907)) mapDefault!11058)))))

(assert (=> mapNonEmpty!11057 (= tp!23198 (and e!163373 mapRes!11058))))

(assert (= (and mapNonEmpty!11057 condMapEmpty!11058) mapIsEmpty!11058))

(assert (= (and mapNonEmpty!11057 (not condMapEmpty!11058)) mapNonEmpty!11058))

(assert (= (and mapNonEmpty!11058 ((_ is ValueCellFull!2907) mapValue!11058)) b!251939))

(assert (= (and mapNonEmpty!11057 ((_ is ValueCellFull!2907) mapDefault!11058)) b!251940))

(declare-fun m!268227 () Bool)

(assert (=> mapNonEmpty!11058 m!268227))

(declare-fun b_lambda!8111 () Bool)

(assert (= b_lambda!8109 (or (and b!251415 b_free!6639) b_lambda!8111)))

(declare-fun b_lambda!8113 () Bool)

(assert (= b_lambda!8107 (or (and b!251415 b_free!6639) b_lambda!8113)))

(check-sat (not d!61249) (not bm!23702) (not d!61201) (not d!61173) (not d!61229) (not b!251825) (not b!251810) (not b!251708) (not b!251761) (not b!251828) (not b_lambda!8113) (not b!251890) (not b!251764) (not b!251768) (not b!251709) (not b!251750) (not bm!23710) (not d!61217) (not bm!23694) (not d!61207) (not b!251795) (not d!61197) (not b!251863) (not d!61237) (not d!61233) (not b_lambda!8105) (not d!61193) (not d!61181) (not b!251753) (not d!61279) (not b!251804) (not bm!23698) (not d!61245) (not d!61231) (not b_lambda!8111) (not b!251760) (not b!251893) (not b!251765) (not d!61275) (not b!251827) (not b!251823) (not d!61281) (not b!251834) (not bm!23699) (not bm!23697) (not b!251832) (not d!61227) (not b!251747) (not d!61273) (not b!251716) (not b!251830) (not d!61277) (not b!251713) (not b!251776) (not b!251904) (not d!61221) (not d!61225) (not bm!23705) (not d!61189) (not b!251848) (not d!61211) (not d!61179) (not b!251797) (not b!251842) (not b!251744) (not d!61195) (not bm!23704) (not b!251924) (not bm!23700) (not b!251748) (not b!251856) (not b!251746) (not b!251819) (not d!61267) (not mapNonEmpty!11058) (not b!251816) (not b!251838) (not b!251718) (not b!251792) (not d!61239) (not bm!23701) (not b!251770) (not b!251759) (not d!61243) (not b!251767) (not b!251749) (not d!61223) (not b!251809) (not d!61187) (not b!251889) (not b!251843) (not b_next!6639) (not b!251811) (not b!251938) (not b!251852) (not b!251745) (not b!251820) (not d!61241) (not b!251817) (not bm!23711) (not b!251805) (not d!61235) (not d!61289) (not b!251799) (not d!61183) (not b!251715) (not bm!23703) (not d!61203) (not b!251711) (not d!61247) (not b!251806) tp_is_empty!6501 b_and!13675 (not b!251826) (not d!61263) (not b!251846) (not d!61285))
(check-sat b_and!13675 (not b_next!6639))
