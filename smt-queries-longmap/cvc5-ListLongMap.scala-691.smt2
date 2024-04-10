; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16650 () Bool)

(assert start!16650)

(declare-fun b!166440 () Bool)

(declare-fun b_free!3955 () Bool)

(declare-fun b_next!3955 () Bool)

(assert (=> b!166440 (= b_free!3955 (not b_next!3955))))

(declare-fun tp!14466 () Bool)

(declare-fun b_and!10369 () Bool)

(assert (=> b!166440 (= tp!14466 b_and!10369)))

(declare-fun b!166434 () Bool)

(declare-fun e!109192 () Bool)

(declare-fun e!109197 () Bool)

(assert (=> b!166434 (= e!109192 e!109197)))

(declare-fun res!79101 () Bool)

(assert (=> b!166434 (=> (not res!79101) (not e!109197))))

(declare-datatypes ((SeekEntryResult!456 0))(
  ( (MissingZero!456 (index!3992 (_ BitVec 32))) (Found!456 (index!3993 (_ BitVec 32))) (Intermediate!456 (undefined!1268 Bool) (index!3994 (_ BitVec 32)) (x!18436 (_ BitVec 32))) (Undefined!456) (MissingVacant!456 (index!3995 (_ BitVec 32))) )
))
(declare-fun lt!83308 () SeekEntryResult!456)

