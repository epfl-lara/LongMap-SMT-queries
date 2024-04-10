; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80678 () Bool)

(assert start!80678)

(declare-fun b!946493 () Bool)

(declare-fun b_free!18141 () Bool)

(declare-fun b_next!18141 () Bool)

(assert (=> b!946493 (= b_free!18141 (not b_next!18141))))

(declare-fun tp!62965 () Bool)

(declare-fun b_and!29563 () Bool)

(assert (=> b!946493 (= tp!62965 b_and!29563)))

(declare-fun mapNonEmpty!32831 () Bool)

(declare-fun mapRes!32831 () Bool)

(declare-fun tp!62964 () Bool)

(declare-fun e!532566 () Bool)

(assert (=> mapNonEmpty!32831 (= mapRes!32831 (and tp!62964 e!532566))))

(declare-datatypes ((V!32497 0))(
  ( (V!32498 (val!10375 Int)) )
))
(declare-datatypes ((ValueCell!9843 0))(
  ( (ValueCellFull!9843 (v!12909 V!32497)) (EmptyCell!9843) )
))
(declare-fun mapRest!32831 () (Array (_ BitVec 32) ValueCell!9843))

(declare-fun mapKey!32831 () (_ BitVec 32))

(declare-datatypes ((array!57284 0))(
  ( (array!57285 (arr!27558 (Array (_ BitVec 32) ValueCell!9843)) (size!28029 (_ BitVec 32))) )
))
(declare-datatypes ((array!57286 0))(
  ( (array!57287 (arr!27559 (Array (_ BitVec 32) (_ BitVec 64))) (size!28030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4836 0))(
  ( (LongMapFixedSize!4837 (defaultEntry!5715 Int) (mask!27420 (_ BitVec 32)) (extraKeys!5447 (_ BitVec 32)) (zeroValue!5551 V!32497) (minValue!5551 V!32497) (_size!2473 (_ BitVec 32)) (_keys!10611 array!57286) (_values!5738 array!57284) (_vacant!2473 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4836)

(declare-fun mapValue!32831 () ValueCell!9843)

(assert (=> mapNonEmpty!32831 (= (arr!27558 (_values!5738 thiss!1141)) (store mapRest!32831 mapKey!32831 mapValue!32831))))

(declare-fun b!946494 () Bool)

(declare-fun res!635396 () Bool)

(declare-fun e!532563 () Bool)

(assert (=> b!946494 (=> (not res!635396) (not e!532563))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946494 (= res!635396 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946495 () Bool)

(declare-fun e!532565 () Bool)

(assert (=> b!946495 (= e!532563 e!532565)))

(declare-fun res!635397 () Bool)

(assert (=> b!946495 (=> (not res!635397) (not e!532565))))

(declare-datatypes ((SeekEntryResult!9103 0))(
  ( (MissingZero!9103 (index!38783 (_ BitVec 32))) (Found!9103 (index!38784 (_ BitVec 32))) (Intermediate!9103 (undefined!9915 Bool) (index!38785 (_ BitVec 32)) (x!81389 (_ BitVec 32))) (Undefined!9103) (MissingVacant!9103 (index!38786 (_ BitVec 32))) )
))
(declare-fun lt!426309 () SeekEntryResult!9103)

(get-info :version)

(assert (=> b!946495 (= res!635397 ((_ is Found!9103) lt!426309))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57286 (_ BitVec 32)) SeekEntryResult!9103)

(assert (=> b!946495 (= lt!426309 (seekEntry!0 key!756 (_keys!10611 thiss!1141) (mask!27420 thiss!1141)))))

(declare-fun b!946496 () Bool)

(declare-fun tp_is_empty!20649 () Bool)

(assert (=> b!946496 (= e!532566 tp_is_empty!20649)))

(declare-fun b!946497 () Bool)

(declare-fun e!532561 () Bool)

(declare-fun e!532560 () Bool)

(assert (=> b!946497 (= e!532561 (and e!532560 mapRes!32831))))

(declare-fun condMapEmpty!32831 () Bool)

(declare-fun mapDefault!32831 () ValueCell!9843)

(assert (=> b!946497 (= condMapEmpty!32831 (= (arr!27558 (_values!5738 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9843)) mapDefault!32831)))))

(declare-fun b!946498 () Bool)

(declare-fun e!532564 () Bool)

(assert (=> b!946498 (= e!532565 (not e!532564))))

(declare-fun res!635398 () Bool)

(assert (=> b!946498 (=> res!635398 e!532564)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946498 (= res!635398 (not (validMask!0 (mask!27420 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946498 (arrayContainsKey!0 (_keys!10611 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31904 0))(
  ( (Unit!31905) )
))
(declare-fun lt!426308 () Unit!31904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57286 (_ BitVec 64) (_ BitVec 32)) Unit!31904)

(assert (=> b!946498 (= lt!426308 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10611 thiss!1141) key!756 (index!38784 lt!426309)))))

(declare-fun b!946499 () Bool)

(assert (=> b!946499 (= e!532564 (or (not (= (size!28029 (_values!5738 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27420 thiss!1141)))) (not (= (size!28030 (_keys!10611 thiss!1141)) (size!28029 (_values!5738 thiss!1141)))) (bvsge (mask!27420 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun res!635395 () Bool)

(assert (=> start!80678 (=> (not res!635395) (not e!532563))))

(declare-fun valid!1844 (LongMapFixedSize!4836) Bool)

(assert (=> start!80678 (= res!635395 (valid!1844 thiss!1141))))

(assert (=> start!80678 e!532563))

(declare-fun e!532562 () Bool)

(assert (=> start!80678 e!532562))

(assert (=> start!80678 true))

(declare-fun array_inv!21398 (array!57286) Bool)

(declare-fun array_inv!21399 (array!57284) Bool)

(assert (=> b!946493 (= e!532562 (and tp!62965 tp_is_empty!20649 (array_inv!21398 (_keys!10611 thiss!1141)) (array_inv!21399 (_values!5738 thiss!1141)) e!532561))))

(declare-fun mapIsEmpty!32831 () Bool)

(assert (=> mapIsEmpty!32831 mapRes!32831))

(declare-fun b!946500 () Bool)

(assert (=> b!946500 (= e!532560 tp_is_empty!20649)))

(assert (= (and start!80678 res!635395) b!946494))

(assert (= (and b!946494 res!635396) b!946495))

(assert (= (and b!946495 res!635397) b!946498))

(assert (= (and b!946498 (not res!635398)) b!946499))

(assert (= (and b!946497 condMapEmpty!32831) mapIsEmpty!32831))

(assert (= (and b!946497 (not condMapEmpty!32831)) mapNonEmpty!32831))

(assert (= (and mapNonEmpty!32831 ((_ is ValueCellFull!9843) mapValue!32831)) b!946496))

(assert (= (and b!946497 ((_ is ValueCellFull!9843) mapDefault!32831)) b!946500))

(assert (= b!946493 b!946497))

(assert (= start!80678 b!946493))

(declare-fun m!879841 () Bool)

(assert (=> b!946498 m!879841))

(declare-fun m!879843 () Bool)

(assert (=> b!946498 m!879843))

(declare-fun m!879845 () Bool)

(assert (=> b!946498 m!879845))

(declare-fun m!879847 () Bool)

(assert (=> b!946495 m!879847))

(declare-fun m!879849 () Bool)

(assert (=> start!80678 m!879849))

(declare-fun m!879851 () Bool)

(assert (=> b!946493 m!879851))

(declare-fun m!879853 () Bool)

(assert (=> b!946493 m!879853))

(declare-fun m!879855 () Bool)

(assert (=> mapNonEmpty!32831 m!879855))

(check-sat (not mapNonEmpty!32831) b_and!29563 (not b!946495) (not start!80678) (not b!946493) tp_is_empty!20649 (not b!946498) (not b_next!18141))
(check-sat b_and!29563 (not b_next!18141))
(get-model)

(declare-fun d!114547 () Bool)

(declare-fun res!635417 () Bool)

(declare-fun e!532593 () Bool)

(assert (=> d!114547 (=> (not res!635417) (not e!532593))))

(declare-fun simpleValid!358 (LongMapFixedSize!4836) Bool)

(assert (=> d!114547 (= res!635417 (simpleValid!358 thiss!1141))))

(assert (=> d!114547 (= (valid!1844 thiss!1141) e!532593)))

(declare-fun b!946531 () Bool)

(declare-fun res!635418 () Bool)

(assert (=> b!946531 (=> (not res!635418) (not e!532593))))

(declare-fun arrayCountValidKeys!0 (array!57286 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946531 (= res!635418 (= (arrayCountValidKeys!0 (_keys!10611 thiss!1141) #b00000000000000000000000000000000 (size!28030 (_keys!10611 thiss!1141))) (_size!2473 thiss!1141)))))

(declare-fun b!946532 () Bool)

(declare-fun res!635419 () Bool)

(assert (=> b!946532 (=> (not res!635419) (not e!532593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57286 (_ BitVec 32)) Bool)

(assert (=> b!946532 (= res!635419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10611 thiss!1141) (mask!27420 thiss!1141)))))

(declare-fun b!946533 () Bool)

(declare-datatypes ((List!19298 0))(
  ( (Nil!19295) (Cons!19294 (h!20448 (_ BitVec 64)) (t!27619 List!19298)) )
))
(declare-fun arrayNoDuplicates!0 (array!57286 (_ BitVec 32) List!19298) Bool)

(assert (=> b!946533 (= e!532593 (arrayNoDuplicates!0 (_keys!10611 thiss!1141) #b00000000000000000000000000000000 Nil!19295))))

(assert (= (and d!114547 res!635417) b!946531))

(assert (= (and b!946531 res!635418) b!946532))

(assert (= (and b!946532 res!635419) b!946533))

(declare-fun m!879873 () Bool)

(assert (=> d!114547 m!879873))

(declare-fun m!879875 () Bool)

(assert (=> b!946531 m!879875))

(declare-fun m!879877 () Bool)

(assert (=> b!946532 m!879877))

(declare-fun m!879879 () Bool)

(assert (=> b!946533 m!879879))

(assert (=> start!80678 d!114547))

(declare-fun b!946546 () Bool)

(declare-fun e!532601 () SeekEntryResult!9103)

(declare-fun e!532600 () SeekEntryResult!9103)

(assert (=> b!946546 (= e!532601 e!532600)))

(declare-fun lt!426325 () (_ BitVec 64))

(declare-fun lt!426327 () SeekEntryResult!9103)

(assert (=> b!946546 (= lt!426325 (select (arr!27559 (_keys!10611 thiss!1141)) (index!38785 lt!426327)))))

(declare-fun c!98581 () Bool)

(assert (=> b!946546 (= c!98581 (= lt!426325 key!756))))

(declare-fun b!946547 () Bool)

(assert (=> b!946547 (= e!532600 (Found!9103 (index!38785 lt!426327)))))

(declare-fun b!946548 () Bool)

(assert (=> b!946548 (= e!532601 Undefined!9103)))

(declare-fun b!946549 () Bool)

(declare-fun e!532602 () SeekEntryResult!9103)

(assert (=> b!946549 (= e!532602 (MissingZero!9103 (index!38785 lt!426327)))))

(declare-fun b!946550 () Bool)

(declare-fun c!98580 () Bool)

(assert (=> b!946550 (= c!98580 (= lt!426325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946550 (= e!532600 e!532602)))

(declare-fun d!114549 () Bool)

(declare-fun lt!426326 () SeekEntryResult!9103)

(assert (=> d!114549 (and (or ((_ is MissingVacant!9103) lt!426326) (not ((_ is Found!9103) lt!426326)) (and (bvsge (index!38784 lt!426326) #b00000000000000000000000000000000) (bvslt (index!38784 lt!426326) (size!28030 (_keys!10611 thiss!1141))))) (not ((_ is MissingVacant!9103) lt!426326)) (or (not ((_ is Found!9103) lt!426326)) (= (select (arr!27559 (_keys!10611 thiss!1141)) (index!38784 lt!426326)) key!756)))))

(assert (=> d!114549 (= lt!426326 e!532601)))

(declare-fun c!98582 () Bool)

(assert (=> d!114549 (= c!98582 (and ((_ is Intermediate!9103) lt!426327) (undefined!9915 lt!426327)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57286 (_ BitVec 32)) SeekEntryResult!9103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114549 (= lt!426327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27420 thiss!1141)) key!756 (_keys!10611 thiss!1141) (mask!27420 thiss!1141)))))

(assert (=> d!114549 (validMask!0 (mask!27420 thiss!1141))))

(assert (=> d!114549 (= (seekEntry!0 key!756 (_keys!10611 thiss!1141) (mask!27420 thiss!1141)) lt!426326)))

(declare-fun b!946551 () Bool)

(declare-fun lt!426324 () SeekEntryResult!9103)

(assert (=> b!946551 (= e!532602 (ite ((_ is MissingVacant!9103) lt!426324) (MissingZero!9103 (index!38786 lt!426324)) lt!426324))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57286 (_ BitVec 32)) SeekEntryResult!9103)

(assert (=> b!946551 (= lt!426324 (seekKeyOrZeroReturnVacant!0 (x!81389 lt!426327) (index!38785 lt!426327) (index!38785 lt!426327) key!756 (_keys!10611 thiss!1141) (mask!27420 thiss!1141)))))

(assert (= (and d!114549 c!98582) b!946548))

(assert (= (and d!114549 (not c!98582)) b!946546))

(assert (= (and b!946546 c!98581) b!946547))

(assert (= (and b!946546 (not c!98581)) b!946550))

(assert (= (and b!946550 c!98580) b!946549))

(assert (= (and b!946550 (not c!98580)) b!946551))

(declare-fun m!879881 () Bool)

(assert (=> b!946546 m!879881))

(declare-fun m!879883 () Bool)

(assert (=> d!114549 m!879883))

(declare-fun m!879885 () Bool)

(assert (=> d!114549 m!879885))

(assert (=> d!114549 m!879885))

(declare-fun m!879887 () Bool)

(assert (=> d!114549 m!879887))

(assert (=> d!114549 m!879841))

(declare-fun m!879889 () Bool)

(assert (=> b!946551 m!879889))

(assert (=> b!946495 d!114549))

(declare-fun d!114551 () Bool)

(assert (=> d!114551 (= (validMask!0 (mask!27420 thiss!1141)) (and (or (= (mask!27420 thiss!1141) #b00000000000000000000000000000111) (= (mask!27420 thiss!1141) #b00000000000000000000000000001111) (= (mask!27420 thiss!1141) #b00000000000000000000000000011111) (= (mask!27420 thiss!1141) #b00000000000000000000000000111111) (= (mask!27420 thiss!1141) #b00000000000000000000000001111111) (= (mask!27420 thiss!1141) #b00000000000000000000000011111111) (= (mask!27420 thiss!1141) #b00000000000000000000000111111111) (= (mask!27420 thiss!1141) #b00000000000000000000001111111111) (= (mask!27420 thiss!1141) #b00000000000000000000011111111111) (= (mask!27420 thiss!1141) #b00000000000000000000111111111111) (= (mask!27420 thiss!1141) #b00000000000000000001111111111111) (= (mask!27420 thiss!1141) #b00000000000000000011111111111111) (= (mask!27420 thiss!1141) #b00000000000000000111111111111111) (= (mask!27420 thiss!1141) #b00000000000000001111111111111111) (= (mask!27420 thiss!1141) #b00000000000000011111111111111111) (= (mask!27420 thiss!1141) #b00000000000000111111111111111111) (= (mask!27420 thiss!1141) #b00000000000001111111111111111111) (= (mask!27420 thiss!1141) #b00000000000011111111111111111111) (= (mask!27420 thiss!1141) #b00000000000111111111111111111111) (= (mask!27420 thiss!1141) #b00000000001111111111111111111111) (= (mask!27420 thiss!1141) #b00000000011111111111111111111111) (= (mask!27420 thiss!1141) #b00000000111111111111111111111111) (= (mask!27420 thiss!1141) #b00000001111111111111111111111111) (= (mask!27420 thiss!1141) #b00000011111111111111111111111111) (= (mask!27420 thiss!1141) #b00000111111111111111111111111111) (= (mask!27420 thiss!1141) #b00001111111111111111111111111111) (= (mask!27420 thiss!1141) #b00011111111111111111111111111111) (= (mask!27420 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27420 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946498 d!114551))

(declare-fun d!114553 () Bool)

(declare-fun res!635424 () Bool)

(declare-fun e!532607 () Bool)

(assert (=> d!114553 (=> res!635424 e!532607)))

(assert (=> d!114553 (= res!635424 (= (select (arr!27559 (_keys!10611 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114553 (= (arrayContainsKey!0 (_keys!10611 thiss!1141) key!756 #b00000000000000000000000000000000) e!532607)))

(declare-fun b!946556 () Bool)

(declare-fun e!532608 () Bool)

(assert (=> b!946556 (= e!532607 e!532608)))

(declare-fun res!635425 () Bool)

(assert (=> b!946556 (=> (not res!635425) (not e!532608))))

(assert (=> b!946556 (= res!635425 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28030 (_keys!10611 thiss!1141))))))

(declare-fun b!946557 () Bool)

(assert (=> b!946557 (= e!532608 (arrayContainsKey!0 (_keys!10611 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114553 (not res!635424)) b!946556))

(assert (= (and b!946556 res!635425) b!946557))

(declare-fun m!879891 () Bool)

(assert (=> d!114553 m!879891))

(declare-fun m!879893 () Bool)

(assert (=> b!946557 m!879893))

(assert (=> b!946498 d!114553))

(declare-fun d!114555 () Bool)

(assert (=> d!114555 (arrayContainsKey!0 (_keys!10611 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426330 () Unit!31904)

(declare-fun choose!13 (array!57286 (_ BitVec 64) (_ BitVec 32)) Unit!31904)

(assert (=> d!114555 (= lt!426330 (choose!13 (_keys!10611 thiss!1141) key!756 (index!38784 lt!426309)))))

(assert (=> d!114555 (bvsge (index!38784 lt!426309) #b00000000000000000000000000000000)))

(assert (=> d!114555 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10611 thiss!1141) key!756 (index!38784 lt!426309)) lt!426330)))

(declare-fun bs!26606 () Bool)

(assert (= bs!26606 d!114555))

(assert (=> bs!26606 m!879843))

(declare-fun m!879895 () Bool)

(assert (=> bs!26606 m!879895))

(assert (=> b!946498 d!114555))

(declare-fun d!114557 () Bool)

(assert (=> d!114557 (= (array_inv!21398 (_keys!10611 thiss!1141)) (bvsge (size!28030 (_keys!10611 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946493 d!114557))

(declare-fun d!114559 () Bool)

(assert (=> d!114559 (= (array_inv!21399 (_values!5738 thiss!1141)) (bvsge (size!28029 (_values!5738 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946493 d!114559))

(declare-fun mapNonEmpty!32837 () Bool)

(declare-fun mapRes!32837 () Bool)

(declare-fun tp!62974 () Bool)

(declare-fun e!532613 () Bool)

(assert (=> mapNonEmpty!32837 (= mapRes!32837 (and tp!62974 e!532613))))

(declare-fun mapRest!32837 () (Array (_ BitVec 32) ValueCell!9843))

(declare-fun mapValue!32837 () ValueCell!9843)

(declare-fun mapKey!32837 () (_ BitVec 32))

(assert (=> mapNonEmpty!32837 (= mapRest!32831 (store mapRest!32837 mapKey!32837 mapValue!32837))))

(declare-fun b!946564 () Bool)

(assert (=> b!946564 (= e!532613 tp_is_empty!20649)))

(declare-fun b!946565 () Bool)

(declare-fun e!532614 () Bool)

(assert (=> b!946565 (= e!532614 tp_is_empty!20649)))

(declare-fun condMapEmpty!32837 () Bool)

(declare-fun mapDefault!32837 () ValueCell!9843)

(assert (=> mapNonEmpty!32831 (= condMapEmpty!32837 (= mapRest!32831 ((as const (Array (_ BitVec 32) ValueCell!9843)) mapDefault!32837)))))

(assert (=> mapNonEmpty!32831 (= tp!62964 (and e!532614 mapRes!32837))))

(declare-fun mapIsEmpty!32837 () Bool)

(assert (=> mapIsEmpty!32837 mapRes!32837))

(assert (= (and mapNonEmpty!32831 condMapEmpty!32837) mapIsEmpty!32837))

(assert (= (and mapNonEmpty!32831 (not condMapEmpty!32837)) mapNonEmpty!32837))

(assert (= (and mapNonEmpty!32837 ((_ is ValueCellFull!9843) mapValue!32837)) b!946564))

(assert (= (and mapNonEmpty!32831 ((_ is ValueCellFull!9843) mapDefault!32837)) b!946565))

(declare-fun m!879897 () Bool)

(assert (=> mapNonEmpty!32837 m!879897))

(check-sat b_and!29563 (not b!946531) (not d!114547) (not b!946557) (not d!114555) (not mapNonEmpty!32837) (not b!946533) (not b!946551) tp_is_empty!20649 (not b_next!18141) (not d!114549) (not b!946532))
(check-sat b_and!29563 (not b_next!18141))
