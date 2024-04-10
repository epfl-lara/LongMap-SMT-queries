; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23486 () Bool)

(assert start!23486)

(declare-fun b!246654 () Bool)

(declare-fun b_free!6571 () Bool)

(declare-fun b_next!6571 () Bool)

(assert (=> b!246654 (= b_free!6571 (not b_next!6571))))

(declare-fun tp!22954 () Bool)

(declare-fun b_and!13569 () Bool)

(assert (=> b!246654 (= tp!22954 b_and!13569)))

(declare-fun b!246646 () Bool)

(declare-fun e!160015 () Bool)

(declare-fun e!160016 () Bool)

(assert (=> b!246646 (= e!160015 e!160016)))

(declare-fun res!120931 () Bool)

(assert (=> b!246646 (=> (not res!120931) (not e!160016))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8225 0))(
  ( (V!8226 (val!3261 Int)) )
))
(declare-datatypes ((ValueCell!2873 0))(
  ( (ValueCellFull!2873 (v!5317 V!8225)) (EmptyCell!2873) )
))
(declare-datatypes ((array!12169 0))(
  ( (array!12170 (arr!5774 (Array (_ BitVec 32) ValueCell!2873)) (size!6117 (_ BitVec 32))) )
))
(declare-datatypes ((array!12171 0))(
  ( (array!12172 (arr!5775 (Array (_ BitVec 32) (_ BitVec 64))) (size!6118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3646 0))(
  ( (LongMapFixedSize!3647 (defaultEntry!4564 Int) (mask!10692 (_ BitVec 32)) (extraKeys!4301 (_ BitVec 32)) (zeroValue!4405 V!8225) (minValue!4405 V!8225) (_size!1872 (_ BitVec 32)) (_keys!6684 array!12171) (_values!4547 array!12169) (_vacant!1872 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3646)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246646 (= res!120931 (inRange!0 index!297 (mask!10692 thiss!1504)))))

(declare-datatypes ((Unit!7616 0))(
  ( (Unit!7617) )
))
(declare-fun lt!123534 () Unit!7616)

(declare-fun e!160003 () Unit!7616)

(assert (=> b!246646 (= lt!123534 e!160003)))

(declare-fun c!41257 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4798 0))(
  ( (tuple2!4799 (_1!2410 (_ BitVec 64)) (_2!2410 V!8225)) )
))
(declare-datatypes ((List!3680 0))(
  ( (Nil!3677) (Cons!3676 (h!4334 tuple2!4798) (t!8699 List!3680)) )
))
(declare-datatypes ((ListLongMap!3711 0))(
  ( (ListLongMap!3712 (toList!1871 List!3680)) )
))
(declare-fun contains!1783 (ListLongMap!3711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1399 (array!12171 array!12169 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 32) Int) ListLongMap!3711)

(assert (=> b!246646 (= c!41257 (contains!1783 (getCurrentListMap!1399 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)) key!932))))

(declare-fun b!246647 () Bool)

(declare-fun e!160004 () Unit!7616)

(declare-fun Unit!7618 () Unit!7616)

(assert (=> b!246647 (= e!160004 Unit!7618)))

(declare-fun lt!123539 () Unit!7616)

(declare-fun lemmaArrayContainsKeyThenInListMap!180 (array!12171 array!12169 (_ BitVec 32) (_ BitVec 32) V!8225 V!8225 (_ BitVec 64) (_ BitVec 32) Int) Unit!7616)

(assert (=> b!246647 (= lt!123539 (lemmaArrayContainsKeyThenInListMap!180 (_keys!6684 thiss!1504) (_values!4547 thiss!1504) (mask!10692 thiss!1504) (extraKeys!4301 thiss!1504) (zeroValue!4405 thiss!1504) (minValue!4405 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4564 thiss!1504)))))

(assert (=> b!246647 false))

(declare-fun b!246648 () Bool)

(declare-fun e!160005 () Bool)

(declare-fun e!160002 () Bool)

(declare-fun mapRes!10919 () Bool)

(assert (=> b!246648 (= e!160005 (and e!160002 mapRes!10919))))

(declare-fun condMapEmpty!10919 () Bool)

(declare-fun mapDefault!10919 () ValueCell!2873)

