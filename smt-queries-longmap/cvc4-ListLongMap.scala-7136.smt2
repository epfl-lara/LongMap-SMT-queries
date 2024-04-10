; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90560 () Bool)

(assert start!90560)

(declare-fun b!1035819 () Bool)

(declare-fun b_free!20873 () Bool)

(declare-fun b_next!20873 () Bool)

(assert (=> b!1035819 (= b_free!20873 (not b_next!20873))))

(declare-fun tp!73749 () Bool)

(declare-fun b_and!33373 () Bool)

(assert (=> b!1035819 (= tp!73749 b_and!33373)))

(declare-fun b!1035811 () Bool)

(declare-fun res!691534 () Bool)

(declare-fun e!585769 () Bool)

(assert (=> b!1035811 (=> (not res!691534) (not e!585769))))

(declare-datatypes ((V!37663 0))(
  ( (V!37664 (val!12347 Int)) )
))
(declare-datatypes ((ValueCell!11593 0))(
  ( (ValueCellFull!11593 (v!14927 V!37663)) (EmptyCell!11593) )
))
(declare-datatypes ((array!65282 0))(
  ( (array!65283 (arr!31427 (Array (_ BitVec 32) (_ BitVec 64))) (size!31955 (_ BitVec 32))) )
))
(declare-datatypes ((array!65284 0))(
  ( (array!65285 (arr!31428 (Array (_ BitVec 32) ValueCell!11593)) (size!31956 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5780 0))(
  ( (LongMapFixedSize!5781 (defaultEntry!6268 Int) (mask!30165 (_ BitVec 32)) (extraKeys!5998 (_ BitVec 32)) (zeroValue!6102 V!37663) (minValue!6104 V!37663) (_size!2945 (_ BitVec 32)) (_keys!11456 array!65282) (_values!6291 array!65284) (_vacant!2945 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5780)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65282 (_ BitVec 32)) Bool)

(assert (=> b!1035811 (= res!691534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11456 thiss!1427) (mask!30165 thiss!1427)))))

(declare-fun mapIsEmpty!38403 () Bool)

(declare-fun mapRes!38403 () Bool)

(assert (=> mapIsEmpty!38403 mapRes!38403))

(declare-fun b!1035812 () Bool)

(declare-datatypes ((List!21917 0))(
  ( (Nil!21914) (Cons!21913 (h!23115 (_ BitVec 64)) (t!31120 List!21917)) )
))
(declare-fun arrayNoDuplicates!0 (array!65282 (_ BitVec 32) List!21917) Bool)

(assert (=> b!1035812 (= e!585769 (not (arrayNoDuplicates!0 (_keys!11456 thiss!1427) #b00000000000000000000000000000000 Nil!21914)))))

(declare-fun b!1035813 () Bool)

(declare-fun e!585767 () Bool)

(declare-fun tp_is_empty!24593 () Bool)

(assert (=> b!1035813 (= e!585767 tp_is_empty!24593)))

(declare-fun b!1035814 () Bool)

(declare-fun e!585765 () Bool)

(assert (=> b!1035814 (= e!585765 (and e!585767 mapRes!38403))))

(declare-fun condMapEmpty!38403 () Bool)

(declare-fun mapDefault!38403 () ValueCell!11593)

