; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90166 () Bool)

(assert start!90166)

(declare-fun b!1032656 () Bool)

(declare-fun b_free!20741 () Bool)

(declare-fun b_next!20741 () Bool)

(assert (=> b!1032656 (= b_free!20741 (not b_next!20741))))

(declare-fun tp!73302 () Bool)

(declare-fun b_and!33209 () Bool)

(assert (=> b!1032656 (= tp!73302 b_and!33209)))

(declare-fun mapNonEmpty!38153 () Bool)

(declare-fun mapRes!38153 () Bool)

(declare-fun tp!73301 () Bool)

(declare-fun e!583537 () Bool)

(assert (=> mapNonEmpty!38153 (= mapRes!38153 (and tp!73301 e!583537))))

(declare-datatypes ((V!37487 0))(
  ( (V!37488 (val!12281 Int)) )
))
(declare-datatypes ((ValueCell!11527 0))(
  ( (ValueCellFull!11527 (v!14858 V!37487)) (EmptyCell!11527) )
))
(declare-fun mapValue!38153 () ValueCell!11527)

(declare-fun mapRest!38153 () (Array (_ BitVec 32) ValueCell!11527))

(declare-datatypes ((array!64990 0))(
  ( (array!64991 (arr!31295 (Array (_ BitVec 32) (_ BitVec 64))) (size!31814 (_ BitVec 32))) )
))
(declare-datatypes ((array!64992 0))(
  ( (array!64993 (arr!31296 (Array (_ BitVec 32) ValueCell!11527)) (size!31815 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5648 0))(
  ( (LongMapFixedSize!5649 (defaultEntry!6198 Int) (mask!30024 (_ BitVec 32)) (extraKeys!5930 (_ BitVec 32)) (zeroValue!6034 V!37487) (minValue!6034 V!37487) (_size!2879 (_ BitVec 32)) (_keys!11373 array!64990) (_values!6221 array!64992) (_vacant!2879 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5648)

(declare-fun mapKey!38153 () (_ BitVec 32))

(assert (=> mapNonEmpty!38153 (= (arr!31296 (_values!6221 thiss!1427)) (store mapRest!38153 mapKey!38153 mapValue!38153))))

(declare-fun b!1032655 () Bool)

(declare-fun res!690142 () Bool)

(declare-fun e!583535 () Bool)

(assert (=> b!1032655 (=> (not res!690142) (not e!583535))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032655 (= res!690142 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!583534 () Bool)

(declare-fun e!583533 () Bool)

(declare-fun tp_is_empty!24461 () Bool)

(declare-fun array_inv!24221 (array!64990) Bool)

(declare-fun array_inv!24222 (array!64992) Bool)

(assert (=> b!1032656 (= e!583533 (and tp!73302 tp_is_empty!24461 (array_inv!24221 (_keys!11373 thiss!1427)) (array_inv!24222 (_values!6221 thiss!1427)) e!583534))))

(declare-fun b!1032657 () Bool)

(declare-fun e!583536 () Bool)

(assert (=> b!1032657 (= e!583536 tp_is_empty!24461)))

(declare-fun b!1032658 () Bool)

(declare-fun res!690141 () Bool)

(assert (=> b!1032658 (=> (not res!690141) (not e!583535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032658 (= res!690141 (validMask!0 (mask!30024 thiss!1427)))))

(declare-fun b!1032659 () Bool)

(assert (=> b!1032659 (= e!583534 (and e!583536 mapRes!38153))))

(declare-fun condMapEmpty!38153 () Bool)

(declare-fun mapDefault!38153 () ValueCell!11527)

