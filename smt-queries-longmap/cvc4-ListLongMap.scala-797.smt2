; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19138 () Bool)

(assert start!19138)

(declare-fun b!188332 () Bool)

(declare-fun b_free!4625 () Bool)

(declare-fun b_next!4625 () Bool)

(assert (=> b!188332 (= b_free!4625 (not b_next!4625))))

(declare-fun tp!16695 () Bool)

(declare-fun b_and!11255 () Bool)

(assert (=> b!188332 (= tp!16695 b_and!11255)))

(declare-fun res!89032 () Bool)

(declare-fun e!123955 () Bool)

(assert (=> start!19138 (=> (not res!89032) (not e!123955))))

(declare-datatypes ((V!5509 0))(
  ( (V!5510 (val!2243 Int)) )
))
(declare-datatypes ((ValueCell!1855 0))(
  ( (ValueCellFull!1855 (v!4160 V!5509)) (EmptyCell!1855) )
))
(declare-datatypes ((array!8015 0))(
  ( (array!8016 (arr!3781 (Array (_ BitVec 32) (_ BitVec 64))) (size!4101 (_ BitVec 32))) )
))
(declare-datatypes ((array!8017 0))(
  ( (array!8018 (arr!3782 (Array (_ BitVec 32) ValueCell!1855)) (size!4102 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2618 0))(
  ( (LongMapFixedSize!2619 (defaultEntry!3841 Int) (mask!9004 (_ BitVec 32)) (extraKeys!3578 (_ BitVec 32)) (zeroValue!3682 V!5509) (minValue!3682 V!5509) (_size!1358 (_ BitVec 32)) (_keys!5800 array!8015) (_values!3824 array!8017) (_vacant!1358 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2618)

(declare-fun valid!1078 (LongMapFixedSize!2618) Bool)

(assert (=> start!19138 (= res!89032 (valid!1078 thiss!1248))))

(assert (=> start!19138 e!123955))

(declare-fun e!123957 () Bool)

(assert (=> start!19138 e!123957))

(assert (=> start!19138 true))

(declare-fun mapNonEmpty!7579 () Bool)

(declare-fun mapRes!7579 () Bool)

(declare-fun tp!16696 () Bool)

(declare-fun e!123949 () Bool)

(assert (=> mapNonEmpty!7579 (= mapRes!7579 (and tp!16696 e!123949))))

(declare-fun mapRest!7579 () (Array (_ BitVec 32) ValueCell!1855))

(declare-fun mapKey!7579 () (_ BitVec 32))

(declare-fun mapValue!7579 () ValueCell!1855)

(assert (=> mapNonEmpty!7579 (= (arr!3782 (_values!3824 thiss!1248)) (store mapRest!7579 mapKey!7579 mapValue!7579))))

(declare-fun b!188330 () Bool)

(declare-fun res!89034 () Bool)

(assert (=> b!188330 (=> (not res!89034) (not e!123955))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!188330 (= res!89034 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188331 () Bool)

(declare-fun tp_is_empty!4397 () Bool)

(assert (=> b!188331 (= e!123949 tp_is_empty!4397)))

(declare-fun e!123948 () Bool)

(declare-fun array_inv!2449 (array!8015) Bool)

(declare-fun array_inv!2450 (array!8017) Bool)

(assert (=> b!188332 (= e!123957 (and tp!16695 tp_is_empty!4397 (array_inv!2449 (_keys!5800 thiss!1248)) (array_inv!2450 (_values!3824 thiss!1248)) e!123948))))

(declare-fun b!188333 () Bool)

(declare-datatypes ((Unit!5679 0))(
  ( (Unit!5680) )
))
(declare-fun e!123952 () Unit!5679)

(declare-fun lt!93195 () Unit!5679)

(assert (=> b!188333 (= e!123952 lt!93195)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5509 V!5509 (_ BitVec 64) Int) Unit!5679)

(assert (=> b!188333 (= lt!93195 (lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (_keys!5800 thiss!1248) (_values!3824 thiss!1248) (mask!9004 thiss!1248) (extraKeys!3578 thiss!1248) (zeroValue!3682 thiss!1248) (minValue!3682 thiss!1248) key!828 (defaultEntry!3841 thiss!1248)))))

(declare-fun res!89031 () Bool)

(declare-datatypes ((SeekEntryResult!654 0))(
  ( (MissingZero!654 (index!4786 (_ BitVec 32))) (Found!654 (index!4787 (_ BitVec 32))) (Intermediate!654 (undefined!1466 Bool) (index!4788 (_ BitVec 32)) (x!20340 (_ BitVec 32))) (Undefined!654) (MissingVacant!654 (index!4789 (_ BitVec 32))) )
))
(declare-fun lt!93197 () SeekEntryResult!654)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188333 (= res!89031 (inRange!0 (index!4787 lt!93197) (mask!9004 thiss!1248)))))

(declare-fun e!123953 () Bool)

(assert (=> b!188333 (=> (not res!89031) (not e!123953))))

(assert (=> b!188333 e!123953))

(declare-fun b!188334 () Bool)

(declare-fun e!123956 () Bool)

(declare-fun e!123950 () Bool)

(assert (=> b!188334 (= e!123956 e!123950)))

(declare-fun res!89030 () Bool)

(assert (=> b!188334 (=> (not res!89030) (not e!123950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188334 (= res!89030 (validMask!0 (mask!9004 thiss!1248)))))

(declare-fun lt!93196 () Unit!5679)

(assert (=> b!188334 (= lt!93196 e!123952)))

(declare-fun c!33845 () Bool)

(declare-datatypes ((tuple2!3490 0))(
  ( (tuple2!3491 (_1!1756 (_ BitVec 64)) (_2!1756 V!5509)) )
))
(declare-datatypes ((List!2390 0))(
  ( (Nil!2387) (Cons!2386 (h!3023 tuple2!3490) (t!7286 List!2390)) )
))
(declare-datatypes ((ListLongMap!2407 0))(
  ( (ListLongMap!2408 (toList!1219 List!2390)) )
))
(declare-fun contains!1323 (ListLongMap!2407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!867 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5509 V!5509 (_ BitVec 32) Int) ListLongMap!2407)

(assert (=> b!188334 (= c!33845 (contains!1323 (getCurrentListMap!867 (_keys!5800 thiss!1248) (_values!3824 thiss!1248) (mask!9004 thiss!1248) (extraKeys!3578 thiss!1248) (zeroValue!3682 thiss!1248) (minValue!3682 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3841 thiss!1248)) key!828))))

(declare-fun b!188335 () Bool)

(assert (=> b!188335 (= e!123953 (= (select (arr!3781 (_keys!5800 thiss!1248)) (index!4787 lt!93197)) key!828))))

(declare-fun b!188336 () Bool)

(assert (=> b!188336 (= e!123955 e!123956)))

(declare-fun res!89033 () Bool)

(assert (=> b!188336 (=> (not res!89033) (not e!123956))))

(assert (=> b!188336 (= res!89033 (and (not (is-Undefined!654 lt!93197)) (not (is-MissingVacant!654 lt!93197)) (not (is-MissingZero!654 lt!93197)) (is-Found!654 lt!93197)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8015 (_ BitVec 32)) SeekEntryResult!654)

(assert (=> b!188336 (= lt!93197 (seekEntryOrOpen!0 key!828 (_keys!5800 thiss!1248) (mask!9004 thiss!1248)))))

(declare-fun mapIsEmpty!7579 () Bool)

(assert (=> mapIsEmpty!7579 mapRes!7579))

(declare-fun b!188337 () Bool)

(declare-fun Unit!5681 () Unit!5679)

(assert (=> b!188337 (= e!123952 Unit!5681)))

(declare-fun lt!93194 () Unit!5679)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5509 V!5509 (_ BitVec 64) Int) Unit!5679)

(assert (=> b!188337 (= lt!93194 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (_keys!5800 thiss!1248) (_values!3824 thiss!1248) (mask!9004 thiss!1248) (extraKeys!3578 thiss!1248) (zeroValue!3682 thiss!1248) (minValue!3682 thiss!1248) key!828 (defaultEntry!3841 thiss!1248)))))

(assert (=> b!188337 false))

(declare-fun b!188338 () Bool)

(declare-fun e!123951 () Bool)

(assert (=> b!188338 (= e!123948 (and e!123951 mapRes!7579))))

(declare-fun condMapEmpty!7579 () Bool)

(declare-fun mapDefault!7579 () ValueCell!1855)

