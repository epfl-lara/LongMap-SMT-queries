; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18256 () Bool)

(assert start!18256)

(declare-fun b!181434 () Bool)

(declare-fun b_free!4481 () Bool)

(declare-fun b_next!4481 () Bool)

(assert (=> b!181434 (= b_free!4481 (not b_next!4481))))

(declare-fun tp!16191 () Bool)

(declare-fun b_and!11029 () Bool)

(assert (=> b!181434 (= tp!16191 b_and!11029)))

(declare-fun b!181432 () Bool)

(declare-fun e!119503 () Bool)

(declare-datatypes ((V!5317 0))(
  ( (V!5318 (val!2171 Int)) )
))
(declare-datatypes ((ValueCell!1783 0))(
  ( (ValueCellFull!1783 (v!4067 V!5317)) (EmptyCell!1783) )
))
(declare-datatypes ((array!7685 0))(
  ( (array!7686 (arr!3637 (Array (_ BitVec 32) (_ BitVec 64))) (size!3947 (_ BitVec 32))) )
))
(declare-datatypes ((array!7687 0))(
  ( (array!7688 (arr!3638 (Array (_ BitVec 32) ValueCell!1783)) (size!3948 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2474 0))(
  ( (LongMapFixedSize!2475 (defaultEntry!3718 Int) (mask!8739 (_ BitVec 32)) (extraKeys!3455 (_ BitVec 32)) (zeroValue!3559 V!5317) (minValue!3559 V!5317) (_size!1286 (_ BitVec 32)) (_keys!5620 array!7685) (_values!3701 array!7687) (_vacant!1286 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2474)

(assert (=> b!181432 (= e!119503 (and (= (size!3948 (_values!3701 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8739 thiss!1248))) (= (size!3947 (_keys!5620 thiss!1248)) (size!3948 (_values!3701 thiss!1248))) (bvslt (mask!8739 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181433 () Bool)

(declare-fun res!85904 () Bool)

(assert (=> b!181433 (=> (not res!85904) (not e!119503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181433 (= res!85904 (validMask!0 (mask!8739 thiss!1248)))))

(declare-fun e!119505 () Bool)

(declare-fun tp_is_empty!4253 () Bool)

(declare-fun e!119506 () Bool)

(declare-fun array_inv!2343 (array!7685) Bool)

(declare-fun array_inv!2344 (array!7687) Bool)

(assert (=> b!181434 (= e!119506 (and tp!16191 tp_is_empty!4253 (array_inv!2343 (_keys!5620 thiss!1248)) (array_inv!2344 (_values!3701 thiss!1248)) e!119505))))

(declare-fun b!181435 () Bool)

(declare-fun res!85903 () Bool)

(assert (=> b!181435 (=> (not res!85903) (not e!119503))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3386 0))(
  ( (tuple2!3387 (_1!1704 (_ BitVec 64)) (_2!1704 V!5317)) )
))
(declare-datatypes ((List!2307 0))(
  ( (Nil!2304) (Cons!2303 (h!2930 tuple2!3386) (t!7161 List!2307)) )
))
(declare-datatypes ((ListLongMap!2303 0))(
  ( (ListLongMap!2304 (toList!1167 List!2307)) )
))
(declare-fun contains!1247 (ListLongMap!2303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!815 (array!7685 array!7687 (_ BitVec 32) (_ BitVec 32) V!5317 V!5317 (_ BitVec 32) Int) ListLongMap!2303)

(assert (=> b!181435 (= res!85903 (contains!1247 (getCurrentListMap!815 (_keys!5620 thiss!1248) (_values!3701 thiss!1248) (mask!8739 thiss!1248) (extraKeys!3455 thiss!1248) (zeroValue!3559 thiss!1248) (minValue!3559 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3718 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7290 () Bool)

(declare-fun mapRes!7290 () Bool)

(assert (=> mapIsEmpty!7290 mapRes!7290))

(declare-fun mapNonEmpty!7290 () Bool)

(declare-fun tp!16190 () Bool)

(declare-fun e!119500 () Bool)

(assert (=> mapNonEmpty!7290 (= mapRes!7290 (and tp!16190 e!119500))))

(declare-fun mapRest!7290 () (Array (_ BitVec 32) ValueCell!1783))

(declare-fun mapKey!7290 () (_ BitVec 32))

(declare-fun mapValue!7290 () ValueCell!1783)

(assert (=> mapNonEmpty!7290 (= (arr!3638 (_values!3701 thiss!1248)) (store mapRest!7290 mapKey!7290 mapValue!7290))))

(declare-fun b!181436 () Bool)

(assert (=> b!181436 (= e!119500 tp_is_empty!4253)))

(declare-fun b!181437 () Bool)

(declare-fun e!119501 () Bool)

(assert (=> b!181437 (= e!119501 e!119503)))

(declare-fun res!85900 () Bool)

(assert (=> b!181437 (=> (not res!85900) (not e!119503))))

(declare-datatypes ((SeekEntryResult!601 0))(
  ( (MissingZero!601 (index!4574 (_ BitVec 32))) (Found!601 (index!4575 (_ BitVec 32))) (Intermediate!601 (undefined!1413 Bool) (index!4576 (_ BitVec 32)) (x!19805 (_ BitVec 32))) (Undefined!601) (MissingVacant!601 (index!4577 (_ BitVec 32))) )
))
(declare-fun lt!89688 () SeekEntryResult!601)

(assert (=> b!181437 (= res!85900 (and (not (is-Undefined!601 lt!89688)) (not (is-MissingVacant!601 lt!89688)) (not (is-MissingZero!601 lt!89688)) (is-Found!601 lt!89688)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7685 (_ BitVec 32)) SeekEntryResult!601)

(assert (=> b!181437 (= lt!89688 (seekEntryOrOpen!0 key!828 (_keys!5620 thiss!1248) (mask!8739 thiss!1248)))))

(declare-fun b!181439 () Bool)

(declare-fun res!85902 () Bool)

(assert (=> b!181439 (=> (not res!85902) (not e!119501))))

(assert (=> b!181439 (= res!85902 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181440 () Bool)

(declare-fun e!119502 () Bool)

(assert (=> b!181440 (= e!119505 (and e!119502 mapRes!7290))))

(declare-fun condMapEmpty!7290 () Bool)

(declare-fun mapDefault!7290 () ValueCell!1783)

