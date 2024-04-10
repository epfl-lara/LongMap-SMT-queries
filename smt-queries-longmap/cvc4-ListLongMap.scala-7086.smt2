; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89574 () Bool)

(assert start!89574)

(declare-fun b!1027521 () Bool)

(declare-fun b_free!20573 () Bool)

(declare-fun b_next!20573 () Bool)

(assert (=> b!1027521 (= b_free!20573 (not b_next!20573))))

(declare-fun tp!72764 () Bool)

(declare-fun b_and!32823 () Bool)

(assert (=> b!1027521 (= tp!72764 b_and!32823)))

(declare-fun mapNonEmpty!37868 () Bool)

(declare-fun mapRes!37868 () Bool)

(declare-fun tp!72765 () Bool)

(declare-fun e!579922 () Bool)

(assert (=> mapNonEmpty!37868 (= mapRes!37868 (and tp!72765 e!579922))))

(declare-fun mapKey!37868 () (_ BitVec 32))

(declare-datatypes ((V!37263 0))(
  ( (V!37264 (val!12197 Int)) )
))
(declare-datatypes ((ValueCell!11443 0))(
  ( (ValueCellFull!11443 (v!14766 V!37263)) (EmptyCell!11443) )
))
(declare-fun mapRest!37868 () (Array (_ BitVec 32) ValueCell!11443))

(declare-fun mapValue!37868 () ValueCell!11443)

(declare-datatypes ((array!64636 0))(
  ( (array!64637 (arr!31127 (Array (_ BitVec 32) (_ BitVec 64))) (size!31640 (_ BitVec 32))) )
))
(declare-datatypes ((array!64638 0))(
  ( (array!64639 (arr!31128 (Array (_ BitVec 32) ValueCell!11443)) (size!31641 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5480 0))(
  ( (LongMapFixedSize!5481 (defaultEntry!6092 Int) (mask!29810 (_ BitVec 32)) (extraKeys!5824 (_ BitVec 32)) (zeroValue!5928 V!37263) (minValue!5928 V!37263) (_size!2795 (_ BitVec 32)) (_keys!11239 array!64636) (_values!6115 array!64638) (_vacant!2795 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5480)

(assert (=> mapNonEmpty!37868 (= (arr!31128 (_values!6115 thiss!1427)) (store mapRest!37868 mapKey!37868 mapValue!37868))))

(declare-fun res!687741 () Bool)

(declare-fun e!579921 () Bool)

(assert (=> start!89574 (=> (not res!687741) (not e!579921))))

(declare-fun valid!2075 (LongMapFixedSize!5480) Bool)

(assert (=> start!89574 (= res!687741 (valid!2075 thiss!1427))))

(assert (=> start!89574 e!579921))

(declare-fun e!579925 () Bool)

(assert (=> start!89574 e!579925))

(assert (=> start!89574 true))

(declare-fun e!579919 () Bool)

(declare-fun tp_is_empty!24293 () Bool)

(declare-fun array_inv!24097 (array!64636) Bool)

(declare-fun array_inv!24098 (array!64638) Bool)

(assert (=> b!1027521 (= e!579925 (and tp!72764 tp_is_empty!24293 (array_inv!24097 (_keys!11239 thiss!1427)) (array_inv!24098 (_values!6115 thiss!1427)) e!579919))))

(declare-fun b!1027522 () Bool)

(declare-fun e!579920 () Bool)

(assert (=> b!1027522 (= e!579921 e!579920)))

(declare-fun res!687742 () Bool)

(assert (=> b!1027522 (=> (not res!687742) (not e!579920))))

(declare-datatypes ((SeekEntryResult!9675 0))(
  ( (MissingZero!9675 (index!41071 (_ BitVec 32))) (Found!9675 (index!41072 (_ BitVec 32))) (Intermediate!9675 (undefined!10487 Bool) (index!41073 (_ BitVec 32)) (x!91439 (_ BitVec 32))) (Undefined!9675) (MissingVacant!9675 (index!41074 (_ BitVec 32))) )
))
(declare-fun lt!452338 () SeekEntryResult!9675)

(assert (=> b!1027522 (= res!687742 (is-Found!9675 lt!452338))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64636 (_ BitVec 32)) SeekEntryResult!9675)

(assert (=> b!1027522 (= lt!452338 (seekEntry!0 key!909 (_keys!11239 thiss!1427) (mask!29810 thiss!1427)))))

(declare-fun b!1027523 () Bool)

(declare-fun e!579923 () Bool)

(assert (=> b!1027523 (= e!579919 (and e!579923 mapRes!37868))))

(declare-fun condMapEmpty!37868 () Bool)

(declare-fun mapDefault!37868 () ValueCell!11443)

