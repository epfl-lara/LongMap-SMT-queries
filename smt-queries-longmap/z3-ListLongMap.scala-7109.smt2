; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90334 () Bool)

(assert start!90334)

(declare-fun b!1033511 () Bool)

(declare-fun b_free!20707 () Bool)

(declare-fun b_next!20707 () Bool)

(assert (=> b!1033511 (= b_free!20707 (not b_next!20707))))

(declare-fun tp!73192 () Bool)

(declare-fun b_and!33185 () Bool)

(assert (=> b!1033511 (= tp!73192 b_and!33185)))

(declare-fun mapNonEmpty!38094 () Bool)

(declare-fun mapRes!38094 () Bool)

(declare-fun tp!73191 () Bool)

(declare-fun e!583987 () Bool)

(assert (=> mapNonEmpty!38094 (= mapRes!38094 (and tp!73191 e!583987))))

(declare-fun mapKey!38094 () (_ BitVec 32))

(declare-datatypes ((V!37443 0))(
  ( (V!37444 (val!12264 Int)) )
))
(declare-datatypes ((ValueCell!11510 0))(
  ( (ValueCellFull!11510 (v!14837 V!37443)) (EmptyCell!11510) )
))
(declare-fun mapValue!38094 () ValueCell!11510)

(declare-fun mapRest!38094 () (Array (_ BitVec 32) ValueCell!11510))

(declare-datatypes ((array!64967 0))(
  ( (array!64968 (arr!31279 (Array (_ BitVec 32) (_ BitVec 64))) (size!31797 (_ BitVec 32))) )
))
(declare-datatypes ((array!64969 0))(
  ( (array!64970 (arr!31280 (Array (_ BitVec 32) ValueCell!11510)) (size!31798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5614 0))(
  ( (LongMapFixedSize!5615 (defaultEntry!6181 Int) (mask!30053 (_ BitVec 32)) (extraKeys!5913 (_ BitVec 32)) (zeroValue!6017 V!37443) (minValue!6017 V!37443) (_size!2862 (_ BitVec 32)) (_keys!11392 array!64967) (_values!6204 array!64969) (_vacant!2862 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5614)

(assert (=> mapNonEmpty!38094 (= (arr!31280 (_values!6204 thiss!1427)) (store mapRest!38094 mapKey!38094 mapValue!38094))))

(declare-fun b!1033507 () Bool)

(declare-fun e!583988 () Bool)

(declare-fun e!583992 () Bool)

(assert (=> b!1033507 (= e!583988 (and e!583992 mapRes!38094))))

(declare-fun condMapEmpty!38094 () Bool)

(declare-fun mapDefault!38094 () ValueCell!11510)

(assert (=> b!1033507 (= condMapEmpty!38094 (= (arr!31280 (_values!6204 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11510)) mapDefault!38094)))))

(declare-fun b!1033508 () Bool)

(declare-fun res!690460 () Bool)

(declare-fun e!583989 () Bool)

(assert (=> b!1033508 (=> (not res!690460) (not e!583989))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033508 (= res!690460 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1033509 () Bool)

(assert (=> b!1033509 (= e!583989 false)))

(declare-datatypes ((SeekEntryResult!9680 0))(
  ( (MissingZero!9680 (index!41091 (_ BitVec 32))) (Found!9680 (index!41092 (_ BitVec 32))) (Intermediate!9680 (undefined!10492 Bool) (index!41093 (_ BitVec 32)) (x!91942 (_ BitVec 32))) (Undefined!9680) (MissingVacant!9680 (index!41094 (_ BitVec 32))) )
))
(declare-fun lt!456520 () SeekEntryResult!9680)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64967 (_ BitVec 32)) SeekEntryResult!9680)

(assert (=> b!1033509 (= lt!456520 (seekEntry!0 key!909 (_keys!11392 thiss!1427) (mask!30053 thiss!1427)))))

(declare-fun b!1033510 () Bool)

(declare-fun tp_is_empty!24427 () Bool)

(assert (=> b!1033510 (= e!583987 tp_is_empty!24427)))

(declare-fun e!583991 () Bool)

(declare-fun array_inv!24219 (array!64967) Bool)

(declare-fun array_inv!24220 (array!64969) Bool)

(assert (=> b!1033511 (= e!583991 (and tp!73192 tp_is_empty!24427 (array_inv!24219 (_keys!11392 thiss!1427)) (array_inv!24220 (_values!6204 thiss!1427)) e!583988))))

(declare-fun b!1033512 () Bool)

(assert (=> b!1033512 (= e!583992 tp_is_empty!24427)))

(declare-fun res!690461 () Bool)

(assert (=> start!90334 (=> (not res!690461) (not e!583989))))

(declare-fun valid!2130 (LongMapFixedSize!5614) Bool)

(assert (=> start!90334 (= res!690461 (valid!2130 thiss!1427))))

(assert (=> start!90334 e!583989))

(assert (=> start!90334 e!583991))

(assert (=> start!90334 true))

(declare-fun mapIsEmpty!38094 () Bool)

(assert (=> mapIsEmpty!38094 mapRes!38094))

(assert (= (and start!90334 res!690461) b!1033508))

(assert (= (and b!1033508 res!690460) b!1033509))

(assert (= (and b!1033507 condMapEmpty!38094) mapIsEmpty!38094))

(assert (= (and b!1033507 (not condMapEmpty!38094)) mapNonEmpty!38094))

(get-info :version)

(assert (= (and mapNonEmpty!38094 ((_ is ValueCellFull!11510) mapValue!38094)) b!1033510))

(assert (= (and b!1033507 ((_ is ValueCellFull!11510) mapDefault!38094)) b!1033512))

(assert (= b!1033511 b!1033507))

(assert (= start!90334 b!1033511))

(declare-fun m!954251 () Bool)

(assert (=> mapNonEmpty!38094 m!954251))

(declare-fun m!954253 () Bool)

(assert (=> b!1033509 m!954253))

(declare-fun m!954255 () Bool)

(assert (=> b!1033511 m!954255))

(declare-fun m!954257 () Bool)

(assert (=> b!1033511 m!954257))

(declare-fun m!954259 () Bool)

(assert (=> start!90334 m!954259))

(check-sat (not b!1033511) (not start!90334) (not mapNonEmpty!38094) tp_is_empty!24427 (not b_next!20707) b_and!33185 (not b!1033509))
(check-sat b_and!33185 (not b_next!20707))
