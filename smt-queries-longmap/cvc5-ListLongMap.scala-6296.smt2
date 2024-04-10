; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80510 () Bool)

(assert start!80510)

(declare-fun b!945468 () Bool)

(declare-fun b_free!18097 () Bool)

(declare-fun b_next!18097 () Bool)

(assert (=> b!945468 (= b_free!18097 (not b_next!18097))))

(declare-fun tp!62809 () Bool)

(declare-fun b_and!29519 () Bool)

(assert (=> b!945468 (= tp!62809 b_and!29519)))

(declare-fun b!945466 () Bool)

(declare-fun e!531778 () Bool)

(declare-fun tp_is_empty!20605 () Bool)

(assert (=> b!945466 (= e!531778 tp_is_empty!20605)))

(declare-fun b!945467 () Bool)

(declare-fun e!531780 () Bool)

(declare-datatypes ((SeekEntryResult!9085 0))(
  ( (MissingZero!9085 (index!38711 (_ BitVec 32))) (Found!9085 (index!38712 (_ BitVec 32))) (Intermediate!9085 (undefined!9897 Bool) (index!38713 (_ BitVec 32)) (x!81232 (_ BitVec 32))) (Undefined!9085) (MissingVacant!9085 (index!38714 (_ BitVec 32))) )
))
(declare-fun lt!426027 () SeekEntryResult!9085)

(assert (=> b!945467 (= e!531780 (and (is-Found!9085 lt!426027) (bvslt (index!38712 lt!426027) #b00000000000000000000000000000000)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32439 0))(
  ( (V!32440 (val!10353 Int)) )
))
(declare-datatypes ((ValueCell!9821 0))(
  ( (ValueCellFull!9821 (v!12887 V!32439)) (EmptyCell!9821) )
))
(declare-datatypes ((array!57182 0))(
  ( (array!57183 (arr!27514 (Array (_ BitVec 32) ValueCell!9821)) (size!27982 (_ BitVec 32))) )
))
(declare-datatypes ((array!57184 0))(
  ( (array!57185 (arr!27515 (Array (_ BitVec 32) (_ BitVec 64))) (size!27983 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4792 0))(
  ( (LongMapFixedSize!4793 (defaultEntry!5693 Int) (mask!27361 (_ BitVec 32)) (extraKeys!5425 (_ BitVec 32)) (zeroValue!5529 V!32439) (minValue!5529 V!32439) (_size!2451 (_ BitVec 32)) (_keys!10573 array!57184) (_values!5716 array!57182) (_vacant!2451 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4792)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57184 (_ BitVec 32)) SeekEntryResult!9085)

(assert (=> b!945467 (= lt!426027 (seekEntry!0 key!756 (_keys!10573 thiss!1141) (mask!27361 thiss!1141)))))

(declare-fun mapNonEmpty!32741 () Bool)

(declare-fun mapRes!32741 () Bool)

(declare-fun tp!62808 () Bool)

(assert (=> mapNonEmpty!32741 (= mapRes!32741 (and tp!62808 e!531778))))

(declare-fun mapValue!32741 () ValueCell!9821)

(declare-fun mapRest!32741 () (Array (_ BitVec 32) ValueCell!9821))

(declare-fun mapKey!32741 () (_ BitVec 32))

(assert (=> mapNonEmpty!32741 (= (arr!27514 (_values!5716 thiss!1141)) (store mapRest!32741 mapKey!32741 mapValue!32741))))

(declare-fun mapIsEmpty!32741 () Bool)

(assert (=> mapIsEmpty!32741 mapRes!32741))

(declare-fun e!531782 () Bool)

(declare-fun e!531781 () Bool)

(declare-fun array_inv!21374 (array!57184) Bool)

(declare-fun array_inv!21375 (array!57182) Bool)

(assert (=> b!945468 (= e!531781 (and tp!62809 tp_is_empty!20605 (array_inv!21374 (_keys!10573 thiss!1141)) (array_inv!21375 (_values!5716 thiss!1141)) e!531782))))

(declare-fun b!945469 () Bool)

(declare-fun e!531779 () Bool)

(assert (=> b!945469 (= e!531782 (and e!531779 mapRes!32741))))

(declare-fun condMapEmpty!32741 () Bool)

(declare-fun mapDefault!32741 () ValueCell!9821)

