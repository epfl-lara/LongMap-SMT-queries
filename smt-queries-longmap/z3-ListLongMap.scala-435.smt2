; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8196 () Bool)

(assert start!8196)

(declare-fun b!51815 () Bool)

(declare-fun b_free!1613 () Bool)

(declare-fun b_next!1613 () Bool)

(assert (=> b!51815 (= b_free!1613 (not b_next!1613))))

(declare-fun tp!6935 () Bool)

(declare-fun b_and!2823 () Bool)

(assert (=> b!51815 (= tp!6935 b_and!2823)))

(declare-fun b!51814 () Bool)

(declare-fun b_free!1615 () Bool)

(declare-fun b_next!1615 () Bool)

(assert (=> b!51814 (= b_free!1615 (not b_next!1615))))

(declare-fun tp!6934 () Bool)

(declare-fun b_and!2825 () Bool)

(assert (=> b!51814 (= tp!6934 b_and!2825)))

(declare-fun mapNonEmpty!2333 () Bool)

(declare-fun mapRes!2334 () Bool)

(declare-fun tp!6936 () Bool)

(declare-fun e!33622 () Bool)

(assert (=> mapNonEmpty!2333 (= mapRes!2334 (and tp!6936 e!33622))))

(declare-datatypes ((V!2611 0))(
  ( (V!2612 (val!1156 Int)) )
))
(declare-datatypes ((array!3367 0))(
  ( (array!3368 (arr!1607 (Array (_ BitVec 32) (_ BitVec 64))) (size!1835 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!768 0))(
  ( (ValueCellFull!768 (v!2201 V!2611)) (EmptyCell!768) )
))
(declare-datatypes ((array!3369 0))(
  ( (array!3370 (arr!1608 (Array (_ BitVec 32) ValueCell!768)) (size!1836 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!444 0))(
  ( (LongMapFixedSize!445 (defaultEntry!1936 Int) (mask!5750 (_ BitVec 32)) (extraKeys!1827 (_ BitVec 32)) (zeroValue!1854 V!2611) (minValue!1854 V!2611) (_size!271 (_ BitVec 32)) (_keys!3554 array!3367) (_values!1919 array!3369) (_vacant!271 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!268 0))(
  ( (Cell!269 (v!2202 LongMapFixedSize!444)) )
))
(declare-datatypes ((LongMap!268 0))(
  ( (LongMap!269 (underlying!145 Cell!268)) )
))
(declare-fun thiss!992 () LongMap!268)

(declare-fun mapValue!2333 () ValueCell!768)

(declare-fun mapKey!2334 () (_ BitVec 32))

(declare-fun mapRest!2333 () (Array (_ BitVec 32) ValueCell!768))

(assert (=> mapNonEmpty!2333 (= (arr!1608 (_values!1919 (v!2202 (underlying!145 thiss!992)))) (store mapRest!2333 mapKey!2334 mapValue!2333))))

(declare-fun b!51803 () Bool)

(declare-fun tp_is_empty!2223 () Bool)

(assert (=> b!51803 (= e!33622 tp_is_empty!2223)))

(declare-fun b!51804 () Bool)

(declare-fun e!33628 () Bool)

(assert (=> b!51804 (= e!33628 tp_is_empty!2223)))

(declare-fun res!29581 () Bool)

(declare-fun e!33620 () Bool)

(assert (=> start!8196 (=> (not res!29581) (not e!33620))))

(declare-fun valid!153 (LongMap!268) Bool)

(assert (=> start!8196 (= res!29581 (valid!153 thiss!992))))

(assert (=> start!8196 e!33620))

(declare-fun e!33626 () Bool)

(assert (=> start!8196 e!33626))

(assert (=> start!8196 true))

(declare-fun e!33618 () Bool)

(assert (=> start!8196 e!33618))

(declare-fun b!51805 () Bool)

(declare-fun e!33627 () Bool)

(declare-fun e!33625 () Bool)

(assert (=> b!51805 (= e!33627 (and e!33625 mapRes!2334))))

(declare-fun condMapEmpty!2333 () Bool)

(declare-fun mapDefault!2334 () ValueCell!768)

(assert (=> b!51805 (= condMapEmpty!2333 (= (arr!1608 (_values!1919 (v!2202 (underlying!145 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!768)) mapDefault!2334)))))

(declare-fun b!51806 () Bool)

(declare-fun res!29580 () Bool)

(assert (=> b!51806 (=> (not res!29580) (not e!33620))))

(declare-fun newMap!16 () LongMapFixedSize!444)

(assert (=> b!51806 (= res!29580 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5750 newMap!16)) (_size!271 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun b!51807 () Bool)

(declare-fun res!29582 () Bool)

(assert (=> b!51807 (=> (not res!29582) (not e!33620))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51807 (= res!29582 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992)))))))))

(declare-fun b!51808 () Bool)

(declare-fun e!33617 () Bool)

(assert (=> b!51808 (= e!33617 tp_is_empty!2223)))

(declare-fun b!51809 () Bool)

(declare-fun res!29583 () Bool)

(assert (=> b!51809 (=> (not res!29583) (not e!33620))))

(declare-fun valid!154 (LongMapFixedSize!444) Bool)

(assert (=> b!51809 (= res!29583 (valid!154 newMap!16))))

(declare-fun b!51810 () Bool)

(declare-fun e!33624 () Bool)

(declare-fun e!33623 () Bool)

(assert (=> b!51810 (= e!33624 e!33623)))

(declare-fun mapNonEmpty!2334 () Bool)

(declare-fun mapRes!2333 () Bool)

(declare-fun tp!6933 () Bool)

(assert (=> mapNonEmpty!2334 (= mapRes!2333 (and tp!6933 e!33628))))

(declare-fun mapKey!2333 () (_ BitVec 32))

(declare-fun mapValue!2334 () ValueCell!768)

(declare-fun mapRest!2334 () (Array (_ BitVec 32) ValueCell!768))

(assert (=> mapNonEmpty!2334 (= (arr!1608 (_values!1919 newMap!16)) (store mapRest!2334 mapKey!2333 mapValue!2334))))

(declare-fun mapIsEmpty!2333 () Bool)

(assert (=> mapIsEmpty!2333 mapRes!2334))

(declare-fun b!51811 () Bool)

(declare-fun res!29578 () Bool)

(assert (=> b!51811 (=> (not res!29578) (not e!33620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3367 (_ BitVec 32)) Bool)

(assert (=> b!51811 (= res!29578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun mapIsEmpty!2334 () Bool)

(assert (=> mapIsEmpty!2334 mapRes!2333))

(declare-fun b!51812 () Bool)

(declare-fun res!29579 () Bool)

(assert (=> b!51812 (=> (not res!29579) (not e!33620))))

(assert (=> b!51812 (= res!29579 (and (= (size!1836 (_values!1919 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5750 (v!2202 (underlying!145 thiss!992))))) (= (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (size!1836 (_values!1919 (v!2202 (underlying!145 thiss!992))))) (bvsge (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1827 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1827 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51813 () Bool)

(declare-fun res!29584 () Bool)

(assert (=> b!51813 (=> (not res!29584) (not e!33620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51813 (= res!29584 (validMask!0 (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun e!33619 () Bool)

(declare-fun array_inv!987 (array!3367) Bool)

(declare-fun array_inv!988 (array!3369) Bool)

(assert (=> b!51814 (= e!33618 (and tp!6934 tp_is_empty!2223 (array_inv!987 (_keys!3554 newMap!16)) (array_inv!988 (_values!1919 newMap!16)) e!33619))))

(assert (=> b!51815 (= e!33623 (and tp!6935 tp_is_empty!2223 (array_inv!987 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (array_inv!988 (_values!1919 (v!2202 (underlying!145 thiss!992)))) e!33627))))

(declare-fun b!51816 () Bool)

(assert (=> b!51816 (= e!33625 tp_is_empty!2223)))

(declare-fun b!51817 () Bool)

(assert (=> b!51817 (= e!33626 e!33624)))

(declare-fun b!51818 () Bool)

(assert (=> b!51818 (= e!33619 (and e!33617 mapRes!2333))))

(declare-fun condMapEmpty!2334 () Bool)

(declare-fun mapDefault!2333 () ValueCell!768)

(assert (=> b!51818 (= condMapEmpty!2334 (= (arr!1608 (_values!1919 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!768)) mapDefault!2333)))))

(declare-fun b!51819 () Bool)

(declare-datatypes ((List!1335 0))(
  ( (Nil!1332) (Cons!1331 (h!1911 (_ BitVec 64)) (t!4369 List!1335)) )
))
(declare-fun arrayNoDuplicates!0 (array!3367 (_ BitVec 32) List!1335) Bool)

(assert (=> b!51819 (= e!33620 (not (arrayNoDuplicates!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000000 Nil!1332)))))

(assert (= (and start!8196 res!29581) b!51807))

(assert (= (and b!51807 res!29582) b!51809))

(assert (= (and b!51809 res!29583) b!51806))

(assert (= (and b!51806 res!29580) b!51813))

(assert (= (and b!51813 res!29584) b!51812))

(assert (= (and b!51812 res!29579) b!51811))

(assert (= (and b!51811 res!29578) b!51819))

(assert (= (and b!51805 condMapEmpty!2333) mapIsEmpty!2333))

(assert (= (and b!51805 (not condMapEmpty!2333)) mapNonEmpty!2333))

(get-info :version)

(assert (= (and mapNonEmpty!2333 ((_ is ValueCellFull!768) mapValue!2333)) b!51803))

(assert (= (and b!51805 ((_ is ValueCellFull!768) mapDefault!2334)) b!51816))

(assert (= b!51815 b!51805))

(assert (= b!51810 b!51815))

(assert (= b!51817 b!51810))

(assert (= start!8196 b!51817))

(assert (= (and b!51818 condMapEmpty!2334) mapIsEmpty!2334))

(assert (= (and b!51818 (not condMapEmpty!2334)) mapNonEmpty!2334))

(assert (= (and mapNonEmpty!2334 ((_ is ValueCellFull!768) mapValue!2334)) b!51804))

(assert (= (and b!51818 ((_ is ValueCellFull!768) mapDefault!2333)) b!51808))

(assert (= b!51814 b!51818))

(assert (= start!8196 b!51814))

(declare-fun m!44507 () Bool)

(assert (=> b!51811 m!44507))

(declare-fun m!44509 () Bool)

(assert (=> mapNonEmpty!2333 m!44509))

(declare-fun m!44511 () Bool)

(assert (=> b!51813 m!44511))

(declare-fun m!44513 () Bool)

(assert (=> b!51815 m!44513))

(declare-fun m!44515 () Bool)

(assert (=> b!51815 m!44515))

(declare-fun m!44517 () Bool)

(assert (=> mapNonEmpty!2334 m!44517))

(declare-fun m!44519 () Bool)

(assert (=> b!51814 m!44519))

(declare-fun m!44521 () Bool)

(assert (=> b!51814 m!44521))

(declare-fun m!44523 () Bool)

(assert (=> b!51819 m!44523))

(declare-fun m!44525 () Bool)

(assert (=> b!51809 m!44525))

(declare-fun m!44527 () Bool)

(assert (=> start!8196 m!44527))

(check-sat (not mapNonEmpty!2333) b_and!2825 (not b_next!1615) b_and!2823 (not start!8196) (not mapNonEmpty!2334) tp_is_empty!2223 (not b!51813) (not b!51815) (not b_next!1613) (not b!51819) (not b!51811) (not b!51814) (not b!51809))
(check-sat b_and!2823 b_and!2825 (not b_next!1613) (not b_next!1615))
(get-model)

(declare-fun d!10397 () Bool)

(assert (=> d!10397 (= (array_inv!987 (_keys!3554 newMap!16)) (bvsge (size!1835 (_keys!3554 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51814 d!10397))

(declare-fun d!10399 () Bool)

(assert (=> d!10399 (= (array_inv!988 (_values!1919 newMap!16)) (bvsge (size!1836 (_values!1919 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51814 d!10399))

(declare-fun d!10401 () Bool)

(assert (=> d!10401 (= (array_inv!987 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvsge (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51815 d!10401))

(declare-fun d!10403 () Bool)

(assert (=> d!10403 (= (array_inv!988 (_values!1919 (v!2202 (underlying!145 thiss!992)))) (bvsge (size!1836 (_values!1919 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51815 d!10403))

(declare-fun b!51879 () Bool)

(declare-fun e!33676 () Bool)

(declare-fun call!3960 () Bool)

(assert (=> b!51879 (= e!33676 call!3960)))

(declare-fun bm!3957 () Bool)

(assert (=> bm!3957 (= call!3960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun d!10405 () Bool)

(declare-fun res!29611 () Bool)

(declare-fun e!33675 () Bool)

(assert (=> d!10405 (=> res!29611 e!33675)))

(assert (=> d!10405 (= res!29611 (bvsge #b00000000000000000000000000000000 (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))))

(assert (=> d!10405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))) e!33675)))

(declare-fun b!51880 () Bool)

(declare-fun e!33677 () Bool)

(assert (=> b!51880 (= e!33677 call!3960)))

(declare-fun b!51881 () Bool)

(assert (=> b!51881 (= e!33675 e!33677)))

(declare-fun c!6930 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51881 (= c!6930 (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51882 () Bool)

(assert (=> b!51882 (= e!33677 e!33676)))

(declare-fun lt!21224 () (_ BitVec 64))

(assert (=> b!51882 (= lt!21224 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1429 0))(
  ( (Unit!1430) )
))
(declare-fun lt!21225 () Unit!1429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3367 (_ BitVec 64) (_ BitVec 32)) Unit!1429)

(assert (=> b!51882 (= lt!21225 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51882 (arrayContainsKey!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 #b00000000000000000000000000000000)))

(declare-fun lt!21223 () Unit!1429)

(assert (=> b!51882 (= lt!21223 lt!21225)))

(declare-fun res!29610 () Bool)

(declare-datatypes ((SeekEntryResult!224 0))(
  ( (MissingZero!224 (index!3018 (_ BitVec 32))) (Found!224 (index!3019 (_ BitVec 32))) (Intermediate!224 (undefined!1036 Bool) (index!3020 (_ BitVec 32)) (x!9424 (_ BitVec 32))) (Undefined!224) (MissingVacant!224 (index!3021 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3367 (_ BitVec 32)) SeekEntryResult!224)

(assert (=> b!51882 (= res!29610 (= (seekEntryOrOpen!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))) (Found!224 #b00000000000000000000000000000000)))))

(assert (=> b!51882 (=> (not res!29610) (not e!33676))))

(assert (= (and d!10405 (not res!29611)) b!51881))

(assert (= (and b!51881 c!6930) b!51882))

(assert (= (and b!51881 (not c!6930)) b!51880))

(assert (= (and b!51882 res!29610) b!51879))

(assert (= (or b!51879 b!51880) bm!3957))

(declare-fun m!44551 () Bool)

(assert (=> bm!3957 m!44551))

(declare-fun m!44553 () Bool)

(assert (=> b!51881 m!44553))

(assert (=> b!51881 m!44553))

(declare-fun m!44555 () Bool)

(assert (=> b!51881 m!44555))

(assert (=> b!51882 m!44553))

(declare-fun m!44557 () Bool)

(assert (=> b!51882 m!44557))

(declare-fun m!44559 () Bool)

(assert (=> b!51882 m!44559))

(assert (=> b!51882 m!44553))

(declare-fun m!44561 () Bool)

(assert (=> b!51882 m!44561))

(assert (=> b!51811 d!10405))

(declare-fun d!10407 () Bool)

(declare-fun res!29618 () Bool)

(declare-fun e!33680 () Bool)

(assert (=> d!10407 (=> (not res!29618) (not e!33680))))

(declare-fun simpleValid!39 (LongMapFixedSize!444) Bool)

(assert (=> d!10407 (= res!29618 (simpleValid!39 newMap!16))))

(assert (=> d!10407 (= (valid!154 newMap!16) e!33680)))

(declare-fun b!51889 () Bool)

(declare-fun res!29619 () Bool)

(assert (=> b!51889 (=> (not res!29619) (not e!33680))))

(declare-fun arrayCountValidKeys!0 (array!3367 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51889 (= res!29619 (= (arrayCountValidKeys!0 (_keys!3554 newMap!16) #b00000000000000000000000000000000 (size!1835 (_keys!3554 newMap!16))) (_size!271 newMap!16)))))

(declare-fun b!51890 () Bool)

(declare-fun res!29620 () Bool)

(assert (=> b!51890 (=> (not res!29620) (not e!33680))))

(assert (=> b!51890 (= res!29620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3554 newMap!16) (mask!5750 newMap!16)))))

(declare-fun b!51891 () Bool)

(assert (=> b!51891 (= e!33680 (arrayNoDuplicates!0 (_keys!3554 newMap!16) #b00000000000000000000000000000000 Nil!1332))))

(assert (= (and d!10407 res!29618) b!51889))

(assert (= (and b!51889 res!29619) b!51890))

(assert (= (and b!51890 res!29620) b!51891))

(declare-fun m!44563 () Bool)

(assert (=> d!10407 m!44563))

(declare-fun m!44565 () Bool)

(assert (=> b!51889 m!44565))

(declare-fun m!44567 () Bool)

(assert (=> b!51890 m!44567))

(declare-fun m!44569 () Bool)

(assert (=> b!51891 m!44569))

(assert (=> b!51809 d!10407))

(declare-fun d!10409 () Bool)

(assert (=> d!10409 (= (valid!153 thiss!992) (valid!154 (v!2202 (underlying!145 thiss!992))))))

(declare-fun bs!2386 () Bool)

(assert (= bs!2386 d!10409))

(declare-fun m!44571 () Bool)

(assert (=> bs!2386 m!44571))

(assert (=> start!8196 d!10409))

(declare-fun d!10411 () Bool)

(assert (=> d!10411 (= (validMask!0 (mask!5750 (v!2202 (underlying!145 thiss!992)))) (and (or (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000001111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000011111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000001111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000011111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000001111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000011111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000001111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000011111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000000111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000001111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000011111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000000111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000001111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000011111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000000111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000001111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000011111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000000111111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000001111111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000011111111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00000111111111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00001111111111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00011111111111111111111111111111) (= (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5750 (v!2202 (underlying!145 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51813 d!10411))

(declare-fun b!51902 () Bool)

(declare-fun e!33692 () Bool)

(declare-fun call!3963 () Bool)

(assert (=> b!51902 (= e!33692 call!3963)))

(declare-fun b!51903 () Bool)

(assert (=> b!51903 (= e!33692 call!3963)))

(declare-fun d!10413 () Bool)

(declare-fun res!29629 () Bool)

(declare-fun e!33691 () Bool)

(assert (=> d!10413 (=> res!29629 e!33691)))

(assert (=> d!10413 (= res!29629 (bvsge #b00000000000000000000000000000000 (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))))

(assert (=> d!10413 (= (arrayNoDuplicates!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000000 Nil!1332) e!33691)))

(declare-fun b!51904 () Bool)

(declare-fun e!33690 () Bool)

(assert (=> b!51904 (= e!33691 e!33690)))

(declare-fun res!29627 () Bool)

(assert (=> b!51904 (=> (not res!29627) (not e!33690))))

(declare-fun e!33689 () Bool)

(assert (=> b!51904 (= res!29627 (not e!33689))))

(declare-fun res!29628 () Bool)

(assert (=> b!51904 (=> (not res!29628) (not e!33689))))

(assert (=> b!51904 (= res!29628 (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51905 () Bool)

(assert (=> b!51905 (= e!33690 e!33692)))

(declare-fun c!6933 () Bool)

(assert (=> b!51905 (= c!6933 (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3960 () Bool)

(assert (=> bm!3960 (= call!3963 (arrayNoDuplicates!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6933 (Cons!1331 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) Nil!1332) Nil!1332)))))

(declare-fun b!51906 () Bool)

(declare-fun contains!624 (List!1335 (_ BitVec 64)) Bool)

(assert (=> b!51906 (= e!33689 (contains!624 Nil!1332 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10413 (not res!29629)) b!51904))

(assert (= (and b!51904 res!29628) b!51906))

(assert (= (and b!51904 res!29627) b!51905))

(assert (= (and b!51905 c!6933) b!51903))

(assert (= (and b!51905 (not c!6933)) b!51902))

(assert (= (or b!51903 b!51902) bm!3960))

(assert (=> b!51904 m!44553))

(assert (=> b!51904 m!44553))

(assert (=> b!51904 m!44555))

(assert (=> b!51905 m!44553))

(assert (=> b!51905 m!44553))

(assert (=> b!51905 m!44555))

(assert (=> bm!3960 m!44553))

(declare-fun m!44573 () Bool)

(assert (=> bm!3960 m!44573))

(assert (=> b!51906 m!44553))

(assert (=> b!51906 m!44553))

(declare-fun m!44575 () Bool)

(assert (=> b!51906 m!44575))

(assert (=> b!51819 d!10413))

(declare-fun b!51914 () Bool)

(declare-fun e!33697 () Bool)

(assert (=> b!51914 (= e!33697 tp_is_empty!2223)))

(declare-fun mapNonEmpty!2343 () Bool)

(declare-fun mapRes!2343 () Bool)

(declare-fun tp!6951 () Bool)

(declare-fun e!33698 () Bool)

(assert (=> mapNonEmpty!2343 (= mapRes!2343 (and tp!6951 e!33698))))

(declare-fun mapKey!2343 () (_ BitVec 32))

(declare-fun mapValue!2343 () ValueCell!768)

(declare-fun mapRest!2343 () (Array (_ BitVec 32) ValueCell!768))

(assert (=> mapNonEmpty!2343 (= mapRest!2333 (store mapRest!2343 mapKey!2343 mapValue!2343))))

(declare-fun b!51913 () Bool)

(assert (=> b!51913 (= e!33698 tp_is_empty!2223)))

(declare-fun mapIsEmpty!2343 () Bool)

(assert (=> mapIsEmpty!2343 mapRes!2343))

(declare-fun condMapEmpty!2343 () Bool)

(declare-fun mapDefault!2343 () ValueCell!768)

(assert (=> mapNonEmpty!2333 (= condMapEmpty!2343 (= mapRest!2333 ((as const (Array (_ BitVec 32) ValueCell!768)) mapDefault!2343)))))

(assert (=> mapNonEmpty!2333 (= tp!6936 (and e!33697 mapRes!2343))))

(assert (= (and mapNonEmpty!2333 condMapEmpty!2343) mapIsEmpty!2343))

(assert (= (and mapNonEmpty!2333 (not condMapEmpty!2343)) mapNonEmpty!2343))

(assert (= (and mapNonEmpty!2343 ((_ is ValueCellFull!768) mapValue!2343)) b!51913))

(assert (= (and mapNonEmpty!2333 ((_ is ValueCellFull!768) mapDefault!2343)) b!51914))

(declare-fun m!44577 () Bool)

(assert (=> mapNonEmpty!2343 m!44577))

(declare-fun b!51916 () Bool)

(declare-fun e!33699 () Bool)

(assert (=> b!51916 (= e!33699 tp_is_empty!2223)))

(declare-fun mapNonEmpty!2344 () Bool)

(declare-fun mapRes!2344 () Bool)

(declare-fun tp!6952 () Bool)

(declare-fun e!33700 () Bool)

(assert (=> mapNonEmpty!2344 (= mapRes!2344 (and tp!6952 e!33700))))

(declare-fun mapKey!2344 () (_ BitVec 32))

(declare-fun mapValue!2344 () ValueCell!768)

(declare-fun mapRest!2344 () (Array (_ BitVec 32) ValueCell!768))

(assert (=> mapNonEmpty!2344 (= mapRest!2334 (store mapRest!2344 mapKey!2344 mapValue!2344))))

(declare-fun b!51915 () Bool)

(assert (=> b!51915 (= e!33700 tp_is_empty!2223)))

(declare-fun mapIsEmpty!2344 () Bool)

(assert (=> mapIsEmpty!2344 mapRes!2344))

(declare-fun condMapEmpty!2344 () Bool)

(declare-fun mapDefault!2344 () ValueCell!768)

(assert (=> mapNonEmpty!2334 (= condMapEmpty!2344 (= mapRest!2334 ((as const (Array (_ BitVec 32) ValueCell!768)) mapDefault!2344)))))

(assert (=> mapNonEmpty!2334 (= tp!6933 (and e!33699 mapRes!2344))))

(assert (= (and mapNonEmpty!2334 condMapEmpty!2344) mapIsEmpty!2344))

(assert (= (and mapNonEmpty!2334 (not condMapEmpty!2344)) mapNonEmpty!2344))

(assert (= (and mapNonEmpty!2344 ((_ is ValueCellFull!768) mapValue!2344)) b!51915))

(assert (= (and mapNonEmpty!2334 ((_ is ValueCellFull!768) mapDefault!2344)) b!51916))

(declare-fun m!44579 () Bool)

(assert (=> mapNonEmpty!2344 m!44579))

(check-sat (not b!51905) (not bm!3960) (not b!51906) (not d!10409) b_and!2823 (not b!51881) (not mapNonEmpty!2344) (not b_next!1613) (not d!10407) (not mapNonEmpty!2343) (not bm!3957) b_and!2825 (not b!51889) (not b!51890) (not b_next!1615) tp_is_empty!2223 (not b!51891) (not b!51882) (not b!51904))
(check-sat b_and!2823 b_and!2825 (not b_next!1613) (not b_next!1615))
(get-model)

(declare-fun b!51917 () Bool)

(declare-fun e!33702 () Bool)

(declare-fun call!3964 () Bool)

(assert (=> b!51917 (= e!33702 call!3964)))

(declare-fun bm!3961 () Bool)

(assert (=> bm!3961 (= call!3964 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun d!10415 () Bool)

(declare-fun res!29631 () Bool)

(declare-fun e!33701 () Bool)

(assert (=> d!10415 (=> res!29631 e!33701)))

(assert (=> d!10415 (= res!29631 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))))

(assert (=> d!10415 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))) e!33701)))

(declare-fun b!51918 () Bool)

(declare-fun e!33703 () Bool)

(assert (=> b!51918 (= e!33703 call!3964)))

(declare-fun b!51919 () Bool)

(assert (=> b!51919 (= e!33701 e!33703)))

(declare-fun c!6934 () Bool)

(assert (=> b!51919 (= c!6934 (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51920 () Bool)

(assert (=> b!51920 (= e!33703 e!33702)))

(declare-fun lt!21227 () (_ BitVec 64))

(assert (=> b!51920 (= lt!21227 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21228 () Unit!1429)

(assert (=> b!51920 (= lt!21228 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51920 (arrayContainsKey!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21227 #b00000000000000000000000000000000)))

(declare-fun lt!21226 () Unit!1429)

(assert (=> b!51920 (= lt!21226 lt!21228)))

(declare-fun res!29630 () Bool)

(assert (=> b!51920 (= res!29630 (= (seekEntryOrOpen!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))) (Found!224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51920 (=> (not res!29630) (not e!33702))))

(assert (= (and d!10415 (not res!29631)) b!51919))

(assert (= (and b!51919 c!6934) b!51920))

(assert (= (and b!51919 (not c!6934)) b!51918))

(assert (= (and b!51920 res!29630) b!51917))

(assert (= (or b!51917 b!51918) bm!3961))

(declare-fun m!44581 () Bool)

(assert (=> bm!3961 m!44581))

(declare-fun m!44583 () Bool)

(assert (=> b!51919 m!44583))

(assert (=> b!51919 m!44583))

(declare-fun m!44585 () Bool)

(assert (=> b!51919 m!44585))

(assert (=> b!51920 m!44583))

(declare-fun m!44587 () Bool)

(assert (=> b!51920 m!44587))

(declare-fun m!44589 () Bool)

(assert (=> b!51920 m!44589))

(assert (=> b!51920 m!44583))

(declare-fun m!44591 () Bool)

(assert (=> b!51920 m!44591))

(assert (=> bm!3957 d!10415))

(declare-fun d!10417 () Bool)

(declare-fun lt!21231 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!60 (List!1335) (InoxSet (_ BitVec 64)))

(assert (=> d!10417 (= lt!21231 (select (content!60 Nil!1332) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!33709 () Bool)

(assert (=> d!10417 (= lt!21231 e!33709)))

(declare-fun res!29637 () Bool)

(assert (=> d!10417 (=> (not res!29637) (not e!33709))))

(assert (=> d!10417 (= res!29637 ((_ is Cons!1331) Nil!1332))))

(assert (=> d!10417 (= (contains!624 Nil!1332 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)) lt!21231)))

(declare-fun b!51925 () Bool)

(declare-fun e!33708 () Bool)

(assert (=> b!51925 (= e!33709 e!33708)))

(declare-fun res!29636 () Bool)

(assert (=> b!51925 (=> res!29636 e!33708)))

(assert (=> b!51925 (= res!29636 (= (h!1911 Nil!1332) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51926 () Bool)

(assert (=> b!51926 (= e!33708 (contains!624 (t!4369 Nil!1332) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10417 res!29637) b!51925))

(assert (= (and b!51925 (not res!29636)) b!51926))

(declare-fun m!44593 () Bool)

(assert (=> d!10417 m!44593))

(assert (=> d!10417 m!44553))

(declare-fun m!44595 () Bool)

(assert (=> d!10417 m!44595))

(assert (=> b!51926 m!44553))

(declare-fun m!44597 () Bool)

(assert (=> b!51926 m!44597))

(assert (=> b!51906 d!10417))

(declare-fun b!51935 () Bool)

(declare-fun e!33715 () (_ BitVec 32))

(declare-fun call!3967 () (_ BitVec 32))

(assert (=> b!51935 (= e!33715 call!3967)))

(declare-fun bm!3964 () Bool)

(assert (=> bm!3964 (= call!3967 (arrayCountValidKeys!0 (_keys!3554 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1835 (_keys!3554 newMap!16))))))

(declare-fun b!51936 () Bool)

(declare-fun e!33714 () (_ BitVec 32))

(assert (=> b!51936 (= e!33714 #b00000000000000000000000000000000)))

(declare-fun b!51937 () Bool)

(assert (=> b!51937 (= e!33714 e!33715)))

(declare-fun c!6939 () Bool)

(assert (=> b!51937 (= c!6939 (validKeyInArray!0 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51938 () Bool)

(assert (=> b!51938 (= e!33715 (bvadd #b00000000000000000000000000000001 call!3967))))

(declare-fun d!10419 () Bool)

(declare-fun lt!21234 () (_ BitVec 32))

(assert (=> d!10419 (and (bvsge lt!21234 #b00000000000000000000000000000000) (bvsle lt!21234 (bvsub (size!1835 (_keys!3554 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10419 (= lt!21234 e!33714)))

(declare-fun c!6940 () Bool)

(assert (=> d!10419 (= c!6940 (bvsge #b00000000000000000000000000000000 (size!1835 (_keys!3554 newMap!16))))))

(assert (=> d!10419 (and (bvsle #b00000000000000000000000000000000 (size!1835 (_keys!3554 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1835 (_keys!3554 newMap!16)) (size!1835 (_keys!3554 newMap!16))))))

(assert (=> d!10419 (= (arrayCountValidKeys!0 (_keys!3554 newMap!16) #b00000000000000000000000000000000 (size!1835 (_keys!3554 newMap!16))) lt!21234)))

(assert (= (and d!10419 c!6940) b!51936))

(assert (= (and d!10419 (not c!6940)) b!51937))

(assert (= (and b!51937 c!6939) b!51938))

(assert (= (and b!51937 (not c!6939)) b!51935))

(assert (= (or b!51938 b!51935) bm!3964))

(declare-fun m!44599 () Bool)

(assert (=> bm!3964 m!44599))

(declare-fun m!44601 () Bool)

(assert (=> b!51937 m!44601))

(assert (=> b!51937 m!44601))

(declare-fun m!44603 () Bool)

(assert (=> b!51937 m!44603))

(assert (=> b!51889 d!10419))

(declare-fun b!51939 () Bool)

(declare-fun e!33717 () Bool)

(declare-fun call!3968 () Bool)

(assert (=> b!51939 (= e!33717 call!3968)))

(declare-fun bm!3965 () Bool)

(assert (=> bm!3965 (= call!3968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3554 newMap!16) (mask!5750 newMap!16)))))

(declare-fun d!10421 () Bool)

(declare-fun res!29639 () Bool)

(declare-fun e!33716 () Bool)

(assert (=> d!10421 (=> res!29639 e!33716)))

(assert (=> d!10421 (= res!29639 (bvsge #b00000000000000000000000000000000 (size!1835 (_keys!3554 newMap!16))))))

(assert (=> d!10421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3554 newMap!16) (mask!5750 newMap!16)) e!33716)))

(declare-fun b!51940 () Bool)

(declare-fun e!33718 () Bool)

(assert (=> b!51940 (= e!33718 call!3968)))

(declare-fun b!51941 () Bool)

(assert (=> b!51941 (= e!33716 e!33718)))

(declare-fun c!6941 () Bool)

(assert (=> b!51941 (= c!6941 (validKeyInArray!0 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51942 () Bool)

(assert (=> b!51942 (= e!33718 e!33717)))

(declare-fun lt!21236 () (_ BitVec 64))

(assert (=> b!51942 (= lt!21236 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!21237 () Unit!1429)

(assert (=> b!51942 (= lt!21237 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3554 newMap!16) lt!21236 #b00000000000000000000000000000000))))

(assert (=> b!51942 (arrayContainsKey!0 (_keys!3554 newMap!16) lt!21236 #b00000000000000000000000000000000)))

(declare-fun lt!21235 () Unit!1429)

(assert (=> b!51942 (= lt!21235 lt!21237)))

(declare-fun res!29638 () Bool)

(assert (=> b!51942 (= res!29638 (= (seekEntryOrOpen!0 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000) (_keys!3554 newMap!16) (mask!5750 newMap!16)) (Found!224 #b00000000000000000000000000000000)))))

(assert (=> b!51942 (=> (not res!29638) (not e!33717))))

(assert (= (and d!10421 (not res!29639)) b!51941))

(assert (= (and b!51941 c!6941) b!51942))

(assert (= (and b!51941 (not c!6941)) b!51940))

(assert (= (and b!51942 res!29638) b!51939))

(assert (= (or b!51939 b!51940) bm!3965))

(declare-fun m!44605 () Bool)

(assert (=> bm!3965 m!44605))

(assert (=> b!51941 m!44601))

(assert (=> b!51941 m!44601))

(assert (=> b!51941 m!44603))

(assert (=> b!51942 m!44601))

(declare-fun m!44607 () Bool)

(assert (=> b!51942 m!44607))

(declare-fun m!44609 () Bool)

(assert (=> b!51942 m!44609))

(assert (=> b!51942 m!44601))

(declare-fun m!44611 () Bool)

(assert (=> b!51942 m!44611))

(assert (=> b!51890 d!10421))

(declare-fun d!10423 () Bool)

(declare-fun res!29640 () Bool)

(declare-fun e!33719 () Bool)

(assert (=> d!10423 (=> (not res!29640) (not e!33719))))

(assert (=> d!10423 (= res!29640 (simpleValid!39 (v!2202 (underlying!145 thiss!992))))))

(assert (=> d!10423 (= (valid!154 (v!2202 (underlying!145 thiss!992))) e!33719)))

(declare-fun b!51943 () Bool)

(declare-fun res!29641 () Bool)

(assert (=> b!51943 (=> (not res!29641) (not e!33719))))

(assert (=> b!51943 (= res!29641 (= (arrayCountValidKeys!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000000 (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))) (_size!271 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun b!51944 () Bool)

(declare-fun res!29642 () Bool)

(assert (=> b!51944 (=> (not res!29642) (not e!33719))))

(assert (=> b!51944 (= res!29642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun b!51945 () Bool)

(assert (=> b!51945 (= e!33719 (arrayNoDuplicates!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) #b00000000000000000000000000000000 Nil!1332))))

(assert (= (and d!10423 res!29640) b!51943))

(assert (= (and b!51943 res!29641) b!51944))

(assert (= (and b!51944 res!29642) b!51945))

(declare-fun m!44613 () Bool)

(assert (=> d!10423 m!44613))

(declare-fun m!44615 () Bool)

(assert (=> b!51943 m!44615))

(assert (=> b!51944 m!44507))

(assert (=> b!51945 m!44523))

(assert (=> d!10409 d!10423))

(declare-fun b!51946 () Bool)

(declare-fun e!33723 () Bool)

(declare-fun call!3969 () Bool)

(assert (=> b!51946 (= e!33723 call!3969)))

(declare-fun b!51947 () Bool)

(assert (=> b!51947 (= e!33723 call!3969)))

(declare-fun d!10425 () Bool)

(declare-fun res!29645 () Bool)

(declare-fun e!33722 () Bool)

(assert (=> d!10425 (=> res!29645 e!33722)))

(assert (=> d!10425 (= res!29645 (bvsge #b00000000000000000000000000000000 (size!1835 (_keys!3554 newMap!16))))))

(assert (=> d!10425 (= (arrayNoDuplicates!0 (_keys!3554 newMap!16) #b00000000000000000000000000000000 Nil!1332) e!33722)))

(declare-fun b!51948 () Bool)

(declare-fun e!33721 () Bool)

(assert (=> b!51948 (= e!33722 e!33721)))

(declare-fun res!29643 () Bool)

(assert (=> b!51948 (=> (not res!29643) (not e!33721))))

(declare-fun e!33720 () Bool)

(assert (=> b!51948 (= res!29643 (not e!33720))))

(declare-fun res!29644 () Bool)

(assert (=> b!51948 (=> (not res!29644) (not e!33720))))

(assert (=> b!51948 (= res!29644 (validKeyInArray!0 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51949 () Bool)

(assert (=> b!51949 (= e!33721 e!33723)))

(declare-fun c!6942 () Bool)

(assert (=> b!51949 (= c!6942 (validKeyInArray!0 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3966 () Bool)

(assert (=> bm!3966 (= call!3969 (arrayNoDuplicates!0 (_keys!3554 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6942 (Cons!1331 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000) Nil!1332) Nil!1332)))))

(declare-fun b!51950 () Bool)

(assert (=> b!51950 (= e!33720 (contains!624 Nil!1332 (select (arr!1607 (_keys!3554 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10425 (not res!29645)) b!51948))

(assert (= (and b!51948 res!29644) b!51950))

(assert (= (and b!51948 res!29643) b!51949))

(assert (= (and b!51949 c!6942) b!51947))

(assert (= (and b!51949 (not c!6942)) b!51946))

(assert (= (or b!51947 b!51946) bm!3966))

(assert (=> b!51948 m!44601))

(assert (=> b!51948 m!44601))

(assert (=> b!51948 m!44603))

(assert (=> b!51949 m!44601))

(assert (=> b!51949 m!44601))

(assert (=> b!51949 m!44603))

(assert (=> bm!3966 m!44601))

(declare-fun m!44617 () Bool)

(assert (=> bm!3966 m!44617))

(assert (=> b!51950 m!44601))

(assert (=> b!51950 m!44601))

(declare-fun m!44619 () Bool)

(assert (=> b!51950 m!44619))

(assert (=> b!51891 d!10425))

(declare-fun d!10427 () Bool)

(assert (=> d!10427 (= (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51904 d!10427))

(assert (=> b!51905 d!10427))

(declare-fun b!51951 () Bool)

(declare-fun e!33727 () Bool)

(declare-fun call!3970 () Bool)

(assert (=> b!51951 (= e!33727 call!3970)))

(declare-fun b!51952 () Bool)

(assert (=> b!51952 (= e!33727 call!3970)))

(declare-fun d!10429 () Bool)

(declare-fun res!29648 () Bool)

(declare-fun e!33726 () Bool)

(assert (=> d!10429 (=> res!29648 e!33726)))

(assert (=> d!10429 (= res!29648 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))))

(assert (=> d!10429 (= (arrayNoDuplicates!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6933 (Cons!1331 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) Nil!1332) Nil!1332)) e!33726)))

(declare-fun b!51953 () Bool)

(declare-fun e!33725 () Bool)

(assert (=> b!51953 (= e!33726 e!33725)))

(declare-fun res!29646 () Bool)

(assert (=> b!51953 (=> (not res!29646) (not e!33725))))

(declare-fun e!33724 () Bool)

(assert (=> b!51953 (= res!29646 (not e!33724))))

(declare-fun res!29647 () Bool)

(assert (=> b!51953 (=> (not res!29647) (not e!33724))))

(assert (=> b!51953 (= res!29647 (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51954 () Bool)

(assert (=> b!51954 (= e!33725 e!33727)))

(declare-fun c!6943 () Bool)

(assert (=> b!51954 (= c!6943 (validKeyInArray!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3967 () Bool)

(assert (=> bm!3967 (= call!3970 (arrayNoDuplicates!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6943 (Cons!1331 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6933 (Cons!1331 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) Nil!1332) Nil!1332)) (ite c!6933 (Cons!1331 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) Nil!1332) Nil!1332))))))

(declare-fun b!51955 () Bool)

(assert (=> b!51955 (= e!33724 (contains!624 (ite c!6933 (Cons!1331 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) Nil!1332) Nil!1332) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10429 (not res!29648)) b!51953))

(assert (= (and b!51953 res!29647) b!51955))

(assert (= (and b!51953 res!29646) b!51954))

(assert (= (and b!51954 c!6943) b!51952))

(assert (= (and b!51954 (not c!6943)) b!51951))

(assert (= (or b!51952 b!51951) bm!3967))

(assert (=> b!51953 m!44583))

(assert (=> b!51953 m!44583))

(assert (=> b!51953 m!44585))

(assert (=> b!51954 m!44583))

(assert (=> b!51954 m!44583))

(assert (=> b!51954 m!44585))

(assert (=> bm!3967 m!44583))

(declare-fun m!44621 () Bool)

(assert (=> bm!3967 m!44621))

(assert (=> b!51955 m!44583))

(assert (=> b!51955 m!44583))

(declare-fun m!44623 () Bool)

(assert (=> b!51955 m!44623))

(assert (=> bm!3960 d!10429))

(declare-fun b!51965 () Bool)

(declare-fun res!29660 () Bool)

(declare-fun e!33730 () Bool)

(assert (=> b!51965 (=> (not res!29660) (not e!33730))))

(declare-fun size!1839 (LongMapFixedSize!444) (_ BitVec 32))

(assert (=> b!51965 (= res!29660 (bvsge (size!1839 newMap!16) (_size!271 newMap!16)))))

(declare-fun b!51967 () Bool)

(assert (=> b!51967 (= e!33730 (and (bvsge (extraKeys!1827 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1827 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!271 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51966 () Bool)

(declare-fun res!29657 () Bool)

(assert (=> b!51966 (=> (not res!29657) (not e!33730))))

(assert (=> b!51966 (= res!29657 (= (size!1839 newMap!16) (bvadd (_size!271 newMap!16) (bvsdiv (bvadd (extraKeys!1827 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10431 () Bool)

(declare-fun res!29658 () Bool)

(assert (=> d!10431 (=> (not res!29658) (not e!33730))))

(assert (=> d!10431 (= res!29658 (validMask!0 (mask!5750 newMap!16)))))

(assert (=> d!10431 (= (simpleValid!39 newMap!16) e!33730)))

(declare-fun b!51964 () Bool)

(declare-fun res!29659 () Bool)

(assert (=> b!51964 (=> (not res!29659) (not e!33730))))

(assert (=> b!51964 (= res!29659 (and (= (size!1836 (_values!1919 newMap!16)) (bvadd (mask!5750 newMap!16) #b00000000000000000000000000000001)) (= (size!1835 (_keys!3554 newMap!16)) (size!1836 (_values!1919 newMap!16))) (bvsge (_size!271 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!271 newMap!16) (bvadd (mask!5750 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!10431 res!29658) b!51964))

(assert (= (and b!51964 res!29659) b!51965))

(assert (= (and b!51965 res!29660) b!51966))

(assert (= (and b!51966 res!29657) b!51967))

(declare-fun m!44625 () Bool)

(assert (=> b!51965 m!44625))

(assert (=> b!51966 m!44625))

(declare-fun m!44627 () Bool)

(assert (=> d!10431 m!44627))

(assert (=> d!10407 d!10431))

(assert (=> b!51881 d!10427))

(declare-fun d!10433 () Bool)

(assert (=> d!10433 (arrayContainsKey!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 #b00000000000000000000000000000000)))

(declare-fun lt!21240 () Unit!1429)

(declare-fun choose!13 (array!3367 (_ BitVec 64) (_ BitVec 32)) Unit!1429)

(assert (=> d!10433 (= lt!21240 (choose!13 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 #b00000000000000000000000000000000))))

(assert (=> d!10433 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10433 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 #b00000000000000000000000000000000) lt!21240)))

(declare-fun bs!2387 () Bool)

(assert (= bs!2387 d!10433))

(assert (=> bs!2387 m!44559))

(declare-fun m!44629 () Bool)

(assert (=> bs!2387 m!44629))

(assert (=> b!51882 d!10433))

(declare-fun d!10435 () Bool)

(declare-fun res!29665 () Bool)

(declare-fun e!33735 () Bool)

(assert (=> d!10435 (=> res!29665 e!33735)))

(assert (=> d!10435 (= res!29665 (= (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) lt!21224))))

(assert (=> d!10435 (= (arrayContainsKey!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 #b00000000000000000000000000000000) e!33735)))

(declare-fun b!51972 () Bool)

(declare-fun e!33736 () Bool)

(assert (=> b!51972 (= e!33735 e!33736)))

(declare-fun res!29666 () Bool)

(assert (=> b!51972 (=> (not res!29666) (not e!33736))))

(assert (=> b!51972 (= res!29666 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))))

(declare-fun b!51973 () Bool)

(assert (=> b!51973 (= e!33736 (arrayContainsKey!0 (_keys!3554 (v!2202 (underlying!145 thiss!992))) lt!21224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10435 (not res!29665)) b!51972))

(assert (= (and b!51972 res!29666) b!51973))

(assert (=> d!10435 m!44553))

(declare-fun m!44631 () Bool)

(assert (=> b!51973 m!44631))

(assert (=> b!51882 d!10435))

(declare-fun b!51986 () Bool)

(declare-fun e!33745 () SeekEntryResult!224)

(assert (=> b!51986 (= e!33745 Undefined!224)))

(declare-fun b!51987 () Bool)

(declare-fun c!6951 () Bool)

(declare-fun lt!21247 () (_ BitVec 64))

(assert (=> b!51987 (= c!6951 (= lt!21247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33743 () SeekEntryResult!224)

(declare-fun e!33744 () SeekEntryResult!224)

(assert (=> b!51987 (= e!33743 e!33744)))

(declare-fun b!51988 () Bool)

(assert (=> b!51988 (= e!33745 e!33743)))

(declare-fun lt!21248 () SeekEntryResult!224)

(assert (=> b!51988 (= lt!21247 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (index!3020 lt!21248)))))

(declare-fun c!6950 () Bool)

(assert (=> b!51988 (= c!6950 (= lt!21247 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51989 () Bool)

(assert (=> b!51989 (= e!33743 (Found!224 (index!3020 lt!21248)))))

(declare-fun b!51990 () Bool)

(assert (=> b!51990 (= e!33744 (MissingZero!224 (index!3020 lt!21248)))))

(declare-fun b!51991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3367 (_ BitVec 32)) SeekEntryResult!224)

(assert (=> b!51991 (= e!33744 (seekKeyOrZeroReturnVacant!0 (x!9424 lt!21248) (index!3020 lt!21248) (index!3020 lt!21248) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(declare-fun d!10437 () Bool)

(declare-fun lt!21249 () SeekEntryResult!224)

(assert (=> d!10437 (and (or ((_ is Undefined!224) lt!21249) (not ((_ is Found!224) lt!21249)) (and (bvsge (index!3019 lt!21249) #b00000000000000000000000000000000) (bvslt (index!3019 lt!21249) (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))) (or ((_ is Undefined!224) lt!21249) ((_ is Found!224) lt!21249) (not ((_ is MissingZero!224) lt!21249)) (and (bvsge (index!3018 lt!21249) #b00000000000000000000000000000000) (bvslt (index!3018 lt!21249) (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))) (or ((_ is Undefined!224) lt!21249) ((_ is Found!224) lt!21249) ((_ is MissingZero!224) lt!21249) (not ((_ is MissingVacant!224) lt!21249)) (and (bvsge (index!3021 lt!21249) #b00000000000000000000000000000000) (bvslt (index!3021 lt!21249) (size!1835 (_keys!3554 (v!2202 (underlying!145 thiss!992))))))) (or ((_ is Undefined!224) lt!21249) (ite ((_ is Found!224) lt!21249) (= (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (index!3019 lt!21249)) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!224) lt!21249) (= (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (index!3018 lt!21249)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!224) lt!21249) (= (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) (index!3021 lt!21249)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10437 (= lt!21249 e!33745)))

(declare-fun c!6952 () Bool)

(assert (=> d!10437 (= c!6952 (and ((_ is Intermediate!224) lt!21248) (undefined!1036 lt!21248)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3367 (_ BitVec 32)) SeekEntryResult!224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10437 (= lt!21248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) (mask!5750 (v!2202 (underlying!145 thiss!992)))) (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))))))

(assert (=> d!10437 (validMask!0 (mask!5750 (v!2202 (underlying!145 thiss!992))))))

(assert (=> d!10437 (= (seekEntryOrOpen!0 (select (arr!1607 (_keys!3554 (v!2202 (underlying!145 thiss!992)))) #b00000000000000000000000000000000) (_keys!3554 (v!2202 (underlying!145 thiss!992))) (mask!5750 (v!2202 (underlying!145 thiss!992)))) lt!21249)))

(assert (= (and d!10437 c!6952) b!51986))

(assert (= (and d!10437 (not c!6952)) b!51988))

(assert (= (and b!51988 c!6950) b!51989))

(assert (= (and b!51988 (not c!6950)) b!51987))

(assert (= (and b!51987 c!6951) b!51990))

(assert (= (and b!51987 (not c!6951)) b!51991))

(declare-fun m!44633 () Bool)

(assert (=> b!51988 m!44633))

(assert (=> b!51991 m!44553))

(declare-fun m!44635 () Bool)

(assert (=> b!51991 m!44635))

(declare-fun m!44637 () Bool)

(assert (=> d!10437 m!44637))

(assert (=> d!10437 m!44553))

(declare-fun m!44639 () Bool)

(assert (=> d!10437 m!44639))

(assert (=> d!10437 m!44639))

(assert (=> d!10437 m!44553))

(declare-fun m!44641 () Bool)

(assert (=> d!10437 m!44641))

(assert (=> d!10437 m!44511))

(declare-fun m!44643 () Bool)

(assert (=> d!10437 m!44643))

(declare-fun m!44645 () Bool)

(assert (=> d!10437 m!44645))

(assert (=> b!51882 d!10437))

(declare-fun b!51993 () Bool)

(declare-fun e!33746 () Bool)

(assert (=> b!51993 (= e!33746 tp_is_empty!2223)))

(declare-fun mapNonEmpty!2345 () Bool)

(declare-fun mapRes!2345 () Bool)

(declare-fun tp!6953 () Bool)

(declare-fun e!33747 () Bool)

(assert (=> mapNonEmpty!2345 (= mapRes!2345 (and tp!6953 e!33747))))

(declare-fun mapValue!2345 () ValueCell!768)

(declare-fun mapRest!2345 () (Array (_ BitVec 32) ValueCell!768))

(declare-fun mapKey!2345 () (_ BitVec 32))

(assert (=> mapNonEmpty!2345 (= mapRest!2344 (store mapRest!2345 mapKey!2345 mapValue!2345))))

(declare-fun b!51992 () Bool)

(assert (=> b!51992 (= e!33747 tp_is_empty!2223)))

(declare-fun mapIsEmpty!2345 () Bool)

(assert (=> mapIsEmpty!2345 mapRes!2345))

(declare-fun condMapEmpty!2345 () Bool)

(declare-fun mapDefault!2345 () ValueCell!768)

(assert (=> mapNonEmpty!2344 (= condMapEmpty!2345 (= mapRest!2344 ((as const (Array (_ BitVec 32) ValueCell!768)) mapDefault!2345)))))

(assert (=> mapNonEmpty!2344 (= tp!6952 (and e!33746 mapRes!2345))))

(assert (= (and mapNonEmpty!2344 condMapEmpty!2345) mapIsEmpty!2345))

(assert (= (and mapNonEmpty!2344 (not condMapEmpty!2345)) mapNonEmpty!2345))

(assert (= (and mapNonEmpty!2345 ((_ is ValueCellFull!768) mapValue!2345)) b!51992))

(assert (= (and mapNonEmpty!2344 ((_ is ValueCellFull!768) mapDefault!2345)) b!51993))

(declare-fun m!44647 () Bool)

(assert (=> mapNonEmpty!2345 m!44647))

(declare-fun b!51995 () Bool)

(declare-fun e!33748 () Bool)

(assert (=> b!51995 (= e!33748 tp_is_empty!2223)))

(declare-fun mapNonEmpty!2346 () Bool)

(declare-fun mapRes!2346 () Bool)

(declare-fun tp!6954 () Bool)

(declare-fun e!33749 () Bool)

(assert (=> mapNonEmpty!2346 (= mapRes!2346 (and tp!6954 e!33749))))

(declare-fun mapValue!2346 () ValueCell!768)

(declare-fun mapRest!2346 () (Array (_ BitVec 32) ValueCell!768))

(declare-fun mapKey!2346 () (_ BitVec 32))

(assert (=> mapNonEmpty!2346 (= mapRest!2343 (store mapRest!2346 mapKey!2346 mapValue!2346))))

(declare-fun b!51994 () Bool)

(assert (=> b!51994 (= e!33749 tp_is_empty!2223)))

(declare-fun mapIsEmpty!2346 () Bool)

(assert (=> mapIsEmpty!2346 mapRes!2346))

(declare-fun condMapEmpty!2346 () Bool)

(declare-fun mapDefault!2346 () ValueCell!768)

(assert (=> mapNonEmpty!2343 (= condMapEmpty!2346 (= mapRest!2343 ((as const (Array (_ BitVec 32) ValueCell!768)) mapDefault!2346)))))

(assert (=> mapNonEmpty!2343 (= tp!6951 (and e!33748 mapRes!2346))))

(assert (= (and mapNonEmpty!2343 condMapEmpty!2346) mapIsEmpty!2346))

(assert (= (and mapNonEmpty!2343 (not condMapEmpty!2346)) mapNonEmpty!2346))

(assert (= (and mapNonEmpty!2346 ((_ is ValueCellFull!768) mapValue!2346)) b!51994))

(assert (= (and mapNonEmpty!2343 ((_ is ValueCellFull!768) mapDefault!2346)) b!51995))

(declare-fun m!44649 () Bool)

(assert (=> mapNonEmpty!2346 m!44649))

(check-sat (not bm!3967) (not b_next!1615) (not bm!3965) (not b!51953) (not b!51942) (not b!51920) (not b_next!1613) (not d!10433) (not bm!3964) (not b!51973) (not d!10437) (not b!51943) (not mapNonEmpty!2346) (not b!51948) (not b!51949) (not b!51926) (not b!51954) b_and!2825 (not b!51945) (not b!51950) (not b!51966) (not d!10431) b_and!2823 (not mapNonEmpty!2345) (not bm!3961) (not b!51965) (not d!10417) tp_is_empty!2223 (not b!51937) (not bm!3966) (not b!51919) (not b!51941) (not b!51955) (not d!10423) (not b!51944) (not b!51991))
(check-sat b_and!2823 b_and!2825 (not b_next!1613) (not b_next!1615))
