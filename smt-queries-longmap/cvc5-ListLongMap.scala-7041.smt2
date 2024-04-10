; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89258 () Bool)

(assert start!89258)

(declare-fun b!1023497 () Bool)

(declare-fun b_free!20299 () Bool)

(declare-fun b_next!20299 () Bool)

(assert (=> b!1023497 (= b_free!20299 (not b_next!20299))))

(declare-fun tp!71931 () Bool)

(declare-fun b_and!32521 () Bool)

(assert (=> b!1023497 (= tp!71931 b_and!32521)))

(declare-fun res!685459 () Bool)

(declare-fun e!576728 () Bool)

(assert (=> start!89258 (=> (not res!685459) (not e!576728))))

(declare-datatypes ((V!36899 0))(
  ( (V!36900 (val!12060 Int)) )
))
(declare-datatypes ((ValueCell!11306 0))(
  ( (ValueCellFull!11306 (v!14629 V!36899)) (EmptyCell!11306) )
))
(declare-datatypes ((array!64082 0))(
  ( (array!64083 (arr!30853 (Array (_ BitVec 32) (_ BitVec 64))) (size!31364 (_ BitVec 32))) )
))
(declare-datatypes ((array!64084 0))(
  ( (array!64085 (arr!30854 (Array (_ BitVec 32) ValueCell!11306)) (size!31365 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5206 0))(
  ( (LongMapFixedSize!5207 (defaultEntry!5955 Int) (mask!29578 (_ BitVec 32)) (extraKeys!5687 (_ BitVec 32)) (zeroValue!5791 V!36899) (minValue!5791 V!36899) (_size!2658 (_ BitVec 32)) (_keys!11100 array!64082) (_values!5978 array!64084) (_vacant!2658 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5206)

(declare-fun valid!1983 (LongMapFixedSize!5206) Bool)

(assert (=> start!89258 (= res!685459 (valid!1983 thiss!1427))))

(assert (=> start!89258 e!576728))

(declare-fun e!576725 () Bool)

(assert (=> start!89258 e!576725))

(assert (=> start!89258 true))

(declare-fun b!1023491 () Bool)

(declare-fun res!685461 () Bool)

(assert (=> b!1023491 (=> (not res!685461) (not e!576728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023491 (= res!685461 (validMask!0 (mask!29578 thiss!1427)))))

(declare-fun mapNonEmpty!37446 () Bool)

(declare-fun mapRes!37446 () Bool)

(declare-fun tp!71932 () Bool)

(declare-fun e!576729 () Bool)

(assert (=> mapNonEmpty!37446 (= mapRes!37446 (and tp!71932 e!576729))))

(declare-fun mapValue!37446 () ValueCell!11306)

(declare-fun mapKey!37446 () (_ BitVec 32))

(declare-fun mapRest!37446 () (Array (_ BitVec 32) ValueCell!11306))

(assert (=> mapNonEmpty!37446 (= (arr!30854 (_values!5978 thiss!1427)) (store mapRest!37446 mapKey!37446 mapValue!37446))))

(declare-fun b!1023492 () Bool)

(declare-fun tp_is_empty!24019 () Bool)

(assert (=> b!1023492 (= e!576729 tp_is_empty!24019)))

(declare-fun mapIsEmpty!37446 () Bool)

(assert (=> mapIsEmpty!37446 mapRes!37446))

(declare-fun b!1023493 () Bool)

(declare-fun e!576727 () Bool)

(declare-fun e!576724 () Bool)

(assert (=> b!1023493 (= e!576727 (and e!576724 mapRes!37446))))

(declare-fun condMapEmpty!37446 () Bool)

(declare-fun mapDefault!37446 () ValueCell!11306)

