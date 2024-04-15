; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23622 () Bool)

(assert start!23622)

(declare-fun b!248103 () Bool)

(declare-fun b_free!6601 () Bool)

(declare-fun b_next!6601 () Bool)

(assert (=> b!248103 (= b_free!6601 (not b_next!6601))))

(declare-fun tp!23054 () Bool)

(declare-fun b_and!13579 () Bool)

(assert (=> b!248103 (= tp!23054 b_and!13579)))

(declare-fun b!248082 () Bool)

(declare-fun e!160921 () Bool)

(declare-fun e!160926 () Bool)

(assert (=> b!248082 (= e!160921 (not e!160926))))

(declare-fun res!121557 () Bool)

(assert (=> b!248082 (=> res!121557 e!160926)))

(declare-datatypes ((V!8265 0))(
  ( (V!8266 (val!3276 Int)) )
))
(declare-datatypes ((ValueCell!2888 0))(
  ( (ValueCellFull!2888 (v!5329 V!8265)) (EmptyCell!2888) )
))
(declare-datatypes ((array!12227 0))(
  ( (array!12228 (arr!5799 (Array (_ BitVec 32) ValueCell!2888)) (size!6143 (_ BitVec 32))) )
))
(declare-datatypes ((array!12229 0))(
  ( (array!12230 (arr!5800 (Array (_ BitVec 32) (_ BitVec 64))) (size!6144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3676 0))(
  ( (LongMapFixedSize!3677 (defaultEntry!4591 Int) (mask!10738 (_ BitVec 32)) (extraKeys!4328 (_ BitVec 32)) (zeroValue!4432 V!8265) (minValue!4432 V!8265) (_size!1887 (_ BitVec 32)) (_keys!6714 array!12229) (_values!4574 array!12227) (_vacant!1887 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3676)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248082 (= res!121557 (not (validMask!0 (mask!10738 thiss!1504))))))

(declare-fun lt!124124 () array!12229)

(declare-fun arrayCountValidKeys!0 (array!12229 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248082 (= (arrayCountValidKeys!0 lt!124124 #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!7668 0))(
  ( (Unit!7669) )
))
(declare-fun lt!124127 () Unit!7668)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12229 (_ BitVec 32) (_ BitVec 64)) Unit!7668)

(assert (=> b!248082 (= lt!124127 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6714 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3688 0))(
  ( (Nil!3685) (Cons!3684 (h!4342 (_ BitVec 64)) (t!8704 List!3688)) )
))
(declare-fun arrayNoDuplicates!0 (array!12229 (_ BitVec 32) List!3688) Bool)

(assert (=> b!248082 (arrayNoDuplicates!0 lt!124124 #b00000000000000000000000000000000 Nil!3685)))

(assert (=> b!248082 (= lt!124124 (array!12230 (store (arr!5800 (_keys!6714 thiss!1504)) index!297 key!932) (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun lt!124128 () Unit!7668)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3688) Unit!7668)

(assert (=> b!248082 (= lt!124128 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6714 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3685))))

(declare-fun lt!124125 () Unit!7668)

(declare-fun e!160927 () Unit!7668)

(assert (=> b!248082 (= lt!124125 e!160927)))

(declare-fun c!41557 () Bool)

(declare-fun lt!124129 () Bool)

(assert (=> b!248082 (= c!41557 lt!124129)))

(declare-fun arrayContainsKey!0 (array!12229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!248082 (= lt!124129 (arrayContainsKey!0 (_keys!6714 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10973 () Bool)

(declare-fun mapRes!10973 () Bool)

(assert (=> mapIsEmpty!10973 mapRes!10973))

(declare-fun b!248083 () Bool)

(declare-fun e!160928 () Bool)

(declare-fun e!160923 () Bool)

(assert (=> b!248083 (= e!160928 (and e!160923 mapRes!10973))))

(declare-fun condMapEmpty!10973 () Bool)

(declare-fun mapDefault!10973 () ValueCell!2888)

(assert (=> b!248083 (= condMapEmpty!10973 (= (arr!5799 (_values!4574 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2888)) mapDefault!10973)))))

(declare-fun b!248084 () Bool)

(declare-fun res!121559 () Bool)

(assert (=> b!248084 (=> res!121559 e!160926)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248084 (= res!121559 (not (validKeyInArray!0 key!932)))))

(declare-fun res!121567 () Bool)

(declare-fun e!160916 () Bool)

(assert (=> start!23622 (=> (not res!121567) (not e!160916))))

(declare-fun valid!1445 (LongMapFixedSize!3676) Bool)

(assert (=> start!23622 (= res!121567 (valid!1445 thiss!1504))))

(assert (=> start!23622 e!160916))

(declare-fun e!160929 () Bool)

(assert (=> start!23622 e!160929))

(assert (=> start!23622 true))

(declare-fun b!248085 () Bool)

(declare-fun e!160920 () Bool)

(declare-fun e!160922 () Bool)

(assert (=> b!248085 (= e!160920 e!160922)))

(declare-fun res!121568 () Bool)

(declare-fun call!23238 () Bool)

(assert (=> b!248085 (= res!121568 call!23238)))

(assert (=> b!248085 (=> (not res!121568) (not e!160922))))

(declare-fun b!248086 () Bool)

(declare-fun e!160918 () Bool)

(declare-fun call!23237 () Bool)

(assert (=> b!248086 (= e!160918 (not call!23237))))

(declare-fun b!248087 () Bool)

(declare-fun res!121558 () Bool)

(assert (=> b!248087 (=> res!121558 e!160926)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12229 (_ BitVec 32)) Bool)

(assert (=> b!248087 (= res!121558 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6714 thiss!1504) (mask!10738 thiss!1504))))))

(declare-fun b!248088 () Bool)

(declare-fun res!121560 () Bool)

(declare-datatypes ((SeekEntryResult!1107 0))(
  ( (MissingZero!1107 (index!6598 (_ BitVec 32))) (Found!1107 (index!6599 (_ BitVec 32))) (Intermediate!1107 (undefined!1919 Bool) (index!6600 (_ BitVec 32)) (x!24568 (_ BitVec 32))) (Undefined!1107) (MissingVacant!1107 (index!6601 (_ BitVec 32))) )
))
(declare-fun lt!124131 () SeekEntryResult!1107)

(assert (=> b!248088 (= res!121560 (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6601 lt!124131)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248088 (=> (not res!121560) (not e!160922))))

(declare-fun c!41555 () Bool)

(declare-fun bm!23234 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23234 (= call!23238 (inRange!0 (ite c!41555 (index!6598 lt!124131) (index!6601 lt!124131)) (mask!10738 thiss!1504)))))

(declare-fun b!248089 () Bool)

(declare-fun res!121564 () Bool)

(assert (=> b!248089 (=> (not res!121564) (not e!160918))))

(assert (=> b!248089 (= res!121564 (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6598 lt!124131)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248090 () Bool)

(declare-fun e!160925 () Bool)

(assert (=> b!248090 (= e!160925 e!160921)))

(declare-fun res!121563 () Bool)

(assert (=> b!248090 (=> (not res!121563) (not e!160921))))

(assert (=> b!248090 (= res!121563 (inRange!0 index!297 (mask!10738 thiss!1504)))))

(declare-fun lt!124126 () Unit!7668)

(declare-fun e!160915 () Unit!7668)

(assert (=> b!248090 (= lt!124126 e!160915)))

(declare-fun c!41558 () Bool)

(declare-datatypes ((tuple2!4786 0))(
  ( (tuple2!4787 (_1!2404 (_ BitVec 64)) (_2!2404 V!8265)) )
))
(declare-datatypes ((List!3689 0))(
  ( (Nil!3686) (Cons!3685 (h!4343 tuple2!4786) (t!8705 List!3689)) )
))
(declare-datatypes ((ListLongMap!3689 0))(
  ( (ListLongMap!3690 (toList!1860 List!3689)) )
))
(declare-fun contains!1780 (ListLongMap!3689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1369 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 32) Int) ListLongMap!3689)

(assert (=> b!248090 (= c!41558 (contains!1780 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) key!932))))

(declare-fun b!248091 () Bool)

(declare-fun res!121565 () Bool)

(assert (=> b!248091 (=> res!121565 e!160926)))

(assert (=> b!248091 (= res!121565 (or (not (= (size!6144 (_keys!6714 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10738 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6144 (_keys!6714 thiss!1504)))))))

(declare-fun b!248092 () Bool)

(get-info :version)

(assert (=> b!248092 (= e!160920 ((_ is Undefined!1107) lt!124131))))

(declare-fun b!248093 () Bool)

(assert (=> b!248093 (= e!160922 (not call!23237))))

(declare-fun b!248094 () Bool)

(declare-fun c!41556 () Bool)

(assert (=> b!248094 (= c!41556 ((_ is MissingVacant!1107) lt!124131))))

(declare-fun e!160924 () Bool)

(assert (=> b!248094 (= e!160924 e!160920)))

(declare-fun b!248095 () Bool)

(declare-fun tp_is_empty!6463 () Bool)

(assert (=> b!248095 (= e!160923 tp_is_empty!6463)))

(declare-fun b!248096 () Bool)

(declare-fun Unit!7670 () Unit!7668)

(assert (=> b!248096 (= e!160915 Unit!7670)))

(declare-fun lt!124130 () Unit!7668)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!391 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7668)

(assert (=> b!248096 (= lt!124130 (lemmaInListMapThenSeekEntryOrOpenFindsIt!391 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248096 false))

(declare-fun b!248097 () Bool)

(declare-fun res!121556 () Bool)

(assert (=> b!248097 (=> (not res!121556) (not e!160916))))

(assert (=> b!248097 (= res!121556 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!248098 () Bool)

(declare-fun res!121566 () Bool)

(assert (=> b!248098 (=> res!121566 e!160926)))

(assert (=> b!248098 (= res!121566 lt!124129)))

(declare-fun bm!23235 () Bool)

(assert (=> bm!23235 (= call!23237 (arrayContainsKey!0 (_keys!6714 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248099 () Bool)

(declare-fun res!121562 () Bool)

(assert (=> b!248099 (=> (not res!121562) (not e!160918))))

(assert (=> b!248099 (= res!121562 call!23238)))

(assert (=> b!248099 (= e!160924 e!160918)))

(declare-fun b!248100 () Bool)

(declare-fun Unit!7671 () Unit!7668)

(assert (=> b!248100 (= e!160927 Unit!7671)))

(declare-fun b!248101 () Bool)

(assert (=> b!248101 (= e!160916 e!160925)))

(declare-fun res!121561 () Bool)

(assert (=> b!248101 (=> (not res!121561) (not e!160925))))

(assert (=> b!248101 (= res!121561 (or (= lt!124131 (MissingZero!1107 index!297)) (= lt!124131 (MissingVacant!1107 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12229 (_ BitVec 32)) SeekEntryResult!1107)

(assert (=> b!248101 (= lt!124131 (seekEntryOrOpen!0 key!932 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(declare-fun b!248102 () Bool)

(declare-fun Unit!7672 () Unit!7668)

(assert (=> b!248102 (= e!160927 Unit!7672)))

(declare-fun lt!124123 () Unit!7668)

(declare-fun lemmaArrayContainsKeyThenInListMap!200 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) (_ BitVec 32) Int) Unit!7668)

(assert (=> b!248102 (= lt!124123 (lemmaArrayContainsKeyThenInListMap!200 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248102 false))

(declare-fun array_inv!3825 (array!12229) Bool)

(declare-fun array_inv!3826 (array!12227) Bool)

(assert (=> b!248103 (= e!160929 (and tp!23054 tp_is_empty!6463 (array_inv!3825 (_keys!6714 thiss!1504)) (array_inv!3826 (_values!4574 thiss!1504)) e!160928))))

(declare-fun b!248104 () Bool)

(declare-fun e!160919 () Bool)

(assert (=> b!248104 (= e!160919 tp_is_empty!6463)))

(declare-fun mapNonEmpty!10973 () Bool)

(declare-fun tp!23053 () Bool)

(assert (=> mapNonEmpty!10973 (= mapRes!10973 (and tp!23053 e!160919))))

(declare-fun mapKey!10973 () (_ BitVec 32))

(declare-fun mapRest!10973 () (Array (_ BitVec 32) ValueCell!2888))

(declare-fun mapValue!10973 () ValueCell!2888)

(assert (=> mapNonEmpty!10973 (= (arr!5799 (_values!4574 thiss!1504)) (store mapRest!10973 mapKey!10973 mapValue!10973))))

(declare-fun b!248105 () Bool)

(declare-fun lt!124122 () Unit!7668)

(assert (=> b!248105 (= e!160915 lt!124122)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7668)

(assert (=> b!248105 (= lt!124122 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248105 (= c!41555 ((_ is MissingZero!1107) lt!124131))))

(assert (=> b!248105 e!160924))

(declare-fun b!248106 () Bool)

(assert (=> b!248106 (= e!160926 (arrayNoDuplicates!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 Nil!3685))))

(assert (= (and start!23622 res!121567) b!248097))

(assert (= (and b!248097 res!121556) b!248101))

(assert (= (and b!248101 res!121561) b!248090))

(assert (= (and b!248090 c!41558) b!248096))

(assert (= (and b!248090 (not c!41558)) b!248105))

(assert (= (and b!248105 c!41555) b!248099))

(assert (= (and b!248105 (not c!41555)) b!248094))

(assert (= (and b!248099 res!121562) b!248089))

(assert (= (and b!248089 res!121564) b!248086))

(assert (= (and b!248094 c!41556) b!248085))

(assert (= (and b!248094 (not c!41556)) b!248092))

(assert (= (and b!248085 res!121568) b!248088))

(assert (= (and b!248088 res!121560) b!248093))

(assert (= (or b!248099 b!248085) bm!23234))

(assert (= (or b!248086 b!248093) bm!23235))

(assert (= (and b!248090 res!121563) b!248082))

(assert (= (and b!248082 c!41557) b!248102))

(assert (= (and b!248082 (not c!41557)) b!248100))

(assert (= (and b!248082 (not res!121557)) b!248091))

(assert (= (and b!248091 (not res!121565)) b!248084))

(assert (= (and b!248084 (not res!121559)) b!248098))

(assert (= (and b!248098 (not res!121566)) b!248087))

(assert (= (and b!248087 (not res!121558)) b!248106))

(assert (= (and b!248083 condMapEmpty!10973) mapIsEmpty!10973))

(assert (= (and b!248083 (not condMapEmpty!10973)) mapNonEmpty!10973))

(assert (= (and mapNonEmpty!10973 ((_ is ValueCellFull!2888) mapValue!10973)) b!248104))

(assert (= (and b!248083 ((_ is ValueCellFull!2888) mapDefault!10973)) b!248095))

(assert (= b!248103 b!248083))

(assert (= start!23622 b!248103))

(declare-fun m!264421 () Bool)

(assert (=> b!248103 m!264421))

(declare-fun m!264423 () Bool)

(assert (=> b!248103 m!264423))

(declare-fun m!264425 () Bool)

(assert (=> bm!23234 m!264425))

(declare-fun m!264427 () Bool)

(assert (=> b!248101 m!264427))

(declare-fun m!264429 () Bool)

(assert (=> b!248090 m!264429))

(declare-fun m!264431 () Bool)

(assert (=> b!248090 m!264431))

(assert (=> b!248090 m!264431))

(declare-fun m!264433 () Bool)

(assert (=> b!248090 m!264433))

(declare-fun m!264435 () Bool)

(assert (=> b!248106 m!264435))

(declare-fun m!264437 () Bool)

(assert (=> b!248102 m!264437))

(declare-fun m!264439 () Bool)

(assert (=> mapNonEmpty!10973 m!264439))

(declare-fun m!264441 () Bool)

(assert (=> b!248087 m!264441))

(declare-fun m!264443 () Bool)

(assert (=> b!248096 m!264443))

(declare-fun m!264445 () Bool)

(assert (=> b!248084 m!264445))

(declare-fun m!264447 () Bool)

(assert (=> b!248105 m!264447))

(declare-fun m!264449 () Bool)

(assert (=> b!248082 m!264449))

(declare-fun m!264451 () Bool)

(assert (=> b!248082 m!264451))

(declare-fun m!264453 () Bool)

(assert (=> b!248082 m!264453))

(declare-fun m!264455 () Bool)

(assert (=> b!248082 m!264455))

(declare-fun m!264457 () Bool)

(assert (=> b!248082 m!264457))

(declare-fun m!264459 () Bool)

(assert (=> b!248082 m!264459))

(declare-fun m!264461 () Bool)

(assert (=> b!248082 m!264461))

(declare-fun m!264463 () Bool)

(assert (=> b!248082 m!264463))

(declare-fun m!264465 () Bool)

(assert (=> start!23622 m!264465))

(declare-fun m!264467 () Bool)

(assert (=> b!248088 m!264467))

(assert (=> bm!23235 m!264451))

(declare-fun m!264469 () Bool)

(assert (=> b!248089 m!264469))

(check-sat (not b!248096) (not b!248105) b_and!13579 (not b!248084) (not mapNonEmpty!10973) (not bm!23234) (not b!248102) (not b!248101) (not b!248106) tp_is_empty!6463 (not b!248087) (not b!248103) (not start!23622) (not b_next!6601) (not bm!23235) (not b!248082) (not b!248090))
(check-sat b_and!13579 (not b_next!6601))
(get-model)

(declare-fun d!60377 () Bool)

(assert (=> d!60377 (contains!1780 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) key!932)))

(declare-fun lt!124194 () Unit!7668)

(declare-fun choose!1174 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) (_ BitVec 32) Int) Unit!7668)

(assert (=> d!60377 (= lt!124194 (choose!1174 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(assert (=> d!60377 (validMask!0 (mask!10738 thiss!1504))))

(assert (=> d!60377 (= (lemmaArrayContainsKeyThenInListMap!200 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) lt!124194)))

(declare-fun bs!8910 () Bool)

(assert (= bs!8910 d!60377))

(assert (=> bs!8910 m!264431))

(assert (=> bs!8910 m!264431))

(assert (=> bs!8910 m!264433))

(declare-fun m!264571 () Bool)

(assert (=> bs!8910 m!264571))

(assert (=> bs!8910 m!264449))

(assert (=> b!248102 d!60377))

(declare-fun d!60379 () Bool)

(declare-fun lt!124203 () SeekEntryResult!1107)

(assert (=> d!60379 (and (or ((_ is Undefined!1107) lt!124203) (not ((_ is Found!1107) lt!124203)) (and (bvsge (index!6599 lt!124203) #b00000000000000000000000000000000) (bvslt (index!6599 lt!124203) (size!6144 (_keys!6714 thiss!1504))))) (or ((_ is Undefined!1107) lt!124203) ((_ is Found!1107) lt!124203) (not ((_ is MissingZero!1107) lt!124203)) (and (bvsge (index!6598 lt!124203) #b00000000000000000000000000000000) (bvslt (index!6598 lt!124203) (size!6144 (_keys!6714 thiss!1504))))) (or ((_ is Undefined!1107) lt!124203) ((_ is Found!1107) lt!124203) ((_ is MissingZero!1107) lt!124203) (not ((_ is MissingVacant!1107) lt!124203)) (and (bvsge (index!6601 lt!124203) #b00000000000000000000000000000000) (bvslt (index!6601 lt!124203) (size!6144 (_keys!6714 thiss!1504))))) (or ((_ is Undefined!1107) lt!124203) (ite ((_ is Found!1107) lt!124203) (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6599 lt!124203)) key!932) (ite ((_ is MissingZero!1107) lt!124203) (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6598 lt!124203)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1107) lt!124203) (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6601 lt!124203)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161026 () SeekEntryResult!1107)

(assert (=> d!60379 (= lt!124203 e!161026)))

(declare-fun c!41590 () Bool)

(declare-fun lt!124201 () SeekEntryResult!1107)

(assert (=> d!60379 (= c!41590 (and ((_ is Intermediate!1107) lt!124201) (undefined!1919 lt!124201)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12229 (_ BitVec 32)) SeekEntryResult!1107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60379 (= lt!124201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10738 thiss!1504)) key!932 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(assert (=> d!60379 (validMask!0 (mask!10738 thiss!1504))))

(assert (=> d!60379 (= (seekEntryOrOpen!0 key!932 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)) lt!124203)))

(declare-fun b!248269 () Bool)

(declare-fun e!161028 () SeekEntryResult!1107)

(assert (=> b!248269 (= e!161028 (MissingZero!1107 (index!6600 lt!124201)))))

(declare-fun b!248270 () Bool)

(declare-fun c!41591 () Bool)

(declare-fun lt!124202 () (_ BitVec 64))

(assert (=> b!248270 (= c!41591 (= lt!124202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161027 () SeekEntryResult!1107)

(assert (=> b!248270 (= e!161027 e!161028)))

(declare-fun b!248271 () Bool)

(assert (=> b!248271 (= e!161027 (Found!1107 (index!6600 lt!124201)))))

(declare-fun b!248272 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12229 (_ BitVec 32)) SeekEntryResult!1107)

(assert (=> b!248272 (= e!161028 (seekKeyOrZeroReturnVacant!0 (x!24568 lt!124201) (index!6600 lt!124201) (index!6600 lt!124201) key!932 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(declare-fun b!248273 () Bool)

(assert (=> b!248273 (= e!161026 e!161027)))

(assert (=> b!248273 (= lt!124202 (select (arr!5800 (_keys!6714 thiss!1504)) (index!6600 lt!124201)))))

(declare-fun c!41589 () Bool)

(assert (=> b!248273 (= c!41589 (= lt!124202 key!932))))

(declare-fun b!248274 () Bool)

(assert (=> b!248274 (= e!161026 Undefined!1107)))

(assert (= (and d!60379 c!41590) b!248274))

(assert (= (and d!60379 (not c!41590)) b!248273))

(assert (= (and b!248273 c!41589) b!248271))

(assert (= (and b!248273 (not c!41589)) b!248270))

(assert (= (and b!248270 c!41591) b!248269))

(assert (= (and b!248270 (not c!41591)) b!248272))

(assert (=> d!60379 m!264449))

(declare-fun m!264573 () Bool)

(assert (=> d!60379 m!264573))

(declare-fun m!264575 () Bool)

(assert (=> d!60379 m!264575))

(assert (=> d!60379 m!264573))

(declare-fun m!264577 () Bool)

(assert (=> d!60379 m!264577))

(declare-fun m!264579 () Bool)

(assert (=> d!60379 m!264579))

(declare-fun m!264581 () Bool)

(assert (=> d!60379 m!264581))

(declare-fun m!264583 () Bool)

(assert (=> b!248272 m!264583))

(declare-fun m!264585 () Bool)

(assert (=> b!248273 m!264585))

(assert (=> b!248101 d!60379))

(declare-fun d!60381 () Bool)

(assert (=> d!60381 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248084 d!60381))

(declare-fun d!60383 () Bool)

(assert (=> d!60383 (= (array_inv!3825 (_keys!6714 thiss!1504)) (bvsge (size!6144 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248103 d!60383))

(declare-fun d!60385 () Bool)

(assert (=> d!60385 (= (array_inv!3826 (_values!4574 thiss!1504)) (bvsge (size!6143 (_values!4574 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248103 d!60385))

(declare-fun b!248291 () Bool)

(declare-fun res!121656 () Bool)

(declare-fun e!161037 () Bool)

(assert (=> b!248291 (=> (not res!121656) (not e!161037))))

(declare-fun call!23256 () Bool)

(assert (=> b!248291 (= res!121656 call!23256)))

(declare-fun e!161039 () Bool)

(assert (=> b!248291 (= e!161039 e!161037)))

(declare-fun b!248292 () Bool)

(declare-fun lt!124209 () SeekEntryResult!1107)

(assert (=> b!248292 (= e!161039 ((_ is Undefined!1107) lt!124209))))

(declare-fun b!248293 () Bool)

(declare-fun e!161040 () Bool)

(declare-fun e!161038 () Bool)

(assert (=> b!248293 (= e!161040 e!161038)))

(declare-fun res!121655 () Bool)

(assert (=> b!248293 (= res!121655 call!23256)))

(assert (=> b!248293 (=> (not res!121655) (not e!161038))))

(declare-fun b!248294 () Bool)

(declare-fun call!23255 () Bool)

(assert (=> b!248294 (= e!161037 (not call!23255))))

(declare-fun b!248295 () Bool)

(declare-fun res!121657 () Bool)

(assert (=> b!248295 (=> (not res!121657) (not e!161037))))

(assert (=> b!248295 (= res!121657 (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6601 lt!124209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248295 (and (bvsge (index!6601 lt!124209) #b00000000000000000000000000000000) (bvslt (index!6601 lt!124209) (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248296 () Bool)

(assert (=> b!248296 (= e!161040 e!161039)))

(declare-fun c!41597 () Bool)

(assert (=> b!248296 (= c!41597 ((_ is MissingVacant!1107) lt!124209))))

(declare-fun c!41596 () Bool)

(declare-fun bm!23252 () Bool)

(assert (=> bm!23252 (= call!23256 (inRange!0 (ite c!41596 (index!6598 lt!124209) (index!6601 lt!124209)) (mask!10738 thiss!1504)))))

(declare-fun bm!23253 () Bool)

(assert (=> bm!23253 (= call!23255 (arrayContainsKey!0 (_keys!6714 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248298 () Bool)

(assert (=> b!248298 (and (bvsge (index!6598 lt!124209) #b00000000000000000000000000000000) (bvslt (index!6598 lt!124209) (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun res!121658 () Bool)

(assert (=> b!248298 (= res!121658 (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6598 lt!124209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248298 (=> (not res!121658) (not e!161038))))

(declare-fun b!248297 () Bool)

(assert (=> b!248297 (= e!161038 (not call!23255))))

(declare-fun d!60387 () Bool)

(assert (=> d!60387 e!161040))

(assert (=> d!60387 (= c!41596 ((_ is MissingZero!1107) lt!124209))))

(assert (=> d!60387 (= lt!124209 (seekEntryOrOpen!0 key!932 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(declare-fun lt!124208 () Unit!7668)

(declare-fun choose!1175 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7668)

(assert (=> d!60387 (= lt!124208 (choose!1175 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> d!60387 (validMask!0 (mask!10738 thiss!1504))))

(assert (=> d!60387 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)) lt!124208)))

(assert (= (and d!60387 c!41596) b!248293))

(assert (= (and d!60387 (not c!41596)) b!248296))

(assert (= (and b!248293 res!121655) b!248298))

(assert (= (and b!248298 res!121658) b!248297))

(assert (= (and b!248296 c!41597) b!248291))

(assert (= (and b!248296 (not c!41597)) b!248292))

(assert (= (and b!248291 res!121656) b!248295))

(assert (= (and b!248295 res!121657) b!248294))

(assert (= (or b!248293 b!248291) bm!23252))

(assert (= (or b!248297 b!248294) bm!23253))

(declare-fun m!264587 () Bool)

(assert (=> b!248298 m!264587))

(declare-fun m!264589 () Bool)

(assert (=> bm!23252 m!264589))

(assert (=> bm!23253 m!264451))

(assert (=> d!60387 m!264427))

(declare-fun m!264591 () Bool)

(assert (=> d!60387 m!264591))

(assert (=> d!60387 m!264449))

(declare-fun m!264593 () Bool)

(assert (=> b!248295 m!264593))

(assert (=> b!248105 d!60387))

(declare-fun d!60389 () Bool)

(declare-fun e!161043 () Bool)

(assert (=> d!60389 e!161043))

(declare-fun res!121663 () Bool)

(assert (=> d!60389 (=> (not res!121663) (not e!161043))))

(declare-fun lt!124214 () SeekEntryResult!1107)

(assert (=> d!60389 (= res!121663 ((_ is Found!1107) lt!124214))))

(assert (=> d!60389 (= lt!124214 (seekEntryOrOpen!0 key!932 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(declare-fun lt!124215 () Unit!7668)

(declare-fun choose!1176 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7668)

(assert (=> d!60389 (= lt!124215 (choose!1176 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> d!60389 (validMask!0 (mask!10738 thiss!1504))))

(assert (=> d!60389 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!391 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)) lt!124215)))

(declare-fun b!248303 () Bool)

(declare-fun res!121664 () Bool)

(assert (=> b!248303 (=> (not res!121664) (not e!161043))))

(assert (=> b!248303 (= res!121664 (inRange!0 (index!6599 lt!124214) (mask!10738 thiss!1504)))))

(declare-fun b!248304 () Bool)

(assert (=> b!248304 (= e!161043 (= (select (arr!5800 (_keys!6714 thiss!1504)) (index!6599 lt!124214)) key!932))))

(assert (=> b!248304 (and (bvsge (index!6599 lt!124214) #b00000000000000000000000000000000) (bvslt (index!6599 lt!124214) (size!6144 (_keys!6714 thiss!1504))))))

(assert (= (and d!60389 res!121663) b!248303))

(assert (= (and b!248303 res!121664) b!248304))

(assert (=> d!60389 m!264427))

(declare-fun m!264595 () Bool)

(assert (=> d!60389 m!264595))

(assert (=> d!60389 m!264449))

(declare-fun m!264597 () Bool)

(assert (=> b!248303 m!264597))

(declare-fun m!264599 () Bool)

(assert (=> b!248304 m!264599))

(assert (=> b!248096 d!60389))

(declare-fun d!60391 () Bool)

(declare-fun res!121671 () Bool)

(declare-fun e!161046 () Bool)

(assert (=> d!60391 (=> (not res!121671) (not e!161046))))

(declare-fun simpleValid!259 (LongMapFixedSize!3676) Bool)

(assert (=> d!60391 (= res!121671 (simpleValid!259 thiss!1504))))

(assert (=> d!60391 (= (valid!1445 thiss!1504) e!161046)))

(declare-fun b!248311 () Bool)

(declare-fun res!121672 () Bool)

(assert (=> b!248311 (=> (not res!121672) (not e!161046))))

(assert (=> b!248311 (= res!121672 (= (arrayCountValidKeys!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) (_size!1887 thiss!1504)))))

(declare-fun b!248312 () Bool)

(declare-fun res!121673 () Bool)

(assert (=> b!248312 (=> (not res!121673) (not e!161046))))

(assert (=> b!248312 (= res!121673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(declare-fun b!248313 () Bool)

(assert (=> b!248313 (= e!161046 (arrayNoDuplicates!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 Nil!3685))))

(assert (= (and d!60391 res!121671) b!248311))

(assert (= (and b!248311 res!121672) b!248312))

(assert (= (and b!248312 res!121673) b!248313))

(declare-fun m!264601 () Bool)

(assert (=> d!60391 m!264601))

(assert (=> b!248311 m!264459))

(assert (=> b!248312 m!264441))

(assert (=> b!248313 m!264435))

(assert (=> start!23622 d!60391))

(declare-fun d!60393 () Bool)

(declare-fun res!121682 () Bool)

(declare-fun e!161058 () Bool)

(assert (=> d!60393 (=> res!121682 e!161058)))

(assert (=> d!60393 (= res!121682 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(assert (=> d!60393 (= (arrayNoDuplicates!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 Nil!3685) e!161058)))

(declare-fun bm!23256 () Bool)

(declare-fun call!23259 () Bool)

(declare-fun c!41600 () Bool)

(assert (=> bm!23256 (= call!23259 (arrayNoDuplicates!0 (_keys!6714 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41600 (Cons!3684 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000) Nil!3685) Nil!3685)))))

(declare-fun b!248324 () Bool)

(declare-fun e!161057 () Bool)

(assert (=> b!248324 (= e!161057 call!23259)))

(declare-fun b!248325 () Bool)

(declare-fun e!161055 () Bool)

(assert (=> b!248325 (= e!161055 e!161057)))

(assert (=> b!248325 (= c!41600 (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248326 () Bool)

(assert (=> b!248326 (= e!161057 call!23259)))

(declare-fun b!248327 () Bool)

(assert (=> b!248327 (= e!161058 e!161055)))

(declare-fun res!121681 () Bool)

(assert (=> b!248327 (=> (not res!121681) (not e!161055))))

(declare-fun e!161056 () Bool)

(assert (=> b!248327 (= res!121681 (not e!161056))))

(declare-fun res!121680 () Bool)

(assert (=> b!248327 (=> (not res!121680) (not e!161056))))

(assert (=> b!248327 (= res!121680 (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248328 () Bool)

(declare-fun contains!1782 (List!3688 (_ BitVec 64)) Bool)

(assert (=> b!248328 (= e!161056 (contains!1782 Nil!3685 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60393 (not res!121682)) b!248327))

(assert (= (and b!248327 res!121680) b!248328))

(assert (= (and b!248327 res!121681) b!248325))

(assert (= (and b!248325 c!41600) b!248326))

(assert (= (and b!248325 (not c!41600)) b!248324))

(assert (= (or b!248326 b!248324) bm!23256))

(declare-fun m!264603 () Bool)

(assert (=> bm!23256 m!264603))

(declare-fun m!264605 () Bool)

(assert (=> bm!23256 m!264605))

(assert (=> b!248325 m!264603))

(assert (=> b!248325 m!264603))

(declare-fun m!264607 () Bool)

(assert (=> b!248325 m!264607))

(assert (=> b!248327 m!264603))

(assert (=> b!248327 m!264603))

(assert (=> b!248327 m!264607))

(assert (=> b!248328 m!264603))

(assert (=> b!248328 m!264603))

(declare-fun m!264609 () Bool)

(assert (=> b!248328 m!264609))

(assert (=> b!248106 d!60393))

(declare-fun b!248337 () Bool)

(declare-fun e!161065 () Bool)

(declare-fun call!23262 () Bool)

(assert (=> b!248337 (= e!161065 call!23262)))

(declare-fun bm!23259 () Bool)

(assert (=> bm!23259 (= call!23262 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6714 thiss!1504) (mask!10738 thiss!1504)))))

(declare-fun b!248338 () Bool)

(declare-fun e!161067 () Bool)

(assert (=> b!248338 (= e!161065 e!161067)))

(declare-fun lt!124224 () (_ BitVec 64))

(assert (=> b!248338 (= lt!124224 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124223 () Unit!7668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12229 (_ BitVec 64) (_ BitVec 32)) Unit!7668)

(assert (=> b!248338 (= lt!124223 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6714 thiss!1504) lt!124224 #b00000000000000000000000000000000))))

(assert (=> b!248338 (arrayContainsKey!0 (_keys!6714 thiss!1504) lt!124224 #b00000000000000000000000000000000)))

(declare-fun lt!124222 () Unit!7668)

(assert (=> b!248338 (= lt!124222 lt!124223)))

(declare-fun res!121688 () Bool)

(assert (=> b!248338 (= res!121688 (= (seekEntryOrOpen!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000) (_keys!6714 thiss!1504) (mask!10738 thiss!1504)) (Found!1107 #b00000000000000000000000000000000)))))

(assert (=> b!248338 (=> (not res!121688) (not e!161067))))

(declare-fun b!248339 () Bool)

(assert (=> b!248339 (= e!161067 call!23262)))

(declare-fun d!60395 () Bool)

(declare-fun res!121687 () Bool)

(declare-fun e!161066 () Bool)

(assert (=> d!60395 (=> res!121687 e!161066)))

(assert (=> d!60395 (= res!121687 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(assert (=> d!60395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6714 thiss!1504) (mask!10738 thiss!1504)) e!161066)))

(declare-fun b!248340 () Bool)

(assert (=> b!248340 (= e!161066 e!161065)))

(declare-fun c!41603 () Bool)

(assert (=> b!248340 (= c!41603 (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60395 (not res!121687)) b!248340))

(assert (= (and b!248340 c!41603) b!248338))

(assert (= (and b!248340 (not c!41603)) b!248337))

(assert (= (and b!248338 res!121688) b!248339))

(assert (= (or b!248339 b!248337) bm!23259))

(declare-fun m!264611 () Bool)

(assert (=> bm!23259 m!264611))

(assert (=> b!248338 m!264603))

(declare-fun m!264613 () Bool)

(assert (=> b!248338 m!264613))

(declare-fun m!264615 () Bool)

(assert (=> b!248338 m!264615))

(assert (=> b!248338 m!264603))

(declare-fun m!264617 () Bool)

(assert (=> b!248338 m!264617))

(assert (=> b!248340 m!264603))

(assert (=> b!248340 m!264603))

(assert (=> b!248340 m!264607))

(assert (=> b!248087 d!60395))

(declare-fun d!60397 () Bool)

(declare-fun res!121693 () Bool)

(declare-fun e!161072 () Bool)

(assert (=> d!60397 (=> res!121693 e!161072)))

(assert (=> d!60397 (= res!121693 (= (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60397 (= (arrayContainsKey!0 (_keys!6714 thiss!1504) key!932 #b00000000000000000000000000000000) e!161072)))

(declare-fun b!248345 () Bool)

(declare-fun e!161073 () Bool)

(assert (=> b!248345 (= e!161072 e!161073)))

(declare-fun res!121694 () Bool)

(assert (=> b!248345 (=> (not res!121694) (not e!161073))))

(assert (=> b!248345 (= res!121694 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248346 () Bool)

(assert (=> b!248346 (= e!161073 (arrayContainsKey!0 (_keys!6714 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60397 (not res!121693)) b!248345))

(assert (= (and b!248345 res!121694) b!248346))

(assert (=> d!60397 m!264603))

(declare-fun m!264619 () Bool)

(assert (=> b!248346 m!264619))

(assert (=> bm!23235 d!60397))

(declare-fun d!60399 () Bool)

(assert (=> d!60399 (= (inRange!0 (ite c!41555 (index!6598 lt!124131) (index!6601 lt!124131)) (mask!10738 thiss!1504)) (and (bvsge (ite c!41555 (index!6598 lt!124131) (index!6601 lt!124131)) #b00000000000000000000000000000000) (bvslt (ite c!41555 (index!6598 lt!124131) (index!6601 lt!124131)) (bvadd (mask!10738 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23234 d!60399))

(declare-fun b!248357 () Bool)

(declare-fun e!161078 () Bool)

(assert (=> b!248357 (= e!161078 (bvslt (size!6144 (_keys!6714 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!248358 () Bool)

(declare-fun e!161079 () Bool)

(assert (=> b!248358 (= e!161079 (= (arrayCountValidKeys!0 (array!12230 (store (arr!5800 (_keys!6714 thiss!1504)) index!297 key!932) (size!6144 (_keys!6714 thiss!1504))) #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!248356 () Bool)

(declare-fun res!121704 () Bool)

(assert (=> b!248356 (=> (not res!121704) (not e!161078))))

(assert (=> b!248356 (= res!121704 (validKeyInArray!0 key!932))))

(declare-fun d!60401 () Bool)

(assert (=> d!60401 e!161079))

(declare-fun res!121706 () Bool)

(assert (=> d!60401 (=> (not res!121706) (not e!161079))))

(assert (=> d!60401 (= res!121706 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6144 (_keys!6714 thiss!1504)))))))

(declare-fun lt!124227 () Unit!7668)

(declare-fun choose!1 (array!12229 (_ BitVec 32) (_ BitVec 64)) Unit!7668)

(assert (=> d!60401 (= lt!124227 (choose!1 (_keys!6714 thiss!1504) index!297 key!932))))

(assert (=> d!60401 e!161078))

(declare-fun res!121705 () Bool)

(assert (=> d!60401 (=> (not res!121705) (not e!161078))))

(assert (=> d!60401 (= res!121705 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6144 (_keys!6714 thiss!1504)))))))

(assert (=> d!60401 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6714 thiss!1504) index!297 key!932) lt!124227)))

(declare-fun b!248355 () Bool)

(declare-fun res!121703 () Bool)

(assert (=> b!248355 (=> (not res!121703) (not e!161078))))

(assert (=> b!248355 (= res!121703 (not (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) index!297))))))

(assert (= (and d!60401 res!121705) b!248355))

(assert (= (and b!248355 res!121703) b!248356))

(assert (= (and b!248356 res!121704) b!248357))

(assert (= (and d!60401 res!121706) b!248358))

(assert (=> b!248358 m!264457))

(declare-fun m!264621 () Bool)

(assert (=> b!248358 m!264621))

(assert (=> b!248358 m!264459))

(assert (=> b!248356 m!264445))

(declare-fun m!264623 () Bool)

(assert (=> d!60401 m!264623))

(declare-fun m!264625 () Bool)

(assert (=> b!248355 m!264625))

(assert (=> b!248355 m!264625))

(declare-fun m!264627 () Bool)

(assert (=> b!248355 m!264627))

(assert (=> b!248082 d!60401))

(assert (=> b!248082 d!60397))

(declare-fun b!248367 () Bool)

(declare-fun e!161085 () (_ BitVec 32))

(declare-fun e!161084 () (_ BitVec 32))

(assert (=> b!248367 (= e!161085 e!161084)))

(declare-fun c!41609 () Bool)

(assert (=> b!248367 (= c!41609 (validKeyInArray!0 (select (arr!5800 lt!124124) #b00000000000000000000000000000000)))))

(declare-fun b!248368 () Bool)

(declare-fun call!23265 () (_ BitVec 32))

(assert (=> b!248368 (= e!161084 (bvadd #b00000000000000000000000000000001 call!23265))))

(declare-fun b!248369 () Bool)

(assert (=> b!248369 (= e!161084 call!23265)))

(declare-fun bm!23262 () Bool)

(assert (=> bm!23262 (= call!23265 (arrayCountValidKeys!0 lt!124124 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248370 () Bool)

(assert (=> b!248370 (= e!161085 #b00000000000000000000000000000000)))

(declare-fun d!60403 () Bool)

(declare-fun lt!124230 () (_ BitVec 32))

(assert (=> d!60403 (and (bvsge lt!124230 #b00000000000000000000000000000000) (bvsle lt!124230 (bvsub (size!6144 lt!124124) #b00000000000000000000000000000000)))))

(assert (=> d!60403 (= lt!124230 e!161085)))

(declare-fun c!41608 () Bool)

(assert (=> d!60403 (= c!41608 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(assert (=> d!60403 (and (bvsle #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6144 (_keys!6714 thiss!1504)) (size!6144 lt!124124)))))

(assert (=> d!60403 (= (arrayCountValidKeys!0 lt!124124 #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) lt!124230)))

(assert (= (and d!60403 c!41608) b!248370))

(assert (= (and d!60403 (not c!41608)) b!248367))

(assert (= (and b!248367 c!41609) b!248368))

(assert (= (and b!248367 (not c!41609)) b!248369))

(assert (= (or b!248368 b!248369) bm!23262))

(declare-fun m!264629 () Bool)

(assert (=> b!248367 m!264629))

(assert (=> b!248367 m!264629))

(declare-fun m!264631 () Bool)

(assert (=> b!248367 m!264631))

(declare-fun m!264633 () Bool)

(assert (=> bm!23262 m!264633))

(assert (=> b!248082 d!60403))

(declare-fun b!248371 () Bool)

(declare-fun e!161087 () (_ BitVec 32))

(declare-fun e!161086 () (_ BitVec 32))

(assert (=> b!248371 (= e!161087 e!161086)))

(declare-fun c!41611 () Bool)

(assert (=> b!248371 (= c!41611 (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248372 () Bool)

(declare-fun call!23266 () (_ BitVec 32))

(assert (=> b!248372 (= e!161086 (bvadd #b00000000000000000000000000000001 call!23266))))

(declare-fun b!248373 () Bool)

(assert (=> b!248373 (= e!161086 call!23266)))

(declare-fun bm!23263 () Bool)

(assert (=> bm!23263 (= call!23266 (arrayCountValidKeys!0 (_keys!6714 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248374 () Bool)

(assert (=> b!248374 (= e!161087 #b00000000000000000000000000000000)))

(declare-fun d!60405 () Bool)

(declare-fun lt!124231 () (_ BitVec 32))

(assert (=> d!60405 (and (bvsge lt!124231 #b00000000000000000000000000000000) (bvsle lt!124231 (bvsub (size!6144 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60405 (= lt!124231 e!161087)))

(declare-fun c!41610 () Bool)

(assert (=> d!60405 (= c!41610 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(assert (=> d!60405 (and (bvsle #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6144 (_keys!6714 thiss!1504)) (size!6144 (_keys!6714 thiss!1504))))))

(assert (=> d!60405 (= (arrayCountValidKeys!0 (_keys!6714 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) lt!124231)))

(assert (= (and d!60405 c!41610) b!248374))

(assert (= (and d!60405 (not c!41610)) b!248371))

(assert (= (and b!248371 c!41611) b!248372))

(assert (= (and b!248371 (not c!41611)) b!248373))

(assert (= (or b!248372 b!248373) bm!23263))

(assert (=> b!248371 m!264603))

(assert (=> b!248371 m!264603))

(assert (=> b!248371 m!264607))

(declare-fun m!264635 () Bool)

(assert (=> bm!23263 m!264635))

(assert (=> b!248082 d!60405))

(declare-fun d!60407 () Bool)

(assert (=> d!60407 (= (validMask!0 (mask!10738 thiss!1504)) (and (or (= (mask!10738 thiss!1504) #b00000000000000000000000000000111) (= (mask!10738 thiss!1504) #b00000000000000000000000000001111) (= (mask!10738 thiss!1504) #b00000000000000000000000000011111) (= (mask!10738 thiss!1504) #b00000000000000000000000000111111) (= (mask!10738 thiss!1504) #b00000000000000000000000001111111) (= (mask!10738 thiss!1504) #b00000000000000000000000011111111) (= (mask!10738 thiss!1504) #b00000000000000000000000111111111) (= (mask!10738 thiss!1504) #b00000000000000000000001111111111) (= (mask!10738 thiss!1504) #b00000000000000000000011111111111) (= (mask!10738 thiss!1504) #b00000000000000000000111111111111) (= (mask!10738 thiss!1504) #b00000000000000000001111111111111) (= (mask!10738 thiss!1504) #b00000000000000000011111111111111) (= (mask!10738 thiss!1504) #b00000000000000000111111111111111) (= (mask!10738 thiss!1504) #b00000000000000001111111111111111) (= (mask!10738 thiss!1504) #b00000000000000011111111111111111) (= (mask!10738 thiss!1504) #b00000000000000111111111111111111) (= (mask!10738 thiss!1504) #b00000000000001111111111111111111) (= (mask!10738 thiss!1504) #b00000000000011111111111111111111) (= (mask!10738 thiss!1504) #b00000000000111111111111111111111) (= (mask!10738 thiss!1504) #b00000000001111111111111111111111) (= (mask!10738 thiss!1504) #b00000000011111111111111111111111) (= (mask!10738 thiss!1504) #b00000000111111111111111111111111) (= (mask!10738 thiss!1504) #b00000001111111111111111111111111) (= (mask!10738 thiss!1504) #b00000011111111111111111111111111) (= (mask!10738 thiss!1504) #b00000111111111111111111111111111) (= (mask!10738 thiss!1504) #b00001111111111111111111111111111) (= (mask!10738 thiss!1504) #b00011111111111111111111111111111) (= (mask!10738 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10738 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248082 d!60407))

(declare-fun d!60409 () Bool)

(declare-fun res!121709 () Bool)

(declare-fun e!161091 () Bool)

(assert (=> d!60409 (=> res!121709 e!161091)))

(assert (=> d!60409 (= res!121709 (bvsge #b00000000000000000000000000000000 (size!6144 lt!124124)))))

(assert (=> d!60409 (= (arrayNoDuplicates!0 lt!124124 #b00000000000000000000000000000000 Nil!3685) e!161091)))

(declare-fun bm!23264 () Bool)

(declare-fun call!23267 () Bool)

(declare-fun c!41612 () Bool)

(assert (=> bm!23264 (= call!23267 (arrayNoDuplicates!0 lt!124124 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41612 (Cons!3684 (select (arr!5800 lt!124124) #b00000000000000000000000000000000) Nil!3685) Nil!3685)))))

(declare-fun b!248375 () Bool)

(declare-fun e!161090 () Bool)

(assert (=> b!248375 (= e!161090 call!23267)))

(declare-fun b!248376 () Bool)

(declare-fun e!161088 () Bool)

(assert (=> b!248376 (= e!161088 e!161090)))

(assert (=> b!248376 (= c!41612 (validKeyInArray!0 (select (arr!5800 lt!124124) #b00000000000000000000000000000000)))))

(declare-fun b!248377 () Bool)

(assert (=> b!248377 (= e!161090 call!23267)))

(declare-fun b!248378 () Bool)

(assert (=> b!248378 (= e!161091 e!161088)))

(declare-fun res!121708 () Bool)

(assert (=> b!248378 (=> (not res!121708) (not e!161088))))

(declare-fun e!161089 () Bool)

(assert (=> b!248378 (= res!121708 (not e!161089))))

(declare-fun res!121707 () Bool)

(assert (=> b!248378 (=> (not res!121707) (not e!161089))))

(assert (=> b!248378 (= res!121707 (validKeyInArray!0 (select (arr!5800 lt!124124) #b00000000000000000000000000000000)))))

(declare-fun b!248379 () Bool)

(assert (=> b!248379 (= e!161089 (contains!1782 Nil!3685 (select (arr!5800 lt!124124) #b00000000000000000000000000000000)))))

(assert (= (and d!60409 (not res!121709)) b!248378))

(assert (= (and b!248378 res!121707) b!248379))

(assert (= (and b!248378 res!121708) b!248376))

(assert (= (and b!248376 c!41612) b!248377))

(assert (= (and b!248376 (not c!41612)) b!248375))

(assert (= (or b!248377 b!248375) bm!23264))

(assert (=> bm!23264 m!264629))

(declare-fun m!264637 () Bool)

(assert (=> bm!23264 m!264637))

(assert (=> b!248376 m!264629))

(assert (=> b!248376 m!264629))

(assert (=> b!248376 m!264631))

(assert (=> b!248378 m!264629))

(assert (=> b!248378 m!264629))

(assert (=> b!248378 m!264631))

(assert (=> b!248379 m!264629))

(assert (=> b!248379 m!264629))

(declare-fun m!264639 () Bool)

(assert (=> b!248379 m!264639))

(assert (=> b!248082 d!60409))

(declare-fun d!60411 () Bool)

(declare-fun e!161094 () Bool)

(assert (=> d!60411 e!161094))

(declare-fun res!121712 () Bool)

(assert (=> d!60411 (=> (not res!121712) (not e!161094))))

(assert (=> d!60411 (= res!121712 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6144 (_keys!6714 thiss!1504)))))))

(declare-fun lt!124234 () Unit!7668)

(declare-fun choose!41 (array!12229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3688) Unit!7668)

(assert (=> d!60411 (= lt!124234 (choose!41 (_keys!6714 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3685))))

(assert (=> d!60411 (bvslt (size!6144 (_keys!6714 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60411 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6714 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3685) lt!124234)))

(declare-fun b!248382 () Bool)

(assert (=> b!248382 (= e!161094 (arrayNoDuplicates!0 (array!12230 (store (arr!5800 (_keys!6714 thiss!1504)) index!297 key!932) (size!6144 (_keys!6714 thiss!1504))) #b00000000000000000000000000000000 Nil!3685))))

(assert (= (and d!60411 res!121712) b!248382))

(declare-fun m!264641 () Bool)

(assert (=> d!60411 m!264641))

(assert (=> b!248382 m!264457))

(declare-fun m!264643 () Bool)

(assert (=> b!248382 m!264643))

(assert (=> b!248082 d!60411))

(declare-fun d!60413 () Bool)

(assert (=> d!60413 (= (inRange!0 index!297 (mask!10738 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10738 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248090 d!60413))

(declare-fun d!60415 () Bool)

(declare-fun e!161100 () Bool)

(assert (=> d!60415 e!161100))

(declare-fun res!121715 () Bool)

(assert (=> d!60415 (=> res!121715 e!161100)))

(declare-fun lt!124243 () Bool)

(assert (=> d!60415 (= res!121715 (not lt!124243))))

(declare-fun lt!124245 () Bool)

(assert (=> d!60415 (= lt!124243 lt!124245)))

(declare-fun lt!124244 () Unit!7668)

(declare-fun e!161099 () Unit!7668)

(assert (=> d!60415 (= lt!124244 e!161099)))

(declare-fun c!41615 () Bool)

(assert (=> d!60415 (= c!41615 lt!124245)))

(declare-fun containsKey!284 (List!3689 (_ BitVec 64)) Bool)

(assert (=> d!60415 (= lt!124245 (containsKey!284 (toList!1860 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932))))

(assert (=> d!60415 (= (contains!1780 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) key!932) lt!124243)))

(declare-fun b!248389 () Bool)

(declare-fun lt!124246 () Unit!7668)

(assert (=> b!248389 (= e!161099 lt!124246)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!233 (List!3689 (_ BitVec 64)) Unit!7668)

(assert (=> b!248389 (= lt!124246 (lemmaContainsKeyImpliesGetValueByKeyDefined!233 (toList!1860 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932))))

(declare-datatypes ((Option!298 0))(
  ( (Some!297 (v!5332 V!8265)) (None!296) )
))
(declare-fun isDefined!234 (Option!298) Bool)

(declare-fun getValueByKey!292 (List!3689 (_ BitVec 64)) Option!298)

(assert (=> b!248389 (isDefined!234 (getValueByKey!292 (toList!1860 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932))))

(declare-fun b!248390 () Bool)

(declare-fun Unit!7677 () Unit!7668)

(assert (=> b!248390 (= e!161099 Unit!7677)))

(declare-fun b!248391 () Bool)

(assert (=> b!248391 (= e!161100 (isDefined!234 (getValueByKey!292 (toList!1860 (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932)))))

(assert (= (and d!60415 c!41615) b!248389))

(assert (= (and d!60415 (not c!41615)) b!248390))

(assert (= (and d!60415 (not res!121715)) b!248391))

(declare-fun m!264645 () Bool)

(assert (=> d!60415 m!264645))

(declare-fun m!264647 () Bool)

(assert (=> b!248389 m!264647))

(declare-fun m!264649 () Bool)

(assert (=> b!248389 m!264649))

(assert (=> b!248389 m!264649))

(declare-fun m!264651 () Bool)

(assert (=> b!248389 m!264651))

(assert (=> b!248391 m!264649))

(assert (=> b!248391 m!264649))

(assert (=> b!248391 m!264651))

(assert (=> b!248090 d!60415))

(declare-fun b!248434 () Bool)

(declare-fun e!161130 () Bool)

(declare-fun e!161131 () Bool)

(assert (=> b!248434 (= e!161130 e!161131)))

(declare-fun c!41629 () Bool)

(assert (=> b!248434 (= c!41629 (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248435 () Bool)

(declare-fun call!23284 () Bool)

(assert (=> b!248435 (= e!161131 (not call!23284))))

(declare-fun bm!23279 () Bool)

(declare-fun lt!124295 () ListLongMap!3689)

(assert (=> bm!23279 (= call!23284 (contains!1780 lt!124295 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23280 () Bool)

(declare-fun call!23288 () ListLongMap!3689)

(declare-fun call!23282 () ListLongMap!3689)

(assert (=> bm!23280 (= call!23288 call!23282)))

(declare-fun b!248436 () Bool)

(declare-fun e!161134 () Bool)

(declare-fun apply!236 (ListLongMap!3689 (_ BitVec 64)) V!8265)

(assert (=> b!248436 (= e!161134 (= (apply!236 lt!124295 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4432 thiss!1504)))))

(declare-fun b!248437 () Bool)

(declare-fun e!161137 () ListLongMap!3689)

(declare-fun call!23283 () ListLongMap!3689)

(assert (=> b!248437 (= e!161137 call!23283)))

(declare-fun b!248438 () Bool)

(declare-fun call!23285 () ListLongMap!3689)

(assert (=> b!248438 (= e!161137 call!23285)))

(declare-fun b!248439 () Bool)

(declare-fun e!161127 () Bool)

(declare-fun call!23287 () Bool)

(assert (=> b!248439 (= e!161127 (not call!23287))))

(declare-fun b!248440 () Bool)

(declare-fun e!161128 () Bool)

(assert (=> b!248440 (= e!161127 e!161128)))

(declare-fun res!121741 () Bool)

(assert (=> b!248440 (= res!121741 call!23287)))

(assert (=> b!248440 (=> (not res!121741) (not e!161128))))

(declare-fun b!248441 () Bool)

(declare-fun res!121738 () Bool)

(assert (=> b!248441 (=> (not res!121738) (not e!161130))))

(declare-fun e!161132 () Bool)

(assert (=> b!248441 (= res!121738 e!161132)))

(declare-fun res!121742 () Bool)

(assert (=> b!248441 (=> res!121742 e!161132)))

(declare-fun e!161133 () Bool)

(assert (=> b!248441 (= res!121742 (not e!161133))))

(declare-fun res!121736 () Bool)

(assert (=> b!248441 (=> (not res!121736) (not e!161133))))

(assert (=> b!248441 (= res!121736 (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248442 () Bool)

(declare-fun e!161135 () Bool)

(declare-fun get!2973 (ValueCell!2888 V!8265) V!8265)

(declare-fun dynLambda!570 (Int (_ BitVec 64)) V!8265)

(assert (=> b!248442 (= e!161135 (= (apply!236 lt!124295 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)) (get!2973 (select (arr!5799 (_values!4574 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!570 (defaultEntry!4591 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6143 (_values!4574 thiss!1504))))))

(assert (=> b!248442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248443 () Bool)

(assert (=> b!248443 (= e!161133 (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248444 () Bool)

(assert (=> b!248444 (= e!161128 (= (apply!236 lt!124295 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4432 thiss!1504)))))

(declare-fun bm!23281 () Bool)

(declare-fun call!23286 () ListLongMap!3689)

(assert (=> bm!23281 (= call!23285 call!23286)))

(declare-fun d!60417 () Bool)

(assert (=> d!60417 e!161130))

(declare-fun res!121734 () Bool)

(assert (=> d!60417 (=> (not res!121734) (not e!161130))))

(assert (=> d!60417 (= res!121734 (or (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))))

(declare-fun lt!124306 () ListLongMap!3689)

(assert (=> d!60417 (= lt!124295 lt!124306)))

(declare-fun lt!124310 () Unit!7668)

(declare-fun e!161136 () Unit!7668)

(assert (=> d!60417 (= lt!124310 e!161136)))

(declare-fun c!41631 () Bool)

(declare-fun e!161129 () Bool)

(assert (=> d!60417 (= c!41631 e!161129)))

(declare-fun res!121740 () Bool)

(assert (=> d!60417 (=> (not res!121740) (not e!161129))))

(assert (=> d!60417 (= res!121740 (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun e!161138 () ListLongMap!3689)

(assert (=> d!60417 (= lt!124306 e!161138)))

(declare-fun c!41632 () Bool)

(assert (=> d!60417 (= c!41632 (and (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60417 (validMask!0 (mask!10738 thiss!1504))))

(assert (=> d!60417 (= (getCurrentListMap!1369 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) lt!124295)))

(declare-fun b!248445 () Bool)

(declare-fun c!41633 () Bool)

(assert (=> b!248445 (= c!41633 (and (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!161139 () ListLongMap!3689)

(assert (=> b!248445 (= e!161139 e!161137)))

(declare-fun b!248446 () Bool)

(declare-fun +!669 (ListLongMap!3689 tuple2!4786) ListLongMap!3689)

(assert (=> b!248446 (= e!161138 (+!669 call!23286 (tuple2!4787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4432 thiss!1504))))))

(declare-fun bm!23282 () Bool)

(assert (=> bm!23282 (= call!23287 (contains!1780 lt!124295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248447 () Bool)

(assert (=> b!248447 (= e!161129 (validKeyInArray!0 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248448 () Bool)

(assert (=> b!248448 (= e!161139 call!23285)))

(declare-fun bm!23283 () Bool)

(declare-fun c!41628 () Bool)

(assert (=> bm!23283 (= call!23286 (+!669 (ite c!41632 call!23282 (ite c!41628 call!23288 call!23283)) (ite (or c!41632 c!41628) (tuple2!4787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4432 thiss!1504)) (tuple2!4787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4432 thiss!1504)))))))

(declare-fun b!248449 () Bool)

(assert (=> b!248449 (= e!161138 e!161139)))

(assert (=> b!248449 (= c!41628 (and (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248450 () Bool)

(assert (=> b!248450 (= e!161132 e!161135)))

(declare-fun res!121739 () Bool)

(assert (=> b!248450 (=> (not res!121739) (not e!161135))))

(assert (=> b!248450 (= res!121739 (contains!1780 lt!124295 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248450 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6714 thiss!1504))))))

(declare-fun b!248451 () Bool)

(declare-fun lt!124301 () Unit!7668)

(assert (=> b!248451 (= e!161136 lt!124301)))

(declare-fun lt!124299 () ListLongMap!3689)

(declare-fun getCurrentListMapNoExtraKeys!552 (array!12229 array!12227 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 32) Int) ListLongMap!3689)

(assert (=> b!248451 (= lt!124299 (getCurrentListMapNoExtraKeys!552 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124294 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124303 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124303 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124307 () Unit!7668)

(declare-fun addStillContains!212 (ListLongMap!3689 (_ BitVec 64) V!8265 (_ BitVec 64)) Unit!7668)

(assert (=> b!248451 (= lt!124307 (addStillContains!212 lt!124299 lt!124294 (zeroValue!4432 thiss!1504) lt!124303))))

(assert (=> b!248451 (contains!1780 (+!669 lt!124299 (tuple2!4787 lt!124294 (zeroValue!4432 thiss!1504))) lt!124303)))

(declare-fun lt!124297 () Unit!7668)

(assert (=> b!248451 (= lt!124297 lt!124307)))

(declare-fun lt!124302 () ListLongMap!3689)

(assert (=> b!248451 (= lt!124302 (getCurrentListMapNoExtraKeys!552 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124304 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124304 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124296 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124296 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124292 () Unit!7668)

(declare-fun addApplyDifferent!212 (ListLongMap!3689 (_ BitVec 64) V!8265 (_ BitVec 64)) Unit!7668)

(assert (=> b!248451 (= lt!124292 (addApplyDifferent!212 lt!124302 lt!124304 (minValue!4432 thiss!1504) lt!124296))))

(assert (=> b!248451 (= (apply!236 (+!669 lt!124302 (tuple2!4787 lt!124304 (minValue!4432 thiss!1504))) lt!124296) (apply!236 lt!124302 lt!124296))))

(declare-fun lt!124308 () Unit!7668)

(assert (=> b!248451 (= lt!124308 lt!124292)))

(declare-fun lt!124305 () ListLongMap!3689)

(assert (=> b!248451 (= lt!124305 (getCurrentListMapNoExtraKeys!552 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124311 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124309 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124309 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124300 () Unit!7668)

(assert (=> b!248451 (= lt!124300 (addApplyDifferent!212 lt!124305 lt!124311 (zeroValue!4432 thiss!1504) lt!124309))))

(assert (=> b!248451 (= (apply!236 (+!669 lt!124305 (tuple2!4787 lt!124311 (zeroValue!4432 thiss!1504))) lt!124309) (apply!236 lt!124305 lt!124309))))

(declare-fun lt!124298 () Unit!7668)

(assert (=> b!248451 (= lt!124298 lt!124300)))

(declare-fun lt!124312 () ListLongMap!3689)

(assert (=> b!248451 (= lt!124312 (getCurrentListMapNoExtraKeys!552 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124293 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124293 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124291 () (_ BitVec 64))

(assert (=> b!248451 (= lt!124291 (select (arr!5800 (_keys!6714 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248451 (= lt!124301 (addApplyDifferent!212 lt!124312 lt!124293 (minValue!4432 thiss!1504) lt!124291))))

(assert (=> b!248451 (= (apply!236 (+!669 lt!124312 (tuple2!4787 lt!124293 (minValue!4432 thiss!1504))) lt!124291) (apply!236 lt!124312 lt!124291))))

(declare-fun bm!23284 () Bool)

(assert (=> bm!23284 (= call!23282 (getCurrentListMapNoExtraKeys!552 (_keys!6714 thiss!1504) (_values!4574 thiss!1504) (mask!10738 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun b!248452 () Bool)

(declare-fun Unit!7678 () Unit!7668)

(assert (=> b!248452 (= e!161136 Unit!7678)))

(declare-fun bm!23285 () Bool)

(assert (=> bm!23285 (= call!23283 call!23288)))

(declare-fun b!248453 () Bool)

(assert (=> b!248453 (= e!161131 e!161134)))

(declare-fun res!121737 () Bool)

(assert (=> b!248453 (= res!121737 call!23284)))

(assert (=> b!248453 (=> (not res!121737) (not e!161134))))

(declare-fun b!248454 () Bool)

(declare-fun res!121735 () Bool)

(assert (=> b!248454 (=> (not res!121735) (not e!161130))))

(assert (=> b!248454 (= res!121735 e!161127)))

(declare-fun c!41630 () Bool)

(assert (=> b!248454 (= c!41630 (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!60417 c!41632) b!248446))

(assert (= (and d!60417 (not c!41632)) b!248449))

(assert (= (and b!248449 c!41628) b!248448))

(assert (= (and b!248449 (not c!41628)) b!248445))

(assert (= (and b!248445 c!41633) b!248438))

(assert (= (and b!248445 (not c!41633)) b!248437))

(assert (= (or b!248438 b!248437) bm!23285))

(assert (= (or b!248448 bm!23285) bm!23280))

(assert (= (or b!248448 b!248438) bm!23281))

(assert (= (or b!248446 bm!23280) bm!23284))

(assert (= (or b!248446 bm!23281) bm!23283))

(assert (= (and d!60417 res!121740) b!248447))

(assert (= (and d!60417 c!41631) b!248451))

(assert (= (and d!60417 (not c!41631)) b!248452))

(assert (= (and d!60417 res!121734) b!248441))

(assert (= (and b!248441 res!121736) b!248443))

(assert (= (and b!248441 (not res!121742)) b!248450))

(assert (= (and b!248450 res!121739) b!248442))

(assert (= (and b!248441 res!121738) b!248454))

(assert (= (and b!248454 c!41630) b!248440))

(assert (= (and b!248454 (not c!41630)) b!248439))

(assert (= (and b!248440 res!121741) b!248444))

(assert (= (or b!248440 b!248439) bm!23282))

(assert (= (and b!248454 res!121735) b!248434))

(assert (= (and b!248434 c!41629) b!248453))

(assert (= (and b!248434 (not c!41629)) b!248435))

(assert (= (and b!248453 res!121737) b!248436))

(assert (= (or b!248453 b!248435) bm!23279))

(declare-fun b_lambda!8037 () Bool)

(assert (=> (not b_lambda!8037) (not b!248442)))

(declare-fun t!8709 () Bool)

(declare-fun tb!2977 () Bool)

(assert (=> (and b!248103 (= (defaultEntry!4591 thiss!1504) (defaultEntry!4591 thiss!1504)) t!8709) tb!2977))

(declare-fun result!5269 () Bool)

(assert (=> tb!2977 (= result!5269 tp_is_empty!6463)))

(assert (=> b!248442 t!8709))

(declare-fun b_and!13585 () Bool)

(assert (= b_and!13579 (and (=> t!8709 result!5269) b_and!13585)))

(declare-fun m!264653 () Bool)

(assert (=> b!248436 m!264653))

(declare-fun m!264655 () Bool)

(assert (=> b!248446 m!264655))

(declare-fun m!264657 () Bool)

(assert (=> bm!23283 m!264657))

(declare-fun m!264659 () Bool)

(assert (=> bm!23282 m!264659))

(assert (=> b!248442 m!264603))

(assert (=> b!248442 m!264603))

(declare-fun m!264661 () Bool)

(assert (=> b!248442 m!264661))

(declare-fun m!264663 () Bool)

(assert (=> b!248442 m!264663))

(declare-fun m!264665 () Bool)

(assert (=> b!248442 m!264665))

(declare-fun m!264667 () Bool)

(assert (=> b!248442 m!264667))

(assert (=> b!248442 m!264663))

(assert (=> b!248442 m!264665))

(declare-fun m!264669 () Bool)

(assert (=> bm!23279 m!264669))

(assert (=> d!60417 m!264449))

(declare-fun m!264671 () Bool)

(assert (=> b!248444 m!264671))

(assert (=> b!248443 m!264603))

(assert (=> b!248443 m!264603))

(assert (=> b!248443 m!264607))

(assert (=> b!248451 m!264603))

(declare-fun m!264673 () Bool)

(assert (=> b!248451 m!264673))

(declare-fun m!264675 () Bool)

(assert (=> b!248451 m!264675))

(declare-fun m!264677 () Bool)

(assert (=> b!248451 m!264677))

(declare-fun m!264679 () Bool)

(assert (=> b!248451 m!264679))

(declare-fun m!264681 () Bool)

(assert (=> b!248451 m!264681))

(assert (=> b!248451 m!264681))

(declare-fun m!264683 () Bool)

(assert (=> b!248451 m!264683))

(declare-fun m!264685 () Bool)

(assert (=> b!248451 m!264685))

(declare-fun m!264687 () Bool)

(assert (=> b!248451 m!264687))

(declare-fun m!264689 () Bool)

(assert (=> b!248451 m!264689))

(declare-fun m!264691 () Bool)

(assert (=> b!248451 m!264691))

(declare-fun m!264693 () Bool)

(assert (=> b!248451 m!264693))

(assert (=> b!248451 m!264693))

(declare-fun m!264695 () Bool)

(assert (=> b!248451 m!264695))

(declare-fun m!264697 () Bool)

(assert (=> b!248451 m!264697))

(declare-fun m!264699 () Bool)

(assert (=> b!248451 m!264699))

(declare-fun m!264701 () Bool)

(assert (=> b!248451 m!264701))

(assert (=> b!248451 m!264685))

(declare-fun m!264703 () Bool)

(assert (=> b!248451 m!264703))

(assert (=> b!248451 m!264699))

(assert (=> bm!23284 m!264691))

(assert (=> b!248450 m!264603))

(assert (=> b!248450 m!264603))

(declare-fun m!264705 () Bool)

(assert (=> b!248450 m!264705))

(assert (=> b!248447 m!264603))

(assert (=> b!248447 m!264603))

(assert (=> b!248447 m!264607))

(assert (=> b!248090 d!60417))

(declare-fun mapNonEmpty!10982 () Bool)

(declare-fun mapRes!10982 () Bool)

(declare-fun tp!23069 () Bool)

(declare-fun e!161144 () Bool)

(assert (=> mapNonEmpty!10982 (= mapRes!10982 (and tp!23069 e!161144))))

(declare-fun mapRest!10982 () (Array (_ BitVec 32) ValueCell!2888))

(declare-fun mapKey!10982 () (_ BitVec 32))

(declare-fun mapValue!10982 () ValueCell!2888)

(assert (=> mapNonEmpty!10982 (= mapRest!10973 (store mapRest!10982 mapKey!10982 mapValue!10982))))

(declare-fun condMapEmpty!10982 () Bool)

(declare-fun mapDefault!10982 () ValueCell!2888)

(assert (=> mapNonEmpty!10973 (= condMapEmpty!10982 (= mapRest!10973 ((as const (Array (_ BitVec 32) ValueCell!2888)) mapDefault!10982)))))

(declare-fun e!161145 () Bool)

(assert (=> mapNonEmpty!10973 (= tp!23053 (and e!161145 mapRes!10982))))

(declare-fun b!248463 () Bool)

(assert (=> b!248463 (= e!161144 tp_is_empty!6463)))

(declare-fun mapIsEmpty!10982 () Bool)

(assert (=> mapIsEmpty!10982 mapRes!10982))

(declare-fun b!248464 () Bool)

(assert (=> b!248464 (= e!161145 tp_is_empty!6463)))

(assert (= (and mapNonEmpty!10973 condMapEmpty!10982) mapIsEmpty!10982))

(assert (= (and mapNonEmpty!10973 (not condMapEmpty!10982)) mapNonEmpty!10982))

(assert (= (and mapNonEmpty!10982 ((_ is ValueCellFull!2888) mapValue!10982)) b!248463))

(assert (= (and mapNonEmpty!10973 ((_ is ValueCellFull!2888) mapDefault!10982)) b!248464))

(declare-fun m!264707 () Bool)

(assert (=> mapNonEmpty!10982 m!264707))

(declare-fun b_lambda!8039 () Bool)

(assert (= b_lambda!8037 (or (and b!248103 b_free!6601) b_lambda!8039)))

(check-sat (not b!248376) (not b!248338) (not bm!23252) (not b!248355) (not b!248303) (not b!248378) (not bm!23284) (not bm!23264) (not d!60401) (not d!60391) (not b!248325) (not bm!23279) (not b!248391) (not bm!23262) (not b!248356) (not b!248444) (not bm!23259) (not bm!23256) (not d!60415) (not b!248371) (not b!248272) (not b!248346) (not d!60377) (not b!248379) (not b!248436) (not b_lambda!8039) (not b!248442) (not b!248447) (not b!248382) (not b!248327) (not bm!23282) (not bm!23253) (not b!248340) (not b!248328) (not b!248451) (not bm!23263) (not b!248312) (not b!248358) tp_is_empty!6463 (not b!248389) (not d!60417) (not b_next!6601) (not mapNonEmpty!10982) (not b!248311) (not b!248443) (not d!60389) (not b!248450) (not b!248367) (not d!60411) (not b!248313) (not bm!23283) (not d!60379) b_and!13585 (not b!248446) (not d!60387))
(check-sat b_and!13585 (not b_next!6601))
