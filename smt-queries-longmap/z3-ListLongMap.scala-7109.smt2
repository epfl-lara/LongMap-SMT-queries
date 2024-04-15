; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90098 () Bool)

(assert start!90098)

(declare-fun b!1032043 () Bool)

(declare-fun b_free!20707 () Bool)

(declare-fun b_next!20707 () Bool)

(assert (=> b!1032043 (= b_free!20707 (not b_next!20707))))

(declare-fun tp!73192 () Bool)

(declare-fun b_and!33149 () Bool)

(assert (=> b!1032043 (= tp!73192 b_and!33149)))

(declare-fun b!1032041 () Bool)

(declare-fun e!583056 () Bool)

(declare-fun tp_is_empty!24427 () Bool)

(assert (=> b!1032041 (= e!583056 tp_is_empty!24427)))

(declare-fun b!1032042 () Bool)

(declare-fun e!583057 () Bool)

(declare-fun mapRes!38094 () Bool)

(assert (=> b!1032042 (= e!583057 (and e!583056 mapRes!38094))))

(declare-fun condMapEmpty!38094 () Bool)

(declare-datatypes ((V!37443 0))(
  ( (V!37444 (val!12264 Int)) )
))
(declare-datatypes ((ValueCell!11510 0))(
  ( (ValueCellFull!11510 (v!14840 V!37443)) (EmptyCell!11510) )
))
(declare-datatypes ((array!64857 0))(
  ( (array!64858 (arr!31230 (Array (_ BitVec 32) (_ BitVec 64))) (size!31749 (_ BitVec 32))) )
))
(declare-datatypes ((array!64859 0))(
  ( (array!64860 (arr!31231 (Array (_ BitVec 32) ValueCell!11510)) (size!31750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5614 0))(
  ( (LongMapFixedSize!5615 (defaultEntry!6181 Int) (mask!29988 (_ BitVec 32)) (extraKeys!5913 (_ BitVec 32)) (zeroValue!6017 V!37443) (minValue!6017 V!37443) (_size!2862 (_ BitVec 32)) (_keys!11350 array!64857) (_values!6204 array!64859) (_vacant!2862 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5614)

(declare-fun mapDefault!38094 () ValueCell!11510)

(assert (=> b!1032042 (= condMapEmpty!38094 (= (arr!31231 (_values!6204 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11510)) mapDefault!38094)))))

(declare-fun mapIsEmpty!38094 () Bool)

(assert (=> mapIsEmpty!38094 mapRes!38094))

(declare-fun e!583054 () Bool)

(declare-fun array_inv!24169 (array!64857) Bool)

(declare-fun array_inv!24170 (array!64859) Bool)

(assert (=> b!1032043 (= e!583054 (and tp!73192 tp_is_empty!24427 (array_inv!24169 (_keys!11350 thiss!1427)) (array_inv!24170 (_values!6204 thiss!1427)) e!583057))))

(declare-fun mapNonEmpty!38094 () Bool)

(declare-fun tp!73191 () Bool)

(declare-fun e!583055 () Bool)

(assert (=> mapNonEmpty!38094 (= mapRes!38094 (and tp!73191 e!583055))))

(declare-fun mapValue!38094 () ValueCell!11510)

(declare-fun mapRest!38094 () (Array (_ BitVec 32) ValueCell!11510))

(declare-fun mapKey!38094 () (_ BitVec 32))

(assert (=> mapNonEmpty!38094 (= (arr!31231 (_values!6204 thiss!1427)) (store mapRest!38094 mapKey!38094 mapValue!38094))))

(declare-fun res!689883 () Bool)

(declare-fun e!583058 () Bool)

(assert (=> start!90098 (=> (not res!689883) (not e!583058))))

(declare-fun valid!2115 (LongMapFixedSize!5614) Bool)

(assert (=> start!90098 (= res!689883 (valid!2115 thiss!1427))))

(assert (=> start!90098 e!583058))

(assert (=> start!90098 e!583054))

(assert (=> start!90098 true))

(declare-fun b!1032044 () Bool)

(declare-fun res!689884 () Bool)

(assert (=> b!1032044 (=> (not res!689884) (not e!583058))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032044 (= res!689884 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032045 () Bool)

(assert (=> b!1032045 (= e!583055 tp_is_empty!24427)))

(declare-fun b!1032046 () Bool)

(assert (=> b!1032046 (= e!583058 false)))

(declare-datatypes ((SeekEntryResult!9716 0))(
  ( (MissingZero!9716 (index!41235 (_ BitVec 32))) (Found!9716 (index!41236 (_ BitVec 32))) (Intermediate!9716 (undefined!10528 Bool) (index!41237 (_ BitVec 32)) (x!91953 (_ BitVec 32))) (Undefined!9716) (MissingVacant!9716 (index!41238 (_ BitVec 32))) )
))
(declare-fun lt!455805 () SeekEntryResult!9716)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64857 (_ BitVec 32)) SeekEntryResult!9716)

(assert (=> b!1032046 (= lt!455805 (seekEntry!0 key!909 (_keys!11350 thiss!1427) (mask!29988 thiss!1427)))))

(assert (= (and start!90098 res!689883) b!1032044))

(assert (= (and b!1032044 res!689884) b!1032046))

(assert (= (and b!1032042 condMapEmpty!38094) mapIsEmpty!38094))

(assert (= (and b!1032042 (not condMapEmpty!38094)) mapNonEmpty!38094))

(get-info :version)

(assert (= (and mapNonEmpty!38094 ((_ is ValueCellFull!11510) mapValue!38094)) b!1032045))

(assert (= (and b!1032042 ((_ is ValueCellFull!11510) mapDefault!38094)) b!1032041))

(assert (= b!1032043 b!1032042))

(assert (= start!90098 b!1032043))

(declare-fun m!951967 () Bool)

(assert (=> b!1032043 m!951967))

(declare-fun m!951969 () Bool)

(assert (=> b!1032043 m!951969))

(declare-fun m!951971 () Bool)

(assert (=> mapNonEmpty!38094 m!951971))

(declare-fun m!951973 () Bool)

(assert (=> start!90098 m!951973))

(declare-fun m!951975 () Bool)

(assert (=> b!1032046 m!951975))

(check-sat (not b!1032043) (not b_next!20707) (not start!90098) tp_is_empty!24427 b_and!33149 (not b!1032046) (not mapNonEmpty!38094))
(check-sat b_and!33149 (not b_next!20707))
