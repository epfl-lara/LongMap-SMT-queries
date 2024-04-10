; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24918 () Bool)

(assert start!24918)

(declare-fun b!260138 () Bool)

(declare-fun b_free!6761 () Bool)

(declare-fun b_next!6761 () Bool)

(assert (=> b!260138 (= b_free!6761 (not b_next!6761))))

(declare-fun tp!23606 () Bool)

(declare-fun b_and!13867 () Bool)

(assert (=> b!260138 (= tp!23606 b_and!13867)))

(declare-fun b!260122 () Bool)

(declare-fun res!127142 () Bool)

(declare-fun e!168595 () Bool)

(assert (=> b!260122 (=> (not res!127142) (not e!168595))))

(declare-fun call!24791 () Bool)

(assert (=> b!260122 (= res!127142 call!24791)))

(declare-fun e!168594 () Bool)

(assert (=> b!260122 (= e!168594 e!168595)))

(declare-fun b!260123 () Bool)

(declare-fun e!168596 () Bool)

(declare-fun call!24792 () Bool)

(assert (=> b!260123 (= e!168596 (not call!24792))))

(declare-fun b!260124 () Bool)

(assert (=> b!260124 (= e!168595 (not call!24792))))

(declare-fun b!260125 () Bool)

(declare-fun res!127144 () Bool)

(assert (=> b!260125 (=> (not res!127144) (not e!168595))))

