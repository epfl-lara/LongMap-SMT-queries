; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22142 () Bool)

(assert start!22142)

(declare-fun b!230681 () Bool)

(declare-fun b_free!6205 () Bool)

(declare-fun b_next!6205 () Bool)

(assert (=> b!230681 (= b_free!6205 (not b_next!6205))))

(declare-fun tp!21757 () Bool)

(declare-fun b_and!13077 () Bool)

(assert (=> b!230681 (= tp!21757 b_and!13077)))

(declare-fun b!230673 () Bool)

(declare-fun res!113395 () Bool)

(declare-fun e!149719 () Bool)

(assert (=> b!230673 (=> (not res!113395) (not e!149719))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!230673 (= res!113395 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230674 () Bool)

(declare-fun c!38299 () Bool)

(declare-datatypes ((SeekEntryResult!941 0))(
  ( (MissingZero!941 (index!5934 (_ BitVec 32))) (Found!941 (index!5935 (_ BitVec 32))) (Intermediate!941 (undefined!1753 Bool) (index!5936 (_ BitVec 32)) (x!23464 (_ BitVec 32))) (Undefined!941) (MissingVacant!941 (index!5937 (_ BitVec 32))) )
))
(declare-fun lt!116063 () SeekEntryResult!941)

(get-info :version)

(assert (=> b!230674 (= c!38299 ((_ is MissingVacant!941) lt!116063))))

(declare-fun e!149715 () Bool)

(declare-fun e!149709 () Bool)

(assert (=> b!230674 (= e!149715 e!149709)))

(declare-fun mapIsEmpty!10270 () Bool)

(declare-fun mapRes!10270 () Bool)

(assert (=> mapIsEmpty!10270 mapRes!10270))

(declare-fun b!230675 () Bool)

(declare-fun e!149716 () Bool)

(declare-fun e!149710 () Bool)

(assert (=> b!230675 (= e!149716 e!149710)))

(declare-fun res!113397 () Bool)

(assert (=> b!230675 (=> (not res!113397) (not e!149710))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7737 0))(
  ( (V!7738 (val!3078 Int)) )
))
(declare-datatypes ((ValueCell!2690 0))(
  ( (ValueCellFull!2690 (v!5092 V!7737)) (EmptyCell!2690) )
))
(declare-datatypes ((array!11369 0))(
  ( (array!11370 (arr!5403 (Array (_ BitVec 32) ValueCell!2690)) (size!5737 (_ BitVec 32))) )
))
(declare-datatypes ((array!11371 0))(
  ( (array!11372 (arr!5404 (Array (_ BitVec 32) (_ BitVec 64))) (size!5738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3280 0))(
  ( (LongMapFixedSize!3281 (defaultEntry!4299 Int) (mask!10194 (_ BitVec 32)) (extraKeys!4036 (_ BitVec 32)) (zeroValue!4140 V!7737) (minValue!4140 V!7737) (_size!1689 (_ BitVec 32)) (_keys!6352 array!11371) (_values!4282 array!11369) (_vacant!1689 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3280)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230675 (= res!113397 (inRange!0 index!297 (mask!10194 thiss!1504)))))

(declare-datatypes ((Unit!7051 0))(
  ( (Unit!7052) )
))
(declare-fun lt!116057 () Unit!7051)

(declare-fun e!149711 () Unit!7051)

(assert (=> b!230675 (= lt!116057 e!149711)))

(declare-fun c!38300 () Bool)

(declare-datatypes ((tuple2!4510 0))(
  ( (tuple2!4511 (_1!2266 (_ BitVec 64)) (_2!2266 V!7737)) )
))
(declare-datatypes ((List!3448 0))(
  ( (Nil!3445) (Cons!3444 (h!4092 tuple2!4510) (t!8398 List!3448)) )
))
(declare-datatypes ((ListLongMap!3413 0))(
  ( (ListLongMap!3414 (toList!1722 List!3448)) )
))
(declare-fun lt!116054 () ListLongMap!3413)

(declare-fun contains!1597 (ListLongMap!3413 (_ BitVec 64)) Bool)

(assert (=> b!230675 (= c!38300 (contains!1597 lt!116054 key!932))))

(declare-fun getCurrentListMap!1231 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 32) Int) ListLongMap!3413)

(assert (=> b!230675 (= lt!116054 (getCurrentListMap!1231 (_keys!6352 thiss!1504) (_values!4282 thiss!1504) (mask!10194 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(declare-fun b!230676 () Bool)

(declare-fun res!113396 () Bool)

(declare-fun e!149718 () Bool)

(assert (=> b!230676 (=> (not res!113396) (not e!149718))))

(assert (=> b!230676 (= res!113396 (= (select (arr!5404 (_keys!6352 thiss!1504)) (index!5934 lt!116063)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230677 () Bool)

(assert (=> b!230677 (= e!149709 ((_ is Undefined!941) lt!116063))))

(declare-fun b!230678 () Bool)

(declare-fun e!149721 () Bool)

(declare-fun e!149720 () Bool)

(assert (=> b!230678 (= e!149721 (and e!149720 mapRes!10270))))

(declare-fun condMapEmpty!10270 () Bool)

(declare-fun mapDefault!10270 () ValueCell!2690)

(assert (=> b!230678 (= condMapEmpty!10270 (= (arr!5403 (_values!4282 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2690)) mapDefault!10270)))))

(declare-fun b!230679 () Bool)

(declare-fun e!149708 () Bool)

(assert (=> b!230679 (= e!149709 e!149708)))

(declare-fun res!113402 () Bool)

(declare-fun call!21426 () Bool)

(assert (=> b!230679 (= res!113402 call!21426)))

(assert (=> b!230679 (=> (not res!113402) (not e!149708))))

(declare-fun b!230680 () Bool)

(declare-fun e!149713 () Bool)

(declare-fun tp_is_empty!6067 () Bool)

(assert (=> b!230680 (= e!149713 tp_is_empty!6067)))

(declare-fun e!149717 () Bool)

(declare-fun array_inv!3569 (array!11371) Bool)

(declare-fun array_inv!3570 (array!11369) Bool)

(assert (=> b!230681 (= e!149717 (and tp!21757 tp_is_empty!6067 (array_inv!3569 (_keys!6352 thiss!1504)) (array_inv!3570 (_values!4282 thiss!1504)) e!149721))))

(declare-fun b!230682 () Bool)

(assert (=> b!230682 (= e!149710 (not true))))

(declare-fun lt!116058 () array!11371)

(declare-fun arrayCountValidKeys!0 (array!11371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230682 (= (arrayCountValidKeys!0 lt!116058 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116056 () Unit!7051)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11371 (_ BitVec 32)) Unit!7051)

(assert (=> b!230682 (= lt!116056 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116058 index!297))))

(declare-fun arrayContainsKey!0 (array!11371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230682 (arrayContainsKey!0 lt!116058 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116064 () Unit!7051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11371 (_ BitVec 64) (_ BitVec 32)) Unit!7051)

(assert (=> b!230682 (= lt!116064 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116058 key!932 index!297))))

(declare-fun v!346 () V!7737)

(declare-fun +!608 (ListLongMap!3413 tuple2!4510) ListLongMap!3413)

(assert (=> b!230682 (= (+!608 lt!116054 (tuple2!4511 key!932 v!346)) (getCurrentListMap!1231 lt!116058 (array!11370 (store (arr!5403 (_values!4282 thiss!1504)) index!297 (ValueCellFull!2690 v!346)) (size!5737 (_values!4282 thiss!1504))) (mask!10194 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(declare-fun lt!116061 () Unit!7051)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!63 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 32) (_ BitVec 64) V!7737 Int) Unit!7051)

(assert (=> b!230682 (= lt!116061 (lemmaAddValidKeyToArrayThenAddPairToListMap!63 (_keys!6352 thiss!1504) (_values!4282 thiss!1504) (mask!10194 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) index!297 key!932 v!346 (defaultEntry!4299 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11371 (_ BitVec 32)) Bool)

(assert (=> b!230682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116058 (mask!10194 thiss!1504))))

(declare-fun lt!116059 () Unit!7051)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11371 (_ BitVec 32) (_ BitVec 32)) Unit!7051)

(assert (=> b!230682 (= lt!116059 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6352 thiss!1504) index!297 (mask!10194 thiss!1504)))))

(assert (=> b!230682 (= (arrayCountValidKeys!0 lt!116058 #b00000000000000000000000000000000 (size!5738 (_keys!6352 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6352 thiss!1504) #b00000000000000000000000000000000 (size!5738 (_keys!6352 thiss!1504)))))))

(declare-fun lt!116055 () Unit!7051)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11371 (_ BitVec 32) (_ BitVec 64)) Unit!7051)

(assert (=> b!230682 (= lt!116055 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6352 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3449 0))(
  ( (Nil!3446) (Cons!3445 (h!4093 (_ BitVec 64)) (t!8399 List!3449)) )
))
(declare-fun arrayNoDuplicates!0 (array!11371 (_ BitVec 32) List!3449) Bool)

(assert (=> b!230682 (arrayNoDuplicates!0 lt!116058 #b00000000000000000000000000000000 Nil!3446)))

(assert (=> b!230682 (= lt!116058 (array!11372 (store (arr!5404 (_keys!6352 thiss!1504)) index!297 key!932) (size!5738 (_keys!6352 thiss!1504))))))

(declare-fun lt!116052 () Unit!7051)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11371 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3449) Unit!7051)

(assert (=> b!230682 (= lt!116052 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6352 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3446))))

(declare-fun lt!116053 () Unit!7051)

(declare-fun e!149712 () Unit!7051)

(assert (=> b!230682 (= lt!116053 e!149712)))

(declare-fun c!38302 () Bool)

(assert (=> b!230682 (= c!38302 (arrayContainsKey!0 (_keys!6352 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230683 () Bool)

(assert (=> b!230683 (= e!149719 e!149716)))

(declare-fun res!113399 () Bool)

(assert (=> b!230683 (=> (not res!113399) (not e!149716))))

(assert (=> b!230683 (= res!113399 (or (= lt!116063 (MissingZero!941 index!297)) (= lt!116063 (MissingVacant!941 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11371 (_ BitVec 32)) SeekEntryResult!941)

(assert (=> b!230683 (= lt!116063 (seekEntryOrOpen!0 key!932 (_keys!6352 thiss!1504) (mask!10194 thiss!1504)))))

(declare-fun b!230684 () Bool)

(declare-fun res!113400 () Bool)

(assert (=> b!230684 (= res!113400 (= (select (arr!5404 (_keys!6352 thiss!1504)) (index!5937 lt!116063)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230684 (=> (not res!113400) (not e!149708))))

(declare-fun b!230685 () Bool)

(declare-fun Unit!7053 () Unit!7051)

(assert (=> b!230685 (= e!149712 Unit!7053)))

(declare-fun lt!116065 () Unit!7051)

(declare-fun lemmaArrayContainsKeyThenInListMap!136 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) (_ BitVec 32) Int) Unit!7051)

(assert (=> b!230685 (= lt!116065 (lemmaArrayContainsKeyThenInListMap!136 (_keys!6352 thiss!1504) (_values!4282 thiss!1504) (mask!10194 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230685 false))

(declare-fun b!230686 () Bool)

(assert (=> b!230686 (= e!149720 tp_is_empty!6067)))

(declare-fun res!113401 () Bool)

(assert (=> start!22142 (=> (not res!113401) (not e!149719))))

(declare-fun valid!1318 (LongMapFixedSize!3280) Bool)

(assert (=> start!22142 (= res!113401 (valid!1318 thiss!1504))))

(assert (=> start!22142 e!149719))

(assert (=> start!22142 e!149717))

(assert (=> start!22142 true))

(assert (=> start!22142 tp_is_empty!6067))

(declare-fun mapNonEmpty!10270 () Bool)

(declare-fun tp!21756 () Bool)

(assert (=> mapNonEmpty!10270 (= mapRes!10270 (and tp!21756 e!149713))))

(declare-fun mapValue!10270 () ValueCell!2690)

(declare-fun mapKey!10270 () (_ BitVec 32))

(declare-fun mapRest!10270 () (Array (_ BitVec 32) ValueCell!2690))

(assert (=> mapNonEmpty!10270 (= (arr!5403 (_values!4282 thiss!1504)) (store mapRest!10270 mapKey!10270 mapValue!10270))))

(declare-fun b!230687 () Bool)

(declare-fun call!21425 () Bool)

(assert (=> b!230687 (= e!149708 (not call!21425))))

(declare-fun b!230688 () Bool)

(assert (=> b!230688 (= e!149718 (not call!21425))))

(declare-fun b!230689 () Bool)

(declare-fun Unit!7054 () Unit!7051)

(assert (=> b!230689 (= e!149712 Unit!7054)))

(declare-fun bm!21422 () Bool)

(assert (=> bm!21422 (= call!21425 (arrayContainsKey!0 (_keys!6352 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230690 () Bool)

(declare-fun Unit!7055 () Unit!7051)

(assert (=> b!230690 (= e!149711 Unit!7055)))

(declare-fun lt!116062 () Unit!7051)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!295 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) Int) Unit!7051)

(assert (=> b!230690 (= lt!116062 (lemmaInListMapThenSeekEntryOrOpenFindsIt!295 (_keys!6352 thiss!1504) (_values!4282 thiss!1504) (mask!10194 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 (defaultEntry!4299 thiss!1504)))))

(assert (=> b!230690 false))

(declare-fun b!230691 () Bool)

(declare-fun lt!116060 () Unit!7051)

(assert (=> b!230691 (= e!149711 lt!116060)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!292 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7737 V!7737 (_ BitVec 64) Int) Unit!7051)

(assert (=> b!230691 (= lt!116060 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!292 (_keys!6352 thiss!1504) (_values!4282 thiss!1504) (mask!10194 thiss!1504) (extraKeys!4036 thiss!1504) (zeroValue!4140 thiss!1504) (minValue!4140 thiss!1504) key!932 (defaultEntry!4299 thiss!1504)))))

(declare-fun c!38301 () Bool)

(assert (=> b!230691 (= c!38301 ((_ is MissingZero!941) lt!116063))))

(assert (=> b!230691 e!149715))

(declare-fun b!230692 () Bool)

(declare-fun res!113398 () Bool)

(assert (=> b!230692 (=> (not res!113398) (not e!149718))))

(assert (=> b!230692 (= res!113398 call!21426)))

(assert (=> b!230692 (= e!149715 e!149718)))

(declare-fun bm!21423 () Bool)

(assert (=> bm!21423 (= call!21426 (inRange!0 (ite c!38301 (index!5934 lt!116063) (index!5937 lt!116063)) (mask!10194 thiss!1504)))))

(assert (= (and start!22142 res!113401) b!230673))

(assert (= (and b!230673 res!113395) b!230683))

(assert (= (and b!230683 res!113399) b!230675))

(assert (= (and b!230675 c!38300) b!230690))

(assert (= (and b!230675 (not c!38300)) b!230691))

(assert (= (and b!230691 c!38301) b!230692))

(assert (= (and b!230691 (not c!38301)) b!230674))

(assert (= (and b!230692 res!113398) b!230676))

(assert (= (and b!230676 res!113396) b!230688))

(assert (= (and b!230674 c!38299) b!230679))

(assert (= (and b!230674 (not c!38299)) b!230677))

(assert (= (and b!230679 res!113402) b!230684))

(assert (= (and b!230684 res!113400) b!230687))

(assert (= (or b!230692 b!230679) bm!21423))

(assert (= (or b!230688 b!230687) bm!21422))

(assert (= (and b!230675 res!113397) b!230682))

(assert (= (and b!230682 c!38302) b!230685))

(assert (= (and b!230682 (not c!38302)) b!230689))

(assert (= (and b!230678 condMapEmpty!10270) mapIsEmpty!10270))

(assert (= (and b!230678 (not condMapEmpty!10270)) mapNonEmpty!10270))

(assert (= (and mapNonEmpty!10270 ((_ is ValueCellFull!2690) mapValue!10270)) b!230680))

(assert (= (and b!230678 ((_ is ValueCellFull!2690) mapDefault!10270)) b!230686))

(assert (= b!230681 b!230678))

(assert (= start!22142 b!230681))

(declare-fun m!251575 () Bool)

(assert (=> start!22142 m!251575))

(declare-fun m!251577 () Bool)

(assert (=> b!230684 m!251577))

(declare-fun m!251579 () Bool)

(assert (=> bm!21423 m!251579))

(declare-fun m!251581 () Bool)

(assert (=> b!230690 m!251581))

(declare-fun m!251583 () Bool)

(assert (=> b!230676 m!251583))

(declare-fun m!251585 () Bool)

(assert (=> bm!21422 m!251585))

(declare-fun m!251587 () Bool)

(assert (=> b!230681 m!251587))

(declare-fun m!251589 () Bool)

(assert (=> b!230681 m!251589))

(declare-fun m!251591 () Bool)

(assert (=> b!230683 m!251591))

(declare-fun m!251593 () Bool)

(assert (=> b!230675 m!251593))

(declare-fun m!251595 () Bool)

(assert (=> b!230675 m!251595))

(declare-fun m!251597 () Bool)

(assert (=> b!230675 m!251597))

(declare-fun m!251599 () Bool)

(assert (=> b!230685 m!251599))

(declare-fun m!251601 () Bool)

(assert (=> b!230682 m!251601))

(declare-fun m!251603 () Bool)

(assert (=> b!230682 m!251603))

(declare-fun m!251605 () Bool)

(assert (=> b!230682 m!251605))

(declare-fun m!251607 () Bool)

(assert (=> b!230682 m!251607))

(declare-fun m!251609 () Bool)

(assert (=> b!230682 m!251609))

(declare-fun m!251611 () Bool)

(assert (=> b!230682 m!251611))

(declare-fun m!251613 () Bool)

(assert (=> b!230682 m!251613))

(declare-fun m!251615 () Bool)

(assert (=> b!230682 m!251615))

(declare-fun m!251617 () Bool)

(assert (=> b!230682 m!251617))

(declare-fun m!251619 () Bool)

(assert (=> b!230682 m!251619))

(declare-fun m!251621 () Bool)

(assert (=> b!230682 m!251621))

(assert (=> b!230682 m!251585))

(declare-fun m!251623 () Bool)

(assert (=> b!230682 m!251623))

(declare-fun m!251625 () Bool)

(assert (=> b!230682 m!251625))

(declare-fun m!251627 () Bool)

(assert (=> b!230682 m!251627))

(declare-fun m!251629 () Bool)

(assert (=> b!230682 m!251629))

(declare-fun m!251631 () Bool)

(assert (=> b!230682 m!251631))

(declare-fun m!251633 () Bool)

(assert (=> mapNonEmpty!10270 m!251633))

(declare-fun m!251635 () Bool)

(assert (=> b!230691 m!251635))

(check-sat (not b!230681) (not bm!21423) (not b!230682) (not b!230683) b_and!13077 (not start!22142) (not b!230691) (not mapNonEmpty!10270) (not b!230690) (not b!230685) (not b_next!6205) (not bm!21422) tp_is_empty!6067 (not b!230675))
(check-sat b_and!13077 (not b_next!6205))
