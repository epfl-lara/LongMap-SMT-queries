; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80538 () Bool)

(assert start!80538)

(declare-fun b!945647 () Bool)

(declare-fun b_free!18109 () Bool)

(declare-fun b_next!18109 () Bool)

(assert (=> b!945647 (= b_free!18109 (not b_next!18109))))

(declare-fun tp!62851 () Bool)

(declare-fun b_and!29531 () Bool)

(assert (=> b!945647 (= tp!62851 b_and!29531)))

(declare-fun mapIsEmpty!32765 () Bool)

(declare-fun mapRes!32765 () Bool)

(assert (=> mapIsEmpty!32765 mapRes!32765))

(declare-fun res!635052 () Bool)

(declare-fun e!531926 () Bool)

(assert (=> start!80538 (=> (not res!635052) (not e!531926))))

(declare-datatypes ((V!32455 0))(
  ( (V!32456 (val!10359 Int)) )
))
(declare-datatypes ((ValueCell!9827 0))(
  ( (ValueCellFull!9827 (v!12893 V!32455)) (EmptyCell!9827) )
))
(declare-datatypes ((array!57210 0))(
  ( (array!57211 (arr!27526 (Array (_ BitVec 32) ValueCell!9827)) (size!27994 (_ BitVec 32))) )
))
(declare-datatypes ((array!57212 0))(
  ( (array!57213 (arr!27527 (Array (_ BitVec 32) (_ BitVec 64))) (size!27995 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4804 0))(
  ( (LongMapFixedSize!4805 (defaultEntry!5699 Int) (mask!27373 (_ BitVec 32)) (extraKeys!5431 (_ BitVec 32)) (zeroValue!5535 V!32455) (minValue!5535 V!32455) (_size!2457 (_ BitVec 32)) (_keys!10581 array!57212) (_values!5722 array!57210) (_vacant!2457 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4804)

(declare-fun valid!1836 (LongMapFixedSize!4804) Bool)

(assert (=> start!80538 (= res!635052 (valid!1836 thiss!1141))))

(assert (=> start!80538 e!531926))

(declare-fun e!531925 () Bool)

(assert (=> start!80538 e!531925))

(assert (=> start!80538 true))

(declare-fun b!945644 () Bool)

(declare-fun e!531921 () Bool)

(declare-fun tp_is_empty!20617 () Bool)

(assert (=> b!945644 (= e!531921 tp_is_empty!20617)))

(declare-fun b!945645 () Bool)

(declare-datatypes ((SeekEntryResult!9091 0))(
  ( (MissingZero!9091 (index!38735 (_ BitVec 32))) (Found!9091 (index!38736 (_ BitVec 32))) (Intermediate!9091 (undefined!9903 Bool) (index!38737 (_ BitVec 32)) (x!81270 (_ BitVec 32))) (Undefined!9091) (MissingVacant!9091 (index!38738 (_ BitVec 32))) )
))
(declare-fun lt!426069 () SeekEntryResult!9091)

(assert (=> b!945645 (= e!531926 (and (is-Found!9091 lt!426069) (bvsge (index!38736 lt!426069) #b00000000000000000000000000000000) (bvslt (index!38736 lt!426069) (size!27995 (_keys!10581 thiss!1141))) (bvsge (size!27995 (_keys!10581 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57212 (_ BitVec 32)) SeekEntryResult!9091)

(assert (=> b!945645 (= lt!426069 (seekEntry!0 key!756 (_keys!10581 thiss!1141) (mask!27373 thiss!1141)))))

(declare-fun b!945646 () Bool)

(declare-fun res!635051 () Bool)

(assert (=> b!945646 (=> (not res!635051) (not e!531926))))

(assert (=> b!945646 (= res!635051 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!531924 () Bool)

(declare-fun array_inv!21382 (array!57212) Bool)

(declare-fun array_inv!21383 (array!57210) Bool)

(assert (=> b!945647 (= e!531925 (and tp!62851 tp_is_empty!20617 (array_inv!21382 (_keys!10581 thiss!1141)) (array_inv!21383 (_values!5722 thiss!1141)) e!531924))))

(declare-fun b!945648 () Bool)

(declare-fun e!531923 () Bool)

(assert (=> b!945648 (= e!531924 (and e!531923 mapRes!32765))))

(declare-fun condMapEmpty!32765 () Bool)

(declare-fun mapDefault!32765 () ValueCell!9827)

