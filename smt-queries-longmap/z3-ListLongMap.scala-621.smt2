; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16078 () Bool)

(assert start!16078)

(declare-fun b!159485 () Bool)

(declare-fun b_free!3535 () Bool)

(declare-fun b_next!3535 () Bool)

(assert (=> b!159485 (= b_free!3535 (not b_next!3535))))

(declare-fun tp!13174 () Bool)

(declare-fun b_and!9923 () Bool)

(assert (=> b!159485 (= tp!13174 b_and!9923)))

(declare-fun b!159480 () Bool)

(declare-fun res!75354 () Bool)

(declare-fun e!104361 () Bool)

(assert (=> b!159480 (=> (not res!75354) (not e!104361))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159480 (= res!75354 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159481 () Bool)

(declare-fun res!75360 () Bool)

(assert (=> b!159481 (=> (not res!75360) (not e!104361))))

(declare-datatypes ((V!4097 0))(
  ( (V!4098 (val!1713 Int)) )
))
(declare-datatypes ((ValueCell!1325 0))(
  ( (ValueCellFull!1325 (v!3572 V!4097)) (EmptyCell!1325) )
))
(declare-datatypes ((array!5733 0))(
  ( (array!5734 (arr!2710 (Array (_ BitVec 32) (_ BitVec 64))) (size!2995 (_ BitVec 32))) )
))
(declare-datatypes ((array!5735 0))(
  ( (array!5736 (arr!2711 (Array (_ BitVec 32) ValueCell!1325)) (size!2996 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1558 0))(
  ( (LongMapFixedSize!1559 (defaultEntry!3221 Int) (mask!7774 (_ BitVec 32)) (extraKeys!2962 (_ BitVec 32)) (zeroValue!3064 V!4097) (minValue!3064 V!4097) (_size!828 (_ BitVec 32)) (_keys!5021 array!5733) (_values!3204 array!5735) (_vacant!828 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1558)

(get-info :version)

(declare-datatypes ((SeekEntryResult!321 0))(
  ( (MissingZero!321 (index!3452 (_ BitVec 32))) (Found!321 (index!3453 (_ BitVec 32))) (Intermediate!321 (undefined!1133 Bool) (index!3454 (_ BitVec 32)) (x!17632 (_ BitVec 32))) (Undefined!321) (MissingVacant!321 (index!3455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5733 (_ BitVec 32)) SeekEntryResult!321)

(assert (=> b!159481 (= res!75360 ((_ is Undefined!321) (seekEntryOrOpen!0 key!828 (_keys!5021 thiss!1248) (mask!7774 thiss!1248))))))

(declare-fun b!159482 () Bool)

(declare-fun res!75358 () Bool)

(assert (=> b!159482 (=> (not res!75358) (not e!104361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5733 (_ BitVec 32)) Bool)

(assert (=> b!159482 (= res!75358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5021 thiss!1248) (mask!7774 thiss!1248)))))

(declare-fun mapNonEmpty!5693 () Bool)

(declare-fun mapRes!5693 () Bool)

(declare-fun tp!13175 () Bool)

(declare-fun e!104360 () Bool)

(assert (=> mapNonEmpty!5693 (= mapRes!5693 (and tp!13175 e!104360))))

(declare-fun mapKey!5693 () (_ BitVec 32))

(declare-fun mapValue!5693 () ValueCell!1325)

(declare-fun mapRest!5693 () (Array (_ BitVec 32) ValueCell!1325))

(assert (=> mapNonEmpty!5693 (= (arr!2711 (_values!3204 thiss!1248)) (store mapRest!5693 mapKey!5693 mapValue!5693))))

(declare-fun b!159483 () Bool)

(declare-fun res!75355 () Bool)

(assert (=> b!159483 (=> (not res!75355) (not e!104361))))

(declare-datatypes ((tuple2!2858 0))(
  ( (tuple2!2859 (_1!1440 (_ BitVec 64)) (_2!1440 V!4097)) )
))
(declare-datatypes ((List!1910 0))(
  ( (Nil!1907) (Cons!1906 (h!2519 tuple2!2858) (t!6703 List!1910)) )
))
(declare-datatypes ((ListLongMap!1845 0))(
  ( (ListLongMap!1846 (toList!938 List!1910)) )
))
(declare-fun contains!977 (ListLongMap!1845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!588 (array!5733 array!5735 (_ BitVec 32) (_ BitVec 32) V!4097 V!4097 (_ BitVec 32) Int) ListLongMap!1845)

(assert (=> b!159483 (= res!75355 (contains!977 (getCurrentListMap!588 (_keys!5021 thiss!1248) (_values!3204 thiss!1248) (mask!7774 thiss!1248) (extraKeys!2962 thiss!1248) (zeroValue!3064 thiss!1248) (minValue!3064 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3221 thiss!1248)) key!828))))

(declare-fun b!159484 () Bool)

(declare-fun e!104364 () Bool)

(declare-fun tp_is_empty!3337 () Bool)

(assert (=> b!159484 (= e!104364 tp_is_empty!3337)))

(declare-fun e!104362 () Bool)

(declare-fun e!104363 () Bool)

(declare-fun array_inv!1739 (array!5733) Bool)

(declare-fun array_inv!1740 (array!5735) Bool)

(assert (=> b!159485 (= e!104363 (and tp!13174 tp_is_empty!3337 (array_inv!1739 (_keys!5021 thiss!1248)) (array_inv!1740 (_values!3204 thiss!1248)) e!104362))))

(declare-fun b!159486 () Bool)

(declare-fun res!75356 () Bool)

(assert (=> b!159486 (=> (not res!75356) (not e!104361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159486 (= res!75356 (validMask!0 (mask!7774 thiss!1248)))))

(declare-fun b!159487 () Bool)

(assert (=> b!159487 (= e!104361 false)))

(declare-fun lt!81834 () Bool)

(declare-datatypes ((List!1911 0))(
  ( (Nil!1908) (Cons!1907 (h!2520 (_ BitVec 64)) (t!6704 List!1911)) )
))
(declare-fun arrayNoDuplicates!0 (array!5733 (_ BitVec 32) List!1911) Bool)

(assert (=> b!159487 (= lt!81834 (arrayNoDuplicates!0 (_keys!5021 thiss!1248) #b00000000000000000000000000000000 Nil!1908))))

(declare-fun res!75359 () Bool)

(assert (=> start!16078 (=> (not res!75359) (not e!104361))))

(declare-fun valid!730 (LongMapFixedSize!1558) Bool)

(assert (=> start!16078 (= res!75359 (valid!730 thiss!1248))))

(assert (=> start!16078 e!104361))

(assert (=> start!16078 e!104363))

(assert (=> start!16078 true))

(declare-fun b!159488 () Bool)

(assert (=> b!159488 (= e!104360 tp_is_empty!3337)))

(declare-fun b!159489 () Bool)

(declare-fun res!75357 () Bool)

(assert (=> b!159489 (=> (not res!75357) (not e!104361))))

(assert (=> b!159489 (= res!75357 (and (= (size!2996 (_values!3204 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7774 thiss!1248))) (= (size!2995 (_keys!5021 thiss!1248)) (size!2996 (_values!3204 thiss!1248))) (bvsge (mask!7774 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2962 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2962 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5693 () Bool)

(assert (=> mapIsEmpty!5693 mapRes!5693))

(declare-fun b!159490 () Bool)

(assert (=> b!159490 (= e!104362 (and e!104364 mapRes!5693))))

(declare-fun condMapEmpty!5693 () Bool)

(declare-fun mapDefault!5693 () ValueCell!1325)

(assert (=> b!159490 (= condMapEmpty!5693 (= (arr!2711 (_values!3204 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1325)) mapDefault!5693)))))

(assert (= (and start!16078 res!75359) b!159480))

(assert (= (and b!159480 res!75354) b!159481))

(assert (= (and b!159481 res!75360) b!159483))

(assert (= (and b!159483 res!75355) b!159486))

(assert (= (and b!159486 res!75356) b!159489))

(assert (= (and b!159489 res!75357) b!159482))

(assert (= (and b!159482 res!75358) b!159487))

(assert (= (and b!159490 condMapEmpty!5693) mapIsEmpty!5693))

(assert (= (and b!159490 (not condMapEmpty!5693)) mapNonEmpty!5693))

(assert (= (and mapNonEmpty!5693 ((_ is ValueCellFull!1325) mapValue!5693)) b!159488))

(assert (= (and b!159490 ((_ is ValueCellFull!1325) mapDefault!5693)) b!159484))

(assert (= b!159485 b!159490))

(assert (= start!16078 b!159485))

(declare-fun m!191197 () Bool)

(assert (=> mapNonEmpty!5693 m!191197))

(declare-fun m!191199 () Bool)

(assert (=> b!159487 m!191199))

(declare-fun m!191201 () Bool)

(assert (=> start!16078 m!191201))

(declare-fun m!191203 () Bool)

(assert (=> b!159481 m!191203))

(declare-fun m!191205 () Bool)

(assert (=> b!159485 m!191205))

(declare-fun m!191207 () Bool)

(assert (=> b!159485 m!191207))

(declare-fun m!191209 () Bool)

(assert (=> b!159483 m!191209))

(assert (=> b!159483 m!191209))

(declare-fun m!191211 () Bool)

(assert (=> b!159483 m!191211))

(declare-fun m!191213 () Bool)

(assert (=> b!159486 m!191213))

(declare-fun m!191215 () Bool)

(assert (=> b!159482 m!191215))

(check-sat (not b!159485) (not b!159486) (not mapNonEmpty!5693) (not b!159483) (not b_next!3535) (not b!159487) b_and!9923 tp_is_empty!3337 (not b!159482) (not b!159481) (not start!16078))
(check-sat b_and!9923 (not b_next!3535))