(declare-datatypes ((V!8477 0))(
  ( (V!8478 (val!3356 Int)) )
))
(declare-datatypes ((ValueCell!2968 0))(
  ( (ValueCellFull!2968 (v!5469 V!8477)) (EmptyCell!2968) )
))
(declare-datatypes ((array!12599 0))(
  ( (array!12600 (arr!5964 (Array (_ BitVec 32) ValueCell!2968)) (size!6313 (_ BitVec 32))) )
))
(declare-datatypes ((array!12601 0))(
  ( (array!12602 (arr!5965 (Array (_ BitVec 32) (_ BitVec 64))) (size!6314 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3836 0))(
  ( (LongMapFixedSize!3837 (defaultEntry!4796 Int) (mask!11122 (_ BitVec 32)) (extraKeys!4533 (_ BitVec 32)) (zeroValue!4637 V!8477) (minValue!4637 V!8477) (_size!1967 (_ BitVec 32)) (_keys!6976 array!12601) (_values!4779 array!12599) (_vacant!1967 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3836)

(declare-datatypes ((SeekEntryResult!1184 0))(
  ( (MissingZero!1184 (index!6906 (_ BitVec 32))) (Found!1184 (index!6907 (_ BitVec 32))) (Intermediate!1184 (undefined!1996 Bool) (index!6908 (_ BitVec 32)) (x!25122 (_ BitVec 32))) (Undefined!1184) (MissingVacant!1184 (index!6909 (_ BitVec 32))) )
))
(declare-fun lt!131165 () SeekEntryResult!1184)

(assert (=> b!260125 (= res!127144 (= (select (arr!5965 (_keys!6976 thiss!1504)) (index!6906 lt!131165)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24788 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24788 (= call!24792 (arrayContainsKey!0 (_keys!6976 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11285 () Bool)

(declare-fun mapRes!11285 () Bool)

(declare-fun tp!23605 () Bool)

(declare-fun e!168602 () Bool)

(assert (=> mapNonEmpty!11285 (= mapRes!11285 (and tp!23605 e!168602))))

(declare-fun mapKey!11285 () (_ BitVec 32))

(declare-fun mapRest!11285 () (Array (_ BitVec 32) ValueCell!2968))

(declare-fun mapValue!11285 () ValueCell!2968)

(assert (=> mapNonEmpty!11285 (= (arr!5964 (_values!4779 thiss!1504)) (store mapRest!11285 mapKey!11285 mapValue!11285))))

(declare-fun b!260127 () Bool)

(declare-fun e!168600 () Bool)

(declare-fun e!168592 () Bool)

(assert (=> b!260127 (= e!168600 (not e!168592))))

(declare-fun res!127147 () Bool)

(assert (=> b!260127 (=> res!127147 e!168592)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!260127 (= res!127147 (not (validMask!0 (mask!11122 thiss!1504))))))

(declare-fun lt!131167 () array!12601)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12601 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260127 (= (arrayCountValidKeys!0 lt!131167 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!8092 0))(
  ( (Unit!8093) )
))
(declare-fun lt!131170 () Unit!8092)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12601 (_ BitVec 32)) Unit!8092)

(assert (=> b!260127 (= lt!131170 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131167 index!297))))

(assert (=> b!260127 (arrayContainsKey!0 lt!131167 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131164 () Unit!8092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12601 (_ BitVec 64) (_ BitVec 32)) Unit!8092)

(assert (=> b!260127 (= lt!131164 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131167 key!932 index!297))))

(declare-datatypes ((tuple2!4950 0))(
  ( (tuple2!4951 (_1!2486 (_ BitVec 64)) (_2!2486 V!8477)) )
))
(declare-datatypes ((List!3828 0))(
  ( (Nil!3825) (Cons!3824 (h!4488 tuple2!4950) (t!8897 List!3828)) )
))
(declare-datatypes ((ListLongMap!3863 0))(
  ( (ListLongMap!3864 (toList!1947 List!3828)) )
))
(declare-fun lt!131174 () ListLongMap!3863)

(declare-fun v!346 () V!8477)

(declare-fun +!700 (ListLongMap!3863 tuple2!4950) ListLongMap!3863)

(declare-fun getCurrentListMap!1475 (array!12601 array!12599 (_ BitVec 32) (_ BitVec 32) V!8477 V!8477 (_ BitVec 32) Int) ListLongMap!3863)

(assert (=> b!260127 (= (+!700 lt!131174 (tuple2!4951 key!932 v!346)) (getCurrentListMap!1475 lt!131167 (array!12600 (store (arr!5964 (_values!4779 thiss!1504)) index!297 (ValueCellFull!2968 v!346)) (size!6313 (_values!4779 thiss!1504))) (mask!11122 thiss!1504) (extraKeys!4533 thiss!1504) (zeroValue!4637 thiss!1504) (minValue!4637 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4796 thiss!1504)))))

(declare-fun lt!131163 () Unit!8092)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!110 (array!12601 array!12599 (_ BitVec 32) (_ BitVec 32) V!8477 V!8477 (_ BitVec 32) (_ BitVec 64) V!8477 Int) Unit!8092)

(assert (=> b!260127 (= lt!131163 (lemmaAddValidKeyToArrayThenAddPairToListMap!110 (_keys!6976 thiss!1504) (_values!4779 thiss!1504) (mask!11122 thiss!1504) (extraKeys!4533 thiss!1504) (zeroValue!4637 thiss!1504) (minValue!4637 thiss!1504) index!297 key!932 v!346 (defaultEntry!4796 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12601 (_ BitVec 32)) Bool)

(assert (=> b!260127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131167 (mask!11122 thiss!1504))))

(declare-fun lt!131166 () Unit!8092)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12601 (_ BitVec 32) (_ BitVec 32)) Unit!8092)

(assert (=> b!260127 (= lt!131166 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6976 thiss!1504) index!297 (mask!11122 thiss!1504)))))

(assert (=> b!260127 (= (arrayCountValidKeys!0 lt!131167 #b00000000000000000000000000000000 (size!6314 (_keys!6976 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6976 thiss!1504) #b00000000000000000000000000000000 (size!6314 (_keys!6976 thiss!1504)))))))

(declare-fun lt!131172 () Unit!8092)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12601 (_ BitVec 32) (_ BitVec 64)) Unit!8092)

(assert (=> b!260127 (= lt!131172 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6976 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3829 0))(
  ( (Nil!3826) (Cons!3825 (h!4489 (_ BitVec 64)) (t!8898 List!3829)) )
))
(declare-fun arrayNoDuplicates!0 (array!12601 (_ BitVec 32) List!3829) Bool)

(assert (=> b!260127 (arrayNoDuplicates!0 lt!131167 #b00000000000000000000000000000000 Nil!3826)))

(assert (=> b!260127 (= lt!131167 (array!12602 (store (arr!5965 (_keys!6976 thiss!1504)) index!297 key!932) (size!6314 (_keys!6976 thiss!1504))))))

(declare-fun lt!131176 () Unit!8092)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12601 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3829) Unit!8092)

(assert (=> b!260127 (= lt!131176 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6976 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3826))))

(declare-fun lt!131169 () Unit!8092)

(declare-fun e!168597 () Unit!8092)

(assert (=> b!260127 (= lt!131169 e!168597)))

(declare-fun c!44183 () Bool)

(assert (=> b!260127 (= c!44183 (arrayContainsKey!0 (_keys!6976 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260128 () Bool)

(declare-fun res!127145 () Bool)

(declare-fun e!168593 () Bool)

(assert (=> b!260128 (=> (not res!127145) (not e!168593))))

(assert (=> b!260128 (= res!127145 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!11285 () Bool)

(assert (=> mapIsEmpty!11285 mapRes!11285))

(declare-fun b!260129 () Bool)

(declare-fun e!168591 () Bool)

(assert (=> b!260129 (= e!168593 e!168591)))

(declare-fun res!127146 () Bool)

(assert (=> b!260129 (=> (not res!127146) (not e!168591))))

(assert (=> b!260129 (= res!127146 (or (= lt!131165 (MissingZero!1184 index!297)) (= lt!131165 (MissingVacant!1184 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12601 (_ BitVec 32)) SeekEntryResult!1184)

(assert (=> b!260129 (= lt!131165 (seekEntryOrOpen!0 key!932 (_keys!6976 thiss!1504) (mask!11122 thiss!1504)))))

(declare-fun bm!24789 () Bool)

(declare-fun c!44186 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24789 (= call!24791 (inRange!0 (ite c!44186 (index!6906 lt!131165) (index!6909 lt!131165)) (mask!11122 thiss!1504)))))

(declare-fun b!260130 () Bool)

(declare-fun e!168603 () Unit!8092)

(declare-fun lt!131168 () Unit!8092)

(assert (=> b!260130 (= e!168603 lt!131168)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!446 (array!12601 array!12599 (_ BitVec 32) (_ BitVec 32) V!8477 V!8477 (_ BitVec 64) Int) Unit!8092)

(assert (=> b!260130 (= lt!131168 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!446 (_keys!6976 thiss!1504) (_values!4779 thiss!1504) (mask!11122 thiss!1504) (extraKeys!4533 thiss!1504) (zeroValue!4637 thiss!1504) (minValue!4637 thiss!1504) key!932 (defaultEntry!4796 thiss!1504)))))

(assert (=> b!260130 (= c!44186 (is-MissingZero!1184 lt!131165))))

(assert (=> b!260130 e!168594))

(declare-fun b!260131 () Bool)

(declare-fun c!44184 () Bool)

(assert (=> b!260131 (= c!44184 (is-MissingVacant!1184 lt!131165))))

(declare-fun e!168599 () Bool)

(assert (=> b!260131 (= e!168594 e!168599)))

(declare-fun b!260132 () Bool)

(declare-fun tp_is_empty!6623 () Bool)

(assert (=> b!260132 (= e!168602 tp_is_empty!6623)))

(declare-fun b!260133 () Bool)

(declare-fun e!168601 () Bool)

(declare-fun e!168604 () Bool)

(assert (=> b!260133 (= e!168601 (and e!168604 mapRes!11285))))

(declare-fun condMapEmpty!11285 () Bool)

(declare-fun mapDefault!11285 () ValueCell!2968)

