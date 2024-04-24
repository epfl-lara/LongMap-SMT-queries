; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16066 () Bool)

(assert start!16066)

(declare-fun b!159479 () Bool)

(declare-fun b_free!3523 () Bool)

(declare-fun b_next!3523 () Bool)

(assert (=> b!159479 (= b_free!3523 (not b_next!3523))))

(declare-fun tp!13138 () Bool)

(declare-fun b_and!9951 () Bool)

(assert (=> b!159479 (= tp!13138 b_and!9951)))

(declare-fun b!159476 () Bool)

(declare-fun res!75347 () Bool)

(declare-fun e!104377 () Bool)

(assert (=> b!159476 (=> (not res!75347) (not e!104377))))

(declare-datatypes ((V!4081 0))(
  ( (V!4082 (val!1707 Int)) )
))
(declare-datatypes ((ValueCell!1319 0))(
  ( (ValueCellFull!1319 (v!3573 V!4081)) (EmptyCell!1319) )
))
(declare-datatypes ((array!5715 0))(
  ( (array!5716 (arr!2702 (Array (_ BitVec 32) (_ BitVec 64))) (size!2986 (_ BitVec 32))) )
))
(declare-datatypes ((array!5717 0))(
  ( (array!5718 (arr!2703 (Array (_ BitVec 32) ValueCell!1319)) (size!2987 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1546 0))(
  ( (LongMapFixedSize!1547 (defaultEntry!3215 Int) (mask!7765 (_ BitVec 32)) (extraKeys!2956 (_ BitVec 32)) (zeroValue!3058 V!4081) (minValue!3058 V!4081) (_size!822 (_ BitVec 32)) (_keys!5016 array!5715) (_values!3198 array!5717) (_vacant!822 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1546)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5715 (_ BitVec 32)) Bool)

(assert (=> b!159476 (= res!75347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5016 thiss!1248) (mask!7765 thiss!1248)))))

(declare-fun b!159477 () Bool)

(declare-fun res!75350 () Bool)

(assert (=> b!159477 (=> (not res!75350) (not e!104377))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159477 (= res!75350 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5675 () Bool)

(declare-fun mapRes!5675 () Bool)

(declare-fun tp!13139 () Bool)

(declare-fun e!104380 () Bool)

(assert (=> mapNonEmpty!5675 (= mapRes!5675 (and tp!13139 e!104380))))

(declare-fun mapRest!5675 () (Array (_ BitVec 32) ValueCell!1319))

(declare-fun mapKey!5675 () (_ BitVec 32))

(declare-fun mapValue!5675 () ValueCell!1319)

(assert (=> mapNonEmpty!5675 (= (arr!2703 (_values!3198 thiss!1248)) (store mapRest!5675 mapKey!5675 mapValue!5675))))

(declare-fun b!159478 () Bool)

(declare-fun res!75346 () Bool)

(assert (=> b!159478 (=> (not res!75346) (not e!104377))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!306 0))(
  ( (MissingZero!306 (index!3392 (_ BitVec 32))) (Found!306 (index!3393 (_ BitVec 32))) (Intermediate!306 (undefined!1118 Bool) (index!3394 (_ BitVec 32)) (x!17602 (_ BitVec 32))) (Undefined!306) (MissingVacant!306 (index!3395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5715 (_ BitVec 32)) SeekEntryResult!306)

(assert (=> b!159478 (= res!75346 ((_ is Undefined!306) (seekEntryOrOpen!0 key!828 (_keys!5016 thiss!1248) (mask!7765 thiss!1248))))))

(declare-fun tp_is_empty!3325 () Bool)

(declare-fun e!104381 () Bool)

(declare-fun e!104378 () Bool)

(declare-fun array_inv!1723 (array!5715) Bool)

(declare-fun array_inv!1724 (array!5717) Bool)

(assert (=> b!159479 (= e!104378 (and tp!13138 tp_is_empty!3325 (array_inv!1723 (_keys!5016 thiss!1248)) (array_inv!1724 (_values!3198 thiss!1248)) e!104381))))

(declare-fun b!159480 () Bool)

(assert (=> b!159480 (= e!104380 tp_is_empty!3325)))

(declare-fun b!159481 () Bool)

(declare-fun e!104379 () Bool)

(assert (=> b!159481 (= e!104381 (and e!104379 mapRes!5675))))

(declare-fun condMapEmpty!5675 () Bool)

(declare-fun mapDefault!5675 () ValueCell!1319)

(assert (=> b!159481 (= condMapEmpty!5675 (= (arr!2703 (_values!3198 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1319)) mapDefault!5675)))))

(declare-fun b!159482 () Bool)

(assert (=> b!159482 (= e!104379 tp_is_empty!3325)))

(declare-fun b!159483 () Bool)

(declare-fun res!75344 () Bool)

(assert (=> b!159483 (=> (not res!75344) (not e!104377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159483 (= res!75344 (validMask!0 (mask!7765 thiss!1248)))))

(declare-fun b!159484 () Bool)

(declare-fun res!75348 () Bool)

(assert (=> b!159484 (=> (not res!75348) (not e!104377))))

(assert (=> b!159484 (= res!75348 (and (= (size!2987 (_values!3198 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7765 thiss!1248))) (= (size!2986 (_keys!5016 thiss!1248)) (size!2987 (_values!3198 thiss!1248))) (bvsge (mask!7765 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2956 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2956 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5675 () Bool)

(assert (=> mapIsEmpty!5675 mapRes!5675))

(declare-fun res!75345 () Bool)

(assert (=> start!16066 (=> (not res!75345) (not e!104377))))

(declare-fun valid!744 (LongMapFixedSize!1546) Bool)

(assert (=> start!16066 (= res!75345 (valid!744 thiss!1248))))

(assert (=> start!16066 e!104377))

(assert (=> start!16066 e!104378))

(assert (=> start!16066 true))

(declare-fun b!159485 () Bool)

(assert (=> b!159485 (= e!104377 false)))

(declare-fun lt!82056 () Bool)

(declare-datatypes ((List!1888 0))(
  ( (Nil!1885) (Cons!1884 (h!2497 (_ BitVec 64)) (t!6682 List!1888)) )
))
(declare-fun arrayNoDuplicates!0 (array!5715 (_ BitVec 32) List!1888) Bool)

(assert (=> b!159485 (= lt!82056 (arrayNoDuplicates!0 (_keys!5016 thiss!1248) #b00000000000000000000000000000000 Nil!1885))))

(declare-fun b!159486 () Bool)

(declare-fun res!75349 () Bool)

(assert (=> b!159486 (=> (not res!75349) (not e!104377))))

(declare-datatypes ((tuple2!2822 0))(
  ( (tuple2!2823 (_1!1422 (_ BitVec 64)) (_2!1422 V!4081)) )
))
(declare-datatypes ((List!1889 0))(
  ( (Nil!1886) (Cons!1885 (h!2498 tuple2!2822) (t!6683 List!1889)) )
))
(declare-datatypes ((ListLongMap!1821 0))(
  ( (ListLongMap!1822 (toList!926 List!1889)) )
))
(declare-fun contains!972 (ListLongMap!1821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!593 (array!5715 array!5717 (_ BitVec 32) (_ BitVec 32) V!4081 V!4081 (_ BitVec 32) Int) ListLongMap!1821)

(assert (=> b!159486 (= res!75349 (contains!972 (getCurrentListMap!593 (_keys!5016 thiss!1248) (_values!3198 thiss!1248) (mask!7765 thiss!1248) (extraKeys!2956 thiss!1248) (zeroValue!3058 thiss!1248) (minValue!3058 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3215 thiss!1248)) key!828))))

(assert (= (and start!16066 res!75345) b!159477))

(assert (= (and b!159477 res!75350) b!159478))

(assert (= (and b!159478 res!75346) b!159486))

(assert (= (and b!159486 res!75349) b!159483))

(assert (= (and b!159483 res!75344) b!159484))

(assert (= (and b!159484 res!75348) b!159476))

(assert (= (and b!159476 res!75347) b!159485))

(assert (= (and b!159481 condMapEmpty!5675) mapIsEmpty!5675))

(assert (= (and b!159481 (not condMapEmpty!5675)) mapNonEmpty!5675))

(assert (= (and mapNonEmpty!5675 ((_ is ValueCellFull!1319) mapValue!5675)) b!159480))

(assert (= (and b!159481 ((_ is ValueCellFull!1319) mapDefault!5675)) b!159482))

(assert (= b!159479 b!159481))

(assert (= start!16066 b!159479))

(declare-fun m!191879 () Bool)

(assert (=> b!159476 m!191879))

(declare-fun m!191881 () Bool)

(assert (=> b!159485 m!191881))

(declare-fun m!191883 () Bool)

(assert (=> b!159479 m!191883))

(declare-fun m!191885 () Bool)

(assert (=> b!159479 m!191885))

(declare-fun m!191887 () Bool)

(assert (=> b!159486 m!191887))

(assert (=> b!159486 m!191887))

(declare-fun m!191889 () Bool)

(assert (=> b!159486 m!191889))

(declare-fun m!191891 () Bool)

(assert (=> mapNonEmpty!5675 m!191891))

(declare-fun m!191893 () Bool)

(assert (=> b!159478 m!191893))

(declare-fun m!191895 () Bool)

(assert (=> b!159483 m!191895))

(declare-fun m!191897 () Bool)

(assert (=> start!16066 m!191897))

(check-sat b_and!9951 (not b!159486) (not b!159476) (not b!159485) (not b!159478) (not start!16066) (not b!159479) (not b!159483) tp_is_empty!3325 (not b_next!3523) (not mapNonEmpty!5675))
(check-sat b_and!9951 (not b_next!3523))
