; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21998 () Bool)

(assert start!21998)

(declare-fun b!225809 () Bool)

(declare-fun b_free!6061 () Bool)

(declare-fun b_next!6061 () Bool)

(assert (=> b!225809 (= b_free!6061 (not b_next!6061))))

(declare-fun tp!21325 () Bool)

(declare-fun b_and!12933 () Bool)

(assert (=> b!225809 (= tp!21325 b_and!12933)))

(declare-fun res!111120 () Bool)

(declare-fun e!146526 () Bool)

(assert (=> start!21998 (=> (not res!111120) (not e!146526))))

(declare-datatypes ((V!7545 0))(
  ( (V!7546 (val!3006 Int)) )
))
(declare-datatypes ((ValueCell!2618 0))(
  ( (ValueCellFull!2618 (v!5020 V!7545)) (EmptyCell!2618) )
))
(declare-datatypes ((array!11081 0))(
  ( (array!11082 (arr!5259 (Array (_ BitVec 32) ValueCell!2618)) (size!5593 (_ BitVec 32))) )
))
(declare-datatypes ((array!11083 0))(
  ( (array!11084 (arr!5260 (Array (_ BitVec 32) (_ BitVec 64))) (size!5594 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3136 0))(
  ( (LongMapFixedSize!3137 (defaultEntry!4227 Int) (mask!10074 (_ BitVec 32)) (extraKeys!3964 (_ BitVec 32)) (zeroValue!4068 V!7545) (minValue!4068 V!7545) (_size!1617 (_ BitVec 32)) (_keys!6280 array!11083) (_values!4210 array!11081) (_vacant!1617 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3136)

(declare-fun valid!1273 (LongMapFixedSize!3136) Bool)

(assert (=> start!21998 (= res!111120 (valid!1273 thiss!1504))))

(assert (=> start!21998 e!146526))

(declare-fun e!146530 () Bool)

(assert (=> start!21998 e!146530))

(assert (=> start!21998 true))

(declare-fun b!225805 () Bool)

(declare-fun res!111129 () Bool)

(declare-fun e!146527 () Bool)

(assert (=> b!225805 (=> res!111129 e!146527)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11083 (_ BitVec 32)) Bool)

(assert (=> b!225805 (= res!111129 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6280 thiss!1504) (mask!10074 thiss!1504))))))

(declare-fun b!225806 () Bool)

(declare-fun e!146535 () Bool)

(declare-fun tp_is_empty!5923 () Bool)

(assert (=> b!225806 (= e!146535 tp_is_empty!5923)))

(declare-fun b!225807 () Bool)

(declare-datatypes ((Unit!6774 0))(
  ( (Unit!6775) )
))
(declare-fun e!146537 () Unit!6774)

(declare-fun Unit!6776 () Unit!6774)

(assert (=> b!225807 (= e!146537 Unit!6776)))

(declare-fun b!225808 () Bool)

(declare-fun res!111126 () Bool)

(assert (=> b!225808 (=> res!111126 e!146527)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225808 (= res!111126 (or (not (= (size!5594 (_keys!6280 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10074 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5594 (_keys!6280 thiss!1504)))))))

(declare-fun e!146533 () Bool)

(declare-fun array_inv!3469 (array!11083) Bool)

(declare-fun array_inv!3470 (array!11081) Bool)

(assert (=> b!225809 (= e!146530 (and tp!21325 tp_is_empty!5923 (array_inv!3469 (_keys!6280 thiss!1504)) (array_inv!3470 (_values!4210 thiss!1504)) e!146533))))

(declare-fun b!225810 () Bool)

(declare-fun e!146528 () Bool)

(declare-datatypes ((SeekEntryResult!874 0))(
  ( (MissingZero!874 (index!5666 (_ BitVec 32))) (Found!874 (index!5667 (_ BitVec 32))) (Intermediate!874 (undefined!1686 Bool) (index!5668 (_ BitVec 32)) (x!23205 (_ BitVec 32))) (Undefined!874) (MissingVacant!874 (index!5669 (_ BitVec 32))) )
))
(declare-fun lt!113597 () SeekEntryResult!874)

(get-info :version)

(assert (=> b!225810 (= e!146528 ((_ is Undefined!874) lt!113597))))

(declare-fun b!225811 () Bool)

(declare-fun e!146532 () Bool)

(declare-fun call!20993 () Bool)

(assert (=> b!225811 (= e!146532 (not call!20993))))

(declare-fun bm!20990 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20990 (= call!20993 (arrayContainsKey!0 (_keys!6280 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225812 () Bool)

(declare-fun res!111121 () Bool)

(assert (=> b!225812 (=> res!111121 e!146527)))

(declare-fun lt!113590 () Bool)

(assert (=> b!225812 (= res!111121 lt!113590)))

(declare-fun mapIsEmpty!10054 () Bool)

(declare-fun mapRes!10054 () Bool)

(assert (=> mapIsEmpty!10054 mapRes!10054))

(declare-fun b!225813 () Bool)

(declare-fun e!146525 () Bool)

(declare-fun e!146529 () Bool)

(assert (=> b!225813 (= e!146525 e!146529)))

(declare-fun res!111130 () Bool)

(assert (=> b!225813 (=> (not res!111130) (not e!146529))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225813 (= res!111130 (inRange!0 index!297 (mask!10074 thiss!1504)))))

(declare-fun lt!113596 () Unit!6774)

(declare-fun e!146531 () Unit!6774)

(assert (=> b!225813 (= lt!113596 e!146531)))

(declare-fun c!37438 () Bool)

(declare-datatypes ((tuple2!4422 0))(
  ( (tuple2!4423 (_1!2222 (_ BitVec 64)) (_2!2222 V!7545)) )
))
(declare-datatypes ((List!3350 0))(
  ( (Nil!3347) (Cons!3346 (h!3994 tuple2!4422) (t!8300 List!3350)) )
))
(declare-datatypes ((ListLongMap!3325 0))(
  ( (ListLongMap!3326 (toList!1678 List!3350)) )
))
(declare-fun contains!1553 (ListLongMap!3325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1187 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 32) Int) ListLongMap!3325)

(assert (=> b!225813 (= c!37438 (contains!1553 (getCurrentListMap!1187 (_keys!6280 thiss!1504) (_values!4210 thiss!1504) (mask!10074 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4227 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10054 () Bool)

(declare-fun tp!21324 () Bool)

(declare-fun e!146524 () Bool)

(assert (=> mapNonEmpty!10054 (= mapRes!10054 (and tp!21324 e!146524))))

(declare-fun mapValue!10054 () ValueCell!2618)

(declare-fun mapRest!10054 () (Array (_ BitVec 32) ValueCell!2618))

(declare-fun mapKey!10054 () (_ BitVec 32))

(assert (=> mapNonEmpty!10054 (= (arr!5259 (_values!4210 thiss!1504)) (store mapRest!10054 mapKey!10054 mapValue!10054))))

(declare-fun bm!20991 () Bool)

(declare-fun call!20994 () Bool)

(declare-fun c!37437 () Bool)

(assert (=> bm!20991 (= call!20994 (inRange!0 (ite c!37437 (index!5666 lt!113597) (index!5669 lt!113597)) (mask!10074 thiss!1504)))))

(declare-fun b!225814 () Bool)

(assert (=> b!225814 (= e!146527 true)))

(declare-fun lt!113593 () Bool)

(declare-datatypes ((List!3351 0))(
  ( (Nil!3348) (Cons!3347 (h!3995 (_ BitVec 64)) (t!8301 List!3351)) )
))
(declare-fun arrayNoDuplicates!0 (array!11083 (_ BitVec 32) List!3351) Bool)

(assert (=> b!225814 (= lt!113593 (arrayNoDuplicates!0 (_keys!6280 thiss!1504) #b00000000000000000000000000000000 Nil!3348))))

(declare-fun b!225815 () Bool)

(declare-fun res!111127 () Bool)

(declare-fun e!146538 () Bool)

(assert (=> b!225815 (=> (not res!111127) (not e!146538))))

(assert (=> b!225815 (= res!111127 (= (select (arr!5260 (_keys!6280 thiss!1504)) (index!5666 lt!113597)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225816 () Bool)

(declare-fun Unit!6777 () Unit!6774)

(assert (=> b!225816 (= e!146531 Unit!6777)))

(declare-fun lt!113594 () Unit!6774)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!247 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) Int) Unit!6774)

(assert (=> b!225816 (= lt!113594 (lemmaInListMapThenSeekEntryOrOpenFindsIt!247 (_keys!6280 thiss!1504) (_values!4210 thiss!1504) (mask!10074 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!225816 false))

(declare-fun b!225817 () Bool)

(declare-fun Unit!6778 () Unit!6774)

(assert (=> b!225817 (= e!146537 Unit!6778)))

(declare-fun lt!113589 () Unit!6774)

(declare-fun lemmaArrayContainsKeyThenInListMap!90 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) (_ BitVec 32) Int) Unit!6774)

(assert (=> b!225817 (= lt!113589 (lemmaArrayContainsKeyThenInListMap!90 (_keys!6280 thiss!1504) (_values!4210 thiss!1504) (mask!10074 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!225817 false))

(declare-fun b!225818 () Bool)

(declare-fun res!111123 () Bool)

(assert (=> b!225818 (=> (not res!111123) (not e!146526))))

(assert (=> b!225818 (= res!111123 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225819 () Bool)

(assert (=> b!225819 (= e!146528 e!146532)))

(declare-fun res!111128 () Bool)

(assert (=> b!225819 (= res!111128 call!20994)))

(assert (=> b!225819 (=> (not res!111128) (not e!146532))))

(declare-fun b!225820 () Bool)

(assert (=> b!225820 (= e!146538 (not call!20993))))

(declare-fun b!225821 () Bool)

(assert (=> b!225821 (= e!146524 tp_is_empty!5923)))

(declare-fun b!225822 () Bool)

(declare-fun res!111131 () Bool)

(assert (=> b!225822 (=> (not res!111131) (not e!146538))))

(assert (=> b!225822 (= res!111131 call!20994)))

(declare-fun e!146536 () Bool)

(assert (=> b!225822 (= e!146536 e!146538)))

(declare-fun b!225823 () Bool)

(declare-fun lt!113592 () Unit!6774)

(assert (=> b!225823 (= e!146531 lt!113592)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!245 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) Int) Unit!6774)

(assert (=> b!225823 (= lt!113592 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!245 (_keys!6280 thiss!1504) (_values!4210 thiss!1504) (mask!10074 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!225823 (= c!37437 ((_ is MissingZero!874) lt!113597))))

(assert (=> b!225823 e!146536))

(declare-fun b!225824 () Bool)

(assert (=> b!225824 (= e!146526 e!146525)))

(declare-fun res!111125 () Bool)

(assert (=> b!225824 (=> (not res!111125) (not e!146525))))

(assert (=> b!225824 (= res!111125 (or (= lt!113597 (MissingZero!874 index!297)) (= lt!113597 (MissingVacant!874 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11083 (_ BitVec 32)) SeekEntryResult!874)

(assert (=> b!225824 (= lt!113597 (seekEntryOrOpen!0 key!932 (_keys!6280 thiss!1504) (mask!10074 thiss!1504)))))

(declare-fun b!225825 () Bool)

(declare-fun res!111122 () Bool)

(assert (=> b!225825 (=> res!111122 e!146527)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225825 (= res!111122 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225826 () Bool)

(declare-fun c!37436 () Bool)

(assert (=> b!225826 (= c!37436 ((_ is MissingVacant!874) lt!113597))))

(assert (=> b!225826 (= e!146536 e!146528)))

(declare-fun b!225827 () Bool)

(assert (=> b!225827 (= e!146533 (and e!146535 mapRes!10054))))

(declare-fun condMapEmpty!10054 () Bool)

(declare-fun mapDefault!10054 () ValueCell!2618)

(assert (=> b!225827 (= condMapEmpty!10054 (= (arr!5259 (_values!4210 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2618)) mapDefault!10054)))))

(declare-fun b!225828 () Bool)

(declare-fun res!111119 () Bool)

(assert (=> b!225828 (= res!111119 (= (select (arr!5260 (_keys!6280 thiss!1504)) (index!5669 lt!113597)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225828 (=> (not res!111119) (not e!146532))))

(declare-fun b!225829 () Bool)

(assert (=> b!225829 (= e!146529 (not e!146527))))

(declare-fun res!111124 () Bool)

(assert (=> b!225829 (=> res!111124 e!146527)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225829 (= res!111124 (not (validMask!0 (mask!10074 thiss!1504))))))

(declare-fun lt!113598 () array!11083)

(declare-fun arrayCountValidKeys!0 (array!11083 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225829 (= (arrayCountValidKeys!0 lt!113598 #b00000000000000000000000000000000 (size!5594 (_keys!6280 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6280 thiss!1504) #b00000000000000000000000000000000 (size!5594 (_keys!6280 thiss!1504)))))))

(declare-fun lt!113599 () Unit!6774)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11083 (_ BitVec 32) (_ BitVec 64)) Unit!6774)

(assert (=> b!225829 (= lt!113599 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6280 thiss!1504) index!297 key!932))))

(assert (=> b!225829 (arrayNoDuplicates!0 lt!113598 #b00000000000000000000000000000000 Nil!3348)))

(assert (=> b!225829 (= lt!113598 (array!11084 (store (arr!5260 (_keys!6280 thiss!1504)) index!297 key!932) (size!5594 (_keys!6280 thiss!1504))))))

(declare-fun lt!113591 () Unit!6774)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11083 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3351) Unit!6774)

(assert (=> b!225829 (= lt!113591 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6280 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3348))))

(declare-fun lt!113595 () Unit!6774)

(assert (=> b!225829 (= lt!113595 e!146537)))

(declare-fun c!37435 () Bool)

(assert (=> b!225829 (= c!37435 lt!113590)))

(assert (=> b!225829 (= lt!113590 (arrayContainsKey!0 (_keys!6280 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21998 res!111120) b!225818))

(assert (= (and b!225818 res!111123) b!225824))

(assert (= (and b!225824 res!111125) b!225813))

(assert (= (and b!225813 c!37438) b!225816))

(assert (= (and b!225813 (not c!37438)) b!225823))

(assert (= (and b!225823 c!37437) b!225822))

(assert (= (and b!225823 (not c!37437)) b!225826))

(assert (= (and b!225822 res!111131) b!225815))

(assert (= (and b!225815 res!111127) b!225820))

(assert (= (and b!225826 c!37436) b!225819))

(assert (= (and b!225826 (not c!37436)) b!225810))

(assert (= (and b!225819 res!111128) b!225828))

(assert (= (and b!225828 res!111119) b!225811))

(assert (= (or b!225822 b!225819) bm!20991))

(assert (= (or b!225820 b!225811) bm!20990))

(assert (= (and b!225813 res!111130) b!225829))

(assert (= (and b!225829 c!37435) b!225817))

(assert (= (and b!225829 (not c!37435)) b!225807))

(assert (= (and b!225829 (not res!111124)) b!225808))

(assert (= (and b!225808 (not res!111126)) b!225825))

(assert (= (and b!225825 (not res!111122)) b!225812))

(assert (= (and b!225812 (not res!111121)) b!225805))

(assert (= (and b!225805 (not res!111129)) b!225814))

(assert (= (and b!225827 condMapEmpty!10054) mapIsEmpty!10054))

(assert (= (and b!225827 (not condMapEmpty!10054)) mapNonEmpty!10054))

(assert (= (and mapNonEmpty!10054 ((_ is ValueCellFull!2618) mapValue!10054)) b!225821))

(assert (= (and b!225827 ((_ is ValueCellFull!2618) mapDefault!10054)) b!225806))

(assert (= b!225809 b!225827))

(assert (= start!21998 b!225809))

(declare-fun m!247783 () Bool)

(assert (=> b!225816 m!247783))

(declare-fun m!247785 () Bool)

(assert (=> mapNonEmpty!10054 m!247785))

(declare-fun m!247787 () Bool)

(assert (=> b!225815 m!247787))

(declare-fun m!247789 () Bool)

(assert (=> b!225824 m!247789))

(declare-fun m!247791 () Bool)

(assert (=> bm!20990 m!247791))

(declare-fun m!247793 () Bool)

(assert (=> b!225813 m!247793))

(declare-fun m!247795 () Bool)

(assert (=> b!225813 m!247795))

(assert (=> b!225813 m!247795))

(declare-fun m!247797 () Bool)

(assert (=> b!225813 m!247797))

(declare-fun m!247799 () Bool)

(assert (=> b!225829 m!247799))

(assert (=> b!225829 m!247791))

(declare-fun m!247801 () Bool)

(assert (=> b!225829 m!247801))

(declare-fun m!247803 () Bool)

(assert (=> b!225829 m!247803))

(declare-fun m!247805 () Bool)

(assert (=> b!225829 m!247805))

(declare-fun m!247807 () Bool)

(assert (=> b!225829 m!247807))

(declare-fun m!247809 () Bool)

(assert (=> b!225829 m!247809))

(declare-fun m!247811 () Bool)

(assert (=> b!225829 m!247811))

(declare-fun m!247813 () Bool)

(assert (=> b!225817 m!247813))

(declare-fun m!247815 () Bool)

(assert (=> start!21998 m!247815))

(declare-fun m!247817 () Bool)

(assert (=> b!225814 m!247817))

(declare-fun m!247819 () Bool)

(assert (=> b!225828 m!247819))

(declare-fun m!247821 () Bool)

(assert (=> b!225823 m!247821))

(declare-fun m!247823 () Bool)

(assert (=> b!225825 m!247823))

(declare-fun m!247825 () Bool)

(assert (=> bm!20991 m!247825))

(declare-fun m!247827 () Bool)

(assert (=> b!225805 m!247827))

(declare-fun m!247829 () Bool)

(assert (=> b!225809 m!247829))

(declare-fun m!247831 () Bool)

(assert (=> b!225809 m!247831))

(check-sat (not b!225823) (not bm!20990) (not b!225814) (not b!225805) (not b!225824) tp_is_empty!5923 (not b_next!6061) (not mapNonEmpty!10054) (not bm!20991) (not b!225809) (not b!225813) (not b!225829) (not start!21998) b_and!12933 (not b!225816) (not b!225825) (not b!225817))
(check-sat b_and!12933 (not b_next!6061))
