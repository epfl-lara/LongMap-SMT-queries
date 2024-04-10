; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76748 () Bool)

(assert start!76748)

(declare-fun b!898148 () Bool)

(declare-fun b_free!16007 () Bool)

(declare-fun b_next!16007 () Bool)

(assert (=> b!898148 (= b_free!16007 (not b_next!16007))))

(declare-fun tp!56083 () Bool)

(declare-fun b_and!26299 () Bool)

(assert (=> b!898148 (= tp!56083 b_and!26299)))

(declare-fun mapIsEmpty!29151 () Bool)

(declare-fun mapRes!29151 () Bool)

(assert (=> mapIsEmpty!29151 mapRes!29151))

(declare-fun mapNonEmpty!29151 () Bool)

(declare-fun tp!56084 () Bool)

(declare-fun e!502344 () Bool)

(assert (=> mapNonEmpty!29151 (= mapRes!29151 (and tp!56084 e!502344))))

(declare-datatypes ((V!29411 0))(
  ( (V!29412 (val!9218 Int)) )
))
(declare-datatypes ((ValueCell!8686 0))(
  ( (ValueCellFull!8686 (v!11708 V!29411)) (EmptyCell!8686) )
))
(declare-fun mapValue!29151 () ValueCell!8686)

(declare-fun mapKey!29151 () (_ BitVec 32))

(declare-datatypes ((array!52704 0))(
  ( (array!52705 (arr!25331 (Array (_ BitVec 32) (_ BitVec 64))) (size!25786 (_ BitVec 32))) )
))
(declare-datatypes ((array!52706 0))(
  ( (array!52707 (arr!25332 (Array (_ BitVec 32) ValueCell!8686)) (size!25787 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4388 0))(
  ( (LongMapFixedSize!4389 (defaultEntry!5406 Int) (mask!26123 (_ BitVec 32)) (extraKeys!5120 (_ BitVec 32)) (zeroValue!5224 V!29411) (minValue!5224 V!29411) (_size!2249 (_ BitVec 32)) (_keys!10176 array!52704) (_values!5411 array!52706) (_vacant!2249 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4388)

(declare-fun mapRest!29151 () (Array (_ BitVec 32) ValueCell!8686))

(assert (=> mapNonEmpty!29151 (= (arr!25332 (_values!5411 thiss!1181)) (store mapRest!29151 mapKey!29151 mapValue!29151))))

(declare-fun b!898137 () Bool)

(declare-fun res!607014 () Bool)

(declare-fun e!502346 () Bool)

(assert (=> b!898137 (=> res!607014 e!502346)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52704 (_ BitVec 32)) Bool)

(assert (=> b!898137 (= res!607014 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10176 thiss!1181) (mask!26123 thiss!1181))))))

(declare-fun b!898138 () Bool)

(declare-datatypes ((SeekEntryResult!8921 0))(
  ( (MissingZero!8921 (index!38055 (_ BitVec 32))) (Found!8921 (index!38056 (_ BitVec 32))) (Intermediate!8921 (undefined!9733 Bool) (index!38057 (_ BitVec 32)) (x!76534 (_ BitVec 32))) (Undefined!8921) (MissingVacant!8921 (index!38058 (_ BitVec 32))) )
))
(declare-fun lt!405414 () SeekEntryResult!8921)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898138 (= e!502346 (validKeyInArray!0 (select (arr!25331 (_keys!10176 thiss!1181)) (index!38056 lt!405414))))))

(declare-fun b!898139 () Bool)

(declare-fun res!607016 () Bool)

(assert (=> b!898139 (=> res!607016 e!502346)))

(declare-datatypes ((List!17836 0))(
  ( (Nil!17833) (Cons!17832 (h!18974 (_ BitVec 64)) (t!25175 List!17836)) )
))
(declare-fun arrayNoDuplicates!0 (array!52704 (_ BitVec 32) List!17836) Bool)

(assert (=> b!898139 (= res!607016 (not (arrayNoDuplicates!0 (_keys!10176 thiss!1181) #b00000000000000000000000000000000 Nil!17833)))))

(declare-fun b!898140 () Bool)

(declare-fun e!502351 () Bool)

(declare-fun tp_is_empty!18335 () Bool)

(assert (=> b!898140 (= e!502351 tp_is_empty!18335)))

(declare-fun b!898141 () Bool)

(declare-fun e!502348 () Bool)

(assert (=> b!898141 (= e!502348 (and e!502351 mapRes!29151))))

(declare-fun condMapEmpty!29151 () Bool)

(declare-fun mapDefault!29151 () ValueCell!8686)

