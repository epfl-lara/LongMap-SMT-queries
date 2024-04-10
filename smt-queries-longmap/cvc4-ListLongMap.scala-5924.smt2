; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77126 () Bool)

(assert start!77126)

(declare-fun b!900315 () Bool)

(declare-fun b_free!16049 () Bool)

(declare-fun b_next!16049 () Bool)

(assert (=> b!900315 (= b_free!16049 (not b_next!16049))))

(declare-fun tp!56235 () Bool)

(declare-fun b_and!26369 () Bool)

(assert (=> b!900315 (= tp!56235 b_and!26369)))

(declare-fun b!900308 () Bool)

(declare-fun e!503892 () Bool)

(declare-datatypes ((array!52802 0))(
  ( (array!52803 (arr!25373 (Array (_ BitVec 32) (_ BitVec 64))) (size!25832 (_ BitVec 32))) )
))
(declare-datatypes ((V!29467 0))(
  ( (V!29468 (val!9239 Int)) )
))
(declare-datatypes ((ValueCell!8707 0))(
  ( (ValueCellFull!8707 (v!11735 V!29467)) (EmptyCell!8707) )
))
(declare-datatypes ((array!52804 0))(
  ( (array!52805 (arr!25374 (Array (_ BitVec 32) ValueCell!8707)) (size!25833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4430 0))(
  ( (LongMapFixedSize!4431 (defaultEntry!5447 Int) (mask!26227 (_ BitVec 32)) (extraKeys!5172 (_ BitVec 32)) (zeroValue!5276 V!29467) (minValue!5276 V!29467) (_size!2270 (_ BitVec 32)) (_keys!10248 array!52802) (_values!5463 array!52804) (_vacant!2270 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4430)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52802 (_ BitVec 32)) Bool)

(assert (=> b!900308 (= e!503892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10248 thiss!1181) (mask!26227 thiss!1181)))))

(declare-fun mapNonEmpty!29239 () Bool)

(declare-fun mapRes!29239 () Bool)

(declare-fun tp!56234 () Bool)

(declare-fun e!503884 () Bool)

(assert (=> mapNonEmpty!29239 (= mapRes!29239 (and tp!56234 e!503884))))

(declare-fun mapKey!29239 () (_ BitVec 32))

(declare-fun mapValue!29239 () ValueCell!8707)

(declare-fun mapRest!29239 () (Array (_ BitVec 32) ValueCell!8707))

(assert (=> mapNonEmpty!29239 (= (arr!25374 (_values!5463 thiss!1181)) (store mapRest!29239 mapKey!29239 mapValue!29239))))

(declare-fun b!900310 () Bool)

(declare-fun res!608022 () Bool)

(declare-fun e!503889 () Bool)

(assert (=> b!900310 (=> (not res!608022) (not e!503889))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!900310 (= res!608022 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900311 () Bool)

(declare-fun e!503888 () Bool)

(declare-fun tp_is_empty!18377 () Bool)

(assert (=> b!900311 (= e!503888 tp_is_empty!18377)))

(declare-fun b!900312 () Bool)

(declare-fun e!503885 () Bool)

(declare-datatypes ((SeekEntryResult!8938 0))(
  ( (MissingZero!8938 (index!38123 (_ BitVec 32))) (Found!8938 (index!38124 (_ BitVec 32))) (Intermediate!8938 (undefined!9750 Bool) (index!38125 (_ BitVec 32)) (x!76707 (_ BitVec 32))) (Undefined!8938) (MissingVacant!8938 (index!38126 (_ BitVec 32))) )
))
(declare-fun lt!406758 () SeekEntryResult!8938)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900312 (= e!503885 (inRange!0 (index!38124 lt!406758) (mask!26227 thiss!1181)))))

(declare-fun b!900313 () Bool)

(declare-fun e!503890 () Bool)

(assert (=> b!900313 (= e!503890 (and e!503888 mapRes!29239))))

(declare-fun condMapEmpty!29239 () Bool)

(declare-fun mapDefault!29239 () ValueCell!8707)

