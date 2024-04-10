; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89472 () Bool)

(assert start!89472)

(declare-fun b!1026074 () Bool)

(declare-fun b_free!20471 () Bool)

(declare-fun b_next!20471 () Bool)

(assert (=> b!1026074 (= b_free!20471 (not b_next!20471))))

(declare-fun tp!72459 () Bool)

(declare-fun b_and!32717 () Bool)

(assert (=> b!1026074 (= tp!72459 b_and!32717)))

(declare-fun b!1026068 () Bool)

(declare-fun e!578705 () Bool)

(declare-fun tp_is_empty!24191 () Bool)

(assert (=> b!1026068 (= e!578705 tp_is_empty!24191)))

(declare-fun mapIsEmpty!37715 () Bool)

(declare-fun mapRes!37715 () Bool)

(assert (=> mapIsEmpty!37715 mapRes!37715))

(declare-fun b!1026069 () Bool)

(declare-fun e!578707 () Bool)

(assert (=> b!1026069 (= e!578707 true)))

(declare-fun lt!451287 () Bool)

(declare-datatypes ((V!37127 0))(
  ( (V!37128 (val!12146 Int)) )
))
(declare-datatypes ((ValueCell!11392 0))(
  ( (ValueCellFull!11392 (v!14715 V!37127)) (EmptyCell!11392) )
))
(declare-datatypes ((array!64432 0))(
  ( (array!64433 (arr!31025 (Array (_ BitVec 32) (_ BitVec 64))) (size!31538 (_ BitVec 32))) )
))
(declare-datatypes ((array!64434 0))(
  ( (array!64435 (arr!31026 (Array (_ BitVec 32) ValueCell!11392)) (size!31539 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5378 0))(
  ( (LongMapFixedSize!5379 (defaultEntry!6041 Int) (mask!29725 (_ BitVec 32)) (extraKeys!5773 (_ BitVec 32)) (zeroValue!5877 V!37127) (minValue!5877 V!37127) (_size!2744 (_ BitVec 32)) (_keys!11188 array!64432) (_values!6064 array!64434) (_vacant!2744 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5378)

(declare-datatypes ((List!21769 0))(
  ( (Nil!21766) (Cons!21765 (h!22963 (_ BitVec 64)) (t!30831 List!21769)) )
))
(declare-fun arrayNoDuplicates!0 (array!64432 (_ BitVec 32) List!21769) Bool)

(assert (=> b!1026069 (= lt!451287 (arrayNoDuplicates!0 (_keys!11188 thiss!1427) #b00000000000000000000000000000000 Nil!21766))))

(declare-fun b!1026070 () Bool)

(declare-fun e!578706 () Bool)

(declare-fun e!578708 () Bool)

(assert (=> b!1026070 (= e!578706 (and e!578708 mapRes!37715))))

(declare-fun condMapEmpty!37715 () Bool)

(declare-fun mapDefault!37715 () ValueCell!11392)

