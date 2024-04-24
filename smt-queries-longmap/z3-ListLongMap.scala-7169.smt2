; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91782 () Bool)

(assert start!91782)

(declare-fun b!1043954 () Bool)

(declare-fun b_free!21067 () Bool)

(declare-fun b_next!21067 () Bool)

(assert (=> b!1043954 (= b_free!21067 (not b_next!21067))))

(declare-fun tp!74429 () Bool)

(declare-fun b_and!33609 () Bool)

(assert (=> b!1043954 (= tp!74429 b_and!33609)))

(declare-datatypes ((V!37923 0))(
  ( (V!37924 (val!12444 Int)) )
))
(declare-datatypes ((ValueCell!11690 0))(
  ( (ValueCellFull!11690 (v!15031 V!37923)) (EmptyCell!11690) )
))
(declare-datatypes ((array!65779 0))(
  ( (array!65780 (arr!31639 (Array (_ BitVec 32) (_ BitVec 64))) (size!32175 (_ BitVec 32))) )
))
(declare-datatypes ((array!65781 0))(
  ( (array!65782 (arr!31640 (Array (_ BitVec 32) ValueCell!11690)) (size!32176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5974 0))(
  ( (LongMapFixedSize!5975 (defaultEntry!6369 Int) (mask!30498 (_ BitVec 32)) (extraKeys!6097 (_ BitVec 32)) (zeroValue!6203 V!37923) (minValue!6203 V!37923) (_size!3042 (_ BitVec 32)) (_keys!11659 array!65779) (_values!6392 array!65781) (_vacant!3042 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5974)

(declare-fun e!591494 () Bool)

(declare-fun tp_is_empty!24787 () Bool)

(declare-fun e!591489 () Bool)

(declare-fun array_inv!24457 (array!65779) Bool)

(declare-fun array_inv!24458 (array!65781) Bool)

(assert (=> b!1043954 (= e!591494 (and tp!74429 tp_is_empty!24787 (array_inv!24457 (_keys!11659 thiss!1427)) (array_inv!24458 (_values!6392 thiss!1427)) e!591489))))

(declare-fun res!695214 () Bool)

(declare-fun e!591490 () Bool)

(assert (=> start!91782 (=> (not res!695214) (not e!591490))))

(declare-fun valid!2250 (LongMapFixedSize!5974) Bool)

(assert (=> start!91782 (= res!695214 (valid!2250 thiss!1427))))

(assert (=> start!91782 e!591490))

(assert (=> start!91782 e!591494))

(assert (=> start!91782 true))

(declare-fun b!1043955 () Bool)

(declare-fun e!591493 () Bool)

(assert (=> b!1043955 (= e!591493 tp_is_empty!24787)))

(declare-fun b!1043956 () Bool)

(declare-fun e!591492 () Bool)

(declare-datatypes ((SeekEntryResult!9776 0))(
  ( (MissingZero!9776 (index!41475 (_ BitVec 32))) (Found!9776 (index!41476 (_ BitVec 32))) (Intermediate!9776 (undefined!10588 Bool) (index!41477 (_ BitVec 32)) (x!93066 (_ BitVec 32))) (Undefined!9776) (MissingVacant!9776 (index!41478 (_ BitVec 32))) )
))
(declare-fun lt!460077 () SeekEntryResult!9776)

(assert (=> b!1043956 (= e!591492 (and (bvsge (index!41476 lt!460077) #b00000000000000000000000000000000) (bvslt (index!41476 lt!460077) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun mapNonEmpty!38792 () Bool)

(declare-fun mapRes!38792 () Bool)

(declare-fun tp!74430 () Bool)

(declare-fun e!591495 () Bool)

(assert (=> mapNonEmpty!38792 (= mapRes!38792 (and tp!74430 e!591495))))

(declare-fun mapValue!38792 () ValueCell!11690)

(declare-fun mapKey!38792 () (_ BitVec 32))

(declare-fun mapRest!38792 () (Array (_ BitVec 32) ValueCell!11690))

(assert (=> mapNonEmpty!38792 (= (arr!31640 (_values!6392 thiss!1427)) (store mapRest!38792 mapKey!38792 mapValue!38792))))

(declare-fun b!1043957 () Bool)

(declare-fun res!695215 () Bool)

(assert (=> b!1043957 (=> res!695215 e!591492)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65779 (_ BitVec 32)) Bool)

(assert (=> b!1043957 (= res!695215 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11659 thiss!1427) (mask!30498 thiss!1427))))))

(declare-fun b!1043958 () Bool)

(declare-fun e!591491 () Bool)

(assert (=> b!1043958 (= e!591490 e!591491)))

(declare-fun res!695217 () Bool)

(assert (=> b!1043958 (=> (not res!695217) (not e!591491))))

(get-info :version)

(assert (=> b!1043958 (= res!695217 ((_ is Found!9776) lt!460077))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65779 (_ BitVec 32)) SeekEntryResult!9776)

(assert (=> b!1043958 (= lt!460077 (seekEntry!0 key!909 (_keys!11659 thiss!1427) (mask!30498 thiss!1427)))))

(declare-fun b!1043959 () Bool)

(assert (=> b!1043959 (= e!591489 (and e!591493 mapRes!38792))))

(declare-fun condMapEmpty!38792 () Bool)

(declare-fun mapDefault!38792 () ValueCell!11690)

(assert (=> b!1043959 (= condMapEmpty!38792 (= (arr!31640 (_values!6392 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11690)) mapDefault!38792)))))

(declare-fun b!1043960 () Bool)

(declare-fun res!695211 () Bool)

(assert (=> b!1043960 (=> (not res!695211) (not e!591490))))

(assert (=> b!1043960 (= res!695211 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043961 () Bool)

(declare-fun res!695213 () Bool)

(assert (=> b!1043961 (=> res!695213 e!591492)))

(declare-datatypes ((List!21970 0))(
  ( (Nil!21967) (Cons!21966 (h!23183 (_ BitVec 64)) (t!31176 List!21970)) )
))
(declare-fun arrayNoDuplicates!0 (array!65779 (_ BitVec 32) List!21970) Bool)

(assert (=> b!1043961 (= res!695213 (not (arrayNoDuplicates!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 Nil!21967)))))

(declare-fun mapIsEmpty!38792 () Bool)

(assert (=> mapIsEmpty!38792 mapRes!38792))

(declare-fun b!1043962 () Bool)

(declare-fun res!695216 () Bool)

(assert (=> b!1043962 (=> res!695216 e!591492)))

(assert (=> b!1043962 (= res!695216 (or (not (= (size!32176 (_values!6392 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30498 thiss!1427)))) (not (= (size!32175 (_keys!11659 thiss!1427)) (size!32176 (_values!6392 thiss!1427)))) (bvslt (mask!30498 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6097 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6097 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043963 () Bool)

(assert (=> b!1043963 (= e!591491 (not e!591492))))

(declare-fun res!695212 () Bool)

(assert (=> b!1043963 (=> res!695212 e!591492)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043963 (= res!695212 (not (validMask!0 (mask!30498 thiss!1427))))))

(declare-fun lt!460075 () array!65779)

(declare-fun arrayContainsKey!0 (array!65779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043963 (not (arrayContainsKey!0 lt!460075 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34065 0))(
  ( (Unit!34066) )
))
(declare-fun lt!460076 () Unit!34065)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65779 (_ BitVec 32) (_ BitVec 64)) Unit!34065)

(assert (=> b!1043963 (= lt!460076 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11659 thiss!1427) (index!41476 lt!460077) key!909))))

(assert (=> b!1043963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460075 (mask!30498 thiss!1427))))

(declare-fun lt!460080 () Unit!34065)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65779 (_ BitVec 32) (_ BitVec 32)) Unit!34065)

(assert (=> b!1043963 (= lt!460080 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11659 thiss!1427) (index!41476 lt!460077) (mask!30498 thiss!1427)))))

(assert (=> b!1043963 (arrayNoDuplicates!0 lt!460075 #b00000000000000000000000000000000 Nil!21967)))

(declare-fun lt!460079 () Unit!34065)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65779 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21970) Unit!34065)

(assert (=> b!1043963 (= lt!460079 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11659 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41476 lt!460077) #b00000000000000000000000000000000 Nil!21967))))

(declare-fun arrayCountValidKeys!0 (array!65779 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043963 (= (arrayCountValidKeys!0 lt!460075 #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043963 (= lt!460075 (array!65780 (store (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun lt!460078 () Unit!34065)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65779 (_ BitVec 32) (_ BitVec 64)) Unit!34065)

(assert (=> b!1043963 (= lt!460078 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11659 thiss!1427) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043964 () Bool)

(assert (=> b!1043964 (= e!591495 tp_is_empty!24787)))

(assert (= (and start!91782 res!695214) b!1043960))

(assert (= (and b!1043960 res!695211) b!1043958))

(assert (= (and b!1043958 res!695217) b!1043963))

(assert (= (and b!1043963 (not res!695212)) b!1043962))

(assert (= (and b!1043962 (not res!695216)) b!1043957))

(assert (= (and b!1043957 (not res!695215)) b!1043961))

(assert (= (and b!1043961 (not res!695213)) b!1043956))

(assert (= (and b!1043959 condMapEmpty!38792) mapIsEmpty!38792))

(assert (= (and b!1043959 (not condMapEmpty!38792)) mapNonEmpty!38792))

(assert (= (and mapNonEmpty!38792 ((_ is ValueCellFull!11690) mapValue!38792)) b!1043964))

(assert (= (and b!1043959 ((_ is ValueCellFull!11690) mapDefault!38792)) b!1043955))

(assert (= b!1043954 b!1043959))

(assert (= start!91782 b!1043954))

(declare-fun m!963585 () Bool)

(assert (=> b!1043961 m!963585))

(declare-fun m!963587 () Bool)

(assert (=> b!1043958 m!963587))

(declare-fun m!963589 () Bool)

(assert (=> b!1043957 m!963589))

(declare-fun m!963591 () Bool)

(assert (=> b!1043954 m!963591))

(declare-fun m!963593 () Bool)

(assert (=> b!1043954 m!963593))

(declare-fun m!963595 () Bool)

(assert (=> start!91782 m!963595))

(declare-fun m!963597 () Bool)

(assert (=> b!1043963 m!963597))

(declare-fun m!963599 () Bool)

(assert (=> b!1043963 m!963599))

(declare-fun m!963601 () Bool)

(assert (=> b!1043963 m!963601))

(declare-fun m!963603 () Bool)

(assert (=> b!1043963 m!963603))

(declare-fun m!963605 () Bool)

(assert (=> b!1043963 m!963605))

(declare-fun m!963607 () Bool)

(assert (=> b!1043963 m!963607))

(declare-fun m!963609 () Bool)

(assert (=> b!1043963 m!963609))

(declare-fun m!963611 () Bool)

(assert (=> b!1043963 m!963611))

(declare-fun m!963613 () Bool)

(assert (=> b!1043963 m!963613))

(declare-fun m!963615 () Bool)

(assert (=> b!1043963 m!963615))

(declare-fun m!963617 () Bool)

(assert (=> b!1043963 m!963617))

(declare-fun m!963619 () Bool)

(assert (=> mapNonEmpty!38792 m!963619))

(check-sat (not b!1043954) (not b!1043957) (not b!1043963) b_and!33609 (not start!91782) (not b!1043961) (not b!1043958) (not mapNonEmpty!38792) tp_is_empty!24787 (not b_next!21067))
(check-sat b_and!33609 (not b_next!21067))
(get-model)

(declare-fun bm!44253 () Bool)

(declare-fun call!44256 () Bool)

(declare-fun c!106270 () Bool)

(assert (=> bm!44253 (= call!44256 (arrayNoDuplicates!0 (_keys!11659 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106270 (Cons!21966 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000) Nil!21967) Nil!21967)))))

(declare-fun b!1044041 () Bool)

(declare-fun e!591555 () Bool)

(declare-fun e!591552 () Bool)

(assert (=> b!1044041 (= e!591555 e!591552)))

(declare-fun res!695267 () Bool)

(assert (=> b!1044041 (=> (not res!695267) (not e!591552))))

(declare-fun e!591554 () Bool)

(assert (=> b!1044041 (= res!695267 (not e!591554))))

(declare-fun res!695268 () Bool)

(assert (=> b!1044041 (=> (not res!695268) (not e!591554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044041 (= res!695268 (validKeyInArray!0 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044042 () Bool)

(declare-fun e!591553 () Bool)

(assert (=> b!1044042 (= e!591553 call!44256)))

(declare-fun d!126613 () Bool)

(declare-fun res!695266 () Bool)

(assert (=> d!126613 (=> res!695266 e!591555)))

(assert (=> d!126613 (= res!695266 (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126613 (= (arrayNoDuplicates!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 Nil!21967) e!591555)))

(declare-fun b!1044043 () Bool)

(assert (=> b!1044043 (= e!591553 call!44256)))

(declare-fun b!1044044 () Bool)

(declare-fun contains!6085 (List!21970 (_ BitVec 64)) Bool)

(assert (=> b!1044044 (= e!591554 (contains!6085 Nil!21967 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044045 () Bool)

(assert (=> b!1044045 (= e!591552 e!591553)))

(assert (=> b!1044045 (= c!106270 (validKeyInArray!0 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126613 (not res!695266)) b!1044041))

(assert (= (and b!1044041 res!695268) b!1044044))

(assert (= (and b!1044041 res!695267) b!1044045))

(assert (= (and b!1044045 c!106270) b!1044043))

(assert (= (and b!1044045 (not c!106270)) b!1044042))

(assert (= (or b!1044043 b!1044042) bm!44253))

(declare-fun m!963693 () Bool)

(assert (=> bm!44253 m!963693))

(declare-fun m!963695 () Bool)

(assert (=> bm!44253 m!963695))

(assert (=> b!1044041 m!963693))

(assert (=> b!1044041 m!963693))

(declare-fun m!963697 () Bool)

(assert (=> b!1044041 m!963697))

(assert (=> b!1044044 m!963693))

(assert (=> b!1044044 m!963693))

(declare-fun m!963699 () Bool)

(assert (=> b!1044044 m!963699))

(assert (=> b!1044045 m!963693))

(assert (=> b!1044045 m!963693))

(assert (=> b!1044045 m!963697))

(assert (=> b!1043961 d!126613))

(declare-fun d!126615 () Bool)

(declare-fun res!695274 () Bool)

(declare-fun e!591564 () Bool)

(assert (=> d!126615 (=> res!695274 e!591564)))

(assert (=> d!126615 (= res!695274 (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126615 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11659 thiss!1427) (mask!30498 thiss!1427)) e!591564)))

(declare-fun b!1044054 () Bool)

(declare-fun e!591563 () Bool)

(declare-fun call!44259 () Bool)

(assert (=> b!1044054 (= e!591563 call!44259)))

(declare-fun b!1044055 () Bool)

(declare-fun e!591562 () Bool)

(assert (=> b!1044055 (= e!591562 call!44259)))

(declare-fun bm!44256 () Bool)

(assert (=> bm!44256 (= call!44259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11659 thiss!1427) (mask!30498 thiss!1427)))))

(declare-fun b!1044056 () Bool)

(assert (=> b!1044056 (= e!591562 e!591563)))

(declare-fun lt!460123 () (_ BitVec 64))

(assert (=> b!1044056 (= lt!460123 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460125 () Unit!34065)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65779 (_ BitVec 64) (_ BitVec 32)) Unit!34065)

(assert (=> b!1044056 (= lt!460125 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11659 thiss!1427) lt!460123 #b00000000000000000000000000000000))))

(assert (=> b!1044056 (arrayContainsKey!0 (_keys!11659 thiss!1427) lt!460123 #b00000000000000000000000000000000)))

(declare-fun lt!460124 () Unit!34065)

(assert (=> b!1044056 (= lt!460124 lt!460125)))

(declare-fun res!695273 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65779 (_ BitVec 32)) SeekEntryResult!9776)

(assert (=> b!1044056 (= res!695273 (= (seekEntryOrOpen!0 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000) (_keys!11659 thiss!1427) (mask!30498 thiss!1427)) (Found!9776 #b00000000000000000000000000000000)))))

(assert (=> b!1044056 (=> (not res!695273) (not e!591563))))

(declare-fun b!1044057 () Bool)

(assert (=> b!1044057 (= e!591564 e!591562)))

(declare-fun c!106273 () Bool)

(assert (=> b!1044057 (= c!106273 (validKeyInArray!0 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126615 (not res!695274)) b!1044057))

(assert (= (and b!1044057 c!106273) b!1044056))

(assert (= (and b!1044057 (not c!106273)) b!1044055))

(assert (= (and b!1044056 res!695273) b!1044054))

(assert (= (or b!1044054 b!1044055) bm!44256))

(declare-fun m!963701 () Bool)

(assert (=> bm!44256 m!963701))

(assert (=> b!1044056 m!963693))

(declare-fun m!963703 () Bool)

(assert (=> b!1044056 m!963703))

(declare-fun m!963705 () Bool)

(assert (=> b!1044056 m!963705))

(assert (=> b!1044056 m!963693))

(declare-fun m!963707 () Bool)

(assert (=> b!1044056 m!963707))

(assert (=> b!1044057 m!963693))

(assert (=> b!1044057 m!963693))

(assert (=> b!1044057 m!963697))

(assert (=> b!1043957 d!126615))

(declare-fun b!1044070 () Bool)

(declare-fun e!591571 () SeekEntryResult!9776)

(assert (=> b!1044070 (= e!591571 Undefined!9776)))

(declare-fun d!126617 () Bool)

(declare-fun lt!460136 () SeekEntryResult!9776)

(assert (=> d!126617 (and (or ((_ is MissingVacant!9776) lt!460136) (not ((_ is Found!9776) lt!460136)) (and (bvsge (index!41476 lt!460136) #b00000000000000000000000000000000) (bvslt (index!41476 lt!460136) (size!32175 (_keys!11659 thiss!1427))))) (not ((_ is MissingVacant!9776) lt!460136)) (or (not ((_ is Found!9776) lt!460136)) (= (select (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460136)) key!909)))))

(assert (=> d!126617 (= lt!460136 e!591571)))

(declare-fun c!106280 () Bool)

(declare-fun lt!460137 () SeekEntryResult!9776)

(assert (=> d!126617 (= c!106280 (and ((_ is Intermediate!9776) lt!460137) (undefined!10588 lt!460137)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65779 (_ BitVec 32)) SeekEntryResult!9776)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126617 (= lt!460137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30498 thiss!1427)) key!909 (_keys!11659 thiss!1427) (mask!30498 thiss!1427)))))

(assert (=> d!126617 (validMask!0 (mask!30498 thiss!1427))))

(assert (=> d!126617 (= (seekEntry!0 key!909 (_keys!11659 thiss!1427) (mask!30498 thiss!1427)) lt!460136)))

(declare-fun b!1044071 () Bool)

(declare-fun c!106281 () Bool)

(declare-fun lt!460135 () (_ BitVec 64))

(assert (=> b!1044071 (= c!106281 (= lt!460135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591573 () SeekEntryResult!9776)

(declare-fun e!591572 () SeekEntryResult!9776)

(assert (=> b!1044071 (= e!591573 e!591572)))

(declare-fun b!1044072 () Bool)

(assert (=> b!1044072 (= e!591571 e!591573)))

(assert (=> b!1044072 (= lt!460135 (select (arr!31639 (_keys!11659 thiss!1427)) (index!41477 lt!460137)))))

(declare-fun c!106282 () Bool)

(assert (=> b!1044072 (= c!106282 (= lt!460135 key!909))))

(declare-fun b!1044073 () Bool)

(declare-fun lt!460134 () SeekEntryResult!9776)

(assert (=> b!1044073 (= e!591572 (ite ((_ is MissingVacant!9776) lt!460134) (MissingZero!9776 (index!41478 lt!460134)) lt!460134))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65779 (_ BitVec 32)) SeekEntryResult!9776)

(assert (=> b!1044073 (= lt!460134 (seekKeyOrZeroReturnVacant!0 (x!93066 lt!460137) (index!41477 lt!460137) (index!41477 lt!460137) key!909 (_keys!11659 thiss!1427) (mask!30498 thiss!1427)))))

(declare-fun b!1044074 () Bool)

(assert (=> b!1044074 (= e!591573 (Found!9776 (index!41477 lt!460137)))))

(declare-fun b!1044075 () Bool)

(assert (=> b!1044075 (= e!591572 (MissingZero!9776 (index!41477 lt!460137)))))

(assert (= (and d!126617 c!106280) b!1044070))

(assert (= (and d!126617 (not c!106280)) b!1044072))

(assert (= (and b!1044072 c!106282) b!1044074))

(assert (= (and b!1044072 (not c!106282)) b!1044071))

(assert (= (and b!1044071 c!106281) b!1044075))

(assert (= (and b!1044071 (not c!106281)) b!1044073))

(declare-fun m!963709 () Bool)

(assert (=> d!126617 m!963709))

(declare-fun m!963711 () Bool)

(assert (=> d!126617 m!963711))

(assert (=> d!126617 m!963711))

(declare-fun m!963713 () Bool)

(assert (=> d!126617 m!963713))

(assert (=> d!126617 m!963599))

(declare-fun m!963715 () Bool)

(assert (=> b!1044072 m!963715))

(declare-fun m!963717 () Bool)

(assert (=> b!1044073 m!963717))

(assert (=> b!1043958 d!126617))

(declare-fun d!126619 () Bool)

(declare-fun res!695276 () Bool)

(declare-fun e!591576 () Bool)

(assert (=> d!126619 (=> res!695276 e!591576)))

(assert (=> d!126619 (= res!695276 (bvsge #b00000000000000000000000000000000 (size!32175 lt!460075)))))

(assert (=> d!126619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460075 (mask!30498 thiss!1427)) e!591576)))

(declare-fun b!1044076 () Bool)

(declare-fun e!591575 () Bool)

(declare-fun call!44260 () Bool)

(assert (=> b!1044076 (= e!591575 call!44260)))

(declare-fun b!1044077 () Bool)

(declare-fun e!591574 () Bool)

(assert (=> b!1044077 (= e!591574 call!44260)))

(declare-fun bm!44257 () Bool)

(assert (=> bm!44257 (= call!44260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460075 (mask!30498 thiss!1427)))))

(declare-fun b!1044078 () Bool)

(assert (=> b!1044078 (= e!591574 e!591575)))

(declare-fun lt!460138 () (_ BitVec 64))

(assert (=> b!1044078 (= lt!460138 (select (arr!31639 lt!460075) #b00000000000000000000000000000000))))

(declare-fun lt!460140 () Unit!34065)

(assert (=> b!1044078 (= lt!460140 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460075 lt!460138 #b00000000000000000000000000000000))))

(assert (=> b!1044078 (arrayContainsKey!0 lt!460075 lt!460138 #b00000000000000000000000000000000)))

(declare-fun lt!460139 () Unit!34065)

(assert (=> b!1044078 (= lt!460139 lt!460140)))

(declare-fun res!695275 () Bool)

(assert (=> b!1044078 (= res!695275 (= (seekEntryOrOpen!0 (select (arr!31639 lt!460075) #b00000000000000000000000000000000) lt!460075 (mask!30498 thiss!1427)) (Found!9776 #b00000000000000000000000000000000)))))

(assert (=> b!1044078 (=> (not res!695275) (not e!591575))))

(declare-fun b!1044079 () Bool)

(assert (=> b!1044079 (= e!591576 e!591574)))

(declare-fun c!106283 () Bool)

(assert (=> b!1044079 (= c!106283 (validKeyInArray!0 (select (arr!31639 lt!460075) #b00000000000000000000000000000000)))))

(assert (= (and d!126619 (not res!695276)) b!1044079))

(assert (= (and b!1044079 c!106283) b!1044078))

(assert (= (and b!1044079 (not c!106283)) b!1044077))

(assert (= (and b!1044078 res!695275) b!1044076))

(assert (= (or b!1044076 b!1044077) bm!44257))

(declare-fun m!963719 () Bool)

(assert (=> bm!44257 m!963719))

(declare-fun m!963721 () Bool)

(assert (=> b!1044078 m!963721))

(declare-fun m!963723 () Bool)

(assert (=> b!1044078 m!963723))

(declare-fun m!963725 () Bool)

(assert (=> b!1044078 m!963725))

(assert (=> b!1044078 m!963721))

(declare-fun m!963727 () Bool)

(assert (=> b!1044078 m!963727))

(assert (=> b!1044079 m!963721))

(assert (=> b!1044079 m!963721))

(declare-fun m!963729 () Bool)

(assert (=> b!1044079 m!963729))

(assert (=> b!1043963 d!126619))

(declare-fun b!1044088 () Bool)

(declare-fun e!591582 () (_ BitVec 32))

(declare-fun call!44263 () (_ BitVec 32))

(assert (=> b!1044088 (= e!591582 call!44263)))

(declare-fun d!126621 () Bool)

(declare-fun lt!460143 () (_ BitVec 32))

(assert (=> d!126621 (and (bvsge lt!460143 #b00000000000000000000000000000000) (bvsle lt!460143 (bvsub (size!32175 lt!460075) #b00000000000000000000000000000000)))))

(declare-fun e!591581 () (_ BitVec 32))

(assert (=> d!126621 (= lt!460143 e!591581)))

(declare-fun c!106289 () Bool)

(assert (=> d!126621 (= c!106289 (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126621 (and (bvsle #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32175 (_keys!11659 thiss!1427)) (size!32175 lt!460075)))))

(assert (=> d!126621 (= (arrayCountValidKeys!0 lt!460075 #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) lt!460143)))

(declare-fun bm!44260 () Bool)

(assert (=> bm!44260 (= call!44263 (arrayCountValidKeys!0 lt!460075 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun b!1044089 () Bool)

(assert (=> b!1044089 (= e!591582 (bvadd #b00000000000000000000000000000001 call!44263))))

(declare-fun b!1044090 () Bool)

(assert (=> b!1044090 (= e!591581 e!591582)))

(declare-fun c!106288 () Bool)

(assert (=> b!1044090 (= c!106288 (validKeyInArray!0 (select (arr!31639 lt!460075) #b00000000000000000000000000000000)))))

(declare-fun b!1044091 () Bool)

(assert (=> b!1044091 (= e!591581 #b00000000000000000000000000000000)))

(assert (= (and d!126621 c!106289) b!1044091))

(assert (= (and d!126621 (not c!106289)) b!1044090))

(assert (= (and b!1044090 c!106288) b!1044089))

(assert (= (and b!1044090 (not c!106288)) b!1044088))

(assert (= (or b!1044089 b!1044088) bm!44260))

(declare-fun m!963731 () Bool)

(assert (=> bm!44260 m!963731))

(assert (=> b!1044090 m!963721))

(assert (=> b!1044090 m!963721))

(assert (=> b!1044090 m!963729))

(assert (=> b!1043963 d!126621))

(declare-fun bm!44261 () Bool)

(declare-fun call!44264 () Bool)

(declare-fun c!106290 () Bool)

(assert (=> bm!44261 (= call!44264 (arrayNoDuplicates!0 lt!460075 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106290 (Cons!21966 (select (arr!31639 lt!460075) #b00000000000000000000000000000000) Nil!21967) Nil!21967)))))

(declare-fun b!1044092 () Bool)

(declare-fun e!591586 () Bool)

(declare-fun e!591583 () Bool)

(assert (=> b!1044092 (= e!591586 e!591583)))

(declare-fun res!695278 () Bool)

(assert (=> b!1044092 (=> (not res!695278) (not e!591583))))

(declare-fun e!591585 () Bool)

(assert (=> b!1044092 (= res!695278 (not e!591585))))

(declare-fun res!695279 () Bool)

(assert (=> b!1044092 (=> (not res!695279) (not e!591585))))

(assert (=> b!1044092 (= res!695279 (validKeyInArray!0 (select (arr!31639 lt!460075) #b00000000000000000000000000000000)))))

(declare-fun b!1044093 () Bool)

(declare-fun e!591584 () Bool)

(assert (=> b!1044093 (= e!591584 call!44264)))

(declare-fun d!126623 () Bool)

(declare-fun res!695277 () Bool)

(assert (=> d!126623 (=> res!695277 e!591586)))

(assert (=> d!126623 (= res!695277 (bvsge #b00000000000000000000000000000000 (size!32175 lt!460075)))))

(assert (=> d!126623 (= (arrayNoDuplicates!0 lt!460075 #b00000000000000000000000000000000 Nil!21967) e!591586)))

(declare-fun b!1044094 () Bool)

(assert (=> b!1044094 (= e!591584 call!44264)))

(declare-fun b!1044095 () Bool)

(assert (=> b!1044095 (= e!591585 (contains!6085 Nil!21967 (select (arr!31639 lt!460075) #b00000000000000000000000000000000)))))

(declare-fun b!1044096 () Bool)

(assert (=> b!1044096 (= e!591583 e!591584)))

(assert (=> b!1044096 (= c!106290 (validKeyInArray!0 (select (arr!31639 lt!460075) #b00000000000000000000000000000000)))))

(assert (= (and d!126623 (not res!695277)) b!1044092))

(assert (= (and b!1044092 res!695279) b!1044095))

(assert (= (and b!1044092 res!695278) b!1044096))

(assert (= (and b!1044096 c!106290) b!1044094))

(assert (= (and b!1044096 (not c!106290)) b!1044093))

(assert (= (or b!1044094 b!1044093) bm!44261))

(assert (=> bm!44261 m!963721))

(declare-fun m!963733 () Bool)

(assert (=> bm!44261 m!963733))

(assert (=> b!1044092 m!963721))

(assert (=> b!1044092 m!963721))

(assert (=> b!1044092 m!963729))

(assert (=> b!1044095 m!963721))

(assert (=> b!1044095 m!963721))

(declare-fun m!963735 () Bool)

(assert (=> b!1044095 m!963735))

(assert (=> b!1044096 m!963721))

(assert (=> b!1044096 m!963721))

(assert (=> b!1044096 m!963729))

(assert (=> b!1043963 d!126623))

(declare-fun d!126625 () Bool)

(declare-fun e!591589 () Bool)

(assert (=> d!126625 e!591589))

(declare-fun res!695282 () Bool)

(assert (=> d!126625 (=> (not res!695282) (not e!591589))))

(assert (=> d!126625 (= res!695282 (and (bvsge (index!41476 lt!460077) #b00000000000000000000000000000000) (bvslt (index!41476 lt!460077) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460146 () Unit!34065)

(declare-fun choose!53 (array!65779 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21970) Unit!34065)

(assert (=> d!126625 (= lt!460146 (choose!53 (_keys!11659 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41476 lt!460077) #b00000000000000000000000000000000 Nil!21967))))

(assert (=> d!126625 (bvslt (size!32175 (_keys!11659 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126625 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11659 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41476 lt!460077) #b00000000000000000000000000000000 Nil!21967) lt!460146)))

(declare-fun b!1044099 () Bool)

(assert (=> b!1044099 (= e!591589 (arrayNoDuplicates!0 (array!65780 (store (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000000 Nil!21967))))

(assert (= (and d!126625 res!695282) b!1044099))

(declare-fun m!963737 () Bool)

(assert (=> d!126625 m!963737))

(assert (=> b!1044099 m!963603))

(declare-fun m!963739 () Bool)

(assert (=> b!1044099 m!963739))

(assert (=> b!1043963 d!126625))

(declare-fun d!126627 () Bool)

(declare-fun res!695287 () Bool)

(declare-fun e!591594 () Bool)

(assert (=> d!126627 (=> res!695287 e!591594)))

(assert (=> d!126627 (= res!695287 (= (select (arr!31639 lt!460075) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126627 (= (arrayContainsKey!0 lt!460075 key!909 #b00000000000000000000000000000000) e!591594)))

(declare-fun b!1044104 () Bool)

(declare-fun e!591595 () Bool)

(assert (=> b!1044104 (= e!591594 e!591595)))

(declare-fun res!695288 () Bool)

(assert (=> b!1044104 (=> (not res!695288) (not e!591595))))

(assert (=> b!1044104 (= res!695288 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32175 lt!460075)))))

(declare-fun b!1044105 () Bool)

(assert (=> b!1044105 (= e!591595 (arrayContainsKey!0 lt!460075 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126627 (not res!695287)) b!1044104))

(assert (= (and b!1044104 res!695288) b!1044105))

(assert (=> d!126627 m!963721))

(declare-fun m!963741 () Bool)

(assert (=> b!1044105 m!963741))

(assert (=> b!1043963 d!126627))

(declare-fun b!1044115 () Bool)

(declare-fun res!695299 () Bool)

(declare-fun e!591601 () Bool)

(assert (=> b!1044115 (=> (not res!695299) (not e!591601))))

(assert (=> b!1044115 (= res!695299 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044116 () Bool)

(assert (=> b!1044116 (= e!591601 (bvslt (size!32175 (_keys!11659 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044114 () Bool)

(declare-fun res!695298 () Bool)

(assert (=> b!1044114 (=> (not res!695298) (not e!591601))))

(assert (=> b!1044114 (= res!695298 (validKeyInArray!0 (select (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460077))))))

(declare-fun d!126629 () Bool)

(declare-fun e!591600 () Bool)

(assert (=> d!126629 e!591600))

(declare-fun res!695300 () Bool)

(assert (=> d!126629 (=> (not res!695300) (not e!591600))))

(assert (=> d!126629 (= res!695300 (and (bvsge (index!41476 lt!460077) #b00000000000000000000000000000000) (bvslt (index!41476 lt!460077) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460149 () Unit!34065)

(declare-fun choose!82 (array!65779 (_ BitVec 32) (_ BitVec 64)) Unit!34065)

(assert (=> d!126629 (= lt!460149 (choose!82 (_keys!11659 thiss!1427) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126629 e!591601))

(declare-fun res!695297 () Bool)

(assert (=> d!126629 (=> (not res!695297) (not e!591601))))

(assert (=> d!126629 (= res!695297 (and (bvsge (index!41476 lt!460077) #b00000000000000000000000000000000) (bvslt (index!41476 lt!460077) (size!32175 (_keys!11659 thiss!1427)))))))

(assert (=> d!126629 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11659 thiss!1427) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460149)))

(declare-fun b!1044117 () Bool)

(assert (=> b!1044117 (= e!591600 (= (arrayCountValidKeys!0 (array!65780 (store (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126629 res!695297) b!1044114))

(assert (= (and b!1044114 res!695298) b!1044115))

(assert (= (and b!1044115 res!695299) b!1044116))

(assert (= (and d!126629 res!695300) b!1044117))

(declare-fun m!963743 () Bool)

(assert (=> b!1044115 m!963743))

(declare-fun m!963745 () Bool)

(assert (=> b!1044114 m!963745))

(assert (=> b!1044114 m!963745))

(declare-fun m!963747 () Bool)

(assert (=> b!1044114 m!963747))

(declare-fun m!963749 () Bool)

(assert (=> d!126629 m!963749))

(assert (=> b!1044117 m!963603))

(declare-fun m!963751 () Bool)

(assert (=> b!1044117 m!963751))

(assert (=> b!1044117 m!963605))

(assert (=> b!1043963 d!126629))

(declare-fun d!126631 () Bool)

(assert (=> d!126631 (= (validMask!0 (mask!30498 thiss!1427)) (and (or (= (mask!30498 thiss!1427) #b00000000000000000000000000000111) (= (mask!30498 thiss!1427) #b00000000000000000000000000001111) (= (mask!30498 thiss!1427) #b00000000000000000000000000011111) (= (mask!30498 thiss!1427) #b00000000000000000000000000111111) (= (mask!30498 thiss!1427) #b00000000000000000000000001111111) (= (mask!30498 thiss!1427) #b00000000000000000000000011111111) (= (mask!30498 thiss!1427) #b00000000000000000000000111111111) (= (mask!30498 thiss!1427) #b00000000000000000000001111111111) (= (mask!30498 thiss!1427) #b00000000000000000000011111111111) (= (mask!30498 thiss!1427) #b00000000000000000000111111111111) (= (mask!30498 thiss!1427) #b00000000000000000001111111111111) (= (mask!30498 thiss!1427) #b00000000000000000011111111111111) (= (mask!30498 thiss!1427) #b00000000000000000111111111111111) (= (mask!30498 thiss!1427) #b00000000000000001111111111111111) (= (mask!30498 thiss!1427) #b00000000000000011111111111111111) (= (mask!30498 thiss!1427) #b00000000000000111111111111111111) (= (mask!30498 thiss!1427) #b00000000000001111111111111111111) (= (mask!30498 thiss!1427) #b00000000000011111111111111111111) (= (mask!30498 thiss!1427) #b00000000000111111111111111111111) (= (mask!30498 thiss!1427) #b00000000001111111111111111111111) (= (mask!30498 thiss!1427) #b00000000011111111111111111111111) (= (mask!30498 thiss!1427) #b00000000111111111111111111111111) (= (mask!30498 thiss!1427) #b00000001111111111111111111111111) (= (mask!30498 thiss!1427) #b00000011111111111111111111111111) (= (mask!30498 thiss!1427) #b00000111111111111111111111111111) (= (mask!30498 thiss!1427) #b00001111111111111111111111111111) (= (mask!30498 thiss!1427) #b00011111111111111111111111111111) (= (mask!30498 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30498 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1043963 d!126631))

(declare-fun b!1044118 () Bool)

(declare-fun e!591603 () (_ BitVec 32))

(declare-fun call!44265 () (_ BitVec 32))

(assert (=> b!1044118 (= e!591603 call!44265)))

(declare-fun d!126633 () Bool)

(declare-fun lt!460150 () (_ BitVec 32))

(assert (=> d!126633 (and (bvsge lt!460150 #b00000000000000000000000000000000) (bvsle lt!460150 (bvsub (size!32175 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!591602 () (_ BitVec 32))

(assert (=> d!126633 (= lt!460150 e!591602)))

(declare-fun c!106292 () Bool)

(assert (=> d!126633 (= c!106292 (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126633 (and (bvsle #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32175 (_keys!11659 thiss!1427)) (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126633 (= (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) lt!460150)))

(declare-fun bm!44262 () Bool)

(assert (=> bm!44262 (= call!44265 (arrayCountValidKeys!0 (_keys!11659 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun b!1044119 () Bool)

(assert (=> b!1044119 (= e!591603 (bvadd #b00000000000000000000000000000001 call!44265))))

(declare-fun b!1044120 () Bool)

(assert (=> b!1044120 (= e!591602 e!591603)))

(declare-fun c!106291 () Bool)

(assert (=> b!1044120 (= c!106291 (validKeyInArray!0 (select (arr!31639 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044121 () Bool)

(assert (=> b!1044121 (= e!591602 #b00000000000000000000000000000000)))

(assert (= (and d!126633 c!106292) b!1044121))

(assert (= (and d!126633 (not c!106292)) b!1044120))

(assert (= (and b!1044120 c!106291) b!1044119))

(assert (= (and b!1044120 (not c!106291)) b!1044118))

(assert (= (or b!1044119 b!1044118) bm!44262))

(declare-fun m!963753 () Bool)

(assert (=> bm!44262 m!963753))

(assert (=> b!1044120 m!963693))

(assert (=> b!1044120 m!963693))

(assert (=> b!1044120 m!963697))

(assert (=> b!1043963 d!126633))

(declare-fun d!126635 () Bool)

(declare-fun e!591606 () Bool)

(assert (=> d!126635 e!591606))

(declare-fun res!695303 () Bool)

(assert (=> d!126635 (=> (not res!695303) (not e!591606))))

(assert (=> d!126635 (= res!695303 (and (bvsge (index!41476 lt!460077) #b00000000000000000000000000000000) (bvslt (index!41476 lt!460077) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460153 () Unit!34065)

(declare-fun choose!25 (array!65779 (_ BitVec 32) (_ BitVec 32)) Unit!34065)

(assert (=> d!126635 (= lt!460153 (choose!25 (_keys!11659 thiss!1427) (index!41476 lt!460077) (mask!30498 thiss!1427)))))

(assert (=> d!126635 (validMask!0 (mask!30498 thiss!1427))))

(assert (=> d!126635 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11659 thiss!1427) (index!41476 lt!460077) (mask!30498 thiss!1427)) lt!460153)))

(declare-fun b!1044124 () Bool)

(assert (=> b!1044124 (= e!591606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65780 (store (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) (mask!30498 thiss!1427)))))

(assert (= (and d!126635 res!695303) b!1044124))

(declare-fun m!963755 () Bool)

(assert (=> d!126635 m!963755))

(assert (=> d!126635 m!963599))

(assert (=> b!1044124 m!963603))

(declare-fun m!963757 () Bool)

(assert (=> b!1044124 m!963757))

(assert (=> b!1043963 d!126635))

(declare-fun d!126637 () Bool)

(declare-fun e!591609 () Bool)

(assert (=> d!126637 e!591609))

(declare-fun res!695306 () Bool)

(assert (=> d!126637 (=> (not res!695306) (not e!591609))))

(assert (=> d!126637 (= res!695306 (bvslt (index!41476 lt!460077) (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun lt!460156 () Unit!34065)

(declare-fun choose!121 (array!65779 (_ BitVec 32) (_ BitVec 64)) Unit!34065)

(assert (=> d!126637 (= lt!460156 (choose!121 (_keys!11659 thiss!1427) (index!41476 lt!460077) key!909))))

(assert (=> d!126637 (bvsge (index!41476 lt!460077) #b00000000000000000000000000000000)))

(assert (=> d!126637 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11659 thiss!1427) (index!41476 lt!460077) key!909) lt!460156)))

(declare-fun b!1044127 () Bool)

(assert (=> b!1044127 (= e!591609 (not (arrayContainsKey!0 (array!65780 (store (arr!31639 (_keys!11659 thiss!1427)) (index!41476 lt!460077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126637 res!695306) b!1044127))

(declare-fun m!963759 () Bool)

(assert (=> d!126637 m!963759))

(assert (=> b!1044127 m!963603))

(declare-fun m!963761 () Bool)

(assert (=> b!1044127 m!963761))

(assert (=> b!1043963 d!126637))

(declare-fun d!126639 () Bool)

(assert (=> d!126639 (= (array_inv!24457 (_keys!11659 thiss!1427)) (bvsge (size!32175 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043954 d!126639))

(declare-fun d!126641 () Bool)

(assert (=> d!126641 (= (array_inv!24458 (_values!6392 thiss!1427)) (bvsge (size!32176 (_values!6392 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043954 d!126641))

(declare-fun d!126643 () Bool)

(declare-fun res!695313 () Bool)

(declare-fun e!591612 () Bool)

(assert (=> d!126643 (=> (not res!695313) (not e!591612))))

(declare-fun simpleValid!443 (LongMapFixedSize!5974) Bool)

(assert (=> d!126643 (= res!695313 (simpleValid!443 thiss!1427))))

(assert (=> d!126643 (= (valid!2250 thiss!1427) e!591612)))

(declare-fun b!1044134 () Bool)

(declare-fun res!695314 () Bool)

(assert (=> b!1044134 (=> (not res!695314) (not e!591612))))

(assert (=> b!1044134 (= res!695314 (= (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (_size!3042 thiss!1427)))))

(declare-fun b!1044135 () Bool)

(declare-fun res!695315 () Bool)

(assert (=> b!1044135 (=> (not res!695315) (not e!591612))))

(assert (=> b!1044135 (= res!695315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11659 thiss!1427) (mask!30498 thiss!1427)))))

(declare-fun b!1044136 () Bool)

(assert (=> b!1044136 (= e!591612 (arrayNoDuplicates!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 Nil!21967))))

(assert (= (and d!126643 res!695313) b!1044134))

(assert (= (and b!1044134 res!695314) b!1044135))

(assert (= (and b!1044135 res!695315) b!1044136))

(declare-fun m!963763 () Bool)

(assert (=> d!126643 m!963763))

(assert (=> b!1044134 m!963605))

(assert (=> b!1044135 m!963589))

(assert (=> b!1044136 m!963585))

(assert (=> start!91782 d!126643))

(declare-fun b!1044144 () Bool)

(declare-fun e!591618 () Bool)

(assert (=> b!1044144 (= e!591618 tp_is_empty!24787)))

(declare-fun b!1044143 () Bool)

(declare-fun e!591617 () Bool)

(assert (=> b!1044143 (= e!591617 tp_is_empty!24787)))

(declare-fun mapNonEmpty!38801 () Bool)

(declare-fun mapRes!38801 () Bool)

(declare-fun tp!74445 () Bool)

(assert (=> mapNonEmpty!38801 (= mapRes!38801 (and tp!74445 e!591617))))

(declare-fun mapRest!38801 () (Array (_ BitVec 32) ValueCell!11690))

(declare-fun mapKey!38801 () (_ BitVec 32))

(declare-fun mapValue!38801 () ValueCell!11690)

(assert (=> mapNonEmpty!38801 (= mapRest!38792 (store mapRest!38801 mapKey!38801 mapValue!38801))))

(declare-fun condMapEmpty!38801 () Bool)

(declare-fun mapDefault!38801 () ValueCell!11690)

(assert (=> mapNonEmpty!38792 (= condMapEmpty!38801 (= mapRest!38792 ((as const (Array (_ BitVec 32) ValueCell!11690)) mapDefault!38801)))))

(assert (=> mapNonEmpty!38792 (= tp!74430 (and e!591618 mapRes!38801))))

(declare-fun mapIsEmpty!38801 () Bool)

(assert (=> mapIsEmpty!38801 mapRes!38801))

(assert (= (and mapNonEmpty!38792 condMapEmpty!38801) mapIsEmpty!38801))

(assert (= (and mapNonEmpty!38792 (not condMapEmpty!38801)) mapNonEmpty!38801))

(assert (= (and mapNonEmpty!38801 ((_ is ValueCellFull!11690) mapValue!38801)) b!1044143))

(assert (= (and mapNonEmpty!38792 ((_ is ValueCellFull!11690) mapDefault!38801)) b!1044144))

(declare-fun m!963765 () Bool)

(assert (=> mapNonEmpty!38801 m!963765))

(check-sat (not b!1044124) (not mapNonEmpty!38801) (not b!1044127) (not b!1044117) (not d!126635) b_and!33609 (not b!1044045) (not d!126629) (not b!1044073) (not b!1044115) (not d!126643) (not bm!44256) (not b!1044114) (not b!1044057) (not d!126617) (not b!1044105) (not b!1044078) (not d!126625) (not b!1044056) (not b!1044120) (not b!1044099) (not b!1044090) (not b!1044096) (not b!1044044) (not bm!44260) (not b!1044041) (not b!1044136) (not bm!44257) (not b!1044092) (not b!1044095) (not bm!44261) (not d!126637) (not bm!44262) (not b!1044079) (not b!1044134) tp_is_empty!24787 (not b_next!21067) (not bm!44253) (not b!1044135))
(check-sat b_and!33609 (not b_next!21067))
