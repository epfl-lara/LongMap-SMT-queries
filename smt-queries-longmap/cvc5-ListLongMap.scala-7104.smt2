; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90070 () Bool)

(assert start!90070)

(declare-fun b!1031705 () Bool)

(declare-fun b_free!20677 () Bool)

(declare-fun b_next!20677 () Bool)

(assert (=> b!1031705 (= b_free!20677 (not b_next!20677))))

(declare-fun tp!73101 () Bool)

(declare-fun b_and!33121 () Bool)

(assert (=> b!1031705 (= tp!73101 b_and!33121)))

(declare-fun mapIsEmpty!38049 () Bool)

(declare-fun mapRes!38049 () Bool)

(assert (=> mapIsEmpty!38049 mapRes!38049))

(declare-fun b!1031695 () Bool)

(declare-fun e!582742 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37403 0))(
  ( (V!37404 (val!12249 Int)) )
))
(declare-datatypes ((ValueCell!11495 0))(
  ( (ValueCellFull!11495 (v!14826 V!37403)) (EmptyCell!11495) )
))
(declare-datatypes ((Unit!33755 0))(
  ( (Unit!33756) )
))
(declare-datatypes ((array!64858 0))(
  ( (array!64859 (arr!31231 (Array (_ BitVec 32) (_ BitVec 64))) (size!31748 (_ BitVec 32))) )
))
(declare-datatypes ((array!64860 0))(
  ( (array!64861 (arr!31232 (Array (_ BitVec 32) ValueCell!11495)) (size!31749 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5584 0))(
  ( (LongMapFixedSize!5585 (defaultEntry!6166 Int) (mask!29968 (_ BitVec 32)) (extraKeys!5898 (_ BitVec 32)) (zeroValue!6002 V!37403) (minValue!6002 V!37403) (_size!2847 (_ BitVec 32)) (_keys!11339 array!64858) (_values!6189 array!64860) (_vacant!2847 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15682 0))(
  ( (tuple2!15683 (_1!7852 Unit!33755) (_2!7852 LongMapFixedSize!5584)) )
))
(declare-fun lt!455593 () tuple2!15682)

(assert (=> b!1031695 (= e!582742 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5898 (_2!7852 lt!455593)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5898 (_2!7852 lt!455593)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1031696 () Bool)

(declare-fun e!582740 () Bool)

(declare-fun e!582745 () Bool)

(assert (=> b!1031696 (= e!582740 (and e!582745 mapRes!38049))))

(declare-fun condMapEmpty!38049 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5584)

(declare-fun mapDefault!38049 () ValueCell!11495)

