; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80440 () Bool)

(assert start!80440)

(declare-fun b!945008 () Bool)

(declare-fun b_free!18083 () Bool)

(declare-fun b_next!18083 () Bool)

(assert (=> b!945008 (= b_free!18083 (not b_next!18083))))

(declare-fun tp!62759 () Bool)

(declare-fun b_and!29501 () Bool)

(assert (=> b!945008 (= tp!62759 b_and!29501)))

(declare-fun b!945007 () Bool)

(declare-fun e!531454 () Bool)

(declare-fun tp_is_empty!20591 () Bool)

(assert (=> b!945007 (= e!531454 tp_is_empty!20591)))

(declare-fun mapNonEmpty!32712 () Bool)

(declare-fun mapRes!32712 () Bool)

(declare-fun tp!62758 () Bool)

(declare-fun e!531450 () Bool)

(assert (=> mapNonEmpty!32712 (= mapRes!32712 (and tp!62758 e!531450))))

(declare-datatypes ((V!32419 0))(
  ( (V!32420 (val!10346 Int)) )
))
(declare-datatypes ((ValueCell!9814 0))(
  ( (ValueCellFull!9814 (v!12878 V!32419)) (EmptyCell!9814) )
))
(declare-fun mapValue!32712 () ValueCell!9814)

(declare-fun mapRest!32712 () (Array (_ BitVec 32) ValueCell!9814))

(declare-datatypes ((array!57150 0))(
  ( (array!57151 (arr!27500 (Array (_ BitVec 32) ValueCell!9814)) (size!27966 (_ BitVec 32))) )
))
(declare-datatypes ((array!57152 0))(
  ( (array!57153 (arr!27501 (Array (_ BitVec 32) (_ BitVec 64))) (size!27967 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4778 0))(
  ( (LongMapFixedSize!4779 (defaultEntry!5684 Int) (mask!27344 (_ BitVec 32)) (extraKeys!5416 (_ BitVec 32)) (zeroValue!5520 V!32419) (minValue!5520 V!32419) (_size!2444 (_ BitVec 32)) (_keys!10562 array!57152) (_values!5707 array!57150) (_vacant!2444 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4778)

(declare-fun mapKey!32712 () (_ BitVec 32))

(assert (=> mapNonEmpty!32712 (= (arr!27500 (_values!5707 thiss!1141)) (store mapRest!32712 mapKey!32712 mapValue!32712))))

(declare-fun e!531453 () Bool)

(declare-fun e!531448 () Bool)

(declare-fun array_inv!21366 (array!57152) Bool)

(declare-fun array_inv!21367 (array!57150) Bool)

(assert (=> b!945008 (= e!531448 (and tp!62759 tp_is_empty!20591 (array_inv!21366 (_keys!10562 thiss!1141)) (array_inv!21367 (_values!5707 thiss!1141)) e!531453))))

(declare-fun b!945009 () Bool)

(assert (=> b!945009 (= e!531453 (and e!531454 mapRes!32712))))

(declare-fun condMapEmpty!32712 () Bool)

(declare-fun mapDefault!32712 () ValueCell!9814)

