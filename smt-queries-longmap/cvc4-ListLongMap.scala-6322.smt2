; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81300 () Bool)

(assert start!81300)

(declare-fun b!950961 () Bool)

(declare-fun b_free!18257 () Bool)

(declare-fun b_next!18257 () Bool)

(assert (=> b!950961 (= b_free!18257 (not b_next!18257))))

(declare-fun tp!63374 () Bool)

(declare-fun b_and!29721 () Bool)

(assert (=> b!950961 (= tp!63374 b_and!29721)))

(declare-fun res!637432 () Bool)

(declare-fun e!535450 () Bool)

(assert (=> start!81300 (=> (not res!637432) (not e!535450))))

(declare-datatypes ((V!32651 0))(
  ( (V!32652 (val!10433 Int)) )
))
(declare-datatypes ((ValueCell!9901 0))(
  ( (ValueCellFull!9901 (v!12978 V!32651)) (EmptyCell!9901) )
))
(declare-datatypes ((array!57552 0))(
  ( (array!57553 (arr!27674 (Array (_ BitVec 32) ValueCell!9901)) (size!28152 (_ BitVec 32))) )
))
(declare-datatypes ((array!57554 0))(
  ( (array!57555 (arr!27675 (Array (_ BitVec 32) (_ BitVec 64))) (size!28153 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4952 0))(
  ( (LongMapFixedSize!4953 (defaultEntry!5793 Int) (mask!27605 (_ BitVec 32)) (extraKeys!5525 (_ BitVec 32)) (zeroValue!5629 V!32651) (minValue!5629 V!32651) (_size!2531 (_ BitVec 32)) (_keys!10734 array!57554) (_values!5816 array!57552) (_vacant!2531 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4952)

(declare-fun valid!1883 (LongMapFixedSize!4952) Bool)

(assert (=> start!81300 (= res!637432 (valid!1883 thiss!1141))))

(assert (=> start!81300 e!535450))

(declare-fun e!535445 () Bool)

(assert (=> start!81300 e!535445))

(assert (=> start!81300 true))

(declare-fun b!950956 () Bool)

(declare-fun res!637430 () Bool)

(assert (=> b!950956 (=> (not res!637430) (not e!535450))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!950956 (= res!637430 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!33066 () Bool)

(declare-fun mapRes!33066 () Bool)

(declare-fun tp!63373 () Bool)

(declare-fun e!535448 () Bool)

(assert (=> mapNonEmpty!33066 (= mapRes!33066 (and tp!63373 e!535448))))

(declare-fun mapKey!33066 () (_ BitVec 32))

(declare-fun mapValue!33066 () ValueCell!9901)

(declare-fun mapRest!33066 () (Array (_ BitVec 32) ValueCell!9901))

(assert (=> mapNonEmpty!33066 (= (arr!27674 (_values!5816 thiss!1141)) (store mapRest!33066 mapKey!33066 mapValue!33066))))

(declare-fun b!950957 () Bool)

(declare-fun e!535446 () Bool)

(declare-fun tp_is_empty!20765 () Bool)

(assert (=> b!950957 (= e!535446 tp_is_empty!20765)))

(declare-fun mapIsEmpty!33066 () Bool)

(assert (=> mapIsEmpty!33066 mapRes!33066))

(declare-fun b!950958 () Bool)

(declare-fun e!535447 () Bool)

(assert (=> b!950958 (= e!535447 (and e!535446 mapRes!33066))))

(declare-fun condMapEmpty!33066 () Bool)

(declare-fun mapDefault!33066 () ValueCell!9901)

