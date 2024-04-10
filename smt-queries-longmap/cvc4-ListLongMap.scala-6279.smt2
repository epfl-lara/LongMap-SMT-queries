; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80300 () Bool)

(assert start!80300)

(declare-fun b!943376 () Bool)

(declare-fun b_free!17999 () Bool)

(declare-fun b_next!17999 () Bool)

(assert (=> b!943376 (= b_free!17999 (not b_next!17999))))

(declare-fun tp!62503 () Bool)

(declare-fun b_and!29411 () Bool)

(assert (=> b!943376 (= tp!62503 b_and!29411)))

(declare-fun b!943366 () Bool)

(declare-fun e!530405 () Bool)

(declare-fun tp_is_empty!20507 () Bool)

(assert (=> b!943366 (= e!530405 tp_is_empty!20507)))

(declare-fun b!943367 () Bool)

(declare-fun e!530401 () Bool)

(assert (=> b!943367 (= e!530401 tp_is_empty!20507)))

(declare-fun b!943368 () Bool)

(declare-fun res!633884 () Bool)

(declare-fun e!530402 () Bool)

(assert (=> b!943368 (=> (not res!633884) (not e!530402))))

(declare-datatypes ((V!32307 0))(
  ( (V!32308 (val!10304 Int)) )
))
(declare-datatypes ((ValueCell!9772 0))(
  ( (ValueCellFull!9772 (v!12835 V!32307)) (EmptyCell!9772) )
))
(declare-datatypes ((array!56980 0))(
  ( (array!56981 (arr!27416 (Array (_ BitVec 32) ValueCell!9772)) (size!27881 (_ BitVec 32))) )
))
(declare-datatypes ((array!56982 0))(
  ( (array!56983 (arr!27417 (Array (_ BitVec 32) (_ BitVec 64))) (size!27882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4694 0))(
  ( (LongMapFixedSize!4695 (defaultEntry!5638 Int) (mask!27264 (_ BitVec 32)) (extraKeys!5370 (_ BitVec 32)) (zeroValue!5474 V!32307) (minValue!5474 V!32307) (_size!2402 (_ BitVec 32)) (_keys!10512 array!56982) (_values!5661 array!56980) (_vacant!2402 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4694)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13438 0))(
  ( (tuple2!13439 (_1!6730 (_ BitVec 64)) (_2!6730 V!32307)) )
))
(declare-datatypes ((List!19249 0))(
  ( (Nil!19246) (Cons!19245 (h!20395 tuple2!13438) (t!27564 List!19249)) )
))
(declare-datatypes ((ListLongMap!12135 0))(
  ( (ListLongMap!12136 (toList!6083 List!19249)) )
))
(declare-fun contains!5153 (ListLongMap!12135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3317 (array!56982 array!56980 (_ BitVec 32) (_ BitVec 32) V!32307 V!32307 (_ BitVec 32) Int) ListLongMap!12135)

(assert (=> b!943368 (= res!633884 (contains!5153 (getCurrentListMap!3317 (_keys!10512 thiss!1141) (_values!5661 thiss!1141) (mask!27264 thiss!1141) (extraKeys!5370 thiss!1141) (zeroValue!5474 thiss!1141) (minValue!5474 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5638 thiss!1141)) key!756))))

(declare-fun b!943369 () Bool)

(declare-fun res!633878 () Bool)

(assert (=> b!943369 (=> (not res!633878) (not e!530402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56982 (_ BitVec 32)) Bool)

(assert (=> b!943369 (= res!633878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10512 thiss!1141) (mask!27264 thiss!1141)))))

(declare-fun b!943370 () Bool)

(declare-fun res!633879 () Bool)

(assert (=> b!943370 (=> (not res!633879) (not e!530402))))

(assert (=> b!943370 (= res!633879 (and (= (size!27881 (_values!5661 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27264 thiss!1141))) (= (size!27882 (_keys!10512 thiss!1141)) (size!27881 (_values!5661 thiss!1141))) (bvsge (mask!27264 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5370 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5370 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!633880 () Bool)

(assert (=> start!80300 (=> (not res!633880) (not e!530402))))

(declare-fun valid!1794 (LongMapFixedSize!4694) Bool)

(assert (=> start!80300 (= res!633880 (valid!1794 thiss!1141))))

(assert (=> start!80300 e!530402))

(declare-fun e!530406 () Bool)

(assert (=> start!80300 e!530406))

(assert (=> start!80300 true))

(declare-fun mapIsEmpty!32582 () Bool)

(declare-fun mapRes!32582 () Bool)

(assert (=> mapIsEmpty!32582 mapRes!32582))

(declare-fun b!943371 () Bool)

(declare-fun e!530403 () Bool)

(assert (=> b!943371 (= e!530403 (and e!530405 mapRes!32582))))

(declare-fun condMapEmpty!32582 () Bool)

(declare-fun mapDefault!32582 () ValueCell!9772)

