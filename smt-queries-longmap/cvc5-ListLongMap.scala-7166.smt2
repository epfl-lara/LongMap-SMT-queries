; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91428 () Bool)

(assert start!91428)

(declare-fun b!1041941 () Bool)

(declare-fun b_free!21049 () Bool)

(declare-fun b_next!21049 () Bool)

(assert (=> b!1041941 (= b_free!21049 (not b_next!21049))))

(declare-fun tp!74366 () Bool)

(declare-fun b_and!33581 () Bool)

(assert (=> b!1041941 (= tp!74366 b_and!33581)))

(declare-fun b!1041934 () Bool)

(declare-fun e!590140 () Bool)

(declare-fun e!590142 () Bool)

(declare-fun mapRes!38755 () Bool)

(assert (=> b!1041934 (= e!590140 (and e!590142 mapRes!38755))))

(declare-fun condMapEmpty!38755 () Bool)

(declare-datatypes ((V!37899 0))(
  ( (V!37900 (val!12435 Int)) )
))
(declare-datatypes ((ValueCell!11681 0))(
  ( (ValueCellFull!11681 (v!15025 V!37899)) (EmptyCell!11681) )
))
(declare-datatypes ((array!65688 0))(
  ( (array!65689 (arr!31603 (Array (_ BitVec 32) (_ BitVec 64))) (size!32137 (_ BitVec 32))) )
))
(declare-datatypes ((array!65690 0))(
  ( (array!65691 (arr!31604 (Array (_ BitVec 32) ValueCell!11681)) (size!32138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5956 0))(
  ( (LongMapFixedSize!5957 (defaultEntry!6360 Int) (mask!30406 (_ BitVec 32)) (extraKeys!6088 (_ BitVec 32)) (zeroValue!6194 V!37899) (minValue!6194 V!37899) (_size!3033 (_ BitVec 32)) (_keys!11603 array!65688) (_values!6383 array!65690) (_vacant!3033 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5956)

(declare-fun mapDefault!38755 () ValueCell!11681)

