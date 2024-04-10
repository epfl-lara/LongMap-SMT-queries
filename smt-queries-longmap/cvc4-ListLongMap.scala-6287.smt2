; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80404 () Bool)

(assert start!80404)

(declare-fun b!944387 () Bool)

(declare-fun b_free!18047 () Bool)

(declare-fun b_next!18047 () Bool)

(assert (=> b!944387 (= b_free!18047 (not b_next!18047))))

(declare-fun tp!62651 () Bool)

(declare-fun b_and!29465 () Bool)

(assert (=> b!944387 (= tp!62651 b_and!29465)))

(declare-fun b!944385 () Bool)

(declare-fun res!634419 () Bool)

(declare-fun e!531074 () Bool)

(assert (=> b!944385 (=> (not res!634419) (not e!531074))))

(declare-datatypes ((V!32371 0))(
  ( (V!32372 (val!10328 Int)) )
))
(declare-datatypes ((ValueCell!9796 0))(
  ( (ValueCellFull!9796 (v!12860 V!32371)) (EmptyCell!9796) )
))
(declare-datatypes ((array!57078 0))(
  ( (array!57079 (arr!27464 (Array (_ BitVec 32) ValueCell!9796)) (size!27930 (_ BitVec 32))) )
))
(declare-datatypes ((array!57080 0))(
  ( (array!57081 (arr!27465 (Array (_ BitVec 32) (_ BitVec 64))) (size!27931 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4742 0))(
  ( (LongMapFixedSize!4743 (defaultEntry!5666 Int) (mask!27314 (_ BitVec 32)) (extraKeys!5398 (_ BitVec 32)) (zeroValue!5502 V!32371) (minValue!5502 V!32371) (_size!2426 (_ BitVec 32)) (_keys!10544 array!57080) (_values!5689 array!57078) (_vacant!2426 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4742)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13476 0))(
  ( (tuple2!13477 (_1!6749 (_ BitVec 64)) (_2!6749 V!32371)) )
))
(declare-datatypes ((List!19272 0))(
  ( (Nil!19269) (Cons!19268 (h!20419 tuple2!13476) (t!27589 List!19272)) )
))
(declare-datatypes ((ListLongMap!12173 0))(
  ( (ListLongMap!12174 (toList!6102 List!19272)) )
))
(declare-fun contains!5174 (ListLongMap!12173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3336 (array!57080 array!57078 (_ BitVec 32) (_ BitVec 32) V!32371 V!32371 (_ BitVec 32) Int) ListLongMap!12173)

(assert (=> b!944385 (= res!634419 (contains!5174 (getCurrentListMap!3336 (_keys!10544 thiss!1141) (_values!5689 thiss!1141) (mask!27314 thiss!1141) (extraKeys!5398 thiss!1141) (zeroValue!5502 thiss!1141) (minValue!5502 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5666 thiss!1141)) key!756))))

(declare-fun b!944386 () Bool)

(declare-fun e!531072 () Bool)

(declare-fun tp_is_empty!20555 () Bool)

(assert (=> b!944386 (= e!531072 tp_is_empty!20555)))

(declare-fun e!531071 () Bool)

(declare-fun e!531070 () Bool)

(declare-fun array_inv!21338 (array!57080) Bool)

(declare-fun array_inv!21339 (array!57078) Bool)

(assert (=> b!944387 (= e!531070 (and tp!62651 tp_is_empty!20555 (array_inv!21338 (_keys!10544 thiss!1141)) (array_inv!21339 (_values!5689 thiss!1141)) e!531071))))

(declare-fun b!944388 () Bool)

(declare-fun e!531073 () Bool)

(assert (=> b!944388 (= e!531073 tp_is_empty!20555)))

(declare-fun b!944389 () Bool)

(declare-fun res!634414 () Bool)

(assert (=> b!944389 (=> (not res!634414) (not e!531074))))

(declare-datatypes ((SeekEntryResult!9066 0))(
  ( (MissingZero!9066 (index!38635 (_ BitVec 32))) (Found!9066 (index!38636 (_ BitVec 32))) (Intermediate!9066 (undefined!9878 Bool) (index!38637 (_ BitVec 32)) (x!81109 (_ BitVec 32))) (Undefined!9066) (MissingVacant!9066 (index!38638 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57080 (_ BitVec 32)) SeekEntryResult!9066)

(assert (=> b!944389 (= res!634414 (not (is-Found!9066 (seekEntry!0 key!756 (_keys!10544 thiss!1141) (mask!27314 thiss!1141)))))))

(declare-fun b!944390 () Bool)

(declare-fun res!634417 () Bool)

(assert (=> b!944390 (=> (not res!634417) (not e!531074))))

(assert (=> b!944390 (= res!634417 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944391 () Bool)

(declare-fun res!634416 () Bool)

(declare-fun e!531075 () Bool)

(assert (=> b!944391 (=> res!634416 e!531075)))

(declare-fun lt!425611 () (_ BitVec 32))

(assert (=> b!944391 (= res!634416 (or (not (= (size!27931 (_keys!10544 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27314 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27931 (_keys!10544 thiss!1141))) (bvslt lt!425611 #b00000000000000000000000000000000) (bvsgt lt!425611 (size!27931 (_keys!10544 thiss!1141)))))))

(declare-fun mapIsEmpty!32658 () Bool)

(declare-fun mapRes!32658 () Bool)

(assert (=> mapIsEmpty!32658 mapRes!32658))

(declare-fun b!944392 () Bool)

(assert (=> b!944392 (= e!531071 (and e!531073 mapRes!32658))))

(declare-fun condMapEmpty!32658 () Bool)

(declare-fun mapDefault!32658 () ValueCell!9796)

