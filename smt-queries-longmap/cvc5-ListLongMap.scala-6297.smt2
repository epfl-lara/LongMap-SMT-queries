; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80524 () Bool)

(assert start!80524)

(declare-fun b!945559 () Bool)

(declare-fun b_free!18103 () Bool)

(declare-fun b_next!18103 () Bool)

(assert (=> b!945559 (= b_free!18103 (not b_next!18103))))

(declare-fun tp!62829 () Bool)

(declare-fun b_and!29525 () Bool)

(assert (=> b!945559 (= tp!62829 b_and!29525)))

(declare-fun b!945555 () Bool)

(declare-fun e!531851 () Bool)

(declare-datatypes ((SeekEntryResult!9088 0))(
  ( (MissingZero!9088 (index!38723 (_ BitVec 32))) (Found!9088 (index!38724 (_ BitVec 32))) (Intermediate!9088 (undefined!9900 Bool) (index!38725 (_ BitVec 32)) (x!81251 (_ BitVec 32))) (Undefined!9088) (MissingVacant!9088 (index!38726 (_ BitVec 32))) )
))
(declare-fun lt!426048 () SeekEntryResult!9088)

(declare-datatypes ((V!32447 0))(
  ( (V!32448 (val!10356 Int)) )
))
(declare-datatypes ((ValueCell!9824 0))(
  ( (ValueCellFull!9824 (v!12890 V!32447)) (EmptyCell!9824) )
))
(declare-datatypes ((array!57196 0))(
  ( (array!57197 (arr!27520 (Array (_ BitVec 32) ValueCell!9824)) (size!27988 (_ BitVec 32))) )
))
(declare-datatypes ((array!57198 0))(
  ( (array!57199 (arr!27521 (Array (_ BitVec 32) (_ BitVec 64))) (size!27989 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4798 0))(
  ( (LongMapFixedSize!4799 (defaultEntry!5696 Int) (mask!27367 (_ BitVec 32)) (extraKeys!5428 (_ BitVec 32)) (zeroValue!5532 V!32447) (minValue!5532 V!32447) (_size!2454 (_ BitVec 32)) (_keys!10577 array!57198) (_values!5719 array!57196) (_vacant!2454 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4798)

(assert (=> b!945555 (= e!531851 (and (is-Found!9088 lt!426048) (bvsge (index!38724 lt!426048) #b00000000000000000000000000000000) (bvsge (index!38724 lt!426048) (size!27989 (_keys!10577 thiss!1141)))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57198 (_ BitVec 32)) SeekEntryResult!9088)

(assert (=> b!945555 (= lt!426048 (seekEntry!0 key!756 (_keys!10577 thiss!1141) (mask!27367 thiss!1141)))))

(declare-fun mapNonEmpty!32753 () Bool)

(declare-fun mapRes!32753 () Bool)

(declare-fun tp!62830 () Bool)

(declare-fun e!531853 () Bool)

(assert (=> mapNonEmpty!32753 (= mapRes!32753 (and tp!62830 e!531853))))

(declare-fun mapKey!32753 () (_ BitVec 32))

(declare-fun mapValue!32753 () ValueCell!9824)

(declare-fun mapRest!32753 () (Array (_ BitVec 32) ValueCell!9824))

(assert (=> mapNonEmpty!32753 (= (arr!27520 (_values!5719 thiss!1141)) (store mapRest!32753 mapKey!32753 mapValue!32753))))

(declare-fun b!945556 () Bool)

(declare-fun tp_is_empty!20611 () Bool)

(assert (=> b!945556 (= e!531853 tp_is_empty!20611)))

(declare-fun b!945557 () Bool)

(declare-fun e!531850 () Bool)

(assert (=> b!945557 (= e!531850 tp_is_empty!20611)))

(declare-fun b!945558 () Bool)

(declare-fun e!531849 () Bool)

(assert (=> b!945558 (= e!531849 (and e!531850 mapRes!32753))))

(declare-fun condMapEmpty!32753 () Bool)

(declare-fun mapDefault!32753 () ValueCell!9824)

