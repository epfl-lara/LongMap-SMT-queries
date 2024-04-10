; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91092 () Bool)

(assert start!91092)

(declare-fun b!1040014 () Bool)

(declare-fun b_free!20999 () Bool)

(declare-fun b_next!20999 () Bool)

(assert (=> b!1040014 (= b_free!20999 (not b_next!20999))))

(declare-fun tp!74186 () Bool)

(declare-fun b_and!33531 () Bool)

(assert (=> b!1040014 (= tp!74186 b_and!33531)))

(declare-fun mapNonEmpty!38650 () Bool)

(declare-fun mapRes!38650 () Bool)

(declare-fun tp!74185 () Bool)

(declare-fun e!588735 () Bool)

(assert (=> mapNonEmpty!38650 (= mapRes!38650 (and tp!74185 e!588735))))

(declare-datatypes ((V!37831 0))(
  ( (V!37832 (val!12410 Int)) )
))
(declare-datatypes ((ValueCell!11656 0))(
  ( (ValueCellFull!11656 (v!14997 V!37831)) (EmptyCell!11656) )
))
(declare-datatypes ((array!65570 0))(
  ( (array!65571 (arr!31553 (Array (_ BitVec 32) (_ BitVec 64))) (size!32084 (_ BitVec 32))) )
))
(declare-datatypes ((array!65572 0))(
  ( (array!65573 (arr!31554 (Array (_ BitVec 32) ValueCell!11656)) (size!32085 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5906 0))(
  ( (LongMapFixedSize!5907 (defaultEntry!6335 Int) (mask!30316 (_ BitVec 32)) (extraKeys!6063 (_ BitVec 32)) (zeroValue!6169 V!37831) (minValue!6169 V!37831) (_size!3008 (_ BitVec 32)) (_keys!11551 array!65570) (_values!6358 array!65572) (_vacant!3008 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5906)

(declare-fun mapKey!38650 () (_ BitVec 32))

(declare-fun mapValue!38650 () ValueCell!11656)

(declare-fun mapRest!38650 () (Array (_ BitVec 32) ValueCell!11656))

(assert (=> mapNonEmpty!38650 (= (arr!31554 (_values!6358 thiss!1427)) (store mapRest!38650 mapKey!38650 mapValue!38650))))

(declare-fun b!1040009 () Bool)

(declare-fun tp_is_empty!24719 () Bool)

(assert (=> b!1040009 (= e!588735 tp_is_empty!24719)))

(declare-fun b!1040010 () Bool)

(declare-fun e!588729 () Bool)

(declare-fun e!588732 () Bool)

(assert (=> b!1040010 (= e!588729 (and e!588732 mapRes!38650))))

(declare-fun condMapEmpty!38650 () Bool)

(declare-fun mapDefault!38650 () ValueCell!11656)

