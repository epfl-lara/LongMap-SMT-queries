; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81380 () Bool)

(assert start!81380)

(declare-fun b!951595 () Bool)

(declare-fun b_free!18275 () Bool)

(declare-fun b_next!18275 () Bool)

(assert (=> b!951595 (= b_free!18275 (not b_next!18275))))

(declare-fun tp!63437 () Bool)

(declare-fun b_and!29745 () Bool)

(assert (=> b!951595 (= tp!63437 b_and!29745)))

(declare-fun mapIsEmpty!33102 () Bool)

(declare-fun mapRes!33102 () Bool)

(assert (=> mapIsEmpty!33102 mapRes!33102))

(declare-fun res!637709 () Bool)

(declare-fun e!535862 () Bool)

(assert (=> start!81380 (=> (not res!637709) (not e!535862))))

(declare-datatypes ((V!32675 0))(
  ( (V!32676 (val!10442 Int)) )
))
(declare-datatypes ((ValueCell!9910 0))(
  ( (ValueCellFull!9910 (v!12990 V!32675)) (EmptyCell!9910) )
))
(declare-datatypes ((array!57594 0))(
  ( (array!57595 (arr!27692 (Array (_ BitVec 32) ValueCell!9910)) (size!28170 (_ BitVec 32))) )
))
(declare-datatypes ((array!57596 0))(
  ( (array!57597 (arr!27693 (Array (_ BitVec 32) (_ BitVec 64))) (size!28171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4970 0))(
  ( (LongMapFixedSize!4971 (defaultEntry!5808 Int) (mask!27633 (_ BitVec 32)) (extraKeys!5540 (_ BitVec 32)) (zeroValue!5644 V!32675) (minValue!5644 V!32675) (_size!2540 (_ BitVec 32)) (_keys!10753 array!57596) (_values!5831 array!57594) (_vacant!2540 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4970)

(declare-fun valid!1891 (LongMapFixedSize!4970) Bool)

(assert (=> start!81380 (= res!637709 (valid!1891 thiss!1141))))

(assert (=> start!81380 e!535862))

(declare-fun e!535865 () Bool)

(assert (=> start!81380 e!535865))

(assert (=> start!81380 true))

(declare-fun b!951593 () Bool)

(declare-fun e!535861 () Bool)

(declare-fun e!535864 () Bool)

(assert (=> b!951593 (= e!535861 (and e!535864 mapRes!33102))))

(declare-fun condMapEmpty!33102 () Bool)

(declare-fun mapDefault!33102 () ValueCell!9910)

