; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16288 () Bool)

(assert start!16288)

(declare-fun b!162519 () Bool)

(declare-fun b_free!3749 () Bool)

(declare-fun b_next!3749 () Bool)

(assert (=> b!162519 (= b_free!3749 (not b_next!3749))))

(declare-fun tp!13816 () Bool)

(declare-fun b_and!10163 () Bool)

(assert (=> b!162519 (= tp!13816 b_and!10163)))

(declare-fun b!162512 () Bool)

(declare-fun res!76964 () Bool)

(declare-fun e!106524 () Bool)

(assert (=> b!162512 (=> (not res!76964) (not e!106524))))

(declare-datatypes ((V!4381 0))(
  ( (V!4382 (val!1820 Int)) )
))
(declare-datatypes ((ValueCell!1432 0))(
  ( (ValueCellFull!1432 (v!3685 V!4381)) (EmptyCell!1432) )
))
(declare-datatypes ((array!6181 0))(
  ( (array!6182 (arr!2935 (Array (_ BitVec 32) (_ BitVec 64))) (size!3219 (_ BitVec 32))) )
))
(declare-datatypes ((array!6183 0))(
  ( (array!6184 (arr!2936 (Array (_ BitVec 32) ValueCell!1432)) (size!3220 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1772 0))(
  ( (LongMapFixedSize!1773 (defaultEntry!3328 Int) (mask!7952 (_ BitVec 32)) (extraKeys!3069 (_ BitVec 32)) (zeroValue!3171 V!4381) (minValue!3171 V!4381) (_size!935 (_ BitVec 32)) (_keys!5129 array!6181) (_values!3311 array!6183) (_vacant!935 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2998 0))(
  ( (tuple2!2999 (_1!1510 Bool) (_2!1510 LongMapFixedSize!1772)) )
))
(declare-fun lt!82470 () tuple2!2998)

(assert (=> b!162512 (= res!76964 (_1!1510 lt!82470))))

(declare-fun mapIsEmpty!6014 () Bool)

(declare-fun mapRes!6014 () Bool)

(assert (=> mapIsEmpty!6014 mapRes!6014))

(declare-fun b!162513 () Bool)

(declare-fun e!106523 () Bool)

(declare-fun tp_is_empty!3551 () Bool)

(assert (=> b!162513 (= e!106523 tp_is_empty!3551)))

(declare-fun mapNonEmpty!6014 () Bool)

(declare-fun tp!13817 () Bool)

(declare-fun e!106521 () Bool)

(assert (=> mapNonEmpty!6014 (= mapRes!6014 (and tp!13817 e!106521))))

(declare-fun mapValue!6014 () ValueCell!1432)

(declare-fun mapRest!6014 () (Array (_ BitVec 32) ValueCell!1432))

(declare-fun mapKey!6014 () (_ BitVec 32))

(declare-fun thiss!1248 () LongMapFixedSize!1772)

(assert (=> mapNonEmpty!6014 (= (arr!2936 (_values!3311 thiss!1248)) (store mapRest!6014 mapKey!6014 mapValue!6014))))

(declare-fun b!162514 () Bool)

(declare-fun res!76963 () Bool)

(declare-fun e!106525 () Bool)

(assert (=> b!162514 (=> (not res!76963) (not e!106525))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162514 (= res!76963 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162515 () Bool)

(declare-fun e!106526 () Bool)

(assert (=> b!162515 (= e!106526 e!106524)))

(declare-fun res!76961 () Bool)

(assert (=> b!162515 (=> (not res!76961) (not e!106524))))

(declare-fun valid!801 (LongMapFixedSize!1772) Bool)

(assert (=> b!162515 (= res!76961 (valid!801 (_2!1510 lt!82470)))))

(declare-datatypes ((SeekEntryResult!384 0))(
  ( (MissingZero!384 (index!3704 (_ BitVec 32))) (Found!384 (index!3705 (_ BitVec 32))) (Intermediate!384 (undefined!1196 Bool) (index!3706 (_ BitVec 32)) (x!17976 (_ BitVec 32))) (Undefined!384) (MissingVacant!384 (index!3707 (_ BitVec 32))) )
))
(declare-fun lt!82471 () SeekEntryResult!384)

(declare-fun v!309 () V!4381)

(declare-fun updateHelperNewKey!81 (LongMapFixedSize!1772 (_ BitVec 64) V!4381 (_ BitVec 32)) tuple2!2998)

(assert (=> b!162515 (= lt!82470 (updateHelperNewKey!81 thiss!1248 key!828 v!309 (index!3704 lt!82471)))))

(declare-fun b!162516 () Bool)

(assert (=> b!162516 (= e!106524 false)))

(declare-fun lt!82469 () Bool)

(declare-datatypes ((tuple2!3000 0))(
  ( (tuple2!3001 (_1!1511 (_ BitVec 64)) (_2!1511 V!4381)) )
))
(declare-datatypes ((List!1985 0))(
  ( (Nil!1982) (Cons!1981 (h!2594 tuple2!3000) (t!6787 List!1985)) )
))
(declare-datatypes ((ListLongMap!1965 0))(
  ( (ListLongMap!1966 (toList!998 List!1985)) )
))
(declare-fun contains!1034 (ListLongMap!1965 (_ BitVec 64)) Bool)

(declare-fun map!1688 (LongMapFixedSize!1772) ListLongMap!1965)

(assert (=> b!162516 (= lt!82469 (contains!1034 (map!1688 (_2!1510 lt!82470)) key!828))))

(declare-fun b!162517 () Bool)

(assert (=> b!162517 (= e!106525 e!106526)))

(declare-fun res!76960 () Bool)

(assert (=> b!162517 (=> (not res!76960) (not e!106526))))

(assert (=> b!162517 (= res!76960 (and (not (is-Undefined!384 lt!82471)) (not (is-MissingVacant!384 lt!82471)) (is-MissingZero!384 lt!82471)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6181 (_ BitVec 32)) SeekEntryResult!384)

(assert (=> b!162517 (= lt!82471 (seekEntryOrOpen!0 key!828 (_keys!5129 thiss!1248) (mask!7952 thiss!1248)))))

(declare-fun res!76962 () Bool)

(assert (=> start!16288 (=> (not res!76962) (not e!106525))))

(assert (=> start!16288 (= res!76962 (valid!801 thiss!1248))))

(assert (=> start!16288 e!106525))

(declare-fun e!106522 () Bool)

(assert (=> start!16288 e!106522))

(assert (=> start!16288 true))

(assert (=> start!16288 tp_is_empty!3551))

(declare-fun b!162518 () Bool)

(declare-fun e!106520 () Bool)

(assert (=> b!162518 (= e!106520 (and e!106523 mapRes!6014))))

(declare-fun condMapEmpty!6014 () Bool)

(declare-fun mapDefault!6014 () ValueCell!1432)

