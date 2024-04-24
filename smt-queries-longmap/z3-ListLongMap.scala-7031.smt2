; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89432 () Bool)

(assert start!89432)

(declare-fun b!1024003 () Bool)

(declare-fun b_free!20239 () Bool)

(declare-fun b_next!20239 () Bool)

(assert (=> b!1024003 (= b_free!20239 (not b_next!20239))))

(declare-fun tp!71752 () Bool)

(declare-fun b_and!32471 () Bool)

(assert (=> b!1024003 (= tp!71752 b_and!32471)))

(declare-fun b!1023996 () Bool)

(declare-fun res!685523 () Bool)

(declare-fun e!577031 () Bool)

(assert (=> b!1023996 (=> (not res!685523) (not e!577031))))

(declare-datatypes ((V!36819 0))(
  ( (V!36820 (val!12030 Int)) )
))
(declare-datatypes ((ValueCell!11276 0))(
  ( (ValueCellFull!11276 (v!14595 V!36819)) (EmptyCell!11276) )
))
(declare-datatypes ((array!64011 0))(
  ( (array!64012 (arr!30811 (Array (_ BitVec 32) (_ BitVec 64))) (size!31323 (_ BitVec 32))) )
))
(declare-datatypes ((array!64013 0))(
  ( (array!64014 (arr!30812 (Array (_ BitVec 32) ValueCell!11276)) (size!31324 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5146 0))(
  ( (LongMapFixedSize!5147 (defaultEntry!5925 Int) (mask!29588 (_ BitVec 32)) (extraKeys!5657 (_ BitVec 32)) (zeroValue!5761 V!36819) (minValue!5761 V!36819) (_size!2628 (_ BitVec 32)) (_keys!11108 array!64011) (_values!5948 array!64013) (_vacant!2628 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5146)

(assert (=> b!1023996 (= res!685523 (and (= (size!31324 (_values!5948 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29588 thiss!1427))) (= (size!31323 (_keys!11108 thiss!1427)) (size!31324 (_values!5948 thiss!1427))) (bvsge (mask!29588 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5657 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5657 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023997 () Bool)

(declare-fun res!685521 () Bool)

(assert (=> b!1023997 (=> (not res!685521) (not e!577031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023997 (= res!685521 (validMask!0 (mask!29588 thiss!1427)))))

(declare-fun b!1023998 () Bool)

(declare-fun e!577032 () Bool)

(declare-fun e!577028 () Bool)

(declare-fun mapRes!37356 () Bool)

(assert (=> b!1023998 (= e!577032 (and e!577028 mapRes!37356))))

(declare-fun condMapEmpty!37356 () Bool)

(declare-fun mapDefault!37356 () ValueCell!11276)

(assert (=> b!1023998 (= condMapEmpty!37356 (= (arr!30812 (_values!5948 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11276)) mapDefault!37356)))))

(declare-fun mapNonEmpty!37356 () Bool)

(declare-fun tp!71751 () Bool)

(declare-fun e!577030 () Bool)

(assert (=> mapNonEmpty!37356 (= mapRes!37356 (and tp!71751 e!577030))))

(declare-fun mapKey!37356 () (_ BitVec 32))

(declare-fun mapRest!37356 () (Array (_ BitVec 32) ValueCell!11276))

(declare-fun mapValue!37356 () ValueCell!11276)

(assert (=> mapNonEmpty!37356 (= (arr!30812 (_values!5948 thiss!1427)) (store mapRest!37356 mapKey!37356 mapValue!37356))))

(declare-fun mapIsEmpty!37356 () Bool)

(assert (=> mapIsEmpty!37356 mapRes!37356))

(declare-fun b!1023999 () Bool)

(declare-fun res!685519 () Bool)

(assert (=> b!1023999 (=> (not res!685519) (not e!577031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64011 (_ BitVec 32)) Bool)

(assert (=> b!1023999 (= res!685519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11108 thiss!1427) (mask!29588 thiss!1427)))))

(declare-fun b!1024000 () Bool)

(declare-fun tp_is_empty!23959 () Bool)

(assert (=> b!1024000 (= e!577030 tp_is_empty!23959)))

(declare-fun res!685522 () Bool)

(assert (=> start!89432 (=> (not res!685522) (not e!577031))))

(declare-fun valid!1966 (LongMapFixedSize!5146) Bool)

(assert (=> start!89432 (= res!685522 (valid!1966 thiss!1427))))

(assert (=> start!89432 e!577031))

(declare-fun e!577027 () Bool)

(assert (=> start!89432 e!577027))

(assert (=> start!89432 true))

(declare-fun b!1024001 () Bool)

(declare-fun res!685520 () Bool)

(assert (=> b!1024001 (=> (not res!685520) (not e!577031))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024001 (= res!685520 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024002 () Bool)

(assert (=> b!1024002 (= e!577031 false)))

(declare-fun lt!450839 () Bool)

(declare-datatypes ((List!21678 0))(
  ( (Nil!21675) (Cons!21674 (h!22881 (_ BitVec 64)) (t!30708 List!21678)) )
))
(declare-fun arrayNoDuplicates!0 (array!64011 (_ BitVec 32) List!21678) Bool)

(assert (=> b!1024002 (= lt!450839 (arrayNoDuplicates!0 (_keys!11108 thiss!1427) #b00000000000000000000000000000000 Nil!21675))))

(declare-fun array_inv!23899 (array!64011) Bool)

(declare-fun array_inv!23900 (array!64013) Bool)

(assert (=> b!1024003 (= e!577027 (and tp!71752 tp_is_empty!23959 (array_inv!23899 (_keys!11108 thiss!1427)) (array_inv!23900 (_values!5948 thiss!1427)) e!577032))))

(declare-fun b!1024004 () Bool)

(assert (=> b!1024004 (= e!577028 tp_is_empty!23959)))

(assert (= (and start!89432 res!685522) b!1024001))

(assert (= (and b!1024001 res!685520) b!1023997))

(assert (= (and b!1023997 res!685521) b!1023996))

(assert (= (and b!1023996 res!685523) b!1023999))

(assert (= (and b!1023999 res!685519) b!1024002))

(assert (= (and b!1023998 condMapEmpty!37356) mapIsEmpty!37356))

(assert (= (and b!1023998 (not condMapEmpty!37356)) mapNonEmpty!37356))

(get-info :version)

(assert (= (and mapNonEmpty!37356 ((_ is ValueCellFull!11276) mapValue!37356)) b!1024000))

(assert (= (and b!1023998 ((_ is ValueCellFull!11276) mapDefault!37356)) b!1024004))

(assert (= b!1024003 b!1023998))

(assert (= start!89432 b!1024003))

(declare-fun m!943393 () Bool)

(assert (=> b!1024003 m!943393))

(declare-fun m!943395 () Bool)

(assert (=> b!1024003 m!943395))

(declare-fun m!943397 () Bool)

(assert (=> b!1024002 m!943397))

(declare-fun m!943399 () Bool)

(assert (=> b!1023997 m!943399))

(declare-fun m!943401 () Bool)

(assert (=> start!89432 m!943401))

(declare-fun m!943403 () Bool)

(assert (=> mapNonEmpty!37356 m!943403))

(declare-fun m!943405 () Bool)

(assert (=> b!1023999 m!943405))

(check-sat (not b!1023999) (not start!89432) (not b!1023997) (not b!1024003) tp_is_empty!23959 (not b!1024002) b_and!32471 (not mapNonEmpty!37356) (not b_next!20239))
(check-sat b_and!32471 (not b_next!20239))
