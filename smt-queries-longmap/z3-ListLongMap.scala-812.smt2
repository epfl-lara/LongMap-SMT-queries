; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19764 () Bool)

(assert start!19764)

(declare-fun b!193476 () Bool)

(declare-fun b_free!4711 () Bool)

(declare-fun b_next!4711 () Bool)

(assert (=> b!193476 (= b_free!4711 (not b_next!4711))))

(declare-fun tp!16999 () Bool)

(declare-fun b_and!11395 () Bool)

(assert (=> b!193476 (= tp!16999 b_and!11395)))

(declare-fun b!193474 () Bool)

(declare-fun res!91407 () Bool)

(declare-fun e!127297 () Bool)

(assert (=> b!193474 (=> res!91407 e!127297)))

(declare-datatypes ((V!5625 0))(
  ( (V!5626 (val!2286 Int)) )
))
(declare-datatypes ((ValueCell!1898 0))(
  ( (ValueCellFull!1898 (v!4239 V!5625)) (EmptyCell!1898) )
))
(declare-datatypes ((array!8195 0))(
  ( (array!8196 (arr!3856 (Array (_ BitVec 32) (_ BitVec 64))) (size!4181 (_ BitVec 32))) )
))
(declare-datatypes ((array!8197 0))(
  ( (array!8198 (arr!3857 (Array (_ BitVec 32) ValueCell!1898)) (size!4182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2704 0))(
  ( (LongMapFixedSize!2705 (defaultEntry!3952 Int) (mask!9208 (_ BitVec 32)) (extraKeys!3689 (_ BitVec 32)) (zeroValue!3793 V!5625) (minValue!3793 V!5625) (_size!1401 (_ BitVec 32)) (_keys!5943 array!8195) (_values!3935 array!8197) (_vacant!1401 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2704)

(assert (=> b!193474 (= res!91407 (or (not (= (size!4182 (_values!3935 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9208 thiss!1248)))) (not (= (size!4181 (_keys!5943 thiss!1248)) (size!4182 (_values!3935 thiss!1248)))) (bvslt (mask!9208 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3689 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3689 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193475 () Bool)

(declare-fun e!127295 () Bool)

(declare-fun tp_is_empty!4483 () Bool)

(assert (=> b!193475 (= e!127295 tp_is_empty!4483)))

(declare-fun e!127293 () Bool)

(declare-fun e!127291 () Bool)

(declare-fun array_inv!2503 (array!8195) Bool)

(declare-fun array_inv!2504 (array!8197) Bool)

(assert (=> b!193476 (= e!127291 (and tp!16999 tp_is_empty!4483 (array_inv!2503 (_keys!5943 thiss!1248)) (array_inv!2504 (_values!3935 thiss!1248)) e!127293))))

(declare-fun res!91412 () Bool)

(declare-fun e!127296 () Bool)

(assert (=> start!19764 (=> (not res!91412) (not e!127296))))

(declare-fun valid!1126 (LongMapFixedSize!2704) Bool)

(assert (=> start!19764 (= res!91412 (valid!1126 thiss!1248))))

(assert (=> start!19764 e!127296))

(assert (=> start!19764 e!127291))

(assert (=> start!19764 true))

(assert (=> start!19764 tp_is_empty!4483))

(declare-datatypes ((SeekEntryResult!693 0))(
  ( (MissingZero!693 (index!4942 (_ BitVec 32))) (Found!693 (index!4943 (_ BitVec 32))) (Intermediate!693 (undefined!1505 Bool) (index!4944 (_ BitVec 32)) (x!20670 (_ BitVec 32))) (Undefined!693) (MissingVacant!693 (index!4945 (_ BitVec 32))) )
))
(declare-fun lt!96238 () SeekEntryResult!693)

(declare-fun b!193477 () Bool)

(declare-fun e!127292 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!193477 (= e!127292 (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96238)) key!828))))

(declare-fun b!193478 () Bool)

(declare-fun res!91408 () Bool)

(assert (=> b!193478 (=> res!91408 e!127297)))

(assert (=> b!193478 (= res!91408 (or (bvslt (index!4943 lt!96238) #b00000000000000000000000000000000) (bvsge (index!4943 lt!96238) (size!4181 (_keys!5943 thiss!1248)))))))

(declare-fun b!193479 () Bool)

(declare-fun mapRes!7754 () Bool)

(assert (=> b!193479 (= e!127293 (and e!127295 mapRes!7754))))

(declare-fun condMapEmpty!7754 () Bool)

(declare-fun mapDefault!7754 () ValueCell!1898)

(assert (=> b!193479 (= condMapEmpty!7754 (= (arr!3857 (_values!3935 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1898)) mapDefault!7754)))))

(declare-fun b!193480 () Bool)

(declare-datatypes ((Unit!5810 0))(
  ( (Unit!5811) )
))
(declare-fun e!127288 () Unit!5810)

(declare-fun Unit!5812 () Unit!5810)

(assert (=> b!193480 (= e!127288 Unit!5812)))

(declare-fun lt!96241 () Unit!5810)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!180 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5810)

(assert (=> b!193480 (= lt!96241 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!180 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> b!193480 false))

(declare-fun mapIsEmpty!7754 () Bool)

(assert (=> mapIsEmpty!7754 mapRes!7754))

(declare-fun b!193481 () Bool)

(declare-fun res!91409 () Bool)

(assert (=> b!193481 (=> res!91409 e!127297)))

(declare-datatypes ((List!2423 0))(
  ( (Nil!2420) (Cons!2419 (h!3060 (_ BitVec 64)) (t!7338 List!2423)) )
))
(declare-fun arrayNoDuplicates!0 (array!8195 (_ BitVec 32) List!2423) Bool)

(assert (=> b!193481 (= res!91409 (not (arrayNoDuplicates!0 (_keys!5943 thiss!1248) #b00000000000000000000000000000000 Nil!2420)))))

(declare-fun b!193482 () Bool)

(declare-fun e!127289 () Bool)

(assert (=> b!193482 (= e!127289 (not e!127297))))

(declare-fun res!91411 () Bool)

(assert (=> b!193482 (=> res!91411 e!127297)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193482 (= res!91411 (not (validMask!0 (mask!9208 thiss!1248))))))

(declare-fun v!309 () V!5625)

(declare-datatypes ((tuple2!3508 0))(
  ( (tuple2!3509 (_1!1765 (_ BitVec 64)) (_2!1765 V!5625)) )
))
(declare-datatypes ((List!2424 0))(
  ( (Nil!2421) (Cons!2420 (h!3061 tuple2!3508) (t!7339 List!2424)) )
))
(declare-datatypes ((ListLongMap!2417 0))(
  ( (ListLongMap!2418 (toList!1224 List!2424)) )
))
(declare-fun lt!96240 () ListLongMap!2417)

(declare-fun +!316 (ListLongMap!2417 tuple2!3508) ListLongMap!2417)

(declare-fun getCurrentListMap!857 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) Int) ListLongMap!2417)

(assert (=> b!193482 (= (+!316 lt!96240 (tuple2!3509 key!828 v!309)) (getCurrentListMap!857 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96237 () Unit!5810)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!132 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) (_ BitVec 64) V!5625 Int) Unit!5810)

(assert (=> b!193482 (= lt!96237 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!132 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4943 lt!96238) key!828 v!309 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96236 () Unit!5810)

(assert (=> b!193482 (= lt!96236 e!127288)))

(declare-fun c!34896 () Bool)

(declare-fun contains!1353 (ListLongMap!2417 (_ BitVec 64)) Bool)

(assert (=> b!193482 (= c!34896 (contains!1353 lt!96240 key!828))))

(assert (=> b!193482 (= lt!96240 (getCurrentListMap!857 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193483 () Bool)

(declare-fun lt!96239 () Unit!5810)

(assert (=> b!193483 (= e!127288 lt!96239)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!180 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5810)

(assert (=> b!193483 (= lt!96239 (lemmaInListMapThenSeekEntryOrOpenFindsIt!180 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(declare-fun res!91406 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193483 (= res!91406 (inRange!0 (index!4943 lt!96238) (mask!9208 thiss!1248)))))

(assert (=> b!193483 (=> (not res!91406) (not e!127292))))

(assert (=> b!193483 e!127292))

(declare-fun b!193484 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193484 (= e!127297 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96238))))))

(declare-fun b!193485 () Bool)

(declare-fun res!91404 () Bool)

(assert (=> b!193485 (=> res!91404 e!127297)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8195 (_ BitVec 32)) Bool)

(assert (=> b!193485 (= res!91404 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5943 thiss!1248) (mask!9208 thiss!1248))))))

(declare-fun b!193486 () Bool)

(declare-fun res!91405 () Bool)

(assert (=> b!193486 (=> (not res!91405) (not e!127296))))

(assert (=> b!193486 (= res!91405 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193487 () Bool)

(declare-fun e!127294 () Bool)

(assert (=> b!193487 (= e!127294 tp_is_empty!4483)))

(declare-fun mapNonEmpty!7754 () Bool)

(declare-fun tp!17000 () Bool)

(assert (=> mapNonEmpty!7754 (= mapRes!7754 (and tp!17000 e!127294))))

(declare-fun mapRest!7754 () (Array (_ BitVec 32) ValueCell!1898))

(declare-fun mapValue!7754 () ValueCell!1898)

(declare-fun mapKey!7754 () (_ BitVec 32))

(assert (=> mapNonEmpty!7754 (= (arr!3857 (_values!3935 thiss!1248)) (store mapRest!7754 mapKey!7754 mapValue!7754))))

(declare-fun b!193488 () Bool)

(assert (=> b!193488 (= e!127296 e!127289)))

(declare-fun res!91410 () Bool)

(assert (=> b!193488 (=> (not res!91410) (not e!127289))))

(get-info :version)

(assert (=> b!193488 (= res!91410 (and (not ((_ is Undefined!693) lt!96238)) (not ((_ is MissingVacant!693) lt!96238)) (not ((_ is MissingZero!693) lt!96238)) ((_ is Found!693) lt!96238)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8195 (_ BitVec 32)) SeekEntryResult!693)

(assert (=> b!193488 (= lt!96238 (seekEntryOrOpen!0 key!828 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(assert (= (and start!19764 res!91412) b!193486))

(assert (= (and b!193486 res!91405) b!193488))

(assert (= (and b!193488 res!91410) b!193482))

(assert (= (and b!193482 c!34896) b!193483))

(assert (= (and b!193482 (not c!34896)) b!193480))

(assert (= (and b!193483 res!91406) b!193477))

(assert (= (and b!193482 (not res!91411)) b!193474))

(assert (= (and b!193474 (not res!91407)) b!193485))

(assert (= (and b!193485 (not res!91404)) b!193481))

(assert (= (and b!193481 (not res!91409)) b!193478))

(assert (= (and b!193478 (not res!91408)) b!193484))

(assert (= (and b!193479 condMapEmpty!7754) mapIsEmpty!7754))

(assert (= (and b!193479 (not condMapEmpty!7754)) mapNonEmpty!7754))

(assert (= (and mapNonEmpty!7754 ((_ is ValueCellFull!1898) mapValue!7754)) b!193487))

(assert (= (and b!193479 ((_ is ValueCellFull!1898) mapDefault!7754)) b!193475))

(assert (= b!193476 b!193479))

(assert (= start!19764 b!193476))

(declare-fun m!219773 () Bool)

(assert (=> b!193481 m!219773))

(declare-fun m!219775 () Bool)

(assert (=> b!193482 m!219775))

(declare-fun m!219777 () Bool)

(assert (=> b!193482 m!219777))

(declare-fun m!219779 () Bool)

(assert (=> b!193482 m!219779))

(declare-fun m!219781 () Bool)

(assert (=> b!193482 m!219781))

(declare-fun m!219783 () Bool)

(assert (=> b!193482 m!219783))

(declare-fun m!219785 () Bool)

(assert (=> b!193482 m!219785))

(declare-fun m!219787 () Bool)

(assert (=> b!193482 m!219787))

(declare-fun m!219789 () Bool)

(assert (=> b!193476 m!219789))

(declare-fun m!219791 () Bool)

(assert (=> b!193476 m!219791))

(declare-fun m!219793 () Bool)

(assert (=> b!193480 m!219793))

(declare-fun m!219795 () Bool)

(assert (=> b!193485 m!219795))

(declare-fun m!219797 () Bool)

(assert (=> mapNonEmpty!7754 m!219797))

(declare-fun m!219799 () Bool)

(assert (=> b!193477 m!219799))

(assert (=> b!193484 m!219799))

(assert (=> b!193484 m!219799))

(declare-fun m!219801 () Bool)

(assert (=> b!193484 m!219801))

(declare-fun m!219803 () Bool)

(assert (=> start!19764 m!219803))

(declare-fun m!219805 () Bool)

(assert (=> b!193488 m!219805))

(declare-fun m!219807 () Bool)

(assert (=> b!193483 m!219807))

(declare-fun m!219809 () Bool)

(assert (=> b!193483 m!219809))

(check-sat b_and!11395 (not b!193480) (not b!193481) (not b!193488) (not start!19764) (not b_next!4711) (not b!193485) (not b!193484) (not b!193483) (not b!193482) (not b!193476) tp_is_empty!4483 (not mapNonEmpty!7754))
(check-sat b_and!11395 (not b_next!4711))
(get-model)

(declare-fun d!56457 () Bool)

(declare-fun e!127360 () Bool)

(assert (=> d!56457 e!127360))

(declare-fun res!91472 () Bool)

(assert (=> d!56457 (=> (not res!91472) (not e!127360))))

(declare-fun lt!96282 () SeekEntryResult!693)

(assert (=> d!56457 (= res!91472 ((_ is Found!693) lt!96282))))

(assert (=> d!56457 (= lt!96282 (seekEntryOrOpen!0 key!828 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(declare-fun lt!96283 () Unit!5810)

(declare-fun choose!1067 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5810)

(assert (=> d!56457 (= lt!96283 (choose!1067 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> d!56457 (validMask!0 (mask!9208 thiss!1248))))

(assert (=> d!56457 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!180 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)) lt!96283)))

(declare-fun b!193583 () Bool)

(declare-fun res!91471 () Bool)

(assert (=> b!193583 (=> (not res!91471) (not e!127360))))

(assert (=> b!193583 (= res!91471 (inRange!0 (index!4943 lt!96282) (mask!9208 thiss!1248)))))

(declare-fun b!193584 () Bool)

(assert (=> b!193584 (= e!127360 (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96282)) key!828))))

(assert (=> b!193584 (and (bvsge (index!4943 lt!96282) #b00000000000000000000000000000000) (bvslt (index!4943 lt!96282) (size!4181 (_keys!5943 thiss!1248))))))

(assert (= (and d!56457 res!91472) b!193583))

(assert (= (and b!193583 res!91471) b!193584))

(assert (=> d!56457 m!219805))

(declare-fun m!219887 () Bool)

(assert (=> d!56457 m!219887))

(assert (=> d!56457 m!219783))

(declare-fun m!219889 () Bool)

(assert (=> b!193583 m!219889))

(declare-fun m!219891 () Bool)

(assert (=> b!193584 m!219891))

(assert (=> b!193483 d!56457))

(declare-fun d!56459 () Bool)

(assert (=> d!56459 (= (inRange!0 (index!4943 lt!96238) (mask!9208 thiss!1248)) (and (bvsge (index!4943 lt!96238) #b00000000000000000000000000000000) (bvslt (index!4943 lt!96238) (bvadd (mask!9208 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193483 d!56459))

(declare-fun d!56461 () Bool)

(declare-fun res!91479 () Bool)

(declare-fun e!127363 () Bool)

(assert (=> d!56461 (=> (not res!91479) (not e!127363))))

(declare-fun simpleValid!203 (LongMapFixedSize!2704) Bool)

(assert (=> d!56461 (= res!91479 (simpleValid!203 thiss!1248))))

(assert (=> d!56461 (= (valid!1126 thiss!1248) e!127363)))

(declare-fun b!193591 () Bool)

(declare-fun res!91480 () Bool)

(assert (=> b!193591 (=> (not res!91480) (not e!127363))))

(declare-fun arrayCountValidKeys!0 (array!8195 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193591 (= res!91480 (= (arrayCountValidKeys!0 (_keys!5943 thiss!1248) #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))) (_size!1401 thiss!1248)))))

(declare-fun b!193592 () Bool)

(declare-fun res!91481 () Bool)

(assert (=> b!193592 (=> (not res!91481) (not e!127363))))

(assert (=> b!193592 (= res!91481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(declare-fun b!193593 () Bool)

(assert (=> b!193593 (= e!127363 (arrayNoDuplicates!0 (_keys!5943 thiss!1248) #b00000000000000000000000000000000 Nil!2420))))

(assert (= (and d!56461 res!91479) b!193591))

(assert (= (and b!193591 res!91480) b!193592))

(assert (= (and b!193592 res!91481) b!193593))

(declare-fun m!219893 () Bool)

(assert (=> d!56461 m!219893))

(declare-fun m!219895 () Bool)

(assert (=> b!193591 m!219895))

(assert (=> b!193592 m!219795))

(assert (=> b!193593 m!219773))

(assert (=> start!19764 d!56461))

(declare-fun b!193606 () Bool)

(declare-fun c!34911 () Bool)

(declare-fun lt!96290 () (_ BitVec 64))

(assert (=> b!193606 (= c!34911 (= lt!96290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127372 () SeekEntryResult!693)

(declare-fun e!127371 () SeekEntryResult!693)

(assert (=> b!193606 (= e!127372 e!127371)))

(declare-fun b!193607 () Bool)

(declare-fun lt!96292 () SeekEntryResult!693)

(assert (=> b!193607 (= e!127371 (MissingZero!693 (index!4944 lt!96292)))))

(declare-fun d!56463 () Bool)

(declare-fun lt!96291 () SeekEntryResult!693)

(assert (=> d!56463 (and (or ((_ is Undefined!693) lt!96291) (not ((_ is Found!693) lt!96291)) (and (bvsge (index!4943 lt!96291) #b00000000000000000000000000000000) (bvslt (index!4943 lt!96291) (size!4181 (_keys!5943 thiss!1248))))) (or ((_ is Undefined!693) lt!96291) ((_ is Found!693) lt!96291) (not ((_ is MissingZero!693) lt!96291)) (and (bvsge (index!4942 lt!96291) #b00000000000000000000000000000000) (bvslt (index!4942 lt!96291) (size!4181 (_keys!5943 thiss!1248))))) (or ((_ is Undefined!693) lt!96291) ((_ is Found!693) lt!96291) ((_ is MissingZero!693) lt!96291) (not ((_ is MissingVacant!693) lt!96291)) (and (bvsge (index!4945 lt!96291) #b00000000000000000000000000000000) (bvslt (index!4945 lt!96291) (size!4181 (_keys!5943 thiss!1248))))) (or ((_ is Undefined!693) lt!96291) (ite ((_ is Found!693) lt!96291) (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96291)) key!828) (ite ((_ is MissingZero!693) lt!96291) (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4942 lt!96291)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!693) lt!96291) (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4945 lt!96291)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!127370 () SeekEntryResult!693)

(assert (=> d!56463 (= lt!96291 e!127370)))

(declare-fun c!34909 () Bool)

(assert (=> d!56463 (= c!34909 (and ((_ is Intermediate!693) lt!96292) (undefined!1505 lt!96292)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8195 (_ BitVec 32)) SeekEntryResult!693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56463 (= lt!96292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9208 thiss!1248)) key!828 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(assert (=> d!56463 (validMask!0 (mask!9208 thiss!1248))))

(assert (=> d!56463 (= (seekEntryOrOpen!0 key!828 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)) lt!96291)))

(declare-fun b!193608 () Bool)

(assert (=> b!193608 (= e!127370 Undefined!693)))

(declare-fun b!193609 () Bool)

(assert (=> b!193609 (= e!127372 (Found!693 (index!4944 lt!96292)))))

(declare-fun b!193610 () Bool)

(assert (=> b!193610 (= e!127370 e!127372)))

(assert (=> b!193610 (= lt!96290 (select (arr!3856 (_keys!5943 thiss!1248)) (index!4944 lt!96292)))))

(declare-fun c!34910 () Bool)

(assert (=> b!193610 (= c!34910 (= lt!96290 key!828))))

(declare-fun b!193611 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8195 (_ BitVec 32)) SeekEntryResult!693)

(assert (=> b!193611 (= e!127371 (seekKeyOrZeroReturnVacant!0 (x!20670 lt!96292) (index!4944 lt!96292) (index!4944 lt!96292) key!828 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(assert (= (and d!56463 c!34909) b!193608))

(assert (= (and d!56463 (not c!34909)) b!193610))

(assert (= (and b!193610 c!34910) b!193609))

(assert (= (and b!193610 (not c!34910)) b!193606))

(assert (= (and b!193606 c!34911) b!193607))

(assert (= (and b!193606 (not c!34911)) b!193611))

(declare-fun m!219897 () Bool)

(assert (=> d!56463 m!219897))

(declare-fun m!219899 () Bool)

(assert (=> d!56463 m!219899))

(declare-fun m!219901 () Bool)

(assert (=> d!56463 m!219901))

(assert (=> d!56463 m!219897))

(declare-fun m!219903 () Bool)

(assert (=> d!56463 m!219903))

(assert (=> d!56463 m!219783))

(declare-fun m!219905 () Bool)

(assert (=> d!56463 m!219905))

(declare-fun m!219907 () Bool)

(assert (=> b!193610 m!219907))

(declare-fun m!219909 () Bool)

(assert (=> b!193611 m!219909))

(assert (=> b!193488 d!56463))

(declare-fun d!56465 () Bool)

(assert (=> d!56465 (= (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96238))) (and (not (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96238)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4943 lt!96238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193484 d!56465))

(declare-fun bm!19547 () Bool)

(declare-fun call!19550 () Bool)

(declare-fun arrayContainsKey!0 (array!8195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19547 (= call!19550 (arrayContainsKey!0 (_keys!5943 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun d!56467 () Bool)

(declare-fun e!127382 () Bool)

(assert (=> d!56467 e!127382))

(declare-fun c!34916 () Bool)

(declare-fun lt!96298 () SeekEntryResult!693)

(assert (=> d!56467 (= c!34916 ((_ is MissingZero!693) lt!96298))))

(assert (=> d!56467 (= lt!96298 (seekEntryOrOpen!0 key!828 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(declare-fun lt!96297 () Unit!5810)

(declare-fun choose!1068 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5810)

(assert (=> d!56467 (= lt!96297 (choose!1068 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> d!56467 (validMask!0 (mask!9208 thiss!1248))))

(assert (=> d!56467 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!180 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)) lt!96297)))

(declare-fun b!193628 () Bool)

(declare-fun res!91490 () Bool)

(declare-fun e!127381 () Bool)

(assert (=> b!193628 (=> (not res!91490) (not e!127381))))

(assert (=> b!193628 (= res!91490 (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4945 lt!96298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193628 (and (bvsge (index!4945 lt!96298) #b00000000000000000000000000000000) (bvslt (index!4945 lt!96298) (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193629 () Bool)

(assert (=> b!193629 (= e!127381 (not call!19550))))

(declare-fun b!193630 () Bool)

(declare-fun e!127384 () Bool)

(assert (=> b!193630 (= e!127382 e!127384)))

(declare-fun c!34917 () Bool)

(assert (=> b!193630 (= c!34917 ((_ is MissingVacant!693) lt!96298))))

(declare-fun bm!19548 () Bool)

(declare-fun call!19551 () Bool)

(assert (=> bm!19548 (= call!19551 (inRange!0 (ite c!34916 (index!4942 lt!96298) (index!4945 lt!96298)) (mask!9208 thiss!1248)))))

(declare-fun b!193631 () Bool)

(declare-fun e!127383 () Bool)

(assert (=> b!193631 (= e!127382 e!127383)))

(declare-fun res!91493 () Bool)

(assert (=> b!193631 (= res!91493 call!19551)))

(assert (=> b!193631 (=> (not res!91493) (not e!127383))))

(declare-fun b!193632 () Bool)

(assert (=> b!193632 (= e!127383 (not call!19550))))

(declare-fun b!193633 () Bool)

(assert (=> b!193633 (= e!127384 ((_ is Undefined!693) lt!96298))))

(declare-fun b!193634 () Bool)

(assert (=> b!193634 (and (bvsge (index!4942 lt!96298) #b00000000000000000000000000000000) (bvslt (index!4942 lt!96298) (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun res!91492 () Bool)

(assert (=> b!193634 (= res!91492 (= (select (arr!3856 (_keys!5943 thiss!1248)) (index!4942 lt!96298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193634 (=> (not res!91492) (not e!127383))))

(declare-fun b!193635 () Bool)

(declare-fun res!91491 () Bool)

(assert (=> b!193635 (=> (not res!91491) (not e!127381))))

(assert (=> b!193635 (= res!91491 call!19551)))

(assert (=> b!193635 (= e!127384 e!127381)))

(assert (= (and d!56467 c!34916) b!193631))

(assert (= (and d!56467 (not c!34916)) b!193630))

(assert (= (and b!193631 res!91493) b!193634))

(assert (= (and b!193634 res!91492) b!193632))

(assert (= (and b!193630 c!34917) b!193635))

(assert (= (and b!193630 (not c!34917)) b!193633))

(assert (= (and b!193635 res!91491) b!193628))

(assert (= (and b!193628 res!91490) b!193629))

(assert (= (or b!193631 b!193635) bm!19548))

(assert (= (or b!193632 b!193629) bm!19547))

(declare-fun m!219911 () Bool)

(assert (=> b!193634 m!219911))

(assert (=> d!56467 m!219805))

(declare-fun m!219913 () Bool)

(assert (=> d!56467 m!219913))

(assert (=> d!56467 m!219783))

(declare-fun m!219915 () Bool)

(assert (=> b!193628 m!219915))

(declare-fun m!219917 () Bool)

(assert (=> bm!19547 m!219917))

(declare-fun m!219919 () Bool)

(assert (=> bm!19548 m!219919))

(assert (=> b!193480 d!56467))

(declare-fun b!193644 () Bool)

(declare-fun e!127393 () Bool)

(declare-fun e!127392 () Bool)

(assert (=> b!193644 (= e!127393 e!127392)))

(declare-fun c!34920 () Bool)

(assert (=> b!193644 (= c!34920 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56469 () Bool)

(declare-fun res!91499 () Bool)

(assert (=> d!56469 (=> res!91499 e!127393)))

(assert (=> d!56469 (= res!91499 (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(assert (=> d!56469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5943 thiss!1248) (mask!9208 thiss!1248)) e!127393)))

(declare-fun b!193645 () Bool)

(declare-fun e!127391 () Bool)

(assert (=> b!193645 (= e!127392 e!127391)))

(declare-fun lt!96307 () (_ BitVec 64))

(assert (=> b!193645 (= lt!96307 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96305 () Unit!5810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8195 (_ BitVec 64) (_ BitVec 32)) Unit!5810)

(assert (=> b!193645 (= lt!96305 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5943 thiss!1248) lt!96307 #b00000000000000000000000000000000))))

(assert (=> b!193645 (arrayContainsKey!0 (_keys!5943 thiss!1248) lt!96307 #b00000000000000000000000000000000)))

(declare-fun lt!96306 () Unit!5810)

(assert (=> b!193645 (= lt!96306 lt!96305)))

(declare-fun res!91498 () Bool)

(assert (=> b!193645 (= res!91498 (= (seekEntryOrOpen!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000) (_keys!5943 thiss!1248) (mask!9208 thiss!1248)) (Found!693 #b00000000000000000000000000000000)))))

(assert (=> b!193645 (=> (not res!91498) (not e!127391))))

(declare-fun b!193646 () Bool)

(declare-fun call!19554 () Bool)

(assert (=> b!193646 (= e!127392 call!19554)))

(declare-fun b!193647 () Bool)

(assert (=> b!193647 (= e!127391 call!19554)))

(declare-fun bm!19551 () Bool)

(assert (=> bm!19551 (= call!19554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5943 thiss!1248) (mask!9208 thiss!1248)))))

(assert (= (and d!56469 (not res!91499)) b!193644))

(assert (= (and b!193644 c!34920) b!193645))

(assert (= (and b!193644 (not c!34920)) b!193646))

(assert (= (and b!193645 res!91498) b!193647))

(assert (= (or b!193647 b!193646) bm!19551))

(declare-fun m!219921 () Bool)

(assert (=> b!193644 m!219921))

(assert (=> b!193644 m!219921))

(declare-fun m!219923 () Bool)

(assert (=> b!193644 m!219923))

(assert (=> b!193645 m!219921))

(declare-fun m!219925 () Bool)

(assert (=> b!193645 m!219925))

(declare-fun m!219927 () Bool)

(assert (=> b!193645 m!219927))

(assert (=> b!193645 m!219921))

(declare-fun m!219929 () Bool)

(assert (=> b!193645 m!219929))

(declare-fun m!219931 () Bool)

(assert (=> bm!19551 m!219931))

(assert (=> b!193485 d!56469))

(declare-fun d!56471 () Bool)

(assert (=> d!56471 (= (array_inv!2503 (_keys!5943 thiss!1248)) (bvsge (size!4181 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193476 d!56471))

(declare-fun d!56473 () Bool)

(assert (=> d!56473 (= (array_inv!2504 (_values!3935 thiss!1248)) (bvsge (size!4182 (_values!3935 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193476 d!56473))

(declare-fun b!193658 () Bool)

(declare-fun e!127404 () Bool)

(declare-fun e!127402 () Bool)

(assert (=> b!193658 (= e!127404 e!127402)))

(declare-fun res!91508 () Bool)

(assert (=> b!193658 (=> (not res!91508) (not e!127402))))

(declare-fun e!127403 () Bool)

(assert (=> b!193658 (= res!91508 (not e!127403))))

(declare-fun res!91506 () Bool)

(assert (=> b!193658 (=> (not res!91506) (not e!127403))))

(assert (=> b!193658 (= res!91506 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193659 () Bool)

(declare-fun contains!1354 (List!2423 (_ BitVec 64)) Bool)

(assert (=> b!193659 (= e!127403 (contains!1354 Nil!2420 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193660 () Bool)

(declare-fun e!127405 () Bool)

(declare-fun call!19557 () Bool)

(assert (=> b!193660 (= e!127405 call!19557)))

(declare-fun bm!19554 () Bool)

(declare-fun c!34923 () Bool)

(assert (=> bm!19554 (= call!19557 (arrayNoDuplicates!0 (_keys!5943 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34923 (Cons!2419 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000) Nil!2420) Nil!2420)))))

(declare-fun b!193661 () Bool)

(assert (=> b!193661 (= e!127405 call!19557)))

(declare-fun d!56475 () Bool)

(declare-fun res!91507 () Bool)

(assert (=> d!56475 (=> res!91507 e!127404)))

(assert (=> d!56475 (= res!91507 (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(assert (=> d!56475 (= (arrayNoDuplicates!0 (_keys!5943 thiss!1248) #b00000000000000000000000000000000 Nil!2420) e!127404)))

(declare-fun b!193662 () Bool)

(assert (=> b!193662 (= e!127402 e!127405)))

(assert (=> b!193662 (= c!34923 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56475 (not res!91507)) b!193658))

(assert (= (and b!193658 res!91506) b!193659))

(assert (= (and b!193658 res!91508) b!193662))

(assert (= (and b!193662 c!34923) b!193660))

(assert (= (and b!193662 (not c!34923)) b!193661))

(assert (= (or b!193660 b!193661) bm!19554))

(assert (=> b!193658 m!219921))

(assert (=> b!193658 m!219921))

(assert (=> b!193658 m!219923))

(assert (=> b!193659 m!219921))

(assert (=> b!193659 m!219921))

(declare-fun m!219933 () Bool)

(assert (=> b!193659 m!219933))

(assert (=> bm!19554 m!219921))

(declare-fun m!219935 () Bool)

(assert (=> bm!19554 m!219935))

(assert (=> b!193662 m!219921))

(assert (=> b!193662 m!219921))

(assert (=> b!193662 m!219923))

(assert (=> b!193481 d!56475))

(declare-fun d!56477 () Bool)

(assert (=> d!56477 (= (validMask!0 (mask!9208 thiss!1248)) (and (or (= (mask!9208 thiss!1248) #b00000000000000000000000000000111) (= (mask!9208 thiss!1248) #b00000000000000000000000000001111) (= (mask!9208 thiss!1248) #b00000000000000000000000000011111) (= (mask!9208 thiss!1248) #b00000000000000000000000000111111) (= (mask!9208 thiss!1248) #b00000000000000000000000001111111) (= (mask!9208 thiss!1248) #b00000000000000000000000011111111) (= (mask!9208 thiss!1248) #b00000000000000000000000111111111) (= (mask!9208 thiss!1248) #b00000000000000000000001111111111) (= (mask!9208 thiss!1248) #b00000000000000000000011111111111) (= (mask!9208 thiss!1248) #b00000000000000000000111111111111) (= (mask!9208 thiss!1248) #b00000000000000000001111111111111) (= (mask!9208 thiss!1248) #b00000000000000000011111111111111) (= (mask!9208 thiss!1248) #b00000000000000000111111111111111) (= (mask!9208 thiss!1248) #b00000000000000001111111111111111) (= (mask!9208 thiss!1248) #b00000000000000011111111111111111) (= (mask!9208 thiss!1248) #b00000000000000111111111111111111) (= (mask!9208 thiss!1248) #b00000000000001111111111111111111) (= (mask!9208 thiss!1248) #b00000000000011111111111111111111) (= (mask!9208 thiss!1248) #b00000000000111111111111111111111) (= (mask!9208 thiss!1248) #b00000000001111111111111111111111) (= (mask!9208 thiss!1248) #b00000000011111111111111111111111) (= (mask!9208 thiss!1248) #b00000000111111111111111111111111) (= (mask!9208 thiss!1248) #b00000001111111111111111111111111) (= (mask!9208 thiss!1248) #b00000011111111111111111111111111) (= (mask!9208 thiss!1248) #b00000111111111111111111111111111) (= (mask!9208 thiss!1248) #b00001111111111111111111111111111) (= (mask!9208 thiss!1248) #b00011111111111111111111111111111) (= (mask!9208 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9208 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193482 d!56477))

(declare-fun d!56479 () Bool)

(declare-fun e!127408 () Bool)

(assert (=> d!56479 e!127408))

(declare-fun res!91511 () Bool)

(assert (=> d!56479 (=> (not res!91511) (not e!127408))))

(assert (=> d!56479 (= res!91511 (and (bvsge (index!4943 lt!96238) #b00000000000000000000000000000000) (bvslt (index!4943 lt!96238) (size!4182 (_values!3935 thiss!1248)))))))

(declare-fun lt!96310 () Unit!5810)

(declare-fun choose!1069 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) (_ BitVec 64) V!5625 Int) Unit!5810)

(assert (=> d!56479 (= lt!96310 (choose!1069 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4943 lt!96238) key!828 v!309 (defaultEntry!3952 thiss!1248)))))

(assert (=> d!56479 (validMask!0 (mask!9208 thiss!1248))))

(assert (=> d!56479 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!132 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4943 lt!96238) key!828 v!309 (defaultEntry!3952 thiss!1248)) lt!96310)))

(declare-fun b!193665 () Bool)

(assert (=> b!193665 (= e!127408 (= (+!316 (getCurrentListMap!857 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)) (tuple2!3509 key!828 v!309)) (getCurrentListMap!857 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248))))))

(assert (= (and d!56479 res!91511) b!193665))

(declare-fun m!219937 () Bool)

(assert (=> d!56479 m!219937))

(assert (=> d!56479 m!219783))

(assert (=> b!193665 m!219775))

(assert (=> b!193665 m!219775))

(declare-fun m!219939 () Bool)

(assert (=> b!193665 m!219939))

(assert (=> b!193665 m!219777))

(assert (=> b!193665 m!219787))

(assert (=> b!193482 d!56479))

(declare-fun d!56481 () Bool)

(declare-fun e!127411 () Bool)

(assert (=> d!56481 e!127411))

(declare-fun res!91516 () Bool)

(assert (=> d!56481 (=> (not res!91516) (not e!127411))))

(declare-fun lt!96320 () ListLongMap!2417)

(assert (=> d!56481 (= res!91516 (contains!1353 lt!96320 (_1!1765 (tuple2!3509 key!828 v!309))))))

(declare-fun lt!96322 () List!2424)

(assert (=> d!56481 (= lt!96320 (ListLongMap!2418 lt!96322))))

(declare-fun lt!96321 () Unit!5810)

(declare-fun lt!96319 () Unit!5810)

(assert (=> d!56481 (= lt!96321 lt!96319)))

(declare-datatypes ((Option!248 0))(
  ( (Some!247 (v!4244 V!5625)) (None!246) )
))
(declare-fun getValueByKey!242 (List!2424 (_ BitVec 64)) Option!248)

(assert (=> d!56481 (= (getValueByKey!242 lt!96322 (_1!1765 (tuple2!3509 key!828 v!309))) (Some!247 (_2!1765 (tuple2!3509 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!132 (List!2424 (_ BitVec 64) V!5625) Unit!5810)

(assert (=> d!56481 (= lt!96319 (lemmaContainsTupThenGetReturnValue!132 lt!96322 (_1!1765 (tuple2!3509 key!828 v!309)) (_2!1765 (tuple2!3509 key!828 v!309))))))

(declare-fun insertStrictlySorted!135 (List!2424 (_ BitVec 64) V!5625) List!2424)

(assert (=> d!56481 (= lt!96322 (insertStrictlySorted!135 (toList!1224 lt!96240) (_1!1765 (tuple2!3509 key!828 v!309)) (_2!1765 (tuple2!3509 key!828 v!309))))))

(assert (=> d!56481 (= (+!316 lt!96240 (tuple2!3509 key!828 v!309)) lt!96320)))

(declare-fun b!193670 () Bool)

(declare-fun res!91517 () Bool)

(assert (=> b!193670 (=> (not res!91517) (not e!127411))))

(assert (=> b!193670 (= res!91517 (= (getValueByKey!242 (toList!1224 lt!96320) (_1!1765 (tuple2!3509 key!828 v!309))) (Some!247 (_2!1765 (tuple2!3509 key!828 v!309)))))))

(declare-fun b!193671 () Bool)

(declare-fun contains!1355 (List!2424 tuple2!3508) Bool)

(assert (=> b!193671 (= e!127411 (contains!1355 (toList!1224 lt!96320) (tuple2!3509 key!828 v!309)))))

(assert (= (and d!56481 res!91516) b!193670))

(assert (= (and b!193670 res!91517) b!193671))

(declare-fun m!219941 () Bool)

(assert (=> d!56481 m!219941))

(declare-fun m!219943 () Bool)

(assert (=> d!56481 m!219943))

(declare-fun m!219945 () Bool)

(assert (=> d!56481 m!219945))

(declare-fun m!219947 () Bool)

(assert (=> d!56481 m!219947))

(declare-fun m!219949 () Bool)

(assert (=> b!193670 m!219949))

(declare-fun m!219951 () Bool)

(assert (=> b!193671 m!219951))

(assert (=> b!193482 d!56481))

(declare-fun b!193714 () Bool)

(declare-fun e!127441 () Unit!5810)

(declare-fun Unit!5816 () Unit!5810)

(assert (=> b!193714 (= e!127441 Unit!5816)))

(declare-fun b!193715 () Bool)

(declare-fun e!127448 () Bool)

(declare-fun e!127438 () Bool)

(assert (=> b!193715 (= e!127448 e!127438)))

(declare-fun c!34938 () Bool)

(assert (=> b!193715 (= c!34938 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19569 () Bool)

(declare-fun call!19577 () Bool)

(declare-fun lt!96388 () ListLongMap!2417)

(assert (=> bm!19569 (= call!19577 (contains!1353 lt!96388 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193717 () Bool)

(declare-fun c!34937 () Bool)

(assert (=> b!193717 (= c!34937 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127439 () ListLongMap!2417)

(declare-fun e!127446 () ListLongMap!2417)

(assert (=> b!193717 (= e!127439 e!127446)))

(declare-fun b!193718 () Bool)

(declare-fun res!91537 () Bool)

(assert (=> b!193718 (=> (not res!91537) (not e!127448))))

(declare-fun e!127440 () Bool)

(assert (=> b!193718 (= res!91537 e!127440)))

(declare-fun res!91541 () Bool)

(assert (=> b!193718 (=> res!91541 e!127440)))

(declare-fun e!127444 () Bool)

(assert (=> b!193718 (= res!91541 (not e!127444))))

(declare-fun res!91542 () Bool)

(assert (=> b!193718 (=> (not res!91542) (not e!127444))))

(assert (=> b!193718 (= res!91542 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193719 () Bool)

(declare-fun res!91540 () Bool)

(assert (=> b!193719 (=> (not res!91540) (not e!127448))))

(declare-fun e!127445 () Bool)

(assert (=> b!193719 (= res!91540 e!127445)))

(declare-fun c!34936 () Bool)

(assert (=> b!193719 (= c!34936 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193720 () Bool)

(declare-fun call!19578 () ListLongMap!2417)

(assert (=> b!193720 (= e!127446 call!19578)))

(declare-fun b!193721 () Bool)

(declare-fun e!127443 () Bool)

(declare-fun apply!187 (ListLongMap!2417 (_ BitVec 64)) V!5625)

(declare-fun get!2228 (ValueCell!1898 V!5625) V!5625)

(declare-fun dynLambda!521 (Int (_ BitVec 64)) V!5625)

(assert (=> b!193721 (= e!127443 (= (apply!187 lt!96388 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)) (get!2228 (select (arr!3857 (_values!3935 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!521 (defaultEntry!3952 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4182 (_values!3935 thiss!1248))))))

(assert (=> b!193721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193722 () Bool)

(declare-fun lt!96370 () Unit!5810)

(assert (=> b!193722 (= e!127441 lt!96370)))

(declare-fun lt!96375 () ListLongMap!2417)

(declare-fun getCurrentListMapNoExtraKeys!208 (array!8195 array!8197 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) Int) ListLongMap!2417)

(assert (=> b!193722 (= lt!96375 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96386 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96379 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96379 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96368 () Unit!5810)

(declare-fun addStillContains!163 (ListLongMap!2417 (_ BitVec 64) V!5625 (_ BitVec 64)) Unit!5810)

(assert (=> b!193722 (= lt!96368 (addStillContains!163 lt!96375 lt!96386 (zeroValue!3793 thiss!1248) lt!96379))))

(assert (=> b!193722 (contains!1353 (+!316 lt!96375 (tuple2!3509 lt!96386 (zeroValue!3793 thiss!1248))) lt!96379)))

(declare-fun lt!96383 () Unit!5810)

(assert (=> b!193722 (= lt!96383 lt!96368)))

(declare-fun lt!96374 () ListLongMap!2417)

(assert (=> b!193722 (= lt!96374 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96382 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96382 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96377 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96377 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96369 () Unit!5810)

(declare-fun addApplyDifferent!163 (ListLongMap!2417 (_ BitVec 64) V!5625 (_ BitVec 64)) Unit!5810)

(assert (=> b!193722 (= lt!96369 (addApplyDifferent!163 lt!96374 lt!96382 (minValue!3793 thiss!1248) lt!96377))))

(assert (=> b!193722 (= (apply!187 (+!316 lt!96374 (tuple2!3509 lt!96382 (minValue!3793 thiss!1248))) lt!96377) (apply!187 lt!96374 lt!96377))))

(declare-fun lt!96371 () Unit!5810)

(assert (=> b!193722 (= lt!96371 lt!96369)))

(declare-fun lt!96380 () ListLongMap!2417)

(assert (=> b!193722 (= lt!96380 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96372 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96367 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96367 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96384 () Unit!5810)

(assert (=> b!193722 (= lt!96384 (addApplyDifferent!163 lt!96380 lt!96372 (zeroValue!3793 thiss!1248) lt!96367))))

(assert (=> b!193722 (= (apply!187 (+!316 lt!96380 (tuple2!3509 lt!96372 (zeroValue!3793 thiss!1248))) lt!96367) (apply!187 lt!96380 lt!96367))))

(declare-fun lt!96378 () Unit!5810)

(assert (=> b!193722 (= lt!96378 lt!96384)))

(declare-fun lt!96385 () ListLongMap!2417)

(assert (=> b!193722 (= lt!96385 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96381 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96387 () (_ BitVec 64))

(assert (=> b!193722 (= lt!96387 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193722 (= lt!96370 (addApplyDifferent!163 lt!96385 lt!96381 (minValue!3793 thiss!1248) lt!96387))))

(assert (=> b!193722 (= (apply!187 (+!316 lt!96385 (tuple2!3509 lt!96381 (minValue!3793 thiss!1248))) lt!96387) (apply!187 lt!96385 lt!96387))))

(declare-fun b!193723 () Bool)

(declare-fun e!127449 () Bool)

(assert (=> b!193723 (= e!127438 e!127449)))

(declare-fun res!91538 () Bool)

(assert (=> b!193723 (= res!91538 call!19577)))

(assert (=> b!193723 (=> (not res!91538) (not e!127449))))

(declare-fun bm!19570 () Bool)

(declare-fun call!19576 () ListLongMap!2417)

(assert (=> bm!19570 (= call!19576 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193724 () Bool)

(declare-fun call!19573 () ListLongMap!2417)

(assert (=> b!193724 (= e!127446 call!19573)))

(declare-fun b!193725 () Bool)

(declare-fun e!127442 () ListLongMap!2417)

(declare-fun call!19572 () ListLongMap!2417)

(assert (=> b!193725 (= e!127442 (+!316 call!19572 (tuple2!3509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248))))))

(declare-fun b!193726 () Bool)

(assert (=> b!193726 (= e!127439 call!19578)))

(declare-fun b!193727 () Bool)

(declare-fun e!127447 () Bool)

(assert (=> b!193727 (= e!127447 (= (apply!187 lt!96388 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3793 thiss!1248)))))

(declare-fun bm!19571 () Bool)

(declare-fun call!19575 () ListLongMap!2417)

(assert (=> bm!19571 (= call!19573 call!19575)))

(declare-fun d!56483 () Bool)

(assert (=> d!56483 e!127448))

(declare-fun res!91536 () Bool)

(assert (=> d!56483 (=> (not res!91536) (not e!127448))))

(assert (=> d!56483 (= res!91536 (or (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))))

(declare-fun lt!96373 () ListLongMap!2417)

(assert (=> d!56483 (= lt!96388 lt!96373)))

(declare-fun lt!96376 () Unit!5810)

(assert (=> d!56483 (= lt!96376 e!127441)))

(declare-fun c!34939 () Bool)

(declare-fun e!127450 () Bool)

(assert (=> d!56483 (= c!34939 e!127450)))

(declare-fun res!91539 () Bool)

(assert (=> d!56483 (=> (not res!91539) (not e!127450))))

(assert (=> d!56483 (= res!91539 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(assert (=> d!56483 (= lt!96373 e!127442)))

(declare-fun c!34940 () Bool)

(assert (=> d!56483 (= c!34940 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56483 (validMask!0 (mask!9208 thiss!1248))))

(assert (=> d!56483 (= (getCurrentListMap!857 (_keys!5943 thiss!1248) (_values!3935 thiss!1248) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)) lt!96388)))

(declare-fun b!193716 () Bool)

(assert (=> b!193716 (= e!127444 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193728 () Bool)

(assert (=> b!193728 (= e!127438 (not call!19577))))

(declare-fun b!193729 () Bool)

(assert (=> b!193729 (= e!127442 e!127439)))

(declare-fun c!34941 () Bool)

(assert (=> b!193729 (= c!34941 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19572 () Bool)

(assert (=> bm!19572 (= call!19572 (+!316 (ite c!34940 call!19576 (ite c!34941 call!19575 call!19573)) (ite (or c!34940 c!34941) (tuple2!3509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3793 thiss!1248)) (tuple2!3509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248)))))))

(declare-fun b!193730 () Bool)

(declare-fun call!19574 () Bool)

(assert (=> b!193730 (= e!127445 (not call!19574))))

(declare-fun bm!19573 () Bool)

(assert (=> bm!19573 (= call!19574 (contains!1353 lt!96388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19574 () Bool)

(assert (=> bm!19574 (= call!19575 call!19576)))

(declare-fun b!193731 () Bool)

(assert (=> b!193731 (= e!127440 e!127443)))

(declare-fun res!91543 () Bool)

(assert (=> b!193731 (=> (not res!91543) (not e!127443))))

(assert (=> b!193731 (= res!91543 (contains!1353 lt!96388 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193731 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193732 () Bool)

(assert (=> b!193732 (= e!127445 e!127447)))

(declare-fun res!91544 () Bool)

(assert (=> b!193732 (= res!91544 call!19574)))

(assert (=> b!193732 (=> (not res!91544) (not e!127447))))

(declare-fun bm!19575 () Bool)

(assert (=> bm!19575 (= call!19578 call!19572)))

(declare-fun b!193733 () Bool)

(assert (=> b!193733 (= e!127450 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193734 () Bool)

(assert (=> b!193734 (= e!127449 (= (apply!187 lt!96388 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3793 thiss!1248)))))

(assert (= (and d!56483 c!34940) b!193725))

(assert (= (and d!56483 (not c!34940)) b!193729))

(assert (= (and b!193729 c!34941) b!193726))

(assert (= (and b!193729 (not c!34941)) b!193717))

(assert (= (and b!193717 c!34937) b!193720))

(assert (= (and b!193717 (not c!34937)) b!193724))

(assert (= (or b!193720 b!193724) bm!19571))

(assert (= (or b!193726 bm!19571) bm!19574))

(assert (= (or b!193726 b!193720) bm!19575))

(assert (= (or b!193725 bm!19574) bm!19570))

(assert (= (or b!193725 bm!19575) bm!19572))

(assert (= (and d!56483 res!91539) b!193733))

(assert (= (and d!56483 c!34939) b!193722))

(assert (= (and d!56483 (not c!34939)) b!193714))

(assert (= (and d!56483 res!91536) b!193718))

(assert (= (and b!193718 res!91542) b!193716))

(assert (= (and b!193718 (not res!91541)) b!193731))

(assert (= (and b!193731 res!91543) b!193721))

(assert (= (and b!193718 res!91537) b!193719))

(assert (= (and b!193719 c!34936) b!193732))

(assert (= (and b!193719 (not c!34936)) b!193730))

(assert (= (and b!193732 res!91544) b!193727))

(assert (= (or b!193732 b!193730) bm!19573))

(assert (= (and b!193719 res!91540) b!193715))

(assert (= (and b!193715 c!34938) b!193723))

(assert (= (and b!193715 (not c!34938)) b!193728))

(assert (= (and b!193723 res!91538) b!193734))

(assert (= (or b!193723 b!193728) bm!19569))

(declare-fun b_lambda!7453 () Bool)

(assert (=> (not b_lambda!7453) (not b!193721)))

(declare-fun t!7342 () Bool)

(declare-fun tb!2877 () Bool)

(assert (=> (and b!193476 (= (defaultEntry!3952 thiss!1248) (defaultEntry!3952 thiss!1248)) t!7342) tb!2877))

(declare-fun result!4925 () Bool)

(assert (=> tb!2877 (= result!4925 tp_is_empty!4483)))

(assert (=> b!193721 t!7342))

(declare-fun b_and!11401 () Bool)

(assert (= b_and!11395 (and (=> t!7342 result!4925) b_and!11401)))

(declare-fun m!219953 () Bool)

(assert (=> b!193727 m!219953))

(declare-fun m!219955 () Bool)

(assert (=> bm!19570 m!219955))

(assert (=> b!193716 m!219921))

(assert (=> b!193716 m!219921))

(assert (=> b!193716 m!219923))

(declare-fun m!219957 () Bool)

(assert (=> b!193734 m!219957))

(declare-fun m!219959 () Bool)

(assert (=> bm!19573 m!219959))

(assert (=> b!193731 m!219921))

(assert (=> b!193731 m!219921))

(declare-fun m!219961 () Bool)

(assert (=> b!193731 m!219961))

(assert (=> b!193733 m!219921))

(assert (=> b!193733 m!219921))

(assert (=> b!193733 m!219923))

(assert (=> b!193721 m!219921))

(declare-fun m!219963 () Bool)

(assert (=> b!193721 m!219963))

(assert (=> b!193721 m!219921))

(declare-fun m!219965 () Bool)

(assert (=> b!193721 m!219965))

(declare-fun m!219967 () Bool)

(assert (=> b!193721 m!219967))

(declare-fun m!219969 () Bool)

(assert (=> b!193721 m!219969))

(assert (=> b!193721 m!219967))

(assert (=> b!193721 m!219965))

(declare-fun m!219971 () Bool)

(assert (=> bm!19569 m!219971))

(declare-fun m!219973 () Bool)

(assert (=> b!193725 m!219973))

(assert (=> d!56483 m!219783))

(declare-fun m!219975 () Bool)

(assert (=> bm!19572 m!219975))

(declare-fun m!219977 () Bool)

(assert (=> b!193722 m!219977))

(assert (=> b!193722 m!219955))

(declare-fun m!219979 () Bool)

(assert (=> b!193722 m!219979))

(declare-fun m!219981 () Bool)

(assert (=> b!193722 m!219981))

(declare-fun m!219983 () Bool)

(assert (=> b!193722 m!219983))

(declare-fun m!219985 () Bool)

(assert (=> b!193722 m!219985))

(assert (=> b!193722 m!219983))

(declare-fun m!219987 () Bool)

(assert (=> b!193722 m!219987))

(declare-fun m!219989 () Bool)

(assert (=> b!193722 m!219989))

(assert (=> b!193722 m!219987))

(declare-fun m!219991 () Bool)

(assert (=> b!193722 m!219991))

(declare-fun m!219993 () Bool)

(assert (=> b!193722 m!219993))

(assert (=> b!193722 m!219921))

(assert (=> b!193722 m!219991))

(declare-fun m!219995 () Bool)

(assert (=> b!193722 m!219995))

(declare-fun m!219997 () Bool)

(assert (=> b!193722 m!219997))

(declare-fun m!219999 () Bool)

(assert (=> b!193722 m!219999))

(declare-fun m!220001 () Bool)

(assert (=> b!193722 m!220001))

(declare-fun m!220003 () Bool)

(assert (=> b!193722 m!220003))

(assert (=> b!193722 m!219977))

(declare-fun m!220005 () Bool)

(assert (=> b!193722 m!220005))

(assert (=> b!193482 d!56483))

(declare-fun d!56485 () Bool)

(declare-fun e!127456 () Bool)

(assert (=> d!56485 e!127456))

(declare-fun res!91547 () Bool)

(assert (=> d!56485 (=> res!91547 e!127456)))

(declare-fun lt!96400 () Bool)

(assert (=> d!56485 (= res!91547 (not lt!96400))))

(declare-fun lt!96397 () Bool)

(assert (=> d!56485 (= lt!96400 lt!96397)))

(declare-fun lt!96399 () Unit!5810)

(declare-fun e!127455 () Unit!5810)

(assert (=> d!56485 (= lt!96399 e!127455)))

(declare-fun c!34944 () Bool)

(assert (=> d!56485 (= c!34944 lt!96397)))

(declare-fun containsKey!246 (List!2424 (_ BitVec 64)) Bool)

(assert (=> d!56485 (= lt!96397 (containsKey!246 (toList!1224 lt!96240) key!828))))

(assert (=> d!56485 (= (contains!1353 lt!96240 key!828) lt!96400)))

(declare-fun b!193743 () Bool)

(declare-fun lt!96398 () Unit!5810)

(assert (=> b!193743 (= e!127455 lt!96398)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!195 (List!2424 (_ BitVec 64)) Unit!5810)

(assert (=> b!193743 (= lt!96398 (lemmaContainsKeyImpliesGetValueByKeyDefined!195 (toList!1224 lt!96240) key!828))))

(declare-fun isDefined!196 (Option!248) Bool)

(assert (=> b!193743 (isDefined!196 (getValueByKey!242 (toList!1224 lt!96240) key!828))))

(declare-fun b!193744 () Bool)

(declare-fun Unit!5817 () Unit!5810)

(assert (=> b!193744 (= e!127455 Unit!5817)))

(declare-fun b!193745 () Bool)

(assert (=> b!193745 (= e!127456 (isDefined!196 (getValueByKey!242 (toList!1224 lt!96240) key!828)))))

(assert (= (and d!56485 c!34944) b!193743))

(assert (= (and d!56485 (not c!34944)) b!193744))

(assert (= (and d!56485 (not res!91547)) b!193745))

(declare-fun m!220007 () Bool)

(assert (=> d!56485 m!220007))

(declare-fun m!220009 () Bool)

(assert (=> b!193743 m!220009))

(declare-fun m!220011 () Bool)

(assert (=> b!193743 m!220011))

(assert (=> b!193743 m!220011))

(declare-fun m!220013 () Bool)

(assert (=> b!193743 m!220013))

(assert (=> b!193745 m!220011))

(assert (=> b!193745 m!220011))

(assert (=> b!193745 m!220013))

(assert (=> b!193482 d!56485))

(declare-fun b!193746 () Bool)

(declare-fun e!127460 () Unit!5810)

(declare-fun Unit!5818 () Unit!5810)

(assert (=> b!193746 (= e!127460 Unit!5818)))

(declare-fun b!193747 () Bool)

(declare-fun e!127467 () Bool)

(declare-fun e!127457 () Bool)

(assert (=> b!193747 (= e!127467 e!127457)))

(declare-fun c!34947 () Bool)

(assert (=> b!193747 (= c!34947 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19576 () Bool)

(declare-fun call!19584 () Bool)

(declare-fun lt!96422 () ListLongMap!2417)

(assert (=> bm!19576 (= call!19584 (contains!1353 lt!96422 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193749 () Bool)

(declare-fun c!34946 () Bool)

(assert (=> b!193749 (= c!34946 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127458 () ListLongMap!2417)

(declare-fun e!127465 () ListLongMap!2417)

(assert (=> b!193749 (= e!127458 e!127465)))

(declare-fun b!193750 () Bool)

(declare-fun res!91549 () Bool)

(assert (=> b!193750 (=> (not res!91549) (not e!127467))))

(declare-fun e!127459 () Bool)

(assert (=> b!193750 (= res!91549 e!127459)))

(declare-fun res!91553 () Bool)

(assert (=> b!193750 (=> res!91553 e!127459)))

(declare-fun e!127463 () Bool)

(assert (=> b!193750 (= res!91553 (not e!127463))))

(declare-fun res!91554 () Bool)

(assert (=> b!193750 (=> (not res!91554) (not e!127463))))

(assert (=> b!193750 (= res!91554 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193751 () Bool)

(declare-fun res!91552 () Bool)

(assert (=> b!193751 (=> (not res!91552) (not e!127467))))

(declare-fun e!127464 () Bool)

(assert (=> b!193751 (= res!91552 e!127464)))

(declare-fun c!34945 () Bool)

(assert (=> b!193751 (= c!34945 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193752 () Bool)

(declare-fun call!19585 () ListLongMap!2417)

(assert (=> b!193752 (= e!127465 call!19585)))

(declare-fun e!127462 () Bool)

(declare-fun b!193753 () Bool)

(assert (=> b!193753 (= e!127462 (= (apply!187 lt!96422 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)) (get!2228 (select (arr!3857 (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!521 (defaultEntry!3952 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4182 (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))))))))

(assert (=> b!193753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193754 () Bool)

(declare-fun lt!96404 () Unit!5810)

(assert (=> b!193754 (= e!127460 lt!96404)))

(declare-fun lt!96409 () ListLongMap!2417)

(assert (=> b!193754 (= lt!96409 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96420 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96413 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96413 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96402 () Unit!5810)

(assert (=> b!193754 (= lt!96402 (addStillContains!163 lt!96409 lt!96420 (zeroValue!3793 thiss!1248) lt!96413))))

(assert (=> b!193754 (contains!1353 (+!316 lt!96409 (tuple2!3509 lt!96420 (zeroValue!3793 thiss!1248))) lt!96413)))

(declare-fun lt!96417 () Unit!5810)

(assert (=> b!193754 (= lt!96417 lt!96402)))

(declare-fun lt!96408 () ListLongMap!2417)

(assert (=> b!193754 (= lt!96408 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96416 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96416 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96411 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96411 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96403 () Unit!5810)

(assert (=> b!193754 (= lt!96403 (addApplyDifferent!163 lt!96408 lt!96416 (minValue!3793 thiss!1248) lt!96411))))

(assert (=> b!193754 (= (apply!187 (+!316 lt!96408 (tuple2!3509 lt!96416 (minValue!3793 thiss!1248))) lt!96411) (apply!187 lt!96408 lt!96411))))

(declare-fun lt!96405 () Unit!5810)

(assert (=> b!193754 (= lt!96405 lt!96403)))

(declare-fun lt!96414 () ListLongMap!2417)

(assert (=> b!193754 (= lt!96414 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96406 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96401 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96401 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96418 () Unit!5810)

(assert (=> b!193754 (= lt!96418 (addApplyDifferent!163 lt!96414 lt!96406 (zeroValue!3793 thiss!1248) lt!96401))))

(assert (=> b!193754 (= (apply!187 (+!316 lt!96414 (tuple2!3509 lt!96406 (zeroValue!3793 thiss!1248))) lt!96401) (apply!187 lt!96414 lt!96401))))

(declare-fun lt!96412 () Unit!5810)

(assert (=> b!193754 (= lt!96412 lt!96418)))

(declare-fun lt!96419 () ListLongMap!2417)

(assert (=> b!193754 (= lt!96419 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96415 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96421 () (_ BitVec 64))

(assert (=> b!193754 (= lt!96421 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193754 (= lt!96404 (addApplyDifferent!163 lt!96419 lt!96415 (minValue!3793 thiss!1248) lt!96421))))

(assert (=> b!193754 (= (apply!187 (+!316 lt!96419 (tuple2!3509 lt!96415 (minValue!3793 thiss!1248))) lt!96421) (apply!187 lt!96419 lt!96421))))

(declare-fun b!193755 () Bool)

(declare-fun e!127468 () Bool)

(assert (=> b!193755 (= e!127457 e!127468)))

(declare-fun res!91550 () Bool)

(assert (=> b!193755 (= res!91550 call!19584)))

(assert (=> b!193755 (=> (not res!91550) (not e!127468))))

(declare-fun bm!19577 () Bool)

(declare-fun call!19583 () ListLongMap!2417)

(assert (=> bm!19577 (= call!19583 (getCurrentListMapNoExtraKeys!208 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193756 () Bool)

(declare-fun call!19580 () ListLongMap!2417)

(assert (=> b!193756 (= e!127465 call!19580)))

(declare-fun b!193757 () Bool)

(declare-fun e!127461 () ListLongMap!2417)

(declare-fun call!19579 () ListLongMap!2417)

(assert (=> b!193757 (= e!127461 (+!316 call!19579 (tuple2!3509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248))))))

(declare-fun b!193758 () Bool)

(assert (=> b!193758 (= e!127458 call!19585)))

(declare-fun b!193759 () Bool)

(declare-fun e!127466 () Bool)

(assert (=> b!193759 (= e!127466 (= (apply!187 lt!96422 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3793 thiss!1248)))))

(declare-fun bm!19578 () Bool)

(declare-fun call!19582 () ListLongMap!2417)

(assert (=> bm!19578 (= call!19580 call!19582)))

(declare-fun d!56487 () Bool)

(assert (=> d!56487 e!127467))

(declare-fun res!91548 () Bool)

(assert (=> d!56487 (=> (not res!91548) (not e!127467))))

(assert (=> d!56487 (= res!91548 (or (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))))

(declare-fun lt!96407 () ListLongMap!2417)

(assert (=> d!56487 (= lt!96422 lt!96407)))

(declare-fun lt!96410 () Unit!5810)

(assert (=> d!56487 (= lt!96410 e!127460)))

(declare-fun c!34948 () Bool)

(declare-fun e!127469 () Bool)

(assert (=> d!56487 (= c!34948 e!127469)))

(declare-fun res!91551 () Bool)

(assert (=> d!56487 (=> (not res!91551) (not e!127469))))

(assert (=> d!56487 (= res!91551 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(assert (=> d!56487 (= lt!96407 e!127461)))

(declare-fun c!34949 () Bool)

(assert (=> d!56487 (= c!34949 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56487 (validMask!0 (mask!9208 thiss!1248))))

(assert (=> d!56487 (= (getCurrentListMap!857 (_keys!5943 thiss!1248) (array!8198 (store (arr!3857 (_values!3935 thiss!1248)) (index!4943 lt!96238) (ValueCellFull!1898 v!309)) (size!4182 (_values!3935 thiss!1248))) (mask!9208 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)) lt!96422)))

(declare-fun b!193748 () Bool)

(assert (=> b!193748 (= e!127463 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193760 () Bool)

(assert (=> b!193760 (= e!127457 (not call!19584))))

(declare-fun b!193761 () Bool)

(assert (=> b!193761 (= e!127461 e!127458)))

(declare-fun c!34950 () Bool)

(assert (=> b!193761 (= c!34950 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19579 () Bool)

(assert (=> bm!19579 (= call!19579 (+!316 (ite c!34949 call!19583 (ite c!34950 call!19582 call!19580)) (ite (or c!34949 c!34950) (tuple2!3509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3793 thiss!1248)) (tuple2!3509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248)))))))

(declare-fun b!193762 () Bool)

(declare-fun call!19581 () Bool)

(assert (=> b!193762 (= e!127464 (not call!19581))))

(declare-fun bm!19580 () Bool)

(assert (=> bm!19580 (= call!19581 (contains!1353 lt!96422 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19581 () Bool)

(assert (=> bm!19581 (= call!19582 call!19583)))

(declare-fun b!193763 () Bool)

(assert (=> b!193763 (= e!127459 e!127462)))

(declare-fun res!91555 () Bool)

(assert (=> b!193763 (=> (not res!91555) (not e!127462))))

(assert (=> b!193763 (= res!91555 (contains!1353 lt!96422 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5943 thiss!1248))))))

(declare-fun b!193764 () Bool)

(assert (=> b!193764 (= e!127464 e!127466)))

(declare-fun res!91556 () Bool)

(assert (=> b!193764 (= res!91556 call!19581)))

(assert (=> b!193764 (=> (not res!91556) (not e!127466))))

(declare-fun bm!19582 () Bool)

(assert (=> bm!19582 (= call!19585 call!19579)))

(declare-fun b!193765 () Bool)

(assert (=> b!193765 (= e!127469 (validKeyInArray!0 (select (arr!3856 (_keys!5943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193766 () Bool)

(assert (=> b!193766 (= e!127468 (= (apply!187 lt!96422 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3793 thiss!1248)))))

(assert (= (and d!56487 c!34949) b!193757))

(assert (= (and d!56487 (not c!34949)) b!193761))

(assert (= (and b!193761 c!34950) b!193758))

(assert (= (and b!193761 (not c!34950)) b!193749))

(assert (= (and b!193749 c!34946) b!193752))

(assert (= (and b!193749 (not c!34946)) b!193756))

(assert (= (or b!193752 b!193756) bm!19578))

(assert (= (or b!193758 bm!19578) bm!19581))

(assert (= (or b!193758 b!193752) bm!19582))

(assert (= (or b!193757 bm!19581) bm!19577))

(assert (= (or b!193757 bm!19582) bm!19579))

(assert (= (and d!56487 res!91551) b!193765))

(assert (= (and d!56487 c!34948) b!193754))

(assert (= (and d!56487 (not c!34948)) b!193746))

(assert (= (and d!56487 res!91548) b!193750))

(assert (= (and b!193750 res!91554) b!193748))

(assert (= (and b!193750 (not res!91553)) b!193763))

(assert (= (and b!193763 res!91555) b!193753))

(assert (= (and b!193750 res!91549) b!193751))

(assert (= (and b!193751 c!34945) b!193764))

(assert (= (and b!193751 (not c!34945)) b!193762))

(assert (= (and b!193764 res!91556) b!193759))

(assert (= (or b!193764 b!193762) bm!19580))

(assert (= (and b!193751 res!91552) b!193747))

(assert (= (and b!193747 c!34947) b!193755))

(assert (= (and b!193747 (not c!34947)) b!193760))

(assert (= (and b!193755 res!91550) b!193766))

(assert (= (or b!193755 b!193760) bm!19576))

(declare-fun b_lambda!7455 () Bool)

(assert (=> (not b_lambda!7455) (not b!193753)))

(assert (=> b!193753 t!7342))

(declare-fun b_and!11403 () Bool)

(assert (= b_and!11401 (and (=> t!7342 result!4925) b_and!11403)))

(declare-fun m!220015 () Bool)

(assert (=> b!193759 m!220015))

(declare-fun m!220017 () Bool)

(assert (=> bm!19577 m!220017))

(assert (=> b!193748 m!219921))

(assert (=> b!193748 m!219921))

(assert (=> b!193748 m!219923))

(declare-fun m!220019 () Bool)

(assert (=> b!193766 m!220019))

(declare-fun m!220021 () Bool)

(assert (=> bm!19580 m!220021))

(assert (=> b!193763 m!219921))

(assert (=> b!193763 m!219921))

(declare-fun m!220023 () Bool)

(assert (=> b!193763 m!220023))

(assert (=> b!193765 m!219921))

(assert (=> b!193765 m!219921))

(assert (=> b!193765 m!219923))

(assert (=> b!193753 m!219921))

(declare-fun m!220025 () Bool)

(assert (=> b!193753 m!220025))

(assert (=> b!193753 m!219921))

(declare-fun m!220027 () Bool)

(assert (=> b!193753 m!220027))

(assert (=> b!193753 m!219967))

(declare-fun m!220029 () Bool)

(assert (=> b!193753 m!220029))

(assert (=> b!193753 m!219967))

(assert (=> b!193753 m!220027))

(declare-fun m!220031 () Bool)

(assert (=> bm!19576 m!220031))

(declare-fun m!220033 () Bool)

(assert (=> b!193757 m!220033))

(assert (=> d!56487 m!219783))

(declare-fun m!220035 () Bool)

(assert (=> bm!19579 m!220035))

(declare-fun m!220037 () Bool)

(assert (=> b!193754 m!220037))

(assert (=> b!193754 m!220017))

(declare-fun m!220039 () Bool)

(assert (=> b!193754 m!220039))

(declare-fun m!220041 () Bool)

(assert (=> b!193754 m!220041))

(declare-fun m!220043 () Bool)

(assert (=> b!193754 m!220043))

(declare-fun m!220045 () Bool)

(assert (=> b!193754 m!220045))

(assert (=> b!193754 m!220043))

(declare-fun m!220047 () Bool)

(assert (=> b!193754 m!220047))

(declare-fun m!220049 () Bool)

(assert (=> b!193754 m!220049))

(assert (=> b!193754 m!220047))

(declare-fun m!220051 () Bool)

(assert (=> b!193754 m!220051))

(declare-fun m!220053 () Bool)

(assert (=> b!193754 m!220053))

(assert (=> b!193754 m!219921))

(assert (=> b!193754 m!220051))

(declare-fun m!220055 () Bool)

(assert (=> b!193754 m!220055))

(declare-fun m!220057 () Bool)

(assert (=> b!193754 m!220057))

(declare-fun m!220059 () Bool)

(assert (=> b!193754 m!220059))

(declare-fun m!220061 () Bool)

(assert (=> b!193754 m!220061))

(declare-fun m!220063 () Bool)

(assert (=> b!193754 m!220063))

(assert (=> b!193754 m!220037))

(declare-fun m!220065 () Bool)

(assert (=> b!193754 m!220065))

(assert (=> b!193482 d!56487))

(declare-fun mapIsEmpty!7763 () Bool)

(declare-fun mapRes!7763 () Bool)

(assert (=> mapIsEmpty!7763 mapRes!7763))

(declare-fun mapNonEmpty!7763 () Bool)

(declare-fun tp!17015 () Bool)

(declare-fun e!127474 () Bool)

(assert (=> mapNonEmpty!7763 (= mapRes!7763 (and tp!17015 e!127474))))

(declare-fun mapRest!7763 () (Array (_ BitVec 32) ValueCell!1898))

(declare-fun mapKey!7763 () (_ BitVec 32))

(declare-fun mapValue!7763 () ValueCell!1898)

(assert (=> mapNonEmpty!7763 (= mapRest!7754 (store mapRest!7763 mapKey!7763 mapValue!7763))))

(declare-fun condMapEmpty!7763 () Bool)

(declare-fun mapDefault!7763 () ValueCell!1898)

(assert (=> mapNonEmpty!7754 (= condMapEmpty!7763 (= mapRest!7754 ((as const (Array (_ BitVec 32) ValueCell!1898)) mapDefault!7763)))))

(declare-fun e!127475 () Bool)

(assert (=> mapNonEmpty!7754 (= tp!17000 (and e!127475 mapRes!7763))))

(declare-fun b!193773 () Bool)

(assert (=> b!193773 (= e!127474 tp_is_empty!4483)))

(declare-fun b!193774 () Bool)

(assert (=> b!193774 (= e!127475 tp_is_empty!4483)))

(assert (= (and mapNonEmpty!7754 condMapEmpty!7763) mapIsEmpty!7763))

(assert (= (and mapNonEmpty!7754 (not condMapEmpty!7763)) mapNonEmpty!7763))

(assert (= (and mapNonEmpty!7763 ((_ is ValueCellFull!1898) mapValue!7763)) b!193773))

(assert (= (and mapNonEmpty!7754 ((_ is ValueCellFull!1898) mapDefault!7763)) b!193774))

(declare-fun m!220067 () Bool)

(assert (=> mapNonEmpty!7763 m!220067))

(declare-fun b_lambda!7457 () Bool)

(assert (= b_lambda!7453 (or (and b!193476 b_free!4711) b_lambda!7457)))

(declare-fun b_lambda!7459 () Bool)

(assert (= b_lambda!7455 (or (and b!193476 b_free!4711) b_lambda!7459)))

(check-sat (not bm!19572) (not d!56487) (not b!193592) (not b!193731) (not bm!19570) (not b!193644) tp_is_empty!4483 (not bm!19580) (not b!193591) (not b!193766) (not bm!19577) (not b!193745) (not d!56485) (not b!193733) (not b!193716) (not b!193665) (not b!193748) (not bm!19579) (not bm!19573) (not b!193658) (not b!193753) (not d!56463) (not bm!19547) (not d!56457) (not mapNonEmpty!7763) (not b!193722) (not b!193593) (not b!193670) (not b!193734) (not b!193611) (not b_lambda!7459) b_and!11403 (not d!56467) (not b!193743) (not b_next!4711) (not b!193757) (not b!193759) (not b_lambda!7457) (not bm!19548) (not b!193727) (not b!193671) (not bm!19569) (not b!193754) (not b!193725) (not b!193659) (not b!193645) (not b!193662) (not b!193765) (not bm!19576) (not b!193763) (not b!193721) (not bm!19551) (not d!56483) (not bm!19554) (not b!193583) (not d!56479) (not d!56461) (not d!56481))
(check-sat b_and!11403 (not b_next!4711))
