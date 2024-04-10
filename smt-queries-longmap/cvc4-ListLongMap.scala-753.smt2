; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17670 () Bool)

(assert start!17670)

(declare-fun b!176656 () Bool)

(declare-fun b_free!4361 () Bool)

(declare-fun b_next!4361 () Bool)

(assert (=> b!176656 (= b_free!4361 (not b_next!4361))))

(declare-fun tp!15777 () Bool)

(declare-fun b_and!10857 () Bool)

(assert (=> b!176656 (= tp!15777 b_and!10857)))

(declare-fun b!176654 () Bool)

(declare-fun res!83724 () Bool)

(declare-fun e!116529 () Bool)

(assert (=> b!176654 (=> (not res!83724) (not e!116529))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5157 0))(
  ( (V!5158 (val!2111 Int)) )
))
(declare-datatypes ((ValueCell!1723 0))(
  ( (ValueCellFull!1723 (v!3989 V!5157)) (EmptyCell!1723) )
))
(declare-datatypes ((array!7413 0))(
  ( (array!7414 (arr!3517 (Array (_ BitVec 32) (_ BitVec 64))) (size!3821 (_ BitVec 32))) )
))
(declare-datatypes ((array!7415 0))(
  ( (array!7416 (arr!3518 (Array (_ BitVec 32) ValueCell!1723)) (size!3822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2354 0))(
  ( (LongMapFixedSize!2355 (defaultEntry!3638 Int) (mask!8560 (_ BitVec 32)) (extraKeys!3375 (_ BitVec 32)) (zeroValue!3479 V!5157) (minValue!3479 V!5157) (_size!1226 (_ BitVec 32)) (_keys!5501 array!7413) (_values!3621 array!7415) (_vacant!1226 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2354)

(declare-datatypes ((SeekEntryResult!557 0))(
  ( (MissingZero!557 (index!4396 (_ BitVec 32))) (Found!557 (index!4397 (_ BitVec 32))) (Intermediate!557 (undefined!1369 Bool) (index!4398 (_ BitVec 32)) (x!19385 (_ BitVec 32))) (Undefined!557) (MissingVacant!557 (index!4399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7413 (_ BitVec 32)) SeekEntryResult!557)

(assert (=> b!176654 (= res!83724 (is-Undefined!557 (seekEntryOrOpen!0 key!828 (_keys!5501 thiss!1248) (mask!8560 thiss!1248))))))

(declare-fun b!176655 () Bool)

(declare-fun e!116530 () Bool)

(declare-fun tp_is_empty!4133 () Bool)

(assert (=> b!176655 (= e!116530 tp_is_empty!4133)))

(declare-fun e!116532 () Bool)

(declare-fun e!116531 () Bool)

(declare-fun array_inv!2253 (array!7413) Bool)

(declare-fun array_inv!2254 (array!7415) Bool)

(assert (=> b!176656 (= e!116531 (and tp!15777 tp_is_empty!4133 (array_inv!2253 (_keys!5501 thiss!1248)) (array_inv!2254 (_values!3621 thiss!1248)) e!116532))))

(declare-fun b!176657 () Bool)

(declare-fun res!83723 () Bool)

(assert (=> b!176657 (=> (not res!83723) (not e!116529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176657 (= res!83723 (validMask!0 (mask!8560 thiss!1248)))))

(declare-fun b!176658 () Bool)

(declare-fun res!83722 () Bool)

(assert (=> b!176658 (=> (not res!83722) (not e!116529))))

(assert (=> b!176658 (= res!83722 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176659 () Bool)

(declare-fun res!83725 () Bool)

(assert (=> b!176659 (=> (not res!83725) (not e!116529))))

(assert (=> b!176659 (= res!83725 (and (= (size!3822 (_values!3621 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8560 thiss!1248))) (= (size!3821 (_keys!5501 thiss!1248)) (size!3822 (_values!3621 thiss!1248))) (bvsge (mask!8560 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3375 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3375 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!83720 () Bool)

(assert (=> start!17670 (=> (not res!83720) (not e!116529))))

(declare-fun valid!989 (LongMapFixedSize!2354) Bool)

(assert (=> start!17670 (= res!83720 (valid!989 thiss!1248))))

(assert (=> start!17670 e!116529))

(assert (=> start!17670 e!116531))

(assert (=> start!17670 true))

(declare-fun b!176660 () Bool)

(declare-fun res!83726 () Bool)

(assert (=> b!176660 (=> (not res!83726) (not e!116529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7413 (_ BitVec 32)) Bool)

(assert (=> b!176660 (= res!83726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5501 thiss!1248) (mask!8560 thiss!1248)))))

(declare-fun b!176661 () Bool)

(declare-fun e!116534 () Bool)

(assert (=> b!176661 (= e!116534 tp_is_empty!4133)))

(declare-fun mapNonEmpty!7056 () Bool)

(declare-fun mapRes!7056 () Bool)

(declare-fun tp!15776 () Bool)

(assert (=> mapNonEmpty!7056 (= mapRes!7056 (and tp!15776 e!116534))))

(declare-fun mapKey!7056 () (_ BitVec 32))

(declare-fun mapValue!7056 () ValueCell!1723)

(declare-fun mapRest!7056 () (Array (_ BitVec 32) ValueCell!1723))

(assert (=> mapNonEmpty!7056 (= (arr!3518 (_values!3621 thiss!1248)) (store mapRest!7056 mapKey!7056 mapValue!7056))))

(declare-fun mapIsEmpty!7056 () Bool)

(assert (=> mapIsEmpty!7056 mapRes!7056))

(declare-fun b!176662 () Bool)

(declare-datatypes ((List!2239 0))(
  ( (Nil!2236) (Cons!2235 (h!2856 (_ BitVec 64)) (t!7065 List!2239)) )
))
(declare-fun arrayNoDuplicates!0 (array!7413 (_ BitVec 32) List!2239) Bool)

(assert (=> b!176662 (= e!116529 (not (arrayNoDuplicates!0 (_keys!5501 thiss!1248) #b00000000000000000000000000000000 Nil!2236)))))

(declare-fun b!176663 () Bool)

(declare-fun res!83721 () Bool)

(assert (=> b!176663 (=> (not res!83721) (not e!116529))))

(declare-datatypes ((tuple2!3286 0))(
  ( (tuple2!3287 (_1!1654 (_ BitVec 64)) (_2!1654 V!5157)) )
))
(declare-datatypes ((List!2240 0))(
  ( (Nil!2237) (Cons!2236 (h!2857 tuple2!3286) (t!7066 List!2240)) )
))
(declare-datatypes ((ListLongMap!2213 0))(
  ( (ListLongMap!2214 (toList!1122 List!2240)) )
))
(declare-fun contains!1186 (ListLongMap!2213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!774 (array!7413 array!7415 (_ BitVec 32) (_ BitVec 32) V!5157 V!5157 (_ BitVec 32) Int) ListLongMap!2213)

(assert (=> b!176663 (= res!83721 (contains!1186 (getCurrentListMap!774 (_keys!5501 thiss!1248) (_values!3621 thiss!1248) (mask!8560 thiss!1248) (extraKeys!3375 thiss!1248) (zeroValue!3479 thiss!1248) (minValue!3479 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3638 thiss!1248)) key!828))))

(declare-fun b!176664 () Bool)

(assert (=> b!176664 (= e!116532 (and e!116530 mapRes!7056))))

(declare-fun condMapEmpty!7056 () Bool)

(declare-fun mapDefault!7056 () ValueCell!1723)

