; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90182 () Bool)

(assert start!90182)

(declare-fun b!1032598 () Bool)

(declare-fun b_free!20743 () Bool)

(declare-fun b_next!20743 () Bool)

(assert (=> b!1032598 (= b_free!20743 (not b_next!20743))))

(declare-fun tp!73311 () Bool)

(declare-fun b_and!33185 () Bool)

(assert (=> b!1032598 (= tp!73311 b_and!33185)))

(declare-fun b!1032595 () Bool)

(declare-fun e!583504 () Bool)

(declare-datatypes ((V!37491 0))(
  ( (V!37492 (val!12282 Int)) )
))
(declare-datatypes ((ValueCell!11528 0))(
  ( (ValueCellFull!11528 (v!14858 V!37491)) (EmptyCell!11528) )
))
(declare-datatypes ((array!64935 0))(
  ( (array!64936 (arr!31266 (Array (_ BitVec 32) (_ BitVec 64))) (size!31788 (_ BitVec 32))) )
))
(declare-datatypes ((array!64937 0))(
  ( (array!64938 (arr!31267 (Array (_ BitVec 32) ValueCell!11528)) (size!31789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5650 0))(
  ( (LongMapFixedSize!5651 (defaultEntry!6199 Int) (mask!30024 (_ BitVec 32)) (extraKeys!5931 (_ BitVec 32)) (zeroValue!6035 V!37491) (minValue!6035 V!37491) (_size!2880 (_ BitVec 32)) (_keys!11371 array!64935) (_values!6222 array!64937) (_vacant!2880 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5650)

(assert (=> b!1032595 (= e!583504 (and (= (size!31789 (_values!6222 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30024 thiss!1427))) (= (size!31788 (_keys!11371 thiss!1427)) (size!31789 (_values!6222 thiss!1427))) (bvslt (mask!30024 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032596 () Bool)

(declare-fun res!690120 () Bool)

(assert (=> b!1032596 (=> (not res!690120) (not e!583504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032596 (= res!690120 (validMask!0 (mask!30024 thiss!1427)))))

(declare-fun b!1032597 () Bool)

(declare-fun e!583502 () Bool)

(declare-fun tp_is_empty!24463 () Bool)

(assert (=> b!1032597 (= e!583502 tp_is_empty!24463)))

(declare-fun e!583501 () Bool)

(declare-fun e!583503 () Bool)

(declare-fun array_inv!24191 (array!64935) Bool)

(declare-fun array_inv!24192 (array!64937) Bool)

(assert (=> b!1032598 (= e!583503 (and tp!73311 tp_is_empty!24463 (array_inv!24191 (_keys!11371 thiss!1427)) (array_inv!24192 (_values!6222 thiss!1427)) e!583501))))

(declare-fun res!690119 () Bool)

(assert (=> start!90182 (=> (not res!690119) (not e!583504))))

(declare-fun valid!2126 (LongMapFixedSize!5650) Bool)

(assert (=> start!90182 (= res!690119 (valid!2126 thiss!1427))))

(assert (=> start!90182 e!583504))

(assert (=> start!90182 e!583503))

(assert (=> start!90182 true))

(declare-fun b!1032599 () Bool)

(declare-fun e!583505 () Bool)

(declare-fun mapRes!38160 () Bool)

(assert (=> b!1032599 (= e!583501 (and e!583505 mapRes!38160))))

(declare-fun condMapEmpty!38160 () Bool)

(declare-fun mapDefault!38160 () ValueCell!11528)

(assert (=> b!1032599 (= condMapEmpty!38160 (= (arr!31267 (_values!6222 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11528)) mapDefault!38160)))))

(declare-fun mapIsEmpty!38160 () Bool)

(assert (=> mapIsEmpty!38160 mapRes!38160))

(declare-fun b!1032600 () Bool)

(declare-fun res!690121 () Bool)

(assert (=> b!1032600 (=> (not res!690121) (not e!583504))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032600 (= res!690121 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38160 () Bool)

(declare-fun tp!73312 () Bool)

(assert (=> mapNonEmpty!38160 (= mapRes!38160 (and tp!73312 e!583502))))

(declare-fun mapValue!38160 () ValueCell!11528)

(declare-fun mapKey!38160 () (_ BitVec 32))

(declare-fun mapRest!38160 () (Array (_ BitVec 32) ValueCell!11528))

(assert (=> mapNonEmpty!38160 (= (arr!31267 (_values!6222 thiss!1427)) (store mapRest!38160 mapKey!38160 mapValue!38160))))

(declare-fun b!1032601 () Bool)

(assert (=> b!1032601 (= e!583505 tp_is_empty!24463)))

(assert (= (and start!90182 res!690119) b!1032600))

(assert (= (and b!1032600 res!690121) b!1032596))

(assert (= (and b!1032596 res!690120) b!1032595))

(assert (= (and b!1032599 condMapEmpty!38160) mapIsEmpty!38160))

(assert (= (and b!1032599 (not condMapEmpty!38160)) mapNonEmpty!38160))

(get-info :version)

(assert (= (and mapNonEmpty!38160 ((_ is ValueCellFull!11528) mapValue!38160)) b!1032597))

(assert (= (and b!1032599 ((_ is ValueCellFull!11528) mapDefault!38160)) b!1032601))

(assert (= b!1032598 b!1032599))

(assert (= start!90182 b!1032598))

(declare-fun m!952243 () Bool)

(assert (=> b!1032596 m!952243))

(declare-fun m!952245 () Bool)

(assert (=> b!1032598 m!952245))

(declare-fun m!952247 () Bool)

(assert (=> b!1032598 m!952247))

(declare-fun m!952249 () Bool)

(assert (=> start!90182 m!952249))

(declare-fun m!952251 () Bool)

(assert (=> mapNonEmpty!38160 m!952251))

(check-sat b_and!33185 (not start!90182) (not b!1032596) (not b!1032598) tp_is_empty!24463 (not b_next!20743) (not mapNonEmpty!38160))
(check-sat b_and!33185 (not b_next!20743))
(get-model)

(declare-fun d!123575 () Bool)

(assert (=> d!123575 (= (validMask!0 (mask!30024 thiss!1427)) (and (or (= (mask!30024 thiss!1427) #b00000000000000000000000000000111) (= (mask!30024 thiss!1427) #b00000000000000000000000000001111) (= (mask!30024 thiss!1427) #b00000000000000000000000000011111) (= (mask!30024 thiss!1427) #b00000000000000000000000000111111) (= (mask!30024 thiss!1427) #b00000000000000000000000001111111) (= (mask!30024 thiss!1427) #b00000000000000000000000011111111) (= (mask!30024 thiss!1427) #b00000000000000000000000111111111) (= (mask!30024 thiss!1427) #b00000000000000000000001111111111) (= (mask!30024 thiss!1427) #b00000000000000000000011111111111) (= (mask!30024 thiss!1427) #b00000000000000000000111111111111) (= (mask!30024 thiss!1427) #b00000000000000000001111111111111) (= (mask!30024 thiss!1427) #b00000000000000000011111111111111) (= (mask!30024 thiss!1427) #b00000000000000000111111111111111) (= (mask!30024 thiss!1427) #b00000000000000001111111111111111) (= (mask!30024 thiss!1427) #b00000000000000011111111111111111) (= (mask!30024 thiss!1427) #b00000000000000111111111111111111) (= (mask!30024 thiss!1427) #b00000000000001111111111111111111) (= (mask!30024 thiss!1427) #b00000000000011111111111111111111) (= (mask!30024 thiss!1427) #b00000000000111111111111111111111) (= (mask!30024 thiss!1427) #b00000000001111111111111111111111) (= (mask!30024 thiss!1427) #b00000000011111111111111111111111) (= (mask!30024 thiss!1427) #b00000000111111111111111111111111) (= (mask!30024 thiss!1427) #b00000001111111111111111111111111) (= (mask!30024 thiss!1427) #b00000011111111111111111111111111) (= (mask!30024 thiss!1427) #b00000111111111111111111111111111) (= (mask!30024 thiss!1427) #b00001111111111111111111111111111) (= (mask!30024 thiss!1427) #b00011111111111111111111111111111) (= (mask!30024 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30024 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032596 d!123575))

(declare-fun d!123577 () Bool)

(declare-fun res!690146 () Bool)

(declare-fun e!583544 () Bool)

(assert (=> d!123577 (=> (not res!690146) (not e!583544))))

(declare-fun simpleValid!400 (LongMapFixedSize!5650) Bool)

(assert (=> d!123577 (= res!690146 (simpleValid!400 thiss!1427))))

(assert (=> d!123577 (= (valid!2126 thiss!1427) e!583544)))

(declare-fun b!1032650 () Bool)

(declare-fun res!690147 () Bool)

(assert (=> b!1032650 (=> (not res!690147) (not e!583544))))

(declare-fun arrayCountValidKeys!0 (array!64935 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032650 (= res!690147 (= (arrayCountValidKeys!0 (_keys!11371 thiss!1427) #b00000000000000000000000000000000 (size!31788 (_keys!11371 thiss!1427))) (_size!2880 thiss!1427)))))

(declare-fun b!1032651 () Bool)

(declare-fun res!690148 () Bool)

(assert (=> b!1032651 (=> (not res!690148) (not e!583544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64935 (_ BitVec 32)) Bool)

(assert (=> b!1032651 (= res!690148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11371 thiss!1427) (mask!30024 thiss!1427)))))

(declare-fun b!1032652 () Bool)

(declare-datatypes ((List!21934 0))(
  ( (Nil!21931) (Cons!21930 (h!23132 (_ BitVec 64)) (t!31119 List!21934)) )
))
(declare-fun arrayNoDuplicates!0 (array!64935 (_ BitVec 32) List!21934) Bool)

(assert (=> b!1032652 (= e!583544 (arrayNoDuplicates!0 (_keys!11371 thiss!1427) #b00000000000000000000000000000000 Nil!21931))))

(assert (= (and d!123577 res!690146) b!1032650))

(assert (= (and b!1032650 res!690147) b!1032651))

(assert (= (and b!1032651 res!690148) b!1032652))

(declare-fun m!952273 () Bool)

(assert (=> d!123577 m!952273))

(declare-fun m!952275 () Bool)

(assert (=> b!1032650 m!952275))

(declare-fun m!952277 () Bool)

(assert (=> b!1032651 m!952277))

(declare-fun m!952279 () Bool)

(assert (=> b!1032652 m!952279))

(assert (=> start!90182 d!123577))

(declare-fun d!123579 () Bool)

(assert (=> d!123579 (= (array_inv!24191 (_keys!11371 thiss!1427)) (bvsge (size!31788 (_keys!11371 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032598 d!123579))

(declare-fun d!123581 () Bool)

(assert (=> d!123581 (= (array_inv!24192 (_values!6222 thiss!1427)) (bvsge (size!31789 (_values!6222 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032598 d!123581))

(declare-fun b!1032659 () Bool)

(declare-fun e!583549 () Bool)

(assert (=> b!1032659 (= e!583549 tp_is_empty!24463)))

(declare-fun mapNonEmpty!38169 () Bool)

(declare-fun mapRes!38169 () Bool)

(declare-fun tp!73327 () Bool)

(assert (=> mapNonEmpty!38169 (= mapRes!38169 (and tp!73327 e!583549))))

(declare-fun mapKey!38169 () (_ BitVec 32))

(declare-fun mapRest!38169 () (Array (_ BitVec 32) ValueCell!11528))

(declare-fun mapValue!38169 () ValueCell!11528)

(assert (=> mapNonEmpty!38169 (= mapRest!38160 (store mapRest!38169 mapKey!38169 mapValue!38169))))

(declare-fun b!1032660 () Bool)

(declare-fun e!583550 () Bool)

(assert (=> b!1032660 (= e!583550 tp_is_empty!24463)))

(declare-fun mapIsEmpty!38169 () Bool)

(assert (=> mapIsEmpty!38169 mapRes!38169))

(declare-fun condMapEmpty!38169 () Bool)

(declare-fun mapDefault!38169 () ValueCell!11528)

(assert (=> mapNonEmpty!38160 (= condMapEmpty!38169 (= mapRest!38160 ((as const (Array (_ BitVec 32) ValueCell!11528)) mapDefault!38169)))))

(assert (=> mapNonEmpty!38160 (= tp!73312 (and e!583550 mapRes!38169))))

(assert (= (and mapNonEmpty!38160 condMapEmpty!38169) mapIsEmpty!38169))

(assert (= (and mapNonEmpty!38160 (not condMapEmpty!38169)) mapNonEmpty!38169))

(assert (= (and mapNonEmpty!38169 ((_ is ValueCellFull!11528) mapValue!38169)) b!1032659))

(assert (= (and mapNonEmpty!38160 ((_ is ValueCellFull!11528) mapDefault!38169)) b!1032660))

(declare-fun m!952281 () Bool)

(assert (=> mapNonEmpty!38169 m!952281))

(check-sat b_and!33185 (not b!1032652) (not d!123577) (not mapNonEmpty!38169) (not b!1032650) (not b_next!20743) (not b!1032651) tp_is_empty!24463)
(check-sat b_and!33185 (not b_next!20743))
