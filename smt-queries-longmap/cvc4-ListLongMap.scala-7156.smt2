; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91066 () Bool)

(assert start!91066)

(declare-fun b!1039854 () Bool)

(declare-fun b_free!20993 () Bool)

(declare-fun b_next!20993 () Bool)

(assert (=> b!1039854 (= b_free!20993 (not b_next!20993))))

(declare-fun tp!74164 () Bool)

(declare-fun b_and!33525 () Bool)

(assert (=> b!1039854 (= tp!74164 b_and!33525)))

(declare-fun b!1039850 () Bool)

(declare-fun e!588613 () Bool)

(declare-fun tp_is_empty!24713 () Bool)

(assert (=> b!1039850 (= e!588613 tp_is_empty!24713)))

(declare-fun b!1039851 () Bool)

(declare-fun e!588610 () Bool)

(declare-fun e!588607 () Bool)

(declare-fun mapRes!38638 () Bool)

(assert (=> b!1039851 (= e!588610 (and e!588607 mapRes!38638))))

(declare-fun condMapEmpty!38638 () Bool)

(declare-datatypes ((V!37823 0))(
  ( (V!37824 (val!12407 Int)) )
))
(declare-datatypes ((ValueCell!11653 0))(
  ( (ValueCellFull!11653 (v!14994 V!37823)) (EmptyCell!11653) )
))
(declare-datatypes ((array!65556 0))(
  ( (array!65557 (arr!31547 (Array (_ BitVec 32) (_ BitVec 64))) (size!32078 (_ BitVec 32))) )
))
(declare-datatypes ((array!65558 0))(
  ( (array!65559 (arr!31548 (Array (_ BitVec 32) ValueCell!11653)) (size!32079 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5900 0))(
  ( (LongMapFixedSize!5901 (defaultEntry!6332 Int) (mask!30308 (_ BitVec 32)) (extraKeys!6060 (_ BitVec 32)) (zeroValue!6166 V!37823) (minValue!6166 V!37823) (_size!3005 (_ BitVec 32)) (_keys!11546 array!65556) (_values!6355 array!65558) (_vacant!3005 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5900)

(declare-fun mapDefault!38638 () ValueCell!11653)

