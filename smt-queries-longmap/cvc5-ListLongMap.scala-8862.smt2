; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107544 () Bool)

(assert start!107544)

(declare-fun b!1273365 () Bool)

(declare-fun b_free!27715 () Bool)

(declare-fun b_next!27715 () Bool)

(assert (=> b!1273365 (= b_free!27715 (not b_next!27715))))

(declare-fun tp!97689 () Bool)

(declare-fun b_and!45771 () Bool)

(assert (=> b!1273365 (= tp!97689 b_and!45771)))

(declare-fun b!1273362 () Bool)

(declare-fun e!726473 () Bool)

(declare-fun tp_is_empty!33085 () Bool)

(assert (=> b!1273362 (= e!726473 tp_is_empty!33085)))

(declare-fun mapIsEmpty!51246 () Bool)

(declare-fun mapRes!51246 () Bool)

(assert (=> mapIsEmpty!51246 mapRes!51246))

(declare-fun mapNonEmpty!51246 () Bool)

(declare-fun tp!97688 () Bool)

(assert (=> mapNonEmpty!51246 (= mapRes!51246 (and tp!97688 e!726473))))

(declare-fun mapKey!51246 () (_ BitVec 32))

(declare-datatypes ((V!49307 0))(
  ( (V!49308 (val!16617 Int)) )
))
(declare-datatypes ((ValueCell!15689 0))(
  ( (ValueCellFull!15689 (v!19254 V!49307)) (EmptyCell!15689) )
))
(declare-fun mapValue!51246 () ValueCell!15689)

(declare-fun mapRest!51246 () (Array (_ BitVec 32) ValueCell!15689))

(declare-datatypes ((array!83440 0))(
  ( (array!83441 (arr!40246 (Array (_ BitVec 32) ValueCell!15689)) (size!40787 (_ BitVec 32))) )
))
(declare-datatypes ((array!83442 0))(
  ( (array!83443 (arr!40247 (Array (_ BitVec 32) (_ BitVec 64))) (size!40788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6142 0))(
  ( (LongMapFixedSize!6143 (defaultEntry!6717 Int) (mask!34496 (_ BitVec 32)) (extraKeys!6396 (_ BitVec 32)) (zeroValue!6502 V!49307) (minValue!6502 V!49307) (_size!3126 (_ BitVec 32)) (_keys!12131 array!83442) (_values!6740 array!83440) (_vacant!3126 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6142)

(assert (=> mapNonEmpty!51246 (= (arr!40246 (_values!6740 thiss!1551)) (store mapRest!51246 mapKey!51246 mapValue!51246))))

(declare-fun b!1273363 () Bool)

(declare-fun e!726470 () Bool)

(assert (=> b!1273363 (= e!726470 (bvsgt #b00000000000000000000000000000000 (size!40788 (_keys!12131 thiss!1551))))))

(declare-fun b!1273364 () Bool)

(declare-fun e!726468 () Bool)

(declare-fun e!726469 () Bool)

(assert (=> b!1273364 (= e!726468 (and e!726469 mapRes!51246))))

(declare-fun condMapEmpty!51246 () Bool)

(declare-fun mapDefault!51246 () ValueCell!15689)

