; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91036 () Bool)

(assert start!91036)

(declare-fun b!1039654 () Bool)

(declare-fun b_free!20983 () Bool)

(declare-fun b_next!20983 () Bool)

(assert (=> b!1039654 (= b_free!20983 (not b_next!20983))))

(declare-fun tp!74131 () Bool)

(declare-fun b_and!33515 () Bool)

(assert (=> b!1039654 (= tp!74131 b_and!33515)))

(declare-fun b!1039649 () Bool)

(declare-fun e!588444 () Bool)

(declare-fun tp_is_empty!24703 () Bool)

(assert (=> b!1039649 (= e!588444 tp_is_empty!24703)))

(declare-fun b!1039650 () Bool)

(declare-fun e!588446 () Bool)

(declare-fun mapRes!38620 () Bool)

(assert (=> b!1039650 (= e!588446 (and e!588444 mapRes!38620))))

(declare-fun condMapEmpty!38620 () Bool)

(declare-datatypes ((V!37811 0))(
  ( (V!37812 (val!12402 Int)) )
))
(declare-datatypes ((ValueCell!11648 0))(
  ( (ValueCellFull!11648 (v!14989 V!37811)) (EmptyCell!11648) )
))
(declare-datatypes ((array!65534 0))(
  ( (array!65535 (arr!31537 (Array (_ BitVec 32) (_ BitVec 64))) (size!32068 (_ BitVec 32))) )
))
(declare-datatypes ((array!65536 0))(
  ( (array!65537 (arr!31538 (Array (_ BitVec 32) ValueCell!11648)) (size!32069 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5890 0))(
  ( (LongMapFixedSize!5891 (defaultEntry!6327 Int) (mask!30298 (_ BitVec 32)) (extraKeys!6055 (_ BitVec 32)) (zeroValue!6161 V!37811) (minValue!6161 V!37811) (_size!3000 (_ BitVec 32)) (_keys!11539 array!65534) (_values!6350 array!65536) (_vacant!3000 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5890)

(declare-fun mapDefault!38620 () ValueCell!11648)

