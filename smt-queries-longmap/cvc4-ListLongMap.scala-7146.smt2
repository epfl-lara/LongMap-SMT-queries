; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90816 () Bool)

(assert start!90816)

(declare-fun b!1038192 () Bool)

(declare-fun b_free!20933 () Bool)

(declare-fun b_next!20933 () Bool)

(assert (=> b!1038192 (= b_free!20933 (not b_next!20933))))

(declare-fun tp!73956 () Bool)

(declare-fun b_and!33465 () Bool)

(assert (=> b!1038192 (= tp!73956 b_and!33465)))

(declare-fun b!1038181 () Bool)

(declare-fun e!587392 () Bool)

(declare-fun e!587395 () Bool)

(declare-fun mapRes!38520 () Bool)

(assert (=> b!1038181 (= e!587392 (and e!587395 mapRes!38520))))

(declare-fun condMapEmpty!38520 () Bool)

(declare-datatypes ((V!37743 0))(
  ( (V!37744 (val!12377 Int)) )
))
(declare-datatypes ((ValueCell!11623 0))(
  ( (ValueCellFull!11623 (v!14962 V!37743)) (EmptyCell!11623) )
))
(declare-datatypes ((array!65418 0))(
  ( (array!65419 (arr!31487 (Array (_ BitVec 32) (_ BitVec 64))) (size!32017 (_ BitVec 32))) )
))
(declare-datatypes ((array!65420 0))(
  ( (array!65421 (arr!31488 (Array (_ BitVec 32) ValueCell!11623)) (size!32018 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5840 0))(
  ( (LongMapFixedSize!5841 (defaultEntry!6302 Int) (mask!30235 (_ BitVec 32)) (extraKeys!6030 (_ BitVec 32)) (zeroValue!6136 V!37743) (minValue!6136 V!37743) (_size!2975 (_ BitVec 32)) (_keys!11502 array!65418) (_values!6325 array!65420) (_vacant!2975 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5840)

(declare-fun mapDefault!38520 () ValueCell!11623)

