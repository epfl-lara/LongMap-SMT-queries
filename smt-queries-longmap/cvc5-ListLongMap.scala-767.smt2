; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18070 () Bool)

(assert start!18070)

(declare-fun b!179938 () Bool)

(declare-fun b_free!4441 () Bool)

(declare-fun b_next!4441 () Bool)

(assert (=> b!179938 (= b_free!4441 (not b_next!4441))))

(declare-fun tp!16054 () Bool)

(declare-fun b_and!10975 () Bool)

(assert (=> b!179938 (= tp!16054 b_and!10975)))

(declare-fun e!118506 () Bool)

(declare-fun e!118505 () Bool)

(declare-fun tp_is_empty!4213 () Bool)

(declare-datatypes ((V!5265 0))(
  ( (V!5266 (val!2151 Int)) )
))
(declare-datatypes ((ValueCell!1763 0))(
  ( (ValueCellFull!1763 (v!4040 V!5265)) (EmptyCell!1763) )
))
(declare-datatypes ((array!7595 0))(
  ( (array!7596 (arr!3597 (Array (_ BitVec 32) (_ BitVec 64))) (size!3905 (_ BitVec 32))) )
))
(declare-datatypes ((array!7597 0))(
  ( (array!7598 (arr!3598 (Array (_ BitVec 32) ValueCell!1763)) (size!3906 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2434 0))(
  ( (LongMapFixedSize!2435 (defaultEntry!3693 Int) (mask!8686 (_ BitVec 32)) (extraKeys!3430 (_ BitVec 32)) (zeroValue!3534 V!5265) (minValue!3534 V!5265) (_size!1266 (_ BitVec 32)) (_keys!5584 array!7595) (_values!3676 array!7597) (_vacant!1266 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2434)

(declare-fun array_inv!2315 (array!7595) Bool)

(declare-fun array_inv!2316 (array!7597) Bool)

(assert (=> b!179938 (= e!118505 (and tp!16054 tp_is_empty!4213 (array_inv!2315 (_keys!5584 thiss!1248)) (array_inv!2316 (_values!3676 thiss!1248)) e!118506))))

(declare-fun b!179939 () Bool)

(declare-datatypes ((Unit!5472 0))(
  ( (Unit!5473) )
))
(declare-fun e!118501 () Unit!5472)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!139 (array!7595 array!7597 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 64) Int) Unit!5472)

(assert (=> b!179939 (= e!118501 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!139 (_keys!5584 thiss!1248) (_values!3676 thiss!1248) (mask!8686 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) key!828 (defaultEntry!3693 thiss!1248)))))

(declare-fun b!179940 () Bool)

(declare-fun res!85246 () Bool)

(declare-fun e!118502 () Bool)

(assert (=> b!179940 (=> (not res!85246) (not e!118502))))

(assert (=> b!179940 (= res!85246 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179941 () Bool)

(declare-fun e!118504 () Bool)

(assert (=> b!179941 (= e!118504 tp_is_empty!4213)))

(declare-fun b!179942 () Bool)

(declare-fun Unit!5474 () Unit!5472)

(assert (=> b!179942 (= e!118501 Unit!5474)))

(declare-fun lt!88852 () Unit!5472)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!138 (array!7595 array!7597 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 64) Int) Unit!5472)

(assert (=> b!179942 (= lt!88852 (lemmaInListMapThenSeekEntryOrOpenFindsIt!138 (_keys!5584 thiss!1248) (_values!3676 thiss!1248) (mask!8686 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) key!828 (defaultEntry!3693 thiss!1248)))))

(assert (=> b!179942 false))

(declare-fun mapNonEmpty!7213 () Bool)

(declare-fun mapRes!7213 () Bool)

(declare-fun tp!16053 () Bool)

(assert (=> mapNonEmpty!7213 (= mapRes!7213 (and tp!16053 e!118504))))

(declare-fun mapKey!7213 () (_ BitVec 32))

(declare-fun mapValue!7213 () ValueCell!1763)

(declare-fun mapRest!7213 () (Array (_ BitVec 32) ValueCell!1763))

(assert (=> mapNonEmpty!7213 (= (arr!3598 (_values!3676 thiss!1248)) (store mapRest!7213 mapKey!7213 mapValue!7213))))

(declare-fun res!85244 () Bool)

(assert (=> start!18070 (=> (not res!85244) (not e!118502))))

(declare-fun valid!1014 (LongMapFixedSize!2434) Bool)

(assert (=> start!18070 (= res!85244 (valid!1014 thiss!1248))))

(assert (=> start!18070 e!118502))

(assert (=> start!18070 e!118505))

(assert (=> start!18070 true))

(declare-fun mapIsEmpty!7213 () Bool)

(assert (=> mapIsEmpty!7213 mapRes!7213))

(declare-fun b!179943 () Bool)

(assert (=> b!179943 (= e!118502 false)))

(declare-datatypes ((tuple2!3342 0))(
  ( (tuple2!3343 (_1!1682 (_ BitVec 64)) (_2!1682 V!5265)) )
))
(declare-datatypes ((List!2285 0))(
  ( (Nil!2282) (Cons!2281 (h!2906 tuple2!3342) (t!7133 List!2285)) )
))
(declare-datatypes ((ListLongMap!2269 0))(
  ( (ListLongMap!2270 (toList!1150 List!2285)) )
))
(declare-fun lt!88851 () ListLongMap!2269)

(declare-fun map!1927 (LongMapFixedSize!2434) ListLongMap!2269)

(assert (=> b!179943 (= lt!88851 (map!1927 thiss!1248))))

(declare-fun lt!88853 () Unit!5472)

(assert (=> b!179943 (= lt!88853 e!118501)))

(declare-fun c!32240 () Bool)

(declare-fun contains!1226 (ListLongMap!2269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!802 (array!7595 array!7597 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 32) Int) ListLongMap!2269)

(assert (=> b!179943 (= c!32240 (contains!1226 (getCurrentListMap!802 (_keys!5584 thiss!1248) (_values!3676 thiss!1248) (mask!8686 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3693 thiss!1248)) key!828))))

(declare-fun b!179944 () Bool)

(declare-fun res!85245 () Bool)

(assert (=> b!179944 (=> (not res!85245) (not e!118502))))

(declare-datatypes ((SeekEntryResult!586 0))(
  ( (MissingZero!586 (index!4512 (_ BitVec 32))) (Found!586 (index!4513 (_ BitVec 32))) (Intermediate!586 (undefined!1398 Bool) (index!4514 (_ BitVec 32)) (x!19668 (_ BitVec 32))) (Undefined!586) (MissingVacant!586 (index!4515 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7595 (_ BitVec 32)) SeekEntryResult!586)

(assert (=> b!179944 (= res!85245 (is-Undefined!586 (seekEntryOrOpen!0 key!828 (_keys!5584 thiss!1248) (mask!8686 thiss!1248))))))

(declare-fun b!179945 () Bool)

(declare-fun e!118503 () Bool)

(assert (=> b!179945 (= e!118506 (and e!118503 mapRes!7213))))

(declare-fun condMapEmpty!7213 () Bool)

(declare-fun mapDefault!7213 () ValueCell!1763)

