; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89478 () Bool)

(assert start!89478)

(declare-fun b!1026140 () Bool)

(declare-fun b_free!20477 () Bool)

(declare-fun b_next!20477 () Bool)

(assert (=> b!1026140 (= b_free!20477 (not b_next!20477))))

(declare-fun tp!72477 () Bool)

(declare-fun b_and!32723 () Bool)

(assert (=> b!1026140 (= tp!72477 b_and!32723)))

(declare-fun b!1026139 () Bool)

(declare-fun e!578778 () Bool)

(assert (=> b!1026139 (= e!578778 true)))

(declare-fun lt!451344 () Bool)

(declare-datatypes ((V!37135 0))(
  ( (V!37136 (val!12149 Int)) )
))
(declare-datatypes ((ValueCell!11395 0))(
  ( (ValueCellFull!11395 (v!14718 V!37135)) (EmptyCell!11395) )
))
(declare-datatypes ((array!64444 0))(
  ( (array!64445 (arr!31031 (Array (_ BitVec 32) (_ BitVec 64))) (size!31544 (_ BitVec 32))) )
))
(declare-datatypes ((array!64446 0))(
  ( (array!64447 (arr!31032 (Array (_ BitVec 32) ValueCell!11395)) (size!31545 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5384 0))(
  ( (LongMapFixedSize!5385 (defaultEntry!6044 Int) (mask!29730 (_ BitVec 32)) (extraKeys!5776 (_ BitVec 32)) (zeroValue!5880 V!37135) (minValue!5880 V!37135) (_size!2747 (_ BitVec 32)) (_keys!11191 array!64444) (_values!6067 array!64446) (_vacant!2747 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5384)

(declare-datatypes ((List!21771 0))(
  ( (Nil!21768) (Cons!21767 (h!22965 (_ BitVec 64)) (t!30833 List!21771)) )
))
(declare-fun arrayNoDuplicates!0 (array!64444 (_ BitVec 32) List!21771) Bool)

(assert (=> b!1026139 (= lt!451344 (arrayNoDuplicates!0 (_keys!11191 thiss!1427) #b00000000000000000000000000000000 Nil!21768))))

(declare-fun e!578775 () Bool)

(declare-fun e!578777 () Bool)

(declare-fun tp_is_empty!24197 () Bool)

(declare-fun array_inv!24031 (array!64444) Bool)

(declare-fun array_inv!24032 (array!64446) Bool)

(assert (=> b!1026140 (= e!578777 (and tp!72477 tp_is_empty!24197 (array_inv!24031 (_keys!11191 thiss!1427)) (array_inv!24032 (_values!6067 thiss!1427)) e!578775))))

(declare-fun b!1026141 () Bool)

(declare-fun e!578780 () Bool)

(declare-fun mapRes!37724 () Bool)

(assert (=> b!1026141 (= e!578775 (and e!578780 mapRes!37724))))

(declare-fun condMapEmpty!37724 () Bool)

(declare-fun mapDefault!37724 () ValueCell!11395)

