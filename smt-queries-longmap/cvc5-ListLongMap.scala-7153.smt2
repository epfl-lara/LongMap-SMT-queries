; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90982 () Bool)

(assert start!90982)

(declare-fun b!1039289 () Bool)

(declare-fun b_free!20971 () Bool)

(declare-fun b_next!20971 () Bool)

(assert (=> b!1039289 (= b_free!20971 (not b_next!20971))))

(declare-fun tp!74090 () Bool)

(declare-fun b_and!33503 () Bool)

(assert (=> b!1039289 (= tp!74090 b_and!33503)))

(declare-fun mapIsEmpty!38596 () Bool)

(declare-fun mapRes!38596 () Bool)

(assert (=> mapIsEmpty!38596 mapRes!38596))

(declare-fun b!1039282 () Bool)

(declare-fun res!693112 () Bool)

(declare-fun e!588196 () Bool)

(assert (=> b!1039282 (=> (not res!693112) (not e!588196))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039282 (= res!693112 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039283 () Bool)

(declare-fun e!588192 () Bool)

(declare-datatypes ((V!37795 0))(
  ( (V!37796 (val!12396 Int)) )
))
(declare-datatypes ((ValueCell!11642 0))(
  ( (ValueCellFull!11642 (v!14983 V!37795)) (EmptyCell!11642) )
))
(declare-datatypes ((array!65506 0))(
  ( (array!65507 (arr!31525 (Array (_ BitVec 32) (_ BitVec 64))) (size!32056 (_ BitVec 32))) )
))
(declare-datatypes ((array!65508 0))(
  ( (array!65509 (arr!31526 (Array (_ BitVec 32) ValueCell!11642)) (size!32057 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5878 0))(
  ( (LongMapFixedSize!5879 (defaultEntry!6321 Int) (mask!30283 (_ BitVec 32)) (extraKeys!6049 (_ BitVec 32)) (zeroValue!6155 V!37795) (minValue!6155 V!37795) (_size!2994 (_ BitVec 32)) (_keys!11530 array!65506) (_values!6344 array!65508) (_vacant!2994 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5878)

(declare-datatypes ((List!21945 0))(
  ( (Nil!21942) (Cons!21941 (h!23145 (_ BitVec 64)) (t!31159 List!21945)) )
))
(declare-fun arrayNoDuplicates!0 (array!65506 (_ BitVec 32) List!21945) Bool)

(assert (=> b!1039283 (= e!588192 (arrayNoDuplicates!0 (_keys!11530 thiss!1427) #b00000000000000000000000000000000 Nil!21942))))

(declare-fun mapNonEmpty!38596 () Bool)

(declare-fun tp!74089 () Bool)

(declare-fun e!588193 () Bool)

(assert (=> mapNonEmpty!38596 (= mapRes!38596 (and tp!74089 e!588193))))

(declare-fun mapValue!38596 () ValueCell!11642)

(declare-fun mapRest!38596 () (Array (_ BitVec 32) ValueCell!11642))

(declare-fun mapKey!38596 () (_ BitVec 32))

(assert (=> mapNonEmpty!38596 (= (arr!31526 (_values!6344 thiss!1427)) (store mapRest!38596 mapKey!38596 mapValue!38596))))

(declare-fun b!1039284 () Bool)

(declare-fun e!588195 () Bool)

(declare-fun e!588197 () Bool)

(assert (=> b!1039284 (= e!588195 (and e!588197 mapRes!38596))))

(declare-fun condMapEmpty!38596 () Bool)

(declare-fun mapDefault!38596 () ValueCell!11642)