(assert (=> b!166434 (= res!79101 (and (not (is-Undefined!456 lt!83308)) (not (is-MissingVacant!456 lt!83308)) (not (is-MissingZero!456 lt!83308)) (is-Found!456 lt!83308)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4657 0))(
  ( (V!4658 (val!1923 Int)) )
))
(declare-datatypes ((ValueCell!1535 0))(
  ( (ValueCellFull!1535 (v!3788 V!4657)) (EmptyCell!1535) )
))
(declare-datatypes ((array!6611 0))(
  ( (array!6612 (arr!3141 (Array (_ BitVec 32) (_ BitVec 64))) (size!3429 (_ BitVec 32))) )
))
(declare-datatypes ((array!6613 0))(
  ( (array!6614 (arr!3142 (Array (_ BitVec 32) ValueCell!1535)) (size!3430 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1978 0))(
  ( (LongMapFixedSize!1979 (defaultEntry!3431 Int) (mask!8162 (_ BitVec 32)) (extraKeys!3172 (_ BitVec 32)) (zeroValue!3274 V!4657) (minValue!3274 V!4657) (_size!1038 (_ BitVec 32)) (_keys!5256 array!6611) (_values!3414 array!6613) (_vacant!1038 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1978)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6611 (_ BitVec 32)) SeekEntryResult!456)

(assert (=> b!166434 (= lt!83308 (seekEntryOrOpen!0 key!828 (_keys!5256 thiss!1248) (mask!8162 thiss!1248)))))

(declare-fun b!166435 () Bool)

(declare-fun e!109194 () Bool)

(assert (=> b!166435 (= e!109197 e!109194)))

(declare-fun res!79098 () Bool)

(assert (=> b!166435 (=> (not res!79098) (not e!109194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166435 (= res!79098 (validMask!0 (mask!8162 thiss!1248)))))

(declare-datatypes ((Unit!5061 0))(
  ( (Unit!5062) )
))
(declare-fun lt!83306 () Unit!5061)

(declare-fun e!109199 () Unit!5061)

(assert (=> b!166435 (= lt!83306 e!109199)))

(declare-fun c!30214 () Bool)

(declare-datatypes ((tuple2!3104 0))(
  ( (tuple2!3105 (_1!1563 (_ BitVec 64)) (_2!1563 V!4657)) )
))
(declare-datatypes ((List!2091 0))(
  ( (Nil!2088) (Cons!2087 (h!2704 tuple2!3104) (t!6893 List!2091)) )
))
(declare-datatypes ((ListLongMap!2059 0))(
  ( (ListLongMap!2060 (toList!1045 List!2091)) )
))
(declare-fun contains!1087 (ListLongMap!2059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!703 (array!6611 array!6613 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 32) Int) ListLongMap!2059)

(assert (=> b!166435 (= c!30214 (contains!1087 (getCurrentListMap!703 (_keys!5256 thiss!1248) (_values!3414 thiss!1248) (mask!8162 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3431 thiss!1248)) key!828))))

(declare-fun b!166436 () Bool)

(assert (=> b!166436 (= e!109194 false)))

(declare-fun lt!83304 () Bool)

(declare-datatypes ((List!2092 0))(
  ( (Nil!2089) (Cons!2088 (h!2705 (_ BitVec 64)) (t!6894 List!2092)) )
))
(declare-fun arrayNoDuplicates!0 (array!6611 (_ BitVec 32) List!2092) Bool)

(assert (=> b!166436 (= lt!83304 (arrayNoDuplicates!0 (_keys!5256 thiss!1248) #b00000000000000000000000000000000 Nil!2089))))

(declare-fun b!166437 () Bool)

(declare-fun lt!83307 () Unit!5061)

(assert (=> b!166437 (= e!109199 lt!83307)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!87 (array!6611 array!6613 (_ BitVec 32) (_ BitVec 32) V!4657 V!4657 (_ BitVec 64) Int) Unit!5061)

(assert (=> b!166437 (= lt!83307 (lemmaInListMapThenSeekEntryOrOpenFindsIt!87 (_keys!5256 thiss!1248) (_values!3414 thiss!1248) (mask!8162 thiss!1248) (extraKeys!3172 thiss!1248) (zeroValue!3274 thiss!1248) (minValue!3274 thiss!1248) key!828 (defaultEntry!3431 thiss!1248)))))

(declare-fun res!79100 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166437 (= res!79100 (inRange!0 (index!3993 lt!83308) (mask!8162 thiss!1248)))))

(declare-fun e!109195 () Bool)

(assert (=> b!166437 (=> (not res!79100) (not e!109195))))

(assert (=> b!166437 e!109195))

(declare-fun b!166438 () Bool)

(declare-fun res!79102 () Bool)

(assert (=> b!166438 (=> (not res!79102) (not e!109194))))

(assert (=> b!166438 (= res!79102 (and (= (size!3430 (_values!3414 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8162 thiss!1248))) (= (size!3429 (_keys!5256 thiss!1248)) (size!3430 (_values!3414 thiss!1248))) (bvsge (mask!8162 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3172 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3172 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166439 () Bool)

(assert (=> b!166439 (= e!109195 (= (select (arr!3141 (_keys!5256 thiss!1248)) (index!3993 lt!83308)) key!828))))

(declare-fun mapNonEmpty!6354 () Bool)

(declare-fun mapRes!6354 () Bool)

(declare-fun tp!14465 () Bool)

(declare-fun e!109191 () Bool)

(assert (=> mapNonEmpty!6354 (= mapRes!6354 (and tp!14465 e!109191))))

(declare-fun mapRest!6354 () (Array (_ BitVec 32) ValueCell!1535))

(declare-fun mapKey!6354 () (_ BitVec 32))

(declare-fun mapValue!6354 () ValueCell!1535)

(assert (=> mapNonEmpty!6354 (= (arr!3142 (_values!3414 thiss!1248)) (store mapRest!6354 mapKey!6354 mapValue!6354))))

(declare-fun e!109190 () Bool)

(declare-fun e!109193 () Bool)

(declare-fun tp_is_empty!3757 () Bool)

(declare-fun array_inv!2015 (array!6611) Bool)

(declare-fun array_inv!2016 (array!6613) Bool)

(assert (=> b!166440 (= e!109193 (and tp!14466 tp_is_empty!3757 (array_inv!2015 (_keys!5256 thiss!1248)) (array_inv!2016 (_values!3414 thiss!1248)) e!109190))))

(declare-fun mapIsEmpty!6354 () Bool)

(assert (=> mapIsEmpty!6354 mapRes!6354))

(declare-fun b!166441 () Bool)

(assert (=> b!166441 (= e!109191 tp_is_empty!3757)))

(declare-fun b!166442 () Bool)

(declare-fun e!109198 () Bool)

(assert (=> b!166442 (= e!109198 tp_is_empty!3757)))

(declare-fun b!166443 () Bool)

(assert (=> b!166443 (= e!109190 (and e!109198 mapRes!6354))))

(declare-fun condMapEmpty!6354 () Bool)

(declare-fun mapDefault!6354 () ValueCell!1535)

