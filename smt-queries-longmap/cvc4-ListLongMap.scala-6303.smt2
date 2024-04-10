; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80680 () Bool)

(assert start!80680)

(declare-fun b!946523 () Bool)

(declare-fun b_free!18143 () Bool)

(declare-fun b_next!18143 () Bool)

(assert (=> b!946523 (= b_free!18143 (not b_next!18143))))

(declare-fun tp!62970 () Bool)

(declare-fun b_and!29565 () Bool)

(assert (=> b!946523 (= tp!62970 b_and!29565)))

(declare-fun b!946517 () Bool)

(declare-fun e!532586 () Bool)

(declare-fun tp_is_empty!20651 () Bool)

(assert (=> b!946517 (= e!532586 tp_is_empty!20651)))

(declare-fun mapIsEmpty!32834 () Bool)

(declare-fun mapRes!32834 () Bool)

(assert (=> mapIsEmpty!32834 mapRes!32834))

(declare-fun mapNonEmpty!32834 () Bool)

(declare-fun tp!62971 () Bool)

(declare-fun e!532590 () Bool)

(assert (=> mapNonEmpty!32834 (= mapRes!32834 (and tp!62971 e!532590))))

(declare-fun mapKey!32834 () (_ BitVec 32))

(declare-datatypes ((V!32499 0))(
  ( (V!32500 (val!10376 Int)) )
))
(declare-datatypes ((ValueCell!9844 0))(
  ( (ValueCellFull!9844 (v!12910 V!32499)) (EmptyCell!9844) )
))
(declare-datatypes ((array!57288 0))(
  ( (array!57289 (arr!27560 (Array (_ BitVec 32) ValueCell!9844)) (size!28031 (_ BitVec 32))) )
))
(declare-datatypes ((array!57290 0))(
  ( (array!57291 (arr!27561 (Array (_ BitVec 32) (_ BitVec 64))) (size!28032 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4838 0))(
  ( (LongMapFixedSize!4839 (defaultEntry!5716 Int) (mask!27421 (_ BitVec 32)) (extraKeys!5448 (_ BitVec 32)) (zeroValue!5552 V!32499) (minValue!5552 V!32499) (_size!2474 (_ BitVec 32)) (_keys!10612 array!57290) (_values!5739 array!57288) (_vacant!2474 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4838)

(declare-fun mapValue!32834 () ValueCell!9844)

(declare-fun mapRest!32834 () (Array (_ BitVec 32) ValueCell!9844))

(assert (=> mapNonEmpty!32834 (= (arr!27560 (_values!5739 thiss!1141)) (store mapRest!32834 mapKey!32834 mapValue!32834))))

(declare-fun b!946519 () Bool)

(declare-fun res!635408 () Bool)

(declare-fun e!532583 () Bool)

(assert (=> b!946519 (=> (not res!635408) (not e!532583))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946519 (= res!635408 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946520 () Bool)

(declare-fun e!532589 () Bool)

(assert (=> b!946520 (= e!532589 (and e!532586 mapRes!32834))))

(declare-fun condMapEmpty!32834 () Bool)

(declare-fun mapDefault!32834 () ValueCell!9844)

