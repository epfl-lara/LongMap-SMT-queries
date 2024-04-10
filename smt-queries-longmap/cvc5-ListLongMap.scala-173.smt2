; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3298 () Bool)

(assert start!3298)

(declare-fun b!20286 () Bool)

(declare-fun b_free!715 () Bool)

(declare-fun b_next!715 () Bool)

(assert (=> b!20286 (= b_free!715 (not b_next!715))))

(declare-fun tp!3372 () Bool)

(declare-fun b_and!1391 () Bool)

(assert (=> b!20286 (= tp!3372 b_and!1391)))

(declare-fun mapNonEmpty!940 () Bool)

(declare-fun mapRes!940 () Bool)

(declare-fun tp!3373 () Bool)

(declare-fun e!13258 () Bool)

(assert (=> mapNonEmpty!940 (= mapRes!940 (and tp!3373 e!13258))))

(declare-datatypes ((V!1131 0))(
  ( (V!1132 (val!516 Int)) )
))
(declare-datatypes ((ValueCell!290 0))(
  ( (ValueCellFull!290 (v!1549 V!1131)) (EmptyCell!290) )
))
(declare-fun mapValue!940 () ValueCell!290)

(declare-fun mapKey!940 () (_ BitVec 32))

(declare-datatypes ((array!1183 0))(
  ( (array!1184 (arr!563 (Array (_ BitVec 32) ValueCell!290)) (size!656 (_ BitVec 32))) )
))
(declare-datatypes ((array!1185 0))(
  ( (array!1186 (arr!564 (Array (_ BitVec 32) (_ BitVec 64))) (size!657 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!166 0))(
  ( (LongMapFixedSize!167 (defaultEntry!1706 Int) (mask!4670 (_ BitVec 32)) (extraKeys!1612 (_ BitVec 32)) (zeroValue!1636 V!1131) (minValue!1636 V!1131) (_size!121 (_ BitVec 32)) (_keys!3130 array!1185) (_values!1698 array!1183) (_vacant!121 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!166 0))(
  ( (Cell!167 (v!1550 LongMapFixedSize!166)) )
))
(declare-datatypes ((LongMap!166 0))(
  ( (LongMap!167 (underlying!94 Cell!166)) )
))
(declare-fun thiss!938 () LongMap!166)

(declare-fun mapRest!940 () (Array (_ BitVec 32) ValueCell!290))

(assert (=> mapNonEmpty!940 (= (arr!563 (_values!1698 (v!1550 (underlying!94 thiss!938)))) (store mapRest!940 mapKey!940 mapValue!940))))

(declare-fun b!20278 () Bool)

(declare-fun c!2190 () Bool)

(declare-fun lt!5926 () Bool)

(assert (=> b!20278 (= c!2190 (and (not (= (bvand (extraKeys!1612 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5926))))

(declare-datatypes ((tuple2!850 0))(
  ( (tuple2!851 (_1!428 Bool) (_2!428 Cell!166)) )
))
(declare-fun e!13260 () tuple2!850)

(declare-fun e!13261 () tuple2!850)

(assert (=> b!20278 (= e!13260 e!13261)))

(declare-fun b!20279 () Bool)

(declare-datatypes ((tuple2!852 0))(
  ( (tuple2!853 (_1!429 Bool) (_2!429 LongMapFixedSize!166)) )
))
(declare-fun lt!5923 () tuple2!852)

(assert (=> b!20279 (= e!13261 (tuple2!851 (_1!429 lt!5923) (Cell!167 (_2!429 lt!5923))))))

(declare-fun call!999 () tuple2!852)

(assert (=> b!20279 (= lt!5923 call!999)))

(declare-fun mapIsEmpty!940 () Bool)

(assert (=> mapIsEmpty!940 mapRes!940))

(declare-fun b!20280 () Bool)

(declare-fun e!13259 () Bool)

(declare-fun e!13256 () Bool)

(assert (=> b!20280 (= e!13259 (and e!13256 mapRes!940))))

(declare-fun condMapEmpty!940 () Bool)

(declare-fun mapDefault!940 () ValueCell!290)

