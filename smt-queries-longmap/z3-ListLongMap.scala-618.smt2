; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16058 () Bool)

(assert start!16058)

(declare-fun b!159368 () Bool)

(declare-fun b_free!3519 () Bool)

(declare-fun b_next!3519 () Bool)

(assert (=> b!159368 (= b_free!3519 (not b_next!3519))))

(declare-fun tp!13127 () Bool)

(declare-fun b_and!9933 () Bool)

(assert (=> b!159368 (= tp!13127 b_and!9933)))

(declare-fun b!159363 () Bool)

(declare-fun res!75281 () Bool)

(declare-fun e!104319 () Bool)

(assert (=> b!159363 (=> (not res!75281) (not e!104319))))

(declare-datatypes ((V!4075 0))(
  ( (V!4076 (val!1705 Int)) )
))
(declare-datatypes ((ValueCell!1317 0))(
  ( (ValueCellFull!1317 (v!3570 V!4075)) (EmptyCell!1317) )
))
(declare-datatypes ((array!5721 0))(
  ( (array!5722 (arr!2705 (Array (_ BitVec 32) (_ BitVec 64))) (size!2989 (_ BitVec 32))) )
))
(declare-datatypes ((array!5723 0))(
  ( (array!5724 (arr!2706 (Array (_ BitVec 32) ValueCell!1317)) (size!2990 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1542 0))(
  ( (LongMapFixedSize!1543 (defaultEntry!3213 Int) (mask!7761 (_ BitVec 32)) (extraKeys!2954 (_ BitVec 32)) (zeroValue!3056 V!4075) (minValue!3056 V!4075) (_size!820 (_ BitVec 32)) (_keys!5014 array!5721) (_values!3196 array!5723) (_vacant!820 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1542)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159363 (= res!75281 (validMask!0 (mask!7761 thiss!1248)))))

(declare-fun b!159364 () Bool)

(declare-fun res!75283 () Bool)

(assert (=> b!159364 (=> (not res!75283) (not e!104319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5721 (_ BitVec 32)) Bool)

(assert (=> b!159364 (= res!75283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5014 thiss!1248) (mask!7761 thiss!1248)))))

(declare-fun mapIsEmpty!5669 () Bool)

(declare-fun mapRes!5669 () Bool)

(assert (=> mapIsEmpty!5669 mapRes!5669))

(declare-fun res!75286 () Bool)

(assert (=> start!16058 (=> (not res!75286) (not e!104319))))

(declare-fun valid!722 (LongMapFixedSize!1542) Bool)

(assert (=> start!16058 (= res!75286 (valid!722 thiss!1248))))

(assert (=> start!16058 e!104319))

(declare-fun e!104318 () Bool)

(assert (=> start!16058 e!104318))

(assert (=> start!16058 true))

(declare-fun b!159365 () Bool)

(declare-fun res!75284 () Bool)

(assert (=> b!159365 (=> (not res!75284) (not e!104319))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2884 0))(
  ( (tuple2!2885 (_1!1453 (_ BitVec 64)) (_2!1453 V!4075)) )
))
(declare-datatypes ((List!1904 0))(
  ( (Nil!1901) (Cons!1900 (h!2513 tuple2!2884) (t!6706 List!1904)) )
))
(declare-datatypes ((ListLongMap!1871 0))(
  ( (ListLongMap!1872 (toList!951 List!1904)) )
))
(declare-fun contains!987 (ListLongMap!1871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!615 (array!5721 array!5723 (_ BitVec 32) (_ BitVec 32) V!4075 V!4075 (_ BitVec 32) Int) ListLongMap!1871)

(assert (=> b!159365 (= res!75284 (contains!987 (getCurrentListMap!615 (_keys!5014 thiss!1248) (_values!3196 thiss!1248) (mask!7761 thiss!1248) (extraKeys!2954 thiss!1248) (zeroValue!3056 thiss!1248) (minValue!3056 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3213 thiss!1248)) key!828))))

(declare-fun b!159366 () Bool)

(declare-fun e!104320 () Bool)

(declare-fun e!104322 () Bool)

(assert (=> b!159366 (= e!104320 (and e!104322 mapRes!5669))))

(declare-fun condMapEmpty!5669 () Bool)

(declare-fun mapDefault!5669 () ValueCell!1317)

(assert (=> b!159366 (= condMapEmpty!5669 (= (arr!2706 (_values!3196 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1317)) mapDefault!5669)))))

(declare-fun b!159367 () Bool)

(declare-fun tp_is_empty!3321 () Bool)

(assert (=> b!159367 (= e!104322 tp_is_empty!3321)))

(declare-fun array_inv!1721 (array!5721) Bool)

(declare-fun array_inv!1722 (array!5723) Bool)

(assert (=> b!159368 (= e!104318 (and tp!13127 tp_is_empty!3321 (array_inv!1721 (_keys!5014 thiss!1248)) (array_inv!1722 (_values!3196 thiss!1248)) e!104320))))

(declare-fun b!159369 () Bool)

(declare-fun res!75282 () Bool)

(assert (=> b!159369 (=> (not res!75282) (not e!104319))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!311 0))(
  ( (MissingZero!311 (index!3412 (_ BitVec 32))) (Found!311 (index!3413 (_ BitVec 32))) (Intermediate!311 (undefined!1123 Bool) (index!3414 (_ BitVec 32)) (x!17599 (_ BitVec 32))) (Undefined!311) (MissingVacant!311 (index!3415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5721 (_ BitVec 32)) SeekEntryResult!311)

(assert (=> b!159369 (= res!75282 ((_ is Undefined!311) (seekEntryOrOpen!0 key!828 (_keys!5014 thiss!1248) (mask!7761 thiss!1248))))))

(declare-fun b!159370 () Bool)

(declare-fun res!75285 () Bool)

(assert (=> b!159370 (=> (not res!75285) (not e!104319))))

(assert (=> b!159370 (= res!75285 (and (= (size!2990 (_values!3196 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7761 thiss!1248))) (= (size!2989 (_keys!5014 thiss!1248)) (size!2990 (_values!3196 thiss!1248))) (bvsge (mask!7761 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2954 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2954 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159371 () Bool)

(declare-fun res!75287 () Bool)

(assert (=> b!159371 (=> (not res!75287) (not e!104319))))

(assert (=> b!159371 (= res!75287 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159372 () Bool)

(declare-fun e!104321 () Bool)

(assert (=> b!159372 (= e!104321 tp_is_empty!3321)))

(declare-fun mapNonEmpty!5669 () Bool)

(declare-fun tp!13126 () Bool)

(assert (=> mapNonEmpty!5669 (= mapRes!5669 (and tp!13126 e!104321))))

(declare-fun mapKey!5669 () (_ BitVec 32))

(declare-fun mapValue!5669 () ValueCell!1317)

(declare-fun mapRest!5669 () (Array (_ BitVec 32) ValueCell!1317))

(assert (=> mapNonEmpty!5669 (= (arr!2706 (_values!3196 thiss!1248)) (store mapRest!5669 mapKey!5669 mapValue!5669))))

(declare-fun b!159373 () Bool)

(assert (=> b!159373 (= e!104319 false)))

(declare-fun lt!81991 () Bool)

(declare-datatypes ((List!1905 0))(
  ( (Nil!1902) (Cons!1901 (h!2514 (_ BitVec 64)) (t!6707 List!1905)) )
))
(declare-fun arrayNoDuplicates!0 (array!5721 (_ BitVec 32) List!1905) Bool)

(assert (=> b!159373 (= lt!81991 (arrayNoDuplicates!0 (_keys!5014 thiss!1248) #b00000000000000000000000000000000 Nil!1902))))

(assert (= (and start!16058 res!75286) b!159371))

(assert (= (and b!159371 res!75287) b!159369))

(assert (= (and b!159369 res!75282) b!159365))

(assert (= (and b!159365 res!75284) b!159363))

(assert (= (and b!159363 res!75281) b!159370))

(assert (= (and b!159370 res!75285) b!159364))

(assert (= (and b!159364 res!75283) b!159373))

(assert (= (and b!159366 condMapEmpty!5669) mapIsEmpty!5669))

(assert (= (and b!159366 (not condMapEmpty!5669)) mapNonEmpty!5669))

(assert (= (and mapNonEmpty!5669 ((_ is ValueCellFull!1317) mapValue!5669)) b!159372))

(assert (= (and b!159366 ((_ is ValueCellFull!1317) mapDefault!5669)) b!159367))

(assert (= b!159368 b!159366))

(assert (= start!16058 b!159368))

(declare-fun m!191657 () Bool)

(assert (=> mapNonEmpty!5669 m!191657))

(declare-fun m!191659 () Bool)

(assert (=> b!159365 m!191659))

(assert (=> b!159365 m!191659))

(declare-fun m!191661 () Bool)

(assert (=> b!159365 m!191661))

(declare-fun m!191663 () Bool)

(assert (=> b!159368 m!191663))

(declare-fun m!191665 () Bool)

(assert (=> b!159368 m!191665))

(declare-fun m!191667 () Bool)

(assert (=> start!16058 m!191667))

(declare-fun m!191669 () Bool)

(assert (=> b!159363 m!191669))

(declare-fun m!191671 () Bool)

(assert (=> b!159369 m!191671))

(declare-fun m!191673 () Bool)

(assert (=> b!159373 m!191673))

(declare-fun m!191675 () Bool)

(assert (=> b!159364 m!191675))

(check-sat b_and!9933 tp_is_empty!3321 (not b_next!3519) (not b!159369) (not b!159364) (not b!159368) (not b!159373) (not start!16058) (not b!159365) (not b!159363) (not mapNonEmpty!5669))
(check-sat b_and!9933 (not b_next!3519))
